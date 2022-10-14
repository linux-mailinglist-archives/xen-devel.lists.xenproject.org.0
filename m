Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9BC5FF358
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 20:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422979.669414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojP1i-0004Uc-DK; Fri, 14 Oct 2022 18:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422979.669414; Fri, 14 Oct 2022 18:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojP1i-0004SG-AZ; Fri, 14 Oct 2022 18:03:18 +0000
Received: by outflank-mailman (input) for mailman id 422979;
 Fri, 14 Oct 2022 18:03:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JttC=2P=citrix.com=prvs=279f68966=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ojP1g-0004SA-PL
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 18:03:17 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77c9b746-4bea-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 20:03:14 +0200 (CEST)
Received: from mail-bn1nam07lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 14:03:11 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6642.namprd03.prod.outlook.com (2603:10b6:806:1cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 18:03:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 18:03:08 +0000
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
X-Inumbo-ID: 77c9b746-4bea-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665770594;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=a4c9qt6aF2LtXKGOFUoqdx54OpH6S4n66TKVp+mnZXo=;
  b=DHg+UAd1zZ7qA7XrNhFcKSD3MWAUewh7/qMrw5sve9hsctuhVuY0xpxS
   A7sYG3vvWx6d4hnleAbfDNpf1FYDbU89Ep+Ylw7nJPnX3DO/aWJacg2ZX
   YduRATuP1Y6imIQZxquhlyGDH4Pvmk7OyiizEAAV5aGiayMxxOq2wVF65
   U=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 82753914
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:oS4s/K/q8IwmwwncXuBLDrUDin+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mQfWGrUaauIa2L1ftFzbNyy8khSu57dm9M1QQVv/388E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5wBmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uNFHUtDy
 +0mE2EicC+/jMeK0LOZdeY506zPLOGzVG8ekldJ6GmDSNwAGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PNxvze7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+Vwn6gCdtOfFG+3vhun02u+HQoMjE9bXen4terhhCQSd0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 mJlhPvsDD1r9beTEHSU8+/LqSvoYXRKa2gfeSUDUA0JpcH5p50+hQ7OSdAlF7OpitryGnf7x
 DXiQDUCuoj/RPUjj82TlW0rSRr1znQVZmbZPjnqY18=
IronPort-HdrOrdr: A9a23:kUQ8pq5iecnOZ7yH+wPXwWuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStGNwyUGT3fARAghKRfapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG/fIzmZ0Wd9ih33ekIhpTsALz2LCaEVFci18O9vvR3OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208";a="82753914"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbRy7KEq/PBV7QikRWJ1Uk7PrYzJZma8zs8cFOHWirXc0lWelu7VH5bPBq2Lxq2i7TFs/Is9mzMdpFs4SobO6h6i/cOgICgvySgHjlyc26VyxICRHF0rD20iyEH0cafZPAVgM6ccn8v+mjYy6vrMU2SzTcDIskVtR9oBttq1VLZM7Af2IsMdCbsN+FBoAycPniHr9NnmctaPj6RGAQSvzo+mOeYsg4rb1mH00Vrbe8sOQlQKWE2P10n2R8pnx9y+lyvk6U4aN7e9wgq0o/eSnZDdk6ncfdvLgF5/3rEK1iZa0Cj7q+Nhqq3CTgdUdTbraeaAyFdL2bmSFKKEOwoggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4c9qt6aF2LtXKGOFUoqdx54OpH6S4n66TKVp+mnZXo=;
 b=DqKou5VChbCBxZ2pZWptSL94+QRdlDZbqmp6Br2xyhAMZJdWJiZSphkIS3x2KmMTj7PjehZhmUN2jXA5DgeqWHrrrsyZttPTyDjmhTvS2QET6unHuiV7lUM1KLcjIF5mJr8wUQyo6UEC+9GuRALRtXrep0GgzkgZTu7VOAJ1DXQ0aYTxvlavgl1UHAOByiAMkerdR6L+3nkBsIQfUWNP4ZEUh+l6ueZrJ+w9icpW0toQ3sWR7TDrYQXoAbVUh6y4S0T92PYFo8sCUYNTXjxGB1y5Ltrr8PoRvpYOmWtrYdAk2iwWqwc0en7vlQsWRl/YngipmNJAO0ZOtJYlY6lM1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4c9qt6aF2LtXKGOFUoqdx54OpH6S4n66TKVp+mnZXo=;
 b=Kj9w+bMgVfBBNQ/SDXz9aHgpBA3tGtjnVWosWM8WMuBqnfO00u+9Pa/m58PI0oKEZlH87GsfztsUmzRYqhU76y6aScNnt/yk89p2KH51PETIRiUXdMFShbz64ATDd3uB689RLzcSOZJ+J3ZM2VO4Vq4wrWijc6+PQKWvvw563RE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.17 v5 06/17] tools/hotplug: Generate
 "hotplugpath.sh" with configure
