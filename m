Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 722AE7331E9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550191.859157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Ez-0005Bl-FH; Fri, 16 Jun 2023 13:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550191.859157; Fri, 16 Jun 2023 13:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Ez-00058k-Bd; Fri, 16 Jun 2023 13:11:49 +0000
Received: by outflank-mailman (input) for mailman id 550191;
 Fri, 16 Jun 2023 13:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9Ex-0001xG-J5
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:11:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5730c64e-0c47-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 15:11:45 +0200 (CEST)
Received: from mail-sn1nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:11:39 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6547.namprd03.prod.outlook.com (2603:10b6:806:1c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:11:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:11:37 +0000
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
X-Inumbo-ID: 5730c64e-0c47-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=+2q9vH3BWwKJ4q10lD+ahR58VVJqbvLHJmNue2GHCrU=;
  b=d4llkfzJnyq7n5jYv4yTlruuNkNcgHVA+xUzXqnREqHBWN3juJRmgAyL
   IDPyImGvsCrlViTItIF+AxoOIbRUb7iV8fIQBs+FIBH8BHI1s6bvUkNMB
   iZDkWYEcTLtJLXfRCSMPYdM0l6n1WCIXBdAgodpx8T+cVji+xPzXYqDXF
   Q=;
X-IronPort-RemoteIP: 104.47.57.49
X-IronPort-MID: 112390549
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ctEjZ6PbgSMOxW/vrR2AlsFynXyQoLVcMsEvi/4bfWQNrUorhjEHx
 zNJC2qHbPjbM2GmfNlyatznpBsHuZ7Xz98xHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vlqX0x/5
 dwnEhZTURSFleS9npuJc/Y506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvzm7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyj317eSwXKTtIQ6Tb7gzdhnsgGplmULJTEGWGS8/9SasxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLncAZi5MbpohrsBebT4lz
 FiShPvyGCdi9raSTBqgGqy8qDqzPW0OKzYEbCpcFw8duYG/8cc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNtGuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:4dj846xVaAnJ9/NH6hS+KrPwFr1zdoMgy1knxilNoHtuHvBw9v
 rAoB1/73TJYVkqNk3I9ergBEDjewK+yXcF2+ks1N6ZNWGN1VdAR7sSj7cKrQeQfBHWx6pw0r
 phbrg7KPCYNykdsS8i2njcLz/3+qjizJyV
X-Talos-CUID: 9a23:6FAg2GH1zY/fPuzFqmJ46RA5K9AFTUf7kkjUJV2+AjhAeoSKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AgNTsJQ7Qz/d5d5fnjcJCRPuKxowx4PyVLk0/za9?=
 =?us-ascii?q?WstGpGTx9BDDDoReOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="112390549"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJcd6w41D7eAqMmjTeMfS87UM5Fo8p0gQFLslaF6flD8wpt1WWVZC5p2wuhyOWuTTw5adYAC+qwxt+Moy2R49+zPAsd7Mzjay+QEVtviGVMIwwViHqjEIVGgzkmkzOeJGfVdow7wsY/bd7KkJtHX5HNnZ2ZhkFJAa0DnAkAfKOl+1qQFGuQFYQQbMvWw4r3y5inhPj5YgQ3uZ1cwz+gbXbgFw5bPjhbM0k6zP7vKWIHR7rPdslcVZ0PGwK7+hVFNNgrw99LW0Mp0UjHm3ARzd+w3K4yXuo7NxyRPjEuwRITRxLkr3dBgB5zsfhc32Pyot+Ckap0Kzngq0s72+jzr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzuDL17K5HVWw0U6vxRy/7T4WO2u/BryL7lPZZcHWag=;
 b=WOSc5Z4iKbhxZYgKarS/z0H4pX4+fE+OoRGRd2s7b3Z53l6uBrROqR5vKIKB83i/ZkCUnRKlO6IcwtVluird1KP4pgYDFwpzl8p4mxZ0b8OVyWRYvRCMX6Hesizqk/F+RoeYQHOIHXYXCsghTMnaIT+ocuIWEdXxjpzVqklTR8vv5AhydrzUeDpqDT9ZDWKMS5mbYCeC6ehbncZXzZ6FLYtliEqfutTAk8q7rsokTWgmlB/ZIeQ/IpO61Xn2x9tdYuPvjCDtUwLYv3PPs7rLB6qBT3H6eiznO/VmoY2Whz7/U0ETPkMW6vBf8mhZHRBTHaQ6TzB1RSaPt/s/zxwgmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzuDL17K5HVWw0U6vxRy/7T4WO2u/BryL7lPZZcHWag=;
 b=O42NuCWVqDSMVxp2yrYlCYwF5ESGmopGBkIb5PEMqu3SdJK9M8LI0E+lDKvwQUUXIAyR8fH8ffFsz3mqpVejX2EyYzeSWYufLG71f+N2PYR2G7BsYfv8HH2yumIlgkltDiiOtMADEF0z1Zeg4cNaXHyBppcwHqX3Bzwaz0Cn1t8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 07/13] libs/guest: rework xc_cpuid_xend_policy
