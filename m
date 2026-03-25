Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK4LLDr4w2nPvAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:59:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742232753E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262515.1555017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5PhA-00048p-Dq; Wed, 25 Mar 2026 14:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262515.1555017; Wed, 25 Mar 2026 14:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5PhA-000471-Aq; Wed, 25 Mar 2026 14:58:56 +0000
Received: by outflank-mailman (input) for mailman id 1262515;
 Wed, 25 Mar 2026 14:58:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5Ph7-0003yr-Sl
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:58:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Ph7-00GX2B-8V
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:58:53 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3f81e-bab6-0a2a0a5309dd-0a2a450ca2c4-36
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:58:53 +0100
Received: from [40.107.201.38]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3f82b-f93d-0a2a450c0019-286bc9263638-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:58:52 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB8032.namprd03.prod.outlook.com (2603:10b6:806:45a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 14:58:24 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 14:58:49 +0000
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
 b=CxTpgdybzIUTejkbmW1/tQr7jiS8PiFL0U97Q4uYeWrJlhYZZGeBHfZalnOI5Y3HVAB0+zuLZs2f1vGhv3BLrnbzX4TyLw4+dQhdkCstESJ+fopwaL8KIuVOUDbXrFUvrY1LAj5Y+YXpTB7yBBcWKUaAOu83WCjv42GSFbZGJyvLKhUrq8ndL6aKbOGk45uIJxabWWCwFmp3XDZdi4KkozCuUqrEHP8VZOlN0C7o/Eg73FO3waFxEUhS71mQqMWbbR3irf0yM9cJW2uXAvWj7edk1jYKqBgKSDPNYzgm7M8t6D1dbGhe1iyBHX4gT2TWvk/5lKHcrIku5QqIC6srnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psSwTiMHxfUat3/JIkx9r7muILzs13+b/MhPgdlVn7k=;
 b=qpA1VTLSndzxbdwh5VlyKU6JkXJp1r/KdP8T/KtH7ltMFyRd76H0oR1+ivzhAh4yIkLRqkmJgcUE2Lv7axA2HSgvpbOekb064Pv+agOwq1timDBSPwlM+GJp9iFvH5W52ZgK3r9UVhE1K+Hsg+BAcEN4TkWpT8PiRTrU0uXcXF19Ppw6s/hzPWDit65zLhp7YNbN2e6P6jrhoQLBSuxGbqiVCiXxNkKO56g3+hqRQD4C4NSpLpp80ND1k8Dex6VJKX5YBkUMgOe+DsdyWGtZfKZY1llNcivV+Q64RRZ7tGuCbn+IJJiY4dhdrr5aRAwPxTZmNYdYcSxkFlt1Omd73Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psSwTiMHxfUat3/JIkx9r7muILzs13+b/MhPgdlVn7k=;
 b=xM/S7Bc9h/QDsbJUbuKYOIpjL6rp9GHT54yZNLURHAXKd+KSOnhWoMSa8kqNGk18jynh5dFU1xs199vq2ulupttWmSEjuqEvZd0DPIdwKTfnbQ9DqwjgHoRW92yu8QSo4kBG1xNWaDMwPkj5auI9vU44gIcZc9+tOZFoDGnpjZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/4] xen/uart: enable parsing ACPI SPCR on x86
