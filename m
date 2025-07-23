Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2C1B0F000
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 12:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053735.1422527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWqr-0007Yc-P1; Wed, 23 Jul 2025 10:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053735.1422527; Wed, 23 Jul 2025 10:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWqr-0007Vz-MK; Wed, 23 Jul 2025 10:37:33 +0000
Received: by outflank-mailman (input) for mailman id 1053735;
 Wed, 23 Jul 2025 10:37:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueWqp-0007Vt-QZ
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 10:37:31 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 086dce7c-67b1-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 12:37:30 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA6PR03MB10466.eurprd03.prod.outlook.com (2603:10a6:102:3d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 10:37:27 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 10:37:27 +0000
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
X-Inumbo-ID: 086dce7c-67b1-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLQcqk5UQsoLYl/201PwmkKtwFoAmm9OJNCOMPE0qBBtX0oT5/9aINSna5jNWiz0V3DR/m8opj7IuyNfdqZjqNjWQZBNyxMlG0lB6IH3fL/qkb30BoPLeNAK3P/jX/PXaJcqS0R283+5y01j9vasr5Vf/AgO0isTCX76AaICtjePUOg/K2jDuvMTRaUdp/iU3yDW4Hgzjy7OCN4BPP70KG7IpQB36QPBRmsPGXzifjaesGG/2+ZOoPaTZ4A2wi8aNFjucOtcNVhmNeNR3LjHT3m1D69mUh674/4VtvdNYELfl0IbX9snMv0vfzzFeBkElvjpRG9+QCILD7xiS2w6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofIJmHoaevPsRW5xo9NQu3hu8QjFK49Fm3eu5e7Y8/U=;
 b=muPDrt4NcYSeEZn1TCGACS4WOwqVfJWa+s7LaSqtRgLlmv4900mJkxVfclUCq1zCnjXNQMT9EdmS16tfrFjDP1jlgN4x3vU3HXJQsB7bmHBvbUbxEBiNQ8uUCLQlZL9bHDuSAj2+uKdG+CnMAEQ1yBYRMR0cNaWAOHR3pjzAXLzgxibMVfWI0BdHrZkWeBDUJpIolmrr+3bAP0mhXVH3+fG+IB17GPxwvtXE74gXN3U8Yfc0Xl2MLG/O/T6o0VlDFuvZZtYMz0JjlaFTbUiLKvsdOfFoP4r2Muw6zmIJMU7bQdHF6V2THmIeuHUUa+y34xdFsJfw80jZNGxTR4LWCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofIJmHoaevPsRW5xo9NQu3hu8QjFK49Fm3eu5e7Y8/U=;
 b=ns52/vCglMdcECw1eimagpG0cbIvRc0iZgQeGu03uqBX2C+JxQ0SuOmadXxjGC8HI5J7NwEb2QbfPM/ObW41GSeda1ACTdXOXLsQGyemNLY0Drj7Fq0e93H7kWVW/ZQvspdNEsvY81+19DpW+xuZV40JNfumh633u0Bqjn5PKVc58B7hU87ceGLbks5UIBWgdkq+VI8KfLOi9wA8+aGVpU0qRAylQBm/sgQLD+/P/+UhFqUS+f/CXk2D7QrkMfeE1en7Za0dJuwlj0eqrJJoUEq1Av8maG5HVgLcRoAZMKr3RbaKx388AVXzNrXzCSX1Cvf5ZDM7I7Jm11QPHHQRsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <58809e96-d02d-419c-ad31-62665fc6be7b@epam.com>
Date: Wed, 23 Jul 2025 13:37:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/2] xen/arm: irq: drop unreachable pirq callbacks
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
 <20250718101149.3107110-2-grygorii_strashko@epam.com>
 <fd215aae-fd68-4ea6-bc67-33e908ef6c7c@suse.com>
 <8b600c93-b8cc-4828-9a20-90b9245da026@epam.com>
 <e1bc92c2-1a07-4c91-90ee-162cdb879ad6@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <e1bc92c2-1a07-4c91-90ee-162cdb879ad6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0349.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::9) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA6PR03MB10466:EE_
