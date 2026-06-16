Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s9iWAzOEMWqYlQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:13:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D85692DFB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:13:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=kB0zlOHq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339491.1600680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXKl-00010I-8n; Tue, 16 Jun 2026 17:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339491.1600680; Tue, 16 Jun 2026 17:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXKl-0000yN-5W; Tue, 16 Jun 2026 17:12:19 +0000
Received: by outflank-mailman (input) for mailman id 1339491;
 Tue, 16 Jun 2026 17:12:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZXKk-0000yC-1T
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:12:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZXKi-00AsBT-Rd
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 19:12:16 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3183a2-5cb7-0a2a0a5109dd-0a2a450a85e4-38
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:12:16 +0200
Received: from [52.101.201.7]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a3183ed-56b3-0a2a450a0019-3465c907960a-4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:12:16 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5001.namprd03.prod.outlook.com (2603:10b6:5:1e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Tue, 16 Jun
 2026 17:12:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:12:11 +0000
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
 b=nHBI6/9Xr9MRIiTBF2qHQ/4Hzp8VSnrcgbGLTkUEzNftMgBJhlcS7UlmEeCju6rDAKUsbwAg0hmJF/hW0bD8TrO7bJW7Ui3/9ZA8ZdEkhtclsQXc10YsFE0RZcHLGlwGi+4eQWKDaTJEIIDJqdvURqRGpnNXvil0tRCElck1JqB8eI7mrf2OChkmeqb/VRiHrdz33hFF31OqJWb40whtJGEUed4Yj2vkcerWEBq7A1+CD769Qmch1HEIkQXQIfBrCK5z3hijP1TGkkGr+GZC+FPDU1dm2ptywW/cHbyi+0h3MgvRxF3yYfQPyNUpJHtBvMEj5cHjsfpdDRYX05BSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqboQVx8R1d3+2wOicZCmfr9fGWBqILClvWS6jNMVxc=;
 b=T+jxy38yzY5VeRwLYc0Bf24pkdOFZ79/oyzrMApW3imQrk6yglw37iXDxbjMm52usd8yUPS/RegUqswdRB+ofAinJV7lhpibBfXANWX6D8AZ1K/Mo9IMRKKXRq46ihhU52D+48Ce/qkI6shOMbn5+7N/cirR5VyVgsRnc7PxEh0Jz2dkkFUu5QK8LaNXb48lMFbzgepbC1GlA0NfOCo6t97cYyLPuSQbwk8SWLhB02vMsdiGe6vZ7yurUgR6trdPsXYloA6FnPjQZF7mIOHco6NjQ+45Cu5h0Ed9IaB9z18eWTD9E9gTITSMwMcEl6s2xUmNn2KspB5Hf9XmBLavgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqboQVx8R1d3+2wOicZCmfr9fGWBqILClvWS6jNMVxc=;
 b=kB0zlOHqiLIPJmwcWTPb96ArGde0IlIJgx3HzII7c1ivL3ebyFin46m+FOfB1tJ3tHhX1TmPGGTezPGJtVT6e7Wg92hr9Tw8yi78XVhf9JpvJXQt57jXJKcRUuw83cI1OgaPKgOke387CGo/kPZfn1cDhT9yg82b1Wnj5SjHy90=
Date: Tue, 16 Jun 2026 19:12:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22?] domctl: correct return value of
 XEN_DOMCTL_[gs]etvcpuaffinity
