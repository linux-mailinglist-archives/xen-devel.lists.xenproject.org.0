Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFIxCFWz6GmIOwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:39:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAD244583D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290354.1569964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVum-0008F5-M5; Wed, 22 Apr 2026 11:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290354.1569964; Wed, 22 Apr 2026 11:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVum-0008C1-JH; Wed, 22 Apr 2026 11:38:44 +0000
Received: by outflank-mailman (input) for mailman id 1290354;
 Wed, 22 Apr 2026 11:38:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wFVuk-0008Bs-8J
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:38:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFVui-00F6tt-3R
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:38:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e8b33f-e002-0a2a0a5209dd-0a2a4505df3e-10
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:38:41 +0200
Received: from [52.101.61.54]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e8b33f-aaa8-0a2a45050019-34653d362499-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:38:41 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CY1PR03MB8148.namprd03.prod.outlook.com (2603:10b6:930:105::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 11:38:37 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 11:38:37 +0000
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
 b=jlvc1dipUSw14Rck/s6sIfmOiv+yl8wNJxaYSksvvtM9prQalDYiI62HCFAF5XdNsqeVNX/obOMWqRwENib5QpbNckxtWTnwsS/Fpf6dby3wRPeERJtoS+LhMj/PynuOoZoD+cmBk8A0iDxtb4LNyDOrJQltC2Lp60V6orTpYVKL1aU1XrJ5yXfBoK9vJ6gwKY1rkWN/6UOI5VcxhVZ1cb8JkJYgfCiuTtO71FC0yA9XlGQhkS68M8HkqG6U3oYcr7Y6MIpVpY/a28tNyRJAOwccT40nYNofPz2zTSx3xM3mwXpbD5FD3sG9R4ueRNrMY4lPH55MnavFc30nJZ1h8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PdaqyKxYbueegbEhherWhj+6VgJE9+E5z6YUh+hXGU=;
 b=XZdOjeDrNQdzia7DETfPu0fG6b+SfloBJXxbFeyLigftbq35c4OiSK/Npexz4sZFtByLXtE5+nOH7Ic4vaxK7yVF6biaXIfJEx64mA187lK58YQPVxXs7Z7R/IsRU2jxAllg93RGxKF9TcGaqTpilnvZj5mfVx5whBtmDnOJNJ88nld3OXb7pKD2p7ImqAIwGLNcEw1f/Wb1amjmG92z3x2MKMK7b2TUdYZBLhyIRtuoHeif8rdYxV5KrGnJRovGWa+vkbvkgiV9nG4kkk7lgI8jNZyuVkI7W1scQ2SbOLyBCt4tenFTTISjmhTuqfJEMWUJlAIomG3r7yDwPcN7fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PdaqyKxYbueegbEhherWhj+6VgJE9+E5z6YUh+hXGU=;
 b=dy43aJyY0mnC8LUiNTJydv1p2e/k7BoGS78fUcjf+54aBEcy97En9JA/CN73uRE610XHGiQWkrRy+SA3Sv/0yHu18K3THb3Z4awznp3Npym1JHQ0cTIeNnlA3ugT/NEx7/RrO3CF5J3p5ULiuEnfI7YHYCrsNl9JammOBlkfYVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 22 Apr 2026 13:38:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 4/7] vpci: allow queueing of mapping operations