X-MS-Office365-Filtering-Correlation-Id: eac95194-d6a4-494c-b262-08ddc9d4eb31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkpxV29HR3pTWE51LzNXUC9PMHczYWtjb1l4NGU4ZmJCSmdaZkdlTmtINTlM?=
 =?utf-8?B?WlZRaS9LUkhVdTBkM1VHVWVObkpKQlhEREJjbXhOSi9Qd25tL3hveXZWOVJ2?=
 =?utf-8?B?OS9wTGhwYXJkSExqRGJBb01qMFEzQ25nVHdSaEVWaUUyNlUxVi9pdnlNenp5?=
 =?utf-8?B?bHJCVDVXSzNZbFdocUU1dmVORVFaTStKYzBiSTNnMHk1SHNVdEZmWFpPNDZq?=
 =?utf-8?B?d0ZQQ1hueEFUOGV2WmdOYVBJbU5CdHM1UDlaUnl4NnRoTnI2d2NwS2pIVGY3?=
 =?utf-8?B?MUI5QTBzNGZFWVJwVWM4aU9PNkhIYXlZR0t1bWVLOUYvRzlxL1FMb2xaVlcz?=
 =?utf-8?B?RVpLWGZVUjl3ckttL3daTnF5UWx4R3NIT3R6WDMxSzE1QWxadlVVeFdSazhH?=
 =?utf-8?B?S2dGdlphdVR0Z1VoZDFuSGovdWJGQnhXTXNDQUFLeGhLd25NWnhSZzB1OHJO?=
 =?utf-8?B?TzBjdERVN3FvaGl1cTE0YWpGemc4UkV1OHB3TlIvQ2ttR3ZnMzlPODE3M0E2?=
 =?utf-8?B?aEJEUWVJR0ZpNFFZSUNOUzgzOFJpWWdQWkh6SnNQdmVXU1RMV0QvRjNhc0Vr?=
 =?utf-8?B?Z2pQM2hiTTBTclNBOHBLR241bVpEWW5ycGxWS2tBVFNleCswaVFMR1oweGtR?=
 =?utf-8?B?NjdzaFc1eVpKQzJyVHp5a3ZFeEhnWE5DVjdNQ29xalFQSEFNc0lEbjA3S0dN?=
 =?utf-8?B?Zk9EOWxOQ2U0N3BUeDJNdWJ1QzFCZ1dOZ1UxU1Mwc3Q3K24wc2ZIWUZXbEds?=
 =?utf-8?B?MHZQUHVxbDJheXFHSFgxM2dzb2tSQ3VnMjVJMmNkVmhQbmVNWWorTEFkSXRp?=
 =?utf-8?B?dVZYL0J4akdFRkZRR2UvS0RycVIyV3Ryb1FLaVUrQUxmK0lnRDgvQWNPS1Fz?=
 =?utf-8?B?ak9LWUdaRHBJVVgwM2JKUFFtQk42a3NNMjhzYXYzYlFPcDhKWmRmZlF5bWFE?=
 =?utf-8?B?dXpYYUtmZ1RFMDJPMEVCcEg5UjZlL3JKQVFkT3lFK0gzTXVXWjVFOVZIV0I3?=
 =?utf-8?B?Qnd1WGM3MkFkYU5wVE9iYjhSU3RVVUozdDhCMXpiNFNYMWRnSlRvc0VYRXpZ?=
 =?utf-8?B?WXJ2cWp4d0tmZWhKYkFUMTJFZzg3L0twNkd3SG9aQnVPc3h5aXhvb1MrWFlT?=
 =?utf-8?B?emJTSVBuRjdPemhBSFdOcmNBRmN0U2E4UzQyWHlwdUVwSnpTMEFBekFXRTFS?=
 =?utf-8?B?QzJONEU1djRMd240NkR4RUIrZjRHcVVKcjRUQlFoeG91bGRFMGRaSXQvK0Rt?=
 =?utf-8?B?QXdia21IRFJ5c1ZXQS9VNkRVM0VuOWE3WjNxSENEemh6d0Y4Wmtqb1F3VVBM?=
 =?utf-8?B?Znd5UXlnQlNEUFVQajdFd0dxUWRHaUtiWUxjMGNYZWF1a0RuWGR4Y1ZjYVpv?=
 =?utf-8?B?bHBuTXl6VzBFVUgxOUtaTWVGWHZWVS83VWh3ZVpkK2NYbHB0WjNMTHVFRFhl?=
 =?utf-8?B?a1lWRE5PbWhhQW9kZDhpVk90MG5jSGtZQUR0blMzQS96aGM4aXYwbG9mTDk2?=
 =?utf-8?B?SDg3aG5kbnNzZmlyUGNuRW5JTTA0dndWcXlmNnRCQkdzamVxdEQrSk0yOG51?=
 =?utf-8?B?N0tWTWRwcVRPOXA2ekliWHdubVdQc2xmdnI1OVVSUzNiZFJqR1VlVWxod1Ft?=
 =?utf-8?B?VlZFd3JJQ0d1RGdjRWhhMEN3TGZIc2JwRmtpNU91ckFXMm1QLzZuMXlhc1hm?=
 =?utf-8?B?dXFaYjR5VzVxRjlqQ1pjM1BOdGZXZWhMR01lQTVkRFZKS0VCTStmZDJmZ1g5?=
 =?utf-8?B?dTNqOFpVM3ZxVFNobU9sY3BiY01iQVQ1OUFEeEhiVmpTSW8wdUpDZUpNR1ho?=
 =?utf-8?B?anpmYXNTUGFFeWV1eFVPdVpEMFVlMVhvS25KNXhFdE9iVUJ0NmJZODdoeEVJ?=
 =?utf-8?B?Uk5KSG9wOGNPNXJDZGpVdjJYSjdIWWRnQWVVMGFEcTdhaGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1hCNzltT1Rqc0dkWExtYkVtd3htUnBJS21oa0d6OFQ3aHpMMnlwUG1BaUI5?=
 =?utf-8?B?ZEt2QjN6bFI0STcvTkZ0elpsZFVBYkdKMndoSy9NYW44dk1yM0JnUm16S0ll?=
 =?utf-8?B?cFl3dTBFVlNKcDhVNU1BSzMwdG10QmlDOGJjb3pXcVp4SFRGRzJQWWNPcCsz?=
 =?utf-8?B?YW9PREdmak82Rkpob0RYdnVTVUZCMXU3ZllLZVV0S2dBUmxEdmNuTHZoQm9I?=
 =?utf-8?B?Q2tVOGd5U1pGOUZPbnV2M0ZqemQwdmt5SENmbitSaFc3ekhMeGJYWUVINjYy?=
 =?utf-8?B?MEhFS2NBaHQwYWs0VGR1NE16QXg0d2VtMEE3TC9ldG8vc2dZR3ZBSlRkeDgv?=
 =?utf-8?B?SE04MTNENHA2bUlSZEpIdGEzMndlTkN4OU5mUWJSN2pUK3JRRFdVd0c4Zkt2?=
 =?utf-8?B?R3d6TWlySmt1SXpkSFVlSnowMS9ld0VDTnVnKzF3NmRrM2prTno1Z29SRW85?=
 =?utf-8?B?VlRsWkduck1sTHNIUDRZTFJWdzR1eWw4TkhPVm5Na2JQbXhUYzJURk1XQ1FI?=
 =?utf-8?B?eFVvamdWaktaSzE2KzhzaTBCY3hKUzJGbnF4amZLTzlIU1IvZGpOTFhNSGhR?=
 =?utf-8?B?Z0hRLzJyK2VjT25iZkkzcU9zYmJuM25Mc044N3I3MEtUT09TRUQ1bms0N01h?=
 =?utf-8?B?QS96bTNuS01Gb1l6SUh3TnN6U2xvQ1JreUM1dHFxWElOQVRJUEk4WTgxNHdn?=
 =?utf-8?B?c1h3TzA2ZTE0MlRuUXpCN0JXQ0V0SWw5M1laUk9FNldjbjYrdzF6R1Vzak5C?=
 =?utf-8?B?OXZEUEdKYXltYmN6RFE5QmV5aE40YTN5QVN2LzFCM1U0Z3huUFVVQXpieUNO?=
 =?utf-8?B?RmZHRXBTWHN4eTdjcUtYbUdxS1JWOWhqQmRQUWtISE5tMkxVc05pZFh1ME1n?=
 =?utf-8?B?a0h0bVZHbytuS09wSXN6ZzRsWUM4QUNKMnprcVVDWmU1TUZLZmpKMEFZb21v?=
 =?utf-8?B?d3oxbHRVekpxa2I1YUVnLzhMLzA4NjJ6aXJ3SUtjL0xocG1XVzR3ZUVlNXpn?=
 =?utf-8?B?cDZJYm5tZGV5cE90RU45Q0E3ZHdBcGFIQVcvMk9zcEhVdTJsN1JVZm9QK213?=
 =?utf-8?B?MzhTQ1Y4SGVIeElCdjcyUVRRc2hJa2hOZjkxN21GTjVQYk5EWXUzUmtxQWVt?=
 =?utf-8?B?YXRieHdua0wzWVRVM2xMTGlXMGdnSE1qS0paaHZNbU1DbE9wU1p1ekhtL1VB?=
 =?utf-8?B?UkpTOEQ3ZEQ2M1BYcEsvWU9DSWwzZ1g5c25VV1hnSGdMb2tMcmNMK2hFQnNn?=
 =?utf-8?B?S0xWTmZPc2Yvek1jaDg1SndFblNZa3VIT2RDeWhQbld3NWE4REczZFdnUGJu?=
 =?utf-8?B?dnFzQlN6ZzcrTllyUXRwc0E1MjFHYktnTHQrbURPdHVPTzdyZFdLbjk1bVdm?=
 =?utf-8?B?ampJWjVBRVNWQzdHMXdJZHJmU3VJSDQ1NkdWNXgxVmpkSGdaZ1V2aFRZUFdG?=
 =?utf-8?B?amNoZVZDYW52L290dDE4TEw1TnZnWXVFZ0kyM2ZQNHNOMnJxLzZsVExMMndH?=
 =?utf-8?B?YlhpUzJJZTl2MFYzNkZJd0dRVThzQUJ0a2diajVPMXMrQVJIeGtCNGM2b054?=
 =?utf-8?B?UXVDMGtrY3gwK1dmMUJvZFB3WFVUNy91QTRDQW1ZSnBDdGJpWTUxZHpZRDd2?=
 =?utf-8?B?SWJ0Tk1mUlNLbkNCUno4QmMyaFlHQlF0dUp5SFZRSS9LaHhSeVMzeWdiNXJB?=
 =?utf-8?B?SDc5Zm9HVTRsZmQ5aXU3bFZ6eFZRN1Z1ckxlSHF0Z1l6TE1qUllzNUdKMm9N?=
 =?utf-8?B?N2dUeXpCbXFHVUZyK2g2RGU0S3kzSVRGZUpYZHRreUpBVnNNc01QRksyd0Ry?=
 =?utf-8?B?M3d5YWlFYkFHY0VSNnpMd1FqY094R0RzTTdYby9FV1lSMWhkSGNWdDA0ZWlY?=
 =?utf-8?B?REZ5QnZrOGdscUtCRjhlNVJCWFJyTFlEWjVCNXZseUNlVU1oMU43YjNPYmtJ?=
 =?utf-8?B?OUxYY3B5RDB5dTlCWTRyLzVHVVFYazRHaUdGZ2Rsc296cW8wb3NmMENjSEx2?=
 =?utf-8?B?Rk1UZy9CNHhpYndDSlNTalRDVWxkcmg4WFZCTFladDl5MlB2cnNqTkZpR2pQ?=
 =?utf-8?B?dmladW5HWTFka1RVRkYwNWxzTmU3elBNT2k4V2pYQWhGMGExQkh4a2tlOG54?=
 =?utf-8?B?ZSthelpPODBFRlhsdGRvN3R2SCs5anZIY3FwR3lMMWQwTDJLWitaZk10cWlK?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac95194-d6a4-494c-b262-08ddc9d4eb31
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 10:37:27.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eh/ktorGNVq02xb7FtBq4m6JJZOv03LypXwQiTSdrEFEJfvZBrY7xn7W2Ze5nx4idCCsaB6pA1tlSM0U5ARfOwiiALc0JgFuqvjuPHNP+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10466



