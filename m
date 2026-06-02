Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIHpCQ2dHmq5CgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:06:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2E662B0D3
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324636.1590122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUL4I-0008LN-Qs; Tue, 02 Jun 2026 09:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324636.1590122; Tue, 02 Jun 2026 09:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUL4I-0008JX-Nw; Tue, 02 Jun 2026 09:05:50 +0000
Received: by outflank-mailman (input) for mailman id 1324636;
 Tue, 02 Jun 2026 09:05:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUL4H-0008JR-Iq
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 09:05:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUL4G-00GH8S-Vu
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:05:48 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1e9ce8-bab6-0a2a0a5309dd-0a2a4506e56c-30
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:05:48 +0200
Received: from [40.107.209.63]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1e9ce9-7371-0a2a45060019-286bd13f32b8-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:05:47 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH1PR03MB8143.namprd03.prod.outlook.com (2603:10b6:610:2b1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 09:05:43 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 09:05:43 +0000
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
 b=FaNdL00GVkpqDPBZTu0iJEjdwJdDpcGjUwnRMHUTfjmJGA2pOj5ORNgvWJu58bZRH3j2NG09LVFsBEaXBb/v5JN5Eu1Y/nrQqWmRbmCy9RsDsZqg15Kj7eUlLs8uSCrjUgP63ry1Jf7A5oBvS6zPYWrMTo/7ORQ7zBv3AYbGw4FDHiLwXJjjRzUEPqRVdwfSAPfhwelAjxJ6us6x0lNpM7k3EtxxXU1aWd3ap+oNmD/YIys1Tzo+Okk9HWzcATRwIOnvg0XK1y9lnzrQaNcVplfoGC7NA8igEzZGvUNBfXjZ6B4qsuP5P5vJVXMzqudHVZ+NpieK9u9PzuLKzc/n8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8HkXfuT5L+CYtuDLYF34Pm7Z96QNdCQBCWOoJi+drc=;
 b=ajMwfCzdTrmlUZX7CKcbbh3wDXDLk3BfVn0U3VfVyvNwPgGcblVcGdc/4n69AP5tOrFt7eJE31gHfSTcBstUZt1WvL2YoLqqZFZny7UBcZFtNFJ7nbmZGVXU796CHbBV34iBu3q63FItmdNxZsa/mWVJm+twJvw9q2Tf+EYC3R3peiY8RVOcHGQ+X2F5D4lQ32uKW183LIUOWc1dykyGGWfqGBvYkvoDIRw5P6tnwtfqbIGZimaEWQzmUqss+dmEVdunicGib8/jEsKkQS4VAkHGtRhlKMn25zVNoKndfi/KQRHE/T9j6DDIgt5vjIw8VlVlF0ESH0ENwYGvBw2k/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8HkXfuT5L+CYtuDLYF34Pm7Z96QNdCQBCWOoJi+drc=;
 b=Ln71L7/epXvaV/ZyuqKYKJFC2ozgpJ5gJX2ph7mWXblvRz4s92vd43NetHUwdwoewI4ZmfJ5xisyU8xHbr3fc/zVmbMg9hGX1DUssC+nd/GwvbabhhjQHsKtm7ZVMylJrE+whQwBDZh6rQ3dileuFaB6PDPVw5yvR+aFaOJDdwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 Jun 2026 11:05:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org
Subject: Re: [PATCH v6 3/4] xen/console: use memcpy() in console_init_ring()
Message-ID: <ah6c40-TkdJcFggM@macbook.local>
References: <20260509005714.892018-1-dmukhin@ford.com>
 <20260509005714.892018-4-dmukhin@ford.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260509005714.892018-4-dmukhin@ford.com>
X-ClientProxiedBy: MA3P292CA0070.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH1PR03MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: a61705f6-265f-4069-e966-08dec0861fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099006|18002099003|22082099003|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	JF+7uqb8xTDu3A0R+ni6e/TZAJAMABnkvOvCiNZu5BF62Icg36Wx8laR1tf9HM47uuUI+8nGnRQyTPFprDqD28l8nDoYX+qQ8miHzffct+Yc8VI6FGBMKZV6NorsXtyVhjIxIGJRlgvCXLw5d+fvGXNGWbbucnRow0f1rzkILfuGdjgxf1m2Q+SbSX5m+AITqnrHmyZQc0eCMChD2QwHq4O5w3kvbpIIApJy4XrFRJNhGL9Y8u9MIcri4BXh16b1i4y4B4UecOkyS3Sl2VHnzBBSC7KGGXAik6FWc+gEU1LiImPv58wpkICVCCTvseeWoAR2d7SpcbBzUivawWFIWId10C2e02whTRFKgjpn8aqAJeRXU1zziOM7CZq46Iq9sAcrbSjR0XqP3OMwBUNGThdprrXZGnmVudFVK6UqWTyAuZhQvLLEkFhSgCiTCCmpxL6EYMMnOJD1RCsOeqAMiywj3HgWTF3EEskGH4W0k3qTJUNWRR+loihFJX1gWz2F6UKzwVVZ4/b+Da33oN1rxUuu7mFdFKjiEAoOpF66mlQrGXGISL+zAXndKXArqdBoG4+J30NpVXq9s/nxmlCFK65mwQ/MY7cLNpzUUYSaPMKe7y372wkpz7/bNv4WksRgHj03iU2CYTELK+FNjO3jtIBL2tEm6oKArt+2ES11UfVS2/u6BgoWEfmSKJ/dQNQU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkorcUdxZktJMGJZTGlFaHVyU2ZnMWwzNUttcDBKZmowNzNHdzJXZEVCUUVv?=
 =?utf-8?B?TWVvLzNzdDBvT2pCRm5ZbXgyNEVkSHVBOFdHbUQ1TjN3YzhDNE9zQmtQd3lx?=
 =?utf-8?B?UGVRMHB1WGwrNkRsY2VRYXVaRkJlQWdzQU9oWHEwbWpKZWlubkZYOHA0Ylcx?=
 =?utf-8?B?cUhvOTBuZkZsQmZQeDQzRUs3eEhBSldhdUEvTDM2K0d6Sk8ycHR1UHllQ1pr?=
 =?utf-8?B?RkxrRGdJN21rUnB0RkV4SjhkMFV5WUs2ajhJaG1paTFTdWJrNTNnTVhlL0dB?=
 =?utf-8?B?MXBUSklza0dCZ21Sd2NWbVpiRS84YW5DN2tWcXFQdVovOERlOVdjbXJ2SW9i?=
 =?utf-8?B?VXFCNkNjYVdoWGc4NGhtOCtYcXEzYjU4V1ErU0JyZmxZUmpFSGNHUzFkZ0VU?=
 =?utf-8?B?d1JnQmFOM2JERnBVRm5MT2tQMis2UEw1QitBVCt2TVRwbWlFeWdxdUY0eERo?=
 =?utf-8?B?YmVwZTlab0kwWVlyS0orU0hrWllGai83VlF5dzk5azAvUnNsYjdvWk9RRld0?=
 =?utf-8?B?dkZZV0dLT0cvdVNGaklzemFVOG1GelhEcWMrR1ViUUM3MFhEbDBVSVpKQzl2?=
 =?utf-8?B?UTJOUjRLampjb3oxODJXR2U1ZmZEeURqd0ZFZHQwZnZFbUNkZlo5UXdvVjBR?=
 =?utf-8?B?MVE4VkRUOGZCZ0h4L1ZPNHNscCtvVnBwcW9zRytGaFhyV29la3Q1OUllcjNM?=
 =?utf-8?B?czZlVHhMV3BURmNSb3dUOWNySFJ6ZnRsS3c4Q2ZIbmhJV0hjWHVnV2E4Y2pO?=
 =?utf-8?B?cXlqQkRzYVYxMnRSeGJhR0ZnOEFWY0t4cUhhdVBZbk1MckZJcjhBbWJ3ZlFV?=
 =?utf-8?B?ckFvME1ueHNEeVFIVlJhc2M5MGgzQTBXN2w1NGVsMmlNNTdOMGlvNzAwTkhX?=
 =?utf-8?B?QWRLeU12Zmp5WGNuS1dqeDA3aW56Q0tKd0s0Y2FCZzQ3QmwrK2NVSWtBRVJz?=
 =?utf-8?B?bVA5cytHU2UwZk52Nlh1RUE5Ynpna1pxYVFlTVJ4NkNhUWNLZjhXZkd0WmNr?=
 =?utf-8?B?NGhtNUJnRlZMYm9HWGI2MkxsZFA3b1dUNVlwbURxZ2FrSjBlN2xueHAvUk9X?=
 =?utf-8?B?dVBHOEQrV3NNZ29zM0tDaFNTVXpUNU5WaXJ5dFZZS2xQdStQVGdoV2RVVkZ5?=
 =?utf-8?B?cWQ3Q0xCNnZrR2RvQjV2SGswYVozaGwwU3RIQ08vTDRiMUU2OTlsNmNic21B?=
 =?utf-8?B?UmxyVFFGRE9sZFNKSWlvMkh3eUM3M1NOcm5aYmpoRGdnaG9CSmhxRGdtRk1l?=
 =?utf-8?B?OVZUWC9IY2IvaEg1ZHpqak1mcThCME5EN2d4N1RlaU12bDFJa1BGUXRUQUVu?=
 =?utf-8?B?RFA4RDgwWkNQOXlzWnVXeWR3cGQrVFBpY3NRN1BHV1FQeS9WOEp2dEJUdUdJ?=
 =?utf-8?B?cGFIaGFJVGc5clIxcksxcERhazZ0WW1mVCtSVlhhN1JFaHBZNUpZakZNVENU?=
 =?utf-8?B?YSthMkViY2FzaGpiVjZMWThBVFFwK2Y2M1p1b09QS2pPZjRwcWU0djI1N0Zi?=
 =?utf-8?B?YU11RzZ6aFdIeHFZVGxQeTN4TTc1cHp3SFBabHlNcFVyWEVOaFZPUEdEY2pV?=
 =?utf-8?B?YVhWY1NnZ2h0bDcvVmFTUHVwcXcxWXdjVk03ZENIWThNZkhyYXFiQlB0Qjkv?=
 =?utf-8?B?aW5DNUg2ekRiWWRZWklFVzl0ZVNGdk1CUFVROFZCcXVrSGVkWW5OZXYxbXVK?=
 =?utf-8?B?Z3htdkl4Ykp3UnhNekwyUno3eUlwTEE3Nk16V0FlUzdTVGRYQi9pOE9XeEZR?=
 =?utf-8?B?ZkQ1QTdBRzQ3N043OUdkOTZCN3pJSnI0ZCtidHlQTWtuRW5pS1E2YWxCTDM3?=
 =?utf-8?B?SzVTcmhVV05oMVlKbEdpaWIrNTVIMWdOV1ZsaUdrbTNBU0lqRlgzckVVeS9u?=
 =?utf-8?B?cEhxblpvZGdGTUdUT3dQNDgwV2NRQkpHSVJEQi9zM0s5bzFYeFk0K0ZiMjZU?=
 =?utf-8?B?cXVWRmhvSHBlL1NPTWcwSndkVVlUVm94cWlRL1ZRZzEyVXdDTE5OQy9kRFE3?=
 =?utf-8?B?V3NTRFBscnBpUHM1b3dLc2d6d3F5R29mZ1BFTjlydTJ1V2FhUjhhNGZLc3lV?=
 =?utf-8?B?b2IvczJMNys0a0tCRXdOWTA4WTNFNGlXeEswMmVzbzhuZWE1cEZpeXBiWDVz?=
 =?utf-8?B?cFJaQlJ3TXA3Z0o5ODdLNkJHbk5NUjFNT2dzVWZ2V3dUK1NDa1pkTjBXZ1Bw?=
 =?utf-8?B?T0NuRVl5eG5vUnVNa0JTVE5uSlJva1A2dm80dGFkY0JCYXpLNmx0WlpQbFhz?=
 =?utf-8?B?U3VoWkphUnJBTGdnVFpqa2F6VGJ0ZTRkSHYwUFZaVDVsbDlMQmZkazZPNmtT?=
 =?utf-8?B?Mm9JVXB3bmtZRmUyWFZ6bGxpU3JWc1ZiRkUycHBmVUtGK0x2NmlCUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a61705f6-265f-4069-e966-08dec0861fed
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 09:05:42.8987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r52mVzhf+GFnj3ejkiCO/MEf7mremupsEUkDtbr+ZneDAU0UlrxBEEfaPlneFpeohfNpd2vpfBL9LAfvAR0yzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR03MB8143
X-purgate-ID: tlsNG-16d1c6/1780391147-8556ED75-120BF9CD/0/0
X-purgate-type: clean
X-purgate-size: 2725
X-Rspamd-Queue-Id: 8D2E662B0D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,macbook.local:mid];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 05:57:13PM -0700, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Make console_init_ring() more efficient by using memcpy()'s, rather than
> copying the ring a byte at a time.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

