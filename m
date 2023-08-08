Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235B1774C54
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 23:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580457.908671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTTtS-0002hg-Gs; Tue, 08 Aug 2023 21:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580457.908671; Tue, 08 Aug 2023 21:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTTtS-0002fQ-E2; Tue, 08 Aug 2023 21:05:30 +0000
Received: by outflank-mailman (input) for mailman id 580457;
 Tue, 08 Aug 2023 21:05:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTTtR-0002fI-5A
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 21:05:29 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bca816e-362f-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 23:05:27 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691528722397254.1191249886159;
 Tue, 8 Aug 2023 14:05:22 -0700 (PDT)
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
X-Inumbo-ID: 4bca816e-362f-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691528723; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X79NqvruxQcjF7y4zKUaPB18AMYaNHef6SWu2Uog+5qshRzGAlC4OS/VrpwDX8FP1oMgMJgUwuX26LkIexnrEi7Cq9O18VR6UIRzXAdU1o/c65Knz8Rjpsjjw+J0QMhKpjNL+z35H3jEVNLD7MVcpyYwqZpyGdQiQEqa1JzyIaQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691528723; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=+KTa3ESM4PEr3LYAF4nERwcd7tDhYndVrIOZUj8bCJE=; 
	b=JG29pazNLMBhn2hVCC9SWnTS73YCtvl5ZS+dC0IQEf24Z9StUvlTbFYoFNx2YCJwcjF95nOI/aoDHTraShXNGQ79wp1ayGdP4PNkspIh0ddMnltLxA6cpeaG+TasBQDJQVtUEm4xIiZw8PZaNH+Dh3lQXqweAlp2MeZ8MjNZhOs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691528723;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+KTa3ESM4PEr3LYAF4nERwcd7tDhYndVrIOZUj8bCJE=;
	b=Ry4cwZaShiZKTU/eskUcbtNSDlw/+Ba1g9ewsYuT4yz9NGxL1FiLLBupbvZr+1WP
	cvORJ3XJOHUIj1FrpjKSBG5wBR+/LX2Q8SpNfKnTnCE5tna5ozWWO13295IYaaTHr+t
	DY6VbrMF/E4tOuKuFQYQa5qDgv4co1dDCZc6jBk8=
Message-ID: <90656f0f-0597-31ed-190e-d697e081d4b5@apertussolutions.com>
Date: Tue, 8 Aug 2023 17:05:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-3-dpsmith@apertussolutions.com>
 <AS8PR08MB79912C0FD1E3B1AA5988175B9209A@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <AS8PR08MB79912C0FD1E3B1AA5988175B9209A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



On 8/4/23 00:10, Henry Wang wrote:
> Hi Daniel,

Hey Henry!

>> -----Original Message-----
>> Subject: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
>>
>> This refactors reusable code from Arm's bootfdt.c and device-tree.h that is
>> general fdt handling code.  The Kconfig parameter CORE_DEVICE_TREE is
>> introduced for when the ability of parsing DTB files is needed by a capability
>> such as hyperlaunch.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> As said yesterday, I tested this patch and can confirm this patch will not
> break any of the boards we used for our testing. So
> 
> Tested-by: Henry Wang <Henry.Wang@arm.com>

Thank your for running it through your tests.

> (But I saw there are some comments from Michal and Luca about this
> patch so I think these comments need to be addressed)

So far the changes are style and a few mechanical. While unlikely to 
cause a functional change that could break, probably best to hold off 
adding your Tb for now.

v/r
dps

