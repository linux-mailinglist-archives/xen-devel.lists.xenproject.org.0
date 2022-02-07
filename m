Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4191E4AC0EC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 15:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267007.460707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4rd-0001cl-Re; Mon, 07 Feb 2022 14:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267007.460707; Mon, 07 Feb 2022 14:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4rd-0001al-Ml; Mon, 07 Feb 2022 14:19:33 +0000
Received: by outflank-mailman (input) for mailman id 267007;
 Mon, 07 Feb 2022 14:19:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYSm=SW=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nH4rb-0001aN-Nz
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 14:19:31 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4b0758b-8820-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 15:19:29 +0100 (CET)
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
X-Inumbo-ID: f4b0758b-8820-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644243569;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=z+qQ1BJWH3Lg23iiCmDq7BXv2Pw8ho6v4ITMlzIp+zc=;
  b=EdSoJKzPChlKqQBIvtDzok2aj0Z53AaY+X0qJryuzW54JFNbRtAKODra
   8g8GHij+Y4yhr7OYI/l9952Ey/B0uuwgvme+lCPPjXZ9rVXDQ9kikq2EH
   P1pUrLvNO4o7XC09R6T8PTXV37DFwuaZ27YgcLxGhfgUd+2YhXLYoaAc+
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ChSud4KGdLmQ+eAnpWWn4ZDCv8nX5pnFRATy3o6pnkna7SCg9C6cU8y1dmKwlnkfUgMlVLmMuF
 f28e4ckQk/cVcHZrYeXLQBkKRX0OIe4Ncg0w9x3ccuynmL3XpbU2sr0q2pPIPHGYAcTfs/FHrZ
 RPe2WWQV4CLIYfzJj1439VmCKoHyMPffpugsFPXguOV+rF2csPURmgIHrkTAwarDZ7WXpXIjbj
 jPgegiJIQeYUgPny5j80XntbIPGNTQNu4mVCe/rEtFkFzxM8LVKYGrTsuxerzlYOr1tHdV4WJm
 ORL8V7fqo1kZzXY8DV3I2dfr
X-SBRS: 5.1
X-MesageID: 63648670
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h7zCm66qeJt5BJnypm9sZwxRtBjBchMFZxGqfqrLsTDasY5as4F+v
 mAWXWGEPv2MYGXzf4t3YNixoxxXsMKGn9FiTlQ9/Hw1Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2tEw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 /hn7qCgElkSPJbHid05CxxaLgMuIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmxu2pAQQq62i
 8wxbSg2SQjFaC90CF49EKkQt8bwgUemfGgNwL6SjfVuuDWCpOBr65D1OcfRUsyHQ4NShEnwj
 kvc42n8NTQLO9WexCSt/2qlg6nEmiaTcIgfDqGi//hmxlia3HUOCQY+XEG+5/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Ug4QGQzuzP4gCWBkANVDsHY9sj3OcIQjgt2
 k6MjsneLzVlu72ISlqQ7r6R6zi1PEA9L2UPeCsFRgst+MT4rcc4iRenZvFnHa2uh9v5AwbZx
 TyQsTM+jLUei80M/6ij9FWBiDWpzrDLUwo06wP/Tm+jqARja+aNQIil6kPS6/paG7qIVVmKv
 HUCmM+24fgHCNeGkynlaP4WALij6vKBMTvdqV1iBZ8s83Kq4XHLQGxLyGggfgEzaJ9CIGK3J
 h+I0e9M2HNNFCCHR/RLc9nvMMYRxrnZMYzgVM32PsUbN/CdazS71C1pYEeR2UXkn04tjbwzN
 P+nTCq8MZoJIf85lWTrHo/xxZdun3ljnj2LGfgX2jz6ieL2WZKDdVsS3LJihMgd5bjMngja+
 s032yCim0QGC72WjsU6HOcuwbE2wZoTWMqeRy9/LLfrzu9a9IYJUa65/F/ZU9Y595m5b8+Rl
 p1HZmdWyUDkmVrMIhiQZ3ZoZdvHBMgj8StqZHVybAzxgBDPhLpDC49FJvMKkUQPrrQ/nZaYs
 dFZEyl/Phi/YmueoGlMBXUMhIdjaA6qlWqz09mNO1ACk2pbb1WRoLfMJ1K3nAFXV3bfnZZu8
 tWIi1KAKbJeFlsKJJiNMpqHkQju1UXxbcovBiMk1PEIIx6ymGWrQgSs5sIKzzYkc0malmDEh
 lrJXX/1Z4Dl+ucIzTUAvojdx6+BGOpiBEtKWW7d6Le9Ly7B+WS/h4RHVY61kfr1DgsYIY2uO
 rdYye/SKvoCkAoYuoZwCe8zn6k/+8Hut/lRyQE9RCfHaFGiC7VBJHia3JYQ6v0Rl+EB4QbmC
 FiS/tR6OKmSPJ+3GlAmOwd4PP+I0usZm2eO4K1tcln6/iJ+4JGOTV5WY0uXkCVYIbYsaNElz
 O4ttdQ48Qu6jhZ2YN+KgjoNrzaHL2AaUrVhvZYfWde5hg0uw1BEQJrdFi6pv83fN4QSahEne
 2bGirDDirJQwlv5X0AyTXWdj/BAgZkuuQxRyANQLVq+hdeY1OQ82wdc8GprQ10NnAlHye96J
 kNiK1ZxefeV5z5ticVOAzKsFgVGCEHL80D90QJUxmjQTk3uXW3RNmwtf+2K+RlBoW5bezFa+
 pCeyXrkDmm2LJ2ggHNqVB43seHnQPxw6hbGyZKuEMmyFpUnZSbo3/21bm0Sphq7Wc48iSUrf
 wWxEDqcvUEjCRMtng==
