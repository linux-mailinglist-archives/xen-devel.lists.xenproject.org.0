Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7648621AA8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 18:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440384.694568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osSRK-0003cx-M6; Tue, 08 Nov 2022 17:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440384.694568; Tue, 08 Nov 2022 17:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osSRK-0003au-JC; Tue, 08 Nov 2022 17:31:10 +0000
Received: by outflank-mailman (input) for mailman id 440384;
 Tue, 08 Nov 2022 17:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osSRJ-0003ao-Ib
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 17:31:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c0cfcc0-5f8b-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 18:31:00 +0100 (CET)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 12:30:58 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by BN9PR03MB6041.namprd03.prod.outlook.com (2603:10b6:408:136::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 17:30:52 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%4]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 17:30:52 +0000
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
X-Inumbo-ID: 1c0cfcc0-5f8b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667928661;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4Z4ewcNnrsVNE0uBBmtvInNERM/uCrR5M6+4HiHK/Ig=;
  b=Ub/nb6O7YO6IgJL3W5ufANtpYNaVWQmchgzBJdb8xtzVb3S7bzryzMwT
   vcUgzSAa8nmMHjpaSI/uP3O3RRYiSgUik8XZKV8QdXL9bLU8iCKR6A4QR
   Z0H1CRC6J3X4m+Dinb2tvDqSI4mtN9oNZK6ZgyX5Jgcjnc4NRrIMmQwHk
   s=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 84840093
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Bxmvxao8yGqhvALwbLGucWL4tYVeBmIqZBIvgKrLsJaIsI4StFCzt
 garIBnUOKrbZjOgfNEiYd+0p0kB65ODyIUyHgFv+yw2EHkW95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzylNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABALRRGdpPu6/LemZrlyvfQ5LeLWNpxK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIe9lt+iHK25mm6Vq
 nzH+SLlBQsdN/SUyCaf82LqjejK9c/+cNJOROHgrq8x6LGV7ksaGhgZcxyEmKm8sW6kQ+hzD
 W4M4TV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yyaUAHIVCAFIbtMOvdUzAzct0
 zehgNfBFTFp9rqPRhq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseJNZlfXwEDD0h
 jWV9i43guxJidZRj/nmu1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nW/MBRaI3hxI2U2ss=
IronPort-HdrOrdr: A9a23:C2VOj6m7pw3tJu6LZhHSvrZNN3TpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuRt3Us4vkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duf22vaIJy4EUbICbQRGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84840093"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g06cO74C9k9XEkrKkepfHlG0m8nq/pZ0p64hb4qooSiHF9j+XfyjTuAPOz3kaJhS+6mY/vrOdfEr0Hw/Lb3N0WYos3KSbmNTobqJmeojJ61xErTnLUFCrV6/hKGOXONU77fhIIpWjhbd23fcmQJPNQKtYiFJbAJQOZ9qHUC8PPo29SzX7y/fXtu9MQH0tgcdnmLAydI6phvr4UPanM14COkqeOG7h+I0TpF+VzVVONyr9XOp/kYkUmNh0ZrdwEnlpUjbD9qsKd44yI0vM/XcPO/9yJ934jiC9HGvGQWTGbRcupKkWyujkcrEm8EVeqnHPM+e8ToSdRNyrfRBkWZz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxAQ4QUhzyfeN2nctawIFuF2BRi3JbLtPJDQWxUPQzA=;
 b=ZcI3WL0aotarJ1/07M0FEiFdrv2XR2P5AWnOMnbqnobUUgkm3Q3GU6NFBsrEgmdJwg5J9CNuSQ4AQ0ou/BY6jwIQH0HhNktvUs1PusaMybf7YJ/iONOrQQwBa+JcDLMvWiPdRahmwZsCUVmQIwE8PAtPUeb9VtZzJa6UVZu1qmW+Z375SIhxicD3yGnOzfEpJ02sjAUMjGlaq1kvIiKOAKz6aSix6xP8ALCKAWytXB1bPMRXnsyJnc+1rf0WvDnOaL6yZWyzYg49bejttoHQZb8Eqnw04fBM8YsYbOEiY8x8EanXCDOoOfrU2iRlQCpP+Keiz6/A+C9F6HhQAAC/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxAQ4QUhzyfeN2nctawIFuF2BRi3JbLtPJDQWxUPQzA=;
 b=dVhSxFoYebgU9X0SKTHIGps9Sd6vgx6DFy77TMLlTasge9mtPeVkYsZnMp662JSX5zvDc+3c0XLTOZVfhL7KqNN4qJrAZzKlKT6SAfhKAsLzlzJ8XDSFAWUGC+cMLxJ6xULNIa+qyaCzHbvnxW1ubcgttFckk1CuaGUkE45Q+Bs=
