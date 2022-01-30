Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1136D4A3383
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jan 2022 04:26:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262383.454595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE0r2-0000ep-Nq; Sun, 30 Jan 2022 03:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262383.454595; Sun, 30 Jan 2022 03:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE0r2-0000cy-KT; Sun, 30 Jan 2022 03:26:16 +0000
Received: by outflank-mailman (input) for mailman id 262383;
 Sun, 30 Jan 2022 03:26:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lkCg=SO=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nE0r0-0000cs-Fx
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 03:26:15 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ecf64fe-817c-11ec-8eb8-a37418f5ba1a;
 Sun, 30 Jan 2022 04:26:12 +0100 (CET)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 19:26:10 -0800
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 29 Jan 2022 19:26:10 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 29 Jan 2022 19:26:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sat, 29 Jan 2022 19:26:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sat, 29 Jan 2022 19:26:09 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY4PR11MB1352.namprd11.prod.outlook.com (2603:10b6:903:2a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Sun, 30 Jan
 2022 03:26:06 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d%3]) with mapi id 15.20.4930.020; Sun, 30 Jan 2022
 03:26:06 +0000
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
X-Inumbo-ID: 5ecf64fe-817c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643513172; x=1675049172;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oURUj829lBhWdasQsFFSfrn74LdqoiMyu62hH9s0v/g=;
  b=eVMUJftyEBGQFNTzv92wtNubqFxCbJ783riZ05KbrkBtHmNzsf3F1dMj
   Ug9btfui1Gv+1x69C8LiBIeormcl5B8yyGzGnLuc8LTBOPUVPRbICiBuK
   FwJUMfbIgqHlqP1cU2ruOXHiPzm/EVKT/RFY8cfwAVQJ0CpLxY2m+Pua1
   51M6VU0SjPY3FSEmlcSoLEmZc085u3kJUoG0Uvgx4rMPqRex6mKAvFGMQ
   OV8OP/w453yTaIN+1ehdq74Ndu5zh0u8iZWpUmgNMQmUgS2LTatPX6pmW
   fZlz7z6swQCybG5BGwCS7feYNw/disgARYFOxXFPSyO2PWnIX+gxdVzOy
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="247264161"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="247264161"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="478678031"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IitAslQwV/rEO6CDLWcmRLACVPbQ77Kx6xo00VDtK7WsbjoLfvs/9twJAxdCBlVImfNHDaHeqmVHBx2TE3cU0c0tjNosbOdfecuFDZSf7VCUisI3NUU9868jQ7BZ2q2k7Ho5uxSOH3IhYYCyIwPkLle3ejyt6slS2CI7eC//u3KN/U0Tz8bQXhOQwqedzu3cgkfQbTjsgec0IC7KjfBWc6xwSaczSyTqmLcLdOxHIzGdAUZ95nPqvWyHb66EDdnTmosmYl04IYRFnGcHNlUscBKaGu6bkDcyRPAHc9q4EQ9TozZKxHZzwJArlszzY8yFVl/pWJlEpyWgJRrmVNiPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oURUj829lBhWdasQsFFSfrn74LdqoiMyu62hH9s0v/g=;
 b=CwbjiPPrMyqmOKF/yVgTAByvmY4exqbD/dQmd/AUcj4DkxIYI4JqH+EkpFvy5kqr7nwlMxoqOblHk/varJ8H0EINU3iVLbsOT8bF9Rgv2lEYrhIv+Pm+QkV42kL1drE/0eGGnblDmuqybjJEko/yiWRk5Z0s7t5WLlrDtWKAs2FmZDYyQ18phAhPNaBaP8CKpTco+MdWPRH7gZlxQQksCTPPg7U2lV5WmPtIcyroEG+NXd2KPVblEw1HD9nuxwkXPoLR50VdsoXmEHjKDmShYJ92maNAZNOeOQrV9/enreEsxnC8DjOJZR1f62VnE0CQ0dGTcshLCgAqtZ08kxwrlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v3 15/23] VT-d: allow use of superpage mappings
