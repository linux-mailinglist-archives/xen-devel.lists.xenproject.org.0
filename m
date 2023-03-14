Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07226B87D9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 02:48:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509419.785131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtlh-0002NP-T6; Tue, 14 Mar 2023 01:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509419.785131; Tue, 14 Mar 2023 01:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtlh-0002L4-PA; Tue, 14 Mar 2023 01:48:01 +0000
Received: by outflank-mailman (input) for mailman id 509419;
 Tue, 14 Mar 2023 01:48:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZhtR=7G=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pbtlf-0001lR-3T
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 01:48:00 +0000
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c699dc3-c20a-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 02:47:56 +0100 (CET)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:47:45 -0700
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 13 Mar 2023 18:47:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 18:47:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 18:47:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 18:47:44 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 01:47:36 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac%9]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 01:47:36 +0000
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
X-Inumbo-ID: 3c699dc3-c20a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758476; x=1710294476;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5Qa8b8ns0FsNrjfctBVJ3telzBv+NRyUIszBGPePokM=;
  b=L0A7Is/shsnbQA7fKTjKCF6U7GPwq7DJOf6qTmECu/IV14TcPai/PaSj
   o+iguyP9iXlp4XgDgRBBDzCa61rLZ6Feu6BA0WX4Hd0FSXVM+erEtr5vu
   V/zJ+1oOI5fkyEH9gymXi60QHqi/99WyX+rQ6qPLt69i/mA5OMPQWpv3G
   R+Cochz1UaKA+TNRiuF2ywZ/bKPQxJi7KgR8Vco+x7RU/qNNFWVWyf5SC
   HrSw9URkQRjfCj1b6AuD0MUOov+H0rGGX9IIOHcJArsJEfBOwkSBWLg9B
   vAm+cGyq2sH3CZtz6ZHZJPpZiZqTaZVvz2EQAzoZRMYaghhv6XSpk4WFR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399893593"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="399893593"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="743114222"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="743114222"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NT1UV9dJEwE+CY1X6+f/YSylOiy/B1yYmswmdJv6CKbVZSFIraK/O8DfXfS/8fcCNxHuZ0G10aYWsAdJOiL4TQ62exUTsSbYv8SQW4k/4AjhQqyZw3gNkktivpf+VR/hfkTLDzOJhvOupYf9Sico4YNMXg79gAl0p9Dd9TkaR0Qhk0Q0yBlNNczSexH+1+CtiWPxCj+2nlXNh2HXXnPmdNwnmsZ90vrR/n+C8K6C5JONjQtG6qkU2IzftrAF23MuAUkT3hcP1usk1p1dZxXAYTgkDu/6hWbC/uahUKASKj/DIMWSY7gCf/tngrg3+N34gLUAG3k9dfnPLDUE++sjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Qa8b8ns0FsNrjfctBVJ3telzBv+NRyUIszBGPePokM=;
 b=jIpglK6Idv4Ji5h6as9d1SFVx+wJJfuF1Kx0SkziJQfpzb/96m/4TCDOQzU0Lf5nCpvvBoea8tk2FNZjM1sqsIekEalpt32fdk4dRqwPCEbbUcHn5o35N94sIJvRBfjOchGlRUNsm3zlU4M8xXgi0y5VTeXy2uDZSww1p9kZKbOsph5U1x+bd9AVSoQxXUyeMb+VilfnIe4gkDbJeL5S7/lChmzHDioCvKgNX30MDo8R51VfXJmX42kgWQczltPrlkswut7Zv1OQmDP+4qThds9rWFRgvnBOn+URC0fG46WAkxSyp4j2cdYC/X0Zafq+gFuwrW8/7JDmY9W2OGRC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Marczykowski, Marek" <marmarek@invisiblethingslab.com>
