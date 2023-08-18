Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838D278040D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 04:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585762.916935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWpgg-0000KV-Cr; Fri, 18 Aug 2023 02:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585762.916935; Fri, 18 Aug 2023 02:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWpgg-0000IT-AI; Fri, 18 Aug 2023 02:58:10 +0000
Received: by outflank-mailman (input) for mailman id 585762;
 Fri, 18 Aug 2023 02:58:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ewn8=ED=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1qWpgf-0000IA-1T
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 02:58:09 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c64515c-3d73-11ee-877d-cb3800f73035;
 Fri, 18 Aug 2023 04:58:05 +0200 (CEST)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 19:58:02 -0700
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 19:58:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 19:58:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 19:58:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 19:58:02 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Fri, 18 Aug
 2023 02:57:59 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::dcf3:7bac:d274:7bed]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::dcf3:7bac:d274:7bed%4]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 02:57:58 +0000
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
X-Inumbo-ID: 0c64515c-3d73-11ee-877d-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692327485; x=1723863485;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h0cHUZvr+ukB/8zHYsghteL+ynAt0ZLzDINf0LZmNW8=;
  b=ZY9irbN+3Sgz+zhVEftZZKvNZZn7q3f/qQKbVLDbTcuePGj/i/O5grhY
   DtdzbhsISYPigvDKuub7NTwCmmkXzA1KZuWVZYG6YCnRXK+UI6ADuTx8j
   kjEm5FYlt423XS6Uz2m/ApItRYazuF4PxgqCd4cjPiJWr01x6VzS5Nmu+
   JGEcg8tcjpBJWCUM6fE1Q2foID6j9t0bmQCDru0ZOaK7HagMKJ0xn66JY
   uqeCd1MeFMmIcG4OQHz8kQJ5/TQOXVmUWCw5Q2eH+Oo/oPXyC8daqBPQZ
   Yjx+8AhFAzqNEkdQ6Ax3jvqqwWGB+rA+ezx78uJq+A/u15PMsY0GD5Ee+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="439376101"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="439376101"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="764380139"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="764380139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4i6YfUD9DJitw1n0Jy5cSVHimZZp/BRwXx+f8jEzHVNUHY7DvN3XRErp9o4I+/j5tL3CXz6uG66Gg3pUQAO06vSTOX6AzRo5Rpyb0mU9QXf2YyS6YnLrp7NNhUmWsAq+NR2ugr419WQ8bchdNjm5cnnbFLyAfhwKTpkg2RxEr5MzLLtRldZuaJYGcbYYnymSU++By4fCGuQMLBnBL8RbmnOUvTI+ebziHctV1L/y4m37VIdCA9ZCg+Mf7onSKdYw0KuhH0H43pYyTF3+60FbB5kocuvdVzPjZCQ6xlGQJsBsFxFDX6rHJozpypS8u/62BecUczyhfc+wUqkVnloig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0cHUZvr+ukB/8zHYsghteL+ynAt0ZLzDINf0LZmNW8=;
 b=YXJxZzN51HUwTuLyFAAbpKR8D4igId4IbJKA7thspWsJEaKoQ2OJ0x8dPcewx634+9H/WFCIqjR9vKZrO+Uf3/R8RwFLKf8ikK+ckh9fDXytDCdFoEoqMWjxAp4J/rzAWcm/yP3w0vawxI6zMbgqBcLmsP6mu4rw+oJVZWIkbKCn4Hgtf2hT7hZHDo8cTvcgLibYcAxtpP2mzq0nTS5G5ToI67FWr1C3WShR19QJ+hsNkyLIMyJhYDpRtz7mU9M8H7N/oGxI+LWhGi7FPJrUplO80+DWdxjZ0mg/3xpkj66ScKwMu7c8B9m8imgzMq1R8lcWJtuKE6dQ32iJSv1nIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH] IOMMU/x86: fix build with old gcc after IO-APIC RTE
 changes
Thread-Topic: [PATCH] IOMMU/x86: fix build with old gcc after IO-APIC RTE
 changes
