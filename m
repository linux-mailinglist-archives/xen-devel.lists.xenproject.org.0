Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNBNMJ+RrmlTGQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 10:23:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2532D2361CC
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 10:23:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249189.1546691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzWp5-0005hw-L1; Mon, 09 Mar 2026 09:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249189.1546691; Mon, 09 Mar 2026 09:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzWp5-0005fe-Hx; Mon, 09 Mar 2026 09:22:47 +0000
Received: by outflank-mailman (input) for mailman id 1249189;
 Mon, 09 Mar 2026 09:22:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqfy=BJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vzWp3-0005fX-A0
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 09:22:45 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86307fa3-1b99-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 10:22:43 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by LV4PR03MB8284.namprd03.prod.outlook.com (2603:10b6:408:2e0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 09:22:39 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c%4]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 09:22:38 +0000
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
X-Inumbo-ID: 86307fa3-1b99-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giDUUfhdXUGAJg5eIfqbMDYy2HuO4dejAhx6ILZONa8uTpGYvpk4DSuW5eQRnoscqqOjiL1tj1vOMJKBenwrRyJtnfb7sYRLqh+JJ/Al8MtdTCePDHo4Lv439nnclqNHNwo88iah9EubcVFTLf9j/v2d6qGjOOgHqL0tMgCeFs0+RWENvTagJrmY8zS+HuqyvMqf8p6L95mhKf1+tXPxCOVkpaJm3xmhVcg31yuhBXI0iVA0YhU5+cQ6MPDEFsZ5WqkjfpMdl8QcYFQpBIHX4XADAiMydzP39GI+noegW5ztjlwYyNTnMHbvsv6dwZlatU/eDLG8cfFKrhtmfO4q9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCyJRSxi8Ee2tAMTwB+64n2mYRJXbAoslZsTiGaa2TE=;
 b=JnZASNDYUeSxEiXdV+JGITpkCd3zxbualZcHhswxXaJGCN0f9tZ0c9OnIFhf3q4Up7Foutu6NbFlBPmsHqkNqio+t3JuAOViDsjexZwfk+POAfBvoxkkep7JuY3vYcoFP6CWDJVJOHsNU1rkgWL0kSFCggyb35NQhQdvmHSqLHsJYv24d771DLbXxnXaMgTmah7CTCDpATpN3XAs/Z0zNTgv1z+4YTYdmIe5jQ0vTLT3DICrV8RTeYmmM3VGAWeUEfjVaC82Cb6GFDQa1SVK5ITKUbACj+VeoglPssKPY4CUavFcjRJUKA7lOmCak9Wgi+nQ4My+XmUkwZJHr0WcQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCyJRSxi8Ee2tAMTwB+64n2mYRJXbAoslZsTiGaa2TE=;
 b=cPObCUnpxXDtkL78tJVsMXQW2MWx6+ypgPuqQOMDseEftr1N3LT+HnM0oJ+lBFH//uS0oxpR6/Wo79UWgpHXVKQbucYvRgyFbT57NXEnopvbSOJBL+uOD+FoszKu5G5vg0GfJB+TeGX7BZKEcOhJ1muOtSXzoBHYRSwyChKBC1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Mar 2026 10:21:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] core-parking: shrink and relocate core_parking_cpunum[]
Message-ID: <aa6RDlOFKXyBAjFR@macbook.local>
References: <af03f611-ef38-49d0-ac7b-4bad39db46c1@suse.com>
 <aarik2Zlgxc6-Ffp@macbook.local>
 <8b7e5cf6-e259-46a1-9af9-8b75242d9c7c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b7e5cf6-e259-46a1-9af9-8b75242d9c7c@suse.com>
