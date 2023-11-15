Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7CF7EBE50
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 09:01:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633513.988356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ApO-0002V4-7x; Wed, 15 Nov 2023 08:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633513.988356; Wed, 15 Nov 2023 08:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ApO-0002SA-4O; Wed, 15 Nov 2023 08:00:50 +0000
Received: by outflank-mailman (input) for mailman id 633513;
 Wed, 15 Nov 2023 08:00:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3ApN-0002S3-EC
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 08:00:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14eb9f0d-838d-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 09:00:46 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Wed, 15 Nov
 2023 08:00:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 08:00:42 +0000
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
X-Inumbo-ID: 14eb9f0d-838d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UD1jByHpBqgsdpV0cmMlAyoODlUPruVFSPt54FwgLei7VeyBJzoWntb3zxDNFW6ql/88gHh0dMakTYfi6CLV39ugThRGEAHhcojEdJARscSo+eAPO/U1Ujy1YA+ToE5fV0J+wcI37DaVI5IVBP27vpifPB+NRah71SZoWnDWbKqiv1GiQPRFeBR8fdOThC/WjVIJ36ZtdJylXbXpPlLTxoRiXbAUo2Nv4vzuo7/raDjmTvPdjGBbBGTpNh2d1y33k6rzNZrj3+DwQHkjPGldSqptAAhBGMU4uhEnnrflfZbq8A4Aw3d3DVxKx7Z6v254LprBgyc09BouJiGjZwfnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAUYGU4iLjkXQno90F86DkqwULbVdUfXxlOCMNJfV7g=;
 b=Y42wqVQ6F7W+PxBMcKFT+3DfheFr9ALWziYlfarmL0ICWv86qtlJT1yLLxUJ2Zg844Bpu9m6fQYXDfkGUm4tCDJqJ10+FBaJqJOYqj8+myXsYBjYK+BFsz+ps7nnKF2kr3+PZXMm+TPLOfiGsLtYkg1fFNN6Zno+shtJR6RftCmryjgGtb2clRrJnbQbwEJRRZwyEvZAwUPrLRTlG/cAOQYDm0mJxLoygM9yVstXGw9gpb3kwxpZWm49D57Z3SUIWs+nqFDt/d41QVESVe4NGkU3l4YwreYekxkciqxcqLsRVTUMUpro7U4GVLZiDN98+u+/ySL+EdTSUYXT1npUwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAUYGU4iLjkXQno90F86DkqwULbVdUfXxlOCMNJfV7g=;
 b=0q1BrP8XiAn0GtYSsUmG1vs/6IMstNABYo5omgYhlICIgYqyhvAK+G2fUfY1XuM8MdQ3h7pYaIuFDCRJA3I5JIv7wVDO9+kQoMZifytkgwEX9vdphRf5FM6IgWGzUFH+nenGCyEpNnpq8LqzREHdwtLD0mMji/Ces7IqR9R9TswivOXZLX+rdc1IMYrhGYGPZe5ivRTi5JtlEzV5B4nJecaXZZ460GHZmnEPFy281A4V+bu7U5sqwTMNgWh0OnfIvtaFzR/jOEbi7PIpHeSPXzftfSVu+TMER1nmEXdeYg4OdVjku+t6FinVzu96DuC7W4RN/LV3f6VfRCpyFgEbCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61bb1ea0-e794-4feb-bccf-a44549543b69@suse.com>
