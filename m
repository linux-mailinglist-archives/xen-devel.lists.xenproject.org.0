Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA35C7F6EB0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:43:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640257.998265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rm8-0003gX-DN; Fri, 24 Nov 2023 08:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640257.998265; Fri, 24 Nov 2023 08:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rm8-0003eh-9y; Fri, 24 Nov 2023 08:43:00 +0000
Received: by outflank-mailman (input) for mailman id 640257;
 Fri, 24 Nov 2023 08:42:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Rm6-0003aP-JV
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:42:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7506d58a-8aa5-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 09:42:57 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9438.eurprd04.prod.outlook.com (2603:10a6:102:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Fri, 24 Nov
 2023 08:42:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:42:51 +0000
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
X-Inumbo-ID: 7506d58a-8aa5-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7JbL55mTZRa+C2DoYKjT8BpKRfR7aAYyjSxa/Xnjp4grMtFqePYS2+A9Ghgr8hffsE5jkMKErwhqcEx5zm1/Bi3cupl+Tcgh5qI03DniLbdsU/qF5AN6YG/DScMlF//CYAQ/YsG9qpVmJohXvoiwS+JnPusDmNHC9/eNimlg/1U1OBAz/T7OWzTKpOTTIkpyVfm4vGvbhAgkR8aQ5mgmdCM9Yap7AJ/MlkhxEl63lxPHFz47DguWRye/nZiCg+sjg5Ghss5BQv0BR+Yz8/scX1z4hWVQZynX6bbgalPJ70564qDVwCHWhKxLnHmD0oNq7C8Q63F/j7Z6Gx7x2iAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSGX/JwC4jjDitZbXt8m8JIS+4JodYSasH2C7UmuhBw=;
 b=j5Al5zLcYRg83YncxvKMLTJUGP8Bl1zNMPiY/+jCIirlNghf2y7CZ+B2p173fRaZrHjci+WF8ioWpRuhvvWO9ld4Ng+Lvb8wx0l3d8OwseerUhb/J6F1lBgpGhMA2Ids3DTBO/1jz/SlFBNaynZ2iZCYdRXTvERe8TGhC6aYRhT1ynT+krdzkjIsyvVlZDBSL83ZDOSzEqdi/EsvqbgH1dvhA+6wvKHxv1ocEgUSOWDfvJHRy9u2DGOCnlCr1PlrP8u3pJW4VEPVVAJlARZnYu/hE5+OVOFTsm3V/HK7xSI/qiZBd5D2P28yysLlaY1rTn+RktPeLQLzh5XvsZ6OYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSGX/JwC4jjDitZbXt8m8JIS+4JodYSasH2C7UmuhBw=;
 b=ctlflR8C6fjK3qO712yBd8dZrPiZCJVziM3macwHz9uttsWJfNRO584PRBOgIeX9XVKBUA7qEvUzApCagRDSVwmmuL/fnmO5AT1K0W+X0ExcALcbwYzpOqxvcgWzqBKz5HdNtXPuKFZ4jW5VPtsAEaIlm05QwAx2dNHNvnSqwzSc0wG21lGAulR4bzKJzsf4oxP+3jnYPZYJzUTuh0ei6CWsGTwg9aX53KKxGi7U0xx/lKW9E/W8VLhytjzz6N4hKPDElRHNX22wFEM5aWGIlJlZHEzU9S2gn+VmeUKU/Iy7343sucmpxEhTFvFRiap46qoSd5yWQLONkyXHVNY6mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1fcdf267-53cc-4636-ba61-20165a4ecf29@suse.com>
Date: Fri, 24 Nov 2023 09:42:50 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 13/15] VMX: convert vmx_vmentry_control
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a6f4d7-73eb-4975-f3d1-08dbecc95805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	egT4WUAqJ7pZypymwHR/yDXd2jgx+TvxRBBxc7YVF8iQ1+k9aJ0829Ii21imrZa8KFi73Bf/e1csEMLZ8+B4BOjyv3zSJklzanGD1D3GsvIE/AKzzY13fvzDhCGrSMEhPKClpiNBwVl++IW90A44eDznUcvjgodig5dwIq7YJTdtuGhsw9jECDWC9mzkjPWMFI+Q+mnmXYSIAfpipEJ3RQE+OrSYd6YqU5xCLAZniVU3HgB5khsFFitq70amcC/Ry7Ntaxj+jNobXktp8GHaaIQm0OvVv4hh+sezjlMRxaxzk7DmygiGyHBI27iasE1vJmwpFV/YjisOU/0F6YnzOm0sICmsgrakcGiAPoz3y6LqDKR2DsBIC+BnQaufiLH4qCmOG5gaA20eTXAaRVnFkOInXWWwMNtyF1ntd/BUhOcHCd23+gQMgtPb+4xMRAmS6TQ07uoXJMvKk5Rn6g45p0f4KBW0tddyKRElN24Dk/2rymdq8LvsBR3AqrEEQF5cStM5i+DantwhuK+Rrk7bKEJR30vDG5/nSvF3VyA3jtAkKN6IYxtsD41N0/pKf9jhWh9eqI6SM9+N6vbO1ppGkEDEUYv2HlwUK00AaHX74bG4WYIyQIx56/QGfPFxpYQ+UfmE6KBwTFgWb+xB7tx1HQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(36756003)(2616005)(6512007)(8936002)(83380400001)(5660300002)(4326008)(8676002)(26005)(6506007)(66476007)(54906003)(66556008)(66946007)(316002)(6486002)(2906002)(6916009)(478600001)(31686004)(86362001)(31696002)(41300700001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFovSU02WVhOYXg5K0VlWnJ6TmZzL0lBdTVoZUpjeDV2cEhycFFDR05NTDRm?=
 =?utf-8?B?bnh2UCtPWW5qQ3NKdFhkZU4xSVIzR2Zza2RUQjNNUGpxU2owNmR4aDlSbnZH?=
 =?utf-8?B?ZDRHL2JOMmsyVmpraEFrZHF5a0VwdE9LaDE3cXpEUGo0cm8zU2I1Y1ZNMHAx?=
 =?utf-8?B?KytCdDBoejkxOXpDcU1oSkMyNG13Sk9rWEZtckhzWHc0RW9NTUxVUVUrTFF2?=
 =?utf-8?B?NzhtVEcwbllUejhDeFh6S05aNU1kQU44cHpIMnpDVDQ2bjJBNTd3OUkzVWZo?=
 =?utf-8?B?ME5ISmc0UElDcUtSd1phT1BaL3dmS2dLRThTeThDUktSRG1LTkJXNnVWbU5l?=
 =?utf-8?B?cS95M0FJYXlJTWdBcStPdkFPL2hSRmh0Rzc0QUpCLzBmbEVRQ2diUnFxdkhk?=
 =?utf-8?B?TzNJQXVCSjBCcW1JMEI0Z1JsaHlNcjZJTFNDNzJTVlJpL2ZyZ1k4WmZoSWlo?=
 =?utf-8?B?SE4yd0EyMk5qMnN5WUlGdlUreDlqdjB2VXpPRWc5eEZGelJPQzdldGtJYTIr?=
 =?utf-8?B?dHYvQVZDYld6cS9SU21NMlFJWHFtZ3lGVmJJL0xEbGRtZTA5Z0ZPSXlqYVMv?=
 =?utf-8?B?SlJOcW1MbUlMaGVLOFJWVlE0b0NVdmFPeWpXYVJBNWJvcVVQRWlPSW9WYysv?=
 =?utf-8?B?UFBZZXhCcjVoT280czNCay9NL0dOT05BVXRSQUZxVk9BcjJJUkJGOEdnNGkz?=
 =?utf-8?B?Sk5keHV1aVhGUmZaUFJtcy9tTFYrWHd6bDk3Q3BoZGlxbzlPNDVsV2x5Nk4z?=
 =?utf-8?B?bU5peGREalRocHovL1J1dEFHNVRqYzVoQnFxSHg3UEdtZ0RpdWxSWHVETWUx?=
 =?utf-8?B?VkYyb0hNRjVDZXpXUWVUZzk2MmFPMVdkTTVhZy95dWFLMG9abGtyVXl0UU5S?=
 =?utf-8?B?b3VUaDgyY2h1b1lGT05MeFNlVHlIMkpkYW1jcStsZ3ltV3I1bENLTlgyMHFR?=
 =?utf-8?B?MHRabGNydHRXVGZUcWNJRzVBWEhWcVBDcVhoODVlRnJ0OHdRNjJ4eVhSbnly?=
 =?utf-8?B?RGQ1NVh3S3RBa1VWdjFKYlpzTjFRTHZvTGd4cUpZUzc4TWpsZ2FBR1ZLQm9l?=
 =?utf-8?B?OVFPVDRpRGg0ckM1Vkk4Y28rVjVYVEI1ZldkaUlsZHRJU0NBZnlaVXJ6MlQ2?=
 =?utf-8?B?MVYrbDdzZEpZUjlaMmhDbnNZazMzMzVSeGN4M1dKcE5yNzZpSEZnZzJvZFZs?=
 =?utf-8?B?M1hKUXY4WWIyWk8xUlNYSTd2ejNXcGRuQ0lxdEtFaEFOS0ZRYnJDemZaeEZr?=
 =?utf-8?B?TWVNMUEwWUc0SWdBZWhscFdYTWZKcVROdmRuZzg0ekdUQjY5b09vNkZKTXFz?=
 =?utf-8?B?dkNzWEpoM3NqUlNyalFXeW91ZnlYbi8yNTZnblJaUlFqRFRON3I2Uk85RXFV?=
 =?utf-8?B?dkhGR3d0WldzUERtbEd6KzNRdlhzZW96SXZwZjBmTXJZOERoY0pCdWZRenJy?=
 =?utf-8?B?ZHA5L0dkY05zUi9rMEFNcTVKNkVBdWhJWlhvS2lURWpZS2hRRWdmYmZvczdX?=
 =?utf-8?B?blhzSFU1L1lpWW5uaDUyZy96T1ZCUGEyd3AwWHhadjlqOXU5RFFpQ2w2d1h1?=
 =?utf-8?B?Wnd0c0ZXM1lZZHZmckFQWHhhYmVDU0hnVnhrNEhydS9SZmI1Wmg3YTluZG1L?=
 =?utf-8?B?b2c0UFNXdE9SRzgrWnlQczducmFiYjBHUm1FdFVUVlVqUEozdnRqTnp5WHgy?=
 =?utf-8?B?VDEreVVnWENJRzN5QThNZlExWFp0bEdVOE9COGt2dWpCNmFXazd1ZCthMkVE?=
 =?utf-8?B?UUp6ZXNuVGwxTVgwRVRBci9YR3pqYkgwRUtnZUd5VmM5bU5PZ3VxNTJ5UEN0?=
 =?utf-8?B?bmJGWFkycmQvV1dHVzB1UFdSODF2RUErZ3hKYy9OclRacnVOTjl4YXhNeHNs?=
 =?utf-8?B?ZDlLQ1hNUGU2eW00ZHRDTjNiYWJpTFRZQzQ3ajBBNmtoUjdVTmJQc0RZQU1l?=
 =?utf-8?B?SzUraDlpWmhvcCtpeHA1bDRzSHZzMXp6Q2ZMVzQ0blVzWEpDWlVsMEZxNTdT?=
 =?utf-8?B?UDJFWWRaaEZGSEN5K0Zha3RKeDdKamNOeFZORDB1dGhuakxyL3Z5ZGxuS1kv?=
 =?utf-8?B?YWh1ODQyYzF6SXNUWEYvR3lBYU1MVk8yQWM5dmJ6RitpSjA0dnRBSG1rNzEw?=
 =?utf-8?Q?RNl633btqXE4H4Xr0aCKAoQoP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a6f4d7-73eb-4975-f3d1-08dbecc95805
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:42:51.3513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Q4eBIgR+7Z7yruElX/D968kOtYllrO9O/9/hibgYghBLZjR9qkJZ7XnuVHeySL+SR2fIslZCMy7kBdfXb/ADg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9438

... to a field in the capability/controls struct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-u32 vmx_vmentry_control __read_mostly;
 u64 vmx_ept_vpid_cap __read_mostly;
 static uint64_t __read_mostly vmx_vmfunc;
 
@@ -237,7 +236,6 @@ static int vmx_init_vmcs_config(bool bsp
     struct vmx_caps caps;
     u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
-    u32 _vmx_vmentry_control;
     u64 _vmx_vmfunc = 0;
     bool mismatch = false;
 
@@ -448,7 +446,7 @@ static int vmx_init_vmcs_config(bool bsp
     min = 0;
     opt = (VM_ENTRY_LOAD_GUEST_PAT | VM_ENTRY_LOAD_GUEST_EFER |
            VM_ENTRY_LOAD_BNDCFGS);
-    _vmx_vmentry_control = adjust_vmx_controls(
+    caps.vmentry_control = adjust_vmx_controls(
         "VMEntry Control", min, opt, MSR_IA32_VMX_ENTRY_CTLS, &mismatch);
 
     if ( mismatch )
@@ -459,7 +457,6 @@ static int vmx_init_vmcs_config(bool bsp
         /* First time through. */
         vmx_caps = caps;
         vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
-        vmx_vmentry_control        = _vmx_vmentry_control;
         vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
                              vmx_basic_msr_low;
         vmx_vmfunc                 = _vmx_vmfunc;
@@ -496,7 +493,7 @@ static int vmx_init_vmcs_config(bool bsp
             vmx_caps.vmexit_control, caps.vmexit_control);
         mismatch |= cap_check(
             "VMEntry Control",
-            vmx_vmentry_control, _vmx_vmentry_control);
+            vmx_caps.vmentry_control, caps.vmentry_control);
         mismatch |= cap_check(
             "EPT and VPID Capability",
             vmx_ept_vpid_cap, _vmx_ept_vpid_cap);
@@ -1056,7 +1053,7 @@ static int construct_vmcs(struct vcpu *v
 {
     struct domain *d = v->domain;
     uint32_t vmexit_ctl = vmx_caps.vmexit_control;
-    u32 vmentry_ctl = vmx_vmentry_control;
+    u32 vmentry_ctl = vmx_caps.vmentry_control;
     int rc = 0;
 
     vmx_vmcs_enter(v);
@@ -2160,7 +2157,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_vmentry_control        = 0;
         vmx_ept_vpid_cap           = 0;
         vmx_vmfunc                 = 0;
     }
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -233,7 +233,6 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define VM_ENTRY_LOAD_GUEST_PAT         0x00004000
 #define VM_ENTRY_LOAD_GUEST_EFER        0x00008000
 #define VM_ENTRY_LOAD_BNDCFGS           0x00010000
-extern u32 vmx_vmentry_control;
 
 #define SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES 0x00000001U
 #define SECONDARY_EXEC_ENABLE_EPT               0x00000002U
@@ -286,6 +285,7 @@ struct vmx_caps {
     uint32_t cpu_based_exec_control;
     uint32_t secondary_exec_control;
     uint32_t vmexit_control;
+    uint32_t vmentry_control;
 };
 extern struct vmx_caps vmx_caps;
 
@@ -312,9 +312,9 @@ extern struct vmx_caps vmx_caps;
 #define cpu_has_monitor_trap_flag \
     (vmx_caps.cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG)
 #define cpu_has_vmx_pat \
-    (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_PAT)
+    (vmx_caps.vmentry_control & VM_ENTRY_LOAD_GUEST_PAT)
 #define cpu_has_vmx_efer \
-    (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_EFER)
+    (vmx_caps.vmentry_control & VM_ENTRY_LOAD_GUEST_EFER)
 #define cpu_has_vmx_unrestricted_guest \
     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_UNRESTRICTED_GUEST)
 #define vmx_unrestricted_guest(v)               \
@@ -342,7 +342,7 @@ extern struct vmx_caps vmx_caps;
     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
 #define cpu_has_vmx_mpx \
     ((vmx_caps.vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
-     (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
+     (vmx_caps.vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
     (vmx_caps.secondary_exec_control & SECONDARY_EXEC_XSAVES)
 #define cpu_has_vmx_tsc_scaling \


