Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fX5LCqOC62kONwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 16:48:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702104605AC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 16:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293693.1571249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGHoR-0007vF-9Z; Fri, 24 Apr 2026 14:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293693.1571249; Fri, 24 Apr 2026 14:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGHoR-0007sD-6U; Fri, 24 Apr 2026 14:47:23 +0000
Received: by outflank-mailman (input) for mailman id 1293693;
 Fri, 24 Apr 2026 14:47:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGHoP-0007s4-NW
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 14:47:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGHoP-004qJY-4W
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 16:47:21 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb826d-bab6-0a2a0a5309dd-0a2a45089c92-24
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 16:47:21 +0200
Received: from [52.101.48.61]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb8277-63b5-0a2a45080019-3465303d7bb0-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 16:47:20 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH8PR03MB8250.namprd03.prod.outlook.com (2603:10b6:610:2c3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 14:47:17 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 14:47:17 +0000
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
 b=RXeFGuLIkKh5gGAhaLfIrw1rDIPmfYI/fBiBF8lPo3c3zqG9+A15kqfw6HDCZCXCc1nbT/Gu6uPQziglP/3jAG9Cm/w4d4JwGBIvDXhd9FVw+idPk8WdbgjS3vVLLNlqQEpEkE6p85PbZ8Ws6lXmh2mprte2cCc/zYWXCkhTcWQRN8RiRTQjnkfz+GatP1EajHPQ/69JtNXH5ssJ6ta/3wF7IJnlO2xrMC3tId3CFSYSDadmivyzMnPaiyl45stIe/S2HvsICQHi1iQn06btM48cc+TKUNpeLp8CmvIkLj3hFJdcqxv5wpGZEb964jyCjj4YuT/M76eEIjvntMdQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHgAepcKVtIJaI5trQ41l5NK3mEZnXyvkGxPIhCy9IY=;
 b=Wj7q/I1MnP9azHGHFEPrMF51gGHT1Q01esFF+wWOV0B6ryfWMUyoFy2FIUBMBasTSJZTzQpbVHRZX5eNcrVzfCZfp5+WfBVasuRUNc6w1ybkAKdw3/rxfDhChTMQryEYhyjZVJC0Djrvuo3WW2YljXehlg/kLZwis2Z6imo55RGlJfHF0aE2es9ZMU2WsueowZER50lgMJDQIgRnl5lBYwKPmNkH6YrWMXC6kN9mU9ww5dP5U/Osfqt+ryoIwr5Yjq1tsHK1ro+HEst1SBVfA+ow6meX5cgjm7GZ7vhoirHew37bZulOHfZ2t0KqFuDvazW+19kLRrj0kPq6HTzVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHgAepcKVtIJaI5trQ41l5NK3mEZnXyvkGxPIhCy9IY=;
 b=nW5nmQ4PRLIYfwbg03E/KrEvhXFP5XhNZk57NbKpa1dQLap1S9vhQ3OgwC8zjsH2kPZExDD6aY17fDiQYaaiV+SL+jrx7jm1VRqqh/AwWQXGq4lPvuKvkmPPAwY0ZAIBaGmz7g0fOGMqgM0yTfberEjbJS5aAldXYboAoh7j0eY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 16:47:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/9] x86/mwait-idle: clean up BYT/CHT auto demotion
 disable
