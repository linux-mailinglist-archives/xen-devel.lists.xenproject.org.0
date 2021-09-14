Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BCF40B49F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 18:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186948.335688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQBI1-0003Yw-Dv; Tue, 14 Sep 2021 16:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186948.335688; Tue, 14 Sep 2021 16:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQBI1-0003VW-9V; Tue, 14 Sep 2021 16:28:09 +0000
Received: by outflank-mailman (input) for mailman id 186948;
 Tue, 14 Sep 2021 16:28:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQBHz-0003VQ-A4
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 16:28:07 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78fbfa76-8fe8-42d6-9ae1-394887b083be;
 Tue, 14 Sep 2021 16:28:05 +0000 (UTC)
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
X-Inumbo-ID: 78fbfa76-8fe8-42d6-9ae1-394887b083be
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631636885;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0oDu8A4E1nBudlkblNkn/OQ6raVkygEBFAyYDouYCeE=;
  b=dJD9VqYZJsz+DEu31N5FOZQPscz1Zz+Dr76wqPE9JXIGevLhtzW+NlPE
   /IFtcWw5xoPxIWr8ljdTXa3U9Mpln6ZBJVH7QomhjxoK0YvEojhEFFZ4N
   bMeGq4hzP/m5cIfws/i2a9dHyVVeZF/qCNcIm62HjQcdbDyqro5wAT6UW
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sTpUpzu+P8oaQRNY5oXHzA/ElGr3kPGrlXi84A4uofqfk6PPHYpYRY7ciF7GoNVfqz+Z1L6hmw
 VA1YjAxELHjmcmVbt6UXOHEGm+2aA6uMndc/v9lBuB66SS65ASavL6xJzznfdLiDJtjx7tJaTn
 WO0qYQaMVSv+oRLdL8yIxXTySoYjLDxGJ1T/9xFX2zWNG/515XaacX6oylv+o763LOUhi9KcMC
 EzfYoGoBKRUaWBGkNyW/kl0I0BR+l3wd2WUVEhfMLCOPd6InzZfzTf5ejiNUtktPik7scXSyrO
 FXsLZebhKJQw2kJigpir6FsL
X-SBRS: 5.1
X-MesageID: 52717053
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xFRCm6JbAf6ysWIsFE+RRpIlxSXFcZb7ZxGr2PjKsXjdYENS0TYAy
 WYWUGiGOv3ZYDf3L9pzbNvn90oH75LTnNBiTARlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM6x7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2kwvdPl
 dtg6qbpF18uBrfQxroEWkRHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Xv4ABg29t3aiiG970Q
 vsgMjxGYCjcICRSYFUuFpsYpcKn0yyXnzpw9wvO+PtfD3Lo5BdqzLHnPd7Re9qLbcZYhECVo
 iTB5WuRKhUbMsGPjDmI6HShgsfRki7hHoEfDru18rhtmlL77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVXRe1vXqFtR40QMdLHqsx7wTl4qjb+QGCHUAfUyVMLtchsaceTzsw1
 0TPmMj1Hztxq76EYXWH/7yQoHW5Pi19EIMZTXZaF01fuYCl+dxtyEKUJjp+LEKrpvCoPg+tz
 R3VlnFg37Irl9JVibyyoE+S1lpAuaP1oh4JChT/Bzz+t14oO9H7PuRE+nCAsq0Rd9/xok2p+
 SFewpnAtrhm4YSlyXTVKNjhCo1F8Bps3Nf0uldpA5Bp3DCk4XfLkWt4sWwmeRsB3irpf1bUj
 K7vVeF5v8Q70JiCN/Yfj2eN5yICl/aI+TPNDKy8Uza2SsItHDJrBQk3DaJq44wIrKTKuftuU
 Xt8WZ33ZUv29Iw9lGbmLwvj+eZzm0jSOl8/tbiklk/6gNJylVa+SKsfMUvmUwzKxPrf+23oH
 yJkH5LSkX13CbSmCgGOqNJ7BQ1afBATWMGtw+QKJ7HrH+aTMDx4YxMn6eh6ININcmU8vrqgw
 0xRrWcDlAOk1CGYcF7TAp2hAZu2NatCQbsAFXVEFX6j2mQ5YJbp66EadpAteqIg+vAlxvlxJ
 8Tpse3cahiWYjiYqTkbc7fnq4luKEaiiQ6UZnL3azkjZZ9wAQfO/4a8LAfo8SAPCAuxtNc//
 OL8hl+KH8JbSlQwFtvSZdKu00i14SoXltVtUhaaOdJUYkjtrtRncnSjkv8tLsgQAhzf3T/Gh
 R2OCBIVqLCV8Y84+dXEn46eqIKtH7csF0ZWBTCDv723KTPb7iyoxooZCLSEejXUVWXV/qS+Z
 LoKk6GgYaNfxFsT6thyCbdmy6469uDDnb4Cw1Q2BmjPYnSqFqhkfiuM0/5Qu/Af3bReowa3B
 B6Co4EIJbWTNcr5O1cNPw55PP+b3PQZlzSOv/Q4JEL2uH1+8LadCBgAOhCNjGpWLadvMZNjy
 uAk4ZZE5wu6gxssE9CHkiELqDjcci1eC/0q5sMAHYvmqgs30VUTM5XTBxj/7IyLd9gRYFIhJ
 SWZhfaairlRrqYYn6HfyZQZMTJhuKkz
