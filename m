Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ElYIKnjiWnGCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:39:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CC110FCE9
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225382.1531870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRUE-00050O-Ea; Mon, 09 Feb 2026 13:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225382.1531870; Mon, 09 Feb 2026 13:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRUE-0004yE-Bz; Mon, 09 Feb 2026 13:39:34 +0000
Received: by outflank-mailman (input) for mailman id 1225382;
 Mon, 09 Feb 2026 13:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpRUD-0004y8-BM
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 13:39:33 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3221905-05bc-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 14:39:32 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5166.namprd03.prod.outlook.com (2603:10b6:208:1ed::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 13:39:28 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 13:39:28 +0000
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
X-Inumbo-ID: c3221905-05bc-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+aG9xM1tO5e+AQr8bRj60wKmCsOUTdki25la4sVSyVXQWF2vKxl3RcMVFy/IfDOKuGGu8kmubidRH1rTwq/pLriSFqyRokTi37lSUDxS2rx8bTH9FFje7GOnPjpz+IDZk0DEePLL25B0ShXugQr7xD+lCIZziv8QPctSHYfsY14CDmUoYTAa8WmmX4AgQ8byxk1aWn0X6mxCGrRhxuTuWbN7McDKk/Xu+Sub4Z6EV9ZFbvtL0xaZvNe/YkDG1j08b4hfQ81vudbiWPVbxGXg0IXNa5iYsWNk81zJdv3Zx6Zp+k8oGpXJu7tUa67Kr114A6VYy6eJ+IlLmfd87Oviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5AMvFr1EqwhGFO2Q3L3XMLGUp4ZVOd78Cp91Mo5skc=;
 b=s1ixJOjpYdEsGg9+fzuKdcnpVaoCiFp3k75VuKXeJR+33IiRh+zshrjR8eMKwvTlBUpu2UoOL1CqWr+pRry9Njy84kbIGqDRPrYqD0ZM6j9aq/h7Ab96I92ufzxjZjqgN6rxmUkgMth7AqDfG3gkbPifViw6lCR5gNEZ8QVU63raV377s55TyBFm8raiFoQ0sTWjsX0Hw8OJeldi0bl5J45CU7u2JVALPj+hiN9b3R5VXzXbsTDKcpA6mJ3MlktOkWBHGMLDICbhpocCkOJwIBCwTHxU+BZVkHEQhyDZSnrQnFZdVFt8Vm3l3Ld6t/0rlfUuDO9Bh8PN0711acd+yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5AMvFr1EqwhGFO2Q3L3XMLGUp4ZVOd78Cp91Mo5skc=;
 b=s+9v9PRVrRn//OAX9/lwQKCkMjX27WnchjK/NGq7WTdg3atpir1jzEwSsRe/QIyhlYHkS61cSH3EijhV3tTPGaigm9HNDBQHiCywze9RPmy2TKQYmx35uciEKnOffex4ALQMAdcGmYwtIXNKC+w5B5GMc4n5O6c6Gxdwh5RDWb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 14:39:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5] xen: Add Darwin.mk
Message-ID: <aYnjjHlbaYjr2VqV@Mac.lan>
References: <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
 <aYngg_ym18d0G-fX@Mac.lan>
 <28A169D0-4454-4D60-B811-72FE377A4318@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28A169D0-4454-4D60-B811-72FE377A4318@arm.com>
X-ClientProxiedBy: MR1P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::22) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: 877a4437-3b5a-484e-db81-08de67e0a586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEh5N2Z4VEVHYWVORkhLOGNBOTFRVjR2b1Z1T0p6ZmIzVTNFSjJzWGtIcU9k?=
 =?utf-8?B?U3pwWkZFUEE0SFAyMkppenB5VEhGTndrejZOUE1hRktJenUrdi8zUXFuYUhq?=
 =?utf-8?B?MllUcjNGSjBRUlVobExUdlZDUVFnZU44QkVuZDkvQWVIMk40c2pHRTExVDBp?=
 =?utf-8?B?cDFHQWtqN0lXUHlHUTJwVHZoY2w4ckYvWSs5ZzFveWhXWWlwT0NVM1NVQTdv?=
 =?utf-8?B?TlREd3BjcCsrSURZMHZyUUpMWTdhOXZFb2N6QU9SNGY4Y1R3RVYyQkFPUWJX?=
 =?utf-8?B?ZEJycGpvQnRuVHVlZFQ3NnBrYlhNbkRzSXIzWFAyQ2hjQ2JlZ2djclpoWVVF?=
 =?utf-8?B?L01IcGpwd0R5enQ0S201NU1NQTVLanBnYTVQby9WeFlKYlBMdlBvckdESHRi?=
 =?utf-8?B?bFpJRUpyclVNNVA2c0RZc3hkMUZEazFSQyswZ0ZRMUdUNFY5NDBSNFViQldO?=
 =?utf-8?B?c1FOQkc3SlIyUy9tNEoyQjNaTGJNcjAwZjJSYy8yTFB4Vm1vZHBDSEpOT0VW?=
 =?utf-8?B?KzgwcU1EOE5md1dLb2crbjJnSVpPdzR1ZkxjN0w1WkpVNmM3cis2M3pzNmNy?=
 =?utf-8?B?K0lza29DamdrNE1nd0NXaW4yenRnVFdSUGJPMm1YVUZiaE5rQzNHbjRLWkdj?=
 =?utf-8?B?b1dkT2Q0Y3JjdnFpcnIyaE15bVFVK3RsYU5VeFQvVGNGL1lORjVsbEc5bGdk?=
 =?utf-8?B?czlQczNSa3RXSEd1WFJWaGhlNW1OdytJZTRsRFl1SzVoV08xTExVbkhmSW8r?=
 =?utf-8?B?ZXY4Ukd3UEo2UHZzUk1Ham1KbUlhUGRiMHlETDg3VW9QZUdJSG81a1ZDWUFn?=
 =?utf-8?B?QXFVcXBJRXl5UVlvMjU0YmlYQVZhU0VCR0VFbmcvTEZqbDlLd1FUZ0N3aWlL?=
 =?utf-8?B?ZzIwSXVaZHJES3A1bzNpdUxkRFFZQWJ6L3grdGpJbmNGenRYbWhjaHZiSUNk?=
 =?utf-8?B?cTdtYUtZNjJJL05IQkxTUGNpZ1J5bkR2VndJWTJDdEc1UWVjak85SkxFV2dj?=
 =?utf-8?B?c3JWbVp2YWY0NnZ3R09Od1NrUHhmekg0akx3NCtFSDNKS2hVWHdYTlNnMGVq?=
 =?utf-8?B?SWV2L1FCMDJ4VmJBUzJ2SWpkTjV2Z0g1SzkxQ2grOXRTb1p5dDRLbEpLQS9j?=
 =?utf-8?B?Z2FEUUY0UXV0Q2FpakJHUlZaaVRPaHRVM1VCMHpBd2sxemxSaENqWEtRbHgr?=
 =?utf-8?B?Yko5M0thazB6SnpsRkZxQ1BvejYvMStWaHZMN2dPeXAzdytFU2Y5VWcwRWlQ?=
 =?utf-8?B?ell4Z1RGcjNWNzlaRC9pMk5qWm5qdzVRZGN3UmFYQ0MxT1pZSmlaUWExc0xZ?=
 =?utf-8?B?bUp0NWhtOEo0bXRDYVl0anV5UVdzTUhKWUxKbzNBdHMrZWVkQjd1cjZrRWRF?=
 =?utf-8?B?Rm1MeHF5YTNER0s5Qi90OUdNclZZc0hJOTlNcUhpekpXQytWUDcyYmsrcTFa?=
 =?utf-8?B?RTZORmszL0pGN2ZUeHdXS0QyQnVqZFZKSzlFaXNoMUZTU3NOa1dic1BJL3dT?=
 =?utf-8?B?TERUcUhLQnRpNlhPandyVHlYZVpjTDJPdjVyVzFrMUlySVpsZzJWYXZOTCtB?=
 =?utf-8?B?QVJQc0tpc01jUzRmUFZkZWIvTUNrdWlLN1A3alYxaHpubnB6RWlaakpOTmY4?=
 =?utf-8?B?WkxjT2V6TC9HaVR5dm5QaDFYVWFGMENWazJnbmFpVXpPSnowQVlOdFJaR25E?=
 =?utf-8?B?QnNWaEhCMVRCem11cXhzTHFrVGlHRkxqcjRjcGR1citGKzZQeFYwVWFnTVpD?=
 =?utf-8?B?T21pck5HTTgyS2dhdGJmTnR3RXhSSTJmL3NSV3R2OEgyOXlxdCtBYXJRQXI0?=
 =?utf-8?B?UzQyZzV6ZWVOd3QzMDhZRjNGQmdwMS9IZ2E5cUp1RHcyWmtZaHRQYUFKZmtM?=
 =?utf-8?B?VnN0SlA3eHNNRTN1bG1mTVA5aEpMbWFweUdIV0tzcW8zMU1DNzZQQjZCUUxD?=
 =?utf-8?B?UnlqSUJwcm0rVldVeFMvMDNta0dUNWtkbmg0cnRlbC82V3FTMHVyMXNHQXRF?=
 =?utf-8?B?aW1zNDdWWjY2STF0UXNTSStuTVlhZ1lNU2NFYklxMGJ5M0U5YWlKWUtqNTFP?=
 =?utf-8?B?QjBkbXpoMDJGQUxGMjFYcDY2MGxoUDhxSDJpNElQWmgzR2FOUEx5Q3NleUN1?=
 =?utf-8?Q?5Zl8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFhQMmlkU0FYZS9mRWd0WjNGSFpqMXlMb1lQbFN6ODRZeUd0YzgyZnQxb0dY?=
 =?utf-8?B?NkhKUmRpdWRtN2F2d0w2Ly8xZFF4UVVNVzc2SWNRK3ZsV0dqQ055TFZPOElL?=
 =?utf-8?B?YlJCbnpSQWxsSVYxbW05anUxS3o1TmtpdzNUUkhNR3dpU01MT1NQVVFVZ2pn?=
 =?utf-8?B?Yk1pd3l5VlNiNlBTc3Fwa0EvMXJIY3V6Zkk3UFlkNWhkaUpKVzRiRTVhK2lY?=
 =?utf-8?B?aDBzMHVHUE9xdGxMVWU0aHlqdE8wL0xvT3A1Ky9IVjM5eS93RldtSUxVVEZS?=
 =?utf-8?B?V3FMRnJ3RXE2MTRMSXBjZGJIM2llK1FucEdEd1VHSEVYK0RVMEl1NXVoL1hq?=
 =?utf-8?B?U2xxemhwVGhlV3dEeFZxc3JDUUE1dTY0WEwvcFhyMzJCSGprQXJJV2ZkQTRK?=
 =?utf-8?B?OHZrVVhUZnNyNXd6Qk9CNmpic2RUaWF1bVY5Mlg2TGdKQ0ZIVUFDZGJtclJG?=
 =?utf-8?B?enl5V1pCc3pnSjFlaGJ4N0s1akduT1JtK1VhSmxSdkQyZTlBVmJkK1E2S1By?=
 =?utf-8?B?OS9DV3FtZkNaaUZzYVJhb0FUUkNTd0lEd0M4WGUyR201U05LTG5zVzZ2VDhS?=
 =?utf-8?B?cE00eHhCYzJEU084US9OR2RvSG9sbkE1S1dPVEdpZFZSQlFTaGZlQXhHMlkz?=
 =?utf-8?B?T01qekRiVVZ4QVBhQUJMRS9saVkwR2JxSkU2SGsvejY2bGs0alhnK3BaS0Jh?=
 =?utf-8?B?cm5XbE82TCswT2hNS3hTeTlnMlNMUGpPSXBvWUxYSS9COUpwZDZuSkpWTGs5?=
 =?utf-8?B?QnVKUjYybnR1RTc3ZG9jQkhTQW5oNmt2cHdwd3VmT0Y2VkcvOXlKRHFRd3Ex?=
 =?utf-8?B?emg2VFEzWlFxVlFDTnBTK25QVE5iSDloaGhGekxSbEtkcFM3aGlhOFlFL0Ra?=
 =?utf-8?B?dHZOdnlTWkNqQm9SRUQyVGZkWitMK2sydHlLWGg4L0FZREcweEcySVRFM3gx?=
 =?utf-8?B?VHJGRFRpYjEwZEtJL0xKTUluVm1IV2dKNWJDVnNkVHdWUGo5TXc2cE8xSmVG?=
 =?utf-8?B?Z0llbWNJNG52KzNEQnZLZG5INmtiYzVqZmhkWVZacTNYQ2xCQVhVRjRzWHBP?=
 =?utf-8?B?QTZJRUFBUEhDSDZ1cGxId05PMzdCYTg0ZzF4T09NLzFDSGRWTnMxN0dWODlN?=
 =?utf-8?B?VURPSFdGRmZLU0s0ZE9pUWpzNkNick5DdWRFOXREMVpQYmRqOUFUeUo5azY4?=
 =?utf-8?B?d3FuUDZiOWJoS1lvUlplN29TZVJFbDFsZUp1NExNcTRud05uUTR6THR0V0pk?=
 =?utf-8?B?S1IvSit2ajdKMEZsL1NzZGhzU2NkTjZpNVV6ak95cmdGUDMxOUNGb2VnSlA1?=
 =?utf-8?B?enRlS210YmdaZHpsS0xXRFZDcTdCY0U0SVA0bGpQL3k5R3h3dVRuK2hyREtS?=
 =?utf-8?B?bXlrZGwweGxzTVJRNXZSWGx0Y3lDbFMwSHlrQ1k4TWRZanpVazB2WVVHck9k?=
 =?utf-8?B?RE1vdTd2dDM5Y2lCWFNCZmE3c0xhYVA0c3RXVTBZeW1rMW9SdzRnMnVxblpm?=
 =?utf-8?B?S3NwTnBHOWFWSndISW9wd2dpMU1GbHloUE5sWm0xZUtvZmY5RU90dHp1aWt0?=
 =?utf-8?B?Tk91WWo0RGxNdzFHL1NRNWZuV2FYZjc3ZFhOTTFDb3Arc3ZoUjFEOXBMVUlv?=
 =?utf-8?B?bTB2SG5uV2xEMUd2d3owQjhYdkUrZnR6aC9VWUxobFQwWDU3TTg4UldKeStD?=
 =?utf-8?B?aXZpbUlOUEZoRjY1VnB3dzNxMXNIMDNmQnhWdWV2Y0ZKb2xqZUdlOFJRWmgw?=
 =?utf-8?B?QVZUU3lGT3h5dHp1RFUwZnV2bXhEWUhSWm9ZMDBUdGdBUVlOOEhFVWtjdDdP?=
 =?utf-8?B?U2UrcW1tVjJXcThYSEd6M1loS1N2azVoSnlxSkVJRHlaaU9OMW1QbTNTNVhE?=
 =?utf-8?B?ZEtzQi9oWmZHeGVjWlFrWkVWZWhTZDcvU2hsRkJVMXJ4Mi91K05Ld1FlS3Q2?=
 =?utf-8?B?OWU2bXJHQXR3eE8yRnJzaDFCdkNlSVBISTRyYS9DTkR2QzZKakM4c0JwK0hh?=
 =?utf-8?B?Mm9MTEllTVFiR1ZhZklFNEwwemVVaUt6UkV5MUdDQUVXWlpDVDJ1TUM0eHlP?=
 =?utf-8?B?VW1ZL3RSZ2dXSHdJY3FJTlZ2QVFldmxYYitiQWZZSFpBSmZIbXJjMlVlTXVj?=
 =?utf-8?B?d0V5ekU2VUpEVXJSeXI4V1B6TUJMUVFDQ2xQQmc3RlUwMkhlZVFLaHpVODN2?=
 =?utf-8?B?Q1ExMjU4TEtpSHgzUUo1bWk5VnBuQThEdHJpT1FYS3pHYVpzZXFGWE5LNXRj?=
 =?utf-8?B?NUx4YlpNMXIwSHFQRHdsTzE2RDVKbllGcTdRK01ZaWs0VFk0bjA2bDJ2OEVu?=
 =?utf-8?B?bG5xQ1ZyREZTa0lUcSttc1VENnYveWQwVjVYWkJQeHBhem9ISmNoQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877a4437-3b5a-484e-db81-08de67e0a586
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 13:39:28.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mu4E5j1Z4DFAa2QLquD1UKK+dP4XE9uDYfoqKzSs9QW/giLGiXiS237Izko74Und3as9vcC/cxKqabP23jK3Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,stdgnu.mk:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D5CC110FCE9
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 01:33:13PM +0000, Bertrand Marquis wrote:
> Hi Roger
> 
> > On 9 Feb 2026, at 14:26, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Mon, Feb 09, 2026 at 11:46:44AM +0100, Bertrand Marquis wrote:
> >> Xen does not provide a Darwin build configuration useable on Mac OS.
> >> It is possible to build Xen Hypervisor (tools are not supported) with a
> >> toolchain able to produce ELF binaries (GCC or others).
> >> 
> >> Add config/Darwin.mk to include StdGNU.mk and force
> >> XEN_COMPILE_ARCH=unknown, ensuring Darwin builds always follow
> >> the cross-compile path so compiling on Mac OS is always handled as a
> >> cross compilation case.
> >> 
> >> Only compiling the hypervisor has been tested !
> >> 
> >> An example of how to build the hypervisor for arm64 on Mac OS
> >> (tools cannot be build for now) using a compiler from brew:
> >> - brew install aarch64-elf-gcc aarch64-elf-binutils
> >> - make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=clang
> > 
> > This needs 'xen' target passed.
> 
> Without any target, xen is built by default so i kept the simplest possible command
> But I am ok with adding xen

With the `cd xen` omitted, won't that also attempt to build the tools
then?

Thanks, Roger.

