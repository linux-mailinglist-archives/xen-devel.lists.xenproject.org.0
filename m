Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA6F4AD451
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:05:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267770.461524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMRQ-0007Te-KL; Tue, 08 Feb 2022 09:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267770.461524; Tue, 08 Feb 2022 09:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMRQ-0007R2-GV; Tue, 08 Feb 2022 09:05:40 +0000
Received: by outflank-mailman (input) for mailman id 267770;
 Tue, 08 Feb 2022 09:05:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmUj=SX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nHMRP-0007Ga-4G
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:05:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 475ddd22-88be-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 10:05:38 +0100 (CET)
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
X-Inumbo-ID: 475ddd22-88be-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644311138;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=h4K/w5avGstELh5ky7AVbNK1DqlLQsINCRuvOUCVlKE=;
  b=fiWxexMW9UTJpyd61lnQztHemEc+V3Z6CYXt0iTSgCdYGDwf5NbCV4Za
   URoKUNqTqnr4a4V22vkcgZY3MB8oTi5L0on5774rUk1uykD1JmVz9WVpu
   +5lV6H4PmD7sbZEDoxxtO0Sp2ANQdyX3RrTGec34JEYcn3dIPlqkTdhyQ
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: f0Wsqfws7Zsc9klXGC9pB5J04ov7hxMYPLREhVnfETKvCC2NKH3pmXZYbxMBQi3xuYnJ79TIjQ
 2pb0uLzNBNE+Qz0XqInIm0+1g/A0lEGt4SI6FBsKNAHIeAXkPoDIZ+Lk7Ofomw6yrwk/RbMI+t
 02A2ohWUpW3XStrY0yLoadQmes8FWAVDFeIUZNjrAONahk/9Zw2OhIotRAnbUdV3hcQE5mSgpA
 KV4hSCm6qHawZMjBjN3085DGQnaoKsET/xGf/DzQpXwO82UN2E1WwDvXANFqUStuwnTFGiFFb+
 Y2fNrfg4oN98VSvgRhoB9Nj7
X-SBRS: 5.1
X-MesageID: 63714736
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pgIGzq6NCh4J28I5q4A0jgxRtBjBchMFZxGqfqrLsTDasY5as4F+v
 mscXmrQOqyCMDDxc4x0O9iz8BlT6sWHmNViTQBs+S83Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2t4w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 9FIlL+oaVgSF7zsqPs0XDsHASVhIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmxv35wRRqi2i
 8wxZBNMSTj/eid2PHQLVp9jt/bzvlXuWmgNwL6SjfVuuDWCpOBr65D1OcfRUsyHQ4NShEnwj
 kvc42n8NTQLO9WexCSt/2qlg6nEmiaTcIgfDqGi//hmxlia3HUOCQY+XEG+5/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Ug4QGQzuzP4gCWBkANVDsHY9sj3OcIQjgt2
 k6MjsneLzVlu72ISlqQ7r6R6zi1PEA9L2UPeCsFRgst+MT4rcc4iRenZvFnHa2uh9v5AwbZx
 TyQsTM+jLUei80M/6ij9FWBiDWpzrDLUwo06wP/Tm+jqARja+aNQIil6kPS6/paG7qIVVmKv
 HUCmM+24fgHCNeGkynlaP4WALij6vKBMTvdqV1iBZ8s83Kq4XHLQGxLyGggfgEzaJ9CIGK3J
 h+I0e9M2HNNFFiuaI5Ue6LuMO077Zj/PNvHCeLQccUbN/CdazS71C1pYEeR2UXkn04tjbwzN
 P+nTCq8MZoJIf85lWTrHo/xxZdun3ljnj2LGfgX2jz6ieL2WZKDdVsS3LJihMgd5bjMngja+
 s032yCim0QGC72WjsU6HOcuwbE2wZoTWMqeRy9/LLfrzu9a9IYJUa65/F/ZU9Y595m5b8+Rl
 p1HZmdWyUDkmVrMIhiQZ3ZoZdvHBMgj8StqZHVybAzxgBDPhLpDC49FJvMKkUQPrrQ/nZaYs
 dFZEyl/Phi/YmueoGlMBXUMhIdjaA6qlWqz09mNO1ACk2pbb1WRoLfMJ1K3nAFXV3bfnZZu8
 tWIi1KAKbJeFlsKJJiNMpqHkQju1UXxbcovBiMk1PEIIx6ymGWrQgSs5sIKzzYkc02cn2DHj
 FbPWn/1Z4Dl+ucIzTUAvojdx6+BGOpiBEtKWW7d6Le9Ly7B+WS/h4RHVY61kfr1DQsYIY2uO
 rdYye/SKvoCkAoYuoZwCe8zn6k/+8Hut/lRyQE9RCfHaFGiC7VBJHia3JYQ6v0Rl+EB4QbmC
 FiS/tR6OKmSPJ+3GlAmOwd4PP+I0usZm2eO4K1tcln6/iJ+4JGOTV5WY0uXkCVYIbYsaNElz
 O4ttdQ48Qu6jhZ2YN+KgjoNrzaHL2AaUrVhvZYfWde5hg0uw1BEQJrdFi6pv83fN4QSahEne
 2bGirDDirJQwlv5X0AyTXWdj/BAgZkuuQxRyANQLVq+hdeY1OQ82wdc8GprQ10NnAlHye96J
 kNiK1ZxefeV5z5ticVOAzKsFgVGCEHL80D90QJUxmjQTk3uXW3RNmwtf+2K+RlBoW5bezFa+
 pCeyXrkDmm2LJ2ggHNqVB43seHnQPxw6hbGyZKuEMmyFpUnZSbo3/21bm0Sphq7Wc48iSUrf
 wWxEDqcvUEjCRMtng==
