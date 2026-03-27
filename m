Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK+tEJNWxmmMIwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:06:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B767342268
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:06:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265289.1556287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6447-0001uB-6T; Fri, 27 Mar 2026 10:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265289.1556287; Fri, 27 Mar 2026 10:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6447-0001s6-3O; Fri, 27 Mar 2026 10:05:19 +0000
Received: by outflank-mailman (input) for mailman id 1265289;
 Fri, 27 Mar 2026 10:05:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w6445-0001s0-OF
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 10:05:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w6444-00Bzrb-Qu
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 11:05:16 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c65653-2eae-0a2a0a5409dd-0a2a4506e884-40
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:05:16 +0100
Received: from [52.101.61.16]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c6565b-3034-0a2a45060019-34653d10e07b-4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:05:16 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by PH7PR03MB7485.namprd03.prod.outlook.com (2603:10b6:510:2f1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Fri, 27 Mar
 2026 10:05:12 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 10:05:12 +0000
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
 b=eYJvi0WdWgrIXkje5b8+OZC+4XAYx6lB30dueH3AclAUnhgItTwUi1tyR3wOtc2lG703D/VGjegUrvg3jbJSwD782P7/DMFBEv2qulQvCWOoxGm6hQwFnxHsTRflFjkECivAocQGGCu+7iemXtZ5jdZW0blYjZG1qaOXUp0ZL0LQZW7W6lnW2IQ+t1NeqEAm7XMyG+oBECAXZkdExrodRpa81aU7KGRtxN4EQ+a4cvVWj29pAmwxzpPqMN838CkqR+Hz94tpCzbQIubbGFO6NYs045K42wqpw5wczy7H2aD0eOtggAfYujU7ikAv41Sx3tw648ibeD7Ug7SG15HPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lATMMXG+NWg2y3eQXyaSPwpqqFTx9NEydPGz3X1MHwM=;
 b=jveL7FQCCfNw9NXVUC6D2VfGLgEw4wr4Gh9mGuN6GypUz5sP7REXnQYwWjZtmW8kPglcpKELEKWHIlNp7gB1JI0WNjEffgov4HiMTscQ4dHbIsMw373Mdqo7VjFv0nbjqdT+k0pKGewJEiW4FdY2fgPyBr3Zl23ThfahF1h7befvwbJSzOjcxoo/qDFdWk6IiVu5AL7mZI463hYeOgdgWLpNEw0Ic37KnHX8rV3x5YWddFr5VCKu1qi9vKG2W7qnPI20GFdUs5yZr56peFGj0wjS5418ykGUS7dogWZNKCizQP7/EawNSLNtnfdkvQ5BcZHmo4lcfVJVkXGtiSXQnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lATMMXG+NWg2y3eQXyaSPwpqqFTx9NEydPGz3X1MHwM=;
 b=ySSToK3I95DmnCk8R/1mUqX5lEq0eblaQp5Bm+72BCE+a77j68u3ws+0W5lMkDInGYMA7rTd8Usyncv536pyW8YU4IWiiGZiDH5Hdis/5Akav3uQhp1LN+QstDvBU08fnD0y0TyAsXkyE3jqgr+ehIUNc/2KLbG+dItrCqEg0NY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a0cf5128-9387-4796-8440-7e33b6dd8337@citrix.com>
Date: Fri, 27 Mar 2026 10:04:19 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/fpu: Initialise FTW as well as FCW in
 xstate_alloc_save_area()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20260326190429.1156367-1-andrew.cooper3@citrix.com>
 <20260326190429.1156367-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20260326190429.1156367-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::14) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|PH7PR03MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: c46e665a-5fc0-4eba-f56a-08de8be85597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Mm+Vcx4sZQzqWOjj7zitUJWsuaIhevGN82zZim33iH0SoPm4t2tWEJIAqnzRtfbNQT3EGeeiphFGgV6r/5ZYOV8gl3uHrQrZJBEx9YSaP2pBEdoi8EL8nlYbKb0uP1P3U+joFZjxjZFvWNQ3c4VNt4YzIfZHve5wCCjn+yOkZafH92Ces/kVhaIL489eZgOcrRHJIC57BhxDU0F2+HnOHxL9r5SGS2lTmSpaDZDI53SEbTMhEvyx23EfFm3nybldFoFRLwqzuK2e8p3kv2fzwpDTbZtRFDhN0/FNOvS1bVXy4To3hFDyEs/1HuheRVr4M9znoAfXrJOubL4+Upe1inIE403KbsF5xtma3BrNUPXOhjnIMhFnQ7ZUJfqU9gpdx7adqzUOjfGxyLJIWL++wgaNmwY1Ej63b/69VhF7j/bsuv0JUZcMEi2/BmUIx2CFrQ+ksbLzk1PyKYstkB6QICphyNwbzDqUBCUfl1CNVAUNvh/kSnX1TNLDha2YrwxkET5EBDacQUUTbb82/8FciX5QLSaJVhCPJZMwIA0rIc+jwbjoNQFmc6i0jnVD+LgWgx5yRTcIsTV/zZXTcWxrKwCJ5QJ2hKAcWUvIUujvGB4Wf5kG02Urdk6qMenWVNTBf14DR92trgomkmE1x7FN4cWhv0AObsBzOrR7nr28vMD+RicoUsG4jYIYVXY7VWtpxKWxiA4soIo0newMSp0Y11ZmblmMkJ1v2jBFSl15v3c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0h5VHBlQVNTZGlHUnJBOTNaVm1oLzk0ejEwN243N0pjS2IyanRXc3pYNERs?=
 =?utf-8?B?N3JsNVV0c2RSYmw4bENOTVEyUENzWTR1OUR2M0hYL05vbko2bEoyYVhwMVEr?=
 =?utf-8?B?VHNlZWVmRHV4MkRHMm5SakVFRGFJWDFLeGNnenRBU2JpVjM4aWFPTjY5UGR0?=
 =?utf-8?B?bmZqUWlVeXVBRUdqcis2blVOb0dCZ1VTeEV5eEF1bEE1L0x4VERjejg1amJ6?=
 =?utf-8?B?eldnSzZURmFNZWJiYVRRNzJCdUFUNmJJVXFvdlQyR2Z6WDc3NXU3ZHFXUUds?=
 =?utf-8?B?RmJVL3hDempCMnRBQUhENnFncncyZXZxT2tBR3kvV3V1eUlWclFWT1gzbEFY?=
 =?utf-8?B?Vk83a0lhenVDUVR6TG1ybjRkR1UrR1Vrems2YklvWGh5ejdyODhHNEgyZGxt?=
 =?utf-8?B?bUM3T3B3a2czcXpTYVVIWkRpNGRvRjZjNlF4U3RCSk9BQlFnM2pLN1lHN0tz?=
 =?utf-8?B?NHduK2JIL0pna1VkdVhvdjRiTWlCcjFqdjJYdFBlbVF1QmN2Vk5JbUZEbzJG?=
 =?utf-8?B?enc0L01pVGxRVzBhWEw1OER0RllNc1hVR1NqSHlwUlZITllIdUpSOXk2UW5W?=
 =?utf-8?B?SkowZ1ZsY3hmOUdYQUFacUVPaFhWQk9YZjJQZXBVSXFjamVmU3UzOVhlbXpH?=
 =?utf-8?B?SVhmOUpldUdTcnNRTXZSam8raXpuYkNndG52Vld4WkpUNkxKKy9kR3QxenJQ?=
 =?utf-8?B?SEFIM0MzZjl1d1BwMVVSR1lyV0pGS3R0Yzh2cUI4MGpFU0JyY2R3elpUNTNB?=
 =?utf-8?B?NHM2RW9kelJGZjY2N0tDYmxPNWlZelRqeFpLQlF4R21oc3d0RUdDbUdncmdu?=
 =?utf-8?B?akM5NDhqY0VtNnNQb0l2cTNIQXdTTW5FbC9sRXcrY28yUm1RVHB4M1N2UmxP?=
 =?utf-8?B?dVpTTHI0K1hTUHR3VHRON21mVnFUeEFmVHRzSGI3MVByU1gzNDlMUlFldzd6?=
 =?utf-8?B?NWdMSCs0TmdVNklUMGtLdjdrVEhzbnA1R3RyNy85SzNBaGFwdXNkclJNeU5W?=
 =?utf-8?B?b2YzczNXUVJkUWJHaDdYSDY1VW95WktzQzg2bGFoeS9TZTY3UWNORW80TDFi?=
 =?utf-8?B?WnZqWDRvMklHRnhkYzdTcTZhWGpEeFd3Vy9ycTh5bGJRNXBlLzE5T2pkd2pW?=
 =?utf-8?B?cEJYcjVScDZzdGFPTFJYWGpxMVJidnZoM21lRFhia2VoOGlBRktXa09zbC94?=
 =?utf-8?B?NkpPTHZtOWU1dUZGbUxGRFZYbXBaQmJXVGx1NlA0ZS9rYmlabHgrZ21MQnh2?=
 =?utf-8?B?SUx1UTFMVG5UemhSeTFpdFNkNnl6WmRRN3RaMVlkYktmcEpoVTRMUkRDYnpJ?=
 =?utf-8?B?TkdDbEQxT1RxVjZ1UzcyMUdka2NXTTdwOTlCZW5QT0ZaV0h0VUx0QlE1cUVE?=
 =?utf-8?B?ZkR2cWFuM24xaDJ0bHVrckVhMWpoTWtFN05NL0xPL2lBUUZaaWpnektMQUFZ?=
 =?utf-8?B?ajRYcTFWc0hhNWlKbXdnaGtVYi9oYWFEWHQ0bVlKRkkrWFFwdVNxalhBRHRo?=
 =?utf-8?B?a3FPMktGbDA3dWYvUnpEdTdSL09OMllvWXArMUJzM05oY3JFdGZjYUUwc3pQ?=
 =?utf-8?B?VWNxY0k0Tmd0clk2dW5jOTVQRlpxTWhwRkcvSjdSb3lHWnY5aWJPdjdXK3RW?=
 =?utf-8?B?Q0VpUUFyNlF6WC90TmRFdTZHM2JKTHgxbGRmRmYzZ0ZkRVJ3dWJUYWRoa1E3?=
 =?utf-8?B?bHR5dkFoQVJhNkUwKzM2LzVtNmwycmxOcFRhcCt4YTdJTmNnTjZETnYyQWhU?=
 =?utf-8?B?ajRQV1cwdmpyRld4S0E3MHFYOGZrQjNJYWNLOVQyakhzTmxtL1VBWW4ydzNH?=
 =?utf-8?B?VWFTaUZMbHMwRkNGelVxZVpHVUJyMjAyTjBWOVA3QTVHZnBRUjV1RUZmNFdn?=
 =?utf-8?B?RS9VZGJKcHVJaElkRWNVcjVjcE9aKzJMam0xbFczRXhzTDNSWEd6QVFtMXVK?=
 =?utf-8?B?a3ZBdFg3ZmhqakdkRUx5cjlySW13OEkrY0FvOVFvaG1OTVVsdlJEazloZnox?=
 =?utf-8?B?US84Tk9KQTI2S1dDa3FGNm5jTTUrckFpQmVFRFMzbmp1dzI1ZTBtdHdmN1Fo?=
 =?utf-8?B?QXQzQUJ2a29aSWdVT1RGK0p1TlJ4OVlBWEZxWWY2Q1VHTEwxWCtnVjVnZkZV?=
 =?utf-8?B?bCtYRUJURDlLWlJvSnVlQ25hY254SFkrMGViMTFXMGNaMVpKQ3VYNkRZVU9P?=
 =?utf-8?B?VmoyQkpoMDhNRTZWb1NROW1Obm40OHJOUUtwOG5Ucm5YOVE3OEZuV1UzdGZX?=
 =?utf-8?B?ZXBXbnpja0Z2MkNVRThJTzQ0MjltTjlEMnNNckJiL0JZRjNLWWpIVWFJTVQv?=
 =?utf-8?B?RWRLMC9NNTc2RWNZemRZbVNEeGVBZCtXZ1JvUlBEMlM4RE9iUTNtdXFUQ3dS?=
 =?utf-8?Q?IW4cNUsy094Wr8Hw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c46e665a-5fc0-4eba-f56a-08de8be85597
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 10:05:11.9438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ktSkBydARV6Aiego5n/HC4/H26FdyBFYDdZt3V9o23FO9sruRbAit3auJ3gVz7EgqJEAXWjG69tUiwI0CccRk1fvScSvID9fsDsfcEERkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7485
X-purgate-ID: tlsNG-16d1c6/1774605916-823921C2-4211A6B7/0/0
X-purgate-type: clean
X-purgate-size: 1743
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3B767342268
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 7:04 PM, Andrew Cooper wrote:
> xstate_alloc_save_area() configures FCW and MXCSR to #RESET values but misses
> FTW.  Fixing this means that the backing memory always has an architecturally
> correct value.
> 
> Adjust the comment to state that it's the #RESET values which we care about.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> I don't understand what the rest of the comment is trying to say, so have left
> it alone.  There's still a lot of cleanup to be done to merge i387 and xstate.
> ---
>   xen/arch/x86/xstate.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> index e990abc9d18c..747df0b2e9a9 100644
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -550,11 +550,12 @@ int xstate_alloc_save_area(struct vcpu *v)
>           return -ENOMEM;
>   
>       /*
> -     * Set the memory image to default values, but don't force the context
> +     * Set the memory image to #RESET values, but don't force the context
>        * to be loaded from memory (i.e. keep save_area->xsave_hdr.xstate_bv
>        * clear).
>        */
>       save_area->fpu_sse.fcw = FCW_DEFAULT;
> +    save_area->fpu_sse.ftw = FXSAVE_FTW_RESET;
>       save_area->fpu_sse.mxcsr = MXCSR_DEFAULT;
>   
>       v->arch.xsave_area = save_area;

Is this comment correct given that it is initializing FCW to FCW_DEFAULT
which is different from FCW_RESET?

As they seem to be mostly doing the same thing, could we call
vcpu_reset_fpu() here instead?

Ross

