Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759C94DB9CF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 21:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291278.494294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUahc-0000pC-RW; Wed, 16 Mar 2022 20:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291278.494294; Wed, 16 Mar 2022 20:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUahc-0000ma-OE; Wed, 16 Mar 2022 20:57:04 +0000
Received: by outflank-mailman (input) for mailman id 291278;
 Wed, 16 Mar 2022 20:57:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsrA=T3=citrix.com=prvs=067c1f106=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUahb-0000mU-Jf
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 20:57:04 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f0c5dbe-a56b-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 21:57:00 +0100 (CET)
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
X-Inumbo-ID: 9f0c5dbe-a56b-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647464220;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VgySFfHdbaCVSIEys9jxPhUbGA9vV3rmvJ7Y1Ffdl28=;
  b=ZDK+3XsikKKK2XwgYzEb1O4kx/FR23wNx2TaXcFhgNGPWt29vYx+kY4Y
   4dnVZZcBZXFF3r2begI9ImQcQT/fNiMlPlybunRr+G48aZoii3Fj0W3ph
   UOLp/1GjCwHCxufTzqe61CYO+Ew2MhsvrwFTH0BdJe/QGaUY9kSY3vpBr
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66837902
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EUnO76Nn/W6//H7vrR2Yl8FynXyQoLVcMsEvi/4bfWQNrUor3zZTz
 GRMD2rQa/eJZGvyet50PY/no0oO7MOEm941Sgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi29Aw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 NF0r66tEC4See7VtrUtfgBVLQx/IvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQ6aFO
 JtBM1KDajzlfBd9K3AUEa4Hnf+Di1vCVGRjrVys8P9fD2/7k1UqjemF3MDuUtmDX8BchEubj
 mPA4WXiAxseOcCfyDyK6XaljKnEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ8+CAjsKwz/0yDVcTmUluzp3vslgEYc8pdFas98g7l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt9/tPCZdreS8cjXe75nFnR6rNBY4LHBXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZvvm3qsnSZAhSVjWJPT6ih8hDl4PlJN+51pXHR7
 SFfy6ByAA3jZKxhdRBhos1QRNlFBN7faVUwZGKD+bF6r1xBHFb5IehtDMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/S/T4W/D6qEN4AUCnSUSONh1Ho3DaJ39zqx+HXAbIllY
 cvLGSpSJSty5VtbIMqeGL5GjO5DKtEWzmLPX5HrpylLIpLFDEN5vYwtaQPUBshgtfvsiFyMr
 753apvboz0CAbaWSnSGruYuwaUicCFT6Wbe8JcMKIZu42NORQkcNhMm6eh4KtI/wPgNyLugE
 7PUchYw9WcTTEbvcG2iQntidKnuTdB4q3c6NjYrJlGmxz4oZoPH0UvVX8JfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:H6XyjaPcckFzsMBcT2/155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjzjSWE9Qr4WBkb6LW90DHpewKSyXcH2/hsAV7EZniphILIFvAv0WKG+VPd8kLFh5dgPM
 tbAstD4ZjLfCJHZKXBkUiF+rQbsaG6GcmT7I+0pRYMcegpUdAa0+4QMHfBLqQcfngjOXNNLu
 v72iMxnUvGRZ14VLXYOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LPErXoBerR8bMRiA0HkAgMbzaFBOO
 gg5RPpi7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4bkWUzxjIdLH47JlOz1GnnKp
 gbMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Tol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+83JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9NllVnQ6dvf22y6IJyIEUHoCbQhFrYGpe5vednw==