IronPort-HdrOrdr: A9a23:1ub9EK0lxhbJ/dJB82GjmwqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W1Dk1frsA6ciYnV9MNOA4/e7rFNoXse2O7DIvAGyWvKEk4U0i92aIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63714736"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ST3RM8TV2Mj4TiVoSljUlf9J6/EQR789Xx7Jz4WxHwlAB4C5VJkPex3d7GjF+N/ZYcoI2TzQNx+vLBnSruaxD/oXVETazojdqCnMdxQrLT/y1YqvQQ/W57cZpAODW9lKFSmbF+k1uEWAPVkfwxg/mlZ53/s2Kl97sMej8rWJjKkPRCymWxZntLaCk53XAE1ZcQHKqT7I296VnSe4Gep/DkIfCHoWIamGXl0CJUoTvR5fgj+0ae14VS9YKDhMLLN6GIQOU6xGPhHAVC440xbFeNjylT/5FgskzX0CZKc0zbVWXwxrlinkVWTzftbuoP2GtulEAb6roIozyFcvesoXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8c49+exqzIWGjgj1m09xmEF8LO+OXQwJssQsXtvCzo=;
 b=cSGPswqw8UF9F5jVf/q/KomjvkreAHuMVHP/QuVqIzoad3OZk1puRqYwDJxDGP72mA8SZBrcyWTKN/vgJh1D2Bq2RQ38/Qp9RxCm6Yf3gNMNw4oNhGe5IcygkNZ6Xhf6TFNTV49I5Muv4lDmrSXHTVMRhQ8gJDXST0eWiK2PyZ4ZRiVqlCKx2EBAc/7wlWC/L2YGxJyocDoFFJm2N1gwEAtRC1atyYikxKj3wvJSLzGFZrCJjEMwJlaesT4j4u5iGlskQ/EDclFcGGldh1IOkjwMr0/vnuYVDPeekkVmDNvNnlESnvLVmSb9EXqyfei06pr1uMVdVWUtF8jDm/9lIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8c49+exqzIWGjgj1m09xmEF8LO+OXQwJssQsXtvCzo=;
 b=lkuPgJ2d2NmeKkIzx/V225R1x6H3DCAFxhBUR1a6Df78N73lpPqFfaiwmKlfLY8U3+o+3p8Q7C05Ny298cJ2P5bb+x3XhcOo+Zouz8/BYtwH+gTx2tGvcNLVZEYaU5NJaEVI/JoJN8fLwAU9I7Al+GYr6YyMGNGflwz+hSLFiLo=
Date: Tue, 8 Feb 2022 10:05:27 +0100
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
Subject: Re: [PATCH v6 04/13] vpci: restrict unhandled read/write operations
 for guests
