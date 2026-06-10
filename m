Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P1sIJY8zKWotSQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 11:51:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C6C66801D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 11:51:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=g4Fs9Xyv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334099.1597201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXFaF-0001jK-19; Wed, 10 Jun 2026 09:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334099.1597201; Wed, 10 Jun 2026 09:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXFaE-0001gn-Ui; Wed, 10 Jun 2026 09:50:50 +0000
Received: by outflank-mailman (input) for mailman id 1334099;
 Wed, 10 Jun 2026 09:50:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wXFaD-0001gh-6U
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 09:50:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXFaC-00B6nW-JG
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:50:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a293377-5cb7-0a2a0a5109dd-0a2a4501cf4a-4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:50:48 +0200
Received: from [40.93.201.27]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a293376-c1f2-0a2a45010019-285dc91bb7da-4
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:50:48 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by PH8PR03MB989184.namprd03.prod.outlook.com (2603:10b6:510:3b2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 09:50:44 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 09:50:44 +0000
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
 b=F1MZCMxYatQqdaLGRA/llyOFTPhdDB7sXjp0Gp8mgR1UovuRHKNrimPAgC/71bpC53qcPt1OK6GYZygiJY8sUpgBuZNIORhC9hL5v1Ln5Xsm2s/cEMPm6Q5SBsxR2OFqtJTojsnzZr/pMdQE/MQ0Mv3HR4teyOq9rvP+9PWnEU6kKieGlFvBs0BeIdvhsfo8fYZNsDDSLk5EKxBihlDc6Nfy3Q5WGyLCP3cAlgyr0Pv6dzVmlSDgQPrJOkAeB17NDf5x5P1aee9ba5tt30KB6wPok85rlpKbON7/xwmw+TRKvpTrb3h/9FSTFxbwboJFlGj+m++0fvtN1cINo5f0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+qm1leoAjrT8y99LtftJEiKLFqQvkzOA5UvxrdnIvE=;
 b=Zz3kBNKzTrfNrRRnEQrPVG4MqJZFgBcfbkv5G0odFPCBFlAUiTjyi9jgJNefN3qzyjhuat+6yaV8OZO/7cdKt2vxFScNJ1++4WJLNgUS1oh5BuFQMS/ulkFWhyvjwtV/U1fNPWgYu/t4LzCCneU/XLzCrUhG2ux9qmGNFTq/hJvI13tHsYslEstB7CY+ouLGhsp+L9bHtfhoE5MFxDWpTWjOo6GQT6bsB5ESyvmLDNY7Wx2RV8xl6jJooXr/diwda9aWfl9mjxi+eDQyHCytNruUo91uUDbUvyt13tQM4VdrL/SoRMbaRMKKoDaSgZCSipPqiFYAArsOuX0gLjsuLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+qm1leoAjrT8y99LtftJEiKLFqQvkzOA5UvxrdnIvE=;
 b=g4Fs9XyvVdYWK+7dcoLKwkp0Rq9pF755smLE4NbJWqhpg6qmY0q66CW5kraSNMUjBqzr9LnrzL3+mB3FX0lHxXsCK5UHWcUl2SbYE+hAwIFImKrFGlB0T77LMZYfsRsEXbiGIj/zPQdhrP93TwYoYbyibJr8kwfUonpHkhK+CuM=
Message-ID: <8ca2cba1-bea1-430a-9241-4fbc16fa0244@citrix.com>
Date: Wed, 10 Jun 2026 10:50:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] domctl: Handle some of XEN_DOMCTL_shadow_op
 without the domctl lock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <20260609151528.2426788-3-ross.lagerwall@citrix.com>
 <aikhxaH3ZKyd33IY@macbook.local>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <aikhxaH3ZKyd33IY@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0327.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::8) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|PH8PR03MB989184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1e0a49-4f0f-45ce-9449-08dec6d5bdc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|5023799004|22082099003|18002099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	cfdxGRSAEZJMz4iRMI2pXGvEuoUIoHLi1KZFty1ZmPUf9o/3wPZh5NoQjHvITIF/0I/s296poZhD1+KhdYdQmgEPEJ9dx6J+zOs/Q/MYSd/zl6IQHTBaSH/sTGL8bVlVNaeriENKDm4HYGbbJc1i7SpUnVnEkfInBZvVnAcvA0NuTxuIjoZRSgCCYMoMQBpXoo3J8X1a7qXiAKsu/1pNXlkcu16yIlcoPEwclrvYVWVsz2fQhyK3aDdSOf4sG9iYaODYu4qzTYJlhXtQC/B5AiiAzR20Iw2jnrR0geD2mclY0+j/bxFVjBA9h5o9rfvm9b+CsWStXWTpgv86ehGcAb8zbCXLJq8CUZ48oREGzymlh4x4btX553G+wzWLsrJpOLdltMubj+BHlMv+4LvDB8mzpxscxv/B4Y4abE7e/frLFnBSZMVLQa/Ydnv0+d8G0SXB35mF2DOsFpVt3q9SKXviGTxWrIHVMnne0KWJn5VRpWDPCS/9fsLpAjecXRVKjuZC6nbmvqbCrRsDW6EyoaBuxAcplFBe9zp8vLhC8nhH2Lik3pLHuMQymcQTOoq06ucpyDKAd5WDNZa2DhDdaoxoOdtOc4dcoWW4YObTA0zosoASmUdMdRfIBq9DsnXBHnKfDJND47PTAPayM6M5PnxKs9wcSTbxviSHT8fFVogjKEc5v6CIRUgr80cIVrEL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkNid21KNFNQNys5RVl4TVozM3dzVFE1b0Rtb0lWemQ5dDk4TGJLNkNKYXhQ?=
 =?utf-8?B?UTRpNGxYR0crT0pURVRBUVE2cmJKdUgvalhuV1VSemtjLzJDRWdlenRBb2ho?=
 =?utf-8?B?ZmhZcHpxS1BiZllUTUhDWjRvbXVUbThuRVZLVlpsMGJwRjhMRFp6bWNscDhi?=
 =?utf-8?B?WGYxSDFmMkhkcFA5ZjljODZ3MWI3ZkY5MHl1aVJpRVUva2pyWUJJMC9KUUly?=
 =?utf-8?B?S2syUy9xZm5TU3IyQ01IN2I5L3NwMUVqWnBhM0FEUHVEZHdCWVV6b2luS1ZB?=
 =?utf-8?B?OWdjMy9JWE9uVnp5ajdFQzJmWWJjclFNSThNYllmenJ6QXFzUDhQTW4zeUNN?=
 =?utf-8?B?WlZCR2tqVG9BWmVWbHBNT3crSDVaNUl2ZlVuNTVyL0NIKzVmQ3V3ODMwRW5X?=
 =?utf-8?B?a2NDc09XUnhNczNheWxicUR3cE1zZjgwT3BQaHVpQ1IrbThrUU1SMlo1dFc3?=
 =?utf-8?B?ZHZVU2RWQllnd29IazltTjFqREs2QWtWeUgvcFdVTXd3MTAxZDJYME9HdG84?=
 =?utf-8?B?WmFnNE1kODJSRUpXdFFMVHdFWGNuTmkzZlVXVXZiTE43S3JpZ29PeFFoc1RD?=
 =?utf-8?B?VVcrL2JvUSt2L0JBeUpWaUI0MUVHNTFHMnd0SHFqUkpUeEwxZ2FlVXd5Mzli?=
 =?utf-8?B?Z1gvZjYybGVsZUdFT1k5NjNBNVduSlkvL1k5aTVlaE9pQkV5TkJyR0w3bFVC?=
 =?utf-8?B?MnZzNm5USU1JR0FGS1RNWWNyTXVLN256TzR0azdhUWttTi9jeWFPMUxmcGZG?=
 =?utf-8?B?enk0YTFRd054ZzVLdERNQTk3UzFpSTFYS2gwdi9icXlPZnZCOEticGFYRStG?=
 =?utf-8?B?eHcyVXU0aW5sWHl4UzFRTHBMeUJuZ1o5U2MyTnlZNEwxTUtDcGN4dkhxZHo5?=
 =?utf-8?B?aGtLV2pZSmUzVld2MmM0Q1VDVDRIenFWV1AyNmM1SGgzOFNXSTJxUjcxdjN2?=
 =?utf-8?B?dVZiZjBnZWh2UFpwRzZsVjNUZm1LNHVTMVZzVWVuODgxN0J6Q3FHTG1TTWlC?=
 =?utf-8?B?ZWx3cW5qN2RNTUZEUmRwekRCWjRCcENldllibmFPdUZ3TUE0SnlxTktuTEV6?=
 =?utf-8?B?Rno3THQxaEdlWXhPVTNpOU5RYnhJUExaMkJ3aDQ4amJwSDAzYUd3cWo5aG9S?=
 =?utf-8?B?ckt2eUVBekZqcWphQ240VUlYNFJIczE4VHpuWlpSUWN2Q0Y3ZFlFaDJ0NGVq?=
 =?utf-8?B?am91bWV1eXFlanFuUWYvM2kwOFE0Y2N2ejJFU2hldW9BbVcrSGJ3YXg0UndE?=
 =?utf-8?B?Nk9IVGJPa2IxckVnTENDV3o0b3hrUHIrTDFWamluRjcrUStTVUsvVnA4QVhO?=
 =?utf-8?B?QVU5SHFCTnF0S3RyNU5lSVkxbVcrNEg2cmwzWDcvb3QxRzFKRm9YOXozOEVJ?=
 =?utf-8?B?dzVNNzBmaVlhOXZLOTU1Y3lhVjFDTUFTQnVTWEd5YitoZFpvWExvalJFUkZR?=
 =?utf-8?B?RzVHeTFMY1BrWHdFMlZ3Q2U3TGVya3VveXptYXhjWEVwR0VnTGhtbEhFTkx0?=
 =?utf-8?B?bXNWM0NSdXFVbnVjbTlEWjRlZW9PYldpMGpmdm5TN0VpYi9PRUZta2U3dE4z?=
 =?utf-8?B?U1pMUmhpRDBXeVgxY0dxTEpJVW5DbTJnTi9rM2ZyY3N5S2piQUJFNFV6OHFl?=
 =?utf-8?B?c2M5UkVFQk1lVHhwUDJzUTF2ZThCaEFlTmlHNGt6c01WYTg1S2RmcVlndzJn?=
 =?utf-8?B?blZVZ0VKbWtGVVkxUWdaZWI3Q2JYbzhhMThuckRoM2tBZlBQeWh5VlljeWpM?=
 =?utf-8?B?cno1Zzc2QjFCY0dwRmtTemN3OGV2YVNKZTRURWNWZXFsUHBYMHVlOUJadmww?=
 =?utf-8?B?SU0yZ2NldDRZSG5WMnFuUnNNRHNac2RrRlU0Y2Mwa3haQWZzL05MSXNCQXVy?=
 =?utf-8?B?VmYxSmZOcTZtRUE1d2pTdGVlVVlDOENXYS9WWXlSdGlsL1FNSk04RElRTkJM?=
 =?utf-8?B?NDlISEJWZVRlS2I3YW9zS05hTFpMNlVrMVRCKzhITmliRE1ZOWR2YXF4MnFz?=
 =?utf-8?B?WGZHYjhoNFk2T3hyU2dtSityTmRXSDFRSFdSWnhVTE13Yll4WkQvU2FUeTFH?=
 =?utf-8?B?dzErV1VBeEMwNFd6RWZnSWJjTTNUTFBiVjZvRThDUm9IUXFFYkxOcEZZNXFT?=
 =?utf-8?B?YUhocGZnNlo3VjJ4TEtQQlQ1NnczQndIQW95cTVFMXIxSmJudGhnUGtZTEV2?=
 =?utf-8?B?MTRUcmQ4enBBMllwaTFaTHN1amlpL2NkWVlRcDR2UE56ZU14RHZLRVpXUmkw?=
 =?utf-8?B?RjRvV3hERWdzMjNTMmtCOS9vY3Z5dTVBQnFEYjlTOThtUXV4U1g2V0NpcStJ?=
 =?utf-8?B?RW15ejZ5VUtlUkVKVkpRYTAxZTJmdlFaRDdocnJ0LzZHYlJQMFB1N0hlQWIw?=
 =?utf-8?Q?oEp2KoIvyxi2VipI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1e0a49-4f0f-45ce-9449-08dec6d5bdc1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:50:44.8650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlmFHn/wT2Go4YOs9TZE66TIlO1z5FtzWFK9o23NW4PYQia7mAyxFKDor5BfhXM/P77dCKm5RGgp7+PBUrevQW/AlCINpfhQhsUTDhARY8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989184
