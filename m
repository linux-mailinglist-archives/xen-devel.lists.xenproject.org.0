Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBxJMaefAWpKgwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:21:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3E150AC8E
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305901.1578012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMMp9-0004ld-7u; Mon, 11 May 2026 09:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305901.1578012; Mon, 11 May 2026 09:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMMp9-0004jY-58; Mon, 11 May 2026 09:21:15 +0000
Received: by outflank-mailman (input) for mailman id 1305901;
 Mon, 11 May 2026 09:21:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMMp7-0004jS-T2
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 09:21:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMMp7-00EFS9-9N
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 11:21:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a019f82-5cb7-0a2a0a5109dd-0a2a4504ecd6-40
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:21:13 +0200
Received: from [52.101.52.44]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a019f87-1dec-0a2a45040019-3465342c6ff1-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:21:12 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV8PR03MB8161.namprd03.prod.outlook.com (2603:10b6:408:297::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 09:21:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:21:09 +0000
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
 b=v8Ocid7ypBnWa+O+UPXzNGn3LRSuK0EXr+kw1Mbv9wF5PSV8JELmT6VwIMCN7WgjFfam74QN0Fucc0P8wT2nno/oHvn1LH0d4UIT48VwEC1vboUG4owpqyFr2bPKShf5REVcxtAcZImeNiTAcecuSzeacJbQpaDFk9PUQnrykirR/RCdkyrsRh4+0fxZe/Qeer8ErW4yvbalNBsCkWsntTpQARl+Luv9mt7iyOFt0NXf62tOEPA8GDJeeNObqDHjnxS209Wwc+rMGLyyz0Rzmhz6+Hz21YogenobiQxIPaWWzxxYdP8RJ4cmsj+1HVkI0pHlaX7SSEJZUShNF1vh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO+ui3F99BmJf+gViCxM6DNbLt1cyr3cXtlyxcfuQgk=;
 b=W7VF5wZOpWX0jucHpAd/JRsWFfsYoEqKD+FGWUWrI9N7NJlF0CyVbkIPPZuM3yVnM3cGCTsG6DnKvSVp8hfy5OZtnsFefFt9gNgroEZIzxhImyJ79Xy/jQBKSxOAjII/b2cAGt0egAWKxH/BePEYGQ55gWUHDvPckNcxyY22GMPrKsZ3B0YUdgPtF/IpCV8de9ksLQwwvbtU+lAkRiOHmzVpuXxq5bCNr1YuKbRG02QJ8dobVknh03l0mO4x9Ma35xFIsH3oDuTs2qq8AMF2JZZjGz2wf1hIM3BhNwfXCEJRWgEhfiykqZbz1yCBd9eF3MiRgKy0qi8jkOkyesDcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO+ui3F99BmJf+gViCxM6DNbLt1cyr3cXtlyxcfuQgk=;
 b=DSnDd5jDX1jAuhiK8Tgc0r17gaeiWBts8ExF9hfj1Cuet//WNp6iSTMOA4tkFGW3Nl/nW9qzIUyPhLDyhd8R/V6s/WVwbkbtea599FDLpLt9191z7X7dL+wic4TLz3lUS1HN5+14fG5x0kaqAcnacdbqzKnWWTg9WOspakrGJF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d1037e15-cde7-40a1-9011-a02c23e870e8@citrix.com>
Date: Mon, 11 May 2026 10:21:06 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 4/5] CI: Add a Debian 13 (Trixie) arm64 container
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
 <20260508212907.1643761-5-andrew.cooper3@citrix.com>
 <249ca124-b144-4c50-a0fb-3c0e6db5a1ca@amd.com>
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
In-Reply-To: <249ca124-b144-4c50-a0fb-3c0e6db5a1ca@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0227.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV8PR03MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 5277e973-31f7-4e8b-0d55-08deaf3ea35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	SLI/Om9qoJTN/npyqYiPDV/R2bwAjHxDeL/U2pyaQnfZM/eZ7GPxoiwNiQH99xK0HFxArqoj/ySyRjGdCuJuRG1rUUjw9mm/8m5bX+Xo9lBhgcCe7nwUNdVWjh3n3KciQYtUK/7f3fDVtlvf5/uBUPEx7BgBEt0MZY+VV8VUAip3bD9u/TnjfYMLfC7YEv47k7/uoPinVqsa5pSGsxUQs0yP4V7gqjCBs5KH7FoYtuaG6GJWmqwl8utWozlJphvZeHCkhLudHHUmvELrs8WzXNxMJMkCDe7HPLUndWdjil7DC06MJ1T8+QJO67GeFEp44xh336zlo1166tgGGk0bqSM5BTWxI7lQrEnOTmcAxzy2UjbEvsKDWWIroG/mYAEutF93GinZIAbixxiv3Bu5pEX6kFtDckzrvGciVsQJme5rLBMO0zUkKrIHCX9GjYBfZqpNXm9f3atRqq5wlcw83kA7GP9ekx/oLmOg2+BUn8AUkSlLKE3Xqr4Axh857MWrnthzaav24G+2pjcJx8sNq/1nX2U1jUCWCNwuEvnenYxgvqG/1xndMf0nCvhbWhWo+SI35DyDOAhNMbG7uaC4pJB97FM6F3X1DTJsLVvnPfH0UrlRhea2mfmlaDkxgmP2eA9NCJZ5sTiwUHIfA/KCJ5oeU0HHzXsRizMMKqSNYTIYDoI99eyzJLU4gGp0Rde2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmtHenV1a2pBRDZsRG1tdTZiQmwwUVJHeFJETzhqUUV0ak1tWDNzYkRKQXI3?=
 =?utf-8?B?UUhvYVo2M3J6UjNwUlZtM0Y0ekNVOHVLNlFOaVNzT0pwTjEvc0pJUmEzWmo5?=
 =?utf-8?B?UUliVVZ0Z1RpdG9UTHkvSTR3NngyRk85SWtadVEvMTdqOXhYdU0wWUlUMTlJ?=
 =?utf-8?B?M1VhdlhFbXp2N1V3Tk9pWFRmRG9Pc3pMVXpUNVhYVVhxMFlRUHg4R1FkSk1Y?=
 =?utf-8?B?aWtHbE5xaEo0MklKQThVT0dHZ2JNL0lIbndjNTdoNXBITVBaU0ZES1orWElP?=
 =?utf-8?B?Ry9QU29RMVVBVWQ1cGZtblhUamRCME0vS2NRTlVEOUhmWi8wWFFUMU14QVlR?=
 =?utf-8?B?U0FTQUxYNUJxcnVrQWJtOE92NEZqbnhZSjVjZDd2WXdmTWFuclRET0VNb0Zy?=
 =?utf-8?B?ZEdBK0tKSnU0VThOZ2pXckEzeHpKaUlUamxhQ3pJK2FYTklsL0cvMGgzY3FW?=
 =?utf-8?B?Vk9MNjB6QUQ1WFJRZjNLdGdET2loeWI2QnZjWlAvYkhTNkIvdXpBazZUdmp0?=
 =?utf-8?B?NkxtQm1DakRwUUtUZjlKLzRiRjVpdUFzMmNRVktzZUpjV20wRUNBY3g4TVpm?=
 =?utf-8?B?OUJxSFhJaWNmM3hhb3hVRHNMODdwbzBSV2grMWl1YnpBTDZidnlOZmtOQVo4?=
 =?utf-8?B?Zy84V1A1T1JLcFllTDFxazNuN0ttZ3ZOKzV1OE9YNVNES000M0V3RnlaZ2E3?=
 =?utf-8?B?RFlqZDFucmFsQk1RUXhIR3lFRzd2Sk9TVjZjc1AyWE03VHd2eHdPTzBJdzVX?=
 =?utf-8?B?N3ZJd04yQTFOeWhpNW8weTRlYlJ2cXpxNldKTmFRTmQ4TTNxcitZNHA3Nkpp?=
 =?utf-8?B?VGtGSFFZdTJ5YUIwYWhqWGRQMmF5Um5WbG0wUnA0ZHV0RDRzZllOREtYRVNP?=
 =?utf-8?B?TmM2Q2RGOXBEdVB4VHlqYmprNDZab29XaVVoL0VQWEljT2pKRHpKTkhZQ2xy?=
 =?utf-8?B?WmI3YUZSc3V5SU5yWmtKRnRUMTMzMm1yd1N0dGhqbXA2TVFGVStXS2dMeEdy?=
 =?utf-8?B?TytIODNXakU2ZWsydUtaK2RZb0IvbmpzZUM4bGZ5L0ZLbnIrQTBPY3hWdGdL?=
 =?utf-8?B?ZXBBY3J3QVhTZ0NVL1kxWFR6ek8velJXLy9UNDdKaG5XU2pZZXBOQjBGRGdV?=
 =?utf-8?B?eHA4ZDVEK1VhSVo4cXFiVS9zZCtPSGsvekFRanJxVWNTSkZCN09HWjlrcHdM?=
 =?utf-8?B?VjduaUYydldBZW0vN1lGM3V5dmMvdDI2N2IraDJ0UThkTTFPK25NU05YNnFO?=
 =?utf-8?B?NUdHaWF1a0JoUUdHelhhd0FmVzM5RFZSYy9jMUlCMW91WmhrYUk1RDNVWWU0?=
 =?utf-8?B?Mzk1elpxc2JLRXh1UVoxOTZUMEczdHJLdGhzMVlrS3lwOHBvbzdVYWlYOTU4?=
 =?utf-8?B?MTErdk90cWh0N3FyMnY1emNBL1ExMktlYlh2TjZsV1dIV2VVRWd0b2M5Y1ZE?=
 =?utf-8?B?aldhRms3VTh0bS9KUjVHM2orUk1xalh2VHV0YVQ4TFYydGNLbXBBc294ZjhG?=
 =?utf-8?B?NlY5YUVVZzdrVHZEU01nM2YwOXFZaHBOak9ac0JLNTVvVlRZV0JrRG9ZNVlD?=
 =?utf-8?B?MEJreVcxYkZCVVRGdG91a3hBZDZKaE43dHlERGt0QkJUbjRvdDIxSHgwUTRy?=
 =?utf-8?B?VVhBK0hXZzlra25CWnZuVDg0Q1l1Q3hFSDdtMnVVdDFKOEVDTUwyY0VpaXRL?=
 =?utf-8?B?OTJtM0lSWkZLdGJmYVB6bFF1NVVLUGRoTEJXcVJURXZmSytxc0tqc0JwdFpL?=
 =?utf-8?B?UElLYk84SzRBTTNWajgrc1FTSy84RVBJb2Y4eUViOWZLNzR4UUkyNllUWWRy?=
 =?utf-8?B?dUdLYmp6M0FuZ3lsTjV1SkpoRmhBWEQvd0NrckVSbTl1SWFibDlzU0R6TGNw?=
 =?utf-8?B?N01GY21wb1BoNk9XaklFZm1sdUpreGV5VElJYnRVS1BGOUREZmpJTUdIenNw?=
 =?utf-8?B?cGpRTXFPcUZQRTJudWtpVmlnMGJpc3Z2bVFwTXVUTUJYSThRdHFLVHBuS1Bt?=
 =?utf-8?B?YUoyWEtFdUpYU3g2SlF3K3BydnFyb3N6MEdZYlZxenVQY3JKbE13SnZhSmZM?=
 =?utf-8?B?MFFWeTl4dGJzdXVwWVgyQ1dXelp0K0ZSUS9rYm1CckZ4bnRQaVFRN1VpYXo5?=
 =?utf-8?B?SldCS203dWhqNFJZS09GZjV3RjBIUFdYRisvbHVJSWlRMzh1R2pLMzNQQ1o1?=
 =?utf-8?B?YktwRlptL0ViOEcvZ05DWEVtV0wwU2d1L0xzemlzTm9VMGRLZTlMWWltTkE1?=
 =?utf-8?B?SXFrZjVJN0pSVHZOTllYdnZmRGlZazRTbUl1RzhhaHcrLzRzTHhWazJYZkM3?=
 =?utf-8?B?NHRFN0pQS3puQ0laYmRwbFh0Sy83UkU0cE1Xd1htZCtyU0J6UE5kRGptRDhM?=
 =?utf-8?Q?PmoYYWf5NGDck7vo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5277e973-31f7-4e8b-0d55-08deaf3ea35e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:21:09.7610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orkIGkU0gu5xexLRwo3IhTDTuaKMKq0cBR901OjC3G2TNb/KvYzDOxOMSY52br8jXi0AnLEblj3EqQ8jX7/uoNyPJ/zaqcv6X8fAH35i7vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8161
