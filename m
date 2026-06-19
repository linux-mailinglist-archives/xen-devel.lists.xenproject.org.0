Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lIk4MkBtNWpWwAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 18:24:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC956A708F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 18:24:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=rOy4qgNq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342528.1602641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wac06-00089u-2S; Fri, 19 Jun 2026 16:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342528.1602641; Fri, 19 Jun 2026 16:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wac05-000878-VR; Fri, 19 Jun 2026 16:23:25 +0000
Received: by outflank-mailman (input) for mailman id 1342528;
 Fri, 19 Jun 2026 16:23:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wac04-00086t-P0
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 16:23:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wac04-006DUl-5d
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 18:23:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a356cea-2eae-0a2a0a5409dd-0a2a4504a68c-30
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 18:23:24 +0200
Received: from [40.107.208.47]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a356cfa-5f9f-0a2a45040019-286bd02f25ec-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 18:23:23 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA1PR03MB989247.namprd03.prod.outlook.com (2603:10b6:806:4fa::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 16:23:20 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0139.018; Fri, 19 Jun 2026
 16:23:20 +0000
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
 b=yEV5mIMVQKQ+nWt1hHHUHlO5lbYfR779pIg301b2pcagXzDzqpe2qx8ABIc39bgvzx6TtQzqI5PrJJYWJrnXGpQlY0YU9VxSfts9TmZauuF6zY65tBMhn2uVaptAxgHQbgt2PFis8qXNkgmB3YMggyWFEgHmZac+38khWUyjZcwbdDRj9yekdlb3yNtTx0RUaCHjwg9pg2v4645kZ0tiQywXMwFd87z0zdCsXmfq8PMLIJXKBoODkUf0ZEaVfdaYog6L634Er0EVmBKXh7c4sPF2aDxzAQeOlboarw36KkTsP/9lC8ys1dGYpOqXF6G4okQKtQW/3FMkJno1zsvQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLm+CI1gXARtxbYQmRPV/AwEtB6bQip4bN4Sk9Gr5hI=;
 b=nJ8oFRGYCXPage8FDliE/51u6XNE4957U1MwrrOXLv2COPvZ9kkcn4VyU4Re+JpYWMeejHP0qfKOVdNn2ZxqhdFLbGpDo+l3TkOMqqxYJfBxez9tqYQGbByUpjozt54ijRqANwxtR1yUSViUj82dfFkuP+96mY7bgB4PHxp+xGTCjlukhcRa4k8VLD2Seus+0eUMgfeNTt1smAu+IGu/qvTsAO2Ea71LL6GRf1Vna0S35y6UQbBbxpnWPB3ZcTFvArKYbAd0KW+3t/sj6azDPIHj7dAzA+EildmehHq2Sg5uf4z4ppB5Cj2XgNPkyLh2aJwZAXzdFBRPfGcq4MT57Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLm+CI1gXARtxbYQmRPV/AwEtB6bQip4bN4Sk9Gr5hI=;
 b=rOy4qgNqdWmbnjiZwPlhXNwdbce4h2AS56BDEE+jnE46zzfOOn4CXCyiRL2PPM+pvkG2jGYr2Mz1NMSSAneCRYPnb1k9ittWju9oNx3ZltNYF7hNXz5qK+6RqFeYxPRk3h5rHUw8G/XsmMjzID+uz69u6+kzkjNp4M2k3gRMu6E=
Message-ID: <96edcf00-8a0b-434e-8744-132c1b6e183d@citrix.com>
Date: Fri, 19 Jun 2026 17:23:17 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Cody Zuschlag <cody.zuschlag@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4] docs/process: document AI-assisted patch tags
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260615184348.7804-1-andrew.cooper3@citrix.com>
 <ajBPzKlWJAePD7rW@macbook.local>
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
In-Reply-To: <ajBPzKlWJAePD7rW@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::14) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA1PR03MB989247:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9db075-d50e-4b5f-e077-08dece1f13d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|6133799003|3023799007|11063799006|56012099006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	RgeRQ9GZ2nzmqWUit8M78SO2geA6yJkP83nYxaIqUk2pC03a5iO5pa/QtW6B/ukHHKumJ/DAEcjOV7vtihbOrV9EDmy+1VjpMLmnH51f0v1cQvMH0F6bzWIt0whwRN5dgzrMDNVa+wl15nT4h9EtdWIrUqtaeQDnxeWbH5H1ebQTJX6lm3YRjfRsyKDmUFFrLwcVuUrTCsUv3xR77M7fOylvRXxX/wiIqTNJR39eNTsPY+gcmp7NEmF6WKNkvhjPdLhexj/hc8AY4bx35yM0FJ3s5MgdF/WCVFRGBG+aOd2+nzl8VAYB4qRT8EHFG7SrqjyANDuq0LPPUNNL3yNjuMft6Afgo37lT6VObP19vLTXFWVr7HSxQnz9LfR/5pPmXpAkP1CbJBo000zhjkwq1Pc9rZwynMqmcwXp/CmP4fS2gbk0OuDMVf+DT6YGOGrrUZFfxO/qOIuCM/sLbG4SIYO6WRUkucEjQ4JoTWTCYW8zX7oqHPYLarqAJ/WxITw50WS7/Bjj9A1uDZ5TOEOQIzjxzkP+yUXqrujvzNbDAlE6sT6h5e0+pMNVLH/XcQLAFVQkWHnB3pVFxvPJkAQPoBuDzDs9kImVU0A/p0ZLS3WPy6fOQcRcCMuQ0FuPqgL3DEY7HEHoV+mN9EoKEb1UL3YX8vMqFa86M+xPav3n7wo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(3023799007)(11063799006)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU05bDdlQXh1MUFScmcwaXNnSytzWENUd3FGbUJWd0Q5MStmZzZFdzVsd3lk?=
 =?utf-8?B?VUExclhITUwwTU9RMk94TTkxTEt0N3dlNkdnVnRyczhrUmVVWHUwRHJPSkRZ?=
 =?utf-8?B?K1BsY2JLTzVRR3FHNHVlWlprV0tqVHBnRVpaVEszd0xpWG4zNnA2M1NZVEgx?=
 =?utf-8?B?S1ZIUHljeXFhd0Q4d2Y5OXBXd3poWHdVc3JVVnN4YmlpV3JxSEgwNGxwM3Jl?=
 =?utf-8?B?YjUvRnB4bjBFR3hUQmo5emV6UnBEa3JWUUFZSjk0Nm5WdmFlQW5UVXhqWlgw?=
 =?utf-8?B?azBxaTNLQUtBR2hvUlF5bWlydE4yeU0vbE1hK1BoNjNMell0RHZmQlcxUFB6?=
 =?utf-8?B?a25oTnRWQ29yU3VUZWRyY0NEdndCUUNkSnBMQjUzbUJrWEV1LzVhRk5VZlZo?=
 =?utf-8?B?MEx0MUUrTkpNY01GdTF3RDdmanB6U0xGekI0WUc5RFo2d09MZVBFdlNwdHgy?=
 =?utf-8?B?Z1pjWHFnNTdiQVJaN0ROM1JlYWdXeDdZTWg4YUNtZnlHK09CVTBFSnY2NDlU?=
 =?utf-8?B?MHJQLzNteW9pako4NUNtVFVUelpreE5YbnUvY2U0MFUxdThuUDJjTHpTQkcr?=
 =?utf-8?B?K2xFMzgzVTdYNWsrOTYzNTVjeVBrSldzOWcrWldZVEZqNHJEQ3ppTmNtNUlR?=
 =?utf-8?B?NWQ3U3U1U3E2Z0gyZTZuYXNzOVduU1lPZzBGK0pmNmJHVDBmL25XTzJROURT?=
 =?utf-8?B?NUlXWU9pNnV4Mm5Fc2pnV1pSNHNRYzREWll3N1ZBVEF2WFkvUFZTNWpRWXI0?=
 =?utf-8?B?Z1AybUZvMkxtdnlqNnlEaDRMVUQ1bDZnOWUvclV4OXM0cjNnMEs1bS9VczNJ?=
 =?utf-8?B?MXd4dnp2V0JxUDVLSVZFakdwWFZPdG9LMEFQd3lBTGFuRlovUEQrR3o5RzdU?=
 =?utf-8?B?MEdyZlJScy9obzlQVGx4M0YxTEQ3OXBYWUxEa3krdG4xWGxWdy9oVDcyRGpF?=
 =?utf-8?B?QlN2UVp4WDAxUjNCSlQ0MC9sWTdpTzdSVlRtYzhqUStEb00rbk1MOVNCbzJW?=
 =?utf-8?B?WDZvZ3c0YU1ORlU3K2cvTUVDdzRwS2pIZ2lyMUN0elI2R2I4YVRSbDNsN2JD?=
 =?utf-8?B?TmdLZ0pmM0tCbDBGMHFmZXZ6N1RRZjg3SFo2bUtYVGtBS0E0NXZpcDNpVFli?=
 =?utf-8?B?SHFhVUptOTNmSFdibHV0YkdTRlhDcHBMVVBlQ0QrWS82azJrVUNOQThWcFMy?=
 =?utf-8?B?dzNINHUzNUtGRmoxaXhSRnRpUyt3dmpidDBkdWlXeXgxZWwwbW1SVmdsTVFB?=
 =?utf-8?B?TktqREZaMSt0aTkxa1dUdTREU0VpdjdXT1IrZmw3bGlKbEZYb2V5ZUxDQ0Nk?=
 =?utf-8?B?OEQwZFRhWkF4QkQ0dFhMT0IweFF6cXpTNWZMZUJsMGM1aVJnaXBjcUhOZkpY?=
 =?utf-8?B?UHZjZjlBTUpVaFYwZ28rZWNMeFRLNEYwN0VnNDM3emFXSUJEUnFjN3VabU9D?=
 =?utf-8?B?T2FqSi9kbUlqZW5Yb2xOU2hPUWlEN2lxU3VJdDZ6UmF3ZEZESVlyVHJHS0h5?=
 =?utf-8?B?ZFNZWVRadFFPalRiU0xwalM1dFZZanpSRnJlMUtkOHdnZkhENGtwOHd0WEs1?=
 =?utf-8?B?NFphSDVSRStldU9pVDdxNFkvTitBbHZGM0lWNnB1c3owbDRjVlpkZm5MY0oy?=
 =?utf-8?B?MlMrWW1JblVKdGF6YTNPU0UxT0haNERtRTRtM05DcnhMSVMwR2pTU01vRTlH?=
 =?utf-8?B?TFlteVlhdDVnaE9VZ2dRdjJua1FmT0EvUlBkQ1JxWUM3U2VhVk1RUzZpZm44?=
 =?utf-8?B?OTJTMkFLakM3TnppVDhJdVl4Q29tVU9RdGRMY1MzalhqQ3ZWTlhqYXVFbTVi?=
 =?utf-8?B?VEZubWxVREpMNEV1eDlsSGJaMlRhZlYvT0RONExIVVZadWxnZjJ6aFd1RzFN?=
 =?utf-8?B?T1luWXB4ZVFOVWIxZEdvWit0VE85RDgxNHNSTERqeHlFUmZJN2lObDRFZTRK?=
 =?utf-8?B?d1k1NktIYTZPV1BkRnQyeWdKMkFSOVpxZCtGL25sTHdSM2RLL3EyYzdLUUJR?=
 =?utf-8?B?eUFmNjdnK290b3U0cWRZVkVyRVVEMTE4a05QY2VuNGlPVEx2cnRCcVlHU0Jp?=
 =?utf-8?B?aHloNnBoZUxhRDl3KzB5UWVkWUYzTEFZR1VGbEdBenFZcy9Pa1FXQXZWelE0?=
 =?utf-8?B?K3VlSzVCRlNKUUc3MWtmUEY3ZlE0YXovNEVSK2FGR3U4NUFCdmlSdS9lUmZW?=
 =?utf-8?B?dGttNjlvZG44RS9LZkMyaWpicmJ3aEZvY2lwYUtyS05mNWdyV2NkTjlneUht?=
 =?utf-8?B?bjFqZ3JkekpGR2hCT0grY2JjT0RiZ2pnaEh5eVU2aS9lcndoZUgxK1daQnk2?=
 =?utf-8?B?SCtNbFEyZmFBTHA3ZmFENHY1MkJ2ZnJ4c0VvQ0R6S01Dd3MwRFdtVDVqcUEr?=
 =?utf-8?Q?Roys4bQXYm5s+CcI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9db075-d50e-4b5f-e077-08dece1f13d5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 16:23:20.6262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMvQlnWGZcuLDvpmvSM4fNX7PIfaTsK9Viz2GROasx/Ur3Ou/7NGX1SP3BXBxX/Qp3hOrD9J++Tp9cCx/2FIHChh3LXDQRJHG/SkzcB675s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB989247
X-purgate-ID: tlsNG-ebf023/1781886204-9E1CA141-1B2A82DA/0/0
X-purgate-type: clean
X-purgate-size: 1033
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:cody.zuschlag@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:codyzuschlag@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EC956A708F

On 15/06/2026 8:17 pm, Roger Pau Monné wrote:
> On Mon, Jun 15, 2026 at 07:43:48PM +0100, Andrew Cooper wrote:
>> From: Cody Zuschlag <cody.zuschlag@gmail.com>
>>
>> Add documentation for the Assisted-by tag to clarify how
>> AI-assisted tooling may be disclosed in Xen patches.
>>
>> The guidance follows the Linux kernel documentation.
>>
>> Assisted-by: ChatGPT:gpt-5.5
> Really, seeing how it managed to mangle an otherwise extremely simple
> patch to the point that required manual fixup to apply I would
> consider removing this Assisted-by.
>
> The wording is verbatim from Linux, and Andrew is the one that has
> adjusted the chunks plus removed the inapplicable references.

Ok.

>> Signed-off-by: Cody Zuschlag <cody.zuschlag@gmail.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

I'm going to get this committed now.  It's long overdue.  v3 did have
more acks and there's nothing controversial changed.

~Andrew

