Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A013CD0540C
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 18:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197940.1515270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vduFU-00016b-3f; Thu, 08 Jan 2026 17:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197940.1515270; Thu, 08 Jan 2026 17:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vduFU-00015B-0S; Thu, 08 Jan 2026 17:56:40 +0000
Received: by outflank-mailman (input) for mailman id 1197940;
 Thu, 08 Jan 2026 17:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIqS=7N=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vduFS-00014Y-1h
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 17:56:38 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f3530b8-ecbb-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 18:56:36 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7280.namprd03.prod.outlook.com (2603:10b6:8:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 17:56:30 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 17:56:30 +0000
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
X-Inumbo-ID: 5f3530b8-ecbb-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfYFPNA7m1z8GsR2AuxL3InBeulai2XHmwv9+ur2wcftbYFyy4FtPklQ86eGNq/zSZ53k7IeyJK2pjz2gssDJM/zh27x7SDjkjmVbiEbGok+vBE4xTp7TvUZqemgTFhoRUeTqtUfJyauJWmCJWk3Shu3Xs2csSlj8OCmaN12Fc2HDgdcFbBEbZePMpbrHQDxJ5mzpgC21UJUSSwY3SfwtcG3qthnLu3VNbZpVPVg/XPets0AvJ0y2vMGndQhHI3FzLziR46UTvBe9MCL0VkBUFVPSJNuTI+eMkuY1XVdIYsMC4LHKlkWzpfntosGkI67bmKKXERVHqtaIlby0Ctx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHF3JH2r9EdzeDRKKZ9IR6O2GGBdfVMXJ85DPH2YZJI=;
 b=gG4/CCnW9w1VH3qOKaT3PwYgKTfeqaJOBoPnNy0BlqCdrcr4go6fNYrhURPV0yQ0CZCSRx1hxsSkepm3Z3oX0zFVwZtuePKJBJKmTV2Ph3IDu4GQQnDCU+Upft5c78mB4NAeh8D9kUBmMCtn/sn6vc3bY0yHqAajAYaU5mY72WlBIvJdgwhO/Gd5CUk2oWn0IyvvBt4EbNf5FZ8gxoPr69lVjLIqRxMGXNoYIjfilVm3XhbCkRpgHn1rvBkvlxTmyAfkOhW80/2RHiIEwRYnvYlB6BXViwltbSIsAx+Y2+/7dv5mntwoJ+ekm2zGkzmIlDMMsFU+QP5+navPcMa9yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHF3JH2r9EdzeDRKKZ9IR6O2GGBdfVMXJ85DPH2YZJI=;
 b=Lo3oZtmnqUK5RjwVzafaDGXRcYdRoYNsS7/sh5eE3yBhia1Dkp24Dbj6mDkAOQ97i0i6LzSzPUD7UgxmvoWVBLuWUjqOlzYB01RDFqNRBF3xLSrXJa5LyOij1f7dm3aJ0kW5/stNikkqNe2wHjU+QofF2/r7Z60uYrkNxREv+Vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] xen/mm: limit in-place scrubbing
