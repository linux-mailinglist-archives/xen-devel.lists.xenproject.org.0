Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKvXMowlF2qu6wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 19:10:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FFC5E8306
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 19:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320679.1587898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSHlw-0005Pv-Nk; Wed, 27 May 2026 17:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320679.1587898; Wed, 27 May 2026 17:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSHlw-0005Ny-Kc; Wed, 27 May 2026 17:10:24 +0000
Received: by outflank-mailman (input) for mailman id 1320679;
 Wed, 27 May 2026 17:10:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wSHlu-0005Nr-SC
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 17:10:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSHlu-003B89-84
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 19:10:22 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a17257b-bab6-0a2a0a5309dd-0a2a45038760-2
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 19:10:22 +0200
Received: from [40.107.200.37]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a17257c-672d-0a2a45030019-286bc8257e7e-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 19:10:22 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB6156.namprd03.prod.outlook.com (2603:10b6:408:101::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 17:10:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 17:10:17 +0000
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
 b=avV56GO4v6Cw5WJM2I4rtpqWfjE2GX39Cfj3ALESnxq6CvBo0LkvY60VWOREYvv9SHqCu6qm1LrRWUsn6BxLjokUJkSyWtL7zD/G93nSwjncEBYD1Dqs1xSICkZRKAd6d06taF643hwWRdEjfxjOlp1Mz71xpOH6v77oNMQeacKYMoEvKLBuqe/vxgLEA2WWFESw9Ulb3dGyFTBQv3N7lHWp/KaFGneGZKUm3FpANUCMhqjyxofyknjXwL+EyKRtnJbEprqQc8Ta/sU9zqh55afFM8MzJ/XQzE8HPZAj6CiTTs12pWs3p3EkYW48w+4VoNhDg+MvYo99byrU0Mr5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfAgIltRip4lfqCueKIwSESHNOyqVzNlU5cjZ5eQfjY=;
 b=A4i/pmP2FpIQGORxfyc3tx07Ga5/D3gm7aEGElTIQgX0XRmNX3HK3fFnUot9mGBZTcZfAJYm94ftybZ3z2Uh231wjY7BUOiMy7wvD6neI92WunQm1f5OVTw1PsHBQC41VqIQ7nuCgoj8v8x5UJvNX69ghaniMsFyHfQb1018fD1rB9QbNiqU2/eusPDryms+G6pfckjKaCo6UA9seBan7vokNPmGnwSTjt0fQidfSy5CFUL+nN/iAV3qI4DNG5H+fcyurzbexq6Nj+rpPDkoXqYd94neTArrzPWuK55vpnCPLrm3Og3u6WgqE8mH121bS1dmUgo+cWbQB/9/+iu8lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfAgIltRip4lfqCueKIwSESHNOyqVzNlU5cjZ5eQfjY=;
 b=kH8X1Nax7IH9oOqK4hzOogJBwI0Z9jJbhiK1D8kL9XPATySWB6brD45fRGT3rTqFfqKtO2HGQY33z5CFN+vf2y8ONr+mTKELhjrxDzo6l0ifkisUKyqQ25PvEhiU0yLdS3w3/DFH91QWtnD6yOtOFaHWuZsJyNlBd9fiiYggpLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5e92ddfd-e37e-4204-8193-9d536da6a874@citrix.com>
Date: Wed, 27 May 2026 18:10:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Denis Mukhin <dmukhin@ford.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] Fix fallout from DOMID_ANY ABI breakage
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260527165758.2346373-1-andrew.cooper3@citrix.com>
 <ahck9cHeNQTUvokV@macbook.local>
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
In-Reply-To: <ahck9cHeNQTUvokV@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0647.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d22633-231c-47b6-ceb1-08debc12d2f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|6133799003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	c0NNSmvWQO3vKLyQjY9+c3MYvi1ULcUsd/RjDH5oHI2ShaB8VsgJxU5skjF49RLNkVCV/1ym3E59oV18CFqkFWHF+blNeXJJxJUMaoFns0izFhTaoVG0uLchvcs/KpRCtfQ3ooXze9G/tgzeWhVjdt5kfpYoKcpFY3ArsniopTCcceFI72GYS7grbb78YwuhCoexQgzE5CouEedD5CE9MbMRluj9CToFyLjUkNIh6t0IdtCbmqh/vvPO0BoXNKkmJVhMiYZOi5tFaRjOM5Sf0hD9pPHa/qsXjtcOuVNvJAhvJd82qHXp5bRyLGCBTYqC7hVm8ZFDAW0inzPzQ6eszUudxTfPgCGm/xyPEvzxzAyPO689oRpVBm0bddv4T+YiKHMhg8fDR1rVOqEmZLCVJKvAnr/ADiDZQXibZJyPvmhmflJMcg4UbPM9jBWOfUagxN4nOBVG1+TKyPCryLPcRWi5DBaoKiOodzjnmd1o6zdOy+3s9QSzQEZeN64RZSzjjgrccgKpOKiRSCBGEU5XL9Z1fKBv3Jhe2wn3GIKVTZvTgfizQFhDQKh10RR73jpWF0tb2mK5Eb8hJdnW8tmyF8NvupsSs0CiQ9cKnCH3CzVCJw+FY6fIo5DgYAb13amlA2MN0nzN9VUl/m88eb99Bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDBhZ0VJK21QNUI1WGJJMzE2VGdDalVoWjVuZmdHZVBNa2V6RzlxQm42N2JC?=
 =?utf-8?B?RVp3dS96UkNLL0p0OUJYdFZsVUY0SVpzeXlndDNvdUJsU1RtanIxRWFXcGtB?=
 =?utf-8?B?UXc2UXlxWHJXa2FZZ1llcEtIMFlUUllUS29TaHJtMUdudVBwRk1yZmpackRI?=
 =?utf-8?B?QTYzUUxSMHdNQXNoSUxrUERTd0RobWR0eUd6NUVDQ251QmprVDg3UFg3RkQy?=
 =?utf-8?B?ZHNPbG5jY2VQN3RTMWxqZ1BlSDcveTZ4Qm54RVJtQm1yRnY5Tndvc2c5K0hD?=
 =?utf-8?B?UlNBV25WOTJRcUtVeEV3cVNxQTNMMHh1TmJ1WjJPMWdpdS9YZTBzN1dZNzVP?=
 =?utf-8?B?MndacUJpV29aUzc5OWdlOThLSWdoNWRSY1lra3M3MDlvZm9KNTkxb2N6RXhS?=
 =?utf-8?B?Y0FzYlNDaXZRVFJXUjJZbk9aUURZK1kzZUhHZWlOdHpDWUd4dlFYa293RjFJ?=
 =?utf-8?B?bnlTVVRqVHQxNXJLOVJIa0dMbGhYT3JZeFVRQlhXTUdsMzN5d2xnRGxuUXZ0?=
 =?utf-8?B?RVRJM09iMnk3bE5uZGpQd2kxOExyQXRqWXdhSEh3OXdiQXEwUlJWNWJHWXE0?=
 =?utf-8?B?YitpTS9NYVptVFJTQ3EvT1d3Ky9sdFJWZFlOM1cxN3BYVEQwc0ZNNEdBZ2s4?=
 =?utf-8?B?c3l1Y3RoTVdyRlFpZ1F5S2Y2SnNBK3hNY2hWbjRpaGtwODZGMkJNZUhOQnVU?=
 =?utf-8?B?TUVkYUdYNUphcmg3Q092RDlsU0RsWFkrdWxaVjJEQjdSZ0JKSG1qT0lRZTJ3?=
 =?utf-8?B?UlZFWHh0azMweW9mc3Q3MlpLcEE4cWo5TTNRUmxscmRiZ3RnSW9PZXZoQ2Rr?=
 =?utf-8?B?YVE1dysybEhxWWpiNGdpUUJLMDJSK0pNU0E2eWlLNFNaUk1IYkw1WHJSc2Nn?=
 =?utf-8?B?VEQrNkcvSy9UdDkwVW5VVC9aeWtyZ2tyellyNUt3eTdFUzhsN3ZaN1M3b0pD?=
 =?utf-8?B?YUNoeFloaURhN2RJZURBanVPOG1aRStlSHQ0bU1IRnJOcXYrTU1pV2trdjg1?=
 =?utf-8?B?ckY4dFlOTXBuS3JCTGNudW1ZaUJ0cDVBR2Nyb0x2MTRRL0FsWUd0VTJFd1FU?=
 =?utf-8?B?ZUZ2QVJ2TG1KLzZ2T0FiOGYvK1htRW90VHhYaXFXS0NwZXptTGtVd1cvbHor?=
 =?utf-8?B?c1V3LzJlSWNIWHJ4eXppZEYzcFVMMmpnb2hvZ3hqM242aXQ4RkZ0MzZ3OU96?=
 =?utf-8?B?ajBVbHdrRzVFQm00alQyZ1RGU2U0UDBERThpVTFUNDJ3MkdLNkdzaGFKVWxW?=
 =?utf-8?B?S3BPUndGNWhkbmxPMkhWSTNXY0JHNWYvREN5aWtwODdwZEpsa0gxSHI4UldR?=
 =?utf-8?B?SnJQOUFIeVpwUGV5dWM4OU9JS2ZDcjJvUVpWRUJXa21naGxIRytTUEczdEg4?=
 =?utf-8?B?dWpmdzlvdm14U0toWXhneGFlQVp2ai9QY1hybHVRU0oyaEVUN1lGSEtZSTBj?=
 =?utf-8?B?N1FnYW9CN1RDTkhMbm1wcWlLZFlsdTZFd0k0anJ6OGtjVXRIWFU4ZERvcGpN?=
 =?utf-8?B?TTJjeFJzS1p5M0k2M3pFS0pKNytCcHMrTG9vYWVVYTRUeHdJcS9Gak9KdXow?=
 =?utf-8?B?Tlp2bUNpd0hNb3JCK1pxMkdOWlg0MGhPWUZtMzl5NUhuSDEvNC9ud0xQY3Vv?=
 =?utf-8?B?RkdlQy9yMkZMeC9BZFBnVXJSV3Y5N3VBM29RRi9WYTgwdU01WlhxVW9MOUF6?=
 =?utf-8?B?K1JqcXJiT3lrWkx2RERLaGNRVmxYSlI3OCtLaVlTWTQzQzN6KzZIbVRKMTlW?=
 =?utf-8?B?bDZvWkdocE5tckoyYU1saGdoZ0Y5YmJPaHJzTCtZYTJQaXBZTlBUOGxIZWJJ?=
 =?utf-8?B?Zm5zYzYrMmgvNUxlSzg1bFRlQUtYUzFhZUlHU0tCS3c1MzZpREh2a1ZubDJE?=
 =?utf-8?B?UWdwaFRsR0FlNFZnWEVjZWxvS3gyZzZDUERuS0dtd0F1TGNIa2t3U0FWTWxm?=
 =?utf-8?B?bFJ3YmkvUjMzd3BuS3ljSzVoQlN4bldQdjh6WlJDVERocjYwUXo0SlQ1TVFx?=
 =?utf-8?B?M0ZMajE0ekJPaDBmYm8vZUJwRW94dVF5WUxQTWNSYjd3ci81a1RHejZzRVc5?=
 =?utf-8?B?cFkrblpDaWdRckVrVy9ERWs5aHlsTlVPeU8reS9SWXRReVp0cWxWYThDME1r?=
 =?utf-8?B?b3R5ek5FMUF4aWZ3SkNQclBxbU01MndFODk4dWt6WUR0eDkrNVdTNDU5MjBO?=
 =?utf-8?B?NzkzMHJaZDZvNEZKd0MxOU1kcHBOS1M1Y0MrYWNIUzVzcnFCY213d25UckJK?=
 =?utf-8?B?a3BYVE9BakxPLzNieG5TdTlLamY4ZWRnMkpFSUVtRGtEdEgvRWF1SjFuQ0Z3?=
 =?utf-8?B?TitSTCtMN2xrQXE0ZlQ0bHd1SGREYU1mcC9zNHlMQnhWR2xPUngxanFVbW9s?=
 =?utf-8?Q?QLRv9K7zvYBzxlDs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d22633-231c-47b6-ceb1-08debc12d2f6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:10:17.0051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8LgPRnHhBJtUuPa8arV33dNGeYvYpVypupeGpFse7CPyjEC0CSGrLfj+/nqirTLK4D96zujDI97zQT8QN/zwgzKab4YHKEpobz1H1mm11M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6156
