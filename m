Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A14D2FBCDC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 17:49:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70883.127000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1uBV-0002K9-TU; Tue, 19 Jan 2021 16:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70883.127000; Tue, 19 Jan 2021 16:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1uBV-0002Jk-Q1; Tue, 19 Jan 2021 16:48:49 +0000
Received: by outflank-mailman (input) for mailman id 70883;
 Tue, 19 Jan 2021 16:48:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1uBU-0002Jf-Br
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 16:48:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ee2f2d0-2040-4ba4-8ba7-746b4c6bab5c;
 Tue, 19 Jan 2021 16:48:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8096CACC6;
 Tue, 19 Jan 2021 16:48:41 +0000 (UTC)
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
X-Inumbo-ID: 9ee2f2d0-2040-4ba4-8ba7-746b4c6bab5c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611074921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCFI0f0hkDq5b0dTfUaYxaoL5uqJyPKGHv8lKX7i/Bo=;
	b=O9pnUOFTycp3el7og17WDuXjlVCazoHmPblgzSFTA5tb1m75LnINdQFBFWZIY3uvtB27/I
	bm6sK67eZzMs3e0o+hjamqjMgQRvQG3P7ItoPD2CKX5SH9z4vdkvI0SQJN34APlnc3+LnR
	W87Esp9cwFMaR1YF4fyBKL2HdJVwYZc=
Subject: Re: [PATCH v3] x86/mm: Short circuit damage from "fishy"
 ref/typecount failure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210119094122.23713-1-andrew.cooper3@citrix.com>
 <20210119130254.27058-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <98f64276-ec5d-7242-f10f-126fe7ee1f7e@suse.com>
Date: Tue, 19 Jan 2021 17:48:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210119130254.27058-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.01.2021 14:02, Andrew Cooper wrote:
> This code has been copied in 3 places, but it is problematic.
> 
> All cases will hit a BUG() later in domain teardown, when a the missing
> type/count reference is underflowed.

I'm afraid I could use some help with this: Why would there
be a missing reference, when the getting of one failed? IOW
I'm not (yet) convinced you don't make the impact more
severe in the (supposedly) impossible case of these paths
getting hit, by converting a domain crash into a host one.
It is in particular relevant that a PV guest may be able to
cheat and "guess" an MFN to obtain references for before a
certain hypercall (or other operation) actually completed.

> v2:
>  * Reword the commit message.
>  * Switch BUG() to BUG_ON() to further reduce code volume.

Short of us explicitly agreeing that such is fine to use, I
think we ought to stick to the previously (long ago) agreed
rule that BUG_ON() controlling expressions should not have
side effects, for us not wanting to guarantee it will now
and forever _not_ behave like ASSERT() wrt to evaluating
the expression.

Jan

