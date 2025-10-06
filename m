Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A554BBF0FC
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 21:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138356.1474075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qZW-0002rn-2k; Mon, 06 Oct 2025 19:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138356.1474075; Mon, 06 Oct 2025 19:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qZW-0002pz-00; Mon, 06 Oct 2025 19:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1138356;
 Mon, 06 Oct 2025 19:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dSL=4P=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v5qZV-0002pt-9R
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 19:08:33 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5c5710d-a2e7-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 21:08:26 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SJ2PR03MB7070.namprd03.prod.outlook.com (2603:10b6:a03:4fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 19:08:17 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 19:08:16 +0000
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
X-Inumbo-ID: d5c5710d-a2e7-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcE3OLn2/4rFfUuScVYulUb1v8loiSukIhKABICNtBOjRn87iKFNzDVadYr5GEqS/hdpiZW++ZdiXa6AAEgGqp74d8IUPEkpYbPn3hOVNGc25qNK/20eVZ13ul3K/sC6Hr7I2/1dRHyUJD6+GaOGzin51UOTiMSmsgZ0yjg9anxYT9jVSu41zhh7xnd4lkZdiAURXpbiKfPzFGWu7PcVNZiMtQVNV8dpqrZ2h3xZkiZgEbFcg4mek5qtzPXYCDWis7v7ORjaMOeuNZx3HKiLNTWpXNgCUbFFo3mzB5rjykKPs4HbPTgr/tyBI5CTdjATBZqA/9MMqmBOKWzNzrglgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBssSJSuIoi0JTMy4fL78fFCL45+RV9ZVwWU2DmxDBs=;
 b=FImssuqxMOpi5/4tHZZpJF18tT6+fmUhUk2z00RMnzQ8I51oRnJi75+tFqHhWoNHq7SHmYEECmpwcoF5XEVJfvpqKrYtguBGJG0tdNzg/Q3c7Qc8XMttPjGoBvmI/9LOK5RGoyIg2zOj0+nKad52Ik9N4vySjQdDK96k7ktj8b/B/ZzCNNoXmKb7tRKVVRWj8LSIt9stRiff3SVsrIlgewg5c8LRzmLzcLS3ADwpiIozrrmxgTU4MQB8MStUR6TAO+56XJ7QuFOkpqWw9in4zyTB+Ukh4a6KdNwkrbY7A3b89BsoiiIRrgWsn2QJ9XfQlv2neuTjdCRhmtxnSEa9xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBssSJSuIoi0JTMy4fL78fFCL45+RV9ZVwWU2DmxDBs=;
 b=TA9lh03MzDSF4fNXVnMruEDNOf2BCrZ/3cSNgz9QQIM6WG484O7UNW6OJeehvfvLeJg6vSS1EfCc+JtKj8F+e6Ct7DxvEvzT1HeId9PwP96QJuRzQekDX1oaUuG9vS36HkoZ73cYNFmEVbIuwzOHm1X9j9zYRTxSq5h7TXtTsM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.21 0/2] cirrus-ci: get testing working again
