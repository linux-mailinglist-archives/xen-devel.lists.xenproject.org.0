Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB6851FA1D
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 12:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324382.546394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no0np-0005sx-7A; Mon, 09 May 2022 10:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324382.546394; Mon, 09 May 2022 10:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no0np-0005qN-2t; Mon, 09 May 2022 10:39:45 +0000
Received: by outflank-mailman (input) for mailman id 324382;
 Mon, 09 May 2022 10:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P+Fb=VR=citrix.com=prvs=1211c9f53=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1no0nn-0005qB-La
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 10:39:43 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53877c2b-cf84-11ec-a406-831a346695d4;
 Mon, 09 May 2022 12:39:41 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 06:39:36 -0400
Received: from PH0PR03MB6382.namprd03.prod.outlook.com (2603:10b6:510:ab::9)
 by CO6PR03MB6306.namprd03.prod.outlook.com (2603:10b6:5:35f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Mon, 9 May
 2022 10:39:32 +0000
Received: from PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::b02b:3af6:daa0:30ce]) by PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::b02b:3af6:daa0:30ce%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 10:39:32 +0000
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
X-Inumbo-ID: 53877c2b-cf84-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652092781;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gbCaxO3gVVhh3FWHiIWPid9PzO/ldwJDnuiz7Bwe5/I=;
  b=fdNOZwpAbyOI2nalQtpSUa65uVklHgmtbbw9ua/LI75h4ERhzhON+i6w
   LEDE9B1B2MieumDlXdi7AJ9klDrUY8GLaiiC6ALyHNfXqPCRHm9MqXVwD
   BIlRMVkoeKg2QXv8yYXn9ocPsVPy355qOR2fhi0wHnd0iAM01dXiCsfu6
   Y=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 70744986
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3knHEK4JdIDcnFqO3SxawwxRtCnGchMFZxGqfqrLsTDasY5as4F+v
 jEWCmmBM6qCamr2f911O420phwP7cCBnIU2Tgc9rH80Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXhUlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSqES0qJI+cvN08WkZWOQRTDLJl5OX+dC3XXcy7lyUqclPK6tA3VgQcG91d/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YGjV/chegXdRraT
 9AeciEpaB3PbgdQM1MTIJk/gP2plj/0dDgwRFe9+vJovzSCnFIZPL7FFOuSYfmDfNhvl1+h/
 G//2Tj6PA8EHYnKodaC2jf27gPVpgvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 1cP5iMkoKw29UqqZtrwRRu1pDiDpBF0c8JZDukS+AyLjK3O7G6xH2UBU3tNZcIrsOcwQjol0
 ELPmMnmbQGDq5WQQHOZs72S/TW7PHFPKXdYPHFVCwwY/9PkvYc/yArVScpuG7K0iduzHizsx
 zeNr241gLB7YdM36phXNGvv21qEzqUlhCZsjukLdgpJNj9EWbM=
