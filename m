Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wi9VHNTAQ2qLggoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:12:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5576E4AB1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 15:12:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b="s//n/+Ik";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1348844.1606562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYGW-00069c-O3; Tue, 30 Jun 2026 13:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348844.1606562; Tue, 30 Jun 2026 13:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weYGW-00067a-KX; Tue, 30 Jun 2026 13:12:40 +0000
Received: by outflank-mailman (input) for mailman id 1348844;
 Tue, 30 Jun 2026 13:12:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1weYGU-00067J-Oa
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:12:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weYGT-00HSmu-W9
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:12:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a43c0bb-e002-0a2a0a5209dd-0a2a450997f4-46
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:12:37 +0200
Received: from [40.93.194.45]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a43c0c3-97e6-0a2a45090019-285dc22da92a-4
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:12:37 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV5PR03MB8412.namprd03.prod.outlook.com (2603:10b6:408:35f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:12:34 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 13:12:33 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtVsaj7POD/a45TwOeCOIyFbmjTI3IMoGFsbyytdHGREH9HT6sovbn45jl32spdwVW/5ip/VP2hrtaOcvdwmB1K4Ildj+nWkOmbAzI6Xk7dQb3/4/XZgxWcLLUQf6RC7I6goj1pxvQKyHo0rQaxUT0wAzkZEypPXffVry1KoqEZGYD1XJ1xtq1h9ITjUB+p9V+F+vaUcx60hkgfgGWYkq2gJO6LDpuvZE346eqpSNjMZ2npQK1isSYFYaCbDPyEWZOQ8c/iIoEJAs+chqH23rthUFvRpPiiXveal80th8+YWEC1OZ0TUB21f1m/Bm60oILn10ES5ooA515s9lMe21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zyc99kODfojOEz4hMlxS8ZfD20Tcm+/CqEeZwRLPgOM=;
 b=dHscscvnW32aCLE/LTwrM2rXFMMvT6jNyOkQ4IBwxV0pZ3zVNIn8KmgwiI46aBe3iJuyrFYs8BhXszdjpv/PzG3JxLkYiEkTBoEnCZuQSP9dIJGl6vqaTrDHaQykpGkn65NTKsXecDE233OWnmHa6LQfJ94h+qeS3bYAMNfjZFNbtIgWymX87Wj4pK2mUkgTjwW2x9Cuj9kHAwK480v6K5tcLCwobaUp6fsq/g1zyKPWCqLl81nDYXP+Do32lAO02IghCuiIw9TIAZL3yq6aLgGkIV6DL6r/AXyys2uYOqaaypy78Cyj63A1TiEdS6m5G1t416Mf40BmxTuNy8tsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zyc99kODfojOEz4hMlxS8ZfD20Tcm+/CqEeZwRLPgOM=;
 b=s//n/+IkKrFaHoFcVcyncioMe92ZXNOCB7wLN45pZI7GZK8yxM3PmVhbOv0h3Ss5PYwH6lw/kA2pe04nquhN2H7XokrzRR3S5sQAXFpIBT1q9brAml+z3eYhnXWxpYzRR5g7Ewi1+8oF7gxzuGwchS4dflwb6uzIfJqysDW12sA=
Date: Tue, 30 Jun 2026 15:12:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v5 3/5] x86/efi: avoid a relocation in
 efi_arch_post_exit_boot()
Message-ID: <akPAvr7hF_6fjOh0@macbook.local>
References: <20260626123645.229375-1-frediano.ziglio@citrix.com>
 <20260626123645.229375-4-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260626123645.229375-4-frediano.ziglio@citrix.com>
