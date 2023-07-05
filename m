Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B46748373
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 13:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559114.873828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH0zO-0001Gb-Kq; Wed, 05 Jul 2023 11:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559114.873828; Wed, 05 Jul 2023 11:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH0zO-0001Dt-Hh; Wed, 05 Jul 2023 11:48:06 +0000
Received: by outflank-mailman (input) for mailman id 559114;
 Wed, 05 Jul 2023 11:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFzj=CX=citrix.com=prvs=5438f3518=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qH0zN-0000ie-0V
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 11:48:05 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc251a14-1b29-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 13:48:03 +0200 (CEST)
Received: from mail-sn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jul 2023 07:47:55 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5718.namprd03.prod.outlook.com (2603:10b6:510:40::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 11:47:52 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 11:47:52 +0000
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
X-Inumbo-ID: cc251a14-1b29-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688557682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Xu8jv7IgkcRUE/FiwP8HIt/7kSmCnukE8JV2qsMCh+U=;
  b=d4sYXYQvwAEsLhSbsOxS2tn9pNWWHxJFsI3xfvgP4qf8odR9HyHeretN
   uzPPG/56cEJMuiQt3TU3YpTVXDLQZ6wnHU7dG1zsX5UxIOUf1M9ZxEBH6
   4O+Y4LBgNYpFzFJUtf1pIywKWcSCcaF+qKl/0MCo9yk3GB5z30USm/dtz
   w=;
X-IronPort-RemoteIP: 104.47.57.41
X-IronPort-MID: 114522350
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VlNw4aMoPTJydinvrR2ClsFynXyQoLVcMsEvi/4bfWQNrUom1DwPn
 zRLDT2BPazYYGaheNkjOYng9hwDuZPQxoQ1SQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5gFmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0qFXPWBUp
 KVDEw4mNjmo2+uTmuieZ9A506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvzG7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqy7x3LWUwHuTtIQ6CuSS7K5B0V2p4EseKEMGTXmfrNeroxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnop4thu3MCkRaHQEPCkNSFNf58G5+N1qyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsjDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:UUBsK6DDTGvUfMDlHeiwsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U8ssQIb6Ki90ci7MDrhHPFOkOws1NuZMjUO/VHYSr2KjrGSiwEIeReOktK1vJ
 0IG8QQNDSzNykcsS+Q2mmF+qMbsbu6GdeT9ITjJhlWLD1CWuVF1UNUGwybGkp5SE1vAoc4Lo
 OV4o5qtietYnMea+W8Hz0gU/LYr9PGuZr6aVpebiRXojWmvHeN0vrXAhKY1hARX3dmxqojy3
 HMl0jU97iuqPayzz7bziv2445NkNXs59NfDIini9QTKB/rlgG0Db4REIGqjXQQmqWC+VwqmN
 7Dr1MLJMJo8U7ceWmzvF/ExxTg+CxG0Q6v9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOisYZNBx+oplWz2zGIbWAlqqOHmwtjrQchtQ0dbWIqUs4RkWVQxjIWLH5KJlOA1GluKp
 gVMCib3ocaTbrSVQGlgkB/hNOrRXg9BRGAXwwLvdGUySFfmDRjw1If39F3pAZ1yHsRceg32w
 3/CNUcqJheCssNKa5tDuYIRsW6TmTLXBLXKWqXZVDqDrsONX7Bo4P+pOxd3pDdRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo5J5prr/Trz2NjDrciFYr+Kw5/EERsHLUf
 e6P5xbR/flMGv1AI5MmxbzXpFDQENuI/H9euxLK25mjvi7VLEC7NarDMo7DICdbgoMSyf4Hm
 YJWiT1KYFJ8l2rSxbD8WnsZ08=
X-Talos-CUID: =?us-ascii?q?9a23=3Aw2wsw2qV0L+dSZYhT1XIa+/mUYcFTnzHnS6LGHG?=
 =?us-ascii?q?TUU9CFLSwEwW11Zoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxMdU5g/7JXmnBulVgDkdHAiQf9kxyb7+IxENq7M?=
 =?us-ascii?q?htunaJTRSHzqznh3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="114522350"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMgcmzMeqEModnRR8JDGobDqehOMzO8wfTltfnqpDjfHkLGh8epc+eLYbenbMeyu0u0Kpomid8TWrTqmOsbish3IBjTT8i4olXw5qP+DCoK9mZs+nk+hqkPfDnwQrfSRJ0VaLs78meqpNMNluuvNYDZSbVIa3xAL1ARCl4zrDlmzAswoDXTDFjOkvQUzzs+4Z3bSbPL6fl7VycYmSTFUNjTi7RQLMAkV9MMgiPBYdzbwWOxzHc6iJi6eHRCxRqDRkAh4GmcJGU0gXdWVDaTf9UU1Lj23oSd8V3kHc6wSRyqOhMevF7m/G7P8nAa8oHREBjt4kp08OxeXdcp9rY/3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5lU6Y2Zp/yt/v9at2Re4kK9dwJ//xaxqBkbP+le2gk=;
 b=VQDZenYool+cDLf0KUZWqtOnuVDn7/moKmanVWchf0tJsiUBX2Niocb4kbc8hoJCyMor44z2oZwtdeVEGARTFC+jbSAJzVe7zNC+MJ00xjq6nGC92jpGMbsR+dCOSaOMY/gGXC8EardceeM3Pr/aEgy8Suwx9+C8IBqUF61RvVMZknMZaPcfybR+7aRHIs6kcfE7qDQxr7Lw4RnFONFK8YAmj+vp8vu/qFHy3HF55Cukmxq7jJfPDsUbNYmgfRycU1fIVmyjlhsYM09jGU6N5ryn7wmNfOjGqQXHAKMsl9W9s0kyznz1yUiDqEfmYYCdWDNY1IB0mN5qCX2RsD3iUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5lU6Y2Zp/yt/v9at2Re4kK9dwJ//xaxqBkbP+le2gk=;
 b=ccMdENAs1t/Wyd3Euul5aS2HftOHFec9vdSsxuEFQElPBB/ngl1ilFojSPpmpEhefGwGUwkSxUbCeZUaFZTnTi3UowwM2wNDVr6MWGZ3U6ZAl/lm69VPnCZh3TAnJ+iYy1Epfa46V7Te7rguiCFZG3suYjIMSD3dcxdlXfwqOsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/3] multiboot2: parse vga= option when setting GOP mode
