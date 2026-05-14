Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA90FyzJBWqFbQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 15:07:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF43B5421E5
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 15:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308894.1580169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNVm9-00063C-Kg; Thu, 14 May 2026 13:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308894.1580169; Thu, 14 May 2026 13:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNVm9-00060t-HL; Thu, 14 May 2026 13:06:53 +0000
Received: by outflank-mailman (input) for mailman id 1308894;
 Thu, 14 May 2026 13:06:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNVm7-00060n-Eu
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 13:06:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNVm6-005dz5-PU
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 15:06:50 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a05c8d0-5cb7-0a2a0a5109dd-0a2a4508d88c-42
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 15:06:50 +0200
Received: from [40.107.208.64]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a05c8e8-63b5-0a2a45080019-286bd040cd4c-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 15:06:50 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BLAPR03MB5505.namprd03.prod.outlook.com (2603:10b6:208:299::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 13:06:46 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 13:06:46 +0000
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
 b=a0Jn4ZbQfH2Fs70ggrIVD49yQuKOJUszVFSSuxlwVR3O/yhkMPL+B9SXlWV6evfhkW+S5Yi8nCmPe7VBo4TFvoJUmd2+nqSQ7ngYrg1Lvxv8ucRLGaEvMfyBCvo5fRMh9NGHE9wi/K/w5SqmYeUShLjsmVYbdxO56nqYjDPxcU+DtZwQ+EEty1x8dX+cm1IOxNGhlX+Gqp58Apk5YehIY5C2Vjn6eaelexr8Jx38R8G4CVPkQqi4uzsMhI4BWsKVXesM1sbyko8kCzF9xP98xxxzhtF1pvcVWbra15VHPz5yPVLkekTb2DW8fF5rVlo6Cn3H790UOHX/oy7K4xcjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0FddMy5LYP+9Kg8SN6DJhYSo5NtdDw8gBbl6S1TwsQ=;
 b=t3afx6Nsls/weBJ+DclP9rOxN7LWnQwJkTB6p8ZDUYl2fXC5w6kqdSOMIomhaetXYOiWqQJgiV/cKoDqqbhhMf+0TsDNl4bnqXLrzzkq1y6bbu3iaidHLe9e1H8t2yRvAcR8Ci4PBYtbFfYz+P+PuVQj/KN/gybJmEPgfCZHJO9ixUYb42c0uh848bgrMtmzCc7d0xY3j9m44CyJh5SxIcvZiSq9wkFrdixHiIMmeOvdV+3yAp0Cwr7MyHAubkKavmCKqRObHRE2u/6Qrz7lAmRKV/xXK7XNIbocp954S6XI5k3y/twLOtSnBflc9OyBdljYacf2EDxkAKgd/V9qgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0FddMy5LYP+9Kg8SN6DJhYSo5NtdDw8gBbl6S1TwsQ=;
 b=nJ/4+jbw0TTtbTgU8E1yJelpGFKgEKvG5LPVf5uN2T5uc9wM8ZKg1A3qRiDN2tVt0+qMV8KyiRa7cunqqEOKeJDhJhXEg15Y/w/YHHPRIvF+CJc8qxTC5+6bM6ylV++tmh3ZOB/aelZlal4KKICGb/wwAclyMyg8ji/1hUkf1tE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 14 May 2026 15:06:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.22 v2 1/8] x86/mwait-idle: arrange for BSP MSR
 adjustments during S3 resume
Message-ID: <agXI4t4vuAQZSCZS@macbook.local>
References: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
 <5c66cfb1-e234-4efa-9a01-88acb284e414@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c66cfb1-e234-4efa-9a01-88acb284e414@suse.com>
