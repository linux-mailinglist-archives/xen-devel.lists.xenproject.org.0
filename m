Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A70A5B75A6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 17:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406481.648878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY8DC-0000fm-SI; Tue, 13 Sep 2022 15:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406481.648878; Tue, 13 Sep 2022 15:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY8DC-0000dp-PM; Tue, 13 Sep 2022 15:52:34 +0000
Received: by outflank-mailman (input) for mailman id 406481;
 Tue, 13 Sep 2022 15:52:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lgvl=ZQ=citrix.com=prvs=24889d1cb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oY8DB-0000dj-27
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 15:52:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1255b8fa-337c-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 17:52:31 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2022 11:52:28 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DS7PR03MB5397.namprd03.prod.outlook.com (2603:10b6:5:2c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 15:52:26 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 15:52:26 +0000
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
X-Inumbo-ID: 1255b8fa-337c-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663084351;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=m4NTHbxnG8HEDRgGXUa7Rr1b/4bdnSXF16lb8g+Ovqs=;
  b=TiQ2Iim+IjyIpD0V59LxcoLuq0miDtGHIJGsGkyKor4UNLdsqmSSz2nA
   MaAGO3ShIEMYMAoj5olSwH0MAHciOR2yov+u2YoSoqQB3rxwfDG4d6uGE
   VRwTbcmHj+r/IE02DkyBLLb1Hsoj1faBwUN7mlvr+w0vkMxT1ymZyqz/3
   I=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 80393606
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Lb4ZeKtYyAkxVFzTMqmGkLfmaufnVMxfMUV32f8akzHdYApBsoF/q
 tZmKW2EM/6PYzOgL4t1YI208U5X7JeBztFmQVNvrC9gQi9B+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj4WhA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FaIFpc9KAEF+z
 6AzLjZVax/eqdyYyYvuH4GAhux7RCXqFKU2nyg5iB38U7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9Q3T/PRni4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWLeoyny3rGncSXTBN4pFIKqy91Tu1S02m4WMSMRchzrvqzs4qK5c5cFQ
 6AOwQI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8ywSTC3UATzVBQMc7r8JwTjsvv
 neLgtfoCDpHoLCTD3WH+d+8tiiuMCIYKWsDYy4sTgYf5dTn5oYpgXrnUdJLAKOzyNrvFlnYw
 T+QqzMlr64OlsNN3KK+lXjtjiiwvJHPQkgQ7x/OQ2O+xgpjYciuYInAwXjW6+xRarmQSFapt
 WIB3cOZ6YgmCJiXkSWXTeYlHbe35u2EOjnRnV5uGZY68z2nvXWkeOhtDCpWIU5oNoMIfGHva
 UqK4AdJvsYNbD2tcLN9ZJ+3B4Iy16/8GN/5V/fSKN1Tfpx2cwzB9yZrDaKN413QfIEXuflXE
 f+mnQyEVB721YwPIOKKetog
IronPort-HdrOrdr: A9a23:JoNgTaNtC5uK3cBcT1r155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REoGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUMTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJvXfwivZv3Evoz6hNO6Ws19
 60TJiAq4s+P/P+TZgNcNvpEvHHfVDlcFbrDF+4B2jBOeUuB0/twqSHk4ndotvaM6A18A==
X-IronPort-AV: E=Sophos;i="5.93,313,1654574400"; 
   d="scan'208";a="80393606"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9HB3gSdiRmVkg+eS81K3UvzWmbFM0gQtXnLq3FqqVCfuDZdDnzl73Ua/zCusDyouFs4TNhP5n5oSfdHrpHPOWVS3qzjFe7ITqHxHAIRmnkO9Ko8wQM67PRw0k6H3+2Yy7S6XQhMWqRVsoX5uADjbwORJl1F17T38v01qMblAgbxMLHP17/mYzbxMnwqlJXHpboQCczmLWDQFM+eC9CenzdLC4P6WuzZUJTjaIG+k4n3xgxSKs9p80FddPTioh07NzmISXYiLifW64d6v43MCQxCdbKlvGK4/7iEpISPt/qnHFrE8CHoj/MPY6VS8J2p0elv4izMyt15L/HZYo8mtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRW7TM8+i9v6IJbAGrs89ZahD+E4S8+UFs5RzCtGduo=;
 b=OmOiPLjJ6UpT6/mWmm2Uxt8A32oY8T2V7lAGTNL0Q63ARKHwatcIgTVh6kKeXvgQ8IybNJdAMTqML9BpQlaqMRaXZdM2tWz1waphqgznfmMBEasflILOmUmOnmTC+bqyaKqsSSaBsERsrKtQic5nw0ziTLNXyOFJ7PBNdx2wL8+Vsl9KwJIlgXy4BEcDoQFl4H6nKjpI4GF8YJjVQQK0jkZBwyEUyhjh4fcOh1i7OTvEOiMttMAUz/cQvj9w+NdLwi37ioT32nPeESj5Y0Jr0FIYkrltoGOsk/vwKqNaeal8c7nO/ffHX1kuerzh9i6viUpiyQvKakOJJN6g9XOVig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRW7TM8+i9v6IJbAGrs89ZahD+E4S8+UFs5RzCtGduo=;
 b=k3b8nXUYck1+FAEJf1lARZA+GwowQTVpsvnY2YtEKXq4Tm2Y4McEscgz1Wt542E2Tu4prplwNRyurhTG1QPZvXzWppwK/9+cJHQTujua+HjS4rVpVAfI3FIaZKFwJO8Hh4U7iAkGfryCuiUm6JQCu5xz5NDyNldLQXNswGIuvA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Sep 2022 17:52:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Licensing issues
Message-ID: <YyCnNem7dj8EfQCd@MacBook-Air-de-Roger.local>
References: <b58f5340-d4fa-df9d-89de-6137005add77@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b58f5340-d4fa-df9d-89de-6137005add77@citrix.com>
X-ClientProxiedBy: MR1P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|DS7PR03MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: b327fde0-63fc-4e05-0a62-08da959ff482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XDc5tb5heydSR4d4/2yRKPC4t/Hl4Mm1oYToIur79WVLVlaRX81pFie12oXgCqBJZGjvFfu2SomA6IpEReQLFnq+mY53zy11nkjc+Yg4wPp3W9s95uCsLVk0u15VNpSUWlKWe1+CTokBcN7hZS/YIzwNReCQGjKufhB2UxSpVRxjbvjh1s/TL1W0bRR3WWCvnVxTWbFRjYWYVyWPD19iQOhZjh22ZvqaXy0GHSBkD4D4lW1JP1KzRK9Eboj4i9htSwfgXKVRcZ1swlJ361Jzag94A9XXstEsZVLTdzlPsFjVNhgkT8o1bPQFVU8mPR4SagTPD3tkLiq+VEqJIYa/4IlSFqTjmwWIwCmSXINZEch6WKOiH1TO17A17UNATmEKRS5amp6nabNRGAawTkjeemfd3Ao9dSIkq1fIWiHsaDHP28pRzN6zv3aPJ13yPH9j6HGH8Gpz0VEv1mBfaJv7neRQGDt+PzhwfjF/jLGCE+8SP6iT2wEhlBFsOxio4NxpRcF+KSfL9IoLt8Ds7UoLlVLopAujnoLp5UoZ8W5s9aDM8zl22YXc97E6nk5ElpQ6h0qOUwVn1kppoodHuEE9FJykImYC+Cg91ntoqLklyXbUDnjHxKzgL19SKJB0znVAMOIwpXAl5GZHh83uN3O/AFhxy+fF1BsEGWDKJvHBGWwefzpK2WO775ibymiD3GRPfv9lg227aKBsZ6S1gU7gFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199015)(6636002)(3480700007)(6666004)(6862004)(54906003)(8936002)(5660300002)(66476007)(316002)(2906002)(26005)(8676002)(66556008)(38100700002)(478600001)(41300700001)(4326008)(7116003)(66946007)(6486002)(186003)(82960400001)(9686003)(85182001)(6506007)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDZ0eThnQk1EUU1ENVovWW5GYUJkS2kycDhSYW5IdlB4YWpGaW8xcnMrUVhR?=
 =?utf-8?B?bHZLWnBCbFdqcEJKZStkSEtWY0lHaThTWllacG5oY1ZTTkx1cHY5OXlrdFRC?=
 =?utf-8?B?UHI0RkRNV3JwYUtndkp6T25tVS9sK0l5WmM0aisxbmx5L01JQlZlemZqQTlM?=
 =?utf-8?B?NzBNcjRPRmgvNDd2YW42T0NUbVp0SllUczRtUWZjcFpLV0Z3dHJpZGMvK3Nn?=
 =?utf-8?B?MndFNU1veFNSVVZsZUc3RXlhd2hOOHAxWEIvTDBPV3g0YWNKUzE3eTZEK0Nn?=
 =?utf-8?B?RUtFdVAyVjFGRlpXaDcyUkpSd0U4M2lPRmlXTXhsVmdQL0NxNEtPR2VqWGpt?=
 =?utf-8?B?a0JaNE4yR0lrVnpBUXhYZ0FtbW5EOUFnVEVSaXJrSlhUWmd2VXk4Und6WTlu?=
 =?utf-8?B?cWY2MG5GSSs3aGdvMVJ0RGVVQ2hOZHU3djgrNkhkZzY5RFBKSVZNL3Zsa00v?=
 =?utf-8?B?Syt2MFJ4VDdBZXVxdlRBYjFadldpajZzQzV2cDhzSHd1VnBWZFZMTXFlNmJk?=
 =?utf-8?B?QXFhbWZQMkcrNGRxNFJpcXlENEsvMEN2MmNrYWZnQmtrZS9kd1hYazhEdzM5?=
 =?utf-8?B?ZHVFZjRZdU5XNlFKWWxPS3RrMmN4eVFuUnp4azNBUFVzUmpJdTNtYm1STjRx?=
 =?utf-8?B?UFVXcHowa0J2YjVyNlBhZHhTWGRDVlNwL0ZxN3VUNmJ4cnFKUU1zdUY2OHFa?=
 =?utf-8?B?b2k2MVZpT1BMVGNBdFg5MHJ1Z3VYY2lDM25JamRRd2xPeVBGTWUzT2JQaU9U?=
 =?utf-8?B?dXpCc3BYK1JaZ2QvdGE1THA0NmVZakNaa1lBSVFsdGp5MHB6M3MraTZWWFVX?=
 =?utf-8?B?VVFiUFpNcFViZFgxRWxLQ1RIL29YZUIzc1pwd1VtUjlnU1ZOYnVNSGFkMlF1?=
 =?utf-8?B?ZlUzUTV0TytjM3ZoOWVRbTZXeThXWnhEb1hNWUN1dzMweGdGTTFZSkpvVG5I?=
 =?utf-8?B?TnZwVmZoYWlreGpNSUphN2xJL1M4YTU1bDV6R0xEV2thdXNFYUtnZEhtL3k0?=
 =?utf-8?B?bFNYcHZ4UVBiaGZRZi95d1Z4YUozM3FKVzMxTmZNVFRhRHpQQ1cvWUpNT0Er?=
 =?utf-8?B?bnIvT0ppU1h1bXdjbjdzVlpORU0yWWVVMWRpZ0VzM2JqS0IrM25jaEJpREpx?=
 =?utf-8?B?dGRiYXp5elNvclNkWHFuUHBWM3l6YTlmd0FsNTVVRlJ4WjdHMHhQb3d4Qllw?=
 =?utf-8?B?bGVCMElTdDJaMit2cTVoQWNkU2hQMVoxSmlNL1psVTNmWFRWNFlyY3BrUnlK?=
 =?utf-8?B?UUN4RDBZK1VNNkVXc2JsZEtpVGx2L2JEckNPSFFZb0lxcVdaVFZFQ1RlSGhO?=
 =?utf-8?B?bExFQlFRRkNYd3NUOEt0NDl2OE13UnNrbExHUnI0UzJTWU5VODN6UmpBMDZu?=
 =?utf-8?B?bG5HTVR5WkZrY1FLSXB6dEdyNHJhS2ZMT1lXT21sRU9hMVhMTGhRN24rWE9r?=
 =?utf-8?B?UzVnbnlkMGt6SytxRi9YRk8yNVNET2I2bDJhcmVDaEFURnpoU2lqdHpqKy9C?=
 =?utf-8?B?ZkZ5U05pZWhUbVhzK004R3lMWkpvbmRRWEFpck9McHRtSEl6cllUQnl1OGtO?=
 =?utf-8?B?TitzR3BFL3lQRFZWTzhXb0gwRFp3djFJRjJ3Y0xmdmdGVDJOcmM0aFhxa29k?=
 =?utf-8?B?TTUwUjBvT3VZZ29vTEdCV3RBaXpqc2E4OS9ZZEJSUU1PdytleUlaSXZneVVZ?=
 =?utf-8?B?SEkvVVhNQnNNMXkzbzNWdlZCNEowWW5ubzhhWmlpTTFoZFJpOHNSMjNmTy9P?=
 =?utf-8?B?R2xjbVd2WEkxNUVpNHlHOHdOdkxKcXRYbnlxVTdvdHlCREdWUm10SjBycENs?=
 =?utf-8?B?bzhoclNwMHdNaGxYMVk1ODFUbnhuYXZZTHIvNCtuMVN2VjF4OWg4cXZoS0N5?=
 =?utf-8?B?OGl6bmNETzB1VWFVNWh3UklXZE9zc2pRRndnSE5YK0VqWmZocnRoQklhcmI0?=
 =?utf-8?B?dHFtd1hTOWsyVDY4OG0vNElVVDN1cC8yRWNqMnJEemdLWkV2M0ExN0lXWnJE?=
 =?utf-8?B?TnZJV0lwVFZQNk44VjEwc2EvcUJuU1VHbTRoL2U3d25sSC9JSnVLUm01dmFq?=
 =?utf-8?B?dkZoZXZEeTVqTXQ4bGJDZUVBNmZlZS9hS3B1MGZrK3VmV2I2N1RpamtQUG53?=
 =?utf-8?B?enVDdU5JZ01Gbk9jK3g3NGNtWjhaZnM4SzlhRnJyZVhLNlUzTENVbEJyMHM5?=
 =?utf-8?B?SGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b327fde0-63fc-4e05-0a62-08da959ff482
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 15:52:26.3359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4zdooCVem3AvvKI/cNjXwnLJ8dquWs6LAidrdCUhqODlDP7hLiauuebk8ROHZGT1JiJlZZc/C4puGEKH5Nf8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5397

