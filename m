Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF2DDU5KoGkuhwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 14:27:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFF21A68CC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 14:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241717.1542667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvbOq-00024M-OX; Thu, 26 Feb 2026 13:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241717.1542667; Thu, 26 Feb 2026 13:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvbOq-00022u-LP; Thu, 26 Feb 2026 13:27:28 +0000
Received: by outflank-mailman (input) for mailman id 1241717;
 Thu, 26 Feb 2026 13:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEVl=A6=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vvbOp-00022o-SC
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 13:27:28 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e385790c-1316-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 14:27:26 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS2PR03MB8134.namprd03.prod.outlook.com (2603:10b6:8:27d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 13:27:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 13:27:21 +0000
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
X-Inumbo-ID: e385790c-1316-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOQSeih9Ztf4ZylxEHWb4bPnjYJ+jEitvejULQlmcyBX7t3JKRkCzlXNk9G2x1lrWJ1r7mJf++RgtdcRFBA7Z6zKLES1yDn2IKiY+3MVfZQ+7q314sy0ZQr+CTalzIYmCYyt8sb+mPl+qwIrXYz7PIFbx+bpPetFjZvsFlvLwDRyotGVOzq2/IXjOTBl7nGSD8WAWVcjMktgx+lI06FRGMMeFsV2guI2OyW/TECeS2MqD8dvs/PvOzbphZvxj0iAAmDqJQPwr+nvDGxOxq6oYbLB9p9YEyDqAxGGxGI7hVATbPbEnkYbtROmaiIYsaFa6Hsqgp6+rsZwZLQD70Q/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7qpKlXr8BPeXakyCUYodEjkrTREnYjUxATeIh9sTvg=;
 b=OkH0uQ6QpMqTYTZMrBmR6R5smWaZ/GuL+KLkIVpkAZEQb6oqKTNEvhYFJKvaX7kbZmIECHfHFCon/JmtpGJJS/KnMLvHeT1ME9YFpFrocgc+ExRSbel3mOxDStK4e6lxKW/qgRb+LdjozI9kbgSVHnJawlzVOe8BVohu8c9Y+hu7TYA6dmwXLAfu6Sds48/qwn1b6n3MnpGytPS5xnoCtYonnR+y0hhtHf6V9/ixDKqE1W4BrkOG+jFJw5thV1M61gQjIGjBysMoFHNSyJEp3Dk5q9rhz+BySSJDIxjQD5BSnSNqcFl+N0gLCH68Qf+A6AbukeBLpLFiCvLUdLwZCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7qpKlXr8BPeXakyCUYodEjkrTREnYjUxATeIh9sTvg=;
 b=X1dpDduwv0fjApmgOKBSN/weztiieawvRbZbdp+l5I46BEONW5lsOx5lLTUOSjwnJ19WtDF+p6ShvKlPUBcjUTbGXK23xz+3yb64SJHrBKMcakpNisIzGSJStjSLx2IwJ3FaJ2AfnLqtZmFkL0W/Muo1aFnst9IecTI1oVYPjPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
Date: Thu, 26 Feb 2026 13:27:17 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <aaBH3EAchUwKhrUA@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aaBH3EAchUwKhrUA@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0338.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS2PR03MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0dd3cf-940d-438b-7b95-08de753ac55a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	N/9hM5c16THhtEp2adSC+ERpBJgb2GH7dvsh/nMTwoUX71VFMMxuYa3yzl7oL9Wop/j8HixMaRsXdJr+sm0Pr23vxLP/nYpppu6OCTtJX8XtHb6odYgqjn/hbJivHXnS4XQLDFEaoZ7sEnWVmaHBzK6RP7YyxUA+CaCOi+aulTV67ujc1eczUTDbapdBqX9cS0b4kKchAq7/LoSuieG3B2DmbloZFxcB5bQFYui/LnMMzljQzqIq6DmKMsQFpqn+zyy8pZCLU+RxlEOrP9unWoBrp2U6UuNaut/1SmlfjYIz4Q/IA739XCg3eoanW+TN0jJCBptsO9i69l0F933BxuZfnaswybHEU4A++PqXooHWLlQqZMpsKgjFLzxim0yU22nYgfNGMZfCk3lGmtpI+i76HlaL8bJ8TGtlDuy05JTJFZ3V20yfsWnT6kKmUogc3+B/Oxwi3W/ZB1S5my2yZ5I6nKJD32oVm1fR4oQlQJUXbhyHepqQNCwxGJq66YuTAFZSlC+HrES30QhArZPBAPunGW6Hi/Nwfwf4ghK7J7JDItgjnnSXbsRMznDKYi3lGR7rqN7oI7VtQED83NuPzBtps29C1+OlPaTr7LVgwFldu9Wc7pfbHZmyKQWSCE2npa9cZVAJJ3FdGlDYc6ZSocy5iUnaywW7/m8t3DRkVbLuJlQUmqIjLbH4JJ7Bat6d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3BWUTdJNUxQcjVpQ1UxMmJwN1hPcGVXSW1MME52NmRWZXYyWFdpbjZYTFgx?=
 =?utf-8?B?Qys5dmUzZFQ2bFVnS0FpeWxBbmpiek5uNHlCWWtSSzNLZVRnQlZSOUVDMVFy?=
 =?utf-8?B?N3BybmVPdlNFaHlYaVF5M0NnWDVaVGZDVUtZUzZlK244QkREQVh4ZjJIL0xP?=
 =?utf-8?B?VjE5SWt6RXpLQWplNmZTQTRPQ1J3aE1HeHRtSVNSUXd6T0dwc2d5Ly94WVdX?=
 =?utf-8?B?WGxQN1lIanE1QlRDdDllQ2k1YnFQZktFN1V2TDBNaytIKytxcU9aaEd4cS9F?=
 =?utf-8?B?ZW44b3dsSDRMeERuZ3FWWmR1MmM5Q00rQ1ZFbWJ5anBXTUp4Q3dlVFE5WXpZ?=
 =?utf-8?B?QTF6ZWc3Qi9WUUN5RkNDb3FJdEtUbDNFRWFDT0tHNTlwUU1JY0pWZ3VZTUdz?=
 =?utf-8?B?Yi8zNVVRU0U3SlZlUHhvbnlRSHRFYmtVUzdudnE1Y0c3SG1NUnVPdjkvazB0?=
 =?utf-8?B?T3l6bTNEV0JNUmNja2hxek1kdllQZDNRdmN0RUZMUW14RTVTcEYrT3FQZzRu?=
 =?utf-8?B?dkQrdmRaTjZuS25wWWJ5NEV0L3lUTWh1VTFacUlBWFhpMlE1Qm5xVnlzWHlp?=
 =?utf-8?B?d1RVTjFicU9mcWY1YjNnV0RpRTdiTmR3SkpoWHNYbHFZN21CVFhGdGJiMU9F?=
 =?utf-8?B?RGwrcjRnQUVUODJHWVN2Z2x0bjdDWUYwM3ZxVTA2RTdHTjVLSzRFakoyTGdM?=
 =?utf-8?B?MDRraURNbGloVnpIeUsvZVlRREVjK0VWdzRyRHdkWTBIVGF0Q1BlVVVTV2V6?=
 =?utf-8?B?bUkvYWh4SVNTOVpmM3NMMmN2YTB5N3hkOXJ1cEFUT0NUUkJKQTJCNnFtV0Zk?=
 =?utf-8?B?REpZdThRZzlyL3poZ1FDNng5MHJuWk1DVmJaMFA3L2dFc2lzZkZQb3dtTXI2?=
 =?utf-8?B?Zm4va1pKRm1sbFhFT3F0RWVsbjVKdGZXN2FXeCs1cmx2cnZZR005Z3B2cEo4?=
 =?utf-8?B?UHFab082WWV1QzJnQTJ5S1V6aHNVZWZkN0RYVmF3QldxVkk4ZVMzU2NCWitH?=
 =?utf-8?B?L3htWHZMV3NNK3JXSE1EZGhQakp1b2h0TFB1UDZXaTByVUNHMjRRWDBmeEU5?=
 =?utf-8?B?TEo4REM3Z0RPdS9CazUyUDQyRTBLaVpoQU9Ta3FoRjZ5UTM0QXRwRmFNUGQ3?=
 =?utf-8?B?L1piYnRoM3R6bkJEQlh5YlJNdzdlNk9wb0dTL2hNaHIwYWdGUEpIb0pFTnhM?=
 =?utf-8?B?OEdVbkRXMnQ1ZlZXd0V3NFFHYWNMMysrNDJ2MVVTTkhpd3Y5SzBqOE9kdVhp?=
 =?utf-8?B?NXdGMEtIUTExRUdiTmhSN29tdnVjMnVWSFVMV2xGNWJGZVl4RE9IdEdVR2ZQ?=
 =?utf-8?B?N2dmZENCTUMvL0pIKy8wYUt3by9DdUZKUWZiSnVQSEc5cytMZWdRdEVnbTlV?=
 =?utf-8?B?RXZkRVFGbUsycDhPUDJQa0UxZUpST0ZLM25LcWlUTlg4a3JQdlBscnpRbUtx?=
 =?utf-8?B?cXBDMXd3cjZLditIV0dmYmFKbzFQdE15MEFQTVhrWEo1T21sMzQzVWkxTXgz?=
 =?utf-8?B?aXlRMnpValFHR0NVazhiditMQzVZUEtIZXhwbmV6SkptZzFFQlpmTGlLTld6?=
 =?utf-8?B?dWNGYUFtUlBUeVg1TEJPYjVyeXBaeS93UDhjblJPaTcrenFybE9lMjc0RVJu?=
 =?utf-8?B?aTlsU1pDWFRuN3pyNE9USFpJWTJ5dS9VUjRWVFpZWTZuZEFiZUZ1NGZEVWha?=
 =?utf-8?B?dFB3L2RDcW1ueHB0eGVSeklxUjlpNHA3M3RuajRVNzM5NWRQQ1lkYldDb1dx?=
 =?utf-8?B?Y0JmSzc1eWN0VzVkdzJNWnl4eVo1NkNtS3k4UHJZN1dUT0Q0TmFsN1BPK1lp?=
 =?utf-8?B?Nk5kUGt5VW9OaGVYL2hOTHo1ZzhkbGFadndJWmlLaEZIRGFFRzVBenV4WTZU?=
 =?utf-8?B?T1hQQTdxUFJtZzh1QkFWd3oyR0JuUi8wbzFTWE4wSG9RTTVYcnI0bExXVXNI?=
 =?utf-8?B?cGlaVmlMNnFXWlg4dllWNGxTTi9HU2lQd3VNeDE0WVJ5SkVCa1psM3k1OW1i?=
 =?utf-8?B?TTAwT1hEOVUwNUsxWkh1Zi9SN2txZ3duYy8wYWwya2wwbm9nbENCNll4MzhS?=
 =?utf-8?B?QnRINFdDeVNlazBzaG9Sa0FFcWFUWitTMnR6OGhjc3hHVm13OWl5YnB3QWdp?=
 =?utf-8?B?empGaVNuV0grMUVjYStDVzN3TDJmY05rYlc3eE92cDhmeXJEYnoxdmVJWFNQ?=
 =?utf-8?B?U0ZHcGNSNEJmZ205L3lxMTlTY2dTb2ljcGVHcGhrMVloYnhOZk11ZUhqZzI2?=
 =?utf-8?B?N2MxdHR6S0FTR0ozV25yUDJ6SDJUWWFFcmtTMjhXblBxRGVOTFVleGdoaVAx?=
 =?utf-8?B?V254eFZlODluamVQSys1ZEZ0ZDZhSUlJclFLSW05WitleFRWU3l6dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0dd3cf-940d-438b-7b95-08de753ac55a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:27:21.3390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSr36uwlfh5u8YNGuV/uJba9q+6cfludKX87tt9qCVnZOMCopfrVGbt+wS1dHtTGu2Fj3p35VY52uWMmVS9zz0hzfkwNE/MFk4dADTjgEks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8134
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7EFF21A68CC
X-Rspamd-Action: no action

On 26/02/2026 1:17 pm, Marek Marczykowski-G=C3=B3recki wrote:
> Hi,
>
> When testing Linux 7.0-rc1 in PV dom0, I hit the following panic
> sometimes:
>
> [  436.849614] ------------[ cut here ]------------
> [  436.849669] kernel BUG at arch/x86/include/asm/xen/hypervisor.h:78!
> [  436.849693] Oops: invalid opcode: 0000 [#1] SMP NOPTI
> [  436.849710] CPU: 3 UID: 0 PID: 4021 Comm: kworker/u25:1 Not tainted 7.=
0.0-0.rc1.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
> [  436.849729] Hardware name: Star Labs StarBook/StarBook, BIOS 8.97 10/0=
3/2023
> [  436.849743] Workqueue: i915_flip intel_atomic_commit_work [i915]
> [  436.850226] RIP: e030:xen_enter_lazy_mmu+0x24/0x30
> [  436.850245] Code: 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 65 8b 0=
5 b8 e5 02 03 85 c0 75 10 65 c7 05 a9 e5 02 03 01 00 00 00 c3 cc cc cc cc <=
0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90
> [  436.850270] RSP: e02b:ffffc90045727a68 EFLAGS: 00010202
> [  436.850283] RAX: 0000000000000001 RBX: ffff8881042fa6d0 RCX: 000ffffff=
fe00000
> [  436.850296] RDX: 0000000000000001 RSI: ffff88810a5a2980 RDI: 000000000=
0000000
> [  436.850308] RBP: ffffc90049eda000 R08: ffffc90049edc000 R09: ffffc9004=
9edc000
> [  436.850320] R10: ffffc90049edc000 R11: ffffc90049edbfff R12: ffffc9004=
9edc000
> [  436.850332] R13: ffffc90045727bb0 R14: ffffc90045727b28 R15: 800000000=
000006b
> [  436.850356] FS:  0000000000000000(0000) GS:ffff888201e6e000(0000) knlG=
S:0000000000000000
> [  436.850371] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  436.850383] CR2: 00006543dbade250 CR3: 0000000115ef1000 CR4: 000000000=
0050660
> [  436.850401] Call Trace:
> [  436.850410]  <TASK>
> [  436.850420]  vmap_pages_pud_range+0x47c/0x530
> [  436.850439]  vmap_small_pages_range_noflush+0x1f1/0x2b0
> [  436.850451]  ? __get_vm_area_node+0x10a/0x170
> [  436.850465]  vmap+0x79/0xd0
> [  436.850476]  i915_gem_object_map_page+0x13b/0x210 [i915]
> [  436.850812]  i915_gem_object_pin_map+0x1e2/0x210 [i915]
> [  436.851123]  i915_gem_object_pin_map_unlocked+0x2d/0xa0 [i915]
> [  436.851424]  intel_dsb_buffer_create+0xed/0x1a0 [i915]
> [  436.851778]  intel_dsb_prepare+0xca/0x1a0 [i915]
> [  436.852110]  intel_atomic_dsb_finish+0x92/0x350 [i915]
> [  436.852456]  intel_atomic_commit_tail+0x326/0xd40 [i915]
> [  436.852769]  process_one_work+0x18d/0x380
> [  436.852779]  worker_thread+0x196/0x300
> [  436.852787]  ? __pfx_worker_thread+0x10/0x10
> [  436.852796]  kthread+0xe3/0x120
> [  436.852805]  ? __pfx_kthread+0x10/0x10
> [  436.852815]  ret_from_fork+0x19e/0x260
> [  436.852824]  ? __pfx_kthread+0x10/0x10
> [  436.852832]  ret_from_fork_asm+0x1a/0x30
> [  436.852842]  </TASK>
> [  436.852847] Modules linked in: snd_seq_dummy snd_hrtimer snd_hda_codec=
_intelhdmi snd_hda_codec_hdmi snd_hda_codec_alc269 snd_hda_codec_realtek_li=
b snd_hda_scodec_component snd_hda_codec_generic snd_hda_intel snd_sof_pci_=
intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic soundwire_intel s=
nd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_=
intel_hda_mlink snd_sof_intel_hda soundwire_cadence snd_sof_pci snd_sof_xte=
nsa_dsp snd_sof snd_sof_utils snd_soc_acpi_intel_match snd_soc_acpi_intel_s=
dca_quirks soundwire_generic_allocation snd_soc_sdw_utils snd_soc_acpi crc8=
 intel_rapl_msr soundwire_bus intel_rapl_common snd_soc_sdca snd_soc_avs sn=
d_soc_hda_codec snd_hda_ext_core snd_hda_codec vfat intel_uncore_frequency_=
common fat snd_hda_core snd_intel_dspcfg snd_intel_sdw_acpi snd_hwdep intel=
_powerclamp snd_soc_core iwlwifi snd_compress spi_nor iTCO_wdt ac97_bus int=
el_pmc_bxt ee1004 mtd snd_pcm_dmaengine snd_seq cfg80211 snd_seq_device pcs=
pkr spi_intel_pci snd_pcm rfkill spi_intel snd_timer snd
> [  436.852939]  i2c_i801 soundcore i2c_smbus idma64 intel_pmc_core pmt_te=
lemetry pmt_discovery pmt_class intel_hid intel_pmc_ssram_telemetry intel_s=
cu_pltdrv sparse_keymap joydev loop fuse xenfs nfnetlink vsock_loopback vmw=
_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock zram vmw_vmci=
 lz4hc_compress lz4_compress dm_thin_pool dm_persistent_data dm_bio_prison =
dm_crypt xe drm_ttm_helper drm_suballoc_helper gpu_sched drm_gpuvm drm_exec=
 drm_gpusvm_helper i915 i2c_algo_bit drm_buddy hid_multitouch i2c_hid_acpi =
ghash_clmulni_intel video nvme wmi ttm i2c_hid nvme_core nvme_keyring drm_d=
isplay_helper nvme_auth xhci_pci pinctrl_tigerlake thunderbolt hkdf cec xhc=
i_hcd intel_vsec serio_raw xen_acpi_processor xen_privcmd xen_pciback xen_b=
lkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_rdac scsi_dh_emc scsi_dh_=
alua uinput i2c_dev
> [  436.853183] ---[ end trace 0000000000000000 ]---
>
> or this:
>
> [  548.736884] ------------[ cut here ]------------
> [  548.736907] kernel BUG at arch/x86/include/asm/xen/hypervisor.h:85!
> [  548.736923] Oops: invalid opcode: 0000 [#1] SMP NOPTI
> [  548.736935] CPU: 0 UID: 0 PID: 206 Comm: kworker/0:2 Not tainted 7.0.0=
-0.rc1.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
> [  548.736949] Hardware name: LENOVO 2347A45/2347A45, BIOS CBET4000 Nitro=
key-v0.2.0-2608-ga649597 01/01/1970
> [  548.736962] Workqueue: events delayed_vfree_work
> [  548.736976] RIP: e030:xen_leave_lazy_mmu+0x44/0x50
> [  548.736989] Code: 02 03 83 f8 01 75 23 65 c7 05 6c e4 02 03 00 00 00 0=
0 65 ff 0d 7d b8 02 03 74 05 c3 cc cc cc cc e8 61 5d fd ff c3 cc cc cc cc <=
0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90
> [  548.737010] RSP: e02b:ffffc90040607cf0 EFLAGS: 00010297
> [  548.737018] RAX: 0000000000000000 RBX: ffff888164a70408 RCX: 000000000=
0000000
> [  548.737029] RDX: 0000000000000000 RSI: 000ffffffffff000 RDI: ffff88810=
69c0000
> [  548.737039] RBP: ffffc90049681000 R08: ffffc90049681000 R09: 000000000=
0000027
> [  548.737050] R10: 0000000000000027 R11: fefefefefefefeff R12: ffffc9004=
9681000
> [  548.737060] R13: ffff8881002fd258 R14: 0000000000000000 R15: ffffc9004=
0607dac
> [  548.737079] FS:  0000000000000000(0000) GS:ffff8881f88ee000(0000) knlG=
S:0000000000000000
> [  548.737090] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  548.737099] CR2: 000055576c2e6058 CR3: 000000010d47b000 CR4: 000000000=
0050660
> [  548.737115] Call Trace:
> [  548.737123]  <TASK>
> [  548.737128]  vunmap_pmd_range.isra.0+0x1f1/0x2e0
> [  548.737142]  vunmap_p4d_range+0x17d/0x290
> [  548.737151]  __vunmap_range_noflush+0x182/0x1d0
> [  548.737161]  ? _raw_spin_unlock+0xe/0x30
> [  548.737171]  remove_vm_area+0x40/0x70
> [  548.737180]  vfree.part.0+0x1b/0x290
> [  548.737189]  delayed_vfree_work+0x35/0x50
> [  548.737198]  process_one_work+0x18d/0x380
> [  548.737207]  worker_thread+0x196/0x300
> [  548.737215]  ? __pfx_worker_thread+0x10/0x10
> [  548.737224]  kthread+0xe3/0x120
> [  548.737233]  ? __pfx_kthread+0x10/0x10
> [  548.737242]  ret_from_fork+0x19e/0x260
> [  548.737250]  ? __pfx_kthread+0x10/0x10
> [  548.737258]  ret_from_fork_asm+0x1a/0x30
> [  548.737269]  </TASK>
> [  548.737274] Modules linked in: vfat fat snd_seq_dummy snd_hrtimer ath9=
k ath9k_common snd_hda_codec_intelhdmi snd_hda_codec_hdmi ath9k_hw snd_hda_=
codec_alc269 snd_hda_codec_realtek_lib snd_hda_scodec_component snd_hda_cod=
ec_generic snd_hda_intel snd_hda_codec mac80211 snd_hda_core snd_intel_dspc=
fg snd_intel_sdw_acpi snd_hwdep ath snd_seq snd_seq_device snd_ctl_led cfg8=
0211 snd_pcm at24 thinkpad_acpi intel_rapl_msr i2c_i801 snd_timer sparse_ke=
ymap iTCO_wdt intel_rapl_common platform_profile intel_powerclamp intel_pmc=
_bxt pcspkr i2c_smbus rfkill libarc4 snd soundcore mei_me e1000e mei joydev=
 lpc_ich loop fuse xenfs nfnetlink vsock_loopback vmw_vsock_virtio_transpor=
t_common vmw_vsock_vmci_transport vsock zram vmw_vmci lz4hc_compress lz4_co=
mpress dm_thin_pool dm_persistent_data dm_bio_prison dm_crypt i915 i2c_algo=
_bit drm_buddy ghash_clmulni_intel ttm sdhci_pci drm_display_helper sdhci_u=
hs2 sdhci video xhci_pci cqhci wmi cec xhci_hcd ehci_pci mmc_core ehci_hcd =
serio_raw xen_acpi_processor xen_privcmd xen_pciback
> [  548.737348]  xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_rd=
ac scsi_dh_emc scsi_dh_alua uinput i2c_dev
> [  548.737469] ---[ end trace 0000000000000000 ]---
>
> I don't have clear pattern when this happens, one was during host
> suspend, but the other was during "normal" test run (starting/stopping
> domUs and running stuff around them). Note also one of those is Intel
> and the other AMD, so it isn't really hardware specific.
>
> Slightly more details with links (especially serial0.txt in the logs
> tab) at
> https://github.com/QubesOS/qubes-linux-kernel/pull/662#issuecomment-39633=
26188
>
> Any idea?
>

That looks like the issue Juergen fixed with:

https://lore.kernel.org/xen-devel/20260220123715.834848-1-jgross@suse.com/

~Andrew

