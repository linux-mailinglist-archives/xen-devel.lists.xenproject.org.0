Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65C24D1CE5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:13:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287162.487018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcSW-0004UM-Qw; Tue, 08 Mar 2022 16:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287162.487018; Tue, 08 Mar 2022 16:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcSW-0004SR-NM; Tue, 08 Mar 2022 16:13:12 +0000
Received: by outflank-mailman (input) for mailman id 287162;
 Tue, 08 Mar 2022 16:13:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibIM=TT=citrix.com=prvs=059cca470=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nRcSU-0004SL-Sl
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:13:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4308a4d-9efa-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 17:13:09 +0100 (CET)
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
X-Inumbo-ID: a4308a4d-9efa-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646755989;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=n2tesfGqKKQZ3sTBGGMzuzCB4pZuYikofZ3Le0PsZzA=;
  b=RfALWHs+pzvc0iS3/3icBrvurHM8A//G9dXwNOcB7sf8qz8sROvjXyef
   DCvyDX21Jh1gOD9i4bhSxWH+KqOZJ0yg+AQn3S1l5RrdvNUA6x9iY3WGi
   mRRhNqzuw3jld/SdWMpr2RbTkwackeMC9QSV2Ko4rB1SjkGVwc+tnWVSf
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65729038
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wN/I8qNmDVLSl/jvrR1dl8FynXyQoLVcMsEvi/4bfWQNrUoq1TVUz
 GJJWG3UM/eOMWKmf9t/at+woBlS7JDcz9NkHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2t4w27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 Ml3mbexRl8SYvfGucAxdl4fFgVTBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALDsDtMcU6s3VpyTjfAN4tQIzZQrWM7thdtNs1rp4TQqyPP
 5FJAdZpRCrgOBASYQo0NLcVjNyW2yfwQjBa8k3A8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt8G+oh+LJtTP2XsQVDrLQ3sBthFqf12kCEio8XFGwoeS6okOmUtcZI
 EsRkgIipLY/3FamRd78W1u/unHslgEYc8pdFas98g7l4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9S3iQ67OVpjOaIjUOICkJYipsZQkK+d74u6kokwnCCN1kFcaIYsbdQG+qh
 WrQ9W5n2utV3ZVjO7iHEU7vuy6WirPIQVYOul/df0aJy0Q+YaqIXtn9gbTE1spoIIGcR1iHm
 XELncmC8ewDZa2weDyxrPYlR+/wuavcWNHIqRs2RsR6qWzxk5K2Vd0IuFlDyFFV3tHokNMDS
 Gvaoktv6ZBaJxNGhocnMtvqW6zGIUUNfOkJt8w4jPITOvCdlyfdpUmCgHJ8OUi3yCDAdollZ
 f+mnT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiLLF+hVbQDXPr1ihE9hnOkz2
 4wEXydt408DONASnwGNqdJDRbz0BSJT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7GJbIwO/tokC
 kqVAxcCoHKm3CWvAVzTNhhLNeO+Nb4i/ClTFXF9Yj6VN40LPN/HAFE3LMBsI9HKNYVLkJZJc
 hXyU5nYUqQVFGWdoGh1gFuUhNUKSSlHTDmmZkKNSDM+Y4RhV0rO/NrldRHo7y4AEmy8ss5Wn
 lFq/lmzrUYrL+i6MPvrVQ==
