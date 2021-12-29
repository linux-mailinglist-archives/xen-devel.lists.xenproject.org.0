Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2E0481626
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 20:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252409.433458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2eIX-00074S-69; Wed, 29 Dec 2021 19:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252409.433458; Wed, 29 Dec 2021 19:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2eIX-00071l-2M; Wed, 29 Dec 2021 19:07:41 +0000
Received: by outflank-mailman (input) for mailman id 252409;
 Wed, 29 Dec 2021 19:07:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukf9=RO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n2eIU-00071f-TP
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 19:07:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 949c5a21-68da-11ec-bb0b-79c175774b5d;
 Wed, 29 Dec 2021 20:07:36 +0100 (CET)
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
X-Inumbo-ID: 949c5a21-68da-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640804856;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yRoUmgbE9i76UflSqHjlOZ3F8eXRUOMPrXGKWnJhans=;
  b=ayglD7sJOdLKU5TKss8QtFtYhWNbutufoHWbp8etXJV7EjeRKvOsKw7K
   tyasDCVnRhImXpgLGvmwQfNJdYRPby8TpkOgNnY3o6ckmMPseB9bHhdea
   wS4thlrFe4wW4eK8EMMeRv/ohsmUhXJTpZQdzSEvd6wa9M4ErzFAA4aUC
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TBHXD/b9039uUOhtaiwTirv3ANUsvMTKlAwLy7mvPAGtp8NCyU6XrkoTuuaj7aOM+1SKMXnSYb
 KRh5cLn9Cvogawm/+zITF7xoiyaZc3hy6Fq2lryexjw9KY5cvO7bOkYzA0DnS/up3ggreWLokC
 wxZmrcsQVlBB6k2LKC7uzED87D7KhHbAzoXrKlOLhVmRsIib0EhlZXfp7ZfQBnp3PunOj/S4GV
 +NF91LGutXYZGXNdX7eebHH1QRei75zgilUW0myCEmqd6DvkpMe9pC4mszCTrvUX0D1C5GM7Yt
 qWeRzPmrJY2gPmbVpwKfi7UD
X-SBRS: 5.1
X-MesageID: 61376760
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6QCsAai6y2IuNKPxKouf/Cu/X161vhcKZh0ujC45NGQN5FlHY01je
 htvUTqOMv/cY2Tyeohyb4ywoUMB65aEy9NrTQdp/ChjESwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rg29Qy0IDia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /10jpbpYANwYJHeo88ibiJ2FA5EHIR/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u35sRQ6mAP
 6L1bxJESQqZOz5rGmsRDZMUvMz1hHPGLQRh/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfnkyLhVYcfCLC/7NZ3m1CJ3SoIDwAMXla1puO2hwi4Vs43F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc+NrGbQT7FjT9rjvyDmkPUYDYQRgQeVz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5NuRECnCBtJ6sybp1qHHb4
 xDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0mex43Y51bIme1C
 KM2he+3zMUMVJdNRfUpC79d9uxwlfSwfTgbfq68giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLGkP3SMr9dMdQtiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSSvxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:uPoGt689DXI5DbgnT89uk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,246,1635220800"; 
   d="scan'208";a="61376760"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJEsy4xU2+WOcGWdDw8bslZf/3FHj+k4W0hHgVhxFrgTK4mbUV65YKSTXumig/Vm0PDbOuuydc4YpNuQ92RKsYbKbsgidQgQL3oD3D9/D0P6Y4CXkAowWf8fcS1vFEQ7LF2CWQ4u/jZDK3P+yqMstKqXrWzVT+ZgOQTcPYOvZbOWX8/VFSTmjn0PxwVIIos8uD2U1+GdRU6t8joMqxpPClf9U+SNWnujiCK1dXaiRblIradz8cWp1I7DRs6P0BXS9RELDrj6v3+vGqC/nJjmi5TQhRZ9FAvQaZktRDmkwg8mZqnHVuZaf0WpRIko2dE3XJMB+tTT998dS3zO0yOGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDU7ZzoZ6hYOOYTZ6gpERclMmLJEmk0wLkROgnBZK0A=;
 b=VemgG2Qr09fCFN2TJe3nuJnY5i9Lg6FMr5T0wpHg0j73wx4or8UWhsGZzFs8AcUNVTA6GtwwCEtXsJikHtukH5+vX4+rkm/Ey4+/2rqYclPDopUP5+uAq12OfhEtIEQRz0xpbSBWRxkrtiL+HSXmLR2+Gj3QBXMuDm2t2HClkow9c7CbNOR1yFBoPMVF0yFUMyA5vERaa+qIC6yQNVeKtTasuE5RVm7CMEQk+GvBHxnRRaP24M7XWWzQpVKhJes2J/2x7p+V+aDASxZWvCAvBC92MZpOLzCufLKzdUV2OJ8r6O3dDdW8Hn2N76CAC8JNxDXeg0whbkeonrN05htH6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDU7ZzoZ6hYOOYTZ6gpERclMmLJEmk0wLkROgnBZK0A=;
 b=fFps3fznJeKu0vh1ZLHcNb4qnkIvSqFHA0GW2JUEsPdOhX9a+5098ORDNiKJBH0GeJeSl7O3a/T8pO/QuXCLGa6z52TUGkfuq1Igf1J36fiWcV/PWotPTQH7exIKUfi4nyV+OcmNN8ZUMf7BrVXQegehtl/oGM/viz369wy1ZUs=
