Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB693619CE4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 17:19:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437761.692229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqzP2-00082Q-EI; Fri, 04 Nov 2022 16:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437761.692229; Fri, 04 Nov 2022 16:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqzP2-0007zP-BH; Fri, 04 Nov 2022 16:18:44 +0000
Received: by outflank-mailman (input) for mailman id 437761;
 Fri, 04 Nov 2022 16:18:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hilw=3E=citrix.com=prvs=300b5b1ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqzP0-0007zJ-4O
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 16:18:42 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56e35880-5c5c-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 17:18:40 +0100 (CET)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Nov 2022 12:18:35 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6609.namprd03.prod.outlook.com (2603:10b6:806:1c8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 16:18:30 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 16:18:30 +0000
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
X-Inumbo-ID: 56e35880-5c5c-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667578720;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=OZIy73XHDNh7huyG+lccw757BxYenNLRo+6EmZBz0Tw=;
  b=h/boivSYnjOdVVHKJTsqs0QGC77nmaDQKFG3uGB7T4ew5TYDaO6YXy/y
   4srMSDZkvjhdqkqgNVLTCUNmkdtQQUWU58jt3nvuSdI37iq1zXfvUMnpa
   tAQJypfk/jKRdRf3PfDtqeeAMSwocEnaz1Pouqn6wLndAfFtka/1tow2n
   M=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 83793898
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hqFpXa4nNpAzPo4hyi5OLwxRtM/GchMFZxGqfqrLsTDasY5as4F+v
 mcfWziDa/rbMWqneIt/OoXl8hlV78fXytdiSQU6qHo1Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkT4AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 tUVKhMqRDO5xMnt/Z+WELlIn+Q4I5y+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOiF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efxnyqA9JDRNVU8NZhuFK84lwZEycwFnK8ofy3kk/lVNNmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2JWNQG+Z3qeZq3W1Iyd9BXAGTT8JS00C+daLiIM5gw/LT91jOLWoldCzEjb1q
 xiIsS54gbwQhMwK0qyT/FbbjjbqrZ/MJiY26xvWWCS57wp/TI+je4Gsr1Pc6J59wJ2xS1CAu
 D0OnZeY5eVXVZWVznXVEKMKAa2j4OuDPHvEm1lzEpI99jOrvXm+YYRX5zI4L0BsWioZRQLUj
 IbokVs5zPdu0LGCNMebv6rZ5xwW8JXd
IronPort-HdrOrdr: A9a23:KvW7dKyN4CeedYs/Z3fgKrPxyuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhOZICOgqTM6ftWzd1FdAQ7sSibcKrweBJ8SczJ8h6U
 4fSdkYNDSYNzET46fHCWGDYqwdKbK8gcWVbInlvhRQpVYAUdAa0+41MHftLqUwLzM2dKYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoYLSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+c/DqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0GnQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnZ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvtn+9KK1wUx4S1bpXXt
 WHVKrnlbdrmBKhHjvkV1BUsZCRti9ZJGbHfqAA0vbloAS+0koJjHfw//Zv4EvoxKhNN6Ws2N
 60TZiA7Is+KPP+TZgNcdvpEvHHflDlcFbrDF+4B2jBOeUuB0/twqSHkIndotvaMKA18A==
X-IronPort-AV: E=Sophos;i="5.96,138,1665460800"; 
   d="scan'208";a="83793898"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exWmJua65++5Cd6SFkgFrnoG+PYxtJhLH+4ODBTJlSM3AJ/BT2/FmvEs3Yq0d9KyaMfbpxEjvLjg1yrU4yrwtIM3M2nCqMtm1gptHQDs5bWFoNXI87E6JvBoLPwXFOw3xlbIsfSJOHkgz9VXgW/FmCuhaC+KeUVIcLeZM5gcdNQeKUCQGH8ZX3Z0/S4MNG5T2l+okjhhpEK56V1PIDfVYIcNpJzyiQHuf9S4Va64F/ZJkQJWYjjLmRqYYyy9qY93O8MCDIQlyMDG6ElsweCJLRlm1Xcoztav6EizOPQDqpDTgBAPT/lXeLPsn5zICYcEnc5/qv/C/Oz7kQM9wiDppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fley6Y90v1no9pEdEhWt6kG4s5fyBU09mWCBmGOap2k=;
 b=MEf5pSdlOESh+IKpi4CHqszLv8u5eeLeBPw5yBFB0XLAnIWilXnkdJne1dWmdcNJzGDWRQMuNu4Vywg3Pd7M5wF4aw8nAtgzH9Mi2JOtQldgYR5iVGY5wCgq+NP3zOLCzMP2hUr9boxBWIrc3aN++K+zI7tYm4lv1rwu5uVGiHusXiIcxwtOq65RFAybN6sFL0JtbtFesQEWKK/Hhpcsh8E8N0S1dem42JqBu48uVCP7GeAbayErORbJ5wL68AdThJkj9ubwdzQ0Zm9Y8S9ETG4BjakxdYuRNOG6NG0XxDyKsTSgHnQ19qNbgV9x68XY/ad17MbFw6zFSK8iswQhQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fley6Y90v1no9pEdEhWt6kG4s5fyBU09mWCBmGOap2k=;
 b=Fs8RXrb5J+8ZNsI6UPPGKfJeD+hVbWIcwavwhpZ+CNpOzFSyM/OQOBBwjfeLjQk9/Oo5y7LqCMTfsHU9FIT4giLF7NMXoDCgUmn0pp1FL7GyM/uIcNSqMyvHsGPJdclg3YREKjD6dJ7ipeKsKoy6pP6nxkUT4O3owpEjLp+ya2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the APIC assist options
Date: Fri,  4 Nov 2022 17:18:15 +0100
Message-Id: <20221104161815.38007-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0321.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: 9255d589-4c0c-4c5c-d308-08dabe803606
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OUxlaN267uBb+r/ZK1RN9p7IZYzu9bATwkE4ZiCpfkiA5wgQndHtT538Vxhwjls9hA9Fixm4k2S1nosX5JaMYIEbq6bKjHB52fludS5TWlBmrb86nJHv4K0ZGuQ6g4I8xJI82jcr6XMQBddlhl0hhVG9Kqq+VwLCwr0jNe/9n3r5CJLt8pvIu6jNzvbXQdVEM1GikK3WTYvD+504fsVM33FsOXtmsx++neSK7D5BRfHFIOVnY5TFcdcbuPJulu5Om64DjRufjY7plOCokSEeTJy+ryzpbKp+Na12gwJxiQF78MNhv69VWkyvn6hTxsRYwpwO0vEx4N+ZbsFeeckjKmp3WgncB/OFPeJaAyVAiYU6rDfIVdjYW0oopLgg51DPO+Nsa9Avhf0FkMB4RAUjJkl9WFBmE1LlqTgsQ0Pjqx8Onhzrhfa/hZ+yT8BWbD0dzMPhazN7Sdl/RoKkhRwXpfPrswyvRy51fI7WmqtogQMJLNBd853NipzUVZHnt0nWCJJ5PbYaMdGj0qZuXCzTEIsS2+ITJmUaZrvVP9BKPR13d7wgROh/LYFk6OfnVWVmQvcTipT5OionXRvNUolzEwbj1VaPDmrYSda6k14Yj34trNZSV/110g9mlS9zwB3F1MLz67NsNxedaR9zLO5ys1d87t+EpIExMSYFIENwdY5ba+MIk1bP+cp/o70F/uxoQzxxH5kzBwwE32h76mQaIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199015)(38100700002)(36756003)(86362001)(4326008)(82960400001)(41300700001)(66556008)(5660300002)(66946007)(478600001)(8936002)(54906003)(8676002)(66476007)(316002)(6916009)(186003)(2906002)(2616005)(1076003)(83380400001)(6486002)(26005)(6506007)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnZFSXhJbVhxbTZrVDZEeklvUnd4dWp6aEpoS20razFGdzdCSW8rNHJqTjBp?=
 =?utf-8?B?am5FV1dDWjd6TzEwZ1pBZ1FpMlJKdUYxbTlTclIwMys3eUM2OVRTS1Nwd0RF?=
 =?utf-8?B?VFJ6bVZ2ZVVtb2xEQzBneEZVQUhxVUowSjlyL0k2VVhyMlZrZmM2cU1ZRVF3?=
 =?utf-8?B?aEFZYmJuTHc0T0t0OTZ5VDJPTVZyalFqYmE4dXpvRUovRjduaVZBRTNhck13?=
 =?utf-8?B?Wk8yZC9vNjhjTnl4ZmZ2U3NJWGVhSHd4SmxMMEh1Um5kTFF2ZVZuUDF6MWZS?=
 =?utf-8?B?N0g1cWdzUTNZR2ZuQUJMSXpNZzcxSzByMS9HRFo3MmphYWN6TTJ1Zjk0VUFy?=
 =?utf-8?B?NXdDcTRzZUplRUhvRWEyeTNFWTJpaEpTRVh3ZmpyT1pGSHVyRlZQM2dVMWVm?=
 =?utf-8?B?NnhrS3NHT0F1SWJRWDFJQU0ydUlPQ3VpcFdzMDQyakk4YkIwODVWMkFnMTdj?=
 =?utf-8?B?TEphUDhsL0xieUlMVVpHdnQrTXlJa0d1WnhBWTdWSDNmOFBianVqNkJ1VWZ0?=
 =?utf-8?B?ZU04MklONGRkODJXT0tnSE5vaS91RW0xRUdoclZHdWdVUGN5bEY0M0pYbFVz?=
 =?utf-8?B?Njh6Z1V3U3NSWGxzZGVBZWdHWThLMmxsLzdUclJrWFMwT3dkbVVPdjF3cC90?=
 =?utf-8?B?WVJJREpDN0R6YkpBbVlvN1diNEJEM29FRkl0MUcxOGUvdnJ3VllORC90T0pG?=
 =?utf-8?B?NlorN2ZucTlWbU5OU2JrWjNmWFdRK2JDZHhyekM5dUtPdUpqNHhFampwY2Fo?=
 =?utf-8?B?UGd1d2tENjhqNHQ3Qmx6VFk2azFRTDc3dU5QNzRFckNVQ2dVdldRQ29vVjFR?=
 =?utf-8?B?SFFNWUNhMjg2OGhPVU1rNVR4WVIzUlR4VE5PWTFsTGNLVDNNbjBmdW5rdklR?=
 =?utf-8?B?aExza2IyQW5TVmZGQnhJWlBHZnRnSUhyY2orWTRDNDNIS2hwU0ErYkhzMFFD?=
 =?utf-8?B?VFBMZWxmSjJOeEliS1hLYzdSdm93L3h2eWdjU0lPdTJ1dDZmZXNrc2RaNFdB?=
 =?utf-8?B?N2dxTGZyWEdmNkVZMVpUY0dDbUlVZ1pUMkZnN0tScThUYUdWOUJVRUFzaVdU?=
 =?utf-8?B?aHF1QU1nQXJoOWNTd09JM3hsdFBIKzJZZzhQRG1RY3RNdWtZeEE5K1ZGQ05K?=
 =?utf-8?B?NzEyN0l2NVBaMTAxajlQSnJvRFNGaFJURVRycU43QUUrQi81MnF5RytURXVX?=
 =?utf-8?B?dkYzak9zT1JIdU42QVdNZnF2dFZNQTAwMFdHUkk3QmtEVFo1RUlzcWpnVkJO?=
 =?utf-8?B?MFNFWjNvd3FRc094OUl3Y3UxWUFZckFDRHl3NFY3TTdid04raTJDL0hYWW01?=
 =?utf-8?B?cG8rUDQ3VktUWWlJVEkwYXV2dTBPMHVhYzFJazEzRDk4eHFSK20yQzhwcTVz?=
 =?utf-8?B?b000U01PNnR2OWRvckRRUGszMjdMODlsQXFva3FLalFsSHpsOWF5OWp1NjV3?=
 =?utf-8?B?Mjl2OFZQUStNL2VVS09Rb3huZFlHV3pWUGJxMHNkQVB5cncwMGE0dlBIOW5W?=
 =?utf-8?B?YndCd1RNQ2V4OHJ0dVJoUEJXNzdkWXBBbDd3TXNWbXBSQThTSWpBc3pyZTJP?=
 =?utf-8?B?YWlvYzF6RnRnTWVGYzBoMUVwVjNieE0zcU0wR0pzZzJNdTZHQ3E2ZEVqbDlO?=
 =?utf-8?B?djEwc3JjN29vU2pLaW1VVEd3OSs1cjU2MlpERVpuUWFRU0F0TXpTUjgwbi9u?=
 =?utf-8?B?UVpmeXNPNklLQ0FuaGFTVG4yT2JsNlI5S292QlFGZ0RqMFFwdndyTHNzZzk3?=
 =?utf-8?B?SE9EWHArM296MVVuU2taOERrekREMTd3TUd2aE15TnRwUEdDdTFSR1c3WlhM?=
 =?utf-8?B?YnRIU1BlTm9EcEl6SUtPczBkQWZ4T1paV0lHcUhnVnFHUnFDd3RhZUpYNUE3?=
 =?utf-8?B?Znc5SHNnRk5Pb3lzOXFZdE9ScWY3NHJ2a0pWU2lpT3grSCtIZ2xrVjNIZ3Fu?=
 =?utf-8?B?eW40MVlXdTBTajNzTmo0YjBDVGM4WG8wSUgvclFsaUptRzd5ZGVEa1UzTlpG?=
 =?utf-8?B?SmdrSi9tdGpqWTdBNkpuNDdySW5JVkJ0NCtBckZFMWJ2Z2liYjFjN21EYjZV?=
 =?utf-8?B?ajM5L3lDWmxEbmZaZUI4T2VtdDRRZXhMY3VVclREeXNocU4vVnNtbkc0Vmpm?=
 =?utf-8?B?aFFUNnE2dGtNVUxGdXpJdGZhbk9MWnVkYTVHRGdhU1ZWRkhKeW5xdU0xV00x?=
 =?utf-8?B?bVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9255d589-4c0c-4c5c-d308-08dabe803606
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 16:18:29.9885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJLhJzBLc1LdqKKoZR9IAOfNWZOuDSH2E+4w+m7gucqiaaFQRVdiGKc9BZxZDskGuGXLs/gwHRe9+so3OiGTGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6609

