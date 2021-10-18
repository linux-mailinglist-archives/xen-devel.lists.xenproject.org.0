Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A9431151
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 09:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211712.369350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMve-0006aM-V6; Mon, 18 Oct 2021 07:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211712.369350; Mon, 18 Oct 2021 07:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMve-0006Y2-RY; Mon, 18 Oct 2021 07:19:26 +0000
Received: by outflank-mailman (input) for mailman id 211712;
 Mon, 18 Oct 2021 07:19:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJnW=PG=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mcMvd-0006Xw-LH
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 07:19:25 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a9f2ba7-f98d-4e71-a343-1c632d90f8ce;
 Mon, 18 Oct 2021 07:19:24 +0000 (UTC)
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
X-Inumbo-ID: 7a9f2ba7-f98d-4e71-a343-1c632d90f8ce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634541563;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JKTT7rm8VjwUs/bHBsxdjVggnwiwEmltQmXMzT+uoZo=;
  b=MSGLy0NByGXhyOyMF+3/j/bDfQ8sajzvLNiQxqCBgiF8NdjR5Sb5ADpJ
   9J4t96cgV/eK4H8AOGkX88nfqn6cZDOp5A4n0wTHBn6XTRSj1X1ZqOxe0
   5MXTuiYVAWko5KnIeyJ2AcT6/FWtOONLXHrnYZpAr48dTNbbKvAMfZWAW
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: a9HyRuLyd2ovMOv1zAUJy0wX6uWTQggju9IhVOsTJPz6R3JMuDqyp+5kheX2mcrfo5jfGFoEF2
 8PsXpEInvwygmrCjrTpsrNt9FtTtUMvohf0FfMZl55hYrjD62kHMyY6jf034EwqQIVRGDtsyVX
 iutka9NSc9vaO/aM3cqToBTfwWWVhyPm0TSzsSBMqcXE3SKSyfBC6TJ6uAw857H/VGMjsKi4Fo
 yYcUNIZyN2QxxiaWlJLAXThS8PktxtlJ2ttYX/vSWHLVWTn6wdJ5/IKjesN0/dgW+zvENODvH9
 SMlV0VF/4I4GR6X3OxeQtcAp
X-SBRS: 5.1
X-MesageID: 55395963
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:E6gUHanQ+3NOxB+kqa6j57vo5gwBIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMWj3XaPveMWaheo0gOduy8UlV656AmoBqTVdoqi01EyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdg2tc42YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PQRuKGpTFl5B5CPquU4Cj58PRNPLaITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKuFN
 pdIN2EHgBLofBJuI0YULZsFmv6QqT7WVyJlln+2jP9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPXOkpdGph0j4XMhQQ
 2QM8zcqhbg/8gqsVNaVdxynolaUsxgEQd1SHuYmrgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BJGBijaSQFyKky/SmrBbrHgw7H14SanpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OpL05Zav0mv1RWe2Wj0/8mWJuIgzlyPBjrN0+9vWGKyi2VEA3Dg5vFcMJ3RcFCFu
 HUV8yR1xLFTVc/T/MBhreNkIV1I2xpnGGCE6bKMN8N4n9hIx5JFVdoBiN2ZDBwxWvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKNYYSM8UgLlPbpnAGiausM4bFyhlEfUYXY
 s/zTCpRJSxCVfQPIMSeFo/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9zbuRo
 SzhBxYFkTISRxTvcG23V5yqU5u2Nb5XpnMnJy08e1Gu3nkoe4G066kDMZAweNEaGCZLlpaYl
 tEJJJeNBOphUDPC92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7DwhBnGRZcjRhh5CJqEYvyY0F7s72MWn/h/XhWUL4ALKlns6oVjNwf4kuQzf5MXMRzGyzbDj
 1SWDB4UqPPjuYgw9NWV16mIo53wS7l1H1ZAHnmd5rGzbHGI8m2myI5GceCJYTGCCz+kpPT8P
 b1YlqiuPucGkVBGt5tHP4xqla9utcHyo7J6zxh/GCmZZVqcFb49cGKN2tNCt/MRy+YB6xe2Q
 E+G5vJTJa6NZJH+CFcUKQcoMraD2PUTlmWA5Pg5Ohyntip+/b7BWkROJRiczidaKeItYo8ix
 O4gvu8Q6hC+1UV2YorX0HgM+jTeNGEEXoUmqooeUd3ihQccw11fZYDRV33t65aVZtQQakQnL
 1d4XkYZa2iwEqYaT0cOKA==