IronPort-HdrOrdr: A9a23:yQNK76qTvzQe4dUKHPa2ICMaV5uzL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PfP+W5gNcNvpcfHHelAlfii8Ql56AW6XXZ3vaEi946Ie3t0OlZSXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,350,1635220800"; 
   d="scan'208";a="63648670"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Erq9s3DshoVbOuueouQIiBhO7oiSn7WWHgMm/t//hLYj2VbfL32BiA4YZ/C70b7eagu1pZAHHtrj/36a/hoaU9ngKuYNltwG5/qrUEcp15PidhHUbLd6XtsOskT3Dz9FKjXKJxV+efix2reo4GRqVr85yHiGFMmtLnZUhmj68/U69468kpRUvnS51cygJ78LgQBV+z1lgH2DkuAPk8RxRLwHWKCWdPsvyfRCNOwbblRNiEmLdPGTmCiimB4h/I0aN6FCIJGcSIgRL9HdfkzgL60wPI+X+6X6PeNLrshGG2G0HV5g13ng8zmTgh9s6F7pc2QCtThObP35d9KVA9mrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtBuAKzR6Tk5ZeZL0ME6i0V2Jq+Z2Q1SPr1dLxa5jDg=;
 b=GMTIhQQquFo8z4ySc3BIX6wvP9/qqzozrEJinbY5Sx3X9kptGMHOllbciBH9kzLZDlu+Gx6g9QtnuEFg+oIeHMrzDsKw7p9o2RTiUDzY8VnOP9zfhkGT1tcKiZvBZ20ANfdaAWUZpxPXKP0MHm5Pvuki4s3otrIRlK3vqh343hy0llIyo/wbp7A564UR2VMuneFNpJujz0H4eq3MW1/yopNTDRm+K56+ImfElmhtUco1FeDWjYutTUX2CQ3AS4bNf1rkUKk1XU9+AJB79z3HbhvCFuDPa/yE/sWlhi9GgPUporl4dGi4vpvgWxaiaqNGuvIZUdk/kd8BM1dT4N2ROw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtBuAKzR6Tk5ZeZL0ME6i0V2Jq+Z2Q1SPr1dLxa5jDg=;
 b=Figi42tM2DLxJee9MVKf98AifliqDJ1L8wH3ZaX7azgHYrqiQhYBHp1N7ACZSb8EX/oiHg9aqT+6qwtxNxp9JvSbKQv3kZo8eye1IkfrRXDmKX8dMcKL0NshAFyrGrQgGGhyVOAEuI0dK1IejncORs6C7lP2VzFEMuUJK7ubpDA=
