Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIFOHGiMxmlELgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 14:55:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCCA345A6A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 14:55:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265694.1556518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w67ev-0005eu-4k; Fri, 27 Mar 2026 13:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265694.1556518; Fri, 27 Mar 2026 13:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w67ev-0005cr-11; Fri, 27 Mar 2026 13:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1265694;
 Fri, 27 Mar 2026 13:55:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w67eu-0005bl-4n
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 13:55:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w67et-008VBd-Gw
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 14:55:31 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c68c51-e002-0a2a0a5209dd-0a2a4503b4f6-6
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 14:55:31 +0100
Received: from [40.93.196.8]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c68c51-1947-0a2a45030019-285dc408d95a-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 14:55:31 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5370.namprd03.prod.outlook.com (2603:10b6:5:249::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 13:55:28 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 13:55:28 +0000
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
 b=T3n4JlecW2F3zyvlT/XP74gJIAK8atAb0lHE9Y+gNVjX9sSyIjlGX0igSCvU4a92s1OmTFi6q9uA7xXrqjPzjPBdd30oU2boGi6rZU7rU1XaMjV3aI78En64UvWpZm63/6uBWFLYKFqFakiV4gBZEhGRqvjWjrBn1v1a7RD8/enGvAxOmA5aylGKik+LtZEK0Mirrx4FKQCJy0bQbmg2te2q7Wcha1DHjKgAWeUIKWYH2jdayaxgyipttcIm9OD0sTx9gc4q0hnP6w8muDFD1AWd165DU3I+q9xtlBzbnVhdF0etgKYhTHzizfKake6dUAto5lkmY/UKyq4dMKFNpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/hgFVUOUeEuadjSINl4NrZjcrgOSJUIv+5SLjSBL9c=;
 b=ezVvAKDYe9BJShI1yE3lnRVBvr+AIMLGjzbEEspbLbI/NyLVu+jHARH5ub6pV1hqTbdJX210nGyRvcicB3ZvDkHfNVyaBRdmGXZ099/Z++eNdE1bRt8Pl00uGUt5tb2U+t8BxyCx+KLkzcYkH/NwCQzeSpGlRuDrMGgEHYlgJSHt9VaiklJWFPgp93vLukUWmaHkJ3hFyJSMpe1RM3PXbMV1kvICd7MGJmi+oqVxIKqmXL8Sd2Gawjbg/qLTkS3c5XlhKL69PwmllK/uBzV2M89+j16tosUICHQqZL4ym7VB8ijYK8O/VW/UsaNR062l1csHipnkD8hgUh6pjOFLNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/hgFVUOUeEuadjSINl4NrZjcrgOSJUIv+5SLjSBL9c=;
 b=SBD+BtjOBGOHAMSpx0MbGZUwS3RzEAy5K2OQh7ODqIuyUUy0AECF2ZneqXMO6BCLMY1G7n/kLlu8lzPE4YEVXZAqyYCp+20KfvZ9w6T4AkBiKjtitIKeYUAQcDnLPwcwkkAGlyOrQUcQ9RfweNKgfdhfEXFJ7C9dO4amWpXIx8I=
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
Subject: [PATCH v2 3/3] xen/uart: switch ns16550 to use pci_sbdf_t
Date: Fri, 27 Mar 2026 14:54:20 +0100
Message-ID: <20260327135420.7246-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260327135420.7246-1-roger.pau@citrix.com>
References: <20260327135420.7246-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0056.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5370:EE_
X-MS-Office365-Filtering-Correlation-Id: 869f2f13-ce33-46d1-ce29-08de8c0880cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7Krex+70GzXMm1jfwAUdiiIyWYecHmYnbOI6sgYd7yayzmnSoFuV3H4EVi0AJDhspiVBkOQkk29/Ln1cLEmpJp8VHp6KgrKsKF8Bdm10IVJILOzGV6Uof+OT+Io0LYaRScXX0d2TsFulAhvjfB34LSnMSQR4wE79xOgAIjqmzm5UO8tJKS4M7d6y5Zmy7/GlYKtSgYKeQKbYdRj9eW9fXThxfOdWE1I16WOzlf/Vt64EtdPlh6NZMsN5Kuook/KePISXEnfmx5x4na+i1Hm1Ku5YYuG3bP7O/AaTskbhyNrO1hSNorz9fxDdFqjUU/tP1hd9XLP3ExRz1eKDyZCaDhWJamfllHd/sKEui2m8Xk9Nmk8WKbU2TSOpng/O8ww0W56ZRASMzds3Mo4/iYZHLb9vrWjYzRvVvNCG9gLD2HNp9PJLJZ9d3Qz8+dPAUxvp/0ps8dRsCWmqnjAOaOjSbF+szGZ4i9OeNqVSD9zdYoRBsmyB8jJr4Zy/dn2jdqxRD8zKpryJWcI2C9/hNi8F6yPIVQkn2Y3UW2sa42BfqVFRneCVUMYy1CLF/THz9F+jlcSkkuSfD65/cYucqpUHshLWsLj42T1PviLHFGyySVjplwL0c8MXnRNR8wabcmaWNl4AISZ849FQoFzrfwthllAKVrPcgrhXXJTF5b9+3+BXfzG8hSWdIEgNbVNw3JB0XCa8O+4FyboR69+C498sZZdOmzeiD0rm4Gjw+7So8D8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWVVK1ZkWndLYkhEQzc3b2Nac1ZvZVNrNmwrdWZqU3hjc3dsNDdvODIzOWJO?=
 =?utf-8?B?YTM3aFM4QzdJV2poWlV1SlRWdVJXZmp0Z0lkWGlIdkJFZ2x3eE5WUytXZlJ3?=
 =?utf-8?B?VVJpZ3UwbXJJNDIxTVprUGZuUlZ0OW50enc5ZExEYmRQcXhVL2wyZnEydVVJ?=
 =?utf-8?B?bWVONzdiSGpBdWRnVWhMQnphZ3JvQUw2MGNmemgzMFFXODlpazdsZXNxTUx1?=
 =?utf-8?B?TzlsaHEyR3dKcmxRQjBKVUJ4YW4xWmpyVkhtRVduc0hlVkxNRWFFbU9ueWNa?=
 =?utf-8?B?RThSUThxNy9jV1FBdGdXODIrTmtCVzhOQXRsUDVVS0ZvUStHRTNtZklLOC9v?=
 =?utf-8?B?MHA1YmdHTTFlUitLTERXc0NyMmtWVkdEczFHT2E0eUhLemZ1ZnlWeE1xMFBV?=
 =?utf-8?B?U0NKNUFwVzM3dkZoZDZSNUNpWDZVcWE0d1o1VU5zM0FaOWRBb3VETkY2SkpS?=
 =?utf-8?B?Q0MvN1A3eHhhSHNTTnUxMzV6MGtnMXErbGZtRFZyV2hqRDZCVVcrNFNDWVNJ?=
 =?utf-8?B?b2JMYnRDVGZlb2ZwNVNmYXhDbjFsV29mdVdnaXphb2k5d3F4a3JGL2tkdFRJ?=
 =?utf-8?B?a0xZV2dObysrY0tjaXdyK1Jjc20wQVphSGt0dVJJeUp4cVhnN0NCdjFtdmN0?=
 =?utf-8?B?ZVBKNHZJYUFqbE1aSUJZMWljUmR3QVBwbjBHKzlYYm9lV1RLR3V3RU1JZng4?=
 =?utf-8?B?UXZiZnJGTTNnT0pyaUpSYlFvUkU3SldINnlVUzNlNFVubUVndm42UGJsRUpJ?=
 =?utf-8?B?K2FMNlBrblZ4WmFaM1p4aHdCdEh2UXZiaDd1OElXOFM5bUNzSkxCVld0UWlD?=
 =?utf-8?B?SmdiOGNnMUtvQUhVRkprYXdFUzlSSWoxOFpOWE5iclpsRFhzRGRLaDlwVlZn?=
 =?utf-8?B?ODJVU1AyVytMMyswVVpubXFQd1cxaER2dTEzT2FwY3RzYjJpakxnanRCNm9p?=
 =?utf-8?B?akdEd1VYSnlQc2ZqdDgxMzRWaTJ6aldWTmR1clhwaWphVmJ4djBvRXBHSW1a?=
 =?utf-8?B?Qk53Uitob29kTHMrZndwQzZ2QXdFUkxCb2hNOHpYbEJHTk9QcCtKYllQV2N3?=
 =?utf-8?B?ZEJFK0lORG1TWUNmNHRtUmVteXV2M2N6RnUzekMxTm8rdzRvempaMzBtK0V6?=
 =?utf-8?B?TDhmaGJzYlVJL2Rtb1cvdzVudDV6alZ5bi9JWEdlS2pRWVRjVFVSM0Fmdm5u?=
 =?utf-8?B?L1krTmV5aHB6VGhoTXdnZExUeTVuYUVVUGczZWdyU0laUnRkUitRc0tCTTU0?=
 =?utf-8?B?VlNxcjhFb1kxLy9zRXcyRHEvbEpGSVYwZVdKQWdHM1pORldOOTdEaXhnM0RU?=
 =?utf-8?B?TWJXUnJ1K2lOWWxTVG1HYS8yY3VYbWt2TTF0dTZieWY4YURTTm1KUTBUSlk5?=
 =?utf-8?B?Mmk3MjF4TVNQS1hxeEZzMCtmaU93NzR3SUpvTSs2TGZ2NDVQcEZoS0orSnQy?=
 =?utf-8?B?aDYyci80bEFEMENRMG50ZXd0MnhUWVlhdlkrWEtvVGJMS2ovTWpOZGtzSmJj?=
 =?utf-8?B?M0VyNkh5b04rdkd3K3RHV2tMWjNVRzZ3OHdkWXJBTHpzZmtMS3ZwV1NvVyt2?=
 =?utf-8?B?RlpLaWI0UXIvRkFGQjloTU1zaVZqcTgvQzZZYXFNOEljb0gvWkNXbFlVMkpN?=
 =?utf-8?B?RDhuQmZDZWpOYm1DL0JrSkpyWFphYTl1WmoyUmJVVVRabDdPNGFpS0FVVkcv?=
 =?utf-8?B?cVZuZGdoZFYzUVBrZWFGdGRpNFV4ZmlqcnRoVXZKUzgrU1FZeTFnTmdlTWFJ?=
 =?utf-8?B?ZEd2Vk55b2NTQXZCb2dnMXNjQ1lyc1BVeTZhL1NuUXNvaVpJMThyY3BtMndY?=
 =?utf-8?B?VTNXNFBZbkx4RFdBVStMMTJvKzk1MVlHRFhHMDNaZUN2S083Z1YzL2RaRFJr?=
 =?utf-8?B?dW91YWhxRVF3cFZSTzJlOXdVU2ZCQ1B5QmsyMk9XbHVFcndjSlNtQjYvZHF4?=
 =?utf-8?B?UHFHZ29tN0JCRndlRXlSUzlVakpRN01MblYxNmUzVGdnSWhwRm5xZlJhOURx?=
 =?utf-8?B?dnJEMXVhcWpVakxublJoMWN4TmY3dkdqNklIZ1I4d1N3ZGtIbi9vcDBMNlpV?=
 =?utf-8?B?cHMvVmxJclZWektjb1QrSVh3RlN3dnRyT2FBZzNPaEFvYVFUS0xsQytHUUJH?=
 =?utf-8?B?SGRVSDl4aGI5Z1ZCb1lhOFJLZ1Vqd2dPTXQ4VEJOdnNpK3JoTEhUSTR0TmhU?=
 =?utf-8?B?UTkxeXZ6VUYyVllJK1dXWGRYcVN3dnd6WjNMN0lzRW9tSHpsVDVtNTBNcEtS?=
 =?utf-8?B?QnhQL1BwVFFnTFpaVWtNdXRBZU9ldTY2K0EvQ0xvUTZGdHJtR3dZaGptRWVw?=
 =?utf-8?B?Rk9GUDc2cGJhd3dWUDNhWWYyd0NGRWE4YllFR0VDYngvU1lBNUxzZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869f2f13-ce33-46d1-ce29-08de8c0880cb
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 13:55:28.3085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKobCBEQCTVNgKuKGkrgN7vZrsKAmqoARcAwDT74ch4fNTgP8FjvR8BFrtvMAJJOvYs1U1STkTk+fH4bsrOCUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5370
X-purgate-ID: tlsNG-33051d/1774619731-EB88A72C-36E9BB14/0/0
X-purgate-type: clean
X-purgate-size: 13801
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
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
X-Rspamd-Queue-Id: AFCCA345A6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Not committing this ahead of the bugfixes, as to make those easier to
backport.
---
 xen/drivers/char/ns16550.c | 133 ++++++++++++++++---------------------
 1 file changed, 58 insertions(+), 75 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index d16e447c0e76..0d780d82f918 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -67,8 +67,8 @@ static struct ns16550 {
     /* PCI card parameters. */
     bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
     bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */
-    unsigned int pb_bdf[3]; /* pci bridge BDF */
-    unsigned int ps_bdf[3]; /* pci serial port BDF */
+    pci_sbdf_t pci_bridge;
+    pci_sbdf_t pci_device;
     u32 bar;
     u32 bar64;
     u16 cr;
@@ -288,31 +288,22 @@ static void pci_serial_early_init(struct ns16550 *uart)
     if ( !uart->ps_bdf_enable )
         return;
 
-    cmd = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                  uart->ps_bdf[2]), PCI_COMMAND);
+    cmd = pci_conf_read16(uart->pci_device, PCI_COMMAND);
 
     if ( uart->io_base >= 0x10000 )
     {
-        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                  uart->ps_bdf[2]),
-                         PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
+        pci_conf_write16(uart->pci_device, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
         return;
     }
 
     if ( uart->pb_bdf_enable )