Date: Wed, 25 Mar 2026 15:58:24 +0100
Message-ID: <20260325145824.31601-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325145824.31601-1-roger.pau@citrix.com>
References: <20260325145824.31601-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0068.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: 242e09b4-95b9-460a-d95b-08de8a7f058e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pWECrpdXnbhs5XNshngbPzddDPy25r6EmyRmdUSo8OXlnCJlUfP3ax827uZnbkQspd+MgXiUSXF1rNN5zrbb4azPPDk1treww7sMrNFts6PcruQ+Nmbn7pc17DpYpT0MwbzTYD4iBx2Ozqyg0J2dRqqpfkZMaTBrmOZKKj0BIRG12U8NskYP713LNBZNlLnPgCe9nKK4bqqeFFWo+ylWcDljUsVeynkXM38NlbYYWX3IprDiZXW6ULj3RUnwux+Umfu20teCVrmLFw0Oip56LdyE5lITW41wC03F8T1cwPIe+YCuG5YFahA68QARxjayoxSBmuryysPsArY2ZWAhGA1PJptmPWGS9v3GupYS8LKn3BuTjpfE+CCd3Bt1bow/8ptvdegoUIDzwO53BFRhZKwVu7wK0E0Jbkp2Kw0skThlRniK7pgkbnYAyqzq4wy/PLJA7ZS/BCrsCLicM7Lp8ntr8y5ei+qHoz3kBU9PcftEUqCk59ayMXw48DxO1OWvd+eRFPgHtowXj+VD99VP0ObdGrich7INfQJXEc8BQDNPYNpLU/vwob/nz3WJ2miKjuKOvGzB3gNMYXaXvyE2JBF9b8KRG7j0xpp7r9StdriI08d2z/fUNPsi590UtJJcxURkeKWIjyx4uxu3Dlb1vOqjXq7yeUZNAdJsIxd9Nv2Sj/Umwo2O6TAm0a+o/UWRwf7K8G5siFPfullKuNDDTVp3g8onp6Hd+d6B1OAb44U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmRyaExsT3l3Q0ZtZzVsbnBUUTQ2S0FZU1ArS3VPQThMVDNtYklDVTV3ZU5n?=
 =?utf-8?B?YzcrRGhWOGNkeGdmbjV2c0IzTk5RYUZuWEVMVmhPZWZUZTBDZDN6eDhxNFpZ?=
 =?utf-8?B?Qk9jR1o0ZkhuVk4zNTFtbytvMUhmaE1xNmxJODFZTEMxRmxuQ2QyT08veVVp?=
 =?utf-8?B?ZFJKRzdyRXFZQlJ4bXlINlV3Qm5wbUFuR294cE9admdLNU02WXQ1YzA4eWVV?=
 =?utf-8?B?SmtGZXhLNnlBWm1DUlo5R1BZMFNYYSswU0tJUkYwdVYzMkE2V0dVaVQwNElN?=
 =?utf-8?B?RXViMFFYZ3RQRU5MYXVma1FKcmM5Q0hsNTQ3V1I2OUhPNmxTV2tKeVo1QUdi?=
 =?utf-8?B?YXo4QVh0cVVJaGgvUlZ6SjdJK2J1QndPSzBQT2l6YkRiQmF0SER2MDhlM282?=
 =?utf-8?B?MW4xZlRUTm5TRlpTR1pOc2k4VGZaeFRNYzh5c3c3aTRsb0FCcTVUQXVKNFBa?=
 =?utf-8?B?M3dWQjRLdnpCek9mamV0NGtuMWZ3MERFTzB2ZzNzUEdLbTl1Qmg5VVIzaDM2?=
 =?utf-8?B?S0VmeE1DSjkrSEJwdE1NcUpVb0g4SEF4TUdDRVNxa1VNRERNZWZBTVVqVFBh?=
 =?utf-8?B?NHRUUnFlSjdtOGFhdXBQZVh0T0RyNEVCMys5NGhpQldGM05YaFUyYStZMGVU?=
 =?utf-8?B?YStqOEQ4NEVpa1JuN2VxQ0dmazlaak1mSGVwWVpGOTUvd2xOWWJyRlpWc28z?=
 =?utf-8?B?UzNhdTV1aUJGU0JYWFhJajBuQmhRVXlEWDNCd1V4ZkQ0TFFUNFVIQ0UxS2E5?=
 =?utf-8?B?M0l0TWdMMndtY0syK0hUdlZza29DRnFCdmkxaG9yVzNqdi8wN2dtc1NwVm9y?=
 =?utf-8?B?cHJoQ3VRM3JpWUw2eXVQeUVEd0dXcGFvdXZVVWRRRzladDA1STJmbG9lazZG?=
 =?utf-8?B?dE16bHlWa0dSSTNlSlBQZ0d2NnpYNHZHeTlYOHdXOEg1LzhiY3UwRXhVeCtF?=
 =?utf-8?B?NlJ1WnBweFVZdkpFb0hvditTVWFUMEhGT1lWRC9RUTBXeTExakhSWHc0SXhs?=
 =?utf-8?B?VzAxMU1GYkEwWkdrWDZJOWpNSm5PcnlKVFFrd2VUUW9ibjdvK2trSjY5OFRs?=
 =?utf-8?B?c2pVTzBmVjJKRE9OSkwybzJvUXY5c2xSSkF1bS9vaWdYeFd1WFd0dTZheU5k?=
 =?utf-8?B?eTY0TUNCL2kwQS9xSVFKUkhjd0tsVzBqUVRMY3JCd1Y0am5kY0pOckV4VmxH?=
 =?utf-8?B?a3ZkeCtPQVZsdzJ1SGhrS0I2M1BDQzQ5MVJlYk1XblIyWWV5V2JDbFQxZHlS?=
 =?utf-8?B?eSthdko3UmJ3UEdnc0tLSllxVUc0UUJmaVRlenljK05xTHc0NjNYNkRjaDZk?=
 =?utf-8?B?NnVXK09oaXdtNWs2RmM5M1NKSkdpR0pxbitXcEVGNU5HWUpsUCtxMThZc2Fi?=
 =?utf-8?B?WEFmSVVvNWdadjBDNkYzaytuenNXSVc4UkpsYUpMd1Q5US94Szg2T29wbklS?=
 =?utf-8?B?M01SdFoxcXAwTW1kMUZTUmR4L3ptcCtpak5YYk8rREkvR2VlbENiMk9RREE1?=
 =?utf-8?B?bml1cXA0U1l4WEtLWGtqdDRwazltOFA0VkFZQmJybVpSc21ROFNtQnM5N1g0?=
 =?utf-8?B?TWR4a0Y5SEcxY3BZajE5K3dRNEJsWERjTnB4VHdqNVJmRWdYRmtKWHk1dVZK?=
 =?utf-8?B?YllpV1h5SW1OZm9TbzdkaVo2cFBPM1Q0MjduV3Rpd3kzUWVSUGNtbEExMUlo?=
 =?utf-8?B?SG85SFdaaW9qY3UyM2pDbWRIOWl4Vk1oVzJUTlhoL0laV1YvRmdCRE1MMWpW?=
 =?utf-8?B?OE1kaENrbmIwYnBScC80TEwwb1ZxdUdIMEw4SUN1dFhjdVZoam15K09rbU9K?=
 =?utf-8?B?MFgyZE9WTVJhZ3lqTkExYlJtc2NCRFJ2a2ZiYzNPRFdlZnVBQlkvdGhCODJH?=
 =?utf-8?B?SVRsS3BCcHM0OVpLSzAzcWJWWHduQklIOGR2RVphTjcxQkhxd1FudU81cUNF?=
 =?utf-8?B?WE5SRHZaVGlHQ3hDVWp3clYwb1BwTkJzVk4wSWYzYXNMOExUSXFnVHRDRnc3?=
 =?utf-8?B?T3dUU3Q3a0R4cWpDK25ZZk1NS3kycVRreXJtVm8vK0hoa2FYb00rWUhyc2RT?=
 =?utf-8?B?L2RGL1lIQW9JTEdOY3BtbTBwUjdBQ0xxazlQZ2d1aFlUSUJCREppMDY1Smcv?=
 =?utf-8?B?WkZkQW9KVFBvQ1Q3N1A4T2E3Tk56SlJETFBmbm1DbGRIRlNTTFZYRy94WVJR?=
 =?utf-8?B?Z3hDSnhUTTFZZmJkTG1uRm9oanE2b2grMmNXQ1NDL21VeGRvcldYOTdMejhS?=
 =?utf-8?B?TU1rcG5ZV0dvT1dKQWNYUWxscHN5Q2ZsNVJ2c2lSSm9IMVQ5UkN0VVdUVXlI?=
 =?utf-8?B?V3VaQThVdEd2OVhFeTFwTFRyU3Y1YWhHSFNjUnZpcllFcGt4TWpGQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 242e09b4-95b9-460a-d95b-08de8a7f058e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:58:49.3472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nm+zvVcPwCbyw6kQBjFDrAp832L+UOkY2HzhOtIMem/u35kgrd/A/JPUNhJbxAHMaCkrtiHhIazPKl0wuetJeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB8032