Message-ID: <YgIyV9iboIxVrCS3@Air-de-Roger>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-5-andr2000@gmail.com>
 <b6f091ed-4fa3-e292-9a21-a780ec90ee09@suse.com>
 <f86a43af-1388-6959-3e71-ba796e4a0c63@epam.com>
 <5a87c401-4ebd-1d5c-b98d-1b535f63be65@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5a87c401-4ebd-1d5c-b98d-1b535f63be65@epam.com>
X-ClientProxiedBy: MR1P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3b91dc6-cd08-41dd-5a52-08d9eae22976
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6391:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6391FBBBADB2C90D6DBF230C8F2D9@SJ0PR03MB6391.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TTrBNmojxesaU+dlGiZk9NTI+E3Q9qQj1Qk7IuhAAFitgMA1t2H6TC5gdzKXm9eKUwIpF37Rtgw8Fb8MIRuAaBe4/6hSgqhFwf/MYeofkDprMCWHKpMYX6xsfpv3yKrgggHqQ2K+X/j1rim1/DBz0QmtaGUZbeyRSK1sRFviH7ffML+zbFU7cEQPt4evA1VDxJBLFaTV94hPDaJ6uILs2nAy7LOUd1DyDtvy0J4k/IV5nYnK3AcIAeLym+kRC2Np/ySLuDZXWpM2VH1KgupZLsenn27Tg0grakcz3at0e4BYZTQV913AakSce92zeWElVWFCUMK1hv5o6HdGayhNfmeHLAHX+0Iwbh5ehQEUvSB75U2G8KWzpjKa/MjpfPvwsPG5iUJJ9oGmHw/4t0Ya8cw6I/q3HRhKVU4Zwljd9u9v9sA2JXK+6DTH8q7JryokWWCbbHztNlnvxyGwyEbnT2aNQXSopQ50B987ao7H0kHDXQp+0Z6ftHxNZOHY5/gRk7/bEFzOu4IemDyK3r41XzgMRMxHhRYw7gv+xNV3a5hxDL10AXVVLVYe4Zn7da1ZaDR2NeFUp2KvTDCiTywIe5xULVpXuuF6UtMzJdszNqXe1QctWI9Tuk/9QMYdMxNIH0uEd+VSESlQEbapQuat8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(508600001)(7416002)(6486002)(6916009)(6506007)(66476007)(53546011)(66556008)(4326008)(186003)(8676002)(2906002)(26005)(8936002)(66946007)(85182001)(9686003)(6666004)(316002)(86362001)(33716001)(82960400001)(6512007)(83380400001)(54906003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVVLeEd4WlA2eHBVYytIZlY0eS8zaHdHWnV1cEMrNmlYR0pGdTlVWWphdEpi?=
 =?utf-8?B?VzlmUHRjdHNLVzBmRW1FRTYwS1l2QmRUaDQzVm90aHFubUIvZE1uN0dOZzFI?=
 =?utf-8?B?eE5iRE9XTGJTZzRsVVI4blAwem5EVkpTMWIvNklON05DWjd1aXlXeTJHdG1H?=
 =?utf-8?B?OStrZ3d3VXE2Yyt4dmdlWnUyTjBWdXJwa2N2YlZ2cGJDOTZYaGZZR1ZzMWhG?=
 =?utf-8?B?Z0daeGJzN1h2d1o1UWpMNkhrbFJTejk2NFRnWU9ZcDdld1ljdFJqcm9pbjAw?=
 =?utf-8?B?eHNxVEozaXlTUjFiMzQrL0RZQ000NkdLcGRUVHFKUnFxTDZIdm5pVDhwZGlv?=
 =?utf-8?B?SXJxRWt0WmsvWGFWNWxraVZXa0ExdnMwNHArZTBManZISmxuWXBqY0M5eUEw?=
 =?utf-8?B?Nlc4dk13dTRabzcwTmNZTTQ3YURzM3htZkhzTWdkUElidjVaNzdpalV6NnFs?=
 =?utf-8?B?VHplLzMveEVNdjhrVXg3eVlFY1M2MitXaHUzRWFZN0FLOUd0NDZ4VVV0RWlI?=
 =?utf-8?B?bnljYjdnZ2tsRUEzV0JHaEZoZXpoMXQ0ZTNHZ3VjZVB4cFczSHhuVHRuaEVZ?=
 =?utf-8?B?ZlNCRFlrM3k5YWszdEplbFlUY0hJdGZ1WnRaL2cwZ3M5QUxGZmVGSmJxWnVx?=
 =?utf-8?B?OG03Z2tTRitPaGZPRi9EbCsvQWNXNUNTb1ptTDgrU1d3SEQya2g0YTRIbUV2?=
 =?utf-8?B?ekxobU9WVkNNcGthZWFIclk4Sjl5K3ZrSVZ1Tm93MWorZzNjcFJSaXZBNXpz?=
 =?utf-8?B?cEZERWN3V01SaTBubnZjL0FMdXJsb0NKdElTVHcrRUowL0dsdy9MaEJFTWFr?=
 =?utf-8?B?cjZTcFEvbHE1eEVBVzJRTkF3Vm5WSE90ZXY2dG84OXNxUXlpcWlVdnA2dlcv?=
 =?utf-8?B?UW5YUTFWZ1BWUEZyQkpkclJneE1vSnRyVEU4MTVQMHlSZHgwdmVFemZySGZJ?=
 =?utf-8?B?NHhqVGVaTjVZKzNETzd6ek5oRDhDT055eS9qZ0VaZEkyUk9zdkUwOWVoK0NK?=
 =?utf-8?B?dTVvOGtVeVhSaWxIT2ZHcExSOEZqUkczMkNiRitsZTg2bU5KbHVyRS8zNkpj?=
 =?utf-8?B?M2l1TnRjWElhWEY0RzdhUUVjM1hkZENTZUFKR0xKOCtxS0J5QmVSVEJxcktu?=
 =?utf-8?B?bENzbk96ZW04S1hmN1paQit3ejNabWJnWE00ZW5nU1hKUnVaNXhsRHpXbmg5?=
 =?utf-8?B?Q0lFdUZnbFlRRUtvdy9tSXBCeklVWEtPZ1VDbzFiZ09NcWJITGFqZlh2S3hk?=
 =?utf-8?B?Z3dVVGJuVXZ1MnptQjVUTjBWVCtIZlpOVVk4ZDFhdU9jVW1tb1I5elZyWFdz?=
 =?utf-8?B?Vk0yN3dIQSt0emRWcDBJUFVCbHRVSFJrWmZ0dTUydEZZRjBhZllZMVNyanRz?=
 =?utf-8?B?WGJjMVZnUlV6ZVlJT1MxTmwwbEJaNm9TY0VEYUhMdXM5TXBXMDN6cWJqNnZq?=
 =?utf-8?B?cklJZk96eVM1TDJIREF2WUFqVlNTQlhkeCtTZE55VjdGSzdCMVFReGlzSVRq?=
 =?utf-8?B?T3FBb1VYZzF1NWxCWXZxa2hBSEZqWFB0eVRUTTNTTldIT1pWWWxkMmtNc3dE?=
 =?utf-8?B?ZDdNV1huN2JCQlNFL0hzSlhiNnBGaEdjZE5jRDlqU3NqZis0a3Vac3B1aVdS?=
 =?utf-8?B?MmZzMXA5d0NXWTlRVGx5T0oxMnlHcnpDbEdBZFhVUUQxS3VjbnhsVlU4c1Nn?=
 =?utf-8?B?RXFTazdiV013aWRQNXlTN05raHN1aElaMXR0cWN5RlVPVkR6MnpkeFI3Y2VE?=
 =?utf-8?B?UXM0Y1J4dWU1c1NFNlBuUmtXazZvNksxZ0p3Q2c2R2tXcWpvQVhOMGUxMDNN?=
 =?utf-8?B?Y2lvRHBtcjRTY3lrcjlqSmdJNzBVazljQmZ6UU1jalF0TGNzbVRvb2dId0pw?=
 =?utf-8?B?TmMwR2VhbjMyQVhBMG05bi9JKzlDS1dQS1ZibDVvblJmYmFXR09lNmdycGZT?=
 =?utf-8?B?RFVpajMxK0lJdGpYSTBYaTZJOWk3a0dlOXZvSUpjUUZTd3R5dEVOZlAvQWIr?=
 =?utf-8?B?VmpjeDNMMUZjUUZVaDNINWJidkZEZjlkOFQwSzJDalR3Vk1tWGJqK043L29Y?=
 =?utf-8?B?U3VESzNmbE5OcFBGdmRsRlU2cXhVcGhETWpmdnQ5S1VUbElMRHBKNkQyVjE4?=
 =?utf-8?B?RGVoemNUQXc0MEZ3K0VyWTJ2b2ZxNWhhVFcwVEJLbWl5U2VLeHM2UWE1cGkr?=
 =?utf-8?Q?n4FVveWHKaiNGayLtxqs5NQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b91dc6-cd08-41dd-5a52-08d9eae22976
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 09:05:32.9859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkEpvu137Nh+vDtk2i0JPbMgx36hzpSylJM1Mjccd5RjdEjaHERZxD1aPwloplsdUK1xZccQRThjjJ+zjfisrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6391
X-OriginatorOrg: citrix.com

On Tue, Feb 08, 2022 at 08:00:28AM +0000, Oleksandr Andrushchenko wrote:
> 
> On 04.02.22 16:24, Oleksandr Andrushchenko wrote:
> >
> > On 04.02.22 16:11, Jan Beulich wrote:
> >> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> >>> A guest can read and write those registers which are not emulated and
> >>> have no respective vPCI handlers, so it can access the HW directly.
> >> I don't think this describes the present situation. Or did I miss where
> >> devices can actually be exposed to guests already, despite much of the
> >> support logic still missing?
> > No, they are not exposed yet and you know that.
> > I will update the commit message
> BTW, all this work is about adding vpci for guests and of course this
> is not going to be enabled right away.
> I would like to hear the common acceptable way of documenting such
> things: either we just say something like "A guest can read and write"
> elsewhere or we need to invent something neutral not directly mentioning
> what the change does. With the later it all seems a bit confusing IMO
> as we do know what we are doing and for what reason: enable vpci for guests
> >>> In order to prevent a guest from reads and writes from/to the unhandled
> >>> registers make sure only hardware domain can access HW directly and restrict
> >>> guests from doing so.
> >> Tangential question: Going over the titles of the remaining patches I
> >> notice patch 6 is going to deal with BAR accesses. But (going just
> >> from the titles) I can't spot anywhere that vendor and device IDs
> >> would be exposed to guests. Yet that's the first thing guests will need
> >> in order to actually recognize devices. As said before, allowing guests
> >> access to such r/o fields is quite likely going to be fine.
> > Agree, I was thinking about adding such a patch to allow IDs,
> > but finally decided not to add more to this series.
> > Again, the whole thing is not working yet and for the development
> > this patch can/needs to be reverted. So, either we implement IDs
> > or not this doesn't change anything with this respect
> Roger, do you want an additional patch with IDs in v7?

I would expect a lot more work to be required, you need IDs and the
Header type as a minimum I would say. And then in order to have
something functional you will also need to handle the capabilities
pointer.

I'm fine for this to be added in a followup series. I think it's clear
the status after this series is not going to be functional.

> >>> --- a/xen/drivers/vpci/vpci.c
> >>> +++ b/xen/drivers/vpci/vpci.c
> >>> @@ -215,11 +215,15 @@ int vpci_remove_register(struct vpci *vpci, unsigned int offset,
> >>>    }
> >>>    
> >>>    /* Wrappers for performing reads/writes to the underlying hardware. */
> >>> -static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
> >>> +static uint32_t vpci_read_hw(bool is_hwdom, pci_sbdf_t sbdf, unsigned int reg,
> >>>                                 unsigned int size)
> >> Was the passing around of a boolean the consensus which was reached?
> > Was this patch committed yet?
> >> Personally I'd fine it more natural if the two functions checked
> >> current->domain themselves.
> > This is also possible, but I would like to hear Roger's view on this as well
> > I am fine either way
> Roger, what's your maintainer's preference here? Additional argument
> to vpci_read_hw of make it use current->domain internally?

My recommendation would be to use current->domain. Handlers will
always be executed in guest context, so there's no need to pass a
parameter around.

Thanks, Roger.

