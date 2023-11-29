Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9697FD08B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 09:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643721.1004162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8FnP-0000OD-Ax; Wed, 29 Nov 2023 08:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643721.1004162; Wed, 29 Nov 2023 08:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8FnP-0000LF-7w; Wed, 29 Nov 2023 08:19:47 +0000
Received: by outflank-mailman (input) for mailman id 643721;
 Wed, 29 Nov 2023 08:19:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8FnO-0000L9-DU
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 08:19:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dbd20d8-8e90-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 09:19:45 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7943.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 08:19:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 08:19:42 +0000
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
X-Inumbo-ID: 0dbd20d8-8e90-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+XcfFm8DDKDE3i5KEHNwEC+rXteHH23SvXBatoRIyLpgf3VWpaA3OJMn8G3mHG+XQpFZ2BvNx5VFxzluWK/8+jWSSS3+vz39tNR6ge6lWvc50FvfGFWY3AVigWpEH0J2x4/R/cAwTq1yHSMnINl4WWzAzfTuGjYMsal08NsPxig+xmma/sGEZ2hEv/sX4WNEsAEa5jhj98G31LNFUzM0qUV0zDzg2hXOm9nEi9l15otTeFTuQO/SvwsbO5mUMGZF22Otj3Tuz5qZGhqWLEsL7j+9yhty86sbF3lPU0xGFowvuxDOuzEqTn+4FfbFqWA0SK0sRfy3M1bi1l2v1gjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqewidoAooE1y53NHGnko/3ZD7IkJo63Al3BL73zM9M=;
 b=THPO4o5bDgAs86f2SlevoNfFy5wwjyBw8lNK3IplT4qk1uE7NPm1B5fkRkCXvqLon4pcDFVt0+0YqBwC9LG/+bTEjlrGZcFBlMmpG/H3jwvhOoLPKx0QJh+144r1HqiaFAEUTVbZhu3Lz9l5UqYfU2iM8Ck2g67IO004eKhO+FjTGSIOMXaTjXijEqWd89+g3HtDYQwCIcj2cZVdS2edTu79bi3IIrppwQIvHX2buEBpcBHuYB3zOT3KdisGEQRzTgUOPSx+lQ2OJWkQczSv5p/uuYLSpVqmvD4kt/Nbp0WZqnHoyfG98/iDiq+u7vfZ3Cuo614qDKQbLo2jCnESCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqewidoAooE1y53NHGnko/3ZD7IkJo63Al3BL73zM9M=;
 b=Sp8LWUJTSsQEU2K18MKW4RIt+yVKHRhGB/kYuW3V14RO5JSHsOcSPWj9Un1ET2jdCp/Uyh4Gb9W7KC2JkfAWiuGgk+GAaaFNRjCqoyzZGSalNzaYPSajxj5L5uh8q1Cc10ML09DoF568rH2OosSvjQPYFQTOh2B1n5VaxLYUzIRZkwRHg4BK8o5Jo55WkrEPm7OWVvOOFKq/YbV6JGc42N5fQwnPdStmRksdhUrDXq4OxguKzO3owJMoMvIat8IoJPmTxgKdlbP1/D39yuKwV36VQux+j23hQV/l8/DfOinm7QiyaXiemhFyvHWyQ6YzU6AFUf3x635YR33bhjV4dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77169e15-f1ce-485c-a7be-45901708056d@suse.com>
