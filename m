Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB58532831
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 12:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336487.560815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntS64-0005sS-2M; Tue, 24 May 2022 10:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336487.560815; Tue, 24 May 2022 10:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntS63-0005qC-V5; Tue, 24 May 2022 10:49:03 +0000
Received: by outflank-mailman (input) for mailman id 336487;
 Tue, 24 May 2022 10:49:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpOU=WA=citrix.com=prvs=1362cb858=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntS63-0005q6-87
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 10:49:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e8e2f87-db4f-11ec-837f-e5687231ffcc;
 Tue, 24 May 2022 12:49:01 +0200 (CEST)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 06:48:57 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN8PR03MB4996.namprd03.prod.outlook.com (2603:10b6:408:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 24 May
 2022 10:48:56 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 10:48:56 +0000
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
X-Inumbo-ID: 1e8e2f87-db4f-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653389341;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+CB5XIBTxl9KpqOWXK8UUMxWOY2QOatU/TBa81i8ESI=;
  b=evQIjKhOn8GXslzS8bqVgiLd9svFQ3xy/kJLHPKlbm94VfNsELXQDXEQ
   r770cggqP6EBUKEK3tgxyn44mQloZo0ACLibJGemZ3iici82qNzYYaDyv
   5Q1zsAq+p6z8zY3Xdg1ESd8aNxvRd2KX2lBKTHH+stoDscun/XVW8DWCU
   U=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 74553686
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:P5zaLK7emVpsYGy0/5zMigxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 jYbXG/TbPjZM2SjLY8jaIuxo04EvZGDm9BmSQc5rC1jHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXjX1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurS2YloDOYGSnd4RCTZiEypsFIJX2+/IdC3XXcy7lyUqclPK6tA3VgQcG91d/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YHgF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IE9Q/O+/ppi4TV5BFf2eXHN8TzQOGDAuRvo0qDu
 mnbo3usV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YS7QiMzu/e5VafD21dFDpZMoV56IkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLScZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:KIAjpaM4bcLGecBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.91,248,1647316800"; 
   d="scan'208";a="74553686"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lmemz62kWwu9+lRpPU0fvE3q8fxVBXSb6U2yTbpTsImKBSB63oxo5pxVHoPL4R9B8wxjiLfYD3whOf7a9qQp+lSVmRUi2ivJhKJrss1fIqitaxY+UGXDe4a1OIJOdo6iHi5yJAx4t0opWGrEq7Ot2l0QxUf1gw1S1CJu09DWTFgW0glKR4LeLyld75/b3c49eFUon3cK7bzBtgy0De4cug0t4vjQcC6o2RThMvuZLQXJUMjsktZMQtWjZE0gYZHYki19al0PZ+83q331Ip/P0Q8xkXDGTAYo8qoF36UnTvsBG03o36GCipwb56wOXLH0ezkKLzRDfDpnXUqQ3sghOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkkL8uFAuJ6LjMwJxMrbILLKOgiqgw1iWo7SKl6Jy/U=;
 b=DVSok2xyoH3GRNA5Nsm/dsWA6rsUktd8KKulXKTU8HoRUKG5ocTuv6/sCEd1smI4wfNO40DKCXv2Hqk3HG7+FgGuPGxyv9GVxRs98r0N7yssorB0H6kXAu7CbK5hAI51oRmox0QiJB9rJn37sqHG33JjVbA9lRu4dJ6/hwhw5NuzzN4efeTKavMeRRC/ln0oLfl5Biru1CKf4F89s1zEjIZkih3qfvOJ0JD2ZqbLhx1+7IpeCG7aUU77iI++OTvExUv/mRZGSi7RBcRDhkiyDZvHeIZ9rOgUuePn14U7PKrtxcmITvQtZSm+HBB6x1Xmuv0YUQQY4LzshPUnJqRlUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkkL8uFAuJ6LjMwJxMrbILLKOgiqgw1iWo7SKl6Jy/U=;
 b=liEyap+wpWFCmBAP90WT2+S+xc9hicJpnjsgymP5oT6zHHiez2vVWWFDkJfbnEezoXvdmVh44nb+7t1O32hCQOhMTaWh1lHO9zixExUOyV7MipGag8M8S9Mbqe8ghsy1bVq6jMHJdtybMzWHUajatn7hH+ib7p23TYi30AYZtcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 May 2022 12:48:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/flushtlb: remove flush_area check on system state
Message-ID: <Yoy4E1shM2BTlj10@Air-de-Roger>
References: <20220516143116.28602-1-roger.pau@citrix.com>
 <c7878c92-41e7-4628-34b1-1cb409335bf1@suse.com>
 <YoucK13m0y3CqDl1@Air-de-Roger>
 <4b025fee-8f7e-1849-184e-1be8fb99442b@suse.com>
 <You1UKy20ofV8NgO@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <You1UKy20ofV8NgO@Air-de-Roger>
X-ClientProxiedBy: LO2P265CA0429.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a371d541-9217-488b-00d2-08da3d73001b
X-MS-TrafficTypeDiagnostic: BN8PR03MB4996:EE_
X-Microsoft-Antispam-PRVS:
	<BN8PR03MB4996FEBA0B2C15288F9F89E58FD79@BN8PR03MB4996.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GczZVGx6UJsMGFeoHP3oZshVdAf1748xO6WnjZ0jlh2xEbGQ4Vsj8YOnNyZ22rt97eUdB+fR+aMz9rKSzVfjjytVCrmqYKykJhl0IoQD5cd8CbNbpSAFbBAjRU5Z2/TNEdMKDudIRiu7jyw8TVM7g7rCULv9as/Id64thKizh3t3Gvk6+nQR8F6CN+1BdGUnmgsxb8fMIPhJloWXWE5+H0nIkg0EzUdh+jNHrsH3V6iSpOzB+aINGqUQJwUBb1mjyZbtIJcAPuquJNKn5vUPs+Q8ASYz2Ft1i3HIsa0PpbJZSYSZWmfw6Ujssw2X9a74jkfIc0yjMwlzfwrAo2wnD+1IuoIVW91iXrq09cTTpZ19nar93+hjC8bLTBBuakXTCaig50YIEYdBiLiPlEcLUMt+wc2Jh4ZZuO+ep3TY7e4sJtA8ZPv9BbEjsFTAlkyYQfxqNL3MyBCrDW+bZrvIF0jE1bMha4fV8ymAGBgWBw1sWY3HF+lveU7uQyeiGJCXbPtVWai5FPz6SYtPWqfCBfJdt67P8+xC0LOZld2MnwEjZEdqhO1n+2pYHwgG1+llApMKBG2eoFFl46DAxkub/FlIq7/z3evCBcN2/WZxOHUryfO7zuS0tDtdHEnuObJLZ5WEOpYP0zpWxp2vzSi02w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6512007)(6916009)(54906003)(186003)(83380400001)(26005)(6506007)(53546011)(9686003)(85182001)(508600001)(6486002)(8936002)(5660300002)(2906002)(66556008)(66946007)(8676002)(4326008)(66476007)(82960400001)(6666004)(33716001)(316002)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WS9wcTZ1ZWtEdjFCQWdjNWE1N2FxTGRrYUF1dVZGZ2wvM3FNcEFmK3JHR2Jw?=
 =?utf-8?B?R0ZTMzlzMWloL1MzL0c2Wi95NmVpYUtBd0NDd2RDWTlwYStFY1UzUzRoYTJC?=
 =?utf-8?B?b2gxN1NLbllZU1kwdmlJalZ5dEtBa1Y5aXA4elphTGVwTEtER3NQSU1DNitt?=
 =?utf-8?B?UndxQUU1YWQ0TzF0aW5VQmc1ZitpbjRPbXBPaDZDSkNPU1F6RkJrNEhGM1ll?=
 =?utf-8?B?czZtREtKTmIwU2ZOelZKYUxSREJGUlVTa2lRb3JLNXprL1M4SnpjWjBWVmhn?=
 =?utf-8?B?cUlJeWJxaHdjSWRjekFHU0VZTFQ0N1RHK051SHgzdEMzYWZTNENGWERwbEl5?=
 =?utf-8?B?ZUpZaUNPMlNwTXBselRKN2liNzNGcFU4VlVwMk9iWkZ1OHh2Nk9DWU5Vd1RS?=
 =?utf-8?B?N1dVT2Nic3QvdjhmNmFPZE03bjNIeEs2TGpHMUxjQ2dNZHlOOGdaaUJ0cWNm?=
 =?utf-8?B?TFN5Uy9uaG1jZGRRL3FvZU8wbGFzaHViL1hQekVlQUdnSDM1Y052SEZmMEJT?=
 =?utf-8?B?M3pmQkF1bDVLdzlyZHpOKzk5S3Q5SUNPZG1nbXYveExLaGg4dWtuMURSVVll?=
 =?utf-8?B?V3RJWlBFVWhtNStkZitNcGpzTDVoSEtGVVpsdEw5MHNnRFFUWjRHVnUzeXh4?=
 =?utf-8?B?MTFHUlBsWU1UMTNOS29RRi9kSUFvREFNb2Y2ODJ0TDJSdkR3RkJ5SWk4bUlp?=
 =?utf-8?B?c0tNM2dwOHl4T2pwZmZaNHQzV3RsbTJZQ2M0SWRtQjJlNkhONXNxMUF3ank5?=
 =?utf-8?B?NVZaSjk5bDI4ZlRwK0ZITEZNcEl0Qm5LQXFpNUlmOERnd1Y1b3hEOVE3d2Vh?=
 =?utf-8?B?ZHYzZW92eSs0d1JsdHdSV2pTWDhHMXZhUlk3ZHI1ck9Fb1QyOHJQWC9wOTNz?=
 =?utf-8?B?OVdFbWZ2ZzhGWWtLSk5jb0pYMnpBbmR6RzZuRTAxTkhqWGtEYmN1cng5VXRO?=
 =?utf-8?B?RitYSTdTVFJQbHFXY0hHYy80bzV1WnFsUWRWeUwrejA1Rll1OGtqRDQrNWtO?=
 =?utf-8?B?bDE5TlNJcVZlOWxqelRPSXZSNWNzL29IYTA0Tzl5RSt4Q3lWblZ6SHY0VVB5?=
 =?utf-8?B?N0Fvb3FscXMwTlMzdnpNbFAzLzlBN2tKWHRRVDFIS2xaWGxwelhhSHFIcFAv?=
 =?utf-8?B?ZnU4aTdXT1k1S3ltTXJOVmFnVklKRFhUZW4wZjVGam5MaDIwaTZLQ2FNQjQx?=
 =?utf-8?B?Sld3N2FDOUhCZ3hFUm1uMitHWFBVUExUTW1FZE1CNU1Gck9pRGpqU1ZsZ3k1?=
 =?utf-8?B?cU9vU0k1ZEVVeFpSMGJ5UDVNUFZ5akFDbVJkMEY4N2dVNyt2R0N6YVM2ZUdQ?=
 =?utf-8?B?a0R5S3ZzbzJoWmEwL0s1MDQydWplV3NMT1Z2bXY4V2VVdXZYblZhV0J0a1Y2?=
 =?utf-8?B?b2FqbUdlb0RvMzNCNmc0VVdMcFJRaEZsdm52VENkeW40WFM0QWRqTFZDejRs?=
 =?utf-8?B?bzhHU3pyQXdYWHZVVTZWSlZBbTEwWGZzZFIyUitCaEdoWTFzQ1d0bVpmWjdQ?=
 =?utf-8?B?OXM1d2tUalVvQnZRenEybkc1Q3cwdms1VGx6S0dLOHdjTGZGMHpnUFZaT09w?=
 =?utf-8?B?L0tlak9WR081SDBteElDMkpnWi9wNGlpOFBiQVlXMnpWb0N6TzZMZHRiQXVQ?=
 =?utf-8?B?NnhPZEs2TWt6ZG1yaTRNMlRST3pZM3FyamhxUXgvWklXeHl4L0RRUVFKTkNi?=
 =?utf-8?B?OW1hNzRuZ2p2MU51RFM2STcvRGJsc2lkMllsem5BS3ZkKzhtTW1vRmJ1cnc2?=
 =?utf-8?B?TGFGMElLVWlaMzd3SEo2RGJXYWVxUGRJSWF3cTNFejU1d25FOUwrTFNFcndx?=
 =?utf-8?B?TFl3OS8yUkN4NzFlS3F6cXlEVVlINEUvcG5IL3ptMENpdGFzc3ZGdXNOMWtk?=
 =?utf-8?B?TmN5allLay9aM29rajFZWndYK25BTnpSam4zRkNORU5nbGhaN3M2Sm9zRGxi?=
 =?utf-8?B?V3lmK2hKamJlc1g1dmExWGpXWU52MHBUS1VpelQ1R3ZoZjM4ZVg4dndva2dQ?=
 =?utf-8?B?eTFnOW5HcHNIa0k3N3JNR1dCNTRaQUVKMjR4YlUrOEhCMFFIbmR1SGVMejlw?=
 =?utf-8?B?bW9BWjA5cjNQa0JLYVoxNWI1b0p5YjBzRHdIK2ppbzFuUWpHeU1MVVdLTDhp?=
 =?utf-8?B?S3laZzFVUFo2aVZGSU8xS1hmTGl0NHZ3OHFPZGE1WGNEZkUxS2RCYnJ0blcv?=
 =?utf-8?B?dDBVM2tiME1JcWt6QzRHdGdiRUo2WUE0VVNCMENkM3hjb0p6TzhZRnBmdGlU?=
 =?utf-8?B?NUlPNy9UTHFaUU5IYWtMSUFRS05GSjV2QWRJOW9Ed20rL2tYYnNvVTdaSG1M?=
 =?utf-8?B?d1ZPTmlONzdxNHJYRWpFS1hQY2s3TnlnL3ZTUWxUb0hmNWpUdFUvZVoya3JU?=
 =?utf-8?Q?eGzqXrj93yxb6wWg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a371d541-9217-488b-00d2-08da3d73001b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 10:48:56.0524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzkxdSv+Wv96GDEVR6VwLrIXU86npwFId2erxXQKZF4NVQZgb1KWNx0qqPKvS7pfi/BaUqzW3H38bRvuJjHrZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4996

