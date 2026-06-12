Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h0b2GRLTK2osFwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 11:36:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AFD6785C4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 11:36:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=tDExEza1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336450.1598218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyJ6-0003zB-PP; Fri, 12 Jun 2026 09:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336450.1598218; Fri, 12 Jun 2026 09:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyJ6-0003wb-M1; Fri, 12 Jun 2026 09:36:08 +0000
Received: by outflank-mailman (input) for mailman id 1336450;
 Fri, 12 Jun 2026 09:36:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wXyJ5-0003wV-Fn
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 09:36:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyJ4-009Ktu-Qm
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 11:36:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2bd302-bab6-0a2a0a5309dd-0a2a45028b98-26
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 11:36:06 +0200
Received: from [40.93.198.10]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2bd305-af86-0a2a45020019-285dc60a9bb5-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 11:36:06 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DM6PR03MB5241.namprd03.prod.outlook.com (2603:10b6:5:24c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 09:36:03 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0092.016; Fri, 12 Jun 2026
 09:36:02 +0000
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
 b=AvrTplLYocTb12Qqpdr+dDwD8cNHJ/iO4kmizhCXeLkXbaZmCBrtVnV5PKH048veDyAVOW+5fs6lfc6xHlQzvsPTduSt46fw4A9i2U8lZykydxoEfZ1Z8WYCFWCLh4Y+yrlH7/CpU1h7OlIV/zNyiGIVIyKKXS52EqTLunOBWEFzxhq6Vtul4RClfmBsUCw4NOl59HwBC2RKr4nnonqETAkXRsqJdlxr+LS4HyD7QrpjYOFCkPYFtK+SOlK0IxCyQ4ofjFRXj3PZHACMLkQpgl4kdnQ0alUEMOwr+F2O5lkrnQJ6UKY8ISx6pTyP37cfq2VkZCL44v69c3TbGb3xGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6plNHbp/4V80zruSMvz+0hbO6RpClWaUheiFlHBQEs=;
 b=I6QDWHQdz/zGK3XfzON2gqIE7jFsy4rgwD1e8HOORnkDAZKc4WNd5YVHdDYtnlCKjoLq1lgdcfzc+xX9dvadZX1XCFzDJ0gDxkwrBD3yaFMHugTMONhnUXLP2QetltJEwt2fftFBUqhJTTBX8GX69XzYLz9VbZ9snMgmTqmvlsjBq474l3hKi/SIqc5hxtTU6bKMqN83fuDMWIesZMeaPHooT6XNXqMmRUHIpOVUV6HT5Mgg8elYqLafmSQwcCz0EWEgk2w0pyCCgEEERwMSH+6cQnZGXknZcldIG/q3wLOxRXxQSjdbiiVt30jjiSPdwFwI9Nx/u+h/tyxeD56Cbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6plNHbp/4V80zruSMvz+0hbO6RpClWaUheiFlHBQEs=;
 b=tDExEza17b5GPAvabybZyTCP6T7IdBbm9EwS+ubv1gg9yKOOsCG8uFdvUcg4Tqlix3hNwnxCON3GTcsx1uale0BufHPJmvQDk6gGxAcDGoEE40wbq0zgVtT5stilLlEjxn7DZOOipj1TdCschuqFaYuZLj++kCj7kAz6rmrhpQs=
Message-ID: <cda71bb2-9318-4a63-ac0b-95b88e6c5660@citrix.com>
Date: Fri, 12 Jun 2026 10:35:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleskii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 v3] xen/x86: Change stub page allocation/free
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260612082213.82235-1-roger.pau@citrix.com>
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
In-Reply-To: <20260612082213.82235-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::6) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DM6PR03MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc062ac-3fa3-4b06-2bf7-08dec86604c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	PH+ouVLxxdR72jq85zSbHMXOsesJuOozcyEisdIOVvkf4ka/5HEweUYCY6Z2/ic1QRLO8qEDlj0isWyTN0wcORlknYQYMMP9vb3FaELOlAvqGk8G2UqxZacx5f+T2hq5B/qvbS6ihP5zwrI/AFIq+pLEssjIsCwG3uO5dQ63nrbqE5VzgK61Zir0uHU21qWgsbWwwj9JPG7wlrrCAgGpjnH4/PbM9CnbcjQ5GStbsnXicCqaYCfcwdvUfd5JYfMfBXhO83mZvqr7gLoccwD44MYq/ofGmix+IWKLx9OruBTW/Q84x95VJNfecYqfq4hTxW82gzBoRRI3UPp/LzBop+KvdCPB7hE4/eiNA5XF9NWKX/zJeWRYsf6JdZ+TnGny+b3/f8OSyeVzvWKUJqgHTNr54T3bW34dXz4jhY/OtlBE2HvNAUYFwHV+9IKGVshOJHyWI2kqRRO1IZi8LiGXRlbeT4oybdf0Kevvo3sLrzPBvA1cFcDB7uDjEZZ4T+3+Odhzw4VonB9pMU/fdoCFWSq2sZ4eOYcTtxJ4yQ4oxD3bXyY+3oIFW4xWJX42hJAhLKFa8jc7lat8Z7v2uG7bWKZ+JOTx3zlwiCz6A6vdzRcuB6IrlKMSCWoKk+IIeXr0lHhHld4TDfNxF29uh7WG/BIIPhvpBFzbTh/crVN0aOyhUmLcsa0J3oCt/1u5GP+q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDl3SHREYXVURUExTm9vTWJWRDZGYXVRVnJWTmhpUFhCRWpGeU5TKzBORnBC?=
 =?utf-8?B?RHdKNUt0Vy8vOGJLTCtOdUoyWjdSUTlBcGI1bmI1eWhqTjJGekRWaFY2NjZ0?=
 =?utf-8?B?L0RLc2h0bGZESGN0clAxR0RmWGlqcW9Lenhkd3FuL1dZQ3M2eVFJcUFySW9m?=
 =?utf-8?B?TFZ5dThDUDQxUkRtM1ZGK25VajhPdXpETTQxUGZFVDMxZllIejdHcUI5QU9p?=
 =?utf-8?B?alJwS2tLa0xmM2VBbzdYczVzVVdRaTlZQ09iaDBQTXgyblg2UFBRYXVIYi9p?=
 =?utf-8?B?azF3QUI0bTUycThPU3NpTXIxQlVCM0RNalVNY1RQbU1BYmdjMG9PUDdwSHZj?=
 =?utf-8?B?Y3hGS2M4cHp5SUZlaDJnbDBTUUZpS3hoMjEySHZxNVQ1bWVHOWpkREw1SUxm?=
 =?utf-8?B?T2hIR0s1cXhsQk53MWZnVy93ZjlzOUg4QStvdUI5SWtxWk9sSmtLeXBnS3RY?=
 =?utf-8?B?SVZJc1dxc00wb3licCtoeXA0ZVZUL2EzUkRqQnVYZ2kxL0haMklUYm83SWdZ?=
 =?utf-8?B?U0s4dTlFSHpHNjhyRXdXYTN5eHE5SHNidm9Lc2pBdmNzODlWbW91NHNqZTV3?=
 =?utf-8?B?M054R1JidTZOMVdmNG5RdEJ2SmJLbEhlOXJwdThYL1ppNXlQQ3ArWTFodk5B?=
 =?utf-8?B?akhIa1BJeXZHYTRyWDI4eFpHVkVScmFCNVc2dmZXRHE2Nko3bld5NXkzTm83?=
 =?utf-8?B?UTRmY090YWdzUEYyUVphTGNWQ2NNMjBqNDZKd2JvMXl4WXZpVUszbDVPTS9E?=
 =?utf-8?B?Ykd1UGJlMkR0NzVscDhlcGVTZ1Fqajk5ME9ublFFaWNiMnQ1dFd0eHduYzl1?=
 =?utf-8?B?dlZLdTVFQjVySHFaOVFVZUtVcm9MSm9kKzJneEQ4VEd3cTBvM2ZIWVZCRlFN?=
 =?utf-8?B?Zjd0L3ZyVkZKTzhMeWxCd2MxRWRrRUM2MEdtRTh0SXpiMTNFc25lYXRpTXN2?=
 =?utf-8?B?SlpHNnpBK28wL3NHSlJnMHlFZ2k2U3laT0xhL2lrVXBBNkMwV2lsSmdTNWZr?=
 =?utf-8?B?Rm1mak9TdytHN0FxSkgxc3c3UGozdUdXczFEdUpEbkIrWmN0MzdvbTY1OThO?=
 =?utf-8?B?NkFmREt3cmpCbG9STjFudXNseDlRdVByWnFHdkxHVzhlSDhQNEdrSGdiQ25s?=
 =?utf-8?B?V0l3MFM2cy9Bb0VNTUdHejdGTWdZVDEzaFRPS05EWit3cUloaXkvVHJsMFVE?=
 =?utf-8?B?b2I3VkNmcllQTlEzSkMvd2ZidUdGa2VpWHRMWENWb3lXSzRmamdBSFJOS3B1?=
 =?utf-8?B?MjRNY01menFZRHd2NDNCSDRxdnNkMGo5WSswd0lCYlNEOXc4YmVTZENJMkdX?=
 =?utf-8?B?VWhyQXNtNnNrYUlMRGtabnoyU01YOWhUN1FsNUQ4eHZ3dXYvcVNuL1ZTL0th?=
 =?utf-8?B?Qit4czZIMkZ6cGdkdkdvV0RrUnF0VzhtakMzZHg3aDluRGxtMGxyRS9YazFH?=
 =?utf-8?B?cUVwWElxZS9lRXAvUzFoQUpodVo0OWU5N3NFK0xGNk9hVUZDWVcvUDdON0My?=
 =?utf-8?B?WDdjcEJiVjB2MzRWdEJ2eVl3NzBTenVVSFdmWEp2SkN6dHA5b1hUTzFSeWhu?=
 =?utf-8?B?dE00a2F2NWh3VG1hZmlidUJTYUhkMXV2OE90Vkh4cjU1Rlh1WklYQW5PYWsz?=
 =?utf-8?B?aVZLbzNuM09mQzBUZTBkQm1SWHdHdjFMNGxlQWRYVWdyMUV3dGpKWTYraWg4?=
 =?utf-8?B?aERDUDZQSEg2bllIbzNiRmY2LytiWXlsaFN6MVJMMEFQRDlxMGFYR2RXSnRR?=
 =?utf-8?B?TlYrSUM4ekZneHFEUDdaQkRlUUhIYnJVWGZIMGp5bDIvd3MyMUNPUGpNdWF5?=
 =?utf-8?B?RWZXemtpSVQybXEzQldhMjYxYWhqT0pKdVRaNDkzUHprR2NHcCtkUVJKUDZw?=
 =?utf-8?B?cUcyM1g0NDRIR0owV3BjRjlGV3JlN1lTWFVGVGJ3bU1DME5DWjV4VE9ZV05l?=
 =?utf-8?B?eXJpK21qM2Izdmp3SU1nOGxGMFVxK0Z3a25NNmlNQU55M1A0ZkFJMGpVaE0z?=
 =?utf-8?B?LzJCZWZUdWdZK3ZVaWY0M3pzejFXZWwzc3J6bG5sYWJWc2xEVm81UFVUY3ZP?=
 =?utf-8?B?Qmh3Y1ZQNjZwNHovSXlYNUNrRzUxM1JmYlBaakJNd3RIaGFDL01TZ0tFWklm?=
 =?utf-8?B?NTBTUzFiZXZXaDZoUW13VEpiamJaMWVhL3ZwVytLcUNmbGpQTVdzVDZhRVF6?=
 =?utf-8?B?cU1yMnRNbXdYT3RMWFdJc1IzY3JOZTYvb0hhSUUxQzZRNzRZNTVDNGpKMmRZ?=
 =?utf-8?B?MWZSWWl2K2pIdlRyQkdYWEoyNlEvdDJDVlAvT0huU3U2NXpYNDArVGtQcXdv?=
 =?utf-8?B?T05EalJHUUNpVllMaXlNRGFhZXE2QUVhNTRRNGpLdk9Zb1NUb3I4RXRFY0g4?=
 =?utf-8?Q?wCFJ5qpOrF8f4tG0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc062ac-3fa3-4b06-2bf7-08dec86604c5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 09:36:02.6363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrG140c0NgbloE0dpTDISVuKiC2OeFBdB4d0ZM6kjdP5i6e7nOcD+fgczkSFZrCutS/vZLCreJ7eLXA+eaYZQDttDUyBJ8DzTRJLWgEHmEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5241
X-purgate-ID: tlsNG-720697/1781256966-81772161-E2A07404/0/0
X-purgate-type: clean
X-purgate-size: 1340
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,amd.com,suse.com,vates.tech];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:oleskii.kurochko@gmail.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,m:oleskiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5AFD6785C4

On 12/06/2026 9:22 am, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 4192edf635b6..0253d22c349d 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2089,9 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
>  
>      init_idle_domain();
>  
> -    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
> -                                           &this_cpu(stubs).mfn);
> -    BUG_ON(!this_cpu(stubs.addr));
> +    init_stub();

While I hate to nitpick further, "stubs".  There are 4 per CPU, and I'm
reasonably sure we're consistently plural elsewhere.

Otherwise (and with Jan's grammar note in the commit message too),
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

One further thought, which would be for a followup patch if we decide to
do it.

We do now use UDB for bugframes.  It's also marginally better than INT3
because if we do ever end up finding ourselves executing it, because
we'll #UD on the first one, rather than try to brute force our way
through the #BPs printing a log message per instruction.

One thing I didn't check and I really need to is whether UDB has the
same speculation-halting properties that UD2 has.  It's not a guarantee,
given that the encoding is valid in other modes.

~Andrew

