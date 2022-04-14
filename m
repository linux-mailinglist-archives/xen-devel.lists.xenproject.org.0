Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BA9500E0B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 14:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304712.519409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neyv4-00033M-BP; Thu, 14 Apr 2022 12:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304712.519409; Thu, 14 Apr 2022 12:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neyv4-0002zv-6e; Thu, 14 Apr 2022 12:49:54 +0000
Received: by outflank-mailman (input) for mailman id 304712;
 Thu, 14 Apr 2022 12:49:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNZz=UY=citrix.com=prvs=096427a9b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1neyv2-0002zo-1p
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 12:49:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d7abc09-bbf1-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 14:49:48 +0200 (CEST)
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
X-Inumbo-ID: 5d7abc09-bbf1-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649940588;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=goVjhoezmMM/lzaEE1nqYIA3qkDPeua07aTbsfAYscM=;
  b=XB0BXLIZDsMWPwzhJHGpEgcQEuDMu99eXRX3XbGYATORiGA1iBkRDPn+
   wrGSOzUkEtJZ2Tj6H6fMD0vPtvTKFdFXYA/TN++VypmkL515wcXiXDkDP
   hBdRTt8DOMzVdiyRqlkoiBJk/G+9ertMMX6smG2qfhJpwJ5sALtY5YB0T
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68972264
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GC9rnqM/Y6zpTvvvrR23l8FynXyQoLVcMsEvi/4bfWQNrUoi1jYCz
 2cYXW7VafbcYjP8fY9wOYni/E0Cu8LRnNNhSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl29Iw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 cQVp7CcUgsTLqziw9ofAhAIAiNEMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQTaeBP
 ZBHNVKDajzqOxJMFno5K6l9v/+L3nPhbR19uVWa8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc4dBS/8WxBqB8LrVzV2nBDkNHi9DUtNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbv1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb7
 RDofODEsogz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0vdB0xa5hYImS0C
 KM2he+3zMUCVJdNRfUpC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLSnPHKGoNJJcAhiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSevxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:kuMamKH+OBAZVnNVpLqFRpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVp2RvnhNFICPoqTMuftW7dySWVxeBZnMffKljbdREWmdQtrJ
 uIH5IOa+EYSGIK9/oSgzPIUurIouP3iJxA7N22pxwGLGFXguNbnnxE426gYxZLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxs4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1SsV
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGIFq/QpF4t1H2mxa1O
 UkkC1QePibLEmhOF1dlCGdnjUIFgxeskMKh2Xo2UcL6vaJOw7SQ/Ax+76xNCGpsXbI9esMoJ
 6ilQiixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MciFW5uYd499RjBmcga+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zo93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkf8IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehTKYd0s8LAo23FUgMyPeFOwC1zxdLkHqbrUn8ki
X-IronPort-AV: E=Sophos;i="5.90,259,1643691600"; 
   d="scan'208";a="68972264"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+r02wADecD2uPDd7TmH3GpLYbqcGfCD3kBwwVrV4blDgTV4A/8djAdJTiAQZbPlDgznAzToT6vYx5PgZb0/rtWzm0dCABkjvR7JPYfsgAW9V0t6Ux+sv1ZtR60y6DbrNHnbXwhA82eiFjMud3Ev6uEEkYOtXdYxXr0AaRuBZCuJvMWKII/DiA+zfCUUXR0rjDoXyI0lYveg1eJ2g1wk90anRSBW/GWzUIGExrN1kpLNqNhKokcL2eo7z0InB2++/j3ebtJedsP41rG1MEvBtdHjMpQyFh+AUuGpNtLtwcvRXH7KvRi2mOzBGpmpLiVh6U9DJpBPmNBjtTEOZdrj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goVjhoezmMM/lzaEE1nqYIA3qkDPeua07aTbsfAYscM=;
 b=by5p1NFIV9c03UEzX07C6tQId2CG8irp20b4pOFXewBfIxAYBBvwb1pi4TblqPcFnewQAOC9mDAkBUVCJtDyvQK4SPYUu1xmcwifuzE2GZJZw1QdUFLoeyni8tqaBjDaAEt30oZaWpo4WwSZN5gCkNh3aU9bLLNitU8Z8qZx9nD/ttRSl6NsS610uZue4ATWh5Vmt4r3o14Ji+GmXs/Ry92qj38eqTkqgeEkflZp0aZHBUlBJK3mJqkJIu72uZRqbQOV2evUBLrL1/y3dP+kVRZDD7J4paDBQpSOIeJGSBw+z06QO4qzGMfuj8WBc7Bad8LokC8n+TKWCANZHyGLuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goVjhoezmMM/lzaEE1nqYIA3qkDPeua07aTbsfAYscM=;
 b=PlccM82GJpune9d9GJdRZVmDL2feWt+9hFb16K9wesjBawiIp4mX5gmeg/DItL+7OFcDg5e6LtbD/zlm4L1dZcqsRJA8OR/WUOucilpumAxcb3kAmHe+6rk8QaKjLZ4nphgWHSPkcuSXq+5NLeiQA/bFTlvzWLsYQUohRoCgrHY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] x86: annotate entry points with type and size
