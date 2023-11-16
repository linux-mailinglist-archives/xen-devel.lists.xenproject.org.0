Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DEF7EE3F5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 16:13:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634452.989885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3e2k-0004Mi-Qg; Thu, 16 Nov 2023 15:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634452.989885; Thu, 16 Nov 2023 15:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3e2k-0004L3-Nj; Thu, 16 Nov 2023 15:12:34 +0000
Received: by outflank-mailman (input) for mailman id 634452;
 Thu, 16 Nov 2023 15:12:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3e2j-0004Kx-LJ
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 15:12:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f76ca96-8492-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 16:12:30 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7374.eurprd04.prod.outlook.com (2603:10a6:800:1ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Thu, 16 Nov
 2023 15:11:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 15:11:58 +0000
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
X-Inumbo-ID: 8f76ca96-8492-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJfCACO8CD4hJRMWZAkV1SXYtR+VRrIjgqITAEohxp2rVu87BTEZBu0SU0uAhfD08At0Zfys1AYjOd4dabuvCUM73QicmrguIms1OVtuAthuI7PERIttFzvXKmLqQ93TQG4zaCx7XEnNDgp1qll0hXXr2uJvOj8hNKnv5lEZlK779xd90H9FiR9Vv1/HJTWnPZKzBK1xesceBblaqa+BzYKuJt8x8xpeaH+Q2WYHiuwvLr7c6Ooa0dEUTXJaoF5AMVTEwiTS3eWGDzN7/BkL8jCmIfVpLk5V2K8/pSfO9L53bLAhOOZHnUoFAHnehNkmIn7ByaxEWnilMzKjiIwppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvqlaFAigOSorV0ds2mwI6MkPAIl9a1Zslq2rcP7544=;
 b=Lb/C/LGXn5GU1ITnYi9hkAotzKvWuDQshN+zfVtTNm9UpQadWuNAX8E2Sss/ydPP59YnGMx1IWECR0xcBzU+bdduutgf1yEJOPMtJ5Gc31tLEoiF0eAkygfGjCcKmMjn1MbA7E1i9Yn/thQrr7xyVWNXdMRhisy9eB+l+8dszlX4U4S8apOKzVygcGpw+eqsTV9Dh8dBownVBCh22j6FzREgRUuipP//5Hirkn2cj1Jm1gIEa8+RGjU7Yd7znEecseR7fjGzAvVi/WFZZ0vnBJIaVZn92ceX1/QleN54HEAesoCqVL6OtL0WOvkNzuClDYDRi0FejZnwFg20uXn3nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvqlaFAigOSorV0ds2mwI6MkPAIl9a1Zslq2rcP7544=;
 b=3CI3gl60z48Q4gnPue3jvMTf2Hzc+gE7MmZdMh2M8KOZU9qkkpKJz56BUF9eTdUmZtMt+VSiLMxokkH60N4NR6+B0sYshcjsImmRgWKAu41ywTg5zuk1yptpfZFeKJaLFF1tAUcKdww61PbxjEzhvwfdStTIkj0czlJ7WsBy3fa26Pytk4dcnILksGGTyuvDP7GzHNCNjc0+wHTB67J9FfjZ8PFI7D2Tqp7GEBVBwbO5cO0XHtM+3UZMgFilfCAYsnUYKn5sKFetWHv39pvtQxczjo1EUttQhSsgerPjDrUxik81QNBPhrsdnJIIA/0oVGVfgLtWFtEe84EgFLUlrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <925c560b-c6b7-492a-9438-fadfba5a3b98@suse.com>
Date: Thu, 16 Nov 2023 16:11:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] livepatch: do not use .livepatch.funcs section to store
 internal state
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231116115841.71847-1-roger.pau@citrix.com>
 <d6634601-5006-475c-b386-97a1e53c5279@suse.com>
 <ZVYfHQD1AEmNVY3h@macbook.local>
 <54cbcb8b-c895-47fe-ba66-5fb06505e00a@suse.com>
 <ZVYryZ0HrKNKVtKb@macbook.local>
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
In-Reply-To: <ZVYryZ0HrKNKVtKb@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f36d8f-7eca-4826-0606-08dbe6b660cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YSp3slmLQCJDcQlIJqU7WKrjYp5/6jYa2PEj5u5kCK7yWftYQrb8gwHlIhQQQ/SbD6dRJfGEaiXbC10KQQPS3vekPDoKmlk1S+1D0292Dp2POiQQZaU+8kdCX4jHae81L/2STdM2Wl19/uCSkWA3QcXbfgg76K4sZ5QysXSJ1uT7+Gs4MPi9AIml7vwGAtayaN+evQDx/8XuSClkNq82XoRY6oJZqh0/I8W+MrCxXrggN43rnOmnplr1C/P6/wNGc2WrQ40PHdau8B8eQBboXPH0AjgU/RVbDgtVzC6cXpDAX70htGtZI12GPloXXcGsA7CYu97Wr/V4IWzjVC9YSiGXZ1aESZ7NlD9pDeurMZONVoOHgVIIPISZRQBudzcrqd9QrMYRl7ebIkAy+/c8h2ttoRANbaGWbP8m8IYVzq6kyux2EBM8nXdlwLB1GHWFjujDdYuYA2K6Cxb/3+ZgDsJJZEKYPvG4V0WYsPQvtXpJBTQjYJs0N1MxE7SfDmr5SywNgcz7mRUy5saIE7PzSyiaO8i+L+A+tb8ymVRH/Lq4oYyhAvbaRUVdXyWJxH+84KzLl9bksgKDRlvNli9WSbEGuDAUMFrM88WLDgmylUMeV/lG0IFuTnYMCaUWrutoEtlNJlkDzVy5uIPvb9bmSZ+p5oDJSMnhQZTdR2691PH0ysMQvTK9NkvzgWtWFTwe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(7416002)(41300700001)(26005)(8676002)(4326008)(86362001)(2906002)(66476007)(2616005)(54906003)(66946007)(66556008)(8936002)(31696002)(53546011)(31686004)(5660300002)(6512007)(6506007)(36756003)(6486002)(6916009)(316002)(38100700002)(478600001)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWpwYzhvLzhWQ1NCdmgwYnVRQ1ByZEZyR1hVejY3L2NHa200T3U5OE14UGh2?=
 =?utf-8?B?OXAwcUNqcmRmL3hIaGRnWVNENTlWRndXQXNIdnkxTWNHdUsrSWZRdmFIR2R1?=
 =?utf-8?B?YUNBYmJtdW5XYnN2eitCbEpxb2ZWUUoxamR4RHJJREZKWEthSm8rRXAwOHFY?=
 =?utf-8?B?Vm1CVnV3Z3FuU1BMaWFib3Y3M292QW5LZStmaWF1OENYMWNwUnZBV0JHOEEw?=
 =?utf-8?B?R0h3UlpUNmREbHdwSjgydlVIMVdaOFlZbzhzM0JxeUxyeXFSb0kwNkpmUHpU?=
 =?utf-8?B?T1pOc1JIc3lQZUxQbkZ2b0o4bklCUTJqaU5UemtoeFVjSFlRRG9LbjJmaEdr?=
 =?utf-8?B?Y255U0xMMDY4L1pCbXVwdFZZdSs2MElCSFZ4RnhDRnE3ZUNOeWV4NUV2MEwy?=
 =?utf-8?B?TVRxLys5MCs2aEwxVVJIMUFycWRqKy9Qbks0blJtS3FTYko2N3lsV3l6UHpm?=
 =?utf-8?B?WUpTMmM3OGxSRW92SnVQNWZTdE5BUG01NXlTSHV2Uk5IYjMyWlp0L2doVEs5?=
 =?utf-8?B?TXlQdmk3Wjk0RkZmQ2pYRE1lNDhEcUltakZMa0hBbzRlK1hiN1BmcUVJdlA0?=
 =?utf-8?B?NmFnaStZNEVOYU1RdHRBbXRpOENhMkcvM1dSRElvQ0crVTI3VzBxVVZPOWFH?=
 =?utf-8?B?OVVPem1lZDFsRGVWYzZta2ZSZGZkQnp3dzNoT25HMSs5ZDNITURVc2V1Z3dq?=
 =?utf-8?B?TFhTQmxZbnRmSytvcDdDYUpUOGphMThublZIYlFJeHNlUStvZHV5d2dsSXNv?=
 =?utf-8?B?ckE1WmZUcjJJcXp6U0Z3NFdxV1h4SWZKeUluZGZlaWlTakMycVBJWE8xTFpq?=
 =?utf-8?B?MTJSYmYxL3lqcUdmNDBxd1ZjU0ZKckdJMkM3VlhadVduNXc2d2p4L1RYS1Bj?=
 =?utf-8?B?cEtHR2xXdXhzTUxUbEdjMGhQdHBBcWxpTzNZUE1ZQlpnY0F2aEVjUmQ3RXcz?=
 =?utf-8?B?NHJ3L2taK1JyYndUQXhCT2J6d3gzdjUwN0d2MTFwWXdDTzVXMlZFOTlVMGNF?=
 =?utf-8?B?R2xCNWQxRFh6Mnc1OEhSUmg5RmRTei93RnZqdGFtL2p1QW5TaHRVMGFxd3VE?=
 =?utf-8?B?WnZRRzhmbFhRVFBCVlZyQllGZGJkZDhld29FdmZlZjJXT1FzRTEwVW5KOHNQ?=
 =?utf-8?B?ZUdxOTNMUWVBT0RrY25HbUM1SVRkaEMxUXVHcU02N2pvamg4L0dhdFEybjN0?=
 =?utf-8?B?bFlhTStIYklYU01MTHozYkJVeXMreGdnTDljYk9SZmxhTnBhakY5RkhabEVo?=
 =?utf-8?B?a2NNYURwd1p3eWFtc2o3bFFnRDNJVXcrTEN5TnFMUFEydDVad1lHR2Vtc1k5?=
 =?utf-8?B?TGk1RUx4ZmN0MlFoTkRaTCtMNHpXSVpZd3o3SmZqS3hFemI3MUUvNVJmWnI5?=
 =?utf-8?B?K3h1cmlaYmR0b3grb1k5V2JKNW5IRk53Qm5XaEYrTjh1ci94a1JXd09kRFJS?=
 =?utf-8?B?NXQ4WTIwZ3VsVGRNVEFFdzJKMlFRaURnRG1mcU9aVUJrNHBNWWZIbGw2UkRl?=
 =?utf-8?B?SGtmVHhSOGVrYmE5bmdhbm92YUMzNEZlMHUrQm8xYjUzaXlNbi9aVENEc3Y2?=
 =?utf-8?B?Y3hwdndFUktHRnFzdDF0a3FQamEwZUREczMrVmlFNFgrY0VWRWpHVXJUK2p1?=
 =?utf-8?B?Y2t2L1FaeGR6SDI4RDI2UGdKZjFTYTA3RUl4Qkt3UFhrRU1vbEQweWM2aytF?=
 =?utf-8?B?d2lRUFZZYTdCYXlDY1pCRkRyNlNQSHRXTnRhaDJ6bWh6bno3MnY4NFJWblRq?=
 =?utf-8?B?TFR4SE1BaXMxRkVFVkJ6MWFOM0o0WkE2MzlIWXlkbDJYa1FrNFpmQW84OHAy?=
 =?utf-8?B?M3IxdTBEb0VNYkN6VTJXMEpLRFVmMGMvMnVWRkM2dnJlTG5ERFpXSyt1UVZL?=
 =?utf-8?B?djc5aStvQUtDUU9KT3dFa0pldDQ3TG5vdTI5d3gxZnYyUWRVQTQ3cklGQm1I?=
 =?utf-8?B?ZlZyNTRQTU1VS1Rna0o4SjZXUU1udy9Kd05hNlVCeG16Zk92eTkwS0NLWTd0?=
 =?utf-8?B?Q0oxSjAyU1hiQzNxSmtheU9WRzVDMDBSMjRmS1pWVUxJcDQybUlpdzV6SGNx?=
 =?utf-8?B?THlQRzlqUXJIZVJQTjh6bWhMR3VpNUMyOFBZMnhqemtHcG51RUd1ZFcwTkIv?=
 =?utf-8?Q?TQtpSUH3fGc+7Hhvha6sP7eg4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f36d8f-7eca-4826-0606-08dbe6b660cf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 15:11:58.6947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAab/BSBVsvn9P2OwC63pGSBYyXEUd0/g5OaEySbHbo4MZr8mZwlelxzmOhnWRDTvN0HJbc04LzAoSmA6O14Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7374

