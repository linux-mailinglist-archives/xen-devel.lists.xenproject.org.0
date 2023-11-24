Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368577F6E55
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640225.998166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RhJ-0005aL-1u; Fri, 24 Nov 2023 08:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640225.998166; Fri, 24 Nov 2023 08:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RhI-0005Xg-Um; Fri, 24 Nov 2023 08:38:00 +0000
Received: by outflank-mailman (input) for mailman id 640225;
 Fri, 24 Nov 2023 08:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6RhH-0005KO-KO
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:37:59 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe13::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4ff025a-8aa4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 09:37:58 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8526.eurprd04.prod.outlook.com (2603:10a6:102:211::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 08:37:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:37:56 +0000
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
X-Inumbo-ID: c4ff025a-8aa4-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFyWAl3ZlG3rO+eN5/8Seh+YTVvJWa25Kb4SFWCuhX28Ys4wCPOgysmo1CE56DpYljTn/IYspPeHF+KInaUtr5utSJQ8GkBwZ2XeZrUrlG8NAtrcNUanElePyHiNcuS2vcZ9Y2MRpr6CE+BWUNyr2iDZ5GA6Db10JoDRJpDCRg61J/n9x/Q/2eYz0D/+mfj3Wif4O01fHUgjJFnAKNV+Pw/gwKU+QO+0oTTK+JXPsBm2rTDpDnbFmMceiVHrOM/wvsV7qnAyK4Bd6lRurbUHGkJCAzpHu+nAHZ38MBpZTeZ20mWS3OivrrQxSK4o2VBxuba71WaS614t52qNnB+fig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMAEifarQuKo3OJKrRoIbfb7jebQhVGeV589a029+JA=;
 b=jA8Mke0KTaBqfiuaB1BpauanGLungASwdRrFYfbqkbnvjqN4llF8Jqv6jrj7qdG43Bk/pvSGo6yArwG4guKOmY8xWsWwNcXLJVHAZI4+wb8V5QT3hajoCiJOHnmTYA/dMBbOZXAbvtxcuDWPNIEdoOyoAf4C0JPQjJzGipZxLO/B3DiuwLT/LvRNg2XxJ9dMeeUiivmqXGb53gu17IrFvlfoXLmnOLZkZ6u7im0HhuLC8p4Lw1f/IkOD/XptZ0CuxzA5olkc0CINhrEez1FE4mOKdWM611H5zN4Pgwz8t0e65q7bQNwDJWJJybd2mnXRS51S3Be6hZfqqiaD0D7yBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMAEifarQuKo3OJKrRoIbfb7jebQhVGeV589a029+JA=;
 b=krhj05WXD2CVi5abH6vjjn4Mf8tDNUnz1JPeaRmzghxYLj4QvG+ChDhQHJAPn00pmNGYKjTh9RRxYLDF4/U1Xa7ISNEQE1/tTF2MkJdOaXSkiDx+wQx256egJ5AGOtOZN+uhu7M+NOfkhNbZkirD37wJolyfB5ipsA9Ac2rEyttkFTVYdaSmZ8K9PFR9PrCVl4GNPe9AyH8qAgVm+pRVTCm2zeOIoYZ29WhfO7knMlWgSyXc9/boB2z0IcBnAWQ76N2H82EiqyaQF6njwIYEA4E5UNSr2s04IGpPwsIXqAdFKP0znf2TYm4zydePEOUWsVZlrtGd81iYq/IMbAdYaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c30c6e9-8eba-4397-bec3-83474868aa94@suse.com>
Date: Fri, 24 Nov 2023 09:37:55 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 03/15] VMX: don't run with CR4.VMXE set when VMX could not
 be enabled
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a589265-99c9-4a50-0211-08dbecc8a837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WmX7J2Stomjl142hTi4Dk6IOar6jSxX05S88X8uFAddq1YxyWcayUatoQK2+jynom3Md3NHM9AkdTDqRTKg+WxQduSjuGdRz+hjvWuh9sB91Lu3d9w+vCPLZ8lKLSR9QFzzXmlIr4WOCnPPN5eF47kbIOIemrVYB8iRRPhaRML+LxpsPqnvH/bcZ+0TJY5fK8tK9hD4IrAuQtmzFg3ygl45V7NluUZOoNPLhzvXhdVdaVaWnj5LY+zTf52oK3RMzR7QhRzvT6NksASKeC9HF/l8oedPj9hdcnaRdwNPsj73aZwngYSgH647XyIjaRRQvfvXW0BvJgVV7E1dptvh793EqQiPJI3l7m5NuQDwQOk1yao4i6oKDjPwYJTrpBzWBSUfGuUXscXJQxtgy3Khhwjoh53fu7dFzgmw15HVjEg3XzRHFvtH9Q1LwHuVYl7wD15ys0WYd0pufdYE+gWWsPPR5R+cmq4Fzbv1h6ITqquZgqpRhRgV02+RTs/WZT9DGOzxFYVN5ssTsW5A/Ag6jCF58opZMfLtkPjuDmMsMgvgibkyt55FkUOewv3D93eUGraOccAjxV4KguE4LqCSvz1LyIrdV6kSgF2XJWkTutPn8ngUlQ/32C7G6o+qpANXMEtVT5BCBjEPCQGSPkZs69A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(4744005)(2906002)(5660300002)(36756003)(31696002)(86362001)(41300700001)(38100700002)(66946007)(6916009)(66476007)(66556008)(6512007)(26005)(2616005)(54906003)(316002)(478600001)(6486002)(31686004)(6506007)(4326008)(8676002)(8936002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1JaU0hNREtkU0JoTjZBQytOVEtMejNxZzlJRmRlWVdTTEFQRVBXRURRL0N4?=
 =?utf-8?B?dHIvUGFZU3pDRlFvbFp2Z25UNTRDQm5wQ1gxdzN2cGtMNXRNeVZ6S3JGeFp6?=
 =?utf-8?B?VjhCajBodTZHdTJmTHZ1amZrNUMvaDRuU0FsSnpjd2l4Nk4zcUhZNjR2MTdr?=
 =?utf-8?B?aDlhd1lTL0xMa1RxTHNqL09GU0gwRytHazlLQy93K1MxMTh2R2RQaUQ2Wjg4?=
 =?utf-8?B?TUFoTGVjRXc3ZzFIVjQ2WVdzY3ZEbG1yM3NWdy9nSXY1RVcvbU13alc4MVBr?=
 =?utf-8?B?Mi9NZjNTem5ZeUhYUWpJbzNQN3ZreHFPaUZuSDVTaHo3QkFHSnM1UG1tS1lN?=
 =?utf-8?B?czBsNzU4QnIyR0Irc1kvSlU0a0hwZHlHOVBiY084aitick9kNjE3eDFxNzlQ?=
 =?utf-8?B?STFLcmcwaDNIS0FMWXhYNlVrWENVc0xEYWVXUzlndWJWZVozaHBLbHQ5VHJy?=
 =?utf-8?B?S0Z4a0I1VWJIMUxhQWc0WTBoOXZKMEdjNGRIU1FNbE1JbWU3NktkUlNmWVN1?=
 =?utf-8?B?ZGV6N3lISDFaOTZ3M3BjUU1Xb09jSDByZWdXM0RVVkVNZnA3SGZVSmR0ZDR1?=
 =?utf-8?B?Skl3ZlZIVkd1QTh5ejk4UzkyTk5ncnJ1N1R4SFNxWXhPWlFhVDY0NHpBSFMx?=
 =?utf-8?B?SFZJTVhEMkxSSElkWGI3QitySTdqLzlMMVg4Qm9kczh2ejhSZWkyNjl4Umpp?=
 =?utf-8?B?d244ZkVBSjFuY3hNT3lTYjV1QTlIdEtSWjIwaFV6OTlIMTcxTjVrUGhCZGRH?=
 =?utf-8?B?MHU5dEVFVGF4NjNpV3BCTHRZN0RDTTRCSlltbE5ESEpUbnI2WnUzQTREZEov?=
 =?utf-8?B?VUVCSVNpY0Q5YXJHNjZUNHhoQlQ3Uk5DeklCdnd3WFlFOU9xUHRLcVgxZDdW?=
 =?utf-8?B?R1p4U1dPSlNnenN4TVlVRlN1a3QxV3VQWXlSSVhMQzJiUDFUSEg2U251N3p5?=
 =?utf-8?B?RXE5ZCtwRVVGejRsUERZeVNhdGladG9zclRMRFZBRWdrVDRXUmhWNWdOQVVp?=
 =?utf-8?B?MXI2QVBlOFo5b3pna00zOVZVYTVJYTBFa1VadnBLTnJiY2ZyNzJPdzJEb045?=
 =?utf-8?B?a3ZyOU1YZ1lHU3hPMmFPM0RJdTdlQ0Q2ZnN2NDE5b1JtVzhDdXgzeXBmM3Rm?=
 =?utf-8?B?QW5pekt0SEw2OGlZZFZ4UEljY1lkNERJbmdoRWdNUDhYcG5WbXNJaGt3UG9T?=
 =?utf-8?B?Wi9xTGpnTERJTU1hb1NqNkhsamVwWmQyNkhBMWxjWUY4RUpDNDRmWFYvUElx?=
 =?utf-8?B?U3hieE9BZXpFYVBzaS9rbGZ2clA4S1p6a0ZJbXJ6Witsb0ovRGw4Qk96dWZa?=
 =?utf-8?B?bkhlRkJ5cGhpanZ1cU9oOVhtS2ZGN1F0dHYrY1dBdVRiNit3QTMwY0xVWVdz?=
 =?utf-8?B?dlpBWk5oYS9QMi9OTkxkcHRtcjhFZVJhV3NsYUticEFwZGlvSklBTEhaQjZM?=
 =?utf-8?B?WXdqQk1tODkyVGYvYTZlUkFQZ1hEdEg2ZXorMU9xU3dtc1FLK0tBSWNob3BR?=
 =?utf-8?B?eXB5UnFlaHBtMlIyaHJoeUMzbDFJYmtpenM5OWFIankzV0ZJZXZJY0ZtZHVs?=
 =?utf-8?B?aXgyK2o5N2FOUUFjS0hIOTFBd0JFVFpWMTN6cFRTb0FxMUplamkrdGhXUDE4?=
 =?utf-8?B?WVdYUStIak11ZDJnK2VNd3JhcUVXM2hXaVVqWEN0aGt0UjllSFM1K0hDVU5B?=
 =?utf-8?B?ZkNZZUtvOU9qQ1h1TDgyMWRmVTN6dU81VFlTY3pjRk5GQVhFNGpQZy80N0cx?=
 =?utf-8?B?T1RXNXcvRnc3bHpMZ29mS3ZxclVzVCt1WVVvdmFGbnkzbHIxLzJZSTQxb0sw?=
 =?utf-8?B?MG54b2tUYUFvREZqUUt1R1BpUmNHRDJzRU5jUlAxOTg0MHZwYVc4blk4Z2F3?=
 =?utf-8?B?SnNrSjZBbXRIdFZPUjNFWGIzUkZlMFU0QXZ0UWg5aHVsN0hEbFIwZjV4NExB?=
 =?utf-8?B?MXJMVmdrRGtRVnpUQlFOYjRiM1Nlc0lUZHZSUWJSY0tWNGtybVAyeTYrR1Mx?=
 =?utf-8?B?NS84clpkRXBlU2VzZ2xnZGhsTm9QeEs1R202eHYrZG1LeDRINEFZM0dlR1Ew?=
 =?utf-8?B?Ulg2TkFCU21NY1RmcHp0aDhOSW4va0tGTDNPQTcrdHkzckVoRktDdy9oRXZw?=
 =?utf-8?Q?eQ83622SMhjQo+JTcdfh+NDs1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a589265-99c9-4a50-0211-08dbecc8a837
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:37:56.3806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZiA6hz+iqVc5oGE2oErfiRgLNGIOaIeEo/vXWW3vlSQw4mODlwC9pSUY1TTPNCaPJtDm23U//Z4H7ouIinaOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8526

While generally benign, doing so is still at best misleading.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Using set_in_cr4() seems favorable over updating mmu_cr4_features
despite the resulting redundant CR4 update. But I certainly could be
talked into going the alternative route.
---
v2: Actually clear CR4.VMXE for the BSP on the error path.

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2959,14 +2959,18 @@ static bool __init has_if_pschange_mc(vo
 
 const struct hvm_function_table * __init start_vmx(void)
 {
-    set_in_cr4(X86_CR4_VMXE);
+    write_cr4(read_cr4() | X86_CR4_VMXE);
 
     if ( vmx_vmcs_init() )
     {
+        write_cr4(read_cr4() & ~X86_CR4_VMXE);
         printk("VMX: failed to initialise.\n");
         return NULL;
     }
 
+    /* Arrange for APs to have CR4.VMXE set early on. */
+    set_in_cr4(X86_CR4_VMXE);
+
     vmx_function_table.singlestep_supported = cpu_has_monitor_trap_flag;
 
     if ( cpu_has_vmx_dt_exiting )


