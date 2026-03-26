Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNTwBZxWxWkk9gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 16:54:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D9C337EAD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 16:54:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264421.1555988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5n1v-0003D5-I8; Thu, 26 Mar 2026 15:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264421.1555988; Thu, 26 Mar 2026 15:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5n1v-0003Aq-El; Thu, 26 Mar 2026 15:53:55 +0000
Received: by outflank-mailman (input) for mailman id 1264421;
 Thu, 26 Mar 2026 15:53:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5n1t-0003Aa-Ek
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 15:53:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5n1s-009WbJ-Qd
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 16:53:52 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c5567d-e002-0a2a0a5209dd-0a2a450ac0dc-36
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 16:53:52 +0100
Received: from [40.107.208.64]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c5568f-1772-0a2a450a0019-286bd040975a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 16:53:52 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB8217.namprd03.prod.outlook.com (2603:10b6:8:265::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Thu, 26 Mar
 2026 15:53:49 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 15:53:48 +0000
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
 b=dSddm4ohQ7aAIcFrEgI27Gfa1v7is4GvwXSvCfnnLbp7M3EsnjYn1EVY4n0oDLGICBVifS5p8owSo/PMJus6lNheDX0+MP03QLEYBFRTWjWyhyT7ABznxg/YBI+kcE8BWBToOYjn5KikX2603w95fDrn5zyJAjCh6u+03QN1g2ysqu+jv7BAGWSOdVSuIc+/kBBJxrJGyoQW4cUaXHihHxmFYVD8T+BaABvHfB4Wv+57u1JPLDWZegu8fCU+Kjt0/ke1yI+ukT98O4VMqc2gwYazxfjpSABpfhhcRn4Eo9g0b7VhKy/H8FQJgC8lLCW5vLgyrrtrvQ8rXWDMppipSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bP8NUXax0t4Rz0o4RI/tImXTY/b9b2KrK2Qorc+fYOU=;
 b=dEN9ndCm7LqEhGluEqJ9Hp4NoTBG6v2M1AdGioS+PgRNpkgIndw2YVD9j7+vAX4GimQT/ZjZk2IgkC9/It3J6RW9gd4z/t4ebTmbVoszAMI1f0+2cuJ0VTATgzIhF3EHaf3v6FrC3wv8nJnBUdOBg1SBg/yt/Mk5cv6P090F7SK7J9Np1UeGkLPZYsrWTNkXjwU0pp53uAUz9qLSy9n2xF4+jsybSBdJfdeayco7Lyd+JCiKiO3+5eK7ByP0XCroq4VteCnJ3HZZ2uIBJIMRb/yBst6bfE8D5vhti2J6KySvb0MS6pAkun4F6MHYK790YpXR8E+eZ4glMEXY/t1tZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bP8NUXax0t4Rz0o4RI/tImXTY/b9b2KrK2Qorc+fYOU=;
 b=NCGlBgBGiwAkDlg0erM0rQ4qFeerYB7KhAUT2z1eUHkCZdxJKsekityd+NJvK0xijw9Vz8Eci17thX3IdICRdu5VnfcKHrnfaSaxBqsCHXps926MAUYWVdj7id3lsRminNGk6jtQ6aqx/xgEvKMkQe96Eg07ZIJZBdsZSWUupUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Mar 2026 16:53:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] xen/mm: improve freeing of partially scrubbed
 pages
Message-ID: <acVWidFD7twir5od@macbook.local>
References: <20260326085145.61380-1-roger.pau@citrix.com>
 <20260326085145.61380-4-roger.pau@citrix.com>
 <77e3a765-39dd-4eea-898d-cf9e31912cfb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77e3a765-39dd-4eea-898d-cf9e31912cfb@suse.com>