Thread-Topic: [PATCH v3 15/23] VT-d: allow use of superpage mappings
Thread-Index: AQHYBj+ziUl9RxtVWUy2yi/LMEac/qx7BZDQ
Date: Sun, 30 Jan 2022 03:26:06 +0000
Message-ID: <BN9PR11MB5276705B0B47F078D25F891D8C249@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <19531402-6392-c730-08a0-20e2a4ba71f4@suse.com>
In-Reply-To: <19531402-6392-c730-08a0-20e2a4ba71f4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e079f43-f763-4a1d-eef6-08d9e3a0405b
x-ms-traffictypediagnostic: CY4PR11MB1352:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB13527CD2A5D87FB473FA7AA48C249@CY4PR11MB1352.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lOeI9+AJyWOhMACJAONckJ8pYGoJSGlwHsSh4cvUSwOCtnJnDbbrBrLZOkATDEWPTI1oFyqSux2LgcEApZdNM4mfQFF6eYb4wKRCFHo+muS9Vg9aE5/u2fZGgyVQ6tOjWDY0SmFjL0e2vx4S2HvhAT+VUJV8siXBchE04+fAbAcB+lk5/rZfVCC+30Kn68R5C+5/wtfetQKjTKq9KLXtiI/uu9uwHc17mfP20qyJgmWyw05M0PtJvhUzkw1h3D8IeYTl4xb6pKNHxoHV8P6/JKx8SZS5nwL8Pqgpe8B5t3ty7VP19w5ueXtRPB78+oYRk8qe6vE+bnYGzzNPIWwJTn+eIpKcdsF+UTDmtWnuRChqI+f2PU73ZMdZCDXzOojiTacUXLHxpi+mXgpq6uafSz69yrg8QCIead0Xx8degwjKJQw58K3dvxkb3nKm/KoIc3KQ1EBbply1j93k2Xkw/rRKGHAD9maUExY8nxMDoPUW0mthEXKD3zRQ0iP3prlm1JxQxo70o7p5Iaxg5x8T5OXaY0S8LlQ4A6s8UbmWscwf+Jhq3x+ix5rbz6yRDhpIZZsVvisp2Ib4iI5YfyFhVpANTy/ARQ2BBTcE0rxg3SNx8mE22g2gDlba0gVDTLm+ZOkOQYddjHVMghm0cWJaMnxC/ymL+2m7KnV/6q8K0ZvG72e2JsZNzB7/PEiphtCOXZ8jEu93x8H6vct7Pmd+MA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(33656002)(508600001)(186003)(38070700005)(55016003)(122000001)(52536014)(5660300002)(82960400001)(9686003)(86362001)(7696005)(66476007)(66946007)(76116006)(2906002)(66556008)(64756008)(4326008)(8676002)(38100700002)(54906003)(8936002)(66446008)(83380400001)(110136005)(316002)(71200400001)(6506007)(20210929001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHphODE4b0xjSW9MUlM5ZkJQQmMzQUgwck5sVDhJUWhiNTlEdklIUXd2OUdp?=
 =?utf-8?B?S3M5bEtod0lJaTFtbHpBOTYyK3Jpa2QxekhsNmdwS0hiVG56aDV2VlFlRG9X?=
 =?utf-8?B?aXVCUHhxSTFHK3pJRzdKR3JKOWtOeDdEQVdLQzQzS0QvbXZaR2VTaXZ0RSty?=
 =?utf-8?B?VlJ1WXBiTUFmOVhHdHd2aDBmb2VZNVNRa2FXY1NlSzg5MnRBUjhnSkRWU0ZY?=
 =?utf-8?B?eUpiYmNRcjY2YkJibFo0RDFDVkY0b3h2K0pldXJkYTJpR0tmcTZGY3pUY1pU?=
 =?utf-8?B?Uk1MNmRCZjI3TTh3cWV5R3NyOXdZZUEvb0p5VnVzWFBQN3U2a1YzWEQ3eFY5?=
 =?utf-8?B?NnljZHpGWlcyQzRJbEl4dFRyT2VWaHhMMGw4SnB4amR5ZjhLUS9sUGRhL284?=
 =?utf-8?B?VUNmRjgxTDl3WTE4ck43ekZDQnVQQ3lBY2ZuWWptZ0w5Y25QYlFDbjhMd0tn?=
 =?utf-8?B?cWlEWFB1SjBFdTZVU01YNk9PUEpjdzE5SURkbHJ0ZHZhL0xCVXpCMlJXS0Nk?=
 =?utf-8?B?blAwTDZCSUUzMVlqR2JDVGdIbGVTRVdVS2o1ZEZpdUgzNk1JVnUyUDA5U0t3?=
 =?utf-8?B?Y1A2S1Q4WDQ1Y0hoRTFWRnZOdGhwakwvcldXcWpMZDlBaXo0YTF5VG1mZUJn?=
 =?utf-8?B?Ykw0REhIUlFEak82N1NORmRoOVJNZDUyUzk5a3c2YmlYQ3J6Q1RNdVJlVndr?=
 =?utf-8?B?ZENFdWE2N2x0VjVqeFhrWTI1c3pmOU9vRnBGZ1lNYmEvak42NE84RzE4SGFK?=
 =?utf-8?B?OXFRYi9LSHh2c3Zxblh4WFdRWmU0S0hwVDY4WFgySlVzZVVtMktDczZUYXhD?=
 =?utf-8?B?UFhDK2NJVVBSTjdyZFNZaWhLQWlYRzBFTndMUk5NSzZ4OTZVempxcjgyWFRM?=
 =?utf-8?B?UWZzQzVxVEluTFViKy9ZTk8wWWR0RXRZWjA3WDNFTisrbnlWSEUwN0dlNER1?=
 =?utf-8?B?Qi8vU0dIaFgrQW16cFk2ZFJGVkNWUjVBdmxLRVE0TlFUU2xmZ0xYQ245N1RR?=
 =?utf-8?B?c21zSTF5bnNsa3lrbHVpclYxTEVYNFJLcU5PUzVCN3plUDhqWkFIV2U4dVhq?=
 =?utf-8?B?TzdicnRwSjlUTDFmU2lOdkxUeHB3ZElucm1kNndaUTRhS3NYeDdLOUVWa3Uz?=
 =?utf-8?B?anFldnlTZ2tnNWVLdzNURFgvUTFjclBZbTZzNFNvS1lzQVdEMXplVjVmcE9S?=
 =?utf-8?B?OGRmQm9GOGcvaUVXbGdvQ2srYmNGK0pNR1l4L0IvcWtlcDUxdWxmWFNGamVp?=
 =?utf-8?B?Vko3Vk1tS2tGb0pIWUp4T1E4Zmw0M09CSTVFdHNjbVgxYzlJak1TK0xzZUMr?=
 =?utf-8?B?ZXhQTWhaakxjTUlPUEFpRFU1dlhYR1IwKzBOWi9RZUFzMU55Ny92RDFHQTBU?=
 =?utf-8?B?K2FsL1ZDVHlMZHE2N2U5QlM3OEw5WVdaUjgyMWFXT2p2LzdLMEtaWFpnNzA5?=
 =?utf-8?B?RHA4RFRKYmNUeTUzV1pVdnZQekVsUDVscVBzZmhrN2IvbitiSlgxdVplRzVy?=
 =?utf-8?B?Ti9wL0xQR0VJSVh3L3V0eGVYTzdQVE50RTdhcDZNRlpFcHREUVVheitOdm1x?=
 =?utf-8?B?NkJnL2U3OWlkeDZmLzFTQngydlFkUDZWMkRNdTV6U3RHT25lTjY3VHlCTmtQ?=
 =?utf-8?B?UDZuaEloOCtmbE5uRGtjSnV0V3VhUnpiRk1GRUJCa0xDbU5ZUXRRaEhWdS92?=
 =?utf-8?B?MGlFQzlKSkRDWnUrT3ZaUUI4UGJYdnlNbFJ1SnEvQlNBNGJKQjVselVQQkJL?=
 =?utf-8?B?cDV0RDBCcnFic0M1NWJTUWplckNxVWJVdnNsSmVsUXhwdGkxbk8yYUdVbUc2?=
 =?utf-8?B?TkQ4dnVGVnVpQjZtZ28rcjVLV1hyY25oVTI2bVF0NHo3QWR0bkIzZ3BHUWY3?=
 =?utf-8?B?N2JvejVjZHNKbC84VEgzaVJaNG0zbHMzRlBqdTA0YTRXMTRTcDhveVpTbnIy?=
 =?utf-8?B?czBrT0gyZHpadFIrWm1wcmN5ZjdHTC9yekRwdUk2cUNLQWRLd1ZVNW9KNHMv?=
 =?utf-8?B?MHhPc3U0cWZ6KzBUOHJyK29SL2xjTXNtbDJLc3Q1elJDUXArMDNvNUlPYlY3?=
 =?utf-8?B?Q2NwMDlweTFZUi82amhjK3lvTmlMRmUvczU4RW13QWpWb2dOV01wWis2RGRI?=
 =?utf-8?B?MnRhdmJnMUpKd2tKa0VBQnk0QTlncGNPVGFrNEFtQ0MyZ1ZVUEg1VDBvTWo3?=
 =?utf-8?Q?si6EhUsZiCK/T7vly3J5qT4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e079f43-f763-4a1d-eef6-08d9e3a0405b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2022 03:26:06.3206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKX7jHirOPNihwSxdzS2Hx1CaGXzxzULAQ91we7+cap50XBO3RItHydWfzVQXRateBOKMC2vF6PV+aNrdfg4Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1352
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaA0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDExLCAyMDIyIDEy
OjMyIEFNDQo+IA0KPiAuLi4gZGVwZW5kaW5nIG9uIGZlYXR1cmUgYXZhaWxhYmlsaXR5IChhbmQg
YWJzZW5jZSBvZiBxdWlya3MpLg0KPiANCj4gQWxzbyBtYWtlIHRoZSBwYWdlIHRhYmxlIGR1bXBp
bmcgZnVuY3Rpb24gYXdhcmUgb2Ygc3VwZXJwYWdlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiB2MzogUmVuYW1lIHF1ZXVlX2ZyZWVf
cHQoKSdzIGxhc3QgcGFyYW1ldGVyLiBSZXBsYWNlICJsZXZlbCA+IDEiIGNoZWNrcw0KPiAgICAg
d2hlcmUgcG9zc2libGUuIFRpZ2h0ZW4gYXNzZXJ0aW9uLg0KPiANCj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2lvbW11LmMNCj4gQEAgLTgyNiwxOCArODI2LDM3IEBAIHN0YXRpYyBpbnQgX19tdXN0
X2NoZWNrIGlvbW11X2ZsdXNoX2lvdGwNCj4gICAgICByZXR1cm4gaW9tbXVfZmx1c2hfaW90bGIo
ZCwgSU5WQUxJRF9ERk4sIDAsIDApOw0KPiAgfQ0KPiANCj4gK3N0YXRpYyB2b2lkIHF1ZXVlX2Zy
ZWVfcHQoc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgbGV2ZWwpDQo+
ICt7DQo+ICsgICAgaWYgKCBsZXZlbCA+IDEgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgc3RydWN0
IGRtYV9wdGUgKnB0ID0gbWFwX2RvbWFpbl9wYWdlKG1mbik7DQo+ICsgICAgICAgIHVuc2lnbmVk
IGludCBpOw0KPiArDQo+ICsgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgUFRFX05VTTsgKytpICkN
Cj4gKyAgICAgICAgICAgIGlmICggZG1hX3B0ZV9wcmVzZW50KHB0W2ldKSAmJiAhZG1hX3B0ZV9z
dXBlcnBhZ2UocHRbaV0pICkNCj4gKyAgICAgICAgICAgICAgICBxdWV1ZV9mcmVlX3B0KGQsIG1h
ZGRyX3RvX21mbihkbWFfcHRlX2FkZHIocHRbaV0pKSwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGxldmVsIC0gMSk7DQo+ICsNCj4gKyAgICAgICAgdW5tYXBfZG9tYWluX3BhZ2Uo
cHQpOw0KPiArICAgIH0NCj4gKw0KPiArICAgIGlvbW11X3F1ZXVlX2ZyZWVfcGd0YWJsZShkLCBt
Zm5fdG9fcGFnZShtZm4pKTsNCj4gK30NCj4gKw0KPiAgLyogY2xlYXIgb25lIHBhZ2UncyBwYWdl
IHRhYmxlICovDQo+ICBzdGF0aWMgaW50IGRtYV9wdGVfY2xlYXJfb25lKHN0cnVjdCBkb21haW4g
KmRvbWFpbiwgZGFkZHJfdCBhZGRyLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgb3JkZXIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCAqZmx1c2hfZmxhZ3MpDQo+ICB7DQo+ICAgICAgc3RydWN0IGRvbWFpbl9pb21tdSAq
aGQgPSBkb21faW9tbXUoZG9tYWluKTsNCj4gLSAgICBzdHJ1Y3QgZG1hX3B0ZSAqcGFnZSA9IE5V
TEwsICpwdGUgPSBOVUxMOw0KPiArICAgIHN0cnVjdCBkbWFfcHRlICpwYWdlID0gTlVMTCwgKnB0
ZSA9IE5VTEwsIG9sZDsNCj4gICAgICB1NjQgcGdfbWFkZHI7DQo+ICsgICAgdW5zaWduZWQgaW50
IGxldmVsID0gKG9yZGVyIC8gTEVWRUxfU1RSSURFKSArIDE7DQo+IA0KPiAgICAgIHNwaW5fbG9j
aygmaGQtPmFyY2gubWFwcGluZ19sb2NrKTsNCj4gLSAgICAvKiBnZXQgbGFzdCBsZXZlbCBwdGUg
Ki8NCj4gLSAgICBwZ19tYWRkciA9IGFkZHJfdG9fZG1hX3BhZ2VfbWFkZHIoZG9tYWluLCBhZGRy
LCAxLCBmbHVzaF9mbGFncywNCj4gZmFsc2UpOw0KPiArICAgIC8qIGdldCB0YXJnZXQgbGV2ZWwg
cHRlICovDQo+ICsgICAgcGdfbWFkZHIgPSBhZGRyX3RvX2RtYV9wYWdlX21hZGRyKGRvbWFpbiwg
YWRkciwgbGV2ZWwsIGZsdXNoX2ZsYWdzLA0KPiBmYWxzZSk7DQo+ICAgICAgaWYgKCBwZ19tYWRk
ciA8IFBBR0VfU0laRSApDQo+ICAgICAgew0KPiAgICAgICAgICBzcGluX3VubG9jaygmaGQtPmFy
Y2gubWFwcGluZ19sb2NrKTsNCj4gQEAgLTg0NSw3ICs4NjQsNyBAQCBzdGF0aWMgaW50IGRtYV9w
dGVfY2xlYXJfb25lKHN0cnVjdCBkb21hDQo+ICAgICAgfQ0KPiANCj4gICAgICBwYWdlID0gKHN0
cnVjdCBkbWFfcHRlICopbWFwX3Z0ZF9kb21haW5fcGFnZShwZ19tYWRkcik7DQo+IC0gICAgcHRl
ID0gcGFnZSArIGFkZHJlc3NfbGV2ZWxfb2Zmc2V0KGFkZHIsIDEpOw0KPiArICAgIHB0ZSA9ICZw
YWdlW2FkZHJlc3NfbGV2ZWxfb2Zmc2V0KGFkZHIsIGxldmVsKV07DQo+IA0KPiAgICAgIGlmICgg
IWRtYV9wdGVfcHJlc2VudCgqcHRlKSApDQo+ICAgICAgew0KPiBAQCAtODU0LDE0ICs4NzMsMjAg
QEAgc3RhdGljIGludCBkbWFfcHRlX2NsZWFyX29uZShzdHJ1Y3QgZG9tYQ0KPiAgICAgICAgICBy
ZXR1cm4gMDsNCj4gICAgICB9DQo+IA0KPiArICAgIG9sZCA9ICpwdGU7DQo+ICAgICAgZG1hX2Ns
ZWFyX3B0ZSgqcHRlKTsNCj4gLSAgICAqZmx1c2hfZmxhZ3MgfD0gSU9NTVVfRkxVU0hGX21vZGlm
aWVkOw0KPiANCj4gICAgICBzcGluX3VubG9jaygmaGQtPmFyY2gubWFwcGluZ19sb2NrKTsNCj4g
ICAgICBpb21tdV9zeW5jX2NhY2hlKHB0ZSwgc2l6ZW9mKHN0cnVjdCBkbWFfcHRlKSk7DQo+IA0K
PiAgICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShwYWdlKTsNCj4gDQo+ICsgICAgKmZsdXNoX2Zs
YWdzIHw9IElPTU1VX0ZMVVNIRl9tb2RpZmllZDsNCj4gKw0KPiArICAgIGlmICggb3JkZXIgJiYg
IWRtYV9wdGVfc3VwZXJwYWdlKG9sZCkgKQ0KPiArICAgICAgICBxdWV1ZV9mcmVlX3B0KGRvbWFp
biwgbWFkZHJfdG9fbWZuKGRtYV9wdGVfYWRkcihvbGQpKSwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICBvcmRlciAvIExFVkVMX1NUUklERSk7DQo+ICsNCj4gICAgICByZXR1cm4gMDsNCj4gIH0N
Cj4gDQo+IEBAIC0xOTUyLDYgKzE5NzcsNyBAQCBzdGF0aWMgaW50IF9fbXVzdF9jaGVjayBpbnRl
bF9pb21tdV9tYXBfDQo+ICAgICAgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUo
ZCk7DQo+ICAgICAgc3RydWN0IGRtYV9wdGUgKnBhZ2UsICpwdGUsIG9sZCwgbmV3ID0ge307DQo+
ICAgICAgdTY0IHBnX21hZGRyOw0KPiArICAgIHVuc2lnbmVkIGludCBsZXZlbCA9IChJT01NVUZf
b3JkZXIoZmxhZ3MpIC8gTEVWRUxfU1RSSURFKSArIDE7DQo+ICAgICAgaW50IHJjID0gMDsNCj4g
DQo+ICAgICAgLyogRG8gbm90aGluZyBpZiBWVC1kIHNoYXJlcyBFUFQgcGFnZSB0YWJsZSAqLw0K
PiBAQCAtMTk3Niw3ICsyMDAyLDcgQEAgc3RhdGljIGludCBfX211c3RfY2hlY2sgaW50ZWxfaW9t
bXVfbWFwXw0KPiAgICAgICAgICByZXR1cm4gMDsNCj4gICAgICB9DQo+IA0KPiAtICAgIHBnX21h
ZGRyID0gYWRkcl90b19kbWFfcGFnZV9tYWRkcihkLCBkZm5fdG9fZGFkZHIoZGZuKSwgMSwNCj4g
Zmx1c2hfZmxhZ3MsDQo+ICsgICAgcGdfbWFkZHIgPSBhZGRyX3RvX2RtYV9wYWdlX21hZGRyKGQs
IGRmbl90b19kYWRkcihkZm4pLCBsZXZlbCwNCj4gZmx1c2hfZmxhZ3MsDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUpOw0KPiAgICAgIGlmICggcGdfbWFkZHIg
PCBQQUdFX1NJWkUgKQ0KPiAgICAgIHsNCj4gQEAgLTE5ODUsMTMgKzIwMTEsMTUgQEAgc3RhdGlj
IGludCBfX211c3RfY2hlY2sgaW50ZWxfaW9tbXVfbWFwXw0KPiAgICAgIH0NCj4gDQo+ICAgICAg
cGFnZSA9IChzdHJ1Y3QgZG1hX3B0ZSAqKW1hcF92dGRfZG9tYWluX3BhZ2UocGdfbWFkZHIpOw0K
PiAtICAgIHB0ZSA9ICZwYWdlW2Rmbl94KGRmbikgJiBMRVZFTF9NQVNLXTsNCj4gKyAgICBwdGUg
PSAmcGFnZVthZGRyZXNzX2xldmVsX29mZnNldChkZm5fdG9fZGFkZHIoZGZuKSwgbGV2ZWwpXTsN
Cj4gICAgICBvbGQgPSAqcHRlOw0KPiANCj4gICAgICBkbWFfc2V0X3B0ZV9hZGRyKG5ldywgbWZu
X3RvX21hZGRyKG1mbikpOw0KPiAgICAgIGRtYV9zZXRfcHRlX3Byb3QobmV3LA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgKChmbGFncyAmIElPTU1VRl9yZWFkYWJsZSkgPyBETUFfUFRFX1JFQUQg
IDogMCkgfA0KPiAgICAgICAgICAgICAgICAgICAgICAgKChmbGFncyAmIElPTU1VRl93cml0YWJs
ZSkgPyBETUFfUFRFX1dSSVRFIDogMCkpOw0KPiArICAgIGlmICggSU9NTVVGX29yZGVyKGZsYWdz
KSApDQo+ICsgICAgICAgIGRtYV9zZXRfcHRlX3N1cGVycGFnZShuZXcpOw0KPiANCj4gICAgICAv
KiBTZXQgdGhlIFNOUCBvbiBsZWFmIHBhZ2UgdGFibGUgaWYgU25vb3AgQ29udHJvbCBhdmFpbGFi
bGUgKi8NCj4gICAgICBpZiAoIGlvbW11X3Nub29wICkNCj4gQEAgLTIwMTIsOCArMjA0MCwxNCBA
QCBzdGF0aWMgaW50IF9fbXVzdF9jaGVjayBpbnRlbF9pb21tdV9tYXBfDQo+IA0KPiAgICAgICpm
bHVzaF9mbGFncyB8PSBJT01NVV9GTFVTSEZfYWRkZWQ7DQo+ICAgICAgaWYgKCBkbWFfcHRlX3By
ZXNlbnQob2xkKSApDQo+ICsgICAgew0KPiAgICAgICAgICAqZmx1c2hfZmxhZ3MgfD0gSU9NTVVf
RkxVU0hGX21vZGlmaWVkOw0KPiANCj4gKyAgICAgICAgaWYgKCBJT01NVUZfb3JkZXIoZmxhZ3Mp
ICYmICFkbWFfcHRlX3N1cGVycGFnZShvbGQpICkNCj4gKyAgICAgICAgICAgIHF1ZXVlX2ZyZWVf
cHQoZCwgbWFkZHJfdG9fbWZuKGRtYV9wdGVfYWRkcihvbGQpKSwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgSU9NTVVGX29yZGVyKGZsYWdzKSAvIExFVkVMX1NUUklERSk7DQo+ICsgICAg
fQ0KPiArDQo+ICAgICAgcmV0dXJuIHJjOw0KPiAgfQ0KPiANCj4gQEAgLTIzNzAsNiArMjQwNCw3
IEBAIHN0YXRpYyBpbnQgX19pbml0IHZ0ZF9zZXR1cCh2b2lkKQ0KPiAgew0KPiAgICAgIHN0cnVj
dCBhY3BpX2RyaGRfdW5pdCAqZHJoZDsNCj4gICAgICBzdHJ1Y3QgdnRkX2lvbW11ICppb21tdTsN
Cj4gKyAgICB1bnNpZ25lZCBpbnQgbGFyZ2Vfc2l6ZXMgPSBQQUdFX1NJWkVfMk0gfCBQQUdFX1NJ
WkVfMUc7DQo+ICAgICAgaW50IHJldDsNCj4gICAgICBib29sIHJlZ19pbnZhbF9zdXBwb3J0ZWQg
PSB0cnVlOw0KPiANCj4gQEAgLTI0MTIsNiArMjQ0NywxMSBAQCBzdGF0aWMgaW50IF9faW5pdCB2
dGRfc2V0dXAodm9pZCkNCj4gICAgICAgICAgICAgICAgIGNhcF9zcHNfMm1iKGlvbW11LT5jYXAp
ID8gIiwgMk1CIiA6ICIiLA0KPiAgICAgICAgICAgICAgICAgY2FwX3Nwc18xZ2IoaW9tbXUtPmNh
cCkgPyAiLCAxR0IiIDogIiIpOw0KPiANCj4gKyAgICAgICAgaWYgKCAhY2FwX3Nwc18ybWIoaW9t
bXUtPmNhcCkgKQ0KPiArICAgICAgICAgICAgbGFyZ2Vfc2l6ZXMgJj0gflBBR0VfU0laRV8yTTsN
Cj4gKyAgICAgICAgaWYgKCAhY2FwX3Nwc18xZ2IoaW9tbXUtPmNhcCkgKQ0KPiArICAgICAgICAg
ICAgbGFyZ2Vfc2l6ZXMgJj0gflBBR0VfU0laRV8xRzsNCj4gKw0KPiAgI2lmbmRlZiBpb21tdV9z
bm9vcA0KPiAgICAgICAgICBpZiAoIGlvbW11X3Nub29wICYmICFlY2FwX3NucF9jdGwoaW9tbXUt
PmVjYXApICkNCj4gICAgICAgICAgICAgIGlvbW11X3Nub29wID0gZmFsc2U7DQo+IEBAIC0yNDgz
LDYgKzI1MjMsOSBAQCBzdGF0aWMgaW50IF9faW5pdCB2dGRfc2V0dXAodm9pZCkNCj4gICAgICBp
ZiAoIHJldCApDQo+ICAgICAgICAgIGdvdG8gZXJyb3I7DQo+IA0KPiArICAgIEFTU0VSVChpb21t
dV9vcHMucGFnZV9zaXplcyA9PSBQQUdFX1NJWkVfNEspOw0KPiArICAgIGlvbW11X29wcy5wYWdl
X3NpemVzIHw9IGxhcmdlX3NpemVzOw0KPiArDQo+ICAgICAgcmVnaXN0ZXJfa2V5aGFuZGxlcign
VicsIHZ0ZF9kdW1wX2lvbW11X2luZm8sICJkdW1wIGlvbW11IGluZm8iLCAxKTsNCj4gDQo+ICAg
ICAgcmV0dXJuIDA7DQo+IEBAIC0yNzk3LDcgKzI4NDAsNyBAQCBzdGF0aWMgdm9pZCB2dGRfZHVt
cF9wYWdlX3RhYmxlX2xldmVsKHBhDQo+ICAgICAgICAgICAgICBjb250aW51ZTsNCj4gDQo+ICAg
ICAgICAgIGFkZHJlc3MgPSBncGEgKyBvZmZzZXRfbGV2ZWxfYWRkcmVzcyhpLCBsZXZlbCk7DQo+
IC0gICAgICAgIGlmICggbmV4dF9sZXZlbCA+PSAxICkNCj4gKyAgICAgICAgaWYgKCBuZXh0X2xl
dmVsICYmICFkbWFfcHRlX3N1cGVycGFnZSgqcHRlKSApDQo+ICAgICAgICAgICAgICB2dGRfZHVt
cF9wYWdlX3RhYmxlX2xldmVsKGRtYV9wdGVfYWRkcigqcHRlKSwgbmV4dF9sZXZlbCwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWRkcmVzcywgaW5kZW50ICsgMSk7
DQo+ICAgICAgICAgIGVsc2UNCj4gDQoNCg==

