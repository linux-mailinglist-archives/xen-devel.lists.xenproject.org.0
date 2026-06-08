Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oo8kGfjZJmpUlwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 17:04:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE89A657C95
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 17:04:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=alSR6qv1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331927.1594581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbWN-0007I8-IM; Mon, 08 Jun 2026 15:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331927.1594581; Mon, 08 Jun 2026 15:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbWN-0007GW-FY; Mon, 08 Jun 2026 15:04:11 +0000
Received: by outflank-mailman (input) for mailman id 1331927;
 Mon, 08 Jun 2026 15:04:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wWbWM-0007GN-Gk
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 15:04:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbWL-00DKSa-7E
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 17:04:09 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26d9df-5cb7-0a2a0a5109dd-0a2a4509b706-40
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 17:04:09 +0200
Received: from [52.101.53.9]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26d9e6-2497-0a2a45090019-346535091614-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 17:04:08 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB5908.namprd03.prod.outlook.com (2603:10b6:303:9d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Mon, 8 Jun 2026
 15:03:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 15:03:57 +0000
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
 b=i6UJtGRNfaOjZi98UogIxbhARelb5t/rtMpbaT4cgxl16+CtJGlJbN2ykS+fovDgrQkw78T1gfxBNhg/dPB/ZLu6L03M621s4erYUQiiBbll7HL6GKVE8B9C7EcFYGte/AakhO0oc4DPZLFwSQGdwH/VwDIa1WuTb+1jvPiDBDD2C3f+14atxtWLlc9W3MHCSEiDea+HCqfVzToA5tQ8q1ITOUAjpyIXx1nLIvK4muy8zKAO2bHruvAPUmyzGB2LboueRU17app6tQloeLpszjJDPvjUpeG9n89Tm8mKHU7ynxgds9lVhb2I2TdkQiFyLjeNU3am/AaqaceAyaCBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFGTu9+V7Rn6EYMUbdRJEm1hVACMn8+NuVW5fk+egsM=;
 b=YZp50I3vfW9U3W2gQZnQeXBhplsA7A9yW5ghAq5kQHjql6gzZju5/MezI31GhPHIMDc4/AUTLCsOU+3KFVDdp3JRvqEyC1fc9vTQQo9nSnUiSbEV/koL+pvfgRXyoQK/gmiYu3xLoLqJxPW03vNOHsF2lcSk+BS/5c1xc5pJ4O3VhKm4OtAkcwlMHNZcqVTqm22c71PPl9dT6HXQCVlE8Di1MZTx5bFZN11dvG1vPFcXdGJkBvaGeBwIY4X4MF5LfAQFvxDLLx1eXuVw0lKygzVHY8p5/r008vL/2IX3SwpD+X/AwrbP++HjxOkiXxD3pUDfmbY6EvWXWPnr8kNoIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFGTu9+V7Rn6EYMUbdRJEm1hVACMn8+NuVW5fk+egsM=;
 b=alSR6qv1c8JsIHRmC2Jb6cw13+si1TY7sVnWHhxTqg9yNOPAwzgNADAsyL1rkTVNRQXGXKHvpWvzeUtjmu96QvHd/YFm2acRr27N6syjA5BhjPQCe1HSxmuR3myM+0CiJbLd2ppvhTND+lAGr0sXINXM6l0q3WF/VnpEr4QyMs8=
Date: Mon, 8 Jun 2026 17:03:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 03/16] libs/guest: Reduce number of I/O vectors in
 write_batch