Date: Fri, 16 Jun 2023 15:10:13 +0200
Message-Id: <20230616131019.11476-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: fc458089-4a5c-4dbb-a79e-08db6e6b3734
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	heDrS+Pwg6ht+hA6JrBnglIfFiSrq8dLSnGfMh1uptVnjtnumaSuWcEP1rGanmY6yL/z9UZlDTO9NGJzaEelA0W1SGCcG7V8yt/ZmxzUKBkQzribqG3si3jra9JfrDSzNUD6zZo4EsIimSb1gduAmzE2GMYNji8VYreb+8W8LRyzjj+Me96KYLXCwLMpq/P8FzB+zXyT+TL4gklaT/noq6XniNrH9m8z6thQCZAUcAJIgvZhQ16bgH2dfxiB6ifhGigS8DK4lSY5pAiK8VY4fRiW90tMfDH109pcmlAWkZsh86WCUBkDqQtCXeUK1rKhSNahrU1M4d2JDmn871igVLeVNdiLyd/uDHh/wcGPIOAuXGkf37MIJ805teLZ9cjNsym8qp204qYNW6YQETWSBO8bPWsgQXjh9O7d89PnhtC1/OKTPjtQdtCFqTxWiyBOWSzh8SuwuERcjej9c9tsuohrk2RaYmMbn1JUXKTRuG5zjCbf0Y+hBEvLYDP6nkyfa30MeyIljDK/xOyjNzRlBqyFcT9hdnPtjx95aiedLwUbXGsB1Y0qep3ptsVS/daJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(86362001)(38100700002)(8676002)(5660300002)(82960400001)(316002)(8936002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(54906003)(83380400001)(2616005)(186003)(36756003)(478600001)(1076003)(6512007)(6506007)(26005)(2906002)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUxBUHZVcWY4UFpTcy8vSldIbmYxZkVtWmxwTXpEdDNOalN1V05Ea2RxUDM4?=
 =?utf-8?B?TUVlTC83RVlQL0xuSllkbXRBT0NGTUlmUG1nTXhtT2YwdkRvNStHNVZyaVU1?=
 =?utf-8?B?THZiYzJkZnJWVlFZbTFwbS95ZnZ1dnY2d0pnVTFzSHN3TnBOMEl4a2FrQkw4?=
 =?utf-8?B?V2xTVW5vVXp3MXJuZ3I3UmZpalNQK0NDSytETXZJamNTcDdENkhsZnNDRG95?=
 =?utf-8?B?NWZreG05YXcrYkhHZ0RKVDFuU0szeTBTVFNIc09VVlFFU0RqdWpBZFcvMEJU?=
 =?utf-8?B?SFVLOXgvcWhsUEhFZU5rT2MxUFV1Q3p6ZVJlV2ZrYzFHQ1h4S2RGVTJOblBy?=
 =?utf-8?B?UllWOHpzWk9WcnJLZWp6VTB2UWNSbmp4dXFvM1hmaWc5eHhwMlVIMUJVTkxj?=
 =?utf-8?B?a3U5L3dEQk9BNjFxSkZ3TXI2TkQvQnJyTVA1TlU1Q3pna3pwMWkwOFpFaHQz?=
 =?utf-8?B?L1p0c29Xd3puQkFUSEtTUTV0b3QxUUFnNllkOVdiSUtwRFZ2MkEyd0ZCSDJs?=
 =?utf-8?B?cFdMRGZDRjg4Unc1RnhBM21wK0pTb0JPazJDYWtYQS9xMm5tbENrSXJRUWln?=
 =?utf-8?B?T3NWZ2k1ekZGaEJZNi9Ld3R1UXhjbVRMaDdIaTdVRGxudkdhV2hmWTRSUkVl?=
 =?utf-8?B?b0VVazB5bWZqQlBqSXozVm54dGM5NlpVRElIRXZvb2d6WCtxS2tXTnpVRUR5?=
 =?utf-8?B?cThSbXNZdkI1R1ZFMVhqY0xqTmpWbkNXNHhsb3VlOFVtUlY0VXV0RG52UWsw?=
 =?utf-8?B?MmNKTDFQcHZsdU1MWFh3Uisya08wM05KSWNOTFdrYTJhOXpaZ0FPMm9iMmF0?=
 =?utf-8?B?UllYeUZFK3kxZXVtc1U5NGtyM0liSmdZWkl4UG9ic0NhQTA2SUtIelVrVndF?=
 =?utf-8?B?cnkyNVNpci81UEJJM2JHYnZyUWNQUWpnQmZWalBuTDVjbTM4TTJHeFIyU2Ur?=
 =?utf-8?B?TmpUNXZqbmVRYTduVTN3TEZiMXJQY0NneVlYK0VuOHh2T2QvYWVyQyt0REMw?=
 =?utf-8?B?RXlQNENvMnNZRUxSK2FaeHVhOTRqc3U1YUNCY2lTQnVlRXJ4cFlsSnNlSWlp?=
 =?utf-8?B?NFNONld5b0g2a2p4NTlkV2FaTzFDQ0VyVUpTa1lROHpCTlRZQUtoa0U4SE81?=
 =?utf-8?B?eVg2ZUwxbzBvYVhvaHEyeFFJMjJXcWx3Y2FWUXFYUVpKWjZkTXd1b3VtSXZ6?=
 =?utf-8?B?ZDhkbzVudHM2M3JjQlUyalZUeVRqK1ZSTDl1MkpRdU9Lem1yTWNjdUdJZ0s3?=
 =?utf-8?B?SEROU1U0OFZJWnh6YjN3WFFUZXhzZ3BzZ24vZk5wWVpnb0p3RWsrSnF0MlNN?=
 =?utf-8?B?b2YyQWM4ZENSM2lya3dvbnNSK0h3WTVlcXVDNGtreVdHQ3NXTEtJWFpIajBs?=
 =?utf-8?B?MDVGNGRnMHhWZjJhZ3RVM2NtOTJRQ0FUaXZRSE0yc1NiR0NkKzZJeTJvajhu?=
 =?utf-8?B?YzdHV3NQTDdoeFZhMEZVREZwVmVRd3JyWkdYMlp2OVQ4bm9zUVRHMVFRc1Zp?=
 =?utf-8?B?NGxZdHpvQU5WLzJiQVhnT3V4VTljR0JTT1piS2FIa0VlWGh5QzVNOXRoOHBk?=
 =?utf-8?B?M1U4SGdkaDhZREcxeDgzVGsydGVFb2lsTm84K3N0S1JQWDRrNFR0SFppd0t6?=
 =?utf-8?B?WktVZ0YvTjExVDcwa3AwZG1welhNbnJqY2MvRWRCSk1kNmJJcGdseXE5N2ht?=
 =?utf-8?B?WmN5VmtmZ0hHaHRWcXhqNStqZlRqVllKN0hZeGwwYTd0QzcxOGRJNkRPTFFX?=
 =?utf-8?B?K2ttdTVpUVBkRWs4dFBiR1BsdFVsSmZFTmxxbnNzdnRGZTNpM2FBSjN4UzRv?=
 =?utf-8?B?am9ZalRvai83Tmgzd0pVTUhEQnhtR21oWEdZYjFwR1ZQOVBpV3UwUzBvdTlH?=
 =?utf-8?B?bXJya3ZGK0x5UERYTWpUcnEvMzNVNWkzL2ZyUk5NeXVLOWZTeVpqd0VLRml2?=
 =?utf-8?B?QkxDVTRsZUp5NUt3WVRyRy90TTdVcC9wMUhGdVhhOVUyU3RtSHhSalhHeFJR?=
 =?utf-8?B?aGxraUJrZWpxelVzTHFGZGxPR2x0ck5mSDU0V0xzdlU2cU5ZNHo5S2NKOGxU?=
 =?utf-8?B?ME1sSkRUTk9EVkNaT3ZNdTlvajJwOFRYZm1ETGRLQ2Q5RGVBbDFJUDdQUW8z?=
 =?utf-8?B?dHlnbStkdUhYazJRaDQ4bDNaaGtCT1ZsUHVpZ2lIMithVUZiMEkzODVLcEJi?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FLW0e8Vk3yWOqJecLInbegesChKsF6UWLxZDtN7hqkqkpRzKHocmhpeiuLtArf3WspAmH4bajvpsFdroF9bznc0oPfnVgcPA6p9QSco/w8twI5Agw8e/hQ7gH/0R4eEzcujWFq7wju08w5JX9FW7NBsJC0pMKg4SFzdVHoId30Ry/+1Rb/uTmzGSUmJttHwLL7AGNBTJf7XJaMo6iSDrhQ/RQ4UahQLRhkOzhQ0qGkiY5TSfyQSci6DTFuRCdzoZ4TlABsy7BsHhhcSvjbbmAODNSg5uTv7mG3KFoMbxSGfdaDTYwrUMbMv/Vc1R+nyK59XjDC+HZifJDrnrxsIzmmsIzOqSbDH51TN5EVZo+SRaFJ87aX3bZ4qF/GxavUJhBK98uiZREVdYZ6i9+yRgKjk7SGxwTsVxLXPz0ipgzcKLWZ7wqKuxxA2+hvGW+mK5WNet6aF8oQZb23RVGEtCRNOyOXy8h7kf2Tp39PmqhilAkcNkgHScfT3MHhhQ5Op635kw2KriHThpewXSm8ZgYY+eDGv1wZQDGJg1vgDGbvna6HFFriXJmrG9TRuIEaxep+BD73HiTw5aWGjl5L0WpYqkyBkWiak04UDzOKXIpL73UnmSEuVISqEYTCq6NWyLsZ0Awa3C/YHkSQ7X4mzJCqihce97+JZ96NJPW1sQQnhKGyR/G5kE3acIejLLlOtx6eUV4SndMxPL1A37aQCufL0L48P6TPO+kOsVh1/uACGfDI3xDuM6uB3QW5hM1dL7RhYyjzOwRm80mUVf4MaiEtsKNgQAdaF4T42J9oJPG6SUKV6/cVtX6rTc+poil91x
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc458089-4a5c-4dbb-a79e-08db6e6b3734
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:11:37.2341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cy0YDn+iU4ge2oC5M5gwrxB2x7nhZDLUDicxPW/oib55CLj/xLBhKgc7RO9NaR1Axvs+GTaBDE85HQ7dtXYpTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6547

Rename xc_cpuid_xend_policy to xc_cpu_policy_apply_cpuid and make it
public. Modify the function internally to use the new xc_cpu_policy_*
set of functions. Also don't apply the passed policy to a domain
directly, and instead modify the provided xc_cpu_policy_t. The caller
will be responsible of applying the modified cpu policy to the domain.

The find_leaf helper and related comparison function is also removed,
as it's no longer needed to search for cpuid leafs as finding the
matching leaves is now done using xc_cpu_policy_get_cpuid.

For the purpose of the 'x' modifier, assume that the passed
xc_cpu_policy_t 'policy' parameter contains the default policy, and
hence just skip making any modifications in that case.  This
simplifies some of the logic and avoids having to fetch the default
policy for the domain.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v6:
 - Pass a host policy to xc_cpuid_apply_policy.

Changes since v3:
 - Drop find_leaf and comparison helper.
---
 tools/include/xenctrl.h         |   2 +-
 tools/include/xenguest.h        |   5 +
 tools/libs/guest/xg_cpuid_x86.c | 201 +++++++++-----------------------
 3 files changed, 64 insertions(+), 144 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index dba33d5d0f39..45f05a2d3d7e 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1839,7 +1839,7 @@ int xc_cpuid_apply_policy(xc_interface *xch,
                           uint32_t domid, bool restore,
                           const uint32_t *featureset,
                           unsigned int nr_features, bool pae, bool itsc,
-                          bool nested_virt, const struct xc_xend_cpuid *xend);
+                          bool nested_virt, const struct xc_xend_cpuid *cpuid);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 2672fd043cf9..705a93a058fb 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -817,6 +817,11 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest);
 
