Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CFD5320C2
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 04:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336112.560419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntK33-0008AB-U1; Tue, 24 May 2022 02:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336112.560419; Tue, 24 May 2022 02:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntK33-00088O-Pg; Tue, 24 May 2022 02:13:25 +0000
Received: by outflank-mailman (input) for mailman id 336112;
 Tue, 24 May 2022 02:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQM0=WA=citrix.com=prvs=1363f17a3=lin.liu@srs-se1.protection.inumbo.net>)
 id 1ntK32-00088D-L5
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 02:13:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14ded635-db07-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 04:13:22 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2022 22:13:19 -0400
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com (2603:10b6:a03:286::9)
 by BN7PR03MB3793.namprd03.prod.outlook.com (2603:10b6:408:22::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.21; Tue, 24 May
 2022 02:13:16 +0000
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0]) by SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0%4]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 02:13:16 +0000
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
X-Inumbo-ID: 14ded635-db07-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653358402;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=ETI5lgl/3m9IUCtgiWyuJwF8JNLOeeWfyETpf3qEOIk=;
  b=KAE0qUnXFSbuiynnNRftLHNF+Gzh14/l7yCwhiPomMU7vlAXnxjax+sp
   yH8q70NjJP6Hisn4aZaXcBS+BBTMOOjIIRNZwHD59vPOPZawjarbls2Ot
   N6STCVUsIErrw+2OvjqmBnOZtfsHlWD4Dnug89iWQ7yPZi7Yvlrism9In
   s=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 72010556
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:E+mWe63wH40rcZZ3nvbD5dZwkn2cJEfYwER7XKvMYLTBsI5bpzMAx
 jdOWG6FaKzZNDfye9skOoTn9RgB6pTcz9I1TQFppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMy2oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Cl6OqExYqfZfho9UUVh9zSH15EJ1JreqvzXiX6aR/zmXgWl61m7BEKh5zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B8+bBfySube03x9p7ixKNfLfY
 YwdaCdHZxXceRxffFwQDfrSmc/33CGmK2AF9jp5o4Iv4lTr3gMr1oHOPeLnVf/NdPV6hxex8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZ1hHWDy2pVDwcZPXO5ruO+kVWWQM9EJ
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6k6nMsSzdAbJksspAwTDlzj
 luRxYqxWXporaGfTm+b+vGMtzSuNCMJLGgEIygZUQ8C5Nqlq4Y25v7Scute/GeOpoWdMVnNL
 /qi9kDSW517YRY36piG
IronPort-HdrOrdr: A9a23:mzuTlaHzzu39Ta2opLqFXZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdgLNhd4tKOTOLhILGFvAE0WKP+Vzd8mjFh5ZgPM
 RbAuVD4b/LfD5HZK/BiWHWferIguP3iZxA7t2urUuFODsaD52ImD0JbzpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlEawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontprcZrau5p+7f63+4sowwbX+0SVjUNaKvi/VQUO0aGSAZAR4Z
 3xSlkbToNOAjjqDxyISFPWqnXdOXAVmjPfIBaj8ATeiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfFr9dQnGlq/1vitR5zyJSLsZ4J0upm0aVZFbZK5arIQZ8k8QGJAcHDji4IRiFO
 V1FsnT6PtfbFvfNhnizyJS6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEB7e
 XZNaZjkq1IU6YtHOpALfZERdHyBn3GQBrKPm7XKVP7FLsfM3aIsJLz6KVd3pDfRHXJ9upGpH
 3saiIoiYdpQTORNSSn5uw6zjndBGOgQD/q1sZSo5Bkp7yUfsuYDRG+
