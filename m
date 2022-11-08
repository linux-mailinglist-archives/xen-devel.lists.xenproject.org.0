Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770736219FA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 18:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440326.694490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRzq-0004NK-KC; Tue, 08 Nov 2022 17:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440326.694490; Tue, 08 Nov 2022 17:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRzq-0004Ke-HJ; Tue, 08 Nov 2022 17:02:46 +0000
Received: by outflank-mailman (input) for mailman id 440326;
 Tue, 08 Nov 2022 17:02:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osRzo-0004KY-Cd
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 17:02:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27a29b00-5f87-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 18:02:42 +0100 (CET)
Received: from mail-bn8nam04lp2048.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 12:02:39 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by DS7PR03MB5655.namprd03.prod.outlook.com (2603:10b6:5:2c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 17:02:36 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%4]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 17:02:36 +0000
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
X-Inumbo-ID: 27a29b00-5f87-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667926962;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jI8XVAPImvBtlvH0QDbvE7jiKZreGu3vGjC8uVGCc0Q=;
  b=RKR0bfxO/O8FqtPugi3PYUdDppYu/s1gK6KODY03J18OAcCw92TsXRAW
   R6K8SCYTz0DbNHu0HRUP4rFBicRupaPjK03NubkdDitMD5jG2Qy00Bkew
   GOGAxmD8lO8nnU8kcF3T8GatqAd5W5sASYxTWTCBFIlL/w9IS1E/cd0Od
   8=;
X-IronPort-RemoteIP: 104.47.74.48
X-IronPort-MID: 84837486
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LYuBfqJjZepd5IxiFE+REZQlxSXFcZb7ZxGr2PjKsXjdYENS1mRSz
 DcbXTjUaavZYTH3KY8iPYm38EsP65PRy4BqHQplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wRuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5bEW9V1
 vtJFQwHTU2DrM+k2oPqG/FV05FLwMnDZOvzu1lG5BSBUbMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VrpTSDpOBy+OGF3N79d9CURMMTgkGCo
 WHu9GXlGBAKcteYzFJp91r82r+Uwn+rBur+EpW29c9XqU+B/lVNDQZNbwCrpeLjshWhDoc3x
 0s8v3BGQbIJ3E62StjwWTWorXjCuQQTM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht/PkAyZ+9oKcT321/62R6zi1PEA9IWYcaAceQAAC4t2lp5s85jrQSv5zHajzicf6cQwc2
 BiPpSk6wr8V3cgC0v3n+Uid22784J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1UdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:bwZuq6HLpPHT5q51pLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTjLJr0Unp91yy6
 RNwiaQsIdWFwrJmGDn68HPTAwCrDv8nZKz+dRj8EC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2PwqT+GLEXQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84837486"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg7N7g9WAyY+45d9Gwqjub6g/IAPsQpT+fyJTbdfk6a+AtU0sL+JOrgn/jZKKiqUkZ+B90nfgn6CNkgmx4a1BjmU6eg3MoIRUpK9wX3phqYzUvGavlEfxSQLSGR/TyPySs/XimX2RR0tJ+2hOR9JsS+97SH3+JCyqIeADmp01FCd/sbxV/8bS5M5QY9tOrbZAHVwC42YArx4DKFPTCQyO6MIH10pURIwjsVxR3Fjl3dOV8xwWUWTuQuMAmWbV1fEi4KkarpecWvAKkexTc2w4IVm2ofOckhXdVPgrcEqCS0DXHG64lz6xODghoukR65RIwE/5wFmMNC8FFGwD6XJvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jI8XVAPImvBtlvH0QDbvE7jiKZreGu3vGjC8uVGCc0Q=;
 b=ffNlGUsyX1F6sy9T0ECrc67PzgUOJTV9HWOWng021iWundEdJZU9S9oyFmx2rjpKItg2eGAr+fa3KqZrneKFNJJOyILH2bncncST4nvEdyG+YeqHjdJjLytt9zcS3uw/48CsPi8iRTQpk+FKW7BOoEQr9DB/xHJBbE8+d+/N1i4cP44E5vceLpKk47fTG0idijuTu9fswiXX/f/8Tm+OJbnJ2swlWE3L7+t+xYwjrjQgJFirUF0pMRpO+/hK41mDS4ORH4wAxZ6Ub1ZgNpNmDSKfCKbiSKMCLcc1iVDYk2p8CURWvq/5AYGZoNOJRVHzmM1JCgde7Ii3omoaGo41JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jI8XVAPImvBtlvH0QDbvE7jiKZreGu3vGjC8uVGCc0Q=;
 b=G4fh1A1L2kPUIpNnrvDZleduKzI9fUx/d9MXTi0Zw0w46T0MFBk1zphAUPkMaBfM+Om0xOFvUcWd2k8z7jVK1aaeNKoPinFS3gyr8CnLFKDPA592nniI9wSomtXwBOUrqpE84awndLHK8g1V8MejkJvRnAYqm6RseoZjDKPl+XY=
