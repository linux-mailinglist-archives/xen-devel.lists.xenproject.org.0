Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RY7+C5sYLGpFLQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:32:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F58967A341
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:32:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="p/O+8BCb";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336764.1598552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY2vc-0008Ap-8z; Fri, 12 Jun 2026 14:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336764.1598552; Fri, 12 Jun 2026 14:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY2vc-00089E-67; Fri, 12 Jun 2026 14:32:12 +0000
Received: by outflank-mailman (input) for mailman id 1336764;
 Fri, 12 Jun 2026 14:32:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wY2vb-000898-0G
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 14:32:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY2va-00DtjE-DG
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 16:32:10 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2c185e-2eae-0a2a0a5409dd-0a2a4504d830-20
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:32:10 +0200
Received: from [52.101.201.53]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2c1868-1dec-0a2a45040019-3465c9355919-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:32:10 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6487.namprd03.prod.outlook.com (2603:10b6:a03:38d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Fri, 12 Jun
 2026 14:32:07 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 14:32:06 +0000
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
 b=s4OQj5YJFJ4d40XUOE43mcInzOEemJuLXp2fZCVeYXTwAlyKI+lXfhAWCKrUkasGh1YG/4ztRs90cjg0WEePRoSmDONylFGw0QlpHH5LSAqk5NivtCrK37XOuuyZVc5G0N/s9iNhNwtoCXoBL1MGha9vPePY0mKYwxQb8fWwZrAuAOqV4Q9RaBfgxP8jLe6URRSqB5lBKKv4vvLs4zRni+xalPi/1qwUfFziSWwx2EKz5671lH+7IYJpyM3ZbeVKSu4+uoUJ+cGafQ6AFsKHgyv6h7hQpCKKHCtGFwRIDVMwzPQb/kkDrZCBlixopBjtN+4gYIhSoe16iIjpYONhEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AURvtv4vVA9cN/K59ZAkSVgMUUGll194fUr1pPUZS6s=;
 b=oNnVE/yZ6eF8lSpdzR4Hwjij1K38LWOSLFisnhKUyafFLJnegJNqGTzSaqfVBJnqXZeuYl6A/V9+8H2ABOKg1xYsT/m/6CXG6ZJDQxMJ8th+Mk84WGQlnlqeBCUTuXydKWEi9sORpsgYK3dwp1VQC5Gd/a2bFZraovmeK9CGeG14alJd+yy+UmautvgtrEefV7zB451PEX8NY+koZ3o2NfuvxX+uPF5YKwWJrDRHUijbWeHvp6hW+lR3jEjXmbragxbAbq6ZHj/eeAQzqY+k+6f2iiQcnSwkBk91yJgAj9T82vd3jVS1uY0rZ08sE/FUhzfFvcXpGNYQunlMP/Xt3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AURvtv4vVA9cN/K59ZAkSVgMUUGll194fUr1pPUZS6s=;
 b=p/O+8BCbbYThRjdGo4l7NNo2KfeqIimhLNlTt9F95xLa71STI06OBdkbMGDOPOtymQSpXlFKZmGZdXp3dyq8X8cD/uXR7hIhnyI4eDViN0S68Zq+sLRql5s3jtX3EbmZZLLHTVe9uspQFZirO8Z5I0sGSNUcYs691y0cQL3/OEE=
Message-ID: <48878ff6-ad36-448f-aa9d-6b37e2e179b1@citrix.com>
Date: Fri, 12 Jun 2026 15:32:00 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
To: Jan Beulich <jbeulich@suse.com>
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <aiwTkDUP6rDPbV6R@mail-itl> <0db98119-48f3-4edd-a422-8e50ee713b7c@citrix.com>
 <e84d6765-61fa-4203-a1ee-ac07f54a1026@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e84d6765-61fa-4203-a1ee-ac07f54a1026@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0688.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::17) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c22054-cfcc-456e-4a13-08dec88f5f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|11063799006|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	fVHaHU5h5i6ncMKrM8LsFM8sPnveH6FgeWgShX9Dsirlp6J2rpUPFilUa8ro5tQM/CED7nHbH+gWXGg3ZrjocaPXRPSc8zd1lljhQsMtXVIBuc8v03jMYB7LM9GZxrluexK8Owk+EckGDQBABCr013M+IoBb8XkhWWMyASl/qyeo2mgo4lE4uFpSLg0OGONCFLOjaob6dX1/Cw08YwXMaeQQAx8A4pFLMakQOp5yzORV568JqfyyCNeQ0K7SQhw/NNTP3M0H9+dsKZrMyMWVzujNko3NHWidXvNCvd9O1b6wpj58LZpovaYRtLzKdsSUeIFn9SLK/zjI1q3WNSdVt9ysGJyqkrynyJNHjfF2C/iM+UgYIXnijFpc4zl1g8S2+UFul2vybXXQ2OGF38Zc0oT/bJvWVS6K8i3qOOGK2H2nZIW4b7773ucdxFObMLS5PPiZg2+3WxANzJaqIFA9elN3eryXFe13jGFkrvtuGONF4P/LXliMOyyVYYAftm8U38rEf2Tj0EB9xdZFzW19b4AG2KRqPzm3Hl2aiwlwUeN8Vs8hr//qYaohfIQ9mVLNnEdh937rlAZYq6w0Hw/buP8MWfKAuZU0vcnZhq0Za4nm1ECScnPy0KuOb9kXh/fmAuGYCfqan9HgcLzdvnOP+CoE06VjKWPY722bvsYLTGxSE5D8ZlAJmtb2uYJ44URT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUtkcTFYaHVEQkQ5eUE2emhBZzZJRm5NMTFoZ3dIamovdkNwcXZaWFJqRDc4?=
 =?utf-8?B?d1NEMCtOc29ZWUtucU9TdTV3ZjZ6V1NlZk5GOHV1MEVVM1BWM21KQU9pT0h2?=
 =?utf-8?B?ZE9Ma0lybFRiN3hqTlpqNjE3YnpibU1BalBQWi90WGlyS1RmbHJHWVArRWxL?=
 =?utf-8?B?SlFMaFA3eWYxVUo1MWNPeE5JeGNrZVZVMTZJVVVBcjQ3TnVQbGQ4czFWN3hY?=
 =?utf-8?B?RjlPeU9DUmJEdEdUbHUvcStINE45MzZCL3p4SHRubEQ3bnVhSVE4V3J5SldJ?=
 =?utf-8?B?cm9Zd0lhUmc3eUVkM1FraEJudWYzTVhWUjNrVGJaTk1uVHU3QmhUOTRzd0pS?=
 =?utf-8?B?dlBxMFErcVJPU3NraFlLa3Ftd2xUQXg5VklYTUFRMFpsNHJVMVRWUjNSTWd5?=
 =?utf-8?B?U2R2YUpVUDR1VnpPWDJTY01pbThxMmVOQ056bmxGSGZDV1dXdlhDOGJDYzdD?=
 =?utf-8?B?NWJuMTlYOXI4MW9HS214OWpHODBpNGVVTE9HQkZXd2llUkxHMTcwUDd4QzRR?=
 =?utf-8?B?aUNiZ2NRcHlaY1FqRnhmQi9Oc1lWNXUyREhscTVVRnpHUDFQWTRMMXhRckVX?=
 =?utf-8?B?a3hSV3dPc2R4cm53YSs4Z1ZvRGROVkQxTTNQdFh4NlNzNnI3N3I3Ry9kQ1lF?=
 =?utf-8?B?OTA2RzhkN3U0aW9kTERiQ01hNUw0WC82amNiKzdNYklEdmtXRDJKTHdrbnRU?=
 =?utf-8?B?QlgvOWJ4bFU5U0hZd2xzdFVnbEwzQ09VUTVsa1gxZkdKaFZrbm9xdWZUQ3lY?=
 =?utf-8?B?S1hKb3FDeTVUZXNXTmU2cDF4ZFg4bFJoQzZlTHRYYTB6ZlBYNlRuSi9Odjhz?=
 =?utf-8?B?OC9KK1MzK3MxQVA3QjllMWhGMUYyTm54S2VnR3RSMlRQOXUzZGlqdmZqT3Nx?=
 =?utf-8?B?UVZjVjNTeHZCWTVsM3BwdWJ6a0tzRXBuc2JLcDhLS1NvZXh4aDhNbCtuY2hM?=
 =?utf-8?B?Q3RIU2dBSytHaHU2Unh5VkNPdmVWbEoyWmZMQUtpSjRyRlNVTWlCWnk2Sld4?=
 =?utf-8?B?OGZVaG5FaFBGMEFGWGRSMXRhTmJEcWNHbzk0V2gzdS95Z3VhS1k2WjJFT2pR?=
 =?utf-8?B?SWpTK1NhTk1LOFl0d3NESWhFT1JkVW9ZMGVqem9FZENlb0NSSWNCNWVpM2M5?=
 =?utf-8?B?Rjk4NUVFNmsyZGg3Y1RlR0Ezc2dDaUZtVEdOcjc5VjJiRG91ZUpvWExWQ0xY?=
 =?utf-8?B?S2NweVBZNXpDUk5PU2xjVi9OUzBnSWk1d08rQ0crcHhwQnlyTlNmS20xTFJG?=
 =?utf-8?B?ZkxRNGlMWWtFeDVnUU1qakQ3cktXb0pGQjRsQkZ2UjIzNE84eXFYaUYzb0hw?=
 =?utf-8?B?YjBJb1VQaDRUUFVXOXJEaFkxR2U0RkNRNnVZK2I5U0xjSlFsajVlOWYxSFcr?=
 =?utf-8?B?MjNVOXBqd1NMZENvQmdlZGJNWTJKWnZzTmsrNTErNVlGMkQ1S1VvNGJtYUg0?=
 =?utf-8?B?Vzl1SnpJc0FXQ1lUUmJFVG1SZjV2bnM3VmZHcXRKNERyOXNsSW5lWXRhUVFV?=
 =?utf-8?B?TEJ3alpKTFpxYVRUcmdGcW9IUzRObEFVNEtvS2hTN3RDamZoN2tycVZHY05O?=
 =?utf-8?B?MkZTaUxIUm55bkRVMEJMRzNqK1JvZ1Bob20rb3cvU1pQc3RnVisxSWFpTDIx?=
 =?utf-8?B?dHF4TitDOTcvREhvZnJKTW1jQnl0RS9lcjdxZ0kwTVVIY2EwSldxUXJJeHZW?=
 =?utf-8?B?SFFLZzM1c0Z6d2JWSTd3RW56MFRqYk51cjFVVEpNYzZxUGE0ZlpPQ3RMVVJY?=
 =?utf-8?B?YXNQK1VsQzdGY1M0MnJzUDFOUFIvVmpxSVVENWttVkpJMk96QnBDanczWE5F?=
 =?utf-8?B?WTB5WERJNENURVVDQmtRMC96bW1jbDVRSzVFRGE0QjlzdFdDZGtEOXRVbmsv?=
 =?utf-8?B?UjJzVTQ1S2xSY3BRVmo4Sm5aYVJWWXQwdmZQTkRFbVNVR0dBMjg2bGtHdmk4?=
 =?utf-8?B?dE5xMXNmUkhtRkp5SHZYdUpiYnhLK1JUWndwME1xS2Vtb0ZvY1BxNnlxdENp?=
 =?utf-8?B?YWIzanNqeldVZDRydUx0cDY4cDRCOW5PWTA1UEV3UVBKclhlMHR0WjBsM0pZ?=
 =?utf-8?B?ODhHcTB2UzdSaEMxamt3MFdqRkpLN0gxRXJjdEE0SkRpS2lJMTFPUFJQMGNM?=
 =?utf-8?B?R1B3bndwUDdOaDNzc0FrUENoZUNSUmx4WWFWU3hLQXUyRkhtczU1NjNXTUdh?=
 =?utf-8?B?ZGNpdmxMcVRlSjltTDRDOUFZZ3VjOVNzYmgzSHF1TmhQblQvZTAvc3FnUXV0?=
 =?utf-8?B?dENWR0lWekU1T2FnR1ZGU1czMXNLY2VheVVQcE1NQmkxWDFoYnhodDJrZHBL?=
 =?utf-8?B?YnN3U3RjbnNlMEZEZytPUTZCN2d4Q1d6VU9nc3BpdnJSK2xzZFBNUE4xUVcx?=
 =?utf-8?Q?TWahCqQExq60k1jQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c22054-cfcc-456e-4a13-08dec88f5f2f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 14:32:06.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOmN+q0L8dLgXszELqn/MOcAVsZ4BN3atClImKWBtRuCs13/H8mAKSJ8T4w8G4JCDoeYho7+5qGxU5Noy//09d/ycqAEhg629Yts9pG1XsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6487
