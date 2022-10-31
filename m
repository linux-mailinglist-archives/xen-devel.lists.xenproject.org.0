Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D32A613B1C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 17:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433091.685985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opXYl-0007m2-9M; Mon, 31 Oct 2022 16:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433091.685985; Mon, 31 Oct 2022 16:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opXYl-0007is-6U; Mon, 31 Oct 2022 16:22:47 +0000
Received: by outflank-mailman (input) for mailman id 433091;
 Mon, 31 Oct 2022 16:22:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CXQ+=3A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1opXYk-0007im-6X
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 16:22:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4000f51d-5938-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 17:22:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8693.eurprd04.prod.outlook.com (2603:10a6:10:2dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 16:22:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 16:22:42 +0000
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
X-Inumbo-ID: 4000f51d-5938-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCRy5//z4Wwa7ZoN7ZSm4Rc85Q9TyQMpIyAiL4hlXlLG3SGW/DtYb+dUqtSAKU3G/8rKgNK5IXlWOzaUZqIW340vQonbBvdWEh3PEOR1rbp3+yCpL7nFzQeMn9oleeBFacqRycfnFRLUnBZHwEmAdPK5Gvk4/LZuUd5eWpn5z9u3wJiNA9/9XFqcGecPbhM2F3qgaVTLnL8a3/Enkrqlhk+Fyp8pc4MNpaplFLssjOug0CO573AR9G0WxJdo+aMYicN0cI+KcFrnfT5iA4a1C6TCIKm4jfIrkqkMcdAlq9H+IeNytL+2R32VCO1uX6z9Ipp7VOlWVdNpoZuXLi77sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gq9DuOI0BrKBl2/scw05GGHAC7mgzloluTb4Ec6eqe0=;
 b=lExKXBY7lQUJYEWVD02xFYL/xU3m/dsWjBPW+QsoskmSyyGgxMUbCJ1ReF9YMSV3H5YHswGVFiwamKQD1sJmWsVuoU9S8nMwULnyBXxjVtqpb+DGypE6eubD/R5/5delafKEQOElmcdsvdYREkiza+1SHrH5zLyjzyPjYacY4NwCDMJJrJgwhlKUXIrD/ezctURcc/fnEncbWZ6j+olUaTGFNkKNU6e335MCqmMzqN2hXnn4yqjn3e61SEQx5yihm1PBBKt9wrlGfkKKWKNtdxiMEa0wqzsS2hlkOg/xwj/K35x1AHC15nEtDUath4lfa4ArzCABi+dFqfPzYHyosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gq9DuOI0BrKBl2/scw05GGHAC7mgzloluTb4Ec6eqe0=;
 b=xrgBZpoYHFSYgc5Eec8S4IjCjP+Zers4rCsDCqtpl8kOsfpaGLmP4evXa3Kt7sAkYc1LR5c25v11lg0ZQKDEhysRRADy46x73d4/ATQ8rSch24o041/uxrHSswKAST7H1UjizkL6evNksMFz0ag0BXciaM6Ho6ET31R1I+MC47zbVnMW8VkQsf5Ilfg4dlADcmXZbeG9QLzpzx51JYTG3Btun9uUDa1UFEHp0VHl9kduGmMqVnYCMIcdsJkzFeO12d79y+8Z6WhBQLTPRHskr3yeL+LTBDHNlZfzkz6HhE/R+L0ArCXhENCHlVR4uL3SJFtgHsoQgGpdassrPEQjeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d1f7271-1399-f5ea-9519-9db4e4ca3de0@suse.com>
Date: Mon, 31 Oct 2022 17:22:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v2 1/3] hvm/msr: load VIRT_SPEC_CTRL
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221028114913.88921-1-roger.pau@citrix.com>
 <20221028114913.88921-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221028114913.88921-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0029.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::42) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 750266e8-1153-4dce-40cf-08dabb5c22ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uch/vXBtJ/AR86avVcCkir8OLoWTH4GFsqG5AEqR5r0GYVHFboskRNBuefrnnb8LapPkh3amsXQPKlddDOlImQS/LJqvAmq5UTY4UlTUOM7qFFXTf0N36RvJyiiWDB5RhmU6G44CfDgQ/X1Hx1XS3w+sya/65zYJtUyn0hN+M6d9l9hImlNPqL+uXlU/VfEMNjxYxoWeOaU0ulxjAVUAOqmMlc99kdMmgOEK7pN9m1dTkGYYZ/5Ntlr/OH3HbKCAqt49nMWhSV6nVyxmQVJgDEMwDCntc7eV40dpqdMfNqi2hyYfJg9JJCrzceDwynGy24V1cjas/27yHdBPPemly40lZa4HXfL3Kh3l+UrnFxOzgXOwnaCC8DbTeB5KZFsNyQ/3PARbKm3T626Z1XrOE4iQv9MYhsYzDewEKYtpek5YOHiGAuDVhQIwX66SmIJOTzCr10syZgECRVKk0xH3tM9ts29Z99w+asmQEF9sI0SPb06gyak4qtkqJn8frQZWIh67T2xGe75s7woReRj1Lx0UdAexZ/HUhRsPhpE3IiMazEHWp2fCMsH89kCwUfsGVVkU9L0+Rd4hNr7u4s1ESNxYNgCfq8s/aUKazQa8gqBkZWq3q/pBWtdG2ZaupDjHC0Zxdl9YjZvcFE2V6g/A6VfLmjp98kdPOs8dKshhoxEQbMgNWMustaknimV2h6ZoDvl7EFO143jQ/pC0l5lwlE+0R+bpSCuPy1OQpFT8YhK2LRjS1AAKyKoQu2jMQGHL2qbFlE4Lnh3EbdnUB7f+o9PXieaV6v+UpEYFjxQMm2s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(86362001)(31696002)(5660300002)(38100700002)(8936002)(41300700001)(54906003)(2906002)(8676002)(4326008)(66476007)(66556008)(316002)(6916009)(6486002)(66946007)(6512007)(53546011)(26005)(2616005)(83380400001)(186003)(478600001)(6506007)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGhzZzJ6NVp5cHNNL2N5WHZSclAzZmhuZW1PdDFEQnF2a29INnpRSjdhdkpl?=
 =?utf-8?B?THEvdmtaSkhqNGk3Z2JCbmU3U1F4aERqUVRuVUMyMW9NR0NrSy9QMnZRR3Nx?=
 =?utf-8?B?TkQ1aGpPeVJMazFZU3E4MzZteGp2S3E3clg4Y2hjU1dzZ1ZpZ2hNMkN3VzM2?=
 =?utf-8?B?akRlZU50UlFJdEJzT2ZqZ3UwU3lyMlY1bkg0dVpYSFVheTVqZ3FpeWtnU1Zo?=
 =?utf-8?B?blord2FLa1JpSVUxYW44c2VEcXhaTmdwVWh4LzZmSnZoNVJjODVxVWxIZ05z?=
 =?utf-8?B?WW5qeDE4OWJwRDd1aWs4d2s3VG14RVpGUWdrendLTUJMYzk4NGpiMGJlYU5R?=
 =?utf-8?B?TU1DeVpZSC9meWlFZUl1WmZOcXo4SmgySVY3YnkvUE5QczUwQXp0YzFBeHJN?=
 =?utf-8?B?T0FNQ2s5d1V0M2JkM2RCWVJQY3R4Uld2Wk9mZ0ZJTUhsMHgvcy9SMzNsQ0N0?=
 =?utf-8?B?dXFVR2tPaGpvU2VoaWxkNjdheHh0eWpqU3BQSGo0UXpKb3VVRDBYR0pRVGJL?=
 =?utf-8?B?YWdkQXY1ZG9EZm5iY0JxRUswUlNPNFJ1Q2VHK3ZnODBlOHV1RnNvMjRTTGJB?=
 =?utf-8?B?cmNYQkhISTQ3ZlJrMmVCUlZPYTJCS1luTWxQSmpRKzhOOEpHWW5KVVJRdHIv?=
 =?utf-8?B?S2x1Y1VlcmR5U2U0UllXSnpRVmQvZVNKcTJzQ1ZEamdOZlZpaTJDWXVhenc0?=
 =?utf-8?B?ZFo3V29lK3dEZWVLTmNnaHpJaGl0SkE4bnZUV2hwQXJablV1cHM3Q0gwempz?=
 =?utf-8?B?RVNyajI5bUVvYlNtRTQ2bDZhS1IvbTVXSVAwSFJSa3RQRldlYm1iUmFYdWQ4?=
 =?utf-8?B?YW9LbkZZZXpLZ2xTMW96dVExRWxoNERCanZZUnZlUHdtY1B4c0gyZDVtVkRv?=
 =?utf-8?B?T0xtMTFOTE0wV01QL244WkZ1U2pucFJnTjRLYnYrZWVhZ1hxUTZwQisyQk1E?=
 =?utf-8?B?d0tqTzE4TXh0ZGloY0ZSc3pnejhnc25zdHB0L3NldjRyNVJheTM0d0dlWUlv?=
 =?utf-8?B?S2NnR2RMdVRpZXRxVEtnbUxsOWdBMkdpNnR4U0J4N3dpUEJKSkJ0VC9QUzhG?=
 =?utf-8?B?WkJ0Y0tWNmZ1UUxZU1VuNmFvVkF6Tnd0SjFZVHl5QnpwdHhRWXVLZmFaQW1q?=
 =?utf-8?B?cERBZlNsb0hzbXpNekNMbTVPOWpFUyt2cFhWbGVqdDFNMHpydlExSHpwVjV0?=
 =?utf-8?B?MU03MXZiWkI5U2xSeUEwZjNrcmp2RGNncjNEVmhJYVhaWm9nbjlTb3A1L284?=
 =?utf-8?B?YkdObnU3TDl1OG9jMW5DWGkxZlVYcUgrU3JYTGZTWnZ1US81OTVxeFRLbWIr?=
 =?utf-8?B?TVNUbms0TEdjNER0Z1ppTTF5NVJOblFkMzhGVDh3cy9KV1hoU1NuVHowMjla?=
 =?utf-8?B?bTV3eDduVUwyV3lEeFg4bm9YODZJR3dMZHRhWkpBUUhlVytvdGJmeWppN1ln?=
 =?utf-8?B?eDZ1alRLcDlyVjRxNDN2SUdjbE1JRmFqQzB0WXpOVXNsVWFGM3dOcG9kaHdE?=
 =?utf-8?B?K2J5cC9iNC9uZU9GakFiWEFSWUo3UFNueGc5TEV6aXh6Y2QyU0d6Y0d2OGdm?=
 =?utf-8?B?dkk2T0NBLzltNmhtYnBBVmhNZ0duVE9XeWlkdVFhZUNDQkRlQVJiVi80ajhs?=
 =?utf-8?B?MlFFOGRYTm1NMlRCeUdVcllRSy9tY28xUHlCTThoUm1PRnFlM0sxQnpaTDVD?=
 =?utf-8?B?bHYzTjA1KzBzYW13bEtyM0FkZGJWaUZqMmUrZWtudU02QW9OaEhYMGhYbDE1?=
 =?utf-8?B?UzkzT2h0Y2lGZkVXSnAyUnVjRHdQbm9OcGhPRjljaWZ4NS9wcG10N3VaVjBo?=
 =?utf-8?B?VFkrSXhUMDRaVjlqZXZSbXVPeHZreXIwRG15bEExVnptMURDckJydzZuRnlG?=
 =?utf-8?B?NkZQeWwzVXVEa29xSlBvQnk0TTd1TUNYd3RDWmVvU2RFWEE4R3ArUkRMb3JE?=
 =?utf-8?B?M0lPN2hKUlJpd1lzbUVHZytUQUhPN2VyWXNaRWZ1MDJOdy9mSFpKeDJkOHFC?=
 =?utf-8?B?VG9hWDJZMHF4cUdzNHZuRTlzV3RxSm8ra0JnVkkzZWRITUVyL3pWOWU4cjNK?=
 =?utf-8?B?cm9VRHpseEorc2kzd0dma0t5djExWXJ3Ymsvejk1MU1qZkhka1BaYXNpUGwz?=
 =?utf-8?Q?TZ2dsin3KVpPUsGzEEQfFgxMA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750266e8-1153-4dce-40cf-08dabb5c22ee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 16:22:42.5021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +96MkLNdz9mOtnGjqHv3olyNJ2KOaxis6nbEkxnCukKxzCaHzqDB7zN5uv7PqItpI+pisu6Gdx6qsaue75qIUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8693

On 28.10.2022 13:49, Roger Pau Monne wrote:
> Add MSR_VIRT_SPEC_CTRL to the list of MSRs handled by
> hvm_load_cpu_msrs(), or else it would be lost.
> 
> Fixes: 8ffd5496f4 ('amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> I'm confused as to why we have two different list of MSR to send and
> load, one in msrs_to_send[] and the other open-coded in
> hvm_load_cpu_msrs(), but given the release status it's no time to
> clean that up.

I guess this is an optimization, as looking up the MSR in msrs_to_send[]
would be an inefficient inner loop, with the result only used in a
boolean manner (entry present or not present). I do think though that
both places should have a comment referencing the respectively other one,
so both will (hopefully) be updated together. The same looks to apply to
arch_do_domctl()'s MSR handling, where I've screwed up for XFD{,_ERR}.

I'm puzzled by the ctxt->msr[i]._rsvd checking in the default: case. It
was me who added this 8.5 years ago, but I can't see the value of that
check considering the check in the next to final loop in the function.
Hmm, wait - this had an error checking purpose until commit f61685a66903
("x86: remove defunct init/load/save_msr() hvm_funcs"). I think the check
should have been removed at that point. That'll be a post-4.17 patch, I
suppose ...

Jan

