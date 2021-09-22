Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7353C41451F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 11:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192327.342725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyYD-0001qn-0X; Wed, 22 Sep 2021 09:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192327.342725; Wed, 22 Sep 2021 09:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyYC-0001nQ-RZ; Wed, 22 Sep 2021 09:28:24 +0000
Received: by outflank-mailman (input) for mailman id 192327;
 Wed, 22 Sep 2021 09:28:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8VE=OM=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1mSyYA-0001nG-Ji
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 09:28:22 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b398b2d-c3a3-4fd4-92aa-ecf59c919d20;
 Wed, 22 Sep 2021 09:28:21 +0000 (UTC)
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
X-Inumbo-ID: 8b398b2d-c3a3-4fd4-92aa-ecf59c919d20
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632302901;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QDQ7sUKDQ1O9y8Um8Up74jv6SVkGfrVFkpCyF8Li5HE=;
  b=UYeElKFYJIiAs89EcIkYcaLAgEgwTD7h6s5Jmnso/uSbhJLjOzjofBeq
   EwbJA5/aJBtbs3MEPCNTjDozlp6QJakDfIpZ3cn6hTPBwrbEj6MESulIC
   pwMohDhkzxfzKwX1xOM5JE7aaFG+b+nrXHRsGQl/UJfYMkoTphnGUmjrQ
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rCy14/w4YdlvEXI3jRSK6QBwboxKXEGxdGQ6QRU/0TX7H0Vdbnu73tqa6kyFX/8n0l+//yj5Xf
 ExHIM2MuadvWs+ht/7RuFYN5Xr+ZW2mOPswthVTHj5i4vuRzWLeqCaiL5+XvGd/6o/gDyGJ9lY
 WQ51nLbciAmnjVN/JlHXJYbSW38p9rgbB75brexi4Xcn02uWFuPUX+7F+Wi4xJboqQhSOKULol
 3L3SYs8c8ReRDUMm9Myt+jY1K0JfDAfDK66t2uoANEiKkOLhlI4wM7bir3jfVEt60qMW0/cOVK
 FcyDuhC0Q1NQpQYwVpkjliEk
X-SBRS: 5.1
X-MesageID: 52898958
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ysZcMqtk/wy4J1Pg1OMT5istEefnVM9ZMUV32f8akzHdYApBsoF/q
 tZmKW/XPP6KYWGjKdh/aYu+pENXupTXydNhGlc9ryAxESoX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljIGzaC4gE7P2pMsHCTJCGAZjM/1U5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DN4MFu2p8zDjfS/InR5zCTI3B5MNC3Sd2jcdLdRrbT
 5dDOWs/PUmQC/FJEgsLN79ggL/1vXS8bzJmuALKn45wu0GGmWSd15CyaYGIK7RmX/59nEmCo
 Xnd13/kGRxcP9uaoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQtDxkRWUq+sOOOoEe0UNJCK
 GQZ4iMr66M18SSDQtDjUjWirXWDvxpaXMBfe8U49QWMx6z88wufQG8eQVZpacMknN87QyQw0
 V2ElM+vAiZg2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nZtRpHbOxj9b1MSrt2
 D3Mpy87750MieYb2qP9+krI6w9AvbCQEFRzvF+OGDv4sEUpP+ZJerBE93Di8PVhBY+0UGO9k
 2JesNKVy/0AXYOSwXnlrPo2IF252xqUGGSC2gQ2T8d9r23FF22LJt8LsWonTKt9GoNdI2a4P
 hWL0e9EzMILZBOXgblLj5Vd4ijA5ZPpE8jsHtvQZ8BHCnSaXF7apHwyDaJ8MmaEraTNrU3dE
 czAGSpPJSxDYUiC8NZRb71GuYLHPghkmQvuqWnTlnxLK4ZygUKopUotagPSPojVE59oUC2Kq
 o0CZqNmOj10UfHkYzm/zLP/2WsidCBhbbiv8pQ/XrfafmJORTFwY9eMkOhJU9E0wMxoehLgo
 yjVtrlwkwGk2xUq6GyiNxheVV8Ydcwu9S5kZXN8YwnANrpKSd/H0ZrzvqAfJNEP3Odi0eR1X
 78CfcCBCe5IUTPJ53IWapyVkWCoXE7DadumM3X3bT4hUYRnQgCVqNbochG2rHsFDzattNt4q
 Lqlj1uJTZ0GTgVkLcDXdPPwkA/h4SlDwLp/DxnSP91eWETw64w2eSb/ueA6fpMXIhLZyzrEi
 wvPWUUEpfPAqpMe+cXSgfzWtJ+gFuZzRxIIH2TS4busGzPd+26vnd1JXOqSJGiPX2Lo4qSyI
 +5SyqikYvEAmV9Ltat6Eqpqkv1it4e++ecCw109TnvRblmtBrdxGVW83JFC5v9X27tUmQqqQ
 UbTqNNUDqqEZZH+G1kLKQt7MunajaMImiPf5OgeKVnh4HMl56KOVEhfMkXeiCFZK7cpYoopz
 f145ZwT4g27zBErLsyHnmZf8GHVdi4MVKAut5c7Bo73i1V0lgEeMMKEUiKmsouSb9hsM1UxJ
 m7GjaXPsL1Q207efidhDnPKx+dc2cwDtR0iIIXu/LhVdg4pXsMK4SA=
