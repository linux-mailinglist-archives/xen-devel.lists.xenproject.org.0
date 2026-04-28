Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHTeJtPA8GlPYQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:14:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CAF486B1A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296296.1572718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjCg-0000h8-GU; Tue, 28 Apr 2026 14:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296296.1572718; Tue, 28 Apr 2026 14:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjCg-0000eW-Db; Tue, 28 Apr 2026 14:14:22 +0000
Received: by outflank-mailman (input) for mailman id 1296296;
 Tue, 28 Apr 2026 14:14:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHjCe-0000eQ-Mk
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:14:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjCd-009J2y-De
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:14:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0c0af-2eae-0a2a0a5409dd-0a2a45099218-48
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:14:19 +0200
Received: from [40.107.200.21]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f0c0b9-2497-0a2a45090019-286bc815444e-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:14:19 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV8PR03MB8162.namprd03.prod.outlook.com (2603:10b6:408:297::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 14:14:15 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 14:14:15 +0000
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
 b=sf/qiIDfiHlCk1JhIfP6XCLoIcrXeMuPK4KbtKZovUDs5JPPvftKC51IIfhXeGohLLDjkjIurf7wUFy4E9LLLb8FUH7+BVm4BtovAqKWPy0mYOIoe558FNW+1BYNqzVgzhzY5l3ghj2dLvA/IXPMtjDG8lU5U5fznLkzU3wQPysrB6OzVkD0Tb7c+AtrF51NI3HVVU9je+v76iFGwY16EhacLgw4+eJ7cFS14EqulX0DGvugFP0XRSukt8cNIo5igW3nj1Sw2IELPsoFICQ88yul1TFsLmY1R6WDVUr5GxJvaEOgScGsAKjXzoNF3wv3S0A4tsdEq0Sh4CU59vEMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CukSQNxOQSTJ4dLPqBWpRPut0hjkzvM89VnQxwzgTE4=;
 b=KKSl56edqDM5fr0Zvci3oF7p/wTBzWVQ/aSA86w+a4sAt9+KdIVYx6nkX4eJISrgswywEvef7l4uwYAbgssqSg+LvxTnfhiYquizvwmO98NEB33/towWR/o81EeZD+LnTvQy0nTW7FHG/wAUlHdURB6g82LlTWJO1llgMr619o4IgFZbOb6tRwHcNbHlIHToI9OiBin3PmC6D8kxhj0T813HNd+9Ca7hfljgPMN5Lhj5WzgLvUZKx1U6UtThaf4X8hg8FwIvxqtBFBL1PrvfQqwFXdvxWFcH3JbjPlHhDSD03HFpEwPdV6ZMW1XcIq2dZgRkAsPPiFCRmz5aCwQ7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CukSQNxOQSTJ4dLPqBWpRPut0hjkzvM89VnQxwzgTE4=;
 b=EFIH2U8ZmP4d6z6JIt6me6+PGlieYGyuYHRkDAH6nZgiModxO0aKDSCAhkFKs9elu1Kfl3oIPCRC1PeZh64CxKZ725bbEoEPeKeYIPGmBTVNO0C24lJ88GQHZ8wCxrBwSzC3PaPxBmarpOfi3TprFF3MsM5NftEah9a7UJctx2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Apr 2026 16:14:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 10/17] hvmloader: Add support for
 HVMOP_set|get_ecam_space hypercalls