X-purgate-ID: tlsNG-d25034/1774450733-F6EAB734-CD2B7F58/0/0
X-purgate-type: clean
X-purgate-size: 18677
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2742232753E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce extra logic to allow parsing ACPI tables extra early, and use it
to parse the ACPI SPCR table and obtain the serial configuration.

This is gated to the "acpi" device type being set in "com1" on the Xen
command line.  Note that there can only be one serial device described in
the SPCR, so limit it's usage to com1 exclusively for the time being.

I can't test the interrupt information parsing on my system, as the
interrupt is set to GSI with a value of 0xff, which is outside of the range
of GSIs available on the system.  I've also assumed that the interrupt
being 0xff is used to signal not interrupt setup (just like the Interrupt
Pin register on PCI headers).

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
WIP/RFC, not sure whether there's interest in attempting to pursue this
further on x86.  So far the device I have is also exposed on the PCI bus
aside from SPCR, so using com1=device=amt also works to detect it.

Posting it kind of early to know whether I should try to polish it for
submission or we are happy with not having this on x86.
---
 docs/misc/xen-command-line.pandoc |   8 +-
 xen/drivers/acpi/tables/tbutils.c | 131 +++++++++++++++----
 xen/drivers/char/ns16550.c        | 202 +++++++++++++++++++++++-------
 xen/include/acpi/actables.h       |   5 +
 xen/include/acpi/actbl2.h         |  10 ++
 5 files changed, 282 insertions(+), 74 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index ebdca007d26b..12e1965cfb60 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -349,7 +349,7 @@ ACPI indicating none to be there.
 
 ### com1 (x86)
 ### com2 (x86)
