Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79FE53FACB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 12:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343081.568238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyW4M-00062G-P2; Tue, 07 Jun 2022 10:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343081.568238; Tue, 07 Jun 2022 10:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyW4M-0005yu-LO; Tue, 07 Jun 2022 10:04:14 +0000
Received: by outflank-mailman (input) for mailman id 343081;
 Tue, 07 Jun 2022 10:04:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXeP=WO=citrix.com=prvs=150b9cda6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nyW4L-0005UZ-Gj
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 10:04:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d3ce90d-e649-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 12:04:12 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2022 06:04:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5388.namprd03.prod.outlook.com (2603:10b6:806:b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 10:04:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 10:04:08 +0000
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
X-Inumbo-ID: 2d3ce90d-e649-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654596252;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=R9cTBjs/q4wVN5C/aVgkLZwsXfn2Agxuj5RywH0c0XI=;
  b=O7cq7zsuLW201dhxVO4TGIgakfJzhJdcV3IN7ynopDu5E9imFWnybdKR
   YZbg9KfSOBhJ7iXNvd92WwwCzdbFZR4qWQ3zrICXfLOHtvog5uq9ClWg5
   7Ew2ZVJuOEq7hTjQ0NdlxMfoWHFFKpNWnafuBZrAWUC2nDUOMKKmOdcnD
   U=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 73439325
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cMLKM6OmChRWKA3vrR3OlsFynXyQoLVcMsEvi/4bfWQNrUoq02NRz
 mtKWjuFPfuOYzDwLt13aI2x/EwAuZSHnIVjSQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZn2tEw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 MRxmq73ThgSEqzQteA5UAsIKTtXBPgTkFPHCSDXXc276WTjKiKp6NI3SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7H9aaHP+iCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2ID9AnE/vBqi4TV5BVB8JTcINzKQOTQfuZHnBq5j
 GTGoE2sV3n2M/Tak1Jp6EmEj+vCjWX9XIQUGruQ7uRtnFqVgGkeYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflhsVWt4VGOpj7giIk/PQ+1zAWTJCSSNdYts7ssNwXSYty
 lKCg9LuA3poraGRTnWesLyTqFteJBQoEIPLXgdcJSNt3jUpiN1bYs7nJjq7LJOIsw==
IronPort-HdrOrdr: A9a23:vNjL+KDSbo05/w7lHegOsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U4ssOlJo6HMBEDyewKmyXcT2/hcAV7CZnithILMFu1fBOTZslnd8kHFl9K1kJ
 0QCpSWa+eAQmSS7/yKhzVQeuxIqLbozEnrv5a5854Hd3AIV0gU1XYdNu/tKDwVeOApP/oEPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+zA+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRiuerRfb8yfT9GA+czzpAV74RH4FqewpF591H3Wxa0u
 UkZS1QefibpUmhJ11d6iGdoTUImAxelkMKj2Xoz0cL6PaJOw7TQaB69P5kWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5wOJSFcZ4JkuZkZkIP0jgX5q3P8i1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw7zvmWehTCYd3E8LAv27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.91,283,1647316800"; 
   d="scan'208";a="73439325"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DosVwEvLZoq2PZbQzYpmdYa+a4nMTA3t8e0Vn/8JrMcGhiAaVV67/hpGt0VMi1k/NnjNJglgweejHF0fARDmPzZk0CI/M46gZv2lcBIaDR8g9h4xnd8ciEaGdeG9Zju0Y4oydwSeO6nW3dyLbdUdDzaM4x8rAsFZsga04QAGC1Rozuu6xNiD/NtyqvxIpsU4aqaDTJ1R2/S0NMZcwgF4gbzlZGTZ487yvbJH+IgEqFRrEYSTYn0ACzqvgLW+DivHmK9BXttRmqlsaYNdd/QaGLVHUsICkAH6eywzwcC1jxl4sVaWBAgLyF/qOmdeBVdw+xf8vqu3qqwygMZzEfGinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9cTBjs/q4wVN5C/aVgkLZwsXfn2Agxuj5RywH0c0XI=;
 b=XC8+8VbDXGwj5i2+CoJXXzAyAeDZF6o/PGz8q0uGjQnK2fkvBVaR4KakApIxOIliHNjhJjRhCGiawxv3B97/W8OZMZ4BDWsPBl8NpRAAbR3Z3owYjO/TTYaEyXtL5fgs9Em4s8VqPmi1NAxazIKqsSWFelS/+yUafjPcUq9voaHhwMBo+IhX8Bivs9asVGUUlxW7WYwOxmg3yKpnizlgtQmMrEGnaQsRqJEft9CDLoN4hXOGrIQIo41C7/TqFYY/JN+1HsqBYb+DB0hyXmLVUtpqmJlDDc6pnFbNZr0c3n5IXKYr4M7MDxuAPil3I4KfS22An6cpdXWggpyR1Tftog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9cTBjs/q4wVN5C/aVgkLZwsXfn2Agxuj5RywH0c0XI=;
 b=tXGoosA4KkNS0nRDK3VHwK9e9mpPAhRDPblZgKVsk/h6PZGMKHx2oc+DLXLNco+YQd83fhCRcAZ/xV7puZc3vGrkHCFdURNV72k/chZc9GE8nGwIUzh7rCqmdNJz+5zWDGL2X9tqnZ/+yeJDjKxZ/1O8h6Ndc5/2XqtPvQTo1e4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: "alex.nlnnfn@proton.me" <alex.nlnnfn@proton.me>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: memory overcomittment with sr-iov device assighment
Thread-Topic: memory overcomittment with sr-iov device assighment
Thread-Index: AQHYeihemc0HW39+c0mUd/wlJkeuKK1Dt4iA
Date: Tue, 7 Jun 2022 10:04:07 +0000
Message-ID: <eb7a2869-d9f8-7a9f-3884-60d1a61e36f4@citrix.com>
References:
 <6f_bjKs323m5sDcqqvk3uosOLiugoCHlAvJ_tEMTl9d_05VqR-nOKtBBS4QWK29iKmorefG54vrbEgUM40Fl71BPZ0hwVyY3P0LjjJVjO-c=@proton.me>
In-Reply-To:
 <6f_bjKs323m5sDcqqvk3uosOLiugoCHlAvJ_tEMTl9d_05VqR-nOKtBBS4QWK29iKmorefG54vrbEgUM40Fl71BPZ0hwVyY3P0LjjJVjO-c=@proton.me>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5701c5e5-83de-4646-8efb-08da486d0fb8
x-ms-traffictypediagnostic: SA0PR03MB5388:EE_
x-microsoft-antispam-prvs:
 <SA0PR03MB5388FAF5DD7F57BB3D492776BAA59@SA0PR03MB5388.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Om+639qI63HDOvzJ/NGSataKhmouqCmGyOpzl81Xdus3DM3NASAYmA/Ct5nnbs4XsJQ6780DjejV+tY46oiopyZlMeYqOc6Us7TGGqeclwE8hC+hHDMx6ikdW7VMR5lQJTpYfH/9gyoowrIvIs7k2s5u47b95vhfXJbluxDjH2iOrBzKOmfpTt07xOatHC2l/RwxzWItDFuSArQg/jfHL/MP6ssVdF1MxGXtRv/W82mTlt7Ekb01Z0vyoXG5oDHxBbOcxxs6iV5HZDy4eXWjjI3SSY+ZtC3g1bAZXpfznZKYnwo+4ymYjyQiUvPaHgzKaXtEQFmmJyGJtT9Zl5MWQY9nX/tyGtkR+AWPajpesulEAtmPxGI4nRp/kcXyPSklH8nPtvmUMdiCaWgRwpwekoBZ+UW0DHiC8rPZmRzOoOAFeAvqKVVmukJG68Nxd2WM7Mg4FflBSHPIugUKniTUPsQRaCBpVcWSTiaJpEKhIbZrnDwyOn8QA/Cnn9+qqBttCkySm3dcuhVuMxwSbOi4nPVklFqKl3npsmc89A2iI3HEEOR7cWQF79WxM6dDs4vdPe7gqXQ8ZSkX9/ZRiBUkNqo7FdJZnMZbus5PDSjvEKyvpRXlz0AdUYwsRkaeM/RTvUm9wiKExIAjf0X8gM6UQ5ZjX2bdHSe18Fe7gqsXXxHpXKTX1dTVMdZNeoGiq0EdLzM15yXsuPM3ZRVIYTZaa8YAm0TKgYR7oVXnN3U7hdExbPY6xiWhsgkB+pYAnbbkVgGw4hxLf3/O5mf4F4ghdQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(55236004)(53546011)(110136005)(8936002)(31696002)(82960400001)(71200400001)(86362001)(316002)(36756003)(38070700005)(122000001)(6486002)(508600001)(186003)(6506007)(31686004)(2906002)(8676002)(66446008)(64756008)(66476007)(76116006)(91956017)(66556008)(66946007)(83380400001)(6512007)(26005)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlFZQzhLcGJkZzBSbDVkUWtOQUJndFpUN3BuYm1wNUhJa28wenNITFdyVzVY?=
 =?utf-8?B?bjB4d3pqMmJWbzlnUlJDWDB2TVJIa2lBL2pRYTJ2ZTFFLzd1SGpvYTZaTnE1?=
 =?utf-8?B?Qk8wa0ZpVzdIQ0lwSXAwYm12dHEzcjUxTnVKd1A1RVVrOGg0bXJzalUrY0xY?=
 =?utf-8?B?WklQM2JtRm9xL1VtckErdEIrQWRLZWdGSjRLSDZBY0VvdmhRL0xraHNTQlNL?=
 =?utf-8?B?bHVTbEg0V1h0TUlWVCtIVk1ZbjhBSTJqWXNIS2FBRUxCaVVHbkt0b2pUMjg0?=
 =?utf-8?B?REFWUitMYjFVekQxV0V0OVJrU21aK2ZYZWhManFYWDVjbjhBYTludVRXYlZS?=
 =?utf-8?B?SGpCUVBOODJoZzluOXVZVE5wODdTZ3c1U2FOdHhETlRYakMrZlpzTnRNSXJj?=
 =?utf-8?B?NlF5WWVlTG5jZU5BcUZvOFBpZzQxbFFpT0thMk5FekFuS1BrZGRraWpCUUZJ?=
 =?utf-8?B?YU9tVUViNGd1dDgwN1RWK3Z2QXEraEZlZ1lvWjhQTHdTb1BFVktqN0Z1Tmt1?=
 =?utf-8?B?NndvOHF2bzFaaW9XNEZlVlAyMjUwcERXUXNiR1RvQ2ZFS01UUE9FVUx2R2ZG?=
 =?utf-8?B?TStCbllWMUZ5TW5tR1FmakEwL3NZZWloZ2lWTmYrLzdlQUx0SVV2dEhqSnBG?=
 =?utf-8?B?SW1IWWh6dWtEYUx6NHhVWXNHNWgxY21FcGVGRURleHJwNXFKaFErRmtkQWVh?=
 =?utf-8?B?dHZZcUYxaVVydUpTQU1GTkpOY2UxalBFaEhpMUc4OXR3K1ZMcFd1aVg1YWdi?=
 =?utf-8?B?aUdESUNZa0FrN1pyM0tvSkI2Vjd4NE80emc5WGJFQy9zbVFXQjZjN3R5NFRF?=
 =?utf-8?B?aXFLRGR6dXlTblBFUUoxdXZZeGc2TUI2V3RmSVZXSjFIMCsva3FmMmp6RGFk?=
 =?utf-8?B?ZG9jaXhFU0NZVEsxT2RtNk1COG41emRER3RGY21QbTlPN3BTakc0U0djZ1Rw?=
 =?utf-8?B?TGlJclZHeHpRMXluZ1FtaXZzbXRMVmFDeThVVm9VZy9Udi8xeXpMVHVkVGhl?=
 =?utf-8?B?cTYvMlZWMFR0cURRNjJoUjZYbGxFWitjeTZpUGlycDMxT29MNTl2elNLNjZN?=
 =?utf-8?B?NEt0Y296MUNHT0VHeGdBYUZRT3h2cm54NVBjWnVCNzhOOWQvR1pCSkFUdk5H?=
 =?utf-8?B?bzBlYXQxRTNTNU9JUHlhTGxrN3FpWktaZmxsRUdGM3F2VE9EaFR1OVJ5ZGNB?=
 =?utf-8?B?cGsrMlNHNU56SGxHUTQvVGhvVWZGcGNqLzNJbGRTY3NrUnZBMUJXMU9jRHdK?=
 =?utf-8?B?OG5IR0grcE9Lc3JWTTQrOG14SVpPTEJWZkJmMXIwSlgwS2ltaFdMNHYva3BS?=
 =?utf-8?B?Y0dHUWYyQnJaM1RDN1JLNmNqVjdzVkgwa3RIbDllRm92eEhnd0NKOFVPWWg0?=
 =?utf-8?B?M25TRHdlL0FkYzRad0wxUlNhM0FQeE5MSGY0MjZLd3hjRWcxODg2OGxPTkNB?=
 =?utf-8?B?WXRwQVJvU0ZSUW43UGlkVElTUVEzU05Pb1dJZ0wwRURONjcrTkoxQnNTNjVZ?=
 =?utf-8?B?QzE0V1RJTis0N2pmWnN4bkhmU3BocnJrZUNBN2RVOGo5c3pWb2ZueWo3QUxv?=
 =?utf-8?B?R2NyMVZ1NEdSMDh1clZ1cldFekpna2p0VytLL09nMktyUjFrU1BGZDlxM0dL?=
 =?utf-8?B?WkhldTVIUUExNG1hSG1vRW1LTjRUM2Fady8rdnRPdGpMRWlaU2lONDNpaDFS?=
 =?utf-8?B?ZnFxWWZXUmE2YmZta1RUUWtCTTZqTGFicDJML2hmeDN1SUpQRXVGV0UvcDRJ?=
 =?utf-8?B?YWI4WVMxK0VoUytqYnB5cFIya1pHSkVZVGFlTUhRZ1RnSmZvNXhmN2doL3JO?=
 =?utf-8?B?RlU5dEZ6VXU2L3JWbHV3dzAyampyTm1nLzFha205N1lrYSt3S2lkQUdkb2wz?=
 =?utf-8?B?L2NXdktIZWNxTHJsWEpGSG1SOHJLa0VNdTdVNHBOQU1MY0pWVmRsQ0ZoZ2Zq?=
 =?utf-8?B?cy9ETnpZUGQ5OU1sd0s3MytqVU5FOWR6N2R2Y0crZmJhbDhUanNaSWdDTGJW?=
 =?utf-8?B?RnFVZXlxRGxEaGJNai90MkNXUUhheHY4SlRHakU3Ymt4K0lQbHd3QVVrYUZl?=
 =?utf-8?B?V2VSVSt3TlpRdE5nUWNOOCtFblUrUTZRRjNucUtMRlptWk5Ock9raC9iemgw?=
 =?utf-8?B?TEZTc0FPOGJkbnF2SE0xZzJFMS9EVzlXSzJMakNOS0YwQXdHcVpSNFRzNWc2?=
 =?utf-8?B?c05SMGpMaDRxdkRWTElUZi9EU0JPSDFSUGtxRzRmMkF2a2l0RUlSbS83R1dO?=
 =?utf-8?B?aDV1c2lPMHBlK2FZS0REemhWTS9BbWxDUnZiSFljcE9kYUkrZFRrVklXcU12?=
 =?utf-8?B?Y1YxeVNSSHRwcm5JdHpiTTh6MTdsdCtkMFE2MDZmdFo0TDB1dXlXQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B9C8D4E29A18945AF9F74A42496F2C8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5701c5e5-83de-4646-8efb-08da486d0fb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 10:04:07.8422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+MtOg56nHZPQz6BCzFs7KYQEYLEaxQtQQFu6seksJBbPEZOs5AE2pB0tbX8X5eYllIgBrI6QVttsjfV/LQZ/f/vHyb6zBSplbplgMGeS5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5388

T24gMDcvMDYvMjAyMiAwNDo1OSwgYWxleC5ubG5uZm5AcHJvdG9uLm1lIHdyb3RlOg0KPiBIZWxs
byBsaXN0LA0KPg0KPiBJIGxvb2tlZCBpbnRvIFhlbiBkb2N1bWVudGF0aW9uIGFuZCBhbHNvIFhl
biB3aWtpIGFuZCBJIGNvdWxkJ3QgZmluZCBhIGRlZmluaXRpdmUgYW5zd2VyIGlmIFhlbiBzdXBw
b3J0cyBtZW1vcnkgb3Zlci1jb21taXRtZW50IHdoZW4gVk1zIHVzZSBTUi1JT1YgZGV2aWNlIGFz
c2lnbm1lbnQgKHBhc3N0aHJvdWdoKS4gTWVtb3J5IG92ZXItY29tbWl0bWVudCBJIG1lYW4gZ2l2
aW5nIFZNcyBtb3JlIFJBTSB0aGFuIGlzIGF2YWlsYWJsZSBpbiB0aGUgaG9zdC4NCj4NCj4gSSBr
bm93IHRoYXQgRVNYIGRvZXNuJ3Qgc3VwcG9ydCBpdCwgYW5kIGFsc28gUUVNVS9LVk0gcGlucyBh
bGwgUkFNIHdoZW4gYSBkZXZpY2UgaXMgZGlyZWN0bHkgYXNzaWduZWQgdG8gYSBWTSAoVkZJT19J
T01NVV9NQVBfRE1BIGlvY3RsKS4gSSBoYXZlIHR3byBxdWVzdGlvbnM6DQo+DQo+IDEuIERvZXMg
WGVuIHN1cHBvcnRzIG1lbW9yeSBvdmVyIGNvbW1pdG1lbnQgd2hlbiBhbGwgVk1zIGFyZSB1c2lu
ZyBkaXJlY3QgZGV2aWNlIGFzc2lnbm1lbnQgZS5nLiwgU1ItSU9WPw0KDQpOby7CoCBNZW1vcnkg
b3ZlcmNvbW1pdCBpcyBmdW5kYW1lbnRhbGx5IGluY29tcGF0aWJsZSB3aXRoIGhhdmluZyByZWFs
DQpkZXZpY2VzLg0KDQpPbiB0aGUgQ1BVIHNpZGUsIEVQVF9WSU9MQVRJT04vRVBUX01JU0NPTkZJ
RyBhcmUgZmF1bHRzLCBqdXN0IGxpa2UgI1BGLA0Kc28gd2UgY2FuIHBsYXkgZ2FtZXMgd2l0aCBz
d2FwcGluZyBvdXQgc29tZSBvdGhlciBwYXJ0IG9mIHRoZSBndWVzdCBhbmQNCnBhZ2luZyBpbiB0
aGUgcGFydCB3aGljaCBpcyBjdXJyZW50bHkgYmVpbmcgYWNjZXNzZWQuDQoNCkJ1dCBJT01NVSB2
aW9sYXRpb25zIGFyZSBub3QgcmVzdGFydGFibGUuwqAgV2UgY2FuJ3QganVzdCB0YWtlIGFuIElP
TU1VDQpmYXVsdCwgYW5kIHNodWZmbGUgdGhlIGd1ZXN0cyBtZW1vcnksIGJlY2F1c2UgdGhlIFBD
SWUgcHJvdG9jb2wgaGFzDQp0aW1lb3V0cy7CoCBUaGVzZSBhcmVuJ3QgZ2VuZXJhbGx5IGxvbmcg
ZW5vdWdoIHRvIGV2ZW4gc2VuZCBhbiBpbnRlcnJ1cHQNCnRvIHJlcXVlc3Qgc29mdHdhcmUgaGVs
cCwgbGV0IGFsb25lIHBhZ2Ugb25lIHBhcnQgb3V0IGFuZCBhbm90aGVyIHBhcnQgaW4uDQoNCkZv
ciBhbiBJT01NVSBtYXBwaW5nIHRvIGV4aXN0cywgaXQgbXVzdCBwb2ludCBhdCByZWFsIFJBTSwg
YmVjYXVzZSBhbnkNCkRNQSB0YXJnZXR0aW5nIGl0IGNhbm5vdCBiZSBwYXVzZWQgYW5kIGRlbGF5
ZWQgZm9yIGxhdGVyLg0KDQp+QW5kcmV3DQo=

