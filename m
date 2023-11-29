Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4807FD270
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 10:25:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643772.1004246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Gox-0002O8-Q4; Wed, 29 Nov 2023 09:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643772.1004246; Wed, 29 Nov 2023 09:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Gox-0002Ln-NF; Wed, 29 Nov 2023 09:25:27 +0000
Received: by outflank-mailman (input) for mailman id 643772;
 Wed, 29 Nov 2023 09:25:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8Gow-0002Lh-Ng
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 09:25:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7d00::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3962623c-8e99-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 10:25:24 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7222.eurprd04.prod.outlook.com (2603:10a6:10:1af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 09:25:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 09:25:21 +0000
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
X-Inumbo-ID: 3962623c-8e99-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqyvf9aHTYrfee8WYBYYL3R6klygs+ILOCgSFjhLdOg1889UmJaokqwkekFreL8Y8WZ8+3xTglw3l7wOJrtZpRN+ExEnIz/Ilnly5JF8woUB8O3IaOpn+cR+9RjDdi1UVvT29EjUYe6h4v2INHu7u6NV3xivY24iapQPu9BJ7GfzUMxMmutgPuWdyYVGh24hGNPhC9L0C6r8lOvZjsNbm93++vSmUNbBplTXCO7JwDHeX3OKJMwlLRhHgbxnYq7raYCcLh+UZ2FLLb5axSeI2lQ4rTgJAOuhqf2gAik8qedPubtRHbNq4ke6YHGb23KhGWHghHzxR/a+8wEZn2Sl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9coenym+in1fJnY7ijvWilkU5P91xdTD5B5I/Uh1R2g=;
 b=ZdSgKzp3yPOObmc1ZdrFi5cIZUIzP91VqDrPMsgULIlY6C5+igJNaX6zqM0gV+4nC+YieGdeZG0JLhSARhHzBcQ97Zh0pkx3fvXIdFV/wsC9VTJagVyhZxkjyjFlAeTAZjQ7CITA2GkQ2LzDF7cdltQHmyFsxkmlRM+BAItv32N1yRgcRcPraYKllm/31hYB3c+f9QaTS5VkZLReBqR2M0kiDFbYZiP0890EJyWals6GNf006PpUCLv8NAIn/D0lENB9v7bJqXzvl7PEb+ZHT45A9W1vWds2R9rW452Tx9ZixoWm2hbNI2ET1RBoIez1Wxb0hvfte0OqhDE1dgtrFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9coenym+in1fJnY7ijvWilkU5P91xdTD5B5I/Uh1R2g=;
 b=mgQBPGde+gYHQcmvu4fZtWhxNUp0OKi4RbQQFU4OsUTLg7Pvg6qYieoDPKS429h9kc+dxgPimVEiyIRypNaBpaXmyPZZA9bltpo+2SQz/MCfEqCpKcDEQE+Is4hffiw8yHIiueEk1cgsdG0VcvIJXyPdIgp95fKkcY/eflEn/fDNiLqyqbywdtdIUU7TMSUTFw10N6Gaj6Dx4Ks9U6IGecUlaiVPHiobKCFlAdDjf1UCqYhlJUuZCs9+4nX5dzQR+p8rd7UwqYU81KBCGEcv9B+LXy3FE4Va7h96j+bYkKeBrQaXSHgzzCQJwpNij6iyxsRhs4/dRnZL2ltvqQU2Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <307eb136-8edb-4c8e-8256-eabdfcdb9260@suse.com>
Date: Wed, 29 Nov 2023 10:25:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] Introduce generic headers
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cover.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: b73acb4a-2eac-45c3-1714-08dbf0bd1bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2PyWLREKpnlSvsNn/9wV6NnVhbl4/79CB++Y4NbnX49fecW6QYvo31DlXb3sguV6Yq68bWAI/b/rO1j0MzCso09ana/v7XPBvG/xLYWS1UHZ9gXrf5F+miC6a6pfLCsOeTJnMjyoIn5Oi155Ass5hoBYhOlaXEctTWfHTb5lL83E8tVry3ikpBEDIOOS5kN/5eIU5dwCj+rmnt2Ul3bFcdt5QZ04x62ISK2okFJ5fv5jsTz6HjOUhlmcI0jsGKbCauxtN6E+I9UoDnAe9GxnHTJVkvs6Vo8z3g1Z8+5DMVZ5CyCAaeFeXvM/pEXEjbGGB9QNuWR4Bb9nRvzqYm2afZy3/yHbnTadwomDHIsvfGTqQvJIejCY6Eiuv5CPespEhFk2THUkpydJxzmTzORW47vj9JSvMHkkTe2HPs6J0ISzd/mejrZ/o6VFdsUIoga9uX/MYY5fDBaU6B4j6Bl1Jq9UwuEKXMALIa2BgFesLZAPMhp236dadHPd1e6bWITs8KP/1O1/9LkXjfPixQJbmXO6Eg2eIwrvuFxvKlEmHJVqgl3wwdIId3h42wG9xAg7LBGzvHeWYOWQ7VI4+rmuvDrm9hi8Tbn85tqB+EcpWNO/ygdaBt01eyU/tFt8/3KQ7HKz0/pFOUr0x1MpbcZhDcK1xSbaf1UWti35m5k2BQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6512007)(2616005)(26005)(6506007)(53546011)(478600001)(83380400001)(7416002)(2906002)(5660300002)(41300700001)(6486002)(6666004)(66946007)(54906003)(4326008)(8676002)(8936002)(6916009)(66556008)(316002)(66476007)(31696002)(38100700002)(86362001)(36756003)(31686004)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXI1U0paczBCK2lnSEVacGVadW5GMkFzUzhrc05mV25nUVZJTkVRK0NBajdi?=
 =?utf-8?B?UXdTMUx2LzZHQmlzc09QV1ZrK0ovaTQxZnM3dXJFVGJtamhIL0lSazBLS1BP?=
 =?utf-8?B?M2MyeTJzSFJYNllyUCtMM01PZjI2RkZPcWFWcE5vTEFySy9MeGFuRVZ4S1Fj?=
 =?utf-8?B?ZzR1SE5sSEZjTjZQRytjVVUvVDdhL1ZzTm51ektqaXIyVkJrc1ZxNzBzZnNu?=
 =?utf-8?B?eXNkdFZ5L1pISVdVdElYc2dNVHJGS2lzWWNZcUwwUUZTTk9uaEo4NUtqNk0z?=
 =?utf-8?B?ejBOUEFzS2dPeUFZN0RNdnJDZkVXemRKSDNMbWdJOWRTZ1p1ejFsQnhjMGpo?=
 =?utf-8?B?ZWNsdDJBNHdNUEJKQ1NSRDEyMmprRnhISDJ6MXM2bUh1N2dkOEpOZ3o0d2gy?=
 =?utf-8?B?Yk1rZmJYMjYxalFqS1N2S2VoSlg2UVhhMGZDdTMxRXowanFoUTBkZVdDQTFi?=
 =?utf-8?B?T0FMVEpkM0NiT0tvL21HdDd4amN2YWxsT2ZmZk5JSDdZSUpWdWp5MHN2MC9S?=
 =?utf-8?B?NUQ4WWJDRFU3YlNsaDZadGdXaTJHMUpVdEdtbnAvNzd0VUNmQTRrQjdTdEc5?=
 =?utf-8?B?WGVRRmUyYWRwMmYySDVFcWVjUmRuUTArVTk5MERlN1lhYThhTlYxSVkrMGFH?=
 =?utf-8?B?UG9venE1aC9oYWRhbFlqRXRnNjkzRENMUUlXaC9RM2JIOWNJQ29XSU1sQm1M?=
 =?utf-8?B?YWZZaUkxK2YvaWpvSjdocWxHYUd1dnp6UEZabnJJY1lSZ3N0M2MzZnl1WEQy?=
 =?utf-8?B?SkNDb1hrM1JxTXdoSzAwS1d2Zm9JQXpGMHkwbE9pVTdlNE4xeGphenlrZGtz?=
 =?utf-8?B?V1ViRE50M1poRlAyZ1hLeDdtUytBL1Nyc3JzTHlSdDkraHk4SUpvSW5jVzBI?=
 =?utf-8?B?VnUvREk1WGtiK1dzblRTeHJ4Rkxic1JZYTd6QStob01TQjkxdDU5WVZYWitN?=
 =?utf-8?B?U2ErSllva2hGWHhxcHlrd3JNazNzWGQxZ05hc1JvSHp1dzRsSnhndFFmL2xL?=
 =?utf-8?B?ZkRoQm8vUHdvSGJMYURaK1VEVHVTVCtDclFVemc4eHJsc2tQeDFQTHdzMk1Q?=
 =?utf-8?B?bjFFSTdRVndqNy9HVUNKenlKMEVXd2xLc2ZIdk5laGg0T0hCY2dZN2lFQ3ZN?=
 =?utf-8?B?MGtlWldnak9teXBMMlZSeDFBNS9iYkFIcXhCSVVEMFdoSWRkNVB4eVJhbCtD?=
 =?utf-8?B?bjdJbWlvNk4ydjAyVDdkcU9jdlg4Sml3VXYzWHpmQXE3aFRSSVFrbG8zNVlZ?=
 =?utf-8?B?cytpcmJBdVNUb0NEYkE3dldUd3hQWEVodERKMlBWcGxORE1xMmdmN0JXMHYy?=
 =?utf-8?B?a3JkbTdvenNPdS90RkYrcGExb2kvcFVpMmxxOHU2VUVQMnZJUmFibXNFSWpj?=
 =?utf-8?B?WVpEVTE4aXlPaUJvNm9haEJoc3BvODB0em54MVh5OXZJMHk5RkM3RTh3Yllv?=
 =?utf-8?B?dk1VSjlvUDlJdlM2dEZVVnBUYitJMWdKZjhNMjRUTGdybDZwSWdVaXp0N2Z5?=
 =?utf-8?B?T1VBdVZNcmVnMU5WcVU5VncrYUw5MmRIeExCUlBTQWhWeDcxcm5SOVJudFRQ?=
 =?utf-8?B?Q3hyNEtZaER0czk4b3o0RU5iTjJ0UlY3K29aNHQxdWlCcnVwL2g3cFFqTGZY?=
 =?utf-8?B?ckgyVGtZcTlmMmJDM1ZtWkZGd21SVW5tdkFSK3BKajJCV0ZBaThMLzcyTEtV?=
 =?utf-8?B?UU9LU1MyR1drd0ZSbTRPUXg2SGJoNklWbHByaGp6MXJiR3NiWVhaV1F6M2Y2?=
 =?utf-8?B?eDZ6NGZIZ3ExdzBBUXpDd3FFZlpuZ0QwYnE5bTc5NG1nM2xuc0dSdGNweFlq?=
 =?utf-8?B?Sys4aGFJcEh5YTJWMUN2RzkraEZqbjV3N3EwUWFYUUFYQjZQQzVCMVdsRHRz?=
 =?utf-8?B?VExSemNld3NsZHNGWm8vVnJrVTFGR3FwV0VuR200ZG9wREZyK2FQcGtuVFVZ?=
 =?utf-8?B?K3Z4dFhiV3FIR044bEs4eWtNN00xTDlsdkpEQTdVNTBhanJZT2E3SUh6cHYx?=
 =?utf-8?B?Q0V5MThDVGp1RWMzWnZYek94SHhRWFlEb0FjY2VoMzMzVEdNTVEveWdLV0Rw?=
 =?utf-8?B?UUYzTGQwYUNYcDh4cWx5Zzh5OXZYMWk5U3phZTBpdi94YUNtSXMwYVluQnpH?=
 =?utf-8?Q?dZaOnuvjviGS0uGWsMdlxf2uw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b73acb4a-2eac-45c3-1714-08dbf0bd1bbd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 09:25:21.0945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjVHBnV9AP+T634IURveHK+VzvtykkytLnYT0XnSCWIBMNOzITf41Fsk12saOtJRNjkdyydmyZJmZvttSRJTgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7222

On 27.11.2023 15:13, Oleksii Kurochko wrote:
> Oleksii Kurochko (14):
>   xen/asm-generic: introduce stub header paging.h
>   xen/asm-generic: introduce generic device.h
>   xen/asm-generic: introduce generic hypercall.h
>   xen/asm-generic: introduce generic header iocap.h
>   xen/asm-generic: introduce stub header <asm/random.h>
>   xen/asm-generic: introduce generic header percpu.h
>   xen/asm-generic: introduce generalized hardirq.h
>   xen/asm-generic: introduce generic div64.h header
>   xen/asm-generic: introduce generic header altp2m.h
>   xen/asm-generic: introduce stub header monitor.h
>   xen/asm-generic: introduce stub header numa.h
>   xen/asm-generic: introduce stub header softirq.h
>   xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
>   xen/asm-generic: ifdef inclusion of <asm/mem_access.h>

I've applied what I think was suitably ack-ed, re-basing over patches which
need further work. For the rest I'd like to ask that you do the necessary
re-basing, perhaps moving in particular the device.h change later in the
series (so that "easier" changes can go in without further tweaking).

Jan

