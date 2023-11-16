Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EA27EDCED
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 09:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634034.989253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3XnL-0001rV-UP; Thu, 16 Nov 2023 08:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634034.989253; Thu, 16 Nov 2023 08:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3XnL-0001pX-RH; Thu, 16 Nov 2023 08:32:15 +0000
Received: by outflank-mailman (input) for mailman id 634034;
 Thu, 16 Nov 2023 08:32:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3XnK-0001pR-CU
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 08:32:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7d00::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a37c420a-845a-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 09:32:12 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.9; Thu, 16 Nov
 2023 08:32:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 08:32:09 +0000
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
X-Inumbo-ID: a37c420a-845a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/6dG6hfZ+FvRP6BkEAGU6UguXaahEFruull6CV0R86MtBJsdnu+wRL7/EdGEt37Kj2bZQoJCVClVvep/V/iY3CSS0kJ3dS+G/hsxust/w48qLlzMn2uctvYMjCkqcd+ULXo3xzCyqpjF9m2PqTGOkqX3JMkt0f84dP26539EfaDs5+lrpKVN2bMMMvEI8pgRVc0rnPQDwf8xM5p9OnBj2Nysty0ourDzrBQUHYU+2I+LtH386oAkBGUHlvwn0IY6rBf9mreu+vTokecfQHIhU4pq9jf6w6/+xYVpYIhug8aWO4kQUrcL1SS3gi25D5U9lCJxk0RKxN88IrPiP9eUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQt8Fms0kzXesOnd+BROkx9NgOwd0c8YNvuIHoNMbAI=;
 b=RM8SKjKXxV6Ddu9Tov3KSgRfYlv65SrEGGMGgLGZq5OlgVhApBTVNgrgYW1/Sc+vYm2Ofj1J7CS9poDts6j17Q3Rbm4bsTlRdtBsglpTmj2ag17Lz/cWlYBNO0mlKioOe3Ig9yHTEkiUP3RnOGSAmKwQNv2VXmin5wKHvljj74qS849XuG3z51HgDdxuEKwZyrf+wMXQnGNrC4dVElWbFfPnIaR9KUR/Jwoz8AffgHDVx6AXjb5YRbC52wsYjdAnEN951o1WoODf9FTEbxBm+KwcmwI4L89ZtHuqZVPyoT8Qx5Tk71dhGns44Xs4zaAlso5DKz3AYyTAZGBdEUPCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQt8Fms0kzXesOnd+BROkx9NgOwd0c8YNvuIHoNMbAI=;
 b=o8r51PEfUmbgpUQ7MO+qByRTdBNKJ4PUJq5S7X6q7BfVPISWW/iFErUBLAVa3iqJI8Ub+5dc32ijUEWmb7Pr07xdgnG2gIZMTmlrXLzPhLmyT+2JbaMsLhMo0K1+Ft233pCnJbrphIAMREeY6MNnChnuf4g2oTZhPwT7RuvcaJ1T2i/Jgw/+kbFkoRwKFxNGldHMuflHLk7PAKfeuz1SjTgqomF1rKXv0OsCs0gSvSa3LIoZQqWMf6aKA5Bb5Jw44bozf1wIRZ55LX9Q4Ir6B6Bdkxx0jWiS5+5IVrtp1dIkDjezNgMSSyGPsahgoA1WmabeUNwYeobC6PsheHUK+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a64fec3e-0d60-4495-aecc-f1fe44627234@suse.com>
