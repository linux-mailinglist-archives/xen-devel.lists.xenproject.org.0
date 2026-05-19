Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA4yOpaPDGp1jAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 18:28:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 733425825B6
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 18:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313231.1583452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPNIB-0002nG-2c; Tue, 19 May 2026 16:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313231.1583452; Tue, 19 May 2026 16:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPNIA-0002kM-Vx; Tue, 19 May 2026 16:27:38 +0000
Received: by outflank-mailman (input) for mailman id 1313231;
 Tue, 19 May 2026 16:27:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Edgar.Iglesias@amd.com>) id 1wPNI9-0002kG-1O
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 16:27:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPNI8-00ChOx-9w
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 18:27:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 6a0c8f70-5cb7-0a2a0a5109dd-0a2a4504d4f6-6
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 18:27:35 +0200
Received: from [52.101.46.68]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 6a0c8f76-1dec-0a2a45040019-34652e44fda8-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 18:27:35 +0200
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by CYYPR12MB8937.namprd12.prod.outlook.com (2603:10b6:930:cb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 16:27:28 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::ae79:f50b:b7a6:4cd8]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::ae79:f50b:b7a6:4cd8%5]) with mapi id 15.21.0025.016; Tue, 19 May 2026
 16:27:28 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=fail header.s=selector1 header.d=amd.com header.i="@amd.com"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahsaF9qUZE1yBBYgpPmg8NvHbx5flWTnj/QgdnmPtTibhXokUyjG3hwv7JKGYbeUPJrkAlpGbiGoe494bw0Dzyv4j4sJyQh3gAslfz3/SBWrKM/XPzbhOyhGX5ik0k144DcOW2BO4/mQ2iC3UBdyKiG2o+FndzQC0Yn5XGZIOVSgaqUpMGLZ8nUcJLqE0l4S48qeofWVs4K1wXr4k6OdOwiTKsTItkgIGBrUhSNLGw4HUrVmP9U8x9hpep2okdAnb4ds/vWoBxlI9igFMnwlzxxL5vECtthOlZa2VOT8x8CccHOknwkWUQ+Dv8SOv01H1TfcNSon1lgJF3o3BGWTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh31kvedVf7+zuAc3TPNvVcej9QrdanV4BG58oldh2c=;
 b=eO8louH3RP1cYYvDv80DzcYdebAKlrBCCwB2oM1VTarvT41TYaZmIVMYP4tH6qD/NJLlqXgw/qgdhNIJSjp6OUwvogXSVs68EIFA3fTI3K2cpc/jTK/SXBsf3Gz6FHHKRc3Ci+o3E8owE8Wt7yVzWEZDsyxHHrlTrvBNGqoThq7wVOF0Kvzr11/Zuel551oobBqiyIAsuG17qJYtL26yTTr+HCEgq9uDMQuhybaCBlgY22mnnOT2wkeaT7VEbJGFPrgyJu0XLhHsOBJ2DgSyqCg0xuTPZ4jYFJ/Z1bhqdQsXKhZAvCw/W6UHx5+wyeyJxFJopMSpD50wzELrU5f0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh31kvedVf7+zuAc3TPNvVcej9QrdanV4BG58oldh2c=;
 b=VctKwpFDp1iz+9mIl1WEIjmz14oPM1RY7ugqbdZMwmujbRqi0OWTj1gu+yr4MGkCLcVIx9zCSHCYKs5Sd3hylD9idLazWjDO1zINcdYt4c/BZ477VGxm/jnoNlug4tepO0lRFQKXlgfQ93B0BdujWXSYE2K6hXBGT7cDoiGTSN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 19 May 2026 18:27:23 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org,
	bertrand.marquis@arm.com, michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com
Subject: Re: [PATCH v1 1/1] arm64: Fix strrchr() matching of null terminator
Message-ID: <agyPa90M2iQKTQGj@zapote>
References: <20260518234353.453193-1-edgar.iglesias@amd.com>
 <20260518234353.453193-2-edgar.iglesias@amd.com>
 <b9088d84-c92d-4b71-9d02-177282221a90@citrix.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9088d84-c92d-4b71-9d02-177282221a90@citrix.com>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2026-01-25)
