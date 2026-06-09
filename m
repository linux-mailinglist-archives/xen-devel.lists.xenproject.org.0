Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hgrSMjhjKGpxDAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 21:02:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED296637C3
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 21:02:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=oCVVhDGd;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333790.1596950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX1i2-0007aG-Rf; Tue, 09 Jun 2026 19:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333790.1596950; Tue, 09 Jun 2026 19:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX1i2-0007YI-Of; Tue, 09 Jun 2026 19:01:58 +0000
Received: by outflank-mailman (input) for mailman id 1333790;
 Tue, 09 Jun 2026 19:01:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wX1i1-0007YC-GP
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:01:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX1i0-00EV0F-PY
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 21:01:56 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a28631c-bab6-0a2a0a5309dd-0a2a450c84fa-14
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 21:01:56 +0200
Received: from [52.101.52.36]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a286322-62f1-0a2a450c0019-3465342422f8-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 21:01:56 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV3PR03MB7732.namprd03.prod.outlook.com (2603:10b6:408:281::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 19:01:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 19:01:51 +0000
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
 b=b74JAeQsTgnyOCWHfW8IlbogllWstw+z0dO3JdwIan8MIKST/8mdJ3/VCL0BNvkWfb3+OynHD15uqQGTC2vIwWNjJkCuV+ebiatksG3zrfNiXqipiCjEDUDjsTZqTARpOs1yb+k7GnWbAk5RedonsALLvb70OWlFKaBgcsUP9r99f8E6L80/vCLQPp2rUQ5BSG5vUJmsviWgkQUUHeusysNaTg7NDIrq+w3kE4lsLg0D5wvBYGY91B4l9TOlPVCH1x/Zn9FLWTAKC0gxAyfvHTYq7pMFhrtKqPJuB60IvE9PMicAQZVg7l5sTZfqTev4xyjEJFtUaw4gdl5WgixKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R40MhzSV9GmPu2Oq8mPdWnfAGjIHXwzc1X/juP6K8wc=;
 b=Sw4/1ZheEqfiRgvbaLWwPLPiOL7+/53/sJepadRUOhoLDSHs60O7pJXlaiaSAQIr7/65eUKhB7IY/kzjB1xgyPNW489zME1YvPoAOUpTQvTgeGMXlmjX4cICgt7rtN5w2a8yvg8L1UtqW1qoV1cwIX6WSG0787favH83jC9cKH6Y34EZhwLeTHo8JyuGvYwB6dS/FS4ejmGcgWcn5mnNEgHLcTc+Q86K9EyrocFrpyFvOfJ+lstJj8rH3550tDwiES3j7Sz25eCIeUQTpl+1XABrhL+60HEyHJT9aSXSg4gt6dBFBq3h8KHP6IjINkBmm7TngEqG9AmL2j2cIyhzzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R40MhzSV9GmPu2Oq8mPdWnfAGjIHXwzc1X/juP6K8wc=;
 b=oCVVhDGdfJPWL2FPCFRHPuV/6cjJA77iJqGpHu63I1Atnli+eWI4nb9QrJVsnSFYXwCyZtITfdUIqdiFRZkobQuUGIMat70lLL0L4sLU3pTXHbS3xhXXltiCJ/bUT97yxuohG8bPJoxGIFjt3PhPWMMBU1VGEe6TV1ytGtDcKNU=
Message-ID: <6aa8af05-cd42-4e98-8169-a80cecbca869@citrix.com>
Date: Tue, 9 Jun 2026 20:01:47 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Kevin Lampis <klampis@citrix.com>
Subject: Re: [PATCH 2/7] x86/kexec: rename setup_header to bzimage_header
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-3-kevin.lampis@citrix.com>
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
In-Reply-To: <20260609154518.779757-3-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0533.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV3PR03MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2bda35-7844-4ebf-d6f0-08dec65990c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	QD6CCZn6wwZmD3P5UOaJdVofTdWOA9KuIW6ys8Nj0e/muCYbKiEXR0VUiao5dldm1Xx8shB4Q/tdFUtc9kDlJMd6UTeJo5InB9O4Ij9rfgBW6mybNAOiipFnn24mPiCQtSDPVO587zydJZfnIBoqmn/bYqiRcxQ6k/XwfhJkJS7IIX8r0bPak92/UDY3lZkfzDaCF+COeXMer9t5FayLM79gL4a7JUhdlRF7e0W9g8ERB0lhbXViO9tYi+HnznOThoteNpACRhZ16QAXW7CuOVLdCKveamVhpwVyG7Hx4avQSM5rFm6TvJClb61vq+kkLaSly8CVzrVoCCRzjfQym98QBdA8iZ9Fpt9+tqqtU43FdNldMVwUg3xs/REX12zEGguu69WM7kwI8nflYCi+AhpKs4yGvGRtW6+GuZHn2amYcOsnEXhGBgNN8AI2nGSzErP+eUOa49L1WMY5HFUflB/E4T2iyItgW40/Q2tD13SVhXnGBvnILCYw/7TrDBV3ediXXgE5vAEVI+1jEvs0zh/YT9kxmPSKCfCkqbU4DCkueOUB1JL8mLKSfUCDhzWOKGHaPaO9rVadGAviIYTQsU2Rcw3vr8o8OHlFqzrEIL4AkOoVz/UCXfrm3w8/Dd88wLCvcKLfXTElm5JNhmsrjpCTPgFlG9JmIhd23bQjXkzcbz6axFrR9fMhmobewKq4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnZXQmJXbVJVVXlHR3pyWENNejQ3RkRvREhMY1o4K2lrRDRWTXplbmg1dzM5?=
 =?utf-8?B?U1ZqaUJNODd6T1pIMkRwRFk2Qkp1Zyt4UVg5dlhzOENnSEMwekRRUGdyZGRG?=
 =?utf-8?B?OS8rTWJQY2VFVmxOeVhQc3VZSW1jbkIrclo1bWliTXZDRnJqT3l5d2pXd1NX?=
 =?utf-8?B?aENXVncyUUhYRHc2czcwREs4OFNsSVBVN1RDWUlMSS91UHk4T0RsQUh5Y1ly?=
 =?utf-8?B?MlVVMmwxK1BUNzlIOGd6cGxlWm9nRmk5NStVcXB0dm5USGljMW50dWhCK2Mv?=
 =?utf-8?B?KzBSazc5TGVVcEFWck9iSkdQV2d6MDhpWWpPbTl2cENRVkhBa0VuQ29PMU51?=
 =?utf-8?B?emM3UndoZVRrWC9LZFBvVlkzRVV3YzhqazlRN3YzS1Nwc0ZjVndJYTVraDhQ?=
 =?utf-8?B?K3dwVXorMFVFclVHRktUYy91OUx3YjlxRk1qVnVmYUcwUDBsNjNyay9wc0tD?=
 =?utf-8?B?eDhhQldjTHFLZStCUlRuOElpTnQvT3Y3QzBNRVUxaEptT015NlNCbHgvU2NH?=
 =?utf-8?B?WVBhWTBhcVV4cDdvbjliNVgxZjJ5cUdPaDNSdmVTL0J3S3Fuc0NCdnBqKys3?=
 =?utf-8?B?YVgvZkxabkJFeG11RnY4WHBOZ1duaVZyekRBTTQ4dFM4WWQ3NCtrMVphVm9s?=
 =?utf-8?B?bzNlSnM4MjFaRnRuSDNEQkJJRC9OWnNGZXJVZ0llRG5YOWlWdmlvRWtDOWI5?=
 =?utf-8?B?bkphVjF1d1UwWDlUbW96UVA0Wlk1K1BreFJ1eURIaFJaM2tIMHhsSkgwV0xm?=
 =?utf-8?B?VnhmT3lneXNySFpDWVpPMStMMXFiSnhEdnFkUjQvOVJjaUFZL1VpVkdMdWNC?=
 =?utf-8?B?bzBicGlyVTNhR1VKZmlENkVrREFvLzJxWUduYWtObklqVitPeWNnNHpwQVA2?=
 =?utf-8?B?dExXNm42Q0pMb0tERjJRaFpKVUVDbmdWdU10dmlxNEVQZDZPT3ZiZWpCeVZE?=
 =?utf-8?B?cHZqcGRheXBBblZtN3NTOHFLZ2EzMG5uVitoSDZ0RlpRdk91SXhtMlVIOUx0?=
 =?utf-8?B?TkpaV2x2Ulc2N0dLQ2xNbEZCMTVWUWJHSEFnUVliamN1Q092YnhKemNqa3JX?=
 =?utf-8?B?cndVcTQ3eFZOUk5ONGppWlU3U1puK1JPZHJWMXNzSXYrR29Rd0k4bTRDak9y?=
 =?utf-8?B?bk1ob2hFdW5UL1BUWDZNNjdXbE54c0trYklaeTdXVk9lMDdwQWxRWFFQREVk?=
 =?utf-8?B?V2ViNmJXcTV0cFQ4S1lKWWpxdldBejBJL3V5UWN0TWF6YzluczlXa2hKRmlI?=
 =?utf-8?B?eU5KazlvRzhUSlFCMDJOQXVuNVNnUU9Lem5DWndFWm9UYjIwL2IzQ2x1a1p6?=
 =?utf-8?B?ZHFib01BUHJvdGhOdnpHRDFnS3owdnFDbEpkU3MzSUdmL3MyUjBIMVVyZVBR?=
 =?utf-8?B?V2Rqci9Ec3pEalBPME1CQVFOQlZCT2JjOFV6bzMraXdwRHJGRDJNRzFlcWhs?=
 =?utf-8?B?Vk00YnBmNkw4elVlWm5scktPaWdHdHJjQ2hUc25lSFVnMzFocVlxQXphUzBX?=
 =?utf-8?B?WjlJOHFHeWtWTnBLUG5xYjdIZXMyaWxzd3FQNHhwTkpEMFhXci9BNjVSQkJR?=
 =?utf-8?B?bmFjSGl3c3NqamR2K0hEcE8rVjViWUtqbTdmYVBTVnlWV3l0NmlaOXVvL1VV?=
 =?utf-8?B?Sk4xZTAzUWZZeTVQMy9BbkMwRU1tYmYzSVlVa0J3bHFPM1psRC9aSUVBaFhi?=
 =?utf-8?B?VGUwWFAzc0NUbDQ2Wkp2ZkIxaXBlcDR6aXRIcjJmUmwvaVl6WUNwb2JYU0E0?=
 =?utf-8?B?RGFKOUdlc2FoVHp3UXRTYnNlelU0dzYwWUw2d0RXR0RxY3VsZVlxK1ZkK2Js?=
 =?utf-8?B?QnRaektqeEZEd25FNUg2ZmFEVTRHWVZwN2N6LzMrZGl0ci9JdFNZNTBidkNW?=
 =?utf-8?B?dmVNZTVPSVB6THFHL3o3cjJsSEEwdGdGV2NpWnp3a2dycm9qQWl1aW1peVFa?=
 =?utf-8?B?K0ZmYkphR01FTWlnbmFPOEcvc3ZqNldkVVJXU0M3U1A5RmQ1eW5MbS9xZjZ2?=
 =?utf-8?B?SEkyaktqYzR3TWtZZXFQdDhNL2RpcFkrUzZFbDUydzJqYWtJalBnckhCNkZm?=
 =?utf-8?B?ajlvZ0M1UFRpYmg2SXBZVWNCN1VlcmFCRGpOUlVRTDgyMDdtc3JNUS8vOUIx?=
 =?utf-8?B?T1RXaUFBWU5PRXc2K0JycGthTW16cUxBcDhHdnZIb3dBeCtnNWpTK2VsWS9w?=
 =?utf-8?B?VTVjUFFGeGZTUDZRQVQ2VmJLcHFtSEVNYWNTeGtOaDMyelhPamhGbitvS2NP?=
 =?utf-8?B?OTk1bVZmQ0JTTlYxd0dodWc5RHd4bXRrVlBkT2I2cUo4QmJQRE9ISHpTWGFt?=
 =?utf-8?B?ekpiVURjQXlQMzl1N0tMSldyTEQrdUdpQWN2UFVMa3BoQjNWWmVTaFU0R0lQ?=
 =?utf-8?Q?X8btF1r7nflEjHbA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2bda35-7844-4ebf-d6f0-08dec65990c2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 19:01:51.7122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8rvSi4PVt2/Vd2xOyGpQNc2zsKg+wxRJTEwbMvjnrWRJoZ9Oimj6nXdukrg8LOMbALMzD7oOrlTsNNKvY0F+YG97RRfq7uZlk2i06m5M20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7732
X-purgate-ID: tlsNG-d25034/1781031716-DA776CF5-5E5D81BC/0/0
X-purgate-type: clean
X-purgate-size: 990
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:klampis@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2ED296637C3

On 09/06/2026 4:45 pm, Kevin Lampis wrote:
> @@ -73,7 +34,7 @@ static unsigned long __initdata orig_image_len;
>  unsigned long __init bzimage_headroom(void *image_start,
>                                        unsigned long image_length)
>  {
> -    struct setup_header *hdr = (struct setup_header *)image_start;
> +    struct bzimage_header *hdr = (struct bzimage_header *)image_start;
>      int err;
>      unsigned long headroom;
>  
> @@ -106,7 +67,7 @@ unsigned long __init bzimage_headroom(void *image_start,
>  int __init bzimage_parse(void *image_base, void **image_start,
>                           unsigned long *image_len)
>  {
> -    struct setup_header *hdr = (struct setup_header *)(*image_start);
> +    struct bzimage_header *hdr = (struct bzimage_header *)(*image_start);

Both of these casts are bogus, and can be dropped as you're editing the
line.  (Probably written by a C++ developer.)

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

