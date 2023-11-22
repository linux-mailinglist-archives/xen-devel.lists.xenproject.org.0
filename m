Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C3B7F3FE1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:16:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638492.995065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iP3-0002aI-Tq; Wed, 22 Nov 2023 08:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638492.995065; Wed, 22 Nov 2023 08:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iP3-0002XI-R1; Wed, 22 Nov 2023 08:16:09 +0000
Received: by outflank-mailman (input) for mailman id 638492;
 Wed, 22 Nov 2023 08:16:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5iP1-0002Vp-TB
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:16:07 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe16::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fed6aec-890f-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 09:16:02 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7023.eurprd04.prod.outlook.com (2603:10a6:800:12f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 08:15:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 08:15:58 +0000
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
X-Inumbo-ID: 5fed6aec-890f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ng7fOeWjrtUSomfvc2hOEbG/3n43P0hjD3ANPxZ59AaveF7xDE+rRryCyG4lz49dkiw6vHGRmCzuky6R4r9iBxWh87+f9XUR/edumrdDifrdb7V0hEovIRHzO6acNYrLcnrWuPigg36KJBFrhWsZl8aGG0QgnbH+CbK7BQu7xg3WCWAF7drfMp5RW0oLq1uQ67ok3WwYt/0GGSnWOfz55gtigE50CjHCDTIXBlBObwDBPQYWpSO7CKZYZQLS6zy1FuqaYz0j+g/QWqQgOARbjnfSS+3zSYG5zcC6w+mC0Ca8YgI2JjxieeMiMJMXANUZRncbHToeKkh5QlvcMk+1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1o/V6zEugCE2LeSV9BqR+NJ0f+oYfuC8zF2IQomH2BA=;
 b=BA+l4NsTGvcy4Xt3agsIxyQArqif0V0hl2DUBxDM+7Cca485XG3DwSNf7m0sEruqlK8+CCZOUweuEPn9y+gdWQPFMZCNTycmtw+I8JMZ3ZKwsjAiftsGE4xdaHPnaaeYVmBsY1dmp0WFegtPIc6CghuF+/fHaI62ZmeJKVfC9O/UBSbTIEjjXrbjRcVlj6RjqEQFEohLNUjvvaz75xDwmDS/q0j7P0xSsvClPhd12N85+KfH3o4i3H41Zj4oi2OqH/Cb3DWCSrxY3Hhzf/adoKJXl4pcA7X2dSZJXNV6OCpL704PB3EBaBtU62SXBleRfR/aEqWt/+YqDruldK5Y8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1o/V6zEugCE2LeSV9BqR+NJ0f+oYfuC8zF2IQomH2BA=;
 b=mRYMqhAsnBj8/U6apCbldoP5+zDS6d8Q3HB4kujnYfwdey+H5Z+sdjt0OSj2WpeaKCWcjc6do3yVOmpVP5nH5zJweKEWRhZQq/FfP2+KufCojzKN4WrlsimP8O0OxdPEMhgPjBbdNER6vMh60nsfZLHUplZ9szCCQbldC7BoLgW8U6EsZMa0tw9I8jYoAskXuCeKcZ2mxXQsMI/aj9iBfajtVvh8GK+dYf6SpX2vXLQY35DzAHNNa3Pz998YTN5QBdeJz4JMvagR7F/tPA9a6NJV/A6mp7I1sNe376I7dPOjvF2IDcR96TE2KnVmQ4JSxssXSqK+G1ME557mekF17w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4678fbeb-144c-4bfd-8e0d-1fc58e967164@suse.com>
Date: Wed, 22 Nov 2023 09:15:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] config: update Mini-OS commit
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231122081445.22581-1-jgross@suse.com>
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
In-Reply-To: <20231122081445.22581-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d87ea23-ecc9-4364-ab84-08dbeb3341af
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/e0a4nIzLsIxrIcOff3WXTEH0py0sa1x2CkvFJLqfMvn4HGPSWARrlyQyvUjAtlbs/Nt7nFIeKOd1QX7l1XtxZHvUq6eq4AJ8pKPcIjQP/JQK081+VOlpLvd5gaR2Wuw9mRamud0dMkaw60XM1SGbj1H0hK4moX0hfy43D0SKuZLpIBsnpdR9YEnn+ybpE2RxT3Ik43Mncn8dydPmpUDfbw+LtINrjbXY8ytI8iKQZJaa5YyxyYKkHwcNh9w9/IRFHqaU2U3BvaRVuIZ1dIMoLpqUFKC7m956DC/K23aR5FZm3Uq3lqdXEve5iWX1Czm3GsYXvtfw4wnGgEcIyk5gqenjEi6UXoVhPthMmgGoWgYc2sRLIC5pNfU9iIfLKvJUST+fDCw8PJSxYz8EI5wZFFJz4SSDW2oN3tAyjiWeQSUP6tI4EaaoY4XGd6s4LQaGd7Jsz1+79ANBUX+IiN7+T0PaZRhGMGzCH+AbSXU7p/HZAJuZlI0ZO2NMY4idlsQEKEJ4Cc6jNljP/t7Hipc6t+oUhCz8N3/sHpHrO+uyurAeSZLMm/XK8tHcFD9kjbuf8TwsIytRL7vsiBg1UqbCwJ0b2hjZjn1UkgjAcY/UdPRJpelFBGEACQfEG17gpYoZ/WMagABl5rSKq7C10Qrlg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(346002)(366004)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(26005)(53546011)(6506007)(83380400001)(2616005)(6512007)(5660300002)(4326008)(6862004)(8936002)(41300700001)(8676002)(15650500001)(2906002)(6486002)(478600001)(316002)(6636002)(54906003)(66476007)(66556008)(66946007)(37006003)(31696002)(86362001)(558084003)(36756003)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlFRMDR1VzVmcFVYRk9HdHZkOUpETzB2QXEzNklIcmRzSk8rMG1pdU9LYWc2?=
 =?utf-8?B?Q2dhSERuWGFBeldMclZIS1RiZGVZWDJJZDVWMDFXLy9IR0lqem5oZ25XaXR6?=
 =?utf-8?B?WFJHZEVhVnBMMmw5cDR2bVVldlZqcnZFaW8vKzFWbDFHMTVZek81L1ExVHBE?=
 =?utf-8?B?MWVicmhqUDVQck01RFJvVHBUczd4RjdTM0Z6ZW9RUUxON3Q3ZlNaS1hQRFdI?=
 =?utf-8?B?aFkrYzJNa3hDM3dLKytVd25xUysxUUcwWW9QdCtVSTB2NEFhWkp4NWpLMG1K?=
 =?utf-8?B?K2I0WW0wNzBudWFRdUVaR0VERlVsWUtpU2w0cTBLNmZiSWRPb1N6SXI4RDFj?=
 =?utf-8?B?dm0yeDRDNy9Qdm83UG5rUmFMTlVsQWtoVDY1OWRqVEUwNTdUVEpXWW5tc3RX?=
 =?utf-8?B?enZEQmdGMzhjN3VpL0dVUnAyUFlVUldlQml5aDErRHV0cWx6TG1heEd2MTN0?=
 =?utf-8?B?OVA5UE95MWdyelFOWXBWaXh4ZTI2QkZXN1FVSmpnSWZ2WG9yaGxlajhWU3JS?=
 =?utf-8?B?Qktod25SMUhCY3d6VDlLM000UERxV0tWMTVWUjNCbFZGdlpvNmtUY1ArSUds?=
 =?utf-8?B?UThkUVlWdS9yUFlsd2N0REZLV1IzVXBleXJHbm4yWTFtQ3dwS1dqZ21DVS83?=
 =?utf-8?B?dXg3cVAzeEZkb1AzNW1HampTMEVBNHNDM25wU1h0UUV4NGg4c1hUcWoweTJQ?=
 =?utf-8?B?cnV6ZEw5Qmh4a2dUMEJYQTd5ODVsZFBONGJ1aTZvakVjNkROelcxUDVjYVBV?=
 =?utf-8?B?WFBIMW5hbWZ5Yzl3ODQ5clJvUVNYajVFNlpmenNWSWY4VVYxRHVIM0QyRFpD?=
 =?utf-8?B?Y0RBcFBBWEtzVFNuMWZOREFwbTQ2SEEwQ1Q2eThkeDNWUmJzSS9rUHpJZENo?=
 =?utf-8?B?MW5nMHFHVVVGblo1a05kci9na3BKaFF0eEhTWjBDZXliRGRoVWdKRTJ5SEFS?=
 =?utf-8?B?cFN6NjBGekRpS3E2RDFaUXJTQUJvSU9SV0ZWbzEvazFwcHFFS0ZtUzhuemJs?=
 =?utf-8?B?cXFhQTVZVTU2dE9BSkpOKy9OTUlCK1M5MWlGdHRwYmN0cjI0V3lkL2hHSWQ0?=
 =?utf-8?B?TWFNYkpJVXZDWVVNUVhRYW9kTTFJMkdEVmM0MzBnRnRyU1gwNGMwbWVNeXBG?=
 =?utf-8?B?dlVPVDlKbG5iWWdiR2VCaE03VFYzRzNsRmhWSjZWZ3puTVFLNG9KVUhKZnpK?=
 =?utf-8?B?NlRvSU9zamlUVEtVamZocVFOMWJISnJlYnpWRDF4NzRrMlZwRHM1UEpGbWJM?=
 =?utf-8?B?ZktScUtPQzE2MU90aEIyeDJkaE5SQnFwOWV4QVREazFyN1FHUUNLMTFaQmJW?=
 =?utf-8?B?eHMxenpDSklodjBIVlFwZU13dDhXd0NmbTdWc3EzLzVhRXRlaEMxamtnTlNy?=
 =?utf-8?B?clkrYmo3Z1lFckh6NVp2dWZOWWlWd2MrQlVHNlNGb0YyUVgzSy9wK1BWT0xK?=
 =?utf-8?B?N2JoOGU3RzA1dDc1Q0FsV01Lck5lcmxBNHNEWisySkVpWjlSR2dPcG1zcng4?=
 =?utf-8?B?MWo4ZDRJUDdCSmI1bmdZWTNQU0VPNjFKc3RHVjdwbmRBVU9PK1NiMThyVUNH?=
 =?utf-8?B?MTltc2lNeWx4OUtPRnpET1ZrYm9SQlJ5OWJjeUkxeWc5anRraStkMDlIaFJr?=
 =?utf-8?B?UGdKVFNOdTV5L29zVXhEeE03ZGNSVnFuRVZiRlhObi9iMlZmMWpxYVZsN1hW?=
 =?utf-8?B?b2NJUDRsUGozZ2ZlaXNHVnRWRkROTjl4WG8rT3RNSkFxNCtCN0Z5V1hITTYw?=
 =?utf-8?B?VXh2M203Ykk5WllFclhjWjZPcTljNTB1VFBOUnRnUGkzSXdrRFFtZklQdXEv?=
 =?utf-8?B?RW1zYU9HcWdhbGpYS1REcUdWNkZOSDN4SytNUG1VK29vZXFGOWIzcXhEdEVC?=
 =?utf-8?B?ckJWSHlRdEcrQkpva1BBOWtYWURSdnh3eTJaWUJqYjNuVmZzekVvYlVuNXVS?=
 =?utf-8?B?K0FzbCttL0VBL3NTVktPZHZEMmpEQ1g1RHl1akp2RFhpU05KVTBEY2FzZW9I?=
 =?utf-8?B?UHg2NkJsRkk0RjdlQzRTcDNtckliMXZXc0MyWmZNVGJmNUlQWUp5MVFYZnBm?=
 =?utf-8?B?WDF5bjI0clVhR0pqZjM4T0R0SDd3TmRCeTVnd0VJMkVqUXdKRjJnWkFDT3pv?=
 =?utf-8?Q?rSyWcgoaWLgORXXK1ualuz9tA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d87ea23-ecc9-4364-ab84-08dbeb3341af
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:15:58.2069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FnllW3p7q+K7nkoKKdlQ4s1y6ZUWVwA9I22fQrstvE8oSxQfku9ysFvqom93slagjPtV3Xi37kFEUnZkx6c09Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7023

On 22.11.2023 09:14, Juergen Gross wrote:
> Update the used commit for Mini-OS in order to be able to use the
> 9pfs frontend.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