IronPort-HdrOrdr: A9a23:OffTl6Mi85eQXsBcT3b155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjzjSWE9Qr4WBkb6LW90DHpewKRyXcH2/hsAV7EZniohILIFvAu0WKG+VPd8kLFh5dgPM
 tbAstD4ZjLfCJHZKXBkUeF+rQbsaG6GcmT7I+0pRYMcegpUdAa0+4QMHfCLqQcfngjOXNNLu
 v72iMxnUvGRZ14VLXYOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LPErXoBerR8bMRiA0DkAgMbzaBB+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jRiuKYlGclsRLYkjQpo+VY7bVfHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TpE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZeo6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z44HSKyGG4fIyQZ0Wf9igF3ekIhlTVfsuYDRG+
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65729038"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rf8SSf5sAPGpSolnV28m2MYsfVMyJxVh3s7yk4fic+oYPR+ckdH+vG8DEZzPbq929OkvJF8weA0zZCtrgK7g4euWZLJNATlHMCGtYWMddSLa8qQ/1hbUphO4wGaqLFadJs3EkparW9tZQlQPENiNOBrmn4/hHUMjr8zbc/CnF6TMiQ92CA2cKjgib0phzkW7RbdnrEEeLguoyD1+SA4WJc9nXNRMRo0DYyaqQtIhjkR0Lo4u0Scj4kteNYc0ibxN7ijEQjnFtTa+iRrgAc4T3kx63X4dlnwq76rMzCNEik8CAi93XPrBl4FmwXdiraOHIZmQdjaKYGJ4SuAxOSKmjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2tesfGqKKQZ3sTBGGMzuzCB4pZuYikofZ3Le0PsZzA=;
 b=i7qUKCVLSVF7LEjz1f5RqyRntT2PFmXA7OniTdNcw7+xRp/CDusvkJT4b19i3GxnxiKBfXN1pNDm/6i8BTPPTlQKutWdmhpxBDlraEtuVDXDr1BTU7ZmwHqwgXN3npdi6GqYHSLbiXkJlmNkRArA1ltJnUrqtmKzQXO7HiqOETU9iDKsYr49+L/PG7jw6If9MorR3dwdprm3DAVKXNW1wB4nMJsvipW5YeHvpReSccOsLf7+dRIFZWwn+rs8QAEJOHEFQLxtu4ma8Cptvb9WgMD4LuiunUDAp299G6xxfuMvQMEU4tBCkByVcYvvN9AXVX7lixlnq+daBwxRxWqVvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2tesfGqKKQZ3sTBGGMzuzCB4pZuYikofZ3Le0PsZzA=;
 b=Pu+mN3bsF53cjs6VjDGUlD3fmf1z8tRZUkkQ3Nh2lD542a2CePWgdMqBFK1CvptceaDwOznh3Em7zj37aehKexWA7yZUCg4g6SYJJpAypuStD5q4Hl8I9pDK6AlM8MYnEqL9t1zbew6VUgpd70U5z7VTP+4wY1bXiYFKR/35joc=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYMjUEaMoAwzVpzE69n4F8Ciyydqy1XcmAgABEiACAAAUagIAAAtSA
Date: Tue, 8 Mar 2022 16:13:04 +0000
Message-ID: <18af493a-ce2d-60f6-bbca-2e163b924788@citrix.com>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-3-jane.malalane@citrix.com>
 <YidAU63TsVO/X1Q+@Air-de-Roger>
 <c20a3e9f-770c-3d2a-a332-ce836a4192da@citrix.com>
 <Yid+F5LdtMhs01tM@Air-de-Roger>
