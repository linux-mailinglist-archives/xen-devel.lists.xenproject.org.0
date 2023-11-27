Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8599F7F9FD7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 13:45:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642058.1001145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ayL-0005CD-1X; Mon, 27 Nov 2023 12:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642058.1001145; Mon, 27 Nov 2023 12:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ayK-00059b-Um; Mon, 27 Nov 2023 12:44:20 +0000
Received: by outflank-mailman (input) for mailman id 642058;
 Mon, 27 Nov 2023 12:44:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7ayJ-00059V-Sr
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 12:44:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ade2dbcc-8d22-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 13:44:18 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9914.eurprd04.prod.outlook.com (2603:10a6:10:4c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 12:44:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 12:44:12 +0000
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
X-Inumbo-ID: ade2dbcc-8d22-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgwTxNC5tPWiCe9U5s2RpSkwENIgmvl4Ms1H2g+SU27sVTNLZ5ErGnU0YuCoBYm66tC5YbPtfM1ZA911h5na6AIrqf7o8wryvItfrxCEqZW0Oq4zyUifYr1qQ1Xi/HDJf6etVuDA0ek3MOx8AMxwQOy1WERi2IaLaml4w8Fwch0quJ138fV2Xbq6iuiYTpFxJ1kd20vegVhTnq8uX5P05hWicubVklQ0YZZJ9wUevLWJSPl2pT+M0zC8PLJWtwq8Q/MwVoRFx2fhnI3QV7uVGASF/8kUXdpW8KlmaYwaUdONbdKfUchw7ubPhpvgkINm5dXyGqp6BaVqlJT/8/bcVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xthGpBEuwGdhFmf9J40C9DGwgIsRnGhARhvPxw4yEC0=;
 b=NvfaNnab+jmxC1E4RW0DjvCia8MfUEXVSnfQkoKD49J2ZmQYbs9dDR6DGVTYIF9APoN9/+9Jtw6A00N0NXrkvGG/YPeiLyG+c6YQcZA3wPYzwucov9azKEO724z1Z0+viPUiwtoUXppD3KWv8DTDFFc6uXX9vlnmJHq+/vQBIYjCQfY1XnsGSZKPlLg4FZ8JRFn7JR9LTMmOLp7AUWFapTfqod0T0SF9P9oGx1uGmlSwWXoEoBoQa2iSAaUb5mM8Ol/wfvPw3WNInaZuRTIiLpd09513IlJxipd06suMQYOFCIP43lqDczDqemMmEbOrROH8NoxkjJPzNeM6nmCykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xthGpBEuwGdhFmf9J40C9DGwgIsRnGhARhvPxw4yEC0=;
 b=rgG1MJL9EtpcDnWmMCOAST5POeIkOI5pvsmC/11HCjbCOYXFKS9yetxfIi6giIwez8clOxrXglaE+R5Hxkvaeo9Er7U45KkbGDt4jnYnIEePgqJ/vVY0DAm1BzgcQ2h2lnXoDwChXz+N1U6BzgYJoT6DvktOx7b1ymH55tlybJZLl1GH5bWZHigI4/sslNkvJrSGnWkPdXqUgT+/eeuQsOJY1MhdCnBaucEvCu4TU6sxlJg8vkv+uCXsBcHrQtVPNtVf0+3PmRMFQEGnP4G02w5QMT/ju1JbagqqBNYxZtMsg7mDeQKpLU1CSktt0uYxLZfmdX10hemezR3tV/G7pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <beac1f7c-51cb-47a9-8e96-d09cb3ea6ab7@suse.com>
Date: Mon, 27 Nov 2023 13:44:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] VMX: convert vmx_basic_msr
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
 <d07fb86f-ef9c-4c2b-ba9a-f1e5c813d45d@suse.com>
 <e17d6e45-b03c-4906-9fb3-af4770aa3cf0@citrix.com>
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
In-Reply-To: <e17d6e45-b03c-4906-9fb3-af4770aa3cf0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0239.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9914:EE_
X-MS-Office365-Filtering-Correlation-Id: dca8a437-7281-43c1-4767-08dbef468ed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TA7M0N3+3+eDP5JRNewabOawCjwama10aQ9SRkRlcbAQA05bWnLZhwMfVlLCFO83HQDbb1X+FYAJ7O5CQot4DLJN6FQSHmG/F5BeweEWfzccPxWkwI0T5QuHq6m3YmPnZHMUZTVQxTsEWpe1+iW2w+hNs6nHapnLn9TdfeWKaRFlJlwagqmkEuGRF+fpfBw9Wk8AZnoSKCF/WUYX84SquHUZtk/0ccc6Q9ATVM/jN/JWTP3JwIpNBlK1X3BMIZyqJcvTJpumHYIvIfG06Lhsk6MabyaCcK5e0KalES7+fb5yAwOnnM3JdqJGfxkJp2eV3eYh1N+FlGeoLbbFPR3+2yXjLqwR1HhRfICqZOV//3gMabT8mRceAFSZ+2A2VyqNM9iNZDbZvq+0/SoFdxQlmGqumfdcXBMimWKMusVLtv+/e7t0XTIDy+mxI/KhCABiYchUDOIV9CGNswL100MmSvKj+nYBL2fZl9bhn6G6mpNgrZ76mC7tTzVDAI+KxZRTTalVhZR3mmYQhn/5GFWgb7DYvNFOyEMOU/Ooxsg0I8FqkfSrPf8b208mvSBhiT77KgFs7N9+ldnDZFvSeOO4VAKsm9i29zI+rlvCA5MLARTEN3PhyfDg4ubT+qNy9Qm4PiLJJCUUYnQQ9oShwSvHlQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(53546011)(6506007)(31696002)(86362001)(36756003)(31686004)(2616005)(6486002)(26005)(316002)(6916009)(54906003)(66476007)(66946007)(66556008)(8936002)(83380400001)(4326008)(8676002)(5660300002)(478600001)(6512007)(2906002)(41300700001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejlZMmFGbXlXSUVNd0x3VG1wZUFWNGlkaEdJcExQc2hqQ25tNVRFVDdzNFVl?=
 =?utf-8?B?UFRVZVhGZE9kbURqUXIvWXN0cWhuUWJ4RnJrSGYzQzNQb3BHQjRFVUtPVTBJ?=
 =?utf-8?B?VC9DemhjMWZ5dW5XRWUwNXhWeld3YjhUa0RmY3FEbkFzU3JmOVFIQ3k5YkdJ?=
 =?utf-8?B?MXBvelUydU15SWs2L3NydTIrZWZEVHpxT0VFQ0kvNkFXb1VYc3VzdnNMQXVJ?=
 =?utf-8?B?TEp3aFZaK2U5dDZZQi9sc2MzT3pjNVRnVXo1clJxcFp3eG95NlduWVZLZ0Fi?=
 =?utf-8?B?ZXRLOGZUS05QMWR2azE1WERiU1RVTUJyMkVFZ09JeWxvam9LR2M3dVVpRlRk?=
 =?utf-8?B?d3NrcGV1SlRIb2M5SjVxTUVVc2VJVzhCMkRUbEpsRFk3Y0xXRCtDUW1lNnVY?=
 =?utf-8?B?QmdndlRsVHIrLy9SYlRsZ1BYaHNLbmJ5eTNicnhBNTFFQlVZQVpDTzdjTDJt?=
 =?utf-8?B?eTZ0cSs4bDJOUE9wbU1QS3FqclBSOElsdVZac2Ixc1M0Z3dCVGR4VmdRTlp0?=
 =?utf-8?B?ZHlBRmdQVjVYUCsvOXBtZU5UM2g4QnBhUmZ6K091dmN4Tm1SZ012ZkZkM1FD?=
 =?utf-8?B?SUNRSVlNNFRpbWovSnoyWWZZeTJISDVSa0NwcTlBV3BXQkYvSWNQNjA4Snlt?=
 =?utf-8?B?TmFDT1l4Vk90dk1FUDJMUW1RdEk2YWg4RU1QdjZrTmJVc1NoS2hMUlJtWnZ6?=
 =?utf-8?B?NEVZYmZ6RXUyS1phay9Zd0htL2xYdFg1ajM5OGhYc2Q2V3MzaVZmeHNlenY2?=
 =?utf-8?B?aG8vK21qM2pFbms0N2Z6L296WlhoenZrb0kvVXh1SGVZVjlaenBGOG5KYVhl?=
 =?utf-8?B?OStFWWdVTU15N3lybkhBRVFka2RmeFRjbWRPRlpwMmJJZ2FYdlJUcmhhK0Vw?=
 =?utf-8?B?cUd3NEtEd1pWdWd5MEYxdHVsRHJleG9JZ0xYMHdOamIrQUlTMWNqM1JWNm9m?=
 =?utf-8?B?RUxpeEUxa2dQYVdHSGwzMTkzUEI0dkpjN0xRajY0TzV1WkErbVdWL3Y0RXJL?=
 =?utf-8?B?T3pmMFpkdTNvWGtWSFQxN0IwVENUY2hiR09JWlowT3R1K2ZmM0cvYlVwQjFi?=
 =?utf-8?B?Umt5Wm9sUjI3Q1czeTkzOU9QaVJ4N05GVWlrVisrVnFlUTRrY1M4SFMrZEtm?=
 =?utf-8?B?TGx4SGZRMm55Mmhxb3I5cGpkNTNCOUtGSnRkbHJxNkphM3lLamFqTjY4Sk5J?=
 =?utf-8?B?V1FuMTEyTDhkNlljaHNTSXFaL090OWNSZlZrcXBSSmpVNDV3UlJudlJ4ZVNS?=
 =?utf-8?B?VEFKY0xkc1RLTDJoQlJTUmJwMExWU1dBN2VWSnhvYUpZODEvZGJkZ3JRemx3?=
 =?utf-8?B?UmNCY092U0xKOXdiUXd3eW16cjdQeGVXRkgxNEljK012KzRhbTFVaVlFVm9r?=
 =?utf-8?B?Y01hbVpqUWUrcG1rQmlKeXJyakwyMXNac29WNFFiQXZIUmhFem1qcXVvS3py?=
 =?utf-8?B?T0VHaVNHdGc0NGNzRW9lSjF1STRSQjFnUzBIempyaEt1YlN4clQvVEY2TUFN?=
 =?utf-8?B?YlFZeHFxUFFna295U1BoT3pjZitrT0VXSXMzU0hBUnB4djZCVEx6alZjY2ZM?=
 =?utf-8?B?VDdObElwNHVzSm1kV2FWMW5SbW5hYVZHMHE3a3VsV0l0NXBTdDllRGJFdmJC?=
 =?utf-8?B?WlVZRGszVmJleGlybUxQMXRMOGxaWXVSNjQ2WmJ4dkJ0aXdjL0RlVTViTHJ0?=
 =?utf-8?B?OEpPOVIyUEc1MlFXT0IwQTdJUVlkQVlYYXJBZWN4RkZTd3FvclAxcHNocHRj?=
 =?utf-8?B?MFhQWU9yLzFBNXBodmJKSUZ1NzdOS1BNVG9UOStTSGRGTGU4amVVc0gxeUdM?=
 =?utf-8?B?dWlNS2lENkszL3VMSE5EcEN2TS9BblZrbUhtM0lReURuLzRJd3BOeEdUb0lF?=
 =?utf-8?B?ajhhNTdDZk9ud3RyaGxzK000M3lRMmordGN5OHpndlIyQ3dybzJ1a2xDT051?=
 =?utf-8?B?bDNwTUZsTzRReUZFYmpqTXZobEIwYityVzM3WFZvMEpGUHAxcXFkeFptOG1r?=
 =?utf-8?B?Zkhkc0NhRzVsOFR1SFY4VjNPcjQyakNhMVl3V1k5UkI2NEFtKy9rU1ZlRUJ2?=
 =?utf-8?B?SEVicWFIbUxXM25Nc1ZWTFBZT1FNd1BtcWVzcjNhMzhZYUw4ZDNCUWZ6R3dk?=
 =?utf-8?Q?LbgBs50a9JutsZCz5M5qfAltZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca8a437-7281-43c1-4767-08dbef468ed8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 12:44:12.7382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPtCHoWQS57k1RBUzKSAs3jDUsHaUORcE/4xCaxTsOZEEv2oaJ8RU/CiXRmvDwbnXT1iwK8rKQMxXd+LHhTdqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9914

