Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u3gkMiSgJmpDaAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:57:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3711865563C
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:57:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=wDU7j6rR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331591.1594156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXfY-00079m-0f; Mon, 08 Jun 2026 10:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331591.1594156; Mon, 08 Jun 2026 10:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXfX-00078P-Tx; Mon, 08 Jun 2026 10:57:23 +0000
Received: by outflank-mailman (input) for mailman id 1331591;
 Mon, 08 Jun 2026 10:57:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWXfX-00078J-5p
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 10:57:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWXfW-00HNvQ-H7
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 12:57:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a26a005-5cb7-0a2a0a5109dd-0a2a45098ea2-30
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:57:22 +0200
Received: from [52.101.57.8]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a26a011-2497-0a2a45090019-34653908bcbb-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:57:22 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6477.namprd03.prod.outlook.com (2603:10b6:510:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 10:57:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 10:57:17 +0000
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
 b=ikbs90yQ0RtEnFiR41YFrltCMcdhpm5OGa71ZT/32sVA+DQMh3knjnHn+ZYxQkQ5l1c2p8azg0eFTG6pMtCQmdWBL9+qhslx0oRDf6e0pBpBeYFH3uu3+gGcl0XHRHha7EdZHf4FxiIl0BphQLmHuosD9bzQOKpPJpnrluG5sJZKkTYNg24GoIYQ7o5KE30RXYKz4PRClS0b/BnrKC9Ikmd9lK21FGazmSsWdwdxXU9SOf8refdEBTcEjD2cRlmU+kWLTlGGgXHm1tQje8wP0m8oP+MYKqIJE3fi1hjHyFkyW0XRiccY1bYp/nOr54Ufb1y01PXc2ymn0ZSe5JLvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jz+ucGBYpoODR0sefRRf75M5nsQQgesV3gAsSYUpPNM=;
 b=ea5IMLjQ5WhQMUfyFj/iTh7bMNHcpg1zbTQXHBSspi7FvBdfDXwfDktu58QQIWndeKTLJhdHkIfFxgbB/fXMk6rzDEXY32tMrhW9+538RQJd+T1AHbjPCiXzHzBsG7g7t8WKv0X4CxQLRGP9MEUsVEJZ5OAPZ8w1BY61nJQcxO1hKxGwhBUSsi2pBDrY1qid9AwikBoud+k6HwCB/yNdVm2eIBwAL8REMLvzAabY0OYHI8NwehcMwW5pEbCnjciEHQ3AcYy43DsOBgLY0Ty/dcoXQVe8T19Pu5OeIaho9i8oQansBa0odbgwsuao/2j4G6mySnJp5NQjPTBWRHdkXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jz+ucGBYpoODR0sefRRf75M5nsQQgesV3gAsSYUpPNM=;
 b=wDU7j6rRbRdAyXprCxldpZVTQAeKL1yXoeknEeDwZOvd3QWerAIK4wng7M0Ae0rJLd6stKbys9v+iKWJTLN7mWak+8M0dTnaBOwXFzd37r/u6OqONYIL/HIrCG2yXm37+UPkcJi88B/JtoMdfm9kD/DfzAdh4pbZ/8QtCZq+VJk=
Message-ID: <34bef293-0929-47c8-9dab-7570be2483fc@citrix.com>
Date: Mon, 8 Jun 2026 11:57:14 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22(?) 0/2] tools: Use the system liblz4 package
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
 <4818e5b8-21e9-4f2b-9977-8fc4c9a4889b@suse.com>
 <23167e00-685b-4033-aa8c-6c44c705448c@gmail.com>
 <2e6bc1ba-72d6-4b4d-ba1a-226eb74fab0f@gmail.com>
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
In-Reply-To: <2e6bc1ba-72d6-4b4d-ba1a-226eb74fab0f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0112.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e9efd2-0ae5-4283-828a-08dec54cb496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ja5/Ak0X3cQbi/ZdzVFDPSdwaFrf8yRgW0p8VsG/2RJBT/XgbByaoLcrxVOp4hFU6T8UunGpTHuyxkmBK9sbVY+QpnUOP5YAsHWSAwYntiOR4xQ5ZTBb3B8nX14SNrCn8KDWJjGNEKxEYLFOvBPTxILeN5VBMWTD6sKwql0GuIGvQz2MbbZB6MIRCeDFkws0CRFVNucCKB1RIIv8DNduYN1TTLLq75YxbqIvbcz3RWHjmwoY8+bZDGEe9ERlSw5VePX3Poc/hq4yEDPpd0e5JUxJQTEMXlpX4SK/zHf00aUleq7vssLGESACUMdrbW74WZ2arpvSU5enfLa7z15Z/01auIr3pVVhKD6IXzX+QlRMrE+w23hWo6enXEm3DSthx/q1gGdxtohOabwaiPSPAY2KSYXXR8LQu5C+nSPS1zuBKlbrYlLlM9XOeHbPao83IriDkbx+sfX/U4B178TiWRcqX8fj90Jh0llX2zOMhuqLQVVMOmTZfVARtwPwMRCPJy8aSLV552EwBC5HoX+6JF8Kp5OSc258cuK0paeW9vAGAPN5F8GWT87HC9bXO0YNmfocspoxxsxlMrL6kXa6FqPA5aQ9Luo9dm55vyxMQikyxmNtUxsjcGGD1kw2vZsMX4hNGOpXYoM61V8pes1Zcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2Q4b1ZRdnV1Uk8vZEZYc2ZwTUgzbEhKTE1BVWloZTRWcmRoVWZTSHFvUzBC?=
 =?utf-8?B?aGZyTlkyd2VXSktETHByaEJEMjJiMEM3N01jZWRLTkVieUErQkRXRE1mRlVD?=
 =?utf-8?B?akZJZzF0RkhnOUlDNXhPSjMxL3pTQ2VSVENDWVBGS2ZEN0VObUhPRGpQZWtQ?=
 =?utf-8?B?djQ1Q1IvQktSN01ZSEhkcnZtaUlLRzl4T21aNzNsU24wQTBpTzJ0UXRPaHpF?=
 =?utf-8?B?WlBIczhNRVpQN2dCblVtbi9lVzZNUk8xRmNva09HTDZ0RmIyYnk3NFdicmJk?=
 =?utf-8?B?U2dtRU9wblg4NDhOYXBRWUtoMkF6S1AyY05XTXpDcVZHdFgrMzZPZ3BIMm95?=
 =?utf-8?B?MzBUcFMrbURHeHAzaHZQS2ZpbzlzWDJJK0tuLzZ6Tk1qQ3ZXcDQ2WE1KYzhT?=
 =?utf-8?B?MXgyWllnY1dhbm0wbkc2NEh6MkZJdFVTUnB5SGlwUnIrdngzWlRqcWVjNElD?=
 =?utf-8?B?NDFKMGVHTkVkNHZXTjJHWk5uazgrOXdDYUk4TzRjZmI1WmRJT2F4aHJ4ejBL?=
 =?utf-8?B?dGdML2F6MjF6UnU5ZnFCbVRpT0VoUFcxZ1NRZnJLa2lnd2VnM3pMa2pIa1l3?=
 =?utf-8?B?TjI5QTl1QUZxUkZPRDFOU1VaYm9YVTNJNVhIZ1p1ZllYc1Q1Q0R6VEUvTmJG?=
 =?utf-8?B?NW9ldnUwREp3VXhaR3hSY3Fla21LR2x2TzdJMGZiRTE2dEhtTHRvRXJ1UENu?=
 =?utf-8?B?VmlrSUFGVUNxeHlBQzA0aElQL3ZqVGZIOHZYY0NGd1JoUUN6T0RCRUdXU3hQ?=
 =?utf-8?B?QmdDeFA5dkJtTHJkRUEzUnVOd1BiUG56R3h3aWVpWEtYTEdlQ3E2MXJ4VGZk?=
 =?utf-8?B?ZHBFTUhOeENNLzc2ajc2d1VrQkhPd21oV3k5U0JyQTBFU2VOc1ZPZTFvUFp1?=
 =?utf-8?B?SDJJMDdmanlVZk5pODJGVjBSdTBQS3hvV0srVExnTDBmWG4yMU9xaXAwc2l2?=
 =?utf-8?B?V0JlOWNZV3MwVjZPWnhiQjVMT1dsRkxKeTU0RDRmTWJ2enF6YUQ4alBYYnB4?=
 =?utf-8?B?Ky9wdjh5TDdXQjVKSHQzSm9SVGNRLzI4RjRZQUpBakV5T1l3VTVHTjZsT0hN?=
 =?utf-8?B?bUJ4ZGVkSGE2RE5uWDI5emdsdEZwZzlHaGl2ZHV0aWczL09QL2JGMWpqN2dP?=
 =?utf-8?B?emJycWhXN3NqZ3pNK2VGZ1Q2ZkJFdElvZDlRa0dHTjBybHkzY0R6V3Q0UlVU?=
 =?utf-8?B?cnBoM0xBZkhxNDlFb0ovR0JGcGpXUnpBeHNtUzNvaTlhRkVVbXFmalhWdDls?=
 =?utf-8?B?eHUvMDJNT3UvRHpyK3puQ0NlNlkrMjFmSG53MFVsdm5DUEM5RlJ1UGpuUk5q?=
 =?utf-8?B?dm1veU1vN09KTDJqT1RodTZ1dHpySEx3YzRiVmhObGVwY3RyNGJHWWhCc2R2?=
 =?utf-8?B?YWZSdEpHcUJzQ2M1Q25rTzA0c09UNGRWRnluNTdIOCtDNVJLWG8vTEcvLzRM?=
 =?utf-8?B?emdReEd3RmFaTWxwL3BkQUNFZEVrQmx3enlRR3FCVmlVWjArRkovRkRtZlI5?=
 =?utf-8?B?d3NRS3l5QS9WM0dYalZmbmh5L2c3OUc4S2I4b1lxZUs5cXdRMk9wRDloU1Iz?=
 =?utf-8?B?a3c0L0tNSHZuTVJJUVdGNCsyeGszVk9WdEU0T2gwR1A2d05qNU1aWGhOR2hx?=
 =?utf-8?B?TE9kd3JxelNRRko4R2VhemVTYXVOZFJFU1BEdVNDM1NYejdiT0w5S2Y0Slg0?=
 =?utf-8?B?VFM5QlBZY1hiRjVaNlFZcGdKc2xUczBkRUw0VVR5dy9tODVLL3pGM3R2aFpq?=
 =?utf-8?B?V2Y2WE1nSTYrQ0lNSUVGeUtLZzNDQm9WZVJtTWQrTWY0N3hwM0NKMzM2NlRH?=
 =?utf-8?B?VkExdjJ2RzF6empHdlQvOTErZXRLM3pxZHZXUUVqWXVtanNxRHRsTGJLQXlV?=
 =?utf-8?B?dU5FZy9tWnMxMVc2V29yM2JMQnhMRklTN0tPQ2FQcXkrWmREOXZOcmtYUUdh?=
 =?utf-8?B?MDNyUUg5OWFEZHZhOVF6amc2Slp2VkZGbThvMVU1M0tGc0JoS0FJVERlU2tp?=
 =?utf-8?B?Y1cvNEtRYndYYVprQmN2T3lNeGs3dkh3ZlMzUUk0YU0yL1d4Mnc5K1A5TmUz?=
 =?utf-8?B?Qi8rRlZ0R0dXUFh0eHJuUmd1RmxkbFdSUlBzdVBRRGVSbjV0WHBSckxUZEFq?=
 =?utf-8?B?QmlGUTU1K21IT1NoWkxsNitWdjZ0N0FmL3V4aVNqNjROY25VZVhscytMWkpn?=
 =?utf-8?B?L2xUN1NGLzdHcFF2M0pXUC9wcGp0d3BaSzJaak5xRDhvYWJ0cnFNUlB4cVFy?=
 =?utf-8?B?Y3BXSWpmVDRSUzZySXM0QmZ6aUlqa2V4R3FzcnY0VHVNcTI5ZDl1QzUwREFv?=
 =?utf-8?B?K25PUHhJMzRpZTI4SjZ5ZzNubnBzRVQ1S0xOSWNJZkdLMnJROWlla2grbjhy?=
 =?utf-8?Q?VjFi71WGrKSd6CEE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e9efd2-0ae5-4283-828a-08dec54cb496
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:57:17.1956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzyMr+jiWcS8sO0KSulBIQgBAq/dVqbCBQLcMYncZfQIJRhR6Bj+ezfIDjRCsalDEs5xzeNE6hU85QL4P/v1BAvmCgOAtK1MtRC95Rxnttw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6477
X-purgate-ID: tlsNG-bad1c0/1780916242-4377AA53-862317A4/10/73395122804
X-purgate-type: spam
X-purgate-size: 2029
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
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[keepachangelog.com:url];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3711865563C