Date: Wed,  5 Jul 2023 13:47:39 +0200
Message-ID: <20230705114741.11449-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705114741.11449-1-roger.pau@citrix.com>
References: <20230705114741.11449-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0123.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 037a5203-ae00-44d5-8222-08db7d4daa33
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fSQJF7Pv7XKvy0mqJlBezj2HPwqKg7xG12cFrZBdpyDrEf9F+YqdwvuVWvyDa8h//dGoJsTzR5yL2oKigZyGCistKxS3ukE+VwRthlNw1J5FgLClEL0me+3oyOKJFOA66xQqiQwwQ4+UpG+4Zb0bAZ7wJHhP5/UfWkZ5Hrd83P4QKsrkbzYHorwKZaeQBgVdwKltlMytj2zILjXitARMpHaDieZGgbwfrBNS9aE/fGKHuw9DVNbwP03u5xFo0jNmpZi/TYaTjm5YgEVJuxZbdj2AAZ38hxJihwBMj04c2ZILeHTIyGRXBhQhGE7fY30plAyfm+3Xr5uC/VPopzZ5MtpEmSG1BAn27dOnZqWM7zRU7UyN3yUW0e+wgfAoYV+cyR9FKkg0U/0C0CxRnE85reKhMugwB51OTCI6D/V4hQtBBO/GRFovCPYnL6qLUlrVQgKmMiAeGjYUtRr+zfr7Fi7YFUqa2uqGv83f4OI6gU5Yu4ziSsxJ1n+TKn02MI7NUbAw09Bt0OIfWDUIGc4IBMQEQxkQl/Qurz9Qly87S3znPJvHnA352EfF64gEejYE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(186003)(82960400001)(478600001)(6512007)(6506007)(1076003)(26005)(86362001)(2616005)(6666004)(316002)(83380400001)(54906003)(38100700002)(6486002)(66556008)(6916009)(66946007)(4326008)(66476007)(5660300002)(8676002)(8936002)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDB4dCtwTGtGcjk0NFhESm5PM0NXYnM2L0xrRnpncDR5bDRDaGMrL2dHSFp5?=
 =?utf-8?B?RG5wbjBNVVp1OEh5SFpZUWNzenZPMlc0bzkya2JGWTh5N0VOcUlRWHNXRGt4?=
 =?utf-8?B?RWw5cElqajhVMTJqMGRVc3FJR0VwampHa1NhZDZyaytRRUprK0xEZUdmY3Fs?=
 =?utf-8?B?L2l6QnRoR2NvMUViekFoRDNPQ2dYdGpFeGJKQjJWSVNndHpZK2NOd3lEazF5?=
 =?utf-8?B?RUhsUzVVSUpnRHpoNU5IQmhzTm9iYXRDcnU1MGlGN0djek00ejBLUUxjZURH?=
 =?utf-8?B?cXNJUms0ZWFWNXlWRG05d3Z1ZkhPa3hzY1VNeWhNZFM3N2JCZDNtOTBHOWJF?=
 =?utf-8?B?OHp6cmxFRHNZL1NDVWROcUdxT2lHWjYrcXhCd3liY1ZwYnpMMDRwVm56d0Zm?=
 =?utf-8?B?aytPSVAyZ1AwVnpRNk1pQk8zRmh0RnpvWktVOXUxR2RQUEMvd0I1TmhmeVlu?=
 =?utf-8?B?YnFsZXZGdW0raGpBK01ibnNCTFhZaWJCZGk2WGF1cjBWejRzQnBvVEVHZ0l0?=
 =?utf-8?B?ZHg5OEhVZTNwU1BSUGxjTktqTGl5WVRLUXhBdklUZC9rcURuNVJxekNjNHJ1?=
 =?utf-8?B?YVhNR3FHTG9xamY5SHl3NWpoVytpbXp6a2RPbStINnJmbkFWUXdBMWVhSW1x?=
 =?utf-8?B?aU1OeE9XZmF6NmM5WG5mSlQzS3pTdllaY3hnQXFXSXdnNkhjODBTRnlET3A5?=
 =?utf-8?B?M2hCelJUdkZuSjhCSkhMdHRFYXBaWlhEQlg2L2E4UzVUTno3eWNLczdOSmhD?=
 =?utf-8?B?ZlJYcGQ0SVdQVjhNVElDRkx2WlE0U1lUS0l3aFdvQndiV1A5OTRqQi9ibVdh?=
 =?utf-8?B?djJOamw2TThaYXBGOHFQdUZXT0oybitaK2wxWTVtcXBBckY0OE55RUNGZFBk?=
 =?utf-8?B?WStGbXo4cm5rUjBRbWcyWkNiVjlLVTdPcFY4MVpRRnFRVEpUYnd6dlZMNkJj?=
 =?utf-8?B?M2dFeDVhWmRnMVFjVi9zUUYrd3JzeVV5dU41dTlPVXpCY1htMWVYekEzYVBN?=
 =?utf-8?B?SFI2N2hkdkZreXZQUGlLQm85WkhyUlNabzA5V0YvdG4wZlFUY1ArU0g1clVH?=
 =?utf-8?B?ZjEvNm1odmNQWWJ6UGgwSkxSeGJWQUphME0xbFF2dUFJL05SNHVyNUJEVkZS?=
 =?utf-8?B?STQ4MDNUa0cwWUt6S01tSjAreXl5akU3Z1hVMDRtbjJFYUQ3Y204Wk1ubDhv?=
 =?utf-8?B?OUlQWGphRG41TnJlKytsU044b0lZejVVclBBVFVMYW9rNWU2azdFYzJmMlFy?=
 =?utf-8?B?STl6Y2lFVUsyZnk4TG9DL3MwL1pWQzd4WXA3bTBwQjlRSDVZbHIxandkMWls?=
 =?utf-8?B?aUlEbmY2cHQ2aGZjc21abHRFLzl5Y2ZGZHJRUFd3R0NyRnhoWUs4QnFPenBL?=
 =?utf-8?B?NzNlL3RCWElFUXB5dE1WYUJWSWZWRzRUSjVLcnVRWHFKT3NCN1JiTDIvWE1v?=
 =?utf-8?B?UGtRRkdTdXdFc0RyT3VCeEJGOGgwK2k4ckY0VDdFdkg5VUFYWlZERk56a0F4?=
 =?utf-8?B?MnZqWXlISXcxaE5QN2gxSzJ5OU5YS1RuM2xFUEphUGJOemxTWEl2TldEaDA4?=
 =?utf-8?B?MURLWUNqL3lGRW1WU3NhTXUzZmw0cEZ3emtXdVVqQmEvWXU3OVExcEJ5V3dm?=
 =?utf-8?B?blJUeEdxTHhJT0dEZzNkWVNGM3JDblVuVlBoa2RWQUZkQUtKY2pYcHExZ01a?=
 =?utf-8?B?TlVxYzhPeEFNOGVCTWJFYVFCQk5hWVdvQWw4NUdpamJmV044TGx3QlRiSFNm?=
 =?utf-8?B?Mzk4NnV6aG9GZ1EvQWRsbEcxUU5IeVFQWTdnQjVkRXZ5V0wzYmw3U3NhUU84?=
 =?utf-8?B?UDVuZmZ1L01hMmU0ZDM3NzhhNEc4MDQ5ODc3SDcxTEVMTk5kRTNwbk8vOTB4?=
 =?utf-8?B?c3ZUa01mZHdJYzk5UTY1N0tHZCtGa3UyQUhCRWh3Uk1FcjFRdWQ2UWN4dVNt?=
 =?utf-8?B?aDRGZVlnNS9OZTZDY0NOUkxOOFJLcW10MllMVWJEV3U5QW4zaHRRK1paSmZC?=
 =?utf-8?B?aGxUaTNJemxuUGluKzh6K0h2SkRsb0dteEpQVXVxTGlpdDZ5T0hLaUtYRnNr?=
 =?utf-8?B?ZVljRW1qb3BsbDlWdGwwVmR5SVM1WHlVMzN6QnhhYUdzdFRuOXUrMmFtcnhM?=
 =?utf-8?B?VnQxOWx4ZXhIVDRCUHc5Mkw5RzBrZXEzc1Q4MTNBZGFyYnpWdXltODg1Tjc3?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4wZwpnzmlyE7PJR6h4Tpih7D5Sbe8uX+o/8fOwo5Gm4W0fUNb0YL0TWno5kiEn8lUIGE2ZyTmdr+hD/qaaR1H8qvToWNlYrZmec+F+kq18GVOr0N9FueEVKPiIs7UJIkxY88V77oZFWiWZLBn0YTy9tTnfrwUHklcWeXUE3ZIn1AVnM6NBGOyVqgeDZxG4JuasjhZvOZhaBBRhIjKG8AeUh1R47foKVLjC9COmNCYa5DPeAfGUXgW0+uS/QgR0uRU4rFEJI0q1hVBAYehOvqGN5vWUbUh9KymubqPr3PVjQOkqVvN72Tad+gt4SwA1rEp3k7kZwtUEX7XzBM1g0J3vvgdRgyOUizqcEkdIWmYwAo0M4f2ziVyTG+f04Z6tB9rqmN8ZL5Gkw4CbkGtUiv4CTpxm6eYdIzwiKKHN16dBrJvXp30pa7LmmXFBBwmt7gBdMVuyW16LgKdV+UG7D7xZrdzc2ETmjdx4jC3JZQEBlsZxlZr4V8SgPPwCxCN3oAYyKwO1McDb42Tf0Rzat7wuftaSrV9QEDDTtVrKKEr9vtM5Zb32uBqgzBBEOkZQvVt5+JWMjOR2TC8f0W5zGgf3KXdasNkDI0NhKzmfioHSiwXvlKvMCocVH3EPf6KFrswugrDI4bE3OmgJH6lJVdLKb5GqmLX7rCiOCFwyM/OaiYN+sS54/7neZ6cqhVBpbXfbL3rlfp9vmB0oIUmN9ToVlsm01OnYs+ytX8GEQxs3WOKvEJUbrvNaRe1WqoK4a9wCg0DmCQ+flmq0L1qlHykHQ+xRVaUf6nwLmG1vLPF5H5Gnk27/wH57MG9oMuRwcp
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037a5203-ae00-44d5-8222-08db7d4daa33
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 11:47:52.7346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6ixaL/nfXriLOd9IGAKKv/fSCEflunpvLJJBWWaFJMmOyGPZjCiZJ8VFtSeqUxpNaz274GwYhThhc0L6l0AKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5718

