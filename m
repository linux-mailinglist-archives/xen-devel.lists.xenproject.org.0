Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNCqEAe0jWl96AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:05:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F6412CD72
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228728.1534859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUVl-0006bw-EU; Thu, 12 Feb 2026 11:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228728.1534859; Thu, 12 Feb 2026 11:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUVl-0006ZM-BN; Thu, 12 Feb 2026 11:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1228728;
 Thu, 12 Feb 2026 11:05:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4gJ=AQ=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vqUVk-0005P4-0Q
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 11:05:28 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc4ef35e-0802-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 12:05:27 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA5PR03MB8401.namprd03.prod.outlook.com (2603:10b6:806:475::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 11:05:25 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 11:05:25 +0000
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
X-Inumbo-ID: bc4ef35e-0802-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayNAulJ58Qh/rcoptWv3H4j+yGrbOCLqA6V0BlvX0NDCQM0OA5DwPnr9DCBMRv8NGh+LZyfODTxH+eusTjljhYkbjtPWnhXuTOsQVc/MUXQA2vKTZeI4MLlXZhWDAEA8nZI7GNEVwamudzu+lOrg25Hf1O4v63AfSq436vTwq5iE1wVikoERCjA5RFv8AUhaDvBRXH+aJdrMKC3K4HJx8JTnNoEoFeq8k9CTuJR/jU1uuGouxR6JElC543jX0kBDu1BuQDTJvuIYroOyrnZrrIXd2X8NVxgjtpDSAIn5IVof7o7QrEApzKAYHvWIfPZllki0xn+jz/YhnuArbROJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oA5AyRN4H8sBFsKz48Xm0baCgvzqXPpzJoj8jMb+ylE=;
 b=B7qDmPQPvXzeMxMyG0AHpnw4GLBk0Aek6/BznoRvOg8LjnjgYB52PKMv5vrUnlSK5ACLK7KLJItJDsf8R1GPahgp4V68Icp4ib1dxkwOTUJMduqlA/X379LYbt3uCBr6qCi9mkcXJKM1PGwJgzSSrISoTs32CwtQEbyh3KiynZbcP3nWdgGbflOpM4QxKTUV3z6t01QX4f1nEoagF2myNrTXVipc9V5r8EYQU//ovIUsU/46b+DoSoM8AM9psLEawgiTar1X+sM/KkVppDxIahvKSRjCjlCkYqfwImVlswWRNEfCCMmEVPZNwWAmpKiIEaCSkdc7IXRhQ7MZlSKYFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA5AyRN4H8sBFsKz48Xm0baCgvzqXPpzJoj8jMb+ylE=;
 b=uiGJwAKjpacqG+pR4ditQitFpyU3F0xl1uvpGhPd8aOBkm1P9cenWgNsLxmDtCL1OLya9WIinR3n2kAkXkbPG4pV+a7hPdB8IOKIzt/jLSMXCci2Ov8Du6mBXvifhxx6WlQsUnKYECGsKh2nIzXVvL+5EhPlfWhr4JoZxuLl0qk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6719f603-6d96-45aa-98b3-e069d9be68b7@citrix.com>
Date: Thu, 12 Feb 2026 11:05:21 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.18] SUPPORT.md: extend security support "lifetime"
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <eaac7ea8-08d9-4e60-b991-c76ee3f3e9af@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <eaac7ea8-08d9-4e60-b991-c76ee3f3e9af@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::8) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA5PR03MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ceb53df-11ae-4fc7-1797-08de6a269f87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkt0YTltcTFiSEN0ZHpmUG9WcjNod01ROVp2dVcwMi9HUzl5NmY0M0Q0WnVn?=
 =?utf-8?B?WUFKU1JaQ0lHSkVIUHltOTNyMGRKTjRuUmNhRVlSZ1NrYkI4dHRRYnRVRjZC?=
 =?utf-8?B?M1c0SlNiUjhza2JwSEFlNGpOYmd5K3pZUXhybitoTGU0VFpyMFViSnJhbWp6?=
 =?utf-8?B?V3pQUlp5eWlieVkzMnJhb3NGMVdkTnJ4SkYrbTB5NEo0WDl6K1NsWkgwQnhZ?=
 =?utf-8?B?dWczMEhKUlJBU3VBYWZoY0ZONWdMd3VlaXlMY0Zia2lwRU5UejBkSi9OTzlh?=
 =?utf-8?B?OEVLcUFhVktyT0loakh1aU54SHk0UGF3MmxNdVBiSEdkT3RnbGVHemlqN1Mr?=
 =?utf-8?B?eVh5ZCtUVXpta0hpZU5lZ1ZBSGVKZUNFUkFzbTd0MlhuZjVlMVdqYjZVRDM5?=
 =?utf-8?B?cmJWZWJPWGFhTkd1Ujk1RXRrWG5pY09MM2hUanBpcmUzajljNFcwSVErclBn?=
 =?utf-8?B?MmhOcE45NVhCT0dmTzYzUDNaVEFFdlhpVUdmM2s0b1hrb0c2aFVDZXNoemwz?=
 =?utf-8?B?TVNnaTVlSVdhbFdRcDBPbVpaN1g3SGt4aEQvN21KemEycEdkMzk0VWJPOG9w?=
 =?utf-8?B?QUdzYmlBN0lCLy9DMFdjWENFV0ZpQzJQLytMem5QUkIvejYrMVliUzc0WEx3?=
 =?utf-8?B?NGFDS05MQkxBU2xJRjBtZHNaTUxnNHNRcnplQjJQNndGSHp0SFM4WVdhNEFs?=
 =?utf-8?B?WFQySDVzUDcxcDNQalZBNGEzd092NWFOSGxPRk9Cc2trZkxRQkRIR3ZTSzdK?=
 =?utf-8?B?Mm8xT3VuNUF5SlMvbjFMUU5nT2FyWjNDZ3dJQ1hxZ0YzVnZ1bHdiekVKWEE3?=
 =?utf-8?B?b25EMkRYdE5IcFB0SUZvZnQxYktqWGdRdGN3VVZHMzE5Y2huNTlOdXl6cE03?=
 =?utf-8?B?ak5MTmV6bGdsd2wyQ2NOYzRWMDNnb2daMlR0dnVISXZ4ditzZ0Z6MjdISld0?=
 =?utf-8?B?QStseDAycFROZ0NTQ3JVM3hjQlN5QVBoeElCL2EzQjRFd2Q4aUhiNzY5MDFm?=
 =?utf-8?B?WWxmYmFNbHprSWcwUUU4NkZRWlR1aHhTaktxY2Q1Z2lLZDB2M0p3c010V2d1?=
 =?utf-8?B?QitOZkhKb2MyTSswTFlRVEg3OGNiS2M4SlN1WVlYYTZURXRoQytlU0tjNnor?=
 =?utf-8?B?UDhqaWJmQzRmRHVTMTZFZmtlNGpGUnJXREE2cysrYU5Ubmk2OW05RWZQUVJ3?=
 =?utf-8?B?Q1lsMHE2Y0xENUtZU3E3YkYyc005S09LTzNoZDZlc3o4dk81Mk9XV0tqR1lm?=
 =?utf-8?B?Uk1UZXh3V3dRR0NhVWN3SXhEVzc0V2RLdGRpSlNGZXBjbENlbUJ4MFU1TmhF?=
 =?utf-8?B?NGNsZk1yZXFYUHc2NCtaMFp3V3hWZTN6Q3djeERWd3N4b3pBTjJMRjk4TGRq?=
 =?utf-8?B?eHlEYk5iTE5FVHJXZHZTc2VSQ1NxSDJBS1hpZmgzbTJLTXAyeTdWaW9Ma0JO?=
 =?utf-8?B?MTBxRDAxcHdvSExIbWl6MUNxSWw5ZEpoMFh2VUU0TGVENkJ2VStjaHhvMGpF?=
 =?utf-8?B?NHN6YTdORUhxUU05TmdXZThwcFN0ZHlpM2UybmJaZDJpMmFSYWRxRXBwTFV3?=
 =?utf-8?B?c3ltcG1LMW5QNU1qNEJvSEYxVmxUQWhtVzlKZGo4NVNVUUdKQXhKOEVrbHl5?=
 =?utf-8?B?YUo0ME54MXhHYjVQRHFYWUIxaTRnazd6UjdSS2FEczc4bWpkeDd2ak1Gc1Rt?=
 =?utf-8?B?b1dqWWhXRWo1bmo1alRnSStSeVQ1M24vbkxSQTBZczdVRDcvUEwyRmgxTFRG?=
 =?utf-8?B?cFkwSjlQVVFPR3Z6UXNDeGV3Q1JIUGFMNmlsaE04bFdQblQ1N2RiRWdka3FQ?=
 =?utf-8?B?VGNYNmZXV3N2YnJWMGtwS2ppSTRSOXNnbWpzWE9mVjZhUzFpVzVwQXNSRzA2?=
 =?utf-8?B?S09kQWVOcGxQbGovd3RVa0hEWW9VVVRNOGh1WkhMUG81bXRFRUtBOVdDemRl?=
 =?utf-8?B?SnZNWDU1UDlWL0hQNGxUZFdNOFlhZ3UyT2NJQ0t2MUtyZWY2VEJhSTEvdTJq?=
 =?utf-8?B?VE5EK09jRUhZNml1aHNmczRFdTd3aTlDNTdkQllRN0RhcmE4amFlNXo1MHlR?=
 =?utf-8?B?ZWxrdUFtZUhJamNBRXA5SXNYKzUyUit5WWJSVFVJSi9Bdytjek8vcDRjaTFs?=
 =?utf-8?Q?Sl9o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ynh1L045ZEhma2tWdkJwd2ozZncxcnVaVjBHZ1p6RE5SeVpUckgxM0g2S0hQ?=
 =?utf-8?B?VHU0RmFzT0M5L1dQVTZyNU1xS3lQQy9ZSGxkQkJIZXA1QXFFQW5Cc2o4UFBv?=
 =?utf-8?B?L1BFeVpzWTlCNWdwNm1YbFh4ejRIOVJFdW1IVFNLMjk0ZlZxMnJWazUxdGt0?=
 =?utf-8?B?MWFOR0xvOE43ekJTQ2pNY3QwTGs4SmhNOFRvaFBnZmZ3eXA3dG51bExVTjdh?=
 =?utf-8?B?MzlOWnhsYTcrL3BpRjV4Y3VLNWdvTEVxZzhRbUJ2c0Z6RlBvaytZOUdDSnRm?=
 =?utf-8?B?L3FNNk4zODhTZktTRTNZaENUajJLVGQ0RzhGWlplNTNUR3lCOTY2UHcvVkpS?=
 =?utf-8?B?QTl2YmFjeXppQXh3OUtOUUc2VDlIV05JVmlpVGtZMXdpdDBzRE5FR3dad3hh?=
 =?utf-8?B?bFI2RGlyTjgvbmpHeG1TcE1VYkEweXdvS2I0VHduTFovRFNPLy8wQnJ4aml2?=
 =?utf-8?B?b2thUHdLcG1BR2hHNEtIbVZzTDlERFhBWVR3TlZ3M0x6bGFxOVNUMzN3cG5N?=
 =?utf-8?B?S2V6MHE2RUpFQmd5SmZGZXEyWHBVS3B1RENJVHF3WkhCd0IvUTdZUnJyUEkr?=
 =?utf-8?B?Q3kvRiswaUltRmEzMkFsNDRRYndkL2FPVXhUSXpOY2w1aFh2S3VSQlJkbUx5?=
 =?utf-8?B?THkwRlZUcUlOSTlGTEliN1Vodzl2R3dCK3RMN2l6bXN2RUI1eVB2T3B2aGhk?=
 =?utf-8?B?M2txMVBSR3hzOEFtcnlKazNxQTJpWXVoNjdlWVRMYUFtYjNYdHN4VU9JaFJr?=
 =?utf-8?B?MzlhQzl2d29hK3VQUEgvN0dCaFJTUnlIQ28wcUJmS0dnZVM4ckNHRGhTUWJi?=
 =?utf-8?B?aS9QVitNZXZLRE9Qd0RlSDFTMnRyNVgzamRHQno5VlhIVWRzNlc1YXdpd1VT?=
 =?utf-8?B?cHdOcU02d2pLYVoyME16UVk0dU00VnhYQU5KeEhVZDBjcnROaDJvM1RSRWlo?=
 =?utf-8?B?cHBVRzdHKy83M0NvcVg4Rm0wZEIzaHNmM1E3aVFUMDVRTXJZc0VLSlVRMXR5?=
 =?utf-8?B?TnAxV3ZTbEMrU2FEWlhTS3ltT28vYkNqbWhPRzFHcUxQKytLNEZXbUQ4cktB?=
 =?utf-8?B?U1JIeENPSXFpd21Vd0xnQ2dNa01ZOGpHSW0xQjQ1MUZBMGRqcmp2RjRPdk5O?=
 =?utf-8?B?Y01PRnpCcDVqb29GS3ZDWnVkTEJYY2crZEtUaVBMYTdjcGpwdFlyZ3lYbXRv?=
 =?utf-8?B?ZXE3NWRFNHlaNVVoRDJROGlEdll6Q2YyKzlJaVpHMkxabC9XYngzRHZIaFc3?=
 =?utf-8?B?Y0tiaEI3ZlpLaWQrVmRQNDZ5bnZtVnMxa1JpekQ2TzEwQndpZzdJYy95Y1ZX?=
 =?utf-8?B?WnpvRi9rRTdlT2tpQzYyWWZnUGRWdCs5OWcwSWRwMW5TUXljaGlheUd1b0dE?=
 =?utf-8?B?Y0taakVRTTl2ZWMyeUgwamFBdkZCRm9aTDlhMGY1QVUzVkNBZVhZN2IxZE9F?=
 =?utf-8?B?QVZwdjNYTm5jMVNuN1RUenk5bC82UUVxY3NiZzhwaTVkVWhmSmVOMXZpczZQ?=
 =?utf-8?B?SlhjUmdmTzB4QjlkK3FMR2NaZThxbkp6UkJCaEh0OENGaXE2N2R4TEJWZHBI?=
 =?utf-8?B?anlkRGI0amk3OCs2TnF5WndFMEN1Y0I5VGpjZ0V1RlVZY0VheE1adGNtVzl0?=
 =?utf-8?B?bEhnZCt0dW9SN0h2akhIMmcybndiMksrckxubUx4UTF4b0grWko1d0F3bzJZ?=
 =?utf-8?B?aU9qM3dwc0pMTENOeFU3RzQwTUkrV09IRkgraFFnakpRcE1iMm1mWVg4cE5E?=
 =?utf-8?B?WDJLN0oxdDJ0RDk2c0pmUHFNZ2dwUHYyTVFacVc4Q0dGUHU2TGtjdGpCVHFU?=
 =?utf-8?B?K0FVSmJkWFBsNmlueHpoVWlFM2Q3NUFUQUUvYkVsMm5JZFZodGQ4NTlLYUxo?=
 =?utf-8?B?T2s2bG1uYUFZVUxTQnJzOGJuVkdKbnZzQmVsQk1oRDV1NzFTTEgycWpLc09G?=
 =?utf-8?B?SldhUkpVdWN2SUhHL25IeHlKNUw0T2g2UERFOVlWWit5QVcrcVZqelpMdFRw?=
 =?utf-8?B?Wm1XbStaNGhCUlB4a1ZkY01ZMjlEQWxLaHFaV2p3UjdVUko2RkNHUmRBM0ly?=
 =?utf-8?B?SHp0WkpLU3FmeW5mcW1SNzcxVUVNKzJUak9UZ0ZxQkNoWEZOWGFsTmp0WjdM?=
 =?utf-8?B?TmlGcjR2WnZwVXpqaXZIek4wdVB6Mm1VQlBXS2psSjg5aWtDcXNZM0RRdnVn?=
 =?utf-8?B?WkdqcFFUa1ZNN2VkbGcwZExNeVR4MUIzZHpJWWM0Tll3YXZXTkwzN2JvRHBU?=
 =?utf-8?B?OEhtVWxkdEh4QithU0FmdE93a3RGWStRc3ZDTVZDV0UxbkZqVEZUTHlPOWI3?=
 =?utf-8?B?VVR0US9Od0RyUzc1SC91aHptcXdSOXVFSm9BZ1pOY1VjeVR5MWFqUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ceb53df-11ae-4fc7-1797-08de6a269f87
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 11:05:25.2720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cr+ppiakorasvMSdosICz1xhxvSqby0yzyf6xDAVC80LDSNy4IOZlrghd+eoNqBHm4uxYQ/6eDWxSv7AkomZg5B2GFdHquVu/n/LWsVvwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8401
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:community.manager@xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A3F6412CD72
X-Rspamd-Action: no action

On 12/02/2026 9:31 am, Jan Beulich wrote:
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -12,7 +12,7 @@
>      Xen-Version: 4.18
>      Initial-Release: 2023-11-16
>      Supported-Until: 2025-05-16
> -    Security-Support-Until: 2026-11-16
> +    Security-Support-Until: 2028-11-16

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


