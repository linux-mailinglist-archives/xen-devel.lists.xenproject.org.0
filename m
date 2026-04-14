Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9BLrIT0Y3mmDnAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 12:34:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962493F8C69
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 12:34:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281575.1564444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCb66-0005ar-Md; Tue, 14 Apr 2026 10:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281575.1564444; Tue, 14 Apr 2026 10:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCb66-0005YG-JO; Tue, 14 Apr 2026 10:34:22 +0000
Received: by outflank-mailman (input) for mailman id 1281575;
 Tue, 14 Apr 2026 10:34:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wCb64-0005TT-Tx
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 10:34:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCb64-005RxD-9s
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 12:34:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69de182a-2eae-0a2a0a5409dd-0a2a4505bdb8-2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 12:34:20 +0200
Received: from [40.107.209.66]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69de182a-3760-0a2a45050019-286bd1427fbf-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 12:34:19 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5573.namprd03.prod.outlook.com (2603:10b6:5:2d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 10:34:17 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 10:34:17 +0000
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
 b=Ajk3/CBDEvqd5ldbLVNXK6BrF1eE4rP5G2Huus7/PFAGN6vPHaM0EDCKraXUdsSFQ0Q5nea8h5DgyNbxH8GSXq6YNikm7KF89l5NI4CTNIr7zTfZsdh5/fq3GMliVg2ZNDKo+27oBMMOZc6o5MUh39BOJYBHZ7E788ZHbWNYegLEePjwNWJOevJRJsD4o3rg7hmMoRGIRpjE2jb54/5f/Yrzf7CxGaKXYRliYLa5RRZ6bcfs53bXe58sEJgpIpezc3/w7Dc8TxxuDiYk3J0Jrf19mJ7ku2C7ePVbTmHRwoK2Tc5mHwl/qJaA+/rcgq4LzDqA+0iDonPrGJ9jCAzAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGVSDh5emAwA1BEqtFY9L9MsAQ0MuA1Vvn2A/zahgyg=;
 b=f08y7wmZFZiEo9TrXj83dPz1Je7cyA698vQKlK4fSvDENugNjKWGpq3y4+YiDRSGMtXOsCvV7pfUPs1p/a7ojb+iPYhfcHBVn+ReyVcnulBf1eN+2MQrhfrSuOVBh+fiD0GR9sxfTKL22eC687mylKAfxzcFefIiucl1uW54CIJdqUpjfyxVyoFYdnM9V6I18MpAdA6Mn2GzLOq6ehSvHuBnHLVqd6atWmx9/MdQ2f8ZuUMtfVH1SGUUe6Qv1/y2tmK0gzuJrKT/ZIUBPbMQjqeUwtG+tQikHNSXeh2xL0rbFR5MMeBDhjb1adxw77jOZ9SiYRbA4GWlY8K25f9g8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGVSDh5emAwA1BEqtFY9L9MsAQ0MuA1Vvn2A/zahgyg=;
 b=kt//cFlS0ndojtG1SWYn+sWeSabhY85IIQZJ76Z/HSg+mGsefI9v+BnTodCsi6B1FYieu922YRw4sI+CsFgt5d/ba1HAFI23dC1aWMKXx5gfWzjnGCXOK1Q65jtQqH/ts27g4w6WwXYNBQBPuwBBs+6L2ffxONq0q9xUQU0nnhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 1/2] x86/time: use native TSC scaling factors when TSC is not scaled
Date: Tue, 14 Apr 2026 12:33:26 +0200
Message-ID: <20260414103327.7420-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414103327.7420-1-roger.pau@citrix.com>
References: <20260414103327.7420-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0016.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::14)
 To BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5573:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bbcf984-4e24-4ac2-c874-08de9a116085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9KwTCntheGr4nN8hi2eJ7QNXyRT1Bny65fvvlwxnq61XHr5s/GexIXXFonZQoyNFtNQLzJS04DAkpG2+COY0rYMHkopoLwmnDRf7c+Ynj0xNg3dmCBHjZYWZiGoRvPOqaI1wZzimOZb5h8wQEt2pbPUPEXa0WAsR8L+8xyVg8rIq6ptYtTidNhtKB005keVgyjrmfsEJNL74D724bPcrTPESEYegpxoU6nMj/PXvWdSTg20XuO+xrSSPJxXi5ahyny9I8tquh7S3g2sXgocE0ZOWt7lY8ASn6Q7Hh7c7BH3nTgiEr/X/TPE2HQRbhTNY7HuojDHysaXbiysqQab8l0xeK2qfOJnZ59sKbU1ApDSw+Jpg6wlH2+3M/fFcTLRoLXrn6BfC4tVz4Rv+kLLUVqEwH8Wj5mNKxJ5uH0dOKZZxNZrZopxc4ZmBp053Z+OpOFa1g0ZFifTs4D/9xiV/N1F3E5GMaVDQPv42rdQfPky+cCeCG8fW0w9Nyev+MZFk2cOxz9DKgVvAXSwhzNPT/Aw8Zhoo+0VRP5Puo7y4I72U2y5doYlLO537jt3o6/JbikRvEVs8iEalt5vyKAIrIYI82uUMDnn/f/G+Z8NWl3A1w7w3CjFDrMKNzBlMYIVn14ZkJ9sttLIU4+tBYsRAT3sneRQ1YSMNrAqH44o1M0fgqiVOzalkMJw2LIGOWKXRoAl19Izzzet8rLaZbH0cjFfzZKAoU26xHi+V47WhXaY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXdCV29WMW5wa3lZdDlxY2E1UDZTYzBFZmhHZjBybElGRWlGa0RuN3diaDA1?=
 =?utf-8?B?ZkJGT3RkdHBSSkZndWEyTVhQc2kxblNheUlFWUFCY1ExMEtOYUJudmw4REFP?=
 =?utf-8?B?amZCOVVxdlZHVVh3TkhhSWt4RlhGWWVReEYxb3dZZlBvT29UUlVqaXF2aW9y?=
 =?utf-8?B?MEI4SlZuRDdaL3hFRmZtaXFyVGx2OGpiUXlzd3ZHWnN1dTRlY3VXWVBMeWVo?=
 =?utf-8?B?VGRNcEwrOFlqS2NZTnpvTlNRYXFqWmdSTnJNVjhXMXZIQzAvTWMzUXY0RVZr?=
 =?utf-8?B?cDM1c29nbCtGOE1Mcmc2RVZRQVI5R004ZjgweUJ2YStEaDRhLzFSR3BQQXk0?=
 =?utf-8?B?a1VQTWlGVDdvV3BDSFJ0b3ZpMHltcEhUQU1wdDV5SHpKL2c2OVdzdlJNT2RF?=
 =?utf-8?B?Vk16OEZySW9lT0VPdUNRaG80SG1JeUZlaG5WNEhQYnpnTzhzU01rOUp2QlMx?=
 =?utf-8?B?TytnQ29BTlE5NWZ3bmxuejFUc05Ia2t3azBjR0wzc1dTVXpuQ0pXZTFtWFJY?=
 =?utf-8?B?VWt6cSs2UjNNVWYzQTRyczFteEgrZHBDajF1eDZBRTRwVkx0NXdZczNqZkdl?=
 =?utf-8?B?akZuOEJJT2tCZ0JNNkRuOE8xQ3Y4bXFCSFJvWUZ1UU1WYWpRam5LSlBLV2Ja?=
 =?utf-8?B?N2s4V3dDcnhBUlE1WitvdjZJZFdsdExJWG80YU1HU3pkUEpKa2NtUXc5ejhX?=
 =?utf-8?B?VzlFQ1JLSm9ZZzJYUHk4bkZLUUlhOUQ2RVZ2WEVSQzBta3BTL1hpcVBWUVk5?=
 =?utf-8?B?L1BlY0xaTURFeEIxTGtSc216aHRyWUpjTkF2L3FDZThPTTEzTURmb3lhclNB?=
 =?utf-8?B?dXVYd3dxK21oa2FhYjkxRUhNeGF1K1o1VmJjM3JzL3lzeEdZVTRMNHRjdnNG?=
 =?utf-8?B?Y1ArM0hYRlJIMENIZXF0elpKLzc3OFo2VyswckhVWEJlWkZ2VktKQit4ck5y?=
 =?utf-8?B?NW02K1ZwQXJSUkN1UnQ3Nk56citnc01wOXkzblZZSElOblJxTXRzdnZrUjk3?=
 =?utf-8?B?L0JMck1jYmhQbUQ2cjZGRlZXSENYUkhnazI4L0g0TURkTnpIREl2M3lnVmh6?=
 =?utf-8?B?eTZvVVVZWE9TYkxmSE5MRmp0VlFGTENxZnN4QkgwOVVKWDVEL3BmRk1RZ2tq?=
 =?utf-8?B?UWhWUGovQmY3ZE9NUFJjN21YY29adzczQVBEZHNDQyszQmVHWU1NdGsxcndl?=
 =?utf-8?B?UHNNL2FFRUdET0xkWWdzQlBTRTY5ZnltQkhsWUFPSUl6ZGx5T1lYNjZSeXJ4?=
 =?utf-8?B?K2oxY2IxYXpLZi9WOVpKTEFYSmkyNVA5bUVaQUFpSW1abGVwbElRUnIxR3lY?=
 =?utf-8?B?SDRZWDJkSk82R0pZSGphOVRhaDFFN2duMTdqM1FyZ3QzVElxRlpQaWZnTHlP?=
 =?utf-8?B?ZkFUcW9rZHhlSTNTblMrSWs5Uk95WHZTSUI4SVNXcm1sRTd6b0NSeURWMGpE?=
 =?utf-8?B?dVJRQmIwUWpqSERDeTVYUjVCdXJCK1FrWFNyOEI0QTl2WjBBb0ZPTTE3bThV?=
 =?utf-8?B?UnFzUTkxYzloOUdGdVRIbU00UFV3amt4NXVVVXczQmcvbnNhVDArZERiaURO?=
 =?utf-8?B?bk9yUE44MXUyTktESWxvSTA0Y0c0R0wzNDRvaXB3L1JMV010OFpVdnNQL2tI?=
 =?utf-8?B?aDJBSjdwTTliWDg3RHd3NU9aa1g3MUxhSmV6UDBnY3g5T3hjL0lHNWkxbkdF?=
 =?utf-8?B?eklIZ0VKRXdEQW4vWWVsaFg3Zmp0WDExb2I3cGEwK3lNZm1qS0xIaHpnTlFE?=
 =?utf-8?B?bVM5SWFiMU9IWmxmdGEvT0J0N1ZnTjVnRGRudEZSZlZlWHp2b0FaNG1qTXRv?=
 =?utf-8?B?M0J1QmQ2MXFlRFZRTi9hcUZpVEF5M0t1Q2JpVU9HSUM1M0w1K09oY01CVEp3?=
 =?utf-8?B?STEvMDFMaDBJNTJRS0R3OHM2SW4rclVNS0NuYUZ0c0o0WFQ5dXBUSkJQUEh3?=
 =?utf-8?B?d1pOUmdJNkl0N3R6RzBwQUQwd1BRY0xTMjJYc3l3bUZEa21qKysvTERha0gr?=
 =?utf-8?B?ZVdJN09tT3c2djBKRmhocXZhMi9xVGxIRHpLRkt0RDdqNGZLTnNSZ3ArcEFR?=
 =?utf-8?B?ZE5xclM3T2U2Njh1RVEvQnV0RWhCYUxGLzFHL2tpTzdCUWI3MCt3N2pjSksx?=
 =?utf-8?B?Y2ppRi9HSk1ieFQzc0piSG0zV0sySGJLcWw2bGw0TzFtUzFHYXJxd2hVZzA4?=
 =?utf-8?B?a3Z1azN0MFo4WmhmQTdlcm9Hems3OGpVK1BTMW5QbFcxVlpZK00zRXR0dDQ4?=
 =?utf-8?B?Q1F5VllJTE9SWHZDR0Y3TWUzZ0xOb0dOZ0ZaaythWWVXekpydXV0M0I1cThM?=
 =?utf-8?B?eXlqbm1aUmhkSXNMU21SamhHYXp1UjlDb2ZlRy9IMjFMWVozdm5oUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbcf984-4e24-4ac2-c874-08de9a116085
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 10:34:17.1600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/MB8L+7ZF+G8/lZdoyOSXo54R5RGP91ubWBu4O2D5Q8NB4Rli6CJyoxLkdducX/8mZkvMCQizA81u5GNqLnnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5573
X-purgate-ID: tlsNG-c201ff/1776162860-2312596F-A368D2EF/0/0
X-purgate-type: clean
X-purgate-size: 2885
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 962493F8C69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When running HVM guest in native TSC mode avoid using the recalculated vTSC
scaling factors based on the cpu_khz value.  Using the kHz based frequency
leads to the TSC scaling values possibly not being the same as the ones
used by the per CPU cpu_time->tsc_scale field, which introduces skew
between the guest and Xen's calculations of the system time.

