Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FA03FEC11
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 12:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177230.322541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLjrc-0002wT-Fb; Thu, 02 Sep 2021 10:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177230.322541; Thu, 02 Sep 2021 10:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLjrc-0002ts-Bf; Thu, 02 Sep 2021 10:22:32 +0000
Received: by outflank-mailman (input) for mailman id 177230;
 Thu, 02 Sep 2021 10:22:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLjrb-0002tm-6A
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 10:22:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 581489b4-254d-40ab-baaa-f40e8832e8ed;
 Thu, 02 Sep 2021 10:22:30 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-O7RvBVukNHCZhA4CO9IjYA-1; Thu, 02 Sep 2021 12:22:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 10:22:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 10:22:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0041.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Thu, 2 Sep 2021 10:22:25 +0000
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
X-Inumbo-ID: 581489b4-254d-40ab-baaa-f40e8832e8ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630578149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jBvMBrv4oxvPPQ9EqN0vykb5XJjI42SfMRO3gMpCVf0=;
	b=UkmyJ8Ao5+zN8J1NZgK3F6n/sYhSVmoFqJj+pBsHqx+YtnlGKoLJKULoJlWmtDgVyQvxek
	HWbTBupWDmGgYQoEGlbfjZq9u84iih3KeL2e3KgEg/j/UoclmqW9uZ/BIH10QDK6+BOJ76
	QYTGcin+gSSQ0RHioa9eJxFsT+dZfnk=
