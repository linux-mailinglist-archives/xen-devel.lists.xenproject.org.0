Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FFA2FA893
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 19:20:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69968.125483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Z84-0006Jw-LB; Mon, 18 Jan 2021 18:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69968.125483; Mon, 18 Jan 2021 18:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Z84-0006JX-HN; Mon, 18 Jan 2021 18:19:52 +0000
Received: by outflank-mailman (input) for mailman id 69968;
 Mon, 18 Jan 2021 18:19:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1Z83-0006JR-Ed
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 18:19:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48ffa60b-4d06-4d77-8c24-41f79b2b5699;
 Mon, 18 Jan 2021 18:19:50 +0000 (UTC)
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
X-Inumbo-ID: 48ffa60b-4d06-4d77-8c24-41f79b2b5699
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610993990;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=z0+0EB1ysMAlWUbB7C/8nrwJvMrffNSiLCZSKoDoudo=;
  b=WFIQT569EP+ztbri+2pp3swL0hTWURG+60vys524iSmFXLP5CBlw1DBd
   MjpSDC2TxXv9wZtIxHOZGAzntdsTER40PXBlTDNFx6Vmwd6kEBLa3qHWK
   KmSLejvxkiwba359r5P7vIjlcN6MTmJ3CC+YGK0ktayQiaSGL1mThz4Gx
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: giPp+q+rRMQy+jpZI/fg953lNt+hKfZXhr5xPgdlQPWj/rpOpEVZlqW9909d9dgocO3B/cAn9j
 BATzA3/JGqah1aDHHStO0D4BBNqHWbcRAmikIYp5zqady1Ek0iskds+rirpdwVGd2EdTltdnsZ
 ntEInz9Sz/3fT0Me8Y3FM3r8wQ59T4sBvQlbPqsVTkiuQXnnVVimrfn98D90yjoRiW0bAcICca
 qvMXnY2bBmHr0Rnd31pYUUu7M4RYngv6VHLzpYanPV/51dE71qEc0RbpkONGdgc6QmSHas6WiA
 qnw=
X-SBRS: 5.2
X-MesageID: 35319811
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,357,1602561600"; 
   d="scan'208";a="35319811"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkrnx/LSjcRRm0h93z5LfGnTiHgBkMSIjV4Qnx71DYgViSNYwXXXuTC8zqL4yQTQFdkUJ1W7XHO+KBkkzhv7aYInWjSyez4NUSZJ7VgaFi36N4DR5LZh3cKplZRgaiItbP6ia2dfQAhjkiZ0h2Fn4kHTq/I17Qzc5V00B4l2yrVIjuubAg0j0/25GHB9iEcCd7hACpJ34eNjyDkJRezeUKMGiTv0CZhd1RBNv3BDhKNO0u3q29yyfEZj05mCSMCPejbe4SohbPxZHYyHXYen2IcgRBLM1NmzWotb8ZFJ3g1BdI8JTltnyihP+tjikxrAZXi9sEMijpeIZvpJE/Z/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nHf8gtYEuNY4iZyaDAU8XuJuqChXz9UixpC3/796S0=;
 b=MmsRg3d0TWCb9vHL6xg7mK2gKSnKjN0gYwdLBEzE4T+tlOG+ClQyLKT1xlqJX7s5CMUa2RzjQ4FcS80bgRkubjR+Obrf1dA/TxI0PbkAmAXowbXyth/cFDVZDYpDvIb2vlfK9ng0LYM3jg/eQVcJJeZkqMfc79GzGBe1Xt7wew3azcMsywLGVMmXz7xb3ZZkcJcHmPEaGnq7tORmpIYNx8XBxhJa4tBDnAHTOq1/D+kvQmxTIcOHX9X9DQtPChNJ5bhMsHgiBu/rkiCoo3xdNi7D++aZbbRlepsT0dTyyxt2G9gNuthQEHNzgfphzcN0wuDq+pU7MFs8YiE5wQZplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nHf8gtYEuNY4iZyaDAU8XuJuqChXz9UixpC3/796S0=;
 b=HA31CpLaoTyFY0QmFg0Y6iLLPrHt3976VwHmnZGeVRin/WGLaXxipQhTVqGlGnNXcTcwj81P4NGDmJdVkPlSH54DnZb+sVI7jHhYc2mAILPHEGKOntMXRk1zeDpKvf4Wwh3qhYgda6SIMMWs8G6upR4gtQmmCWbJiw634dnDioo=
