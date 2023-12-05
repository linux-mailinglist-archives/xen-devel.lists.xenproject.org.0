Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7135A804978
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 06:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647400.1010482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAOJl-00068H-EO; Tue, 05 Dec 2023 05:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647400.1010482; Tue, 05 Dec 2023 05:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAOJl-00065Y-BR; Tue, 05 Dec 2023 05:50:01 +0000
Received: by outflank-mailman (input) for mailman id 647400;
 Tue, 05 Dec 2023 05:50:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nqzk=HQ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rAOJk-00065Q-1a
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 05:50:00 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1de85cb2-9332-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 06:49:57 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BY5PR12MB4888.namprd12.prod.outlook.com (2603:10b6:a03:1d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 05:49:52 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 05:49:52 +0000
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
X-Inumbo-ID: 1de85cb2-9332-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeWoJ5ZkOA/eLGPh+P+OlElQNbWFyP0aEYmWeqHQHg+JcKTq8xai8XoqM2ZxGdwvP91p1BGwtcXAW69JTq+YRsqgSmm94aR+Pc6r1lSOPFbFD5CkG2xVMGE3fGlUVCe/ZIAh7WklGxzsycflE5e9Mg7hYH+Rn27NhG0nrSAAMuQxwJAAbn1bcMebkuzvpT2Kdh5vsoqUhG4UyKQDmzLZDz1d1+i1g8nOUclR4LdKor0sAn2Wa5SpxsXF6pRm8RFoVSMJ/vBHx9QHIcFqyBVQxSvYME5voI15NRovfrLJzISKAm3Vzi3NigvljEvQ2HPDH9v8zAsEYKi31Ji18ULIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K/jlUawXqB+z1ba/qK7p4ALp+c0201T+kiBpevrm1Y=;
 b=U0JCEGlLZe3LiKjjPJ+MHvC4KaCPIi+KcnASq1PCqDi3ZAnaFAnsMm3+7lQbIXC7Qzu/2Rj3QQeaep/9Krh9O66mePIwHg8bH/6hTsefLn4m61kzzgISqYhjVjQheSfnkLGuRYVb+AE+av9Yd0vR17cWFRuuTg2TantzgorhWN9NnEZY5xXi5dw1y43bOtwUqJNfhhTOQTk8+PLo+nN8Pq0ebrkMaRVgrjYEdtu+uJUXrT4CimIwJDwJaZ1yOBWxf2aqaz+/V6rA8yb8HjDj9t1P514h0H134dtxXCA4npLORQ+4XeVB7HefJxC4Wy5citZtd4ee4JvD0QL1E7TuJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2K/jlUawXqB+z1ba/qK7p4ALp+c0201T+kiBpevrm1Y=;
 b=tTeG9PRPPvH7adrjHBNIvJs16BQb6+qXYRA1O62T4M2UEa2CZLYWN2D09XcGXtQQ3yJU/c6fMpqARCgchrnVWbFs40/4pZOxpWm4JV7sY62TYzmL7lidaMVOdh8wYdoWf+ch34vu/OFn27T3MYe/quj48Y+6nUO9JD9eg+VXdmI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Thread-Topic: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Thread-Index:
 AQHaHsLfq+dfGUvRWUqPIEH3O9fXrbCPyyeAgAMgFYD//+e9gIAABBEAgAAlHwCABknUAP//wXqAgAG9+YA=
Date: Tue, 5 Dec 2023 05:49:51 +0000
Message-ID:
 <BL1PR12MB584987E07A39C1D0A362A836E785A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-2-Jiqian.Chen@amd.com> <ZWX0U1tYooY70UJo@macbook>
 <BL1PR12MB58493CC28A32E3C9B3A1767FE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <14d2dd16-be21-4e9a-97eb-bb477af49e73@apertussolutions.com>
 <930da43f-0395-40cb-a79d-012c4e1acbcb@apertussolutions.com>
 <ZWihrmHpIrI_ccX4@macbook>
 <BL1PR12MB58494BAD4ECCDEB00EACCF9DE786A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZW2zp2emocdOn8_o@macbook>
In-Reply-To: <ZW2zp2emocdOn8_o@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB7663.namprd12.prod.outlook.com
 (15.20.7091.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BY5PR12MB4888:EE_
x-ms-office365-filtering-correlation-id: cc9c9c7d-9a31-41f8-36c9-08dbf555ffe0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SZmgJAFLPR5oiOlb5sCdVWk5EtcaSs5rCi76aZy0j+soI1g9YIAqy80I/fxc+31pknpmjeBlJMv5OxfrEqsrdJVaebCA458YoucDJNEdFPPXzWuS/MpKxpEbzRXlGMn+lWpWI3WuH+wjYtQ+JRSMWni7okjNhAtSNJJkMphWYsiglYDxwLof/trIOTi2va+pAx5f1yYfqVRvUIWfuuYTYJOZoc+k7cVUk3Qgs1mjenJnnQ1Bq14R7pKR4SjErsxlPXdZMv+prKKyniEKWJ+G9MkmZs5KK3plwQdV5zNsc4iEQYV4E8vKC1ksyFU6MvgBT+GpZOQhvrbv9CquGkUKSGA1wJXBWiFI7o1zMOvI94ueHFek3ml74nn1+aO4l3yNps+YCYpIKha51foIPCC4+kC2Jv3je7KJSxopcDomFlbTax2k7dmtQR84p3T0qS0rjoHJd+isY/QUxS7GJuwsGw0EsGQezRdjXZV9k7NOJh5TXidoidPshO72Li0qB70DaeMuO0k8ialsAxuhd9pUo2qDaMufYq1tNOSJ/8rdJvrR+hQWvMn2Dvr+QWUpQ9couvie6KsZdSuBornhVHX3RGNuyVYA9w0Y5VNpJcOI4A6pDiTzf457sCZ/BFbU41ocJx4h4rxJH1Tj2RP76yENKo4WjgdSlJ8Yoabt/qDMCHA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(54906003)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(4326008)(8936002)(8676002)(316002)(110136005)(478600001)(71200400001)(5660300002)(38070700009)(41300700001)(33656002)(2906002)(52536014)(83380400001)(26005)(38100700002)(122000001)(55016003)(6506007)(9686003)(7696005)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2szOWNQdEtYVUlJdlg1Zmh2TzB5RDR2MHVKZHBudDRHbHdZZ0huTGx2Y0Uv?=
 =?utf-8?B?UnNvZzBhUGRGOUpkR3hPVlFRaGNtS01CSVJZTklPM0kwanB3THQyZTNTMktS?=
 =?utf-8?B?RFRjNmZXazkyclhSQ0dxV0dyekwveXJtcGNUTlVNWUhnc0plUitYYWNxdmhB?=
 =?utf-8?B?OFNzWnNMS01Xcm02ZXk3cWxZRERBUzQ1UjQ3MGF4RW1MYnBWUGtaZHkrcEdr?=
 =?utf-8?B?VENJNXAyTjc4S01ucjY3WUw3dHl4QW82VUI1WHFMU0haREk2VFhrUTIwOWNk?=
 =?utf-8?B?eDZES3A3OGgxVk82WmcrVUpDWHI5SVdNd2Y3R1pVWkNORXFMVk5uMjk5S0JX?=
 =?utf-8?B?SXowSlA5UVNONWc0aGQvWUw5eVZmV00zZEk5TThGWTluVlEyVDQxNSt0VjBO?=
 =?utf-8?B?Nm81VUpnaXFrc2pldnFJR1ZPR0ZGaU1YdVlpc2R3N25objZObXJldDZNTUph?=
 =?utf-8?B?TlpCNEdxZmRxTkw3VzZEc1pqVzl1ZStMZm9ZZ3JDeEJ3aEFMOVBmdVIrQWhV?=
 =?utf-8?B?T2h6OXZrK053bEUyVkoxbmdVdWEvb2d3MDBmczZqbG52SmQ1RDdMVXJBRDFU?=
 =?utf-8?B?cVlpRWxuZVZERnZXWlRNc28yL01sK0xZZERsVkpHOHdCYVFwUlhUZDJaYkZM?=
 =?utf-8?B?MlkxelkvTmM0dmFLdExwNEJpdEFtNlRHMWpia0FNQW9BYklwYlpVcHJ3a2JD?=
 =?utf-8?B?K3NmN0MzbitMTnlzTlBjcUg5d2l3ckZrR05VM0dMRFhieUw0Z2w0aElZTUUy?=
 =?utf-8?B?S1JQUTI1VFlrUTFkTmZVd2JLNWdwTFZlUmc3NFJPcEpWcnZ0MXI1cnhINENv?=
 =?utf-8?B?WDI5YkZWWEYzQm91UHhFbG9hVE5YS2NTU1ZNQjBIVWo1MnZ3Vm9OM05PWndZ?=
 =?utf-8?B?L0FCc01TOE5Sc1J0QzkwNm9RMyswK0RLOE9GSVpabEU2WW10dUVoWVdvcVZn?=
 =?utf-8?B?TkhIM2NCNE9nWEQrZk5nUDhLYjhiY3c5Y0FmWUo4Y0dEQXcrZ21FWG9Kakd5?=
 =?utf-8?B?Q0RlbStKZitSTXFvRmVNSzdKOGRXWmJkMlFEckw2eDdBeTJMSW0xVnc4cnFu?=
 =?utf-8?B?M0M2SkFIU0p6YUxzRUpOeDMyVmVqNVEzK21FMHd1UzlPU2ZJUTBOYy9sVVVs?=
 =?utf-8?B?b1lNeDVES0FOT3BHcUs1MHhWcU1wR09rbWtaMXBESjkzMDFvcVNyUGRKb2ZE?=
 =?utf-8?B?dkpMRkNvRkVjdlYra0FrS3RyNmJjZE5JajhzU1RWMmNIblB4SzQ5KzNHZHlo?=
 =?utf-8?B?czV2cUZEYllIQXRFZ3dmZkZtK3lZbTlpVFc2QWJMMy81dE5nMkRWSm0zVWtI?=
 =?utf-8?B?THQwQ2xZY2dYSzZDNFB4dXd2a3NvRzZ1YVRtaWNTWURXbDhGakRLelZkVEVr?=
 =?utf-8?B?TUZ1bXBybHgxQWhMditXSDUvS1dsRG50em8xVDErcFE0dmMzT2gvTkRIY2sz?=
 =?utf-8?B?OXExK291THpQeW9PU2poK0YzV25IOTgwVFdzNFdhbjhDaU4wNDFSblM3TmRw?=
 =?utf-8?B?SUVCcUtLWVJPOE1xYUQ5bXVJWXFHQmlTMEc5dVZ2a1VIWjdzTEVnWVVxTG5U?=
 =?utf-8?B?UXdxUU1EV3RWcGNEK3VYWFlUV0kwUlhBNnFqL3NmQzFSK1hEdTNIdm1NY2k5?=
 =?utf-8?B?YTNOR09mTFBQMU5oY2lGMXJmZEtNbzFMdmp2bkFJZW9ZRFY5c0tobUx4d2FM?=
 =?utf-8?B?MFd1Qkd6OGhlQ1J3YmdTSjF5Y3lNMmNhR21XdkluTmR6R0M4bGExd0sxVitX?=
 =?utf-8?B?UXE1VDV6VmlkS09wcUUzNWljeDdqbmw2YWtMZVRvdE4zYlRSSFE0QXA1UzFG?=
 =?utf-8?B?VjZOcnN2SndWSllWSjcxblFkUjVrRE94Z2FCZGxwMXRzb29xVy9hd3FoTEVa?=
 =?utf-8?B?R3F1MmJUYXkwZThML1lLYUdQZjlWNjIyN2lTeXkzTzZJeVViczk1SG5VMjR0?=
 =?utf-8?B?V216Zk5QY0N2VGtpZzQ5TEkyMGdybEh4R0xzSXdTWGNVdEREVzIvU1VsLzNM?=
 =?utf-8?B?OGVRNDloUXZ4bzQrdzkxM2dIRmxiMTRsMkNQTUlQdzBGRksvQ2xnaUxkd0Jy?=
 =?utf-8?B?UVB5RHpCK3ViQWtXWnRmTTBDTG9NcFpiWnMrNGtZT3QrclI3VzdKWjBTZk1V?=
 =?utf-8?Q?Y5Xw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD6D61EF8EE0BE4A826CBAACBADCC3C0@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9c9c7d-9a31-41f8-36c9-08dbf555ffe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 05:49:51.6457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqrGVM/1j5FYxdCKnEISurmHBB47PjHxi6sZzSs3pnQTfLZ1jwDd09jYaJpWHkktatt/rf5+n1fHFMxsrEgIBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4888

T24gMjAyMy8xMi80IDE5OjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24sIERl
YyAwNCwgMjAyMyBhdCAwNjo1NzowM0FNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBI
aSBEYW5pZWwgUC4gU21pdGgsDQo+Pg0KPj4gT24gMjAyMy8xMS8zMCAyMjo1MiwgUm9nZXIgUGF1
IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCAwNzozOTozOEFNIC0w
NTAwLCBEYW5pZWwgUC4gU21pdGggd3JvdGU6DQo+Pj4+IE9uIDExLzMwLzIzIDA3OjI1LCBEYW5p
ZWwgUC4gU21pdGggd3JvdGU6DQo+Pj4+PiBPbiAxMS8zMC8yMyAwMToyMiwgQ2hlbiwgSmlxaWFu
IHdyb3RlOg0KPj4+Pj4+IEhpIFJvZ2VyIGFuZCBEYW5pZWwgUC4gU21pdGgsDQo+Pj4+Pj4NCj4+
Pj4+PiBPbiAyMDIzLzExLzI4IDIyOjA4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4+
PiBPbiBGcmksIE5vdiAyNCwgMjAyMyBhdCAwNjo0MTozNFBNICswODAwLCBKaXFpYW4gQ2hlbiB3
cm90ZToNCj4+Pj4+Pj4+IFdoZW4gYSBkZXZpY2UgaGFzIGJlZW4gcmVzZXQgb24gZG9tMCBzaWRl
LCB0aGUgdnBjaSBvbiBYZW4NCj4+Pj4+Pj4+IHNpZGUgd29uJ3QgZ2V0IG5vdGlmaWNhdGlvbiwg
c28gdGhlIGNhY2hlZCBzdGF0ZSBpbiB2cGNpIGlzDQo+Pj4+Pj4+PiBhbGwgb3V0IG9mIGRhdGUg
Y29tcGFyZSB3aXRoIHRoZSByZWFsIGRldmljZSBzdGF0ZS4NCj4+Pj4+Pj4+IFRvIHNvbHZlIHRo
YXQgcHJvYmxlbSwgdGhpcyBwYXRjaCBhZGQgbmV3IGh5cGVyY2FsbCB0byBjbGVhcg0KPj4+Pj4+
Pj4gYWxsIHZwY2kgZGV2aWNlIHN0YXRlLiBBbmQgd2hlbiByZXNldCBkZXZpY2UgaGFwcGVucyBv
biBkb20wDQo+Pj4+Pj4+PiBzaWRlLCBkb20wIGNhbiBjYWxsIHRoaXMgaHlwZXJjYWxsIHRvIG5v
dGlmeSB2cGNpLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVu
IDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVp
IDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4+Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4gwqAgeGVuL2FyY2gv
eDg2L2h2bS9oeXBlcmNhbGwuY8KgIHzCoCAxICsNCj4+Pj4+Pj4+IMKgIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3BjaS5jIHwgMjEgKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+Pj4+PiDCoCB4
ZW4vZHJpdmVycy9wY2kvcGh5c2Rldi5jwqDCoMKgwqAgfCAxNCArKysrKysrKysrKysrKw0KPj4+
Pj4+Pj4gwqAgeGVuL2RyaXZlcnMvdnBjaS92cGNpLmPCoMKgwqDCoMKgwqAgfMKgIDkgKysrKysr
KysrDQo+Pj4+Pj4+PiDCoCB4ZW4vaW5jbHVkZS9wdWJsaWMvcGh5c2Rldi5owqAgfMKgIDIgKysN
Cj4+Pj4+Pj4+IMKgIHhlbi9pbmNsdWRlL3hlbi9wY2kuaMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEg
Kw0KPj4+Pj4+Pj4gwqAgeGVuL2luY2x1ZGUveGVuL3ZwY2kuaMKgwqDCoMKgwqDCoMKgIHzCoCA2
ICsrKysrKw0KPj4+Pj4+Pj4gwqAgNyBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspDQo+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxs
LmMNCj4+Pj4+Pj4+IGIveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4+Pj4+Pj4gaW5k
ZXggZWViNzNlMWFhNS4uNmFkNWI0ZDVmMSAxMDA2NDQNCj4+Pj4+Pj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHlw
ZXJjYWxsLmMNCj4+Pj4+Pj4+IEBAIC04NCw2ICs4NCw3IEBAIGxvbmcgaHZtX3BoeXNkZXZfb3Ao
aW50IGNtZCwNCj4+Pj4+Pj4+IFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0KPj4+
Pj4+Pj4gwqDCoMKgwqDCoCBjYXNlIFBIWVNERVZPUF9wY2lfbW1jZmdfcmVzZXJ2ZWQ6DQo+Pj4+
Pj4+PiDCoMKgwqDCoMKgIGNhc2UgUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRkOg0KPj4+Pj4+Pj4g
wqDCoMKgwqDCoCBjYXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX3JlbW92ZToNCj4+Pj4+Pj4+ICvC
oMKgwqAgY2FzZSBQSFlTREVWT1BfcGNpX2RldmljZV9zdGF0ZV9yZXNldDoNCj4+Pj4+Pj4+IMKg
wqDCoMKgwqAgY2FzZSBQSFlTREVWT1BfZGJncF9vcDoNCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoICFpc19oYXJkd2FyZV9kb21haW4oY3VycmQpICkNCj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PU1lTOw0KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBh
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4+Pj4+PiBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3BjaS5jDQo+Pj4+Pj4+PiBpbmRleCAwNGQwMGM3YzM3Li5mODcxNzE1NTg1IDEw
MDY0NA0KPj4+Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4+
Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4+Pj4+PiBAQCAtODI0
LDYgKzgyNCwyNyBAQCBpbnQgcGNpX3JlbW92ZV9kZXZpY2UodTE2IHNlZywgdTggYnVzLCB1OCBk
ZXZmbikNCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+Pj4+Pj4+IMKgIH0NCj4+
Pj4+Pj4+ICtpbnQgcGNpX3Jlc2V0X2RldmljZV9zdGF0ZSh1MTYgc2VnLCB1OCBidXMsIHU4IGRl
dmZuKQ0KPj4+Pj4+Pg0KPj4+Pj4+PiBZb3UgY291bGQgdXNlIHBjaV9zYmRmX3QgaGVyZSBpbnN0
ZWFkIG9mIDMgcGFyYW1ldGVycy4NCj4+Pj4+PiBXaWxsIGNoYW5nZSBpbiBuZXh0IHZlcnNpb24s
IHRoYW5rIHlvdS4NCj4+Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+PiBJJ20gaG93ZXZlciB1bnN1cmUg
d2hldGhlciB3ZSByZWFsbHkgbmVlZCB0aGlzIGhlbHBlciBqdXN0IHRvIGZldGNoDQo+Pj4+Pj4+
IHRoZSBwZGV2IGFuZCBjYWxsIHZwY2lfcmVzZXRfZGV2aWNlX3N0YXRlKCksIEkgdGhpbmsgeW91
IGNvdWxkIHBsYWNlDQo+Pj4+Pj4+IHRoaXMgbG9naWMgZGlyZWN0bHkgaW4gcGNpX3BoeXNkZXZf
b3AoKS7CoCBVbmxlc3MgdGhlcmUgYXJlIHBsYW5zIHRvDQo+Pj4+Pj4+IHVzZSBzdWNoIGxvZ2lj
IG91dHNpZGUgb2YgcGNpX3BoeXNkZXZfb3AoKS4NCj4+Pj4+PiBJZiBJIHBsYWNlIHRoZSBsb2dp
YyBvZiBwY2lfcmVzZXRfZGV2aWNlX3N0YXRlIGRpcmVjdGx5IGluDQo+Pj4+Pj4gcGNpX3BoeXNk
ZXZfb3AuIEkgdGhpbmsgSSBuZWVkIHRvIGRlY2xhcmUgdnBjaV9yZXNldF9kZXZpY2Vfc3RhdGUg
aW4NCj4+Pj4+PiBwY2kuaD8gSWYgaXQgaXMgc3VpdGFibGUsIEkgd2lsbCBjaGFuZ2UgaW4gbmV4
dCB2ZXJzaW9uLg0KPj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+PiArew0KPj4+Pj4+Pj4gK8KgwqDC
oCBzdHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4+Pj4+Pj4+ICvCoMKgwqAgaW50IHJldCA9IC1FTk9E
RVY7DQo+Pj4+Pj4+DQo+Pj4+Pj4+IFNvbWUgWFNNIGNoZWNrIHNob3VsZCBiZSBpbnRyb2R1Y2Vk
IGZybyB0aGlzIG9wZXJhdGlvbiwgYXMgbm9uZSBvZiB0aGUNCj4+Pj4+Pj4gZXhpc3Rpbmcgb25l
cyBpcyBzdWl0YWJsZS7CoCBTZWUgeHNtX3Jlc291cmNlX3VucGx1Z19wY2koKSBmb3IgZXhhbXBs
ZS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4geHNtX3Jlc291cmNlX3Jlc2V0X3N0YXRlX3BjaSgpIG9yIHNv
bWUgc3VjaCBJIHdvdWxkIGFzc3VtZS4NCj4+Pj4+PiBJIGRvbid0IGtub3cgd2hhdCBJIHNob3Vs
ZCBkbyBpbiBYU00gZnVuY3Rpb24oYXNzdW1lIGl0IGlzDQo+Pj4+Pj4geHNtX3Jlc291cmNlX3Jl
c2V0X3N0YXRlX3BjaSkuDQo+Pj4+Pj4gSGkgRGFuaWVsIFAuIFNtaXRoLCBjb3VsZCB5b3UgcGxl
YXNlIGdpdmUgbWUgc29tZSBzdWdnZXN0aW9ucz8NCj4+Pj4+PiBKdXN0IHRvIGNoZWNrIHRoZSBY
U01fUFJJViBhY3Rpb24/DQo+Pj4+Pj4NCj4+Pj4+DQo+Pj4+PiBSb2dlciwgdGhhbmsgeW91IGZv
ciBzZWVpbmcgdGhpcyBhbmQgYWRkaW5nIG1lIGluIQ0KPj4+Pj4NCj4+Pj4+IEppcWlhbiwgSSBq
dXN0IHdhbnRlZCB0byBsZXQgeW91IGtub3cgSSBoYXZlIHNlZW4geW91ciBwb3N0IGJ1dCBJIGhh
dmUNCj4+Pj4+IGJlZW4gYSBsaXR0bGUgdGllZCB1cCB0aGlzIHdlZWsuIEp1c3Qgd2l0aCB0aGUg
Y3Vyc29yeSBsb29rLCBJIHRoaW5rDQo+Pj4+PiBSb2dlciBpcyBzdWdnZXN0aW5nIGEgbmV3IFhT
TSBjaGVjay9ob29rIGlzIHdhcnJhbnRlZC4NCj4+Pj4+DQo+Pj4+PiBJZiB5b3Ugd291bGQgbGlr
ZSB0byBhdHRlbXB0IGF0IHdyaXRpbmcgdGhlIGR1bW15IHBvbGljeSBzaWRlLCBtaW1pYw0KPj4+
Pj4geHNtX3Jlc291cmNlX3BsdWdfcGNpIGluIHhlbi9pbmNsdWRlL3hzbS9kdW1teS5oIGFuZA0K
Pj4+Pj4geGVuL2luY2x1ZGUveHNtL3hzbS5oLCB0aGVuIEkgY2FuIGxvb2sgYXQgaGFuZGxpbmcg
dGhlIEZMQVNLIHBvcnRpb24NCj4+Pj4+IG5leHQgd2VlayBhbmQgcHJvdmlkZSBpdCB0byB5b3Ug
Zm9yIGluY2x1c2lvbiBpbnRvIHRoZSBzZXJpZXMuIElmIHlvdQ0KPj4+Pj4gYXJlIG5vdCBjb21m
b3J0YWJsZSB3aXRoIGl0LCBJIGNhbiBsb29rIGF0IHRoZSB3aG9sZSB0aGluZyBuZXh0IHdlZWsu
DQo+Pj4+PiBKdXN0IGxldCBtZSBrbm93IHdoYXQgeW91IHdvdWxkIGJlIGNvbWZvcnRhYmxlIHdp
dGguDQo+Pj4+DQo+Pj4+IEFwb2xvZ2llcywgdGhpbmtpbmcgYWJvdXQgZm9yIGEgbW9tZW50IGFu
ZCB3YXMgdGhpbmtpbmcgdGhlIGhvb2sgc2hvdWxkIGJlDQo+Pj4+IGNhbGxlZCB4c21fcmVzb3Vy
Y2VfY29uZmlnX3BjaS4gSSB3b3VsZCByZXNldCBhcyBhIGNvbmZpZyBvcGVyYXRpb24gYW5kDQo+
Pj4+IHRoZXJlIG1pZ2h0IGJlIG5ldyBvbmVzIGluIHRoZSBmdXR1cmUuIEkgZG8gbm90IGJlbGll
dmUgdGhlcmUgaXMgYSBuZWVkIHRvDQo+Pj4+IGhhdmUgZmluZSBncmFpbiBhY2Nlc3MgY29udHJv
bCBkb3duIHRvIGluZGl2aWR1YWwgY29uZmlnIG9wZXJhdGlvbiwgdGh1cw0KPj4+PiB0aGV5IGNv
dWxkIGFsbCBiZSBjYXB0dXJlZCB1bmRlciB0aGlzIG9uZSBob29rLiBSb2dlciwgd2hhdCBhcmUg
eW91cg0KPj4+PiB0aG91Z2h0cyBhYm91dCB0aGlzLCBpbiBwYXJ0aWN1bGFyIGhvdyB5b3Ugc2Vl
IHZwY2kgZXZvbHZpbmc/DQo+Pj4NCj4+PiBTbyB0aGUgY29uZmlndXJhdGlvbiBzcGFjZSByZXNl
dCBzaG91bGQgb25seSBiZSBkb25lIGJ5IHRoZSBkb21haW4NCj4+PiB0aGF0J3MgYWxzbyBjYXBh
YmxlIG9mIHRyaWdnZXJpbmcgdGhlIHBoeXNpY2FsIGRldmljZSByZXNldCwgdXN1YWxseQ0KPj4+
IHRoZSBoYXJkd2FyZSBkb21haW4uICBJIGRvbid0IHRoaW5rIGl0J3MgcG9zc2libGUgQVRNIHRv
IGFsbG93IGENCj4+PiBkb21haW4gZGlmZmVyZW50IHRoYW4gdGhlIGhhcmR3YXJlIGRvbWFpbiB0
byBwZXJmb3JtIGEgUENJIHJlc2V0LCBhcw0KPj4+IGRvaW5nIGl0IHJlcXVpcmVzIHVubWVkaWF0
ZWQgYWNjZXNzIHRvIHRoZSBQQ0kgY29uZmlnIHNwYWNlLg0KPj4+DQo+Pj4gU28gcmVzZXR0aW5n
IHRoZSB2UENJIHN0YXRlIHNob3VsZCBlaXRoZXIgYmUgbGltaXRlZCB0byB0aGUgaGFyZHdhcmUN
Cj4+PiBkb21haW4sIG9yIHRvIGEgcGNpIHJlc2V0IGNhcGFiaWxpdHkgZXhwbGljaXRseQ0KPj4+
ICh4c21fcmVzb3VyY2VfcmVzZXRfcGNpIG9yIHNvbWUgc3VjaD8pLiAgT3IgbWF5YmUNCj4+PiB4
c21fcmVzb3VyY2VfY29uZmlnX3BjaSBpZiB0aGF0IGRlbm90ZXMgdW5tZWRpYXRlZCBhY2Nlc3Mg
dG8gdGhlIFBDSQ0KPj4+IGNvbmZpZyBzcGFjZS4NCj4+Pg0KPj4+IFRoYW5rcywgUm9nZXIuDQo+
Pg0KPj4gSXMgaXQgbGlrZSBiZWxvdyB0aGF0IEkgbmVlZCB0byBhZGQgZm9yIFhTTT8NCj4+IGRp
ZmYgLS1naXQgYS94ZW4veHNtL2R1bW15LmMgYi94ZW4veHNtL2R1bW15LmMNCj4+IGluZGV4IGU2
ZmZhOTQ4ZjcuLjdhMjg5YmE1ZDggMTAwNjQ0DQo+PiAtLS0gYS94ZW4veHNtL2R1bW15LmMNCj4+
ICsrKyBiL3hlbi94c20vZHVtbXkuYw0KPj4gQEAgLTkxLDYgKzkxLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCB4c21fb3BzIF9faW5pdGNvbnN0X2NmX2Nsb2JiZXIgZHVtbXlfb3BzID0gew0KPj4g
ICAgICAucmVzb3VyY2VfcGx1Z19wY2kgICAgICAgICAgICAgPSB4c21fcmVzb3VyY2VfcGx1Z19w
Y2ksDQo+PiAgICAgIC5yZXNvdXJjZV91bnBsdWdfcGNpICAgICAgICAgICA9IHhzbV9yZXNvdXJj
ZV91bnBsdWdfcGNpLA0KPj4gICAgICAucmVzb3VyY2Vfc2V0dXBfcGNpICAgICAgICAgICAgPSB4
c21fcmVzb3VyY2Vfc2V0dXBfcGNpLA0KPj4gKyAgICAucmVzb3VyY2VfY29uZmlnX3BjaSAgICAg
ICAgICAgID0geHNtX3Jlc291cmNlX2NvbmZpZ19wY2ksDQo+IA0KPiBOb3cgdGhhdCBJIGxvb2sg
YXQgaXQsIHVzaW5nIHRoZSBleGlzdGluZyB4c21fcmVzb3VyY2Vfc2V0dXBfcGNpIG1pZ2h0DQo+
IGJlIGVub3VnaCwgbm8gbmVlZCB0byBpbnRyb2R1Y2UgYSB4c21fcmVzb3VyY2VfY29uZmlnX3Bj
aS4NCk9rLCB0aGFuayB5b3UuIEkgd2lsbCBhZGQgeHNtX3Jlc291cmNlX3NldHVwX3BjaSBjaGVj
ayBpbnRvIFBIWVNERVZPUF9wY2lfZGV2aWNlX3N0YXRlX3Jlc2V0IG5leHQgc3RlcC4NCg0KPiAN
Cj4gVGhhbmtzLCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