-> `= <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<port-bdf>][,[<bridge-bdf>]]]]]]`
+> `= <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt|acpi][,[<irq>|msi][,[<port-bdf>][,[<bridge-bdf>]]]]]]`
 
 Both option `com1` and `com2` follow the same format.
 
@@ -379,6 +379,8 @@ Both option `com1` and `com2` follow the same format.
   avoiding Intel AMT devices.
 * `amt` indicated that Xen should scan the PCI bus for the UART,
   including Intel AMT devices if present.
+* `acpi` indicates Xen should use ACPI information (from SPCR table) if present
+  to configure the serial console.  This option is only supported for com1.
 
 A typical setup for most situations might be `com1=115200,8n1`
 
@@ -403,9 +405,9 @@ The accepted name keywords for name=value pairs are:
 * `clock-hz`- accepts large integers to setup UART clock frequencies.
               Do note - these values are multiplied by 16.
 * `data-bits` - integer between 5 and 8
-* `dev` - accepted values are `pci` OR `amt`. If this option
+* `dev` - accepted values are `pci`, `amt` or `acpi`. If this option
           is used to specify if the serial device is pci-based. The io_base
-          cannot be specified when `dev=pci` or `dev=amt` is used.
+          cannot be specified when `dev=pci|amt|acpi` is used.
 * `io-base` - accepts integer which specified IO base port for UART registers
 * `irq` - IRQ number to use
 * `parity` - accepted values are same as positional parameters
diff --git a/xen/drivers/acpi/tables/tbutils.c b/xen/drivers/acpi/tables/tbutils.c
index 458989abea99..c5eb6b1fc523 100644
--- a/xen/drivers/acpi/tables/tbutils.c
+++ b/xen/drivers/acpi/tables/tbutils.c
@@ -341,39 +341,20 @@ acpi_tb_get_root_table_entry(u8 * table_entry,
 	}
 }
 
