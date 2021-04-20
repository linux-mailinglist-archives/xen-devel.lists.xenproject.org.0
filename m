Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FDF365F03
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 20:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113976.217133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYukX-0000Sc-9U; Tue, 20 Apr 2021 18:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113976.217133; Tue, 20 Apr 2021 18:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYukX-0000SC-5V; Tue, 20 Apr 2021 18:05:25 +0000
Received: by outflank-mailman (input) for mailman id 113976;
 Tue, 20 Apr 2021 18:05:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NaoY=JR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYukV-0000S7-GJ
 for xen-devel@lists.xen.org; Tue, 20 Apr 2021 18:05:23 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1aa54530-4ba5-49eb-86e3-e17835d99aa7;
 Tue, 20 Apr 2021 18:05:22 +0000 (UTC)
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
X-Inumbo-ID: 1aa54530-4ba5-49eb-86e3-e17835d99aa7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618941922;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=gOWhaoJ/eSrdy0fFm6nFbFTLZneW09jRZhlTkuUCick=;
  b=ie/6liF7zR01FkYCfEs8U87vFHWAgv+P+CDAG1w4bDbJw1leXH0V8xPX
   FnOak6QAa59kp77TPbbOO17p2UKIO7jRELrz4ZxABfbxR08KpfEDUJbSw
   3Cg1h5qSVJNcp+xvXb3bZbTUbLpyJspLNSE0L+gPQipvEQL19+dLaCWGU
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Eq7pJjeEzyKPFW5l5j5GdXVRvbTEIZurdY1berH4zUAutWtTVR3z85LfwQGDaBeQwJ90rf8oM9
 iakrHZp7cqD8Z9v2csgBhdnGAJzNma4x5wg4l2jJ99oPRaXXxsodYGO3CZHUnoJclYl0Mabef/
 zBVUy5Lfw8aKMDEjjxqyixr8WPERFXcI7vGEkKsuolczDjt9rp2egGTLkjtGY7h7cTXolTcK18
 jx4l0hw6lQbZGaC/XskGgDHQxlIajQh0pyiv1vPpC1QxkPxEiEQJwdv0uxucFhSKAaR1p31Ayh
 BxY=