+/* Apply an array of xc_xend_cpuid leafs to the policy. */
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const struct xc_xend_cpuid *cpuid,
+                              const xc_cpu_policy_t *host);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 1e532b255c21..0d0970d4bd69 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -254,145 +254,67 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-static int compare_leaves(const void *l, const void *r)
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const struct xc_xend_cpuid *cpuid,
+                              const xc_cpu_policy_t *host)
 {
-    const xen_cpuid_leaf_t *lhs = l;
-    const xen_cpuid_leaf_t *rhs = r;
-
-    if ( lhs->leaf != rhs->leaf )
-        return lhs->leaf < rhs->leaf ? -1 : 1;
-
-    if ( lhs->subleaf != rhs->subleaf )
-        return lhs->subleaf < rhs->subleaf ? -1 : 1;
-
-    return 0;
-}
-
-static xen_cpuid_leaf_t *find_leaf(
-    xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
-    const struct xc_xend_cpuid *xend)
-{
-    const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
-
-    return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
-}
-
-static int xc_cpuid_xend_policy(
-    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
-{
-    int rc;
-    bool hvm;
-    xc_domaininfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    /*
-     * Three full policies.  The host, default for the domain type,
-     * and domain current.
-     */
-    xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
-    unsigned int nr_host, nr_def, nr_cur;
-
-    if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
-    {
-        PERROR("Failed to obtain d%d info", domid);
-        rc = -errno;
-        goto fail;
-    }
-    hvm = di.flags & XEN_DOMINF_hvm_guest;
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto fail;
-    }
-
-    rc = -ENOMEM;
-    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
-         (def  = calloc(nr_leaves, sizeof(*def)))  == NULL ||
-         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
-    {
-        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
-        goto fail;
-    }
-
-    /* Get the domain's current policy. */
-    nr_msrs = 0;
-    nr_cur = nr_leaves;
-    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain d%d current policy", domid);
-        rc = -errno;
-        goto fail;
-    }
-
-    /* Get the domain type's default policy. */
-    nr_msrs = 0;
-    nr_def = nr_leaves;
-    rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                        : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_def, def, &nr_msrs, NULL);
-    if ( rc )
+    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
     {
-        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto fail;
-    }
-
-    /* Get the host policy. */
-    nr_msrs = 0;
-    nr_host = nr_leaves;
-    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                               &nr_host, host, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain host policy");
-        rc = -errno;
-        goto fail;
-    }
-
-    rc = -EINVAL;
-    for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
-    {
-        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
-        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def, xend);
-        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
+        xen_cpuid_leaf_t cur_leaf, host_leaf;
+        int rc;
 
