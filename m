Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827AF510FD7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 06:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314336.532351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njZ2W-0001TY-Hb; Wed, 27 Apr 2022 04:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314336.532351; Wed, 27 Apr 2022 04:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njZ2W-0001Ri-Di; Wed, 27 Apr 2022 04:12:32 +0000
Received: by outflank-mailman (input) for mailman id 314336;
 Wed, 27 Apr 2022 04:12:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/sE=VF=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1njZ2U-0001Rc-PY
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 04:12:30 +0000
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e4e806d-c5e0-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 06:12:27 +0200 (CEST)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 21:12:24 -0700
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 26 Apr 2022 21:12:24 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 21:12:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 21:12:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 21:12:23 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM5PR11MB1850.namprd11.prod.outlook.com (2603:10b6:3:112::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 04:12:15 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 04:12:15 +0000
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
X-Inumbo-ID: 3e4e806d-c5e0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651032747; x=1682568747;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V2idaFxucHiJGDXQSdaMMES8a8n6WWlBDcoqFbA5KEU=;
  b=MVcf1EEdXtgL/jI3SthBpCHUpgLax13xpG9v0KtvaSoacqjN2ikvTAaw
   6sfos+lUPOfDHgtZGn3T4MNRP2D4AQkEKkglTnaSfnb0r51hTvoy1wQWi
   qiHT6Q7rVm9vx/eyjRZCqOoWJ35RTiap+Bb1XGx0FFdcnK95QFlW4Lfjx
   LF8cw2J47uvJekI8JhNWvL4KjqGGPmdp4zXtr7XftW+JNWDKtacNucDbg
   gZrLrT2os8lV+IPvIbSX7lajbRlYrnsHNjsIJOLwMHDLgfCkrQNKqQhSc
   v8GWgTvaTgISOcIKmf1AIa3d1VwsQaQXSAShs755QnzPOff5YzuiOVd4p
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326297039"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="326297039"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="730597254"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBMIMU9MKCWTx12g9jQmq+rxMmBH5uCWl0n4L1GfqvCYBtuhDDZgTS5VBcyEKjtWZJY1V7LM1vsgAIY8o5vSX3dc9PgLJzO+sTXFaiN8yFTN4qzdDArUMGVM2YM9qkxfbkUxfbwtI5K4UQdsO7L4B8AjDskIm/WHZ29iECKrubdhCHJSd4Cfd8hTzhNqDj2nwu98baG2X7C76KeCjTjn4A0E5icnO7AYd+KOLpMULSo8VPXCqfbtK3vzw3y6xFjG1wKJL7SYsZ6qys6b8dfohEvvgkT3PRfJcHlhRbug0+fdUvd/ayHWgP/PNkoRoL+wr7EqQGyNy0TcBFICX0wbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2idaFxucHiJGDXQSdaMMES8a8n6WWlBDcoqFbA5KEU=;
 b=KkKrSY/JDVLSieQrCzmbdqUqExX4FxznUZJu8kRc36za2bny655Qwpq+BdUp/Bm84uEnBMhqJbvQoQpGDQQYlDMJptImhn8e0NYkQwGJVaoO9V2af/ycW7AzgFjsKmyBZw9Vioxx9dnJqnersrzYVP/Ub10u7G/FDtjghO3oTCczwsj/33Kl+zDEQ2mpFmIao7niGRpze23NHeqJg901OsXpHMp8t3sJeZqgrww5F7SxLeWYw2yNDhfB4HgUsHs9P3S0HsVIpAEFMe/fW5rvbj2nK3XJuirvFVi8iEz0c2XrCSr7Z38k7ECZnZe1mpqL3x6ygE1DgFrSJ02jRHbCAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v4 20/21] VT-d: fold iommu_flush_iotlb{,_pages}()
