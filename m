Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E37F45B11F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 02:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229995.397636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mph2s-0000t9-4y; Wed, 24 Nov 2021 01:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229995.397636; Wed, 24 Nov 2021 01:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mph2s-0000rK-0t; Wed, 24 Nov 2021 01:25:58 +0000
Received: by outflank-mailman (input) for mailman id 229995;
 Wed, 24 Nov 2021 01:25:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/oH=QL=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1mph2q-0000rA-8d
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 01:25:56 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 769a0b47-4cc5-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 02:25:53 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 17:25:51 -0800
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 23 Nov 2021 17:25:51 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 23 Nov 2021 17:25:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 23 Nov 2021 17:25:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 23 Nov 2021 17:25:50 -0800
Received: from BL1PR11MB5429.namprd11.prod.outlook.com (13.101.93.109) by
 MN2PR11MB4509.namprd11.prod.outlook.com (52.135.39.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.27; Wed, 24 Nov 2021 01:25:48 +0000
Received: from BL1PR11MB5429.namprd11.prod.outlook.com
 ([fe80::9061:212b:2fb5:41d0]) by BL1PR11MB5429.namprd11.prod.outlook.com
 ([fe80::9061:212b:2fb5:41d0%9]) with mapi id 15.20.4690.030; Wed, 24 Nov 2021
 01:25:48 +0000
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
X-Inumbo-ID: 769a0b47-4cc5-11ec-9787-a32c541c8605
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="259058080"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="259058080"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="674690612"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V24IkZn+bR7FjFGfHfxqjTbB6F2zoj99qyAKQYRYPcIyJCPv8Tqo4Ts42CHudrkEraL5mxTmf66GhWnsPkksNrOxhSbIKNU15kbWeNp2+2YdUazqNSp3sdcC9w367nPvxUBZ9205/eCKfChTTfsbb91oK/O9rn7CToJbi3Ni5DtVa+wObQ/RYVbGZjquQGUgQT94DFYoIpPrCNAAm7tms4fX05B2UNhb23j0tTypXauVK1tIe+Oy9f0TNQAJjTqLXdzGDAwMdPWnVsXoQEUnxuyjmCmcTV/oJqJooTDU0GiVxzq3ei+LoRTq5sA3cf4Ri/pBSaQQVBsz6RIfYT+kTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTA9SFOXWewWt75ThHnKxE0AefTksWmZKDLROtq//R4=;
 b=ElH9EG+Wg5DALwtHhf/QIv5QDKBauqbGQuBnROWG6SNKpEB++2j9Fa69eljo45eRJ559UJFfV1CB500Bins2QKy11ywOeyQRtOdcVBgZIM10U7uXIFkn/5oUXhhiKwqoSF1YsxOguhJo8IqGXQ8FQO1t1oHnUyJN1Ojd5Pdm9B3tyo6orb28R5giU6rHGJvHQI4rTSrYLbTXJJqpVCcfE/sB+8t3gLRFrcFQazgHCwYR9jYWsWXSqVfju/253EJ49qjsxlOjiPiXiY2qh8fXMI5o7dwti0kA3QMGiDoVHjXbWc6nfQICBcqZOCJdEi87vJAYRAm4a19nfcqthahFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTA9SFOXWewWt75ThHnKxE0AefTksWmZKDLROtq//R4=;
 b=ZUCrezDNiZPgte77xYjrnc3mcHhqYsj0FpLVbFD5XKdPa6INrkdja7rsf8bCZnJknY1JPJw/tskvdwgr3Oj3SwGxgekrgopDVsvaxNp9VlhEQc61Ro5oxqBJLA9Tap02UY+94kIK7ZlYQDg7IPKHsI1hCI42OQgO6PvwrJzw6fU=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 3/3] VT-d: conditionalize IOTLB register offset check
Thread-Topic: [PATCH 3/3] VT-d: conditionalize IOTLB register offset check
Thread-Index: AQHX4G+5FQV+mmRGK0Oi07D8aTZRP6wR4u0Q
Date: Wed, 24 Nov 2021 01:25:48 +0000
Message-ID: <BL1PR11MB5429DA6FC5B711B6E9775D7F8C619@BL1PR11MB5429.namprd11.prod.outlook.com>
References: <54e38a20-5281-2ab3-8513-3506ab66dbe8@suse.com>
 <63da915f-03dc-f846-3c6b-e90890d1f8fc@suse.com>
