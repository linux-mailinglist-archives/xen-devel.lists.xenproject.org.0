Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EFAG2CJ8GloUgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 12:18:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2A948275A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 12:18:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295543.1572207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHfVv-00020v-6j; Tue, 28 Apr 2026 10:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295543.1572207; Tue, 28 Apr 2026 10:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHfVv-0001zR-3r; Tue, 28 Apr 2026 10:17:59 +0000
Received: by outflank-mailman (input) for mailman id 1295543;
 Tue, 28 Apr 2026 10:17:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHfVt-0001zJ-JT
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 10:17:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHfVs-007jcM-UH
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 12:17:57 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f08950-bab6-0a2a0a5309dd-0a2a4508bf32-36
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 12:17:56 +0200
Received: from [52.101.52.71]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f08953-63b5-0a2a45080019-34653447da2e-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 12:17:56 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB8315.namprd03.prod.outlook.com (2603:10b6:8:260::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 10:17:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 10:17:53 +0000
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
 b=IF5r59Rsmm3luN2VYc2ZN6PLRTiSWsrdYilY1csJ1E1aD7QH6AFt1EIShB9X18XCQNnMZCxCX5a6XufQ+crBea6Dt0clLPxMmCTi0fTN/8PvNzunDVEtcF6jFri4j1RYTfEpupzdiuq5fpIzUSs/BI3X/nWOCfE/KZ9FhEb+PJUqDpCEouCEm+OyB148QET2q3NdpVrfRikfCmTi+3B1yeO433jG/9IUzyTG6hdkI9OhvnHnuTNM1UNka1UWw+soNIpsRn0sR47JR8EaqV8DM/M5Zp9la2BjEVhj+ImXWMprDCV2qILbyCL/w3R9bEH4huDQI2vxy+/zmLkFnzPFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2keiiZXZR6XgddVozHX6JewiqIcgqX7frg5KBnaVE4=;
 b=B3l0gjCUP2exIxgvo9sYNOliu3e5R9DvVldmXENc94B6gDqp0V0IoLveXXM4s3WljJPBvX7YREuqIj5h/k44Ez9/2X6thZbhY9posxjuHHmYfESev8ESYiEkY2xlJZo6HWFW2plOjVj9+kJykc6QtCZ353F71Az81DiGkzy/oIV+ELHfdVCiGBXBEdk77OfkMahM8ixvSuXiLhTxMQtyuf1nwtIiV4rxjQx6ah1TOCYTEgK1+9lzqeeInC6vdWldx5VYiRKOlXzHho/PQOFyQOcgQ+quOtilpPUerdido6bkjqyb8S3RFriw+ch9WtZVPZKumlyCqVOYIQKXoiDtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2keiiZXZR6XgddVozHX6JewiqIcgqX7frg5KBnaVE4=;
 b=D/pxg9p3aXaK0WFO6wBkdrGpuFhrfcvU8Oc9RBTi24zN53O6wzlBseINM8XGUVXkAwrf532SbxAvjyLThJ4lcv6yzdOmTh5nrR3gf5fuyfRztB9ZLPcu6NlFtwEcCrwTewBx8BbOKX0XukNqnO9UJlXg63HbEJmi/y37Y8bJq80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Apr 2026 12:17:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 02/17] libacpi: new DSDT ACPI table for Q35
