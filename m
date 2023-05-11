Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBFA6FF060
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 13:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533253.829754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px47K-0003yA-8e; Thu, 11 May 2023 11:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533253.829754; Thu, 11 May 2023 11:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px47K-0003wM-53; Thu, 11 May 2023 11:05:50 +0000
Received: by outflank-mailman (input) for mailman id 533253;
 Thu, 11 May 2023 11:05:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px47I-0003wE-9t
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 11:05:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c822477f-efeb-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 13:05:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB9972.eurprd04.prod.outlook.com (2603:10a6:20b:682::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 11:05:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 11:05:44 +0000
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
X-Inumbo-ID: c822477f-efeb-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOj+6N4i9HF2G0xj47tRe8a2qzLq/qYHGgw5xeU+6pjuHOQRK9msuTOaL56pmVuaj5olY872olcLMrCcrI4Y0gGpCcRbKJROtiuY4UJkOVxKTwUx9MhykdyIOWGPLJQqLIKlu2zuyeQML16tOj53MFiKVuVx6bKmaw5EBwtcENY7M36XNrRnvsxR6jS2FikD/Oc+On9CyPiSuaPS7pMl1y9AEIeEEYIn//Q0ogiOk1MVA/dBZA39Lkrk6oRdptvYA2Mt9rJ41JtdpDNDeyncZKyswGtPnPnJW7Ljs9Vcw/F50BFaoolD2kPItutc7TL+Kaf4hjO9/immed/liiU/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1l1Gp6Ou/lbjv/gS/K182mAIX8nNebhtPOUDNl97VMQ=;
 b=OPioyROvLAXnojglmgeTruCZIEMRqy2vn58NRODaQlco9/hCuMYIL6BMlKsKt0IuoAw347cP3lsJU3IDwL2oO/y2kw22jpPb6HbHGC2DbBQjrKUl2stQZWmqezfTrEVmwzEpDrMWRu9PQipgRBppqdBZXuworLqNzo7bH112B1eQ2z1BdOucij1Za5s6hy1VgSVajTxtGU/5wWHSSY74eCQpf1F+QLp+rBqt33nJ5ZNGWoa3MP68ynfJB6LRiA++3HQx1hdrg6k8r1GwdcnzWtNFeEEpdbn4ZjxteCi4Q8GSsMMJKRR5pt8tMdkXdIaNoqCjS6I+ftg/WC1cW9BvLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l1Gp6Ou/lbjv/gS/K182mAIX8nNebhtPOUDNl97VMQ=;
 b=sr2S/vFaSEUjdiZvATtXVmC2U40gAjI7K3lysozQDToS76PAGKgHdvkwC3M1IAcONZ5f2nIIZ8RBBlaa9h74onpa7YW3BQeoOaopqadQ0+pHk7oBargGP4D82rtp2K/eV5RtKtEOp9pW6iNzCxEzp/FebSPqIwue/66WJ9/yg5W3aZ4f2eWevTZfF0ZpMXIMf9zsEpQIpH0yitcgFoaASRtum37DJqpR2RX4QFKeLsGFi0IZHe5dGCQ9ScnxwaFx0IyJ/NnAm1Nt7HAlnPy88xFGn2kqDKDX3aenZifZegfNrs2QQRr7KwUhTfOGtwaL1ySkgf9TyORQu7ROs/7Fkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1489425d-7627-30c6-bb0a-ca1145107f42@suse.com>
Date: Thu, 11 May 2023 13:05:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/3] x86: Add support for CpuidUserDis
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
 <20230509164336.12523-4-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230509164336.12523-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB9972:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce3ed6a-575a-4e64-3d48-08db520faad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3dPWAFWcgoeqbi453qPSnCqMQ2pki8k15afj06uZMoJOCZLsXSIe5j0ijQcrh2nv6UDHuxhpCzh9CmhdZHpGkHb4YvRJT/vuCM99kXle8KRdD4fwCM5JHowUhmAosc2wOFJ0QhR+Y57UZALp1g7/oB81x0myb6ewisPaVmmXnH/OsqFiyM3ZdYj0ylmNP9H3TUNbBuGbmql9BOiPrAxgmwC5CuMnn1v0Ob/a2BzJ8dx7N3AeZCIRKt3APWo90lzcEPB/GStRVEOufp9w4O/aLgoZRCKLg7hdw7sEKFBb7hFCDPY4z1eMyOdlto9AH6Bpb9qSD/lYXrbYkw1WBwGBAVSYRXK1/6fXgJ81k1ITyKcrrycpHLI6IdnSP6NwBJeC11Dx1pgOyKS8wrNi6bAC/eBagAMXxvO0yUBmBScxqLGdEyJPcJSmw3EZY7S0wm7uwbekQfUOpSJkcX2GgJGLRMk/TJjBKNqIm7iDA61gpTRQ4l3mTrLeWbT4jvyYWdVreBnnxL0jS4Y81m6weFKAX6CzkQxfEAaUL3ZOs0Gx4EgdEftTC6k+vNLklciDZt6Vks2pBt9lASzra7eyGdmodNTEgqNq+cuDHnX4vBYY3MWcQfzvKQdQPF0bMC5S5WPvs6dxIs0gXl6pQVueJ6pVLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(316002)(2906002)(2616005)(66946007)(53546011)(4326008)(6512007)(66556008)(66476007)(54906003)(41300700001)(6916009)(6486002)(6506007)(5660300002)(26005)(8936002)(478600001)(8676002)(186003)(38100700002)(86362001)(36756003)(31696002)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ektmSTNhTVNWK3BqL3MyTXY5WGh6cVlDRWlidmo0dTE2L1l0V3QvS3JsdCtl?=
 =?utf-8?B?Z0hjeGxhS2RyWHBRaWs1T3JtMEFCTXBIZUtSK2s2OE05b21wU1hJdzFsaVIz?=
 =?utf-8?B?M3JNUFh1SXpnUGo2UmtObVJycmpweko2OG15YlB5VktwdHRJTUFRTnBpOEZa?=
 =?utf-8?B?SlJZNW0rZzc2RU00d1VsaHpWWVJiaUlsWFJVMHl6eEhRU1FUMjRBUyttUU9O?=
 =?utf-8?B?TDZ0andnYWwzNlJ1NERpdmRZdzg4dVl6Y1liVG5sVlFwQ2ZMTHZoUGFQUDZj?=
 =?utf-8?B?VmY5blVIcjJZdXBmYzRXVzhxOUl2cmJrRElqZDU1ZW9JNDAxbGF4M2J2WGJO?=
 =?utf-8?B?d043dmZyRGYrRFE5VDFqeXBudFFwNVhtbUdVemIyN2dEZ0kwbmxZaFVTeXZs?=
 =?utf-8?B?TkdVMytKaVBmOEFwdlZYZzc5bGplS3JMMStFOTJDUm1RTlBHS2ZGWDVQNzAw?=
 =?utf-8?B?S0RXLzk5bk1rSStKazFOOVZnaHBKU1YzZ0JLRkhGWkRpaTJmQUN1b1ZNMzNk?=
 =?utf-8?B?L3lwTmRGVnE0aldONWFFNTBXSEw2UVV3WkVaK05xVjBZcksrUmxVSjF4R0pr?=
 =?utf-8?B?R2E3bmRsTVlYZDQwZE1tWXMrOFVSbW9oQWJhY1kwdXg1VG9POGNQc1B3Ukh6?=
 =?utf-8?B?S3hmUzlKQ0poZ2lvRXdISE5kVVFnNlA0SE9EeVVtN1g0eEJGa0NySEJucm54?=
 =?utf-8?B?WkZYdXJuWkttSFN4WlhZdXpDcWVrQ29Gam9OcXpDZTBoMERkMUdjK0N0bUF6?=
 =?utf-8?B?NzRseGZLdUNDMm1CMjNFTkZaS2o2REVMNXZJMEhHck12ekYwV1VHN2I3WnNP?=
 =?utf-8?B?TGJycTZxcnAySXZ4SkQyQ21QVzJqQy9VaHp1T1JaWStEN0g0UVBySStZWFNK?=
 =?utf-8?B?UlBYbGcySWpKWnpFTWU1ajZsWWljZzF5SStCYWZqYVZlVGNoMkpNY3R6T0pw?=
 =?utf-8?B?THNpZVR1TG5uam0vWDhjQ0pHTFBCSkZXcXNIT0paZTVyVHFJL1dESkh3eFQy?=
 =?utf-8?B?ampuZE5MbWlqYjY2UlpFdUR3QXlZdEdrUGxZeWxGTUVRSEpYSkhiMUl1dXRX?=
 =?utf-8?B?Q1VFTDZ5YkhUcm9sZSt1SVRpUVJjNEF3ay9rMjVYanZybHAxUUVPbW1QN1BL?=
 =?utf-8?B?Sk5MSXVjZldUSW82MitkUlc1WmdXcHlVTFp0aFpsM1kxSmkzVHJxVDdaVFFv?=
 =?utf-8?B?S2tWd3lBNHRHQnIwNXFRUkNqcnVRVW95NFVXOXExN1RnRjhLaVRoQVNiRGF3?=
 =?utf-8?B?Vmd5MUpzVnZSRDVCS0FkbEZBcVdpeVNNdnN0NTJHRmkydG1PYzd5SFAzTGRz?=
 =?utf-8?B?aTBaUFltR2ROeHQ5YktIYzZtbkpnSHBWaGRYbVVhMjVOak1IVWJSV00zdEtl?=
 =?utf-8?B?TTRNT0h4S2FGaHhqNThiZklBMVBPenl1ZC9XeWR4blZqTDlzdFovM0hucFZF?=
 =?utf-8?B?bHBpOGltbTV4cEZadU1RYmhPYmVlaS93ejYwdmNtdzZxYXlMQiswSkY3cnp2?=
 =?utf-8?B?RFpHUFlVOW9wOWdIZGJJV2hja3pnRFh1UlVxbWYwb3lEak5TTVp1S3lEMGlk?=
 =?utf-8?B?K21McGJCOEVtSkJvQVNCaGk3amR1aWVVU3ZSWnpPeUNWS3NEYUY5T1Q2R01Q?=
 =?utf-8?B?Rm8raWw4cWpMalI0anluN2Q3cC9MNUtSaElQSTQ1Mlkyd3Rtc09HWFQ5c29m?=
 =?utf-8?B?NVllZ2FMa0h6WStTclN1dmp2Zi9vdEZMZWVhaEtjRlhuM1BBSElrdmI4SGJM?=
 =?utf-8?B?ZUIycG5PT1VFblkweEU4V01jdnJzbTNXdFBvdVZXSnM2cksrWlhFTVd6QVpI?=
 =?utf-8?B?UjJTczFCWGJoYXRaVFhJa1NOZWNnL3ZNR0RPdmt0ckNiMTBUOWZtWllrbzAx?=
 =?utf-8?B?cXpJQVN6RXNkcEdpbkp1dWR4WlA5djFpcTF0NG43eDVpT0llNXFNSktSVVUw?=
 =?utf-8?B?STlodUJpcldRTkJ5ZXRFRzNpbmRuTnNjT3FGSTNoMUp4VlZuM2tkQzRaYVg3?=
 =?utf-8?B?amkwUzRhVjJzYkwrR1NJc3FuNG94K3RKWGdSaU5xNllobWI5bDFSaTdWcG9a?=
 =?utf-8?B?akl0QUtwY052UUtISHpmSEJmeHg0NHlWbUtiVkJRQVJrN0pUQzlkTUYwNFpi?=
 =?utf-8?Q?EXXcyNTTxKi/Bhbr5KP9Q5eGn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce3ed6a-575a-4e64-3d48-08db520faad8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 11:05:44.8955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ODPv7LlPFWmqFcBu2iBO4zNq3hLUPpxhStMSJbisnjXxsf7zF7RZxzUJKR00Hw9c5r/VeO+ZK2+cro3Ih2xxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9972

