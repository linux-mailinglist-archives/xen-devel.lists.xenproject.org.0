Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846616C1CB7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 17:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512016.791561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peIiK-0004ja-GA; Mon, 20 Mar 2023 16:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512016.791561; Mon, 20 Mar 2023 16:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peIiK-0004gq-DD; Mon, 20 Mar 2023 16:50:28 +0000
Received: by outflank-mailman (input) for mailman id 512016;
 Mon, 20 Mar 2023 16:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxNw=7M=citrix.com=prvs=436835ee5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1peIiI-0004gh-OP
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 16:50:27 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d03ad9b-c73f-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 17:50:23 +0100 (CET)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Mar 2023 12:50:17 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB7021.namprd03.prod.outlook.com (2603:10b6:a03:381::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:50:13 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 16:50:12 +0000
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
X-Inumbo-ID: 4d03ad9b-c73f-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679331023;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QllHSoatFSrZQQVqMe4GPJ1t3+5LKCZgPuq1JqD777A=;
  b=eX72ggOPKzhkPjIQq2K7y48PFgKRPyXzJ8No/YIa2Tgg8BO1+TvLl9hi
   11L/VFkHZhL8KMXKg67KZ0gNnQdb2QyG1yIVgg/reWlubr8OUOw14Mvop
   c4RKgdTxZs1ci7Mrlm0P327X8xNdt8/0PY/Z7HNVFf3HdoLRLhqAcEc9R
   U=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 101485969
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:O7R68Kxsvc3WW/f7l0V6t+dexirEfRIJ4+MujC+fZmUNrF6WrkVSm
 zROUTuAPPqDY2LxeNlya4rj8k9TvZ/WzYRlGgVkpSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6gT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KSZPr
 sxfFAAUVzfdhtidmLOyWPl3g/12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQtuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eWwXOmCdxDfFG+3qNbpHaC5D0CMRQpcmmdnceShnHkaesKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBuE2+zU/g+fCUANSzIHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTSYAQBsM5dXuusc/gw/ETtt5OKewgpv+HjSY6
 zuKtiklm7Qai4gI0Ki9/F/vijeg4JPOS2Yd3RnaQWu/8kVZZYqpaoay4F7Xxf9FIMCSSVzpl
 HIZgdqX6OcCCo6EvCOISeQJWrqu4p6tMDrajlpiHsBn9ymk/XGLdIVcpjp5IS9BMNsAeDavc
 k/avwx57ZpfenCtaMdfQYOoCs0si4PgGNLNX/XYKNFJZ/BZbxSb9StjYUqR2WHFk0U2l6w7f
 5CBfq6R4W0yDK1myH+8Qbgb2LpyniQmnzqLGdb80git1qeYaDiNU7AZPVCSb+c/qqSZvAHS9
 NUZPMyPo/lCbNDDjuDs2dZ7BTg3wbITXvgad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:T76ieaCKCqlbOzblHem955DYdb4zR+YMi2TDtnoddfUxSKfzqy
 nApoV56faKskdyZJhNo7690cq7LU80l6QU3WB5B97LYOCMggSVxe9ZjLcKygeQfhHDyg==
X-IronPort-AV: E=Sophos;i="5.98,276,1673931600"; 
   d="scan'208";a="101485969"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdQbEd3Xg/jzBGiuggjdeZhqaIUma19sBTB9D9JWBB6SU6Uu4QISpnLp1Zt01fZj42BmDmWJlmV1n54DiZlb6fyuXRYzc+x2avkJ3IPl8GZzaQyHF56sN70+3p5Cqi5jc1UKjfzvPZKrS8VQYwpKxcDseTaz7VaIRsyR2hGpEZCcFCYqSqNy8UekLgMIa3xKXaFikO+u6Expq/0ABehAZ5oEeq06vjiszUuL5muepdFQCazi6Mwjx+sVjllqrzRcUk0/J+V6TQvr2WFrF0/5R/z0aFmHL9DJlWgFACMI1thsJHtDUgcqBvsdEplkm620TfvRed9xPOm4o3orNZ2lxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7UanYDhUnrqnRK0v00GLIfHsL2xnjDQWkwY6wpmlFI=;
 b=REfghXuEXHsf2ThaFvozAWx9008fSCDUTxz6JcXarL7lnIZqZXRRhTY+yCwFLloNeHxVmOM3Lrnm4Jwl4kcK5ivXPyoChDEdImgZr0OUguxy1oWb4e6aPPuwpBwflW7ab4g8dRMw/OWPJSnyINA27miN7UaayN9YRJnetoIMl5ifZmNz6L9TVPzFIV2ZAi44NeaZY089ZAYY9pTQDyTJHuhEYDhOjnYt9Q28zO42RLqE13lhEAEbOUYVi+kuDbvGfJsPnja7/eE11QsRigKGzyfZS1ZWu0JyK1BZqyGof0q1Kk1ArZ9cWPPC+lQ+S6aqMj6FbXrAU34aMfxvZ5rbiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7UanYDhUnrqnRK0v00GLIfHsL2xnjDQWkwY6wpmlFI=;
 b=qA/eHZUdPod5s/pONK4DKfxwLAF0Pp/BsYd7m1gNZUxyKbBW22Sspfy37TiE6d2XARbZan1ofdozvCOHlDMPAM5r1Jkq9hI/QJmz2nTNnr3fsA6JnxxX0nZDBk5tOccBaUFkIg9Rw176JFfkFN4TADPmgrwxvhKmPBcqiCGSlWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 20 Mar 2023 17:50:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Huang Rui <ray.huang@amd.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Honglei Huang <honglei1.huang@amd.com>,
	Julia Zhang <julia.zhang@amd.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Message-ID: <ZBiOvYKtF7OPNsm3@Air-de-Roger>
References: <ZBLg8WB8HCoZvwz5@Air-de-Roger>
 <df607690-0bfb-94a3-fac6-5e20f183dc20@suse.com>
 <alpine.DEB.2.22.394.2303161611220.3359@ubuntu-linux-20-04-desktop>
 <4edb59db-d2b8-122a-fc10-59001857bee0@suse.com>
 <ZBQ4DKJ8ZAroyPIQ@Air-de-Roger>
 <alpine.DEB.2.22.394.2303171115320.3359@ubuntu-linux-20-04-desktop>
 <ZBTEBkaI8q/mrJmv@Air-de-Roger>
 <alpine.DEB.2.22.394.2303171346410.3359@ubuntu-linux-20-04-desktop>
 <ZBh4w+hDajq06BU6@Air-de-Roger>
 <f62de066-d17f-f513-9eef-73615ebaf645@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f62de066-d17f-f513-9eef-73615ebaf645@suse.com>
X-ClientProxiedBy: LO4P123CA0157.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6681f3-015a-4590-4c76-08db29632bcf
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uWWDSKQiuB+mYMaQHNCFpBW/NCJxdaqP4p6X/ROSUPKEN8Dot/izEEiHhPPnzAd1QJKmpWW5D8nVJpLN3BzPFhXFYwulAIOKGPU1Kl5PdiAt0gPU77iR0TK64SAQLtuWWIJew1NdFi81zVVs5DTLjFk26zRb6BBCV+3TeqWdDpr3MBQAHXjvna85knh+p2/mJR/R891LIGGAW3D6YgQjbKwuH194VJSx9xGnod8vn/2bkbQOKRwyggVRuEzeCh5lYUZ5Zu3/Zdc5c6vTQrAecDBzbiVVNHCWNuKEjyYID0688M06YhL5pumjGVAKPskXr3rkPxSOju2lXxFQWesfw/df+RGEN3eN7N4fvEEEmZzct7rnuCBoTH4MnZ2ZbMBW1xBKpOuaa9lKHtkH08tZpZWJKF+zlJ/G0Ki0RAbXpnNK0OI7iB5fQ59CL/BinR+lTyz4OB2LBXWYVhhB1aumAs6+7yHRScvrD6UUndw8Uqtrc0ZXVjYap8sNRJgCrq733aYUjWe0FN8CT7Au/FWQIgfGosh+s3Un5iYtNppb7hTo3dB97PtZcTbhNJOsPPGOT08M+1w5a6JKNnFXj2MkBu3tXH4laPR1bRu3sVHht5Jm+3GhySZfwVqmGqBQyfxfxc+93RQhsicb6+YfOtHQMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199018)(86362001)(33716001)(6512007)(26005)(6666004)(6506007)(9686003)(53546011)(38100700002)(6486002)(2906002)(85182001)(82960400001)(5660300002)(7416002)(8936002)(41300700001)(83380400001)(478600001)(186003)(54906003)(6916009)(66476007)(316002)(66946007)(66556008)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2lCOHg4dC9OZUQydjdaTHNzclZZNUgzaGZzNXRtR1RRR2xBWWM2a0h0RkY5?=
 =?utf-8?B?a3VsNHdNRjc0aHZXL3Zxa3ZyVFdrREpSNU5hSnZlbVFsSnFvL0RNdWFubFcw?=
 =?utf-8?B?RnlrbkhTZkpSOFdSei9xcnIyQWpjanUyZFF1WVUzbDVvL1lEb0NvWEFTTmVj?=
 =?utf-8?B?TUtzVXNPK3NpKy9mbG1OSVNpTlJnbWVWekRPVldqeDFqNk1vV0FYcTRURjFy?=
 =?utf-8?B?OUJMUlNaeHBOdU9JU1REa2UwS2twWFlVYm10eW5xVzVZdjJ0WENSN28wY2pC?=
 =?utf-8?B?ZjJ0N2xHbDRvZHRvTk8wZmxYTzdyUUJKbzBBb3JFV0ZVUGVkSVl3TldWSkwx?=
 =?utf-8?B?UXVvOWUycFhJY3VFNmE2WTdSTkw3ckIxOEVBSm9xemJtdFBPWExjajNja1B4?=
 =?utf-8?B?REJ2RUdtMEU3R1RqRFZoTnBoWUoralhSRGdhZ0NNRDNuUlVQQWVWVzNOUUlT?=
 =?utf-8?B?Ylg3ZndsRDZ3WlRnNU91VVFMTHByRXRibkwxS2hMWXdkT1VuYmE2ditRenpP?=
 =?utf-8?B?TlVTOGZEVU1jQ3hwalU0WHlDVndpN2xwQUtKcUdmek03cWdwWDUxMzJrVFk1?=
 =?utf-8?B?aGhXbEY2cmpLZE9ubnMwWUxXd1VYWGl0WGw4RWdFTkd4NXdFazNreHZ0KzFx?=
 =?utf-8?B?QjZTV2RzMmVlZ01lb0RWalZVOU1aQkswV0cyZEUweWZadlgwTTBZRUplZTk0?=
 =?utf-8?B?UUlhMlo5SWFzdWVkYXh0T0VvVGsvMVZGdy94OWszRzZJUjZ2Q3NiT2VDSHRz?=
 =?utf-8?B?YklGWWJTVUpvejFYSkRpSThXQStpVWFOdks5VVVURzFValpXTWNKV0x0RU1B?=
 =?utf-8?B?L0VIS1UwSWlpQTBlOEtDMXBFUnBIeXZPU2gwUVBRK0kxQ1hFdU1pRlR5T3VK?=
 =?utf-8?B?WVJFVFBab2JHSGVnVmEwMzZqMDJ6b1FOeXgzdlBKWWl3dnZWUkV5cVJxQ1hB?=
 =?utf-8?B?YTZkSjlBNFErQnZJdXllOStwVFRwZjByemhDb2hGMDcwSmFqdEprMDZaWVVL?=
 =?utf-8?B?WUdUTFlVTzJjcGdobmlNbHoyalBKRzNYblIvWFR3bzhwd25hUGdjQVZFU0lE?=
 =?utf-8?B?NWt4TFVQNmY1cWRUQldEVGhObzdRaUxjNlhQcjVYajVtNEllZDhWYUhIcGtX?=
 =?utf-8?B?VHZsZ3JUdDl6d2NlU1NXUzFhanFMSzBZckFaa3Bab3oyVXJONzB6RkxoMkZD?=
 =?utf-8?B?ZVMyZlZnai81bUF3bnQxT2dwOWVrSVlMRWcrUHE5NkJ4LzUyZFhqVHJ4M0U2?=
 =?utf-8?B?dUx2UG1NRWpZZ2NiYkY3ODRRQ3FsTXlKL293aU1GbFA1WktrMnNnazRMRGJE?=
 =?utf-8?B?aTNqVTZSUmtUN0NtWGlwQ2JaRENCcHdSeVhHcGJ2eWNIMEc5ekhneVQ4M3NO?=
 =?utf-8?B?VTRnUmRyRjdpNGhKVHZNVEdCdUhHdGpxS2d2TjhpRStacitKYUV5VUZWSFZp?=
 =?utf-8?B?ZnhuSW9nWkc5TjlDdHFldXpOQ0YybXdoQittaVNlV2I2SE11Q0tWUGdiWDUy?=
 =?utf-8?B?K2tTVVI3cGxrMW45a0dXVFgzY3NYTC9DZDFjeUxRTzIxNUxmLzdORkhBZjFR?=
 =?utf-8?B?Z0ZodjBYekhlUzNYTW9TemF4NVJsTXhscStpV0hXUGw5ODVqSVgyV1hWWWZL?=
 =?utf-8?B?VGN0a2piblJab2ozZC9nVUlLUjUvZmlpQnFyY0FLRnplYnJNSzdoK0lCQklw?=
 =?utf-8?B?MzFsRHg0RVRjK3A3bXE3eHFTWElkcHdRL1dDbU9QaURVRWJMT3hDMmYvbG1p?=
 =?utf-8?B?SmFxYkFka1JaanJzbDlYWGJDdlhLb3pwUGVwZnRoNmRHbnZJeDZrODdhRTJ1?=
 =?utf-8?B?bEo3RERCaC9QYUhMazJ1NlcvNWExTmN1KzNRNlExTDR3cHVkbStPSUMyZ2hY?=
 =?utf-8?B?d1lMWjc5czVyb2lFMGJqbC9MWmdXcWNhT01hTmZmbGVBVjg1cjR0eHdrOFFC?=
 =?utf-8?B?OVhTNmF4eTFJSXBYZEsvQkZuUlcwaEZPdzdNNzFvWm5WaExxWUhJMHNjWitK?=
 =?utf-8?B?Z1h5bzRkZDJacGh2Z3ZZWVl5WWt2T3FlZnp1RFludTVtclpZVmFqRk1pTzUv?=
 =?utf-8?B?OWxEcEZmM3VYMGVJWnQrWDE1NWFXM1FZMXROSVp1Zi9KUEc0dWZPMVNMMm1i?=
 =?utf-8?B?dTBCczRTbHIzYWpwZHdoalpIWFNrQ3B1Q1VmUFV4dXVZL0lmUUxJL1k0VHBR?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T0zZDIAR6LxgMitnJ7HteaFXg7bPkaHKHGBDzbunQ3nJ1ExogJuK37P3CY/2i8NWSkr4CANUC3ji0hPxqcHhkaE5Df9I/REzg9p235L2pZA4iKb1uMp/dq7nL57hjzgonCWQz006WldKbCow+S1rS0l+PiPW9MJEI684tEpPOyQ473i7sO4tLIXHGuW9GbVrAGZr1NXP/wP03ghMqZiiph5IZeSRp3VT6WL7tMGsOziMqV7ediMPPStzpE/GFgmoaqph5xBhbcJ7BwNSBuwcqbf8OcGrxlK/Xfjc1PfVkSNQqX2bXwe8dkn62QVM0OWlhU32J8f89tjZ6j5Rl3+UacbL28i0ip+2LBnyenveVAW+/rwEBz9o5w5dtk5DU5wSU+aUJez0PlrK1gEiBETHUQxzcWhXXNpIGlFArTv0VOIEaNV+4GXqwgxpmEE6NYw7Fdsfv2rzm6imt+fto894iWjL6S+dZGRrgXUo9DKJS8HrIfswf5DvelRq7uzjNKsLPn8skaIpqjwBWHc+yZQwyjuPR5dcsT8goePM/FTqAPX1ZVlhFzS6c0pfwwoo0I5BoB+JihZ/SdjftU4ezunb2+MvTRomyFRwjer4FF55TWK8qCiq/pjOnakNIFUWpW5oPUVrDOVMHsLeE6HyUSMASGG5OsSRIYKFif+TVG3c60Pp6WWaXVqBGiZGWV7aKaJ/cyK29r0/2up8hHcp+FIp1ZHJ5nEAu+BP+NhWsq6kn5IJvceCO3Pr4DZMWiJeHAp/nrUqe+xQAUg/6vC3xAjF0oOOH+bSsK+TPLtEVjAaOxK7s2oTsiPIx1Ht/i2EuGdfmjr5spUlS7icdN3CFy1TGsq1ea3ewnUr2zhP+K+TR2JeQNfvqQzGZPQXI7sH1ZTR
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6681f3-015a-4590-4c76-08db29632bcf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 16:50:12.0938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSB7mxepNGwqHIow18/GCkXMxDYEYYLiqI9TDOjq9fPS++sB1cpan1dp5pdr9oqhCk3ga5niQUpgXjcNblAtaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7021

