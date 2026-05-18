Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iG1aLUL0CmpZ+QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 13:13:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0988256B560
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 13:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311778.1581923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOvtu-0006yp-C2; Mon, 18 May 2026 11:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311778.1581923; Mon, 18 May 2026 11:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOvtu-0006wd-8o; Mon, 18 May 2026 11:12:46 +0000
Received: by outflank-mailman (input) for mailman id 1311778;
 Mon, 18 May 2026 11:12:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wOvts-0006wX-Ce
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 11:12:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOvtr-000NCx-9d
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 13:12:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0af425-5cb7-0a2a0a5109dd-0a2a450b9c12-22
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 13:12:43 +0200
Received: from [40.93.201.17]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0af429-212f-0a2a450b0019-285dc9111958-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 13:12:42 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LVXPR03MB989180.namprd03.prod.outlook.com (2603:10b6:408:37f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:12:38 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 11:12:38 +0000
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
 b=QS1V+vH7tnAnqi+uUkVnFYj6EEYMBiAxJ2KtrlGPr1Y7rcDvFg6MDgmzmTXkBLWeKvxVK1AJrzuBaUcEyhQnzqJ9rH6jdMa+kat6AUSKVN4IpE8mVqtKa/44RxuazLkV8DJ2H4ruHUnSkRBvwdEOv0O0EWbfnVTQ4V5NMWWZjiqPp4ixaSIM9KQC+OVfNbWxtHUniCVsXQt+AAlobXpmAA9T4IFHil+vY6n+YmY3CqkyS8QADNGcKcJxJMcZHP4lIEvE24KuaukGgl430eamiVvUSts4LslpBMoeK5jk9xjNQd/c3JICSPDegIhdXELRZmjm0ffpW9UI6BkunP/WzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py285KzHehqaHtSE1MZTWUOSaA0EuZTJrrBQBVg9iuI=;
 b=Ukp9SPjnlYLtQ3BD+FZP+gkZlvwBJPJgeZISk9o9p5xOw0Cr5whBubGbO04guxtd/eIv1jimYHOTLWzZeTxo+JP2PJuDBXLn+RkRyIwLE+35+bpHAjoVlvYLCg3yC0EXrVzPv9Q9j1apnxGfB2tV4dLijG+WJB/7XbNh36tJRW9t1O4Ah7DGtM5KxFFRK+Hb4yqaNIp7B6IQW+Z1zvzJ5iJpjF3/1PXN04dSBljsq+0E3AEc5j+K15t3/Kc76rlhjIIBXQRXOJFRFbV1Ne101bbnDj8lsJreudIogPeLF39exRQgSrSajl2cNtBxPAXLzPY9BacPeySgyeQr7MllCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py285KzHehqaHtSE1MZTWUOSaA0EuZTJrrBQBVg9iuI=;
 b=mMNPQQ/MVxlUbM8+xFVZ68dH9GkB6IvN8OW6E3ArVZTTyTgJw6JE3ywmqbVmvAWfyoIT9BbsuKBFuBDuAZApoTAGvHyv1iCXLj2shMpZSK6uIpwsADC0/Lhd7577+lWNhJr0QjoVehRYea7wfItw6ILOjqMhbspG432aT/o/nXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <79b1d15d-f18c-4cc1-a763-ea2d10d6f91c@citrix.com>
Date: Mon, 18 May 2026 12:12:35 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.22 v6] x86/svm: Support vNMI on capable hardware
To: Jan Beulich <jbeulich@suse.com>
References: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
 <559dc10a-d390-4723-8c52-f649a7acf8e0@suse.com>
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
In-Reply-To: <559dc10a-d390-4723-8c52-f649a7acf8e0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0213.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:374::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LVXPR03MB989180:EE_
X-MS-Office365-Filtering-Correlation-Id: 8049440c-fad6-4381-964a-08deb4ce5f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info:
	/5V3PloYCxS78IwrFlfnO4Ceuquict3m9PVNYFYfCl0A/Eqj1EnzUC+X7FtA+jLnPcd5+/1S+q/sI/ecx8Sa3nwmU/c2s5+TtrIwQ038Up4YyU2BP7wNuWzBMdYGpo64n6jH7YaE3q+oL9Q3It0F+azi4+/W9sI5TvGl/JfPBorVxXEk1+xJDcaIRh49DWw2lw+x6IbMi8vR/5jx+QiaRCgRdOJ2x9XJ6SClBwyOsgUGMNhxqNWFmCBUjewhtPCqgk1vxnKBSmqM/uNReSPjdDbp2OdZDPYq4pRNeOKpgsDWKb/sAZf8BGuE+SN2L3FkzRwxm2W0yCZ282Uy4rBEzI8Ye6eSeXnFJT/QRkXECI4sEuGPrPZuVcjThoc0ZQVv3cE9/zOGbLwg+n7La4ITiAAlnkt0/i2UI0gH/Pt+asEBp3OIFNecKWJED0wPr7cblCmp/HKpb0fFiBtMOA6GreHjFk2QD9rndXI7h847lfH28djxKij5Po5mcxtNU7OsD812uuJf/G+Xm7QOV40YXH43HYwCQD3cGnoAmkO2V31fo3gEuZ8STqDUVgYkiyP4sJYMaiZQAnYniTvOlSjN9W8AOAZIBxKB10cDCmTPTWa8Xo8Jh7UOqGDLPImNBN+P31AkJaFYPY5uGXHcXq9tuguE+S+ovqoK4e0rgV6Zn/6ixcfMxQj7ozdVAXHAfKl3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anNaVFpQWVgwNW9JSkt1Z1RPUmJOdUxQMFlHaDNjb2ovSlZ1SUQ1bVZQbTF4?=
 =?utf-8?B?V0lIdFltZVpPMDFGeEZiT1lsdDdrZU5qZjNWbTNvRGl1ZzBGRW9nOTlheDBa?=
 =?utf-8?B?cHJQbURtQ1Y4clZSZ0h0OVlNWG9zeTdONVZnR0tUUGhNMW11RTk4dWFYM2xx?=
 =?utf-8?B?cDFTYjN1NWhMWHQvdVZrdDZTc1pMUjZoa3A3c3UybDZRUW1KV0JCeDRxc090?=
 =?utf-8?B?TWFPalE2THowbWVGVmluKzczaytOakZ2NVpuTU1NRTFKeVkrVTNnUjNScmh3?=
 =?utf-8?B?ZENza2ZGTFo4dk13anJMcXlWSk9yUjM1R0sxdXFlODRibUwwOFFYaWFXdmJ2?=
 =?utf-8?B?RFhZNXd0RjFwOUlPbHBqdGhOSXdlbVp3bi8vbE9LeDZxdXJ4QWROMHVVcjNH?=
 =?utf-8?B?d2Riay83N1hETkc4LzdxZ2xUcm12YlRDekdHdUhGWUZIRjNlbDZGNnNNZlli?=
 =?utf-8?B?K3NkeC9Dem1LUnlHVGNITitTdDlia0J3VExSYjVvZUc4R3MvR2xETGZnWGdB?=
 =?utf-8?B?emNWV3NLVVlUYU01UndmMHo1aWFjcExNdzE1RHUvMEd3YjJ3bHZPZkFyRGMr?=
 =?utf-8?B?MzEzdkFzcUYzS3lKUmFsZURpaHAxdTdYa01hYjdENFV0cEgrNld1VlhKdFRo?=
 =?utf-8?B?eWozQmpyYXByenQwUzdqUkg0TmFvLytTS1o0ajRaNTBsQUhQZ29TV1pOWlIw?=
 =?utf-8?B?blZSMDlqd1N3QVBXdnhUbVcvUnRoWmxGTlZWcnZ3azZhUmRTeGFjL01HL2I3?=
 =?utf-8?B?V0Z1aEpyaEE0R0lCQjYxeW5xanhBbm1DU2ZBQUxadFVBZ3F4V21yNzROYytI?=
 =?utf-8?B?TENVZVNCdGMzdFRjVVhnMDdzajhHblR6WkJnU0NrQzRuUGRVei9QRzd4NFRw?=
 =?utf-8?B?cnh6REZyWXhWYklJYmVWOUtEOUZEZkFnOFZQeTdLVXR4N1V6Nk1ncWZUVU9J?=
 =?utf-8?B?UUVJczZPeFdGMlhYWmI2RElIWW5Gd1BRVGNBM0VQMEhodGNpRXhZYTh2d0Rt?=
 =?utf-8?B?Q2IzdjZPM3lQbW9Ba1hoaGE1RVlvemZRaitUYUxrRVB1YmtPNHZ0dnV0T3JZ?=
 =?utf-8?B?Qy9yNUxaazgyU1dlRHd4dk4yRXdjMjlEeFY2M2lyL3FSQ1lZSEJlU1JkbXM2?=
 =?utf-8?B?WU41RUQrdmRhaWJ4MEMwL1l2MUV1eG9yNG5Fc1dnMlFsMEdic0xsMmlXR0Nh?=
 =?utf-8?B?eVVlV1crZm5xWStCWGZmcUxsY3lRZWFWSVlWSThSbnZQWHlyNVltOUs0a0o4?=
 =?utf-8?B?VktNeWtUTzFsSy9ITjZFZnNDUzd0d0RpUVR5NjNlUUwxY2R5VnVxSnE4c3M4?=
 =?utf-8?B?RHdJWE4yKzFpSC9BMVp0d1kyTGEvdHpWWEI3dHBSWjN0U0VIOVFIdEpmdmZw?=
 =?utf-8?B?SmVFeWp0MzMrbE5hNUNlWS9zaHlIQzVLWisxUnZLQkY1NWM5dW5HUGJ4TlE5?=
 =?utf-8?B?UEdhU0NpOHFZcHZLQ1dqTm5DZ2xQL20zWHFCVVlZVnhDcFNZYUtiVDdZRmc0?=
 =?utf-8?B?TmZFMzJ3cTRWcExzMFQ5QmxURFZxejdkVTdvYjF1d08xYTlzbnE4ZFh5c1VT?=
 =?utf-8?B?VzBHU29tazFCWldTM3VXSUpLTlFkVUlDSDhIK1R5ZFQ3R0RGTlFrZWR3em5G?=
 =?utf-8?B?ZGNFVzZyaEhqRHJWTjJMUS94Y05JN09hRm9td3FycXVYVjFpZm9zV21teGJ2?=
 =?utf-8?B?cmN0eEFTUkFOeS9qN2tmSTVHeXgzTlpEa0VWbmU5KzQ2SS82YU9WTW95K0Zh?=
 =?utf-8?B?UlJlYXNuRmx5aWxKejMzSGFMNHhnY3ovMWtpYUNyaDBJUkNJTnU3OFhROWpI?=
 =?utf-8?B?ZjF1VjhOK2JyWVFuRDZpRlhQV2hYampnQ2I1VE9TNzdiSXV4R045a2xBWXlH?=
 =?utf-8?B?TnI2VjdpSWpWQUt4cVV1RWpnVDNGVVBoUVMzWG1NczZiR25MZjMwbDI5K3BT?=
 =?utf-8?B?VEZ6Ukk3ZC95ZmFPQTBKYk9WczJwM0dvbEc5NnFEWEx0K2tEVUNJVll3N1FQ?=
 =?utf-8?B?MFNwMXJOYzJ2cnM4cXJQSnhBRUs2Qm9rbFlWaWN3eVRGTDF1RTVSNmZSYVRT?=
 =?utf-8?B?TndYR1RIcUtTQ21waitmeWhKU3dLVGkxeGErM2tpT3VicEk0Vldad2wxZ1Bq?=
 =?utf-8?B?UVA0Y2RBVHpockt2RDVDS1I0ekNzT3FjbEpOdFZrSGhnSWhuaDltYTFESEla?=
 =?utf-8?B?MTVueldWc0V5QjQvYy9kTSs5c1BQMWswQjBFMkpyRTIrZURNbjlId2MzS1ds?=
 =?utf-8?B?bzdsdURBUXJTWXhmR2FCMlhtZ1IycTVrRVZKSENsWDZSUWl3dWR6SWwvL1Ni?=
 =?utf-8?B?dWRJbnEyN2k1Z0ZaWVBOOXIyeklsdUVVNDMrenVabXRwNW9oYklGNDJkMFc0?=
 =?utf-8?Q?XrHUPGbhyLxI2hmM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8049440c-fad6-4381-964a-08deb4ce5f2f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:12:38.7203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkhinaWa76ywXFrSyEm3eyhs6QHkfdskqlOpkV43KBDSE/6aPV3jY7Sbqs4CtnjZQasveLWS1JZEBH2vQECgLnrm39RP0rez3cujkEyhOW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR03MB989180