Subject: RE: [PATCH] VT-d: constrain IGD check
Thread-Topic: [PATCH] VT-d: constrain IGD check
Thread-Index: AQHZS1pOMbLYjGbVlki131v4Tnbs9q75lwbQ
Date: Tue, 14 Mar 2023 01:47:35 +0000
Message-ID: <BN9PR11MB527615666F630F06EA39C25E8CBE9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <52cdcad9-cd21-1132-ca9f-ba8092d649a8@suse.com>
In-Reply-To: <52cdcad9-cd21-1132-ca9f-ba8092d649a8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV2PR11MB6070:EE_
x-ms-office365-filtering-correlation-id: 45d00f76-1a66-406a-d3ff-08db242e1614
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y2ZgkDsZljyFRzVtuBrb0YjLppdLY26u4gd0JYx59EQt02fLOxoxlbqfA20lKQ3HoYiXWn+vhN5tg2Fxqir8KX4zjEFbq7LJ7tp1PBJRVq4WhVpH5PGM+AD9837nArtYXsxs8gVQkigk7pxwjQJPGG2xYAMzOwrv1V94ESSrCOUYRyF2wzY+2VN/3VKQQcUPlO4SCOf6jydhu2qH9WNV9tOjGq4YoqQFePT0AZVHtSKgJFFKX45lc2h1dtne/oM+/j/HZpW7RjCxRduU+9Gj1D6v0pYPJfdjLw/RPL/78u59HhCwsF+oHCa6Wq2FTuQzNekLWR4l9gC9asZFUDQkUQsf3ZPs748XHDHQ2CccamrRPxq481RBWFCbKEOUSxcCpvUnVfamQ6p09s6GY1diwGnjxLTI3afgfO3oXtlSfuZ3S4+BvI3eXRIdyRdDh25YaFmuWgnofMMITgeKp4T/MrnFxT02YDWb8C3PvRh/tzNo7S36+VepmGbHkZHVoBI4HyXRIWv5Dw6BpaneDS4eEYCtD9mDoQK8rO/aIw6i/zuOkIE2f2x1GXr4OIEjXa2SEx0jMiggoUXc7ImfXC8TF+0JnhEEynrb6seZrGE6Z1wmSjw+tmqSgLcL3SIcds8htTFqn5Uicuhy7t+zPJ1dcTimSwjCyenrK+gJShxwlL0xZrHOi50D2hV2jJ0PpPAFOIuE72I/fMISfx2GHVwubw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199018)(6506007)(41300700001)(55016003)(4326008)(64756008)(8676002)(66946007)(66556008)(66446008)(316002)(186003)(26005)(76116006)(66476007)(9686003)(478600001)(71200400001)(38070700005)(110136005)(38100700002)(7696005)(86362001)(82960400001)(2906002)(122000001)(4744005)(5660300002)(33656002)(52536014)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0VGSm9za2EwYjlNOVNBUUYzZEw1cDdlL2RXVVFGT2FtTkY4TUtRMHU1SC9K?=
 =?utf-8?B?eGtyb2RGRjN0bkJQRGVBUjlhR2MvTU5XdWMvYS80NzZ3eCtxRGZ4MWhPWTdS?=
 =?utf-8?B?VjFsVmFzelhUQ3FNUDlzRW84aVhxWEViMGFvSlRkWFJlSHYxRzJNWDRwNk1l?=
 =?utf-8?B?OEN3YVFodHh1b0IzQU1GNHhKN2VPV2RNRkJscXZEZ3B1SEl3Z1ozYkkrK1V3?=
 =?utf-8?B?T1lYZ0E5emp0RE11bU1BeTZaTDlxYURqR0NGS1dKNUMrYUlLOVJEQkQ0TkVR?=
 =?utf-8?B?NGUvZlNJdTRKTTAxMk9jN1RxSHUvTnpJWEVHdGtwSE5pQjlQR0lpZ0RUK0x6?=
 =?utf-8?B?UkJMaTRNNkNmK3NzQjcydU5aM0FHbkRmRGlEMGdIb1ZLM0R6ZkZDdHUxSklW?=
 =?utf-8?B?WVNCU3JaMlFEcXltVUhLQkgrTFpZTUpBb1JEaDJWVXBRUnJsUWhldjZFNTlD?=
 =?utf-8?B?MHhPYS84Zjc4cFZOQ0NNY3djNEtNOHk1bmhxTE8wQ0VCWURnRUxTNjNaZW1x?=
 =?utf-8?B?MlgzaGtKODdFVWg1UzduUW9nOGNJQlhRcklJRU1DS0Y0V1U3c096MUFISUNJ?=
 =?utf-8?B?NC85RUdqVUVKMmlaczI0NFB0WThFUStaZk5oTzRkTkVSNU1nNkhSMHNnRW94?=
 =?utf-8?B?YWpoTi91NXczWmNaa2tnazQ0RzhGSnFUMEFsRjBsL09WaFRJTW9vT043QmNK?=
 =?utf-8?B?UFlRaUVpK21LWHMzeHdSYXJHOXVyNG51T1V5N3psNVhvSFRhazZNUHBQRDgr?=
 =?utf-8?B?cktENm1tVktoSjdsSWRuN0N6T253M1JSeGF6STI2MXhLOEJZd2J4Y1lZK0NQ?=
 =?utf-8?B?OFNIVUFQd1FOc3FnN0dxY2RPbVVrYUlCcEtwSUk1SWhyL1Jzc2VlSUR4ZGJh?=
 =?utf-8?B?L3NIWnBjM3VaQWI1eEg2UkR1WkI0QUpGbndFeXU2WE12V1NjOGgxNjNLWkpI?=
 =?utf-8?B?TUFVcGVoOEt3bERyQ3l0bHVETGZZYXFHdWNpWWZpRVBiUjhGZ2luSmF4cU1Y?=
 =?utf-8?B?Wm15S1lWbEJoZzlPZmhhU3dEVTQ2NXU3SjFIZ3dLbmZ2V0hhRGhKZGh3bFBq?=
 =?utf-8?B?UjJhaHl2NXMvZnlhMStUdjRFVWVTd3E0b25KNHJGSDk4Nmo5WjJodU8yQ083?=
 =?utf-8?B?dVlCcDVYT0FXbFpQZ24vTEdNMjdFVkd4NlIvaTNWUHRRZkJNM0tyamdaSlVn?=
 =?utf-8?B?WVhQSHdFdGJBQmpNYUIvWFFEYkgrS2xjajViOU9EaWZUMU9WK2wrblYxWjJP?=
 =?utf-8?B?ODF2MzdwcDNXQ1pXTzZUWmFsMkNZcGh6N3l5Q0k1MHNxRWpxL20xbFYwK2M3?=
 =?utf-8?B?SEdDQmVSeWVMTVgxUXpvSHBLWnVUN0NJR3JZZkpJa3J6RUFHL2E5M29lYlRE?=
 =?utf-8?B?TmxZOW5kMzg2am5LeGcwbWVZdXJJY2U5SEZjQ09jSTVnVk4vUTVrcmptSHV5?=
 =?utf-8?B?N3pKMXA2eENkZStCaDZMVVVNODlEZlZFVTI0Vm5URmdqTHRpYkVBTUE4dGZq?=
 =?utf-8?B?VTFzaEJFSTU2TTR6T2pra1A0OGtEWmZSdmZCOWdhVEtKVmt5NkpXRFI1WGFj?=
 =?utf-8?B?SUNVdktNaFJUVy9TNlkwb292YXZyMnQ2WTE0RmF4TVNrZHpKb25xYjNuTVV6?=
 =?utf-8?B?cnRjb2JMb2NmWEpTTUhKUDhBMGNkcFUvWlZjb2pvS0V2K3lmcXZTbDJ6TURW?=
 =?utf-8?B?a0l0dklqa3B5VEQrajNKQXJRU255TGo2alg5MWp6NkxZb1VqYk9CcTBVM2w2?=
 =?utf-8?B?K2JZWlJ4MVVDWWhZcFlmY053VFJKSlYxZHMxQzQ1MzZrSElIbkc5Z0RFdjJL?=
 =?utf-8?B?Y3BITVViK0NabzdjT2lpR1ZtUGFzcnV0OGRlMkg2OHNvb0dvQk1yRCsyV1hq?=
 =?utf-8?B?dDRQVTc5Vk9nc1Ewam5JVUVUaC92RVhFMFRmS1VXODMwSUYyU3NTSFQ1MW5B?=
 =?utf-8?B?UHRBV2k5djNobFhmTStkYnBpQTFzQXBTZlRUV2dYQ1Y1Z1p3KzBPcE1jT09Y?=
 =?utf-8?B?NXhNV2R4RnJwSWRFbnVXWG4veHJjWDU5a055bFg3b2dwSmo2SXdUVlJ5cWd4?=
 =?utf-8?B?SytLVDRseHJmVGR6Vi9ZV3lDY1htbm43RUNibXAwWkxqNHp2NzJSWlNPMlc5?=
 =?utf-8?Q?OGowMVzrC7nRLla/xTDVFVYjZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d00f76-1a66-406a-d3ff-08db242e1614
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 01:47:36.0147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pl48J3QIvfsmv1hJrGt33c/sPJ18FpS4h6UfIzTlM3mCBvtzwvwSvOhCwRWMCv+YOA5Ra1nwMoOH1XSoIAGzyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6070
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEZlYnJ1YXJ5IDI4LCAyMDIzIDU6NTIgUE0NCj4gDQo+IE1hcmtpbmcgYSBEUkhEIGFzIGNvbnRy
b2xsaW5nIGFuIElHRCBpc24ndCB2ZXJ5IHNlbnNpYmxlIHdpdGhvdXQNCj4gY2hlY2tpbmcgdGhh
dCBhdCB0aGUgdmVyeSBsZWFzdCBpdCdzIGEgZ3JhcGhpY3MgZGV2aWNlIHRoYXQgbGl2ZXMgYXQN
Cj4gMDAwMDowMDowMi4wLiBSZS11c2UgdGhlIHJlYWRpbmcgb2YgdGhlIGNsYXNzLWNvZGUgdG8g
Y29udHJvbCBib3RoIHRoZQ0KPiBjbGVhcmluZyBvZiAiZ2Z4X29ubHkiIGFuZCB0aGUgc2V0dGlu
ZyBvZiAiaWdkX2RyaGRfYWRkcmVzcyIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT4NCg==