IronPort-HdrOrdr: A9a23:eefIS6qfOHYbBTJ5tXUS55MaV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="52898958"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeJrL2JG9EXFnfpPo1erIlUrU2hsk3HaSEepI05hY80DVQSKdKVkJd4kBBpESWo+YONgYD+kcZ30lL+2SupsbQ9Z3xqqOeCfjAm2BlYv1wXDqV99FVIVXKwxbweKNOOWs1DMbqS1JOUqiBqrHYe2D7gwaqGTnALdU7FUYPVOuQQhaL1t9YOWF6im/1AwdsRxkDtGkYC+xcbuIGTJ3qneFbKz7Bagx8j9ZKEuekTwilvdCGgKtFeWw8kJdVo3c+LzsXxo/mlskqx7EXQe0yBt0ks2yJSXZFEk1HE/XLSqWXrFh0BXxfFNK5nXEGLIhBJOY99vjPmg67UJj5CP7ffjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QDQ7sUKDQ1O9y8Um8Up74jv6SVkGfrVFkpCyF8Li5HE=;
 b=ngHn+zpBTOii9WnRnyclKE4LszCUtgvo8Ob1aA3d3mHq8yfz+ICTrj/IPwZ9WPjVmyFcl2gpvIj+wGnfNskzQFKaPYyDHiJF1e/6+KXWEpuxMlQ1xtJQmU9ND8epeulb9/AGfucaq82/mIFtJfwcb5Nkn9IS1uUKLwmMA69hKQh4WrEu9At/d1VegbdzWnlBJtvtigEqSUYpeSgRdosrTQ9DMVBPUFj9nyHse/SIQuOXja0tgek5qCZ4RGdWLSrVGkqGDjHEX7CCQl+XfgkOKLgQXEn80wekMmGIyjDGvcBIfF2cR44Jt23BY2q90NuTlu4O8k0bb9kDBdM5Vz5QJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDQ7sUKDQ1O9y8Um8Up74jv6SVkGfrVFkpCyF8Li5HE=;
 b=iuKTRqxDA7g7B3xExrzaKaCNZt7eaZw0CB7Thggp9JM6l9OdOVXbAvCCRZyLeY5h2Ieyx8ljVhtAL8LFi6O/+9q9Kkdq8B5CEBXK0wU1P5m4bF23/venWQESuxWseGrmLMcKM/+w8Jf22Xac1UdAa5emG1V1+f8AJVa3rI0P/nM=