From: Edwin Torok <edvin.torok@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Topic: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Index: AQHY84fA+Ym2JRve3kKJcIO1APAKeK41MEgAgAAQaIA=
Date: Tue, 8 Nov 2022 17:02:36 +0000
Message-ID: <B27F889D-619C-4D34-92F0-AFB95DA84547@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
 <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
In-Reply-To: <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|DS7PR03MB5655:EE_
x-ms-office365-filtering-correlation-id: 96d7add2-16c0-458d-6cd4-08dac1ab090f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lOEU/FxOqs3TcDl+aSNhzMMHjk+RZKoSz2sHsREs4Cz5DkHsZ9Qv25Nk4NobNZm2+LZoSEE91sLbOABm+UifGQIVy0KjSmVkOIJ0R9Skh54ozuFH3ifw1W52iKuQ50sU1Cj6GtWfQuwWI6poL2KIVD/TjAr8znDfN8bYmTopaKm/OIWtR4AEpUuAnrHo4BjWLVqHUt3sqJ90RR4n4U3XEyk+EbbBSl08e1fQnPXqadicKzE3mEtaMm4I2+80s/3fVdO/U2PXlDMUxpcqBQHq8w3iFDxCw931ebYWimM6vJZhjOf4wmdauQYqagN6UUPCWwOhcYXT943t/NLVPG4ZdF3DqTWL5xYNptfYvnVfw10U6p/x3GqV6xFsfEJLumyvqc7oDugPpReErYAFwi1du8Q4MgfsvwDsfortaQhdyfyfiYcEa0QxrR/Vz+7LeVnb/bkBmbxTh3ieRJYjrGvAAQGFa87vd0FxoRlUzQiLB9rLOz0LnXR/z1Oqg0UV6ejA7l6WmNroNZ6gS9l9PdFQRMa2TuWIenZ3v4xpkCtijJToVAasd1LGVJrBSgF6kstNJ3dkqJO43RqAi7mNlZoyjnGjqz9W6135BoI68TibycNJk3uSv3XNoEgxyxkaM2Y7egBiyJex1wtzrG0GyA3eSRW+wDALlJzmpmcPr/20OZF8v1F96g3Uz/jjLdJ2bTsrqJPlHRTijuwB7l4MLzkTJodJPdDrTYtUQ7est0QJIPXkWjNReLwT1LQOcEI4v4Sm1GKZuM7YV/4AnJh//6h5OAzT7LI3+7N0XhKfrJ0wAU8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199015)(36756003)(122000001)(38100700002)(82960400001)(33656002)(478600001)(38070700005)(83380400001)(86362001)(2906002)(107886003)(186003)(6512007)(66574015)(53546011)(6506007)(26005)(66476007)(91956017)(71200400001)(6486002)(5660300002)(8936002)(316002)(66446008)(2616005)(6916009)(64756008)(8676002)(54906003)(66556008)(66946007)(41300700001)(76116006)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXRwV1ovbEtqQkxHdWhGSVBPbTBjcTREVWJiYVpNT0hRWGdKcXc2dlBxSW84?=
 =?utf-8?B?SnFIV3o4UC94ZE5GcjNNTmZ0U2lPRVBTVU5OazFSM0lUSHlyRnJKRmVGV1Qy?=
 =?utf-8?B?VzBPamRueVd4eTBWY0I4bmlIQndMYXhxV3Y4OERpbnRIdzROdW84aEtmUnRY?=
 =?utf-8?B?ZFdGOFhtZGlGR3JEck1kakdhbm1QZlI2ZFZGN2xFQWhCRWd6NXpMUHl3blFv?=
 =?utf-8?B?UkVvM3d1RHFENWtTSTNLZ0NYckdaMWx3T0VBV2tzaFBxZDMzTHR3NDYrTWZL?=
 =?utf-8?B?UzhvSUF3dDdIcy83VTlmWUxqWFMxVVlvTUlUejEweDQyR09WdHdGNDZPL0M2?=
 =?utf-8?B?THRGdVpwMmY2SUZPaGZFYTBUTTBFVG5GckZURmlCbVh4VmV1b1hJNElSSUxE?=
 =?utf-8?B?RWdkRnpuKy9GcFhEWWpDS3dYT0l5enpDRnRFT1NNZC9Na2wycThFVS9mWDdF?=
 =?utf-8?B?d3NsY081ZExFZ2dZZ2ZVZ1VNRzJMazFxWmFZTFU1YWVTWEtBVXhJVHg1SmQ1?=
 =?utf-8?B?cU5tMHNQK3AyZ09LdFFvNVpGNDV4OWcrNzVPelN0bS9IeGV6ckZrV1YrZUti?=
 =?utf-8?B?TW52SGZDNHBkQ2ZBSkpzTzZaZGUySHZsMzdPcWdZbGpyY2tKNk9qbEdrSHJE?=
 =?utf-8?B?c09SN2tqWWwyUFpDQ29mVWFnd0xTRGVqMHRZaVVvcC9wNmdtSlBDYStNNndE?=
 =?utf-8?B?T3VveUtWRnlVRTlaeFZGOWNMdmJ2RGRVL3VmaU52UjIwZU05OUZWemZIUmx2?=
 =?utf-8?B?OHBZNys2aWJzUkp0S2FmcHpreDZnOXFid2pNN05SYmRrYVkwaUJOak5Tdm4v?=
 =?utf-8?B?YlB0V2g3T1pkSWxmUmF6YWhzT29EckVYQjhDMi9RSVVoNFd2NGdwYVNTbS8v?=
 =?utf-8?B?QVo4YUk5azFkb2w1ZWYzUVpTd1dJQkhpWWdKaG5NOURtV2VaMDBQek05anM3?=
 =?utf-8?B?dm40WUFnNTNTQVlVNjN5c1FHWlJRenN2WjJQaytXT0hYSllLaEd6aVpUNXhF?=
 =?utf-8?B?MkY0NHF1bTZpSW5RVUtmTzBWeVVsMVRnbWM1b1I1dlpIU3dkTnlsbWZDVDcy?=
 =?utf-8?B?M0kvMFNVbzFGbFFUNTVUakZ2OG1TbGNOdXBRL01sbStEUFlJZzR4SENRWTlX?=
 =?utf-8?B?RE11dGVndmZPbk1vUnFodXhIcG95VElVcjdVWG52Q3VIQW9EZzZhNlZXbTcz?=
 =?utf-8?B?bzNrWko5V3ZKQmg3d2IrQmlvbnZPd3E5UkV1U2YxRDhDSUJIb2dueGd2QWg1?=
 =?utf-8?B?blF5TTkwN3pwRnkwNCtISnBqVEloaGVNYkNSSmlrYlJxZVVFUEdZWHhFcEpz?=
 =?utf-8?B?Qng5V1MxTzMyL1BvdTNsRHJmMEV4eTVDR0VCbC9DU2JsUEZZY1IwbXJ3VEdY?=
 =?utf-8?B?bWsyc2ZzWWhpQlBCK0huYlo2ZFVlSDRaa2FLZHpiakwrNVB6V2JqOEJCQUlp?=
 =?utf-8?B?eTZJNkhnSkhndjQyRWdGclRyRVFHK3hEQ0Rpa3VPM3I1ZTBWcjQ3V2QwVVJZ?=
 =?utf-8?B?UGRjZmdlYThFUnJBazlCc0RSenErOEpLWlNnQUEvblRaYXpyYmQ3MW45SzV4?=
 =?utf-8?B?aXhTRWY3YjF1Y2JZbTduWWx5NDZ2QzV5QVJSLzZmTGF1V2FuZklKREJmSENP?=
 =?utf-8?B?QUNpcm1BSCticWtPczRKaTdxbEFjbnJzdW9iRmlWalVQTklzUDZxaUx6a1RM?=
 =?utf-8?B?RUIvSExURnJwRjdqN1huY3pSZlpySC9Mcm5xcm5uOElJajZJd3ZhZFpMU01K?=
 =?utf-8?B?Y2VycDVKWjFpamhvcm1oY3NhOTBIdnVmK2tpK29vQ1BDeHk0NEIvcFFINzZm?=
 =?utf-8?B?QktwbU5ndWZoS1FNQzhwSVBjVEhENndhL3VPTXllRDh4RmVLc25mTnJScUta?=
 =?utf-8?B?T1JXM241ekZ3eEo2VVB5MUxzSi9NV0sxdENCN2d0Yi9uQ0daOGtORk00SlNT?=
 =?utf-8?B?YTBmQjRYaEUrOTRtNi94bi9keEVuN21oWENJVE0yOG5SY1RZMnBWYUx5OTNV?=
 =?utf-8?B?K1dVY2NyeUR3MGRvRTdXMUkzWTBOaURDVHpQUFRCcmI5a2EzOU55azViMyt2?=
 =?utf-8?B?NTE5c3JqbUU2NXBYMHpNWFVnL0lTbTJ0eFh2OHV1Rmd6Q0RBQUVKQlViV08w?=
 =?utf-8?B?bFNINW4rcDZxZ3BzdUY1RnRZdGs1Z3ZsTStEOHQ3Wm1UR0ZRYnNKanRpSG9s?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <58C53D70DD80C04EB6DF0BC7BED0EB49@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d7add2-16c0-458d-6cd4-08dac1ab090f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 17:02:36.1764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D6y0T9aR9I5/cEcXC5FomMwZnNst/UA3pARVjwI2PpAEtxBm8ak4ZBwo4Tz5ls2xYpqDDcOBEk02JKpvybVJ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5655

