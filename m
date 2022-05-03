Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB8517FCA
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 10:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319258.539445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlo06-0001Uw-TW; Tue, 03 May 2022 08:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319258.539445; Tue, 03 May 2022 08:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlo06-0001S9-PK; Tue, 03 May 2022 08:35:18 +0000
Received: by outflank-mailman (input) for mailman id 319258;
 Tue, 03 May 2022 08:35:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlo04-0000uC-W4
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 08:35:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3832d10-cabb-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 10:35:15 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 04:35:12 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BL0PR03MB4179.namprd03.prod.outlook.com (2603:10b6:208:65::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 08:35:10 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 08:35:10 +0000
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
X-Inumbo-ID: f3832d10-cabb-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651566915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=0ALjpBG9H74y2OyguSqoGmv7JglxakPmZeprVRyZkfY=;
  b=QjxjrLKdjXRu39HWD481EheRgRIwdgX0UayvSe2Yu+76Ru+yPFWVni/v
   rQh2YIK7vF5dU5/PMxOzGK7IkYeQRbOdogEBTgyFaEJtJy0UpOVs6R/WO
   7dQ/qAS/DRr/SZ3crgy7Rr/ljCgTuTSUH6+j58t9QsycpULEjN7IFmSO7
   c=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 70853965
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dUtX4q6V2UV66XiFupUuMQxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 mtJDDiCO/yPNzOnc9FyYIvg9hkFsZ+AmtJkHQNq/nw1Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXhWFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSMRT44DvTJgt1DQj8ACnt5F4JN1L7IdC3XXcy7lyUqclPK6tA3VQQcG91d/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiao4YGjF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IA+A/O9PRqi4TV5F16iZ7zHMLVQIXUf+tWrF+yo
 jrdp02sV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJt//YS7QiMzu/e5VafD21dFzpZMoV45IkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLS8ZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:pNzBaq7BPapexItjoAPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKnyXcV2/hrAV7GZmXbUQSTXeVfBOfZowEIXheOj9K1tp
 0QDJSWdueAamSS5PySiGfYLz9j+qj+zEnBv5aj854Hd3AOV0gP1XYbNu7NeXcGOTWuSKBJXa
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWCSw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLLhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqn3d+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7kF6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklXKvoJBiKqbzPLd
 MeTP01vJ1tABCnhjHizyRSKeWXLzoO9kzseDlBhiSXuwIm6UyRgXFogfD3pU1wha7Ve6M0md
 gsDZ4Y5I2mNvVmC56VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.91,194,1647316800"; 
   d="scan'208";a="70853965"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nArM+VtXNOLH3HS3W2eoxeBfOASKRtzYgDp7cDW4nEB1bOSzN7eUoSRm/9ZuADFMo8ixR+a7fgGfXfKalL0Zd8DaaruJylyrgRP72+4GGyl8yJw1Rv/+weejhsyvxMkVkkGamBVDirvqFwJBGPd3KOYQ1hFn1TnCvsf/O5Obt+zVVCzh5DzSmr1vWSm38ejztYDojJIJ89k3bB00eRgQEOaPH7jVFITfzVEa0fL18s/GFGa1opjnHd9GsUDXe2085Rr/h/ZRcftsw/IldPb8zq4uIGgwAj3y7cYNamaEJin9XIFGjqzpD2ma+GKHkZoL8MiUisuuTwaFbikx7I5/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5wbVzI2swND8Fk8snerwIQvwv/wXq7oC/Kmtewmsy8=;
 b=F15eCWs9uOG2NztQREHplO7WEH/Sq2qPEmlyc7Yvh/P2cKRpgztF7vMC+L3WGKGhoXVzJoSKAAGCWeb+ZfzduJkSHO8Y8oMoN3fo7KbPc6PAHzWlpFa03+PyIHqMV9dpdW80yV+M1WDKVzEIi3SYfp8XGL0kbny2//b7jwBMH85LAGiCVz1++iGUv5tebqMQKm3l6iygRugtNLHUSXcrRuCQfoK+E2lnpR9IXelNZSEKlugLQ1Rosws4Z2gyNOg9nijkwI4jSybZo4hHikcl697sMgJ5AMsouYiEqSR3CccoynyduRGNUilFnB+zvua+7i/VMhw/n+vCwgkxbcS5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5wbVzI2swND8Fk8snerwIQvwv/wXq7oC/Kmtewmsy8=;
 b=OGey+vu6tUUSvzE5TGiuw1PSdGfk23Ok6cyazGhaO8054bNmcDhBNKgBKZGObh4sPR1gE46NPVpZVksU4u3JkL82R5qVdb42omsPMpfZPMMC6c3/w4GOnE9UlZvKhoyXPYSMGXWYw7s7noZSZagb191Gy51uUoVUOj7+TuMlmsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
Date: Tue,  3 May 2022 10:26:49 +0200
Message-Id: <20220503082650.23049-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503082650.23049-1-roger.pau@citrix.com>
References: <20220503082650.23049-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0419.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3efebba0-173a-4d2d-3898-08da2cdfd56b
X-MS-TrafficTypeDiagnostic: BL0PR03MB4179:EE_
X-Microsoft-Antispam-PRVS:
	<BL0PR03MB41790F62EBCE05A7E0436DBD8FC09@BL0PR03MB4179.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CZ0Yf6ReLlDbsLYRzYeAYx4GjgxJJSNcyJlSrvzS90RlqfXQ9lH0PTcopk2KOfLN/MDa6bDoAK/rHy2Y6LCa19+CGVvXxLic6R1bxYUOOI2RI/dXEJtlVynQXcAPNhBOrTOtLPEc20KNhfw6yzpBy8Pqa/sjxQDnWccX+3utA4U7v1SdKIwInyysCASSnXKozgE/Ie1OxgKME7ncJLa3FHF1rDW6Jfp0AE+gypzII1ZP/I9nqBAGN3V7hkQbfNWwXX1DAziHUtz7FgkaOjkWbjQojXwcaGDKR0P/IT2sTAtgSQLOdcYStVQx7ZVl4NGEXKE6KxI4CY3BqzlmRNODpDDiOHqYA41vlPWRaErO7n0i8YRKUzdL5q52Asb+U5SM+P3i3guqLdCi3xZbz9LhNrGltISAYUXcy9Updr7QEgWm019il3tsy49zo7O608LLxaH9EE3mscSoqAMSxQQk/aoOuctO3qCy+frsfvdY3KpmWqrm25yIELSHrIOZ8vlbd/6n//BbvvZqMv1erj8UXN1WfeFATB10UE7zooDuBIZE/DaLPxSOCFAyWvRtwx4K6tDtl702faNTeKiIEMUp4d71n3qaiTsh18Cc8UunmK7Z45IFkVClK5/VjEAx/ALyf2LAtiO+sNeIupyIgFcDig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6512007)(26005)(6506007)(2616005)(6916009)(54906003)(5660300002)(8936002)(83380400001)(186003)(2906002)(1076003)(66556008)(66476007)(86362001)(4326008)(36756003)(66946007)(8676002)(38100700002)(6486002)(508600001)(82960400001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejlQZFI1Q3kzMENvM25LTTVtUXpnZWhUbncrVG9NbWJpU2ZCeG9iY3VuNCtB?=
 =?utf-8?B?ZjRFd0ZCMUcySXA3b0xtS2xHbnRtcnR1WEQ3dmoyV0M0NGlzUU5XelBxY25o?=
 =?utf-8?B?RnFnays0ejBZbFpjNUdCbC91MUwvSGlzNzBnamlEckdUb2JoM3lGS3k2MW9L?=
 =?utf-8?B?Vm5pV1ROQjBESUQ5UnlBZUVpYklYYndNektzMnRkL2lwY2ZPR0UrM0U5eGJH?=
 =?utf-8?B?T21kYUtac1NwWFAvUk9yR2J4NTIxdWt2VHFBTkdpZVdZRG1Ta2VGOFhoWXpa?=
 =?utf-8?B?UzZxNFMza2tET1gvdURpamJZSjFsQnVFSHJRZC9MTXppeWJwNXJEWTg4VSsx?=
 =?utf-8?B?cVA2VzV2ckhIZ05jVTYvWUdGdjFKNGgrNldnZktPSUpOMWJrUkZkd0tTQmQy?=
 =?utf-8?B?bHEvOGdXejZJcit1b0ZORlhQbWE5N0NCWFppcENLZm4zcy80eXRYM3JLdEdM?=
 =?utf-8?B?aVhydHpGWUZKZGFPTVBTWml0YmRwL0dMSStqVXZUVkNQNkx5UlpnTGlhRWNX?=
 =?utf-8?B?ai9RRURBbGF1bWxtWTYyMnRaOTNicHNBKzQzbTFyOW1oUXNJRkRKeGwxeTNI?=
 =?utf-8?B?L3VJa0tFbnR4UFlVSDJtMFNYUmdvTENkMyt4R0prVEwwUnRCUHBwaG1Hb1lO?=
 =?utf-8?B?UVdlNFp1aXZJRG0wQ2dTa2VVRDNqVjhCcytDa1FJZ053TkNFKzZ5MG93WEc0?=
 =?utf-8?B?aGJJVkNVR2p3cXlMK0cwUG5rcWZqY2lGbjFINjhSanNPZFFCOHU4dVdvYjd6?=
 =?utf-8?B?VERsa3BQekQzUERkM2NOMmkybHRIeExsTTlhSHdxT1R6MGh5dzJROWZBaFhl?=
 =?utf-8?B?UFFWbDdXdWJQajZBNGVocThJa1lRTVdOYUVBSVdqaEVJRGtvQ1h4bWVxYmN6?=
 =?utf-8?B?MkhTemlNWFhFbnNDaVZabXhOcldYNG0yT3JnWFI5TmdPQitWY3pickhqYXU4?=
 =?utf-8?B?T0c4TUZXdjVuS1RKemYxWERlV2UrNDVMQkc1WE9BM1l5Umppdk5PcUJPcmpH?=
 =?utf-8?B?bEhVTDVlRGM0d0VMV1l4ZVp1MDREQnhvckVsb00vcytGWlJrc0dYYTBxdGdq?=
 =?utf-8?B?am9nQVdzaFhndnNHUkZQdVlLVGJBM2pZQWVncmVmd0h1VmtleWttS3dUMm1Q?=
 =?utf-8?B?UWJHbysyUm94bUhWNzgwN0M3OFd3Uk9aSE42SDI2cWV0TDE3LzEwVnFFVjA4?=
 =?utf-8?B?WTl4WlcrcFJpS0ZOMTVZeGVEYVBodjBvSjhtQ2pJa0dGUXFxWmUvYnVUZ1RP?=
 =?utf-8?B?MW1pMUIwYUlXZlNnbEpmSUtBUGkxMUN3S1FZRVNBNzRSUU9tUUxRVlZBM3JD?=
 =?utf-8?B?ODljdytGempnSHkrdEU1QWZjR3psY2ZULy9yRWpQckcxeGwrTVJVUzhkdEN6?=
 =?utf-8?B?cnFFWXNLTFROWGtoOFlxNHp3bFB4UEJuZkoyekZBTkNFc3Zxam56b0dpVDZt?=
 =?utf-8?B?WlQxcld1TWlkbFBRREJNRlhaMzRYY1RjMHc2eFpnNldWWVhnUWx2Yi91QUlt?=
 =?utf-8?B?WWRHU28yVlF2eDFidEh6ZzRDSDNhaDdnSW1BckRYOXBKSDBYNjB3VnlpQ3N3?=
 =?utf-8?B?bWZTakJKdUMrallRZHVON29sM25PYVFrMVcwZ2tETmdlQVNyZnNCajNEZ3h5?=
 =?utf-8?B?WWZ6WkIwSmdxdUxiNnRrckdaU3NEUzVPNytyazZnS2pHYkt6MXo1MU15MkNY?=
 =?utf-8?B?UFJvbW9nVmJEbHFLdmk3eFp4VkY4ekNJT3JFVDBUVFl1enAyd3ViYnJuOFpM?=
 =?utf-8?B?cGhSRkxuZ0lyZFdFcDZxcmdMUzJSeW9zNWdxN2pGdEhaaXdDUWh4bEVTcGxh?=
 =?utf-8?B?dW5hTk5PenpnNzZZYkVDVDFabnI5amswcGlPd0lLWlRaQTdBN2IrYjdaVkFt?=
 =?utf-8?B?UTlhRTROTHFEM2o1NkpiU2ZSMXJzeGZLaWdWcU9OTXNpUUxWTGVwUVV6YzBt?=
 =?utf-8?B?cmhVK0M5YmNpOUFSNU0xazRvYjlnVUZwLzY0dkwrMDBWVTZjOHllUGJGNHFt?=
 =?utf-8?B?Z0hyQ0R0YVBLdWtrRkVSMjJ3TzEzOHQ5RnMwQjVmY3dMVFo1Mjg5NGpVNFVU?=
 =?utf-8?B?Y25YT1krM25HbVkvUjNxT0l1WG1jUlRJZVBuck5TaEdhYUZVSjI5MHE0WE56?=
 =?utf-8?B?Y2RsZVAyVmxtZHQxWExLYVFLQU9DT3hJdGxaa3N1WXRwY0tDR0h2UHBSVC9I?=
 =?utf-8?B?UmFZT21tRkliUGluZHFPcWZ0Mm1NSkJHZC9JT0ZoZmExVUl0ZHphNnRxcjd1?=
 =?utf-8?B?NG8vWmNNNndJZWwwN2lBL0d6ekNHaWxpT3lQd3R3OXNyYjF3RTFuTlZrUVFl?=
 =?utf-8?B?N08zbG5wM2JCdlg1bHhVOTMrbDBGbEdsWG9hU2VDdHV6WGRHWEZHUHd4eHYz?=
 =?utf-8?Q?GVIiLq+AcJ2LR94g=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efebba0-173a-4d2d-3898-08da2cdfd56b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 08:35:10.1574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wUF31VvNbiyvwer9fIpws9c4wOkaGpivcLy3g/TCfHYpHvKthrINPJjQ1eFV/CheBPGDQjb7ijXyj1IULil0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4179

Allow HVM guests access to MSR_VIRT_SPEC_CTRL if the platform Xen is
running on has support for it.  This requires adding logic in the
vm{entry,exit} paths for SVM in order to context switch between the
hypervisor value and the guest one.  The added handlers for context
switch will also be used for the legacy SSBD support.

Introduce a new synthetic feature leaf (X86_FEATURE_VIRT_SC_MSR_HVM)
to signal whether VIRT_SPEC_CTRL needs to be handled on guest
vm{entry,exit}.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - Fix exposing in the max policy.

Changes since v3:
 - Always trap write accesses to VIRT_SPEC_CTRL in order to cache the
   guest setting.
 - Do not use the 'S' annotation for the VIRT_SSBD feature.

Changes since v2:
 - Reword part of the commit message regarding annotation change.
 - Fix MSR intercept.
 - Add handling of VIRT_SPEC_CTRL to guest_{rd,wr}msr when using
   VIRT_SSBD also.

Changes since v1:
 - Introduce virt_spec_ctrl vCPU field.
 - Context switch VIRT_SPEC_CTRL on vmentry/vmexit separately from
   SPEC_CTRL.
---
 xen/arch/x86/cpuid.c                   | 10 ++++++++
 xen/arch/x86/hvm/svm/entry.S           |  8 ++++++
 xen/arch/x86/hvm/svm/svm.c             | 35 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeatures.h |  1 +
 xen/arch/x86/include/asm/msr.h         | 10 ++++++++
 xen/arch/x86/msr.c                     | 16 +++++++++---
 xen/arch/x86/spec_ctrl.c               |  9 ++++++-
 7 files changed, 84 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 979dcf8164..0b6ba117b7 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -541,6 +541,9 @@ static void __init calculate_hvm_max_policy(void)
          raw_cpuid_policy.basic.sep )
         __set_bit(X86_FEATURE_SEP, hvm_featureset);
 
