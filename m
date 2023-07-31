Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F6B769351
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 12:43:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572891.896990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQNB-00046z-4m; Mon, 31 Jul 2023 10:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572891.896990; Mon, 31 Jul 2023 10:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQNB-00044t-24; Mon, 31 Jul 2023 10:43:33 +0000
Received: by outflank-mailman (input) for mailman id 572891;
 Mon, 31 Jul 2023 10:43:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQQNA-000446-8p
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 10:43:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7d00::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 173b2516-2f8f-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 12:43:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8758.eurprd04.prod.outlook.com (2603:10a6:10:2e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 10:43:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 10:43:28 +0000
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
X-Inumbo-ID: 173b2516-2f8f-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzcQgBB7fjQhcquR5Pn8eyOnpSwSbzKc9baOMyFMD7rPGWF0WLzRksFJ4AzJwmbWtbtWcxGI58oy08hnueeDp73ukZQBRwo0QdJ0pXxuCjV33s9YsAl+mBCGwJuUivapnF7nQ5r8OFs6eecd/GEc0AShMsM4OBwineI/eiqFOoY+wrH8GRuusv+4BryRBRliSM/7Q59CaqcYQSBwOeIGsC7h33jr6UBHeoHDYUD7lCIl4cilh+4Gm/GCuCsCqySStoge0J8pLXSrNEMBesz2FXFr10JU4fe29AAxJT4QC7hpUNPTm+H889QeQzScDV3KaH4cZ/p8w05Q9ZZ0pw6Z4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIq5/QpSKmiKYh8iwioBUkNa7kq8jFvz7oASsacbaeg=;
 b=it8G3/+7M6yKyFp1U/geLxFP8kLgIGzKzTKmdJuT2g4p5ASAIfCseoaVKl2eWGhPtLEnLvgtevWwoyeW/bWYRBY7z9V64zlvSvlzLC0Da43xapmtlyNLLvjNC3E14Gio8Ur9WYPYCHqC2/Q864QvwSpLfuHQbBnS8niJwGyTh1hRHrPGt7zhCUkPPEbPN/eJhj8V88vUqu7tHvdfcd2OM+gXW2tj31zX7dXn0fbNQGYt+5gReXWorzlTaHTES+SPkdpcSU7r+4inWagEA+tEXkajICW9jlJGUyswjjhQf4necXhDE1xuCHNJ7VSMW/RcvFm5RctpgNOWScO8dHbDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIq5/QpSKmiKYh8iwioBUkNa7kq8jFvz7oASsacbaeg=;
 b=YYNWkVAc1AMZa4P7z7UShwFvkJz3lXbEwcx2OP9yjPgs5exIuOCjxmWXU7FRTyLhxdQ61bv8LnwisVzQCz5KLvEHmEsWiWg7/wGOLQEGLhE8tAtRPOiWO09s05AJ2/sndjRC3bUxLJWFoBOXLbWSR5rf86yJz/pslIMisXlm9IDCZYFYrJcDRK1b/29fiOA9qAgDyePAb+CTcP2cg0ZwxfjV6C0P0COTvrNsxWB3qSq12ktjL7Xwlb5W6WoXPD+zZT/MVsl5skVfqRnVqPf2r15qDmkQFQ116Yk2HjL4PZjWGpRQozA5lpQH4GnNignbsPn+YOmrUMHK3EKc3rTV3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <51611f7a-3090-fa3d-3111-49bc9cd14ff5@suse.com>
Date: Mon, 31 Jul 2023 12:43:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH] EFI: address violations of MISRA C:2012 Rules 8.2 and
 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <83d4091852797044209272dab750f13f7d30d35c.1690792406.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <83d4091852797044209272dab750f13f7d30d35c.1690792406.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: c66223a4-1be1-410f-669b-08db91b2f9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iTLb+IIHgBdy9XopOMi+hzgtroZ/+1Fwzwx4JQjcT9Tlq5ljyVzdgbQ1fS5cCj90Taw2JAMLD58J5fczR/9imSvetq2+0NQsOLCJXhYQ8XYmFQ2DA8rIEVdwBKT+7N6FbZoPdArwi72J4i+vXl6qB10MjwgNAjua765mt6VFPrTOo2fd9526GGUBrqDLjX3f3y/aarAC+kURjj0i6Yt2KRzfcl3xEyBvKAJU9Zylmyu3q52MI5Imz07X8CYMjasOt51Td9HJLYYIZCWrgXbOllwBUYO6L+fSvB114PhjyTiQsHJ1taIGFMw2lxy6Drl1QT6fPTwZnyrYt3jZYiDYBYbKhwP9Tr8dG8LK7n9cXNyULSWmzzJWGpVrnBLyJr8XcidsOWvzToU23DVXi8oYdc044sACCB8CpXYAOqpkSqsALZRnefzlaCJQDfp0bvivV9jqh/bWMzIMuBVXJPORpYVtkEE6zo9GbYh4uY2/otrUY/vkXhX1jycX3iNGhgitNISwuq8EdowBRhXP/Bgv7T1uD0e+0ao5JIQpYYeH0w9eVoH/xjFbjo8qlLSwiF8EgBJ/Vcr2f2iVTWfLlpMJBqsMHhxfX6wP5WWnl2iZgMR+CRs8ED5+isY98fjOa/39XkGs52Au94afR/PqZGUwvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39850400004)(396003)(136003)(346002)(366004)(451199021)(66476007)(86362001)(31696002)(41300700001)(31686004)(8676002)(8936002)(316002)(6916009)(5660300002)(4326008)(66946007)(66556008)(54906003)(478600001)(4744005)(2906002)(38100700002)(36756003)(6512007)(6486002)(6506007)(26005)(186003)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFBoaFhRano2bzEzNHMvY29RSTBLS2Q5WkpWMnZrekQ0NTZjd2Z2N1lLVE1s?=
 =?utf-8?B?a1RLM2VVdHZLeTVVK3NWbzRnK3UyOVBPMVJtTXl2SnZrTnFzV3l5anlwR1ZV?=
 =?utf-8?B?OGhRVDRSRUgwRzhlZEpiNEthK1d4RGVKZEg0YmgvUGpLVlEzY3lIT0VsSnVK?=
 =?utf-8?B?ckMxc2t1SlVlMHVxZThmWmFhSXoySkVURzFiczBrdHlPTHNKUytBQ1JIb255?=
 =?utf-8?B?MnRhQ21YODlMNEZqbjZwT2lOcG53ZUpYczRPZHAwYkxHeUlrOUxHOUNnRlcy?=
 =?utf-8?B?YUFHM3hxWGhkdnJGcjBiYmRvcjhRdCtPT2ZjbDZuSVhTeUFEMXphcHBsOW5n?=
 =?utf-8?B?clVQTVNPZzZzWHlXSFQ2QUVzWkdHMUk0OVFEcWUxNmR0eVRNdFJCUzJkcCt2?=
 =?utf-8?B?YmNTS0prUGNVLzhFREtCZVBmNTJndHluWFhzRS9VVDg4RzRLbjRUUGE3WVl3?=
 =?utf-8?B?RmVoRHZINzVUc2lwUlFudVg5bWN4cTIzdytIaGlxcGkvKzd6VkJ6OXhrejhM?=
 =?utf-8?B?NlR6T3VkaVhrUVBVZXVicUcxL2RzYTFtTHVFQ0NnYXpyeXJxT0ZKRnRZbmlL?=
 =?utf-8?B?bWVld2FvS0k0RFFKS1lxSGhkU1ZUUGFCOVlQSDFCZzlJUlVHMGh6RE9Ccmwv?=
 =?utf-8?B?WTI2dXpHOUcwZGdEajBtY0gxM3c3WmlmY2RwbFJIbk0vd3E3c3cwaXpTeWhi?=
 =?utf-8?B?aVFlc3RiK2JNbEhKNVloQlNYN3pIVUdMUEZHUjlTcjk2VnRISUI1a0xkZHdN?=
 =?utf-8?B?ZWtnSERkNUQ5UWpMeUdFd01VTHliLzZNT2pqT0xSZkZBNVptZEhSNEdaMXhs?=
 =?utf-8?B?MmlhNU9pNU1zRkJPckhtV0U4MDFtUEMvTUJJZGxvZEdGRkNoQTJTTjViVmdi?=
 =?utf-8?B?Z2NTUEg0TXVEdS9ZSGFCSTVuUFA1b0t2OEh4VWRyNUtISXl3K0dxUjVXQXFy?=
 =?utf-8?B?QWdTN1J4MXhDZHZJZFlURWNIbFdXWm44dEFvRXpYM0NocG5OZFdnallQbkdJ?=
 =?utf-8?B?MU5VNVErTnVkd3VTTHBiL01kdS92QWhjRGRYSU5VVE9ydEpoYkY0bFhIZTRC?=
 =?utf-8?B?RVMyM0FOdG1WVEwxYWtIdWxCMEppZzhhV1hhUUVZVmNjQ3JpL2FxS24za1hS?=
 =?utf-8?B?ekRBVUx0YWcxSGszQWV5S2dSSk1PZXk1UGs4UVpXU1RPRDMwZXBaM290dGEz?=
 =?utf-8?B?K2h6a1pjcVNvcllxRnZHUGpRTWRpSkVPalBWV0J2a0NpQXdlMjBDVGUrdDJa?=
 =?utf-8?B?WEt2emQzQ0NxREI2YlFTSExnaVZJZUNsYUtkMlYvRTYyRnhGa1Yzc09OZGxh?=
 =?utf-8?B?UnVpNWNKTTdpa1RjSEQwLzFyRlplN1FySC9vU3djc0JOQzhMaGhjVHMrTVhZ?=
 =?utf-8?B?ZHV5ZnVhTFpoRmdoUFBWN3VuWWVPenJJcmlNZkZ0eVIwSnNTRWFMNHZ6K05C?=
 =?utf-8?B?QXlyYXJKblZaVUZoMFY3bVMwZ3JiVS9KVS8vL0hjL2RqMGF2cDdkNDlwUHY3?=
 =?utf-8?B?am1JU04zeEx1aWdoU2F6OWVtOWFDWUhOQ1J5NDk2UE1lMmNQc0dsMkRmUEpp?=
 =?utf-8?B?SmNYVXRSNGlzODNLUWF2czRhSXc2TG5GNnpZQnVsdzBPcityOExUTDY2WExH?=
 =?utf-8?B?ZDNSOWxEVDFvZUN4WU52dWhFZmU4Wk1KYmRadHBMTUFiYWJONk5Wd0RNR1gw?=
 =?utf-8?B?NjkyZzZ3NkdUdW11TEN4dVZSbXN4WmhCcnJQVTRZdUEvRVZZQy85NHFXb3N1?=
 =?utf-8?B?OUhGTnBEU3B5ekE0QmJZaW1uTlQ0MGZTRTl6YUVqWE4yQVU1dzdXUGJudXds?=
 =?utf-8?B?SmQvb2t5d0NpbU5SalFGK3M2cGJNMjFNZTY5MzVDZUxmMzBvWTVCUHc0eGN3?=
 =?utf-8?B?MlliVW1FOW1jV3FhaHB0Sk5QYXVyaG9razBjQjFHc0JibksvNjRacGdUNjBv?=
 =?utf-8?B?V1UyTEFEM0xQOU5iR1lFMXcwblB6UkNRakhWUHV0elJkVzYvTy9zSjBTaU5j?=
 =?utf-8?B?dUhvR0pEc1VqN1h4alRjVXBkMlNoRHU2emFHNFMwVW1sckd2VWhLMk5aVTFF?=
 =?utf-8?B?NGw0ZVlpZXo3WWJCa2dLMUhSWEMrQ1RNNXVmaTY0U1F5aVAvOXU3ZCs4MEdQ?=
 =?utf-8?Q?Dq1rUj5zbQ/hTdAKbINUz0Dt3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c66223a4-1be1-410f-669b-08db91b2f9e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 10:43:28.7395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GL7b9pLi0EUmQydj6mdq4ltdXSXxhGbEJ1d+gtrfJvTyl0+949b4NBlRKi3aEYFmCPBe7/NLGvrlrl+644hzBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8758

On 31.07.2023 10:35, Federico Serafini wrote:
> Give a name to unnamed parameters to address violations of
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



