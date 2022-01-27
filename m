Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C6E49E752
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 17:20:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261620.453151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7VN-0004MQ-TD; Thu, 27 Jan 2022 16:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261620.453151; Thu, 27 Jan 2022 16:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7VN-0004KT-Pw; Thu, 27 Jan 2022 16:20:13 +0000
Received: by outflank-mailman (input) for mailman id 261620;
 Thu, 27 Jan 2022 16:20:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5DO=SL=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nD7VL-0004KN-Vf
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 16:20:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fea20377-7f8c-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 17:20:10 +0100 (CET)
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
X-Inumbo-ID: fea20377-7f8c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643300410;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Rz4MeOqmOd6nVkvhcy1G9N2jnczBmfonv6t51gRcFzU=;
  b=HzP2Dz/lNqdUsJoTP9RyDO6C5Ov7RszbqOMTfOQ6zjJgGH3kXusI4Xpk
   6edIXgNzua4+58hwQkOWnegCycTWivw4eX8eXyX7Lt/semXrC6EHS66y2
   GopAvWdH39Gvs8im+0sotHtCYqTpx2ebETYLU7QzBj1z5yFx9Ns/ia4yX
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cnb8f63fWneYzH8TwNljrh+cENDrdcpqhtYr6vaPNp+hcDmQOlNQClkWBDMUAugnZaDtx6QHP2
 X4w8BuecxPIfe7pkWBZUI/P6icJ6mBqlgYgaGpg0rMRW7i9HMB1/bYIUPyK59YXXi0wi06C5K9
 9E0ctGwBksE3cy/ihLugn62yajxRUHeWm82CR0PW3pct2gkxwoN4HRCasUtB8W0NA+9I5FiQc5
 VlpPN339Jdd0ObvULjVbrzdpNtJHzuAQzI5kXtw7nYWnz9Ar914TB4C+3R2AEt1xDCkvJnqVbo
 YzEXcwSnzNZnKcOsrmlmw2Mq
X-SBRS: 5.2
X-MesageID: 65085203
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JKTUV6luAypR/eU99Bcr7+jo5gxsIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLCm+GMvaPMWuhf9t+O43goU8AvpTTm4AwTQI9pHg9RCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Q32YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 N5VmoWgcCMtBJHByc8gAyNEHHk5BaITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6uGN
 5dDMWEHgBLofTRsYwszDZAEnbmVrWHVdzp/8w/Eqv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJbC8Ij+DipzpDo7leyOzg+UjEZL+Qp4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HwgbQ4xawZRGp8crVnl
 CJZ8yR5xLtWZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBwzaZ5fJ2KxP
 R67VeZtCHl7ZiXCgUhfONrZNijX5fK4SYSNug78MLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOG8yT50n5gNK2OS7EIZ9YYQDmRr1os8u5TPD9r
 ow32z2ikUsPCYUTo0D/rOYuELz9BSFrXM+t850OKLfrz8gPMDhJNsI9CIgJIuRNt69Uiv3J7
 je6XEpZw0D4nnrJNUOBbXULVV8ldc8XQasTMXN+MFC29WIkZIrzvq4Te4FuJess9fB5zO4yR
 P4AIp3SDvNKQzXB2jIccZii89AyKEX13VqDb3i/fTwyX598XAiVqNXqSRTiqXsVBS2tuMpg/
 7D5jlHHQYAOThhJBdrNbK791Eu4uHUQwbogX0bBLtRJVl/r9Yxmd374gvMtepleIhTf3DqKk
 Q2RBE5A9+XKpoY09vjPhLyF8Nj1Q7cvQBICEjCCv7isNCTc8m6y+qN6Ub6FLWLHSWf52KS+f
 uEJnfvyB+IKwQRRuI1mHrc1ka9nv4nzp6VXxxhPFWnQawj5EatpJ3SL0JUdtqBJwbMF6wK6V
 ljWp4tfMLSNfsjkDEQQNEwuaeHajaMYnTzb7PIUJkTm5XAooOrbABsKZxTc2jZAKLZVMZ8+x
 bZzscEb3AWzlx42P4vUlStT7WmNciQNXqhPWkv222M3Zt7HEm1/XKE=
