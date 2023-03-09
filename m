Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79336B1FE1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 10:22:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508203.782610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paCTV-0005E6-HP; Thu, 09 Mar 2023 09:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508203.782610; Thu, 09 Mar 2023 09:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paCTV-0005CK-Eh; Thu, 09 Mar 2023 09:22:13 +0000
Received: by outflank-mailman (input) for mailman id 508203;
 Thu, 09 Mar 2023 09:22:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1paCTU-0005CE-1E
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 09:22:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de311133-be5b-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 10:22:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7021.eurprd04.prod.outlook.com (2603:10a6:800:127::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 09:22:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 09:22:08 +0000
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
X-Inumbo-ID: de311133-be5b-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGCYYYvMo82b6oKKhoQOxOg1liCfeIXby1vnH8kDgT+TJOBWwee8IjDxBxqg0nhV8bw63Yo47SgyN7PTYMLov70LYKa36++dCzOjGDt94AxIslkYSX1auYLKGlBb3zlXazqLyvh00nvAsMcsezlJcmiJtoKWKVJ3r76wJUymFXDX7Ba5k2wQTCrsKM832wsHu4ImEzEaZ3VjscCHryoL/xrMX/BMHjeaP2tYk7LsgHKwmKDE2Y5AiOOrdKNt+WIZBWsaf7zyj1KntiI3P1Ph9/pMCn/ctKR6/LTnUGd55DUjg2kC4mAhgkyEtvhq+SH0VtQrSLKAxKDdGuVjGoBTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+kAjNr7HBiTKYqn1aqIv4fQQ5WD8esYibyWSFBwRzY=;
 b=iNc2krqTD/yIiPa12ZEXZQPFvK9EABIScwp0yjPe2mcDFjdleXFL3kxkth0F5cwwYNYKA6U7Zx4JP+iiog7er8NK0if+nD/J6dRUEVVxTl9ffRj060pwIM16LMEjAQJwOKI0/1FnM8X7IhgK06RMAst2+H3+IN2t1kfj3vpTblxd0Wg8MW1KWfDv1TCubkBEoSuHq8SFIqva3U7sFuY+iFE8tQoOoQeiO+RCfrQGr/qbvB5cW85hRW9lig6moOT+tbITZljk6v9EjhJqSUI6Dxyq3l7OlECUCkQBYo8asYl5qCvJWNSYAegbeadTMMSlzEE6iqePUmbI+BF0GecRLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+kAjNr7HBiTKYqn1aqIv4fQQ5WD8esYibyWSFBwRzY=;
 b=IjenBqD3+DTB+Fx67t90PpkKI/BaFTyA4cnOt3cP4lv/JWUdYWJdo0SAgrtVTT78QM2rB3J1rRB3ZSHXnzbvgwSnH+5iNNje5YGDY0s1V/8WW8/ksW2/gaP2sVYauMxYmD3ItkZv7LST9xH+xyhqt4kFX/FulFkP7G3HneVUIlx4F+Xol1u3A0oJGZZ0YWIAEquNDVJV7kX2P/Z1JqCcPTM17FyjoNyJfp68Xki9lLtCuIZl9DlZLGxUJ9dW/oQ1H3MrcISg7An33V6dHx4ZsBSXXPauD/EQaos/ylzbIvGHs3PQ+duVO0+HHzwJNfUhLs27VmE1rHn2xtBwPRDT5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1cd131a5-cde5-be33-4398-5b617ccd00e1@suse.com>
Date: Thu, 9 Mar 2023 10:22:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [linux-linus test] 179511: regressions - trouble:
 fail/pass/starved
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <osstest-179511-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-179511-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df418a1-3a8b-4593-5235-08db207fc168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wWMmqVwlo12KIXGkxaAeERdEgWVH65jpGGm3XAbBWjHDC+R8cZW4XbEYq4/wb1lpsjmEfKwMhyvlhLlNTOEkd5YxN/SYdULdyEckoDcK5quqG1xtfQdHzboPx00okv2XMTHWVv3KOepNq75Le5ncj/CdhBTXhBKRYr8R4h1K9WOmWsjJ+cWq+ainzdtHvqzn41gSCRUllis0Eoq4isAw5k6W597U+Qf8s2taQV2sguCD1wY1pn8pQw97o6CeX+9wSxcjvPGZMRuiBIIcGiwPNY7e52zJPNnhYPHag09prjoSdBrhvAxj9+VKCzImjRxfu6M5bb6hwJnPIthGuTURYjVHPwOwJnZJhZT/eDHsKC44o3N2IsdNh5TuwNgtRXagJB/9K+Nj1mCnZF/27oMDyt9O13fyuRU5GSLeyqHYd2ws4P8gHn7HKZePB77pRfFTM5Aj5fQRo5rT2oWD0fnL0VsbJ6TZO+sJgAg+PizN93utPVYNPPQKPxLMq7NaggDld3Oqv559GxapOhcQEElFaAGB0szMwbKUhbe8WO3BCcINfuRviZ2uThM5r7n6A23HUfFP0FuSSxS2ghsqKME/ObUDv73+9b7/5rprgYTIU8nKQBetAgVVAgldoU47sKlV219XbqNik1K10YpFgUBJ1IICDmQzdfs1M0zrcia1c+r7NiBjGR6vj1gWrfTwYFQnvqcu3hQ6KVCd5SkFfP4+TvB1Cd/X33PSonWM6lI+cAA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(39860400002)(376002)(396003)(346002)(451199018)(31686004)(36756003)(38100700002)(31696002)(86362001)(186003)(6506007)(26005)(6512007)(53546011)(83380400001)(2616005)(5660300002)(316002)(966005)(478600001)(6486002)(6916009)(4326008)(41300700001)(8936002)(2906002)(66476007)(66946007)(66556008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjBXcWV2K21LN2w5K01Ia3hEWkFwU2ZJQk1SU0xMZis1QVF0Mk1EV0Z0YzdX?=
 =?utf-8?B?WTRNOU51TkN2alg5RzdNV2ZzYnlQdENZNXY0eFlaMVBKWlZDWTFvRFAxL2dT?=
 =?utf-8?B?dDR5cVlDZ0h5M3pGVjU0bWlIY2oxalNsZTZnQ3dFQmZQVzg3WkVPU0Q2a0xJ?=
 =?utf-8?B?VWZ1TnVMR2d3cERsbnU2RWJBR3pYaE5ZVS84T0RwT1BlUWpwdTFzUVRFK3hI?=
 =?utf-8?B?NzgwT2gxRU81NVlXdHo1bjFRQ0tzdUFJMlZRUUxqWU9sRzhqSmdhMDNKOVFS?=
 =?utf-8?B?dFhKaXRvWHlLenZKSHIrWndQemF6U055ZWRPMy9ld0RhL0hadHpHV1I3VHNT?=
 =?utf-8?B?ZWNaeXJHT01MU1R0ZzhQbVNNOTVOQmFINHNjbzZldVRIdmV1Qk5wNUtnWnRZ?=
 =?utf-8?B?VSs4Zno5V1JPOXJadXpLZ3U2OFhpb1lkUUNtcWI0UjFVUkp2N0RrbVJZY0FW?=
 =?utf-8?B?ZVR4WXpZQzNRMy9xQjVSLzJualNJLzNxcWhlUmNFOXJjUnU5YjdoaWpudW1U?=
 =?utf-8?B?cU5HdXRnSU1uMzM1WVRMRUY2RWVJZUl1NWlSRHQ4ZkZrYU9Kek1BSGdMWUZn?=
 =?utf-8?B?dTZaRVFTcVpGTTNocm5udnRuUTNqTnlqODV6Y05wMkVNQ3pjeE1oc1JkSVQ1?=
 =?utf-8?B?Y0txK0F4YzJEcTA1bjY5ZjBtVkhEd0FGTmtwbXJzNk94dG9vSERYOWQvTjM4?=
 =?utf-8?B?QWdFRlZwMUpCV1FFcXVqVW1KZ1A5bGNvUXpFV3J4VUxYcUE1c0ZYdkJKRTcz?=
 =?utf-8?B?Q3FsMlY4ZXFZNEwyalYzNUNsdm5USU0zUFUvYmRvNFJkUkdqTVJJcktMRkN3?=
 =?utf-8?B?WTd1bVVyVm5IdEpyNGpYaUtoaU56dDJwbC9oa20xTE9PbzBvMGkvY1d2Sldk?=
 =?utf-8?B?emJ4eW1sUkQ2bTlCS29rejRaZ0EwYmJSeTdVZDA2RUNhT2dGcUw5NlNZNzQz?=
 =?utf-8?B?UndpSjBmaUJ0RGc4TnVwMjJyWHBsMDhaZ09IbW9pWE9lOEx5dHREMXlDTVVZ?=
 =?utf-8?B?Tk9DOHg2c1JOTEVwTjFESlpuQ0hKMEM5ODFUb1F5NzdNdXNDVzRyK0Q3VGFa?=
 =?utf-8?B?WkZqd3d6VFRLcmtPWHhCMUxyaFRWRm9CUnd0OGkxWWpnUHRQOVBiZWtQSW9Z?=
 =?utf-8?B?OTN0aEt0bG91VWR4YXNBbXZMS0VnNU1tU3IxWDRKdHpEeGQ4aWoxNnZ0dngz?=
 =?utf-8?B?emlQeGx5NkY1RW0rbVBPaVI0VTZkS1pDTWd2d0VTNjVwamMxSFlHLzQxWW9w?=
 =?utf-8?B?bm9Mb0NRK1N5WVUxcmN0ZmY4dUdBR1dlN0hmZEYwOVdFMTRtQlkrVlBjYnI0?=
 =?utf-8?B?WHJ4b01kSG1ydmFEY21CS0syQmp6MGpSa3VodTl3NnhaeUFHV205UitaUWpn?=
 =?utf-8?B?MXMwak9ZeGd5WWJGNXo4Z0NOS3pwck5mcjdNa2locEY4TTgvRXhQdTNOd1g5?=
 =?utf-8?B?M3NWOXlTNU8xM3htS1cyY3IvblA3dmJ0bkdObkFjQWNLdzM0dk11bm5YQ1FB?=
 =?utf-8?B?bjEyQlpLcHYzNnJDQnJNNEp0V2djSGVjYzV4dkgrQVZOeVJlUklzVEN5Wm54?=
 =?utf-8?B?VmxVdjVibERSSDRHa1V2NHB4QTRrM0FrWmVCNW9SWmtOQnRSdnh0dDJ2RVk4?=
 =?utf-8?B?OW9QNjdUUG9UOVN5R1I5LzRIMVlIL3hUNlRkclZhRzl5czIzQSswUlp3dlhG?=
 =?utf-8?B?azU5azdJYkRSUUNRMTI1d3d6aDBDNzFMWWhkSHVYMENkVUM5VThLWXFvUUI4?=
 =?utf-8?B?cDBpZ3hVTFJwa00xSHhNMmpjN2haZ0FkSy9Oa0phN3NwZUt5TjZubHlyZ3JQ?=
 =?utf-8?B?Mm9LMm5tR0Z1ZCtMdXd6NmFLeVlmMkZHVTZWRWVDd3NiN09kUWZTR3lWOUFM?=
 =?utf-8?B?QVBwd3dabTdkelB2MzQ5Z2tDRlFZK3FEMnFMd2tESFBKdXluc1d4UGxvYnlP?=
 =?utf-8?B?K0ZBdDA1WFYxN3ZOZWRpQlFSbnZMNmtqVkpSczl6VTllbWs5Wi9Bc1l5NU9F?=
 =?utf-8?B?cElOMVNYVEphc1JnZXNMZVR1S1JaRStsS1FJZEdvb0kwcGVLZ3FVZFlscmFH?=
 =?utf-8?B?VngrbXM0NGh0enRBdWR4NkUwV1NnN0kxcElxRHBzQ1NGWlp2MzJDeUlRbnRW?=
 =?utf-8?Q?iHWYO7EqMAVgt91THPAmX6YSp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df418a1-3a8b-4593-5235-08db207fc168
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 09:22:08.2238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFyr4qJYd42q33NASPSMA3GZvCBMY3/X0SC/wRE+yMGwtF/UUk5IYcv4tQQBRXOmXnJppTc2if6nPlpt6kQ8Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7021

On 09.03.2023 07:58, osstest service owner wrote:
> flight 179511 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/179511/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-pair        25 guest-start/debian       fail REGR. vs. 178042
>  test-amd64-amd64-freebsd12-amd64 16 guest-saverestore    fail REGR. vs. 178042
>  test-amd64-amd64-xl-credit1  18 guest-localmigrate       fail REGR. vs. 178042
>  test-amd64-amd64-xl-multivcpu 14 guest-start             fail REGR. vs. 178042
>  test-amd64-amd64-xl-pvshim   18 guest-localmigrate       fail REGR. vs. 178042
>  test-amd64-amd64-xl-shadow   18 guest-localmigrate       fail REGR. vs. 178042
>  test-amd64-amd64-xl          14 guest-start              fail REGR. vs. 178042

While the xen-boot failure looks to be resolved now, there's at least
one further regression: Many instances of

(XEN) common/grant_table.c:2982:d0v3 copy beyond page area

can now be seen, which I expect are related to the test failure here.
Recent netback changes look benign, so it could be the sole recent
netfront one ("drivers: net: turn on XDP features") or something
elsewhere in the kernel (but presumably still in networking code).
The failure (and log messages) also ...

> test-amd64-amd64-freebsd11-amd64 13 guest-start          fail REGR. vs. 178042

... occurring for freebsd suggests against the netfront change, though.
In any event ...

>  test-arm64-arm64-xl          14 guest-start              fail REGR. vs. 178042

... the issue looks to be arch-independent.

Jan

