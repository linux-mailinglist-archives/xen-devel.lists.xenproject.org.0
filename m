Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJc0EIC6sWmxEwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 19:54:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00E268EC4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 19:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251490.1548587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Ohe-0006QK-Js; Wed, 11 Mar 2026 18:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251490.1548587; Wed, 11 Mar 2026 18:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Ohe-0006Ot-H6; Wed, 11 Mar 2026 18:54:42 +0000
Received: by outflank-mailman (input) for mailman id 1251490;
 Wed, 11 Mar 2026 18:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzpO=BL=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w0Ohd-0006Ol-66
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 18:54:41 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfbbdc6c-1d7b-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 19:54:39 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7926.namprd03.prod.outlook.com (2603:10b6:806:432::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 18:54:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 18:54:33 +0000
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
X-Inumbo-ID: bfbbdc6c-1d7b-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gukzsx572hw2WV7mm2OPjjq//cbq6aOXnXEZuR91hEsg1tHCg3g0Ussh4RQQs2awuiwm9iJOjFRmNBZCSSOwTyN6bNyblI1BbwwO2gnDJsq6PpbGBhqeQxgNoRXXcjLdgdGbBVCliP/pKKOk8785sCnV8bl1mPQ2+4oYXPxNHUJzpMUUxgDb/SDY7UYhUQ1UkUZ2TeoaKPHWOK9lB541oWphFDHlmMNWjUZvMXCsEBmP3YCC0jmet/7GjXPAHUJRDFPZQop9dKmsKRvx7f9PzEiIw30+LfiQ7E3D+0bB53kNtDKVJ4ESXau0Q4dS3Ma+3zJILH+RUE8SFuSQl9ja6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjJi2ByH8oxh/HkmazPoTciK0z2uwOsP+ggzCjCvvsE=;
 b=isBIf7Jhr26bkQlMoyAemBFoYA5RMy+PPFWpoOh45rKHzq2pCu/gEXYzirCsCYoY8LJgmk8hqpm9Gy5zeZ4/N6WfuZ6Fi3HJrqIgxlIOHADg+dzbECku/M08JIJKJeZrKT2xARIo2AFlKR9Y1zO0KMMqvMZtQ0HUAs1Dy8JSXNk1m2Y1V4X1iAQPmRhWjGi00R9O9IBvsKnQ+0xUfnkENDrA2iu2fZoPHsdtj5WHA6SgRItNVmE4zaq46XfWV8R/E/eiCrzucM/0PLDieen46r6XS6lOY3yd/71pvfSqpivIr9+vo+VYC7Mdyi1RZnu9Gpd+CsocJ6E60Htu41isFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjJi2ByH8oxh/HkmazPoTciK0z2uwOsP+ggzCjCvvsE=;
 b=0pm/XQnJrt7IxJIKMeIuBXqnMMFBxNOaMGcw67UA4UrceJ1Ct2NgtYH5m+zBSgijukHRKnqRcIvy3tcDmGmEWN3C5lSxoZC3uRvCI3i1hh0kOp1hR1T+PwDlR2/FRpi58n4MJck2uiCbR6rnVArW7mer3w+QAKjFMQZBu9R7uj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <22bbe514-b1d5-4928-a35c-c5c61f26602f@citrix.com>
Date: Wed, 11 Mar 2026 18:54:28 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v4 4/4] x86/svm: Drop emulation of Intel's SYSENTER
 behaviour on AMD systems
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
 <20260311142711.16754-5-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260311142711.16754-5-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0432.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37d::29) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: ebefb891-084b-4e6d-26bd-08de7f9fa254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6oqaxYBlv33ndgItnr6ecyisnE9ysIRNciNvhw+ss7EXdI9dwICHmfBpB490Gc9dkCdNFz71OqEC93Dw/+CYrT9GKnKCOUJs8S5WBRWGg0IczgKohj9sk0dY/60bWOfFtxDBjB7O+1S+YVfaRUa96lrD6I8WQ/itcNxx8s1YxtHtUR0Q78degD7Qj+Rzg1dKvynWJJocvpFkzQJ+cXZWE5IgZ9TYj+zdmpcErP3Q5kf1NmGM29SZGFhfZBTivTfpP/6pXflnMquQOppJ10bHs/yqqqmVXxizX66EP/DKlhe9tyTLhtHhOy5O8KWgo9JN0RS1t+5TCaKmVb7Jet3xCOOq8BEpNjyGGtUWeHZYWHdchj0H/jKFn9ptlSAXqoRICbdES8oCuEvI2oXgO+/bZsXebVQb3oKgfEwz8aproqc34UVdG4AGT7SPs58Zi90iqja9JxZg8DflNUyMlgmgeJ4lGYVUAU1UOwbevtugpXT2HjhC82oIBhC8CMzsHXAOfNbNDgMKG8Kw4En/v33N66dQ0rVi6fotwm8+Nf3kQIIacXp64WPDDcg+q0bQ27UjkTAFBnd78qJKgjT2q5x97LeQUGCz12Kt13s/y1K/wCjvn4iGPCNI9brjbEfYeQK+51inqgMzAqmoaPSpd+qcy4QZ0+IW5vYwbtKGkjOmtD5/N1tkAEJuIfqf6LEHqBdudIUOpCr3Jy9vB4f++l1Zt0ttFJpj4PJ+HpSmER6LCSY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzJheHd5M1U3NE9OUHoxc0Y3SlI3ejFUak9hbjBaQUxjS1hMRmVLcFlURnhh?=
 =?utf-8?B?RmFrR3diNXI1elZhU1Bsc2dLWURlYWIxdS9YdUJhTjBiaE9oalBubFZoVUp4?=
 =?utf-8?B?NjlOR1RVVzI3SUFWOXdueGlKSkJhUkIwSGlWSjVCYlVMR3RMRXpheUFwZTI4?=
 =?utf-8?B?cThZbFZrdTV3RnVZdVpGeHNScVU1TkZyUDYzaEI0Z2N4VmViVEtkZ3c1Vzhr?=
 =?utf-8?B?WGZjNGN6TDNIcjNQOExwSm54ZWVGWTRGMEM1WURMdS9aSDFNV2ZJbGRqOHJz?=
 =?utf-8?B?SnEvaWxaMHpaT3dhOWlyb0VNeURWbWZjdDFJU2wxbXJyTFNIVE5jMkxuUmFO?=
 =?utf-8?B?Um9BQmR3cmZJcG1oNUxneEdQL21hcmhsLzZ4LzJqdE1wKzVNRlVvUlJkM3Mx?=
 =?utf-8?B?YzFVNjNSSWIrUzhWQlBkRlY1MnRqRWg5eVBnYzRyWW1nN3Y0akJpWXhHUGVU?=
 =?utf-8?B?UkROdDdEL1RtcjAvZ2c3NXJvNW9CVTVrQm92WjBGS3JGNnNvTHUvb2w5bXNu?=
 =?utf-8?B?OVdDaFBwbyt6VWc2TGV2SzA5cnJkQlhlelM4ajdXcFlqVkZQZTRPcURFejBI?=
 =?utf-8?B?emdpMDdXdk5jVDNMdzROcG1vZjcrN2dGSit5bWtWTW0zdXNBM2h4S2RuWVRY?=
 =?utf-8?B?aXplRDhMa3RWc3pDeGZ6K2FCUnNjU3JXeWRNK0tSdC9QUDI3clBhTUV1WDlK?=
 =?utf-8?B?Qm1rS29KQS9SdHdkUklPeDM3TEg4OE53Nno4Vk5JZVc5enBJSnN6U3NvS1A5?=
 =?utf-8?B?MkFQZlU2MWI2N04xei9RNUJ5Y2d1ZG1vWlllcVVlSjlUMGRHQXRzcGxUZSt1?=
 =?utf-8?B?OTI3MlFYZEo5ZThIcTFiOFNZd0JndUo2L0QyRytCWkJiMmZSbm9XbnRrOWEw?=
 =?utf-8?B?VDdncXJ0U0dlYktqWm53ZlNsd0p6WmpwdnYxajlxR2RWb3FlUDdBVmVHeitR?=
 =?utf-8?B?N0o2NHRJc3ozbjFPV2w2VjRWRm1yRWNsYStCc0VRb3JKMjZMVVFIS2ZSNm84?=
 =?utf-8?B?OVRQYzZ0NUNPRVpuVkllV0JFNldpK3JwczRoeHZxdHVQbUdMVnJXL3NvZHY4?=
 =?utf-8?B?d2ZJTEloUXVyZWQvZWxERTdTVUF6R3JHMU96Mm1SOFE2RWhHSWM0MDdxOUZs?=
 =?utf-8?B?U3o3cFRmWnI3ZDhybllGUUp3TTRZZ0hmcGJ4bzV5Wk5nK1FmQ09ybml5UHVq?=
 =?utf-8?B?cUh5U0JPOUc0STJJRUp2UERhdjBKUUNFbUk3Wm1BY21valhKays4V2Nzamd3?=
 =?utf-8?B?NEF3SXNZVzl1eVd6am05Ymg5T2EvZTlrdzYvbEhrOVJMMmJMc3hWVGk2OTJr?=
 =?utf-8?B?NGViQVFNTmlYQnNLWFE3WFhGNkx0LzFzdklFQXg4eHpLbGZPN1VNNHJWK2N5?=
 =?utf-8?B?OGI1YzBIT0JHS0tIYWJ5TDhnaXZzRmpydW1zMklvb2J4NUFvaXpibjZRWWFn?=
 =?utf-8?B?dXRvMmpnNGY1UkhFbms2UFBOa2pDelROOXdQVTNRUjNhZ3Q4Q2xRNTBrOVln?=
 =?utf-8?B?YUw2WHFuMkpjRTMya1ltYWd2dHhpUXBQTHFXMlUzUEFIUk90WERpNjg2QTRK?=
 =?utf-8?B?OGpxU09vdllYSG1ySEFvNi9JUHJLVmV6QjF4L0wzMmE3MkxWdDhYWTZiM1dr?=
 =?utf-8?B?d3lDazFTWGpKRnJ3dHptRjJzc0s4VkZQNUtiQjRYWlRCdXpZQ0drRThOcjAr?=
 =?utf-8?B?OWZ0WXJnTk9RUjFFMXhjQmtURHN1M25PdXlWQWU3RmhHZWJlQkd2NHplQ2cz?=
 =?utf-8?B?dmdNVFdFZ2lMdTJEbytVWm5rcExJRmZtYUNyQ2pVZmlpU1hEN1JWV1l0ZVR2?=
 =?utf-8?B?eEt0SUJUVFhOZ1JNNW5WZS80ME8xZ0t3YXRZMHArK285dnNxODhWNHpwNHRH?=
 =?utf-8?B?dXVsS1JqUjVtWkdHVXEzMmRrdnZEZHZENE9KcGpmRXBHTVJHWVp0OEg5ZXFV?=
 =?utf-8?B?R2dRVkZFK0ZXNmdSZk54QW9nSW42NUR3TnR4SHF2eXl6TVgwbTZRajlSdXdO?=
 =?utf-8?B?L3VyVXhkakpEUEtHMWt0UkRaRGI1ZFpNWGcydkdjL3Vmc0kxWGp4WmJFcUli?=
 =?utf-8?B?dkowNG44VzZEK2NrSmhVdlh2SzJ5R0c4QUhQVHVGejc5SGp1TStwM3ZvM2xH?=
 =?utf-8?B?YnMrOE1rdk0vc2kxRmtpcGk3c3dsU25ieWF1NkVsMUNWQzRkYmhiaDYxQTc3?=
 =?utf-8?B?NWVNQ0ZBTnRxWGpHQzhYUkorWWlJYUZSdFRnMW1Vd0lNTjRwdkhEb0FDWnVn?=
 =?utf-8?B?T0h5ZzBlODNhR3MzTkdEbW1BTjVsa3NMQkRrMmtjRlhPbnQ4c2w4SUxaaitt?=
 =?utf-8?B?bnRlK3ptV3hFNE5rWWFvZkthZVBZUVZOTm9CazEvdWdocVdxbkVaUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebefb891-084b-4e6d-26bd-08de7f9fa254
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:54:33.3856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJ69ce2deqm9TVOZjK591IpSHFudGLkmtN5v2PYTdS3iDLKbNOlc0tbJG9gDyE7rE21Z0LHjzFdyQg3xrSMtSPIS5lCqema7PSI7e3qE9m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7926
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9D00E268EC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In the subject, you need to say "SYSENTER MSR behaviour".

To counter it getting even longer, the "on AMD systems" is reductant
with the "x86/svm" prefix and can be dropped.

~Andrew