On 18.07.25 17:18, Jan Beulich wrote:
> On 18.07.2025 13:47, Grygorii Strashko wrote:
>>
>>
>> On 18.07.25 13:22, Jan Beulich wrote:
>>> On 18.07.2025 12:11, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> Hence all common PIRQ code is under CONFIG_HAS_PIRQ idefs corresponding Arm
>>>> arch callbacks become unreachable, so drop them.
>>>>
>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>> ---
>>>>    xen/arch/arm/irq.c | 29 -----------------------------
>>>>    1 file changed, 29 deletions(-)
>>>
>>> Can this really be a separate change? That is, aren't we going to have transient
>>> Misra violations (for Arm only) between the two changes?
>>
>> The violation exist even before this series, and applies to arm/ppc/riscv actually
>>
>> alloc_pirq_struct - unreachable
>> pirq_guest_bind - unreachable
>> pirq_guest_unbind - unreachable
>> pirq_set_affinity - "reachable" at least from compiler point of view.
>>
>> Would you like to have cumulative, cross-arch change to drop above arch callbacks and
>> squash it in previous patch?
> 
> If the issue is pre-existing, then it doesn't need squashing and the order
> isn't important. But it would indeed be desirable to have the cleanup done
> across the board.

I can create clean-up patches for all affected arches.

What's you opinion on how to proceed:
- re-send this series with additional patches
- wait for patch 1 and then send arch specific clean-up series
?

Thank you.

-- 
Best regards,
-grygorii

