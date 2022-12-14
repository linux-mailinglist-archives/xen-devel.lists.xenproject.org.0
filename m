Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C766664CCD0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 16:03:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462340.720513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5TI2-0000DF-94; Wed, 14 Dec 2022 15:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462340.720513; Wed, 14 Dec 2022 15:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5TI2-00009Q-5s; Wed, 14 Dec 2022 15:03:22 +0000
Received: by outflank-mailman (input) for mailman id 462340;
 Wed, 14 Dec 2022 15:03:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/MR=4M=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1p5TI0-00009K-84
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 15:03:20 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 707faa9c-7bc0-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 16:03:18 +0100 (CET)
Received: from [10.10.1.154] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1671030190854446.2302863694556;
 Wed, 14 Dec 2022 07:03:10 -0800 (PST)
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
X-Inumbo-ID: 707faa9c-7bc0-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; t=1671030193; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=To0eg3nOPOFaIqo/Uz9qgpCBZSq/VldJXqLvC2NaHm8juC/p5yq9ESjf6FzPxoIJ8kKmcr3EKR+hbHvvXn5xQBpkSx/vIdiPmao2d+22VWKzib7R089jJmnuvmnhth0OIAaloLZ0KVcMi/oHMtvlEOsfbDLYhcwhdE3q2i+Cf04=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1671030193; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ziw5uJWrPocAPMdIHontHrRbLbVHDc1OW1HD88yaKng=; 
	b=VorjYlI1I+t+It6ypHLd30oALy1Hb36TCL2JDo6eung5SBUlJlaQgFpDmLOCDQjmfohBAAIPNmx57V94rS9u0JW5xNT782zdWLz7IvEQhA/RkjPfS74FQ6Y4x4LdWMHQSxxejadBkuh4JPRHPaFaLbfR4lrVogYLLDvfrDIG+GU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671030193;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ziw5uJWrPocAPMdIHontHrRbLbVHDc1OW1HD88yaKng=;
	b=pH20jn6yI01eJxQBlN79kRSMM+PDdNQz6u/Bpr1ZDE1gxDcOc3085nKUeVFK8hh9
	MnwT8Nr9oC9KsKyNTXWr87AUaqZtGxxvLaZhvHP6m/hs0KnEHeoFxw/WVhQLKfOT0RO
	lHau+o/mxpvbaCRTHMqYallLOiTXwrzFh2yDy25w=
Message-ID: <933c9378-8f0d-41e6-ec9a-3a702ef13f24@apertussolutions.com>
Date: Wed, 14 Dec 2022 10:03:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 0/3] xen/spinlock: make recursive spinlocks a
 dedicated type
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=c3=b3wka?=
 <mateusz.mowka@intel.com>, Paul Durrant <paul@xen.org>
References: <20220910154959.15971-1-jgross@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220910154959.15971-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 9/10/22 11:49, Juergen Gross wrote:
> Instead of being able to use normal spinlocks as recursive ones, too,
> make recursive spinlocks a special lock type.
> 
> This will make the spinlock structure smaller in production builds and
> add type-safety.

Just a little yak shaving, IMHO a spinlock is normally not expected to 
be recursive. Thus explicitly naming a spinlock as non-recursive I find 
to be redundant along with being expensive for typing. Whereas a 
recursive spinlock is the special instance and should have a declarative 
distinction. Only codifying the recursive type would significantly cut 
down on the size of the series and still provide equal type and visual 
clarification.

v/r,
dps