X-ClientProxiedBy: CPAP307CA0008.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::16) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|CYYPR12MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab0463f-a2cc-4ca9-0e61-08deb5c384a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|4143699003|11063799006|3023799003;
X-Microsoft-Antispam-Message-Info:
	P60vpx7ZzTcpP+xLeEMTgDxvp8G8f1PNoNDh2GvLlAUszvhrrz9uR6ExApWi8ru0Bw5Lj6PgFbI2galNODLQdCHNVPlplBGp4SU4tODAsqayYz9BqJb7nTM0nPbOXXGwpvflPRmKxhrgaXk/4GdUZKvaFk6ebk5vMXJXrA073mPzD1FsjbGxEjlkAjKl6br1BO4see5cGGvTA19gOZJZxeBgKJp3GdvVD9ax3oqXjb/9McHIUaIg85cWMg6XGqVBsYKNureb503QNwlBYqKXgoiVhkUPR3PlCcXfdfCbz4rAAHrAcYf7FPxb4qy6xX8o0E4zFqivvQnCZiYWg001Lzd6gDtZvnCxq2r9poCENzEOXEe2tFGJlw1udboUv6++s7SE5GW9Bi1kFVd8iM6CWJO2sD+3gUaPSY0qIBdMDmlkIEJ/BfnY/SllgqXC5doBDBnXfM56Z36eXVvG3F17BV3OlBLnZ1YvGs2/6g/munDMq0p3CHfMQl3vkMnqca2M+TBmESTH02bf7SsGobB39grNSm/SZy81r0il4msJpyI4ArjzIxONuu093qaUg1xahrL66fR6toHSYWdxPAzjfWW/QvXp7V0YWo/eLshqJh5jN94H5jd5PtMxq0nKQ9pg12sknTQIX6RnMf97MMcFH76TTzz6pmjj6Vtr9yB6MnJe8vBGf4MjElfdoQNV8rY1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB6839.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(4143699003)(11063799006)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?eg8IM0FdKdKT0JKKMeOqjvGpYT7QRfaw/LGV7JNrkxXXI3aeD70w7le5VJ?=
 =?iso-8859-1?Q?FooRAaWa9n+VHhXSGi3wmv1jg8VnfDJP7Csl4T5Cir8WKQiK8mfuXwhNph?=
 =?iso-8859-1?Q?az/9uQjuRJp9fUaXTOMWczKfLcdgkh7QH1qwTS7I5rdhi1CU2JgRTMnsWX?=
 =?iso-8859-1?Q?SSpDeaQU7a3t32Lf3srpU3/ZYRNiF65e7ESTVWuwE648UaHcTm6KUpo1C1?=
 =?iso-8859-1?Q?GbNuP6gWsD9+9+C8u6HwhfQZescAB7Zf3ogVfRLkckE/KH/7vYtYbhSoWW?=
 =?iso-8859-1?Q?uTXnaYEktKFwKP+IuShmJF98DYyqi2mUCZKzgckwrL6Qivwd373rJz3oN+?=
 =?iso-8859-1?Q?K/qIwzugDxLHILBpyjp4+lisHgjPHyYbl4sPRUQe/Ni0j+eMvBsBntO95X?=
 =?iso-8859-1?Q?Qt3OgqW36Kp4ss9qrdZiEtDgbbd3+0aiW9sLshsGWXZSIXm3zOgQJ9P+xm?=
 =?iso-8859-1?Q?9CXykUmfVMQLRPNrIHdx1P/26ZOB1OKCthhCBeqes53rYnJDABLbNWrwmq?=
 =?iso-8859-1?Q?LDaxfEhu20x495yE3MJ8KiLV8xPmcYhgHj781K3hDTgAQbkG9Qv/KUFMKr?=
 =?iso-8859-1?Q?Yf3zzQ3HehoiqSlbLKyjDzgbEJVBGR8xcEVpNQPt1wUuRt9xaqSlC61nLB?=
 =?iso-8859-1?Q?wNy/aTchcb6bgeVQCQrhg28ryTORvXTTRFHQjKLaa5hLKSbXS/E1BFG5Qa?=
 =?iso-8859-1?Q?B8QkwkBpD9zbY819WBMibS53n0p7WPvZuiNrJ5rwlS+EJ2hPIDXL/QqiV1?=
 =?iso-8859-1?Q?B4RRHV0GeiVOYeEcbsnE8Ey5F4XmoEkrGnvYHvA/Xnelrkpj6/eG/1Ce/f?=
 =?iso-8859-1?Q?Ho4ToV+46kEfyBVj88vuaDgxgFgqb18lVJkocEnbDhIZGRmXHirPjWwJs4?=
 =?iso-8859-1?Q?M8NElxiWlrVNPUwAaynTeio/Z4PW80xYvF6Sk5yIBiHQN/0WO+I8d3tn4n?=
 =?iso-8859-1?Q?5sx9eUY9SXAwb4jNFtOVB0AAab6Mq+bkH8n2T/zL1Z33aYrlmQw1PQdB9V?=
 =?iso-8859-1?Q?ahp5mQhXy1O7wQMALwmebXvNOrOkNi4H4epKfK7Iz0iq6LeHCG5zS9kcuQ?=
 =?iso-8859-1?Q?/ZmXpq1XL7T+g0D7XJACEmfudvO6Fbc2TGKoZ/XNndboUC3W8lpLPKnenl?=
 =?iso-8859-1?Q?ahc71/J1KsJ7HNyEQ695w0W/LovA69MCILJS18ez+/VyNagB6PbDvrIXP2?=
 =?iso-8859-1?Q?Dm0TijGZceNuZAGL0ilQmAQpUuCEp4+6oKcicmF4fE1L6FXd6Dwitwakz8?=
 =?iso-8859-1?Q?ujvEu/4gumzi5JiHecOONkfa9l2zzfWKuhRohfybFXZ5J/hfxZMyGGSaOQ?=
 =?iso-8859-1?Q?Zcf8Ew2ly9cWFhZfYLQqD2IHeoiAb9XEyJ0xOKdCh+h7Q8Cs+JxbqcBjGs?=
 =?iso-8859-1?Q?WfIRDyLLZAXp6kDBDFxbCrU8BfIXYcSRG4np0+lptzGbqpj6vQB+UJZoO9?=
 =?iso-8859-1?Q?rhJ68VmGWpmPlob44UcS6fiy9ybXwsOK4knBhjbJIN6hhGq6XHwyeN98xB?=
 =?iso-8859-1?Q?XMTvRpgk3ZFFNIaeZauuTYu4RC0ayh0okL1d1LWZyuhmSAmS/o/s9m4/DS?=
 =?iso-8859-1?Q?WLR/LG+0FjeJzxnYb5fKnx0xljo6JuMeIJrea0QUUT4ZKoZKCFWKXtlux0?=
 =?iso-8859-1?Q?bUJt/oIhSIMLSmcVu0EMxAz0kV6A411k2/70KQBY9oNd/t+mnUqi/iCkUO?=
 =?iso-8859-1?Q?LoxAKrMNrKsMw8AzuuUgeZiAUPS9g0YJfVPouFpk/l3layCWZfmGMRCNxr?=
 =?iso-8859-1?Q?SU3fXxQFRh1Wtb4WpCdZs3hKaZG5ykucUSqeLLiK/3Flbk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab0463f-a2cc-4ca9-0e61-08deb5c384a0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:27:28.2509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYH7Mup1Tas0wGgFI4QLLeFj2SqcAPxDMz0e9uVOph+V/KBSDFvrYommFUoJSvw5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8937
