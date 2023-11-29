Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ECC7FD01F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 08:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643708.1004132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8FLs-0001bJ-AW; Wed, 29 Nov 2023 07:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643708.1004132; Wed, 29 Nov 2023 07:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8FLs-0001YH-7E; Wed, 29 Nov 2023 07:51:20 +0000
Received: by outflank-mailman (input) for mailman id 643708;
 Wed, 29 Nov 2023 07:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8FLq-0001YB-EI
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 07:51:18 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 135a1800-8e8c-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 08:51:17 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7673.eurprd04.prod.outlook.com (2603:10a6:10:202::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 07:51:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 07:51:14 +0000
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
X-Inumbo-ID: 135a1800-8e8c-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXCsyQG3psDrxoqlpCpbwqIjtbz8C71Uf7gTat6/UCoKFLXg3e3FaUmuMx6CWurGluG+NS5BRticSSft29akOdNcbUVN2nmGzfL6daFIPdQOgcxmzpmM+vrJBpPOyhlkWkANdFTm2sdfI3cDEY6MVmt8QKon3MceWSu3zfOktqpqRdGmNcFUR6GAcicy6jDDq2csPYwsTY8LejFV1PomLqqQ3J2WNQocV5wHjag1Yi6r24cvz+mx4ItVhD/G5qKbe9Xuc6c8M6wS3/xYeVNTwRIrhc02m9cPoVij/QhmJXimTUkhWGM31AIbUc7CF8fN5rRXREad3CigwKron1CvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tU/nPNIwLiSe98DbIYyVK1ECYDGBF0SlATwijqwH0Fk=;
 b=dldpKMG4l0gATpk2gZgNoM9hqsV6HVnJqN2DQefxYNHux0Zy/ZxdiA6nPdtGo7HlbNWcaT9Xu5/jDPZPCv0Tma5edg4R0zevACZIfV9qeLeMY8eTc+ccVuMNcc6L4MRrMXD96hJaCOUmSNNuzpLlaMdhs36roXT8Kg5W0FOyUWJ2fCSXaWSMAseaD/ZcEpoRm5Cw+MxGEOriUM129A3z/YMg6NyOXgqJ6Txww7Q0jZkiu8Hxbncnk+mlTtGIirf5l+FfRZXBV3vVfDRYrrcNWU9xUkpcrcAQi9iV022FrLKHnLoux0/cLFNT3cpIUnPWv6qDXakqmVMYc6ne71+6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tU/nPNIwLiSe98DbIYyVK1ECYDGBF0SlATwijqwH0Fk=;
 b=EfUV1Fvrm/SxGV5PJaMyATPWjs9/ycUQ57evO87KNxGdW277gYJEgbElvk8gkx9Cb+I8DI5GXRFxFB9igbCbnXNzvmyw7JcO1vyu0WvnM/TgfpZLqx0pkakh4sxv8uTA2IoCgvqDFvJUZwXiRY85QN0FfVsiq5EI6uh0a38JiejJr/K80k4/8cTMb5wM4xFJH6hAXTLJgVnri01+OWJTNg2vA/7w0M6qaNKUdzP/+ZlBgCvo2Ti2TmQ0dXuQFuLXTI7OPMkbhk5LMhOsPOjsUSd9RH5i2+DyDB+H4kAbrZ74BmmW4TDZrvd775PK+15TwjGtqrILVErMrhKU/zdZ/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fcb1cc57-b985-4711-a234-4aaa380b9abe@suse.com>
Date: Wed, 29 Nov 2023 08:51:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Config.mk: drop -Wdeclaration-after-statement
Content-Language: en-US
To: Alexander Kanavin <alex@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231128174729.3880113-1-alex@linutronix.de>
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
In-Reply-To: <20231128174729.3880113-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: 98504523-0fba-4672-e398-08dbf0aff5dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3YSOAhS7jDG8eHdVIYxKynIkgXs+TC9POxIXjg4VYUawGMN5NBeTosAdokRiXLD8K4FoX4e4sm1xZ6BQ2vCkdBgySSYbStzSxQamNVAOQuOvXvoxVoLsCncUlMAToRrk034yD0BjELkJ4nBOgr3kUMoJ6iN5Ir7xkO841JwMPexcMvKjpAJpyVs/qEKvhLaDaxeAHZC74CTtjqyq81TvyR+FVjIYAlBDpCZgf1VKyV+Wfq9CrdyW1bllo12qNsIH3dwvHgPkN6rMuuCNDdVaDouxw+XmltjwO35KiNsvccu4LZ4yf0PKe53bP4p0vTNddcS0fkIWPVFJNPtS+RDLt+K7kjZ79gD3SU1cP8Tc8Os4/D+IruG7JcBP9/u0d7hCkw5d3zisauM9IXe73w6vY9vDB/iGDqo75RX4VaqDsJ3XJVZ4FXbpGdHTmZUGvNmqxRCHrWoO7knUebmbeb8iiL2dZxWp1eQYNTCUPX9g9R/bmpWa+ixc7r1VxXGaALuv4rdDPSMuZQanQNxlpokwRDI9wWtZBqsMcdAaq95iLwilTfV5jSJEJVvFtUh5L/V5nCML6LpwHaDNHkFiivWnu2fWzSl9s7o2Ps7u6sIUhY6Ca0oRdBIitmq+SNDtsopuSzRsqZl8V99yfU7DUmee8kT5Vn1B22K1nOyvHPkmfq1pBlmitqpMMoBcO9iY7JLk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(230173577357003)(230273577357003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6506007)(53546011)(6512007)(6666004)(26005)(83380400001)(2616005)(66476007)(54906003)(66556008)(316002)(6916009)(66946007)(4326008)(38100700002)(5660300002)(8676002)(86362001)(31696002)(31686004)(8936002)(36756003)(478600001)(966005)(2906002)(6486002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?USt2aG5mNHpud3llZW41OWNROHJya0c5bkFRbWl1TTJTTEdmWmNaN0E2NG9t?=
 =?utf-8?B?MU1wdTBCaG81aDQ0TXlNVURjREZWSnQ1NnpJZG5XOXVwVTFFYmhSYlJiZytR?=
 =?utf-8?B?VklMNXFDYS9pTG1COVVaSHUyODBIeWFDc0hXQlduRUo3WDFyUXZiNUhxRzZv?=
 =?utf-8?B?SkIwTmpDbFp6ZDZWcE9zOVcwaDZCRUdJallONDZuT0xZSGc2SEpEU0JzUDlH?=
 =?utf-8?B?RGg5VGdLV1hSLys1U1g4WnhRbnk0VjZFTnFTK0JmbWJJdmM5bkNZd2RIOE5O?=
 =?utf-8?B?M2R0VnJvOWZQRDNHemRrUzdpT01tSEZjczlhNmFwOTZYRElCZFhzN3VKTFFY?=
 =?utf-8?B?VGl1ZDV4NHJJYmgrS25Ed2UyMzlDN0RkcThSMmJKMkJSRkpyWC9xakhWQUtP?=
 =?utf-8?B?MHRHL0ZCVWd4RkhuYU9BTk4yL29oMTBkemJtUzlRZ1lGT2g3THIwSE5TYzNl?=
 =?utf-8?B?R2pxYXpqM2N4SXZmQlV6bld2OFRMcWE2NWk3ZUFIRVI0M0NyanBpa3ljeDFn?=
 =?utf-8?B?cStmc0dNclNFRUdCdlRyakoxZDRXYlVaUzVsYjQrK3NiWVlsZ0RMTml5dmpO?=
 =?utf-8?B?cEM0Smw5ZEdjUEVoU05hVXhOS1ptSlVjaTczeVh2WUFaS040Ni91Ykxhekw4?=
 =?utf-8?B?b0RWMzlBRXJEZzNwT1d0bUs0OVBGamo0dDNKU1pjLy9MU29vaVZLbXk1VzNt?=
 =?utf-8?B?VXNOcDBZUVhiN0p1VjJjd2MvaFR4LzJZdkxLRUlCM1ViNHZIdU5LbWdhRmJw?=
 =?utf-8?B?eG9jV3hYZkZtS0twcis3RXdTdEN4ZnpZVUYwLzRRbklFcHNIU1pZV0xsK0Q3?=
 =?utf-8?B?R0lzdnVtbzJEeFBlY05JQWt5eHFoMG1LT0U2cFZWeGg2M3c1K0VlOXo5dTRp?=
 =?utf-8?B?b25seGNlcDVKOEdPamhaM2NXUjFtTFV6MWh5aXF5WHNYWDdISHVFbkNhQUk4?=
 =?utf-8?B?SlFVM296MEM3Ni9jVDhpYjdUd2FuQkU2VWljU2dkSnJCY0F6VFMxWE1JUWxZ?=
 =?utf-8?B?L3lrb1FFMGdYNmtTTHl5K3k4RGlMK0ZSL2dnQ0RCeG5rWms2R0RzOXNpcHQ4?=
 =?utf-8?B?V2J1WWFtM0FzUFFYQlUvRHJBQ1ZIR1pTaDJyYWtWRDhxNkZhblNiaG52QVhG?=
 =?utf-8?B?c054ejNEVGRJYXJ5WkZlYS9VRURCUStZR2E2TlJiWTdHQ0tzT0dDLzQ0dWVx?=
 =?utf-8?B?TWplZlNJWnF0UjdKaG9GRnNtc3FVL3UwV25Ca2h5UlZpbEdNVE1nbU93QzRG?=
 =?utf-8?B?L0lOVWZMVlVzRGx6TlJpY1UwcERkVVhzK3ZuTU1jYmlrYVAyaTZPVDE4bHBD?=
 =?utf-8?B?Ym1vdGM0bDlWR3VJR09wWEZvbGlFc2ZkalhMZFNZVDY3dlJFSWx4S2FSdzFy?=
 =?utf-8?B?RTEzZ2FEQ3RUUkViRVVXVWQzZVF4anMvb3dqSmM3OXpIVmNPQWphd0hEanp1?=
 =?utf-8?B?VE4yMFliamowbFViMk1TRUM2NGtuWXBnbWlGNmZ3bFJ0c05XenFCTUJuV0xL?=
 =?utf-8?B?dGdqaUplK0UyY0s2R01QSVZrNWZrS3lKUC9GL3RRS2xtdnpPTzVzOEptSGNV?=
 =?utf-8?B?ci9CcHB1TUlNNERXYVVuNTdNU2RCd2REK2Z4Um5zU2Q4eXpJU0REUWp5TTU3?=
 =?utf-8?B?SFZZRTBYSUJjNjRTT2NSNDN6ZUdvTnpGSm1YT1VuV0VIU1JsdjRFa1BZQTFL?=
 =?utf-8?B?RkRsSmhZNXY0MzVFYUFXUEpneDl4NkM2R0p6eVlkS0JNbU0wRS94ZTRMUktw?=
 =?utf-8?B?QjdzbmIxS2dacE5wNEVaT3llcWRDY3YzLzZwb1ZjaWEvSDdIN3JtUE8yTGd1?=
 =?utf-8?B?RkZyYXhhRDBWWUM0aDV1ZHRJVHpFcmZuVGtrOW96V3Z0K3E1VWFya1ZvQkhP?=
 =?utf-8?B?ZFQrZUZyRlQzUUV4ZFhFY3JQc2gzbVJBV01lcjROZkl2ZGFxeEZuenhWT0dV?=
 =?utf-8?B?TTNzODBkZEtjb1RObmVHSHQ3OUhrMDBxdjA0YjZ1blhmVklkTC9kV3djTDNZ?=
 =?utf-8?B?OVF4R3dKUDl5ZzM5eXgxR0QzZDlqREVMV3dFc1NIbllSK0ZXNnRBdUhhTDNv?=
 =?utf-8?B?ZlIrdVBZbWFBcWt3Zm5xZG1tS1RXbEg2clVjYXNPQUgzdXIwT3gvQlNITmNR?=
 =?utf-8?Q?1tNIacpPR0qDiJCQWsz2/yN8G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98504523-0fba-4672-e398-08dbf0aff5dc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 07:51:14.0187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQC9AHU3c6eHYyM+MINhLrgt6gV01HKkn1agAAMBWOnrKsebVy2uRBfsoH3QZS7vXjK2+u9tvOCXQlTb+unmCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7673

On 28.11.2023 18:47, Alexander Kanavin wrote:
> Such constructs are fully allowed by C99:
> https://gcc.gnu.org/onlinedocs/gcc-12.2.0/gcc/Mixed-Labels-and-Declarations.html#Mixed-Labels-and-Declarations

There's more to this: It may also be a policy of ours (or of any sub-component)
to demand that declarations and statements are properly separated. This would
therefore need discussing first.

> If the flag is present, then building against python 3.12 will fail thusly:
> 
> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:44,
> |                  from xen/lowlevel/xc/xc.c:8:
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h: In function 'Py_SIZE':
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h:233:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
> |   233 |     PyVarObject *var_ob = _PyVarObject_CAST(ob);
> |       |     ^~~~~~~~~~~
> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:53:
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h: In function '_PyLong_CompactValue':
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h:121:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
> |   121 |     Py_ssize_t sign = 1 - (op->long_value.lv_tag & _PyLong_SIGN_MASK);
> |       |     ^~~~~~~~~~
> | cc1: all warnings being treated as errors

At least by the specific wording of the diagnostic I'm inclined to call this
a compiler bug: There's no point in mentioning C90 when -std=gnu99 was passed.

> --- a/Config.mk
> +++ b/Config.mk
> @@ -177,8 +177,6 @@ CFLAGS += -std=gnu99

Just up from here there is

CFLAGS += -std=gnu99

Yet there's no

HOSTCFLAGS += -std=gnu99

anywhere. Hence ...

>  CFLAGS += -Wall -Wstrict-prototypes
>  
> -$(call cc-option-add,HOSTCFLAGS,HOSTCC,-Wdeclaration-after-statement)

... imo this removal is inappropriate.

Jan

> -$(call cc-option-add,CFLAGS,CC,-Wdeclaration-after-statement)
>  $(call cc-option-add,CFLAGS,CC,-Wno-unused-but-set-variable)
>  $(call cc-option-add,CFLAGS,CC,-Wno-unused-local-typedefs)
>  