X-SBRS: 5.2
X-MesageID: 41846309
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BBGVEaonKD5p7BcdRBi1ZWgaV5tvK9V00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQU3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzI9g/I
 9aWexFBNX0ZGIVse/T6gO1Cstl5dGB/ryhi+u29QYRcShBQchbnmBEIyycFVB7QxQDIJI/Go
 aV6MYvnUvdRV08aMOnCn4ZG9XSvtGjruOoXTcqDwMqgTP+9g+Ax6X9F3Gjr3Ijehdu5Ztnzm
 TfiQz+4cyYwr+G4zvRzXXa4ZgTuPaJ8Ko4OOW2hsIYKirhh2+TDewLMdDv00FX0YOSwW0njc
 XWpFMYN9lzgkmhIl2dmwfn2AXrzV8Vmhnf4GKYmnfqrIjYQz83GqN69PpkWybZ8EYpsZVA1r
 tK1QuixuNqJC7H9R6Ng+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoANDiS0vFnLM
 BeSOXnoNpGe1KTaH7U+kN1xsa3Y3g1FhCaBmAfp82u1SRMlnwR9TpZ+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQMAMXNWwEW6IZR7XKmqdLRDGGcg8SjHwgq+yxI9wyPCheZQOwpd3so
 /GSklkuWk7fF+rBtaJ2JFN7xDRUGSwVTng0ahllt1Ek4y5YICuHTyISVgoncflie4YGNfnV/
 G6P48TA/KLFxqrJa95mynFH7VCI3gXV8MY/vwhXUiVn87NIor28ujScPPZIqvxAS8pM1mPRU
 crbXzWHoFt/0qrUnj3jFz6QHX2YHHy+pp2Dezd5OgcyI8EM4VWqQgLgVGl5sWGQAcy8JAeTQ
 9bGvfKg6m7rW658SLj9GNyICdQCU5T/fH9SX9QvBQLNEn1aL4HvN2adQlprT26Dy46a/mTPB
 9Uplxx967yEoeZwjo6Dcm7dkiAiWEImX6MR5AAu6GK6Mv/YKkkBpI+VKEZL3STKzVF3SJR7E
 ZKckstW1LWHDKGs9TbsLUkQMXkM+RarCjuC8hOsn7bvVibvqgUNwUmdg/ra+C4xSsNZx4RvF
 1+9K8ZjtO76GuSAFp6usoXdHliAV7nWo5uPUC+SqsRoZzQRCRMJF363gCyulUIVESvy2E7ol
 bAAESvCKn2K1JAp3FV1bvr+ltodmObO1l9cGx+rJcVLxW3hl9jleCMfaa9yG2Xdx8LxfwcKi
 jMZX8ILhpp3M3f7m/ZpB+SUXEnzI4pJOrTEfAqdKzSwGqkLOSz5Oo7Nu4R+JZuL9b1tOAXFe
 qZZg+ONTv9T+ckwRacqHpgOC56rhAf4LnV8Qyg6Gizx3gkB/XOZFxgWrEAOtmZq3H+WOzg6u
 QOsfsl+e+rdmnhYN+Pzq/aKzZFNxPIuGazC+Uls4pds64+vKZ6dqOrHQfgxTVCxlEzPc30nE
 QRTOBw6LXMPYJmZIgJdzlY8kBslNOUMUMtuACzAuJWRyBfs1bLe9eSp7bYo7smBUOM4BH9Pl
 SS6CVR9fbIVSnr789TN4sgZWBNLEQs4nVr++2PM5DKAAKxbudZ4R60NGS+fLI1ctnzJZwA6h
 Jhp9eGkO+ce3CmhETevT5nLrlP9GjiS8WoGw6IEfNJ9dv/OVnkuNre3OejyDPsDT28YAAEgI
 cAc0oaZMFKkCMjg406yTLacN2/nms1119FpSh6nVvs0JW86GjVHUtaIRTU668mLAV7IzyNl4
 DZ6uCW23T2/Shd1ZTCHElWeMtSG9J4dPmCEw5+bc4KvLCp+KIzgiNMJBc2ZlRM+gzA4w==
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41846309"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GofzJewmQR1qXiUrI7fyWalv0LNYMMegnGiPdedfANK36Q/13huPT6m3RHdkXp5buoZDxEZnGlFYQKKwkA5RlNhwZ11wlEk/mZ8AZPuYo7cK2jNufSy3OrwfhuPq39jaktlEdHtgBcePtO1rMH3wPCesICNpH1Owq2D1BTb4sRPY20BYpOcKx7lNk3OFvBy+3evmoByS87Axlr9VKcPcquRTy18DiMWqafz249rfzt8lLEWI+YOYezdEH77acerL9MOMwM5i5RzpgeJLZ6yx99lYyjAR4AvCWZ4VB5bR0D2A4f/06JsyN81C4fyVILNDLy0dN2PGKEy8A7mVwh1Wow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOWhaoJ/eSrdy0fFm6nFbFTLZneW09jRZhlTkuUCick=;
 b=TVZh9FoUoI8ajzvlF9BCWSW604FOVFU4l+k3nbL/zD++Ozv8nxoerN6ct8kkH+jlLNVCcaM1Bc/cki/8yz68gHbw8ivt687ZEODfs0zkk08weYy7mQuu8qMeu5x14zrnfzSAYppHnHdjMxcmgwUBl0clS1jCz0awlayRNs8ZtDEwPKefZtM1lwC5BAb+Sr2y5CsaSCOodoaqxzkJugdO9WvbBuczXYMb2yE3c9TJVrEROLAXjSAO4Bf7JuYaqUezCpNDqolkp7O6+IMaDRuGr+F1FcM++i27EPsl26aekDZsXERaOGaVq9GQW/kh1HTNNcT+fH4VjVYD5q/Z/bRB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOWhaoJ/eSrdy0fFm6nFbFTLZneW09jRZhlTkuUCick=;
 b=EK8/T6To3SSucHXtaGe+Be7IZWK3GdH+K49VkUU4srtSQ0/EDoPvJ54IMX8QTxcXLhtUfdwWtM77IfFq7coRsjGfvAM64DJAiE78NB/F6UyRIXE4fynWar1KIHq3AWvIqUkkciQxo9goQ8BQXXJ7QybVNREKTY4rRuq0U8mmJA4=
To: =?UTF-8?Q?Charles_Gon=c3=a7alves?= <charles.fg@gmail.com>,
	<xen-devel@lists.xen.org>