X-IronPort-AV: E=Sophos;i="5.91,247,1647316800"; 
   d="scan'208,217";a="72010556"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3K3f+v3TPWmEg0xYNQE9hwEkp8TRX1Cnv534BCMQeByo3EL9zVZUG3vaJkPwcIx0bqT0Qr/xVry3/+zcKc4FfisXUJNcdDcEnO5BG3lxpttX12ybc1tBTKY+MOJGYRSIrpS3hiCC5ehCp8DX9zJigaaELs4sk3LIg5QpFma+H2PShbGsv9+K5Jd5vv1LRHiwgzNSqL2j2TTEf6ekjNk4v69d2U+pu9LxK4EVWY21W+BPijIAGIDiSF/N22zqDud+uxlpZqzvh2q10wJs7arlz4gL0WlHy8lnzry8ZyA5PJtHq+BlYqZtxteFXPrzf06GQbikyoD66wxml32d7VtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyxD1VU65ez7Qp9e4oA/6H0iqQo9B+47QKdSXP4oZy0=;
 b=C7AfdZkuKC+fWio78GDB+I2ibc9HC+Y9HR7uCY29LVFbSXo4ZMbCsMuq3zf71dTeL1sxJQIcnx50+jtDjCNtMytzC4V8nU22EGPlR434riq/wHcK9nTYUDHMXziLSJkoztYsvn5IWoP9peHWmA2gT3+vqHKqJNuaxzs25zKuh/vCVDfnbvNUhmQhUoRofcDqe+vORVjTnXbJhw+K+POVZmJtbhX4MfAVNSCtVh0uJZq84QsF4JQwrl10bkTQVipTDeBYP1V/pLa8t1Mv3D+M8Cil2yX4FmQx2Uw2xazhruA0AdSsBrkKzkwSfRYObyMJ02jwaYs/v7/tDLie9jEgOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyxD1VU65ez7Qp9e4oA/6H0iqQo9B+47QKdSXP4oZy0=;
 b=fUHlM6foKiipwLVauvtva3QQ6wfxm4wHkD8cSW4QguardBsKxC+sQgEXn6dIapZVaMjNR4sZOjAgVWfOw2xKgNa99ILpBpnXV+H9yvHtYabEXcMY1hyGbR+Rgdt7AhQwCPljixPf/WcNHtiy5oafNH8ol1BsUfSIHZYIlsgjTeU=
From: =?gb2312?B?TGluIExpdSCjqMH1wdajqQ==?= <lin.liu@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 5/6] tools: Use new byteswap helper
Thread-Topic: [PATCH v4 5/6] tools: Use new byteswap helper
Thread-Index: AQHYbordwufrrqV0k06ypnfJmfxjlq0sTnKAgAD4X1E=
Date: Tue, 24 May 2022 02:13:15 +0000
Message-ID:
 <SJ0PR03MB5405CF5CC73882FF523134C69DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
References: <cover.1653295437.git.lin.liu@citrix.com>
 <af1856e7606e948308919d0e66dcae3766318c6c.1653295437.git.lin.liu@citrix.com>
 <b800ac14-f8a8-0aac-32b8-b4fb3d7f25c9@suse.com>
