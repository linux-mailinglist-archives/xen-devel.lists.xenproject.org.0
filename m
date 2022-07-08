Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AB556BBAE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 16:35:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363450.593977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9p3P-0002Gm-2A; Fri, 08 Jul 2022 14:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363450.593977; Fri, 08 Jul 2022 14:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9p3O-0002ET-VL; Fri, 08 Jul 2022 14:33:58 +0000
Received: by outflank-mailman (input) for mailman id 363450;
 Fri, 08 Jul 2022 14:33:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A2n+=XN=citrix.com=prvs=181881a80=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1o9p3N-0002EN-BP
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 14:33:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcbec41c-feca-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 16:33:53 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Jul 2022 10:33:47 -0400
Received: from MW4PR03MB6539.namprd03.prod.outlook.com (2603:10b6:303:126::9)
 by BL1PR03MB6006.namprd03.prod.outlook.com (2603:10b6:208:313::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Fri, 8 Jul
 2022 14:33:44 +0000
Received: from MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::e0da:b315:76f5:37f9]) by MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::e0da:b315:76f5:37f9%8]) with mapi id 15.20.5395.020; Fri, 8 Jul 2022
 14:33:43 +0000
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
X-Inumbo-ID: fcbec41c-feca-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657290833;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=3kukgLARFaz50JXu0PwK5hZ5dO7sM74fPM2c8+kbvPw=;
  b=cKE5SdEersToB9TkdIboQXxUrxDRsRbn14hX6xVueyy03qTBenNqJCFK
   redwgtKFIMppYzqN0mkCqh2fP1XRRxZMz5VnzElZfDSSJjD9/S+DzRZzz
   qMKGIaGpnVbnnJFSFrANpgwkl4tuZBbXCzOYO18me+vtGrTNfcC4CH5vk
   k=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 75198201
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rB2/UaAplc3FxBVW/6niw5YqxClBgxIJ4kV8jS/XYbTApGh0gzdSn
 GEeCz+GafyOY2fwe9pxPI3i/R9QuJ/dz9VjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Fh0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh+0
 85hmq6QbT4qYJHypsI/VTVKOTlxaPguFL/veRBTsOS15mifKj7G5aUrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t2B8mdEs0m5vcBtNs0rstOB/fFe
 8sQb3xrbRLMYhJnMVYLEpMu2uyvgxETdhUH9QvE9fBvugA/yiQyjpKwCuLOY+WWRJpxxhyzr
 HmZpW7AV0Ry2Nu3jGDtHmiXrv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWQdVEI
 VYT/Skohac3/U2vCNL6WnWQv3qsrhMaHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOnM0rQT0n0
 HeZktWvAiZg2JWOUm6U/LqQqTK0OAAWIHUEaCtCShEKi/Hhr5s0lQnnVct4Hei+ididMT353
 T2itiU1gLQXy8kR2M2T/03BxTSlpZHLTws8zgTRQm+hqAh+YeaNZIG26F6d8fdJKq6YSEWMu
 D4PnM320QwVJZSElSjISuNdGrisvq+BKGeF3w8pGIQ9/TOw/XLlZZpX/Dx1OEZuNIADZCPtZ
 0jQ/whW4fe/IUeXUEO+WKrpY+xC8EQqPY2Nuiz8BjaWXqVMSQ==
IronPort-HdrOrdr: A9a23:CbUESKHO2YGR7EZRpLqFRJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdgLNhcItKOTOLhILGFvAE0WKP+Vzd8mjFh5ZgPM
 RbAuRD4b/LfD5HZK/BiWHWferIguP3iZxA7t2urUuFODsaD52ImD0JbzpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlAawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontVrcZrau5t+7f63+4oowwbX+0OVjUNaKvm/VQUO0aKSAZAR4Z
 7xSlkbToJOAjjqDxyISFPWqnXdOXAVmjDfIBaj8AXeiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfFv9dYvGlqr1v4EDrDvKnZMOq59ks5Vka/pWVJZB6YgEuE9FGpYJGyz3rIghDe
 l1FcnZoPJba0mTYXzVtnRmhIXEZAV4Ij6WBkwZ/sCF2Tlfm350i0Me2cwEh38FsJYwUYNN6e
 jIOrlh0LtOUsgVZ6RgA/ppe7r9NkXdBRbXdG6CK1XuE68Kf3rLtp7s+b0woPqnfZQZpaFC76
 gpkGkowVLaV3ieefFmhqc7gywlaF/NLgjF24VZ+4VzvKH6Sf7iLTCDIWpe5vednw==