Message-ID: <afCJTdlBPPyWEejk@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-3-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-3-thierry.escande@vates.tech>
X-ClientProxiedBy: MR1P264CA0083.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::23) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a483f4f-2f8c-4c9f-da7e-08dea50f688a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Mf1XHalhUrLW1wZocx77acowppAgzAYbHkJaVolG8ne+EBSace7x33PgAJl8hy8rGH1FI1INxPXtWJ1Xk8IJv4RfL9G4zVEcWde8iVeA6oJBwGUe4QhUJStELJLHgchp928d2WEKB5y9+sDHMU8NN0VdKQSKS/bdithTI5CFm3EMrrLfV77/9txfTkZXpxOBipVNqVOBM6ESFL+A1fja1phyzW1oDEQurqObnuNpXMNP44SDD+Vb6qxfOpG3cRkaxn2pMVXWBG1FV2C/9IhLeAsI6TG++3O0/Dk4KwuHVw+2m+E3mEsmRjcIIbYAjUBsRWKV/bKlX7c3tPOtIdf1PUA6Sah3vqs8vFpuUQVm1x1mwZVtex2rnS94UuUkl+UFIi5pv53q1Jt6oSchPi7rjDRWNawoTuqqIu/MhPUXi/qXa1UlNhGDu26BJJNo+OIY/edxrBEaJGluTdCpWx1yqSMRrOPFMi5XbnPqrwLkP14RaEO02VNjP58JccJkbNhtS4VmtM5RwpDbZpXj8SNiPqtug9kC6stHR3H4LFgiKJn5z0wPWIb8vE65MZD1DgAV4XoQuLLR13fSZR56lfxqFhM0kv46S4r60aaQiA2ixq+9VtwPl9byHDA6Di/7eX1ZegFvFrp2fGK4RHqyFenbubo0AYPhOBvMWgk2HfDaR6N65AE8t7K16yd3Ndz2mg7AlXqIVPpDBUSjg/0pKvxMnIQRqtZzHVO87+EyG+HFJRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGJrTERGa2xxbG1uNDgwSWFrVzZQUHhCS0RnSCtVMm11NUlXUnFTbDE1QUwv?=
 =?utf-8?B?Vnhnd1pWMkVvQ0l5ei9OVm1ZZGJ4b3daZ3dYZkVNYndYMmI3MUpSdWZoLy8y?=
 =?utf-8?B?MmZmYVpobXllWG9UMnRKbm5vRFI2cEZSbE54VDZJWFE4eHRPV1V4dDRFaWRh?=
 =?utf-8?B?THZ0OC9paVlwaWNpQU5teW9jLzVyL2V3ZFhCT3pWbGVhbm1EMmVOajJuLzFm?=
 =?utf-8?B?WFlZcm4vK2dkYXdPYkhOM09WZFZvOGlxTFRHZDRSbEJPcVJMdHdBQUpMSzlx?=
 =?utf-8?B?enZRU2tKQnhFT3RwdVNZVlplNGxPZzlwaW84ME1uWFIvMmtBK21pY3ZyNlpa?=
 =?utf-8?B?eWxMdVB0b0xVeWx4VllSTGxpenQ3Y21LOWtIbGJMYUlHalUrS3dRSzhlYUx2?=
 =?utf-8?B?VjY2NlQrU1o2SVRvaDFHbXIrdld0QjRRbERORk83MlE2WWw3ejhxV2RkUElv?=
 =?utf-8?B?RzNmNDlWWGNXYWpacHNyV3ZOVjNhb3BoUExqT0pmY3J1SzJJdkNXTVZUbHpj?=
 =?utf-8?B?K2o0bUVNL0cranEraWkrQVBsS0twdFh0QVNWY2FaR3YzWDZ3dHhQRVVuMFNx?=
 =?utf-8?B?RXFvNThvQys2b3VRd0dYUFUzQjN3bzhDbFV3bEVMWHNQQkpDRko2VVd5YU13?=
 =?utf-8?B?MFZyS0JVQTVmN3hsMXdVeUxPNUx5OEIzQlZpamdxamowUENoazRONzNNRk1M?=
 =?utf-8?B?REZwcnhvZlY1c1JueDJ2WjlKZGE2eS9rMUVveENCaWtpWGlzTzNsa2drMEla?=
 =?utf-8?B?WEtGU1JQenMweW0vdDNia3EyL0ZiM0JleVRibmVkT3gveGtEZkhheFg0dW9w?=
 =?utf-8?B?anBtdklMc1RyYWVwNFJPNHgzZFlZbkI4eFlBNTNzaFpKSlJQSVJVUW5YYmto?=
 =?utf-8?B?RFFvdC80Q3BtNWR1eWE0RVcwWkFLR3RpdXFtc1Y5SHcvRGNFbEFtSzRlUVdE?=
 =?utf-8?B?a09YbHdFdnVaV2Z5VEtxbHhSUFJnOEhhbzBDSEJYTDh6blVrcDBoOFNHakdl?=
 =?utf-8?B?YmNkeXVBUlRLNDhuV0l1ZDNhdnMyK2lpVjF3d3d1ZmJWd05rRXk1QzV3T1Ju?=
 =?utf-8?B?ZWxLLzJtNmhLeERCd0lCUllJQ25WUVFwVVFDSklpRHlTME85YWJGaGlBM3R2?=
 =?utf-8?B?WVhVRVgvb2VPdGZlcmFCeWF0L2VTMkk3aWJBb004am9aak5taFZaWjkwVjR2?=
 =?utf-8?B?akJuWXdLS3lNZ3RCN2NIN05FUitsVGs4T2RTdytBcWV0a1dTbnR3WWNkVzZ5?=
 =?utf-8?B?aHVXVmFPOFMyS3ZjMlc3d1NQSCt5RkR4UUoyVlVTejZVcnY2QXdmMUJLWkFz?=
 =?utf-8?B?YzBuYXlQaVhaZEpHNER0RXhBVm5Jb3dnNi9hN0pTa3dCWE1Kbld1bHY2bTRF?=
 =?utf-8?B?akUyTndzd3FCVFlsbld1RmVrbDRPMEhtZll4eDVrTGRNbW03YVk3NG9xeTFj?=
 =?utf-8?B?cmJsU1puRGd4YksrUE9GYmZSK043T0N1VFhlUGlaY0dkUlRLOHdhLy9WSTBl?=
 =?utf-8?B?VUZHaFljRGVIOVovVXFDRWdnVlZaT1lhZFVjVmtJZHZ4WGxnemsxZ3lPQkd3?=
 =?utf-8?B?Z2VmMVJRMkJsU2oyZGowbVY4R1dTRzdmS1BHRHBUMFJqeFdlTDZyNGVac1JG?=
 =?utf-8?B?S3M5c2NuSGV6WFFCUnlrOGNRaGdBOWgwcnhhdnVtUVBVTXpQT0w2dG1pOUpD?=
 =?utf-8?B?THZCRU1zai91VEZjRDlOUGZMNEJsMTg4K3BheGV3bEdDendwVDZDMHJkSDI1?=
 =?utf-8?B?QnFpUnRBOHdnektIWk1WOXNFTTNTZjJUZENWSWwzeDRHYjFKRC94U1VMTUha?=
 =?utf-8?B?ZEZQd2Y3ZDNBVS9xOFRlbEJqb3AzcjV5SGlXQ2YvdWliek9yVE5DMi9hUnVV?=
 =?utf-8?B?SStaRU15K01lT1oydWVNbFpBaWxtNS9hYUkyRDBqbWdFOVMzUHBsRXJNVUlv?=
 =?utf-8?B?MU9IUjZOZU50RGFFcGQ3M1I4WGJjcG84eVc0MENKVWhIRFBUUnVoT2hreTFv?=
 =?utf-8?B?WlF5RHhpbVNVYWplb3ZxRXBvS2piNzk3aGFROFhYcWM1UXFXeVpuUEQ4MGsx?=
 =?utf-8?B?ZWY4VXZ0Q1FEWlQxZERvZkpxQi9XNGFEU2RHUGNEeEtENWI3ZDA5bjBmZW1M?=
 =?utf-8?B?SnBQeEJxSFVIMnZVY3VqTGlPd3QxWi96enVtVFdNcmo0bjU4NUVoa3pIbitR?=
 =?utf-8?B?Wk1YWVk4NGxmajU1M29GNkxFWnA0akFZU2h0bG94R0EyMlNoeVAwdUNHN2dl?=
 =?utf-8?B?MGtzSVVDa01FRUJXYThHYWhGSmsxcDlPOE5lVG1xYkdzSDVUNWR3djh0NFAy?=
 =?utf-8?B?MXpwcnl0aEhCYlZ3WmV1VlBEZnhmWVJlUWJnbWhNa1VTQWhTQXBZQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a483f4f-2f8c-4c9f-da7e-08dea50f688a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 10:17:53.2177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ni3aRAECXgfrTv2sVHmuNaKFnnphLzdFY4868GmlTuZDv1+eZRTvn+UMqPtVnfP6iTTA7qrSSqU7BRuZ9L/VtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8315