In-Reply-To: <b800ac14-f8a8-0aac-32b8-b4fb3d7f25c9@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bf2c8ee-d0d6-4607-bea1-08da3d2af67e
x-ms-traffictypediagnostic: BN7PR03MB3793:EE_
x-microsoft-antispam-prvs:
 <BN7PR03MB3793A2144769CA91D868615A9DD79@BN7PR03MB3793.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4QDzZw7PTF24vZJeXjQCW40FLnKJbaS7C9cGbOXcTpAxQgz5B7P6uGV6Kw1OMwyyyheDeAZ0hLZUgGkXzecgER+WlZYRsdJxB+jPoXGS5wPEAtYdQb9r8tL6+x0BHYUHbhLyfRM9xMdA7i1ehF9DFc8BREuewZ1+n1PhtMDWiIgT4VgOS1cFqdO1dK8jDjFOSD66J3zmjCx8gCUP0QmyEOA5nu5s+gaTX/y+Ebd3uXd8JRqcUBw+dZmxCfM/VtJ4tP5OPOWn7/Y4Zu9V43ICKGYBdRV2e8cQPBiGk9D/AI57DARL+H3A/KBruX80VirO6RxAhKll1uVyLeyvMfTkzw7GH3Aga/teAwaxFp7WqGkEgVX0DBChZ6KJDdYvIIXmjm8X4Mvc0KqOObh44xDJtDewGv+EboDNafj4Y0APy613MXlWI6bJot69l8Mr4AM2aCxaOco1IUPnbtVtIGnNch0KYaou+CohyHEABs60EUZfk31syDxl4vJib4p/tpueI4954C3iyK5aACdr0pdiAaKo2TI6RVbHiti/ukZO69tlRL0hDZsXLgOqgL68E1cJo1xfyY17iDuBQ6689oN2d8tTi8xkbSW28vF8sAS6VcT//pc15GbP/ZVSdM2lVSSBIF1ubQKoZIzQ1hJSuAYDZ7vOzV1jDpOoBSeKlJNOOdo6SjRtfSqY4MvODehXdjZR44qEUgdqc0i1mYgp74vtFw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5405.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(86362001)(6916009)(33656002)(316002)(508600001)(54906003)(55016003)(38100700002)(76116006)(4744005)(66946007)(122000001)(71200400001)(82960400001)(8676002)(186003)(9686003)(7696005)(6506007)(38070700005)(8936002)(64756008)(66556008)(26005)(85182001)(52536014)(53546011)(66476007)(66446008)(5660300002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?SlRIYVBOcHhPM1BlSEdQeWNxeGsyRkhiVW1BdEp6TW8yVkZ4N3hQUWdzZVlC?=
 =?gb2312?B?T0RTbWI4cjBTRGtSOFdIelJ3elNJbnZsaklxR2x6bWpOTEMwSytDbFd4amJh?=
 =?gb2312?B?UnpmMG1idUpCRG1JN1NpVkFINDAxZFdic0VJeGk1a3AwdW9sNmk1Y2tpSjRC?=
 =?gb2312?B?ZW04T1MrQkpPTkVoRVh1aVhjZWdsWkJpd0gwU3RDS3VjcmZZSm1mV3FGMnVB?=
 =?gb2312?B?UXBYeHhuOSt2Zlp0bG9xeGhXd2lyQ1c5Q3dZaGhoZGRIK3FSS0ViYXlVaFpO?=
 =?gb2312?B?ZEVEbHV1c2U1Wmk3WHpLNUlhMmxUYUExVGs4L3RUSmR5dVpGdmV4aHNOUHJl?=
 =?gb2312?B?UzVrK0VoRHdzN295bExVNjFPN1lvaml0a0E3YXJmb2M0aHpZTlpaT0c1RVpU?=
 =?gb2312?B?Y2FpSzdzMlI5MFZ6b0hzRC9pbUxmcHhta1gvN2lzRU4yU21ZTHJ1OERTQ3l2?=
 =?gb2312?B?aFdtbm5tTkhLZmVUbzJrejgraEcyQjNYT1U4S3hxWHVib2hUS0FucUk2cnkr?=
 =?gb2312?B?TjgwWFl1a0FDTS9yWFBFZWVvdmNkNHVhQnozMHh3M1NPaStUZ2hwaXMxS2w0?=
 =?gb2312?B?QzdWM1Y3a2JQL1JtOWZ6Wk5WZDJlRDMwaG9aQlo0WkpGRklkbHdNVDZFSEd0?=
 =?gb2312?B?TGVNV3NmRWs1TDZabldOS2g5aE13UDZEQkhhbjRBdkhmdlJSS25wZ2pYb21p?=
 =?gb2312?B?RXpWZHN4V1R1eko1ZVhRcUU3RXBUY1oxaFB2dk9mWVYxMWNxT0xneWk4bFA5?=
 =?gb2312?B?RkpWKzliSkYzL2JkelpHUS9qalpvelU0QlFDeUNGVXkrTXFEVE1ldGR5NDQ2?=
 =?gb2312?B?dnQ3eFoxZ0g1enVhKzRQTDNXQjRFS05yNmVoc1FSaW8vaVB4bkNvM0loUEow?=
 =?gb2312?B?QlpENm45cEdYOWMzSWk1MHQ0cDdvU21zcEY1ajlOdnJtaFp6UHNyUjN3SFh4?=
 =?gb2312?B?NnVmTDlGTjVQOVd4T1AxTVV1NzVWRzBCVFZhT0xmSFh2TndXaTQ0VXNjVGVP?=
 =?gb2312?B?Wm95SGV1SzZBNmFSUDg2RThyU1N1WjVXdUEvdm9OdkxHNjBTVGFyT3VCOHg0?=
 =?gb2312?B?RDFneXVPZmFZMG4veTYyOG1VUGZkS25oOTI0a3YxcU9IWTI4VjVjbzhYaXlT?=
 =?gb2312?B?cmhrbnRiMzdHZ1R4cm4yM2ZlM1Y3dTRZVUpEU2NuaU9LYmFIVTFyUk9CTmhy?=
 =?gb2312?B?VEQ0dnhZK0FQbkxqeCtlK0Q2dVZuNzZDN3dBUzJ0Q0MyNkVvTTdLOEVUSDdr?=
 =?gb2312?B?Z0ZrMGxkdGRNM3Rpb2E4VjFDR3NYcGNUU0JWUXRTYmRYaFFRQWNTSjFNam1T?=
 =?gb2312?B?QWdBWnd5eklJMEZuc3RoZEhkZ09QY0xHSVN3TVJrSFZ6bXVyVkFVbUFOUUhs?=
 =?gb2312?B?SVBubnVxQWIxSzBzbWwrdnZGdmFoSGpmdndkcjMva1NJYzNWSG1md3hlcG9i?=
 =?gb2312?B?elI4YkdCRHl3MFRuTnZxbEtVc2YyL2xmVEJHRkk2bU5XaDI3cnpFQW83TVRI?=
 =?gb2312?B?bS93NlNtWUxjYytIU2VrdEx5Z1VPWThDNTJFVUs0UWc2aVV3ODhoU0YvRXRH?=
 =?gb2312?B?Z0V5b2tweXovMGNhT1NoblE5c0cxMXhMYWdvU1c0OEx1WkpxLzRqd1htZ0E5?=
 =?gb2312?B?M3RMaFRZTEo1SUN3TVFRUWtPMjFReE95RlNxVmxxOURLTW5yWW5IdWRKNUIy?=
 =?gb2312?B?b3p3d1JtdHdRaEw0K1FwbnpkQ1ppS2ZWTlVPMUFibktYT2JqTktiSDE3ZWtP?=
 =?gb2312?B?elZMZ2tKTE1HaW1EL1ZTWmVWNTQrTEEzaEVTS1Jqay92aXZycG45VVVvQ3M0?=
 =?gb2312?B?MGs3QVE1WU5LNHI1TEswT0t3NGdsZE41RjFlU0ZLZlp4VGZYUEVrQTNzQ0xp?=
 =?gb2312?B?SFNXQ0lqclNFcFNuaFBLMWdqeGxxMkVUdjRMYlNrd0lRSEJKeUo2eUpWZXpY?=
 =?gb2312?B?RC9wQ2RyamJMU3Jsem95UEFaN04wSHliSUFaNVY4R01ERFpjdTR1MUoxSm9U?=
 =?gb2312?B?ZGlQMyt1Skw5QkM4TUY3UllNVTFEcW5zZnMyVktHdUsyWjFsWE9tWThxbENp?=
 =?gb2312?B?czZBTjhaOWdYMTVVdGdlVFo2K3lnOVdZYWg4a0hyQTRFdGZJYkVtT0FFUW5o?=
 =?gb2312?B?cUZ6Zm55eHZIOVJHeUdKNms3ZmdFd3VyVmcwSVBYUFl4aWNpeHRSMW5OZFdF?=
 =?gb2312?B?NXZXQUNQRUZ3ZHVaWlJCQUF0ZFZBeEVVSUJQQmpZcEl0NnQ5UGtxYWlUazJZ?=
 =?gb2312?B?UVFWUXpIZDB4aC80dytybDdRdS8vdVQyKy9YclZkVlRFVkdpYkpQdGFsL1dT?=
 =?gb2312?B?R3hPVVFJTzFMYmY0eG9laFBzdWNlM1BzcytjeGk2enJmQWxEQk5Pdz09?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR03MB5405CF5CC73882FF523134C69DD79SJ0PR03MB5405namp_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5405.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf2c8ee-d0d6-4607-bea1-08da3d2af67e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 02:13:15.9143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nuu7OM8fXYimsoKYuBgj2qZ6wGZnvDIWuPSkmZe4HTFztfDNqSgOLMZdDUwai3xth6KsWBkwo7tw8v9wVYmPDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3793

