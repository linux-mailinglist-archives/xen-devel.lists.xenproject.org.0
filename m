Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AIhSItzEKmo9wgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:23:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1665672AC4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:23:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=d4M96X0F;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335637.1597829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgJP-00047o-L0; Thu, 11 Jun 2026 14:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335637.1597829; Thu, 11 Jun 2026 14:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgJP-000469-Hc; Thu, 11 Jun 2026 14:23:15 +0000
Received: by outflank-mailman (input) for mailman id 1335637;
 Thu, 11 Jun 2026 14:23:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXgJO-00045z-Ai
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:23:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgJN-002s3Q-Nb
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:23:13 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2ac4b8-e002-0a2a0a5209dd-0a2a45018e34-38
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:23:13 +0200
Received: from [40.107.209.46]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2ac4d0-c1f2-0a2a45010019-286bd12e522b-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:23:13 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6868.namprd03.prod.outlook.com (2603:10b6:303:1b8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Thu, 11 Jun
 2026 14:23:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 14:23:09 +0000
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
 b=ZhPFThPUn91Hgu77rERG8qHPtiL8OXA35kV9sv/iP4Kv2/vSh3AREzilp1Fcgopi6GM/W8lY0jpjpW7+IPrlRYFD3eQmXl01X/ub1W3YhnF7bU4oqCL2T9BKT99SXC6SfO5NCu1hVaFBPNRHwwTUSdd1MpOEgIKG5AFio3aQ/PIy7FXnM+r957zDId4KM8XcuB4Yg340eyu1m4+bAOocVK1t1AOiAKUVu/2f2ZDj0NNTmVXhmHWht15ItGgwUNOYvgu/06Gb1R7H1Gmx7xF23LUmmSDcXyPY6yy1xwBmpXIDrLNPfGbidXRenmAeXo0Por5AeDf3e/N/VjdptahyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qe4tf15hT1j67LjPeEYkl0fRGQTF6kndGFvCqDcbhHw=;
 b=eIYToCIwMhzNoAZN7TW2VsWadXAm1+P9UJh+68OJKWJ4xtggXjTDZstkjgLmRMhIYAAq+zEj69C0Y4qanWg5+5j4U+2h24UOw0mF+Ld91lvILH1LNLW3yFt1tVbWtonz6mj1UQ3VnGjFcCMQws7GVlwcB/4yuzvAJDzAQNmo8QoBCBHaEuj02Uu3vdhfQrR1tAAZBCRc82c3k+Wbk90+j8X89bnulbmVlEWCv+8tPnIKyQHy+rugSMp0gEXpDEkZAA6it6ffTR5ZITTd3Fyw287p/TDC5vWhkCoQK/yp2oF6VDRczKPZKRJhuCToEtAELEBaoF/PCpHauaRFmlonUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qe4tf15hT1j67LjPeEYkl0fRGQTF6kndGFvCqDcbhHw=;
 b=d4M96X0FfjUA+/NbFY292wLTv+VjW4uJHPbPVRrCrpliTw732Zi9KCzIkQa2qmqhppSv/PEvL1JQWkFETvaX2mPMKho9ptsr7Uk7RKxGJBxK1mAVp5rsylOfYQw4WCfo7cg+Gb46M3NNLiNnKEgBItLbuMRC6ZAkXRJJ7goc9MI=
Date: Thu, 11 Jun 2026 16:23:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/2] domctl: Handle XEN_DOMCTL_getpageframeinfo3
 without the domctl lock
Message-ID: <airEye3YHSEmNUCG@macbook.local>
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <20260609151528.2426788-2-ross.lagerwall@citrix.com>
 <e5be8bcd-1699-442e-bcc4-25bb2e1c4234@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e5be8bcd-1699-442e-bcc4-25bb2e1c4234@apertussolutions.com>
