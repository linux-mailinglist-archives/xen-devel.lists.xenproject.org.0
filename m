Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD5FB0EB07
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 08:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053327.1422084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTN5-0000yF-Bq; Wed, 23 Jul 2025 06:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053327.1422084; Wed, 23 Jul 2025 06:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTN5-0000uf-8R; Wed, 23 Jul 2025 06:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1053327;
 Wed, 23 Jul 2025 06:54:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ad9G=2E=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ueTN3-0000eV-TO
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 06:54:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2416::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e045badc-6791-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 08:54:29 +0200 (CEST)
Received: from IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9)
 by SJ0PR12MB6965.namprd12.prod.outlook.com (2603:10b6:a03:448::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.42; Wed, 23 Jul
 2025 06:54:24 +0000
Received: from IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e]) by IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e%6]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 06:54:24 +0000
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
X-Inumbo-ID: e045badc-6791-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mb4Q4Srh+IafwwHWfAWT48tQ8T6dKvomjCVxmW5QYwg4EHdl/LXtPAQF09u96HiQNVcwaLlpMSNnpmh8pf78dhbAjJMLH8WlU1u4pF8hJ67Gqh+9RedusgqBBOO74BiZKNPOV1pu0r43yY07z3hh0V5fLGXnUE6E2rMXupBXMobUXtGBHPE7vxxrC8W6SRWWFdNuv81euU9/wX+JnW7SYPOmpuYMDn/nJm1OIG4DW8cRy/UinlizQDaOsVD1QNyTzhCSSuOSj7uR1amJjTweLGu0maiddjCQsVjkhFNgxa49K4SNlXXAZgeLHqxUYP3FmlpLUb6Sse+1/WZR1pRTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HB+lBsEdzO3AJi6ipNZzxuCHAqr1ufEcR1/yaZbuq7I=;
 b=dvgN4+WR92q2Hn8yrLwy8oAbWSSeOWmXHwXGlu0nuWtZq9T9bUuvHYuFYG9Y3Fy/gGuXZ7VCzJ1Ha/pSIoqrjd6ynVAQsVPKjC4d1Xjhan75EDckwy2Xizw51rN9SrcVN9Be0FdZ2AGicRyFcjdlzTlsFKsmFFrkdYY1PQGtU3rSK6aYha2LaAx6qOr0e1MV1pM1WguxmbcgoUr2uPwn5D9BMrjS/jgDSz21W8wY/GV01WosCqIhwoo71ehus/sG+Yo6Zu+sVgIOctvZnyIrmqE/sRNzFS/Bta9rWgh6zlNqJlpOTED0FTkz5tGmwt0mMmQT4BkiUOOO2nH8RGf9uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HB+lBsEdzO3AJi6ipNZzxuCHAqr1ufEcR1/yaZbuq7I=;
 b=G+AayMtdzb2Q4XNaqP+24LW/o38UGZKIjcTjF5pgmWgdpnpDJuRwgK3X3XUYMZ+raDXeDeE41hSU71tZEjs0ayp0i5Wq6y8HtsA7ZgBg36T+cLivXRFVfV3lbv31Alm7EQBMb1sLTl8UexQymnnOR+8voXMMmJSkwEt88m3KRv8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, "Orzel, Michal" <Michal.Orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1] xen: move getdomaininfo() to domain.c
Thread-Topic: [PATCH v1] xen: move getdomaininfo() to domain.c
Thread-Index: AQHb+sYi9F4sF9Jjy0ur9mCegpzXYLQ9u1eAgAGEBlA=
Date: Wed, 23 Jul 2025 06:54:24 +0000
Message-ID:
 <IA1PR12MB84674496C6C640BA55B47D12E15FA@IA1PR12MB8467.namprd12.prod.outlook.com>
References: <20250722050410.853783-1-Penny.Zheng@amd.com>
 <0939219f-1c06-4d0d-a427-6b95b5943513@suse.com>
