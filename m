Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1CC5F0661
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 10:26:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414070.658148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeBLA-0005yS-MP; Fri, 30 Sep 2022 08:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414070.658148; Fri, 30 Sep 2022 08:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeBLA-0005vd-Jh; Fri, 30 Sep 2022 08:25:48 +0000
Received: by outflank-mailman (input) for mailman id 414070;
 Fri, 30 Sep 2022 08:25:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6brQ=2B=citrix.com=prvs=265c464c6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oeBL8-0005vX-Rp
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 08:25:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7956d500-4099-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 10:25:44 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Sep 2022 04:25:35 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5164.namprd03.prod.outlook.com (2603:10b6:5:247::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 08:25:31 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.020; Fri, 30 Sep 2022
 08:25:31 +0000
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
X-Inumbo-ID: 7956d500-4099-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664526344;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3htbdq08XU20V81TZSBPxc0PtkQVXb3Jox+AYgGdSec=;
  b=gNBjfdEiZ/R8+zci0UCUMVQBKOqLg67BnuJTM2GOsBqcyNtm8ZdU9GOX
   shPcHRKPuzXWkFtK1mxc8G47T3xEmDhfk5D7oKokKiVQYsXqZZ4o0QrSx
   PKkSSZA323MxlDEzWyPErxqxkvhwsMVut5j3m0cxjboTRJsDHR+FMjrjv
   M=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 81341343
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WFLNCq8LbNO4SzqO9izoDrUDm3+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mYcXzrQOfiDMTbxet5xPYzn9EJQusXczdVgSwptrSA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvnrRC9H5qyo4mtJ5QRmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sNrK3B2/
 P8yFB8Uakmvpv+u37CEa/Y506zPLOGzVG8ekldJ6GiDSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PtxujeIpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toiv32raUwXiTtIQ6EL+9xOFXqn+p/TYONyw3cUPnmvyXoxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/v2ARR/vbvTTmiSnop4thu3MCkRaGMHOykNSFJf58G5+d5oyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsjDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:9bdxi6/YBmwzn5d1Gbpuk+E9db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdgLNhRItKOTOLhILGFuFfBOfZsl7d8mjFh5VgPM
 RbAtRD4b/LfD9HZK/BiWHXcurIguP3lpxA7d2uskuFJjsaD52IgT0JaDpyRSZNNXN77NcCZe
 2hz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlGl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFfJccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiT7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri+knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYd099RrBmc8a+d
 RVfY/hDK48SyLaU5mZhBgl/DWUZAV+Iv/cKXJy+vB80FBt7QNEJgUjtY8id0w7heMAoql/lp
 v525tT5c9zp+8tHNdA7bQ6ML+KI12IZy7wG0SvBnmiPJ07Ghv22u7KCfMOlamXRKA=
X-IronPort-AV: E=Sophos;i="5.93,357,1654574400"; 
   d="scan'208";a="81341343"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYLAVYIUWR98079RZFIHkGyGWzrbH3NTkHJ1EFWe4pd4J3xwXW/px96LiU83KnAwjYBLjDZmaxJ+WRU0oXovBD4471ZfPxuF4MzS238FtiQHCydHDjN+Ha7D35Bt/9ZTUBNW6QNg5tByTU1bIuYJpGRjwKrrGOd+WKb+ov1jlewUNOjxe+RuFRvnB6xbJX/NzjpGJgE64lI4Q4vnsImwd4++00dO7xtqdhM4mL2WLblBcSZ+Mxcog4XWJBWg0fVWDNLx8987Zo4qWqE+3k/r4fulfYBYdqaR7JvpspcDnHqsbFW4MImxdjLkknP4SVIPzdvNymGgmakQHqo71nShaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh2r5wrtrLXWOlC57QQzNkBMW+t6CAM4JjuYa45kB4s=;
 b=PxCM6fIjGrpU2rnsSYGCWL4XRuvQP1POZpCusEyWBs9weUiLYGkQgO3yKeWBt+zlPg1OxUCWH2wlrvOUB1ao7JE4iMgvK7tGrBeacouHmR4sc7jsKTzGBWEw1iDkEBBKeGWHfjQC3lzhPMnac4DHDrDPBJK4uKAXJfuJ1yF3VFoqywTsfyl9yhKL15m/FPd/W4IjxO1AanowuYg5ySF6HAobX/m2DYWYVTn0SkMTKHKBXHkoBks0FCH9j0Uct+7A2eJAnxSSOgtsArKjMoDsrAvBqSZpqO1iA14b58cbJKJ5C536SabfYieMfmX2yZIavnE4w4NeeQUAY9R2Xi73Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh2r5wrtrLXWOlC57QQzNkBMW+t6CAM4JjuYa45kB4s=;
 b=aHJHRPYIA/MaxgTVyGfelrvKfUi9YX4VnnNUwsEbQZBCIGVA6vpzdZcca//65DB6D6sFR7IirPka+xxM8EnKkbkGIPqBRI2uC45aa7Aboi29lWlFhO4zgYTDdxXAiUhqGg01dZgEDxUKSSJJI32UgPLCCeVq4b812eEGoh0Q6BY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 30 Sep 2022 10:25:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/NUMA: improve memnode_shift calculation for multi
 node system
Message-ID: <Yzan9D2gZJ6yN3wq@MacBook-Air-de-Roger.local>
References: <84f1b8e4-3927-1986-9ca7-043790ed7011@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <84f1b8e4-3927-1986-9ca7-043790ed7011@suse.com>
X-ClientProxiedBy: LO4P123CA0135.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::14) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: 79db51f4-c70f-4655-20a9-08daa2bd566b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YCSvdnTVaJD6CjYGmcrVcuqvyYvKbiVZ9irgrfbwQMDUUKIiNoqZoELrbIPhhX0DtU5tKzgr9w0i2DLggR5nNzC70ZPoeXxWlaauSmZvbelYgZ8rfjE6aZDwgJbeFl8iX0iStYpN3DdHLcbK/5VCm19MBrBRuJKMo5v+k9A+/AjiIbCm6I2/0Tacy9cxluaoOwfvst5KALriwCO6a7XoAmgF2bmOfib4Zzk9xMH/j0UJyPWEEZO/wy5+NK8+n9uQXv4xOnNSnidaFwyuLEGBhDohkFZhaUWN5VncpXgKH1hus6G8ObsDm8OWtDP9pFbELHa7lgFAK3l+gFqmYu53IniC8t6kjezQOXZYdtpG5PQ1fTPSgNyq+BKdeS/lRzoY92Un5BR1nsgjaM2fsAnhb7DYnlDbFRRCizqHQYW90osD7/afyRhytjxcIiYK8nK5s+rkK2BOncz+K8hJ/CagH3T9iTxNMH14Js5/UA3HZ8DKP4T8IQgE9q+xr4c2xg9rLnN1cLaWXwoanjDAztKJUug3KxBibUdGLHlqxanUJjLoU+yNiM0gKzM9CKbcLg4plSu3aXCuQkXR2nlvKnn9cL5f7A8/Hoq421B6nWwBZwkF8CiStlalPbahNtJfMtwqr7kORLgClOlRH+JMdA4dy1Qlng0Olyt9HpVeZGjW6+eBjJiLKniLzqG80sDzC7UQn/DpPTcshLoEL5jMfJ66BA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(451199015)(316002)(82960400001)(6506007)(8676002)(4326008)(66946007)(9686003)(66556008)(66476007)(6512007)(186003)(26005)(86362001)(478600001)(6486002)(83380400001)(6666004)(54906003)(6916009)(38100700002)(85182001)(8936002)(5660300002)(2906002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDN4eVJOZ0xOWkNqd1R4bG9Pd1k3enJteWtoSVYxZmdxUnBWQk9XVUhpdU5Z?=
 =?utf-8?B?aENJWENXYk1HVHhYYUQ2QWl6RWpzZjFTSitCZGlQMUJRN1pLd2k5NStHZmV1?=
 =?utf-8?B?dXNjRGx0L1ZaK0Fxdy9abFdzNTM5SWtGZ05kS0NQN1RuZE9TZkJFMXRUdjFJ?=
 =?utf-8?B?b3dVU1hMQUNiSW9BZU5BZFJkbGRDa1BtOUNyenlrMjBxaGRxWEhFaEVNTUJh?=
 =?utf-8?B?Wmw5bUNIdjhzbzlOek5OYkxLbnBCbmh6V0ZNRGNucnZlWHFzUGs1UTVNbkZw?=
 =?utf-8?B?dktHWjBJQ1JmOXFnZStkRVpOcW9zeWN6VnhWLzNiMllVK2FrV2Y2cFZGeFJX?=
 =?utf-8?B?V1huM2VHOXlJenFpMDQwWHdiTXdyVkZZa09rUS9hbHZnTWFZSW11bWMwWTlH?=
 =?utf-8?B?b2RiVkUzd1pxTHhrNSs1VlZNYnNWK2JCcHJHbzR0NFFsc290RGlIc1NxYkFu?=
 =?utf-8?B?MXY3S2QyOE13QjJEWkVJT2phTGpCT0d5TzFrOUYzSU5GWW1ZdG8wK3MxTmJP?=
 =?utf-8?B?ODhCVmtWZXR3aGVWTWI2U2FpV3dHaU1LUHU4ZHBGRnJiaUVGcGRoemFuVlNT?=
 =?utf-8?B?cjFVWlpNWGVNbHByUFN1b01uQ1V4dU1BVkRpQm1XdHQwNDVjeEFxTjNRbE5a?=
 =?utf-8?B?STZGaERyMXdZM1VuWmNVaWxCUS90VHFNZGN4NjVJam85bFUwWlo0MnZ3SGl6?=
 =?utf-8?B?alhxUmZNcFBUcG5LMzhzRnF3ZnFFeHA3SDFua0xuUmRQN0ROeVhhOW1CY0p0?=
 =?utf-8?B?SlJ1YUFrTXplcnovN0pWQnpoNWpmQWs0ZExYeVhSNmNaTjc5YStQejdURS9Y?=
 =?utf-8?B?RDcvUXg4cUE4U0trcEJaWWdBNmFOQTAxbVowRjdHMUJmaHFYZ3Q3c1g2QjRx?=
 =?utf-8?B?a1U2TnVGWFJSYjEyUXhNQ1BkVitTS2JJYjM4VndNS0RXNFRWVjNmSmMzb05D?=
 =?utf-8?B?Q1pYNWhud0c1WCt1NG5YV0kwY3I5TlUyVjNOSFZqQ3ZFNnVZcWdiZ2wyZTNF?=
 =?utf-8?B?ZXJLN0JBSUZldkNQZTI0cTVRTHVnQy9SVTFsS1lBTndqWEM4RVU4TVpqOXVN?=
 =?utf-8?B?NCsvdVY4QWZ0amVKLzF1VzV6UmxOZ1orMGV0eWhtRUtud0ZBdUxXbGlaRkNj?=
 =?utf-8?B?TjYyZVVDSDR5UkVSbHhHeFJCc0F0SlRqdUczV1FXMGhBMFkvV1FSaEFicEM3?=
 =?utf-8?B?N3J6ckVDOWVuNE1sVlVyczAzSzJUcHZlRmJFSDZRcDBscDJKU01yeXJreDZZ?=
 =?utf-8?B?V2hFMWRqZmJzbE10SVd1cnF0bmdhdzBhSDZCNWJ5OVFuTSs5cEZqZHBPdkRQ?=
 =?utf-8?B?L0JvTUR6WE9QcmphQzM1YmJaZE1CQVZzTXdqUDNWSTBPRlFZMmtGcXc3OVd3?=
 =?utf-8?B?Y3NMTXlBWmdQVENwU0ExRnZURDBHY01aZVlJa3BKR3JaYzJvSm44Y3hjNmRi?=
 =?utf-8?B?UzZXQnNyR0VmNHVhWFBmWGluYWQvbmJPN0FFQVlyUFFJL1ZsRW1Ic0lPaHA0?=
 =?utf-8?B?eW1oUmlMcmRBa3kvK3o2SE45MWlxOUFCT0Yxb05KeXBxTHA4b0x1NDYzYWxS?=
 =?utf-8?B?TGpsNFlWMm1VWU1TdW10elFWd25xWnZqaFdHcnpIWHdSRWpPMUNEazlVdFFP?=
 =?utf-8?B?NUxBWkZxamUzVFA4WEpjYjlhcWN0MWJTNEFvMkNKb0tQaFNpQzllVGwydkVY?=
 =?utf-8?B?QUtUMVFnNUFoYXc3NnNYNTh5UkVSWkxRd2pEaGZDdEk4K3oxdk4xOVZGVGdq?=
 =?utf-8?B?M2RzZGhJTHIvb3pvU0d3bVl1UGt6alRoejAxTVFQQ285OU1iVFlLY1N1V1Zy?=
 =?utf-8?B?eW1NMTVzVjBjcHNwZXg5NEJpbm83T2g0Vi95c2M4SEp2bHlrSHpDZHdBRkFI?=
 =?utf-8?B?eTdmUnphNkt5NDdncHZDL3RBSGJWR0FHcjlhc1R0eE0wU2RFV1E5WFlkY00r?=
 =?utf-8?B?VFFFbVVQZFRrc2pZSHJ1NjNLRldRNytONDFLd1IrQndmcE5Ra2crcVJSR1dJ?=
 =?utf-8?B?OGNoazlsNzQwQUlKVGlXOGFjYWI4ekhHU0VRVWZPd0NsRFpqNWcyd1VtRDli?=
 =?utf-8?B?RXprN2cyMUl0UzcxS3ZVUDFCUG1tQWlpZ0RTT2tONGlHYTRVanhMZksyb0xT?=
 =?utf-8?Q?QJWdYMVjySjTiV6LBqr2N6Phj?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79db51f4-c70f-4655-20a9-08daa2bd566b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 08:25:31.1237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Np+Dw3b0Uptw/zHfVHw+paxzUr52r9wjw/h41AYCtinK3WNgCWu4+0XA6crXnqE/+VB+m0nyF7PlFpu6mK4FfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5164

On Tue, Sep 27, 2022 at 06:20:35PM +0200, Jan Beulich wrote:
> SRAT may describe individual nodes using multiple ranges. When they're
> adjacent (with or without a gap in between), only the start of the first
> such range actually needs accounting for. Furthermore the very first
> range doesn't need considering of its start address at all, as it's fine
> to associate all lower addresses (with no memory) with that same node.
> For this to work, the array of ranges needs to be sorted by address -
> adjust logic accordingly in acpi_numa_memory_affinity_init().

Speaking for myself (due to the lack of knowledge of the NUMA stuff) I
would benefit from a bit of context on why and how memnode_shift is
used.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> On my Dinar and Rome systems this changes memnodemapsize to a single
> page. Originally they used 9 / 130 pages (with shifts going from 8 / 6
> to 15 / 16) respectively, resulting from lowmem gaps [A0,FF] / [A0,BF].
> 
> This goes on top of "x86/NUMA: correct memnode_shift calculation for
> single node system".
> 
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -127,7 +127,8 @@ static int __init extract_lsb_from_nodes
>          epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
>          if ( spdx >= epdx )
>              continue;
> -        bitfield |= spdx;
> +        if ( i && (!nodeids || nodeids[i - 1] != nodeids[i]) )
> +            bitfield |= spdx;
>          if ( !i || !nodeids || nodeids[i - 1] != nodeids[i] )
>              nodes_used++;
>          if ( epdx > memtop )
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -312,6 +312,7 @@ acpi_numa_memory_affinity_init(const str
>  	unsigned pxm;
>  	nodeid_t node;
>  	unsigned int i;
> +	bool next = false;
>  
>  	if (srat_disabled())
>  		return;
> @@ -413,14 +414,37 @@ acpi_numa_memory_affinity_init(const str
>  	       node, pxm, start, end - 1,
>  	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
>  
> -	node_memblk_range[num_node_memblks].start = start;
> -	node_memblk_range[num_node_memblks].end = end;
> -	memblk_nodeid[num_node_memblks] = node;
> +	/* Keep node_memblk_range[] sorted by address. */
> +	for (i = 0; i < num_node_memblks; ++i)
> +		if (node_memblk_range[i].start > start ||
> +		    (node_memblk_range[i].start == start &&

Maybe I'm confused, but won't .start == start means we have
overlapping ranges?

> +		     node_memblk_range[i].end > end))
> +			break;
> +
> +	memmove(&node_memblk_range[i + 1], &node_memblk_range[i],
> +	        (num_node_memblks - i) * sizeof(*node_memblk_range));
> +	node_memblk_range[i].start = start;
> +	node_memblk_range[i].end = end;
> +
> +	memmove(&memblk_nodeid[i + 1], &memblk_nodeid[i],
> +	        (num_node_memblks - i) * sizeof(*memblk_nodeid));
> +	memblk_nodeid[i] = node;
> +
>  	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
> -		__set_bit(num_node_memblks, memblk_hotplug);
> +		next = true;
>  		if (end > mem_hotplug)
>  			mem_hotplug = end;
>  	}
> +	for (; i <= num_node_memblks; ++i) {
> +		bool prev = next;
> +
> +		next = test_bit(i, memblk_hotplug);
> +		if (prev)
> +			__set_bit(i, memblk_hotplug);
> +		else
> +			__clear_bit(i, memblk_hotplug);

Nit: I think you could avoid doing the clear for the last bit, ie:
else if (i != num_node_memblks) __clear_bit(...);

But I'm not sure it's worth adding the logic, just makes it more
complicated to follow.

Thanks, Roger.

