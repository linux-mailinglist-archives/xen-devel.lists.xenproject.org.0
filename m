Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAC778D399
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 09:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592707.925505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbFea-00064z-9b; Wed, 30 Aug 2023 07:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592707.925505; Wed, 30 Aug 2023 07:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbFea-00061O-6c; Wed, 30 Aug 2023 07:30:16 +0000
Received: by outflank-mailman (input) for mailman id 592707;
 Wed, 30 Aug 2023 07:30:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbFeZ-00060z-6E
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 07:30:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e7e6b16-4707-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 09:30:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9226.eurprd04.prod.outlook.com (2603:10a6:10:351::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 07:30:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 07:30:11 +0000
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
X-Inumbo-ID: 0e7e6b16-4707-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LumEtST/DJYJFCI87vQcgC959bvjZOZLjPmbA0hVhhZuCIM9aAp5vOJsAjUa750T9N8sut8CIknjz6apXCbjSTP0VygQbsZIBH4+zTJNKiau4KXIfUzjjYaw9lGMjsGJS+ZZg/KbU0m6OvbrGZo6Gn0GnHncOLrIVDMYjZB7y9XIPBd26RaWHvAaF4LmrjITdHMmBtJz2k8B5Pd9aLTMUsonJndkJQYTlYINhBRwEfJruzyGlA6dxJ21Ws88MZ+kVL5jau4Y98+1KX7/E35Fx+fMy3H1fSANOb4ZnbLZr72v4zHsZ4j1up0pVSZhjYsckgh3lg5yed7HrZAk7uNItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+gJe55HryYfZJ82cRPP1SKKKXFnCI+ORJkKyZKTXXU=;
 b=aPwftY6hY7d5FwcT08acnh1TK82pYv1kSUA9bSHPxSJoorQjS+ZN/+CeX2hTEiyvT8e6jykGPFLScXPJj5HdjStEAEsdFR/AzPHuGSe/iRFmJjEEHawtwfhRMaOYl8vaoegCcYgx23fM3CG4zjZWPBcOTVb81A3WNgxtCvrSx44Mz2JcugSLaqJ2096oTW9wYMJLdLjV8YMjkwRZLIciGgSsUd3WmUfxSHA2ldneOtu/zosimD3y6o0eTHIyn8+mEupS3HtOcHcyoBllKPyvCaqb3A8c6449kM3v1zbDz7Q3tpd/px5sZe7snYkyDzJ+LZgA2yj4qytGdrxX2KqGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+gJe55HryYfZJ82cRPP1SKKKXFnCI+ORJkKyZKTXXU=;
 b=1LQ74PN6CMIX0jf5jjl5PORSypQjPXS3v460qWyT/T6+FMNF4LnL1Qasx7vJxOPo5WmFERszDpshnYLqYk0zyZ2aJTIlpSAAM1pD+Vzud3Bch9DSlDik6cEFsOPAKkMMy5HTowOAHhdshHCSSd6d2S1AHBBi2rkd7lVI/peaECmjoQhG5WmDttH3ZF9hs0LNCC6pXAYenP1vUGRhjYsxHlTCyXR47v8EBLAaS9puLvDx34n00l1Z++yydFY6xbalT5FkBV/RJAWQwyrTgdxcw9w0Ofv5vt7YbtYat3D0NYkgLwDi5iWljam3iE1EeiAUtq6WIuoy1//MEryVXBt2aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1af0e80-722f-9f47-0618-a31ffe0bbff8@suse.com>
Date: Wed, 30 Aug 2023 09:30:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] xen: add stubs dir to include path
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1693319118.git.oleksii.kurochko@gmail.com>
 <09fa701d2be02589cc9f63d8334082346b5c1702.1693319118.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <09fa701d2be02589cc9f63d8334082346b5c1702.1693319118.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: d75f0a44-6a16-44f0-8b98-08dba92af1c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JbNzR0LOoyQ2QG1q/EHP5w446mmLt0UI3/+VlgdzkbWUbuNjOqWCh17W5O3OtsVY+lvwR2NXkwMjV1qCt3V2tOHE7L8RE/PSfn2aAq2O0+ne13heoQKsJq63HVqexmcSfASNG2YSwviR+EFrXUYZmd8JyzKLEQS2VOepVfyO0Dq3OgjTP1MDdHtihBnmkQfvKejQ4tWpo2RrgFW/Xf6uvciUyGXjDHQdOYde6ZvC3JvzCHVuOvEgDad8dKQ/qE7aUqZ+yMZVgxCbpd2Xh/nvmxXPvJ+/DWBD8XGgqnK9qNLcqRiso5hfK2YJSI9NHgK1CkRZiQedYkzGFxTAVDC3ZqAM/79TdKxN3yvfAKvj0SVDm2wiPlXQfF5YfzLnQGXDcCfOuPdrc73jgZjpM7HHGMeDzNdkUpXHszFs28aA/ds7KTMulUNclV/keKxyiJUDoMnHN3KLtX/oJD0rv66NX4ZdjptKLXaEqon/PLqZRzdY8TzT/kboMbytW7yuRW9lAUKG5bzc0sdjHvcj0SAVTZGK17ZOQfbHyvg8o+0NSeaDlovH4bNLY32UybLo79kIwCTyqSsYd6b6s9fKz4Ao6LN9F23Z+zHrSFGdCY3egp1gUf8K2sgY2gVYw09ml1X9Xm7uxFWE3Grcm5tD87ij+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(39860400002)(366004)(186009)(451199024)(1800799009)(36756003)(31686004)(83380400001)(4326008)(86362001)(31696002)(41300700001)(5660300002)(8676002)(8936002)(53546011)(26005)(6506007)(6666004)(6486002)(2616005)(6512007)(478600001)(38100700002)(2906002)(4744005)(66946007)(66556008)(66476007)(54906003)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGpvMGpScnVLM1o2WWw3b21UVEw4VHoxQnBsQVN1NXRHZW9CeHV0S3IzeXUr?=
 =?utf-8?B?ZG43bVZyN0JNZ2xLNmNMMnlZWGtQUFBQUE1WYkV2Q0Z1UXRmaWZuUUJRSkho?=
 =?utf-8?B?MkdrNGgvQ3NqUXF6VG9SZ3F2SDRRdHZOMjFnMkRXVjBicWtPUXMwRm5vb1dO?=
 =?utf-8?B?d284OUFzektmeWsyNlRtQ1E5bklOTHp4M1VOU3BqNmwrQ2xYRWFCM29uZnd0?=
 =?utf-8?B?Vi8ycGtubmcxWTVGWkNMZUYyOEkzNXZQdnFoL3NsVzJIMmFOeVlEeW9oWHpl?=
 =?utf-8?B?MTA5dGZUdG9VamoxcDBRVjBzU3BwcDU1Qm1udHdBQXNWK21xT0xvNThadExU?=
 =?utf-8?B?bWIrRFdkaDRhMHFpd2l6cWVRdncreGZNNHJrb2tvaFdzMjN0cE1VWUY0Z3Ro?=
 =?utf-8?B?NXlYTXdsVUNYYi92Z29mOHhQU04wdUt0bDk4TDRWZFgwbFdENDRoazZ2aHRI?=
 =?utf-8?B?Y3NiMWdLK0lMTW5QNVpvUjhPYVJyM0NqVE5LZlJORm1NK2g2MVE1N2lkVGwr?=
 =?utf-8?B?KzZUKzZjRlNxL1RCMXJjRHREYmdiQjFtYVlpb1BlZkd4dnVHdi9DSmxtc0Nh?=
 =?utf-8?B?VVVEcDFVYm1RbFYrN3h6MnBYczVSUndweTFIaW0zTzhWUGQ3VmQxcSswbEQ5?=
 =?utf-8?B?bDVvdTZsbWV5OTlGMWk4eER6czl2N0NEZ1I2d1dka2c2amVwd1NwdDcvRk5P?=
 =?utf-8?B?bVFSNmxrQlVLeFkwVTcxQTc4azMrTWtMdFhsUHdKcUJQQjN1aWNGdHlrZVdm?=
 =?utf-8?B?QjRQQ0dTSXg0WlVsd1VFZGdncG42S2RPUVdiZTI4TnJ3N2tJbE1zU3UwOUps?=
 =?utf-8?B?TTFsVGsvdWJuUTFwUUpYbTFHVWxlUVo4UEZuODlQUlRWNUJSNzh0bm1XRGZl?=
 =?utf-8?B?VG9pUlZSL2UybVZ4RHI0SWZkZ2VMYnV3ZnlTOUdsc2lZc2tOcjVRQWdHY0FT?=
 =?utf-8?B?ZlIwNW53VU9hU1h2Q3VraGFOa1lrRE5LYTMxLzY0TXd6L0hzUWkzSlFleXAy?=
 =?utf-8?B?OUQ1V0lwMWJPcXczUDUwSUt0dUpNcXVrVmFvdVFlUlJCREEvVXlZR016cHlq?=
 =?utf-8?B?WGlwK2s2L3ZQU1NGekR2clpteXZVLzJSWWpWc0pHQ2FnUGw1Ni9maklsUk5t?=
 =?utf-8?B?RTcxWVhJaTBxRVJmeVJMTnhsdUNRR1ppZXdhVHY4eXZjUXRXL1ZlN0VEazJa?=
 =?utf-8?B?N3RJWldaN1RyT3FnRFc2RGUwTHdYZktBVDdFWDR5OUFvWlBpTEVqUi9TRVhW?=
 =?utf-8?B?OHZFcElIUUtmc2FrdWRDVWxwOS9ObzltandTRnEyS1R1VHR4b2JjWnZhL0R1?=
 =?utf-8?B?R2N3WHN5ZmFJM1k3SkFueWdqWStoQ2h3VitncXJzNFg1UkFVZHpNUnAyRmxw?=
 =?utf-8?B?Uk5UMWxseEFBV3NRWEFiYkd1a2F3elJQTUdrbGhyQTVHUFJ1TjBiazdUYjdx?=
 =?utf-8?B?dGRwcDNBM2VoVkx6UWhKUmV5N3NMdEpLQ1NqbjRrUk45TVB4Nm1ibVIwNURY?=
 =?utf-8?B?SDEyWnhFU2NJNm1JbkhFTklBckVCQkt2Vm91LzVWNWUrZGZiQmY5ZlQ3azlt?=
 =?utf-8?B?YldhbW1TUWgzQkNnU09NRktWRFBJdDZUS2N0bUJOVVNWMnkyamdmbklSRk9p?=
 =?utf-8?B?bTR6NWFhZVZwNWt1aUZMQzVhMU93Q2NSeUhNck13eVh2djlNZDBNNTFwOHJH?=
 =?utf-8?B?RVJLM3RHaW5kUGdmQzcycEh0UnlaVVk2UkhwQjNBN3lmQWpEbWhCR25HZVJF?=
 =?utf-8?B?SUhmRUdpNmwyZVdRdUhCOWRNUndvTHc4bzRwQ0FTNTBiQXV2UklEem9xVktJ?=
 =?utf-8?B?bTA5RzdlVktlRnJRdFYyaExpcFM1R3JrdmxHWGl4OGhzbllRSkNhTmdwT29x?=
 =?utf-8?B?eHdLdVhuQndOejI3QmoyUlNGaTkyejVxWVRyK2dMOHh1S1gzeVNTaXcwd29k?=
 =?utf-8?B?OW9sWVNEQUdvaGFBenJ5ME96QW9LWW9ISGtCaW5Kb1hMM0E3KzMyUGdpL0Nv?=
 =?utf-8?B?VDFmVURVVXFLTGE5eWxabEhOWFEvQzlnZ2V3M2ZRNnhYZEZURTVjUzFHZk5Z?=
 =?utf-8?B?SWtDaG1MQ0lQL014R2JHVU1tVmpFQ2pmU1lyaFhObnFhNzdHMUNsSnJEOXpY?=
 =?utf-8?Q?JA2UaETh7myeWb5+Na09BowJn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d75f0a44-6a16-44f0-8b98-08dba92af1c3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 07:30:11.4736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9I2gmSOdMLIjcTNYlP9Xz3ikDN5D8zxX6uPrBlI5DFsejeZ5nWJ8bDcx0LdhEIMvuSG8DECOALW0/E6oFzCD4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9226

On 29.08.2023 16:34, Oleksii Kurochko wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -438,6 +438,7 @@ ifdef building_out_of_srctree
>  endif
>  CFLAGS += -I$(srctree)/include
>  CFLAGS += -I$(srctree)/arch/$(SRCARCH)/include
> +CFLAGS += -I$(srctree)/include/stubs
>  
>  # Note that link order matters!
>  ALL_OBJS-y                := common/built_in.o

I have to admit that I'm not entirely happy with the name. I wonder what
other REST maintainers think. In particular I would consider using
Linux'es "asm-generic" name instead, allowing to cover both stub headers
like the one to be introduced here, but also other kinds of "fallback"
ones.

Jan

