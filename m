Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kdKMHZxAUWo5BQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 20:57:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3A173D778
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 20:57:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=jwJs4n16;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359803.1613189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiGPb-0001cL-CZ; Fri, 10 Jul 2026 18:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359803.1613189; Fri, 10 Jul 2026 18:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiGPb-0001aH-9n; Fri, 10 Jul 2026 18:57:23 +0000
Received: by outflank-mailman (input) for mailman id 1359803;
 Fri, 10 Jul 2026 18:57:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wiGPZ-0001a9-Lu
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 18:57:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiGPZ-007vrE-2m
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 20:57:21 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a51407b-e002-0a2a0a5209dd-0a2a4507e506-16
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 20:57:21 +0200
Received: from [40.93.195.31]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a51408f-ac46-0a2a45070019-285dc31fa1d4-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 20:57:20 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SJ0PR03MB5870.namprd03.prod.outlook.com (2603:10b6:a03:2de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 18:57:16 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Fri, 10 Jul 2026
 18:57:16 +0000
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
 b=meUcSkxmHWUCTPimcQHV3xTW7AKmLo7HOdddmyp7Dmfizba4dONoIFb5t/f59FewE8Ngp2uMLgW6Ya9FVmzuyJi74CErEFtS9VW/g220o6ZROS+/fTroNDRBL/CGOso4dcO9fIyZtfJjh42HFmK8PmghnuZXO6mxRg5SwN6gtB3WGsHWzR6L6WFHp4FLx05aY9k+5yEsN9RPl+O4uY7Ut99tvtg3FgjdB6K5fFzpNcA8B/sSME9nyiIrA0uiTy8qwqwbqgT9BEREAF2uOGnV1Ks5wEEuqTfMXqYidOOqgfh+r+CfZZFEdpepLLLwck368wIYGnfy3/k2OhoyhwPj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO2rpI6jKmcwoof9QYqzfONsv5KjTgE5vpxDjWDBNGk=;
 b=f1NHdnluzNdzKmwuEKkas2uXCGKOW7RWGxR3g9nuq0TqlJhARwksctZumVbPotGo1xEJAZyj5jMJLE4lGcu2uA+a8h54FKXq0pqwYPn+6LQxLNHGQP8VcdpZwPU4zYpXJa3GHwxmTZa95+7ifP/aIGGqaWNPH+4JFrZJwasJE5JY2gwht7VqZVrspyJjKh7qsYQgDhMsTvUW5q+nfGZAv5Ylfe2elB9XfkHj7DAtBCVhApFyeWXX/OIfOOixFmdAK7+fe6oc63KVWVGySnuk+R495QW1IcIVJuyGfMIUkidu8BDZiX0IQuYi7ZjK2xN2ZqoFIXCUMDkQ8RoIt3k2Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO2rpI6jKmcwoof9QYqzfONsv5KjTgE5vpxDjWDBNGk=;
 b=jwJs4n164+f3+9LLSpzvBmJ81HqGYLm0AlaaMToO82iDa3haXPLZC3mG4pf3wryv4uTqyyB59V0MP3GvrLpYjkwh0dZjQmqJnAACjwT1WtTIuEc8eugkf3ipRVY3cpLx0L38lG8qlNYE05A/APTOiHUgdMOt6v46dFE5/Ri1rug=
Message-ID: <8926d886-4956-4f09-92e4-b4acedcd9f8b@citrix.com>
Date: Fri, 10 Jul 2026 19:57:12 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Andrii Sultanov
 <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 4/6] xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from
 the ABI
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20260710135503.301746-1-julian.vetter@vates.tech>
 <20260710135711.301993-1-julian.vetter@vates.tech>
 <1783691844.8631fc262581453bbf619ec5b2062170.19f4c519a02000edb5@vates.tech>
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
In-Reply-To: <1783691844.8631fc262581453bbf619ec5b2062170.19f4c519a02000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SJ0PR03MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9804da-ac69-4bf2-87a8-08dedeb50f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|22082099003|18002099003|4143699003|11063799006|56012099006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	81WY4+arViIkC5ZZbCk/DtRl33/R9dGv2bu2rv5LyoKNCDrd/K2gghisdSmJNXiaBUMvdjGfNuvBjhQmH1PtqhRwa8LgNtFAtmeaZTRYSbEJpbkcAd4mUvbhnjq9CcKY/QlxtKJQHdHZkRvyrmtxVE6d84C5nuqdxaZiSr8uCi04P6tAWAebYUd8VOKUasQXwQGZKzuXkIVYFGZePHvk4Ps/hVWseRb4yyuYhPmdx9me+eBqpXbO+K3dE4imL0ZGPw4XxmgQJSmwiibzqHkjNT919EfkVhA1i+04mk24qKGOiGiA26PkDW/1PFrNUgmvnLjG2tLuVZEqmnEpr52U/HmCdjG8D3/cZWS7bb5bgfghQZ4Dkn7QlNrKJO/1AGFfvM1ZDT2Cs8Br1oVUD3Fl5k20CY5hGZwJau4ON860kn5X65QmqX4yOmNAjJt5UeKGd3SImPopTSC2B7vXSz3mFopGC1z4clDUyW660vJ7kgaWZxH4IGz3MTnL0Zp78G/nHWn3K20TnRU+BgKB4hlfLcZifyUFlT0uBCsWzNWhuYmRCd1Q3CwnafxDdNGRqvY5G15/DyzTY8doB8xJL+2RroUy1dAV2tdj7O+YTp87z+e5ZNcgZUqmJZm3LSAQluDu1ExKG4GPmTjw+gTcAIZYOAuMF3mAvCpZsEZ8kzqse54=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk9hekVTbEtEN1oyN0FsQWxiNUY4Z01NY3lzWW5sdkJ4V213b2IrNzN4VXM1?=
 =?utf-8?B?TXFFOGdKSVYrL0grS1hORC9XM1hqd3RjK1lORVZRVHpFQ2Q3OGhPK3d1VkdE?=
 =?utf-8?B?Qzd2WnZBRXdmL1JrZU5mSTRWemlWQ2lFRzFIL1BTQlAwbTBIc3Y4VjQyUTdu?=
 =?utf-8?B?ZmpIMkxMeWVHOUYrRW1iUnVOaE9ISDRCdHRyNHlMZ1VqbTJTVWNBTG9RL0lH?=
 =?utf-8?B?M085V0hhWmtneXk0eGJPeCtidzczU21Wb0JXVXpwTFZDclF6cFVqQmhrTnlH?=
 =?utf-8?B?RUhBL3RPTWNTYlBxdGZENFczQ1ZUS3NUTnRYNnZlNlQxb2F2aWxiNEQ0REpj?=
 =?utf-8?B?dzBUVnBOUXpmRUVieDNMMFNsR0VsRERucHpMN1lKRFR1YWlZR2xpVHV4QUEr?=
 =?utf-8?B?RFFibHhVdlppdHg2QzZ4RU5sN21KKzB1cHh1eDZDRDJRWU5BTi83Nk1Palcr?=
 =?utf-8?B?QjZSejMyNTNFbmxQa1o0OGdXMGJwMEM2eUF1WkhlQWFIU3FKUFNsMzFsdDZH?=
 =?utf-8?B?elhrQldzZWQrRHRJbDRzYndFSFZEQ0Z3ZndUNUkwWHNCUmphVnhjeDhQOWN1?=
 =?utf-8?B?RElOSnUxWkFLQnQ4T3Q1RFBvcnNaWkJWRmFkZXBZRVQ5TXZWenprNnR0ZUdC?=
 =?utf-8?B?ZWxiSGNOMVZPN29TaGlteE14QzJiOTRSU1Vmeld6MWV3RnRKRVluQlJGVTI2?=
 =?utf-8?B?OHZ2Wlc2VjdoRzNTK2tOS0NnWGVkZFZ0b2o0akVyL3M3OGYvNlYrTkZ3TmNW?=
 =?utf-8?B?RnJ1L2F1RXdyVTFTVVBGVk04WlQ1aGdhR2FSeUxSa1JVNitzK3QybVUxWTNZ?=
 =?utf-8?B?b3owMW13MmErRFlJNURIS0U0OE1iUjRUd3RGUWQ1WVEvclRCNE5KZXF4WDNx?=
 =?utf-8?B?Tm5nSk1PYjRGbWNXZ3lqVFBiMXltNkJJN0ZwZzdJREhHR09EZnVJemtBdDYw?=
 =?utf-8?B?a3NvS3Flb2FVNWNsRzJSNHF3SWljbVh3eW5YdlUxVzRGVjljTmh2RnRIcUJj?=
 =?utf-8?B?YWdBNG1uRU1IQUw2azNobklEQUQ4YmFxcEhxNUw4OVZJSmEza2RkQlRNK0JV?=
 =?utf-8?B?UGcyWXBHeXFJeGhDSFVLTFFBZUVxQjFqU0dyNHM1TnZRem8wUGlIRkVlYThx?=
 =?utf-8?B?UmVZOFhFSU1hMS9sK01vdkZqUVBUSit0bTNzVURiWTZxSDNLbGRqaGlWSE9q?=
 =?utf-8?B?Vkg1dFpvN3JGRDZtbEsxL0J0N1J1WnV5eW9lUWxpa3BpZEJVNjFyQ1NJUS9U?=
 =?utf-8?B?a1Y1bVpmS25NWVBvd1MvYjdHWDlXREp1Qmd5aFoxVnpNbkF3VXlXQklaLzJQ?=
 =?utf-8?B?bnRCMGtibGlsakRReDdaZnhCU3JCM2JVaWhNZlN0V0FybXNYNkVNL3JGU1VS?=
 =?utf-8?B?dGZvbDYxMTVBRVozL0tkdFhoNkptbCtjbGh3UE1xTjRZa2t3aHQzV3JlMHFP?=
 =?utf-8?B?aEpqYzcwYlV3ekNIU1MvdnBjeHJ1WVpraEx1ejVlQ1JGM21aV0NUd1AvYVUr?=
 =?utf-8?B?OEJ1ckVnVk9rcXg0cTdwN3JrNXlTQjllaTFid2daYllLN21xYUx6ekNMNDZk?=
 =?utf-8?B?WFJXRnRhMmJNVGlzRUp4TlcwK0M3Vzc0NEtaamY0QUtlZFB4b0FuSlhGT1hR?=
 =?utf-8?B?aGpWMHFLZHpDc1UwYXN2TU1KR0JBNlBFa0o0T20wWEtNUUt5VjhOR3g4NHFy?=
 =?utf-8?B?L3Y2UmhuZDlhNFZiRHdUVFlCbDFlbWRQa0RnYlNReHpMSUNMS2FDMjVyODJz?=
 =?utf-8?B?MmZkZ1lGNGhNUVJ6WkUrNXRPb2dRTXhFd0txeDdTc01VblFWRzFmWXhmRU9a?=
 =?utf-8?B?RjhSVVVFSEtmQ0wvRTRXMXNTdzVKMnJoUnhXMzJBR1NENVN4VGZKc0orKyt0?=
 =?utf-8?B?UXVFMzNQZ3VqZVBtZXZqSW9sN0xET0tXN3pWY1RvUjU4dVROS2lSMnJTS1ZN?=
 =?utf-8?B?SEVNT2VxdVZiOTRKNzBldERrdlJzVHFFWjRxYkY4NmxHdzBzMzN3bzZRNWVj?=
 =?utf-8?B?dFcxanpYYnZMTXZjcUNBejVQamRIc242KzNDbUwxdDV5WnE5WExPSGVnOWM4?=
 =?utf-8?B?SG1KaEd1dVcyWnhGaTQ2dVkzWkVPb3NzZDM5VDBUTmdMNW0zQWJKQ000eEMr?=
 =?utf-8?B?WnZPRHgwOXVrMzJleU83U0hhN3hWSGhUejFxUFVQZ25EMmx1djNoaXVDVitv?=
 =?utf-8?B?QVQwSmRNZTdZR292RytVcTdjQjI0NkhRMHRralU2RE1UakJIeFN0WnRWbmNW?=
 =?utf-8?B?VHF5dzZYSzBXeWxvcmRTV3h6TCtoaVlJQzJwbWpJeEp2N3RTMDNjVlZuRjV4?=
 =?utf-8?B?Tms0cy9ON2VuaVdYNk5FTXI3VFdFVWR1R1VSQWtRbnNaWmdPeUZQUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9804da-ac69-4bf2-87a8-08dedeb50f80
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 18:57:16.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scxnirzUzHTEn/oTQVPDili5QU4wrQnyaDcpM57VOJLWoEg331GvKrr1DjSaS051k27dNVIJm4LZKJoEgvqYpp5oECxDOfn8q5tgvUYqvaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5870
X-purgate-ID: tlsNG-ef75cf/1783709841-1E375201-6B1A1D6B/0/0
X-purgate-type: clean
X-purgate-size: 845
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,invisiblethingslab.com,arm.com,epam.com,raptorengineering.com,wdc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:andriy.sultanov@vates.tech,m:guillaume.thouvenin@vates.tech,m:marmarek@invisiblethingslab.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii_moisieiev@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:teddy.astie@vates.tech,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:from_mime,citrix.com:email,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,changelog.md:url,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: CE3A173D778

On 10/07/2026 2:57 pm, Julian Vetter wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Now that nothing resolves or relies on GIC_NATIVE (the previous patch
> moved that decision entirely into the toolstack and Xen's own dom0/
> dom0less builders), drop it from the public ABI. Every caller must
> now request a concrete GIC_V2 or GIC_V3.
>
> This is an incompatible change for any toolstack still passing 0
> (formerly GIC_NATIVE) expecting Xen to auto-select a version, so bump
> XEN_DOMCTL_INTERFACE_VERSION.
>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

As before, take ownership of this patch.

Along with half of the previous patch, you must put an entry into
CHANGELOG.md saying that XEN_DOMCTL_CONFIG_GIC_NATIVE has been deleted
and toolstacks must choose GIC_V2 or V3 explicitly.

~Andrew

