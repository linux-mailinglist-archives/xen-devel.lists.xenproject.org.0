Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCUQCWYDk2nF0wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:45:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956B14317E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:45:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234036.1537409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrx2P-0006QJ-BJ; Mon, 16 Feb 2026 11:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234036.1537409; Mon, 16 Feb 2026 11:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrx2P-0006O4-7l; Mon, 16 Feb 2026 11:45:13 +0000
Received: by outflank-mailman (input) for mailman id 1234036;
 Mon, 16 Feb 2026 11:45:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aABt=AU=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vrx2N-0006Ny-Oc
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 11:45:11 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef8dc56d-0b2c-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 12:45:06 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB4965.namprd03.prod.outlook.com (2603:10b6:a03:1e8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 11:45:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 11:45:02 +0000
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
X-Inumbo-ID: ef8dc56d-0b2c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toC02RyCqX9sVdjp+1AML6VOUKt4Y2x7cPDXvy9PO9Pb5ZUSKcdyq5jm+f0t4hHmgZ21MzJobihXVl0wUXRqtBVQaKYVHS9O5fHMRZMHZgGfXw9IhgXAfrEcJqQO8WS+0hWX9K49Hmv2zD5RLhZqMisAGsX50RdMFXK9T4tubGpWGISDvdcVJhBKZ3kgQIe0104dYcbN/rrvnvaJmcsvsS9EHLcYupfAHFYyRtb180/GgruXV/ckGdg59+dVnwU/4M1xF4RyB30UzZZOLmLZD52B+3sn9KXZHQkrfJbZgARZm8cP9VBoJmJOY4h5fWGKFOR9dK9NRTF/4s6YDalc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruoIsqENWW3aJlrPc9WCiXtcHgRB5gCOfS/0sWc2ZY0=;
 b=OvUxyFIkA4rRyFBWdSOjiDBfntT73fB/urLS4sZWMiQXqZ9GnwIvZESJyekIFgrH/7bE1g3EvCvnUw3BOCWSVLIZuVEZOUl05NkdQf3ZjwZaOw62FbCo6jcDwBI4nlsVvVo7JrdVwRBk6ZyC0reQPRXuYVQnSqjc990I0RkoNhLBHkqWxYC31ESIPD9GwLbtQPotihvgqofBP5f3KUYvO5pOwfbCDYfGtTY0w9EUoDbblw55rxIfFzMXMLOcGMnMktRUqT1+8/QU1nIPxKHlIiXePXMI00wh+q09vIeuZqAD0ZfTYFh8pHpYpO5pckNBDPWCsunRLeCsA8zN9ebt1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruoIsqENWW3aJlrPc9WCiXtcHgRB5gCOfS/0sWc2ZY0=;
 b=z5NSRA8Aa4m65qWWmKudkLIJFpjyhnjVy15hGYPe4P+gC74JmuO9VD8/ncq8a4Gsh+z+OaGqCenNt+C6ODuZMrS9Z3Yn/wlaK53m9wBAE4GmkF1d37IpNVJ3RLztT+92kpR/OW54lbhPBBgAoUAAb02pwBYxxslnbMP6fHRCzho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <518e7576-a88d-4172-bf93-f6a368c173d0@citrix.com>
Date: Mon, 16 Feb 2026 11:44:59 +0000
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/2] x86/svm: Use the virtual NMI when available
To: Teddy Astie <teddy.astie@vates.tech>,
 Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <cover.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
 <ccd7d351fcf47e6a74bd6bdfe3fe8bc9f5023e7e.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
 <c0c2e0cd-173a-496f-a643-7d19c9418a2a@vates.tech>
 <ea21a66e-a4ab-41f9-92af-0111292ecb3a@citrix.com>
 <626c3f3b-9176-493c-9d96-e2a5344e7100@vates.tech>
