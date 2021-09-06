Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C601C401CC0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 16:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179973.326440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFGE-0007M0-Bk; Mon, 06 Sep 2021 14:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179973.326440; Mon, 06 Sep 2021 14:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFGE-0007Ji-8Y; Mon, 06 Sep 2021 14:06:10 +0000
Received: by outflank-mailman (input) for mailman id 179973;
 Mon, 06 Sep 2021 14:06:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNFGD-0007Jc-E4
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 14:06:09 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0765f5c-35f7-48eb-a7c0-38d7e605088a;
 Mon, 06 Sep 2021 14:06:08 +0000 (UTC)
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
X-Inumbo-ID: d0765f5c-35f7-48eb-a7c0-38d7e605088a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630937168;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dP5NkI57FysLi5fpG0vY0d9VkOPvehodDZ8TCsHz7rs=;
  b=e/lePDMKb88YSVyT1UCF/+7Tsz6RyIvQSpkNsz7uvqaS6JD3xYTpcmvI
   Nk+0ERwR1I8UiTGRqMSDv3Q6HLC8iU8pug7l2UhFFRCr9XfQx7qoIlrUc
   vgpxIDU+/vMO/LyZmyCjty6xvj+hveVyWSzmCsRoi07dh4i2ZXEFNlKxD
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: i20T5t4R1ZJa3d26qjyEsHMuRn1W1jpNe4yzzfe46ZNz1PT5dGaOdjW3307cp9wLCdOw4PsjMT
 Xf+0/guVrIPzMESAugdIQKIBmdM2U66COih1hkrU0WpbtXXAbZUXhZSrNX220sdnG4r8j7vkOz
 OCBo0XShrW146ES54FFx2rj58Cd2Rf2Z/w77Ia1JU00lT0XIkvjIhFOT/dtRgi6RRIeQENoW9s
 hz1aeWUy8jlnwX5H9WHOYek79JIoZ0K8tNqKWfvKGprgBajCkUsrPJFGMfnuREQBp0zjaUTI4N
 PNkFfkKktkreKjpiUI/s/Z/V
X-SBRS: 5.1
X-MesageID: 52080161
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:xkFLT6h4cUPukwHoDc8dBVSmhHBQX1N13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskaKdkrNhQ4tKOzOWx1dATbsSkbcKpgeAJ8SQzJ8n6U
 4NSdkZNDS0NykGsS+Y2njKLz9D+qj+zEnAv463pB0BPGIaCdAT0+46MHf9LqQffng3OXNTLu
 vk2iMonUvERZ1aVLXAOpFTNNKz1uEj2aiWLiIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7XjoyWsllP73tBzop/M29FDDMuDhow8LSjtsB+hYMBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhMF2dkF/I4U3NwTwu43jtxRuxhmbim9XwQHYAB89IletiA1HkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooFI5+NRjzUB3YM87Uvt8vIYf9ERaHNMrByTh8r0qF+
 FoEYX1+OtWS1WHdHrU11Mfg+BEZk5DWituf3Jy/fB8i1Nt7TZEJgojtYwid047hdcAo8Iu3Z
 WcDkxq/Is+BfP+I5gNXNvo7KOMexrwqCn3QRavyGLcZek60kL22uvKCYoOlZaXkbwzvdYPcc
 f6IR9lXVBbQTOmNSTJ5uwRzizw
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="52080161"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oICJRuD1Wix1rzV8+iChMMRYDECxQK+2Bc/XhW4aYl9uyaqm7Rcze38/T2+FhgXuXe4IDcWvfCxS9p39GIrUBjr0zE/0p4Qa8n2pGGQKREeSZJNeFNhqwwkyxXK28Z6UL/g3qfaynMouf97sWhDPy+Q56AnUDcp2yl292zsGxfh5GpIX9WwY0rZgbobu5gDZvuOKhkoZeEhb6q/n0igNMoB+0BPTtjWGDqT5LUTWa94/LNafvaPx80NTsuYpU2IdvwgtdKc/c5hEPLBM/rJ6xGN5fzlruaI6FsamV+vdxEZHJjNCOU9623+XNieUlAIu1xr6aTvXw7E1jic348/Erg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dP5NkI57FysLi5fpG0vY0d9VkOPvehodDZ8TCsHz7rs=;
 b=nddb8BYhRQSx//I2snXs91d55aNAE1zhEBSvvabNUc6D+axS7/8Uv2QzNx/32H47YfLM8W0LkzmL0ALnsYJ+3zgKLN6vof+jdDs5LVdBtHePTQxZVRr52NT56HPntKs1nvyG8Js5+kZtMTxNRsHtG362aJLRiO6hMCwGJVypnjKeGEn760z+9W67ZKAEwdpkeWBezg1Plahw6YgJVnSutKKaffizerFDRv8I1HXB3oN93eYYym8QY2Yt65gG40NzrJDNJjoiKZuw0D66wLfOOjvsALFEQR6zBoGXWIIjODFoFEqDJ81OWEvTaZsFtrE7WgDrUrScmGCT7Ql8fhnL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dP5NkI57FysLi5fpG0vY0d9VkOPvehodDZ8TCsHz7rs=;
 b=Xd5F4ABKfnfSk8EoPKzG8+st5IyRaDFwRbWTyWVsweJz34TtrGXwAtvl+YvMvatlomvsfJnJuKjmS6EBnS7frfwaeXlxz6YGxJgU1URm1dgEQFs8R49o0r1oijrIaQ4Ca5+gYjyefed7VoP0PtomVTyygcO+SRtyna0DKQwHNaE=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <062bcbd3-420e-e1c0-3aa0-0dfb229e6ae9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/9] gnttab: defer allocation of maptrack frames table