X-IronPort-AV: E=Sophos;i="5.90,187,1643691600"; 
   d="scan'208";a="66837902"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kW9/nncQ/1EIrUBuuNhy/oYnY1AwiaGij6E25+7nSzI/vLHRj9Ba/GnNkf1jjARa2zbvi73ypl7iU4MURZrox/pG8X2OM6ON42dSqauC1+QYH0wABBegjRC0KjtTknsznj02Bgj32jFmS7ZNWkQe+nV8196cEza1nHUxQkDGAa00AZJfYxdZEx2GYqEwgzRZJF5ofv0lRsEvBGPkLoE9A2IAcJXNsT6HkJ4p+xQ8mP1Y9tG1MMucXxbGOwn3Mv15rYVdpi9/ZSM0NUlgB7lPaJ/Lsf+1+dyzvazTAyU8Dl8KX/BBE3flnZim5ahN4MZlMp6lbd9V05YC1h7VQU6H1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgySFfHdbaCVSIEys9jxPhUbGA9vV3rmvJ7Y1Ffdl28=;
 b=UswdiMPJ94NsdHdruYnYCEw88AXrW0knLhAFvMpiBXQ3DWi+JXZfoL8GSDuGRYRfQ+ZrxF3Ecggb7mdDQn8DtPsj23sdXJw5uYDwiCgnJkjcOrTOiwJsxIZ2bbjMbBD03WUohojRWFGZYvOFmTqGIxkxDOepT6xRc0J3fLhXC03Sm+FL1jj7sq64w/u7/KugSz55qBR/aJtvz1wDdb2I+FzPhYslM9xDyJsHH6liidN+7Kh2z1dMoO0+pErFnmWyhiK03L4RnJyz3iTPR5s7yD5BRHDLtv+ROp3Dalvg7cqoaf2UOo3XBcWzXH1TAkF3z87/WK3eZLMeq9CNfenXLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgySFfHdbaCVSIEys9jxPhUbGA9vV3rmvJ7Y1Ffdl28=;
 b=NP0YZoeR1c8VTWze+B3iLbdqdr6Ol9ThHMbFI5qIZOzT7SI2Pqzvp5+SCcL6PZbmu6qBH+vmuY0X49Ijcjb3zw646edxUYDc/6GWJxQ+YF/eejiSimptZ1/EIWLmeYqwXLCDoeO9SDOqDj+kFz80EQYLEo2UZ0shyVCoFZkNgCY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cet: Clear IST supervisor token busy bits on S3
 resume
Thread-Topic: [PATCH] x86/cet: Clear IST supervisor token busy bits on S3
 resume
Thread-Index: AQHYN5LV95qT5IqqP0y7/NV/gPy3Uqy+8M2AgAOQxYA=
Date: Wed, 16 Mar 2022 20:56:52 +0000
Message-ID: <42d12b90-7f25-2e2e-93fb-398b3ed8edc9@citrix.com>
References: <20220314110034.28498-1-andrew.cooper3@citrix.com>
 <eb3316ac-0ab7-5cd8-85b6-164ffc78e725@suse.com>