X-purgate-ID: tlsNG-d62444/1781085048-AD9A9FF4-CF5A18A4/0/0
X-purgate-type: clean
X-purgate-size: 4117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2C6C66801D

On 6/10/26 9:35 AM, Roger Pau Monné wrote:
> On Tue, Jun 09, 2026 at 04:15:28PM +0100, Ross Lagerwall wrote:
>> Handle XEN_DOMCTL_SHADOW_OP_{CLEAN,PEEK} without taking the domctl lock.
>> This is safe because for these subops, the paging lock is mostly held
>> which prevents it from operating concurrently on the same domain. There
>> are some parts that are called without the paging lock held:
>>
>> * hvm_mapped_guest_frames_mark_dirty() - The function itself takes a
>>    spinlock so is protected from concurrent calls. In any case, it will
>>    mark all the pages dirty as required.
>>
>> * domain_pause() - The toolstack cannot unpause the domain while in
>>    paging_log_dirty_op() because the toolstack's pause/unpause ops have
>>    a separate ref count.
>>
>> * p2m_flush_hardware_cached_dirty() - This is called elsewhere without
>>    the domctl lock held so holding it wouldn't achieve anything. It
>>    should be fine as long as it is called at least once.
>>
>> * log_dirty.ops->clean() - If the callback is hap_clean_dirty_bitmap(),
>>    then it will hold the p2m lock while modifying the table. If the
>>    callback is sh_clean_dirty_bitmap(), it will hold the paging lock
>>    while modifying the table. In both cases, this is OK.
>>
>> * domain_unpause() - Same as the earlier domain_pause().
> 
> You could join both into a single domain_{,un}pause() bullet point.
> 
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
>> ---
>>   xen/arch/x86/mm/paging.c |  8 ++++++--
>>   xen/common/domctl.c      | 12 ++++++++++++
>>   2 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
>> index 1a5822808620..bfb5b423a0dd 100644
>> --- a/xen/arch/x86/mm/paging.c
>> +++ b/xen/arch/x86/mm/paging.c
>> @@ -746,11 +746,15 @@ long do_paging_domctl_cont(
>>       ret = xsm_domctl(XSM_OTHER, d, &op);
>>       if ( !ret )
>>       {
>> -        if ( domctl_lock_acquire() )
>> +        bool lock = !(op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
>> +                      op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK);
>> +
>> +        if ( !lock || domctl_lock_acquire() )
>>           {
>>               ret = paging_domctl(d, &op.u.shadow_op, u_domctl, 1);
>>   
>> -            domctl_lock_release();
>> +            if ( lock )
>> +                domctl_lock_release();
>>           }
>>           else
>>               ret = -ERESTART;
>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
>> index 35144d95b808..a3888c4e87d4 100644
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -559,6 +559,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>           ret = arch_do_domctl(op, d, u_domctl);
>>           goto domctl_out_unlock_domonly;
>>   
>> +    case XEN_DOMCTL_shadow_op:
>> +        if ( op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
>> +             op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )
>> +        {
>> +            ret = xsm_domctl(XSM_OTHER, d, op);
>> +            if ( ret )
>> +                goto domctl_out_unlock_domonly;
>> +
>> +            ret = arch_do_domctl(op, d, u_domctl);
>> +            goto domctl_out_unlock_domonly;
>> +        }
>> +        fallthrough;
> 
> Newline, and I would use break rather than fallthrough, if further
> cases are added below you don't what to fallthrough, and there's
> nothing to do in the default case anyway.

Yes, not sure what I was thinking here. break makes far more sense.

Can this adjustment be done when committing?

> 
> See for example how this is similar to XEN_DOMCTL_vm_event_op which
> also handles some sub-ops without a lock and uses a break instead of a
> fallthrough.
> 
> FWIW, I would also put the XEN_DOMCTL_shadow_op case after
> XEN_DOMCTL_get_device_group and ahead of the
> XEN_DOMCTL_ioport_permission block, but that's just my taste.

I don't have a preference here, either is fine.

Thanks,
Ross