+    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+
     /*
      * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
      * availability, or admin choice), hide the feature.
@@ -597,6 +600,13 @@ static void __init calculate_hvm_def_policy(void)
     guest_common_feature_adjustments(hvm_featureset);
     guest_common_default_feature_adjustments(hvm_featureset);
 
+    /*
+     * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
+     * VIRT_SC_MSR_HVM is set.
+     */
+    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
+
     sanitise_featureset(hvm_featureset);
     cpuid_featureset_to_policy(hvm_featureset, p);
     recalculate_xstate(p);
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 4ae55a2ef6..2f63a2e3c6 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -19,6 +19,8 @@
 
         .file "svm/entry.S"
 
+#include <xen/lib.h>
+
 #include <asm/asm_defns.h>
 #include <asm/page.h>
 
@@ -57,6 +59,9 @@ __UNLIKELY_END(nsvm_hap)
 
         clgi
 
+        ALTERNATIVE "", STR(call vmentry_virt_spec_ctrl), \
+                        X86_FEATURE_VIRT_SC_MSR_HVM
+
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
@@ -114,6 +119,9 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
+        ALTERNATIVE "", STR(call vmexit_virt_spec_ctrl), \
+                        X86_FEATURE_VIRT_SC_MSR_HVM
+
         stgi
 GLOBAL(svm_stgi_label)
         mov  %rsp,%rdi
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 0849a9dc5f..2d0ad05111 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -52,6 +52,7 @@
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/nestedsvm.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/spec_ctrl.h>
 #include <asm/x86_emulate.h>
 #include <public/sched.h>
 #include <asm/hvm/vpt.h>
