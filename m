Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB6D698B66
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 05:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496342.767035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSVjf-0000E4-Ag; Thu, 16 Feb 2023 04:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496342.767035; Thu, 16 Feb 2023 04:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSVjf-0000B6-7W; Thu, 16 Feb 2023 04:19:07 +0000
Received: by outflank-mailman (input) for mailman id 496342;
 Thu, 16 Feb 2023 04:19:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tkRK=6M=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pSVjd-0000B0-2F
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 04:19:05 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 094c7942-adb1-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 05:19:01 +0100 (CET)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 20:18:58 -0800
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 15 Feb 2023 20:18:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 20:18:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 20:18:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 15 Feb 2023 20:18:57 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY8PR11MB7780.namprd11.prod.outlook.com (2603:10b6:930:78::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 04:18:55 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%8]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 04:18:55 +0000
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
X-Inumbo-ID: 094c7942-adb1-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676521142; x=1708057142;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PYDfitEMywGBaLzakjBxcuWr21VGCwKT4RaKfk9/m60=;
  b=O2jjS892gDwtI4iURZqY5P2x3RIBZ5pLZlCy8QLhkxWGrOd9Xj2f6Idt
   bFaFKNJRK85UzJ0KsHflJA9YKVOtntbRnpxGjrehmDKi/z0A7Tt5efq90
   i50XKhpDGQst1ABQu1ll/zfQeR8Rpr2wwdtvqdMGG0eZBsDZASqoRciXH
   gP7CSOVQW/NDzmmpi7wYB8bMYFMAz7/iUu4fVXGccxG5pQAslcKoSn6fK
   0FfUMqb2wFBi8AJ8Z2JjDAQZHEk2B2IEPEpxS/nmxZL7T66Duy+QkdyqI
   PyyD7pzr2kcdOjwMS1TWCRgrI91OZKQmsFs5qDw8ru2fHyPhGRzz4ZHpL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="315293999"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="315293999"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="793884039"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="793884039"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThAIFuW1HZ6YCFSNob9nDUzHrjDCTEnIVZvTGJx+KojSp9nR5kfZJ21RJ/N250a7veY9v/A4U4XmGNuvVjZAIJgY3hyG0o/AZ4sZNLEw7hRHB6Ki4RTXw0+87i03wp4XoqJqB8efS6iGea6GWD3XhXYVMib+NLi6hAjODOBVFJw9+At1maBGBgwQu4di1/j4zRjVef1VtIgd6v6hDuNJbllVwS0U27k8VLeWnr7TcLrLTs4rMCJea0/l2zyVA4xW/AGBBbdQPa3SP3PAIWRxBsjWe3sGyzjxpi8ykl/e1ghjaaErBaJypdItmJX8W+ebVeMGLWjjFgjJ8Y1+jZb1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYDfitEMywGBaLzakjBxcuWr21VGCwKT4RaKfk9/m60=;
 b=Ye1dbIgLQWCb66/lvaQwZt5sY81erq3LVC9qrYznDuhheC61/0QmGeDAydHHLhKHmvaFbSvpgojC/G3JT4Nr7vr5iYD8sdJLSR95srOGEqxl8VTHvlvmrvOwIV+yUCbv4Y1q5jGs1f9hdS8Eew1wVuXnJAMbPjAPr3PJn/Az0ywSX5UuJExE9ejF3t0/7N/xD91fH/5cbwv6MZqsEAXDdQTn+5ywdF4IOlDY9stZyRnb1xF344u1+8SCSYv07qitOTilTJyoE+8droXFmrIKZU+e7KZWqMEE8m28wPTeMxQqDtbiYZyuDnejQpyppqrmbddv5QOdaN3NlZ2OtnjZpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Beulich, Jan" <JBeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima, Jun"
	<jun.nakajima@intel.com>
Subject: RE: [PATCH v3] x86/vlapic: call vmx_vlapic_msr_changed through an
 hvm_function callback
