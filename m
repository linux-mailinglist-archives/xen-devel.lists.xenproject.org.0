Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893467A0201
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 12:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602209.938634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgjxa-0002BD-M0; Thu, 14 Sep 2023 10:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602209.938634; Thu, 14 Sep 2023 10:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgjxa-00028l-JS; Thu, 14 Sep 2023 10:52:34 +0000
Received: by outflank-mailman (input) for mailman id 602209;
 Thu, 14 Sep 2023 10:52:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgjxY-00028f-Hv
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 10:52:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd44f132-52ec-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 12:52:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7789.eurprd04.prod.outlook.com (2603:10a6:102:c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 10:52:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 10:52:27 +0000
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
X-Inumbo-ID: cd44f132-52ec-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbUY4fPRR8k+vqLBCiLrfuJq7Tjk0S8mafF2nDBr76is70anPErLVh1aVpAYFlHeI1fLwnoKgPvEM/aKgtDIEDITl6dyFJGmJcqGAH/RJl4J/M1kqmlNQWqrrgJ/NjtAre9vYYHk+ThclYBEbtOQJFdY2LGoOKvaKcbxGVd9oQNPWvFSVJZKpidpUa10etQBBb8T+aEEyg32V9owSL1ELlwiBDh6cWC8yoskmsnIkQhvQRQKBuoVV8/UXIyI5vIMgW9FDPM0hzu5oakzMi3O4h/KhHyEkcTpuaXKFiVi5uuSAebU2SSCNi3IvB7Kqetf6czij6IjW0eI7B+mFVKjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCzOofodfWD6fPSmHYx/JbiHyD+NVIz1rT5NpRzq+sY=;
 b=Bh7nr/20UQBJYC+r0wqjzp1CcK4a7TB2X99OylaWALSGeXZvgZuGFWBcQ4ImVvzEP+1b26i8TqqrkeWAHy7ckd+izQLsmL7E9Yfw+Vzz8saGaVa2O2YMcd8/NdfGU8O5965QXbcFE/HUHtj17omjcCYLGg2JNbmVdOZno9S4pxuCxe4t9TVvT47MhEAnAQ/6Jis47q/zyXoNGSNk2oEOFOjN7vlmKFRNF+EFLq030lxIXpadpmOz0Wmeg67MxYB0GEOQpVeRbR0Gr1fycrcsdUEJzeKAArcoIWKwg4RT3HRiJSiAlO948VDbIuWO+34RrkSDWOCTiMFMK0L9KnJX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCzOofodfWD6fPSmHYx/JbiHyD+NVIz1rT5NpRzq+sY=;
 b=yGhvnDdAx2KpKF8o6hmyW9OHz7WDonTUFR/+53qkM5rCrJfCXt+h9i/f5HH+v8hvxUdQtP+7clPyJcIBfJN1Nyu83e1NxkknSAt+hjT8JcAcsWV9DIRobqDSiMmujKQ+TM/jRCevXOJpp9mHfhC6ld65IEfmcynV0NLi2rkF3TiFN8nVCzVN/SpChQyBs+LmWdUenrO9im2eGB77oJpIHGcPvBQOziOKvoKLoCbehlNNpSSdhR4UbH1ATYatqgZZHwVymxr0Fxrbf8rlsEN3qtAr7k34jjYd6YFR/tW9EA2zbERkFLR4Lkvwxq3JidjKSqcsILkXuGYs+fW1VqVHaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f60a8b98-0358-6dbf-5c60-ff0cfbc715a5@suse.com>
Date: Thu, 14 Sep 2023 12:52:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 8/8] x86/spec-ctrl: Mitigate the Zen1 DIV leakge
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-9-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230913202758.508225-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9c24d8-5ede-4f87-3003-08dbb510afa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qoduVvmhpX2hofHAUb393BiNwlOaxfwTpMIVGtRNezDd3xV12xUGEaPdPZSZi/Kr6fJAKCOUWHsa33RGUgHiGKQiejE/LWZ7E/1+lEsvf69DUkN+Z/hb0JSKoMW3wKEnR+WMsK1syFw02wvX0Exyu4/HH327xrSdm+mp7STEgjLJ8UqdcmPFLz8uO3lY93cDBiz28ebstX3NGggAstTFzLVH/31t0ygzcpGcXNnY2/15/7gdGFNnqD3w3t9ce4j1eRyztSLPM51dexebjR34WmNZPe3R7BVoaRsD4iKoDwxdIzeHKIF0BTzTrS5NzbBncT7YbXug+x5eT3GQYS/Tom0IKWa15a4oSqcUZ4jyaoAdavFoAtRzC+QxRkKDRNLYm+jo2AyEXwtREhd3FPqJ29m+4IHv+FUYSpAvw8b6/XoUV71p7AoVOlPnDtpH2fi6FddvyfYtsCB25uqWGJ1VxWWHzTgzcE7o/7nkh+aFiTPi6emdTZ+E+5fNrBnXzD1pVb8EGeiYUDM0e38rD1vZ58ijUt8SG/sqMZno1Zt4AbMsseB7qpxxDTcNbDpaFXgYzwYYyqnx4WrAux/GNj0ds1Mf6nboQgzLd/i1C8pQ5pJ2tXS92CnnHB6v7lgtysov6NxMRVeTwgVyAQctJQGeHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(186009)(451199024)(1800799009)(31696002)(86362001)(8936002)(8676002)(4326008)(5660300002)(2906002)(36756003)(6506007)(53546011)(6666004)(6486002)(2616005)(38100700002)(478600001)(26005)(6512007)(83380400001)(31686004)(66476007)(41300700001)(6916009)(316002)(54906003)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEZ4MDBkNTNLcmp1a1ZJTWtyeklwOVFMaGtaZks2RUR6ZnF3cFpMMmlwUjV4?=
 =?utf-8?B?WnM4NzJUYnp5a1FmaHliVU05YTYwMUNzTEdzM3ZJK1B4Ly9xeSswazJpTExO?=
 =?utf-8?B?cXE3c0EyUHdSV1ZCdDBRYkNwM2ExM2ZOWk9WRUlUVXdGeFRSY0F5Qkd0Mnp2?=
 =?utf-8?B?NmpiM1F5N1ZDM3B1QUlFdWdRUkdSUkpXSmxqWjRNWVF1U1puTEgrRzlDYTVs?=
 =?utf-8?B?Q3FBcC94Ykg2enVMWURTMGVOcVQ4cmZoeXBrSC9abEQxM3RVSnp2Y0dZWEti?=
 =?utf-8?B?SGRUZUVNTGhMOS9mY2JVV3ZYOTVtZ01HTUhoNjFVaVY3VGl4L0pIb0dXWDBD?=
 =?utf-8?B?ckFCcFEvNTIvMUNNWGpsa2lSQit6NGRJTXFPV290L0lPTHdKejlFT0pFSWJt?=
 =?utf-8?B?ek1qVFU1WStFMjllbldRTUJGeE9WMEdYUEN3eGhSdy9ZK1Q0Qzg2TVZiWEJZ?=
 =?utf-8?B?d2xmUGhneWdBVGowRlNLM0dDL2JZRTdWSmNBSXR2Y1Q5MmIwdGYrbzVaQ2ZQ?=
 =?utf-8?B?WXZQQjB0bHVCRXdkNHR4MENaRXhINHd6Y05lRmJkQTNLWHdlK3VSZk91ei9G?=
 =?utf-8?B?K1Zld3RwYmlFSmdHYXFGYnRJZ28wbGVza2tKc1lTK0xuckNlZkpEV29MR0dh?=
 =?utf-8?B?Q01uUHJWY2I1LzYvK1pVb2ZBV0c2TGVkWnFZY3dlKzMyeGMydFI5WitkVmNG?=
 =?utf-8?B?ckJmUG42WEROUzQ3Ry9iZVlLbnVxK2wyUkdVdVVJQXJ5MHFaMndxdTMrY2tx?=
 =?utf-8?B?TndKZ05Dd3RZWXFLU2hHaGhCMWkzVld0Q3VkREFqWVd3Ny9BWG4wMy9VK1Qy?=
 =?utf-8?B?Um9ZZmo4REYweUNIZTNhakw1aGhFdEpxcVBJWDE5NWlSM2RzTmFxRDgyVEl6?=
 =?utf-8?B?b2ZWN3R5a21SMlJucUZ3U21uTlpSRDV6UHltYUpjQm5yMGJSUWRkM1BQZG9i?=
 =?utf-8?B?dGhrUGV3bXVxaUIxMkl6WE9xSHpkYmxuZmV5ZjIvUlZKSTFlZlFQV1ZWSmFt?=
 =?utf-8?B?eXNTYmR2ZEtqaTBPdXIrUUVnTk4wQTdsd2VkZTVHVWsvUlhDekFOWmkrWDRn?=
 =?utf-8?B?d3JuNEJGcjZlNU1oZW1CMjh5RG9aY0JkdW8yUHBiOVE4NXdWVlYzaWhFOTJJ?=
 =?utf-8?B?WFU0R1h3T1EycXNneHJkSzNiVFNScHEzSGlRV0dCTDk1aEwvaGRQdG8zdzRX?=
 =?utf-8?B?YzFoWExpR25QRElKWG1LUkNjcWR0Y3dDdURheW5GQzdrYjVxdHl6ZFN5cmV6?=
 =?utf-8?B?djZQSzB3bzAvOHBVS2NBdUtVcGtCaUZYamV4SkJ0WWpvVENFM1hhczErcXdW?=
 =?utf-8?B?aDBydVlMS2lTQ1JiS1dNVjY3T2dXY3lxb0NtNU83MWNkQUowRkpOclNlZUJY?=
 =?utf-8?B?U08rSHhGWXVSdjlleklLZHNuNUtYUW8xUENhT2xYUmN1WXFJYkU4SFpCNjVI?=
 =?utf-8?B?dXhhUmJrZmo1ZUdYRU9xdUMzRjhUUTVMSHRSKzVxWnlSaFRTbXE5aEFFbWRP?=
 =?utf-8?B?Q3pTclRYbWV2TlNlNkRRWFQ2OS8za0hUZzU4SjR4bk9sZy9aaFVPQlhjS2Fz?=
 =?utf-8?B?NTdaY0VkazB4aUc3S25WOC93K0RiaDM4Uy9lMzNnN3lGL0ltRGhVdzc5cjVD?=
 =?utf-8?B?bWdpTnNUL0p1S2x6TXdGWW9TVS9JenlFNHNHQkliS2NwQnNIYi9hZzFSekxI?=
 =?utf-8?B?QnFZelNwN1JlU0JmRVRDUm5saHlkQmU0UmllSGJUcHNHVE5WNnhnRm9rWUZR?=
 =?utf-8?B?SDE3QTNob2doL3lGNFhUajZBUG5nZFBWVUNHNThiZ0ZDWVhzZG81cjlvMlpt?=
 =?utf-8?B?bE1yZjF3VHNIK2ZXdVhlS3NOSlA5elZIblJ5NHErTjVJcWZrc1FlMW82bGRM?=
 =?utf-8?B?cjcvTkE4R0FzbnJsb3VLRSt5SlhkdnBJbUhuYTdiUWNKaXdmcWE1ZklGbGhK?=
 =?utf-8?B?SFUydmt5MS9pMHBNV1YzR0x0dEtVTDN5SFd4VkYxVVUzRFJHQzd5SktMdDJW?=
 =?utf-8?B?Vy9sd0dhY2ZaT3lXWXNyREtQdUFHdkxxOFhzVkRnaFFoWGg0YmI0U1haUkRu?=
 =?utf-8?B?OG90dVFlNFRqSTBJMTZZeW11ZHhnU3dpcmFJWkdscHNLR0RCU0NzT1ZVd0NI?=
 =?utf-8?Q?Xz2PmeN7RWlGLmtgnB5zYrqNr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9c24d8-5ede-4f87-3003-08dbb510afa9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 10:52:27.5550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdJtvthDhunamQfygMsEO9R2iRDHbW5QrOHPTULMtssSrs1qmMGsBPS1ZBJDJZtGJ+pmJx8hLHSBZY+j6hQTkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7789

