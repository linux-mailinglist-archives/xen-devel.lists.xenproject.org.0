Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F282AC6E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 11:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666145.1036635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNsbj-0005YN-8i; Thu, 11 Jan 2024 10:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666145.1036635; Thu, 11 Jan 2024 10:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNsbj-0005WU-65; Thu, 11 Jan 2024 10:48:19 +0000
Received: by outflank-mailman (input) for mailman id 666145;
 Thu, 11 Jan 2024 10:48:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Cn=IV=amazon.co.uk=prvs=73372ff43=eliasely@srs-se1.protection.inumbo.net>)
 id 1rNsbh-0005WO-Qb
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 10:48:17 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e49a174c-b06e-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 11:48:03 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-a893d89c.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 10:47:55 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2b-m6i4x-a893d89c.us-west-2.amazon.com (Postfix)
 with ESMTPS id 4583D41092; Thu, 11 Jan 2024 10:47:54 +0000 (UTC)
Received: from EX19MTAEUB001.ant.amazon.com [10.0.43.254:62621]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.47.189:2525]
 with esmtp (Farcaster)
 id 6501f36b-f066-4c5d-a5f5-94238a3f5c59; Thu, 11 Jan 2024 10:47:53 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Jan 2024 10:47:53 +0000
Received: from [10.95.99.82] (10.95.99.82) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 11 Jan
 2024 10:47:49 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e49a174c-b06e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1704970084; x=1736506084;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=CfwwQc2KmGR36m1dd3AfRZExsPllzd43VXGN7zgsSqg=;
  b=sgd6WUp3n/Vdp7MxjZtbnPTFHsywGqw0GzUpGbWKli8OV9X5bDe2QIhE
   k5UuCepgTfWomrth4J6NMw+34SyLWCMIZ20gnMtMSg+w1cLfC0Wt+767F
   MJ0q32dES+Y31fO2e9GPk/yZEOU1Gmf0XvQUHHcTzYnp7b1y2Jrl8uEW5
   A=;
X-IronPort-AV: E=Sophos;i="6.04,185,1695686400"; 
   d="scan'208";a="389113682"
X-Farcaster-Flow-ID: 6501f36b-f066-4c5d-a5f5-94238a3f5c59
Message-ID: <bc989828-69b9-4919-9ff3-fdd53fb2def1@amazon.com>
Date: Thu, 11 Jan 2024 10:47:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Elias El Yandouzi <eliasely@amazon.com>
Subject: Re: [PATCH 11/22] x86: add a boot option to enable and disable the
 direct map
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
	<xen-devel@lists.xenproject.org>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-12-julien@xen.org>
 <fc70f967-34bb-9569-f514-7a3208e746c6@suse.com>
Content-Language: en-US
In-Reply-To: <fc70f967-34bb-9569-f514-7a3208e746c6@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.95.99.82]
X-ClientProxiedBy: EX19D032UWA004.ant.amazon.com (10.13.139.56) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)
Precedence: Bulk

Hi,

On 22/12/2022 13:24, Jan Beulich wrote:
> That said, I think this change comes too early in the series, or there is
> something missing. 

At first, I had the same feeling but looking at the rest of the series, 
I can see that the option is needed in follow-up patches.

> As said in reply to patch 10, while there the mapcache
> is being initialized for the idle domain, I don't think it can be used
> just yet. Read through mapcache_current_vcpu() to understand why I think
> that way, paying particular attention to the ASSERT() near the end.

Would be able to elaborate a bit more why you think that? I haven't been 
able to get your point.

> In preparation of this patch here I think the mfn_to_virt() uses have to all
> disappear from map_domain_page(). Perhaps yet more strongly all
> ..._to_virt() (except fix_to_virt() and friends) and __va() have to
> disappear up front from x86 and any code path which can be taken on x86
> (which may simply mean purging all respective x86 #define-s, without
> breaking the build in any way).

I agree with you on that one. I think it is what we're aiming for in the 
long term. However, as mentioned by Julien in the cover letter, the 
series's name is a misnomer and I am afraid we won't be able to remove 
all of them with this series. These helpers would still be used for 
xenheap pages or when the direct map is enabled.

-- 
Elias