X-purgate-ID: tlsNG-ebf023/1778491272-40D743FF-BCB50EFE/10/63158204843
X-purgate-type: spam
X-purgate-size: 3751
X-Rspamd-Queue-Id: 1B3E150AC8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,xenproject.org:email,vates.tech:email,amd.com:email,cardoe.com:email,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:cardoe@cardoe.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 11/05/2026 7:29 am, Orzel, Michal wrote:
>
> On 08-May-26 23:29, Andrew Cooper wrote:
>> Exactly as per the Bookworm container, but additionally with the ipxe-qemu and
>> qemu-system-aarch64 packages.  These will be used to remove the export jobs.
>>
>> Switch qemu-arm{32,64} jobs to use this container.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Doug Goldstein <cardoe@cardoe.com>
>>
>> We should probably wire up some build tests too, but it's too late on a Friday
>> for me to be thinking about that for this posting.
>> ---
>>  automation/build/debian/13-arm64v8.dockerfile | 71 +++++++++++++++++++
>>  automation/gitlab-ci/test.yaml                |  4 +-
>>  automation/scripts/containerize               |  1 +
>>  3 files changed, 74 insertions(+), 2 deletions(-)
>>  create mode 100644 automation/build/debian/13-arm64v8.dockerfile
>>
>> diff --git a/automation/build/debian/13-arm64v8.dockerfile b/automation/build/debian/13-arm64v8.dockerfile
>> new file mode 100644
>> index 000000000000..b9062ee8b443
>> --- /dev/null
>> +++ b/automation/build/debian/13-arm64v8.dockerfile
>> @@ -0,0 +1,71 @@
>> +# syntax=docker/dockerfile:1
>> +FROM --platform=linux/arm64/v8 debian:trixie-slim
>> +LABEL maintainer.name="The Xen Project"
>> +LABEL maintainer.email="xen-devel@lists.xenproject.org"
>> +
>> +ENV DEBIAN_FRONTEND=noninteractive
>> +
>> +RUN <<EOF
>> +#!/bin/bash
>> +    set -eu
>> +
>> +    useradd --create-home user
>> +
>> +    apt-get update
>> +
>> +    DEPS=(
>> +        # Xen
>> +        bison
>> +        build-essential
>> +        checkpolicy
>> +        flex
>> +
>> +        # Tools (general)
>> +        ca-certificates
>> +        cpio
>> +        git-core
>> +        pkg-config
>> +        wget
>> +        # libxenguest dombuilder
>> +        libbz2-dev
>> +        liblzma-dev
>> +        liblzo2-dev
>> +        libzstd-dev
>> +        zlib1g-dev
>> +        # libacpi
>> +        acpica-tools
>> +        # libxl
>> +        libfdt-dev
>> +        libjson-c-dev
>> +        uuid-dev
>> +        # xentop
>> +        libncurses5-dev
>> +        # Python bindings
>> +        python3-dev
>> +        python3-setuptools
>> +        # Golang bindings
>> +        golang-go
>> +        # Ocaml bindings/oxenstored
>> +        ocaml-nox
>> +        ocaml-findlib
> Since this is a container used only for tests, why listing packages required for
> Xen and tools build?

I did leave a note about that.

>
>> +
>> +        # for test phase, qemu-* jobs
>> +        busybox-static
>> +        curl
>> +        device-tree-compiler
>> +        expect
>> +        file
>> +        ipxe-qemu
>> +        ovmf
>> +        qemu-system-aarch64
>> +        u-boot-qemu
>> +        u-boot-tools
> So after this change, even though you replace debian-12 with debian-13 for all
> the tests, the debian-12 still contains the unneeded packages (i.e. for a test
> phase that it no longer runs).

Yes.  I can't do this series bisectably without it.  Also, in the past
people have explicitly requested to be able to run the qemu smoke
testing from the build container, which is why it's like this and not split.

Honestly, I was hoping to leave the Trixie update to the ARM
maintainers, but despite the Bookworm QEMU (7.2) being newer than the
6.0 in the export jobs, it contains the SYSREG interception bugs which
prevents hiding ThumbEE from guests, and breaks all the arm32 testing
with a Linux dom0.

~Andrew