Date: Thu, 16 Nov 2023 09:32:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18] SUPPORT.md: Define support lifetime
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <20231115121632.63868-1-julien@xen.org>
 <AA42890F-2B1D-4DCA-939B-4F7BCB073891@arm.com>
 <c010e6c5-f352-46da-bb23-cd668de6a0a8@xen.org>
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
In-Reply-To: <c010e6c5-f352-46da-bb23-cd668de6a0a8@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 428e0069-2265-4396-772f-08dbe67e8642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/wnY9yL+tfBDsV7umTfNDquacM02A4ZuNrpvdQfjmK6o2W+Wa89T8FGQGdjOXRWVG0AIGCa6mvXpsZtRbbyfvjaOrW1f9d5jwh1hi5CgTr3JIhf/OzBgU4Jdg+HS458LxuirwHPb100k0MD4+ew7S38//1t6JOTpP1I7s1bG8WLLem5Ttvww5D2vMkYGwU4bDG14ZFjHcvdPBLA+JV6j/LNlqZMj5jYEfJVucMfAj45r5XSu3Vp82BGwGG6hkMnNVYWVNQN/E6Zp70vzi822vF57tKvLctqPvajFt7wNwhAkM3U1k+oJh6SWfjfLqlgedUgUYyiEPV7rV1TmFazwoRzZO3jKDwXCWRQWNHkQNtyISvnr7m+izxCIZ0fvwYW/k79HQJCxnyTAnpNqsPf97PRG84+Q3p2oo/ef04wmaOzu42BTyYMD5g6JC8jq7zPkkvd1DbuphqOblev8ioEDY1WS/5prKJr9bSHsktfo1meGVfGlWkfx26SccSCS1UFZJ4etWk7pYhqfSfIZY2H3/GUv2CfWitwMZq+YNF/1fPTKXZtIHYD/OVIWgSVqb4GjcEjLMPzqdrDqoDpQeidRkhCfuJNFqWNXT2ToKHm1c7NSI9wWayoKnaJUnJE1J70VIzY/xy63/ZKHGx51Px1NiQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(26005)(6506007)(53546011)(2616005)(6512007)(83380400001)(5660300002)(4326008)(8676002)(8936002)(41300700001)(2906002)(4001150100001)(6486002)(478600001)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(31696002)(36756003)(86362001)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWJCT0JtVlhrZi9BalJsYzdKN2NzNmQ1RjhVQy9pYXJQNXJ6Qll5YWpVd1JE?=
 =?utf-8?B?UWwraDhrdFlvMzVISk02MHV5bUtWVGJqNndtMGdTSDR1cVVEbGt5a1ZudmZC?=
 =?utf-8?B?RHZ0dHRSdnRvajlqTkYwZEd0M2tjUmZCZE9EVUNKN2ljU0tVRExHTnRxVm1o?=
 =?utf-8?B?SmRMbldwUXdkVlQ5clRVb2x5Q252aVc2T3R3emh4RlJEZjhpd2RwTG9nQVgy?=
 =?utf-8?B?REcva1pmbHlOMkdBU01FYzIrSHoyZ0d5dHlzN0dsc3JhUWZZcUZTMkRzK081?=
 =?utf-8?B?NkZ3TXFwRHlLS3Qwd3hsV2M3UnF5dUp5bTFkZ2xxYUUzQUJrb2pwK3dhZnk3?=
 =?utf-8?B?S3VYMS9Wdk90VFpOUDlvVzN3emk3bTVXMDhDSjNWQjl5QjZVcVM1anpxd3FJ?=
 =?utf-8?B?SC96T3k4NVRQblY4TFowdjdvNVFNUEU5OGpvYjZyNFlGbVF2bGxvTGFGbFZv?=
 =?utf-8?B?b01YVS9mS1NMTE1PaXc3cUFobWRYeW9UYlJ3aTI0UXZWZVVJWU1pTmRJOGNt?=
 =?utf-8?B?aExEZDQ1VlozL2ZDbEgvNjZ4WWZEMW1FM2tIc0dOclREaXF1WnNwN1hLS2RL?=
 =?utf-8?B?RmJFS2dvRnZ2OVBlUE5aZThwSFdYemJzN1ByK0VaaTFJVGRIdFBQZmZUSFJz?=
 =?utf-8?B?YkVTckdhTFZqRUM5eDd2eGI4NlIxREtONlA4QTdmUnZmenNkeUdRVXZTT2tW?=
 =?utf-8?B?cTlNSDh4b2U0NzVKQmw3cHE4NGpKVTZ3WjBBWlQyMUJ1Z3RyOU9KbVdjeXpT?=
 =?utf-8?B?Y3VEaEJIVkpvSWUxbFVKS0ZsNDhaMllNV2x4Mis1MmROcXJlZEZXVjF5dmtD?=
 =?utf-8?B?YS9rdnoyMEROaUJLbFZpTHdOSXdpOFVhRGR6azBOVGpaeUV5MzJzVWIvZXZt?=
 =?utf-8?B?eTduNU9oSXo5VHJNTm8zTzVrQmFKN2U1T1JwYktCRmxoQVo1SGdXSzZYbzhw?=
 =?utf-8?B?YVRLY2VOSkdQdjkrRWp4aEdDMzNJMG1aQWJadWRVOGpnc2g1MUJKa2loMlVa?=
 =?utf-8?B?VlpRZ2JmL3VDeVpTOXZSM1lZdXJyK3hTR3BnNzdyRmtKK2NzUzVYWXExc3c1?=
 =?utf-8?B?NFA0VEN4UWw2SkhiWEtRMUhZRDFMTFdLQnFPMTVnTEIyZW0wTXljNE9saXFO?=
 =?utf-8?B?NFFiYnZwalhRNGZsSFZCWllMNlBJUlZYeGluWXZGQmxicnlMMENHQ2xONmFK?=
 =?utf-8?B?QzV3L1dycHVCeUkyUXRpVWxMNE5PTDRXY1hIUWFUY2pYRU5FbFhRMldkdDZM?=
 =?utf-8?B?UU1MeVRnNTJBWUR6SzdSd1lZQXdYTFVubHNQaUZHanh1eFMwMUg4ZHdDVWlU?=
 =?utf-8?B?WE9KY203Ti9iY0pBVmVsbHc3L3VnaUtSSzJHNDNZaENoRms0NE5kdUczaFF2?=
 =?utf-8?B?anoxQWZaMys2U2k5T0VPSlZWd1ROQ3kxYTdRWXQwWEs2UUVBUEF0OXRib2Jn?=
 =?utf-8?B?bUt4b21SNTIxNTBBOC9xNUdTM3dUSC9wSlUyLzhzVlhlRExxNG90UGVucGtT?=
 =?utf-8?B?VWtac0ZIOUxQTWtzWm9WdjRoUnNFaFkyRGNmajNQZkdWc2d6Mm93QTYwMlZU?=
 =?utf-8?B?VGRubkdXekZkUEl3WjNOdTlwT2VpaUlDTytnZFpkT1lEMDJINGl5dnhVRG12?=
 =?utf-8?B?b09YSDBZck9aa29vSUFJY25CNGtkTExMUzZEdU5jSXBHYk9PVEZBcHFFL1o1?=
 =?utf-8?B?R0dXaXZtbDZ2WmlPS1NGblg3a2c5bmJaRU94V2k3Sktld0liVFVHcUQxcDZ3?=
 =?utf-8?B?VkZJajBjZmFOSVR2MEtiaFdnZXJCUnFscXlWK1lnbUY3TzA1bHVhdDEzRGVm?=
 =?utf-8?B?bFc0czBZZFQ1S2g3WmlsOEcxY2pGU2dKUU5UbFA2SlhCckF6NSttaGc4TEJ1?=
 =?utf-8?B?NGVmM0JxSlhVT0h5TGhkTXNna29ZVHQwUFUybTNCUWNqdkpxTDdCZHRGbUlk?=
 =?utf-8?B?YU10MjVZd0ZhbWREbzY4bUZTTDltUC9Sclp2RkU2emtMUGpEbHVBMTdJbkhO?=
 =?utf-8?B?SjlQbFhmU1FIYjVYK1FzVENsZHVDQnpuV2JIeWNFU3ptR21tbGVsWEE0ZmxN?=
 =?utf-8?B?K05ySUE3TEZNT2JEV25zUDdabklaN29rYTZUM2k3N0FUeitYc2thdzBOU0Vk?=
 =?utf-8?Q?cWtlN6frMwrMfbuamJNRZ0fna?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428e0069-2265-4396-772f-08dbe67e8642
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 08:32:09.7244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slOTe5Lhx+nN79ZChOXB3T0MveuO1qbdwvcRLgqTJ7OeOlWS/T7j7QICksqIc+yoAKa5/JcwbH25w56Xa4lxzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7366

