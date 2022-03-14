Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FA54D79DD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 05:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289882.491550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTcFX-00064P-HH; Mon, 14 Mar 2022 04:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289882.491550; Mon, 14 Mar 2022 04:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTcFX-000612-CZ; Mon, 14 Mar 2022 04:24:03 +0000
Received: by outflank-mailman (input) for mailman id 289882;
 Mon, 14 Mar 2022 04:24:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NoMf=TZ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nTcFV-00060u-9X
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 04:24:01 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e3ec14f-a34e-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 05:23:57 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 21:23:52 -0700
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga006.fm.intel.com with ESMTP; 13 Mar 2022 21:23:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 13 Mar 2022 21:23:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 13 Mar 2022 21:23:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 13 Mar 2022 21:23:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Sun, 13 Mar 2022 21:23:51 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Mon, 14 Mar
 2022 04:23:45 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 04:23:45 +0000
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
X-Inumbo-ID: 8e3ec14f-a34e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647231837; x=1678767837;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8AKA4c4Ka8ipunDYSfY9LOnlRMe2V6ttdMZH279ybKY=;
  b=nCtWScUiTZxFY8zkE7DlAYk2t9a931Qo6s9wQlIBRf2vtLVf/ooqyf1H
   EypgBAYPOCMjL3up57boYfGiRNMgOfItwwKCJJlnM05nC+SJ9HRQVDFMX
   oh8gYNfPg+ycBTuq8HnLxt9DSwEHDBcaKzq5jm2nqqDcQ69gkFR4kzrNo
   QrlYRo24w9V9KUgzn3UDf6x+u8zYRxIFh0LoH9lH1dzcQtNZINhVUOrt4
   YdjoWzLfDL+xQj15hwHokWOqDwophEfTVC2twYxP4U52rhJa75UI+OVK4
   Lbwi9j7YdQqYvEmmRxaboEC3uk15/n5MxIwgXg7ufFg0wOFSsVE/0b8Gg
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="236534931"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="236534931"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="782534906"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvuXuOPOPorgdOl1iPIsDBS/LXSXyw2D6kT3xVtK++gN+uLdKy2EI/bQkOxe6bzCtaVkBK0fZw98iI6JiYY/5W8ijbvYHvrRZIS3KUVIQodDjYuTQQxcnWczWXG7qGQaFqFYXHl4Re1+9oTFz/H56FOzfULGL2Pnhs7mZzut4CL5z/jdXje1JBwj7/vo65Kd8KjCKym6KSDI4crzZv8Hue21dyXVxMMDCE/FpVCVOscgYE5t6rgUIHLZoKzURS+Fno464eMwPzGC8ciR7+abn3ba7Y0MDvfUUEm4czHo2Uup4oc5qbWyfeZgzz0C1dfCAG3JpdD/i1dIfLsh4VZqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AKA4c4Ka8ipunDYSfY9LOnlRMe2V6ttdMZH279ybKY=;
 b=DAQVb8hY5WXBQJVDPzUBuc+HonvwD27ApQoemtNB4zMQMdO8G3swckLCypY95BzBbojkVwtmYkZUnUFJxusMZSG/FWha9QxzCV8rWEtYlPGwmvDUDBm/zn56etTvJ3Y5a2l6IqrduJhqA+asiZamnPSZF++dKivOMTOrrJRe49+vnX6NQtBMxroB9/esE7YYOZgndc8mWal4CMYND8CtOvPUsvMz1dKOs4epDPNAYUfqJrbqfDaRITzsmCCfuIAtX2LaSQsvjAbkYt5txKgSsW8LILzTLZA9DV3dATlSC4is4YJzXRg6P9pKiyreejFGsg5lSGLCp+oZObx/HQTLXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Beulich,
 Jan" <JBeulich@suse.com>, Paul Durrant <paul@xen.org>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: RE: [PATCH v2] pci/ats: do not allow broken devices to be assigned to
 guests