The current reporting of the hardware assisted APIC options is done by
checking "virtualize APIC accesses" which is not very helpful, as that
feature doesn't avoid a vmexit, instead it does provide some help in
order to detect APIC MMIO accesses in vmexit processing.

Repurpose the current reporting of xAPIC assistance to instead report
such feature as present when there's support for "TPR shadow" and
"APIC register virtualization" because in that case some xAPIC MMIO
register accesses are handled directly by the hardware, without
requiring a vmexit.

For symetry also change assisted x2APIC reporting to require
"virtualize x2APIC mode" and "APIC register virtualization", dropping
the option to also be reported when "virtual interrupt delivery" is
available.  Presence of the "virtual interrupt delivery" feature will
be reported using a different option.

Fixes: 2ce11ce249 ('x86/HVM: allow per-domain usage of hardware virtualized APIC')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I find the logic in vmx_vlapic_msr_changed() hard to follow, but I
don't want to rewrite the function logic at this point.
---
Changes since v1:
 - Fix Viridian MSR tip conditions.
---
 xen/arch/x86/hvm/viridian/viridian.c |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c          |  8 ++++----
 xen/arch/x86/hvm/vmx/vmx.c           | 25 ++++++++++++++++++-------
 xen/arch/x86/traps.c                 |  4 +---
 4 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 25dca93e8b..44eb3d0519 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -197,7 +197,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
         res->a = CPUID4A_RELAX_TIMER_INT;
         if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
             res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
