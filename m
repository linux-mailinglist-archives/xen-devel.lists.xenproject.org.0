Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNdFKRdQxWkU8wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 16:26:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121D03378C5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 16:26:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264303.1555920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5mao-0003mZ-1D; Thu, 26 Mar 2026 15:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264303.1555920; Thu, 26 Mar 2026 15:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5man-0003kf-UP; Thu, 26 Mar 2026 15:25:53 +0000
Received: by outflank-mailman (input) for mailman id 1264303;
 Thu, 26 Mar 2026 15:25:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5mam-0003kZ-Tb
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 15:25:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5mal-00195o-Rl
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 16:25:51 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c54ffa-e002-0a2a0a5209dd-0a2a450ab418-14
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 16:25:51 +0100
Received: from [40.93.195.40]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c54ffe-1772-0a2a450a0019-285dc328ea41-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 16:25:51 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6481.namprd03.prod.outlook.com (2603:10b6:806:1c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 15:25:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 15:25:48 +0000
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
 b=h3d1z4JhItPrCY4Qc8rD+4pBTy7DMeXRAjA7QZOj625AIaGwwRBLETxEbwNNBfnyjiuJ8wlcKzD/3+DTjGrMED0dCJHZ02ULNorIHKyIDFyOH/WGkKOY6Xm9z6gErHBKeCQSnzWURLLWLw1l6TH/f+tzxD2hnxhaEc2aqEHzoZhKmuu5zCWlvOxHKxzYQmRbC8Or1YGwnTZgWIeEN+lWU3wztOVz6np0x/5RF7wO1V5fzzA3+ulBSlwiSGmkgyWgpF9QkACWO5iXN+hvXrLH4wKe5Ot9RlmS7jQUkpHA9OR8B1hqIHRFCeIquqzGDHUlArp8o3RIS4BcnJNRT+YrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEf/kYzZWfyoejUnBl//IF4oJF4zSox+GBz/syNw/f8=;
 b=sQm/sfuVjqvrm/hvlFBmP5MqTeV7ZqTmEFWpwNutB2LSoJ5Qe0SZkWIKgF0oRDG9GPp62Rr3he+fWdn2ykMNI16bhHWeY6Sr+audGtg2vpPDYAT02TyYU3Yg3L+ttWCA4MIOIMqlj+WhleKSWV3V7PTDMPQNs+5zQI9i/74EcyKS44wOrPgbk9pZt7f0IGRrLn4vfQgKqdckqSSScxTjkJ+MsJq9HRiL+gquqVdhKZj27zgi0XPPjRLEs3ZcczYWvYc3npv6dz5BGAa9gKCCGNNHM75A9cEMdP54DPy4gO/T0ANSpCoh0Hwq7G3gm77OL/ley2KauA1HOkk1y88D/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEf/kYzZWfyoejUnBl//IF4oJF4zSox+GBz/syNw/f8=;
 b=Brn5fF22jLSOXqYO8uxC+hRqm0PPlbeB0IZvY3BVnq93D+nILob5wz/0qKLAVy8P4442G2R2Z/GSWTnvFJ8HJy2v96hLZxe4UzcJD5SgERJfbAf9T07WFmfHaZixcjG2OshRj+Rf98mlB87mLOsRV87qc5XgWZddK/eWMAUxSTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Mar 2026 16:25:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] xen/uart: enable parsing ACPI SPCR on x86
Message-ID: <acVP-dkDAr2CLG5g@macbook.local>
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-5-roger.pau@citrix.com>
 <c930ee22-4cab-4bb4-b8fd-fa5e77f7505b@citrix.com>
 <67cffaf7-ef9c-4813-a829-ad5c962bc535@suse.com>
 <4fd21b4f-fe78-4f41-b36a-0c63e2c451e3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fd21b4f-fe78-4f41-b36a-0c63e2c451e3@citrix.com>
