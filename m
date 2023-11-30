Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 956C97FF2FB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:56:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644925.1006641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iSa-0004Hf-T4; Thu, 30 Nov 2023 14:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644925.1006641; Thu, 30 Nov 2023 14:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8iSa-0004FO-QH; Thu, 30 Nov 2023 14:56:12 +0000
Received: by outflank-mailman (input) for mailman id 644925;
 Thu, 30 Nov 2023 14:56:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8iSZ-0004FI-CP
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:56:11 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 977a1b1a-8f90-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:56:08 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7121.eurprd04.prod.outlook.com (2603:10a6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Thu, 30 Nov
 2023 14:56:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 14:56:04 +0000
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
X-Inumbo-ID: 977a1b1a-8f90-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M31+F4q6UtN7iQGVFMs2FyT48UX8Ne52EFmPpIERPFQbUaPjRXE+VtNra4FEk77qtvIkE+ilLQxfZMYUSAOlueo0jPCXbRqdthkwHFmIgt5zhOFXKXwI7XDLVeAjgz9jSiHoPMzv1jFdSLpNseRv1+KTydbvNb17P/B/Rkiu6BCD1AYzsXIt55iv5Trkh+T8kWBrYaVEPBHrXwQbQq6bA/G9KWMPEEQ+wSdhF2esDp7iuLhKPm1jVdOoajwwxGlAzuJLP86YUinbS2otDpdNSQ3/4uLaCu+jczyZqke0Px7lDBtxLyR4FRYUhTTLiwlhfTu8uLUJKmQnapI1f0mzgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JA2JsnWmhLgl9JQHDMRHy/d+zziDh1kMfmjR+Y/DxuQ=;
 b=g9nmQ8oULO0gnMI5z4YNG21Tpijs1S84X3fkT7fjUE27LbPIaNuTrNG8B6RqWjHN2m6sLw4Nm02ow4LHSmPs3o+J00v3n0+JAFME7yx5j//Cvoc0D6rXjQD5SChG8TtDPUUivPst37UnK/h73ESW1MYtxIlncfFw3XtnVdd39hr9JcarEhgnbd7U55cGsvnhpW9FBstDEOvNOBBfEsirUpEmR/cu9oxHbtrrDbKzgWxOx9nYU/e9T2GnGzcBr8DVIHVSBeaVWgKgWPcjljHz9BrcrB9S9TrWddZcj1+U9kwnfIFhmgPBah082MFnaD13pbjvsgc/bhr+Wnlpn27OKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JA2JsnWmhLgl9JQHDMRHy/d+zziDh1kMfmjR+Y/DxuQ=;
 b=K0eszqQHaNX3LdMH3BZSW+JtW9G45CXd4hZmx7pCqkt9TJO/1yq3hXrakCvoLHrMmJbpP2dBAEjz9woNTfOdLTzZh5prjJotOw61wh6qqBFM77fE6PzpGDKFzYr9LCqaid/YVCrjvMmdSuElQqA/DEX5mzJ2imyZCzMORzfcjVwmb3FflA+tPN+dkvEMNA9HhoeEg5wlN/WqvxOzeNwvAAb3QAtTHVAgvRtldj+A+h4J4LSl+efiOkn2uyWM8EFvDlk1uw/Ul2cn4fXdsKOySiN6Y6R77ZyUTgfFlb7id0RBxH1Zv0rs/XwwCNn+5xvNzdWIQOj1kE5rf4L4t6c2UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0bf576e1-b9ce-44f5-9866-7b67706a100c@suse.com>
Date: Thu, 30 Nov 2023 15:56:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/DMI: adjustments to comply with Misra C:2012 Rule 9.3
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <4876b0a8-b96b-4f60-8040-a346b2655645@suse.com>
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
In-Reply-To: <4876b0a8-b96b-4f60-8040-a346b2655645@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: f30796c1-4d4b-4473-fa68-08dbf1b47a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2nLcK7tAphibJF5cmT3PIUBMz3xmm3xEWK+avimfr1tiVIhswwuW7BcmfhXLakUACTyYOejcdKTEKxJk3AmNAqD+o8+bLcDIYrDbzUpCP3YQ7bHzBOlz/Kgqu6QfJLC99pFl88ddWFJnDIKleFUjxb6yPIIZQ3Dw/kE+XT/dU5+kWwOIRz+ON0x3Jq3+iFRSYy/wrUJE5tjLt4t56M1+jDUtF0UICEqnQXZM+AIP5PUscGeGLza/Upi8sotl9qEAIUEmHBWSTpwH0iaD6sHr3+WCDw9XE7pfwwHHeh6kEOKmN0XsLp/qyTwARtdW1uVcgO+LWjncZnzjcy+oKkKbA/YZy2brZKjAZiAkjuVueFDlmLMlecVbBJCwRjcVklZeX2tZ3YV50WekXaifJdWoRlfe1/RLvNXBcwpVcZBEC1n/OFxG2rjp6t44kn6kzw3lKgW1vvrQbf4Ea/27041CkfMPxgc/R6nQ3ywAlciygzj9goZYg5piwRBpSt5oWgJBdtvcUFDc8RHszrSDPk1xaFbOa/bWTRZSOxEgXqscGQl0hfls10NGU6LrBBz7Z4eiqYpS5+w6+mjkbvGf8VGAE/7JimhUwrcTJ6JhH/1WuGtpldZdxnpWsk/VQjfrg25BjeP0K6IYYsi1YYvxJiqXyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(366004)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(86362001)(6506007)(26005)(53546011)(6512007)(2616005)(41300700001)(5660300002)(4326008)(8676002)(8936002)(4744005)(478600001)(2906002)(6486002)(316002)(66556008)(66476007)(54906003)(6916009)(66946007)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHNpUUlxQ3c2dm9aUWtQYU9uQ1UrcmFReWhqcUROZHd5RDdvbkp1bUduL1Mv?=
 =?utf-8?B?YVlOL1E4NUxOclFLc3lDWlVlTXZNdjgzNEd5SHRGRTNSLzZMSW50cHpjbGdS?=
 =?utf-8?B?OXVEZW1lQSttS00zOU4yemRmRlhtUHhkVlJIcy9kdWNGWDAwY290TGlYTE5p?=
 =?utf-8?B?VFk1bDhzWTFkckxkOFFtNGh3VDl1eTZsMTltTk8vN051STdodnppZ1A0RTQv?=
 =?utf-8?B?ZDc5SFpkeE95NjlhS0lnQkdlRW4ySmVRRVhhcmg2MzBkakY4dkVLZnI5dDA4?=
 =?utf-8?B?YWpiSC9TQ1VaZG9uTVN6aDU1YjZYU0RmcnlYQ0FYWWlkZTVPakxQRjBITHdr?=
 =?utf-8?B?QmtWT2dWMG5IZE40WlB6K1BTNFZSb3VlVDVaUW14Vm5MZkVqUVdWdjE0VTBa?=
 =?utf-8?B?TUIvcDY4OVEwVjR5RUh3WDhQL3NhODFSTXhhYzBtaTV1eC9kaVBrNXhIUWNx?=
 =?utf-8?B?MHI2SzE4Z3FJUXd3UFdSanBXeE5aQ3ZCZEU2V0lvNzdzRlhwOGhMN0lxbUh0?=
 =?utf-8?B?YWY3U2NNZUhwcmszRzdkaVdodE8rNHFTNnlrTkFXQUd1OHc1bFc3QXhkeE92?=
 =?utf-8?B?ckt2QXRFRlVvbVkzZWhSVkJKaXB5dXprcDNQQWtHNElWZGNyUkFhaXVHeU5z?=
 =?utf-8?B?V1RVS0FyaE5EZ21OQ2Z5ZkN5TXJXUXl6dHlNL1NmU0F4c1JoSTAyNWdpMnY1?=
 =?utf-8?B?TG9jYlArL2s2Rk85aXFLTXlrbzcxSmhKWXkrNEdIWEJJdGNYdC9QUmZUeXhZ?=
 =?utf-8?B?bWM3bHl6MmhEc2JBR0VPd2RvN29ERGVyRmhCRnRwVWhHSVF5NmdmMnVoZWhx?=
 =?utf-8?B?UG43VGFMN2JZTkRoY1BxNXppR2xYdkhVV3pUQklJamlBR0VvajBTTGxYTW5i?=
 =?utf-8?B?dVFTWUsraCtzaVhGZU9jdnRsU2lHcFpxN3locGJnaEVoNnFFY2FWYW1Rbnlm?=
 =?utf-8?B?V0pWd0dxQTJnV2FRM3k5SUtNTXloS2d6WDg5eCtYSllQdUg5WjZhYkI1bVo4?=
 =?utf-8?B?b3NDcFBpR09LN09MS2o0ekUxcmtlRklieFgvZWcxMmNpdzg2S3N5VTZ4NlVE?=
 =?utf-8?B?OUFrcHI5MkppVGZIUnVHK2o0QzAxOU9SM3NGVEtWcUw1dnBOc0FlVkM0MGFt?=
 =?utf-8?B?SzVLVFQwWHFzcUxVdE1qZGx0c1BpaG0vbEtWU0ptMVNoNmtzK0FvVWRKR0hS?=
 =?utf-8?B?ZThVTmhDS2ZvMUh0a1VHWEZGRzVDalovZDA2YTVLdXNiUGljMy9nYmk4MCt2?=
 =?utf-8?B?OXJ2Z1pJRXlidmtpdnl1UjNaRmZEcTBrdUNMN2Y3Z2hLSlVhTi90cndLdkh1?=
 =?utf-8?B?eTVKNFhWV2FxeEk3eUE0YUVIN0QwUENIL05lY3dOc3g0WGJpR05UTHFtRUVV?=
 =?utf-8?B?OXMvc0NNWGYzNUxyOGowd293RG1qN2drbGE3cmcxc293RTJCUE5oQllidG51?=
 =?utf-8?B?cW5Md1FoN0tKUUswQ2Qvc1NISUhoR1d6Q2dsSXJvTE0yQk1DaGFHM3hjSEkw?=
 =?utf-8?B?Q0VLYTZXdSsza1hxMTJYUVNLdm03WDdCdlpNbTFLd0tReDFWcllaVERmVGdt?=
 =?utf-8?B?NVprdTNhQ1RxWmZqOGZSczhUMGVRNHpGNzdtcUdRWllXUzFZSTBIS0gwdkU2?=
 =?utf-8?B?RGJCU1YyUktybEx2VWk4eVNadUllbnFiMG9BVlVZV2hSR2JOb0xOR2pra0hU?=
 =?utf-8?B?M3FURnF5Qk9IYXhROGtLSUk5aG11YnNSam5OQUxVbksyZjFZQ2orU1RUT3ls?=
 =?utf-8?B?QUhDSmpHVmo0VFFNdDZNclpreURZTWhBVjNCT1dKbnlaNjdDaGdlckp5bGJS?=
 =?utf-8?B?WDQ2cEVlU0FaUzdYVjN1dGp4N3ZSNDNhUUhyNXBPQ2lIUitPZHBTVTg5UUZE?=
 =?utf-8?B?OFRUdEtLcEJSMk9xZkI2Z3pJWUFTTW9TVjlKNUhwd2hNMUx1dFJPOGVGUkwx?=
 =?utf-8?B?eFVOeEtDYldYUUV1RkIrQVVJRFpvRmc2c0EvSXNUaUxZbmtwVDJ3ZUx5SXFy?=
 =?utf-8?B?bjdzd3dxSDJYbE9aMWVxaVBSbTF4eWV4d2NTN01DNzc1OW41dnQxam5rRmxQ?=
 =?utf-8?B?bS93eDBaV1BRZ3ZHN21UaGwrQ3Y3OWt3cnE2Y1p0dWI0SEVzdERhUE15dVpF?=
 =?utf-8?Q?sEESVZh/f6lWXun3Aco2PCyp8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30796c1-4d4b-4473-fa68-08dbf1b47a0e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 14:56:04.9372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3VndfkpwGkrIIa/peLvQg150lDXTIEPhlbw3jVAnDeyPa1awal5pWVhN0crkkbRThTTjQxN4Gt+x7InhE+UTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7121

On 30.11.2023 08:55, Jan Beulich wrote:
> The rule demands that all array elements be initialized (or dedicated
> initializers be used). Introduce a small set of macros to allow doing so
> without unduly affecting use sites (in particular in terms of how many
> elements .matches[] actually has; right now there's no use of
> DMI_MATCH4(), so we could even consider reducing the array size to 3).
> 
> Note that DMI_MATCH() needs adjustment because of the comma included in
> its expansion, which - due to being unparenthesized - would otherwise
> cause macro arguments in the "further replacement" step to be wrong.

Sadly this doesn't work with older gcc (4.8.5 is what I had an issue with,
complaining "initializer element is not constant").

Jan

