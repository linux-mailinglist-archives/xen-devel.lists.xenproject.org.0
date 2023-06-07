Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB9F72619A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 15:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544802.850817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6tVF-0000lD-GP; Wed, 07 Jun 2023 13:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544802.850817; Wed, 07 Jun 2023 13:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6tVF-0000hs-D9; Wed, 07 Jun 2023 13:47:09 +0000
Received: by outflank-mailman (input) for mailman id 544802;
 Wed, 07 Jun 2023 13:47:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVY=B3=citrix.com=prvs=5155b7726=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6tVE-0000hm-6Y
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 13:47:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9733dc5-0539-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 15:47:06 +0200 (CEST)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 09:46:57 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6459.namprd03.prod.outlook.com (2603:10b6:303:122::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 13:46:55 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Wed, 7 Jun 2023
 13:46:55 +0000
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
X-Inumbo-ID: c9733dc5-0539-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686145626;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=846YRDLuaXpMFnIsm3THLtgrWWRRlYqy8JLQRH1S3Ws=;
  b=RVnMOnk6zmePb9/MvAPKLovaiTfOAcH/V4sCKWfIm+QmAmrn8c30e1kC
   tEhGPP9+Y4jKX7d131NTHgC1m9vX0ZCZVBV2YLPA4F/8hXWgBXVqM6AF1
   zHtYEuaNoV4Ehe1HKpqtS+psLhKRi6Acfpgy2ipibCX6j5CSFQf5XqfhF
   0=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 111241108
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4+gf566WyKD9TUvV3IcowQxRtB7GchMFZxGqfqrLsTDasY5as4F+v
 jYfDzqHPv+LMzemKtByPI6/9x4H68Tdn4BnGQU+qSoxHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4T4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 OMlEmFVcwC4qc2M4PGEdfFv2/wiM5y+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOWF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHqhBNtLTO3QGvhCmFaNmkcxUUUsZwWk/Of6r2OjUOlFJ
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9URX5NkcHbC4ACAcAvd/qpdhrigqVF44+VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTygbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:bt6Oi6/CM0CuhTiuDvduk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: 9a23:hxFeJ2+2nXc8RSkU836Vv1MLJ/p0KmDN91n/GW/7NllxS+CtSEDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AvoNsFgy8LWvgACflh7MwimdCroWaqLylFhwms8x?=
 =?us-ascii?q?egfvaKnFueBKwkT+MWIByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,224,1681185600"; 
   d="scan'208";a="111241108"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGasqRTTFZ7FReM87rQowZ97S63kExs8z1ONHX/GpliuvPvNFd0J2fZDddUkb+NcHvVznLcASfij3i5OWe63mxF38voOnoNOsyEmikHxrbntc2Fp4AKtpU1di36SgtTVE/wYvfPbKmAXpHQ2Y3EMMZYyGX2HMtMmiMI/qDD9OGSts0fbE6lrA7tUdhg0MYeQc+/VcCeyQ0isqJrHZoDE4jtH4By/PqcjvfLJdfy1YsYs1cL+0zx8J9/LC4yEEVoh+5lt2zJzrKNLZPLvYYMCcNJZAIXxNajTc8xYhY7WGflA8ocK/YBT1hIrvi1W+IJe5mJ72GQwCgjPxrn8w2633w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RS1NMkxzqfv1+nm1W4arEpqF7PXRDdlJ5L3ySeizlsM=;
 b=UIzi9qz1gGTHZ70oMy+uNfLPXzzYXj3Qcd+jGiRaryOafOM6l4ExJWCqP8zNVzQOLjKAigPotHSxf1xsDwIKhrFns4FWful/Jak0ejrfXr2gGHlgWx/oVZUrPP6Cvd/ZO9TooJsY14mGzKL5HbE5LDSubU3KR+DgRPgazU4aBRBrsdzDrl4YFUxCvtbte9mb90DcmBLZ37A0BR93PO5ZX1SeUqyGPy9KJZQ8m7dNr+2cAhlGmCIeZeGbC8qTxLcWI7PQdX5M88yn+8NlVXMH/39wdT1Q+2aY66BPekE3xj9nKusKf3/8z0BF1xsYAVjm5hyQBySPSGtLck1M7z/oEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RS1NMkxzqfv1+nm1W4arEpqF7PXRDdlJ5L3ySeizlsM=;
 b=SrutX3I30OYg3p2JFs97XTPdANANobAHfmdIHCC2QxZf51GEESsp3sjwDhmmX2dpENNsTG/fVu6MTMikVRQKvvWvp+2Xa6znsP65bAyHVqIgpQcI9Ey3q4qsxB4BRZXA08F267RPqac0jBPlKrnzD5hmObij6OZkJO8fQb0sAeo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hvm: print valid CR4 bits in case of error
Date: Wed,  7 Jun 2023 15:46:38 +0200
Message-Id: <20230607134638.53070-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0069.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::33) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: bab2da2d-7fe2-4761-e57e-08db675da7d0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4f7YWOersrtml+B6YrmgUnbCalDqd94QXZcrswBJod9JqvwTcUFY7PvU0THl9XW4CuRTMhdNy78rMvAMS4eKQGzexmEVFqbXno78gQNVd+QUfOwLGKpCin+144J7wQYyarrnxsDBHJSzD0VZAKLAp3V3uXVolrHC/KvGIF2HnHPsTsX0lt1aiDu+i7x4jkzjoahZf0HVAlzO47elDq+c99T9UJs8eCI3Gj9QrT/nv1OWz+78L4GbAZRAS56h2lH6OeXwl1oHCnqzQ9Qoir0lRCoFCrXN0/S0JuDbKquae4XztvksCXIG0USxGH3yqOnRq6wLb+KQlJQHMrofmmmHv/ToV0SR8neOcZH/9F9IcL05wrkEhfs2Sj6cshQhjlXvmVIc9Y0oQ6PH4uS+Dq6l22+0TIMGfd0tkuhNhJ7M8se9xJU6MMrTkxsGRoA48YSEXP6zB+jFWo+gWke3E8PXS8tZ7A3UpkrNI3NLrocEFsyGtttW0QrNsZkOcKoEKd7clhgrA82QNNxkDh+fM0KIJYR8xQBGa1JRVvZZEn5t0IzlBkn6WPtxGjJfIMVsqjPq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(86362001)(83380400001)(54906003)(4326008)(66476007)(6916009)(38100700002)(66946007)(6666004)(66556008)(6486002)(478600001)(2906002)(36756003)(186003)(2616005)(5660300002)(8936002)(41300700001)(8676002)(316002)(82960400001)(26005)(1076003)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE1XWHdlVk9zdlpuOHdBc2FjMFFvUnc3QWFTdEYvYU9qV3ZSYjNCcGVMdWts?=
 =?utf-8?B?aTFJTUk1RCtaRGpacHRleWpsUjVaRWR2UjJHUHJlTWF1eFZsTVg1d3NWU0xy?=
 =?utf-8?B?N2d5Q1BEbXd6MjhOQXNRKzVMK3kvYjFqL2lNSkxLNWp1blFQTnlHS3ZaQXEy?=
 =?utf-8?B?WW1EeHZ0TS9jYUFtRXNWSXRObzAxVTR0YWRzMHcvTUppdHQ2VnJtakJ3bWM5?=
 =?utf-8?B?MjJoM3ovNXlmaFFDblBoQXEzZFUxbmQ3ZS9qR3JVYjU1RThVZmVOdFRWMTUz?=
 =?utf-8?B?QjRnUXhoYVBEb3kzelgyQ2JzTlZEeDA1RW81YmpHTFJaNTcrQm4wMVQ5TWMr?=
 =?utf-8?B?eks5cU1IcDk5S1FBVWxpc3hoamhtUW1icnB6bHZkRWtreGorV3NZNnFDL1p4?=
 =?utf-8?B?NjBlZTkzRGNkT2x4aGxqMDhNcFVhM1liamsvMTZ0UFI5TXlnN1doME8yM1hI?=
 =?utf-8?B?cVhpd0UzNk9VbkhOa3Q3cDNLUEJJRXJhQTFtNWc4c0J1V1JxME9zbmo3V1BV?=
 =?utf-8?B?SEZERGdHNUVqWFhnU3prcGJ5SVd5ZDV4V3JEeUk1Qlo0dlRJNXU5cVJUOWo5?=
 =?utf-8?B?TkMzdklsamN1cmYvV1JURmpNVzNjb3BQTzhwVW1qRmFJeklzOEFRRHd2RmtC?=
 =?utf-8?B?NjZFOWJyaFZrTUZGaHBaTTQvdlBUanVwVTRmbHBka0J6ejc5Mm5Vdkk2ektJ?=
 =?utf-8?B?UTNuSEhmWWR3ZjNVbVZlQ3p5V09Ea2MrVndDWkhlMXJXbHVuNDdZdlFiQXQw?=
 =?utf-8?B?T0NvWE00MHcvUzNkOWZPTEJHbVA3bzA1VmJFNXZoUWlCamU4bUI3YWp3b1dK?=
 =?utf-8?B?b0Y1dWFlczMvQUR5Z1VETFlsUUpIQUYrQkpwTlNaanRLOXFqc0VrRTdJMEdR?=
 =?utf-8?B?NlZTeHc3L0Nwek9VbzRoZkNuYkNST05zKzlOc2ovZnEySzhoc21xV0s0d3hP?=
 =?utf-8?B?RTczY1Zjc05RUmtzRkV5akN2enhZenUvL2hUczdVR2lxSm5RYWlQTXFrTGVu?=
 =?utf-8?B?Z0xBVG1ob0s1M2x5ODc3elI5M0NDdGg5M2FVdlNDc0JXaU9qRWFtZEhKWFNq?=
 =?utf-8?B?MytrRkFjak84YkxHRGVOWUtEby9NZGNpVWxoaGV5NXI0bFhrbmhDT04rRktn?=
 =?utf-8?B?T3ZVb3pZb2hxRHBJSG9NaDhQbElsVnBERk1TcE14UDJaeG5ucW1qM2doMlJn?=
 =?utf-8?B?VU5mQWZYRE5xbE9sdmNIRGRRdU1XcTRDS0xjYlFtMUVMaDBZaklhK3YxSm9X?=
 =?utf-8?B?TDZ3NU5CSlY1R3ZWdEhEY1pKMVVxbU9sU000WEpwSVFkS2FpZCsvVGxLMjdz?=
 =?utf-8?B?SVM3QlFEaDRKQVJZTnNUazZtY2NIRTFiSEVUNmxVRFZFQzBUNFM4RHlmb3RQ?=
 =?utf-8?B?dDhPcVhDNWRQUmNSemVDaVl6cXl3VEVxWXVQckdraXIxek5uR2U4bmxsekdB?=
 =?utf-8?B?T1UyTEZUVFBPZEQ4bFVKdzVub2FCM1JyTmVvMFZJc05sZjVkazc4TlNWMUJw?=
 =?utf-8?B?aWJUSGxMOTFyT2lwYkxPT3FOdWJLR1pEQ29ic1l0SmxyeXo1dnJTTUFiZ2Y3?=
 =?utf-8?B?Nmd5TENJOS95OVVoWXlLYTBFR3VSeHVibXJPVElCYnMrVHV0V0JnSHBsaE0v?=
 =?utf-8?B?YWtvYTBZUXBocGZhNkFLSVlmSlBWcVZFM25ORWJEWnVzMjZuaUNENytUYncr?=
 =?utf-8?B?V1JudC8zeUp3c3BESjZud3ZxcGRWaVBDV1VRR3p0aW42VDVrbThYSjVHTUIx?=
 =?utf-8?B?bVRUZjdVUk41Tnh5YUh5R2NxYjF6RHdhb0YrZXJTUnBXWWxrUjVBRlRackdU?=
 =?utf-8?B?bGh2MzdDZ2o3azZmeWZoQkJrZnYxeUgxMFNkVWdJR3liQXhteEc0aU1Lb04r?=
 =?utf-8?B?cjhxcm5PanUyTUF2d3Ywa2RvdWJzS2lJdzlKdG05WFdXazJSbUFFWFQyUWZW?=
 =?utf-8?B?L2g3VGYxMHpLZ3ExOWhqTnlvNnFoWmhwODdWM3hFTWFRZjFGRFNZeHlHS1Rv?=
 =?utf-8?B?QUd1ZjYrN25XeGI2eE0yWllFdjduNSs3aE44Mm5FZWZLTTQxWituTW8reGJk?=
 =?utf-8?B?MEd2K2lYajRNT3JsTko0eTNQRUxwT2xaYUhzMEJReVUxU3RhdDRRMzVNVzZM?=
 =?utf-8?B?a1NrU3MxTE1EeVlkOEhMa1VRUVBpSjBQMVI0MW1lOWV6RkJzallEa3hqbkox?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xlIlmN2IDGPWdibjTeZLuwTFBFUw4M0BWWKB/IIqXnqOp1iq8j13QcRjoHwEXpaR/nvEK8dHQcQSlrwwVdAhWs8xsV23q0gieFK4EtFVAJ5Ghm6SNfK0T6dpCLHmyG9xOAvwHAkm3Pkct8aaelZWROdpvm6Tm7Eb+YmeboUdfSzaeVAv9K/BlIgwvP+VghymD98oXwQ8v0IxDCMJNyN8eTwYdUc1zIW4KifFGAfBXYaxkQVtGiaB9A/r9fYW8yrCfCnq55hQRsQUJIA7MEPKatJSVElxCoQ4GGGmayWHdXocyd2Od/1Kc1rttdXXvJj5cL1dGlFJjMNzZkTLama2QLkb8RAFax3aLM7hB5eLO0SJx74pR8fr4dIsKpVytVWW2cu416T/0x+sw5zF6QplTr4FIPQI9QFIeP017PcXdsD5lQJnOKKibL5Pbwmpjf4YGZPg4Fh7sz0YUPO6Q2f66KfIUkyAsZZr39D/edcF02y3EuPKRgw6yz72bBcONz2dGfSAVCCb6bnoGjLOdSSPr44cHFQCfoGlyiU4O8Tyu3zAJ94O2J8USwjPGPVdLXVdhtFZJRsDZdvbSZgrAbEx7mEqPJYoqXsDFJTTXVkSKUKUvYYU1gkwwU1O26pYrFylnoBajynGQLOCEOqF9dUI3UIC0aXdRFyZ9B2rTVwEZnjr8wex+7jXVkAgL052xP4OfJVC8Gbn4PvrE6kqDjpkgXErCMNq73eGDjH6vSN5Ink9de1e8zz69Utc+ociARrxpscYkpodSq+sCrGousPm07x1M5dEO4qUK9yMguv3FrW9iLiH6ku4YQNsO5HyGu59
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab2da2d-7fe2-4761-e57e-08db675da7d0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 13:46:55.0471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bta85j0X7e3y0nLFqxwiItdQnoy+64DNeMXzM5xN/e9eaS79xBR5RStqZSAxmck6sV5obuULnKx5yZRdNel0OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6459