Thread-Topic: [PATCH v3] x86/vlapic: call vmx_vlapic_msr_changed through an
 hvm_function callback
Thread-Index: AQHZP6FixcPovaFRKk6HAi1Mi8oY2a7Q/Cog
Date: Thu, 16 Feb 2023 04:18:55 +0000
Message-ID: <BN9PR11MB527677D1604F5A08B8D637058CA09@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230213115017.902037-1-burzalodowa@gmail.com>
In-Reply-To: <20230213115017.902037-1-burzalodowa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CY8PR11MB7780:EE_
x-ms-office365-filtering-correlation-id: ac2d166e-9d56-4855-c82f-08db0fd4eaf6
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WY7kO272tbsFQuZJilfYeAjBGElAJH6HQ4BSnB4HGZbDJ1vWwiMVBmmfr+hqs+bsYadc2dzdG7n4tB7HMsbHQKGRxfYJHmyrBrNxLzXfZHmEPATx24qCO4mA54rKYlIQD0+wMDdTT8sA1w9GC7rTqc6J7MTQZMUwDxIaSb5hp/vqQuJ58wgD1BmgYyTxjaSCuGcKrPQj/HGI0KnuS8NgFexrm8GqQUGUVH/WWVc/rTnl5EACywHiLxUabEKNaK3SBMHALsbx4aUO7ZCwcXKtBXl8lT2l9XTuTJvesKn3/uow9KpaQlybj5xsrlxAuLQKm62PWiUqTuZU8qOsF7+Xcp0SKvFNpko1flZDd9aFMjrL2cerI8EsbkwfrKTK3cTcWbjZqU+ppXb/wYXDuibKqRcAMWhaj/9NU4arfKWJit9CHhPTxfRDpblY1flTPaDMfJPGVv1Azpzlkow2akPIwKTPlD4n/DQeGf6hRKJNuxRFE+57pSWYi8GNoeujUWxpUM2Ky0Niw9sHGizJVuxqFQSmncRD8/H0g0HwrXO64A2wgFpN+YFpAt//d7w0zoCCS9iQXVKRnmzrPWb9ByJXBHWNMj9aWN9CjAJHgAxy+QeVkT/IyDuRZYXo48AYxdjFQFVuv8YRAfWg+JSFQ69iVdBU4I1/dcam9lpIvMZMmZL5aoWuusdqGeXFTqmoqzmm6E2faZPO2xxgMqJfYSIeAw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199018)(186003)(6506007)(5660300002)(52536014)(26005)(41300700001)(9686003)(107886003)(122000001)(86362001)(38070700005)(82960400001)(33656002)(38100700002)(8936002)(55016003)(4744005)(2906002)(83380400001)(71200400001)(110136005)(7696005)(316002)(54906003)(478600001)(8676002)(4326008)(64756008)(66476007)(66556008)(66446008)(66946007)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFVFSHNra0VLZmV6b2VZSkdGbldHYzlHRzRQY3crNkZoamd0WHkyUjBTcVhm?=
 =?utf-8?B?UFZ4K3Y3MVBVQ1I2WUdRSHJDMjZCSTZoRVk2ZkQzSXVDMjhhbnlpZndlZ1Vv?=
 =?utf-8?B?WkNaQ3NUTXJEUWtBSjVXSEpYcXNsK08vR0JjYUtTYlZxNG5ydlNxWXNyNVli?=
 =?utf-8?B?a1FXcFFhYXlYWGdyQ2IreXlELzRHS0x2R3dXTmVqbzd4SkFreit6bmlaUXVm?=
 =?utf-8?B?a2Q0cHdadlRZT0dqWWJ4VnRuTS9JSmxwWGtrL21aeGorMXBDS3N0NDJ4Nlhv?=
 =?utf-8?B?U0E2NmwxTVYzVDROSmplZWtSVkd4WWUzN0ZWVHhBMWQvQlpZWnl3NDhvempz?=
 =?utf-8?B?MU1SZkFOemhzakV4andUTXNHNnEzZEFVYkE2MXFLVmJUR0hIV093K0RRRzBH?=
 =?utf-8?B?UHJtVTRncUZhcEdOYUVuZVk5TWNQRnRxbEU1azMxcUkzLzJaanNGZmtSSHNl?=
 =?utf-8?B?eHl2NGxVbW9GU2dYazhvUTFiMlZyZGhIczBXZGNzSVlaaWhPMHJFY09KZzJo?=
 =?utf-8?B?eVhtaEY1emhxTXQvMjJ5aFRRTTZpR1djZlJEaVRydjZJRURFYXY0a3JSNjY0?=
 =?utf-8?B?RUh3VjJaU01BUEtxYU9TU2xmZFJpdlZtS20xUDdpZEdSTTlsbERQSldpRjlI?=
 =?utf-8?B?UVFjb3FiNTFCUW84ZmhpZ25lWTBwRHVJQW1KVXVySTBpUm1LVjNoOWZnTWdZ?=
 =?utf-8?B?Y0JpZnY0Q0g4cXI5RnJyQ3N4eDZKWk11M1FJVXNEeGFNUVVUWkxUVHRERmNQ?=
 =?utf-8?B?aHRLekY0RHpscGRxR1dNa3psWWRwWGhscWdaY2xibVNRWTh4NExUS2ZDT2VQ?=
 =?utf-8?B?TmluQ1FDcFhHUnREU1plZFQ3bjVuZS9DdTAvQU5GNEJOUmlhZDEzMkJnbDIv?=
 =?utf-8?B?ci9XWWtLT1NnaEh6cmtoc1ppczV0cmcvbmdvY2ZSY0prRDV0Rkx1c1A5aHky?=
 =?utf-8?B?MnFGZDY5UEZOQmY3QWcrVGZxMUpIdTRKMEFBVDNUYWI2NWZuZ2Y2aU1SdURI?=
 =?utf-8?B?WEJ5WTFxR083K0ZxY29jNGN2MEpHK0hrZml1em0wbm1ZaHhkWFlhTXd0bXlG?=
 =?utf-8?B?cjJSeW0vczM3WnFMU1JNdkQ3VlkzbU8xS1Q4ZGoxZmFDRSsvbjl1bHJwNjIv?=
 =?utf-8?B?bGp2cEp3MDdRQ1JZb1BLR0xma2Zkc3JPQjFyR0hQc2NkSXpVclVzNkxEemll?=
 =?utf-8?B?SXdoQSs1Vy96UlJzYk5IU21aSE51eVMya3VEd2ZYeDNteG1LR0luaVVOQWdE?=
 =?utf-8?B?QllLOXF1Y0E4aERRNGo0OVF0TzlUbHh3cEZPREhuclRwenhtcmlkcTRVSGkv?=
 =?utf-8?B?K3dML1ZGL2crcURwZy8zTnJKZzdMVjlrRTkveXhQVG81YWpjak9IbVFXR3FT?=
 =?utf-8?B?enR1b2U0RlFQZ2NhS1lVc2pkNENKeHcvbXJ6N01qSGtZZjZxcWNXMUJNUkdD?=
 =?utf-8?B?UDFEVHl3SUF3QVdhK1FqeFUwamlOZXdXWGROQTRBWjBhQlFmRFpkRkVBTTJT?=
 =?utf-8?B?R2taMVVTS1RTQ2xCNmFFbUlueXFvNzFhNmF3Tkc1SllVbFRtK3M4enZhd3pk?=
 =?utf-8?B?bVdJZEUyVEM4YXBnMUdOVUpzUHFOOTg4RmtieVJMNHJsL3FBUXhJRzRubnAr?=
 =?utf-8?B?VVhiOE5iNk5uZFB2YmVTN0FDQlNsdHhjaUdNMHR4MWF6OUFzcEQ0OElUeHpy?=
 =?utf-8?B?c05vRHdKMnpiNXljWHJRblRXRlNWNVoxeXhHdzhpU0ZLajhWS0JqZExNdEsr?=
 =?utf-8?B?SlBScWpkcHhBdlJtdk9hcDFSbWxVMU52MXNiUkJFOFR6NXpqblF1RmpmOFl4?=
 =?utf-8?B?ZVpna0U0a2p6TTh0ck5lUVhnejZsT0szeG56YnpML3pacEYzK0ZjbG9DNEpl?=
 =?utf-8?B?cjVJK3M2dTlZYWRmdlppWWpyeTNNOW96c0xyZWVYWGdKZklYNlJ2T04xZElx?=
 =?utf-8?B?eWg0TXRsWWhIcFYxc2tHbDhiUnB5bStZZU80bVQ2d1lvNjlBYTk3a0tvbUZZ?=
 =?utf-8?B?NEY5WGNzWE5kWTBiVTFsTytSQ2s3M2VaKzJZUW1oNjBSWDk5dXQvVnl4UUNr?=
 =?utf-8?B?ZjNiaUhsd2F1UGJiSXdBdFkzRjBGUTlDVXJyYS9OL3liOVVzZ3RQN20ySy9l?=
 =?utf-8?Q?5N1m3jeEowQsYczECu8KvVDLh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2d166e-9d56-4855-c82f-08db0fd4eaf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 04:18:55.1956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1R8fdEPRWLwV8BO83OJd1/ForBxOSst34awm35u3ejiIa3xknYoLK7dhNkgFX2wKZuc1c8e+xxKXyo7uUwvQkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7780