Message-ID: <aeizOTxvSXlLKGHX@macbook.local>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <97e3323363ab442ccb21a00d5ed0488b6672870a.1775742115.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <97e3323363ab442ccb21a00d5ed0488b6672870a.1775742115.git.mykyta_poturai@epam.com>
X-ClientProxiedBy: MA4P292CA0013.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CY1PR03MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca57e98-e3bd-461b-81cc-08dea063b126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	L6jCo6dxWaXbFN9EefCN6y9WpelRvxeE0xHh5vMiCHp+izEBbUu2pdtLwN03qMOJLj3PRbsnDSq5cCpZ+/y+Ichuq2x/K3cbzh7McMOkIjv5oEb/GsFjrMw9zhQtvwXbK7prNI7/z+EjB4o9/BDa2vMLidNVA4L5vpZudIr0DgE5TQigX+NIQhZ8ahkkTOZ3kEccHJJfLpQAEq5RqlXrBkl+BppjbRzemigdb8A9vKzpVe4xLdEUYrehuUpBFCEnLJoc7nV6plMTHyN/+iEfuQzNaV84IWX4Ii5WiwWVkr7iwfkEiOmKwFDuzPx5Nu5Ghb29CyLb5i0zYH8J90/+HC7mO+c6CijQ1Wkz/pEh3C9Lc2xOaP2f2EHn4sGQHOuTv3ESgB06C+IhGNYHeMN42nrc2eCg3uZdAr92rQdEYUJJ2s7HLB1qRQuXv/vws/0hslfRqugFF/krbebJfB4I1mMB7uFuJ3/VawdcHXBqRcOZ/rLETCD3OWOMMy9VCNC5D6U3kuqRheOtPfgsP8GmV3MvhVjBKyTeyi8aCRMNA/syQPvKJGCavrZIFY/14unz73VN29Rz0TVvP2uJeIlvYEuiDRTd7Ygs+Ac6lxJ7b+lQ9Puqub1Z96Jp6N3WxXBIkfBpOspJO7SH9xKJlr/mmYunk5vyGVQJgqk+w9ZdZA/Rx3jli5JvD1YgVnGV1w13
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWxJODVKQWJacHdCdkNzQ29qL1BQSjRZcXJTdEhSUHA0cjJTdldSa1hYd0xl?=
 =?utf-8?B?bXhKN0JTYllNM1NuZmc4YUh1b0xuR1VKZkJJdDgzdHcwNlRWWFJzSm9acUdF?=
 =?utf-8?B?QU5DSzBzRkJKbkQwQ0xVM1lhZGhNdVorRkFHdi9nZjFKWTFDQldwU0pESDFq?=
 =?utf-8?B?QnN3NjhTcWJaNXJCRVJ1UkxrenA1Nm4rTklIZUhPU0hGbnMzQVlrU3czdVNn?=
 =?utf-8?B?dzRVTjd0L3EwVnQ1M29YaFl2cktmYk1zc0xWSEEySE9nV1NsZUVFSzN2VXhl?=
 =?utf-8?B?d01YbXYwcUgxRGw4S0JpWS9vQ3owSTFoMy9CS09peVZFdXNaQVVEMVlnYUdz?=
 =?utf-8?B?VHNWZTBJMkhmdkJBVnhLZnN6Z3pVSUh3ekRpWkFGMmhmTDF1YVc3cWdqTmxJ?=
 =?utf-8?B?VlU0YTlHWlROK3kxS1dJWWZ5bDZxTkFHMEhEL01vU3krU0JsY2ZVNTVxQUVM?=
 =?utf-8?B?RDlTNUZEZTdMV2swdUFRRHl0cm5LcDNzVUNEamovK2FvWmR2cWI3K0FxaVdz?=
 =?utf-8?B?bmREQStUcEpTdTU5MEpHUFpCZGFWQXY0MnRGYUdudDhHc3dyTUFBRmd3REkx?=
 =?utf-8?B?d2V2dnNBZysvbVA4cGNFdFV4eVljdnA1dkxlUlUrTlNTQnJkci9CcW9NQ09r?=
 =?utf-8?B?YVNSVWwxSWNwa2tSa2xsMnY4SXZzZ0JXTVlORGhBUUxpV1U2czJYTVhOU1Vz?=
 =?utf-8?B?S216SFd3M1R6eTZCLzExZER0NkhackM2UWtXaW1mTVVSeWNFOGNWMnZKdWhN?=
 =?utf-8?B?eC9qZllkRHdMSXo0YTBxQXB6ZWIrTDFmU2xscThvcndRMTd2QlJJdjdRb3pX?=
 =?utf-8?B?bHlKRWhLVk92UFRya245WHFSbTBMdEgyVTM3aTk5SjV5SWhlZng3ZXAwOUhD?=
 =?utf-8?B?UGFkYVVUamdtaDdoUDkrQnowRnFRMG5hd0tLdmJYVUFBcGFDMmhlQU56RHpn?=
 =?utf-8?B?UXRiVFNlcG5SZEFoTWpZVlhTUUNob0diWXVUUlZvSzIwR01mU1l5UlhVM0lM?=
 =?utf-8?B?ODBWSURBRmRhZHYralJob3JmaXR5SmdJdnZjVUttYnNiRk1EbktiaTVuM0pE?=
 =?utf-8?B?dnNyYitKYjQweDhFZ3JlcUI4WDlVRGFzaWloU1MxVnBIcE9sejh1Ylh5d2Zk?=
 =?utf-8?B?cklsRHptamZjREoybHNiZWhIVXBsVXlNN3J5TnIzZU5HcnE5Yjd1T1JPOTZB?=
 =?utf-8?B?MS9xb3BheWtQZ2MycGpYT3NnTGxsYlFMc21OMVBXaTlCOTA4c0I3V1hFYSsw?=
 =?utf-8?B?dElGRW0yeGVGbXJTRUQ4aDRuelh0OWNsNktxeEZobERVZ3Mzb0hLZktENng1?=
 =?utf-8?B?R2c1Q3o4RmVYblh4eEN5aXBWaWN4M0RtRU1ESGIzQjRyUU1DWnpTUTU2S0l5?=
 =?utf-8?B?NXZQK2xLL2hEV2wzYXR3VUFmUXhHeWp1cTh3RzNYVUFPY2Q0RHUxQ2dHMzZL?=
 =?utf-8?B?RktIbG5pa29kNmg1QzVibVhINnRQUjlXNmdBYktHR05jVGJrSzNEYjJaVnFq?=
 =?utf-8?B?SEEwa1JSbktEeE1PNnpoM2VvQ3RBSUFEVi9zUmM5bkppRStxRHFRbkpBUkpW?=
 =?utf-8?B?eUFtMElqTmt5VExZUVhYUTV4UmM5YkkwMEluTTRuRkd4b1FPeWpjYjI3VlBO?=
 =?utf-8?B?UXdZYnN2YVBlZzcvQkZ5TUZkWHhTUlAxZU4yZGZyNjRjQjRya1hjT1pIeVU3?=
 =?utf-8?B?djhrb0V3MW1FeWFlQmlIMkZFZyt6b0lVTTV0MUVwZHc2RDlyWjFuS3hhMExy?=
 =?utf-8?B?RnNuMkdudk9VNjdsU05ILzVBWVVnd08wbzdkRk5LTWRueWFaQnA0bGpTZGVS?=
 =?utf-8?B?NzhHNVBST3FIaEhCcUNURm94dHBpUEMvTXlXVG93RmlEd21ockx3NGNBVGZO?=
 =?utf-8?B?WEVKQ1RKZWY2YjFzYUZKU3RxNnpnV1Qzd1czc1FJNlhUOXNuUEl0cDAvS3BV?=
 =?utf-8?B?MUNpZERUQ3FWdzVVUnlFYlQ2MTU1d0xCeGtIM0hJYy9RaUJDLzVaaW8zcVNt?=
 =?utf-8?B?S1NMN1BpRGs4WkRPK280TTcwVHVwRTFxT0dHUEVhcHdWbXFxeDlva0RHWllD?=
 =?utf-8?B?SHdzcGlkT1QxVitxNnZTSlpDLzNNcHFuT0crOHpKTVFGZGZmZjhuSmwrdDlU?=
 =?utf-8?B?di9SZXR5RkNGNVMrUnprbEJ6T1UydGMwNjZlbjNHbDM2emF6dVNLZjhzQVZS?=
 =?utf-8?B?TkpNaTYxalA2NEZyUkVZZHFENDdVWWNqaFlYTzR2MWFXQUk2dVVqUUE2RkJh?=
 =?utf-8?B?SGs0UmFiSU8xaWxwUGNBdGdGbzZHUkcybDZYS3RLRDQrNWpETVZmS2NncllS?=
 =?utf-8?B?aGFSV1VpUjNRRUN4QTBXczJZZTQzemgrTzNIa2Z6QkJ3M0h0ZUs5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca57e98-e3bd-461b-81cc-08dea063b126
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 11:38:36.9226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWkzxUsEUSPccQaAsceBAySJoBUV3hRYhpL9ZCR6RwWRhK+zt8Cs4meg/20pfZ0TY27nGywCnErTn2BJPEVB8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB8148
X-purgate-ID: tlsNG-c201ff/1776857921-E09AD443-E3C232EE/0/0
X-purgate-type: clean
X-purgate-size: 20943
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid,citrix.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4BAD244583D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 02:01:33PM +0000, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Introduce vPCI BAR mapping task queue. Store information needed to
> map/unmap BARs in struct vpci_map_task. Allow queueing of BAR map/unmap
> operations in a list, thus making it possible to perform multiple p2m
> operations associated with single PCI device.