DQoNCj4gT24gOCBOb3YgMjAyMiwgYXQgMTY6MDMsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiAwOC8xMS8yMDIyIDE1OjMzLCBFZHdpbiBU
w7Zyw7ZrIHdyb3RlOg0KPj4gU2VlIENPRElOR19TVFlMRTogWGVuIHVzZXMgc3BhY2VzLCBub3Qg
dGFicy4NCj4+ICogT0NhbWwgY29kZToNCj4+IFVzaW5nIGBvY3AtaW5kZW50YCBmb3Igbm93IHRv
IGp1c3QgbWFrZSBtaW5pbWFsIG1vZGlmaWNhdGlvbnMgaW4NCj4+IHRhYnMgdnMgc3BhY2VzIGFu
ZCBnZXQgdGhlIHJpZ2h0IGluZGVudGF0aW9uLg0KPj4gV2UgY2FuIGludHJvZHVjZSBgb2NhbWxm
b3JtYXRgIGxhdGVyLg0KPj4gKiBDIHN0dWJzOg0KPj4ganVzdCByZXBsYWNlIHRhYnMgd2l0aCBz
cGFjZXMgbm93LCB1c2luZyBgaW5kZW50YCBvciBgY2xhbmctZm9ybWF0YA0KPj4gd291bGQgY2hh
bmdlIGNvZGUgdG9vIG11Y2ggZm9yIDQuMTcuDQo+PiBUaGlzIGF2b2lkcyBwZXJwZXR1YXRpbmcg
YSBmb3JtYXR0aW5nIHN0eWxlIHRoYXQgaXMgaW5jb25zaXN0ZW50IHdpdGgNCj4+IHRoZSByZXN0
IG9mIFhlbiwgYW5kIHRoYXQgbWFrZXMgcHJlcGFyaW5nIGFuZCBzdWJtaXR0aW5nIHBhdGNoZXMg
bW9yZQ0KPj4gZGlmZmljdWx0IChPQ2FtbCBpbmRlbnRhdGlvbiB0b29scyB1c3VhbGx5IG9ubHkg
c3VwcG9ydCBzcGFjZXMsIG5vdCB0YWJzKS4NCj4+IENvbnRhaW5zIGEgYnVnZml4IGZvciBgYWJp
LWNoZWNrYCBzY3JpcHQgdG8gaGFuZGxlIHRoZSBjaGFuZ2UgaW4gdGhlDQo+PiBhbW91bnQgb2Yg
d2hpdGVzcGFjZS4NCj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPj4gU2lnbmVkLW9mZi1ieTog
RWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCj4+IC0tDQo+PiBSZWFzb24g
Zm9yIGluY2x1c2lvbiBpbiA0LjE3Og0KPj4gLSBtYWtlcyBpdCBlYXNpZXIgdG8gYmFja3BvcnQg
Y2hhbmdlcyBmcm9tIG1hc3RlciB0byA0LjE3DQo+IA0KPiBSaWdodCwgYnV0IHlvdSB3aWxsIGhh
dmUgdGhlIHByb2JsZW0gd2hlbiBiYWNrcG9ydGluZyB0byA0LjE2IGFuZCBvbGRlci4gU28gdGhl
IG92ZXJoZWFkIHdpbGwgYWx3YXlzIGJlIHRoZXJlIGZvciBhIGNvdXBsZSBvZiB5ZWFycy4NCg0K
DQpUaGVyZSB3aWxsIGFsd2F5cyBiZSBtb3JlIHRoYW4gb25lIFhlbiByZWxlYXNlIGluIHN1cHBv
cnQsIHdoaWNoIG1lYW5zIHdlJ2QgbmV2ZXIgYmUgYWJsZSB0byBmaXggdGhpcy4NCkF0IHNvbWUg
cG9pbnQgd2UgbmVlZCB0byBkZWNpZGUgdG8gZ28gYWhlYWQgYW5kIGp1c3QgZG8gaXQgKHdoaWNo
IG1heSBvciBtYXkgbm90IGJlIDQuMTcpDQoNClRoZSB3aGl0ZXNwYWNlIGZpeHVwIG5lZWRzIHRv
IGhhcHBlbiBzb21ld2hlcmUgYW55d2F5LCB0aGVyZSBhcmUgYSBjb3VwbGUgb2Ygb3B0aW9uczoN
CiogdXNlIGdpdCByZWJhc2UvY2hlcnJ5LXBpY2sgLVhpZ25vcmUtc3BhY2UtY2hhbmdlIHRvIGF2
b2lkIGJhY2twb3J0IGZhaWxpbmcgdG8gYXBwbHkNCiogZG8gYSByZWZvcm1hdCBvbiA0LjE2IGJy
YW5jaCB0b28gKGJhY2twb3J0IHRoZSBjb3VwbGUgb2YgbGluZXMgb2YgTWFrZWZpbGUgY2hhbmdl
IGFuZCBydW4gJ21ha2UgZm9ybWF0JyBhbmQgY29tbWl0IHRoZSByZXN1bHQpDQoqIGluY2x1ZGUg
dGhlIHJlZm9ybWF0IGFzIGEgcHJlcmVxdWlzaXRlIG9mIHRoZSBuZXh0IHNlY3VyaXR5IHBhdGNo
IChJJ2QgcHJlZmVyIG5vdCB0bywgaGVuY2UgaW5jbHVkaW5nIGl0IGluIDQuMTcpDQoqIGRvIHRo
ZSB3aGl0ZXNwYWNlIGZpeHVwIHByaW9yIHRvIHN1Ym1pc3Npb24sIHR1cm5pbmcgYSBjb3JyZWN0
bHkgZm9ybWF0dGVkIHBhdGNoIHdpdGggc3BhY2VzIGludG8gYW4gaW5jb3JyZWN0bHkgZm9ybWF0
dGVkIG9uZSB3aXRoIHRhYnMuIEkgd291bGRuJ3QgaGF2ZSBtaW5kZWQgZG9pbmcgdGhpcyBpZiB0
aGUgY29kaW5nIHN0eWxlIHNhaWQgdGFicywNCkkgY291bGQndmUgcnVuIG15IHJlZm9ybWF0IHRv
b2wgbG9jYWxseSBhbmQgZml4IGl0IHVwIHdpdGggJ3NlZCcgcHJpb3IgdG8gc3VibWlzc2lvbi4g
SG93ZXZlciB0aGlzIHNlZW1zIHVubmVjZXNzYXJ5IG92ZXJoZWFkIGlmIGRvaW5nIHRoaXMgd29y
a3MgYWN0aXZlbHkgYWdhaW5zdCB0aGUgZXhpc3RpbmcgY29kaW5nIHN0eWxlLg0KDQpIb3dldmVy
IGlmIHdlIHB1dCB0aGlzIGludG8gNC4xNyBhbmQgdGhlcmUgYXJlIG5vIG5ldyBzZWN1cml0eSBp
c3N1ZXMgZGlzY292ZXJlZCBiZWZvcmUgNC4xNiBnb2VzIG91dCBvZiBzdXBwb3J0IHRoZW4gd2Un
bGwgYmUgaW4gYSBtdWNoIGJldHRlciBwb3NpdGlvbiBmb3IgNC4xOCBvbndhcmQuDQpUaGVyZSBp
cyBzdGlsbCBxdWl0ZSBhIGxvdCBvZiB3b3JrIG91dHN0YW5kaW5nIGluIHRlc3Rpbmcgb2Ygb3hl
bnN0b3JlZCAodXBkYXRpbmcgbXkgZnV6emVyIGZvciBvbmUpLCBzbyBJIGNhbid0IHJlYWxseSBw
cmVkaWN0IGF0IHRoaXMgcG9pbnQgd2hldGhlciB0aGVyZSBhcmUgbW9yZSBzZWN1cml0eSBidWdz
IGluIG94ZW5zdG9yZWQgb3Igbm90LA0Kc28gbWF5YmUgd2UgbmVlZCB0byB0YWtlIHRoaXMgZGVj
aXNpb24gYXQgNC4xOCB0aW1lPyBOb3Qgc3VyZS4NCg0KPiANCj4+IC0gYXZvaWQgcGVycGV0dWF0
aW5nIGEgZGlmZmVyZW50IGNvZGluZyBzdHlsZSAoSSB0aG91Z2h0IHRhYnMgd2VyZQ0KPj4gICBt
YW5kYXRlZCBieSBYZW4sIGFuZCB3YXMgYWJvdXQgdG8gZml4IHVwIG15IGVkaXRvciBjb25maWcg
dG8gbWF0Y2gNCj4+ICAgd2hlbiBJIHJlYWxpemVkIFhlbiBhbHJlYWR5IG1hbmRhdGVzIHRoZSB1
c2Ugb2Ygc3BhY2VzKQ0KPj4gLSBzaG91bGQgbWFrZSBzdWJtaXR0aW5nIHBhdGNoZXMgZm9yIE9D
YW1sIGVhc2llciAoT0NhbWwgaW5kZW50YXRpb24NCj4+ICAgdG9vbHMga25vdyBvbmx5IGFib3V0
IHNwYWNlcywgc28gSSBlaXRoZXIgY2FuJ3QgdXNlIHRoZW0sIG9yIGhhdmUgdG8NCj4+ICAgbWFu
dWFsbHkgYWRqdXN0IGluZGVudGF0aW9uIGV2ZXJ5IHRpbWUgSSBzdWJtaXQgYSBwYXRjaCkNCj4+
IC0gaXQgY2FuIGJlIHZlcmlmaWVkIHRoYXQgdGhlIG9ubHkgY2hhbmdlIGhlcmUgaXMgdGhlIE1h
a2VmaWxlIGNoYW5nZQ0KPj4gICBmb3IgdGhlIG5ldyBydWxlLCAnZ2l0IGxvZyAtcCAtMSAtdycg
c2hvdWxkIGJlIG90aGVyd2lzZSBlbXB0eQ0KPiANCj4gV2hpbGUgSSB1bmRlcnN0YW5kIHRoZSBn
b2FsIGFuZCBzdXBwb3J0LCB0aGlzIHNlZW1zIHRvIGJlIGEgYml0IHRvbyBsYXRlIHRvIGRvIGl0
IGluIFhlbiA0LjE3ICh3ZSBhcmUgb25seSBhIGNvdXBsZSBvZiB3ZWVrcyBhd2F5KS4gQXQgdGhp
cyBzdGFnZSBvZiB0aGUgcmVsZWFzZSB3ZSBzaG91bGQgb25seSBkbyBidWcgZml4Lg0KDQpJIHRo
aW5rIGl0IGNhbiBiZSBmYWlybHkgZWFzaWx5IHByb3ZlbiB0aGF0IHRoZXJlIGlzIG5vIGZ1bmN0
aW9uYWwgY2hhbmdlIGJ5IHJlcnVubmluZyB0aGUgbWFrZSBmb3JtYXQgY29tbWFuZCBtYW51YWxs
eSwgYW5kIGJ5IGxvb2tpbmcgYXQgdGhlIGRpZmYgd2l0aCBpZ25vcmUgd2hpdGVzcGFjZSBhcyBz
dWdnZXN0ZWQgYWJvdmUuDQpJIHVuZGVyc3RhbmQgdGhlIHJlbHVjdGFuY2UgaW4gaW5jbHVkaW5n
IGl0ICh3aGljaCBpcyB3aHkgSSB3YXMgbm90IHN1cmUgd2hldGhlciB0byBwb3N0IGl0IGluIHRo
ZSBmaXJzdCBwbGFjZSksIGJ1dCBJIHRoaW5rIGl0IG1pZ2h0IGJlIGJlbmVmaWNpYWwgdG8gZG8g
aXQuDQpUaGVyZSBpcyBhIGxhcmdlIGJhY2tsb2cgb2Ygd29yayBpbiBveGVuc3RvcmVkIHRoYXQg
Z290IHBpbGVkIHVwIGR1cmluZyB0aGUgcGFzdCBjb3VwbGUgb2YgeWVhcnMgb2YgWFNBIHdvcmss
IGFuZCBpdCdkIGJlIGEgbG90IGVhc2llciB0byB1cGRhdGUgYW5kIHVwc3RyZWFtIHRob3NlIGlm
IHdlIHdvdWxkbid0IGhhdmUgdG8gd29ycnkNCmFib3V0IGluZGVudGF0aW9uIGF0IGFsbC4NCg0K
VXN1YWxseSBwYXRjaGVzIG9uIExDTSBhbmQgc2VjdXJpdHkgYnJhbmNoZXMgYXJlIGF2b2lkZWQg
dG8gcmVkdWNlIHRoZSByaXNrIG9mIGJyZWFraW5nIGFueXRoaW5nLCBidXQgYSByZWluZGVudGF0
aW9uIHBhdGNoIHNob3VsZCBub3QgcmVhbGx5IGJyZWFrIGFueXRoaW5nICh3ZWxsIG90aGVyIHRo
YW4gdGhlIGFiaS1jaGVjayBzY3JpcHQgaW4gdGhlIGJ1aWxkLCBidXQgSSBmaXhlZCB0aGF0IHRv
IGFjY2VwdCBib3RoIHdheXMpLg0KDQpPbmUgYWx0ZXJuYXRpdmUgd291bGQgYmUgdGhhdCBJIGFk
ZCBhbm90aGVyIHN0ZXAgYWZ0ZXIgcmVmb3JtYXQgdGhhdCBydW5zIHNlZCBhbmQgdHVybnMgc3Bh
Y2VzIGJhY2sgaW50byB0YWJzIGZvciBub3csIGFuZCB0aGF0IHdheSBJIGNhbiBzdGlsbCBydW4g
J21ha2UgZm9ybWF0JyBhdCBlYWNoIHN0ZXAgd2hpbGUgcHJlcGFyaW5nIHBhdGNoZXMgZm9yIG1h
c3Rlciwgb3IgNC4xNyBvciBzZWN1cml0eSBwYXRjaGVzIGFuZCBnZXQgc29tZXRoaW5nIGNvbnNp
c3RlbnQsIGFuZCB0aGF0IG1pbmltaXplcyBvdGhlciB3aGl0ZXNwYWNlIGNoYW5nZXMsIGJ1dCBp
dCB3b3VsZG4ndCBjb21wbGV0ZWx5IGVsaW1pbmF0ZSB0aGVtIChlLmcuIHRoZXJlIGFyZSBwaWVj
ZXMgb2YgY29kZSB0aGF0IGFyZSBqdXN0IHdyb25nbHkgaW5kZW50ZWQsIHNvIHRoZXJlJ2QgYmUg
YXQgbGVhc3QgYSBkaWZmIHRvIGZpeCBhbGwgdGhhdCkuDQoNCj4gDQo+IFRoaXMgaXMgY2xlYXJs
eSBvbmx5IGEgY29tZXNtZXRpYyBjaGFuZ2UgYW5kIHRoZXJlIEkgd291bGQgYXJndWUgdGhpcyBz
aG91bGQgYmUgZGVmZXJyZWQgdG8gNC4xOC4gVGhhdCBzYWlkIHRoZSBsYXN0IGNhbGwgaXMgZnJv
bSB0aGUgUk0uDQoNCg0KQmVzdCByZWdhcmRzLA0KLS1FZHdpbg0KDQo+IA0KPiBDaGVlcnMsDQoN
Cg0KPiANCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

