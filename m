Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FC7AEB126
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 10:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027381.1402035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV4LA-0006I0-E1; Fri, 27 Jun 2025 08:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027381.1402035; Fri, 27 Jun 2025 08:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV4LA-0006FT-Af; Fri, 27 Jun 2025 08:21:44 +0000
Received: by outflank-mailman (input) for mailman id 1027381;
 Fri, 27 Jun 2025 08:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Eu8=ZK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uV4L8-0006FN-LG
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 08:21:42 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2418::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bde09530-532f-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 10:21:37 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 08:21:32 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 08:21:32 +0000
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
X-Inumbo-ID: bde09530-532f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEZwC4aW4c6SQ0scYVaVVgmHvA2HLMvOtVIXCe2r4IUrVjtRb3aDspCY6DiD47tAFw/M9nkwE8bp1ROGu4ZpY5PQ3t5wLG3L5AhRYypZaKTYCnoZz4G4XLtELvc1Q1XcOm5ChTjKpvyqmbL0dluPlBCOA2rDjZFgXN7FpacLU2ziQgtc3PQnlipkMEpcU93x8LSnEoIku377+AL83q83XusjIHmiEGQsvlaSb5M8ZLeBNzWursquLw0jj3X5RL61TqxHFDSKuDYB6fJK7htdrBtR3x5II7UU7ipCCD5y5Cuzc8KkgTF0FY4aRbMFB6ceYhI74Y4zw0T2EOfwTTypjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5UVuIO3GysN4/UXKgvCjZjnkTdTUFeB0S5qGCTMhdk=;
 b=aPkGvGNpvRvsSCTgN5zOiB6FHGyg3OP8t53lQ1sjJv96S1k0fDizefUluYm1yDVwOI8KhSfTv/LyyOx7BewuUmE3A5TXiPuEuqIK1XpOb9PbE2Es/Qe7VfB5qrr3/28qIQTFvs7hN61XzG64CnTXeRteSAjBIf+6WA3ebvXfRgIeXEAzUbgzFjZOUDF07u+pmYUahbz7VEkeef7C8SasdL9sC6OKNKPbVCM17uE52XPEWP/WvLhC7b3lDknxafn1bTFQSwlf873HCK4GfVREIcYDRRG6Mk3jjhCQiUAI/HmGf4ha6UeNXnEJlMuhvYxfTVoAeWFhATsxChojZaC9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5UVuIO3GysN4/UXKgvCjZjnkTdTUFeB0S5qGCTMhdk=;
 b=VfB/Ci3thO1nKVBk0XSAEst0DYvAJTaPSFyZMk/exzicaIvsagqbEIwGtL/Alxfzu9gtNlSqvz5oFiZVGPeNULUDZ15FdzvowDAwsQXD7Vn12I5T72vijQ+2SbeOi9kcl/hJzQsqVLXSdTlgrwx0LJUYosJgglYJdsd+N2E97VM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHb23yakGdVC9XxvEWnYcnp8zrTt7QI/QAAgAGa9QCAAQzVgIAG5D6A//99hgCAAJwoAP//hioAgAHew4D//5oCgAASTfCA//+FrwCAAIi+gP//u5+AgAGwYID//8AMgIABfE8A//+xAYAAFS19AAAATX0A
Date: Fri, 27 Jun 2025 08:21:32 +0000
Message-ID:
 <BL1PR12MB584911BA00D5DE414FE481DCE745A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
 <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <9d5d0e44-66c3-4e3f-8704-2c862c5f5aff@suse.com>
 <BL1PR12MB5849B3C334EF0C5BBCAFB7BAE77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <3638e73c-2a83-4164-9a84-839245245727@suse.com>
 <BL1PR12MB584988E00D0F4A4330B9B968E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <771cd5b7-2b89-49b1-9aba-8cd79319d3ce@suse.com>
 <BL1PR12MB58492A16BFE80B49045AB936E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7753470a-efef-478a-bbe5-ae48d008cfdb@suse.com>
 <BL1PR12MB584979FA987CE2D6E242648FE77AA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cf41d703-dae1-42fd-86a2-aec32184adcc@suse.com>
 <BL1PR12MB5849302474B73599557CC1F2E745A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f50a5c04-73f8-42b6-bcaa-fd9b30088f21@suse.com>
 <BL1PR12MB5849EE5D3CD34DECBEC084A3E745A@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To:
 <BL1PR12MB5849EE5D3CD34DECBEC084A3E745A@BL1PR12MB5849.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW6PR12MB9018:EE_
