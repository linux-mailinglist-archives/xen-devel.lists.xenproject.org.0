Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E577F34EE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 18:27:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638078.994365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5UWi-0004pR-Je; Tue, 21 Nov 2023 17:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638078.994365; Tue, 21 Nov 2023 17:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5UWi-0004m6-Gt; Tue, 21 Nov 2023 17:27:08 +0000
Received: by outflank-mailman (input) for mailman id 638078;
 Tue, 21 Nov 2023 17:27:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5UWh-0004m0-4S
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 17:27:07 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30f739d7-8893-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 18:27:06 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9454.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 17:27:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 17:27:04 +0000
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
X-Inumbo-ID: 30f739d7-8893-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApqOYzZLzQgCv8Rx4lCzwIUmjhWba5IRjTT2UY9xGWgaE3zqnvHnArlL/g6H4Mpmrz7D9f/J0AqiuwsRLvLrS4EwXVscRr/eN/2hCf+N4VthzMim4lgSMjRgbIo+re7oMlM1J6F68k6ek6p43cDlU9LAAlBSbv9hlgT6fQCLpWXeWUHTHfTxzwBQkzim48bpLsPG6g1mGAr2E5UlVIYf1b/zJTE2TASqx/e3gyu4bSfHD8RVZcX0dZiHajlqfSupUub1sQEp41BGFO7uiOVSKLsO46FoAlNgemQX7nSPwnlZRm0IrPDZRppvEkg95rNLzJFU7wwcATuInupSmk8ZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AztCK9YvTIowAQp3pevVNinOJ8bdaPDeMOPaiVVA4dY=;
 b=d6Ih1mZ/gfS0MoUAfcv7sInG274yy0L/brT7bwLo+j8Ps8OfwcnFo3xbvA06mgKBs0GP5c6I4/f3XIqC54LkP/2o2sLroFot/5oaIm6ljXMWYF8DAXr6GH9aDDqaSuwUfo4J0jy/cXB2EQaMTT/DaxNkDDPnMAGdSSvzPsA/4KyoPTokhFoUKwrRdToA8CRcq+mdHxkNs8QRdi3qM8GsbrUpC3cYyXoAyODB5PvFHW6e3Im/xHkOkJqQCrd9mEQ6tP/7AXr3tjicuxgssbjiDLq3DbCI5bebVuTGRfQdZjrMfNMfE4aS8XCnLL9gr2FsHyejByPEsuN1PPdX4grjdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AztCK9YvTIowAQp3pevVNinOJ8bdaPDeMOPaiVVA4dY=;
 b=NeYtsploOOqLFNGxy50E5cpBaWj0evQuBD62FbXh9EVwXqS+gOzh31Dodd/fqgkw2hR00cQuXWHeNa7v+JRsIX0huR8KgMMFuLpwwAnqr8oXrf1BM0ub5bmsQV7z1LKzsMQ4REteQTbe1+VbSuXtG8O7DidfKjaOMxf2BjmiiDeUTn8hUill7bvrt4EBSIAWjvbhGw+fMLq9drLOZ3yZZrzLd3HUYoa1HjkykCYDcr76PLpHPC4tzHf8Q4WnTUJlcucxiiulkwTrLu+bZhLTrk3hIvjZSQvBlK2bZN1tPy33WtoU7FL9cJrN7Nwcskt6qsiH2y4/AK6dB/rPEEaFGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d63dfc54-cf89-44b7-ab7e-983037892833@suse.com>
