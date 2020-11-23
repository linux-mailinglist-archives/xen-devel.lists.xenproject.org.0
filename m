Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40E22C0A91
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34371.65374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCCK-0002WW-7Y; Mon, 23 Nov 2020 13:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34371.65374; Mon, 23 Nov 2020 13:48:04 +0000
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
	id 1khCCK-0002W5-4C; Mon, 23 Nov 2020 13:48:04 +0000
Received: by outflank-mailman (input) for mailman id 34371;
 Mon, 23 Nov 2020 13:48:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCCI-0002Vu-F2
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:48:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39254c2f-0256-4c53-b71f-b28ad8bb66dc;
 Mon, 23 Nov 2020 13:48:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51A11AD79;
 Mon, 23 Nov 2020 13:48:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCCI-0002Vu-F2
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:48:02 +0000
X-Inumbo-ID: 39254c2f-0256-4c53-b71f-b28ad8bb66dc
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 39254c2f-0256-4c53-b71f-b28ad8bb66dc;
	Mon, 23 Nov 2020 13:48:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606139280; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=40ADJm/3sEW4KdQfL076qWzLzocoau+nfpYBAnALOL0=;
	b=XDd/dtaU4OEOFneSCQMl61KYdeQVoQbQMIZra9YhPk/V83lF8H+oGIlOsOZrpbMSHu4fjp
	Ckq+joqIkCQtBwJDcJ2gdtpRybKJf06E0hTTvoJLGDmwa7l92bsKtfp1aTH77cSSda+E++
	61djAcW/TKSbXut/eKEOLoDqsCVoBys=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 51A11AD79;
	Mon, 23 Nov 2020 13:48:00 +0000 (UTC)
Subject: [really v4] Re: [PATCH v3 0/7] x86: some assembler macro rework
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8e7d1472-dd37-8ed3-ec2f-ce954ea61dfd@suse.com>
Message-ID: <08b82025-a2ce-1e72-5301-4ceadeaba873@suse.com>
Date: Mon, 23 Nov 2020 14:47:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8e7d1472-dd37-8ed3-ec2f-ce954ea61dfd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.11.2020 14:42, Jan Beulich wrote:
> 1: replace __ASM_{CL,ST}AC
> 2: drop ASM_{CL,ST}AC
> 3: fold indirect_thunk_asm.h into asm-defns.h
> 4: guard against straight-line speculation past RET
> 5: limit amount of INT3 in IND_THUNK_*
> 6: make guarding against straight-line speculation optional
> 7: reduce CET-SS related #ifdef-ary

I'm sorry, I've realized only after sending that this really is v4
of the series. I don't think though it's worth re-sending.

Jan

