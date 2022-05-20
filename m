Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2C952EE90
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 16:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334386.558398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns44w-0000eH-5I; Fri, 20 May 2022 14:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334386.558398; Fri, 20 May 2022 14:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns44w-0000cG-2P; Fri, 20 May 2022 14:58:10 +0000
Received: by outflank-mailman (input) for mailman id 334386;
 Fri, 20 May 2022 14:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcqf=V4=citrix.com=prvs=1324d257b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ns44u-0000c7-KL
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 14:58:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40fb233e-d84d-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 16:58:07 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 10:58:04 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by DM6PR03MB5177.namprd03.prod.outlook.com (2603:10b6:5:22b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Fri, 20 May
 2022 14:58:01 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::6d0d:b9fa:6b59:36d4]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::6d0d:b9fa:6b59:36d4%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 14:58:01 +0000
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
X-Inumbo-ID: 40fb233e-d84d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653058687;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bwX4mSYgR9u+NMfq7GY0/SZf2/CRLgGzbn3igJFoc2w=;
  b=IwAriHVGAbSWdBJFRXNeo6xf/hKNFADBM1nW7N2gMi0Za1T86BFqd8W+
   QFn0j/9V5UsPryI5pzCtqshbBv5BGdRCbGixfSKFq/aAxzHWJVR1GaghZ
   qLka62J7vXm+fsXXkHFFl3fQWp+yUOhceG5LuYDwFm1c/InDWx6MWcFeN
   s=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 71170316
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:skpnhaKiAxVSki+vFE+RopQlxSXFcZb7ZxGr2PjKsXjdYENS1z0Fy
 2AcWWGDP/7YZ2fwetwjbYTk9B4H7JDRmNJnGQRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Qw2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OkTsZqdTRYUB6nRpsUzekJEHjFCYKITrdcrIVDn2SCS52vvViK1ht9IXAQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMCFGvuajTNb9G5YasRmNPDSf
 ccGLxFoawzNeUZnMVYLEpMu2uyvgxETdhUH8QvK/fFuvQA/yiQh+4DUCNDnWueDXN5yrEiUv
 j7j4XXAV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQMDDUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4LgEhwASEy66R6QDJAGEBF2dFcIZ/6p9wQiE23
 FiUmd+vHSZorLCeVXOa8PGTsC+2Pi8Wa2QFYEfoUDc43jUqm6lr5jqnczqpOPTdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:Vj5RpKyn+V3+GAz8Qq3LKrPxdegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7kvZKqm72EeNt9MbsBuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGbf2RYUh27D3xnklWavo3RiKmrwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7FjDsJCy8zBrZLQQF6+YUFrlde8qPMCBcCeU+
 qvOfttcoreEVc=
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71170316"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCx8aMUPPU8Rh0eXi62dVitGRVANiJUxqhKM5fnGuuGwOwwCqqP2Ka1Yt6vV2EUjGNdUR+FBWXmz1IJC43JXpTJfhhdt0SWmva4J1kJM+qNuIi18FH4sLPju7XonEbpKIYyNKwQVuiAfasfaAEgnaXZBh/y382+D63GgHJLUVMWin1l2LZb5b0s++RyU5dBwRsojoWWqQnc3M1RnY3loobbuK75JjO5X6GqcQy76Y4mS7WN7Kx5UQFmC/4Gkby6Nz12o3+LSE2w9JHCuxqBHNFL8GiyVkqye/dfpEvr4ZoinSIOlQdUQO90C136ipWb8pMojNUpm/QTd/58kBwLBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwX4mSYgR9u+NMfq7GY0/SZf2/CRLgGzbn3igJFoc2w=;
 b=UZiioI0PQ8qxM3MNI/eFMThzf3s9nVeCatbpJD3aOxJpyz/X0mBgRP/apl+3otbPEeS6ZXSOuxqAXJZjeE3rL/YELZV9oZGjD/Flci8K6dhrvDuR3uylxDiacDq7Iyr4mSYGli6h2FAWkqPRJUEnJCj46k3SyjycC6A/IZLqcXciha0K6Pgqb29kwmaJGYhu1r17Zm7/+JTMvfdHI+5jCt/mhhbw0JBe1HtXpD/3wcgfozWd9ahUyMi86j0fdXJWxEBXTJnGO+s4SfdJdIulY+oB26UfIevY8BD16Dh7oSswgEaeV0vvIGO8a/vV8C5MTriL85B0hdFjvFcJhCTT5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwX4mSYgR9u+NMfq7GY0/SZf2/CRLgGzbn3igJFoc2w=;
 b=hVafZZ+KmYLiAltaLaf0VeVYmwktq/cdpy7gxECLv0vQaLjWAxY10JyAsELD9bN23b+7sj0e47YhiEBwGEX+gEIbShZsuqETBbfET1X2XhN/GgaSnuTnO7wjkTopyod0gIQQmFBWuyb8NNKZ7bXEOrQEqByrdLdSMJBrpnJK4dc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/5] x86/perf: expose LBR format in PERF_CAPABILITIES