-        pci_conf_write16(PCI_SBDF(0, uart->pb_bdf[0], uart->pb_bdf[1],
-                                  uart->pb_bdf[2]),
-                         PCI_IO_BASE,
+        pci_conf_write16(uart->pci_bridge, PCI_IO_BASE,
                          (uart->io_base & 0xF000) |
                          ((uart->io_base & 0xF000) >> 8));
 
-    pci_conf_write32(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                              uart->ps_bdf[2]),
-                     PCI_BASE_ADDRESS_0,
+    pci_conf_write32(uart->pci_device, PCI_BASE_ADDRESS_0,
                      uart->io_base | PCI_BASE_ADDRESS_SPACE_IO);
-    pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                              uart->ps_bdf[2]),
-                     PCI_COMMAND, cmd | PCI_COMMAND_IO);
+    pci_conf_write16(uart->pci_device, PCI_COMMAND, cmd | PCI_COMMAND_IO);
 #endif
 }
 
@@ -452,17 +443,16 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
                                 PFN_UP(uart->io_base + uart->io_size) - 1) )
             printk(XENLOG_INFO "Error while adding MMIO range of device to mmio_ro_ranges\n");
 
-        if ( pci_ro_device(0, uart->ps_bdf[0],
-                           PCI_DEVFN(uart->ps_bdf[1], uart->ps_bdf[2])) )
-            printk(XENLOG_INFO "Could not mark config space of %02x:%02x.%u read-only.\n",
-                   uart->ps_bdf[0], uart->ps_bdf[1],
-                   uart->ps_bdf[2]);
+        if ( pci_ro_device(uart->pci_device.seg, uart->pci_device.bus,
+                           uart->pci_device.devfn) )
+            printk(XENLOG_INFO
+                   "Could not mark config space of %pp read-only.\n",
+                   &uart->pci_device);
 
         if ( uart->msi )
         {
             struct msi_info msi = {
-                .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                 uart->ps_bdf[2]),
+                .sbdf = uart->pci_device,
                 .irq = uart->irq,
                 .entry_nr = 1
             };
