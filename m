Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D327D0F1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 16:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.219.529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNGTf-0001Qg-Rl; Tue, 29 Sep 2020 14:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219.529; Tue, 29 Sep 2020 14:19:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNGTf-0001QH-OO; Tue, 29 Sep 2020 14:19:35 +0000
Received: by outflank-mailman (input) for mailman id 219;
 Tue, 29 Sep 2020 14:19:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJ8X=DG=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1kNGTe-0001QC-DI
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 14:19:34 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 905655a5-b359-4a10-8abb-e66cace927a2;
 Tue, 29 Sep 2020 14:19:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 07:19:26 -0700
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga005.jf.intel.com with ESMTP; 29 Sep 2020 07:19:25 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 07:19:25 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 07:19:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Sep 2020 07:19:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 29 Sep 2020 07:19:22 -0700
Received: from CY4PR11MB0056.namprd11.prod.outlook.com (2603:10b6:910:7c::30)
 by CY4PR11MB1637.namprd11.prod.outlook.com (2603:10b6:910:d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Tue, 29 Sep
 2020 14:19:18 +0000
Received: from CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::d8a4:c8e2:c60f:60fa]) by CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::d8a4:c8e2:c60f:60fa%7]) with mapi id 15.20.3326.030; Tue, 29 Sep 2020
 14:19:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mJ8X=DG=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
	id 1kNGTe-0001QC-DI
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 14:19:34 +0000
X-Inumbo-ID: 905655a5-b359-4a10-8abb-e66cace927a2
Received: from mga11.intel.com (unknown [192.55.52.93])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 905655a5-b359-4a10-8abb-e66cace927a2;
	Tue, 29 Sep 2020 14:19:31 +0000 (UTC)
IronPort-SDR: LlkqAPuAstfyz2ZdLaCYOo0oT50rowa3JR1RdD4E9M7SiaMrBhaQnyryKB4LbR40a+iK99ILlh
 kOZvNKemdkAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="159528304"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="159528304"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 07:19:26 -0700
IronPort-SDR: BrbYVpTdctWL8dmbT+B5pvJmETtBHUrPLzr9qQ986yOOY0t494HsFcA3Y96IjioeVzP7EIkK34
 4ZOm7VIjti3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="491470654"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by orsmga005.jf.intel.com with ESMTP; 29 Sep 2020 07:19:25 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 07:19:25 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 07:19:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Sep 2020 07:19:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 29 Sep 2020 07:19:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIxOIDuNZJRtYbe7kCnx3UyJ8UaQeCOLPhp6M0oTWvH0EyluONnDxLMinEnvdkQir78hN2I+4Ub7MM0SOmzM1WPikkH18OIV09KpA76SBvyYd71j6NyaztTIaCj5sLKW/n9R5jzJSqRikKKWec4QX2brVb54VXE6el8ma21VF8LHeOhnGJRLTr8Mfkv8VPYxR6+DmT8ObGtg5pK4h/p+FvWP91AwWQzlZhCgrFgV+JhmA6mbEgzdcIR+JNnAW/FExc6+r2iiomhhf9dU8JbKDdHOAHyP+ddTXTNzVKhREgWyrj5Nj7b9U6LL6xmfdeZk2mb7/B/bdzdg4+ljCIxFmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUOKBx2d26jY6f5sRICHs0T+TQTjX57au9P4KC7SYiA=;
 b=H6wTfk4uyBIXou/XQjNGXeV9uFytSJsQtM0bPedByp5ORcY74073Qk3FHvgdP28Bz/jWoVCNZzQCin6XgwhnLxHcS3UhziYBV78+xMP+DRKImvYPOeC5Qv5PoKP5TipXNyU7DAPhx8pOfCuDgk5U2494rNsfTTEyXZkrqwkKUKQ59nu4zlqpSiWCT4gCQWM4xe+FM1PTh4rh0KmzOz4/bs/bnAPhOmSNEYXYHkD+lOljqZAalIzSEGv7Pw1I9FkGaBzQCQNzmRfRsApxDevkg79z91b+7wPr1i30PzDlnMeLbIt+EJyuXDBvIacHwI9P0nAO05RoEIuKzYSLkU7Hnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUOKBx2d26jY6f5sRICHs0T+TQTjX57au9P4KC7SYiA=;
 b=b7zbQSno0ryd0TtWMjNai05hM5CPw4YL6mAN1+1VrCFUfqM1LFhgdCaY/ClVoerYojfsOJS/ArlhBcj+CBcM0YfpQugoiMrW4i2Vx/8wjv8Pwrd6xfp9TY7wnfeUTzReOa04R1TjysMfCTImPxuquy9An/fjzL4F95DqObADO5A=