Message-ID: <ajGD6B4kHhCC9wql@macbook.local>
References: <8b7daaa3-418e-4ec7-90a6-775e0a964b76@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b7daaa3-418e-4ec7-90a6-775e0a964b76@suse.com>
X-ClientProxiedBy: BN9PR03CA0412.namprd03.prod.outlook.com
 (2603:10b6:408:111::27) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: 80910d34-5ca4-4ef0-c58e-08decbca6733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|3023799007|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Uxvdao0jWJMYBJQvUkyYsDVbnxcCgQkOm9BKMnMFcm7JVkuHaGGTgjCAJ0pDbJVkxhRHjqUvKxhlb2X8YqfoXctO28dGg5gUov+9snRM7O5dJnzeUX1nOX8WrrFc/jfY3QCGcYxRZbS8N9USrhafMuJcoOkphspY4f3CvOoITpTwtz7/mx/QJ+1go1UBNR2RWUK2nbABXFldYf0/6iUeXX6EfPsg+KjMMvt5vqxXFj7ST9pSOqqdbDHZpKfAbC+AS8XPMeuC+IJjHYhDQd7IpY0tgJtldTD8ZA5CKRKr9NQ/bfDlyAFluuVaW+DJuhUGeZxZmidq/zYSHlnDt+O/HmW6BthrVFpdUaYr1p0Hajr9lHI4J4//dzGqzVgaoSzxQmsG2x1TP54PEAEX++avx8KZs2YZfMNGCCnB7Gjmdpjc3fjRHArg0glSz39iESnM9QWlEgbKDAS9ZYLSmYxFq0unRER6rikQcD0HRZGwgtw3PKBweZ2grnoKUJZYDqv+oHuGLx5RtrE1oObQtCjx6DJeLDEZN5XGZ6ehojuAjfskGDyLFegGOQn5RdtIOq04cABoRshS9MYop6ynMZUxq74Hhk7eWCW+5tJhMA5eJEK8Iy9dqWLXMA9y0pwZiEj6uyYWCp6CQN1AZF38Mn0eiHFYd4R5iypeU5S9O3EFFy0Jq/VKhqXh5F4EypcGykTa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eENpZTRqUDlzcGhJZEhtYWxvTEFBSjdPeGxWZG5rWFhQbmV0M01rWlJYcHBN?=
 =?utf-8?B?djZISW4yU0duR051MU5qQ1B4SHZZa1lXRUx3aHVPRnEvY284V0tiK0RWSXdn?=
 =?utf-8?B?MGFmT1NDaXdWZjE1dGpyOFR4N1pXendBY0xaa3FRUldmcXRGYm9uMzJnNHBU?=
 =?utf-8?B?VFpYbXVtYVpYVzZGWGV1SmM3OWQvbHBDeG1XOUM1dmQ0elhuSWpUaWNRSVha?=
 =?utf-8?B?T05Na2hWbzJlNjFrMk5hTEJKVVVVSnNyOWNzRkw4bXNlYnRoNHkyVVJuOU9T?=
 =?utf-8?B?b1crbEpvRTBkeExEdkhOemR3SUk4aVVYeTI4M1FPNTNETG5rUEJFL1poSU92?=
 =?utf-8?B?Qzl1RGMzYWxmOUJCQzhHbk5USXkrWFpXUnNnSDZHbytFMS8rVytiSk5pOUQv?=
 =?utf-8?B?TTBGYWU4SjJ3dVpCYTJqaW4vRjdzWkQzbTdsOVZkbUlyM0RlSXY3MEw2dmdt?=
 =?utf-8?B?ZG5HdnNvdEhjWFhwR29VcXY0SHR2YjhWVWl2K0ROUmVBUUttUmNCZUVBQksw?=
 =?utf-8?B?ei9WM0lnRFJzWkJsNEFCWGZEYW9MYXhOUXcrMXFTVVcybzFPUVBMZTZPTEZ3?=
 =?utf-8?B?V2Fka1pWMkVTR3EvNnRxZVMvc1NaUSsxRUJXWXYwRzZ1aW84Nit5dk9TQXlI?=
 =?utf-8?B?VVc5QlAwb0VwQXduN1VaNW13WjB4SERKNXM5WTdURlFKMDZHeVk2aFl5MUUv?=
 =?utf-8?B?Z3JXejFJYmxUdGk5NnFqUzBlQlB5THI1bmUzcUllMFV1S3pVYkoyeVBvMjNq?=
 =?utf-8?B?R3lPMWdLSHdmMkZFck5SSjdKNVJzS2hkLzROZi9PaGpIOFNqWjNab3ZoUTUr?=
 =?utf-8?B?eklKN2puaHZpT2tXN2l5WThVRnlQT25JVFBXK0tvcllsVWozTlBpSUxvUE5H?=
 =?utf-8?B?UFI2VDdXNmJLNTdYamNOVndlcmtYNEFqcUYySWRvNERqWEpjUXg0NDBMTlAr?=
 =?utf-8?B?YkpoSHRBQmM4MklheS85M2FGckxNaUNSdE5KM2UyekNCSjlLQndmQkVnMHFh?=
 =?utf-8?B?K1dsVHY4dUJmU0Q1QmR0MkNvTVkrT1JPSnlkQkMwOWpwcUxndWIyeUw5UGxi?=
 =?utf-8?B?bnNtTzNQUVN4aW9aNHNLaWZ5WnIrM3c4cDFWUVMvWDd4UmV2Z09UZm0xRHVj?=
 =?utf-8?B?L01rUWJybm8wQ0FRUnR0OHZQeGs4QnFNVkszcWJFaVhlaGFjdmQxQ2VpREVO?=
 =?utf-8?B?R0JaQVlRVEtJV1NBY1ZUQkF6UUZ5YWh2eW9JVWF1ZXRkbElQNkJvTlFDRmV1?=
 =?utf-8?B?QjNxSFBBbXBGOExMcmVpT1FtZGtKV1dEc2c2QnZ0QWJjeVdFT2UwQ3UrRlg0?=
 =?utf-8?B?N0U3dDg5UmZVeXRYaGdYNHNlRkNSWTlUdGorckFON005b0ZKWEJ0WG9kb2w3?=
 =?utf-8?B?VDJ0OVljUm9MNm5FRkExNndtSkFIR2I2NXNrYVd2d3pFRUhXdGlMYno3T0Ix?=
 =?utf-8?B?dndXc2pDcWZDVDNUNkFXNEZWZGdwcm9VcTBobFFKdTkzTmY4Z0tTbHFYVHcy?=
 =?utf-8?B?K2dId0RUajcvZVpVbzY4QkFKUHcvc3pYYUhVNVQ4WkJqd3ZlSExodFVDb0RB?=
 =?utf-8?B?dlN5RWpZa0ZwYVMzRUZMTWl2MXhDUEE3Y3h3T0tDSDFDRUJVcnlxRDArK2Ir?=
 =?utf-8?B?amhJaUNSSWdlWVFCN1B3M3pxeERNVHFHYm00eEdmWTIwV0FhMlBPY3dzVGNj?=
 =?utf-8?B?U1FvZ1hudHJFNDUzSVIyZWhyZFVuVW5tZk5SM25uSXdjNmEzOFZFb0U4R1By?=
 =?utf-8?B?VERvbkxobEJCY3ZpUU1XR0dSTjkzbmwzM3ZDU2t6Y2lmL2JTSTVrbmJGRFlJ?=
 =?utf-8?B?UHZRTGVEQmtuN2FyMWcxVkx3aDNRNWJBcDdPZXZqK2tmTU4yYUJMWUxXdXF5?=
 =?utf-8?B?TFAzYVBJeFdLc0NoSFNvelJ0dkZRTW15WUpqbzYvT25sMHl6ZGRZMW5PbUJx?=
 =?utf-8?B?cHVka2FTSXRCZkxENzcwYXFyeTJzaW9oZ3hSWk5FOHN0OFZ0OXU2b0xvQjg1?=
 =?utf-8?B?YVdxTFhHUUlNa016eDhmSC9YOGtnUVR1RUxKY3pkaDBLb2g4TmloOFJlZUNr?=
 =?utf-8?B?UVhXT0lRQ1RONCtQZGs5NlRsSVF5eEJQbVdEdEY3ODNJNGlJT25aRTB6VDhJ?=
 =?utf-8?B?Vi94T1NZOUZXajVmMlBKNzh0THpGU0UxWEsvYVoxVW9FdzBQajJBN3pWS3ZI?=
 =?utf-8?B?WG5FcURuYzk5Nk5TcTFXRUg2bnBURzNwRE00aC9IUEhYbHY3Ly9oSmtMMzda?=
 =?utf-8?B?U2ZpS2RXOG9WeTZseHorVGNUajYyOEZXK1RKT05iUHp2N1dyY2FKSjBvcjg5?=
 =?utf-8?B?MldZYTBzaVVlWjVCY0hkV2NHbW04cnJaYXFLMTFFcFh3UGgrc1RkZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80910d34-5ca4-4ef0-c58e-08decbca6733
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:12:11.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0UmwKNluBedCKK4/dbgcI1UlmHFEAVQQlK7UDH0U0iUjLs1/xCFmf29xqx7GEovi5xKAvVAUB6tnTNURTU5bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5001
X-purgate-ID: tlsNG-4011c0/1781629936-7E9888B7-C29311AB/0/0
X-purgate-type: clean
X-purgate-size: 3097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,xenproject.org,gmail.com];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,macbook.local:mid,citrix.com:dkim,citrix.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56D85692DFB

