Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HhpFFnm9JmpecAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 15:02:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7615A656651
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 15:02:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=QmL7ShN1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331636.1594188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWZbm-0001MI-8i; Mon, 08 Jun 2026 13:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331636.1594188; Mon, 08 Jun 2026 13:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWZbm-0001KG-5l; Mon, 08 Jun 2026 13:01:38 +0000
Received: by outflank-mailman (input) for mailman id 1331636;
 Mon, 08 Jun 2026 13:01:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wWZbk-0001KA-OE
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 13:01:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWZbj-000HUb-PH
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 15:01:35 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26bd29-5cb7-0a2a0a5109dd-0a2a4504db36-38
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 15:01:35 +0200
Received: from [40.107.208.32]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a26bd2d-1dec-0a2a45040019-286bd02050c6-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 15:01:35 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA1PR03MB8192.namprd03.prod.outlook.com (2603:10b6:208:59c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 13:01:32 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 13:01:32 +0000
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
 b=b5fpBqz98P8jU2FC/+8xvQeiK6i2PpmwUMWjC8+2PYM2GzAZcBDXd9h/lJn+jD+HdhrcWNnsvNn6OrfmMk4U5ucKQGijIvUI7vmQH3wQiDIC3h84g7eeqHH9JyrqO8vVY985zYEJzdbXZcplAGrQ55YHANM6UUEv9fO5tLWLMzuDSlJqciJ6263EMze6+/vFu9GTEEoU+AcQ04jlj4xLqb8dbPQsiFviduZPLRRTFucH67boTx3nrto/8rIft5XdMvVIZo6OI1cs1N19KsBZEUylvo64dHVMUvTHpfjnwA4WEbqV9qpOsHN4kJdG29ilsgy0WAjKTEcBYVJ6SXZ//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srDP+9dqUSQAs2nFA27JviZecC10Uy/I7iwWVG+cqW8=;
 b=UdttyT8R4gz7p0W96FZs4D/UIQO0PS8F0ZADrSAcMgFuKikJc8R7y9sBFhdS8lit1ecNs5M1y5d0ElwPW/bfkya0tqWgmjNhoByyWO/2OogvS96DVQt40HpHhVJ45C1Fp6SMqN2+xFcO1S2jJ1nyYUSe6pBOK9XXxVA2jDyZGM0WdLcOns1+NDp6qIii+g9Id1/SMZL2fAP00/pkY2bkV7gspvDslvlzAakN8jTvKNRghyVucPVpsRkgWnonprfPyWevwVvdkh4Fm9DkHnvGqtKYGoovzHJN/IWXYoYHJlQ8uMxVT8mlIOBO+sj6wUyItahIPIL9qfdjM/ieiR3etA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srDP+9dqUSQAs2nFA27JviZecC10Uy/I7iwWVG+cqW8=;
 b=QmL7ShN1joZqcAYsrGB5+HN9rz9a1XofP/HjnHwVHwvZ7KF3YGQSuRTjbBm3EOyyCv2eiQyZY88dsArDDq6SC2/1JZmUDDZwX5YayGV2aEMBHrn/xjaFcV3VS3cogqSQlC60gOAI3cILlSGu8Rzs38BeSxQ1zw1KUHsubM+FLuA=
Date: Mon, 8 Jun 2026 15:01:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>, oleksii.kurochko@gmail.com
Cc: xen-devel@lists.xenproject.org, jgross@suse.com, dfaggioli@suse.com,
	gwd@xenproject.org, stewart.hildebrand@amd.com, jbeulich@suse.com,
	andrew.cooper3@citrix.com
Subject: Re: [PATCH for-4.22?] xen/sched: remove duplicate trace.h include
Message-ID: <aia9KAdYMxbZsihD@macbook.local>
References: <20260531140819.73467-1-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260531140819.73467-1-frn1furkan10@gmail.com>
X-ClientProxiedBy: MR2P264CA0165.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::28) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA1PR03MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b184c1-64ed-4196-941c-08dec55e0fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DA7l+GhKDCjhULSJ/bmfB0zgiWEkaquKqNW1fLR517FKqtEmT4LokSVVa6/mclmeRo7pNkXysJptoUgG+RCj6mJCciJsb97Za3w50uHvvROm0jUuVKdVPxn7xi45G1mB+HBlgeR+WfgmUr35M8kg+bh+QJ1R36inxXYmuxFo509roorZUFuIqURuWI+1+8BN9n3gi1wyPQLOmbE8pdnj2L0npOI/cEqnsV1PKVvxlSYRrDyVr/OvO43cDzdreI1Yp5+o1Zr9cuMfG8rcwrNRayt9/ndjccIK9LhOR9pxaqRApEw6g1+3Ip77GrSYRPvd35hGeroo7vN2Fea/mnhi8LqGUPxmKB3gRpLWUF60gBqIiezzoLAwJPMlVovOkRIkPO9ICioIDx5kiZhFJgbpT87GujW2FdXOsUECp787AdnN70N9yWZpSzVS/wi0XIqTtLg6s+U1UuMJfFmKdaKiNKBhpbkggn6T2HtrzyHNAF2QRYlhK94PoD7TJxISyFDUfJv2BEMH2wUFZmVQqIePXF+TTcFqTxWG52HJJqKeJ4Mq+a+4Frb0K4tg/yTZsbmvIp+BuGOZ+KFdd0P5tFXFP+YVHrQfypk3ngtjhpZ1KyDEE/nfb9h4YCJmPtfiZJ1SDMG/71rBOQzkkmzW0CPMScetO5A+IxS4TDiE0P9qjeZj4PkUjuoJRobw8p7QXlgB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTRxZ29EUndoS3hncU5nc0hPWFFiTXl0Zm9iY3pabHFxbU9UU1lGbVpXWDQx?=
 =?utf-8?B?NWVzRm5HV3Y1akFMeGJLNzhreGFsVlFHeHRld0Nkem9pWVlWdWxOemJCUWdZ?=
 =?utf-8?B?cno0cFhOWlA3U2lKcFZZK2s4NW14dmYzcUh0SnpmTFJvaHpFbmdpZ2pOOElV?=
 =?utf-8?B?cVB0eFFyQlMwRTBNR3JPSFI3dFdGVnBDYXpjRG52WlhuUFFPQVdpd0Q1Umdn?=
 =?utf-8?B?L0ZTTGFmc3F0SlhSR0Z4eWV5KzF5U0tycWh5UnNXbzBrQmtYVWdxMVZtTktU?=
 =?utf-8?B?VlM2eXlBc1EwN28rYnBBU3NaUFJlT1Y4OWpXOHdsMHhKZ0Z3UmtmbDc1QWpO?=
 =?utf-8?B?eUZqOEZneG01Q1Z1UXNxbFUwcEplQkYvUHJaenhyUmZrQXdXZDNLdDB5c052?=
 =?utf-8?B?a2xDd2sxQVozUWV6ZHN6UmdDVmg4a0FPNlB5Y0NuZXp4Ymp4alRwVEsxOTV6?=
 =?utf-8?B?VXhxZ2lSK2ZxKysyWEE4UFRxMEhWcDhrbUt2TUN3Z0NtUWFNcjh2TGNDYUg1?=
 =?utf-8?B?bGxFOFZNay9CRWNNTVo3cVpsZmFiRDNxRHZmb295YkV5RWU0RlJwSWt5ZWx3?=
 =?utf-8?B?SGdFYzY1Z3BseXhNSU9pUkZPejJxVFlFYWEvbWJjemtVWmhHdFlxcFhSZDRN?=
 =?utf-8?B?U0FMdGJWcXhMQzIrUEZiNlZocUFoWDU1Rm1xVEFDZGVMM0V3ajBZaEFCS3dX?=
 =?utf-8?B?Mm4zVEo2N1ZEYzhQVDMxdG1hajNkNnhMcjdkM0tzWThGVjBabWlweTU3cXFq?=
 =?utf-8?B?c2FMTVFyQmErZ3kvdHhKUjdpMEZHc3psbVE4ODRBSFA1aXNyT2tXUndkeSt6?=
 =?utf-8?B?SUkwTTd1OTBIYU9sV3FyUjFzTjlxUGllams1M2twUmMvTnloL2NhUXE4amEx?=
 =?utf-8?B?WVZTTzk1NnFDRHNIUlM5NUJ1NTcwL0hSMVkzYU5LbE1Wa1pXN3VSVE96QURz?=
 =?utf-8?B?ZjJzZWlvYmQyZVJNT25weVdyVWZQYjlpdm4wa204ZFpFNkhwaElMdVVwdkZQ?=
 =?utf-8?B?SGlKM2ZjdldOS0RvOGhnc2VUZGFQOEhYenN0eURVSUgzalMxYVVyc0EzZ3pT?=
 =?utf-8?B?L1dvSzF3RWVCRWtwZStTYnNPVWV3dWxxVndvb0FMV3VwMUI3cFVUMG5SY0ZT?=
 =?utf-8?B?RXR4YUFyS3c3WUVaYW13SDVmdTk1eXM4VE1YZUhpdEpnYVl3YXFhaFB3Vi82?=
 =?utf-8?B?VFRDR2FJak11UkttNjErTm0rRjIzUEFBTHdHaXBjSE5TSkYyVTgrTWlJd0c2?=
 =?utf-8?B?Y0xsMmFHVkFUU0J0SmFFMUY2bHBBOUh5bW9UT3BiNDBGTktlWCtzNmh0WkJW?=
 =?utf-8?B?WDA3ZVpxZ1hxSTUxYWVhd0EwQ00wOHJHWWlOYlNNd09PK3llUk5RZy94VEhH?=
 =?utf-8?B?YlZqSHZBOGVoNUE2REZYUG9jSnBrNzBvWmRRN3NsbDlSNEJ4eVErZm9XcHMv?=
 =?utf-8?B?ZC9WaXNwbDN4WkEwT2JBUWhpRUZyUWJ6Z1dSK2lUTUVRTTlyZVBzYWsvRk1U?=
 =?utf-8?B?Mit0eXlxWHp0bVRoVG1YWVl0SUtMeUhYbFl5QlYvNk8zUFZXL0h2d0g3VGdZ?=
 =?utf-8?B?emUveVhnbVp4SzJJY2JvSjhJQWhIbitHdFo5SnVuNmd6dXdIeXNyOHdCd1J4?=
 =?utf-8?B?WXpnMDBwekFRWEtKWllXTFMyTkgyR3FhWG11V28xalBSdHdRY0c1akJ2b0Uy?=
 =?utf-8?B?ODVIVTFjeUxZRi9oUWFiRENTU3hPQ2x6RUsxTStSc0hubzJuR29XUGlJby8x?=
 =?utf-8?B?SDFYQVVZN3ordWZtWTFMTmZmNzQ0MVd4Q1kxMEJsbzJJcTBvYmJmcmczS3R4?=
 =?utf-8?B?cW0zMWQ1V3NzZE1JMmF5d05JOHgzZGZCeGtBWXpsWjFDL3V0a1JlOFo2TW1U?=
 =?utf-8?B?dGR5ekZkYkNoVDNuSkl1N3VYVzJ0OThuNzFPSlJSNjB6aDRObWFLSFM5UU5E?=
 =?utf-8?B?d0l5YjgxWDdOM1ppRUNvZUdvditMSWNiaktDT3lpajhkNU5EY01yM1RjbkhO?=
 =?utf-8?B?TTdZeXYramlJREhiRkZReW1HUEZZRU1GZndqOENzVWJ3MnBRTXowakJIZ2Nk?=
 =?utf-8?B?M3dXM3FyL3BuOXdaZDZjOGV6TWIvNy9wWFMxWmlLODI1NFduY0lzZWMvc3Yv?=
 =?utf-8?B?V0xGd3V2K2RxQzJpVjJWT1RIazExOFV5V0grelhZQlBua1RSMHlUYkVnb2tw?=
 =?utf-8?B?Q2FNcHNwUWN2UkNZNXdrSnBVZU1KVmNSSFR3UHZTV1RublZNcTNoOVUwUmFi?=
 =?utf-8?B?K0kxUTNvdi9vdFRHR2hUMTI3elVnZ2FLN3Z3WS9ST1dzZXdOdXNsRllyclZM?=
 =?utf-8?B?LzhNUXlCbGJlcVVsSVRVN3lpZUtpTG04azROYmdkTUcrWEE1ZW1xQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b184c1-64ed-4196-941c-08dec55e0fe5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 13:01:31.9523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiIvJPhoIIBtscWropnGZ1lmh0Ei8R0/+xL5znFk71F6Ci7aB9qXf+DZ6crn+rfbEmfJRcfEbFFK1w+m+3Ognw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8192
X-purgate-ID: tlsNG-ebf023/1780923695-29B7B3FF-7B9C6FC0/0/0
X-purgate-type: clean
X-purgate-size: 327
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.68 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:frn1furkan10@gmail.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:stewart.hildebrand@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:from_mime,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7615A656651

On Sun, May 31, 2026 at 05:08:19PM +0300, Furkan Caliskan wrote:

Fixes: 8726c0557752 ("xen: add real time scheduler rtds")

> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>

Given this is non-functional change, and has a reviewed-by, what do
you think Oleksii, should be commit it for 4.22?

Thanks, Roger.