X-IronPort-AV: E=Sophos;i="5.92,255,1650945600"; 
   d="scan'208,217";a="75198201"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXiMiy/kIgwie4H/Ch1eA3ZHA30RMLZzt0K2ise+U9rcAgfJBqFta5sjmEpHslDBTyDvDbycd1bTfooCMrfrlbxXlnPALpZ9WBHL2rgdKpfMA2yH0ALndtbLMMX1wnjJLtRgFtd5Yr6HMax7JPKEYVTOpfCJNZaXV/6z/gmqAam0UAJAt5gsgf+6iVH9iiJQlYVC3IiX7fwQiYYPX24gWpCkAktQvWZc+Zgiy1cZ0bEBEPJVB7g2sh8xJixDuEI1oAIELwF3lu4JyOF/WDe9cz6Jzw+t99jTW+Luq4BIzaixR03CZX9nK99LsWUV1PQTAQaIAfEJRX/pXVYec4XL3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kukgLARFaz50JXu0PwK5hZ5dO7sM74fPM2c8+kbvPw=;
 b=DzsUFe5Dd/0gTWHfU+RGxGDHMEw3vVsQli94bSCNPbDVY6qkLAhJki0KCMBXE/hTddIVdKKqz11GRfoI/caO+XG5UyazhEPz5mvQHwvp9m99wqWs4tC2LL1X6fvKH/9GHLf6XTNRO8gJ2Ue77yDDo7yy21oEuIduZJZZEfndYN9rcfRKCaf8RNU6+oxkoLJhBlYGeFeU7keqEEFOHU+KU6Vil8GbzLFzvft3ZMdDZNr80piduw+fwbEMA8VkPyvOB5hq3g4UpHyG77nt6oqsjy7mUSIEyd5TVj/4lYpZmTKXROALheEeicMQYepb/aUOljPOqBSb/aUzdsRoIJc4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kukgLARFaz50JXu0PwK5hZ5dO7sM74fPM2c8+kbvPw=;
 b=Aw2lPJjsOvbQ7dFAmX8lHQ4mVWdqykoscWHnVrjrBkNTQ4JzU2Yut3qiDRGQhiDFBvkXVjIbHvAPP1C0qGx6qcwj96AWS7WEiDELhCDvVti6aQIre+xHxXrMUc33BiIe3R4mBXyTeuy8stKxd0AZvsqN1uqmHRfSPXEK96LoooE=