@@ -610,6 +611,16 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     svm_intercept_msr(v, MSR_SPEC_CTRL,
                       cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
 
+    /*
+     * Always trap write accesses to VIRT_SPEC_CTRL in order to cache the guest
+     * setting and avoid having to perform a rdmsr on vmexit to get the guest
+     * setting even if VIRT_SSBD is offered to Xen itself.
+     */
+    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
+                      cp->extd.virt_ssbd && cpu_has_virt_ssbd &&
+                      !cpu_has_amd_ssbd ?
+                      MSR_INTERCEPT_WRITE : MSR_INTERCEPT_RW);
+
     /* Give access to MSR_PRED_CMD if the guest has been told about it. */
     svm_intercept_msr(v, MSR_PRED_CMD,
                       cp->extd.ibpb ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
@@ -3105,6 +3116,30 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
+/* Called with GIF=0. */
+void vmexit_virt_spec_ctrl(void)
+{
+    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
+
+    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
+        return;
+
+    if ( cpu_has_virt_ssbd )
+        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
+}
+
+/* Called with GIF=0. */
+void vmentry_virt_spec_ctrl(void)
+{
+    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
+
+    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
+        return;
+
+    if ( cpu_has_virt_ssbd )
+        wrmsr(MSR_VIRT_SPEC_CTRL, current->arch.msrs->virt_spec_ctrl.raw, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 7413febd7a..2240547b64 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -40,6 +40,7 @@ XEN_CPUFEATURE(SC_VERW_HVM,       X86_SYNTH(24)) /* VERW used by Xen for HVM */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
 XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks */
 XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch Tracking */
+XEN_CPUFEATURE(VIRT_SC_MSR_HVM,   X86_SYNTH(28)) /* MSR_VIRT_SPEC_CTRL exposed to HVM */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index ab6fbb5051..460aabe84f 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -375,6 +375,16 @@ struct vcpu_msrs
      */
     uint32_t tsc_aux;
 
+    /*
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if !X86_FEATURE_AMD_SSBD)
+     *
+     * AMD only. Guest selected value, saved and restored on guest VM
+     * entry/exit.
+     */
+    struct {
+        uint32_t raw;
+    } virt_spec_ctrl;
+
     /*
      * 0xc00110{27,19-1b} MSR_AMD64_DR{0-3}_ADDRESS_MASK
      *
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index c9aabbafd7..d87317e989 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -387,7 +387,10 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         if ( !cp->extd.virt_ssbd )
             goto gp_fault;
 
-        *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        if ( cpu_has_amd_ssbd )
+            *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        else
+            *val = msrs->virt_spec_ctrl.raw;
         break;
 
     case MSR_AMD64_DE_CFG:
@@ -680,10 +683,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             goto gp_fault;
 
         /* Only supports SSBD bit, the rest are ignored. */
-        if ( val & SPEC_CTRL_SSBD )
-            msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+        if ( cpu_has_amd_ssbd )
+        {
+            if ( val & SPEC_CTRL_SSBD )
+                msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+            else
+                msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+        }
         else
-            msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+            msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
         break;
 
     case MSR_AMD64_DE_CFG:
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index f338bfe292..0d5ec877d1 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -406,9 +406,12 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
+            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) ||
             opt_eager_fpu)                           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
-           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
+           (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
+            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM)) ? " MSR_VIRT_SPEC_CTRL"
+                                                       : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
@@ -1069,6 +1072,10 @@ void __init init_speculation_mitigations(void)
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
     }
 
+    /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
+    if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd && cpu_has_virt_ssbd )
+        setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
+
     /* If we have IBRS available, see whether we should use it. */
     if ( has_spec_ctrl && ibrs )
         default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
-- 
2.35.1


