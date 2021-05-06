Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190F937540A
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 14:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123475.232907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ledNc-0002df-1I; Thu, 06 May 2021 12:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123475.232907; Thu, 06 May 2021 12:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ledNb-0002ac-U1; Thu, 06 May 2021 12:45:23 +0000
Received: by outflank-mailman (input) for mailman id 123475;
 Thu, 06 May 2021 12:45:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9FTm=KB=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ledNa-0002aW-CH
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 12:45:22 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95bb6067-7974-4556-98cc-441e32b81550;
 Thu, 06 May 2021 12:45:21 +0000 (UTC)
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
X-Inumbo-ID: 95bb6067-7974-4556-98cc-441e32b81550
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620305120;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CaFMvaXG+IcmbGP4ApcA1HnATW8o6SK5UhElbJFmBUw=;
  b=DVUOLOa0osJUOB0+85VqJ1tahwQKL3r2754j8yzG6TDVyArFf/XQz1aU
   +BP0hJcLqMRUMOCWfKX7DQ/UydZOGA5myFeAazjIqDRtRVVEGlMpYb57B
   70fWNpS/NrpW06LS58ZrFO3n6DCip84QrPefq1XzuUmVATGfExI7cCMlI
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xk3sQ0vbkSYG4Koe/MxUSlNtmghQ7DNZ2UewGez7TJBb3EnCM8KgmFFlmY0tINIy9amTyZC08y
 InCGIeNYx6hRdFMFbNu6w0CAy/LkJPOGp96RmSerf02eVfydX3l2QA31Ca12VlTcupgQ/gx+dl
 xflCiZj212skQEV3TsdNMhOxqdVSB/9z0uhSXeWlEBv+ybmFYAwJI1lo3WKGAzHSgQELr4res3
 0gGDAYBf9Kfo0Ddd+uAcGHGAdgzqebDdU0Gelf5O9z0X79UIrPcHdG1mOzxhpGvixgQiYQN5af
 1+0=
X-SBRS: 5.1
X-MesageID: 43200045
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:uB90sK2cjzvp9pze/UL7pQqjBXtyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ5expOMG7MBfhHQYc2/hRAV7QZniYhILOFvAj0WKC+UyvJ8SazI9gPM
 hbAtBD4bHLfDpHZIPBkXSF+rUbsZq6GcKT9JzjJh5WJGkAAcwBnmRE40SgYzdLrWF9dMcE/f
 Gnl616Tk+bCA0qh7OAdx84tob41rj2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJpJmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF5d1HqWxa1O
 UkkS1Qefib2EmhJ11dZiGdgzUI5QxerEMKD2Xo2kcL7/aJHg7SQPAx+76xOiGpmnbI+usMjJ
 6jlljpxKZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh4LD2bCtuYec99Q/Bmcsa+d
 NVfYvhDTdtACWnhnvizyVSKRyXLzwO9zK9Mwc/U+CuokxrdUFCvgIlLZYk7wI9HboGOu55Ds
 r/Q9ZVqI0=
X-IronPort-AV: E=Sophos;i="5.82,277,1613451600"; 
   d="scan'208";a="43200045"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W839nPeYOCxdb8X8rn50eyYkB4E2dhjfh0Pp+inaKgR6ZRA85KYqo5l3XjjQzjUaLo9H2Md/4Z8qPsYYiTy75m3ccl2HcFXfTm38GbWVnPkTYnWreeh4wEmOY1PXAlqTP9IL+keBtSvRlmhAtp9jr4H//T35hniyZ/kazUGCuZIU5QSDojfk3KODSProM1x1weImggB2eM0SI7Y7rN7GK2yN6CnZHDNEzUXcEr0klT/8jXBXfou+/MPR/Pw8tVb05/lhRuncEO9jsO0RLT50xBJh0yKCsGssGo3cHjfO0aEH+b0t5BuNNEggdWfWX5W7ikqmj1OEW+Mu85HMighZ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJOnOu+ywRNBf0OYecsn/LJgkcJRORzGaERRQc3EHSE=;
 b=Zijn8m3+NjyMp1BJ+hRZH/x8Ix3S46fgAThEqDNbVXtyCvM5ktYl3Mdpl6+OBBrePbBwLoNn5Chng3DG5+85SP5ZF6PQ8CYg/UXO+ojPTzpx5JI8aGWrXhcPAvTvbQrWZoCiyDm75YBd/EEI9aVhRrCf4z8ig64Pf9dYxFcDLjQRgK5HL3GPbG3XM/BFy1yOGLrJIOWgQ1mQodIXTkQtFmJ/lnE8nPRrVSIYQbuou1CIAUU9YrsoY+y5QQZLAewC+Fp/TeSzqkPBfGtgJU+Y+HD9gkaCCrgyY0WCt5PmC+7RKiXAaBg38DKEwUvJbXVWKKOxAF696z2k3j4+8v+GfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJOnOu+ywRNBf0OYecsn/LJgkcJRORzGaERRQc3EHSE=;
 b=PCuMVax6yT+9FNFwNUXmtbgO8rdQf4s9dzumMruBQrBLw1aTc081UCTrFwDQfUaVh4kY4fTjCkFa5WWItuOdBaU3Lc9gAyqmW4q0Qh0JdLyyttW4/8nFmrhO/eiKyv7u/VXU9cdrfVrXmiqZhOpEsa4Q3jiDijENQvedLAf8TBs=
