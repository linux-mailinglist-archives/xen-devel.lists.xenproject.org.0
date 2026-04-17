Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EirEW1F4mlh4AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 16:36:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15D541C1E2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 16:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284460.1566242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDkIl-0002Sa-Q1; Fri, 17 Apr 2026 14:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284460.1566242; Fri, 17 Apr 2026 14:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDkIl-0002R1-N6; Fri, 17 Apr 2026 14:36:11 +0000
Received: by outflank-mailman (input) for mailman id 1284460;
 Fri, 17 Apr 2026 14:36:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wDkIk-0002Qv-6Q
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 14:36:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDkIj-00HCIv-JM
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 16:36:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e2454c-e002-0a2a0a5209dd-0a2a4506ddf0-34
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 16:36:09 +0200
Received: from [40.93.195.61]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e24557-7371-0a2a45060019-285dc33da1dc-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 16:36:09 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5699.namprd03.prod.outlook.com (2603:10b6:303:95::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 17 Apr
 2026 14:36:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 14:36:03 +0000
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
 b=EcgasZFgNDRVXKF9G9I9i8k/ZWOYY0bYyUm3RKFjHh2yKtQlwUxfBUpsrE85FlD+NC7htETrNN3Ch6u3z+GVL/cWvy2QsG3e8HtyCUVPXlHdZUxitO+geHFvw8bYraHLMpM6RZRfUJ/Z8yS2GS/YGcR+3tDc0lGOd6UJb214tRPXYLwv3T2ZrM4BgbkF35bpGwDd/UhvYd3OHuZ83mi3eIPChNVU1QXdQwaliTlmM4QsrNqLgQfss6LjrLTVpxVmSFxU4jO7EUn7qybQJrGVhlAsvzzemiET32nH7g36m5K8efd0ZVz52UgXxzWUcx21NlgHCTiyul7SrjmFo2KxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuJ4yHKeiOH+p8jGYtrbIAYmZekD/qNwRcomsQOQy00=;
 b=UgNB2Ts0xLi7XOsED+ZgpFYxWlOvXod8XCu6NwTI7a00oq+vDLQoh/EqQFSJgOUVZBQd+ud4MIhGcsjgQoCtl8vKNJd6pAW8sQ/dZqrjh9mFl46+1VmO9nGkE+BX3Cf6rGi3YBFSIaOXBkmf1QPXl+3ioyM8sads3hglkWmqa3B8XuZ7Otcji39h5PjS5hkSTpdTluC0irl5bdj6UM9RLSf2kZFdbq9JulW2/mB4HLV0N7jGaz5xQ97+atXuV6SAFu3uFzHMe5/Yj1G4qMsi8LlVO/KRlKbzwvhyVzWOlrEh43psoD301ZenP3MnUJRQb/QoPWGevreG/oWIcYccew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuJ4yHKeiOH+p8jGYtrbIAYmZekD/qNwRcomsQOQy00=;
 b=qvvplLwmfPh1emeObPebisgnNp+U28qaZQj0ci8/eITRj/Tgsx965Rx7lO4OJWDTdorANsCxA7sqYc2hydn2lTLfVu1WuTF7SrD2G1yOMX+fwUUZsZsZlAr8yL8HeYUfrYUNs4pRxfEEbcZ6znHauY2Hgln9S8Ao6wC8ODR9ijg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f385a4cc-f6c9-427a-97a7-f0cb72e5ea07@citrix.com>
Date: Fri, 17 Apr 2026 15:35:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/mkelf32: Actually pad load segment to 2 MiB boundary
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260417105425.1184232-1-ross.lagerwall@citrix.com>
 <a6b71c55-fce7-4995-b38b-83133d702bd5@citrix.com>
 <e12a3f73-6121-4152-8f54-5bed0f36d087@citrix.com>
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
In-Reply-To: <e12a3f73-6121-4152-8f54-5bed0f36d087@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5699:EE_
X-MS-Office365-Filtering-Correlation-Id: 2067b450-23a0-4ff5-d034-08de9c8ea6ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WJN8IAylozcjFZB8AZperBJTXMrrIXLCbub9DhrXRS4W8cmRNv7I0ovutFWdhsQWSqc/GeECruBLAN3LBP2ke7i0+DY8U/VUV10+jhyIoRJ38ROLk3LJgLwLfcbhNEZn5NBBvt7c6cP9ezoTmORmTcNPaoUc4k6TgWmrRsvx9knz0cSXXOVIFQPt0RhagxOurHZurFJvA7xWoBCzlL9jcUwq/8OuuHHXYRcdLQHIb0M9i+Zh6/OJPh3ntaSTdAGeKcj7mQKSk0VR0o/+1fo9lSTLdVzO4cxUvi0yZs/edFceglRmiWw21Fcsb80aKpIp0/oLiubWAA7jYozkU9ImyzECEmKSuhsx345dFRHXIGnjclO4Ryk5JhaDjsMR4iWwvGYho0+ebfJsnUlZpNZBphmWrA+gf0j5S1EXr6YBuhZixuBV/qtRUSLrSQGtflXlQflmPAx7sv1A6Ct4y6t9Tfd3JfYIMwGrl+MErd0iSsk+MhEsLDHBsvONfZlMWNnd43XxKZZBYZt8oWLUBGZylmfFHbUPa9hSWArswhuV5XWEn3H7KVE5rChav26xCq/m7fwGJTzVRB7somKaAVn0Q8t7vccUGOiyxZKyH4SIFS4o6baEfxSYwXNSvcF9pEpVK/BnfBzI9ehBOypKh9DMDHRo4hdTD3i5I+zjkTLDlUD1x7iEvqx3zUjDRpTR8+069WHXeK2DWtz1a2Hj3sbIy7IofxeAMjkAf7DECnIEhvI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVZneWszTHRmMXM1QmgyS1I4c3BScFRqWGxudmNQTVd6MEtQU1l3dnhQQUR3?=
 =?utf-8?B?OTRhcTh0UXJWbnhDOWVsbXdhNitYR29oQ0gwcmFHQ2ZVSjBiUkErZDFFWnRx?=
 =?utf-8?B?cS8rWGZ2WjkxUXNYUEVIZ0tOSVRRMU9VK2psaDdHdmt1b2FZQ2tmTi9EMFQ4?=
 =?utf-8?B?dWdVdExRYjRHQk1COEtsd2VEWmtSeXZ5L1RnU1AzNFNtaFJGeU9oSU1talBo?=
 =?utf-8?B?bHJhTGRPRXI1emp3a3VDUDRibXJadFlGNHZxQWdPMzBDTGl3bDMySlFIMU9h?=
 =?utf-8?B?U1krOVN1dk83ejIyVkoyTEo4dVVBRVpoRkkrY1g4SFhGR2o4OFk2L1MwUkQ0?=
 =?utf-8?B?WlArbVFVUW00RSszTzZkUVFLd1FZUjlQYU9DU1BnYk5uZEh0bjJtbWtrVzNl?=
 =?utf-8?B?R0lBdiszMmxlUWdPWmV3a2RpdUpXc2ZGOUE1UEk3ZjBMR0RudkRIMTlYbk1N?=
 =?utf-8?B?NGxTVDM3bmliTC9XbWpGTmRyYlhLYytBN0hXUFBkWGxqSGxrU2tSRWpUTmhE?=
 =?utf-8?B?S1Y5VktzK1NkU0FhVDJESE02Y2pFbTYwMUptZE9ZV2lzV0VIR24yUWN2TFd6?=
 =?utf-8?B?ZGRDSGxNblNxckFJbWRycWZ0TWtDUUFKbmVsek5aUGJ2NW5DamJCVVgrRm9t?=
 =?utf-8?B?TE85U1J1eUZvalVGaHg0Z0xzT1p3NjBUei9sVVYvYXRBbEpjMGkySHc1d0Q4?=
 =?utf-8?B?RjZNTURqcnhmVDZtUEdqdUluTGluZHRQc1UrZ25EM2tPRkNqYjBVdFNPb083?=
 =?utf-8?B?UHpTUUFXenZzQWZBZk9HU29oUnpCSWlyNUdza1lhWVRZaXo0eFRycG9UaE9K?=
 =?utf-8?B?ZVBQVWsrcEhNaVVVUGlXSkJYWEI5R2pKV2tiN1dGWTJPNEs1STVxRnQ0bHha?=
 =?utf-8?B?U2h5cEdiT1VVbVpKT1lYaVd4L3dDTUlGSmRNaDVDZG5QL3gvbTNLVCtXYTRJ?=
 =?utf-8?B?a2QzTC9zRkhZRi91QTcyaktWempheWk1R1NBdnVGZzBVRGR3eUVhTDRSTzVu?=
 =?utf-8?B?K1lyT0lxQlB1dWFyWnVXTGxDeVZZZWNRZUI1UkJwODM5eWJoV0tSZUVhYlFB?=
 =?utf-8?B?MHJYekJzUXFBWlNEZjJza1VoUUtJaHRwbHV5RXhrb3E5THlObHVWVG9JUW1W?=
 =?utf-8?B?MzZKYjkrUERnSFFwMFYvNDZSS2tLUU9FdllyS3RmZVZabGpvK2t2eVY5dWJS?=
 =?utf-8?B?aUQzY3JQTFFCNVV5L2dqbm1PeU9JTW8xaUtJa0tsZUkzcDZkWE1MUWVLMGh2?=
 =?utf-8?B?UWVhbnZDQmlaZGh4U0RBMy9FNWRGbXJBOUp5VW9tM1k3aTNGN1huRHp1NGtR?=
 =?utf-8?B?OHFzc1RKSzZDZ1ZxTjZ4QnNZcS9lRm0yYnE1dzRzZU5xU2E1TDlZdHptNnA4?=
 =?utf-8?B?RmtTcjFqU0JUR1Zmbm9ZaFhyUk9YeXpJcVFTMjlhd3dISDNRTzJVODJmM1k4?=
 =?utf-8?B?MGppdzJHbnlkQ1E2QUtPem01MUN6UHlXWGJaZjdGNWRnUDZ4ZVp2dkJpTU5x?=
 =?utf-8?B?aHRiQzBsWGZKOTZMYTBKcnkyeXpSVjJSNzZ3K0piWXBWeWxkUmtyV1pVQnJG?=
 =?utf-8?B?WCt6cVAzdnA1RzBadlNVWW5UdW9BNW14bHZKTEFzbWJJdnFVcDJIZmMycFVB?=
 =?utf-8?B?NVN6b3F6bHNpbnBUVm9mSkYyZXZNamtEQW1LWW5KSTQ2aVFYT2FJZ0RrNUU1?=
 =?utf-8?B?NEZmeDhEanBqSUxJMUNVeks5L2UvWWtXZlZmNlBHaGRubGRkUWwzakp2UHV2?=
 =?utf-8?B?V0pUQlVrNjVVSG4xVGY3dEM0S1RBMXBiSklSSnl4UUlmK3hRSGMzNUFpLzBY?=
 =?utf-8?B?d3c5T1cwWG9BS0NSZEtoNWpnbTBLWkNsOEQ4NW1aUVQxQWJualRrb04vV0RU?=
 =?utf-8?B?UHJmQUMrKzJybmFQdEVwaG9rS3ZYWkR2Rlhad3VOMGZMUE4xQU9BK25zbnJo?=
 =?utf-8?B?MkFvb0F3aHdJcXB6VS92ZU5OQThZdDZhMFJoQTN6R0EyY0FZR0hLRTFOMERl?=
 =?utf-8?B?di9nUm5qUXBZNUE4c09XRjdPY0FOSDBvYXZnRzYxNTZSTEhTT0pTWjErQSs5?=
 =?utf-8?B?U1p5UFJsSnk1RFVZMGIremFJVVZ0Z1J4UmpWYkg0Q1Qzc0xMUjVxS29BMFFI?=
 =?utf-8?B?cnA0OERWQ0toUmNrN3VOR0J5ZUVLdE12b05VU1JVWCtCYnRaZFVCL2lrSEE2?=
 =?utf-8?B?TnVQOFdmWGUxTFhNNjR6ZHJ3V3l3cVZnUXhpTjNsS0VtQkRMRUVkNG9IRCtC?=
 =?utf-8?B?ZHpSN05hcDg4SG94N2hJREhPRkNiVXNHUHpxUDFTWlFQT1hicFJwSFRsdFJs?=
 =?utf-8?B?SlBvQ3lFNzlYaHVIcFJQR0pnY0d0cGxzL1pPbFRSMHJ3b3BKOVBkbk1NYTh2?=
 =?utf-8?Q?WXJ85qEMBBCQMEwA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2067b450-23a0-4ff5-d034-08de9c8ea6ca
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:36:03.2345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCwsYolyjoukCDnKFbDuy61vINPm8fDWjJT/V30bUXNNQEqccc5sVFfKckNi7VLkumFGTQ30Kmq7oktVsvBkO9BMb1OwyBAWmC9CBH6Wzjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5699
X-purgate-ID: tlsNG-16d1c6/1776436569-9087DD75-2E9D85A1/0/0
X-purgate-type: clean
X-purgate-size: 2779
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
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
X-Rspamd-Queue-Id: B15D541C1E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/04/2026 2:25 pm, Ross Lagerwall wrote:
> On 4/17/26 12:03 PM, Andrew Cooper wrote:
>> On 17/04/2026 11:54 am, Ross Lagerwall wrote:
>>> Fix the code which tries to pad the load segment to 2 MiB but only pads
>>> it to a 1 MiB boundary.
>>>
>>> This manifested itself as a page fault while scrubbing RAM during boot.
>>> Xen failed to mark its location as reserved in the E820 because the
>>> last
>>> 2 MiB superpage overlapped a reserved region which meant the memory was
>>> given to the allocator despite being RO.
>>
>> Do you have the relevant snippet of the E820?
>>
>> AIUI, you're saying that Xen was placed immediately below an E820
>> reserved region (a valid layout at 1M alignment), where said region was
>> inside the 2M-aligned boundary that Xen was expecting.
>>
>> But I don't quite follow what happened next.  Where does read-only-ness
>> come into it?
>>
>
> Relevant E820:
>
> (XEN) [00000063469ff02c]  [000000003f2df000, 000000003f31efff] (ACPI NVS)
> (XEN) [00000063519dc9f2]  [000000003f31f000, 000000004cfebfff] (usable)
> (XEN) [000000635c504aff]  [000000004cfec000, 000000004d07bfff] (ACPI
> data)
> (XEN) [00000063677372dc]  [000000004d07c000, 000000004d09bfff] (ACPI NVS)
>
> With a load size of 0x900000 (padded to a 1 MiB boundary), Xen was
> placed at
> 4c600000-4cefffff.
>
> In __start_xen(), there is a call...
>
> reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
>
> ... which tries to reserve the region 4c600000-4cffffff (size 0x1000000),
> padded to a 2 MiB boundary since it is using superpages.
>
> reserve_e820_ram() doesn't reserve anything because the request
> doesn't fall
> within a single RAM region. Therefore, the pages get treated as normal
> RAM and
> will get scrubbed later. However, __start_xen() also calls
> modify_xen_mappings() to mark all of .text and .rodata as RO in the
> direct map
> so when it actually tries to scrub it it gets a page fault instead
> (which is I
> suppose slightly better than just zeroing Xen's .text).

Oh, well I'm glad that I fought to adjust the directmap perms.  This is
exactly the kind of thing I was looking to catch.

reserve_e820_ram() failing here is also catastrophic; the bootscrub can
be bypassed with a cmdline parameter.

Either way, can I suggest the following adjustment to the commit message:

This manifested itself as a page fault while scrubbing RAM during boot. 
Xen failed to mark itself as reserved in the E820 (due to spanning
multiple regions), but did restrict the permissions in the directmap. 
All of Xen is then handed to physical memory manager as available for
use, and scrubbing hit the directmap protections.

?

I can fix on commit if you're happy.

~Andrew

