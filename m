Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863397FF634
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 17:36:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645062.1006856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8k1e-00010Y-6d; Thu, 30 Nov 2023 16:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645062.1006856; Thu, 30 Nov 2023 16:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8k1e-0000yI-3z; Thu, 30 Nov 2023 16:36:30 +0000
Received: by outflank-mailman (input) for mailman id 645062;
 Thu, 30 Nov 2023 16:36:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8k1c-0000gH-Mg
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 16:36:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b6693ed-8f9e-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 17:36:27 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Thu, 30 Nov
 2023 16:35:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 16:35:58 +0000
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
X-Inumbo-ID: 9b6693ed-8f9e-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrviWtANQ/sjaxlS0S3yp2u4ZMtO+XEadBmWe099Tj6wigU0agrPgpI7IRQU0WIgmgwCggvzymupZWwos3+NWxdtTSR2D7FryoloDIQ9fB11f7KDce6u1eBvL6Id0IKQPdWzd0jGHg4OxILqTkO/DYCfgVX8vPtzXwWzw61DnNl91UHZw/8kwES5mnZU1zYxavMQe62HYmOappjrKrIRrTEkJjfNJKvwf5TroDR2OnMLML0kvWw9L0v8BSJHCb7+BgPwiV0mIPy7GU+4Zx2bcHGb2cIYdPsZ4KQd3uFWkeM5sD84LT/bUGPOD4nGJwfrP5B94Z4xcrXH3kYnSlCMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=359se0zwheblR3gQ8iCEWo19fEVQkaMnFaZyxNlsiXQ=;
 b=XoUiFLIs4s8bsX08c48x+Ki0H+ixOS8az2fn6BApFpMENEqkbqemCURvZTRqa3tinhE7VoXg53yjH/XzXr3zVGim8NUPeAWNtuh0NeVqaDLDt74avedmaFmJEthgx97mV3qL6Fu/w4aZ/zvTD2OBP4s4O6ew6kicNWvS6Y+Ktf2eAgbxEIRyaoE1YjRNQ1rAiMed6eJ/sY6X9xMnKzt4jkui7HH5akh8rdW3BkXRqXmm/Krq4lW6WY792pzD4dtONTz+V2ZBR4a06rUEIn6zxKLAs8G1ouqFjj9SXvA8FBpAgnjYDLfg1+I9G6eS6P40+yKDSTnc21cd/c0pAvs/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=359se0zwheblR3gQ8iCEWo19fEVQkaMnFaZyxNlsiXQ=;
 b=x9osfgtLtVwVChpayySmcoKIqRJoVsBGTdccsSfjW1xphYxK++o2/gQfzZlmWtm40U7C4/47rtDnStETPkVHS83CB1BHmLltgZgaGxnCMOTsrhqWdQ4iy+TCPXHZJVh8DqzSrMpe01qOCeaw7kRcbspK3zfXyq0EibCTrvgq4tseBuD0/jGj3PR+YHQWMnNDTht1Yz6O1lUc/Ao1RjJCJC2Q4T2YTklRgPURj4Zn4lGoudjCEiGVwixzhq/DiulXQSvwQ89L34GCIR6KWD9Wnf8lD8K3iHlYgleGQiP58HBOLWJeMt5NATvyPrplsv8NMHYht9ua6QsAtTpX7BD0wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54946bcc-6983-4c19-ba62-4bf9079701af@suse.com>
