Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5704C42FD
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 12:00:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279016.476524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNYKA-0004mW-B2; Fri, 25 Feb 2022 10:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279016.476524; Fri, 25 Feb 2022 10:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNYKA-0004jG-7p; Fri, 25 Feb 2022 10:59:46 +0000
Received: by outflank-mailman (input) for mailman id 279016;
 Fri, 25 Feb 2022 10:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZUh1=TI=citrix.com=prvs=04827bf5e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nNYK8-0004j8-7i
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 10:59:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07c99f80-962a-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 11:59:42 +0100 (CET)
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
X-Inumbo-ID: 07c99f80-962a-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645786781;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=giFSduqJwy6ndyW6qpqhP1uaYgu3qzCTMZTFL2CquC0=;
  b=NVuplAJlm8Nn57OhfP0CiA5kIJBvkvwKSLOZ98SCzVj0caRbhzLGVBeM
   0HMWU/CKvoQhcO5YqThBdz76LY267DbE1CNNccH+PQFBkKl3C0dqod0te
   j6PnhI0qyUM4bNzJS9fJYlM21wZwQCoJdA6AfiRwFLzLSFSTNFVTWAHx1
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67246922
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:a9SNCq+X+IrpkVwbtCOMDrUDaH6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 2AcC2uHOv3eamPzKtlyatvl/UhX7MTVydZnHAM5qC88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw24LkW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnazgFwckYo7pouZHa0FZLRxMEvdov7CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZVDNWQ+Nk6ojxtnBWw2E6IDmvyT22DmNBJVqUPLhq0X/D2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfFkDnnQosUGPu9/+RznVyI7mUJDVsdUl7Tice+jkmyStdOM
 Xs+8yAlrbUx3EGzR9y7VBq9yFaGoxodVtx4A+A8rgaXxcL85geSBmEACDlbetEinMYsQHoh0
 Vrht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHeTJob10yVCIw5Sejs04OzSWqYL
 y22QDYWt+VNjcNX9ICB/wr/2zOSm6rmFCBy6VCCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQM3R/EcGyKRF2lPlGy6yBV3Pw9XP8kNYlcFi
 2eD6FoKtPe/0JZHBJKbgr5d6ex2nMAM9vy/D5g4i+aihLArJWdrGwk0OCatM5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17Qmrghnmz+OGsyik0n/ieLGDJJwdVvjGAHfBgzexPnZyDg5D
 v4Fb5fao/mheLeWjtbrHX47cglRcClT6WHeoM1LbO+TSjeK60l6Y8I9NYgJItQ/94wMz7+g1
 ijkBidwlQqu7VWaeF7iQi0yN9vSsWNX8CtT0doEZg3zhRDOoO+Hsc8iSnfAVeJ/pbw7kKUtF
 KFtlgfpKq0ndwkrMg81NPHVhIdjaA6qlUSJOS+kayI4ZJluW0rC/dqMQ+cl3HNm4vaf3Sfmn
 4Cd6w==
IronPort-HdrOrdr: A9a23:EgWR1K1zkjSqm+2r1AbfkAqjBRxyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/hfAV7QZnibhILOFvAt0WKC+UytJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZi6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngcOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4kzEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXMISaCUmRQXee
 v30lMd1vdImjTsl6aO0F3QMjzboXMTArnZuAalaDXY0JTErXkBerV8bMpiA2XkAgwbzYtBOe
 twrhKkX9A8N2KwoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIfLH4sJlOy1GkcKp
 gnMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNxd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDhRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dvP22J6IJzYEUaICbQxFrEmpe4PdIi89vd/HmZw
 ==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="67246922"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyYWVygn9zrEnnHj670I+xMM078Mce7gbZaH/MN3GTppMKmBIKZBQi/S+KOOU5jycwAsEMSWgSDNQMwYEj8eIzWS4Qhj+l8AjFbt5ZFGjz8AfkVcAY/lCJfCZkTyF3IiA46jVBLwLBZr8pVZOJIMMf5v/Q5CoW/7YwbB+YoHR2iyVdQ+T6ejViKau7y3LJyJHWtrU2l56HVHnH5CQ0dBoqzb1V2Dj/pxqM7sh+Ama1gMLTd+Rc8UkNy07r+z1CBMuFwKqr+yc1Zt44gz9PV3kf35WZCkrP8jIF1osuqcmlaQ72zWBn0Bil66zh736inCml5+8c6ZWGFtlDREB3yFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giFSduqJwy6ndyW6qpqhP1uaYgu3qzCTMZTFL2CquC0=;
 b=aLGCoyIcaS9BB2qehNxr5z4pA8qM+8lTc/pz6z8VJ9KP12WU77x3VDqww5dkLeJ/OxHRshJgL8R73QdmkxRAW47oOIUL6R3a3474SjkbuidCZIs9EdahYGmuC6BmoyRMvgIAr/SODPYAdsy/FxJCbpePwLSO03tm5SmKCs61EbTvlJGjIT6I1YLEQ0VQZrGfMBK22psxbXltzVGYxMqbTYEgaZi74oR0vDIukqX73sJZLxclDo0HLOOikwWlw+0FR6mSRG9gVZlu+hIjK/waAlLGNnAPVCc5rOsHWxU5nr0lJFpildxpM1JRwMk6mjXDOM82t8QRWGCY8j7TY4ymEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giFSduqJwy6ndyW6qpqhP1uaYgu3qzCTMZTFL2CquC0=;
 b=vXyY8uvaLKJRBWQJJ0N+ZRzS9RMiWK5x0eKAJgZkuY+CDNOQ1VepB7VbF2mKaCdvH6IF7zeYc5TGF+JqyigwAyOIbiod+WOVNByiWcFzyX/TiPiCeaIFBGSuGozN47rsLvEYjI1IxFplmapU0akjR7zL25qN9hl3tcFy9oUca/E=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Avoid integer overflow using
 MIDR_IMPLEMENTOR_MASK