IronPort-HdrOrdr: A9a23:TUkqpaqpV3fVYDc7Q+kE/kEaV5oVeYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc5wxhOk3I9erhBEDiexLhHPxOkO8s1N6ZNWGN1QeVxelZnPLfKlbbakjDH4BmpM
 RdmoFFeaXN5QcQt63HCXODferIauP3i5xA/t2w80tQ
X-IronPort-AV: E=Sophos;i="5.85,381,1624334400"; 
   d="scan'208";a="55395963"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlkZ8/BwU6OMIFAUtWKYlFo0/RxSiXfrkCRdfY2r5HbbjfEGI3PYPbL++QGfIt7KJTCDyNXeBpYRunkUoB1gRG0cxab3UUnZjR34IF+bYo+bQJoBxglzpmTkDM/YhuVlq2vA+CHwEkMoesfz+QmI7SwM9VdT6WXUzdW2129+SjePMkUGqG2GGst3HYC1Fp82QB55ObRbVALcGpRXYEp5FBy59Ndxeri0uMe1PYifL09kbsu//xaOnPz10sd7MoNgrgYoexOiLPLJxiMLxrowlB1UBVtJkZ9ghHg8yj+dPQzEvJIjawvqjlgWABOGyenDLaXIqgwdXWzGCJa87aly3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKTT7rm8VjwUs/bHBsxdjVggnwiwEmltQmXMzT+uoZo=;
 b=lmIU6oc6mi5f5mzQ4d/22A+9rd9F6bTPtOD6aZcbne+9N3YK+Gjv+lqun+9OXzPQupRXvzxiRRwyd1m1k3cSw4ASn+yrmkb0jHivEQ2o7HVtg5Hr5p44jfhBgxzPFgioYwDdLcuXAuY5PwZJx2ZS0meq62H2u1KqkcnXJTsFCPcBbLNHfYxoQWX8grjU01/Qi5yqPLX/aOICy6bKYpbjxLx3Wh55dxdI8QttAHFt+y6oWLmFgsiWW/k8sOQMtS/blg75YfFtYtcyRNzjwf76rmyBe06RdST6m5Ju4QJ5CTb9uKlnifKVbTxPx0lH6Jk3OsPEMLs5wDKbYAssgj2pnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKTT7rm8VjwUs/bHBsxdjVggnwiwEmltQmXMzT+uoZo=;
 b=CYgl38VKQRG2z9WxRiCD80rpi6LsUs7P0VzuicSeaMrLNU2+b4LzALG8oWu9wRwNJ0joi8h9rZ4FKUKKg64ZUZYyJTREQLFuSxzeuGdxB6JfSMR4ZfOf0fRhEsXw7Rpl4CpVQBt53NzmymI/Pk7qNESqA1cL8l5YY95ileYLT64=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Paul Durrant
	<paul@xen.org>
References: <55570db5-3823-8996-f69b-c2b00bcd4227@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: correct cleanup after failed
 viridian_vcpu_init()