On a 2gHz system, where the frequency is possibly detected as 1999999999Hz
(note this is a worse-case scenario), the cpu_khz variable will be set to
1999999kHz, and hence 999Hz cycles will be not accounted for per second.
Over a second (the time synchronization period), this leads to a skew of:

cycles * 1 / (Hz freq) = 999 / 1999999999 = 499,5ns

So far this has gone unnoticed because the time synchronization rendezvous
forces the update of the tsc_timestamp and system_time fields in the vCPU
time info area, and hence the skew only accumulates up to the rendezvous
period.  Attempting to remove the rendezvous causes the skew to grow
unbounded.

Fix by using the native TSC scaling values (as used by Xen) when the guest
TSC is not scaled.

Fixes: eab8a90be723 ("x86/time: scale host TSC in pvclock properly")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm worried about the usage of cpu_khz beyond simple printing it for
informational purposes.  Overall I think it would be safer to store the
frequency in Hz, as to avoid losing the least significant digits.

In any case, that's a different change.
---
 xen/arch/x86/time.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 4233ea507d40..244277c0a921 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1710,17 +1710,25 @@ static void collect_time_info(const struct vcpu *v,
     else
     {
         if ( is_hvm_domain(d) && hvm_tsc_scaling_supported )
-        {
             tsc_stamp            = hvm_scale_tsc(d, t->stamp.local_tsc);
-            u->tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
-            u->tsc_shift         = d->arch.vtsc_to_ns.shift;
-        }
         else
-        {
             tsc_stamp            = t->stamp.local_tsc;
+
+        /*
+         * HVM guests using the native TSC ratio should use the same per-CPU
+         * scaling factors as Xen.  This ensures time keeping is always in sync
+         * between Xen and the guest.
+         */
+        if ( tsc_stamp == t->stamp.local_tsc )
+        {
             u->tsc_to_system_mul = t->tsc_scale.mul_frac;
             u->tsc_shift         = t->tsc_scale.shift;
         }
+        else
+        {
+            u->tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
+            u->tsc_shift         = d->arch.vtsc_to_ns.shift;
+        }
     }
 
     u->tsc_timestamp = tsc_stamp;
-- 
2.53.0


