Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPCrJNg7qWld3QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:16:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0148E20D51A
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:16:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246254.1545460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy3sQ-0003eo-0v; Thu, 05 Mar 2026 08:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246254.1545460; Thu, 05 Mar 2026 08:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy3sP-0003dU-UR; Thu, 05 Mar 2026 08:16:09 +0000
Received: by outflank-mailman (input) for mailman id 1246254;
 Thu, 05 Mar 2026 08:16:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NtvN=BF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vy3sO-0003dO-LV
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 08:16:08 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ee91161-186b-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 09:16:07 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN6PR03MB7670.namprd03.prod.outlook.com (2603:10b6:208:4f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 08:16:04 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 08:16:03 +0000
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
X-Inumbo-ID: 8ee91161-186b-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8EscSIkYhwy37DDGXCQKkzLGtK9lLCV1+hvrG/xQ4DI4sbWdSmsI5+YII3LRvnu78RloW+OXUP5MwaSnx+Ce2TmGKYuytpZd2A6JOm87IWOp+K7UvNKnOhnRGBtpRaNOIugRjEv6SNp/jH8w69mcmwURPlwp383RbfP9Ve3CdPhgtFTcmabDabQ6zsRkiR7SSlV305DkZnY5FoeuirH2Va+m+sIRILPhXVgbOpg/Qqdz2GFaqycerqLw5znbZsTZBl7/iw7XTzFccUXebgNYFjcyrLw63/17CE6Cp+BY3wey760r7OkhCQaaboTEcIHiekEzFLY3QIg0zvFJj/Mrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXrrTFjBnPUpxvOLmHQfRDee3fworYRtsARCth8g27o=;
 b=WDQ+r2/VagFGjOQbeNOPzEqSEd63UP4YFNjhhFJFyli2+wTvaTYb0knDqzZ9cn/0MD7D4f4AtLxI6nwaXHRI9EIwghntaXp3VoDmh5g7+frhmloTM214KXHpAZ8ujbgmsQCCyZVbSlrT9kr5BWzOFNgQ9ItBmehucM1clPh+z2j1j28QFSL+dppVplE91+l+bVLOpIVdftWt2FH/Pu3SuoDRYU8eDXRZUO1BsMDgiivgsLmKGoVEbHCTJ2AQWkJ6EcYGvu8T++k/YEOHpuvHJaa+dmzhPHaATRZl4in32ISXr2tXAnqaoVlhoEvDWMT7/iiDEDfia//7u4sa2W+yRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXrrTFjBnPUpxvOLmHQfRDee3fworYRtsARCth8g27o=;
 b=P2m8dd2oB7z1bI0l9M44IU+H5GMtf0pboBko8PvOUHvsncxuCZ6d2uVi8aHX8xaJxAzEQ+3VlMnm488OuOKSIt44/9U1kborbHhWjI6OpW0r3fOKKNRW8yfJv4aAjYEeyqIpHXhPCa0GrHmpeGSsB3fnlJUIHeaRZz/Ppn3pS6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Mar 2026 09:15:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] domain: use unsigned loop induction variable in
 complete_domain_destroy()
Message-ID: <aak7v6VGUcNREXAW@macbook.local>
References: <7af56fa6-4254-4704-9843-a0d099e6bb0b@suse.com>
 <aahSBk--J_xqEzOq@macbook.local>
 <80129c3a-77cb-4cb1-b3fd-128454e3db0b@suse.com>
 <aahtt0zo0nCb1eSt@macbook.local>
 <1f80f87e-8e58-45de-8785-1efec5169176@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f80f87e-8e58-45de-8785-1efec5169176@suse.com>
