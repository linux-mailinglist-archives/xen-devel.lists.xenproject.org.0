Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D77A35553
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 04:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888353.1297734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1timR0-0001bL-EM; Fri, 14 Feb 2025 03:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888353.1297734; Fri, 14 Feb 2025 03:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1timR0-0001YD-BB; Fri, 14 Feb 2025 03:32:10 +0000
Received: by outflank-mailman (input) for mailman id 888353;
 Fri, 14 Feb 2025 03:32:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K06w=VF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1timQy-0001Y7-J4
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 03:32:08 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20621.outbound.protection.outlook.com
 [2a01:111:f403:2406::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42e40b36-ea84-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 04:32:06 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB8594.namprd12.prod.outlook.com (2603:10b6:510:1b3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 03:32:00 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 03:32:00 +0000
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
X-Inumbo-ID: 42e40b36-ea84-11ef-9aa4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIhrusg4aLvngjeV05EAwwdk7oyPFqnKc7HLVWrxWYTFs7nBDKLpSD0NWy/pcV2+zaaiAmr5xuw4OjmZ4+49jkpEQ8qxf18PZG8FXYInV8jnIRWl5Dxdygk5EoAXYzOh+sE0dCJ8118POvhK58b1q5Vh7FSDNtigUCx4GtUuaUFqLe6haBCAOmMtYnGDicK0e9meW6HyX1U0zgMfXR2pFM4h40t3OJcPjuq3fwj/6QCoZcMS46pdiCaEfxKDtHF+bp0HM0tUgTcQuPutBTHxsEr4N9ZBPLvts6TOx7Fdjux9I3Eg36c54oPbbGQ2jjmyzdYqZPo83FDK1ggL3RjDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olcr35nmC+u5NaTnoZ7W88hcNHKrwGGMOfzMDy3gzeo=;
 b=C6bR1z7Fv4F5kAP9JUgGKYCUuSoc3YoMe3hG7k3dHl+D/hukeDxPRWuqg+HITCmvNwILsBJDukfrDB7Fuohj42siPuIYJd5B8FpurxubazAXuQNTrPthSn1YOb+2XO5qdfpKTayi9GB9kpIuwvynaIUKZMA2BIrcYJxtrg+cvZIcxexkPSFaXUUn/3tw5QLcHEuPobnIR1TRqrpvNs6onTyJN4EXfQy53+jPjG2M+BGG14ZJ+5mpQxPuj6IKrbmv7Oj1K3QorPqF29+MnZUo8F1Ae1j5+4fqhYlDeW4TrVwfcYtieK0PQOCC3gWnYwtdzI2nEc+I1GR9VkXjOQlD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olcr35nmC+u5NaTnoZ7W88hcNHKrwGGMOfzMDy3gzeo=;
 b=dudYUyBTuZ3NXFG8dD2X4fmsU0fmTiyFDt9O9XUXdhzIbsHukxNQPxkyEw395ERy7oniX56CDSaQXzaiv/CLU2Fv6yfmKHsYoReMMLAG+L9yFuJ4q2PmUAOm/CPrmd3fl6rj/xosYf2ftX7hsmUDioPbA/aSKV6n4S1Rcl7dCWU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v8] vpci: Add resizable bar support
Thread-Topic: [PATCH v8] vpci: Add resizable bar support
Thread-Index: AQHbfCv1LhGDvDdYvUG/cVOOSigHrrNB1FUAgAGqhwA=
Date: Fri, 14 Feb 2025 03:32:00 +0000
Message-ID:
 <BL1PR12MB5849CF146DFA8BD2761D1F4EE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250211022257.1690366-1-Jiqian.Chen@amd.com>
 <Z6sWnK1BYxArBq--@macbook.local>
In-Reply-To: <Z6sWnK1BYxArBq--@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8422.015)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB8594:EE_
x-ms-office365-filtering-correlation-id: f42451df-3b75-4eac-2fac-08dd4ca82486
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V2l1Y2tBbEU0aUhoSHJNSk9FYisxdHdvVTVXRHdCRUtscTlsVjVuVHpKZWpM?=
 =?utf-8?B?OHBFdzdza21tUTU2eHR2d3BvRFF4WW9pV3NjdEZJdjFqV3BmcFBlRlhJUkxQ?=
 =?utf-8?B?c0xROWRZR2JyMEZ5STV5d1VGS2FWUFFEdlNaMGx5eVlITm5ibnJKS2Y1VHhk?=
 =?utf-8?B?M3VPT0xrVDQvN3NFZzFyYjBlYmt4ZHBDMXB1Vi9Rd1kvQVE4aGFBUEZUM0tW?=
 =?utf-8?B?bTNtTXQ3bWtXTEpBdTFBdjZFNkRvWW90dDFrNmhFM3JreWYwQmhadThJY1A1?=
 =?utf-8?B?cWYybDFaUEF5QzFkcG1sY29WNE1RNVZyTGNvUWkrM1lPa0phdEhEQ0hDQ1Rh?=
 =?utf-8?B?QW0zMjM1VmJ1Yy91bHNEMUpDRTFYYkpTbWhtV0hDUHN6ZWM5SzF1enpuV2NY?=
 =?utf-8?B?SzZtVy82REJKMS9rSjlqcmpzZkIwd1Vzaklwbjh6VHpzYW9qWnBVUkp0cGZj?=
 =?utf-8?B?QTYzbEp4eG1vdVlJdkVWMzdiV3BiZ2dxRmE5WTZMTkJndEpERnBZR0V0N29j?=
 =?utf-8?B?YmhxWG5RTDloLzVZSHZ4bUl2bHdJQXZQL1ZrbHJuOXZrOEp0RE9KSTFza2xt?=
 =?utf-8?B?WHowUW1GdEpKVThnWG1ZTjRtclVoK3JoN2EvdVo3OGcrQStYM2R5OHk4eFAx?=
 =?utf-8?B?REt5MGc0cDZ2TUJKSFI1Y3FSUUgwSzJ2UEZLeTByOU15WHdNSCtNNmNXeGhi?=
 =?utf-8?B?MVc4OUplaXZaMm9VME0zZ3pzUXdpT2l0SmlNUzl2RGV0NlRERS95Sm1HV2RU?=
 =?utf-8?B?cXR5VGdWQzhpT0RxMVNsK2lmMHV5R01OZzlPT3prVDRTcXlZb0RmZ0N1QUpu?=
 =?utf-8?B?cEpsaVV6cm5MejhQVmtjV1AxQ2ZlS056WGF5eGtaR01zdHN1MUFTODlDYnQv?=
 =?utf-8?B?S1lDTDlSbFRHYVhnblNVVm5JblBkaVBRaEZ6Z3M0Um1oSnExTW5QQjArdndj?=
 =?utf-8?B?V2dMRmp6cFdvOW5ockVXelJEY1h2QktEUWdFZjE0ZWpYbXZBVXV5K1VpTG5x?=
 =?utf-8?B?dUM5V1VmK1JYZWc5ZjVKR09iZVl0YXRETW12TE1Db3hOOTE3c0NlR0IwZHNC?=
 =?utf-8?B?cFg3NVJYR01CZHZ5eVZwMm5udTJhTDNhbzE0a1Yrd3ZIR1ZpeDBiaGxyZTFL?=
 =?utf-8?B?b2d1THRxKzdYaUFQb1BYRTlacGNtMUJCcm03cXZkc3l5OFFJckt6cVpRQ3Q4?=
 =?utf-8?B?TTlWSjgzUHVqSXc0ZW9oc252dUNmaVNad3ZOWHBrRXZ0QnM0NWgrbEhQVHV3?=
 =?utf-8?B?SGY3cDJuOTFCL3p5NmJUV2huQmhRdnBxZmw3ZlB3MGVxT0xSNzl0U21PMlh1?=
 =?utf-8?B?ejBualhwMGhsOU1sSEZaa1Y1VEJSR3VzbVRBY0pjWW9Kc3BoTXNVQUtIRCtN?=
 =?utf-8?B?WmRWSitiZmxoQWQrd0VXdlNuRDdyL29PVC9EQXRuejRjQU1qamJwYWhSd2lM?=
 =?utf-8?B?ZWRleHZoOXFVK05YdUtPb3k4TjVaLythWWdSMmRPQ21LZkNNckpxVy9qM0U3?=
 =?utf-8?B?dnJ0SDJpWk5VMjU2ZGVVTm91OGI0cGI2ODNKbXJiNnhWbmRranpOb2F5UE5K?=
 =?utf-8?B?OWxBY1E2OVlTRGNKWThZSTBEOWNkTVhxN2QwNEVWSGZYcUhHZDNpdjA2Qlcy?=
 =?utf-8?B?QUpORUhOU1RJUDBmSnJzRS9RWUpZWHVQaS9uU0JRZmdkUmNNWGxUSmNvUWxm?=
 =?utf-8?B?a3VrYXhqaWFMYmRuc1h3YjFzQzVNeEdKVmtGelpNclM1Q0tybW5NL0h0QXhz?=
 =?utf-8?B?dllmOFVITklOVFNQK01zTHVmNHk3MmduSnQ5Tmx1WnFzUGVoUnc2MXlTY1Zq?=
 =?utf-8?B?dkRrWGt0WkloOEg2Y1N6N21sSkZibUs2bUt5eXZSWlBKZGZzZW9FcWlsV042?=
 =?utf-8?B?UU1PazVyR0dYMVBKN25jVURVQjNyMFl5b1k5UFJoK1VnYmZLVmpzQWNVU1A2?=
 =?utf-8?Q?7mXT+wTc/nYm8BRdZl6R1MZ/cIb7sCXE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?azVCZWhBZVcxTUlRVDQyQ1RCNzZ4NXlZMlZVa0RCZFpkdUhuSXNGTVlEdkcr?=
 =?utf-8?B?cUJQUWdabjB3aXZIa2drcGxlMkF2SUM0V3BPZWg3SlpkTGdtaVg2ZHhHWis0?=
 =?utf-8?B?SHQzYzIvSU1Lc1ZqME44UlN0VjI0dXkvMnNXRGo3SkMrdW9VeTVaU2dLT2w2?=
 =?utf-8?B?WkZaa3I0NFRBeHUyNlkzUm9Rb3o0SU05MjV0cWVxd1JnSjJOaWkrWmxiNHVt?=
 =?utf-8?B?S2RmMDVORE5tYngvc0ZiMktGcjBlQ3BCN0VlR3JmeXpCOW5WeFk5V25XWXk1?=
 =?utf-8?B?TWJXWllRaHhadUZKTEc1MkFyKzBkTVc1OFBHT3ROTWpRUm1JYjhPaHYzR3BU?=
 =?utf-8?B?aGkrbCtBcEQ1K0FUQmFzOWQ5a3MxZi8rY05reGU3MDJnTU5FZkpxaWxHbTNv?=
 =?utf-8?B?aFZkTUVXRnducXZHbkwybndENFRzZ29DVHp3NzZUYWMzTC9jZ1Jud1FoWFRM?=
 =?utf-8?B?K3BwbFFoZ1NlSXBhK2VGbWpQL0FmNTlFcVBZWWdYL2hqZmRlWjVOYng4WXYx?=
 =?utf-8?B?T1phSzNERXhOWkEySVB4U0NiZVhGdXNDNkpYMUREMXZOUkw0WXFGZi8vVDJR?=
 =?utf-8?B?MVBKbkVjS0pmS0FVbitBRUZSWWVaZFlHNm1HSmw0am9TQlYwaWhlYmxKU2k4?=
 =?utf-8?B?WUFCb1UxYndxYW5ra0g1SGUxbGhWeEVVRkM5ZE1JUExEMTJUanJSQUh2YjBB?=
 =?utf-8?B?SFNkT0NVUzNQSGhjczRzbDJmQ0VpS3ZVVnNDa2dFVks0ZWRBWEkyTkpqVGRo?=
 =?utf-8?B?VTIrZ2VFZTh0MTkrcG8yR2RZby9WR2UwUXMxUEx4UFdLaXZoSzZmbW5abkU5?=
 =?utf-8?B?bi9nekU3dExpNVBGN1ZHQWM2ODRiUEpnai94TXQxM0tZVUYvVkoyclRycnZU?=
 =?utf-8?B?SW5tNTBqei9qTFUvaWloOWtnOE9hZW5iSGlDcWdVYU04MHdDeGxTNzZjUDRV?=
 =?utf-8?B?MWZPMHI5bXZLVVhoZndSQ3NmWk81WXZ3NVVQR2hXZzIrWDNKYjR6R2p5bXRj?=
 =?utf-8?B?ZCtVUXJncU1CMGNYTzdXZ284VEY0cVNxZGlXeHAvVjFhRTBwSi9uTGFpODha?=
 =?utf-8?B?RFNFN1g1WWxpNnRuSHMvc2dRcXY5Rnl1dEl2RHdBNEJ1NXZlUndzUTY3eklY?=
 =?utf-8?B?K0JsMXBIOXEvWk5QbEZ6NkZaY0czdTFtT2Q0cFluVjZCN0lzN3ZSMFlqV2Jk?=
 =?utf-8?B?blhoY2V4ZzNJQU0yT3lvNUVwSm9sdUoyZ3pTeHNHaTQraEtFYzQzVTlBenNI?=
 =?utf-8?B?K3NQS0N1MERSbm1IQlBYVS9uZit0R1hBdnEvWDlaVVFyN3JQMStzdlc1ZndG?=
 =?utf-8?B?RVVscmdoV204TUZjQnh4N0ppWDkyTDNGNmxaZGROK3lZbmJXZVJOSUNwdzUy?=
 =?utf-8?B?THlEOEN1UWVkMlJQbHM3RWN2MHM0NWN5MndhanZ4bHY2ejRERHdicUpNUk82?=
 =?utf-8?B?K2xBSEdMWXUrRUFSZEQ3SzhDc3NFdTgyY3c4eGVKT3Y4WXJneXpmMlp6Q1JL?=
 =?utf-8?B?Wm40VWJHclJHc1F1Y1FqTUUzcUU3aWxOVU1uSW4rWW1xYlNYa3N5UnJRSk9x?=
 =?utf-8?B?NlJQb1BjNEhHSk5ISmpSMzBFQThZVTRFVW5DYk5JdnVZTGlUY0x6ajBaeG5P?=
 =?utf-8?B?QUVyZ1F6WWd6NmtxV1lYRE85SXFNMG4vQUIyZWdxeEpRekhJNVY2bzNuaTBW?=
 =?utf-8?B?bTloMXF3MGcwRHUrNDNUMUw0bXZUaEl0U05GOUF1Tm9TeTVBUC9LaFozV1JB?=
 =?utf-8?B?Nk5JM0hkbWE2OW00QzlqL3BnVExJYzFwRzlHK25JMnV2NTEvUW1OdGxTc2ZC?=
 =?utf-8?B?RFE4dXJqUlYxaFZUR0txdmZtaWhVNTZ5cmwySGViY2dzaFcySkhLcW5ZcGZV?=
 =?utf-8?B?NXRNYTdiWXhnVzlHWG5DeHlOeXBVd0taWDcyOUZyRUl1djZST2E4V3ZQVlNK?=
 =?utf-8?B?VFBNa0xRcWVZOC9IL0p5YkwxdUVodkt6SERpOEUrNTBIVkl2dFNTdWhDUytj?=
 =?utf-8?B?STZJOUtteHRFTm45SDFLbmxldHA2OStENkQvajJZbXA2NHNTOWhmVkVINWp6?=
 =?utf-8?B?WVgrRGxlM0FDOE9YTFJRWmU3Z2VWK2hRY2pyVi9jaHVlT2lzN3pxK2U5YU1r?=
 =?utf-8?Q?JUvg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37736A6A6B37A7409C469602C48AF71C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f42451df-3b75-4eac-2fac-08dd4ca82486
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 03:32:00.7158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5kGxo+1AWP/wWu0TxpGG4sN9LeeizEbA/ZkTia/gIZZogV5YAzWciGPFrI3e461YiagGyWg9Gh+dHficwgf5sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8594

