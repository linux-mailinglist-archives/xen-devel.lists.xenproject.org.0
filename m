Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCxqJEnT8Wn7kgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 11:45:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D704923B8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 11:45:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297141.1573265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI1TR-0007Xd-JQ; Wed, 29 Apr 2026 09:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297141.1573265; Wed, 29 Apr 2026 09:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI1TR-0007V2-Gj; Wed, 29 Apr 2026 09:44:53 +0000
Received: by outflank-mailman (input) for mailman id 1297141;
 Wed, 29 Apr 2026 09:44:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wI1TQ-0007Uw-FS
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 09:44:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI1TP-003HfG-RM
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 11:44:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f1d30b-bab6-0a2a0a5309dd-0a2a450cece8-28
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 11:44:51 +0200
Received: from [40.93.194.16]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f1d312-62f1-0a2a450c0019-285dc210f562-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 11:44:51 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH0PR03MB6051.namprd03.prod.outlook.com (2603:10b6:610:be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 09:44:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 09:44:46 +0000
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
 b=XjqDQdj786uf4ljS6fwBfeDa1ufSV5+WMq/xNP4nl4sfKuqduzmK1A9XMgzrkwcG8EsXnaEiDZR45mPc599R1rKZmd6WWZi/dNbFjXmiDaE8uUSUjRe89XkIJx4buE8kzVm622oiFfAqefdHQzgeOLq4rLYbBUHPUETxp7ZPnHqLKROM9JMsy2HgTJcRBCM6I8k3SJcO55Qm5n4cNIipzFXNl0GC8bRWuPsWPVWRmm6+TqrpK0jA/3p0yyY5a2gXRl3+Hm10UOFjZqdB+QtNYdoKKMCMJONxjMO1VZh6gcoyXfBWhpxO9/xvdkrj9ZPqCPGcuMGddsKO8MwopLYleg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDrjzvHENgjv6tY2bk3wyyInznLfdCDLuXzvkVtwOCs=;
 b=bQ8VDbBorbRZ3v4k6Pera0iy1wE/PudLmSP3cobJM2dKZLVyZex+YVzMAkDZhg47qgSfLxVVxTMu4ExRQyyYyiwkEjaj3Oxlm/Zw/2/oejF/Tw3oq8bg/Ut0Ygy75ihc0+n6tSZpPHQ4UyHh1mTilWG4DRBUcvikBOZfTR5jJb53DQnFcT15YGjB+6hGG8oR8YzivVP7/GuMLXXceeoC/Eaq5wZMqi0gwXzoiYGLHNhbBrA/VwqPXsNH6rskNLAAV63ndoQFQUJ4J7za39l+CSW9NpSoBXlQxoTyUUSW/Em+q7/2kTi7pzUTfv8qKWTLfgteF0MQIpnsC87e9xJ7dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDrjzvHENgjv6tY2bk3wyyInznLfdCDLuXzvkVtwOCs=;
 b=NrhyIboAHp/2QVHuM6rDxaZ7xqguPiutuXQ3bL8+tDAGmIXo6rXJYXhtChbpzGyQRvicPIabf6uPsvglM+O5xP8xvJ9ccj5/mLHCxuo7wJTJeX+sbvTclhuw9yLzlB48d9i/+n6BIhuqMoO6wPiFl6kNtlgFPUhvZvZBRXh+liM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <83b1e26a-cd17-4f64-ae82-dbf56f95b4ad@citrix.com>
Date: Wed, 29 Apr 2026 10:44:43 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] hypfs: add ASSERT_UNREACHABLE() in
 hypfs_get_entry_rel()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6db49190e85a30c0129f251ce718d50923baba8d.1777387070.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <6db49190e85a30c0129f251ce718d50923baba8d.1777387070.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0401.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH0PR03MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6d7f96-86e7-48b6-53bc-08dea5d3f2da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	M7x4SrhVxtyu3ULsbmR2AQY+DUcoGk3ou9Zl66STeRGufTvIgsw95lNy+FVnQGcQ4TmjlTKWzTOWwnMqVQ7z4u4Ed3jmarENDWv8IV80/m+Z8gd13MMy3bC3zLwXoRoqo8cxvhXgk4Qh1OU+WDUAhJ5i47Cp0HUJVGevvGoYDWuKc4Tu/2wdRFouQgCHzVL6sIG4rM6bAdwLIF7VM1XWumQZ4XwnSPnUkvCMR7nET9QbSgx+5KE+lFfpFzm/JkBtktRK/QRNm12cecyf0ONQ9uIZuWCrUhSnrU9CDJeSTeSCc0MZ34ermHS7rw3RkDJAgpGe5AobkKNk7CFNLxevcsXGZj/7Fjb5lClfLzTpDXsL0PIaMzViRfGR9RoAv78IlHuke51yVg4c1UH6E54Ski5YtttNmhufBTQs9cI/8AKDps8NyW0AM3BxmrmuNh9+aClZXEKwynPOyiPQKbJdUHiKyc7y3CRSsxuBbOJU1i9pcGwFNjIoexdaefm+3NFIO+g8emFP0Vtiy+SOoU46OW+Qz3F6bVqKcF2no6TPlydkohzMiPFo/gejpA/s27UePHLOXNyWCgObUKCVj8b+V7ykWWeWPlgnN8lGnT1N9FeWg24dME4rRmjqgEqIf2JZCFLth7rV/7Tgo7mDIHUKm82iTncPme8Ptc8TFLM1nOrKwKBVioQyJpvAruZ3NC0U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnVCK2FjVXZTUFpVbDdoNXJpbG50cTg2QkpXeTNjUFBndkQyZTRXblc4bS8r?=
 =?utf-8?B?RUNZUDhDemZLT0lzS3FtWnBwZFpzdEhKSGcvYnpyS2F3NUhLR2pIZzkrS1ly?=
 =?utf-8?B?ZE0yRFZqcGUwdDBaV2VRRWZJSzBWTTlmdVRBZTFQbXZ6Q1ZBeU9veEFIRE5G?=
 =?utf-8?B?ZmJaZ01IdUUxdVIxRnFzNjUyRVp5Q2ZJeVV2N3psbEZuZklwUUNnMVEwV2J5?=
 =?utf-8?B?UFNsakgzaENNNWhkeTFlTEw5c0dOUDh2bzk5MFc5cTBQUVJvWml6aUwyYTh6?=
 =?utf-8?B?ZW5BeWM0OG5yR0hPUU9XdXRFa1RVeUd1cmUvZDlOeWkyRXZLa0tNTjN5MTNx?=
 =?utf-8?B?ZnlQRXl3UW9JTVp6d3lUQnNsMExUNFQrcUYxemhBU3hBUjlpb3NYV3hEZzRQ?=
 =?utf-8?B?YlBKUlNaNXJzOXBWR0QzaldETERUdktFbEc1eDl2UCtSclRlSTF1NEJFc0U2?=
 =?utf-8?B?a2hmVzdOZnUvSWRVUEkxRjZkbjVjaGI1Rkt1bnorY0lrVlA0SEIzV3RCKy9i?=
 =?utf-8?B?c0g5cDhHYVFxeVVkTzQ2bGREc2JpMTQvNURDNllkWk8vUC9QOWpsbFZmZTZO?=
 =?utf-8?B?OWZCNHdlQjdXWVlWUmV0d1h5M1hoRkFmR003dG9udlcxSXJqSDFnVldrZWZD?=
 =?utf-8?B?VTZWOUE1b2JNWFZrZFhUQVJUak5HeDNQV0x2RlFhamJPTWJ1UFRoaGRscUpq?=
 =?utf-8?B?SmRobHEwOVc4OW9aQk5WOVVPdFpCOVdKMlhsVG5WYUJQMmR4NGw3VHVuT1NO?=
 =?utf-8?B?NmE2MEJmVVJvcmI1Ym5kTzhheC9Iemx1eDZTS1Zvei9FdlVYeTRSN2RBOWtU?=
 =?utf-8?B?MTZ0RVRhY1JaZGsydmFrNm5OWTdwbVlrUGR4TlByclQ1eUphL29pcmYvRktQ?=
 =?utf-8?B?ZHA0Qm1UQ3FXbzQzZEpUZkVKWUk0WGIxTUUwOStvWWZLSEI4ejlKSFg5ZURm?=
 =?utf-8?B?MG5qaE1HZmI3RFREdFBKdHQ3dEkrcDd5dFVZbjZVZ0RUazJyU2l1NXJsTU5V?=
 =?utf-8?B?eklJbmYzeTlMLzJmN050T3VGVmtUbVkrYlVyQUZMYXVvZXhNdDV1T0h4UFhl?=
 =?utf-8?B?a2Q0UFhubkdFMHlJTjFlcWV3VDhITllRQldrc2t0b0xiNUp1eHFCbWQ2aUE2?=
 =?utf-8?B?dlcrcXNaSlhrMUYxSXRkcWtseVNhK2R5eFNqTXJxWlliVTRiZWJORWpnWmQz?=
 =?utf-8?B?NXNsN3lnTHJRTlp4c2htblR0azB2S1NpcEdKcEEvaitESk10RkZlMlQrUGts?=
 =?utf-8?B?ZWlnOXA5NHRQRU1WK1ludGNYTDdxWGlDUUJFM20yd1p1MzAvcHFnUG1MWFRh?=
 =?utf-8?B?SVFIL0QvdmF3bnFwb0VzdDA1Ti9uNDN6bUg0V2l3SDdFalRVS0ptSFFab29m?=
 =?utf-8?B?ZmEwbFhSTHdMV1VGYjQxNFZENmVtOElkUTQ0WTN3MVlWeW5ZemExc05rMnFK?=
 =?utf-8?B?VUhGbUo5QllORjNibFovc05YYWxOUFdWZXRnUHZUenFLOTJVeThxQ29WU3hX?=
 =?utf-8?B?QlF1V1BqSkxIbDh4cElBMFNuZDlkUWhaVzE3aUxjTVVjZnZwNGV2bHFHb0lN?=
 =?utf-8?B?bER1NVFEMTFQR3BiTHN1YXB2d3Frdms2YXhPbjNnektOdTViM3RpQ0Rxdmd1?=
 =?utf-8?B?eGI5YWkyUVgzdnFwTTVMaEcxWkZsN3dmcDN6Y01aWExxQUp3QSsyL0tRbExV?=
 =?utf-8?B?cFQ1eGhqV2owZlVTWUxVYktGRkZpZjVpZXh4OGhod05HQm8yekhURGd2Qzhy?=
 =?utf-8?B?RnZiOGNoMTV2RTZFaEJ1ZEpHQktab1c3d2FwUHpJamFEOFBmMVlRcnlqZnNE?=
 =?utf-8?B?Y3N6dTVvRG5KTlllc3VKY0lCemg3cUtQNzg3dGdyQW9uOWFnZXUzZnJ0S0N3?=
 =?utf-8?B?WEdWNjEzZXVEWTA2dUVRT25uZk5OeE52ektDelljblhWVVIyNFhXSHJnVUox?=
 =?utf-8?B?RVNMYXFsSnJCbjlBQnFjZENCek04VkFZemlDZDNwOHh1L00vZ0MrNWRib01x?=
 =?utf-8?B?eTBGTDFFLzVFblNiNERham9OZ1ozT202V1orWkhISWxFVGQwRlY0MlozZitx?=
 =?utf-8?B?MmpQQVlXMm0zSCttQThaU0FnOENnSXhPOUZUeGxPTlBWSS95TVUvd0ErWk9t?=
 =?utf-8?B?UzEwYUZoMERDV09zcVNzeU9rMkhsOWRJcmJ6OTBWV2p6bm5PcmdUbjJ6dll0?=
 =?utf-8?B?QnBaUkF1Nm83ZmpwMnJqNlZLcUs2SWNveSs2OXpteHJyY05MRXVUd1hYdTF0?=
 =?utf-8?B?T2x6ODlrUnFHRCtwN1B1WHBPY2NuMXNjamJnYTNrc3FNRlpuQXV0c1kxZHlK?=
 =?utf-8?B?aWdGY2o0QVh6Tmc1Tjl5T0FuOUxNV1o0WXUxVlNZeStJc2tHaFB0VzhDVmNU?=
 =?utf-8?Q?pCqKvOH5UQT3wtg4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6d7f96-86e7-48b6-53bc-08dea5d3f2da
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:44:46.5112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2914yaChkrASGB36LXrdaJukstReqCsoYfa7A/Q9TR5elvFSilbvEkKX33cDivLYCMDxl4eTORQs3KlZgHHH8OisOdwdzOlMcih/3yz1gfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6051
X-purgate-ID: tlsNG-d25034/1777455891-6C159CF5-9A201A4C/0/0
X-purgate-type: clean
X-purgate-size: 1660
X-Rspamd-Queue-Id: E7D704923B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,patchew.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 28/04/2026 7:19 pm, Dmytro Prokopchuk1 wrote:
> The statement 'return ERR_PTR(-ENOENT);' on the final line of the
> function 'hypfs_get_entry_rel()' is unreachable because the logic within
> the infinite loop 'for (;;)' provides all possible exit paths for the
> function. So there is no execution path to exit the loop and reach the
> final that statement.
>
> This unreachable code violates MISRA C Rule 2.1 which states: "A project
> shall not contain unreachable code".
>
> To fix that and potential compilers "control reaches end of non-void
> function" warning, mark the code path as unreachable using macro
> 'ASSERT_UNREACHABLE()'.
>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Changes in v2:
> - add ASSERT_UNREACHABLE() before the final return statement instead of removing it
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2485661910
> Link to v1:
> https://patchew.org/Xen/341811ced2943fb79d0235c27781c564c7bdaf02.1775749146.git.dmytro._5Fprokopchuk1@epam.com/
> ---
>  xen/common/hypfs.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
> index cdf4ee0171..02fb234568 100644
> --- a/xen/common/hypfs.c
> +++ b/xen/common/hypfs.c
> @@ -348,6 +348,7 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
>          dir = container_of(entry, struct hypfs_entry_dir, e);
>      }
>  
> +    ASSERT_UNREACHABLE();
>      return ERR_PTR(-ENOENT);
>  }
>  

No.  This is absurd.

Not to mention that you are *definitely* not fixing the stated MISRA rule.

~Andrew

