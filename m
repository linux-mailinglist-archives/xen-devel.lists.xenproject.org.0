Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jPdQNh5PMWq5gQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:26:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111E68FE92
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:26:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=oaUpVxbn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339230.1600381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZToM-0007Sw-Fs; Tue, 16 Jun 2026 13:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339230.1600381; Tue, 16 Jun 2026 13:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZToM-0007PB-Cm; Tue, 16 Jun 2026 13:26:38 +0000
Received: by outflank-mailman (input) for mailman id 1339230;
 Tue, 16 Jun 2026 13:26:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZToK-0007P5-O1
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:26:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZToJ-00FTfX-Fb
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:26:35 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a314f09-2eae-0a2a0a5409dd-0a2a450bdd6e-6
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:26:35 +0200
Received: from [52.101.57.41]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a314f09-212f-0a2a450b0019-346539299f2f-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:26:35 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB4957.namprd03.prod.outlook.com (2603:10b6:208:1ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 13:26:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 13:26:31 +0000
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
 b=mNM0/Jz523W2qJAUITc6zUqqY45EuU/JEuMT4TMA5A1t9E3OqLSaXjYDy/yG1HKFaETH1JTGUMZXQpw9bnGYSR4y7yQph9fEjws3kuVfuLl0vDWETbKghXPd/+o9fw+5NKMtWjapfqgtqYEzs7Mk8bB+giipEzem8X3Ruy6eJuf+dOC05N2WIacxRny6zei2a1i0cHRCXDZCFyUq6JNSjSqoUuH0hHKGn7pc0xvmGYUYD/edkbiw7YSVJUVwgvr1pWSisvvE4WYS8/ncS2mCBB0MM3cwlpW82kIvwjtLXLGI5vNM3U56+Pxh7IXzKJSXiQbOcKPq28eYYIhwzCDCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUtPMUqsxLFXHXcQH5o5px5ayBbAtK4ux+1FZV+v5oE=;
 b=bc/tbgOH6IOrsINI7Kur3rGISaO7d5P0rtIM7qQVg4YRKPhPBaECTY/OKMtB46648XDVcpR9DbPJmEMssqMOb+3Lwu98cmrhRJri2sRqKS1eYvh7E/y0Q8XmIxJSZqYE0qc32RoF7zWaXCGxQqhqyP8Q4hyFAVM8NBOagY+Xg3vNBPsWMaldtp/XxDZ5rWnVCoaSpsOkQj5vIzCz8akVyLGQ1KyYPwLr0n03lVlbIiOyknbhsdnnvFb5L0mtMxwt1HZoopX61ZdsmFKcwOVuX2DwbJgJCMYNds1gOql+FU94PEINvfNIZyh/pMF+nazMYKWM1etn6j+Jw+xRLq6GPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUtPMUqsxLFXHXcQH5o5px5ayBbAtK4ux+1FZV+v5oE=;
 b=oaUpVxbnsJZAEDfwmyBHdaXqy0Tjpc9GOBjBZ1s5j/trX5uqfduM9WPMc3bDh00DvECCq1aekrOh84dhZaYxMWP8uu6fz2vrOjQkeA16t9FP8XPDmrvB3YCkV6wuzYbFGKOqapWkqTzqjjtksUVv2yoDh3ZGsk3gX5KJfthO/ME=
Message-ID: <dd974236-b6d6-4eba-a78a-5acd1ee17589@citrix.com>
Date: Tue, 16 Jun 2026 14:26:27 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22] x86/ucode: Exclude Zen6 from entrysign digest
 checking