From: Christian Lindig <christian.lindig@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, David Scott <dave@recoil.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v11 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v11 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYktKDJjC9h3GSPECMuS4XA01GsK10icwA
Date: Fri, 8 Jul 2022 14:33:43 +0000
Message-ID: <A226BF44-AE5A-4689-8D56-334A148D9075@citrix.com>
References: <20220708135559.30719-1-jane.malalane@citrix.com>
In-Reply-To: <20220708135559.30719-1-jane.malalane@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5b490a0-cbdf-4ffe-01d3-08da60eedc0b
x-ms-traffictypediagnostic: BL1PR03MB6006:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xFVxnavx/4ia3h07L0VaOvaI9JQinpZjvBlkjMk83AKTNPIwaO7UYWKArx5wAcrXDQo2HkwnOb9Ef/oL7N+7SatM4Br4ic80Ugjh8NRQevFGXIPxn8JmNNgp4F+ePC4eO1s0DFqL8Nxxb6lsBYduQskwJeKXB7jQLHBvvFjXYQnbb+A2e2J/goxJ89AtsTw+l+EsXPqOq/pGNJBpiqkIf2kUdTknArY52zn4uvCrvNBQQ69v9TF66S+/Qk4fRg1D+tnF1kpLo2kjG+iyQrZ5AOhgGxMWiWt6SNQwVya1oIgHzijzAJ6YiMV1bPXidAsSsn2A0fDj5YY0266mVBo9VxU/lUYhsbdLP7d8b3sC3GisQsJJ7fjfDwaxBUIoTSaFdNodryXYixk9etqmbs2fAgwBjb5XH8XHz1a7w6IDAlBS9vZekDMRzzaLrFifHDt4ysByV0Y6tOGLlKw1UQN8xyzmuoM47DZxhJY8jlK9/7CEO9ag13xryPnU2dUtGC3renS+4bQuyb7Ppv4u1lAKDMPuj4KArwSIDbyKV3ehqS/3afF8kDeCKTQEhk4trikumkwsLT4BD47wBAj8Otk7Q/qoziwr2Xuy9mY7Hpy3soBPmIvTukQpua012wGSnfb9PEjlP89p/9FShy3nIwdCcvFp0i3LoSN1O29ZZvcMastVf5b1mh70hF/PEEcVXAD7rXjQAijoenctPbNhJ6u5yrb1p/ky5VyAcbDv6INO6Uc/Xbk+nNPRhBvQaLRhBtF3Tx8VCzvC/XnO3aKv5nw2hz5hUuf9f7j5gT5GAGMWOI0SdtAF8XHryr0LER9brt/SYB/ME4urfNbGEPUWkEdzzxpaFr8zgKsjmwD1y5t/lGk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6539.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(66446008)(186003)(36756003)(53546011)(6506007)(8936002)(2616005)(37006003)(7416002)(26005)(6862004)(6512007)(91956017)(64756008)(6636002)(54906003)(71200400001)(41300700001)(66556008)(44832011)(66476007)(316002)(6486002)(4326008)(66946007)(8676002)(2906002)(76116006)(5660300002)(38070700005)(558084003)(38100700002)(478600001)(82960400001)(33656002)(122000001)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cEhXK0s5ajlyMHJoRDMydmgzclkwM2R2SHFXRmVSaUJ0SnNZdSszKzhWMHV6?=
 =?utf-8?B?VVRyMmxBdG5kNng5cEE1ZFF5RCs2U0tGVGhIdStUMjBEQmk2dGhvMGtwOWNt?=
 =?utf-8?B?ZjFqdGJXTGFqRWV2WDZCZk5YbDJLbGcvZDRHeGp1VHd6VC9iTktvdmh5bFEz?=
 =?utf-8?B?eXdBL1FrckRIVnFKbnVvWDZtWk13cnpYY0NsVXRPUWFmdFBaRzBXNkNlS0M4?=
 =?utf-8?B?SmdGc3RGc0p5b1lBTDhUbHkvdUJoS3FoTmx6Ui9pcHR4QUFmNE5iQjFxSjlO?=
 =?utf-8?B?UU1KTlhmSzJYQkpEdkdsM0drSE1GT2EvVk5lWnVRclN3cFltcytZNXRyZVNk?=
 =?utf-8?B?UVAxNUhnTjdTSnFuTWIvZkY1c2I2bTZmdVpMbEJITHIrcDVjTEJ0bVhxdXdT?=
 =?utf-8?B?T2pEaFJoREhZaE1vaGF1dHh4RU5ScTRDZ09SSmNtYzgvQk5XZS9CUEIzbVlp?=
 =?utf-8?B?ZjVXeExiMjg1VjRaQzBxNkdISEdEMmpOTUFZeVlXd09GVUhUSjZPWnorSERt?=
 =?utf-8?B?MUlpalhZRW5xdmptcDNORnpwVkhEcFV5NjFmSDV6NzVGeGRmLzZNejZzc2c5?=
 =?utf-8?B?QTc0WFRRS0hNT3QyR3loTmk3ZWNSTUdMMC9KN3Exem9xbFByR3hha1VxNnV5?=
 =?utf-8?B?cm94eTU3MWJoV3lMdjdTbXVLVmJNMi8yQzduS1BpNHlCTFQ0OVltNmV3d3Jh?=
 =?utf-8?B?K29tQlZSSUR0aDhmR2h1OGpKaWVnSHd3Vk9nU3hkOHgxSWNNeEtrMmYxTm84?=
 =?utf-8?B?RSs4YStGQTFwYlMzeFlHcUp2QjVYQ01pUmh5eGx5UEdJOXZVVW5UYXl2b2xV?=
 =?utf-8?B?RXVBaEJWYkxVSGt5dmVROEZLSW13M1Fuam9ZUnl4K2pWUkdUL3lPUytVeGF6?=
 =?utf-8?B?aUF4QzYrZDVVYWcyNWdSNTdzSm8xeVZrQklBbDVTQmlVdTRYek1nQlpTTmJP?=
 =?utf-8?B?N3hIU3RNV3V6R0tVZkJORHF5a3N4MGx0VGJveHJqaWFMd0x6eFlhN0JibUZa?=
 =?utf-8?B?MXRMSGhUZ0NJL3dlTTM5TW9qVElDanFCRDJJbGltL2ZSVmd4REMyZTM2Q0N6?=
 =?utf-8?B?UUFudm9RUmtDM1owa0ZReWFKcExMTmRHalFpZVhuVkFEQnVObm45dGhyVE1o?=
 =?utf-8?B?cm9OdElOZlM2cytQQlRQclBxWlFpakpzaU5ydnYxZEthL0NzajRTbVFMZ3h3?=
 =?utf-8?B?YjlkT042QUczQ0doQ1pvVEY0eDByOGI3Z0JEY1Vjcmc3ZTUxdlpyVnQrcEcr?=
 =?utf-8?B?Z3JPOW5leld2TThWMjdnKzl0dUQxd2piL0thS3BYY3hJU0NEdzFKeW85SHhx?=
 =?utf-8?B?Z0ZMd0xOenlUc3o0ejQ4ekpRSm9hWHB6ay9qbHN4Zis5cW5Ga0JrUFNCYlF6?=
 =?utf-8?B?dmcvRjdrTHN0UDdHZzd6elVITDloYWJnUWZMOVJvTnhwVEQwbEd2VDRoeUZS?=
 =?utf-8?B?d3FYc015bGthK0ZabjZsVFhPbHQ4ZGZSMjhtZUxOWGI2M2hlaFYvYlNtQ1ZX?=
 =?utf-8?B?a3NZOStkSEM2RkZUOG1tNFR3TnlZcVM2VnU5YU9iaVlqNEMwVVphcHVQVDVR?=
 =?utf-8?B?YnpZbGpURjAvSFVqWlMycTdtWlF6aDVkcXIraisvbDhDb0tDUURzTTVkcDRo?=
 =?utf-8?B?SWdkTFpMcDhRMzZYOWJncDZGZFErZXlNcUpjOHQ5b1o2M2N0c1FCTzJmUGs4?=
 =?utf-8?B?dG1VeDVYMW1GcjRyNU5qb1QvZlJQSXVnTW9zTnQ0akxLU01kejdVR0pud3lD?=
 =?utf-8?B?RjQyenZUeXVHQ210S3VzK0xydmJzTjV5UlAyR2UzUXFBSDhpMktQMTlLSVYv?=
 =?utf-8?B?UTB0K3RRL0U5YUpORTlnRGhqWWFRUUxRTlk4cnI5d1gzUXl1cjNmSktoRFlC?=
 =?utf-8?B?RHZCdmtvWnpUL0xwT0lNSzJVZGR5ZFVxdWpJUzVjRWFCRE00ZkFjSDEyNUJT?=
 =?utf-8?B?MkpHRUFSNkVDekkzRGU0aXRPeHNVTFdhd1R3dUVtZkhYTWtaTEhja29sNVht?=
 =?utf-8?B?RUxLYmYxYS9VK3JKcUhiZTJhcTBrWGhGbjJEeG1ZMFNRM3poMVZaTFVlcThM?=
 =?utf-8?B?VlBWS3FTMkd4RTVKblRPVWxKaUg2bzFRZ20vbCtaeHF2WlVKWnk4cnh0c3hR?=
 =?utf-8?B?QUxVZVlxN3diaUFEeUR3c2lkTENmM3Ntd2lNb2l3emVBb2pORTBJOWdRVVZy?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: multipart/alternative;
	boundary="_000_A226BF44AE5A46898D56334A148D9075citrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6539.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b490a0-cbdf-4ffe-01d3-08da60eedc0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 14:33:43.6382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9RHfzw39uMPEl5Thlo2NulY2DUOZT/AlLjOA+6F2zY5/vuy8VNtTW0WXL1n8NEVPMqXKEhD3cLXeNFwdS3PdEH2RdpUgnp0NlWWogPY6WU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6006

