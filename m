Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wnm3JdNhMWpTiQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:46:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9D4690A5D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 16:46:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=TnhSGaMH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339345.1600531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZV3Y-0006GZ-9f; Tue, 16 Jun 2026 14:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339345.1600531; Tue, 16 Jun 2026 14:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZV3Y-0006Dx-6N; Tue, 16 Jun 2026 14:46:24 +0000
Received: by outflank-mailman (input) for mailman id 1339345;
 Tue, 16 Jun 2026 14:46:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZV3X-0006Dr-7W
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:46:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZV3W-0059ts-B0
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 16:46:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3161b1-5cb7-0a2a0a5109dd-0a2a45079d36-42
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:46:22 +0200
Received: from [40.93.198.54]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3161bc-229c-0a2a45070019-285dc636d4b2-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 16:46:21 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB4944.namprd03.prod.outlook.com (2603:10b6:208:1b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 14:46:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 14:46:18 +0000
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
 b=VqRNLrGbqvi0r6+/QXUwiTSjbnKRbQ1ggPWQhoFcsGMaehsgYrALn0NrsmbszpoJNsngGBjdaZi/YqyDvQ0grF//4QTBDZocuqCy7H4pZuL+fMlsYEdScoxo8Wy4fHTjDjinGCFEo212vkEpH1b5v5vkqgACj+GF4EmRA8aQeBxegeRNH3nL/k7uNBxSgawPtl+/2biQ65fFV0BujhD/NDwv/2P2R2zUSY3vhfliHZjpK3oyfKUjsMOcqum1hPN8aHgmkl1KeHS8AjklW1m6ErNWY20TdeNrhuaqwj4iov02qBdkZliOpG7BRBt2tezcZvxx57JVpBeIKq9X7SGw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7Yi7tuFDBkQl8dlFPF6y2666mRgl71KF/vKmX3x+zM=;
 b=BYclHRdk2Sh8e/vgw4VGOA71bOfbOQWyhzs/baBIpjnPjo8inONDoLXasHdv7dkjNTlammOuflIavQO4Z1ashxEdISD5RZ0i52rYtZnA85NK6RIXWSxKL/hx6hT5V5VoUc2QHODkzZNvgqreWAOFUxpYdX+1QWB8zHIbvv79utJn1YNOEJdv64o5b99gidZQnGhf74pJXZyx/sECbgbqCR3w694G9RZbRBIwtxVsh/GE8ukjNVxPwD28Q5BaisNn9DsiAzFKhvlOUahVox4ArA5Sr7VeeXaT/k9TwrzByg+IF2wKG4ZuqKTca5g4Eh/rbnx1J7p8cuiBwn6DQjCGVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7Yi7tuFDBkQl8dlFPF6y2666mRgl71KF/vKmX3x+zM=;
 b=TnhSGaMHF7/xT8mSF0AXPyCh3wRjj7wXlRhrdQ80rkqxwkiJhaWyLHi27rcw5llKyTmEVi1BcH6N4LPuXFxjnwH7QXUrSz3aHW/rKDpZo3j8txnjOH0dGTblfqmEBLBWE3DVlUd0NXmLCImwllA9YofOSdxjYMNDnXHTKcS+UUI=
Message-ID: <92ade775-d3fc-457d-acae-ae44fe1285df@citrix.com>
Date: Tue, 16 Jun 2026 15:46:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v3 4/4] x86: Split .init section to satisfy UEFI CA memory
 mitigation
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Frediano Ziglio <freddy77@gmail.com>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-5-frediano.ziglio@citrix.com>
 <ajExivEwb88pcOxT@mail-itl> <f80e5c37-96db-4af5-9b9f-28f4ff457a72@citrix.com>
 <8b27a14e-865a-462e-a6dd-1f8323de5f43@suse.com>
 <a7d9c983-c264-4a90-ba17-b2a49bd85c18@citrix.com>
 <53afba1b-a791-4ebe-9d00-3ca66065c524@suse.com>
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
In-Reply-To: <53afba1b-a791-4ebe-9d00-3ca66065c524@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0102.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cf::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: 90258621-bfda-4710-73e5-08decbb60614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bzqC+aC/0MSZvIDDDFrgF7BsmrtBh+yf1KYo456H4nCqs+2XKgKGDdI9+ICKxPpf3xVY5MdWt/zmYQi3v4IhOFIOMw3FjgIAPaCaAvTK9czb/9ZIHVVVIGUM/XcE9UEcwKofzXgktt95YFbN+jFPpz77DLKaVqnfsxx3IifFuC6pK7muhwJJbbQ3HGU83hDnqWLg2J/iAOUuaJ5eoo50Wwpv1GqWWc4m5ApkUcFXOD9BcGrS2RECep6yOR+oAZWu1rNYnn4IT6/9qSDLF/DQr7RIZnqL6tm0xIalV7e5yUg9tomyGKt46aZG3FqYRYoB43l7pCa8QPk0VSnHKy2P4wQH6LZIrK9gDkbgj8tf8sj+1Z4RLML6nBg5vZ3QuZg4SYAp9ELhMBfnK6XCaGZh3Bwn/Onbdj8UYEQhZQH3CRD71KMXD+uOifu6fZ33WeyI6dNhMUyjDP8EznR5LY5MMXJmG+XDpVLW9Tp+KsEQWBvsFMoQBF1P7HVwtOp8VnKZlwZQ1i6vkH0W6xiVKHssXpPS+Bxw04e2wF3i+CTClnxP9N4mgu30lQp2NobiXy4CNH5F1zab1L44n6ErUNl9IJPcEtuGqEWyNcxENgE1D61cY3rhveWAsWQE9a2o3M952INg4jlMkoIBb356SR056sJI2eTD7XKpnWqEOQY7DKU7I9HJOS/Ao6jIkUeiKChd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTlld0FQTW9xZERLUFR3eDAyZWlIU1g3OTlFVHpwWUx1N3dZR2hqRlVwaHZP?=
 =?utf-8?B?bk8zMXJwZWNpcmNTaGN0clY1VHczUUdJTFV3Vmk1L1hQUVA2anpuS29vaFU3?=
 =?utf-8?B?M2FqQWtzQ0N2RWNYdk9YZ1ltY1J0UG5MbG9oR3ZPRm5TcWJVZU5EaVZ0SEkv?=
 =?utf-8?B?TWw4bnI4RFlxTG5uUzdWbXN5NGlPSUNUYUIwYmJzcld0bklKTkFUYjdkRmkr?=
 =?utf-8?B?TEJrUUFoS3F0S1JlWDVOQUVZcVdoS0FoamFHZGwzSU1neEJwelZYcnVMdFpm?=
 =?utf-8?B?OGVaeXhwMVhLTDQvTFpvaDIyYkg4T3k2cTFSZVFidSs4OHkvb1EweHZqN3ZL?=
 =?utf-8?B?NlkyTFZXdE4rSlhaOHpXNXR1SzFkb2tSb1hJV0ZoUEJ5Y3pDeDVtNXNlSGg2?=
 =?utf-8?B?cWlyMzFIQS9jK1BQK3ZLRUdMQXgxTXlEdXR0RGtvckVqMEZxekpBeWRnc2Zh?=
 =?utf-8?B?eWh0Z2x0YVZUSE9vOGhuMlo4R0RZYURyMjVBWldHQXZRUmxxazljaVNNbjA4?=
 =?utf-8?B?SDB1OFNremVEZ2lQSlg1SlE4bG9nenA1OE9zQTZ3VjRBMGxZeXlaVGU0Zjk3?=
 =?utf-8?B?NStLbk5xK0t6WFpnSDlVcGFycG5wUHl5UW05UTk3MjZvSklvbjAyQ2k0YzZj?=
 =?utf-8?B?ZTB3d2hqcWx4cENDMCs3aG1WUVorYXZxZHJTcDlUaVhTU3VEa3JDVFlkaTY1?=
 =?utf-8?B?OGRMeVE4STJqVXhZd0NEcHBjdUozUFZScm5WdFRTMHRlcitXU1RFS0lNYmhj?=
 =?utf-8?B?ZGk2cnZ0M3BSd2xTd1JvOVdpaEp5V1pOZE5mMWtqem0wbXdXNVcwWk5mWGk5?=
 =?utf-8?B?MTlvYnhiSnFKd0RWUW80bm8xQmFqeW5JNDJBSFJyMWh2VXVCd01WaTJvdldU?=
 =?utf-8?B?YTdQQVo4R3QyRWdLT293elh5a2dkelIxRmNoVmsxWFdiSGZqUEF0LzZkUTdX?=
 =?utf-8?B?bWxmblUvcHBVUVFBVFY3bWNoWnVCbXZFellUNmRad1RIbko5ZGx1aTdVaE5m?=
 =?utf-8?B?S2h5SzMxemhyQjY3c2NVczI3L3NtQ1ZCUFZ0MTF5TFc5eFN3OHhaNWNOYmtX?=
 =?utf-8?B?YjJvTElOOTZybStaaFpVakVseUhaSkRzK0VSb0JISDRGbHRTQWU5RnBsL1FZ?=
 =?utf-8?B?ZXRqb3pXdnlPdWpWVXYzdGFVcWVJNDQxSnVnUE9vWmJOMTRZVEpyV1ZUaWFK?=
 =?utf-8?B?NFIxN3RoMEhpcXJKZUg2SHh4SWRwczFUMnJ5aXJ4QThZNWN3WkM4QU1SNG9B?=
 =?utf-8?B?akR3blovRXlsKzYwRk5Ebkl3M1EzTkFRQmZzeXpEcUM2TFdCaGkyc081V3pP?=
 =?utf-8?B?TUkwWUZ5QjM2WDBlbjZudXFPOVppVUd4T0VUaVR1T2JjNmtYR3MwQ1RWek5t?=
 =?utf-8?B?bkt6NHJYQjZyeXpHRDJIc0VzbG5SR2lXTUFVU004SUhKOHNkZlNnbG5PMGVY?=
 =?utf-8?B?cG4rdGRuanl2K29IM2RIS3oyL3R0T092dTZpVk5MMlF2TGwxQmxIOHlicGxo?=
 =?utf-8?B?MHdBWDVGZnVFN0NiRmsydFlEZnZ4T09QbGZzMzQ1RC9kQllOeDFKZFM4RXpr?=
 =?utf-8?B?QXp1aVo3a2tqRWdhVElVektKcXRWQlhTSTdKVk9JTytiem1PN2dXMGZHeDAv?=
 =?utf-8?B?eE9GYk04T25GVkZ1dk13MlZ6ZkVyRHpEVXArRHNJYW5yVXk3ejJWak9uSWw5?=
 =?utf-8?B?L3d3eFVPSlRzYWx6NVhQZE91TWhEY253TU5DYW8rYzR4ZU1ZbzlmOTg5aHlC?=
 =?utf-8?B?cFFscmdldmxRVWlFY21ObzlUTnYvS2E5VEtXMmtCYktIUEF3dUJzczdiRmd6?=
 =?utf-8?B?d0JFcHN0U2FNeldDbExlV1lTZ2NQcnIwRGVORU5pOHB6OGRpTmZ5NEFhc0Vi?=
 =?utf-8?B?Y21KSFgwcWVpd1p2bmk4K1FuQ1B0NE00M1o2ZGxzUHo4RC84V3BxaGphZjZl?=
 =?utf-8?B?aU1NWEYrTDZSaUFqT1RrM0dYNmYrMm9aYXl0ZFNKYXBDTjRNY0hZTDUwVkEv?=
 =?utf-8?B?TG9lVGVWTVQzUy9GS3YvWUVwODBpRzd3aDhHSVFTQVh3T0xhQWJjdTFCbGJq?=
 =?utf-8?B?cU9vU3JQS2l4MGxYQ2diQmJlcHNaL3IyN3Mrclo5emRWakpjQk1sbWR3RzFp?=
 =?utf-8?B?c1pyVzlaaU9VMDZxVEQ5a0tNTkZpZGpKUmxtOGh3UUEvUExaTzB6WitNOUVD?=
 =?utf-8?B?YzlSeFM4OHY0L285eFZyQlpGY2FNd2VLTng3TWtYVWFoZHFvNE9iMWE1aW9y?=
 =?utf-8?B?K0hFL1p3Z203K3RHNkdnaElob0xodUdqclQydzkzUWpMUTIwTENka0VQRTR3?=
 =?utf-8?B?VUdzUmVhOG5qdmxzQzRHVnd6WEJmS3NwdW5kSkM2cVB5R3pVc2l2M3puVDBu?=
 =?utf-8?Q?JcfFiJkRoKeVS6ws=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90258621-bfda-4710-73e5-08decbb60614
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 14:46:18.1660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtE10GRqWpZIsJGgCkR79tKFLwbwovFDxn9ncSbQOjNkJwMZgu9E5iq2rCL0JOEHRCZpMnjlv9MvgG2QQakIvrZEwyNMvvjvdNhbpVoIhSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4944
X-purgate-ID: tlsNG-ef75cf/1781621182-0A971C48-A044A549/0/0
X-purgate-type: clean
X-purgate-size: 1841
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:email];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[suse.com,invisiblethingslab.com,gmail.com];
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
X-Rspamd-Queue-Id: CB9D4690A5D

