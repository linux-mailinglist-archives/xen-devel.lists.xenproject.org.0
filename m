Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF5D3BEAA8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:26:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152376.281517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19RN-0007Cv-5U; Wed, 07 Jul 2021 15:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152376.281517; Wed, 07 Jul 2021 15:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19RN-0007Ar-0f; Wed, 07 Jul 2021 15:26:21 +0000
Received: by outflank-mailman (input) for mailman id 152376;
 Wed, 07 Jul 2021 15:26:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m19RL-0007Aj-DP
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:26:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac4af744-df37-11eb-850a-12813bfff9fa;
 Wed, 07 Jul 2021 15:26:18 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-XDTiYRhWMKOZVVRmg8SMOg-1; Wed, 07 Jul 2021 17:26:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 15:26:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 15:26:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0084.eurprd02.prod.outlook.com (2603:10a6:208:154::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 15:26:13 +0000
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
X-Inumbo-ID: ac4af744-df37-11eb-850a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625671577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPUGnd18QU02VmAyYX8VKIkXFpSfM89yLNPUejSeJY0=;
	b=NB0n5JvQ7/vxsBcm+7eMogmhnpsv5TMbhG6+Tw5xbDfs9wACVI7n9GkG1AeHL6ms4/MsMQ
	VUFoL6Z2JSbqT98buL2RUQaQ+veUBShZlc/adlqvu5dsPKjPdkm0jp/Im0CocLKK6DGixJ
	MuUgZjviq0z3cq8o92QEFO42pM8lxnw=
X-MC-Unique: XDTiYRhWMKOZVVRmg8SMOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjD8RP9gPM6aB/yj0Dkh2G7u0Iuo4webf4uLTN4vnPwe1iqSU4kveHBZJo8e3mjwyEBYW4G8IZIxOJbH9NTNctz+iMjf4Dgszir0iQLZv/lsIMWF41zNidjGgA4zzkWdppUBo+cthsuKDjXIdV5ozvYSDr4O93dZf5XSmMpoF+6Tq4d7Q6wEv7C3lNjgChFYxYC+JGN+KLvK23utqNSPbl+YCjJBAH0p0OCS7uPnbsw/FXmUMoM0gRjOiVeBqVQ9IOnsUnSu84JxOHBMEuPF2Rnq7NGdsS0eTlqB82nfhXVI4uNvIehCa3DxFT+DYTgkkB8pq+hfprMiwSw5xDcmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPUGnd18QU02VmAyYX8VKIkXFpSfM89yLNPUejSeJY0=;
 b=G4t+MpgnBzhMnASCag1mdj3rmXYhkJ14yVtJyMp3nIit2uqGAUm+LEHIkjh1Q5tF3ZtvTU4vrzSDMAnxvYg7hCmXdKbJ1pp+1rcJxadj9N8fpQvV1PUeyhXyZ7jP+d1dhokGoSiWEY00N64KB0Ehu7dE8g1m0dIC3RutBHNaQE8Xy9Xaf3W7iDv19pXjXDlJtdVrhPneG8BZQ9hNzL0YctOpVyQ6orMhMRYG0u30sTWEkeQGR/u9Bxpzne3cEcpffCwUY/kwMq28nj7aGzlivs4eMciob78qWbVL01gqhqAZMkCa0HzthEF07cdwvn888xDMGuVf8370DTrlzcJZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 12/31] build: use subdir-y in test/Makefile
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-13-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b93fcbc5-8b4f-7d17-7d0a-cd2cbf6fd2fe@suse.com>
Date: Wed, 7 Jul 2021 17:26:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-13-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0084.eurprd02.prod.outlook.com
 (2603:10a6:208:154::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1049166d-54f8-4ad2-c30f-08d9415b8eb2
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3118A834BBE1BEE1E3E9A8E8B31A9@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yzIh8WNzgM5ekrsdwYedFzaQmbfckHgB663dhJFBWRTUcsosyDwSxEQKgpAqln98zomJPuhDjSgdi3rpZYm4UUKZDlDvhmrZSi5LYxG4LXYxmWpkVTDPM87ZzLHuYu7A1Mb/5p+Yu5nsB2sow3DeLwXs8k6i4FzHeo+OHdv8vsggtlfIPGQKarPPsj0EVHofktHJXGDK81YVVuOF9Yt97LZ3BPatrn8IpQaZEZvLTYtSDPgdDY62glXiPmcZX6ygzvnUrBUxmQ93dgE/7wnqJmgKbjyRSEYs2QNoZaDzjHGod0B3N2YYFnvu/hXCas+xrzukSUb8fmBCcQ9FcH9xkGFA9EgbVoiy+DdxCiTljijU8y/kb8MQ1A5O53vGCRTTGcq9M9BOLdkXPT9lNetU9ayD5qNoQU6oGWBQ/NoMS9PBlt8zb73LG5M8MaTz+QX/qrfc4gjm2oEIOg6mH4oy2gGKnlHogHXitbYkLeMEUWHrzJFNvUM8jJKulx2HWNW+LD7TK02Y0K6flTEjiIt9Lat6/lZm7tGwDV+fXZKoubWHHdlQYj6ef1UVMtw332x+p6oZ43/Lo3buDPZo2fWqKoFTBtR4AeIsmKH+WPv1+rGKtaxQFPmD+uXzeTfbCbC8uclbkwMsNoMtKVl59bKbiI2J1jIew7wBf6ZMfHPwuwG7bnoeY8NDu7Z/93mwdwTmxwKrYVjp5KZc7MzZRxxLkqMhnFhb547ETxTNyrowwl4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(366004)(39850400004)(346002)(396003)(16576012)(8676002)(66476007)(66556008)(956004)(26005)(83380400001)(53546011)(5660300002)(54906003)(316002)(2616005)(86362001)(66946007)(38100700002)(2906002)(4326008)(478600001)(8936002)(31696002)(6486002)(36756003)(6916009)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWJFbDBPSkN1N2VIbSs5U1I5TlBhcjZKL0NWRVhDZlJYcXJiNzdFNnd1VkdD?=
 =?utf-8?B?Q3J6OXFybjUrYy9zc2o4YkRiNG81L0NtR3Y4dmV1NDJmOFhXeWJMUHM3a0lr?=
 =?utf-8?B?bWZBNzVqZjU3Q1BxUU9nKzNnT2xKblBoWThPWk5CRlFHY1ZaTktYclFTMldu?=
 =?utf-8?B?dHp1Vng2OGdjTmNSVi8vL0xFdjlKMTBvdnQrQll2NDBsMXNMa1FiY0ZyNUxy?=
 =?utf-8?B?algyb1g4dnNYeCtlVFFIOFEwUWZFRmpZTjNVS2Ezdmd5NzluTEZXbUZlZDdk?=
 =?utf-8?B?RGxoS2ZydGwrVDRrajY0NnN5bjhQUlJOWEg2WUIrRWJuUGtqQ1JYNGhPNDBQ?=
 =?utf-8?B?WFhnRHNwQ2owMmovemoxZmVDeDgzV21DVE9rK1dGdG0vZEtQS2FVM2k4c2JK?=
 =?utf-8?B?RHFVTUlvbVJNZzk1NGdYRnR2eXRHdEFkZ3FyNXZQa1c2UmprMUtOdEk1Slpt?=
 =?utf-8?B?bUtQeitCWHk5TGVEakk2cVlIL2R3UFpJaVhqc3g1bFNKZ3NkQ1hnUmtnYW1y?=
 =?utf-8?B?QytRWU16allqQTVDWHNvM3ZNSmZZM0xER2V4UkJMN0lwMjRqVFhHeU9GaGxV?=
 =?utf-8?B?T0tCRWZwMnc3RUsyQTlQN1plNTBQYm92OXJIOFFnN0hYaXRMSnNDVm50OWFN?=
 =?utf-8?B?dXNlWm5BZ1hoN21Pb1Z2Y1YvYVhraDJyWURTbkZVUUxVamVnU0tOYVZqWC9U?=
 =?utf-8?B?NWoweVNkdW5pcWFUb3hySGg5ZkFZMVg0MkNQdFVPQ1hSazhlOG45aWMxOTF2?=
 =?utf-8?B?VVZhT08wQ3lMblMvc0t6VElTTFFFZ0JWUEpQR255SFpBOW1GN2tqU25BK3N6?=
 =?utf-8?B?aVI0Q2xyb0NPVmh3WFRIUWdMZ1gwNzhMZHdFQ093UjVaZ0pBWU4vV29RZlR4?=
 =?utf-8?B?SjAwQm5xZElYY2RQVDdvZmZDYWtyVjlEbVFReU5EdnF5YTlkWC9OT3RUV093?=
 =?utf-8?B?S0pyVGo5NG85RmdxVUF6M3g1ZndmMENCOHJteDlNSTJJeEhha0NScG1tNlRC?=
 =?utf-8?B?MmZNSlJ6MlhiYm9LTG1lckd1K1hEdUlyY3N2WUtOQjlJL2hEKzJEeVRuZnph?=
 =?utf-8?B?UHlualJ2bEZNSFdadXlzTERwVnozRjh2MXU0SHBiejRiMCtHZnNVeFVEZFRM?=
 =?utf-8?B?N3JFdFdFVlBqNmxoUmZVY2tRZ1hSOHRlODBUcVlQdEJJa1dTQXZ4Z1pqOXFk?=
 =?utf-8?B?UGI5KytoYXBiMGFWS1g0Ryt0aitHMlptU3Z2N24vV0svZGNrTXQ5cVpESzhF?=
 =?utf-8?B?Tm9HZjlCc0RZaWcwOVQ3WkpyMjI5aUdoejRTMmNvVnNlcExQcmJOU080bFkx?=
 =?utf-8?B?N2hDNUhGMEhzYTZBWjlGc09mUGd2SEh1VDJGaG5CdndpaFZpeGI2RlFnK0tx?=
 =?utf-8?B?cG9HZWNGTHY1eDBYWGpZbThwcStSQ09rbmVZMysxUXpGbHNpWWJsNHc2Q3l6?=
 =?utf-8?B?MkYxdThoUWgrMm5zcmFBcU9Uc2huaUtTTHRHTGRPSE9jQVVVcHYwZkxiUWtT?=
 =?utf-8?B?bVpsU2hQM1hJZTlWRzFGaEo0aUY4UlZmVW5CNFhra0xsYXg2dzRneVZha3F2?=
 =?utf-8?B?cE5QUHNON0x1ZVpjYUEydzZGUTkwS2g3c1h4NnpKb1pBelZ6cXJiZHZONHRO?=
 =?utf-8?B?WUtCTXlkWG1zOVllT1dZVHdZUklGSjY5V25lZUpyWmwrdkxPYjd0SDl3a0w3?=
 =?utf-8?B?MGdRNFIyM1dBUkJ3SEpFUWZieHFkeDFaVEJiRlFuTVBIK3BOcEpPcGRqM2FM?=
 =?utf-8?Q?D3doO/jkKNmZzfKXOQVZsMYWT0vSclDArfw6ypV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1049166d-54f8-4ad2-c30f-08d9415b8eb2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 15:26:14.2714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORKT1Klns7/AF0XBNt0JS9Ki8JuoXVMWVy2X86xXr4gchna3Je1dsOWVJAK68vluDl3JTx+JFUnLp7lvwyfB6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

On 01.07.2021 16:09, Anthony PERARD wrote:
> --- a/xen/test/Makefile
> +++ b/xen/test/Makefile
> @@ -4,15 +4,10 @@ tests all: build
>  
>  ifneq ($(XEN_TARGET_ARCH),x86_32)
>  # Xen 32-bit x86 hypervisor no longer supported, so has no test livepatches
> -SUBDIRS += livepatch
> +subdir-y += livepatch
>  endif

As per xen/Rules.mk having

subdir-y := $(subdir-y) $(filter %/, $(obj-y))
obj-y    := $(patsubst %/, %/built_in.o, $(obj-y))
...
subdir-obj-y := $(filter %/built_in.o, $(obj-y))

this will result in building of livepatch/built_in.o afaict. Is
this an intended but benign side effect?

>  install build subtree-force-update uninstall: %:
> -	set -e; for s in $(SUBDIRS); do \
> +	set -e; for s in $(subdir-y); do \
>  		$(MAKE) -f $(BASEDIR)/Rules.mk -C $$s $*; \
>  	done
> -
> -clean::
> -	set -e; for s in $(SUBDIRS); do \
> -		$(MAKE) -f $(BASEDIR)/Rules.mk -C $$s $@; \
> -	done

And then why can't the generic recursion rule in xen/Rules.mk
not also be used for the "build" target? (I guess "install" and
"uninstall" need to remain separate, and don't think I know what
"subtree-force-update" is about.)

Jan


