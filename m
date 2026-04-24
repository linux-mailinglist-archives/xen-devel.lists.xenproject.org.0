Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGgBAw8v62mBJgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 10:51:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FED245BB93
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 10:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293304.1571103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGCFe-0001F2-52; Fri, 24 Apr 2026 08:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293304.1571103; Fri, 24 Apr 2026 08:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGCFe-0001CY-1R; Fri, 24 Apr 2026 08:51:06 +0000
Received: by outflank-mailman (input) for mailman id 1293304;
 Fri, 24 Apr 2026 08:51:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGCFb-0001CS-S8
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 08:51:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGCFb-00HSBs-91
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 10:51:03 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb2eec-2eae-0a2a0a5409dd-0a2a450399c0-42
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 10:51:03 +0200
Received: from [40.93.201.37]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb2ef4-672d-0a2a45030019-285dc925e33b-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 10:51:02 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7426.namprd03.prod.outlook.com (2603:10b6:a03:55e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 08:50:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 08:50:57 +0000
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
 b=M961YQTdmdWyRiyNhJSfRaTARuVm8nH4lapPcYt9MlHXdVu2kdkIukoNHA+72zUgIlATSgIW/eTQTG9/aXX61duOyCp1K321dVJA9bAX6a7QteVZAQpOykj5989PQUQCQdWbUtbWq6CMcsMspF7+M8bsONMKjKmw09XpVw4cum2P+DkpXsf7X/in1LzL3LAl1bUlH8Ihh232teTs0f7zA24rbaXEuMfPbSI5stsUk02rZ4kEiOeTqQQzbf65yY8f7UcY+pCLmVY3dKh61fFsk5qMNwaNBVy/n4Exer6LWsy64zWcg6fpRhfyGli4VHVhtKZUIb9z6oyYTGvsjBmwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLO52x3nk09yDTf24M+fjxAhARyd8a6AX1TgMY6d+80=;
 b=h1qChGHUL5hbs1iBmyr1rIMSmQgMRoDq8k8qCYQ7GIpkcqVKjPD7eo/WCvoDn/D5QckPhQmXtGwNwPpHcyFbq//uunbTxDTNvyXfxIadI7MMu6eWmOmUcrxcfqqvuRG+B7DM9QQsm2iinl45aqg7aemDP+EUZzE94JnYnW89TkGhH/Psp+m+bmoBLSPmgWFFuw3rqqFG4DlpAg1HZSJsyO7Hv7VALv7ydfvXvqh6OdAMmjQbCWG6YiwvD3mAGsACMvJnPXKe479mDym/uXJbO4Jgfh1MVGwPAG3MrqWecMSpI1fQAfyl9eSERorQcUX1EiKXOM1yNUBsyb/VDCu6Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLO52x3nk09yDTf24M+fjxAhARyd8a6AX1TgMY6d+80=;
 b=HVB7JNoPKD58o0LQOhpoQOX9wOhyffaslNDWLWne+Gz62IKLm2E7dEiWTy5m+oJ8R4PW4RDkCHjAZ3d0ce35LZ9HG8nV17GEcSFBqQceHJLXYlpIrDjgTNONjjiubdnm0+pKteVqH1GTC1X/sixcdtNxSNT4o/P4neclbq4aaOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 10:50:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 4/4] vpci: allow 32-bit BAR writes with memory
 decoding enabled
Message-ID: <aesu7sCLTaodcyWL@macbook.local>
References: <20260406191203.97662-1-stewart.hildebrand@amd.com>
 <20260406191203.97662-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406191203.97662-5-stewart.hildebrand@amd.com>
