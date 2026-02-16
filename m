Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pNvYExzukmnr0AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:14:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD11142436
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233904.1537279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvcl-0004dg-4T; Mon, 16 Feb 2026 10:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233904.1537279; Mon, 16 Feb 2026 10:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvcl-0004by-0v; Mon, 16 Feb 2026 10:14:39 +0000
Received: by outflank-mailman (input) for mailman id 1233904;
 Mon, 16 Feb 2026 10:14:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aABt=AU=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vrvcj-0004bs-5g
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 10:14:37 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 486f2180-0b20-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 11:14:31 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7804.namprd03.prod.outlook.com (2603:10b6:a03:5b3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 10:14:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 10:14:28 +0000
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
X-Inumbo-ID: 486f2180-0b20-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GM6UOQxSUY+R9Vume5lJvcffALa+qoZjQPMQs0m4t87nSCHjPKiyeH/fWetJfBktxCnPuP0l5mNGeYd+JrjlHud0t6iDlim+8FRpVuOp/V631M2vRnt6wTLjVn/e5Zne2HY4k06TZjyASzdoNYhDGTcDt5d10i2TMy9B32wo/eyrlmDlt54HOzhZ6+/iQk8Di3hPgzAgENoqaqMM89O1xLmERSj/GyFz6H5VUIbvo1PAMG/CV41IPjXnVLEug89zTBajaleR78KlAsz+NOEDjsbmo27eCBBLfbKlCr6l7/uVrNkhw+nXhxtlESpZ2Qm2MkhtbzmCId8MZWAUnAmFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ki1UHin1Xk/+GuLaOf2MIjw8v0BY//wyyAupNa/EDDI=;
 b=TxL4ZJ11ZxpLpkVLJoCIbh2oNhIv4nwJblnnTVtd2UD6emlssDdSAFLhXAJDxaZOhJpm9SHGynbbSYmE153DFyOBQLX7nw/8nICvrEjJ/rJQR0Ja8nLanalVIJRU7vK/lkIsuGCyXY0j04Y7Id6aXZfjg9AaZ9k96YWaOoIeWiyvrbNkBmcZiF3A7BNvr0Uwrxb4+zEi9Ku5j7I7uGoarZ7vZig4jTayR61ZmULLXG0MuYuz5kGAWUhEm1QEJBmGJflRyXbCf94+qp0506zB8CCOCNeXteibrqMQNpMV8OFoW2WIgCg1nC6gn/CD/yhDGlCbvejESUoOwqZyVFj7jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ki1UHin1Xk/+GuLaOf2MIjw8v0BY//wyyAupNa/EDDI=;
 b=HGXcFsoLzKa7nHU6Aw6GmMNlSSBbEjGcI+9fP9bdO2qoqBraYR4nJ4L3RsK3XjJNhWww72b691ymRY8O8HkLZpY5MYhdELnSIQV3bzJBObrhM8l/e+3JXXs+bk1cpJPG74QweUXoQjNGIq0+6zrkzvQr5c5yjUm2KyjXOd5KhuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ea21a66e-a4ab-41f9-92af-0111292ecb3a@citrix.com>
Date: Mon, 16 Feb 2026 10:14:24 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v3 2/2] x86/svm: Use the virtual NMI when available
To: Teddy Astie <teddy.astie@vates.tech>,
 Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
 <ccd7d351fcf47e6a74bd6bdfe3fe8bc9f5023e7e.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
 <c0c2e0cd-173a-496f-a643-7d19c9418a2a@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c0c2e0cd-173a-496f-a643-7d19c9418a2a@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: baf96be6-6d78-4d33-a792-08de6d442aef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjdNS1k2QWJ2QlNBUml0bXpBWnoxYllrbU4rTTlCdU1RNW1FNmhPR1ppdmYx?=
 =?utf-8?B?SEdmWm9qckpzeUpIU0JnL1l0b2xiZ3RQR1lxMVJOKzMxVzZMcnJtWUhlc05W?=
 =?utf-8?B?cm9YamZNV3ZhdVM5dmxPbm1VbVc3YVpQenhxd0lHZCtFdDlNcWNjSjZ3aVNM?=
 =?utf-8?B?VVZPd00wU0xYQ3pyUE9Kb3ZZV0tVZ3AwTXYwQUxuQjRoa250aEN3SUwzN041?=
 =?utf-8?B?QUx5NGt2amFQQXhoV3p6N0xLd2Y4MU9LM0xycmszNVdjbmJ4SE05eDZpQWI1?=
 =?utf-8?B?bHl2dWJ5V0R3a0ZEWlBjcndjM3V1ZG05VGFKNzhXZ2hVNy9NbHZ6anpMVGN4?=
 =?utf-8?B?UVdtRW9GTklEcUw2NHV0YzJEYlR2RDU3S0syV09ZRmN4Y0VUeHRlN0xXMWlI?=
 =?utf-8?B?UVBPTlZFdUw0Z0hRdWhNMHVWcmZJNkI0Uk4zVWVVU1hremdLUGdKTXJsUWFV?=
 =?utf-8?B?QnBZNGU4TXlxYTB0SFpNb2daSWJ4NTJhNEZsNHh4dDNyeENDcHJpOGlTRHlL?=
 =?utf-8?B?NEkrZnd4cXJsV1pYZlpHckZiVFpnWVpJaGdzKzBwNWVlTS9DeWxuS0g4SzFJ?=
 =?utf-8?B?dkVMZUYzR0ZoL0pOWUlHcmVXRTI3aVc4aVZLQmliQXVrNDZUYldUVndiU0tv?=
 =?utf-8?B?dngyK3g5UlJaRkdtMk9HQ3QwQUJMZytTcUJkMTMwOXRSWGJTV0dqVE4wUnVL?=
 =?utf-8?B?U0Nlc2xNYnJBWXhPR0JkdTlEbzA3SGtTcWpCc3pGeGx1aHN4ZzhydloyZ0tW?=
 =?utf-8?B?em1ydGRTcytpYmJMTE5YV2pGMCtDZC9oZzVRWitYejJ6Y3UyV0xHQy9MSjlr?=
 =?utf-8?B?dGExT2JQVlFJblRGVzN1L3ZvKzNQN1ZxS21mc3VxQUFtUmVpZ01hSGV2NWJF?=
 =?utf-8?B?ME0vVFd0Tkw5OTFGYUhMZXh0d0t4K3Vtc1BPQXNxemt5UTNXRkozUlFHZVBN?=
 =?utf-8?B?N1JtVFNJL0NPUHJ4cEp2M2JMbDdUUTMvd0tvbU96dGpKQmtyM3ZSckZ2WTd0?=
 =?utf-8?B?eGdsRmt5QVFKQUpScXQ0SUdVajNqU05XOHpEcDBMaW85MmtGbVRUbmMxVmh3?=
 =?utf-8?B?cGJjdTZGNUNLeUpRM0ZZT3ZwbUtnSzA2NUZnN0s1a0NiVk9CRkcySzViNVFt?=
 =?utf-8?B?aWJqUnVuTTNtS2tTTlFxWGJacklvbEg3WGpmNGIvRVN4OGVsYWFia0Vhd2R3?=
 =?utf-8?B?KytKdHE2RWtYb0JpM1lSclZXYUlNSGtHano2ZldUWnNpQUhUSWprWG9QejEz?=
 =?utf-8?B?Yy9PcXd0WURVUFRZZyt5SktRRjlrTlhRdHg5b1pGOE80dk9lYmgwa2t1WFoz?=
 =?utf-8?B?YTY1bVVSQjJzVVdrc1llbDgrTFFPRDBwbzlNSWhBZHFDMjNybkZmM0hzTDRm?=
 =?utf-8?B?TlFoZjNrN2FmNUdjRnNzS3IweERRQXVydTdJOXpVVDNpYk1yMHBCZ1dXSU4v?=
 =?utf-8?B?VGdsVjNhV3RsZjMvVTBkV3ZGMTl5U1ZLdXJUdWRhbnBvUWhwWFhjUDBEdExI?=
 =?utf-8?B?cEx0QUlBTUZOenh5bUp3dzVKekFvd0dYcFNqZXpoaGpGajZ3L00zZVBHRVZJ?=
 =?utf-8?B?a1M4YjdSbnFLaDNIa2pZSlF0UXdjREEvb1FpK09KTVBCR0o5OG9sTTkwaC9q?=
 =?utf-8?B?Qmo0KzZQeTFPZjZHRXdURFR0MGhBNHlTaFZBSUg2d0hRRk0yUUY3ZS9vY0xG?=
 =?utf-8?B?aDZoZFpQMERmUXp2cDFMOFB5bFRpNWZrVTJXaWxyWm96YVZoRWRoN3hFNGV6?=
 =?utf-8?B?SDZ1b2NTdk1DTVlLY0M1enN1Nmw3TWZHNVNBelc3Rk1jNjlFc0NkMFBQNTdj?=
 =?utf-8?B?TExLOEU2Vm12ZUNsRnFXWmpZbVpjazdtdWMrbDFIYlZmZXlIamJKbmVhRi8z?=
 =?utf-8?B?WHN0Z3VmQVBYbUZIZUJlSmtLMHFOS1F0dU9sNmlGbHlEYjRYR0JQaWpZZXpy?=
 =?utf-8?B?Rnp6LzdMcXRhQzZsUmNmWk9lNTIxMVZ5UUx2WFZCaXA3OXUxY2Z1NHhBd2Uv?=
 =?utf-8?B?enZEdjdjamVlZDA5YnpITDVkdGZzRk9tK01OMG1rbjdWNnRmQjNJT3dBZHA5?=
 =?utf-8?B?VVp1eWkzUll5QUcrenR5aDl5ZTUzekQwQS9sUzVqdThzRWhkMnVpbkZ6Rmto?=
 =?utf-8?Q?3PAw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnRiWW5ldW5TYUN1WkptUU9tN20zdmtGQnRjTGdsb0J3ZVc4TXYrdFRrQ3R4?=
 =?utf-8?B?Mlp6cCtsL2cwZmVZbDlCdVJOdjlsc3dsbFRpc1RGSGlPb0IreWxmQjFvRXlV?=
 =?utf-8?B?U09yaExXeTVoNit3Qy9XUVBXNE0ycUlDQXN1eVJTWTNzbzhMYjJXaFhtVk1X?=
 =?utf-8?B?U1lIOTI2MDdCRERMc0w2cDlkZElOTlNhMHd0eDRwSENMaWRJV2RvWWUrTWtF?=
 =?utf-8?B?OVJuT2NteDhlUjRWUUtMQmhYREIvL0tteHFjVFMwdm9hZzlpMHAyeFZEYzJZ?=
 =?utf-8?B?SHlDZDlhTlZUS29TT3pHUkg1aWljOUVTRXYrblhzTjZGek9ZK1J3ZFY0V2dj?=
 =?utf-8?B?bnZZaFZRRVZXMkx0emZTcHhRTDdROWdBS3RYVnN2U0tpQTBObVFwN2krdEty?=
 =?utf-8?B?cDJsSm5jV0pROUFMa0Nlei91NUxCUkw4Mks4YTA0OS9ESnZnbWREUlNJN2pj?=
 =?utf-8?B?eXJCa2ZzdFhYZUZLRVEyWUQ5NnFZSEJyV3l5Y052QlBjaVh6WVM5VFhBSVZ0?=
 =?utf-8?B?SjVyOU1sSm9OeTMzM2o4K2ZOMHBsb3lGK2I4SUdmTGZaZWVnNUgrMmpqdDhG?=
 =?utf-8?B?WGR3TE9ac1lIYnhtMXJ1QzhZYWJvcEZWcjRmTCsydTV5VXdpdnpaalRleXY5?=
 =?utf-8?B?MFlTb1B0UXdrOWZZaVZwNm1ralA3bzRLQmIxKy9CNUdzbTRrY1dZbGtYRDYy?=
 =?utf-8?B?Q0UrSm1jbndURzZYdE9WSFluUlg4aGVXd0ZWV05qWko5eVFYUXV0c3JKK2hZ?=
 =?utf-8?B?RUxtQWx6MCtlMjN6Y0gxOHZNZkpRdGxodjVjUWRvVjlxQXRac2tzK0NhV2gv?=
 =?utf-8?B?VUNjWWVhRE90MzlRdGgwSjVJRCtYVkNBZ0JKanhDaytyMms4VHpSLzFiSXBi?=
 =?utf-8?B?aGdFUllYcUZJM2crY21FZ1FHT0hXU25zZTNCaVlUMndHWjF0SFJseGszWFJh?=
 =?utf-8?B?OUYwckpUK3ltdHduNzRZYWNMVDRaT1oxaHRwM0hzN3BvZDE1Q0Noa0s0RnpB?=
 =?utf-8?B?c0RIS1NhNitPbURkWFlJd0h4TE9mdklORXR4c3lWR0NBd1lITlZwOENrTm54?=
 =?utf-8?B?U3E4ekkxSEdqMnVQV3Z4NnJSK0pvZ21vY2hVT1NFOStTTXRoOE1HVHFPR2wv?=
 =?utf-8?B?Z2d5eFVta2JXVlhaZ1ByZnZJc2JMV3IvM1pDWTlMOG5nMVpQQ2l0dUNmQU5N?=
 =?utf-8?B?NnVOK2JFQ29temhON3k5aUNSelBxQllLbWY2Z053UjUrMmtoSVBxY0pTRWFn?=
 =?utf-8?B?NVplcjczZUhrTkZPR2RmU2RqRkN6L2FMSW9NZ3FQNHAzQUZ3eXlGUVpyWnE2?=
 =?utf-8?B?aWVTUXh3RzJLSTRMWTRSY0YvVTl6NS95UHdRbUZLZzl5OTkxbzdEMlcxRTRP?=
 =?utf-8?B?ZUhtM0M3Ly92SUM0aVlmSFdvUiszdVhZaXFKbTY0cFd5cTNiam1TR1VJcjQy?=
 =?utf-8?B?V25NcjNYS0lyenVTL05pcFlWNUZreVBoOVd3WEhRbkd2ZDZpSHJ1cnNmdmVD?=
 =?utf-8?B?Nm1DOXhKVUdNOEtlT1haSDJuVFFkdEVhdjNqQzlGbjVwVzlLcEJsMDdtdG05?=
 =?utf-8?B?UXZFRHBVaC9JbnZlT0VkNjBYRFo5dlY5UEdOdlJ3U3pzcHJFUjliU2JQUGNR?=
 =?utf-8?B?SnQ2bjZmK2NYRGplQUYraVpnUk5KZS8rWVFzU0FlaE5FT2VhM09ZVE44bDhl?=
 =?utf-8?B?WUREbjhMZ3JvYW9YRk45UXluR09kTWo4eTdZRkRrS0xqb1lUc0MzY2xOamFK?=
 =?utf-8?B?RzE5Yy9IVkIyQVBLbUtBbmJjK3NKMXA5RTVSV3hQc0tVd3BUSkJiSGxNOVRt?=
 =?utf-8?B?U3hoTlhPWXh2ZWI1OHkrVjU2OGRNc3VjQUl1dnVvQ3VKZGUzNkVBeUU1RFpn?=
 =?utf-8?B?MGYranRxQm1HTUM3bWNQeTFhSlhMVWlzQWh3WG1aTWNoQTdsLzN4YWI2aUIz?=
 =?utf-8?B?OG5qM0RiamFibzlteVc4bzlyYTBRK01zWUladjcrTHpGZmZydERKN21HbktZ?=
 =?utf-8?B?UjdIS3lFV0JSTnA5SkhUaGJBQlJuQjNpVUJnKzFPVGFDbVlMbll5MTRsR1o0?=
 =?utf-8?B?THFWbHludFlmOHo3VmM2ZWhBWTYxYjJPYW9FWjNiTWdIbktkVWlLOVozUFVl?=
 =?utf-8?B?OUpSeFF6MUxlK3M5L1hFaEt4NlFVZHJaRFVXTjhJc2pmUVlUbXZJSURMNTFW?=
 =?utf-8?B?VUZwZndnNDV2MFVWR2w4VGhoV29KTXNWUnMvNzBiZVNycVdVaHU2YkFTejdv?=
 =?utf-8?B?SkE4c29tcFJoVUtOMng1YXlxQmxDekM5RExZYno2UmtSMHpqUG5kYjlGVHhO?=
 =?utf-8?B?eEYrM0hOWFU4QldrTXVucmJWMnZLTWVTMWljelJsYm5tRmduWmdjQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf96be6-6d78-4d33-a792-08de6d442aef
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 10:14:28.0417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4SMOHAqtKnIYnfBFBl0Gsibs1p2qln9YdjxfSFvZRUejoTd9VevpMJlwW2TgmBfrbpJLetdKZ7X5Zj+sNty0VXsityQXfQbDSbVGdSfXAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7804
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: ABD11142436
X-Rspamd-Action: no action

