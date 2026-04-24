Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEGVIjeO62k+OQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 17:37:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1924460D49
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 17:37:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293767.1571285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGIae-0001v9-HH; Fri, 24 Apr 2026 15:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293767.1571285; Fri, 24 Apr 2026 15:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGIae-0001t2-Ea; Fri, 24 Apr 2026 15:37:12 +0000
Received: by outflank-mailman (input) for mailman id 1293767;
 Fri, 24 Apr 2026 15:37:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGIac-0001ss-6D
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 15:37:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGIaa-005LwC-1Q
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 17:37:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb8e10-2eae-0a2a0a5409dd-0a2a4501b3aa-16
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 17:37:09 +0200
Received: from [52.101.201.61]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb8e23-c1f2-0a2a45010019-3465c93db098-4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 17:37:09 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Fri, 24 Apr
 2026 15:37:05 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 15:37:05 +0000
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
 b=KCfYx9yyGkjif9se6rRlMtAi8nHnKHfmIzbK/uWlV2WBS8r7hqWTDficXHul+1wAVV2ew1NytIhUrDyFmtf52XOBex2isfzWPNnEwzNk/0TCvCphkSDhu8GPgi0dCDRRzXBbOOlte/URsavX1bCoAAJsFomzQe2xnKubpS6RpcJ5c7ca/v53ldojUCy9HFEKXtGVIHAU9nQpAr4+PiCCLd+CpVodKZmW0pz1Cp38/3HMTYeI56z3aDNmKQPLk/SP1nhJH6ZWSJ5NSf6aeTR7++MNxOTGCkJftwRGx49gw2j/YEoRgib66Nc4sKXGMmMcS8tiY1Pu0t4H+GIywLhRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EldwU2NDoCOxfFJIeFGWaTwWmfHSg+9wmWF4Tcw4so8=;
 b=c90iIJhOh0wApIP5/cHP8YyHerxF2ySbQJHxEH89ITx2COkPyiQ1orES3/xoMql6kDtE5SKCfPfdazI8kcdrosHoz2iEOj3MZTT8iFf43kkAqqzewGCx32xW11VWopvNBW6B3/Za0mVA9Syn823T/M/Nvo1KAQ3ZNDDcCIyIcr4wckGyRzIt/wtwlvJiW6nSujnHBtrhHANaIQI94Xd9m0gyVD0FKQdZFI6jq9a9bmXZZbOoPBimZwRoCSdHfA27EdPIaVza3FfP2zDKHnynSWmqsNy3IGpRPS5OpGatPteBHmOVIQ22jDTF4xPXIH1ev8NmtuQrEw32XuVlA4ampg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EldwU2NDoCOxfFJIeFGWaTwWmfHSg+9wmWF4Tcw4so8=;
 b=QFdrBXoaNbV6YjLc0WzRGnEp8FB3s+LyujPREmWmHwAfo4GR8yvtCkt+R8ChkCY9flzlN/PTI5rakBTnKfmM21EeNRsz/xQXCfwRcwiMG4lHS1ntoLWAZtt5NwRQtXbAAn370qbP30CtTZvRGnFy+V9Isu0Hg9vmeD/jQP5is44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 17:37:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/9] x86/mwait-idle: Remove the 'preferred_cstates'
 parameter
