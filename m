Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0dynHZnDT2ofoAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 17:51:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF74C73320F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 17:51:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=UM1fiJfS;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358298.1612493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whr2G-0005ys-KA; Thu, 09 Jul 2026 15:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358298.1612493; Thu, 09 Jul 2026 15:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whr2G-0005w9-HR; Thu, 09 Jul 2026 15:51:36 +0000
Received: by outflank-mailman (input) for mailman id 1358298;
 Thu, 09 Jul 2026 15:51:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1whr2F-0005w3-F7
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 15:51:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whr2E-00FWoR-Mn
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 17:51:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4fc382-bab6-0a2a0a5309dd-0a2a450be386-6
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 17:51:34 +0200
Received: from [40.93.196.71]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4fc374-b7da-0a2a450b0019-285dc44743fe-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 17:51:17 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 15:51:14 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Thu, 9 Jul 2026
 15:51:14 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJjvU22baTl6gzOpiS0EvOM7b2qU/iqHATKsDsPjMsnTZ+DLDZhhNIZukaKyPncLmTU9LNscPjHNG0CTP+Q63PXO0hRY6jdZY/raJqugcv7EDpoRXunin6HmEXCo2zXNIebzVPUG8EQ4uMRoFBDmt8k0QudHQdivZf0atTXT3vFNY+vsnGfgg+YeJngHiGEyW9C77Ee8xwnBISs++7lU/K8r5MvVxM0oDdS2QV4qgzIgGggJLFNgk/T4g327G25LTSIPqNDwI2t02FDFCaTjhKKtuPs7wq7d1bgcDMcMLRjNFZrR2q0y/E6k4gttVZccjWn2UnArrM4vaJfGOzH2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CfjwK6z2vWrAJHBV60nocYTLa290iB3sEewnQ8NFUQ=;
 b=A8tOMCbEZCBIA/1VzvFYcQZ0bDZDcWexpvt0YZnJcgzxteJzeqGGiQCpOhWiDVG4zqcwLBjIhlyn6yQEuIKFIsPcTDL1rstJE/Icx78Ts/M5WtGDHWw6vpYyZl3mcJuAJzLnIz5WLlQ0hjivvt8wVdfrzk1S5a66xNM/rHXG3t/Eq9NuVFmV7xaXBD3B73Ah3+czcPaltNpM7qpoKgn1CgxFA67mea7p23kzxEbZWizxg7OfeagaL5E5jZym2fPJywgcBaFRbOVdY0YbBN6Hc29t5RTy39AWCnmVsYVc2GpQEZT6jzAA13xGZNRg+xfjmq5x/yIO2TjukEJcyNV7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CfjwK6z2vWrAJHBV60nocYTLa290iB3sEewnQ8NFUQ=;
 b=UM1fiJfSMr4qLPHZc6GM09NJmyPA+mo4rUriAXFfdCMcKOTjOd4EKQCpdHLgrx45hrBHSZCT5+lo/o5wIdWSGss+OBP+SIKghTdwJL8f7D0BN+djlL0QtIDwMD1Mhic7pqkoZNF4bEhyL1nk9QYzsGNC2S2R1ZdzSSTPAGApsyg=