X-ClientProxiedBy: MR1P264CA0205.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: f767d677-1d41-4c32-2a26-08dec7c4f63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|56012099006|11063799006|3023799007|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	yIbGIXLCcznaLRC+uznLyRkxSBdz2BMH9evFu2Ernuy8pcEjOGkZ0yEGhHAHaEXS5dIXzUK+a7fYxp3fs9hBWS6skIDdnrwdwg1iyn+As29/I9bfarztUKh+v0SJe0Lfqxnn3HQKZ5Tg6UwzgML5FzKDpL3grMPe9VQuTgzSH+fseiJP2W9V/Mo31sgzAOp07T8h6xNX4FI8cjW+nC+aSp0TlKXTLlpCw/AIr3A4sH6geAGlnTJuLKNIRkFnXfF6r6uSVVXCQ8PV3KWZmW2zlgtNTzCaBZh5VnRy09av2P0CprwlvbOWqMP2VWB615hHsFEBf3gJJu/Q8d74qBt52Xi9MfC4Y4gf3MBDx+9BFIM4nCkPDzmRPlTzE8d4LUFARIcKTgHBPhVTjNZ/eRWyGMIGWIopBSgf6JNlgQ+b3UrpmDUdUeRddrxwrBGQxpB6z9fzXb6Mq/dLR+2v64DvzUSdbOSrHiIYc+TSluWq64mXFTbMJM4u0w05e3rdXyWp1D+NbvaM7lGDl5h06IjuHWFRQNnXSc6DJW27UXPuaAzjgk4oByGFmeSUf2kqIEM23OCNar7N+5q6VTECLOEBP2oMOkRTwX4Nc+kbf/TykAC4VHjgheCqKcy8jUxrF0ygXG+j3EHFmzc49bTG/eGIgloCy+GU2WLdgBk5J3KPyl1OP9Wt7B2VaKS9PMZIFi2i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y21FK0gyMXlxNVhmNjZCZERTRXl1cXlFWWFqY2ZtR2haTEQ0OGFmZnBFc3JM?=
 =?utf-8?B?NG11V2QzZjhwNDBBYUhsYUdPWVdhd0FlU2RLZE1vU0JUd1RPVzVMWW9kN0ZC?=
 =?utf-8?B?M21kVnNYdUszQkt2enZKc1JwZWhPc1NhYWozV3RWQU10NnUwcDhZNngvazdT?=
 =?utf-8?B?dzgzajlHUytsRkdvTGhrN0dkYytXRXFSWXhSYVJMVlV5RWh6V3A2L3FWUGQv?=
 =?utf-8?B?V0R2OCsraXF6ZkJySTJURFQ1M0dhODlFUVordzBEOTlQUmJmTVdnaFhrRFhx?=
 =?utf-8?B?bHBYY3ZmTXNGaXE5Y3Z3QTJIN003U1RzWi80SUtCcGJyc2lPUTB4SzF4dDRN?=
 =?utf-8?B?bm13bVVXYmxtSmRPTjYybWJ3TXV6RmdRRER0RlYrdy9JaW5Nc1ZEVzlWSGlF?=
 =?utf-8?B?ek9FQy9lZTdvKzd4OUhoMjlMdTFHRUw2aXhCek5ZclltZWF1L2Y1TmJzL05E?=
 =?utf-8?B?bzdxTDQzcGRoWE5SanlXMXNmZ2EyMmRFUlBHV0tWMHByZzl4UzZ3dUlPa2dN?=
 =?utf-8?B?SDlXZ2NWallpaVVISXFDTkFzU2I0QXR5SDNXU2xuK1BPK3VJbjFkUll0VVBx?=
 =?utf-8?B?YURqNXRZZG1nS3JBbkdsdVBtSE96b3J1cldqSXJGNWpNYVZPZ2tnZ2dSb2VD?=
 =?utf-8?B?VmVxbUVDVWJmYk9EOFpxdEl3S2IwUjFuRVIxQXp4Mm82T1VrZGpmdm1kNW56?=
 =?utf-8?B?Mi9jNVptSWNqZ244R1NZaGM1K0xIdFZVQkNxemdaZXBWazdJeTRKSTgvcGJv?=
 =?utf-8?B?enZLOTU2OU5sd053RFhmQk5wTXpMd0FOSTBNSWRiWUhBS2NUaDQzWmw2UHlV?=
 =?utf-8?B?c0QzVWh5RGl0dUJkemJmWnVmUDZ4b1FJZHVSWnpjam9DeTZJMWJrYzljVENG?=
 =?utf-8?B?YTZrOVpnWXUxeXc5Ui9kb3hIbzVPNDh2Lzh6VjF2aFVzRTNZaXJLZXFweXNC?=
 =?utf-8?B?RElRalhsOXNiT2ozY2d0aHAvayswK3QwWUJLM25uTkFwMnRjV0FZR00yTVlh?=
 =?utf-8?B?S0hmQXloU21YWFdGdCtZOXBxai8wVGVoWlhXQlZuRjJ2aXczektORXVnRFRF?=
 =?utf-8?B?V0ZlNnNWNURhNzl3MkIybytaak1TZ09HdC9yNmZVZ2RXRHM0aVhMc3pPZm01?=
 =?utf-8?B?bi94b1QvenJQQzkwcU9ycVZVR28wcEgrRWpGSGtkamJIVjFiNkZSdU5yN1hK?=
 =?utf-8?B?d3JnNEZHMTlNd3ZFRW10QlVZcmZlMnN3UzlHMGRLYXBYZ25vQUl4Y2lJVlht?=
 =?utf-8?B?Q0R2VXZUZkYwZ2pPM29laTJwVDh4Tm8zWUZHeURhdHorcHJMWWNiZndWZHdE?=
 =?utf-8?B?aVBDSXdqd000RzEzWlNUYkt1Q2UzRTdhRmJrSUlnVmVXM3lKSnNZbXVqRXNC?=
 =?utf-8?B?L0cwWEMxZ0wzT1pyRkFTWUJRTnJodm1ldUpGckErTUFRamN6Tk10MlJSQmtZ?=
 =?utf-8?B?elJxYVQzTlBadmtiWWpoampabzRSUGlNeHhCTExpRlh2RGhZSFp5aFE2eUF3?=
 =?utf-8?B?RWJjWDM0d05jdTJYWWJ4T3F6SjVvMXJBNzB1dmY5Sjk2ZmYza2tScVdxaklm?=
 =?utf-8?B?WTlJZ3IzVmlnSG5sSmFUUXorcW1zWSsxRUhWU3V0QU8yajNMSG9wQmtMYTk0?=
 =?utf-8?B?S0t5NHZYRzZkamVucTZtdnRkSHczSVUrOEE0d3N5dEtXZGRKd3dKNExuZzly?=
 =?utf-8?B?ZmdkbW14RFJhd1ErU0IyRXloQ2ZYdUpNa0JBRUE1aC9HVVB6OHJnNkduVzBr?=
 =?utf-8?B?WE5ZNWFhN0YyT0l0emcyL2J6amZkeW5NZ2VmUXNEcjNlZmV5aHBWdTNxbjhO?=
 =?utf-8?B?NUZHdTRPanR2bVZ6K09NWGtPQnJQMFZUODQxclozWEtqQnZkc0ZCS3NxUkw2?=
 =?utf-8?B?eEpGVEJnQnd0QmJNdjF3aW81R2lJTWlvSEoySVdhRTFuc081YnNPeXFFZUFS?=
 =?utf-8?B?YThvWDlCbGQvUEQ2d1lkZ09WblRmTlU5YVhKNkdvQUxMVzJ3U2RleWRVd0JJ?=
 =?utf-8?B?Vk5EUjNKa3ljclNRd3FUaXZLUEl4ejV4MTlkWlNOZ25GWHVBUzdzWjhSVFBw?=
 =?utf-8?B?TTF2Y0dIbXZIZFZYemlNNUtJT1ljRDFBS3dYVzhSNTA5Sm43V0gwbnIxNGZl?=
 =?utf-8?B?ZU9ITXd3SFl4eHNFd004UFFQSVRNSzF2bkdyVEZkUEhjcWs0MERnb3hOU1dK?=
 =?utf-8?B?S3IyRlRXSHoybG5kT1U1NnlISGVqNWZabFJnVWJyVXZPZ3pvSGo5QWpLNHF1?=
 =?utf-8?B?bGNRZE51NTgzaVdOUjNHUmdqVmRYRUZleGpHdmZTR0ZXZ3B6eGNpZDN6UmI1?=
 =?utf-8?B?T201QWtXd3JuUWFQZkhNNGY4ZTloY0J0Zzg3QW5YdU9ueUcxYXMrdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f767d677-1d41-4c32-2a26-08dec7c4f63a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:23:09.3874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trE+W2BedLjO3o3odIKXwiKx40d31KF5zlp2dukZdejfgIRQY7RaqvZ4qB1mVS8il1aPcCbnGUd9SbiNbDdG0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6868