Message-ID: <aeuOHFDI0wkCUKxp@macbook.local>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <62702a0e-a43f-4a15-90c7-e5778bbefb4f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62702a0e-a43f-4a15-90c7-e5778bbefb4f@suse.com>
X-ClientProxiedBy: MR1P264CA0109.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e912fd9-0df2-42e5-5e59-08dea2175637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2lhn5nJzfewm22cSeII0URVefK/BB6p6597eStyoGYkmzISwEV//N4PCKUUrJGYcAsZcXZ487Yp4ETOjffcc3MffWGdF2iEufD3qQSjR6Cx07UqQVxJvmJ+ii6iezDlP3BFBzyzMg89IXocCAiqir+OCrDYpGDhNGc91W3U8pzPsz8L3vIHTCZwbSLXzMrKT8E3pKTroOybSeZc1jMv7CfPpM2AnkS/LnoxyzcVqCoBAY8l4Fa9GkjKOitbw8BeoBi4RJYlEMSBDAR7OJ9jZMTJOkdSxGyEwZAJsi3chBbm5E/b0PdtubE/nIWE1aX79bAICzSLnTOyZFZtJ2Ydp/o1K+q8l/XZ8cfNsYVWh4ZYbJbhJUyxAdKy/+kE9NO1LR4D+RFthVRF4/8xKsGplMO93cq2/AOsyK10ms76515UkALKLgeZ1VpLiJZPCzdQ5+oExfqC1F5dAUTLIIVCV5MFqoD5VpbCv2TRetyuDpGW5hqo756ZJ7jBGCmi5H5m6gvXXA+YcM8Bzz81/0z7MQsjgE6ejXq79yV9MaY36/4GSfxaK/54CaDqRcXFPVtrlCeReYINpfsGyBnUv8oWv2UZBs0YXzNrMcp3UOgCnrvywFThZgX7MgyskY+DqbOTSTA8pXZN3SfyazyBkHX7iln+PBVIhWVgFUXpXEF9bKH4eeStddpwoJqTr5YXubAy1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUNXY1M1Qms0eVNTNm0vdXdHTFBrNmdySWFNaEZLQnNGYnA5ZjFaeG9LeGhp?=
 =?utf-8?B?UGNESk4wSGora3hRMGxtWlR2TnNjdUI1SU5kYkdLYzlyM28rSW5XNlJRRmxn?=
 =?utf-8?B?UlBVdWkwSkVQUVlIVzF6eERYWnU5T1RDeEQzeFVWL0hLcFM5VkxkYTZaRkdV?=
 =?utf-8?B?eFR1c3Jpa25wRWM4eXZndWNGYkR1RGFoSktZV0xqS3hpeUVWSnhSTXY5Tmdy?=
 =?utf-8?B?QWljdnJrR2pqS2lJV2tEOE9UbFhMZXdXNWhlUUdIeTZQeEdJZElQVlljSkh3?=
 =?utf-8?B?dnF3OEgwNU8vMVROcFdXVUxuWDEvalhMeWVyWDU5R3FuaVFYZ2xoQlRWZVBY?=
 =?utf-8?B?WXVpNXpVMmRUVHdWdDgyUXlrS3V4eElQM20zNnFiVlFsMTkxUFVMeHZ6b1dm?=
 =?utf-8?B?M2dkdkwyWSt2bUdrTXk0clJFTUFIUWxXMGxvTXA3ekxhdHhScUZMUFZrSlh2?=
 =?utf-8?B?aTRlVkRML1NkL2VYaG5xaHpTMXJuYXpSMis2cU43cS9JdHRGaXNYMGtRSHJL?=
 =?utf-8?B?dERtWENOajFRclZzcy9GT1Y1OHJIL0JDWEtDUEpidHlNQ3NKTDhyU0RwUFMx?=
 =?utf-8?B?b3BrRlhzdGFCK2NGVTE4bUdCd2pRcFZOc2VPbHpSdS9pV1NXaCtYT05FODh5?=
 =?utf-8?B?R3UzNHhwZW5sK2NMSzQ0d1grS0JqUVdveE5PdE5EZFByaE5QVU5VTThiZXNy?=
 =?utf-8?B?RE9ic3dlQ2lZODFhbGF0ODV3a0VkYzBqZEVmZmlzRGZNdWNwbnpYd3QwNHBW?=
 =?utf-8?B?aHNPWWorYzMvSjRCWUFhaW1ERS8vbHlITk1LN3FSYlp1dE1OUjV1NDRPQURh?=
 =?utf-8?B?U3d3U1Z2OGdaQjFBWmdDS3l4ZUJlZVZJLzlMV080SzN4VVpjY3lXeVNBLy9H?=
 =?utf-8?B?aE12clBwZVZrTCtpNFRNalJkL3hoUXdzL3V6NTF1a1lINXRjWDFaUHlPSnRH?=
 =?utf-8?B?djF1eFdsZng5eGVkenNqcjBYMHdWWkVST0p6azErMG1LcWx1RE45a3VhTUVz?=
 =?utf-8?B?UTkyWm8zYVlJYVBSNlJhdnpUbG8rdDBzTnJ5bjF5VCtlck1qMEtGV01JTEQw?=
 =?utf-8?B?QVVWQTVZWDlhQXhkTU93KzdXT2VVZitocXVyVjF5R05lNXl3eEFIV0pKcG1E?=
 =?utf-8?B?TjAvS2N3S25QZVE1cDhXeS9qNlo5S2VXNjk1aklLSmtVMVE5WUtJcVVpeWYv?=
 =?utf-8?B?OHM2ZnJuUFBJcHBJenRIMmlGeGRsb1Q0UCtUTW5JL1lTOEFZVHYrNlYwNHF2?=
 =?utf-8?B?YU9ibW9LbG00S2hPNXVidWdNOHcyMFNKUkN1NDg3bDd4SFRHWTRKQkZ1NDNp?=
 =?utf-8?B?L0NMVDJPTUN1Uk16bGtTQithSlZtVHh6aUJzWkxId3hpZVdqYlhqTkNmUEFC?=
 =?utf-8?B?S0hBMGZFd1RVd25TL2laOEd4MmQydTliNVcxNVMxZWZja2lmOEJhQjlLTUo1?=
 =?utf-8?B?WE9ubDJ0ZkgwRFB0bmw4QXVLTlgxMTJxSHVnbnJsWUh2bUR2TUpRSFZIc01M?=
 =?utf-8?B?OVBodnF1bFlPdFVhcTE5NklVUks4Um1ha3JUVzlOT2U0WVNnUENNZWF4VHQz?=
 =?utf-8?B?OFRFaUpBdEJCR1VRd2RwZGlKSEVabzR6RnNvRmlkNGFMUU83cEd6Y1NqMjZv?=
 =?utf-8?B?TFE3dVJERkhETXVmUHFlb2dZelptVlJwMmlCZ3B6WnFUczR0QklXSnVKdFhB?=
 =?utf-8?B?TENReW5wcW9ydXNpUTVsem1pcEVwQVdUK2dwWkNpOWZPdThCdGNpLzExL1VS?=
 =?utf-8?B?VnlFMEZLbFVldDNMQmhCaTRlZUR1QTVMRlNQWS9LVjVGZzVaQ0kvTlcxRGFG?=
 =?utf-8?B?MDU2cHVKVTBJa2VkZXplcTVGOW01cmFqLy9WWW9SRFRMTG9YWGZXY2djTzVQ?=
 =?utf-8?B?UkhtL3FhQlczTzNtWnZUSUdsNk8xQmE1cERuWWVjdWlRWWtveVBNUjdpOFZ2?=
 =?utf-8?B?VVd2STNDRE1Ub1R4UzVKenNubWR4dWxzTXdTQ1QzdDJVOHV5Q09IUTNUZThL?=
 =?utf-8?B?aGVvTlhWVkU0OHVScWcvREdBVWpjVjNxTGdLWnYxZEhldXV3UlQ1ZWNCazJy?=
 =?utf-8?B?WlFJb0d6WHpQUCs5dUg1dnFwUzJjWlN2dUpXTzhSYTVmeGFWOU5YRUxFRzlJ?=
 =?utf-8?B?cjhCV0E5SWllQ3IyWFBHR0pyYkRHNHZ5cEhxMm1VaTJZYlpid0FFbU52MTdN?=
 =?utf-8?B?NDVvQTBWVHJ1UjJRYW91aSs1WVpkcE82bFNNUU9hRmVBWEZNUmlCZjc2MVB5?=
 =?utf-8?B?NFZrMGZWN3o1cXZxRkdMR1Y5bmM4Njc5R1ZaOUhOVUxIaU01VXBNaklNQXRv?=
 =?utf-8?B?VndqbW1yT0VTTlFOVERCdEViL2gyOTBlQnRBSzg0REVPNjBvT3lMdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e912fd9-0df2-42e5-5e59-08dea2175637
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 15:37:04.9925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSuVGMF3pTP8DcwExfLnMNwjeYjiAwQBHE8O26ETSEXfxwia6/PQOGK31HOgbvmqLMDZal+X1EIHXUHLp1Ur0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6423
X-purgate-ID: tlsNG-d62444/1777045029-B5468FF4-B0652B7F/0/0
X-purgate-type: clean
X-purgate-size: 1789
X-Rspamd-Queue-Id: E1924460D49
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
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,citrix.com:dkim,citrix.com:email,macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,intel.com:email];
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