Message-ID: <c3c20938-ba34-965b-0f1e-8d72c8004cc6@citrix.com>
Date: Mon, 6 Sep 2021 15:05:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <062bcbd3-420e-e1c0-3aa0-0dfb229e6ae9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0250.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6d49d6d-5b04-40ff-3dce-08d9713f6555
X-MS-TrafficTypeDiagnostic: BYAPR03MB3688:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3688862C6869B863433C842CBAD29@BYAPR03MB3688.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +La/BxplHFP6Ntc3uPovdy7OBfJnaV2wou+x7wSE7NdYDNU09LhPs7HGQYuJsejafF6EQHpgL1DAH1WCSvj6ut2SLF+h/F3VU9SNTN/q9NJTEh61y5As1SzN7jEGCOR53ol2eNB7bBARFU/bq9JTWHc3bF645btDuE6z9o0SZCxEBOdAd28vS6inaeocCAGTuFX7NQSEN60LNmWAA59ksf6h+wZh+kXbbep5UCAjbCiaviDX1XpXOjjdZH0+PTFi7phgTyn6HCmrdO8s2LewwVYLfz+UP3XAfQPbseMcQty4QE0KLpJ8rrmUyf04gfKp7gqSDbgVCZLXYNG9Mr++1P+CUpEtZSQ9e2+LGVpcI4O7mBWOzxSdFRzA3Svinn2ar58v5XFcl9rmOJTfbsldV0pONNmHLs2rQe/vGd4I4OjeM2m4Yt4Gts7G3zRk6quYEbGIkphPUuwQK/X5bOEYUcv5vsxiaQCDLDjcwLPM8L8ylXCwviMLNIuj979t4mVQWOKM+XJ+yL2+34Uwpmsm/BeD32S/+GRFTVxakuU3qpI1op6zTALa4Vw7ytRH+wP7TxjRGmU3Tm/Ci3onRxxYjVOynvl3cnP2pbcup2AijlDw7m50Qc8LVa0e5wpD7u5bVwKqe8sIfqmnQbDEWcuLwSnSPpCa9nTxFoVaZVleMrcZw5VAb0lIspw/2WaWRUCXjoGujKrbQNeToW/B5B+WegVLITT0XPuXLIgN79g0OmU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(6486002)(55236004)(31696002)(86362001)(53546011)(110136005)(2616005)(66476007)(54906003)(66556008)(186003)(956004)(6666004)(8676002)(66946007)(316002)(4326008)(16576012)(5660300002)(8936002)(478600001)(31686004)(2906002)(26005)(36756003)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0NJWHg5K1FrSVpsK0tVRUVLeDlJcG1KU2laY2RhVno3VUhON2ZhdnpXcHdW?=
 =?utf-8?B?aXcwOXBnVkhyVnZCRkgyU3pCTFhxUjhmRk9iZ1dSMmszRTRJSjhpcFdobDZC?=
 =?utf-8?B?RGt2WUFTNmZWM0xPT3NuTzdtOFJWdWZTalNCYWxhNWdwWk4xWDB2cXBGSnBl?=
 =?utf-8?B?eklVQnJHYU9JNGNPdCtLZ3VRR1V0b0l4QU5qUER6WW5ib09mU0srZFBqRnFj?=
 =?utf-8?B?VkdRMGl6TStuWkh5MEdlWFBIeVlkRUZqaHZucFBBaTVicXBlamVKamV5MmhS?=
 =?utf-8?B?QitEUk1CTTNhZ0tCb040MVdtWVZFN3d1bExKK05qOENOai9sMUdPdmExNFFD?=
 =?utf-8?B?NUZtaGtWSXVlTko3aVRob3V3dk1HY2xlNEo4RHRuN3hCbE85RTVlaUtOUTVG?=
 =?utf-8?B?Z0g2ZklKL09xQjJKY2RmYkJReG1Qb2QyYWl1NEtnT2g3RHM4dDlMZkZrUHhk?=
 =?utf-8?B?b0JJREpEemFwTTF3OXk4Uk0vWjBVd3E5b2hQVVMzRnVDUUpHN1duU0NZRGlR?=
 =?utf-8?B?TnRDN3FJRm1Ha0lHUVpSbmtsNVgwRzRwTGoxN1pJd3EzKzUxY29pQ1doV0Qz?=
 =?utf-8?B?U2VOb01ON2xNVlFUeTBaTnUrYWd5Uk1menU0ZzV5eDg2YzdIVStya3lWcVVh?=
 =?utf-8?B?eGJtNlRpcW5KUlNPZVkveGJDOTExZFJsQm5sbTJYWklOcHdDWml2S1orVkFG?=
 =?utf-8?B?OXJ0a1h4RWc3MHlXKy9kc0ovZGozdytCL2JvZE5vdHhJUGZoanZkbUplQUtD?=
 =?utf-8?B?MlF3SHdVNk9qZFllYjZVWlhsYk5CSHZiUlFTSVNNaUNSMTluYlRWZVBrcXgy?=
 =?utf-8?B?aXE5ckcyeDZnS0NvYys2a0tsOWJmRnN1QXdLZFVKNGZMZXJUMURFVEZYMDdu?=
 =?utf-8?B?bkxQcjI0dkRCZGM5cUJ0c2RYb2loR0g5elpzRnVaSjN0R0RxZThrSnlmQnBF?=
 =?utf-8?B?ck91UWpDdzRLcTl0bGc3RXlobnVPWHRrdjUzSU9mRGczZi9kSlhtMldSSVRn?=
 =?utf-8?B?bThFZTlqZmZHY2p6WnZmdFY1eXM5NUxUQXFSL0ZIU2Z0dnR2Nk96QWRxM0Rk?=
 =?utf-8?B?c2hTaGgwb2lLSUhZWVZ2TGRQdlJucVVoQXlROTc4VjQwNlZuV1ZUZXhyRzhD?=
 =?utf-8?B?VXBXMWI2aHpNWS9jZ0Z6YVQzb3I4Vm1HQ2N0bGdtV0dLUzZCUThzVEYvdXJE?=
 =?utf-8?B?VGtaajVtSTRpK3E2blk0STZsUWh2Ti9sVlZIMDF4cUdvZmg4bUJsTTY4c1Vq?=
 =?utf-8?B?ZnpBMlBMNWNZQmllcVQrSldCb1hDUmdON0ZrWjZSTWI1WHNRWjlNUmJpL0Jp?=
 =?utf-8?B?NkJZY2F3VlRnWTEwRkRNZldMQ2hjckh4K1djVS91NTFvNmlXclZKdnRmSDd5?=
 =?utf-8?B?ZUxkelo4ZG56aTg0NGJtTFkzTmxsWU12dU40bGUvNHJKM1V0eGJQaUZPQ2Zj?=
 =?utf-8?B?OGxiQlV1NGZzaWtpb0lZQU1uWDVLU3c0b3Y3Qjh2TlhLTXpRVG93QmRKaFdq?=
 =?utf-8?B?TlRzMXB0VTkzOEpWazJXcFVkK1JpZ2hSTFR0RXloWGpkVkxYa2gwOWppYnRZ?=
 =?utf-8?B?eUF4L1lZUDZyUWJyV3V2eVRCbytEeHFCTVphMmV1WThwb21jelhqNXlJOTVI?=
 =?utf-8?B?R2lxOENKWUkrYVlUbjdmN2lzYlk0WXBVejZ2ZkRhU3F1d0k3bm5oMnFKbGlC?=
 =?utf-8?B?K2ZrNHdUSDhaWE1aTTRMa044NlhZTUZtTnZLbXpzZDM2eFZ2M29WcDgxYXUw?=
 =?utf-8?Q?IQmQYD+E9gKEW9Qb9U+n+Zwy/G1S7+V6xjhmKPM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d49d6d-5b04-40ff-3dce-08d9713f6555
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 14:05:34.7748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dX1LEfbM2fED8zEFrlDH58w2WQ/yb/6FfwrLBPjGAtmzn/83luso7XKX/E4Pp2779IsXCeV2TSsNX1C5XoEL/xt4EY59kYzinFjB5pSmYk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3688
X-OriginatorOrg: citrix.com

On 26/08/2021 11:09, Jan Beulich wrote:
> By default all guests are permitted to have up to 1024 maptrack frames,
> which on 64-bit means an 8k frame table. Yet except for driver domains
> guests normally don't make use of grant mappings. Defer allocating the
> table until a map track handle is first requested.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Nack.=C2=A0 This creates new dynamic failures outside the VM's control,
therefore regressing Xen's usability.

The maptrack array (and frames for that matter) should be allocated at
domain creation time, like we do for most other structures in the
hypervisor.

Furthermore, seeing as this has come up on multiple community calls, I
will remind you that it is not just Citrix as a downstream which is
firmly of this opinion.

This entire patch should be replaced with one that...

> ---
> I continue to be unconvinced that it is a good idea to allow all DomU-s
> 1024 maptrack frames by default.

... defaults to something smaller for plain domUs, because this improves
the general case without leaving VMs more liable to crash at runtime.

~Andrew