--_000_SJ0PR03MB5405CF5CC73882FF523134C69DD79SJ0PR03MB5405namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

T24gMjMuMDUuMjAyMiAxMTo1MiwgTGluIExpdSB3cm90ZToNCj4+IC0tLSBhL3Rvb2xzL2xpYnMv
Z3Vlc3QveGdfZG9tX2RlY29tcHJlc3NfdW5zYWZlX3h6LmMNCj4+ICsrKyBiL3Rvb2xzL2xpYnMv
Z3Vlc3QveGdfZG9tX2RlY29tcHJlc3NfdW5zYWZlX3h6LmMNCj4+IEBAIC0zNCw2ICszNCwxMSBA
QCBzdGF0aWMgaW5saW5lIHUzMiBsZTMyX3RvX2NwdXAoY29uc3QgdTMyICpwKQ0KPj4gICAgICAg
IHJldHVybiBjcHVfdG9fbGUzMigqcCk7DQo+PiAgfQ0KPj4NCj4+ICtzdGF0aWMgaW5saW5lIHUz
MiBsZTMyX3RvX2NwdSh1MzIgdmFsKQ0KPj4gK3sNCj4+ICsgICByZXR1cm4gbGUzMl90b19jcHVw
KChjb25zdCB1MzIgKikmdmFsKTsNCj4+ICt9DQo+DQo+V2h5IHRoZSBjYXN0PyBBbmQgd2h5IG5v
dCB1aW50MzJfdD8NCj4NCj5KYW4NCg0KbGUzMl90b19jcHVwIGhhcyBmb2xsb3dpbmcgcHJvdG90
eWUgYW5kIGRlZmluaXRpb24NCg0Kc3RhdGljIGlubGluZSB1MzIgbGUzMl90b19jcHVwKGNvbnN0
IHUzMiAqcCkNCnsNCiAgICAgICAgcmV0dXJuIGNwdV90b19sZTMyKCpwKTsNCn0NCg0KeGdfZG9t
X2RlY29tcHJlc3NfdW5zYWZlX3h6LmMgcmVkZWZpbmUgYW5kIHVzZSB1MzIsIHVzZSB1MzIgdG8g
a2VlcCBjb25zaXN0ZW50DQp0eXBlZGVmIHVpbnQzMl90IHUzMjsNCg==