Content-Language: en-GB
In-Reply-To: <626c3f3b-9176-493c-9d96-e2a5344e7100@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0097.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB4965:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a3b68b-3cd6-402a-1298-08de6d50d227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2dvOW5jRU9PbHBFUVNlb0RDYTl0VlhMaVVRdjZFSWtTMk11VGI4Z0NGNjdT?=
 =?utf-8?B?a1NZSytWeHNMc29hbll6U0VTVCtDUjNreEJPeGVpQm1MbWp2THRTVUtQMHU4?=
 =?utf-8?B?MUlEK1JOc2pVTXFzcXYwUVFrazg5NGpKQVMrR3cwSm5IY2V5eDlHWnB0QWRQ?=
 =?utf-8?B?aVc3UDRpUHB0bzNXb2Q4ZTNpUkJHRkpKb3Q5a1ZRU0NyYWV2VUNQSEdzRU1v?=
 =?utf-8?B?enV1RXhibEljam9ybGZMOTlpRW8wTzlUcno0RE9kbGd6djFUUTFCZGJIL0VT?=
 =?utf-8?B?UjRHWXlSNDJabnZKeDE0QkpFTDNKdFg0b2Uzc2Vobk56Q09PZVB2ajljL2RS?=
 =?utf-8?B?cVpQbzdmVTcwMEtSS3J3TU9MM2JDOEM4SDlDRktPR0taVnF6ODl3c0xHU21y?=
 =?utf-8?B?ME5ZT2lqTUhpOVIvbDhvdHFWeGNqMVR3NFp3OEtQMTI5clpsd05kTXRGTGFF?=
 =?utf-8?B?enJDWVYvSnZlc1pURXBDR2dwanJVR3Z1ODM1YkRoZDEzV3U0d21EaWc1S0tO?=
 =?utf-8?B?VEV1cWRzR1c2bDErczliZ1lwSkxaZUxYRGdlNFN1ZEpheS9nM1pSODJTNndS?=
 =?utf-8?B?OUJ5Qnc4Z0ZtSnZpZUdaRSszRGFkaDZHZWpzU2pQY1VrbGxPbHJ0WUtLcXYw?=
 =?utf-8?B?bUJDRVNCWWNZVHM1RkNWMW01dTczcDYvSkEwNnpDSy9WVGU1YWJIZFdRTVE0?=
 =?utf-8?B?eEpjdG5Md3l3cm83NFoxRjN1MjZJYW1mQVllejJxeW1EdzRDUWFOVTB5c2JM?=
 =?utf-8?B?V1VjZENwU2tycy9OVlpJNG9MaWo4SlM0RHJCTUFNUXcwaEN1M0xsRjhQNHY4?=
 =?utf-8?B?amtEYmRQQVFPUUo1T1pzU3VRS0E2a2NGOFF0OXIvMG5UbGVLSWhGWHdybXpD?=
 =?utf-8?B?WWU0cFpsQ1p5cFF2UmsvVUNRNVY5M3gwTEpLY0J4c3YyTUhDWDNhc0psMHFZ?=
 =?utf-8?B?bXNQU0s1elNYS25PTnZuRjNEeGs4VmNCWUFmRDlsejdLZXBzTmVGMlRQWUlt?=
 =?utf-8?B?d2JWTndneU9uSnF2ZmVqTloxTkpIWWgzQ3dCSy9ZaWJDM1BQNlhja2pOZFA1?=
 =?utf-8?B?Nmo5ZGJKWW1GdU9kbkxUSy93d3YxQnRxNEhOUFAvdUlLYVowMm9LUTlJNU5t?=
 =?utf-8?B?c0pQeG1LaGpBaVJJb2UrUmRnS2ZuOU1oL3M5VGZGdG9lVGVuVFFCZ21OYmpn?=
 =?utf-8?B?ampEUlZLSlZsNDVQMnBJNUl3Zmw3VGhMUGMvUnFjZHY4V1VzRE9xVXdTbVY1?=
 =?utf-8?B?SzF6dTRKUEdoVldmSjY1TG1sL3JoQmx5MGE5STJUQ2NoQ0FaUXpHSVFTdFNV?=
 =?utf-8?B?eG96QjBwaWVEdTZUNnZjVmRYamdFdHV6Zy9hbGgvYjhOYlJORlRmRXNtcFUx?=
 =?utf-8?B?djRMZlUvbnZGWmVaZFZ0WXl1WWV3dEVtd3FrZnlidEM1REcwdHVDOGhpM1Yz?=
 =?utf-8?B?amtqb2p2cGEvaGFKNTdtV3dWUTBZQ1RrNnlhWjJ1MSsrRTZMU1Uwc29SVENN?=
 =?utf-8?B?eW03YmRsVnBEYThXN1JRcllZTUhBTTZsU3pxZnNhWFc1dXNVRWhKbkFDR3M3?=
 =?utf-8?B?cXUxcGxsQURiWjhrK0hjckdlZmZON3YzaUpyb050bmxObW5nYVF6YStYbHBP?=
 =?utf-8?B?K0tnS09CK2FTU1F1Nm5oTGlyYVQ3T2lPcDBRamZZajFrb0RQTnIyUnlzMzJq?=
 =?utf-8?B?SzVJQk1jQ3VLcTZ4d0NHdjhvQnplNFFaMDNCZzVqZjVqZXJuaS9LTURpUXlw?=
 =?utf-8?B?bHFIS2dIN1ZrUWhVMnVnc2JlUFBncC9yNDFCaTlrekNGWGNBS0ttTWRablg4?=
 =?utf-8?B?TExtVHJEZHMyeEJlckVWN1ZFV1VGUGViTFY2M2QwRzMrTWVDakpnWWxkcXAw?=
 =?utf-8?B?T1BKdUFhWGErWTFSWm1SUFAwbVBYbjJsWHk0ZXVzWGgwNWZCUDJuL2h1Wjgy?=
 =?utf-8?B?R3FoN0x1Ym5wdXNkdSs0QjdtYjUwMDVzQ0ZndE1jejJoSkxnZ1Q4ZnNubGl0?=
 =?utf-8?B?SlM3N3BOS2IvdG1kYVJ1bTJqT202ZnFuNWMrR04yYUxzOHVOK3Y2SS9XWVVX?=
 =?utf-8?B?YjB2alJDRzRvR2J1QllzMHB6czNqN2NiTCtmSTdHS0pGSDhsNjI0MTdMR2Ix?=
 =?utf-8?Q?Nu2E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dklGZkZwWmlWaTdCVS9sdWtSQUVhcko1RCtaMXVXZ2VHaHluVWlpVG42YU5B?=
 =?utf-8?B?VGs3SUlwL2xmWnRPaFJhNitaWU4rMFdobDU2ZCtVeHd0cmNWMFduVnd5U3ph?=
 =?utf-8?B?RlpKQWMyZllob2RMaFc5TVowOEx4MTdGWDhZM1VxYTdXVDZKYWRaamc3clBD?=
 =?utf-8?B?QldaNTlDRXN1MUFxR09JZUo3RzBEa1VnaVhMZzlONXpIbDRrZExmVHo4Nk9j?=
 =?utf-8?B?L3BRZCtIdXplNHhVYzFNNk1hWlBxT0RhWkxKRFdVMitjcURsd2NBOUk3TjBu?=
 =?utf-8?B?QU5RempQRjR0Mno5bTg4Sy9YUm1sQktoMFNnbVhUOEc1QjdDMnlPNElMeHZH?=
 =?utf-8?B?Rlg0N2MrWWdUNGFjQVJuNlIyenJjWGNSV1NmZ0ZVSEpFKzNKUkJrZTlLMTNs?=
 =?utf-8?B?ZitVRlB6Q3VpNUV4TFFZL2ZzYzZGa01yeFhEeXZYcjNvVXpGWVlZZTY0OGtz?=
 =?utf-8?B?VFpZUkVFRGlLLzFyKzBGYmt3VHV5NHNOZzVnblZIZUducHkxMTkzNUNKYWFw?=
 =?utf-8?B?U0duV0hadU9NWkJNR2RmT05NOVdiYUQ3VkdJcjgzMmp0RmNlWlZRMG5mcnA1?=
 =?utf-8?B?MnNLYmZwZ1dqUlRTdDk0RjViWWtlMVVrQ0V4L3VYTHlmYlUzTUJvRUpkUVVF?=
 =?utf-8?B?TG13b2QxcG1QZkFtZlpSVUltZG1xSUFMYzBhK1pEUWpHMjdVenRud2haUGpJ?=
 =?utf-8?B?c1ZiOFNBUjBMbUtqcjVVYVhlcEJsbVFtL2luU0N1MzVlU1REb21meUJ5VG9B?=
 =?utf-8?B?MEU2cjZ3bXZJUzA3dTdyamQ5QUpLR3UxeUN6SHBFWjluNkQwcnVOWi9Md0VK?=
 =?utf-8?B?RGZ5T082OHl5Mk5BRmJDemUvdWpGYmtPVVRtR21tVEczL1h5SmZPNmpGSW9O?=
 =?utf-8?B?bmt2R1A1a2RIY2E2V1dIT2JUK0lqRVV1ZFl0SUhodjdrU0FGM09PN0o0Mkp3?=
 =?utf-8?B?ZzhXb3c1UW1XRnhwUUtRNWJzd2RnZFFVYmcra1ZKcGZTaGV0aXVSdFMvT3dj?=
 =?utf-8?B?a1ZWQzdoSDNnejRnKzU5Y1JZbncwaTIyYVFVb2NVZGJFMVNxYTNqRktCcW9w?=
 =?utf-8?B?Q3FYdUZpMHdKUy9HS01mUDJtRTh3ay9QMWlNWjBWRG5yeHlhZlBnUjN5eEZW?=
 =?utf-8?B?eVJuVG5Ud2F3SWI3YXVJNXpkTE9MWjZIUEJGZEo2NW9haTQxRFBMUGFZVzhE?=
 =?utf-8?B?WG1aMGRSUmYydWlzR0d6OTVySWhJUWpybS9DWWVUMHN0NXdQVWkycjVMTk83?=
 =?utf-8?B?alRZeFl1bTlqNnBFS29hZU9pZTVaSWMvZ3oybkdUSDJsM1FoQ25xdjliT1hT?=
 =?utf-8?B?SUdLekEyTmI5OXZwR0FmRHZ3azl4RzF2TGt3NVowK3g3RnpsQytzRll2L3Q1?=
 =?utf-8?B?dUxzVjNwa0RXMUVWd1dSbkRmb3prNUNpQ3RvZUNYeUVreCs5cUh5eVRjOEgx?=
 =?utf-8?B?S2VzaEZrYjlpT3YxOTNRWWRudXdXVm5lY053WkVtQnBKYW1xUEpOenV1ZWgx?=
 =?utf-8?B?U25TNVkyWTY1cTQ3VGFsWUlVOUgzNVQzQ1JpSkxreWpDQ1hycFNabHAwd3JE?=
 =?utf-8?B?SXJycGdHVkhJcTFYNklNblpIbGZSRStZN3BEN3dGVG1ndXdMMVhkVWpseVJO?=
 =?utf-8?B?MUxqaUk5elJPT085dHd2bkw5Mm1RZlhOR3E1ZERvYmo2dUEzVi9sVk1iNnJC?=
 =?utf-8?B?c0NyaWdHQXpobkpoblpkVCt2U2RtbDBmR3NRczZFQUp0KzhSbk5WT3UzT2th?=
 =?utf-8?B?QlhYQnVUc0lOb3hYNnJEZXlGVFBJUFFMZ0UvOFlIZE5ENXAyTm1aR0FpLzcv?=
 =?utf-8?B?Y2Mza1dNRy9RWDJ0SER0dkNKRkdPcGFqdkRxNVppUzFaS01nSEREWWhCekt0?=
 =?utf-8?B?cVV6MFFZSU96Y2lWNDdYQUR1UGdCRmFnL2VxZUE0OUlTUGJ5L1J1a1d1eGNq?=
 =?utf-8?B?d0dCTDVEcGF3SEFPUytpVi9od3czL2xEaTU0V2g1ZTZTZHArcWJvMWxOVEt5?=
 =?utf-8?B?TDdZT1lFbFprQ0lOQjJzSXhTMlZ2aTJrK2NjT2dxckQyM1ZxTnpoTitjd0xx?=
 =?utf-8?B?eHZ0eGVEeW83eDZXUklGQVluQWtTcUdNUTdiOVhMRFZvZUZLMlJuK0pRTEU5?=
 =?utf-8?B?UC9PMXJkaWNPV1VsTG83YmZJTXhrMTl6VW1CUXNheXptaWxTV0d6bVdMN2xG?=
 =?utf-8?B?ZXU2MnUzeVpkc3F0NFl5WCswTHlPVHZ0ZmIraFVPZkpNdS9kMW1LSHNOdDd2?=
 =?utf-8?B?Ti8vTFlGZnBheHI0R2N1eEJKbkNMYU1BQ0hxK3FLdXVCa2IxK3BsVGkwYWdX?=
 =?utf-8?B?Rk11WlVVNFhSZU9lamxUMGFMemFERzJVcVpuYXhHQ0dML2VHOE11Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a3b68b-3cd6-402a-1298-08de6d50d227
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 11:45:02.5351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJFqJhnU8eWqO5cAyfvQniBgjAZmcxL/m8i6MQPcWREFNaDn4cHUFUbmQUvVLWh4fwmTHOh/Rhry+0Y8sIWI9tUzdIgh1ydGdZ6V/4oesWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4965
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8956B14317E
X-Rspamd-Action: no action

