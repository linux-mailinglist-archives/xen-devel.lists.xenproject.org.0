Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324CF5323E4
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:19:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336160.560495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntOnk-00008N-Dh; Tue, 24 May 2022 07:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336160.560495; Tue, 24 May 2022 07:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntOnk-00005R-AT; Tue, 24 May 2022 07:17:56 +0000
Received: by outflank-mailman (input) for mailman id 336160;
 Tue, 24 May 2022 07:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQM0=WA=citrix.com=prvs=1363f17a3=lin.liu@srs-se1.protection.inumbo.net>)
 id 1ntOni-00005I-Oo
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:17:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d0d815c-db31-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 09:17:51 +0200 (CEST)
Received: from mail-bn8nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 03:17:31 -0400
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com (2603:10b6:a03:286::9)
 by CO2PR03MB2312.namprd03.prod.outlook.com (2603:10b6:102:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.21; Tue, 24 May
 2022 07:17:29 +0000
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0]) by SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0%4]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 07:17:29 +0000
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
X-Inumbo-ID: 9d0d815c-db31-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653376671;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=tPTtfBngsBJNCa6FSVVck9zGbD4fS21cE+XTrh4m/ZU=;
  b=EuJkua7enw8+yAyE9vWfQS3RWRPnwYcMYFGT3wXZdhwCWc5CNP1gzfoP
   iwmAikPebtBevrS1wyap2qa4uqPYsG7cMLDWUiLZ9R8czLKrEmIYMIr+L
   oUKKUdern/c5KpD2Iz2ap2WnqVeaXUmjm1F44L36W5nmFxsUUE1QDPZhv
   Y=;
X-IronPort-RemoteIP: 104.47.58.170
X-IronPort-MID: 72018911
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gomSK6+Mamdu2wOEafMiDrUDhH+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2UZDG3SP6qDamH8et90O4q+oE4DsMLUzdZiSFZvqXw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3ILlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYfvRSxyDPGLod02UQtWTj1gGLxh5KCSdBBTseTLp6HHW13F5qw3SWsQbcgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvWMvIAAtNszrpkm8fL2Y
 8sfLz5ucTzLYgFVO0dRA5U79AutrialK2QI+QvMzUYxy2LPi1FAgKrTCof6dYbQGsdbhRe4g
 X2TqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqEKX7nweDlsRT1TTifu2kEmlQPpEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWblXoVRZEYd0i8cUwFToj0
 wbQm8uzXGM39rqIVXia67GY6yuoPjQYJnMDYilCShYZ597ko8c4iRenostfLZNZR+bdQVnYq
 w1mZgBn2t3/UeZjO32HwG36
IronPort-HdrOrdr: A9a23:AzDw86y0AD+zLEOKw2yDKrPxmeskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk80hqQFm7X5XI3SFjUO3VHFEGgM1/qE/9SNIUzDH6tmpN
 9dmstFeZDN5DpB/KDHCWCDer5OruVvsprY/Ns2pE0dLz2CHpsQizuRfTzrd3GeKjMnObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUazpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZXcI5p4dY2xY/ouW3bRYzWTFcZcsnq5zXUISdSUmRYXeR
 /30lMd1opImjTslyqO0GbQMkHboUoTAjnZuBOlaDLY0LPEbSN/BMxbiY1DdBzFr0ImodFnya
 pOm3mUrpxNEHr77W3ADvXzJmZXf3CP0AwfeC8o/g9ieJpbbKUUoZ0U/UtTHptFFCXm6Jo/GO
 0rCM3H/v5ZfV6Tcnic5wBUsZeRd2V2Gg3DTlkJu8ST3TQTlHdlz1EAzMhamnsb7poyR5RN+u
 yBOKV1k7NFSNMQcMtGda88aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy+7kx7PHCQu198HLzou
 W1bLp1jx9CR6u1M7zx4HRiyGG8fEytGTLw18pZ+591/rXhWbuDC1zwdGwT