Date: Mon, 18 Jan 2021 19:19:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: fix tv_sec printf format
Message-ID: <20210118181941.ukh4j3f5tizkrdqt@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-14-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112181242.1570-14-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0173.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::12)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7caea8c6-e39b-4259-3fe9-08d8bbdda25c
X-MS-TrafficTypeDiagnostic: DM6PR03MB5321:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5321120B26E41CFAD7341CE28FA40@DM6PR03MB5321.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZsmWY0D5SDySGNhy+eKFN7rlNvj49BJsux9M3Vp5SRJzEobfQalw3Y6LT/9dJeW0vSTv/wWJNUU8ecRcdkdyWuNe9MPhwiVgJJq6DVEtOz1Xi9CJk5iMu10MR7QWjJM4DAJSOP9PjeOyjjwsp33E0nARhoukxn/JqgJhS6y5GhK/8SY7DNK5AHBiKsacH3uRvVJS0Oy3+ekadgISN7eg21j6xWOPZJuzme7JWBCsXUjsOMBng4uRQasZU1Cvq6NjbwhsQkuhbwuTvz57GagUWu4+WmqM2umXe5SZHY3lkB+gM2fdYqGSTN6YQJwcx5Yl6jwwApo85HwfZBYOm6w32WrCPOLFdsm+mOilFO0EurA1kS26w39yDoKwuPuunLcVwwQoSC3v6HqA8+yVh/3T/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(1076003)(66946007)(66476007)(66556008)(86362001)(6666004)(8936002)(2906002)(956004)(6486002)(8676002)(9686003)(33716001)(4744005)(5660300002)(16526019)(186003)(26005)(107886003)(6916009)(6496006)(316002)(85182001)(478600001)(54906003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K2tFL25kN0twK0JEQWxlTDJnMmo0Zkp5K0p2WDlSRWhaOXc5Y1AzbWFKaFUr?=
 =?utf-8?B?Y3dxcHgvazhoUGgrQXhvN1NqcmxCSjdxM2VFall1eXo4TkFsTVJuWVdFb1hC?=
 =?utf-8?B?aWh4Rnd2SkFicW1QYTdqSjNWK0dQQUhFajhXWExYTkhUWmY5OGxlSFNSL3J4?=
 =?utf-8?B?c0NxMG8yMGY4SVEySVA2bndvcUhiTnNNT3l0RzljTHFaa0R6L0lZNEFMV0R6?=
 =?utf-8?B?cys3VWtDRnhCMExyd2RRanl1YTUzSjR0TnVKVTB1azhQa3c0dDJpTVR2c2Ir?=
 =?utf-8?B?RlRwZk9Fa1RRZUNScGxEMXNJWVllYlRIY083Yk5DR2c3U0hLUlozeUlmZ253?=
 =?utf-8?B?RkF1Zk5PdWVMU0RoNW56SVVFNnM4VEd5dUVXMjYwa3BSRlorVDZYZDRjRFhD?=
 =?utf-8?B?WndFeEFtRjgyRVZTUTJISTg1UE1HWGZpbW9iZGVBdlQzamZTNUh4OG5mMW5p?=
 =?utf-8?B?MHhveWp2TGFmVnR3TGRmM3pCWEJzMkVoeW5LblZZeEI3TG01SHh5eUdKUnpR?=
 =?utf-8?B?alVRVlhFdkt6VkJ4d0RRRUt4QUYzL01NajNVL3FFcFdocGx5Ym1Sb1V6YTJC?=
 =?utf-8?B?bE9GYzZ5YXhmenc5KzV6RFA4RnQ0aytkdk5EM1M5SFZUaGtQMldTdzFnQWVS?=
 =?utf-8?B?VUVEMHk2NFVySnBod1U1N3lKcmNuWnJsWTNxWGEzMnFqcmZrOHR2ZlBjVnFl?=
 =?utf-8?B?OHFyVnF1a1FHaDZsclZxRWMwa25RYU1MSUFBVkkxQVlCVGJFYXBaSmQ2RU43?=
 =?utf-8?B?ZEZ2RnNpVGFBbHFzcTY1Y3VVVkpZcDhzb2ozdnkyOHBKQTZmTFZPTXNUYUgv?=
 =?utf-8?B?TUtzRFR4SGtQeksvekR4Q0Z0Y2pNWHdiblhDeDhjRlJqcjd4VlFUTE9UWGRY?=
 =?utf-8?B?UHpzVldIeElScjNNM0RhdjBERTFlZkhRMGQ4endHU2U1KytzL2JVdEY4K2Qy?=
 =?utf-8?B?cHVvRzJSN2ZiSGlIMG1Ialhicjg4YXcwcU1pZm9IMTBwZFl2dXhrdmcwR1FM?=
 =?utf-8?B?T0tsVkZNQmU4SVA0K200aHZGL3ZYdkljN29zbkZNZGNxZmN4Wkh0U05WZFhs?=
 =?utf-8?B?N3dBemwyNEN2VWJVNUJZcjV6OXdxcEl3ZXF6RGd6RVgwd3NiV3JrNFBrUE9u?=
 =?utf-8?B?SFZNdHp1TzdEWTRGY3o1b05TQjdCQ1MyV2ExWCtIZXdjSVE5RXVKN25YMG9E?=
 =?utf-8?B?ZkZyTWxUMk5ISzdoRkNJandibHlaN3hmSDFPUmVaTmVwZ01la3ZuWFdZb0xR?=
 =?utf-8?B?a0t5SEpxYjZpSktWL0pIdURnaUJ1cEkzdUJOUEgweEQzeWYzK1RKVEdOaENK?=
 =?utf-8?Q?v91pzZ7r4lnOaJ3ydI5Bofn5p5goTWVmG7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7caea8c6-e39b-4259-3fe9-08d8bbdda25c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 18:19:46.0261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGhR3vPX79HSt4KykdcxIqXMiCjkjJzvOgxbzGuyWnKiuMPcOT13E/SXH8eJSyyDAYN9GH1eo+j1clURs5gmgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5321
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:34PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> Don't assume tv_sec is a unsigned long, it is 64 bits on NetBSD 32 bits.
> Use %jd and cast to (intmax_t) instead
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

