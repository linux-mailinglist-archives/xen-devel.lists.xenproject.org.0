Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2C0C89859
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 12:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172576.1497652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vODie-00079a-4Y; Wed, 26 Nov 2025 11:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172576.1497652; Wed, 26 Nov 2025 11:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vODie-00076T-1P; Wed, 26 Nov 2025 11:29:56 +0000
Received: by outflank-mailman (input) for mailman id 1172576;
 Wed, 26 Nov 2025 11:29:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wUbM=6C=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vODic-00076N-Gy
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 11:29:54 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39540401-cabb-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 12:29:53 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BLAPR03MB5489.namprd03.prod.outlook.com (2603:10b6:208:299::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 11:29:49 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 11:29:49 +0000
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
X-Inumbo-ID: 39540401-cabb-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9ouSEMjRhLMSiQkECHXnYtcf/3ZKgLshERMYHjJ5IOGpcWxOPusU1pZPUL6SaGrZmv9givF+r8nHXp7f6F+jdIpP2dMOkDxeaNry55ArZ3yXTLWPtWOMY5N1ZwQYpHZ3iQuAEzjZ4X/gTtY5CY30kGzIyj8qHLrP5LgCzdeGrCT0dyEJPnkKGygvDCmxP26M7pp5/pTx0aPgRC9eQ9LhA0aQRNM5bRKHYsIySUEaA/KZEAw+rBLJ4SGGkKIT1h/+1SDJAqltbz+qHI1DkBT8jAw6Z2tU6s52OMl35SGYIXFNkiEGFNoZB9Il5cgb6GqYO6i0eGtbARX1Yy5ft0H8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+ZmMJMLo4gnVQALzODxbOeXoU5clQ278LQY4anXF9s=;
 b=IJu7Q8n7CBW0h+XaUvITdac1DtkHloOqFXAWoWopB2NJx+vEHCGgTg8vMD8Qcv6g1kY7lU6qJoj538NWgyVQtcHAcW1NaW2G7XX2vRcdkTkq6WJTpUU8ec3ViW/lVcWWVOfgBZGN7+Gtfh1l6KSzw5qQg8SJp7HkXhtoTVicU2KDY9qDZt9M0EhPFGag/veVuGg1PqrmSDcqthvb2TGDXXDPvuFK0iFvkqOOX277Qttqi660sihkQippkVsNAozbvRP0Jtu7IF2i0A6/3yPG4OefwSB+0vbRRnUWm7nZkOGVIKluAEqLFJ5Op6Z94PSN+jrgfoJDj5Z4l7+GC8aKZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+ZmMJMLo4gnVQALzODxbOeXoU5clQ278LQY4anXF9s=;
 b=KuTdzHsNnQ4VMlChBQzfMCORD0w90WdNqHku10ZrwFKH9A9N6kvUbBhdz4zFkc62LSwRvQOCYA29wCafdoebzlfq1yYunbVWy9QJJAsN21CAjNewRdJ95pTx21EcCJoYKp9TgRyj4Hkr/gH58YeiDpMcmiW6DnH+L+rviXozV8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/viridian: fix calling of viridian_time_domain_{freeze,thaw}()
Date: Wed, 26 Nov 2025 12:29:42 +0100
Message-ID: <20251126112942.49031-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0043.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BLAPR03MB5489:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f83efd-8813-4121-6028-08de2cdf1bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0tZYVdYcWxtTVZSaW53aFEraW9YZGIwQU9KZk9weFhsdmg2RmxZNlhLWEZC?=
 =?utf-8?B?d0hNWTZWV3U0S2pvVkxONGVKZkVMRjNkNEpXVno1NlUvOWhUOE14YVF2QUZv?=
 =?utf-8?B?REgwMjl4Nlk2bmJ2U0NYaGRlVlJHeW1URTRlZDZKWXZ3bUY3d2VOU1JIWDdM?=
 =?utf-8?B?YTJQVUVVQmkzR0ZiV1FtOWVKU3hEMU9KTEF4bmtFbHoyNjRZTkRzeURaK1Vs?=
 =?utf-8?B?ZU5yanpTUXBjZlBoNmtzQlNENldNK2dreGJGaTZERHBHMDJPUEExSHBGUFVq?=
 =?utf-8?B?Q2xlUGo1WkwwRVJjNXBFR2EzZm9sSnRLUVZnTWhGTW42N3JIaFlhU1JOMlQr?=
 =?utf-8?B?SGYxbEpxT3dLMnhad21iVzlpU01uMmthdUk3S3BBd3I4SVhjTGs0dkdMazgr?=
 =?utf-8?B?dllIRzRDaTB5eHhpTHRhczd2Yys2R2Zzak5YYkMxNEJ2Rml6U2xIV0VOQThP?=
 =?utf-8?B?bjlhOFB6SVNIVHpqVlFhRmcybm44QnE1Q00rak5xNUVQQWk5ZGFKdXA0a3I5?=
 =?utf-8?B?RlVKWVA3VHdhWnpaUnI2NzM4SFZHcGNIUHg4ZkV6djVrenl1QVZXTWJtclRH?=
 =?utf-8?B?dE1HL0xuRGIxS1ZyZ3ZsQ3JBZU8wM21Jb0RrQ1Nsdk53ZTNPWXVLSmRHdXMy?=
 =?utf-8?B?U2o5alVpc2RjNXhyeDBtUW9vVjlwUlYwVnAwMjU1and4Uk5jTW5GZmFVYUdh?=
 =?utf-8?B?ZDRaOXM2Q2plQ08yUnNiTFdUUDNWVndiY1BLZjNUd1hHV3Jsd0xxdno4QmFB?=
 =?utf-8?B?YXZzTUJneUo0SStyR2UxT1pHaGt6RWNyTlJJRnBuRkllNGUwa3ZmR0ZrbVdj?=
 =?utf-8?B?Q2FBQkc5RFUzejcrL0ZaVkIzYklYeGhjQnFxRVJTUnNZWDFSR0dDWDRsMG1O?=
 =?utf-8?B?YTRNZTRIWktFR1l6QTlPOGZRcnBwUkU1MTVsb2RHdi9MV2lEWllYZkR6Mlc3?=
 =?utf-8?B?a3VlSVlMQSs2U3lIYlkrQmFxSDhwbWlCblp2NzdLZlVqM3llaGsxaENTc092?=
 =?utf-8?B?OGl6M0V2YVFHQTIxb1B4L0lYdTdoTlBUMjhyTXhWbGdlQzBQelloM1hqOWlB?=
 =?utf-8?B?ZHo1RThjbU1SeDY2aDduU1B6VlRRVURCTWhEODd3YzJSK0diZzVGQUlJVS9k?=
 =?utf-8?B?WjQrQ2lLTklHbU00Q1FKL1pxVlNZUzg2ZGZHR1Ztcm83M00zUTVldGowZ1Mz?=
 =?utf-8?B?RjR0OEIvVEF6MTlsQjRPcFp5WHVNdHVETDk5cGFmak1Jam9QRC9IS1I5ZU9D?=
 =?utf-8?B?S2ZlenVXMjRGYWVOSUU1NUVZNGZUYXFnbytwWDFNY3JZNmg0Q09nOXA4dC9K?=
 =?utf-8?B?blBYWmN2YW5meTFOUHhBQWtsSWVUdE53UGZxVm93MUxjKzhseERNNHpWRnZi?=
 =?utf-8?B?T2JiZTBCT2lzRHg1MTBaUmpsL1lBWThLK0Z3bXQxS1NwWU51eTg3L20rWVcr?=
 =?utf-8?B?RE14c1hWQitjUk16d0FML3lWTnE5WFBWMTVIMUxCK2VJNmRqYjQzNVpjWGZh?=
 =?utf-8?B?SUFTa2Rhc0FqN1pLN0Fhb0F2ZlJhSEExNzhYN0VLSldEbTdHV1BCTzlic3JM?=
 =?utf-8?B?ekdPY0w3NUpJeVlzcFE2R2ozamcvc3F0bEttdWRNV0dQREJXS1cwT1Q2UWlB?=
 =?utf-8?B?djlPZ0ptQm80dk5URUs0N0JBRUVvcy84eHFNMnJhYTNHeGNFYXh6QTB5Wml5?=
 =?utf-8?B?eHFlUytlaDI2eTNwZEVMWDEvbEJFakNDOVBiTWd5QXBuNUxqa0Q4MklqSlVW?=
 =?utf-8?B?Q2RHK1RiVFR0Qk1FMjFHZGNvaTQ1U0xQVUUvNm4vWnV0RTM2REZZcXEwdUZ1?=
 =?utf-8?B?UHkrbUxCRWs1WnI5ZHlqREdSWEhsMS9EcDExWGZoWjFBdHRBTUhJVjI4OEFF?=
 =?utf-8?B?eTEzcDJnTmtUOElPeTlLdmMzak05bm9iMlgxWVVJbVRNTEZCMjhvQU1INUFC?=
 =?utf-8?Q?quzhc0n3UWMi3d90nvaleB0bhdym+n3p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUQySXZGZWJFZDNMcDJ6MUpjS1pXTjJhZE1VVExzNEpaUlcwbTdCYXZ0MTYz?=
 =?utf-8?B?RmV2b0hOWGZDdVgzUHQ2eUYxWXVXOGdNaGNLM2I1THljd2ZoTUdKcWFUcTBW?=
 =?utf-8?B?bXdxUzBTMWl0eFY2emNOVzlXdGNjSnZqTG8xODNleHlCbWI3eGZvU1R1cktB?=
 =?utf-8?B?TjJuem82K3VmSFZsdXgxZXpDQ2dRaWtjVmFBejlHMDBFOU85Q0JzeTBtdW9V?=
 =?utf-8?B?ODNzQmpOMTZXUkEwZXRpSmpWUHhQcmlKbUIrTkcvMFNPVXozUWFVRHdYRG5C?=
 =?utf-8?B?Vm5RSmZJRytGT1pJNEo5d2RjZzYreXhMT3F5MDhPTmpGamQzU3JLbi9TdWNK?=
 =?utf-8?B?c08xWE9hM0VSRWprdTk5Sm1yMTA2T3k5dkhsYUUrblF1WEF4enhlTzVueis1?=
 =?utf-8?B?NGVlbXR4a3haeTZaeElNK1c1SVRvNEZUVGtNY01UOFA1cFM4R1NZUnRaNm55?=
 =?utf-8?B?U2Z4TXhwL2VnOWFyenlHYkIrYzB0MlVtaWhWUFZLYjNMZG1BVk8rWHZucDVp?=
 =?utf-8?B?S1M1WmRVLzQzT3ZqejhaOWhWN3crTmU1NllBdUxjZjUwWWtYclpJc0w4YnJY?=
 =?utf-8?B?bDZiaFAvb2dzK1RwZUhIcHUwT3Zvb3Q1RzVyMmRYZWdrTnZDK0UrNytCM3Nm?=
 =?utf-8?B?eVJaZzdxU3lvOUtYaFBlVDA0RytSZ0oxNXYyZldXUGtxRkhUc3JCWkhGcWt0?=
 =?utf-8?B?S2h3ZnE0TGhaUUtBcEdDRU80KytscWEwMG5DVzBlVENOVGZqdzd2Y2NrRmE2?=
 =?utf-8?B?MUdMWXA1bHdqNnVuZmtWWWZBM2YwTHM1MkxHUnBnVGF2cHpsMnl0WHBVZGxN?=
 =?utf-8?B?OVo0V2NicmozQmlWQVBCYWZTd2dZVktCVmY3WVpJRnhybEdUNmNMaG5lWnZK?=
 =?utf-8?B?cno3c2pzeTJoS3dvZVdUWlNYb0pBRHBmdjMyTTE1bHpDS0NlMlBiamYraUU5?=
 =?utf-8?B?enB5enFrNWkwWk1OQysyZ1VvZUkzNCtjZkxxYXhNVk92bXhQRUdrYXhvbktj?=
 =?utf-8?B?TmJqLzBod2RXdnJXcElRZU5UN3BmTVFtWVJ6YzE1NWFqa3RGNXc0TTMwcjA4?=
 =?utf-8?B?bEVncEhQL29JWWp5WXlVL0pRSG55U3RMK3V4d0dOSVpzZWlyUjVjdUFvNUZ0?=
 =?utf-8?B?U0lLT21GR3d2U2hZejVnTmFJU1VQWVlENThKbjdLSDFod1hBY1l0U1N5WWZM?=
 =?utf-8?B?TFA5bUtGM2RPa3ZONGNvNUZMdHd5bnF6dEx1MERiUjk2ZFRQVWZuMTFydWFL?=
 =?utf-8?B?RUVXRk9tbGc3L3YvZXpjc2NleFRhQitMaU5GamQzbEFjUzhhUnlUcXk0ZzAw?=
 =?utf-8?B?R3orMzNKUUNZZmdHaml0WWtxY01sUS9kS3d0WStjb2xndmRqSkVkTVdGeEta?=
 =?utf-8?B?cUlBbDdyWE5VRWZuSng5YVNZMVNDV2U5RmZTa01FMXlPSEJkZUoveHhiZkRC?=
 =?utf-8?B?aysyeFdqRVRSeHNOMjhZTkZkVHJRODlka0ZHUjFSN3MvbXJuVGtKU1ZBTmxh?=
 =?utf-8?B?NWJqQk9WQktWOERrYTQ4YU1Vb1dtZ29XNDdsYm5pWEhDci9ub1g4bkNCOVZW?=
 =?utf-8?B?V0IxR0wvamxFS2oxREUwNThtVUk1M0VCRFJsSzRhaFNQTFp1aVRMSWtkMi9v?=
 =?utf-8?B?ajV0eWJrN3RVUERUekNNQ2FQT2lrb3p2UnRSeGJLVkhySXpiSkVVQ0xuNmk4?=
 =?utf-8?B?S2JSZ2hqanBuWHFzbVZyRmRsanVzelppalRsMDZCcGFHeFFEaURpSjF5Qko3?=
 =?utf-8?B?SUIwR2F5VEJEZEVQNWEwdHBtYUlpU3BhY3pKNndFR2lzVzFveGErU2w5dmhE?=
 =?utf-8?B?SmpwMmRYVWo2L2tUN3UzcHlQVUVka3VHVTZmQ3kwRVRCMlNuUDFOcklLdXJV?=
 =?utf-8?B?WmFqMm9TQ2VXakJjMnJFTDNPUHR3S2hvU1Q0OU9Vby93eVRra3JJRCs3TnlT?=
 =?utf-8?B?dHRieUQxM2hWOVU3KzZ2emgwMnkyczNGaWd0ZnlVWXRtZFJDWjZUSjFKdEp2?=
 =?utf-8?B?ZmpzWEF1bkdKN2RKZ2UvTUw2TVlCY01EMFZCN3haWFV2aTg5WjA0L2RUZUwz?=
 =?utf-8?B?N1JydVdBRFRmaENJemxwdVgvcFJTZXRQeXZCL0lGZkhhenR6U1M2SVd0QklW?=
 =?utf-8?Q?ph1decsOQmcWCNI67zR1W7NmS?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f83efd-8813-4121-6028-08de2cdf1bda
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 11:29:49.1857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/XiL9tB1wdJpn0OUtXEeFRdQWho6iFLiniLn6KEh3iGtaHmdZInwWtqatz1ZHrNRqnoUsOegFEPO1wgXNHmdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5489

The current hook placement in domain_{,un}pause() calls arch_domain_pause()
unconditionally, regardless of whether the domain is already paused or not
unpaused (so no state change).  However the underlying Viridian unpause
function (time_ref_count_thaw()) expects the call to only be done once
there's a transition from paused to active.

Adjust the calling of arch_domain_{,un}pause() so it's only done for state
changes, to accommodate for the behavior expected by the Viridian hooks.
Note there are no other implementations of arch_domain_{,un}pause() apart
from the Viridian use cases, and hence the change is non-functional for all
other architectures (or for x86 if Viridian is disabled).

Fixes: f6a07643e1cc ('x86/viridian: freeze time reference counter when domain is paused')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/domain.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 3b6e9471c413..e0ca71a53bc1 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1547,8 +1547,7 @@ int vcpu_unpause_by_systemcontroller(struct vcpu *v)
 static void _domain_pause(struct domain *d, bool sync)
 {
     struct vcpu *v;
-
-    atomic_inc(&d->pause_count);
+    bool was_paused = atomic_inc_return(&d->pause_count) - 1;
 
     if ( sync )
         for_each_vcpu ( d, v )
@@ -1557,7 +1556,8 @@ static void _domain_pause(struct domain *d, bool sync)
         for_each_vcpu ( d, v )
             vcpu_sleep_nosync(v);
 
-    arch_domain_pause(d);
+    if ( !was_paused )
+        arch_domain_pause(d);
 }
 
 void domain_pause(struct domain *d)
@@ -1575,11 +1575,12 @@ void domain_unpause(struct domain *d)
 {
     struct vcpu *v;
 
-    arch_domain_unpause(d);
-
     if ( atomic_dec_and_test(&d->pause_count) )
+    {
+        arch_domain_unpause(d);
         for_each_vcpu( d, v )
             vcpu_wake(v);
+    }
 }
 
 static int _domain_pause_by_systemcontroller(struct domain *d, bool sync)
-- 
2.51.0