X-purgate-ID: tlsNG-d62444/1781187793-ADD41FF4-1DA9B0AE/0/0
X-purgate-type: clean
X-purgate-size: 2310
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1665672AC4

On Thu, Jun 11, 2026 at 09:11:15AM -0400, Daniel P. Smith wrote:
> On 6/9/26 11:15 AM, Ross Lagerwall wrote:
> > It does not have side effects and is protected from concurrent changes
> > by the P2M read lock therefore skip taking the domctl lock.
> > 
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > ---
> >   xen/arch/x86/domctl.c | 4 ++++
> >   xen/common/domctl.c   | 1 +
> >   2 files changed, 5 insertions(+)
> > 
> > diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> > index 83bf51e498df..0e9a2532887e 100644
> > --- a/xen/arch/x86/domctl.c
> > +++ b/xen/arch/x86/domctl.c
> > @@ -301,6 +301,10 @@ long arch_do_domctl(
> >           /* Games to allow this code block to handle a compat guest. */
> >           void __user *guest_handle = domctl->u.getpageframeinfo3.array.p;
> > +        ret = xsm_domctl(XSM_OTHER, d, domctl);
> > +        if ( ret )
> > +            break;
> > +
> >           if ( unlikely(num > 1024) ||
> >                unlikely(num != domctl->u.getpageframeinfo3.num) )
> >           {
> > diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> > index 3efa5b9d55b9..35144d95b808 100644
> > --- a/xen/common/domctl.c
> > +++ b/xen/common/domctl.c
> > @@ -555,6 +555,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >       case XEN_DOMCTL_gsi_permission:
> >       case XEN_DOMCTL_bind_pt_irq:
> >       case XEN_DOMCTL_unbind_pt_irq:
> > +    case XEN_DOMCTL_getpageframeinfo3:
> >           ret = arch_do_domctl(op, d, u_domctl);
> >           goto domctl_out_unlock_domonly;
> I would respectfully ask to be mindful when XSM hooks are being manipulated
> in a patch that a review from an XSM maintainer should be sought before
> committing a patch. In this case case the change itself is good, though I
> would have liked the opportunity to comment that the commit message should
> have had some explanation on the xsm change.

I've already replied to 2/2, but would like to re-instate my apology
here so it doesn't seem like this went unnoticed:

Sorry, this was already picked up in a rush to get it into 4.22 and I
didn't realize it was missing an XSM maintainer Ack.  That's entirely
my fault, there was no intention to bypass or overrule your opinion.

Regards, Roger.

