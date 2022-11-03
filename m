Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3BB6185A7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 18:03:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436939.691203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdcl-0001DA-Dj; Thu, 03 Nov 2022 17:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436939.691203; Thu, 03 Nov 2022 17:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdcl-0001AZ-9I; Thu, 03 Nov 2022 17:03:27 +0000
Received: by outflank-mailman (input) for mailman id 436939;
 Thu, 03 Nov 2022 17:03:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OB6F=3D=citrix.com=prvs=299187ae8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqdck-00019m-Dg
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 17:03:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c6b910b-5b99-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 18:03:24 +0100 (CET)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Nov 2022 13:03:10 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5312.namprd03.prod.outlook.com (2603:10b6:208:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 17:03:07 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%5]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 17:03:07 +0000
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
X-Inumbo-ID: 6c6b910b-5b99-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667495004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Qtv7Cj22TjoQNgd8JyviLQaV2AH3o8KFjKIzwfUD6sU=;
  b=Pc/G3C09GUE5Itx0InR43597E0yS/2Pp153JnaQ2NjbGPqgHYMVD0XZb
   HVRdibriix/cTMmeITpFLRMN8TnbRcfWl/QvDYsVxUcqLLskW9K4owrk4
   7tCd6VWcX2mOmIFth3LIxUm9vPjnCGvVwJSub42DXtkfTwUkyay5qW5jN
   w=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 83721395
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XrTu5K5VjjaZiGc7+ZXN7gxRtOPGchMFZxGqfqrLsTDasY5as4F+v
 jNLCG3TPfiOY2v8KY9xO463800HsMDdm4I1GQdv/y5hHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkT5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 +0eEhJUdw+5oOek5YuYYLhhmuE9M5y+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+aF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efxnyhAdlDSdVU8NZIoW/NymUvOSdVREK9p//lrGKXRNJQf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2JWXQ3+A8rafrRupJDMYa2QFYEcsTxYB4tTliJE+iFTIVNkLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1U/DqyKhoN7OVAFd2+nMdmes7wc8boj1YYWtsALf9awZc9jfSUSdt
 n8ZncTY9PoJEZyGiC2KRqMKAa2t4PGGdjbbhDaDAqUcythkwFb7Fag43d20DB4B3hosEdMxX
 HLuhA==
IronPort-HdrOrdr: A9a23:8KLP6aOvFT4YtcBcT1r155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBDpTnmAtj7fZq8z+8P3WB1B9uftWbdyQ+Vxe1ZjbcKhgeQYhEWldQtqp
 uIDZIOb+EYZGIS5aia3OD7KadZ/DDuytHVuQ609QYJcegFUdAC0+8vYTzrb3GeCTM2c6YRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoILSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwzqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0G7Q8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnJ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvsX+9KK1wUh4S1bpXUd
 WHVKrnlbZrmBKhHjrkV1BUsZORti9ZJGbEfqAA0vbloQS+0koJjXfw//Zv7kvoxKhNNaWs2N
 60Q5iA7Is+KPP+TZgNcNvpEvHHfVDlcFbrDF+4B2jBOeUuB0/twqSHk4ndotvaM6A18A==