Some of the current users of hvm_cr4_guest_valid_bits() to check
whether a CR4 value is correct don't print the valid mask, and thus
the resulting error messages are not as helpful as they could be.

Amend callers to always print the value of hvm_cr4_guest_valid_bits(),
and take the opportunity of also adjusting all the users to use the
same print formatter.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/domain.c       | 4 ++--
 xen/arch/x86/hvm/hvm.c          | 8 ++++----
 xen/arch/x86/hvm/svm/svmdebug.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index deec74fdb4f5..8951230a9f52 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -266,8 +266,8 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
 
     if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d) )
     {
-        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx\n",
-                v->arch.hvm.guest_cr[4]);
+        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx (valid: %016lx)\n",
+                v->arch.hvm.guest_cr[4], hvm_cr4_guest_valid_bits(d));
         return -EINVAL;
     }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2d6e4bb9c682..f27be2cefc0b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1018,8 +1018,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
 
     if ( ctxt.cr4 & ~hvm_cr4_guest_valid_bits(d) )
     {
-        printk(XENLOG_G_ERR "HVM%d restore: bad CR4 %#" PRIx64 "\n",
-               d->domain_id, ctxt.cr4);
+        printk(XENLOG_G_ERR "HVM%d restore: bad CR4 %#016lx (valid: %016lx)\n",
+               d->domain_id, ctxt.cr4, hvm_cr4_guest_valid_bits(d));
         return -EINVAL;
     }
 
@@ -2461,8 +2461,8 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
     if ( value & ~hvm_cr4_guest_valid_bits(v->domain) )
     {
         HVM_DBG_LOG(DBG_LEVEL_1,
-                    "Guest attempts to set reserved bit in CR4: %lx",
-                    value);
+                    "Guest attempts to set reserved bit in CR4: %#016lx (valid: %#016lx)",
+                    value, hvm_cr4_guest_valid_bits(v->domain));
         return X86EMUL_EXCEPTION;
     }
 
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index 7d6dc9ef47db..df5da29f8fb3 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -124,7 +124,7 @@ bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
 
     valid = hvm_cr4_guest_valid_bits(v->domain);
     if ( cr4 & ~valid )
-        PRINTF("CR4: invalid bits are set (%#"PRIx64", valid: %#"PRIx64")\n",
+        PRINTF("CR4: invalid bits are set (%#016lx, valid: %#016lx)\n",
                cr4, valid);
 
     if ( vmcb_get_dr6(vmcb) >> 32 )
-- 
2.40.0


