Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GuhEyPZ6Gl7QwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:20:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD084472D4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290656.1570201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYQb-0006y6-Mq; Wed, 22 Apr 2026 14:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290656.1570201; Wed, 22 Apr 2026 14:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYQb-0006vD-Jo; Wed, 22 Apr 2026 14:19:45 +0000
Received: by outflank-mailman (input) for mailman id 1290656;
 Wed, 22 Apr 2026 14:19:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wFYQa-0006v7-8A
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:19:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFYQZ-007tLK-HX
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:19:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e8d8f4-2eae-0a2a0a5409dd-0a2a4503994c-40
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:19:43 +0200
Received: from [52.101.43.70]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e8d8fd-672d-0a2a45030019-34652b46ad1c-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:19:42 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5791.namprd03.prod.outlook.com (2603:10b6:a03:2d4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 14:19:39 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 14:19:39 +0000
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
 b=GCduPcCOWVAgHUoxnAq2boO8z1V0Y0foi1/vNbV8O/XMCVb1Esy0Szw6sYXWbrMBWrKe/WuRzCk1Yr2qqIeHKYLxbPbPA2G3JiHND0v64MhyR4ecSaOgm6rtj00HvdgxaKCdmwOrLvs89ilIKCtDbTv25u+YMXTeOoKrLladBCZn8i7w+hKEtneIvFRoWF1GJ0JWGoMr70eEn71yZ0xoy5FdCGF+FmOnL/IpN3N7QqmzbzMEbB/R23nna5JiAANvaEm8y55XyINSsCu80S9ymuQxBDhmYdEdRngAmUO+D/w/ZVjIvUkmd2FUHYQZZ86Yx2OWMhZRQXgYKqUlQM61uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCWdf7kdFNNEmO5/CmYzwKI1Qzb7AolfmAXvxEFfn14=;
 b=x4zcN33yj+E/rsdAEXBrU/qdWYJNvwB/ndsDTFQR4E2pxWVXF45iwEpWkgX0EWgaZK211naskye0DD7OqG+EJX39O5tlVluVtjqcA1UyoLRKNd+mIxYF0hFYIHpiCIIim2TMIqfNtvXqS0qpqjtnTzWKp9gwIgw5tx8BdErA8B29y/WNDHursy8DsqhzOHB40MPNuRTfDP63kIiDqbOHlcH7md4ZKuXL+yI534McYyyOsnGeqi2WkQgEmHZSQn9mpqwvd2AbPNI+wq5s6NaqA32ophEb5m8DXEhLMRQ9/F2YkvTGc0QPLRL2Mys3r6oc/HgxAYnXAFln1kE7letFKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCWdf7kdFNNEmO5/CmYzwKI1Qzb7AolfmAXvxEFfn14=;
 b=XmAPYqFFth9aGN2hX6kjiXDVMhhZyyYn77RfvJO8Plxf4/dE9y4+/fiohzsZkpyhOk9f/S0FrHPrLdO5/Cko8N1W2TQ9wSUMMCIX3Wkrxmna9m15ABmny/cKgDqFfvWc+xJ5dDWwtK1aXDR6HGhZCATi0VOHgk6qQV0rprBOJjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 22 Apr 2026 16:19:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Message-ID: <aejY9zq8tEQIfUJ6@macbook.local>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
X-ClientProxiedBy: MA3P292CA0050.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 984db426-888d-4912-a2f6-08dea07a302b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lWJJ3B3ECAFynaIxXpMfLDpR1utBb+YkRUvFhQxi91fwry8W266PdPeL9Xy++RbYrG07CvTVBqJtuqUdKkjKVeYk7U6Wo21jHDl/28gQ2MKX/a20smvP74nkHa6TsHjN+9Y1j8brfNH8FwL906L5oD13XJhoD9OzbtjfRzYZLNJCs3ksLYXOn4EalH61jt4EHWaTuBWHFsBK3WN0U1yf9CUJ0zZ6aGXLR7pvPPmVsbgt91fHKQVJ9dsqRcfkHhaWLhUu5NQOntVPFzasa9MEdJ9LhgYyHMlAJ3kR3shmgxBzq+yAHuXOm3z17ICbxgvPd4VQ2DztZZUIS10V4V6PLWQgMUCmYOb8KWanrIAbrJHHr0UYpTAPfUcmi++81iEObfPGkKPH3huF10t6fgl8UaX0vV8aUoK2f4RZ4JUkVr/pXzyeBLo34DhE2/G+WN7up0jtEWvgg9IU7DksbVswPUTsdrBpxRE9KMvj0KKysraJs2Re24azcMMXwqVGRd2nE2KiBGy8amOmsKjkEQdcKPCA3kBLspgfCqJk4JSd4frlZwiRJCToCRKWotMSZzIFBGbRCG0kvnAh/IKj39hSPaalkn53AUZhrqESXPFTOcQfVw0YV4HfhGqrphQTrOA1zly0PZ6hBS2DFbgRCasEkYG9FPEknwMGCrTN3BuxkMvjHZ/1WGwOOn6w9n9vrpJTgUtlx3baL7mV3IUjYV6cWiV8n7YqAq/f1m/LOTcyDwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVFsMllLV0xHNFIvYmVIVVpiQ3pjajVnWXNBajZVblE4a1A4UmdjVCtBUUtp?=
 =?utf-8?B?aU5lNzNXRWM4WGZpenZ5U3ZjNzdQTHJueUNtcVhuVmhsUDZUcmR2YXRIR1h2?=
 =?utf-8?B?dHNWbkY0MWo4N1V2WUxaL0JKZ2g5VWRlRTgxOUR3OHNqbG9nVG1qR1NCdGFV?=
 =?utf-8?B?a1RWd25LQlhGa1VDbnFYNzg1ZFg4Rm16Wm90a05WWjdjL0l6aHA0ei8yOHFy?=
 =?utf-8?B?RjNkbm5ZWmpwZDFjZDJ4aXFibmxaOUw3Ry82My8wbjlra2xHMCtCaldxTkFG?=
 =?utf-8?B?QmYvcnQ3cXZtdTAzbjJjVENUR1h2SmxBYXhvL21YVjFVWmJPUGhHOElPc01T?=
 =?utf-8?B?YTB0ektrbmU3WlRxZ2pra2EvV1VtSDZkK0xLTmJFV0s1a2x4Qzh4WllFK0gz?=
 =?utf-8?B?WDB4blpHS2lvZzVKZTR3OUFyckEzMi9jNWo1ZVdKUWdkWUxyakVOWS9MakE0?=
 =?utf-8?B?d2dHY0QxbVRWVUIyS0Y1ZjF1elJxTFMxRExTZFJxM0hwaTdmV2syNWpTUTUw?=
 =?utf-8?B?S09XWTQ5UklORXF5OEI4U2x5WVpRKzlicWsrVEExcFo1eVRwNXRjTXd4SUll?=
 =?utf-8?B?WkJoUm9tVWtCRnRla3FhYVRJZHliUkZpMUNkMjZCNXQ2WWVUN29EVStUNlZB?=
 =?utf-8?B?RkFSZ0dCUDJSVzNFU2dncmk5RnlkaWlnZ0JuQll1TlBmVjlQR2RkNXNJQWhW?=
 =?utf-8?B?aDRBZW9VQ0FzMklleFdqaGlDZ1VJRzI2VWswQVFRRlZMb05JcmNiMWlPOThF?=
 =?utf-8?B?K0c4N0xJa1FMbm5PemRBb0ZGWTlNRXpKM1d1Y1h1SVU5K21tS3dtNVZLaURz?=
 =?utf-8?B?d0RMSWNRbTlaMlBmYUZZcGxZdlZ4SG1EcTRYZTRwL1dLUVZNcWFweWxQdG9H?=
 =?utf-8?B?TlN1dGlqTldpdmlBRyt5OHB0U0FOc0M2R0NPWU90enZ6YThzbnhRaFliWjhs?=
 =?utf-8?B?ZEw4MVhaZi9ob2NHM205OUVpZlZWVDMzeGNPeFgrR2hNL1BLOGZrKzlzRGRZ?=
 =?utf-8?B?MGV4YlF4cEJQSXJ3bnpGVENOSG9McGlSNEFnellITGJCQTFQcVA1QVdEWWNT?=
 =?utf-8?B?c25PdWROb2puWmJOVkgrK1drbERCMFA5NlZTdmdKRzFjUEc3ZG5xRy93cVoy?=
 =?utf-8?B?ZTNWQzFDeDBkZkRMQWFVM2l3YU50VkZtdXE3RXNMRkJ0L1k5VjBjMmxJWmNF?=
 =?utf-8?B?aUROSGZWTzJHOXFDL0dpV1M4YWY0d2tnMTRhL0FBUG1mK0pUN1RQdEo1Smlv?=
 =?utf-8?B?c3hUcHR1RWJqN2htbVMzS0lvZzRzZnV2bmxneGdjdk1RTFhpS0c0M1BURUI3?=
 =?utf-8?B?UzQ3YkN2UTZxUVVIZ2ZnOW02VXdDVE1KdFVMUUdsN3Y3eCtXLy84SzFhZTZV?=
 =?utf-8?B?RGtsMkhtRmF4SVpJeEJKMDZqdFNlQ00yVm0xMGhUdzJoWXhQVW02RWMvYk1r?=
 =?utf-8?B?SzAvVjVaUWpsdlZUdXJNdTFNTkVkZllBOFNaWVhPN0FlWlFEczdlaGxKb3Fi?=
 =?utf-8?B?c0RDSzMxMVI1UUpUYklEVENMT2ZDdTc0cllFRWFMR2tTRzl0MW9Lc3pTQzNx?=
 =?utf-8?B?RkpFdlBsbzVBVzlCVWtMd3RkSmhCMDNIR0EyZWlXZXlETG94U3BxRk9ZclJW?=
 =?utf-8?B?cXorc2w3Z1VqY2dLRFBLbzg1SGVZZHFNNDg5TVFCVEtWcWJrZ1lsR2hyWlQr?=
 =?utf-8?B?aXh4RHVsMjlMYTJhanJtV0NQNTFaNzM1NUptMHJnekhJSkNPaUU5azhFTmow?=
 =?utf-8?B?NGFmZW81MzR4YXZid2VLZGxqdkJtWW1ka2t0bWJ5R3BkdXQvZlQ3dW0rUUlu?=
 =?utf-8?B?aVZMYm4wMWxBQ0pxTGJXUTZXaTNjZytxcFdKZUJvQklJOXI5aXRadWhhbTZZ?=
 =?utf-8?B?WU9UWE5MU1hKaklXRk50eUV1b1M1UFpMYUtKZ3ZYNmdpZ00rOWF4dE83NGsz?=
 =?utf-8?B?S0YxUldpbHNHZW15YzRKWm5Zd1Z1YzR6Skh2ZmFSZTBldkRnbzdKc1Z0Ky9m?=
 =?utf-8?B?RnRDeS9hRlQvZVdFaldRM1hzNjhObFo4TlB4QzgwYzNlU2RBWGtoRXJmblBG?=
 =?utf-8?B?dytRZ1JmUFpGajljcHJwSGd3d3V4bFJsMEN1c3ZsdTQvZlAwVko4VGtqTFE5?=
 =?utf-8?B?bjhGRFBQa2VDY0NuZzlNT2l4Rko5Q3pUZjFqSGVlTmtGK1dIQmlPZVhwMzdm?=
 =?utf-8?B?TjZNK1JrbTM5VDdOZUFmZ3ZNWDJtWmJLeXYyK25ncEx3K3BnTGVUNDZPZlBQ?=
 =?utf-8?B?c3hVUzV1MlFUYkN0K0FmbU0ySWZ5YWhhMFdTN29ZaHY2MC9jWGlLS2c4Umpw?=
 =?utf-8?B?NUkzd05QT2NzOVFzR2tzUXBKWEVqZDlscnQzYTNMUFM4QnhoTTRLdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984db426-888d-4912-a2f6-08dea07a302b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 14:19:38.9766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyqE8EEJ6rnp5XWzaOURu98BZknokZQ5Zpotb950Y//zx40JQLzhsk5Hw9cL0QyUBzGo3ZUj681GscR1MD2RUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5791
X-purgate-ID: tlsNG-33051d/1776867583-2B161938-323535BB/0/0
X-purgate-type: clean
X-purgate-size: 15976
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
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CDD084472D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 02:01:34PM +0000, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>

The "From" should match the first SoB IIRC.

> This code is expected to only be used by privileged domains,
> unprivileged domains should not get access to the SR-IOV capability.
> 
> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
> for possible changes in the system page size register. Also force VFs to
> always use emulated reads for command register, this is needed to
> prevent some drivers accidentally unmapping BARs. Discovery of VFs is
> done by Dom0, which must register them with Xen.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v2->v3:
> * rework adding VFs with multiple mapping operations support
> * use private.h
> * style fixes
> * fixup cleanup_sriov
> * emulate command register read for VFs
> 
> v1->v2:
> * switch to VF discovery by Xen
> * fix sequential vpci_modify_bars calls
> * move documentation changes to a separate commit
> ---
>  xen/drivers/vpci/Makefile  |   1 +
>  xen/drivers/vpci/header.c  |   6 +-
>  xen/drivers/vpci/private.h |   1 +
>  xen/drivers/vpci/sriov.c   | 314 +++++++++++++++++++++++++++++++++++++
>  xen/include/xen/vpci.h     |   7 +-
>  5 files changed, 327 insertions(+), 2 deletions(-)
>  create mode 100644 xen/drivers/vpci/sriov.c
> 
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index 9793a4f9b0..8b0e3c03a7 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1,3 +1,4 @@
>  obj-y += cap.o
>  obj-y += vpci.o header.o rebar.o
> +obj-y += sriov.o
>  obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 451cdd3a6f..a36285672e 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -869,7 +869,8 @@ int vpci_init_header(struct pci_dev *pdev)
>       * PCI_COMMAND_PARITY, PCI_COMMAND_SERR, and PCI_COMMAND_FAST_BACK.
>       */
>      rc = vpci_add_register_mask(pdev->vpci,
> -                                is_hwdom ? vpci_hw_read16 : guest_cmd_read,
> +                                is_hwdom && !pdev->info.is_virtfn
> +                                ? vpci_hw_read16 : guest_cmd_read,

Why are you using the guest command register handler for VFs?  A
hardware domain should still be able to read the native VF hardware
value, as it knows it's a VF.  Otherwise this needs a comment
explaining why it's needed.

>                                  cmd_write, PCI_COMMAND, 2, header, 0, 0,
>                                  is_hwdom ? 0
>                                           : PCI_COMMAND_RSVDP_MASK |
> @@ -900,6 +901,9 @@ int vpci_init_header(struct pci_dev *pdev)
>  
>      header->guest_cmd = cmd;
>  
> +    if ( pdev->info.is_virtfn )
> +        return vpci_vf_init_header(pdev);
> +
>      /* Disable memory decoding before sizing. */
>      if ( !is_hwdom || (cmd & PCI_COMMAND_MEMORY) )
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
> diff --git a/xen/drivers/vpci/private.h b/xen/drivers/vpci/private.h
> index f012fd160d..8e0043ddbe 100644
> --- a/xen/drivers/vpci/private.h
> +++ b/xen/drivers/vpci/private.h
> @@ -45,6 +45,7 @@ typedef struct {
>      REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
>  
>  int __must_check vpci_init_header(struct pci_dev *pdev);
> +int __must_check vpci_vf_init_header(struct pci_dev *pdev);
>  
>  int vpci_init_capabilities(struct pci_dev *pdev, bool ext_only);
>  void vpci_cleanup_capabilities(struct pci_dev *pdev, bool ext_only);
> diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
> new file mode 100644
> index 0000000000..ec6a7b84d5
> --- /dev/null
> +++ b/xen/drivers/vpci/sriov.c
> @@ -0,0 +1,314 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Handlers for accesses to the SR-IOV capability structure.
> + *
> + * Copyright (C) 2026 Citrix Systems R&D
> + */
> +
> +#include <xen/sched.h>
> +#include <xen/vpci.h>

Newline here ...

> +#include <xsm/xsm.h>

... and here preferably.

> +#include "private.h"
> +
> +static int vf_init_bars(const struct pci_dev *vf_pdev)

For sanity sake, vf_pdev shouldn't be const here.  We modify it, it's
just that the modified fields are different allocations (pdev->vpci).

> +{
> +    int vf_idx;
> +    unsigned int i;
> +    const struct pci_dev *pf_pdev = vf_pdev->pf_pdev;
> +    struct vpci_bar *bars = vf_pdev->vpci->header.bars;
> +    struct vpci_bar *physfn_vf_bars = pf_pdev->vpci->sriov->vf_bars;
> +    unsigned int sriov_pos = pci_find_ext_capability(pf_pdev,
> +                                                     PCI_EXT_CAP_ID_SRIOV);
> +    uint16_t offset = pci_conf_read16(pf_pdev->sbdf,
> +                                      sriov_pos + PCI_SRIOV_VF_OFFSET);
> +    uint16_t stride = pci_conf_read16(pf_pdev->sbdf,
> +                                      sriov_pos + PCI_SRIOV_VF_STRIDE);
> +
> +    vf_idx = vf_pdev->sbdf.sbdf - (pf_pdev->sbdf.sbdf + offset);
> +    if ( vf_idx < 0 )
> +        return -EINVAL;
> +
> +    if ( stride )
> +    {
> +        if ( vf_idx % stride )
> +            return -EINVAL;
> +        vf_idx /= stride;
> +    }
> +
> +    /*
> +     * Set up BARs for this VF out of PF's VF BARs taking into account
> +     * the index of the VF.
> +     */
> +    for ( i = 0; i < PCI_SRIOV_NUM_BARS; i++ )
> +    {
> +        bars[i].addr = physfn_vf_bars[i].addr + vf_idx * physfn_vf_bars[i].size;

You only want to set .addr if the BAR is populated? IOW: if the BAR is
of type VPCI_BAR_MEM{32,64_LO}.  Otherwise we are populating the .addr
field with junk.

> +        bars[i].guest_addr = bars[i].addr;
> +        bars[i].size = physfn_vf_bars[i].size;
> +        bars[i].type = physfn_vf_bars[i].type;
> +        bars[i].prefetchable = physfn_vf_bars[i].prefetchable;
> +    }
> +
> +    return 0;
> +}
> +
> +static int map_vfs(const struct pci_dev *pf_pdev, uint16_t cmd)
> +{
> +    struct pci_dev *vf_pdev;
> +    int rc;
> +
> +    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
> +
> +    list_for_each_entry(vf_pdev, &pf_pdev->vf_list, vf_list)
> +    {
> +        rc = vpci_modify_bars(vf_pdev, cmd, false);
> +        if ( rc )
> +        {
> +            gprintk(XENLOG_ERR, "failed to %s VF %pp: %d\n",
> +                    (cmd & PCI_COMMAND_MEMORY) ? "map" : "unmap",
> +                    &vf_pdev->sbdf, rc);
> +            return rc;
> +        }
> +
> +        vf_pdev->vpci->header.guest_cmd &= ~PCI_COMMAND_MEMORY;
> +        vf_pdev->vpci->header.guest_cmd |= (cmd & PCI_COMMAND_MEMORY);

You shouldn't be modifying the guest_cmd here, the hardware domain
should see the native VF command register.  Hardware domain knows it's
a VF.

> +    }
> +
> +    return 0;
> +}
> +
> +static int size_vf_bars(const struct pci_dev *pf_pdev, unsigned int sriov_pos,
> +                        uint64_t *vf_rlen)
> +{
> +    struct vpci_bar *bars;
> +    unsigned int i;
> +    int rc = 0;
> +
> +    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
> +    ASSERT(!pf_pdev->info.is_virtfn);
> +    ASSERT(pf_pdev->vpci->sriov);
> +
> +    /* Read BARs for VFs out of PF's SR-IOV extended capability. */
> +    bars = pf_pdev->vpci->sriov->vf_bars;

You can do the initialization at variable definition.

> +    /* Set the BARs addresses and size. */
> +    for ( i = 0; i < PCI_SRIOV_NUM_BARS; i += rc )
> +    {
> +        unsigned int idx = sriov_pos + PCI_SRIOV_BAR + i * 4;
> +        uint32_t bar;
> +        uint64_t addr, size;
> +
> +        bar = pci_conf_read32(pf_pdev->sbdf, idx);
> +
> +        rc = pci_size_mem_bar(pf_pdev->sbdf, idx, &addr, &size,
> +                              PCI_BAR_VF |
> +                              ((i == PCI_SRIOV_NUM_BARS - 1) ? PCI_BAR_LAST
> +                                                             : 0));
> +
> +        /*
> +         * Update vf_rlen on the PF. According to the spec the size of
> +         * the BARs can change if the system page size register is
> +         * modified, so always update rlen when enabling VFs.
> +         */
> +        vf_rlen[i] = size;
> +
> +        if ( !size )
> +        {
> +            bars[i].type = VPCI_BAR_EMPTY;
> +            continue;
> +        }
> +
> +        bars[i].addr = addr;
> +        bars[i].guest_addr = addr;
> +        bars[i].size = size;
> +        bars[i].prefetchable = bar & PCI_BASE_ADDRESS_MEM_PREFETCH;
> +
> +        switch ( rc )
> +        {
> +        case 1:
> +            bars[i].type = VPCI_BAR_MEM32;
> +            break;
> +
> +        case 2:
> +            bars[i].type = VPCI_BAR_MEM64_LO;
> +            bars[i + 1].type = VPCI_BAR_MEM64_HI;
> +            break;
> +
> +        default:
> +            ASSERT_UNREACHABLE();

While ASSERT_UNREACHABLE() is fine here, you still need to make sure the
code makes progress on non-debug builds, and hence rc should be set
to 1 so that the loop moves into processing the next BAR.

> +        }
> +    }
> +
> +    rc = rc > 0 ? 0 : rc;

This will only take into account the return code of the last
pci_size_mem_bar() call.  It might be best to either properly
accumulate errors, or simply make the function void, seeing as the
only caller ignores the return value.

> +
> +    return rc;
> +}
> +
> +static void cf_check control_write(const struct pci_dev *pdev, unsigned int reg,
> +                                   uint32_t val, void *data)
> +{
> +    unsigned int sriov_pos = reg - PCI_SRIOV_CTRL;
> +    struct vpci_sriov *sriov = pdev->vpci->sriov;
> +    uint16_t control = pci_conf_read16(pdev->sbdf, reg);
> +    bool mem_enabled = control & PCI_SRIOV_CTRL_MSE;
> +    bool new_mem_enabled = val & PCI_SRIOV_CTRL_MSE;
> +    bool enabled = control & PCI_SRIOV_CTRL_VFE;
> +    bool new_enabled = val & PCI_SRIOV_CTRL_VFE;
> +    int rc;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    if ( new_enabled == enabled && new_mem_enabled == mem_enabled )
> +    {
> +        pci_conf_write16(pdev->sbdf, reg, val);
> +        return;
> +    }
> +
> +    if ( mem_enabled && !new_mem_enabled )
> +        map_vfs(pdev, 0);
> +
> +    if ( !enabled && new_enabled )
> +    {
> +        size_vf_bars(pdev, sriov_pos, (uint64_t *)data);
> +
> +        /*
> +         * Only update the number of active VFs when enabling, when
> +         * disabling use the cached value in order to always remove the same
> +         * number of VFs that were active.
> +         */
> +        sriov->num_vfs = pci_conf_read16(pdev->sbdf,
> +                                         sriov_pos + PCI_SRIOV_NUM_VF);
> +    }
> +
> +    if ( !mem_enabled && new_mem_enabled )
> +    {
> +        rc = map_vfs(pdev, PCI_COMMAND_MEMORY);
> +
> +        if ( rc )
> +            map_vfs(pdev, 0);
> +    }
> +
> +    pci_conf_write16(pdev->sbdf, reg, val);
> +}
> +
> +int vpci_vf_init_header(struct pci_dev *vf_pdev)
> +{
> +    const struct pci_dev *pf_pdev;
> +    unsigned int sriov_pos;
> +    int rc = 0;
> +    uint16_t ctrl;
> +
> +    ASSERT(rw_is_write_locked(&vf_pdev->domain->pci_lock));
> +
> +    if ( !vf_pdev->info.is_virtfn )
> +        return 0;
> +
> +    pf_pdev = vf_pdev->pf_pdev;
> +    ASSERT(pf_pdev);
> +
> +    rc = vf_init_bars(vf_pdev);
> +    if ( rc )
> +        return rc;
> +
> +    sriov_pos = pci_find_ext_capability(pf_pdev, PCI_EXT_CAP_ID_SRIOV);
> +    ctrl = pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
> +
> +    if ( (pf_pdev->domain == vf_pdev->domain) && (ctrl & PCI_SRIOV_CTRL_MSE) )
> +    {
> +        rc = vpci_modify_bars(vf_pdev, PCI_COMMAND_MEMORY, false);
> +        if ( rc )
> +            return rc;
> +
> +        vf_pdev->vpci->header.guest_cmd |= PCI_COMMAND_MEMORY;
> +    }
> +
> +    return rc;
> +}
> +
> +static int cf_check init_sriov(struct pci_dev *pdev)
> +{
> +    unsigned int pos;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
> +
> +    if ( !pos )
> +        return 0;
> +
> +    if ( xsm_resource_setup_pci(XSM_PRIV, pdev->sbdf.bdf) )
> +    {
> +        printk(XENLOG_ERR
> +               "%pp: SR-IOV configuration unsupported for unpriv %pd\n",
> +               &pdev->sbdf, pdev->domain);
> +        return -EACCES;
> +    }
> +
> +    pdev->vpci->sriov = xzalloc(struct vpci_sriov);
> +    if ( !pdev->vpci->sriov )
> +        return -ENOMEM;
> +
> +    /*
> +     * We need to modify vf_rlen in control_write but we can't do it cleanly
> +     * from pdev because write callback only accepts const pdev. Moving vf_rlen
> +     * inside of struct vpci_sriov is also not possible because it is used
> +     * before vpci init. So pass it here as additional data to not require
> +     * dropping const in control_write.
> +     */
> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, control_write,
> +                             pos + PCI_SRIOV_CTRL, 2, &pdev->physfn.vf_rlen);
> +}
> +
> +static int cf_check cleanup_sriov(const struct pci_dev *pdev, bool hide)
> +{
> +    unsigned int pos;
> +    int rc;
> +
> +    if ( !pdev->vpci->sriov )
> +        return 0;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +    ASSERT(list_empty(&pdev->vf_list));
> +
> +    if ( !hide )
> +    {
> +        XFREE(pdev->vpci->sriov);
> +        return 0;
> +    }
> +
> +    pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);

You need to rework this a bit, after some recent changes access to the
ECAM space could disappear if dom0 signals that it's not OK to use
whatever memory range Xen was using.  Hence the position of the SR-IOV
capability needs to be cached at init time, so it can be removed here
regardless of whether access to ECAM has been lost/revoked.

> +    rc = vpci_remove_registers(pdev->vpci, pos + PCI_SRIOV_CTRL, 2);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "%pd %pp: fail to remove SRIOV handlers rc=%d\n",
> +                pdev->domain, &pdev->sbdf, rc);
> +        ASSERT_UNREACHABLE();
> +        return rc;
> +    }
> +    XFREE(pdev->vpci->sriov);
> +
> +    /*
> +     * Unprivileged domains have a deny by default register access policy, no
> +     * need to add any further handlers for them.
> +     */
> +    if ( !is_hardware_domain(pdev->domain) )
> +        return 0;
> +
> +    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, NULL,
> +                           pos + PCI_SRIOV_CTRL, 2, NULL);
> +    if ( rc )
> +        printk(XENLOG_ERR "%pd %pp: fail to add SRIOV ctrl handler rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);
> +
> +    return rc;
> +}
> +
> +REGISTER_VPCI_EXTCAP(SRIOV, init_sriov, cleanup_sriov);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index e34f7abe6d..fc8a943abe 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -84,7 +84,6 @@ struct vpci {
>           * upon to know whether BARs are mapped into the guest p2m.
>           */
>          bool bars_mapped      : 1;
> -        /* FIXME: currently there's no support for SR-IOV. */

You want to add a note to CHANGELOG also to note the SR-IOV support
addition.

Thanks, Roger.