A couple of notes below.

> ---
> Changes since v5:
> - fixed memcpy() logic
> ---
>  xen/drivers/char/console.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 5ab3b0de12d8..5cac87d052b9 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -463,7 +463,8 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
>  void __init console_init_ring(void)
>  {
>      char *ring;
> -    unsigned int i, order, memflags;
> +    XENCONS_RING_IDX i, size;
> +    unsigned int order, memflags;
>      unsigned long flags;
>  
>      if ( !opt_conring_size )
> @@ -479,8 +480,22 @@ void __init console_init_ring(void)
>      opt_conring_size = PAGE_SIZE << order;
>  
>      nrspin_lock_irqsave(&console_lock, flags);
> -    for ( i = conringc ; i != conringp; i++ )
> -        ring[i & (opt_conring_size - 1)] = conring[i & (conring_size - 1)];
> +
> +    i = 0;
> +    size = conringp - conringc;
> +    while ( i < size )
> +    {
> +        XENCONS_RING_IDX src = (conringc + i) & (conring_size - 1);
> +        XENCONS_RING_IDX dst = (conringc + i) & (opt_conring_size - 1);
> +        XENCONS_RING_IDX n;
> +
> +        n = min(opt_conring_size - dst, conring_size - src);
> +        n = min(size - i, n);
> +
> +        memcpy(&ring[dst], &conring[src], n);
> +        i += n;
> +    }

It's a bit more complex logic for not much gain IMO: this will only be
used once to move from the init buffer to the dynamically allocated
one.  A couple of notes, feel free to ignore if you don't think it's
an improvement: I would rename `i` to `done`, as `i` is usually
associated with an index, and here it's just an accumulator of the
amount of characters processed.  I would also consider making this a
for loop, by pulling n to the outer context, ie:

XENCONS_RING_IDX done, size, n;
[...]

for ( done = 0; done < size; done += n )
{
    XENCONS_RING_IDX src = (conringc + done) & (conring_size - 1);
    XENCONS_RING_IDX dst = (conringc + done) & (opt_conring_size - 1);

    n = min(opt_conring_size - dst, conring_size - src);
    n = min(size - done, n);

    memcpy(&ring[dst], &conring[src], n);
}

Thanks, Roger.