Date: Tue, 21 Nov 2023 18:27:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/HVM: hide SVM/VMX when their enabling is
 prohibited by firmware
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <b16802f5-13ae-47a0-b12d-604928f4cf7e@suse.com>
 <ZVzZy-KYgdAsqRE3@macbook.local>
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
In-Reply-To: <ZVzZy-KYgdAsqRE3@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6c8175-f406-44ca-e66d-08dbeab71401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6kJ4XEAdZT6EaqzEPwIHvbrxBE510RW9w5ZnWQZWCw4Dt4DcGhF13xnwygL7RLrgTxDJ+aHi2J+bdfDZFL7lKkYecp+tk2wVuVMTK0dKNTzl5sInaPchnvQ3DztowqklFgDyIPP3my6EIA3pD25sDxXlqoRRzK6SYjH3JiQyCnZKrgAdXxRwVd7yaYIdlxoURy7UluanEBQo30/N2JamcxX0qIlNsGztJAiSpdNsyHgBx7A34LdYk+RywiCGajsCORWk1ajOBqBjlkCB0I3oLXJYxInV45By8bpgT5VSPAp780J0lyqCSK1RPJkCCL6R/YbP9BrYt+7XX31Jz2encr5/geZxsbr5J8xijPoL5xC66lIqN5tSs0aH5E0YPu01bRHwbXP6a9HmCgV6yIMBEJG35xkS0r5Q3mX3YL8mbtROhxmmkcdjTaG8/ANV3/eHFEyUl7Aj/H65tXlbe+2qFKzTOT7KhnIDkclpVuGOBwWYvicZQ8jhycuB/Wu8fg9pDwOk1gWoHs0sndfs+LaMiGktHo54G8ds4q2+OTZDag4gLS/Vk1kTp7+3Es17q13w/AnmtJmL52mmJcY6rbLjQDM7ZsZQMMTJsIxH+7o9fzYdZgJT0xGMUvYeH0MQWcFrgNWmgSBX6uknAMK2044Hng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(2616005)(31696002)(31686004)(86362001)(6486002)(966005)(6506007)(66946007)(66476007)(66556008)(6916009)(54906003)(316002)(36756003)(6512007)(53546011)(26005)(83380400001)(2906002)(478600001)(5660300002)(8936002)(41300700001)(4326008)(38100700002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVdkaXluNnVTS3NjanNjUjdGYzh6K1R0MFc4aUR4N0RvcG1lVkFFWjNlQlBa?=
 =?utf-8?B?Y1hsV1UyaVRVdm1OYmFTNmp6T0lqTnkyRHkrNURQK0ROZFFGN29Sb2lIeEVG?=
 =?utf-8?B?dGdxWml5dm9QUm9oTXNiU2E5bG1xalh0aVZ3SUs1OWZCSkl2Q0dWWGMxNHFp?=
 =?utf-8?B?QmpJTHhIQVp3OFkrVW5PaWJzZkdKQkM0bkhaMDhnYnArbUlnNXZOYlRyOGs1?=
 =?utf-8?B?YUlNWWhORk16b1JhRXE0OVJWN2c3VnIrbDlHT3RWeisrd2VTa05GejlOb1Ex?=
 =?utf-8?B?MXNPcCs2MHduRGdmQXVpV3QrQnVXcFJQeTlQd3ZvUEUrUWhoZFR3cHlyM05y?=
 =?utf-8?B?REsxRXUxdm10c2tKNkpkV1NOTS9XczFNLzM2b1RnY1ArL2JtdEQvdWNnM0V3?=
 =?utf-8?B?bVBvTmtReUtWbkNBQWE0bk1wVnJ6LzZYVUFZZ0l2K1c5UWprTUllNisyQXJh?=
 =?utf-8?B?WXhQK0VpNHZlT1N2WnFVblVDVHEyVFVMQWt3THlVWE5tU0RIZ1ViOHUrQkNI?=
 =?utf-8?B?TE5EbU9USzVYMHlEQmxmK3ViczhMVHkza2ZkVWQzMFA3YkpoUzdibUlGWVRn?=
 =?utf-8?B?ZlFZdk1GVERPT0ZFeGsyUTRMUUpvdVF4Vlk1aTcxVzhYcEF1aWRzNlJTVVNR?=
 =?utf-8?B?SEs3OXVkemx5S3E4WjMxTnhnbTFEZHN2cUJzalY0elhDaWFLc2IvQUFLNi9N?=
 =?utf-8?B?akMxbHBLTlhEYnhWbkZHMHp0SjBaVGgxNnlaWFJNWjFaK3dLTnNsN0t1L1Nn?=
 =?utf-8?B?RmNSNFhFNmNzQm9UcGJMcTRGZEJyVCt1cGRsMEZGcXAyY3hMQ3RXRmpqejRv?=
 =?utf-8?B?cXhVN0N2eS96V2hsbWN2MXhCUlNubWhvTWg2d3hITkdZQXhJcEN2OGVJZC9D?=
 =?utf-8?B?VytqVjUrTjZlUG5ONExFbGxXMmJYZUpnRituMjNqOEIzUkpQanRkSi9NTEY5?=
 =?utf-8?B?R2ZNZ1FsZnRWWlk5UzgxLzNzcTkyZVRFelMxK2p5RVVUVE5iMHhPZU9SbTYz?=
 =?utf-8?B?WkxqdHNiNmo4TzNLa1dESU1TNmZqN21ZVnhiakJoTFZJVEhFZmR1VksxSDI2?=
 =?utf-8?B?QXNCL3dJQXQ0cG5ndkx6QkczeTQ3SlNlaW1FRnN3a01rMHNYbFp3OHhoYlJZ?=
 =?utf-8?B?NTJRYjJ6SlFRTjZsOVFBdmRManNxSjY3ZyswbU1CcnJmNWVZb1RDZG9OcXE3?=
 =?utf-8?B?cWVHbEpsZ2sxbW9hMHVoOEdRK3d1N1BabVVjSjBjeHhJS2VDWWRjUm92Qnc1?=
 =?utf-8?B?MVk5eWI4LzJQVmZCVDNXUHlmNlRmQWU2Q3h1a3ZLT1R3bVU5VkkrQk1EeEFE?=
 =?utf-8?B?ZTNjNGl2WG4rd1J1Q1QwL0Y4aXhoV3o3S0VWelJkK1pWekxybmxra1VXb1dY?=
 =?utf-8?B?TlFpc0o5VW16WGlSSE9zT0tOamwzVWxpbk92L1ZBUC9qTzBsSG12N0ZjaGI1?=
 =?utf-8?B?cmRKV2oxMHR2NXQyT2JWV1dQTlVFOGg1dHc3dVh1ZGVDUEwwcjk4cFhxWTB0?=
 =?utf-8?B?VTNPdk5LbUdWcEdBM0k2VDdnMDZ4RTdMT1BzaG5EREI2MCtrNVRic09RQTZP?=
 =?utf-8?B?SkJmTXNFQThMKzRkMjUvOXNjNGtnVS9mdkFaT2cwbFdRclMrbFRiVVd0b2h1?=
 =?utf-8?B?djZBc1F4V3VlVHhNZmlZYkcrc2tRa3FwSVdIcExxMTJ5QlQ0NmFpQWZlZ1ox?=
 =?utf-8?B?bk02WmpXaGM2S2pHRHlPMml2UWwrVm5OeC8yN0tSTFBUVkNIbUlzU2FKVHc5?=
 =?utf-8?B?eENieCtLMDVXaG1uU3AxZDMyZi94YzliSnozbnhpeTF5dURZeFRqN0dPMEZy?=
 =?utf-8?B?amkzRytKTW5sbnR4YnRZNUpoKzRjVklCc2Ewak85QWtKUVVuQ1ZhTzRLUG91?=
 =?utf-8?B?MUVIRXFtUUhZOWRYQWEvSmFxL1Rtayt3Nnd3MUJWQ1NWaHlJaWhHaGJIUEFP?=
 =?utf-8?B?c3pZbmVTS01oT1ppVE5SUjFCdDV5UzhYLzE5SkRIanUzNndVWUNNanhOcTJl?=
 =?utf-8?B?NUhFaXlZdW43eHU4RXE5L3Z1cFVaRW9wbWhPSDNWN2dLTEN1ZnZvNk9wVUFj?=
 =?utf-8?B?R3puVFgxYnpCKytXZ21PRC9aaVpyZXNHa1d3NnZGbGxtRVIxeWxOWmZBR1BB?=
 =?utf-8?Q?fxaywaszJqyGH/QaFbz4DS16I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6c8175-f406-44ca-e66d-08dbeab71401
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 17:27:04.0327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4f7zhMHK+DAHQArXubPgixElvn2LGWbZA1GyE4+m/Sv8sAKpiA4odsPfUu+l/84359O4ZjsTNPqKbJK6YH8LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9454

On 21.11.2023 17:24, Roger Pau Monné wrote:
> On Thu, Nov 16, 2023 at 02:31:05PM +0100, Jan Beulich wrote:
>> ... or we fail to enable the functionality on the BSP for other reasons.
>> The only place where hardware announcing the feature is recorded is the
>> raw CPU policy/featureset.
>>
>> Inspired by https://lore.kernel.org/all/20230921114940.957141-1-pbonzini@redhat.com/.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -2163,6 +2163,23 @@ int __init vmx_vmcs_init(void)
>>  
>>      if ( !ret )
>>          register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
>> +    else
>> +    {
>> +        setup_clear_cpu_cap(X86_FEATURE_VMX);
>> +
>> +        /*
>> +         * _vmx_vcpu_up() may have made it past feature identification.
>> +         * Make sure all dependent features are off as well.
>> +         */
>> +        vmx_basic_msr              = 0;
>> +        vmx_pin_based_exec_control = 0;
>> +        vmx_cpu_based_exec_control = 0;
>> +        vmx_secondary_exec_control = 0;
>> +        vmx_vmexit_control         = 0;
>> +        vmx_vmentry_control        = 0;
>> +        vmx_ept_vpid_cap           = 0;
>> +        vmx_vmfunc                 = 0;
> 
> Are there really any usages of those variables if VMX is disabled in
> CPUID?

I wanted to be on the safe side, as to me the question was "Are there really
_no_ uses anywhere of those variables if VMX is disabled in CPUID?" And I
couldn't easily convince myself of this being the case, seeing how all of
vmcs.h's cpu_has_* are defined (and I'm pretty sure we have uses outside of
arch/x86/hvm/vmx/).

Jan