Message-ID: <aibZ2bPMBDyYjChh@macbook.local>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603130603.776452-4-frediano.ziglio@cloud.com>
X-ClientProxiedBy: MR1P264CA0153.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a07b09-3bcd-447b-a376-08dec56f29d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	XjsWMU7A0pk/u7S93CpAheRE3ud2R8Z3Q5Xl/ee3bG/lrGlmoZkoamcSbe5duQWMbESEB28hpjOhVTibDSu9LnHa4VpJb0nSWH7e5D35Te40tIbHfa/pI4mdlrEjvTz8cGldPCQb1T2mesamtRiUv+oVXadT1J78OcuW1d2VEjMGcs7Lhz2/C7X4+80aQCApl+++KeX+lmJV6oT0A9fLp7FwYTE+u3fhxLYZn9lZjtlYTclKqNB1JCXcXnK/CPzKG2qfA9peGJ4oUcMiLAs9cuyouC7ucdO6AKgsjUCoGIuK7Lp7AtVZLkcyg18kIjhNrnXdCl/4i/zOA4ZrAG+1uA3lhHNalvc64CFvFns/qmtbDLj5T9ZkKTtNpW4P78poZhN7RAUGGEW3auqY818QweB6HsaJgzKLy0c8yRmwFTRKRB6e0h3fVeSEqY4rFfPL37MrFzueDHKq6jkQTnNe2S8mhYkYXeVQ3ZhIZpGwsYu/hmnrZH3WHcUJXTI2MjkBLeVq/ulbSttjZxGNn0TKOWO7BAk4ZeKNh61Phc7qzKQ2lyoV2BGzniEiTfd11fbnCW5JK/4hzeMOyUy0TdC7dMvt0nPK9M4rIm2kRpEcVGsPgUm3c1IcMfhd4Q8N7zWpoE5uNZpsirNGTz9VK3nI/yL/at7J96CB2fN1mXBMDW0pzNtW4Mp4MkQQF1fE75Ln
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVJaT3ZYQmJlWXdQQSt4V3BaeUZqLy9qQU81blBNVDN3ZG03UDlkSkdQc3da?=
 =?utf-8?B?bjlEQ1U0ZXoraVVmQXM3NHArOEgvd1pSdGNieVovMW4vMnpLN2FSWW1rRWJE?=
 =?utf-8?B?YzN4cXNhU2N1M04zZll6cGFiMkNjdnhnTkZ2R2ZGSGRuNVNjZjBHSFEyaVdZ?=
 =?utf-8?B?M3RkVjltSXZDaStveUVxNU5WcmRpQXZTREFTWGZKS2xEMjBsejFSQmJXdFVp?=
 =?utf-8?B?T29oZkxXSGdWSytaK0hwUFhkZ0pwRmpDZkF2ZUtidi82d1lGQUlsYVNwNkZK?=
 =?utf-8?B?dzhxWllla0VuMUJkaVdPZTRtS0kwdmtmdnI0cEZtK0oxaDN3RVdQYld3V0Qz?=
 =?utf-8?B?Z3F4OVM1NUI5WStUWDNFdEVFeFZ0cG1UdUZjaFcvdm9nSXpsRUVoY05EUWhh?=
 =?utf-8?B?RjliNGJWbElLSHRGWkxyck5JaUdPTk1LY1M4VEYxcDJ4Y2Z0NXJ3K2pqSERP?=
 =?utf-8?B?WW5hdDJ3VTc0WlUvcmJOTHZoQlMrY1dmcTJnUlQ3TFhsZEFxQWlFQUdJUlp6?=
 =?utf-8?B?Z1N4dGZaRjdDQ0lYVFh6OTRlUXB4aXV6R0dXMlhiOUlXRkZQT0lvU2MyU1cr?=
 =?utf-8?B?U214UE93M3F5MlcvTnJocnVkWitjSUxWVEx3NUZMS2JXWDU3UlE2YWJRMkV1?=
 =?utf-8?B?MENoZ1dvbGw1ZDNYVE54a2tLcUVsN09XSWpIN2lFTUhJNkdObEcxMWNEUm4v?=
 =?utf-8?B?bnlTdlZ2dzlsUCsrVVRRMGtkOHNZOS9QNmFBem11OGlZOWpUNlhwUXc0a3N1?=
 =?utf-8?B?UUlSaURhdlBrZ0JoR2ZXalVEbklON24reGpxbW5xR0gwenFBRnArQlBIMVpn?=
 =?utf-8?B?YjJzcG4yQWFvSFdTZzNWdDl4cFZHRWRpblhITVYxZDdmU1pXLzFVSVR0dDRx?=
 =?utf-8?B?N1lMOGI3YzVvRUk2YWQyU1BORjF6bVdJVEM1UWs4RlRGQWlvSTBwVGVMeHc1?=
 =?utf-8?B?Z28xdTRjbFlCQWVqOStUYlVYdFQrWGtTYmZMSGZoQmJ3Yi9qU0NZZW5xRzlt?=
 =?utf-8?B?eHc4VnlreXVjeXFSVDQybW1RMk5ZQnJGV29GRVRXeUgxb0U4YnorZk5WMXIy?=
 =?utf-8?B?aHlZYjNZMnhoemZURnpaak5uQmQ0a1BYZ0NFalpubmoxR2kwMmhPb0R2ZlZa?=
 =?utf-8?B?YmJ1TDJKUGlhbWRCSEdSbG85UjhuTHg4Qm1WeWNHMWNldVJsOTR3WXdQVnZR?=
 =?utf-8?B?ODlZSVZ6VEQ0QjFoNjQ3RUhiQ04wZkpBSlNWR1ZEaDJ0bFBjanI3ZWpwbkUz?=
 =?utf-8?B?Q3FHM2VnaTVzNmJyZHp2TTdnMGVPcmQrV3QzQ2JoeXpicldWNmlsZmhFanJD?=
 =?utf-8?B?N1l1UWdmemZYMGZNZFdad0FkZGlZMzBqbWtpMmxyRFo5OHFoQ3RKOFRza3hj?=
 =?utf-8?B?V3I0UkQ5VzRIbS9uQm5KVGJCNWhFanJsVjZmQldWZ3h1MWhPNzZDZ0QwdTB0?=
 =?utf-8?B?UGpGQjJKVE9iUGk5OGVtSFB3YjZBNkZsbEtib3BLT2ZybzlTL21TbGZlaVFK?=
 =?utf-8?B?V0tRV1pERHBHSU96dEdEelFuM1U5RVB2MU1zZVYrVStFLytabUkwZzhLcW0v?=
 =?utf-8?B?QTIwd1JXTk1TRm1RK1R0eFdKQ1BYMWQ0WDlUa2tkZWdsaFlnTFRxZUlRMG9a?=
 =?utf-8?B?WXpwd2liWXZTN3Y5bVppK1BSTk5KSlNaMlUweitsYlpaNktBVkNQTjZBME05?=
 =?utf-8?B?eTRKcFdWT1dOTUpzNHdnbEtQYjlmRlpSSWcrWncxZ2YzbVNhU0xHR3VpaWxl?=
 =?utf-8?B?RkhNbkxxZFVuYWg2bUdVQm1BVy8zSTJDcWtvQXF6WU5GNGVKVHFKRVRpcEYx?=
 =?utf-8?B?UjVLMFV1N2JnbXBkVVU5N0hDcFpWNm5QODlRSEdhOTZSbmhUQzBIaFB3ajMr?=
 =?utf-8?B?MVV5QzVXd2MxZjJNQ09nclMxTklhUEtoWXNpd0FPY2xud1BTOTVUeDBRODFw?=
 =?utf-8?B?WDNsS3lsRk8xQ2ZwYTZENmVRT1RnMGZOZ2dtK0tSK1N4d0FURlRMdXV4aElu?=
 =?utf-8?B?aXBHZVUveUJidzgzZ2d0RWgwaGRPV1JDd0Z6UGZEV1MzUnl0K3B2WndiWU9h?=
 =?utf-8?B?bEoyeGN2aEVpWXFmVEpndkYvaHA1ZnhFMjFGVjF3bS9oK0NEL0tISUREWTB4?=
 =?utf-8?B?NkNLVlhyTkhmUGdQcmJKTFlFVGRYZ0JUaU92aTR2ODRZWjNCVmlBT0pJSkZq?=
 =?utf-8?B?QzZLT1FiQzJOb0ZsVUJlU0grUWNYRFVWT1IwWnllc0ZVdE1oMkE0aDREM2ZF?=
 =?utf-8?B?SGJqK2tmQndVSmpBWXdjNUtZZW9rMjl2RXpMV0JGOXNYQjRKajExYmF2eDMy?=
 =?utf-8?B?QmhhQzJUR1lGby9sMTE2QnJOZHZUUnZPRE1ONXcxQW5FaUZWa3ludz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a07b09-3bcd-447b-a376-08dec56f29d3
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 15:03:57.0310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRChXOWPPmy9b8KR+mJOePdLroRVw/HQp6pzHlEKSvqT9DhJsk3kG34SR7lXIKYaUJ8XPbAkuLRKODJMeRqS9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5908
X-purgate-ID: tlsNG-bad1c0/1780931049-4216DA53-3A94D5A6/0/0
X-purgate-type: clean
X-purgate-size: 1367
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:from_mime];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE89A657C95

On Wed, Jun 03, 2026 at 02:05:50PM +0100, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@citrix.com>
> 
> Each page was sent using a different iovec item. This potentially exceed
> Linux maximum (1024).
> Also some implementation (MiniOS) emulate writev with multiple write calls.

I would add to the commit message:

"Coalesce adjacent IO vector elements to attempt to reduce the number
of overall IO vectors for each operation."

> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> --
> Changes since v2:
> - change prefix in subject.
> ---
>  tools/libs/guest/xg_sr_save.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> index 1700d81905..62a39dfecc 100644
> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -240,13 +240,20 @@ static int write_batch(struct xc_sr_context *ctx)
>      {
>          for ( i = 0; i < nr_pfns; ++i )
>          {
> -            if ( guest_data[i] )
> +            if ( !guest_data[i] )
> +                continue;
> +
> +            if ( iov[iovcnt-1].iov_base + iov[iovcnt-1].iov_len != guest_data[i] )

Nit: space between subtraction and operands: iovcnt - 1.

Thanks, Roger.