On Mon, Mar 20, 2023 at 04:29:25PM +0100, Jan Beulich wrote:
> On 20.03.2023 16:16, Roger Pau Monné wrote:
> > @@ -244,12 +242,18 @@ static void vioapic_write_redirent(
> >      }
> >      else
> >      {
> > +        int ret;
> > +
> >          unmasked = ent.fields.mask;
> >          /* Remote IRR and Delivery Status are read-only. */
> >          ent.bits = ((ent.bits >> 32) << 32) | val;
> >          ent.fields.delivery_status = 0;
> >          ent.fields.remote_irr = pent->fields.remote_irr;
> >          unmasked = unmasked && !ent.fields.mask;
> > +        ret = mp_register_gsi(gsi, ent.fields.trig_mode, ent.fields.polarity);
> > +        if ( ret && ret !=  -EEXIST )
> > +            gprintk(XENLOG_WARNING, "vioapic: error registering GSI %u: %d\n",
> > +                    gsi, ret);
> >      }
> 
> I assume this is only meant to be experimental, as I'm missing confinement
> to Dom0 here.

Indeed.  I've attached a fixed version below, let's make sure this
doesn't influence testing.

> I also question this when the mask bit as set, as in that
> case neither the trigger mode bit nor the polarity one can be relied upon.
> At which point it would look to me as if it was necessary for Dom0 to use
> a hypercall instead (which naturally would then be PHYSDEVOP_setup_gsi).