In-Reply-To: <63da915f-03dc-f846-3c6b-e90890d1f8fc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24f4f984-5a6a-4479-5264-08d9aee95864
x-ms-traffictypediagnostic: MN2PR11MB4509:
x-microsoft-antispam-prvs: <MN2PR11MB45096FA64650ED5DF2CA76EB8C619@MN2PR11MB4509.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q0epxPNoObWp3EuyEgFQdHk+vwwmxZ3ptConwJE21pE6taDUsrRVvsw1/pNlcc7F4LYSY0Crntn/a0up/Leo0dhqBdt8Fk6hQbZ7hKn32zGC+M8dBI4EZi12LONXfT8NwklwTYpuv7qZNLLGJJhS3pS127BMflFsnCSan3+telyUfecjEFpVeO46V9/PtnNZ1wj9ZvqXgFlc1N9OSFLpXJZbTg2xs8cUE1SGTgNUMYqHEaX42VfqrWkhOh7n2ykJ1cjqKbtoOvt/ijspvtcGttdL1T1Re5AjSxqnjvzNekfaNlVYUMNHLBQTmmoRI9fJnfICC+XqItNK3GA6w8czBdn1aC/bpdnQICjfwEYi2Z8ELoeyH2KJapN2gma2LzDHN06zJxqUFv9bMSoj4ce5uECpaSdXxGbSKjxCrl03WIexIkrdJqjBs8dUV3TtYUeIAx2OXPFBdGgmfw836jIHBqVNf6jkfdW/e58DDtcwfaejszTdOY+vzzdvMSMCshHqeCgGs5e+y3Fhn0gkuEj2weknwIZldBgWY5uPBlfnct3caCq18KsAMYF0Ml42Hz5hrqBXuVQvXQsFDd44besj80OZXm9xIU6czam3Z2TOOytjGr+/85JhKBOV7x/KShtO0quI2K7XCgwUBwI34NTCNM4L5jatH+2bi2LH8cw7gZ85FWuMliataAtu11ZHIdRdoPFpSSdZfWnAzKWrexi6cQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5429.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(76116006)(82960400001)(66556008)(508600001)(26005)(8676002)(66446008)(2906002)(38070700005)(52536014)(6506007)(66946007)(83380400001)(86362001)(66476007)(33656002)(316002)(64756008)(9686003)(5660300002)(55016003)(7696005)(71200400001)(110136005)(38100700002)(8936002)(122000001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW1vcDBRNjRESGtOWVFsN1dEVXY3ZTZxRURXUHZJYXFVSHpRbU9Vanl1WEhL?=
 =?utf-8?B?NHlQYlRvOUFsZDIwemowR1FHT0UxbEhseFphc0l2WmpvY1lsTjN6bkNVMU9S?=
 =?utf-8?B?Ni93N00wRnBiWUlSc0NFWjRpdllZMXR5Nm9RMzkvKzVwM29RVDE4NDRkK1ll?=
 =?utf-8?B?a3RGRWoxTGdwNkhvYUFEU0FEcjEySm9pQlRaamprenA4K0NNQ2lxMHlVV0hu?=
 =?utf-8?B?UjFWNVFkdmx0ZkV4dGpCZHJET3FQb0xtemFpUjZ6WkJJVmpEdXJ5TjJkdnFv?=
 =?utf-8?B?U3NWRnhibWxITzFGUmk3eGZpWVBQREZoSm0wS1BOU2tCNnhJdGg4MjlLaE5w?=
 =?utf-8?B?Y2QvMmk2SWZHZm9XRXF4ejYyV0lkNmNFTCsvOU5mVmc0RGROSHBwT1ZVeTU5?=
 =?utf-8?B?SkQvN0EvSUl2QVdNUmNzQUNxeElGQmpSMG85VThaNlBTeFFRdThVNWpNbVlt?=
 =?utf-8?B?bnlOMUdodXkvOVFuWVNobHJXNzVOVThGTWIrbjJVVGFobEhHQWlCWDVhNnVK?=
 =?utf-8?B?SHhsV0ZaaXBlT1p5NVRlVVdOTjU0UUJzUGlOWjg4aWExVU9uMUNLeVZpTENU?=
 =?utf-8?B?VEFzaVIyaHFOVk10V3ZOS3ZkUFdISmg1QXJIMmJWNnZONWlOelQwaGFrelFj?=
 =?utf-8?B?ZUs0a2ExTlRUdktYTVhFVEh1MTJmME5OV2E4SnNLRmNCRDh6bjFVK0gwa0tU?=
 =?utf-8?B?YnFBTlpyL3dqVnhtVWcraHlEblhhb25jWlJqTnh0VWVWblVvTU92N1RsZ0FN?=
 =?utf-8?B?Qi9Fb0ZibmRjRlhBRWNnOHRQTytDS2pEeVppTTl1Z3FsakVkdHNhMHVhTVYx?=
 =?utf-8?B?YVQzY21wdXVaVGE2U3lleVkvWXpZdDlvQlZqUUhUa1J1Vlh5S0FGNGRTRURU?=
 =?utf-8?B?Nkh6eWRvV0wzTzdRc1cvdFgyVmdST0NmUXczR0hHZWJzYVVIL044S3JGYlNH?=
 =?utf-8?B?TUxpMldOSHlhTW1sYmRwSVh6aUJoRVdtUXhkT0xYN1RCVG1DVGJlcDJjZXNs?=
 =?utf-8?B?bjRSOWNSbkhPRExnWjc5dXJaVXpvaGNUeElMcDdTNHMvYVFkTVJydTZ2NGky?=
 =?utf-8?B?ZGd4b25EbUFXaDFLV0h5cG9jL0RhcFJyWHlQTm5YSzFJblJVcDdxN1BxYzd6?=
 =?utf-8?B?NHdxRW55TWh4eURGODc2OGlkVXczV1JhS3M0emxJd3VIdVB6cGwxdit0Z3Bk?=
 =?utf-8?B?QVIxcnFDRG9xa3ZzMFdwdERIb0V6R0xYYktPWHl5OEdjZGo2dG12Q0p0UmVt?=
 =?utf-8?B?eHdLdGg3M09wcmdKbFYxd3l3SE9jbTNLTUVpSnZzdXc1elh3WTBEQVFtTEow?=
 =?utf-8?B?a2hWbTRmV0gzK2IxWDRoK2lFYTlUM3ZYQ04rZUhMZHI3aTkyTXFxL01pYVNU?=
 =?utf-8?B?b2F1MWNrdjFWRkVzNU1nYUFWbDNDS253K2RTZldSSVluTDR1c1NMZm5OY2M5?=
 =?utf-8?B?MFNmMGhhRm5HR2tJdERyVHpWQ2hHaWZXSkdSdnhJZVpvMmN6VFo5UlVYU21M?=
 =?utf-8?B?TWpyMDh2ZWp3c2M5QXdlN0duWUNrY05SR2FoNDJKSDRNRUtRZ3ZtdU10SVVG?=
 =?utf-8?B?ZXRIbm5OMDZzbzN0dEFnbXBXTDFmVDNYZXV3V1FaTVpZSCtSVUw2TTlWUnpl?=
 =?utf-8?B?VWtKcDFMbUJxb1ZPb2NLSkJlNUVSemk5V0F3eHljRlRwQmg3cXkzY1BJdU1u?=
 =?utf-8?B?Uk5TYUIzZ2Fld3FHN0oyaVVNZTNZYy81U21wa1pENGkxT3VBejdMVlZ5YUdp?=
 =?utf-8?B?aVpjZDJUTktuUkF4YVFiUVRqbG8vcDZNcTJzVExqQWNhSGFmVlROTGl0K2l5?=
 =?utf-8?B?TlVsdmFjOElQY0Rwc0dQajk2cW1FN1Z4WC9mcHoya0FQRDVOQUk0RHMwazNR?=
 =?utf-8?B?YUhzRXZvblcvL282NnA0V2dqR0draVpWd2ZXNUI5RUl4dHpaSFpDVnVJR2pz?=
 =?utf-8?B?bVZrRmZXREtzajgvenBRZGlIMkhjMDkzMWhXaDhYb1hrRFBRM1lUT0NJbTRj?=
 =?utf-8?B?bllmdzE1L0FWaGFqdW15a1NQb1ZjUVZmZld5RUtRWUMwTXJPTWIvUHJHQmg5?=
 =?utf-8?B?V3MzcW9HMmNxUXJwTUpQWW1JYkdHL095RnkzWVZYME1uZ0FHKyt2ZmlYM2Zy?=
 =?utf-8?B?allJa0RaR0xYbHNYejdzalBoSnYxWUxIczMwSStTQ1Bud244aFRMZjd1UzFB?=
 =?utf-8?Q?FVkgTjKE7vgZkVrVgzvGhWk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5429.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f4f984-5a6a-4479-5264-08d9aee95864
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 01:25:48.1814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tm7aAbU3riyB6BNVA9x4cUAVnjp4Lrq8idUTEwuJAtUhdsAaikUA3/sfswQARLLSRCRQAG2VbjrEzu/fdfGKIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4509
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE5vdmVtYmVyIDIzLCAyMDIxIDk6NDAgUE0NCj4gDQo+IEFzIG9mIGNvbW1pdCA2NzczYjFhNzU4
NGEgKCJWVC1kOiBEb24ndCBhc3N1bWUgcmVnaXN0ZXItYmFzZWQNCj4gaW52YWxpZGF0aW9uIGlz
IGFsd2F5cyBzdXBwb3J0ZWQiKSB3ZSBkb24ndCAodHJ5IHRvKSB1c2UgcmVnaXN0ZXIgYmFzZWQN
Cj4gaW52YWxpZGF0aW9uIGFueW1vcmUgd2hlbiB0aGF0J3Mgbm90IHN1cHBvcnRlZCBieSBoYXJk
d2FyZS4gSGVuY2UNCj4gdGhlcmUncyBhbHNvIG5vIHBvaW50IGluIHRoZSByZXNwZWN0aXZlIGNo
ZWNrLCBhdm9pZGluZyBwb2ludGxlc3MgSU9NTVUNCj4gaW5pdGlhbGl6YXRpb24gZmFpbHVyZS4g
QWZ0ZXIgYWxsIHRoZSBzcGVjICh2ZXJzaW9uIDMuMyBhdCB0aGUgdGltZSBvZg0KPiB3cml0aW5n
KSBkb2Vzbid0IHNheSB3aGF0IHRoZSByZXNwZWN0aXZlIEV4dGVuZGVkIENhcGFiaWxpdHkgUmVn
aXN0ZXINCj4gZmllbGQgd291bGQgY29udGFpbiBpbiBzdWNoIGEgY2FzZS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IA0KPiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvaW9tbXUuYw0KPiBAQCAtMTIyOCw3ICsxMjI4LDggQEAgaW50IF9faW5pdCBpb21t
dV9hbGxvYyhzdHJ1Y3QgYWNwaV9kcmhkXw0KPiANCj4gICAgICBpZiAoIGNhcF9mYXVsdF9yZWdf
b2Zmc2V0KGlvbW11LT5jYXApICsNCj4gICAgICAgICAgIGNhcF9udW1fZmF1bHRfcmVncyhpb21t
dS0+Y2FwKSAqIFBSSU1BUllfRkFVTFRfUkVHX0xFTiA+DQo+IFBBR0VfU0laRSB8fA0KPiAtICAg
ICAgICAgZWNhcF9pb3RsYl9vZmZzZXQoaW9tbXUtPmVjYXApID49IFBBR0VfU0laRSApDQo+ICsg
ICAgICAgICAoaGFzX3JlZ2lzdGVyX2Jhc2VkX2ludmFsaWRhdGlvbihpb21tdSkgJiYNCj4gKyAg
ICAgICAgICBlY2FwX2lvdGxiX29mZnNldChpb21tdS0+ZWNhcCkgPj0gUEFHRV9TSVpFKSApDQo+
ICAgICAgew0KPiAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBWVERQUkVGSVggIklPTU1VOiB1
bnN1cHBvcnRlZFxuIik7DQo+ICAgICAgICAgIHByaW50X2lvbW11X3JlZ3MoZHJoZCk7DQoNCg==