Thread-Topic: [PATCH] xen/arm: Avoid integer overflow using
 MIDR_IMPLEMENTOR_MASK
Thread-Index: AQHYKiNA8xx4cBmUbUiQd1elipGwDaykF/IAgAABUgA=
Date: Fri, 25 Feb 2022 10:59:35 +0000
Message-ID: <42974ed3-9075-a679-188e-1771f5e604b3@citrix.com>
References: <20220225083854.6371-1-michal.orzel@arm.com>
 <dc161f7e-63c8-0e14-0c1f-51b1318aab2a@xen.org>
In-Reply-To: <dc161f7e-63c8-0e14-0c1f-51b1318aab2a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce9b622c-8e64-4c4c-4f97-08d9f84de8eb
x-ms-traffictypediagnostic: BN6PR03MB2481:EE_
x-microsoft-antispam-prvs: <BN6PR03MB24819F7A7FE591AEDDA32FBFBA3E9@BN6PR03MB2481.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c/QiUSaRYKwArRggnyLPsDZWvqtbeAhV4CB/dY1mNOivwNcXslMouPVaF85SNgk9hyyAFeDDwbrmgfApMUhBob7W4hj8sMPSunuH7IcTmb7UM68HnjFxgcviAmAfew/YkN/dV3JbRCYgtPH39Gz5Qc/4vtkO4jTIhXq6J7hPN71ZCWo9XJzOUL751z8F+jcDdNhita07VqTnc2WYBPzr63jjd8MbFuCNq4uPueiTaWTuxh9yliYLxCmKczCZmZ6xlGApej9iMmk66CjIoHcWAlKTFFdPFH5RBoI0JftdVm7Q62MthMIpQL3atrzKpzyEwSBArHdEZdNT4zhbMmPiK870I8VlpbPnwkYUinApIvxekWTuH+eKfFO/vbTR+oL2jOLq/Oo4EnkINXySWb3w+9w8elLQTG01ZnTkLhmQ8bgsXufAgF8zu+O6Ks5EbzGIHsElIEN3DcbY6ho2hLCbJjTTXuM74mf76lWURmdKAujaFu9lDA50KvvKEH+VUAvu+ZfgSFBHOf1crFVuCO/1cDX/XsQB2bkd27pGBykTroPD4k1kCP5yTkTvrt8OLPMLoa0+07qiqMxzMgg9oSi5xRs2twPSJEW5KG+5DlwsuXs2l8npgnUzYmLpptF2JatI0nh/nKVjMOxyySA/OMZIkqg/3k49+G0sFGPy4fNs2SdQfdLaYicBeDSaBnW5NV/mkx3VpT3iyJOmNeJe2REph8Cedtvx2iZovT3m2N4k7uJSJb9THTIuBFzYZ6ICHOqc2kX4ONPjACYtqXcsLTPsrA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(508600001)(36756003)(5660300002)(82960400001)(122000001)(38100700002)(86362001)(316002)(8936002)(4744005)(2616005)(64756008)(66556008)(66476007)(66946007)(8676002)(4326008)(66446008)(83380400001)(6512007)(6506007)(2906002)(186003)(53546011)(31696002)(110136005)(26005)(38070700005)(91956017)(71200400001)(54906003)(76116006)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekljU3QxTmhsQWZTYkk3MHdxY25qQWoyOGlzeHc3ZW5rSjVndktrajBEcHpN?=
 =?utf-8?B?dTVUSHVYYUFMeVMwb1hhM3FpdThNYmpoKzhvNkp4Q3Q5T1k4M3V3QkNLUUE3?=
 =?utf-8?B?MEdaSEhkMWw2NFk4a2VaOUxTV3RhNXFjcmVhSHdQZXg0VnFUcjNweU5MRlZy?=
 =?utf-8?B?Z3VKZmhqd2ppaG9GWVozQXZ1elhsT1BENzJQYVJtYXpZQTRwR3JvT3lRQ1Ey?=
 =?utf-8?B?SmZGRkQvbmYyZkVVRWtadnFzazFwTlNSb3U1S0c4cCtuM3FkUXZvcU1MLzR1?=
 =?utf-8?B?QWJNZ3kwazZuWnZ5TU8ybmN0WWtod0llb01SaENZU3pRUjFsdXdwSTFCUk4r?=
 =?utf-8?B?Y2ExMjY1L2syOVZhb2gxZ2pKOUkrWVdveHY5MnJsaHZCY2QvZDgrdFVhQ2ti?=
 =?utf-8?B?YmtvZUlwSGdIWE9QSnlhRFJYL3JvV0pnVWd1dTc0Y080WTVZZk5uRFpMN0Ny?=
 =?utf-8?B?NkZsUE1HY0pJeTFuTnJtZUlHMi85eXRZcEY1dXQvZHgxSEdpTVRTc3VvUVlT?=
 =?utf-8?B?Sjd4OEVOdmFkWENTUEVwMVZxb3JrTUxnSWlkZVRNem9ZZmFOMi83OHRTbFVy?=
 =?utf-8?B?NVJpUjJVNE5EVEZRbmczeFQ5R2hoYzRMY2FsWFhoclErakhoczRXYWtPYngz?=
 =?utf-8?B?OWJUaFNicUxuVmRhSmVtdjRsQkpOMkk5YzVCMHpia1dMQVoybEtRSzNIL29N?=
 =?utf-8?B?K1RzeENKYkJzOTVuVGRVdXhsSnpQcDhlYnhRNFdlN2FiTWVYdDRLS29lamV2?=
 =?utf-8?B?djBJV01BZWFoalorSlFGd29naDVWZVFKWE0ycWVZYjZzN3UzS0hHc1ZacG0r?=
 =?utf-8?B?dG1WYVQveW15RGNNc0JoUnQ1OUJqNlBydjUxQ25EbFBqOFlvZ1FtK2g5bysv?=
 =?utf-8?B?QXYrN1VpUDAxZzgwKzUyK3ZLU3poVVVLTngvQXNpTzhZbDNtZkN4R3g4dnFS?=
 =?utf-8?B?bVZmUmFPeHVOZ3ZqT2R5Tm5EbUYwRjFvejNmUm8zYldnNEVRd1dQUmRGZkFY?=
 =?utf-8?B?R0I3cDRiODladG43Qi9WSGxJdTI2ODFHL0IwQ1AxbU1TcktyT1dCdThHb1Jv?=
 =?utf-8?B?d3FKL1ZXSkljOC9Hd2lkd3ZkK2k4TTNmeTkzbEd2VnFMcnBKMHNGamFiQmNo?=
 =?utf-8?B?UDBqMFUrd0crY1Uva0swWXl0SDRpUzQ4SzcrcFR0SlA3cXdzZjhJS0tmSDZx?=
 =?utf-8?B?d2srYWpwUUV1SFhuMkR5c0hHQnJyQWtreTN5MWRMRHpUN3Q3eGU2OHFyditt?=
 =?utf-8?B?OEFkOExBdEgwQVZXak9ORUh0NmVXVUdMTkpnbHQyN2tRR3YrYnZrTUxSV2NS?=
 =?utf-8?B?Rk1ONVNtRGhxUURVZEtqaUZvNU1lVjBsS0RTcU94VzZPYXVIWXc0Qzg5ZVlO?=
 =?utf-8?B?aFZSVGZQcFdneGVsTU5mcmFIY2RIeW5SakJSbGdCRXg5UElzQ0E2a1FSLzJ2?=
 =?utf-8?B?Tzl1U25SZTVtNCtsaUFyMXpLa2cySnVsSFV4UlNnanZTOHVWNTZOMDhVRjQy?=
 =?utf-8?B?SkdyMXNWZEw2RjZ3emtNb3R1R25UektsZ0dyUmFmWUdwTW0wTG54T3ZRVENH?=
 =?utf-8?B?S1hsb3VaM1VLY1hiaTErUW1zZUlkL0V5d1hhbTVDVlJ2RWtUMGFOL3RPaTkw?=
 =?utf-8?B?c3lJQWJIOHc3NXhCRkZQbkN5NTQrK00reS9NaldZYUR1OTNRakVtRmYxVFh1?=
 =?utf-8?B?aWs1UFJLcnp6bUFkaU9Kd3huVDhyVjkrbXdXbklmS0tCZ3I3RjlTOFZDTUVK?=
 =?utf-8?B?S3o3VXhqbzdOVm9BNzdpWUczaU14M2Z3bngvNmJ2eDM3ZzNLWG00VWZORG1t?=
 =?utf-8?B?K01ROE9oVkNLbEpraGhYMS84YkpxeVBRRlNjZFVSaEloUTB1MnJXUVRESUVa?=
 =?utf-8?B?TmYxV2FsYjltTTBmbWswZllEdFYwQXhCLzlVeWZ4Q3ZSZVBCMVMwUi9acVY1?=
 =?utf-8?B?TXNVSG5MQ0JFYlczdWUwN0o2Rm9PVXIydDVVbm51VnJQR1VZYjU3Wlg2Kzk3?=
 =?utf-8?B?c2hGVEFHbVNuZS9sWHNFREFLSWlSRzFKWXFUNHJhTEpxeVZwY2NiTVovU3pn?=
 =?utf-8?B?REp6RFl5R2ZGMzJxcXd2dFRQN244a2M3MzRrcW9yS3R5UzlVRC9WU2ZGenZn?=
 =?utf-8?B?VUt1R2lldm5JOURwTWNuQmVjSFFaYlY1YTJJZlZCUDQ3ejJYTWE0cEZLcXY4?=
 =?utf-8?B?TkRTbGFJOTFaSkFXZTkzWGY2R0QxTjcwNDJQSDZKY0R5K2NEaHNwNHVBdVBx?=
 =?utf-8?B?NmFzb05na0gyTUNYSitXZXg3dWVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BA0FE94D7D1B645A967C8EAADE82670@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9b622c-8e64-4c4c-4f97-08d9f84de8eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 10:59:35.2604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0MOYihKhnAbZQXhNIATQwVygA/T++KEk8wbW3BHJFjwgOmOdUvamSIkzVlFbVZaW6nJyjCDyD+Ve3mpqVRe1l+wbDHODUlhKmkfg6klu7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2481
