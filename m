Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2615C7EBFCA
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 10:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633537.988414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3CdK-0007l7-J1; Wed, 15 Nov 2023 09:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633537.988414; Wed, 15 Nov 2023 09:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3CdK-0007iM-Fb; Wed, 15 Nov 2023 09:56:30 +0000
Received: by outflank-mailman (input) for mailman id 633537;
 Wed, 15 Nov 2023 09:56:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3CdI-0007fq-Pe
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 09:56:29 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe13::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dce2a21-839d-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 10:56:26 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7303.eurprd04.prod.outlook.com (2603:10a6:10:1af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Wed, 15 Nov
 2023 09:56:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 09:56:23 +0000
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
X-Inumbo-ID: 3dce2a21-839d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaHrOU5ppuOuk1AwhWAX+KE4K3uVDssnCGp5HnOvb1sjYUPHO6vfs/BQB90o74PbfxuBDvtNQNwPeBbPbb/gL1LAHjtEU/mKVblYigUKDR4nfl+rhT/fJJXNCEGxhuwsk1Wp/+OrwSUBnPdktn+/ILRZStfSRSkdCEXBjoL41wa7bjpzf9fDUH6IRcJHuaGiZtIBtivjUhxN0A/BjQ6H2APmjRzSSvzYWzHje0F5lJY/VH+RNUIqg6nJc8zJQzp1nttaVdijBa8jgXeLAQIdNVv7vZJNYT/4wuhS6COOO2RXw0uROt3LiyKEpEu84YnfssTzqtw5j1otu5n0WWXSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wanSzIg2RiD1iPPUc9HI4Bs4D4WYtB1gb6lvqy1XwM=;
 b=jnE1gVdFK85fWjxMMltyvzGlWLrMI3JcKI2aKj1P6XNFTovB3B8iMJJaFxru2DgPh+6HLptPZZComHQMH8mTLlLTDlBl5J6Zk1RUYUuDs6syvcPI39EO+vHayz9P02MqX9EaE3DaBWeVTMS++i5SfDwB5/2Lp4gUB0/+q4XhP0Q6E4/Z7FOnWrciCTxJKs018dTvFqOyQDFcwdHsXalCi4FtnEYPzBtX1sBgDfa+TshizxMIIb7ZRyhCMOosOi/MdfrLl6USA2BgrhZ/Q7V/0QuVkoWOW5YRTBifNa0TRrdt6OK03UEWZtHqYHUaG9FEznAFbbcOZHlFWzrM+vzI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wanSzIg2RiD1iPPUc9HI4Bs4D4WYtB1gb6lvqy1XwM=;
 b=Ad6e2PCaOEXElEikoMdbUNUZ2lYPLd0vfp1ZIHf/zLi2VlbisDt88NrqbStHMP7d/14SjD+UNtTUxs+KImDJgfu8LNYbbNX/sNL+PCp45JKZF/YKmJ1ztPYsH6eUTAOQcJ7DKzuRstMw4qNxSaP0jCxCN9sDVV3qOFI+7vH5y6dQWzsEKkefor6C/0MNmbxreFqaqPPCnIdIMGVI/qy7FNe0B1VaFEWsEM5OhMIgQRV3eccGuxuPy0n8stH89BsyEIO6nJm3ITo7SL9dAmDtFTVAQDsaor5IhrZqLfHPqrmxW/M7YvuD7iQIEER2LSU5G4ZDoh980gWJBbGc4+wiIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f5f9a74-cf90-4a65-8195-ededf00da9f4@suse.com>
Date: Wed, 15 Nov 2023 10:56:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] xen/asm-generic: introduce stub header
 <asm/random.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <2464c6b984d187207fe76453bd05502d288af4f9.1699633310.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2464c6b984d187207fe76453bd05502d288af4f9.1699633310.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: a36b0eec-6cf9-40c1-a11d-08dbe5c12043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LmLGgrWO2HNLM+M7csqvMpWRBwdfH30J7AtAxYB1qfINjAtDJPV+6gWtMR/nMXyk70yYdnsj8VG3dorogCot7Lf07dG2s7JlRxFAVIYmSXoQLwAFt82ShrhpGO5MDVedmppCJsbPNZujwJXExXMp5YzG2ZaDJaDnC16NF9inGKMMX22yi12GNiW0hH0tXqG27ZV6qS/QouI2AOCgt1y6mE0Z20b5isQDXXPJH0dN3IbDEydUAnxSC5AVY0I/tXmyoMQGYSMl0F+dyAR06qxQ3dNtlQnjx7oqU9ZlHmUJ4l+3QGQrJQF1E3m512SJnEdgiJtC9H5q03xnXAgOclmdJU0NMm57h2z2haZuy3qxwDoVQpCh9zorARRKooMZsa1HE76BnVPwl7CFL+cnlND5sp1HPbEM4zVs2aePgkN/QSRf3DemHGFZNGqSbi8euH1OVLpBkzgJMdoihXgRVF1B5l+aUTLdgwVMTK22QyUKnI4gXM9qGeQReTec6A+ICr3d9gui7ZNuSN4//NS+zz9ZlaG/oQi44wU5J1ozeF8oa6svOHtTsllGQExpcCeGBJzL7ynxvTUC96Ybt1g4jdopuvgyCJv/pMXI9UfZ2pg1yQ5vPVm2DhYW1u6hDCMy5vnyFkX1eAhZnH+XmVszHlZFOjFNcf0igxzyk5avnfyV9LQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(83380400001)(6486002)(478600001)(86362001)(6506007)(53546011)(31696002)(6512007)(26005)(36756003)(8936002)(4326008)(8676002)(2616005)(2906002)(41300700001)(4744005)(66946007)(31686004)(66556008)(38100700002)(6916009)(316002)(54906003)(66476007)(5660300002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFBQTUlFdXd4R01TMUMxejFVT2dKSFdOL0NtWTNpaHErSGM4WmFpRmVpcUtN?=
 =?utf-8?B?Sm9oQ1Boc2xqZXlVY3ROSHM4UkFCc2ZGakR6YVNjY3hxeEJBZnRRR2JBQk1P?=
 =?utf-8?B?dUZZN2ZmbFI4QXRSZkpOa3JRaXoyYmpoWGlKdDZzRnVVREdhVnhzNUpRNUhI?=
 =?utf-8?B?WFpDWVA5ZVN3L0xWbTZ3Y0Z5MDZPRkpnYzJTUWJQL3lWVkpqNXNyQlRPYzUx?=
 =?utf-8?B?QlVqL09OOENxM0xyaGtCcHc1akpHVUNlRkJjeTRXVDFHYWZtbUU3cVpNNmw4?=
 =?utf-8?B?cWNFQUVuWlpwaGpYZmRaTTBVMjlBczVNUnFIRjFtbEcxWE44anhBMm5YS1Zr?=
 =?utf-8?B?dTYyZEp0S21oa3BXWnc0UllhQS9zZzhwNGJZZ2JkYlNOeDRBTkwzRTQxODNG?=
 =?utf-8?B?SDRwWnJiQnN3TU9xOFN1Z2txYUpUdWhPbEMyblZrWXY2QmhQVGVlWGZLbTV5?=
 =?utf-8?B?L1hsdTlGVTJ5RVRkQW51S2NTNlp6NEphUWZrRTcvdmpyQXJuRGVsM0k4THM0?=
 =?utf-8?B?cVpyU0dHd0FSL3l4dmJtU3VQdDRwR0tOcWd0RnVMSUFWNW55Ukp3UGpablIx?=
 =?utf-8?B?dkhtMUZxUGVQT2lZc3ZtSC81VkYxMWJuLy9pRE9ycy9KQU5qNnZ5ZGRnUEE1?=
 =?utf-8?B?Y2d2ZHJ5Nis0TGJxUlhwU29UTmYyZklxYmVUbHQ1MWx6am9iblRjb2lMcVht?=
 =?utf-8?B?b2YySU1RNkdEeE8xSU5RWEtzR2ZKbWZSZTdyNHVkTVRpYndNYkJiM1VtSnE0?=
 =?utf-8?B?elBXeTFpdkQ3RTZmQVRYN3ZLbExiR1Y2TkR6ZGNnYTZrOExmNk9idFRrR0Zz?=
 =?utf-8?B?UGlmL2RMeDJLcXc4Qm83MExZT1pNUVZQQjNOUEdNMUZjZFY3cTNneFh0aXlZ?=
 =?utf-8?B?ZkJpcFA1MXRFUVlNcGtjSStjdmxmemdGdnFJSnJORWxIRmtsd2hkdGVYWnVu?=
 =?utf-8?B?SjJpUVFKMkF6KzgzMFRuRU85KzM3YlJNUWFuU0VaMDQraWw0SEt6cDZmQ0p3?=
 =?utf-8?B?YnpEUnFqSEhyZXNVYktiVFJDM25BKzFyK1VtcWY4VGh5elhSbEhCY1BVRVJl?=
 =?utf-8?B?VTRtMS9tRXZvcnptL3lvd3I3WXZXK01IZE00UXJsanRucUMwQ2xUbW9UMHY2?=
 =?utf-8?B?bkxCTzQwbE5NaEJ2ZUg3ak1id1FLM29pTCtnT29Bak1ubkdJMk5HV0VlMy81?=
 =?utf-8?B?U3llNk5TQnJ0alpGSFIvb01UczNEWFhvdXM0TVJhNjltWFJ1MjdCbmtKNUNB?=
 =?utf-8?B?cjhhVCt2OGZHQXJYVFA5NnRyL1d1aysvNTI5Nk5naWNCeGhXSysvWTBUSFZr?=
 =?utf-8?B?UjJnbDdGSmV6MHE0RWFtdVJyRjdVN0dLN2RXeUVROXV6dzdld3BxR0V4M0Ft?=
 =?utf-8?B?RENXeklNUnp5Sk4yTzZpUHdNS0JISHgzNG1NYVE1b1J2ZzQzY2M1eVZrVkpl?=
 =?utf-8?B?VDNjN3BpTy9ja05qQThQdWlCdHBxeWFDUzF2MXZqUFZxQjh0SUgwWnNUU2V5?=
 =?utf-8?B?a0ErU1FkMzkwdGJtWVNIb25zeTR3ckdiRzFVLzVOR2RQY2x2ZkNZV0Z5ZWpB?=
 =?utf-8?B?ZHRsdzFZTnJwWS9lQUVNcEVqcnA2S0lOR1pGZTBaRXl1MmlKK3VGQ2xoZ24z?=
 =?utf-8?B?REx1QXpmbVZRSmlsOEZGbU5YNHRyWTNqSG9UdExsZ3hIckNBd0x3bzF0a2lJ?=
 =?utf-8?B?dWNHNHFDM3pLdy9wdFBSVEVJclhiQnNNYnZYWjEzTnYyaFU0NXRONk1yaVB2?=
 =?utf-8?B?djFhc1lKRzVXbHdia0dPUDZqM1EzQmpob2Q5ZzEyY01TNEhNSVhxcjhlSHc5?=
 =?utf-8?B?N1dzSzUydW9jVzBlNS9lR3VKTi8vTHpUcUNLckJFWFF2MDcyZHRMZnNYQXE2?=
 =?utf-8?B?UEptSEFOZWxsc1QzK0JVVkxkWWdxaHd1SlFUeXVvRElHcDFZMkFNclg1Umc2?=
 =?utf-8?B?R3E4bXBWM0lyZ05EWkxRSGZNY2F3Zmg2K3h4dmhsT2FjOEk2azZ1YVl0ZllE?=
 =?utf-8?B?bHZjWE9jMGFJdHhRTit6RDNiWFFzNE5yb2FYWEE4V3ArUEtFQ0w2MjZacytm?=
 =?utf-8?B?eUJaU1hlWi9LWURwTzRDTi9vWmZORjJSU1BuNFE0UVk1ZWF3NTI0QjVPcXRK?=
 =?utf-8?Q?CUnoELjmY8CVXteru/Pz7EiEK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36b0eec-6cf9-40c1-a11d-08dbe5c12043
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 09:56:23.7722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+Tho+ORlZVP66QZvzNFlCRNQ3imrdF4icLlt5NiKfZM2KYtFhjlDwQO9/4QyfNpwsTkBJDAxERqQOSDWSnRqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7303

On 10.11.2023 17:30, Oleksii Kurochko wrote:
> <asm/random.h> is common for Arm, PPC and RISC-V thereby it
> is moved to asm-generic.

When you say "moved", ...

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  - update the commit messages
> ---
>  xen/include/asm-generic/random.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 xen/include/asm-generic/random.h

... you also want to actually move things.

Since the above comment matches ones on earlier patches, yet otoh in your
submissions of two individual patches you mentioned you sent them
separately because this series wasn't fully reviewed yet, would you mind
clarifying whether further going through this version of the series is
actually going to be a good use of time?

Jan