--_000_A226BF44AE5A46898D56334A148D9075citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDggSnVsIDIwMjIsIGF0IDE0OjU1LCBKYW5lIE1hbGFsYW5lIDxqYW5lLm1hbGFsYW5l
QGNpdHJpeC5jb208bWFpbHRvOmphbmUubWFsYWxhbmVAY2l0cml4LmNvbT4+IHdyb3RlOg0KDQp0
b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgICAgICAgfCAgOSArKysrKysrKysNCnRvb2xz
L29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkgICAgICB8ICA4ICsrKysrKysrDQp0b29scy9vY2Ft
bC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyAgfCAxOCArKysrKysrKysrKysrKysr4oCUDQoNCkFj
a2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb208bWFp
bHRvOmNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4+DQoNCg0K

--_000_A226BF44AE5A46898D56334A148D9075citrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <D08E2B4ADE2C544EB252116C56FCB8EE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDggSnVsIDIwMjIsIGF0IDE0OjU1LCBKYW5lIE1hbGFsYW5lICZsdDs8YSBocmVmPSJtYWlsdG86
amFuZS5tYWxhbGFuZUBjaXRyaXguY29tIiBjbGFzcz0iIj5qYW5lLm1hbGFsYW5lQGNpdHJpeC5j
b208L2E+Jmd0OyB3cm90ZTo8L2Rpdj4NCjxiciBjbGFzcz0iQXBwbGUtaW50ZXJjaGFuZ2UtbmV3
bGluZSI+DQo8ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAs
IDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6
IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0
dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7
IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6
IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5v
bmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNzPSIiPnRv
b2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbA0KICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwO3wgJm5ic3A7OSArKysrKysrKys8L3NwYW4+PGJyIHN0eWxlPSJjYXJldC1jb2xv
cjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7
IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWln
aHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQt
aW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3
b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRl
Y29yYXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdi
KDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQt
c3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQw
MDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50
OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNw
YWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRp
b246IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNz
PSIiPnRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkNCiAmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDt8ICZuYnNwOzggKysrKysrKys8L3NwYW4+PGJyIHN0eWxlPSJjYXJldC1jb2xv
cjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7
IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWln
aHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQt
aW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3
b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRl
Y29yYXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdi
KDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQt
c3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQw
MDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50
OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNw
YWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRp
b246IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNz
PSIiPnRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jDQogJm5ic3A7fCAxOCArKysr
KysrKysrKysrKysr4oCUPC9zcGFuPjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8ZGl2
IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCjwvZGl2Pg0KPGRpdiBzdHlsZT0ibWFyZ2luOiAwcHg7
IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDExcHg7IGxpbmUtaGVpZ2h0OiBub3Jt
YWw7IGZvbnQtZmFtaWx5OiBNZW5sbzsiIGNsYXNzPSIiPg0KPHNwYW4gc3R5bGU9ImZvbnQtdmFy
aWFudC1saWdhdHVyZXM6IG5vLWNvbW1vbi1saWdhdHVyZXMiIGNsYXNzPSIiPkFja2VkLWJ5OiBD
aHJpc3RpYW4gTGluZGlnICZsdDs8YSBocmVmPSJtYWlsdG86Y2hyaXN0aWFuLmxpbmRpZ0BjaXRy
aXguY29tIiBjbGFzcz0iIj5jaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb208L2E+Jmd0Ozwvc3Bh
bj48L2Rpdj4NCjxkaXYgY2xhc3M9IiI+PHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1saWdhdHVy
ZXM6IG5vLWNvbW1vbi1saWdhdHVyZXMiIGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCjwvc3Bhbj48
L2Rpdj4NCjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0
bWw+DQo=

--_000_A226BF44AE5A46898D56334A148D9075citrixcom_--

