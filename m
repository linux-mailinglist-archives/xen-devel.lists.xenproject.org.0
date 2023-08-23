Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBD17850C9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 08:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588951.920621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhe8-0008Jo-4O; Wed, 23 Aug 2023 06:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588951.920621; Wed, 23 Aug 2023 06:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhe8-0008Gt-0g; Wed, 23 Aug 2023 06:47:16 +0000
Received: by outflank-mailman (input) for mailman id 588951;
 Wed, 23 Aug 2023 06:47:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYhe6-0007vP-Gb
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 06:47:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7d00::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3a58e70-4180-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 08:47:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB8059.eurprd04.prod.outlook.com (2603:10a6:10:1e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 06:47:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 06:47:11 +0000
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
X-Inumbo-ID: e3a58e70-4180-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZ86ozLRJiCyXNX/0T5vJ0DgWIuxLky3+bmkm2z6IClRbEkky9fRYV4fB6PL87kO07ChJYaD9FZRKTxtdba9dVZMuNfQRZ98K1iAYvuMZ8ej0e8DhEa38zLvOrhAW7sVVPyLMHk5s+FvMSFAvSJpIH/45bxp273iZnLSlKgoASLnMjEKkrOyCNojoG6272Y/74e/BZFUqxQqFRSRbchnioMEvFiwJ/R7bWE43MObEElGREHQXQP4Fs33pmUjwpwuB8q/AqOgwzpHwSR2WzgEoEM5ll4NGVogyyXXmZgsEpcGqbdU5R5sxlWf7xu+CcwGI6eVZ6vk/TNNhofSmbFmNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/1FW8H7ts+jquUs3dV0eG6ORjyxJ5M/RQm71UlNl58=;
 b=bFV0NWkFPqhCe7RN4saMqGGzB6BLjTjiU5IPIV3p6vZydDIiBkc9cIY8jfAY1g/GGPFRueDyklNeFVLxu0RSrSoyNm5O6yj7BqfrHjZI6DSxzSnKY1OQ8V8aTQwg52FngrixEmDghhMdQoU8MCc+K0Coc6XDF14DHJclRIvJjTGDMU5bCB2i1dpeldVakmgAqzdNZ7VXZjX1N5X4rCBzmIMuAgSW8VewjgeB8iAoYKUz1r+jgkr8aj1VjMsX5qQLMZBEs+6Gw1yn4PRNrXSEgiwXwEm5TRpBlo4aScreTqxvfwAbNjEzrgwNaF7epjEauoo9LLjEegaCNGj/4rVygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/1FW8H7ts+jquUs3dV0eG6ORjyxJ5M/RQm71UlNl58=;
 b=aRCGUWlXewGNoq9teu/IFyVwiPn0HVMPv9zhmdxWqZ/nK7oOovJRyhBktTo+fVRc6I/jTZw6aOoLye8KWM53BYH822slC2cfvigbXrUJCt0id+FmR1cVAU6DspYHr6/dnMvMfa9wDzWHwNW3DKJQ7KFUNvnBL/MnSz8hS1jngAxh2uv9SeeusS46PXMkGJBhF720q3UKDgzW1qojHQyTb32+sZrIdM/C+s7WO5huWEoaLaidu6vrqpMakGgP6sTD6XVj/8rTj5UYCDyqTZwz45vkZ85d7u46yenXNPj8Mw+OPn3EYuSUUISaZC47+vU7hgkzp18EBrhaPkE+jR2Rcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19f313cb-4554-dd5e-6cef-3b962f37c7b7@suse.com>
Date: Wed, 23 Aug 2023 08:47:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 2/3] xen/ppc: Relocate kernel to physical address 0 on
 boot
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1692744718.git.sanastasio@raptorengineering.com>
 <03ef20c327c6f4a0ce47078dae52465b3cb32d2e.1692744718.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <03ef20c327c6f4a0ce47078dae52465b3cb32d2e.1692744718.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 38415ffb-8b46-4d70-3e96-08dba3a4c6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LIGkM+AZmzM3Nxg73FHcH/3iyAbd+EwvEGGTu30JHwjSJ0O6SklJXrB1XCP5uwL92cnBh81wDntgQT8L9driZvCRveTfKxDRDYJzJmhGlUoeBxBKXovvHUO1cwgeyB+hzR6IYLsiwxsD4yPYgUon51n/UOi4pZsMjnAKIwuBLIXAnAObRk6czECzKGYAawjpdsdhj30ANw/E/nVlmEMA2REfdqhRIt/Gy4SXLW4ntP2xqVBHLrJYkW1vXbW0LsIg6tIZIFvKtxCzQh/Z48ggFslhEOAhYApK/lyNtj84LqT2XBUbqkZs7rPnGrgau5c++Oc2CBrCEoYBscHAwoehMXrAkDQ8Wh2yrXrtx1xIVUDa833E4EswG015Z2AjKULsmXt3LzRRhDU5MlG0Q1K5zWLMhWujfzD0mWOU9Z2ClojvenAqqjEuVJuYbkqK9NUrZub6/TUEgVXfuzPeGPklHhzBPNoRbAy0TN4cD5dS/dUe9AbX523WJoZHSanKMdG8kjo/KVejikaqYZhHQEQVrCrKAaogBTIajmYKrvYgEq6Em3w2aAHmEAFAHiUyYtR5DLcL8SwAxShrZhPGKh8UJFoxvxSFzdWvfP7ZlQ9kFFg5x5e89kXLEmoDkdFMlNUC7Tfk8YJgPTnz1XrpQ9DTDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(31696002)(86362001)(36756003)(5660300002)(2616005)(26005)(4326008)(8936002)(8676002)(2906002)(4744005)(478600001)(6506007)(6486002)(66946007)(53546011)(66556008)(316002)(6916009)(66476007)(54906003)(6512007)(41300700001)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDU0SEdNbGhjd29RZjU3K3ljRWNzaXJTWHNCMGJpc3RjdjlPNHp4bHc2NjVx?=
 =?utf-8?B?Snhucy9MWi9zQkpVVkxQRVJacm8wcHRUb0hJZWRvalRlYVNOZW4wT2FGWldD?=
 =?utf-8?B?dTQ1TWRRK09VUmVKT0ptd3NyNVEvQlRiQmV6SEN2aUJmcFhWblliWUd3L0di?=
 =?utf-8?B?czltRUVHRWlrUmFoWS9Tc2tSNE9HM1VxTlAwM3hVYzVoTXRHUzc5YUZ3RU5Y?=
 =?utf-8?B?aml0bFVOQjVDMnhqL0NZUDd5V0NET0VtVGJQSVpURXNsWTZWTk9IVnVVd1JY?=
 =?utf-8?B?ZzJSWno2NHhYR1cwc2x1dmM1RktvcEJlL08wQVFTZTA5Ky82ZVpmSk9oMEZZ?=
 =?utf-8?B?SFNiY0w2UVNrUmFPZ1R1UlhWS2l5NldJaDRYVEl0MHc4SnpkT3BoNHlmT1FZ?=
 =?utf-8?B?ZHF1ZURCeUs2WkJqMmxramNyMW1oTndLT21uditxL0s1T1pJTVMzd095cFZI?=
 =?utf-8?B?S0Q4QVpBV241RXZLdVF3RTJoVW8vaGFPZGRxb2VvbUZyYXp4VUNqbnhCSE1C?=
 =?utf-8?B?ZXhyRG9sanVaaGduN09CVnlxaXNDNHJXeEJlNHQrTUtTdW1HWGFFend0Z09r?=
 =?utf-8?B?ZUR4VVFzNlNjM2UxM0p0REJmd1dQakJhRDlYdnRmUWJQOXZZdXBwcmw4S1JX?=
 =?utf-8?B?Rm5ldDFnSlY2ZGcxT1ZzVTlIb0FTOGtvNVJXL0QraTEwaDFLcFlVczIxMnVX?=
 =?utf-8?B?TXVCeUI1QW9nWHp0eWNGdmIrOS9rR3lLMXA3TmsyM0YyWnE1Tnh4ZWp4cldh?=
 =?utf-8?B?RWIxOUVMcnF6NlFIZlQxc01yT0sxVkdsZkw0T2dtZEVoNWtNKzczNi9jeVpH?=
 =?utf-8?B?RFB1SkFTU0RPMm5lMFBQMis2VmVBK0VTR2pJTTlnMFppTjdRYW41UDJMV3J0?=
 =?utf-8?B?aCtUNFl4VDc2bUV0L1QvN0JGUTk0VllpK01rOFpnbG1sV0JvNzZOYUxPcjR0?=
 =?utf-8?B?WXlqc0NhNFFPdkx2L1gwcHg2YzN1K0lHekZXNnQwdmt3YVpjR1FnajVyYmx3?=
 =?utf-8?B?OGpVRkpHV0ovYkhQVmllMzBXNERXUVNscE15NVg3WHNxdldtMUoySjFpUW9J?=
 =?utf-8?B?UkRpczkrRW1rT0pwQ2ZPdDFzaFhiODFqdTdGbUdLbW9oZjhMQzRXTi9vYWg0?=
 =?utf-8?B?ZkNGUUMrTnRQcTNmKzlWamgvQVpYbFZIOUtUU2w1b0pHN0lRVHhDdERoMGVm?=
 =?utf-8?B?SUR2VXhyUTZqaVdhSlJHdExaL1d6aWg0SGtiWHFrS1RyQVR2ZFpEUUcvL2tj?=
 =?utf-8?B?dFgrT0hOZkU1UXZNWExrUlFaQ1VnNWZUSks1Rmg0WEdXT3NhMkVwY3hoR2Vu?=
 =?utf-8?B?amZ3YngvcDZJWWYxeldGZXg4RFNqTzQ3cWRqeElYWTRnTVIrZnRjeDc5d0Nj?=
 =?utf-8?B?UGh0TmRyNGxYamlHRjE4dnRuNTBFcE9YaHBzajZneXREMG5lenh4clFBV0M1?=
 =?utf-8?B?N3EvdFU0SzJvOTV0TjJmM1ZMOXUrMzRMUXN0cmdwdWI2L242SEZtbTZVc1Qr?=
 =?utf-8?B?WGlTRHlqVHBtWWEyTFZxMlkyR3Vza0NzTWFOK1VZcXVMcUVRV1R4b3dGTkNs?=
 =?utf-8?B?bVhuMGpmSEJqZWdMUGxhSU1ITzhER2IreUJNTVNRVUVpLzZPQVovOXdiVjg1?=
 =?utf-8?B?TzZjT3lZTkNQeGljYjJYNVA1c3hVU21tWnBZR2VlQkxNblM0bWdPRy9pR2Nz?=
 =?utf-8?B?STQ2dFdRNTlIYXB3bm5TYWVYZXRZQlNhaE9Gei9pUnd2b0ZzQ09YaXFic0g3?=
 =?utf-8?B?ZGtrQkFOVVJ4dWpHNDZmSkV5UnU4MkxsUGxleUU3N2RvUE16Q0lvaHNSa3Zl?=
 =?utf-8?B?U3dwaFNsUUk2MHdvWmtwbmlHMVNBTjNtOEx5RlpwaXlIS2llbnJ1aEVaOFVM?=
 =?utf-8?B?aWFDc0ZPNDFTaVdZSHU3Ukt0MWNMY3k0U3BabXRXOXRXQWhueWNiNW1GejNh?=
 =?utf-8?B?RGRUK2tTQTdGKy9abjZxWWRWRGdNQ2Rxb2JvazJXaE5uTkFHKzYrdUNaNEVa?=
 =?utf-8?B?U1NzNEplbHZDQVZkWEdlWVNBZG41dVkzcHZyTEU3TmVtRXhxWDNzcHFpUDNx?=
 =?utf-8?B?Y245c3lMQkFHOWxnSlJSU1A3Y29weS9jR0hpYmYyTVFRNVVQaklRMVR3cWtO?=
 =?utf-8?Q?/zvJGau76Wx3gOD7l+s53PNjP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38415ffb-8b46-4d70-3e96-08dba3a4c6d3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 06:47:11.0175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1fXW7uRQu7Voa+oMB0O4MmOrxEI0AYpwEM8JCxbL68DRHXTP34MPg0MUqgiZtX+S/TuDglubD9dgycNfi7cEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8059

On 23.08.2023 01:03, Shawn Anastasio wrote:
> Introduce a small assembly loop in `start` to copy the kernel to
> physical address 0 before continuing. This ensures that the physical
> address lines up with XEN_VIRT_START (0xc000000000000000) and allows us
> to identity map the kernel when the MMU is set up in the next patch.
> 
> We are also able to start execution at XEN_VIRT_START after the copy
> since hardware will ignore the top 4 address bits when operating in Real
> Mode (MMU off).
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



