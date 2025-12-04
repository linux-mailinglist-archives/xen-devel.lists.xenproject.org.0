Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA23CA2F38
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 10:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177426.1501711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR5Vd-00018d-30; Thu, 04 Dec 2025 09:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177426.1501711; Thu, 04 Dec 2025 09:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR5Vc-00016k-VR; Thu, 04 Dec 2025 09:20:20 +0000
Received: by outflank-mailman (input) for mailman id 1177426;
 Thu, 04 Dec 2025 09:20:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OurU=6K=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vR5Vb-00016e-LA
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 09:20:19 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 726f4eeb-d0f2-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 10:20:17 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Thu, 4 Dec 2025 09:20:14 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 09:20:14 +0000
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
X-Inumbo-ID: 726f4eeb-d0f2-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNG6TOoPU9frueZEfPB60PhP0xgyzs1yLEFVkyvK8SXqBsRueTIinvDKVmpqJ0KOhe42IQmhd6ZcgbdaQaOpX400JuwjqaDWZmjj1eIYTbeLcdxolnjJN+jwl8fp1Fs00gLsvSUsGjJc4ZQCeFJryc5kYf/FHfxWm6SGHtxZKTn0rMbbNPpsS2oDLuk0Ykd/szmYxzuTEhJ94KvmwamWsSS5dqyvlz0RkQXELzjU+Stj/pVqIe2UVXTfr0b1D7W2c6Aps6ZoIWejzuSbOrNiDjPhqfCM8W683VQIRP/FXC+sEjArqapDOAGAtkObizWZ8VAF+aRACWQzblRlxNSk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1QolN5ar6dSUTF5KgheUVkOcUdTDKdSTFGX0xO6S3A=;
 b=xnniIyT5biaLoOfhqIE/LljQYQ2pWNXmUgu3BvrwZVn00LA7Q0gty8l3kIrt4HYIlvwC8JmdEmUSZV98SpPeyGpl2FdoYr3BsBdTZJXkuVpr56jZCjlKBvOkYkgRIb1rCZd7DiF7rhxmtO5gFG7EymkWIUFJYryaWiHsS92TYNyMa8xGAGIT/IsfCecZoOmCfmH8E69S/B6+VY7dxn02eaDB8hkkATo5cFIK4reqzcRTEgVSR9ATBG2672xcSEA2CM/hEBlV7m2cBtiFkuGRAQIfxZEDZMx48YHDCD47bKcWwlRj9brfFq3QCH958epAQeA5ULrgaAc51UM0EA2T7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1QolN5ar6dSUTF5KgheUVkOcUdTDKdSTFGX0xO6S3A=;
 b=F6dC+3MH7c3DNOMvcoEzp9/xJD1g6WMrFqDiLuWkiCdTHT3zv9id27L0c0LIMAuEjes6wjHtW59osnaLtDvoVQbGs+n9TTziyeHfJsytKzFUDdL/62WO1s6ls9EWOevkR1dFfh288JRqpkDXkmmNm9DQjBKiR0H8Ju8IM+53uts=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 24/24] xen: move MGMT_HYPERCALLS out of
 PV_SHIM_EXCLUSIVE
Thread-Topic: [PATCH v4 24/24] xen: move MGMT_HYPERCALLS out of
 PV_SHIM_EXCLUSIVE
Thread-Index: AQHcWtXtEnwTBuQwpUm2Fi91lgBgbbUEufQAgAyNPyA=
Date: Thu, 4 Dec 2025 09:20:14 +0000
Message-ID:
 <DM4PR12MB84514B5C0BF7AC492D8E863AE1A6A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-25-Penny.Zheng@amd.com>
 <55d23825-fb8c-472c-9d31-5b482f32e915@suse.com>