References: <CAAQRGoC7P0yg-JoH4dpxTj13=D_6F9e2kjXuG5WWdqAF8k8KxA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Writing to arbritary cannonical addresses
Message-ID: <78a256a8-b2ad-8a67-9b06-afbe2b11bd04@citrix.com>
Date: Tue, 20 Apr 2021 19:05:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAAQRGoC7P0yg-JoH4dpxTj13=D_6F9e2kjXuG5WWdqAF8k8KxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f4450e9-050b-4cac-d299-08d90426db86
X-MS-TrafficTypeDiagnostic: BYAPR03MB4869:
X-Microsoft-Antispam-PRVS: <BYAPR03MB486989FAC9213B9B0F7CB8E6BA489@BYAPR03MB4869.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EwIMg3axVDG4zI8EiLb/v03ABerKEBWm1VPfeSfHqb27n0fQ9SwJZrXP8/xbFl6w4R5l9ki7DJlEV9m1JX9l5sQ79dXgH9OpJS/qg+J3io9wObuhPYbPjFtSKGQUqPYmEvmrRsdy+bFarxyhHmG9gEYxNXyGqPCL8Oi7V3IMz0pCajhTpLWmwwCn4W6V0GnRZTc7DDjTmoxqU3++gGAFOla7hxI2Wp7g75jIFfa1Hmk0qlT6Lbt0Xi5jg6tW2lJeY6bpurKkZggc+Mq4sdj6luU7oQmt5sISUrm5k5873W3RKWK9zl4smZr+khgpGc+9i/fAR9IYEwbqMP6Zdy2JQa8juOvKYTi0i1IW3oGrdkdNPQEH023a9SjYMNsbV688osILAA6CPzdWjCBx+8JdHV4K7mKq1fLJ10XW7rZrpEmeSSggxAkyPbywi7h1KGea2VtY3kjm/T0w5ArUK87tC12ymgmaz+deNRzeZ5+x47nKMu6xMkXWsTlm3s8wlHMVWCkyXRrwL9oFW4++x2iWHyn01Kl1V8MMZtrlZJdaz+cM108wT3IIxrUxGc3/nux7MVlSOSsQjarBIGXde92scUSr+w/yBAI3w/hjvpy0o3pxiZu16dGlZ3N8iCUMgNbia4gHy8Hc6l4xMhXau1SQmK4WFxJquXGFUXaeF+0k2YjV0p1wSW4Ci3h2ZaGMtxO6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39840400004)(346002)(366004)(2616005)(38100700002)(6666004)(26005)(66476007)(66946007)(31686004)(956004)(8676002)(31696002)(86362001)(5660300002)(8936002)(36756003)(16526019)(53546011)(2906002)(316002)(16576012)(6486002)(478600001)(83380400001)(66556008)(186003)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RkZVZ05rVURHV2pHRHYzalhRZ1JHelU4UDlhVVhmTFRzTDY3ekdPQjJRNC9N?=
 =?utf-8?B?RG4xcmJBR0hFQmNPWVQrT281R0MwZFM2OFdJdFhONXhvc04wcmxEVkI3U2JJ?=
 =?utf-8?B?REdiQmJ5NEdoYXUrTWRWWG0wamJzYWFEaENXWTI5OTR3TmFmL3ZrZkF5YU96?=
 =?utf-8?B?ZjhlM2JjUDg2cUlVVGM3bUY2RHhIeVhHSWtreUg0SE9MTGppS2cxZXluRmJp?=
 =?utf-8?B?eW5vN1dEZ0xxNnJGdE9OalVoWVdnYnN2NVgzbXRFL1pmTEcrUE1DNVByQ2tv?=
 =?utf-8?B?NnE4Tm8zWUlkdWRvMnpqTE1PMVJGM3J5QTZnMmNpaG56a09QRGEwcEdadkd5?=
 =?utf-8?B?UzZOUk9FbUQrMmJ4Rjk2aEExbzQ3clI2bmdPREMyVVdWN0FxVnpIVmZoMVJS?=
 =?utf-8?B?bTJzbk1LbElzYXBtYkJkbldYZFpuTUJqZytrVGFpV05EWE1CNi9XNmkxZFVj?=
 =?utf-8?B?NDlyMW9Na3lURWM5a2l6ZDJHZVNLbmVrZzJzQ0ZBKzgxcEU3UTRRVmp5S0hq?=
 =?utf-8?B?WEYzTmpUUGI4a2ROUy85cVhlN2FBQjh1YWxIZ1lzUUhZMGQwZWtzUXJMSTI2?=
 =?utf-8?B?Wmx1TW12T1c3bjZLVTF1aG9rbkc4SEVDRDcrOS9HTXE3MXZ5SUh4ZnlXM1dE?=
 =?utf-8?B?b2NrYndma3kyemZ6YVNPU3RyaFFXK2Z1TWF1WEx4Ukd6ckNhakY3Y0N3SWY4?=
 =?utf-8?B?a1QxRWtPL1p0N3NSNkhFYzYrdFN0TzdOZUQ5QXNlZ2dITUpMeExQQ01DdCtT?=
 =?utf-8?B?UjhsRnJkbmxzaW5WWmN1bTl3dExuYU5STnh2YjBWTUhhMGpXTUxyQzhqR2FS?=
 =?utf-8?B?VG5waTRSNkhEM3NVaEY4cWhPL2t4eEVRbUw1TW1qb09UMWJiTjZHNnhVcURz?=
 =?utf-8?B?dG1UalN4SmhrNjdZaTl3cm5GUHpHdU9RbXBBZ2tMaElMb3ErS0VpQytsZUlK?=
 =?utf-8?B?M1VWdU8zMWVmTHJlcjhJRHZiVnZrK3N3SGNvKzhpdnRMcmtFTExOWXBZbjBR?=
 =?utf-8?B?bGRJVCt0WmFndVdhYkt4MzVqQ3ErSHo0Slk4OTBmN2NIVk1ISitxSCthOVA4?=
 =?utf-8?B?Y0pxU1ltMTZLUzdWR3doWDlnemYyK1hIU092WWg0Ylpyc1hRck5TVlRUdXFw?=
 =?utf-8?B?Y1VvdGFDenh5dkR3Mi9CSkFaNjdpMW14V0hJUmZvanR5NHZHUWJyMndOSmds?=
 =?utf-8?B?ZnJ5T1NVSGhSOU1nTVJOL1luR2dBeDdsSU5UN2kvWjhlYWtuYUh6WlpaTWsx?=
 =?utf-8?B?d3NyK0ZNVEFhMU1NSGIwYmZwcmRRbzZLcXhpZUk3MndWMzVpcUNVNTVXTm1N?=
 =?utf-8?B?dnNJNVJrMUdLbS9CZHZweGhKWnRoZ2RITW5zNzBuWHFQazE2dy9sZkNvYkJu?=
 =?utf-8?B?aHAwUDNIcUVGY1hVZldlRTF5MXVWMEMwVnRBcTFwRGtRczRpSnNwZlE0V2tC?=
 =?utf-8?B?U3ZZbzNQM1B6TTFTd2hnRzFoTFVSU25ueGR5cEhWVmN4ZjNvQ24vWGxwb0hq?=
 =?utf-8?B?WlQ1REpBM3hkZzA4Q0s5SWxpVzJZZUkwMVRkVStCN2FQWHBhd2IrbnNQY0NR?=
 =?utf-8?B?OG5qdklhREhuVjNHR3lIcHg3RkUzb2ZqaUcyc0FscldrU2JoU0RhdVV3S2Ev?=
 =?utf-8?B?bWNHS1I5MHFTN1FiZjFPU0RYWWk3MDVJSmVwVW1SK28wT3hQc0pRQlF2V0NO?=
 =?utf-8?B?L3hXOHRiVjQ4MC8rZWNla240djlwa3N3Q1RDYkROWXZpTXFzbTErRUcvTE5l?=
 =?utf-8?Q?kbbxhgW49xwX1wuwFCmPjr1Hr6y6Vga2/Oi09wG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4450e9-050b-4cac-d299-08d90426db86
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 18:05:19.0348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dot5b5MYtLNEFOiWyYcDjF7HLUwahyIpi2o95GlJYNqbo2CAMBp5ZYe/E/BNn8B25qKMuywbB+XwkzxXYqbczsVxXNQHUGc+PKaujMNl7ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4869
X-OriginatorOrg: citrix.com

