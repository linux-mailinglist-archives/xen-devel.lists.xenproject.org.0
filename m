Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ECB45B11E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 02:24:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229977.397613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpgzr-00085l-B8; Wed, 24 Nov 2021 01:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229977.397613; Wed, 24 Nov 2021 01:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpgzr-000830-7O; Wed, 24 Nov 2021 01:22:51 +0000
Received: by outflank-mailman (input) for mailman id 229977;
 Wed, 24 Nov 2021 01:22:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/oH=QL=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1mpgzq-00082u-Au
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 01:22:50 +0000
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 069815ee-4cc5-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 02:22:46 +0100 (CET)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 17:22:43 -0800
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 23 Nov 2021 17:22:43 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 23 Nov 2021 17:22:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 23 Nov 2021 17:22:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 23 Nov 2021 17:22:42 -0800
Received: from BL1PR11MB5429.namprd11.prod.outlook.com (2603:10b6:208:30b::13)
 by MN2PR11MB4400.namprd11.prod.outlook.com (2603:10b6:208:18c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Wed, 24 Nov
 2021 01:22:41 +0000
Received: from BL1PR11MB5429.namprd11.prod.outlook.com
 ([fe80::9061:212b:2fb5:41d0]) by BL1PR11MB5429.namprd11.prod.outlook.com
 ([fe80::9061:212b:2fb5:41d0%9]) with mapi id 15.20.4690.030; Wed, 24 Nov 2021
 01:22:41 +0000
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
X-Inumbo-ID: 069815ee-4cc5-11ec-a9d2-d9f7a1cc8784
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="295981719"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="295981719"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="607025899"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXMnf1A7r+WaCbR7avGzdsSpXiVq5BYLEJnv900UHpeDBOUIxPOOT3PfNRRqCmcA5XgQJaqY1fD9nKZ2egYj/3jvPgLQTLK84u+9Donr0AH8cmm22vGfqtvhCL0mnSy30JLqjs/4K4hD9eYFezTLHaCZ7LWdy7PPNsQ6B1njG0dGZYB1toTKqCx4E+VxslGKzYEGYJL16JAHd2W493Ni1PjJz7B7eT2XSS2ARx8E8Bxeu7MaC0ut3/CIM6JHER8NtOGsguzZDI+PMTx/Z0Uw4tCnaZNwjBtt8Hp7F8Ui241Cb9Ygf8MaoeiME4IFeg1jXd2wxEAHf1hfcrHsjBEeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFir4j92i/Nsc8T5Q8EMFHZu+Je/aFWRCFgEtUNMpbA=;
 b=GDdSWX078UfmXOi0BPq06QGU0MRcMDKUvvpz7RwiAsN8SyRl3Jbx2u4OBNlad+468JkRHCNbwB0rcfwxwXaB7vb48yz+bQLoP1/7hZ35Jq9zFzUHhfOIfok8GyflrFZIm09NovEYdi3Rp35jIj5SsRA7U+d0R2UE7i4V7ZZWs7GJguh9zenpCVq0clHbmWIJk7iM2R1hQ/EB1Qxfda/DF6KHoarpBL3jSKvgoz1tHtJjtEtCnHgGTC8G4ejrH1DJ4+QYxyx2qqWIgGNdT3Kvo4hLrFXy/Tb3QwzU5mmNylBeoWZ/RInNcg7DKk6cydZWR9fclxQaSk7XDlk9WxWaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFir4j92i/Nsc8T5Q8EMFHZu+Je/aFWRCFgEtUNMpbA=;
 b=oLXNoBuFcX4Mox5kwpeKsxHs+1TzJCXJz1bXCZxA6vcc2cOJBgXH4290UezoH4886VXpQqjmbJUx4HOgDzEPWvciWRw8QeWJftUpAuD6TDuQMKk777UXp7pvTIZ7UdkMmQqpCArzuEX5JLAnIXgcIRtRhghD2pFXd2/Woqh/Ko4=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/3] VT-d: prune SAGAW recognition