IronPort-HdrOrdr: A9a23:Mb7tLKkYhYJRdnw8k13bjLfa11rpDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="52717053"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LR+UjHDak1cqYTDLICD7KCXbaMD+tUGN2bO0ZU0HScW5bizOffYJtDwIvAKscoBrBPL/XNZrvOR8fsWhNAhGgSnCjjQISTWagZKR0aIi2Bx2q2QUA5VO7KnF4xAdhiFvG5TvYXjB9ajnpTknvZ3MmEbma0Dvi9esf8MC723H0tFW47wtdJGm58pvC/0a8hd5xRP6Qb1J1C74blZ0LJ2+EFDepOvUBYGQjaB3lqpTup28L1E4xtZCeAJnJ0HUP8qR/3sbpTayeAy/ea22e3SJ10LvTRCruCIWgwvqdiN4LDsVbJNsYmGEEQlbB+3ko6AHc8kEuh8jf5GBJqxV0llCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/FUPmgE0iKT7YxUURvlZlq/MtNcRKfBk8QhYO56li0I=;
 b=Oih5P4AE+atSEkVprqyWU7MDlGbx8Wp7CZG4u3HibtR78LpTjcfafewYKJck4vq4QaGfsmtPauzknUCXYAPlU7Jq9NnoWMdC3BYdQ9LJ6+N2mxuTSrWG1dlr61J6kk5num02a5qt07vKWPV10HH2WPmPpdIciBXP7M/AQF6Hbsrw53TIsogTm0qQWdIVgLCrdxi1jMV2LUHunKfftSgmCmMtuuczQM9+1yMgYLTtaTbQRrb9eTYAi+DRJqShwzN6L+L0yistVvMsXDGMm+RXKTIoGSROzlKBXWnwlFQnv7zSFg+NFYRYQ44n+pJy2bSzUgBh0VpbwJKRsUZGqiOrVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FUPmgE0iKT7YxUURvlZlq/MtNcRKfBk8QhYO56li0I=;
 b=lVmHx1AUwybUpn2L10TQ4TTOMA5p9+kgoCaeGvo36TprCb0DfyAgRy0OWQonxQuBklr7ZKp2j0ZlgO5b8zVZ/X+nNp56kRTTjjfc2JKiKn5X9Srw8Fa+OZPKrlFiTEDal4D+UQPGvGKS7lsCG8wdC8l30hY8Cd5HOIaR8U4ITQY=
Date: Tue, 14 Sep 2021 18:27:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/9] xen/x86: PVH Dom0 fixes and fallout adjustments
Message-ID: <YUDNh9r8nYOxB76n@MacBook-Air-de-Roger.local>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <YUBeJLvWXukyGSFf@MacBook-Air-de-Roger.local>
 <050f71c8-227f-4f78-1ec5-394ba9fba9c1@suse.com>
 <YUCEQFpdc+3kUqQj@MacBook-Air-de-Roger.local>
 <40ea4ec8-483b-9191-a233-f2916f22c131@suse.com>
 <YUCYYmqQMR5NCTyz@MacBook-Air-de-Roger.local>
 <13dd8509-330b-4571-086a-7a3ed9c22c82@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13dd8509-330b-4571-086a-7a3ed9c22c82@suse.com>