X-MC-Unique: O7RvBVukNHCZhA4CO9IjYA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrBGUGX1ckyFBe9DdcIzX3NPXIBIw4JmrF8NFZ3aW2PPLu2rw557PfQTjfSUV90XGHWZl966YI4GX8t4PLzFkx2kJRJx98rIsC72kW26ioVMDH+MYnLnsgG0i0NYtEC7741+pvB/L9gf7NEm8jboOR2DsECSxliM8uGPaJB+ggTu8icqj2GY+9z7Xlebky9HjG8cEkliBe6TWwU5ESLKyRiC3w4L+soRAZk57GxWismzr2XJvJRrgd1CxBUj87WOPjZHyKg/EJ85trn1WTFLjPxBjwiBbcFH8w5BOKIXOP36Idvz8Qogg0IRras0hSu5krmurBO5YNsayifZJSQ6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=jBvMBrv4oxvPPQ9EqN0vykb5XJjI42SfMRO3gMpCVf0=;
 b=HzF1B2dtd5VX/tZmm8JXo11T1DORvuGHI+k1j8ckqKdviuW+LmZoZH8y1F95jQ5Ck69Qh0X0ygdg+0+rhbKynMAYvV8mlKryN7v7aBGt4gTkBDlHrcYEZcMfYRFlQwN3tU62OFHELeABYyo+EM7UCDrckDBJHea2JIC3ljSofi34HABCkuffpdIDljYMcTahQF4moJhK6o2jW9abSw81KYWrmxX+6RnEaBmXbfOAaN91XUUTIRIPUWxoYpytg2IeST1OzYPkKs7FO2TpVAVNKIclaxO7FxXHl/uqo43HkeRvz+/xtwNad5L58oIebISSTG2co9XLgkPO+Fgreg1K+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 00/51] xen: Build system improvements, now with
 out-of-tree build!
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ff609b7b-0174-8161-c48b-353387dc78cd@suse.com>
Date: Thu, 2 Sep 2021 12:22:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0041.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73adc729-ea34-4779-e5ee-08d96dfb8f7c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55995B5AA83D645C11C6AF26B3CE9@VI1PR04MB5599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9uT1Wpnj60xmtKnpwLM4Y/jDGk4CYf9UpxsHsdPgHuPKelDTeGF+FetqGeDY+INlMPsB/4Q6foGCJSes3B39/doNqrY5Bn8PDjyvv6UFLCZB8dk4B/1kSfm5m1AvgBoPsiWwaxVeyPwqFHtNQE1pq4K7SJvX9bktmkB2uZa5nGtblzZaFmGX0VrB5yVLVrgfzJtQoEDVUaE+/KyzMkufw8b9G4wXOATFymmQxIOr7Yay/zgzC7eRW4nPmV92WoguyHNKXi4hNgKF4q3Gby/3aYFJGv0+9QPTaR74+7vaPL4rliNYloDIaH7Bmax4YnvqQfTXTy73WFJ3KgZUcTjRktbMhWi80/MRAaJg24DmaUJOddcrwOzt4zOWMA9VD/5BCjyo0ah+oB++2a+ANUbmPXIPEOcNTVfR0CqIAiaou/Gp8PcuJtQMcxs/kQGynTVGuyBLJGPky/XGispaoVCZ3bWznd70G3CgzUbmZ+aSpvV/WigOxRjKJXRd1GMfDvUKANhc1lyd9QLoFAuWUkakKS7BmXOEImuJgHWN5hvBBlQvbC1cjSnXAw+tGMcu9espftBUE8UUDNJejSYKIhjrLjJJadmHFqYuXTusErzZYuMC3k2EMaEZwg0GbWpzKFFFUbVIxMLqjaTFGp4qGiRpFUMt1zjr2TkIStJrwbR/X2PStwkdPSbd3MS8ppkRmXRlgAxerpyzCvWgXmNJhnh1nyBUFEQTl9XK7Wdy+dmOF7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(376002)(366004)(396003)(346002)(66476007)(4326008)(26005)(53546011)(66946007)(8936002)(5660300002)(316002)(186003)(16576012)(31686004)(8676002)(38100700002)(4744005)(2906002)(66556008)(36756003)(6916009)(31696002)(956004)(2616005)(86362001)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHkwOUlZQjVLeFZGdklFby9JQmJ1a0ZGcm15LzhVN1BkdmFLd0ZhQ2NtWGc1?=
 =?utf-8?B?Q3gwR2xlT0RkVTZRelFUTmQ2M3Viem12YkVJZ0xMckM5alRDeEtwSUQzcFhX?=
 =?utf-8?B?MDRrWVlJZ1RWRW90NnlqQS96WjUrbXNyN25rNUFnaUZiU1BvVDJXZ2lKckxB?=
 =?utf-8?B?OHNLNGtnTFFLVUZMQVozT0g3cnBwQVdodE9waDU5eXlpdDRvWWt6WTI4VHZG?=
 =?utf-8?B?Mjg0UnFhTFZySWUveEVmaURyZjVDMWM3MmkzQUFMSTdoNzhIVGlZaFFZZmtT?=
 =?utf-8?B?cE1PRVE5aUFndFhEMzNlTWF4N1FLZjRwU2JqQWZDYkJMbW9DSlBOczdNbWoz?=
 =?utf-8?B?VVpPMG5JSzBKdEZZKy9WSlUxNGJreElydlVraUc4ZGk4Q0czbit6R3ZjVUJu?=
 =?utf-8?B?UCtINUN5R2tDUWlLSWdLSmYwb3M4SWx3SVFwcHJ4MVRDNXlUMVV5Ly90UmZ0?=
 =?utf-8?B?anN5RU4rTmFOUFJmOGlXQ1pCbDYxQjNtaHFkcGU1T0ZSUXBYZ3BZdDBvTUJQ?=
 =?utf-8?B?SmZIM3BUbGpwYXVvSGNYcU5FY3dkRkkvaEUwelNlaW95bXp3WDhpV0o4bFE5?=
 =?utf-8?B?ZjJTKzg4ckM2SlhITjVscXFMUVB1VDU3Y0p1RkpRWlpvRlJQME1hSGJaNlNh?=
 =?utf-8?B?cG53eitMT3BEcUdqZUxtTHk0bzV6U3l0VTJEQ0RVMkdicVc5ZFRjS3c5VGtH?=
 =?utf-8?B?ZG9sRlJGZ3hpTjNJajJuUWNpbjBYY2hPUWN1TzZvYkVaUnJqdzBKWXRGOW9Q?=
 =?utf-8?B?REROanNReXljU1R3V1JldGZHeTJKS2dMRHFUc3h2MFRwaGk5N1dHZkJDUFkv?=
 =?utf-8?B?TzV5R2VUWllaWUh5dStLbWpINmtqV1NIVlNKaDRGOUc4TlZRaGkvNEZob25t?=
 =?utf-8?B?Q2kxWE5HSmdhR2V3ZHU5MTdGMFI4SkFPUlBkcFJQYit5N2wrT2pEMCtGWGRV?=
 =?utf-8?B?cjZNUEVLV3FQd3hMRGIzbU9vdFd5VHV2M0R4YkpUaDhtM0I3M3pMc1cwVDJj?=
 =?utf-8?B?UlRDUkdFRTcvU1FMUnkzYlhpZmd2cGpkYVVLZTYvQlBjSEZwZEpTRlZjaVRa?=
 =?utf-8?B?MDdRemhhLzVobHpoTElVeUVpRzVCOTNRcGdkYzJjaU91N2s4aXliYll5MXJs?=
 =?utf-8?B?MWpRcnFPQ1pvMTd3YUxNYy8zVXJGblYreGxwUllUdjlsbU1hUzN3a2I2akVk?=
 =?utf-8?B?dkZIUFFRdVJISVVxajEwcHhRbzFheDNrZU5wbGxjRnZOaDZrZlhDQXBXOFlM?=
 =?utf-8?B?amRXNGdmUE5EUm1yL0Jad0R1THJZbkhLbFVGY1RMTjlpWkR0ZFVYVEZlckpZ?=
 =?utf-8?B?S0JCVHBBNmlyMllDMTRkYm5xYU5LS2tRdVR6MmVQTkVBODdKMXhKTlNmdVdG?=
 =?utf-8?B?QnphQ0pkTjVXZUNTMjArL1ZMR3p2MGhWZnRGRkU3YlVVdjVBN1JmWXN1aWha?=
 =?utf-8?B?TTFCRUZFU3hqTDNtb3I2cFlLc1dsWit5RWRFclEvUU1XMm8xTDJ1SkZLVGZk?=
 =?utf-8?B?TG8vNVQyNmxNTU12V2NtQy9UQmhCOTF3NUpQYTE3UVhuWkNwLzR1T2swMTMr?=
 =?utf-8?B?dXdvUkxzZU9FZUQ1RFNDUFQ3OURsZEN0b3VQK0NSeVo4ckd6SlE3YmREMG5j?=
 =?utf-8?B?R3U1a1JPQTB3eG5rVmNrdXpJcm40a3pCSHZtY3RsSGN3WW8vdEF0Z0JNckJ6?=
 =?utf-8?B?YW5vYmRBcTdDdlUrNENHTWJWYUROcitVNDFhYlF6R2hFYitVbWhiOXVDK1pO?=
 =?utf-8?Q?Ji2qhSSfKyj0Yn0A+i7LdHtnFFmRdoqanacr7yQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73adc729-ea34-4779-e5ee-08d96dfb8f7c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:22:26.4659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBB8pcU8XU7U+BXmep6BjcTMGJ33aNM/Hbavpa+rWk0/6gHXuliQN3Hj6AI2jnSrIiqteR6mS86BfMQeYlSoDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

(trimming Cc list)

On 24.08.2021 12:49, Anthony PERARD wrote:
> Anthony PERARD (51):
>   build: introduce cpp_flags macro
>   build: use if_changed on built_in.o
>   build: use if_changed_rules with %.o:%.c targets
>   build: factorise generation of the linker scripts
>   x86/mm: avoid building multiple .o from a single .c file
>   build,include: rework compat-build-source.py
>   build,include: rework compat-build-header.py
>   build: fix clean targets when subdir-y is used
>   build: use subdir-y in test/Makefile
>   build,arm: move LDFLAGS change to arch.mk

Having gone through to here while skipping patch 5 for the moment, I
wonder in how far there are dependencies among the above (and, looking
forward, also for others further down on earlier ones). I don't think
it can reasonably be expected for the entire series to go in all at
the same time, so I'd consider it useful to put in whatever is ready
and independent of earlier changes perhaps still under discussion.

Jan