Date: Wed, 29 Dec 2021 20:07:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: G.R. <firemeteor@users.sourceforge.net>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <Ycyx65BDakqWmEe+@Air-de-Roger>
References: <YcInKtCNgA9v0k+c@Air-de-Roger>
 <CAKhsbWZMRMfrsWDcZLSS7q4ciR0UbyGE2sO-tN1dr+9juuEfsQ@mail.gmail.com>
 <YcWuCgYWestnlDSH@Air-de-Roger>
 <CAKhsbWZ4Xyy_7Xp4F3YWNsrBXdh4AkiQx4__7qUTd4AJiu-6bg@mail.gmail.com>
 <CAKhsbWarxwi_n3NAr81op_apyN69itUrv7f1k1ZJ6=gXuFXtGA@mail.gmail.com>
 <YcoOUw/u3SqTxWKm@Air-de-Roger>
 <CAKhsbWY5=vENgwgq3NV44KSZQgpOPY=33CMSZo=jweAcRDjBwg@mail.gmail.com>
 <YcwdJn/Y0yncuJ/e@Air-de-Roger>
 <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
 <Ycw4Jna5J2iQJyeM@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ycw4Jna5J2iQJyeM@Air-de-Roger>
X-ClientProxiedBy: MR2P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea76b6e3-3013-41cd-34bc-08d9cafe75c3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB405917F134BB8A22912157708F449@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:267;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7KkYZzlbh9/OdzmMFpkRjYrP1SKg7udzKVYwkox9gLxTg7PM8rkUqKhw40Lwq3TQI2Z9vxGElL1cn4ST+k3+Q1SN+Fw7fa5UTP7IA/Mnck5c6sHmYM5xVRvwY1/Esgmrm08z2ixuyaPzrYhw7d/6WxFNhht27in3/dr5WC8vJtJtaiNLOIRXR6YANIHeEHYamyn+atEQcYhCx8xmXdEcnzvzXHO5MZWr93y2RUmS1R8GKBBVysHP0IViq4WieNGFCPieR2E9+0XOQ2KJ2MFykv4Z1OOamvjZ2SHjb5e3apcGaym2Qnwol+ac89sF/wkLPpU0yYXixV3xOKRcHfbvRkVXBCzhof42gDXzZ2Z7qW1N64w2sdpTYqj/p6JO5EYgSQXiJ6/gyIi28OcpHWC+N4L5Zakis941vwU6Rr13UD5I4RbGbiIxP79tfa14RRQ9QES5WH0fpEZYrjESkf6KDpJZmBK6Y1CBKI2QLPZQjXKgCjloHnO0NkhyjHSWMacAEoYlAmU8qH7du3AjIIdT0MKzo040d2uDkEUUyBMQKLsVIK0dHwnfjdzd4GqbzhmWQaTOmxiECaitcJsNltrd1sP3zhyK9wMtD6XtRhUFBDZYJNg0oeGkbnM8VEgsg2ZHqxEoj3VEslPTgV3R+Slgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(86362001)(26005)(2906002)(6916009)(316002)(6486002)(6666004)(6506007)(38100700002)(83380400001)(5660300002)(4326008)(6512007)(9686003)(33716001)(66476007)(508600001)(66946007)(85182001)(8936002)(66556008)(186003)(8676002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJvWGhHQ1ZhbVRJS2pLMm0rbThvUGJBTHdjRjM4NTZEVitGbFhCNzJvbnpB?=
 =?utf-8?B?TXQya0FzVmlENUwvdnFhcXdNNmRuY2gxV3FzclE5eTVtMGdvaWFibmY2V1Nw?=
 =?utf-8?B?L3ZxYUg1RlpPVjFmUytXTHN6WDJOODBxZFBwYlU0UUloUVhMOXh4WFo0aisw?=
 =?utf-8?B?Y1hFaURSV3dacHVQMk5vTTNndjVMcHhRYlZGSEVtYmtNQ3dVM2JRYkpPZDZx?=
 =?utf-8?B?czBUT3JkbkdlTzMzMXBGeUxmc05LUjJXbkNtUXFyNU1tR1RVem82amRiaVdF?=
 =?utf-8?B?QTJ3TmtGakJqQnBDQkJ2NExzVjZBaU5QdTNzb21oT3Z5Nk5ZY0tlNGt1VGVV?=
 =?utf-8?B?aStZWUppL3RhV2RBUzRiREdCOTkvb0pqSXJBQ3JQRzFCcEFQZEpQb2VIMmpU?=
 =?utf-8?B?WHM4VFcrekFHT3ZDb3ZBYzI0SnZqblY2Tzk3RTRPdzg2ZkJzakl1OTkwSFdk?=
 =?utf-8?B?OG1TZXZYVXYvZUZ6aHVkQW11MmorNm16WTJYcG5od0VFdWpxL0dYTUNkdEg2?=
 =?utf-8?B?ZFVZRk1SY3FDNnNCL0x5NDd1bEhhcGxuSkNMOVNmay9CTmJtbkJadXZuc0tt?=
 =?utf-8?B?Z1c0Vm1WR3NUa2NYUXIya3AvOGlNckQ0clFOTFd6M2krTFVqaSt4NllwL0w1?=
 =?utf-8?B?TjM4cGFmTk5ndXZkZ3c4Q0xTK1pvR1VySlBmcGxwMFVBT3VrVE1nL0xVYVdZ?=
 =?utf-8?B?ODNFZFRHR2tmazVna2lSOE1hRjlBRVBjV3MvZG5VbW1JMFhiT002TGJiUDVq?=
 =?utf-8?B?Z1NJVGM0Y2VyODJqRWdwUG9PRGcwYzZpYjRONUdNWVV1ZDJEVkxseVduMSsv?=
 =?utf-8?B?eXB4MkJKU1M4clJmejZzaHBWRGRsMVZ5WFBuakxhL21odUJpcVVuM1VzWXRt?=
 =?utf-8?B?ODdrWHk1TGFFUGFVdGpyaFRqVXpHOUEvSTZEWERQTksvZHp0aFh4MnlZc3h1?=
 =?utf-8?B?bTNDNm9vSm56NXhQZ2JVM0d6cEdJUVFYY2lXVm5tUkVkOTVuZjFLOVpudWdq?=
 =?utf-8?B?OHR1eXBNOW54RmZuVGQ1U25YTmgrWTZxb2kvaUV5MDFyb3BsenNwMTdGdXVj?=
 =?utf-8?B?NDE1cDRrZUJ2TS9lUGRqT0dRbWdhU1ZZYnlMOGVTSy9abEd1UGovazVKYytX?=
 =?utf-8?B?T3RvK0hVT3FzdUl0ZThzZTBCdndkWDFtZmROTjRsQkZpVzMwR2RkVDhGM0RL?=
 =?utf-8?B?MjRUc0Z3QzliSjBuZS95K0krblNtaXR2RE10ZVpKTHZ1cDdkeW9TaE5qcDNr?=
 =?utf-8?B?a2twaEV3OGpCOEFDWXpWZFcvbnVFUVd1RXdWbERrWXdmbFpiMFNjUmZLcDB2?=
 =?utf-8?B?dm0weVVzdTZQV1ZUNFViSnpsaHNSTXpkTEJad1BPV0NUbFU2ZmRkMkN1MWZH?=
 =?utf-8?B?dlNIT0hMZ1R5ZzFDcWZwNVdDdThwbXRSRlQrRk16Mnp0NmdWdmFWMm5HL1Ir?=
 =?utf-8?B?N0tubGJGSzd1aSt0ZUU1UE5BR1M2SmFRZ01idnZjVmxlY1Y5clk5N3AyMjBk?=
 =?utf-8?B?R05jWkNYUnBxcHhVejgxbS92VHo2T2N0ZTVqMkxhNjQrY0Q2b1k1UnRsdHZK?=
 =?utf-8?B?djdObjhqYUtReVUzZmdQQVVvZjYzaDh4TnIxempUbDZERjU5Q0V4ZFpGajF3?=
 =?utf-8?B?SnBKTUVZYlg1NkZBb0RCb1pNQUtVZ2dLOW80VlhlOXg2d0pyTTd6SS9xYmpj?=
 =?utf-8?B?SE5kV090a28zK0t0bmVQMWxVSVBhTy9mcnE0ekdHdWZ0RzRucXU1NUdhanN3?=
 =?utf-8?B?UEpBVStjSkgwcWp5RHhYNkUyU2tWUlV3UVF3bHRDOE1YWkxlQ1g1RDNOcWkv?=
 =?utf-8?B?RTI1UzdrWHZNNUVKK1N2QUVqcStRNU1vQkVMbG8wZmRTS2lReHN6OUlVR3Z2?=
 =?utf-8?B?R2FmVGN6WUU2bEw3d21MVmQ3OGxGMkt3dXJ3V0ZEblp1ZCs4a01pRWJJekNj?=
 =?utf-8?B?dUFqcTZ6eVo4MzU1UjF3bVYwc3lDZWUzZThMd3kyLzRxT2MvVnlLcjlEN0Fs?=
 =?utf-8?B?c01kOHVWMk8xTnNnQjU0TE4vUGo4emt1QkN6NDFsTTR6MVBDR2szWFhpbWVo?=
 =?utf-8?B?V21TYkFVRVk2UXdPZzQzYkhzNk44SkRzRlRodkNoekQ0NWR0UHUrV3dzYkN0?=
 =?utf-8?B?UE5MUWE4R2VLNW4wLzZLN3BFUmNoVktBU0ZVZUtIRmpDcHVqb005WWUrQjRR?=
 =?utf-8?Q?Cm255qQFNby10fztQWXv6dg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea76b6e3-3013-41cd-34bc-08d9cafe75c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 19:07:29.8366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Znw0/ftl7W1SdefBVWaAmOnQh1s14Rg4F560OT6Is49Rrs7mg+0mElPJCgbbQToKGgVDO+bvQtRqLa5rEveN/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

On Wed, Dec 29, 2021 at 11:27:50AM +0100, Roger Pau Monné wrote:
> On Wed, Dec 29, 2021 at 05:13:00PM +0800, G.R. wrote:
> > >
> > > I think this is hitting a KASSERT, could you paste the text printed as
> > > part of the panic (not just he backtrace)?
> > >
> > > Sorry this is taking a bit of time to solve.
> > >
> > > Thanks!
> > >
> > Sorry that I didn't make it clear in the first place.
> > It is the same cross boundary assertion.
> 
> I see. After looking at the code it seems like sglist will coalesce
> contiguous physical ranges without taking page boundaries into
> account, which is not suitable for our purpose here. I guess I will
> either have to modify sglist, or switch to using bus_dma. The main
> problem with using bus_dma is that it will require bigger changes to
> netfront I think.

I have a crappy patch to use bus_dma. It's not yet ready for upstream
but you might want to give it a try to see if it solves the cross page
boundary issues.

Thanks, Roger.
---
diff --git a/sys/dev/xen/netfront/netfront.c b/sys/dev/xen/netfront/netfront.c
index 8dba5a8dc6d5..693ef25c8783 100644
--- a/sys/dev/xen/netfront/netfront.c
+++ b/sys/dev/xen/netfront/netfront.c
@@ -71,6 +71,8 @@ __FBSDID("$FreeBSD$");
 #include <xen/interface/io/netif.h>
 #include <xen/xenbus/xenbusvar.h>
 
+#include <machine/bus.h>
+
 #include "xenbus_if.h"
 
 /* Features supported by all backends.  TSO and LRO can be negotiated */
@@ -199,6 +201,12 @@ struct netfront_txq {
 	struct taskqueue 	*tq;
 	struct task       	defrtask;
 
+	bus_dmamap_t		dma_map;
+	struct mbuf_refcount {
+		struct m_tag 	tag;
+		u_int 		count;
+	}			refcount_tag[NET_TX_RING_SIZE + 1];
+
 	bool			full;
 };
 
@@ -221,6 +229,8 @@ struct netfront_info {
 
 	struct ifmedia		sc_media;
 
+	bus_dma_tag_t		dma_tag;
+
 	bool			xn_reset;
 };
 
@@ -301,6 +311,39 @@ xn_get_rx_ref(struct netfront_rxq *rxq, RING_IDX ri)
 	return (ref);
 }
 