@@ -504,9 +494,8 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
             }
 
             if ( rc )
-                printk(XENLOG_WARNING
-                       "MSI setup failed (%d) for %02x:%02x.%o\n",
-                       rc, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]);
+                printk(XENLOG_WARNING "MSI setup failed (%d) for %pp\n",
+                       rc, &uart->pci_device);
         }
     }
 #endif
@@ -533,8 +522,7 @@ static void cf_check ns16550_suspend(struct serial_port *port)
 
 #ifdef NS16550_PCI
     if ( uart->bar )
-       uart->cr = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                  uart->ps_bdf[2]), PCI_COMMAND);
+       uart->cr = pci_conf_read16(uart->pci_device, PCI_COMMAND);
 #endif
 }
 
@@ -545,19 +533,15 @@ static void _ns16550_resume(struct serial_port *port)
 
     if ( uart->bar )
     {
-       pci_conf_write32(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                 uart->ps_bdf[2]),
+       pci_conf_write32(uart->pci_device,
                         PCI_BASE_ADDRESS_0 + uart->bar_idx*4, uart->bar);
 
         /* If 64 bit BAR, write higher 32 bits to BAR+4 */
         if ( uart->bar & PCI_BASE_ADDRESS_MEM_TYPE_64 )
-            pci_conf_write32(PCI_SBDF(0, uart->ps_bdf[0],  uart->ps_bdf[1],
-                                      uart->ps_bdf[2]),
+            pci_conf_write32(uart->pci_device,
                         PCI_BASE_ADDRESS_0 + (uart->bar_idx+1)*4, uart->bar64);
 
-       pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                 uart->ps_bdf[2]),
-                        PCI_COMMAND, uart->cr);
+       pci_conf_write16(uart->pci_device, PCI_COMMAND, uart->cr);
     }
 #endif
 
