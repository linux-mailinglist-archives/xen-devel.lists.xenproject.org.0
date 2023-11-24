Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5997F6E70
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:40:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640238.998205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rjg-0000X9-9A; Fri, 24 Nov 2023 08:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640238.998205; Fri, 24 Nov 2023 08:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rjg-0000V3-6S; Fri, 24 Nov 2023 08:40:28 +0000
Received: by outflank-mailman (input) for mailman id 640238;
 Fri, 24 Nov 2023 08:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Rjf-0000Uv-F1
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:40:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cfaae34-8aa5-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 09:40:25 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8326.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 08:40:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:40:23 +0000
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
X-Inumbo-ID: 1cfaae34-8aa5-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCbQt8YD4kLRYV2b1fvrTRyGw3yEUz7UM9XrWXr+YxgsKf50eWO7O1cefwvgUuE7uVN34df9uAXJtgVoVOv8u9r3PVupSydTgmBorRFrR1W/9GaGngssdH5mgE54Din5QkBK3SBFqGtn3Y/f6+sArhuGmugLfzp2Z8bT4+bmUY7MHdt56ESCBOtKfXN5rnFmYSfdrB+m6ljv12Ll35W07sCK6t5jEq7AasglqrWh5QjPGwL7OrgKGASYda5ad7PddesLpPDxivfCfY3v1Sgd3WeZ0d6dSJmgFi0c6KIFrCEkWkj5mSl/t0mN6mqJt8zKozE+bCcB6qzwTkEMNO7vQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmgDzGpnv27TMPDRUUUgHZCoJLepTwX1fsKTTH4fuI8=;
 b=INaOEflZF0t6MWnlrqqTGoL34JiUFbFvEA9InrhhvKNmBjs3Sfc+eSKpzQpu+3xGZPPhsLkziA/thKoF8qL/2eH+gIluIvOBLr2ksXYC6fkgOJz8BeUdi4GcA5PORGhm5/yStdyceQ42Beob3o/+WqCsMytyYB4wlOvermO3E+xZ+6Qt8beDhQtuwzPbNP5/aiwR49JMlixFmEUCfY6OeENMtxDq5QS//TSC1iwgHBylFq5qtXwKFgljmBI6qo8FHrIZO4NsCAM0YaSAB2tny/XgftLMmb2Ta1Gql4a1fQt8zBw0MqW5VeT6ElnzTgD3ZeOXBvYpu6rj/hI4iVP+TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmgDzGpnv27TMPDRUUUgHZCoJLepTwX1fsKTTH4fuI8=;
 b=YqTk41wMkza+SR9DXqOyhOAobkJqr27kf0hh+bKoKLAN7rtlU7+HKMBl0a7cVz0SaYfwMDWokseJtBj5jbDO4M0rkvYPxF3MVqHGRfMErxWn68fgx01e8o2LsW6OrCaTUeXMgXOKcYOWjo4vrLjLVU8DYXb/bQXPtyKLe+sNbTfqxcbHSoVZc9QYCQUWzi60fKvS5pRmHm+UbyAzNF0aSbL53RUcjN6DYd6tb8znBdagXxWvN2muzkTmCF373TnL3HZA/lQm+nAg1sQvcYHj7BqkWWI+at2kEchr9K1FVqA+m59mDuluOdFbC+q+a48OhUsN9ibfHnvtlipvbX3/UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ec88d40-6295-4f1b-932c-4890f7f9cd66@suse.com>