Date: Mon, 7 Feb 2022 15:19:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Message-ID: <YgEqXhxOqKq92+Xn@Air-de-Roger>
References: <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
X-ClientProxiedBy: LO2P265CA0183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 694b8e01-3ce4-4cdb-ef0b-08d9ea44d1cf
X-MS-TrafficTypeDiagnostic: PH0PR03MB5734:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB5734E1E8A786CD9689C0DDCA8F2C9@PH0PR03MB5734.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rq+MnS+fGlqb5NavoQ2NlKoW3TZDWYmPECz+4E+CR3zqphehPzuaR612rxl2Xdh1b6bIrmgW5bgH35iJAhEWt3snrgyr1Oq4ffannDM10n61kTC0xv0JwhqYFE3cS3IwzL7ZGidL3whpuEezjAVXE2Hd9Ob1uULA1cmGtmO8fr6lwKsQE7l7YyySm1exzAQSThb1maJpuuJieotyVmUV6Cu7Vu3+ijAeRvudnMK0G3lwvfvdeKgQ+OYwh2x40E66gQP0zwW3UaUq3kRVp+3IB0BYzsj0gAFQ0mept7B2jQvWiCrqQ7lSn7deOI5MxdX/5qICbVjc/mg6WpMigJV5a5pD3xqXtRc71td8PRNuFg7LXk7bXP07uWk7Nd3GYuKDfLFbrvETxyPI5pjStnG/hVPbtVrjfNkWEzDoQiYeBLnuKlMUhRSQkzHXYfDOGzsVXFlhLNBHoESyQCW4kgpDNUyG30ITYmMnM2aGRaVg+1YQl1Vmyf3yzBC0iUQivk6yUDTihlbUtwP4j0K5vtbQWbzEWGEzE12Or5tt8NBdbUp+z0rCjXg0n7rSfPOKTmW3pfpz+Uos5IDbyKF1LGDIaklqcN3Ccp9fG8MeJ4+8/lPOmOudAuuw+MVLQgOIrKf/pyaqZlDtPDb98PfqxjTndvdomhTCpXIFMzPzAdLCQ3YT9BjHJhT6IQtUbCKmkUOa6NE6KHfI6U00rc142nsvcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(2906002)(54906003)(33716001)(66946007)(316002)(6916009)(508600001)(38100700002)(6666004)(82960400001)(83380400001)(5660300002)(8676002)(4326008)(26005)(86362001)(7416002)(66476007)(186003)(66556008)(53546011)(6486002)(85182001)(6512007)(9686003)(8936002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VS9QM1RyRTAzUHJlZXBmMENzbzZGSU85WlZ4OERZUUJsWU5aSzVHK1g0UnVF?=
 =?utf-8?B?RmVTaGlBMm41V1Ayd2h5YWJ0ZUV5TmEvREtxTjJRY3Rwd3p1UlkyRjVaekVP?=
 =?utf-8?B?cDQySEp2NjhzbFVJTFBLSlBMN2NEOHpXZzFrREplVkhLWFBCUVNwaXExZVdq?=
 =?utf-8?B?bnRNdVVHZ2kwYzlaMERnSEtoOU1JY1dvcHFZRFNDdXpTVHBrbzMrRktJR3cv?=
 =?utf-8?B?d1ROcWovVDVTUVBZUzlWWHlPQ08zUklsdTl2SUlDU0x1T1lHeDVvSkd3NDN6?=
 =?utf-8?B?RUZJZUNHZ2pPTEF4aTgrTDU0UmhWVERGK2EvTnN1WnI4S0d3TVhjMEJXdEYv?=
 =?utf-8?B?ODU0a21qaUMvd1EvdnFic0pyeDRRSTl2UUhmZDBidVh2N0R4MlQvUHc2aWh4?=
 =?utf-8?B?aDJ4VUJpbXd6ZGhxempzVGR6NERYYUtVMU91ZjFGV0dmZE1KcGJBTjdpUnEv?=
 =?utf-8?B?TVUvT05zMkhsTzdCR3pQMDJTUFM5amRnaXFieXdaZ01xeDJ0TGh5QWZJRHNS?=
 =?utf-8?B?M0diWGFyajI3MHMzcWx6bzl1OGMvVnR1cC9wUzN3MXkvdGNLWnZRZ1lRSllU?=
 =?utf-8?B?TUljeWhNODJybkR1Y0lqdUJyNFlwbzhyWmpNRzV5WUEyQjB3RlEvcy92UVlz?=
 =?utf-8?B?N0JDTm9FYm0yOENlZllzOGhjZkM3dE1PK1RUMHhwTzI0eWpCblhLUVRFQ2E3?=
 =?utf-8?B?T0ZIM2RZSFBEVjlVYmNwK0pwZkNiTDIrWXV4REd3eVVqcWV4MDg1bzE4UFB5?=
 =?utf-8?B?WVRHa0dlMmdGbnpyTk5JNXViZkNUZU9yTFNhOUtJMTB6Z0pLZnY5Z24wd0Q0?=
 =?utf-8?B?Z0NyVDd4WUxVZFQzdjJ4OWkrZ2JiRU1JL2t6NTZnd1A4U3FQLzZkTDZHYXVx?=
 =?utf-8?B?cUxDTWU5TmtJcTd0UXZISUJ4eHpHcWtuak0yMm9JekgyTXVPaW9tY3FUMHNT?=
 =?utf-8?B?NG1zbHc3bnNzWmt0aldLcWx1anRKL2xIZTN1U1JTUmwzdGtpdXhyeGp3c1Yr?=
 =?utf-8?B?VXdmTmZxUWYreFRSUFR2cGNKS0hhU0Y2QTRkeGY1VVlobTJPT0xMZFBOazB0?=
 =?utf-8?B?RXdvNU5QcFc4YnhOSmVHaE92WHFKYVJHM1UzVGV2bmpaeER4S2o4cU9HRnpQ?=
 =?utf-8?B?MFpwMHdzcGFiUWhXaGl1cHFMOU9lOUJ5ZC9wMVlhS0toeDhacVJEU0hrUUVp?=
 =?utf-8?B?SGowOUd6NlBHRnc1VHk2dEg2RXE3eGRQOU5lK1dlaUtVZk9OV043dU9JelBE?=
 =?utf-8?B?K2dvWlNjd0c2YnVsTmpka3RSMmpESlJYQjFzTE55TUQvSUJCTUtDdHhKcXlV?=
 =?utf-8?B?dU5VVGxNTWVTMHRrNmZLY3VVNDRheWFGSGhpVzJLMUdwUC93OHFTS1dZRzdN?=
 =?utf-8?B?dkQ4NzgwTHpkYWxGSXZuVTc1Zm12MmVMS1o0Wkd3QnZ5UWZZNkNFU0lkU01X?=
 =?utf-8?B?OHBnTnZCZWxtcFQ2b2E5L01BQTYwSzdEUm10VENaZHpXSDQxSFp2eDRpWDE1?=
 =?utf-8?B?QXExZHdYY01iaGxOK1FtUWpLajBmd2d5d25YL29CMk1EV0lHZDZxczkvLzFU?=
 =?utf-8?B?SHBtaXQ3SjFjQU5pLzdrZDErWUtJTXF5dS8xZ21PWXNRYWs1YjFaSk9YUlVQ?=
 =?utf-8?B?dVN4bUV0WDByeTBYN0NtYlUyVktEQWhCTi9QMmQ2bWhKY0hpMEk4aVpGcGFa?=
 =?utf-8?B?emQrdVVDRlZTa0w3MEZnenplZ0lKekRHRlBXbmtueGpWVFJXNjVudU1yOTU2?=
 =?utf-8?B?Z0xaaVpBTHRBUkozSnczMWQ3bFUyRXlxZFRJYWk2U1I0QnQ3WTdicTdZaWdW?=
 =?utf-8?B?dlFobDJ5NTlxK1BBemNqclJ2QlpTcFNDVVlxWWxieXpwZURqcTRvMTdYcE0z?=
 =?utf-8?B?WFhKd3FEYUtQVkFZZ0Z0L1FDaEZSck94Q2pZN3h5VU44TVpaZWNpc3lMQnB6?=
 =?utf-8?B?TDI4T3hib01kdUVKY0tUa2pDdUZsSWxHclY3SkVwMGZ5VGNIbHAyL1ZhV3Rm?=
 =?utf-8?B?MERWVUpuM2U3dUtWSEoreUZ0bUlWMlZpdjZqSDdXcmRKeEhmeHJ4OERHWnpU?=
 =?utf-8?B?NURSMWpBejdqWEVpNWdVYUE4bW1YaUFkZlo2NGhReFZqa29GVW4yUEpMaXox?=
 =?utf-8?B?RTRGMWpTOXdsUHp4cFMyMVZRUzc2YnBjY3g0MlhURWlsdDVvZnhySXZZTzgz?=
 =?utf-8?Q?x477Y9/vo7D6Vty/6HSAbRI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 694b8e01-3ce4-4cdb-ef0b-08d9ea44d1cf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 14:19:14.9782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqqKD2ESBYPGnC/JGlZa06btSwGWydmTahjwp2W8nDh53Cr5ltGXkr/RPMDUYI5T0nU9QuEZG60NbE9l7RJ8JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5734
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 01:53:34PM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 07.02.22 14:46, Roger Pau Monné wrote:
> > On Mon, Feb 07, 2022 at 11:08:39AM +0000, Oleksandr Andrushchenko wrote:
> >> ======================================
> >>
> >> Bottom line:
> >> ======================================
> >>
> >> 1. vpci_{read|write} are not protected with pcidevs_lock and can run in
> >> parallel with pci_remove_device which can remove pdev after vpci_{read|write}
> >> acquired the pdev pointer. This may lead to a fail due to pdev dereference.
> >>
> >> So, to protect pdev dereference vpci_{read|write} must also use pdevs_lock.
> > We would like to take the pcidevs_lock only while fetching the device
> > (ie: pci_get_pdev_by_domain), afterwards it should be fine to lock the
> > device using a vpci specific lock so calls to vpci_{read,write} can be
> > partially concurrent across multiple domains.
> This means this can't be done a pre-req patch, but as a part of the
> patch which changes locking.
> >
> > In fact I think Jan had already pointed out that the pci lock would
> > need taking while searching for the device in vpci_{read,write}.
> I was referring to the time after we found pdev and it is currently
> possible to free pdev while using it after the search
> >
> > It seems to me that if you implement option 3 below taking the
> > per-domain rwlock in read mode in vpci_{read|write} will already
> > protect you from the device being removed if the same per-domain lock
> > is taken in write mode in vpci_remove_device.
> Yes, it should. Again this can't be done as a pre-req patch because
> this relies on pdev->vpci_lock

Hm, no, I don't think so. You could introduce this per-domain rwlock
in a prepatch, and then move the vpci lock outside of the vpci struct.
I see no problem with that.

> >
> >> 2. The only offending place which is in the way of pci_dev->vpci_lock is
> >> modify_bars. If it can be re-worked to track already mapped and unmapped
> >> regions then we can avoid having a possible deadlock and can use
> >> pci_dev->vpci_lock (rangesets won't help here as we also need refcounting be
> >> implemented).
> > I think a refcounting based solution will be very complex to
> > implement. I'm however happy to be proven wrong.
> I can't estimate, but I have a feeling that all these plays around locking
> is just because of this single piece of code. No other place suffer from
> pdev->vpci_lock and no d->lock
> >
> >> If pcidevs_lock is used for vpci_{read|write} then no deadlock is possible,
> >> but modify_bars code must be re-worked not to lock itself (pdev->vpci_lock and
> >> tmp->vpci_lock when pdev == tmp, this is minor).
> > Taking the pcidevs lock (a global lock) is out of the picture IMO, as
> > it's going to serialize all calls of vpci_{read|write}, and would
> > create too much contention on the pcidevs lock.
> I understand that. But if we would like to fix the existing code I see
> no other alternative.
> >
> >> 3. We may think about a per-domain rwlock and pdev->vpci_lock, so this solves
> >> modify_bars's two pdevs access. But this doesn't solve possible pdev
> >> de-reference in vpci_{read|write} vs pci_remove_device.
> > pci_remove device will call vpci_remove_device, so as long as
> > vpci_remove_device taken the per-domain lock in write (exclusive) mode
> > it should be fine.
> I think I need to see if there are any other places which similarly
> require the write lock
> >
> >> @Roger, @Jan, I would like to hear what do you think about the above analysis
> >> and how can we proceed with locking re-work?
> > I think the per-domain rwlock seems like a good option. I would do
> > that as a pre-patch.
> It is. But it seems it won't solve the thing we started this adventure for:
> 
> With per-domain read lock and still ABBA in modify_bars (hope the below
> is correctly seen with a monospace font):
> 
> cpu0: vpci_write-> d->RLock -> pdev1->lock ->                                                  rom_write -> modify_bars: tmp (pdev2) ->lock
> cpu1:        vpci_write-> d->RLock pdev2->lock -> cmd_write -> modify_bars: tmp (pdev1) ->lock
> 
> There is no API to upgrade read lock to write lock in modify_bars which could help,
> so in both cases vpci_write should take write lock.

I've thought more than once that it would be nice to have a
write_{upgrade,downgrade} (read_downgrade maybe?) or similar helper.

I think you could also drop the read lock, take the write lock and
check that &pdev->vpci->header == header in order to be sure
pdev->vpci hasn't been recreated. You would have to do similar in
order to get back again from a write lock into a read one.

We should avoid taking the rwlock in write mode in vpci_write
unconditionally.

Thanks, Roger.