IronPort-HdrOrdr: A9a23:bB/7/qA5ozu/C/3lHegOsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEDyewKnyXcT2/hcAV7CZniqhILMFu1fBOTZslrd8kHFl9K1kJ
 0QC5SWa+eAQmSS7/yKhjVQeuxIqLbozEnrv5am854Hd3AJV0gU1XYcNu/tKDwSeOApP/oEPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+zA+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRiuerRfb8yfT9GA+czzpAV74RH4FqewpF591H3Wxa0u
 UkZS1QefibpUmhJ11d6iGdpjUImAxel0MKj2Xoz0cL6PaJOg7TB6d69P1kWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5wKJSFcZ4JguZkZkIMIjgX5q3P4i1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwI/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFnxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiIuiYfzQTObNSSj5uw6zvmWehTNYd3E8LAs27Fp/rvhWbHsLSqPDFgzjsrImYRrPvHm
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; 
   d="scan'208";a="70744986"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBTgzUi4QlX+Gxk3RyC1OMWndfsKkkWb/W0H7EERxfBDxDBjZww7emJubWCT+rC7ei5ZgnKFJ6knI9XYWuwXtRGY3Qwtw1oC+xaG/R6sXyOvI47uDa97AA2YnBjw5mpAJ6iN/G92VCgyq3Rf0S2dPkve4ufdcRTFmItwBcCCthWcF9WbSgXSqpQX9aaSAMepsmPuSUijinb1JU2ooYKNTKHHyIdtKNOkQy//cmwVrAt23I4eUEWOKCofB3i11qttQpHZHr5Dq9JMr05/T+GJY+iR19aq2Z4oBYLP7TWIkBAr8O/pUmqLxnaTd1FrIr02Y2rzBt3YX+4yH8pp7Wl2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jD1O5zLnOSIsMU/9++7kis5g3HRa9EjhEyeVhDByHY=;
 b=Z5Dz+DgcEMvfCmEtSRHG8jKq3E3+yugDdeIZ3NCxjk6x0Re4Mosn/HEic9vTh09ZdLN6rMc+57wOyzgPqj87bzgU8e4DC+ZT8UpNLk8FB5eyidnYOmwH0+SVp6+xlsNZ2uEsqQY+JwZcLRm6JAkz2H9bkPygxECbePBJi0Wkaf9yuWFo8+LRgURqK2AX9t/srOrPDATkXrzNYUIY9Mu4sC9UCD0WZ+QKfsyRYH2vib0s+Z61QxGJvV2xKRSJxfRiBVyGx+sliyL1Hsy5ek3w3L5f3kAwGnvOOMhq0cg8NLMED8YAYczwwaNiVFk/m51wQrEcy96bjDcXbLHq64mf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jD1O5zLnOSIsMU/9++7kis5g3HRa9EjhEyeVhDByHY=;
 b=WqWK/T+jec5bmBKHH8RE+bc9eTJBJWNDhrUw6HYXZB/sXwzUbRYreX2Tk06sqvVYuhuqlNBEMY1FQRwtcNO5OxrSjIZUttwbgmRWTTMaCctNiiWsu3AcuPMkx+8idjfY1kOUngxkgwqgOp3mWNP3ylAHOyNcNkjT3jaCpjCpvNQ=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] xen/pt: Avoid initializing BARs from the host ones
Thread-Topic: [PATCH] xen/pt: Avoid initializing BARs from the host ones
Thread-Index: AQHYWlVI6k4vzeGas0CbAgtnJ0rrZq0WWb2AgAAQ5LU=
Date: Mon, 9 May 2022 10:39:32 +0000
Message-ID:
 <PH0PR03MB63820BC5F37E040F37554E32F0C69@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220427163812.2461718-1-ross.lagerwall@citrix.com>
 <Ynje14BbzorbkvkD@Air-de-Roger>
