Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL6HCRF4pWlbCAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:44:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE0A1D7C04
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244219.1543681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1gx-0003od-1C; Mon, 02 Mar 2026 11:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244219.1543681; Mon, 02 Mar 2026 11:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1gw-0003m7-Tl; Mon, 02 Mar 2026 11:44:02 +0000
Received: by outflank-mailman (input) for mailman id 1244219;
 Mon, 02 Mar 2026 11:44:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OlTG=BC=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vx1gv-0003m1-UU
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 11:44:01 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a8ab18d-162d-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 12:44:00 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by PH0PR03MB6463.namprd03.prod.outlook.com (2603:10b6:510:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 11:43:54 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 11:43:53 +0000
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
X-Inumbo-ID: 1a8ab18d-162d-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMBDs639lkP+09vycFAWTBFVcfFSnuUofY4Af+mSBv7ziicDbkl+voCcz1nbgLCGgOWpgAZphhZGZIm54GlZIqmKrUsgtetVczwxBkrQW8XpSCBd36HvuJxZZX0GHoVLGrTMs+LrKZLbEt6tMJhuuUGA4bkjJP0g6yh63hrWfdcb0NYY06R8HpRwa0hYGpysgTupmaqN3ZRrDoDfwSxWu6C0YLcOxAVZY2dvN6MDTTt8O9fjsdc0V+x7Aax4/c6uZ762yT8azGn2qA1jRyHp5ilLQa40Te47+QsiI40SJxxz9/HfWmZL7vLn8V3H4UgHf4w+ntwqizCQqP9doHROSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdKqbfApDT1CGXFK/RBEqtP1Ct6LWFNhZV5lNBvvAYw=;
 b=bDWWY+OMkgvuKkdiXfs9q58q/T+RvDFT2g/vcqteT957+myjBU3wtjjkuoscXDZQvxj/XjZK6765Lb530FU47W3qrPyCtLZ20Ly2jXkW+GOyt9LlfaJKStHATjLtqNJ2FSdGpzuROiOmnkSmoPffh/6CYjY2W4+mFjgFWDYJ9tW42qqE9w4ZWe5ewbNGnr8JLhTalV7ncum5l0jeikFChDgBdzspzQG2a7sNiAydDnwJ3bGutUBXbLDsHT6aS1sOVRiNsGhVWzY4wYLg6oiL6eFkdcL2I/0wHawl8UgL8glT4qKVbQSjg9BvH9racQx5OZXPsXVmNM5TRGxMfRvhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdKqbfApDT1CGXFK/RBEqtP1Ct6LWFNhZV5lNBvvAYw=;
 b=PwCNMQo/qQvtPdY1LmqA+asq9P8xQn4PFV88BTTFDMQSYvldTDslxrILs8iIAvkMPJoRfTcm4zjtWtEkhDhNAub59qdgejoQLuD9TnNyS+5beckEm35xd5TgkOIOEM3CNBebv6ZPEnEmi0qP+vgpBoQgXweYudbAs8nFhOMXbKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c8013b73-de27-4354-9e45-da7d47c8b190@citrix.com>
Date: Mon, 2 Mar 2026 11:43:31 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 01/14] x86/pv: Don't assume that INT $imm8 instructions
 are two bytes long