Thread-Topic: [PATCH 1/3] VT-d: prune SAGAW recognition
Thread-Index: AQHX4G+bK+NNsWCPc0+Q5rkWpgerr6wR4b8Q
Date: Wed, 24 Nov 2021 01:22:41 +0000
Message-ID: <BL1PR11MB5429877092DD0AF8A8C478DF8C619@BL1PR11MB5429.namprd11.prod.outlook.com>
References: <54e38a20-5281-2ab3-8513-3506ab66dbe8@suse.com>
 <4e801190-ad7e-32da-da87-985e1b6a76bd@suse.com>
In-Reply-To: <4e801190-ad7e-32da-da87-985e1b6a76bd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44e535c6-36ec-4746-bea7-08d9aee8e91b
x-ms-traffictypediagnostic: MN2PR11MB4400:
x-microsoft-antispam-prvs: <MN2PR11MB4400724898D6974263E891BB8C619@MN2PR11MB4400.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1f5uDhaiyQh7Zk9nmwjpF4PcMe7215f8a9zWX/uRx2gQSOPUbtCTmO4qaLmffAlfn1JQFz8oCI0uxzdnOEc7jfEvcmCbkBTBCUwpVn1ednScmBlbRb0Q8kjwbkrQXSqF/zb9t/sa/kyI9VI7yH41xda9/rV7eVWsyDM9GSJ3JtBFS0ShYXj2PBem1SBcczULeXXyJX+C3luedaBHglG2md1t+7J19iwQdJWmsP7bbq5Jvly4kO9CfEsBailqfPMMOTCcRfcIdG4rg0YYE+H4aucL7OBSC4dzNeHX1M7mYRiqsm6noYt2itgOfo5ZfVAa14/NDgkEDEBFdYlh8mgWo18xL5ZAczKkmXYohtqGBPL4JHkB2x3LBjuSnDq5M/NYwrhUgFpjY9roc3O3y1MBHxCdsLr4f2qLmA5hFDn/V/I65AZiOg0j0nAo5HpzSAw86bAWwrHbKN9Wax+Utz29VA+ItSp1vhT31yHsPvjQ/zsIEOYJra72thwWIBky6Ah50h8WiA2z+fMm4C+5YStx69sYs9rkwNkuuz3q2WnsDpz3kPq28oGMmt35xbKF8KdSsIrEUpDwz1b6q6ByeO4IZVqbx1CvHrYyhMel5DrgqaX0+6ZafwdHuKziVg3PSVsn1k0WNw3knFHn89zmjjz6CPNNxdXBZseAPsmbonoaqwkcLkYeemwbMu6PBeg8TMoQw36WarLfgag8v8nIxw5Wpg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5429.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7696005)(38070700005)(8676002)(26005)(8936002)(110136005)(33656002)(86362001)(6506007)(82960400001)(186003)(38100700002)(64756008)(66556008)(66476007)(2906002)(9686003)(71200400001)(316002)(55016003)(66946007)(122000001)(66446008)(508600001)(5660300002)(76116006)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V09aWUhDVTRZa05xT1hSV2xCazhDa2p0RXRKcGVBd2JDVHBIa3hTRjV2WEdF?=
 =?utf-8?B?M2lXdUpSRkdLMFQ0VU84YzdmWHkvUW5lZXRtc1pobVQxNlk0eXlmUkU0MHda?=
 =?utf-8?B?bXFOV25mRG54VHFEL3lTN2krWXM2NHI4bEhXSDBuT1BzVjZaWWhpVTZTcmRR?=
 =?utf-8?B?YWM1aDhYUGFlS0YvQ3haOHo0bnlIbXoxRFo3TWh2RFU0NStRalptcmxqNmM3?=
 =?utf-8?B?aGFBTXBObjN3UThqUzBuOTdtZ3RRV0ljUlNVNFExY0cvRE5GNzZCWkFQZUhm?=
 =?utf-8?B?Vm8ydHIvNTFFSEY3QlAwanRTTklDRWFTeTFiQVEyaElwWjRIZHRlRWRab01E?=
 =?utf-8?B?aWtEZUY0dS9TeTlMM3pkVkh6OHFmcWN0eW0wdXRyU05zbWYwdCsvaHJwYngy?=
 =?utf-8?B?OWhYOVBlelVjb1VZbTJzWTZHVFdiWnpJL29Tc2hNbDMxS2pPNmd0dnV3Zjdi?=
 =?utf-8?B?RzdwZzZXNWsrc3p1MEJUSlZFZXQyY1VRa3dIZTgwcXdRS2dOS1k3Qnl1b25u?=
 =?utf-8?B?ZHR4TVF1Y0dFMXdvaWwrNzB3OERTVGhaOFBsa2tjQWpRV0ozRGZBMGRMSFdw?=
 =?utf-8?B?L0xqZ3lVQ3MwOVhaVXIwWi9Kd1FNM3AzRHRjcUk5TnorT081a0xqMEIxOXRT?=
 =?utf-8?B?NEw1Qk9ZcWhTMWI3ZHd4ZjBkTzBLSUNhdjJpV1Y0TmU2cGdsdE9lWnYzd1hq?=
 =?utf-8?B?bjlIUXZMYzYzcEtZajQwSUxJaUFDMVFEU3IyTWxySUF2M25zbCtaNUJaNXVT?=
 =?utf-8?B?S3NUVE41L3ArdFc2SFZ6UHVTY1pheE5LT3VCbTJIcmF0RXNERTVWSkRmZEdm?=
 =?utf-8?B?QnhRL0J1cStSNnJVTHR5UlREajRadlY5MGxhMVRhV243dWxhYnk0aWIxRE9Y?=
 =?utf-8?B?RTlkTlZOMEdXOVRvNzZucDR0blVnZjNDNGdRcTN4ZjVraGR3OU43NzBQTVE3?=
 =?utf-8?B?ZzNSWWhMcUlITlNGTE82N1UvZGtuSWxicllKcnJsbXNsZG51NzNTaExqL1B3?=
 =?utf-8?B?czdxWFJVTmlsQmE4YWJxZ3lSeHhjZGdsdFRJVThCVjdMS1Z5bFlhVVhKZFhx?=
 =?utf-8?B?RGNjRisyb3lGdHJUdGtSM2Vaa2J5L0NpTXhvRm5HZi83MHR4K2U3VVd2MmVk?=
 =?utf-8?B?VkVicmUweEhrVDNLelFzZ0F1a2NjMTF0MXVtVEVmdmp6elBBdUZQU1IvTUpu?=
 =?utf-8?B?WXQ2V2hnSjlCVW1PZHlaU3FsM0lSelZ0S0gwaUMwV1kxYnBLb2kyaW1BNnlz?=
 =?utf-8?B?WDd3ZXJRRVZMaGk4REwzNk42WEt0VnpoNTN1MklRdmdObGpMRk0zbFNBNDZi?=
 =?utf-8?B?VGg1SHMwQkZDYUxJWDFQTVpoQSs5cHhVMHo4Q2RqSkNzNEt4YmxMbW5NL291?=
 =?utf-8?B?VXJoQkJJbkpNeDhZU2pyZU54TnlzWm80QmdVMy9Mc0M1UjFpenhzWXYxRXJm?=
 =?utf-8?B?b0hTbUNwL2NFakFTK3VrQk0rdUsrcGVKZmM0MlpTc3JEcURhWHN1TTNaQlhI?=
 =?utf-8?B?ZUhqelByRjhRcWk2SWc0K0dyNXFXL2RUb2dQSjd1THZxUGRCOW4rT1pjNEh6?=
 =?utf-8?B?Ykx0T2tsU2NxOUhCU0JlNVpSUXRNREp5bHBwaVBRQkc1ckNiQmlvSTVpNnVQ?=
 =?utf-8?B?RmVIR2VVUlpPQXhaYkVPZ3BmVm5IbnR4SlhGNEdiZzdHY1RQYjFFeU1GMldS?=
 =?utf-8?B?b1lSTmpqVlVYTW9YcUYwbDJWc2IzY1phK2t1dGFhVHZ6TlhNZjNKR1FaWHdI?=
 =?utf-8?B?dXhnUTM2aVBrK0hRSDY0QUc2T09MRWVad1dBem5pMnZiZGhIeVBtZmJZM3Ns?=
 =?utf-8?B?MjF4eXhUdjNUZWRnTS9oTUdZakQwSWxDbXV0MWFhNGZNd0EyMEQzQzdoc0FO?=
 =?utf-8?B?S3NDWllFZjUrY2Z4MDhZbi9GcERqRFdBNE85ZVVkTWptVytIU1VDNU92OUh4?=
 =?utf-8?B?NHd5U1EvSmhkVUppTXZ1YzcwekZHNERFL3pQd2NTb2Q1V3dYa1BTWkxkWTBa?=
 =?utf-8?B?NzQ2dk5hOGd5aklmZWF1ZllKZ25wMFJnTVJUVkUyMlNnUE1NcUR5U3lWa1BI?=
 =?utf-8?B?VStiRUx0RFRscDdJY3BiTjNVdkZjdGRhZDBsSUViVTRTOTJ0Rnh0Q0p4ZUhC?=
 =?utf-8?B?SXhKTDF2SXVlb0ZCS2UyTVdwbXRUYWVLdnVpOTZZVEcvZWdjeTVXcTJIcWxy?=
 =?utf-8?Q?KsfHDOGsgL05rpp7VhAJb1g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5429.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e535c6-36ec-4746-bea7-08d9aee8e91b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 01:22:41.4637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: om50SAgWzy4ycuXiMzelmNnijFVjHLesxEf4qhYm2neX8euxsJIiuiqtLSvOt/FpK3VFid6DfaooDpSP7EDjMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4400
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE5vdmVtYmVyIDIzLCAyMDIxIDk6NDAgUE0NCj4gDQo+IEJpdCAwIG9mIHRoZSBjYXBhYmlsaXR5
IHJlZ2lzdGVyIGZpZWxkIGhhcyBiZWNvbWUgcmVzZXJ2ZWQgYXQgb3IgYmVmb3JlDQoNCkJpdCAw
IG9mICdTQUdBVycgaW4gdGhlIGNhcGFiaWxpdHkgcmVnaXN0ZXIgLi4uDQoNCj4gc3BlYyB2ZXJz
aW9uIDIuMi4gVHJlYXQgaXQgYXMgc3VjaC4gUmVwbGFjZSB0aGUgZWZmZWN0aXZlIG9wZW4tY29k
aW5nIG9mDQo+IGZpbmRfZmlyc3Rfc2V0X2JpdCgpLiBBZGp1c3QgbG9jYWwgdmFyaWFibGUgdHlw
ZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IC0tLQ0KPiBTdHJpY3RseSBzcGVha2luZyBJT01NVXMgc3VwcG9ydGluZyBvbmx5IDMtbGV2
ZWwgdGFibGVzIG91Z2h0IHRvIHJlc3VsdA0KPiBpbiBndWVzdHMgc2VlaW5nIGEgc3VpdGFibHkg
cmVkdWNlZCBwaHlzaWNhbCBhZGRyZXNzIHdpZHRoIGluIENQVUlELg0KPiBBbmQgdGhlbiB0aGUg
c2FtZSB3b3VsZCBhcHBseSB0byByZXN0cmljdGlvbnMgcmVzdWx0aW5nIGZyb20gTUdBVy4NCg0K
WWVzLiBJIHJlbWVtYmVyIHRoZXJlIHdhcyBzb21lIG9sZCBkaXNjdXNzaW9uIGluIFFlbXUgY29t
bXVuaXR5DQpmb3Igd2hldGhlciBndWVzdCBwaHlzaWNhbCBhZGRyIHdpZHRoIHNob3VsZCBiZSBi
YXNlZCBvbiBJT01NVQ0KY29uc3RyYWludHMgd2hlbiBwYXNzdGhyb3VnaCBkZXZpY2UgaXMgdXNl
ZC4gQnV0IGl0IGRpZG4ndCBnbyBhbnl3aGVyZQ0KKGFuZCBJIGNhbm5vdCBmaW5kIHRoZSBsaW5r
Li4uKQ0KDQphbnl3YXkgd2l0aCBhYm92ZSBjb21tZW50IGZpeGVkOg0KDQoJUmV2aWV3ZWQtYnk6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IA0KPiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvaW9tbXUuYw0KPiBAQCAtMzU2LDcgKzM1Niw3IEBAIHN0YXRpYyB1aW50NjRfdCBk
b21haW5fcGdkX21hZGRyKHN0cnVjdA0KPiAgICAgICAgICBwZ2RfbWFkZHIgPSBoZC0+YXJjaC52
dGQucGdkX21hZGRyOw0KPiAgICAgIH0NCj4gDQo+IC0gICAgLyogU2tpcCB0b3AgbGV2ZWxzIG9m
IHBhZ2UgdGFibGVzIGZvciAyLSBhbmQgMy1sZXZlbCBEUkhEcy4gKi8NCj4gKyAgICAvKiBTa2lw
IHRvcCBsZXZlbChzKSBvZiBwYWdlIHRhYmxlcyBmb3IgbGVzcy10aGFuLW1heGltdW0gbGV2ZWwg
RFJIRHMuICovDQo+ICAgICAgZm9yICggYWdhdyA9IGxldmVsX3RvX2FnYXcoNCk7DQo+ICAgICAg
ICAgICAgYWdhdyAhPSBsZXZlbF90b19hZ2F3KG5yX3B0X2xldmVscyk7DQo+ICAgICAgICAgICAg
YWdhdy0tICkNCj4gQEAgLTExODMsOCArMTE4Myw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGlvbW11
X3NldF9pbnRlcnJ1cHQoc3QNCj4gIGludCBfX2luaXQgaW9tbXVfYWxsb2Moc3RydWN0IGFjcGlf
ZHJoZF91bml0ICpkcmhkKQ0KPiAgew0KPiAgICAgIHN0cnVjdCB2dGRfaW9tbXUgKmlvbW11Ow0K
PiAtICAgIHVuc2lnbmVkIGxvbmcgc2FnYXcsIG5yX2RvbTsNCj4gLSAgICBpbnQgYWdhdzsNCj4g
KyAgICB1bnNpZ25lZCBpbnQgc2FnYXcsIGFnYXcgPSAwLCBucl9kb207DQo+IA0KPiAgICAgIGlv
bW11ID0geHphbGxvYyhzdHJ1Y3QgdnRkX2lvbW11KTsNCj4gICAgICBpZiAoIGlvbW11ID09IE5V
TEwgKQ0KPiBAQCAtMTIzNywxNCArMTIzNiwxMyBAQCBpbnQgX19pbml0IGlvbW11X2FsbG9jKHN0
cnVjdCBhY3BpX2RyaGRfDQo+ICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiAgICAgIH0NCj4g
DQo+IC0gICAgLyogQ2FsY3VsYXRlIG51bWJlciBvZiBwYWdldGFibGUgbGV2ZWxzOiBiZXR3ZWVu
IDIgYW5kIDQuICovDQo+ICsgICAgLyogQ2FsY3VsYXRlIG51bWJlciBvZiBwYWdldGFibGUgbGV2
ZWxzOiAzIG9yIDQuICovDQo+ICAgICAgc2FnYXcgPSBjYXBfc2FnYXcoaW9tbXUtPmNhcCk7DQo+
IC0gICAgZm9yICggYWdhdyA9IGxldmVsX3RvX2FnYXcoNCk7IGFnYXcgPj0gMDsgYWdhdy0tICkN
Cj4gLSAgICAgICAgaWYgKCB0ZXN0X2JpdChhZ2F3LCAmc2FnYXcpICkNCj4gLSAgICAgICAgICAg
IGJyZWFrOw0KPiAtICAgIGlmICggYWdhdyA8IDAgKQ0KPiArICAgIGlmICggc2FnYXcgJiA2ICkN
Cj4gKyAgICAgICAgYWdhdyA9IGZpbmRfZmlyc3Rfc2V0X2JpdChzYWdhdyAmIDYpOw0KPiArICAg
IGlmICggIWFnYXcgKQ0KPiAgICAgIHsNCj4gLSAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgVlRE
UFJFRklYICJJT01NVTogdW5zdXBwb3J0ZWQgc2FnYXcgJWx4XG4iLA0KPiBzYWdhdyk7DQo+ICsg
ICAgICAgIHByaW50ayhYRU5MT0dfRVJSIFZURFBSRUZJWCAiSU9NTVU6IHVuc3VwcG9ydGVkIHNh
Z2F3ICV4XG4iLA0KPiBzYWdhdyk7DQo+ICAgICAgICAgIHByaW50X2lvbW11X3JlZ3MoZHJoZCk7
DQo+ICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiAgICAgIH0NCg0K