Thread-Index: AQHZ0CdQc42jdmVqq02jl/qT9LUfyq/vXyqA
Date: Fri, 18 Aug 2023 02:57:58 +0000
Message-ID: <BN9PR11MB52768AE0DBBD470041572F498C1BA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
In-Reply-To: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM3PR11MB8758:EE_
x-ms-office365-filtering-correlation-id: affbc1d5-ccff-442b-942c-08db9f96edf0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9hDvDpjgeIr8Bg7vCP/MOgLbKIVDvSYwjN/NtSjKYaj9ZWWcRB6AXuG8BANnPKb5n5XVfYp80eJTMytHIYUTPSZX87qG9dVF6YUV/B8HHGnEdFTkXSIhD4tta1q083HmK8dFppMYlPy3pcSDranAPl+MjyD2x07VlT+Qa0zUWHBGxLFCSrpr+CJcXQgy9iL/Mhbi9AW+gzBf5FE7M8c4fquzFR6BN7HfY/ZDzU7DWKLOKXhaxfVWsbdh2u+nQlkYijmTVA4evKbzB+oyqxvNzFs2w/UJTY7+TXlXMom5nVhTwMpISTMOLwdScq96L2kSzkYCXZeRHd/3uB5Xf/rGDiu5n9FpFREIRoJBE59C6npb3HiX6VUQu1Xln89Q8ByIGovhQQzgu8/SpxBQZPY2hRagTjqUOowoL9x/a8OfBokfS6WFKoAz0gFPYsLhngJrp+f4DhGUrarxGBNvXJ4Su+1KHOlUiGcjSH1JKIv1RwyXIR651i13bXYJnvYM3m+H8Q35EBZrUo7i6GM4qFl6IoMG7bje5ngrI9+qIF093m1irhwkN1cgqEb/6L6U21n+QTJMseyCOQABkbf6YXT+9QfQjRb+4bYhONRW9AbWsaTSnsw/8INyyq5lkOI788ku
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199024)(186009)(1800799009)(54906003)(66476007)(316002)(110136005)(64756008)(76116006)(66946007)(66556008)(122000001)(66446008)(5660300002)(41300700001)(52536014)(38100700002)(38070700005)(8936002)(8676002)(4326008)(82960400001)(26005)(2906002)(83380400001)(55016003)(478600001)(558084003)(86362001)(9686003)(33656002)(7696005)(6506007)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aU5WZU1OMXZKMGZDcDh4ems2K1NvazFvVFNsK0NJanhyclFFVGZyRVpQRUNk?=
 =?utf-8?B?ZUhESTBPNTJlUTZtSnRDOVZxMkUxYXZXb0x3TGtLQXBmWElSQk9JYW44ajd2?=
 =?utf-8?B?N3NUa3JaUWN1RWd6MzFGd01KMXpSQXcrT1U2ejZLRXJkdUwwNzI3YVI1LzRq?=
 =?utf-8?B?bDFVTTRxc3E2MHk1NG5OVUVZQ2FNRWVxbzBVSG1JRWRWaHBXTlVaclBXVjA5?=
 =?utf-8?B?Qk5wZllacXAya2ppL01SWVFoNUZjUUQ2WWJ5YlpCVVFRN3daR296N1RGVWVV?=
 =?utf-8?B?QlBRdFdXNUJMd3dyaUdpa3ZPNmQ2c1BxUEFNNWNSQ3FPaVRRNmZsd1Q0V0R0?=
 =?utf-8?B?NFBBRkdDdmxzOURjQkFsbnNObUM3ZHMxYnhZR1Z4L01lbGEzL2s0dkxpQWh3?=
 =?utf-8?B?Mm9lQ2JQZ2dZUTl2VW1VWGNuUC9qWDVFZFB6eEZxMjhmU2U4cnNHWkxmYVpD?=
 =?utf-8?B?SGdEK296T1Q3WkIwdlNzUzBoUzJWYmpIL01WdXIxakpZdi9QWUF1ZSs2QkFG?=
 =?utf-8?B?K2doQXBCWUVYZHVmZXloZUJjbys5aEsrTXBzT2tYM0dzV09veUplY3Z4N2Fn?=
 =?utf-8?B?TzJxNzZMZmp1SnVrcm1PRERwM2pOL3Y4dGtCNDZMQkcvc1pLVVFlaUNENGZk?=
 =?utf-8?B?ekxFc2luVGNvZFE3cE4zZ2ZEV2dIN3BXSENGL0pQUmtEVDhmRlJ3VHc5V1Ju?=
 =?utf-8?B?N3doRHVGRFFhUHNYL1dYR1UvTWhsUkpNZ2x6MlJOOHJXQTN0emZiOEVGb0FF?=
 =?utf-8?B?SVp1cXBnd3c1VkVQQUxIYjFWVUFaU1ZLNDhqUDVjSWNuMGRmNlNvQzFIdjZo?=
 =?utf-8?B?ZjJqT1lsWU43aFFoTDJsem1Hclo1ZndiUlNsU0UwNFFwZ0dnQTJuUjN1TGY4?=
 =?utf-8?B?QnpRbUR6K2JlVEc1RzF1R054aExMNWNzc0dyQWZFRmswY0QxWXg5ZzdDSlNQ?=
 =?utf-8?B?MVVOR0tjQkMyeGFSbWFTUDFxb21KNEdDSlNrT0pmd0ZwWXpIaUREcjZUSW9m?=
 =?utf-8?B?dVdnYW9IYTNjVllZK1dVNzNyOHFJT1d6K3FrcFBUQ2Y3K293R0ZyYW0yRnow?=
 =?utf-8?B?Q1MzSkxHcE90WHRaYTNuSDZBRDN6cjVQRlVsY2FQWUFldFpaaDRUVTVQK3Jr?=
 =?utf-8?B?SUlwWi91MjNtSEljRGYwSWVHdjMyTlNCZVFDNnlrLzdhTUF0LzU3Z2Y2SW1x?=
 =?utf-8?B?aGZqd2JCbWNZRnc0dVJNaW5BcVI5Vll5SytIZW5WL0ZLbitMbmVRclZPYU4z?=
 =?utf-8?B?ZTV6ZUwzZ05IYXlETnFUOHE0RTVYYkxXbm9VSis3NDY3L3pWR3ZBc05VZW1i?=
 =?utf-8?B?SlpPNTdxMndrQU5acmlQOVQxTFBqNktXRjd5dVdXbWNUaE9FQStkazVuWHc5?=
 =?utf-8?B?MjJNM2dUeEs0eVZPM1RpUjMyTERqQ1FQN2ZhcFlPWERJbkdwZjNZVU04R2FZ?=
 =?utf-8?B?VE9UQ2xnM2JmZTRMZDZaYmxneHdhQUNwZlFaODVvSGZiai9NQjRDRksyR295?=
 =?utf-8?B?eVZTWENJblZrU2RTQ21DUGQveC9Jdk5GU29MM3IyUjFwVmRIbDdOdHQyRCsv?=
 =?utf-8?B?RTh6djkyUEp2M0gyOCtNTHJHQkFQWGFtYnoyaUFsWExYZ210QnZ3ODBWOVhw?=
 =?utf-8?B?ZTZEbnVWMFRLbG1nNFNBZDJOdjFCRWZ3L0szSEZIRTZQR01rUWtnOExOald0?=
 =?utf-8?B?Tk1ybG1KRmJsaXdidytWdURaQXVBb1VOMVBtcEdDdGViSzN0SWdGRENIRTV1?=
 =?utf-8?B?ZjEwQnJxTlFxb1Z1M0YyVnJhaDdrcVFpUVdrTkdWV2hST3JCdFdSN1Z0T1RY?=
 =?utf-8?B?Y2d5YWU2YzhjLzk4MUJ5VjVpQ01CSVZjVWhIRVlkMnJQM2pvMjdYVkNoWW1G?=
 =?utf-8?B?ZFhqZllydExVY29HNTFGL2MwNWFYZXBLbVFoc2gvYXJCSWFIdEdLS1BDT1Bk?=
 =?utf-8?B?dmc2UUpLZU9sMDFVckpEekNmRHpTWGdpOSswbTJmUzFjTEZjTmlaRXJ2KzRH?=
 =?utf-8?B?NGVTcXZtVTZWcmNTaTBOL2h0S1pCU0dySVc5SWk3RDZ1Z3ZvZ3FFSGFlSEUz?=
 =?utf-8?B?ZldyQWNZR050b0V5SmJOVXBRQzBRYnlIaUZCRXFaZnZZVG0vNlVNKzFyOWxq?=
 =?utf-8?Q?aozr21pEz1EKPeHFJVWv++Kyq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affbc1d5-ccff-442b-942c-08db9f96edf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 02:57:58.8684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4MNwWdIBkr9QgUWJm0En5mf1UWeJzJE29nKLG2ox+PmyZ7tR9vrOMcP5rvE0fcCHUAJ+X2MolWv41WupJfh7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8758
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgQXVndXN0IDE2LCAyMDIzIDU6NTIgUE0NCj4gDQo+IE9sZCBnY2Mgd29uJ3QgY29wZSB3aXRo
IGluaXRpYWxpemVycyBpbnZvbHZpbmcgdW5uYW1lZCBzdHJ1Y3QvdW5pb24NCj4gZmllbGRzLg0K
PiANCj4gRml4ZXM6IDNlMDMzMTcyYjAyNSAoIng4Ni9pb21tdTogcGFzcyBmdWxsIElPLUFQSUMg
UlRFIGZvciByZW1hcHBpbmcgdGFibGUNCj4gdXBkYXRlIikNCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K