Message-ID: <afDAtFhFZdrWXJZV@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-11-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-11-thierry.escande@vates.tech>
X-ClientProxiedBy: MR1P264CA0183.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV8PR03MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ea1356-9257-468c-e11a-08dea5306dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FE5AeQAndyt/XEYaeVtD+Nd54MhfgWVpdAS5f/8c1pFpv3VrfeQNTf837+/Iu0ojkjoGI1bVCpK0ehAMO4KJOCmIAaMHg0L47MbRAlh55iKZMKLljkiZxP5nqAHnKvB0g7UMuX1URqSWR/k/0yGvCDMwciDCaodgVnwaA/lk/cFALtEZL/C7uBRzGiHb09cnARj1Qbi7eZPeGFIBrteE2WRyHWUSuVsaK6h0UFzaasv6JvS4NwhnYQ32EJQc1dsQ5kVI0TrS06QpzbdSDrALMqO1DBlaNmN/CewA5AOTnLGXHJzP+e0JjYJx+NCCoiMfKHtoHI+8I3V9B7e7QyduGUvGOIVXrwKwIXXSY5lM5krbmgYNJwJ0TkbBlXO5VEGRINda35WapDogeAQyCUn6g6Z+sTqP0LzDmkOXDoWZ19qWvMUlj6fXpr/i1Dry37Uw2YMrsRexi4r0/7hW22RUxCokCFcXAF6l/fJ4+Tgq2GbonwJ+6rX+Oprtf/gT9GSWmXg5ga3ZEeAZ4FSrARkm+aNBKeqhw5tHVProj6XkUpn/euRs+bZzKKFNzXOdUemtTHDDBRoamWLNrrW7T/fliq0I6hQVJcfB74shx3UGRdbtpRrVw+wUs0Dbm+04UMYqlogXYJsHXTprlOJh1zrkZ5Z5Z09TOa0onwjtJ3vffSpoJKsnHsdnQxQJ8oiZFTJZZHkHiglWBmJH4qRDBo/l5RjC2JRhn+U0BLAP0EivXB4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXZNQzJYTDFRVzhicVZJMC9JNTlMdG5JajZYamY0Z1F6OExQK3RvUlZuSnlN?=
 =?utf-8?B?VHI4WkJ2L1NBM1ZORW91VTlzcHkxMHp0YUJTNXRveVhkZGNHaExGNkxaUW9Q?=
 =?utf-8?B?cGdqaExLUmI4TlNmY2NJSzRrSXRLbzFKaUVCdEZBbUxFYnRtdVg2OG9DUlg0?=
 =?utf-8?B?NTRyczdoTCtTUFE4eGtOWnhWcTMreklQNzliSFpyUEtWY1VJd0tKYmFiL2ZB?=
 =?utf-8?B?RitLUk45RGFINXJsWkZSSENVb2J5UnVVdkVicGRDaFFSTElhT2haM2lBZ1By?=
 =?utf-8?B?QnJZOWlmSmExa1EvbXpQWDROei8yYlJEWWNuaEw1V0hpVGJGbW5LcWtPOFdH?=
 =?utf-8?B?MExjYkdZM2VLRVdjUkU2aXU1bGVqWFAxTko0NmYxN2VJc3RrQ3NDd2diU1VN?=
 =?utf-8?B?TFNDUEM0cDd4T3ppbXJqWmhzRlUrTTJQYTZVUGdJZ3MxN042clIwajUxeHBH?=
 =?utf-8?B?VFlldjFPMHpjUThyNnJNUCt6ZFVMdENZTzlCSDZCRHQ0OFJnRCtUd1A2Nkpz?=
 =?utf-8?B?a0VJc2F4TzVyYVhiTXl2WkVNK0tpei81K1NlOHQ3K2lFZkV3RUNuUmNucWx5?=
 =?utf-8?B?bnduaENuUkI3NDY1UTFROCs0N2M5dWRUcXhWQW9PVUxNWFljTEhlR3VSZWdr?=
 =?utf-8?B?STJhd211UlR6K0s2enBXV2xsUGZsT0Z3S3h0dFVuN2J4Nnd5a09DOWo2emRx?=
 =?utf-8?B?QVM5SHFORVZGSDBzMW9MUWo1SVlrVDZOSWNkdDRWK3d6U0VXSlVaRE5GM3hC?=
 =?utf-8?B?aVQxTUYreHoxdTdPekw3WEtydnhPeUtqUDVwaWFhRXZRZW9rY2dCOHhiRWJN?=
 =?utf-8?B?YlFkZ1VSSi9LSkdmKzZqUEVRQjl2NDYxZTdoaVFwSDAyRFdndk1kQXVFNTRj?=
 =?utf-8?B?TTlvVFp4bHg2VlhMR3BxSWZteXdvWEZzMk9qT2xaOXBkNHRGVlZ2Ti9VUlVQ?=
 =?utf-8?B?Mmh4U2h2Y2VDVmdUZ0NBQ1FaQVR2ck5RSW51OWpyWGVTb0gyQXVWbzNCR2tT?=
 =?utf-8?B?TUtuOTV6ZDdmc2Y5Tk5vczg4dmNFK1N3Z01ZYTZicFk5NkJ5NnVobUdBUkJD?=
 =?utf-8?B?Z1JudTNkZTJHYWdtZHJMVEZGRjkxQkJDZEFWL2Rtem5TM25YN3RsdTlpQkVw?=
 =?utf-8?B?Zm1sTlV0QU8xbnhCV1A5Z2UvWkR2UU9TMjI3TkVSOHlTRGxrRENFNnM4Wmlr?=
 =?utf-8?B?d3plZ0h1QVBVdXhTU0wwQllidTBTeWhiWjFYcGlzM1BDWUkyQ0d2WjZHcGFj?=
 =?utf-8?B?VHlBY2lQODlEdUJpN1M5a3E4S2lqQ3NnTERIMzl3dEdERk1KVjdFVG9vcXJ1?=
 =?utf-8?B?bGx0eDNsSzlaQ3kzM3lhNkpFaG5wanN4TGUxUkJNSWZwNlNHaHVqRmVoME9r?=
 =?utf-8?B?YnRGM3pBdzhrREpuQXB4cmlQZ1daRy9HQzY2Mmw2QytkSStBUXZIT2VKYUpU?=
 =?utf-8?B?RFFkS2EvazNjYzlWbHExVkJ4eW52SG04Sk0vVXdXc0k5Mmo4ZW5PV3ljOHVa?=
 =?utf-8?B?MmlJNmF6Y2NiVXViUVlycU8rc1pFMTFVeEs1V01mZlB6NVk5WGRReE9QWXNl?=
 =?utf-8?B?Z3o3ckpzbm52SzFIYTZYYUI3SDdyS3RvcGZFR3I3RkZ3NE5YU0xKQ1ZSSFJk?=
 =?utf-8?B?SzJQUWF6eU9SV2xpMjVYOHZWdW9WYndlbCs5V1dWNHNCNkFWVklhVkt6TlRQ?=
 =?utf-8?B?MkhGT2t0Y2dwbU9zWUx0Z3lqeWpSUThod1JMd1I5NmUrakl2TDRYeDY2RXRk?=
 =?utf-8?B?L1p0OE1lN0RvWitiYTRpeU9XdjVhNWo5NEZCOXd2T2cxVEtPTGRBM0RRN3NK?=
 =?utf-8?B?bVAyWkhZQXZMSis2b0kvVzJhankzL3hITFBOQ29HcnlTdlh5NmlBZFdWbEc2?=
 =?utf-8?B?VEl5Wml5WnNibjkwREQ1Qk1Kb0NkQ2FVK2YxMXlYZldCeEdGeHhMNEdEaU5r?=
 =?utf-8?B?SUlzRFk5SHBlMkYyNjQ0Q0hSdVBkSzJSelpSSmhJbkJxQ0ZhN2FrY1R1S0hz?=
 =?utf-8?B?dFBacmdISmtSdW1EL2dLeTd5NUJPMWtlUmp6ODJ3amZnK1o5TSswTklEaGZk?=
 =?utf-8?B?Sk4rWmpGQnZ0eHdmaUlKS1huS0FhTXpLWGF4RFV4aWRzTmFpS3dsdWJvTWFB?=
 =?utf-8?B?eDNmTFI4L2VjaERkSXpJTG9FZ3RZZlltSVZiektoRXJ0WTUvdFBJejFqNjgy?=
 =?utf-8?B?TkorUVRGaG5rSkhWTjFaTU5CVG1XNVVpZ25UYjJMMTd6MnVEYzd3SW9ZUXdK?=
 =?utf-8?B?d3Y0SjUxQ2F0ZHkwSUJ2dDUxeEVoY05IWWg1dUx4UnlsQnlQZFVwYnpiSEw0?=
 =?utf-8?B?a0kwQnJKd1UrQWJmNThUYXNGMW1SWDhxdFJpRnRzRmhtQ1EyVzFrUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ea1356-9257-468c-e11a-08dea5306dde
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 14:14:15.6528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVXixGOTO9wQqbZhP2G6DRiT7+umBOWx+LO83ghzqwg10VBad/AHweeZpk10IKXcGDsaJ9oxlAD5p4Jy+97xKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8162
X-purgate-ID: tlsNG-bad1c0/1777385659-410B3A53-840F370E/0/0
X-purgate-type: clean
X-purgate-size: 487
X-Rspamd-Queue-Id: 08CAF486B1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,macbook.local:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:03PM +0000, Thierry Escande wrote:
> This patch adds wrappers in hvmloader for the hypercalls used to set and
> get the ECAM space base address and size.

This would better be introduced with at least one user, as otherwise
it's just unreachable code.  And then I'm not convinced we should use
hypercalls to set the ECAM position/size from hvmloader, if it can be
done using the native registers and QEMU can forward those to Xen.

Thanks, Roger.