X-ClientProxiedBy: BN9PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:408:f8::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c1783ff-97fd-47f5-a0c8-08dea1de9a07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QmRGuhNHA/te5dTCwTZdYqFaxEL7wD07NL719nJMqeJkwlBOb8A/cZsIIY3oWgYpPJZoqpKmTqmp0Fwb4oOASrRBmWOf0EDs/SIfrAJ/PcSAqVCZj55+H5RAUfRGSMJz9Uz3E2OdItYwps5QqPqAMYl/Pg2/MUhMaQ1DS0ICEv6EuhDiovrO2QxrkeOmG+anR8rV/nl7QFj2z+JZoz5W+6KW/OS+N+AWnsiBoJmxgKwAOrP/S2Pfq+QSQ4oAXs/Ike5ppYTSR6qaLMrX9SOpdTdMSlk4qmw+l40QKWBDn03GzDaPpbGVPiCOv9JPdGiteVYcjmg/dNxBNE47WcbYTad42H+6pgKRyGBvfC1P1dvJrMWJUmYc4Z7K0gtLJ1DnSuY7YaucbvpyyYg3R836JswiZNc9JxA/fQ+UmyOW8h6mZrUe8tOHqwqSQUGcwhNE67l17BGRk1GVKA8lLLFvuX9JEaZUsoqIhUxKWuLn5yMsMW1M2Z3w38bf3T+O7A1LvxsnhZUn3xZjWvUB0lW2HgSlJwKYZqOBljF1PCTG4vXENykhLkp24t1BU/wP3R7MHSctl3EYUDW1VBHAkYCYg1ofNhjXZ8zTWb6umlICm1wNCNI55ajs0Xe5c6mCdgRpcmgVaP4tfG95KCtF6IfKfvxT/C/PNh1IG0R5OwmXGsOqTAbkIo7+S60BUBg9UXucOhiS2nnpRDBMAiPyiR545W6qvMZ95+pgE20SwwPzPGD/JFMrC0aOfEeao0S8L1Gb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnBHQUVwS0FCbWg5YnJGckFSd1hTSFI1R2o3bitkZWwybENNbjFzK2J5NUk5?=
 =?utf-8?B?RXkzVXF1SEpNVjVEWWtobGRGQWhXN3YzN1lvSnZ3b010ZldjbHhtWjF5OG1s?=
 =?utf-8?B?aWFkMmNONVkxT3hpQ1lUcFQ4UGtqeVJnZE5NSHhGUTF4UzNxV1JVejQ3b1ZK?=
 =?utf-8?B?b0txS3hESUtzQkYyZFJVNytuaUhWUUhJUGN3OXBaMHNSOVRqcEZLZW9TRDRn?=
 =?utf-8?B?ZHp0WERPQUdrVWY4WWxPVXUvcXdBQ1ZFNEtPV0xISGh1N2kyd09Kdm1VR3hz?=
 =?utf-8?B?WHRucytxYkw4SW9EMWpFZ3pkckJHOG5jaGhpQktUMkVmYmNRajRMM0JVVko1?=
 =?utf-8?B?MWtGQ2Y3VE1zalFyR0NRZVh5Nyt5VTVXK05CRGFvbGxldDZ1aTJXQU1jQnVG?=
 =?utf-8?B?ZlVNUXA4UGNMQ09rRTlDNG1MRHdockgvS3RnV0Q5MXZwN0FoV2g2ZG5QUzcx?=
 =?utf-8?B?WTV3cHU4RndCeE9HQVo4S2RPWE1iMld4S3hDMFdXblRCcmQyMHhWRk12R3Rx?=
 =?utf-8?B?S01UeUNLNDVaUldyS0VVam0zcGZGUWIzNUlmRXlYSjJ0TmVNYU1rTU90V0J1?=
 =?utf-8?B?aWJ1SXBYSEk5aXI5eWJ6eUVVQWxQeUlNSW9pZ1U5NGxPWkMxSnJtVEZPN3Ri?=
 =?utf-8?B?YnlVcWdwVE85Tkl1UlZHdWF4clB1ckxIQUcvcE5GQUtZTVp6VE9LdFlrSXkw?=
 =?utf-8?B?bklHbER5aEVzck5NZSttbTJqV09yVzNXUDRnVGZHWmc5eWRBMmdRVGVEVDlI?=
 =?utf-8?B?anhyRUJuMUoyRTl2U094andid09EalZqYkZ6ZVR6bnNlN2Y0c2prRUUzU2k0?=
 =?utf-8?B?SWNQZml3aHVOc2RXQ0g1T215S0RIVit2VEU1T2IvRDdEZm9UdzBXRHVJVGlr?=
 =?utf-8?B?V2tmYVluUGNqLzhNZitUUDBoVGNJSjNqSVlVRG9PdVZITGJ4bElsTXRXWFIr?=
 =?utf-8?B?NjRtUUxxYUJCcDNVMzNRL1lyT0dFTmV3U1ZHMkxpeHlEaktnT2N3MEJtbDJE?=
 =?utf-8?B?WVJWeHRQV0paUHB3cnJmYlVoUnBEWjRtVFF5VHl4emtZTERiSG5ZekJjTjl4?=
 =?utf-8?B?Q2dCS0toakpDNDN3NTd2NGpTMTdoeHRReVgweWNubkVkVWtkL0NqTjlrTzB0?=
 =?utf-8?B?MzdsN0tIZjVQdDVqbU1mR1VOOXJrbjBHM2ZiK0cybmFwbU0wSzFwOEhJWXhr?=
 =?utf-8?B?eDNQVGRoeEtYQnBpZVBTZXV3Ni9za0wwdDB3ZDNtb2VDcDBFQlRzVFl4SlBt?=
 =?utf-8?B?dDN6N1JBSkdCRlNmaE1ZZmpxdzRKUDQyMXRIdnpmNms5N3hNNmZpZUNtYno2?=
 =?utf-8?B?UFRTN1hCMjRpVUhNUXVBbnY5S0ZFS1praHRJK1ZEcG1iTndMTzBrMVZGOGRL?=
 =?utf-8?B?ME13bDBPdmgwWnR4Tm90d2dIZXdFbkk4RkhhcUZkdVlKSmU5WXJWbG9JWFVm?=
 =?utf-8?B?eEY5RkhHT1FiTnBuMGtxVXpVWFNkSk9NbllJMTNpaDNGM1FUNHV1MW5KQWpE?=
 =?utf-8?B?NkZYMFQrQVdMdkhHZDhnNGZjNWYxUGdQajRyaFFvOFNzQ3JJckRrR1FObk5q?=
 =?utf-8?B?eUwranhmWXR6dCtaZGRINFROUGZZVDRVZTdqZVdTWTAyUWx6QlZCbm4rRjNM?=
 =?utf-8?B?eklxRUJWS0hXZmVlbjVaMGxKdFhzNTV5TUlTKzlCdm9pVFVxZmtMMXlaeEJT?=
 =?utf-8?B?R0pQemg0cWhRM3FOQTRVc3NZSmRIQ1VsVDl1bHJNR3RWMHJLV0tKU2E0Y09i?=
 =?utf-8?B?RVlMQkk2MTB1V2VpZkE5ZEhtaTRBRmx3M3U3RnFzUmJQMWc4NXpGK082bGVv?=
 =?utf-8?B?dnZSa3F5SkJ0Y0ZheTQrOVBGZEhoanNOeUV4SEc3R1Rza0pRM0JLbjZ5RG9S?=
 =?utf-8?B?RWdCOCtmOHpQUXpWZlVsaExJWDFhWmVSOVVLcWppek9lNGJCMzhXSk0vdTda?=
 =?utf-8?B?M1grQ01yTFNLdTZtTno3MEllT3JvbDZlMlZrajBrZnRuVk5xWU9DTllqL0M3?=
 =?utf-8?B?azJPaGxQUG5BbERUV0JwNXk3Q3A2Wk44aGhFWkJNVHFUVTI4aFlJZzZWSlRN?=
 =?utf-8?B?K0FLK2NJcCswVlE2ekIvMEJsd2hEUFF3TGw3Q2h4ZEEwQ0RLTzNObVVIR2p1?=
 =?utf-8?B?RDA4Vjg4Z3BNcFhEMDVjUjVrT1EvK2NlY3hvTUN4YWtldzJ6R0VlQ05kVWor?=
 =?utf-8?B?aDdhb1VieVB2VGswQkJwNXN2WC9rbkpENTUydHRKQUtDWkx4WmxHQ3VOK3oz?=
 =?utf-8?B?RS9OVC9KMitmZHJKbDlCem9rRFVwd3d3bExGSHUybzAyRHBrQU9acTB5VmZh?=
 =?utf-8?B?QlpQMVVmdnJYZFBSdGtKNFZaelNuV2VMQmJJL3VQUHBlZytiL1BDdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1783ff-97fd-47f5-a0c8-08dea1de9a07
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 08:50:57.4692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XQcZxrMegSAoBEeSzur3S8mGIzawP1IHENhb5RWLPtsFFX/IXLWm8Y6BY380xkxO4mD2AqZXiQ///CHCpfDYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7426
X-purgate-ID: tlsNG-33051d/1777020662-48BA8938-3BBD6C4B/0/0
X-purgate-type: clean
X-purgate-size: 4305
X-Rspamd-Queue-Id: 6FED245BB93
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid,citrix.com:dkim,amd.com:email,gitlab.com:url];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Mon, Apr 06, 2026 at 03:11:58PM -0400, Stewart Hildebrand wrote:
> Currently, Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If
> firmware initializes a 32-bit BAR to a bad address, Linux may try to
> write a new address to the 32-bit BAR without disabling memory decoding.
> Since Xen refuses such writes, the BAR (and thus PCI device) will be
> non-functional.
> 
> Allow the hardware domain to issue 32-bit BAR writes with memory
> decoding enabled. This increases the compatibility of PVH dom0 with more
> hardware.
> 
> Note that Linux aims at disabling memory decoding before writing 64-bit
> BARs. Continue to refuse 64-bit BAR writes in Xen while those BARs are
> mapped for now to avoid mapping half-updated BARs in p2m.

