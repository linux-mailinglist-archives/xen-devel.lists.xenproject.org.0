Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CEF7FEB13
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 09:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644463.1005497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cfa-0005zY-Oi; Thu, 30 Nov 2023 08:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644463.1005497; Thu, 30 Nov 2023 08:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cfa-0005wE-Ls; Thu, 30 Nov 2023 08:45:14 +0000
Received: by outflank-mailman (input) for mailman id 644463;
 Thu, 30 Nov 2023 08:45:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8cfZ-0005w8-8W
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 08:45:13 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5b3cf3c-8f5c-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 09:45:11 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB10028.eurprd04.prod.outlook.com (2603:10a6:800:1db::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 08:45:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 08:45:07 +0000
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
X-Inumbo-ID: c5b3cf3c-8f5c-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUOQWBBWOUNidJnzIqfggyVVXjMzae3LS0Nz868MuRJbrHcRnyzdyp2Bn59AGyKjtgrCUKWRp4KYy+aLq0cy9XGIrXgCeBfpjnCMwxnWKcJnkNSxcsCq9n70H8n96JVx5fRpMiQWyO/tPgGzVZKnZCl6uPRTMXBg0LNC1nB6Gq8AKfTUDXPeFooHm355ZW3dFkhSyU+uHfWHmQklV2PdMsBcrOUlZL4eQsRPXix+4r/WWE5xaX+T/pZ0yaXeXpYYYTYhxhDGFRguJ0wU+VcUzZqPbyK+ljC2cCOVeumnphafl/b4Rza9iSJ63nmDt54KspmUqSjvLWBPwfEva7xrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3rPX54ej3nOO9jmAmefLmyO4GpB4/DUCsMbxR7ir7U=;
 b=e0ZCWx4mrWYa+NKHOf4l2T/p4qhPzGW+BpUcdu9OOoFoy9mqL2wqBUdKiQ1YRlf9URPIUqFSERPVnrAW7g91dmWib2AT9/r6FOLy8P9UOAUWp7VYM816P3UpLofpsh/WxFVkfOEfZMEs4jh81UwKOcz3oAgEXp2GK6FDU2FTZzwaeYsBFDoigBHBPt49vYnHGzIFLVS5SjeeSa9yPyRS8h7yE3qYS9H809R/18NtVCUajUN9/BynlhSqLGhlobTnRU0+ulblM3KgSrIPYdChWzJhfrGhL8BO/I5yQRo0m/SFZk0ZWESCL3OtUsr33hVhP8ZfBrO+/IvReq+5n+kGCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3rPX54ej3nOO9jmAmefLmyO4GpB4/DUCsMbxR7ir7U=;
 b=vHtd6JFLCo+yqWgJqVwXEYgOa94LyLy7QFCSBL29RF10euV5ajJzsCu8UhsjZ28rD4Xlu5YrRkcLH+c07V/vShuYsFBPAKFtumXXBHBdaat3uw1oHOeyJR4RzQBKftecTR8bkQsB3jukVtg02/z+CQ/2AUtAnzS0/P14K81Vw46eUPvWubfGYV8upM6F/+MF7kIbQGUfajSfB+/fPjl1xvCpzGv3aFbEWuAPDDryTOKQeCTnl41tKNM9HNWhNUaA/eT4ukOA/JTLnV/UlspXoOEcfkN+lzgl6eOgSlxXmS4ia1rJldh0yOUQs2DJNnVos/BXrLeGd+gYxJRH/dxgJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bac805b-5f23-4a34-929a-70e36c88a488@suse.com>
Date: Thu, 30 Nov 2023 09:45:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen/arm: address violations of MISRA C:2012 Rule 11.8
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, maria.celeste.cesario@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
 <df2af5f9a93c3cbcb61c28ff5228632c82d56f37.1700842832.git.maria.celeste.cesario@bugseng.com>
 <9b1e2289-4080-4dd5-bf4e-0dc14425ffce@xen.org>
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
In-Reply-To: <9b1e2289-4080-4dd5-bf4e-0dc14425ffce@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB10028:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d35aa84-74b7-4bb8-dd61-08dbf180a799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oN8IqnJ4Z9TviLwSAdUf28CT7/+FvN1A3Q9iwVUatvgh7SDFTewV6d/il8s5/zIVNAQu1+Wtjr8lXJxYgJ5AhU24TOYGsyXV0C4JdmApg0SMhw4El/2FlJSuRnfA7YgRuM13e5iGm8zDMotRG29Ma9XehVdvrIaoHn7egiPFrkl/tSm3yjVjPP7AJPUnsGvz19FcEEfXH8+so74fE5mQLK1aK9SPyFi10nJ7wXutM/QNLXW/8vJi0cHiz13rr7a7/sDy8pFJYobMfzO3A1/0fG2+VHPfQrLdcQQhlKYZm8MJhDOUTNypax6NbAY8QSbLUjUX7/63OLcp3DOlerJLJo3PXvB9z3IXEC1g1ru2XhBGmnRvp0bf1Rd0QDKDvtn1UYNKqQJRYwIPpIeNaOCr1EAYJxp0or+7bqv9GMM4WUvL/k6/hX7IO36ElDmWJ7t1mUr6qa+cpQTUnOpWAO39pvwvxM9CNnOoTT7llhFFw7NVOtbsZgUfLF2FeWY+OszdIlRba9g3+YAhb4U4k1SMAqhJk9tnWT0GaRI5QHoVxX+oeboNESHnrl+iGIiynyhG9GSOVJl4ULdU1+Qbe2VP/BAcJ5hxpe4XdGL+bUBIt4bz+tEQbSYXLTmyDymDgoDZ+uF3LKrxR+ketyrNNvdowALtJRnnXSV99blUYeG+R2a4sBE4itmRCEqTUivAzQPs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6486002)(478600001)(31696002)(6512007)(53546011)(86362001)(54906003)(66476007)(110136005)(316002)(66556008)(66946007)(8936002)(6506007)(8676002)(4326008)(202311291699003)(2906002)(41300700001)(38100700002)(36756003)(31686004)(2616005)(5660300002)(4744005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djloNnV0QW9yejR2d29lL2YvWWpzQTEzUEsyZ283cjN6blVFTFE1eEszY2dR?=
 =?utf-8?B?OG9TK3MxazQ1QjRHYURDNThDYzNDT0ZYcy9Ia3hlVVhLcUVNZzhMOThsejJo?=
 =?utf-8?B?b0FzREhtQUszYzdGdWFrd1BmRUFVV3djRmRNbThnUmpmZXBETHNIa2J1TU5Y?=
 =?utf-8?B?SUFsVW9oa3hCSUsrU01mMFAwUEZpeGgya3g4NWpJMTNtYklpSHFMTVpobzdV?=
 =?utf-8?B?a0xHZ1dQU3QxUktEa29VZGM2SXpGUVNBd3lwM1lNRjFpMFRrM3Jwa1p1WENl?=
 =?utf-8?B?MmFsSzVaUVdKV0FhZ3lxcThydVViMSs1b2VHRWg3UHc4V0V0RzNIMVdmYVFY?=
 =?utf-8?B?NFhSUHdUejYyanVUMDZTbVFDdS9lZVdWNG9WUXJkVUs5VUovYUFHTXZXMXB0?=
 =?utf-8?B?RGlVSjhkTVlSaFphSzFUZ0Z0RE43cU9SdzZvWWppNzNyajExSjN2QTBELzl3?=
 =?utf-8?B?S3BjUjVZS1NEYTlNaGFGbXA2RllxZ2pEQkJPUncxRm1wNzdxOG5EQ240a01P?=
 =?utf-8?B?SE43NmZGTXhTOHlReXpwK3B0ZHF1TEo1TDhFNmVrZkNjcVp3UzBSTGRyaTUv?=
 =?utf-8?B?VDEyRnZURmlnSlhQZmF5OUZLY0RqQTIyam1OUThFMWdDZFFvWUxQSHlpVWpO?=
 =?utf-8?B?dUdYTllrMHRlK0Yxa1dOUnhTdDArdWY0THZYdEZnaXQ5blZ2QjgxNXJsc3M5?=
 =?utf-8?B?NWpneVY3eVIzSUVta3lpR0xCUnoyTGhzazNDRWk2S05mN053Z3lkR3EydWNx?=
 =?utf-8?B?dW9VZlFPSGlwa1J1MHdmWGVPdTFsdzhUenBZbzRQbWxDMVh2ZlJwbXMrbTRW?=
 =?utf-8?B?L3BUd0w4UDh4OEtleEFCWlNtVEpsMy9INHBScnNYVXZPK204OXpieDVRc1ZR?=
 =?utf-8?B?UzVJWlpYQVZYbXVWY0lPQjVUcjI0RDI5Rlh4dE1TSGdic1JpYmo3WkV1Vlky?=
 =?utf-8?B?YUlVbzN5cE81Szl0VFQ3UCtXYURwS2o3V2kvd09Jd1RMQnpUeW1vVGRQSVV2?=
 =?utf-8?B?bmtSYWwwRDZ1Nm9WaUFxWGpDclpabGVZMXFHcjdsYkMyOXIvVmhSTlJaYnZX?=
 =?utf-8?B?Zk9Gc2xvdVhqQW16bGpwN1NYUDZxU3ZMa3FCem5xR2ZGR1VHWDZFMDJFdFUy?=
 =?utf-8?B?NVRyV0thckk4SjhxdjVvWlRrWkJIZTNWZU1nL2pIcDRRMmhjNTc3UWRmREx0?=
 =?utf-8?B?UGt1aW9qaEczNjNUc1NIR2lZV01HTlhCQU44RkxpTis2MnUvbzVUZmR3V1RS?=
 =?utf-8?B?b2JTQ2Frb21wSWxwQ3g0aC9rbUZjWmk3R2NOYzNtUlltMHBBOGU0ZGV0WjRB?=
 =?utf-8?B?bFFpSE4vVDJwQTBDWXZaOC9PSjZuaFZVejhVaWZxMDdEYXVHV3J1MlJoWGhX?=
 =?utf-8?B?TjIwVDA3YVljUHRoMXlpREVFU0dKaFljc0tORGd0ejJwbjBzMWVNekJldHB5?=
 =?utf-8?B?U1NjWXZqMXErUXlXQ3NEblA2dlF4UWNaM21aMjYrc001T1U1STJneGUrV0pk?=
 =?utf-8?B?Y0x0VU1TRlZEQ3ROaTB4dElwVE5ESTdKQTBNNk5wdSt6L0g2UUUzZkUrM1h1?=
 =?utf-8?B?Y0h3a2FQMUxRZkxlZ3hOMlExdERKUTdRdllYY0tNVXV1WDErL0Noc0xpcHhT?=
 =?utf-8?B?U0NxUWx4aHZuRjVJbUhJc2NnZ0IxK1d1OTlIK3BOWU9PYkwzd0QvMC9wUjcr?=
 =?utf-8?B?cGo1THZhYlZ3M2tYMWFmUkFpa1hUR3Z6NEgvOURmUy9FSjRaSGVsR2U3THhr?=
 =?utf-8?B?b0ZjbDNFai9JYUw3Mms5NTJ0REZLRVJzdnI3aEh5V0ZEdkhRazBVWm5yZ1VJ?=
 =?utf-8?B?S0JpUFZFR3VUWEdxT3l6ME0rN3cralQ1OTRFMHBqOHdOTXEzZStUQkp1WGhz?=
 =?utf-8?B?T2c0MGJDVjRtYS9qSUsvRnB6ODFpSDBwc2hPbzZOMU5QVWxEL2NzaWZHN01j?=
 =?utf-8?B?TnpPSlJacWp1cHFnMUFQMitOdFlqR0FhOFlaaE9RbER5S0hqQ3M1REprdTdp?=
 =?utf-8?B?TzJCZlR6QzVYZm81b0tvY0xUdzJoUnBTZkJHRmdEQkYrVCtPQ3BJUVM2eFZH?=
 =?utf-8?B?TjNucnFLUUU4ZkVlVExVSEk2bkhTeTdrcWZoY3EwT2R5dmFIZzNMVlZGc1h1?=
 =?utf-8?Q?hD2vIeHXZLDZJKjAJGzXfE6Iv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d35aa84-74b7-4bb8-dd61-08dbf180a799
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 08:45:07.3887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rm8fMyqBn85tI0VwLE9phcn39zvDReqy/V+oKBNshDYHTk7svAeC8SCdw8eNGGpVkYWbiGrxafxzGXmTRtMdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10028

On 29.11.2023 18:50, Julien Grall wrote:
> On 24/11/2023 17:29, Simone Ballarin wrote:
>> --- a/xen/arch/arm/include/asm/regs.h
>> +++ b/xen/arch/arm/include/asm/regs.h
>> @@ -48,7 +48,7 @@ static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
>>   
>>   static inline bool guest_mode(const struct cpu_user_regs *r)
>>   {
>> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);
>> +    unsigned long diff = (char *)guest_cpu_user_regs() - (const char *)(r);
> 
> NIT: I would take the opportunity to use 'const char*' for the first one 
> as well.

Considering a similar change likely is being (or is to be) done on x86,
I'd favor not abusing "char *" here. Either use "void *", or - considering
the intended result type - go straight to "unsigned long" (or uintptr_t).
I would certainly ask for that on the x86 side.

Jan