-/*******************************************************************************
- *
- * FUNCTION:    acpi_tb_parse_root_table
- *
- * PARAMETERS:  Rsdp                    - Pointer to the RSDP
- *              Flags                   - Flags
- *
- * RETURN:      Status
- *
- * DESCRIPTION: This function is called to parse the Root System Description
- *              Table (RSDT or XSDT)
- *
- * NOTE:        Tables are mapped (not copied) for efficiency. The FACS must
- *              be mapped and cannot be copied because it contains the actual
- *              memory location of the ACPI Global Lock.
- *
- ******************************************************************************/
-
-acpi_status __init
-acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags)
+static acpi_status __init
+acpi_tb_get_root_table(acpi_physical_address rsdp_address,
+	               struct acpi_table_header **out_table,
+		       unsigned int *entry_size)
 {
 	struct acpi_table_rsdp *rsdp;
 	acpi_native_uint table_entry_size;
-	acpi_native_uint i;
-	u32 table_count;
 	struct acpi_table_header *table;
 	acpi_physical_address address;
 	acpi_physical_address rsdt_address = 0;
 	u32 length;
-	u8 *table_entry;
 	acpi_status status;
 
-	ACPI_FUNCTION_TRACE(tb_parse_root_table);
+	ACPI_FUNCTION_TRACE(tb_get_root_table);
 
 	/*
 	 * Map the entire RSDP and extract the address of the RSDT or XSDT
@@ -454,6 +435,42 @@ acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags)
 		return_ACPI_STATUS(status);
 	}
 
+	*out_table = table;
+	*entry_size = table_entry_size;
+	return_ACPI_STATUS(AE_OK);
+}
+
+/*******************************************************************************
+ *
+ * FUNCTION:    acpi_tb_parse_root_table
+ *
+ * PARAMETERS:  Rsdp                    - Pointer to the RSDP
+ *              Flags                   - Flags
+ *
+ * RETURN:      Status
+ *
+ * DESCRIPTION: This function is called to parse the Root System Description
+ *              Table (RSDT or XSDT)
+ *
+ * NOTE:        Tables are mapped (not copied) for efficiency. The FACS must
+ *              be mapped and cannot be copied because it contains the actual
+ *              memory location of the ACPI Global Lock.
+ *
+ ******************************************************************************/
+
+acpi_status __init
+acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags)
+{
+	struct acpi_table_header *table;
+	unsigned int table_count, table_entry_size, i;
+	void *table_entry;
+	acpi_status status;
+
+	status = acpi_tb_get_root_table(rsdp_address, &table,
+	                                &table_entry_size);
+	if (!ACPI_SUCCESS(status))
+		  return_ACPI_STATUS(status);
+
 	/* Calculate the number of tables described in the root table */
 
 	table_count =
@@ -502,7 +519,7 @@ acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags)
 	 * It is not possible to map more than one entry in some environments,
 	 * so unmap the root table here before mapping other tables
 	 */
-	acpi_os_unmap_memory(table, length);
+	acpi_os_unmap_memory(table, table->length);
 
 	/*
 	 * Complete the initialization of the root table array by examining
@@ -523,3 +540,67 @@ acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags)
 
 	return_ACPI_STATUS(AE_OK);
 }
+
+acpi_status __init
+acpi_early_get_table(const char *signature, acpi_native_uint instance,
+                     struct acpi_table_header **out_table)
+{
+	static acpi_physical_address __initdata table_addr[128];
+	static unsigned int __initdata table_count;
+	static unsigned int __initdata table_entry_size;
+	unsigned int i;
+
+	ACPI_FUNCTION_TRACE(tb_early_get_table);
+
+	if (!table_count) {
+		struct acpi_table_header *table;
+		void *table_entry;
+		acpi_status status;
+		acpi_physical_address rsdp_address = acpi_os_get_root_pointer();
+
+		if (!rsdp_address)
+			return_ACPI_STATUS(AE_NOT_FOUND);
+
+		status = acpi_tb_get_root_table(rsdp_address, &table,
+			                        &table_entry_size);
+		if (!ACPI_SUCCESS(status))
+			return_ACPI_STATUS(status);
+
+		/* Calculate the number of tables described in the root table */
+		table_count = (table->length - sizeof(*table)) / table_entry_size;
+
+		if (table_count > ARRAY_SIZE(table_addr)) {
+			table_count = 0;
+			return_ACPI_STATUS(AE_NO_MEMORY);
+		}
+
+		table_entry = ACPI_CAST_PTR(uint8_t, table) + sizeof(*table);
+
+		for (i = 0; i < table_count; i++) {
+			table_addr[i] =
+			      acpi_tb_get_root_table_entry(table_entry,
+			                                   table_entry_size);
+			table_entry += table_entry_size;
+		}
+
+		acpi_os_unmap_memory(table, table->length);
+	}
+
+	for (i = 0; i < table_count; i++) {
+		struct acpi_table_header *header =
+		      acpi_os_map_memory(table_addr[i], sizeof(*header));
+
+		if (ACPI_COMPARE_NAME(header->signature, signature)) {
+			unsigned int len = header->length;
+
+			acpi_os_unmap_memory(header, sizeof(*header));
+			*out_table = acpi_os_map_memory(table_addr[i], len);
+
+			return_ACPI_STATUS(AE_OK);
+		}
+
+		acpi_os_unmap_memory(header, sizeof(*header));
+	}
+
+	return_ACPI_STATUS(AE_NOT_FOUND);
+}
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 9cd3e471bfa5..606dd404fd76 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1375,6 +1375,136 @@ static void enable_exar_enhanced_bits(const struct ns16550 *uart)
 
 #endif /* CONFIG_HAS_PCI */
 
