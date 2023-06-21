Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDB3737DCB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 10:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552556.862701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBtWd-00041o-Pn; Wed, 21 Jun 2023 08:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552556.862701; Wed, 21 Jun 2023 08:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBtWd-0003yT-MS; Wed, 21 Jun 2023 08:49:15 +0000
Received: by outflank-mailman (input) for mailman id 552556;
 Wed, 21 Jun 2023 08:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBtWc-0003yN-2W
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 08:49:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ed10db0-1010-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 10:49:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 08:48:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 08:48:42 +0000
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
X-Inumbo-ID: 7ed10db0-1010-11ee-b236-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHbcDqrRP31/rPXHpM4xrTy7P9A2dGWn2EMPGGRNUE3vdITChSq5gxfXvc8L3i8qEjVEVdn+Kqs2CFSlU/egtOky00SG7Fu+XgW8eaAs/Gtw+UvhI+7fs81rur0PeBeZoQzHDeUbmwqZVpeQrQxGxjfSaVJA1SmjTmv6pZIVheSiemO95DYXY3b9MLoTVTv8McL4pGYDUlhNBk+SzJRbRPlUJfPygwGVqTc3QyAEklASS3uDWgUT4ItuQGoBTMaMzJeQX1zOLFJKXjcUW60P5qHfc6hzk9MucvyZUJn6rl7oMAvWtiDr29scGjVruRVm36xWTWTrUQQQe3v6bA1X9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cAMGeDsrb9bQblAXcAKJAqLCzbkEboAE1EDV4YvyD4=;
 b=aYl2JnJ6ucF63ZetHsH571sh6pi3VbM5U1M+FP/fYT7C8ZRFC7v4EV+xCP7Qx7rw+TZwQAoC2spyCF2SQYmROm1NydavbzkRGgVDfaoIYOnvSgq8TWhcLVO8DiPGllUdHMh4JHdDUCHmyVRB+Iht59xE/cjEUwH5C3vXYQMXhqiVVtEd2FKgoQQ6/AjkZbHyHjO9Fb2wuunsGEnUcdbLE7B1ydBX3IgbEmgZiUgIgabYjy7lYmMiZ/qBIyrz20Xu2r1ZNydjXEhHd4LiToLHB9g/On7EKYZ4vKb6Wd4SdD50ohBz0iFCouSolkDNkFrSqcWTi36Uf1grzNuyzHTQ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cAMGeDsrb9bQblAXcAKJAqLCzbkEboAE1EDV4YvyD4=;
 b=MlO2qHXNpcfAQbreqenVVkVeEJnVd7HhwGD0ltRA5YtPjO0kjRkDJzP8/6rGrEAK0KbSovyu6/S1xab9WTQXwN6/qUy/V7a3ACuKMJVDVfmUUwMk5xl5j8SjcZnYKDFGlnI+kzJGtJHIa7aq69P2g7uwdb7akEE07eM6EYimjDJXCEX5nJgjl4jiBQ+A997SkMbE3f0//YuaCq/OafAmq/JZ9KzAPBu40oOLu2oWGGDofNLBB7fscgpk4sQJM4hJtfgUDAtnyI7HM1PQ32K3Aoyxmz3Bjw1woQpJlUrVgb0ZcbkLQhGvFep+jE2uq58XQWqRijseAb6Mk+USeH82PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0fcc228c-548f-9051-b8ce-4d79a3d8293f@suse.com>
