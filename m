Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C75A2B1956
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 11:47:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26310.54591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWcT-000436-2B; Fri, 13 Nov 2020 10:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26310.54591; Fri, 13 Nov 2020 10:47:53 +0000
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
	id 1kdWcS-00042j-VP; Fri, 13 Nov 2020 10:47:52 +0000
Received: by outflank-mailman (input) for mailman id 26310;
 Fri, 13 Nov 2020 10:47:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdWcQ-00042S-UL
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:47:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bb8428c-ad8f-4234-87ff-98f54f036ff2;
 Fri, 13 Nov 2020 10:47:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE881AED6;
 Fri, 13 Nov 2020 10:47:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdWcQ-00042S-UL
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:47:50 +0000
X-Inumbo-ID: 7bb8428c-ad8f-4234-87ff-98f54f036ff2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7bb8428c-ad8f-4234-87ff-98f54f036ff2;
	Fri, 13 Nov 2020 10:47:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605264468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NxNY7is0eX0w859VRwxbHMJiokokTDN3mH+bsPMPMiU=;
	b=NmCPhe0hEk45rpA08e2loHxpRvIweNF0J+Xvmc+Os4AYLoOoHBniPhyfUyLET3T0Uixj2Y
	GPTnYUPif2QkQdFcdpnauGW5OUvyAIC57l2wLz2wyBkZ5O4eiJY7gjKM5Ok05TAwCoK9ik
	+knbcTqcuOdMrdrsXatOlArNZpUNFxA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CE881AED6;
	Fri, 13 Nov 2020 10:47:48 +0000 (UTC)
Subject: Re: [PATCH 08/10] vpci/arm: Allow updating BAR's header for non-ECAM
 bridges
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-9-andr2000@gmail.com>
 <ae66dddb-98e3-61fd-86c3-eab30ec33d18@suse.com>
 <1f0a3eb7-be20-95a0-0c1e-c7d45e3279f8@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <34e81e3e-7d65-432a-95a6-c8ef437b23dc@suse.com>
Date: Fri, 13 Nov 2020 11:47:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1f0a3eb7-be20-95a0-0c1e-c7d45e3279f8@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.11.2020 11:39, Oleksandr Andrushchenko wrote:
> 
> On 11/13/20 12:29 PM, Jan Beulich wrote:
>> On 09.11.2020 13:50, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Non-ECAM host bridges in hwdom go directly to PCI config space,
>>> not through vpci (they use their specific method for accessing PCI
>>> configuration, e.g. dedicated registers etc.).
>> And access to these dedicated registers can't be intercepted?
> 
> It can. But then you have to fully emulate that bridge, e.g.
> 
> "if we write A to regB and after that write C to regZ then it
> 
> means we are accessing config space. If we write...."

Sounds pretty much like the I/O port based access mechanism on
x86, which also has some sort of "enable". Of course, I/O port
accesses are particularly easy to intercept and handle...

> I mean this would need lots of code in Xen to achieve that

Possibly, but look at the amount of code we have in Xen on the
x86 side to handle MCFG writes by Dom0.

Jan

