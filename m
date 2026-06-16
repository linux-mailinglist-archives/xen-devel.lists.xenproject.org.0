Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4ivQL5szMWqudwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 13:29:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2705368ECA4
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 13:29:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=h3LkKL4d;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339160.1600299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRyg-0000s3-FK; Tue, 16 Jun 2026 11:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339160.1600299; Tue, 16 Jun 2026 11:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZRyg-0000pJ-CK; Tue, 16 Jun 2026 11:29:10 +0000
Received: by outflank-mailman (input) for mailman id 1339160;
 Tue, 16 Jun 2026 11:29:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZRye-0000pB-PJ
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:29:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZRyd-00GWKh-UC
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:29:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a313372-e002-0a2a0a5209dd-0a2a450c9cf2-20
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 13:29:07 +0200
Received: from [52.101.62.39]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a313382-62f1-0a2a450c0019-34653e275fa6-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 13:29:07 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5211.namprd03.prod.outlook.com (2603:10b6:5:24a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 11:29:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 11:29:04 +0000
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
 b=BwdO7BcCHT2pkzd9eOwsAc1vRwxGAmkLI8nPFWwoXzrr1ssy0GTem28RCVeFJuvZ+cVYYvKbUL4hCXpXYL9l9uYRzPbNsiaax6oXQbHy6tR07x8pErnzmqP6/aEnUMMtLv2iW8hkDxkV0Dl+HvByA45DQnixXe41+q3ycqG2ay5eDWAwCa0DHx3T1+gXKDMDWG6eL0lYlLyzw9Hl/h1OLFM51m2R83vYpV13ikBD8O1XtzJpDcOwnawJfrVg7xyGSzXR2ynR4oLgBE3a0uPYMYkieB8fCRayXOtmgVLax4LTgiw4k819Z2bJQJgHOzuFWHoX8Ch7nOck4vXrpUO4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VW4fEGc+zkGNTxqe69hvPLtsydJuc+elLNlgPFoY6y4=;
 b=YakOzEAhO0wDnjpqDD3sHyelzW7IsUvKbAftlpqJ/gf1V40JNc98Hap4w6BlxHw0YmL7xO3q+MTXVdlyTkXJ7c6jwlOndcT5NM/suyfjUiS2UhpbZhGUbXG2cTpRpgzFYPF15R54lWnCJbjeVBxoIYheFVtK8E/JMMFrhgi999/7b/Sev9EmN7FXwn3ZYi2jW+4dJqGxo0TlHjeESEXUn6QPieLoIe4xhARcw+up5rLM2lrpXeZlPbmj96iTcV98KwegJNx6VTFAQMx4ZGhvZ8D8RRzjG72ybP7KrGhmpeu2WfIvOOEzZRHbz8nHGo95o7E5Wv/UETE22hn4maas6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VW4fEGc+zkGNTxqe69hvPLtsydJuc+elLNlgPFoY6y4=;
 b=h3LkKL4dg328LxF3hiaGb2c1qadM83eLETZGWxQjyBqb+dKcurRym0Awgch6RqkHyrT+pzywUmoARV7ib7CtRtqK+e8BZ9A8r1EfgTKVx/baZe0MmYzkClwMK9m5iDeArYDd/kF6M7LtpDUNR9Cw3Dnr+bEBSNyYubcdRKb9doM=
Message-ID: <f80e5c37-96db-4af5-9b9f-28f4ff457a72@citrix.com>
Date: Tue, 16 Jun 2026 12:29:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 4/4] x86: Split .init section to satisfy UEFI CA memory
 mitigation
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Frediano Ziglio <freddy77@gmail.com>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-5-frediano.ziglio@citrix.com>
 <ajExivEwb88pcOxT@mail-itl>
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
In-Reply-To: <ajExivEwb88pcOxT@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0355.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd33877-bce6-474d-ff6e-08decb9a78ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2ZWoSvA/Ue7wXuFKhSrOcsHj6VPjKOm94b40RdKWA9/ZeO7JlVfvO0VOtwJ2Wd/reozBNnpgG8ZzDXKytvz5cEa1mUDiETKzkDYWJD4JB1z27x4LyYVu0ULGC/wPfsuaa7MqjIN7OkNgYxfUJw6j/y4FJu2ZN+0rdd4yGzvolODHY+ijXenSVydzjqGtw1MBKLMxR/5W4GuBtOZtJikHLLWm05wvF0NCOeVwzX2G2Cz0Y2EwKGZKGI6LVX+R8xeBK02RBADiFeJkExZqE3qX/lDkxwRuHS7az1uYHONBiHMNFzPNDQ+oDM8v40ybZhtVOOXa3/W8go2U+pUHL8O4jiMSa+6CCELeSlBnj+VM1oeomjMAJRVHfBLJ+aXojUEH00v5utT2Ogt1LppCFc5VG5ER0FKf+QFQ+cTt7fir9o4OWer0cRPD2/TqVz2R/4+hXsrX2wwFstOw6iQdlUpjUS4zRNLssuBa5A0Gq/ZT6K3FKq7ZceVqjK7VbT6ENn6AIopk9OmZnxcGaURF+0wV12VBcG+gD+h9XZeoHuJxOwocHECuAq2rqLJ1Y3xxD24mrHGm3fxJASRUgwjnxOcuKQWyH7fcKLrd+YI5GyKgMYOaNF9OHIyVYQ2JHFA6SN3AsfoLkwGCNNUkFR+qsAy8zX6aAGGDFpyhRe9ghFDVuhHx1RDDCuRHUu2nra4hgCI6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1V3YkNmSnZtVmc5VmozZ2xXZU82REFpQnkyWXY1M3lLdUE5bmtWYlFWUklF?=
 =?utf-8?B?L2Z4RXh0U1loSG0ybURWSW5iZ21ublhOcHlBcGVrblFYTklNL3FHZ0JxWU9o?=
 =?utf-8?B?OVVtMG1IdWNFcFZiZ3FkdFJXV0pUMXoyaW9XWlB1MnhEZlhpdFByNERJT0p4?=
 =?utf-8?B?NDRpa3MwRWkxT0E3RlgvbWcyTkZvdVBKVG91K3J5amRnTFFlSVlCVFRIczF5?=
 =?utf-8?B?dHFMU2lTTm9Ha2JBTms3RlpyQUZFZ1N1NEY2VUdGbk0yN003VWJwemhkb3BH?=
 =?utf-8?B?MlF6ZDk5VXR0YmxCRW5QejBXb2pDZWNiZ0VvRFhQYmxuZm9XRjIraC9ZQ0th?=
 =?utf-8?B?ZTVtOVRZbHRmcG1nYzNWQS9peGpaMUJxWkswbUc0MXNBbVl3WjJvbkFNTjVF?=
 =?utf-8?B?QUZhRjlWZDZCMXNjbjdydzd2MWNsY0dxdnZBN0pNb0RBa3YxOTdFRWJDcEts?=
 =?utf-8?B?akx6ZXJRUXdDUG1wWkhZdyt3S2N1WExyNkg3TW9RdU9DSTE5Nm1IRFFLMUNY?=
 =?utf-8?B?SXdka0EzSEdScHhETld1eWtKSVRueDZTVmpTTWZzdjRWSGM0d0Z1eWJZMGVs?=
 =?utf-8?B?MGFrQ0I3NkNDdGlQeWdzalpoNHM3VVZMMlFSVEIrSSt0Z1hVK3dTdU5NTG5Q?=
 =?utf-8?B?TDZNcytJUzRMUG5WUkJyYnExWjF5Z1BsSW1KYTk4cHdhd1cyV1ZGeDhBZ0ZB?=
 =?utf-8?B?VGpKa3JQbnNOOTNaWEd2QVdudUQrTy8wamtlbE5GbDJvd1lsRlhvWFVIYlNH?=
 =?utf-8?B?N0o5OXpGMnhEc0tWN0NRRmFXa3kwSW5UQVk3Sk9hazZ2WXpTU1pEZEo0VWZR?=
 =?utf-8?B?UHhCOGVtYllIdXVGOG1zRzgwUklIbzZ3M0ZrT0xQZHA4SU0xU0pFSkkxc2pr?=
 =?utf-8?B?Qmg2T3JGK0xyT1JTRHFtbCsybmJvNnpZcDVReUlSOGJ2RzBUYU0yU0tIa2hM?=
 =?utf-8?B?TWg2Q0xrTzFSSGs1Zkx0VjZNdEZmeGJoNHdyVlZTYktRSEVwZEJCTUxtQitD?=
 =?utf-8?B?MncrL0YyRXhMc3JoRFM1NjBVMXJzR3NhLzE1dWxQdnIxRkZoTGo1NUFnS2Jq?=
 =?utf-8?B?MFhKYTRUaW9TWmpLVTdaTXBFbWg3TnBzZ2Q5RGZlQXYyeWsxaWtLRzg4WVpW?=
 =?utf-8?B?YnByT1ltMlNncnFZQ09TVUh3MzBWdGxqT0xVMStMMWNQVXhzNzNvTW1JRXI2?=
 =?utf-8?B?c1NIMUd2YVlYampSN05Fdy93VmJoLzNvWUUzUzJVWUpjcEg5YWpncVZLMGRK?=
 =?utf-8?B?Q3cvSXBzNURnck1TVk1LL01ua3VFWWJtZ2RLR0ZNVjFEcVA4SmJFL1UxcnRL?=
 =?utf-8?B?a1ZzZ1lDMXVNRTdYa1dnQWFrMjZzTkVyQUJEaEUvUEhJUWtvSlNvL3E0RTky?=
 =?utf-8?B?cVBTdW5hTjNCRlgyYTNYRDdxTnFIekVIOStHYVpuZDUwZysxV00vcDhXMmRZ?=
 =?utf-8?B?SFZJUVZKTkRiNmpncVUxWGJhYVVQM2JGaHlIZkFLWExqMXJHMWQyZWtiWS9o?=
 =?utf-8?B?M3JLTEFKbDlZb0wyV3BTaVJ4WmEzbDRkTG5KWnQ4a3MzL2dJcEliT0s2a0t5?=
 =?utf-8?B?OW1BMGlIQTBQc0tEanhldXM1bitMZUtBRitGTzMzSUdic1hlOUtUY0tGNU54?=
 =?utf-8?B?UWxZazV1SzZiZEx6QzVIQ0J5KzdubnpZalFyc0VPNjk3Y1ZSbkQrUnJNWjNH?=
 =?utf-8?B?RTluam5tcFBzME5vK0x1WEhuT01NR0VGMWZHRzEwOElUU0RBUDVZSm40NTNO?=
 =?utf-8?B?SmRLWW1CZWpBRTR0Q1F1QWNRZ3FIcTlRejFGVVIzK213aEVKZklEOGFVVGY1?=
 =?utf-8?B?UDFjcHVzdXpvRmw4UGFOWGZpRFU1c0RwZ2orbDZndXVEaEd4aHU0QnBlSkpB?=
 =?utf-8?B?cjdweUJidGloSnJGWjJEN3BKa0J1d1JrTm5ScStvY283Qm50RUhMN1F0WFJ0?=
 =?utf-8?B?MnllWFIrTys0R3RFNWtNUGVZWEdPdU5FUS9tbjNmY1NmcXdhYi9mQXk5c3NQ?=
 =?utf-8?B?YW02d2pqV1pJVlhZSkI0Zy9FUGNyVGswREY3REp3YzlOMDMwaE5mM0ZKUHRY?=
 =?utf-8?B?SmlBeTZaYy9uY3VjT0RuamxPek9GK04xUTlXaHdDSGd3SWUxcmJFcDJPdkZK?=
 =?utf-8?B?UU9tRVBmazZ6MGwxT2ZOeC84bUpPUnNDMUVIM3hTdkhFMzRORWNKUy92OXRZ?=
 =?utf-8?B?L01TbXJaQThBV0ppdm4vY3dkam9QUy9XcXZIZUZSbHF5cnQrT2NVNHVlWGxh?=
 =?utf-8?B?TXR5UXJuWTh2SnpRdGgwbENQbTVkSUNqdDM5VlJLOTJOVDQyR3JlM285RkdR?=
 =?utf-8?B?RjdGSjdJL0U0bVBlSmp6Yml0Yi9XK01vajdqTFczeG8wRGNUZEs0eGV5V0Z4?=
 =?utf-8?Q?TfR9+amGiAWBcRpc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd33877-bce6-474d-ff6e-08decb9a78ad
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 11:29:04.4097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXPxWsId50TOb4JczqqnzDwGNYgOuzN6uRAU0sEJKeV+ubRXSIBq/0a++W0I84zJlxzQ9rpfp7myKKSrBg4XAt+Cbd+8g5ZnmhfBfprNEW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5211
X-purgate-ID: tlsNG-d25034/1781609347-E0B64CF5-4A8B433F/0/0
X-purgate-type: clean
X-purgate-size: 1284
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,m:marmarek@invisiblethingslab.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,cloud.com:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[invisiblethingslab.com,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2705368ECA4

On 16/06/2026 12:20 pm, Marek Marczykowski-Górecki wrote:
> On Tue, Jun 16, 2026 at 11:13:36AM +0100, Frediano Ziglio wrote:
>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>
>> Currently .init section is both writeable and executable, split data and code
>> to have 2 sections satisfying W^X rule.
>>
>> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
>> in the pagetables.
>>
>> NX_COMPAT is a requirement from shim-review,
>> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>
> Is that the last piece necessary to satisfy the NX_COMPAT requirement? If
> so, I suppose a subsequent patch should actually set the
> IMAGE_DLLCHARACTERISTICS_NX_COMPAT bit (IIUC ld --nxcompat option), right?

We need to satisfy everything in
https://github.com/xenserver/xen.pg/blob/XS-9/patches/correct-sections-permissions.patch

.reloc needs to be non-discardable and writeable.  This will require a
very recent binutils and a patch (series?) from Jan.

~Andrew