On 20/04/2021 17:13, Charles Gon=C3=A7alves wrote:
> Hello Guys,
>
> I'm trying to reproduce old exploit behaviors in a simplistic way:=C2=A0
> create an hypercall to write a buffer to a specific MFN.=C2=A0
>
> At first, I thought that updating an l1 page in a valid VA in guest
> kernel space would do=C2=A0the trick.=C2=A0
> But for addresses outside the=C2=A0 Guest-defined use (0x0000000000000000=
 -
> 0x00007fffffffffff ) is a no=C2=A0go!=C2=A0
> I get a page fault with=C2=A0 'reserved bit in page table' warning messag=
e.
>
> Now I'm trying to write to the address inside the hypervisor code, but
> not sure how to do it.=C2=A0=C2=A0
>
> Any comments or tips on this?

So you're looking to add a hypercall to make arbitrary unaudited changes
to arbitrary memory, to simulate past security issues?

If you're seeing "Reserved bit in page table" then you've managed to
corrupt a pagetable entry somehow.=C2=A0 Xen doesn't write any reserved bit=
s
(which it doesn't know how to interpret).

I'm afraid that if you want any further help with this specific failure,
you're going to have to post your changes to Xen somewhere.=C2=A0 pastebin,
or a pointer to a git branch, or whatever, but my divination skills
aren't great...

~Andrew


