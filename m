Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBPWOWyn+WnF+gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 10:16:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D86D4C8847
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 10:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300301.1574826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKAx1-0006Kf-EN; Tue, 05 May 2026 08:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300301.1574826; Tue, 05 May 2026 08:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKAx1-0006JE-Al; Tue, 05 May 2026 08:16:19 +0000
Received: by outflank-mailman (input) for mailman id 1300301;
 Tue, 05 May 2026 08:16:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wKAwz-0006J8-QO
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 08:16:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKAwx-002cXv-4I
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:16:16 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f9a749-5cb7-0a2a0a5109dd-0a2a450bd27c-36
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:16:16 +0200
Received: from [52.101.43.46]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69f9a74d-212f-0a2a450b0019-34652b2ede37-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:16:16 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7995.namprd03.prod.outlook.com (2603:10b6:a03:5b5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 08:16:10 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:16:10 +0000
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
 b=i71HiaoN8VtOpk1MkvSEMJusXa1eTXg/oFT8fKLOpkuVw/cF0MgmurqIceI+pilr81+sJk2Jhy46B0vFXqZ4nb/P96Wxy7upy7dIGnebhgg2OeAG1cGJQjIhCXXEv4saN9zTt8t4fYHcOaNWfvIZ2ma53nEaHqwcyaW9c4adqImmY69/9X+7YPUjpGm5lrl1V7gyzVa0ZpV9X1+LUvmwrYE7JoataI4g3+tKQLvKMUfljoltNEtKXwINyhZKUF9+5ne+67RQ3X1xFI2ta6fmd46mq2wKwMwcfWiG32Ju4BXMqzswL1W35bvJS9AwKdJlExdDRie78vTuNLkUjh4j7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07Wv5Bmst8cKRp/HkDBPbJSksEA0V9WFSAavQ8B7/kc=;
 b=sH/evFpJmvRWZ6jYIXtOGcPVQhkm+R8eV26zVlA1tRpPYyoVfKR1wKYgZhhJH84fe3mnqtGF1JqlUDvBR/YWzI3UDqNZ2SF+ZHUsFMLynYaq3qr4v2baurK5XWf9bTheYHbuxQt7PF3OhFlPNZw2CarkgvlU0/O1fP0auCg/4kgjSTkEaUxgu3qq2Dqz5zzzYfk744Wzun4bWZUPNmxeNaKV1jVJ9irGstR8+PoCgvKqtzRlDKEXbholSxdysVUOXbNpgzx33sNICT4jaTEhc1eTa9vxtvBys12xKAovZAR4VGC4bZnciD5/S/3IW016vwU9u03ZVgQ3eoKHVAODdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07Wv5Bmst8cKRp/HkDBPbJSksEA0V9WFSAavQ8B7/kc=;
 b=VMZs6SEpy0neI9+zM4u6hTxQ3o017kGESt5IVsfbPRz186bl4xKU8mBPl36bkwbw7Q3THWZ7YvwuS1K/tD/0JiZxCmzS9huYbV5dC1a0tpyevrN9Bkei5Z8dcmyjeNc+WnpihzXxh9FA5+/Lkhcr1TSpAXIuzwM4BTkBrv31jv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b15ac2b5-7468-4e73-bf9d-c8121033691c@citrix.com>
Date: Tue, 5 May 2026 09:16:06 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/boot: Disable interrupts when establishing SSP
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20260501191028.1250225-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260501191028.1250225-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36d::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: adc82a79-1377-488b-c869-08deaa7e906a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MwXZP2HXi1udahIJ1OVb2l6e4FJjCULdFVYtcDLSTUCeRnZqKBCf/p3ZU3YIFZ+SEr+cQju6XnCysQa6N3ci3lTMZz9qHYQAd2Uj/q5YxfyH/1P7N0670kSRMOMOAEJwoy4E4F5BTsati1/zqfVKSIsADtrwPmik/cZb0yqjjOooWYIrql8KP7q9YFAnCVMIhxEapFDhottc8YmW1MMEedzDYbRjz+jYFikN0m+UsoTu3kkRutzicdqNHiIqQ+StRIBOW0Aour9OYw3u65CXn/G0GKoLNBxK0eiZf8MWE6YS13dN4BTc1vo4qatQOmP2ZBzIj3bGdQkY7h59Dr7oBrTyFuiNaO+ds3lA61mw50SfVPO7gk7YjaVkaolSPkgJNNBJNjVPDLJjPMYNlvoX0/U3NTCBFB1Uz+8DdKmjXggZCEVTFtAGj4IYQM0dvUhLsTmVU5oP0P0xfckrH9lOVhAeGEpzbyUVuSAM6xx11HlGGuyxo8JMX/JagrFcFJELJV0DMiF6st4Qm5jAIuer4l2w3UJeSBsIRFyccJH8kMSHpJ5FXgWHJBO20OA8V7s11XZT5Mi8JM7p/2dAG16lMftVL4SetHT9FjCr6hf+Wb4JtrDVlHd/af+/313gwtxu+oag/IqjblPFY2t0zGvuc3JceENkQJPFK3hvBlG9MkOcOBAlvHPjN4crLzAjBds2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c295TGZDMldibU04VTNkZElxZHpURkdGTk5IaitTVVUxbHN0amUxdGdZUGFv?=
 =?utf-8?B?VW9rVlQvSll5YkJSSmc4My9aNkdScnJHMVNKcFhRbE5KTlY4eUpKaURLdFBm?=
 =?utf-8?B?OXh6VlEzWlpGeDMvMDBxZER6MTBPTHV0MXlMZTQ0UW95QnI3MGdhdnFGdExm?=
 =?utf-8?B?bmIrVXlJV3EwL1BVVHg1Skkyb20xSGRwaVRTMWdQcGFEbDcyVUlQYk5YNnVR?=
 =?utf-8?B?UXZqOHR2TlF1WTNodzFFYlF5ZlV6L09MenNPWTFMNlpMejNCL0ZJY3AzZ0FW?=
 =?utf-8?B?VlFXU0pKSmljOExYSGh5ZzJDaHpLaGxacmZFbTZlWDJPMVBEajVDNGlEMm5O?=
 =?utf-8?B?T255bUYvUm8wKzdaUGdEYTZLVllDNzZJdnhyYTNMVjB6VDA5MlNuZTRjRUpu?=
 =?utf-8?B?UXNvQXJYNUJlUTBGZzdqV2QzYXVHV0hKRVl4aFY0NWFDMFllOTd2UVZLWTl2?=
 =?utf-8?B?cDFXSGZxV0tad24zNUdFU2VxbmFrTDl1UG1jb3hKSzliTUlUa0dKZDdIYzRu?=
 =?utf-8?B?OFErdEp2c0ZzS2pMQko2YS9KeGhod3hrNUdkeityZFUzblVUSUwrWFM2SzJl?=
 =?utf-8?B?WTF0d0dSWGIwS1MzbG1DN09VZVhjNy9WTWllQVJ6TE5UM0VTeTJlM2dub2Fh?=
 =?utf-8?B?RG1MQkVvYjZJYWlVS1ZKWVh4OXVxc25xY1l0S3J1TTRQSUZVR1RTVFJNeTdr?=
 =?utf-8?B?QVhkbFd3bEhDbW5TTG81ZktLYW5EbEVLLzkyY2VCYkFlVXpZOENRRGYvSFJJ?=
 =?utf-8?B?bjNLbTlsbG0vZHRDbHRlazNpYSs4bEF3b0crdGFlejhkUGVBMVh2SXB1Ync1?=
 =?utf-8?B?YTNRaURLWXBpODEwbVZyUnk1MWdOeEZoYlhZdlpJYlB3czE4a0FoL1hVcko5?=
 =?utf-8?B?Ri9md1A3VngyQkdGZE9wODlJL0U2WjF6UW02SmZlUjFVY1N4ZXVDWG1Ibzhu?=
 =?utf-8?B?bFNDaUZSNGh3UWQxa1NZRGMyWURBUmg3dnU3T3A2cTVoU2VxeDUxTG1oQlcz?=
 =?utf-8?B?cjI0UnhYNHAwUzhUdjNkV1l0Y0xETFRKdEQ1Z0tLOWp6REoxRkpodHE4cFNX?=
 =?utf-8?B?UEQ2T3hwZHNjL2NWMmpyMEVkUHR3NG8xTGlhWno0eUtKTWh1bWp1cDN4N3dK?=
 =?utf-8?B?aDdKcmdZKzBOMHk0YjZmeGlvaTduNWpKRWpuc1lTSlVZNjh3KzFXRER2VmpX?=
 =?utf-8?B?blBWWFdhRGhzRjR0L0VJNko1aGFXY21BaFZVektqZ04yR0tkVGZscTJZR0ZH?=
 =?utf-8?B?SlpYaFBDYnNySHJWNCsvU0QxN1N6VHJ2SUMzclYzcTBSbG5heExDNVNXbk1p?=
 =?utf-8?B?d3ZMYXUrWGZKTUxwcXF3QU1yQzJyZlVVRUlCci91NVpmcHJ0RXN1VnRSbXdT?=
 =?utf-8?B?RVpFMUhEaWh5YzNQOVhOeCtzSC92NGJJYlFKQnNtakxTTmpHbUtFbWtobVBo?=
 =?utf-8?B?dXFFS2lQWWE3eExZa1E2NU5NeWF0L2RqVnhSMHpUZjhSRjgyMEs4SHVkR015?=
 =?utf-8?B?QW9BdlNHZ21aTXFOUHljSTJPaTBsVHJBSGpzYi9zRXhTRHNHcWE1TG5xR3Ru?=
 =?utf-8?B?cnZpMTJpZWZUVnhCeE9EVGU4aFRUV2czY3djSVg4QWNPUzVpSGJBb3NxelZN?=
 =?utf-8?B?ejROUUxSMndNTlkyMytxa0grS2dzNEVYMzFybTVCK3JVN3FuWndwdlZsb0hm?=
 =?utf-8?B?SzJpMUszTERZSnFBNVFrL2d6aXBhNk5Gc1hHS0gvQzVkT2Rwb0Via2I4K25K?=
 =?utf-8?B?MU5lQkplSjZXb01tWG9FNnMxVzhjU1N5SHNLVG96Ulc2N3F4cEZDMTBYbjEr?=
 =?utf-8?B?MmZOUi92aFU1elREdVhTU1FpNVJ0d3YvUkVkb3JGN2FPS0V3ZExkYzduU3U4?=
 =?utf-8?B?SThFUWRvTTNhVFluQWR4TlJ1eStrbWtTbWtueHN4YWxnOCtHeW1ZN09ZV1Iz?=
 =?utf-8?B?eXNwWEZHYUp2bnpPL0cvWWxRQ28weDFSRFZGb2VLMnFqSkNDUlB3d2hONTVD?=
 =?utf-8?B?MjVUQzFzNXc0c3l0MjNjM0hnbDF2UkZiTVNYajQwOVFZRFQrYldRd3daZkhx?=
 =?utf-8?B?bGV3bzNvVjByc3FrZEVzV1hsVnF2K1VSa3Y2UEFSbXhZdHVBNXFleG9tQURB?=
 =?utf-8?B?TjRtaytaN0NqMS90ZGFXWFNEMUZDRWc5ejRMVm81aVJFQWg4dXdXUm5iMkg3?=
 =?utf-8?B?Q0tvdk1UZ296SVhOamRNU2FXRStHNU1FZjRGV0NRcisxZ3VhUGhZV1VJb0hT?=
 =?utf-8?B?c3dFeHl0dlQ2SnNkV0pNWE8vb3JtcW5PczJwNFF5cjhWWVQ2MTFrSzJnSGFl?=
 =?utf-8?B?NXhEbjlRRml2UWM2SWNCQVkzYkRxcEFBOSs3ZFBzbGVtWWJMamJpcFdURGRB?=
 =?utf-8?Q?YxXDjCZ5ezpqAqgU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc82a79-1377-488b-c869-08deaa7e906a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:16:10.0564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlVPQjzsz2ueYVc+SNBH6/aiXS11YeAB92Mhb+SHtgZ8mHPMR3TnMwn0D0Pt7BjOMxAknxqhRHx4aDyvFoLWgk5fczmsYji6y3OLHj7Rglc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7995
X-purgate-ID: tlsNG-42698a/1777968976-24AB5F3B-6C08E82B/0/0
X-purgate-type: clean
X-purgate-size: 2261
X-Rspamd-Queue-Id: 2D86D4C8847
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 01/05/2026 8:10 pm, Andrew Cooper wrote:
> Gitlab CI reported a crash on boot on Alder Lake hardware.  The bug is years
> old, making it an incredibly rare occurance:
>
>   (XEN) *** DOUBLE FAULT ***
>   (XEN) ----[ Xen-4.22-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
>   (XEN) CPU:    0
>   (XEN) RIP:    e008:[<ffff82d04077bbc4>] arch/x86/setup.c#reinit_bsp_stack+0xfa/0x160
>   (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
>   (XEN) rax: 0000000000000007   rbx: ffff83049a4b0000   rcx: 00000000000006a2
>   (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 0000000000000000
>   (XEN) rbp: ffff83049a4b7f00   rsp: ffff83049a4b7ef8   r8:  ffff830497e47000
>   (XEN) r9:  00000000ffffffff   r10: 00000000900c2121   r11: 000000009a392956
>   (XEN) r12: ffff830497e47000   r13: ffff830497e49f40   r14: 0000000000000000
>   (XEN) r15: ffff82d0407dad10   cr0: 0000000080050033   cr4: 0000000000f526e0
>   (XEN) cr3: 0000000043c16000   cr2: fffffffffffffffc
>   (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>   (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>   (XEN) Xen code around <ffff82d04077bbc4> (arch/x86/setup.c#reinit_bsp_stack+0xfa/0x160):
>   (XEN)  00 b9 a2 06 00 00 0f 30 <80> 3d 71 26 f1 ff 00 74 3e 48 8d 93 f8 5f 00 00
>   (XEN) Valid stack range: ffff83049a4b6000-ffff83049a4b8000, sp=ffff83049a4b7ef8, tss.rsp0=ffff83049a4b7fb0
>   (XEN) No stack overflow detected. Skipping stack trace.
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 0:
>   (XEN) DOUBLE FAULT -- system shutdown
>   (XEN) ****************************************
>
> This is on the instruction boundary after enabling CET (writing MSR_S_CET) and
> prior to establishing SSP.  Despite identifying this as a critical window
> where any fault was deadly (the CPU tries to push a shadow stack frame at 0,
> hence the CR2 value wrapping around to the top of the address space), I
> clearly forgot that this meant interrupts too, which are enabled.
>
> Along with regular interrupts, NMIs are a problem.

No they're not.

NMI (and #MC for that matter) are IST and will operate just fine like
the #DF handler did.

~Andrew