X-ClientProxiedBy: MA3P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|LV4PR03MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: 634c1685-9318-4a57-349a-08de7dbd5b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	GPvctX4W1IzA1IgI6d8WPBsFWge7BAuPMNupBRHrROQuNR5nl3Fueta28pLkzqIIRBjq80TDsbf5wxJb2W4PpUOpRDhcFXuxNWfdYtpaqR4D3PidHNk4yE14tVoVirZVRaeASz1n32MLrMpq/2MeDdlilrWZJRRqhO5dnkzM2RDG2DveFihEiGUkUjJcxLaAM/aXxNXSSiiWa0e6szGLjt6UysF6ZOdHwucxTx48j/GEVEe7qMCMOPsak9wqRJQFDL6jpxVawm64TGfKpnaHNu37pGwSQQaX7DB+aCqsGwQ2mTPBaLG+iQc/syHiR+tYYqU8IfzwAji4ocFl0VCYkW/SA1HVU4ay6fL95qWpkoM/olGE4dsmiKW/9Xn8YX7WrsE1B+9Wp3jMjQsRC3EmMiLwi3L+Z7vihqNsDQWb336c+RbzFxoCysypQwIWOAEdyzpp7xJ3sp3n/MiqyJEROeWtMf7eoLMgzeLIDBLfH/qREifOffmUnW9Uoy7BA4Wo86roZc5ANxhHmMM3yq+x9390NAI/jccBC5uVYgBFCnAJ/EJLvp6ju0h+vvEF0X+TnbqJVamNEfdC93Rvd4eD5Ke+Myy+7lTG+tJ5KY9iXkaDZvSouHgM9qKL/1O7Oe/aIyaay5bxoCPfXXavBAumf2KUY+H6LrlFlK8Tq9uLAT2UzkaIj/ehgiMAjDYwS85ASpQkGg9+IZb+Ik2SVXYZYU96V/bSor6QfgSuBJCuxtw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODZVWGZYeElCbWN1dEhmdFFjcUwxdTlXQXJQeE5xUnlkV1Yxc0toY1c3WnpJ?=
 =?utf-8?B?WkFQVEttSTBOeGxtSXpoSUJlVnV3NXhaTmdBbnI4bXYvcGtFSWRXSkJFOS96?=
 =?utf-8?B?UFBBUEE2MTdtMlhmdnZGMHJNbmhRckJiSldEZlhhRUpMQVpqM29heFlOeWRq?=
 =?utf-8?B?bmpJV2tSOXF4ZjhuNnhoVVkwUTBxbS9CUkNEKzBvd01zVUF0TlBGbWZQMjRy?=
 =?utf-8?B?UjRJMGxVR1FQb3c0bUNBYzJ2MGJIY1AyMGU4R3NsaXpmOEswSWY0bDZxc2tE?=
 =?utf-8?B?VnRLNm9BVXlURzBiVXNVYjYxdW03a25SbWxmTjZ5VkRDN3NFZzRMVkd4QkFw?=
 =?utf-8?B?TEZEWkRhY0M3NVdWRnFScWtUVmlCb0gremR3Q1RuRENBdFc2blcrRVBuM1Bu?=
 =?utf-8?B?cms0N3hjS2NYR1RDRUh4RThWcTZHOXpqUWVaU01sZG04YU8xWnlHd3BpdjFm?=
 =?utf-8?B?L3lRUkpaczBJRjBtMmJxdTVjcjdRU1lHc0liVmtEbUJVNVIrekJLT3plU2xQ?=
 =?utf-8?B?ZlJHekMxUjh4bWRqVUJJem1PTmR2d1lHb2pDdHVPS3pHa2djTlJKRjBvSU5s?=
 =?utf-8?B?UEl6Wi8vTnZKMkFKWUttZGliQWgvZzdFNnVWQytMYWpFK3FDL3BRNUs5WENB?=
 =?utf-8?B?L3FVMTRla1Q4UlVZSm5DUGNmUjZEdDR4SXNtUkF3dDR1Qjdxa05qQjBZYXJR?=
 =?utf-8?B?WGQ1K2xhaUk4ZGhIWnR0eFhXeWV6dWg2VVg4T1FqY0hqeitEdHpUUkp1bHNx?=
 =?utf-8?B?TGM1ZEJBTXVRaVNBQk1CNTA5RVc5UDduSlkrZllLS0ZvR0Z2TURSN2QyNGJE?=
 =?utf-8?B?OGhDTjlJOW1OY1oyZndVSXZ4ZmJlV0kxVHQybWN0YXB4Vmt1S2J6b2RUSDVF?=
 =?utf-8?B?M0lLaGw5SmRtN2lBdHlBOUxlMkkxYjkxaFdRTHJScTQxd3hhS2QxeDQ2Tlda?=
 =?utf-8?B?Qi94VStTTVJrd1pKWDJscGZncVhSaGdDR3BPZ04yd293bUN5cVRVZjYzRStM?=
 =?utf-8?B?QzYvSzNKblNhZTRQVzYybXNOV203dnNadzR4OWZPTGhpYkRFUmhVc1BJRXdB?=
 =?utf-8?B?d2ZmYjZOS3lEd0ZnS1p4TUZmd2d2ZkcrUGluWThJTEF6bnNsaWVsZ0FhSzRR?=
 =?utf-8?B?cjJsNnVkczJpVW14R2NPYXYwdHJ5OVIrMnZ1T01wTmpCa0luWFExTGwwT0xK?=
 =?utf-8?B?N0lzeG5yOFJQUGh3a2ZTbnlkanBlSmY0MnVTcTltWnRYMW1VdW5nNCs4Qml2?=
 =?utf-8?B?Ujd6bzFjOU4waDk5cVRzSktaWGZKVmI1S2VreUE1REdBYW1lVWM0OVpkb3h1?=
 =?utf-8?B?YjE3aGEvcFo0NmJkVXlUUnkwYWlYb2xCYThJV0pCU09ySnowQVI4ZDU0VCtB?=
 =?utf-8?B?TnYxcHlaR1hISDRDTkNTaTMwUVAzUnJNZGZ5aStNanFyNUo3NERYc2N5ZzBY?=
 =?utf-8?B?ejBUSmx1Yzd3ZVVaT1kzOGpmRlNrQ2ZVazhpU21RSUp0MHg4QU9GTUxUL2E2?=
 =?utf-8?B?QmlVdFU4ejRZMUx6bEJRM01YVVRDUmRzWnczVFdhaHR2cmE3YXBTZmQ2YVdP?=
 =?utf-8?B?eUpKWDM2STdTNkFZTWhGVzRnK0ZHMmZOVTl4c2h4NjhOdlE1QnRXT0lRbm9h?=
 =?utf-8?B?NUNhU0d0OEhxRjRBaGVCWmpTWURSZGhrSWNYbVcwU2pZOUZUMDNQY0E5UDI4?=
 =?utf-8?B?c1F2dVZLV3ZuYzJLSUM0K1NqQUgwNHl2enp0cHRTVWloVWdqdWY0dDlKazBM?=
 =?utf-8?B?L0xGUHFEckl6RFZJS2RYbWRjL2NmYjRnQ1pZQ3dRU3doNUt0QWtlNlRtWlpY?=
 =?utf-8?B?ajM5c2RWM3Uzd2dTR2N6UU1mOElwam9DMHFVUVUyUjBCeVhtV3Q5SGR2R1Zn?=
 =?utf-8?B?TmxISm5DN1lzS1R3NGQ2M0gwWFRTcXRxWFhzVHliTE5mbENiOGJQYU9HeXZQ?=
 =?utf-8?B?VE55RjVpNC9nRmRicnNtaVg0eGJCd0lyU3VFTkdkQUZ3L3NsUElUd2dCSDdT?=
 =?utf-8?B?Z2t6cTdqaThQSEQ1WlE3d0NIdGJxRjUrdXdNSnMyQ1VWWWtyQitTQ0l5VVRR?=
 =?utf-8?B?Y3pTREo2UlZIMkhiNU5lRXJleDhUMXhnZjVIT0RmWnV2MHJSRCtRZHJYNUh1?=
 =?utf-8?B?dHZqZXZMVkJWRUdjQXFIM25IOU1YQ2tldkRlUVlycUhyWHoybXRJRXkyVFkv?=
 =?utf-8?B?dXZqdWo2SGVTbDRVQjVZVVl2UVhNcVZoUjA5UDJLbDlFbjhOTnRaQlNDaU9L?=
 =?utf-8?B?T0UyTTJ4MUljNXpFeE5vVFl5K3ZGdEZKMkowZXRsc1o2VGxPTzdMT1V2eWYv?=
 =?utf-8?B?b2FNYlpCSHpmR25IOEI0UVI5U2tsM24zdy9HVG1rSG5OUzlHd1BTUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634c1685-9318-4a57-349a-08de7dbd5b89
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:22:38.8217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWHn68zK64jqkkAknehiL4AY3OgqEBXQGh+RZsUxAEzRVxdcOxKFtoampW+78PFH3z9odbSerBgU4Xd41NyMpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8284
X-Rspamd-Queue-Id: 2532D2361CC
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:01:35AM +0100, Jan Beulich wrote:
> On 06.03.2026 15:20, Roger Pau Monné wrote:
> > On Wed, Nov 12, 2025 at 04:38:13PM +0100, Jan Beulich wrote:
> >> This NR_CPUS-dimensioned array is likely unused on most installations.
> >> Therefore it is especially wasteful for it to consume more space than
> >> really needed. Use the smallest possible type.
> >>
> >> Further the array having all fields set to -1 is actually useless. Nothing
> >> relies on it, and core_parking_remove() doesn't restore the sentinel for
> >> vacated slots. Drop the initializers, moving the array to .bss.
> >>
> >> Finally take the opportunity and update an adjacent variable's type, where
> >> a fixed-width type was pretty clearly inappropriate to use.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I assume there is a reason this is acting (mostly) as a LIFO. Else a
> >> simple cpumask_t would suffice.
> >>
> >> An alternative would be to use the new BRK allocator, at least for NR_CPUS
> >> above a certain threshold.
> > 
> > Can't we just allocate this memory using xvzalloc_array()?  If we do
> > care about it being too big certainly allocating only when needed, and
> > based on the number of possible CPUs on the system would be much
> > better than playing games with the array type?
> 
> Hmm, yes, how did it not occur to me to dynamically allocate the array?
> It can't be used ahead of core_parking_init(). (Not shrinking the array
> element type will still be a little wasteful, but perhaps that's
> acceptable to keep the code simple.)

We don't shrink other similar element types based on the supported CPU
count.  Iff we ever wanted to do this (which I'm not sure) we should
introduce a new typedef that generalizes the optimization rather than
open coding it (ie: cpu_id_t or similar?)

Thanks, Roger.