In-Reply-To: <Yid+F5LdtMhs01tM@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 710c58ce-dc70-48cd-a7ec-08da011e86a7
x-ms-traffictypediagnostic: CY4PR03MB2645:EE_
x-microsoft-antispam-prvs: <CY4PR03MB26456E90F79DECD94FD072B981099@CY4PR03MB2645.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZXkjyQoT/iaLKtp7cUzgnT/Y5S5QJpC5XoqIw+TkI17MAyYfuld8+/rrkp7goAbDeLbhFPmwIGtVVQuYbs80g8Z4GEZGrFRbd12kCl3sVqi5uAZ6QVpOy5G8wE+vJ6RLnlfogCSHs9zASYCWg/BrH1+Jfcqwio4n0K6KiJ5PCll3IYp7T1YD42zJdTmPdTD8e62flgC8LPXkDs3Tg45OBWy2iLRrb1AKkA1iNkT7636691sTSYRAfkYsDbWGOjophp4sRRsu65nOjgVxafbkFn8Qf83oQ0pN9fbreDyc4J5ZX6DT72e/Y895pRguTIaN3vhJWa0dbAs5JCLyyEsX7t1HjfirmfWKHwAd7HMgAF4fb6Kc75kZfN+STT/cxYtp+9orXDfJkmEL9EjVs9lPBxBKjojLpmRQuzkpxRGtsqq+BPmwSqRRU5M+3Y7lM91HnehhShYp14rliaLmyeISicdtRaSCpljTm37NHpMvIACZWu1ITW6zKgHkIoQgdfUUsSCb5uzTaX5uT13asj/Ns+DWoNq+dveph+FYRIjdvAMEYN0V9vj3WMIfJ99PCBjnir2jNLHuE1xwHouZb9uQg+8/CGnaOnLc4prhi42vTwWlArnxgDg1mavy3fOfWAhJNpoO38RT9weGtFGBhs70U+wFiTAGH4OCxfZ/F3uFb9nE/yGJfxM8AEd2IHX1Wnm01Wdnbvu4YqGXR8oJwmyUGlBE3JmTCWjbAPuqaKFIMK03V6bog9Yb+kf2UEWgAO35
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(5660300002)(8676002)(6862004)(64756008)(66446008)(66476007)(66556008)(66946007)(91956017)(76116006)(4326008)(31686004)(316002)(8936002)(186003)(6636002)(37006003)(54906003)(122000001)(38100700002)(36756003)(86362001)(38070700005)(508600001)(6486002)(31696002)(82960400001)(71200400001)(6506007)(6512007)(53546011)(55236004)(26005)(2616005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkdwQ1VadGtnb2orQjlKUmVtT2FFYS9vU3d1K1pJN1dncmwxOW1aQi91aXBF?=
 =?utf-8?B?UjRVQTJPNmxiVEVGTmF6ZjVRRktOMXN5OHpXamMyeWxLUWtxSExUM0NBVE5I?=
 =?utf-8?B?ZWtsMVRyVW1Tc09sS0RoZEZnaWFRb05iNGUwWlVxMU9aTlJHcUQ5aFo4RXl2?=
 =?utf-8?B?Nm9POFhnK091YkdRM0NCbXUvUEdYTTRoQ0liZ29ieVpDN1BqOUtYemo1UVhI?=
 =?utf-8?B?WXZuUXlTQzJlOXd6cnM4QTNHQjFUQ3NrU08wOWdEOXNlTjB4SFdNQmUyWFhQ?=
 =?utf-8?B?QzdwdzI0c3hSeWlsdDc3RUpVbXZkV0s2d0hiM0wwN29NcHd1NFRaSEIxemZE?=
 =?utf-8?B?SkZ5V1FycXZ1Q3E3TCtjTDk0bkQ1dVVjWkdVOFhpTmkvODFFdWpyam9FVXpl?=
 =?utf-8?B?cDZZRW1uaE9pTko0bDFjNGFOaGFPTzd2V21WK1hoVXp2L09NUEdkQ3lIb1N0?=
 =?utf-8?B?S0pQRHQrZFp5bFJSMlhQZzRkdDRYUTQwL053cmVKczRhcHJZeVoyY2YxK0Zt?=
 =?utf-8?B?OThCYXROdXJQck5CQ28zbGdCZXpJaXE3ekh4RHZQYmd6SjdqdU5ieWRWenY4?=
 =?utf-8?B?K3VRaXdMWjBsUjJDK0pmcGNGRk5vaWZsUmpReWlTRklZeTIwNGtSUDRMMzBm?=
 =?utf-8?B?T3ROWWRqUXg0VGVHbnA1a3JEQTdUTWRRMDRTQlY0NGFWdXE2SmY3dkJmUWtO?=
 =?utf-8?B?NEVta0NJNXVIbVdPSG0vV3RoSFBaNmhZNzVWQ0oxTWZmWTl6d3JLa3hWR1Rq?=
 =?utf-8?B?cjB1UVZwQmloemdqeHZ1dGZ3WmQ1RzBnUk9nMUpha0VscEoxZ2pZT21QVjVW?=
 =?utf-8?B?U3lVWDRJS0RhOVR4cnJ4Rmhua1V4a1ErdGtvSFBKVFhpT3d5Z1NlMTFYalpz?=
 =?utf-8?B?dXhJd3VoOHBRcDRFUTlad0NzdU0xRjlHT2hGcW5xNDN2NGJKVGJobE9rNXJH?=
 =?utf-8?B?dU9sckU5ZXZsNHdHNzlaVitqNlVGdnV1Nkt0dXo5VlJ1Q25idTR6bU40R3lI?=
 =?utf-8?B?MTljejdncEFQQVRLdlRWbHVkdHNWWXpZd3QvRi95eUpyRzRjdWtiRjBTWWZP?=
 =?utf-8?B?UjhZOFI0c0t3ZFV1M2E3dCthV0didW1BdDFnemdpMlA2N3J1NENRTDRlYVNu?=
 =?utf-8?B?SUcyVzQ4S1BBNUgzTjFLL2JRa0NUZTN6NWlDOGZocTdjSC9PZFpmNDBLcWVn?=
 =?utf-8?B?eDdNeEcrYk9JbDRRRXptT2N0SkpGdlZqNDhMcW9nL2QzZnZKUXlEaExoemRX?=
 =?utf-8?B?TFFzQkxFemxveDY4MWNIVDdscmd6ZDEzM2UyS3UzWDUxRWdSQ004bVdmU29t?=
 =?utf-8?B?MFZDOTNISnRyU01qeHgvTEJSWXhuSWZ4T1lIYUIwS1paZFJBUDB1U1ZjZlp3?=
 =?utf-8?B?bW0xWmxMeC8ySTZVTW9BQ3IyWXN2NzhPTC9MZWswMjFmVmdzTFFwaFp1SXZG?=
 =?utf-8?B?Z1BVd3lZb2VKbDRJWlcvNmw3SGoxdUVkeHdrbHJDNURWN05Yb3V0c3dnTVRS?=
 =?utf-8?B?WkthZjNMaFUvU2xiaTQzbmFnVXZrV3RWRkZIcDZOdldzVm5pOWlFT0VTR0FM?=
 =?utf-8?B?dnZGMVVQWlYvZlVnb3hUVE9NNjdTcDlhNVFUbEVvOHNDMnBDTzFkRVM1ZWFD?=
 =?utf-8?B?YkNEc0VWRkFMZjNKMm9DMTVBeGw4Skc1N3B2a3U2U0VjbFlPeVhqL3gycUUx?=
 =?utf-8?B?YnJ4Ny9DNVl2dTVOdzNQVWNkRTIxUDJ6Q0k4d1RhSVMva29nQ1BuVDdqNnJQ?=
 =?utf-8?B?QkRDVkpvamVBSmRvQkhDZzVSMm0yNmJOb2xDd1BIYzVWTnFQUTNpdU1ydEVZ?=
 =?utf-8?B?dGpmNkRTTkpnTkxtZldOTlNPNzRjUjlydDllMTZrYVNqbkhYcGZhUW1MUkNT?=
 =?utf-8?B?cTh3azNBVFFjbUpXOFVvNFJMNHVHTUVhT2lyZlZPUHZCdVBKKzhkY1ZzOG9D?=
 =?utf-8?B?NHBBenMwdzRhSW9OOGJpd0lWRjcrVWk1UG5jWDJhVnRGSFRNVURudmhTVE5I?=
 =?utf-8?B?Vitwbm1YNUtPa09yTURYclhWL3UyQ3F5bVIzODIrUFg4Nkp1RHdtNFRWbjht?=
 =?utf-8?B?dm5nazdROEVReGNHbk0wM1pwK3Jvb2lsS0ZHb3dPaTArNWUvVWlXQkpvTVNx?=
 =?utf-8?B?K2RYeWJ5aEpiRUUrTVMxSXpTS3h5VFNVQmVJajZXZzloRDhOL2VTWkJ0SFph?=
 =?utf-8?B?ZThvS21QT0FhWDBoeG1GMStoMUNhWmt0eWUyV0psZTRyNlZnSmZJSWRGRTg2?=
 =?utf-8?Q?02zhM7kFGxqFwCtQcuR2kk26FqkWmj3pbYaUxbHBHE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02DD911907946342BEB1215B788037C6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710c58ce-dc70-48cd-a7ec-08da011e86a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 16:13:04.4408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jd+PbL4XLsOIKcnGVltIkKMh855/xwwBi6b45oLEZuoL2S7Zqpv/mf3HE/ovENCC7iC2cXsOENOYvTNOvt77mkJLg5VJD3wbS0R5NhdECHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2645
X-OriginatorOrg: citrix.com

T24gMDgvMDMvMjAyMiAxNjowMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVHVlLCBN
YXIgMDgsIDIwMjIgYXQgMDM6NDQ6MThQTSArMDAwMCwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCj4+
IE9uIDA4LzAzLzIwMjIgMTE6MzgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gTW9u
LCBNYXIgMDcsIDIwMjIgYXQgMDM6MDY6MDlQTSArMDAwMCwgSmFuZSBNYWxhbGFuZSB3cm90ZToN
Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vdm14L3ZtY3Mu
aCBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vdm14L3ZtY3MuaA0KPj4+PiBpbmRleCA5
MTE5YWE4NTM2Li41YjdkNjYyZWQ3IDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaW5j
bHVkZS9hc20vaHZtL3ZteC92bWNzLmgNCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2h2bS92bXgvdm1jcy5oDQo+Pj4+IEBAIC0yMjAsNiArMjIwLDkgQEAgdm9pZCB2bXhfdm1j
c19yZWxvYWQoc3RydWN0IHZjcHUgKnYpOw0KPj4+PiAgICAjZGVmaW5lIENQVV9CQVNFRF9BQ1RJ
VkFURV9TRUNPTkRBUllfQ09OVFJPTFMgMHg4MDAwMDAwMA0KPj4+PiAgICBleHRlcm4gdTMyIHZt
eF9jcHVfYmFzZWRfZXhlY19jb250cm9sOw0KPj4+PiAgICANCj4+Pj4gKyNkZWZpbmUgaGFzX2Fz
c2lzdGVkX3hhcGljKGQpICAgKChkKS0+YXJjaC5odm0uYXNzaXN0ZWRfeGFwaWMpDQo+Pj4+ICsj
ZGVmaW5lIGhhc19hc3Npc3RlZF94MmFwaWMoZCkgICgoZCktPmFyY2guaHZtLmFzc2lzdGVkX3gy
YXBpYykNCj4+Pg0KPj4+IFRob3NlIG1hY3JvcyBzaG91bGQgbm90IGJlIGluIGFuIEludGVsIHNw
ZWNpZmljIGhlYWRlciwNCj4+PiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9odm0vZG9tYWluLmggaXMg
bGlrZWx5IGEgYmV0dGVyIHBsYWNlLg0KPj4NCj4+IEFjdHVhbGx5IGRvIHlvdSB0aGluayBodm0u
aCBjb3VsZCBiZSBiZXR0ZXI/DQo+IA0KPiBJIGd1ZXNzIHRoYXQncyBhbHNvIGZpbmUsIEkgZGlk
IHN1Z2dlc3QgaHZtL2RvbWFpbi5oIGJlY2F1c2UgdGhhdCdzDQo+IHdoZXJlIHRoZSBmaWVsZHMg
Z2V0IGRlY2xhcmVkLiBJIGd1ZXNzIHlvdSBwcmVmZXIgaHZtLmggYmVjYXVzZSB0aGVyZQ0KPiBh
cmUgb3RoZXIgSFZNIHJlbGF0ZWQgaGVscGVycyBpbiB0aGVyZT8NCg0KWWVhaCwgdGhhdCBpcyB3
aHkgLSB0c2Nfc2NhbGluZ19yYXRpbyBhbHNvIGdldHMgZGVmaW5lZCBpbiBkb21haW4uaCwgZm9y
IA0KZS5nLg0KVGhhbmsgeW91IGZvciBwb2ludGluZyB0aGlzIG91dCwNCg0KSmFuZS4=