-        if ( !cpu_has_vmx_apic_reg_virt )
+        if ( !has_assisted_xapic(d) )
             res->a |= CPUID4A_MSR_BASED_APIC;
         if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
             res->a |= CPUID4A_SYNTHETIC_CLUSTER_IPI;
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index a1aca1ec04..7bb96e1a8e 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1136,7 +1136,7 @@ static int construct_vmcs(struct vcpu *v)
 
     if ( !has_assisted_xapic(d) )
         v->arch.hvm.vmx.secondary_exec_control &=
-            ~SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
+            ~SECONDARY_EXEC_APIC_REGISTER_VIRT;
 
     if ( cpu_has_vmx_secondary_exec_control )
         __vmwrite(SECONDARY_VM_EXEC_CONTROL,
@@ -2156,10 +2156,10 @@ int __init vmx_vmcs_init(void)
     if ( !ret )
     {
         /* Check whether hardware supports accelerated xapic and x2apic. */
-        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
+        assisted_xapic_available = cpu_has_vmx_tpr_shadow &&
+                                   cpu_has_vmx_apic_reg_virt;
         assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
-                                    (cpu_has_vmx_apic_reg_virt ||
-                                     cpu_has_vmx_virtual_intr_delivery);
+                                    cpu_has_vmx_apic_reg_virt;
         register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
     }
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index e624b415c9..bf0fe3355c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3405,25 +3405,29 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
 
 void vmx_vlapic_msr_changed(struct vcpu *v)
 {
+    bool virtualize_x2apic_mode = has_assisted_x2apic(v->domain) ||
+                                  (cpu_has_vmx_virtualize_x2apic_mode &&
+                                   cpu_has_vmx_virtual_intr_delivery);
     struct vlapic *vlapic = vcpu_vlapic(v);
     unsigned int msr;
 
-    if ( !has_assisted_xapic(v->domain) &&
-         !has_assisted_x2apic(v->domain) )
+    if ( !cpu_has_vmx_virtualize_apic_accesses &&
+         !virtualize_x2apic_mode )
         return;
 
     vmx_vmcs_enter(v);
     v->arch.hvm.vmx.secondary_exec_control &=
         ~(SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
-          SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE);
+          SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE |
+          SECONDARY_EXEC_APIC_REGISTER_VIRT);
     if ( !vlapic_hw_disabled(vlapic) &&
          (vlapic_base_address(vlapic) == APIC_DEFAULT_PHYS_BASE) )
     {
-        if ( has_assisted_x2apic(v->domain) && vlapic_x2apic_mode(vlapic) )
+        if ( virtualize_x2apic_mode && vlapic_x2apic_mode(vlapic) )
         {
             v->arch.hvm.vmx.secondary_exec_control |=
                 SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE;
-            if ( cpu_has_vmx_apic_reg_virt )
+            if ( has_assisted_x2apic(v->domain) )
             {
                 for ( msr = MSR_X2APIC_FIRST;
                       msr <= MSR_X2APIC_LAST; msr++ )
@@ -3432,6 +3436,10 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
                 vmx_set_msr_intercept(v, MSR_X2APIC_PPR, VMX_MSR_R);
                 vmx_set_msr_intercept(v, MSR_X2APIC_TMICT, VMX_MSR_R);
                 vmx_set_msr_intercept(v, MSR_X2APIC_TMCCT, VMX_MSR_R);
+
+                v->arch.hvm.vmx.secondary_exec_control |=
+                    SECONDARY_EXEC_APIC_REGISTER_VIRT;
+
             }
             if ( cpu_has_vmx_virtual_intr_delivery )
             {
@@ -3440,9 +3448,12 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
                 vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
             }
         }
-        else if ( has_assisted_xapic(v->domain) )
+        else if ( vlapic_xapic_mode(vlapic) )
             v->arch.hvm.vmx.secondary_exec_control |=
-                SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
+                (cpu_has_vmx_virtualize_apic_accesses ?
+                    SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES : 0) |
+                (has_assisted_xapic(v->domain) ?
+                    SECONDARY_EXEC_APIC_REGISTER_VIRT : 0);
     }
     if ( !(v->arch.hvm.vmx.secondary_exec_control &
            SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE) )
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 7207390118..5c0aabe8a3 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1124,8 +1124,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         if ( !is_hvm_domain(d) || subleaf != 0 )
             break;
 
-        if ( cpu_has_vmx_apic_reg_virt &&
-             has_assisted_xapic(d) )
+        if ( has_assisted_xapic(d) )
             res->a |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
 
         /*
@@ -1135,7 +1134,6 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
          * vmx_vlapic_msr_changed()).
          */
         if ( has_assisted_x2apic(d) &&
-             cpu_has_vmx_apic_reg_virt &&
              cpu_has_vmx_virtual_intr_delivery )
             res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
 
-- 
2.37.3