Message-ID: <bf56b5d9-f9a5-40ce-9e6b-0d43fc50e1e3@citrix.com>
Date: Thu, 9 Jul 2026 16:51:11 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: report proper GIC version via
 XEN_DOMCTL_getdomaininfo
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1783603237.8631fc262581453bbf619ec5b2062170.19f470991a0000edb5@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <1783603237.8631fc262581453bbf619ec5b2062170.19f470991a0000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0186.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::11) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SJ0PR03MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: b82a8bc9-1d9e-4e0e-8b5c-08deddd1e803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	yKk6Rpe472NloBeWsT/AGGjTdcW0g8d6Rf46fGqQnShLe3hMn1NwFsIbFe/+bNZv3S5ba3zpozwpFNP8nlyam1IvmwllJ37jXPdQbDin/s4ka3SABS6HNZzFtRtBVnFIXmqDHvJmCsbWQrVYoSqJt8fZhIiPKcYePX1LxsByywRGa7eXJshpjYCdI9unYUiGckH4pRz3cTc3zBmbckBbzaUgEaUCxWE+E4NxwtgMV5LRwGHqrsYTBic6YHpenKOQAceq1ur73tN0Xpr24murv/+j//GH2QZ1L3MmHKQ/n7anqv3k/1VVXTnc+eyxf6SVMcCi9mdGCFRcA9Zs1j3Ozxk7MfFg5wVwem5mk4G6upV55kMhXBwAQFWKKM4viob+6uo9XFaJfKXufWTZ6kQoKI3rSr1PgzpY/PgJ9gQ6cKb52GIokI5n7D/0HwkmIcdtgNR/zvls9HbxDAnmvkABe8rlmn+u4R3DSCGRnhQ98xq2JDQp1SaFYArPL7FjZVK3g+QDqblDJDeWSzNrh3/7MccKHJ0o/EhO9Ns0PHFJHnODdOPSFHAwFe4Tfc5uN3odHRUeV1fRTrnWnPuxlpX4YPO5MbynkQa6uSQReIrHo61gI70JRXfxJNS+qcBRnXc1L/bUL0W5KH57o/Gn3s32S5EBZrZ78lvZRoFvjmoK6NM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnNKdTdNaWh0eVZEelQyd2ZyUC9Jak5uL2NLZ0trdnpsZkQ2eGhnRE1rM1FR?=
 =?utf-8?B?YmRtRVlUd1E0YkJVbURBV3FYT245cUo1bEd1bHZNK3ZqSUZEUmsycTdmbHlW?=
 =?utf-8?B?QW9NbHZoT1dxWVNQNzVlV0s5Y0x6K0FsdjNJQlhxcXU0MGdMVFU4dlNTTzdR?=
 =?utf-8?B?bkdZLzY4YnYwRmoyNGRWYlV1WEhKNmJMK1VnSDR0UU1NMFp4czNxYzgvYWRz?=
 =?utf-8?B?WE1WemFDTlpNUzFqOXhtdkRBc0FLSHJxZGZqa0xGZ0t3YmNDSWRadWJrS1k5?=
 =?utf-8?B?b0lsM0xiSTJUdXduUVZoaWZsZkFnWXdFTlVCTkduVTlkY3l5Qk0rK2lOU3li?=
 =?utf-8?B?VlFQZXpoN3oxd0UrdTNQSHdpb0NpUHBEaWJTUzRNS0NCclNvRVN6MFRyUVNm?=
 =?utf-8?B?elM1emtGUmQwMlRibzZoY2ZYWkQ1QzdKMDNlYXd2UXg0NERLOUdYT3FqWnpW?=
 =?utf-8?B?UjhqK3V4RHc3Uml0RjF2b09VYVFkSDNlNGtDU2d6aG1NaXVFTktPRGxIdnBF?=
 =?utf-8?B?akFxUEM4alpBYnQ3bmZIR2UrQlppMGQ4UDFiZjc1N1daUGVJR1l0M2NWWXNn?=
 =?utf-8?B?b0x4SkhiU1Y3Mlh4TVhMZVcrdmZPNlY0NHJXUjRseFh4L3pBeEM2WlBQa2dw?=
 =?utf-8?B?Q210azBHTzl1dVY2eTkwbE1pZnp5NlJVRVNpSVYyM2NRWm93c0VMekJ3Nk1N?=
 =?utf-8?B?a0tGaWJscHlBRkpIME1kZjh1dmtRMURzMDdxLzF6cXp5NmhzY21CUWdiZUlz?=
 =?utf-8?B?aENETzlwcVgvVnhFbnY5YVZWNU54MThEeGJrYktxRmhLdnNwK09lMHRTY3Vl?=
 =?utf-8?B?bTZLS1h0aWMrSkpsZjRQSk5nVmVPMDV1QzN1TnhMbzJ6SitKZzZMQnk5VUlD?=
 =?utf-8?B?bWJjKzAzcGcrZXB6SWtRWWcrVG4xSDBkc0pRcExSTFZOOWdQOHMvZ2oxVjdB?=
 =?utf-8?B?QWFuOXU4NkMxSHkyem4rVGhPazlUNENiK0hNRU84OVI4VjU0NzVOSVo5OGww?=
 =?utf-8?B?Z050SWJ0L1dvU3RBTWt5aCsvUmczWTducmlQTnJ2SkdUWm5icE1hWXdkSzcw?=
 =?utf-8?B?RWM4NmNWYldjVFIyV2JlUmhDRGhMSXFmVUcxYXBzdDZBUzB6UzdhSC81MXJW?=
 =?utf-8?B?ay9XcldSc0IyTzFYbGgvYzcvLzErUkxnR1dVUmhOVVYrenpIQlh4L0lBYWg4?=
 =?utf-8?B?VFZwT0NSYTBiMDljc1hrdnc5Tnd6ekx2RFJBNWpxNlp1anhWVEtXcjRaWFFH?=
 =?utf-8?B?RUZkTjNpTzlLVlpGdXh1UGhsQnI4VW1ZVVlGdUs3NVFKU3Vic3BYL3JIK1RK?=
 =?utf-8?B?N1dJLzFLWDBFVnlmUCtzbzk3YVFzQ1I4RHVEeXp5S0tPUWs5Z1J0UFk3dXY3?=
 =?utf-8?B?WnZKdEU3TloxSVgzZ1ZWblZMYzF1REY3VzA1NnJnR09iaXlNOUdRdk1PNmxw?=
 =?utf-8?B?UUQ0dE9lY0FrUFluUGo2R21HcjlZVU85Mi8rZ1ZXQ0g1OCszb2FFRm5Cd25W?=
 =?utf-8?B?N29DbDVvYVMxMW8xMlZGT1pLZXMwTlc1Z2R5akNHNjBzdHJDSitoWWYwdVlW?=
 =?utf-8?B?djlzVG9QZGcwaFVjZEwxVS9Xd3VZMnFneFZtMzdNMWxOK3hvclJqMDI3OThs?=
 =?utf-8?B?Z3Nxd3ZWa3dsQTBHcTFEWHhKSlYveThxTUdyaWUxRlBjcm55OUNielZrMUtD?=
 =?utf-8?B?TkhlWnFRZHN3VkZKRSszK1pnbzRCY3dGdnN1alpsZWQzU2lobXVZeFZoNXI4?=
 =?utf-8?B?UHY3MTY2NnFXQkhmcXZLUVd3bUN6bHZvdmliVDNDeXUvMzNmSEZpMldxSUNl?=
 =?utf-8?B?c0lLMEtOdDRQVnBmb09wNTUwUEVCVmxRenlyZzNwemphTGhQNkNpUHdzOGRz?=
 =?utf-8?B?K0hWZG5XQkRwOTV5eUsrOXNiNmlnU000MFl0REx1Q3A1bXczd2ZPclNqTkJH?=
 =?utf-8?B?Y1lOZDJxdGpoWGpBd2N3VXREZW95L0Q5bTdDcGk1ZFQ3WVpFcmo1U01ZZnVY?=
 =?utf-8?B?b1JES2NnRlByOTRwNCtYV0x2UEh2QkxyMFdDaUpwaHVjcWtwWTFWQWRxbkZS?=
 =?utf-8?B?ZG5UM1A2SndFRXUwaVFFYjhmV1FHQlBmdmYyOGxDbXhKZUFCY05PU2lUYnFY?=
 =?utf-8?B?K1RVYmMwOURHSk5hYWhFdDJ6L29YR2dOUjBDODZSMzRua3ZqVGFJWU9VUWUr?=
 =?utf-8?B?T2JTNDdTQ1Y2eTNyTXdZT0llcU0xYUorMG1mQkpHVitEK2lRbEVCM3o4ck1U?=
 =?utf-8?B?RlFURVBmdm9ZR25SN1l2VEJRMW94MGkwVTU0b3lIQjg4OU5STFc5cjZJWDdS?=
 =?utf-8?B?U0NnSGxLZklVVUMzNUwrNys1c3cyam5QNkNMQnpoZkE4bEI5MEFHQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82a8bc9-1d9e-4e0e-8b5c-08deddd1e803
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:51:14.4211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otBKRB2GxN6lUvXChYumBFe8d7LU/4HMP0+gxFq+bbPRiOyC7COd7O3EABKGDvmpBY1YQDWeLEV0Rw+JNl9DasfFFekhZpSWCOboNr+Jfo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5950
X-purgate-ID: tlsNG-42698a/1783612277-48D7F9ED-523613F1/0/0
X-purgate-type: clean
X-purgate-size: 3094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,citrix.com:from_mime,citrix.com:dkim,citrix.com:mid];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF74C73320F