X-IronPort-AV: E=Sophos;i="5.91,248,1647316800"; 
   d="scan'208,217";a="72018911"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvfRtHLKM3M0nsfN7nlop8umOOUChC5XIZJAmNVkXX9LTg2TmhVkiMpdsj76DVyqEqUBXvQcBGBLL2DMYnfrg8kWNjacdzcqgvN9Arbpp4oIShGU6DJUikV9JntMRUZ8WiSqiSGPmMbuTOBkGWpfBJTP2qEiytjx9ucadySI6fmIfRgk+7HvZezkJVReXJafZj4U31w95OGrwqNP6+enR0NFOiuaqs0hx/nTEEloLatxRvLzuEeiw+KJz53+kMywuSRMq+3kxhpgUoC2q0RUUUw9oeFAtxzg6EuchUXPa6YrFH97+XbTdmAw30zd/JNbtvqdKmSNv9Bn7ieaa7jHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0izKH5PMYIealPbWPMgRyf/l66qfZwBknEdH22WkKk=;
 b=nN/Bvi21cMnDYStDydYDjxlh7IO8v6+/XtzpliLlzgDqwjUt85uFU1gczzI0UlOrryklXAXoPFTwVHuoQIihUaBdUTiql4YW14kpWq8rcNwGbmOlKSQQb0/ZDtVXviT4Kkh918fvnxvdos1qvOSYHZBOhT8nFgRyr1/4FMWEw6vK2Aqpmjki9A2h2FmAMb13ugAK1dq+Y/hpc8oG/+7o2aodNsQ+9hooVH5U8GomV8VRtrGGeVPrjOMZUEW5PMBItAr8FvF/4iZwF0we2qcqnmnmptgoC84nXKmL9Sh1gH70FLfSQxZlq/nnqQCe1Wywntjhmzi2K3zyJ5lnbFK8LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0izKH5PMYIealPbWPMgRyf/l66qfZwBknEdH22WkKk=;
 b=ToDprqXWgSOHiFtq85qoZA3R2UHgLlxTheK+jhGo8TTiZb3cJZ59x9uH2OArZBK8g7jyAqHvyyMCVIznCR1QVENHbj/gy7dSS3lcbus6YFyyxtLunrx3NgTfWmaWZoGo+msdsqXSwcyFgtgJYG94QvNSofuuyugCRSdgC7RYNUA=
From: =?gb2312?B?TGluIExpdSCjqMH1wdajqQ==?= <lin.liu@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 5/6] tools: Use new byteswap helper
Thread-Topic: [PATCH v4 5/6] tools: Use new byteswap helper
Thread-Index:
 AQHYbordwufrrqV0k06ypnfJmfxjlq0sTnKAgAD4X1GAAEYaAIAAC20qgAAB0QCAAAVLzA==
Date: Tue, 24 May 2022 07:17:29 +0000
Message-ID:
 <SJ0PR03MB540542A4BCB2496BD1F49A769DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
References: <cover.1653295437.git.lin.liu@citrix.com>
 <af1856e7606e948308919d0e66dcae3766318c6c.1653295437.git.lin.liu@citrix.com>
 <b800ac14-f8a8-0aac-32b8-b4fb3d7f25c9@suse.com>
 <SJ0PR03MB5405CF5CC73882FF523134C69DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
 <7312f3ee-bd0e-9183-922d-c9c82cd003db@suse.com>
 <SJ0PR03MB5405B465EDA6717EF1F83A9B9DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
 <75055009-5053-0d4f-9174-3dd69add7c8a@suse.com>