From: Christian Lindig <christian.lindig@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Edwin
 Torok" <edvin.torok@citrix.com>
Subject: Re: [PATCH v2 3/6] gnttab: allow per-domain control over transitive
 grants
Thread-Topic: [PATCH v2 3/6] gnttab: allow per-domain control over transitive
 grants
Thread-Index: AQHXr4rqo8uhO7XRjkO2Lx1exL1r46uvyUQA
Date: Wed, 22 Sep 2021 09:28:18 +0000
Message-ID: <D28B0008-6DE4-4A5B-B4F1-78F902362635@citrix.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-4-roger.pau@citrix.com>
In-Reply-To: <20210922082123.54374-4-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59bbbc3f-51b4-4a94-74e0-08d97dab5034
x-ms-traffictypediagnostic: CO1PR03MB5891:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR03MB5891692C4E89CAC810B8302FF6A29@CO1PR03MB5891.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZsCmmDV92l/tEE81q6olyPVsGUXGyKsTet7RzCOGbmwfE4lPR0TCqilCmrnPzuPl8V0HOS6b4J5GKpKHaG4x+clMjSskV9RrepNDcRIplSJ7Gp3k4eKqRVUnUOF0CHXB59DaIAdO9EwgFDYw0nCiCzbhvcyMQWzODjJg21Fv1bb4lSWTuaDN8lhvWG3AZ4VU8JYfr7kHuhgfQgDng0S0H3mEiVkIlYy4jEkI3wX6Hf1LbtfZMrnLY5LsdVWQoPF2iFNCHgFp9iNuEP5C2/RaMMFN6v+Czyj+WwZKZa0f2SJLgkIrZMthB7+6s8U0yYjmwq5fVVQMwYGU00GPSaNP4THWV7WcUS4/AJoulx3xi7brk4AN/1c9DsNp6OOEEO8bFlgvoX9b2wpX4PWlSEznGk4c47GZm4OXndsSqORn0RS5MtI7UlbPCDJdLA3/SAHBjKhRrLOmmtXyaEXBc9vbPgIa2wbKcIr+hCY57j4IntEhvzNMesfE3hwosLlbbZgtUzqENIKfWaGouGzwXjeGDTxZ3f6dqlAdfzehyLjxwsRarOGsT38U53oPRf+R7Hots2BLwWA6SSbNsT7nPa8vvi4LIKZLH1rjG/M/yqkGvnsdIyW0WIJUqVqcI2/+GEOSDhSHXn0GAAGNiGBBW1TwDdE+BQfD/eb4tJY6F/+doaIO5Iz/hdA9PIRR49zWyz6eAVN191IPC8XTaw6CmGBCnjSbo5Gslzx3Kw7TU0ATYMY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6380.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(8936002)(122000001)(44832011)(38070700005)(71200400001)(66556008)(76116006)(4326008)(91956017)(53546011)(6636002)(6506007)(6862004)(186003)(37006003)(2906002)(6486002)(54906003)(8676002)(107886003)(55236004)(83380400001)(316002)(38100700002)(86362001)(2616005)(26005)(4744005)(508600001)(33656002)(36756003)(6512007)(66476007)(66946007)(66446008)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlBQZENtVGZEZldFbXlod0xZTzdNdjRwRUg3OUtOamI1QWJ0cExWQUpmT0dD?=
 =?utf-8?B?SDhOMUZMSTZuaFJOUUdGeVQ0Yk0xTW5MTEt3YjFTQXpNRk1CeXB5N0d6N1My?=
 =?utf-8?B?engvaFRza0FFTHJ6SXZsSkllbEdSakZ3UkovVGdRdDZkNDNqVG5iaG10QXBo?=
 =?utf-8?B?UHFjakgzYk52N1VmN2FqWVorS2d0d0dqY1FMTGRRclhZQ3gzVG0yN1N6N0cv?=
 =?utf-8?B?aitGU2VEczZHbEp5czZRSHlsZUtMK3BtYlNqWkV4TUZIZ1p0V0o5MHhmb3pK?=
 =?utf-8?B?bGpiYnNycGlLRDJWRW5vOURqMUZBNXpENnRyU0FlT3JENTdCc0pSVU1heDVY?=
 =?utf-8?B?TlBvdUVKSzJlNXZlOFQwVXcwb2F5TTIrUnBXMzl4ODRzNU5Zd3Ntb3pMWEJn?=
 =?utf-8?B?UmVkb3JYMUVZZE82RHpjMW5BWHNkb0kvSmtva0lqYi9BWW1hTzVWRkVxa2xH?=
 =?utf-8?B?QlFPQUNNZmNwdGFMVHhRQ3Nqc0hhRHllaXJyVmRBVW1mMVBya1g5L25Od2x0?=
 =?utf-8?B?a215OC94bmhqclRDTzYrN1h5TmlSUVdYQVIwRjVlR0VPUmxlNUpFbm4wY0Vu?=
 =?utf-8?B?Nmkza1ViRmRxT1Q3dFVsWVdiQzZFMFZGd1ZEaW9wUGxaK0RraHVza2pOSFVV?=
 =?utf-8?B?Nmc0TEZXRXo5dDJIME51TEJLRnZCaXZabjZnWEtPdUNOUWZsTC9rSUgwZzB3?=
 =?utf-8?B?cUlQZmhoMFJxVS9seVBERzhXK3dueFNCeFYvdTByN3ZFMWtENlZjeUNNbHUy?=
 =?utf-8?B?dWJJZjZ1Tkp5ZGRydEd6TDBlbU8ycFlaSGpTcjNaUmExdHhkY203emxMTUxO?=
 =?utf-8?B?Ti9RQjN3ekZ1QlBrQ0lDUFlCYXFjNloyR3dJYzU4NmVuQVZBZFdFMzlIeTh6?=
 =?utf-8?B?MlhnYTB0SFhCS3h4eUFLRXpMaDgxdUpnNDdyOVNOUUZGSjg0MGx5L1MxQzhF?=
 =?utf-8?B?bnVYcjFmYW5HZjZaOU5XTDI1UzkvOWorQUR3NVBCeFVNUUlyWVNCUEdzQ24x?=
 =?utf-8?B?RmQyNlhFZWFnNDAzVGtBN3N3ZURDa0hMcit6VzNTemZoZVFiWHo0a3ZRV3ps?=
 =?utf-8?B?TGNTZDQ5L0ViL3k4RXBXMm9ScjJZbFlxTjNOM0lWNUErZjlrZjZ5UXoyMEZ1?=
 =?utf-8?B?VE5wUzJHNTdma05DbVNaRFRJMHo4NnJKRmZjaEhyUWpOdDdBYlRCYytVZTdx?=
 =?utf-8?B?THBvR0dYSW1JU3hlcGR0Qy85YWNFSUdBbGxlNnZUZk1rcW95NEs2dHFrTTVY?=
 =?utf-8?B?T0RMaWFDekRCYm5qbVFxWFczVHY2cHVDNVUvaE1MMGNOWHhNM1dGWEx5M0lH?=
 =?utf-8?B?Y0FtUC9JK2I2UkZjSXQwOHpoRTFhZ3ZvYXFEZVlWRlNMc21JZTlWRmpCeFQx?=
 =?utf-8?B?OVZCZGRkR2lxcnZmVCsreDF1LzF1cUV4OW02Z1I1c05DU0wwVmlXeWc2TjZ3?=
 =?utf-8?B?UnM0dWdHQ29YU1RIR3U3NDNvaFVRTHpQMmpJVlNHL1AzZG5tN1dQV3VGVURM?=
 =?utf-8?B?d0Vyd0Z5eDF6WHFnbDd0UjVEbC9qNEF2UkZvTHVwV0daV0M2ZXc4d3NPcWht?=
 =?utf-8?B?WTNsVjM0blpIeTB3NXdMY1lpSVhQK0hLZXpWN3Q3K3ZUeks2SDlrRk4vM2Fl?=
 =?utf-8?B?dFM0M3dkemk1dmE3SU1jY1BDRVhBRlpKakZDeWFxOFNYVUFmbVkxR3RyUE56?=
 =?utf-8?B?ZndJWnZpc2xEK2cyZGJERWlWMmsxY0hpMUVyVk1ZZExjNFhCaTdwa0pvcEhr?=
 =?utf-8?Q?aUd7F1j08+rda5YFncCBDkovOgj8G1L7eEUyPAb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6280667370D242438C913A210AC28899@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6380.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bbbc3f-51b4-4a94-74e0-08d97dab5034
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2021 09:28:18.6477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BZgvfx9FBk+lOiOBooWL0MNU/xU6fnAW384xCmN4ZfX4ZFm1a6XUtF0SUELW4piiL9lOSpsOX0Twn2uomAb8RI1C/vnW+hS2pgDGkO1DX4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5891
X-OriginatorOrg: citrix.com