AFAICT Linux does correctly set the trigger/polarity even when the
pins are masked, so this should be safe as a proof of concept. Let's
first figure out whether the issue is really with the lack of setup of
the IO-APIC pins.  At the end without input from Ray this is just a
wild guess.

Regards, Roger.
----
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 405d0a95af..cc53a3bd12 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -86,6 +86,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 41e3c4d5e4..64f7b5bcc5 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -180,9 +180,7 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsigned int trig,
 
     /* Interrupt has been unmasked, bind it now. */
     ret = mp_register_gsi(gsi, trig, pol);
-    if ( ret == -EEXIST )
-        return 0;
-    if ( ret )
+    if ( ret && ret != -EEXIST )
     {
         gprintk(XENLOG_WARNING, "vioapic: error registering GSI %u: %d\n",
                  gsi, ret);
@@ -250,6 +248,16 @@ static void vioapic_write_redirent(
         ent.fields.delivery_status = 0;
         ent.fields.remote_irr = pent->fields.remote_irr;
         unmasked = unmasked && !ent.fields.mask;
+        if ( is_hardware_domain(d) )
+        {
+            int ret = mp_register_gsi(gsi, ent.fields.trig_mode,
+                                      ent.fields.polarity);
+
+            if ( ret && ret !=  -EEXIST )
+                gprintk(XENLOG_WARNING,
+                        "vioapic: error registering GSI %u: %d\n",
+                        gsi, ret);
+        }
     }
 
     *pent = ent;


