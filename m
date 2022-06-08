Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681E25420E1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 05:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343607.568973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nymiz-0000pe-Fx; Wed, 08 Jun 2022 03:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343607.568973; Wed, 08 Jun 2022 03:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nymiz-0000mv-Ck; Wed, 08 Jun 2022 03:51:17 +0000
Received: by outflank-mailman (input) for mailman id 343607;
 Wed, 08 Jun 2022 03:51:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MCZa=WP=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nymiw-0000mp-GV
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 03:51:16 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3982a8c4-e6de-11ec-b605-df0040e90b76;
 Wed, 08 Jun 2022 05:51:09 +0200 (CEST)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 20:51:05 -0700
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 07 Jun 2022 20:51:05 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 20:51:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 7 Jun 2022 20:51:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 7 Jun 2022 20:51:05 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 8 Jun
 2022 03:51:03 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8%7]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 03:51:03 +0000
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
X-Inumbo-ID: 3982a8c4-e6de-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654660269; x=1686196269;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bkkumWqgbaZ3AgzGuQ+NeBErrcxjIN5t/ctVRL3LnYE=;
  b=YvMaWvsiSIYMiuCR5lGJ9P2KmZd6sQhjIAYRUBeZxpOaBPJJd4u9RRnp
   s+v0ziw1GA1a11PdTGfwTnGGlQa9rQjfWg6XJvZg/KQjBMcMIfTrdHIMR
   r/3I5mGTgfVL5H4gp1S7HL6Sof7xPbeJUGmqJHUzCXjxC+vxC6Srp1fIb
   VDxpRlnxGYkm/xdPiWOb6X2Ck/0GFaJQ8d/apnB9pz23nHM0EZudDpjMd
   w91nGDK131t9Z66EpFL7O6doWAM0wyEQC9/1P5sUYSBlY9UKLlN8m3JwR
   gwvILiNQWUeQjmoIE863IOrR87AXQoeQ0HREX4vhPWElSiVZDOmalNGjf
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="340833729"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; 
   d="scan'208";a="340833729"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; 
   d="scan'208";a="555225124"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjZ3E/f2CD/kAykjOLjc+rgX0DBTXXw7JhM9OyNqp51ztXOTxywjoXu1Mf+/B8Rc8B2KYbvK+zz5E8Zzkbl6/BzeLuCodrsbqERTZpKxIHOj0CSbHjTt/t+rxwyVzNm3OhxOMZ9kRsjBREt42rLmM1c1uq6EsvZAjhnwXbHsSlRdEhYgQWfOzZzCIk1Qg8I7c/2IHOQqyzRnEi2g6RcH8hOoz5bdrrwElcLwziZkJ1b4gc7y2N7CSqJkIKP9bkXvq5FOnX7IFmOaXpxThN/id0TbbSGLZ/Rvqqno3hYcC5OTTjwjYvq9ZtlwCyUxYDcEkj6zdJMOwTvTj8ChlGXdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkkumWqgbaZ3AgzGuQ+NeBErrcxjIN5t/ctVRL3LnYE=;
 b=jfdIMt3VIdNmVrLRyZ81I1LrUgtbSo7qh3xOdib20t6+YU0VBMug9ff38k8K+EPZw1MlyCwsif90H6QifmSgr/WYoQz5E23m7gMEy7/MqzyeQu/jSe77W5LhGAsB5hMyKSeYldyFqKV7poUiwq+Q6eBOQvNLuLL/EucFtr6qfEmrVY3raUvVFyt0wIvB5YajstxSGfwj5i2he6AnocG8frFS5pYSLZpH5dtevA1IPm1d/jqTXLbboJsJmtDj4yTUS/diQPkMICo+vlZgbtgQD7VFkOzmWV8WpmX4Feu4pWjhVNtcczDWCEkrvlpH9XpsGPBob3NeMiaO5zUAmkqhvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Beulich,
 Jan" <JBeulich@suse.com>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Nakajima, Jun"
	<jun.nakajima@intel.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 3/3] x86/vmx: implement Notify VM Exit