X-ClientProxiedBy: MR1P264CA0113.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::30) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BLAPR03MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e866b3-242e-48a7-90c3-08deb1b9a6f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|4143699003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MNDSI6MrEkjWCUqQMHgvC1NAir9XvUBuE3MKpB9WFe+1nDUb2ZHdIk8zHDFtAJPtcwN0DEMPzMVxYfZ08CesEqRwDvZbRywA2YwWQohz3yJ8z1yB4ntfNglNV396/dzp+6R3QhePWxgi6iLtzLRy+YBk6rSd1G4rtnVfRC6jwNxm+z3W0pU1jyDztZHfWk4E+uds7RQQgmTU/DWzwFgSNWb0NhAxQLQOUG1qw3sdcglSCrWvVh/ezSmeJ4Wb66VPsBj63N12fynwcr+VQfrT+PgIsOTmMj95vz7gAZ9HnON11DJepuRJW0BBKM0/pcgUe+hbmG5dGQ62tGTNq12COb6234+YEsgzqvuOjLha9a/VJkryPWnvKVLDHsqJr2UsrSNeVqS0+UxRUkSqETvCE4VaRfHuUwvOW+UkK6orHhHQVSzEW/2nVKAkzdqZjMr4nTFUaeTbNqzcE4GKgzrqZ+E7dAqB1nbMTfEYr6blZsi6n4D1lSax3zGuks6bVsmcR+bes97lfQgwEafJmPkPZc0W+ErcmwCokhf7llrvt09RoHyQxMCo51Xv1c16Ec8r/vHyR0Xpxc875qCogIJK++NfORs4qn4YpwS803EdRl7PZiSeXh0Sd+oo/+TPe3LeODK+hRcS3799sDNebFK2QbTkrhm7uBxkwfD/CkfamoncyjPL/OIluaZtyE920v0c
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTJEc3p6aW1GeVBNY0FCeHdxOUtEVWpMRE5lNmFLSXZqTElKaXpzYnl4Y2Zx?=
 =?utf-8?B?SFBIMmtYNDhHZTFDcFZDSG9iQ0h6dGU5VUplckJ4Wm0vbDQ2RzA2d0E1QUti?=
 =?utf-8?B?SktNdmFnY0pUQ3p2RkQycERFeTlqU0VTNHB3S3RjMXJuNXJPSzM3ZXRPV2tm?=
 =?utf-8?B?NTBlL0R1NnRNbDNaeThnL0ZENFVDdmhDTmkxU2Rvem5jazVwUVc3Qjd2dFRZ?=
 =?utf-8?B?bXZKZE9MVU1SYXJvSUxMMnR1dWxUaG03OW5TL3gyQzlJRnJQdjZpa0RjMTNL?=
 =?utf-8?B?UGFFM003QUhyQ3J1dUVCbDZWZEZ5b0JLSFBiMkRkK3R0clkyU0ptVDJwdjBu?=
 =?utf-8?B?VEtKaytnWURHSitrZWlxQkpHNmROZ21URjJKRUtKQ1prbi9jbXJtQStJTmIx?=
 =?utf-8?B?VjI2c2s2ZEhsTk9uWXlsTXBIdVlSY0xrRFhzNjRjNC9jTExZNFhxNVpFWEZ3?=
 =?utf-8?B?NkdrL3NBV2xEMlFHOXZ0dm5pYk82TTFEMXVrdW94a2VwY2kyUEhNdC9KQXBr?=
 =?utf-8?B?cXBnRDhNYlRoOU1aSjNubjBPczl1Y2FESktwSHhrL2dldE42YXNJT3Z3NEpv?=
 =?utf-8?B?L1RMU3BBSGJ3QjJXTXNoamdURWk3MVAvTThzT0prREZ0cTFXd1A0L1dLR21H?=
 =?utf-8?B?M3dnVlhqVGk3UWMvR0srelIwWFQvczJIdFhhUUo1ZkE4NU5QTzRBTTBpOW9E?=
 =?utf-8?B?YWJGbHJieXRYT05ERTVaSStoRVRtRytrNmFlT3c0Z3ZSRWppQ3g0RU9IWThD?=
 =?utf-8?B?czFOalNBYmxjTE1QblRkclZoOUtUUXZTNWkzNUVOaHZSUTM3UTE4NHNVb2pT?=
 =?utf-8?B?RjhqUjlTNTQ3UUMvWWJFZmY0ajVNcGF0UURJcDdqYUlyTGpPaThXTHorbjhK?=
 =?utf-8?B?cWoxQWRsU0hOcTViZE9aWlpidjFySXV2UDlldG9kV0tUSXByL3lJY3k3U2tN?=
 =?utf-8?B?Z3liM0FGc0RhTE9hYnJ2Rkd5WUN4YVF3TDBydlFkOVVQWTFYUFl4b08yVVh2?=
 =?utf-8?B?bUxXd0c5WHhhRXBVYjhjQ0JaeU9BTUx6akU1L0puK1FJelV6bFM2V2lnMXNs?=
 =?utf-8?B?UjFhbkVJeG5oVHpNSzVSRStaeDhLdVd2amVrQ2RhMm5RUUt3OXJSQ3FSSUpt?=
 =?utf-8?B?d1lPNjVzVTVVSzlMQnRwRWwrbndNWk5rZFdqbWFGUDJXUmF2aFlSU2JjNVJT?=
 =?utf-8?B?TVNxbVk3TkJSSmxGazdsenhESUpJekVuSzFmYTdzV2xIM0tlVWd2REwwamxU?=
 =?utf-8?B?aXdlZ0MvNUtyU3d1ajNqaFgrMW41SUY4WndnbkRpS1ovajdRTVF4bEY1eGVr?=
 =?utf-8?B?K3dTZXIrZnRVVjVsK2JvZzdJV09WTTdGR242ZU5kY1RXN21aZFpJRTVxMTJh?=
 =?utf-8?B?NkdXTDFLVHdadXM0QldvZ1ZvSFhJL29HR3daNXBMdFN4RTVXWDFXVXRWdjVi?=
 =?utf-8?B?VnNnSXZUeXJ4blVaOVMrTVNCeDd6WjR3V0huczBza2EyLzkySzltR2Z6T3BO?=
 =?utf-8?B?aFVIUXgzNDRUMkd3ZWtZOVJYcERsZWJMeFI2K3hhV1czTEsvSzdvWGZpb0JV?=
 =?utf-8?B?eFNXUFRhTFR1ZUdnUGI3ekp5RjdWTCtKMlVONU9IS0JQOEdYMG84amVsbmp1?=
 =?utf-8?B?bnRyN1F5cFl0MGhSZ1U5RGJLQ01HVGNQaDh3OFRCNW40ZkRiZnRrOWpRcGQw?=
 =?utf-8?B?RzZwcmtuVG13K1lpUDhEYkFqQUszZGQvM2tRYnNqZFQ0SVNGN291V1ZXR2xX?=
 =?utf-8?B?Z1RndDBsblBXRllWQUwyUWZvZG5oWllsaVN0VGpXOHNUTFQzRkhacVNFL2py?=
 =?utf-8?B?c1VCbk1PU0kxOGRZZ0JyblA2TVdSMFVLQzd0U2pDNlg3Q1ZmNXFJbTR0eSsv?=
 =?utf-8?B?V045WWRmcHpVK0tKTVJzdG1LTVIwTXZsQjFOdEdvVDArL3dHS1ZYQUdsbVIv?=
 =?utf-8?B?eGNGaU14WjM0OFVwb3BraDdrbVVrQWt0L2lyZnJuUERPSzdUZ1NuQWFOMGd6?=
 =?utf-8?B?YUVYYmt6eHM3RUpnRGZ3YWNRaFgwNU5wa3RCVGgxNzh4cUVDUTlaRUY4di84?=
 =?utf-8?B?U0g3K2EycWZjMnNZS2JoOURvZnpBaHdEUWZRZG9MRkJoMUpCcFlHbCtlY0pw?=
 =?utf-8?B?Y3BuLzBwMDNZM05qaFVJUHdRWS96ejArUEs3V0lLRzFyR0xhcUg3M0tXandv?=
 =?utf-8?B?MUd3S1o2SHVINHp0MzhQQlp3clFTRFVvc0JTS3d1Q3B1clpuOURZcExva3lK?=
 =?utf-8?B?bU14OGNaNGF5MlRlUDRlUjJOT2JzSXZsMmdZUy8rZlpIYmJBYVl6Z2xpMERj?=
 =?utf-8?B?MkRHRmJwclBBRXMreWFvZ0lJclhtY2lhMWRMdUZQTk1ZaWhpVGVJZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e866b3-242e-48a7-90c3-08deb1b9a6f7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 13:06:46.3094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIcHhIGDeTgFvRn5gqV6Pcs2PdxeUIfydWP3Hvp7H4r6ZgJaKEjwr7upq2/UFDAHgN+Xkf1266/INGezxFpEGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5505
X-purgate-ID: tlsNG-c1860d/1778764010-BCF62DB1-D6E93B22/0/0
X-purgate-type: clean
X-purgate-size: 607
X-Rspamd-Queue-Id: AF43B5421E5
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 05:35:33PM +0200, Jan Beulich wrote:
> mwait_idle_cpu_init() is only called for APs, yet MSR writes will
> typically need re-doing post-S3 even for the BSP. When multiple cores /
> threads are present (and to come back online) in a package, for package
> scope MSRs this may be covered by APs doing the writes, but we can't rely
> on that.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

It's a bit unfortunate that we end up doing self-IPIs for the BSP
also, but that should be fixed elsewhere.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

