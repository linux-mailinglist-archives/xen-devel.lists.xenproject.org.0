Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE98802D63
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:42:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646609.1009035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4Wc-0002KC-0K; Mon, 04 Dec 2023 08:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646609.1009035; Mon, 04 Dec 2023 08:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4Wb-0002Ho-TO; Mon, 04 Dec 2023 08:41:57 +0000
Received: by outflank-mailman (input) for mailman id 646609;
 Mon, 04 Dec 2023 08:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA4Wb-0002Hi-D3
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:41:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa8d49b8-9280-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 09:41:55 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7094.eurprd04.prod.outlook.com (2603:10a6:20b:11f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.23; Mon, 4 Dec
 2023 08:41:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 08:41:53 +0000
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
X-Inumbo-ID: fa8d49b8-9280-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEOCY27S9/XFQ4/ZFHWcZkDni0S2fKF6fSbeMNp7GFPwamdxeD42KEkHILLV7tHyAoCiuNGsyVgf+aA0cffaD6GxnUAfjbNx0UYXW5Obc0+7gg6hvyCb2jg2JQSyqCv7KG1HABMoQ1FmNyj+1boIrnbcyyW0FxYJgJduALQaNjgGqmO77lzXz+zRObH26w+062gNXelQ8zRa2kZhcEjXdrh20lqFo4Kr8GfyINl/bMVBWEENkIGq5hT97xEG9uAy7GW5rFr1b9RhsCP9+QlbFHX3vBUmUQAlLQJvRaycTj7fSRVCRSS1s4AiDeSnHP2DDqcCGMlJwKgahMo1jL9QRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vREgiBgmeRhS0JA5vTBlK5oiH6yfA0mK5OQ3/x28zNE=;
 b=i9dCeH60yB8b5RlRUNpdTHMGwaRkcUM6faQe/fjSjEHR8cBLikcP8P2O/bk9+Lwl4vPFMmsaCViYIthPAq/CE7uNwNF48TUhSPMqv+Tl8oFF7V3OxsFQY4spe6EmgSUDygWoSOjeYptsVtrwCInfUhU5MQTfm8qOQsy9srDSxPtH0VKOcyEBFPgsmHh5hTBIq6IJXtvGwQp3w6BUbq+703BmlF4KFbGcOy8winGmugzFmmVUoFwCdmGBrZz4XAf+7Mr2iGwNCdNykWsQ2/u1GIdJkJbqbd/BZPcOs5b6gotGqcNgj1oN2++njynL2XWJjj7UbhhNSBIwb0qgDr0QrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vREgiBgmeRhS0JA5vTBlK5oiH6yfA0mK5OQ3/x28zNE=;
 b=Zv7X9QjhH4NBTlA3lwObQdnRu/yCsg+TVKfC0S8KDnSY5QrH+vO+qPgEeOPH2NBPfkCiUwo4/QJieKNF2Sl5yiVRAhm8XxaPrpChLSrtlBMimfkU+t4NUMwFcY2AmIQW5ZJsV9iIW3BU8TVzW07Cjq4ZPNgTnLxI9yBQIp+SawkcVuEXZtIH/9+lcQPKNYm5q/bL5dh8P42eojcdhulNzwhWai0sHvTzAjboW2YS4l1Bpxo9E6lEMM6ZNm56RqzMPt+9UrwVjAoUb1YD653csKlT7lc4NJEzA68QLdlaAYHGkxICK1xg0gCEdApGWNQWXk0IgC6VEd/xQb+EorBB2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <050a57f5-7c04-4b4a-848d-fd2f0993a9a7@suse.com>
Date: Mon, 4 Dec 2023 09:41:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
 <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a70368-a799-4847-f83e-08dbf4a4dd29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KqUMt2TltPgy7EEesSti+O/t+uoBRjxfTE3jMZCX9jsRtiS23z3J5J6ZWXkkZJKAzI0SD8aEhGd0Zqp/6yOS/NREbFipI1l0p3Fa3BHu19oau1x4baeE4rX8pRztXozb1S158LfvEnRHgb4imjOK5VgTflC9rVoVY+0Yp+XqxsCd6Q1PT/x3viJdMKjAY0tDIRYkud01LjPOC7xje3wPcagelAoWop7G9pxn101zmXrbuT+tHIfLbCB1oPUx0uHkgcYVIKAEKwey+vb+YU4Sdt1khZ+Vv+X2r/pydxFHhjeGuX3Tg0JmKUVCW2cvw1neClP+BqYXjiHacVNGadX4a5EiReiALr8tptAnibysbxV+wN55EwT6eG/uQ7MMYe4e5hesdhvbMtC3kaSHL3Gyzt2PD7k2VVQk/ZzDs0inbVZP78qu2VSZQKUusnvocRvTHXdba8H9yZyzwjo4OrJy+4r123Safk23zyKa/Ec9FNaLt2uxRytCaxBV38pxj5QjvYHLjoU8AA3LNceiPG8JssaC9+PQNEmNNpO/UNHPtQjchJeRvIBqUP6VxQ1jz1xbUfbHe/ikyPhq/yCBq89X8UqDaGt1atFRekzKMQkKaTSMjQtU7LvcKbj3kyKVipy+ZvaV+5kNQ5dTobSA5a6wcQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(478600001)(6512007)(2616005)(8936002)(4326008)(8676002)(38100700002)(6916009)(66946007)(54906003)(66476007)(66556008)(316002)(31686004)(26005)(6486002)(53546011)(6506007)(31696002)(86362001)(5660300002)(7416002)(4744005)(2906002)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3FiVFRQdGNTY1dJQjB4L3Z6S0R5ckpkeG52Ni9CSDgwWUNFVE1JMHpCeWhi?=
 =?utf-8?B?Z1pEeDV3ZWRCZkZqWFY2bjlvUkhOa1p4Q3JQaGg1Tk9Jd0lkbEtid2ZtbkR4?=
 =?utf-8?B?Uk5yMGJ1VWJNNEw3ZzNZeDMvdzE3b1NTeFgrQVpGU1J0TUxWcFdEekJMSGlL?=
 =?utf-8?B?aDkrQUFSa0FJeE5lYUdjL3RvWnh4eGw3NU10SDNmNmV2NFk4V2Q0aWJOYy9K?=
 =?utf-8?B?QVI2ZGpmUXdtT2RSVmY0ODFWSUs5YVFoQTZXL3FLbmt3RkdKNWp0eWRHcUs2?=
 =?utf-8?B?MVVsVWgvRjRwN2duNHRMRERMclVPdHNJa01vN0VIUUQ4WXRvbU9zRUZvZDdh?=
 =?utf-8?B?QjdaRkNad0U3enBLN1hHUDl0M0xJS2dMOURyb0IzT0dUd2duR2ZDUWxHUC9w?=
 =?utf-8?B?QW5NbFRxeGlmZmRsZ1VaYWxDMlBlamU5aGJrN3ZQQmhhYTF5endoUmxRZEhr?=
 =?utf-8?B?SjAzSG50VGpzeHhWQTU4emgxNlB6RWNKUkorOXMzVmhZM2MyQWNmOXFGekVr?=
 =?utf-8?B?T2sxNngwUGErVmNQZENUVHZWampDcEZVWGREKytIclNYUUw1UUpBc2wrdDc5?=
 =?utf-8?B?LzV2SDAySlRUQWlnN3ZBaGxSMHd5aHFtSW1mUHRDNnJCNWpjQmhYb2lONnVT?=
 =?utf-8?B?MzFnZzdYT0QvY3BKaHhwb05IdlNkY3RwbnpwZVdMaWFNdTVlT2ZGT1F3b2lF?=
 =?utf-8?B?M1VsMXR1VUY5aktjR01laVpTRHdIYmJkY090SzRXSWRWbjh5a2dTU1E3U1da?=
 =?utf-8?B?MG9qZ3h3a1ZlcWtXSlppby9XTTVOQ3Bydm1XeDJzd2xNUmFFcnhsY3M3dVFH?=
 =?utf-8?B?MmZBZjNwK0RHMGk4NWVxdjlnNXNzNVBXLzByM2hjQVVESWFwdU5hM3hqQlc4?=
 =?utf-8?B?Y2dUMngxL1dWZFkzOERlZ0NyYmpWd2RnSEZSU3JDaThiVjhycmMweEtWL1Va?=
 =?utf-8?B?aUtESERiSG1iaUFrQUZaNjM3c0VuTEJwOFMrTUhMVjJlUVV3UWY4bVZHTkNa?=
 =?utf-8?B?S1YyOUNSaXJ5MFRFQ05WZHF1REpYY2M1UFpZUnNJcXhuSWl1aGcxNW56UytE?=
 =?utf-8?B?eFR1U01TeVdFMXRUREVOVGh2WEhEUnVyNnRkZ3VBeHJKTUt1bWkzMVZKVVNY?=
 =?utf-8?B?ejdxeFhFSnMxUHpsN2Fqb25KNHhzaUhZRWEzalFwazdnYkxsYjU4MWYxd2VJ?=
 =?utf-8?B?WEY5cGxsVUROaFFsTURnODZ4ZHU5TDZTTlBVcFRyY215Zmh5UzFLVE9XZ0ZU?=
 =?utf-8?B?ZjRQWGxVMFNlblFySDJxSGJNMXp5a09oc3o5ZnF1MnJya0Z5ZTBqenI1b2RC?=
 =?utf-8?B?M1dwWE5jSDB0ZldPNFBnWmVja3pwVmNDRkErdTRJZG1uKzg3STFXVVVHZVJT?=
 =?utf-8?B?ZHhqd1AxeTFoRFBmaTkxNUlQNUVvVCsraEg2SElvTE5IYkZWK1h3Z0wxQUp1?=
 =?utf-8?B?cTdwNkJBTlUzR0d5TjNkT3kwUkhNenR3SUVuQ2RYYzJYTVk4Q0FkNFh6ZVNp?=
 =?utf-8?B?YzR1WDVUcmpmS0tlQTFJSmMva1ZremNpc1dqcEx2bXV6NkwzWmdTVGd1d056?=
 =?utf-8?B?bXNtSUFKNFROT2ZadFZXNzFqc0pvUHJmL2F6U2Ywc2ZQTXN2S0FITjM3Q2pS?=
 =?utf-8?B?bi9Ld3V0ZEpHL2tUZUpDUWRyY3dOYnFMQUExOGRIeElKcVFsZGtQQW1jOUFQ?=
 =?utf-8?B?N0x6VmVaelZPSEFRVUkzWHJWVEd6cjFOc2lXM0dIcTBTdnhBbzZuTDJrUDNC?=
 =?utf-8?B?OXFVdmJNbkhDaTdvT2pzOUoweWp1RDNGYjZzRnpjZlE0TlFWREd0cVdLeUQ1?=
 =?utf-8?B?WDBGOEtCMmVVek9ZSjRERUFXNmxXM3BmOEJIMU4zbWNuVXJpa2tZWmxaYVRV?=
 =?utf-8?B?UlQ0RzRFS1lUZWdva1ZCWGltRndtYzZ2K1pVZFBDcmJtMWsvaHJqYlhRSGFQ?=
 =?utf-8?B?MjAzTEJkamJWM3VKTHlPLy9TZmhuTGVJREtwN0tuL2FyMmdleFR2MXRCN0NB?=
 =?utf-8?B?QWV6d2NGMlNYcmxjc0dYMHlnNXdxRXhCMzAwejVCbC93b0dvVHE0bVpLYjBV?=
 =?utf-8?B?S3o4Um9jR1JqMkhWa3REUk9XTXAvOGRDYUtMbUJZaWhWdlVzTUk3TlZNNWRC?=
 =?utf-8?Q?B0WVk5kq5pIIHJC7qUw1QT9yu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a70368-a799-4847-f83e-08dbf4a4dd29
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 08:41:52.9325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHd689cFCzqA3eSges9EcbIKPIqL/G/PIv+IClVYDG/q1eaawYUe4fbYg0faPwoyCUqj+LOwpVAaejI/b/nFFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7094

On 01.12.2023 21:48, Oleksii Kurochko wrote:
> Ifdef-ing inclusion of <asm/grant_table.h> allows to avoid
> generation of empty <asm/grant_table.h> for cases when
> CONFIG_GRANT_TABLE is not enabled.
> 
> The following changes were done for Arm:
> <asm/grant_table.h> should be included directly because it contains
> gnttab_dom0_frames() macros which is unique for Arm and is used in
> arch/arm/domain_build.c.
> <asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
> <xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE gnttab_dom0_frames
> won't be available for use in arch/arm/domain_build.c.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>

Not really, no: In particular ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -15,6 +15,7 @@ config CORE_PARKING
>  config GRANT_TABLE
>  	bool "Grant table support" if EXPERT
>  	default y
> +	depends on ARM || X86

... this I explicitly said I consider wrong to add.

Jan

