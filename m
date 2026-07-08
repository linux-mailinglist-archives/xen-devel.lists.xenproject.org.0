Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DwyBEhsfTmp3DgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:57:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B019723F0C
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:57:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=A4nr0BTN;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356793.1611338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whP1y-0003FS-NU; Wed, 08 Jul 2026 09:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356793.1611338; Wed, 08 Jul 2026 09:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whP1y-0003DI-Kj; Wed, 08 Jul 2026 09:57:26 +0000
Received: by outflank-mailman (input) for mailman id 1356793;
 Wed, 08 Jul 2026 09:57:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1whP1x-0003DC-KB
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:57:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whP1w-00G3K3-BM
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:57:24 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4e1eff-e002-0a2a0a5209dd-0a2a4501c090-24
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:57:24 +0200
Received: from [40.107.208.46]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4e1f02-400f-0a2a45010019-286bd02e3c1f-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:57:23 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by BY5PR03MB4917.namprd03.prod.outlook.com (2603:10b6:a03:1e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 09:57:20 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 09:57:20 +0000
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
 b=YjV/CRa2LZut5tRCjdW7AvemqSOvP50YVzOfEtUtoXvdun+M9wKYhL8HQg0Q782sRu4AlBHd7Y+AsohzMpzMypvWMsK36Z+sf4SaiHrgsE9sR34scpbikgJMGjcixTtQRv+eH2gWMGf8wFeRIH14PASjoCbdn9feOc7Yfwwz7/Iaf0fcVxY1yKR9GzedSZdHGx8+DxFYAo+2jp6uNlsB/nIDfFqH+Z2daCJhpNkxDjpGpoZYKGenZr/yHYbmVDw3bbQSVkbrI9Y6I3s1Ysjl5BUVSd2kpnAhOTi1gpSbXAdsK4fk7SKBUvc3VtH3z9VgmneATUEmKBPKGPQUNx/elg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHar/Ys01Zp/AQHn0OyjwupbCfYO7CtDJEZM8KXbG2c=;
 b=HUec2e+x+Jqh6HrLJ8YkO154JZB9uQbcFM/83IQRgIv91ECNmmXmkuL7b9iYbD+7wzr0Fwsogxs8LQnVQRe+u27HrCIKpoxkRdNIf36FI9XTw2Qc1wRILoQ5gM5r3+t+kFdgDTX88N9sZmZKILDuGHoPLFx4VbQufVmwsgRG7cxnav2XiWgTKyQULemnAY3uoS5nz8NeEYHO0ELzbtvUdgOUQ4uGCwuXs49oLyw048644OF79BxBhpK2rj/VdIkbM/bz4LOpLYuACS74QBQm9SpLDON3RRbc4bXnRxZtuanad+9/wGEsKnABs3ximFSTxx+hRspxfXSIJs16F0veCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHar/Ys01Zp/AQHn0OyjwupbCfYO7CtDJEZM8KXbG2c=;
 b=A4nr0BTN+F308FD7wAnop+XaJmWCIYvddle3EWnb2CBNxxeL3zcI+QfRz0Sgom2uja55VljV1xxYMwF7QGaaPQ7DPEZ383F+MW4+kxyCfhdFKKr4/Juwe057VLvRZSDMrNWSyZ9aCCyQIL+oJx+4MM8alInhEKieHzULqf8Q9ZM=
Message-ID: <f4c52bd9-4851-488f-98dc-7188470fd850@citrix.com>
Date: Wed, 8 Jul 2026 10:57:14 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] x86/emul: Adjust handling of CR8_LEGACY
To: Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
 <1783502974.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@vates.tech>
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
In-Reply-To: <1783502974.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0126.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::23) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|BY5PR03MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: bec86e77-bf52-418d-7f72-08dedcd74b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	h2TjobWHKVkmFO56v+pwxWCAO/4ludRA7nAIj1WqyzdFe8L3nfXkGi6VFPdfvRSuad1peskbhWgnxe/nKAsjac7mErUcce9XsV8SzMu3oxolUu2k9eFPczxYExEreyTWEaOqBZUCGmWrwwMk0t7r0DqVfodfEXUVCLZcaDGHCRpXCcfuBJAc7vM2pqInSQhuGnPBzqept27/V8kWTOLSFo4ew+4qj3pHxiAj8yFr3Xlxs9ev/xEGjEt+cKdYmdRCbs05MVswNuyG5irqqABA1g/Fcg44SvCgo/O33AjwlNlTctC/+l+zE33eyUtOrVB4DV9qFGFavnN3Uu5AlKY1G540LcnpS6gJm34YnFEUUZNcQ4fTzaPi9yFUgmBkRmgrFuru1YESoldUNNuYgkAyMeXroBcbms5p/y/4CYSiZHEGXH6/a3856Z7E275okKx/zkr4QVkrN9j4+XgfgAZdbjKisswLhsUK/gfausB7jZrE30Cg247RtuSXB8DZ/Sbx6Z1g2wU8Zban3qKpri4UspGIKA8DFHp+Bi0yB6GpV4veik+6LenTYO6TD6g4rvsja4ep8qsLd3dpnmJwLdDucGEAS3PQTHVZPxOn5dqju1IKsf3i0UGWKo7wWum/BRbMMWhsXKiyWqMRjCBk5vyFc0cXovs8PvOwVKpC9QpUzxQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHlGQlVaNnl0UGorSHRwdDRNQTBhTHVPMk9MT0N0ckFIK3hqbTVmYmxRV3pJ?=
 =?utf-8?B?VWh1U1NOZlI5ckRQSWduaVp6UkVPTXU5L0pzUEYzUHNtaXArZlhnd0oya3pz?=
 =?utf-8?B?cmZaYWJyNFlnUDJFS3c2Q0Z3czZSNHVlWlczb2R0OXgwNmQ1aE44UGpXZWZa?=
 =?utf-8?B?c0ZmSHNzdHlCdXRyTU04REdpaG9SbkU2dGRGWWNyWS83NllxSVZ6S05IeHMy?=
 =?utf-8?B?VGdmamJRR1BiZW4xeXU5eit5TVBsNHZBSkFGa1FUbU4wVDFCcXh1Nk5jQTY4?=
 =?utf-8?B?TkZwZHBVUmdBaENkVFVBRUFCUnBWbFhNUHQwSFUveVRad3MwbXk4SnUrRjE5?=
 =?utf-8?B?a3B3RVhxMmpxODVBU3lpNDZLQXpvR2hmYkhhOVM0ekJEVy9tTE9teVZKaGd6?=
 =?utf-8?B?am5iSnR2aU1QdlZPeGx4NFI0K0JRV2syZ2FZbTBDTmxsMU9MbXFWOEVEV3k0?=
 =?utf-8?B?QjYrV0I4bGlweDVCaHMvdFkyOGRBMHpzQ3RWM3Q4Z1VrUzNQQ0JkRUJBTUxa?=
 =?utf-8?B?L0pDV1h3VU9ldWJnaGhYeHhwL09LY0FrZ3ZoYk9MNElmVDhDbVFOSVB0eW53?=
 =?utf-8?B?VXFrdnVvQnI4dHQxeEJUMjRYeDNsKzVQc3VSV2JmRDltcGVqSUlSQ3NGcnU3?=
 =?utf-8?B?TjdPdlFIaENXaUZzemlBS0NMVHVsQUVjYUkwRnF3Q2FtN1liRnZQQjBlaVhF?=
 =?utf-8?B?bE45RG5zM2MxaGdUV3RZSlcwWnBIQklZeXUrYUo1ejBXZHhzWXR6MURtbjk1?=
 =?utf-8?B?TTF4WU45RU1NQzlpOUFKdkkxWFFMNkUzdUtNeVNSL3F5ejRONnFJUjl4MHVU?=
 =?utf-8?B?KzBGcGduV2RnN2VYNnFhVFlNY0lpT2FzZHA5Z2ZzMDl1WlBjQWRMRHVGOHhZ?=
 =?utf-8?B?ZkJEU0NMWWFsZWZ0U2x4aVBNRDNGM2U2YTM2SXFLUnJzUlJaT25MUlZZcW1a?=
 =?utf-8?B?YWVlTWxDZ1dMbXBHZCtEQXcwOCtOVVB0SEF5SFo0WkcvWi95RFpCVVp1V3lK?=
 =?utf-8?B?TkVpMSt3cmloSlpraTJldTY0QTZwaHA1dXc0YmRqelVPWS80ejRwdlRTM3lp?=
 =?utf-8?B?K2p6STFpcVlXWlBDZ0d2aHFqZUdQSWNUd1h0WXlQWGx0dTk3VTE5UHBKR2Zj?=
 =?utf-8?B?QUszRS90YjdpSlBteElvOURhNC9PeS9uMHhMSWdxaVJXRkdIYmlNNXgzNVFm?=
 =?utf-8?B?bWxhU1ZLelAyUlExV0swMkhycmorRTRNSW5razg2TW42MVZYUG1GeHU4SXVu?=
 =?utf-8?B?cjluSVJMMUhodjJ5RzdnbldYaGdtcnZoYXhPeG9JZjdTNlBqS0lyTml1MFd0?=
 =?utf-8?B?TUozWHRCNXZZTFJiRDc0UVlFTXBhemhLLy9pOVdkTlg4Qk9tM3VLQ05nTTZx?=
 =?utf-8?B?QWNwR1VDdzZLSkQwQWhvR202clIyMWR1V3FYNk5wbCswaWxWeERBTUxmWTl4?=
 =?utf-8?B?dzhwMUE3REdOUDZiSWRnUlcrZDN1aDZDTnI2Nmh3cWszakRBSjdWS3AxczUr?=
 =?utf-8?B?eWZFc0VOa0NHNlQ2R1B6bi9ua1I4ZC8zTU9ZWkhJS2w2Ty9kQmlrQjZHcTMw?=
 =?utf-8?B?cTg0ejRuMDZkcUprMzZjMjExS1RRNEk0RjRFOHZxUFRqeDNnL28rVDBpUytM?=
 =?utf-8?B?VzRZWUlmT3RBUC9LSklKR0EvT3lTMlFldVdkNXc0Y09aM2o1ZkNleWpXT2Zh?=
 =?utf-8?B?Slh3cFZvdUtNclJFY0Jrbk1RaFErV3lXKzRRekJIWkJJdlNPcnVMc2lXUTBY?=
 =?utf-8?B?SnNKbW5mVno3TWxRc3pEMkloQzlvQ2ltWWJENG9Td3N1OXQ3eFNHaGU4R0RP?=
 =?utf-8?B?Q1l5a1B3Q1pCa3hKcEMxUTlpenp2cUY1R2UrTmk3dXpKbU9iRWNXOTB0amEw?=
 =?utf-8?B?TXVrZE1RbEdSVzhVU05YbWVLZkRsQk5OdEtZWnd0STZoWWlYaTNnVTNQUkJB?=
 =?utf-8?B?aFpqL0ZEM3IrUmZCc2dWd3dhSVdYRW1WWjhmNjRzVnRmS1pwbjRXNGZmSkRE?=
 =?utf-8?B?M1dGMjlsaDZ6RXlZNmVsc3FTeUkrbW5PdTY1OUI2Q2pnL25KWE81b2Z3dkhE?=
 =?utf-8?B?STFNc20wS210SnB0OGFlY2hlR2FFZFg0RXJ1cXdoZkkyOFYwazN0ZlJhS2N5?=
 =?utf-8?B?SCtrb3Eyc1Y2eG5UcHhNUThndHB3TWJBNnc2amM4aGFialVQQlBmWE5jSUxV?=
 =?utf-8?B?dkdicFNqaVFaM1hCMGp0N3hMVEJ1YzBDREhzbGpYeEVWZmxkSVRBU05KbUdi?=
 =?utf-8?B?NmJrTng3NGdJRTliUGtkMFdoVWRneVlPY2tEbmtFbzhIeXU5VEJTVXRtNmhI?=
 =?utf-8?B?K1diUDZUbk5OQjd0L3c5ZGVWQmZWWlk1RS8wTnFYVEl6MzZSenF1dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec86e77-bf52-418d-7f72-08dedcd74b84
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 09:57:20.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5j+6m+WrnlWY4jISmSy4z27wxKBLK9JV7+txddixaQ60Xyre0erIfpznzE+XOMYow8MVMyWil4qHeA0RVTSG+iqu8YE1P+UV6//AWnvdmMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4917
X-purgate-ID: tlsNG-d62444/1783504644-D06D61E0-138769D5/0/0
X-purgate-type: clean
X-purgate-size: 2553
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
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,vates.tech:email,citrix.com:from_mime,citrix.com:email,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B019723F0C

