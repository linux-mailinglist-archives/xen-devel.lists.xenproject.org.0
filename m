Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IISiIkykFWprWwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 15:46:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C87A95D6CD3
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 15:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319929.1587367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRs6c-0001w9-6m; Tue, 26 May 2026 13:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319929.1587367; Tue, 26 May 2026 13:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRs6c-0001ti-3y; Tue, 26 May 2026 13:46:02 +0000
Received: by outflank-mailman (input) for mailman id 1319929;
 Tue, 26 May 2026 13:46:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wRs6b-0001tc-3e
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 13:46:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRs6a-003vT2-Fc
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 15:46:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a15a411-5cb7-0a2a0a5109dd-0a2a4505ec6e-32
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 15:46:00 +0200
Received: from [52.101.201.44]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a15a416-aaa8-0a2a45050019-3465c92c39d8-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 15:45:59 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SN7PR03MB7183.namprd03.prod.outlook.com (2603:10b6:806:2e5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 13:45:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 13:45:55 +0000
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
 b=HSG4wzpzanmFR4Ivlv9DnZGwsjwCpTQkYFdHOjHVMF6LmvuEmW0g9ase8JWvIst0SUfSKIk3zvShwTY89Vht4UtZhD9lxkFbBJmgisrnpiezL3UJteXVF5Ld9b5KkqWoc0B958NfQcl6Z4ZLrdBLxrVZZQMyu/3PYjspsajxpXDAIp9ICh7k2WMNYSuBuCg1sMsHVozSJiEpQ2RYRR+4yX9Kjc6MhLXD/W5Jy8SocBcD3Q1Zy43waucGyEs8VJSfYiSCWe7oibFu4Ffw/ZuQ50QcHOxarI7SS+i4ix+M+xz//F06YzTM7l9cXCrRITrAljMo8dfrVq0Q+StOkrRZyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6pb6Nl65flvFCMi5auQ/aang4GVEaKv1uMhP8ELDz8=;
 b=FTdtt1IUAl2Oc557K6QpbAXayY7cdb/jK/JU2z4szcDkScl23hJlshDpZ9Wr5E6xFAvLSCZ/5DeKPu1+BY1b2hVbjkFdd9I8wBv9BBVtuLUfqmimNFMpjqBPXuz7B6pIxmpVRqy6cTfoY10nZftrAwklxy+iwagdTAqKgiKhL2v5UDvQGKo2qxztcjl/GCAZhrrA12+iEawNnX+UpvBqVcFq6/47VvL69pX2iTDoj7rYCQL/3xbI4x+QrjSkvm0ja8pjoavMAe4c6U8gqtGqBLmJMM28Ic/b0etpV8yJ338mhJg1RuDjs6k236Q9HvbBDPnd3SUhcqVZ8Zs2+QmsxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6pb6Nl65flvFCMi5auQ/aang4GVEaKv1uMhP8ELDz8=;
 b=DSGfy7/uM0USVxeuYXNv0r5YfFQ0qbVPUGCbQzNpknEPXrXiK49ybD9CkTlOU0Ary1ALzAuhh6LB6FtfPOJ8qfGLbFkve+QhkbwF7qseXGJWsSsKKLUAYPsWY3DtbvDORuDbPYCRIZekH5U7FqOvqFqeR4e7PemPVEGPmm3p82w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7f1ae134-7635-4533-a563-b61a508c893e@citrix.com>
Date: Tue, 26 May 2026 14:45:51 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v1 2/6] nestedsvm: Adjust L2's DR intercept when adjusting
 L1
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
 <20260526124027.573412-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260526124027.573412-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0232.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SN7PR03MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cfb194a-c6f2-499d-90e8-08debb2d1bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003|6133799003|11063799006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	W7ONb58/TBl4srB6ctDJmb0w5Ye9UfPMMHjIFO8D44g1vd1UQ8nzZ2c1GRjTa0/Jx1cSrl40heXPKJJk+LI8J3AAS443854ARW48SzndndWV9YPRUWNxInN97LAXW+sVLIn4o1UqaDcju4yPt1N9TJQU9oVIxk+hK+8iwpidaEwmM5eV7VXIuNN/4H3HHeQgcAvFdCfl2tyWfS35VZ6AOCerJ6LcYshjDRupQn/suCbTgo5zxXf5LuobWKxnzSjw0jE3Ahp1eq6qb4qNdwBiZi8mcTvCTRi+6d6WQC8m0IezN8oZVhXzPuqShcgFhkqqyHaDZ/1m8Go8UM9yiK2NIWj3N7cAyV2F7/z85sD7DjBW2jwVcKkY4RcrlTVInlT3puVB6eSiEQQenfan445kJooh11RvIfgXhfFLfWnz3coVvxE2L9llNyxDUjy4xl8qyUJ7cQl5nDaSR0KeWhrCXddSrmPLhB6HaPlgbIcVV1Gn9lWZy55I+hAVidQXf6T52RPK4G7APCOnBt7vsTkoJelrmtORN0KqJ6SBZARYLVog3GnS0xNesi7ulv0nZrelvQA8yfhwjsEZ/sRr/Spt2hWD3NHc+nyCxXlvIpR70mGYfpGqKSARVUXcWML2tXL8my5qlsRFq/c37onhzFsS460BJj7O6tY7hpZgrlVe2rJHIz50TG6xlhX90GsT+/Fd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003)(6133799003)(11063799006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDJYODBoNHo0RnBOVjRwaEZ6ZkdqUEVyZEduV3REL2VIc1JVTTNGOFJkdnpS?=
 =?utf-8?B?bExLUTdlMDFCU1o5TGJkdUl3WlVvWTBWTko1UVUrQUl1WGNqaGhHdXk1TkFC?=
 =?utf-8?B?NzJUd2hPUVE0K3BlZ2JmcFRQZnRWU1QxVndheklnQ3paaFhNZkRGc2w0bmN0?=
 =?utf-8?B?QU13SkROV2VEWGlaaS82Y25rcUNKbzFyb3djaXQzY29LclYxYzZrS2lyMDBo?=
 =?utf-8?B?TS91V1V2UDFVTjJoMEltOExncW1QWWEzblpRVnl5dFVTTzM4Rk44UW5QUEJj?=
 =?utf-8?B?ZUJBVjdnVW4vRVdUb0FQaHZiZlBWVGVsbzhqQThzZ2I1OE9zcTFEZTlmVVYw?=
 =?utf-8?B?d2ZFb1NVMXFXNW1LWXhqTFA5U1hKQ3huUDBsN20zOUd0Z1ZWTW5tbXNXT2Vp?=
 =?utf-8?B?SHU0ejZYYldMamNtQlQzTW54Z3FOdFJIN3E0bk4zMlRlVUhOamlEYnlFUWlr?=
 =?utf-8?B?Nll0aTNnUWlyc25ZV1VOTG5ocEhuMC82YjY5QlhJb2JmVFp4TVF5d1hVOEtG?=
 =?utf-8?B?WXFUM0h5RTZvVW5OY2lGRmhFS0xPbFE3VUlRVk1MRFBGS1JlWmozNVBpaXhB?=
 =?utf-8?B?dlFJWEZoWkdJZHMxTCs5NGFlR0ErNk16ZVBkdXZScGQzN2xqeityWGtZNHh2?=
 =?utf-8?B?ZG4rcW5ucTgxZ0R1cUdRWlNkc1g3bzF5NEszTHlMOUt0cmdxc2N3alRlMlR5?=
 =?utf-8?B?Ym1WWW1RbVpJNzlRNkpCUE8xYWhtcno2M2xpYkphWmJGNCt3d2l0cG9YTEJa?=
 =?utf-8?B?YmRmRHBVbk1DV2d1UVI3bDJNMW93Y2hxcWlJRnZFNzkxUnhuaEhuOFpod2ox?=
 =?utf-8?B?QWRhK0xHQ3F3anhndlc1T09ubytpQ0JNLzBFVWh4bmxjaU9kVUNGSldEaytv?=
 =?utf-8?B?S1ZyS0pGbDN0QXhQNFppd3BhbHAwMCt4RVNENXV6YlZxWVFiNDlzamNtMm5Q?=
 =?utf-8?B?d3l2VjMrb25iN0xWbDhDSlUyM3haS0RoSTl1N2hNd3VlcmQ5UmtCcHZuQnpi?=
 =?utf-8?B?eVk4ZVJENnpvQzE3cEhYZU8wYlJ4THZaNjluL2ZJaEk0V3N4OVRXUmpRRTJK?=
 =?utf-8?B?V1hONUhpMjVCQmovZDl2OS9CT3ZqM080UEcrOHRrVENhZlJRY2JLS3lPajJU?=
 =?utf-8?B?RDV3L0pFNWdra3hiOWtmMHFRMXA5TTB4Nnh6c3U3ZEJaY3BDMmE1dDBjUjhl?=
 =?utf-8?B?c3NXTXJtUVArSXgzVXo2bTFvcERLSUh6RXM2cnVTUituaGtlcFVUeWdNOVRM?=
 =?utf-8?B?VFZJeE1jRkp2OGs3dkVLV2F1cWV5WnRWTEswWDNYTXQzYXJCbkFMZW5PaDlp?=
 =?utf-8?B?RTlxWWxpWjluZUlHc1A4SDJRRk5sbzlUSnN1T0crSmx4RkJsUFh1WEtUZXF1?=
 =?utf-8?B?RTViUzRDd0ZaK1Nnb25CS3pEdi9kOU95UmdHbEhUTW1IVC9sMmovc05PMmx3?=
 =?utf-8?B?R3NpMEJVdEdCOUM3M2ErWk5VSm82YUg2ZzlHcVpubm83NkhqNE1NMkVuREkz?=
 =?utf-8?B?NFJsejRWeDQ3MjVXMkZQTHJGdSt0aXBXY0UweVlYenRLbzFSejV6NG9sYkM5?=
 =?utf-8?B?RzNIYnNNTThhWU5OV3RXT2hoa2UxdXcySjk0Uy81aDNMd1VtaWt0MnprNEJr?=
 =?utf-8?B?R1VXcjNERjJDQnRLOStUNnZocTN1U1B0YXp5ZUdnQUpuTWVxMFp5dHRUWnFJ?=
 =?utf-8?B?OGpjV0ZWZmNxenVIb3Rmb1h3dHBmSFBWdy9kVHN0dmVNbklpcnl2SW9lQ0dH?=
 =?utf-8?B?bllJODhWMGI5RUxyMytRaUYzczNBS1oxa205UEdoQ21TNHI3RVlYMG9KdWNt?=
 =?utf-8?B?TWo5eEw2Q1NNSmc5ZGZmRklWb25vTHUrT3laNmc5b2ozUC9YdkRoT2djRlJ4?=
 =?utf-8?B?b1lZQjB6dU8waEhOV3NLZHkvTXFvWHluUStuZ2VEdmp4TFdPMSswZk5Ic25E?=
 =?utf-8?B?dFpYYU9CRU9jK25LanNCM21RQUdpaHhwdlcva0xUK3plemtBZXNHb3oydG9I?=
 =?utf-8?B?OWI1N0hDK2xIL2dZQnR0ZnNpT0d4WWRIaEVlc2lRdkh4UHJnTUl3ajlnNFgv?=
 =?utf-8?B?ak95azZ0ZW9JazNyQnNwWFlBYjlkdEVMZXhUOSs5Z2hwcEtQVW9FaXBwZUg5?=
 =?utf-8?B?VWV1d0ZxQ0NNZ3NaYU5wK0h3cG9PVnlHYS9HZnFuMlE2U1V3ZkUvcnVHVkll?=
 =?utf-8?B?WXRZbWdNRDlNVDQvTmZUM3RmeWk3c3pXeXpDYUd3djIxU2FSamxYNXMvM3Q2?=
 =?utf-8?B?ZWY2M2R6Y0plUEh0Y0xVMTgwL2t5YmFpMndKYkdLNUVmTk9JWlk0VStYaTZM?=
 =?utf-8?B?MFVYRWZWMUo3M1lkaTA0Z3hEaWl3TmE3ajVDSzM1Zmovd09EZXJscGRNcDFn?=
 =?utf-8?Q?G1t8/2qGCaIXYFjo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfb194a-c6f2-499d-90e8-08debb2d1bfe
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 13:45:55.2303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXOxK6MHpgK6bytJw55oPttoYT/xmnBESH1/aAFjMf6urq+c7NGHXIt1TMUBp5Fg8lxe8VEWlC02YhIQVKlGZVufd9hKrQpHHM7aV5EjF7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7183
X-purgate-ID: tlsNG-c201ff/1779803160-DB36C443-53412D1D/0/0
X-purgate-type: clean
X-purgate-size: 2654
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C87A95D6CD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/05/2026 1:40 pm, Ross Lagerwall wrote:
> If L2 accesses a debug register (like reading DR7) without L1 intercepting
> it, it locks up the vCPU. L0 intercepts VMEXIT_DR7_READ, which disables
> the intercept for L1 and then restarts L2 which re-executes the
> instruction and then this repeats indefinitely.
>
> Disable the intercept for the current VMCB if in guest mode to reflect
> what would happen if the VMCB were recreated via
> nsvm_vmcb_prepare4vmrun().
>
> Fixes: a59a7be91b61 ("nestedsvm: fix DRn handling")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/svm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 49fcdd906cf8..209edcba321a 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1657,6 +1657,8 @@ static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
>  
>      TRACE(TRC_HVM_DR_WRITE);
>      __restore_debug_registers(vmcb, v);
> +    if ( nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v) )
> +        vmcb_set_dr_intercepts(v->arch.hvm.svm.vmcb, 0);
>  }
>  
>  static int cf_check svm_msr_read_intercept(

In Xen, debug registers are generally lazily.  When DR7 is not active
(which is expected to be ~100% of the time for a regular guest), there's
no point context switching DR{0..3} or (on AMD) the mask DBG Mask MSRs[1].

The debug registers are brought into sync if DR7 is active at context
switch, or any DR is accessed, or if a #DB is injected[2].

Now, in the logic above, you're saying that L1 didn't intercept DR which
is why we didn't Virtual VMExit earlier, so when we're bringing DRs into
sync we need to drop the L02 intercept too.  I think this is fine, but
it deserves a comment explaining that it's an artefact of Xen's lazy
context DR switching.

But, what about emulated MOV DR, or a #DB injection?  Those paths will
still end up being wrong.

I think this logic to alter the DR intercepts needs to be inside
__restore_debug_registers(), and needs to cross-check the L12 settings
before modifying L02.

~Andrew

[1] Although the Mask MSRs are currently inefficiently switched because
I didn't have time to optimise things after the last XSA fixing them.
[2] This path is wonky.  DRs should be made active irrespective of TF
because the #DB handler always needs to read DR6[3].
[3] This is a fun FRED bug, as the FRED #DB handler does not need to
read DR6, meaning that I think we need to force DR6 always to be in
sync.  And this gets extra complicated on Intel...