To: Jan Beulich <jbeulich@suse.com>
References: <20260616104534.22995-1-andrew.cooper3@citrix.com>
 <ef1f84c3-68c4-4619-9e32-b008e91725f5@suse.com>
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
In-Reply-To: <ef1f84c3-68c4-4619-9e32-b008e91725f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:377::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB4957:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc18de0-4792-486e-1563-08decbaae0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|56012099006|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Xb9HLocqwSkCSCjACwNraYKFsn9RYmNBa2nObqTH5ppRSKwegJtSFvXMuDX41y6PJz7ri5TQeMH79EOmMRrwrxzQ4rVTxEYzm5qiE6gUvnyzPAn/RPb3/TVQVx10sZxx8V6gWnf7AJ161tc3e35J8aHs29JFosAV6icjffVMed2fW47I3DgR3dMnP5BgUFJG8aMTyMc2Iuh2F6LnmzoDl3cLGvpVplNmbZLaP4oVRyvNOP7qTrWOQoqP/t+8buq5pt5hPuGu8gFU/XS8Yfu1OQTskFSiqtkE6/o7njJfBxHDWzh1QjCD5MmDli7rwQqXOUGav0+15mLAb4oObo5TfIlRf24VxtmbusFfe+ZpglcS0v6iyrDr/zeOzTyW45lKdmyOxODKNHRhKLf9GasXOA1PJqWFxebWAITP33ALitXLqLqgWJ08yIRjezYsexe4MbK/x8DvEK/l46b1UQD5m30inl018uFdIsm+ybD7cXtMV658M9Mut4f8decrswTySunujeIMJukxHmiRGsYa7gRyhn3HWggK95Q5qfVa4GJvPHkXnxUiKWTCFgXAEoRyBUt0PzUJ1Ss98y73l0BOdITghWBkuJrKHoyqAdsFlsddKNsnqoiC+MvMGYNYXIuLgGiExtIdT5XEqYW3opU63jQ7sfS/4oF976ZNQT3OGmswYLUbP0npOraxP4Ts4b3y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(56012099006)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUlVN2xibVJRVGR2cG4yQ3M3NEhSVjQraWJjL3NGMThvdDR6MHFLL1JIMS9Q?=
 =?utf-8?B?UjExMElGWnNIR2dGdkIxeHJtUW13azhaSHVJb095UmRaMW9qbGZYME1oK1NW?=
 =?utf-8?B?ZDhTQWxqcE5HV0pZYmVPb3FzM1BYS0FLaThNK0NxYUgzMU5VOFFUMndKSzV1?=
 =?utf-8?B?MElXbDZLMDV0c2d1Y1hHVmpGeURucUYxWVB2OFNYRjV4QVJ4bGNyaTg0QmN4?=
 =?utf-8?B?VXpZc2hEVEc5czF4ai8wK2Z2MVc3UFlMOGtGMU1HQlVCWGZuMjc4aGFWUC94?=
 =?utf-8?B?ZkNSWDRQZlFZcDJEM3MzOGVTOWRCWSt1MlB5S1RtMUwzTXEranZ1UWkwYmhj?=
 =?utf-8?B?U0hVODQ0NThtTnpSVDdHWHpMeElxZE9BQTMrdEJockppRXU3bjNaQS9ab3Iv?=
 =?utf-8?B?bUxha0RKeDZ2aWxGNDRIc0RTaG96NWJtcEJPSTFYN0U5S2hWR1VQYUozRkpR?=
 =?utf-8?B?T3p4VU5BclNyVWR5aHRyQUxMRnRsWE85RWJ2Qy9VMVFnN0ZibmFWTGtlYUxK?=
 =?utf-8?B?K3NqZUFBUXJCcUMvVFZxT0tZRzBCZGVJNFN0ZEtmck8wcFJMRXVuaGxZUzhM?=
 =?utf-8?B?Wmhtb1ZqOTNaKzRjbUJNNVR2dUwvT1lGb0laNWVoZmdCUTdCT1NtOWZINVAv?=
 =?utf-8?B?Z2dXMEFGdGNUdUVSdXlOSFNrRlY3TDljSWtJdlNiS3JsNmZZdWpRMmFPRkF6?=
 =?utf-8?B?aEZSRFFaaW15QXJOckJLdTJ1Q2tteVhpUjFiQ1BqYVlwK2IvRzRGVXZyODBY?=
 =?utf-8?B?aU1NSldaUnpvc2hnbUhjdkZpZlZISk1MQURNTnEwT0grbFZNVVByWmx2MU5V?=
 =?utf-8?B?RUhXRWRKck9sS2w5b3A1bktzdjVtbGpLQlFJWTNtanVDRDNVMmVmZkxVTER5?=
 =?utf-8?B?Ykl4U0JsNTh2Q01RT0I2Vnp0NzFyMjJvN2NZT25Db0hPdDVueXZvWjE3RVJT?=
 =?utf-8?B?OFh4bS9FTlMrRmdBUkRadGh4TFZYMEtjcEdJbG1OZ0E2NnR3L2M0QVRQYnBa?=
 =?utf-8?B?UURJS0NieklNVWZ3WnZESzV0OHhoWjd3anZqdUZnbWFqR2xpNmgranBSSWlz?=
 =?utf-8?B?MVJPczcrVEFuaktsTEJJZmxsNXhhUmdoWlE1TWlOQjBhNkMvUzh6RmFpcDdL?=
 =?utf-8?B?ODRPU3J5RjlpWFRWUmtLcmpvWXpIRHlhTS9Ld2wrS21jL2JPVVd3eENpRTBJ?=
 =?utf-8?B?Zjc1amtaSTJVS3JyNFFPL3F4aTZDS1hKdkFJdzdydk1jWnJGYXh1bkprbW5D?=
 =?utf-8?B?RWxwQUhFMVVZOUtCMitoMzZhVkJQOWtqWVJYN3UvTmU5amRHMEhRWnNHbTRv?=
 =?utf-8?B?dmw0SG43R3EyYmFqb1FYak9MdXA5K3phT2IydmNaaHltWlhKMFRxVmxsU2tK?=
 =?utf-8?B?a05rdGRReURFaWZ2T25UZTNWckNRdjFld0sxMnJiRkxuSjN0a3dONXR4OGJ4?=
 =?utf-8?B?aTVTc3YrOHVtSjB6dGxyajdNUXNINVNaS0hNZHVTNHVpc1dENCtVWXY1R0hl?=
 =?utf-8?B?aDJXL0V5QUFkUUNyaGsvMXBXV0JBaWxkUEUyOUtweHMydkxLcmhsTVJjTEdj?=
 =?utf-8?B?eGdKdllqNUUrUGxzYThWYlA1a0p2eWs1RXFaWVZ3VmJnSHdjN1pBelJwL1R3?=
 =?utf-8?B?Q1J5b0JjaTBFREtOaHlQY0lKV3lRSS9BUVEzTit1SFMrUmdZV00zK3NNK2lk?=
 =?utf-8?B?NDRtVUM1dWhPZGV5MFJTZXlMRXpTT2J5NFQyck94cTRDc0VHdmFRejlYRDFk?=
 =?utf-8?B?allaR1Nra3hwMmVFdVVkR0k2TkREd3VVOGpRd1NlalcvdjdobThjWVkwQ0NZ?=
 =?utf-8?B?NUpGblhjRCtpa2hGbWlsRGhjYk4zcDByTGpRWjJvVGJKbUkxa3BSRVhpVFdX?=
 =?utf-8?B?czZiS3N2UVhmZ3hmdWgrSHhRWGVKNThqZ2VNdFZwa3YzVkF1YTRrRXBDcDFD?=
 =?utf-8?B?enJvUFJlUDFTdW5pNVpEbTVPZW9kd0p0OEVQWDNlYlBrc2lOaEIrdGhPSlV5?=
 =?utf-8?B?TjFHUTRiWFllMklVMWllT1BsZ3BiNWVwZEZWMTMwK0hLZ0JydGJ5K2ZRcm1a?=
 =?utf-8?B?WVNSZmVvV3ZPaWlESVFLdHpicTc3SWtPeHZBZ0tsVnBYOUJzY2NXOE9va2ZM?=
 =?utf-8?B?aWxrTDFtV2d5N2J0VTJzNkJjZXdzVVYyK3BoWlNuSHhjRGx0WVBWTVZQMldS?=
 =?utf-8?B?WW1IQ3Jwb1VnSU90bzNpRlFVMDZaaU5mWFduTFJuS1BrRnZDbWFHYnRJZzU4?=
 =?utf-8?B?OENvdndWZnZiS1B1dzZyTWN5Z3lpUGpXRjFvWW04ZTl2dXJ0Ymlqc0NEWDRJ?=
 =?utf-8?B?NU5vS3lXSGFyNEp2RTBXaE52NTR6WnV4bnZYUWJzd2Fya0VxZW83MU0vS0VD?=
 =?utf-8?Q?m72QfQSqkruu6Olw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc18de0-4792-486e-1563-08decbaae0e5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 13:26:31.2122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ma9P2VMUTZLzzXBH1U1LzUwe7k67gzA+su4DMcS4nvS/6sQ371sPhf6RglK6GQE/Zz3VKLM9lPJ6eqLTzAQ7Gn6PQWzkwdVBIvCVX/6Es28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4957