From: George Dunlap <George.Dunlap@citrix.com>
To: "security@xenproject.org" <security@xenproject.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] SUPPORT.md: Un-shimmed 32-bit PV guests are no longer
 supported
Thread-Topic: [PATCH] SUPPORT.md: Un-shimmed 32-bit PV guests are no longer
 supported
Thread-Index: AQHXQnNye/i9R6SCGUuiaMyKv7X1oqrWZmuA
Date: Thu, 6 May 2021 12:45:16 +0000
Message-ID: <1D2E57BF-DE91-49C7-B88D-F282523DE32B@citrix.com>
References: <20210506122915.65108-1-george.dunlap@citrix.com>
In-Reply-To: <20210506122915.65108-1-george.dunlap@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad7a8932-2a5c-4821-94f2-08d9108ccccb
x-ms-traffictypediagnostic: PH0PR03MB6235:
x-microsoft-antispam-prvs: <PH0PR03MB6235B06A3C22D7E4A944FA9299589@PH0PR03MB6235.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6sZqGpYPAT5GkFL3TpPmPCPPrHP4uRxu5jti+M4N4J1z+1Nl/v+WTyQT5C9p5hdSU7k5LcrtHxSp+tTxAjgiZtHwaPJN+anG2eHTvuYOWToP8ptOSb539gw3XQccuzopwHCQJ1xP3HrdSmZkPBzQJr5/vj2GtK81SHBVgQ8vngT6a6wAJtA9XHyHIrrjvmz1bktxKQzPnLxWVHb59E/mSUGYyUVqgwLbrTJFbocKGYP7Ua26aVIBR4lSuTdy2U1NtmIjpFjpf3cFkz2TzCeZ9l/OLkqygCJZDDQMI2dGzJc2rk1aTVFJQLFYq2h/gkASWJZq92X0K7zErKIqmGbQ3XILxhLFxkSFiJbSeSxTDPolkrO62NfRAEFjPWewR8u5Pksoq46vxNK895ZNtjaMAJPfkolom4xLq7wGgsaqGE+6dNPBXXRjWhFSeMfcoEWLX0Us5j+OqBkLqZafO0HZbeSNX4UsY3uMSA8GjVHyzWb6cZmceYxNQsJPD41sldPcKC+Hf9Y5B+nFqJbEcDQdHFXXnEnI6KPYidcvnNCN+AvnOmPI07hSTmq6mjZAvzvol5XfLWMp+J1OgXPKMp9Y8HMgr8GZy5lUqFgRoqOuUJCTfiuzdKARdJf8xWNXidrVT1Gq/ExKS1QHjzvYhwyT7B9w3BJZfEiwIwtpFaQnA0I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(6916009)(91956017)(71200400001)(4326008)(4744005)(86362001)(26005)(478600001)(76116006)(36756003)(53546011)(186003)(2616005)(316002)(5660300002)(64756008)(6506007)(2906002)(6486002)(8936002)(66946007)(66476007)(66556008)(122000001)(66446008)(6512007)(38100700002)(8676002)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wZeRcTuDHn1eyWWCjWcH97T2IHuYhOk1FIsOTALYzHxULmNlXPHMPNy1X8iU?=
 =?us-ascii?Q?1V7FF3JbQJt7uY6NL/UGIJHVq9uL9puBUh4LDOC4ucxe2hu86o2dZLc4OJf3?=
 =?us-ascii?Q?0Q2w67gjBlfC7PAW5kY9AD1aaS5vj/zfFxpwRfaIvTIFqPt2P4iTl0qzuaK3?=
 =?us-ascii?Q?ZDMFKGLWZ/8dFrEyeJ+w6XMM8lR9a7kcbLCmndZpUVPIuMwCnRflW/SrBT4l?=
 =?us-ascii?Q?sPLW+IviJKCwXG8H7EgU/xw/WsPuRxhuZKBR1ZWVHhhrL3Y18Yi3X6IwGvGQ?=
 =?us-ascii?Q?cFgli0/qJt39lsV+/LRo9RB+AqM8z/gtpsmOTPC7QdnQujkmYk2hp9x0+LdL?=
 =?us-ascii?Q?GdNCqu/HvmPy9XnqZQcjvi4h3nJqCnigYpVm3p3Fs/XjqyTLsTqpdTe9/2si?=
 =?us-ascii?Q?KqIHLXLQqGwQXXGLwWFzC5jQfbCjmV7/8xgywCHuZtk3K8E/9ioIsp5F7pW9?=
 =?us-ascii?Q?lY2mP4RCdFbbctQa1DlMvUFUxc3Wb+z/kC5hqCxR4I2ycsGg/XGw//5yJd+s?=
 =?us-ascii?Q?FUNX0XQQUSctGVFzn99FIvOuZnRMyc3iJf8/8AqEKUiJ0LN7FAWhu1sHyC9k?=
 =?us-ascii?Q?3Lvx7v/gksA3TkqcY6f10jBFbb8qnbT/DiiI5NegIFViMYoJXKjbMgLZ2/O5?=
 =?us-ascii?Q?exFvT2YgzZI6ep12r3PggrmDOa5kmEW4koDRoCVJLvus3Gvgu2e3Bs9gquZA?=
 =?us-ascii?Q?Wz2Wb0zK1W9J5IVcUGk57lJl8ljkUuDA5BOo81yj1T3y6gUVrIm7PxBmV1UA?=
 =?us-ascii?Q?ADBJOGr9uMtnMJN9Xop0YQexLcp9uSHAFz1w+xVCiKzPxNF8lE2AVZjvU60M?=
 =?us-ascii?Q?5WgkieKSMcGfRpJ3nqPkdLd1b0S8uDNmzLsZZS/mD9ji2wbb5jXYvnkjd7rr?=
 =?us-ascii?Q?zc0iwNnbm+CltFYd9dJO/JD3dVDBtUkB5clOaoX2mD/kkMv5M08CFLpMdDOZ?=
 =?us-ascii?Q?YrYpTDqTbmmMSJDb4sw/rv5kgGZer1DChyy+I+1xypNJalELiTDGC/VUy/Qn?=
 =?us-ascii?Q?o17Qk0+bfkIcDxXh+0NTfCmh8jxEuPqRFWQidua6ah1fwlMNa+FzmxbzEDve?=
 =?us-ascii?Q?0n4jK5F1hlUT+t8072I5LRh53sla1ZAsq1vujDpAyVAblcXtOEpywuNpV8LB?=
 =?us-ascii?Q?yb0lZPGdwOdytQFp7ru0Tx54rpJkU2EW1DLhUUTYgwr/eqFikN378DeSOATL?=
 =?us-ascii?Q?Dl4TGVTf1g15ytC8MlSXWApNnn4NY9M4gXsc1gbEuoGyQphTi1qq5tDLcKkE?=
 =?us-ascii?Q?5Ko3PeLDVFNk6UFDFGLC2lvPRvbUGGS8K1qwf1fw34DDxuQ3pqeS3i8wLM5W?=
 =?us-ascii?Q?C2Rb3R4oc2bVQfV/+vSTCvT2L6tinJlaT4wVgxiMYba06Q=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3F15A1593561924796C76D0841FD5AA5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7a8932-2a5c-4821-94f2-08d9108ccccb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 12:45:16.5442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vzDk9llbTEO1thUPMIUleuw4aRS5pNDB1jjQZAPwPz8mszO4l8KawxyRymJ5kRLydkj1m43QqCSejKP8CpV0F5jhOL6xQTcem47ayEw0Zl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6235
X-OriginatorOrg: citrix.com



> On May 6, 2021, at 1:29 PM, George Dunlap <george.dunlap@citrix.com> wrot=
e:
>=20
> The support status of 32-bit guests doesn't seem particularly useful.
>=20
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
>=20
> NB this patch should be considered a proposal to the community, as a
> follow-on to XSA-370.  As mentioned in the advisory, we will wait
> until 25 May for comments before checking it in.

Sorry, this is an old version of the patch; sending out a new version.

 -George