On Mon, Jun 15, 2026 at 02:00:39PM +0200, Jan Beulich wrote:
> cpumask_to_xenctl_bitmap() may return errors. Clearing the error indicator
> of an earlier such call by a (successful) later call is misleading the
> caller. For "set", keep setting soft affinity if the hard affinity copy-
> back fails; only accumulate respective errors.
> 
> While fiddling with return values, also drop a redundant clearing of
> "ret". This eliminates a Misra C:2012 rule 2.2 ("There shall be no dead
> code") violation.
> 
> Fixes: 6e4ecc6d5884 ("sched: DOMCTL_*vcpuaffinity works with hard and soft affinity")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1705,6 +1705,7 @@ int vcpu_affinity_domctl(struct domain *
>      {
>          cpumask_var_t new_affinity, old_affinity;
>          cpumask_t *online = cpupool_domain_master_cpumask(v->domain);
> +        int hret = 0;
>  
>          /*
>           * We want to be able to restore hard affinity if we are trying
> @@ -1726,8 +1727,6 @@ int vcpu_affinity_domctl(struct domain *
>          if ( vcpuaff->flags & XEN_VCPUAFFINITY_FORCE )
>              vcpu_temporary_affinity(v, NR_CPUS, VCPU_AFFINITY_OVERRIDE);
>  
> -        ret = 0;
> -
>          /*
>           * We both set a new affinity and report back to the caller what
>           * the scheduler will be effectively using.
> @@ -1746,7 +1745,7 @@ int vcpu_affinity_domctl(struct domain *
>               * cpupool's online mask and the new hard affinity.
>               */
>              cpumask_and(new_affinity, online, unit->cpu_hard_affinity);
> -            ret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_hard, new_affinity);
> +            hret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_hard, new_affinity);
>          }
>          if ( vcpuaff->flags & XEN_VCPUAFFINITY_SOFT )
>          {
> @@ -1777,6 +1776,8 @@ int vcpu_affinity_domctl(struct domain *
>              ret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_soft, new_affinity);
>          }
>  
> +        ret = hret ?: ret;

Here you seem to have a preference to keep the error from the first
caller (possibly XEN_VCPUAFFINITY_HARD if set), but below...

> +
>   setvcpuaffinity_out:
>          free_cpumask_var(new_affinity);
>          free_cpumask_var(old_affinity);
> @@ -1788,7 +1789,7 @@ int vcpu_affinity_domctl(struct domain *
>                                             unit->cpu_hard_affinity);
>          if ( vcpuaff->flags & XEN_VCPUAFFINITY_SOFT )
>              ret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_soft,
> -                                           unit->cpu_soft_affinity);
> +                                           unit->cpu_soft_affinity) ?: ret;

...you overwrite it with a possible error returned from the last
cpumask_to_xenctl_bitmap() call.  Don't you want to do the same, and
return the first error if possible?  IOW: store the error from the
first call into hret and use the elvis operator to set ret after both
calls.

Thanks, Roger.