Thread-Topic: [PATCH v4 20/21] VT-d: fold iommu_flush_iotlb{,_pages}()
Thread-Index: AQHYWIC6Eez4ojrFhkKf16nX7g3O4a0DKNrw
Date: Wed, 27 Apr 2022 04:12:15 +0000
Message-ID: <BN9PR11MB5276FFEA0150548AA4BDEA698CFA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <eec16b83-7f8f-e94d-b1f6-9113ff93fd14@suse.com>
In-Reply-To: <eec16b83-7f8f-e94d-b1f6-9113ff93fd14@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e2059fd-d291-42b0-48e6-08da28041cf9
x-ms-traffictypediagnostic: DM5PR11MB1850:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR11MB1850D6337EB3305900B525218CFA9@DM5PR11MB1850.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VPjMTssCydOlT/KOp2M41XMcQkSBAqG4GOFCoO8YxJI5MAIuPLpFFrIuDpX7IH4FaTwRZr7hlbqtLMjv3GSBomIa5Y5CmrV6kliV1ra30dCfiPGWH51R+6Wq0R5dnIniSzZpJ/y/jZWf0nx/MDOvybBzPXRBzdLE1Df0NglZaOIG7U+STzhQlgM9In0tXt9E7EOHzzs46FJpQ1teHVmFmsQ0nOYQc0X8m5BBOz7CeMTjC1PJ4/XGVr+ZrjgMR1NPFpaboJ1Ucerjt5GvfxpL0N/ijOmLEEPvGaruv1HJTqLOOTMEZFfqIcOEBX8V3OBakiM+tWWOcHfcdXfXv466DIMgRdrVtCQFw5zagjKzbZE1eX8xXzenLwZq4WB3sRQvMSKeWIx8HoWwAMBHQ0IoF/duolv+NJLtnE9ARy2n7bCLfYHcC04rpSOz6bqwf0fHZROsZdUWco2DYKn92vD9ZxUs8dfsas6orUojSme3r9sO5e8nT9pt06jQjxEc5z0G1FTSen9dyak1LNId/qJme9waZ1NQ+JZpXpIACSERbd7DryhAYseFp9Wktz35xFNaWQ6oDdejJ+/VK58bmwafSBFhN8TwUPdkcBdklyfvfhzW7VEGu5LY5zxdPLoNwZhfYb6fQE4jF7BnnQ2eRJ7VDla0dopFmpcT8pZ5UlM8uMm5fUVDWQuKk2IPooEcNm5FZ6YnMMTlFMVl2gqm7RAqAQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(71200400001)(83380400001)(66476007)(66556008)(66946007)(76116006)(64756008)(54906003)(5660300002)(66446008)(316002)(110136005)(4326008)(8676002)(52536014)(122000001)(86362001)(508600001)(186003)(8936002)(55016003)(82960400001)(38100700002)(38070700005)(7696005)(6506007)(26005)(9686003)(33656002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVFISTllK1VaODBqT1dQemt2d04vYTJUalRxWHUxYldMeFkwODB1WlVWUEM3?=
 =?utf-8?B?b0pmaWFGMFRVUlRhR1V5aU5kMzBMTEhuSWY0VmI1allkdy95VnhXTlhzKzNM?=
 =?utf-8?B?UVE2RllTbWFDL0dFN1dwUWVyQS9mbnUvb0puSWJWSWMyM1dmL2FqRzZKYWZ3?=
 =?utf-8?B?M2hvSk5STUR6K0RFV3JoRi9DQ0wxZ0MwMHh6d1RSWlMwb2pqVUJ3SGEwZTBF?=
 =?utf-8?B?aUVtNVNBekpJeVIvWTErOFNpZTh1c3QzRmFic1RxM0NoUUdESlJuSXJVTjZB?=
 =?utf-8?B?eGczcWM1aEZUK2svQ3h5R1lGNTdINGh6N3ZEYjM5dWhzYVhEeWtXbExRanJw?=
 =?utf-8?B?cFNsU3lsU2Z5S1hSait4TlRFSDhLYWlPSyt0Q2JVb0JxbFp4WDhJSzk0TTR0?=
 =?utf-8?B?WlpHQ2tnYjBlQzYwU1J1QnpUU0RWMHRZdmxYRnRZOWlRcTdmSkNPSVBnY05s?=
 =?utf-8?B?MVFDUnpkMU9QZ1g1ajVVeWpqSmV0aUw3Qi9EQkVWd05LZzNjTlBsNG1GMklJ?=
 =?utf-8?B?ZkEwQy9TOStQek1oUzQ2dFhXSkR4VHh3UzJ4eXd2R2RRcG5WSjlFa0NtajVi?=
 =?utf-8?B?RjRIb0p3dEFRbnpxYWxtMHBkZFpYM2Z5R3B2UmVrV2VCVGVUNzQvWUxQT1JR?=
 =?utf-8?B?V25yN0Q3VjN3UC9TZnRMa25meWt2SWliUE9OR3ppUW1oRmtFWFh2Yjdvcmcr?=
 =?utf-8?B?UUNabFhLNko1aTZ2L0NtZzhpUnNVNjlUUmdVWUVJM1JtUDhrSk9EMnpGeG01?=
 =?utf-8?B?VDc1dk9hZ2U3bzR2bnoyUlR0bERjZmc5NkFUeHZMRFVpU0p4OS9rN2xGbmJ2?=
 =?utf-8?B?dURDbVN0Ym9wWlNKMG5SeGFtSUEzVmJUakkveWplYTczdlFXUlltdEVkSkZm?=
 =?utf-8?B?RnpxTmFJS2t6UHpXWXZJN0UramQxMmZEU3VFTkRYWlEySWw5OENhVEhyYUxV?=
 =?utf-8?B?akxMSWtOeWZsYTVCeExFbTlONHFBN2ZTLzJEbTVsRXNKOWQrbzNFbTZreEhv?=
 =?utf-8?B?Z3BGejYxbVZqQmJyMDlTNU9pYlhueGlVb1VQWFBYZENZNVJyUy8vWDd6V2xa?=
 =?utf-8?B?RUVja2N0S2lnOHJOWFpoTjRiUVVCbjgzaXg5elVPZVAwSFVvWk81V2djSVl0?=
 =?utf-8?B?dzVSc2dBNWV2c2xGOW5VMFRDNlUyVmhzaHNuMkIrUjZ6NFd4SS9CdTJDcUov?=
 =?utf-8?B?NGpRSVZtQzE3cUM2WWw4WlRtcHVvb3pRN1lmVk1QOEY5dER0U0N4KzBmV0xV?=
 =?utf-8?B?V3RZVHd5TXZKVFE0c1kvWkg2N1Y2VmhSVkpUUGVEMDIxMXA0S3pndE8wTzhR?=
 =?utf-8?B?Tkp2bDJmcWJCT3RzZzRCdEZOLzFIZGo4U2NRdHcrWWlMTzVnN0xiMkpWMHZC?=
 =?utf-8?B?YmhqSDlFMkVFTnVrMmtZbzRiclc2dkw1R2ZZWUVydFNGSVRGbHM3M0FQQnBh?=
 =?utf-8?B?UDF4dnBCUlRWdlpMenphV1R4Tm94bHYwMGJqL1pFQnNycXVtZE42TmRkWTRH?=
 =?utf-8?B?R21BZjEyelBmaGFnZWUyRXMySks2ZUFzMEcrRnpZYjY5ZkNLdDlPREJYeFB0?=
 =?utf-8?B?RFEza1RLQnJzcDJaY3JvSkZpdDdMckhLbGYrVFRtbklkbDZHdlZib2xjQWZx?=
 =?utf-8?B?Z1pKclBJMUhpSTZsV1Q1ZndDWXppaVhPMTVNaFhEZVR1MktHbVhMMFhpRDJE?=
 =?utf-8?B?YjBrdnlZZTM4Myt0Z2k1VlAxQUcrdmZoZStDeU9FemIwOW5yalhmOE8wUjRB?=
 =?utf-8?B?cHRvYi9GYmlqRDhOWWQzZkRzL2FQQmNBbUlpSi9xaTgxSHZxM20rQXpQOWI1?=
 =?utf-8?B?ME1nYmp1cnpUL2l5QjZxeUxtY2ExL2ZVMElkaDMrVW1tUjNHVHRKd2RyQ2hw?=
 =?utf-8?B?TmxMbzFwa3lqb1MvSUQrckhSUWJzUndjZXNtWE5MZUlYU3JXQ0NvdVJBTzNE?=
 =?utf-8?B?dlpIb1dKcmpTK1FGdUJEdW45MGZDN1JEV0RGMzEyVXFkaWdMRzlUcFlIWW96?=
 =?utf-8?B?WlpFTlpSUWlScXhOTWV4anhzQTgwYzFodTIwUmVYUElUZmg5bDJWR2M1R21q?=
 =?utf-8?B?L21vSFFVZVcyS2EvTERCdnJyRUs0eWNrb2h6Y0ZJV09FZmdvanhXU3o5WHdU?=
 =?utf-8?B?Wjc4V3Z2ZWZTVmp5YjUySlNVdW9sbm9KUVBjc0xrOW9KUU42ZHFyUHZJTjVD?=
 =?utf-8?B?c1dZNXVjUmsxVXV3MVhkME1aSFlWSFhjS2ZUMUhlYWRlcmxEKzNVMFozU3Fn?=
 =?utf-8?B?dkZjVlZoZlNjcUtuNU9DWnJON0JiNmhnY05SMUdTYXE3N0R2TUV3S1UyVWhw?=
 =?utf-8?B?WEFzcStBSm9LRkI2WFdadVo0K1BqSVhWY0kwK0ZYS1N2b0VjbUxTdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2059fd-d291-42b0-48e6-08da28041cf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 04:12:15.6801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6SybKiNX8BSUwYkIfTFRadLnr65bcP+iaO9Tgz1Td4ojleWwEwnz1h6+nOPmg2EEf7e1LoKGoWrBmjHaqkJd7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1850
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
QXByaWwgMjUsIDIwMjIgNDo0NSBQTQ0KPiANCj4gV2l0aCBpb21tdV9mbHVzaF9pb3RsYl9hbGwo
KSBnb25lLCBpb21tdV9mbHVzaF9pb3RsYl9wYWdlcygpIGlzIG1lcmVseSBhDQo+IHdyYXBwZXIg
YXJvdW5kIHRoZSBub3Qgb3RoZXJ3aXNlIGNhbGxlZCBpb21tdV9mbHVzaF9pb3RsYigpLiBGb2xk
IGJvdGgNCj4gZnVuY3Rpb25zLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoN
ClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiAtLS0N
Cj4gdjQ6IE5ldy4NCj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21t
dS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IEBAIC03
MjgsOSArNzI4LDkgQEAgc3RhdGljIGludCBfX211c3RfY2hlY2sgaW9tbXVfZmx1c2hfYWxsKA0K
PiAgICAgIHJldHVybiByYzsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW50IF9fbXVzdF9jaGVjayBp
b21tdV9mbHVzaF9pb3RsYihzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBkZm4sDQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sX3QgZG1hX29sZF9wdGVfcHJl
c2VudCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgcGFnZV9jb3VudCkNCj4gK3N0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGNmX2NoZWNr
IGlvbW11X2ZsdXNoX2lvdGxiKHN0cnVjdCBkb21haW4gKmQsDQo+IGRmbl90IGRmbiwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgcGFnZV9jb3VudCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbHVzaF9mbGFncykNCj4gIHsNCj4gICAgICBz
dHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsNCj4gICAgICBzdHJ1Y3QgYWNw
aV9kcmhkX3VuaXQgKmRyaGQ7DQo+IEBAIC03MzksNiArNzM5LDE3IEBAIHN0YXRpYyBpbnQgX19t
dXN0X2NoZWNrIGlvbW11X2ZsdXNoX2lvdGwNCj4gICAgICBpbnQgaW9tbXVfZG9taWQ7DQo+ICAg
ICAgaW50IHJldCA9IDA7DQo+IA0KPiArICAgIGlmICggZmx1c2hfZmxhZ3MgJiBJT01NVV9GTFVT
SEZfYWxsICkNCj4gKyAgICB7DQo+ICsgICAgICAgIGRmbiA9IElOVkFMSURfREZOOw0KPiArICAg
ICAgICBwYWdlX2NvdW50ID0gMDsNCj4gKyAgICB9DQo+ICsgICAgZWxzZQ0KPiArICAgIHsNCj4g
KyAgICAgICAgQVNTRVJUKHBhZ2VfY291bnQgJiYgIWRmbl9lcShkZm4sIElOVkFMSURfREZOKSk7
DQo+ICsgICAgICAgIEFTU0VSVChmbHVzaF9mbGFncyk7DQo+ICsgICAgfQ0KPiArDQo+ICAgICAg
LyoNCj4gICAgICAgKiBObyBuZWVkIHBjaWRldmVzX2xvY2sgaGVyZSBiZWNhdXNlIHdlIGhhdmUg
Zmx1c2gNCj4gICAgICAgKiB3aGVuIGFzc2lnbi9kZWFzc2lnbiBkZXZpY2UNCj4gQEAgLTc2NSw3
ICs3NzYsNyBAQCBzdGF0aWMgaW50IF9fbXVzdF9jaGVjayBpb21tdV9mbHVzaF9pb3RsDQo+ICAg
ICAgICAgICAgICByYyA9IGlvbW11X2ZsdXNoX2lvdGxiX3BzaShpb21tdSwgaW9tbXVfZG9taWQs
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZm5fdG9fZGFkZHIo
ZGZuKSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdldF9vcmRl
cl9mcm9tX3BhZ2VzKHBhZ2VfY291bnQpLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIWRtYV9vbGRfcHRlX3ByZXNlbnQsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAhKGZsdXNoX2ZsYWdzICYgSU9NTVVfRkxVU0hGX21vZGlmaWVk
KSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsdXNoX2Rldl9p
b3RsYik7DQo+IA0KPiAgICAgICAgICBpZiAoIHJjID4gMCApDQo+IEBAIC03NzcsMjUgKzc4OCw2
IEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGlvbW11X2ZsdXNoX2lvdGwNCj4gICAgICByZXR1
cm4gcmV0Ow0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGNmX2NoZWNrIGlv
bW11X2ZsdXNoX2lvdGxiX3BhZ2VzKA0KPiAtICAgIHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRm
biwgdW5zaWduZWQgbG9uZyBwYWdlX2NvdW50LA0KPiAtICAgIHVuc2lnbmVkIGludCBmbHVzaF9m
bGFncykNCj4gLXsNCj4gLSAgICBpZiAoIGZsdXNoX2ZsYWdzICYgSU9NTVVfRkxVU0hGX2FsbCAp
DQo+IC0gICAgew0KPiAtICAgICAgICBkZm4gPSBJTlZBTElEX0RGTjsNCj4gLSAgICAgICAgcGFn
ZV9jb3VudCA9IDA7DQo+IC0gICAgfQ0KPiAtICAgIGVsc2UNCj4gLSAgICB7DQo+IC0gICAgICAg
IEFTU0VSVChwYWdlX2NvdW50ICYmICFkZm5fZXEoZGZuLCBJTlZBTElEX0RGTikpOw0KPiAtICAg
ICAgICBBU1NFUlQoZmx1c2hfZmxhZ3MpOw0KPiAtICAgIH0NCj4gLQ0KPiAtICAgIHJldHVybiBp
b21tdV9mbHVzaF9pb3RsYihkLCBkZm4sIGZsdXNoX2ZsYWdzICYgSU9NTVVfRkxVU0hGX21vZGlm
aWVkLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlX2NvdW50KTsNCj4gLX0N
Cj4gLQ0KPiAgc3RhdGljIHZvaWQgcXVldWVfZnJlZV9wdChzdHJ1Y3QgZG9tYWluX2lvbW11ICpo
ZCwgbWZuX3QgbWZuLCB1bnNpZ25lZA0KPiBpbnQgbGV2ZWwpDQo+ICB7DQo+ICAgICAgaWYgKCBs
ZXZlbCA+IDEgKQ0KPiBAQCAtMzI1NCw3ICszMjQ2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBp
b21tdV9vcHMgX19pbml0Y29ucw0KPiAgICAgIC5zdXNwZW5kID0gdnRkX3N1c3BlbmQsDQo+ICAg
ICAgLnJlc3VtZSA9IHZ0ZF9yZXN1bWUsDQo+ICAgICAgLmNyYXNoX3NodXRkb3duID0gdnRkX2Ny
YXNoX3NodXRkb3duLA0KPiAtICAgIC5pb3RsYl9mbHVzaCA9IGlvbW11X2ZsdXNoX2lvdGxiX3Bh
Z2VzLA0KPiArICAgIC5pb3RsYl9mbHVzaCA9IGlvbW11X2ZsdXNoX2lvdGxiLA0KPiAgICAgIC5n
ZXRfcmVzZXJ2ZWRfZGV2aWNlX21lbW9yeSA9DQo+IGludGVsX2lvbW11X2dldF9yZXNlcnZlZF9k
ZXZpY2VfbWVtb3J5LA0KPiAgICAgIC5kdW1wX3BhZ2VfdGFibGVzID0gdnRkX2R1bXBfcGFnZV90
YWJsZXMsDQo+ICB9Ow0KDQo=