X-purgate-ID: tlsNG-33051d/1779901822-38F72938-68A044DC/10/73395122804
X-purgate-type: spam
X-purgate-size: 2974
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,vates.tech,amd.com,suse.com,xen.org,kernel.org,ford.com,gmail.com];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:jgross@suse.com,m:dmukhin@ford.com,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 17FFC5E8306
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/05/2026 6:08 pm, Roger Pau Monné wrote:
> On Wed, May 27, 2026 at 05:57:58PM +0100, Andrew Cooper wrote:
>> Commit 23e2479ff9de ("xen/domain: introduce DOMID_ANY") broke at least:
>>
>>  * xenstored domains
>>  * The Python bindings
>>  * The Ocaml bindings (i.e XAPI, and therefore XenServer/XCP-ng)
>>
>> by causing Xen to reject 0 (the wildcard sentinel for decades) and
>> DOMID_INVALID (a recently introduced wildcard sentinel) without adjusting the
>> callers of xc_domain_create().
>>
>> Under other circumstances I'd revert, but xenstored has gained a dependent use
>> of DOMID_ANY.
>>
>> Fix up the remaining in-tree callers, which covers init-xenstore-domain and
>> the python bindings.  The Ocaml bindings, like libxc itself, expose this ABI
>> detail to their caller, so need fixing individually.
> I think this will also affect the rust crate(s), even when those don't
> use the libxc bindings.
>
>> Leave a very clear message in CHANGELOG.md that all external callers need
>> altering.
>>
>> Fixes: 23e2479ff9de ("xen/domain: introduce DOMID_ANY")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Denis Mukhin <dmukhin@ford.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Both Roger and I said no to the DOMID_ANY change.  We both think that there is
>> still insufficient justification to be adding it as a new constant.  Next time
>> it's going to be a straight nack.
>> ---
>>  CHANGELOG.md                         | 4 ++++
>>  tools/helpers/init-xenstore-domain.c | 2 +-
>>  tools/python/xen/lowlevel/xc/xc.c    | 2 +-
>>  3 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 25f5a192ed48..1b54acf912a5 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -7,6 +7,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>  ## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>>  
>>  ### Changed
>> + - Users of xc_domain_create() must now pass DOMID_ANY to obtain an
>> +   automatically allocated domid.  The prior sentinel values (0 since the
>> +   birth of Xen, and DOMID_INVALID since Xen 4.21) now no longer represent a
>> +   wildcard input.
> Maybe also mention XEN_DOMCTL_createdomain explicitly, to notice is
> not only the callers of libxc that needs adjustment, but also users of
> the hypercall itself not going through libxc.

Good point.  I'll adjust to XEN_DOMCTL_createdomain/xc_domain_create()
locally.

~Andrew