Received: from CY4PR11MB0056.namprd11.prod.outlook.com (2603:10b6:910:7c::30)
 by CY4PR11MB1637.namprd11.prod.outlook.com (2603:10b6:910:d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Tue, 29 Sep
 2020 14:19:18 +0000
Received: from CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::d8a4:c8e2:c60f:60fa]) by CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::d8a4:c8e2:c60f:60fa%7]) with mapi id 15.20.3326.030; Tue, 29 Sep 2020
 14:19:18 +0000
From: "Lengyel, Tamas" <tamas.lengyel@intel.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
CC: "paul@xen.org" <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v9 0/8] domain context infrastructure
Thread-Topic: [PATCH v9 0/8] domain context infrastructure
Thread-Index: AQHWknRuHXFGg/c6C0CkM2JZfSFRjal4LpeAgAEhBgCABM4f0IABaTIQgAAF3gCAAAFPkIAAIaAA
Date: Tue, 29 Sep 2020 14:19:18 +0000
Message-ID: <CY4PR11MB0056077E928E737F8A9295BAFB320@CY4PR11MB0056.namprd11.prod.outlook.com>
References: <20200924131030.1876-1-paul@xen.org>
 <CY4PR11MB0056034DE1EE8445CE816494FB390@CY4PR11MB0056.namprd11.prod.outlook.com>
 <001301d6933a$4409fda0$cc1df8e0$@xen.org>
 <CY4PR11MB005625159210BF9EBF024135FB350@CY4PR11MB0056.namprd11.prod.outlook.com>
 <95e044b74cd545d984ec92e1d385d336@EX13D32EUC003.ant.amazon.com>
 <CABfawhm1prNdjAatv=kVvR=n=DqvJ=x85U_8bBdoW_CoL5w2CA@mail.gmail.com>
 <86d27d8a28d741d1bdc8c76b2b36598b@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <86d27d8a28d741d1bdc8c76b2b36598b@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: amazon.co.uk; dkim=none (message not signed)
 header.d=none;amazon.co.uk; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.119.195.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aec24914-a3ae-48c4-df56-08d86482a744