IronPort-HdrOrdr: A9a23:6InomqFUIV+YIYRipLqFTJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVp2RvnhNBICPoqTMuftW7dySqVxeBZnMTfKljbdREWmdQtrJ
 uIH5IOa+EYSGIK9/oSgzPIU+rIouP3iJxA7N22pxwGLGFXguNbnnxE426gYxdLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxs4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1Ssl
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGYFq/QpF5d1H2mxa1+
 UkkC1QefibLEmhJ11dlCGdnzUIFgxes0MKh2Xo2kcL6vaJOw7SQ/Ax+76xNCGptnbI9esMoJ
 6ilQiixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MYiFW5uYd899RjBmcsa+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zs93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkfgIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehT1Yd0s8LAp23FUgMyPeFPbC1z1dLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; 
   d="scan'208";a="65085203"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cskUz9heUgDt6tXwXzd9jCO4ArhDYU+UHen/AzoxwFLhkx8d00ifli7fNNQ4bEdBka3X2Bq/hHoHKF/Au5DXfgS2PXPwct9H3MOViu0FH0Mzj7nfiuydmg76vfQ4kTIZ+ctcGnywlVwxmFgNuqsyKV/xaJJLoNZXOXYeJRwT8uhydg8lDbDlAJQ5hkp7HQztI/qFO1Re7uQAU5xQ2vf4IV1L5cF/ZqcJrHFNO/bjmzLJAtlJwuVimWjIOA7eGBF7CLyGnbmJ9BQ0eizbk0LVmAxWvUVu0pPArDDnbwldvz89AJgvtAdGMZ1Y61WG76MN8fLPsBohnStjLtbSIyognQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rz4MeOqmOd6nVkvhcy1G9N2jnczBmfonv6t51gRcFzU=;
 b=STD8bQXv6m54dZzteIbD0NKZFl6w3MsoHQtFkaC7Vgk0NbluqnlWDwO3qZOK5uNHjHzOtCEdxAn0DVuElJPYGFaNatpMebbQC8RRlUutv/EMgaEiHLjgnCE5QpmHoXCUKy5qt+XA+dIzfpR9pwXgBcxch9B5UutkImLxye0156dcEtix2sgaCvtZVBxx9pJxlVxW0Gf9N0+iLNHfrgSXI70ipTJBoWUbb9WXrjaf0hS/YoPRrXeQhp/6P/Ob+DdRdZDcmTX910Q1MqBQG1MjMSeKOXk5nXWf0DgwKO+LJdC47qp30dk6ktih00T+UK4NHF2i/fC98x4LeqgrfkTPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rz4MeOqmOd6nVkvhcy1G9N2jnczBmfonv6t51gRcFzU=;
 b=Ql0mWKyg1tbokVt/mEghWuDBl8+tZsP4TmmvnV7cJUCKLHq/vtwHXvcJzMXwy5Hw2OJs5B0GJI9wQMTSNJvdkPEQFS5Y/pDXGQDYal6uVo26D6lqxW5hII8IslZYosrmm3mP08f/HF/tgfGYFJdyOrDOb9fpZvjCBlxTjfaZV/E=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] x86/cpuid: Disentangle logic for new feature leaves
Thread-Topic: [PATCH 1/3] x86/cpuid: Disentangle logic for new feature leaves
Thread-Index: AQHYE5hplKNdaXkno0SC1jCd8+jv06x3DEoA
Date: Thu, 27 Jan 2022 16:20:05 +0000
Message-ID: <50f43491-e593-af32-b3dd-9a4102c64a7c@citrix.com>
References: <20220127160940.19469-1-andrew.cooper3@citrix.com>
 <20220127160940.19469-2-andrew.cooper3@citrix.com>