--_000_SJ0PR03MB5405CF5CC73882FF523134C69DD79SJ0PR03MB5405namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt;margin-top:0in;mso-mar=
gin-bottom-alt:0in;mso-margin-top-alt:0in;mso-add-space:auto">
<span style=3D"font-size:11.0pt">On 23.05.2022 11:52, Lin Liu wrote:</span>=
<span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; --- a/tool=
s/libs/guest/xg_dom_decompress_unsafe_xz.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +++ b/tool=
s/libs/guest/xg_dom_decompress_unsafe_xz.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; @@ -34,6 +=
34,11 @@ static inline u32 le32_to_cpup(const u32 *p)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cpu_to_le32(*p);<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&nbsp; }<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&nbsp; <o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +static in=
line u32 le32_to_cpu(u32 val)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +{<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +&nbsp;&nb=
sp; return le32_to_cpup((const u32 *)&amp;val);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; +}<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;Why the cast? A=
nd why not uint32_t?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;Jan<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">le32_to_cpup has fo=
llowing prototye and definition<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">static inline u32 l=
e32_to_cpup(const u32 *p)
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">{<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &nbsp;return cpu_to_le32(*p);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">}<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">xg_dom_decompress_u=
nsafe_xz.c redefine and use u32, use u32 to keep consistent<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">typedef uint32_t u3=
2;<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_SJ0PR03MB5405CF5CC73882FF523134C69DD79SJ0PR03MB5405namp_--

