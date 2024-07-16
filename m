Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E57FC932E2D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 18:13:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759702.1169396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTknG-00071i-3r; Tue, 16 Jul 2024 16:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759702.1169396; Tue, 16 Jul 2024 16:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTknG-0006z4-0M; Tue, 16 Jul 2024 16:12:46 +0000
Received: by outflank-mailman (input) for mailman id 759702;
 Tue, 16 Jul 2024 16:12:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ph1w=OQ=amazon.co.uk=prvs=9201d78b2=eliasely@srs-se1.protection.inumbo.net>)
 id 1sTknE-0006yy-6N
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 16:12:44 +0000
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com
 [52.119.213.152]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a3290ee-438e-11ef-bbfb-fd08da9f4363;
 Tue, 16 Jul 2024 18:12:42 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-52003.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 16:12:39 +0000
Received: from EX19MTAEUA001.ant.amazon.com [10.0.17.79:2649]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.43.109:2525]
 with esmtp (Farcaster)
 id 02ddc300-f00e-4ad4-8f93-e15a1c62440c; Tue, 16 Jul 2024 16:12:37 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 16 Jul 2024 16:12:37 +0000
Received: from [192.168.10.41] (10.106.83.21) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34; Tue, 16 Jul 2024
 16:12:34 +0000
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
X-Inumbo-ID: 3a3290ee-438e-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1721146363; x=1752682363;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qzb42ou1eJx1mcxSNlVvLZNv4KJckIIq3To+0bUZuHY=;
  b=XvnwFonCXyuJwy51n7ys9nhE0z1c+FFKFxBNaNky+wHEEytkZZ2Gbyhk
   8UTPNKv0qq6tfyhdkWbmg7UN093uRabWEEJorn0zf6i5Ti1m0CF5EofW9
   RGuilZeRBCLhP5Ye2GC4XRzPTUteVNRBtHTll2EXhzXBlQwK4qcVMZcwp
   M=;
X-IronPort-AV: E=Sophos;i="6.09,212,1716249600"; 
   d="scan'208";a="12636204"
X-Farcaster-Flow-ID: 02ddc300-f00e-4ad4-8f93-e15a1c62440c
Message-ID: <1fa5e786-c0fa-4dff-8085-608d7f983698@amazon.com>
Date: Tue, 16 Jul 2024 17:12:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 03/19] x86/pv: Rewrite how building PV dom0
 handles domheap mappings
To: Jan Beulich <jbeulich@suse.com>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<jgrall@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-4-eliasely@amazon.com>
 <ffe6fbc8-fbbb-44a4-b981-b43f3fb48433@suse.com>
Content-Language: en-US
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <ffe6fbc8-fbbb-44a4-b981-b43f3fb48433@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.83.21]
X-ClientProxiedBy: EX19D032UWB002.ant.amazon.com (10.13.139.190) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)

Hi Jan,

On 14/05/2024 16:03, Jan Beulich wrote:
> On 13.05.2024 15:40, Elias El Yandouzi wrote:
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>> @@ -382,6 +382,10 @@ int __init dom0_construct_pv(struct domain *d,
>>       l3_pgentry_t *l3tab = NULL, *l3start = NULL;
>>       l2_pgentry_t *l2tab = NULL, *l2start = NULL;
>>       l1_pgentry_t *l1tab = NULL, *l1start = NULL;
>> +    mfn_t l4start_mfn = INVALID_MFN;
>> +    mfn_t l3start_mfn = INVALID_MFN;
>> +    mfn_t l2start_mfn = INVALID_MFN;
>> +    mfn_t l1start_mfn = INVALID_MFN;
> 
> Just to mention it here again: By limiting the scope of these I'm pretty
> sure no initializer would be needed even "just in case" (really I don't
> think they're needed even when the all have function scope, as producer
> and consumer are always close together afaics; quite different from
> l<N>start and l<N>tab).

I had a closer look at your suggestion and I don't think it is possible, 
especially for l3start_mfn.

The variable, l3start_mfn, can get initialized in the else leg of the 
first if statement along with l3start variable.

If you look a few lines below in the for loop, we call 
l4e_from_mfn(l3start_mfn, L4_PROT) which assumes l3start_mfn is valid. 
It could not be the case if we took the first leg of the aforementioned 
if statement.

I don't think I can this easily limit their scope. It could work for the 
others, but not l3start_mfn. So I can either leave things as they are or 
limit the scope of every variables but l3start_mfn.

