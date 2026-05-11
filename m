Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMrcBnfyAWqymgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 17:15:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56301510FB7
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 17:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306288.1578332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMSKr-0001if-A0; Mon, 11 May 2026 15:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306288.1578332; Mon, 11 May 2026 15:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMSKr-0001gY-5t; Mon, 11 May 2026 15:14:21 +0000
Received: by outflank-mailman (input) for mailman id 1306288;
 Mon, 11 May 2026 15:14:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wMSKo-0001gS-TM
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 15:14:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMSKo-007ZZn-9f
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 17:14:18 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a01f24a-5cb7-0a2a0a5109dd-0a2a4506c068-0
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 17:14:18 +0200
Received: from [40.107.201.54]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a01f247-7371-0a2a45060019-286bc936a6aa-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 17:14:17 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5664.namprd03.prod.outlook.com (2603:10b6:a03:28f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 15:14:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 15:14:12 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjTSrFfZS2Z7/pqW4IurIGG/5O88Iekndg9JmbBunoI68rUyB68dO+rGHM97dq9catzT/D+qSux4W9LQUZl7rXymmA++R6Q58xD8rdMTvkpcWFrtqFKIZ/vwQbdAxI5wJorNFkBjUCv7hA9fktUoNGjI1NzyPmZkxu3VXcOth1Lo4fMVk1y9Kc0zXKtK7XUAjy7P9/zTIRyrtkJTBVCiOoVQyvlBfQW6TROyJZLJO3WwQcXYUO4sWwKygkONDQohhms3j3iezx4SJo5l5DrVUZ6hDPAxPxuKQsENnxn8V5z/Wm2DSTmzDj9PgXFUoxbq4rAGsa0wQIv2TAYxF+BgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M97IDBq+YnAUaXPWbaO956Apv6hCI5spQG7tyga0720=;
 b=tCcMwLEtXiIGtHImUT04s6u9DGfb5u7zj0j5tqxRc08xG6VnUnA4MPO5LX4EIYeUnwTXTj0m553iiRaVc/A0YvXSjAPgHVnOMXt6tLR5LtMQhSTYz72/F9dkq5Z7s2dffGSNYLVWeHciEdNtIa/saOZpTBh7y8XlWybUDxIO38kKkkZyblj0wtPzzpiyJ75P6TsgYuOKylU14gxi7BnD1tzx5Q9oTgq8+nZPjUHR4zEFanSIBqbLfgTKRgL3MPFNGvL0/xSqFNECVAm1ztKmalgPNxIRvXYM4XUpdZftvEfGclZq4j4FveF7wW67laGjsxEDm7mGr91PGvoIXHODuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M97IDBq+YnAUaXPWbaO956Apv6hCI5spQG7tyga0720=;
 b=AMlePjkA1obn+hBz/elmRTJaLq6cq0qmiVP6NHVUP6EqvDElqTUKdIcTs8EIrQNpTmoe9a/FzTsKJjN3GaAY31WDdGnrJBzqadgob0krHmtbdzmFdnmTnuSS44FMsaRv8CJSyjNcJn7RaXoXVluhvDllH7kvaVjt1z4Ra/IblaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7a834ada-c91b-4305-bed7-90e8b5331791@citrix.com>
Date: Mon, 11 May 2026 16:14:07 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] nestedsvm: Clear GIF when injecting VMEXIT
To: Teddy Astie <teddy.astie@vates.tech>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260423161112.50221-1-ross.lagerwall@citrix.com>
 <1777481694.8631fc262581453bbf619ec5b2062170.19dda2a3d88000f373@vates.tech>
 <c41ff9d5-82ff-4a7e-bff3-85e866338897@citrix.com>
 <1778510159.8631fc262581453bbf619ec5b2062170.19e17775cf1000f373@vates.tech>
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
In-Reply-To: <1778510159.8631fc262581453bbf619ec5b2062170.19e17775cf1000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0362.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: 9686fc1b-da72-4672-8948-08deaf6ff48e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|3023799003|11063799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	f4FEsAOPab3g5D0vIgkyRudkVnTTZjrdNCFHGiyTAuWLY94ERNmwve6p8LjGu+d4a/Fg3y0GIVyGe0QDwuxO7RVeYm0pXrJQh/eLXQNspR3m4ZZTCmSZE0zXc75cHjlmUh3AbLTXHCoucogj0xrYdUmIftozznKiKV5s1FAlHbXPAlI1tFm7nTxSK02ST6dwjaCt2YTJQFd10NZX+rzq6Vx1GivY0+LAvihK8VTRpdp7SJEICq/KJRTwKWvsJfMR4A1ZHH/ex6ddVVSSmAiy8ThPMxYrpjKnHTtN1to+XFy/A7yCgnXa5R7LlgyQc99Fy+/WqgAXuxoNHbkdhP3CyO/rEs6xtJOOEsexnfNvcOystTUAh6zTi1bfCfPkWu14WbY269fygFEo1/3yntc4zXpPf0n+x1x5S1bSYZJcYy8v4wwDcXv30d/qcuRGPWlfHIGGU18Cd3Mjy6dB5FtYQ0hmi48yiaiy6cJoQh+fdYfqGWlETonA/XSAPamgKiMyhde9Hd4veKiRPEdzq4mkvbsRnkdOsp+NuuKb6PML8vvCj324PU5X5XePSvfqEkH+RIzjzIocZcJVU+YxmjPDW3m9q/EDDXGTeJ8XZcql+wQCxAuT8Nm8ISVZklr9cxBK2O+mVRM8GtN8HtiucNlrLyDs3z9/Ti6Zp5HGh99qATWDb4PWQTO1W+zMBXVLUhgH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(3023799003)(11063799003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTlnV0l1emNqS24wdzRRZDFORlZjYkhIdU9kREdiSTJHVlQ2WGxVMEJxYk5X?=
 =?utf-8?B?MnM0MGREbWZ6T0NOYmJOVUxkbEM5R2JGcDdRSnpjMjU1VnRBVHBweWtVcTlh?=
 =?utf-8?B?Q3NJK1FvUEV2Ni96Q2JYbU04T20vZkhkaitJNE5QcURkOExlamY2a1dxZmJD?=
 =?utf-8?B?VUVWZSs5SS9CbG9ZV1hCM095UzlZT3JZVTRrZTZlc2g5UHJKS0ExeGUyTXFD?=
 =?utf-8?B?WkIyeTR5WTR0aThzN0lpUVlSbVVwdVFYZkxRQk1UMzFOMzZnZHNhN0EvbUYw?=
 =?utf-8?B?U3loaHVDWFBrWTB2UCtXdmpUWFJyTkh5dHJtN1d2K0ozSHZiUHlxeGU0MUlp?=
 =?utf-8?B?bTZzSGEwc0VURkRhdGNhSjRRSlhQKzUyRnl3NUlNalRid2ZGZXQ1bzdZalVP?=
 =?utf-8?B?MVFsWWdRTTBIQlNYU0drL1FVT2VmTk5OZzJjQThSTEVYM3FkT2o2ZmhRNVJF?=
 =?utf-8?B?aDVJRmlEREtsNHJFRTRVdmdQUlFmNmRhUnJZeUJHUWNNR3U1eThpc05xT25L?=
 =?utf-8?B?dlFJRzdUa1ovSFlndHBCMzdaNzcrWS9DM3MrY0pVeUJBa1pYRFZyLzRSSnVV?=
 =?utf-8?B?aDd5UlRjb3NpczZiT1UxcU4yMmRxbUFYc0EvSTluZC80MUZWT1BWLzNUblUr?=
 =?utf-8?B?RjhTaCtTa3A3Z012ZS9paktYaHFUNlhUbGxmM2l6QnlTbng5dE9yQXZxeUtx?=
 =?utf-8?B?ZVVuR2k5WEN6QVo5Qmk4M1J2a0NDYzdDNHd3NTJsTjYrMW0xVTYybk9vL3Rn?=
 =?utf-8?B?aFlQY3lyQ2ZtVGh2LzFxN3Izd2J0RFZsOXk1M2NGUjNOemkrWWU1WS9qQmpG?=
 =?utf-8?B?emszVklpeDF6L1JXTGZ2dEJQSThJOCtXMDNsaWFpcVNZYW1DY2VuQ0VoWm11?=
 =?utf-8?B?MW1wS2YzRGpQMjFKd2hsV1JqaXRlbnpzUWtKWXlJYURiVThvc3dnMTRvbjk5?=
 =?utf-8?B?T2FoMVhMcnVUQ2g4bW5zUHllekNoYVBybUNHdEphZEsxWmRJUXc5Yi9CdzJh?=
 =?utf-8?B?N3pNUGhmYWV4b3B4N3RlVnVBMFVVbjJiamhlS3dtQjNxMzFINVJnR0tiOTFp?=
 =?utf-8?B?cTRtaFlEY2R3a0ZkUFFFa3BxcXlZejl6bnFkeHpjWEJiWEtKQktYdU9mazFZ?=
 =?utf-8?B?WlFKRzRrYU1XZzQwZ09VK3A1aGRHcjNWRWkxWXdhc2YzYThGbmFHV3dETXpX?=
 =?utf-8?B?WlIxaHI4N1FCaDNLRlN4NUV0WW80NGdQOEFYODJXWFhZM2ptWi9uRExRMmpX?=
 =?utf-8?B?N2N4aVpvdlFLYzJqUFdBZ2R1eDEwcWNPWWFvY2dwUmo2UzVGdERYU2pKZVNG?=
 =?utf-8?B?a3N2V1NLUlB4ZVJxa2ZpRGdhSVhNaTVNMEF0WVp1YnJ3Qkt0OC9za0w5TVhj?=
 =?utf-8?B?NHdMVGhiUElFZEZGdnlOa1VZZkh5NlFmOGh0Ukt4amVqa0VOOGRhZC9VL2Jw?=
 =?utf-8?B?dVZ2NStjeVJxY2FxZEhDTnJ6YXR1S013VjJDcE9IazY3K0lrd0tVRVlVenBu?=
 =?utf-8?B?alZIQ1RYTXRsNXV1eWNzRnZpTTU4SkJEVzZndUhaanlXeEZ4cTRJeFF3Vnhh?=
 =?utf-8?B?N3VzdEg1dnJsVVpmOE1uYW5NWkRldnJBdmhpZjhlcTVPT3RIeFc1aHRGYllU?=
 =?utf-8?B?dDd3RG5uT3dsZ3IwWlNxbHhxY0FaMzBxQ1BESGpwTEZ3QzRZMHN1RlRtZ2tN?=
 =?utf-8?B?Q2FqVkRHNlluMmtuTk8zd21EUUdJZmF1aG5UWnNvUGtNbkV5ZjA3TzYyK1k3?=
 =?utf-8?B?ZmRWNVBZeU9tQjQ2ZmRTRzJHcUxKbThtZEpzQmpnMnk5UzBRUVVSbGZubEY0?=
 =?utf-8?B?SEJ0Ky9YeEdBbHFmcjZOajE3d2QwMjJ0RmdhTWMzd3VMaGpta1lFTVBOZlRm?=
 =?utf-8?B?TnhPb2dNYjBUT3dNZVdjcFBSdllkRHEvbmkybkJFWExFRUxBWVZvejFXeFc5?=
 =?utf-8?B?Q2pzUjJSQzlrcEl2WEREZmRUcEl6bDRvbWVVTitSQnp5enN1QjBJUzZ2UUto?=
 =?utf-8?B?MXN0ejBKRGo1eUZXL2x5NzEwa2t4YzQ4bjdqQU5BeldFeGhJeGVFNWpXWitC?=
 =?utf-8?B?c3UxZE83RzBhWmlmd09Ob0gvckhlNmxqUktURnlJNG1tb1JrWEdHelp6RGlD?=
 =?utf-8?B?d3BXTTJCeVRVWkI1dU5uSHhtTVJDdjdzTmF5MFFpZUhxUEV5RXRlQkpiYU5L?=
 =?utf-8?B?SXB5b1lCRVYwVWZEL3VZL2l6T2ozTFRNc1kzQjBJc1U5ZC9pYm91Z1luaVgw?=
 =?utf-8?B?RHZ5YnF2ZWUydXRyODN0ZUlsdXFEVzZiRDF0aUFZdDA4RlNJWmNXNTZMSVV3?=
 =?utf-8?B?Nkp4UVFrTTJGaVdwS0RSOHlXVWp1ZTlDSGt3dUUzOUk1WHJTVFJDTnZCbklU?=
 =?utf-8?Q?QOte5bxf8YddyNvk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9686fc1b-da72-4672-8948-08deaf6ff48e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 15:14:12.2858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvvHOKyDZAOb2XYXX9BN11GjdjcqDgdTPhm1dCdqOZ09P2IfSmVSfE2ky0cc4U4arC9pNpalftlr/qkY1WXU4JyRIBI1xfz5ZzMNQxEWAZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5664
X-purgate-ID: tlsNG-16d1c6/1778512458-84158D75-D5E68047/0/0
X-purgate-type: clean
X-purgate-size: 3437
X-Rspamd-Queue-Id: 56301510FB7
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 11/05/2026 3:35 pm, Teddy Astie wrote:
> Le 07/05/2026 à 15:03, Ross Lagerwall a écrit :
>> On 4/29/26 5:54 PM, Teddy Astie wrote:
>>> Le 23/04/2026 à 18:13, Ross Lagerwall a écrit :
>>>> If L1 executes VMRUN with the GIF set and it fails consistency checks,
>>>> Xen will inject a VMEXIT and fail the assert checking the GIF is
>>>> cleared.
>>>>
>>>> Instead, clear the GIF when injecting a VMEXIT to match what hardware
>>>> does.
>>>>
>>>> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested
>>>> Virtualization")
>>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>>> ---
>>>>    xen/arch/x86/hvm/svm/nestedsvm.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c
>>>> b/xen/arch/x86/hvm/svm/ nestedsvm.c
>>>> index ef6fa5d23b67..f89b087a1155 100644
>>>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>>>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>>>> @@ -733,9 +733,9 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct
>>>> cpu_user_regs *regs,
>>>>        struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>>>>        if ( vmcb->_vintr.fields.vgif_enable )
>>>> -        ASSERT(vmcb->_vintr.fields.vgif == 0);
>>>> +        vmcb->_vintr.fields.vgif = 0;
>>>>        else
>>>> -        ASSERT(svm->ns_gif == 0);
>>>> +        nestedsvm_vcpu_clgi(v);
>>>>        ns_vmcb = nv->nv_vvmcx;
>>>
>>> Looks good to me, though I think we are here looking to make a "guest
>>> CLGI" (clear GIF), so the vGIF specific logic should be collapsed into
>>> nestedsvm_vcpu_clgi() instead of having it as the non-vgif-support
>>> case.
>>> (as IIUC, vGIF is a hardware accelration for nested GIF handling ?)
>>
>> Not 100% sure I follow your point here but v2 of this series removes
>> nestedsvm_vcpu_clgi() entirely. Does that address your concern?
>>
>>>
>>> (also making me notice that svm_vmexit_do_{stgi,clgi}() seems to lack
>>> vGIF specific logic)
>>>
>>
>> Isn't that by design? If vGIF is enabled the hardware should handle
>> STGI/CLGI without a VMEXIT.
>>
>
> I think at some point in the future, we may need a
> `nestedsvm_vcpu_{stgi,clgi}()` function, or something in that regard;
> e.g for emulating this instruction outside of a SVM intercept path
> (x86 emulator bits ?). As I think there are cases where the
> instruction is not intercepted but still needs to be emulated.
>
> Such function would need to know whether or not we use vGIF.

Yes we will (eventually) want emulation of STGI/CLGI.  It will
specifically not reintroduce nestedsvm_vcpu_{stgi,clgi}().

With introspection, we do get arbitrary instructions running through the
emulator.  This is why we take care to ensure that the emulator can cope
before a feature gets enabled generally.

For normal cases, we either have vGIF active and everything is handled
without VMExit, or we don't have vGIF active and everything hits the
intercept; this is not a split based on hardware support - it includes
both L0 and L1's configuration.

In fact, vGIF is a feature where on older hardware it's actually faster
for L0 to emulate it for L1, because a virtual VMExit/Entry and running
the L1 vmexit handler is much slower than L0 just emulating it and
re-entering L2 as if nothing had happened.  But that's an optimisation
for a later day.

~Andrew