X-purgate-ID: tlsNG-42698a/1781616395-20479F3B-89F5A592/0/0
X-purgate-type: clean
X-purgate-size: 1384
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4111E68FE92

On 16/06/2026 1:36 pm, Jan Beulich wrote:
> On 16.06.2026 12:45, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/microcode/amd.c
>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>> @@ -128,7 +128,8 @@ static bool check_digest(const struct container_microcode *mc)
>>       * the digest of the patch against a list of known provenance.
>>       */
>>      if ( boot_cpu_data.family < 0x17 || boot_cpu_data.family > 0x1a ||
>> -         entrysign_mitigated_in_firmware || !opt_digest_check )
>> +         is_zen6_uarch() || entrysign_mitigated_in_firmware ||
>> +         !opt_digest_check )
>>          return true;
> Besides being somewhat fragile towards future changes (to the family range
> covered), this also sets a bad precedent towards the comment ahead is
> is_zen<N>_uarch() saying "The caller is required to perform the appropriate
> vendor/family checks first." My understanding was that a single family
> should be checked for in all such cases, not - as is the case here - a
> range of families. Using the (seemingly) opposite is_zen5_uarch() wouldn't
> be correct here, after all.

It is true that they're not symmetric when used with ranges.

But "appropriate checks" doesn't mean single family.  I suppose it
really means "know what you're doing".

Entrysign is weird.  All other uses of is_zen?_uarch() come with single
family checks.

~Andrew