X-purgate-ID: tlsNG-ebf023/1779208055-407713FF-7467C5EB/0/0
X-purgate-type: clean
X-purgate-size: 1795
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 733425825B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:45:37PM +0100, Andrew Cooper wrote:
> On 19/05/2026 12:43 am, Edgar E. Iglesias wrote:
> > The generic Xen strrchr() implementation returns a pointer to the string
> > terminator when searching for '\0', matching the standard C semantics.
> >
> > The ARM64 assembly version stopped as soon as it loaded the terminator and
> > returned the previous match pointer instead.  This made strrchr("", '\0')
> > return NULL.
> >
> > Compare the loaded byte against the requested character before deciding
> > whether to stop at the terminator, so the terminator itself can be returned
> > when it is the requested character.
> >
> > Fixes: 42c4eb6a83 ("xen: arm64: assembly optimised mem* and str*")
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  xen/arch/arm/arm64/lib/strrchr.S | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> A couple of tangential things.
> 
> This file was inherited from Linux.  Does the same bug need fixing
> there?  What about the arm32 side?

Yes, I'll have a look at Linux. Arm32 looks fine to me.

> 
> Looking at your example, it surely wasn't actually as simple as
> strrchr("", '\0') ?  I'd expect the optimiser to be able to turn that
> into a constant and not call out to the library implementation.
> 

We ran into this while exploring a new QEMU based test framework, we had
it do some fuzzing and it tripped over this.


> Elsewhere, I've created xen/common/bitops.c to be CONFIG_SELF_TESTS for
> the bit operations including the arch-optimised variations, because
> they're subtle and easy to get wrong.  This looks like it's worth doing
> the same for the bits of libc we implement.
>

Yes, that looks like a good fit, thanks.

Cheers,
Edgar