Thread-Topic: [PATCH 3/5] x86/perf: expose LBR format in PERF_CAPABILITIES
Thread-Index: AQHYbE7auBjYBybQdEGztrNyxSKPiK0nzhyAgAACdoCAAArQgA==
Date: Fri, 20 May 2022 14:58:01 +0000
Message-ID: <e4d202f7-f4db-71e6-46a1-ee62ef41f2dd@citrix.com>
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-4-roger.pau@citrix.com>
 <33632dc6-940f-6737-c808-48e6c28fc0bf@citrix.com>
 <42cac54e-134b-dcfd-3ce1-1d6bfae9176c@suse.com>
In-Reply-To: <42cac54e-134b-dcfd-3ce1-1d6bfae9176c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ab1671c-8779-4a8e-f267-08da3a7122c4
x-ms-traffictypediagnostic: DM6PR03MB5177:EE_
x-microsoft-antispam-prvs:
 <DM6PR03MB51770E02356D34E6012E9E16BAD39@DM6PR03MB5177.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5xQnMAL5jlLTIccNBuxF9yUAy6EzAbyk/JbkRt9mev8AIBeMJN2D4B6RPy1LQXMPrAhU2HDfTP3LKG4VAC2v0FBxq9FlZ8oo4zY5mXtLRygj2H9CG5KXOs1dsRzIBF+ZIeu7oK6/jgFhUZjSx5g7rR6B1uK0uUB+C1+SbqH/ZpZBSveII/xrxfyFic1Ztvd/6rkevnQkoDMl46o+7/S+kydZe2B0zVrhjyo53Le35ghCGiv+p1w7k8ji+MCpwGF6RPtjTkwRtRcARC2DDbHshLVs82Kpge7hPseBYNSFKJUgENHoVTGRkL76GYy1S9mB5sPJWKdxvPBs9jWocbMonMk0YsZjrmak0z0JwbPsgoAefXnCSgyTa+x4MdfHiE+2R7bnvS3Kx7oAjqNBypGM83gA4VWpeoTTg3Z3XVWHaNMZGfoZj3hR5ndFINRrZz+u+zYZ+NgFxoVN1jcSwhR/SzuIT4VFi8qfrHRZDf45V8hctFh3RjBjRROThjD2sQmHInOdnZhUNAuamIfEiQA636FFOC+oc+yTrTdftJ2z62SzUUShBGjIRkZKNLphKxH81e9pr3aVG1zm7itB9GkbmfH909lg5vKaKVOnj6JIB4Id3B6O5n6NGWsfKqhluVwR7rk2nosuUBru8sIsNLJSM0wQ9REZglIAQluN3gSpWt7B86q8kf5NrXcw0R2az5tWQnaex3moOwK3wwbd4+QufHseyvcuoGqFIwEsJBjkq5bQ4dTswxxapkJ5mFLYlB9HVfPXvpHXfpUDUIf4xnrA3g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(38100700002)(38070700005)(83380400001)(36756003)(31686004)(508600001)(2906002)(5660300002)(186003)(4326008)(76116006)(66446008)(8676002)(2616005)(316002)(31696002)(6916009)(54906003)(91956017)(8936002)(86362001)(66946007)(6506007)(71200400001)(26005)(53546011)(82960400001)(122000001)(66556008)(66476007)(64756008)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?alVXdS9YeCtzclBUQjRmMFVUSHBrdFVJRlNXRVpvazFTUXFFRlE2ZmZpRjVV?=
 =?utf-8?B?ZTBWaEhuWjYxNXRTZk54UHRoT0FPd1ZpaEFXMlZndjh2ZE1xTDdpTkdlcjVX?=
 =?utf-8?B?U3d5bTNwdmw2bXlEK2VreGIycmw3S014Rjl6cXBsR2pSdnArQ0tzbUtJN1pn?=
 =?utf-8?B?bzFMRGJvVUZyZDA2dVExK0FVTlJEb09VdWdEenZtN1NHZFI1VWlHdFg2YTF0?=
 =?utf-8?B?bDgydkRpYkZzdGovVEdkVlZpU096dHpTckNDaFZnTkE3d1paeXpOUzIrdllm?=
 =?utf-8?B?VzUzZ0E5M254aWxJdEZkSE52N2UzOHpyTlh4NmpQNlQ4UWhRbjNvNWpDc0kz?=
 =?utf-8?B?ajZGMTh6Q0FnSEg5ZWhpc2NmN3l4czVZcmxVQkN6dTVmNHpnNEVvWkMzWjNU?=
 =?utf-8?B?dXhFYTErUHAxVDdNVnJ3QmRhUUlUM1N5eXpPS1BjZEF3U01ZVUp1UzA2OE9y?=
 =?utf-8?B?eVQyQStPVXUwSnhoVndYdDQ2ZlRYRnU2VENDUlhIM01ZelhKT1Z1RG94MDhi?=
 =?utf-8?B?dm0zejZVMzY2OXJDMTk0aUg0RDRFWUdMYVQ4clJTZUR0MDdjcjNMVTV0THhn?=
 =?utf-8?B?b1EvZGI3WUZ2YytCNUZZM1NRMUJjeXRTcmtmclZIek90RnFFYzFvMWdWdmdO?=
 =?utf-8?B?SFlYWUQwRlZTand2eGRaZG9qZStrRnJkY2dTTFdlVVZqY2xlWGFmdnY5VFRM?=
 =?utf-8?B?a0dRa0FPQmFWMFc2MDNQckhYL3JoSGVyTDdOWUR6TDdOMzIxMU5zKzhJS2tp?=
 =?utf-8?B?OFB0d21aWG1tckE4SGdSMjNKSDZVa01qR3UyV2ZjYm9vb3pTWEhUSmoxcXht?=
 =?utf-8?B?WTI2NEsvUFJEcHFqUGNWMmxmaXMzcUphSm9ZdnU2bzRNcm56eklSLzYxLzhV?=
 =?utf-8?B?WjlKU3o1WTNuY2tGOWE3a3VWMnc3WjFwV3JDeVR0RklYVDF1N2ZVY0JWeDJV?=
 =?utf-8?B?NzFKdkRnS0xrZ2NRUm5Pd2Z0UHI3czNEWVNvUFlKUGRoZTRoNWZnLzBKa0Fj?=
 =?utf-8?B?MzkzVGFuUXhwQXpNWHc1RTNoeGNleVpodlFyenVxRFQyQkd5ZkpmZmRZY1o1?=
 =?utf-8?B?NVZObnpTcC8reVVheEFId2ZCZjlmRG9ISThzdHlaM1VTdkpPeHcwaXdrRzhJ?=
 =?utf-8?B?N2xuamFwTDR0Y2oraUVXY01vbWhzME9PSWV3NnFGekh3Sm9odVcxL3NiWXB2?=
 =?utf-8?B?YitVT3p1T3VTcitHakRacHZiS0gweVhaU2VEdkwvOHhGTHVIQ3NBQlpQWVQ1?=
 =?utf-8?B?M0RXVEtqbVR4RlVWUFc1NVRGYWFKSGl6aW0wNnU3RExXQkNHcVZybGw5UEhJ?=
 =?utf-8?B?ZDlTcGdRMUVJR0l6NnkrZkJUdTBSbFlIVGZUb3JvQ2F0NnYvYlNmVUlVS2Vz?=
 =?utf-8?B?MDdJdS8vd1U4TmI1RmVvMlF1aTJiMG5QdEp3bnp2VjAwbW0xSndZU3dKbDhK?=
 =?utf-8?B?bEhzY2c2ODhLR21jZ3BiRksvVHB2UlJCUGR1NWtUT2FyczhLQUYyZXMxMGVD?=
 =?utf-8?B?cE56RDkyL2IrMzJLelpoOTRLRVY3am5DYlNkcWx2ejNYZWtEWG9hSkNZK0hh?=
 =?utf-8?B?bWk0V0FnNFVTUGx1SlZNQ2xPMkZ4NytzWHo1bmJTTWRRUGcydVVCZ0d1QlBL?=
 =?utf-8?B?UDFRTHdHZVk3NnFRbWIrS0ZyekJtZ0hZckVsOEpOdXd5STkrZm5JM0lESU1z?=
 =?utf-8?B?M2NSWjQvdVFudkg0OHdRUTU4OE0wanM0djVwRCtYNDZZZEtuRHVyRVpOUDJS?=
 =?utf-8?B?b2lQVmJyQkVGN1RmZm9XVExUYkVWa0dLaWdTdmZEMWdxWVNiSFpYZEdOTFky?=
 =?utf-8?B?Wk9Nek9CNVhtSXpMZzNlc0dPUVlBa3J2N3p2cVdqQnhoWGpucWVqdGQyVlA5?=
 =?utf-8?B?WmxITzMzZzhQM212OEgxTXBhbkVDRk53a0I3bUNTMkR3SHh3ZVBLTUpQMkN4?=
 =?utf-8?B?SWpyR01vU1Z1L3R3bm1HUnVMTkFWbGg5VE1icWZwY0M2cTkxc1RtM08vSTQw?=
 =?utf-8?B?V2NzbEpQUUpvRVFDRUNFbGk1azlRSUNBVnNBSXJmNTY5d29lYXFmaEFKN3RQ?=
 =?utf-8?B?U20xUVJYYUdIK1dQa0xWVU5JSjJxODE5YjgvNStoeHYvcDlCb1p1YmNXaU1S?=
 =?utf-8?B?SWJ2UkFDTjNtMDZnSWwrZGNjRVB5Yk9LbWhxNWNEbVduUFZvRVdYdHhlWEdn?=
 =?utf-8?B?QnlyaEp0ZlRUVnp3dzdQc0FrWmh3TmJidzdjWDRNZGozdTZaeThKSGRCY29R?=
 =?utf-8?B?cFJycUJPTE1FUE0wNm9tREN6QWs1UVlwZTBJRWMyOW5hNU9IeW9vMW05RGc5?=
 =?utf-8?B?WWEzcmQ2NWFTSlNCZDRmcUFQL0VXbDByaktYeVN1MlY1QWhQZDdXSDNsc21F?=
 =?utf-8?Q?OwnkL/4HIZsy0A30=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <166DC331312CAB4FB740FBB23304FACD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab1671c-8779-4a8e-f267-08da3a7122c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 14:58:01.5238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HWVqkhNS/5lDVrPeFJbPoRCd8ntYQcEa9R1y2X93QgOjc6xwSITsFcZGZ6t5jOc9Y68NXreq/8zFlFhGSk2GARwm4NcPB7e50c99nGOgqoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5177

