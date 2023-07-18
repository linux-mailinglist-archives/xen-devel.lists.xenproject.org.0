Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1243B75778F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565003.882792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgmc-00059H-Cd; Tue, 18 Jul 2023 09:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565003.882792; Tue, 18 Jul 2023 09:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgmc-00057c-9t; Tue, 18 Jul 2023 09:14:14 +0000
Received: by outflank-mailman (input) for mailman id 565003;
 Tue, 18 Jul 2023 09:14:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLgmb-00057W-9S
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:14:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7494331a-254b-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 11:14:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9502.eurprd04.prod.outlook.com (2603:10a6:20b:4d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 09:14:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:14:09 +0000
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
X-Inumbo-ID: 7494331a-254b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oewPEfAXJNlTowQQMZdG/DjE/qIyxPXNFpEVtsrlMooFZnOuqBtblWzEhdwUZwuX1S9cCcaeiptedwNXNZWI3rXC12Eggr+Z4NKaWJ5jYcY0gcmWr/RHc4py9WaGa8ocfFygeCbZqaSwLYBJrxLOnDixG0YpueLCXM8dKX84JNcsHEjn01q0xp6CGxRW/0WjYUZvHTjVTVYMdJJZ+6ev9oUL7IqIgD0KjaVjwq4Oi2iNCqWc5wkwZKxQ5F5b+n+uPMM0txUT6FJcUJlJxjbO4/+kKprbxIRfYNtnTw0CLlf80e3vAgBTbYd8RHoj6NboVA5hXHdZp0Em+bUiLPu2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ1FVgIZBVoTuDolSqCm/u+wGurjeArm99H4buP9cCk=;
 b=a6NV/3H1B/aGawAe6W7tynb9op6xFGN/cdsHQ0oXpKW/1qD0GkaZtMDqaOj6gPHYI0vIrCcJuR/okGG+5GvSkIHUTgYKjpKRhYn9MKD5cogqOhjXC++wUAaIlNwrrDQKAT6SHKgEnGT5xHOlSFZ3eOO3wxD+TaBfWhHYoUvmAQxvnJaqjVPvdwBvJS7FaL7xgjuX9le4XKnmnljbmPHQuO73UP/WjZUgNGawvEHT+lbpgSPnZsu4M5uK1UOcgGToyR+VL4iWNgE2I353iHWpmLnvUOBUJwTh3BSn+2HsP+YQefXHnZcMfx6AF8HXlf/ST33AWXoSX3LQR/5gZZ9atw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ1FVgIZBVoTuDolSqCm/u+wGurjeArm99H4buP9cCk=;
 b=Gw/QXOMRX9pbPJzVmjAEZtY48h/dXqqn5GZosP9drJYh03iO1NXkyPJ3R1ramMrNnJODSFL+K3rhcozSp33xI8xOHXeUywbfDtmZQ9yOzgpXhDT3tw8S2LJOvkVNyR10G7nLOqY6PD0f7bPPiLIQGteT3Y7HMYAGquo1d34N4ocAgWwTfVrKdj48z6C1xJT1gX+ml8Yl/eY3o9NpNm0T3GbAL4pmKEOcVo2E1r96Ibu6QZWWH4FM2DTd7JGXf4ySsjz9bU9zreDcSfPycwB1J9BR2BadFeU614Yj4XHvWlA6hNvipEnfyPECJNqu4JmgMC7yEcC0+qtkYhK5nL+cLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <24b08aaa-cc1b-bb86-b5f1-b16f1cdd2533@suse.com>
Date: Tue, 18 Jul 2023 11:14:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/8] mm/pdx: Add comments throughout the codebase for pdx
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-2-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230717160318.2113-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9502:EE_
X-MS-Office365-Filtering-Correlation-Id: 0acdb469-0abc-4a82-9264-08db876f580d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k4VKinUKATD8xG1m+Pdnakzw2BY7IR8aEij8GsUMszwfTCMfwbsUOOeXA53Plbqx5qh+YQ3Iy9oXRrtuSo5UN6oju9tdFGx+rkkHY+vmNJ/ysyOSMZSSYiuLZfNN9g+rmnAmfE9WtoirAV8hIQNcIZIapAwqIv3JR5vk4GqdjRwGpf0pvMhVuilh0lXKMlwt0osmVD44FG7+JEgcQXwregqR31O3uaYTpTBhB685RB+rXwPXpy6zKwtrOBxF800mEs2lz/kEgvi5mwworor4gCZDEFc0XCa4DqgI+HhnOskbb8XRXhp3LacjAUFld4YhT2xSrpu8CyLSjw/XJKhfpPpP+N0LttrDJME/jVXja2FG8Oa9hK7KFin6/L5PpQpfhKc1zqxEU4m9mPSqW2cfmelsT9RudDkBmiopK8EWAlmeIM8xyHKXb3pgxNx7t+ob8ZHzsqUX+dg7w/3BehIMvIUbFW/JlmT6N3EC3Yagizj3m51W8PAzZP/LziiaFtYNHV4b7TV2ATbwaAh1hOQkxID+k0icfOHE3Zz1vYxIrwCCsu7dLfzxteNRfV4rd1G5FXzUZfHrLKndjRcOioPx3BJV3QHqhQqBhSaspPXRURlhev7qr+Rrf7uUcbo9GxAdtycPBA03wWc00bAjM9Jz7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(54906003)(478600001)(6486002)(6506007)(186003)(26005)(53546011)(6512007)(2906002)(4744005)(316002)(66556008)(6916009)(41300700001)(4326008)(66946007)(8936002)(8676002)(5660300002)(38100700002)(66476007)(36756003)(86362001)(31696002)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlVFbkp4NXBtOFRtWm9EdGhJUlJYc3ZudWovTWdwajVzQ3BWN3ROZDlTQ05p?=
 =?utf-8?B?US83MXJYZkI1UDQ4OWJTanFZWWl5SzVUbmNSelJpZFZ1WWxzTG9uQWFjOFQ2?=
 =?utf-8?B?RDV3Vmp2Y2tKa3ZKQUxqVWp4T052TDRnUWRjR2hJcTZpNndqV1IwbFhpVjd3?=
 =?utf-8?B?S1BJTEl0Q1p4L28wL0Y4eVZ6VFFhanR2ZXRtdmNQSit5RTY1bmNKd3NLbTFx?=
 =?utf-8?B?MFpCN1RTOUhmWjB5eW1jOXZ4OEZOZFJJK0JrQXlwKzRLQjZHcjIrZlkxYk5j?=
 =?utf-8?B?SmtNeWhxczdXR1JUUnJaNm1HSlcvRWJxWXN5U3FHZkZtZmNqUWIvRENVbFJO?=
 =?utf-8?B?OEdPOFdQMkI4N0toSktxUnZLM1FSWERyZ3pnWktPY0cxSVVyTEhZYlNEMGdp?=
 =?utf-8?B?aGN3S0VoS0tweXhVbVU1c1NaUXVTV0NZdzZaY1N4UHNmeFNCYk1UVkFIajFI?=
 =?utf-8?B?aXY0TTFHNENaclhSL2ZwWGszRkdaaTlmemE3Tld3UGhTTzFFcFh6MWI2bXlG?=
 =?utf-8?B?YngwazgrbmRFNmtZRWFyVy85elNRT09OV3NOUFJ6Y2M2aExiSXdEbmVtM3la?=
 =?utf-8?B?eVpheUN2UHkyS3IrczVOL1l1YW1FM2xJbEhELzhzUjAvTGNMWlRVQUM1cDFh?=
 =?utf-8?B?amZXWjNxdVNidVhNenFNcWRkd3pRbFFaRG5WYzltTXVLdlBtYVhYbnFxNDlt?=
 =?utf-8?B?clRhYXRWcjB4R1hWSDBYVHUyNWNSVnJEREhSK2xvVVV5RThES2krSXczcTZV?=
 =?utf-8?B?dGlFQlNqN2M2d29xZjB5aGZob1ptdjR1d20ySWNuS2xFSEU0c0NPSnVYTG1R?=
 =?utf-8?B?MmZwZmV4RDFZOWlMOFdaN1R6dzVtTDloSC9ISS9lV3RPU0IwZWpGSGFkaGZk?=
 =?utf-8?B?Vmx3Nm53cERDempSck1ZczlQYVA4TUVlN01PNlRNVDN6YURCVWdJWU8wdGpG?=
 =?utf-8?B?YklscFJZQW0rN2RQQy8vL1psMURvL1FPYk52d2dXUTFoS0dRMllNTW5WNVlz?=
 =?utf-8?B?STJSS2JYbmdBUDgvdVlZNzRETmcxNzlGbU1wTXYvbnJvNVR5a2FGbXU0ZGR4?=
 =?utf-8?B?MEVUOEtJbXJINlA5NVd4L0RrTWRLMlRGdnFUYUJpa3l6RldTaEQvNFZYWXJl?=
 =?utf-8?B?d1YvVk1UM0VpOEtzMkhpeTRiTkdNTXp2NGkzZlhoTGsyNk5YR0JnR1Q5bTRu?=
 =?utf-8?B?NzBaNFFuMTQrM2lnNGNmYllDakFMSjA2cWI1c0kzSDQwVGxTVkdWZmZMYjhS?=
 =?utf-8?B?S2VjQXczM1JmbUNzTnVoZkRzaXd3ZWFvOSt0MXNjcTBiY3QrSDIyMS9keFQ2?=
 =?utf-8?B?Y1gybUFkc1NFR2cyNTRtVDlnd0RhMHZ1TmQrNENmY0dNcXNZUGR2SWtRUXY5?=
 =?utf-8?B?TE9vZVJuWllQOHJkSVZ6b0ZBQ3hZOW9uVzVLTlVOeWxNRGpKUzV2MzVHOTVp?=
 =?utf-8?B?djBCU0Y0aUZNZmpFeEpDRFVyNURUekVLSnNyNGg0WVhJbC8zY1VVNDVCM1py?=
 =?utf-8?B?ZjZwRXh3K2lEbFA4UW1nTVhRL0R3SkxoUEJTWVgrTzlYUWF1YUl2SnBZdkdl?=
 =?utf-8?B?UER0WmNVRTY0NndSSnU1c2RDcXlyQ20xM0RSeGNmWStnLytiRkEyYWVCM0li?=
 =?utf-8?B?ZFBHZWxVUEdFOXA3T2tkY3hmTEVsTE1PRWNKanQrSWdPR0RaZ2o2c0VNWVBn?=
 =?utf-8?B?K3FQczZwMlhnT2FaN3pOcVRoVjJHSzlPTTYwdWIzMFZ0M2FlUnZrNFNMVksy?=
 =?utf-8?B?RElGVGVONDBVWGFPWlRqZzI4NFNDR0VoYytraVVjUmdLR3ZiNVV0L2g5NXRk?=
 =?utf-8?B?UWxHSFVLMTBpUm5HMEp1aWZBZGQ4N0ZkMi9US0p2Z0xMU3ZpcUNKcklxTmxm?=
 =?utf-8?B?WkRLbmdqSkd4ZGhqSmxtckxCNDZWZkZ3MzkrUzEwUm9pZGFFSmwrRVZYSmJO?=
 =?utf-8?B?N3VEMzIvbjdXTHZnWmtIME45OFA3UENMMDhIQzFMbmRMeFlET1Z3UmNMN1Js?=
 =?utf-8?B?dTBUdzZlemRiMHF4ek5DalhXMTdJNUhRR29iMWtNalB2bXBCYzkrdnZpVkZa?=
 =?utf-8?B?M0V6WkxucE43MEduZkVJZHZDY0VvTnpmdTZJM0JObkhQMFBqMFNwYkxXaXhW?=
 =?utf-8?Q?IH58OGcqosh+QQbviRoJMrwKh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acdb469-0abc-4a82-9264-08db876f580d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:14:09.2418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnkql9qj9KRr3qDYjRguXx0KcUmTZmMCPiSmqT5RFAUz5BfhiUDOMrD6XVGKhiV5QDkgDB4PEyWkQoOkHuOnzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9502

On 17.07.2023 18:03, Alejandro Vallejo wrote:
> Document the behaviour of the pdx machinery in Xen. Some logic is fairly
> opaque and hard to follow without it being documented anywhere. This
> explains the rationale behind compression and its relationship to
> frametable indexing and directmap management.
> 
> While modifying the file:
>   * Convert u64 -> uint64_t
>   * Remove extern keyword from function prototypes
> 
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



