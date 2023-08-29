Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A821178BE9E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 08:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591966.924560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasQN-0007t1-3d; Tue, 29 Aug 2023 06:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591966.924560; Tue, 29 Aug 2023 06:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasQN-0007po-0I; Tue, 29 Aug 2023 06:42:03 +0000
Received: by outflank-mailman (input) for mailman id 591966;
 Tue, 29 Aug 2023 06:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qasQM-0007pi-8S
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 06:42:02 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2807c055-4637-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 08:42:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8265.eurprd04.prod.outlook.com (2603:10a6:10:24f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 06:41:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 06:41:58 +0000
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
X-Inumbo-ID: 2807c055-4637-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxlEwD9OwrssbY35I2k33g8FLVwCv8mXgv6nO3L70Z5PIenWcIKYvy9OJ/2ZX2AiUtCfBqC8CTpzwMx13nQwUzI17LZ2AncHcv8A6MF8XxNz6jj+1tGH+aHzIgnuCQnLXJ9rWn0aFfddfWZn1kcDFNa9w2uGw6dc16Sg2t8wGXgh+on2yT8LrCatrUI/FPa8Oj0Hy+9B8MHHHsxTay1DrUKBhFrY5c24FiPF0LK4vRYwiZ2eegBswghi1RKkU1IPM65BMCb3jwCm4dWVLYcUCR6lT/8ZJ6JLSEoz4xST/zp/pE3QSFBMuGzY+uvh8ReyyxvgtUtGeAxQoyIeEYApXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdt52Zd0rhzcQIirpE8rCngyAlOaVmnPTk++CSVKb+0=;
 b=HPyETWeKwhUo1c+qd9VlYmXEFrs5tDstjsorLlTyk5e+bNtyq2NxZi0rRUF2Jtc+B+ElpC9B4crxf4Sz3uluV8TJ2sfEk1jDqiq7gEW+UnGfpQa44HVJXBqoNDsF++oXYP4tyK2CQdOgmGgi29Vf6Iz7PTjCt6RV0FGYJh+vDJyCdyoeaojkXaZws2ZN/GVqcyWxyeJxaJ85tTjyG3bYF+9/d9gsS7ZZAQRuU3Ve1f/2SajJjTUqIz4lJbvOzFpthX6AFjE708P3pK5zSq/5t8Ba1L5Jb5Drq1+5d8PSd0B0oDaNwgA6zb6brD04spD+hH/jFJXdCJWYPsF/Li/txg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdt52Zd0rhzcQIirpE8rCngyAlOaVmnPTk++CSVKb+0=;
 b=ZPFkeSNPAjAolKDf2r8iK+J4E0iCa73+xvthHIGXCdGe1a6yWA5ksHhq22NSLLXlI/QYncqHfaSzjzzPvrAkCcVk0vT69kgMVgxQC1Ej5eMkvBCMKqNn2C64FiqRTRA40TjhslYDKwtLDNFX0H9j8Go7IXzvuRWEeIfsiKRLwLEKseFqh/iNRPxk5vhjXbcaIC4hMW0CGUO0OrcizIS/UX2WtqLg44WFABot5MAVV2lmPUOy0yFL7dfDxx2Pt2r/kyssaDqg/z9lfv+ge9SFYP4hDLtVmpy6hkuX7ww8Rc2y0BonUzsvfYqcTRPLFk03Ncn2zrVJEWWUtyy59hvysg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5e99d32a-d31f-d96e-fb6f-e1e459073071@suse.com>
Date: Tue, 29 Aug 2023 08:41:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 05/13] automation/eclair: add deviation for usercopy.c
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 nicola.vetrini@bugseng.com, Bertrand.Marquis@arm.com, Luca.Fancellu@arm.com,
 michal.orzel@amd.com
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <4039623dc4341758f383ec49228c1e55e5862b0f.1693228255.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308281512360.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308281512360.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 07be19fe-3f8b-4efa-9a2a-08dba85b0b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZRb0uTXhQ7kgpv0Kua7ODTZzaAgf3g7NiGJK8ZGCpC3E5sGYUqY7PauHXGaiFW4qGm/vRifl4sXHt5V0DhiukGDpfTvNE8McoIduD8XSoOTlVMSCQzc4VU5YA/fL05q7QAGYONUJaFTMNVZkLS43tpGDf/dP4iptNqE15wqE1wfsecKMQr5u9xZ1l35EmSlZ+01HRcEF/Nx4ac0aa+Tcp73dei/FGm4bD2HSgLLNbDDRZ8TwYbpOpDfhbw1UpqfFOyO7ignLKHif9MQ7JQhJ7WbpxIz9ZTKwGm48xGSX/RGNVTco1jBjiWveLPXvMBC4rNC72D1i0jzwtEu//a8Zd5OGCJE5Bgy9oGEbFXnzkiu/l23v2IiZ6SJbnQ5+5+b5uu6oHWWocQsGPfc/hJUqdf5d+Ag94L9X93zDrGo4K0ng2tB1YqFqkQJg8g3lyfH5aFhl9Yy6bxXlLAvB2nXDkqRwKU2XBRG5hvB4+SD8piutk+fLJ44AVkAnARnZ1WJLYR8jGY3aoc+aJvFIXohM0L4QKHA+2fvt0bRgyC+VvLYUxFu2hBUFDfX6frivND1RBUjW5vt1EecmM7VK+2BRsyLb85wKwgdpx1r2cwSvMfh7up2XbXa2Rh7uLsxK6qSoaozKr6k4HljAoWIf7hx5YA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(1800799009)(186009)(451199024)(478600001)(83380400001)(26005)(31686004)(2616005)(6486002)(110136005)(53546011)(6506007)(6512007)(31696002)(86362001)(2906002)(7416002)(316002)(66476007)(38100700002)(8676002)(4326008)(5660300002)(41300700001)(66946007)(8936002)(36756003)(54906003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEk4Qk9QeXRPY2FrZ1k3T1lYdWw3RFRSdVBsZEhWQ013RW5OdzVYWUVIUVcv?=
 =?utf-8?B?ZkgzK25ZSEFLMzEzNUdjeExtNnQrQmRqWUFna1d0b00wc2xHUXBoMWkvL3pM?=
 =?utf-8?B?SEQxR25RbEJmeDBCWlFidlY4UEJqNnU4ZjMyN3ptOXprNTBUeDQyL0hYeVk1?=
 =?utf-8?B?OTFKUjN2OUhvQnRGcS83MlZSNmFwWE8xTmtQTjZnMk9udmh5Z0c1UzBoZk8x?=
 =?utf-8?B?Z2RFSk9ubllqcmRIM3NIOEU3b0dnTUgwUUNJS0FGeU4yUncvUHdFN2xLdDJQ?=
 =?utf-8?B?SThCelB4dys2ekdDWWVGQzFNN0o2QjU5RXZ6bzBpY0U2ZjVPQnRRTXRIR3N0?=
 =?utf-8?B?SUQ1UnR0Z2JCQjdTUXZFY1MrNlhINDJ1a2ZjWDR4bmsxRUdQajZRWXpCUVJM?=
 =?utf-8?B?MUVKSElqZmdqanF1VTJ1b0ZUSDZrRGZUVjlOVDF0NCtYZ0hwNS9lZGN2VWEw?=
 =?utf-8?B?ZTZucHFKcWUxNnFnUmg2ZjBuQjRjZ2htNys0OEhTUFhpNFZHeDR2L3UvSFdx?=
 =?utf-8?B?QUpQbHF5T2ZiT0Q3SVhvSzZ2b3JvOTZ0Y25mcUJOMUwrRThid1VyMHBvOWdX?=
 =?utf-8?B?Nkg0T1ZhaTVOQ25uYzJ3Ym9ROGZPbjYvSjIxZEVtMFF0a1VRS2xqQU1hblp6?=
 =?utf-8?B?U1J0aS9VR3RrTGd0SGV6NS9MSEtYZnlNVTB5bFNFdmw0cnUyTkFTNlVCVDVP?=
 =?utf-8?B?SW5nR2lIaFBrb3BoOGlWL25EclNsSFJLNGZaYVZXTE56ZENSLzlIb043aW9m?=
 =?utf-8?B?OG03cW9ZaTc1c3pEeTFxWUc2U2pEbHhMM3BJQ2RTUzJCN0svSDQ2TnVrUWVV?=
 =?utf-8?B?ZUtOY3hQbTlNS252bTcrMjNKNTBpU0Jha3gxY0FXL3FVWG55aXE2Ly9ZdU1p?=
 =?utf-8?B?emw4S0R5UGc4ejAyVUFKc0kwVG54T0NrQUREMjAza3R4cmtOcWE3VEFXSGpp?=
 =?utf-8?B?cmgxcDZLd1JpUDZGMFRtOUUraWhzRFFJMG9tV0hkVy9hRnhEWExIM0VidUdW?=
 =?utf-8?B?TUxXWFNOTU5mUmVTaW9haE94dGI1dlphR3g3Z1p2cG0rbkpQL2MxOEtRVlpE?=
 =?utf-8?B?NEZRaWZjRU5xbm1NbWd6U1BhTHd2LzBqeVhDbmRpVU5WRmhvZFVLQUlrMGNH?=
 =?utf-8?B?TDg2Y2RhbGxCR1B0dEZMdi91OWgveHhDS25wR0doVjBhbDArNFNEaEgzNmkz?=
 =?utf-8?B?V0Y1bHpTaWwycU41WExIY2h0UHAydGVRQXFqV1FUR0o4NzM1T05iMEZvT1Rp?=
 =?utf-8?B?Y1BpdWxFSFNGaGhaVzdUM3lSdjVFcTgwU1huRjg4NFYzZ0RQQXNKcWxBM29v?=
 =?utf-8?B?cndXSlRVYjdBdFdaRytMVWRrdk9zTktjeDFhanc3eTVZL2FaM1ltZGN2S2JH?=
 =?utf-8?B?elZXQzc1T2NVYmxKUmcyUjZtbFBaZmxaeTVPVXdXVXZPZTFvN09kK1hOU3Vw?=
 =?utf-8?B?Rk12Vlk2SDdid3lxd1FoRWhHaVROeU9oUGZORlYybjU3TDFyMmVsZWthcExM?=
 =?utf-8?B?cXdxQlZvZVBFenViRnFNZ2xvdnBqUkxFUUpwN3Rxa09sZzFXSWJTTG5HWno0?=
 =?utf-8?B?L0E0UXJZdXVhMWcrcmEwdjJzclo4ZFBVNlNqY24xMHVsUkZIQ2NJNWhFdmtV?=
 =?utf-8?B?MFVWcC9FSExPTUtsV1VXWkVuNUwrK285LzNwZElTN3RER1hrUWNhVlNuTXBx?=
 =?utf-8?B?OC9uaUdRajlCNE9IZkVuSHdQWWFPN3lpQnZQMlFjSzdDNFNRZ3N2Q2ZudHNn?=
 =?utf-8?B?cHdOZG80TVJXRS9hYmE1SzdRbnVPRXlvWUdySzhMNUhGQ0lBYUVpcjEzQnJa?=
 =?utf-8?B?aDJYaXpGeUFyNHdtZ3VxMFE5S3NDdFBaMWZXL3B4c296S2l0YnJVbzNFSkp6?=
 =?utf-8?B?ZzVTVlpSMXVmVzNyUkxDcWluNURVNVgvTWlTM0dzYnc4UE5temJTQWR2c1dU?=
 =?utf-8?B?RU1rYnFCM2NBSHpRcyswdzZrREJzbHVlRkJrSHN0aU9mZ25CS3lPNWpDTFFK?=
 =?utf-8?B?MlRXR0NmNlFSSGFGV0ErQ0w1RElqVGJSS1FpWCtzMHUvNjBGY09rQ2VoUUlW?=
 =?utf-8?B?WkdtQmQvdU9jeEpQQXg5Z2xqemVoaW5VK2g5djZwRmk0VHFka2pIZnNUd2Iy?=
 =?utf-8?Q?xVebLHf09k42wWWBmWfDD7S6q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07be19fe-3f8b-4efa-9a2a-08dba85b0b3a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 06:41:58.8303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bP1fZnSVKZExhhuUupsCH3rB/A0986gtZvwA575HyWMFin2uzStvPNG6Ds49Rby66gdFOMHV6fAHv4r/xDYW1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8265