+#define MTAG_COOKIE 1218492000
+#define MTAG_REFCOUNT 0
+
+static void mbuf_grab(struct mbuf *m)
+{
+	struct mbuf_refcount *ref;
+
+	ref = (struct mbuf_refcount *)m_tag_locate(m, MTAG_COOKIE,
+	    MTAG_REFCOUNT, NULL);
+	KASSERT(ref != NULL, ("Cannot find refcount"));
+	ref->count++;
+}
+
+static void mbuf_release(struct mbuf *m)
+{
+	struct mbuf_refcount *ref;
+
+	ref = (struct mbuf_refcount *)m_tag_locate(m, MTAG_COOKIE,
+	    MTAG_REFCOUNT, NULL);
+	KASSERT(ref != NULL, ("Cannot find refcount"));
+	KASSERT(ref->count > 0, ("Invalid reference count"));
+
+	if (--ref->count == 0)
+		m_freem(m);
+}
+
+static void tag_free(struct m_tag *t)
+{
+	struct mbuf_refcount *ref = (struct mbuf_refcount *)t;
+
+	KASSERT(ref->count == 0, ("Free mbuf tag with pending refcnt"));
+}
+
 #define IPRINTK(fmt, args...) \
     printf("[XEN] " fmt, ##args)
 #ifdef INVARIANTS
@@ -783,6 +826,7 @@ destroy_txq(struct netfront_txq *txq)
 	buf_ring_free(txq->br, M_DEVBUF);
 	taskqueue_drain_all(txq->tq);
 	taskqueue_free(txq->tq);
+	bus_dmamap_destroy(txq->info->dma_tag, txq->dma_map);
 }
 
 static void
