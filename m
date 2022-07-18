Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35E057807E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 13:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369652.601128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOjv-0000On-Ey; Mon, 18 Jul 2022 11:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369652.601128; Mon, 18 Jul 2022 11:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOjv-0000MG-Au; Mon, 18 Jul 2022 11:16:39 +0000
Received: by outflank-mailman (input) for mailman id 369652;
 Mon, 18 Jul 2022 11:16:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDOjt-00087d-Qw
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 11:16:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 154b4102-068b-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 13:16:36 +0200 (CEST)
Received: from mail-bn8nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 07:16:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5818.namprd03.prod.outlook.com (2603:10b6:806:119::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 11:16:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 11:16:31 +0000
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
X-Inumbo-ID: 154b4102-068b-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658142996;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jQ6SV5L2fOkcTpQm3rLauT1+hLDdkCcBmrqmoMTzBcc=;
  b=OU9AhmleJQzStnWEuv1575OJ6SFuRg1C126hYK6ln0VsejdTSylwNtIw
   NgvO7gw/tL2yJvVIB529z0Kx4USGrzYPYU/aS3TVBqgjZtLOPY1rMZf/2
   nhglwiEv5rfvUwuE5URzKBiboNsqurwC2qBZ7kFYC4lowvKcxlW5FtCta
   k=;
X-IronPort-RemoteIP: 104.47.74.40
X-IronPort-MID: 76021397
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AUy3AZK1xoYNrC85lSvbDix16xW+F8HFdZcB5h?=
 =?us-ascii?q?dg8jSJ0ofuS17OWlPgJJ2/OuNTVsDYEmuJDyr804BonUWBagGkjRIsJxkLyB?=
 =?us-ascii?q?gUPdBji8oJTg5IoOlONm5VAnqaa3fnrU9O+9hKmthIrSyPTmKRarOklrvCX3?=
 =?us-ascii?q?EtrcbbDs7Nly4JSzgDKJLhUv7kZ2gMOFjjsehPcIPlDr4N6qHZXCUtOmbhWt?=
 =?us-ascii?q?jjHZJBLw2Lm9tMLp+WPJE3hTJum6BafYImgaguqBKhnr8rRLeMAaTr825Ct1?=
 =?us-ascii?q?/dgvNC8klSwLa+XUPYnvMj+PgS7L1BJCeHZzXhfYX4z24erEFHSrFbwWanCJ?=
 =?us-ascii?q?OoUU+29MXLRorzH4WwMQtB8FSw7oJ1bDN6ChWW9ntAECTv/Y9ABoDm39re/S?=
 =?us-ascii?q?a5OMgu+j6xDTj1rO8cmSu7ymAhWZFcK7qwhAuUExkj5IttQXD0uolhgH8Mkb?=
 =?us-ascii?q?bYXQ8p2A0R2A7/yuudydW4vqNs+/fEk1qm5TUcBTqhQgMoSnYz14cJaT3PA2?=
 =?us-ascii?q?6Zgv5rI8Sd/y2VLyXX3y2lqMoq4scXjx/dDWge+gv8Yz68tmlVpbatgKhxMg?=
 =?us-ascii?q?vhIKPgRBngVnlOGZOsfJgExRY0Nb//PMS35AUHiUkvHLBhBvBfbh/waaynz7?=
 =?us-ascii?q?pvL6buTu5oZ+KB/gPg4kCzw9A69V567IX68sbxHfcMio7dHZRpg+PsCEVE2y?=
 =?us-ascii?q?AWmXd22AJbjsdjNrnNTGWZLMmsU4HwJIbOaLLgXN+oz/C/1UkAydnbGn4taH?=
 =?us-ascii?q?cbs6mFvhADbckjBzlvyi4MER6eRYk24mKqpJmSAhbCYgiAfmoh2sOyNjUHLP?=
 =?us-ascii?q?Q0KMKfJjT/DLNCFyDjbjfJOO0WzTuQWncxUSiwsWqNdB6WI7UyFkHdv/ttRR?=
 =?us-ascii?q?xnCRAreJ6/huss2ClWXOnC7qzScJx52t0Hn8bAzcsJ4P8qx1BkP5+4J8iisu?=
 =?us-ascii?q?4TSa+OcKV3l8VT0Q8s2ilEcIgRoZ5TljZZqk8mWVYW+ZbN0L8Ysq0WPvHUJ9?=
 =?us-ascii?q?RHFpmvYDaGqkGDqV7jIObD/0IJk3IvIW8m1hYJbAGtWqsgq5Y7eDZv6Q/NDH?=
 =?us-ascii?q?oPGLmAG8oefkLi8Ru1kIjFG5LtH2FftOh6Y5+qgMyBoogyc/rgeOkPOiiV3l?=
 =?us-ascii?q?APinq+uOox0Qmhx38gAkSTrQfvNHEADKHnaFn94slp6nSGqvbrpSTYWg/6T1?=
 =?us-ascii?q?MFC+AypcBjquaYTfZMAsF5fcU10bfnyVkhxTfninikiJl0DxvllrLsrgvc7r?=
 =?us-ascii?q?vzmGFYZ0XohpR4aIDxWUmBfco61jq4e4zrBqCPpqoSR2TDpTGOEc46lk1e0X?=
 =?us-ascii?q?Hh7YqT+zoWuiv/59VzAGx2IBZh8eK93BWxp0XeZjQryYrgXo6NfuPRelxfTf?=
 =?us-ascii?q?S7NKVyyaKxYz6ahcKQxKnX2xUQnhSanfu9vIaVshOXiQ7yTAQf1miRtDWfSU?=
 =?us-ascii?q?BjU86e2JZpkRiypjXM3BkzTAebpxFwZ//Kkg8MpyZd8ucIBWfmV0z6rSC81m?=
 =?us-ascii?q?jRyUb6/moBKHjQVD0BUb9kfr+GQRUHMhQcJitKkjoNeI2pYXEn7e1jwDtMxN?=
 =?us-ascii?q?EVB4TvAJn1VkoW8j0OJw1hjzsEWBCKkiFjfnJC8kda6hWiNHU/DvNnVtkeAs?=
 =?us-ascii?q?o4A0RFdVYFDJfCDUDJWkqWLHnxs5QCXcFnHgeY//A3yj3yimWmdvp0bLeSsM?=
 =?us-ascii?q?U9Q5Bik8i6zcyYrUiSGCGpuDPdy/2+H9koaBvQABZPlafYixWqUqLxERPpdn?=
 =?us-ascii?q?jj+qC2P2KHVPBYP5KfpQ6LAYP1l6Ch+4MDnCPFfjHwJOh6Ri806IrZ/YY0KO?=
 =?us-ascii?q?q6WSW4N9CLnB7XFqQrnW7qoPRvUOMW4Ko7lNCIYZWVwTnYeCxVJ9XVZSpChR?=
 =?us-ascii?q?5bd/MXx8qRkESpQZTA70jDf+nLOwmunR50tnPYdXmOJjri3KPF4y+cJ+6mYT?=
 =?us-ascii?q?DyCL0IhBu4Oqr+HhZmer6t4ZdtyZMyJ3RtY5GQJuAQKu5De8w9tugNlIIXwc?=
 =?us-ascii?q?VeKYifdUSmZFiHCGCV9d8wQeVFogPmwSs5+BwV8MVIFvIEyHs1CE2pDCfz4A?=
 =?us-ascii?q?0F5v7APn9YMXxp8QamiA0NWqtmVYkJY+rc24yKeVR4JaYPD4tdDelaSxNpEl?=
 =?us-ascii?q?eDRA5MjthQ4SQWcGbNrWk5nSucfR2lcocJTS0PhJoiCG4jddsIbMhoiiLMX0?=
 =?us-ascii?q?K16oRDswsOSptyUJQuRgLoCF07OIzytca5lbxx+VpTxa9zPvh5q5LVGl427v?=
 =?us-ascii?q?El+wmqfjUAJ97kR4Pw3oyTFkmJc7OLY/qjeIIeS1F+pjfXGMTfI+qkbGHmcO?=
 =?us-ascii?q?XlK1T0sIxD0kmA47ZxX+0jczHGLDH9ElGslqogMH+7XFiDY2qhRsO/aV27a+?=
 =?us-ascii?q?ZmHQD7hxrEwaxbHS0XCu+m5fP9xPZq/1GAq7zI6uRF/iBvra+Bp57AVZFxCf?=
 =?us-ascii?q?U47GKGGGx3JV61ph3msS4EY9K5zovE84psjTKNoLJFjvtxculYW+Lb78OG4e?=
 =?us-ascii?q?f7aZ0DGosybxjQsrQdOChknTk6eam49Uf/3A08=3D?=
X-IronPort-AV: E=Sophos;i="5.92,280,1650945600"; 
   d="scan'208";a="76021397"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGGkaKuofrXYQgKDtboeHNIwCdlKo7jXoehLTMQaupPzifRZskFyWT4jpzV2tKTiUUHLs1PvKrqyDWK8i74RDcu8r58NshxNQgd0nDssXfZibbINRGF/Dre5LLWRsP8PG7zkPDV/SENWIR+o9rxTIjx5VjKXxko8OdT5OPFSkPqIthaMnSFrRUuzwL1An9lNm6yu0rlt/KpqhdRw3hZe1Fr4o/6Fp1xitYnKJNfaS8h+FfZVE/vg4yhTawXQwVbcpXEinhnQB8TUbdrNhbygnYkUWwl2eBIBi3OVqVvKh7UqbtPxMqY2tLVBNFUVPcS0Bbx7Qd48yGGiSktmyBEZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQ6SV5L2fOkcTpQm3rLauT1+hLDdkCcBmrqmoMTzBcc=;
 b=e7VZxjt2TRl115QqRvTImQ8TI2omtwusGDWBonAGMCmKFpvCovSL5UIOgf7674YC4i9qP9w3TONPEPvgzBaIPfDiySYyEYvyaEvB9/yLrrnwobm7Sykh7W/YXKToor4CuzN7v+U4XkYEE2CLWLIK3I7P7udJfqHvvfCGodLNwkNqLDW6eUqqJU/Xc9/0Z/b3VQCNwyqY4pVzxLiA9fHfbpcNH5pP2rKryAL4mWG7tCJr4S9T92jmSaAFr4WJjNfgLbWRnjHPwen19voiBDduogID/GIvgo2z+OUd7KSuiB0OkGZMuQm+l9wz8RBPhF0gtXjOkMc/yveOuMf3cyO7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQ6SV5L2fOkcTpQm3rLauT1+hLDdkCcBmrqmoMTzBcc=;
 b=k5rOji2V+a4wcy+aCs0D/mZwjAR/N/+ar2BkeWOb/tSVBs0eTJYsSnyC2UWhLmfW8WwqC1c1+iWPPmB3GWhocbGINFtHSjOV5/jMCaNCCCEHxGkVsERgaocwgSqpNw4KO8IahAyiwaaT3Qjg7K1LmqzAaSGBP+fPkJQJZAgr5e4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/5] xen/wait: Remove VCPU_AFFINITY_WAIT
