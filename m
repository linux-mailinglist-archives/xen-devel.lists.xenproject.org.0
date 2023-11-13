Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105BC7EA175
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 17:45:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631834.985524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2a47-0005JV-Ij; Mon, 13 Nov 2023 16:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631834.985524; Mon, 13 Nov 2023 16:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2a47-0005Gm-G8; Mon, 13 Nov 2023 16:45:35 +0000
Received: by outflank-mailman (input) for mailman id 631834;
 Mon, 13 Nov 2023 16:45:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2a46-0005FR-0N
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 16:45:34 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f8cfc59-8244-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 17:45:32 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8715.eurprd04.prod.outlook.com (2603:10a6:20b:43e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 16:45:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 16:45:28 +0000
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
X-Inumbo-ID: 0f8cfc59-8244-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAjgyIPQl2BItv13K0HtYoC5QZeQdYOE5fKj03wRaGpSrR4u93lERPhUmeZWy48Gz0sw/ulMwRo0KTFacUJxutR/9LZSZL1cJmVkifd9CISd8AoHBjEYdYXJJh1ytZy/9aIdHSj0kE8VTOyEceeeOx5Lm17jEMU4Ba6XJ/K96Qv6sYUfFCu6sZNeUnH03kaFu7urxTgMjAAbdpvc/31uHnuCXsuM8U1nXNCebdNE0uDoNadSusJDJUhVggECOZSeMD9UihfdYiNwkbAp2xQi4e/ZcsrUvVIjip3RxCqFEiVipHum0Cf/GG/ByGpXwsqOh+soJ6clt0qJUhgpdNx3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuSV9SQB/WtJeWNAYJIzGWB8pg1rXuAwkkWM0cNDOIs=;
 b=cyLIiVIuOlDhHyfAAWdVxX0y5fWLPsnNQ7muaZKh5XCycDZViVpKQf4nk9Myv2OcjRVOFW6BLmQPfFx1Nk1pWVOWJzN+33nnrMZUktX5Envu1PzNqaaYRPnfOle3jCce3fLZaVFzfGJHAHrjpjODGhkRqk+WDgReP/x43W0zmwEgZgAVd9LABAz/fKY5J2TI4nbFhp2HEkHE3vea1YqUv2s+4/f1AC4dfdlglByx/4OnBaDhvKBMeUodmYmcm2g/IFZKxU/+XMO8A1QXB9KBZ+S1E6REjXczPJHT8lV+SsJlg8k8BAF669tZPsa+XpVtk5nmO/xCKHM/6X3lTCJYNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuSV9SQB/WtJeWNAYJIzGWB8pg1rXuAwkkWM0cNDOIs=;
 b=a3bS4/QYLBbQLB54JSJdzur7mhVlv6F8IrMedz1IHJ267anr49U7RkzfgytOOLUJGpE446uzVBRDENziZNs0BRqXOrDk0kPg6tFmQLEFzZxGGicsxzv8WlWyD6KRkb1EuE53GQagQVeKbbs5DwRwpc9bppST7Yl8hlFpEpev4bhmn/hcqBj3tctDXbV/IwYYV1JtMDJmw9wRIC1Bv8ESC/IyvdZPWZoLpRiMt0GufOfp6yc6TWMlVS1umt+imkdK8QPcsAGg7XO9TaUZxmqnVgjbT2OY66f/bupOY5RgFJ6trNEWThDn4qQqgEq337BWr1yuWzEfHS7aQsK4EvLZtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e7cd2613-7af9-bfae-fb75-85d3bc2f3caf@suse.com>
Date: Mon, 13 Nov 2023 17:45:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 04/15] xen/asm-generic: introduce generic hypercall.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <87a6f7a2135361ad231bfc0cfc2d73ca78c357a3.1699633310.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87a6f7a2135361ad231bfc0cfc2d73ca78c357a3.1699633310.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: d3da7869-5675-4a84-c5f7-08dbe467f112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dsbL5UK3jIgnd3BW+p8xHjdBTF730w1WMRKkqyGaJ43xIyaxcc5858+Bvvt2+thrB9CblGvvWlq5Lu5sPFNo9w5L6uCnP+9ztBsLjZe8xOTHcSVlfXyHl+jdhryvP1no4uSLeS7E6yexfeo3oHmULYqa3AG8kZDXF8c/Qttjj5ID/t+NrS1nvDvgrArRC6RH7+VOV47xBS/BC8PXJ023d+jJFL4ZIP0PbRPg/kMfNk0fMz+NYd5W1eIY7uXyRqTF+zs8M+Tx7a8bCU3CsZ6ILAvS8gK8h7HTpG2G+Xjmsrv2h5cDKOA7IwBId+0rwEkJdIIyLG/r11+8pq7ogrdw4RAEU42dGmgIlQjDyNDLhtyGRWjyqEFjpk0jpOW4SbcRTKxHBNGmp2D+aNIVlVPZtldK1+vMbAzfPvZdtzwwxebqKAuPYXMqw4E8vym90ar9A7RMjNCeix5nc3GD3GRdOABHw+5IK/d7nb/JwXQx0vgCCDpHi99eDjH1bgmmYSnfOxlYBRDDO1HArFMj4WH6SdpOP26OO8BQZCe9ghHjBnHW1nd8VO3iISedixIzi9GcAFmmCowcVAgIHXCYiawW6TNxgiCl6erhEGnZbmTNAwWe0r5mmbakB5MSdC7IjqbKzTIU7deW9pr8vi5/02PexaApUyRtQwTTTxuFwblx3YU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(2616005)(86362001)(4744005)(2906002)(31696002)(5660300002)(41300700001)(36756003)(4326008)(8936002)(8676002)(26005)(6486002)(6512007)(316002)(6916009)(6506007)(66946007)(38100700002)(66476007)(66556008)(53546011)(478600001)(54906003)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cytzeGJrSEJsOThCY1ExT1dVei9TWGUzN0tudmM2dG1Kd2M2elRWd2l5WDNs?=
 =?utf-8?B?Q1NoaE93NndLR3BXcm5MWmw0Z1RqZnpaR3c3SHYyV1RzTiszT0F1RzI5eTlW?=
 =?utf-8?B?OUc4MFQwWm5ZUEdPN3llWmFYREg0Y1kwU3JKTVAxTlgxbDJIN0pscENwYnNz?=
 =?utf-8?B?WktERGZXVDZuZVZGNEE1dFdHTXpOTldwZnlBOXYwYWIxUW9nY283MWtkUmpn?=
 =?utf-8?B?MEN5RXExYm9oZEV5bjZlS0R6YWN1dTEwSE90M2txaXAzazhOVXdGWEpxbWxu?=
 =?utf-8?B?ZmtNdFFxT0Rad09PcS9nM3JSQjBKRGtSVU5TV1EraUVpaVJLUUpyc3A0a1Z5?=
 =?utf-8?B?eDJKWWpNUDRORlBoblNqd09nL1lIUGhBb0dGNVVWQ3JFbTZZQVpvZDlIWjI0?=
 =?utf-8?B?ekdpMUZ5TFFsYzk3RjZiSEtBcVBFUTRyQ29MNUp1cnpnWmgybmplbjQyS3NZ?=
 =?utf-8?B?cTBRbWcvOGNCNURHTXhxQitZczk3aStmaVZZNVpUNnZnZHJrNzY0UnBQSk1C?=
 =?utf-8?B?R2pUSUNMTUVzMDNMa2xhbHhYckE5Q3k2a1d6S0dLUzBZeTJWZWFwNmZlUlJP?=
 =?utf-8?B?VENrN2VOWnozaHd0ckVRclNnTytBdmdUVTJpY2wzV05nR1kveDVueGcvSG1S?=
 =?utf-8?B?VlRhaG9YUk9mSzIrT3hJY0hpemJPc01lUFJkWFhrc3dOaURHais2d1pOTFZa?=
 =?utf-8?B?OExXN29ZT010dk9DUGp4c2lHbWg1ekdpMXlYdDJuWjlkOFJQWEFETkkzL29V?=
 =?utf-8?B?MU10WTFvYndMRFdkRjcycy9mY1NzUlQzcWdMbXhCVjRzNk40MlpvZ3BXTWQ1?=
 =?utf-8?B?MDhtY1g1bXpOUTd2aDFxTlcwRytKM0g4bTFXZHlzMHlmcjVOSlhGSDFiUDd3?=
 =?utf-8?B?S3FQLzgrNndyTDdXK2RxQWV5ZDRWd1N3WjV6dndyaFZyWUg5UVpKL0RIQVk3?=
 =?utf-8?B?ZVJSL3l4QjRFRnlCVDNpQ0plS2NYZW5IbWlBbkR0VnZVYVYyRStSbE1oQ1FF?=
 =?utf-8?B?cGo2WWxoVlcvQkx4QkxIVmxRZ2ZMaUFucmlLM00yUW5QZ1NvMzlBaFBhZjJ4?=
 =?utf-8?B?OWcwTWpaN1EwZllmTjhCNlpBTDFVc3BkZXYvNExGbFRYQUQweTYzZ1V4c21S?=
 =?utf-8?B?OUV3eFI5SGJkQVdqeGp5dVE3REJmc0xlQnNLZ3k3ZGVYR2NpTnBrSExqVEdp?=
 =?utf-8?B?SjJBVWNqWm5Zb1I0N2dzQzA2c25OVHFjTVNiaWpJaWRLSWg1YlhFd0xlOHhX?=
 =?utf-8?B?a2dGMTRERFJYTXdxMWdhNEV2U2NoZVM4UnlpbXBBZUFhSVBMZUtaUDZmMEFX?=
 =?utf-8?B?QjZPdytaZEI5Q2JYNnNCYzVOVHRlUzA2cmEwaWdUQTdBdHh2bk91UDI0Q0tB?=
 =?utf-8?B?VngrNkxsRzhRYjhxSFdNWmgrSzBmS2VEb3JLa3M3VjdEWDJRR2gvT21MZFdX?=
 =?utf-8?B?VXUvSUovOVlrS2JWVDZQUDVLZzZIblNpeGdsVzlqWE5TOXl0MWZJYWF6YzVu?=
 =?utf-8?B?MkFVRkhBMk5xZDNQZW1lcGNJNE9ZVWRQNCtPQzRtM1hhYzBvWTFKTjQ1cmNs?=
 =?utf-8?B?R1Y2SExHNWdrem5jZ21tUytlSlZCV3lORmdLSjZvdEE0RkJ4enFza040M0ZG?=
 =?utf-8?B?aW5rNWRCbU1DamRyUEJ2WGtjVXJ5eTE0TkVLQm9zVlJZMjI4ZWtsTUxXWDl3?=
 =?utf-8?B?TWI1bUJPU2RYYk1KV1JZWmhoVW1PejF6Y2JlVGpEYjB0SERxTE9ManVGYWwy?=
 =?utf-8?B?UGc0UitLZlo2ZytmeUVRSHRIRktmQkoybUIvRmdiNGxLRlVnTWtUOFNGK0Nt?=
 =?utf-8?B?Yyt4dWFJV0tDVjZaZnNycjF2aHplODRmODFlVzI5eW03bVFTcE9vQVJDMEo3?=
 =?utf-8?B?bWNWRmxWZ3JXdE1BVFVUWlVjRUh3TXN0dlI1ZDVVdU96bWNBQm1RTmV4WS9N?=
 =?utf-8?B?VkZpZThwUDdURnh1ZjQwcUMrRHVRNU5xbEtnblhlU2dGMzdhUW1Ld0pxYlB1?=
 =?utf-8?B?alB0T2hjSHUrd1hyWWVYaEtMbk1EZjRUWWpVQnIvWmttWEthZ0QvNndLdHFx?=
 =?utf-8?B?RWNsMWVFVVRvQmtHNktyRFR5cktBaXJOcEJITm5aRnowZnJhdGIzRDJqT0Fs?=
 =?utf-8?Q?yF0rdWxIQ2sNXsPE67S7qBU7m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3da7869-5675-4a84-c5f7-08dbe467f112
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 16:45:28.1726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZmHHKT4fNUFbnCTYu84cXOEprxS7NPe25C8pzUqdjoqMDH19NjTynvc8m9XvNxpniJPM3Jenml8xwWbhE0i0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8715

On 10.11.2023 17:30, Oleksii Kurochko wrote:
> Introduce an empty generic hypercall.h for archs which don't
> implement it.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Since - judging from Arm's present header - it looks technically possible
for an arch to get away with this:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

