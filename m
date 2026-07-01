Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B6dgEXjZRGpM2AoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 11:10:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D996EB7A2
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 11:10:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=O5w3a4NY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349625.1607314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weqwY-0001D1-NE; Wed, 01 Jul 2026 09:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349625.1607314; Wed, 01 Jul 2026 09:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weqwY-0001AH-Jw; Wed, 01 Jul 2026 09:09:18 +0000
Received: by outflank-mailman (input) for mailman id 1349625;
 Wed, 01 Jul 2026 09:09:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1weqwW-0001A9-CP
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 09:09:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weqwV-003ivO-2a
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:09:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6a44d931-bab6-0a2a0a5309dd-0a2a4508d926-38
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:09:14 +0200
Received: from [52.101.229.79]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6a44d938-edec-0a2a45080019-3465e54fd3b1-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:09:14 +0200
Received: from TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:30e::6)
 by OS7P286MB5474.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:398::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 09:09:09 +0000
Received: from TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a377:45d3:a376:f515]) by TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a377:45d3:a376:f515%3]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 09:09:09 +0000
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
 b=AChEHSED0qwvNe9Hj5P+9lF8hpcZu/yUI3CSKFi2dtXLxd8Zt8Z6eWL1CU618cpmmi1ujra5+Fvt1waJMxJ4u60KChhmyGwEwudHT+If5Y9vWAC291nvYXVWcxZL7BPosTF8VB+vyN1/eKukyhK0reRKOuv3FNhJ5NoWLhKpVXkpJCvmx1Uxwehi8Y615M6/BAArXZJGNtKLYBdEhSmPEDJRxgNa0K3prmfaVKjIks1WA9qsKD5Dhj+/T18Mc3y2Fb5kdLYkSKon5ylLUvjdWyAP+zZWHE1Ib2XjS3+ucNH2YGbcRJOCOEn7hPA5cRzh/9C0RIxSJXgXEKESO6IS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7eThDqmoZ82RG4QueS3fK1meunY7Ib+jRa572ZdCK0=;
 b=r0xsZ58OaK/5AhjOzEQhMnjiqJ28tNMxXIqHNTQuAdhBLJI4s9zwRz+QXouU/ttvGcAo/9Xs7sHWHNUqlVX2XlceeNn4R7O8W8YwpSTax5j+imzzTbrs7tjwcq9s7BBIdeFAx5IcgL5hd4V3hZf5ljPG/aMFW+T+OWvXoBzWGwUhl8hh2mdqVsolCSudZRtNScl6p2Da6JECv7ng+NEKfOfrC4vcszEvHGvvVEr0WDUEVTkVrLndiPDc6Bw1NXElAiW94k0Cb71jfeNcjcYV9LJ1A5f31f7d7tw8aJtr4LDPMP5qlaSa9FCvCLzIl6DqeeE9xSqp93DLs6/FSEyQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7eThDqmoZ82RG4QueS3fK1meunY7Ib+jRa572ZdCK0=;
 b=O5w3a4NYfn+tyvpyMoZMh7x2GvDi5ckpEHKFBHEzPk8QEAHyvbYYOUUMC5hojvJspokMEUUvBcYJn5rRlrGhRVSNBXzXUO4gQTYnXU2jLLbKTqfGBswAo77+4TvfW0xNmLyFZ34i5wffFCWzKd9OjiVhZPixJ5gzZNNyLNvuxWw=
From: Ryo Takakura <takakura@valinux.co.jp>
To: andrew.cooper3@citrix.com,
	roger.pau@citrix.com
Cc: xen-devel@lists.xenproject.org,
	ross.lagerwall@citrix.com,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	taka@valinux.co.jp,
	den@valinux.co.jp