x-ms-office365-filtering-correlation-id: 52994dad-bcaf-40f9-ccd1-08ddb5539ff0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bG13amkwaUVWUUpTdWhGVTJOdFFnUU1SWERSbjBHNzE5QnFGU20vM2hwSWZx?=
 =?utf-8?B?alZkWUg0N0ppdndmRGU0ZHkwbkplNE9ORmFlZU5QUnpTQzlKTGZjV09mV0pT?=
 =?utf-8?B?SFJUWnVKa0MrVTZiaDJYb3lYNlpoSDZraDErSDVscENKeVRNOXRHbUVmUVBk?=
 =?utf-8?B?WEdCQ21PZEZYQXJEanJiMUkrZ2hRc2I1TjhySWVDbWZ0UFB6c3NWcitRSzhO?=
 =?utf-8?B?NVQzakJkUGIyYVljQ3QyT0RXSFJIVlRObFRuMS82VlhJSEdPWFBhZ0p1bXJ5?=
 =?utf-8?B?TUtsSkFuQkhJRk1MMVhSUUVlRXlJNWlGSEpiQTBra2RDbm45eXB6d3V1RTl2?=
 =?utf-8?B?ZkZiMk9hVjN0TlovYkNveHQ1RzRkZVdXR1BXWUFxajVVbmQ5dEZnRngvZXFk?=
 =?utf-8?B?TU1DKzVVcXFxRlVPcjNPNTYxWDZRUldGOVJmSTRGQ1dZSTJFbi82aHhWTktG?=
 =?utf-8?B?L2N5Q1dxZDRXbGJGa0NCNjB0Vk9wU3FvNWd1TFZNeHNObGhMQk1uWEk5TFlP?=
 =?utf-8?B?d1JZcVIrWDZzZEUwR1hnc21YZkI1TzJaSHlZMDJLK3ZBcTd6VzR6Y2g0dmF1?=
 =?utf-8?B?NUt5NXU5VC85SEUxbHdncGU1RGNaOXlpOFE5M1VoYzBGMUNLeHZXZnhBT2U4?=
 =?utf-8?B?d3lvV21CWVBrRG1wblE2UTRwUXFDVmxSQjRBMHhjbW54K2Y1OGlKMmViYzJk?=
 =?utf-8?B?ZmExSTExNGVEZ3VTbXpMVDZQbzRNN1JEVGZRdkFwYmVHR2RoSzNFODNYcmFw?=
 =?utf-8?B?Rlh5MFE4NGg1S2E3ZkEvbW9kd1FQSnk5RytRWUVNSjlSUmQxWVdsUFRwQlhn?=
 =?utf-8?B?Y2pEdHlKSXpnNTd5cFRwZTl6SERZb1pKcVNoNlBMNG9aUUR3SmN6NXFvM2lt?=
 =?utf-8?B?Tk42LzRnbms1YkZ4dzd1cnZ3V3Frd3VWRHpFYmJaOFF1VzZHNllueXo0WlE3?=
 =?utf-8?B?M0xGY1EzdHQ2V2VFRVVhNHJKckgvZjMzTGZRMFZDRmJlRGhscmhld29KUE1Z?=
 =?utf-8?B?TjJXZEMrcEtKQmVuSFpmQmVjMjNiYXl5Z05RaTF1UDFlOWxwT3B3RHd1R2J0?=
 =?utf-8?B?N1JIZ2xJaWZXK1ZJWGFKRWN3STRwQUI0QWJKOVNZQnB1amJZeDdKM3RxcnN1?=
 =?utf-8?B?MkFNdkQwRHVKM2RKaTlVOGtSYlkwRlZRZnVKbHhNM081MU90cDcxdFpmQ3NK?=
 =?utf-8?B?K29OcjU1NG9ST3ZBcWQvOGowMnFsbGJyc1VXaEppWWJiMHIxRm94NDk5WGtP?=
 =?utf-8?B?UlBPYVJIRjBRaHRBbkRuRVY4cHdCT09zZ1dCWGFqYzlpTm5nRFNNYlpTRmZS?=
 =?utf-8?B?NEhHQjkrQTJmUmsrSE1ndjA1NjExeVhhWkxGNnA5cFIxT1BMUUxlSlloSUZt?=
 =?utf-8?B?YVZXSnpNMGVWeC9xWFNUL2JWeFdYNGhRVHhwajJuTEJKVENrUGVvQzI2TjNR?=
 =?utf-8?B?YjBLOHJJckI4QmttNkszTmM1QkZJWTkxR2F0aExJbWVJb3FIZHdieDRCUkdy?=
 =?utf-8?B?bFNBVWlVNXh1VjEwVHVTMG0zL2EwOWNjT2ZaYW9Ga0k3MVErRVU2VGVGZEhP?=
 =?utf-8?B?ZE5vVWtLQVRwYjBvbzFMTzd1cnhlLzRBdjZQaVRWcTdZbVdVU3A5dEt5UFhL?=
 =?utf-8?B?VWhYNkgzSEVTWnRMT1o2MityTWp5MytmZ1o1V3RHQ0pCUng4V1dla25RNFJV?=
 =?utf-8?B?aDZoc2c2QVRWZSthNC9KcnNNVkUwd0o5eVNlbUJjdHMyTnJpRjNUeTdRbTll?=
 =?utf-8?B?V3gvdHQ0QUlXNlpvZExOR1YrbWNTcHEvUEZuelAxM1BMSTB4VnN1RSt4em94?=
 =?utf-8?B?UElMcWVIVVR3Zmt1NHVCU1NnMjNoaDdPU1RteG9sbC9QL212QXdrOXBsY3JG?=
 =?utf-8?B?a1JPUkZJZE4wVWIvNWMrOEx6dVQxV2J2Qm12bjMzZmlFY3YrZHJjNXpvVklY?=
 =?utf-8?B?NkZNVk1ROGtrSkxrV3AzZTZudWtKZTlSUDFjMStSRUNXdTl4d0ROMGNkRVhv?=
 =?utf-8?B?UXBLSVlJNFRRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MDAzWXU3d3lGK0xsTlZaQnRUTWlrbW9sdmVORXd4RmdJTlNOaEJnTVRIMDdF?=
 =?utf-8?B?YktwK3Y2ZjNSNFJTU2lERVhNMWJvdTRQM1BRM0hXci9TRmhHMFYyUVVUWTRE?=
 =?utf-8?B?L0JoUHZxdGhzVGhmc1QweHBmSnZTNEZoT2ZteTNUdUUySkZrcVBwYTh6eERH?=
 =?utf-8?B?d0xBWEVjcXhnQkttRUcweUlYS0E2UTlCTnBTV3lqWkw4dm9vNklOcERTOHJO?=
 =?utf-8?B?bjM4OE1ERkIyTmIzQlFrM25VS1NtZTYvb3Fucno2WENScTM2YllaaVZrZFhL?=
 =?utf-8?B?aUZsMU5hK21Kd3g0YUwyQnJXUzBaZDNHUEtrS2VPSzU1L0hqU2pwenZXVjVr?=
 =?utf-8?B?dld4d3dxVzJSdkZxVVM0bDBHK0J6R2hMZE5EZ2hhQzEzK2pVNlE2OEovc29Y?=
 =?utf-8?B?SEdFdkRaZ1BGa2h5YU5KSDdGKzdEZ2ZwcXNqeUpzRzE4cmhseWplQlJzb2Nl?=
 =?utf-8?B?bjl0ajErRC9YUFpGZW1nQ1pGaUZRQ09Vakc2UTIzbThHckJjNElES013MHFh?=
 =?utf-8?B?SitaV0xrWlZ0OVZ1UE0zeWxXWmlWbUEyWDk4VlpOZlp2d2piQkVNaGcxb1Rl?=
 =?utf-8?B?S1hKR3RQbUpNMTdyZ2hPd3BrV2txWEFLd2VaUXZ4bklXNVByWW16dFAveGFv?=
 =?utf-8?B?bngzV1JuQ1NUWXFsR285eDZSdlVmNXI2QnVpUUc2Zi95cmRRaDJ6U3hmT0lv?=
 =?utf-8?B?RFhvTFZyUS96eU02RUxMQS9yTzFKbEhSWlJmYVFteEk0U2I3YVJIZmw4aytY?=
 =?utf-8?B?a1M5akRvSWxpTzN6YVBmcGo2OGUvRDNTTXRMbS93bTVpNEdzdEwvR3pwN3Iy?=
 =?utf-8?B?MUR6ZFZkNFlWTnBseVN0N3Q4YjlzNU1PNVVZdzlvMUZVSGx3NGtIWFFLeDRC?=
 =?utf-8?B?T3d2bUtDb3hwVDFHVzAyVlowRVFoQ05hMVNUdWZmUGs5QWJKNWtNUGZaRVRx?=
 =?utf-8?B?M0RiMEVNcEU0VzB3aXdhY3ZJV0Y0MFg5dENuNXo5eFFQNG1COThmSEVkYVhn?=
 =?utf-8?B?SXAvUFhPeDNUcXR6UXROWFhEQTdabEJCWU1RQ1J0NlRJaWxoQWFxMDUrRjlL?=
 =?utf-8?B?RnlGOGdBM0M0S2VLenM1ZGdLc3l2Vy82Y1NkRUZoVUhwK0IzZDFiMTRvWUsv?=
 =?utf-8?B?N0RUVnVBdEFQdTE1T1R6SDZnSFFvK1FQZEw4UUFZcm1Pb3NlTldwdUttTGh0?=
 =?utf-8?B?QnFMcXBtRjhwbUpxcS94WG13RGQxQ3lTb3lsUDRVMSsxT2pNZ3JBNHhFa29n?=
 =?utf-8?B?dWpqTnllRVpENXRFVlhTVWhPdzNMbmphbTBJMXkxWjNQOXR4dlQ1V3FDbUtG?=
 =?utf-8?B?cHhHbmxmRytzcXk2QzUybUNwY1R3SWdGZWxjdDFJY0lITTVBb3VYalpsQTdP?=
 =?utf-8?B?Y1FtT25id0xZeTFYOUZJZWVIdCtoaWRDU0NzVFNVdUdkSDk3R1NOand2VVc4?=
 =?utf-8?B?bHF2bGMzMXNSYUE1elZtREpkK3NwWmtTUmtpTVRWakRSalJJT3czNE96Tm1q?=
 =?utf-8?B?TllsRTU1dXBJUDh5U0lJbW5HcmhoQkZoMUpqWUtobytJMzZiT1lzVyt3M212?=
 =?utf-8?B?eDNNTHZHYnFxWUpXQkovOERDaklHd0hWYkYzS2JxK3NvRStNZzdCTHMrcDRG?=
 =?utf-8?B?VzVXOXRyNlVFTXFWVFlPL25MYkNzTTZGeG9IY3VDQ0tYaGFpOThQLy9iYUZH?=
 =?utf-8?B?MzdkcXAwaU9pVjdHWG5WY2RPQnhBekt0czhPTUFab2FSSWliUjh3UGEyOXpL?=
 =?utf-8?B?TjRROE9zL2xmMnVYUEZRUjVPeWZZTThuN3ZlMWpaajBBMFltemQ0Z0U0ajdO?=
 =?utf-8?B?REpNcmYza29vRTlweFdFTHFNcTVkRjhMc1I2d05OL052SXM1eGJkb0dtZ0FO?=
 =?utf-8?B?MEpPNkVQUEtkby9xWHpxT0ptYmp6THFVNDdLU1RoRzVXK2ZSZGZqK3ppL2Y0?=
 =?utf-8?B?dnNBNEQ0TnZPVmJubjRFMXd5dUJLY0lUM3JmWFJZY1ZIYzUxRWxKdGVXNW1j?=
 =?utf-8?B?dEtZRDB2dnV5Ym5mQjVMdGNBY3RONTB3eFpBbG1ySHZWUlJLVWZsWkRqZzBI?=
 =?utf-8?B?TjBTeUE3Y09sekl0Nml0RDl4VjE0NjNabHRSc2ZXanpTUzl2UUtoVjlkVmNV?=
 =?utf-8?Q?USTU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8B757877A307D45BE0AB76754B7EEFF@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52994dad-bcaf-40f9-ccd1-08ddb5539ff0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 08:21:32.6700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F5jmd/v0BgnzF0oMFWHp8A2/yfo1Db6SBLZHwJvtNDzQ1bT3J+QhOvyUrQ/e29c/F+Mbm9hbIW7ZDBkpSPd0xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018