In-Reply-To: <75055009-5053-0d4f-9174-3dd69add7c8a@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebf97768-ec01-439c-24fd-08da3d557662
x-ms-traffictypediagnostic: CO2PR03MB2312:EE_
x-microsoft-antispam-prvs:
 <CO2PR03MB23127F620D9BB5A311A6AEFD9DD79@CO2PR03MB2312.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 u/mpEAGXqqFrYTN45FAIwMgMr5XfMs884GKmjsmOrWSx5M8yc03lTyPW7XvqcJnxB89zeMIFrWgJrBjZ7uslGTQtAbjq+UU5TbVGu3xfF0PLGkzQTSibhNbnTYeNu/Nh7DSp/d8YGhd2Nh/VXltVudKZxdq60MToqFHpe3p1SUpzZsdJFz14L+LlG65gxWJK3MNGZL13VwcwCOpItsdq/p6rL2xqhN/gM2Vtyyp3QrpSBrl0Yzwd1GXc3SjMsG9Qjfl3ytE2GPSyWg3MEa/P1FV32Fn8Ldj4f3N4J3UI+poxMhD8eKrOqFnDkvSm14spasKFiPY9F/lVHtOIEzARSshxk4T0UePUsx3gBZg/i+QcxlnH+g6sBB+4XTUpfjUn8iNs4ZHJU1Tjo2W68kZoMPryx2vfBSKL4T0Eg6i1OsGwOT4lwnknmiGllvW3a5z+kH9GFpCYffROxUsT3V/cPqmKJ41U6/x+pZIxMVL4+P+AvN/Lh0bAvPgQGsjJfM7x1TB2kuqBn5VI233HkyOkgt5578x/iUgka/ngktnHIDWvvwS+E1Nx82DZp883yYwxZSIOqQ9Dp6DrlvWBzeJUGTPMehKEy4e7DY3EJk8Nx/fuxXKtNFWNBm8BDtpPSKGpjcNgHplQienrCCXRWQEyN9qYHR/RJfgD40SMauO0j8rNACfEAjWp5nh2BaXkDSGVZ2xBL7yBkUSe1U214KTG3w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5405.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(6916009)(122000001)(316002)(8676002)(4326008)(66556008)(54906003)(66446008)(33656002)(85182001)(64756008)(91956017)(76116006)(66946007)(5660300002)(52536014)(66476007)(8936002)(6506007)(2906002)(7696005)(9686003)(82960400001)(26005)(186003)(71200400001)(86362001)(83380400001)(55016003)(38070700005)(53546011)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?b1VSSUJNYTJ5azBQakQ5Mjd0ZHNBSE9yNVVZdE8yNkE4bzdkaUJwNlEwUTRJ?=
 =?gb2312?B?YkVDSzB6eUoxbVBjWUtPNm1KV1VFeGZFd0xTdGlySDFPaEpUU3JtcHk4RFpK?=
 =?gb2312?B?YmRVc2RLOGZ1N2dpZnNPRG5RcXZqdVlUTkI1VEFpSk8rMFN2Sm5rVnlUcjcx?=
 =?gb2312?B?bWw4UGNJWDlzb1JXSGRTeGZyZHpvNHhPNW9TM1NMb0l4cUZrZ2lUdlBNcUU4?=
 =?gb2312?B?WTBYYkNQdmUyZ3gwb0gwVG5WZWRoYmt3aVJwZXAwMEVZOUhyWkwxK0xsczNj?=
 =?gb2312?B?bEJiTHZlVWFJNXZNd3ZWS0lSb1UrcThSMkZneGhNOW5rWXF2S0JRZUgrRXNJ?=
 =?gb2312?B?MnYvSG1lM0ZQMWN3b3NjLzVYUkFVajdHS3NMaXMwUzlETk4wd2RWcThCN01x?=
 =?gb2312?B?TlBIUTk5Q0pIMDMwSEc1YnFLcTE1UzRkejBYamM2Qzk4Zk56MUg0M2JTUkFH?=
 =?gb2312?B?R2ZRL0JnVStEeVhwRXROM0VJY0VKUEtzcVkxODVUR3NiM1l2UnRoSGI2OWpI?=
 =?gb2312?B?dk9tYkdmMFRRTlkvb0xmajFkVGFobmc0Z28wemZsTkhndm9LUmFXb0xYdlRC?=
 =?gb2312?B?L0JRSG5YTCtRMDU2WEJ6dVRZb3JyZVhWK0ExcU1lVHN4WllML1ZzQ1JWOFQ4?=
 =?gb2312?B?YmZkdXdTT2dYRDM4TzM3alhlSkNMSnJwYjJHTjJrS0E1TWtqMFhzR1VhcU1k?=
 =?gb2312?B?bUFuYTUxUVIxWHJHODB1c08zZVBFYWNjQjUxUFZBTFhmZDZYRUV4MVl2OElT?=
 =?gb2312?B?bHFFVGNmNjFBb3lxb291bXRjSFcrN2p2VmR3dlhNQ00yQ0I0UTIzbzFIYWdR?=
 =?gb2312?B?cXJwMUlLVHdna2FEMGRuaVVZbWs1NktJd28zYU5Tb0Y4KzRiTTd1V0U0bUk2?=
 =?gb2312?B?UE5OTHpwMXhHSFJabmZHWDZ0R3NzbHJOQUE3ckRyUk4wZlFkT3ZnVHk2WGNa?=
 =?gb2312?B?Q2szQWtPSk1XK2xzOTI3dWlEaVpkNS8zM0ZDRnFxdDNaeEFxeUowZFpFK0dn?=
 =?gb2312?B?OEJIOGFaTkF4TCtKQUVuQWE1YlNzanBCQmtOYVpIbmtyTnRzRUc1eG84SVVY?=
 =?gb2312?B?bDhtNkdzdElnSjkvKyt6ZkJhc2RzWlJGNXNpQXN5VHNFeS9ZeWZBUWxuQTVv?=
 =?gb2312?B?VXFEUVRPZ2ZIK1RWVlh0bStLZjY5bjczT2diVmtoZ3NvaFR1Z0JrV2NTQzBU?=
 =?gb2312?B?dDhGbnBVbFYxcWJIQ3FteVN1ZGtnWVlLMlVvTmwxamNORHFaVkxNdjVRckg1?=
 =?gb2312?B?eEVjNDcwSTgxcndKUFNwQ2Qyc2E1citubHBHWWEwUElDQlhSY2JjK0JFM3ZG?=
 =?gb2312?B?bkJUSWFqd3lMc2FxU1VKMTBNMFlXc0NnNnRuN1JmY2F1d3BZVnQwZUJaVjFL?=
 =?gb2312?B?YWNuNHY3RDdYSmxsQTEvZzBZT2JZN0ZHN3FJVG9EWXl4ckdvaERKUHlMWlRs?=
 =?gb2312?B?Wk5uNEY1NGRYQkZqanZJTHRDTStjWkVjSmNRSG5tTXJlMUJtVjJHVkh2TERl?=
 =?gb2312?B?SFg0N1RUditFYVRIMkJ5Y1NVZzFLeU95azg3NU40V1ptTi9veEZIekVZUnBz?=
 =?gb2312?B?MG9xVUp5NVJBVzd1bm1kWWtzN2x2cGdjUGpSSVhLbjkvdkYrbjlEN1dzclc4?=
 =?gb2312?B?ZTF0WTVpNzN0b3dpTGVEUVpaS0w3L2lTZ0RiOGQ3aGxoVXlpdnM3cmx6dUJF?=
 =?gb2312?B?REpCSEdiUG9HTCtJYzBwcE1HNURmUEtWdlhyK0QwY3l6OG5xRFBiWkRYQmNh?=
 =?gb2312?B?MS9NVDJTTTdUTG1WbkNEc2JPRTVyUjJYSEV4RjNlTFc1aVF1MkhFdjJCejNH?=
 =?gb2312?B?ZkMvc01zU0E0b2hoNEUzSm9KOWdoeU1OMFI4bzdVdm5rcXFkMmcwOERscmM0?=
 =?gb2312?B?MDk4U0ZTSG90NW9UaStNQXd1NXFHcWt0TFI4bEU3TnhOaEpPOUZUZ1paZU9l?=
 =?gb2312?B?S2pSWFcvWGN6dmtYMlFLTHJaM1VPRW9QUU9nOGtZdjFPVEpDbDhMc3gyby8w?=
 =?gb2312?B?VGpFYTcxQmZULzFtTmZ1V1dlREpZRk92ZHZYS3pIeW9VYnQ5L2VhWGpjbHJm?=
 =?gb2312?B?ZWdHb0RTNE5zWUlNNFk1ZldGUUxxUkVCK1J0Q0thRUdWWlMyNUtIMk9GZ1RE?=
 =?gb2312?B?Z1c5QkkxWmdaeUVHaENUVllVK0VKZzBtbEpZZ1NyTzBWTnY1M0FvYzExdmRR?=
 =?gb2312?B?ZlQrM1BWNjVIdU5FK2g3VUk0UThid005MjY1aDgxTWlLNGQ2YWxEd1JiTW8w?=
 =?gb2312?B?UTFySlBZamIydXp4ODAxZTlPOGlWMEovWGNYdUFxMGdVWFdXelNDSllVTUR5?=
 =?gb2312?B?YkZ0em5RenB6d2Qzdko0RmlwbXUyY1c5RFdlb29kZW9rYjBOZGVLdlRLZk9k?=
 =?gb2312?Q?MctJePyNn08vcm2E=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR03MB540542A4BCB2496BD1F49A769DD79SJ0PR03MB5405namp_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5405.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf97768-ec01-439c-24fd-08da3d557662
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 07:17:29.3848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oo4SdqGa2GE1Yg24oMpeAgUZruXQHpkaxC9g0QkBsYtv1jt7koTongXMwdkAAaKAU4zi9SIUcLcb4Nzlh35gfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2312