On 09.05.2023 18:43, Alejandro Vallejo wrote:
> Because CpuIdUserDis is reported in CPUID itself, the extended leaf
> containing that bit must be retrieved before calling c_early_init()
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Looks largely okay when taken together with patch 2, but ...

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -279,8 +279,12 @@ static void __init noinline amd_init_levelling(void)
>  	 * that can only be present when Xen is itself virtualized (because
>  	 * it can be emulated)
>  	 */
> -	if (cpu_has_hypervisor && probe_cpuid_faulting())
> +	if ((cpu_has_hypervisor && probe_cpuid_faulting()) ||
> +	    boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)) {

... imo the probe_cpuid_faulting() call would better be avoided when
the CPUID bit is set.

> +		expected_levelling_cap |= LCAP_faulting;
> +		levelling_caps |=  LCAP_faulting;

Further the movement of these two lines from ...

> @@ -144,8 +145,6 @@ bool __init probe_cpuid_faulting(void)
>  		return false;
>  	}
>  
> -	expected_levelling_cap |= LCAP_faulting;
> -	levelling_caps |=  LCAP_faulting;
>  	setup_force_cpu_cap(X86_FEATURE_CPUID_FAULTING);

... here (and also to intel.c) should imo be part of patch 2. While
moving them, I think you also want to deal with the stray double
blank.

Jan