On Mon, May 23, 2022 at 06:24:48PM +0200, Roger Pau Monné wrote:
> On Mon, May 23, 2022 at 05:13:43PM +0200, Jan Beulich wrote:
> > On 23.05.2022 16:37, Roger Pau Monné wrote:
> > > On Wed, May 18, 2022 at 10:49:22AM +0200, Jan Beulich wrote:
> > >> On 16.05.2022 16:31, Roger Pau Monne wrote:
> > >>> --- a/xen/arch/x86/smp.c
> > >>> +++ b/xen/arch/x86/smp.c
> > >>> @@ -262,7 +262,8 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
> > >>>  {
> > >>>      unsigned int cpu = smp_processor_id();
> > >>>  
> > >>> -    ASSERT(local_irq_is_enabled());
> > >>> +    /* Local flushes can be performed with interrupts disabled. */
> > >>> +    ASSERT(local_irq_is_enabled() || cpumask_equal(mask, cpumask_of(cpu)));
> > >>
> > >> Further down we use cpumask_subset(mask, cpumask_of(cpu)),
> > >> apparently to also cover the case where mask is empty. I think
> > >> you want to do so here as well.
> > > 
> > > Hm, yes.  I guess that's cheaper than adding an extra:
> > > 
> > > if ( cpumask_empty() )
> > >     return;
> > > 
> > > check at the start of the function.
> > > 
> > >>>      if ( (flags & ~(FLUSH_VCPU_STATE | FLUSH_ORDER_MASK)) &&
> > >>>           cpumask_test_cpu(cpu, mask) )
> > >>
> > >> I suppose we want a further precaution here: Despite the
> > >> !cpumask_subset(mask, cpumask_of(cpu)) below I think we want to
> > >> extend what c64bf2d2a625 ("x86: make CPU state flush requests
> > >> explicit") and later changes (isolating uses of FLUSH_VCPU_STATE
> > >> from other FLUSH_*) did and exclude the use of FLUSH_VCPU_STATE
> > >> for the local CPU altogether.
> > > 
> > > If we really want to exclude the use of FLUSH_VCPU_STATE for the local
> > > CPU, we might wish to add this as a separate ASSERT, so that such
> > > checking doesn't depend on !local_irq_is_enabled():
> > > 
> > > ASSERT(local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu));
> > > ASSERT(!cpumask_subset(mask, cpumask_of(cpu)) || !(flags & FLUSH_VCPU_STATE));

Actually, it would seem even more accurate to use:

ASSERT(!cpumask_test_cpu(cpu, mask) || !(flags & FLUSH_VCPU_STATE));

Thanks, Roger.