--_000_SJ0PR03MB540542A4BCB2496BD1F49A769DD79SJ0PR03MB5405namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

Pj4+PiBPbiAyMy4wNS4yMDIyIDExOjUyLCBMaW4gTGl1IHdyb3RlOg0KPj4+Pj4+IC0tLSBhL3Rv
b2xzL2xpYnMvZ3Vlc3QveGdfZG9tX2RlY29tcHJlc3NfdW5zYWZlX3h6LmMNCj4+Pj4+PiArKysg
Yi90b29scy9saWJzL2d1ZXN0L3hnX2RvbV9kZWNvbXByZXNzX3Vuc2FmZV94ei5jDQo+Pj4+Pj4g
QEAgLTM0LDYgKzM0LDExIEBAIHN0YXRpYyBpbmxpbmUgdTMyIGxlMzJfdG9fY3B1cChjb25zdCB1
MzIgKnApDQo+Pj4+Pj4gICAgICAgIHJldHVybiBjcHVfdG9fbGUzMigqcCk7DQo+Pj4+Pj4gIH0N
Cj4+Pj4+Pg0KPj4+Pj4+ICtzdGF0aWMgaW5saW5lIHUzMiBsZTMyX3RvX2NwdSh1MzIgdmFsKQ0K
Pj4+Pj4+ICt7DQo+Pj4+Pj4gKyAgIHJldHVybiBsZTMyX3RvX2NwdXAoKGNvbnN0IHUzMiAqKSZ2
YWwpOw0KPj4+Pj4+ICt9DQo+Pj4+Pg0KPj4+Pj4gV2h5IHRoZSBjYXN0PyBBbmQgd2h5IG5vdCB1
aW50MzJfdD8NCj4+Pj4+DQo+Pj4+PiBKYW4NCj4+Pj4NCj4+Pj4gbGUzMl90b19jcHVwIGhhcyBm
b2xsb3dpbmcgcHJvdG90eWUgYW5kIGRlZmluaXRpb24NCj4+Pj4NCj4+Pj4gc3RhdGljIGlubGlu
ZSB1MzIgbGUzMl90b19jcHVwKGNvbnN0IHUzMiAqcCkNCj4+Pj4gew0KPj4+PiAgICAgICAgIHJl
dHVybiBjcHVfdG9fbGUzMigqcCk7DQo+Pj4+IH0NCj4+Pj4NCj4+Pj4geGdfZG9tX2RlY29tcHJl
c3NfdW5zYWZlX3h6LmMgcmVkZWZpbmUgYW5kIHVzZSB1MzIsIHVzZSB1MzIgdG8ga2VlcCBjb25z
aXN0ZW50DQo+Pj4+IHR5cGVkZWYgdWludDMyX3QgdTMyOw0KPj4+DQo+Pj4gVGhpcyBhbnN3ZXJz
IG5laXRoZXIgcGFydCBvZiBteSBxdWVzdGlvbi4gRm9yIHUzMiB2cyB1aW50MzJfdCwgcGxlYXNl
DQo+Pj4gYWxzbyBzZWUgLi9DT0RJTkdfU1RZTEUuDQo+Pg0KPj4gVHlwZSBjYXN0IGlzIHVubmVj
ZXNzYXJ5LCB3aWxsIGJlIHJlbW92ZWQgaW4gbmV4dCB2ZXJzaW9uIG9mIHBhdGNoDQo+PiBDT0RJ
TkdfU1RZTEUgZW5jb3VyYWdlIHVpbnQzMl90IGluc3RlYWQgb2YgdTMyLA0KPj4gSG93ZXZlciwg
Q3VycmVudCB4Z19kb21fZGVjb21wcmVzc191bnNhZmVfeHouYyBhbHJlYWR5IHVzZSB1MzIgaW5z
dGVhZCBvZiB1bml0MzJfdCwgc28gSQ0KPj4gdXNlIHUzMiB0byBrZWVwIGNlbnNpc3RlbnQsIG90
aGVyd2lzZSwgdGhlIGNvZGUgbG9vayBzdHJhbmdlDQo+DQo+U3RyYW5nZSBvciBub3QsIHRoYXQn
cyB0aGUgb25seSB3YXkgdG8gcGhhc2Ugb3V0IGNlcnRhaW4gdGhpbmdzIHdpdGhvdXQNCj51c2lu
ZyBnaWdhbnRpYyBwYXRjaGVzIC8gc2VyaWVzIHRvdWNoaW5nIHRoZSBlbnRpcmUgdHJlZSBhdCBv
bmUgdGltZS4NCj5OZXcgY29kZSBzaG91bGQgbm90IHVzZSB0aGVzZSBkZXByZWNhdGVkIChmb3Ig
b3VyIHB1cnBvc2VzKSB0eXBlcw0KPmFueW1vcmUuIE5vdGUgaG93IHRoZSBmaWxlIHlvdSBhZGp1
c3QgaGVyZSBhbHJlYWR5IGhhcyB0byBpbnRyb2R1Y2UNCj50aGVzZSB0eXBlIGFsaWFzZXMgZm9y
IHRoaW5ncyB0byBidWlsZC4gVGhlc2UgdHlwZWRlZnMgcmVhbGx5IHdhbnQgdG8NCj5nbyBhd2F5
LCBhbmQgYW55IG5ldyB1c2Ugb2YgdGhvc2UgdHlwZXMgaXMgYW5vdGhlciBoaW5kcmFuY2UgaW4g
ZG9pbmcNCg0Kd2VsbCwgeW91IGNvbnZpbmNlZCBtZSB0byB1c2UgdWludDMyX3QgaW5zdGVhZCBv
ZiB1MzIuDQpIb3dldmVyLCBUaGlzIHBhdGNoIHdpbGwgbm90IHVwZGF0ZSBvdGhlciB1MzIocykg
dG8gZ2V0IGZvY3VzLg0KSSBjYW4gcmFpc2UgYW5vdGhlciBwYXRjaCB0byB1cGRhdGUgcGFydHMg
aWYgbmVjZXNzYXJ5Lg0KDQpDaGVlcnMsDQpMaW4NCg==

