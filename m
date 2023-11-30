Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4B37FF436
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 17:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645032.1006797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jSc-0005PM-15; Thu, 30 Nov 2023 16:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645032.1006797; Thu, 30 Nov 2023 16:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jSb-0005NE-UW; Thu, 30 Nov 2023 16:00:17 +0000
Received: by outflank-mailman (input) for mailman id 645032;
 Thu, 30 Nov 2023 16:00:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8jSa-0005KM-LJ
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 16:00:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c96da59-8f99-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 17:00:14 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7310.eurprd04.prod.outlook.com (2603:10a6:800:1a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8; Thu, 30 Nov
 2023 15:59:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 15:59:45 +0000
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
X-Inumbo-ID: 8c96da59-8f99-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFqEHJq02Vwpl/xfov8jVHQIaJLU6VLnBHqQgVCoRuas8SLnMfzV2eNqHZ5Sd9kqAg5G8f6I4N9oEk9LO+b0pJJJwg78j/jBRHnZQy/ja1794o7Im/55An8OVKT6bARwz7MRZruvVprqLHKJYGZgDi72LotBT8G10BCuLP8mBDbhczOUGm/QtK4CyxUA2UlhPnI06ALdDVO4eKI0y+k0DhJ+5mWWSNshI2e1b+FqB1wWb60mEqB+V41rK/qjh4lkLalh2BNjBpznJAa/R1OA0p0i9+7NA2L/Spp6Y7e3+mkffPMa0gDj6FXhFCUNnQwLhvkitUlV9TecODpf1jFHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02HKpb4GNdUC1VsGOqjmWHVYN/hnbassl75ivaLhBFs=;
 b=Nf6HL3VwnJHx20LYiS/f6gvDhptgCG4kJ2UHG+o38205y+vmSm0QAqS0o3q8eHV4PCNAiqtO04Lzp3J/HuWYdp/35GiPKNOr8EnO7nzCsVjyRFFryim/JDSj0Yhb8pGhhhezOVZGveJcNeP/mEdkS9hb85AQPGWPOP+eQZw3Wo/xwJtYODKjv/qW9IuDfz0/Uxkr2CcCjGR6BJOSC4ZJ0RCl6Ms0wf7aUlnhOE13Ai0NfUvPP7J7CI+pUBE0tkWir7aI47l8i1oJv0L5shDJ8fAh6/70OOjaKjUmgwYofXtmRTOWNW/bTMzPvYnDizUVYfRBibCVfXOPYva5KsBwfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02HKpb4GNdUC1VsGOqjmWHVYN/hnbassl75ivaLhBFs=;
 b=PSwjHp0LztYcUVyreqL1Wtdrt2xEnFGQAUCCYYP8sYI65cDepSL1acS8ZISvgIFJkbNCwCOWsS/ACFG+1FHaI0T0GTrtSKuPVSOR6+EHo1qSFKT5mz2dKnWgv9vfigxS2l9q5yMOEKKcGJyWQqc9INNQcH15yzlKa8nEJCel0fzxS39eywOOyK8riVReWHx09Eg64FlznLd3Te0uetrpbRH9aHHX4MF4Vm/JRHn+4+mo89q0Tv2l7swubtvwU78cOU/kIZisdPvtZUe2iKfA2ynbRDTxLPbuA9tnSa0FbB8sr9wx8mf6pE3zVis324MF3uIiSN5NyyTb4nnyo8dZrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d70f2ae5-b4d2-4758-ac84-1e8f8c415ff7@suse.com>
Date: Thu, 30 Nov 2023 16:59:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 07/11] xen/iommu: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1700832962.git.federico.serafini@bugseng.com>
 <85581b19ffe10276639683aff56d04f3f74abd6f.1700832962.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <85581b19ffe10276639683aff56d04f3f74abd6f.1700832962.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0437.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce528f6-43c3-4335-a0af-08dbf1bd5f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	psm77l1qgVEgGS8EhKznSzEnupXBIz8vEDy/7in6F1DEAyv2qYR+xUCLYytNut7nE3bEFPT0Kpc5Xg4nt9divcZ3MFnObqRQnnTMwl25Qxw/9vOnWTTr0RQa8PI+Oe54ybypBzhfDQaoEcNUGsnB9xx5NsNdAMAPPdncu4CMUGAmUU8xASdatFMX132dotWEzGCu8NzS23LwNy1phJAUslQF1CDRplV/PcRjwTrdA7054wcU6A2N10k6I3t/ZkYGEgVqucUxF17gUqxIiJuwOCZBbI/+SibBtaVo/+L1axPzSV3eo4BSEHuFrMxp+Us9/JBdop8cy+xvUDmiu89PNNOWRO7F8RqIYSfEk+PbcI4haeapjV48OjAZj7PgLOJQbAtBoSXOuE6Af1T8k0dTzlzabV+XfqZgCrIqBa1/HDxiJ+gR/BnD0m1T5jjDTtB5/By0+QVSGPkGvt0luCNYjGzD1cAezcfEn6R51FguKs0OBrw/VC33VD7lHOFtudF/OgatNjlnENKsfl9T1CD8lDgJbxVKYGF805TTMKIGwqQ5UXsHueSVSuTn+G8dXyk44Ujv9PxObfXolvAYPgWhd6LKMltmqo+egTRSCEWrKEp3k3WtSrWCkQamAWA1kzbnStq8BCI8tjqDSrWTMpAROA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(8936002)(31696002)(86362001)(316002)(4326008)(5660300002)(36756003)(66556008)(6916009)(66946007)(66476007)(54906003)(4744005)(31686004)(8676002)(6506007)(38100700002)(2906002)(478600001)(6486002)(53546011)(6512007)(2616005)(41300700001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzlGVFNqS21pWGFZMnRTZGtoUGVYdFdVQ1BwQ1lNRERZSDNxSkNiOU9BWWdv?=
 =?utf-8?B?cmRZVmoraThBZjMrSnZOM01xVEV6MzRkaWJCdHlzMUYxWHpXb0dsUlNQdHZq?=
 =?utf-8?B?UGFoRVVUNzhaaXNsblJtbTZOZVRXRmFjb0s0SkdsTVNXOGVsTGdtamltdkhW?=
 =?utf-8?B?dkJlN0lvM3oyMjNlclhDYWg2SVdXZE9iMGZMZ21jNzhPZ01kUmsxM1pWN2FK?=
 =?utf-8?B?ei81WENOMkpKMkYxU2tOaTJzOFJoNmlNZzMwS0R6UTRuTkVPSWc5SDFDZStx?=
 =?utf-8?B?QjQxY0s4RWJySXJ5SGZpTktFVkVERUpRVTliL25YV0Z4MnowVlZMeURFK1Fw?=
 =?utf-8?B?aWtwZXZEcHBzV1d0TnY4cnNDQjYxT3lQNXFhbXNRTXlEMHp4RTNwNDJYTWw1?=
 =?utf-8?B?Nm1UK251bUFsdDlLWDNheG0wZGg1cWIxYk12VkZ6ZEN6SlQ4Y1hpTXlpU3lB?=
 =?utf-8?B?M2ppUHhjZnRxNm5pU3ZVdFBLbUNmZk93dHY4WmErOFRBby9mZ0dRMkJJSTI0?=
 =?utf-8?B?WHFkc0RWNmVHNXVVVldHd1J3dVRudytFWDZRMTFvdW1QUndwMHVEN2UvZllo?=
 =?utf-8?B?cUlOVldORmJueHhtOFNnd1VJQlh1ZSs3a2txb1ZZb2k0K2NOVkhDNmhwOW1i?=
 =?utf-8?B?OC8wMnR0dCs5Rzl2bHlTTitaVHI3RlgxZFVnbkk0TUZhWi9STUwxZWJlUFF6?=
 =?utf-8?B?eCsvUitKbFdBS09vTWRGLzFjdE5UbFVsanRrVDlyL0dvM0FDTWs4T3h1dFV0?=
 =?utf-8?B?MG1wWVRoaStrK0hyV1FmSVBkREd1M2ZycTNaWThOTU5uNCt1VC9yYXV0UWZq?=
 =?utf-8?B?STVJQ0VjV2JVSUovcXo0WkYrV3NMTUx5ZE4wYk1LVzJ4T2RyemZqVlVKRmlK?=
 =?utf-8?B?a0lTcUhlSk9lMjR3MDBLalRIN2xUQnptU1hnUmZLS0YwNXpTV0hGV2dCV0lj?=
 =?utf-8?B?K04vb2dQcVo1V25iR0NWTVBRQkhMQU40SG90YWZMdTQrTW9oTHVobFF6cGF2?=
 =?utf-8?B?ZjlwSlF5d04ya3ZWZWdKa1JDRGFGWFVIWlAvaGJMNzIwYnBaM3JNNFpJUTdX?=
 =?utf-8?B?TlhRazJqT3poaVRNRm1qNUpaZEdpVGFDcG5sd3l1bGl0cUoxYm1Ja2FHbGRU?=
 =?utf-8?B?UUVQNkg2OUtrRmZqY0ZuUDVObVROUG1NTC8zZUFubzgwa0FNL1dhT0hmNm1q?=
 =?utf-8?B?OU9Pb2VSVXpudXpCZTcrS1N2aDBSSWM4K3VaOEY5dWRuV3A4U2hUUlh0NHg0?=
 =?utf-8?B?TkVvMVc0VUEyMVV5V2oySnJQemFOLzJvOUJJVjhkRGxKVnlqTTJKYUYrZDdj?=
 =?utf-8?B?L3V6OWJFWGN3QTNpckh4VllQcGFqaDhRU01ja0NVbnBUN1hWYVpaQzhNTlR5?=
 =?utf-8?B?Qm4wMmxnSmh0TXR4ZjVsV2I4ZFpmUVBwOXJUOUtja0I5bXdIbFNra0NLRFcw?=
 =?utf-8?B?dFpzS3NuTVJkWERRWlIvcDliOEFXLzRBeisrVUVwenhpNUVSOUpmTytpQ3h3?=
 =?utf-8?B?dmhNSXFLNi9sVEtPOG5qNXhaNVVvelc3Tm1tTGs4ZlVNRHRxNnY2SFhGRytz?=
 =?utf-8?B?c1hVN2ZsQmlKNTZXVG1RSzlhOEs1aEtuM2piSnViREROY0t3RWdxZDhKczJz?=
 =?utf-8?B?ZkdWeUpIOGZPbkx5T0ZvL1hEVkJ0SjdJZHpEVGlOYTIyNTdMQWxaRVNUVjhn?=
 =?utf-8?B?dEN4MXhLMzdITzFuZmszZTBVZFZoUzJMWHhKNy92WG5CQXFzLzN5bWxHcXlm?=
 =?utf-8?B?UW5say9PVVY3RitrVUhDMThNNCtyam13dzBXb2RFcmxQdHRtNjNwTnZDVGJx?=
 =?utf-8?B?TFJhSndNblc4WWdHek9MNnNoK1ZRQWp3YnorUjNzWjNybGlDR0lickJuUmpw?=
 =?utf-8?B?RG9PbzJKV1VlcVBuQWxjZlQ1YWRhcUFScnZOTFoxQnBHeGZZcm9XQWc1NjM2?=
 =?utf-8?B?SUo0RWRPUUtXb0NCWjRNVXdFR0F0aFFsZXE2THg0RTBKcHlCOWt6TXBkbkwv?=
 =?utf-8?B?M2kyZ3lUN3hmNGxsRTRYN3k0T1RBejFFbVE4anNlM2hMa1IvSGt3TzcyU1VZ?=
 =?utf-8?B?WmMyTEgwSk4zRHpJS3l0QnUxTldWSWNTS3AwZGplcjRFaDV2eEJEM3BydmZQ?=
 =?utf-8?Q?6ByghMTaz2FQSaCdDL1M2oec2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce528f6-43c3-4335-a0af-08dbf1bd5f38
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 15:59:45.2873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGVQD1v0UyfFwy1/oNSoB3DBXI212lCDbLqHPDzxj2K7ZV8hb/AnCKHuLvE0rRugPTQ7tkLgIjVm3l8Zh3CWtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7310

On 24.11.2023 15:03, Federico Serafini wrote:
> Add missing parameter names to address violations of MISRA C:2012
> Rule 8.2 and remove uses of u{8,16,32} in favor of C standard types.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