In-Reply-To: <Ynje14BbzorbkvkD@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d51da80b-d31b-454c-7916-08da31a833e6
x-ms-traffictypediagnostic: CO6PR03MB6306:EE_
x-microsoft-antispam-prvs:
 <CO6PR03MB6306596AD745B434B105CFF1F0C69@CO6PR03MB6306.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hL5+FPtclczwjgCXfi0miMmVNPz/+6z64zoZUGm+Kc2CXfJZUwUrzC70UucnkqZAZnNfz+YfRAnIPBU12QQpuY0/nfFY/Tx3uzPcD3lacJB6Gjf+8kIUmY7NolAgbaaGN6OyB1Dr9UBkpigfO/GFFw71g7yCxSPiqLetgn08yLdFsg1Eq3O8hrR+iSaQKORQRQ7oq2+0D1UrBHHxvpdK5+l79mfHT8MF4bYdhQK0DgtaBAGWKv7QPiRHLfi+U4up44P3sCQ9iCBdlZ65/JYzkT1yWEbTWZhXJsHeHWuJ2RiTSI88TAANDxZslmahvfLRseJTpEwd6sjvBIVTLNh3jeu9hZ06xc24gSBUhlZJkzU2M1yq5+oPcZC4AdjOo3n65zQa+zNbcKCFtk0tal6itzAzZ1u/hCG83bY8A0IifSFPNTWgn1AdJ7CG8sLNAjtSQMvkXVsXBEgGNwh3Hmw6UtgMwAol3O7al4S5xtRPXHfZ5EUbMeHOZUx6bhiXsmPwm7DXOhWY4+jAliqueG74fydUHly34vk4IH7EANzhF8F0Zr6ZRv0s/6bQ0kOqCqiuEosZ/PPwm9rWg8WUUxqDZ7MVTI5e6M1Tojjn/anT5auj7SY2noswKnJZvvoa4AK/HR659avgx+z0+oMSGnVBAJP+XALeWzK8pzZLKqPS7teVXyW05dZQn4zJ4Ti/uCl67YE6/fQk2BZtjX/WenaSmg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(38070700005)(55016003)(44832011)(38100700002)(33656002)(9686003)(2906002)(5660300002)(6636002)(54906003)(26005)(86362001)(6862004)(4326008)(64756008)(52536014)(53546011)(91956017)(66946007)(8676002)(66556008)(66476007)(8936002)(66446008)(83380400001)(7696005)(76116006)(508600001)(6506007)(186003)(122000001)(71200400001)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4Iy4JVNGL6OBebHFJd395futqT5dyjgsrFYtJ8f8bosNoi2WkayUX8cGhg?=
 =?iso-8859-1?Q?BMrWC1kh0pZ35Py809WMXvUwi2iliiokazvyfWTbY14yBYxHzc8k7GxLD/?=
 =?iso-8859-1?Q?j+RuKCv3A1cebWTfnW7i8yLe85GxT5JXmDEQI020sP/LbMgDskvxYx2Xnq?=
 =?iso-8859-1?Q?ujpXWcFg2OYBCRCO4SdXJy5B9jWiskKmwnJB3P7HB4wi6Cimt5HYsd1qyp?=
 =?iso-8859-1?Q?zCFWILFZgLwNsVM74WvB3b5N5KVHXkc9aTqJybdEgAMyYDlFv40NHdfpFU?=
 =?iso-8859-1?Q?F2rHT+ci2Sc4RF6YOtnYz0dep1GCqpJgUm6zxN29iYZO2RezT9oCTF8DTK?=
 =?iso-8859-1?Q?z2ewpVYWLf5EDmuxPCJG9L1Y8aZCx0KX6W6NBkgPt5nkNKrUXBM2efRD8e?=
 =?iso-8859-1?Q?3MGRQA5F3OgBEQ5jEvKziUUFTjIU81m6bbRqbwHnmmeKcOLfNIp49vmXzj?=
 =?iso-8859-1?Q?5bFv8qZupNEXLvk0PiS0FVa5SEvsWo7C/cslEGWbYOriZun49ywIV5LlZi?=
 =?iso-8859-1?Q?HnXyp1TbrPw+p5K3/8OJQEFIzUuvQNeDJ+q/PRTCJdSGhxq+Txx9GhbIEp?=
 =?iso-8859-1?Q?D2cDx9fvvcbdW7+QZTTXyX+ByHXQuu6Il6e5bri8Aj9WKXBsgekjisewN7?=
 =?iso-8859-1?Q?SatWlV27lDP6Yq/15qDKpNxrUy+n/x9PMBkh9n034Rom6UI2A/Eo/vugDZ?=
 =?iso-8859-1?Q?mfT+lb4v+8vYfJb/msmcpkjHjZSYux6ARb7Ka68Smz+MvIfrO2k5eMH4af?=
 =?iso-8859-1?Q?tCsKHy628cDxfIot1Sje0WY2D97EqJHRDiXcpjHw4AozmjrIHYNyjfx5Dh?=
 =?iso-8859-1?Q?EUNdMZrEaIhhPDa+a6s26VgS4rMYWX8kdWOoEGAr/hRI1Bkp7KoScKqEGc?=
 =?iso-8859-1?Q?jE3tVUO7F0h6GIDfPq/4a96xRXYcY4I+OJFQweYdzG6Ev0gaXSXThqJozR?=
 =?iso-8859-1?Q?kuAu7Y/QnDGoVxmoQ3p5/BpmhZWlfhZpkQ7cJpqMxXJZr9GzGwBbclo6ca?=
 =?iso-8859-1?Q?Rdw3lwLgRe/Ft031pGtpcgkzdrt2xt8bEFSWA2k59Ti+BuEa6e91T8Xu91?=
 =?iso-8859-1?Q?Ju2LKfjzJOFJn+IVE3gfrMAW+N4dF+mcrVW9yXFMDX4wbGqSxN+3G/30o3?=
 =?iso-8859-1?Q?ivc6js2DMAOXPfbyi7S5kgNDVjgK5a6NeSdy33BJ2AclzpYEf4E8REcMEO?=
 =?iso-8859-1?Q?dAg7DMyoUU/IWhz066XLaOgcy2wcy5pA6D+v+xFEMx7o8j9NxC0fJXylXj?=
 =?iso-8859-1?Q?n9J/KrsKWMD27w56siLRyVwbyCO5enDJRkAbMaUdc6DD1RyJ+GK4eGN3xa?=
 =?iso-8859-1?Q?Fu9qsa8V6JpitY0q9waXYtjITTD/+iqVrmuMtBmfc3urdwCKuvHaPngajV?=
 =?iso-8859-1?Q?JE8/A0ZD/hg2nWBDlk2BbBq4q6pP31BD9WRhZg6NI0g8nbI/GdYY2+Mjr6?=
 =?iso-8859-1?Q?zyZEn5VDKt9WCdeYL0fSZQrZLoSalkWV/OIemhcf1wxSR3ojkixYT7HZC/?=
 =?iso-8859-1?Q?sMsC7W1csiOb3z397y1ay9LyHV1/B0o86NeBLIxx1wurX6Udn43HuF6VZz?=
 =?iso-8859-1?Q?p5295OeRvgnZi2Wxgfz1V9M364ejuPQIstmoptlEjIdeG+bJuuu/M2M3ce?=
 =?iso-8859-1?Q?gWjm6LpboYTjimvisk89Q0DhwcSYvX+cfhExT3sTSzQGP1IbY5XwrBHENd?=
 =?iso-8859-1?Q?lhV5Ttkp/zWHx/OSftdDuCw7YBUsB00V5SMlmkdiZCWkS/tywFIBO6E1Vq?=
 =?iso-8859-1?Q?Ubuct/4YJtKFwBIkyEPjLKVqH+T9L4IGC9+Wq6+EpYCoHGMe4+UOiP0Hlc?=
 =?iso-8859-1?Q?u4SPQnywt7pCifAQPxnX7HuSQc8+ReA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51da80b-d31b-454c-7916-08da31a833e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 10:39:32.0729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pnf6QlHhbUcQ22TzJdCyWQ7amvIRAq0ls9rO67SJiPo+TTRqCk897xDDTqDsIHxQbHGRof02LL+zKSM+eV7tQZfOV4A7RaQUjlgBA6IRQ3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6306