@@ -1217,13 +1201,12 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 uint32_t bar, bar_64 = 0, len, len_64;
                 u64 size = 0;
                 const struct ns16550_config_param *param = uart_param;
+                pci_sbdf_t sbdf = PCI_SBDF(0, b, d, f);
 
-                nextf = (f || (pci_conf_read16(PCI_SBDF(0, b, d, f),
-                                               PCI_HEADER_TYPE) &
+                nextf = (f || (pci_conf_read16(sbdf, PCI_HEADER_TYPE) &
                                0x80)) ? f + 1 : 8;
 
-                switch ( pci_conf_read16(PCI_SBDF(0, b, d, f),
-                                         PCI_CLASS_DEVICE) )
+                switch ( pci_conf_read16(sbdf, PCI_CLASS_DEVICE) )
                 {
                 case 0x0700: /* single port serial */
                 case 0x0702: /* multi port serial */
@@ -1240,10 +1223,8 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 /* Check for params in uart_config lookup table */
                 for ( i = 0; i < ARRAY_SIZE(uart_config); i++ )
                 {
-                    u16 vendor = pci_conf_read16(PCI_SBDF(0, b, d, f),
-                                                 PCI_VENDOR_ID);
-                    u16 device = pci_conf_read16(PCI_SBDF(0, b, d, f),
-                                                 PCI_DEVICE_ID);
+                    u16 vendor = pci_conf_read16(sbdf, PCI_VENDOR_ID);
+                    u16 device = pci_conf_read16(sbdf, PCI_DEVICE_ID);
 
                     if ( uart_config[i].vendor_id == vendor &&
                          uart_config[i].dev_id == device )
@@ -1266,29 +1247,26 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 }
 
                 uart->io_base = 0;
-                bar = pci_conf_read32(PCI_SBDF(0, b, d, f),
-                                      PCI_BASE_ADDRESS_0 + bar_idx * 4);
+                bar = pci_conf_read32(sbdf, PCI_BASE_ADDRESS_0 + bar_idx * 4);
 
                 /* MMIO based */
                 if ( param->mmio && !(bar & PCI_BASE_ADDRESS_SPACE_IO) )
                 {
-                    pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                     PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
-                    len = pci_conf_read32(PCI_SBDF(0, b, d, f),
+                    pci_conf_write32(sbdf, PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
+                    len = pci_conf_read32(sbdf,
                                           PCI_BASE_ADDRESS_0 + bar_idx * 4);
-                    pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                     PCI_BASE_ADDRESS_0 + bar_idx*4, bar);
+                    pci_conf_write32(sbdf, PCI_BASE_ADDRESS_0 + bar_idx*4, bar);
 
                     /* Handle 64 bit BAR if found */
                     if ( bar & PCI_BASE_ADDRESS_MEM_TYPE_64 )
                     {
-                        bar_64 = pci_conf_read32(PCI_SBDF(0, b, d, f),
+                        bar_64 = pci_conf_read32(sbdf,
                                       PCI_BASE_ADDRESS_0 + (bar_idx + 1) * 4);
-                        pci_conf_write32(PCI_SBDF(0, b, d, f),
+                        pci_conf_write32(sbdf,
                                     PCI_BASE_ADDRESS_0 + (bar_idx+1)*4, ~0u);
-                        len_64 = pci_conf_read32(PCI_SBDF(0, b, d, f),
+                        len_64 = pci_conf_read32(sbdf,
                                     PCI_BASE_ADDRESS_0 + (bar_idx + 1) * 4);
-                        pci_conf_write32(PCI_SBDF(0, b, d, f),
+                        pci_conf_write32(sbdf,
                                     PCI_BASE_ADDRESS_0 + (bar_idx+1)*4, bar_64);
                         size  = ((u64)~0 << 32) | PCI_BASE_ADDRESS_MEM_MASK;
                         size &= ((u64)len_64 << 32) | len;
@@ -1302,12 +1280,9 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 /* IO based */
                 else if ( !param->mmio && (bar & PCI_BASE_ADDRESS_SPACE_IO) )
                 {
-                    pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                     PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
-                    len = pci_conf_read32(PCI_SBDF(0, b, d, f),
-                                          PCI_BASE_ADDRESS_0);
-                    pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                     PCI_BASE_ADDRESS_0 + bar_idx*4, bar);
+                    pci_conf_write32(sbdf, PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
+                    len = pci_conf_read32(sbdf, PCI_BASE_ADDRESS_0);
+                    pci_conf_write32(sbdf, PCI_BASE_ADDRESS_0 + bar_idx*4, bar);
                     size = len & PCI_BASE_ADDRESS_IO_MASK;
 
                     uart->io_base = bar & ~PCI_BASE_ADDRESS_SPACE_IO;
@@ -1341,18 +1316,14 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                     uart->fifo_size = param->fifo_size;
 
                 uart->ps_bdf_enable = true;
-                uart->ps_bdf[0] = b;
-                uart->ps_bdf[1] = d;
-                uart->ps_bdf[2] = f;
+                uart->pci_device = sbdf;
                 uart->bar_idx = bar_idx;
                 uart->bar = bar;
                 uart->bar64 = bar_64;
                 uart->io_size = max(8U << param->reg_shift,
                                     param->uart_offset);
-                uart->irq = pci_conf_read8(PCI_SBDF(0, b, d, f),
-                                           PCI_INTERRUPT_PIN) ?
-                            pci_conf_read8(PCI_SBDF(0, b, d, f),
-                                           PCI_INTERRUPT_LINE) : 0;
+                uart->irq = pci_conf_read8(sbdf, PCI_INTERRUPT_PIN) ?
+                            pci_conf_read8(sbdf, PCI_INTERRUPT_LINE) : 0;
 
 #ifdef CONFIG_X86
                 /*
@@ -1591,18 +1562,22 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
 #ifdef CONFIG_HAS_PCI
     if ( *conf == ',' && *++conf != ',' )
     {
-        conf = parse_pci(conf, NULL, &uart->ps_bdf[0],
-                         &uart->ps_bdf[1], &uart->ps_bdf[2]);
+        unsigned int b, d, f;
+
+        conf = parse_pci(conf, NULL, &b, &d, &f);
         if ( !conf )
             PARSE_ERR_RET("Bad port PCI coordinates");
+        uart->pci_device = PCI_SBDF(0, b, d, f);
         uart->ps_bdf_enable = true;
     }
 
     if ( *conf == ',' && *++conf != ',' )
     {
-        if ( !parse_pci(conf, NULL, &uart->pb_bdf[0],
-                        &uart->pb_bdf[1], &uart->pb_bdf[2]) )
+        unsigned int b, d, f;
+
+        if ( !parse_pci(conf, NULL, &b, &d, &f) )
             PARSE_ERR_RET("Bad bridge PCI coordinates");
+        uart->pci_bridge = PCI_SBDF(0, b, d, f);
         uart->pb_bdf_enable = true;
     }
 #endif
@@ -1685,18 +1660,26 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
             break;
 
         case port_bdf:
-            if ( !parse_pci(param_value, NULL, &uart->ps_bdf[0],
-                            &uart->ps_bdf[1], &uart->ps_bdf[2]) )
+        {
+            unsigned int b, d, f;
+
+            if ( !parse_pci(param_value, NULL, &b, &d, &f) )
                 PARSE_ERR_RET("Bad port PCI coordinates\n");
+            uart->pci_device = PCI_SBDF(0, b, d, f);
             uart->ps_bdf_enable = true;
             break;
+        }
 
         case bridge_bdf:
-            if ( !parse_pci(param_value, NULL, &uart->pb_bdf[0],
-                            &uart->pb_bdf[1], &uart->pb_bdf[2]) )
+        {
+            unsigned int b, d, f;
+
+            if ( !parse_pci(param_value, NULL, &b, &d, &f) )
                 PARSE_ERR_RET("Bad bridge PCI coordinates\n");
+            uart->pci_bridge = PCI_SBDF(0, b, d, f);
             uart->pb_bdf_enable = true;
             break;
+        }
 #endif
 
         default:
-- 
2.51.0


