Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2108857B276
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 10:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371449.603366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE4oA-0007EK-Sv; Wed, 20 Jul 2022 08:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371449.603366; Wed, 20 Jul 2022 08:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE4oA-0007Bf-Py; Wed, 20 Jul 2022 08:11:50 +0000
Received: by outflank-mailman (input) for mailman id 371449;
 Wed, 20 Jul 2022 08:11:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oE4o9-0007BZ-Rq
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 08:11:49 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10047.outbound.protection.outlook.com [40.107.1.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99fe5b6f-0803-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 10:11:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 08:11:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 08:11:46 +0000
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
X-Inumbo-ID: 99fe5b6f-0803-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4Xf4yLUyBKxfzmU8hVC2hl743D5xv9jaMYiyPl9hUHK0YxBz4dDjB8pGHPbqzxkyr4Ixu+1oV7LgIaLZevNGuIuUvsF3Z+VxoD42SxP4asVGwLaXHed3BJ28ZhOmPASyYt75XfARyTPGcaAYtycNDmc9c4penuApAGPMpKtgILyFzUFp906LOuE+TRlSTQYGDKVJ9FAgwOGByYSRCGHVmaJ0tmY8DC25glmo16M1qroKOkhF0fl4eow2anFd6VqUjv0yOuZ1u82DFJ02ZIkEi83/naOnEKMmydKFmJYWoBTnzjcv6LacoNq9IzgpmbCguRv/S3nuD0lC7MLNBr86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5QMMJmdv8UdFFp/tFz5gEMskgskspJo3Tgkarqn6m4=;
 b=kZxrGHRUDy7beys0sBNqnGpLjCVWeXspIrzRcxyG+36SVazZVN7OkOOpAqySy5do5663Spm8mOJZN3I235WQavgvmsUgqsLjOJYmgk0+/K5+QWP0eHRPyiEin/p+CGJ6QOpF0mNf0jFvh4nYdj6kB+Tu95s9s8Yixm+km3QScF5iK/fStZDHufN8EnjPY7FZGW4W2ivMZlBLVAkRKqFQ+wiou9uh1p9vWkRnQYP0qECWw251YhYHW5xSi49gvy6EKC9AZJM06Wb1rPlSj90wtTP6Pp1gIJ5euzoblhl/TFFc9Tyfx/LN09kTSqTpLYy4tOB0Q6bv6g3EZ9LFzak0vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5QMMJmdv8UdFFp/tFz5gEMskgskspJo3Tgkarqn6m4=;
 b=1XZ7T0VbO6pOjHeuUsHDbNkNNzXlow5h0TW3ov1m1jCq7GAunHWcQSkn380snS5rG7T78/Wiqwu1yUAjAMI4NQIBcQpK7oLalcXXOHGfpmBH+BIZ3wIlIKXTDN7/CbBa/ktrnGdQK/AQO+RdWEFfZ2ilqgfKvu404y+Np2LqPECG04UEduH7N0cGtmA64wYL6r6WeWyMiuqHoFozbJgEyHCgbw9d4MMsFlPJjFJC4uWvWvDQ4UcF5yflKrqdyBcFo5HAOAU7B7JRinUOpDddQ85RB5KMrHGuHzT+GI2Yse9VGAVjAHP4t64QPblvGFoQPU/WFOTycWqzu1dnjIFEhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com>
Date: Wed, 20 Jul 2022 10:11:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <4c3976aa-dad4-2707-2852-9b26593692d0@citrix.com>
 <pDQL7BhwlO49buWymLE-VFEZJim7qNeMmAeThZgHF9qzcbNbQ6ZoSXktgD14I_HYpsdxqfCugrNoJ227u5DLCWEEXk_h9c7bf4iKdgoQbQ8=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <pDQL7BhwlO49buWymLE-VFEZJim7qNeMmAeThZgHF9qzcbNbQ6ZoSXktgD14I_HYpsdxqfCugrNoJ227u5DLCWEEXk_h9c7bf4iKdgoQbQ8=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87f0eee0-1c40-456c-5cc4-08da6a277d0b
X-MS-TrafficTypeDiagnostic: AS8PR04MB8771:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wn4/9FPXD559DqlcycQn4GbRont3p83nVuhwDFEGuvklpuKqCoY9DYvxOhtK5d5ozoZFaWnWxhmt0+3F+F+u9+qGfbOPrIEyleAPRJyw3gj3pb9GzyVOtiLR44RlTYzDU2K8VhS0h5ta6VasUhzUgLRoNzVal8QvdmjOpNA4t0kZgCoADDruQGdMKQez+t74NqKBCG+ctQ6h2FPXkDV25Fn/iXCQuTNqcZqPFyAvtNhZDjzgw0ZMQ2AMeBRC/vHkLXqU0NuAm1j206Q93vIy2y3KQ13tWuWTU3BCDX0T5cl/XHpQH7gIhi7nmPRfpRmox7+9BU3qe6zMYgJOtALuhWSe45JJSE3ycSIZW2Zutvx4dIi6VoS+g+mtgDVnmH+WhTNSSfEDrht0jeg8py9TFD370uD2medTI2wHGbCpGYdKFKOl2d/mRWWmjpjCScvQmsKrT8/agaeDanprJVbuRlB5q4Ih03wpsLPw6cOGsbn4rlqMN/frqT8j/xFnjUCPCg6dLyUMzc3Rb5lU3inmVEKTf9NE+yz3TZAa9LsDSuVt38TE/l0Gtg3c3aY5q6c5G6is1+POQphfM3c2u5NGXzEK9fijoz6WFsdC26UZebpszKFnbpfUX7cK5YTIbjGBCiJ4CjZ609QvGB+Yla2ktSV5qAYURqzOt5bpm4WHxKygoN4pf4uWK+lR7N7A9H9j8cCvLgGAcjbogI+ojwdJH1TLbvwNcboLA97lwRlm76oEGhEuG/AkBnZmUHCG2pgwm63yXUKuepYGitRfVr3fznjOjyLkz1rtxfOk2hcO8OPgtq0n0XWYsbuUgapjZQkv87PtqrNZQyDeSRdWztNdiQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(366004)(136003)(376002)(346002)(2906002)(6486002)(66574015)(38100700002)(6506007)(66946007)(66556008)(66476007)(53546011)(8676002)(4326008)(6512007)(86362001)(26005)(31696002)(5660300002)(36756003)(31686004)(8936002)(2616005)(186003)(41300700001)(316002)(4744005)(54906003)(478600001)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUdHVVFhOEljS20rWGxUQ3JEUm5xRmJzYnVhMGJFUU1WdG14TmY0QUpNOUor?=
 =?utf-8?B?K1VpZ1c0VE9ZbXp4WkR1MnFJTXJuWHJYY2tNWFdHMjRKTHMxNXR5b2pSU3Ju?=
 =?utf-8?B?dlMxN3pnOWMyc0lVZnBSc3pDa1VlSjlsSUFZMyswTFdHOEw3bVQrSmMySE9R?=
 =?utf-8?B?MUwwVEZybGZWYkdGQWJlamVXaXRwRnJ6QmQ4ZmJXV0REZ21mSDQ4VHUvTUJi?=
 =?utf-8?B?V2VDV1ZpVlZiUW9CMmVFOVZXZE4vUi85U0VrSEtHZkdvYTIrVURSWmZEd2xL?=
 =?utf-8?B?ejVmTjNQRENvQUJQTGlSVFRZVFR4bmZoSjJIYW5oby9pL3NvOXFRWVB4R3ZX?=
 =?utf-8?B?d1VYbHJ1bnRPMDN1OGI5ekVMdmFmSXlEYm1IVGdWYXQrNHJmUGM5N2xLNWEw?=
 =?utf-8?B?dnpCRDhaMEpnWmdacVZodUFGaU9EK2ZlQ1ZQRU9qalNkeW5zVzZvVnRUbWJx?=
 =?utf-8?B?QkZvQWNIUjdCY3p2UmFzdThDVVdrMGNCQzNtM3JmalR1RUJRUHdweThGcFNy?=
 =?utf-8?B?azBaMXM3ZG5ndU5HdFhQTE5CSHFXNkxUNnRsYlJYQVlyOE1oK1U2ZEpiOG84?=
 =?utf-8?B?QnkzU1dwem8xN0NTdXNxNjFKUVF5WkQydFR3ZE5jMWxuVmk3TFBjN3gxdlNx?=
 =?utf-8?B?V21UTExoSGxRUWozNVlmd2JhWGJISC9XamtmdkwzQkNobHgxSllhYnZwNnMr?=
 =?utf-8?B?bUNwK2ZXWCtHVlJLUnZ3SHVQNmNyTVpFeVRYemZ6SExvejFFWlRKWkMxYzQ3?=
 =?utf-8?B?MHhIaXdGdE1wVjVhUUtnQ0toTWh4T09aNVRVRmlpNFBGSUpreElia01nRjlH?=
 =?utf-8?B?Z2M1UGs4d0VSWGNSdFJUQ3oyaTBBOUhCcHVaVFVXUG1OaTNNY0dwSjhJNUVv?=
 =?utf-8?B?cVk5YmtLNWJ3eWFBODJ4cUNoZEhha0ZvQTl4VlA2UjViUnJGRGJ2aGI3cTVq?=
 =?utf-8?B?K3U0ZUJaT2l6cWtTZG9WUDR6MWVaeUtBZmJML0s1ai9RTDBmTEtidzc0V1F2?=
 =?utf-8?B?KzlrK1JhREJrYnpwN2duUkdaZ2k0Wk9FcGdhekNwdmNCWTlJRGVOcUNpVzN2?=
 =?utf-8?B?MC9oMUhvaENxV05BUFVYKzh2dTgzVTVqdnMzcWlZMTc3Ykhaa1RxNUFwL3R2?=
 =?utf-8?B?YmpmLzZqWEpBVU9rUENCQWx0cEUrUEszWVIwaXdQa1U5UGp3VSs3RENwTlFs?=
 =?utf-8?B?eS9yckRUSFFnSyttcEZSQUd2TlRyVWx3NlVnUWcycU4rUWpwS1JiRzNCd053?=
 =?utf-8?B?SjQ5SERpRExXUjkwYTdrVEpHUU96TkNtK0lMWS9jNTdRZTcvTm9SQlZhMjlw?=
 =?utf-8?B?aVlWcm53NU5pdVBGNW5CV09XQWd4emY4QlRhV0JqcGVJbGJsQnNYcmJ3MzY5?=
 =?utf-8?B?L1NURHBHSStKU2NTSERDMHg0cm9lVmVWNjhYN2RmZWdpak1NVUVZVk5IVGlV?=
 =?utf-8?B?d3FaQjNndEl6SHczUldIQllKakNUNVVZQXd0ZENJN2w4aEE2Qzh4czViVWwz?=
 =?utf-8?B?L0treWdNN0VtQ0VURmVHalIwR2h0UXpyNFF2d2dlUHdYeXdSZjJQbkRDN1Nl?=
 =?utf-8?B?Y3FKOC9HeEU4Nysrd2N5TENQREZtczhSaXBkUlZrUGlFc000TFVsM3BIdzZ3?=
 =?utf-8?B?SzVZUUw0bTZYTHA4cGtBYkJ5cWFPSHAxTmFoT2hWdmN1aUVyRkh1VmNodE5n?=
 =?utf-8?B?V0k5Vkk2T3dBakZpZU4yaURBaFBpZ3VjQjNVTW1MQW5Pc0djeGVKMEgxaG5H?=
 =?utf-8?B?TjIxYVRrUnNXTExlaWlObUFBUVFVWnN0eTRsWjJhL1hrUS96bEltUlV1Mkpu?=
 =?utf-8?B?bUJ0bEx2SjdiU1FuSkwyUVVtTjU0ZEVES0hBOTVHTWhjVjc0L2FpN01MZTNz?=
 =?utf-8?B?TDFDSEk4cDZrT1lLaHpKZXgyckZ4RW5aM3BZaUFxS04wbkNQZnZROUJWWTdR?=
 =?utf-8?B?MDlyaWZNQjA0TTRpTEUzT01zUXJFVWliYTdTUlFacUkyUjRiejg0WC9NNGNl?=
 =?utf-8?B?Yi9Cb1ZnWHByL1Vjazc5WFQwKzNEMGhYS3JwRDhOUTI5VXZmVm1WR21jb3pz?=
 =?utf-8?B?Q0IwOWdwT2F5SzFMQ0EzRnorRjNxMjZnaFd6OXorZEt4czFmMUpjS21WQThr?=
 =?utf-8?Q?v+F39wSmhhcJy02bGTsay4EBR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f0eee0-1c40-456c-5cc4-08da6a277d0b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 08:11:46.1761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v477SiasxL23d5+WkBLEjVI3IcPWQjKR/1RFQ4jPc67VlbOgBnMCShIgMNOVFpHoNHTZIBYTaS/cDF8OgKNjIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771

On 20.07.2022 02:33, Dylanger Daly wrote:
>> I'd focus on the booting issues first. And I guess you can take a video
>> of that (assuming that a single screenshot likely isn't going to be
>> enough), possibly with "vga=keep" in place (albeit that introduces
>> extra slowness)?
>>
>> There's also the option of using an EHCI debug port for the serial
>> console, but this requires (a) a special cable and (b) the system
>> designers not having inserted any hubs between the controller andthe connector.
> 
> Do you know if it's possible to have `console=vga vga=keep` and specify a secondary monitor? This would be very useful if I could have Xen log via a secondary monitor,

No, if anything it could be the other way around. Xen wants to use the
(sole) VGAish thing in the system; Dom0 kernel and Dom0 userspace (X)
may be happy to use any secondary (non-VGA) graphics card. On EFI it
might in principle be possible, but that would require (perhaps quite
a bit of) work in Xen.

Jan