X-ClientProxiedBy: LO2P265CA0316.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f5cc8a3-6cff-4a90-9cf4-08d9779c9be0
X-MS-TrafficTypeDiagnostic: DM5PR03MB2844:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2844FD8C963E972EBA22AABA8FDA9@DM5PR03MB2844.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v76C3P8DenRctbHtidp9JEWnr81wtHuRBu/paS4bPExq75RpA3AwoLBu5yXgDOrPgMsVApa71R0IVofTGmjBgcOFxOs4hQF51G5oYry9wGWvADLfx0iC4SS/FCkRq89w5EsEIKt3ryYRZREC/tIdbQi4m5dQmF2PlTS2MEy4TJAoq4sHYxDifGisy2KN1Clvi2XODAsxJXNJ92p/9IqCq/soPEVSWDzcVVWsGAJDd6PTF9YneLCMUwOKUEv74ZoMZiOAh+QdmeYfjnvVYXgeyOYRPBDskDQnto0JhAgz+SVM07MTST4BPNrLRxyHIeoZXUAZ6lwOgK/3/GLENZ+vd4LAWQAxvUMav0KdArj80CS7kNi+XzTRLzCtSm/96M7xFEzkgBcEXwpvnLQWcSNFsHMVfQAb+SZKfoJ753AOTp4YyGOzG6kQ8QH1DHqZbV2zfqZwQEzPjrXDswmhWAf3OfXSsQomLQMRcJSPo7MRPQ6NAtzWU71dIFG6/9Kyo6ZJFSeNZqNmDuXIPtSRyIbvy053+HoGEu9R5Ww9lMTdIMjIZs0jyZ4YqcojqmEbgZEVVNWUti73U3V5Pz9BT+lhhjI8MeM+W6O1+N4tHDfNhDs0IPdApSUbNHa4sYjBZ1lLAxdCqIgxtC8fIyW8W0M7/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(85182001)(478600001)(83380400001)(5660300002)(6486002)(8676002)(4326008)(53546011)(54906003)(66946007)(956004)(2906002)(186003)(26005)(38100700002)(66556008)(66476007)(9686003)(86362001)(8936002)(6916009)(316002)(6496006)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFBOWlVLcXBIa3d0MWVaSzc3Z0xTenh6T3NkUlNTajlWclNRZjRRdk84ckhM?=
 =?utf-8?B?c01WaUdrb0oxdGk1TUpaM2Jka21zUW9mTlQxWGdlZy9QTmhKWlI0RE9vTThK?=
 =?utf-8?B?bTFpQjFuTjJRL0dORndOdmtFV0txRGZkMnRicTR6Qk5yYTNsR2lMZlQ4SFZv?=
 =?utf-8?B?ZEEwbHBEa0xTSHdTSkFvUEttN2NQUFVqQWZmWGlhMnNGbjZsNSs3d3ArZlpt?=
 =?utf-8?B?V09QTW11VG5XNUZBTGE0M29OaTd1UWVSaFFzT2VtYmozQnNLY0srVFpSMFpU?=
 =?utf-8?B?aG9TQklKRDA3RjFiZ1ZKcG5XeGxBNmhZejkwUUo0SW5URzRoZ013OGIzMWI2?=
 =?utf-8?B?dnROZDJxN2V2T0s5d0U3S0pJb1pVYzcwSzYveTRUejJ5bHhQcWNOTnNLUGRP?=
 =?utf-8?B?R1NJU1VnSm9TMmxMekpDWWhZaVR3NmVBTmF3cUkrOVY0ZFN1eUpOYjdTa3Bp?=
 =?utf-8?B?ZGxZT3Z1YlZqUXdJWi9IZUIzSUJJZG1tcUl2YTA3Vm5Ub1hybWJMeDhsMmdJ?=
 =?utf-8?B?U1N0K1NSWlNYVm15Z0ViUWxYVDc0RGFGQmgxUndETC95U1Z5Zy9CRTBuTmU5?=
 =?utf-8?B?SnQraklkQTVtQVIvaHJlUXh4T2EwOUJRUDFIREttNnp1Y2drVGdIU3VsZjNa?=
 =?utf-8?B?RGFvM2NPT05YZ3VHSmloUHgzQkpXZUw4a1JwL0w5K1llMENOUkt2ZDJkcCtP?=
 =?utf-8?B?emFweFRadEV0Y3d2UU10Q093OG9YdG1pTDVVYThNTG1QRFVXOXVYVnkzZnNB?=
 =?utf-8?B?bWtlQ2RIem9TdnpyM0Z5NzN5OGlZeS9EYThXeVZ1dm10TVJEYmcxSzJzSld4?=
 =?utf-8?B?bi9KWkhQejRUNHk1dTlFVGVnUWplY3dVaXBmaUh6YkhRNUhBRGVZUmxRU0VF?=
 =?utf-8?B?QzJ1STBFUnJJbUUzUGZycXhDTzN3dzVGdEJqd1duZ1p2bkNTK3RHUENNU2xt?=
 =?utf-8?B?aVZTTWszSEpERkZad0tNaGJtaXhxOVQ1MmU5RWJyMCtxdVplZUFmQXIyVmtG?=
 =?utf-8?B?NDNnWnhJVG1sQUxWZGNvYUJ1aE5YV0VqbzFXR0NITEZVWnBkOGtBVk52UU5z?=
 =?utf-8?B?ekFVMkx6U3p5ekV2YWtHZ285T1pGZDdIdXBnYmpINnNTN2VnRzU4Mks1RnRt?=
 =?utf-8?B?dEU3SjUvc3ltYzZqeE9YTDJYZVN3azZVTTErcDk0RHhNUmpXaVJCdFA5VmJa?=
 =?utf-8?B?UXdrdnYwNTRqR2h3a2w2RCtSb3BNZ0M2U1Mrc0g1TjJVcUwydmIvMlhuaWlU?=
 =?utf-8?B?VWx6bGpURVN4bGNhRmVsN2R6c3ZFUFNrNXJ3WDNBdDdaMkxZNHhKMm5mMHhi?=
 =?utf-8?B?SGRkUVcvMlNNckNpYjdaejFMNDV3OEdFYmVpRUcvajRUVlFrMDN1bHlnczNa?=
 =?utf-8?B?WlJuVXcwTWN4NjdKS0RtdE5GZlpwRlZkODdMbjFXQ0ptR1kyY3pNbFd4OTJX?=
 =?utf-8?B?MmhSLzFDL3NCazdYaWgwZjhKT2RNeE0rbTNXU05OcFVlbkg2NVdrcjFReWxu?=
 =?utf-8?B?cFpLWDIreVFUMXlNdnEvOVdDYk80QlFoS1VmS01UNUJqbjlEbWxmb0hDVEVE?=
 =?utf-8?B?R1BPcjNJN1h4dGc2WHZ0bzFCRzZ6MW45Y1pYcFF0bDl2Y0pNQjlBeHpKWGJS?=
 =?utf-8?B?WS83YjVLQ3cvTGxiWkQ5dnVHK2M5b0ZZR0cxNG1tblZ0dFlCNVpWaEN1c29j?=
 =?utf-8?B?U1dMM2UraGwyaXVwalNWL3JXOFcrc24xUE9GVHhUY3Y0blo3VFJqVWtrTXNh?=
 =?utf-8?Q?Ad8XJ8sL/l34ys4acnUZvt5TKgzSLSIO3zEzvTq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5cc8a3-6cff-4a90-9cf4-08d9779c9be0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 16:27:56.5260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDf2PF6qnty9LloXnEYG65aUYSZRufH+U9ObhYAJZx5kfHRm8cAIcdAALmMJ7wm34fCi3MJJ6zjr6KMb79Xj8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2844