X-ClientProxiedBy: MN2PR18CA0007.namprd18.prod.outlook.com
 (2603:10b6:208:23c::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: 7423863d-796c-40ca-11ce-08de8b4bf4b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9WsVhwypYfvCLI3Oa/YW61FXDNjUlGW+DDmTagqd7Klnip72QwdcnBQKW3KI69BdaD8OIgmBySiBQhPPg4ceu275uIgpQYUfrbJHirLbk7BA1j+P6P+BltEPVmHx5g0bE6OcZkye0Z3UvurJoy3K52CArhgXegyBZRpUwDI+f37wCnLJvHSoGxs85NexehXndTFdCIx3QIJ3peH5AOBBIfUXgL6wOAR6DvQuHAcFFDFnwdi8lCFbqMz2OY49a1s/8LZg/31XOwdKwqOUs1dJeF3bjoOpOe90vZxS8mqCrk1tOuAZ/RcqYaYM5VrITb+SIbvPlxHt29P9FkeFRK145H1noumZJMwEvo+rvO/dRqVRfa3bSJeIEptJlEsktAwX5/38GgyRZilpMYlXKKGMHs0R5RUBpZP+dY+horWszNfbdOYIGJjwVlNVxj7Au0WhpVSEM8JpGZjaZtbcQw2kTcYlRaut19sUuxakVjje+5DG6m8W8/4ld03MgTYgc9vnwx1U1ralLhw7gT8CTvrCKkAa59twqf8gv5EqV4JJGek7wm80M1h1cavAe4l4CcsfhcIiICpu7I53C87fON8mLeikVC9eojaAWaklrmspJqH6PNRa8puJ6/HT7jXG2pg+ZVl56rVshrWHHol/9uypZ2kYBdKs5kfdufJYukApYuhtKmyDMKCbJaiK4OHxSPnZTasUEU40YgF+jnqY2roog9X/5tmKXN35oia8nvdGS7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGdZK0FwSEZDdUZkcFhmUW5WOElCYjh2Nm5GY2o2dVZNc000YmhWeGRLNzkv?=
 =?utf-8?B?SUpodDloVE5pSWxVTklWbmlhTWlqWFl0SFB0Mmk4TXFUYWhaVzZXb0VieGQ5?=
 =?utf-8?B?Qi9Qem5CVEdQM0xVSVl2YzF3QnBXSGJzS1hhOThVMzNtSmFKcjFtd244Vlha?=
 =?utf-8?B?RTdpWmtMOXhlcVozWUZWNnNUTGxEbGQxVmo5c1JtQjQzUmRKSGxrRndjQ0Yw?=
 =?utf-8?B?SXR2K0xQRE4yU2k5NHBWQjJrM3pzWDFMNTY3UFcrVHVoTWZzSkdrS3dQV1o5?=
 =?utf-8?B?dDJZZk83cVBveEhFajk2Zk02VlJQNTJ1OEV5d2ZBNzFjRTc1RjduLzE2Q3ph?=
 =?utf-8?B?ckxyTEdpQm1ucklGZ2xaRlUzU2tCd1lUUGRGWGFQTWg2THVpQlkyc1ZvT01q?=
 =?utf-8?B?ejNQQndLN0l3VWthY1ZicXpraUd2ZHF5cGZwb2tOOGlLVWpHczhRQzc0NS9O?=
 =?utf-8?B?RkF3NlRXL0lxdmhXdXR5a25Wb2huSitYNC9HcmIyMlk5ZW45OThFQ2NMNlBm?=
 =?utf-8?B?ZldDQStnTFdudnpFYVVVMGRjdWpQSEpzNnV3UlRiRjVSOFdYWWFwTzhtQXBW?=
 =?utf-8?B?azQ0dGZkNXVBVUF1WG1XSEVuVjJrc2lmdkdyV1JtUGwzdUZxN1hpZnVmei9W?=
 =?utf-8?B?TjV5L3JpTm1OVXRTci82b1dRNXNOWGsvVm9sZHJUQlhwMVpSdXRuU3NxN1Yw?=
 =?utf-8?B?Q2hHa3hTZzlkYnJNODVOekJjUkYvb3p4YnFpM1lVcnl6ZVE5Z0RtZDRmQldS?=
 =?utf-8?B?WVdDTFIzcUE3eGZ5aC9PNzdiQUhsL0ViOUZYOGZJb3k4RXk2UTV6K3BJYWZE?=
 =?utf-8?B?VEdGN0lpcjFhUEF5QWVQZHEwb2t6ZjFGOVdKbFluV2FDSkRxbkc4R2wxeUZS?=
 =?utf-8?B?U3JicDhOc0sxeU9mQ1U4VnkrZWdxQzZrNyszUFFzU2JVVTYyTEFwaUgwQ01R?=
 =?utf-8?B?U1NyWThLRU8zQXh2Q2lNaHgzNy9MMDVBTGorSFJRdzVJcFdLUGFJWWtDTmEw?=
 =?utf-8?B?akZTZ2JlaTZOTFhhb0x3ZFdNYTJVU2dJTythWWxKTDFvS0dLSWZwYVVWNEFo?=
 =?utf-8?B?VTRlTnByeXYwYnJzMU1UU1NRbDZkbUxPb2JUc0tZNkYrUWxyTVpHUXBqaGVs?=
 =?utf-8?B?b0w2Q2FzNENIenhqNktQODFBOTRpaEJ5MHlvbWY4VUFxT2xBTkdsRHhNb0FV?=
 =?utf-8?B?c0RyNTdZMFk5MDVuUURFcWhHSHd2NEo1Z05aaEFTbzlSREVHSUpSUFJkTWUy?=
 =?utf-8?B?cmNsdHRzUi8ySW5xTEwwTWhkSmNBQTJxVW5VdlpOR0d5QSthQ0RXWUR1cnZo?=
 =?utf-8?B?TEVTUzB4UnlyMXJuaVZaZ0ZZaE9OUkk4OHZFSDNWUUpTWnYrSk5FTDNRMG5s?=
 =?utf-8?B?ME94MlJPUC85LzhOTnN2eXdUTVF3d01vaXlZM2dlMGdIZlU0SHo2U29yTHJv?=
 =?utf-8?B?VjdtYmxFOWM5UzFMNG5nem9ORG1qaXdvRWZLcURqUVFyUVpRRy82VS81eU9I?=
 =?utf-8?B?aHVndTcxVVVPUnVvWkVLUnB2dW9DSTlVZ3VmOTA3RTZ1OEE4VndhQTRLNndx?=
 =?utf-8?B?emVBQ1Z3NGNUUDlQUkVXd0xrOWRNdlBDRDFPWTdwT2RPZGo4QzlkMlBEYXRP?=
 =?utf-8?B?WWRSS1dtQzFqY3ZiL3kxVTVkYWNNc3NJSGZDRzljRU1PWGNGWXd4SmlYcXpK?=
 =?utf-8?B?YXNLUFFvR3dPcC9rcmxHVDUrMW1udjh6bUR6Z1BodHl6VnR4NDJtN1pvbkVR?=
 =?utf-8?B?Ri9zcExYTDVJeWNqeU5lM1F4K2IxYkZjamNZNDdJcVFQUk9yTHhpbWVJWHVw?=
 =?utf-8?B?M1hlOVo4cnBlQVdpS2MyQ2tHK3pjbkIrRnMyRHN4eGpZYVFYY3lEcUx5b2Ix?=
 =?utf-8?B?UlN3WFVEQjVMdE1UdG1wbUdLN2NOeWZSQVFUUW9XSEhQTXRmRE5OaExtcGpO?=
 =?utf-8?B?K2kxTGJ0TjNxMFMyaUlnRHYwNTFFNnJ5ZDI0SElPcTcvdDhNNVhrNmNaT1ZO?=
 =?utf-8?B?NkZIZkxRKzNYVGFHb2g1SDFkT3gvSFJJSGxBM0Zkb05wV3hTdllicTJOZHRF?=
 =?utf-8?B?R1BqcHJXckVsZ2JFbGFhNXF0N0hvZkJ6aVVyV2pDRmppQTlFdFkrWmdkV01I?=
 =?utf-8?B?UVNISEZBcm8vMVIrOWJraWtNbEtWQkxEN0E5M0FQbjd5d21nQTU3S2lvMS94?=
 =?utf-8?B?cGI4YVVsM05KN1RlTDAvQVhxRXFjM0VnbFRvdG5Ld3V6NnpPMjhNbDRFM25U?=
 =?utf-8?B?NG5RVXd3YmJwaUJxWlRlSTQxQ0tQa3lST043bm96aVp1aldkeUQxTWFHOXFq?=
 =?utf-8?B?N1gzYUxJakRPR0wzN3VHNEpvR3BGNExqUGRqZE85OGxtRVdoTmxIUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7423863d-796c-40ca-11ce-08de8b4bf4b5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:25:47.9830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mu+rfxZO+hUbuVAVsFXc/u8Ofmp80R9iY6Y/MWVTJarl1Ygt+dYQIC8xrep5fpeowmvqEzS8aIyN7XTYM+ywMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6481
X-purgate-ID: tlsNG-4011c0/1774538751-52E95900-D7D14448/0/0
X-purgate-type: clean
X-purgate-size: 2766
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid,citrix.com:dkim,citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 121D03378C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 12:52:51PM +0000, Andrew Cooper wrote:
> On 26/03/2026 12:48 pm, Jan Beulich wrote:
> > On 26.03.2026 13:11, Andrew Cooper wrote:
> >> On 25/03/2026 2:58 pm, Roger Pau Monne wrote:
> >>> Introduce extra logic to allow parsing ACPI tables extra early, and use it
> >>> to parse the ACPI SPCR table and obtain the serial configuration.
> >>>
> >>> This is gated to the "acpi" device type being set in "com1" on the Xen
> >>> command line.  Note that there can only be one serial device described in
> >>> the SPCR, so limit it's usage to com1 exclusively for the time being.
> >>>
> >>> I can't test the interrupt information parsing on my system, as the
> >>> interrupt is set to GSI with a value of 0xff, which is outside of the range
> >>> of GSIs available on the system.  I've also assumed that the interrupt
> >>> being 0xff is used to signal not interrupt setup (just like the Interrupt
> >>> Pin register on PCI headers).
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> WIP/RFC, not sure whether there's interest in attempting to pursue this
> >>> further on x86.  So far the device I have is also exposed on the PCI bus
> >>> aside from SPCR, so using com1=device=amt also works to detect it.
> >>>
> >>> Posting it kind of early to know whether I should try to polish it for
> >>> submission or we are happy with not having this on x86.
> >> I think we should be using SPCR/DBG2 when available.  Getting serial
> >> configuration right is always tricky, and we might as well use the help
> >> that Microsoft have forced the OEM/firmware world to provide.
> >>
> >> But, I think it should be automatic when the user asked for any kind of
> >> serial.  e.g. console=com1 with no com1 configuration.  The point of
> >> these tables is to provide an enumeration mechanism where none
> >> previously existed.
> > Hmm. In the PC world COM<n> have well-known configurations unless anything
> > else is provided. With multiple serial ports in a system, which one SPCR
> > describes also would be (largely) unknown.
> 
> Xen's COM1/2 already do do far more than the PC world.  But ok then, we
> invent a new "serial".
> 
> My point is, there should be a way to say "please use serial as
> described by the system", and it shouldn't even require knowing that the
> description is in APCI.

That's how it kind of works on FreeBSD, the user asks for "serial"
output and the first thing that's checked is SPCR (if the system
support ACPI).

We could have something like `console=serial` and let Xen figure it
out, but it would probably need more logic in case SPCR is not
present, and I'm unsure how the extra heuristics should look like.

Thanks, Roger.