Thread-Topic: [PATCH v2 3/3] x86/vmx: implement Notify VM Exit
Thread-Index: AQHYcPGLnpUujBwR5EWVeB9tTYBUAq09rvQAgAAghACABdMugIAAJ8gAgAEpgQA=
Date: Wed, 8 Jun 2022 03:51:03 +0000
Message-ID: <BN9PR11MB52769B1AEEE39A3B679B2EE28CA49@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-4-roger.pau@citrix.com>
 <6fa93f8c-9336-331a-75c1-7e815d96ff49@suse.com>
 <YpoeuOJPS0gobz5u@Air-de-Roger>
 <c8f22652-abd5-76f8-75d3-ed581d1c4752@suse.com>
 <Yp8i/C+X82ZbIrSn@Air-de-Roger>
In-Reply-To: <Yp8i/C+X82ZbIrSn@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f59ced17-2f59-44c5-9e31-08da49021bf4
x-ms-traffictypediagnostic: DM6PR11MB4202:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB42028709AC023D5FB694E0148CA49@DM6PR11MB4202.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eHAdT6SF8xBLXOBu7TLHuKfcJMB7RUrValcOAVFHVUzxE9NSvy09aO+A+ZjCgqhByKMMJPDU2nrjkRm88ubDlp9xMJbovydFXJVxF9oHswB00FaHF38lmpNyjGZM3ZLqxIc/Iji/hKIBxaqiONqxw4Rv0jTv0lK0vztnqAf+oiTnoATDnY5lRdWkkmODbw/5x8sy3etWzXTHjMNOlWTvu+ldbYy4JdsJtlmObkZipxvowjFkj8R+MIvRY+M9NjE9cqvrGK1JvqWJ/ArcyQeMlL3iuqKEdHtRDbwPak8m+1JDhBNwKAmjVzS67cRHVaqLc/e9GWdYQX+NJePD2c0LRxlEAK4Lq5ArPqkWVmZYBScMN1APr7/fKrsAXotFTp8tQfKbH4tyhen/G45ZPoVeAg/Qb/hAqRMsl62WczokoiF7q8zkXJ4qvwhByui+nqE/oRsAsngbHWyO86qSPxXs911XN6z05jD95B52IOEPFwgaoCxNRzXDVL0dfQ6agMOvCUOsCxNvmKEaokWJShV5Myrl6oIxhdMGwP1pKVnwV0CUQHjf3/vwK5JihvXC4ibpISlfF3DO2v/lEVUPjoqMTTRbDwGyOMSU4KiTgYQHAC2qQXwHDLwuAWoVfxnLz0oNNk/B257inu3cc3XiitbzshRuDyAV8hXs/VZJAC53JLYPzNeh1hBqJZe/f4v+Fax9j9vkjQmVnr3jNp5u7lpZfQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(110136005)(316002)(76116006)(53546011)(4326008)(8676002)(33656002)(7696005)(54906003)(64756008)(66476007)(2906002)(86362001)(71200400001)(8936002)(66446008)(6506007)(83380400001)(26005)(55016003)(5660300002)(82960400001)(52536014)(38070700005)(38100700002)(122000001)(186003)(508600001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WENCNnQ4cjhQRk80NG8wWEhKd2hKTENMb241ZnE3c3B2THl2Y1NLMDJBYW8z?=
 =?utf-8?B?S0V6TFpoTUo2aGNrWFVyMVdVWEVxYUdvSC8vZmFTTHRKNWJQTHJyTFk1L1dT?=
 =?utf-8?B?a05LQThsWi8vd3lSWlU2K1E4Y2ROTHhiZGVFQ0Z4YnZXYkw0VjJwYk5OcFA2?=
 =?utf-8?B?TUpGeTZLRnFmSDV5bUU4ZWtuUnpJMkpQd0VpTkpLTER1K0Z5U05nek1RbGlt?=
 =?utf-8?B?a1hiZkVMbnFLeUEwZ2JKdlFUNzlFRTh0WXo0ZHkyZGNUS04ydXF0WDVBT2FZ?=
 =?utf-8?B?c1hLalRvKzVQZEEwNHF0Nm1XTnRhQTB5amV3QTVOUmhCdW9xVHh2S3dlVVdy?=
 =?utf-8?B?OWtBamQ5REJScHA0UjlTcndYaUorSTZCb2xzVGttQmhKS3JFaHFtREovdnVj?=
 =?utf-8?B?SFdONlpkSVJHUnJwUEVkZTVoei9sV1pNcDFhcC9tUm90bmNPV1MrbDVSVUlT?=
 =?utf-8?B?Y1loVG81SEZtY0RlUWhYVDQrY0Y3M2JxelVFYjYrekdhR2FDYmtGY08vTWNQ?=
 =?utf-8?B?a3oySnBObnNrdGlGY0N1dDNFamJDYmFJVWF1N0lIcStBdmIxKzJPMkNEMlZL?=
 =?utf-8?B?bDZSMHFLa0FidEh3Rnl0dGszem9hSnQ0bmF5TlpWRnRtcjZpbk1TRHowRjdH?=
 =?utf-8?B?d2RZRkMzREQranFHbUZvMFo0WmNRTGtDM0p3aEpXQXl1M3RlaVNhQzllalJZ?=
 =?utf-8?B?M01SQm1SdjN4Y0JQRGlJN3lCR2cxNWJHb0pCdThQb1lON0JXWUlPU0Z1SlMy?=
 =?utf-8?B?Qm5YcjJYaG9QWE1zSi9iY3R0Y2NzaHZQUS9BVXNad0ttdnFMd0c2bG92WFBj?=
 =?utf-8?B?dUVCb0NTZnFLakVZS2lYVDBVS25BdkJBejVCTFgwekI0ZTB3RVFMQjkwc2tU?=
 =?utf-8?B?ZUsxMkFUM1BESk1PbHhIMm9Kamd6bnBxcWxQZXZPaUd6MHBaUFp4SnFEQXlX?=
 =?utf-8?B?ZmpXR2k0UVNiQmkreVgrbHNEQ2hqOGpSd1lYUnFzMWw4a0tpRGx6UVF5djNJ?=
 =?utf-8?B?S2VlZzFyOUx5QS9maUFBN0YxRUltenFhVnl5Skx0OGtiOVpmL3hJbkZtWWov?=
 =?utf-8?B?TWFpQ3JoWnhhdWpMek1QT1BCNHFXWjdPQ05SR3NSeE5QSkdmaFFzRHhoRzM5?=
 =?utf-8?B?dWpEVWJLYzRkbjhGRzhhdDJmdUc0RUVneUp6Z3ZkODZDVm5idTI3UGdwSE84?=
 =?utf-8?B?UGcyZmpsL1VLK3g2cG9YQ1BkNTlBdlAwL1FZY0ZCbFljTU03QVp6MlI4Q3BO?=
 =?utf-8?B?a3BHa0R1Tm5xeTJqVENIU3JEcS9uOVVsR2xlNUE1S2ZTaCt2VFpiWjNmQy8r?=
 =?utf-8?B?MFpYUkdLNThiRzhXT2FaSlFqcVdQTUg2T0R5ZFF4MElDamFwUTBoODFyRDMx?=
 =?utf-8?B?QzFhdUY0MFZFUGtMUnIwWnJoa29QZ0w1ZjdlNVZCQjBZdWdQWEw2bno2R25w?=
 =?utf-8?B?VEZkdUtxOWxwMjlva3RQQjZsTHZFVkIzdVdRbTRMY1BCLzVOY0VRSTAzOVp2?=
 =?utf-8?B?K2dQczh2U2pZUHhVc3RobWNvTktxWVFRelc4MXhWWWdDRGFaKytSbzZ3bUkv?=
 =?utf-8?B?UnloQ1BuZk92djlIUzJDRkRETVRpZC9ncThGZ2Z6NisvMXQ4ajJNVFpqcTVZ?=
 =?utf-8?B?YW1wNGc1Nm5YNGZUUlFnaFpMd3BOTEtLREdEcXJQUVdVY1VRTnJoUzNRSmdn?=
 =?utf-8?B?SWtuR3d5KzVLSjcrVmdtcjJDcWJRc0NITG81ZkNRNnA4aU9OT2tDckhEalNp?=
 =?utf-8?B?STNkT01HelVDV1ZtNFpCQU84UFFDYXA0YkJJNzFwYWYrUkN5NUR0TG1DV1R5?=
 =?utf-8?B?NWZuK0hNWW9aRDErMnhwaDFNUWw4TkFTRGk4TFROMHlUcytKUDJVN1RkYkp3?=
 =?utf-8?B?R09SR2trdWE0b1p4Smk5NWZjR2JlQ3lLcXBQRml1elpmd24wRFJ3dmFHelpt?=
 =?utf-8?B?elJUWGtRNUFRWCtpNXhzaGhYcitVck9VMHp3cFFzMmh2RGtjcTAzY004SWQ0?=
 =?utf-8?B?MVRhbUQ0dVFIbmM0Rkg0VWpEbk05MSthY2VRdlg0a3IrNkN0NFNVK256UXBF?=
 =?utf-8?B?SmdTKzV2UVhpSTJ6Zmp6VUJsNzRUOTM5cWIzbUcvRlFCeE52UWh3ejBxQVNV?=
 =?utf-8?B?bm1EN1FwTUdCbGxLVDliYXR5TkRxeVNFRFpNc08xM1llNVdWelpTU1Rja1Rj?=
 =?utf-8?B?Q2FXd2VVN09lUitiYStZR0RiMUJreHZvcEhhdWREY1Rnc2tZa0Y5SDJzL2Rs?=
 =?utf-8?B?dStKdkJ4M0dyQi9jV09zN2NneEczT2xkdGdtb3hoU0I0cXlWVDl6ZktXWDVi?=
 =?utf-8?B?NzBZMTMrT2NIRWpXUzFJT1YwdmtKOEtkNXB4SVJiR0lmdGJabHMxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59ced17-2f59-44c5-9e31-08da49021bf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 03:51:03.3968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QB0AXND5wwDdeNtlh5Aab1VqsJ+Upgj8nkDGZVDVDnbh3IDBj3SpLwiDwel3dV0j+xXjgCk1xyLzco15FwjX1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4202
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpDQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgNywgMjAyMiA2
OjA2IFBNDQo+IA0KPiBPbiBUdWUsIEp1biAwNywgMjAyMiBhdCAwOTo0MzoyNUFNICswMjAwLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4gPiBPbiAwMy4wNi4yMDIyIDE2OjQ2LCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOg0KPiA+ID4gT24gRnJpLCBKdW4gMDMsIDIwMjIgYXQgMDI6NDk6NTRQTSArMDIw
MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gPj4gT24gMjYuMDUuMjAyMiAxMzoxMSwgUm9nZXIg
UGF1IE1vbm5lIHdyb3RlOg0KPiA+ID4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXgu
Yw0KPiA+ID4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPiA+ID4+PiBAQCAt
MTQxOSwxMCArMTQxOSwxOSBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjaw0KPiB2bXhfdXBkYXRlX2hv
c3RfY3IzKHN0cnVjdCB2Y3B1ICp2KQ0KPiA+ID4+Pg0KPiA+ID4+PiAgdm9pZCB2bXhfdXBkYXRl
X2RlYnVnX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KQ0KPiA+ID4+PiAgew0KPiA+ID4+PiArICAgIHVu
c2lnbmVkIGludCBtYXNrID0gMXUgPDwgVFJBUF9pbnQzOw0KPiA+ID4+PiArDQo+ID4gPj4+ICsg
ICAgaWYgKCAhY3B1X2hhc19tb25pdG9yX3RyYXBfZmxhZyAmJg0KPiBjcHVfaGFzX3ZteF9ub3Rp
Znlfdm1fZXhpdGluZyApDQo+ID4gPj4NCj4gPiA+PiBJJ20gcHV6emxlZCBieSB0aGUgbGFjayBv
ZiBzeW1tZXRyeSBiZXR3ZWVuIHRoaXMgYW5kIC4uLg0KPiA+ID4+DQo+ID4gPj4+ICsgICAgICAg
IC8qDQo+ID4gPj4+ICsgICAgICAgICAqIE9ubHkgYWxsb3cgdG9nZ2xpbmcgVFJBUF9kZWJ1ZyBp
ZiBub3RpZnkgVk0gZXhpdCBpcyBlbmFibGVkLCBhcw0KPiA+ID4+PiArICAgICAgICAgKiB1bmNv
bmRpdGlvbmFsbHkgc2V0dGluZyBUUkFQX2RlYnVnIGlzIHBhcnQgb2YgdGhlIFhTQS0xNTYgZml4
Lg0KPiA+ID4+PiArICAgICAgICAgKi8NCj4gPiA+Pj4gKyAgICAgICAgbWFzayB8PSAxdSA8PCBU
UkFQX2RlYnVnOw0KPiA+ID4+PiArDQo+ID4gPj4+ICAgICAgaWYgKCB2LT5hcmNoLmh2bS5kZWJ1
Z19zdGF0ZV9sYXRjaCApDQo+ID4gPj4+IC0gICAgICAgIHYtPmFyY2guaHZtLnZteC5leGNlcHRp
b25fYml0bWFwIHw9IDFVIDw8IFRSQVBfaW50MzsNCj4gPiA+Pj4gKyAgICAgICAgdi0+YXJjaC5o
dm0udm14LmV4Y2VwdGlvbl9iaXRtYXAgfD0gbWFzazsNCj4gPiA+Pj4gICAgICBlbHNlDQo+ID4g
Pj4+IC0gICAgICAgIHYtPmFyY2guaHZtLnZteC5leGNlcHRpb25fYml0bWFwICY9IH4oMVUgPDwg
VFJBUF9pbnQzKTsNCj4gPiA+Pj4gKyAgICAgICAgdi0+YXJjaC5odm0udm14LmV4Y2VwdGlvbl9i
aXRtYXAgJj0gfm1hc2s7DQo+ID4gPj4+DQo+ID4gPj4+ICAgICAgdm14X3ZtY3NfZW50ZXIodik7
DQo+ID4gPj4+ICAgICAgdm14X3VwZGF0ZV9leGNlcHRpb25fYml0bWFwKHYpOw0KPiA+ID4+PiBA
QCAtNDE1NSw2ICs0MTY0LDkgQEAgdm9pZCB2bXhfdm1leGl0X2hhbmRsZXIoc3RydWN0DQo+IGNw
dV91c2VyX3JlZ3MgKnJlZ3MpDQo+ID4gPj4+ICAgICAgICAgIHN3aXRjaCAoIHZlY3RvciApDQo+
ID4gPj4+ICAgICAgICAgIHsNCj4gPiA+Pj4gICAgICAgICAgY2FzZSBUUkFQX2RlYnVnOg0KPiA+
ID4+PiArICAgICAgICAgICAgaWYgKCBjcHVfaGFzX21vbml0b3JfdHJhcF9mbGFnICYmDQo+IGNw
dV9oYXNfdm14X25vdGlmeV92bV9leGl0aW5nICkNCj4gPiA+Pj4gKyAgICAgICAgICAgICAgICBn
b3RvIGV4aXRfYW5kX2NyYXNoOw0KPiA+ID4+DQo+ID4gPj4gLi4uIHRoaXMgY29uZGl0aW9uLiBT
aG91bGRuJ3Qgb25lIGJlIHRoZSBpbnZlcnNlIG9mIHRoZSBvdGhlciAoYW5kDQo+ID4gPj4gdGhl
biBpdCdzIHRoZSBvbmUgZG93biBoZXJlIHdoaWNoIHdhbnRzIGFkanVzdGluZyk/DQo+ID4gPg0K
PiA+ID4gVGhlIGNvbmRpdGlvbiBpbiB2bXhfdXBkYXRlX2RlYnVnX3N0YXRlKCkgc2V0cyB0aGUg
bWFzayBzbyB0aGF0DQo+ID4gPiBUUkFQX2RlYnVnIHdpbGwgb25seSBiZSBhZGRlZCBvciByZW1v
dmVkIGZyb20gdGhlIGJpdG1hcCBpZg0KPiA+ID4gIWNwdV9oYXNfbW9uaXRvcl90cmFwX2ZsYWcg
JiYgY3B1X2hhc192bXhfbm90aWZ5X3ZtX2V4aXRpbmcgKG5vdGUNCj4gdGhhdA0KPiA+ID4gb3Ro
ZXJ3aXNlIFRSQVBfZGVidWcgaXMgdW5jb25kaXRpb25hbGx5IHNldCBpZg0KPiA+ID4gIWNwdV9o
YXNfdm14X25vdGlmeV92bV9leGl0aW5nKS4NCj4gPiA+DQo+ID4gPiBIZW5jZSBpdCdzIGltcG9z
c2libGUgdG8gZ2V0IGEgVk1FeGl0IFRSQVBfZGVidWcgd2l0aA0KPiA+ID4gY3B1X2hhc19tb25p
dG9yX3RyYXBfZmxhZyAmJiBjcHVfaGFzX3ZteF9ub3RpZnlfdm1fZXhpdGluZyBiZWNhdXNlDQo+
ID4gPiBUUkFQX2RlYnVnIHdpbGwgbmV2ZXIgYmUgc2V0IGJ5IHZteF91cGRhdGVfZGVidWdfc3Rh
dGUoKSBpbiB0aGF0DQo+ID4gPiBjYXNlLg0KPiA+DQo+ID4gSG1tLCB5ZXMsIEkndmUgYmVlbiBt
aXNndWlkZWQgYnkgeW91IG5vdCBhbHRlcmluZyB0aGUgZXhpc3Rpbmcgc2V0dGluZw0KPiA+IG9m
IHYtPmFyY2guaHZtLnZteC5leGNlcHRpb25fYml0bWFwIGluIGNvbnN0cnVjdF92bWNzKCkuIElu
c3RlYWQgeW91DQo+ID4gYWRkIGFuIGVudGlyZWx5IG5ldyBibG9jayBvZiBjb2RlIG5lYXIgdGhl
IGJvdHRvbSBvZiB0aGUgZnVuY3Rpb24uIElzDQo+ID4gdGhlcmUgYW55IGNoYW5jZSB5b3UgY291
bGQgbW92ZSB1cCB0aGF0IGFkanVzdG1lbnQsIHBlcmhhcHMgYWxvbmcgdGhlDQo+ID4gbGluZXMg
b2YNCj4gPg0KPiA+ICAgICB2LT5hcmNoLmh2bS52bXguZXhjZXB0aW9uX2JpdG1hcCA9IEhWTV9U
UkFQX01BU0sNCj4gPiAgICAgICAgICAgICAgIHwgKHBhZ2luZ19tb2RlX2hhcChkKSA/IDAgOiAo
MVUgPDwgVFJBUF9wYWdlX2ZhdWx0KSkNCj4gPiAgICAgICAgICAgICAgIHwgKHYtPmFyY2guZnVs
bHlfZWFnZXJfZnB1ID8gMCA6ICgxVSA8PCBUUkFQX25vX2RldmljZSkpOw0KPiA+ICAgICBpZiAo
IGNwdV9oYXNfdm14X25vdGlmeV92bV9leGl0aW5nICkNCj4gPiAgICAgew0KPiA+ICAgICAgICAg
X192bXdyaXRlKE5PVElGWV9XSU5ET1csIHZtX25vdGlmeV93aW5kb3cpOw0KPiA+ICAgICAgICAg
LyoNCj4gPiAgICAgICAgICAqIERpc2FibGUgI0FDIGFuZCAjREIgaW50ZXJjZXB0aW9uOiBieSB1
c2luZyBWTSBOb3RpZnkgWGVuIGlzDQo+ID4gICAgICAgICAgKiBndWFyYW50ZWVkIHRvIGdldCBh
IFZNIGV4aXQgZXZlbiBpZiB0aGUgZ3Vlc3QgbWFuYWdlcyB0byBsb2NrIHRoZQ0KPiA+ICAgICAg
ICAgICogQ1BVLg0KPiA+ICAgICAgICAgICovDQo+ID4gICAgICAgICB2LT5hcmNoLmh2bS52bXgu
ZXhjZXB0aW9uX2JpdG1hcCAmPSB+KCgxVSA8PCBUUkFQX2RlYnVnKSB8DQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgxVSA8PCBUUkFQX2FsaWdubWVu
dF9jaGVjaykpOw0KPiA+ICAgICB9DQo+ID4gICAgIHZteF91cGRhdGVfZXhjZXB0aW9uX2JpdG1h
cCh2KTsNCj4gDQo+IFN1cmUsIHdpbGwgbW92ZSB1cCB3aGVuIHBvc3RpbmcgYSBuZXcgdmVyc2lv
biB0aGVuLiAgSSB3aWxsIHdhaXQgZm9yDQo+IGZlZWRiYWNrIGZyb20gSnVuIG9yIEtldmluIHJl
Z2FyZGluZyB0aGUgZGVmYXVsdCB3aW5kb3cgc2l6ZSBiZWZvcmUNCj4gZG9pbmcgc28uDQo+IA0K
DQpsZXQgbWUgY2hlY2sgaW50ZXJuYWxseS4NCg==