X-purgate-ID: tlsNG-42698a/1779102763-18762F3B-809080FA/0/0
X-purgate-type: clean
X-purgate-size: 1381
X-Rspamd-Queue-Id: 0988256B560
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,gmail.com,lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 18/05/2026 8:53 am, Jan Beulich wrote:
> On 14.05.2026 19:56, Andrew Cooper wrote:
>> --- a/xen/arch/x86/hvm/svm/intr.c
>> +++ b/xen/arch/x86/hvm/svm/intr.c
>> @@ -33,6 +33,12 @@ static void svm_inject_nmi(struct vcpu *v)
>>      u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>>      intinfo_t event;
>>  
>> +    if ( vmcb->_vintr.fields.vnmi_enable )
>> +    {
>> +        vmcb->_vintr.fields.vnmi_pending = true;
>> +        return;
>> +    }
> How does all of this work during migration to a vNMI-incapable host? The
> hw feature is used ...
>
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -185,6 +185,8 @@ static int construct_vmcb(struct vcpu *v)
>>      if ( default_xen_spec_ctrl == SPEC_CTRL_STIBP )
>>          v->arch.msrs->spec_ctrl.raw = SPEC_CTRL_STIBP;
>>  
>> +    vmcb->_vintr.fields.vnmi_enable = cpu_has_svm_vnmi;
> ... unconditionally when available (i.e. the feature not being there
> won't prevent the migration), yet the vnmi_{pend,block}ing fields are
> lost during migration (aiui). Are building on the fact that all of this
> state is already getting lost while migrating?

I can't quite parse the final sentence, but yes; migration has always
lost the NMI state.

This goes largely unnoticed because guests don't issue their final
suspend from NMI context.

~Andrew