X-purgate-ID: tlsNG-c1860d/1777371476-C80D7DB1-7E6A6735/0/0
X-purgate-type: clean
X-purgate-size: 9416
X-Rspamd-Queue-Id: BB2A948275A
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,citrix.com,vates.tech,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid,vates.tech:email,roms.inc:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.916];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
> This patch adds the DSDT table for Q35 (new tools/libacpi/dsdt_q35.asl
> file). It only contains the specific Q35 parts that differ from i440).
> At the moment, these are:
> 
> - BDF location of LPC Controller
> - Minor changes related to FDC detection
> - Addition of _OSC method to inform OSPM about PCIe features supported
> 
> As we are still using 4 PCI router links and their corresponding
> device/register addresses are same (offset 0x60), no need to change PCI
> routing descriptions.
> 
> Note that '15cpu' ACPI tables are only applicable to qemu-traditional
> (which have no support for Q35), so we need to use 'anycpu' version only.

Is the above statement fully accurate?  It seems like 15cpu tables are
used with rombios, so the dependency is not on qemu-trad, but rather
rombios?

If it's truly only dependent on qemu-trad then we should remove those,
as we have removed qemu-trad.

> 
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>

If the first SoB if from Alexey, the From: should also match.

> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  tools/firmware/hvmloader/Makefile |   2 +-
>  tools/libacpi/Makefile            |   2 +-
>  tools/libacpi/dsdt.asl            |   3 +
>  tools/libacpi/dsdt_q35.asl        | 130 ++++++++++++++++++++++++++++++
>  4 files changed, 135 insertions(+), 2 deletions(-)
>  create mode 100644 tools/libacpi/dsdt_q35.asl
> 
> diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
> index bdc33a877f..99f045efaa 100644
> --- a/tools/firmware/hvmloader/Makefile
> +++ b/tools/firmware/hvmloader/Makefile
> @@ -78,7 +78,7 @@ rombios.o: roms.inc
>  smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
>  
>  ACPI_PATH = ../../libacpi
> -DSDT_FILES += dsdt_i440_anycpu_qemu_xen.c
> +DSDT_FILES += dsdt_i440_anycpu_qemu_xen.c dsdt_q35_anycpu_qemu_xen.c
>  ACPI_OBJS = $(patsubst %.c,%.o,$(DSDT_FILES)) build.o static_tables.o
>  $(ACPI_OBJS): CFLAGS += -iquote . -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
>  CFLAGS += -I$(ACPI_PATH)
> diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
> index d3d4bc9543..e6c4a3fd8b 100644
> --- a/tools/libacpi/Makefile
> +++ b/tools/libacpi/Makefile
> @@ -11,7 +11,7 @@ endif
>  
>  MK_DSDT = $(ACPI_BUILD_DIR)/mk_dsdt
>  
> -C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_i440_anycpu_qemu_xen.c dsdt_pvh.c
> +C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_i440_anycpu_qemu_xen.c dsdt_q35_anycpu_qemu_xen.c dsdt_pvh.c
>  C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
>  DSDT_FILES ?= $(C_SRC-y)
>  C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
> diff --git a/tools/libacpi/dsdt.asl b/tools/libacpi/dsdt.asl
> index 130826fdcc..dc764881c9 100644
> --- a/tools/libacpi/dsdt.asl
> +++ b/tools/libacpi/dsdt.asl
> @@ -201,6 +201,9 @@
>                  #ifdef MACHINE_TYPE_I440
>                      Name (_ADR, 0x00010000) /* device 1, fn 0 */
>                  #endif
> +                #ifdef MACHINE_TYPE_Q35
> +                    Name (_ADR, 0x001f0000) /* device 31, fn 0 */
> +                #endif