Thread-Topic: [PATCH v2] pci/ats: do not allow broken devices to be assigned
 to guests
Thread-Index: AQHYKZzUihT7TwO5nUar4zaYDsWnday+Yz/w
Date: Mon, 14 Mar 2022 04:23:45 +0000
Message-ID: <BN9PR11MB527683C2307B5C9D457035A38C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220224163701.89404-1-roger.pau@citrix.com>
In-Reply-To: <20220224163701.89404-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a369562-cb3c-40be-5814-08da05726e0c
x-ms-traffictypediagnostic: DM4PR11MB5293:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM4PR11MB5293C15D95900735FBF5CB178C0F9@DM4PR11MB5293.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KYIAxa0XYRy2E4uzM1qL3CNfgHTxURJpguWaTCT9cEgC8cnrLsaUw52zcvrSd/33Z2yxqxv7loZjLmIO6AdNzrtbZq7oYTUC9DklrfDhyyYiJZXdo/SaXbhGaPdSfttIfmILzGgN/2WhJmhWfHXvJsh47OwiK/Swg1CeHEKdHmdybPZNqGAJk04hvFGWa6wiz5473Hql7ne2wLQtGE75HyqMoIypxrb8S0wQNZzew8p7sclDBx5PggXUPKKVs2yDoIUBVFIjMYL88kCCsrAUuFCdD3myyV8t/m6h/ZavO+VMV7i+d5AEzZvOlOSY01nuQahljYRQdDi/319RoQ4RAaduNiRtH4Ont6UbWJlQc3ua6R/L5KH/NMqQfZxTcJvTcjXXjMZSw4NEF87TNmTJsCKAyBlTgqYDbMloHTt1Yu84gzp4yEymhcbYf/fZIf96arzepPjg1KaPEec3Grm4SPsA3lDuwYTgXCReYKdB+v+/8au0zf9jp3KlT910iA5Y5Vu56dEm6vCPtmnUPFCWdDg+/q9ChxvyL99JYEQzfh71fqLOohjg7Mm7wsnD3uKjWi5M7lShM1neXpgmtwMsfS+m70zNewJEUsmz/d/yZLAP52ySJ2728e+bWtdk9bJwL8M1BqDA52PcwnD08lJixanF74oUIJq4Mc0sL+dHA4xrahlY0ssvGPTn2A/EQCocWLw06FpTv60WUHO4zDw4IQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(64756008)(52536014)(8936002)(38100700002)(66446008)(66476007)(66556008)(66946007)(76116006)(508600001)(7696005)(6506007)(26005)(5660300002)(33656002)(82960400001)(7416002)(186003)(9686003)(122000001)(110136005)(54906003)(71200400001)(2906002)(83380400001)(316002)(8676002)(4326008)(38070700005)(55016003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDJoNEhGREYyRGNiSWRnTW52Njk0K21UR0N4WDg4WHAyTzR2RlRRSFU1UlZF?=
 =?utf-8?B?SWU3R3JWR3N2NlRMTnhYZ3lmU09yMjBXUGZ0ODVFZW9CRlpTdjJaWTB6WTBU?=
 =?utf-8?B?a0srZWxUOGk0ZDR1c2k4bmU2ckk2T0p0bVJWNDlKbU52RElQK1VNOGhneElz?=
 =?utf-8?B?S291c201dS9EV1ViNHd0STUrN1lWSXV2STRaaWt2WFRBU3NrT2JYSk9EK0x3?=
 =?utf-8?B?UFZDYVA4MUl3Nks2MVI1T2RhWmRSRFVqREp6R3BVR1JOS09Vbjd4Z1ZQeVpv?=
 =?utf-8?B?SlJXRDRhSmwrdW9VQXFnMGtyTENreEVTT09SZnNya1VDZHpQOXF5QVhMa0Fi?=
 =?utf-8?B?WmswcVZGMExSSVM0M2Rqeml4RWtsSUFwaDIvMVlraGJtcFFkZjZvTDg1N1c5?=
 =?utf-8?B?TXdlS0E0U05WZFNiakxBeEdjbXRXbFd1WlJVMElvQkp1aTNKczVDOWhhdlVo?=
 =?utf-8?B?SGFzZ21EcVAweFl4NDYwaGJCcjRyREpZU1Z4amZmVkovb3o5cVlyN3hRWVYw?=
 =?utf-8?B?cnNWaDVXZ01lbCtsWkFKUUpmUXo4djZvdXhxTk5BVzAyek5pZTQrZ0k5SHhC?=
 =?utf-8?B?TjVWcU83TEVXeEVkd2JwMkdGaFFXSTFoRnFqTnUzUHJjUGM1VHJwM1RKbTAz?=
 =?utf-8?B?NTBvcTVwU1Rsb0tLN1lCNG10NHVPUVkrNC9wOXJDNEFhdWJSdFJIV1o1N2Ri?=
 =?utf-8?B?cjFVbWZmVDV2Vkcwc1RjQkg3SUtYd1cvbWNGYXJ6OUtvNlB5dk9rRnBQL0FF?=
 =?utf-8?B?d2VubmhBTnlWcER5YUxoRU4wUGRuSHVyZ2lha0FKVGpWSldoZDZBMk9oWUtw?=
 =?utf-8?B?ZGdRSkhGaUNRV0RYc2ZobFEzSWhsdlhKM2RvWGZEazlBWXovY21kL2FZQVpY?=
 =?utf-8?B?TSsybHE1N1FIUll4SG5sWXJMV3JjNWs4dXJKb1hYYU9lMnZvVWpjVlVUZEh1?=
 =?utf-8?B?TTlsMFI2MTJidCtnSC8yblNHd0tYZVdWMW9iRzdRSVRESUFhYkRNYzMyT3R0?=
 =?utf-8?B?dXBnR2YrSDkxeGkzMm02c2l0ZkUvTy8yZ1BqdVhPV1dEVExvdldIWnBUbTVZ?=
 =?utf-8?B?QU9Qa1RLT0gyUU9tOTMxYzM5TzdhcW1wZDE2aDZGemphZkFiSlMvSVh0WUh6?=
 =?utf-8?B?OEZ1dkN4SENYKzhjZEo1Y3ZLK2liSFpOVU5FSnBsWFp4Qk4zOVZqLzQ0ajV1?=
 =?utf-8?B?R3l2REVYQmMrSmVnTVpZME5ha3MzbUxsc0c2U1VjTVlUU0pMeVgyN3pRTnEz?=
 =?utf-8?B?cmlPWkRvS1g0M2tQWEp2cm44VmtwVHFGR0t5VkR6cWRTcmV2b080ZS9qNHRC?=
 =?utf-8?B?Y2RxT0MrL0NJWkFUOGEvZ29DZGI2RkhaYnowY0ZXVVFVZkQzMklWVENqaXM4?=
 =?utf-8?B?YlRsTkl6SUtUd3FDUnhZWW1qQXJINExXa241UXREb3FGaGlEQlg3R1d6RGZk?=
 =?utf-8?B?TGs0T0FnOUdxYWFPZ3hiYWZsNDJIV00xWEpNamVNZHpVZzVtTG1aaW8xTDI4?=
 =?utf-8?B?RTV2S1pyd2xCNlpqT290NFBJa2toVEtwMTBzWWxPRThveXZDUXR2VWFyYXJ5?=
 =?utf-8?B?Q1dUTnZXQmhzVUdPbGhSWHVDWlRUQUYvc1FGZlFsZjlZbFdwMzM1Z3pDTDdr?=
 =?utf-8?B?c3MrcjUweTF5STkrRmUwczNDb0x4STFZTVFodzRMWXhVMFp3cTlkcjJLQVZx?=
 =?utf-8?B?YVBrWDhNcHA3RzhRNk5hRzBuQXpjeFhENVBxdGZhWGVGdVJ2a2pWWkFkekFl?=
 =?utf-8?B?ZGN5ZEkyRFlIVWVxbVJ5cXcxQnFQQnI5VzlqOTRBMy83dElWcTd6UDFOdklk?=
 =?utf-8?B?SWhOWXJrYkxETW9ZOWQzR3d2REFkYWk0L3h2WS9TbGxrS3hLdkNLRVZRTVNZ?=
 =?utf-8?B?NDYyRkJZNG9TQXpJcUFuMExrNytlSmg5VnQzNlJWSXdxdTd1cXJvd3pwV1RD?=
 =?utf-8?Q?Z/y+mq831aNYEpzjPS6NXps5diRpbWkU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a369562-cb3c-40be-5814-08da05726e0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 04:23:45.5810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OaK72UjaUPYHb8wSk3n8XJ3Ok7Jzp8aLfJV/VvYjLCPr0EMqxL5UIFBez2BVgT7v9O3mTOzs7P5EjxTw8Egl5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBG
cmlkYXksIEZlYnJ1YXJ5IDI1LCAyMDIyIDEyOjM3IEFNDQo+IA0KPiBJbnRyb2R1Y2UgYSBuZXcg
ZmllbGQgdG8gbWFyayBkZXZpY2VzIGFzIGJyb2tlbjogaGF2aW5nIGl0IHNldA0KPiBwcmV2ZW50
cyB0aGUgZGV2aWNlIGZyb20gYmVpbmcgYXNzaWduZWQgdG8gZ3Vlc3RzLiBVc2UgdGhlIGZpZWxk
IGluDQo+IG9yZGVyIHRvIG1hcmsgQVRTIGRldmljZXMgdGhhdCBoYXZlIGZhaWxlZCBhIGZsdXNo
IGFzIGJyb2tlbiwgdGh1cw0KPiBwcmV2ZW50aW5nIHRoZW0gdG8gYmUgYXNzaWduZWQgdG8gYW55
IGd1ZXN0Lg0KPiANCj4gVGhpcyBhbGxvd3MgdGhlIGRldmljZSBJT01NVSBjb250ZXh0IGVudHJ5
IHRvIGJlIGNsZWFuZWQgdXAgcHJvcGVybHksDQo+IGFzIGNhbGxpbmcgX3BjaV9oaWRlX2Rldmlj
ZSB3aWxsIGp1c3QgY2hhbmdlIHRoZSBvd25lcnNoaXAgb2YgdGhlDQo+IGRldmljZSwgYnV0IHRo
ZSBJT01NVSBjb250ZXh0IGVudHJ5IG9mIHRoZSBkZXZpY2Ugd291bGQgYmUgbGVmdCBhcy1pcy4N
Cj4gSXQgd291bGQgYWxzbyBsZWFrIGEgRG9tYWluIElELCBhcyByZW1vdmluZyB0aGUgZGV2aWNl
IGZyb20gaXQncw0KPiBwcmV2aW91cyBvd25lciB3aWxsIGFsbG93IHJlbGVhc2luZyB0aGUgRElE
IHVzZWQgYnkgdGhlIGRldmljZSB3aXRob3V0DQo+IGhhdmluZyBjbGVhbmVkIHVwIHRoZSBjb250
ZXh0IGVudHJ5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCg0KPiAtLS0NCj4gQ2M6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxhbmRyMjAw
MEBnbWFpbC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAgLSBBbGxvdyBhc3Np
Z25pbmcgYnJva2VuIGRldmljZXMgdG8gZG9tX2lvIG9yIHRoZSBoYXJkd2FyZSBkb21haW4uDQo+
IC0tLQ0KPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgICAgICAgIHwgMTEgKysrKysr
Ky0tLS0NCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9xaW52YWwuYyB8ICA4ICsrKysr
KystDQo+ICB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICAgICAgICAgfCAgMyArKysNCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3BjaS5jDQo+IGluZGV4IDcwYjY2ODQ5ODEuLjkxYjQzYTNmMDQgMTAwNjQ0
DQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+ICsrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+IEBAIC01MDEsNyArNTAxLDcgQEAgc3RhdGljIHZvaWQg
ZnJlZV9wZGV2KHN0cnVjdCBwY2lfc2VnICpwc2VnLCBzdHJ1Y3QNCj4gcGNpX2RldiAqcGRldikN
Cj4gICAgICB4ZnJlZShwZGV2KTsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgdm9pZCBfcGNpX2hpZGVf
ZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPiArc3RhdGljIHZvaWQgX19pbml0IF9wY2lf
aGlkZV9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+ICB7DQo+ICAgICAgaWYgKCBwZGV2
LT5kb21haW4gKQ0KPiAgICAgICAgICByZXR1cm47DQo+IEBAIC0xNDg3LDYgKzE0ODcsMTEgQEAg
c3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsDQo+IHU4
IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQ0KPiAgICAgIEFTU0VSVChwZGV2ICYmIChwZGV2LT5k
b21haW4gPT0gaGFyZHdhcmVfZG9tYWluIHx8DQo+ICAgICAgICAgICAgICAgICAgICAgIHBkZXYt
PmRvbWFpbiA9PSBkb21faW8pKTsNCj4gDQo+ICsgICAgLyogRG8gbm90IGFsbG93IGJyb2tlbiBk
ZXZpY2VzIHRvIGJlIGFzc2lnbmVkIHRvIGd1ZXN0cy4gKi8NCj4gKyAgICByYyA9IC1FQkFERjsN
Cj4gKyAgICBpZiAoIHBkZXYtPmJyb2tlbiAmJiBkICE9IGhhcmR3YXJlX2RvbWFpbiAmJiBkICE9
IGRvbV9pbyApDQo+ICsgICAgICAgIGdvdG8gZG9uZTsNCj4gKw0KPiAgICAgIHJjID0gcGRldl9t
c2l4X2Fzc2lnbihkLCBwZGV2KTsNCj4gICAgICBpZiAoIHJjICkNCj4gICAgICAgICAgZ290byBk
b25lOw0KPiBAQCAtMTU4NSw5ICsxNTkwLDcgQEAgdm9pZCBpb21tdV9kZXZfaW90bGJfZmx1c2hf
dGltZW91dChzdHJ1Y3QNCj4gZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4gICAg
ICAgICAgcmV0dXJuOw0KPiAgICAgIH0NCj4gDQo+IC0gICAgbGlzdF9kZWwoJnBkZXYtPmRvbWFp
bl9saXN0KTsNCj4gLSAgICBwZGV2LT5kb21haW4gPSBOVUxMOw0KPiAtICAgIF9wY2lfaGlkZV9k
ZXZpY2UocGRldik7DQo+ICsgICAgcGRldi0+YnJva2VuID0gdHJ1ZTsNCj4gDQo+ICAgICAgaWYg
KCAhZC0+aXNfc2h1dHRpbmdfZG93biAmJiBwcmludGtfcmF0ZWxpbWl0KCkgKQ0KPiAgICAgICAg
ICBwcmludGsoWEVOTE9HX0VSUiAiZG9tJWQ6IEFUUyBkZXZpY2UgJXBwIGZsdXNoIGZhaWxlZFxu
IiwNCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9xaW52YWwuYw0K
PiBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9xaW52YWwuYw0KPiBpbmRleCA5ZjI5MWY0
N2U1Li41MTA5NjFhMjAzIDEwMDY0NA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92
dGQvcWludmFsLmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3FpbnZhbC5j
DQo+IEBAIC0yMjcsNyArMjI3LDcgQEAgc3RhdGljIGludCBfX211c3RfY2hlY2sgZGV2X2ludmFs
aWRhdGVfc3luYyhzdHJ1Y3QNCj4gdnRkX2lvbW11ICppb21tdSwNCj4gDQo+ICAgICAgQVNTRVJU
KGlvbW11LT5xaW52YWxfbWFkZHIpOw0KPiAgICAgIHJjID0gcXVldWVfaW52YWxpZGF0ZV93YWl0
KGlvbW11LCAwLCAxLCAxLCAxKTsNCj4gLSAgICBpZiAoIHJjID09IC1FVElNRURPVVQgKQ0KPiAr
ICAgIGlmICggcmMgPT0gLUVUSU1FRE9VVCAmJiAhcGRldi0+YnJva2VuICkNCj4gICAgICB7DQo+
ICAgICAgICAgIHN0cnVjdCBkb21haW4gKmQgPSByY3VfbG9ja19kb21haW5fYnlfaWQoZGlkX3Rv
X2RvbWFpbl9pZChpb21tdSwNCj4gZGlkKSk7DQo+IA0KPiBAQCAtMjQxLDYgKzI0MSwxMiBAQCBz
dGF0aWMgaW50IF9fbXVzdF9jaGVjayBkZXZfaW52YWxpZGF0ZV9zeW5jKHN0cnVjdA0KPiB2dGRf
aW9tbXUgKmlvbW11LA0KPiAgICAgICAgICBpb21tdV9kZXZfaW90bGJfZmx1c2hfdGltZW91dChk
LCBwZGV2KTsNCj4gICAgICAgICAgcmN1X3VubG9ja19kb21haW4oZCk7DQo+ICAgICAgfQ0KPiAr
ICAgIGVsc2UgaWYgKCByYyA9PSAtRVRJTUVET1VUICkNCj4gKyAgICAgICAgLyoNCj4gKyAgICAg
ICAgICogVGhlIGRldmljZSBpcyBhbHJlYWR5IG1hcmtlZCBhcyBicm9rZW4sIGlnbm9yZSB0aGUg
ZXJyb3IgaW4gb3JkZXIgdG8NCj4gKyAgICAgICAgICogYWxsb3cge2RlLH1hc3NpZ24gdG8gc3Vj
Y2VlZC4NCj4gKyAgICAgICAgICovDQo+ICsgICAgICAgIHJjID0gMDsNCj4gDQo+ICAgICAgcmV0
dXJuIHJjOw0KPiAgfQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3BjaS5oIGIveGVu
L2luY2x1ZGUveGVuL3BjaS5oDQo+IGluZGV4IGI2ZDdlNDU0ZjguLjAyYjMxZjcyNTkgMTAwNjQ0
DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4v
cGNpLmgNCj4gQEAgLTEwOCw2ICsxMDgsOSBAQCBzdHJ1Y3QgcGNpX2RldiB7DQo+ICAgICAgLyog
RGV2aWNlIHdpdGggZXJyYXRhLCBpZ25vcmUgdGhlIEJBUnMuICovDQo+ICAgICAgYm9vbCBpZ25v
cmVfYmFyczsNCj4gDQo+ICsgICAgLyogRGV2aWNlIG1pc2JlaGF2aW5nLCBwcmV2ZW50IGFzc2ln
bmluZyBpdCB0byBndWVzdHMuICovDQo+ICsgICAgYm9vbCBicm9rZW47DQo+ICsNCj4gICAgICBl
bnVtIHBkZXZfdHlwZSB7DQo+ICAgICAgICAgIERFVl9UWVBFX1BDSV9VTktOT1dOLA0KPiAgICAg
ICAgICBERVZfVFlQRV9QQ0llX0VORFBPSU5ULA0KPiAtLQ0KPiAyLjM0LjENCg0K