Message-ID: <569bffa4-8f66-f93b-89f6-e1d5ee799964@citrix.com>
Date: Mon, 18 Oct 2021 08:18:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <55570db5-3823-8996-f69b-c2b00bcd4227@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0129.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57189b32-b5cc-4ca7-9052-08d992078a85
X-MS-TrafficTypeDiagnostic: BY5PR03MB4997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB4997CC10DE02786325E9C0D9BABC9@BY5PR03MB4997.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oKGmBK3vEu9jyo9WBZyD6rAcsIVSWPi6SbNeWRI4k+kQMnuBhMIOrqZO33mli9/ZSkwVYzE+nNllhHCmJV1sWQWyQOXunLIfB6+jhpR+I21HC/cEsYbrRtgQEkfKsMMXj1ip/iTdy/PeDlnW/chz+oXJr8uoj0FZUQLh5fTN/RcHCnFt0aiqQ+HTPf4TMA0fUtzRBN2hTjPRyG35KNc72RzHGHAEpNpTckBhvvLs5lh23o6OmvFilrDZz4PFH43BUO0v7AdaoEAkRv84Z4z09aUfR4VXwosHNJiXF+z7szUIf4W1LNsf98yW/euA0oeX2Icym5lBRgPfzoX0u5M40RHE+9HOshEhUUMHCY2Zz18s5S72WGS7IW3LITRPArobTQp0E8jjmgPCgXBx97TydDH015o7kVv4QJI3ifrOksKU8OqrO20FUbJ1uBWsIS/1fCVl3njyTew124NRxLsCYgBahpA7CHv7Xq8sxNmSAprVhEiyQr2tQ4CVlBaLLtw+RQMdqNJgGhXWhCMOoXi+FWd5oiqi4fZMuTgFKk7YhDlNEZ8dtBoiHa0ApFv5YCIdKbjgE/+n988ahqkr053lU8efYyEE0KVkuNf/qgJ9kQ4uVAAIk9auAcptzkLsrJudnHgO11iZXwxg8HZ+pb+IcPvxSnAty344SodsSiTR5+SuIYIeZkht+wGsiMpRqLz8G9clmA6qbNOE6ATFO4Vve3HI6be4oMdqaOVJb1EmbpY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(31686004)(38100700002)(2616005)(956004)(558084003)(31696002)(26005)(316002)(186003)(36756003)(82960400001)(110136005)(2906002)(508600001)(54906003)(66556008)(8936002)(6486002)(66476007)(66946007)(86362001)(6666004)(53546011)(16576012)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmxkcUg2dklZbjNUYVduVFlyZlRXUDYzYnh1SFltT0tobUdRWmw3eUU1dm9Z?=
 =?utf-8?B?dGxTcE5UL0ZvZURxZy9jYW5KSi9pRFp3bDJPQndUMUkwQS9mN3hISnJaQjhJ?=
 =?utf-8?B?VmFPd1NLN3drWjUyTExxSFlwRS83dFlrWFpZN3VJeC8veE1YK0xoS0NWc25i?=
 =?utf-8?B?SzBheHpFbUFwSjBGUzZVajNHRUx6ajZsVTlnc3VQVVRPMk9PbVN6WldmME5l?=
 =?utf-8?B?c0xvWmZmNDMvelhZY3hQZFBEUGp5ZzVJV2pvS0o0R2owVWUzNU94VmgzS3Mr?=
 =?utf-8?B?ckI3Z2RyRjhUVGR1bTd2OFFaUHcwRlRKVlcwZW9GaFBFS2VaM21vcm9Ka1Zm?=
 =?utf-8?B?ZVRlSTVtOXdBRkl0ZEdVdTBOa2RDM1ZQSUJIQ0E3NndQUk02SVliMG9pT2Jo?=
 =?utf-8?B?bHE1c1NnTnppamo2UGVzcHI5UHFLNjAvdmx0ZHNhU2xvK1FGbUJPR3BreTRY?=
 =?utf-8?B?bnlHU2ROaWRXa1cvQzNjRmoxK3IraU82WFV0STJMaDZVM1pkbEc2a3FXcmVJ?=
 =?utf-8?B?ZTR4MytHQkNYYk93Z2JtSlNSWXhleC9aUTZ4d2lQRDEwQnpaR0tpeHhjbDJi?=
 =?utf-8?B?cDFyaFBFZVpwWGdBNmlWaUdYMzFpcHRzdDNCbFFtalhCM3c4UEFweFQ3MnVL?=
 =?utf-8?B?a0wxazJrS0VBSmY0dmVtYUJvbXNaL0ZRT0xhUnhsSVFBOWJBOWRnVWJFZkov?=
 =?utf-8?B?cTN5T1JldjJhM1BtT0VQSDFJeE5VNEZWZEsyeDlERmpYWnVYOFJQanlNaHND?=
 =?utf-8?B?Y3JucDZaczh0Ui8ycjlpMDVURHJHYTI3MC9oV3c3dHJDVDF0Y0x4QVVicHdU?=
 =?utf-8?B?TU0vUmh5VGlHdG5ycjh5T29TNlBSZEdub3RNemkrdmF5eUZqZzdnNXpCakMw?=
 =?utf-8?B?dkNLRzJrcXZQZHJvY1dRSTI5MlhVVmtpYW5jUTRDekI2RGNRNGNvUnhsSS94?=
 =?utf-8?B?VTRZb2tsSHY3N0VOTnpST2tkSlJ0SjV3c0pOclE3dzdOdHNxNlA5U3l0bEtT?=
 =?utf-8?B?TlY1Y1Y3K29tMVFTRndweFowNFlEMkZHSnczVUN5VE9KLzVPR01GeXBZOXg5?=
 =?utf-8?B?RUNOa2FHelo0QWM2LzB1T1hVODVTclhCTlNOdzBqSzYyTlRQZ2tiOE5xaS80?=
 =?utf-8?B?VjNXdzk4bUZ5S29KMkxOQWIrRzljQnUreWtYelVMQUU4Q3BMY3ZITzdGbktU?=
 =?utf-8?B?TWM0Z3ZpdG9JQzVZaE1Zb2ZhL1EvREJhVFgwSDcxOHd1T2hTOUlyUGU1MWUz?=
 =?utf-8?B?czNXQzAvUGFRVUZVY3V5cmtqaTFzNGthREp0c2JyUnRFcmVxTWwzVFVpZzc3?=
 =?utf-8?B?QmMzQXI2N1VvaTZOTkc0UzN0TTVtSEpnMXdGOVF3R2FaMDN2RXk4d0lrVWJk?=
 =?utf-8?B?ZDJGeXpCUThSSUZOdVZYL2ZVK0l4ZXJKUVVjR2tSVmt1TTNSOFJGNXN0QmJU?=
 =?utf-8?B?T1lPOTk5UHY3WlZIbHZaUVZxa0VRNjVVaXJDaFlZc3BrUVlIaVBQQ1BTakRy?=
 =?utf-8?B?UW5NTXptdCtRK0pjQ1lyRVozMHRmc0o5S0x6VlZoK1VNSnlYOEVLYzZkWXB5?=
 =?utf-8?B?NWEzRUdBQ29HS2RPeW9CejZxYk5iSUZQQjAyMTlERzNRTjQ2R1FEbnZqQkFX?=
 =?utf-8?B?MVM3d3dFME8vUUZtZG5USkpvcTVwMktUMUl3Nyt1dGczcSt4RDNNMm1DSGxS?=
 =?utf-8?B?MG9yMmJzVGlqdVVmZ3JwMjU1UDZWZ29ubWNtWWpVNjZCY3FEak93MFdGc1M3?=
 =?utf-8?Q?FRlTkYuzjHKe8Ti281pand8FevIT5SRuoiPtZAv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57189b32-b5cc-4ca7-9052-08d992078a85
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 07:18:53.7750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJhmZL0qyrwUMvb2wKxnYhhVwi/gG4FZ2dkC+VJNx4oGv+A8imxp1857XqniJ0M83Kt2TkY91J0wwhxfzsH7Y0hF0JtikCWOYyoPQxqoBUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4997
X-OriginatorOrg: citrix.com

On 18/10/2021 07:43, Jan Beulich wrote:
> This happens after nestedhvm_vcpu_initialise(), so its effects also need
> to be undone.
>
> Fixes: 40a4a9d72d16 ("viridian: add init hooks")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