On 16/06/2026 2:50 pm, Jan Beulich wrote:
> On 16.06.2026 14:40, Andrew Cooper wrote:
>> On 16/06/2026 1:30 pm, Jan Beulich wrote:
>>> On 16.06.2026 13:29, Andrew Cooper wrote:
>>>> On 16/06/2026 12:20 pm, Marek Marczykowski-Górecki wrote:
>>>>> On Tue, Jun 16, 2026 at 11:13:36AM +0100, Frediano Ziglio wrote:
>>>>>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>>>>
>>>>>> Currently .init section is both writeable and executable, split data and code
>>>>>> to have 2 sections satisfying W^X rule.
>>>>>>
>>>>>> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
>>>>>> in the pagetables.
>>>>>>
>>>>>> NX_COMPAT is a requirement from shim-review,
>>>>>> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
>>>>>>
>>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>>>>> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>>>
>>>>> Is that the last piece necessary to satisfy the NX_COMPAT requirement? If
>>>>> so, I suppose a subsequent patch should actually set the
>>>>> IMAGE_DLLCHARACTERISTICS_NX_COMPAT bit (IIUC ld --nxcompat option), right?
>>>> We need to satisfy everything in
>>>> https://github.com/xenserver/xen.pg/blob/XS-9/patches/correct-sections-permissions.patch
>>>>
>>>> .reloc needs to be non-discardable and writeable.
>>> Writable? Why?
>> Because we take fatal pagefaults against it when it's really read-only.
> Wasn't this for relocations _against_ r/o sections, not the .reloc section
> itself?

Frediano pointed out that I read the script incorrectly.

.reloc needs to be non-discardable

.rodata needs to be writeable because of editing the relocations in it.

~Andrew