> From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Sent: Monday, May 9, 2022 10:28 AM=0A=
> To: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; Stef=
ano Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.perard@cit=
rix.com>; Paul Durrant <paul@xen.org>; qemu-devel@nongnu.org <qemu-devel@no=
ngnu.org>=0A=
> Subject: Re: [PATCH] xen/pt: Avoid initializing BARs from the host ones =
=0A=
>  =0A=
> On Wed, Apr 27, 2022 at 05:38:12PM +0100, Ross Lagerwall via wrote:=0A=
> > The BAR emulated register definition does not set emu_mask because it=
=0A=
> > varies depending on bar_flag.  If emu_mask is not set, then the BAR is=
=0A=
> > initialized based on the host value which causes the BAR to be initiall=
y=0A=
> > mapped at whatever value the host device was using. Although it does=0A=
> > eventually get mapped at the correct location, it causes unnecessary=0A=
> > mapping/unmappings.=0A=
> =0A=
> Would it be possible to just unset the memory decoding bit in the=0A=
> command register if it's set?=0A=
=0A=
I don't think that would be sufficient since AFAICT qemu does not read that=
=0A=
bit so will still call into Xen to update memory mappings, etc.=0A=
=0A=
> =0A=
> > To fix this, initialize a per-register emu_mask in XenPTReg from the=0A=
> > initial value in XenPTRegInfo and then let the register's init() functi=
on=0A=
> > set/modify the emu_mask if necessary. Update the code to use emu_mask=
=0A=
> > in XenPTReg consistently and rename the existing emu_mask in=0A=
> > XenPTRegInfo to emu_mask_init to help with refactoring.=0A=
> =0A=
> Iff we really need this refactoring it would better be done in a=0A=
> separate (pre)patch, so it's clear what's the fix and what are=0A=
> refactoring changes.=0A=
> =0A=
> I also wonder whether why it isn't enough to set emu_mask in=0A=
> xen_pt_bar_reg_init(), without having to introduce a new field.=0A=
> =0A=
=0A=
That doesn't work since emu_mask is part of xen_pt_emu_reg_header0 which=0A=
is static and is not defined per passthrough device so having multiple=0A=
passthrough devices would cause issues.=0A=
=0A=
I have an idea to achieve the same result with less code churn so I'll=0A=
try it and send an updated patch.=0A=
=0A=
Ross=