On Fri, Jul 22, 2022 at 02:31:28PM +0000, Andrew Cooper wrote:
> I've been cross-checking licensing details, and we have some problems.
> 
> 1) We install xen/include/public/COPYING into /usr/include/xen/COPYING,
> which is not common practice.  The installed file is mostly useless
> because it discusses files based on their xen.git paths.
> 
> 2) We actually use the MIT header for the public interface, but we don't
> actually call it by it's common name anywhere.
> 
> 3) The following files are missing the MIT header:
> 
> /usr/include/xen/foreign/x86_32.h
> /usr/include/xen/foreign/x86_64.h
> /usr/include/xen/foreign/arm32.h
> /usr/include/xen/foreign/arm64.h
> /usr/include/xen/sys/gntalloc.h
> /usr/include/xen/device_tree_defs.h
> /usr/include/xen/errno.h
> 
> Foreign are autogenerated from headers with MIT licences, so that's an
> easy fix.
> 
> errno.h was an oversight when we added it.  There's no problem fixing
> it, as it is covered by multiple statements elsewhere in the tree.
> 
> device_tree_defs.h is problematic.  It came into existence in c/s
> 1c898a9fec7e4 when some LGPL code was moved out of libxl, and some GPL
> code was copied out of Xen.  So there's currently an GPL+LGPL vs MIT
> licensing violation.
> 
> I have not looked through history, but it's likely that the copyright is
> covered by individuals/companies who are still active members of Xen,
> and I don't anticipate any problem getting it formally relicensed (it's
> just a few constants), but this does need fixing.
> 
> sys/gntalloc.h is more complicated.  It's stated as public domain which
> is fine for our purposes, but inconsistent with everything else, and we
> need to adjust the various files we've got which state that the full
> public API is MIT.
> 
> But it does raise a different bug.  Why do we have random linux headers
> committed in the tree, used by some userspace libraries?

I would guess this is because in the past (pre Linux pvops kernels) we
wanted distros to be able to build Xen packages on boxes that did not
run Xen patched kernels, and hence didn't have the user-space headers,
that's why we had to add them to xen.git.

I added the FreeBSD ones myself, but I did wonder whether it was
required or not.  I will see about removing the FreeBSD ones and using
the ones in the system.

Regards, Roger.

