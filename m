Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB3276E9C7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 15:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576367.902415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRY9o-0000po-A1; Thu, 03 Aug 2023 13:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576367.902415; Thu, 03 Aug 2023 13:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRY9o-0000nH-6P; Thu, 03 Aug 2023 13:14:24 +0000
Received: by outflank-mailman (input) for mailman id 576367;
 Thu, 03 Aug 2023 13:14:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRY9m-0000n9-P7
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 13:14:22 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7d7f373-31ff-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 15:14:21 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691068454617635.0981335618633;
 Thu, 3 Aug 2023 06:14:14 -0700 (PDT)
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
X-Inumbo-ID: a7d7f373-31ff-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691068457; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q89MeVFSK8jwhtPdVQ1oDiTvVFk5wAQYSewss5+2mdtjkqUvtbUSTRTRwjqbotQv9N1b6ycmbFOr/xcDzLtdZKAMXDNUYQZLfFSYQFSMKeh1zQ6nr+GfLzJ60FLXUntRLL7AK5K+dUyQuvPLVPTJbiq+5G0gmhR+tSTFiUDTXek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691068457; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=hpa3gHQ2YUcIcsojKGTgCk04d0FhFq+N9GgsGAyqK0I=; 
	b=MEJgOtORnusvNfn5amv0ALHqj9tW/X9av8s+JkKKuTAcOOT4HDkkwc6W0wG7S0c2lzAXUCPEHtkWqxP1Xr6rkP2guJmKFCK2kHtVVL1kRioxiz1s1FLk8i2WenpYN69UBuwT9o452WjNeAh7tSb2NDMS/G0twg4/TWsRXpU+j0s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691068457;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hpa3gHQ2YUcIcsojKGTgCk04d0FhFq+N9GgsGAyqK0I=;
	b=EXhsZwoho68ZeAJZj20YDTSsCoZvkOJOeiriMfPt/RcUAciEI52ArTWh9uZhZPt7
	6x45SE+iyVoRJr5lRA4AqkCug1ezsADZQfbGWzZs74UvQDbjqLr7MKw/R0DWyio6wuy
	6m/va2Zz2Kn2npY/Lv45zer/RZtPO0n9blO/Bvcg=
Message-ID: <71a942bb-a846-e37c-93e7-eb47cad7b7fa@apertussolutions.com>
Date: Thu, 3 Aug 2023 09:14:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] fdt: make fdt handling reusable across arch
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20230801161409.25905-1-dpsmith@apertussolutions.com>
 <20230801161409.25905-3-dpsmith@apertussolutions.com>
 <AS8PR08MB799102916C8CA24C276DB51A920BA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <7afba030-48f2-baaf-02f9-dae84107a620@apertussolutions.com>
 <AS8PR08MB7991BC2D8AAC933CE77F4DE79208A@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <AS8PR08MB7991BC2D8AAC933CE77F4DE79208A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



On 8/2/23 21:40, Henry Wang wrote:
> Hi Daniel,
> 
>> -----Original Message-----
>> Subject: Re: [PATCH 2/2] fdt: make fdt handling reusable across arch
>>> make: *** [Makefile:183: __sub-make] Error 2
>>> make: Leaving directory '/jenkins/workspace/ais-xenbits-
>> xen/layers/xen/xen'
>>>
>>> The staging itself passed the CI check. Did I miss some context to make
>>> this patch works? Could you please provide some hints? Thanks in advance!
>>
>> Nope you are correct, I now need to go back and look if I sent patches
>> out of the wrong branch or if I really did miss cleaning up the original
>> declarations in the Arm tree. I fairly confident I made sure gitlab-ci
>> passed before I cut the patches for sending,
> 
> I think so, as I saw something related to the Gitlab-CI runners discussion
> in IRC yesterday.
> 
>> but since I had three
>> different series in flight, I may have gotten jumbled. Apologies for the
>> unnecessary churn here.
> 
> No problem at all, I am more than happy to do the test for your
> v2 series once it is in the mailing list :))

Great! Thank you!

v/r,
dps

