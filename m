Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDs8FTnjqmkTYAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 15:22:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD63A2228DE
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 15:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247796.1546234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyW3r-0002Ae-Kw; Fri, 06 Mar 2026 14:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247796.1546234; Fri, 06 Mar 2026 14:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyW3r-00028X-I3; Fri, 06 Mar 2026 14:21:51 +0000
Received: by outflank-mailman (input) for mailman id 1247796;
 Fri, 06 Mar 2026 14:21:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vyW3q-00028M-ER
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 14:21:50 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9537522a-1967-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 15:20:10 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA3PR03MB8456.namprd03.prod.outlook.com (2603:10b6:208:53c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 14:20:07 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 14:20:07 +0000
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
X-Inumbo-ID: 9537522a-1967-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyDyyH3UZz3LLNqtdQFrTZGfKRQSQPYdRjWToHF/2ILjBPrB4NQFkbLkuoU1UmKG7Ln4oFqDEC/ELmBXLR+n2vRsAwLhIKoSiov9U9MkzxiEfwCSUD52HmryQKCLKTKhcLuEH4xPviAS6UZltxtUWXgcotujLwmcaBofoEuSn7kV1EaeomJrnWxA/Hc8caHPvioTz8L4tf28E87gbxAVWtLVS9OrqYMOqLLBJhuFR47rgZtl2q8ApEZ08K5FfUtLuqqXbQN/maPF2xdeDHmRmQkwAqxKmJozSNmj9QjxmY/a+zI5Bvg2l1mJJ6mPFqerfCyYVkqdkYtkq0w8NFmRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EU4qSkvZhAQNhEkyrOIgureEUnebpHF+nXMaNnoQdY=;
 b=VGKs6eNGrOu8ffdBin/J65Yms4uy6/d2P5NySTXzcUdrF0IgSTVqzlq24o/cjiX4i8A9Ho9Wdy4oECFUOAna+oJ2xRcBMk6vC7zRIz41Xu9Kd4cJweBUCeqQvg12GypIKn7AaakfsPUYkP4VW3o7aWmGXKZOQl8zc7sp/N0dwQCxolrFlqrC3qMR6nX2ihWQtQDXitRZ84bkWueidrMyvoUFH8j8hX1eegw8MOEZB9vrUBVvp/0zz8P3Usr+a3lmVNFTseUQqE7+UnlWYdIaI+tzTn50Cf2pJKyFZzUfSzSAs7HFi1WU4J+Ipeq32wX3weLvKcRNu6loaovkimczPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EU4qSkvZhAQNhEkyrOIgureEUnebpHF+nXMaNnoQdY=;
 b=MJcHjJ5+Q0vXTSUPZ1sW4Sm0I8WsWZud2Btk95KDAByUIxJZNnn9r6EidjJwy8IEADNJTyLD9plKrnkAyI55viygdfhPBLTjA3TT1lAd3QZo/OESVdyzavYHP8A4BECvSAqYk8P7mKCYckKB4luW5q8uhy/Nmikc3pNHOJtj2yA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Mar 2026 15:20:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] core-parking: shrink and relocate core_parking_cpunum[]