X-IronPort-AV: E=Sophos;i="5.96,134,1665460800"; 
   d="scan'208";a="83721395"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKR+D5q+wSrXQ/2MeJsnaC79F7hf5REi8lRrQxe0wSWHEYqabe61/kE/ycuGoRC8hpIorkiRuHR6hX0hIxXoWYgUcjLFYd31Akqb4W16oS/r+b85K9AKLwiPA/RWHK36MM6zs78HJDEnEly0MkgZkBi5QvC/Thn+J+bS1A8fGCDDvcSMi2eJVS5DEr8v/HvtTUCbkK2hleEE/zb0HZvUbmJlZVbsrFvoduz+HWirp/JAf1xKyjBwOoiklPAfZ1XIy8U+5zLmc+Hrv2MTzig/iNPrrYfN4ogsxcPudWdoe7GW7i+d6hphB+j+Uj1IdqkmyiA+Dyr6kMdgr9QL5Lg9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N41NuLnpI1Kxzwq/zU/F9XdrxfEQCxO44x4XXoUhJ0M=;
 b=ZfeL4lIY62sm5RW+b02jWr2uqi4V+8PR7+MUzfddX2Kpm51ngghTopSGyoDjVCvLZPF/ZlIfOHe9Zk7thNTeWOWD+QxF+f2c637uDtpDufXinCkkKuYng2MQhQmViBzdKBkxBGC0w444B8IYaSfu6CWCBSqg1V58redUw3R3gUZEwNP0eRfhzb8w8sOCt6qVnEVDbtbC/IBDsVUcTkmHvB5ksO4aF5KfUUhP9XZCamzpharg2cnm84bq1G4ZHKbpM84Hc/iSZompI5svTB6cVYfMw1PGy6JSLyuCPwqWf2nxbmq9KB/5OfVZs0F2wK/xWzbJEDrKT4DI1hbIkSfAsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N41NuLnpI1Kxzwq/zU/F9XdrxfEQCxO44x4XXoUhJ0M=;
 b=wskhWr6i1QScDxcmSGHohvsdM+EhUHRiWHg6nbesI1pqDumg4jHUTEvJ21wCQ/4SBGLIcp7g9vi758+SRDdjz9Pnq698gcQPsY9I28GXdLB1RUbA5RDmUCy4h/MrobjIK60iBKfTyYUybTcbQesAr4iNSXd4DcpDYjZ7KY7+jTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 v3 1/2] amd/virt_ssbd: set SSBD at vCPU context switch