On 13.09.2023 22:27, Andrew Cooper wrote:
> @@ -378,6 +392,8 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>      verw STACK_CPUINFO_FIELD(verw_sel)(%r14)
>  .L\@_verw_skip:
>  
> +    ALTERNATIVE "", DO_SPEC_CTRL_DIV, X86_FEATURE_SC_DIV
> +
>  .L\@_skip_ist_exit:
>  .endm

While we did talk about using alternatives patching here, I'm now in
doubt again, in particular because the rest of the macro uses
conditionals anyway, and the code here is bypassed for non-IST exits. If
you're sure you want to stick to this, then I think some justification
wants adding to the description.

> @@ -955,6 +960,40 @@ static void __init srso_calculations(bool hw_smt_enabled)
>          setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
>  }
>  
> +/*
> + * Div leakage is specific to the AMD Zen1 microarchitecure.  Use STIBP as a
> + * heuristic to select between Zen1 and Zen2 uarches.
> + */
> +static bool __init has_div_vuln(void)
> +{
> +    if ( !(boot_cpu_data.x86_vendor &
> +           (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +        return false;
> +
> +    if ( (boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
> +         !boot_cpu_has(X86_FEATURE_AMD_STIBP) )
> +        return false;
> +
> +    return true;
> +}
> +
> +static void __init div_calculations(bool hw_smt_enabled)
> +{
> +    bool cpu_bug_div = has_div_vuln();
> +
> +    if ( opt_div_scrub == -1 )
> +        opt_div_scrub = cpu_bug_div;
> +
> +    if ( opt_div_scrub )
> +        setup_force_cpu_cap(X86_FEATURE_SC_DIV);

Isn't this only lowering performance (even if just slightly) when SMT is
enabled, without gaining us very much?

> +    if ( opt_smt == -1 && cpu_bug_div && hw_smt_enabled )
> +        warning_add(
> +            "Booted on leaky-DIV hardware with SMT/Hyperthreading\n"
> +            "enabled.  Please assess your configuration and choose an\n"
> +            "explicit 'smt=<bool>' setting.  See XSA-439.\n");
> +}

What about us running virtualized? The topology we see may not be that
of the underlying hardware. Maybe check_smt_enabled() should return
true when cpu_has_hypervisor is true? (In-guest decisions would
similarly need to assume that they may be running on SMT-enabled
hardware, despite not themselves seeing this to be the case.)

Since we can't know for sure when running virtualized, that's a case
where I would consider it useful to enable the workaround nevertheless
(perhaps accompanied by a warning that whether this helps depends on
the next level hypervisor).

Jan