X-OriginatorOrg: citrix.com

T24gMjUvMDIvMjAyMiAxMDo1NCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBNaWNoYWwsDQo+
DQo+IE9uIDI1LzAyLzIwMjIgMDg6MzgsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4+IFZhbHVlIG9m
IG1hY3JvIE1JRFJfSU1QTEVNRU5UT1JfTUFTSyBleGNlZWRzIHRoZSByYW5nZSBvZiBpbnRlZ2Vy
DQo+PiBhbmQgY2FuIGxlYWQgdG8gb3ZlcmZsb3cuIEN1cnJlbnRseSB0aGVyZSBpcyBubyBpc3N1
ZSBhcyBpdCBpcyB1c2VkDQo+PiBpbiBhbiBleHByZXNzaW9uIGltcGxpY2l0bHkgY2FzdGVkIHRv
IHUzMiBpbiBNSURSX0lTX0NQVV9NT0RFTF9SQU5HRS4NCj4+IFRvIGF2b2lkIHBvc3NpYmxlIHBy
b2JsZW1zLCBmaXggdGhlIG1hY3JvLg0KPg0KPiBDb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcsIGl0
IHNvdW5kcyBsaWtlIHRoaXMgaXMgb25seSBmb3IgaGFyZGVuaW5nDQo+IHB1cnBvc2UgYXQgdGhl
IG1vbWVudC4NCj4NCj4gQXMgdGhpcyBjb2RlIGlzIGNvbWluZyBmcm9tIExpbnV4LCBJIHdvdWxk
IHByZWZlciBpZiB3ZSBmaXJzdCB1cHN0cmVhbQ0KPiB0byBMaW51eCBhbmQgdGhlbiBwb3J0IHRv
IFhlbiBvbmNlIG1lcmdlZC4NCg0KV2VsbC7CoCBUaGUgZXhwcmVzc2lvbiBpcyB1bmRlZmluZWQg
YmVoYXZpb3VyIGluIEMsIGJlY2F1c2Ugb2Ygc2hpZnRpbmcNCmludG8gdGhlIHNpZ24gYml0Lg0K
DQpJbiBwcmluY2lwbGUsIHRoZSBjb21waWxlciBpcyBmcmVlIHRvIG9wdGltaXNlIGlzX2FmZmVj
dGVkX21pZHJfcmFuZ2UoKQ0KdG8gInJldHVybiB0cnVlIiBhcyBhIGNvbnNlcXVlbmNlLCBldmVu
IGlmIGNvbXBpbGVycyB0ZW5kIG5vdCB0byBiZSB0aGF0DQptYWxpY2lvdXMuDQoNCn5BbmRyZXcN
Cg==