Date: Thu,  3 Nov 2022 18:02:43 +0100
Message-Id: <20221103170244.29270-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103170244.29270-1-roger.pau@citrix.com>
References: <20221103170244.29270-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0517.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: a44c8acd-98bb-4566-752c-08dabdbd476c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uL5FVBOVAnNlZy3DswuFDofwp8RamILugc5Kpt1dMhoEkYPDFJYXXXcNlsrOL8yFlJd9HopLOP6kfWfVO64AW8OWFvgwSdh/Uc3rImbHSGJG+M4PtGEUK59FeBkmnufmQhjv0kTTKXeWRnNHxUls3qbL+/gLqeUC+zqKKA1OSN2PGhPLukxp92YtTzCK85m4Jgaujlz0CN1iPHpAqvFyDeJyUN6oe4qWlmWTNgFPXreS32LSC8tKB2aZA4INhYDOoryCgK4pWISxNZeUjODXQMBp8OuRlGTSuq6hNM/qqn4S5RCJlCBnDa1pn6s48jmFMShR/Zztvx5Ve2GbGOvV5itsfp+L7mT6URqNA+iIWxAbfKrAFIaC+4XOkD4YAyGkqNchxzxNn5InYRtLURQXywdbd0c+BubZIiCbPcxIPjUB3rh3qjxuI+vOFfz1e+Jx8xodpsYha7CUA5d53cRnb5DoGrOrF1a1JcxaQ3DV+REcX5QaVQScMu4gytHyxIfvDe9i/agvbYX/c5IguhAgmSGW4YT2AH3tXNtiDAFbVODeNbFZS2TNGKq1aiL2UO7K+vZkx9/sqEMgG60/Yz7Daxhqpkj9Sj9pgj/tJKWa3DdGKRylq2YP3nT8eES92QDmfXZ8TddGV1FSWdkwcuVTgmu6QLeQpu5GC8TUGFiSpJnIA2xfy6lGDVeZNcrg+JKdmS9z0Pc466P+mghN6FT2zQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199015)(36756003)(5660300002)(86362001)(4326008)(6916009)(82960400001)(38100700002)(316002)(54906003)(8676002)(186003)(1076003)(66946007)(8936002)(83380400001)(6512007)(2616005)(2906002)(478600001)(6666004)(41300700001)(6486002)(26005)(6506007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFRCckt2cW5ZWkJyQWpnRndLajhqWkNtNGZHNXdoMDNGUXpZV2xaaUNPMGow?=
 =?utf-8?B?cnlwUVdxR0IwSjhHdmUxQU5mK1F0TWh4azNRK0t2dEV0SlF4U3lwTGEyTmlQ?=
 =?utf-8?B?RFJLODJpbjBJREtSNlZGbUhiWm50VGRtQStuOS9JK3dZZS9XVEFKYVRKOVJB?=
 =?utf-8?B?Q2NkUHZ2MDNoTjdaanFia0pkdXAweWJGaWtjeGpVdzArV0FxQlVocWlPM3FH?=
 =?utf-8?B?NjRiMmpDUzNvek5sYTdlSFNxcUJkajhUV3FyNTNmdlovaVBmR3ZsT0ZTUW5B?=
 =?utf-8?B?Zmg5NjV0dmt4N0dnc1BCdWwzTXRYNUw5bG15dnhKM2FKbjZvU3pENDFhV1pn?=
 =?utf-8?B?ZVZsd3hLUitHSWZWcXh2eXZOZ1NvRWsraEhJTEkrbmJScnRBTGp1aytNWE83?=
 =?utf-8?B?YUJ1ZVB1TGM1Si9POEluN3UyL0p4V09hTFdFS2ViR0lVdGZXSzVIMnBka2lB?=
 =?utf-8?B?TnVoQm9mKzBVVjQxdXBXUzk2cW9QajExUGhQSmRDWURLTXNtZ0NJWHBsZDlR?=
 =?utf-8?B?aWJxU1RWU3luUDZGdWVDWDdvYjBXRFNHRFpKNTlNeDVlTDVVQVkwR1NXQTVs?=
 =?utf-8?B?S1E0ZzhZZm1ucnpmc0cyYk9IaTRXU3BGRkh2U1NKQ21oNUVkT1UrMmw5UTkr?=
 =?utf-8?B?ckFZZG9RdSswRGlWa2pESG1PUUZON0k2UGc0S0U3UVZPWGlEcDNseEd0SUdm?=
 =?utf-8?B?RndaYXk4TldFNksrczJuRUNpU1FqeVVtZlBEWjJDWmhMRmhuVFdNN2kwWHd1?=
 =?utf-8?B?UUJmN0ZkZmhkQlczZFphWXJTMWl5ZGY3d2s4ZE1iK0NJeU9XcUFMSGt3Q0Zn?=
 =?utf-8?B?dXJkK3g0S3Jvc3duRXNwUXMvSG91VWhwMDBBa0RSbnlBWkJmYnlqeDc2SjIv?=
 =?utf-8?B?WmFBZ1FWQVMrWEpncTlOUEgyQjMwSFJNblQxZVliNkFOdE4zV20vbTRVeEZa?=
 =?utf-8?B?Vzl1ZXhlS0dIZmRSSDBFenFobndRWnhpMXFqRnpNcnBiSFlraXpwWXZjWll3?=
 =?utf-8?B?TkVCU0lwcjNRVFpYSTFUb3lpR1hmamE4UEtaRlJ1dVNBUGJoaGhWa3lvNzJk?=
 =?utf-8?B?ZlNvQUY1RTFmTlllVXk2a1JsbU1vdXRITWw0emRqb1N0Qkl4Vng2NUxWZkE5?=
 =?utf-8?B?VXRDNVpwd0Z6eU5sZGNYc2dCdW16QlFCNUs5NHpZemtvUDQzMFZWSjltdFJw?=
 =?utf-8?B?K1NGUlNTcWdXZzNBa1FXL21YUEQ4Mzhqd1ZVYkJza08wdVF5d214S01STDNV?=
 =?utf-8?B?WjlrSW5tL1pkS2doV3MrVUJ3TmNSYlFEb1hMNFFtSmxQWml3VDdYL0hqbG1N?=
 =?utf-8?B?NjlQQndLTXFNTHViS1Nrblh3S2hjWDZ3ckhlNktQRUJSVDRodXM0UXM3NzJ2?=
 =?utf-8?B?aFFWZE9aY1liSWpqTkljRWk4TDA2TjREbUx2QWJRVWlXRUd6V1dsZUtKdzg3?=
 =?utf-8?B?eXZQNGtjRFZpcVNzK1NjTm8zbmI5eURPbDhCRHNzNmZoVGxRMjFwZkJvZHBN?=
 =?utf-8?B?ZWFOU21aMnhYbU1wYzEybWtzQU13VGtHS1hBckhVempXTlJybVhEVDBCbXZ5?=
 =?utf-8?B?SW40L21XS3pYbndUVjNjT3lJdFdIbk9Dd0xxM0syNUJMU0FTbjFCY2x1T0d2?=
 =?utf-8?B?WFJma3NWcDR5ZGJWRXl3SVFxUkVEdmhXTTRzbzR0Nm9pVHM3cVMwN3J4RzZB?=
 =?utf-8?B?ZXorb0MvTUFiSFZFMnZzMWxxd0Y3VjFzTHpKS3EwZ3Zkb0ZkZW5kRHN6WktL?=
 =?utf-8?B?ZXJuMUNNUWV3ZnZ2R3IwNTVHMlc1ZWhHS3pjRTBrMC9YdjBmcFVrTFhrTDR2?=
 =?utf-8?B?eHE0cFh5WXpTQXpTdVF5YWlXa2N0SWhuY1BRTjFtczAxOGJ5dFN1dHV6ZHlp?=
 =?utf-8?B?UTRmNUJTYVJFaFVKUFRaSFBLWDNzUWROOW9RMmhzVGVXRVA0UTJ3SlJoWmsv?=
 =?utf-8?B?bmxMMXNBbnJtVEZxWTdKTG85OTJKODF0M2diQUsrWS83TTc4OVhISkxySkxi?=
 =?utf-8?B?VUprT2JEVGdaOTFISzJHY1M4VS9qZzRlcFNPd0lYNWZYN3crek5wSVJlRFVj?=
 =?utf-8?B?enMyZWdSbU50cjAzU2pwVTNibGpEckpUaXNGSU5lRC9CcXlJeVpCdkZBNnlH?=
 =?utf-8?Q?MbKDZjFfVcscu5IFKchDtV1gM?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44c8acd-98bb-4566-752c-08dabdbd476c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 17:03:07.2979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hL081M3TxKcbGwi1UZWwZO/iWCb8gS8eVmbnbPt70Np7Nizlmk+r8z95qBKG63/Xs+NjoSWIdUvC+uoFYn1P8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5312

The current logic for AMD SSBD context switches it on every
vm{entry,exit} if the Xen and guest selections don't match.  This is
expensive when not using SPEC_CTRL, and hence should be avoided as
much as possible.

When SSBD is not being set from SPEC_CTRL on AMD don't context switch
at vm{entry,exit} and instead only context switch SSBD when switching
vCPUs.  This has the side effect of running Xen code with the guest
selection of SSBD, the documentation is updated to note this behavior.
Also note that then when `ssbd` is selected on the command line guest
SSBD selection will not have an effect, and the hypervisor will run
with SSBD unconditionally enabled when not using SPEC_CTRL itself.

This fixes an issue with running C code in a GIF=0 region, that's
problematic when using UBSAN or other instrumentation techniques.

As a result of no longer running the code to set SSBD in a GIF=0
region the locking of amd_set_legacy_ssbd() can be done using normal
spinlocks, and some more checks can be added to assure it works as
intended.

Finally it's also worth noticing that since the guest SSBD selection
is no longer set on vmentry the VIRT_SPEC_MSR handling needs to
propagate the value to the hardware as part of handling the wrmsr.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Fix calling set_reg unconditionally.
 - Fix comment.
 - Call amd_set_ssbd() from guest_wrmsr().

Changes since v1:
 - Just check virt_spec_ctrl value != 0 on context switch.
 - Remove stray asm newline.
 - Use val in svm_set_reg().
 - Fix style in amd.c.
 - Do not clear ssbd
---
 docs/misc/xen-command-line.pandoc | 10 +++---
 xen/arch/x86/cpu/amd.c            | 55 +++++++++++++++++--------------
 xen/arch/x86/hvm/svm/entry.S      |  6 ----
 xen/arch/x86/hvm/svm/svm.c        | 45 ++++++++++---------------
 xen/arch/x86/include/asm/amd.h    |  2 +-
 xen/arch/x86/msr.c                |  9 +++++
 6 files changed, 63 insertions(+), 64 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 0fbdcb574f..424b12cfb2 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2372,10 +2372,12 @@ By default, Xen will use STIBP when IBRS is in use (IBRS implies STIBP), and
 when hardware hints recommend using it as a blanket setting.
 
 On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
-option can be used to force or prevent Xen using the feature itself.  On AMD
-hardware, this is a global option applied at boot, and not virtualised for
-guest use.  On Intel hardware, the feature is virtualised for guests,
-independently of Xen's choice of setting.
+option can be used to force or prevent Xen using the feature itself.  The
+feature is virtualised for guests, independently of Xen's choice of setting.
+On AMD hardware, disabling Xen SSBD usage on the command line (`ssbd=0` which
+is the default value) can lead to Xen running with the guest SSBD selection
+depending on hardware support, on the same hardware setting `ssbd=1` will
+result in SSBD always being enabled, regardless of guest choice.
 
 On hardware supporting PSFD (Predictive Store Forwarding Disable), the `psfd=`
 option can be used to force or prevent Xen using the feature itself.  By
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 98c52d0686..05d72c6501 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -742,7 +742,7 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 }
 
 static struct ssbd_ls_cfg {
-    bool locked;
+    spinlock_t lock;
     unsigned int count;
 } __cacheline_aligned *ssbd_ls_cfg;
 static unsigned int __ro_after_init ssbd_max_cores;
