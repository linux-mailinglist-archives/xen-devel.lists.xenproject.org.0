Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8v9rB85cIWpsFAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 13:09:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FFC63F4C9
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 13:09:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=TO9XpOOq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327687.1592497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5wF-0006AD-PQ; Thu, 04 Jun 2026 11:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327687.1592497; Thu, 04 Jun 2026 11:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV5wF-00067T-Mg; Thu, 04 Jun 2026 11:08:39 +0000
Received: by outflank-mailman (input) for mailman id 1327687;
 Thu, 04 Jun 2026 11:08:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wV5wE-00067N-Gj
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 11:08:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV5wD-009xVJ-P5
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:08:37 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a215cb5-2eae-0a2a0a5409dd-0a2a4502d92c-0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 13:08:37 +0200
Received: from [52.101.61.34]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a215cb4-af86-0a2a45020019-34653d229639-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 13:08:37 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB8453.namprd03.prod.outlook.com (2603:10b6:208:540::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 11:08:34 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 11:08:34 +0000
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
 b=mR61+RZLS/CgkBZX8//CyAXSLoK7OLnHjZh38UK59JrXbpnl7nwQlzYKGtWzLZiZsxYvv+nLCGonYiqCaPrv/HwpB8oJUfCT72fkUAuInV581iO7rZ9CPtcX/2V1GBbOBocZMGwotE71M2YZv83vzyfOA7fBrLyc/7RDbWDZQLaynaotBxkxpkhP/cnu2qCHMIq1UqHiNznmLyD566fT2d1mk3uHXNOPq9r+AGDAurY1fR5apJ4KKzdZ1rFu1b09UVMg3QuxKp22Dm8/4c9hZ3pEA34SP+JM5a0FoB6ttLi+ZLmXP6L5I+u7S3PRlzgKzKbHD5X8Hok0YSl8L/Yl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+5Fkv3BNPIn3Dsc2L3UOsQ4qtsGY4Ec4uuse+XI9ig=;
 b=wnK7I/QqzyVZjlxcqK3+U6GeyhBKquHQEj7ea9AlCrRKUl5OrOrBcb6gq/MjKvWf5JWs8bbYfZKkPsdF20W8MMV6QcSIXiFFbBcBpeUzyi9hvtbq5rh5wqgU9ihb43xjjoBPNMgKSLFirub9A35FhTcvfvVGkVDHbebkm8vaaZzotPfCMtWdtTWNtXBTmorvwLKhCS6XXcY8yoV+ThQkVGIqAhZMMCMRqHI8pf55cn2aHvY4J87SOTtd0xAvDwtWzij7MnRU1o8wTak6glnUyQP0VuoIko/cTPzbnZXE5Ql4ZE1ssVc3AP3DnnkvDIJ/eumdLOpMn+HAI5V1MpoxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+5Fkv3BNPIn3Dsc2L3UOsQ4qtsGY4Ec4uuse+XI9ig=;
 b=TO9XpOOqXkZT4e11IgVBsa0YDmfXpeMFYj8KWgYv4RYwah50nX0FK5YGpKAd/d/7bgnMr+p30X4ESmvro+BeYO3ZZXRgJsbdJpFvmpFB9kuMbkcp4zFRJZMXUUYeN/oTAevB76oIroq/EXAVqSIB0OyAjgOBsQQ6w2aZ/AAkXo8=
Message-ID: <f72e590e-0e81-4bc4-8097-fe83ab5d945b@citrix.com>
Date: Thu, 4 Jun 2026 12:08:30 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH for-4.22 2/2] x86/mcfg: relax memory map checks on newer
 firmware
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260604104605.92516-1-roger.pau@citrix.com>
 <20260604104605.92516-3-roger.pau@citrix.com>
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
In-Reply-To: <20260604104605.92516-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: caa445bb-5632-4722-a033-08dec2299e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099006|4143699003|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	nUEUOFT7YKZ324dtguZcQxvlOY0zgkWcWFGqDSJHUunLvVdw2sKcLvC7EvOUNoJoTKaSvHLHkdq+e3GX00yMRHJ5dLeYaMjqgF/s6rjx3hmj7m0gUb9VIlbFUOmKDDQ5CNWuxWqQel7UEMKQD/02/6EGirhm7Aw4xXQy4HR0VdC8mqVsxH+WL714upW8q9C80jMc6u6WOwIXfRyuD9flM/eGmVK+qncV0b608dtkh8X9k4JnaiGZ5t5wqx9dmYGQhbgAsr4wPDh43qcVAmxnWpUTImho+aGZLwZPuNglXnSXbvtnNd/svKtj4/CYpDwPai5xi17vsebofxe0dh7gDpcZj2jBRjKz0Lt7HgVUXW6CxuvTWtm92FS04Rr3OL3qh5oojUDp5is4SQg3Kk7eFVTwZnkPsL3rVyyadb82D5fOQMgnAu77Vr6V6ijr+M0oGMtSNn60EumXRLq9L3aZjd5e06tPkm3E/CfgnXAJfrKHNHOy9ZrcE08DtJ+gik/jWibt9g32TWxG54zS+o+5h/QtpF8gTUZzfePKRso9Eh3R6YLTQzM5HoUB79hxiJu0t8V9J92zbL6VzChbcN4j2yFDPfMGX+GRM+UPRy+LwcZcQnC/XHgkm0xisEa2VnEFxC6UjQxkzXdCEC6nnAS4iq0iEu9IJNw3b/rPBQFf1vIOkPZ1NT1VDnZviU1wW6P6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW1nSXFiK1VaSm9iaGJhRDdEeTYwUDFuNHRFbjRLT0o5VWE2Nm1ycmVheEVn?=
 =?utf-8?B?ejFVc3Q2SzlzSmo1UnQvMlFJUy8vUy84eWpIaFFVa25sQ1E2Z2tRajdWdWpw?=
 =?utf-8?B?Q2tRV0tMdnV4cFFPeFVobzVOOUU3Q0duakpNMjQxdVZYWVlEK1o0Rm1aSHli?=
 =?utf-8?B?R2ppNjFEaksyM1EwZE45bkNJbzRKTHRnLzM2MHZkUVJLaEFHTi9ZTVR1N0RF?=
 =?utf-8?B?ZlVVaVdUNHZEN0dwODNzdEhDQzFHVE4zNTg1NWFaTmdJVU9JWFBQTldpSzNu?=
 =?utf-8?B?TmhJbk9Ra250eDR3MitSVjZhNUpkRE5YMGZtSWJrUklBT2F4REU2dHROZWRB?=
 =?utf-8?B?dGgzSGsvMStrZkpIa1NOT3QvRVhuN0FiMWMwYzlrY25YTnlZbDc0Q0k2WDM2?=
 =?utf-8?B?a2E3Qi9BVGxnb0lwWTZrN0t1dHJKSUxJUmpuUG5pWkRITmlId2pBZGpGcTZL?=
 =?utf-8?B?cGg2M09DYmhySU80bHNoOFBqOWdDSlF0KzNGeXFYRENESnl3V0hSeFI0MUJl?=
 =?utf-8?B?V0ZEUSt6REpJd2t2Rk1YZ3VURGNmcC8wekNtUVNVek81dWRldVAyNUlaaXNQ?=
 =?utf-8?B?dlNyUVd2ajA3Y1ltQ216UFRVTUFFeWw5T2UrY1ArNitTWno1T0N6R2dBT0RO?=
 =?utf-8?B?eUV4TE42QWJQT1d2V0UwZWZMODQyQlNsWWwrcUcyajJtT3ZqcWRDa0QxeS96?=
 =?utf-8?B?UW42SE5qbnp3MklVSzk4RmJPdk4xYUhUdHFmbUxZWGdEUGg0NjFKT3NSK3dh?=
 =?utf-8?B?d1kxdzJVY2JFTVN0TFBuZEhNMlp3Ym9JZGV2eWROY1B0Wk9qb1lGcHF1Y290?=
 =?utf-8?B?VGlnMWVCb2t1VVU0eElnNmpIR3ZxWnoyam9VZ1BHcHlqVC9UUWhHMHY5UDE1?=
 =?utf-8?B?cDRtMUs2QWw4K3lTWU9YQ1lENmIrUmNQYkhsdVBhdXBtdzVRcG91cWsveE0r?=
 =?utf-8?B?dkxxcHlMMXcyQmlmTm51TkFvdi9oeEYxSCsxUktPdW14clk2Z0pwVURtK2J2?=
 =?utf-8?B?MzZSY2k1UHZzSzJBTTVKbmJha2hFdHlXRHRsbFJkVERXOFJvd3N3QzMySzZS?=
 =?utf-8?B?VnhuQ0laK2pEOXdYVFJNdzhOdHJ3alBjTkE2RHBhZHVCWm05MzJnS3RyK2Fn?=
 =?utf-8?B?d3dmUThNeUh4U2p5ZGFnUTN4eDNwNlBiV3V0NFc0QzViYXRoaEN5KzFvU1NE?=
 =?utf-8?B?bkM2YnVUaHphU0UwUm1pVTl4R1NQSFM5N2VydlZKTTlYOXROQWl0c3VtMkdn?=
 =?utf-8?B?ZzFlSlVxRVVSb3lpckRFd3h2WnJ3NSs1bXp6NngwdnI2K0xIbnVSMUZ4YnlF?=
 =?utf-8?B?dmxIWVpzQytLY25sanVVcVlZUmdOVU0rcjZrQXpVTE1TSEk5Zjg4R21aVE5B?=
 =?utf-8?B?SWIwckFuRWJpempBUHo5TVZZSTBDY2Rnd0l0QWR3a1h0NVAwZHdFdFlhdktC?=
 =?utf-8?B?d3htRUZXNVJ2Vnp0aGRjczAydWRpNHR0ODB5aFRNRmVZN1VaeWpMSm4wR1Zx?=
 =?utf-8?B?TFRaa25HeXIzbVNKS1JXMUZ6SjlHYS93U3pYUnVDOEJTMFplMFdHS0srajZM?=
 =?utf-8?B?bWV0aG1QZk11bFdPajh5N01SK1p3RUpHd2lDaUV0Znp3dWRpalRUejRCQUJ1?=
 =?utf-8?B?UG5zR1FQWkk5MHZtMTUyMDMrZ2RwN245WmV5aXo1N2VId1EzaFd6WkkzV29w?=
 =?utf-8?B?bGtzNm9OK2VUUFhSVm5tME1LNkwraHQ0WjhWOUFQRlBqMkE5a0VkeWhSKytL?=
 =?utf-8?B?OUcxZW9KeTViMzJvdzhrNnpMK2ZvOUtUK2RQZ3MxeW8vVmdxdllvQ3k2UFYr?=
 =?utf-8?B?VnozNHJ4cjZkQm1UR2dFTEJ3V3E2TjBLSW52S0hmUDREQWIrdFJZVFYwL2xh?=
 =?utf-8?B?NHpsMWh2aWVoWGpBbmh5UEhwMU5SVFFselZ5c2I4cHNwOEg5aTJaRTVpdG5W?=
 =?utf-8?B?WVNyRnJCL0RKaExtV3NBM3ZWNWVQOFF4Y3NWOHZQNm05N21hMzZMQXltZFVN?=
 =?utf-8?B?RTVoUS9VN280bUlwYnplV09iaTF3d0ZJZG9YclJyaDc4VG4zOE1nT0U4Q2hm?=
 =?utf-8?B?UTlaSjgxNkxKaG1HeTc2TWZES2ZwVVZqTmVjS2RsRXJMOUM1K21Hc1ErWWk4?=
 =?utf-8?B?dmc3SHB1NDdOTUxPN1kybWZqL2oyMkdjZW92RUNaM0RRSWpIRmpjWVlDTWNh?=
 =?utf-8?B?eTdTOGZIN2ZES1dlakEzN1VzaHFtTWVQYkF6Z0VIK3E0cm9CNUVZbks4RmxU?=
 =?utf-8?B?N0VPdTZhNjRobEhjdTFVSlhEQ3BKeDVNVlJ1eXlZQ3BXbjRJdDZJdjhMUHBx?=
 =?utf-8?B?cjhRbytGaGF1cFp4eksrVThTNHNscFFHZWkrcFk3NG9jK2Z1SXF3ZXZ6WGpU?=
 =?utf-8?Q?Y1ZoRaPNmPboMqfk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa445bb-5632-4722-a033-08dec2299e4f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 11:08:33.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9f1apOmGEHwWaalUQzjJ1VVwpeTphMGsuuFPh/rmNqAq1MPb9w+YzXAWNh4yTfukuFzesxCwS5yaM7tJIYaHXrBSx7AqWR1DrNWLPZmSj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8453
