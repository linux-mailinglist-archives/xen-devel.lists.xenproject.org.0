Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B8MGTHqimk8OwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 09:20:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B092E1182AA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 09:20:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226114.1532652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpiyB-0005rk-Km; Tue, 10 Feb 2026 08:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226114.1532652; Tue, 10 Feb 2026 08:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpiyB-0005pu-I3; Tue, 10 Feb 2026 08:19:39 +0000
Received: by outflank-mailman (input) for mailman id 1226114;
 Tue, 10 Feb 2026 08:19:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpiy9-0005pl-Si
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 08:19:37 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39997f3a-0659-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 09:19:32 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6499.namprd03.prod.outlook.com (2603:10b6:806:1c6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 08:19:28 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 08:19:28 +0000
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
X-Inumbo-ID: 39997f3a-0659-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boXfZKtd2H6gf7c9PtV723ZqzjMvNamei7eWWuuNzQckMm0fjeIPJPA+ePYHDcGBvBjKBwCkgrmTpfo52nsOudwNxSysTSnjmq33aG7JAHm3qmDUlOE2U4wtZPjF/EBzVs3UR+fY2BcbQZ51J+1cCoXmIsIsGbTJ6xOn7MjD+QAsfM73q70LluxJ5p4qEywcn/tUVv177a3i9xx3gTEzsVbpEZ/m7Ve+qy/AimWVWhDM3zp988mCJStycsO5qTXvuefei2GLsTwcxt75n5d5GYazjKo4yigCgaRN0qUjICehmZwPiag0e0BafXHO/wakfQ0Q1/SpQq8V0Zvailmhqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6d7WkdiOukGoroYEDRoKFdd3u/gbnbCvVbVXG9ZfRg=;
 b=q0b1X34paX0X2PQcs/zAiKA+y2Q4J4b0EXah32+8yHrNVtKQeHj/Vdboh50o5nKgGmGgPvAYj9U3EAMMUYA7F7mKM8knbs+C5AY4WFIp4v4QivscPj/X9zVXTT3Jtc46qufnKqVBlTfEPGnHDxJtjQ1qotfAXQbaYLgKQlA0ECSodDfDEXMzO4lBQO5CQ6ZuNJPg9dxSC1qPcvIQDwanqMKV5aBP1T+xsFyrwAvS+xWmn2stul8R/90+TazFLRebPMzNtbpVNhjvuw0sEwesvqj2QJEBSmHRtsLx8gB3ITgcz/90LrGFHBDMYNNUOEDHVgLQ/++xj1JHGOXpgJjRlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6d7WkdiOukGoroYEDRoKFdd3u/gbnbCvVbVXG9ZfRg=;
 b=tY4nfUQVtAekxHfgqEQL53gh4BpzIw1g1YxgzKROIaQGZigQqHXDyW1IW7SclcyRX9Vz7av2DBUSgAXC1/po2N9w/DoCdgiEkk2IUc2eWT6M+pne+rw2t62jmQSA0qW+6u60zXvwTt7lr6wqP+syHKXnMTsvSajjNp6MNx9CSxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 Feb 2026 09:19:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 01/12] x86: Reject CPU policies with vendors other than
 the host's