-        if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
+        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
+                                     &cur_leaf);
+        if ( rc )
         {
-            ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
-            goto fail;
+            ERROR("Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            return rc;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
+                                     &host_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            return rc;
         }
 
-        for ( unsigned int i = 0; i < ARRAY_SIZE(xend->policy); i++ )
+        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
         {
-            uint32_t *cur_reg = &cur_leaf->a + i;
-            const uint32_t *def_reg = &def_leaf->a + i;
-            const uint32_t *host_reg = &host_leaf->a + i;
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
 
-            if ( xend->policy[i] == NULL )
+            if ( cpuid->policy[i] == NULL )
                 continue;
 
             for ( unsigned int j = 0; j < 32; j++ )
             {
                 bool val;
 
-                if ( xend->policy[i][j] == '1' )
+                switch ( cpuid->policy[i][j] )
+                {
+                case '1':
                     val = true;
-                else if ( xend->policy[i][j] == '0' )
+                    break;
+
+                case '0':
                     val = false;
-                else if ( xend->policy[i][j] == 'x' )
-                    val = test_bit(31 - j, def_reg);
-                else if ( xend->policy[i][j] == 'k' ||
-                          xend->policy[i][j] == 's' )
+                    break;
+
+                case 'x':
+                    /* Leave alone: the current policy is the default one. */
+                    continue;
+
+                case 'k':
+                case 's':
                     val = test_bit(31 - j, host_reg);
-                else
-                {
+                    break;
+
+                default:
                     ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          xend->policy[i][j], i, xend->policy[i]);
-                    goto fail;
+                          cpuid->policy[i][j], i, cpuid->policy[i]);
+                    return -EINVAL;
                 }
 
                 clear_bit(31 - j, cur_reg);
@@ -400,33 +322,19 @@ static int xc_cpuid_xend_policy(
                     set_bit(31 - j, cur_reg);
             }
         }
-    }
 
-    /* Feed the transformed currrent policy back up to Xen. */
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto fail;
+        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
+        if ( rc )
+            return rc;
     }
 
-    /* Success! */
-
- fail:
-    free(cur);
-    free(def);
-    free(host);
-
-    return rc;
+    return 0;
 }
 
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
                           bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *xend)
+                          const struct xc_xend_cpuid *cpuid)
 {
     int rc;
     bool hvm;
@@ -617,6 +525,16 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
+    if ( cpuid )
+    {
+        rc = xc_cpu_policy_apply_cpuid(xch, policy, cpuid, host);
+        if ( rc )
+        {
+            rc = -errno;
+            goto out;
+        }
+    }
+
     rc = xc_cpu_policy_set_domain(xch, domid, policy);
     if ( rc )
     {
@@ -624,9 +542,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
-        goto out;
-
     rc = 0;
 
 out:
-- 
2.40.0