On 08/07/2026 10:29 am, Teddy Astie wrote:
> Le 07/07/2026 à 21:49, Andrew Cooper a écrit :
>> The APM description of the AltMovCR8 feature bit is:
>>
>>    "LOCK MOV CR0 means MOV CR8"
>>
>> Adjust the decode logic to behave like this.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>>
>> v3:
>>   * Change yet again.  A contact with information on the matter
>> confirmed that
>>     it is a special case for Reg = 0, and not a general modifier to
>> all Reg
>>     values.
>> ---
>>   xen/arch/x86/x86_emulate/decode.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/x86_emulate/decode.c
>> b/xen/arch/x86/x86_emulate/decode.c
>> index 2c13356c4d17..57f6baffb066 100644
>> --- a/xen/arch/x86/x86_emulate/decode.c
>> +++ b/xen/arch/x86/x86_emulate/decode.c
>> @@ -780,12 +780,12 @@ decode_twobyte(struct x86_emulate_state *s,
>>           break;
>>         case 0x20: case 0x22: /* mov to/from cr */
>> -        if ( s->lock_prefix && vcpu_has_cr8_legacy() )
>> +        if ( s->lock_prefix && vcpu_has_cr8_legacy() && s->modrm_reg
>> == 0 )
>>           {
>> -            s->modrm_reg += 8;
>> +            s->modrm_reg = 8;
>>               s->lock_prefix = false;
>>           }
>> -        /* fall through */
>> +        fallthrough;
>>       case 0x21: case 0x23: /* mov to/from dr */
>>           ASSERT(s->ea.type == OP_REG); /* Early operand adjustment
>> ensures this. */
>>           generate_exception_if(s->lock_prefix, X86_EXC_UD);
>
> I'm fine with it; though we probably want to make sure we always
> advertise the AltMovCr8 feature bit as APM suggest users to always
> check for this before relying on this behavior.
>
> Interestingly, I see this feature bit set on Intel hardware.

Are you mixing up the basic and extended feature leaves?  Intel does not
have this behaviour and doesn't (to my knowledge) advertise the CPUID bit.

> Though, it's a reserved bit in SDM, and lock mov cr0 is defined as
> being #UD.
>
> Which CPU model introduced this feature bit ? And does Intel behavior
> matches AMD's spec ?

That was in the v2 commit message, but I took it out here.

AMD K8 Rev F.  Prior K8 revisions didn't have it.

~Andrew

