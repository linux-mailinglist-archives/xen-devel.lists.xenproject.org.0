Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AIXLq8i72n57gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 10:47:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5C846F58B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 10:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294724.1571425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHHcs-000493-Mj; Mon, 27 Apr 2026 08:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294724.1571425; Mon, 27 Apr 2026 08:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHHcs-00047S-Jj; Mon, 27 Apr 2026 08:47:34 +0000
Received: by outflank-mailman (input) for mailman id 1294724;
 Mon, 27 Apr 2026 08:47:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHHcr-00045u-Th
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 08:47:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHHcr-00CuuE-7l
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 10:47:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ef229a-5cb7-0a2a0a5109dd-0a2a4504d5e6-20
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 10:47:33 +0200
Received: from [52.101.62.47]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ef22a3-1dec-0a2a45040019-34653e2f5c3d-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 10:47:32 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7403.namprd03.prod.outlook.com (2603:10b6:a03:55a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:47:28 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 08:47:28 +0000
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
 b=aFy8kr5cV3wHbDsiXEtK1X++k35KLuwz1Qv1B4YNFmnvmxQ4fww2yqFa1Ot2PkcQqff+jyQ2POvosfw5Pryf4ADsMppcGQYVd+0zvk3s0NSEp+SExVYKlW8Du/EO+n4ob8iegVlTOT+aksYHr6GqhAbUbgzCAM3vld55zsR9PFss6RdcFwDkdtetbbQtzjNJrnjRgk9DNsfZBWAkv4cB7nLHDFUtpX7qT1XE3shW5RZHlDe1vpG83KupJf82229KHvJEUhXaFK0IKCP+fL6r2YfBp47j1i7NlnK89lFjNuvxjpQNRcc3DJmmSF801JJSuT9IFT5OuVa4HPnMtXxk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdhKD9Hjp3DkWiquxnpg8dCFR5hVKu3lK3WhVBX3GQ8=;
 b=R73mAjrxQDuFdQh6Buh1tEvUtU47JcVBPblkjihg9HErML3+xVVeqCZtrJK0Zj6xGvvMWeO074mtpEZw966Njb/ZO3IVVcDTU4+kacMRnXWsIHxDUjsQGSl2An1/29ZEI/dDO7/Jf5GI84LiiT8BDxnOyjkULOWNyDxrhvI78fKJlsC8TP3fHZjYzDZZLfHFDT7kX6CAVNMCuExzMHxNXf9FOKAtBKEVHvOGaHDhNDrPG3tc9vRvt8PQarIEgC+1VWSLoQvISMV9dBhbCug00KwTYUsqi6/R9SJEOTsnOg4zjXJ9DqDi0bI6Qo2IuyaiKOLrqkxwf665d1DFwaFu1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdhKD9Hjp3DkWiquxnpg8dCFR5hVKu3lK3WhVBX3GQ8=;
 b=Bq95DcQzXmQVJr5RWXLvwgc4efxDvqwkeRQcGeO/bLQ70eFNngbbhsyMfr5G++Tj9h8ma7wSOPaBtcw+mKmh7xUVvH5a3mNE/GF4ITZSMVZXOFb5MlAc8C6fdQQSb0B4tv8ZW9CSr7IlG5ZXX23eqHQLezdhJku+GJpW8fVVhxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Apr 2026 10:47:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/shadow: unlock P2M slightly earlier in
 shadow_track_dirty_vram()
Message-ID: <ae8im__1Wrn420MH@macbook.local>
References: <5149ab32-7d03-4ae5-9af0-e62dd5836329@suse.com>
 <c6aa40de-11b2-4725-b18c-8a982e43f0f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6aa40de-11b2-4725-b18c-8a982e43f0f0@suse.com>
X-ClientProxiedBy: PA7P264CA0273.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 74692f8b-0237-405a-ac8e-08dea4399ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ro2b/MlNUW0/NgH87ZReHUGVeLysLnYIBadREghoSVo3zb5S7HxPDc5bVSyIXis923qfLpVS6b65/qXy3ZDF8vYDr3GbQeSHDj2OtWfx+lwGAixo0DzJDAjKhb/JY8WHhc2ozgkeibcSEWZmeo4qpzLwLt0uMW1ZMuLa6qq86lzkASMZyylSkhzjwpTqxQw1FpqDy06Iv7hFH8uml1w9kiNq8NYg44IfSJuiIlOVFkZ4rWfADVuFLAfFXHTYsFFsrHrMl66ycRRnCNvfkUsBMok6K3oJaV8TEmiBt+kiUp23ldhwgcgqtOsAxz4koJzV9ikOmxUJIqPsLknxWcxGqG7dQSjNtCKa1h3+QdhzpeNKev4vnXml4baNCSgBYX+kOpjVcfOUIetpPcb7BrOOcqnNQV7aQzApgu/lck6UbUzKTrQULqr1yX4XSD/YXQidEuMdCQpc89grqclzeRHYjq+QqVG+7XzcxzrY2H6jVhxlludXLNaRUgQE/qf0IMi6dFKQeJ7U1CGV0u1hsHl/olvUb0tfMuU4LdfsqXaOorxOnvUnGHxM1A9maheLzFAihS3V+3+Agty+d4uudlh8iemLdevQzPlVdKDI1BQE7bKCt3N0EpethQULOYC55xtX6rOSIejpwXs1y4ijH3tuEkXWUnvNHCv3mnur8pEeF88oEKOrFZnAwObaUTm90MMHxMQ5TuUO8fZloVIVt8FogtseeVnF4fTQdcAu5xPiFMw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y04rTkVBWUlQcVBKakhXVDZsVVNNL1dQVndVakpUTFkrZmJuRGJDSDlRU3RN?=
 =?utf-8?B?dTVOUDRwZGhkN0EvTm1GSFBBNjBXcklCb1o2VjVZUzRqR21Ob2lsM2NoUjkr?=
 =?utf-8?B?YzJ3aWlGRzNkeHp0VzdjOXpkUzRjSGUwbXkxKzRlaFpoYU1qejJ0ajYzWENw?=
 =?utf-8?B?Y0RYdmxwclo2RzBHdldKL3daR3Vpc1ZiN3pyU3NERmR5OHdpdjg1Znl1Y3Yx?=
 =?utf-8?B?d1ZpOUpvWFgzRUVjWjdRZWpKb0FYdFRQOUJkcnI2YWpjYWg1djNCRTc3V0JT?=
 =?utf-8?B?UHY2d2F4eEJjZlQwM1RwdHlOUzNqeXIycGlBUmQ1eGJKVDcwZUJNUHB6R0tG?=
 =?utf-8?B?MzUvcXNUYnUvT0sxTWs1cXJTSXBQNWlPaE8rMzUyZVM1THlYdHQyQTJBY0Jm?=
 =?utf-8?B?KzE1cG5TeHRUZ0o4a3RITWVOMlR2aUNJL1pNVkxyWWtKL3h3TjJVNUw3UVp0?=
 =?utf-8?B?RzRTai9helhDL0FxZzR4bGtaVVNBOVJUelZjRm1vc2JFZ21VMHduM1I5ZGlt?=
 =?utf-8?B?OUZwT3Z3RkdOd3NHU0tWNVZYd09LeHR0WjNhbUtoZFhEbW15Qk1mSDlDZWNz?=
 =?utf-8?B?VmpuR3VPcUc0cDNlWFlxTzg0S29yZnA1aHF2SHdPUGdwZzNhM1o0SHFBSjRp?=
 =?utf-8?B?Y01TYlgzZHhpQmkybHpTa1REV3dDbndQNmpXVHZOSnRFcUtZRXIwN0YxUXhR?=
 =?utf-8?B?UEs2WjRVSE52VzFiTHNmdkJiYkZ5Q2VFbFoxa2lkUlJnSTJaaWxSR2FQbDBF?=
 =?utf-8?B?V1EyeHd5ZHB6QVZLV2VSV0xKbzhzcGFaL1JwekIvUy9md2JLOTRVOC9WODhw?=
 =?utf-8?B?NHJsd01WUGNCcVZWRTh0cFBsR3Z5K3Nyb1g1RUNZeHVyVnpWVkJxdVRXcnZG?=
 =?utf-8?B?L09HNHlmZ0tERjN4QW16ODJqYTVPSkJDdG42dk14UFJYeUszcXVZR1RqUmZP?=
 =?utf-8?B?NzcrQ2dIakd3STFLZU1lQ3VKanB5RWRndHAwN2FTMjJTM1VYay9IbVlOU1M1?=
 =?utf-8?B?d3oycWRxbi94MTNFYnZtZ3RRVUo1VjBKN21haGZTaHJGVFJvL002YmtCT2dS?=
 =?utf-8?B?MFl1MjBDRDFtbDZDeXpLRVNwaEd5elNJRjF6YjlOSEgvenh6enIvMWhBby8z?=
 =?utf-8?B?bGg2Z0s5S2pLVllxZW95QWRxa1NkMWdUbHdmS1QyVDIvMUZXSURxRWFUVlBL?=
 =?utf-8?B?c3JGZHNJbmhJcWZlSUtaTGRFdHphWVZBck56YWtFVlZFcGptSzJ4bnhGS212?=
 =?utf-8?B?d09YSE1oN2lYdFBiNDdKWVlpQlgvUytRakFSdEswVDhvUjZmdnNVbUt5OUti?=
 =?utf-8?B?Qy9ZWG8vemlITWxETkR3TzRRYzVBNmRleEFQMkt4RzZOYmNDNnlrcnQ0bC9P?=
 =?utf-8?B?QTNrYVV4RlBPdng0QkZLRzUzYWliNW1uMlNwZXFXVkRpTDYwQTNESGx1dmlF?=
 =?utf-8?B?cm5DQ1RDMG1oUnE1cTNpQkhsckdpd1hYdU4zWEUvNGx5WlhLTEwxYlZMTTJN?=
 =?utf-8?B?ZndtVzRmd1B3MXlSVzltNms1cEY4T09TZkIvaTFzekErd0JrNUExWjVKSjJw?=
 =?utf-8?B?WlZPRkUrYmtXTnYrenNUcXZjWmtOU2RoN3EwVk4wZGNZbDlLYjFlWnBnZ3o1?=
 =?utf-8?B?eFpFRHEyWEVuWlNkKytWNU1OWVNKNkl4WXhtc0ZwYTZoQktDSVdnOExPRGVn?=
 =?utf-8?B?TlZYR1JydUZFYmlFTEJkNHZlZVluOURiTHVxWjlFVk8vajRZclVYV2xDTkFh?=
 =?utf-8?B?SkpHWmFPNzgzdFEyaFBqSVR3aTVocVpqYlB5MHM3dG9RV2c4Q2Q3eHNYaEwx?=
 =?utf-8?B?K1JNRm5JNEZodXpCOGpReUZ3UW5yYWJsTkN0Y2tiUS9yWU9VM2o4Z3dTN1Qy?=
 =?utf-8?B?Nmp2eVZ3UDJwTW50SkRmMFlrU3VqYnZ4dmpGanA5THRjRGhOVXZBVExIZWxO?=
 =?utf-8?B?dGlORW5URDVXRXZGRzI3V3B1Vzk5MHNFNlNEM1RieVprRE5DcjhjbEM2UlQ3?=
 =?utf-8?B?RVViTkhubEVBM204UTZzMDY2S3ZiM1RuQ0ZHODVNdE9HeE9TeXJOWjZkaUlB?=
 =?utf-8?B?UHR6UXNZUEltL05wRC9qMHM0ZHI5Q0VPNFRCODd0Uk9QSnMvaEczQy8ramdL?=
 =?utf-8?B?YkJlWVoxQkZ3a1k4NVRCSDhzQ05YYUdkckhqMWN5aEk4L0VQVEZHZ085d25x?=
 =?utf-8?B?TmtXWEViTk9RbWVyN2xyQUZjUFE1eXhoVGJRSjBpRWgvbmdKOHhDRTJNeDU1?=
 =?utf-8?B?TSt5SkRhb1RBelVSakJCdnBJMi9aWDZYeXdLSFdPNm40d0Rza1hpMll6bkx4?=
 =?utf-8?B?RzdxbFdFTGNEUCtTNHZsckwvbHlLNVJueUUrOVlXdnlndnl0NWEzZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74692f8b-0237-405a-ac8e-08dea4399ca5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:47:28.5123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgmNadHjFFgquVRjvQ333HdzmZ9Mq2E9aHFxHGtx08h8DEA9SeyhkuPS67b0McxO+UpLvR0gHvr6pakLTKAyVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7403
X-purgate-ID: tlsNG-ebf023/1777279653-4BF6D3FF-FA9A2946/0/0
X-purgate-type: clean
X-purgate-size: 1089
X-Rspamd-Queue-Id: 2C5C846F58B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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

On Tue, Feb 03, 2026 at 05:49:35PM +0100, Jan Beulich wrote:
> There's no need to call vfree() with the lock still held.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> In fact for the purposes of the function the P2M lock could really be
> obtained merely in read mode, and it could be dropped immediately in both
> the main "if()" and its "else if()". If only there wasn't the error
> handling after copy_to_guest(): Dropping the paging lock ahead of that
> call, we rely solely on the P2M lock to also guard the changing of
> d->arch.hvm.dirty_vram.sh and what it points to. Question is why dropping
> the paging lock (but continuing to hold the P2M lock) is necessary there
> in the first place.

I wouldn't spend a lot of time trying to optimize this, we already
know HVM shadow is ATM not very optimized, and generally recommend
HAP.

If we could turn the p2m lock into read-mode, maybe at the expense of
expanding the paging locked region that would likely be slightly better?

Thanks, Roger.