x-ms-traffictypediagnostic: CY4PR11MB1637:
x-microsoft-antispam-prvs: <CY4PR11MB1637C87D1A072F6B51609DE6FB320@CY4PR11MB1637.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rxPJLvJaFf++5fpdNwipZ71LwhPJFUibS2Em6rFEYO6dduCnF6gsf+WNTNWnjFB6e7clTjTvhHKAoQ/NtdVAHFCRljEzBGcD/PPQn3E7QM1mJh8EsZsKP26lsPwefnjs9/M3guyf9sXyeKY7xuat87znThVRC920U6fYDwAMbiOMIyY/fSATtDBhxhzJ2Sa9yARYc0bKX5qcDx+UQ1eloUn6AF4HZSQZVW8F/qszvcnCBFAvO/Kihz2JnpQ7GI2mWQlfQS+x6uEx2lSJStCDUz5QMWaoJsw7pOHJl2Dm5M7qF22zmADjhPCFGpaAkjhtHiTeaYJ9RGpm6h99vqdmJP3kkpSb2vzatqlvRsZ3C8X3VLrBXKNCUV8gLIQSNkqW5vL1uOAnUetX8QT1mmTn3Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0056.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(4326008)(8936002)(6506007)(7696005)(83380400001)(5660300002)(83080400001)(66574015)(478600001)(53546011)(52536014)(66476007)(66556008)(64756008)(66446008)(8676002)(66946007)(2906002)(76116006)(86362001)(7416002)(33656002)(6916009)(966005)(9686003)(186003)(55016002)(71200400001)(54906003)(316002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: QSsegQFl7ZxsuQmzqh3Xa6BO1kWkiv8R9OhZYCeR97A6wdjDgw1FclRnGBhOw55dQvOCJC+QDq+8wpjF5UucZVziaAn4LrzZkdg+0kuzks2CUZTYx2IqHRIYNCZpGx4ik/EmVjbDQETNPSgScELLTNinyhrAAxAbugRuwGUNZivA33y7zpslYKR3wGyap/1w5Yw8+gah92otSnjsmeLBtYv2GA44bsgUQvIg3EzjyoMCHREV3nRsMo4qFwJ6Dw1FX5EFO2XWbKh6jAEUVy/4CQcEpm5KZdepwCbTaRliVPvXgfX3bOnBI1Fpei1X8Z8ocPn31FD95ZZ/yCLQABYuJwQtD8sDo37Ee8NrPaRJVk0tsWg8ZQvTNAJeao84u0OpQjvxF+d6Z6+VyC8sFHGDGBKJftJ/Qn5TFQSR00bZ9xdeAIQaZTpeEz5jllrAlTSrmaSmkXFTIu/fMrCxcSfsPvXtvdMHho2cgYnDIvP0tXVpiqWuEXbR7V49aZDHPs+zvazqHcNJjTQ9OEQEEDBfIJ17JFDfhluAJHOuOSmKiLJBHE5rNjPPtkKjVDdx70C6PIXiB/2dRQRI8YieNJzu7TjC/WfOrHq3PY6Wpe3xxI4Ct3D53vp1kYfMuKS+UBmA2l0vfrQFLyG9bF59ppcKpw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec24914-a3ae-48c4-df56-08d86482a744
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 14:19:18.6980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7vTzYrZk+sUIFsfxLSFP55d5fUtLIUMAGmOkaOK7IN9LwX6CC9LNVp+yHbIiBzGXYcd47oLQ2dWWRpwgoLFKBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1637
X-OriginatorOrg: intel.com

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY28udWs+DQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyOSwgMjAyMCA4
OjE0IEFNDQo+IFRvOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmsubGVuZ3llbEBnbWFpbC5jb20+
DQo+IENjOiBMZW5neWVsLCBUYW1hcyA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+OyBwYXVsQHhl
bi5vcmc7IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ow0KPiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFA
dHljaG8ubnNhLmdvdj47IEdlb3JnZSBEdW5sYXANCj4gPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNv
bT47IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgSmFuDQo+IEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IE1h
cmVrDQo+IE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFi
LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsNCj4gVm9sb2R5bXlyIEJhYmNo
dWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgV2VpIExpdQ0KPiA8d2xAeGVuLm9yZz4N
Cj4gU3ViamVjdDogUkU6IFtQQVRDSCB2OSAwLzhdIGRvbWFpbiBjb250ZXh0IGluZnJhc3RydWN0
dXJlDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogVGFtYXMg
SyBMZW5neWVsIDx0YW1hcy5rLmxlbmd5ZWxAZ21haWwuY29tPg0KPiA+IFNlbnQ6IDI5IFNlcHRl
bWJlciAyMDIwIDEzOjA2DQo+ID4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5j
by51az4NCj4gPiBDYzogTGVuZ3llbCwgVGFtYXMgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPjsg
cGF1bEB4ZW4ub3JnOw0KPiA+IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3
IENvb3Blcg0KPiA+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgRGFuaWVsIERlIEdyYWFm
IDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+Ow0KPiA+IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uDQo+ID4gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBKdWxpZW4NCj4gPiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+OyBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kNCj4gPiA8bWFybWFy
ZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPiA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+Ow0KPiA+IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47
IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+DQo+ID4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF0gW1BB
VENIIHY5IDAvOF0gZG9tYWluIGNvbnRleHQgaW5mcmFzdHJ1Y3R1cmUNCj4gPg0KPiA+IENBVVRJ
T046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlv
bi4gRG8NCj4gPiBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5kDQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4N
Cj4gPg0KPiA+DQo+ID4NCj4gPiBPbiBUdWUsIFNlcCAyOSwgMjAyMCBhdCA3OjU0IEFNIER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gd3JvdGU6DQo+ID4gPg0KPiA+ID4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiBGcm9tOiBMZW5neWVsLCBUYW1h
cyA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+DQo+ID4gPiA+IFNlbnQ6IDI4IFNlcHRlbWJlciAy
MDIwIDE1OjE3DQo+ID4gPiA+IFRvOiBwYXVsQHhlbi5vcmc7IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPiA+ID4gPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNv
LnVrPjsgJ0FuZHJldyBDb29wZXInDQo+ID4gPiA+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgJ0RhbmllbCBEZSBHcmFhZicNCj4gPGRnZGVncmFAdHljaG8ubnNhLmdvdj47ICdHZW9yZ2Ug
RHVubGFwJyA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgJ0lhbg0KPiBKYWNrc29uJw0KPiA+
ID4gPiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47ICdKYW4gQmV1bGljaCcgPGpiZXVsaWNo
QHN1c2UuY29tPjsNCj4gPiA+ID4gJ0p1bGllbiBHcmFsbCcgPGp1bGllbkB4ZW4ub3JnPjsgJ01h
cmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraScNCj4gPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xh
Yi5jb20+OyAnUm9nZXIgUGF1IE1vbm7DqScNCj4gPiA+ID4gPHJvZ2VyLnBhdUBjaXRyaXguY29t
PjsgJ1N0ZWZhbm8gU3RhYmVsbGluaScgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiAnVm9s
b2R5bXlyIEJhYmNodWsnDQo+ID4gPiA+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47ICdX
ZWkgTGl1JyA8d2xAeGVuLm9yZz4NCj4gPiA+ID4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF0gW1BB
VENIIHY5IDAvOF0gZG9tYWluIGNvbnRleHQNCj4gPiA+ID4gaW5mcmFzdHJ1Y3R1cmUNCj4gPiA+
ID4NCj4gPiA+ID4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBv
ZiB0aGUgb3JnYW5pemF0aW9uLg0KPiA+ID4gPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXINCj4gYW5kIGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4g
PiA+IEhpIFBhdWwsDQo+ID4gPiA+ID4gPiBDb3VsZCB5b3UgcHVzaCBhIGdpdCBicmFuY2ggc29t
ZXdoZXJlIGZvciB0aGlzIHNlcmllcz8gSSB3b3VsZA0KPiA+ID4gPiA+ID4gbGlrZSB0byBzZWUg
dGhpcyBiZWluZyBpbnRlZ3JhdGVkIHdpdGggVk0gZm9ya2luZyBhbmQgaWYgaXRzDQo+ID4gPiA+
ID4gPiBub3QgdG9vIG11Y2ggZWZmb3J0IGp1c3QgY3JlYXRlIHRoZSBwYXRjaCBmb3IgdGhhdCBz
byB0aGF0IGl0DQo+ID4gPiA+ID4gPiBjb3VsZCBiZSBhcHBlbmRlZCB0byB0aGUNCj4gPiA+ID4g
PiBzZXJpZXMuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSGkgVGFtYXMsDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiAgIERvbmUuIFNlZQ0KPiA+ID4gPiA+IGh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvcGF1bGR1L3hlbi5naXQ7YT1zaG9ydGwNCj4gPiA+
ID4gPiBvZztoPXJlZnMvaA0KPiA+ID4gPiA+IGVhZHMvZG9tYWluLXNhdmUxNA0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gICBDaGVlcnMsDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAgICAgUGF1bA0KPiA+
ID4gPg0KPiA+ID4gPiBIaSBQYXVsLA0KPiA+ID4gPiBJIGFkZGVkIGEgc21hbGwgcGF0Y2ggdGhh
dCB3b3VsZCBzYXZlICYgbG9hZCB0aGUgUFYgY29udGV4dCBmcm9tDQo+ID4gPiA+IG9uZSBkb21h
aW4gdG8gYW5vdGhlciB0aGF0IHdvdWxkDQo+ID4gYmUNCj4gPiA+ID4gY2FsbGVkIGR1cmluZyBW
TSBmb3JraW5nLiBQbGVhc2UgdGFrZSBhIGxvb2sgYXQNCj4gPiA+ID4NCj4gPiBodHRwczovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVvcGxlL3RrbGVuZ3llbC94ZW4uZ2l0O2E9Y29tbWl0
ZGlmDQo+ID4gZjtoPTE4NDNjYTczMDJlNDE1MzE3ZmRiOWE2M2IzYTQNCj4gPiA+ID4gZDI5YTM4
NWRjNzY2O2hwPTgxNDkyOTZmZGY4MGM3MzcyN2U2MWNlYTZmZTMyNTFhZWNmOGIzMzMuIEkgY2Fs
bGVkDQo+ID4gPiA+IHRoZSBmdW5jdGlvbg0KPiA+IGNvcHlfcHZfZG9tYWluY29udGV4dA0KPiA+
ID4gPiBmb3Igbm93IGFzIHRoYXQgc2VlbWVkIGxpa2UgdGhlIG1vc3QgYXBwcm9wcmlhdGUgZGVz
Y3JpcHRpb24gZm9yDQo+ID4gPiA+IGl0LiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhpcw0KPiA+
IGxvb2tzDQo+ID4gPiA+IGdvb2QgdG8geW91LiBJJ20gc3RpbGwgdGVzdGluZyBpdCBidXQgaWYg
ZXZlcnl0aGluZyBjaGVja3Mgb3V0IGl0DQo+ID4gPiA+IHdvdWxkIGJlIG5pY2UgdG8ganVzdCBh
cHBlbmQNCj4gPiB0aGlzDQo+ID4gPiA+IHBhdGNoIHRvIHlvdXIgc2VyaWVzLg0KPiA+ID4NCj4g
PiA+IEhpIFRhbWFzLA0KPiA+ID4NCj4gPiA+ICAgVGhlIGNvZGUgc3RydWN0dXJlIGFwcGVhcnMg
dG8gYmUgb2suLi4ganVzdCBzb21lIGNvc21ldGljIHR3ZWFrczoNCj4gPiA+DQo+ID4gPiAtIEkg
dGhpbmsgeW91IHNob3VsZCBjYWxsIHRoZSBmdW5jdGlvbiBzaW1wbHkgJ2NvcHlfZG9tYWluY29u
dGV4dCcNCj4gPiA+IGFzIHRoZSBpZGVhIGlzIHRoYXQgYWxsIHN0YXRlDQo+ID4gKGluY2x1ZGlu
ZyB3aGF0IGlzIG5vdyBpbiBodm0gY29udGV4dCkgd2lsbCBiZSBjb25zb2xpZGF0ZWQNCj4gPg0K
PiA+IFN1cmUsIEkgd2Fzbid0IGVudGlyZWx5IGNsZWFyIGFib3V0IHdoZXRoZXIgdGhpcyB3aWxs
IGJlIGxpbWl0ZWQgdG8gUFYNCj4gPiBjb250ZXh0IG9yIGlmIGl0IHdpbGwgZXZlbnR1YWxseSBh
ZGQgdGhlIGh2bSBzdHVmZiB0b28uIFJpZ2h0IG5vdyBJDQo+ID4gc3RpbGwgd291bGQgaGF2ZSB0
byBkbyB0aGF0IHNlcGFyYXRlbHkuDQo+ID4NCj4gPiA+IC0gVGhlIHByZXZhaWxpbmcgc3R5bGUg
aW4gZG9tY3RsLmMgQUZBSUNTIGlzIHRoYXQgYXNzaWdubWVudHMgYXJlDQo+ID4gPiBtb3N0bHkg
bm90IGRvbmUgaW5zaWRlIGlmDQo+ID4gc3RhdGVtZW50cy4gUGVyc29uYWxseSBJIHRoaW5rIHRo
aXMgaXMgYSBnb29kIHRoaW5nLg0KPiA+DQo+ID4gSSB0aGluayBpdCBjdXRzIGRvd24gb24gZnVu
Y3Rpb24gc2l6ZXMgd2hlbiBhbGwgdGhhdCBpcyBiZWluZyBkb25lDQo+ID4gYWZ0ZXIgYW4gYXNz
aWdtZW50IGlzIGEgTlVMTC1jaGVjay4gTm8gbmVlZCBmb3IgYSBzZXBhcmF0ZSBsaW5lIGZvciBp
dA0KPiA+IGJ1dCBJIGFsc28gZG9uJ3QgY2FyZSB0aGF0IG11Y2guIFNvIGlmIGl0J3MgbW9yZSBp
bXBvcnRhbnQgdG8gd2hvZXZlcg0KPiA+IG1haW50YWlucyB0aGlzIHRvIGtlZXAgdGhlIHN0eWxl
IGNvbnNpc3RlbnQgaW4gdGhpcyByZWdhcmQgSSBjYW4NCj4gPiBjaGFuZ2UgaXQuDQo+ID4NCj4g
PiA+DQo+ID4gPiAgIE9uY2UgeW91IGhhdmUgc29tZXRoaW5nIHJlYWR5IHRvIGdvIHRoZW4gSSdk
IGJlIGhhcHB5IHRvIHRhZyBpdA0KPiA+ID4gb250byBteSBzZXJpZXMgaWYgSSBuZWVkIHRvIGRv
IGENCj4gPiB2MTAuLi4gYnV0IEknbSBjdXJyZW50bHkgaG9waW5nIHRoYXQgd29uJ3QgYmUgbmVj
ZXNzYXJ5Lg0KPiA+DQo+ID4gSSB0aGluayBJJ2xsIHdhaXQgdW50aWwgSFZNIGNvbnRleHQgaXMg
aW5jbHVkZWQgaW4gdGhlIGZyYW1ld29yayBhcw0KPiA+IHdlbGwgc28gdGhhdCB3ZSBjYW4ganVz
dCBzd2l0Y2ggb3ZlciBldmVyeXRoaW5nIGF0IG9uY2UuDQo+ID4NCj4gDQo+IEl0IG1heSBiZSBh
IHdoaWxlIGJlZm9yZSBJIGhhdmUgZXZlcnl0aGluZyBtb3ZlZCBvdmVyIHNvIHlvdSBtYXkgc3Rp
bGwgd2FudCB0bw0KPiBnbyBhaGVhZCB3aXRoIHRoaXMgcGF0Y2ggaWYgdGhlIGRlbGF5IGlzIGxp
a2VseSB0byBibG9jayB0aGluZ3MuIEFsc28sIHdpdGhvdXQgdGhpcyBJDQo+IGFzc3VtZSBhbnkg
cmVjb3JkcyBJIHBvcnQgb3ZlciBmcm9tIEhWTSBjb250ZXh0IChhbmQgaGVuY2UgcmVtb3ZlIHRo
ZSBzYXZlDQo+IGNvZGUpIGFyZSBnb2luZyB0byBjYXVzZSBicmVha2FnZSBmb3IgVk0gZm9ya2lu
Zz8NCg0KSWYgeW91IGRvIHJlbW92ZSB0aGUgZXhpc3RpbmcgaHZtX3NhdmUvaHZtX2xvYWQgZnVu
Y3Rpb25zIHRoZW4geWVzLCB0aGF0IHdvdWxkIHByZXR0eSBtdWNoIGJyZWFrIFZNIGZvcmtpbmcg
cmlnaHQgYXdheS4gV2UgdXNlIHRob3NlIGluIGh2bV9jb3B5X2NvbnRleHRfYW5kX3BhcmFtcy4g
U28gaWYgeW91IGRvIG1ha2Ugc2lnbmlmaWNhbnQgY2hhbmdlcyBpbiB0aGVyZSBJIHdvdWxkIGFz
ayB0aGF0IHlvdSBhdCBsZWFzdCBjb21waWxlIHRlc3Qgd2l0aCBDT05GSUdfTUVNX1NIQVJJTkcg
ZW5hYmxlZC4gVGhhdCB3b3VsZCBiZSB0aGUgcG9pbnQgd2hlcmUgd2Ugd291bGQgd2FudCB0byBz
dGFydCB1c2luZyB0aGlzIG5ldyBjb3B5X2RvbWFpbmNvbnRleHQgZnVuY3Rpb24uIFJpZ2h0IG5v
dyBqdXN0IGZvciB0aGUgUFYgc3R1ZmYgaXQncyBub3QgY3JpdGljYWwgYXMgd2UgZG8gY29weSB0
aG9zZSBpbnRlcm5hbGx5IG91cnNlbGYsIGl0IHdvdWxkIGp1c3QgYmUgbmljZXIgdG8gdXNlIHRo
aXMgcGx1bWJpbmcgeW91IGFkZCB0aGF0IHdpbGwgYmUgc2hhcmVkIHdpdGggZG9tYWluIHNhdmUv
cmVzdG9yZS9taWdyYXRlLg0KDQpUYW1hcw0K

