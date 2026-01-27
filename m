Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sATXI2WXeGkWrQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:45:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F325F93174
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 11:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214230.1524594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgZg-0001mE-3n; Tue, 27 Jan 2026 10:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214230.1524594; Tue, 27 Jan 2026 10:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkgZg-0001kD-10; Tue, 27 Jan 2026 10:45:32 +0000
Received: by outflank-mailman (input) for mailman id 1214230;
 Tue, 27 Jan 2026 10:45:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z6Go=AA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vkgZe-0001k7-Q2
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 10:45:30 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b6cdc94-fb6d-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 11:45:29 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6566.namprd03.prod.outlook.com (2603:10b6:a03:38a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Tue, 27 Jan
 2026 10:45:23 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 10:45:23 +0000
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
X-Inumbo-ID: 4b6cdc94-fb6d-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/zTy49v5PPjgytlJX72FD8Bk5DO8PnqwIILnt3VdQdGtQL0ap5duwihJQm+T4ben9hgUgSoYO1qxA142T2bBRvEdITp1oCO+3T0wGch1zXh6Ha5frBDh6ZKmqnAPjxDwR60TYFR2O3gvR8m5ZvIbu5Raz3lH1C8QpyraJNzB0TowydYvUusNrLPu0S0BXovE1LnnssCYpqzjFPbuCWUi0ueu/b0f9sDS4yWnt4jwgjknwR+e3g/G/FmoJuHBqEdT22pY471OoZeStntWE1Aa/kHNPArTyIFPXXLAwZRQXRjnFvQdJo+2EyWWCUaQpUmmMoaIHQzhdCXfuemzEl2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+f62wvsoMJ+geg/xJsDNMTVEiiK0qgln2DAEwRPkCwk=;
 b=LpUsKEzvPDq6rTdvNWgVr16npvxYbI7QIZLIX6FlywSeHpJTfw87hPJWRBtdtGt4es8cvjWl/9DHqzcO1YrpURkbICJ2bJ4qz4mbXeoTgHdSDJMvMrJkhAo0Z9Bz50R9YqyQ1/2F4SnnhyfsdqkHXjo/+TTUI6Wntr7KcaMfqOfzI11Rn6scF+nTlN9PnhRifCwjYzt8S4DBtHwqW7xLOAhib0h/dv/RimvP6ulND3X+3REliUVlvjbHS5YlkLOg9eMjIDJzkbM1cp6UPgBTdBNn5ZUkzoNpN/uHz3NtJ0yy4BDFTviAE8aiYKaFJZQLijyKCimNxJ13n8TgImXBJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+f62wvsoMJ+geg/xJsDNMTVEiiK0qgln2DAEwRPkCwk=;
 b=heZ9nfg4D89NT5G5P8bcr0hDMOPGLtUFIqYFeU/ordSaBq8h3PUxBuFMU+V5zciCqiFZrnKGdNaI3otOo+2tFESXHyzXpXCrJ1XiGFimTb3Eu74esJz+9OpC9kr2jMG48550CFGzFzI+cVV7Db4FaOSW4Nr38fEZgHZ3RxR0WEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 27 Jan 2026 11:45:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] xen/mm: limit non-scrubbed allocations to a
 specific order
Message-ID: <aXiXQOpCZANPBkbU@Mac.lan>
References: <20260122173857.83860-1-roger.pau@citrix.com>
 <20260122173857.83860-4-roger.pau@citrix.com>
 <0ff49a6b-67d3-4b2e-bf9f-4b752cfc24aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ff49a6b-67d3-4b2e-bf9f-4b752cfc24aa@suse.com>