Subject: Re: [RFC] xen/arm64: livepatch: enable attaching callbacks
Date: Wed,  1 Jul 2026 18:09:08 +0900
Message-Id: <20260701090908.15204-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <akOCgoqbGhZbjcQx@macbook.local>
References: <akOCgoqbGhZbjcQx@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P301CA0054.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::14) To TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:30e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYP286MB2946:EE_|OS7P286MB5474:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fd92e2-50fa-4545-6768-08ded750691a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|3023799007|6133799003|56012099006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3Ysr9j7mrAyrlgR9WlWqu3qCx8k+/hhD1TJJdPAI5lt+CqW7NDJeL1aCcXN8kP9h0DdyC4NuLZiGmeu8C0FeMKGHlnvGnfuQa7fhzNGs5p28JXUXBAaNwkHQByoxJDtlu3QnDt/4jJ2Wf7sRoQoErrnEercVP2KxzdIVrYFz9Pn6f8wtJhkwYpb0N/bMmg2qXfUxOS6iX9/69+2tyTTB3WjX0hEpnaM8bCb13qUiSlkLfgOTPkODVqr5JVPya+w2OmlXus4gvZ7gpI8CJKWhBdN8js7xMrj+c8e5e3JbBRR6a9J0NqnvLm4DB5kuWx9kfua2q4qz7Q9URyE+mXzIEQd1KmWdmXzgPPdmWH+Jywc3JAG/FSxVL03Vhep0cF4D/TCi4HkTahNJTEVOrhyyM47uyNlBPAuPOBz7a3jvyhSbexesKrwMNxkmyIbRnyo135e49RHBqKLrIBc41Q8NDz/dBZ4Ik+I88F4aTyRxMb2FZ64W26NZB7lgZD0UR3ALKguWpi4YdWKITMjCIYFmZBuhvVvVaWyvX7Ge8QLqVsyaBabVv9yB52+B9zGVV6MgEXxmwlNnDMi7I4Pp858MGlNIzzgqEEpZNRLE9Dfc401sXpq/fz20i67JdjHd9Dhk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(3023799007)(6133799003)(56012099006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2lUaUJ4K2tFSDh4MTQ0UkR2Q2NaRVByMlp6T2dMTmdlM2FZRTZkU0xLdS9z?=
 =?utf-8?B?TWRqTmJNVnJUUXV1MWdpQ2xTa1pYdW9ZMTRHRHpsaUQ0bUwxdkxKS09nUy9x?=
 =?utf-8?B?QUtidzF3WmhOQzhLbDRadFJFRHpGeVZYQWoreXBxSmxzSHgrSTRXUjBYUHE0?=
 =?utf-8?B?R3VycUZtY2VjdCtjLzlnM1lDdjREV2FLVG1BaExEalI3Zk5uRmh5emxFWHAy?=
 =?utf-8?B?aWlVQnVOeWxRZ0g4Y09IQ09oOGYxdUMyV25oa0JTL0liY2lXaThkZnp5enhG?=
 =?utf-8?B?U0hhTFg1V21KNGRsQkVQeDdDS0NrSUFZN2FENDF5eFRmcURYaEJ0eS9ITzg5?=
 =?utf-8?B?WWtCN3ZoWm9TSUs4NFBzOVVPMndINWUvNjI1MGhtS0RSV01hb0ZaUDVHcVRT?=
 =?utf-8?B?K0xEb2Fzb0tPTmM3SkpHR3pjRUNpSFQxdytsb2NXck8zQ05JRWFrbkRqQ2xx?=
 =?utf-8?B?Y3VQS20zWU1pL0RlSVNISmltYWJxaktQMHg4Z1JLanFZTVJPZFdXUFZUOExY?=
 =?utf-8?B?YWlwYXdPYm00K1RKTjBiTTRTM3g4TWs5eEV5ZlUwQS94anVzdFkxMXFucmwx?=
 =?utf-8?B?aDhjU1Blc1ExcElNVk9WeE8yTjgzTjV5WC9sdFJ2SnFNRjVuTmxLaHNTcE1k?=
 =?utf-8?B?dW52dlZicnhFTlU1WjBVdVNML0Z6NHZTM3BIVlVjaDhkQWNmVjREUXFFV08x?=
 =?utf-8?B?RDBNNW1QSWhoU3QrUk12b0NKTkpmUEVpVWxBejNNZVhyUmxMNXVzWW8vb1Rz?=
 =?utf-8?B?SWNESVhnT1krckp4ejgwMGQ5czlVeVNDN3pNd2czQVNtTWdDNDJyd3lCSkNP?=
 =?utf-8?B?UElXYytkc244Y2dZU2czR2VzaytlLzRoQU9vL0pWU3Z0ZGRTTXdoR0NURGdK?=
 =?utf-8?B?b1BmVm4vOXZIOU1HN3ltQ1hHNmNFdzd3VW1mci9aNzVjdTNsKytTQVVPSnMr?=
 =?utf-8?B?QU55ZXhycExpbkM5TjZZWWtVbkEwSnpiUmN4ZXFHc1J2bzVKQVNrelhob1ZD?=
 =?utf-8?B?Zmg0UmlpOCtjRnRQcG0xYlYvUGtHWHRJb2tHQzViU213czlWdE55L1dLVFZS?=
 =?utf-8?B?b3dkb1dDZnlVK1p3dkpyTXlyUXNKZTNvZkxnNFhrYVh3V3VGcG1vNkJDbFNE?=
 =?utf-8?B?K01JT3B1NmlDM2IzWnlNM2c1SXFsRVkxWUJ3SGtZRzVGUXM3d0JrYTUxenJ1?=
 =?utf-8?B?VDhpL3lOUS9GcU5yTDRLN3Y1ekFxTWlRTkFlZUQ2ZEtUWVRMSzFXaVNFcE1L?=
 =?utf-8?B?K1dHTzQvWTJOc3VWVit6a0c5Qy8vOXNuV0dlc1MrbnNaN0dySzlKT0NISjMz?=
 =?utf-8?B?RGFoZlFNTE5ocDFkYm9KSjlvRXJRVEJWSmF2cXRqNHdLdmxqUW1Gd2tZUmpR?=
 =?utf-8?B?UFl4Tk94bTdSaUQ3amhQQkVxOVo3NDY4WEJ0UlkyTllHMndEcXFLZzdEMjhL?=
 =?utf-8?B?Q01oMWorU2tlMWdYNDdCMklCUHNTTURqNExPRjZyYzhaQmZlV1dkZkozbUJT?=
 =?utf-8?B?L3pHK2hqWU5sb2hNaWxxZkxJQ3RoNWUza1JHTFFYS3RldFNaSFFzcElJdEVa?=
 =?utf-8?B?cHc3a0dhUXE0RERGV2NyTWJVS0ZmVE5OUzNFdFQ4eUdYMUtYaCtoUGxseXdu?=
 =?utf-8?B?NGo2MER5a1AxbWhlQ012M1BxUXNyTG16VlNpTlIySFY4V2NPRXJleTVpc09x?=
 =?utf-8?B?NUI0WEpyZlpKNTc0ek1PUEdFNnZYSGhEQlQwcTRiaDd1UWFjWFdld1A2cGxS?=
 =?utf-8?B?dTNwQVI1TUdDbXhKdG13K1V5Q0RWSWt2WCtoM0ZNa3BuS1dURmxVeHVObVli?=
 =?utf-8?B?czc2TFM3VGRTMWYyTnBXZlkrMjhtOHh5dmRIM2FTakRxNVhEOCs0VTg4Mytt?=
 =?utf-8?B?L3IvZUxFMGVwWG9CVTNOVjRja3FRTTZuWVdDOWU2dlROWTBGM0huV29BSUw3?=
 =?utf-8?B?RXBxV3lCOTc4RytTeDJSZVVtM0k5VXo5cG1neVVBR3RBcnFEQlpUSnpKdTk2?=
 =?utf-8?B?Q01nWExPYW5WMTdWdXpZRmN2VE9OUExtVW9yZnFUM09kV3pjVWFLaEtHUlNi?=
 =?utf-8?B?OURlWU1STitVd2grNWNiSUxMc0F0RWttYmhSOXFWaWUvdnFLUEpXQkhqS2Fm?=
 =?utf-8?B?UG9ZYXo0NnIydi9QOEYrbzh4ODRFWXEzYVlNQTFMWGd5TmZjK0NPblZ5NjNo?=
 =?utf-8?B?QkRUMEx2ckxuU01ZYnZ0MFJIZDZ1dk1NL2RWV0k1Q3RwNVI0NVcvWDFZUzZH?=
 =?utf-8?B?dlFEQVpQYkZHdmFRNmszTSt6cTBZcUxUcm9TcGx6Z3RmQlBpWWNoR1RDN3pu?=
 =?utf-8?B?Tk1DNW4zT2J4NTl5Wmo1a2JOeVpMMDExaTBSNUhNNHZBdDNMQTg3QT09?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fd92e2-50fa-4545-6768-08ded750691a
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB2946.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:09:09.6301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsD0O3LqTjpoWzQU5k3dypzcbuaruT+RG6RgMzo0hLyN0qOiTxRRsiTl8OW6fX/rTeIDxOqb+55cl8FrDc7DbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB5474
X-purgate-ID: tlsNG-c1860d/1782896954-A39353FC-B4FD0D71/0/0
X-purgate-type: clean
X-purgate-size: 16799
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:url];
	FORGED_SENDER(0.00)[takakura@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:taka@valinux.co.jp,m:den@valinux.co.jp,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[takakura@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6D996EB7A2

Hi Roger and Andrew,

On Tue, 30 Jun 2026 08:47:14 +0000, Roger Pau Monné wrote:
>On Mon, Jun 29, 2026 at 11:01:28AM +0900, Ryo Takakura wrote:
>> Linux ftrace allows registering callbacks which is useful
>> for debugging and tracing events. On Linux, it is done by
>> reserving function entry points at compile time which can
>> later be patched to branch to a trampoline.
>> 
>> This patch implements similar callback feature, but with
>> different approach using existing livepatch infrastructure.
>> Instead of reserving function entry points at compile time,
>> the traced function will be livepatched so that it branches
>> to the trampoline.
>
>While this is an interesting usage of the livepatch logic in new ways,
>may I ask why not do as Linux and add an empty function preamble that
>can be replaced at run-time with calls to hooks?
>
>You could still re-use most of the livepatch logic for handling the
>addition of the hook calls, but it would be nicer in that we won't
>need to move the original function.

I agree that we can reuse a lot of livepatch logic.

>> The role of the trampoline(illustrated below) is to preserve
>> the context while jumping to the tracer function, and return
>> back to the traced function with its context restored.
>
>Alternatively - why not use livepatch-build-tools against a build with
>the added hooks to generate a proper livepatch?  This looks a bit
>fragile to me (see the question from Andrew about fixing up
>instruction pointer relative references).

Yes, I think proper livepatching would still be preferred
given all the concerns Andrew and Roger raised.

>On x86 at least we would also need to adjust the bug frames and
>exception table contents, and the contents of the symbol table to
>account for the function being moved.
>
>IOW: it looks like overall this is a lot more work than possibly
>reserving a function preamble to add hook calls?

Yes, I agree.
(I wasn't aware of this additional work when I replied
to Andrew yesterday, thanks!)

And if I were to summarize the discussion so far, assuming we
still want to add a tracing-feature, I think we are in agreement
adding an empty function preamble like Linux.
(I personally would still like to see a framework on Xen
that is more convenient and tracing-friendly which can be used
reliably at the same time)

If this sounds reasonable, I will try preparing one based on
the feedbacks I was given so far:
- Use of Linux-like reserved function preamble
- Use of __attribute__((no_caller_saved_registers))
- Split replacement and preamble-hook handling in common code

Let me know your thoughts!

>> trampoline:
>>     Save regs
>>     Call tracer function
>>     Restore regs
>>     old_addr
>>     return old_addr + 4
>> 
>> One can request the feature by setting @trampoline_buf to 1
>> which will allocate a buffer for trampoline.
>> 
>> Signed-off-by: Ryo Takakura <takakura@xxxxxxxxxxxxx>
>> ---
>> 
>> Hi!
>> 
>> For the future, I'm thinking of linux-like extensions
>> which help tracing and debugging by passing:
>> - saved registers
>> - caller information
>> - private data
>> - and so on ...
>> 
>> I would appreciate any advice or suggestion.
>> Thanks!
>> 
>> Example payload file:
>> 
>> #include <xen/lib.h>
>> #include <xen/livepatch.h>
>> 
>> static void my_tracer(void)
>> {
>>     printk("livepatch: do_domctl was called\n");
>> }
>> 
>> static struct livepatch_func funcs[]
>>     __attribute__((section(".livepatch.funcs"))) =
>> {
>>     {
>>         .name = "do_domctl",
>>         .old_size = 4572,
>>         .new_addr = my_tracer,
>>         .new_size = 32,
>>         .trampoline_buf = (void *)1,
>>         .version = LIVEPATCH_PAYLOAD_VERSION,
>>     }
>> };
>> 
>> Sample output:
>> 
>> $ tools/misc/xen-livepatch list
>>  ID                                     | status     | metadata
>> ----------------------------------------+------------+---------------
>> trace_do_domctl                         | APPLIED    |
>> $ xl vcpu-list Domain-0
>> Name                                ID  VCPU   CPU State   Time(s) Affinity 
>> (Hard / Soft)
>> (XEN) livepatch: do_domctl was called
>> (XEN) livepatch: do_domctl was called
>> (XEN) livepatch: do_domctl was called
>> (XEN) livepatch: do_domctl was called
>> (XEN) livepatch: do_domctl was called
>> (XEN) livepatch: do_domctl was called
>> (XEN) livepatch: do_domctl was called
>> (XEN) livepatch: do_domctl was called
>> (XEN) livepatch: do_domctl was called
>> Domain-0                             0     0    1   -b-      67.7  all / all
>> Domain-0                             0     1    3   -b-     457.2  all / all
>> Domain-0                             0     2    2   -b-      42.4  all / all
>> Domain-0                             0     3    0   r--      32.4  all / all
>> 
>> Sincerely,
>> Ryo Takakura
>> 
>> ---
>>  xen/arch/arm/arm64/livepatch.c      | 104 +++++++++++++++++++++++++++-
>>  xen/common/livepatch.c              |  40 +++++++++--
>>  xen/include/public/sysctl.h         |   3 +-
>>  xen/include/xen/livepatch.h         |  13 +++-
>>  xen/include/xen/livepatch_payload.h |   2 +
>>  5 files changed, 150 insertions(+), 12 deletions(-)
>> 
>> diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
>> index e135bd5bf9..b7c9aba94e 100644
>> --- a/xen/arch/arm/arm64/livepatch.c
>> +++ b/xen/arch/arm/arm64/livepatch.c
>> @@ -15,6 +15,29 @@
>>  #include <asm/insn.h>
>>  #include <asm/livepatch.h>
>>  
>> +
>> +#define AARCH64_REG_SP 31
>> +
>> +static uint32_t aarch64_insn_gen_stp_pre(unsigned int rt,
>> +                                         unsigned int rt2)
>> +{
>> +    return 0xa9800000 |
>> +           (((-16 / 8) & 0x7f) << 15) |
>> +           (rt2 << 10) |
>> +           (AARCH64_REG_SP << 5) |
>> +           rt;
>> +}
>> +
>> +static uint32_t aarch64_insn_gen_ldp_post(unsigned int rt,
>> +                                          unsigned int rt2)
>> +{
>> +    return 0xa8c00000 |
>> +           (((16 / 8) & 0x7f) << 15) |
>> +           (rt2 << 10) |
>> +           (AARCH64_REG_SP << 5) |
>> +           rt;
>> +}
>> +
>>  void arch_livepatch_apply(const struct livepatch_func *func,
>>                            struct livepatch_fstate *state)
>>  {
>> @@ -34,12 +57,87 @@ void arch_livepatch_apply(const struct livepatch_func 
>> *func,
>>      /* Save old ones. */
>>      memcpy(state->insn_buffer, func->old_addr, len);
>>  
>> -    if ( func->new_addr )
>> +    if ( !func->new_addr )
>> +    {
>> +        insn = aarch64_insn_gen_nop();
>> +    }
>> +    else if ( func->trampoline_buf )
>> +    {
>> +        int rc;
>> +        uint32_t *trampoline = func->trampoline_buf;
>> +        uint32_t *tp = trampoline;
>> +        void *orig_cont_addr = (void *)func->old_addr + len;
>> +        unsigned int trampoline_code_size = len + 12 * ARCH_PATCH_INSN_SIZE;
>> +        unsigned long trampoline_start = (unsigned long)trampoline & 
>> PAGE_MASK;
>> +        unsigned long trampoline_end =
>> +            PAGE_ALIGN((unsigned long)trampoline + trampoline_code_size);
>> +
>> +        /*
>> +         * Make the payload text area writeable while generating
>> +         * the trampoline instructions.
>> +         */
>> +        rc = modify_xen_mappings(trampoline_start, trampoline_end,
>> +                                 PAGE_HYPERVISOR);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR LIVEPATCH
>> +                   "Failed to make trampoline writable: %d\n", rc);
>> +            return;
>> +        }
>> +
>> +        /* Save state before calling the tracer. */
>> +        *tp++ = aarch64_insn_gen_stp_pre(0, 1);
>> +        *tp++ = aarch64_insn_gen_stp_pre(2, 3);
>> +        *tp++ = aarch64_insn_gen_stp_pre(4, 5);
>> +        *tp++ = aarch64_insn_gen_stp_pre(6, 7);
>> +        *tp++ = aarch64_insn_gen_stp_pre(29, 30);
>> +
>> +        /* Call user's tracing function. */
>> +        insn = aarch64_insn_gen_branch_imm(
>> +            (unsigned long)tp,
>> +            (unsigned long)func->new_addr,
>> +            AARCH64_INSN_BRANCH_LINK);
>> +        *tp++ = insn;
>> +
>> +        /* Restore state before continuing original function. */
>> +        *tp++ = aarch64_insn_gen_ldp_post(29, 30);
>> +        *tp++ = aarch64_insn_gen_ldp_post(6, 7);
>> +        *tp++ = aarch64_insn_gen_ldp_post(4, 5);
>> +        *tp++ = aarch64_insn_gen_ldp_post(2, 3);
>> +        *tp++ = aarch64_insn_gen_ldp_post(0, 1);
>> +
>> +        /* Original instruction. */
>> +        memcpy(tp, state->insn_buffer, len);
>> +        tp += len / ARCH_PATCH_INSN_SIZE;
>> +
>> +        /* Branch back to original function. */
>> +        insn = aarch64_insn_gen_branch_imm(
>> +            (unsigned long)tp,
>> +            (unsigned long)orig_cont_addr,
>> +            AARCH64_INSN_BRANCH_NOLINK);
>> +        *tp++ = insn;
>> +
>> +        clean_and_invalidate_dcache_va_range(trampoline, 
>> trampoline_code_size);
>> +
>> +        rc = modify_xen_mappings(trampoline_start, trampoline_end,
>> +                                 PAGE_HYPERVISOR_RX);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR LIVEPATCH
>> +                   "Failed to restore trampoline RX mapping: %d\n", rc);
>> +            return;
>> +        }
>> +
>> +        /* Branch from original function to trampoline. */
>> +        insn = aarch64_insn_gen_branch_imm(
>> +            (unsigned long)func->old_addr,
>> +            (unsigned long)func->trampoline_buf,
>> +            AARCH64_INSN_BRANCH_NOLINK);
>> +    }
>> +    else if ( func->new_addr )
>>          insn = aarch64_insn_gen_branch_imm((unsigned long)func->old_addr,
>>                                             (unsigned long)func->new_addr,
>>                                             AARCH64_INSN_BRANCH_NOLINK);
>> -    else
>> -        insn = aarch64_insn_gen_nop();
>
>If we want to go this route, and use livepatching for this purpose, we
>need to branch the use-cases in common code, and have arches provide
>both a replacement and a preface addition hooks IMO.

