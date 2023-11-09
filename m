Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C205F7E6975
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 12:21:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629620.981947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r135a-00032n-7m; Thu, 09 Nov 2023 11:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629620.981947; Thu, 09 Nov 2023 11:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r135a-00030g-53; Thu, 09 Nov 2023 11:20:46 +0000
Received: by outflank-mailman (input) for mailman id 629620;
 Thu, 09 Nov 2023 11:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r135Y-00030a-Gf
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 11:20:44 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0464a640-7ef2-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 12:20:42 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9827.eurprd04.prod.outlook.com (2603:10a6:20b:652::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.17; Thu, 9 Nov
 2023 11:20:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 11:20:39 +0000
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
X-Inumbo-ID: 0464a640-7ef2-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtMfl6EueWqTtEVxeFOLAo2GYyZnq4n7foesKEMbqKhMc++nRXlDhEpwiPdpkjyb8eWoy9mFjcW+CQm9HMT+aZKSEWpTpMXYq5+bIQk23HqzsW+HEhzNRZvLWFtc2oBMDYK5fGXR8Edk0YHTbCMcql0TcvpFHrok3ELuKcTvSjJTrHXHcMycwexF2xMJz2sh1MW2TOatB98pHn5F6ubUJnxmEovgbJkcl+4fZLJ9VBjDBciMw/D4IcgkCSBoaLYP+TaY56S/fLSuKmB09y3EB7/iIoOwUuzi07Pt9Kg2Mv/3OWCHRWDVmRJtkrXVtg3fP52ETv6su3BayrVo59WWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h77RXAujVmTcrqZwwqasRz88IBJPqlQBeP7exxcrVVI=;
 b=aoOGkfdUiOcpTsTJZySJOOmRRIajVMtxAgUH7DBAUaIonysnbLf1G+O0usOqHkS+DFtcnlQe7CCY4BstB9rKQ57lLGZjdOinjf+4vOjP9epTTCSAiAH6wYLEkYSxMMUr0wgeT9Baz6UqpnG6VF5IjAsyVI0CrflQUnkPrPqQDYvlgwGLrotykT+d7EkwCNJsCqvC0xXKgb4uU15ENWSf0WsUZJz9lO+xau4bITJhe0ttv/QwoXfacCaV+AjuCn1VrcQVDkJN1suZaJQ17bOo0fnezTVrzm52U6qwHogNcvjQCDVe0Kk+B1K0B+nOeTI5GFKaHKMEIJLmF2mjAhicnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h77RXAujVmTcrqZwwqasRz88IBJPqlQBeP7exxcrVVI=;
 b=pFlKtBydKF6f7U110KbhnBtuSmYq/ZU3uLW2gAGQGrjozowYIYxfy0G1ChSxvao4KyaU3gh6qVqD7QlyNr7jYam9kzOxY9p/oZEOmK3X68bHixg/eCkJrCOGqH3teSlfRqtMtGuVXf6xAaDtgGOb+d1Db3boRCDQgju147peRo318n94fK6ZMfrCYw1alTVe7ygnIrdt/L+sZaJGxCXKsUmWeFLUUXaPCMjwlM83MiYO1kkoXVyD2/ap++G/aGZWpZyfiwod1XfJ2C9mqCPjXcaSm9jQOMdug7KGzsynXn6gHrCqKD80aNikIxRlxwnNpwAnKohubTP1ozqNXnEg3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd54161a-06ff-a154-c22f-60af7f84bd37@suse.com>
Date: Thu, 9 Nov 2023 12:20:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2] xen/arm: traps: address a violation of MISRA
 C:2012 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <24c2e8b7a7becc6b16d0b37f2c642a9b9e976269.1699457659.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24c2e8b7a7becc6b16d0b37f2c642a9b9e976269.1699457659.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf0a319-cb60-4640-fc81-08dbe115e71e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DinNSoXpk5piOjUCsakus1qdoAPr1AJjhi2kuLOtkm/oLdASnNyB4r64Km4vY1xLam2gld+ecEU6sRjdw98FLJJ5YPBMmgKgjLExiJepmcf9TxMjE4ACxz0Ua0u3/nRQkIIJBIbb8FO8tyScDuWtySnd0RsC2OtQThqldgA3vs705s1lUWnP0zz/bKsI6H/Gk7rybAm4cZyu0uhqUfQ7Yyei/28Z2cNOd65PIEqoq22DHyJ17Y72q3b2Z3v1KHHAh9Z6eUjl7ZSLRu2x+lFR7eSKHxFInZkeY2EbxWa9ZS3R5hIbCwVHelGnjhRILwtoWErCua3yxI/rNjPm2/aE3+rrd+K1utqhCIM9M8WaMZ5Bb+gj6qlM3+wwjsaWssOtzR/pOOOzxx0R6+erD3OUC9uIMOhAr8Nidurw1vMJQbMPq06zdgCJsrFMtbuBv5YjTdUhMYxkXdaTyha+xGr41Xad/5KHwEbh1MTG7Z1twhjKsG81fCL037qDrOxpElawNvzyOkqchXtJo0ZwVjRMv+VvK/7pds4shyVl0PDmlhSq/SkiuJH6MKQVjgXega2wIei+CYx/ok0yCwFc49EUDaQggOQ4gNlQyN3OYAhekThG5vAKBA18O4dXoAm5E4HdqgaJtNnAF6DC/wwljeBaAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(478600001)(31686004)(6486002)(53546011)(6506007)(6666004)(86362001)(31696002)(36756003)(38100700002)(2616005)(5660300002)(41300700001)(6916009)(54906003)(66556008)(66476007)(66946007)(26005)(6512007)(316002)(4326008)(2906002)(4744005)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkRVY2x6eTRzSEtZY0dLL0hFSUlLLzFpSS9ITU03WU9QQUVudzUxYVBUZEgz?=
 =?utf-8?B?Sk5Seno3UVQvK0tJcXNCb2FiM09lRHJkU3RGRmJxSmd0QW9vNlNnMm1IMWdu?=
 =?utf-8?B?anhabTNXdFZsVE5wejEvM3BYZ0xiSHJCbFBnYTFrZVNpMSswTFJ1WjRyNlE2?=
 =?utf-8?B?a1Y4SUc0TGp1TERwdmp5dExHUS9CdEtoaE94UmljUXdDdGYyakwvZFZqYnZR?=
 =?utf-8?B?bFZQN2VjVVBnaGsvZ3VBdDB5OG5EZnBMMlk2NFRRYkFoS3VGN2NUUkFPVUhY?=
 =?utf-8?B?M21nb2NYdHdlVzZKMUV4VFpWdEtlQ05QVTI2a2xTY0pIdW1Dek0ybnVCRnZZ?=
 =?utf-8?B?bUJkZ1BwbHEyTnhSWDk0cWFJV09ZbHBuTmV4RkNSWng0aFA5czZaeGxPTjRB?=
 =?utf-8?B?LzczQnpBa05kQ0xpYVZkRjFMcFk1UzZXbHI4Y25DZ09WNjV6RHgyMWZCaUFM?=
 =?utf-8?B?RU1oWFVNaWFoc3ZMd01iYTVOaEptMFUxNnlETjdMRzRJNzlpdTNna252V0tr?=
 =?utf-8?B?U1FNdGd1YndBWTZEam1OVEk5d2tza1R3ZHhyVDEzZkFIbHBGdjc2dnhabjRG?=
 =?utf-8?B?S2JpNEtmQ3VoQjlmaW05QnYxSFNyNXEyeHVkS2g4TjFJWnVta0FxTUhBV3dW?=
 =?utf-8?B?M2lUYXQ1U21LVC9YYjZlK05Gdys5bkUwTmVGbUI2dXNGZE5FaU1BUFRKYXZN?=
 =?utf-8?B?YzRTenp5SXdwajhYenFULzBETldwSHd0Zm9MenB5MjBVQjIyMEZFcEYxbklQ?=
 =?utf-8?B?MllnejFYTWR5WkxKWVVXeFdES1B6b01sVWFQb01hdU9Fak05ZU5kWWRYMXQv?=
 =?utf-8?B?UHI3dXhidnI2T0ZpallGcTA3UU1jQ0E5RllFQVhWZnYwSzRHOUcrZm5lSkRz?=
 =?utf-8?B?Qy9sTXpUWnI0U01IY1BieldNamV1ci91UlR5S29GcmNkWFpnUC9FN1BjcXVY?=
 =?utf-8?B?YWJBWGdHSVJqQUZoNG5VUnZienlpeXY5Q1RGTEZpZE9jMHRlTisxaWNlZjZk?=
 =?utf-8?B?cFhkNmI4T2FlZE1paVBxSllUTE1YTWc2OG55dVFIRW1WaWV6T0ZpOTAxeGJV?=
 =?utf-8?B?akgzRDNFLzd2ZkJHTTFQWC84NkN2U25yY2dPRzBjZ0tZRUk3RVNmL1ZrU2JO?=
 =?utf-8?B?dmtmaTl5VDN2azRwd09BeWQ4Ykl3cEpqUUwzWDFSbGNxZWZGRU4rMUhMYTN5?=
 =?utf-8?B?aGgzVDlKaHZCQTdiRytpOExUd2lVNlBFTENYZE9qQVBoOHdoWE83bDE3M1R4?=
 =?utf-8?B?QjEyUXFWTnhNSFFmSzlpMDVuSXFZcVZaTU9tY0d1UHd2bEtubUNGVDdnWmdU?=
 =?utf-8?B?cnRZRVNrZXZUaCtndmplUHowZGRIYk40dENncjNWSFA4QUlMeE02enBHeGxU?=
 =?utf-8?B?WWF0UVMzOVFHdklnSEtwUTlPZ01nVjFxbW90N29YdWRrREI3QW5HQVdNQTkr?=
 =?utf-8?B?Y0o3Vy9aRWpuTkxjaHluQVBGQW1DcFBoN1h5eUhZd21zMWN6aUpHZzVJNjlr?=
 =?utf-8?B?WkdZTWorWU11L3RyeEo4ZjhMWjNBZnZ0cm92TXRISmVhWmpqSXdUcytaRTZV?=
 =?utf-8?B?dVAwakJHZG5sTElYc0NuM3M5dmJBeVhlcW9rZUlFSXVVWUJlNTE1aHlvdzVI?=
 =?utf-8?B?c1VDUnVOdGlXdENrVlAyd2RoZ2NId1F2cjM4bFZ5VDJpcTRrS3UrUHAySHlm?=
 =?utf-8?B?VnpLaXVIZWJOT1BKWHhLY1pkYzc1SURiRk1tTk9Vbm9BekpUaGxBWW1nNFEw?=
 =?utf-8?B?cjI1ZDY0R09ETTVXb1FxR05iUHdsNlB1czN0a3E0eXZtR01rTmQ1WW03bE1w?=
 =?utf-8?B?UXh5RzFUUm5vOVQ0QVdHLzdsektHTFdJRWpWTTc0UXUyejJmQ29ZZExSNy9W?=
 =?utf-8?B?SkNWL0I5MERuRmtZWjhDbFprdTRiN0Z3M0UxTkZ3cnhlRjhuODkxdkRVbVdV?=
 =?utf-8?B?NWI3MUdWaTk3MGFjeCs1bWhOamJreUVqNTJlcno2aWJEcUt6Zm5qV2t6bFI3?=
 =?utf-8?B?cTF6TDl6amhrajR1U3FUTGtzS1FQcnZGbnpJTXZQcEVlR0dnMTRLVDdZTDZZ?=
 =?utf-8?B?WkxybzBWc0RrdXIvSUcybmRXRVVKd1RmRXNydzVsbEp2NlhPOFBpM0ZHY21O?=
 =?utf-8?Q?+S03Vk5hpK74koWYfLlIL0y0X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf0a319-cb60-4640-fc81-08dbe115e71e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 11:20:39.2423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7cms0PRha7g1FoiN9yZrF+ZPgyZoydqOgdIOsCbXA0lh52eX9HRu5RiOM6LpNkTik+Mvt9kc4nsXu23SU/GyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9827

On 08.11.2023 16:42, Federico Serafini wrote:
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1236,7 +1236,8 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
>  
>      if ( id == BUGFRAME_run_fn )
>      {
> -        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
> +        typedef void (*bug_fn_t)(const struct cpu_user_regs *regs);

Just to mention it: Type and name don't match here. You define a pointer-
to-function type, yet you name it as if it was a function type. Perhaps
the latter is really meant, such that ...

> +        bug_fn_t fn = (void *)regs->BUG_FN_REG;

... e.g. here the pointer-ness of the variable can still remain visible:

        bug_fn_t *fn = (void *)regs->BUG_FN_REG;

Jan