X-OriginatorOrg: citrix.com

On Tue, Sep 14, 2021 at 05:13:52PM +0200, Jan Beulich wrote:
> On 14.09.2021 14:41, Roger Pau Monné wrote:
> > On Tue, Sep 14, 2021 at 01:58:29PM +0200, Jan Beulich wrote:
> >> On 14.09.2021 13:15, Roger Pau Monné wrote:
> >>> On Tue, Sep 14, 2021 at 11:03:23AM +0200, Jan Beulich wrote:
> >>>> On 14.09.2021 10:32, Roger Pau Monné wrote:
> >>>>> On Tue, Sep 07, 2021 at 12:04:34PM +0200, Jan Beulich wrote:
> >>>>>> 2) Dom0, unlike in the PV case, cannot access the screen (to use as a
> >>>>>>    console) when in a non-default mode (i.e. not 80x25 text), as the
> >>>>>>    necessary information (in particular about VESA-bases LFB modes) is
> >>>>>>    not communicated. On the hypervisor side this looks like deliberate
> >>>>>>    behavior, but it is unclear to me what the intentions were towards
> >>>>>>    an alternative model. (X may be able to access the screen depending
> >>>>>>    on whether it has a suitable driver besides the presently unusable
> >>>>>>    /dev/fb<N> based one.)
> >>>>>
> >>>>> I had to admit most of my boxes are headless servers, albeit I have
> >>>>> one NUC I can use to test gfx stuff, so I don't really use gfx output
> >>>>> with Xen.
> >>>>>
> >>>>> As I understand such information is fetched from the BIOS and passed
> >>>>> into Xen, which should then hand it over to the dom0 kernel?
> >>>>
> >>>> That's how PV Dom0 learns of the information, yes. See
> >>>> fill_console_start_info(). (I'm in the process of eliminating the
> >>>> need for some of the "fetch from BIOS" in Xen right now, but that's
> >>>> not going to get us as far as being able to delete that code, no
> >>>> matter how much in particular Andrew would like that to happen.)
> >>>>
> >>>>> I guess the only way for Linux dom0 kernel to fetch that information
> >>>>> would be to emulate the BIOS or drop into realmode and issue the BIOS
> >>>>> calls?
> >>>>
> >>>> Native Linux gets this information passed from the boot loader, I think
> >>>> (except in the EFI case, as per below).
> >>>>
> >>>>> Is that an issue on UEFI also, or there dom0 can fetch the framebuffer
> >>>>> info using the PV EFI interface?
> >>>>
> >>>> There it's EFI boot services functions which can be invoked before
> >>>> leaving boot services (in the native case). Aiui the PVH entry point
> >>>> lives logically past any EFI boot services interaction, and hence
> >>>> using them is not an option (if there was EFI firmware present in Dom0
> >>>> in the first place, which I consider difficult all by itself - this
> >>>> can't be the physical system's firmware, but I also don't see where
> >>>> virtual firmware would be taken from).
> >>>>
> >>>> There is no PV EFI interface to obtain video information. With the
> >>>> needed information getting passed via start_info, PV has no need for
> >>>> such, and I would be hesitant to add a fundamentally redundant
> >>>> interface for PVH. The more that the information needed isn't EFI-
> >>>> specific at all.
> >>>
> >>> I think our only option is to expand the HVM start info information to
> >>> convey that data from Xen into dom0.
> >>
> >> PHV doesn't use the ordinary start_info, does it?
> > 
> > No, it's HVM start info as described in:
> > 
> > xen/include/public/arch-x86/hvm/start_info.h
> > 
> > We have already extended it once to add a memory map, we could extend
> > it another time to add the video information.
> 
> Okay, I'll try to make a(nother) patch along these lines. Since there's
> a DomU counterpart in PV's start_info - where does that information get
> passed for PVH? (I'm mainly wondering whether there's another approach
> to consider.)

We don't pass the video information at all for PVH, neither in domU or
dom0 modes if that's what you mean. Not sure what video information we
could pass for domU anyway, as that would be a PV framebuffer that
would need setup ATM. Maybe we could at some point provide some kind
of emulated or passed through card.

The information contained in start_info that's needed for PVH is
passed using hvm params, just like it's done for plain HVM guests. We
could pass the video information in a hvm param I guess, but it would
require stealing guest memory to store it (and mark as reserved in
the memory map). Not sure that's better than expanding HVM start info.

Maybe there's another hypercall interface I'm missing we could use to
propagate that information to dom0?

Thanks, Roger.