From: Edwin Torok <edvin.torok@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "Henry.Wang@arm.com"
	<Henry.Wang@arm.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Thread-Topic: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Thread-Index: AQHY82a4odYEEDJCoUOUarTvbCvSoq41M5sAgAAIFoCAAA0ngA==
Date: Tue, 8 Nov 2022 17:30:51 +0000
Message-ID: <6D1888A8-2A0B-45A5-BA3E-2F02B0950F3C@citrix.com>
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
 <Y2qHOfemg/wrc07N@Air-de-Roger>
In-Reply-To: <Y2qHOfemg/wrc07N@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|BN9PR03MB6041:EE_
x-ms-office365-filtering-correlation-id: a1c8d6ac-c6d8-4ac7-8817-08dac1aefbd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /fj0eHr3mXt6Wmkc+nGlXmJVdMpwMlCrDqtgPzRqee17EI6wk9RuRty5Ehrtr1N0b6+qK5DL3QCZPpncj7NuwLwmAXqsBu7VaaVZyr+P8zBGokFZqwPCsVEXwCs/v1Oi3IiK4EQgLDaZt9oMJZg+zugrRzDcI1W+o81KprnxhTGE/ojYVS550wWlg4jJKFva1wttB4qOwFMZYbG2h/tbiuY0r+mr1PbUyKkpoAL+MDs7CO6uuSfT9TpVeXri11COtxxYZmvVrOarT7OLqwrrFuCCmrOCr85AyeDGFkZHPUlRIZv6A/5RNORL641ngbnjCpfyQzOacZLwei68H+qShjDbixcrGDP/Htyyv9OzXHg1+FjD33NJ8mp0tRcA5ZwhDgL0e8qASOZWe8R5WSeKykUP85UZybFzY0XbwqPANvQBBJQpifa+uMQDQchqSq4O3omNIZQ+xrGJLPWEKFjrVTv2cOXP1EsMRsXgiyxzJO1/EuwRZCbXoYG4SVBFOGE1CiZuXStywnu2b9JlxlRcJeANdosJHexe6NTTZE4RYrfVivOQHkLUdZZx64TaieLYzI9aiU2pNJTta6dVLxQ2D5tyS0TMq41kmSJ1f3nprHXsEhuFYUciWE1Zypbh62ZSTmiH0QtgsRlvAgpVVIu5WjfDgjM8UTbCvYXq9QU3CU/z6vVhtuW2JJBvnKUcxm0oE1pG+2pD5O1KZkLIqlpCd1Zr8DaL8VXzxaG3CMG81pGxfGoRI30EwW0Z+l13pNUw7/I0oQm1kzT7Niq2SEYb7ZaHnPlxG8XMSOllf36YzgvWEJ0RNaSAzAfykK8M4WIDVlRy1iG+7srVlcmeVs0DzA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(36756003)(38100700002)(122000001)(86362001)(33656002)(966005)(6486002)(478600001)(82960400001)(38070700005)(83380400001)(2906002)(186003)(26005)(6512007)(6506007)(66946007)(71200400001)(6862004)(76116006)(66556008)(5660300002)(8676002)(66446008)(8936002)(64756008)(66476007)(53546011)(91956017)(2616005)(4326008)(37006003)(41300700001)(316002)(54906003)(6636002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Eqk2kazHRPbIFHmV4/7TChwJvt/05g1W6k8WMliMCeDJbg920TsxGe5MCOFF?=
 =?us-ascii?Q?AT/7872hTnb2s636qAQFLLSHwN/Kdk/3c5ugU7oM5cgT4sAQ1zvGf9kB/4Dv?=
 =?us-ascii?Q?OoZoVxNdV+01NNGTkofcGlJp9GPrStmnYylZ6OcJ/Ni6s40bo+OEZ4HjxO1A?=
 =?us-ascii?Q?HIoqcNmKYh99lDGObFJLlqqq9ck6ZLa1flvE9Fa5ZKnwGtfTY877Hj1UjBHb?=
 =?us-ascii?Q?DBcwqA9nRYVUwLIhrfMXZ1kOH76Rn58PWXQeiMVOKZuvB2/jUqZlbfGNc5gT?=
 =?us-ascii?Q?Sefd4kLj6mxpfjnP+n0l+KYR+LcF1FyFq6ZI39t1ifsflc8dxcLVvaV/nsOp?=
 =?us-ascii?Q?sRlidLBtq6L7guicDOnBzoJYt9Us4RRzOc5609WFZpf0tA0tLrCNYCb++k+1?=
 =?us-ascii?Q?hQwuUfFkpbKFFfYlqVy/RO4Wkr2Y1vdS+ot1zBykhaE8SxlpNsbW8+B5OlRj?=
 =?us-ascii?Q?XlmplahSdbs5F9ENqckg+NSC4+sCS0zrVpqx8APtM6NxFM/SRfHm6LOsFb3K?=
 =?us-ascii?Q?l2+BUeakQUkmKytf+qPUWma3WXqP9YMYQexRFWvuP23gY33pZCRzpz60IZhZ?=
 =?us-ascii?Q?yxlXYOaG+0VWZPj1mgsoX4PUV9aK8pBwzbyupaIEuIGLvmXgB3y/e59c6v+H?=
 =?us-ascii?Q?qSPW8TVFQYKT+1pwSHYKJpicyNd+l9Se3I15huHY99Jya3tfZMKw4kGg2Q6/?=
 =?us-ascii?Q?t78s7wD9ETuezXb4HwSYaFpVoAhn+xik2JLxBZacSSwcMuL636rLV1tdhd+1?=
 =?us-ascii?Q?1yC0lfcSB0OTlHOuh0BZv7JyH+5B9X2s546xQMCgaIeNHhnrOk7q0potHJDf?=
 =?us-ascii?Q?T9rNHUfbVhnpgeEGfrHvwU4yNQhc+tEWx8QA0FqcfpUsNo1LsXIVEKHuObLi?=
 =?us-ascii?Q?hxm4m9disrmOP4WQyTYknH+in+L46/i8ZVj4+pGoFB6jcMK9Joglc5Dq0xeL?=
 =?us-ascii?Q?yBxTsKuach44ykqEWDvVp30jR+WaSpNCHFerAGRuCUpTJaJA1ojeJ/jQUI4R?=
 =?us-ascii?Q?SMOs7PrF7YWTFyRntMdEGt19V/jfRtUDR7gJzoXZ//9B2SkDlRLUx91NKtqu?=
 =?us-ascii?Q?Kgx4LkVz1BC2uSEN8ed5WvrjBbl65QwhFPD6UjVDD6UXSYSic4bdLHUGif6d?=
 =?us-ascii?Q?0doIZbQVbM35ueBWfxgqiJErO0MMyPndSJyfZcL/CMz2GV8faEMlSHmhx8gJ?=
 =?us-ascii?Q?Y1ahU5Y6Bwc8T3AKvVzGlFAzDIKVw/bZvUwE3+imaD/USY7eESRHZn1u9bKD?=
 =?us-ascii?Q?eEKym+rScUZy3JcauXAJUgxWIX1mW5/TPZ+UAdeoTb1e8hcMAH3ico2xm4K3?=
 =?us-ascii?Q?kuIXH6R4Si4YT6Nv2hmU7K7lxr8XjrHUESXEcq/7OJY4gjmkK1M4wtwM9ctt?=
 =?us-ascii?Q?Pa0JxGoyUcH+mFGO6lblBO9gYm0aQN0U9gYjxBI14QecMcbNQEwQmbAYEfuq?=
 =?us-ascii?Q?UGQ1zwBn6vK0j6nQjIK49kEoLuQB0sprx7w1LRPVC4IDjQd3ZjZSSDTl5lrm?=
 =?us-ascii?Q?hxk5F53XSalXcjHibDQnCFBrurb5V0QuLe6r2Is297D5U/fBcNrvF8qdT6Gl?=
 =?us-ascii?Q?sXQlrVnPgq1nGJ0c3ilgtNY+dJHCiCcmrL7MGaWcC+Zwz2moOVXxlDCEXpAU?=
 =?us-ascii?Q?jA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <569583CEFAA95A489FE41DD80D5D11AB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c8d6ac-c6d8-4ac7-8817-08dac1aefbd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 17:30:51.9841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/amTq8/yMOS3eDmU1irax28BqC2FyfV+W3yEKV/QAU6ARJ2xqV1etuyrhgV2HyB+kzaDaot/eX665VRsihoGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6041



> On 8 Nov 2022, at 16:43, Roger Pau Monne <roger.pau@citrix.com> wrote:
>=20
> On Tue, Nov 08, 2022 at 05:14:40PM +0100, Jan Beulich wrote:
>> On 08.11.2022 12:38, Roger Pau Monne wrote:
>>> Like on the Arm side, return -EINVAL when attempting to do a p2m
>>> operation on dying domains.
>>>=20
>>> The current logic returns 0 and leaves the domctl parameter
>>> uninitialized for any parameter fetching operations (like the
>>> GET_ALLOCATION operation), which is not helpful from a toolstack point
>>> of view, because there's no indication that the data hasn't been
>>> fetched.
>>=20
>> While I can see how the present behavior is problematic when it comes
>> to consuming supposedly returned data, ...
>>=20
>>> --- a/xen/arch/x86/mm/paging.c
>>> +++ b/xen/arch/x86/mm/paging.c
>>> @@ -694,9 +694,10 @@ int paging_domctl(struct domain *d, struct xen_dom=
ctl_shadow_op *sc,
>>>=20
>>>     if ( unlikely(d->is_dying) )
>>>     {
>>> -        gdprintk(XENLOG_INFO, "Ignoring paging op on dying domain %u\n=
",
>>> +        gdprintk(XENLOG_INFO,
>>> +                 "Tried to do a paging domctl op on dying domain %u\n"=
,
>>>                  d->domain_id);
>>> -        return 0;
>>> +        return -EINVAL;
>>>     }
>>=20
>> ... going from "success" to "failure" here has a meaningful risk of
>> regressing callers. It is my understanding that it was deliberate to
>> mimic success in this case (without meaning to assign "good" or "bad"
>> to that decision).
>=20
> I would assume that was the original intention, yes, albeit the commit
> message doesn't go into details about why mimicking success is
> required, it's very well possible the code relying on this was xend.
>=20
>> Can you instead fill the data to be returned in
>> some simple enough way? I assume a mere memset() isn't going to be
>> good enough, though (albeit public/domctl.h doesn't explicitly name
>> any input-only fields, so it may not be necessary to preserve
>> anything). Maybe zeroing ->mb and ->stats would do?
>=20
> Hm, it still feels kind of wrong.

Without the fix in the bindings (and any fixup in other toolstacks as neede=
d, I haven't checked): https://lore.kernel.org/xen-devel/94f93ee61a4d0bd2fa=
c3f5a753cb935962be20bb.1667920496.git.edvin.torok@citrix.com/T/#u
a value of 0 here might still cause things to go subtly wrong, i.e. cause t=
he HVM shadow multiplier of a VM to decrease, although I think there are sa=
feguards against it going below 1.0.
However a ->mb value of all zeroes is much easier to debug (and detect!) th=
an a completely uninitialised value.

I'd prefer if the return value of domctls could be trusted to mean that 0 =
=3D all values are initialized on output, and to be potentially uninitialis=
ed only on failure.
There are a lot of other calls with similar pattern (particularly around vc=
pu, which will go down a different path) in the xenctrl bindings, and I hav=
en't checked them all yet, but it'd be a good rule of thumb if the behaviou=
r was consistent with other hypercalls/domctls.


>  We do return errors elsewhere for
> operations attempted against dying domains, and that seems all fine,
> not sure why paging operations need to be different in this regard.
> Arm does also return -EINVAL in that case.

How about we return EINVAL *and* in DEBUG builds fill the struct with an ea=
sily recognizable poison value?

>=20
> So what about postponing this change to 4.18 in order to avoid
> surprises, but then taking it in its current form at the start of the
> development window, as to have time to detect any issues?
>=20
>> As a minor remark: _If_ you're changing the printk(), then please
>> also switch to using %pd.
>=20
> I've considered this, but then printing: "Tried to do a paging domctl
> op on dying domain dX" felt kind of repetitive to me because of the
> usage of domain and dX in the same sentence.  Anyway, will adjust.
>=20
> Thanks, Roger.

Thanks,
--Edwin