On 16.11.2023 15:48, Roger Pau Monné wrote:
> On Thu, Nov 16, 2023 at 03:05:20PM +0100, Jan Beulich wrote:
>> On 16.11.2023 14:54, Roger Pau Monné wrote:
>>> On Thu, Nov 16, 2023 at 01:39:27PM +0100, Jan Beulich wrote:
>>>> On 16.11.2023 12:58, Roger Pau Monne wrote:
>>>>> --- a/xen/include/public/sysctl.h
>>>>> +++ b/xen/include/public/sysctl.h
>>>>> @@ -991,10 +991,7 @@ struct livepatch_func {
>>>>>      uint32_t new_size;
>>>>>      uint32_t old_size;
>>>>>      uint8_t version;        /* MUST be LIVEPATCH_PAYLOAD_VERSION. */
>>>>> -    uint8_t opaque[LIVEPATCH_OPAQUE_SIZE];
>>>>> -    uint8_t applied;
>>>>> -    uint8_t patch_offset;
>>>>> -    uint8_t _pad[6];
>>>>> +    uint8_t _pad[39];
>>>>
>>>> Should this be LIVEPATCH_OPAQUE_SIZE+8 and ...
>>>
>>> Hm, I'm not sure that's any clearer.  In fact I think
>>> LIVEPATCH_OPAQUE_SIZE shouldn't have leaked into sysctl.h in the first
>>> place.
>>>
>>> If we later want to add more fields and bump the version, isn't it
>>> easier to have the padding size clearly specified as a number?
>>
>> If new fields (beyond the present padding size) would need adding,
>> that would constitute an incompatible change anyway.
> 
> Not if we bump the version field I think?
> 
> As the version is a strict match, bumping the version allows for a
> completely new layout to be implemented past the 'version' field.

Of course.

Jan