X-ClientProxiedBy: MA3P292CA0020.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e061bb-7a09-4811-15b6-08de8b4fde8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1yz4zvLfpNHpyd+X+y9buRuLkD/QDe2HBQ/KESbgMGMu/rTa810Ou3Rn+H3+hJ+3jj3ytP9Mv+jEphoOQWk5IxBBhelhjtyAlc8yPDgzN0PcaWmzY43FaRBpyNd5fUf84h9xPlV1RdEWjfJBsvireqhHBrza6mcnimgsyXEKda83rghyutL69YT5XuZwtOIeIMBhx3fIoTdchDKiCXFWfdk5dOXbl+D1Ez9MtUc2tPaP8c6lasqaU/v9sfoPTlZWmoWUcvwbfQeJDlaXwpTR6SYQUhQRdu+TEzB9eSEbLf2NaauYyl7plJuzYdxFBbNEUHtAHhfjkQS105PPPGy8GgMGtjHlThLoP7dFY5Vgv5cBA/F4yx95ac9fBshgdnMKtPzuZb5POtkv3HoTR/WZtt1CxoTx7Sb3rX38EA3ZURMEd0VOHoPBuGMsrJELeOKD5GcIWdo1qMvua2Nqt9G8lvraSpTT/jb/rkg2na6eD9wPWmZKjpmYjaCGAGeGidMYi1ilWY/7qLfNXt1bh2rzV7mfpOioqbwraqanslIF64uxsGjHA072S2BTaKv3DTUgeVura61R3LH/srhC6LBXxGBTDBJGHLhhPFBxXhu5gw3LucDyFAaZubDs2AylYLI7WRxS5BPY/1xs73UyyElkgxrUiOqVXzwSH8Y8roZh85YCWe4yjiExubznA3UsOq+XK7yhvRLzG3JOkocmqrh///5gZGz3EVTPH5u4nTX2W3k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2FWclk2OGFXdENPc000NEtRQ2pGcVJGY05UR29pOENwNGpHNEZJdFVoUDMr?=
 =?utf-8?B?NjlWMzJQbVZaTTBta0lxbTJjak5hYURHN2Y1cCtjdWRMeTl4WUtrNUZES2hr?=
 =?utf-8?B?anRqcEIzMjZCOHA0V2pQWE9WcWJIREIyTHpzS1VwL0wzYWlpK3hOeXVHMm4y?=
 =?utf-8?B?WXVQUVA4T3ZFTUo5NkNmZkU1bWhLdFhFQUMxUnhoVzVIdTFwRDRlQ2JGZkNU?=
 =?utf-8?B?V3ZzNGRGUU1GbTYzQ3IvN0grbWNHRFh5VXF5NkNiT3dwWXdzVWRueXBNcTJp?=
 =?utf-8?B?OVNNZnBQN1hib21GTm92dVRvaGZyRXNGYzk1cUJLWHl6dWFmcU5hTExjQTFJ?=
 =?utf-8?B?R2JUVTBRdk5oM0dHM0MwNGZ0VENra0lYd2diblJIM0t0Y3FmZXMweUlIZ2ha?=
 =?utf-8?B?dGh6a2pXVEhXbEFBYUc0RlJkME84RUt1YkZlK2d6c2wwcTFXS2FPaFFIZTN3?=
 =?utf-8?B?OHUxbk9MQ05vTEU3L1E2cnNWa0svd3N2TC9GRm00UXBVTnZwaHB0RUJsSVZJ?=
 =?utf-8?B?RVBNbGpQYjlSZkNLSVBla1owQTRkOE8zYkUrajNHOFlvbnAwT1o0SklVMjVs?=
 =?utf-8?B?QU1FcjdOaWlrTUdNRHY3NFlUM1BzNmFpeCtKdjJQamF1N1JJN1M1bG5INldl?=
 =?utf-8?B?RG5CSUpRalNhMlFkZGlRcHhGL1FOeUZBaHdUcnNoVU81eE5Vd0c5NkM0Qlhw?=
 =?utf-8?B?Szg3Zm9MRitwMmFwNjBScmNkUko3dWtMSWVUK0JHQ1ZLc081WWM0WWxKWGpE?=
 =?utf-8?B?ZkVKWDVwRC96cWoxOUo3VHVRaTZJNjFSR1J0eTNVSGs0SmtSbE9aOFQyUG5C?=
 =?utf-8?B?N0Y2c0t5cGZlN1N3aDdueWZRRDNpTGN3NWpZYzNKelRFNElOYVFaZlhpL0o0?=
 =?utf-8?B?SGthYTVsR0ZvYnVlYjQvVWdrdUtwamZaUlJPN0xyakYvRmlJSFY2ZHdYREdH?=
 =?utf-8?B?bzR4TnlmZmV2V1RUVk9yekZuVG5ZWE5VWXg1RmVaUzNSd2oyM2VjWWVoeHJT?=
 =?utf-8?B?MFR3V3B1RC8zdXhod1E3cFovY25YdG5ONE9XbzVvc2Mya0pFWlhRbGRFampx?=
 =?utf-8?B?Q0dVSE1oUVhjdWEvemVHT0xkdkRnNVFhejZYUEdNK3gyOFRUaGRCYU0vTVFF?=
 =?utf-8?B?YVZibm5iS0NJMnAzK0VUaDNiTzRNek11RmN3bE0rYnM4am04Z0xMSitrSVE3?=
 =?utf-8?B?V1VxclloTklKVGJlUm1YdUREdVJSYTNlSXdMeDFjVEhlTG12aXIrTFBOUGJ3?=
 =?utf-8?B?cVEyZUIzL05neEp5dXRxU0dCSE5jeWN1OXJnSFAyUUhYZWZKYXkyR09wa1lY?=
 =?utf-8?B?eUtWMlRUVU5BOTZxOGNHcjIwLzJTY3o4TVdjanVFK01tY21jTCs4ekVzM0dl?=
 =?utf-8?B?NVJzZjAwZ0RuQVhHWVRNTWVhTEcwUG05dVJWZXhUREd2dFNQbGdsZ1JtMkda?=
 =?utf-8?B?VFBqSy9PQ1cxYTBzSHVXdngzTC80bFhXdlY5RTA3WXJSZXFzY1RGYWwzam41?=
 =?utf-8?B?OUMyV2JlbVorKzBCS09aQjVnR1o2NFFKNmhjVGs0TXpMY1JSc0VsQkMzRXQ2?=
 =?utf-8?B?dE1BSEo3TmpmbVlveHVydXQyRU9OL1BDWEV2c2Q1NWVoK0Z6amNpMHhKenJM?=
 =?utf-8?B?WE1LVWxJQnJ5SUl4ZHI3OEJ6STgwRmNIVXlzcTVsY1VDZ1E5bTBWbXVvdWlY?=
 =?utf-8?B?QXl2WENBV2lkdFFVRGFWNytFTmNhbHdwTEhJWDJnZERRMkhiUFdSQmlBdzFJ?=
 =?utf-8?B?Qk9TUWd3cGViUnhHL3ZKYW85ZGNYa3pwU0NkUldRbVhGWG5HUHNRRUtSNzBt?=
 =?utf-8?B?ajh4K2duUDFISERwVEJLTU1yVVF3bWkvOU8xLzcvY1lscVhVRmlSbTZnZVp6?=
 =?utf-8?B?SmNVZ3dsMjFTWmtWOXlBREM2VEgrYTVsM1hrOWJOV3IzMU1CS0FxS3V6L3NC?=
 =?utf-8?B?c0dZdUVrWE94VVlTMEtnSGhFMFhYQ0svejhpU2pEajFkL3BaT2hwRytWQTdp?=
 =?utf-8?B?Q1c1N3RLYXM3YnN1aHVQWHNONjd0VFAxckJwSFhiNXJqbldndzRVZ0hRS05B?=
 =?utf-8?B?MUZjdTV2YW9tQ29NaGxpR2tBdmk0YktDc3RpbDlwcGFZMXM2S2c5SENhdWJq?=
 =?utf-8?B?V2JITFg2K1RpZGQ5NzlLWUxaVFRlRWp1c0dMcHlhWnVObDZuVjBFUjErMlVv?=
 =?utf-8?B?TzZEdWVvU3dnQ0F6RmpNRzFEaWxUeHovKzV0OGdNNEt3SE1tL1N6K1lMRnF3?=
 =?utf-8?B?eXlnL2JxSTBsWWtqbGhNQUhqWm5zQkhnejZSTFkreUxmVXNLMU4wOFJPQUdi?=
 =?utf-8?B?V1VCY1ovTkV1TkxlOTdnSmxSMmVtTG1IbkxmanFlaHZRbGw4eEQxZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e061bb-7a09-4811-15b6-08de8b4fde8c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:53:48.6936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5pkhSFO8ULcv6k75EeUngGeTPYwHxb/kBHmo0X0TpwZelsl8y+ide3GvdeeEwmc25pRVfsPu9VzzxOl//2rVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8217
