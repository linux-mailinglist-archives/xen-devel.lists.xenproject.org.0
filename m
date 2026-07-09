Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5YOXON9xT2pvgwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:03:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEDB72F4A0
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:03:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=wDXjlEO8;
	dmarc=pass (policy=reject) header.from=citrix.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357827.1612160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlat-0002z2-TT; Thu, 09 Jul 2026 10:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357827.1612160; Thu, 09 Jul 2026 10:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlat-0002xX-Qk; Thu, 09 Jul 2026 10:02:59 +0000
Received: by outflank-mailman (input) for mailman id 1357827;
 Thu, 09 Jul 2026 10:02:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1whlas-0002xP-Qa
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:02:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlas-0034ne-6r
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:02:58 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4f71c7-bab6-0a2a0a5309dd-0a2a4504a5a6-30
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:02:58 +0200
Received: from [52.101.43.36]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a4f71d0-a01d-0a2a45040019-34652b24be97-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:02:57 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA1PR03MB7075.namprd03.prod.outlook.com (2603:10b6:806:325::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 9 Jul
 2026 10:02:53 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0181.012; Thu, 9 Jul 2026
 10:02:53 +0000
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
 b=g9/b4LMAjeFTwvz5Nn1hNHqWyYUv8DHHvTC+105X+kVMXnBTaz0jEcsAmc4vdZfUNGDCJJr9+1YG/Vi/FJmV/kYHyroqDqg/zQMQakzZ7kHivN86TIilgThk4pXQOAPne9IWX0rWOEzeeRwJdC6Mfn4sgu/1e9PJFn3W4s+3H9BN1WDNHReKUnKUU/OLDlWp3WmnlVcKY2NnvcAkH6aDDPKe1bGjnMIt5hBUV4Ad3I9C9jcB09n1Nfd8SE1ERYEmRypJQifoOwoyjC+oszfVwvA6uNyyCAUm+WsW19ss3DoZVFNOYRCnnxte07ZaR6cB4JtmTV/MPcK3ZUxQXQ9L4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gl/zCNf5YngjikrbT93/lWoL6XWRmyySvZDjJneEvq8=;
 b=MNopK1P5E0MvCTWqO+Ejl/rcgPfLivCwhh5W4dxJ9YVeWHFtWscnF7A/8J8Ii++GsPackmdU24BCYaubxsw63UvDutEH7vmdq/3izHNfMT5mt12AhInLZtdR7XhTE5nq8QoE6WFObxilR5OtQSqmpXytQGoJ5s2t/7LYc0um/Y9no1nGiwr9DEDodsY8Rue4VzH2Kl3HVznpiFxkfWEutWd33qNoO/HzYYRB46UUOeYF8SuZ+umsaqhFNh5sqDuiIsWyWeBCL0DvNVawR3owpe1+HLWIk76H9DdX4aSIINbTaiN9XCmt/AVCjemobOMBJ9rdG4lvbd/EpPjo0WalzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gl/zCNf5YngjikrbT93/lWoL6XWRmyySvZDjJneEvq8=;
 b=wDXjlEO87cZqVh03pSBN2LvZ4gd0FrCmEo0j0avaihORV+UKR5ZtqQTCiJqm3Un+7pZeneLFFL99nW3DixDcRRuhOposi5qcBJ45s/eg0nD4pA38zwqRPMnFZCSfN023fNXOdHWTkETsKwGjSjV6WnYxgD9ei0GRE3kEUD4KgsA=
Message-ID: <c5873e46-596b-4aa7-8eda-0c1d62a62a6f@citrix.com>
Date: Thu, 9 Jul 2026 11:02:50 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH for-4.22 v3] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <500cc80a172570f7fdde3287185398dc49460b2b.1783590032.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <500cc80a172570f7fdde3287185398dc49460b2b.1783590032.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::23) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA1PR03MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e88575-e53e-4925-4509-08dedda13e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	qfuxTanWQePVDSo0vG9G18nZyHxIdpZSVK8HGXjovfPYM4/8Rbh52IgUxq/ONREK/MoPmLZIYB8p6km9v3P9HGdnBAVT61m3kaNVZtemjir7o50hrAn9w6aklORLa2S+12FCE++CTqMAVdo5bc94f6HfI6GYN4NaReU7I4d8vSxrj4EU63hCLiZqNrJ1kr9KZmJ3C97Wh3oazVeLnHw6AZp0jlMCrp3R1Cpq5dHq5wFAk6OJpd2V5PM6j2/s/o/SXTMugpFmyd11+tu3THTTlWHdBUxZvNQfB56tLkxjbsSAeyXoRFQ2gt0lttF+I/gF9eOrlQhD1iyCXIQvC2+KOaGu+PsABw28b28BrtsJmz5KQqHT/fZDbB/FskdreBf6s9fvGjJ/l6HCFyJx31gbLJjbJGCAbuv4TaQ0VT+ZpLjLYar0GnUEKwU4tHMwt9V2CBy5GDBlFnhG1+g2SNsMFLTC2Rxv6zgQm122ZOrLSLCS/bUpiB/lASLbLF3ttj6J96vE00qRhHVUN1uhcHaLzbH6s3R8jVqHLzp8T44Fg7nIfY9jvZp/A1mymOB82P/fiULcRhIqd5eHA2QrYZzpCToBg6XRPOP4WGGDemhaGr9+ozRlQhVTvvomuC1IwGUjvCdctXhz9IqSYECYyRMJX+U21HThTG7kqIGjWvIVWP4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXRQRmRpU3dyTzBESDRtdVlJSFpvK0RORXg4QjRpa0kyeGZpaGxCVWliODR0?=
 =?utf-8?B?R2RCWjIrSXdwWVdZVTJPejIzQ1YvcGg5bE5vMFhqNmFrb2krblpVWkZEVU01?=
 =?utf-8?B?U09rV1BHRDZTUkxlOUgyQnRLeFlCUzZTNURqdVRISUJKaS9pcldMNUJaZmRI?=
 =?utf-8?B?TjFENndsWWVPMldhbWo5STg0VlBJMEs1OFFpMWFDdGErbXYzNzM1T3FFWDlM?=
 =?utf-8?B?ek5qSnNhVVpTRHNLOUtneU9FMW84T0ZxanZRTHRDQ1hIcGtaWEI2Mk1Rak8v?=
 =?utf-8?B?VGF4T1ZLaWppaklRR0gycDRnOW1tNkpkQTlRMG5UTXgxWGRpSmVrSnpObGJM?=
 =?utf-8?B?NWZsZStLakZjQ3ZMRDBrMzRxUStEVC9MUHFnZGtUQUtqVGFWdmZ5WW1TYzBy?=
 =?utf-8?B?S3hxMVg5WkVYbjZnM1lDRTdsR0U5bGJrVDdRV1VvdU1rQmZtaWs2NmthUy8x?=
 =?utf-8?B?a0oyWXRwejIvcFZEeUFTY3dYK1NvNlVvQ0JGQlpTRXZ1TVh0UlJCY2oxNmVH?=
 =?utf-8?B?SW11OTBqbSsrbW5DWnpGM0Z5akRmZHJOVTY5dmlZM05sZ3NJNytKbk1ISk03?=
 =?utf-8?B?eHhhbVJXK1JzUTUwWmNIcHFlS3NSeFRPdHRyZk5DdS9mVzlveUkwK0pFRWVi?=
 =?utf-8?B?VHZzNU11SHBlbnVpdUluSUo1Q012ellKdjA4b3JQRWpnV25GTWF5N2g3Tk5l?=
 =?utf-8?B?TmZaNFB3M01YcUxIbFJibTV5WnlCbzArajlsMUdwTnFPOHkwNFpOU09zK0cr?=
 =?utf-8?B?Zk9aeTVtS0tjUzdQaEZzLzlUa3VCeG5POElVbUp4dmh3OE9PTXFFZU9jL2VY?=
 =?utf-8?B?WXltKzZNYlQwaXVGSVZPN2QxbnJiY2RDQ3dlbkV3TXI5VGN0WSsvblg1anFi?=
 =?utf-8?B?VDk3cyt2bXFSUm14bjF4YlVJRC8rK0ZsVkp6Y2lnSzlmeldPS0VpbjZmMit1?=
 =?utf-8?B?U29pUGp4QUJ3TnQrSVNDZ3ZOa2J5aUlwV2Jsdk03eko0dkJJY2pqRWs3ZWF5?=
 =?utf-8?B?Q1Q2NTFkMGxmcFZZWVBob3ROWkIwRHZGRnlwNzQ3WG1pVjIvT1l1WDlmV1ZT?=
 =?utf-8?B?YUczdDczQ2lQSHZzMUNUWStIVTRLbEdQcXVxSWdhWndRNmlidi9iRWpYS29p?=
 =?utf-8?B?cWJRckdDd2NNOVpTbEFXLzFiOTlRTzUzdVpKVkYxSjdDa09yRE5zUk5aYW5T?=
 =?utf-8?B?aVFSaUp2bjYydlBlbDhnRjBRdVhzSU9Sd3NYREdMTWlFUVA1ekFMWEJNNXVD?=
 =?utf-8?B?bVJkSk5TcWlJY3RzcnViVnROYlF4MVVKUVVUYnZBckRUd1lmaGJ4NFdEeFQv?=
 =?utf-8?B?cjhBUWRwc1dGb0IvYXU4LzlzZ0RSWkZZU3MrUXJEU2xVYUF5eWJjTWdMalZM?=
 =?utf-8?B?NFdoalNOaGJZd3RMWWU2OXBqTUIyYU1ySXNaZUhRaVNiRS9xYzBocGNlQTF5?=
 =?utf-8?B?TG5aMjFaYktkTGJ1WEh4NVBnNUJWR28zaFc1YllBd3pJb2FEbzZreW9RWGdE?=
 =?utf-8?B?emI0MU5hUSsxRTdoQi9LYVkyL3ZoQzkyTW1TbUdWcnQ0VThpSkJBejdOYW04?=
 =?utf-8?B?L1kxdHNucEsvUTRLWnZNd0FnM3pIcFBLa0pRVUxxUzhoOHJZcDhiN0FjbG45?=
 =?utf-8?B?NzBYL2RMdDVDSVUvaUJLMVF5OGFQWXZsNHVibW5ucWNUbkxBWkpJT2ZjQ0pU?=
 =?utf-8?B?QWhQWDEzNVVoYTh1bzVUVkpING5yZGhBZWV0anRjZjNCNzRQbGdUYVJGdDcx?=
 =?utf-8?B?blZBRyt1MjB1K2ZwaVpvSFUrVmRjNFNqbTlvcm9tRTh0Um9DNTJHQ082NmtU?=
 =?utf-8?B?alFFQkxPQ3Z1WnlocTVLMk1mTnpINnp6eS9ubnlLZmQvY1dmc054NTFweFVT?=
 =?utf-8?B?dElxZmNwM011VjNRRlU3R24xNmk3ZXBTckQvMmJsc2ZHeHNqcHVveThoZStL?=
 =?utf-8?B?VmVCeVJKMUZON3ZhU1Z1bGtsbWVuK2ppdG9YazJ6Nnp1NlBRSTdEYkphVUQ4?=
 =?utf-8?B?cXBOWVhoYnFONm81blpnQWpVQUtlck9pVzlkb1pvNVpoSmFIMVFFdjBMTndn?=
 =?utf-8?B?ZGVjMWQ3UlVyYTFGd090ckRNekgxRzBzd0NoeXpHbW11RndSM25VN2hqVHpD?=
 =?utf-8?B?OEtxVkJ6SWhRZ3p2d0J0Q1JrbVF5bVN1SXZqM3hxNWhCVUJUYnZ6d1JUTW5J?=
 =?utf-8?B?MHZyMEpISXl0dXFyUWdLZDFBOWNCVTZXaVlId1ZMczRueEhJZzZUM2FITHNZ?=
 =?utf-8?B?NEtBNjdYbXlQT08vSWEyaVhvYWo5cGJVckhDMXRPekhlOXFVc3hhUldnRnk1?=
 =?utf-8?B?MkxwZG5FL1JsTUNWWVIvd1RTMTQrT3ZXRzhWMERqVFhiVmoxbGhzdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e88575-e53e-4925-4509-08dedda13e26
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 10:02:53.6828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qvqc42M4ZDKRorak+aIp1ZxLy4z+iKt/nhqn+ZN7Au9FfrXJk02AZsxSRLHu+MhFFbUQKJBLsTm7cL6O892LIXQq8Ti4Rdh3N2Pt6HRjMeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7075
X-purgate-ID: tlsNG-ebf023/1783591378-2F9531CC-05689F7D/0/0
X-purgate-type: clean
X-purgate-size: 1207
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:from_mime,citrix.com:dkim,citrix.com:mid];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DEDB72F4A0

On 09/07/2026 10:44 am, Dmytro Prokopchuk1 wrote:
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index eacfd93087..179a2b88aa 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -341,6 +341,13 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>      size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
>                                       DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
>  
> +    if ( address_cells < 1 || address_cells > 2 ||
> +         size_cells < 1 || size_cells > 2 )
> +    {
> +        dprintk(XENLOG_ERR "Invalid address/size cells combination\n");
> +        return -EINVAL;

As an aside, this is a terrible error message.  It's literally
"something went wrong, but I'm not going to tell you what".

A better error message would be "Invalid address_cells %u or size_cells
%u\n".

You should always identify what value you found if you're going to say
you don't like it.  For this example, it might be that the issue isn't
in the DTB at all; it could be memory corruption causing Xen to find
junk here.

~Andrew

