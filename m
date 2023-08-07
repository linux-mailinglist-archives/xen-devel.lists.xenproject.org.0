Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76876772637
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578444.905954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0Ux-0002F6-1J; Mon, 07 Aug 2023 13:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578444.905954; Mon, 07 Aug 2023 13:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0Uw-0002CF-Tm; Mon, 07 Aug 2023 13:42:14 +0000
Received: by outflank-mailman (input) for mailman id 578444;
 Mon, 07 Aug 2023 13:42:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT0Uu-00027u-P8
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:42:12 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe02::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 339906d2-3528-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 15:42:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7648.eurprd04.prod.outlook.com (2603:10a6:102:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 13:42:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 13:42:05 +0000
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
X-Inumbo-ID: 339906d2-3528-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQqMqH3WB5GLOpvUpDIS1xGVYaPTyNP2vdRbvQiJQlFMoMA2IgKnJ4KBo6A5MxP7n1K1Czw2k5GCF+iK8ih4jiEyf8jHRMyJtfT/oGcmlA1FrJ42u3o0+e3urY/DkmhQeFD5AjHC3AQ4r4asOEjSjkQioCl2adg8bv0GUgEpde3Dcq0vPxciC5KsrXmh4xRMQenpNn0EhdUnKGwyr/fqZ6gLSGoedGyja1Zl8L7RTm/LgMIq9bpmX5LIgQuZ9JbvnJax8zGw/GvtBThfb4vwtVHSG+AW0nz9Qu+M4oVJITQaZH1EoRrA/TGoogKudv/FcUid31C1N7bGFCf/MYv+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDCpqA2DMQEWGDHwlOIUA5l2DQrdOo/HLKMJr9lzSas=;
 b=dfYZfDYjaKWEQTqhM6TUz+LAj8iKaHpf87d0ya5/Tnh2BUgocu9DiMi2ym+UgUORUiV+qFBXu8B3KUfUc9PHYg9Aj5Y0GxGPyx6/hY5BKFnLDRQsgQg0OLPYY1D9i9UsubbXDYRAli17Avee4jvWhYjL8zj1a/rBNw0NOnQmwtembAIVVcdajpDDTSENe2vVnz0sQewoDR8ymh4sXUhQ8YxmttrYTOxqV0qtBujIRSJRwf2jOxY4YYtKZvc2K2mc6tyy+blYGfuaCpR5Viwxxuv5UDSOwKmYHFwlF5dFYrdL66H5aL9URawv3RpVKt6a6bfGdT5LoOsfFcgV8g4Pzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDCpqA2DMQEWGDHwlOIUA5l2DQrdOo/HLKMJr9lzSas=;
 b=PpJPZVdWZQdwWHviCbd7hipjpmY88UdnbwglR/N7d834C7tMtbR9uS4HKrRCGZfSLbi6sHU6CBq6YlDxeCmxNY+lTHqlcz4BolLj2tzigbWzNtE7BevHyIGGYk28s1IIt/5bEsAyuhYKRc2+hWXDDngPwBl+HbVtDUIOP1tOkNmYA7bbatPqf/Vn/V0rAv1vjYwri4S6grdpQCzONkH+sgoWBl2G52PBKFaN2van/wS5hPU/ehw3U9fBgCO5GBx6cyvNqlyqytgLNORjTAooRtlgJGXAdCcw2w+n5DKmp3bVt8itpPhjVFh58HhZSsQmPNssVAKoUQm7eUApzyjl3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66d0ea64-0363-db7b-b4e2-5e404bff28d2@suse.com>
Date: Mon, 7 Aug 2023 15:42:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 4/4] x86/setup: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691135862.git.nicola.vetrini@bugseng.com>
 <484a88bb35cdb6e5ec036d40fb2b4e20678fd975.1691135862.git.nicola.vetrini@bugseng.com>
 <55099faa-206a-b7ae-8ef1-64d1dc344c4c@suse.com>
 <f7d676d32355788620bda00a60be5258@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f7d676d32355788620bda00a60be5258@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fb3e41-c7ae-4038-45eb-08db974c169d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i5tXZAoV2Q61eh16ki3Ep/qov8blpk7ua5P9LcgohQAiyufVIzv0tLScTHHFHFQ4XldPqRaqr+ZXkHtBkcA+pTioyS6UqCelkOnqhgbMukqZ4ZDIYjo6m74cpFUMidkkiP9Ma2DCoKB782VVigVpeIU1JW0o3X+s2vAxoONLqQR0QK4LCsMZisX2xsiBzbYbHV4tS3wb4Avh4wSBAy/CgKU7mloRuiWQErsW4BOuZscCnQDJuvpjlpIRH+t2nls/KUgRwc415G0koUSf3C6Wqjp2OVMWdFMt2nithQJU92NwDdHUyhIzmta0ekpm93V21iKGGPPVVKEhzErHi8CTktxIl6sPA+qmG237SKLQrAiJ4I5VR9YSTJCMoao5JgdenfDorAPnQWEPJ3R4tmb02ioLGPjUB+gHR0oo3Z5UnedE79INWXg4CrYOb5W+ef5zUuaNZMfoZYMkOsB2b8ZeywVEh1vyaLmfqGLFVAcgHHkQSdLB0K/GxCptnJPSIO07cGA63aGWAQbZjaGsDw4i9XnGw00HSTORGvNYEgN6ov7Qx2hah1aIYfvZl6buX9s+uZ4x5mCD+QkJRxXvKWiAhtGq0Rb6R28QFkR6tG7kQgVAi/TNHDhBCjjPnig24XQhiKNnsXw6uPrE3bqReBCrPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(186006)(1800799003)(86362001)(31696002)(66899021)(41300700001)(478600001)(53546011)(6506007)(8676002)(8936002)(26005)(7416002)(38100700002)(6486002)(2616005)(5660300002)(2906002)(36756003)(54906003)(31686004)(316002)(66556008)(66476007)(66946007)(6916009)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rlo2bEZEaUxaUnkvalFlL1Bkb0VjZHFlZGpwYksySFhDZzNScDQ5WHJMREtS?=
 =?utf-8?B?dno1RUtKQTNScjRvWkFvSUpOVmxwRkxVTFpSRlA0dlFaK1FxQnRXZWtuV1NR?=
 =?utf-8?B?MHZxRkRneVdpbU5OeGFTNnVuN2M4Y3JoWGpseUFJbXpLUDRVTm9OMVk5cHcr?=
 =?utf-8?B?ZXdXYUVCa2JvME53MGhvUG1TUVA4WDFkU2FBbGlJcXVwa0FzUStvakNtcXlF?=
 =?utf-8?B?OGlYZVJUNnFHMFlqOGxjODd0TlQyanV6YVVuaFlFK0tGNGJYNU8yQW9zQU81?=
 =?utf-8?B?UzBVWnVDUEkySFRXMUszM1JCcjBKc0tacDlVdThqRTZ1Sk1PZXZ2ZGlyUmVa?=
 =?utf-8?B?V3V1am5uMHJuaFhTVjNVVitWTXRoR0tpc2dHWkZDQVhnNG9lOHc0bVM0Rzg0?=
 =?utf-8?B?Y1FrbzI0cy9vR1JnQ0x2cVBXSURJNS8yVzBCc29SMHV4UkdzSmxzNTBnbG5k?=
 =?utf-8?B?bDFwTFU1ZmozMjBxdVQ1TEVzTWdaTTUwQzg1RDFVd2xyenpMeGpHYzByamd6?=
 =?utf-8?B?dytHTGlPSTl1VDVHeE51WGd5dDQ0S1JhckxGdVFqTTBDSkdUZU85S2pwWElB?=
 =?utf-8?B?b01ZaXlVY2dwU1N3RWRxdHFySUl0cUFJb3dEdDVQQjZWbHFpYWQrd0FML2Zv?=
 =?utf-8?B?MlFwdjdBWE1RbGxjU3FZOS9YWlZET3ZjR21OWjBWd0J5NzVHNE5KeGI4d1hI?=
 =?utf-8?B?MzlGWTFwaFA2T3N3K3ZXVkhVR0RxYzFzZ2h3b3BqYWZlQ3M4V2Z0L04zTXBQ?=
 =?utf-8?B?Qy9qdlFqRkVqZmxXaktVeWhSZ2JJOUdtNG9qVGlxUkJqeElpODJ0cldnMm5p?=
 =?utf-8?B?SVFZeWhQQU9qNXNlckVzOUJhM09DbGJ6ZWpPS0tmMlZkOVpqeUYwd3gzd2tk?=
 =?utf-8?B?bDMwaUJEWUpJS00wR3RmQkc0MG1OWkdHeVd1V1NkelMrZncyM3VaNzBVV2ly?=
 =?utf-8?B?L3l4VVdpZnFwa2g4dTRpUjB2dnluNVk5N1k3RVkvRDdxY2h3UFRkSnRrVE5K?=
 =?utf-8?B?dkZvQm9LdDhBa2FLR1ZOelZhcWFpNmVjb2hGUjNETWNtNnJiczdpdWVMaFRL?=
 =?utf-8?B?NmxDWjRmY3crQXNvTS9RcXg5MEJDZzdISllYU0U2WENMditORHp2eW83WVN4?=
 =?utf-8?B?QmRxcGV2RG5UaTdKTE5TYWxHT3kzMlJla0Y1U3VFWFU2ZXFIVHFIRXVRMVhN?=
 =?utf-8?B?enFsMkdTbk16OEVQNG1aUVpQWTZ5TkFFcXNvN1FHRVRabFMySzJGdDU5cnIv?=
 =?utf-8?B?SjVWbHhwOFZSUUUwRElGOHJxOUhPeVVBSHF4Y1ZPb1p6QktNUlJFME9RK1lZ?=
 =?utf-8?B?UzgrcTZYQXYrWkFSRkYrZmNlUCtnVUpxV0E5dk04QWFaQlN2enZhVURxVytC?=
 =?utf-8?B?TDhRMEF3OWhhY3k3SWVxaVgrMGdUc1dHd3g2YnpEVTkvY2ZoTkhVQktVVHky?=
 =?utf-8?B?UHV6VDc3dlNPYXRrdUVOQ3JDZ1RVSmNuVHZoY3d2WDNVSFQvdkFpUlpPOExy?=
 =?utf-8?B?WXgza2IwTm8zU3F2WHhxZjRKamIvQTZTVTcxYThsUWZKUVM0WXZ0SFFmRTgv?=
 =?utf-8?B?K1Y0ZU5LdEN1aE5VTTdETGNjYjIxR3BLRkYzcWdNR2pGMEJLUFRYRXQ0cks5?=
 =?utf-8?B?ejY5Q2ErWFBTKzBJTVZDVFlGQ0RiZ3NlVGlTOFdMRS9CM1BnK3VkNTRoemto?=
 =?utf-8?B?cW4vUnBWMXVsbGNpeTRxUC9TWGo2bHZKd2c0TmFrSHpybFFiSnFkaURqdk5j?=
 =?utf-8?B?THZ1bUVzMFY2R0tJVFIvNVhGV2Jyd2huSXl6NThzNW04N01tRzFHVWNqWmF6?=
 =?utf-8?B?aVdzWS95T09KSTdLNkI3U0dyZGVHd0U4Qi92MmhjTXVOQTUzOFNOdUp5NUR2?=
 =?utf-8?B?Z3F2V0UrM0Y0VFZkSjk3a2ZaVnBLRWtScDVyR1kzTjZZZlJBa1RPeVBpUHE0?=
 =?utf-8?B?VTBGMEg2ZDBwUGNCWG9CTFdEWVdQS2ZvVEdhNTRqdjhES1FUbmtRb1FxZkFi?=
 =?utf-8?B?ZEF4eEJ2OVkyVWtNSnRza1VpdVVvbVV2anRjZk9GSSt4SHcwZDdlZmk2OHBi?=
 =?utf-8?B?VHJsVEFqRmxoN0x3TENzYUhITC92cTZTa3M4Y0F5d3RTcjJXcDBvODkvNnFY?=
 =?utf-8?Q?QszjlahgFpHgPt7e9OpjDkxCd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fb3e41-c7ae-4038-45eb-08db974c169d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 13:42:05.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBiAk/IXWxLnawQGiAh/AofJs8BnB0GzATOYfaGMeKGgtcyQvsv7T4lPRmr/aD3WopN58/iD7sS6cA1zquCvAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7648