Date: Wed, 15 Nov 2023 09:00:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: add R21.1 R21.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2311141458020.160649@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2311141458020.160649@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9576:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb29890-16ef-424a-3c3a-08dbe5b0f6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	82O2qsoppH4PGOXDHWxi1MbjK93dPfCEdFBy4Zy9Es1gjfg+/DahwSPbWRGyoiC8kD1XTv9uKZ2DijkG2ua1QltdAv1MQfgc+YP/VJQkjY8/ids/fFNjHYi4J2o3fOUrtoS9o+N1Hu8nKBB0c1ftDm4QGRttm3WAgp1/Bf20zfT3uRNZoyUhWQPOvlp5kICPTfManJ6C+kcHbVjcvEwmQUDEXF8HXATUAyZBpd4bKG0ahkl0YuT5mGXj0E0CAgORh7QTkr99dHTrUrQ8d2RMZHLgLNwh+JbJfv/cTblmfkhYqxn+/sQ3mxaFlOMiG/jI83UMMysv5fMZA1WVRFEqeSRvNShqg1iW3Pj9qF50DSJtvKRc1fpLyuiDlaeeMvkF1pl7Aji2WPWU0K4iqTsXRVpevMNoA+Yd/WPAqJ8fAGw9dQKwcc6tK8ZvnvVdtF+13OVbStkQmmyk7YKBrtVjd0tB+HJ0SYP925PFezQmks/fiI4EURak4tIpEqxFBYx70r3aHMAY7NYZMBeBuPvNnkBEPelBTLsw/ZcY+4C/zV5u/z0gb4yESLMRhSj8un61Pgx5StwgY1k9BBiDHqv1Z/NzUFY4U6efXpKhgqLPlN1FU7wJ6X3jskKbJuTmJknz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(396003)(366004)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(31686004)(6506007)(8676002)(6666004)(6512007)(26005)(8936002)(2906002)(53546011)(4326008)(41300700001)(38100700002)(478600001)(5660300002)(2616005)(316002)(6916009)(86362001)(66946007)(66476007)(54906003)(31696002)(66556008)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXl1TUhRQjBpVWNLZ3ZRdkRhaEdTNHZxeW1yVmFIcTczMDJvclBocU5mSjdD?=
 =?utf-8?B?em1tMDVMajkwOU10RjNoTVNLWEdDUlV2QXpvK294bDg5ZWd2cWxqOU5pT3JG?=
 =?utf-8?B?blBONXlMQ0VtL1B6RU54R25XKzB1YnB4dXlnc0VQbGRPK0VEajJiSmtVNHoy?=
 =?utf-8?B?dG5YYWsyKzk2a0NCbUFTeGNkcEhySjM0MnFacWtYTXNmOVJ1MTdCcVF5Vk5U?=
 =?utf-8?B?MVg0QWkzK045TThpa3ZwTGZjWjlxNzdYb0pETWR3bDhsTFNJb2h5am5OZFJa?=
 =?utf-8?B?OHl0SzlKTHV2R2lIYzVqd2IxUGxHZXZBcGVkZ1pINzltS1crZG5qdTM4RXBo?=
 =?utf-8?B?UE1RV0RKM1NhcFpaVXVtVGJpMlJ6c1VTakdsSU9QZ0JoZmdEMXQ1ektESG9t?=
 =?utf-8?B?dWdXZ08wVUt6VktNV1Z5OG52VmNQVlluY25aT3d1ems5d3RxYlhZS3ZPTDFu?=
 =?utf-8?B?WmcxWkFOVUtZVzlJYWErOUVUbTBTVW5VUGVNQnFnYk5uZllGZU0vMFdIMWNM?=
 =?utf-8?B?cXk5amZFSGV5OUNzQTFhQ3RaMkVBVkNPM2t2cmZhMXVza1JtU255emVGKzZC?=
 =?utf-8?B?bFBmeTNUcFNicFB2SThZWndDeTB0TFhLMG1ZU0pHeE5MUjVhTWoySWhXVjlC?=
 =?utf-8?B?eGQ1Qld2blk5bzd1TTgrVGVKTXcrdG84VXhkR0J6NE8xUS9pYTZsb2tNUUta?=
 =?utf-8?B?UUgyQmoxRkJYMndoODN5akQwQVNCMmFIbjByR2syNHNJV0k3eGwyQWZvUHp2?=
 =?utf-8?B?T3Znc2NMczYxM1Q0VFhVa0Q3dVdPREROMkV2UnBVRlBSVGM1WW52akdzQ3dp?=
 =?utf-8?B?eTNabUZZMGdjaTB3RGhGNFYzejh2S3RUVXRDK0Z3WkVubUJrc1lJZE5qSGJt?=
 =?utf-8?B?VlB4K2Jyd0hSK25WSEthbzd1T250cmF4UDJQdUozSnk1RmE0M0xHOUdIMlBK?=
 =?utf-8?B?MWdIY2FYTWRFMklmYWgwKzJrcTAyNTJsaHdaR2Jxdmh6OFkwTzQ5YzlFb2tJ?=
 =?utf-8?B?d3ErbmVob1ZLcllzN2ZlWk1HalJRRElkb1hwVzFRRnNoSlhFSmFYRFYrOXZB?=
 =?utf-8?B?b0QwUzlpM1RIaFRSTVIySlROdk1BOUtLeVNaOThTOEt3dFpmTlk1QXJHR2xx?=
 =?utf-8?B?dEtwZEdwSWNZRmR3REhzUFlvMWU4V2ZlQnluZ044amUyMjI0bEhQZ3gxVHpB?=
 =?utf-8?B?SGlmajgrNmRLMUtwNnVaREF2THdBRlVQeUlpWk1WK0xQUzg3dnRtR3VpNDI4?=
 =?utf-8?B?RFZNTTZZdjRxVW5tSzZIWnIyb050UWNOaEtKTm04MndGR0tGNit0QVM2bXpV?=
 =?utf-8?B?UmlHTlJ0ZXVUSlJ5MzM3bUtFWjR3RU8ycmFPWWlsMHR6Tnh3KzBQcDBWeXQ5?=
 =?utf-8?B?OHZKY2Q0RjkycTdwOFBNU3FYTDB4dVFDYjliYnZTNHJFTnByaW00YlE0ZnlO?=
 =?utf-8?B?bVQveTMrMnMzQ2d3M0RoSisxdVJJb3VjVzdXRFZQa3RRb0c0T3Rod3N5Qm5F?=
 =?utf-8?B?K25ENExMeitkUG9hNXFqNjRhWlU4VngycWluRk5jaVp0TE45R3VkMTg5dXdQ?=
 =?utf-8?B?SUtuT0VXbGNldUhrR2FiUzBpMks0SEkzRUJhOXRTS042MW5OM3FtT1o0UTlJ?=
 =?utf-8?B?L3FxbkFhTGZFdUJzRDNNMXBIam5DV0Jsb29mbXZ5VUpYM3pHSkd6VlhWRGVP?=
 =?utf-8?B?WWNNemR1V3FpNFZ6c2ZKbzNxOU5RTlBIeFZzMjNLVkh0ZnpyckNoNmJXOHBL?=
 =?utf-8?B?NnRKWW9YZ09rd2d6eklyZEFNV2FOUDltRjZkaHJwbk5IMUwzaEhyVjhXS01S?=
 =?utf-8?B?MnN4Z2IxTlVHMmtiMDY4ZUZXSnkwQ3RDUTlVSWdON2c1MXFOWEdVTGphSEdS?=
 =?utf-8?B?VHpzYlVKWVlWZXRBWWpNZ3hrMFFYZFNOK25JUmRlRWtHblpHZit5SmZkWGY5?=
 =?utf-8?B?RUZoMDhTc0FTcnR3WVhHNWp1UklPcGdwcjFZa01nT1NrZUpYd3hRSVVOQVBu?=
 =?utf-8?B?QWxUbzRadzQxTEY1ZUhWWGNuNk43cG41R0FKR2sxZkhQQW95cksraDlWbk1W?=
 =?utf-8?B?RzdpM2laUzFoWk44U0lNR0FFbHFwM1YyU0xqNUE1cWVqWkwvOTQ3TjlrOGpj?=
 =?utf-8?Q?mkVudeD32XP9p6AUG5J1O2Plt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb29890-16ef-424a-3c3a-08dbe5b0f6cb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 08:00:42.1830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hLykql5YyeAyO2JaomiOn2x9MAOZVgqT9FhyeMSbzH51q8VkIpTD+MSV+6PTMUcSS3JMXvDVEj1QfFgNe++6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9576

On 14.11.2023 23:59, Stefano Stabellini wrote:
> Add 21.1 and 21.2, with a longer comment to explain how strategy with
> leading underscores and why we think we are safe today.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one nit:

> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -519,6 +519,28 @@ maintainers if you want to suggest a change.
>         they are related
>       -
>  
> +   * - `Rule 21.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_01.c>`_
> +     - Required
> +     - #define and #undef shall not be used on a reserved identifier or
> +       reserved macro name
> +     - Identifiers starting with an underscore followed by another underscore
> +       or an upper-case letter are reserved. Today Xen uses many, such as
> +       header guards and bitwise manipulation functions. Upon analysis it turns
> +       out Xen identifiers do not clash with the identifiers used by modern
> +       GCC, but that is not a guarantee that there won't be a naming clash in
> +       the future or with another compiler.  For these reasons we discourage
> +       the introduction of new reserved identifiers in Xen, and we see it as
> +       positive the reduction of reserved identifiers. At the same time,
> +       certain identifiers starting with an underscore are also commonly used
> +       in Linux (e.g. __set_bit) and we don't think it would be an improvement
> +       to rename them.

I think this last sentence would also better say "two underscores".

Jan

