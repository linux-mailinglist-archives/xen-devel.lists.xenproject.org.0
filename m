Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEE77BB2FB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 10:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613295.953742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qog6k-0004PV-BA; Fri, 06 Oct 2023 08:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613295.953742; Fri, 06 Oct 2023 08:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qog6k-0004Na-7I; Fri, 06 Oct 2023 08:22:50 +0000
Received: by outflank-mailman (input) for mailman id 613295;
 Fri, 06 Oct 2023 08:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qog6i-0004NU-ON
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 08:22:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8684ebea-6421-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 10:22:46 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 04:22:35 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5155.namprd03.prod.outlook.com (2603:10b6:a03:218::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 08:22:30 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 08:22:29 +0000
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
X-Inumbo-ID: 8684ebea-6421-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696580566;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tqvjclAsBFZHiFYDXUPIw/Azji1ZvMF9ZUcuw7dGS2c=;
  b=FzosqTnE0rF0pUN6TZ3H0RgUsd3WEGAfyk1hP8zgooriGe7qTW+8Tg5K
   HEhrxdpqBY6Vd+ZF6xWRRXqXfGtuGA18ucz13te5zq4tOWIBeBJVmc5v7
   kKrWaG1XN8x4U16WAQkHkM/IjK/+CPwseFavJ8OkfNqV8BGxbPkHoqNo6
   k=;
X-CSE-ConnectionGUID: WfpcI0YqRpCT8bZoGn/rfA==
X-CSE-MsgGUID: LAyUR6tAQYeVLvXXd/GOQw==
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 124058227
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:v+bWmaj21ZWeF460AAiqJetmX161kBEKZh0ujC45NGQN5FlHY01je
 htvXWyPOP6NZGXzftt2Oo628B9T65+BzNBmTwU9/yFhFCIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyp0N8klgZmP6sS5AeDzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQnJigGT0iyntiu647rQNtrqcJkNsfCadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGyabI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqhBNpPROfiqZaGhnW3730uMkMKfGKKrMedlH6OV5VwD
 HULr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtMIwXy1sy
 VaPkPvgHzkpu7qQIVqB/7KdthuuOiwYK2ATaCtCRgwAi/HhqowuihPETv54DbW4yNbyHFnY3
 DSivCU4wbIJgqYj1bi//F3BqyKhoN7OVAFdzh7MQmuv4wd9ZYikT4+l817W6bBHNonxc7Wal
 H0Nmszb5uZeC5iIzXaJWL9UQ+jv4OuZOjrBh1IpB4Mm6zmm53+ke8ZX/S16I0BqdM0DfFcFf
 XPuhO+Y37cLVFPCUEO9S9vsYyj25cAMzejYa80=
IronPort-HdrOrdr: A9a23:J+sHkaqsxWi9htqjiOBEJLMaV5tMLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qhoPRPAh3Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzSIwxsEVDtL4LE6tU
 zIiRbw6KmPu+yyjka07R6f071m3P/ajvdTDs2FjcYYbh3qlwaTfYxkH5GSoTwvp+mryVAy1P
 3BuQ0pMchf427YOku1vRzu8Q/91ytG0Q6p9XaoxV/Y5eDpTjMzDMRMwapfbxvi8kIl+PVxyr
 hC0W61v4deSUqoplW32/H4EzVR0makq3srluAey1RZTIslcbdU6agS5llcHpssFD/zrKonDO
 5tJsfB4+s+SyLTU1np+k1UhPC8VHU6GRmLBmAEp8yuyjBT2Et0ykMJrfZv6ksoxdYYcd1p9u
 7EOqNnmPVlVckNd59wA+8HXI+eFnHNaQikChPSHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8JfV70A8Hm5uwEzvn0ehT/Yd3R8LAd23Ag0YeMAYYDcBfzB2zGqvHQ48n2WabgKr
 KO0JE/OY6XEYKhI/cP4+TEYegjFZAvarxqhj8FYSP+nivqEPycigWJSoekGJPdVRAZZ0jYPl
 wvGBDOGeQo1DHYZpa/ummcZ0/Q
X-Talos-CUID: 9a23:8RqcAGD4yrrtynD6ExZp7EU1QvE8SGX28CfaEUiXDyFzRpTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3ANGUNnA/pfEUC4uSjIYrlGWmQf+NB8pmUVlwkqKQ?=
 =?us-ascii?q?Lhe2aBRx8fBi6tSviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,203,1694750400"; 
   d="scan'208";a="124058227"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3tt/vl/44/N99sMVA4l0HFfYZU6CLDSwTIKSB9fdONCkS1lCaqNYkgnsjmwqTGroN+pa7Fyq8WQaozg8IP+ZNJYyp72o+HMSMmye12iO2sgZuMpxKnjB2GD+PvsX1o1qLQ+RvQdEkpyk+gE39xaqKbZ2dps2L1qPaXbz1O9PJDagznWh8ySrw9sy3IUIx4k5iU1istbVe2ueXlb3EsQ7Pm22bxdsPOoExKfSLIl5rDwM7RvOYxq8ABc/0e1Q/6MEjnZGoJuWvIKRiWZ0fvF67zda/GkCN165vXTJ1eoayGlDZnVwj1vgKZ6OlodEiDIjrA83IDqOefUOkBosvR2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/FrAqAEqA8Zg1gV/X7uuOcv5wvRyAGYIBHSuHeoVVM=;
 b=S9uOnxQ0SCkaiVEF473k/w67rnrmqPX+JBo+GNnV9QyAP6vvboJHg7aS0R1d2wlF1AThphHAw/qxWLUA5ikUUB3oLoeOrD+isU0F1mhFOIlh5FWIW6P7RABUTjJQSAeLynYfS6dN7ZIdnjUAeqXPUnuLN6nRU+UP5CaQt74to21/JHuIcfU48Uba6KwUirWebdm/cSZ6qfoPKWruv9T6xCxjo9Rv0nGn2Sqmhgc433Qb/nwwzZzXCgw5/rojBbEqDgnL65sRUzSjoio10y8ZCeX50+WSN6yW3JM4rbIDF9Q+Ps+Iy3Tklva69Bkkx6UxgYJCXnamzKgggsunmggAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/FrAqAEqA8Zg1gV/X7uuOcv5wvRyAGYIBHSuHeoVVM=;
 b=B1LZyTq/ZCZ/N7kYFDym+Qj96nr72Uez303nFAZkJWuSFCA5gikwfyQ48CWtpBYkS1g2uI9KkpSh7pkKAZp1Y45hs9+iZB5h0GobOPqT7V8CMeZphrfsrVoaCQXCflijlhZS6qOgX/NZotKzJXiFfyAT2oRSUYDRpRDoGBgvFuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Oct 2023 10:22:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, henry.wang@arm.com,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [CRITICAL for 4.18] Re: [PATCH v5 00/10] runstate/time area
 registration by (guest) physical address
Message-ID: <ZR_DwHUh17FL1iHs@MacBookPdeRoger>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <ff8994eb-968d-4bbb-a960-e5ca78ef658e@citrix.com>
 <ZR--ozuTl9-CgBqg@MacBookPdeRoger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZR--ozuTl9-CgBqg@MacBookPdeRoger>
X-ClientProxiedBy: LO4P123CA0598.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba09046-5c72-4e7b-9ac2-08dbc6456187
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2BNgpDeg5UjHRKAT42du8jLvZdIypHycKOR6NuT6bbvpH1YTx7XxU62nrmmuse58AQXeBaeMflbe9DYbaUNowH9iezNrDQAS9fSt2QFcLlyVU1YSJclqLrQY9CPiIS/k7RFGEEEBkyxNQT/uW/k+xQbtwb3UFKNwHt3hfTrUAUcp2roxxskfrHKZiTnUkztE4Ah0Fui9OvA5Suar79dmfFPjI35dOQlFthivi6L82PV1KJELTwxDBG/061b8NzqmswVKJWjhjYYG5M39dMu52J6WArhPnpM10wc1OWMeGukInkGLophKgYAowyhhThnsT/X1Ig1YtvQhuh6pulsTDexuvTBpkEZSkH7k6AZ1f+LL2nZW7qJ7K17+55CTY1eDlcLYAimf5LdyzYl6vZijYJogGrb1FpG2wy+mK4NrGoBaA/3hfkV2ud2UzXeoGI3VrIlexJiowuv5otC+3x+T5qvkVur9yjpx2jS9bZ9T6ceooqb6hfsNgFibI/ohalJTwEDPeGsLxbmSaFiKH0shcu+6IsRhJ2sezRPbhAPua15iOE9/GhCrZ1EgOFMPN23+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(6666004)(6486002)(6512007)(6506007)(478600001)(86362001)(38100700002)(82960400001)(2906002)(33716001)(26005)(9686003)(6636002)(5660300002)(66476007)(41300700001)(8936002)(66556008)(316002)(6862004)(54906003)(66946007)(85182001)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmZFUWR4QWRMQlFCS3FSSTJINzUzT0YvbjB5NUVGZEQvMTJhOXB4WE13ZjJ6?=
 =?utf-8?B?ZHIwOVd6amNnaEFUZTJDRUVyWFZnM0hmeldBTHkzQkp5N2JLK0dyamg0YW1u?=
 =?utf-8?B?U29xaG5kMCtNaXRLVU96U0pyZVcvOFZGZFVUUnRjem5USW9UY2tYWmhYcXN2?=
 =?utf-8?B?UkYzMGJxcEZkQklvV3RVMW9sWk9sTHY2T2lYNmlzSjlNYithWUVINStLWXNL?=
 =?utf-8?B?MDVsZTljenJIQlFFclNMUU05L2RZblRJRWpyVHVja0loK3ZaOUk1TUg2eWU3?=
 =?utf-8?B?R0h3Y0ptb2w1QS9tcTRncStMQnB5cEJueWd6NjdiWnRiZko5b0NMOGVmYkdT?=
 =?utf-8?B?L1prd2kvbVhwYXZXcEVEdXhIRmZoNUtrc3dqa3hNQnRPeFk3Smw0UTkvdVlL?=
 =?utf-8?B?cEtXMTlMZEVwREt6QjJoSWsyMUtmQWVIMHFBaUxoUlc0Q1ZvZkRJM0htRkZF?=
 =?utf-8?B?anNkV3dlL3JyS2Zxbi9PYWRFM0o1akRVNU9kMS9tZGljeGRhTXlScHYzd2Zp?=
 =?utf-8?B?eHZNMFdRRXlZNFJFajV5cjRtNW82Z3AwaEp0ZjQ4Slg3OVNlcU0zNEI3ZUdW?=
 =?utf-8?B?UFlTOWUremsyNWxMQ2RCQlhFUVBMQWtwdmdWcDlzRWhFaHBPeDJvSlY2Sk1o?=
 =?utf-8?B?US81NzVVMi9CVUVaUXFCNFJWZjQxRUJVV0ZGa05IdHlNbXFZNDFYOXd6Q1Y2?=
 =?utf-8?B?VjU4b1N1WTJhLzQ3ZW9BaDBWUVBIb1kwQkdsUTFMdTR6RzltSXdmVmh1L3I5?=
 =?utf-8?B?bmZCWDdobmYxVzhhakRybU1YT3pVYzN6aHJhYVBHZXc2aGFRUE45azJTUE9D?=
 =?utf-8?B?OUMzWUU0MHRWWjhlRDkvOUtLQVJkWHpBRXJnSWpHZTg5Q3JybStWS0hhSE53?=
 =?utf-8?B?L21aNFQyaFo3YlhjcElwY004ZjZ3T05rdWRvdHNGQjh3WjZFRWJlYlJnZndt?=
 =?utf-8?B?SlZlVUNDM2NiajBXaFp2MFViZEdwVHd3VWo2VC83RE1sWlpoN0hvLzE0NHlz?=
 =?utf-8?B?ZWlhWGpPeUROQU5pa2d3bituMURMaXNVNXI1UUdvTDJaWEszd2Y2OU9DZ2dk?=
 =?utf-8?B?YkFtNkhDR0l6UzVaYmdBRW1xZGdlRUgyZ3dxS1VwamxlV28vMXRsYllrL0d2?=
 =?utf-8?B?YmJIUnR2bDMvOTdmL0owNzB1NXpFRlpOalFuZWMzNjQ2aTIyNlhxRjk0NWVX?=
 =?utf-8?B?aXF0YzM2Uy9JRDUybUlPTkpDdjVxc0owdUp5UFpNdU1ybWVIZWo3b05QcG14?=
 =?utf-8?B?OVlEeFNUSi9kVGNPdnJxVHhNZWUrSytsQ2JaU0pRTEprMEs2eHI1OGRZM2ZF?=
 =?utf-8?B?L09zV05nVE14UC9DTlRwUjFwMlhKL0QxT3QrQWczc2IvMzhZeDJDckFCcjVF?=
 =?utf-8?B?YWJ0YUp4QmowS2hkRDU3QWZDSENwQmlpYm5nanorU3NTQVBNdTNzL0FZRTZw?=
 =?utf-8?B?SDdyTFdJM3NZYjBvR1hQYStMNmNlS3o2U2dia0poKzUrazZkemdKdnNmdHVI?=
 =?utf-8?B?WHhoQWV6bVRCclJxV0ZVcURvU0tOdUc5SHNocEdXMkcxclhGcWgwV0NjQkhC?=
 =?utf-8?B?VW05KzJMc3ZCcElNSjE2aWI2QjZnVlR1Z2NqaURiMDh1dFVZays4NFZ2REo4?=
 =?utf-8?B?Q2sxVzFTSk83YnJTQnNkNmZDcjZaZHZ1OFpSQjZwYlhzZHVVM2docGtyMi9D?=
 =?utf-8?B?Wjd2UW9uVUp3Vlhhckd3c21CUG9TR3lhNzZFZUlYUGNOZmpFQ3FCTGJMZXN5?=
 =?utf-8?B?NEVtbmRHS09yQnovM3NTeHEydkZBTlZySzd0Z3htSXk5UXZ0UmU4SnZuYmNj?=
 =?utf-8?B?bXRhNzVFdzFOZ1JzMlBvaXdUdnBhVHMwZm1JOWw2bmt6azNJaHhuNml2clBD?=
 =?utf-8?B?Nmh1T3gzNDZDU3FKRXNUQnRrNHpENnI1Z0pHTjh4ZjFpbSt4dSs0ck5jc04y?=
 =?utf-8?B?YkhSRWM1QkNreSs2WDJteVhUTHVIenVUcWcwVWRrb01aRS9UYXRDK2l6UUps?=
 =?utf-8?B?ZnpaYXZYV3pJdDF1YkNnT000enpGcWoxdmt2Wk1GdmFQZXZxd281TEV4V0Rw?=
 =?utf-8?B?WkxITVlqdWw4VHhrVmRMdHk0bkV5QlZvd3ZvN2NyaWlXTVRHZU5kSlY5bGY5?=
 =?utf-8?B?TURVT0czRDBuQVJ1TlJ0UVYzNyt3SzFTQXFySjZNNVpGR0hSQTZ1Rk5LaGsr?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DeBbDXgccSYfbUCttZX49XlcxRjED3Ip3IFbt3PMZtT4C1vqUhtHgfZ3zo2RVbj2o9mGPNTDm7lpti8rN9ZXdUSUSQ/C/CBUp4SKQFoI56kILoFM7Wm1OnzDgZhe48F6eRh5R6Ba5MYP8A5tMFtdAeCiJNlXthnSJTlJvVvX36YbaFOzs87OpSqkVwjs9rl/e155aoPuo1mAiIt+Yua12uFsbjZ/xnwindG0sfc/PDxN/N3GcwwKRz83AiTBJG8IXnTnlGGLQZZPg1KqTyFe7DT9+AxaRQiyP9vqEbmTeBoqKx5OoG+r+f8GtRhZpmeQ8Dp0hymQp8eIiUe0qKK438u2dsbaE1ZICQQh9GjhEfQVSFSOhXnh3My8bPMTbrFS29uclQFLhnMucTV+egeVyA9ichRp9JWqGgFi15Oe8df9NIrjWb+PKazHMcVllM4rhI2TXn/JxS8TgSsc1vvX1lYcv2JDBX1UlDSq6Y3pHSvIJ7jvQ6CBTYSUPxDDpRH5hGjHO/2D5i9pxFhtboGl/Gv63MEd2PupeeNFbCBb14OmGdhgqQ/FN5oWEwoJRo4Soq9WtfiCV1CwBFb5UYjNV4+yy4o8edhsElzmNfIXBg+XT67B89HMyUbkbTHzJMBwg5Y7UXZIfxhsYa+31PUpIfUTj/9PjopIZhVUbYGkZLBhPjDhLEl9HBUIN4NJUoVonSXhlJxHgFSShjR8MW5uYzNRXIW1C+fEO2lFPDkM96slTOc+m6NL7fKahqbKtWiYHbaZxyjVseQGw1bvSpRlrClwhz2pFsK/3bGpLf6oPQUFgBLo1TQY5yhqvF6iUnrtiRLe/5yUBPmZU3iZT/6oBQQK28CXGzyZttB7jGTjBRJqzzd464jB7dObh125wJVIMMOCfgyvhHN0DD1GhDK+c6K/Jwzp/e4TidemA07wCsA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba09046-5c72-4e7b-9ac2-08dbc6456187
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 08:22:29.7294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ktYmg4kSwF0rVgIohR8U+sKqNCPHPzQzgnANB/hTOLrrtPgs7FjwZoaywtHFwwKDpDcD1VP5Hju5plrXVYKdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5155

On Fri, Oct 06, 2023 at 10:00:35AM +0200, Roger Pau Monné wrote:
> On Thu, Oct 05, 2023 at 07:58:50PM +0100, Andrew Cooper wrote:
> > I see this series has been committed.  But it's broken in a really
> > fundamental way.
> > 
> > 
> > This is a new extension with persistent side effects to an existing part
> > of the guest ABI.
> 
> The only change in the ABI is the different return code for multiple
> attempts to map the vcpu_info page, it used to be -EINVAL and it's
> -EBUSY now, which seems more descriptive.
> 
> The added hypercalls are an extension of the ABI, not not a
> modification of an existing part.  Or maybe I'm not understanding the
> complaint.
> 
> > Yet there doesn't appear to be any enumeration that the interface is
> > available to begin with.  Requiring the guest to probe subops, and
> > having no way to disable it on a per-domain basis is unacceptable,
> 
> We have never mandated such disables to be part of the series adding
> the new hypercalls, those have always been retro fitted in case of
> need.  Not saying we shouldn't do it, but it's not something we have
> asked submitters to do.

I've been thinking about this, and I assume that we would like some
kind of tools interface to list supported features by the hypervisor,
and then a way to disable them.  We could then use such information to
level the hypercall interface across a pool of hosts, and make sure
it's always the same.

In principle guest should cope with some features/hypercalls not being
able on resume, but we all know this is not always the case.

I'm going to punt this, as adding such interface would be too
disruptive at this point in the release, and in any case it's
unlikely we could reach an agreement on how the interface should look
like in a very short time frame.

Roger.