Date: Fri, 24 Nov 2023 09:40:23 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 07/15] VMX: drop vmcs_revision_id
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf2084a-ebcd-48f5-99ec-08dbecc9000c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QVSXW+hLWQFy2oM3GhWKMwd5MDDegwfR3ocUYkc2JB0po/U+b9vcb1xekZPXMxf5vHw56IzCn5NHbLsC7cqiyG16FQM/6hgO3KqC0brluWbygB8WSTKhjJe0UWYT6LhLpbKySdZ/Vm0qBcz4eiLomB35vrRjQ+BkAlD5N+zkE902jjhrnLAPTf2ZUP1+56RDIkt6LTSvTs1icoHxuslBuHd/iliA89eSZfjPHmubYSxGTS51zEDS0h2XoJ5oMArs/VVd5PSyaKr7IK68wi6iDLcm71YOPGE3zBGQIBjtTFIooBYlRmlyFzkdJH5R9ygTwr2Hd0DQxsPF7xTgjFf2fO/UOrZ9MGS7ABdYr255ZqFnQdOGGHL0uHJTyTx2taECKtll2WuLQe4HzEw4FHFiQhwEH6W6tTPmH9/FQDHDooK4urPR1eRkAe0etRGJNcrzbAM4eDVH4TcUPM5K+Oz+5shzwv93LNK5iAe9m64MmPX/0Xw6EIOjUuMpxXiLmS1VUM+9jepB6Y598S8GMlFjrTqi07cAYJ6dFba39YsNozmtt2g8VRBLGuwPdcqD7qemdCJyCr1VvEsCcJ79CxWvcQTI0BzrFwt+4qcE4n0Y+zknlTvAbl0R8Qk640ZoGj0NyNBoYE0KMqvzYrj3fPYttw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(26005)(66946007)(6916009)(66476007)(66556008)(54906003)(38100700002)(36756003)(31696002)(86362001)(6486002)(2616005)(6512007)(6506007)(478600001)(4326008)(2906002)(316002)(8676002)(8936002)(5660300002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yy8zQUUzdklpdUJlcmN6VUpFbTdCdnhBUjhiMTlGQlpvK3RnK295NjVTc3dW?=
 =?utf-8?B?MEw0MEhLRk5TUE9RaDduLzlZLzhud0FLS0FPeXhYeHN2eUJVb0FycW1QZ1E2?=
 =?utf-8?B?YmRYKzllbHpiM2pOS2JadWh2TkdrQXYxaE9pdlhEbytFUkk5a0hlNVNwZHps?=
 =?utf-8?B?Mk9vZk5HMjhMSG1jMHpMekd3Y3NOSmRMcGNNd0YxZTdvZWhGR2x3a2YyRjkr?=
 =?utf-8?B?bTAvaTZuZXA3Ums2ZG1ta2Z5MXVjVVo4VjJKZmNOVEF2TUtnM2hRUjAxMFVu?=
 =?utf-8?B?RzRoNnpIMGFoR3oxNC9jd2I0cTNZMjFTOFh0UmxLMHdPUmFkTkxMOFFkOWFC?=
 =?utf-8?B?MnlaUTNXYytyR1ZoNEhzV1VmUzdNZWljYmUrNUlGL0dQUHB4YnM3RVMzNmxI?=
 =?utf-8?B?SHNlbTQrbWdLV0NkYW9jQVNZQXhaT2Fwb0JMV0w1VjRFWExJTFM0bTdyN0lN?=
 =?utf-8?B?UUo4K0dhd0d3MmxkT1hTSnUveXFoYnZ2MXFHbzNOTGRxNHVTQ0pZTnJVZmJV?=
 =?utf-8?B?RjlCeW1oM283OEhGV2ExajBpb0JWNUJUUlNRYzhQTG1DaE5SMk1kREhtTWM0?=
 =?utf-8?B?M0hzOEFrbUp0NUhXSFoyQnZvZlJwVjhud0pUNFpTeGZrckszeWFoUVBhd1dy?=
 =?utf-8?B?ZmRaRUpUQmFwYktVdlZlclNEM2c1QVJFMFNTSlhLZWYvb3hDSlR6dW5WWW1t?=
 =?utf-8?B?WFZCWG1SQkNnRjlJbXZQT2RyN2dGbE5Kclo2VFZWUWtjVTVMN3FXeVRsWW10?=
 =?utf-8?B?ZHVQNVFVcVc5TFZjb1R4WWZQdUVHN3RCWllmdDNtdDVYdWFKdGVsczJNa0VS?=
 =?utf-8?B?NTlSQjhpNVoxNmZtU3Fpbm1RN2JOSlRKWHF3UFJVVzY5WGgrenIwMnlCaUZh?=
 =?utf-8?B?cmVVcmFQeTZ2TXZtcGhwUGJ6L3Q0M2wwQ3MwN1hGMkFRbmFXUERrYkZvY2dv?=
 =?utf-8?B?WjFBQjVyWFR1S2VTSEEyMEx6WDJOQitDWkJXaUk0bkwzUVM2eko4WFhHWDRX?=
 =?utf-8?B?R3BNRjVOOFliTjgxcVVYVXVMbzdHRWN6cFBGMjM1Y0cveGNxb25FRENqQ3VW?=
 =?utf-8?B?NFl3dzNvVEVBZ0dYMmtDN0VhZWtwcWhGRDJKWUVlc3QxdVB5QzEzdmR6OG9Q?=
 =?utf-8?B?SllTSWZiWEsyREo0NHkzaHBIWllHTEQzMllEUSs0d1VBdVIrcXIvTFRiZTM4?=
 =?utf-8?B?b1lOWm5UOGJicm1TUnloTGdQZ3k1bzkzNUhFSEp2UGV2aUZOQWs4b1FYYzFU?=
 =?utf-8?B?ZjNQZVY0MlVqKzRMWVlMREhveEQyYmVCcjJEdElKMzQzVWNjMkFnSGdLVXdN?=
 =?utf-8?B?Q0xtSVhUblRyRHJtdnJvcXJQUlAvcHNVY1U0T0FIVUlMVDRQRFJ4ekdibjlo?=
 =?utf-8?B?bXFBaC81a2liazR5MXY2RENqd1ZxMHprZ3RncDZWdFI5K3JkZHVFK0NmMzB2?=
 =?utf-8?B?U2pjVlZRNzR4d0xLaFlucDZDenhyUEh2Sk9KeXNtK0g2VWxPRFhtZWxkQ3hp?=
 =?utf-8?B?dlpsT3JTWkowZE9DRTc4VG8zcGk0Sk1RTWVscEozZ1ZJVGR4UkwzVTRRK0lm?=
 =?utf-8?B?MlFHRkZiWkFPVW1WWFFyWGlEVEdzaEVCaUxoeUUydk41L2lsS3JJTFZoTHQr?=
 =?utf-8?B?Z2dvbmg0NXZvZHMxM3BNWStSaHJMOUhTY1ZMaUs3d05kRGVvODJKT2dBNmR4?=
 =?utf-8?B?cFc5eDJ2YVNqWFVPK3RSdHZhOURFVFhTRE9GcXI0L0tNSTdrcE0xaGJYUzRH?=
 =?utf-8?B?UlN2Y3I1ckVkc2crOFVrbjVLcnJ3S29QcUw3MFJiMXl2cTg5ZnFBRlNzMVVE?=
 =?utf-8?B?L3daZGx0eEtiM0RVdWlLUEYwRzlDYU1zaDFIVDF3QlpBS3NwNFVoY3JmMm5O?=
 =?utf-8?B?aUMzM1p6SGRHdmNrU2M5VVJ3Q1hFNTJqMjZYdDNuRkhlbzdLOFQ0VHErUXhZ?=
 =?utf-8?B?UkVGeDZyTnZrQ2R4WWFKcVZQbVQwenhyeDRvM3BtVFQ0czhtVlBMK1FrTnd0?=
 =?utf-8?B?eVFQVG54WlRUWEVLSmNXMnhOVlVhY2VaakRHTldITVpiZmpwcXRYei9IelRp?=
 =?utf-8?B?QmdkVnRVQmkzUFBUcTE2NVNmSllNM0d6eWkrTGRFVDJBUGdNUGxQK2Z6dkdI?=
 =?utf-8?Q?78CmYHSn8AxpKA5M86Me+Do/3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf2084a-ebcd-48f5-99ec-08dbecc9000c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:40:23.7804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tukaQiWBk9axuFaSA+ZgGJYJuHvLJAenXzDKmY9rwKCzcZFrJSX5vyRG6m46ug3qjufMMRoaAcmnFbI/jLd0Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8326

It's effectively redundant with vmx_basic_msr. For the #define
replacement to work, struct vmcs_struct's respective field name also
needs to change: Drop the not really meaningful "vmcs_" prefix from it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -174,7 +174,7 @@ static DEFINE_PER_CPU(paddr_t, current_v
 static DEFINE_PER_CPU(struct list_head, active_vmcs_list);
 DEFINE_PER_CPU(bool, vmxon);
 
-static u32 vmcs_revision_id __read_mostly;
+#define vmcs_revision_id (vmx_basic_msr & VMX_BASIC_REVISION_MASK)
 u64 __read_mostly vmx_basic_msr;
 
 static void __init vmx_display_features(void)
@@ -464,7 +464,6 @@ static int vmx_init_vmcs_config(bool bsp
     if ( !vmx_pin_based_exec_control )
     {
         /* First time through. */
-        vmcs_revision_id           = vmx_basic_msr_low & VMX_BASIC_REVISION_MASK;
         vmx_pin_based_exec_control = _vmx_pin_based_exec_control;
         vmx_cpu_based_exec_control = _vmx_cpu_based_exec_control;
         vmx_secondary_exec_control = _vmx_secondary_exec_control;
@@ -572,7 +571,7 @@ static paddr_t vmx_alloc_vmcs(void)
 
     vmcs = __map_domain_page(pg);
     clear_page(vmcs);
-    vmcs->vmcs_revision_id = vmcs_revision_id;
+    vmcs->revision_id = vmcs_revision_id;
     unmap_domain_page(vmcs);
 
     return page_to_maddr(pg);
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1163,7 +1163,7 @@ static void nvmx_set_vmcs_pointer(struct
     paddr_t vvmcs_maddr = v->arch.hvm.vmx.vmcs_shadow_maddr;
 
     __vmpclear(vvmcs_maddr);
-    vvmcs->vmcs_revision_id |= VMCS_RID_TYPE_MASK;
+    vvmcs->revision_id |= VMCS_RID_TYPE_MASK;
     v->arch.hvm.vmx.secondary_exec_control |=
         SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
     __vmwrite(SECONDARY_VM_EXEC_CONTROL,
@@ -1178,7 +1178,7 @@ static void nvmx_clear_vmcs_pointer(stru
     paddr_t vvmcs_maddr = v->arch.hvm.vmx.vmcs_shadow_maddr;
 
     __vmpclear(vvmcs_maddr);
-    vvmcs->vmcs_revision_id &= ~VMCS_RID_TYPE_MASK;
+    vvmcs->revision_id &= ~VMCS_RID_TYPE_MASK;
     v->arch.hvm.vmx.secondary_exec_control &=
         ~SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
     __vmwrite(SECONDARY_VM_EXEC_CONTROL,
@@ -1794,10 +1794,10 @@ static int nvmx_handle_vmptrld(struct cp
             {
                 struct vmcs_struct *vvmcs = vvmcx;
 
-                if ( ((vvmcs->vmcs_revision_id ^ vmx_basic_msr) &
-                                         VMX_BASIC_REVISION_MASK) ||
+                if ( ((vvmcs->revision_id ^ vmx_basic_msr) &
+                      VMX_BASIC_REVISION_MASK) ||
                      (!cpu_has_vmx_vmcs_shadowing &&
-                      (vvmcs->vmcs_revision_id & ~VMX_BASIC_REVISION_MASK)) )
+                      (vvmcs->revision_id & ~VMX_BASIC_REVISION_MASK)) )
                 {
                     hvm_unmap_guest_frame(vvmcx, 1);
                     vmfail(regs, VMX_INSN_VMPTRLD_INCORRECT_VMCS_ID);
@@ -2209,7 +2209,7 @@ int nvmx_msr_read_intercept(unsigned int
             map_domain_page(_mfn(PFN_DOWN(v->arch.hvm.vmx.vmcs_pa)));
 
         data = (host_data & (~0ul << 32)) |
-               (vmcs->vmcs_revision_id & 0x7fffffff);
+               (vmcs->revision_id & 0x7fffffff);
         unmap_domain_page(vmcs);
 
         if ( !cpu_has_vmx_vmcs_shadowing )
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -17,7 +17,7 @@ int cf_check vmx_cpu_up(void);
 void cf_check vmx_cpu_down(void);
 
 struct vmcs_struct {
-    u32 vmcs_revision_id;
+    uint32_t revision_id;
     unsigned char data [0]; /* vmcs size is read from MSR */
 };
 