X-purgate-ID: tlsNG-4011c0/1774540432-52691900-A639467C/0/0
X-purgate-type: clean
X-purgate-size: 3621
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 82D9C337EAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 12:50:27PM +0100, Jan Beulich wrote:
> On 26.03.2026 09:51, Roger Pau Monne wrote:
> > When freeing possibly partially scrubbed pages in populate_physmap() the
> > whole page is marked as dirty, but that's not fully accurate.  Since the
> > PGC_need_scrub bit is preserved for the populate_physmap() allocation we
> > can use those when freeing to detect which pages need scrubbing instead of
> > marking the whole page as dirty.
> > 
> > This requires exposing free_heap_pages() globally, and switching
> > populate_physmap() to use it instead of free_domheap_pages().
> > 
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Jan: I'm not sure if that's what you suggested in the review of v1.  I've
> > added your Suggested-by but I can drop it if that's not what you were
> > thinking of.
> 
> You're going quite a bit farther. In my comment I really only meant the one
> new use you add in patch 2 (in which case no changes to the body of
> free_heap_pages() would have been needed, and hence why I thought that it
> could maybe be done right there). Up to you whether to keep the tag.

I see, you meant to change the single usage in case assign_page()
fails.  I think going a bit further is fine, seeing the adjustment to
free_heap_pages() is very minimal?

> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -177,7 +177,7 @@ static void stash_allocation(struct domain *d, struct page_info *page,
> >       * interface is designed to be used for single-threaded domain creation.
> >       */
> >      if ( d->pending_scrub || d->is_dying )
> > -        free_domheap_pages(page, order);
> > +        free_heap_pages(page, order, false);
> >      else
> >      {
> >          d->pending_scrub_index = scrub_index;
> > @@ -210,7 +210,7 @@ static struct page_info *get_stashed_allocation(struct domain *d,
> >              *scrub_index = d->pending_scrub_index;
> >          }
> >          else
> > -            free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
> > +            free_heap_pages(d->pending_scrub, d->pending_scrub_order, false);
> >  
> >          /*
> >           * The caller now owns the page or it has been freed, clear stashed
> > @@ -391,7 +391,7 @@ static void populate_physmap(struct memop_args *a)
> >  
> >                      if ( assign_page(page, a->extent_order, d, memflags) )
> >                      {
> > -                        free_domheap_pages(page, a->extent_order);
> > +                        free_heap_pages(page, a->extent_order, false);
> >                          goto out;
> >                      }
> >                  }
> 
> Along with all of these there's then also domain_pending_scrub_free().

Yes, indeed.

> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -153,6 +153,12 @@ unsigned long avail_node_heap_pages(unsigned int nodeid);
> >  } while ( false )
> >  #define FREE_DOMHEAP_PAGE(p) FREE_DOMHEAP_PAGES(p, 0)
> >  
> > +/*
> > + * Most callers should use free_{xen,dom}heap_pages() instead of directly
> > + * calling free_heap_pages().
> > + */
> > +void free_heap_pages(struct page_info *pg, unsigned int order, bool need_scrub);
> 
> Might we better not put this here, but instead in a private header in common/?

No strong opinion.  It could logically be used outside of common in
principle, hence we might end up moving it anyway.  Would you prefer
me to introduce a common/memory.h header with just this prototype?

Thanks, Roger.

