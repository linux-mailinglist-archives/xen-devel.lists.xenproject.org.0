Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9B2C0A94
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:50:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34381.65386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCEE-0002r0-LU; Mon, 23 Nov 2020 13:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34381.65386; Mon, 23 Nov 2020 13:50:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCEE-0002oz-H2; Mon, 23 Nov 2020 13:50:02 +0000
Received: by outflank-mailman (input) for mailman id 34381;
 Mon, 23 Nov 2020 13:50:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCEC-0002gu-W5
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:50:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c950dab6-87f7-4743-9a93-f12026a5e057;
 Mon, 23 Nov 2020 13:50:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91D0CAC0C;
 Mon, 23 Nov 2020 13:49:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCEC-0002gu-W5
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:50:01 +0000
X-Inumbo-ID: c950dab6-87f7-4743-9a93-f12026a5e057
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c950dab6-87f7-4743-9a93-f12026a5e057;
	Mon, 23 Nov 2020 13:50:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606139399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2MYR1tCC68AyvWxk3zsBK94D4ktPHWPLPWkA84rnIpc=;
	b=SzOSC2Zx2T80Yye7d/v+73IUNfdgr1+F0HyTNd7/BGDuV69JGDLQwfrbh0WS9ST9/Mr8Xy
	ywQb5f8WXrdYh1M9W5ULLn9gM/0WUtPr1+5/XVD84PUE0DRiIHDVb/QdZuzrMuXu75k6sA
	O3Qh4VF4e2DwTjVISmyTIeyP+k0fmbw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 91D0CAC0C;
	Mon, 23 Nov 2020 13:49:59 +0000 (UTC)
Subject: Ping: [PATCH 0/5] x86/PV: memory management consistency and minor
 relaxations
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Message-ID: <5534e9bc-7c89-53ba-1459-4064c209584d@suse.com>
Date: Mon, 23 Nov 2020 14:49:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.11.2020 11:54, Jan Beulich wrote:
> Especially the latter three patches provide only small possible
> gains, from all I can tell. I nevertheless wanted to put up the
> entire set for consideration.
> 
> 1: consistently inline {,un}adjust_guest_l<N>e()
> 2: fold redundant calls to adjust_guest_l<N>e()
> 3: _PAGE_RW changes may take fast path of mod_l[234]_entry()
> 4: restrict TLB flushing after mod_l[234]_entry()
> 5: avoid TLB flushing after mod_l3_entry()

Ping?

Jan