On 07.08.2023 15:18, Nicola Vetrini wrote:
> On 07/08/2023 15:05, Jan Beulich wrote:
>> On 04.08.2023 10:03, Nicola Vetrini wrote:
>>> The parameters renamed in the function declaration caused shadowing
>>> with the homonymous variable in 'xen/common/efi/boot.c'. Renaming
>>> them also addresses Rule 8.3:
>>> "All declarations of an object or function shall use the same names
>>> and type qualifiers".
>>
>> Can you explain to me how shadowing can happen in a declaration? I
>> would focus on 8.3 here, and only mention the other name collision.
> 
> There's "static struct file __initdata kernel;" in 
> xen/common/efi/boot.c, which
> is visible when the function is declared. Since renaming these parameter 
> names would
> have been addressed by Federico for R8.3 anyway, my intention was to 
> address them both.

I understand what you say, but your reply doesn't answer my question.
Just to emphasize the important aspect: I could see the shadowing
aspect if the _definition_ of construct_dom0() used "kernel". But I'm
asking about declarations (the one here as well as in general): I
can't see how any shadowing can occur without there being any code in
the position of using any such variable / parameter. IOW if Eclair
spits out 5.3 violations on declarations, I'm inclined to think it's 
wrong. (Because of 8.3 a violation there would then need dealing with
anyway, but _only_ because of 8.3, if the definition is already okay.)

Jan

