Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7235614E5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358298.587439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pSv-0000Nn-G7; Thu, 30 Jun 2022 08:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358298.587439; Thu, 30 Jun 2022 08:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pSv-0000KB-Ct; Thu, 30 Jun 2022 08:23:57 +0000
Received: by outflank-mailman (input) for mailman id 358298;
 Thu, 30 Jun 2022 08:23:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6pSt-0000Hf-6u
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:23:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7988413-f84d-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 10:23:51 +0200 (CEST)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 04:23:50 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5421.namprd03.prod.outlook.com (2603:10b6:a03:289::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 08:23:49 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:23:49 +0000
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
X-Inumbo-ID: f7988413-f84d-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656577433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=LiQtz8zgdXUTY6GP7spjzbqn2+XZTbP5Ey9lVx8mnXY=;
  b=h84DVu3Fki86Wa5Y2yoK6xA2biwKEvtM1g7INMlrGsDjpp0xFsgIlE2f
   ub32ubf2fdcJZ3kKYLJ/Yjq01EgZ3kmq7LEZi1PVjOP22h7G+bksVx/QR
   fZMQb+HVLk/SZjdKhZnp2SfTQMqu6eOv1pUFsf941/+Ium5O2eWM8W14Q
   g=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 74792292
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Zq9CN69Jm8bjULZSfpfNDrUDnX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WQeD2yPa/6MMTGhe9kjYI7g8EhXsZfSyddjTgVorX08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34PhW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaaOdDw2FPPmpLsMcgleCARXGr98wKCSdBBTseTLp6HHW13F5qw0SWQJZ8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHfuMuY8wMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgL2IJ8gjE/8Lb5UDCzRM2yYHfLuCId4S6VOJsmxeb+
 n3ZqjGR7hYycYb3JSC+2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZtvgWxy1plaUsxhaXMBfe8Uh8x2EwKfQ5wefB0AHQyRHZdhgs9U5LRQ10
 neZktWvAiZg2IB5UlqY/7aQ6DatYy4cKDZYYTdeFVdVpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:VSU0+KoWYL+cDEUYXyIZqGYaV5uwL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwI080kqQFm7X5XI3SJzUO3VHFEGgM1/qH/9SNIU3DH6tmpN
 5dmstFeaLN5CZB/KHHCWCDer5PoeVvsprY/ds2p00dMT2CAJsQijuRZDzrcXGfE2J9dOcE/d
 enl7x6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr18jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvS/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kda11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtZqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW/HAbgcYa
 dT5fznlbdrmQvwVQGYgoAv+q3nYp0LJGbIfqBY0fblkAS/nxhCvjklLYIk7zU9HakGOuh5Dt
 T/Q9pVfY51P78rhNpGdYE8qOuMexjwqEH3QRWvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.92,233,1650945600"; 
   d="scan'208";a="74792292"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1nJANIOw43GRn2uUJN7wZbfABXSrBiBRQtmUp8PY1kseLDK1fu3OKKm9C8qqG6iBfQ7QIl7L76O9f20yt+WeFNg/ipthcCJmkCjfCX/WNrBnXD5h8cEpkaA3zf/WhsgJmVoERF6rsrQ0b2BWawpvC5eYb9iBHw4ruq6x97GW3fgp5fkp9KkteLXe8lpO6L034X1bMdZGa0FhWZFffaw1UFqVBt/YhS18v6Jt1HxaTUH1QwPkM1yJGoFVOks1czlEFOwzs6biLddXzsr/Btmr+uWEcmM6k+xPbEHHCMs2B1U7PYwaU7lT3MJBLwTEomBBM0J5JSTuCKEjrU57WkuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfkwqWP0v5owMG2H+4Xard4Xv9SJblLQOcMul3+LP/Y=;
 b=KC9NwnBLvnbSW6CZ7AE7P1414OY0URnwlZscOV8xThzqNlHU/P7XKDQ2YThlZXbEKCBUSsLJp2SkBVmvQ+r6kJYUZzaHE2PSmhBEF8zshixmR2fsCQswtKTSmDT55uHMrkk66pTO3lG9nHtbQnNHvbzZ266VOP+rl8gQ8yc89ynBDVAUaQhyVN8jWzoU8agBkjWAC7/IDl4lwmk/RyDZExRgjrE9uUusYXX2CAEMUFS3DnPXVg/5oDHyqQ5llTsADygOXowmnaGzlTVHwWFt1QVuZ+pYicA1yiV29yo1MqwoRYN6bwHeyzFa8DeVLFmy6JTPiWZd3GDtcRspM+EKwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfkwqWP0v5owMG2H+4Xard4Xv9SJblLQOcMul3+LP/Y=;
 b=fGdOMJO3S7DtpsE9USz4zqXp1EcwE7r3muu23nU/dnAkFndejhQ3/f0dKHSmNH+VvEtDFxsP3p1IN07lZc48JqquQ/WRU3LJ34mt3l+VfjfxgQMtmHP1/utyKipguSfOW04GfefviuSz9FPfZMSLWzeeuExeN5lhmYXdGs0A5gs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] console/serial: set the default transmit buffer size in Kconfig