Date: Thu,  8 Jan 2026 18:55:34 +0100
Message-ID: <20260108175536.82153-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0026.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc9c191-d247-48b1-d667-08de4edf4090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTk2QWxVTUt3RDFzaGJmS01zS3JhQ2dqcmdIaW9KR08ySGVidExNM1VtZEl0?=
 =?utf-8?B?QVRjSDNqQWcvbUJqSGNFVGxPTFRrRUJ4WHAzNENvZDVqQVZLYys4SUpReE9n?=
 =?utf-8?B?dFFDejVqdWR0ZS9LYWx6TVlNWm85ZUJBaExGOFR5ZXNCVCtDMzFmdEpiV1h1?=
 =?utf-8?B?ZUtNellDNGJ0OExzM3B6OExqQ3p0N3FUWU9zUE83NHpmeHhRTHNGVFdJSTNo?=
 =?utf-8?B?ZVhCT2ZUMDZvUnRQcTkxZzZ4a29OLytHVWUxT1NLTUFJTzdxQURtbE54VmF6?=
 =?utf-8?B?dU1lMm44cGZMTHNVcEEyTnc3NFFNcHNwd2lWcTBESUxSVmk3dXhETlRtNGwx?=
 =?utf-8?B?VTREN3FUWTVQSlRzbmZXVmNYVHBWdVc2S1BiTXdHRGpRLzc0QTJPeW9oYlZq?=
 =?utf-8?B?ckZaZzdXVEMxditCZHE4emlSQW9GRlBCc01GTEErK0JNWW9BNDA1YWljT1Vn?=
 =?utf-8?B?Y2VxNXpHU1l6b3lKQ054QlRKZU9ObHFZZE0rSFdPdmhFb29LN24vOGl3V2o5?=
 =?utf-8?B?RjNOVFlKUEFSTU1XdXFhWUVFSGNXV1NLRjRoU3VrSXBSbW9Vd0pONGFlYU9W?=
 =?utf-8?B?dExoMVowMzdxZ2ZKbXQ1QkJjRzhvQ0diS0dPOWFlMWkyelZlekovMWhoZW1K?=
 =?utf-8?B?T1Mwb1d4SFczbHBWUHBTV3RjNDk4MC85SkVPVUlhOGx3TzczaS82M0hYK0hB?=
 =?utf-8?B?V2g3cEJ1S05wOE1sSDlKaWNZRkp6WW5Dc3NYVUczZkxNK1I1RjMwRlFsYkxk?=
 =?utf-8?B?T1FXcXR5WVIxQS9YWE42RlFFVzZ2WHNpRkVaUUZqTlMzZ2lYNVNOMEVudE80?=
 =?utf-8?B?WmU5c3ozR1FQZzQxamZXemErWWtuMWNIbjdLMGxqdFNVL01OaitSc1Q1QXMx?=
 =?utf-8?B?RXlwVVBlSEROdzBVUUxwSG5NWno5dnZqeENPcWJCWlQwSlZvbGhJL0QrYm9M?=
 =?utf-8?B?bXJsLzJDT3p3WS9DN3BXTG5BeGpwQkI2TVkvQXM1c1MwVUlXb01pZW9MQ2RV?=
 =?utf-8?B?eVVJWUhjZXEvN2xGaUcyV2cyR251RWNlQ1BLanQwUWRxb0NXTCtFMzVPZkxZ?=
 =?utf-8?B?MzNnSUNHQ0VPNUxaLzhsSWtOSTkyKzNzZk9tNjFsRUovQ1RPYWsva1VQSlVL?=
 =?utf-8?B?d282Q1ZDMmFmQy9MMTBxMWcrNnY4NFB5Vis1NE1hcTFCcUVlcDZEUnFzbmEx?=
 =?utf-8?B?Tk55V2FnNEE4Rnl4ekhGOHQvOWQrRWZGMXRnejJCRi9SOHRTd1l1WmUyMmc3?=
 =?utf-8?B?dWR1OTVYd28wbVBOTHdDWHo1Y0hQeEU3U09KZS9xZVhaMCsvL2w4d1FDTnpR?=
 =?utf-8?B?OFJadjRvQU04TlN0Mitmd0hRZ2xieVU4WmhES1ZjM0ZVM3BpWHpTbUhBUjB3?=
 =?utf-8?B?ajF1bmJseXNhM2dsMGo3SngwYlRnVjZxRXlmNHFXN0FwdmdFVklOajlHdldJ?=
 =?utf-8?B?R21EU1A1dHl5clE4bXd2bWVIK3l0Q081VGQrUlhXQXR6QTNaSTk0cHBhaW9B?=
 =?utf-8?B?WmM3My9uTEsxbGd5bkR4d0crNFRxcUdEU0w4dGNtMmg4WXRyRVZlekJaUWta?=
 =?utf-8?B?SXJUZ08xT0oySzhOaG9ONmdkK2I2c3grN3QxZWZ2VmZ5ajhLMXc3bEIvbGc1?=
 =?utf-8?B?c0JYTWE5QTJLenRXZWZuSUZubi9PSFllNnpIUVhxQnZodndlaW51bm9ZSU9O?=
 =?utf-8?B?bk5nYmRRaFMyNGZIWStDQUkwbFBLTEd4MTJUWnNNUC8wY2tNVmpndlpqejA5?=
 =?utf-8?B?dVlnUDc4bWhwV080NUNwTkFsRkp5eVIrSUhCeEZSdzdNWHFXa25YQklpakJS?=
 =?utf-8?B?d0tZWGRFR2VkM1NJdTltaXZiUCs2UGVZc1pJc01ocStMZEZjZTI1THU5TVJo?=
 =?utf-8?B?L1czaVVPZEpZTFMvV29kUHJqSGJzYTJhOVliVVQ2bjFkTlZkS0RyM3drVlZo?=
 =?utf-8?Q?Gzzl0Cskkrs/oVPo3evwIRF0XXbbAGRp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WSs3MXUvYkVhU3cxQ2lRS1dPcnd6eTBzaGo1eUtGZ0djUy9UaXYyQnpOVmJP?=
 =?utf-8?B?dU1VbkNCbFpZY25kZnBqT25JNE54Vk1vNHhBSE9oRnVwaTg5TERMUWVjekVj?=
 =?utf-8?B?RFp6aGROUzE0WWtWcldGYTdWSFhIQlQvdElkZFhZZ3AybnZmKzdoeHIzVS9r?=
 =?utf-8?B?WW9WaWhGYTZTZmpkSUMrY3RsM2YvV2xpUFlBdzJHako5cmRWcnlUY2VuZk05?=
 =?utf-8?B?d2ZoMzRoY1dVa2JhemFCNlZVMHlQdkVuV2Z3R2tNQ1ZOaWRFNDFYb3o1Z2xy?=
 =?utf-8?B?RFhNMTVuRkE0ZkFBaVBCZXN3akRjRGhoWWJTZnlOYk0vV2FZTmxFRW94Y0pz?=
 =?utf-8?B?NmE1VlRYdDVLZTlzU1cwM1F0QXo2SExHL1JpaG1VQWRabUhMUjlTcnM5UDU2?=
 =?utf-8?B?RnVMTkZTdFhtYUoydnozYjFVYWVJN05KcWdzbGtxbGxSM2RpcDV6dTR0d1Iy?=
 =?utf-8?B?QXo4WFRrSmRJeUtnNGppdGlISDFSVzhGcURZUXZScW1vN2JTRGhQSkFST3J3?=
 =?utf-8?B?Wkp0dGlRa0h4R1Y1NEl6MlArZWovS3IvTWw2Y3NTajFTTEx4ZG1ranlmVGhh?=
 =?utf-8?B?SytsUnZRZTZoamFRWUJpN0lEaGJ6RW5wSzM1TGJ5RWExRnhNRXIxMnZPTm8v?=
 =?utf-8?B?VjFWcUdqU0MvNjhaZjA4NmFSdGt0N0Zab21uUktJQy9HZGxnNjZkWWdNT1kr?=
 =?utf-8?B?dWN6ZjlRYW10bDJwaFFYMU9lRHBlc1pVZzZpS25QcGdMV2FVbTlDZGFnTnV4?=
 =?utf-8?B?NE90dkN5K0dBUUF5aktKRkhNOGJkc2RYQWkyVmk2ajcvOHIwbHBFTFlBM2VZ?=
 =?utf-8?B?b3ZwOWduSS83dkZ0dWR0VGROVHJUNjBZYThnUjhRdnArS2JiUUdISHBNODJZ?=
 =?utf-8?B?elFyOGxDczl3TUpTak9SSUI0WUMxeTFQS1drUGI2YVpWL2l6dGlFK2ZRT05v?=
 =?utf-8?B?Unl6MU9paE03aW14WTJ5RHZxOXhQZ2YrRjkyek1mc09BajY0cFNRbUxoWWhG?=
 =?utf-8?B?bWdZY0IzSW9rNVlJbGZtS25ydmxVWTByTDNWTnlCZFF5Z0VmRUdDVVhQQld1?=
 =?utf-8?B?cUpnSC8vLzR4Qmx6UEd0TlR2NHNMd0dXQVhCUG5CTkppWDZlQ01tcWlpSDVi?=
 =?utf-8?B?YkM1QlN5a1FQM0hiYzJLNFN6Y0xaeFhKeXNFZ3pENlZldWZ2RWQ4ZnJTSW9n?=
 =?utf-8?B?NHk5V0ZiRUg2Rzd2eDhUeUFTTkVjb3ZOeUpGUXg3MlhNakJQeC9RbzdvbEZY?=
 =?utf-8?B?SnYxdG5GakdLdzlFdVdhcFJzVWlyN3dHTkpDaTh3Zzc0TlkxZUN6WXowZ1gr?=
 =?utf-8?B?bEpsVy9QYytoRlE4emk5TFVkMC9ZaDFVTjErTUs3YWRoeENvTmxNaTczaXpD?=
 =?utf-8?B?OUZ3ZWlvTEZVUklUd2xOWHJTYmJ5blFwSkdHVzFrczV6NUxpWTQ2NnVOWk9D?=
 =?utf-8?B?U013VGdUN2Fjbi9kN1BFVnIxQU1nb2JyNS8vYkpzQWRrR0R4YlJrK3Fvank0?=
 =?utf-8?B?TFVhaXJrZ2dYRmhGVTZZR3FjY3lCWHo4YWtSWkdtRHdSdUhSTmxFRXlSMFI3?=
 =?utf-8?B?di9CSGJkdzFHTTE1dFUwZTRIUWcyMXY1ZmVtLzdpTW9HYlZ1NGczcTV3Zkds?=
 =?utf-8?B?YnAvOXBEdVZVc0p4NUU2MXB1dXJOOHhkeGNMd3pxQ2N4TjBzT29rU2tTS28x?=
 =?utf-8?B?WEJFT3NvRVpNZzROc21uOVNscVhZdEtLd3loa3d0OU1DNDgyZEtESGlSNzNN?=
 =?utf-8?B?d0dtMXRQQTIxajhmRW9zUkJ6a3lJcExBSWlIaFlxWVVyRkI3NHZjMUVadlpr?=
 =?utf-8?B?cTV5RXQxbEVhcnhIQTlGMktIbms2VkJPbGR6M1l6d3JnVzFiMkZOMGQ1ZlRt?=
 =?utf-8?B?QlJWYk9PVytmdllnZVZGd2VGS1phckFEMmlENGtNTjRISGZNT0wxd0JhUllm?=
 =?utf-8?B?dW41SEtUNGZmWURZcWFoZnp3anoyampmbFJiWHBIYkZZZldQR2o1ZVBmNGRI?=
 =?utf-8?B?ZGwwNVdTbFNDYlIxQ2JtV2NCa1F3ZE92a2lDblB4d1NudXdqNEQ1dzNYT0FK?=
 =?utf-8?B?WGxtVWJNSDc1UEgzQ0tOMWVPRG4rYjdLOXRiRk1HQjFuSGNyQzlJelY5c0cz?=
 =?utf-8?B?bVVGVmtyOVF5VnkrOWFGK3ZNVXcxbW5VNTd4V1lsWEw4VjI3TlFLQ25WNEdE?=
 =?utf-8?B?WW9aTFU5YVdnMHlGdWVzMW5KNFp4SHltb0dZaU9weUR2VjRaaHFUM3dtOHhX?=
 =?utf-8?B?UDkxV2dPTDdzVDBDVkxXaW45V1NqU3BMcisvZ1lTR1JDU01FTENaNjIrZVFK?=
 =?utf-8?B?VnlSWVkrZmo3djJuYXNOdWE5UytzRjdneFBuMzBhSm8vdmNmZWpqdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc9c191-d247-48b1-d667-08de4edf4090
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:56:30.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5XRIlI6OlTtPNIGL+oaoDdjFgbak2ZqIhi1G4IenmcKRHT4E3JZWYHJI2gpMx4+28R/tjwra9cvtV40CWbjEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7280

Hello,

In XenServer we have seen the watchdog occasionally triggering during
domain creation if 1GB pages are scrubbed in-place during physmap
population.  The following series attempt to mitigate this by limiting
the in-place scrubbing during allocation to 2M pages, but it has some
drawbacks, see the post-commit remarks in patch 2.

I'm hopping someone might have a better idea, or we converge we can't do
better than this for the time being.

Thanks, Roger.

Roger Pau Monne (2):
  xen/mm: add a NUMA node parameter to scrub_free_pages()
  xen/mm: limit non-scrubbed allocations to a specific order

 xen/arch/arm/domain.c   |  2 +-
 xen/arch/x86/domain.c   |  2 +-
 xen/common/memory.c     | 12 +++++++++
 xen/common/page_alloc.c | 54 +++++++++++++++++++++++++++++++++++++----
 xen/include/xen/mm.h    | 12 ++++++++-
 5 files changed, 74 insertions(+), 8 deletions(-)

-- 
2.51.0


