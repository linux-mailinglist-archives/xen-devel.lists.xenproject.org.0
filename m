Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F86664C3B3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 07:10:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461724.719875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Kxu-0002bd-Uk; Wed, 14 Dec 2022 06:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461724.719875; Wed, 14 Dec 2022 06:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Kxu-0002YP-Pl; Wed, 14 Dec 2022 06:10:02 +0000
Received: by outflank-mailman (input) for mailman id 461724;
 Wed, 14 Dec 2022 06:10:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uNQb=4M=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1p5Kxt-00024h-1I
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 06:10:01 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efc6d547-7b75-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 07:10:00 +0100 (CET)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 22:09:57 -0800
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 13 Dec 2022 22:09:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 22:09:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 13 Dec 2022 22:09:56 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 13 Dec 2022 22:09:55 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 06:09:49 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c9ee:bc36:6cf4:c6fb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c9ee:bc36:6cf4:c6fb%5]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 06:09:49 +0000
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
X-Inumbo-ID: efc6d547-7b75-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670998200; x=1702534200;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7ATK/o85qBLZQC7Ad+GlCRDiYmPGjPc3RIOFdQo847g=;
  b=do2/85LMc+LHjODxcpaYqASO45f20D1gSI4lGeKHhZzL8uFDMGWrqoFs
   sL8nc2WlnvZbQD6c4t9XZ8/C6K6DxK03UY0asW0gelcxEg3pRfZOzxVNd
   PxgbEoH8EyPacucZdSSlUMBVV4TvBb+gBmKl+VEsw1T5J3LBT9ZrT0DO3
   VUkwOosUptkQJHgVb+donahExnK/SIxjslUGOUnK9evS89jVVIQjahqbX
   kupDTnhUhGol3URleULXAxi58RgrOHPhPgVbhuwTZHG16j4z6ii5ATUDa
   TifKUY56W06CZi2lCQPR0lrLn3QHmsAnsZ5TJUwu5QLziEh5qWu6VWq++
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="305962843"
X-IronPort-AV: E=Sophos;i="5.96,243,1665471600"; 
   d="scan'208";a="305962843"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="650968551"
X-IronPort-AV: E=Sophos;i="5.96,243,1665471600"; 
   d="scan'208";a="650968551"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ix6Ezool1A2ehawECFD04gGUCCFJGHDSlb6+zvZfD/MIEiaR4ItpcvMX8U5VyPM17WljUZQslVRY2Rl642Q+xf0qhuz4pGXPz2Xzl6A7lebsz5GDTFxm6mYfYkk9nwK/IHX+FFLTXzWhmH+RvD42tmUwWDyQrW4l4U+EV779Lo0oYS+SSUuqiIfyBA5kSAVUKhe/9MUfHCPZ2gj3CM6rA/VwJgU7rgNttuH3h3qEcZ73aiY+B+wSnQyHCroLKAXmBSKspzIbXfm6dGkTjJk1Fw451t208IGrbAE49QmftOnbaYTGHG4X0TflB4b/CYGWyDhK6WijDiwlJuvHwwPLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ATK/o85qBLZQC7Ad+GlCRDiYmPGjPc3RIOFdQo847g=;
 b=G8CbkOWAa4NhzdCOPnBjvGSv7I3nW9LatYr/x5IP5OWFrvzm08QqQzFUtHuXGyQd2kWROERVJ3r01MEDnM3sVWBbDr9lUkAU6QmSs8WSf1LnHgPt00S61U0kiYGxcOaP9lxbDnv16ES98xRPOOCzX3HLUbxWVMNRmmFrR5cvCJdqUeHi8UR+agGu517ROEb6/s+HwhBy2qOYLqnapirkQXVFrSmQNjAVMqvwgvO9I5MN2narYZMUV8wKat2Pd2z9Uz1TX9M8Pt7Ti015yN1bDfgIyq3Toeo+qNTUA3HiTURRBNTbSa31vk+NS6LFvykHSYu8mCoxXlYTbZa68aaPDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "Beulich, Jan" <JBeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v4 2/3] x86/vmx: introduce helper to set
 VMX_INTR_SHADOW_NMI
Thread-Topic: [PATCH v4 2/3] x86/vmx: introduce helper to set
 VMX_INTR_SHADOW_NMI
Thread-Index: AQHZDxCBOkIXi/pKL02uY/kEP+OO8q5s5w+Q
Date: Wed, 14 Dec 2022 06:09:49 +0000
Message-ID: <BN9PR11MB52762952316DFC0A3E9814F28CE09@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221213163104.19066-1-roger.pau@citrix.com>
 <20221213163104.19066-3-roger.pau@citrix.com>