X-ClientProxiedBy: MA3P292CA0057.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV5PR03MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc4b7f6-149a-4756-cb78-08ded6a93f89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|56012099006|6133799003|3023799007|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	EZsz/vCl78rVRd26hxNxWA6Qs8zNzvQpexUTHOLjWXrVkkIWloC6F9h4EjI5mXg25GFDJ34zPcbJLc9F81ET4PpctvtdYqOBC+BkmkeKgctWQtZ+2mUnSwe2fqTTbUUoGMVdONm7W48M4tUGgom3ivOYsLPZR7R7AAbGqMzPNXFbenuRcq5wCSmelyKsTZrCFoscEtL4ePcfv8gcNtzl+GZMmrbbnH+d9Fnj/SWPHfSePLsD3pANzB7j6lFRyBpsd70SsHG1rXTsvVhNKdnsH3ctnrss+GYaydaqYkz6oQ/tn4xQbH940x5Fkdqid/EoqDhLeiJeGXLJxMVAATcYQRsGGWN+6vxsES1vXjLqWxdMtUVoWxLJYBFteNPbYKUwaHl3nON6f7Swck+j2PiKgaSItzkXhQADXS3PMZ991PD0YzuOlL+I7RiQVn5Hi35uJ8Rh1SuhuDPIP2vTtziqJlfveslbqnVzHuoqW/yYsrB5f+PzthyCWe2QFFnBq5LQ6pO9zmwWbjSf068lQWRpwYUwCg8E9hgMGMzjPmXIA2J2csThnB+iVD3p2Dk85oXrym3wH9s89cwnua2Er5AwrnmTdqixTfCw4cdy2YwWHrMjwAcP8wulYFuoqsqUppJNdLrrE8XInbuL1mrKCiGEgbVhZthj4r1XHB/4ptaDCj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(6133799003)(3023799007)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2dMU0ZjZytLQWw3YlNxSXQ0b1AzSVpoWFVrcXZqaHBLeXZ1WXc5bDR6TG94?=
 =?utf-8?B?Zlo4T05zVjVOQWVDb2RTUExoOUpTaHUrODFIZzRhejRiV0hXd2g3dGs0VTBW?=
 =?utf-8?B?NGtieGVKbFNmOG1rQ1hWcXpYbEFpakd0cTR4ODA2TGIvR29mUVlQNGpmem9j?=
 =?utf-8?B?WWU2Vzd6bUROWEpRejBZV0Zrd0FkQ08zaUQwY0ZlT21Nb2twSU9LRFlISnlU?=
 =?utf-8?B?N2w5VGUxeVNDaDhhZHlBamkrK25XcWRkQ3BQTEh0WVBjVjNLbUdZY01jNHE5?=
 =?utf-8?B?WElUK3E5cmNjblFzUjRXdzVuYlk5WVloNUtuL1FLQ3E1T2tvSWx1STFGdWZt?=
 =?utf-8?B?UCttb2dVUEhyc01OL2JXMS9Edkd2T3NnQi85dkk4emIyWjMxQW9NSDdDSFUz?=
 =?utf-8?B?RkE4NER4Q2l3MVZ4NTZ0TzlzZ0JGWUxTWjZVSUVNVytTZnp2UnRwdXVhc1ph?=
 =?utf-8?B?dkw4SmZ4MkxwVDJLT0g4WGZubkp5WHArV3FGSWZodlFEWU1vNHVDekloRC9w?=
 =?utf-8?B?VUFWQUhmc0drQXplZEpCVnVJdWlnekN0ZncrRTRBczlVUVFTdXF6Ums0TU9y?=
 =?utf-8?B?aTc0cXVHeFcwRnFWU25xYzczZDl4UXNmUXEvYnJZZUhNL2ZsS0RjZkRuanpD?=
 =?utf-8?B?V0k0TDNFMytXSWZueEhHTlBiYmV3SGU1WTZBdk1md0ZzUnBDYXd1N0h1K1hO?=
 =?utf-8?B?NURZdVJEVzRWRnhZTjl4Yi82bmZYa0FyRDA3ekZFSXE2ZmpWcVdMcStIcG0z?=
 =?utf-8?B?M1JQQXhNam9oc0xWMHNnbTZTZTZWdWJpUDRtWTdyQ0FqcVlFYmdxQWExY3Qw?=
 =?utf-8?B?VE9naE1IYmZ5WWR0QlVDZWp6RXkvNDREOS9VTWdIcXJtL2ZmanczRkdaa3Vu?=
 =?utf-8?B?NVN4ZVo2L3h4U2VxYm5zZFAxMDhsR1FwNVk5OWltaXVySzNwejJPMDVmQmVW?=
 =?utf-8?B?MTk3QzZwYjhmTDZETEVKTjdBQW80Rms3M3ZzT2E5cXFkRUl6VEJRNHBReWVL?=
 =?utf-8?B?VEVuODdHbXlyY1VJdWNqTnhDWDRSbVlGYjdwZ2ZQQXBjMlNIM0twd2VHTjRh?=
 =?utf-8?B?S3ViTUN1djlvaGo0VEM3UzRDRGI2UkF0NDNXVGNWbjRjWlc0VFhBNWhEK1dh?=
 =?utf-8?B?N2tkT09VbmhMMjhtR0RkM21GV1hSdXFONnhDeGU1SnUvT2htM0JHK3NRajdj?=
 =?utf-8?B?dHFmQm5KNDBBTkpSSmVnNVJhU1JUeDkyc0hVTFpteTd0NHdSMXdxdi8vYVg5?=
 =?utf-8?B?YXpkUVVxSEFtdzdjQ2w0UVpoVGx4d1o3SXQ4c2JSSkYvdE4wTnhQT3hDb3VR?=
 =?utf-8?B?QnhVNEpBOXpYdUFFc0Qva2NqTjZ2WjM4UFpkVG5TMFBBMEdkNlNHZlN2YWl1?=
 =?utf-8?B?MjcwT01pMFN2VzhhV2RpeXU2MEhrZlJrd3hIRFhuTVNrS3ozdEpYSkxEZm1L?=
 =?utf-8?B?L1dGdUhhcFBXTDdhd0liQXhiSUJnTWJZQm56V1hCdXQrN25lK0lkd0FYY3JX?=
 =?utf-8?B?R3FDc0Y1ZFJvTGNSTDNyMWlCblRmdGRNVDBYeEd1WkVqclNHdmxJZSt3TW9v?=
 =?utf-8?B?WTFCaUZrWWpxeXBNL1BhQnBhVkhaTXBkMFpmYWo1RkI4MlJxS2VVdXc3UXh3?=
 =?utf-8?B?RWRmSngrdjBIQ3Z6ekdNVHRLZ2RoaklFUnIxVC9zNWJCc0VJSzI2SlNiL2JX?=
 =?utf-8?B?NWZIdDRnTUhyVjMvdVRpQ0xWak91b1NsZVRtR0xSNm5COXdaQVB5bjFhYTZq?=
 =?utf-8?B?SG1Pbyt4Zjd5MU5yZHVrcHRlWlBHUWo1bTJjMnRtVXNtOEJlNWh4OWwxZllP?=
 =?utf-8?B?ZmwyTTVKUGlQaW1MeTR4MXlLQWY4NVBJRkVUM2tuSXd3WTVsZHRNS0NsZ2JJ?=
 =?utf-8?B?Nm9TQ0N5cU5qbm1xOTBXbkZHNnd0c0E3M1MxeHpPSnp3Z005MUI3RUJuQ3JD?=
 =?utf-8?B?V3dySkxUQlpMSVprMlZYYmlmZituUFArbC9HVlFIdXVrRjV3VHpPZTFiY2t3?=
 =?utf-8?B?SWpqUlF2TXFPZytxNGZ1TFRvNXBUNUwrM1EzeW1qa1JPVzYxeXE0NXIvTzF0?=
 =?utf-8?B?cEZMYURGVUNKV3BueDh4VkxPWHpITVN3eXlpWmZBbVM5Ynl1ai84L1JrUFNl?=
 =?utf-8?B?eVcwM0NMMVRYUlpNbVRWSk1kcVNURjhZbFhUVGVDeHpCbUZBaUV4S3Yrbm8y?=
 =?utf-8?B?TkM5MlhlZXZaeVBsVHErVS9KWm9KUTdvZVJpdm1neEYxTld2TkYzNmQxS3d5?=
 =?utf-8?B?RDA4aFZwbmVEbzYrdVE3NTRZd0hXNnZOeTZmV2V2VURMUGhoNGQxNkpuLzhs?=
 =?utf-8?B?eGVpdWhJaktiQktVMlROZGFzb1ZPcVVXY0ZaOEo1dmY0NUEyMzZVdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc4b7f6-149a-4756-cb78-08ded6a93f89
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:12:33.8528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fYCCsKQcMKKcjL+tZsiztGM4WXd2S1T4B/W02uKbXnwtQdeWYgrerXg4ncb1O1ehbsyj+ODP5PmfUETZYPh3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8412
X-purgate-ID: tlsNG-bad1c0/1782825157-47530986-78D206B0/0/0
X-purgate-type: clean
X-purgate-size: 461
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC5576E4AB1

On Fri, Jun 26, 2026 at 01:36:43PM +0100, Frediano Ziglio wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Instead of using the absolute __start_xen address, calculate it as an
> offset from the current instruction pointer.  The relocation would be
> problematic if the generated PE binary had .init.text as a standalone
> section with just read and execute permissions."

There's a stray " at the end of the line I think.

Thanks, Roger.