Thread-Topic: [PATCH 5/5] xen/wait: Remove VCPU_AFFINITY_WAIT
Thread-Index: AQHYmnajnVBD/nNGjUq8LNREqaX5Ha2D8tUAgAAH54A=
Date: Mon, 18 Jul 2022 11:16:31 +0000
Message-ID: <855afed1-e65a-e5b6-64b5-1ca3d6752656@citrix.com>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
 <20220718071825.22113-6-andrew.cooper3@citrix.com>
 <44a6e983-59e1-b60d-c86f-db2a1747ddf7@suse.com>
In-Reply-To: <44a6e983-59e1-b60d-c86f-db2a1747ddf7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c37f678d-d2f5-46bb-f234-08da68aef7ac
x-ms-traffictypediagnostic: SA2PR03MB5818:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 terVoMA37An+bBarOqUSY1wOFWzmL1zwdmaMdTZZ3Nf4FIiXhQsfZq9tGHbMrNc/ibxxJ/yvdll2LxdxBNKvFM7Qv3+VWbcXZzHLaU4b0gHvvRJC07Vs9x6V4T+DH8Yo27/4ePGX+S5Kcwck/puMVMf0GrKTIiuiJMPljqNuiSKSBbO8hTUHGNBw+VupBYW9E0/UpKc+MUYHbrn+L16J6Nz8KaM9LF1ksuYGpiCUn6W20Q9WKRhmOHcQBwMy4OghHTXbY+hhBG3EpBNmevM0scKE2AMsWeoBlLF7mA7gJT1crnPEbMDKH2AjyCM64IrZ3AqOPrBFWmle04NPJ/Z+dXCwD8I0RDCCoI6Y82tRY/aiDdjHQ+xadtrMJ7DNpbsfqfK+Mf3ehU3gbHNyhBCC+WrEkBOV6+n212NSDZIJGEKXHZCfVOYxddhj3zMUevSh2cQUwIq20FRr8B8Y5BcRZBoLShDJBjC0MFp7hwn+bFStdM4vZzwgwssEk9XrF6Zs6L4YLiXXYDqaE7WFP2vQIe/+Ykrg4KAFxpqfnnDSE/8e33MNbY2raGoCKuCh3W1IxetbesaQfQlCcqp1xpM4+cEp+Ss9F29YzxDHyMTi4IVR+fj/pH1DC43Y+J/voaOmNsTvUg4FunRaL6+AUOMCfWQs61YGq5w4+JojqrE1UUcMkEQCA0WnDnxEapi526lEIUeuq7jFNZJ91aRXqEnqMyyYawy4cofH0dUCvrlx6HO+mFBhe76R6uwFPkHpH+Q1ZsEsE+CRb8YNPxkM75ST5LcOVmmv7RC0BlATVbR77cgLQVEuKLW7lN6eNBvm4UoeslTz5+jDfZhJsgMBkMM9w8diCrZospHy/yPheXy2Q/9yQPJ6U93ApO05I2y+We+u
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(86362001)(6512007)(2616005)(5660300002)(8936002)(6486002)(53546011)(31696002)(41300700001)(6506007)(2906002)(26005)(71200400001)(82960400001)(122000001)(38070700005)(478600001)(38100700002)(83380400001)(186003)(4326008)(66446008)(66556008)(36756003)(31686004)(76116006)(66476007)(54906003)(6916009)(64756008)(66946007)(8676002)(316002)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RGJvYld2R0pjZUVoclE2M2hxa0dlSGFzRnlnMkZSTk9RdmU5WjNyY3JsbTdN?=
 =?utf-8?B?WGZBOEdza1lYcG9ralkyRVBOZlBBK0FmeTRGaENPNlFwM04rVXVEZ3N4V2pR?=
 =?utf-8?B?V0V4QVdnM29QTnBNaUdYZEJkV25neVJsZ0RDeUM3N0FUMUV0L20vRkE3WGYz?=
 =?utf-8?B?RE54T1BIakJUcWFUVlUrKzNoOGJBT2lNZ1dmV1NqbEhxSVh5bnRDd09tUmRu?=
 =?utf-8?B?ejlqQXhCSWdMYTdOZnZGYWczQzVuSGt1LzRRRFNLekw5alRnaEdmak1OUjF0?=
 =?utf-8?B?eGdrenQxQlMxaHB1RlIwY0h5cDRnV1Y0dUNiT0UraTFJaGhjeXNVdk1laHAz?=
 =?utf-8?B?RXZOZEwzRFVjZlFYMWo0UEVjOXhlNWl5MUpsLzhJbkN0bTBnZ2ZpR0RLNWNs?=
 =?utf-8?B?dEc3KzdTdEVReXc0a200N1F3bGtWUUYwZjBhNVBPU1hLTzlVcEIxVE1vRity?=
 =?utf-8?B?RDROaXV2SzRwTjhjVDhQWEo2ekIrbWZRSC9QZmtaR2c3ZzhVYTk5N1lDb0NY?=
 =?utf-8?B?am94RFhTZjcrUFRlTjFKWEVJOThMQ1VwR3BRaEV2c0lsOG1JVm4ycUswdHJM?=
 =?utf-8?B?aTZJYWJ1eHFCNDdjWUt6eUdlTnpIZUlmNEZZN3NoSVgxcHorYVhXZ2xYOFUx?=
 =?utf-8?B?enlGN1BqbUd1R2c5aXVCTVE4bGd1UnUvMlo3WHBQS2VJVGNpMHNINlo0b2dG?=
 =?utf-8?B?NzFHdVFOVWZlRnc5Zm1TMkJNNGNlNnZMN3Rla2xOSW1yRWlUNXc3UU9wWXp0?=
 =?utf-8?B?NmNWNDBsYzI2MDk3WFNJUkx2N1VkUXE0dW8xK25VWVRwbnFTYTA4NFg1b2JI?=
 =?utf-8?B?eVZSNmdxalNITFlYbWlFVXU2OU1QS3FodWhJT0pKMWhYb3BMVW9tcEVHNjhK?=
 =?utf-8?B?MmtqdmpodUg0cE5pWFhpb0FNQXlldndVUjZqaUhENnh4S21VVnZVeWk0TGJE?=
 =?utf-8?B?R0FBbkFua3hGZzFTNDAxNDloeExCalFwelpZcExyckFUdktvRFgwK3BIUHY5?=
 =?utf-8?B?L1pZMUJDenBuYUV1SUJHbHRGTU5URDZKV3ZWdzdzR3BnRGVSNWhvdVI2MGJ6?=
 =?utf-8?B?RnJqanF4NHdXczJMa0ZwWEtMMExVcWVqczJZVkRQU2J2dDRTZnExSW9nUEJN?=
 =?utf-8?B?dmtQVHovaitRSXlFRFBNVEM0RUt1Mk5RNGN5Y2ZRekgzSXB3M296T1BqeUoz?=
 =?utf-8?B?RVZGYW5PMzBRajVZRklyRVJCWk1yVmZKa3B5Q2VYcFpIMGZCUE5Ud2dveVE2?=
 =?utf-8?B?TFNKRnFNZUxENXBWYy9pbnBCU0NLSVg5Vk40eWxxdVlZY00xYVk5TkV3UE5n?=
 =?utf-8?B?MjZyL2JUbE1VSXlQbVYvSHZGcE13TStGalVkYWhZMjZ0bVNocjE2VjAzZDBG?=
 =?utf-8?B?dVE5NFNWYnpPMHVOalpnSmxBYTVBL0JSb25HRXZ0L3RNU0pwY2lrZ0NoalF0?=
 =?utf-8?B?WDdneENWNytCY1NNdVk1QWR1R3Y4elhKcTFZeTQwZTlUV1luc0F4OVZLR0c2?=
 =?utf-8?B?bFB1cDA2dmVQeVFJaWd5UGdhdEhJd2ZINE5FWjhacFh6TnZxcExuYUYzdVl3?=
 =?utf-8?B?NVVYNHZFUE5rMlZxMHQxaGxrd3Bsbm5XV3M4SlU5MnZZeE9MM0ZZbjVXZVpB?=
 =?utf-8?B?c1V3QXRyZWtKRk5TUG1zRmRCaThkaXpzM2xQUDd1eDFxNElOaldtVmh5am5t?=
 =?utf-8?B?Z0xwb1FCYnFCVXlWTjA1VzIzUVRBaDBsZXZDRm5SUTFKek8vQ0p5cWFmc3Rm?=
 =?utf-8?B?aFVHcDBnTkhFTDkrcjNLeEZqL1BDWHVtTXVQeDQydGsyQ1VKNEI4elRFZVRu?=
 =?utf-8?B?WXd4M0NLQzQyeSt4VGdaT2FOTVhZRmV6UmIwMTZKcTJmQ2U2ZGp2OVgvREZs?=
 =?utf-8?B?RldMUW9CYmdCYWEzK1QzSGo0WFEvaTlKRVFQVGhnTjNzRU5USEx4OGJUZXRr?=
 =?utf-8?B?MHpMalUvMi9DaE42ajFxNjlBQXdlcUlER2NzSVZDQzUzQ0JQbGhrSy8xK0F3?=
 =?utf-8?B?TXVucFhqelZHZXpaOXFyNXpvbG1Ebml4dUpWaXFwR0Q1YmtXWGpwYzVuR1FK?=
 =?utf-8?B?WGEydGVoTmZpNDVIT2x2YzcxSTVwV2hsL05Yd055L0ZGL20yeTVBSlZGZ2x4?=
 =?utf-8?Q?Hmj0Xy9BrTn/u3tuVi6EgNTQ6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E01ACAADD2624242B70137F37B151594@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c37f678d-d2f5-46bb-f234-08da68aef7ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 11:16:31.4782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mVpJECeVAUHCf74z+1EdmVotEpz3sTAG9k2fZtzHAShQmaUhndbtAJYxwFdTekR6XMlu9wMkGFznv4Az9LpIOvVpz2GsaKXyWFJ4J1cVbEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5818