While Linux does the disabling for 64bit BARs, I wonder if at some we
will need to handle 64bit BAR writes anyway for other OSes, specially
with domU support.

> Resolves: https://gitlab.com/xen-project/xen/-/issues/197
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v3->v4:
> * rebase on dynamically allocated map queue
> 
> v2->v3:
> * minor tweaks for fixed number of map/unmap slots
> 
> v1->v2:
> * rework on top of queued BAR map/unmap operation machinery
> 
> RFC->v1:
> * keep memory decoding enabled in hardware
> * allow write while memory decoding is enabled for 32-bit BARs only
> * rework BAR mapping machinery to support unmap-then-map operation
> ---
>  xen/drivers/vpci/header.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 20fe380552f4..dc4f585b4e40 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -670,6 +670,7 @@ static void cf_check bar_write(
>  {
>      struct vpci_bar *bar = data;
>      bool hi = false;
> +    uint16_t cmd = 0;
>  
>      ASSERT(is_hardware_domain(pdev->domain));
>  
> @@ -683,19 +684,29 @@ static void cf_check bar_write(
>          val &= PCI_BASE_ADDRESS_MEM_MASK;
>  
>      /*
> -     * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
> -     * writes as long as the BAR is not mapped into the p2m.
> +     * Allow 64-bit BAR writes only when the BAR is not mapped in p2m. Always
> +     * allow 32-bit BAR writes.
>       */
>      if ( bar->enabled )
>      {
> -        /* If the value written is the current one avoid printing a warning. */
> -        if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> -            gprintk(XENLOG_WARNING,
> -                    "%pp: ignored BAR %zu write while mapped\n",
> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> -        return;
> -    }
> +        if ( bar->type == VPCI_BAR_MEM32 )
> +        {
> +            if ( val == bar->addr )
> +                return;
>  
> +            cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> +            modify_bars(pdev, cmd, false, false);
> +        }
> +        else
> +        {
> +            /* If the value written is the same avoid printing a warning. */
> +            if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> +                gprintk(XENLOG_WARNING,
> +                        "%pp: ignored BAR %zu write while mapped\n",
> +                        &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +            return;
> +        }
> +    }
>  
>      /*
>       * Update the cached address, so that when memory decoding is enabled
> @@ -715,6 +726,9 @@ static void cf_check bar_write(
>      }
>  
>      pci_conf_write32(pdev->sbdf, reg, val);

I don't think it matters a lot, but here we are changing the position
of the BAR in the host memory map while the mappings are still active.

> +
> +    if ( bar->enabled )
> +        modify_bars(pdev, cmd, false, true);
>  }
>  
>  static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,

As it's in context here - we possibly want to do something similar
with guest writes now that we can?

While we might not have a user-case for domUs ATM, I think it's vest
if we also fix that use case at the same time that dom0 is fixed
(unless there's something that prevents it).

Thanks, Roger.