Introduce support for passing the command line to the efi_multiboot2()
helper, and parse the vga= option if present.

Add support for the 'gfx' and 'current' vga options, ignore the 'keep'
option, and print a warning message about other options not being
currently implemented.

Note that the multboot2 command line string must always be
zero-terminated according to the multiboot2 specification, and hence
there's no need to pass the string size to efi_multiboot2().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - s/last/cur/
 - asm style fixes.
 - Add note about cmdline always being 0 terminated.
 - Also allow \t as valid option separator (as space).
 - Expand comment about expected get_option() behavior.
 - Always check for valid option terminator.

Changes since v2:
 - Do not parse console=.
 - Allow width or height to be 0 as long as the gfx- option is well
   formed.

Changes since v1:
 - Do not return the last occurrence of a command line.
 - Rearrange the code for assembly processing of the cmdline and use
   lea.
 - Merge patches handling console= and vga= together.
---
 xen/arch/x86/boot/head.S          | 13 +++++-
 xen/arch/x86/efi/efi-boot.h       | 74 ++++++++++++++++++++++++++++++-
 xen/arch/x86/x86_64/asm-offsets.c |  1 +
 3 files changed, 84 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index e03f52c75535..1eb829ab419f 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -237,9 +237,10 @@ __efi64_mb2_start:
         jmp     x86_32_switch
 
 .Lefi_multiboot2_proto:
-        /* Zero EFI SystemTable and EFI ImageHandle addresses. */
+        /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
         xor     %esi,%esi
         xor     %edi,%edi
+        xor     %edx,%edx
 
         /* Skip Multiboot2 information fixed part. */
         lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%rbx),%ecx
@@ -277,6 +278,13 @@ __efi64_mb2_start:
         cmove   MB2_efi64_ih(%rcx),%rdi
         je      .Lefi_mb2_next_tag
 
+        /* Get command line from Multiboot2 information. */
+        cmpl    $MULTIBOOT2_TAG_TYPE_CMDLINE, MB2_tag_type(%rcx)
+        jne     .Lno_cmdline
+        lea     MB2_tag_string(%rcx), %rdx
+        jmp     .Lefi_mb2_next_tag
+.Lno_cmdline:
+
         /* Is it the end of Multiboot2 information? */
         cmpl    $MULTIBOOT2_TAG_TYPE_END,MB2_tag_type(%rcx)
         je      .Lrun_bs
@@ -340,7 +348,8 @@ __efi64_mb2_start:
 
         /*
          * efi_multiboot2() is called according to System V AMD64 ABI:
-         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable.
+         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
+         *          %rdx - MB2 cmdline
          */
         call    efi_multiboot2
 
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 64c1a02cf10a..4394c7276aa3 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -795,7 +795,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
 
 static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
 