Date: Mon,  6 Oct 2025 21:07:55 +0200
Message-ID: <20251006190757.72757-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0962.namprd03.prod.outlook.com
 (2603:10b6:408:109::7) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SJ2PR03MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: d916d9af-2c8b-47d4-4eb8-08de050bb49e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXdNWlRaNXM0YUIwblRpS1BDbnJjcUtmMXBmbXd5QjZHQzVESzhlSVBzT1Jn?=
 =?utf-8?B?Qm5SR1RMUHVFVmE3R0ovTXNHMm5lV2VMYkhnL0F5RzRQZjNuc0UrUUZuWHpM?=
 =?utf-8?B?N2RhNGFOeGZQK1l3b0I4K0xNWEdjQzZvMm1QM2o3TmxYQjIrenJCWlpOUGc4?=
 =?utf-8?B?UVUwS1ZVT0s2bzVKeDZub2hheEJ3K2ZCNVl1d1kwK0w0NU1UL2M3cFV0VnZL?=
 =?utf-8?B?LytWMHpQWTFyTnNIL0F5UVhxRnRrZU5DajNacG9WLzA3VUIxcDBBWmxiK3RJ?=
 =?utf-8?B?eTY5elgraStzOHYwVlRNalE4aWhtbm9vdlQ1WUpDZkNvVVJVdUlxN0NzS0Ja?=
 =?utf-8?B?TE1Kd3ROeFVQYzdmbXRTVlNQdzBVcUJWTkx3UXZvTzlZYkxnR01zaHdJbkFZ?=
 =?utf-8?B?UjZOekN0a1AvMmhTTVBVaHFiRmdMRjZtVlRjQ3JwL0crKzdxQUV0aEl1ajNr?=
 =?utf-8?B?cENhZDVzY3BnVk1pcUJhVG5iSE5FRnlQSFhnVDV6VEpBdTlmYjEzRDU0ZmF4?=
 =?utf-8?B?S1RkVWs5WmJIQmpncUdzWFNXdFpPdzV4SHIwUFNIdXFuTXdFTzVsemhpRGRw?=
 =?utf-8?B?K0g3UTZKa3RLUUFPS2UxY2lERWIySUJuZEJ1QlFtVC9LeU93ZHA5L3BEeU1Y?=
 =?utf-8?B?bXVMNEhNWWk2TjZ1S250OXpyUmRXRTBKb0RUZ3Q3ZDROR2dCUDJtMXpESzAr?=
 =?utf-8?B?ZC8zQjVNdExPYlNybmNmN1lTMUFSZjZURGt6MWNKcUJmeThOY21XTTNpbkth?=
 =?utf-8?B?MWZYaW91blcyM3BRMXZDVWRMbHpqWjBob2JicXJzbEJmeEl6eW4zck1JYXV4?=
 =?utf-8?B?dXRJa0xTeDVwVWxhUnovdlQvNktJWHJZdU5yY3d6M3JjbmFpZUJXWFVPSHU3?=
 =?utf-8?B?dlloREZCTnRmbndpVE9ycFdxbkhUU3V5WlVhVEtoY1dPOWpWT1hsYWVXOW56?=
 =?utf-8?B?VzJDMnJQckNLRk5kL2dmOXRzNXBQajR2SnA0clJrUU1VVHpEQ3lRYi9LTFMz?=
 =?utf-8?B?RUE5Mk9XdGVoK0NkVXl1R1p3b1ZxTkN6MDNVTUpUMkdyQkhXcGVMTWk0N2lW?=
 =?utf-8?B?MEhMUmpnU05RNUVUWUxGNVYwOHRZblN0MFR3U25xalhqTGJyYWZvS1dab0RM?=
 =?utf-8?B?MVJYSENHOU9mTkR4UjRFM3h1TG9uSXlEUUxHUW50QTNFOUh6ZU9MeDZIQ0d5?=
 =?utf-8?B?UHByamRSMjlpMFRMcFZVZDc1TXA0ZXVzN0psbnB1WFFwRDU4NUJ5dGVFRWtT?=
 =?utf-8?B?dTFMMndTYkVhOFh6dUtrNHVyVllRcTFnY2lMTGo0ZkRUOUhIQ1lZK0gydk0x?=
 =?utf-8?B?aUdNbml3cmFoRExZbXJBblNsN2E2NjA4SWE2V1hTWkMvWU4xbnQxM0YyQnhl?=
 =?utf-8?B?QWtObWhCR0hGUFFaR2o2YVEwTzNXdkRYY0I5NEIvd2tEcUh6MndwSG1WWVhO?=
 =?utf-8?B?dDVzU2ZsQ0VOZ0pIYmJEZXQvUzEwMzdIdEFMbmFIRVVtRTlMdVp0ZUpqWGpR?=
 =?utf-8?B?TFhnY0d6aDhMd0hyRmxUQVUvRnhJMmtSYjQ4MldHbm0zOHZGWHFUQWRwZnFo?=
 =?utf-8?B?S1d5N3dWWmVsQSs0ZHVrWEZsKytLQTE1YW94TE5hZnhmYVpRN05XZzhlenJN?=
 =?utf-8?B?dWtVeklXZGtzbnphdVZmNktGVWtjTlhTWEp5a3dzUWxoTkxacDg4Z1dNL25K?=
 =?utf-8?B?WHNxQ0pyMXhNUEozNmUwd0ZyWHFZRDZDd3dOWXBhRmQrOUllZ2VUM2dqSnla?=
 =?utf-8?B?VUlYaHNqMHI3WHVXOFBrR21adGRadTZkVHJMc2JtNUdwMGljeU51eUpQMjBZ?=
 =?utf-8?B?MnAvVFV2ZHlHVi9RWEJuOVp3b0g3UzdHYkdLQ3MrdjFxN25jeVNlbWtVTU1U?=
 =?utf-8?B?NUsydFJlWHM5S29lMThCbTBadzBPZTRNVERkSytWSDNpaHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUhsZjFtV2k0bm5PYzVFMXMycmdHditHUUNhanUyQmxtdm1RMEkxdWNvUjF6?=
 =?utf-8?B?OTZsTDNRT2I5RlBDaXdKZGFhajN1TWpCZHFBWFRJbC9jSm92REhnUk9YM2NN?=
 =?utf-8?B?cjR4eHA5KzI3bmR0OThEM2pTbDJIamRsZVpnMjJuSlRNam0wVitldUpRMXNv?=
 =?utf-8?B?M3FSRlBrVmtYL1RnenVSR1RoeEswRGtadEN6dTB0WEFqWmlraC9ybHVkbTVF?=
 =?utf-8?B?R0IyZDJBRWR4Q1VabHd3dTdHS3loMWh3KzNDUVZld0p2MTFLUzhRUjdXdURw?=
 =?utf-8?B?Z2pVTmYvRWlBcWM1WnpoOHBEcFFpdURWTnRDVkNtK2Q4anBNbkZyMkZyMTVV?=
 =?utf-8?B?VU5XVW5VY2ViNkFWRnpOUGQvQTFvRk1LRmU0ZEY0cXNxM0JtTlhWMUxiQlRa?=
 =?utf-8?B?OTVqUUVZVVFJNVZSTnJ2MDZGSUxuS21sQW53S08ydGIveVhwT1dyYlovVURM?=
 =?utf-8?B?VjNBbFpQUmhydlZ5YkJObTFJczlaVkRJVlBtaHlSbTlhTk5rT1VKSXVqK2tW?=
 =?utf-8?B?aWNKMjdINCs0ZlBlQ21pL256SDdvR0JZckNFTkIxZUVPdVJqQmY3NjhBOWlY?=
 =?utf-8?B?YTlRMWNBVG1zY3FDeXE5dGZBbjA2L0RSdlphRUtrNEFocEZrY0s4ekUvUDVR?=
 =?utf-8?B?bnIzSU5BSXl5SGFxcGhMOGc2bzlybkZyVExPYzhXY1BoYUxJRjJLTW41SWlo?=
 =?utf-8?B?QVBtUEFWVHZWNnpaL1Q0RlZpcGdnQ2l4U1lpcUJ3MEZWVmhPb3hsUklBdkVh?=
 =?utf-8?B?d2dhM3dlZlZsNHRnYzN5SUN4MDREdGxEL1NSNElyQ0JvT1NIU2NzWGdwTDNr?=
 =?utf-8?B?aEpFc1o5ZnhRL0UvKzlpUS8wMGM1MktUdjVxeE5ZUzNKMGV3S1Y5Qm8xK2hO?=
 =?utf-8?B?dlFCRkgyaElnYTR6eGJsZnM1NjdEZ05yRXNIS3Bid3k1VG1YRDRpZFBpZ05C?=
 =?utf-8?B?WWRzSWZPRlJEajhyR1VsVmtwV3BUbC9hUTl6QUVIMTRtMUpUVm9tYzhEbFFJ?=
 =?utf-8?B?Ti9Hc0U2ckl5ZkNqTU80UER3YlByUUdpQTQvYjcyTXEybUprNkkrL2w2M1or?=
 =?utf-8?B?RU1RQ2E2eWc0RzhTNDBGeWFVOUd5RVpjNi94aEs5UThZVUprMnJGalRxSWdu?=
 =?utf-8?B?SUxGWmlubFpUSmdySVVwOS8zblA4WXBrcDNCeGd5YUZNQkI2R1l5N0ZMU1M1?=
 =?utf-8?B?UTlBZFFrNEZNaXh3UTAvTnFPTXZtcEowZGVjRTI4WEtNUmVFS3Vhcjk2N05B?=
 =?utf-8?B?ZS83VnRjNkhhT010bWxlUmZPcGd1dXhuOC9EWHJuRmJ0ejIySmFXcVBCUk5T?=
 =?utf-8?B?SkVWdlFVV0crTE1WYlBpMjEzUU9aVlliWTEyVEg0eCtPOHlHUU1oLzE4aUd3?=
 =?utf-8?B?aWhiMXZZOFNKTTNOWTVxQkRTYU9TVHBpQTFsRzBqTDF1VVo3SGIxOWpZYTNP?=
 =?utf-8?B?eFJOS0FwbW1SaVNnTXNOalpTQUR0ZjRFRi9mNlM0OHZPczIvbXg4SGVhVkw1?=
 =?utf-8?B?RXJEN3orWFhrQmszMTByWGVwL0V6YUZQZk0wMW5mQnhNMUtiMXJxODI4MnQv?=
 =?utf-8?B?dll4MkxTQk8xeWxEZjRZcXlBMnZoK0tBMjQ4TXhiSTFUQmxGL3N4TWFyVXNj?=
 =?utf-8?B?Y1AxM0VMb1Z3N2ZYenVubENFNUxUWTdadmJKbHp5K2JIUTNROFlLTjVaNkQ5?=
 =?utf-8?B?Q0pXaUJYOUlrTXlzOE5IRERPbmxpU2toZnptdk5UYStwUk1nb05nQVVyUCtC?=
 =?utf-8?B?VTV5S1lZaGZsV3MrckdETUY1RWpBSlNPeWNJbE4vWW1uMXIycTkrcGRab0dr?=
 =?utf-8?B?NGNNaGI4a3Y1NTdkemE1SjV2bzUrV2VZcEdIZy9aYm8xN0JubHA5S3BtNEFZ?=
 =?utf-8?B?bVQ0QWUrTTR4dFdCS3k0N0hidEg1RlZKZzBRZHhGM2lJZHlCS0QvMGZXQUlD?=
 =?utf-8?B?emRuWDVjWHY2Y2F2TGg0Tm1sbjc0T3pEclBBVHYzVDR0K05nYU9VR2gyRVFv?=
 =?utf-8?B?OUtrYXRNZ2F5UWtaY3NGUm9FRUpXdllGMWNhUVRNak1EaldmZGFuNzlKNVlN?=
 =?utf-8?B?QzliQ2NsTW9SUzlEbm1naUdiQVVNSFJCT1JLcm5jWGh5UlM4R2NsWjJCaEUz?=
 =?utf-8?Q?JUiezrcTcyzyLb5ENCbPx0i+l?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d916d9af-2c8b-47d4-4eb8-08de050bb49e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 19:08:16.8728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6GMaDri4gYs8rkeQNq2RYqbc+K3WXeVvJ21I+GSWnhiH+xaOigtel7SsiSKbMrInLQLP/iHvdln1yqvv74gcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7070

Hello,

The following series fixes Cirrus-CI testing so it's fully working again:

https://cirrus-ci.com/build/5486825222963200

I request a release-ack to get those committed (once reviewed).  The
risk is very low, since they only modify Cirrus-CI code, so Gitlab-CI is
not changed at all.

Roger Pau Monne (2):
  cirrus-ci: install libinotify for FreeBSD
  cirrus-ci: fix bashism in the test_script code

 .cirrus.yml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.51.0


