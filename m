Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF57EAFE7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 13:33:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632358.986649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2sar-00065J-ME; Tue, 14 Nov 2023 12:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632358.986649; Tue, 14 Nov 2023 12:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2sar-00062r-Hx; Tue, 14 Nov 2023 12:32:37 +0000
Received: by outflank-mailman (input) for mailman id 632358;
 Tue, 14 Nov 2023 12:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZB8=G3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2sap-00062l-6v
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 12:32:35 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e02d4c5c-82e9-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 13:32:29 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7685.eurprd04.prod.outlook.com (2603:10a6:20b:29c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 12:32:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 12:32:27 +0000
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
X-Inumbo-ID: e02d4c5c-82e9-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXMtckswGgwYjjs4sZ4mBANhF+HoVwtjw8pbinfLzG0tVIrhGd1ZvB7OhdhyT9+N4eDnS6m78lSxrvQXUpYKbf0q5P0y/JgoohdhPU8nBijUyS+FtPJ2pU8Q4xofqjUNVMqwKZHTa46ElIXuYFqAgThzlXRfUyYE4Z+qvDdCrwRf5fSwsdNrR/8ibAgrIShfIXAhaQ2c7XYK2tcMcQLR5APetCzUW8rl8F6+7+R1tnCquIQhW1TFOJIt7OJWmt18XJOFpsA+hxhootQ37jNblbbbvJUbYoNcTngg+5TpsxXa8jQXjw94stzchqOqTnfVPxUSbKL1rdzc6dkkXZGCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NgwVHFAg5mf9Q3oV867REBeeqplWwJ9HT9EusJB+lc=;
 b=j5ApMFm1qSv99vYxIyzKsm2BnzESNLRErANSOIm3tUfrYKza6JYmWESTfsD8Ew+L5vULBIXDsc3lTXnXbEX33lWdf9EWqYwkoMAC+aDZ3U/A65igpNk/ghM9+mr77sJ+WXMymHImpPx0wRCU8NCX3I7T9DFSiG9GBXK0KHi91g0HJdHkF435R6kulLB9xFNE3Hlu54iyN0pDRxwjku1h/tGS1PKv3ENY0jQhH0G6OQgXyCj3bLjWzxhrUkWSFtKZLgnD3Bir0xBzVxBG6A22NzRcNuaN2/KMpqB0KqyLuo4c6CNrfF4I8gHa3IYQPgxGzypcDFUvt1+TdipektmVcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NgwVHFAg5mf9Q3oV867REBeeqplWwJ9HT9EusJB+lc=;
 b=lEiUViWEMGNULQmVk5dodkwWK8469F+w+pMg8jGfITXYRSFx/CEwIgnYKwwKzd7XTLobvG0dz3nQyQ4kURcmYPPdpCRehXGe6w4wnRLG0KE2tNeOi9yVylR2SMPFesX1XjDtmjWFMD4dHzin2v9+YFzvtEGkSdPo4B1LJw2hJVY5clFGBnlhqPxmXu3Yv4lk9I3I3FKwGl9b9juZRFYQgjtbLy0in/ArSpNcqjBZzvQBtFy9kgKaEcUGqVxRWtlsRRRX7P5dUT8CE1J5Lft/lwb6zB2ZtPev9GnhQmSLw2xPoagemlYNxILd+RGzYDVhb0L1sMkO65neVydwHRRj4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f278f367-81cb-4a72-9303-23622dea3abd@suse.com>
Date: Tue, 14 Nov 2023 13:32:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: On x2APIC mode, derive LDR from APIC_ID
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20231113165023.5824-1-alejandro.vallejo@cloud.com>
 <ZVJifMqOR_3zINYZ@macbook.local>
 <5c4a237e-975d-f452-1261-f9fc10ef65c6@suse.com>
 <65536590.050a0220.eb28a.617d@mx.google.com>
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
In-Reply-To: <65536590.050a0220.eb28a.617d@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b1638c-b7c9-42a6-40ae-08dbe50dc2dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IW1DseLEczGZVOZVDVigjK8Y0MdAoNNRmywSXe41tyjjejTFd2ThceVv74tgaAFLg3N7mg6T+TZiCAAd/kLOar/UyUAlVZZjw2J40HOTaRTl4aJYf10ebhdu+slGUaY2ZmtXm/L7k+8I4bdt18b6cmULUz/Ltbn/sZ32E9UCAz1McYa8YI5JcNEcvslt6vYbJcifB8YZV1EpYEH8YfFlMg62QiH4Yqr4uhVdbMEGQBaGbR3a6YCg1L/yeLRWue7lnx248tRhnQ9yfVgGrQRC+9o7WZyvar8WNE94pb8cX/1yxxtKj+hcRhFbfGe3bJ99kcO7PmQY38oAPqslIYWpHLdYNFi+ZtlgjspMNgpy/OPIXWu8DYijyVbCocvSGOMtf0AyxGomhKzdzkuGGUSxyskGsMc5I3fpQ7GYTQuzJ5C6+MyeoJgf1/a7SEM10BuPyn5+YZr6e4SxOG3glDtZ5RGCGrzVj7/CQzI+8Wq0HvSAPLCBQoRR7FqJgC72Yqd40NSvINzxHq4O2CDWvlPjWqCclUvl1esSSkBR27oskDrXP3Da0aht1gAfTlKqU1VzHxb4Vth+4gpQFS15rtpJzJr+v2jQc/FlNDnsS01eqwx4u1jNVCdRTtJlGu0L7EPBiO9F/CdUMqD+Hws8/0XUZQl7TQuadQ0cgtfRl4UZxFvUq1nxvPLNkuXdkSLsWEMz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(86362001)(5660300002)(6486002)(66946007)(31696002)(6512007)(36756003)(316002)(4326008)(66476007)(8936002)(8676002)(66556008)(54906003)(6916009)(41300700001)(31686004)(2906002)(38100700002)(26005)(2616005)(6506007)(53546011)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkpwbVM4OGtHc1lKMlROTnkvbFRDTjYzZlpESXFGTFlIUXp0SFlacStKUGhp?=
 =?utf-8?B?ckxSOGhtc0l4ejl2cmZKdXBHS2QxWURGaGdsTmdJNXBsTFRnbEFqRXh4ZmJG?=
 =?utf-8?B?enlFSitadmo5WDRtaXkySkx3T24wSWk3TmlMSWdkdndKZ1VjQXVGNVJzaHJo?=
 =?utf-8?B?ZGdFQThYTVBVZVQyY2ltLzFFOXRDT3VzZUNPUzRWWklWZmJvTlZUNW92eDNZ?=
 =?utf-8?B?ZloxOUptb1I0Z2xUOC9IY0owejFSZFNadkFZcDNmUnBhVkdIdExvSU9NNUVP?=
 =?utf-8?B?Y3RkaWQrMFVmYnJTN0RRbUpVVnFkc2QvdlViY0I1aW94Y1FFczRraGV1UU5K?=
 =?utf-8?B?bEkwZzM2NVgrcHh0ZDBKeU00L2doV1BudnNJa0p1L1BJNTkvdjdJWkc2OHpN?=
 =?utf-8?B?Rkg1aXFJMlp0VXRrYXBQZmNxQWVUVm9YWVRmTWVJVzRJWlo2SEpuaTFXeU5w?=
 =?utf-8?B?SW9lWmVhWXdKaU9oOEx1Qk9aS053aFFtOWM2aUcwNGZGNmZPdVlhaHZoZ3JU?=
 =?utf-8?B?Y09NQWZ0V0xpMko5MlFZOUVOSzVOQUx5WHdPanJmazVLdkxvNndkQVU2d01k?=
 =?utf-8?B?dGo2YTJ1MEErUjQxekJJeFlROUg3TUJXZjIvaFNSKytKc1BGQUQwa0xBc0dW?=
 =?utf-8?B?Y3QyTWo2R2RYUlE4Ym5EazBoNVRGVVlKZEQyTW9oNEJ4b3JkMS96L0xhL3RH?=
 =?utf-8?B?NUJucWR0S1RROGY1SUlHZVFLMTBUeWhHaUs5bUEwMDZXL0JiZmZoSGZFZEN2?=
 =?utf-8?B?V0tYRDhDRFBYSWlRR0dvMEZ5WXJRUzl6SXZ2My9qd0UzOFBkcUdUQ0FIWlpU?=
 =?utf-8?B?OC9Ya2o2UzJ3OC9RRXgvTnVKemlOTG0zbVVEQmgrSEd0VGZ4aFVmbjF0T0ZM?=
 =?utf-8?B?VVdJS0VwanVESEs5QTlPb1o3M2tzWHZnNDRjU21pZ3krYXVOYlVsRDNtdWNZ?=
 =?utf-8?B?dFRJYVU2WkIwRDdjSFR2NlpoQmpxVVhJc3JoZUphWVViMmcvTVZxeitWc3lI?=
 =?utf-8?B?S3VobjlzdityMVlKWHV3MDJmV28yeFJDNVZWYzY5QWZRZVBUcENRL24yWHBF?=
 =?utf-8?B?dmgvVEVnSXR4aWpkVnN0RmlzUjdFRE1ibnZCSVZzOEYzRHB2ZlV5WnBINFR3?=
 =?utf-8?B?a29lbC9GK2tkMmxtb0pFQStIOWR0Z1JTbElHK0ZKdC9HaWFFWUhJbFdPbmRU?=
 =?utf-8?B?bHA1NGdEeGdzSVNDNkk5S1JmbjRvbGxoQnRCM0lDY25iek9LcWJ0UjJIVGtZ?=
 =?utf-8?B?RER2Z3l3MTBla3M0VDZTMVZMTDBQaGVoeGgzdk9saDBwb2pUTVRmYnFsQm9x?=
 =?utf-8?B?NHFXdzlLMUpHN2VJSmlEN0dlQW1TaG5SellxbVZqNUFoczFpNk9NNnFlYmQ1?=
 =?utf-8?B?NjR5QVB3dmo3cm96bGNoL3NGUWYvaHlXL0F3ZWViMW5sMnh0SGgzVGpQRi9x?=
 =?utf-8?B?aWU2VzZJMEpPWDFwakVsL1pMdHg2eHJmNHBhRi9yc1pzbnBrZC9KMncvQjN6?=
 =?utf-8?B?SmRJN0NjeGt2SkgyMWl6aW9BQWpLSVFMaFJ5UTJ2eDUrUHU4eEQraGt3VDBu?=
 =?utf-8?B?Z1RkUnc1bHpWRmhMeDliQ0psK2hnZHFTMWtZbWtDbjBVR3AwNmZxRFkzamNp?=
 =?utf-8?B?WER4b0krb3kvdDJLdEkzUEtFR1pGa3k0bUhBZXlnRFoyR0NwUEJUNVJqVTVG?=
 =?utf-8?B?ekg1UHBUT0M2aEMwWjNMMHJqZTc0dGFpMHhtR045SHlvcnBCbEl2VDdDK2ov?=
 =?utf-8?B?bllnbzZFTXVHcGFaVFF3OUdKK3ZiN2VrT2hTeXZQWFNTbnpMVHovRkpZUHFZ?=
 =?utf-8?B?cUpDa0tFb2YrU0VvR0J6RlVJRDdzQXd5c2c5Tys4WVZpcXd6d3JnRGY4TFho?=
 =?utf-8?B?aWFWZWhXT2VFTVcvbWxtdDJuRUFYdFlnenpoR0c0cm00TlBPQVN4K28vRGdq?=
 =?utf-8?B?V2FCM1JVUnV2ZHJWcU1LTm9LMW9CeitRcXNENEVZdGxPWXN0WVhtVEFXUG9E?=
 =?utf-8?B?M0t1cEJqaTlQUXBoK3B6dFgyTGlIMjVuR1BSMHZ1Nm1aeGVwaEMwRXBRRzEy?=
 =?utf-8?B?UGVMMERPaGdRZDVxcVZWVzlMUWROMmRmd1Z5RzlVUzBMMFhvMm95c0d4WVhI?=
 =?utf-8?Q?vi0cA5PdknM1RlsCTqChX/NBw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b1638c-b7c9-42a6-40ae-08dbe50dc2dc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 12:32:27.0871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZN/FEx5iaq8kMzPEDKYto6ogHrcTD7C523rM5Avj8PCjrmQOn0CqELpSd1dgjNmJC2eLKJMJ1VOHlOdJPxUBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7685

On 14.11.2023 13:18, Alejandro Vallejo wrote:
> On Tue, Nov 14, 2023 at 11:14:22AM +0100, Jan Beulich wrote:
>> On 13.11.2023 18:53, Roger Pau Monné wrote:
>>> On Mon, Nov 13, 2023 at 04:50:23PM +0000, Alejandro Vallejo wrote:
>>>> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
>>>> registers are derivable from each other through a fixed formula.
>>>>
>>>> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
>>>> rather than x2APIC_IDs (which are not, at the moment). As I understand it,
>>>> this is an attempt to tightly pack vCPUs into clusters so each cluster has
>>>> 16 vCPUs rather than 8, but this is problematic for OSs that might read the
>>>> x2APIC_ID and internally derive LDR (or the other way around)
>>>
>>> I would replace the underscore from x2APIC ID with a space instead.
>>>
>>> Seeing the commit that introduced the bogus LDR value, I'm not sure it
>>> was intentional,
>>
>> Hard to reconstruct over 9 years later. It feels like Alejandro may be right
>> with his derivation.
>>
>>> as previous Xen code had:
>>>
>>> u32 id = vlapic_get_reg(vlapic, APIC_ID);
>>> u32 ldr = ((id & ~0xf) << 16) | (1 << (id & 0xf));
>>> vlapic_set_reg(vlapic, APIC_LDR, ldr);
>>>
>>> Which was correct, as the LDR was derived from the APIC ID and not the
>>> vCPU ID.
>>
>> Well, it gave the appearance of deriving from the APIC ID. Just that it was
>> missing GET_xAPIC_ID() around the vlapic_get_reg() (hence why LDR was
>> uniformly 1 on all CPUs).
>>
>>>> This patch fixes the implementation so we follow the rules in the x2APIC
>>>> spec(s).
>>>>
>>>> While in the neighborhood, replace the u32 type with the standard uint32_t
>>>
>>> Likely wants:
>>>
>>> Fixes: f9e0cccf7b35 ('x86/HVM: fix ID handling of x2APIC emulation')
>>
>> +1
>>
>>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>
>>> I do wonder whether we need to take any precautions with guests being
>>> able to trigger an APIC reset, and thus seeing a changed LDR register
>>> if the guest happens to be migrated from an older hypervisor version
>>> that doesn't have this fix.  IOW: I wonder whether Xen should keep the
>>> previous bogus LDR value across APIC resets for guests that have
>>> already seen it.
>>
>> That earlier change deliberately fixed up any bogus values. I wonder
>> whether what you suggest will do more good or more harm than going
>> even farther and once again fixing up bad values in lapic_load_fixup().
>> After all LDR being wrong affects vlapic_match_logical_addr()'s outcome.
>> I think one of the two wants adding to the change, though.
>>
> You mean changing the LDR of a vCPU to the correct value on migrate? That
> feels like playing with fire. A migrated VM is presumably a VM that is
> running without issues (or it would have been rebooted). Letting it run
> as it did seems safer.

See Andrew's reply.

> I don't think vlapic_match_logical_addr() is affected. The LDR's are still
> unique in the bogus case so the matching ought to work. Problem would arise
> if the guest makes assumptions about APIC_ID and LDR relationships.

The LDRs still being unique (or not) isn't what I'm concerned about. It is
the function's return value which would be wrong, as the incoming "mda"
presumably was set in its respective field on the assumption that the LDRs
are set in a spec-compliant way. There not having been problem reports
makes me wonder whether any guests actually use logical delivery mode in a
wider fashion.

Jan