Thread-Topic: [PATCH 2/2] x86: annotate entry points with type and size
Thread-Index: AQHYTlgbnWM+kMHK9kCx34LnXQv6tqzvX4gA
Date: Thu, 14 Apr 2022 12:49:43 +0000
Message-ID: <22df182a-762d-711e-5191-d4b628904085@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <531ab7f7-ce5a-12b2-e7e7-528c26f9ff7f@suse.com>
In-Reply-To: <531ab7f7-ce5a-12b2-e7e7-528c26f9ff7f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ed15123-3dad-4fe7-8a19-08da1e153f58
x-ms-traffictypediagnostic: BYAPR03MB3766:EE_
x-microsoft-antispam-prvs: <BYAPR03MB37662527C974A7DB313E3225BAEF9@BYAPR03MB3766.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QAauubV2qo9BWr+EhAZ6zq6ImY/IdgGJBQut7QO1fyk6e/J8rvAL75fUSLhDnZD7uoWGHa+Ai0+cgpHE0G1FyKiM3iB0Lr14T446ix0ta1PLtq57FMcEqO4xx4rSjRfPWhD/eQzhkXNAMd4D9UJbthCf0/6o5f4zL3bM0aTI64qZIjN9VJeePPFYCEH5uNVgvRcrb1PVHKPPR9+Q6tIHtCYFbuGF/gRcmOZtOh4HZU9+a8icv0XaH19gudC4s4EF2c5XZPl8iTYiSZOU/ol8eOK5xTW3h5Q6wj98dnyXlG7MrwlV5rVrOBZu+6lYRtHuyyEOaLFUXctioGbSl39EphWFBKfFAS/sneXM8lY4A6ekwM2bT4o/flTFMjkHrszZAveKcP60pAGDYOQ50kFFPVxoP2RaRgg+H/uR5+1ZzpYEY6d8A6JwFrpOJCpSQiT2CcPnYAm2lXmp/BJHvORM1OO5Op6E8QtksEhGUXYUR+XIvlB+ox2mYlirXTLhSWZzQmAWcnyl0waqOE0jl7SFHDflFMrhzaVVNgFgC3Nt5+F5/ThSG3Pxt9fJpAsMxf5aFRxcLOeJL1vQXAMIbZw/U28llC2HjFB87te/Aqfdu/wiTsNYCRvTM59rVy1W4Id5szdhJq79Jf8GuEAQWoZ4VzqwPUqNNjB0ySfrQ+5tMTOZuIYah2iIIcU38ReRMBSi/3uE/R7PQw5EKqfW1Ib7FQzSs6fLC3GjMv5s+YGlWnKVHUZGSk5xwumumpHxD0tCpFjUjm0rD4Jar5Fm/Cq8+pnZieqDDadpgfrkFYz035SVx0IKMOmVtN9xkYDlhc2484H5up7jMxQKfYf5dFN8ngkn1057m31JZyWWQWPoY2c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(8936002)(38070700005)(66556008)(4326008)(6486002)(66446008)(64756008)(8676002)(66476007)(4744005)(316002)(82960400001)(38100700002)(110136005)(53546011)(6512007)(54906003)(2906002)(186003)(26005)(6506007)(122000001)(5660300002)(508600001)(2616005)(107886003)(71200400001)(76116006)(91956017)(66946007)(86362001)(31686004)(36756003)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFdzOG82am5lRU56SkUrNlNJM1JhQkcxRFJLajJwYmRFV3c5OUVKek5CWWRx?=
 =?utf-8?B?ZS9GVmdYdUpNajJzWkJGSC9iZ25wWk1RNGd6aTNYNEtXb20xRWx0QkkwZnRO?=
 =?utf-8?B?ZCtOWUk2Ym5PT3NDa1N1VGQvQTJJRWxWc2tzSTN6eEE1VUJFWGRaYXZGZ2Nt?=
 =?utf-8?B?VytlQ1RaZFJ2b0Y5TVJlY1grbFMzMVdqdllhVzgxUHJKaDdkNUVIajFmVysw?=
 =?utf-8?B?dEhiWEpna2Y0VlhZaGlUV3VnYjlLWDZ5cFFFV2lwUzU0clJTOFp5T1VZQ1pC?=
 =?utf-8?B?eUFmaUxLelYremtuZ3BUWSs3SXdyTzdZNzNDZ2lYMlN2bU9zRndwZ3k0MFVT?=
 =?utf-8?B?cGZOc3l2OUdkODg4Um9yOEhJTWplSVFqTU8xWXM0ellTNzRwOGdINDhBeER2?=
 =?utf-8?B?VDlacU82azBRTmg3a3NmZDdSSVRzY1MvRGxLMjZ3cTQrUTF0dlp6WmxuVU0v?=
 =?utf-8?B?cVpDS1Y4eVBPWGZkRk9nbUZ0cjNMc2pIQU91NUtqWU5YUElJY3FsYVF1YjdU?=
 =?utf-8?B?RSttcGdKNS9oZG5RK2hzMXBTOCthZnpQT1k0UzI4UjRpMjF5bFZaUW5WYXVN?=
 =?utf-8?B?MzJ6UEhnSGd0U3ZTbzJrd1JEemszLyt2Z2VtK2VZemN1eGRwMTJudlFsS3J4?=
 =?utf-8?B?SEVxRzJOdWlqTGVIeDdUcThLZjJWZDdEL1ZyZTc4US9Pa2t2NFI2Qi9kRHNV?=
 =?utf-8?B?U1NwQ21ZSS9DaDJGRWljY2lPYWxXdlZ4bjNZZXhKTHpkMDFocGN4NjdyR1pI?=
 =?utf-8?B?T1VobzdTaHdQTnUwbVNTOVJnY1cyaFZTNnUyOTRwMEs4d2tUV05XRGJha3FO?=
 =?utf-8?B?N1BxK2VaUXdwczVkRTYydjNMUU5yazR5YU5hWGQ2aW1nZWpkVTVXUEV0MHJO?=
 =?utf-8?B?U0FNREhOT1lGWWV0U3lTWllvZkVBenJJeHJRYk1yYmpMckczSWdxbElkcEty?=
 =?utf-8?B?N1h4QVVURHdyMGhHcVpWZytoOWo5WTRZNjUwQVFqKzc3M0tFb25zV0R0RWJ3?=
 =?utf-8?B?VXdUeFY0a3pocm9tMXNDWDlYaEdURVF0MWpLNjZKcFJxVkNYTFZkZW1GSVUw?=
 =?utf-8?B?R3V4TnV6aWxzN05HelRSR3dZanRNRnlwd2NKbXFNcU5WalVsVkNtY28rbUZ6?=
 =?utf-8?B?Zm1wWmJIcVNra1BSVFY2YzFCZ1NtZ214LzBBQXpYT1RUSitPWDNmVnhiK3ox?=
 =?utf-8?B?NzQxcnJQa0VGTDlaOE03eGhqSFNHQnNBcjZzenFuOXI1aTAxMU0xY004d0JH?=
 =?utf-8?B?Y3l6ZEVNK1JSWi9NUFRZNlgvS0hQWXZHUmRqdlRzTXFSQkJ0VThVYi9odnBO?=
 =?utf-8?B?dGVkYmQ2Wmcza1ppN2grMExteXlrTW15aE5Nem55ZS9OQ1RoMWFTbzhHSTE4?=
 =?utf-8?B?a3N2Qmx3OHhPS3RtM244TlAyajZuRmxUZ3lVeEowQmpRZW9pU2RpaGZtTHRn?=
 =?utf-8?B?Y1ppUVAzSVZ6T1RUTHVRam5HOGRrYUp5YitrMVFmSTV4RnBNTVdnN21RbFFR?=
 =?utf-8?B?Yk03OFlpbnRBN2dXb0dVZytsazc1ZlNKa2hnTll3MVpYemVUSW1tV3ByT2dv?=
 =?utf-8?B?K0Rlb3Z6bGo3SDg0VlhER29pRjcxSXFERnhmWU8raUtFZVV6cnFMbUszRGxG?=
 =?utf-8?B?NFl3QmY5VjE2eEVGbWhNd0lsRjVpWDVITm56NzhLaHU4cGtWS2xvaVB2bGVR?=
 =?utf-8?B?RE9nNmFuS3RPcjd5Y0pjTnl5YkkyVDcreGFkQ1dVSkliZmdIa2hKd0ZDVk5G?=
 =?utf-8?B?cEtBS3o4MDU2UmxCWktkaVJUU3pBQzVUTlFRSmF6QUJLNk82VmxtNW1iWXY0?=
 =?utf-8?B?SFVPU1lrZVg3R0VKZy9KSTBRejdwS1NlN3lKaXUyeWg4eElZUFpJaFdBbS9x?=
 =?utf-8?B?dWZJSjhnL1NGRXRJdXNKaFFDZWRoc2dtUk9BZHRPYlJOdU1FOXpOdjM3Q0E0?=
 =?utf-8?B?MkthWTY2RDBNMzhIakN2TkxLZlAya3dSWVAvV3hRS0RnQzZZZGxGcEtNSUcw?=
 =?utf-8?B?Uk9NM05LMzQrWDZ1Ukx3KzMyRVlJN3RhOXR5cnNYZUxtSWR6SDVQVEZ2TldH?=
 =?utf-8?B?UWNVN25OZWt3eFNyWHdNdzdQVitWRzhqcnZOVXpuZFYzWmlBczlkbHZIMTdL?=
 =?utf-8?B?ZHBuK2F3aFlsVlQ4TVB6QmFQemlGUS9FQWVaa0JsT1lhMHZsTVVOYVlIN2Zj?=
 =?utf-8?B?MVBMUHFBUVRpOERSbW9LV3EwZm5oNzhWU1hpTDF5bDhLODVBQVZ5TEs2bEdC?=
 =?utf-8?B?a05wQ0p5ekV6cVZlU1c5Y2I3UXNaOHJBZHBCMWM3MnpUMFZyMDJHM2JBYkFC?=
 =?utf-8?B?aUpHc3lpVFlWcjVreDFUNlp2L3c0c3V3akVSVVdhTmw0a2MrUjBOQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB442EC6FA086F49BBBBD1B8955935BF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed15123-3dad-4fe7-8a19-08da1e153f58
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 12:49:43.1166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3CQlMueOCtpfL7Kxp9prs+a+yxUiHt67XuK24/+qUy9TyHlkFZRIae/UkTVIYaU4atbOfF+oYFMoOiI2SUzhvPZ/i5d9kYS9W7AmN0uCbFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3766
X-OriginatorOrg: citrix.com