Date: Wed, 29 Nov 2023 09:19:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/14] xen/asm-generic: introduce stub header monitor.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <83e16ccc588d35042b804e0d56ebdb5fe710695b.1701093907.git.oleksii.kurochko@gmail.com>
 <22ffed63-8f05-477f-b37c-c660410c2ce6@raptorengineering.com>
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
In-Reply-To: <22ffed63-8f05-477f-b37c-c660410c2ce6@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b284601-2505-44be-1ab2-08dbf0b3f076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vnz0O1dxaElOSWJHYmtnK/OELnDoSm+zFUsaYJS9nDye2CbesjZdMhYKnMwWUhshsjUk5sYKZq6eJGVPRquBk5rgPRA5HGBSY2eZt9PAQ/xHrxof/YS6FXCj21+EAxhAHfVSfSpwsM4zOCs1thGcefqWd1Bn9U2cLPjP/oowLDatejB447ghrlWq08vhnnIEUVtq3+1HYZopb37sdC857Tr9aI1LzgVEV12eC68EbLbo/UikwlGu20/Jyz+qsBoFYN1mvLKIj3qDxgxux9aHo6MTQMQtMjbBQlDi28WbrUPBUqFRmBtS2Rfb4eqaHvt2J0AoOEouGfVukByGgw9UH3gJGoh0c3LH+rT5j82E4fuotLg3g48YdmBT5Nk6BleiLcg03LmVNcEO1hUwqZGvpmyAHp1KDxZfOZ6gRoBKnNqEIpZDOTm4SP0sn7PiGSWC6K7qVNsjJMor1oozjQfnZ0sLhfLS+mjlkdniKWUVAelfBRIS+Uu2NGuOIHPeE5usqXBRZifkfCd91+XLTPqghimXCCM6e7kxfzogsLqdPMavQ9oTrZ4jaBnSMJ1ed4xKR3mvDHZ8JJySOFo7mUjQvYBvUW+NRa5PU0DqGYy3bdBaPx12MOiWW2lMDXOi0iaJiRgS47vwPGxpZteSEmtjII5JnKRTkkogE0NR85yqb+s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31686004)(2616005)(6512007)(26005)(86362001)(36756003)(31696002)(38100700002)(478600001)(5660300002)(2906002)(6506007)(53546011)(66556008)(66476007)(316002)(8676002)(8936002)(54906003)(6916009)(4326008)(41300700001)(66946007)(6486002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDdxS1JaQWdPOEpnNVZ6eEhxU3lXMDlYWUh2M0RybFNWQnlsNnJPbG1oNUV2?=
 =?utf-8?B?RU5RaWo2RjRxZU9OOGQ5NG1UZ3FTSUYzZ2Fac3RsL09tWUZzWVdtRElPRFFO?=
 =?utf-8?B?UDR1UUE2Y3lrdHRaT2syMEE1TTNIb29DVndSeXJTYkhDWkVJQTBhMHdRSTlJ?=
 =?utf-8?B?a1pQazVXUTVDMndsckpJbENIdUpXYWFEUEZKeE5ZZzJ3Z0ZpRms1U292UjJX?=
 =?utf-8?B?MUtZajdMRExvV1orMzAwWDc3TlRYeThIL1JGWHRCelFiZE1LRmJUZFkxeHhN?=
 =?utf-8?B?V0Q1Rmx5dVYwSnlqTmlFeGR4Y0hJRFZFYWxKYmw2Tzl3allWVEpBaStrVkFw?=
 =?utf-8?B?YXFtbkp0NFRmRUdoQkd3NGZVdncyY0MzYjFQYlFOYm1CbDVUYkkwMEdEM0tZ?=
 =?utf-8?B?YWp6ZGViUkVRUXNjS1QvMUxJRG5oVkxKaHVNY3RtT1FzZ0F5UHR6OHRWN0hm?=
 =?utf-8?B?VWdFREZNYmNDelhQMGhaUGQ2OFdybzBQN3YybkdiVmNvcW5BRWxWc0p3c1Zi?=
 =?utf-8?B?YUh5ckVWcFVDM0d4bTRmNGVCWTdaSmtzOEg0NWkyZ2wyLzhxU0pNdUdWbE9Z?=
 =?utf-8?B?ZjF1OUhNb1VYa0JzUTdncitlNVREM0R4VmZjN2hNYUZoU1o4czJPQXFQT0t2?=
 =?utf-8?B?eUN2SDhDcDYzd0h0Yk54MElETFIrL1pRdFpnVU5LUkpRTHczVlprZEtibEQ2?=
 =?utf-8?B?L1M2U1YzSy9EUFNnR2V6YSszSHZwRGNTR01xdDBSNFZtRHZlOWw5Ukgybitt?=
 =?utf-8?B?NVc1TElRWXRTOWNMbmxIa2ZKMmxoVmtUUG94WFBNeHowVEhxSXdVdm9nMEpo?=
 =?utf-8?B?alp1ZlVLVzVXODd2aGU5d1d4bHZpbE8xcm5kZCtWZzRwRXM1Qy9FMzdMREZO?=
 =?utf-8?B?bkRkZGRFVzRtNThZYXVOYTNrY2daZ3VWNW1XZVRZd0s4NE4reCtvZzdGRmVQ?=
 =?utf-8?B?VU9xZk1yZ2NFS1pJZnRrQW44WVgvbHRRdVcrTGJSaXlDVVBRclYyVzg5OTd4?=
 =?utf-8?B?QjY3dXJrcVczQnU5NFFiTHUvN1FUakgycUFrWkpPWHhuSFhjZTJudFlmbk83?=
 =?utf-8?B?TnNQSTYrSk1uNE0vUkFEMXFVWE5aVVFTd1gyeFBwa0dydlhjL3lmYzVRZWhH?=
 =?utf-8?B?YmJIbHJpTTBQeVlzbGtSVkRqMjFIYUU2VW15dlpJYlNHWGNiQ2JrWGh6UFZK?=
 =?utf-8?B?SW1QQWFzL2NuTllzQzl4cm1UU3dVaE01RjlZTXY5V1h4ZEtMRTVXRE5XTklJ?=
 =?utf-8?B?RGp5emU2amYxc3Zvc1pUazc3eVNuNk1vblpVRFF0UzRMWmdOY2FYWm1SUUcz?=
 =?utf-8?B?Wi83THdxeU05QW1wMy9lc1l3ZXBlN0o4b2MxWmtPVTk0eEZKUW0xSXlNSm52?=
 =?utf-8?B?WTNGeVhyMUE2U1Y0S0JCais2c1VFTENBQkYyVHpIQkZCOW1qaHAwNFNWWGJY?=
 =?utf-8?B?Wi9RbzBhOVJHYmpiSi9YVzBWTmRWeVpVTCtIUktZRzBwTzJvMk9NNmhrSmVP?=
 =?utf-8?B?eHVvb3MyVk51Tm4wWk9DNVZxREpldkZxRGtVSlc3aVRMVlFBelhUOENWMnNL?=
 =?utf-8?B?Tk83V0lPSUNhazZhK3BUajBOR0FXSkhhVCtQRmhnVWsreEhaTEJLQ1dHUTFr?=
 =?utf-8?B?akcxdmxkakxKY1BTNGR4K05FdWdiZlpUSUF6bkd2VWMwa3VUUmFqUGwxNlEx?=
 =?utf-8?B?TFk3dXYvQi95TU8xRitqMHRiRC9pSTR1c1NYUGoyRjlnc0c2QVdYc2REckdL?=
 =?utf-8?B?SEw4OUI3MVRvcVl5Y1pvNm40SzdISDlQNml1eGpxazJDdW01TXErNzQ2dFEy?=
 =?utf-8?B?YmttUm9Zbm5oMmVsWkorSEFkem1wdmJyaHFWN0N3SjdzZnBjTXBkUkNGdG1W?=
 =?utf-8?B?RnJCeG93K2l3RFpFdWlLR1RzWDUxSnc0aXpRWFpvR2l4bHZaa0hleTUzQitR?=
 =?utf-8?B?SWZ6a1pMWDUraFFOYnNIRFZ3U01yZFZKRENRWUY4T3Nibis5RUJqYU9lQWFL?=
 =?utf-8?B?ZXRQTVFqSEFEb3Y1K2JSUUpBQk5mSW9GTUtvZkZ0MlN2aEVtNFhKbHZsWUZm?=
 =?utf-8?B?SWlNMTVtbEJmTVFkWTZRdnJ5NlluRkg4bWRUbDJhVW9pN3d2OGRLdXBvOGZy?=
 =?utf-8?Q?tkLtM5x9+B2UmLzQ/zcSGRfjK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b284601-2505-44be-1ab2-08dbf0b3f076
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 08:19:42.8464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+kY3ZjjyQDVkZzBUWZ73zfaV/FaITPVjdUxKYBKCFcdEBk2uRzbboyJBy6BdmM9wWGTvdfxchzqF+NBGwEH+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7943

On 28.11.2023 23:21, Shawn Anastasio wrote:
> On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
>> --- a/xen/arch/ppc/include/asm/monitor.h
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-only */
>> -/* Derived from xen/arch/arm/include/asm/monitor.h */
>> -#ifndef __ASM_PPC_MONITOR_H__
>> -#define __ASM_PPC_MONITOR_H__
>> -
>> -#include <public/domctl.h>
>> -#include <xen/errno.h>
>> -
>> -static inline
>> -void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
>> -{
>> -}
>> -
>> -static inline
>> -int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
>> -{
>> -    /* No arch-specific monitor ops on PPC. */
>> -    return -EOPNOTSUPP;
>> -}
>> -
>> -int arch_monitor_domctl_event(struct domain *d,
>> -                              struct xen_domctl_monitor_op *mop);
>> -
>> -static inline
>> -int arch_monitor_init_domain(struct domain *d)
>> -{
>> -    /* No arch-specific domain initialization on PPC. */
>> -    return 0;
>> -}
>> -
>> -static inline
>> -void arch_monitor_cleanup_domain(struct domain *d)
>> -{
>> -    /* No arch-specific domain cleanup on PPC. */
>> -}
>> -
>> -static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
>> -{
>> -    BUG_ON("unimplemented");
> 
> I'm not sure how I feel about this assertion being dropped in the
> generic header. In general my philosophy when creating these stub
> headers was to insert as many of these assertions as possible so we
> don't end up in a scenario where during early bringup I miss a function
> that was originally stubbed but ought to be implemented eventually.
> 
> Looking at ARM's monitor.h too, it seems that this function is the only
> one that differs from the generic/stub version. I'm wondering if it
> would make sense to leave this function out of the generic header, to be
> defined by the arch similar to what you've done with some other
> functions in this series. That would also allow ARM to be brought in to
> using the generic variant.

Yet then where would that function live, if not in arch/*/include/asm/monitor.h?

Jan