T24gMjAvMDUvMjAyMiAxNToxOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIwLjA1LjIwMjIg
MTY6MTAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMC8wNS8yMDIyIDE0OjM3LCBSb2dl
ciBQYXUgTW9ubmUgd3JvdGU6DQo+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2
L2NwdWZlYXR1cmVzZXQuaA0KPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9j
cHVmZWF0dXJlc2V0LmgNCj4+PiBAQCAtMTM1LDcgKzEzNSw3IEBAIFhFTl9DUFVGRUFUVVJFKFNT
U0UzLCAgICAgICAgIDEqMzIrIDkpIC8qQSAgU3VwcGxlbWVudGFsIFN0cmVhbWluZyBTSU1EIEV4
dGVuc2lvDQo+Pj4gIFhFTl9DUFVGRUFUVVJFKEZNQSwgICAgICAgICAgIDEqMzIrMTIpIC8qQSAg
RnVzZWQgTXVsdGlwbHkgQWRkICovDQo+Pj4gIFhFTl9DUFVGRUFUVVJFKENYMTYsICAgICAgICAg
IDEqMzIrMTMpIC8qQSAgQ01QWENIRzE2QiAqLw0KPj4+ICBYRU5fQ1BVRkVBVFVSRShYVFBSLCAg
ICAgICAgICAxKjMyKzE0KSAvKiAgIFNlbmQgVGFzayBQcmlvcml0eSBNZXNzYWdlcyAqLw0KPj4+
IC1YRU5fQ1BVRkVBVFVSRShQRENNLCAgICAgICAgICAxKjMyKzE1KSAvKiAgIFBlcmYvRGVidWcg
Q2FwYWJpbGl0eSBNU1IgKi8NCj4+PiArWEVOX0NQVUZFQVRVUkUoUERDTSwgICAgICAgICAgMSoz
MisxNSkgLypTICBQZXJmL0RlYnVnIENhcGFiaWxpdHkgTVNSICovDQo+PiBUaGlzIGlzIHRoZSBi
aXQgd2hpY2ggcmVxdWlyZXMgbW9yZSB0b29sc3RhY2sgbG9naWMgdG8gc2FmZWx5IGVuYWJsZS7C
oA0KPj4gVXNpbmcgJ3MnIGZvciBvZmYtYnktZGVmYXVsdCBpcyBmaW5lIGlmIHdlIHdhbnQgdG8g
Z2V0IHRoZSBzZXJpZXMgaW4gbm93Lg0KPj4NCj4+IEJ1dCBiZWZvcmUgd2UgZXhwb3NlIHRoZSBN
U1IgZ2VuZXJhbGx5LCB3ZSBuZWVkIHRvOg0KPj4NCj4+IDEpIFB1dCB0aGUgY29uZmlndXJhdGlv
biBpbiBtc3JfcG9saWN5IHNvIHRoZSB0b29sc3RhY2sgY2FuIHJlYXNvbiBhYm91dCBpdA0KPj4g
MikgUmVqZWN0IG1pZ3JhdGlvbiBhdHRlbXB0cyB0byBkZXN0aW5hdGlvbnMgd2hlcmUgdGhlIExC
UiBmb3JtYXQgY2hhbmdlcw0KPiBTaW5jZSB0aGlzIGNvdWxkIGJlIHF1aXRlIHJlc3RyaWN0aXZl
LCBhbmQgc2luY2UgcGVvcGxlIG5lZWRpbmcgdG8ga25vdw0KPiB0aGV5IG5lZWQgdG8gaGlkZSB0
aGlzIGZlYXR1cmUgZm9yIG1pZ3JhdGlvbiB0byB3b3JrLCBJIGd1ZXNzIHRoaXMgd291bGQNCj4g
ZnVydGhlciB3YW50IHF1YWxpZnlpbmcgYnkgImRpZCB0aGUgZ3Vlc3QgYWN0dWFsbHkgdXNlIExC
UnMgc28gZmFyIj8NCg0KSW4gcHJhY3RpY2UsIGl0J3MgZXZlcnkgbWFqb3IgZ2VuZXJhdGlvbiAo
InRvY2siIG9uIEludGVsJ3Mgb2xkIG1vZGVsKSwNCnNvIGlzbid0IGFjdHVhbGx5IGxpbWl0aW5n
IHRoZSBraW5kcyBvZiBoZXRlcm9nZW5lb3VzIHNldHVwcyB1c2VkIGluDQpwcm9kdWN0aW9uLsKg
IChNaWdyYXRpb24gZ2V0cyBzdGVhZGlseSBsZXNzIHN0YWJsZSB0aGUgZnVydGhlciBhcGFydCB0
aGUNCnR3byBDUFVzIGFyZS4pDQoNCkFzIHRvIGR5bmFtaWMsIG5vIC0gdGhhdCB3b3VsZCBiZSBh
IHNlY3VyaXR5IGJ1ZyBpbiBhIGNsb3VkIHNjZW5hcmlvLA0KYmVjYXVzZSB0aGVyZSBtdXN0IG5v
dCBiZSBhbnl0aGluZyB0aGUgZ3Vlc3QgY2FuIGRvIHRvIGludGVyZmVyZSB3aXRoDQp0aGUgbWFu
YWdlYWJpbGl0eS4NCg0KVXNlIG9mIExCUiBpcyByYXJlLCBhcyBkZW1vbnN0cmF0ZWQgYnkgdGhl
IGZhY3QgdGhhdCBub29uZSBoYXMNCmNvbXBsYWluZWQgYWJvdXQgdGhlIGZhY3QgdGhhdCBtaWdy
YXRpbmcgc3VjaCBhIFZNIHdpbGwgbWFsZnVuY3Rpb24uDQoNCkFzIHdlIG5vdyBoYXZlIGEgd2F5
IG9mIHJlcG9ydGluZyAibm8gbW9kZWwtc3BlY2lmaWMgTEJSIiwgSSdtIHRlbXB0ZWQNCnRvIHN1
Z2dlc3QgdGhhdCBWTXMgZ2V0IG5vIExCUiBieSBkZWZhdWx0LCBhbmQgc29tZW9uZSB3YW50aW5n
IExCUiBoYXMNCnRvIG9wdCBpbiwgd2hpY2ggaXMgYWxzbyBhbiBleHBsaWNpdCBhZ3JlZW1lbnQg
dG8gdGhlIG1pZ3JhdGlvbiBsaW1pdGF0aW9uLg0KDQp+QW5kcmV3DQo=