-void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
+/* Return a pointer to the character after the first occurrence of opt in cmd */
+static const char __init *get_option(const char *cmd, const char *opt)
+{
+    const char *s = cmd, *o = NULL;
+
+    if ( !cmd || !opt )
+        return NULL;
+
+    while ( (s = strstr(s, opt)) != NULL )
+    {
+        if ( s == cmd || *(s - 1) == ' ' || *(s - 1) == '\t' )
+        {
+            o = s + strlen(opt);
+            break;
+        }
+
+        s += strlen(opt);
+    }
+
+    return o;
+}
+
+void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable,
+                           const char *cmdline)
 {
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop;
     EFI_HANDLE gop_handle;
@@ -816,7 +839,54 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
 
     if ( gop )
     {
-        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
+        const char *cur = cmdline;
+        unsigned int width = 0, height = 0, depth = 0;
+        bool keep_current = false;
+
+        while ( (cur = get_option(cur, "vga=")) != NULL )
+        {
+#define VALID_TERMINATOR(c) \
+    (*(c) == ' ' || *(c) == '\t' || *(c) == '\0' || *(c) == ',')
+            if ( !strncmp(cur, "gfx-", 4) )
+            {
+                width = simple_strtoul(cur + 4, &cur, 10);
+
+                if ( *cur == 'x' )
+                    height = simple_strtoul(cur + 1, &cur, 10);
+                else
+                    goto error;
+
+                if ( *cur == 'x' )
+                    depth = simple_strtoul(cur + 1, &cur, 10);
+                else
+                    goto error;
+
+                if ( !VALID_TERMINATOR(cur) )
+                {
+error:
+                    PrintStr(L"Warning: Invalid gfx- option detected.\r\n");
+                    width = height = depth = 0;
+                }
+                keep_current = false;
+            }
+            else if ( !strncmp(cur, "current", 7) && VALID_TERMINATOR(cur + 7) )
+                keep_current = true;
+            else if ( !strncmp(cur, "keep", 4) && VALID_TERMINATOR(cur + 4) )
+            {
+                /* Ignore, handled in later vga= parsing. */
+            }
+            else
+            {
+                /* Fallback to defaults if unimplemented. */
+                width = height = depth = 0;
+                keep_current = false;
+                PrintStr(L"Warning: Cannot use selected vga option.\r\n");
+            }
+#undef VALID_TERMINATOR
+        }
+
+        if ( !keep_current )
+            gop_mode = efi_find_gop_mode(gop, width, height, depth);
 
         efi_arch_edid(gop_handle);
     }
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 287dac101ad4..fbd6c54188db 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -175,6 +175,7 @@ void __dummy__(void)
     OFFSET(MB2_mem_lower, multiboot2_tag_basic_meminfo_t, mem_lower);
     OFFSET(MB2_efi64_st, multiboot2_tag_efi64_t, pointer);
     OFFSET(MB2_efi64_ih, multiboot2_tag_efi64_ih_t, pointer);
+    OFFSET(MB2_tag_string, multiboot2_tag_string_t, string);
     BLANK();
 
     OFFSET(DOMAIN_vm_assist, struct domain, vm_assist);
-- 
2.41.0