On Thu, Mar 12, 2026 at 05:56:55PM +0100, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Remove the 'preferred_cstates' module parameter as it is not really useful.
> 
> The parameter currently only affects Alder Lake, where it controls C1/C1E
> preference, with C1E being the default. The parameter does not support any
> other platform. For example, Meteor Lake has a similar C1/C1E limitation,
> but the parameter does not support Meteor Lake. This indicates that the
> parameter is not very useful.
> 
> Generally, independent C1 and C1E are important for server platforms where
> low latency is key. However, they are not as important for client platforms,
> like Alder Lake, where C1E providing better energy savings is generally
> preferred.
> 
> The parameter was originally introduced for Sapphire Rapids Xeon:
> da0e58c038e6 intel_idle: add 'preferred_cstates' module argument
> 
> Later it was added to Alder Lake:
> d1cf8bbfed1ed ("intel_idle: Add AlderLake support")
> 
> But it was removed from Sapphire Rapids when firmware fixed the C1/C1E
> limitation:
> 1548fac47a114 ("intel_idle: make SPR C1 and C1E be independent")
> 
> So Alder Lake is the only platform left where this parameter has any effect.
> Remove this parameter to simplify the driver and reduce maintenance burden.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Link: https://patch.msgid.link/20251215111300.132803-1-dedekind1@gmail.com
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a36dc37b5672
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