Message-ID: <aeuCcSSBJ4H9UwOB@macbook.local>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <b906c3d5-5256-4ddf-9186-b52d8280e2ec@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b906c3d5-5256-4ddf-9186-b52d8280e2ec@suse.com>
X-ClientProxiedBy: MR1P264CA0168.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH8PR03MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 2545ee10-9cbb-453b-39c3-08dea2106164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CnDF6AegGuWmI+pqTbc3InMwknNIxkScs1puqhr5srawger1zOO2tAcjHKlmSPhryFUiknGGpouA9iJ4A8AajSiw9dqtPJMx4vDVghSjP1UUkflPN2YYHcbB+OKKUJeE03jRK0DPmNvTcYhHDGKPgFQbz/zmwF2+eii/d4/ZRfzYz19YpoeAa3Tp4roRqQxIeJ8B5isrcFPSpxmXLx0Vz/4+6qUX67NTupQwoq1ZHUgNQPESxfoekheHha2l6NXjAI1JjkbukUxuE8IWc5MvUcRAYdBBLWYErlhO/hxg1XZ3KdAMZl1tAcmy4Ph3CPT9jP98iwUEs66RNWXqhNlJ9cewxhEXo5suYiJYoG2Ld/lI6ha/rTLPHypBccbQsSzapypzHXmTC9imjdw3L1CuDbk8C70CNqmLOlf3UIZKRJj7d/v+6TGu8+sHR2K7bn79sYFebRjTxhm633N6EAfgmEq+sBlitT4OulsWW4yFRe439qKfZEcoT+nntOxIRKBacVQKvFBJuJChN+QYcseLpkAAQIv5agcCsTmeSC649GpNuXOmU6VfsOSTrJfam40eQBRTSFYcc6J4KhfNuG+caPbfO9YUTCGGuAA+r0wOsRbP6F+LExaKHu4G64DqGSf+OuvAd40TsJ8KQVmyf0bKTWKTPahKql8Ibh6VP9q2ek2gTPu1yCUqI3C0U5ldciWePPFY8ZePHqph1gck+GwXrT0SBuJwweffJRr5WEXZpbk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzBhT0tTVDQwR0F5cXkzdlltNk1wSnN2SE9IOXFlQ3Z1cHEwN0pjRmM3d0xX?=
 =?utf-8?B?RVg0UFlycU5EbHNQWDh1YWFXV3FoRlBBRUN5eXJmWWMrakMxcTlDZ3lvdkt3?=
 =?utf-8?B?ekRHbWd3SUVodjdSNW5HaWRnSGV3TUhtN3NodFNPMmlNSlFIZnFnSSs1bHJP?=
 =?utf-8?B?WU5MbCtBd05hQ0JKT1VxNEt4Vk1NMTRCeGNRSUM2R3pzZHl4VnBtTFVuNStw?=
 =?utf-8?B?MEtpZk81cnpyTi9nUkExUDY5L1hCU1dZUWNSS0ZlWkFVelVhUHVuSUhEMUxo?=
 =?utf-8?B?NXZTYXdJUnVzM01DN01nMnF2YzZCM2g2c3RoZnFBSEZXa3ZvSnh2K3ZGeWlZ?=
 =?utf-8?B?TU9ka1NySzV1REREbURkUUR1YWxHWEp2a0JldlBVVzhVNzQreUlkaHNzdFpw?=
 =?utf-8?B?Y0VURlhINkdRQXFBKzIzYnJOUlRBYUtKQVZoQ2ZGZHVpb3h2REJ5SXBtbHd5?=
 =?utf-8?B?M3FJL1ZBaUxZcDBYQW1wbHRmeVNLakJTdFkvNUtNZnQyODVhcUhuYm9ZSW81?=
 =?utf-8?B?MGRTZ1RMU0FPZGtRZHlQL0hmenZSN3EvdW1pU0lJSXFBS1p6RFNqK054OVpj?=
 =?utf-8?B?RFVlcXg2MHdDZ1NMamJ0ZkxmWHY3bzFRNjRReHRrcStSc1djR2JTdUhvNE5G?=
 =?utf-8?B?U0JJNWk0aGN3TUZmSWJWVnV1ODJiOWlKTFExc3h4V2dzV0RNUTZ1QjVZNkZ6?=
 =?utf-8?B?ZVFKT0RXd1Z0bEtmcExmUjVROGl0Y0E1clE0RkFWS1ROWUFrOHhWQm9rWm00?=
 =?utf-8?B?MWZzM2F4NEhqZ3BMemloRkcwNUt6aVRyRUoyTit6UU9RL1ZJSldicTM4OWVx?=
 =?utf-8?B?YlNBelZSOWE1TXA1K0VEV3FPSXo1cHg0bFh2V3hSYU42ME94bGZ1cWJhcGJT?=
 =?utf-8?B?RlNhQW1ZRllzeDNyUUdXanpiM2t0Y0lPZC9jOW50dXNZRCsvMi94dUliZldh?=
 =?utf-8?B?bWJwaUlUWFh5U3g2TVdpS1ZNY20rdzBlU0U2cGVLaWdXTVpEWkZxVGZvaGVF?=
 =?utf-8?B?YlhRNnMxWlMzTGJudnFSRzJpcXJ1bERhcTRzTzhKaHBrZWQ4WHhhdDlNU05U?=
 =?utf-8?B?eUhhMUVKYmtHOXJlRHhIK0t3ckVYRTErbldVWHppQ0daUE5TT2VhZFBhaEFt?=
 =?utf-8?B?OVIyZlQzZkVSemp2aW5JZUhwM0w5V01sbExHd0VwanJrTHR1dzNCYWg1SWF0?=
 =?utf-8?B?cC9SdWhUS2dEMC9lRDZWYUh6cE1Sem5QOWxJdjRsajNlaGlEUitVR3VVQ2Zp?=
 =?utf-8?B?WGhmVy9aY0tuSkUvQjZ0VXhjdk1PREZsd1J4OEpzOG0yUlR6WGZRUVgrVkVx?=
 =?utf-8?B?a0p3TFcwZkZsN2U0cTc1WkJybUhBdzFHZ05lWVN4cmxSVUJCa2hQZFpJV0hD?=
 =?utf-8?B?MSs3bUFyUkhJaENqdDh4L3ljS1dCdHVGeWN3SENlRkUzcGVCaEEyMm41TXha?=
 =?utf-8?B?ZFYxRnpiRlVJRnh4MXltUllycWRuTXR6M01ySGxlZDUvRER0L05pSEd6eXAv?=
 =?utf-8?B?cGNmd01ieDI0TDlmckVyWHh2WTYvZDVjazJ3T2hXQWk1K0pCZVVGcjZsb0tz?=
 =?utf-8?B?cWRnZVdrN3lNTmdBVDZqc24wbXN3eHRDM3ZZdzF2cEovNzNEL2k3K3lsK2VJ?=
 =?utf-8?B?RXNwY2pWYWRNWnA4cXA1dVVZU2liUW9UV3pEWDM1UVo1RVpWT2d5dS9DUU9v?=
 =?utf-8?B?S0QrQ3YrQUR0WFdSdFppZjNySFhTeCtDSE1Tc25STkZ2UmJ6MnhjRTNsc3N3?=
 =?utf-8?B?RVdVb1ZWNUFPWkFRQUNZMUJPZ0xteVFwa1JNMkd0WEJ6UnFkLy8wcEY5WS9l?=
 =?utf-8?B?L25qZ21QVk1mMXFoUVFUL0lWVTZHVkVIYjZ4aFNHNGk3OG00NDR0T0Fzd2hZ?=
 =?utf-8?B?K0pZOTBoQzNzU0xKLzBSUUtSd1FaVENsdzRPblAzSEtDbzZVbzcwc3RFNTRx?=
 =?utf-8?B?RjRuZjhMS25ONGRObCtqejR5a3lBc29ZV0tEOE9MTGp6VitTSlM1dm5sVXFj?=
 =?utf-8?B?cTZjY2pBeGRwNlhVQUJOM0lndjc5a0lac0lqK3ZYZDZESXJqRWx5eDJTVlVJ?=
 =?utf-8?B?bTVFOHc0UGdjL1ZuY1RoSlh6cjZLQjAzYzVRa09JSW53alVwYXhGK3JqcWJO?=
 =?utf-8?B?ZU15TFQ0eUhpZFRKMU9yWVBNWG9YbFZ2U3MyYlM4R2ltT01qRHFXcmVjelBp?=
 =?utf-8?B?MW5Fa3dCamdzcWpXM25jbEV4Y3p0ZU0zTy9DRVhyTjFKMWkrODlCY25JUzQw?=
 =?utf-8?B?RG1ENzhkZ2dhbmk3VjBvKzJDZytRb2VraWhNc3ZqUGh3WFFmcVNsUlMyUzJ4?=
 =?utf-8?B?L2xhQ2xacGZnYXVYeHNRamU3N3BJWktHMENadENyd0VPZXR5MkxqZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2545ee10-9cbb-453b-39c3-08dea2106164
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 14:47:17.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dkyC92ECiwYsuEom8jOg09bhp71mLA5AbSarJJC3ltoVIi1gF6FF3AaxgTjLVu1RZC/loeFS7zxhOVRDVvZbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8250
X-purgate-ID: tlsNG-c1860d/1777042041-C156FDB1-0BF72D7D/0/0
X-purgate-type: clean
X-purgate-size: 3684
X-Rspamd-Queue-Id: 702104605AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Thu, Mar 12, 2026 at 05:54:56PM +0100, Jan Beulich wrote:
> Bay Trail (BYT) and Cherry Trail (CHT) platforms have a very specific way
> of disabling auto-demotion via specific MSR bits. Clean up the code so that
> BYT/CHT-specifics do not show up in the common 'struct idle_cpu' data
> structure.
> 
> Remove the 'byt_auto_demotion_disable_flag' flag from 'struct idle_cpu',
> because a better coding pattern is to avoid very case-specific fields like
> 'bool byt_auto_demotion_disable_flag' in a common data structure, which is
> used for all platforms, not only BYT/CHT. The code is just more readable
> when common data structures contain only commonly used fields.
> 
> Instead, match BYT/CHT in the 'intel_idle_init_cstates_icpu()' function,
> and introduce a small helper to take care of BYT/CHT auto-demotion. This
> is consistent with how platform-specific things are done for other
> platforms.
> 
> No intended functional changes.
> 
> Inspired by (and description largely taken from) Linux'es c93d13b661a6
> ("intel_idle: clean up BYT/CHT auto demotion disable").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -104,7 +104,6 @@ struct idle_cpu {
>  	 * Indicate which enable bits to clear here.
>  	 */
>  	unsigned long auto_demotion_disable_flags;
> -	bool byt_auto_demotion_disable_flag;
>  	enum c1e_promotion c1e_promotion;
>  };
>  
> @@ -1144,7 +1143,7 @@ static void cf_check auto_demotion_disab
>  	wrmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr_bits);
>  }
>  
> -static void cf_check byt_auto_demotion_disable(void *dummy)
> +static void byt_cht_auto_demotion_disable(void)
>  {
>  	wrmsrl(MSR_CC6_DEMOTION_POLICY_CONFIG, 0);
>  	wrmsrl(MSR_MC6_DEMOTION_POLICY_CONFIG, 0);
> @@ -1195,13 +1194,11 @@ static const struct idle_cpu idle_cpu_sn
>  static const struct idle_cpu idle_cpu_byt = {
>  	.state_table = byt_cstates,
>  	.c1e_promotion = C1E_PROMOTION_DISABLE,
> -	.byt_auto_demotion_disable_flag = true,
>  };
>  
>  static const struct idle_cpu idle_cpu_cht = {
>  	.state_table = cht_cstates,
>  	.c1e_promotion = C1E_PROMOTION_DISABLE,
> -	.byt_auto_demotion_disable_flag = true,
>  };
>  
>  static const struct idle_cpu idle_cpu_ivb = {
> @@ -1680,14 +1677,11 @@ static int __init mwait_idle_probe(void)
>  	return 0;
>  }
>  
> -static void mwait_idle_cpu_tweak(unsigned int cpu)
> +static void mwait_idle_cpu_tweak(unsigned int cpu, bool bsp)
>  {
>  	if (icpu->auto_demotion_disable_flags)
>  		on_selected_cpus(cpumask_of(cpu), auto_demotion_disable, NULL, 1);
>  
> -	if (icpu->byt_auto_demotion_disable_flag)
> -		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
> -
>  	switch (icpu->c1e_promotion) {
>  	case C1E_PROMOTION_DISABLE:
>  		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
> @@ -1700,12 +1694,24 @@ static void mwait_idle_cpu_tweak(unsigne
>  	case C1E_PROMOTION_PRESERVE:
>  		break;
>  	}
> +
> +	/* Pkg-scope MSRs on 1-socket-only systems need writing only once. */
> +	if (!bsp)
> +		return;
> +
> +	switch (boot_cpu_data.vfm) {
> +	case INTEL_ATOM_SILVERMONT:
> +	case INTEL_ATOM_AIRMONT:
> +		byt_cht_auto_demotion_disable();
> +		break;
> +	}
>  }
>  
>  static int cf_check mwait_idle_cpu_init(
>      struct notifier_block *nfb, unsigned long action, void *hcpu)
>  {
>  	unsigned int cpu = (unsigned long)hcpu, cstate;
> +	static bool first;

I think you want to init first = true here, so that after the first
call to mwait_idle_cpu_tweak() it gets set to false for future calls?

Thanks, Roger.