Message-ID: <aYrqDLFGqEVYMyU1@Mac.lan>
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206161539.209922-2-alejandro.garciavallejo@amd.com>
X-ClientProxiedBy: MA2P292CA0029.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::19)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b86cf3-a180-4af5-c822-08de687d1bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3YzTTNERDh3a1d6Z2IrTFZ2MURuc0lrckpsMTJJYTJ3NHFxZitXejBrQXdt?=
 =?utf-8?B?UExURWRIZXNDZlBFMEtNa1llQTd4NlNNL2N4bWpYdFpUTjR3c0djUTRHK2l3?=
 =?utf-8?B?T285UkVlY2huUnhvaWdCL3h6bkhqdVNTb3hPaitYV01TZkZVeGdHeUtpbmtq?=
 =?utf-8?B?SUJSM3NwU0hmY2o2aXVMUFBFVjNOQU5vOXR2VkdoSlYySHI1QVEzREZuZ0cw?=
 =?utf-8?B?Vi9RbElYdGgwYk0ralVUTitKNXkraGlKak1ySzVHWWR0L2JTSlcvZlcwTHJx?=
 =?utf-8?B?Yzk0YlBEM3ZVWGRqSjdhcldxQzlCTEFYaE5DYmVMZlhPMFVET3RVM1FFSThu?=
 =?utf-8?B?dGxJSzlpdk9iU1lRNFduNG9kUHNQWENjaVY5SVlWalRQRkszdjZEc044TjB4?=
 =?utf-8?B?YnlGQ3ZxazdnR2dndjZJL2ZTYXkxZmsxNzFYRTNiOURPejladUdtOVNIZ0Rt?=
 =?utf-8?B?MTBERDRaN2ZQRVpjMGdqWEtBdEZCWWtJUGt0dG5kUUpHRTBub0FUTTRXSEtk?=
 =?utf-8?B?T3dLZ0RrbUVJaDk3ZHV4UmFtSndDUnNkR1FkY3haV0NhY3N4bGdCd3RCS3kz?=
 =?utf-8?B?bjRjUjNoeGNlLzc4QnNlc29zYUErVzRMQVJrODVNeXhCbTZiemxVTTNpbUEy?=
 =?utf-8?B?VVRaRDdnd0ZjZXFjcGtkZ2VUdmUzMlZ3WExDbisxb25GME1wRXF0U1Awc1RZ?=
 =?utf-8?B?Qy9yYm90UUI4bmN6cmJVamRMenpFc25YaVBKYXh1ZWJuSGUyclFVM1NPKzdR?=
 =?utf-8?B?TE9WVHhqQ0l4ZUdDV2ZFS08zWHVPYVRwRUx6ZHJxaHNuTm5BdDNvazd0dy9v?=
 =?utf-8?B?V3MwT3poTjFmVHlNSmpvVWRiUE9zYUZYdDV4ZzNHQ1ZYUWtENWptOXlxRTdH?=
 =?utf-8?B?TVNjSWpEWi90bkRNNW9CTHJWVXlSS3BmNVFLV29oaWY5TWo1VDZlcnBubGlh?=
 =?utf-8?B?VzVTVUczeEI0ZENORHNxTzRVUmNNbFJ3Tyt5V1AzdlkrNlhmVTIxaVl6WjYv?=
 =?utf-8?B?anE1ekN0bnZ2QnYxbVJRcjhVaGpyYlc2M3Vib1A2M0Q5RmNjNDFnZ21oakd1?=
 =?utf-8?B?ZTJpWFJ0VU1hZlEyYnh1dm02VWlrb0tRRTVLMENLa2h0ai8yMkRBSGtFeEw1?=
 =?utf-8?B?YXZERzN0a3JKYWlwVG1BR3hVOVg0RGhyNmVhMTl2dm1BMG1veVV3Sk90VnRU?=
 =?utf-8?B?RjlHQzFPcmExSVdTNG83YjZDSjc3TFdrdHJ5TWNHNTdCY1FPejJSOS9SQVpJ?=
 =?utf-8?B?c2V6SVVINGtUd3VoTG1hUzhNaU05MWZmSnN1ZW1mVEZId3M5Q3pqS1V4clFp?=
 =?utf-8?B?blBPMWQxTExXWDJMMVVtZVJiTHNveUsyZHhZY3hCM2QwZjVnblZHcmlnMmM1?=
 =?utf-8?B?WkJwOWJBaEEvSXZnOXdXTGNKR1p0UVR4ZC9OeVRNWVZTMHRLNnA5UEtDVTJD?=
 =?utf-8?B?SEx6eWhSVXZoci9wSThMN3JINzIxeEZISUY2MUdQVlB2MmxZTWFwNzdRbytw?=
 =?utf-8?B?WHNqYkFCWVNYeERVS21lYnQvUlJnaHpJc0RaRlVQMTdiYVhONlJWazVPNy8z?=
 =?utf-8?B?ZUlhSENqdGtBUFI2QVBJZG9xZHp2NjdIa3pvZ2phdEpqOEFJQ0VtVU5XNTVi?=
 =?utf-8?B?RUJlRnZ4VkZUczlJeEJ5WjRraXU2eUx5aFRMaFN3RTVlRDhzbTk5K3Z0RzRv?=
 =?utf-8?B?K1NxazBuM25HVDM3Y2tsdU5SaFVKTG01L3V4MFRSa1NWcHdDY0FVOHBaNjg2?=
 =?utf-8?B?eHhsOGlUVW5rbDF6OU9iVlZ2aWdIejRodDRhakVDbWJTN0dsK2dISE5ibEZ6?=
 =?utf-8?B?YjRmT05nOU5aWURpa2RQTlhCT3BiQjNsSSt4MGp3anVlTUsxQkZ5RXJZZWox?=
 =?utf-8?B?VTFuQjlEeTB5U0pKUlB5V0Zib3N4ZUROL09aSzFLTFdrZDBIRlU3eU4yVFNI?=
 =?utf-8?B?YzlPYit6cnZhRWNyaW9VQ09UNUNkV1pTdktLdXZtSHkzRXVGRlZtQjFvVlFF?=
 =?utf-8?B?bkhQRXFEck1JTDRVZE0wcDVrOXRGU05RYi9IZEdHSzY1anhqK3RVcVpKU3lS?=
 =?utf-8?B?NnJvRzZIWEFUZk1KZGMyTlV2SEkvdjl0dnUxTE9EbmhrR3U3Ukw5NUpoSWYy?=
 =?utf-8?Q?opHs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXlKNGFvZE91U2ZGQjNtNzVrb2Vua0xPSlVhbGNQYU5nWjJQOGhvZ3VZMENZ?=
 =?utf-8?B?ZWpnR3V4NC9qaGNucG5DVVVvOFFsQzU5dTBocUFRQnVKZkpFVmZTclZWZVFK?=
 =?utf-8?B?Tmt2OEN6am9FSUdMbWROVjVQSmI2QXlTZ2JPdmo0bVU3L3ZrSWVIblgzY282?=
 =?utf-8?B?ZmRVR0IrdUYvVzN1WktldC9mcUJ3YnJENjMrOWtUbjFkajR6NzlXK3Z5OTlH?=
 =?utf-8?B?UUkxeDVVM3BLVVVZQzFyZWRlWlByRFcza0tlWkRNQlZkRlRmNUhnUURvR3Jo?=
 =?utf-8?B?TmdsUjA2aGRqNndxZENGVWxVa08yYXREVUwwcmVLeEJET2Y1a21VcUNQMGFu?=
 =?utf-8?B?bGN4TkhGcCt5VFBrUG1sd1pKN0xld2hDaC8wTEVnTUZwcDVyM2tUNlI2eGN4?=
 =?utf-8?B?RFhNWFRJUDRCdEszWU13WXJxVE5XZit0RTgzVXZhSUpHaVZDTXdhTklEUUpH?=
 =?utf-8?B?OHBzUUdIVG9jMUpmNjlkSitPZk1RRFFseVh0Qm05ZTFKYk96aGJ5dkRYYzBz?=
 =?utf-8?B?SU55eFVhK1cxRFp4UjJBSktzVElpODkrSkNzWCs0WXFkR2l0RC81L0JNZkpu?=
 =?utf-8?B?STd1RHBjVWNGVmVEd0ZQU2xBdWlidkxkQTZHTFlkWnh1WExzUWM1RHdlMTlp?=
 =?utf-8?B?V25EQnlUV2M2bFk3eEZHVk9ORWZkcGpwbmhkY3lJWlZCTTVLaWNGUU8xZWc0?=
 =?utf-8?B?L1owMmViSXArd0twL1dsbzdrcmViNWtFa081R1NLdEhXRmRpVmhDYXg2Nzl4?=
 =?utf-8?B?eXN4aW5zRkFXc0k4NTZYaEtQQmRmNGY4VldxV0hzV0luQ0lGcjNHamZTUThX?=
 =?utf-8?B?NWdJcDR2VWp4cHVJSk9TcElBcmZkVjN2L0lwY0FQSmNZcisxQjhvMkNZNFRX?=
 =?utf-8?B?TjhLb3dBYjNNY3REc3Q4N21VdkFReGgrYVBxVGFyb1pUejQ0ZmNQS20xc216?=
 =?utf-8?B?VHROYUl5OTVqQVg4b09GYWlvdERsWlIvM1NEWTF3NzlyRFU2MC85eC9sVWxu?=
 =?utf-8?B?QnBBVHptdk1wVjJNbkQ4TFljbmNGL3Z2WFhMSGJLUTQ2dDJjMjUydGZwb0tw?=
 =?utf-8?B?bnFPVkJGOEZFU1hYMHJuRUxySkhnbnVobGc5OFlNZjc2R3JzK29zQkthbnpk?=
 =?utf-8?B?eURHMXBJNVgwQ3R4YUcvbEVGUHNoeWtiTTl0QXhlOGxQVmN3cHZ0cEt4WkFV?=
 =?utf-8?B?K1JQbjJ2b3I5UlFjbG56Mm55b1hkaUZRNnlpM3Fjbk0zMkg2U1RVMzBrdnl1?=
 =?utf-8?B?eHNzckpJUGIwWHh4dzBtNlRkTlhaU0ZCS0ZCcEFsT0Z1cDQrZ21IMVBlUGJC?=
 =?utf-8?B?cEMvbWJoMHVnM1BJV2N6eHJScnlweGwweHZnZEtyOHJhKzUyZExLd3dBUEc4?=
 =?utf-8?B?SGRraDN5VWtKNW9xNE44a3hXRzR5VjAvVFlmd0YxbmRaT3kwWW5zZWljYUph?=
 =?utf-8?B?K2svZ2hCOTJYRzRYQXVDQmVWeUJmNkg4V2dEUUtuU0NYWkREK2ttZ3pPcmJv?=
 =?utf-8?B?bkt4UG9wYW51Q2g0UlZaaTdnTm1wdHJ5aWZONzRGcTRFTlRIN3dtTEFEUUEr?=
 =?utf-8?B?N1djZGd0ZXlpVElFZFBZUjZNMHBZa3NQZHZ3ODBKbmJsQkJZcE84NkFMMWpq?=
 =?utf-8?B?bExLT2d1c21PZlBSaU1wV1hLMk52TURpNCtWRTVHVjZrOHRYMEdZQXIwWUJq?=
 =?utf-8?B?djdzY2xneEdvSGV4bkR5SjJoTU1GdHM2VmgwM3ovUkpWVkxJSWgvMmszcU4v?=
 =?utf-8?B?aXVKOGtxdS9Gdy9rWjgxbDh3RUpFNTgySmRDRk10NEsvTERRUEdkb1V4NVhj?=
 =?utf-8?B?MDRaQzl4ZzJJbTFoVFFjRFBxRGZTTTFlL0dxYUN4ZjBpMU81dU9pNG4rbExr?=
 =?utf-8?B?NG1UMmNHM1lNN3h1Z29Cb2JnT3ZnY3NHdUhwYjlZNXZQVVpDWDQyREpZMDZm?=
 =?utf-8?B?bCtLUGdtRUl0SUNobnEzSnpKUU9jdDBYczRRNERzWWFUZE1tcEQxYXVLVVh1?=
 =?utf-8?B?VGZSSThiUFVQbXcra0dJVGs3NGMyaU1oU1AwQ2ZkeUxsSjlLRDVURjc0VkhF?=
 =?utf-8?B?K2hCbmFOS3ZXQW5sRVlUL0p0aVN1RHlETUt1RjFnNjFhenhHbjR4dS9LNjVJ?=
 =?utf-8?B?b2xhaVlJV0xvTlZnSkxHTTdIVG4ramtScVlBWU9GTTlIMFJheGFpRklNWUND?=
 =?utf-8?B?UVYyQmY3WTV5bzQzUnBxdndOS3FOL0kwVmozOE5QaUN0eXk1d1R2V1o2UUV1?=
 =?utf-8?B?Z3pzZ0c2WDIxdFVqVWRQNWJ3WFZNbkd2WnNYdUhFODBOeDdMMTk4YzRLV2tM?=
 =?utf-8?B?cGVFUDA3bjZTU1V2dGFRV3ZnZkpvU1RBYWsxczQvMVVDYmM2bVA1QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b86cf3-a180-4af5-c822-08de687d1bc4
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 08:19:28.1643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gjloRBUME058aZ86aQVqJ9aBXOImfKfB/awwEuNEAdeX3TLKSt9/EtbiLNKTBQNJLQ5PfRZYo2HPlOnlhx9cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6499
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B092E1182AA
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 05:15:23PM +0100, Alejandro Vallejo wrote:
> While in principle it's possible to have a vendor virtualising another,
> this is fairly tricky in practice. Not doing so enables certain
> optimisations with regards to vendor checks in later patches.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> Patch 1 from the cross-vendor series. Do not merge here. It's simply for
> consistency.
> ---
>  xen/lib/x86/policy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
> index f033d22785..079c42a29b 100644
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -15,7 +15,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>  #define FAIL_MSR(m) \
>      do { e.msr = (m); goto out; } while ( 0 )
>  
> -    if ( guest->basic.max_leaf > host->basic.max_leaf )
> +    if ( (guest->x86_vendor     != host->x86_vendor) ||
> +         (guest->basic.max_leaf >  host->basic.max_leaf) )

You possibly want to expand test-cpu-policy.c to add a small test to
ensure this works as expected?  Not that it shouldn't, but it's
trivial to expand test_is_compatible_{success,failure}() to add a
small test for the vendor checking.

Thanks, Roger.

