Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388357F9BF2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 09:41:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641693.1000462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7XAa-0002l9-Su; Mon, 27 Nov 2023 08:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641693.1000462; Mon, 27 Nov 2023 08:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7XAa-0002iu-Px; Mon, 27 Nov 2023 08:40:44 +0000
Received: by outflank-mailman (input) for mailman id 641693;
 Mon, 27 Nov 2023 08:40:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7XAZ-0002io-Q7
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 08:40:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a616052b-8d00-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 09:40:42 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6969.eurprd04.prod.outlook.com (2603:10a6:10:11b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 08:40:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 08:40:40 +0000
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
X-Inumbo-ID: a616052b-8d00-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJqmlL70zuv2tgzQEj9zwRucm8DfaZABbtiXSP5sGjf3ZLF2cH7KUPOGaLpDcmHGbzUCKzTGk4o1UHRXSn8CkMfuYev/v0Cizi8IfrrhWwzy5eZoDPhfHwxLNI/TqMlgTuyPgzTWriWf7Ig2TPaEn+/SgQHfTUwivQ/c7C4GtHCNNMyBDow4mCceQnUJ0g+2Vp4onzdTofclKH+bijrnim3amPEIje+Fc/JNLt5qkKKvnd465B6VcJFqboAZDN9cYwbJbh3s+j/CCrGSFk9aJScxnUgXh2eNQO9K81BELxxvyXyeYrc6l6BGj4o1H4lNxVdvFP0PZLGAIlB9gkMSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKqgYgBZgxZzjwy0IBelXNH7KhvjD+C+mCZJjhqUUFo=;
 b=WeSsrAm6a/7fLAELfXV8DH7yd6t2kl25lv6dOeJ7ZVF/sx/sgi6SoaUoaM4aODc40s8rFcKJv72VGzLYq0WkHTmyY222gZD+T/1nWUHn8x8ThWawhJJ6D3T66neIyoChu/QRvG3urghWTkrbCdnWbiDdcmO0Um8caEXSJCGQB1yE/5dUdfKwoqTyrYyRChRAnuQ58a9dXmfMVMrbnx4QsKDFo1XmulW8kZ5xAzqE9e+HBGYALpxnUzWwcpVH7+KgPMM9hM3C/0xXqnSPIdp4zumERAQH5ps4u1Nf+IxEURiaO9TL+13atVzJjx3MK3VCOM/cXXSeM1ITnLVYq4qTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKqgYgBZgxZzjwy0IBelXNH7KhvjD+C+mCZJjhqUUFo=;
 b=tnKhjZPLvLIkncKJfg8wGKI17w1/bL2mAMU4NvhqiupJrccWnz1RrZyU2ug+gMXTV+kD5zdGkMVAVil+pUUZolwA6plj2S5sbijHHlrPTjMbN/rNtOabdodUH7tbpSAF8deYA35TjQVTo8SbTk2SXdeei68NKqXhwXVqwn3GePTppvm7G8FIEdnF1lGEcMzm91nxcc5DcQ8CArSJNQqwU4EGfrTEBjqyU+EVzj8TSaBX+IXBJM1+CkqH4yNGeM+xLCHcPuofWEwotpwM2zCsrTbpXPA84oqLxR8uLPAZQzTtlSgd7Y6pV2bDLUC/UJqBSMcUVjPg2VM8lQwB7tI9lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2fedb7c1-5742-46d7-9882-d2ec336beece@suse.com>
Date: Mon, 27 Nov 2023 09:40:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/x86: On x2APIC mode, derive LDR from APIC ID
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231123173057.1325-1-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20231123173057.1325-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 1042ecf7-a6e8-447e-7392-08dbef248977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gVw2CCIbSd3W5Cum+xyrQJrBkp+DgmONBsYGAW/tBo9OILheKLsrSLm2GDq8I+KLpc8hN+SPpC6wDYtPp/cmipabwQT1lKIK4cl+QvOZq2JiiKrFXEA1pvP3d2OYY+m+NODVJkaJO7jbWYQdoagb+dh4QECO0MA3E36E2a0gvilftQcKJrfTw0twJzYGV6DESmdkOjKHJZazRWlshexD/b1zE1IpVk2mAz6c0EoO5U4DfcUCzTdJVx2lILp0jy2N28rK/Qe6YZkanrjo5ARUNNFdOeDYMNsukMWJkUgBhbDUpwqAxmoJiv2IP12+cwRU/PeCRq0PKQ6f12xptmCnLRWBvlIZqq0KhgSZwHBPO6axT47qzjhsTVQML7UpP+bs2bm52WTs/DU9iuursw+Qa1B/Py+PBeaqREazk72dSPbDfKV/VU30A0xHhONBQEkcslUyjaCCoOhB2pjhMZP5Fd4DSGfIEltQC1/npy4w1t/mgtBZnzEjZ/E4i1yA2niYZOh+Z8e4NoXUgPOwVPapOABG4eZYjLHUFUnpgw6GA0r9oADPoNGZqWuFWzSo3tWjHktIwBODySIx6B2k7EvqynCHX+x1DfA+57KMSkccZdKor9Jd4GN1xyA4Ll76VOrRisjCFowtLiEOec7HS5bkeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(39860400002)(366004)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(26005)(6486002)(2616005)(6506007)(53546011)(478600001)(6512007)(38100700002)(86362001)(36756003)(31696002)(5660300002)(41300700001)(2906002)(66946007)(66556008)(54906003)(110136005)(316002)(66476007)(4326008)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGxJT3kwbTRBWWcxd3FEd0pGUlhCNUFCdnY3K3lsSjUwb2xZQStUZnpJREZk?=
 =?utf-8?B?OVlldUtkY3RBY2RCbXZGUnVZZDI1RmU3SnBxT1B5bTdZQzhqSjZZb0RhVHk5?=
 =?utf-8?B?K05iSmllR0JOZW83MFRhbkluekU5VWFzeERxRDNGbVVvUHVQdHZhZ1lQRzVO?=
 =?utf-8?B?VUJhclI2dy8zMTFqN0NnUFI5eEMzRjFxRVk2UG5xM3JOZUowTCt3WjJNc1NN?=
 =?utf-8?B?bjJLMGxFRWpzTlJMYWc0ZkVpcHlvbTZqZHdCOWZjVmlLVFJtY0RPZXZocHIr?=
 =?utf-8?B?b2VDQTRCazlrNm40QVhRL25FbGo0NEhteGpXMjZtWDBVZTd6NzR6dytTUW05?=
 =?utf-8?B?RUtWc00wOHh4dnAzY1hZcEJPeW5iSlE0VzFYL0hFeEhvemdCYlg4N1QzU3Rz?=
 =?utf-8?B?cnkwS2ZDcHJyOWRCTE53WkdmYWhMUSs3Ync5alJhbWpFa2dEZFNuZlpUNWo3?=
 =?utf-8?B?MFpJSlVOTS9zZXN6Z1ZtNkNIMlBmckpNNUxyZUloK2kzdDNlazNTekV2OWhn?=
 =?utf-8?B?QnVUKzFsL3hoelBML29FMEtydjVDK3A0Q2E5dlcwTkdhMHhWVFI1dVcvc0Ft?=
 =?utf-8?B?RVRlY0xWR3IvekpjMm9DZWJNeG1udEJONUNhejlQdW42Q3VHb1UyZG9UNVkr?=
 =?utf-8?B?WFFNMzQvUXRDY25vdTArS2dpSUdBRHAvOVo2d3JUZWgvdTY5OXQyVHdMYzhT?=
 =?utf-8?B?UmVzOVVUQytkQWxpNEtJd3FuclBTZFpaU1Vub1J2ZXV2eUwxalQrckFOejBh?=
 =?utf-8?B?S1owZk9ibkdFdnlXSm8xTjQrY0MyczVlSVozaE4vTFJyMHB5bFl1b3UzNUhx?=
 =?utf-8?B?NkZlK3lDbUtYd0pNWWRIbHdGb24ybTVOR0c5RVZxcllkalE0aGZUMGlxcHNy?=
 =?utf-8?B?MHhtYTh3Nm9EYXJMS3BLNEpTUnh6allEaHhwZWJMZEpCenVJcjRsc2NUZWF1?=
 =?utf-8?B?K1BweVBuUk56d28vSjhhdmZtOXhIUk9BaEl2Q0JrdnpnZitteVZHMzdhV1l0?=
 =?utf-8?B?dG9Jb25XVEdaZHZOUXEza1BJTGNBN29US203blJGZS9ZMkJkNnpKQjZyeUVz?=
 =?utf-8?B?UDAwdXdpU3pKWTJvZUlmcmp0d3BpbUp0Z24rbnROWFFEN3ZtMEF0cnNvTU15?=
 =?utf-8?B?QmlnWFUvWTNaUkd2a1RKMnFKS3ZZa2cwaVl3S3hVTFJIeTQ0NDBFZlQxNS9X?=
 =?utf-8?B?MmY5b1BQV0VRS1B1dnJobElIVEpEYWZRV2JCOFpnT1c3SUVMdjFkNVlXak4w?=
 =?utf-8?B?WWk2VFAwUXRVMTVPTHdJay9DRy90REI5am5HNWgzZDF0dVFXZUtGbTRUSUVE?=
 =?utf-8?B?RjRXcHNSNHBCTFR0eXB5UGRXT0tJeGRsdDZJNjdjWjBDR1M1L1JUemlCT3Y0?=
 =?utf-8?B?TXNpTG8vRlFWdzhZTDNXVEtMMlkxZk1KRjJ2c1V5TWJQdXFkNHh1aFVQenFF?=
 =?utf-8?B?ZVpzdVppNVpPNWxLV0FGMW51WDdSWHZaSTRyM2h3VjFkUnE1QkI2L1MwdkVX?=
 =?utf-8?B?cGM3eXNsMFNLN1BtTWZEdUV2N1Z4b1ZmcEswdU1ibThMM3U5U1RKdEFrdnZ4?=
 =?utf-8?B?czgrRTlxRi8vaTd4NjFLR0RuRkRxODZxUkF1Yk9nU3EzdGhJQ1VyUVVKS21s?=
 =?utf-8?B?YmI2TmU3dS9vS0xJT2dnZ2prL2c4Tzc1RDJ2SDF5TG9vSXlSK2xaWWUwUjht?=
 =?utf-8?B?Ym8wb3Z0QzRBRTRDQXJsY0dIYlJKZHFxRmVDVk1xSHU2aTZBRldaNDh0aXFq?=
 =?utf-8?B?cDQwR1A1T21vQWhITmRRWnFXeExYUGUybXBOSmEzK0h4RVphcGtkaGtvUVJk?=
 =?utf-8?B?Y05icWlrdk4ya0p3Vjc0YW1EaDJjb1k3V1FkMllKU1VxTHYxNTh6ZFpjakY3?=
 =?utf-8?B?eHFmMTJTRVRYcXFHRi8xbERBU256aHoxczUvOTRKa2ROempJOHpJcThPQ2tn?=
 =?utf-8?B?VFZ2TmhyckNCMHRmcEVOUW9sa25PQnptSnNjNk82Tks1aFdXZ3g0SmNBNG0z?=
 =?utf-8?B?NnQxZGo5STMyd0RTeG93bzRVL2prM0FZYmp2NE5VMDVKZURjLzdtVWNTRkJn?=
 =?utf-8?B?WjdudFEyaUpvTkVLZS9HSG1MVjgvdUJ0c1cybUxHVjR1ek5sbkhENXZVcHZN?=
 =?utf-8?Q?xPJNyOxAqNHUHd9zfuIs+y/xP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1042ecf7-a6e8-447e-7392-08dbef248977
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 08:40:40.8220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iC54Z8tUVZXYrpRTgS8OutBb6iMTZ3GfSnr4rZ5qVjxUbx0hbnx7eSFwq+u5qMuioyCc4OMoTJBewJX+t9GPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6969

On 23.11.2023 18:30, Alejandro Vallejo wrote:
> @@ -1498,27 +1511,36 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
>   */
>  static void lapic_load_fixup(struct vlapic *vlapic)
>  {
> -    uint32_t id = vlapic->loaded.id;
> +    uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
>  
> -    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
> -    {
> +    /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
> +    if ( !vlapic_x2apic_mode(vlapic) ||
> +         (vlapic->loaded.ldr == good_ldr) )
> +        return;
> +
> +    if ( vlapic->loaded.ldr == 1 )
> +       /*
> +        * Xen <= 4.4 may have a bug by which all the APICs configured in
> +        * x2APIC mode got LDR = 1. We can't leave it as-is because it
> +        * assigned the same LDR to every CPU.  We'll fix fix the bug now
> +        * and assign an LDR value consistent with the APIC ID.
> +        */

Just one comment on top of Andrew's: Is the double "fix" really intended
here? (I could see it might be, but then "fix the bug fix" would read
slightly more smoothly to me as a non-native speaker.)

Another aspect here is what exactly the comment states (and does not
state). Original comments made explicit that LDR == 1 contradicts ID == 0.
In the new comment you only emphasize that all CPUs cannot have that same
LDR. But the value of 1 being bogus in the first place doesn't become clear
anymore.

Jan