X-ClientProxiedBy: MA2P292CA0019.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::17)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4656ee-c00b-417e-282d-08de5d912ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0FJYlF3emVBTkwyMGplckIvVnJTWmZYaTQxUWZOa3YyNVVieXZqTWNLZnc4?=
 =?utf-8?B?cWtYZE95cm1NZXI3UWJPUmVEVVEzUGNnVm9UaXhVRUpoYy8rR0FVb3lreHNE?=
 =?utf-8?B?OEYrU05LYTV3WU5yeG12M1FvcUdyYnBOQXZTc1l4M0M2aEVwSlpHN2ZLdkN4?=
 =?utf-8?B?OGI5OFhsUjVTL0VFUWVyQk9yYnMrcnhWb2wzV0NFejJXdU10STdCSlNESjZq?=
 =?utf-8?B?ajc5RXJiUkJGNmpHT3RtRkFXU0xyV3JQVmtPY243dFR2RHRuM2hSSW5ab0wy?=
 =?utf-8?B?WGRkQWRBZXd2Rk85UFpvRlBTWnd0dngwZVZjMTZuWGpDR1FZVWtSWSsvanM4?=
 =?utf-8?B?UlR4QklPNlhobFFGWGpHZVRnajgxeUYvdUVZaXl4YzNBbW80UFBzSXZUUWhv?=
 =?utf-8?B?UEN1aEpPeS9TUHU2dGV4ZjJhMGVRRFd6dGIvTU9RZ1BDakJnMEtDSWV4eGdk?=
 =?utf-8?B?TzErZkh3MmxwZS9yWnJONDhOS2pVbElOYTlXdlE5Tm5oNzc1TEZVODZIT2px?=
 =?utf-8?B?UVVZM3J3bWtGUW5yaWdrL0hrY3htbTZEOFpOdzdkbTgzNmRHQ0xQQ3BxNldx?=
 =?utf-8?B?WER0WXBCWEs3Tnl0bXlEcnNLV0JtOUFDZWY4TnhJbitNZE1lVCtkd1Q3am5w?=
 =?utf-8?B?Q01QRW1mZGFzS2lvZ2hmTVFVL0lYejY4UkRCS2x3amU3VTMxNThjWTBFRld6?=
 =?utf-8?B?cW5rYTNhMndFNTRGV3BtckpRdkxzNFlUVnJMM3IrbEI3aVYvdW45eURERXlH?=
 =?utf-8?B?RFN2NlBVSVFDYUJIOEEySHMrakRud0lEaWdsUmtIeWg0aDV1a0FyaEQ2UXVE?=
 =?utf-8?B?cGVxYkM2OUlvc3gveXFtMlNsOGo2bjNzcW8xYSsvd1dIODdqZEt6dVVVOVQ3?=
 =?utf-8?B?RHJFRDJ6RmVPUjl5MXFxNGg1U2VYUExvNnlpTVdQaXRHTTJ5T2dCb0oweDhl?=
 =?utf-8?B?S0hDK3Ara0VmaWtYbUFFNHlxWTJadmVoZHdjZlZmVWszdXVBVWVXSGdTazdZ?=
 =?utf-8?B?eWxHTUMwNGxhSkMrOWNQSm44dzJaekMrOUZHcjd5U0VVeXBhOGEvajcxSU9h?=
 =?utf-8?B?aGNhUDVDYjBWVnhoQlo3UWU0STVkVVpucmZlVnZ0czVHd0F1ZEh6Qkk3UnBJ?=
 =?utf-8?B?eUZXR1llQ3M5RFo4bHFucnMyM2J2czBHV3EyckwvUnJuRzNZSEsxak1tenBn?=
 =?utf-8?B?VHFwenpFeEFYZ3V1WDNzMWwzV2VxcWV5eXorT0FhUURRWnhuZkZYc2p3cjB5?=
 =?utf-8?B?R21vZW12TXpDN1h2a0ZkQUVkNno0SUJoY1BLczFSOTg0bGhXSGVNMVVlb1B2?=
 =?utf-8?B?K3dUSURqNjFJdUZ1S1JxVmR5ME5Bckg2ZGpENVRNeWFHSGlvVUV6WDBjMHBZ?=
 =?utf-8?B?U1Z6Skt0ZWM4cW5HT3JMN3dKcUJISE5QaFpYcUQ0dThUZEc4TEV6WkFJMU1h?=
 =?utf-8?B?VSsyUHN2TXhZcU90S0VEdWIrcEhWazh5a0NMekFHZ2tMSWdzOUFZdmpVSW5j?=
 =?utf-8?B?Nzg0UzNleUZRL3YrZTREaUtKdnlFTzcvb0xtTno1b0ViOFhxNW1lRnlYNzhJ?=
 =?utf-8?B?ZCs3U0VObFFubzFza25pSFMreVhUM2RpaXVmb29WSmNhaEhVeUJyeXZrQVhT?=
 =?utf-8?B?cTRmQytOTk1hbDRhWjlYckl6N1V1a2VxeFdtTk4wd0tQWCt6blR4TzlWaEIw?=
 =?utf-8?B?b0lCV0dkdVo4N0UvajZWbG13bEdWbVhFVVZNcEt1S3ErYUhsU0w3WE02NjVk?=
 =?utf-8?B?eWhlMzYyRkRYZGZWODBrQk9tdC9WL0FYT0lhTVQyeURXbFEzS0U4eWNxUEZj?=
 =?utf-8?B?ZGZ2UWU5K2NIZkRFN0ZsOUoyNUY3MzZsd2dxT1llVXJobU9qeDZIZVFWWmp4?=
 =?utf-8?B?V3ppT1F1S1ByVWw2bVlOZHlXSzI5Wld5ODNWTkViODBQbjIvc3lUVVNaR0dR?=
 =?utf-8?B?T3hBeHVnckgraWo1V3A1S3krZUxKN1ZNMlpiUVRwNk1Wbk9ycXJCZXRaMEg4?=
 =?utf-8?B?cmJkeVBGYTJLVCtvWDFuTDRpWHk1bXVmemxQQU9xZktCdUk2MkVvYk1RQUt2?=
 =?utf-8?B?ekRUeDNieUJFRDFvMnFtd0MxTXJWMnowY1dRVjdBYTdrT0dTaTMyQmZhUURr?=
 =?utf-8?Q?Bt8E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QitUNW8vVDJSYVN3dWMxM3pmVUlDYVhnYTg4amtHYjg0b1JjSENPWmdaRW9y?=
 =?utf-8?B?Q2ErbVBCMWJkcmwxeDZvbThLL0R3eGcwYU5SdTBZYUw1SHppNGc1VVR3eGZB?=
 =?utf-8?B?ZGtrTEw5WHc2QlhIUEJ3ckxydlBrdE80c2RDUG5xdDhUdmEwRmM2ZWl2WUli?=
 =?utf-8?B?WjFKeFdPd0pPM0pSSStlcUtwQzlnM09MWDVQRUdQbTR0QXhiTlJEK2NxaVdK?=
 =?utf-8?B?NEVKSnF5bzBHbGZuNGxwMFc3WjRIUVJFaS94SWNXSjhXUVZLc2RKYzF2MFJ3?=
 =?utf-8?B?WlgwM0xaQ2d1YmZORnhEZEpBMm81RHdYbUV5OE5haThOTjlpWnpBMmU1WEg3?=
 =?utf-8?B?cUN0R2wwdVQ1aGZGaElCeE5OQU1BQVFiWHR4UzBwd0tGRVB3TFJDanFEeExn?=
 =?utf-8?B?YjUwKzkvUnNHVHEwRXFLTmhtVExiakZtOE9wMVlDNUxaRy9hNlFuR3dlRUNy?=
 =?utf-8?B?NThxT3BwSWVUTmhQOU0zVkl1ejBxelVmN3NaMkdUaGVMMFlhN3FXbW1vN2RK?=
 =?utf-8?B?QXZXbGZTdVY4L1JqWmxSQmk4bFRpOXZoRXNWMTZwa0pWTHYzMDM2czR1b0M4?=
 =?utf-8?B?cGx1cyt5cnNaczVNOGIxVXkwUWlKV0NGT2swanBneGIrUGcxRmI0ejFUUG52?=
 =?utf-8?B?VXhQZ2ZUaVRnYkRCLzYwbkQ0SnJEOW83MmF5ZVlOWVkzVlFQUXBwQUpvRzl5?=
 =?utf-8?B?NHlkaHZJbkhRd2hYYzVOems3bm9QcTRkVDVrVU1UcTIrTHFWZXdpWEJZTVFS?=
 =?utf-8?B?ZjViNzI4dmdzR05na3Y5TUorRjU3V2dvdkl4T05YczBTbExwblJmcUxwSU5x?=
 =?utf-8?B?UUgxMkZUZmNLNkhJRElYdnNiMDZNSnUvb1l2c2FNYWNybDUzRWVXNUUySllF?=
 =?utf-8?B?RVEreS82MjlFdXc3TFlGNzMwT3k0RDVpbEJPVDF2U0Z3VDV2aExhODVNMFZ6?=
 =?utf-8?B?MUl2cjI5WVBsTEJPQTBPWk10TmVjUUczdExIVGlHQ2VESkJJQ3VobWxZR1Yv?=
 =?utf-8?B?UElLWWVLZkVJbCtrUWNxV1Fua2ZDYTZRV1hDK1RRK3hmYU1qS2VNZFhDSy9K?=
 =?utf-8?B?cGwxYk1XOEp0ZGtMMTVGTitMUGNJOTZIeVM1bTdzTU1qZUQxRnFpbXlCSDNM?=
 =?utf-8?B?SmFSVVFmR0Z4QU56ZzduUTJmRnlNQTlETER0UE0rSlhiYW5JSEFaeHltVWpY?=
 =?utf-8?B?SUEzZkpnV2REbVREdmpWU1c2VGVlTFBpTS9XWFFjNTNveG1RYkg3NWRXOEdG?=
 =?utf-8?B?aHBZUUpEWVo0eG9DZk5CZ1ZXRnlybmxKRWQraG45dTltNXhuZnRBci8rUWlY?=
 =?utf-8?B?NEl0T3lxTkl4WTFmc25qeFFBclRHaVhxRVJsM3lJZ3k0US9keVlSVVFhME9D?=
 =?utf-8?B?ZFJra2ltTjdoektlVGMwR3p4cE5uVUJlQUY5T0JmWnZrWDF6N1MvYUxZUTZM?=
 =?utf-8?B?WTJucE1uZHIvUEhRUy9Ka1Raa241UFF5VWFYR1dKS2s4Rk4wTExVK2JrbXhj?=
 =?utf-8?B?UVlvZTJZS2k5YUVrZTVLNXRDZURtSGUrSzk4ZFFvSjRUNlNvRFVYSkhFaE9i?=
 =?utf-8?B?SkNkN1BLeE01TEhsclAvWTVlUGlpZkM4QVZISFNsS0RRSEtkeHZOMWllbnNX?=
 =?utf-8?B?aFcyaEp5bGNyWm13KzFvRmpWTE1QUGR3bGJuMjRyMDVMWndGZjhsY0ZxM2d5?=
 =?utf-8?B?WmRJLzN5azFFUm1hSUhEZmw4eGZGTmdoTGNZS3M4TnliUEpidjBid1l5djFv?=
 =?utf-8?B?dktLMU1xRDh6T1k3bXlzZVozK1dlK0RkSHp2dFEvMEk3SUl4dVRqUXJUblNk?=
 =?utf-8?B?VFdXRTZOSnFXRmVKdzAyaFRpdTRKT1g0aUR4MFl1SGVFZ0VqVnNpUzhrQllw?=
 =?utf-8?B?amY0Qkc2aGFwN0s3b1pYVGVsRmludy9SdWlzWnJyeG54VDQ3dEdITlVlTVIv?=
 =?utf-8?B?WFFuNHFkcmpDVFVub0U5TGdQNHhNZ0ExL2orT1UyTVZKcCtiNXpFUE1HZWxW?=
 =?utf-8?B?WTkwSlYxaXJWdEp1bzRPNHVJRWxsTmJXQVNxT0xvcXZTeFhDV3dyNFNETXVa?=
 =?utf-8?B?ZFVJczJVL0lWeFlkOXNkUEtjRytxZGsxdjFvdGFZZ08xeXJUY21hWHBoa1pO?=
 =?utf-8?B?bXhOUmc1bFRmVXRETTQzYUUvRzR2OG9HWFo2Y2VjWmJZNEd4NUpmNC9TaTRN?=
 =?utf-8?B?MjIzTStKV0VHTUE5WnIzUll6Mys2R1U5MUNUdUF2Q1ZPazk4Tkw1QVJmbDJV?=
 =?utf-8?B?Y1ovMk5HcEJzSDdvZ085TjUzNXpFbGs2SldlRG83MGZjR2xnSjBZaWNKUnFX?=
 =?utf-8?B?Y1loV2xyVXNabTFvMDhvMlBHTWRZRVc4OW9XUzhqSUtCdTIxaUl2dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4656ee-c00b-417e-282d-08de5d912ca5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:45:23.5967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1eQfmKrq7kl7+SydXZsOKlNLAb4LatFoznqtN/F/UgHrxO/JPTxMPu3V/s8iVC4ftEdlBz1VQbDGUywqH5XCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6566
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,Mac.lan:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F325F93174
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 12:21:17PM +0100, Jan Beulich wrote:
> On 22.01.2026 18:38, Roger Pau Monne wrote:
> > The current logic allows for up to 1G pages to be scrubbed in place, which
> > can cause the watchdog to trigger in practice.  Reduce the limit for
> > in-place scrubbed allocations to a newly introduced define:
> > CONFIG_DIRTY_MAX_ORDER.  This currently defaults to CONFIG_PTDOM_MAX_ORDER
> > on all architectures.  Also introduce a command line option to set the
> > value.
> > 
> > Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Apart from a nit (see below) looks technically okay to me now. Still I have
> an uneasy feeling about introducing such a restriction, so I'm (still)
> hesitant to ack the change.