@@ -753,7 +753,7 @@ bool __init amd_setup_legacy_ssbd(void)
 	unsigned int i;
 
 	if ((boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
-	    boot_cpu_data.x86_num_siblings <= 1)
+	    boot_cpu_data.x86_num_siblings <= 1 || opt_ssbd)
 		return true;
 
 	/*
@@ -776,46 +776,51 @@ bool __init amd_setup_legacy_ssbd(void)
 	if (!ssbd_ls_cfg)
 		return false;
 
-	if (opt_ssbd)
-		for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
-			/* Set initial state, applies to any (hotplug) CPU. */
-			ssbd_ls_cfg[i].count = boot_cpu_data.x86_num_siblings;
+	for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
+		spin_lock_init(&ssbd_ls_cfg[i].lock);
 
 	return true;
 }
 
-/*
- * Executed from GIF==0 context: avoid using BUG/ASSERT or other functionality
- * that relies on exceptions as those are not expected to run in GIF==0
- * context.
- */
-void amd_set_legacy_ssbd(bool enable)
+static void core_set_legacy_ssbd(bool enable)
 {
 	const struct cpuinfo_x86 *c = &current_cpu_data;
 	struct ssbd_ls_cfg *status;
+	unsigned long flags;
 
 	if ((c->x86 != 0x17 && c->x86 != 0x18) || c->x86_num_siblings <= 1) {
-		set_legacy_ssbd(c, enable);
+		BUG_ON(!set_legacy_ssbd(c, enable));
 		return;
 	}
 
+	BUG_ON(c->phys_proc_id >= AMD_FAM17H_MAX_SOCKETS);
+	BUG_ON(c->cpu_core_id >= ssbd_max_cores);
 	status = &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
 	                      c->cpu_core_id];
 