Date: Thu, 30 Nov 2023 17:35:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 11/11] xen/serial: address a violation of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700832962.git.federico.serafini@bugseng.com>
 <4f831a5441ac699b50783fb0559daabaa37b8e50.1700832962.git.federico.serafini@bugseng.com>
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
In-Reply-To: <4f831a5441ac699b50783fb0559daabaa37b8e50.1700832962.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: fec1cf99-9f01-4da7-96f6-08dbf1c26e3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I2b2J9DkjWJQZxfjxi8c2nXlR/yXzFIeqOb3UtydQoRyxCid4KivwSfX9/86JFM2/XB0c7MZB2UOEPtlvgtscwcURigVv8EfNZRNXuo8D/mA1bNDSBveT430KCqvd0XAH/KrYpFOGMXrAf1SWFosxRZ9AYZsbjODPwoJvN6kKEDEW0/wyzGI5Ph8GVUYTZSM//rIjgkxfsr5VZbT/bPlF+sH4AikA+0gFxa62Mt3MMWSL8kXwpldgsvxiuxkbZ9ub+kmIUONq/U/uQohe1eG0sA5pLLaMHAwYujpFWXoz8gKJRRkDGfV2aQx8WuJCLhXL2Mp5z6/iMH+gyu0C72FpBfUjSQySjnlEdks6YZQZPLPEddb5AP9wKmf1BN95hiU3O5gWr6lUkrTVUHdQiw7tyrTkcJ2uR+lOAz6xBbIF0Yone1mTRUG8Glzxvp4KlptVcctLDo/zuYBF/kbYYraKhYoaVkjfEE3wS9kobbJDOAs6k02b3TtF8k6QaXsgEehAQxuqCvpgmYgZ2N2b5jJt9aip63NLUYaS9pNLMmqNERc7HHoeDDWO2W/gf+5tvvuiuhPt42A1AYA63itKarJNXpeCi7c3QO2TGmX7XYjemmiucG/Q6soXzmqG86X2BmQpCOZ+C24J/4Em6OmRS3rIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6512007)(6506007)(26005)(53546011)(2616005)(478600001)(41300700001)(5660300002)(4326008)(8676002)(8936002)(2906002)(6486002)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(558084003)(31696002)(36756003)(38100700002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEpxOWY4ajVlcGlxWWpkSW9zQUk4VFJ4L1lqa2dGeXBreEN0ZGcremtzZ05F?=
 =?utf-8?B?RkZDc25ocEE4ZmFzSm1FZCtsZHpVaFVHSUlDR0dCbWZzRjlsSVB6cUxyRHJO?=
 =?utf-8?B?d0dZSk1uRlhrNlJaRnhPaFhFUHg3Q0VFVEdXeXdvNVBXaGVKRUNuNjJqWXJw?=
 =?utf-8?B?ZXhscFpjaUE5OUZiRHJRdW5NQVBkVzNLR090eFlUSEdCdlA3aGZwazlSdWEx?=
 =?utf-8?B?N3NLWU5Db1ZHNGFjaWZXY2NtSTNBRVhZMUdzanRSdWR3cXU4dk1SMThFRHJS?=
 =?utf-8?B?Tkd0cGtLckdNVUswNjE3cWZsLytnWDVRRVpQRjl2SzFySFJmY0VETVFtRG0z?=
 =?utf-8?B?bTR6b2xFdHREVzNqb0FNQUd0cUY5SmNENUxkdlBSSVhXY21IeHVGZFd0K2U5?=
 =?utf-8?B?UXhrbm8zN0JqZjJQc0ZKMlpJZHdSUU4vV2dvSEc1eWNabWZzMTNvN05CZEpP?=
 =?utf-8?B?T1dIbmZhSmNxYXdzVDJpOXhpbVNJdStHams1RzhGQ05qQTRrekJKVHNkUVph?=
 =?utf-8?B?eTg4VzZFU0EyL3A2T3MzbG1scndiWDFUcEt6dmN5RXNqVnN5alZXOEo5cXg2?=
 =?utf-8?B?dEJvcDVCTEhZKzRsZUZvYTBxWkw3NWxpRlhHdDc3Z3V1MG1DNFAxMFJqQ28x?=
 =?utf-8?B?RzF4L1p0K29NTE9OcWNOUENmYnBXdjk0dXdPbUVGaGEwYllPOW8wa3NybjBM?=
 =?utf-8?B?UlFZYkVXdEc2cHFSYVdtZE4rZzk4d1ZmRURYYVZ1cjVPblZScUFQbkVBNG1x?=
 =?utf-8?B?bWxzK0RyYlJRY2JabkJjZ0J1bTQ0T3J6WHRqU3BnbmRoUE1WNTRYeUx2RFVs?=
 =?utf-8?B?UWFrWDZsTkJ3Z3IzejZhUWE2TmlZWURtaDN2MG0waVZOR2NvM2ZsRjVKTzdQ?=
 =?utf-8?B?bnA2Q3hJT1dGUUJ2T3JjZS9xb3o4aVJ1T0s1MjRXMmJEVXBoU3JxbHFlaklF?=
 =?utf-8?B?Vm5DZG9yeEhLdlZjcklXcFROUy94ckFaeEYvOTFSazdoMm1SRlBjNDJBcU9S?=
 =?utf-8?B?Z2V0d0lTdVVBV2J0Z28vMEFFZWhpQU5OcjgzQ2hEN2F4RXZnbGpwQ1k5b2oz?=
 =?utf-8?B?WGsrd3k3eldqTUxqZnBRaXpuTTR0dTV0VmJuWWpnUWZvNWJwN1VadUJWUnll?=
 =?utf-8?B?Qi9EL3gxY2Y0OW9LSC9EeXM5SmdPeXRTWjlvY0RhdTB2VmRQZ1cwTVJ5M2hy?=
 =?utf-8?B?THdTM1diRTJsK09VeDZXTk9vWkpLbzNaaVd5Z0U2Y3crUHYxc0MwdHl4bFRF?=
 =?utf-8?B?QndlUzNMbEZ4eENINGNPbmdZK3pUbUk0ZWFoK1pFREtaeXFLVnNPMlI1OEpr?=
 =?utf-8?B?ekF0MFBNaytocHJ2SDZvVEpoZmVPS2p4WFpQdXg0SnhQZnpUVXVqRjExUFMy?=
 =?utf-8?B?M2djTXNsTHYwanoyTmo4NDJKTlZHNkpQWDhlNG15ZnRVV3dyU3dhTVZ0cFoz?=
 =?utf-8?B?YkNseVNuQSszQXlzeUIySGpZVE52Y2RZS2xHVWxHVmF1UjhhQ29JOVNCaVdN?=
 =?utf-8?B?UWdzc3A3OWR6QWFnZkJrT2I1SHp4bmNnb0dBaXJIN1dlcHNCUDVuZnB4dG1t?=
 =?utf-8?B?OU1qSFlWNmhDRWFiVFh6OXU0WU5GZ05oUTQ1Q1J5NXVqNlBTZ21JeEZlWlBa?=
 =?utf-8?B?OUl5VFp2Zm5TVkNZVTRjd25FeENCOG5HQnovZkRMUkpyOVRVM2lFOURtSURR?=
 =?utf-8?B?dlZzZC9oZitCZEltaVRuL3ordkxGeU53ZUZrYk4xc1JVb1Q1amZmNC80WVJi?=
 =?utf-8?B?OExxdEJOMEU2USthTnNjdGY5SldRbU43SW9tQ2MxUU5jaHBpcmowME5qNmMw?=
 =?utf-8?B?UmNHL1FxVE9lcjN2TSt4bWlWWTlIYjVQd1o3dFZ3eTg2UEdDdEpTcDFaL3pw?=
 =?utf-8?B?enE5b09jT09aSWVrSGw1STZHTnNMUU9nRzhTc2xtckxIalNxaHU3VlZWNERj?=
 =?utf-8?B?blBSN1VZd3FjZmhEQTZuWUd3bk5ySWY0VFJMZTRxZitLd0E1a1lFZ3RleUJm?=
 =?utf-8?B?NFhOUmRacEp3L2tFNTB2RTQyMzVXQnhMYWJKT0wxdGVoUGducm9CdklEcmQ1?=
 =?utf-8?B?WWpqRXZ0T0F4Y09xcjgyTGJTcWJ6eU1RS2V2ODFhQW92Q3ZONHlLcS9YQktO?=
 =?utf-8?Q?y2ZLVz0saN08hsoaikzwsLa32?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec1cf99-9f01-4da7-96f6-08dbf1c26e3c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:35:57.9674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPBT06gKQkrWR5w3ixt4Ye8EIrNeLOTs10CzmEULzlXVb32BNaIaoLh9n8HFJiKMhMNa44sx5iNGJX4ci8qzYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040

On 24.11.2023 15:03, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