@@ -826,6 +870,11 @@ setup_txqs(device_t dev, struct netfront_info *info,
 		for (i = 0; i <= NET_TX_RING_SIZE; i++) {
 			txq->mbufs[i] = (void *) ((u_long) i+1);
 			txq->grant_ref[i] = GRANT_REF_INVALID;
+			m_tag_setup(&txq->refcount_tag[i].tag,
+			    MTAG_COOKIE, MTAG_REFCOUNT,
+			    sizeof(txq->refcount_tag[i]) -
+			    sizeof(txq->refcount_tag[i].tag));
+			txq->refcount_tag[i].tag.m_tag_free = &tag_free;
 		}
 		txq->mbufs[NET_TX_RING_SIZE] = (void *)0;
 
@@ -874,10 +923,18 @@ setup_txqs(device_t dev, struct netfront_info *info,
 			device_printf(dev, "xen_intr_alloc_and_bind_local_port failed\n");
 			goto fail_bind_port;
 		}
+
+		error = bus_dmamap_create(info->dma_tag, 0, &txq->dma_map);
+		if (error != 0) {
+			device_printf(dev, "failed to create dma map\n");
+			goto fail_dma_map;
+		}
 	}
 
 	return (0);
 
+fail_dma_map:
+	xen_intr_unbind(&txq->xen_intr_handle);
 fail_bind_port:
 	taskqueue_drain_all(txq->tq);
 fail_start_thread:
@@ -1041,7 +1098,7 @@ xn_release_tx_bufs(struct netfront_txq *txq)
 		if (txq->mbufs_cnt < 0) {
 			panic("%s: tx_chain_cnt must be >= 0", __func__);
 		}
-		m_free(m);
+		mbuf_release(m);
 	}
 }
 
@@ -1311,7 +1368,7 @@ xn_txeof(struct netfront_txq *txq)
 			txq->mbufs[id] = NULL;
 			add_id_to_freelist(txq->mbufs, id);
 			txq->mbufs_cnt--;
-			m_free(m);
+			mbuf_release(m);
 			/* Only mark the txq active if we've freed up at least one slot to try */
 			ifp->if_drv_flags &= ~IFF_DRV_OACTIVE;
 		}
@@ -1530,27 +1587,18 @@ xn_count_frags(struct mbuf *m)
 static int
 xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 {
-	struct mbuf *m;
 	struct netfront_info *np = txq->info;
 	struct ifnet *ifp = np->xn_ifp;
-	u_int nfrags;
-	int otherend_id;
+	int otherend_id, error, nfrags;
+	unsigned int i;
+	bus_dma_segment_t segs[MAX_TX_REQ_FRAGS];
 
-	/**
-	 * Defragment the mbuf if necessary.
-	 */
-	nfrags = xn_count_frags(m_head);
+	error = bus_dmamap_load_mbuf_sg(np->dma_tag, txq->dma_map, m_head,
+	    segs, &nfrags, 0);
+	if (error == EFBIG || nfrags > np->maxfrags) {
+		struct mbuf *m;
 
-	/*
-	 * Check to see whether this request is longer than netback
-	 * can handle, and try to defrag it.
-	 */
-	/**
-	 * It is a bit lame, but the netback driver in Linux can't
-	 * deal with nfrags > MAX_TX_REQ_FRAGS, which is a quirk of
-	 * the Linux network stack.
-	 */
-	if (nfrags > np->maxfrags) {
+		bus_dmamap_unload(np->dma_tag, txq->dma_map);
 		m = m_defrag(m_head, M_NOWAIT);
 		if (!m) {
 			/*
@@ -1561,15 +1609,18 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 			return (EMSGSIZE);
 		}
 		m_head = m;
+		error = bus_dmamap_load_mbuf_sg(np->dma_tag, txq->dma_map,
+		    m_head, segs, &nfrags, 0);
+		if (error != 0 || nfrags > np->maxfrags) {
+			bus_dmamap_unload(np->dma_tag, txq->dma_map);
+			m_freem(m_head);
+			return (error ?: EFBIG);
+		}
+	} else if (error != 0) {
+		m_freem(m_head);
+		return (error);
 	}
 
-	/* Determine how many fragments now exist */
-	nfrags = xn_count_frags(m_head);
-
-	/*
-	 * Check to see whether the defragmented packet has too many
-	 * segments for the Linux netback driver.
-	 */
 	/**
 	 * The FreeBSD TCP stack, with TSO enabled, can produce a chain
 	 * of mbufs longer than Linux can handle.  Make sure we don't
@@ -1604,9 +1655,8 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 	 * the fragment pointers. Stop when we run out
 	 * of fragments or hit the end of the mbuf chain.
 	 */
-	m = m_head;
 	otherend_id = xenbus_get_otherend_id(np->xbdev);
-	for (m = m_head; m; m = m->m_next) {
+	for (i = 0; i < nfrags; i++) {
 		netif_tx_request_t *tx;
 		uintptr_t id;
 		grant_ref_t ref;
@@ -1621,17 +1671,22 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 		if (txq->mbufs_cnt > NET_TX_RING_SIZE)
 			panic("%s: tx_chain_cnt must be <= NET_TX_RING_SIZE\n",
 			    __func__);
-		txq->mbufs[id] = m;
+		if (i == 0)
+			m_tag_prepend(m_head, &txq->refcount_tag[id].tag);
+		mbuf_grab(m_head);
+		txq->mbufs[id] = m_head;
 		tx->id = id;
 		ref = gnttab_claim_grant_reference(&txq->gref_head);
 		KASSERT((short)ref >= 0, ("Negative ref"));
-		mfn = virt_to_mfn(mtod(m, vm_offset_t));
+		mfn = atop(segs[i].ds_addr);
 		gnttab_grant_foreign_access_ref(ref, otherend_id,
 		    mfn, GNTMAP_readonly);
 		tx->gref = txq->grant_ref[id] = ref;
-		tx->offset = mtod(m, vm_offset_t) & (PAGE_SIZE - 1);
+		tx->offset = segs[i].ds_addr & PAGE_MASK;
+		KASSERT(tx->offset + segs[i].ds_len <= PAGE_SIZE,
+		    ("mbuf segment crosses a page boundary"));
 		tx->flags = 0;
-		if (m == m_head) {
+		if (i == 0) {
 			/*
 			 * The first fragment has the entire packet
 			 * size, subsequent fragments have just the
@@ -1640,7 +1695,7 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 			 * subtracting the sizes of the other
 			 * fragments.
 			 */
-			tx->size = m->m_pkthdr.len;
+			tx->size = m_head->m_pkthdr.len;
 
 			/*
 			 * The first fragment contains the checksum flags
@@ -1654,12 +1709,12 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 			 * so we have to test for CSUM_TSO
 			 * explicitly.
 			 */
-			if (m->m_pkthdr.csum_flags
+			if (m_head->m_pkthdr.csum_flags
 			    & (CSUM_DELAY_DATA | CSUM_TSO)) {
 				tx->flags |= (NETTXF_csum_blank
 				    | NETTXF_data_validated);
 			}
-			if (m->m_pkthdr.csum_flags & CSUM_TSO) {
+			if (m_head->m_pkthdr.csum_flags & CSUM_TSO) {
 				struct netif_extra_info *gso =
 					(struct netif_extra_info *)
 					RING_GET_REQUEST(&txq->ring,
@@ -1667,7 +1722,7 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 
 				tx->flags |= NETTXF_extra_info;
 
-				gso->u.gso.size = m->m_pkthdr.tso_segsz;
+				gso->u.gso.size = m_head->m_pkthdr.tso_segsz;
 				gso->u.gso.type =
 					XEN_NETIF_GSO_TYPE_TCPV4;
 				gso->u.gso.pad = 0;
@@ -1677,13 +1732,14 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 				gso->flags = 0;
 			}
 		} else {
-			tx->size = m->m_len;
+			tx->size = segs[i].ds_len;
 		}
-		if (m->m_next)
+		if (i != nfrags - 1)
 			tx->flags |= NETTXF_more_data;
 
 		txq->ring.req_prod_pvt++;
 	}
+	bus_dmamap_unload(np->dma_tag, txq->dma_map);
 	BPF_MTAP(ifp, m_head);
 
 	if_inc_counter(ifp, IFCOUNTER_OPACKETS, 1);
@@ -2244,7 +2300,20 @@ create_netdev(device_t dev)
     	ether_ifattach(ifp, np->mac);
 	netfront_carrier_off(np);
 
-	return (0);
+	err = bus_dma_tag_create(
+	    bus_get_dma_tag(dev),		/* parent */
+	    1, PAGE_SIZE,			/* algnmnt, boundary */
+	    BUS_SPACE_MAXADDR,			/* lowaddr */
+	    BUS_SPACE_MAXADDR,			/* highaddr */
+	    NULL, NULL,				/* filter, filterarg */
+	    PAGE_SIZE * MAX_TX_REQ_FRAGS,	/* max request size */
+	    MAX_TX_REQ_FRAGS,			/* max segments */
+	    PAGE_SIZE,				/* maxsegsize */
+	    BUS_DMA_ALLOCNOW,			/* flags */
+	    NULL, NULL,				/* lockfunc, lockarg */
+	    &np->dma_tag);
+
+	return (err);
 
 error:
 	KASSERT(err != 0, ("Error path with no error code specified"));
@@ -2277,6 +2346,7 @@ netif_free(struct netfront_info *np)
 	if_free(np->xn_ifp);
 	np->xn_ifp = NULL;
 	ifmedia_removeall(&np->sc_media);
+	bus_dma_tag_destroy(np->dma_tag);
 }
 
 static void