Date: Thu, 30 Jun 2022 10:23:29 +0200
Message-Id: <20220630082330.82706-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630082330.82706-1-roger.pau@citrix.com>
References: <20220630082330.82706-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0191.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2698f678-b027-4984-cf69-08da5a71dbce
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5421:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BHSWxp5hLoF8OqI9xBXAXYzQevNpji3uhDrxM0cIBpx6cpTGFp3dXSKlHQqfp1FVyWeoaXIDtLanh0s305BOjcMGgjAx9nvP+DRxwfdPX+0kXQ+IkWrOrCnzqGzz53MfMWqNssikfM+mylwXF6ZjkTzoDgYA8gVgi1xriMbCfTyGHA7PXWTjUwZ0yeegaQ6Vj9vN5MhwLK4egh4h32t7WMlwQM7Cu3Tq/y6kksI54xgqJZ045/fVioaIxPvk+4JP3WxZhJzL2FJUuBXchRyPojyDRohKu5U/GeW2yUQnhK/3jkthkJVtXMyyZ8dul+x+P+1V6SfZnJuj0X5D5HXA/d4XckXkiUlsNw8lnPURGsjR/U9FrOFMfrzotJ3BcvI/H4HPrgqsZQfodVFAjI4mKPTshrd5OUEHvxkh3W7MuNJbHqUBsF14Qbub5SISR/hxStOHTQ0NHaWTBf8xz2AbLCDkI5sPYF1N8Nsnz6tI31gqfo80SDq13psbUzUqL8u5qFLofsHNAL/K30D+mynoTZG94VYK1ZkVrHV3KEPGgK3YxJ24nHoadslb0qVhHNsDlt0gxT3F2EwFMlnrMoVve4BTX3rSQxF1iOj+caELxwHIYKt5y5ixvZBAnv/wb5I62Hej/MPuWxLBQxA+AKFdjhyJgyeckOg2alBW7SrA1orQh933yTHeBpd/tvitXZUJd+MSbdGTdbcbAo7n4T8l+s+k7GqQm8wn+HRPOklHvJgzB/t0+beW97mDhfCxFMTAmbQXu3CUi5XxkUHTvCarIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(2906002)(86362001)(6666004)(478600001)(6506007)(2616005)(1076003)(5660300002)(8936002)(186003)(6916009)(82960400001)(38100700002)(6512007)(41300700001)(316002)(26005)(66946007)(6486002)(4326008)(36756003)(8676002)(66476007)(54906003)(66556008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDlRVFRLQTNjTEtrTVRiMi9rRjgvc2lyalVseUFXUlBWWDFYdENabVlqVXFs?=
 =?utf-8?B?akcvYVcwaGEzVSs4UEI2RkhpeEdTc01GSzFyWnFRZ3ZJd3BudWJ2UHBqSmJT?=
 =?utf-8?B?TTFIcllGdktyMHhaZzBPV2ZHZ2FmVWNmV05nOUR3K2d4Rjdzc0FaUlJUSzlJ?=
 =?utf-8?B?dGxwcm5QRzJCZ0FVbytvNGpJL2wxSVM2YWNVbkRyTncveWh1ZFJXL0c1R1Ex?=
 =?utf-8?B?VkpocVpvTlIrd2tUQ3ZJOXdHNFlNY0ZRR3gzM2VWNC8rOWx5elAyOFM2Wm1N?=
 =?utf-8?B?T0tnYmk4eXhKM1R0YVpvOFl0NFlobklwQkRPTlBjQUlZelB1c3NjeVVhMWZX?=
 =?utf-8?B?STk3ZGI2UUZCK3BhOTdDb3BxUEVBNncrdFB1M2w1eGNkdlVHaWpHeEFpQkR6?=
 =?utf-8?B?c2RxeXFQWFRyOTI4dmxTT0s3ZzJsTHZJbjdsRUZkNlVKTkxQbFFlcklZbkRp?=
 =?utf-8?B?VTg1Snc2REJSVzcwZS8vMWp5V2hFK2U1aWlyZnI3MjJLYXBRdFA0WTVDRm5N?=
 =?utf-8?B?V2p3WnBma0JpZ2FWbnZiZGVrZzlKTzhaU2RKbEUrZ1BCRUxxbklCRnpFT2Mw?=
 =?utf-8?B?eGVNeXM2bnV6U0lQbTNxcjg3SXZKQXBMQnY1a09QODQwR0F2STh0WmE1UVdJ?=
 =?utf-8?B?SkVoV1ZrZy9pNHkvUWNXYVB4UDZhcXRzSWlXTWdyVDROLy9mOFIxN2FHUGhE?=
 =?utf-8?B?V1hoN1NhbS9rL3B1Rlp3Q3JmWmk2L3VtNU1QRnJSMndFL0p5U1U4b1VrUFpD?=
 =?utf-8?B?aU9DeUh4cGZKaFJnbEVraWppUVRYUGVBeHdrbldYK3JYQ2kvMWVCNlp3cnBs?=
 =?utf-8?B?ck4zTEtpVjJpdlJZd0N6RmZtaW5wTVRVRDRmQWNWVkExSnJVSmJleXBrSUNZ?=
 =?utf-8?B?dVNrdWNZWWx4d01QZjFpVnIrMVZrTHBjV0tLTUNCU3ZYaVZmdHhVYTJreXJQ?=
 =?utf-8?B?cW9RazB5RWhuOVBXWVdKTXdPRzZ4RnNRSWZkRUVUSUU2MlYzSzNkQm9MRms2?=
 =?utf-8?B?YzQ1LzZ0VjZwMy83WVZmZElFTitZbSthQ1pRb1JNZDZ1N2NvN2VFbHJNWUZG?=
 =?utf-8?B?aTI3TVRtR1FQT2pvVG8zQ1ZHTW9OZC8rWUpLNlAzb0R1NWE1QzdqbGw3NjBN?=
 =?utf-8?B?WllTeWdjeGxzSmVHYzdqOVdCOTMvR1d0eGRCU1VWS0IrUC9sdmk0a1IxNzV1?=
 =?utf-8?B?ZzRkMWFsb3BxcjgzbjRoMmYwRjFsNFllRFJQeHdjSEJNd3JPWlN5U0VCY3BV?=
 =?utf-8?B?dENXdHhrMktHVENJSUtvUGM4R0xPeWhmZTFKUWV1aHUraHBGU0ZBRHhzc2Yw?=
 =?utf-8?B?VFFvaUVJZXl3TkE2QzNXQXFzamoyRGxEbkVUY25UVFJyMW1xaHk0ZFAzZjlo?=
 =?utf-8?B?WkZZeDI4YUlBb095NSt0bWlaYkhJbXBFenZBVHM1TERWUkVQckpvMXgwdjIv?=
 =?utf-8?B?WGY4OERaZWJ5NU8zc09kQTdnT2FNNVlqRHJtNFhINmxXR2Z3UlptOEVkWVRu?=
 =?utf-8?B?ZGVubFF1NTVFNlZBT1RZUVFwMjVhbTNKYkt2NGRWOUMwTEF4Z2lWeGNVODkx?=
 =?utf-8?B?eXZwVW5Zb1o2SFYyanNSQWlaYkl6ZUhqZUtkeThWcDk4aGZnT3BQTERZQTBF?=
 =?utf-8?B?WHJZb0xzMTZzeFdMS0t4N2l2K2pidnJnMFU5eUlxOEk5dnk3MzJjdmJqQnA3?=
 =?utf-8?B?eHJzcElhL1RWNEdjYm5QdnRqeGliT0xzYVZvWkg2d2M2aWMyRyt2b2hnR0VQ?=
 =?utf-8?B?Z0I2MW9LSU5hTDNTMEFzRFNGQlhibUFJNnNCbmJ6a3k2dzlYTDU1bERFMS8z?=
 =?utf-8?B?d3pKTmxLZ0wreGhXaFNKUGsxdENMRFQwcVd5cGllL0k0R3ZWTzdFVGVsK21k?=
 =?utf-8?B?Qk1HR1JYSXYzb0ZEWkEwKzliTFFWSnlBVzBFWHdSTzdSZytqQmVkQkhpZjRM?=
 =?utf-8?B?UU9HZ25OSUdyMWVPamZXR3YyWmsrLzBtYzJJWHBsTEx0akQxUXQ4amhYRFF2?=
 =?utf-8?B?SEozS2ZPaGRCSTRKZDcvUVVRbm9INDRaZnZaeXA1VDVwbEQrdFlwYWtoRkdl?=
 =?utf-8?B?Y2Zsa09qYlVBaTB1SVUvSzRuVGdsZXZ3VkNrSmpWd09MS2ZYTjRaR1BsYTRO?=
 =?utf-8?B?OENxWkwvUExEeXJSTEhtNkNFTjZNc0tTVURXVTBQUFhITHhYS1V4cy9WUklG?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2698f678-b027-4984-cf69-08da5a71dbce
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:23:49.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvpSPhxgA8qTtLtALqQPyq67qLP6ANBQN6S+gGXUP1T1a6/JVgektJWoREviMYYf4uNuzZSzGUkzN6aKy4HJ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5421

Take the opportunity to convert the variable to read-only after init.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Fix help message about rounded boundary, do not round up the
   default value (will be done at runtime).
 - Use kiB instead of KB.
---
 xen/drivers/char/Kconfig  | 10 ++++++++++
 xen/drivers/char/serial.c |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e5f7b1d8eb..dec58bc993 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -74,3 +74,13 @@ config HAS_EHCI
 	help
 	  This selects the USB based EHCI debug port to be used as a UART. If
 	  you have an x86 based system with USB, say Y.
+
+config SERIAL_TX_BUFSIZE
+	int "Size of the transmit serial buffer"
+	default 16384
+	help
+	  Controls the default size of the transmit buffer (in bytes) used by
+	  the serial driver.  Note the value provided will be rounded down to
+	  the nearest power of 2.
+
+	  Default value is 16384 (16kiB).
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index 5ecba0af33..f6c944bd30 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -16,7 +16,7 @@
 /* Never drop characters, even if the async transmit buffer fills. */
 /* #define SERIAL_NEVER_DROP_CHARS 1 */
 
-unsigned int __read_mostly serial_txbufsz = 16384;
+unsigned int __ro_after_init serial_txbufsz = CONFIG_SERIAL_TX_BUFSIZE;
 size_param("serial_tx_buffer", serial_txbufsz);
 
 #define mask_serial_rxbuf_idx(_i) ((_i)&(serial_rxbufsz-1))
-- 
2.36.1


