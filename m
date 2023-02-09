Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BB3690BA2
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 15:24:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492509.762074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7pj-0000ZK-7o; Thu, 09 Feb 2023 14:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492509.762074; Thu, 09 Feb 2023 14:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7pj-0000Wo-4a; Thu, 09 Feb 2023 14:23:31 +0000
Received: by outflank-mailman (input) for mailman id 492509;
 Thu, 09 Feb 2023 14:23:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dIEE=6F=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1pQ7pg-0000Wg-VG
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 14:23:29 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 500993f0-a885-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 15:23:26 +0100 (CET)
Received: from [192.168.76.135] (c-73-221-192-123.hsd1.wa.comcast.net
 [73.221.192.123]) by mx.zohomail.com
 with SMTPS id 1675952597302467.34783408887415;
 Thu, 9 Feb 2023 06:23:17 -0800 (PST)
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
X-Inumbo-ID: 500993f0-a885-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; t=1675952601; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b8NPf8768ZiwPMXtR7cM+wQKzDM9DBoqus8bta44MSQNZ6bGIdpQOmYazuyD99iMcsNfI+peOKpASWqpXpKcm7YNxkcIyVVESN0IXBj2Ke37+OC5nZbGdwCPiT1oLGKwndD0rLPWWHww/fxNVQ/oS4vQixcCmNDwNIspZpC/NVU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675952601; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=hdeCoY/YoXDXf/A4m7BydX1bIlOrLfHRzkWbqt74sEE=; 
	b=jMFJQLkZNlOu/wuLuWDlg42/CpSKTDdaTegHmIGhx95tUi6wJf4BSyfu95bkSaa9A3xE9uzFccugIhjuBFtlFj+QIoYQo2N3OLt8LyNbE4dgvZGS2dGKndATLZcCSijLp0qsmavLB8cru18Oii+lnJuBOI1IhDBqbO9oW54lb8g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675952601;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hdeCoY/YoXDXf/A4m7BydX1bIlOrLfHRzkWbqt74sEE=;
	b=YOk0GBorXrcg6/LdVuZ7WD2taRJRCrBxkS/HX02a15E3lRxQRw//t6d+DdaBkl3y
	cl1xuXnhwjhPBEedrB054lAxGf2pVKlxSeHHXwIKiAafVwa5BZ2iQt9k5KBIFf15M3T
	qs2qLV4ip5K6HBgRIjERa1wROap+1pq8fUPT12ig=
Message-ID: <a5dfd4f1-b017-325c-d1e6-2530a48e9880@apertussolutions.com>
Date: Thu, 9 Feb 2023 09:23:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/6] common: move standard C fixed width type declarations
 to common header
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Paul Durrant <paul@xen.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
 <862a1076-4be6-79ac-4243-7d690a2f88ca@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <862a1076-4be6-79ac-4243-7d690a2f88ca@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/9/23 05:38, Jan Beulich wrote:
> Have these in one place, for all architectures to use. Also use the C99
> types as the "original" ones, and derive the Linux compatible ones
> (which we're trying to phase out). For __s<N>, seeing that no uses exist
> anymore, move them to a new Linux compatibility header (as an act of
> precaution - we don't have any uses of these types right now).
> 
> Modern compilers supply __{,U}INT<n>_TYPE__ - use those if available.
> Otherwise fall back to using "mode" attributes, but this can be relied
> upon only when bytes are 8 bits wide. Should there ever be a port to an
> architecture not matching this, it would need to define the fixed width
> types locally by some other means.
> 
> In a few cases inclusion of asm/types.h needs replacing by xen/types.h.
> Further in common/trace.c take the opportunity and also drop the
> apparently unused inclusion of asm/io.h at the same time. Finally in
> some Flask sources inclusion of asm/byteorder.h needs moving later.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: I know Andrew would prefer these types to move to a new
>       xen/stdint.h, but not being fully convinced of this myself, I was
>       hoping for others to voice views.
> 

IHHO since there is already stdarg.h and stdbool.h, which establishes 
some degree of following C standard library includes, it would seem more 
logical to move to stdint.h. The main point here is not whether 
following the C standard library includes is the right approach, but 
that consistency is more important. Having a mixture of types.h and C 
standard library includes leaves one having to keep track of which C 
standard library includes are present versus what is in type.h.