+#ifdef CONFIG_ACPI
+#include <acpi/acpi.h>
+#include <acpi/actables.h>
+
+#include <xen/acpi.h>
+
+static int __init acpi_uart_config(struct ns16550 *uart, unsigned int idx)
+{
+    struct acpi_table_header *table;
+    struct acpi_table_spcr *spcr;
+    acpi_status status;
+    int rc = 0;
+
+    /*
+     * SPCR specifies a single port, expect it to be configured at position 0
+     * in the uart array.
+     */
+    if ( idx )
+        return -EXDEV;
+
+    if ( system_state <= SYS_STATE_early_boot )
+        status = acpi_early_get_table(ACPI_SIG_SPCR, 0, &table);
+    else
+        status = acpi_get_table(ACPI_SIG_SPCR, 0, &table);
+
+    if ( ACPI_FAILURE(status) )
+    {
+        printk(XENLOG_ERR "Failed to find or parse ACPI SPCR table\n");
+        return -ENODEV;
+    }
+
+    spcr = container_of(table, struct acpi_table_spcr, header);
+
+    rc = -EDOM;
+    if ( spcr->interface_type != ACPI_DBG2_16550_COMPATIBLE )
+    {
+        printk(XENLOG_ERR "Incompatible ACPI SPCR UART interface %u\n",
+               spcr->interface_type);
+        goto out;
+    }
+
+    if ( spcr->serial_port.space_id != ACPI_ADR_SPACE_SYSTEM_MEMORY &&
+         (IS_ENABLED(CONFIG_ARM) ||
+          spcr->serial_port.space_id != ACPI_ADR_SPACE_SYSTEM_IO) )
+    {
+        printk(XENLOG_ERR "Incompatible ACPI SPCR UART address space %u\n",
+               spcr->serial_port.space_id);
+        goto out;
+    }
+
+    if ( !spcr->serial_port.address )
+    {
+        printk(XENLOG_ERR "ACPI SPCR console redirection disabled\n");
+        goto out;
+    }
+
+    uart->io_base = spcr->serial_port.address;
+    uart->io_size = DIV_ROUND_UP(spcr->serial_port.bit_width, BITS_PER_BYTE);
+    uart->reg_shift = spcr->serial_port.bit_offset;
+
+    uart->parity = spcr->parity;
+    uart->stop_bits = spcr->stop_bits;
+    uart->data_bits = 8;
+
+    if ( uart->baud == BAUD_AUTO && spcr->baud_rate )
+    {
+        switch ( spcr->baud_rate )
+        {
+        case ACPI_SPCR_BAUD_9600:
+            uart->baud = 9600;
+            break;
+
+        case ACPI_SPCR_BAUD_19200:
+            uart->baud = 19200;
+            break;
+
+        case ACPI_SPCR_BAUD_57600:
+            uart->baud = 57600;
+            break;
+
+        case ACPI_SPCR_BAUD_115200:
+            uart->baud = 115200;
+            break;
+
+        default:
+            printk(XENLOG_WARNING
+                   "Ignoring invalid baud rate %u in ACPI SPCR\n",
+                   spcr->baud_rate);
+        }
+    }
+
+    if ( IS_ENABLED(CONFIG_X86) )
+    {
+        /* Use polling mode by default. */
+        uart->irq = 0;
+
+        if ( (spcr->interrupt_type & ACPI_SPCR_INTR_TYPE_IO_APIC) &&
+             spcr->interrupt < 0xff )
+            uart->irq = spcr->interrupt;
+        else if ( (spcr->interrupt_type & ACPI_SPCR_INTR_TYPE_PC_AT) &&
+                  ((spcr->pc_interrupt >=  2 && spcr->pc_interrupt <=  7) ||
+                   (spcr->pc_interrupt >=  9 && spcr->pc_interrupt <= 12) ||
+                   (spcr->pc_interrupt >= 14 && spcr->pc_interrupt <= 15)) )
+            uart->irq = spcr->pc_interrupt;
+    }
+
+#ifdef CONFIG_ARM
+    /* The trigger/polarity information is not available in spcr. */
+    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    uart->irq = spcr->interrupt;
+#endif /* CONFIG_ARM */
+
+#ifdef CONFIG_HAS_PCI
+    if ( spcr->pci_device_id != 0xffff && spcr->pci_vendor_id != 0xffff )
+    {
+        uart->ps_bdf_enable = true;
+        uart->pci_device = PCI_SBDF(spcr->pci_segment, spcr->pci_bus,
+                                    spcr->pci_device, spcr->pci_function);
+    }
+#endif /* CONFIG_HAS_PCI */
+
+    rc = 0;
+
+ out:
+    if ( system_state <= SYS_STATE_early_boot )
+        acpi_os_unmap_memory(&spcr, spcr->header.length);
+    return rc;
+}
+#endif /* CONFIG_ACPI */
+
 /*
  * Configure serial port with a string:
  *   <baud>[/<base_baud>][,DPS[,<io-base>[,<irq>[,<port-bdf>[,<bridge-bdf>]]]]].
@@ -1539,6 +1669,15 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
             conf += 3;
         }
         else
+#endif
+#ifdef CONFIG_ACPI
+        if ( strncmp(conf, "acpi", 4) == 0 )
+        {
+            if ( acpi_uart_config(uart, uart - ns16550_com) )
+                return true;
+            conf += 4;
+        }
+        else
 #endif
         {
             uart->io_base = simple_strtoull(conf, &conf, 0);
@@ -1643,8 +1782,17 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
             uart->reg_width = simple_strtoul(param_value, NULL, 0);
             break;
 
-#ifdef CONFIG_HAS_PCI
         case device:
+#ifdef CONFIG_ACPI
+            if ( strncmp(param_value, "acpi", 3) == 0 )
+            {
+                acpi_uart_config(uart, uart - ns16550_com);
+                dev_set = true;
+                break;
+            }
+            else
+#endif /* CONFIG_ACPI */
+#ifdef CONFIG_HAS_PCI
             if ( strncmp(param_value, "pci", 3) == 0 )
             {
                 pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com);