Message-ID: <aarik2Zlgxc6-Ffp@macbook.local>
References: <af03f611-ef38-49d0-ac7b-4bad39db46c1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <af03f611-ef38-49d0-ac7b-4bad39db46c1@suse.com>
X-ClientProxiedBy: MR1P264CA0206.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA3PR03MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: b344f33b-43f2-47ab-7077-08de7b8b77a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	4yburyWBAJKpVvUzW3YByqlmoKnnWk7iUnFV6eoDajoxH9omh9x+yv4x923zNK2T4SjIBylQOt1dP4KIIp8PEvcTnoTDjK2IXQUbsy74cFRSafjWVuvtxeuleue/JXfIfP6q0lw4AxO4QF9THtrhqoW8o3tnuI/8h9vS1F7DYnMVBLOqGtX9cqYn4sImccxFYIa2Cy/eF+u7nD4Y+zznDu0ASXB9dlyHSvoBBguF7oXG1K9p7ojdIH4Vw0Eq4IytF9jXU95niBg7N42lD1B+fh3D1LXZLqIa2bmVPC5R62M0XXnqTKqgCA8FJVBJ8s40YM0HGiE+vRM5FPBQThC6+LSa5RrM+s8IO9xnmmhf6hDsvvaISGJ+dHzG7KLmBLRM7uOEiM0umrQIgEUHusEUgVAUYUyYEeltVl6mun9t3lCBZttACXdQhobR5wabbPru32H3WcDSKQjazPOKAEqPXsnUpwagjYteQcghsuorI7bgToi/vG3NcGgdircd3XVNyPDavuQxJ6/9WlQSZ498G4JMIt0Rvu7b/ZTDjnbMEOA/ZdZZisEjKs4XjVtY3ZxADGEmIRC+6kAM9QzhnTiVjSYh//M6s+6NfFKeOo1j8dQuCRsuJS7EEEF5q6xFuhwCaIQLTR/0A32lASr4SrGaeC/pCBWlVZY6asAja1tl2VNPQFuF+i9WTg2VSddgzTkWEUKc8E7C3dv/23Y/ZMU9pTq68D1kJYEAGTT3Ip7AYLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk9sdG01OFphZEZXSzNBdWkzY3hpVlNwKzR0dWs2cnQrUUdEc3AxMTgyWEYw?=
 =?utf-8?B?dmtLYXU3VlFQVklGK1lNdEU0UUx1dmkrTEMrc2sxZmd5eFBaN3lObnZMVVdp?=
 =?utf-8?B?bGc3NmhnQ1Z4NHFqTUt0QkxSUURDWjhpdHNhZVdRK0pQeXlEZGM4MlhqNTBX?=
 =?utf-8?B?Z0ZLb1dON2JBakhCTXhPdnpiYS9KMWhjQzB4Vzc1OTE2MytlZFJCRTZQRXE2?=
 =?utf-8?B?VEEwcjg2WXZ1aExvalRlRUU4ZXozZm9lZjdLdGhwUEg4Wi83YUdpMFdrMWJw?=
 =?utf-8?B?QmFKYW5sSzJtN0pDVkpKNWJGamlHZ1ZUK1J1QnZnaE1WQnRLN0lXcGlMcWFE?=
 =?utf-8?B?TlJlTmFqWTlsSzMrQlU4Vkl3WERSYkZkVUt1WE5KNHloNWV2YlZOQmhnYlZV?=
 =?utf-8?B?NHE0NWxrVEtuM0dETXdVNEE5bSttNjVZS0lEZjBQZkdhTzJZMzd0Y2FQaDVr?=
 =?utf-8?B?aVJlcVlvRlpkZC9DN1gxOUNXZjhPM1pxTVh4d0hoS0FJOHRCUGx4V1JiSnEx?=
 =?utf-8?B?enRsZDJmaUlOSTVPZFMyT09jOXlJTXU5ODYzdGo3c3BpNHBFb3FJK25oSkJX?=
 =?utf-8?B?VVBuMlcrZGlhZkU0dzB2d3ZsbisxWUVqYVl5aWdhaEJGclNnUENUbGRzMHln?=
 =?utf-8?B?VnQybjJ1bmd6cW9KSndrVmt4Q2tBLzh4LzQwNUMrVVp6Q0ZvTlhGQWh6WlF4?=
 =?utf-8?B?c0lybGVNK01wT21YdUg5Sm1aTmhQVWJmNjFSSGU2Nkt0MytSNjljK2k1SlR6?=
 =?utf-8?B?K2hwbmJDL2xJV0I5MW1jZi9HZEltMFlQYVdSdGwrYUpQcnNqaXl3bzVOMDUx?=
 =?utf-8?B?dHp6QzlKeHlJSmMzYTgwdGp1cU4xVklldFpnbW5hR2pJVTVtRmt1YW16dHFa?=
 =?utf-8?B?MEs2Nm5mckl3b0hrOCsyMmZ1VzJTd2pBemYvbXJCSVd4VWFuN0xvaStlcnZN?=
 =?utf-8?B?Y0lMcDcydmR3ZGdlNXFaWVNxdjA5V3k4L2xGK21Nd2dFS1ZoV3BPbHB2ZlY1?=
 =?utf-8?B?dUtwMVV6MUx3ZGlJem9ZRXVkZUVWbVY3Nkt4RktOR255VFFuN3BZUi93QWp0?=
 =?utf-8?B?ZnJUVm0vTUJUeEo4WHRIbFNyM3FKSk8xS25ORW9QcDlsRDhyY0NycWVLYlNG?=
 =?utf-8?B?aDA0a3E1T05PYnRjYlRkZU5ZSm5HWUVORUFMcHNBZVFuYVptZzJKSnNGbWE5?=
 =?utf-8?B?UWFJZ0hkV3VySDEzdjl4dTl1UnEyVzJhai9pcjJ6dkJpcSsvU3R0eTc3aG5I?=
 =?utf-8?B?eEYwUjlPOE1tRmJINzVoR1gxOXhEUmpqaUtESFR6VUZjakU1NWUrVVo2SXg1?=
 =?utf-8?B?TFNpRnAzckRtelltOFM1bHhtcGRYREhPczErQmFTa1A3Zit4OHhuQmRMaXlX?=
 =?utf-8?B?Uzc4WFRIR01FbzcvNU9LUmNCRWJHVnR5dFc3cHplY2xqMDFJVzZYRFlWS2lX?=
 =?utf-8?B?Vlc3U1pzRERXRVpwc2kwaVcyVmg5OHFVdmRKWFZDMkoyOEhGMU0rSXJYVElB?=
 =?utf-8?B?dGFySGVsbkhWckV3RW9Yd3l3S3hpdUNDenl5Rzk3S0NHRTFRbE5UMnc2b214?=
 =?utf-8?B?RHJSbkRxSkFla1NXejhSRVdUdTc2SzJrTmliUXNyaFZ6Z0NNZEM4aDFyUW1i?=
 =?utf-8?B?d2lLaTRDT2JQQ1B2MjNaQnhjWmM4aFg3SnB2OVZicTNsWHpMNmE4Yk5Ia0JE?=
 =?utf-8?B?UGJvaklGdDczZ2YydHZEZmljUTR5MmorSmRCRDBnV1NkSkdkRUpvRTN6SWVX?=
 =?utf-8?B?V2p2Mk9BZ0QxSEoyQjNJZk80SUVJUGxtMmYxYkFaS0cvTjdvalY1SXJqcDlp?=
 =?utf-8?B?WDg4ZHFNUEZ2YzhKWmFBV28zQWRDamlkd09Rem40SksvU2dPa05KV3FaUDJK?=
 =?utf-8?B?eGtjV3hGQ3BPck9wWVM4TURTRXUyaXIwZjNuMllqWEZNTHU2OC9FNVVOWVNV?=
 =?utf-8?B?WENqY0g2bzFoeGRmaDVvc2NsWlJtTUNsb21VcGlzUlZiaEtFQ3E3YVZQbm9Z?=
 =?utf-8?B?QnlUVk14bTFhdXNrZUU5LzVkOFZMUFdZYWFOdDJCbG9rWGNlVkNoRkh4TUhE?=
 =?utf-8?B?M3BlNmo3WGlsMWtaWFlGWjBRQ0tpSEhtbWt3NC9lOE5yYWxrb0drV0wyTXFu?=
 =?utf-8?B?YVpMQ0VXanpISnFLeGdsVmVOUFRJWFduanZzbXFEbUFEQUxXT0ZKeUs4bVFO?=
 =?utf-8?B?YmtnN2ZwMHNLMElWNERBcXVKQjZGSEVlbEFKNml4U2NjS2VMVUlPcHVYVEo3?=
 =?utf-8?B?aEF5L1EycW9sUmhOYlVDc0o0eDlTT1ZENE45R2hzQm9QZ0xjZFRGR3A1Vk1j?=
 =?utf-8?B?UTgyRlRPcWNlQjZVTmN0TkdnOXgzQTEvUkJvQ20xSGl6Y0tLUEJEdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b344f33b-43f2-47ab-7077-08de7b8b77a0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:20:07.6346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2K3mzJpnpCQevumkBoopuWOIHKz3pdrOEJOdeKxLFI0Usqbv0caGX1A/XYmknnkWNl5xuwzOVTpoo484oqgfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8456
X-Rspamd-Queue-Id: AD63A2228DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[94.247.172.50:received,2603:10b6:610:24e::14:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, Nov 12, 2025 at 04:38:13PM +0100, Jan Beulich wrote:
> This NR_CPUS-dimensioned array is likely unused on most installations.
> Therefore it is especially wasteful for it to consume more space than
> really needed. Use the smallest possible type.
> 
> Further the array having all fields set to -1 is actually useless. Nothing
> relies on it, and core_parking_remove() doesn't restore the sentinel for
> vacated slots. Drop the initializers, moving the array to .bss.
> 
> Finally take the opportunity and update an adjacent variable's type, where
> a fixed-width type was pretty clearly inappropriate to use.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I assume there is a reason this is acting (mostly) as a LIFO. Else a
> simple cpumask_t would suffice.
> 
> An alternative would be to use the new BRK allocator, at least for NR_CPUS
> above a certain threshold.

Can't we just allocate this memory using xvzalloc_array()?  If we do
care about it being too big certainly allocating only when needed, and
based on the number of possible CPUs on the system would be much
better than playing games with the array type?

Thanks, Roger.