In-Reply-To: <55d23825-fb8c-472c-9d31-5b482f32e915@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-04T09:20:06.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH2PR12MB4167:EE_
x-ms-office365-filtering-correlation-id: 7a4f01e2-29fb-4e1b-fb2e-08de33165537
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?M2QrT0htR1NXSTlTcllzSy9yYlQzZm54U3kybFNyZC9LQmFSNzhGZjMvYmRh?=
 =?utf-8?B?a1pzT21PZC9ZNW10dUs5QnpnUlpkaFd6L3FISmgzZ0ZlYnVrZWlyWnM1M3lT?=
 =?utf-8?B?NnMrK2NpaFBuQXVFRzJpTm01dTVFZXNtTzkyTHlrbStjdEQzMlNkR2NTQlNR?=
 =?utf-8?B?eXNHbHY5anpYV25WYktjempqQVZzWDVzNHJDa1Z3SlFIOGQyZkFyaTVJQU1F?=
 =?utf-8?B?OGFJdjdqMENkTU1peS9hekc2eWxhTUpCbHZ1TzBnTG5md3NQai9RdDJZcWJl?=
 =?utf-8?B?RmI0am9VVW0yTy9DWUV1L3cxeXY1Ui8wVjI1Zm1Pc3ByRHpMUklyRFh0TDV5?=
 =?utf-8?B?QnNKQlFhQ0g4aStLRit0Ky9BbWttOFVzSEFtUkp1MnNTY3hDUzY1a2h0WGdk?=
 =?utf-8?B?QkFxRnNVOWlFQjVXbTJQWU82RVpDWFFnRUtGZjd6c3lDRHlWaTJsZ3J4Wnhq?=
 =?utf-8?B?eVRhQVdDOHovYno3dVBsRklaa3d5M1NqS2ZHYVdxeVhXVEhmOUVGZmZXdmhH?=
 =?utf-8?B?am5FZTFPcDRzZjB1L0lBckZSZHF0blc4RyszMkh0aENsd0VyUzhYdDYvQ3BO?=
 =?utf-8?B?M0k2WXgrTEd1TmJlckN3VXZBNTJQMUFUbDBWUFd1K2RuamgwNnRoL0VXZm5H?=
 =?utf-8?B?VGJka3VDbmoxRDI1L1k0WDF5cEVicU8rWlQ1Y1BUZXQ1a29OekhJYnZqU3NI?=
 =?utf-8?B?UGpLQmVJd1l6VEUyWkFYcURnZDVmN2pSMG91aWNmR0x5TUpnWkpsOE9YdUdp?=
 =?utf-8?B?dDVJYTNSMGo5TWtqMVM2UmE4RVI5QjNnQmxvVGFuZlZMWkFkemdwdEhqbmFk?=
 =?utf-8?B?UG9RaUtZakQ2ZmhKTzhRSDFESEp6c1B1MU5Rbm9Zb1JIMC9zWmUyMzBNa0U0?=
 =?utf-8?B?OHV4Y0FITkhpWUs0Q0ZTYXVUNjBicFhsQkNjcTJFbjJQUTdPenE0eE0xMmNO?=
 =?utf-8?B?OFZEZU5qYkQrNkhWZkhkRm5YblNxSTJqWnhncTYvWEliN25nS3FxWjM5V05Y?=
 =?utf-8?B?MVBpRUxQY3JaNDZ2alAyWEpTKzN6T2lvRmo2RDh3WFR6TkhHUlVwbnp2YVhN?=
 =?utf-8?B?WFR4UHA4NWgwQmFOTytFREtDdGJtOXY4aVVTeTJyc29vUVkxc1dyWFE1WGcw?=
 =?utf-8?B?Ym5OSWs3MjhoTnZtNlk3UGVrWEZSUGF0aDV4eWtrQ0JKeUxkTW1zQVc2SEpo?=
 =?utf-8?B?VEhvT1lZaDVPWUdadlpPK2ZybDBrTThKYlhnNTJnNUt4bjNTSXNhaHM2SXYy?=
 =?utf-8?B?VnhHNTZXS2NjT1ZRbGxuekhxOUg2QmZQQzNySVB4OXMxN1V2N1JvY0pGbE9J?=
 =?utf-8?B?OXZRT0lubU1UTGJXY1ZpdnB6cHAwY0VjblByM0dGNlJVUVl3azMyR1lFd3ZQ?=
 =?utf-8?B?cDJmOGNocC9UNk1GWHFPTlg5ZnZYSlpkdmRTSEI5TlR5eFlZaXZKWXBkd0VS?=
 =?utf-8?B?ZUZETUhTMjkyTzUxNUw2RTNFSkZyZTVMTENWMXF6UlZQcXJDYzdDaUMrNWls?=
 =?utf-8?B?cTBSRVF6aWFrRHBqTkx2R1JsMHR6dFh4dmF6b21vZWRsQnJycjVGL3ZjWlVF?=
 =?utf-8?B?QlYyTUtma3NJMUVxU2pCQlNza3krZTlHZGhoa01zdFNpd3RvQW9xanYyMjlh?=
 =?utf-8?B?c1ZtaWVFeHZ2cGh5eFlRVytIby93VDNLNm9YUzNJZE9HekJsVWJ0M0RFY3Vt?=
 =?utf-8?B?VmhRdE55cEtWWnAvenJqelJ1RXRFWWszQ1cwd2NHanpJWkVEUndPWEpCOFBE?=
 =?utf-8?B?VXRlOFRlTnE5N1dKOXczV05IMFJHNFRmMnpHSmhsTzdTRmFPaU0vaXlyeTE5?=
 =?utf-8?B?RkFJYTZKcGRGbzVVWDg2TGtEbDNHRmNHQzBSSGZ5Ny9xdjk4YVhkNW1JdG9j?=
 =?utf-8?B?bC9aODR0Z2x0YmtsSnJjZi9SWXgvMUk5T1hzUHRBQW1uc3FWUDBGR1MzQU1m?=
 =?utf-8?B?ZzFSTngvTFhWUEVXWTY5SEd3YkZZOHEzTUJuK0lWTXJQTEZLVEhucytxdXY5?=
 =?utf-8?B?TE9VN1UvSlE5Vld5SU52TnZrdHc3NXkzdjRuR3hnaCtzR3FHd1dyQS9Zc3E0?=
 =?utf-8?Q?+/v1va?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RzZhQktqeXcwRXhQTTd6cFF5N0pxSDhlV1dWc0JNdkViaFlQTWkwRlEvaElO?=
 =?utf-8?B?aDVnR3V5L3JNOWhEM1NWSHBhY0lHY2w0dW8rbzhIc0w2NXBuamFvVEx0MHpk?=
 =?utf-8?B?VDFRejVVMEk3dHFkU2JkL2hrMHg4Y1RqK3NyWHNrOWZIY1h4akxOSzlVM2dp?=
 =?utf-8?B?Qy9EeWp5UjhqUlgwRzR5RDVYSVFGb2kyaDkyNUg4Ymh5c2QwOGpHZFBrWkZK?=
 =?utf-8?B?ZkdJQTJsMWx4LzQyQzRnaUxFSjhqckRmbEZyYm5oMnplS2x6MzVXY1ZsWFJh?=
 =?utf-8?B?T2k1dURUakdaNHdqQWRXYndWWHNod2pIMG1uZzAzT2tXVEFwMmpEeVo1bk5F?=
 =?utf-8?B?OHVaUzlRWGxwMWo1bHl1bDMwYlhORHZpam5MNkgvbVo3Q1I4TCtHK0x5YWc2?=
 =?utf-8?B?S3dwSWhmZkJzRkRxTmE2SFhzT3UwemVkcnAwT0d0VGFEdU5TTHErUks4Z0NO?=
 =?utf-8?B?cklkQ1hRUFo2WDlrSyt0aFBmZFlzd0QycVNRVHhYc05HK0l2VnUyOElsQlN2?=
 =?utf-8?B?QjhlNGhCOHBhZ2FFZlN2Qm1rSDVEbTFIeTRra3NLd3lOQ2s5OVFVeWJtVytC?=
 =?utf-8?B?NlY5emRkVDRqdTlsaTc2WFpYd0w4K09jUCtvQTh6UmVNeGR0bmFOUTBmMVFB?=
 =?utf-8?B?RFdJVnE3M0FSamNMVGx4QnA4NG1tNkUrUHRaZFlpdlo5UG1lWWxMNmN1b0Ey?=
 =?utf-8?B?VWxxaFEzSGMyUVF1ZzJPYU9XYWxMbVE4MHA0a2o4bUFSODczUGJtUTJEUTEv?=
 =?utf-8?B?azRkSWpjcmpYckNEbXNuK3V1VVVKY0tlRjEwT1lDNHd1bXNFRmlaVDdhUkZ3?=
 =?utf-8?B?N1IwSmpObmg0TXVlOXFqT21tSkhNYk1OTGJDeC9Zb2xNMEtvNFBpaFVjUnRs?=
 =?utf-8?B?VmhHaWtVR1hEVEo3QjRBMkRVS2FxLzIxUEJYWmdtV08yWkhPQTZvR2Njd1Z3?=
 =?utf-8?B?RHp0M1JGWmhSNkFQanAyQmdSUmdTTHAzWXZzRlU4Rmp3ZnJTUkhoRnRpUGZr?=
 =?utf-8?B?SXhiUHRWZ1ZMZVhRMm96Yi9XYUFMWng1UDNqZGw4UHRuY1cweUpDM2JNZ0dM?=
 =?utf-8?B?VWhWZ0NwUkVKZEhqQ05ackFUcEFhL1RXdDFKMUhLbTRPL1BURHgzWXgyS1R6?=
 =?utf-8?B?MXJ6bWs2WjYvZzlXQ2REOUhqRElFcmhxcWl6VWxPRW11aTFIdDBVZHh1Uldx?=
 =?utf-8?B?c1dMN1VlN3NabXp3YXQ0KzJoMGNXOE12RmU0SUROOVRSRmE4NlZpT3grRlVT?=
 =?utf-8?B?V0lMc2ZSMXJRaktiNzBVaktFRmo1L25NRWZOb2dKbE8wcnJTMUZsT1prM1lq?=
 =?utf-8?B?Yy9YcEV0TEgwdFhrbngxV3FBSmg1bVFlK2k1K2VSeDh6MEh5Ui81WmFoOG1F?=
 =?utf-8?B?UnRmeHkxUmZNd2NLdGVseDQ1dEJhaTVCeDB4b1RXSmZWNWc2Q3NUMkxQL2U4?=
 =?utf-8?B?bmpvbGZobFVic0M4NmtLbG0zMCtocGphZnFTYXlyWVNiU3NDUzVlcVZ5N1A2?=
 =?utf-8?B?cmZPcy9PcUNPZUdPNDU2ZTFGdTQ0MGZGMnVMZGtSQlEyVndnZW1nVWJpMXg2?=
 =?utf-8?B?amZCa043NUw4MEI3am9oR2owdFIrVmUycGIrSEIweDlPaGZVdG4yYjVBaDl1?=
 =?utf-8?B?NXRYVGt0dUg3QVlRTmpscGNOWXFqelcwZEN3QkNSWkczQkRkT2ZTbVV1ZERm?=
 =?utf-8?B?d2hJVGVHVDc4b2hQQ2JkSHJZRVFDYzBhQzZnWEdJK292S2lCNytORm9MUndC?=
 =?utf-8?B?UzV0OTI0TzRtbDB4aFBkZENNZXhoTkU4Y1duUkJnWElXRVc3bkN4UXpCTmtU?=
 =?utf-8?B?bnJ3MEdHN3BIWkdPZStTSGxhaHk2TUtITnhRckdydWxlR0hnMmcyUUpSSmVU?=
 =?utf-8?B?RzFKckhGWC9qZy85VE52eEF5N3BHUjhxb1hhNldES3o0NjIyZWprOGpZVGw3?=
 =?utf-8?B?VVkrM1FHSkdCMzhTdExTaEZPcTZ5ZklzM3A0ZlB6enFZN09Tem93M2c4M2Rl?=
 =?utf-8?B?ZDQ1akRpSlVUSjVyS2Y5cUpDV1FOQTFpc1YyZDlRZ00rc3p0Q2xLOFA3Tnpz?=
 =?utf-8?B?M1RjTzNJb2Q0N2t3d0ZVZWJBK1BadVZDbHprYm11RjgyU21ES0FRUXhTMWxK?=
 =?utf-8?Q?0Dj0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4f01e2-29fb-4e1b-fb2e-08de33165537
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 09:20:14.4625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hRbybrr1iqUvde2AFehysV/HFmmBnx071nF4gGkIMcoQpGjicux+OgHBGz9fBuH/tdrVbeJPAXdkIj2qP8ecqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMjYs
IDIwMjUgNTozNCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBncnlnb3JpaV9zdHJhc2hrb0Bl
cGFtLmNvbTsgQW5kcmV3DQo+IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsNCj4gQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBPcnplbCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6
ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJl
bGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAyNC8yNF0geGVuOiBtb3ZlIE1HTVRf
SFlQRVJDQUxMUyBvdXQgb2YNCj4gUFZfU0hJTV9FWENMVVNJVkUNCj4NCj4gRnVydGhlciwgYmVj
YXVzZSBvZiBwcmlvciBpc3N1ZTogQ2FuIHlvdSBwbGVhc2UgY2xhcmlmeSB0aGF0IHlvdSBoYXZl
IHRyaWVkIGJ1aWxkcw0KPiB3aXRoIGFsbCAocG9zc2libGUpIGNvbWJpbmF0aW9ucyBvZiB0aGUg
aW52b2x2ZWQgS2NvbmZpZyBzZXR0aW5ncz8gVGhlIHNldCBpc24ndCB0aGF0DQo+IGJpZywgc28g
ZXhoYXVzdGl2ZSB0ZXN0aW5nIGlzIHBvc3NpYmxlLg0KDQpJbiBjYXNlIEkgb21pdHMgYW55dGhp
bmc6DQpJJ2xsIHRlc3QgdGhlIGZvbGxvd2luZyBmb3VyIHNjZW5hcmlvLCAodHVybmluZyBvbiBh
bGwgb3RoZXIgcG9zc2libGUga2NvbmZpZ3MgYXQgdGhlIHNhbWUgdGltZSk6DQoxKSBNR01UX0hZ
UEVSQ0FMTFM9eSAmJiBQVl9TSElNX0VYQ0xVU0lWRT15DQoyKSBNR01UX0hZUEVSQ0FMTFM9biAm
JiBQVl9TSElNX0VYQ0xVU0lWRT15DQozKSBNR01UX0hZUEVSQ0FMTFM9eSAmJiBQVl9TSElNX0VY
Q0xVU0lWRT1uDQo0KSBNR01UX0hZUEVSQ0FMTFM9biAmJiBQVl9TSElNX0VYQ0xVU0lWRT1uDQoN
Cj4NCj4gSmFuDQo=

