Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F6655FAD4
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 10:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357637.586310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6TGk-0005c2-1H; Wed, 29 Jun 2022 08:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357637.586310; Wed, 29 Jun 2022 08:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6TGj-0005Zi-Tt; Wed, 29 Jun 2022 08:41:53 +0000
Received: by outflank-mailman (input) for mailman id 357637;
 Wed, 29 Jun 2022 08:41:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wio=XE=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1o6TGh-0005ZX-OY
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 08:41:52 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ff5b620-f787-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 10:41:49 +0200 (CEST)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 01:41:46 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2022 01:41:46 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 29 Jun 2022 01:41:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 29 Jun 2022 01:41:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 29 Jun 2022 01:41:45 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM5PR11MB1866.namprd11.prod.outlook.com (2603:10b6:3:10a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 08:41:43 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 08:41:43 +0000
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
X-Inumbo-ID: 4ff5b620-f787-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656492109; x=1688028109;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qlsxLao+V3cC2goOMLRBxrzRBta+ns0IcM4LT8E+mWU=;
  b=X1kb4DphF5KvESLQ1JArIx7UG8vnKIPKD0r196e3BYOSlmh25VmAIegS
   qFvaFMuIrMX2pUp0t+EtTVR3aZxd8MeT5N40NzuG9KxJVNIZBGzKFXTa6
   Dj/jZcTz4l/NDU9sL8s8C8KjEUsI2SNqT3QH1/i8lJPiLeqROY4ScEUJB
   Yz35PZHlBdYyyeK13roUSJ2TcFUO6iS7JWv4ajxyVr2VSYUD2i2DMk/QB
   +48GqOEFQQ4QjbOeuLvyt2ptguE5R6ZvO7sYbtr7v/FEA7/e1EE7qHyL0
   nm90/dopKkA5kvPWO8rg0sf0LqVRpf0SdrhvJNfVCYpxKod1w1HQveSqN
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="345965015"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="345965015"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="693486234"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPHutFDV+4hA3SZ1joVKSXAyoh/Ik7o+UTol+wOb2BUe5nlN/iRARafU7OrqMvWIn45gY574+InLu1775dZ7kXnoPtMZXR55HiZDlys2DKUWMoC73yEkOIUKAimDbIEG+MEV/L+XtN81tpTSM/hJsE4x9ZFRBcNnPKVnIu9kbKYFHZcm5evuQTs6QK3pGw9nlDFUw6soklVXUL3I0iPiuTFZ7pVgzfwJyKGOfMEyppuEXK/1L4DqNn4JA0Nx8gXnf9iVhY4aRAa0MA43BIu9Ei77Ip4OHwZb+poPfqG+uBAnZapjMtRASC0v8PGgOR+YsuCHMd2BEuUps77Rts/zKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlsxLao+V3cC2goOMLRBxrzRBta+ns0IcM4LT8E+mWU=;
 b=IbdYKT7DvCtX2c502lJ4gc69TFdOo8KtW5tjqkSkK0FbTgWQ9LKs5q7ANde/59U1u1c8sWDDDG2Vh3cDhe+A57StUU3aNJJNdtYEfzRmT2n+WmPPQGBYGxSqr2s0vpKC2xW+7BpK+JAOQZPaEBVEREhRlFBzylYHPtyY+tCTz5LLWSFqMoXF/L/DBwTVxTek2hdQxJEPrXDBgxyMX2EhEve7aZ7m7rxXyemILQtwPrcCfLH2q+sAntdqKwHdVr4fdK7wKGASIbIcfLdXC1nY+CaRDDp3OXqC7RxrH9fKzwqnLwH/wZrNOX2HFUJ3tnjzEGQT4wGkK9FKW9cpwnpbbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "Beulich, Jan" <JBeulich@suse.com>, "Cooper,
 Andrew" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH] x86/ept: fix shattering of special pages
Thread-Topic: [PATCH] x86/ept: fix shattering of special pages
Thread-Index: AQHYig0A8+iuyC//Bk2PKQQEd7+3W61mDnbA
Date: Wed, 29 Jun 2022 08:41:43 +0000
Message-ID: <BN9PR11MB527685F117AAA3C1716A41EF8CBB9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220627100119.55363-1-roger.pau@citrix.com>
In-Reply-To: <20220627100119.55363-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8caf0d6f-708e-450b-0615-08da59ab319b
x-ms-traffictypediagnostic: DM5PR11MB1866:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HNmX/dLayhn/UGRmRnHJilvDUreE5aYIwHJel4JIgdVkH8YHfQEarydCt8wUo9Ai+9jh/JuH/xMjQ2FXT/t/nTZCl/OJDFC522QNZEdLGwEIQTxd7h+D5jUYelezoL+XQJCawWKcV4g7nZwuUtYpFhlmhoZvQUBsengjtlH9xtqE6J7Cc1J3w23u9QtuDHQlA1xfTSfJjnwINr49JS1WUubiDtSxrNskUQNNMEVPa6zmzBN5hR2mzVlE/TK7GlLjz+z6sQZ1CT+hVTQ15shNzIa4QqmtlO3kcXb0Brix5m+NnQwAYEOIM632Be1a1Rhua5oQVcFyGI7/jLDGDdqqH2HJ7UvbWnnLe/923IohdULAtvRI2sIepLozMFZFIALiumwdXSbZ3vZ8rCqbmLGs9OWJ2bWMq9xgZl/VTkwuwiF/ccpKJCzwBri9f7ROK8H7zfQydjnA7yPPA+2tRjJBgLatD6EUlCisaO/5M0sA4zEczfhZp00T9kvPnUhfD01eH2FmZ8MDL8LYji+T2ekB/BiBZWcQ0MLAc1ch271EBjKMlsVLjxWahl2jKRszsRo1SBZvtYLKOfCNQ/fz0mRIae3qVkb2smP9jep9uYZOmSV0fpXYoi7rgD+lQJzhIx0Zxo9vwyXBkMjY9gr3yyDw6z+jpGQLPH/n9EEGqUqWx0gLx+Vjqq3EaXsyjk7VKDW9hR9ulR2gvODT3z2qe7aqXUfNr25hnm37xTSTYd3EuFdQji2fYgBPLW6x8lTatRNbY46MxhQwZGUdr2aEtDZ1xDt7Ix1lvOVTNXYLChKt9R5vmETDnK68cgDJaBJjE3YwHlpRoXKQT1Xey3PFQT1X5y3tf+lPVwNrhZqPXjVFfTSilzh2IcZkt1n9JSOmpjs1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(366004)(376002)(39860400002)(66476007)(66446008)(66556008)(122000001)(478600001)(186003)(66946007)(6506007)(26005)(38100700002)(8936002)(71200400001)(41300700001)(4326008)(64756008)(76116006)(966005)(9686003)(86362001)(8676002)(38070700005)(82960400001)(316002)(54906003)(55016003)(7696005)(110136005)(2906002)(52536014)(5660300002)(83380400001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmZET2ZtM3lHTGtNLytEbGpkaEt0OW9WSlJzSWlSdjU2RTlIbUUxczVta0gw?=
 =?utf-8?B?d1diOHpCWXQ1KzFYV1o2R0xySDNPbHdoRm9Lb2NiKzhqYXhNMHF1K2tVejVB?=
 =?utf-8?B?em9xVHQ4bm04bkdEbjh3TXVhRXRCam9RMmh0TEhOcWNPSHVMa1dFd2tRTS9R?=
 =?utf-8?B?T2M2N2hZZnMzZHhYSEhyTWRyWmFWNnZFWWZSZ1Z1Mk02dmJXc1ZHbjEvRmdZ?=
 =?utf-8?B?bXdXWFJ6NjQxSVR3cnAwWHhEVS8rV25tYzZ2R1BlUUQxdmk2UWI3REg0K1lH?=
 =?utf-8?B?Ump4SzFnMFExdEtvY3NBb1F1ZXQ2OWs5YU5HYTRra3JNS3U2UHFzcURYZ1Bl?=
 =?utf-8?B?Y0hvamNLcUVDcWJGems0bnVXNTlyRjQrVTgxdHAvV0dHMjBzd0ZSRm1JSzBD?=
 =?utf-8?B?U2Ntd0hyaEtOMktUMjFwMWl2WWNBeFFacklSaTg5M21xTlY5elBqYUtFMnVN?=
 =?utf-8?B?RWRNZVdjWk9sMC90VzhnQU1ueWdDY1NNZXBHc0hSbVo0TFpyMXNrNDYrMkFu?=
 =?utf-8?B?d2E1WGZrV1ZoRk81eG5pZy9HMFVRS1A5YTRZUXV6bTB5Ri91Nk9NSE9wWEx3?=
 =?utf-8?B?dXcrSVh3c2FYMXBFQVZESnBycmpBWWRZUStzbHcxQmJrQWZ3OElrMEpPOC9y?=
 =?utf-8?B?NUZhVmxJWEMyUkdnS292SkNOR3ZHaUJsWTM2dVkzMnZKZ1BXVnNwZ0I1TDdi?=
 =?utf-8?B?bDBpVVN4UFlXS1pJWTRsZjRoSGtES25VSUtrK0RQbDU0MGIrZFBGNkc1aVdM?=
 =?utf-8?B?NlBVeTNzQmNaRXJzOGNoZ1cwS3ZFQ2VsQkxqNGF0NXNKeUM5Zlkyd1JFU3JC?=
 =?utf-8?B?emhPSnZmeFVOMzlQMWZnWSt5WEw5dUk3eXZ2OTZQcXprdG5ENDZEeDViWnUy?=
 =?utf-8?B?VmNLUnNmMldIYi9EUVY3WEJKalVXemZiNHA0L25Jb05ROUdlV3VSY050QXhs?=
 =?utf-8?B?ZU4vNXVKbWNIYjcxN1VLeVA3QW5lN1hxR25ibHJ0bDY1b0ZLakhJSkFhUFZP?=
 =?utf-8?B?NEdIbk1GeStZYjdKR21aY0dhN0VoT2g5WVVZRkRNOWFtbHBxWHZmcWM0bjdK?=
 =?utf-8?B?MVNzSzd2VGZZeWFTOFB3NlVTNHIzMklXQ2RVWkEyYVpMRnM1dGxnTWlpaVZ4?=
 =?utf-8?B?c1B6K1lpejFYMmlNYk15dHVkM083WUVLRDdSaUVUQXgyVVNSV0dHcEpINlpa?=
 =?utf-8?B?ZGprcFdXanNxR3BLaHFrU25IWDRRb1FnTE1hMU12NlJLVERuaTNtZjl4OE9K?=
 =?utf-8?B?U1EvTmZsNndFWXBNN2JpakR5dndTY2dldFRwdWsxcUlHdlUzNGl0TDBMY3Nj?=
 =?utf-8?B?UmJrbWRGa2gvTmlsUEpubFVLTW1mSEkwSTViYTZIUkM2aU5zN0tTajZubGZ5?=
 =?utf-8?B?cGczOGlFcUtpb3h2Skl6blgreUxMQy9weGJGWU9YS0FsZVFFY3ludk9xZDFC?=
 =?utf-8?B?cjlrVk1yN09PUWNJREVvcG8rbTNlKzg1R2dxdGtVOEZ6a3Y4TXI5bmtjcUhr?=
 =?utf-8?B?SGh4bDFFWmxZenVhM0Zjbm8vOUNzc05tQWx4TnE3aVo2Yk00dG5hZnlZcnJy?=
 =?utf-8?B?enpKSVFKeEtwZmI4QllyVlFwSTYrbW4yQW5hQ3dvUytIWm9tcG0vQXNZbU5o?=
 =?utf-8?B?RmpLaTZ1VEtiYmNHVUc4RDl1di8xMFBYUjV1bzNPY0cxc0s4OGF6Y1pITlFm?=
 =?utf-8?B?QTdFbSttVWxxSTM0aDE0UjFiYmxmaEw3VHdma3RrSnRNaEF3WmZaZmFuSXFV?=
 =?utf-8?B?bjB2SFl4ZGRlUHg2bjk5dzdER0hIVVZKWkVkRG1OZDVMNmpTRDkrL3RidWJO?=
 =?utf-8?B?dWtUa0NqR0UvaHh3aHFROWQrMWFhM0VOMG5FWjB5ekFTanl6MitjcVRtSXpm?=
 =?utf-8?B?RDVnbFJXRiszYTVVUkEzQVNlZnJjV1gxRFIrcHlLMlpGNVBQaE5xSVR6aUFv?=
 =?utf-8?B?cTNBem4ySC92M1F1dGRpdzlBTC9xU0pCbllFdEhnVC96L2hHeFBZd0x3TG5V?=
 =?utf-8?B?RDMxbnVHbWNqY1JjWElsMlpLTkhSUFUwdlEwQXMwWHdhWVNMNVM1eWhqeC94?=
 =?utf-8?B?dlJod3VkdjFlZzJmZm9IR05OcE16WmFaYW53bkdKNjJKaUFBQ29WRnQyVUl5?=
 =?utf-8?Q?psP3FcJYLd0t6w4ZpU1I6/njW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8caf0d6f-708e-450b-0615-08da59ab319b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 08:41:43.2869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IAKrQfESKdEFl10rA0BoVqTgEiNnKhx2l2rTjrp+j5cXeTzRO9Tb94mPvB7R83twQua4MqNRn1NzD8lXmG9OlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1866
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBN
b25kYXksIEp1bmUgMjcsIDIwMjIgNjowMSBQTQ0KPiANCj4gVGhlIGN1cnJlbnQgbG9naWMgaW4g
ZXB0ZV9nZXRfZW50cnlfZW10KCkgd2lsbCBzcGxpdCBhbnkgcGFnZSBtYXJrZWQNCj4gYXMgc3Bl
Y2lhbCB3aXRoIG9yZGVyIGdyZWF0ZXIgdGhhbiB6ZXJvLCB3aXRob3V0IGNoZWNraW5nIHdoZXRo
ZXIgdGhlDQo+IHN1cGVyIHBhZ2UgaXMgYWxsIHNwZWNpYWwuDQo+IA0KPiBGaXggdGhpcyBieSBv
bmx5IHNwbGl0dGluZyB0aGUgcGFnZSBvbmx5IGlmIGl0J3Mgbm90IGFsbCBtYXJrZWQgYXMNCj4g
c3BlY2lhbCwgaW4gb3JkZXIgdG8gcHJldmVudCB1bm5lZWRlZCBzdXBlciBwYWdlIHNodXR0ZXJp
bmcuDQo+IA0KPiBGaXhlczogY2EyNGIyZmZkYiAoJ3g4Ni9odm06IHNldCAnaXBhdCcgaW4gRVBU
IGZvciBzcGVjaWFsIHBhZ2VzJykNCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDYzogUGF1bCBEdXJyYW50IDxwYXVsQHhl
bi5vcmc+DQo+IC0tLQ0KPiBJdCB3b3VsZCBzZWVtIHdlaXJkIHRvIG1lIHRvIGhhdmUgYSBzdXBl
ciBwYWdlIGVudHJ5IGluIEVQVCB3aXRoDQo+IHJhbmdlcyBtYXJrZWQgYXMgc3BlY2lhbCBhbmQg
bm90IHRoZSBmdWxsIHBhZ2UuICBJIGd1ZXNzIGl0J3MgYmV0dGVyDQo+IHRvIGJlIHNhZmUsIGJ1
dCBJIGRvbid0IHNlZSBhbiBzY2VuYXJpbyB3aGVyZSB3ZSBjb3VsZCBlbmQgdXAgaW4gdGhhdA0K
PiBzaXR1YXRpb24uDQo+IA0KPiBJJ3ZlIGJlZW4gdHJ5aW5nIHRvIGZpbmQgYSBjbGFyaWZpY2F0
aW9uIGluIHRoZSBvcmlnaW5hbCBwYXRjaA0KPiBzdWJtaXNzaW9uIGFib3V0IGhvdyBpdCdzIHBv
c3NpYmxlIHRvIGhhdmUgc3VjaCBzdXBlciBwYWdlIEVQVCBlbnRyeSwNCj4gYnV0IGhhdmVuJ3Qg
YmVlbiBhYmxlIHRvIGZpbmQgYW55IGp1c3RpZmljYXRpb24uDQo+IA0KPiBNaWdodCBiZSBuaWNl
IHRvIGV4cGFuZCB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgdG8gd2h5IGl0J3MgcG9zc2libGUgdG8N
Cj4gaGF2ZSBzdWNoIG1peGVkIHN1cGVyIHBhZ2UgZW50cmllcyB0aGF0IHdvdWxkIG5lZWQgc3Bs
aXR0aW5nLg0KDQpIZXJlIGlzIHdoYXQgSSBkaWcgb3V0Lg0KDQpXaGVuIHJldmlld2luZyB2MSBv
ZiBhZGRpbmcgc3BlY2lhbCBwYWdlIGNoZWNrLCBKYW4gc3VnZ2VzdGVkDQp0aGF0IEFQSUMgYWNj
ZXNzIHBhZ2Ugd2FzIGFsc28gY292ZXJlZCBoZW5jZSB0aGUgb2xkIGxvZ2ljIGZvciBBUElDDQph
Y2Nlc3MgcGFnZSBjYW4gYmUgcmVtb3ZlZC4gWzFdDQoNClRoZW4gd2hlbiByZXZpZXdpbmcgdjIg
aGUgZm91bmQgdGhhdCB0aGUgb3JkZXIgY2hlY2sgaW4gcmVtb3ZlZA0KbG9naWMgd2FzIG5vdCBj
YXJyaWVkIHRvIHRoZSBuZXcgY2hlY2sgb24gc3BlY2lhbCBwYWdlLiBbMl0gDQoNClRoZSBvcmln
aW5hbCBvcmRlciBjaGVjayBpbiBvbGQgQVBJQyBhY2Nlc3MgbG9naWMgY2FtZSBmcm9tOg0KDQpj
b21taXQgMTI2MDE4ZjJhY2Q1NDE2NDM0NzQ3NDIzZTYxYTQ2OTAxMDhiOWRjOQ0KQXV0aG9yOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpEYXRlOiAgIEZyaSBNYXkgMiAxMDo0ODo0
OCAyMDE0ICswMjAwDQoNCiAgICB4ODYvRVBUOiBjb25zaWRlciBwYWdlIG9yZGVyIHdoZW4gY2hl
Y2tpbmcgZm9yIEFQSUMgTUZODQoNCiAgICBUaGlzIHdhcyBvdmVybG9va2VkIGluIDNkOTBkNmU2
ICgieDg2L0VQVDogc3BsaXQgc3VwZXIgcGFnZXMgdXBvbg0KICAgIG1pc21hdGNoaW5nIG1lbW9y
eSB0eXBlcyIpLg0KDQogICAgU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KICAgIEFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4N
CiAgICBSZXZpZXdlZC1ieTogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+DQoNCkkgc3VwcG9zZSBK
YW4gbWF5IGFjdHVhbGx5IGZpbmQgc3VjaCBtaXhlZCBzdXBlciBwYWdlIGVudHJ5IGNhc2UNCnRv
IGJyaW5nIHRoaXMgZml4IGluLg0KDQpOb3Qgc3VyZSB3aGV0aGVyIEphbiBzdGlsbCByZW1lbWJl
ciB0aGUgaGlzdG9yeS4NCg0KWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMC0wNy9tc2cwMTY0OC5odG1sDQpbMl0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsL2E0ODU2YzMzLThiYjAtNGFmYS1jYzcxLTNhZjRjMjI5YmMyN0BzdXNl
LmNvbS8NCg0KPiAtLS0NCj4gIHhlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgfCAyMCArKysrKysr
KysrKy0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYyBi
L3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMNCj4gaW5kZXggYjA0Y2E2ZGJlOC4uYjQ5MTliYWQ1
MSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYw0KPiArKysgYi94ZW4v
YXJjaC94ODYvbW0vcDJtLWVwdC5jDQo+IEBAIC00OTEsNyArNDkxLDcgQEAgaW50IGVwdGVfZ2V0
X2VudHJ5X2VtdChzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sDQo+IG1mbl90IG1mbiwNCj4g
IHsNCj4gICAgICBpbnQgZ210cnJfbXR5cGUsIGhtdHJyX210eXBlOw0KPiAgICAgIHN0cnVjdCB2
Y3B1ICp2ID0gY3VycmVudDsNCj4gLSAgICB1bnNpZ25lZCBsb25nIGk7DQo+ICsgICAgdW5zaWdu
ZWQgbG9uZyBpLCBzcGVjaWFsX3BnczsNCj4gDQo+ICAgICAgKmlwYXQgPSBmYWxzZTsNCj4gDQo+
IEBAIC01MjUsMTUgKzUyNSwxNyBAQCBpbnQgZXB0ZV9nZXRfZW50cnlfZW10KHN0cnVjdCBkb21h
aW4gKmQsIGdmbl90DQo+IGdmbiwgbWZuX3QgbWZuLA0KPiAgICAgICAgICByZXR1cm4gTVRSUl9U
WVBFX1dSQkFDSzsNCj4gICAgICB9DQo+IA0KPiAtICAgIGZvciAoIGkgPSAwOyBpIDwgKDF1bCA8
PCBvcmRlcik7IGkrKyApDQo+IC0gICAgew0KPiArICAgIGZvciAoIHNwZWNpYWxfcGdzID0gaSA9
IDA7IGkgPCAoMXVsIDw8IG9yZGVyKTsgaSsrICkNCj4gICAgICAgICAgaWYgKCBpc19zcGVjaWFs
X3BhZ2UobWZuX3RvX3BhZ2UobWZuX2FkZChtZm4sIGkpKSkgKQ0KPiAtICAgICAgICB7DQo+IC0g
ICAgICAgICAgICBpZiAoIG9yZGVyICkNCj4gLSAgICAgICAgICAgICAgICByZXR1cm4gLTE7DQo+
IC0gICAgICAgICAgICAqaXBhdCA9IHRydWU7DQo+IC0gICAgICAgICAgICByZXR1cm4gTVRSUl9U
WVBFX1dSQkFDSzsNCj4gLSAgICAgICAgfQ0KPiArICAgICAgICAgICAgc3BlY2lhbF9wZ3MrKzsN
Cj4gKw0KPiArICAgIGlmICggc3BlY2lhbF9wZ3MgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgaWYg
KCBzcGVjaWFsX3BncyAhPSAoMXVsIDw8IG9yZGVyKSApDQo+ICsgICAgICAgICAgICByZXR1cm4g
LTE7DQo+ICsNCj4gKyAgICAgICAgKmlwYXQgPSB0cnVlOw0KPiArICAgICAgICByZXR1cm4gTVRS
Ul9UWVBFX1dSQkFDSzsNCg0KRGlkIHlvdSBhY3R1YWxseSBvYnNlcnZlIGFuIGltcGFjdCB3L28g
dGhpcyBmaXg/IA0KDQo+ICAgICAgfQ0KPiANCj4gICAgICBzd2l0Y2ggKCB0eXBlICkNCj4gLS0N
Cj4gMi4zNi4xDQoNCg==

