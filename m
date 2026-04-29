Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPAqDgf98WmElwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:43:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA99E49434D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297337.1573405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI4GI-0006wz-Ef; Wed, 29 Apr 2026 12:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297337.1573405; Wed, 29 Apr 2026 12:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI4GI-0006um-AX; Wed, 29 Apr 2026 12:43:30 +0000
Received: by outflank-mailman (input) for mailman id 1297337;
 Wed, 29 Apr 2026 12:43:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wI4GG-0006uK-Or
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 12:43:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI4GF-00CfGL-QN
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 14:43:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f1fced-e002-0a2a0a5209dd-0a2a450498fe-14
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:43:27 +0200
Received: from [40.107.200.46]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f1fcee-1dec-0a2a45040019-286bc82e618e-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:43:27 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV8PR03MB7327.namprd03.prod.outlook.com (2603:10b6:408:18c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 12:42:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 12:42:22 +0000
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
 b=ELo450mP+ZkF1nibXvhzYjcMT+4SmGEAePKXRejHLQBesVxeyXqJnLv4wnXLWrI4ILmdRtcZ6h7aGU5+fSBXCnA0grAM1e/rWsVACc586MJ438L+anO7UplSYiVNd5Sf9CJD5ZjWo5Qr1hFghXw0FQNBhjsrxPpoPhFfemV3w1dsVIaD6nXPe6BpCI5jCgseD73JuA5jwMWErqm7olCLA9MQItEjO6oie+ulOQZcRsZCbVLT4mCVdTJCDLPeIJfrVsWDmIt5eAtl87nqRduJW3NWaCbejX9MABOAIk5WsodHMj/CVjfonLtSvQaFUAqBxTrEv7SzfUtka4vLUkohPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3MR6OdHyhhxWywXl28gco0emvkAneOWoV5IZxL1xBQ=;
 b=AtmYUK4GScZBShEET6K1GzRH5yGW5hdUMab9az5ycdChwmfR914+lclsmUpMHrdy14M55tIwWW7+xjzDWeH9GU5Tu2J55G7vmqr05uJg5fapzUYLSUPySidjSMPGZ2FlKTTyR5cPbhUWl2jVNIiFILWoBnMPDxhHk0am755ZO3JDnLNN/AdiS7BOV0n8KkLlyDDLCBxiS0XxDoOZo5r1IWN3HjhogICNr9bkUH0OGDw6uZgcp/FB9Rbx7LwpfcEQ6J1GURhXYVlxRf6Bi6SoxPR6MPZwWnHT/L35ae7uv+9/jvOhUrkYYTHz/4nAD1C2nN8jVyCVCeIfR5VRb2w+Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3MR6OdHyhhxWywXl28gco0emvkAneOWoV5IZxL1xBQ=;
 b=bPGYdQOknJ+Lz77UjkHrHwF6W2O9zr02VKHrIrc/SWyv2rsIF9eULUrn3WR14+autq9lGz5y+EdKAU+HHyPrmZezjGKMqmkngps2N9tPiRO//XuFUmeHA3qhfWnn+ZPcc9s2l5Q0oleWt4Fcze7d3n9NEyGcrRvKqfDl7kihoOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Apr 2026 14:42:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 16/17] Handle PCIe ECAM space access from guests
Message-ID: <afH8qwKo1z236QbI@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-17-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-17-thierry.escande@vates.tech>
X-ClientProxiedBy: MA4P292CA0012.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV8PR03MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c41fcf-90b0-4117-1822-08dea5ecc244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0iN/4RKZRmD/Nt7tRLkCJOpfanMxbf1qQP0YwokX3v+ia+5HEKkGDzg24+f7gxmuY/GZfd5e2kszKW0O7cQq1Gd0ZRrsaJPwjXB2HDEGQPZsLDswAgHf7QoqXJvQasiXATPpHRAvEmXKGqXv1Jr/re8Xhn8lluKcPkFOdDTXC7uc2nNTlAtr0XW30oeLKnvDfrC0LzAxdGZJshL9ydyd/ht2e3a1X69pZgm6NCdVNjr51uPyKjpNTsPrO2JErHw9AS9z9XXlxQ6CQVaaw/1zFqCZKiw2cRuP9eg3ShbSP1StTgW6ZRcF9CtByK88dzF6Bhtd5ZMffhTjrB6gDy5BaQ0JEJQ9/MF6vEu9pTSN/RAO8fHrWBBn34D33NRccE5K1Yf9jya9OnntmhVAJ26aE1FjkYg9tvTlP/SWixWKiGTsdvKPpM7Xok4whyuUqmHxsGvC9qKq3WFXdmvPE+KULID3n2bTQ5ShoL5IaaiApons0WLJdw4JoKlFCjP5bXjpumRT/v5PuIVsDqlkU7KJ54mPGyalfFPXFkxd/fWosmnwXUYEVwFcheqAgUWz3wNFlI8qo8vG/Z4LdhKyriBSuQ5WJG7sHxxeg3oHosxMSaQcwCtrpNX55IoVpr7zB3/pEolkWJePRxEXZGXxbk4qWsItvLDJc4Y1zW2NLiHAgiGEV0TwuxFYmB28Dp9ug7TJ11jSlifAOg4MSslpmrsA7pQ5UyzdIrcoago9HYMFLyo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MS9JMUoxYUZHMmZrZTFGNW1vY1pHazZWSGhmMy9GY2h1ZTZadGNIaFNUcFpm?=
 =?utf-8?B?YXNMQWc0QWhnSGNucDF1bmozei9kaStNNjRVUy9jRndFeVVyZHRXMVFucFdN?=
 =?utf-8?B?MGxUUXNKaVpDc3V2RHN6ckFyUVM2WkRIR0FySW1TdmxDYllmclpOZUo5R2cv?=
 =?utf-8?B?WjBidG1VMjVKZDRmcElBZW50WnM2Nmx2Y2VmbFJSZExod2dvTXB2YTRNbmRV?=
 =?utf-8?B?dmRkVk9kL3BrSFpRaURCQkhkUmxnbDV0dml2amhtVjlJSVg5R0tTMVBjaDNK?=
 =?utf-8?B?aElPcFc3YUVJeVlFYnBSQUpCT2l3aFczYUxsNHVIQ2pMU0h2V0JtUExCSEFM?=
 =?utf-8?B?anZWMHpiSnhyaGIyTlkzaFZNWTJOVmQ1cWpBY0M4T1U2enN5aWNzUk5sQXAw?=
 =?utf-8?B?TkFaNkV6Y1ppeVB2aE1JZXdaV2huUGlhbWs2ZEhkOFhiWjFNT1pVR0tPYlNZ?=
 =?utf-8?B?R3dMRjZXQ1ZSQTI3dWhXQVBQVVFjdklBUWhTMi9ySStuT2Z0UkZWOENEYldQ?=
 =?utf-8?B?SVlVQ0tJTkMwbW5UQWdQQWVuYXg5ZVZkMVhiWDRDdkZ0blFjTVVTYm81NEdn?=
 =?utf-8?B?ZjY3ZFArMk10UUF4anVBR1p4S054blhyWkw3MnRMOGpsdnA0V2Q0eUVPY1Na?=
 =?utf-8?B?ci91VmtLdlZOdmkwWmlSczYyRnpRcW5OSG5aU0ZjM3BiSkdWZ01TNHJNUVl4?=
 =?utf-8?B?SnJiS3BmL3dDMHJKQWs4RWRQZnVvM21DK3cxQmkrWDR1Tkc5Ukc3djFkUk9C?=
 =?utf-8?B?V1JMSW5jUVg3WmJsYmlxTEFBcTFKSVl2Vm91cFhBL0hyUm5WT2ZDNUFWUFJs?=
 =?utf-8?B?Sm5Cd2RFcFR4L2FPZVE0TklnSEtVakdWL0puMjQrekR3THkyT210QUczVkZQ?=
 =?utf-8?B?RGIxaGk0QkhmdnEvNGNLUE94L2ZLNWtGK0I3ZVpJYngxakJFM1RPZmI3WlNI?=
 =?utf-8?B?R0UzZC9VV3hUM2Roc2EyaHRGelRyQkdoczZlNFRMYmR2V1h4dVhzTDJSK3ly?=
 =?utf-8?B?YWg0TUNmYitZUHNGSzZDREVzV1Evb2JlY3lGUFRnQ0ZUbnZpT1ErZlZNRTlZ?=
 =?utf-8?B?dFF3Z2xZRGdlR1RUVWJFdHlkZUVKWjhyQ2J5NUxYOE9FSDVUZWtKcVhHYWpF?=
 =?utf-8?B?OVh2UG1LTEltUVZtRXIxR2FiNFVpNHBhOHd6dXRaUEZGazVBRmN6OWc5VUJL?=
 =?utf-8?B?bTBoYjRub3ZRQXQ4TWVueGV4bnJYZGZscXNsaDkvNzdsQkk3aGpyOC9pM080?=
 =?utf-8?B?NFoybkJXMEFGSForZTJRVnJrRkJtak1DTjJlVUtrdVh0VUVFMmU2MnByV0o4?=
 =?utf-8?B?aEV2eWZIaktsZmtpQUdkTW9YNVBVdWFGT24wZ2FlemVtNzQwZEpYek1rczB1?=
 =?utf-8?B?dGhnakFBSmJSQUNOVnVPS1F2cEs2L0VGc3k3VXhSclNiWDI3U1lFeEpadWVk?=
 =?utf-8?B?c2lWM24xYWhJbzVqU2NLL043K2ozU2p0NHFNampYdnRlcTlpZklBbWIvNHZs?=
 =?utf-8?B?TmEzWDArYllNTnM1NEQ3SWdPSDc1YUc5UXdvN28ralFhOUJNZEEwcWh5NDhI?=
 =?utf-8?B?TGZBYzAraEFzeGdtOTAvRGVPRTBqQW0xRGRXTWpMZmR1YkhObE5RTVd0Sng1?=
 =?utf-8?B?V2E2OG9OczREQmRXSlVPQ2g2RHpQczBYbURrUGJkbHViWDVWZkxrampTbU44?=
 =?utf-8?B?ZHRWQXlaTjJWTUovN2hNbU1xV0ROT3haY0duN3FtWjM4YUlwQzJZQndmRVVt?=
 =?utf-8?B?YUJ5VG1zUTdvNFpZalMrSnB3RHNNeG9ackYyWSt5UHl5Uy9PQXdpS3pObE9q?=
 =?utf-8?B?QnZFU3NyZ0RzeUFsU2Y4clNjTjF6S2JRZFpEMHF4ZGlZL1k1NFYrRWIrYTdR?=
 =?utf-8?B?UVZiam1ENnlYQ3NybHN0ZjJGajNLaXV3THpMQjFIcVdLcVFFK09ML2g1eGdw?=
 =?utf-8?B?QVYxd0wwczNMQXluS2cxYVA4Y1dYZE5sUFl0Rnh1WFhjR2Z3RzhmdElzczZl?=
 =?utf-8?B?blFNUm9qQkJIdmJTK2VtVDkwSWJoZ1BlcmdKaHcrdHhUYi9WSkxiZzRSK0xT?=
 =?utf-8?B?ZXJGakw3K0pCMUlGY0MweWVjWCtnd3Z3SVdzWXhiekNaWUNmVFkvQndRSnp2?=
 =?utf-8?B?R3ZpSkFIcjVRODgvWk1NbTE4N0k0Z3hTRzdNSnJpZE9hSC9KejZINHFWSU51?=
 =?utf-8?B?UWs3OUpodllRVXVLamh1eUlBKy9sV2o4aitUNS9sdTNJN3o5VThMWGh2T1ZI?=
 =?utf-8?B?d256YW94ZkJTUHBBOXgzUWVwTzJIdDYzODFzSDZyWmNuVWVld0xhQ1h5SFgx?=
 =?utf-8?B?TUNNd3hMM1M1NnpneXY1a3N4am1lNnoyeXhSM1d4V0xvbk9xa1RkUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c41fcf-90b0-4117-1822-08dea5ecc244
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 12:42:22.5636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8tgYg/cMm/jtOS0pBKoyG5DnScDcQvHEfmog5U3zFK9ewpFtSDkKC0rVt4r0GYhzUdkBlKEHdQoQySV79Vijw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7327
X-purgate-ID: tlsNG-ebf023/1777466607-289723FF-E4348716/0/0
X-purgate-type: clean
X-purgate-size: 2285
X-Rspamd-Queue-Id: CA99E49434D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
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

On Fri, Mar 13, 2026 at 04:35:05PM +0000, Thierry Escande wrote:
> This patch adds the logic to decode MMIO-based PCIe ECAM accesses. If
> the IOREQ_TYPE_COPY request is within the ECAM address space configured
> by hvmloader, the ioreq type is set to XEN_DMOP_IO_RANGE_PCI and the
> sbdf decoded from the accessed address.
> 
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  xen/arch/x86/hvm/ioreq.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> index a5fa97e149..022fe05222 100644
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -268,6 +268,8 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
>                                       uint64_t *addr)
>  {
>      unsigned int cf8 = d->arch.hvm.pci_cf8;
> +    unsigned long mmio_start = (p->type == IOREQ_TYPE_COPY) ?
> +                                ioreq_mmio_first_byte(p) : 0;
>  
>      if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
>          return false;
> @@ -298,6 +300,19 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
>                  *addr |= CF8_ADDR_HI(cf8);
>          }
>      }
> +    else if ( p->type == IOREQ_TYPE_COPY &&
> +              (mmio_start >= d->arch.ecam_addr &&
> +               mmio_start < (d->arch.ecam_addr + d->arch.ecam_size)) )
> +    {
> +        pci_sbdf_t sbdf;
> +        unsigned int reg = mmio_start & ~PAGE_MASK;
> +
> +        sbdf.bdf =  (((mmio_start - d->arch.ecam_addr) & 0x0ffff000) >> 12);
> +        sbdf.seg = 0;
> +
> +        *type = XEN_DMOP_IO_RANGE_PCI;
> +        *addr = ((uint64_t)sbdf.sbdf << 32) | reg;

The trapping & decoding here should better re-use the logic in the
vpci_mmcfg* handlers in x86/hvm/io.c.  You might want to gate the call
to register_mmio_handler() to the domain having vPCI, so that
otherwise it will be handled by the IOREQ catch-all.  It's a bit
hacky, but we already know that vPCI and IOREQs don't play well, and
it needs solving properly.  Again I don't want to force you having to
do that just to get q35 merged.  But we should at least aim to not
duplicate the data in the domain structures.

Thanks, Roger.

