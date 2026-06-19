Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SIK7FicVNWoPmwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 12:08:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA726A51EE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 12:08:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=BRIWR5Y6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342037.1602335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waW9G-0006h6-IA; Fri, 19 Jun 2026 10:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342037.1602335; Fri, 19 Jun 2026 10:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waW9G-0006eh-Ei; Fri, 19 Jun 2026 10:08:30 +0000
Received: by outflank-mailman (input) for mailman id 1342037;
 Fri, 19 Jun 2026 10:08:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1waW9F-0006eb-FI
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 10:08:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waW9E-00EU0f-A5
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 12:08:28 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a35150a-bab6-0a2a0a5309dd-0a2a4505d93c-28
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 12:08:28 +0200
Received: from [52.101.57.9]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a35151b-ef3d-0a2a45050019-34653909d19a-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 12:08:28 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA1PR03MB8046.namprd03.prod.outlook.com (2603:10b6:208:593::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 10:08:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 10:08:25 +0000
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
 b=RoZUaAltZS8+lL97aV+oUPjoNn1+T0UBHIe26MvL3pcKwuNorGyUBqenvIjxqjTNyDsbBDrxBnACRbtwfbw9WmwjMySsRDQ6m+6XbaK2e4Qijxl8tEACD4WBVMyQnT4h8zNAiuKXSgz8c9k/ut9keII28UZG8Cls1qKp8QTUaNq+L1PMcQ0KiMnH7Z6xCdpynVws0Di3isFmbIq/m8arfyigbMQeCO9pIsUkTuC5pVZ+aFdttQBGBL7PDqselp3UjZD9SbzEdXfbvwoJkNGxzhH6WXoeCpS8v6+UOYOebJhtwuULZ65QANt3cwHXDYhVDaR+AjJShdBuRTuG4xYFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fF+b+mK/pq0ibKGfsuhXPasEE+qThQxB8ux8RuMJ08Y=;
 b=a6mmLg92wFTzO3SIb6FktGJ3vsuZ0K2fw+K80lA/dcvyv0upwNTfPh/8aq0pwuuKEX3CKOhnYko17ULwL1SpvvfrF9aRSfo44sQ8cTdggWIPS91/yJURNyPaTDVi7o7fBr70T8Ji7IjpOh/BpYUmdaeMOMhs2o/BbAamf0BYeyubv/EbnM57NblLzyDvXAzdDi68gYnE50dwkll6bnVnZwxszxAZn+D6jch73yrs7Uw4zCXf2oFdf/OHNeJt1z6MmZGYVk/P9n466nXCMmzR8Jyr0GcvYRPpzVcfu+C35u/wxiVRxIwepli+bQ44rkKvhLvQemwE4N35tTAy7XSxbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fF+b+mK/pq0ibKGfsuhXPasEE+qThQxB8ux8RuMJ08Y=;
 b=BRIWR5Y6JvEXv/sQeLh+s+v+E+mclhdpZmM+xMaw7i1lY6FS0j6QmRgOisAgxmeEzaCOi9pyD0UUJlSH5EH7vzMHNxWN6+tVlJ8O0oEvlNN5UEEaN4aAkPPdIvV2vMQBgqsJIZeS/Vh8zm1+SiWmJqSdGQdifxFsRBUYLmqt4lI=
Message-ID: <b6c069ff-b84c-4f3c-bc83-fa7e847aab6d@citrix.com>
Date: Fri, 19 Jun 2026 11:08:22 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 12/15] pci: Use pci_sbdf_t pci_check_disable_device()
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794559.8631fc262581453bbf619ec5b2062170.19edb3b555d000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781794559.8631fc262581453bbf619ec5b2062170.19edb3b555d000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0147.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA1PR03MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3f9f73-9757-48b7-44fa-08decdeab3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	LJsXeHjnXNIniiKNc0m+hdPVgTtvNfk91Rwl4Ub2s4Ildfjmit5Mtpg6Yo2I+/5RFpBA6fmOEefkqaM3UhbfWDLWZVV5m9IcJwe3wQ4gEKevIFN5DPTGdM0WGL4eYRy6MgoqgdE0lOLFxtlPfb557Z/RQtd0jgFtKQ0FabYUBzXDjltFTRwDWqX1c6A6MFnKvJOJHuxZhtJlYVAW8cxM84BMvdtxTmLY9JEXlkyIBX4WZA9+i0nq/mtLAAKN3z7gClB20vO3ClMPDtx/9BbbF2rhVRS561gXAiyfO7ZpvRy8qj3pGfNluB+vKMeI7MG5cwbLmrRD6cUQJ0rjQa7Oal8kRam5/Dl1IyyGX9SK89sYV+1vgYxXDcvbB8MDBhbSTslGUO5nA+CkfAYpomAFMFtcNwfdk1tSSOx8k7jhP8sMPwrjshDwKmgjN98vBeqHCjSbOvPFcEJ5yEiy9oDMmlK/mMGRtOL+uo/pi92Uy1xYB83dMkwoCqvvVgqOumGrPmKwJfmKeycFjG+1bVzgQ1z+XLyZ+hsONVMchmyuj8cR/jqlpfXQMEl7al1b/e2VhqWDKJyFY4taA8DWFZSj8f0rxzZyeDhSlNtXL+HC6Z5QG+ccjkMz2hvHBgQSKauY7T2qbnI9fYUNClDVaZoZkRZWMQOh7tN2eX4QcxYMk98=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzRkSWlpZE1HTVZ0OE5mbUFTaUZJTm5Ba0gxU3I2eVBlRUdmVFpZem4ybmx6?=
 =?utf-8?B?dTJHS090YlFHUEhSeG9NZzdiUUk4NVBuOFNBT0pRRlBDU3ZnZ3Y1aEgyOUlh?=
 =?utf-8?B?QldEQ3VxYTdrc2dKY3lxVVVXNGFoVTBycm5qOUxxSDloL2NabUxqNUZDemNK?=
 =?utf-8?B?dHk5ckVSempTMEtCYUxleDdYQ2djc1NtRzNjL2pvR1IxZWdtbUQ4VWJhcEI4?=
 =?utf-8?B?ZGV3MHErN2cwaWFTVm9SS29iZVVYSjBJMnBsTzJQd25nR0tEWDAyUHJTb3lm?=
 =?utf-8?B?OWdLSVJ2OGV1R1VtNStFSU5tR3hVZ0J5QWlrUDRuamcvY0pmQkZFbXI5SDRs?=
 =?utf-8?B?YkMvNHQvYjZoVndMTFFUOWgweStJeHNtajdOMmVQckMrWllqNTdrbmQ3YTNx?=
 =?utf-8?B?blo1NUQyOTN2OUhaSWI1eXg3UklIeFpIL2hieFZHUlV5OUk1V1lyV0FLSDgy?=
 =?utf-8?B?R3RvVjkyeXJCVUJaVkNjT3BzaUpxaFFqYU1mZ09DekJ4RHMyZ3RNNk9lMXNw?=
 =?utf-8?B?SGJ0QnBoS3NaSFJEbVZ1REg3UFhlOFROaHBib0xiVStKMlk5d1k5RkRBRDFR?=
 =?utf-8?B?cFhtOWlMa29tS3kxemZMTGxOZlo2UHRPZS9LcUpmOEJhMDVSNUplY2xkVkU3?=
 =?utf-8?B?N2ZidXltZlU4ZlIrQ01DMXBnNGpEWG11a2p2aGQxaHdFc1MzMWJWek84bzlE?=
 =?utf-8?B?dlI5ZWV1RkFHdW9nc2xVNUw5Z1A2ZlYwbzY2TkNsZmNvNGlBa0hPWWk1aXQ3?=
 =?utf-8?B?SGRpSUNoWFVaWlFBTm5zTk01SFIyN3E2VjRKWXEyd3lCbWxrWlc2VHo0dVNw?=
 =?utf-8?B?Q00rRWQwdTVmR0R0R3ViMHplNFZOeGd6NXYzeExrREJHU3BleVY5dW1zK0Rp?=
 =?utf-8?B?UUJUZmRrSDZtTitLekIrbmgxamF3WVcxMXFOa00yaUVLaEtsd2pUd2VHRlpm?=
 =?utf-8?B?bHd2TDFqWnA0NWM4aXBkbWhZL2g4UXlNMHpZeittV2haWGQ5djdsaEpHRG9y?=
 =?utf-8?B?Y2dXWUlpcWRaQ242eFpSZG1yQVBTOURHOG8vTStIL0NVNHI0aFphenFNSGdP?=
 =?utf-8?B?VDFiMmVsWTVjK21qNFZyTEUyTzJVWlpQSUdIVW16L2hwT0J2RHN0UGoza2tT?=
 =?utf-8?B?aVU4cFlhUlZEVm5wOHcvRmZRZmdkK0NMbW10aEN4OFd4N0V2YjVyZEhaWVdS?=
 =?utf-8?B?T2doejFVZi9BaUljMW5OVFB3dDM5ZEw2UlI5YitERE4rcC82MUVlc2FYRTQz?=
 =?utf-8?B?RUErUGgzTXFPVHpSbzIwZDRCa1EvakNMeEtzbjRwZDR4ZTNLd21rR1kxcDBT?=
 =?utf-8?B?R0pGM040dGd2U0JRK0VsRjJPMzNGeDZxTEZTT3hadGprSkQwZzBkOW1QcGxV?=
 =?utf-8?B?ci8zdWFJY1g1NlBEalp5R1RKUlpTRWFDMVp0R2JLNTByZ2d3cU5qU3ZWRWtn?=
 =?utf-8?B?ZlhTaTYydS85RlFqRmV3V3hKaTBmbldVc1B6RTlsY29RcDhxNURBWmF6TGp2?=
 =?utf-8?B?eEpLVVNrMjlsdXNVYXFuamVPekV6VXFoTkFEV2kvUmlsZWRnSVQySDFWUDl0?=
 =?utf-8?B?SDZsWUpYMUY5b0l0WCtDdWw3bXB6eWd0WUt0ZVR2dHZyeXJPbTJYcmtsbk1h?=
 =?utf-8?B?WURFb1pYRFUxTUhhYkVHWUVhaE4wMkFodGpRV1hwTE1IbnZITWpzdGlid1dN?=
 =?utf-8?B?aXlaN0JkSnpVbDNOaWJtaEFCd0kxQ1hzM2ZjRzBsZURaaDFmR3E2NGJFYW8w?=
 =?utf-8?B?dTY2d3Y0R1JkcFZpb29LUzg3N2F5WjVpNFJTaGwva1h1UW8wcVo4V2dxaU1h?=
 =?utf-8?B?cFFoUmNiQ2xBcDVlUUhjZzdOUFVoZ3RNMDY0SFM1RlR2YVozdnJtTjEwSk5S?=
 =?utf-8?B?eWxnVy80QWU0Z2RPajRLVDM1bGJ0NksrWG5LMXJFT1gzZGJmZFAyYjFuTkVa?=
 =?utf-8?B?ZUdUek84QUI3clYzOVYwcjI5SUw3NG8vK1JIM0FLcTAvM0ltdzZ3cGxrZ3Zp?=
 =?utf-8?B?YlFUMDhzbDNtbEpsZXU1WHdSbUhSQzExRjlETldOb1RNK0ZTRGsrVXZYYmdm?=
 =?utf-8?B?V1dqVTc3YlFINlFrQmtDZis1UWNqUXFBYm4wNUZvQmp6bzZGRHNqdkpOakd0?=
 =?utf-8?B?YmR0cStRNjNjS2N4SExiOUdBNEFFMmpiY0s1Z2VPT01YTVgyTXlLYnZESi9s?=
 =?utf-8?B?YkJTLzRKY3AzQjdLL1M5VTJZSXlNTTBSL3Q0UjVlZzltVjlPdUtyYlVyY0Vv?=
 =?utf-8?B?R2ZaNlpkTXZKamYrZmxld2JMM1o1d0l2Tk1yZGpUWVJBYzcwSU9LckV5M0pn?=
 =?utf-8?B?ZzhjYmxyRmFNNnlaWDJJVTYzT0FPT2FvZmdhaHVtU0xTM0x5bjJEVnJqcGdU?=
 =?utf-8?Q?ut8Be39H74zE0R9A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3f9f73-9757-48b7-44fa-08decdeab3dd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:08:25.7544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8+Wrk3JpFmnuWOEy7JPrbeZrMbFVVPX4uBHB0ROELlyaEBsQyKkRgGpRGXi3HjswKZJDZeuWj93/aRvNeVTMWN+pOXSfFnXSZzFDxEXqPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8046
X-purgate-ID: tlsNG-c201ff/1781863708-A48A0127-C39EDC38/0/0
X-purgate-type: clean
X-purgate-size: 193
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAA726A51EE

On 18/06/2026 3:50 pm, Teddy Astie wrote:
> No functional change intended.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