On 29.08.2023 00:27, Stefano Stabellini wrote:
> On Mon, 28 Aug 2023, Simone Ballarin wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -96,6 +96,10 @@ conform to the directive."
>>  -config=MC3R1.D4.10,reports+={safe, "first_area(text(^ \\* In this case, no inclusion guards apply and the caller is responsible.*\\*/$, begin-1))"}
>>  -doc_end
>>  
>> +-doc_begin="xen/arch/x86/usercopy.c includes itself: it is not supposed to comply with the directive"
>> +-config=MC3R1.D4.10,reports+={deliberate, "all_area(all_loc(file("^xen/arch/x86/usercopy\\.c$")))"}
>> +-doc_end
>> +
>>  #
>>  # Series 5.
>>  #
>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>> index 4b1a7b02b6..45e13d0302 100644
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -62,6 +62,8 @@ maintainers if you want to suggest a change.
>>       - Files that are intended to be included more than once do not need to
>>         conform to the directive. Files that explicitly avoid inclusion guards
>>         under specific circumstances do not need to conform the directive.
>> +       xen/arch/x86/usercopy.c includes itself: it is not supposed to comply
>> +       with the directive.
> 
> 
> We need to find a consistent way to document this kind of deviations in
> a non-ECLAIR specific way, without adding the complete list of
> deviations to rules.rst.

