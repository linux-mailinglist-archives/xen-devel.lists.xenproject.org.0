Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GS0Ee6uGWpyyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:21:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD66048CF
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322613.1588899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSz1B-0005jN-If; Fri, 29 May 2026 15:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322613.1588899; Fri, 29 May 2026 15:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSz1B-0005hZ-Fj; Fri, 29 May 2026 15:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1322613;
 Fri, 29 May 2026 15:21:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wSz19-0005hS-Q7
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:21:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSz19-009MB4-6u
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:20:59 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a19aecb-e002-0a2a0a5209dd-0a2a4505ad7e-26
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:20:59 +0200
Received: from [40.93.195.28]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a19aed6-aaa8-0a2a45050019-285dc31cf523-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:20:58 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV8PR03MB7376.namprd03.prod.outlook.com (2603:10b6:408:18b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 15:20:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:20:51 +0000
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
 b=aRGefmLQnLXP4FcH5LFkbUOB6+YDGFP9KZDR6MvBG8OqYtstNEfHe2UvkY15IlbieGqooxPxD+WkcMjF5vysGsFGLZkx837wkbbQdvjToqm0YuZdIxhsL/ZyKUmxIPRtjS4Ay3UWjEgFH4gH80Ok2rbeh1iZK829inT7VtyCUbnIY8kuEXxL7jtE1MBodx+O2VfQO3vGGrOpZUXKWQgC89KSQxziVIKFIrt5Bf3Q2ysQlAqda7mDZz6Sw4WRWR9y1vpha+iVPM81DAaFKaQjUVuSJARqyYuQUcJzYKJxlU+5lDHzOEmCmKSXFdVb3zeHh25vd69i+0FCfoVBs0ASsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dnrB7eKLSIFUkA1dWLEGhOfnILge1wkUC5oMTYLxxM=;
 b=O8GpEPlaIIBmdRzG0vLWCaKNlAfMw4maHsa6EmRZCRjmJRmXVK0AybM1FDzLXlJcUWMyEGDDBrI/C1KPLQlImib9PbXrsMtz/gvaZNvcLt1V5UrKTIYyXf6amXEmBcek7m7v/oKCUa2Elyi16fDISZlkg2JHas8drnYtFbpBTbRDJHaxTHeOszLVWzDUOTTXSuA5MGH4X3FJPi7Iqe9XB0GufQ1cXEP5BC0nipuJN7rcDhLLKiLyD3uNMzN1od5ElJ/sLUKcOkE13f5ODZCiJbHzLyrpNMkGPIy7lQZlmlT5eThKOlzK9QoVYsrvUUgx0fpoOlH1HMY/SnZ/F4uLKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dnrB7eKLSIFUkA1dWLEGhOfnILge1wkUC5oMTYLxxM=;
 b=cnjn7ERgg4hxaOqYkdm6m3Kcv0ZxXMQ2Ff5wuiVFhaHTVgTmiKi2xBq55l+gtxan5o6OYNb7ayhyZ3CiwfJ/TNoF5aF+LlO1+sbhxdWUtgaKwMxytjPmWf//nF54bVhQvwAuFdKhGrpOUZZBRIWfbLQlYoR/04EaSJO4lHsler4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <791431e8-8f91-4ddd-9ce0-3ab2fb3beae5@citrix.com>
Date: Fri, 29 May 2026 16:20:47 +0100
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
 <d1037e15-cde7-40a1-9011-a02c23e870e8@citrix.com>
 <36527d70-da8c-454d-8de4-54c29c3bd565@amd.com>
 <d6bbc387-4049-4c0b-8d30-34a287393cfa@citrix.com>
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
In-Reply-To: <d6bbc387-4049-4c0b-8d30-34a287393cfa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0045.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV8PR03MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ffdf0a7-7c82-42f5-aefe-08debd95de82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|6133799003|5023799004|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	6tKrfW1wb8+jugxijBniuoM/gA8tGWhoYCj76ZvJvVvRg19aoqxv9y9X7SVTC3e8JDQ0QaTqVA6I6yPVtEFghHpoWpeX0PcTytL1oid1mVjHpn+HXnDUyAnoiV2sa9/eh4NAgx75+9/m5yLmMINVCYVcdzXAs0GjtGiorNrueOwKKnWQwdsbVHsCNwJqt3WxyC+X/ECikyy0AInoZ060dl0MKH50pug1p2CK8Bwg+2sS2QI94kFUx4Av+cIp4nuStZmyQjpGL3N/oc5YogiVft/Pg3oIC4iu1xAlfGStjrXQs2hqNZp8LKzsbrvyczi9bgG10PqJkYEPLUdj2b3W+I5JWe2R6Kg2T5NMIsCj2kO/TmqdPxfVM8OF+ogZ1ixnSnoR45xBw5+GNmR4IjvB4U2SY12BCGxzxHzN4j31yY1iVxK8RJLoS8BBz3+lsn1uTto2OGjngg3svSebml6BmFacw4lvVdBoTerYLfIuxzT3K/4sUjAASJc3/o/gqvV0Opjqa3ENKgqJt/oqSBrw05hkKSv0RCxShfAdcoODFhRCAA+6luLWtcY21kJ3Ou+1m6iLbSqL2ShojXrBB8pVNiqdXOcNWIemei8hgP4EPr1kKdPPYnl8bLrbhMUhNEZGgvjBfPn6eRwTGsovWTbUAzMiERYw5qFX3ZjHAd1ko2kclVuUhqGWlC/oAuJnl5qjBGT/WjXUvi8Q+ecTyrA/0A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(5023799004)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlBBU2UycllYbEpnbHRYUGllcUtsZDc2Z3U1bVhlS0wrZStqYnEyei9WR2N0?=
 =?utf-8?B?bXVEQ0Fnc2N1bUZJQmxRQUg4Tzk1VVRFM0RDOVdoWFVVK0JXSHMzTnNYR1dw?=
 =?utf-8?B?S3hLZ01tRmpEYnI4bm9aVll6UERIV3Q0Vk1kQUVsQ3BQcFZ5Q2RDQVNMbUNn?=
 =?utf-8?B?NkJzM3Jpb00wWjJ5bUJ3Z1pPN1NkL1Vrdk42R2xSSWFTRk91bnk2UkU4SW9V?=
 =?utf-8?B?WUpOUHBRUE40WDl6RkYwSkJWTTJYOGVMMytaTXIxamJBWDlwSHlYZ25GeFMz?=
 =?utf-8?B?N0hmcmhlYXdrQmJWTzdyWUF3dE9Mdyt3Tk4xR3ZSdVkxNW9ZOUNuemRWOXNq?=
 =?utf-8?B?clJkYndMTHl3SVY4QXNaK1VJMk9DclZhYldNbWRoalllK09xNFBrWHo4U2Vl?=
 =?utf-8?B?ZmpnTm1lR0dSazZ6U1BncWMwSXlBbVIyRmJLNVhJSlI2ZDh2Q2xwcjZvWEJM?=
 =?utf-8?B?VzhubCswVDVCZFREdTRiR0hnbEowbnZzaVFvQm5RTzYvVmJmUEpsRG51ZFVi?=
 =?utf-8?B?WDVzMW44a0JSeVFHOFBvL2x1K0ZSZFNrWUQ4WlN1aThneExLdEpqTS9sTWNu?=
 =?utf-8?B?S3BiaHdjd0xGa3BjNHl6QkZac05qU0MwUnVndEpNeGhXTXozL3RWYmFFbUFQ?=
 =?utf-8?B?MFE4T1RvYjZPYzhiNnNvcm4rZDZCZDZhUm12bjBWS1Frbk9YQnR5VUxVQXE3?=
 =?utf-8?B?TmV2MjllNm03aFZ2NkN3MHFZbXlvN1BTN0FWT2lUeGJpZWxRaG9jVFUycHp1?=
 =?utf-8?B?L3F6T2JyUzY3NEl0eTFRK1JwYmNPQ0tOa3l3cFBYOHRsS1ZNZTNmbTRCTCtS?=
 =?utf-8?B?d1FhWUdPN2IwZWRwY3dVSHhKWm5VMVBjUkIxc211dGNrK1FjREY0UGpZUnZs?=
 =?utf-8?B?RzRBbnRPWjJvVHZyZWM5TCtXWDUrRFJIMzd0WlNUOWhyaHZ6b3BjSzE3ajZZ?=
 =?utf-8?B?UDlxN01vWngrNzI0V1BCcGlMTnVwT0hrL2NiZVAzdnRhQ1VGZG1keXdGTEJr?=
 =?utf-8?B?Nzc2dHo3dFl6cU1RQWdZclpTRGtvYmVuNW54OTFCeE05MmpjNnhzTE9kc2dl?=
 =?utf-8?B?QWxvMlp5SW5SM2s2ZVlxd0t4T1Y4MjIrK255MmtUMmhSL0tUZzd3Nnk3WXBO?=
 =?utf-8?B?bWZOQnRjb0VFQVVkV01ZVmgxUXIrRURkblAzNU9Rd09lNURFSElZNkE0d1RD?=
 =?utf-8?B?STF1WnBmY2RtSU9mNmdJa3pabzVsWmxVN1NYMy9GNjdOQ1ZFeENuMFZVYmtN?=
 =?utf-8?B?RmhvRzlkQUQ2NW9UeXZzVEp4SWI4WUovVHZVR3JVUVJ1SlQ2eUpjNStaenFK?=
 =?utf-8?B?MUVjaTIwUFc3WTdkNFB5a0cxU1dTVEZpejRvdVgrOThSVzBBaHp1T05XMEJu?=
 =?utf-8?B?Z2oyU0V2QUJTZzlVUlMzejhmSG5tcUxidHRPaE9DSGwwMDczUS9yclVEVHF6?=
 =?utf-8?B?RzBJQ2F1NFAvSFdwY2Q1cDhNNFlLZHhkSkI5WmY3K3hJejg0akJwU2l5blhl?=
 =?utf-8?B?eDVvOGRhWGVoT3hoQ3hrNzNVcngwc3gvTVQ3K0MzZXVvb2JDOW1ubjY3dmVm?=
 =?utf-8?B?YmYvNGxiN2xnY0xmNEdTZGR3MG1uU09jYnpRenBxU21tMWVvNkJHRWlYQWdx?=
 =?utf-8?B?N1RmT09CUmxpNkFicS9KUEJxZy9zZmk5a2I1Wmc2bjY0cGNiVUViREVNd1hI?=
 =?utf-8?B?cUloYStVQzFmRnZTQWNQMHp2YjZTOGZaTmZXS2dyclc4SGw1Y0ZNOENxejc4?=
 =?utf-8?B?Q0ZaNVpMZmJjdEk2OVBYZzJSRG9oTGlScjhUYjZ4MnFLVFkxbVNSZFRndEZq?=
 =?utf-8?B?ZHE5QjcrRnJTS1plODZhMXFycmlLVTlicndwUHpoQVIxZkIrZWhpbXU2YTcz?=
 =?utf-8?B?cGxjMzZTWGtIcjZTWkNnQmxZaW0rUFFlbEU2SzQwOUFRbS81WnpwYi9hcTdj?=
 =?utf-8?B?dVByalo3TFNXR0dPTUJhdDNFR0UwdGMzUUlySDM5Zi9ncmY4c2tzNS83Y0dy?=
 =?utf-8?B?NVlSQ0FtVkxVc3lyUnFXdDNzSlpqK3NDZENtQlk1NkdXMC9Wa3hJbmJKTGwz?=
 =?utf-8?B?NXZ2NlZFQmxBV1hIUjBvbDJVQ0hVNFFVdEh1NmJhY3BlZS9aVDJ0VWs1TXNK?=
 =?utf-8?B?cVVUOUlGTUlrc1ZYUzNBRGtjRy9QRDlPZmdXMHJtYU9uOFhlbGpOVy9rUkV4?=
 =?utf-8?B?S2xYamFRNkc3aU54cGErZVBleVlJTXFrSTd3Z1pha1hwZXNDUGU5c2Zzdklk?=
 =?utf-8?B?L1pYTzlwbmd1dXVNL05pQWNaaFA5Vm1SamRqNGdSWFdVWkN6MmNaMnU5bXlT?=
 =?utf-8?B?NWtwU3hvUnhVRVoyMTBsbDBDUStyc3JxRW9SUHZtMG43L09TK1dvSnNZQXE4?=
 =?utf-8?Q?25DcPGOLig/Hl5aY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffdf0a7-7c82-42f5-aefe-08debd95de82
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:20:51.8505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KCYVTlK0yIjLIMRr/hO7hmsxGN9GTWXRsceESdFlbHeTvMsWbqu5Qzm6EfLTnEG9bE3vncQYU0ndPpc3C7FCQTy8iTKc7CbT/8v53WBHZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7376
X-purgate-ID: tlsNG-c201ff/1780068059-E2193443-E31B7FEE/10/63158204843
X-purgate-type: spam
X-purgate-size: 7395
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,xenproject.org:email,amd.com:email,vates.tech:email];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:cardoe@cardoe.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 58CD66048CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/05/2026 11:58 am, Andrew Cooper wrote:
> On 13/05/2026 7:32 am, Orzel, Michal wrote:
>> On 11-May-26 11:21, Andrew Cooper wrote:
>>> On 11/05/2026 7:29 am, Orzel, Michal wrote:
>>>> On 08-May-26 23:29, Andrew Cooper wrote:
>>>>> Exactly as per the Bookworm container, but additionally with the ipxe-qemu and
>>>>> qemu-system-aarch64 packages.  These will be used to remove the export jobs.
>>>>>
>>>>> Switch qemu-arm{32,64} jobs to use this container.
>>>>>
>>>>> No functional change.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> ---
>>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>>> CC: Michal Orzel <michal.orzel@amd.com>
>>>>> CC: Doug Goldstein <cardoe@cardoe.com>
>>>>>
>>>>> We should probably wire up some build tests too, but it's too late on a Friday
>>>>> for me to be thinking about that for this posting.
>>>>> ---
>>>>>  automation/build/debian/13-arm64v8.dockerfile | 71 +++++++++++++++++++
>>>>>  automation/gitlab-ci/test.yaml                |  4 +-
>>>>>  automation/scripts/containerize               |  1 +
>>>>>  3 files changed, 74 insertions(+), 2 deletions(-)
>>>>>  create mode 100644 automation/build/debian/13-arm64v8.dockerfile
>>>>>
>>>>> diff --git a/automation/build/debian/13-arm64v8.dockerfile b/automation/build/debian/13-arm64v8.dockerfile
>>>>> new file mode 100644
>>>>> index 000000000000..b9062ee8b443
>>>>> --- /dev/null
>>>>> +++ b/automation/build/debian/13-arm64v8.dockerfile
>>>>> @@ -0,0 +1,71 @@
>>>>> +# syntax=docker/dockerfile:1
>>>>> +FROM --platform=linux/arm64/v8 debian:trixie-slim
>>>>> +LABEL maintainer.name="The Xen Project"
>>>>> +LABEL maintainer.email="xen-devel@lists.xenproject.org"
>>>>> +
>>>>> +ENV DEBIAN_FRONTEND=noninteractive
>>>>> +
>>>>> +RUN <<EOF
>>>>> +#!/bin/bash
>>>>> +    set -eu
>>>>> +
>>>>> +    useradd --create-home user
>>>>> +
>>>>> +    apt-get update
>>>>> +
>>>>> +    DEPS=(
>>>>> +        # Xen
>>>>> +        bison
>>>>> +        build-essential
>>>>> +        checkpolicy
>>>>> +        flex
>>>>> +
>>>>> +        # Tools (general)
>>>>> +        ca-certificates
>>>>> +        cpio
>>>>> +        git-core
>>>>> +        pkg-config
>>>>> +        wget
>>>>> +        # libxenguest dombuilder
>>>>> +        libbz2-dev
>>>>> +        liblzma-dev
>>>>> +        liblzo2-dev
>>>>> +        libzstd-dev
>>>>> +        zlib1g-dev
>>>>> +        # libacpi
>>>>> +        acpica-tools
>>>>> +        # libxl
>>>>> +        libfdt-dev
>>>>> +        libjson-c-dev
>>>>> +        uuid-dev
>>>>> +        # xentop
>>>>> +        libncurses5-dev
>>>>> +        # Python bindings
>>>>> +        python3-dev
>>>>> +        python3-setuptools
>>>>> +        # Golang bindings
>>>>> +        golang-go
>>>>> +        # Ocaml bindings/oxenstored
>>>>> +        ocaml-nox
>>>>> +        ocaml-findlib
>>>> Since this is a container used only for tests, why listing packages required for
>>>> Xen and tools build?
>>> I did leave a note about that.
>>>
>>>>> +
>>>>> +        # for test phase, qemu-* jobs
>>>>> +        busybox-static
>>>>> +        curl
>>>>> +        device-tree-compiler
>>>>> +        expect
>>>>> +        file
>>>>> +        ipxe-qemu
>>>>> +        ovmf
>>>>> +        qemu-system-aarch64
>>>>> +        u-boot-qemu
>>>>> +        u-boot-tools
>>>> So after this change, even though you replace debian-12 with debian-13 for all
>>>> the tests, the debian-12 still contains the unneeded packages (i.e. for a test
>>>> phase that it no longer runs).
>>> Yes.  I can't do this series bisectably without it.  Also, in the past
>> Ok, I understand the bisectibility problem.
> On further thought, I can in principle fix bisectibility by introducing
> Trixie first, but that loses the logical sequence of events somewhat.
>
>>> people have explicitly requested to be able to run the qemu smoke
>>> testing from the build container, which is why it's like this and not split.
>> Unless it's a rule that every container follows and is documented somewhere I
>> don't like this argument.
> It was explicitly requested by ARM, and accepted at a time.
>
> If you'd like to revisit this decision, that's also fine too, but I
> don't want to be flip-flopping on it.
>
> I could:
> 1) Make a 13-arm64v8-test.dockerfile containing only the test phase stuff
> 2) Switch to this ahead of the 12 cleanup
> 3) Do the 12 cleanup without the test phase stuff
>
> although this makes a new scheme that we haven't used before.
>
> The one thing to say.  It's almost always safe to add packages to an
> existing container, but ...
>
>> My plan then is to do the clean up of Arm containers
>> in the future to remove packages not used.
> ... you can't remove packages from an existing container.  The
> containers are shared by all stable branches, and you'll generally break
> older branches by doing this.
>
> Where we have dropped dependences, e.g. ae26101f6bfc, I've commented the
> dockerfile so it doesn't get copied forwards into a new container, and
> can be dropped when the identified version falls out of stable support.
>
> a0e29b316 is an example where the containers did get rebuilt after the
> version of Xen ceased being tested.
>
>>  It creates more confusion for people
>> willing to create their own dockerfiles for testing (or just to see what it
>> takes to build e.g. Xen on Arm) than it gives benefits.
> That's why the dependencies are grouped and labelled.  I do expect
> people to be able to figure out the bits they don't need based on the
> comments.
>
>>> Honestly, I was hoping to leave the Trixie update to the ARM
>>> maintainers, but despite the Bookworm QEMU (7.2) being newer than the
>>> 6.0 in the export jobs, it contains the SYSREG interception bugs which
>>> prevents hiding ThumbEE from guests, and breaks all the arm32 testing
>>> with a Linux dom0.
>> Does it make sense to have both Debian 12 and Debian 13 build/test? Can't we
>> have just the latest one?
> Build, yes absolutely.  You want as wider range of compilers/toolchains
> as possible.
>
> Test, we tend to only do one.  For x86 it's the alpine build; for ARM,
> it's from the Debian build.
>
>> All of the remarks above are not something that should prevent this patch from
>> going in, so:
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Thanks, but lets see about the latest proposal first.

I'm folding in the following hunk:

diff --git a/automation/gitlab-ci/build.yaml
b/automation/gitlab-ci/build.yaml
index 128b5f45cbad..a1acf2e827df 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -424,6 +424,16 @@ debian-12-arm64-gcc-debug:
   variables:
     CONTAINER: debian:12-arm64v8
 
+debian-13-arm64-gcc:
+  extends: .gcc-arm64-build
+  variables:
+    CONTAINER: debian:13-arm64v8
+
+debian-13-arm64-gcc-debug:
+  extends: .gcc-arm64-build-debug
+  variables:
+    CONTAINER: debian:13-arm64v8
+
 alpine-3.18-gcc-arm64:
   extends: .gcc-arm64-build
   <<: *build-test


which performs some build testing using this container too.  Full
resulting pipeline:

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2562180822

~Andrew

