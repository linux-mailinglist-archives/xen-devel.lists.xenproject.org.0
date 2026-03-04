Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM6dOJtQqGmztAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:32:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52884202C26
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245631.1544977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoD0-00061h-7O; Wed, 04 Mar 2026 15:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245631.1544977; Wed, 04 Mar 2026 15:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoD0-0005zI-4a; Wed, 04 Mar 2026 15:32:22 +0000
Received: by outflank-mailman (input) for mailman id 1245631;
 Wed, 04 Mar 2026 15:32:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY7Q=BE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vxoCy-0005yS-8s
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:32:20 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53aca5bd-17df-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 16:32:18 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV8PR03MB7325.namprd03.prod.outlook.com (2603:10b6:408:188::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 15:32:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 15:32:14 +0000
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
X-Inumbo-ID: 53aca5bd-17df-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWAJIsLcxWvypx2GnfaeE8md8UzmTA1ILTpWTutYwf86HGTvhyky2ehCnpUSn91mHx3v/lEX/HgzQGx2tTFVbi3k0vIw/PTX9pgwsuo5Z+HN6Ifa08W1ELFocHQXYfE9bDO3BMR0SgnG3AdlMUq0KEQJzzFTsHKIy0RT5yVLGDx3RGDaqEIlqPRTjRK7ukWtevro5hCTkkyhpzUWQAvZsTBNwp7rHUffkYPL2pdd5rqFeGk1ips2mqJFHOrPeciR7YA6KOusSsNWAmyMUXrotZ+g6xD57pyBccw2CT8x5/2D7AF2zVGJkeedM2U1fjH9uUIpjpDYJYZiyq9S9TXUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vZjbpBAy9Snmo62R0tvM+zuvAYrogOKQcidS+/0Y9o=;
 b=p7gyEIdr8MIKQ9wiHC3VGSW6yuHeCakormIljCA4huyR9dFTVjrHkLOju0A3i5G7sGFkdahaLqZuuQHXeC47jm2n+AbWk84QupY0rACqgGJ4oSL0dHjzTm8rnmKELZXDGBXJbg6hq8jQ9IGY8aLmMugnsbZQ2k2xw9mosaf43kPvUO6pkmZm9spCzh80yXqZMsI4TPOQ3hWoSmv/YmeVcyjnYlDix+QakMxzelTnOt+7FSTT8TmtcRkeTo18xFJmFCHGEwsMdv2jsRwaMu/s/8ncNXZ3yr0cMUo4dHAd0bZbsqk9DAp7L5C4vjrS0tQ+GuoMRpyYC4XgiAwJ+ugOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vZjbpBAy9Snmo62R0tvM+zuvAYrogOKQcidS+/0Y9o=;
 b=hIWnuMpE6s0fiXmhqF0VgFLeYgkTvWilE5DHm0I4HcEVUzI5H844GA0/Zu3wxhbymvIdyzTNndzhKbdQfFRnVSFKDJFcbc+keAxBHKpGYHAO+qy1IcG2UWCvuJLIv7lbVeU+J3vsaySjCcROsoLINMyKSqAS9BYW817OavXz99Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Mar 2026 16:32:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ariadne Conill <ariadne@ariadne.space>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Steven Noonan <steven@edera.dev>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/vpci: do not use pci_sanitize_bar_memory for domU
Message-ID: <aahQe_rQlBrjQlCh@macbook.local>
References: <20260224231235.6277-1-ariadne@ariadne.space>
 <1d832f36-d22e-42c6-996c-d09c06376b8b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1d832f36-d22e-42c6-996c-d09c06376b8b@suse.com>
X-ClientProxiedBy: MA4P292CA0011.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV8PR03MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b1599a-6006-43e7-cd82-08de7a03360d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	k0byp1qlmkHNUWfjfLZOtUl+qPw2n+SgFALBiMsDzp+bWS7QIKSfXVLWeLp6v4wzgPzla4UNt7khqgVEvtqqea/YIaR9Wx5uFdLRZCyT0c0uSDn3pH8vzfAB8YzXKSMSOb0CAvUs9c0hRwiLkYFm/SF18kWmqFxH0pKXKAjLgUPVGBpriXUREpeQjbsXiKPv4QmAkLydrRPUXDzTvEctY94n8wUxdcfsxAqVWdOB/gxAOOxDqxfKLOCd1lZjjmDaN+NeEWWPKfhLDxvGRF7uhCwTpGUaAtVIynj7rH83bpCGZiy/bnPDcnRsjpNvhHQvCMYuWHLbjoLRT0yosEH4KjIvROsQp7HiHyKmJp4q7xr33osF16y9ASx0QdK7wYaChtcwY/UW3RXbhKi87bG8mEykerwOk+Kz7OGVrz0hWTBRpX2b2FWlDFGUFDAvxusTUkycR5VtQ5BD3ZiXlNgl7c4KzIzOILsgpR6hYppPnUL+jXnlsk9H5sCS9wjP7p4HsIF6umS4HPuQusoppo+KnDYfSikanSWAy3BRKJxBw1ZhlRf1CuYR613Uf8wLNizbSf6iCopg25fR1Dx156q0T55YN1xrQ6iiaYcXUNKnWbID6E2fx6Ikd2BrA1qy1Nn1n9WnUXQ+P02IzleAdcV7kIZ3XMQzibCy8KrOccqczMMCHQGTyJKYz58jiJww2N1hkIc003BCUvnLz020l6+RSkBojjCVZ3Ghalx+OKMFcWU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFREcW1uQ2xiaWxrU3I4TDgzSEo2amVZbGYxbjZHK3BvSzNBUVBrK1Fzc3Uw?=
 =?utf-8?B?TWJIVjRMZGVOTmc0bStjNEdZRHUvR1doZGJIbnFrU2tGWVRDWTd6YlJUeUp1?=
 =?utf-8?B?TXRpZmhQc0hHUUJIQVhjUmlFYW9lR2xZMFFiaWhKS05qYUg5U0JWYmRIbThy?=
 =?utf-8?B?djdIbG9zaVhud0dQRkRkZGUybE9PM1pFWk5QZVF5cEJsT1NiRGJIbGJqMjJh?=
 =?utf-8?B?bUxoYmJha200OHM2cThINE4vR2dhRWpQU3pLQjVSVzR1Z1lvTUcxS3Vhdktp?=
 =?utf-8?B?Y0ZvUVJGczE0NERKZ1ppM2IwdlVUQnQrY3k5WUtwL0F4aXlaWUdBNlAya3Jm?=
 =?utf-8?B?VC9qblNLSElYU2MyQ1dGenFldTg5WUNGcllKMGVobG9wZXo1YkVJbWNKMEF1?=
 =?utf-8?B?UUJXUklCYkJkdnlhVlJVUVd1VVpwZ2VmRHQzTnNlN2ZGWDRmakFVRU80Z0dx?=
 =?utf-8?B?QnRVaGt4YnhrRnNGNlhiWlU1NGlsaG1GbnRSckNDdElRVVZuKy9sd1JRbEdw?=
 =?utf-8?B?a0lFWEtlamZpOXR5MEE4MnF2SjFCTXh5Rk5lN0dOdW5FQlJEbFRQQnhjcHlp?=
 =?utf-8?B?Nmt4MDBua0pvdEY3UEpVWDZ1bHEzQWtDNVZlaGczQWFoNGpwSStkdGZhRlNk?=
 =?utf-8?B?QWRFSmYySXlVeEJCMTNkanpld1ZhYjk3bDI4eVZlTVByV1JhWTR1RG1RYzJj?=
 =?utf-8?B?d1hwcTFqeXNJOENlcUZ1Rzd1NlJTdnEvOGZTRmNmZGF1emtjdU1RaEFGNzUr?=
 =?utf-8?B?aGk3VTZVQ0JiaVNLYmlhR0JLcDhtcDFFbzBGUEZuL1JsdkZ1K0IvWUNUTWF5?=
 =?utf-8?B?cnhyaWlnN3hOM2FXRHcwMTRhNE5vS1dHUFp3VndDMVlYM2lsci9mZFAzK3Nq?=
 =?utf-8?B?NFhyV0NSVnM5aTk2d2pOSUV6U21DY1hlbHp4ZVVXN0VVSmdmSnp3cm9NdFpD?=
 =?utf-8?B?KzJJbDFLcXlsSGwrdDF3UUo4RVJuVVAwRmw1dmJzMkgwSUF6ZFhZY0dJMkxo?=
 =?utf-8?B?MXJMNHVzRXNOWHI3NHlqbGdYdkJyQUx4UXhIUXpzTzVnQ0FlWmgvVG1TK2FZ?=
 =?utf-8?B?YlRWK2FSczd3MDMrVjNFWjFtQVdDVG5QVVFOOHZxRWpwVmI0THhZbHU5ajVM?=
 =?utf-8?B?eFZ3cGhDOFVHWXFIMU84U0tNSndDZ3A4WmNla2lWTE1MVXczZVN3QWd5cnJT?=
 =?utf-8?B?QWNWZmlhakhwWWY0Z1h4TG5lRXhxUUwvT0J5UjBLK2xEcTg5T3czd0FCWHZn?=
 =?utf-8?B?R3JjTUxOOTg5ZkVzREtxQmlqVXNzVTY4M045QmEzYVZSLzFPTHZYNW81eHJ4?=
 =?utf-8?B?d0wvNXM5d2RBZTg0ZXpPVmRvdjFrenczTzd4cHcreGE2TlZ6VXpRSjYzdG91?=
 =?utf-8?B?bEdxbTdRRnV5aVBzTDhTVW9kR3VKcTlTbHlqRU1MVERFeXFjVDJYTTQyYmFp?=
 =?utf-8?B?OFA0VnoyREN3TC9BWHI0eXpnUWw1dEMwZm1LOUllS3lqcGJtMkxMM01Cc0lV?=
 =?utf-8?B?NGRYczNiVndETkU4ZndHWnFHbFJ6bVpRR3dMOXptaHBZdDlmT0hTL0tnb3FJ?=
 =?utf-8?B?ajBXOGdKUEUzZ3k0MngzZUV3YWpnaHJuSkxDRjFoTnNJaVZiVUdXNUVBSHVP?=
 =?utf-8?B?SnBQZVNNZEdQRzhLSHJVMktEdWtjbUNwV0JXaFZrNmtsakkvQXhMQ245TkVD?=
 =?utf-8?B?cWRqNDFXMWFsWWRoNGFPUEg5SzRMTVYyZ1p2OTJSaWJYaHdhM0hBQ3N3TVdM?=
 =?utf-8?B?akV1eEdNSTVreXphZEZNNUd6S293R2NPU050eXpPRjN3V3A1N3dJaG1OZk5p?=
 =?utf-8?B?MTQwQVVPRnlkdEJ4L1h3azlCRWxjMllqMkc4dW1VdlkyNWZEYml5T2k2UEJN?=
 =?utf-8?B?dS92cGZRVzFRNTNZdVduQXExd01PWXJKMWFHWEpQckNPNU51d1Vmb2VpN3Vh?=
 =?utf-8?B?OVptNzY5T0JGaitIM3VhTHA2L3pUTWtoVXBaTmV5djUvNXhvamZFUkRBcXpG?=
 =?utf-8?B?T3c1RnFLRlRsVlQyb2xFNW11NHhwVE5keGExTFdHMEtHSmpZNDFZSElsMG1s?=
 =?utf-8?B?cFYzamx0NUlRWGdnTUh4OUFaWW1KV0UvL1NnS0RxV1kzMUNTMnYwSUs4MHBZ?=
 =?utf-8?B?dWt6UzRWN2VQbTc1MkJxZFdUN2dpLzIvUmN3YlFzRG4rcjBLK3c3c3I2NjM3?=
 =?utf-8?B?ODNQMC9TNmViN0xRMWtSS2VFNmJuMVFpYWk0RUh5cTljd2ZtTkNlTFptZzJy?=
 =?utf-8?B?WTZ5eEZpdElwRlNJQU9sdlpqdlBwZ2M3RGo3aVlQNlVWSXB0eGg5T0E1RDI5?=
 =?utf-8?B?R1Q3Ym5ESHpOWDJSOUtqcFlXQi9BZXhzK3oveUlJTXFrKzZXQ29HZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b1599a-6006-43e7-cd82-08de7a03360d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:32:14.5856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbIgkKscqeK990mSJlZPbSIL5dPH8QIO/54a65SBn1yF1pqOoEsrp0zef5aHAkRwql+ONcQLqMUtQZaXi50EsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7325
X-Rspamd-Queue-Id: 52884202C26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:ariadne@ariadne.space,m:stewart.hildebrand@amd.com,m:steven@edera.dev,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 04:44:09PM +0100, Jan Beulich wrote:
> On 25.02.2026 00:12, Ariadne Conill wrote:
> > From: Steven Noonan <steven@edera.dev>
> > 
> > This function should only be used for the hardware domain, because it
> > compares addresses against the host e820 map.
> 
> The same is true for its sibling function, pci_check_bar(). For both the
> question is whether skipping is the right thing, or whether for DomU-s
> checking against their memory map is what is needed instead.

Well, the usage of pci_check_bar() from modify_bars() is slightly
different: it does get called with the BAR host addresses (not the
guest ones).  So the check will work as expected, albeit given a domU
cannot change the BAR host addresses the check is likely redundant,
but not strictly wrong.

Checking against the memory map for domUs would be complicated, as the
guest can play many games with that memory map.

> > --- a/xen/drivers/vpci/header.c
> > +++ b/xen/drivers/vpci/header.c
> > @@ -394,13 +394,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >              }
> >          }
> >  
> > -        rc = pci_sanitize_bar_memory(bar->mem);
> > -        if ( rc )
> > -        {
> > -            gprintk(XENLOG_WARNING,
> > -                    "%pp: failed to sanitize BAR#%u memory: %d\n",
> > -                    &pdev->sbdf, i, rc);
> > -            return rc;
> > +        if (is_hardware_domain(pdev->domain)) {
> 
> Nit: Style (see surrounding code you alter).
> 
> > +            rc = pci_sanitize_bar_memory(mem);
> > +            if ( rc )
> > +            {
> > +                gprintk(XENLOG_WARNING,
> > +                        "%pp: failed to sanitize BAR#%u memory: %d\n",
> > +                        &pdev->sbdf, i, rc);
> > +                return rc;
> > +            }
> 
> To avoid the need for re-indentation here (reducing churn) you may want
> to leverage that rc is 0 ahead of the call to pci_sanitize_bar_memory().
> I.e. you could make just the call conditional, without touching anything
> else.

You could also introduce an early continue, and leave the check(s)
below applicable to the hardware domain only.

Thanks, Roger.

