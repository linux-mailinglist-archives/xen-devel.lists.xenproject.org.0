Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c0AJIp6vOmo1DwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 18:09:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE28C6B8941
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 18:09:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=jJPWJ8mK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344406.1603479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc3g9-00024S-B5; Tue, 23 Jun 2026 16:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344406.1603479; Tue, 23 Jun 2026 16:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc3g9-00021w-8Q; Tue, 23 Jun 2026 16:08:49 +0000
Received: by outflank-mailman (input) for mailman id 1344406;
 Tue, 23 Jun 2026 16:08:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wc3g7-00021q-GB
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 16:08:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc3g6-001kL7-KP
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 18:08:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3aaf7b-bab6-0a2a0a5309dd-0a2a450883f2-34
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 18:08:46 +0200
Received: from [40.93.194.71]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a3aaf8d-9ee7-0a2a45080019-285dc24774fa-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 18:08:46 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6520.namprd03.prod.outlook.com (2603:10b6:a03:394::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 16:08:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 16:08:41 +0000
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
 b=wj+9Fn8NaWx1nyZvdU6WPYcUY1DpW7PmuC9l/n8SQLMHfzXmbOloJ9u8xam29aOOLNY4CqlWp/z85Ew819wwSgqvyWBWMNDV4tIdLlEgvtE+mPWfQ1lH6FBl4M4AnZiI6v5g7PNJTppP/7wRNe/Vl0e34omGX0v/eYhwYNdSz5VgnKd932ndMOPeoYhCFGxWgOlR9yD6iDHawEY4c4FN6un3NDCc9c6Sf6nZFZxf8wDqBTUVNyldPPRBsTTOSYoSzWOd5L6MpbdtC5dZFfOlzHolZjVCj7NdIXpF1qFr/ghwmL7h7mFWZstW/GeNy7EKV7dP5mKtD7bAZzeyWh4S4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XO1iWj9ZHyOA8hiyMYvoPhUHzAtXwOxdsR1eoN9HB4=;
 b=SBadw5CVsJi6Aubis+vPO7mD3+MJZp/T9tnw/0yyUPFQgHF/q4LBrfmAYqLsDJFbhmo2f22iyRNc/g/nljVkmaWS+o5ZTAykYbgKPivxiVreXLoSY2tRiz9qeTqYnOJcydAYiojYg4IjyLXlxK9z9UnAQ+k+CboqItx8ZHyCZn903CWR+7XIXBi3pFHzofrUM4nMQfdQEQc7yekRNH6CiSLccX6M/veZrGvffdp65vo3r2k1D8owj4iXBKKMT338XWP963a7tCRI+WnNbf76r10amcQeZDgFmlcdJrodt1/csH1m75pU7VEqeAfWILP0UcaTFmjKBOkb4t8e1WBVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XO1iWj9ZHyOA8hiyMYvoPhUHzAtXwOxdsR1eoN9HB4=;
 b=jJPWJ8mKx1QqvwW5s9iNUn2dprtQkwnQdxC01QvSL5yASLgGelluCIzFzAqv9ddQWdwgC3EOSaUdwnPQ3gyJLxxlaSZMfX1ePf4iuZ/LhZgxGxwVowBhqWjCC8mmwRw+tYjs6KGQ7z/KyFevdEzQJO+aO22utOXMIJEBU85PGXA=
Message-ID: <5176cb78-4445-4c94-a76c-fd08c1417211@citrix.com>
Date: Tue, 23 Jun 2026 17:08:38 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 ross.lagerwall@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/7] x86/kexec: add digest checks
To: Jan Beulich <jbeulich@suse.com>, Kevin Lampis <kevin.lampis@citrix.com>
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
 <20260622151833.3397692-2-kevin.lampis@citrix.com>
 <b7bfcd3f-acad-4637-a391-32cc9bd71a38@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b7bfcd3f-acad-4637-a391-32cc9bd71a38@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: 662bbbf4-135e-4561-ef70-08ded141b1bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|3023799007|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	yiRxlMZpMm/FDEC2xmAQ1hlydjlNSI429TWNdOxPgv+2vNyey/6Q+WxaOrif8ixJSLecynJcVOIUY9ed1UYhDbpTVQZ3RSWtX3pfbBwLTlBzcLnnyVlNg1bSmOWSpvXNb4JgvCrZHvayTuTdIwfCiBK9qDBbxYt2mO1vWhnvMDi/zgM8SPPI9pwSA7bgUn0hWbyR+uRKDAkiAIb4lpPGnL6HjINP0WFXGxmWCOF6UnfSjkjUnbpFUCf+0MOoZNye/dav/qW2xQSTr+/B3tIVhYjLSeh4bwIfLZjepEbX+3YfinCz6WYYmlcTi+Ubbz8AWSexCTmgKXRWVRT0ZVBFS/kisjTwRPlPXuYAo2HP625vR4WNurEdFPKSoxt/JKObfIpfOI25OPkfWeFUln08HVb6zprrmxXq9Xyoj/EYN7PFnyZ8JCrmJ3n/nAOAIBDDT7ppiTzAa9hQurxzhPtPv8mIHmIhC0Uk/odlk3OlbAdBM8G8Kn5qldb6hACzPtC2D0rD3gWEhTNou0Upl7wUxAmhn6ul5kauf7bKVAvv53qB2EoBVA3bS9sVAnqHiYDHlulRBJRrraDalukENCg3AaghTjtxKTgcEt4qZJIPIy9X0rkFKKDNoPwGnnaDfEdjk3Ho0Lmryapq9t5vEZKYZmbzsyJ+jk5kslKgw2M2xLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2tiRjd3OTgvN2dlV0wrZzRPb0k5bFNqM1RIUlBSditDa1lRa3VwM0djMXVI?=
 =?utf-8?B?akdhT2Y0MG83SzlLeUx2eXRKSCtpYUZXZDc3dU1nNWx2M0QxR3BWQmc2eDlC?=
 =?utf-8?B?WFNwZldyYi9BOTlXWFk1NW54b09nZnlKdWR0ZWowNWdqVVVPMEpnZjE3TTRw?=
 =?utf-8?B?cUd0MnJQWXRlSEo5emJwSmc0Skd0eHcxQjQzQlR0WlFXQ29SWEsxYVM1U2tH?=
 =?utf-8?B?ajRaczhkaU13T2k2bC9DTUpENTZFTU4wdTQ4cG5Ud056SllpR0Z1ZDJtR1R0?=
 =?utf-8?B?bm1wQU1FR0kvOXlUOUVrcEgrT1dXcmM2WVUxQzVuelhUMEUyKzZwT256YWNH?=
 =?utf-8?B?UDZmVVlyTkNRRUVQdUhMbmIyc01QZkpXajNzVm9zSm1EejBhZytaODY3SDlT?=
 =?utf-8?B?Rk5LMWJ6YmtWdm9PUTlBZVpvanNQZXY3VEZiZUJwMDRjWUY2Q0tTWlQzazZG?=
 =?utf-8?B?ekkxUmM2ZjA3Y0NWWloyTjlkdExwZnRmSEl6alRoS2tUOTFFSDRVNXQxcXlt?=
 =?utf-8?B?WjlhUmxkaEVzTkp1VVAzTDJsemN5R3BPUU5ldFAvTHZGQ01ORjdKdnE2T3JM?=
 =?utf-8?B?SnZ4dzdGVE1kN0daM2g2OUtkakc5YWZaZzRwR29jdkVhVTM2WlhWQ3YrT2Fk?=
 =?utf-8?B?TktEUWhZUURkOHlPUnU1c1p0MjVKRTRiaTZHL0dyZWhmYnd2a2NNY2ZNN1Zn?=
 =?utf-8?B?cjZiRzV0ZFdXWFJYWUc3Ujl1c1pvUmxJZXBOeXoyRWc2NFBwbi9ySklkbnFM?=
 =?utf-8?B?VnRHcEw0eVFSZW42VVI2MEtuYitzTUJxMHlHMGhpRzlNSUtPSVphZlJxbk1x?=
 =?utf-8?B?UGtUb2xJVHdCa2d5ZkRXdDZDY013V0VXUEpQRGhGWEFhdFgrSUlZdEYrbGMw?=
 =?utf-8?B?V2wzTVNYNkRvMlpQS0dIcW8rclhyZEwvaVFPaEVoZXpGZkE4L2VkZm53MFdJ?=
 =?utf-8?B?cHp1RjRYdFBuekQzS2tnRW9QWTlJVVF6dHlQamVaZEdNUlVkQzJkTjBHWElM?=
 =?utf-8?B?YjB0NlN1QVh5MkdUempHUENtblVvUHNQRWlwUStQSndQM2tVbW5HZzFMZTFX?=
 =?utf-8?B?TnJTQzlSQVRzd3lzZFByR21TQzZKejJaZ1d6N01ZemsydjZXWjQ5dnBXS1JW?=
 =?utf-8?B?aEM2WkREZkcrc0JkMlgvNEtEYkQwM0pXcTNFN0VKMjhyZUpFRTBzK2xTenVN?=
 =?utf-8?B?ei9xKyt6NFZMdzh6MkVCMHNITUswQUVmTFd4b1RRdk92RXZQdHVGSi8yR1lj?=
 =?utf-8?B?dDF1ZWJHT2o2SU1sdjFDeWpVNE4wTTlhS0JuVC9BZTZIZmhrV3VSSVo2MGwz?=
 =?utf-8?B?d3VFUEJQOUFLYmZiWEVOYi9lcHBSSnR6bW5VTzFseG1YT1V6VUgwRS9iSHdC?=
 =?utf-8?B?MTZ4cnNWRk5qQUlLN3ZJRWZmT1VXak04M1MyNnYzdVlBSE9pTjVjUis0aHhB?=
 =?utf-8?B?bnd5cW1LYWlrVXFPcFNCRmZuZXhYWVRaSmtXdGpVMFM3Zm1WQkpiY0E1NFB6?=
 =?utf-8?B?Sjl0OHV4TURmalUvcVk5OTcxNmgvUTMxSWRSc1RSSHUvSWMxekpqR2cxck9w?=
 =?utf-8?B?Q00vVHBnaVphMlFtTytlQ3ExdFh0Z3ZUMG11RTdpaVBRcGQ2SHNSQ1VEZkZS?=
 =?utf-8?B?bk1nVUFsUFluS1JxRU54VE1JdUJCc0l0aFkxdjVocFAyZzRtc25nWFFSNDJv?=
 =?utf-8?B?V1dBMHR4ekV5OHFHL1p5aUpxYVNQVFNsUkhxaGF6U2lnc1VSTk9vQmhpSzEv?=
 =?utf-8?B?MkdmNGptZmpXazJac0EvTkxFMTl4dEFZMXMyQ2lkNFBrZ1Y3YU82bDZMRmpZ?=
 =?utf-8?B?d1RicS9EbVk5RTlsRXhJNTBtK281OWpOTnFrNVd0ejNwVEMzS3ZjakFVTU9X?=
 =?utf-8?B?NDB3WExJSTBsYjgreUNmQXZBTTJrZUhldkQvck4ycmladVc1MEF1STRFRk1j?=
 =?utf-8?B?K2ZQRlJnSmtOdThMaXRmeUxPZnJjRkpiL0h2b1g4cE55OC9OQmVINDVsNnd2?=
 =?utf-8?B?cUUrQ3EwckNkT1BZcHp1REdqRzJkNG5zZm56L0VoSkxqeHE2RkZEZmV1WG5v?=
 =?utf-8?B?NmxjTWdUU1dHSjRZblZCTW41SDl1K21zN0RBcEV3cHRJWXBwME5BcUk1MlM3?=
 =?utf-8?B?ZUtUWWtsUDE0VDZJZXpyaG1pcG02N0xXUWZFcWpjYXRib1B5N1pvNU9YTXJS?=
 =?utf-8?B?R1Jzai8zTGdRZXpDVjFpSGxzY0ZUaEJQUDhhQ3l4MXNNcHI2dEdVYVc2NGU3?=
 =?utf-8?B?SEVJdlVUclEwRlgrOVZ5UEMzbzZtcmZwbGdIMDM2SXdCMzhzclhSU01XU1hR?=
 =?utf-8?B?M0NTTlhSMHd1NFZJOWV4NVBOdTd2S0JIRHdEUTZkNTBTdEs0QzJDdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 662bbbf4-135e-4561-ef70-08ded141b1bb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 16:08:41.9298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfWd7ZPQVUS3E6Rvrp04s8ZVnyujAV5Zd9SFJ4wOALcX0f5PP7UyieolLFKeeqXdEQm8Eld7gx7a79XNpuV9fiDDXXbwTiWY1k3LYywAOdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6520