T24gMjAyNS82LzI3IDE2OjE2LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+IE9uIDIwMjUvNi8yNyAx
NDowNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyNy4wNi4yMDI1IDA0OjU5LCBDaGVuLCBK
aXFpYW4gd3JvdGU6DQo+Pj4gT24gMjAyNS82LzI2IDIwOjA2LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4gT24gMjYuMDYuMjAyNSAxMDowMywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4gT24g
MjAyNS82LzI1IDIyOjA3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiBPbiAyNS4wNi4yMDI1
IDEyOjE2LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4+IE9uIDIwMjUvNi8yNSAxODowMywg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+PiBBbHNvLCBhcyBzYWlkIC0geW91IHdpbGwgbmVl
ZCB0byBjaGVjayB3aGV0aGVyIG90aGVyIGFyY2hpdGVjdHVyZXMgYXJlDQo+Pj4+Pj4+PiBkaWZm
ZXJlbnQgZnJvbSB4ODYtNjQgaW4gdGhpcyByZWdhcmQuIFdlIGJldHRlciB3b3VsZG4ndCBsZWF2
ZSBhIHRyYXAgaGVyZSwNCj4+Pj4+Pj4+IGZvciB0aGVtIHRvIGZhbGwgaW50byB3aGVuIHRoZXkg
ZW5hYmxlIHZQQ0kgc3VwcG9ydC4gSS5lLiBteSByZWNvbW1lbmRhdGlvbg0KPj4+Pj4+Pj4gd291
bGQgYmUgdGhhdCBpZiBpbiBkb3VidCwgd2UgcHV0IHRoZSBfX2FsaWduZWQoKSB0aGVyZSB1bmNv
bmRpdGlvbmFsbHkuDQo+Pj4+DQo+Pj4+IE5vdGUgaG93IEkgdXNlZCBfX2FsaWduZWQoKSBoZXJl
LiBXaHkgd291bGQgeW91IC4uLg0KPj4+Pg0KPj4+Pj4+PiBUaGF0J3MgZGlmZmljdWx0IGZvciBt
ZSB0byBjaGVjayBvbiBhbGwgZGlmZmVyZW50IHBsYXRmb3JtcyBzaW5jZSBJIGRvbid0IGhhdmUg
dGhlbSBhbGwuDQo+Pj4+Pj4NCj4+Pj4+PiBZb3UgZG9uJ3QgbmVlZCB0byBoYXZlIHRoZW0uIFlv
dSdkIG5lZWQgdG8gY2FyZWZ1bGx5IGdvIHRocm91Z2ggdGhlIHJlc3BlY3RpdmUNCj4+Pj4+PiBz
ZWN0aW9uKHMpIG9mIHRoZWlyIHBzQUJJLXMuDQo+Pj4+Pj4NCj4+Pj4+Pj4gU28geW91IG1lYW4g
SSBzaG91bGQgcmVtb3ZlICIjaWZkZWYgQ09ORklHX1g4NiI/IEp1c3QgbGV0IF9fYWxpZ25lZCgx
NikgZm9yIGFsbCBwbGF0Zm9ybXM/DQo+Pj4+Pj4NCj4+Pj4+PiBZZXMuIEFuZCwgYXMgYWxzbyBz
YWlkLCB3aXRoIGEgc3VpdGFibGUgY29tbWVudCBwbGVhc2UuDQo+Pj4+PiBBaCwgbXkgY29tbWVu
dCBkZWZpbml0ZWx5IG5lZWRzIHlvdXIgY2hhbmdlIHN1Z2dlc3Rpb24uDQo+Pj4+PiBJIHdyb3Rl
IGEgZHJhZnQgYXMgYmVsb3c6DQo+Pj4+Pg0KPj4+Pj4gLyoNCj4+Pj4+ICAqIFNpemUgb2YgdnBj
aV9jYXBhYmlsaXR5IGlzIGxhZ2VyIHRoYW4gOCBieXRlcy4gV2hlbiBpdCBpcyB1c2VkIGFzIHRo
ZSBlbnRyeQ0KPj4+Pj4gICogb2YgX19zdGFydF92cGNpX2FycmF5IGluIHNlY3Rpb24sIGl0IGlz
IDE2LWJ5dGUgYWxpZ25lZCBieSBhc3NlbWJsZXIsIHRoYXQNCj4+Pj4+ICAqIGNhdXNlcyB0aGUg
YXJyYXkgbGVuZ3RoIChfX2VuZF92cGNpX2FycmF5IC0gX19zdGFydF92cGNpX2FycmF5KSB3cm9u
Zywgc28NCj4+Pj4+ICAqIGZvcmNlIGl0cyBkZWZpbml0aW9uIHRvIHVzZSAxNi1ieXRlIGFsaWdu
ZWQgaGVyZS4NCj4+Pj4+ICAqLw0KPj4+Pj4gc3RydWN0IHZwY2lfY2FwYWJpbGl0eSB7DQo+Pj4+
PiAgICAgdW5zaWduZWQgaW50IGlkOw0KPj4+Pj4gICAgIGJvb2wgaXNfZXh0Ow0KPj4+Pj4gICAg
IGludCAoKiBpbml0KShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+Pj4+PiAgICAgaW50
ICgqIGNsZWFudXApKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+Pj4+IH0gX19hdHRy
aWJ1dGVfXygoYWxpZ25lZCgxNikpKTsNCj4+Pj4NCj4+Pj4gLi4uIG9wZW4tY29kZSB0aGF0IGhl
cmU/DQo+Pj4gVGhhdCBiZWNhdXNlIHdoZW4gdXNpbmcgX19hbGlnbmVkKCkgd2l0aG91dCBDT05G
SUdfWDg2LCBJIGdvdCBjb21waWxlIGVycm9yDQo+Pj4gdnBjaS5oOjE4OjEzOiBlcnJvcjogZXhw
ZWN0ZWQgZGVjbGFyYXRpb24gc3BlY2lmaWVycyBvciDigJguLi7igJkgYmVmb3JlIG51bWVyaWMg
Y29uc3RhbnQNCj4+PiAgICAxOCB8IH0gX19hbGlnbmVkKDE2KTsNCj4+PiAgICAgICB8ICAgICAg
ICAgICAgIF5+DQo+Pj4gSSB0cmllZCBzb21lIG1ldGhvZHMsIG9ubHkgb3Blbi1jb2RlIGNhbiBm
aXggaXQuDQo+Pg0KPj4gV2VsbCwgdGhhdCdzIG9kZC4gSW4gZS5nLiB4ZW4vc2NoZWQuaCB3ZSBo
YXZlDQo+IFllcywgSSBzZWUuDQo+IFRoYXQncyBzbyBzdHJhbmdlLg0KPiBFdmVuIEkgZG8gYmVs
b3cgYWxzbyBnZXQgdGhlIGVycm9yIG1lc3NhZ2UuIEJ1dCBpZiBvcGVuLWNvZGUsIGl0IHdvcmtz
Lg0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmggYi94ZW4vaW5jbHVk
ZS94ZW4vdnBjaS5oDQo+IGluZGV4IDUxNTczYmFhYmMuLjM1MGViNWYyODkgMTAwNjQ0DQo+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3ZwY2ku
aA0KPiBAQCAtMTMsMTIgKzEzLDE3IEBAIHR5cGVkZWYgdWludDMyX3QgdnBjaV9yZWFkX3QoY29u
c3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+ICB0eXBlZGVmIHZv
aWQgdnBjaV93cml0ZV90KGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQg
cmVnLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCB2YWwsIHZvaWQgKmRh
dGEpOw0KPiANCj4gKyNpZmRlZiBfX2FsaWduZWQNCj4gKyN1bmRlZiBfX2FsaWduZWQNCj4gKyNk
ZWZpbmUgX19hbGlnbmVkKGEpIF9fYXR0cmlidXRlX18oKF9fYWxpZ25lZF9fKGEpKSkNCj4gKyNl
bmRpZg0KU29ycnksIHRoaXMgc2hvdWxkIGJlIHVuZGVyIHRoZSBlbmQgb2YgdGhlIHN0cnVjdCwg
dGhlbiBpdCB3b3Jrcy4NCkl0IHNlZW1zIF9fYWxpZ25lZCBpcyBvdmVyLXdyaXRlPw0KDQo+ICsN
Cj4gIHN0cnVjdCB2cGNpX2NhcGFiaWxpdHkgew0KPiAgICAgIHVuc2lnbmVkIGludCBpZDsNCj4g
ICAgICBib29sIGlzX2V4dDsNCj4gICAgICBpbnQgKCogY29uc3QgaW5pdCkoc3RydWN0IHBjaV9k
ZXYgKnBkZXYpOw0KPiAgICAgIGludCAoKiBjb25zdCBjbGVhbnVwKShzdHJ1Y3QgcGNpX2RldiAq
cGRldik7DQo+IH0gX19hbGlnbmVkKDE2KTsNCj4gDQo+IA0KPiBBbnl3YXksIEkgd2lsbCB3YWl0
IGZvciB5b3VyIHBhdGNoIG1lcmdlZC4NCj4gDQo+Pg0KPj4gc3RydWN0IGRvbWFpbg0KPj4gew0K
Pj4gICAgIC4uLg0KPj4gfSBfX2FsaWduZWQoUEFHRV9TSVpFKTsNCj4+DQo+PiB3aGljaCBjbGVh
cmx5IG11c3QgYmUgd29ya2luZyBmaW5lLiBUaGUgZXJyb3IgbWVzc2FnZSBmcm9tIHRoZSBjb21w
aWxlcg0KPj4gZG9lc24ndCBzYXkgdmVyeSBtdWNoIGFsb25lLiBGb3IgaW5mb3JtYXRpb25hbCBk
aWFnbm9zdGljcyB0aGUgY29tcGlsZXINCj4+IG5vcm1hbGx5IGFsc28gZW1pdHMgbWF5IGhlbHAs
IG9yIGVsc2UgaXQgd291bGQgdGFrZSBsb29raW5nIGF0IHRoZQ0KPj4gcHJlLXByb2Nlc3NlZCBv
dXRwdXQgdG8gdW5kZXJzdGFuZCB3aGF0J3MgZ29pbmcgb24gaGVyZS4NCj4+DQo+Pj4+IEFzIHRv
IHRoZSBjb21tZW50OiBGaXJzdCwgaXQgd2FudHMgdG8gYmUgYXMgY2xvc2UgdG8gd2hhdCBpcyBi
ZWluZyBjb21tZW50ZWQgYXMNCj4+Pj4gcG9zc2libGUuIEhlbmNlDQo+Pj4+DQo+Pj4+IHN0cnVj
dCBfX2FsaWduZWQoMTYpIHZwY2lfY2FwYWJpbGl0eSB7DQo+Pj4gVGhpcyBhbHNvIGdvdCB0aGUg
Y29tcGlsZSBlcnJvci4NCj4+Pj4NCj4+Pj4gaXMgbGlrZWx5IHRoZSBiZXR0ZXIgcGxhY2VtZW50
LiBTZWNvbmQsIHRoZXJlJ3Mgbm90aGluZyBoZXJlIHRoZSBhc3NlbWJsZXIgZG9lcw0KPj4+PiBv
biBpdHMgb3duLiBJdCdzIHRoZSBjb21waWxlciB3aGljaCBkb2VzIHNvbWV0aGluZyAoaW5zZXJ0
IGFsaWdubWVudCBkaXJlY3RpdmVzKSwNCj4+Pj4gYW5kIG9ubHkgdG8gZm9sbG93IGNlcnRhaW4g
cnVsZXMuIChTZWUgIng4NjogZG9uJ3QgaGF2ZSBnY2Mgb3Zlci1hbGlnbiBkYXRhIg0KPj4+PiB0
aGF0IEkgQ2MtZWQgeW91IG9uIGZvciBzb21lIG9mIHRoZSByZWxldmFudCBhc3BlY3RzLikgVGhh
dCBpcywgeW91IGRvbid0IHdhbnQNCj4+Pj4gdG8gImJsYW1lIiBhbnkgcGFydCBvZiB0aGUgdG9v
bCBjaGFpbiwgYXQgbGVhc3Qgbm90IHdoZXJlIGl0J3MgdGhlIHVuZGVybHlpbmcNCj4+Pj4gQUJJ
IHRoYXQgbWFuZGF0ZXMgY2VydGFpbiBiZWhhdmlvci4gVGhlcmUncyBhbHNvIG5vIHN0cm9uZyBu
ZWVkIHRvIHRhbGsgYWJvdXQNCj4+Pj4gdGhlIHNwZWNpZmljIGVmZmVjdHMgdGhhdCBpdCB3b3Vs
ZCBoYXZlIGlmIHdlIGRpZG4ndCBhcnJhbmdlIHRoaW5ncyBwcm9wZXJseS4NCj4+Pj4gVGhhdCBp
cywgdGFsa2luZyBhYm91dCB0aGUgZWZmZWN0IG9uIGFycmF5cyBpbiBnZW5lcmFsIGlzIGZpbmUg
YW5kIGhlbHBmdWwuDQo+Pj4+IFRhbGtpbmcgYWJvdXQgX197c3RhcnQsZW5kfV92cGNpX2FycmF5
IGltbyBpcyBub3QuDQo+Pj4+DQo+Pj4+IFdoaWxlIGZ1cnRoZXIgcGxheWluZyB3aXRoIHRoZSBj
b21waWxlciwgSSBub3RpY2VkIHRoYXQgYWRkaW5nIF9fYWxpZ25lZCgxNikNCj4+Pj4gYWN0dWFs
bHkgaGFzIGEgbmVnYXRpdmUgZWZmZWN0IGFzIGxvbmcgYXMgdGhhdCBvdGhlciBwYXRjaCBpc24n
dCBpbiB1c2U6IFRoZQ0KPj4+PiBzdHJ1Y3QgaW5zdGFuY2VzIHRoZW4gYXJlIGJlaW5nIGFsaWdu
ZWQgdG8gZXZlbiAzMi1ieXRlIGJvdW5kYXJpZXMgKHdoaWNoIG1lYW5zDQo+Pj4+IF9fc3RhcnRf
dnBjaV9hcnJheSB3b3VsZCB0aGVuIGFsc28gbmVlZCBhbGlnbmluZyBhcyBtdWNoKS4gV2hlbiB0
aGF0IG90aGVyDQo+Pj4+IHBhdGNoIGlzIGluIHVzZSwgdGhlIF9fYWxpZ25lZCgpIGJlY29tZXMg
dW5uZWNlc3NhcnkuIFRoZXJlZm9yZSBJJ20gbm8gbG9uZ2VyDQo+Pj4+IGNvbnZpbmNlZCB1c2lu
ZyBfX2FsaWduZWQoKSBpcyB0aGUgYmVzdCBzb2x1dGlvbiBoZXJlLg0KPj4+IEVtLCBjaGFuZ2lu
ZyBfX3N0YXJ0X3ZwY2lfYXJyYXkgdG8gYmUgc3RydWN0IHZwY2lfY2FwYWJpbGl0eSBhcnJheSBj
YXVzZSB0aG9zZSBjb25jZXJucywgbWF5YmUga2VlcGluZyB1c2luZyBzdHJ1Y3QgcG9pbnRlciBp
cyBhIGNvbXByb21pc2UgbWV0aG9kLg0KPj4NCj4+IEl0IHdvdWxkIGJlIGEgbGFzdCByZXNvcnQs
IHllcywgYnV0IGltbyAoYSkgd2Ugb3VnaHQgdG8gc3RyaXZlIHRvIGF2b2lkDQo+PiB1bm5lY2Vz
c2FyeSBpbmRpcmVjdGlvbiBhbmQgKGIpIHRoZSBzYW1lIHVuZGVybHlpbmcgaXNzdWUgY291bGQg
YmVjb21lIGENCj4+IHByb2JsZW0gZWxzZXdoZXJlIGFzIHdlbGwuDQo+Pg0KPj4gSmFuDQo+IA0K
DQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