In-Reply-To: <eb3316ac-0ab7-5cd8-85b6-164ffc78e725@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b34f73d-a7cc-4f14-5bc9-08da078f7f5e
x-ms-traffictypediagnostic: BYAPR03MB4549:EE_
x-microsoft-antispam-prvs: <BYAPR03MB454977446CF39CE2157B4CD0BA119@BYAPR03MB4549.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wWHfySbwdW592BlXF4DsAAsBEvK1ThEnzsXCNpWr5i0EG60FSjlxBCbg+pBY29Ea/JrVDDjLcehcGTl5r6uIMQXNbUjbaCIXTkNj7u7HDTh2HzIMoGgtM3gWcFrZCtZ4xD+gcxoigVX0HHMIFIerYS5Hh07BBTqxjZ192a77QuyFxFRoBZRXCvLmBVbJUPD9IOGEm/GO570FFaOMU2L6nJgDgdKjHiru+RaSo8WnQrRNNfSw1Ko7yStZPkcO0W+3yJvWOxhlqpZWW7QDHuu96vhjBwxBc9YM8hnXRljYFZjh6Uu74V1zYPFDVIveXKBIdDNj9H5e6FZdNmLT4mXklmvzVZ/dnO/LE4gGnJ/9gYOUlSfArkVOa66U0SObjfMM3fVedvGA9+jgn/xJefOQtUjUwxWJcfRYSXG57WhKUTHLT24jHyidDOsiQmB4PeUz+qSC1w1AM1xyKPG2y/Dwss2KaA2NihJNia6hZ8o1g4ydkVxXxeofMIc26HZT5/IHpXxEEfk/EjhGBKXCCPP/Z+dz3ciIzl52Nv4rE8smgtnCpX9XYkh017D9o4PHf2jG52v1nMiCKMRiI5mvCZ/MGNt6aBq02RPbxxjddnf3Hzki2S7fnc1Wws142o0oOuQeNwGhNx2G7oZlFJlTdvFGrJf3DSxHS2+PoVBqckT/h0Q/QI7F9e9xWUjEXL0ug5BXvP6/I5l18nutCT4nabrL6LdyqUyORvQM5qLSRXO3CqKcGx5SwtU4wfEfd9X8NT5g4ZlqKHYTy0qWPfkGae0X2Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(2906002)(316002)(4326008)(8676002)(5660300002)(64756008)(54906003)(71200400001)(76116006)(6916009)(66556008)(66446008)(4744005)(66476007)(2616005)(53546011)(66946007)(86362001)(82960400001)(91956017)(508600001)(38100700002)(31696002)(6512007)(122000001)(36756003)(6506007)(186003)(38070700005)(6486002)(26005)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0g0N1B5aUlsRUVjL0V0TGpEV0dKSFdrTjhKL1UrYkVhbzE4UTJNdEdTTlVO?=
 =?utf-8?B?R0YyYU9raUFibklWVVpWTVVPSnVpU1NuNWdBdkZDR2ZCY3JlM09hOTAzZXIx?=
 =?utf-8?B?U1hBYTI0QVcvc29vdW10eUFNN2tSMmpSRmV1UVVuZ3JNMjk0SVlWR1ZzOUIw?=
 =?utf-8?B?ZWh5Q1U1dGJuYlB2STRHY3pBSjRWeDBJejNKUDlZa1Jib1ZYak0vSXdLY1BU?=
 =?utf-8?B?QjdVL1drQnhsdnVxajkyTGFRd3lQOXp4T3d5S2dhUVhaZSt0L2ZKR0pKRFdV?=
 =?utf-8?B?MStzWk1ZUmp5Y1R0Y1R1Skc0OW95UGp1UjFzVjRhK3ZEVlluZ2pUaHlnemhQ?=
 =?utf-8?B?L1VEUWc1V29JM1J5bjFlQTJkSFNFQ2pxcklhTG5xcWltTmRnWUQva3pMbEFB?=
 =?utf-8?B?blFSUFBRSDBVdnZTWUJGS3NPc3A2SzArMHNBNXoxYUVjNFdBcWFxbzdSWEd0?=
 =?utf-8?B?eXcwUlVFOXlSbVBTN3U4QVF5U3paOUZvVjQxckcrTzF4UXd2dzN0K3Vwdmkw?=
 =?utf-8?B?R1AvOTdEYW53L3UwSXJrbWRTSXh3WG92QUphejdPUVhCL200Q2lUL3Q2aUtR?=
 =?utf-8?B?OGtYTlJPaUFlSWRadUZCak1EQ210bEJZNUFUZ09Yb2dSOWUzeFhsVjlGdHBo?=
 =?utf-8?B?RlJHeGVFQ1U2VmNSOHNBOGFNeTJOS0diR2dnQVhISkhXaEt4d05xZnVLcThw?=
 =?utf-8?B?Sy9GdVovc3doc0lqVmRWSGVpSUlyd1ZVVGhmcUhEU2hDcCtpd0ZiajVva2pi?=
 =?utf-8?B?bFh6REVDb1puN1JvQVVDVjlCdHJRZ3pXd3ZSVjVac2NwZ1dIS0xqMldTUjEr?=
 =?utf-8?B?RWlsZ3JIVEhSczNOVktDa3BHc1pyNCs2TU9LK0FPeG5Ld0MvOXpZaG94RmpB?=
 =?utf-8?B?Wm5rQktycXEySWt4WDBLTG5BS0ZSZ0FNUzBNZzJhYnpaRTczbWUrYjFkQkdh?=
 =?utf-8?B?WEJ0eE1haUhFRUFJQ3Ftb3Z0VlAwdVk5ZkM0cGJtaTdTTkRCdWNheDJjNTc3?=
 =?utf-8?B?eVdudWdVN2drRElrS3Vrc1QraXVpaE1uZXJKU0s2emYveW5naVZra1dvRUs0?=
 =?utf-8?B?aDZUMGdZL3V6Z1RZZU0wNkJ3WXlyWndDTFlpa2pIMzN6L3NhanA3V1NlY0Q5?=
 =?utf-8?B?NFZrdE9WaXJJWEpNblFKN2JLVStZeGE5YmUwT1lTeHhYMHR6U0E3NlZOZTdh?=
 =?utf-8?B?NWt1N0krMEM2b2RKS2RMNWhuNy9jVUFzVHEwNTkvdWdIVlNjcEZnQmZyVWdI?=
 =?utf-8?B?MHRveEp5MjArbGk3T09FaUk2NklhU3Y5eFg0cXlDdnZ1RE4yTEV0QTc5RVhw?=
 =?utf-8?B?WUlsTXR6bnp4bXVXOFI4SFdMVmp6Mmh3WWpxNThwNUJzbVNFNnBvZTFYTDly?=
 =?utf-8?B?c1dHcXpMTlV3L285dFU2NkFjamFtM0tuSzR5VkNhMnM5ejFVSi9GRE9iM29K?=
 =?utf-8?B?TDNKbDYvMzFYUVpXb2U0a2dsb2pYb1RvejVPQnRKSXByR1htS1FmcDN4S3pJ?=
 =?utf-8?B?N1MwQzFXZ0hjOVFYNUg5MmRRNDdlb0pabk4xcTk4T2hLbzhSZnRIczNpaDJr?=
 =?utf-8?B?S3RNZTNSZllyVjl5cjhZRjRKd3R1VTB1RHZ2cGUyakQ1S3Z3WGxGN1UvR1Zm?=
 =?utf-8?B?TDFRbitmRkpRR0dZbllLZzNocStmNERDWG05SGxKMW1mL01PQjIwTHZHVUZk?=
 =?utf-8?B?OGVOa1lnTEd6Z2Ntb09QNjhxdmQ1dUJyM0c5eUdaR2V1QW52TXlld3RHRXZs?=
 =?utf-8?B?SFJBbzJYaHM2dVFnb0pDNDlHc2R2Tk1uM0JsN1hNbVVBWGIzNzRjcFFBZ1Z4?=
 =?utf-8?B?U2JFYmdDOU5oVFM2ZENxcUVBWHhVcHc4blV1VmoreE5KZWYrQWxReXlHRmpp?=
 =?utf-8?B?YmdNR3hjSklEVjdjeDRMQlRvem45bE9DQm04YmRxYlpESEJ6VCtYNVpqdCtL?=
 =?utf-8?Q?VuhMqiyuJ90TKZShP84qnPH0fDdTxUNE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79DF40B88769A347BFCD6CDF03D7D076@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b34f73d-a7cc-4f14-5bc9-08da078f7f5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 20:56:52.3860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aMNw6EBAog+K4ZwqwyPu5ExmOOrfqFyLocsTNsYaZ4kdWzwgRVWHyM3PI3NHWbYJxN9PgacDFDIpPGlYI5F7CRf7O3lc0rbGt4gQ190v++U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4549