X-purgate-ID: tlsNG-c1860d/1782230926-5E7E90FA-EED0FEF6/0/0
X-purgate-type: clean
X-purgate-size: 2126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE28C6B8941

On 23/06/2026 3:44 pm, Jan Beulich wrote:
> On 22.06.2026 17:18, Kevin Lampis wrote:
>> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>>
>> To support UEFI Secure Boot we must check that the kexec data has not
>> changed between signature verification and actual execution.
>> However, this is also a good check to perform generally.
>>
>> During kexec load, calculate a digest over all the kexec segments. This
>> digest is stored and verified again later prior to entering the image.
>>
>> For now, only kexec crash images are supported.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
> I guess I'm not quite following here. For secure boot purposes, shouldn't
> the new kernel already come with a digest (or really with a signature),
> which we could check in both kexec_load() and kexec_crash()? If we check
> against a digest we calculated ourselves, we'd apply more trust than we
> should.

There are two problems.

One is plain TOCTOU.  We load the crash kernel at boot, and we jump to
it in the case that something has fatally-but-not-catastrophically gone
wrong.  Really, the digest here is an integrity check.

One is that Xen cannot perform the signature check on the passed
kernel.  At least, not without gaining a full X.509 stack and
authenticode algorithm, or a PGP implementation or equivalent. 
ExitBootServices() nukes SHIM_LOCK/LOADER protocols so they cannot be
used later in runtime.

Because we are defining the TCB of the system as "Xen + Dom0 kernel",
it's fine to let Dom0 do the certificate check and say "trust me, I
checked this" to Xen (albeit requiring that dom0 userspace can't issue
the hypercall).  In the current implementation the dom0 checks the
signature of the binary that userspace proposes, and either rejects it
or passes it forward to Xen.

All Xen needs to do is ensure that the bytes the dom0 kernel said were
good are still the same bytes we're about to jump into.  Hence the
integrity check, which is a good move even in the non UEFI-SB case.

~Andrew