-	/*
-	 * Open code a very simple spinlock: this function is used with GIF==0
-	 * and different IF values, so would trigger the checklock detector.
-	 * Instead of trying to workaround the detector, use a very simple lock
-	 * implementation: it's better to reduce the amount of code executed
-	 * with GIF==0.
-	 */
-	while (test_and_set_bool(status->locked))
-		cpu_relax();
+	spin_lock_irqsave(&status->lock, flags);
 	status->count += enable ? 1 : -1;
+	ASSERT(status->count <= c->x86_num_siblings);
 	if (enable ? status->count == 1 : !status->count)
-		set_legacy_ssbd(c, enable);
-	barrier();
-	write_atomic(&status->locked, false);
+		BUG_ON(!set_legacy_ssbd(c, enable));
+	spin_unlock_irqrestore(&status->lock, flags);
+}
+
+void amd_set_ssbd(bool enable)
+{
+	if (opt_ssbd)
+		/*
+		 * Ignore attempts to turn off SSBD, it's hardcoded on the
+		 * command line.
+		 */
+		return;
+
+	if (cpu_has_virt_ssbd)
+		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
+	else if (amd_legacy_ssbd)
+		core_set_legacy_ssbd(enable);
+	else
+		ASSERT_UNREACHABLE();
 }
 
 /*
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index a26589aa9a..981cd82e7c 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -59,9 +59,6 @@ __UNLIKELY_END(nsvm_hap)
 
         clgi
 
-        ALTERNATIVE "", STR(call vmentry_virt_spec_ctrl), \
-                        X86_FEATURE_VIRT_SC_MSR_HVM
-
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
@@ -131,9 +128,6 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
-        ALTERNATIVE "", STR(call vmexit_virt_spec_ctrl), \
-                        X86_FEATURE_VIRT_SC_MSR_HVM
-
         /*
          * STGI is executed unconditionally, and is sufficiently serialising
          * to safely resolve any Spectre-v1 concerns in the above logic.
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 1aeaabcb13..8b101d4f27 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
 
     /* Resume use of ISTs now that the host TR is reinstated. */
     enable_each_ist(idt_tables[cpu]);