X-purgate-ID: tlsNG-ebf023/1781274730-28B733FF-3CE23705/0/0
X-purgate-type: clean
X-purgate-size: 2716
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:mid,citrix.com:from_mime];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F58967A341

On 12/06/2026 3:20 pm, Jan Beulich wrote:
> On 12.06.2026 16:18, Andrew Cooper wrote:
>> On 12/06/2026 3:11 pm, Marek Marczykowski-Górecki wrote:
>>> On Fri, Jun 12, 2026 at 03:53:49PM +0200, Anthony PERARD wrote:
>>>> Hi,
>>>>
>>>> Since commit dba44e051209 ("x86: Remove fully_eager_fpu"), I can't boot
>>>> a machine and get assertion '!is_idle_vcpu(v)' failed instead. It's
>>>> netbooted and EFI.
>>>>
>>>> Xen call trace:
>>>>    [<ffff82d04033da2c>] R vcpu_save_fpu+0x65/0xdc
>>>>    [<ffff82d04029c5c4>] S efi_rs_enter+0x37/0x16a
>>>>    [<ffff82d04029c7e3>] F efi_get_time+0x19/0xb2
>>>>    [<ffff82d04047cbf0>] F init_xen_time+0x1e3/0x2b4
>>>>    [<ffff82d040477a49>] F __start_xen+0x1d71/0x24b8
>>>>    [<ffff82d0402043e7>] F __high_start+0xb7/0xc0
>>>>
>>>> Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>>>>
>>>> A few more lines from Xen:
>>>>     CPU Vendor: Intel, Family 6 (0x6), Model 86 (0x56), Stepping 3 (raw 00050663)
>>>>     Bootloader: GRUB 2.06
>>>>     [...]
>>>>     Enabling APIC mode.  Using 2 I/O APICs
>>>>     ENABLING IO-APIC IRQs
>>>>      -> Using old ACK method
>>>>      ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
>>>>     TSC deadline timer enabled
>>>>     Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>>>>
>>>> Commit this Xen is built from: 50936ea05660.
>>> Interesting, the efi_get_time() way is nowadays a fallback if cmos one
>>> isn't advertised. Can you try adding `cmos-rtc-probe`?
>>>
>>> Anyway, surely it shouldn't crash... The commit you mentioned has "No
>>> functional change intended", but well...
>> Well, no intended change.  It was a very big patch.
>>
>> Nothing should ever be using efi_get_time().  It's unusable (i.e.
>> crashing) on hundreds of millions of machines.
>>
>> So, while we obviously do need to fix the assertion, this is "only"
>> collateral damage from having fallen into the efi_get_time() path in the
>> first place.  That wants investigating too.
> Perhaps a reduced-hardware system with ACPI_FADT_NO_CMOS_RTC set?

The identified system is a Broadwell-D.

Come to think of it, there were some systems of that era which (falsely)
claimed to have no CMOS.  (An HP Haswell Blade comes to mind, but it
will be a similar chipset.)

> On such systems efi_get_time() would better work properly.

Wouldn't that have been nice.  On the bug I looked at at the time, it
was just as broken as prior systems.

It's a vicious positive feedback cycle.  Windows and Linux ignore
efi_get_time() entirely because it's broken in a way you can't probe
for, and as a result the codepath get 0 testing by OEMs/ISVs and nothing
gets fixed.

~Andrew