X-purgate-ID: tlsNG-720697/1780571317-AAF6E161-F18BCD72/0/0
X-purgate-type: clean
X-purgate-size: 4316
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,suse.com,vates.tech];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51FFC63F4C9

On 04/06/2026 11:46 am, Roger Pau Monne wrote:
> Per PCI Firmware 3.3 specification, section 4.1.2, ECAM space must be
> reserved by declaring a motherboard resource, but there's no requirement to
> mention it in E820, so we shouldn't look at E820 to validate the ECAM space
> described by MCFG.  The specification additionally states that: the
> resources can optionally be returned in Int15 E820h or EFIGetMemoryMap as
> reserved memory.

I'd take out the ", so we shouldn't ..." clause.  I see it came from the
Linux commit, but it wasn't great there either.  It's a piece of opinion
in the middle of quotes from a spec.

Then, I think you want a new paragraph between these two, saying
explicitly that some Lenvovo systems do not mark MMCFG in the memory map.

> The more strict logic was introduced in Linux in 2006 as 946f2ee5c731
> ("[PATCH] i386/x86-64: Check that MCFG points to an e820 reserved area").
> This was picked up by Xen when MCFG support was added in 3b35911d709e
> ("Enable pci mmcfg and ATS for x86_64").  Apply the same approach that
> Linux has done in 199f968f1484 ("x86/pci: Skip early E820 check for ECAM
> region") and relax the strict reserved region checking so it's only done
> for firmware manufactured prior to 2016.
>
> When dom0 is booted it can always prevent access to misconfigured MCFG
> regions by using the PHYSDEVOP_pci_mmcfg_reserved hypercall.  This brings
> Xen's early usage of MCFG (prior to ACPI AML parsing) in line with the
> implementation in Linux.
>
> This fixes an issue with detection of extended capabilities when running
> Xen on a Lenovo system that doesn't list the MCFG area as an
> EfiMemoryMappedIO region in the EFI memory map.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I'm not sure what's the best way to attribute the logic here with the
> Linux commit that introduced this, more than referencing it in the commit
> message text.  The code is too different for me to attempt to label this
> change as a backport of the original Linux commit.

I think your commit message is adequate.  It does provide all the reasoning.

> ---
>  xen/arch/x86/x86_64/mmconfig-shared.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
> index d0cbc151705d..e24a78c8d1d3 100644
> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
> @@ -13,6 +13,7 @@
>   */
>  
>  #include <xen/acpi.h>
> +#include <xen/dmi.h>
>  #include <xen/init.h>
>  #include <xen/mm.h>
>  #include <xen/param.h>
> @@ -369,12 +370,15 @@ static bool __init pci_mmcfg_reject_broken(void)
>      typeof(pci_mmcfg_config[0]) *cfg;
>      int i;
>      bool valid = true;
> +    int year;
>  
>      if ((pci_mmcfg_config_num == 0) ||
>          (pci_mmcfg_config == NULL) ||
>          (pci_mmcfg_config[0].address == 0))
>          return 0;
>  
> +    dmi_get_date(DMI_BIOS_DATE, &year, NULL, NULL);
> +
>      for (i = 0; i < pci_mmcfg_config_num; i++) {
>          u64 addr, size;
>  
> @@ -390,7 +394,13 @@ static bool __init pci_mmcfg_reject_broken(void)
>                 (unsigned int)cfg->start_bus_number,
>                 (unsigned int)cfg->end_bus_number);
>  
> -        if ( !is_mmconf_reserved(addr, size, i, cfg) ||
> +        /*
> +         * For firmware from 2016 or later relax the checking and also consider
> +         * MCFG regions in holes on the memory map as valid.
> +         */
> +        if ( ((year < 2016 || !is_memory_hole(maddr_to_mfn(addr),
> +                                              maddr_to_mfn(addr + size - 1))) &&
> +              !is_mmconf_reserved(addr, size, i, cfg)) ||

This comment is half stale already, as "relax" is really only relevant
to the prior behaviour.

"For firmwares prior to 2016, confirm that MMCFG is marked as reserved. 
For 2016 and later, also allow MMCFG being in a hole."

It's also worth saying that this fix is different to Linux's.  Linux
simply ignores the E820 on anything newer than 2016.  Personally I
prefer the more cautious approach of saying reserved-or-hole, but this
should be called out in the commit message, I think.

~Andrew

