Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LOcbNYIjI2pRjQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 21:29:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9F64AF11
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 21:29:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=UfrNH+UA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329983.1593840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVaCe-0008F3-FR; Fri, 05 Jun 2026 19:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329983.1593840; Fri, 05 Jun 2026 19:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVaCe-0008Cw-Cb; Fri, 05 Jun 2026 19:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1329983;
 Fri, 05 Jun 2026 19:27:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wVaCc-0008Ck-94
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 19:27:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVaCb-008RiO-Bh
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 21:27:33 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2322f6-bab6-0a2a0a5309dd-0a2a4507a81a-38
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 21:27:33 +0200
Received: from [52.101.48.52]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a232323-229c-0a2a45070019-34653034b262-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 21:27:32 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6475.namprd03.prod.outlook.com (2603:10b6:303:122::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 19:27:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 19:27:29 +0000
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
 b=EFuoMtJT1nMkZDPIVTqF8M1EqVP2FcTJ7z2mpqJ3Qyer+rCtHi43ZzknmLQm0AWM9ip2GGNM7k2F2NPPJo6u3vQUcYbSLZfue8K/FMpheWZDm0PlwyoQDbFmIvFiKnPldT3BZGw6Tz2dg12V75u1cSpeNLd9LL4wa3GZ1WP/KKHaJ7VJhsuJdgkSiIEkcSDQfGsn4IFMFDwpWj0bXDykl4ZRy9iMubsVaDjI1RICWqa2DnfaALKx1VynXy/IqnjdjOOCLNiAHwcS0GAeN9VfobydabHBSM67tDrU/Xs09TbpyBsfv+CxfUoibnVVFYxS+wYB1bpzfn823mT3CV2cZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2F9udTxQCo/S5c/QN5O2BclfqJ39ARxvLcXHsOvQixU=;
 b=kBWgtJEEXGdc8C5bwjXqncEI6fPNQ5b+gnv6BlWpwl3quWqJY5eVPjEpTGY8HXiy+/nCCBcMIlz1E/LGBYtBMhONGXwimkJ/+z54rWkAzNeoA+ayNBgygORxuEh4un21I3izdwigd8q3oxheJKPAzOx4IF+elygTtpXlg93AEexD/i7xqqxFPtaP4mvHOwoPbJ9RUNHOVC8MKyBhS4VVNY/GbzPPk/Kc+hmyU1c8aTx/YrVH3kf8f/Gp4PzNacewJQQm3bycBErZPjCb23BlwttdAWXX9p+MUbNxgOnF6PGT1432mtQ66WuTmqO5NGnms84JrZFZTFOzG1hYQfVMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2F9udTxQCo/S5c/QN5O2BclfqJ39ARxvLcXHsOvQixU=;
 b=UfrNH+UA2trY4f/y1fC8A7+K1Fax/Ol5wW+W9BKhEmtcWXDBwozHqLpiAg2tr6HBCm6JHzIJBvMPd3WNrp4I2xSE1VF6uin5o94fxJVILiH13zBAQI4f29O4qPxyY27P/Bffr55nHe/ANHG6cy/JMs3+IT0cQrxeyzGa1Zb9IRk=
Message-ID: <a0c5f98e-239e-44a0-a2ba-486a5b7f84d4@citrix.com>
Date: Fri, 5 Jun 2026 20:27:25 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, ray.huang@amd.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 hadyazzam@protonmail.com
Subject: [4.22 BLOCKER] Re: [PATCH v4 5/6] xen/mem_access: wrap memory access
 when VM_EVENT=n
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org,
 jason.andryuk@amd.com
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
 <20260115092841.2651224-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20260115092841.2651224-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0237.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: f474757e-e141-412b-e5eb-08dec3387bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/g6sVnJv4oLuBQRU0HUMqFsPwEBMcpQl9LW5Atb2mU6W30dutMR4RcEIlWzvxJhepKW64iMo0DBl7PcVuoCPybAmN6u1VR/oZmmjTzEuauxVWUJt2VuYo3/C0FSsedGmSCjqe3JmnLdRlWPpvgrrSAQYJsvBw0A0JBpfLplAhTC3MxCf/4IhFh3B++++BXvOmBbtClJZhi8DGiaCs4XXq6pZTcBzH0J0xUg5dpVuojn+2NGhoARZ0vJIiJP05NUbRCzd9svRBEMhNzpLfKTd3nwoTNk94lYcNQtYiUJjvP7mnsNOo6A0B69Xk87yrcNBFZ1wYFd0lX2MWR9rjQiCmKPHfFl9XTDdpi42DdECi0k7UW6N20TeYUwq7ciyyce+RoxQJXS9cVpKmslRSlT0q+GjNtnAXd2gw7etNSYCCfi3NqFnpttnOmwy+wEPVDUTDUvAvRew2bTOFNfVNPpjH2D36/A5L5epRCof4RMZxuE/3oTZZsc8Enn0jY5elOqQVu14AgfdzISzygKl/yuzKsTGbHSq3OZxIcV+cNVgDRtGN44jqEMGWdI4lLY0e5QQpg0uvtZ1o8Igwf9E1XPH1lClAcnIEirlVI9m5JfpVn3abRF14zJUZ4Tk5YCrCe3f3YxQc/QaIMOITvJm0wF2D1uzR4SYVKTdakZfJ3KEOLllQzPUQucxM3mjjDdCcawE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkpTbm90STRDaFRwTzd6UWRsL2oxOXUra2FmS1h1V01sMTJETlZPUVNYZUUw?=
 =?utf-8?B?d0t4cWlmSmJiNHFmaDQ5akVQS2xOdUF5S3dWTWNicnpSbml4Tk90K0FhNHJS?=
 =?utf-8?B?Q1lVN2lQSGREcEJFUEJJblNoOTllaGJoSFRzT2t3SWNtbml0K3pnekUzV2Yw?=
 =?utf-8?B?TnBaMEw2aVVROFg2SmFoVXlxb29sL1RxOUlWTU5tTVdMMnN5QUFFM0VWYzhE?=
 =?utf-8?B?dVA1OXFrRWszUkcwMlNFSEpnNWdlVkhCcFpZYUR1VHpqcGV0clVSOEJEVFI5?=
 =?utf-8?B?UzBTZ3JGdHAvZHBScVkxeVp6ZFpEVkZqMDdMRW0vR0tHa0NjVTVQZTAwZ0Mz?=
 =?utf-8?B?eGlIOXMzcGlmbmhtcUt6aHF4S1NBTHRXNTVrSGRXaHc1WFh2b0tQWUdNZWZW?=
 =?utf-8?B?MUhsalF6bjkxOFZWb3JvWUJML3k0M0tSVnIxOHNWcDdHVDlEZWZ4UnYzdXlv?=
 =?utf-8?B?WUFXTVVGaE5KMmhPajJHUGE3K1BUcW91MkNsVmo3S01JSXdYWUFzZTh1eWZp?=
 =?utf-8?B?d0VKK0tMR1hMdFR4NUpHWXdBOHl1bVdqU3g4NHJjTDA5Wkh1dHhMK25DNC80?=
 =?utf-8?B?RUZURFVYN1U1eWNtYlFvNCs2UEVPWmdhK0FOc3NGeWZsektpYy81Z2ZmT2Mz?=
 =?utf-8?B?b3pnUUZjNFZldEJxWlk4VHdCeDNUZy9XZm9nUHhxSVZ1U09XZkJSc0Y3c01x?=
 =?utf-8?B?eTVVQ2g4MUprMmNpVzlUd2Q3UFEyZVJZZTh0WWJYQWJ1SDJLQktxbFhZdmdE?=
 =?utf-8?B?YUdNSk9FWDhaa3c5OVdob0E1QmhRSHE0N1VqVEdGQlZ4ck5KVGkrTm0zK3Jz?=
 =?utf-8?B?SmxINUVidG9PUncyWWYwaFBqcGhabEVlM28zQ1lFeGQyODM5NDU4YTJFQXUr?=
 =?utf-8?B?c1ZkMExFc2o3V1VyWXBpYkozaVlrOHk1QWJ1eVpOb0FUS1Bpb0cweFZoczAr?=
 =?utf-8?B?dkFMVDM3UEM1ZEpjOURUV3pKMUJ0anByUldqNUZoelRGcVRMMkRMR3RENlp1?=
 =?utf-8?B?LzdJaVRvc0wvSnhLdU80c21LWWk5QmJ2bjRkZG40U2oyRC8wNXpJWDNsUkpi?=
 =?utf-8?B?MEkzTGdnL2thalF6d00wQ2tpc3ZFNEIwNVBNbG05UVAzdk1mTmlrNlp5V0VP?=
 =?utf-8?B?MVFFd2IxY3dvUkJDRXd5QzlGclhwc3FhdEZHTnVyUm9nNVYyeVdieDkvYThq?=
 =?utf-8?B?YzFUSnhhaVFUaFZlN0VnbWNxdjJhdTBVZG9QbHpxd0p6UlV2OTBPRUpram5Y?=
 =?utf-8?B?YU9RVHhlM3MwRUlsdjFxRHljTkYrc3FTcU5GR2xnZGQwaUU2STl6K20vdk1O?=
 =?utf-8?B?U2lWS2g5SVJLaGhINFhLb1M4ZFNTTFpvT3MwaElxd000QlFTKzdMREhtYUpD?=
 =?utf-8?B?T2MwZmZSQThkMHBTSzRwbUtBYXY4UW0zRG8vUE5sOVVud2Q5Y1hndFAva1hF?=
 =?utf-8?B?N282dUZFVFZqUEZpVUFrc0tXcjZhV095OExTWGJTd0hWSXBoeDlwSmJZTms4?=
 =?utf-8?B?WGFzeU1FZzJ2VnRIZThtUkZMWkhLY0wvWXh3TDZPbHkvTC91RkluS0FiNlM4?=
 =?utf-8?B?eGVoeExiZlBtbGtubk9jaTRzQU1HMVdNNnYyclpMajJCWW01aHJXY3U0bm1u?=
 =?utf-8?B?SUVMVHZWVmVpMUtRVTlKcVhoYldDOFBwUk1mQS9jazhGWk5kdDJMbzZDbkNK?=
 =?utf-8?B?bC95VWR6YWIvMlhjMXN5RG15bW5kUGIzYUk3U3ovdnhrNzVsQm5RRzVkeUNX?=
 =?utf-8?B?aDdxZ1RnamI1UmVLZENSZkZJdDRLejNjQTU5N3MvUTJpdGU3ZXpFY1dVeGN5?=
 =?utf-8?B?c3ljVlplV25MQURSYlVCMXJ2NFFXRk5vRXVudmo0cjNlKzVzallkK3JTTmd5?=
 =?utf-8?B?TC91d0ZDSWxGYWsreW9ZZzZtNk9DVEQ1WTlRQjdPU0lSUW5XU3MxQlgwdkdt?=
 =?utf-8?B?ZzYzaXdZVnJXUTNQcm55cFBJQ3l2cmw5Vk52b21NaDllNE9FU3hRUzhqakt5?=
 =?utf-8?B?NW93VTNHNXVTR2xwZGEzeisvczZZNy85VTd2U2pHdlF1US9QTlhoSlovV3NC?=
 =?utf-8?B?L0k3ZnpCemU5ZFJWalhwWEV1VmRRTlh4cDZ4UE1kQ3M5Z1B0S1U3OFJ2OVBH?=
 =?utf-8?B?RnBRK21VWU1ZdTAzaDlwbU16YURRa1AzajdhNXJNelBxTis2TTZQbnU2UjMy?=
 =?utf-8?B?aHpBMWN3andtcmFURU5KUmNFaWJXLzhiaW5tTlBra2ErNWZhWEczYndBakh6?=
 =?utf-8?B?VnphNkdVU1dJajQrT3NsS1pxNTJXRjdsSjdCNDh1VG9hT1JOaUJUNmxwNnoy?=
 =?utf-8?B?NGR2VlVqeFJxRll4UkpVWC85bFE0cXNEcVI5UG5VaHBWMzYzcTBBak0vZ0gv?=
 =?utf-8?Q?+3dW93lxrBEiDKv8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f474757e-e141-412b-e5eb-08dec3387bbe
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 19:27:29.5749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QqBXD/95/9Hp/1usaxWTQKLkCIESggYuAwnbNFs2Ki1yU0NGNu1/+0THg0jymg6iQ8CvUi2J4zncj7NxVsENxc/ZFHf2eZSHwHbeih/62Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6475
X-purgate-ID: tlsNG-ef75cf/1780687653-2176AC48-D554BE79/0/0
X-purgate-type: clean
X-purgate-size: 1774
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,amd.com,suse.com,tklengyel.com,protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[set_mem_access_multi.nr:url];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:ray.huang@amd.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tamas@tklengyel.com,m:hadyazzam@protonmail.com,m:Penny.Zheng@amd.com,m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 30B9F64AF11

On 15/01/2026 9:28 am, Penny Zheng wrote:
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 07e54890d9..b34cd29629 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4804,6 +4810,12 @@ static int do_altp2m_op(
>          break;
>  
>      case HVMOP_altp2m_set_mem_access:
> +        if ( !vm_event_is_enabled(current) )
> +        {
> +            rc = -EOPNOTSUPP;
> +            break;
> +        }
> +
>          if ( a.u.mem_access.pad )
>              rc = -EINVAL;
>          else
> @@ -4813,6 +4825,12 @@ static int do_altp2m_op(
>          break;
>  
>      case HVMOP_altp2m_set_mem_access_multi:
> +        if ( !vm_event_is_enabled(current) )
> +        {
> +            rc = -EOPNOTSUPP;
> +            break;
> +        }
> +
>          if ( a.u.set_mem_access_multi.pad ||
>               a.u.set_mem_access_multi.opaque > a.u.set_mem_access_multi.nr )
>          {
> @@ -4844,6 +4862,12 @@ static int do_altp2m_op(
>          break;
>  
>      case HVMOP_altp2m_get_mem_access:
> +        if ( !vm_event_is_enabled(current) )
> +        {
> +            rc = -EOPNOTSUPP;
> +            break;
> +        }
> +
>          if ( a.u.mem_access.pad )
>              rc = -EINVAL;
>          else

(Forwarding a report from Hady Azzam, CC'd).

This breaks introspection generally.  It is (mostly) erroneous to check
current like this; it's checking dom0's vm_event-ness, not the target of
the altp2m op.

P2M changes are also inherently domain-scope, not vcpu scope, further
calling into question the use of a vcpu-oriented check.

As far as I can tell, the misuse of vm_event_is_enabled() is just to
wrap the IS_ENABLED(CONFIG_VM_EVENT) condition.

~Andrew

