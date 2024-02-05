Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF40A84988B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 12:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675950.1051657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwsy-0002Am-HD; Mon, 05 Feb 2024 11:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675950.1051657; Mon, 05 Feb 2024 11:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwsy-00027v-Dc; Mon, 05 Feb 2024 11:11:36 +0000
Received: by outflank-mailman (input) for mailman id 675950;
 Mon, 05 Feb 2024 11:11:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i4VU=JO=amazon.co.uk=prvs=758ae075e=eliasely@srs-se1.protection.inumbo.net>)
 id 1rWwsx-00026U-9u
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 11:11:35 +0000
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50ac4bd8-c417-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 12:11:32 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 11:11:28 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.43.254:51294]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.45.85:2525]
 with esmtp (Farcaster)
 id 7e6d3638-080d-404b-985a-14bdd4d4a538; Mon, 5 Feb 2024 11:11:26 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 5 Feb 2024 11:11:26 +0000
Received: from [192.168.8.102] (10.106.83.11) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 5 Feb
 2024 11:11:21 +0000
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
X-Inumbo-ID: 50ac4bd8-c417-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1707131493; x=1738667493;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=07uNVDwPNMFmJ8ZLTBjGgp4AYgWfP3D1106qVC1N05g=;
  b=OfmVb+Owk8Oj/vseUpW8SmRzj0XDs4zHjvAAeViVLDtVJLF4e29i9gBC
   59glSS5uWWtK1KbZJoV5aE4IaXPThIX/ryXkA7tnbvgrS29wPPoCzdSGv
   EZWLvtL53cahiDhI+aj9k3r/IyobvXDLwkRdHZ8U47JdXAeVXqxWHEDLa
   A=;
X-IronPort-AV: E=Sophos;i="6.05,245,1701129600"; 
   d="scan'208";a="271091896"
Subject: Re: [PATCH v2 (resend) 00/27] Remove the directmap
X-Farcaster-Flow-ID: 7e6d3638-080d-404b-985a-14bdd4d4a538
Message-ID: <217a6edd-96f8-4589-b500-2dc31a1b0bee@amazon.com>
Date: Mon, 5 Feb 2024 11:11:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Lukasz Hawrylko
	<lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
	<xen-devel@lists.xenproject.org>
References: <20240116192611.41112-1-eliasely@amazon.com>
 <04d113bf-71ab-4eba-a95f-72318c888d1f@suse.com>
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <04d113bf-71ab-4eba-a95f-72318c888d1f@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.83.11]
X-ClientProxiedBy: EX19D046UWB003.ant.amazon.com (10.13.139.174) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)

Hi Jan,

On 29/01/2024 08:28, Jan Beulich wrote:

> On 16.01.2024 20:25, Elias El Yandouzi wrote:
>> Julien Grall (8):
>>    xen/vmap: Check the page has been mapped in vm_init_type()
>>    xen/vmap: Introduce vmap_size() and use it
>>    xen/arm: fixmap: Rename the fixmap slots to follow the x86 convention
> 
> Btw, if there was clear indication that e.g. this patch (fully ack-ed
> afaict) can go in ahead of earlier patches, I probably would have put
> it in already. Considering it sits half way through the series, I don't
> want to blindly chance it, though.
> 

I just forgot to strip off those ack tags. The patch got approved quite 
a while ago and I thought it would be better to submit it again.

That being said, moving it earlier in the series would still work.

Elias