On 15.11.2023 13:35, Julien Grall wrote:
> Hi Henry,
> 
> On 15/11/2023 12:27, Henry Wang wrote:
>>> On Nov 15, 2023, at 20:16, Julien Grall <julien@xen.org> wrote:
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> ---
>>> SUPPORT.md | 8 ++++----
>>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>> index fff4b4c5bad6..c452635eb552 100644
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -9,10 +9,10 @@ for the definitions of the support status levels etc.
>>>
>>> # Release Support
>>>
>>> -    Xen-Version: 4.18-rc
>>> -    Initial-Release: n/a
>>> -    Supported-Until: TBD
>>> -    Security-Support-Until: Unreleased - not yet security-supported
>>> +    Xen-Version: 4.18
>>> +    Initial-Release: 2023-11-16
>>> +    Supported-Until: 2025-05-16
>>> +    Security-Support-Until: 2025-11-16
>>
>> I thought we have a 3 years’ support lifetime, so maybe it should be 2026-11-16, but not sure
>> if it is still the case.
> 
> Hmmm... You are right for the security support. I didn't do the math 
> properly.
> 
> So it should be 2026-11-16.

Assuming this is the patch you said on Matrix you want my ack for, with
this adjustment
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

> I can adjust on commit. I think the other 
> date should be correct. For reference this is what we have for 4.17:
> 
> +    Initial-Release: 2022-12-12
> +    Supported-Until: 2024-06-12
> +    Security-Support-Until: 2025-12-12
> 