X-ClientProxiedBy: MA2P292CA0025.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::9)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN6PR03MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 1615daf4-4922-4e70-92cd-08de7a8f70a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	Pbowc4iC8uTzPeOIGHNUHl8mZJo43h+KS9MIKZeQNb+sfbGyvCvqaYuBjC5PtEfPE/d2euyHLyBMmle+71iiwm3PKGjgA7i+j7gAMyy4Tjqjm+7KkkeziBVfIacxKACZh1JGAP04sJttmgCry4/ii4oQvp4P1jQNlPDD/Ej2+X5i8YsxiRe3YAy3zTPkHfc6ycVc8kPgYxJlIVBGnWNmRjLJmdbqhj891SkppElVxPx22awnUzyGWjFNIXkNNirm/eLch53hrNvmhYo/sogkF8e4h5DZM/sDLHO3g4/HtdLK+3CADLJ0tDWO0XqVUC+emYKXvAPmLVs39kU7kxo3M04k0i8Knt1GowZnEPNmQ5rv27F8fEoN7U62DN3OCv8P/H6oukoXxFpjS7+YHfrfQhT9jbAX8BPpuzsIOR5rrIWxiwflwf+NkNjM8XoJbtc+pC1vN8UDa+vRsn+Lk5iMG+4kVFGBtx86ue0kMc1vyZv/WynAZPUV+4nRD01TOUE5KU15UtsidTBC18pKOfV26EFVwt04JFKDnTrvqcN3quYHuOG7QWSGHZzlJsRUkBC84DrXkrKYPekD2Uz/lkkCnSKFlWvWA5O+iJhUhp8/kJHFahgN8b4+1pS9KRTJ7eLQy8AFWlTSk/GO0e9j7MsJqd+/4NeVSUFIfuy9ug75AfgoyMrlK+3DYrNBGS7RIrtQFt57YI3snRbJY9I/95k/cbllXEEWNbRVpDAW0JhicQc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGxpSURiNWJ6NjhTaXRCSG9EaGxmaHJKTFh5NzVQSGNrSEVjZ2NQTHlLVnJP?=
 =?utf-8?B?WkY0bUxaS0Rvc0svd0JiNExVL3pUeHRwck5ncVZkQ0daSVh3UUNlRCsrOURH?=
 =?utf-8?B?STVyaitQbnI2Yy94UFhtRnAreTlvb2dkRDRtNmNSOGFyYVRVMklrNzdVWG1u?=
 =?utf-8?B?WUxxMlJSYTcwc1FDc0ZaZUZNejgrSGdkcXB6cnNYWWdhcGg4YkJxb3pyVDVM?=
 =?utf-8?B?b3c1SGhjdk95clY0bjVXTTNMTDZGUm1adWgyeTU1eTZKYWt0d2JsUkoxOFBN?=
 =?utf-8?B?WklpaDRBNnE2VVVibXc1RWlRY29FYlVxTm1kamg4ZUFGblAyWkNQdkVvSWM3?=
 =?utf-8?B?eG5qdUdlSDZ5SytHeXR5aEFIQ0FabDhPME54TkUxWlRldFYydHZaUG9QTHIz?=
 =?utf-8?B?bi8yTHh2T3lreUFPK0pLSXlQY2paUm5lWVBTVWlYRTluUHFuVlgyZFFEbTR4?=
 =?utf-8?B?N0p6eFdUUmZVbSsxbjJ6ZUpSWER5TG9PdFl4OTBaeFJiNC9EUmFpaGp5a0lH?=
 =?utf-8?B?ZlUwaDA0V0hwdzJmd1JOMWlseXBrY2xOa0ViZFpreGp0cEdTbU1DTmZHRmhO?=
 =?utf-8?B?L09ZeUdSN1l1K29zVWlCaXo1djBRMjZtN1BBalF4WXlic3NpTVNkZUUrbTI3?=
 =?utf-8?B?ZzBjMStSZVBqYjZCcHFXOER5NENXc1JNdXBXUzFQT0Z2ZkplaFZDYjBtbGxC?=
 =?utf-8?B?cFhkMnVCeE1aM1pKZEg4WGVzOHlRT2NYdGgrZVpzY2Nsd1VabWU2emMyWUM5?=
 =?utf-8?B?NnAwMXRsREw5aHFrT0cvNEJ2RUxmSy94NDkyUHlxVlE1cUFzdHNWSFdYa3ZW?=
 =?utf-8?B?QmlYTmxhK0h5S1hEL1dySXNZVnNWMU92bDBxazBXdmZpM3h6N3B2RzZJWndD?=
 =?utf-8?B?T1g4b2FwbzVQMjNsaUNpdWJqSHFKaldkZEZjbEY4TVRLemdUc3hOUXhGVzE4?=
 =?utf-8?B?Z01RUDJEZFllaHdNRHlyTWtiaXkxU005Q0pIcGMybVl4T3pYZ3JKRFFPOTJY?=
 =?utf-8?B?MG0zWGd5L1dMaWJNRUhTRmRFSGI4RTBJZ0RKeWZGQUxBd090aDRjY2paanFj?=
 =?utf-8?B?ZHpIZmZXY050WnFYaGQvNDdDQXdWMHFZcENVMzNGOTVvM3B1TmZuME13ZnZE?=
 =?utf-8?B?WWZ0UFVBUHJtMy9xY0I1b0h3RUhLT3BYMFRWZkI0WUdrdHk3WXk0UytmQkJ5?=
 =?utf-8?B?S3ZjUGp2R2lUOWhMck5SM2tHVHJsdkJLejI0eDdCMnowZHlIc3NjcDU5RzZw?=
 =?utf-8?B?bS9Sc3FVejM0dDhaUzZFSkRpR1hiQ21VNjZBcEU3TStnUVhqWHBKS1hDaDBk?=
 =?utf-8?B?aU9rcU1acnFNbnl2a2t2S2dmcjRSWGNKU1RFZlNaVUh3bUdjVWlNbTZYNEVV?=
 =?utf-8?B?NGYwbWpnSnovelIxNkkvMklDMm9tanp2ei9sdCsydURDNldwUDZNT1pkeEZq?=
 =?utf-8?B?Mk1uN3pTOE1ZeHFld21rNzliNEtsb3BLQSt4UWZlQ3dNc2U3ekFCS1d1dzN3?=
 =?utf-8?B?TTRPcDRkRG1sWWVrckRqT1ZaRExzVDlFbnBiOXlJOUlHcFllS1g1UU5nNmpm?=
 =?utf-8?B?b1lSa083U3o0N3g3LytwNzRYSEpTN1preksrbjdiSWFIanBESkdobUNuTlpK?=
 =?utf-8?B?UWRKOFh4TFhhOXExUkNmTkQrM1puSU0vaE5LVFd3UUNlUWxkdXJ2ZWEweWdN?=
 =?utf-8?B?Nkw2L2ZrTWRWbjc0U2tOYnFtaDR2MWYrYW9xWDV6OGd3a09VV1ZoY2Y0WDlR?=
 =?utf-8?B?cHVqVmNZNEZXWXo1TUZWWWtrMWxGZ1dCQzRka05PZWtaZWIxK3ZuZHB1a2pR?=
 =?utf-8?B?QjRaQU1YaWxsVy9PNG84R2dnMU1sbVpvM2dsVlFVZTA3MmUvd1NNVlNLTVpW?=
 =?utf-8?B?dFM1SktBWFh5RTNFbitYZnVPRkNiVTRBME40SFRPM3RqekZWZjBRSXkvT3h5?=
 =?utf-8?B?UmM0WWtwR1k5K3RxMW9hMHZBMnkrY0tJc3BpdkJURzM3OXcwdCsycE9TWi91?=
 =?utf-8?B?Vk9TUjRMajREWHB1a0ZWN1Jab0h5UFIwWEhPb0E3RWV3ODlqZ2tZRUhSUEQr?=
 =?utf-8?B?NXZHVEJsVUNIL2YvWE41OTRJVXlURWtDL0tVcE1XOEd6a3oyNWNGMjZzbzU2?=
 =?utf-8?B?dTRKTFBVVkh6ODlVSDFTVi9JeGI3Ykkxa2dDdFRzb1pQVmFFR0JnQythdEFw?=
 =?utf-8?B?WGpTbU5NY0YzOCt6azVZRFJHOUUvanZ3T2M4VndNVWdlUTZHTlNlL1B1QXRk?=
 =?utf-8?B?aWZyT1ExNnVpMFZJUTNBVjNOWExSdzUxRWx5ZTZwSGFHOVBLanJWNEhDQzI4?=
 =?utf-8?B?bmlMMzhqQUk0bXN5aWxrNmg5UlBpcFpKQnRpOUhDR3ZsTXRiSmY4Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1615daf4-4922-4e70-92cd-08de7a8f70a0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 08:16:02.4003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5HOahORdvJkpARXWbhuf+5811S69rRRgBVWRvuI/ZkQiYkb4orHoj9FzYqYpGbfXHgh2Q78QKNHUrWMf8Rgeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7670