@@ -1656,9 +1804,11 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
                 dev_set = true;
             }
             else
+#endif /* CONFIG_HAS_PCI */
                 PARSE_ERR_RET("Unknown device type %s\n", param_value);
             break;
 
+#if CONFIG_HAS_PCI
         case port_bdf:
         {
             unsigned int b, d, f;
@@ -1680,7 +1830,7 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
             uart->pb_bdf_enable = true;
             break;
         }
-#endif
+#endif /* CONFIG_HAS_PCI */
 
         default:
             PARSE_ERR_RET("Invalid parameter: %s\n", token);
@@ -1845,8 +1995,6 @@ DT_DEVICE_END
 #endif /* HAS_DEVICE_TREE_DISCOVERY */
 
 #if defined(CONFIG_ACPI) && defined(CONFIG_ARM)
-#include <xen/acpi.h>
-
 static int __init ns16550_acpi_uart_init(const void *data)
 {
     struct acpi_table_header *table;
@@ -1857,51 +2005,13 @@ static int __init ns16550_acpi_uart_init(const void *data)
      * Only support one UART on ARM which happen to be ns16550_com[0].
      */
     struct ns16550 *uart = &ns16550_com[0];
-
-    status = acpi_get_table(ACPI_SIG_SPCR, 0, &table);
-    if ( ACPI_FAILURE(status) )
-    {
-        printk("ns16550: Failed to get SPCR table\n");
-        return -EINVAL;
-    }
-
-    spcr = container_of(table, struct acpi_table_spcr, header);
-
-    if ( unlikely(spcr->serial_port.space_id != ACPI_ADR_SPACE_SYSTEM_MEMORY) )
-    {
-        printk("ns16550: Address space type is not mmio\n");
-        return -EINVAL;
-    }
-
-    /*
-     * The serial port address may be 0 for example
-     * if the console redirection is disabled.
-     */
-    if ( unlikely(!spcr->serial_port.address) )
-    {
-        printk("ns16550: Console redirection is disabled\n");
-        return -EINVAL;
-    }
+    int rc;
 
     ns16550_init_common(uart);
 
-    /*
-     * The baud rate is pre-configured by the firmware.
-     * And currently the ACPI part is only targeting ARM so the flow_control
-     * field and all PCI related ones which we do not care yet are ignored.
-     */
-    uart->baud = BAUD_AUTO;
-    uart->data_bits = 8;
-    uart->parity = spcr->parity;
-    uart->stop_bits = spcr->stop_bits;
-    uart->io_base = spcr->serial_port.address;
-    uart->io_size = DIV_ROUND_UP(spcr->serial_port.bit_width, BITS_PER_BYTE);
-    uart->reg_shift = spcr->serial_port.bit_offset;
-    uart->reg_width = spcr->serial_port.access_width;
-
-    /* The trigger/polarity information is not available in spcr. */
-    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
-    uart->irq = spcr->interrupt;
+    rc = acpi_uart_config(uart, 0);
+    if ( rc )
+        return rc;
 
     uart->vuart.base_addr = uart->io_base;
     uart->vuart.size = uart->io_size;
diff --git a/xen/include/acpi/actables.h b/xen/include/acpi/actables.h
index 527e1c9f9b9d..afb808998825 100644
--- a/xen/include/acpi/actables.h
+++ b/xen/include/acpi/actables.h
@@ -104,4 +104,9 @@ acpi_tb_install_table(acpi_physical_address address,
 acpi_status
 acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags);
 
+/* Get a table early, before acpi_tb_parse_root_table() is called. */
+acpi_status
+acpi_early_get_table(const char *signature, acpi_native_uint instance,
+                     struct acpi_table_header **out_table);
+
 #endif				/* __ACTABLES_H__ */
diff --git a/xen/include/acpi/actbl2.h b/xen/include/acpi/actbl2.h
index ee96e990d636..923c784e8bd5 100644
--- a/xen/include/acpi/actbl2.h
+++ b/xen/include/acpi/actbl2.h
@@ -1037,6 +1037,16 @@ struct acpi_table_spcr {
 
 #define ACPI_SPCR_DO_NOT_DISABLE    (1)
 
+/* Masks for interrupt_type field above */
+#define ACPI_SPCR_INTR_TYPE_PC_AT   0x01
+#define ACPI_SPCR_INTR_TYPE_IO_APIC 0x02
+
+/* Values for the baud_rate field above */
+#define ACPI_SPCR_BAUD_9600         3
+#define ACPI_SPCR_BAUD_19200        4
+#define ACPI_SPCR_BAUD_57600        5
+#define ACPI_SPCR_BAUD_115200       7
+
 /*******************************************************************************
  *
  * SPMI - Server Platform Management Interface table
-- 
2.51.0