You possibly want to do:

#ifdef ...
#elif defined(...)
#else
#error ...
#endif

But seeing the difference is only for the address, why not do:

#define ISA_DEV_SBDF 0x00010000
...
Name (_ADR, ISA_DEV_SBDF)
...

And avoid the ifdef mess?

>  
>                  OperationRegion(PIRQ, PCI_Config, 0x60, 0x4)
>                  Scope(\) {
> diff --git a/tools/libacpi/dsdt_q35.asl b/tools/libacpi/dsdt_q35.asl
> new file mode 100644
> index 0000000000..7cefe63506
> --- /dev/null
> +++ b/tools/libacpi/dsdt_q35.asl
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: LGPL-2.1-only */
> +/******************************************************************************
> + * DSDT for Xen with Qemu device model (for Q35 machine)
> + */
> +
> +DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
> +{
> +    #define MACHINE_TYPE_Q35
> +
> +    #include "dsdt.asl"
> +
> +    Scope (\_SB.PCI0)
> +    {
> +       /* _OSC, modified from ASL sample in ACPI spec */
> +       Name (SUPP, 0) /* PCI _OSC Support Field value */
> +       Name (CTRL, 0) /* PCI _OSC Control Field value */
> +       Method (_OSC, 4) {
> +           /* Create DWORD-addressable fields from the Capabilities Buffer */
> +           CreateDWordField (Arg3, 0, CDW1)
> +
> +           /* Switch by UUID.
> +            * Only PCI Host Bridge Device capabilities UUID used for now

Comment style, in Xen we use:

/*
 * Switch by UIID.
 * Only PCI Host Bridge Device capabilities UUID used for now.
 */

The opening and closing lines are standalone.  Also missing a full
stop on the last line.  The rest of the comments below also need
adjusting.

> +            */
> +           If (LEqual (Arg0, ToUUID ("33DB4D5B-1FF7-401C-9657-7441C03DD766"))) {
> +               /* Create DWORD-addressable fields from the Capabilities Buffer */
> +               CreateDWordField (Arg3, 4, CDW2)
> +               CreateDWordField (Arg3, 8, CDW3)
> +
> +               /* Save Capabilities DWORD2 & 3 */
> +               Store (CDW2, SUPP)
> +               Store (CDW3, CTRL)
> +
> +               /* Validate Revision DWORD */
> +               If (LNotEqual (Arg1, One)) {
> +                   /* Unknown revision */
> +                   /* Support and Control DWORDs will be returned anyway */
> +                   Or (CDW1, 0x08, CDW1)
> +               }
> +
> +               /* Control field bits are:
> +                * bit 0    PCI Express Native Hot Plug control
> +                * bit 1    SHPC Native Hot Plug control
> +                * bit 2    PCI Express Native Power Management Events control
> +                * bit 3    PCI Express Advanced Error Reporting control
> +                * bit 4    PCI Express Capability Structure control
> +                */
> +
> +               /* Always allow native PME, AER (no dependencies)
> +                * Never allow SHPC (no SHPC controller in this system)
> +                * Do not allow PCIe Capability Structure control for now
> +                * Also, ACPI hotplug is used for now instead of PCIe
> +                * Native Hot Plug
> +                */
> +               And (CTRL, 0x0C, CTRL)
> +
> +               If (LNotEqual (CDW3, CTRL)) {
> +                   /* Some of Capabilities bits were masked */
> +                   Or (CDW1, 0x10, CDW1)
> +               }
> +               /* Update DWORD3 in the buffer */
> +               Store (CTRL, CDW3)

This looks equal to the QEMU code FWIW.

> +           } Else {
> +               Or (CDW1, 4, CDW1) /* Unrecognized UUID */
> +           }
> +           Return (Arg3)
> +       }
> +       /* end of _OSC */
> +    }
> +
> +    /****************************************************************
> +     * LPC ISA bridge
> +     ****************************************************************/

I would use a normal one-line comment here: /* LPCI ISA Bridge */

Has any of this been picked up from the QEMU asl files?  Asking
because the above comment looks to be verbatim copied from the QEMU
file, and we then need to carry their copyright notice, which is not
done in this patch.

> +
> +    Scope (\_SB.PCI0.ISA)

AFAICT this is adding more content to the ISA device already defined
in dsdt.asl?

> +    {
> +        /*
> +         LPC ISA bridge
> +
> +         PCI Interrupt Routing Register 2 (PIRQE..PIRQH) cannot be
> +         used because of existing Xen IRQ limitations (4 PCI links
> +         only)
> +        */

Right, and PIRQA..PIRQD is already defined in the generic dsdt.asl.
Might be worth mentioning, otherwise the block looks incomplete.

> +
> +        /* LPC_I/O: I/O Decode Ranges Register */
> +        OperationRegion (LPCD, PCI_Config, 0x80, 0x2)
> +        Field (LPCD, AnyAcc, NoLock, Preserve) {
> +            COMA,   3,
> +                ,   1,
> +            COMB,   3,
> +
> +            Offset(0x01),
> +            LPTD,   2,
> +                ,   2,
> +            FDCD,   2
> +        }
> +
> +        /* LPC_EN: LPC I/F Enables Register */
> +        OperationRegion(LPCE, PCI_Config, 0x82, 0x2)
> +        Field(LPCE, AnyAcc, NoLock, Preserve) {
> +            CAEN,   1,
> +            CBEN,   1,
> +            LPEN,   1,
> +            FDEN,   1
> +        }
> +
> +        Device (FDC0)
> +        {
> +            Name (_HID, EisaId ("PNP0700"))
> +            Method (_STA, 0, NotSerialized)
> +            {
> +                Store (FDEN, Local0)
> +                If (LEqual (Local0, 0)) {
> +                    Return (0x00)
> +                } Else {
> +                    Return (0x0F)
> +                }
> +           }
> +
> +           Name (_CRS, ResourceTemplate ()
> +           {
> +               IO (Decode16, 0x03F2, 0x03F2, 0x00, 0x04)
> +               IO (Decode16, 0x03F7, 0x03F7, 0x00, 0x01)
> +               IRQNoFlags () {6}
> +               DMA (Compatibility, NotBusMaster, Transfer8) {2}
> +           })
> +        }
> +    }

This seem to match the blocks in QEMU, so it's likely fine.

Thanks, Roger.