Date: Wed, 21 Jun 2023 10:48:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2] xen/include: avoid undefined behavior.
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <9d222cc83013aaa67b45638b27f5975b60aecb37.1687332385.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9d222cc83013aaa67b45638b27f5975b60aecb37.1687332385.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: cad562c6-220a-4c8b-8868-08db723450f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XGj32PP7PP5foM+XzW/oRwTKQRQWlbpIbBLbu0NvSl6Hvuq0++Q0wS0oR4eyztwWGsfQLU77qFsEB4zIIhds6TKacjQY0HWIP9af9Z6SoiFlYFUasGODUp/na19PnZnmiqy2TqbRxuadvbzcZyklrGQb9vhqgqMjOJuRcs/tZJcrBesf6U0tbKmiOW/rDtPv5r17W+owbWdJdijZ+4biWNV0TJwzA5ew+pyF8IH+JOYDR9kpGc6XgaGbjwYP1P18/j/1SlqAm2Fa0So2znm5qsC1aZFua1LUntrA8mk9Fd9OUNUNbHjOR8xtVQUYZ7fYfTcxCENWcsHwbSOcPFMCCk0acQC9tL4MysLtgpwqkPRkYRs0JbcYuP8JP+5JDEoW1e8BPLrrtXr1e/2LIcsKw9ZD1maqHcZ1L8CdibHqAgo32o9xHp/9aMg0JgNaVKYl/re71RRPy1dkUiI85zYGlbB/w1zqXchAjR7raNcrSU9KbTAbnYxkR4ZfxmMBOr8oWtygOCn4fSwi/O1lARgoIarAuJSkNUHOKfPDEXIyDaM4ywR7dgHvX+Ikcdg/O0jGBXBnP1E/2doAMMjp9arVICrw4jLReZ7P22J1YdGbXomzibLQqjD4sBDJiCNge6DfqbFG4E4GJ0Dm7lPpmcNhoA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(2906002)(186003)(6512007)(6916009)(66476007)(66556008)(4326008)(66946007)(6666004)(316002)(2616005)(54906003)(26005)(7416002)(5660300002)(478600001)(53546011)(6506007)(8936002)(6486002)(41300700001)(8676002)(38100700002)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnlHcVo5SktJbDRRS3hvZWtUeFQxdExoNE9aU2hXRHZPOE1WV2RFeW0vR1pu?=
 =?utf-8?B?VkNrY2ZmZGZJY2w3QkVlUUhpVnMvOTZ2OTlOcVQ3bFNFbmowUHR6YnFzMlpT?=
 =?utf-8?B?R3ZCVnE3SElrdDFoZnpPb3Z2ZzlBYkdKTkdMZHliUEw1QzBoUTVsZHo3cmx4?=
 =?utf-8?B?czFVODJkMnV1NHBSQjZDSHQwVDFxSkV5cVdqeEljVENjYTUyQjRQZ0NWSmgw?=
 =?utf-8?B?OWxaRVZsd0xMTmQ5c3FWSUVmVEEvdDZFR1ltb2VCZXllQ1FOQmNqRTJQamJs?=
 =?utf-8?B?YjZEZVFMUUcxNVU1SnlVYWN0ZUlNUi9EMlBwTEk0RE9CdGViK01xK25rRFVY?=
 =?utf-8?B?bGxiMFNRc1JGbUkrZExhK1lSelZrYlQ5YmFZTmlDcDBFMjhEWFk3MTdERWxH?=
 =?utf-8?B?S281STJrbkZEc3dPVGt2NWExUXdXZW9ZVVc3YStuVmNvQzFJOUU0Q21UWG8z?=
 =?utf-8?B?RkpwbzU3RWRLbHBpdWNHUGdkM3cvRlljYkl6WGFZOFE5RXNuc0FpajBHMXls?=
 =?utf-8?B?d0hkdHRZVFpmczVEd05xc2RsbmpOSlFHVU1DTzBESU1XRUpKY25LejZqN2FB?=
 =?utf-8?B?eUZibW5PZWhYVFRzZTQzUVNTakxIRlNnYzFoZzZ0OFkvVHJHbDBiczRkV2o0?=
 =?utf-8?B?V0hyQVBLZTQxQXpESGxvWU5ST3lGcVhUQzhQK1dsQ0xRaEZhMVd1enZBNEVq?=
 =?utf-8?B?dWlhQ0JIbEJSbmgwdVVwZU1vb2tJcVI5L2xsMG9EZnFjOVcvRVhmMy9ZYlVB?=
 =?utf-8?B?OWQ1RHFQRTYrSVFEbnp5UmxudHhFdkxJYlZQNlhBYTcrSGtGcExRdXp5eXVk?=
 =?utf-8?B?R20yRGJyZERVN0pDZHZleThwQ3lZemVGRWlUQ0pNOUtSZGtxV2VMdWRVTUgy?=
 =?utf-8?B?WnFqTk5VTVdOMGpickR0akRHcVdUSVFadEJoczhVVHpEWUVscmZET3ZyZWpo?=
 =?utf-8?B?OUwvWjRnUEl0ckZtUWNNc1V5Mmt0cDVYNG51enB2eG9CVmMrR08rTlhMNUZ1?=
 =?utf-8?B?c2htZWtDUkpWRFQ3YVFKMzZ3cmFxLzR3a1p6ZlNyWnU0dXlSRmN0MkYvbU9n?=
 =?utf-8?B?ZG1DajAzVTlpNFFBbTVWdDZqeE91NEprRjIyZWt5WGJSRU5TL2Z4TEdiRVh3?=
 =?utf-8?B?c2Y5QjJMYWZMMkJxTmJ4M2VxK1pBNllJVkowWWxubGMrcFBmU0E4dHpoUGZK?=
 =?utf-8?B?SmgyMGljUTlXeEhUMFpTTytiYWRBanJONXpCRG9reWVObFJvczFjRm5wNlhG?=
 =?utf-8?B?bzdWZ3Jhb3dHSWtiRXVtWHBZa0tyVFoyK2Y1c3hnSWtLbWlYTU0raksxMDZ6?=
 =?utf-8?B?WWE3TUg3aEhCSmJxYU83d2RrNjhVaEE5MUV0OEVIWXFTNXRIWGtJRzFTQWMr?=
 =?utf-8?B?WkJpL2ZhcS9Ydm9hRGl2amF3TXpvd0pYeUcyU2Z5bkM0NjRCL3BLZDZjMjRz?=
 =?utf-8?B?eFFEN0lBRSt1aXZsV0l2b3JqeE9WUUFvbitHVG50ZnBteGhCYUlpa3ZadkpF?=
 =?utf-8?B?WEY5TDFaVmRWWUhSbWZPbFJsV1k0UjZFcnhNVEhndytpbi90VWszZ2FiS0d0?=
 =?utf-8?B?VDBUQXU5bWJmUFhBMTYwaUw4amIrZ0V6U1hVZkhDRlZBeGhBTFBzMS9SZURR?=
 =?utf-8?B?QjFJNEpYUEc1eUF2dHg4V21tTitpMDljNFJraFRoSVVqUjgxWTJhNXJEa0cy?=
 =?utf-8?B?YnViZmJXQVpPV3ZKU09nR1U2aFNkdTN3ODVOVzFCdWVoZ3NsNVdxd2dmTUJZ?=
 =?utf-8?B?TlFRRDZMbWMzamdnWk1YeHA4NDFTb0VBLzVWSW1yb0h5U21sbXRnc0R1Qmxv?=
 =?utf-8?B?a2Q5bkFIdFowNmVmbnZBZG9kQWRXWGFlcS9VQzdwSEE5ZDc1c0dJS2M0U1FZ?=
 =?utf-8?B?RFU4UnRvL1kyQm1xOVRPbU83aUFETjJabnpxNHA1NWhIak1xbzhBa2s1NVlI?=
 =?utf-8?B?SGt3Y0N3Nis5czhtejBGcEhKWGJ0c3pwZHFZcTJ2L3p0SWI4RlR2RG8zYnc2?=
 =?utf-8?B?OHdYNGN1dnZGKzBDdVl2bXdtRFJ0ZHl0NnVWczRYQ1BDNjc4REltVnhxMCtI?=
 =?utf-8?B?akRvVGRIWEhvMlNQNjN4V2RqREc1bzVQTEMrT0kvMlRqZmpoUTNoYUN0SHdS?=
 =?utf-8?Q?w1Dc5Jw5yhPVscmHPkuRliX9T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad562c6-220a-4c8b-8868-08db723450f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 08:48:42.6923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9i9CPLt6H03iaf7YnsAI9zxjgOFzczhKlKUKuAZvHbGu0KdQMbrqLpJPvWUtGSl0jyUJ0cBHeOCsEoZnBIdPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659

On 21.06.2023 09:58, Nicola Vetrini wrote:
> Redefine BUILD_BUG_ON_ZERO to fully comply with C99 avoiding
> undefined behavior 58 ("A structure or union is defined as
> containing no named members (6.7.2.1)."

Here and in the title I'm not happy about you referencing undefined
behavior. What we do here is use a well-known compiler extension (and I'm
sure you're aware we do so elsewhere, where it's actually going to remain
as is from all I can tell right now).

> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -51,9 +51,10 @@
>     e.g. in a structure initializer (or where-ever else comma expressions
>     aren't permitted). */
>  #define BUILD_BUG_ON_ZERO(cond) \
> -    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
> +    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); }) - 1U)

To be compatible with whatever odd ABIs new ports may have, maybe better to
AND or multiply with 0? (I also don't think a U suffix is warranted here.)

>  #else
> -#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
> +#define BUILD_BUG_ON_ZERO(cond) \
> +    (sizeof(struct { unsigned u : (cond) ? -1 : sizeof(unsigned) * 8; }) - sizeof(unsigned))

What's wrong with just giving the bitfield a name:

#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int _:-!!(cond); })

Jan