On 16/02/2026 10:46 am, Teddy Astie wrote:
> Le 16/02/2026 à 11:16, Andrew Cooper a écrit :
>> On 16/02/2026 10:07 am, Teddy Astie wrote:
>>> Le 15/02/2026 à 19:24, Abdelkareem Abdelsaamad a écrit :
>>>> With the Virtual NMI (vNMI), the pending NMI is simply stuffed into the VMCB
>>>> and handed off to the hardware. There is no need for the artificial tracking
>>>> of the NMI handling completion with the IRET instruction interception.
>>>>
>>>> Adjust the svm_inject_nmi to rather inject the NMIs using the vNMI Hardware
>>>> accelerated feature when the AMD platform support the vNMI.
>>>>
>>>> Adjust the svm_get_interrupt_shadow to check if the vNMI is currently blocked
>>>> by servicing another in-progress NMI.
>>>>
>>>> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
>>>> ---
>>>>    xen/arch/x86/hvm/svm/intr.c | 9 +++++++++
>>>>    xen/arch/x86/hvm/svm/svm.c  | 5 ++++-
>>>>    xen/arch/x86/hvm/svm/vmcb.c | 2 ++
>>>>    3 files changed, 15 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
>>>> index 6453a46b85..3e8959f155 100644
>>>> --- a/xen/arch/x86/hvm/svm/intr.c
>>>> +++ b/xen/arch/x86/hvm/svm/intr.c
>>>> @@ -33,6 +33,15 @@ static void svm_inject_nmi(struct vcpu *v)
>>>>        u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>>>>        intinfo_t event;
>>>>    
>>>> +    if ( vmcb->_vintr.fields.vnmi_enable )
>>>> +    {
>>>> +       if ( !vmcb->_vintr.fields.vnmi_pending &&
>>>> +            !vmcb->_vintr.fields.vnmi_blocking )
>>>> +           vmcb->_vintr.fields.vnmi_pending = 1;
>>>> +
>>>> +        return;
>>>> +    }
>>>> +
>>> I think you need to update the clearbit for tpr (related to vintr) for
>>> the hardware to know that you modified the vnmi_pending bit.
>> What makes you think this?  The APM states otherwise.
>>
> The APM state doesn't appears to state regarding this;

The APM does state what is part of the TPR cleanbit, and vNMI is not
amongst these.

>  it's neither a 
> part of the "VMCB Clear Field" layout part nor the the "explicitely not 
> cached" list.
>
> So I assume that it may be covered by the TPR clean-bit (which is the 
> same part of vmcb); as it's actually unclear if hardware wants it or not.

This is very different to your original feedback though.

It's fine for review feedback to be of the form "have you investigated
the clean bits?", but if you're not sure, you must not phrase your
feedback as an instruction to check the cleanbit.

~Andrew