I would replace "single PCI device" with "single PCI config space
register access", it's more specific.

> This is preparatory work for further changes that need to perform
> multiple unmap/map operations before returning to guest.
> 
> At the moment, only a single operation will be queued. However, when
> multiple operations are queued, there is a check in modify_bars() to
> skip BARs already in the requested state that will no longer be
> accurate. Remove this check in preparation of upcoming changes.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Message-ID: <20260406191203.97662-3-stewart.hildebrand@amd.com>

I think you also need to add your SoB if you add it to your series.

> ---
> v2->v3:
> * new patch in this series, borrowed from [1]
> 
> [1]: https://patchew.org/Xen/20260406191203.97662-1-stewart.hildebrand@amd.com/20260406191203.97662-3-stewart.hildebrand@amd.com/
> ---
>  xen/common/domain.c        |   5 +-
>  xen/drivers/vpci/header.c  | 227 ++++++++++++++++++++++++++-----------
>  xen/drivers/vpci/vpci.c    |  28 +----
>  xen/include/xen/rangeset.h |   7 --
>  xen/include/xen/vpci.h     |  21 ++--
>  5 files changed, 179 insertions(+), 109 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 5ef7db8f09..b1931be987 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -455,8 +455,6 @@ static int vcpu_teardown(struct vcpu *v)
>   */
>  static void vcpu_destroy(struct vcpu *v)
>  {
> -    vpci_vcpu_destroy(v);
> -
>      free_vcpu_struct(v);
>  }
>  
> @@ -514,8 +512,7 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>      if ( arch_vcpu_create(v) != 0 )
>          goto fail_sched;
>  
> -    if ( vpci_vcpu_init(v) )
> -        goto fail_sched;
> +    vpci_vcpu_init(v);
>  
>      d->vcpu[vcpu_id] = v;
>      if ( vcpu_id != 0 )
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 5bfb541b6a..451cdd3a6f 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -23,6 +23,7 @@
>  #include <xen/lib.h>
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
> +#include <xen/xvmalloc.h>
>  
>  #include <xsm/xsm.h>
>  
> @@ -35,7 +36,7 @@
>  
>  struct map_data {
>      struct domain *d;
> -    const struct vpci_bar *bar;
> +    const struct vpci_bar_map *bar;
>      bool map;
>  };
>  
> @@ -174,32 +175,20 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>          ASSERT_UNREACHABLE();
>  }
>  
> -bool vpci_process_pending(struct vcpu *v)
> +static int vpci_process_map_task(const struct pci_dev *pdev,
> +                                 struct vpci_map_task *task)
>  {
> -    const struct pci_dev *pdev = v->vpci.pdev;
> -    struct vpci_header *header = NULL;
>      unsigned int i;
>  
> -    if ( !pdev )
> -        return false;
> -
> -    read_lock(&v->domain->pci_lock);
> -
> -    if ( !pdev->vpci || (v->domain != pdev->domain) )
> -    {
> -        v->vpci.pdev = NULL;
> -        read_unlock(&v->domain->pci_lock);
> -        return false;
> -    }
> +    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>  
> -    header = &pdev->vpci->header;
> -    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
>      {
> -        struct vpci_bar *bar = &header->bars[i];
> -        struct rangeset *mem = v->vpci.mem[i];
> +        struct vpci_bar_map *bar = &task->bars[i];
> +        struct rangeset *mem = bar->mem;
>          struct map_data data = {
> -            .d = v->domain,
> -            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> +            .d = pdev->domain,
> +            .map = task->cmd & PCI_COMMAND_MEMORY,
>              .bar = bar,
>          };
>          int rc;
> @@ -210,58 +199,116 @@ bool vpci_process_pending(struct vcpu *v)
>          rc = rangeset_consume_ranges(mem, map_range, &data);
>  
>          if ( rc == -ERESTART )
> -        {
> -            read_unlock(&v->domain->pci_lock);
> -            return true;
> -        }
> +            return rc;
>  
>          if ( rc )
>          {
>              spin_lock(&pdev->vpci->lock);
>              /* Disable memory decoding unconditionally on failure. */
> -            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
> -                            false);
> +            modify_decoding(pdev, task->cmd & ~PCI_COMMAND_MEMORY, false);
>              spin_unlock(&pdev->vpci->lock);
>  
> -            /* Clean all the rangesets */
> -            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> -                if ( !rangeset_is_empty(v->vpci.mem[i]) )
> -                     rangeset_purge(v->vpci.mem[i]);
> +            if ( !is_hardware_domain(pdev->domain) )
> +                domain_crash(pdev->domain);
> +
> +            return rc;
> +        }
> +    }
> +
> +    spin_lock(&pdev->vpci->lock);
> +    modify_decoding(pdev, task->cmd, task->rom_only);
> +    spin_unlock(&pdev->vpci->lock);
> +
> +    return 0;
> +}
> +
> +static void destroy_map_task(struct vpci_map_task *task)
> +{
> +    unsigned int i;
> +
> +    if ( !task )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return;
> +    }
> +
> +    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
> +        rangeset_destroy(task->bars[i].mem);
> +
> +    xvfree(task);
> +}
> +
> +static void clear_map_queue(struct vcpu *v)
> +{
> +    struct vpci_map_task *task;
> +
> +    while ( (task = list_first_entry_or_null(&v->vpci.task_queue,
> +                                             struct vpci_map_task,
> +                                             next)) != NULL )
> +    {
> +        list_del(&task->next);
> +        destroy_map_task(task);
> +    }
> +}
> +
> +bool vpci_process_pending(struct vcpu *v)
> +{
> +    const struct pci_dev *pdev = v->vpci.pdev;
> +    struct vpci_map_task *task;
>  
> -            v->vpci.pdev = NULL;
> +    if ( !pdev )
> +        return false;
>  
> +    read_lock(&v->domain->pci_lock);
> +
> +    if ( !pdev->vpci || (v->domain != pdev->domain) )
> +    {
> +        clear_map_queue(v);
> +        v->vpci.pdev = NULL;
> +        read_unlock(&v->domain->pci_lock);
> +        return false;
> +    }
> +
> +    while ( (task = list_first_entry_or_null(&v->vpci.task_queue,
> +                                             struct vpci_map_task,
> +                                             next)) != NULL )
> +    {
> +        int rc = vpci_process_map_task(pdev, task);
> +
> +        if ( rc == -ERESTART )
> +        {
>              read_unlock(&v->domain->pci_lock);
> +            return true;
> +        }
>  
> -            if ( !is_hardware_domain(v->domain) )
> -                domain_crash(v->domain);
> +        list_del(&task->next);
> +        destroy_map_task(task);
>  
> -            return false;
> +        if ( rc )
> +        {
> +            clear_map_queue(v);
> +            break;
>          }
>      }
>      v->vpci.pdev = NULL;
>  
> -    spin_lock(&pdev->vpci->lock);
> -    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
> -    spin_unlock(&pdev->vpci->lock);
> -
>      read_unlock(&v->domain->pci_lock);
>  
>      return false;
>  }
>  
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> -                            uint16_t cmd)
> +                            struct vpci_map_task *task)
>  {
> -    struct vpci_header *header = &pdev->vpci->header;
>      int rc = 0;
>      unsigned int i;
>  
>      ASSERT(rw_is_write_locked(&d->pci_lock));
>  
> -    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
>      {
> -        struct vpci_bar *bar = &header->bars[i];
> -        struct rangeset *mem = current->vpci.mem[i];
> +        struct vpci_bar_map *bar = &task->bars[i];
> +        struct rangeset *mem = bar->mem;
>          struct map_data data = { .d = d, .map = true, .bar = bar };
>  
>          if ( rangeset_is_empty(mem) )
> @@ -281,15 +328,52 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>          }
>      }
>      if ( !rc )
> -        modify_decoding(pdev, cmd, false);
> +        modify_decoding(pdev, task->cmd, false);
>  
>      return rc;
>  }
>  
> -static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> +static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
> +                                            uint16_t cmd, bool rom_only)
> +{
> +    struct vpci_map_task *task;
> +    unsigned int i;
> +
> +    task = xvzalloc(struct vpci_map_task);
> +
> +    if ( !task )
> +        return NULL;
> +
> +    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
> +    {
> +        if ( !MAPPABLE_BAR(&pdev->vpci->header.bars[i]) )
> +            continue;
> +
> +        task->bars[i].mem = rangeset_new(pdev->domain, NULL,
> +                                         RANGESETF_no_print);
> +
> +        if ( !task->bars[i].mem )
> +        {
> +            destroy_map_task(task);
> +            return NULL;
> +        }
> +
> +        task->bars[i].addr = pdev->vpci->header.bars[i].addr;
> +        task->bars[i].guest_addr = pdev->vpci->header.bars[i].guest_addr;
> +    }
> +
> +    task->cmd = cmd;
> +    task->rom_only = rom_only;
> +
> +    return task;
> +}
> +
> +static void defer_map(const struct pci_dev *pdev, struct vpci_map_task *task)
>  {
>      struct vcpu *curr = current;
>  
> +    ASSERT(!curr->vpci.pdev || curr->vpci.pdev == pdev);
> +
>      /*
>       * FIXME: when deferring the {un}map the state of the device should not
>       * be trusted. For example the enable bit is toggled after the device
> @@ -297,8 +381,8 @@ static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       * started for the same device if the domain is not well-behaved.
>       */
>      curr->vpci.pdev = pdev;
> -    curr->vpci.cmd = cmd;
> -    curr->vpci.rom_only = rom_only;
> +    list_add_tail(&task->next, &curr->vpci.task_queue);
> +
>      /*
>       * Raise a scheduler softirq in order to prevent the guest from resuming
>       * execution with pending mapping operations, to trigger the invocation
> @@ -313,11 +397,17 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      struct pci_dev *tmp;
>      const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
> +    struct vpci_map_task *task;
>      unsigned int i, j;
>      int rc;
>  
>      ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>  
> +    task = alloc_map_task(pdev, cmd, rom_only);
> +
> +    if ( !task )
> +        return -ENOMEM;
> +
>      /*
>       * Create a rangeset per BAR that represents the current device memory
>       * region and compare it against all the currently active BAR memory
> @@ -333,19 +423,18 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> -        struct rangeset *mem = current->vpci.mem[i];
> +        struct rangeset *mem = task->bars[i].mem;
>          unsigned long start = PFN_DOWN(bar->addr);
>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>          unsigned long start_guest = PFN_DOWN(bar->guest_addr);
>          unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
>  
> -        ASSERT(mem);
> +        if ( !mem )
> +            continue;
>  
>          if ( !MAPPABLE_BAR(bar) ||
>               (rom_only ? bar->type != VPCI_BAR_ROM
> -                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
> -             /* Skip BARs already in the requested state. */
> -             bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
> +                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
>              continue;
>  
>          if ( !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
> @@ -368,7 +457,8 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              gprintk(XENLOG_G_WARNING,
>                      "%pp: can't map BAR%u - offset mismatch: %#lx vs %#lx\n",
>                      &pdev->sbdf, i, bar->guest_addr, bar->addr);
> -            return -EINVAL;
> +            rc = -EINVAL;
> +            goto fail;
>          }
>  
>          rc = rangeset_add_range(mem, start_guest, end_guest);
> @@ -376,13 +466,13 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
>                     start_guest, end_guest, rc);
> -            return rc;
> +            goto fail;
>          }
>  
>          /* Check for overlap with the already setup BAR ranges. */
>          for ( j = 0; j < i; j++ )
>          {
> -            struct rangeset *prev_mem = current->vpci.mem[j];
> +            struct rangeset *prev_mem = task->bars[j].mem;
>  
>              if ( rangeset_is_empty(prev_mem) )
>                  continue;
> @@ -393,7 +483,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  gprintk(XENLOG_WARNING,
>                         "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
>                          &pdev->sbdf, start_guest, end_guest, rc);
> -                return rc;
> +                goto fail;
>              }
>          }
>  
> @@ -403,7 +493,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              gprintk(XENLOG_WARNING,
>                      "%pp: failed to sanitize BAR#%u memory: %d\n",
>                      &pdev->sbdf, i, rc);
> -            return rc;
> +            goto fail;
>          }
>      }
>  
> @@ -414,9 +504,9 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>          unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
>                                       vmsix_table_size(pdev->vpci, i) - 1);
>  
> -        for ( j = 0; j < ARRAY_SIZE(current->vpci.mem); j++ )
> +        for ( j = 0; j < ARRAY_SIZE(task->bars); j++ )
>          {
> -            struct rangeset *mem = current->vpci.mem[j];
> +            struct rangeset *mem = task->bars[j].mem;
>  
>              if ( rangeset_is_empty(mem) )
>                  continue;
> @@ -427,7 +517,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  gprintk(XENLOG_WARNING,
>                         "%pp: failed to remove MSIX table [%lx, %lx]: %d\n",
>                          &pdev->sbdf, start, end, rc);
> -                return rc;
> +                goto fail;
>              }
>          }
>      }
> @@ -471,7 +561,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
>                  {
>                      const struct vpci_bar *bar = &header->bars[j];
> -                    struct rangeset *mem = current->vpci.mem[j];
> +                    struct rangeset *mem = task->bars[j].mem;
>  
>                      if ( !rangeset_overlaps_range(mem, start, end) ||
>                           /*
> @@ -490,7 +580,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                          gprintk(XENLOG_WARNING,
>                                  "%pp: failed to remove [%lx, %lx]: %d\n",
>                                  &pdev->sbdf, start, end, rc);
> -                        return rc;
> +                        goto fail;
>                      }
>                  }
>              }
> @@ -513,12 +603,19 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>           * will always be to establish mappings and process all the BARs.
>           */
>          ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
> -        return apply_map(pdev->domain, pdev, cmd);
> +        rc = apply_map(pdev->domain, pdev, task);
> +        destroy_map_task(task);
> +        return rc;
>      }
>  
> -    defer_map(pdev, cmd, rom_only);
> +    defer_map(pdev, task);
>  
>      return 0;
> +
> + fail:
> +    destroy_map_task(task);
> +
> +    return rc;
>  }
>  
>  static void cf_check cmd_write(
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index d069ca6d9c..ce9fb5b357 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -24,33 +24,9 @@
>  
>  #ifdef __XEN__
>  
> -void vpci_vcpu_destroy(struct vcpu *v)
> +void vpci_vcpu_init(struct vcpu *v)
>  {
> -    if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
> -        return;
> -
> -    for ( unsigned int i = 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
> -        RANGESET_DESTROY(v->vpci.mem[i]);
> -}
> -
> -int vpci_vcpu_init(struct vcpu *v)
> -{
> -    unsigned int i;
> -
> -    if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
> -        return 0;
> -
> -    for ( i = 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
> -    {
> -        char str[32];
> -
> -        snprintf(str, sizeof(str), "%pv:BAR%u", v, i);
> -        v->vpci.mem[i] = rangeset_new(v->domain, str, RANGESETF_no_print);
> -        if ( !v->vpci.mem[i] )
> -            return -ENOMEM;
> -    }
> -
> -    return 0;
> +    INIT_LIST_HEAD(&v->vpci.task_queue);
>  }
>  
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
> index f01e00ec92..817505badf 100644
> --- a/xen/include/xen/rangeset.h
> +++ b/xen/include/xen/rangeset.h
> @@ -40,13 +40,6 @@ struct rangeset *rangeset_new(
>  void rangeset_destroy(
>      struct rangeset *r);
>  
> -/* Destroy a rangeset, and zero the pointer to it. */
> -#define RANGESET_DESTROY(r)  \
> -    ({                       \
> -        rangeset_destroy(r); \
> -        (r) = NULL;          \
> -    })

You introduce this in the previous patch, and removing it in the next
patch?  Please try to avoid such spurious usage, it's not good to
waste effort reviewing newly introduced code that's to be removed by
a patch in the same series.

Unless very special cases, we usually recommend submitters to attempt
to make sure code introduced in a patch series is consistent, so that
we don't end up in a situation like this where you are removing a lot
of code that was introduced by the previous patch.

You likely want to split the changes slightly differently here, maybe
the previous patch should introduce the non-functional changes, like
the change to use mem instead of bar->mem or similar, and one patch
that introduces the usage of the linked-list task queue.

> -
>  /*
>   * Set a limit on the number of ranges that may exist in set @r.
>   * NOTE: This must be called while @r is empty.
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index b55bacbe6e..e34f7abe6d 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -19,8 +19,7 @@
>   */
>  #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
>  
> -void vpci_vcpu_destroy(struct vcpu *v);
> -int vpci_vcpu_init(struct vcpu *v);
> +void vpci_vcpu_init(struct vcpu *v);
>  
>  /* Assign vPCI to device by adding handlers. */
>  int __must_check vpci_assign_device(struct pci_dev *pdev);
> @@ -155,14 +154,23 @@ struct vpci {
>  };
>  
>  #ifdef __XEN__
> -struct vpci_vcpu {
> +struct vpci_map_task {
>      /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
> -    const struct pci_dev *pdev;
> -    struct rangeset *mem[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
> +    struct list_head next;
> +    struct vpci_bar_map {
> +        uint64_t addr;
> +        uint64_t guest_addr;
> +        struct rangeset *mem;
> +    } bars[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];

I'm a bit puzzled (possibly missing something), but why are you
keeping this vpci_bar_map array here?  AFAICT map tasks are allocated
on-demand after this change (by using {alloc,destroy}_map_task()).

Thanks, Roger.

