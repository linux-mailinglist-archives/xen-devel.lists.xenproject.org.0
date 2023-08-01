Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B53B76B624
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 15:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574216.899464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpgm-0007hh-BC; Tue, 01 Aug 2023 13:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574216.899464; Tue, 01 Aug 2023 13:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpgm-0007fA-80; Tue, 01 Aug 2023 13:45:28 +0000
Received: by outflank-mailman (input) for mailman id 574216;
 Tue, 01 Aug 2023 13:45:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQpgk-0007ez-Qr
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 13:45:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa381060-3071-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 15:45:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8175.eurprd04.prod.outlook.com (2603:10a6:102:1bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 13:45:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 13:45:22 +0000
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
X-Inumbo-ID: aa381060-3071-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DW1zceUW/l+lBh25JXeyA4sQO/DzHP9WnDq8V4lFBbY7s81cyEGoLkUt7EeEMk9U9REhW3BFTIEtYgZTBEjDnUpJEiAh3/CeHUsEYeH+1sMHVSCFHB7lplnOfAoZqAVbb24SfJECa17eQwquBONSi50cKJK0s9GYo3oCqkP0KoYY/e2kE5JZ4zU9cTTQr+T5JJWKyEiUTFMFjP31POhzasJ49Pw9Ckams/P2FRuu5SXuF/ArXNi4++XUzsYyM7DxSdE6hj9IGG9Wo7QWaAt9TEoouZHKXH0xxlvJmQ1/MLsJW1ZJbFtPS29HNTkOCSSo7WMvViNHfJvc3+z+06qglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RF5UILdxX3+rsRR/QOoKs/cOA02ZmELD24IGI/l96TE=;
 b=k3rXhs4nuU9+NrDHe3fVbXkH7Mi+dUlusIoeUfXrfEwE6h3qPTa/MNDcWxRRYjxhKR+vNWIDBssC+G6BWWws+hKwyjtTUKWMLvqpV/my89tyzfd5sU9NiT+AMJqOesjgLjeQzdVkG1pVXkhbPHhfcLpTXSN0mH7SwIqQ85xKZprU/Xaw6h6iQUf+t6b4Drks2eYjLe85VKyzV1yhtd4Hu0A9k6i4rb3RbusxHpNuFXWggm4KXa+DY/fsGxZY4PbK+eYy8habiXp0mOgLtd3pBDKmSe4NPPueZ6E6isF8oiCuAtoBn5Tl/lN2ejhR22yzF1m+UuI0xY8wCULc1P6Vsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RF5UILdxX3+rsRR/QOoKs/cOA02ZmELD24IGI/l96TE=;
 b=YdOpcSD7qoK3tgbpcTohxrYMSXOiyXPkGq6nIVics+nxa2cWo5gu6LsAo0KbcfioFruEQYndCl+mFS4gYnYSTEtNv7iMwTc8+vPVrsZncqmscZ9Hh+z6oUDBbUUEcOTeV4T9XdX8BwCsEgfqaR6ihAoZBkPclqx9f94IHbqb+08nALTM5EIHA3RKf3R13pGeH7mWK/0rL2aGzxWUBsbIZo7itXzqEmJb0Q/AB48bLQB2pNxezk8tMJbT8nMM3hA+Goss+/HDZNGBXmSRrnyyw/AuAx1oa72/nVqOcwaIptP6RF8SHFwhhZHO1uN3HfN0P0OP+jk+ZX5AMUiyoLrQaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad19f1c8-6d64-cee0-313c-62f78fe5b22e@suse.com>
Date: Tue, 1 Aug 2023 15:45:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH] xen/lib: address violations of MISRA C:2012 Rules 8.2
 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <18adbd526ec48a83ace2d9049671d3abd2f9c45b.1690873427.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <18adbd526ec48a83ace2d9049671d3abd2f9c45b.1690873427.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 83bb88ef-ce61-47de-abf8-08db92958d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ieuZ0A1Zto9bUqVMz/H3ltVo8YRYN5xCXl7traiPY5oROUAQS/JF8JYUCeTXAhwjjCwHkDS/bDzAS81dwmQkG+hTkP0Z5rhvWPwunG8FI8dX9XtVkFZes5nnTAKAcUX2foducCTXtL8UHc9Ib8ZFYk6EfwV5gNOqTLdpeDtc/DZJeyoqWDB8SAnPACRdBWbUoGgSZg6eYHypBIGUFZGFkC04p69401GDDS7aDXYLAVIm0fEp+KJaW0uyF55LGtQngDWeBsh7JCXI6dUF4v9HxwmiDs/cwIjGfoDxzyhH9/NyW1/qqo1IXJxcJTJt+IxEvj1SdhaImrFIco5ZUshpiraIAV9pxvuud7mqp0OiqrJFAY9YhRkwMIplMEF7A+UeBM4nHFbhmRpbOjhilF3n13byI30dqtXf7TyJ3zuhOQ5YS/C/jVjoaXIk+LaMOMkiCnLvJcDZACfQ2a/JS1L7Cr1OyKUe8HVgRPc6+kOFMVrLZ3+0reis6G7oDQx0F4Ze5akByRviRAn2l+GGRcEHu86SgUW2xOmwR/f3y2bfay38XImFoQMCv3zQRWPfKVe1OlhYHHakx8KP66CVcNFCId3mzgWpJRElwixgvwP8oICiuN7YDLImVLB050V5C84rCxRYSJinQ1dumsJod7LKJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(6916009)(4326008)(2616005)(2906002)(4744005)(86362001)(186003)(316002)(31696002)(38100700002)(31686004)(41300700001)(478600001)(6512007)(54906003)(5660300002)(66556008)(66946007)(66476007)(53546011)(6506007)(26005)(8676002)(8936002)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2c4NGlQekoxUzdrQjc0dUVZcklDdkNkQ0hJeUN5UUlOWWFrRG9wUHErd3pw?=
 =?utf-8?B?SmlzeXRJTFJTZnpyTDNoYW5Qc2JwMGI0NWJicUVveW5idUdwWWdQeStFOVAy?=
 =?utf-8?B?dXpTSWFpQVhSWlRnNWxIKzVpazAwUGNMcDdlR0psMEdxcUx5OGtaZ0NaRHRt?=
 =?utf-8?B?akgzN1A1NzArZDJ6UnlqL0NnVXQ3cUhGRlFnbXZPekZ3bnFCT0hnUFJCRDZz?=
 =?utf-8?B?NDJNVS9mZUhnYjNsWDNkTmd2MDJESElUcDFFR3IrWjFTZ1c4Ynp6dVZvMnhj?=
 =?utf-8?B?WS9mbVE2Z3NqZG1YMTNuaGo3UFB3akk0VGVWeU1VOHhSV2tva01icE9ITk5N?=
 =?utf-8?B?UmhkOGU5d3J1UHpDUXhtWTU0OWt5NHFxV0dJd1kxTmdMYmluR21kZXMxZkkr?=
 =?utf-8?B?QVpIZjh2bEhOMzlXN3pjdjhGTmU4SjA4OWFqaVVyRHRlcVV5KzlUZTNEWEM3?=
 =?utf-8?B?SExkeXhpR1h1dmEwN29sVTBUUEY2TVBneHJncXRTOFNFKzgyemV3cmRaSy8r?=
 =?utf-8?B?NmlISDAzOC9ySUF6Z2Q4UTdPZDJKNk9OOGkrL1FlamtpSDZuRkpwbGpVdHNB?=
 =?utf-8?B?MFUybks4aW56TjJ6TWNPbHNZTzZZdkhpWDd2VXF4M1I4bExQd3JLNERRdjdV?=
 =?utf-8?B?Mm5RRTJDTmQyanhsT2Nkcmt5anRHYjYvVlhXallHU21CYTd5dWZpWG1JdDRG?=
 =?utf-8?B?ZUI4N3dtKzgreUt4ME14K0diMFpCQ1ZyTUxsQnZMenZjV3hPaVY1bTVMU3p6?=
 =?utf-8?B?cUVHbi9JSEJnYWd3MzR2MmowandpREhLeXhWQnBjZitDRU1yWXdtSCt4U0kz?=
 =?utf-8?B?aXU2Q2E5b0J5ZzhqOTlkeVlaN2E3dTNwWEcvRnJsUzRkeXIxNzFPbXN5c0xR?=
 =?utf-8?B?SlR0SGtjcWJUTDZJbnBvaEluUmVhR0dEVlM1b0ttbDRWYmdDTFp6LzByM0lv?=
 =?utf-8?B?L1drRXBEUHVGVW5vYkordjZCbmtxb014dTZnU0tjNHdOeGVpK3c0bEQrT3ZQ?=
 =?utf-8?B?enRjWVdxZHJWMnNjT01tSTJ0eDJzZlA2TTBTL0FtbXduS1NHR1ltWGw1N1Rk?=
 =?utf-8?B?QmJxaE4yZVF0OTY0QTVnYzBYbzUvNjQ0THQxS25UbS9HODM1cDJLZzVrNngw?=
 =?utf-8?B?TWZaN0ZORXo4MW5JT3JvN0JYMFU0SDNTaG1Bd1VvVzhiNXc2WUJmV29oWGNG?=
 =?utf-8?B?czl6aW5ubVBDWVowQUZTVzdXcTBFcU96QUI0OTNQS2YvZy9xWjBRVWI2dnAx?=
 =?utf-8?B?NUZhSGxWd3hmWXVFT0h1enBJUDN3Wk00T01rSjkrUzZHY1I2Mk44YmR1Znll?=
 =?utf-8?B?K1ppZ0Uxa2xnSE5hTG5tUVdET3VOKzRFMU5xc3ZrWE1aSTNhS1pqSmpSeGhT?=
 =?utf-8?B?MitHZitVajlUenBJT0VZazhFQXJ2TVNNTSsrWm5lTDNUMzkvS3J3THUxbkNp?=
 =?utf-8?B?YU40RTFjQ2wwUThPQ0tYNmNJclZobVkrbStXNDJUWVZzcjhlamZQU0ZyL0N5?=
 =?utf-8?B?VThxYlZNa3h5MmUyNld2QTkrY3RoS1pOT096NVg0TjlEVFlNSi9wSHFHWHRO?=
 =?utf-8?B?SkRMUXRXVTVuTERqcGNwZEEvRjJHMkhaTTNQWlN2azZ5TkJVbm93QTh1dk5W?=
 =?utf-8?B?eDVnR2U5RUlNNk9TQ280NFdnOUc5cUJJaTV6OWhzUlh2ZVBGcC9NOGpacVpo?=
 =?utf-8?B?Y1hlZUNWK2dkdDIyTkhWUm45aHdoZVhxMVNueDZZK2YyMGVXbzN3UGtCOFBj?=
 =?utf-8?B?d3ZhYS9xVDZvVFdPeFBabE5MMm1HY3hjTHhUM1o5eVhQMmRBbjRZOFpIb1Y2?=
 =?utf-8?B?NkdBT0RsdzJKUVUxdFdxbTUrVGgramMyeit3RDkvUjBIRW1SMXhuazBnT0p5?=
 =?utf-8?B?cTQ3OWRPQVdac1ZzYUNsZEt6V3kxbnB6c0JEUkNzWmZEL3NVa1VleW9VWG1T?=
 =?utf-8?B?aHJlOWdHN3FzRERGbVRiV0JiZW5IUTdsb2NISnNkeXlPSGtxdU1pdGprZTFS?=
 =?utf-8?B?TnBWQks4SnJaRHAvY1htWFdBbEFjbVFQd0FGUnA1MjUwYld2Q01rc0pjMGg4?=
 =?utf-8?B?SHlJdHo1c0VQK3h4eVJEK2pwUDc4TjZGNkpyU2ZDV1BDWGpmSUlYeGs0Q1Ni?=
 =?utf-8?Q?M5GDv55BbBAgSa5n8eEmZHZAM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bb88ef-ce61-47de-abf8-08db92958d89
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 13:45:22.6796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FrajwvgNx3BhXU/c7tTOvS+L0fCKzopUks+3j2aPx8h8nvYMnyY2FwfP1o1ohaaYuJyXXsU96UJlkyxbfWidQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8175

On 01.08.2023 09:05, Federico Serafini wrote:
> Give a name to unnamed parameters thus addressing violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names and types used in function
> declarations and the ones used in the corresponding function
> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> ("All declarations of an object or function shall use the same names
> and type qualifiers").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



