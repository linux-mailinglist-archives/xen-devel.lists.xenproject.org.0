Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9057F6E4D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640217.998136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RfC-0003Z1-0h; Fri, 24 Nov 2023 08:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640217.998136; Fri, 24 Nov 2023 08:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RfB-0003Wc-UH; Fri, 24 Nov 2023 08:35:49 +0000
Received: by outflank-mailman (input) for mailman id 640217;
 Fri, 24 Nov 2023 08:35:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6RfA-0003Rm-8C
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:35:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2050.outbound.protection.outlook.com [40.107.13.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76f6161a-8aa4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 09:35:47 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8526.eurprd04.prod.outlook.com (2603:10a6:102:211::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 08:35:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:35:17 +0000
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
X-Inumbo-ID: 76f6161a-8aa4-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c59DMaxJnKnt3x1uLw9W34NHrimtE9cKM+Gn2SsiFEtglgMwye3dcPqTlkRla5bdTu5JLPGwTn4XkwfMdw+4UwU9gKjwZ7uFqtpBRq/gQ2f5yqOfUsWbYbNdDEPp/1hYwMkH8RraV8PL/mw2Vdd9R3cG/Uf+Z3z5cOi7nrPNiljK9S73w7zO0oIx1l0+0g4QMnZiH4AU2gMswpmA+L9v8J6UVNC0UTw4CZaoKpGywXl62ee9v5yeOWhMI7A15867H0SsUP1v/qJFHrspSwzFr/Am5yOIyvvaxg7JowBpdkaNjG6kz1P2zSPI8yKPJ3ZrxlUlmwJQ+eNCbTexEFByAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQAKd+mN2ErHr24nvgdiF5gstKYQ97TebakfHDsT2mI=;
 b=Qg2BsD43rv/9TOYXWfNVB2ILvfntTuazl3dK90/zrI6vFFFq3YAggqvdzjVJTY3lKuoJUV+IE+daSeSNZAyokmwqX5fgRrEY7kacjF1T+XmS54mAwp2dBgn7XdRMDW4zdvG8CtlkIcycQHYCC81xFUN35ZOQWeBoepYQZDG8kxfehCpoQLsCqYad4M6YvO+199+8iccyb5c5Ahrnc085UkzPsK7FF3SasouI3NiuNJ5bWSFP+guXqxtwk36Gg9nNAf7+MBAgtBjH162bhQchDLusfaJyHRWRKoa/eGnvTbg2yk7snU3uf+DvUmfvRrfnCPa0jBvaG6i2i4Mma1UfbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQAKd+mN2ErHr24nvgdiF5gstKYQ97TebakfHDsT2mI=;
 b=09v6F4sQpexQ2EQXBX64Gf3oSxPGPW9ck+nKUHxt/5GIcKyWqZhDlcEmG/btVGW3lwjqZNDT/jE160nCi57pBgSyATNrgU3csTyQq9+PLyZBMRlDlqs4BeYCjk4UqFX1yWG53OUMX6B9PYzrnJ34bl4TUhX6QKTNe3iSyvGCz9+/7K75hbwsv41AStgH9K/cNxzWFwKVIZ02Qmf8RwKigejw8iHp5fACpZAnhJdH1bR0Kx6yFrbfCP99iHACFZODHKzIuNGfzxMstpA7C4C08K7kP8Un3yr1y6HB3zN5ae2fsY4PW2pxOqNUvXyg7FifGfsdDy/4GWRJOLarv0wRQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Date: Fri, 24 Nov 2023 09:35:15 +0100
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/15] x86/HVM: misc tidying
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a741ec-ee95-42c7-9eab-08dbecc84967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7jVZbiHmfHQYgkQIVmlWWq2jiqjali93AJf7s8I4n0J7A/LoERngPyEkL9031ESYC5M++zPd/tenwaCZr2cyV0wrqMeLBJ7jy0bYb+ZpzwFGgAN1NS+ojasfkRS4sdS62NxQ7t7uc5p1HS3eIjL12yfduDIl38iRtLTV1bGSl26X9CPpUYb/YM1hUaBxn8vA1ZHHaBjyu3GbSdZze6TSkeTjlTraT9GdOwTymjMnLeujyo7tI+R0V95f1IvCy5XcvlJ1R8di/tbt729XVVLKZcCtlTMpBsLqUf5FGnxD0ApCmXdYg5mK5+5tcFAnC6sZtaQGvjGV9c7e0reL9/6dji37pg5Da+QximKJmkxPbg6Od8k5DvqWHb3P3SfuDsz5H/B82wf/zeVuFes+L01f1N/t4HQrKmVX8dm7peIZcrYpfXjRs13ixZWXl8qs/uwDwN8ZIoIqM8Owdn4gOB5/NR2uq/g2ldpIYwEIE0mbMxZSlfKDMgXQkzmmipm/HzTD+VrjDu/VY6u2AfEMI1OuAjMMLfbXF1aIP8PXiji3XxYkH0WhtBrdlbo8Ej64Ooc6b8jdFZH/IsnvcRWKtudq7F8JxIi+iZQZH8klG6esxL1zyuz3kBcKyE9cqHqGRcGpL/N3wCXtsTp5hmHmqKKirA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(4744005)(2906002)(5660300002)(36756003)(31696002)(86362001)(41300700001)(38100700002)(66946007)(6916009)(66476007)(66556008)(6512007)(26005)(2616005)(54906003)(316002)(478600001)(6486002)(31686004)(6506007)(4326008)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U25VcFVwZ2I5T2hSOHVpTUJ5VjVOaVdkb3lMVXFyQ2ZrYkpTS1k1S1Mwbm1H?=
 =?utf-8?B?aWdkOEtYbUhYczJyN2hmNkpFdjR2QXVCNkEyMjZzSG1qdFQvU3dwdGxWSGJF?=
 =?utf-8?B?eGJLMC82U2MySGlXMEhCTlhuZ2ZtOUdYM2UzK0RpSjVVaWt1UGhVNDkyVXpO?=
 =?utf-8?B?NGhxeEVDY2tvMlZ5Z3BYa0wvY2h3UExMZmlZMHFKcTNSZHRZT0tWTzl3OU5S?=
 =?utf-8?B?ZDNpSjgvczVLRS9yNTZPTFQvWmpaRXFwZVNDejhjWmtkVXB1emZMaENrRnRp?=
 =?utf-8?B?cnFiSFZGa2JnV2xkTVk2dmh1dDFBYmpucTc5WDVkRWNubWFaem42dmplWVJN?=
 =?utf-8?B?cmF4ZlFxalhCQXFleDRmaHhqUldySk44aGEzN3JuRjhuaGd5SGtSM0h0dmN4?=
 =?utf-8?B?WHpFMHN1WllIcmpFTkxPVEJIUFFzVmhKOFZyNUdMellzOS9HTVE2L2VXaVQ5?=
 =?utf-8?B?OXdhTmh1YTVRQWNJa0R1ZmFQRDIvSU00TU04MHZ6andiNndMU1h1MGpKeDB3?=
 =?utf-8?B?SnJpU2JuZ3U1VHFRZGlmMTA2b0c2dXBIMmd6TmxOTDY3YU1md0NDdEtJbGN4?=
 =?utf-8?B?RW8vcm12RktuVmR2RWZYNzdWTll2TXcyN056Mm5FRElURkJHamZZb3RDRHFR?=
 =?utf-8?B?TjNIUllMOW14VXVnczdHVGpZaWRDTk51NjhxY1AyaklDdFl3eUZMaXVoK1N6?=
 =?utf-8?B?aG4yNmJMUElKRkJuTWxPc2NUeE0xZ05FV0U4ajBHenBNSHZBa2M3SlJrd3JN?=
 =?utf-8?B?VFB6ajdEQ2NJenpySnFxdHNhZUgxM1VCK0dSR3pOUHN1TXFHbDN1NGZWWENh?=
 =?utf-8?B?azdSV3JiS3ZHRTQ3SU1IWnRiRG0vdFNLZmQ4U3p5T1NhUHlXcEMzUmJjQ1JH?=
 =?utf-8?B?UC9BSFNXeG16eUdnKzZaZkpIVTdxb0wxdnliL3dDUGZxR0JCa3VkZ3JIL0w5?=
 =?utf-8?B?bytaYmxXYnV0bjFQaWdvL25iTzc4VU9tdmlsbWVGcTdBYy9MRmczRGI1ZmNi?=
 =?utf-8?B?aC84b0hZenREeEZLQzhXL1p3ck1JSWZ5a3NQZkp5NGRoVjlTeVVMcm1jeVdB?=
 =?utf-8?B?TkJ0QXAzTlNKVjFnalkxY3JOSHlCMjV6bFl4TVYzT2JZZVNjaHpGOStVYVFL?=
 =?utf-8?B?eEJybmpBUnJiM0JhREkvbHZwUDMzdVlmZFJyaTJWbVRLSWpzSGJHcWpMSTFE?=
 =?utf-8?B?c2c0clFsWTNqU1k1S1grZG5Vcll3VVFCRzcvSThuenU0N3NwTEJvaXNyL3RU?=
 =?utf-8?B?YW41VTlKcGN4eG9qY2tqRmljY2syd2ZEbTFNdUN2dGpnWVorTWFzY3dpSW9q?=
 =?utf-8?B?aW91QlBVNS9wSHp4UmREbi9HbVM1eFovOFJCcFdkVFBDa2VaR1dGZDBwVzZj?=
 =?utf-8?B?UzZYWFhWR3IvS041S3lHemkvSWQzeXFKWVRvOXhaNm1IZ0E1UFhVTGE3YWtW?=
 =?utf-8?B?SjIzWWlxTkRVZnZoSGpYYjNETUtkb2YvZS9vcmdwSWswb1U0cjMvaWN6NHJ3?=
 =?utf-8?B?NHlub0haN3MzUmp3d3BmKzBHQzN4RTBsbVhnMFpUbDRaTGdZMDR4RFFxUVdI?=
 =?utf-8?B?NXFmSXNtOE9YdW51cWM1bktUek5zV2xMNHFQVVpaM1hSb0xaYVpkb0w1alBG?=
 =?utf-8?B?OHA0UnJKdUNaamNwMkExekxpc3Q2NEZFV1dpYUhYUGI2MW4za3dDMlU2UTNx?=
 =?utf-8?B?T0l2N2JYbUhQSFBHSStpbEZ3UmE3U3dvL1ZxdDlsOHFlWUt3T1lBa1lWem5M?=
 =?utf-8?B?NVhWbi9OYWpGUzVBMWV5T0MrbzhzNmNBeEp2cmdMSEZ0UmlBbWdQc2dxZXNU?=
 =?utf-8?B?WEY3cXhoOE4xbExFQ1dXWEJFbFY0RCtRL2lTZHliWXVQeXBCWEF2YVh6ZU5T?=
 =?utf-8?B?K0hXeGN4czYrSnh3bktoUHVDYk00VSs0Q01IYlNPYUVLSDZ1TVdKakhmZGl5?=
 =?utf-8?B?WUxIQkRCdzJpZUNTczhraWlUMVQ1aitNcnJFaFJCN1Q4M0FHcHU4N09GTmZB?=
 =?utf-8?B?OERMKzhMK1FhM3VGclhjZm1aSzIwRmpIRmlGWGNnSGV2S1JyQ3V5eSsvUjF4?=
 =?utf-8?B?cmV1ZFFTdm56dHlLejRsQlVkeENCZ2RsM043SHVaRHpKMS82Tnk1Y1NUUmZH?=
 =?utf-8?Q?HLxUsxfgwUNg3OAIxKbsNLpAv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a741ec-ee95-42c7-9eab-08dbecc84967
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:35:17.3497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UmDM73jVy53ZpOlxvnJPrNvkjA78UKx25T6hZmNRx6rXyYRu6UX5sNkeZ+Rdu0LbMr6kpgv40OW2Pu3sL5APQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8526

01: VMX: drop vmx_virt_exception and make vmx_vmfunc static
02: x86/HVM: hide SVM/VMX when their enabling is prohibited by firmware
03: VMX: don't run with CR4.VMXE set when VMX could not be enabled
04: x86/HVM: drop tsc_scaling.setup() hook
05: x86: amend cpu_has_xen_{ibt,shstk}
06: x86/HVM: improve CET-IBT pruning of ENDBR
07: VMX: drop vmcs_revision_id
08: VMX: convert vmx_basic_msr
09: VMX: convert vmx_pin_based_exec_control
10: VMX: convert vmx_cpu_based_exec_control
11: VMX: convert vmx_secondary_exec_control
12: VMX: convert vmx_vmexit_control
13: VMX: convert vmx_vmentry_control
14: VMX: convert vmx_ept_vpid_cap
15: VMX: convert vmx_vmfunc

Jan