In-Reply-To: <20220127160940.19469-2-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcf22dd5-bb14-4967-557b-08d9e1b0e0d5
x-ms-traffictypediagnostic: BN7PR03MB3476:EE_
x-microsoft-antispam-prvs: <BN7PR03MB3476B511FF58ECFBD672D060BA219@BN7PR03MB3476.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D9cJHPVO6CcRJFvv+td7Yb6mNHgWs04rcdUQX81RFMbdlVceE07Qa4PSfRE3LqgKec2FphtzaHWw3bDRsfZS9/oggdwYcTRdYUX/EcFgiXLafrDKIROsfjyKboETveaSCmU6/gxwU1DojCn7jrdj7GM9YfAcqbdeFCIaSJqiiA9I8j+A7rR0IxXg2iph1vpCJOSSTwpJNC412ugzO6NfSy321PGCKOHZc5oG4c5bArTs3q2pa8ZAhc3j5g8vCfw00GRc8Von6e3nAsa7K5Sea7Mm1WR7aVDzlDf7u2v+aYoCz89fVMkCRhGmQltrEyJtwTy49EVd+cmFQSpuNvb0i+Lw+8gqL2Mq9Ta84Hl/UU6MO3YW5YdOJU0H49sKm2k0gfAu1EUnBOuo1vaVh6F8TR5ukozWXX18KmxcYrLb3MIrIKbPY6AfGG1LJwe0BdGn4GSbbvLK+15AmWpqe1PNNVnNs+VjzQ44yUcznbdzoN2MPN99Pvq+ys2Q9/Gi3SugeNYgdzyHZd4cA0CSZb22txd91z22xbww4OSQMQlx5iyLy8JGbB0K9VoQgudZ1ZCkmAWvTiaYbTLbQOW8hkRtGlUPh9Ue9mmNzeyH4C/q7W8vfjSJVCy4sZOQhKuvKlT1mwwndR6NN1vxTB6SlwFuYHIfB2n4IcP1Wse+3UNaR8npKK/GhN2XXsJUz/zL1Yi94JEgeuL2pzBEehGNMx0rYHhrZvHNkjkQtXZK+vx3Lw9bQlsbkHCOMzJSYTZUI4e08NmZ0d1jnTIoWmakEjOMaQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(6512007)(2906002)(76116006)(2616005)(6486002)(91956017)(5660300002)(53546011)(36756003)(508600001)(6506007)(71200400001)(31686004)(66556008)(26005)(122000001)(54906003)(316002)(38070700005)(6916009)(66476007)(66446008)(64756008)(83380400001)(4326008)(8676002)(8936002)(38100700002)(186003)(86362001)(82960400001)(31696002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzliODAydG4xU3dPN21Lb3p2b1JUSklwczZ5WGJad094cGdETExTREFRU1Jm?=
 =?utf-8?B?TmxrQ1dsRVF1aE1QK3htYmZ2akVnUXdGLytUWElrdDUrUzFhcUttOFA2UXpB?=
 =?utf-8?B?elFYVlFpNzZGNGF3ZjlEOThDUUVBK0E0YTlDa2U2cHh6d01uV1FmU1lCWXZY?=
 =?utf-8?B?M0kyVTRJRkpEbkVUS3BiN1FPUUpUK0o3ZitOU1M2ZkJGeUJiR1I2RjZvdjVV?=
 =?utf-8?B?d1dFNWtxMW41UWJEOWZ4ZlhwalhEUjRub09yYXhONVFtdVRkQngrUVQ3azJs?=
 =?utf-8?B?dFUwOXpKMVJvNGNKNkM1QUlXMzAyNlhDNEliNzNqYmQ5V285aTE4UU42L1Y4?=
 =?utf-8?B?LzJSMWZuazV1NUxYUkNJNTVGZUgwbTFlQkRHUm9zdnFwT2xkOVI5V1gvcVlr?=
 =?utf-8?B?Z25Ec3NtN3lweUNqZDFUWEJDN2xFa1JQVmRLSWhqeGNXaUY0VUZWWEcrRUhm?=
 =?utf-8?B?NnFSOXpsbzJQNDBhT0g2TVhURjF2NVprbmhNWC8zZnhnMGRYRVFzekNCSGdl?=
 =?utf-8?B?Rk1LS01tVEFXWnd1YnpPSnlvZHl3K1VJeTYyMWJWaEhEUWNBa3RHbHdCaW4y?=
 =?utf-8?B?aEVGeFRRbitEbVVrOFltbDhEeHRCb2pET0RvL3J5REloNnM2N3JjaExTckdW?=
 =?utf-8?B?K0tzaTNPMXY3UURBYlpzeTB5RjVSVzhiV3BpZ2dWQThhekkwTDkwc29JQVo0?=
 =?utf-8?B?K0c0ZTJQemx2Z1ZTUDFDT0FCcjZGeEh3d3A1ckczVWZFUDN4Yy9iV01zbkpa?=
 =?utf-8?B?cllkWHhYWm9XV2N5S1MyY1d3OE9ad2FCOVRlVlVQVjNhMmxxdFpucCtJUGps?=
 =?utf-8?B?U1U0S0ZOQ3pJbDY5NzJ3QmF6UytpdHMveG45RGtySzdVZjl4Q2xVUlRCOENm?=
 =?utf-8?B?c2tNeUZ0MytGeUxuaS9uOGpveU9wMisrdlU1aE9neXZSYkNBamZiNmI1MWVD?=
 =?utf-8?B?SGp0RkR5VEQxeU1MTXdUUlR5RnNtektoL28yK0ZTWXJuM2U5SFhHNG1GQ3Ra?=
 =?utf-8?B?Q0JPNmZhRCtOc1RhanBIc3RNWHJESW9zMDVoWU1NYmwxQWdRM0xEdDhUZS9S?=
 =?utf-8?B?dE5YNWRCTHpHNUZ1N09pWHBvd1N1OUI5S3F6K3d0UEY3VlJvUDF4ZksvMGVV?=
 =?utf-8?B?NnR0NVM3QXNITHBVd0VzRFRzMEkycnV2OHljQm04NmJ3RFNYSjYzWFJEcWxB?=
 =?utf-8?B?b3dxYnRxdGFtWXI2amg2UUF5bm0rVE5DekxRSmh6Z3piQ3MzSHBlUm1sUjZa?=
 =?utf-8?B?OFVuK09TajYrd2p0dGRHMEQ0alM4VmdyTmx3TVo0RU8zc3VNYjYwQzZ4OUNW?=
 =?utf-8?B?bVNLdE84b2xPV3FNR2pqT3FhaXRzU1JydTlSZ3czanBNL0RnTXhxd0RLUVlK?=
 =?utf-8?B?MC85end3RmtDVzdKUW1VVHZEdWtPK1NITnhhZW04dno1NDN4STlPUmJiLytY?=
 =?utf-8?B?c3FFNFFjZ05ReTZrME16Tm5YWldrd3J1UkkyNmRkV1ZKMmZ3YjI2S1YzVjZC?=
 =?utf-8?B?SkhKQjZseVVXcTBmV290VkRUajFBY1FKMnlIU2w1RExEenF0OXF5ZzlLSENY?=
 =?utf-8?B?a3lPMjB3ZitPcUlwdmtqM3JucTdaYWFVVm1YNGpxL2FwU2d1bEMxaHdiSDVL?=
 =?utf-8?B?ekJQUjFLUmptd3E0TTQ2ODRZRmhYcjE4THZxOGFvcU1EWlFkT1M2TnBTK0FE?=
 =?utf-8?B?UUZNQUNWS002dVBYeHZ3cy8yMzhyMWtLWjVHdFZLY3dsUEpVcVFIQjEwbkYr?=
 =?utf-8?B?N0I5cjVtVWhlUDFFS0c5dXNGL2MzSmRxTytiU0p3SmlJZkRyNWp2R2srRlZl?=
 =?utf-8?B?YUh1VjNEN1lRdGpRWjF1MDBxbytrKzJmcTRzZU93U1F0cDhxM3RnZGVtZmdh?=
 =?utf-8?B?SHRjOWhUNUt5aDAyOVN1ZDN1QXlpWnp2UVc1Z1NtR2dyOGJwWUtHMGx6QTJH?=
 =?utf-8?B?aEpwbFNKRXNWL0JsbUNmOEFVSDVrOHdWRmZYaE53Qk9hSjdLMVlQdUhZMW1E?=
 =?utf-8?B?dkgrdUVBUDRTWFlIRlVJbU81L01ZeXZvNXp0WTJjNXFtVUEzMGhqYytCVFdE?=
 =?utf-8?B?YXVXcUo5bCtMUUF6M0RWdG1sejVQN2hwR2IxdlE5YWlMMm9tc3pVa2hUNXpF?=
 =?utf-8?B?aWwySXBNNnlzSFNQRm5VVHdSZHYzSWVUNGx1Sm9zbi92QWtlY0FvZHVhKzI0?=
 =?utf-8?B?WUVLMUJYeERnZ2JkU1kveXV1RUlFMmY1ZWZMVTZMYWNEVTZPYzVmSUFYUyt2?=
 =?utf-8?B?ekw4dVNmeWYxekNTc1YvZldDd05RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B062BED8B44FF4EBC716BF797AAB3DE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf22dd5-bb14-4967-557b-08d9e1b0e0d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 16:20:05.1582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lcVGl7U7w27k/ezNXvDofCw3J4JB3cikNW1QSWOhqqghXy7WKVa7QTM6tXPLvLyMoOHGq2oz2RqCtzeuqudJgeRi5os9ucOClI4x2L2Ikk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3476
X-OriginatorOrg: citrix.com

T24gMjcvMDEvMjAyMiAxNjowOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gQWRkaW5nIGEgbmV3
IGZlYXR1cmUgbGVhZiBpcyBhIHJlYXNvbmFibGUgYW1vdW50IG9mIGJvaWxlcnBsYXRlIGFuZCBm
b3IgdGhlDQo+IHBhdGNoIHRvIGJ1aWxkLCBhdCBsZWFzdCBvbmUgZmVhdHVyZSBmcm9tIHRoZSBu
ZXcgbGVhZiBuZWVkcyBkZWZpbmluZy4gIFRoaXMNCj4gdHlwaWNhbGx5IGNhdXNlcyB0d28gbm9u
LXRyaXZpYWwgY2hhbmdlcyB0byBiZSBtZXJnZWQgdG9nZXRoZXIuDQo+DQo+IEZpcnN0LCBoYXZl
IGdlbi1jcHVpZC5weSB3cml0ZSBvdXQgc29tZSBleHRyYSBwbGFjZWhvbGRlciBkZWZpbmVzOg0K
Pg0KPiAgICNkZWZpbmUgQ1BVSURfQklURklFTERfMTEgYm9vbCA6MSwgOjEsIGxmZW5jZV9kaXNw
YXRjaDoxLCAuLi4NCj4gICAjZGVmaW5lIENQVUlEX0JJVEZJRUxEXzEyIHVpbnQzMl90IDozMiAv
KiBwbGFjZWhvbGRlciAqLw0KPiAgICNkZWZpbmUgQ1BVSURfQklURklFTERfMTMgdWludDMyX3Qg
OjMyIC8qIHBsYWNlaG9sZGVyICovDQo+ICAgI2RlZmluZSBDUFVJRF9CSVRGSUVMRF8xNCB1aW50
MzJfdCA6MzIgLyogcGxhY2Vob2xkZXIgKi8NCj4gICAjZGVmaW5lIENQVUlEX0JJVEZJRUxEXzE1
IHVpbnQzMl90IDozMiAvKiBwbGFjZWhvbGRlciAqLw0KPg0KPiBUaGlzIGFsbG93cyBERUNMX0JJ
VEZJRUxEKCkgdG8gYmUgYWRkZWQgdG8gc3RydWN0IGNwdWlkX3BvbGljeSB3aXRob3V0DQo+IHJl
cXVpcmluZyBhIFhFTl9DUFVGRUFUVVJFKCkgZGVjbGFyZWQgZm9yIHRoZSBsZWFmLiAgVGhlIGNo
b2ljZSBvZiA0IGlzDQo+IGFyYml0cmFyeSwgYW5kIGFsbG93cyB1cyB0byBhZGQgbW9yZSB0aGFu
IG9uZSBsZWFmIGF0IGEgdGltZSBpZiBuZWNlc3NhcnkuDQo+DQo+IFNlY29uZCwgcmV3b3JrIGdl
bmVyaWNfaWRlbnRpZnkoKSB0byBub3QgdXNlIGZlYXR1cmUgbGVhZiBuYW1lcy4NCg0KVGhpcyBz
aG91bGQgc2F5ICJub3QgdXNlIHNwZWNpZmljIGZlYXR1cmUgbmFtZXMuIg0KDQpGaXhlZCBsb2Nh
bGx5Lg0KDQp+QW5kcmV3DQoNCj4gVGhlIGNob2ljZSBvZiBkZXJpdmluZyB0aGUgaW5kZXggZnJv
bSBhIGZlYXR1cmUgd2FzIHRvIGF2b2lkIG1pc21hdGNoZXMsIGJ1dA0KPiBpdHMgY29ycmVjdG5l
c3MgZGVwZW5kcyBvbiBidWdzIGxpa2UgYy9zIDI0OWUwZjFkOGYyMCAoIng4Ni9jcHVpZDogRml4
DQo+IFRTWExEVFJLIGRlZmluaXRpb24iKSBub3QgaGFwcGVuaW5nLg0KPg0KPiBTd2l0Y2ggdG8g
dXNpbmcgRkVBVFVSRVNFVF8qIGp1c3QgbGlrZSB0aGUgcG9saWN5L2ZlYXR1cmVzZXQgaGVscGVy
cy4gIFRoaXMNCj4gYnJlYWtzIHRoZSBjb2duaXRpdmUgY29tcGxleGl0eSBvZiBuZWVkaW5nIHRv
IGtub3cgd2hpY2ggbGVhZiBhIHNwZWNpZmljYWxseQ0KPiBuYW1lZCBmZWF0dXJlIHNob3VsZCBy
ZXNpZGUgaW4sIGFuZCBpcyBzaG9ydGVyIHRvIHdyaXRlLiAgSXQgaXMgYWxzbyBmYXINCj4gZWFz
aWVyIHRvIGlkZW50aWZ5IGFzIGNvcnJlY3QgYXQgYSBnbGFuY2UsIGdpdmVuIHRoZSBjb3JyZWxh
dGlvbiB3aXRoIHRoZQ0KPiBDUFVJRCBsZWFmIGJlaW5nIHJlYWQuDQo+DQo+IEluIGFkZGl0aW9u
LCB0aWR5IHVwIHNvbWUgb3RoZXIgYml0cyBvZiBnZW5lcmljX2lkZW50aWZ5KCkNCj4gICogRHJv
cCBsZWFkaW5nIHplcm9zIGZyb20gbGVhZiBudW1iZXJzLg0KPiAgKiBEb24ndCB1c2UgYSBsb2Nr
ZWQgdXBkYXRlIGZvciBYODZfRkVBVFVSRV9BUEVSRk1QRVJGLg0KPiAgKiBSZXdvcmsgZXh0ZW5k
ZWRfY3B1aWRfbGV2ZWwgY2FsY3VsYXRpb24gdG8gYXZvaWQgc2V0dGluZyBpdCB0d2ljZS4NCj4g
ICogVXNlICJsZWFmID49ICROIiBjb25zaXN0ZW50bHkgc28gJE4gbWF0Y2hlcyB3aXRoIHRoZSBD
UFVJRCBpbnB1dC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCg0K