On 16/02/2026 10:07 am, Teddy Astie wrote:
> Le 15/02/2026 à 19:24, Abdelkareem Abdelsaamad a écrit :
>> With the Virtual NMI (vNMI), the pending NMI is simply stuffed into the VMCB
>> and handed off to the hardware. There is no need for the artificial tracking
>> of the NMI handling completion with the IRET instruction interception.
>>
>> Adjust the svm_inject_nmi to rather inject the NMIs using the vNMI Hardware
>> accelerated feature when the AMD platform support the vNMI.
>>
>> Adjust the svm_get_interrupt_shadow to check if the vNMI is currently blocked
>> by servicing another in-progress NMI.
>>
>> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
>> ---
>>   xen/arch/x86/hvm/svm/intr.c | 9 +++++++++
>>   xen/arch/x86/hvm/svm/svm.c  | 5 ++++-
>>   xen/arch/x86/hvm/svm/vmcb.c | 2 ++
>>   3 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
>> index 6453a46b85..3e8959f155 100644
>> --- a/xen/arch/x86/hvm/svm/intr.c
>> +++ b/xen/arch/x86/hvm/svm/intr.c
>> @@ -33,6 +33,15 @@ static void svm_inject_nmi(struct vcpu *v)
>>       u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>>       intinfo_t event;
>>   
>> +    if ( vmcb->_vintr.fields.vnmi_enable )
>> +    {
>> +       if ( !vmcb->_vintr.fields.vnmi_pending &&
>> +            !vmcb->_vintr.fields.vnmi_blocking )
>> +           vmcb->_vintr.fields.vnmi_pending = 1;
>> +
>> +        return;
>> +    }
>> +
> I think you need to update the clearbit for tpr (related to vintr) for 
> the hardware to know that you modified the vnmi_pending bit.

What makes you think this?  The APM states otherwise.

~Andrew