OK, I understand that, and I'm not going to argue there's no risk.
Overall, even if this commit is not fully correct, it's a step in the
right direction IMO, we need to limit such allocations.  And for
callers that legitimately need bigger orders we will have to add
preemptive scrubbing like we do for populate physmap.

> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -267,6 +267,13 @@ static PAGE_LIST_HEAD(page_offlined_list);
> >  /* Broken page list, protected by heap_lock. */
> >  static PAGE_LIST_HEAD(page_broken_list);
> >  
> > +/* Maximum order allowed for allocations with MEMF_no_scrub. */
> > +#ifndef CONFIG_DIRTY_MAX_ORDER
> > +# define CONFIG_DIRTY_MAX_ORDER CONFIG_PTDOM_MAX_ORDER
> > +#endif
> > +static unsigned int __ro_after_init dirty_max_order = CONFIG_DIRTY_MAX_ORDER;
> > +integer_param("max-order-dirty", dirty_max_order);
> 
> The comment may want to mention "post-boot", to account for ...
> 
> > @@ -1008,7 +1015,13 @@ static struct page_info *alloc_heap_pages(
> >  
> >      pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
> >      /* Try getting a dirty buddy if we couldn't get a clean one. */
> > -    if ( !pg && !(memflags & MEMF_no_scrub) )
> > +    if ( !pg && !(memflags & MEMF_no_scrub) &&
> > +         /*
> > +          * Allow any order unscrubbed allocations during boot time, we
> > +          * compensate by processing softirqs in the scrubbing loop below once
> > +          * irqs are enabled.
> > +          */
> > +         (order <= dirty_max_order || system_state < SYS_STATE_active) )
> 
> ... the system_state check here.

Added.