On 08/06/2026 11:51 am, Oleksii Kurochko wrote:
>
>
> On 6/3/26 3:01 PM, Oleksii Kurochko wrote:
>>
>>
>> On 6/3/26 11:16 AM, Jan Beulich wrote:
>>> On 03.06.2026 10:53, Andrew Cooper wrote:
>>>> Switch to using the system liblz4.
>>>>
>>>> This brings libxenguest's lz4 decompression in line all the others,
>>>> rather
>>>> than using the unsafe decompressor from Xen (itself a port of
>>>> Linux's unsafe
>>>> decompressor).
>>
>> Generally, the patch series looks straightforward and low risk, so I
>> am comfortable taking it for this release. Considering that...
>>
>>>
>>> As stated in 84f04d8f0dbf ("libxc: add LZ4 decompression support"),
>>> there was
>>> no shared library available at the time (and on the SLES versions I
>>> worked
>>> with). Later a shared library appeared, but the -devel package still
>>> wasn't
>>> there. On my main dev system (intentionally a relatively old SLES
>>> version) I
>>> therefore wouldn't be able to build/test LZ4 anymore if we went this
>>> route.
>>> (FTAOD this isn't an outright objection, as the goal of the series is
>>> certainly good. It is mainly a data point to consider.)
>>
>> ...does not consider this an outright objection. While this may
>> become an issue sooner or later on older dev systems, if the change
>> is accepted into staging, we could switch to the shared library
>> approach in 4.22.
>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> 

I've included this incremental diff for CHANGELOG.

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1db3efc4864c..5cf19372a361 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -13,6 +13,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    represent a wildcard input.
  - On x86:
    - Enable pf-fixup option by default for PVH dom0.
+   - The libxenguest bzImage loader now uses the system liblz4 library.
 
 ### Added
  - Support for per-domain Xenstore quota in C xenstored (includes


~Andrew