T24gMTIvMDQvMjAyMiAxMToyOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEZ1dHVyZSBnYXMgdmVy
c2lvbnMgd2lsbCBnZW5lcmF0ZSBtaW5pbWFsaXN0aWMgRHdhcmYgZGVidWcgaW5mbyBmb3INCj4g
aXRlbXMgYW5ub3RhdGVkIGFzIGZ1bmN0aW9ucyBhbmQgaGF2aW5nIHRoZWlyIHNpemVzIHNwZWNp
ZmllZCBbMV0uDQo+ICJCb3Jyb3ciIEFybSdzIEVORCgpIGFuZCBFTkRQUk9DKCkgdG8gYXZvaWQg
b3Blbi1jb2RpbmcgKGFuZCBwZXJoYXBzDQo+IHR5cG8taW5nKSB0aGUgcmVzcGVjdGl2ZSBkaXJl
Y3RpdmVzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+DQo+IFsxXSBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdD9wPWJpbnV0aWxzLWdkYi5n
aXQ7YT1jb21taXRkaWZmO2g9NTkxY2M5ZmJiZmQ2ZDUxMTMxYzBmMWQ0YTkyZTc4OTNlZGNjN2Ey
OA0KDQpJJ20gY29uZmxpY3RlZCBieSB0aGlzIGNoYW5nZS4NCg0KWW91J3ZlIGNsZWFybHkgY2hh
bmdlZCB5b3VyIG1pbmQgc2luY2UgeW91IHJlamVjdGVkIG15IHBhdGNoIGludHJvZHVjaW5nDQp0
aGlzIGluZnJhc3RydWN0dXJlIGFuZCBzdGFydGluZyB0byB1c2UgaXQuDQoNCkdpdmVuIHRoYXQg
aXQgaXMgYSByZW9jY3VycmluZyBidWcgd2l0aCBsaXZlcGF0Y2hpbmcgd2hpY2ggaGFzIGJlZW4g
aW4NCm5lZWQgb2YgZml4aW5nIHNpbmNlIDIwMTgsIEknZCBvcmdhbmlzZWQgc29tZSB3b3JrIHRv
IHBvcnQgTGludXgncw0KbGlua2FnZS5oIGFzIHNvbWV0aGluZyBtb3JlIGxpa2VseSB0byBoYXZl
IGJlZW4gYWNjZXB0YWJsZS4NCg0KfkFuZHJldw0K