--_000_SJ0PR03MB540542A4BCB2496BD1F49A769DD79SJ0PR03MB5405namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt;margin-top:0cm;mso-mar=
gin-bottom-alt:0cm;mso-margin-top-alt:0cm;mso-add-space:auto">
<span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; On 23.05.2022 11:52, Lin =
Liu wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
;&gt; --- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
;&gt; +++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
;&gt; @@ -34,6 +34,11 @@ static inline u32 le32_to_cpup(const u32 *p)<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cpu_to_le32(*p);<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
;&gt;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
;&gt;<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
;&gt; +static inline u32 le32_to_cpu(u32 val)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
;&gt; +{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
;&gt; +&nbsp;&nbsp; return le32_to_cpup((const u32 *)&amp;val);<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
;&gt; +}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
;<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
; Why the cast? And why not uint32_t?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
;<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&gt=
; Jan<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;<o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; le=
32_to_cpup has following prototye and definition<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;<o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; st=
atic inline u32 le32_to_cpup(const u32 *p)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; {<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cpu_to_le32(*p);<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; }<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt;<o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; xg=
_dom_decompress_unsafe_xz.c redefine and use u32, use u32 to keep consisten=
t<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;&gt; ty=
pedef uint32_t u32;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt;<o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt; This a=
nswers neither part of my question. For u32 vs uint32_t, please<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt;&gt; also s=
ee ./CODING_STYLE.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; Type cast =
is unnecessary, will be removed in next version of patch<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; CODING_STY=
LE encourage uint32_t instead of u32,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; However, C=
urrent xg_dom_decompress_unsafe_xz.c already use u32 instead of unit32_t, s=
o I<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; use u32 to=
 keep censistent, otherwise, the code look strange<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;<o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;Strange or not,=
 that's the only way to phase out certain things without<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;using gigantic =
patches / series touching the entire tree at one time.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;New code should=
 not use these deprecated (for our purposes) types<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;anymore. Note h=
ow the file you adjust here already has to introduce<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;these type alia=
ses for things to build. These typedefs really want to<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;go away, and an=
y new use of those types is another hindrance in doing<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">well, you convinced=
 me to use uint32_t instead of u32.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">However, This patch=
 will not update other u32(s) to get focus.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I can raise another=
 patch to update parts if necessary.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Cheers,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Lin<o:p></o:p></spa=
n></p>
</div>
</div>
</body>
</html>

--_000_SJ0PR03MB540542A4BCB2496BD1F49A769DD79SJ0PR03MB5405namp_--