On 09/07/2026 2:20 pm, Julian Vetter wrote:
> When creating a domain on ARM, and passing XEN_DOMCTL_CONFIG_GIC_NATIVE
> for the gic_version field in the struct xen_arch_domainconfig,
> arch_sanitise_domain_config() resolves this to the approrpiate GIC_V2 or
> GIC_V3 version the domain actually has, based on the host's
> gic_hw_version(). That value is stored in the domain as
> d->arch.vgic.version, but can't be queried through any other domctl
> later. Toolstacks that create and build a domain in the same call
> already have this info from the createdomain reply and never need to ask
> again.
>
> Toolstacks that create a domain and build it later from a separate
> process do need to ask again. But, the ARM implementation only fills in
> info->flags and info->gpaddr_bits. info->arch_config is left zeroed, so
> XEN_DOMCTL_getdomaininfo always reports gic_version as
> XEN_DOMCTL_CONFIG_GIC_NATIVE (0) regardless of what was actually
> configured earlier.
>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
>  xen/arch/arm/domctl.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index 6c9a3f9920..b76af56fad 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -24,6 +24,8 @@ void arch_get_domain_info(const struct domain *d,
>      info->flags |= XEN_DOMINF_hap;
>  
>      info->gpaddr_bits = p2m_ipa_bits;
> +
> +    info->arch_config.gic_version = d->arch.vgic.version;
>  }
>  
>  static int handle_vuart_init(struct domain *d, 

Huh, that's one bug I hadn't found in this mess.  I'm sorry to say that
this is tied up in a bigger set of issues.

The use of xen_arch_domainconfig for output has lead to two bogus
things; gic_version as you've found, and clock_frequency which is an
out-only parameter of a system-wide property.

This is horrible API abuse and is one of many things interfering with
the API/ABI cleanup/rework.

* System properties should be reported by SYSCTL phyinfo, not as an
output from DOMCTL createdomain.  This includes the available GIC
versions, and clock frequency.

* GIC_NATIVE is a wrong thing to have in the API.  Libxl should choose
the first available of (gic-v3, gic-v2), and Xen should only care that
the chosen option is compatible with the system.

* With the fields now moved into the correct hypercalls, config needs
making const through arch_sanitise_domain_config() so these kinds of
issues can't easily repeat.

I started this work with
https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/fix-arm-domcreate
but haven't had time to complete it.  If you'd like to tackle the others
while you're at it, I'd be very grateful.

~Andrew

P.S. The end goal is to have DOMCTL_createdomain return the domid via
return value not in the struct, at which point the entire struct becomes
input-only, and substantially easier in the new API/ABI design.  Also
createdomain really should be a SYSCTL not a domctl, and that will help
to simplify do_domctl() a little.