X-OriginatorOrg: intel.com

PiBGcm9tOiBYZW5pYSBSYWdpYWRha291IDxidXJ6YWxvZG93YUBnbWFpbC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgRmVicnVhcnkgMTMsIDIwMjMgNzo1MCBQTQ0KPiANCj4gQVBJQyB2aXJ0dWFsaXph
dGlvbiBzdXBwb3J0IGlzIGN1cnJlbnRseSBpbXBsZW1lbnRlZCBvbmx5IGZvciBJbnRlbCBWVC14
Lg0KPiBUbyBhaWQgZnV0dXJlIHdvcmsgb24gc2VwYXJhdGluZyBBTUQtViBmcm9tIEludGVsIFZU
LXggY29kZSwgaW5zdGVhZCBvZg0KPiBjYWxsaW5nIGRpcmVjdGx5IHZteF92bGFwaWNfbXNyX2No
YW5nZWQoKSBmcm9tIGNvbW1vbiBodm0gY29kZSwgYWRkIGENCj4gc3R1Yg0KPiB0byB0aGUgaHZt
X2Z1bmN0aW9uX3RhYmxlLCBuYW1lZCB1cGRhdGVfdmxhcGljX21vZGUsIGFuZCBjcmVhdGUgYQ0K
PiB3cmFwcGVyDQo+IGZ1bmN0aW9uLCBjYWxsZWQgaHZtX3ZsYXBpY19tb2RlKCksIHRvIGJlIHVz
ZWQgYnkgY29tbW9uIGh2bSBjb2RlLg0KPiANCj4gQWZ0ZXIgdGhlIGNoYW5nZSBhYm92ZSwgZG8g
bm90IGluY2x1ZGUgaGVhZGVyIGFzbS9odm0vdm14L3ZteC5oIGFzIGl0IGlzDQo+IG5vdCByZXF1
aXJlZCBhbnltb3JlIGFuZCByZXNvbHZlIHN1YnNlcXVlbnQgYnVpbGQgZXJyb3JzIGZvciBpbXBs
aWNpdA0KPiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbnMg4oCYVFJBQ0VfMl9MT05HXzNE4oCZIGFu
ZCDigJhUUkNfUEFSX0xPTkfigJkgYnkNCj4gaW5jbHVkaW5nDQo+IG1pc3NpbmcgYXNtL2h2bS90
cmFjZS5oIGhlYWRlci4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogWGVuaWEgUmFnaWFkYWtvdSA8YnVyemFsb2Rvd2FAZ21haWwuY29t
Pg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=