T24gMjAyNS8yLzExIDE3OjIxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUdWUsIEZl
YiAxMSwgMjAyNSBhdCAxMDoyMjo1N0FNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFNv
bWUgZGV2aWNlcywgbGlrZSBBTURHUFUsIHN1cHBvcnQgcmVzaXphYmxlIGJhciBjYXBhYmlsaXR5
LA0KPj4gYnV0IHZwY2kgb2YgWGVuIGRvZXNuJ3Qgc3VwcG9ydCB0aGlzIGZlYXR1cmUsIHNvIHRo
ZXkgZmFpbA0KPj4gdG8gcmVzaXplIGJhcnMgYW5kIHRoZW4gY2F1c2UgcHJvYmluZyBmYWlsdXJl
Lg0KPj4NCj4+IEFjY29yZGluZyB0byBQQ0llIHNwZWMsIGVhY2ggYmFyIHRoYXQgc3VwcG9ydHMg
cmVzaXppbmcgaGFzDQo+PiB0d28gcmVnaXN0ZXJzLCBQQ0lfUkVCQVJfQ0FQIGFuZCBQQ0lfUkVC
QVJfQ1RSTC4gU28sIGFkZA0KPj4gaGFuZGxlcnMgdG8gc3VwcG9ydCByZXNpemluZyB0aGUgc2l6
ZSBvZiBCQVJzLg0KPj4NCj4+IE5vdGUgdGhhdCBYZW4gd2lsbCBvbmx5IHRyYXAgUENJX1JFQkFS
X0NUUkwsIGFzIFBDSV9SRUJBUl9DQVANCj4+IGlzIHJlYWQtb25seSByZWdpc3RlciBhbmQgdGhl
IGhhcmR3YXJlIGRvbWFpbiBhbHJlYWR5IGdldHMNCj4+IGFjY2VzcyB0byBpdCB3aXRob3V0IG5l
ZWRpbmcgYW55IHNldHVwLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFp
YW4uQ2hlbkBhbWQuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KVGhhbmsgeW91IQ0KTWF5IEkga25vdyB3aGV0aGVyIHRoaXMg
Y2FuIGJlIG1lcmdlZCBpbiBYZW4gdmVyc2lvbiA0LjIwPw0KDQo+IA0KPj4gLS0tDQo+PiBIaSBh
bGwsDQo+PiB2Ny0+djggY2hhbmdlczoNCj4+ICogTW9kaWZpZWQgY29tbWl0IG1lc3NhZ2UgYW5k
IHNvbWUgY29tbWVudHMuDQo+PiAqIERlbGV0ZWQgdW51c2VkIGZ1bmN0aW9uIHZwY2lfaHdfd3Jp
dGUzMi4NCj4+DQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiBKaXFpYW4gQ2hlbi4NCj4+IC0tLQ0KPj4g
IHhlbi9kcml2ZXJzL3ZwY2kvTWFrZWZpbGUgIHwgICAyICstDQo+PiAgeGVuL2RyaXZlcnMvdnBj
aS9yZWJhci5jICAgfCAxMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4gIHhlbi9pbmNsdWRlL3hlbi9wY2lfcmVncy5oIHwgIDE1ICsrKysrDQo+PiAgeGVuL2luY2x1
ZGUveGVuL3ZwY2kuaCAgICAgfCAgIDEgKw0KPj4gIDQgZmlsZXMgY2hhbmdlZCwgMTQ4IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2RyaXZl
cnMvdnBjaS9yZWJhci5jDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvTWFr
ZWZpbGUgYi94ZW4vZHJpdmVycy92cGNpL01ha2VmaWxlDQo+PiBpbmRleCAxYTE0MTNiOTNlNzYu
LmE3YzhhMzBhODk1NiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvTWFrZWZpbGUN
Cj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvTWFrZWZpbGUNCj4+IEBAIC0xLDIgKzEsMiBAQA0K
Pj4gLW9iai15ICs9IHZwY2kubyBoZWFkZXIubw0KPj4gK29iai15ICs9IHZwY2kubyBoZWFkZXIu
byByZWJhci5vDQo+PiAgb2JqLSQoQ09ORklHX0hBU19QQ0lfTVNJKSArPSBtc2kubyBtc2l4Lm8N
Cj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3JlYmFyLmMgYi94ZW4vZHJpdmVycy92
cGNpL3JlYmFyLmMNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAw
MDAuLjc5NGYxMTY4YWRmOA0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIveGVuL2RyaXZlcnMv
dnBjaS9yZWJhci5jDQo+PiBAQCAtMCwwICsxLDEzMSBAQA0KPj4gKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4+ICsvKg0KPj4gKyAqIENvcHlyaWdodCAoQykg
MjAyNSBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuDQo+
PiArICoNCj4+ICsgKiBBdXRob3I6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0K
Pj4gKyAqLw0KPj4gKw0KPj4gKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4NCj4+ICsjaW5jbHVkZSA8
eGVuL3ZwY2kuaD4NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBjZl9jaGVjayByZWJhcl9jdHJsX3dy
aXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJlZywNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZhbCwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3Qg
dnBjaV9iYXIgKmJhciA9IGRhdGE7DQo+PiArICAgIGNvbnN0IHVuc2lnbmVkIGludCBpbmRleCA9
IGJhciAtIHBkZXYtPnZwY2ktPmhlYWRlci5iYXJzOw0KPj4gKyAgICB1aW50NjRfdCBzaXplID0g
UENJX1JFQkFSX0NUUkxfU0laRSh2YWwpOw0KPiANCj4gU2luY2UgeW91IGRlZmluZSBpbmRleCBh
cyBjb25zdCB5b3UgY291bGQgYWxzbyBkbyB0aGUgc2FtZSB3aXRoIHNpemUuDQo+IENhbiBhZGp1
c3QgYXQgY29tbWl0LCBidXQgSSBhbHNvIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBhYm91
dA0KPiBpdC4NCkdvdCBpdC4NCklmIHRoZXJlIGFyZW4ndCBvdGhlciBjb21tZW50cywgdGhlbiBJ
IGRvbid0IG5lZWQgdG8gc2VuZCBhIG5ldyB2ZXJzaW9uLCByaWdodD8NCg0KPiANCj4gVGhhbmtz
LCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