In-Reply-To: <0939219f-1c06-4d0d-a427-6b95b5943513@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-23T06:43:03.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB8467:EE_|SJ0PR12MB6965:EE_
x-ms-office365-filtering-correlation-id: f8fbabd4-60e9-4d76-4519-08ddc9b5c250
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VkNTeFIxVzExcDcxN1V3cnpOTWFBYjkwa0FUTktDWUxTNFNrMW5yS3pIOU9P?=
 =?utf-8?B?TzkrUUVhZGRsdDRiNVJQSC84RkYyZ1VxbDVvbm1wZW1rQ3FMRldnekc5UTFk?=
 =?utf-8?B?YlUzcGNrVi9pVTRqMWV3aW15WTFDMzFxNlFsTkZUYjRaWFM5NllnZnV2SEFO?=
 =?utf-8?B?WVE5ZGpNdSsvblRibnpQQlhCekVMSUxMMEtIUFkxTUZoQ0RXV0pqYjMwcFlZ?=
 =?utf-8?B?Y3NSNzU4SnlDY1dkMUNzbUVpSGdCMmtRdVRJTVo4S3hDOWZaMmNsUnJSMExD?=
 =?utf-8?B?RFhqU3pCWExRQnJnTXk2SHIySVhKU2t1Rjk3RGVLbGpRdTJJQnZ5QjZxMUxJ?=
 =?utf-8?B?ZE8xdEpmK3RBRDAwMGxaaU1HMkx2Y1dSVnJqd0hRMUxDY2ZJL3NVS3VZRk9q?=
 =?utf-8?B?UXV6WERZcSszaE9lR2s2YmVNMDY0cnNRV3JkTGZKU1Mvb1VlN0ZVb2RTb1Bp?=
 =?utf-8?B?SFFQeGpyMTNhZDVOK1Y2K0hHenNxYlREYVNRMVpEZngrZjN6M3Q0NkpTQjVC?=
 =?utf-8?B?a1doOElyTDB6RU5DcGlrV0pUMTNIa2tVK3pHQ1dMOWZmK3plTWo1bFdaLy9D?=
 =?utf-8?B?ZEx6bkdaSWhHYnZyNktYMHNXdiszdGtLajlhdVovaVFLaS9VMmxLSXRyWlc5?=
 =?utf-8?B?N0tHajZKZ2lRL1djZ2VzQXRYYVJRUWRxR1E2OFhjN3JmTGc1UlQwUVAvQ29k?=
 =?utf-8?B?TEpVNkhDUmtxT1JEWEtIbnpCc0xJenZCaFFmSkRPUFQ3MzNRMHNYY1FZUGl6?=
 =?utf-8?B?bXlWczUrSm0waGo5QVV5cVljYVdOQVBXZjVXNVJDREtXSFJoSk5YcGhnRXdr?=
 =?utf-8?B?NGI5dWkyY1ZHV1NnOERzejBUd2JoL2J1NE94RS80MWFKTnpTWEhjZWlLd204?=
 =?utf-8?B?NnhjUDlDNUFxaDhwKzI4c05oNStPdmxjQWVUMlNqT3RXenBQZUQyclByMHUx?=
 =?utf-8?B?REFpWk9mRWlvbGtTb3JMbW9oSXp0emROYy9tT3o4OW81VHhKQk9BSnNuYjNj?=
 =?utf-8?B?QmV2NEpaOTNNdGEvREJXUjByMC9SN3JVdWF1YTMyQWdyN2NrMjM4T3dpQ1Q3?=
 =?utf-8?B?WTlLeVNOKzY5VUNiSXdJSUJwZ0RTZklHTlZoMVVKdjdkaEhzVVFLQ29zdUZW?=
 =?utf-8?B?SjVHL2h0dHRlYjZJbGNqcVdLZmFONlpja1ZHUGxxUGpmVXhlYitVdUh3U1pN?=
 =?utf-8?B?QjRmNHMraHJHeVJ2SllNYkxsUWVPVGt2K3RPU1VQNjZGNFg0QTkrN0p6c2lF?=
 =?utf-8?B?ZTkwUlVuZ0JXSk1nekNKWE85bXhvUkNWTVROR0E4bC9CMzUyS3VUK0tVeDFF?=
 =?utf-8?B?Zmx2SWxsVWhUR3lXUEZkTHo5YnZTenBjRXpNUXNob1grRmpCaEhqeGFPL2Er?=
 =?utf-8?B?SHZGUUUzek14K1BaY2tzeldxRHd2S3QzaFVXTG5nYllVeUUxSGZqUVVNSm5j?=
 =?utf-8?B?SUgrdTBIckVPeVZqM3ZYdUkvTzFCa0xma3FWNTZIR2p5UEJUd1VwOW50VDEy?=
 =?utf-8?B?OTZXdDhGZG1jSWtsM3F5TTZ1S1M5eFMveHFJN2RmS2tDQ1p2UG42T0wySUlJ?=
 =?utf-8?B?aU1ndGlrNU5Qc1VHQzg3SzN4UEs4UVh5NitLTENSM28welpra1h6Y2lRMUdk?=
 =?utf-8?B?TVhCMVZwS05SSVFDRCtQUWFrVTZaVFNwZGxYc0hDQ256bHArWnY3ZUUwQTNp?=
 =?utf-8?B?YzhLWHBoMWo5aEI3ZmNYVm9JemdHVXM4ZWhINzU2N3h6QUxDMXNrdEladDdX?=
 =?utf-8?B?elNRazBaNEhwWk9PMFhrbmIrOXlWQ0Jsc0plM1QydXZtVmNIQ3BJRGQyL0R4?=
 =?utf-8?B?YkppUFJYNER5M2xLM1A1U2s3RXoxdzdWWGpqRW9sQWpYdmdBbnFZVTRFZGZz?=
 =?utf-8?B?TzdFb3Mvb2dsVVZmUVNNZlYrdmw3eWM1Nm1pQmhTQlovei9Hdm5LY3RHd25T?=
 =?utf-8?B?ZURRU2cyUmllZjROMUpWd2Y0am9JQjlwUmlPaCt2VW1yekpxWUVTaWlnMlpY?=
 =?utf-8?B?djRuemEra2xRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDNPanRwdG0zanBNeG1UcEtuRERUVjJkMGQ2WXgyRkZUaXVLVHNjMkE5UEhC?=
 =?utf-8?B?WGVFL01rMEdNejJBT05yNzhhR3RleWlNVTZSNzVIT0tkZ3gyeWZkUFRlRWZz?=
 =?utf-8?B?WWVIOG5LNXNzUEwxTzVwYkFsUnF0cnJrRmhHNDFad0NBeXZqVUxPOElqbE4w?=
 =?utf-8?B?d0FiRVpmZE9jWDdXZ0ZIZStvY2QwU3hGNGxYK3JDY2FUeFo1MzcwRkhKN1N0?=
 =?utf-8?B?OS9QV255RXhycTlSczB6ZzEzdXVKV2xuYTBtNSttWFFSVUtoU3RmK1IzT0cx?=
 =?utf-8?B?RWVjaHlkRTBYUlpxT2tscEV6UDBxNkI0OHdmQytsNDRGMlA5NzlNOXlBT1BD?=
 =?utf-8?B?Mk5XTVNhcnNGMXBNdlJ2TWZ6ZkpkaUxjTGE5cXFqZHR0cWo4MVd2K0VZZGZE?=
 =?utf-8?B?SVN6Ym9rYzFVbDJsTnJDOVIwRjZHWHZIamFxNGJHc0YvOHFrNExYSGhrUlFJ?=
 =?utf-8?B?MmU5dWs1dGVLK1gvQlliVzVzdjBRdG1xOHZQU2tFWFZnNi83T1RtZjl4b3ZR?=
 =?utf-8?B?aHlGZGlRYWNJelRtNmwxSGhVVVhLZ2QyRUJ0R01WNnNjQVpxVXFJWXZ3MEV2?=
 =?utf-8?B?ZHVBNUJkQmN1ZTVtYWRyTTN0em1aWWdLNVdKVlR2bTZyYkFWdTZCbjJwbncv?=
 =?utf-8?B?Nm9tcDBxajRGM1ZhWnR2Zk9GQWt2TVg3c2ltajI3QnlqNGIwU01mK0pMRXVZ?=
 =?utf-8?B?dTEyL1c3VXlRT0kxTTVkVUdTZ3lZbWZNcUtGMDJZQUZlWFI5V2YwYzlZMjVx?=
 =?utf-8?B?SDVIdXQydWZvN3Q2SUkveCtLRHlramIrWjBrYUlrdVhEYVhlU3AwTjlCY2Rk?=
 =?utf-8?B?S0lIQU84RDhxeHo2N3o1UksvZHlkSnhNOUcreFNBRDl3OGVvdDNQbmhKVEZE?=
 =?utf-8?B?SnYvOFh2OGR6dTA3UHZicmI4dE5pMXBTbjFSTVBuS3RSMEdXaXlwSnpRQTl4?=
 =?utf-8?B?eEp1YVdMdXJhc3AxWXJTeU9rdlRua0Z0WUo1NWl6cUlVcmduYXh5NkFBc2NL?=
 =?utf-8?B?b29MdHpMZDhnL2dneHpZcW8zQkR4SUM1UGFmWXo4eFEzMWZubVd4SnZwaTB0?=
 =?utf-8?B?R2p2bGxqV2gwTDdhMjF1dkREU21sRzRBR2xIaVpBRWlEUHNqOVpKb1hJNVJD?=
 =?utf-8?B?WENyZlczRzZsSStnNWlrbmR2ZUxBcnZLbzNGZGViU0FobVBzaUZhY2JxczBR?=
 =?utf-8?B?L0hjTGUrVVRHV1RKb2VLdW5QeGh5NXB2SFdPQ1pNS1dIbnpvczFCVW5WdEZZ?=
 =?utf-8?B?MnBqWEJOL25ZU2dVWTBUeVhvYVRHcHpWU2U1eUF1eWN2Vkpsbll0RlhmcGts?=
 =?utf-8?B?VE1QK0tGZnVVdHY1b29nS0t2SElkbnJZL1ZKWnJId2Y5MVZSR20ySHh1NTI0?=
 =?utf-8?B?MzhtbW1MNU5CWDhJbHVIZDlGTXpuOGQ3ZkRjMHY5N2loNCtBNDFrOGI0dHdt?=
 =?utf-8?B?aVNUSXFCMGtlTkFhZU1qYUYvV1gyL3lsT3pub3I5UmRueGtpR2R4bmc0aXI0?=
 =?utf-8?B?b2p1SnNQZWFPMzBUMS9PYi9UYzlLdnk2bUJVNzBiT2l2aEFuUzIzWm5vTVdX?=
 =?utf-8?B?eVhCRmhycVJ2N3pIWlh4UnF1cXdZckNiMmVENGJoMm44SlFPN1p4MXJCZmpm?=
 =?utf-8?B?RHNVd0crWVJld0pLWHpaTVNsWXdjWUFGRUhTWDU4UEIwRXFiZlBwRVhZZjNV?=
 =?utf-8?B?VlAyekY1NVcrSUE5L1grZTR5QU41U1FrMDZzTG4rN2h5RjZxMUczSEZ0eG4y?=
 =?utf-8?B?UHVMK1czZ2U3amw5ZVk5WVlLb2lGZldMc2dSL1F5M2cwbEJNbXhjMnJvb010?=
 =?utf-8?B?Y2JCRGF6d1NkQmFpNTkzZ3dmVVFkbGVUNDBxcnRENlRIYlNFMzBOemY3U05l?=
 =?utf-8?B?blRKalcvSTRvQTRzdUNVcDYzM3dsSzM1TXg4UFZXdGNSRXRlNzBmWjErOEJS?=
 =?utf-8?B?WHhENEwrRDZOSnQ4QWlZM3Y3WGY0RVYxMnVVb2ZrRmN3eWwrdDBjQU9nanpC?=
 =?utf-8?B?eGFkK1ZyNDQ0Z0xKcnZNdEZ0VVRnR1NnSVA3RnpIZldDSm5jbEZWeWxkdk85?=
 =?utf-8?B?Q1RSZlFUbCtyRnE4TlQ5RXZjQnVhUGo0aVZoMmlza2tjU29vaFhlbzRpaEdi?=
 =?utf-8?Q?CRCU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8fbabd4-60e9-4d76-4519-08ddc9b5c250
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 06:54:24.2501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0HzpgvQn1BV2Tr31+CmxKEpT+I7fn51tHDESlVH8bqVJZkoLqoLmthslQIeACLNnLjkSuoYgJWf0L3S5c6fBDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6965

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMjIsIDIwMjUg
MzoxNiBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzog
SHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgQmVy
dHJhbmQgTWFycXVpcw0KPiA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPjsgT3J6ZWwsIE1pY2hh
bCA8TWljaGFsLk9yemVsQGFtZC5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXly
X0JhYmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPjsgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+Ow0KPiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IERhbmllbCBQLiBTbWl0aA0K
PiA8ZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxXSB4ZW46IG1vdmUgZ2V0ZG9tYWluaW5m
bygpIHRvIGRvbWFpbi5jDQo+DQo+IE9uIDIyLjA3LjIwMjUgMDc6MDQsIFBlbm55IFpoZW5nIHdy
b3RlOg0KPiA+IEZ1bmN0aW9uIGdldGRvbWFpbmluZm8oKSBpcyBub3Qgb25seSBpbnZva2VkIGJ5
IGRvbWN0bC1vcCwgYnV0IGFsc28NCj4gPiBzeXNjdGwtb3AsIHNvIGl0IHNoYWxsIGJldHRlciBs
aXZlIGluIGRvbWFpbi5jLCByYXRoZXIgdGhhbiBkb21jdGwuYy4NCj4gPiBXaGljaCBpcyBhbHNv
IGFwcGxpZWQgZm9yIGFyY2hfZ2V0X2RvbWFpbl9pbmZvKCkuIFN0eWxlIGNvcnJlY3Rpb25zDQo+
ID4gc2hhbGwgYmUgYXBwbGllZCBhdCB0aGUgc2FtZSB0aW1lIHdoaWxlIG1vdmluZyB0aGVzZSBm
dW5jdGlvbnMsIHN1Y2gNCj4gPiBhcyBjb252ZXJ0aW5nIHU2NCB0byB1aW50NjRfdC4NCj4gPg0K
PiA+IFRoZSBtb3ZlbWVudCBjb3VsZCBhbHNvIGZpeCBDSSBlcnJvciBvZiBhIHJhbmRjb25maWcg
cGlja2luZyBib3RoDQo+ID4gU1lTQ1RMPXkgYW5kIFBWX1NISU1fRVhDTFVTSVZFPXkgcmVzdWx0
cyBpbiBzeXNjdGwuYyBiZWluZyBidWlsdCwgYnV0DQo+ID4gZG9tY3RsLmMgbm90IGJlaW5nIGJ1
aWx0LCB3aGljaCBsZWF2ZXMgZ2V0ZG9tYWluaW5mbygpIHVuZGVmaW5lZCwgY2F1c2luZyBsaW5r
aW5nDQo+IHRvIGZhaWwuDQo+ID4NCj4gPiBGaXhlczogMzQzMTdjNTA4Mjk0ICgieGVuL3N5c2N0
bDogd3JhcCBhcm91bmQgc3lzY3RsIGh5cGVyY2FsbCIpDQo+ID4gUmVwb3J0ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVu
ZyA8UGVubnkuWmhlbmdAYW1kLmNvbT4NCj4NCj4gSSdtIG5vdCBjb252aW5jZWQgb2YgdGhpcyBh
cHByb2FjaC4gSW4gdGhlIGxvbmdlciBydW4gdGhpcyB3b3VsZCBtZWFuIHdyYXBwaW5nDQo+IGV2
ZXJ5dGhpbmcgeW91IG1vdmUgaW4gIiNpZiBkZWZpbmVkKENPTkZJR19TWVNDVEwpIHx8DQo+IGRl
ZmluZWQoQ09ORklHX0RPTUNUTCkiLCB3aGljaCBJIGNvbnNpZGVyIHVuZGVzaXJhYmxlLiBXaXRo
b3V0IERPTUNUTCwgdGhlDQo+IHVzZWZ1bG5lc3Mgb2YgWEVOX1NZU0NUTF9nZXRkb21haW5pbmZv
bGlzdCBpcyBhdCBsZWFzdCBxdWVzdGlvbmFibGUuIFRoZXJlZm9yZQ0KPiBhZGRpbmcgbW9yZSBp
c29sYXRlZCAiI2lmZGVmIENPTkZJR19ET01DVEwiIGp1c3QgdGhlcmUgbWF5IGJlIGFuIG9wdGlv
bi4NCj4gU2ltaWxhcmx5LCBhcyBtZW50aW9uZWQgb24gdGhlIG90aGVyIHRocmVhZCwgaGF2aW5n
IFNZU0NUTCBkZXBlbmQgb24gRE9NQ1RMIGlzDQo+IGFuIGFwcHJvYWNoIHdoaWNoIGltbyB3YW50
cyBhdCBsZWFzdCBjb25zaWRlcmluZy4gQW5kIHRoZXJlIHN1cmVseSBhcmUgZnVydGhlcg0KPiBv
cHRpb25zLg0KPg0KDQpZZXMsIGxhdGVyIHdoZW4gaW50cm9kdWNpbmcgQ09ORklHX0RPTUNUTC4g
SSBpbnRlbmQgdG8gd3JhcCBnZXRkb21haW5pbmZvKCkgd2l0aCAiI2lmIGRlZmluZWQoQ09ORklH
X1NZU0NUTCkgfHwgZGVmaW5lZChDT05GSUdfRE9NQ1RMKSIuIGltbywgZ2V0ZG9tYWluaW5mbygp
IGlzIHRvIGFjaGlldmUgZG9tYWluIGluZm8sIGRvbWN0bC1vcCB1c2UgaXQgdG8gZ2V0IHBlci1k
b21haW4gaW5mbyBhbmQgc3lzY3RsLW9wIHVzZSBpdCB0byBnZXQgc3lzdGVtLXdpZGUsIGFsbC1k
b21haW4gaW5mbywgVGhhdCdzIHdoeSBJIHN1Z2dlc3QgdG8gbW92ZSBpdCB0byBtb3JlIGNvbW1v
biBsb2NhdGlvbiBkb21haW4uYy4NCiBBcGFydCBmcm9tIGl0LCB3ZSB3aWxsIGhhdmUgZnVuY3Rp
b25zIGxpa2UsIGNwdW1hc2tfdG9feGVuY3RsX2JpdG1hcCgpLCBldGMsIGdlbmVyaWMgdHlwZS1j
b252ZXJzaW9uIGhlbHBlciwgbmVlZHMgc3VjaCB3cmFwcGluZy4gVGhhdCdzIGFsbCB0aGUgc2Nl
bmFyaW8gZndpcy4NCg0KPiBBcyBpbmRpY2F0ZWQgZWxzZXdoZXJlLCBteSBwcmVmZXJlbmNlIGdv
ZXMgdG93YXJkcyByZXZlcnRpbmcgdGhlIGZpbmFsIG9uZSBvciB0d28NCj4gcGF0Y2hlcyBvZiB0
aGF0IHNlcmllcy4gVGhleSBjYW4gYmUgcmUtYXBwbGllZCBvbmNlIHRoZSBkZXBlbmRlbmNpZXMg
d2VyZSBwcm9wZXJseQ0KPiBzb3J0ZWQsIHdoaWNoIG1heSAoYXMgcGVyIGFib3ZlKSBpbnZvbHZl
IHByb3Blcmx5IGludHJvZHVjaW5nIGEgRE9NQ1RMIEtjb25maWcNCj4gc2V0dGluZyBmaXJzdC4N
Cj4NCj4gSmFuDQo=