DQoNCj4gT24gMjIgU2VwIDIwMjEsIGF0IDA5OjIxLCBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IEludHJvZHVjZSBhIG5ldyBncmFudCBvcHRpb25z
IGZsYWdzIGZpZWxkIGluIGRvbWFpbiBjcmVhdGUgYW5kIHVzZSBpdA0KPiB0byBzaWduYWwgd2hl
dGhlciB0cmFuc2l0aXZlIGdyYW50cyBhcmUgYWxsb3dlZCBvbiB0aGUgZG9tYWluLiBUaGlzIGlz
DQo+IHNldHRhYmxlIGZyb20geGwgdXNpbmcgdGhlIHRyYW5zaXRpdmVfZ3JhbnRzIG9wdGlvbi4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPg0KPiAtLS0NCj4gZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluICAgICAgICAgICAgfCA2ICsr
KysrKw0KPiBkb2NzL21hbi94bC5jb25mLjUucG9kLmluICAgICAgICAgICB8IDcgKysrKysrKw0K
PiB0b29scy9pbmNsdWRlL2xpYnhsLmggICAgICAgICAgICAgICB8IDcgKysrKysrKw0KPiB0b29s
cy9saWJzL2xpZ2h0L2xpYnhsX2NyZWF0ZS5jICAgICB8IDMgKysrDQo+IHRvb2xzL2xpYnMvbGln
aHQvbGlieGxfZG0uYyAgICAgICAgIHwgMSArDQo+IHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfdHlw
ZXMuaWRsICAgIHwgMSArDQo+IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbCAgICAgIHwg
MSArDQo+IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkgICAgIHwgMSArDQo+IHRvb2xz
L29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jIHwgNyArKysrKystDQo+IHRvb2xzL3hsL3hs
LmMgICAgICAgICAgICAgICAgICAgICAgIHwgNyArKysrKysrDQo+IHRvb2xzL3hsL3hsLmggICAg
ICAgICAgICAgICAgICAgICAgIHwgMSArDQo+IHRvb2xzL3hsL3hsX3BhcnNlLmMgICAgICAgICAg
ICAgICAgIHwgNCArKysrDQo+IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgICAgICAgIHwg
NiArKysrLS0NCj4geGVuL2FyY2gveDg2L3NldHVwLmMgICAgICAgICAgICAgICAgfCAzICsrLQ0K
PiB4ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgICAgICAgICAgICB8IDggKysrKysrKy0NCj4geGVu
L2luY2x1ZGUvcHVibGljL2RvbWN0bC5oICAgICAgICAgfCA1ICsrKystDQo+IDE2IGZpbGVzIGNo
YW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCkFja2VkLWJ5OiBDaHJp
c3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+

