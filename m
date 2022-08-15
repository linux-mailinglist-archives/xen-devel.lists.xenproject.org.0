Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DE0592B3B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 11:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387216.623367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNWTc-0007gk-2T; Mon, 15 Aug 2022 09:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387216.623367; Mon, 15 Aug 2022 09:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNWTb-0007dU-VV; Mon, 15 Aug 2022 09:33:39 +0000
Received: by outflank-mailman (input) for mailman id 387216;
 Mon, 15 Aug 2022 09:33:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z+x6=YT=citrix.com=prvs=219f4dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oNWTZ-0007dM-LU
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 09:33:37 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 549638d9-1c7d-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 11:33:35 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Aug 2022 05:33:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5215.namprd03.prod.outlook.com (2603:10b6:208:1e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 09:33:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 09:33:23 +0000
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
X-Inumbo-ID: 549638d9-1c7d-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660556015;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8p54DIdYnoguQxyGemrB9b70hfH0YEL8q59qYyx8NVQ=;
  b=TY+Q1JcwRejoJan/pUKDL20yRwJJIgL9qVPpzrvcPncopfjAyx0zv2bU
   BwxcU0OaKKzpSv8CJP7HJkucn+YdwLQ3+5xf1KOf8YbYJ6v7TyocbzWBr
   20814+G+GIH0zgmHvKl/O1mgfz2eXTMluPzaYqo9Fhvt/Z3p1NBd3jqpp
   4=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 77846276
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1ToN4qMepHnPrubvrR28lsFynXyQoLVcMsEvi/4bfWQNrUohgWcHy
 DYYXziPOqqOYTbzctwlO4S/9xxV6sWGn9VjGQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/ve8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPIzalfBV5pOrFI0blWPG9c+
 9cGa2wSO0Xra+KemNpXS8FKr+F6dIzOA9lavXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr1wCCnKFW0q3rMzUYzy0HVwBZ8z/7GN93Nd8bRbc5UglyZt
 iTN+GGR7hQya4PPlWTfrSzEaunn2n/1ZKYgGOWC8/9Pr1rDyzIsD1oSbA7uyRW+ogvkMz5FE
 GQW8Cczqak59GSwU8LwGRa/pRasoRo0S9dWVeog52ml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2IB5UlqY/7aQ6DatYy4cKDZaYTdeFFNepd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2NNo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:5johXq3CGqnDQ8WmK8k8YQqjBZpxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LoSK05KX8Gx242A5bdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpphe0aJ9nU7iiuilwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqkfd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7nF6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklUqvoXRiKrbzPIt
 MeS/0018wmN29yqEqp51WH9ebcGkjb2C32GnTq9PbliAS+10oJsnfwjPZv4kvosqhNC6Wsrt
 60TJiB3tt1P7ArRLM4C+EbTcStDGvRBRrKLWKJOFziULoKInTXtvfMkfwIDcyRCes1JaEJ6e
 L8eUIdsXR3d1PlCMWI0pEO+hfRQH+lVTCozs1F/ZB2trD1WbKuaES4ORsTutrlp+9aDtzQWv
 61Np4TC/j/LXH2EYIM2wHlQZFdJXQXTcVQsNcmXFCFpN7NN+TRx6TmWeeWIKCoHScvW2v5DH
 dGVD/vJN9Y5kTuQXP8iAi5YQKYRqU+x+MELEH3xZli9GFWDPw8juE8syXL2uibbTtfr6cxYE
 xyZLv6j6LTnxjFwVr1
X-IronPort-AV: E=Sophos;i="5.93,238,1654574400"; 
   d="scan'208";a="77846276"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NI2YiHng/8hxI25CJoa4RjclngURjFNzK2oQ0jydwkVSeDXP3PiMaGmwvFanfAFvxXsi49aqwYf2WqscY1W6+hREyT2/9dO7UZdSUhbN8G4qdMUH0o+jzIPmcAE2UFU0UMhHA2T4LmOy32KJO3BKhlCE26AeILSZotLmDFx+Nca9QKDCg8WZSXleAbbX+R61ei4LdnqltwVgKOK2V+vvcwyCICVmgBg3d2DPuH1K1OePTThO4J0JypoZfSkYhXh0CU+UECDsgw3X/BOEDX+1xqXvdDFOLOnS19voD0Mv1ihjsWARIOBB8614a8wOJPPkTGgngfNYgjvAZVyxLz31Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p54DIdYnoguQxyGemrB9b70hfH0YEL8q59qYyx8NVQ=;
 b=HmPR+fhesmybSQ2ajRhT8L6OGEk8fX9NgvpSnUjNSUw9BGkayWxiUztCEgSP5XL2XPoKbM6b2jIgF7bGtWufvCv7hTUIS+t1M2JEEFOXBwcB4byhg8tTy0H1fe+/Z1iG0PXGJQS8Mu8hS3GnmXZ8j6WQpAPKPwD8ZY0ReIcbURiYRTV6q6gGpN6uzNBFwPgpCEF6FqeisRgUTty0SPfziDtazh3H5SQCIDnNaTokQ43iKIdnSuSq4alZ1KqUUdnzOQX212xv20jZzDmmQ/WduTWPUbkBJUuiAWZ4x7ycYZJ/V2K575f9en+QMLCI+Aqsu2CE9AVe3WSFmegVkxZU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p54DIdYnoguQxyGemrB9b70hfH0YEL8q59qYyx8NVQ=;
 b=LhsmESjDmRWqeceoq/pA3xZh3WgLkN6PgWvOuQBxrhEXfRET8o2C4+207lpm2SA/YC3YHesr3M0pQVuAmjOG0ChTEngbkZ+Zvymp/M0kZ8Vs//pUA+4OUElmACKVhOgfigS+iiEm5V17ZRbJpIQMU5huk1SBO1vrwzVowhiHkOM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/spec-ctrl: Use IST RSB protection for !SVM systems
Thread-Topic: [PATCH] x86/spec-ctrl: Use IST RSB protection for !SVM systems
Thread-Index: AQHYqLeEZxQkjHD9vkKlqX0DT1YSA62vsBsAgAASlQA=
Date: Mon, 15 Aug 2022 09:33:23 +0000
Message-ID: <8ff66724-8cf2-9f1a-c8aa-2ab1d4d33247@citrix.com>
References: <20220805103814.23032-1-andrew.cooper3@citrix.com>
 <6c8fd8b4-85ed-6599-5761-a3f6e9fdeb36@suse.com>
In-Reply-To: <6c8fd8b4-85ed-6599-5761-a3f6e9fdeb36@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e435aac0-c842-4f12-79be-08da7ea132a9
x-ms-traffictypediagnostic: MN2PR03MB5215:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kUTG0o1MxHqbAhP6Dn7/8/03ibxAJsjcnKD+O6UctqpEGRSD+UV0aWWQTlDekCQTZ5+BnJ5WqSJOAqXViP2++b/2fKbo2j0nh7J2rf9gbTqvDlMudBA5i7VgQzlAUxH4YYgwiORSDpKCRVHEck88vfSRNvRkDPqFDwI2IneWOEK/Qm617mBNiKaEOBMOp9iHMlMVboyd0SOcLoMJhF1Xb3oDpQpAA1FuJ4yaFKPVL8ACMZvt4F23TaVrK3u76Ssea0zuOx3ozNNvJf5xDs+vIAzHDj0qt7aIc6r8IHqlaJJOVl18NntwWN0+hqweQoxBVf1iyvbO+UXYB0JWeIYDTGnEHLc9Y7l2KCm+dy9cfz1D6z62bW0O5/94dmYZH4qy8wwSrNJ22WM9HGhZ+6W1OBwLhBp2VbeGFox9K4EvL4hTkLLBKV67uAGVlNq02cfIDxmEyioiHG6gQPho1IUbOZ7GXcq07PtKhaaiMm9kCxhzISVQWtxK/adji//AXFQzt4m1nWLsfCh2CBkOE5jTvivDlJKjhAb+w8/4GGA6tT65u6Ls74BBPyIxPOHQb7AZydccDM3zt9jvRWLlpL0R9HypztRvdbn3nNsRNAHx6NHJtEuKqUTtsVk9W+ekhzQMFX/Oz0gMyQIATYUXPz+MW17d+pL5salgAb6wsSm7RAyGSzMIr8ASfpc1RuTC1tErzedacmgKwvKGyurFGBHcSkyO/bQsfYAi/7lFKfajYLnFkNWHCgn79tN09bXU+uSA5mQ2CvdYFvtT1JnZzfr/0HTFi7bKxhxL/TP2zAS3kyNL4+ZsRJeM0p/xmjfj2IHyxx5/Ui1cG4v1Hl8x+2XkiKJYkaDS9WRobhfx2/lrdEhH73cXV7eiY864iiayamCb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(54906003)(36756003)(71200400001)(2616005)(6916009)(41300700001)(6512007)(186003)(31686004)(26005)(2906002)(86362001)(66476007)(66556008)(8676002)(4326008)(66446008)(64756008)(82960400001)(66946007)(122000001)(8936002)(31696002)(38100700002)(316002)(91956017)(53546011)(76116006)(478600001)(6506007)(38070700005)(6486002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVZrMWc3MFBUTmxMbjJwbDB1d1hUeU1jMk1yMDM5MVlLdjQ3SFZwYTBSVDJE?=
 =?utf-8?B?clppQ3pKOWhpTU5GSldDZDZrOWIwU1lCTEgwa3ZveWxhM1hwVWZUVHQyVFVR?=
 =?utf-8?B?Y2VmdWFSY1ozeUNnLy9HVXg3MzFqT0d2bVdwYUQvQnNzcFRyaGxiQ3pEdjU0?=
 =?utf-8?B?ZThTVkFvVlpZTisxRCs0SVY0TlJYOHJoYjEycERWOWVZcUlxaFBXYlJkUHA3?=
 =?utf-8?B?OTdTbnhxSGY5THBTR1Izdm9acFlsUVloNGVENEd6QjZkNUN4TFRJZTBNQ0dr?=
 =?utf-8?B?NlEzaXpFaytQczFua2x4WVcxdFFSNUZOcXlORTFmQU9hKzJ0Nmo4ZDB4d0k0?=
 =?utf-8?B?ZnUyY1ltYUVpWmpheWJxZmlIbXZYRTM2aFcyY2h5MFZvNks5RVI0L3hwcks1?=
 =?utf-8?B?RFR2RXkzRlZUNUU2M1RSK3daMVlxV1hvNVZwNHRlVmRWYnFWRi9uanVMUWxr?=
 =?utf-8?B?NkxkU09uWGhXcC82T1YxYitqa3NybHRCSkxpdWdaTU9RWWJCNFQ5MTJmbjR5?=
 =?utf-8?B?cWFCa1A1STUwN0lPQmJhTVQrZDdyV3BvLzVGL05PSC9DdW5ENEE4eW9KWGdm?=
 =?utf-8?B?d0xiSUVZNzNiWmZXMnFtNzJQbWNOZXFodEsyNUx3bVFqd01uQ2psd2dGWXZS?=
 =?utf-8?B?S2lZWlRYc25tc0RIV05SaFlKZklJT1pNcE9peHhwVnI2eFNmNzVkNUFBSU1l?=
 =?utf-8?B?TDdVZGZDVzhDeEp4aXFMcDN4bXB0QUVuVk1KWVBiZmNGc3ZZRHBpcXlGY0RF?=
 =?utf-8?B?ZS9xQTJCQzQ2d3lpdEJ3Q2hMVXBkekljb2JnNTVqTkh6cHJPS25IQTJ3dSt6?=
 =?utf-8?B?VExtWkpnSHhFdUI5ZS8vaG13QXpTVXpPMC9NVDhMRlk3bTNQRnA3WTBNRVdF?=
 =?utf-8?B?Y2lLQ2wvWXByU1FwMng4UWhQSjlnY0k2YVJabDJ4L0xOVVJWQmFpemgzdytN?=
 =?utf-8?B?dFVCeVRkTzcwMkhpQ2lLakxuNk9wcDBhSXZOTnNXS1FnQlpySURCZGh1QTND?=
 =?utf-8?B?S0ZMbzFVQ2NJaWNyRVpvV0JLS2Q1c2ZtZDhVNHpSSFdxYzl2cjZmZThKc3ZB?=
 =?utf-8?B?OGJqdWVGc3BRM29TS01FS0MxV1FvSVR0N1BaN1BHZ1ZFYTR0OXFKdDZad2FN?=
 =?utf-8?B?U1RXZDZlSmJjZGN2S1Y4SVBxZ3VrL2JkTXJYcUlzeXhSYVF1Qys0Si9iTU4w?=
 =?utf-8?B?ZDZrakxGNmUxQ1hWaEw2YVI5TUt0QktaTm9QVnJ6OVU0cnBKRGtFbi9nVmlm?=
 =?utf-8?B?dThnRThUMVp4a1NxcnFKVlFqdlh1OUZlZzFjNVpYUmxDQmtFWUhGN2NreXlZ?=
 =?utf-8?B?amg3TEdEZVAvdXIzdHNJWll1OUVxME40QjYyYzJlU1hQZTRHU1gwN29LQ01Q?=
 =?utf-8?B?VXJxU3JNSk55bjhudlFSTHhPbU5TbHJUcEF4cVVwTkljM0pqdkdlRGYxbTJN?=
 =?utf-8?B?bHFyVjByNk1KUGpNMEhZS1YrRHdsOEtlUEpmQzBOMXVQaDhpdFNSSkxmTkRS?=
 =?utf-8?B?eW00cytWUU9EaEIxbGJTL25valpUL3l2MEJBclJZcXRmRjVJTFY5VS9MN2hv?=
 =?utf-8?B?T3VQb05aR1lxRW9MUkZoS1QrZ25KYTduQlprNnByc3lDSWx3MDFmaFFkNGg4?=
 =?utf-8?B?TlVxcTNMTU45d1VaSUpYTElxTkxoM2U2ZE42Vzl6TUFSdkJlOGxZT3FmK3Ur?=
 =?utf-8?B?T041UG5NdWpmT3RXSVFIRUo2V0gyczZlQmtiejEybWhoMnVGS3NUY0NJaWls?=
 =?utf-8?B?UmtJK2tyeERjUDVlajBpbUJUNExuNHRnUE9tRFJIeWFwK1E0cUtVeEFkS0tk?=
 =?utf-8?B?cGlUcVdJdDdEeW9rT0U1RElHMnpVSURTZUNsYWxBQXcvanJoSzlUdHVucDZM?=
 =?utf-8?B?VHdVR0FUcHJpYkZYS1NXbzVkRm5RQUVUa3FjUGYwd2RaNVF3aXdjRkVLNDVw?=
 =?utf-8?B?L1V5UjRUNkRKYjhhWTVCSTd6TGh0cndseElhNCt0WW0yemx4a3dlY2FRQVpQ?=
 =?utf-8?B?R2U1VXZ3NUtmSitxaEg1bE9yRk9TNUo4WnJ4ZUpwTncrS3NCRml4YzN1Wk5p?=
 =?utf-8?B?L0JxMUZJRlRpUzNPeWtYcURuL1pxUzFYS0FjN0UxaUIxb0NyZDlhUWhDakxp?=
 =?utf-8?Q?iV3cr5kVkfc4snlR9i6HkOdhP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91603ABD24F28342BBACC7193CB63CCF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g1fSPacX8JETDH4tCWFtldXSamG6AwVE+NHN2UET4g0zNkO8wOBoFKyZJENVxM8Fxz4NUQO7wmlN+0tdnevDZuGmoVsd3vkYuyiDWjdpRGqN/6ZtgkQJ9XAMaXd14mgK8vYmNHF/x4wdDtEZOFLyBGLzbZKVcHkxfsZ6pIGH13MyyduaSg9zKYh7P5s/WbhfqSLMSP0mnS6rWyx2ncZqikxp0iG0JNlvg0cyQP9fhpbhqhUvFr4oLt/NUptySHvaNuPgEIXftpep+aE50kDBxWVde0Mx2Srjj57RDaTG4dG1yhIZjaYxl2gyy7XN/GA+QohJf7inEkkCUD0YDiKXu6EPGp8x1VZXLW2FOotwDaN2Spo0zGJ4EX9sXf0QjuWJuBvoBkIuPI09yznARdS5c5ewSiIVQCUpup4zTtJdw6NsCoGL5rHxBPHoH9Nkqz+gs/0VfJk44/V1KXYEDJIfJMQqUHdCG0UVJ+vHyx0bxFmhZvOaksID/eFaCUDjN5M0lBaSoFtc6xTOex8frNfvurB7hjkyqWkGcHWoJY1vqV92IVyZVwYPHJuhDH1TtjEyI0BMrAS2m0vQ29wNBd2cBfFPY36R8EamLD3QdBCqNJl5s2dteyWurSZS+27B1SCfwyzi+EMOnHafx7dXQ6GoV9t3TVx3m4diU4SX3TrWnKFLUSc/Y1ebv9cR6ZUAQG8UeUVEYPVhTw5Sm042ZkF2gvnuUuVXFVSciUaJ5nnitJpGcN7ozoVcU1WvMnW972nyk/dx+BB8lcNDiBGElElwsWqJ099ZGuFjyWFkDk0WWDDrWtKgNnzxR9nW3nyLFGcS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e435aac0-c842-4f12-79be-08da7ea132a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 09:33:23.0679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8cbZDT8IsrXXe+G1Rwvp/X7zrDtXpcL8Q5lTpFei7ReajgmMhWRsWki6AFiBllgtzy/YabLPBXUt4spI3fZGBioZlBT6TcBekaqe90jzD0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5215

T24gMTUvMDgvMjAyMiAwOToyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA1LjA4LjIwMjIg
MTI6MzgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvc3BlY19j
dHJsLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYw0KPj4gQEAgLTEzMjcsOCAr
MTMyNywyNCBAQCB2b2lkIF9faW5pdCBpbml0X3NwZWN1bGF0aW9uX21pdGlnYXRpb25zKHZvaWQp
DQo+PiAgICAgICAqIG1hcHBpbmdzLg0KPj4gICAgICAgKi8NCj4+ICAgICAgaWYgKCBvcHRfcnNi
X2h2bSApDQo+PiArICAgIHsNCj4+ICAgICAgICAgIHNldHVwX2ZvcmNlX2NwdV9jYXAoWDg2X0ZF
QVRVUkVfU0NfUlNCX0hWTSk7DQo+PiAgDQo+PiArICAgICAgICAvKg0KPj4gKyAgICAgICAgICog
Rm9yIFNWTSwgWGVuJ3MgUlNCIHNhZmV0eSBhY3Rpb25zIGFyZSBwZXJmb3JtZWQgYmVmb3JlIFNU
R0ksIHNvDQo+PiArICAgICAgICAgKiBiZWhhdmUgYXRvbWljYWxseSB3aXRoIHJlc3BlY3QgdG8g
SVNUIHNvdXJjZXMuDQo+PiArICAgICAgICAgKg0KPj4gKyAgICAgICAgICogRm9yIFZULXgsIE5N
SXMgYXJlIGF0b21pYyB3aXRoIFZNRXhpdCAodGhlIE5NSSBnZXRzIHF1ZXVlZCBidXQgbm90DQo+
PiArICAgICAgICAgKiBkZWxpdmVyZWQpIHdoZXJlYXMgb3RoZXIgSVNUIHNvdXJjZXMgYXJlIG5v
dCBhdG9taWMuICBTcGVjaWZpY2FsbHksDQo+PiArICAgICAgICAgKiAjTUMgY2FuIGhpdCBhaGVh
ZCB0aGUgUlNCIHNhZmV0eSBhY3Rpb24gaW4gdGhlIHZtZXhpdCBwYXRoLg0KPj4gKyAgICAgICAg
ICoNCj4+ICsgICAgICAgICAqIFRoZXJlZm9yZSwgaXQgaXMgbmVjZXNzYXJ5IGZvciB0aGUgSVNU
IGxvZ2ljIHRvIHByb3RlY3QgWGVuIGFnYWluc3QNCj4+ICsgICAgICAgICAqIHBvc3NpYmxlIHJv
Z3VlIFJTQiBzcGVjdWxhdGlvbi4NCj4+ICsgICAgICAgICAqLw0KPj4gKyAgICAgICAgaWYgKCAh
Y3B1X2hhc19zdm0gKQ0KPj4gKyAgICAgICAgICAgIGRlZmF1bHRfc3BlY19jdHJsX2ZsYWdzIHw9
IFNDRl9pc3RfcnNiOw0KPiBPbmx5IG5vdywgd2hlbiBJJ20gYWJvdXQgdG8gYmFja3BvcnQgdGhp
cywgaXQgb2NjdXJzIHRvIG1lIHRvIGFzazogV2h5DQo+IGlzIHRoaXMgIWNwdV9oYXNfc3ZtIHJh
dGhlciB0aGFuIGNwdV9oYXNfdm14Pw0KDQpCZWNhdXNlIGl0IGlzIG9ubHkgU1ZNIGtub3duIHRv
IGJlIHNhZmUuDQoNCj4gUGx1cyBzaG91bGRuJ3QgdGhpcyBmdXJ0aGVyDQo+IGJlIGdhdGVkIHVw
b24gSFZNIGFjdHVhbGx5IGJlaW5nIGluIHVzZSAoaS5lLiBpbiBwYXJ0aWN1bGFyIENPTkZJR19I
Vk09eQ0KPiBpbiB0aGUgZmlyc3QgcGxhY2UpPw0KDQpQZXJoYXBzLCBidXQgbm90IGxvY2FsbHkg
aGVyZS7CoCBBbGwgb2YgaW5pdF9zcGVjdWxhdGlvbl9taXRpZ2F0aW9ucygpDQp3YW50cyByZWNv
bnNpZGVyaW5nIGlmIHlvdSdyZSBnb2luZyBkb3duIHRoYXQgcm91dGUuDQoNCn5BbmRyZXcNCg==