X-OriginatorOrg: citrix.com

T24gMTQvMDMvMjAyMiAxNDoyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAzLjIwMjIg
MTI6MDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBTdGFja3MgYXJlIG5vdCBmcmVlZCBhY3Jv
c3MgUzMuICBFeGVjdXRpb24ganVzdCBzdG9wcywgbGVhdmluZyBzdXBlcnZpc29yDQo+PiB0b2tl
biBidXN5IGJpdHMgYWN0aXZlLiAgRml4aW5nIHRoaXMgZm9yIHRoZSBwcmltYXJ5IHNoYWRvdyBz
dGFjayB3YXMgZG9uZQ0KPj4gcHJldmlvdXNseSwgYnV0IHRoZXJlIGlzIGEgKHJhcmUpIHJpc2sg
dGhhdCBhbiBJU1QgdG9rZW4gaXMgbGVmdCBidXN5IHRvby4NCj4+IFRoaXMgd2lsbCBtYW5pZmVz
dCBhcyAjREYgbmV4dCB0aW1lIHRoZSBJU1QgdmVjdG9yIGdldHMgdXNlZC4NCj4gVGhpbmtpbmcg
YWJvdXQgaXQgc29tZSBtb3JlIC0gd291bGRuJ3QgaXQgYmUgbW9yZSBuYXR1cmFsIHRvIHR1cm4g
b2ZmDQo+IENFVCBhcyBDUFVzIGFyZSBiZWluZyBicm91Z2h0IGRvd24gKGFuZCBmb3IgdGhlIEJT
UCBhcyBsYXRlIGFzIHBvc3NpYmxlDQo+IGJlZm9yZSBhY3R1YWxseSBpbnZva2luZyBTMyk/IFRo
YXQgd2F5IG5vIG5ldyBidXN5IGJpdHMgY2FuIGJlIHdyaXR0ZW4NCj4gYW55bW9yZS4NCg0KSSBk
aWQgY29uc2lkZXIgdGhhdCwgYnV0IEkgZG9uJ3Qgd2FudCB0byBnbyBkb3duIHRoYXQgcm91dGUu
wqAgSXQncyB0b28NCmVhc3kgdG8gbGV0IHRoYXQgdHVybiBpbnRvIGEgYnVnIHdoZXJlIHdlIGZh
aWwgdG8gdHVybiBzaHN0ayBiYWNrIG9uLA0KcGFydGljdWxhcmx5IGFzIHdlIGhhdmUgY3B1IHBh
cmtpbmcgcmF0aGVyIHRoYW4gZnVsbCBvZmZsaW5lLg0KDQpJdCdzIGZhciBzYWZlciBJTU8gdG8g
ZW5zdXJlIHRoYXQgc2hzdGsgaXMgYWN0aXZlIGZvciBhbGwgYWN0aXZpdGllcyBpbg0KWGVuIGNv
bnRleHQuDQoNCn5BbmRyZXcNCg==