Thread-Topic: [XEN PATCH for-4.17 v5 06/17] tools/hotplug: Generate
 "hotplugpath.sh" with configure
Thread-Index: AQHY3wSVK5RceuxC50av0rrVPsGtWa4OMGQA
Date: Fri, 14 Oct 2022 18:03:08 +0000
Message-ID: <0b14827d-28c0-26ae-e13c-cc24219e41fd@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-7-anthony.perard@citrix.com>
In-Reply-To: <20221013130513.52440-7-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA1PR03MB6642:EE_
x-ms-office365-filtering-correlation-id: 1ca43385-1929-4284-940b-08daae0e59da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0ItzKFt+KKwttr4WY3orEmR0zFUOoN1rEtum92S4HRNLpQl8UgM5cLjQhZ/Cb2nUtvUCxnJn5bINnEVgpdsDe2tDwkxmK4oylLk8sozmy5uS1imfCdEsg4za2/FS25AFXsvRkwAsyZa5XiuFhhf1G18JnBpXve1IaAIRdo5C8w5SyvJLw+XvQrH2H09x9ew04oM76ewB7MlY77aqrMinFvBwG2iPtNhpxDlw4XcbC/KgByv8M0Lg2RUCYNToX6QS+DnIovcHTJxttgJoqVIm1uWYiMyjr4uGvai5xx+ulqWTbn8ZMvP1VL8rsxN4GIGBRmD8QkfcDqG3xzBrA/ETPeYlysIy6Jvwdi1zBizto0obQCuoLcQYRyENj6Z7y5QTNk31XMlnFRKAN+dWO2/LZvHY0H45IkFmYgjyqqPP/VFrz/WnBDOCi9rb8DlBTyruy8wQ2Kpx/g/fs5jPiCmhgJ+RKIJJD1fZ8gvaiXPR2O1Qdpu2xDXpo7GS/S6Fb72cLfTUrYEO8rMReCjJQ5Bp028mlYTE6G3BpBSoaq41HCQsMO1rcWxHQB/9nYy/UzRxI+1utmqyCoFM8IR1R50k0J7JgyPCRLAlyI5kGj+hYUNDupLFUcCuLPQjVKNGba2OaOaTk5XbmywRzU09k6vQdqBDtt7GrArNUTZnl+KwybrAHp3h7ZdZ7VoaxDiE090pqQbSMjrSyS8VPRzUG91pg77cATATkwh5jf3QCu/3gnBaueYclf6WFfZwjIKGRiSMWfa2E6r61RVHG0fPUvMX/ny0+uHv/fY2EYyoqZT7DT2LFGA+OmGouqsLKxuAOikYULOPKhm0xbMTEOL6KiH99A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199015)(478600001)(71200400001)(122000001)(38070700005)(6486002)(41300700001)(86362001)(36756003)(38100700002)(110136005)(66946007)(66446008)(66476007)(76116006)(66556008)(64756008)(91956017)(31696002)(6506007)(8676002)(53546011)(4326008)(26005)(31686004)(2616005)(186003)(316002)(2906002)(82960400001)(6512007)(8936002)(558084003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHJoenR6WUQrK09DK2MyZEZOdDJ4c3huVGJ6aXhpRlo0am9ENk1LSkpDWHdD?=
 =?utf-8?B?YVNXandGTmpmYytJRUF0QVpncFRGU2ZKT1ArNEg4am5sUWwyUmtsa1JhWW5h?=
 =?utf-8?B?QWp0WXlxWjRXVkI2QjIrS3ltL2gyMVhzZ2Q3K3FFRjBqMEs5ektXb0pMdVlr?=
 =?utf-8?B?bUwrMFBxZ1E1OE1PV1Yyb2Q3M01xTW00cXd4Vk1kN282dzViOXpvcm12MXRq?=
 =?utf-8?B?QnBFWXdDODRkOUtrNzg2cDVTakMvKzdzTTlzYkhBaHBOMEUrVlVETTBkcVJB?=
 =?utf-8?B?N2h1ckE5K25yMVRtTlNjc2hkUW1ZYjdtNjQrUzZDWXp0UU9tcWtZSHJmcWNE?=
 =?utf-8?B?c3FBUlJtbWp4dG0rNWtTaE4zUW5Qa2tRMFAxSDk4NmxPb3N0dVppNzNmcHJY?=
 =?utf-8?B?ZFNTMGhjRHFiM0NxRWxUNHhKOUhEYlJBekg1VVd4ZXhDZ0FnWGZlZTBDdFVN?=
 =?utf-8?B?amEyaXR4REtpQzY5MFU1SDhJSVNqRXVwNDIxRWhXUFJhd09QSlc0dzkwVElZ?=
 =?utf-8?B?QVJ2WWxrNE1PdUNYbUNPbjdubHdRb2pYT1BWVGhGUzBwRnkzUG54bm1XdDZy?=
 =?utf-8?B?ZkdEdWljbnFRUGpWNkxyMGJrV3lzR1g1Y3dXQkpWT3ZkWXlIYlRHeVA0SWdN?=
 =?utf-8?B?ZTlWbU5hK2ZQbk1KandlZDdyZmRBanRBZ09xNEs5VGN3b1RhaFRKUEFud1Vl?=
 =?utf-8?B?YVJZOW5CeW9RYWU0bVlyYXRhNWd2ZmxKNUw4TEYrUk1OVXdhUjFjZC9yV2FZ?=
 =?utf-8?B?SGRJU1lydGRnTDQ5UWJkRkNGU1VpUVZsVnlGaHZpcjdSdWdtaWVYZHhmT3Y5?=
 =?utf-8?B?c1M3S1ByMUNOT1YrM2E2Y3VUVUM4cWpKMDlxd1Fmd2crenhJVzdQOFVOYURp?=
 =?utf-8?B?V0xackxIUUE4bHdyaGIwcEFQTlBSbmtXT0hRSEE4RTZCMHVtUkJjUWI3ckZV?=
 =?utf-8?B?ZGxqb0U0L01KbU9GMW1qdElUTk1XcGdmV3RGQXJQT1FBZmtNZTE2Sjh1azNL?=
 =?utf-8?B?QlU2aDFnODUzVSszMUtGd25JUGFtME9DUjJnZTVXRnVKQWZ0bzJtVXlqc2NS?=
 =?utf-8?B?Sjd4THp2YVcrVlFwZ1dLcGtiRndvcUdCL2hqMjE5WmkzTkF1STZ1SUxad1Q2?=
 =?utf-8?B?cGNTSElRMHBxK0dmbUE5THVwa1FENTN0ODNTVXhITktmT09YY2JyYjh1ZXVp?=
 =?utf-8?B?eVplKy91Y3VsVlFuSi96MW4zejV2dW1tMk8ya25KSFZyL2tjVFEvWnBTN05s?=
 =?utf-8?B?WkV0Z0ZKRnFmWDRNS1pacGFDQjdBS0U3bVhyK3lKd3RhaFRwQkpjVE53aTB5?=
 =?utf-8?B?VTdJSVZ1WGwybVY5Z3MyRmFHR0pVUGpEbmNjcVJabmE1UngvMlNRSXUvTWEw?=
 =?utf-8?B?YVJKUS9RUTkyQUNBRTZqUlNycnpMUERRSWZ3SHRpelV5WDZqQ1FkeUZQakVB?=
 =?utf-8?B?YmgzbjNNeG5heDB4RURCelpqTmY0aVd6N2I2SnNSS0lvS1I3dmxYK24vNXdG?=
 =?utf-8?B?T09zTVNVWTBWblQ3WmVxUGZ6OHFXQUt5S3ZaeHIzTTdqeW1KNWtXTXRObHFT?=
 =?utf-8?B?ODRDRFFEMml1VHNIaU1SRnNqVE8xNnhwcmNacTZ6YVF1ZEZRTHR1emQ1RGFq?=
 =?utf-8?B?QTF4SGxrajRVcFdqZkRETkRkbTR6U3hxUWFaOFZOeS9lL2FubnNEOWNHMWxE?=
 =?utf-8?B?WlVrd2VEY0JKTHJ2eEJGUnVGRnJkQk45L3k4TFcvWEFDRW1OWXVFYzcvOXJH?=
 =?utf-8?B?dTFDTGVjeXROUEkySG9lY0M4YjM1M3NSYy9oS2N4L1VNR3B3Ym9rZ2FNTmZM?=
 =?utf-8?B?dzBlQkV3K01zK3J0TWRwWUdlQm9EamlrTGIwVjk0M0REdU5xbktoQ0Yydi8y?=
 =?utf-8?B?d1lTMy9ybnFlWHk4cHV4THp1OVQwZDBrOWJkTUVVOTJMckFPUkpwVEdpdXE3?=
 =?utf-8?B?VWhVRHEzZS9mQm5RVXp3S1hISTBXU1NiWndYSGhYSDBQeFJzOWtmWmVSbWxq?=
 =?utf-8?B?akJwbzlzditIbWc3ZUU3NTRjSHBvbzR4K095dnVxQ1MrSG5FWFFXY3luWUtR?=
 =?utf-8?B?NTd2U2JVQkNqVlU4SW0zRFNvNTlFVVA0ZVhGaVlhNVhCRC9sMnJIZXNjdkhN?=
 =?utf-8?Q?N8gewXzN+OIPHxl7VY2/KBHaf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10D855B40856C24786C4B46816C5BB2F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca43385-1929-4284-940b-08daae0e59da
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 18:03:08.6149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: do4lahdYgB1EvbC4004a8rKF7XWCgPUeVmibHEDgqSbFk2YQdaA6hg0IdRYxWUtyKldJnWqJ69+AOMZL6Hwq37R5wtPAbZHwprw6rXP0HNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6642

T24gMTMvMTAvMjAyMiAxNDowNSwgQW50aG9ueSBQZXJhcmQgd3JvdGU6DQo+IFNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KDQpJdCBvY2N1
cnMgdG8gbWUgdGhhdCB3aXRoIHRoaXMgc29ydGVkLCB0aGVyZSdzIG9ubHkgYSBzaW5nbGUgcmVt
YWluaW5nDQp1c2VyIG9mIGJ1aWxkbWFrZXZhcnMyZmlsZSwgYW5kIHRoYXQncyBmb3Igc3R1YmRv
bXBhdGguc2guwqAgSXQgd291bGQgYmUNCmdyZWF0IGlmIHdlIGNvdWxkIGNvbnZlcnQgdGhhdCBm
aW5hbCB1c2VyIHRvby4NCg0KfkFuZHJldw0K

