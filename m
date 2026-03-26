Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELeID4L0xGld5QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:55:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E98331B22
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263564.1555467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gUn-0005ae-BD; Thu, 26 Mar 2026 08:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263564.1555467; Thu, 26 Mar 2026 08:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gUn-0005Ym-8U; Thu, 26 Mar 2026 08:55:17 +0000
Received: by outflank-mailman (input) for mailman id 1263564;
 Thu, 26 Mar 2026 08:55:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5gUk-0005Yd-St
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:55:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5gUk-001KW3-1r
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:55:14 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c4f472-2eae-0a2a0a5409dd-0a2a450c8ce8-0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:55:14 +0100
Received: from [40.107.200.10]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c4f470-f93d-0a2a450c0019-286bc80a2d4c-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:55:13 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6130.namprd03.prod.outlook.com (2603:10b6:610:b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 08:55:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 08:55:09 +0000
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
 b=aUSsAaQNY8utpGuNlcKOk95vv3jbIb3Qv7VeGtmQdYv7RbOiI4tiGr2Ys0GQ1J0avsjX/U2dVwSx2lwP7o0xZfIwPW7sHp3aoAVRcSdIvmcrz3bRQZCemyFVWO+97SgJt7t/pKO0d3p6efP+qILzfgmhR3XJ0WR73Y5eb/WuhSjbCqD6/2yT607pElOj8sKsWFJHgAydLvZDrl54dJRoaIgdhq6iU05Pq449HnUhDf/jE31YKpciN5NGZ+qbaNDEn8Lg0pZ5NdJ52VbDD9llyh4PGlybPuT1njcfDkcfTSLBwE2ns8C3dOzl8QKwh1DkTw6JAK7d5JGFEDMcHprfmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HE7ORryyLVtL2YJ5K9R5RomXN1arImF+mWtVO7dyQMc=;
 b=j9zIxd6l4yFrH4jtj/0mu9YJA0JY3WwKhdRlS9ZfGt4jq01Dm6NsQtbcLusArw4ppWxw+rbeKCNH4nA/cqoQGMlyAVQeFVFxqVpyV4wTwrw4nWpPYsv1X5gcnPTaNWC/T7aF1J/qJJRsOEnZIcCUE/RrDnWI610Xo54aI588WeDHXTmxDD6izH6pwWeuD4aqoEzjtCBs2noxMwaCr7BhBmm9zRFpiSWBKIAcTXXZ5feuLxpwVuwIEhtm+eX9UFWxu2cS9Xln/ouHJdWW+Rs6SlrCOqZlCFlYTUi0a86bweYApNIt5VN4i3oSBaw2dDx3+P2EM32LzA/BvxU1ORyXKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HE7ORryyLVtL2YJ5K9R5RomXN1arImF+mWtVO7dyQMc=;
 b=oo1hjExR87nsb6+NqCpXLMVbHhlKqgb2lHeurUQqyFcXsGepxVVrBhOUxGpFg4ZvRS5QP4Q/hAQppBf14VwxmtwT9q2nqIfTPWqi26mzaAG1tsosNfhHDtnTH1CKDZWkPSZqi3/YBUGwBlH/PDLzokc8Xnv4+xp2XQb1RN4/ilY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Mar 2026 09:55:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/mm: do not assign pages to a domain until they
 are scrubbed
Message-ID: <acT0ajy5ReUcmZVa@macbook.local>
References: <20260325100803.6640-1-roger.pau@citrix.com>
 <20260325100803.6640-3-roger.pau@citrix.com>
 <73c705eb-95f9-456c-ba0b-c6e0f7730ef1@suse.com>
 <acQMmXyOGFe5AN2i@macbook.local>
 <acQTUE3Lm7-KIcRj@macbook.local>
 <9bd94a4b-6724-4978-b00f-c3fd0664814d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bd94a4b-6724-4978-b00f-c3fd0664814d@suse.com>
X-ClientProxiedBy: MA3P292CA0009.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be7acb1-806f-4dfa-02ce-08de8b15623b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5/W1OrqmUi/cbJbkwr061APTannUgTAc4Qzb579ICxPXFWea+9SX9a3Xy1/tnRqu8yx4Bl2tJ0k8GXzJR7SNUYS/r1IKh0qlUFXfB4fgfInB0zuP2mXSeDELZXDzBgTc0x2rZBv8nIpoyOQmaiG2mWu8ltnBdorsJdaPHbbLLMmm4Uq3yuKni+PWuzT52IWDiIZ+TcZyb7btE4AtcALoqmE2NkiSiUF47qdhktk/G12g3aZlq44lVwXQJP/pyT9pUOwQnQK+eVMXZ4p3RWlorlAxzvzD3gqjwR3gFUsxchLN9596qcKvC/5jq5ERcWfo/iIpYAf9PzEc5XVCrigs2SVe7mgIgUL1O0qYIf6TkiRZUZ4X6opKZNgyoSAvRR+nuq0VOcPWKxxeSS2InDPnI7LUebFTqHrMDvsm9eINJYo4gC20vT9TH/Vs9mrGHv7s2uziHgxksXjpmhkHxicNG/3CxQefahoHvJKgoXYrqaEZkU8pv8/y5y598kGAxSmJ0UqB/aI3bSODvfUSJvoQ8eGGgzJfRdtuwf0NpYFBZDuPpA7ZW5+/+VzYWmEntAlJhFyARl2wGKmUx84IQA1CqDtVcPpd8SQjyBPBJoXKGNnTLiTe8/xQr5Dxncc6pdPVeRxdJ23oWHA7pjb0heBcl14b313Ic3wNDxsmWmicwDuR1jayVYivfD8dQsUkGQzpFvBKmgnunINJboo6hMd9mjeH14sk5RbBMs7MEMEPFCA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a25KZWF2UjdPdjk2STNXTFptR3pYb29CZ2I4VER2WmRnQTNnL3ROcm9jVEtW?=
 =?utf-8?B?RllxMnIvMHFZU1FVR1hZdU0vWUJ3OEphakV3YmIvUGFFdlZaQUdzOG43Z3Vs?=
 =?utf-8?B?V3Z5bDJkMFhQaVI4Z3ZNZEhaSXpVRzk5am82dWZRWEtNdmF0NThoeWlxVDFs?=
 =?utf-8?B?d09nVjZuN0EvK1RqcTJiNHZrVkpySlNUWVpPNDVrWDd1ZWFhdTJCQjN1ME9h?=
 =?utf-8?B?cjlORlBqaUwwMkM3dnA1VGttYVhTay9pbmtDMWk1eDZGa28vNmVRNU83UVd4?=
 =?utf-8?B?TktySnk5Zm1ES1JqNS9xQnVWaEwyaVVFaEhUbWVmVVh0YkRiRnRtZkorTkh5?=
 =?utf-8?B?KzVmbEl5WnBreDE5QytpZTNRNjV6M01PbHd6SUVpT011cWU4aHJ4TEhQcTgz?=
 =?utf-8?B?aHNub3VYc0poNlJJSFZwR2VqV0F0SzlBcmlnZVlKYWxoUW0xcHFPR1hCb0h1?=
 =?utf-8?B?ekhWMTRNS2NmSTlaMVBDVFFIRFdwSC96Vm5qMVZRR3JyNlpYcW9PMzVzeEVZ?=
 =?utf-8?B?Nng5Yy8yM21mTFYzUlVmUUgyWmt4YWpyNUFxZWhKbGRTOFNMa25ud0FpamI4?=
 =?utf-8?B?Yk5ORyszSkVCeG83SituT1pJcXlEU3J6aEdqbk0vZ2xnM0N1OEU2WGIvaE95?=
 =?utf-8?B?ZkdHYTU1NjVuN0pXb2FJdWlnNlpYTkQ3TGtNZUVYbWk2Q3U5RHJEcFhXSFdw?=
 =?utf-8?B?RDVUVVVRaFY2eCs2OG1QcUVKRkR3VzlKdSs1NGdVTjlCYjcvSDVVTlBnTUp5?=
 =?utf-8?B?S3d0M001bm9sbmJPcWQ3QU1HOTRIdnBQZVNpMmNkNktnR2M2SGlJcEZGUHh5?=
 =?utf-8?B?YnZSVUtJQ0lGOTlJK0ZJMC9sYmw4b2N1SXJzYk9MeVYxZ2hnTlg4dm1PNSsx?=
 =?utf-8?B?eWJxeDhFNGZ4bTE2dzcySzFXN0tKYnRpSmFYU2RKQUVpcHN6RHVLSUNtLyt3?=
 =?utf-8?B?dUcvM1ZlNzVVUEZUbmRlVVFZc3ExbnVQZEZodWRLdDhJTFFFUWFHcGJmSmxy?=
 =?utf-8?B?aC9seHY2cXZ1cWVJeTdSL0pRSms3eFRVWVRMUk1XWk9Bb1p3OGR4UTlGOFU5?=
 =?utf-8?B?cWYwYTZ4a1Y5MWtYMUQ2WWZ0Z1VQTEJWV3dCaWpNOGExeW1GSDV2U0tsdjdo?=
 =?utf-8?B?RkRYY2NnMmF1STBScEF2UTNjZ0tJOUtnREZqbzlRalM2TUIzcE9yY2pVZXVR?=
 =?utf-8?B?WjNFQzFIL3RYZzV6Nk9UakhwS0hxbExMekRncXcyOWlJZ3JnYnl0VW5ray9v?=
 =?utf-8?B?TkFRcktQY05uampRVkZySS9NYzBWOE1YeFR5RklSN0lITnBnSTkzclB4YUgv?=
 =?utf-8?B?THdrem5sNzBjYzdhcXhwUkZVQ3IzRHR3aGRjZDRBTjNHQnlUbDVNSDhZNmUv?=
 =?utf-8?B?cjRWd3ZyaVo2K0lRbG1yVTh5aEtDSXhwdnFuanhJNXNWSjVDRW9GVUZIMlZC?=
 =?utf-8?B?V0dlWmlLdEZINVpaTE5nY2xwdlZhSHJFTVNnQnBtcUVpYko1bWZaVWE3Wjhi?=
 =?utf-8?B?TmdwZWw5eXFsVWxSVDExZDVDbWIxUXVSK1ZTaUFHdUFtWFcvNWttcEwzU2Yr?=
 =?utf-8?B?aFF3VGdodHBCVE5XeHZpT3JUZEJoL1JBQUZiaGZtMjk5YmQ5ZTU0Y3BWeDlx?=
 =?utf-8?B?SmQwZUZGaFgwUEltZTRPM2NodnZKT0Y1MVk0a1VUaXFPa3pHTElKV040OHVp?=
 =?utf-8?B?SENFRjVkMldvS1BBOEUzWWtsVzQ3Uis4MlgxSnRwZzN4TWNQYlAxWS90QjUx?=
 =?utf-8?B?S1ZiTVRJTnJuSUlsaE9xNGFrdmJ6NjlYZTJrWXMwODBVODFqQmRROForUkdV?=
 =?utf-8?B?MW4wdnZzWlB5UjNOOUFkNk1reFJVbmtIN2ZmVHEzUHFiQzcwUmo1dlBSRThW?=
 =?utf-8?B?c0toMFYyTjY3Z3ZHODVjK2lpVEFpNUVmOTdLeHdCUHQwR0dpYUFRZlhHcTFx?=
 =?utf-8?B?SmhmMlQybUhrOTZucnZvTGtOazJWWWFvc3dvOVlGQzR0S0o0RCs0MWM1eDhh?=
 =?utf-8?B?R2djZ2x6ZHlCd1dSM0c2NVRlWC91RjFlbDQ4Ymd4YklVRlBTODVOQ1VlaHVu?=
 =?utf-8?B?NGdEL082bDl0UGlZeWkzRVNtMGp3M3d2Rjd5SWI0bHlWc3Zwc1grWEVkV0VG?=
 =?utf-8?B?R1JFSkJhZEV4ZWJJM2ZBVWFDUjN1U1lrUlVDWDRxSFE1MTNoSDFObytFRzJw?=
 =?utf-8?B?K2drbTNuRFEyMXQzOFNGcDN4UGMwSEg5NWFxdXg3UzNCY2lmR0RUbWdYRlEx?=
 =?utf-8?B?TUh5ZUMzWUluejJaR0RoQkVLbnN3OWpVdmdHQ052eUtVUzRobExZQkhSaDFJ?=
 =?utf-8?B?WitRa2FIc2gyK01RNm5pd3paeW9VYlNFQ2UySUVVQ0wvU2hPbEtUZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be7acb1-806f-4dfa-02ce-08de8b15623b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:55:09.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhgQZynkrQ+yvgBE7EgF5Ex2A5Yl2nV+rav2doNFpJ+Qi/tHzToSFWIU5zrrpo+FKUrL962JnE6KbCrTr0zKjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6130
X-purgate-ID: tlsNG-d25034/1774515314-F5CB2734-788A560B/0/0
X-purgate-type: clean
X-purgate-size: 2229
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 92E98331B22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 09:18:14AM +0100, Jan Beulich wrote:
> On 25.03.2026 17:54, Roger Pau Monné wrote:
> > On Wed, Mar 25, 2026 at 05:26:01PM +0100, Roger Pau Monné wrote:
> >> On Wed, Mar 25, 2026 at 03:56:05PM +0100, Jan Beulich wrote:
> >>> On 25.03.2026 11:08, Roger Pau Monne wrote:
> >>>>  * Disallow XENMEM_decrease_reservation until the domain has finished
> >>>>    creation would fix the issue of pages being freed while pending scrub,
> >>>>    but it's not clear there might be other usages that would be problematic,
> >>>>    as get_page() on non-scrubbed pages would still return success.
> >>>
> >>> I agree this is of concern.
> >>>
> >>>> --- a/xen/common/memory.c
> >>>> +++ b/xen/common/memory.c
> >>>> @@ -388,6 +388,12 @@ static void populate_physmap(struct memop_args *a)
> >>>>                              goto out;
> >>>>                          }
> >>>>                      }
> >>>> +
> >>>> +                    if ( assign_page(page, a->extent_order, d, memflags) )
> >>>> +                    {
> >>>> +                        free_domheap_pages(page, a->extent_order);
> >>>
> >>> The pages don't have an owner set yet, so that function will go straight
> >>> to free_heap_pages(), needlessly passing "true" as last argument. Correct,
> >>> but (for large pages, which the stashing is about) highly inefficient.
> >>
> >> My bad, I was sure I was using the same freeing function as
> >> alloc_domheap_pages() on failure to assign, but I clearly wasn't.  I
> >> will switch to using free_heap_pages().
> > 
> > Coming back to this, I can export free_heap_pages(), but then the call
> > would also unconditionally have need_scrub == true, as the pages have
> > been allocated without scrubbing.
> 
> But the assign_page() call is here to have the scrubbing done ahead of
> it, so re-scrubbing after freeing shouldn't be necessary?

I think I've done what you suggested in patch 3 of the v2.  For the
call here, yes, we could entirely avoid the scrubbing.  For the other
free_domheap_pages() calls in stash_allocation() and
get_stashed_allocation() respectively we need to be more careful as
some pages will still be pending scrub.

Thanks, Roger.

