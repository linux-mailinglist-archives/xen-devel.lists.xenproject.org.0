Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2706936F795
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 11:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120408.227702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcP8o-00058b-Ni; Fri, 30 Apr 2021 09:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120408.227702; Fri, 30 Apr 2021 09:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcP8o-00058F-Ki; Fri, 30 Apr 2021 09:08:54 +0000
Received: by outflank-mailman (input) for mailman id 120408;
 Fri, 30 Apr 2021 09:08:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T1Xz=J3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lcP8m-000586-Eh
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 09:08:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82284e7c-8c56-4118-a3f3-126845b824f2;
 Fri, 30 Apr 2021 09:08:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E811AF52;
 Fri, 30 Apr 2021 09:08:50 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 82284e7c-8c56-4118-a3f3-126845b824f2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619773730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiE8L/EOFiLAIV4Uz0Wv/e2I783uNQglyD008AqBQbE=;
	b=r8cy38pKvqgre/GXdrSpXYGtVYNm65CvgjeVRedEDqrK7DKBk2rl7LEFHTGKKOydyZGF3p
	BNNIP7G2w0P0yVTYgGSvXlGb6nW0PwZXJLuI++Gzzo0Wb93uiDYWrhRRV4imZrGNl+h0dq
	XSDE9ADgtCv0wuy9QnVicqit4WMMrBs=
Subject: Re: [PATCH] x86: Always have CR4.PKE set in HVM context
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210429221223.28348-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4781e8f1-d70b-2736-364c-eeed61869031@suse.com>
Date: Fri, 30 Apr 2021 11:08:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429221223.28348-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.04.2021 00:12, Andrew Cooper wrote:
> The sole user of read_pkru() is the emulated pagewalk, and guarded behind
> guest_pku_enabled() which restricts the path to HVM (hap, even) context only.
> 
> The commentary in read_pkru() concerning _PAGE_GNTTAB overlapping with
> _PAGE_PKEY_BITS is only applicable to PV guests.
> 
> The context switch path, via write_ptbase() unconditionally writes CR4 on any
> context switch.
> 
> Therefore, we can guarantee to separate CR4.PKE between PV and HVM context at
> no extra cost.  Set PKE in mmu_cr4_features on boot, so it becomes set in HVM
> context, and clear it in pv_make_cr4().
> 
> Rename read_pkru() to rdpkru() now that it is a simple wrapper around the
> instruction.  This saves two CR4 writes on every pagewalk, which typically
> occur more than one per emulation.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

The changes looks perfectly fine to me, but I still feel urged to make
Reviewed-by: Jan Beulich <jbeulich@suse.com>
conditional upon my "x86emul: support RDPKRU/WRPKRU" (submitted exactly
half a year ago) going in first, unless there were to be review comments
making extensive rework necessary. In the absence of such review
feedback, I consider it pretty inappropriate for me to do rebasing work
(no matter that this would be largely mechanical afaics) here for a
patch which has been pending and effectively ignored for so long. (The
main thing that immediately struck me as odd was "The sole user of
read_pkru() is ...".)

I'm sorry, Jan