To: Jan Beulich <jbeulich@suse.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-2-andrew.cooper3@citrix.com>
 <bf83838a-8401-4eb7-aea8-25ce59c9d492@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <bf83838a-8401-4eb7-aea8-25ce59c9d492@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0423.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|PH0PR03MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3976f2-ae79-4d83-e478-08de7850f551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	sylWef5OMXMuWyo4wZoZT++iQemLLiJt2t3kjihcpXl0099qIBKEwRzmuzd4q/7YWIfJbS63mBMDZntSW978osqLhFmbyD9QMkjhYrUO40O+A18NyXzHaaYqNGHtjTKN1WMf8GIslNUqkKxgYFxusToRgRrn4MNhrHqHlEv/esRg4RfUeoV6yfyRksbNsCxEfvGtT3cZmgWckbi+pwRshVre4gvH9HNvC/GFfv2EhzrlTCAVIK02nGGp7PRk4RYaXnw8lNuCdArT+aMxSd/uYoIIp89lGzbO0hlTJLMK72xpbAOnZbYfXh16G/OnEo9F6qxjmcmDFCi/YkwHm6KJsFrg+6PT1Y9OTkE+rNbPqLl+zlMNy726glBiE0ZT/VBXIX1Lny3JCmA/+SDHIQYrqQNpqiHZUF8a5z/Fb8iI4BU9mLbBi2LaAFcStpPfaCQnJR1PtHf7js3QZOjMSZPU/klxl8bTgomEvpATUnakgpbPtFxdBQfb71myATGKlSh6cf5Cms+03pe+HI5PGRbs+3tj/u+A3og8wtdkbdQ3yIKfWUAlMF6PwnRoqb6i2wpWAJ+KrKzPP+k6yz5vv2nXkvc1kBIL5KY5d6BiAwTUdG4z4l3wDjpNl9DlRn3fOuiIY1SoedYIBW+OI8SxokPVGXl5rBXj5HGcvYVdUt5NzZVh77KLDs2qZVFBPhCcxDhNlB8HJXU2S+jt6Ov7DiF7nOVls+MsQruw66iyq6GfDrw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVI2bGdyREU4bjJJeUpTQTRScG43emRaUE9qcmlCN3JUNzhOVkl2dVNwMFMz?=
 =?utf-8?B?WmMyKy90aXAwaUN5VFFYZHBGNkNBQ0hPU3RmaXF5K1JzS0g1UjQ4TDZkQ2kz?=
 =?utf-8?B?TWsxejV3aTFMSkZ4UjNzQWtQMUY3VWJQeHg2a21HRVlKeDFVTkNJcEI2VFha?=
 =?utf-8?B?VmQ2aTFucGFUWkNNemdqTFBKSFFQc1pCTVlGclZuZzF1aGtqSzUzM2E2NFBx?=
 =?utf-8?B?T0JiSVdIM1dJTm8vZFZ5VVVrT3NINVcrR0pkVGE5OXhOd1RBODlYZTI4SzAr?=
 =?utf-8?B?cTZpUld5MjhQaGIvejZwUkp1Ym9ESXI0ZXJoeWxYZkVWZ2ZUN2w2bkpCRE1h?=
 =?utf-8?B?Y2twb1lZVVJ0dFZRK3NhRG10eXFSS0tiZ0tkbDBEYklseG5QL0c4d1owZzdr?=
 =?utf-8?B?MkF0aEd2K0Z2RkpkZGV2WTRTaitZWEFRTDQ4RWJtTVh2aldWUDdSZC9CZnN2?=
 =?utf-8?B?MnVtQlV0N2xFVHZnZGs0azRZUjNqSFVtWUF1VENqQm11MTZ5ajRuUHhyTzFi?=
 =?utf-8?B?d29mS1hEYzVyay9TWFFRSXcrK2JOYy9HVGpJc3l1VGcySU9KY2J2V0ZZdmpD?=
 =?utf-8?B?R2doK3BYTVRLODBuSEkwK2I3MG1NbC8rN1dyV2k4UDRYbHpubVFJMXZNNnVH?=
 =?utf-8?B?YVVTYUNMeW9RS1h0T1E4L3JqMVVLRHNMRE5NdTNxRXhTODhORk12a2hpNGtK?=
 =?utf-8?B?RXRNN214TW5SeEFUWklCQmtBZzBFeUhiUUpkNU9GcFpwUTB1dFdWcWdObFpC?=
 =?utf-8?B?ajk1aFBrbWxqN2dsNmNPMFlEczMzaGNlQVlpNGJhRTQwWm1jNXZ1RFBja3Fi?=
 =?utf-8?B?N2t0UVNYd1d1VDBsbTZpU0NRNWZpMUwzd1h4Q1M0aDM2YzZKZ0dvVk5OTUhH?=
 =?utf-8?B?MzdsSStUb2NzVzU4NTdLSGNEbFliYmxBeDZ5a3NScDZjNlNaYTNiU1J4enRz?=
 =?utf-8?B?Mll3VVMvTWI0U0g0RVFVNmQ1a3R0dUlaNURkRU9WMGV6ZUg3aEFEWEdsUC9i?=
 =?utf-8?B?SkI3UDVIcGFhYXZCRDA4UG9uVlJUbEVraHJVZ3ZzZzdhUzk4VzlJZldtUVpK?=
 =?utf-8?B?a3c3VGdPbUp2MHhHSU1GM01lSXRTV1hzYnBzakw5Ti9mcXVOTjRXSjFhK3pL?=
 =?utf-8?B?VFdWbTl1Z3gzdENGc0ZBRnNMZ3hUQ3dNM3RrK0xybXFhTEhJRUx3Tko4VTNk?=
 =?utf-8?B?KzJIL29wM0xsaWFkNlNzS1FWUS9RZVo3Zm1zTy9EVjR0MnByZUhXMitqSFpU?=
 =?utf-8?B?bEw4ZWhuWlZOd28xaURKamV6SmUrL0Z5a1RiVE85ZS9yNGtBNGNCNklRcVFQ?=
 =?utf-8?B?QTQ4TlZHdXpJNXN4UWpWdXk1cGlBV0VwWHpsMk9BRGczL3FFdFl6SVBhUlM4?=
 =?utf-8?B?bmRZckNCamc5T0pvakZrN0gvQTNVNC94bWxrcjBtSmoza1VCR3lHcjdrbnZr?=
 =?utf-8?B?OUYvVGVLV0VUdTJ0ZGF3dWFMZHNuLzhtU3h5LzFoK1dYTUZWYzBjMWJmMFAx?=
 =?utf-8?B?UlJEMVZFdVJpL09QbGpSTVVVcWw1dlNCYXQwelJvNEgxWGQzTDVzWjllOFZx?=
 =?utf-8?B?azhZakJNZTdUQ2JDRnZmQ0pkcXdORmswY3ZpS3A1bzhsbEJ5aFMvck1JS1ZL?=
 =?utf-8?B?a3g4V0FBTlZjY2h2b3hiYStRVVV0R0x6ZG5ZT3o1ejZuNkNhaldTY1hGNWFn?=
 =?utf-8?B?Tm80SXRyeEV2UWc2cTFCLzBTMld2T09CWXp4YlNTSzNjdmxzOThDNWZJNVlB?=
 =?utf-8?B?Sy9BbU5YcnpVeEZCMDRFT1NrY1pRa3lXcTJxeGtGV0UwSGlsTThGZ2Q1Vjdh?=
 =?utf-8?B?ckRWOENWUjF1MEM5OWUzTWMxdlJOdlZ5cTNndHllbmFEdFlIdTRJeitNSGpw?=
 =?utf-8?B?VEpQZDcxejhodFFsTDBOaHduTE9mSEcyb1daNnJOTEdUNllxTVVBS1BJYll0?=
 =?utf-8?B?MnpqYXZZQU5VTXgzM2tWMFFYZkw4aEE4cUpNZWl0U0JsRW5UYU1HNWdQb3c4?=
 =?utf-8?B?UHRpdUk4S2JaZG8zWEg0RWk2TytKa3RYVm53Wi9ibTVvem5KVEI4RGhBQWxi?=
 =?utf-8?B?VytVN042UDBER3ZEdVlKeDh2K3dOdkNzcElhQUN6aWIwQUJnaGJJK1RNQ1V2?=
 =?utf-8?B?dkpUYlprSlJsS3o5QUNPVGlieVpOTHZwYllDSGtIZGRXRzV1dXdIMXZUTVlG?=
 =?utf-8?B?eHJaemxrMlhwMEgvV24xR3p4MjdzR2dtcENJeVNBNHYzL0J5cU1UQnY1c09s?=
 =?utf-8?B?SUU0S2t1N3AzanhJdU50K1ZKdk9HNDREVkxCaGxJT0FnTG1NSERnVktSOHE5?=
 =?utf-8?B?ZGpHVGcwTjAxaUlvM0hzNnFlMXl4ZXJhTnlpOEliTnlmY2hSemlzZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3976f2-ae79-4d83-e478-08de7850f551
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:43:53.8145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EDIXpIhP5YvU4SHWNMNBwuX8hvfYf4nu9il/0BoW6juFdfGCzJ/Y6SS7D+6Ic1vtbeFTKWoU8ya+EhzChh3FvVsoIWF0VV802r6wx2mFTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6463
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	SUBJECT_HAS_CURRENCY(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7DE0A1D7C04
X-Rspamd-Action: no action

On 02/03/2026 11:03 am, Jan Beulich wrote:
> On 28.02.2026 00:16, Andrew Cooper wrote:
>> For INT $N instructions (besides $0x80 for which there is a dedicated fast
>> path), handling is mostly fault-based because of DPL0 gates in the IDT.  This
>> means that when the guest kernel allows the instruction too, Xen must
>> increment %rip to the end of the instruction before passing a trap to the
>> guest kernel.
>>
>> When an INT $N instruction has a prefix, it's longer than two bytes, and Xen
>> will deliver the "trap" with %rip pointing into the middle of the instruction.
>>
>> Introduce a new pv_emulate_sw_interrupt() which uses x86_insn_length() to
>> determine the instruction length, rather than assuming two.
>>
>> This is a change in behaviour for PV guests, but the prior behaviour cannot
>> reasonably be said to be intentional.
>>
>> This change does not affect the INT $0x80 fastpath.  Prefixed INT $N
>> instructions occur almost exclusively in test code or exploits, and INT $0x80
>> appears to be the only user-usable interrupt gate in contemporary PV guests.
> Whereas for the slow path, while the subtracting of 2 from %rip there isn't
> quite right either, the insn size determination here would then simply yield
> 2 as well, so all is good for that case as well.

I've covered that in the docs patch (patch 2).  Because INT $0x80 is
DPL3 and therefore traps, this is the best we can do.

>
>> @@ -1401,6 +1402,53 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
>>      return 0;
>>  }
>>  
>> +/*
>> + * Hardware already decoded the INT $N instruction and determinted that there
>> + * was a DPL issue, hence the #GP.  Xen has already determined that the guest
>> + * kernel has permitted this software interrupt.
>> + *
>> + * All that is needed is the instruction length, to turn the fault into a
>> + * trap.  All errors are turned back into the original #GP, as that's the
>> + * action that really happened.
>> + */
>> +void pv_emulate_sw_interrupt(struct cpu_user_regs *regs)
>> +{
>> +    struct vcpu *curr = current;
>> +    struct domain *currd = curr->domain;
>> +    struct priv_op_ctxt ctxt = {
>> +        .ctxt.regs = regs,
>> +        .ctxt.lma = !is_pv_32bit_domain(currd),
> The difference may not be overly significant here, but 64-bit guests can run
> 32-bit code, so setting .lma seems wrong in that case. As it ought to be
> largely benign, perhaps to code could even be left as is, just with a comment
> to clarify things?

LMA must be set for a 64bit guest.  Are you confusing it with %cs.l ?

What's potentially wrong is having LMA clear for a 32bit guest, but this
is how pv_emulate_privileged_op() behaves.  LMA is active in real
hardware when running in a compatibility mode segment.

I don't think anything actually cares about LMA. 
pv_emul_read_descriptor() doesn't audit L and instead relies on us not
permitting a PV32 guest to write a 64bit code segment.

>
>> +    };
>> +    struct x86_emulate_state *state;
>> +    uint8_t vector = regs->error_code >> 3;
>> +    unsigned int len, ar;
>> +
>> +    if ( !pv_emul_read_descriptor(regs->cs, curr, &ctxt.cs.base,
>> +                                  &ctxt.cs.limit, &ar, 1) ||
>> +         !(ar & _SEGMENT_S) ||
>> +         !(ar & _SEGMENT_P) ||
>> +         !(ar & _SEGMENT_CODE) )
>> +        goto error;
>> +
>> +    state = x86_decode_insn(&ctxt.ctxt, insn_fetch);
>> +    if ( IS_ERR_OR_NULL(state) )
>> +        goto error;
>> +
>> +    len = x86_insn_length(state, &ctxt.ctxt);
>> +    x86_emulate_free_state(state);
>> +
>> +    /* Note: Checked slightly late to simplify 'state' handling. */
>> +    if ( ctxt.ctxt.opcode != 0xcd /* INT $imm8 */ )
>> +        goto error;
>> +
>> +    regs->rip += len;
>> +    pv_inject_sw_interrupt(vector);
>> +    return;
>> +
>> + error:
>> +    pv_inject_hw_exception(X86_EXC_GP, regs->entry_vector);
> DYM regs->error_code here?

Oh.  I'm sure I fixed this bug already.  I wonder where the fix got lost.

Yes, it should be regs->error_code.

>  Might it alternatively make sense to return a
> boolean here, for ...
>
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -1379,8 +1379,7 @@ void do_general_protection(struct cpu_user_regs *regs)
>>  
>>          if ( permit_softint(TI_GET_DPL(ti), v, regs) )
>>          {
>> -            regs->rip += 2;
>> -            pv_inject_sw_interrupt(vector);
>> +            pv_emulate_sw_interrupt(regs);
>>              return;
> ... the return here to become conditional, leveraging the #GP injection at
> the bottom of this function?

To make this bool, I need to insert a new label into the function.  I
considered that, but delayed it.  do_general_protection() wants a lot
more cleaning up than just this, and proportionability is a concern.

What I was actually considering was splitting out a new pv_handle_GP()
function to remove the ifdef-ary, and doing a wholesale rework at that
point.

~Andrew

P.S. Something I'm still trying to figure out is how to make
guest_mode() able to DCE based on the caller being
entry_from_{xen,pv}(), because the function can be bifurcated for FRED. 
It doesn't appear that the assume() constructs work, probably because
do_general_protection() can't be inlined due to IDT mode.