X-Rspamd-Queue-Id: 0148E20D51A
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 09:07:55AM +0100, Jan Beulich wrote:
> On 04.03.2026 18:36, Roger Pau Monné wrote:
> > On Wed, Mar 04, 2026 at 04:48:07PM +0100, Jan Beulich wrote:
> >> On 04.03.2026 16:38, Roger Pau Monné wrote:
> >>> On Thu, Feb 26, 2026 at 10:01:45AM +0100, Jan Beulich wrote:
> >>>> --- a/xen/common/domain.c
> >>>> +++ b/xen/common/domain.c
> >>>> @@ -1475,7 +1475,7 @@ static void cf_check complete_domain_des
> >>>>  {
> >>>>      struct domain *d = container_of(head, struct domain, rcu);
> >>>>      struct vcpu *v;
> >>>> -    int i;
> >>>> +    unsigned int i;
> >>>>  
> >>>>      /*
> >>>>       * Flush all state for the vCPU previously having run on the current CPU.
> >>>> @@ -1485,7 +1485,7 @@ static void cf_check complete_domain_des
> >>>>       */
> >>>>      sync_local_execstate();
> >>>>  
> >>>> -    for ( i = d->max_vcpus - 1; i >= 0; i-- )
> >>>> +    for ( i = d->max_vcpus; i-- > 0; )
> >>>
> >>> Is there any reason we need to do those loops backwards?
> >>>
> >>> I would rather do:
> >>>
> >>> for ( i = 0; i < d->max_vcpus; i++ )
> >>>
> >>> ?
> >>
> >> I think it's better to keep like this. The latter of the loops would better
> >> clear d->vcpu[i] (to not leave a dangling pointer), and there may be code
> >> which assumes that for ordinary domains d->vcpu[] is populated contiguously.
> >> Hardly any code should touch the vCPU-s of a domain destructed this far, but
> >> still better safe than sorry, I guess.
> > 
> > Yes, you are right.  sched_destroy_vcpu() relies on this specific
> > top-down calling.
> > 
> > Since you are adjusting the code anyway, it might be worth writing
> > down that some functions (like sched_destroy_vcpu()) expect to be
> > called with a top-down order of vCPUs.
> 
> I've added
> 
>     /*
>      * Iterating downwards is a requirement here, as e.g. sched_destroy_vcpu()
>      * relies on this.
>      */
> 
> ahead of the first of the two loops.

Thank you for adjusting that.

Roger.