+
+    /*
+     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
+     * is already cleared by svm_vmexit_spec_ctrl.
+     */
+    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
+    {
+        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
+        amd_set_ssbd(false);
+    }
 }
 
 static void cf_check svm_ctxt_switch_to(struct vcpu *v)
@@ -1000,6 +1010,13 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
+
+    /* Load SSBD if set by the guest. */
+    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
+    {
+        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
+        amd_set_ssbd(true);
+    }
 }
 
 static void noreturn cf_check svm_do_resume(void)
@@ -3116,34 +3133,6 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
-/* Called with GIF=0. */
-void vmexit_virt_spec_ctrl(void)
-{
-    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
-
-    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
-        return;
-
-    if ( cpu_has_virt_ssbd )
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
-    else
-        amd_set_legacy_ssbd(val);
-}
-
-/* Called with GIF=0. */
-void vmentry_virt_spec_ctrl(void)
-{
-    unsigned int val = current->arch.msrs->virt_spec_ctrl.raw;
-
-    if ( val == (opt_ssbd ? SPEC_CTRL_SSBD : 0) )
-        return;
-
-    if ( cpu_has_virt_ssbd )
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
-    else
-        amd_set_legacy_ssbd(val);
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 6a42f68542..81ed71710f 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -153,6 +153,6 @@ void amd_check_disable_c1e(unsigned int port, u8 value);
 
 extern bool amd_legacy_ssbd;
 bool amd_setup_legacy_ssbd(void);
-void amd_set_legacy_ssbd(bool enable);
+void amd_set_ssbd(bool enable);
 
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 95416995a5..5609b71e99 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -24,6 +24,7 @@
 #include <xen/nospec.h>
 #include <xen/sched.h>
 
+#include <asm/amd.h>
 #include <asm/debugreg.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/viridian.h>
@@ -697,7 +698,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
                 msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
         }
         else
+        {
             msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
+            if ( v == curr )
+                /*
+                 * Propagate the value to hardware, as it won't be set on guest
+                 * resume path.
+                 */
+                amd_set_ssbd(val & SPEC_CTRL_SSBD);
+        }
         break;
 
     case MSR_AMD64_DE_CFG:
-- 
2.37.3