T24gMTgvMDcvMjAyMiAxMTo0OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE4LjA3LjIwMjIg
MDk6MTgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBXaXRoIHRoZSB3YWl0cXVldWUgbG9naWMg
dXBkYXRlZCB0byBub3QgdXNlIGFuIGFic29sdXRlIHN0YWNrIHBvaW50ZXINCj4+IHJlZmVyZW5j
ZSwgdGhlIHZDUFUgY2FuIHNhZmVseSBiZSByZXN1bWVkIGFueXdoZXJlLg0KPj4NCj4+IFJlbW92
ZSBWQ1BVX0FGRklOSVRZX1dBSVQgY29tcGxldGVseSwgZ2V0dGluZyByaWQgb2YgdHdvIGRvbWFp
biBjcmFzaGVzLA0KPiBJIHVuZGVyc3RhbmQgeW91IG1lYW4gdHdvIGRvbWFpbl9jcmFzaCgpIGlu
dm9jYXRpb25zIGhlcmUsIGJ1dCAuLi4NCj4NCj4+IGFuZCBhDQo+PiBsb2dpY2FsIGNvcm5lciBj
YXNlIHdoZXJlIHJlc2V0dGluZyB0aGUgdmNwdSB3aXRoIGFuIG91c3RhbmRpbmcgd2FpdHF1ZXVl
DQo+PiB3b3VsZCBjcmFzaCB0aGUgZG9tYWluLg0KPiAuLi4gc29tZSBvdGhlciBkb21haW4gY3Jh
c2ggaGVyZT8NCg0KT25lIG9mIHRoZSB0d28gYWJvdmUuwqAgSXQncyBtb3JlIHRoYXQgcmVzZXR0
aW5nICh3b3VsZCBoYXZlKSBicm9rZW4gdGhlDQphZmZpbml0eSBhbmQgd291bGQgaGF2ZSB0cmln
Z2VyZWQgdGhlIGRvbWFpbiBjcmFzaC4NCg0KPg0KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gSSBhc3N1bWUgeW91J3ZlIGNoZWNr
ZWQgdGhvcm91Z2hseSB0aGF0IGNhbGxpbmcgY29kZSBoYXNuJ3QNCj4gZ3Jvd24gZGVwZW5kZW5j
aWVzIG9uIGV4ZWN1dGlvbiBjb21pbmcgYmFjayBvbiB0aGUgc2FtZSBDUFU/DQoNClVyZ2ggeWVz
LCBteSB0cml2aWFsIHRlc3QgY2FzZSBkaWRuJ3QgZW5jb3VudGVyIGl0LCBidXQgYW55dGhpbmcg
d2l0aCBhbg0Kc21wX3Byb2Nlc3Nvcl9pZCgpIHN0YXNoZWQgb24gdGhlIHN0YWNrIGlzIGdvaW5n
IHRvIGVuZCB1cCB1bmhhcHB5Lg0KDQpJJ20gZ29pbmcgdG8gaGF2ZSB0byByZXRyYWN0IGhhbGYg
dGhpcyBzZXJpZXMuwqAgKEknbGwgZm9sbG93IHVwIG9uIHRoZQ0KMC8kTiB3aXRoIHRoZSBsb25n
ZXIgdGVybSBwbGFuIHRvIHJlbW92ZSB0aGlzIG1lc3MpLg0KDQp+QW5kcmV3DQo=