On 24.11.2023 23:41, Andrew Cooper wrote:
> On 24/11/2023 8:41 am, Jan Beulich wrote:
>> ... to a struct field, which is then going to be accompanied by other
>> capability/control data presently living in individual variables. As
>> this structure isn't supposed to be altered post-boot, put it in
>> .data.ro_after_init right away.
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> For (usable) nested virt, we're going to need the VMX MSRs, in their
> architectural form, in struct cpu_policy.  And just like CPUID features,
> I want it to end up with nice bitfields to use.
> 
> Looking through the rest of this series, vmx_caps ends up almost in
> architectural form.
> 
> Could I talk you into having a "struct vmx_msrs" (or similar - 'caps'
> doesn't feel quite right here) in the policy object, and also
> instantiating one instance of it for this purpose here?

I was actually wondering while doing the conversion. The main reason I
didn't go that route right away was that I wasn't really certain whether
what I'd put there would the really be the (largely) final shape it
wants to take there. (One thing you've likely noticed I didn't convert
is _vmx_misc_cap, which right now only exists as a local variable in
vmx_init_vmcs_config().)

> AFAICT, it would only be a minor deviation to the latter half of this
> series, but it would be an excellent start to fixing nested virt - and
> getting this data in the policy really is the first task in getting the
> ball rolling on nested virt.

How much of a further change it would end up being (or where that change
would occur) depends on another aspect: When put in cpu-policy.h (and I
take it you mean the lib/ instance, not the asm/ one), it would seem
natural and perhaps even necessary to properly introduce bitfields for
each of the MSRs right away. That'll lead to a "raw" field as well. In
VMX code (mostly its cpu_has_* #define-s), I'd then either need to use
.raw (perhaps a little ugly here and there) or go with using the
individual bitfields right away (likely eliminating the need for many of
the constant #define-s), which increases the risk of inadvertent mistakes
(and their overlooking during review).

> I don't mind about serialising/de-serialsing it - that still has a bit
> of userspace complexity to work out, and depends on some of the cleanup
> still needing a repost.
> 
> If you don't want to take the added space in cpu_policy yet, how about
> having the declaration there and just forgo instantiating the subobject
> in the short term?

There's quite a bit of effectively dead space in the struct already; I
think I wouldn't mind instantiating the struct there right away. So long
as you're convinced it's going to be used there in not too distant a
future.

But: If I go as far, why would I introduce a global instance of the new
struct? Wouldn't it then make more sense to use host_cpu_policy right
away? I probably would keep populating it in vmx_init_vmcs_config() to
limit churn for now, but consumers of the flags could then right away
use the host policy.

Jan