+1

Especially rules.rst should not be modified to add mention of individual
exceptions. That's simply not the purpose of the file, at least the way
I understand it.

> Can we use safe.json and add an in-code comment at the top of
> usercopy.c? E.g.:

Right, this ought to be the was to go. Question is whether ...

> diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/usercopy.c
> index b8c2d1cc0b..8bb591f472 100644
> --- a/xen/arch/x86/usercopy.c
> +++ b/xen/arch/x86/usercopy.c
> @@ -1,3 +1,4 @@
> +/* SAF-1-safe */

... this (or any other) placement of the comment will actually do (not
just for Eclair).

Jan

>  /* 
>   * User address space access functions.
>   *
> 
> Otherwise, maybe we should extend safe.json to also have an extra field
> with a list of paths. For instance see "files" below:
> 
> {
>     "version": "1.0",
>     "content": [
>         {
>             "id": "SAF-0-safe",
>             "analyser": {
>                 "eclair": "MC3R1.R8.6",
>                 "coverity": "misra_c_2012_rule_8_6_violation"
>             },
>             "name": "Rule 8.6: linker script defined symbols",
>             "text": "It is safe to declare this symbol because it is defined in the linker script."
>         },
>         {
>             "id": "SAF-1-safe",
>             "analyser": {
>                 "eclair": "MC3R1.D4.10"
>             },
>             "name": "Dir 4.10: files that include themselves",
>             "text": "Files purposely written to include themselves are not supposed to comply with D4.10.",
>             "files": ["xen/arch/x86/usercopy.c"]
>         },
>         {
>             "id": "SAF-2-safe",
>             "analyser": {},
>             "name": "Sentinel",
>             "text": "Next ID to be used"
>         }
>     ]
> }