In-Reply-To: <20221213163104.19066-3-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ0PR11MB5039:EE_
x-ms-office365-filtering-correlation-id: f3575008-bd98-44f8-2251-08dadd99ce9e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M4uUfTcmKF2TdJB8+FWGBfIuRjG9IRYhXQMtnMKM++qS9ocvcC2BVlEEowogKgqg/vLQRLRFjLra0RSqEBRNodvaQZY78a9oBB3KVov6GlzpgijYMdEcWDYgLm77K+H3IZjgNyr1eUXRiWS17a8RpDeZdId0JSb8Nwsxy9Ozz9rslgUSEHeTotLR6GmeSDftIB3xm+MTvBNMekjuO0Iz5ae8EqlwzTVN4STesuU5xXl12IMeDfIBt6mNPelOS/56Mc5fSn338dRClAtHnS5+kpkP4nlkqg+aXgBFTJDMD6RApFTf+gYIFsTAEjFBbkHATseOCR27vHdrQkmlpywSzCKUyPJphqlnfKaVTGm3fx9qCUhaBWqCksVrHgorMBfSMNhpcmsBUhBU91l70iWF1RrL2TNRXJTVwDqJVvMAn5IHEb5vRGAM8MniDKV2+Ap4YG0D1nW12dJiNAbKrfooQ9DHTuZZaVkrt0TjrDQqMB8UEnTZwLuQ9bMv0AU7XQn/S3unIMEmzrVL818APaibmEdujVTJe7Cw/l6qU8IYdRBIHoY3lWZr1FC8oSMQ7UX4A1ibTZ857n7g6w4YIO+lDLQvpYAwmsfPcKxYFj+9pgCMI8SzjdvaXS3Dftg4eOjjCcEeHJL1E/eRB8zQ6mHTZvNNLO9yFCT/xn0Es2Nsa63rfbRn5qYdCfUd2A1wbTsQTrG+ZYfW4m1TvCv0B0vU4Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199015)(33656002)(66446008)(82960400001)(2906002)(110136005)(66946007)(66556008)(55016003)(64756008)(54906003)(38100700002)(76116006)(316002)(83380400001)(122000001)(86362001)(8676002)(66476007)(6506007)(26005)(38070700005)(478600001)(7696005)(4326008)(66899015)(5660300002)(8936002)(52536014)(4744005)(71200400001)(9686003)(186003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlF4R2tWZ21zMWpudFpKamtxaWE1M2djWXN0UDhQdmVTbE1GMUVqUVdEMnJ3?=
 =?utf-8?B?N2xIUkZnRExBZTNtTzN0UlJ2d21ENUNuUU1iMWRFcmdSK1l4Ny9VTmFUeHUx?=
 =?utf-8?B?dUdPaXpEZjJJZVp1dDNzQnVyVk5FMDNGMDV4QUZSeU1iUUdvRUdXcjVOQUo2?=
 =?utf-8?B?M2orK2ZJVXRsNnhzTzVLdi9NdXpybDVPOU5EM0xZMXlSaThSR3NUZ0pvOHF0?=
 =?utf-8?B?Y2ZpNzhYMjRMMk9HcHNGb0tkNGlKU2QzWlp5Ujk5ejltV3hDU3ZYNFJyM0Y0?=
 =?utf-8?B?amJRNWRBc3R5NFlrRlNZaC83TmJKQTJmT0NYZU1JSzBhWGRTcEc4VHhrVldF?=
 =?utf-8?B?RzBobkNwc0tNRHQ2bUFxOXNYTjVqUHk4Ny8wS3R4OWJDRUpNQUhuT3U1dUlF?=
 =?utf-8?B?RDZWS3p6N2haRU1yRS9PQU1xZ2VXZWNuNk50RWRqL21CcDBzS2dlYWkvZGdT?=
 =?utf-8?B?WElNcmFHSTJEVEdKSnVkOVNoeWYxWno2ZUFJNzR1VmViYXhsUjN4bHcxT0Rp?=
 =?utf-8?B?UEwwT2ZNTlVEa0QxMEcwQ0pRMmtEZktqZy9ZQUJobmVVMFFYaEcrQTNRTjZM?=
 =?utf-8?B?RHFPU0xTaHhrOHBqcHZzT0M1WjFBOEVKcDBnWlp5YmtNOE9BZWswa0FpRU1L?=
 =?utf-8?B?Z2NSMjRCNCthazF5cFhWK3V5L09VSHMrbFk4S1J6cytoZVdFbnkwalVtampT?=
 =?utf-8?B?MWZLc250Qlh2NFZQZWtxUnErbCtrZ1NWeTd4MldVamR4aVJ2TWVNSXZLRFRM?=
 =?utf-8?B?alVkcXJiUGovTit1MVhtWlNBOXhoNS9Lenh0bWFPd0JQNEI3S0NwWndxbkJH?=
 =?utf-8?B?TXo0aGpoWjduTEJvRmYrV0ZWS21tQXVib2xxcyswMVhvWHloRW9KU1F1SVNy?=
 =?utf-8?B?aVl1OXRuTTBiMmdmemJ3UmhtYW9vdDhxVzJNMFVCWEFzVFNtTUwvVW9nOHhI?=
 =?utf-8?B?K1RuTldGYStQcFU3aHczWkxVNHVtWmg3S0xmWi94dGYrLzFZQzhOMlRzSDZD?=
 =?utf-8?B?c0Y2eHJhSk5xOW9VRGhMRi9UVEtoWGoyMXlQZHk0dXdYSTVJVklaQ1VnUVNo?=
 =?utf-8?B?WFQyMTBEQXhsUHM2eW1NcWVlQWtWZWl6eDFVZjloaGFJMUd1Yk5mZ2JMTlpj?=
 =?utf-8?B?elV4VnZmeE5kU2tkUGxwY1BGOVFxdVVvT05sT2VpcHpRbWxXVWJUNXZyZnQ2?=
 =?utf-8?B?ZVJjVEw0SUFIRnVBV083ZWVVRGU3cHRtZG40QVQ2emJlVGxJT0RtbTV4OFZr?=
 =?utf-8?B?b2tQY3p6YlVqN1FtSEdrOGVkMzBmOE9rMjBYWmhaMis1bWFMZ25zMjVPWmVu?=
 =?utf-8?B?ZUhEcHpJb1dwcVg0SUt1cUdPRCt0ZFJjNmxjYmJYVkxwRVVGd2ttbGpDSE5N?=
 =?utf-8?B?M0NDZWJyT1pCbFBVaGdwWTNHZmxZYjc0UVl4RGxCeDA2cjNlbHQ1aE05Zm05?=
 =?utf-8?B?WkxSbWZSaVlURng0SGhkZjJmTzd0eWg0clRZR214YVcxSVlOYW1zMG5DY0xY?=
 =?utf-8?B?UW5BUmlLaFNRcmtPVzIyS0xiSFlhQlBtMXBkYy9aKzgwd1Jaek5vdnYvQVh2?=
 =?utf-8?B?TnhnVmFDalNnenhDL0kvZ0N6bm0vL2R4YnBFUUcwQkphaXlseVFqTWZDRjVz?=
 =?utf-8?B?TmJOL3FaMDZNNFVPdlhZajMzWExzeXZTVUR3WkxIRmY5T2l3T0E5bkpDNDBL?=
 =?utf-8?B?V090eGphN1A1NDMzVXR1QThzVHNoS0hUbXpxbXFCZUs5bUtVQWF5U0NvbDkr?=
 =?utf-8?B?cUZUelNtWkZhdm9BNlg1NG9ab2dEY1JrNUtyUlg5c1pxU3p5bWZkNktURWZy?=
 =?utf-8?B?bDRqSGZScGRBb215K1R6aHI0TWk0OVUvQUM2QmY2TW5TbmRpb3FGTE1hNFlC?=
 =?utf-8?B?cSs2RDBHN0k4NDRDeVVoVGJ5NWlzRUlaZ2srUWJZZ0NCTEdhSWdqM0IybEVX?=
 =?utf-8?B?ZDdJNnpKNFROR1RPamJER3g3SWlhQi9GVUR4TzdramZJTkg3eEQrVlU2ZmhZ?=
 =?utf-8?B?aEducjRCYTN2VEo4WFIvUnNTdGxKYjB3ZSsvMVhMQ01mSW0wN0RkV244OGRr?=
 =?utf-8?B?dElyRFN1Sk5DLzBqOFY2SGJzd1VZQW9LVU1ubTBaOWxiWmYrVjQ1eHdZU2lv?=
 =?utf-8?Q?BXGm1Kvlo3rG+5s0x0BhB5DLI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3575008-bd98-44f8-2251-08dadd99ce9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 06:09:49.1926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7cgQ453pb/h1YZ1LxUsN2ifR1UyaN+p0+s4ObkcuFXOt1wTLgqKjws3mdKCRU70oFUeq6V/gedZawMdj1sn+eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIERlY2VtYmVyIDE0LCAyMDIyIDEyOjMxIEFNDQo+IA0KPiBJbnRyb2R1Y2UgYSBz
bWFsbCBoZWxwZXIgdG8gT1IgVk1YX0lOVFJfU0hBRE9XX05NSSBpbg0KPiBHVUVTVF9JTlRFUlJV
UFRJQklMSVRZX0lORk8gaW4gb3JkZXIgdG8gaGVscCBkZWFsaW5nIHdpdGggdGhlIE5NSQ0KPiB1
bmJsb2NrZWQgYnkgSVJFVCBjYXNlLiAgUmVwbGFjZSB0aGUgZXhpc3RpbmcgdXNhZ2UgaW4gaGFu
ZGxpbmcNCj4gRVhJVF9SRUFTT05fRVhDRVBUSU9OX05NSSBhbmQgYWxzbyBhZGQgc3VjaCBoYW5k
bGluZyB0byBFUFQgdmlvbGF0aW9ucw0KPiBhbmQgcGFnZS1tb2RpZmljYXRpb24gbG9nLWZ1bGwg
ZXZlbnRzLg0KPiANCj4gUmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=