I think that is a good idea.
I'll take this into account for the next.

>>  
>>      /* Verified in livepatch_verify_distance. */
>>      ASSERT(insn != AARCH64_BREAK_FAULT);
>> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
>> index 7515a040ad..8863ad5ca3 100644
>> --- a/xen/common/livepatch.c
>> +++ b/xen/common/livepatch.c
>> @@ -280,10 +280,30 @@ static int move_payload(struct payload *payload, struct 
>> livepatch_elf *elf)
>>  {
>>      void *text_buf, *ro_buf, *rw_buf;
>>      unsigned int i, rw_buf_sec, rw_buf_cnt = 0;
>> -    size_t size = 0;
>> +    const struct livepatch_elf_sec *sec;
>> +    const struct livepatch_func *funcs;
>> +    unsigned int nfuncs, trampolines_needed = 0;
>> +    size_t size = 0, trampoline_size = 0;
>>      unsigned int *offset;
>>      int rc = 0;
>>  
>> +    sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_FUNC);
>> +    if ( sec )
>> +    {
>> +        funcs = sec->addr;
>> +        nfuncs = sec->sec->sh_size / sizeof(*funcs);
>> +
>> +        for ( i = 0; i < nfuncs; ++i )
>> +            if ( funcs[i].trampoline_buf == (void *)1 )
>> +                trampolines_needed++;
>> +
>> +        if ( trampolines_needed )
>> +        {
>> +            payload->n_trampolines = trampolines_needed;
>> +            trampoline_size = trampolines_needed * LIVEPATCH_TRAMPOLINE_SIZE;
>> +        }
>> +    }
>> +
>>      offset = xmalloc_array(unsigned int, elf->hdr->e_shnum);
>>      if ( !offset )
>>          return -ENOMEM;
>> @@ -323,8 +343,8 @@ static int move_payload(struct payload *payload, struct 
>> livepatch_elf *elf)
>>       * them on separate pages. The last one will by default fall on its
>>       * own page.
>>       */
>> -    size = PAGE_ALIGN(payload->text_size) + PAGE_ALIGN(payload->rw_size) +
>> -                      payload->ro_size;
>> +    size = PAGE_ALIGN(payload->text_size + trampoline_size) +
>> +           PAGE_ALIGN(payload->rw_size) + payload->ro_size;
>>  
>>      size = PFN_UP(size); /* Nr of pages. */
>>      text_buf = vmalloc_xen(size * PAGE_SIZE);
>> @@ -335,9 +355,12 @@ static int move_payload(struct payload *payload, struct 
>> livepatch_elf *elf)
>>          rc = -ENOMEM;
>>          goto out;
>>      }
>> -    rw_buf = text_buf + PAGE_ALIGN(payload->text_size);
>> +    rw_buf = text_buf + PAGE_ALIGN(payload->text_size + trampoline_size);
>>      ro_buf = rw_buf + PAGE_ALIGN(payload->rw_size);
>>  
>> +    if ( trampoline_size )
>> +        payload->trampoline_addr = text_buf + payload->text_size;
>> +
>>      payload->pages = size;
>>      payload->text_addr = text_buf;
>>      payload->rw_addr = rw_buf;
>> @@ -690,7 +713,7 @@ static int prepare_payload(struct payload *payload,
>>  {
>>      const struct livepatch_elf_sec *sec;
>>      const struct payload *data;
>> -    unsigned int i;
>> +    unsigned int i, trampoline_idx = 0;
>>      struct livepatch_func *funcs;
>>      struct livepatch_func *f;
>>      struct virtual_region *region;
>> @@ -737,6 +760,13 @@ static int prepare_payload(struct payload *payload,
>>              if ( rc )
>>                  return rc;
>>  
>> +            if ( f->trampoline_buf == (void *)1 )
>> +            {
>> +                f->trampoline_buf = (char *)payload->trampoline_addr +
>
>You don't need to cast to char *, the type of trampoline_addr is void
>*, and we use the GNU extension to allow void pointer arithmetic by
>treating the size of a void or of a function as 1.

Oh, thanks for the advice!
I'll keep it in mind.

>> +                                    trampoline_idx * 
>> LIVEPATCH_TRAMPOLINE_SIZE;
>> +                trampoline_idx++;
>> +            }
>> +
>>              rc = livepatch_verify_distance(f);
>>              if ( rc )
>>                  return rc;
>> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
>> index c7cd9b4eb0..e79615d7c9 100644
>> --- a/xen/include/public/sysctl.h
>> +++ b/xen/include/public/sysctl.h
>> @@ -1010,10 +1010,11 @@ struct livepatch_func {
>>      const char *name;       /* Name of function to be patched. */
>>      void *new_addr;
>>      void *old_addr;
>> +    void *trampoline_buf;   /* Trampoline buffer when set to (void *)1. */
>>      uint32_t new_size;
>>      uint32_t old_size;
>>      uint8_t version;        /* MUST be LIVEPATCH_PAYLOAD_VERSION. */
>> -    uint8_t _pad[39];
>> +    uint8_t _pad[31];
>
>New fields should be preferably added at the tail of the structure,
>and the change here needs to be propagated into livepatch-build-tools
>livepatch_patch_func structure.  See:
>
>https://xenbits.xen.org/gitweb/?p=livepatch-build-tools.git;a=blob;f=common.h;h=7f3a82ffdb29d2d1d117c1ccb20cc328bdb0529a;hb=HEAD#l135
>
>This is sadly all very fragile.

Thanks. I will make sure to update livepatch-build-tools if needed.
(But I believe the change here won't be needed as pointed by Andrew [1])

>>      livepatch_expectation_t expect;
>>  };
>>  typedef struct livepatch_func livepatch_func_t;
>> diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
>> index 45c8924f34..7a81763cf2 100644
>> --- a/xen/include/xen/livepatch.h
>> +++ b/xen/include/xen/livepatch.h
>> @@ -48,6 +48,8 @@ struct xen_sysctl_livepatch_op;
>>  #define ELF_LIVEPATCH_POSTREVERT_HOOK ".livepatch.hooks.postrevert"
>>  /* Arbitrary limit for payload size and .bss section size. */
>>  #define LIVEPATCH_MAX_SIZE     MB(2)
>> +/* Size of a trampoline used for function tracing */
>> +#define LIVEPATCH_TRAMPOLINE_SIZE 128
>>  
>>  struct livepatch_symbol {
>>      const char *name;
>> @@ -109,13 +111,18 @@ unsigned int livepatch_insn_len(const struct 
>> livepatch_func *func,
>>  
>>  static inline int livepatch_verify_distance(const struct livepatch_func 
>> *func)
>>  {
>> +    const void *target;
>>      long offset;
>>      long range = ARCH_LIVEPATCH_RANGE;
>>  
>> -    if ( !func->new_addr ) /* Ignore NOPs. */
>> -        return 0;
>> +    if ( func->trampoline_buf )
>> +     target = func->trampoline_buf;
>> +    else if ( func->new_addr )
>> +     target = func->new_addr;
>> +    else
>> +     return 0; /* Ignore NOPs. */
>
>FWIW, indentation is wrong here, you are adding hard tabs.

My mistake. I'll fix this.

Sincerely,
Ryo Takakura

[1] https://lists.xen.org/archives/html/xen-devel/2026-06/msg01583.html

>Thanks, Roger.

