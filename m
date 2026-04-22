Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ELJClGS6Gl9MgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:18:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA3F443D4D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290047.1569712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFThf-0005Ii-Pj; Wed, 22 Apr 2026 09:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290047.1569712; Wed, 22 Apr 2026 09:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFThf-0005Gn-Mq; Wed, 22 Apr 2026 09:17:03 +0000
Received: by outflank-mailman (input) for mailman id 1290047;
 Wed, 22 Apr 2026 09:17:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wFThe-0005Gh-SF
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:17:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFThe-00ALkI-8u
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:17:02 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e89208-5cb7-0a2a0a5109dd-0a2a450c847c-44
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:17:02 +0200
Received: from [52.101.62.25]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e8920c-62f1-0a2a450c0019-34653e1917f9-4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:17:01 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA0PR03MB5387.namprd03.prod.outlook.com (2603:10b6:806:b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Wed, 22 Apr
 2026 09:16:58 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 09:16:52 +0000
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
 b=Z7tCRNbIc4yTh4Nd8f4C2fDU7EHyfci1aU9XNI5TmqgVuTtfN/ZziwEqrS+YJhSjV2wiBj0C/jSNi/iX+TzSVLd2pf4ct0TnLZ4EWKw/ur6dtu8Deo/bsIuezCxFv3TSyOIfCg9jO4cpNb3dLjcWbbMEyE9lkpqw/u3mNrkbdAXxBwrjak+WeKcuSYXCpPqsDzYBclRaxhWUFZMsHE2eln/KGXs4ImPelUQYWMHfA1eQ38FKulIWjnDRWlq6S9GTqbVZr07YpbIT5sQ87STyQm9jtjkzdRj3RpBNLK1RkmhPBVfo70Xvj5GDBz5sxTC3kg6SiSOTW9OHJYTUZdj6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0g+DKLwwSWmGv/p05bqXC3pdcOBiysUhfepuiPPNkAA=;
 b=qzNKR9W5MPKg8UvdhtuWW2V2eYZ6VoOR6BhtaF4fgZwhUrrJah5XcS4ezIlG//RYgfU8vfpUN6QAs/XGT+nwKTB93pi4VxJ05ZtZeWnWmRy5GJiyfzIpAR6M3buu0yuWlxS7SJYPXHqFxp08zjaXxxKwGGrIY0GmPYmsPISajqserK2+ZoxOnD+Ek16hN+6bxjbaqqbwWwo7rj2MGB09Ycur1+yAQ8zz6wOnSxYUPhupjt7AJfXSwb1w3DL9yY6WqeULoXvmSh2bMVm55ObXGVeEe14045jXkiaDFPHViHUDbsiZo9Ils/v/eZqw/xg4T/KI3tB3AT5jtVPzpyzZSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g+DKLwwSWmGv/p05bqXC3pdcOBiysUhfepuiPPNkAA=;
 b=NHzuZGkp+UCZ/P5MOSKpKYE41Vjc3+UpZO3YUHQ5Y/JqV0wJiIeVoGwl/GL7ttFU35rVf+j31/vZWgWmFFO1dLwPhZGLR3h5mS4QKr0fwNm6SU2LI2RTf8EkoNKpy8R8gYn9etB4lCDU0PsRqv4n/9wy7q9Q9dWfr+b5Q1sHpFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 22 Apr 2026 11:16:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/xenpm: fix FreeBSD build
Message-ID: <aeiSAFy_P1QoIBaP@macbook.local>
References: <20260421153224.36368-1-roger.pau@citrix.com>
 <2204fbae-be5b-4f56-ad2a-cd5692db81cb@suse.com>
 <aeedB31aEBJb2Pa8@macbook.local>
 <bb1d52a4-c344-4653-b10f-0781c2900cb0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb1d52a4-c344-4653-b10f-0781c2900cb0@suse.com>
X-ClientProxiedBy: MR1P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::22) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA0PR03MB5387:EE_
X-MS-Office365-Filtering-Correlation-Id: 5604b4bc-2d46-4bf4-31c9-08dea04fe415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iMQgjnb2iselAWYdSeN+Ero5SEDezs788RVSrPHt45cmFraRITQ83Irx6eoQeQhhZeHnJLAQjbTzMLsZ2Hzk3qGPJBynM2NVWNA49SfjCa2LWtfoTZLEmWBlYRmf2k1IbZKt1o32Rn//d6Z0f340Mva0CCe+9pCE0egPMegucnX2oE/iZtHwUb7ncGNENqlwkjzRUsa3+mzGgEX6ZjVRMXFd91uPrl/ro8qQY3WInJ9lha0VoGSZYlxDovL+BRiw0DKDnJzQbpvYfkRQ75UaCWL7QequXwu3QPN6/UBKsbXKdozdXb51pOCQVkR/wkoLQjJ8LMdEL3uNaIpCSwruelh1jpomVu3/KUtAb1Kq8mdw8Lx2c7ximUjmH1588gyWIvMTfTXBR+Azf4oKgNp+IRT/Ob4Hlp47Y1uL7ZgIVh0ZosSl8y/3f/GvX+rFtwCJDxccfqrhQAwfBbTfD1LZ1tgBD0hQjmhHSu/y14aQdidkDiZ+Fku2pYS9dqVyHT4E7f9tGQCqBVdh/JboZY+TQfoYNlvw3S+Yt4MN6Pb4CRCbsIXNkR0RxmtO1upCF0WFtsX2yi5SPML+95flWid0BYXJeNM40fGgSktHHqnPyn0wLGV5ZWeBF6kDe1OKf69IJsQ4/XKJWDTstfCfjBo4AmwvM0h+kVI2llJG7vlc0wGqoMH4hAySl57BJ3jZAbhfDEBm8I26XRTzTvmeUjtDkAkLPvWkPnCwTX/+HOMg2mc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmlMWk1VRWw4Q2ZlWm44dVR3YlJ6aVhTQmVYMGdoSkY2YUFOa0dURlVrTkZr?=
 =?utf-8?B?M2pSUkNsK2JNOTFKZm5vcnU1THRsYXdmNnVtakgzeENYWGU4N2pQei8vbEtk?=
 =?utf-8?B?VCtZKzVnUEpOTTN1eS9GM1IwZ0RvNDVMV01rMkRKSUlQaEFlTldnc3ExRmV3?=
 =?utf-8?B?VkFUL21HK1k0QU9KNTB0NzlZdjBFRnJRL1pnUy9ZVUVyTE1pVTkwaHZWSG90?=
 =?utf-8?B?UitWYmtCOVpCL0JybDE3amhyMnBPdkJQUk5FSVFYaVYySHdTYmQ4MExjNWtQ?=
 =?utf-8?B?WGV5REpubUtUUVBrWHZzNERsNlA4T2JVdTlhYjNVRTBxUWdEZWxlaEtKM0xm?=
 =?utf-8?B?THFSNHFGTEQ4d3I1b3pmb3Z1VmxPN1hhRUQzbUJkblNNTUcyN08zMXV6OTdG?=
 =?utf-8?B?akh1T3Brc0VOdWJUQzhVd1NHZ0o0Qmw3WEg2eWFMQWpqQ3cwRDRub0ZaVnR3?=
 =?utf-8?B?RzRsM1R0T1RkanhNVWU4UW5RNG9iRFlueU9sY0p3eXBFZm9DWXVqZm5lT29V?=
 =?utf-8?B?NENXVndTY2lHY3FUTmVkNnZDWDk3WUtnQldlNVgvblFCZDl5ZXFIMW1WbXN6?=
 =?utf-8?B?VWdMTnRhNUpuZ0JNbk1za3E3WFJCVzg1VWFqaHltS2p2bXZmb1gwZXh3d1py?=
 =?utf-8?B?bEVxbklQSG84UFF1WDdON2tGSlEvbGdTS3IxVGhhMjloNkQ1dXVic0dNNTdt?=
 =?utf-8?B?U21aT2Q4anNnZVJuOWtxWG5WU0Mwc1JlUXRpWGRMcDZZTXZrRHJhZklEQTl2?=
 =?utf-8?B?d3E3ODdJc2dkSmpRUm5jWUU2MEJuRGtDbUFhR3dNZk1TM0JWVTNXR3dMNFhp?=
 =?utf-8?B?cXBGNytDWHpIZ21za0d5aWxjYWFieFM5VmFvMVI0VVBGU0hhdnlBWWg5NnVO?=
 =?utf-8?B?M3lMQXp4MFJoSEk2WVZIWHk5WE9VVTN3dk1SVDVyTTV1cDJ6bXZrVnFZWllT?=
 =?utf-8?B?MHZNcDRtbFZ2VDJZc1dmZlM4Q2Q4bVZiMlQySzhXWG1zV01wNTBuMTJrQlBl?=
 =?utf-8?B?bjNVYUVtRHJ4S3Q3TFg0VmxjcngwYUpZMU5tQzFzK0EvQjVXcVplaWlWY3BQ?=
 =?utf-8?B?K2xVUE1TL01HWkQ0dGJSVDlqN0NoSXNiSUhyOTJabXhXeGx5ZFlkOTB5T015?=
 =?utf-8?B?S1VxU1pCSzl6b1JEY2pjM1RYNHpjcytWZDByeGpFb2cxd3hJZ2xXSjlQckRO?=
 =?utf-8?B?N0JpbVpGSWRnT0pJbVRmY05TN0xnWVAvekszQlVIaldwYUp4TG1LQ3lHM1dn?=
 =?utf-8?B?VFpCeFVsdzdGTXRSQUhKUVJCKzZqbkJxSExGcTY0cElLRGJzMTdyakhkK2VY?=
 =?utf-8?B?VnJ2SzJjbXhldGhkWlVYY253VXg1ancvV3pGek5LcnlZZmcxeUN6RGc4WTln?=
 =?utf-8?B?VHJKbnFwbUpJc3RsdEo5RTRLWUVMczM4VllyQU1JOUc3YXJOTHZ4UkFlM2RU?=
 =?utf-8?B?Qk9VUXkxWXpvVnZBeEFCQXM3dU5ubitBOHpuNzAwM3VBRXR3dUNKVHNKSW9s?=
 =?utf-8?B?cnRZZE1GaEdOMzFRb242dzhZbmNsWE0rcEdVUkVkRElPMnA1YS9xVXNUYVFv?=
 =?utf-8?B?ekZwLy9vLzJ2TmJFTDlRcm5JQk9md0pXUVlnRlcvTkR5M21xMjh1R1gwdkdE?=
 =?utf-8?B?TXBPeEJHMjdRNURIZ29od1hTRzc1cEg0ZkZmenpxU0J0TXRycnFnVG5CcEtG?=
 =?utf-8?B?dGpCcElGK2g2b3BtMjlaMmFHZmZMT3ZHWEd1ajdvOW9wZDZ3YmthMXJHSjlB?=
 =?utf-8?B?Y0ZsVU5FV0ZGVzF2NjAvNHh2eG9ucjY5a2g0YXVQTmZIWUJWRFp2clRiN21R?=
 =?utf-8?B?N0tNekFRRUVuT3hldVB2QUNnOWQyWWFwR3ErUHlUQm85dFBjd00xblBzdUVH?=
 =?utf-8?B?MmNPTHZ4aERVMW1TSk9RSkdZK2ZuZVVscjVXd1Rpb2E3eW5vNHdvTW8rMzVk?=
 =?utf-8?B?dS9XOFUvblpzYjg1MktDREszUzRpODlrdzRmd0svT29EbUxDNDhnK3ZiQXJ2?=
 =?utf-8?B?bGNheFhSWGRqQk8rc08wSC9kS1hWYXl1bE9Fajd6b3RWR0wyV2pyL0hWYmpH?=
 =?utf-8?B?K3V5eitNTUlQV0hScWFKNzR4clhZbU9DT0wvSERFYjM3L1B0ZGlydkZqM1BE?=
 =?utf-8?B?VjlkOHFkU1l0RDRJcVRGRC9OMjJFMTVGdzI0QjVONERsNkRHR3NEV0xjWXda?=
 =?utf-8?B?ckRCSElpTjI1aHFSNXZOSWZYWXNzemswdzYwYWpDNkJNVWc1MXoyc204dXVz?=
 =?utf-8?B?bHIwaDZ5WWNRK2NTL2tuUnBTSmhkODg2ekE0N01FT2JEbll4eG9hRWZ5L2Nj?=
 =?utf-8?B?Y250dDNyQnNheFVPdlcwOHNQSE1wZHQ2V01ialFZcU11K1ZFcWdoUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5604b4bc-2d46-4bf4-31c9-08dea04fe415
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 09:16:52.5256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVMwASjO2PIh2gkoTQcimd0Yy57hiqXEKRO10CiW0MNmNgBEa5AHxDK61saBZeF2SULo6t7nTIZHRcKhQrhhmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5387
X-purgate-ID: tlsNG-d25034/1776849421-F5E0ECF5-248B9789/0/0
X-purgate-type: clean
X-purgate-size: 2104
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7CA3F443D4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 09:15:56AM +0200, Jan Beulich wrote:
> On 21.04.2026 17:51, Roger Pau Monné wrote:
> > On Tue, Apr 21, 2026 at 05:35:57PM +0200, Jan Beulich wrote:
> >> On 21.04.2026 17:32, Roger Pau Monne wrote:
> >>> --- a/tools/misc/xenpm.c
> >>> +++ b/tools/misc/xenpm.c
> >>> @@ -1377,7 +1377,7 @@ static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *te
> >>>      {
> >>>      case 0:
> >>>          /* This CPU isn't online or can't query this MSR */
> >>> -        errno = ENODATA;
> >>> +        errno = ENODEV;
> >>>          return -1;
> >>
> >> "No such device", however, isn't quite what we want to convey here. If no
> >> better error code can be found that's available on FreeBSD and Linux, I'm
> >> inclined to suggest that we stick to ENODATA where available.
> > 
> > Seems like a lot of complexity, for very limited usefulness.
> 
> What's complex about
> 
> #ifndef ENODATA
> # define ENODATA ENODEV
> #endif
> 
> (perhaps with a brief comment)?

IMO it's best if we can avoid instances of ENODATA in the toolstack
code base, specially if it's individual ones like this that can be
fixed.  Otherwise new instances might appear elsewhere, and we don't
want to be adding this bodge everywhere if avoidable.

If we had a sizable usage of ENODATA in the code base I would indeed
recommend such define approach.

> >  The only
> > usage of errno is to be printed in the error message, and for the
> > purposes of this function ENODEV is already unique in the function, as
> > ENODATA was.
> 
> Right, but "No data available" is more precise than "No such device".
> 
> > FWIW, I think ENODEV is not that far fetched: the CPU being offline
> > or the MSR not being present seems like what you would convey by using
> > ENODEV.
> 
> Yes, there is a connection. Hence I'm not outright opposed, yet I think
> we can do better.
> 
> Formally Anthony is the maintainer of the file, so in a case like this
> one maybe he ought to have the final say?

I'm fine with letting Anthony resolve.

Thanks, Roger.

