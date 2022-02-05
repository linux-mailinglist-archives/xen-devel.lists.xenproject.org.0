Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1941C4AACAF
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 22:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266135.459821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGSQo-0005Gr-8x; Sat, 05 Feb 2022 21:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266135.459821; Sat, 05 Feb 2022 21:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGSQo-0005EL-5Y; Sat, 05 Feb 2022 21:17:18 +0000
Received: by outflank-mailman (input) for mailman id 266135;
 Sat, 05 Feb 2022 21:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vIk1=SU=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nGSQm-0005EF-JI
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 21:17:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc48ff93-86c8-11ec-8eb8-a37418f5ba1a;
 Sat, 05 Feb 2022 22:17:14 +0100 (CET)
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
X-Inumbo-ID: fc48ff93-86c8-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644095834;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=UHUGVH8XVBYvDuaonDUZyEt9BuG+bhZRb7ezM55T+qc=;
  b=gzRL7bnUPRZWSpaGsvQVNDsjm6PjFO+VJ20cy/o75GitbeETlHpfgbYz
   ej2L/kvfYdKLJvcf4BsPX/X+EDDXslGAipE7UofRKsAvjyehEtQsjH6fO
   WOmU7SjpBkU1o0SiwAwRVs/hdZj13vYvXkjQD404oZOyAENCZHQjnnPbn
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VwHg50y4pQRUJgKRqNNIUl+H/V/SVZrXFTVhnn/rPhVxXdBMUanG84dNK7ZfW9fSLu5fies7n2
 S/WcekcIj7zpXxfMe+yZb8aJyCeWRFPPPi0xSxRR8pEeesqxrK1UIH9ylARxcvQua4nh8hYiYg
 85Jj8dSB95o30uDIVxM2/hJZ2Hu2uhctr8bT+kkDlxsrzeEa9UBMp9lgHuDrWunS80CcU4Dnyg
 FczoCfqWQy5vyqQqB7oWXdeilQHcmRV/4AGw/3mm4LdGC+Si+N1XLZTYaCBGggAMriGW/kBzey
 ZAOCiNT511o/AHFhL6ZPJwUa
X-SBRS: 5.1
X-MesageID: 65782955
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:259yoqsfcy2E446dEtm0VkzROufnVK5ZMUV32f8akzHdYApBsoF/q
 tZmKWmOPfqNYGahLdp+bd/noUwDvpTUz4JgSQU9rS4xQXtG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2YXhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplurbzajoCffD3msslehpYNgJPLI105+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DE44YoH5tix3EC/IvWbjIQrnQ5M8e1zA17ixLNaiDO
 JpDOGcyBPjGSwx/IkYIUJQSp9yPrHLOeCV0lkqllbVitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRARwENdrZ1TuM9FqtgPPCmWXwX4d6PJ+S++NugVaT7ncOExBQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nMAcBh8X/
 RzUpNHGPRVssJi2eGO9xKjB+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hia22rEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImUMnleM+lGrxl8FSVCxCtamC0bblHRMFJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPErP9rpU5t1k/C8RbwJs8w4iPIUP/CdkyfcpElTibO4hTixwCDAb4ljU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3eLOlOEH/r9VMRW3m2FBmXPgaXeQMLbXdSuencUl8Y8LsLUQJIdA8z/8Lx7uXo
 hlQmCZwkTLCuJEOEi3TAlhLY7LzR5dv63U9OC0nJ1Gz3HY/J42o6c8im1EfJNHLLcRvkqx5S
 ecrYcKFDqgdQzjL4W1FP5L8sJZjZFKgggfXZ3ipZz02fphBQQ3V+4C7IluzpXdWVifn59Ejp
 7CA1x/ARcZRTQpVE8uLOumkyEm8vCZBlbsqDVfIONRaZG7l7JNud37qlvYyLsxVcUfDyzKW2
 hy4GxAdoeWR8YY5/MOQ3fKPrpuzEvs4FU1fRjGJ4bGzPCjc32yi3Y4fD7rYIWGDDDv5ofzwa
 /9UwvfwNOw8sGxL64csQax2ya8e5sf0o+MIxApTA3iWPU+gDaltIyfa0JAX5LFN3LJQpSC/R
 lmLpotBIbyMNc7oTAwRKQ4iYrjR3P0YgGCPv/E8IUG87y5r5ruXF05VOkDU2iBaKbJ0NqIjw
 Psg55FKu1Du1EJyP4bUlD1Q+kSNMmcEAvcuuZwtCYP2jhYmlwNZapvGBy6quJyCZr2g6KXxz
 uN4UEYau4lh+w==
IronPort-HdrOrdr: A9a23:7/ilGKGpsG2JVhVXpLqFspLXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVp2RvnhN9ICPoqTMuftW7dySuVxeBZnMXfKljbdREWmdQtrJ
 uIH5IOa+EYSGIK9/oSgzPIUOrIouP3iJxA7N22pxwGLGFXguNbnnxE426gYxBLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxs4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1Ss1
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RHoFq/QpF5N1H2mxa1u
 UkkC1QZvibLEmhJl1dlCGdnDUIFgxesEMKh2Xo20cL6vaJOw7SQ/Ax+76xNCGpt3bI9esMoJ
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvHLf2x4Uh2bD2bCtuYeY99Q/Bmcsa+d
 NVfYvhDTdtACSnRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtZ5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdA15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAX23G4gMy0eFPGC1zwdLkeqbrXnxxEOLypZx
 +aAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.88,346,1635220800"; 
   d="scan'208";a="65782955"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moRqSyIg3jsMvxoIPSGnKXa/EhHT2rKFCIJqjHezSZsezm6AGnQ0i5OZk7JZ27i9fYsIq10nSzqiJO4/k4XlokBbQlH05yPlRMbfskuZFypSrEsvT+jVweykYHa7DIKoZdvbSm/+2FHy0PrNfsC9G6CHjxDD2kuRnIgvG12nDBLcdSx+TtK0RanrbHsvNw3QWxsVollnfzJXQr2HKyO/zMwSIi0GgEk5zJ6z8RNqYCfcgTd2DC0sONBDKkbZT2ei8+iC+/97cf9wRa+D8BU9YfHWV8GVgJlU7TzOJVfba2Pulo4rBteAHCSB0IZWgdljAAJn669MZkTDw7tiTvt//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHUGVH8XVBYvDuaonDUZyEt9BuG+bhZRb7ezM55T+qc=;
 b=KWCrkxyXTR30/T3NYq3TpaAXogsBnRzbfbCH+IxTkMCeR5KukP5GdXSrbYlsWfzuAFYEob5bvZffFjPJyjWyNbaqY4gLq1thtWk4JLTtvyAb0ECYNbMc07xpCuVCOCFeXeQc3rFte0kr84NNPm4w2jl7SsIPYyG4pG8w1VyYfOV91JWyJccDLG1vsK0D1BpfGMuVKtUZfp6xB/V/CvU7gofIHgqusjdkybwl0QNSxOaJo2NUCfMIXeZFJiYgXyCoHvnrG/BA2KqQmcQCn7wbayYM81y13XfRVksbq1T2pJ4tT90nXz1Fl5VzGAjtkJ9p0a5o2pqVsDSxxceUSzfwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHUGVH8XVBYvDuaonDUZyEt9BuG+bhZRb7ezM55T+qc=;
 b=nt3x5y38Qo14nm6n33vN+aHWPbVUnZx5yJUXmGzdg8KLpfGcJK4/4nBkO9qBk6ZnMOPsogt+pmD0PtOgHKyIFbav0Ew8itMA66VeZEVsZTpnI7nDEcSOSv9/ltEsAs3gc/Up7cEfeJ1uoZ4nx6tUA94qmLD2SIITCZZYPqm54M0=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 07/16] x86/P2M: p2m_{alloc,free}_ptp() and
 p2m_alloc_table() are HVM-only
Thread-Topic: [PATCH 07/16] x86/P2M: p2m_{alloc,free}_ptp() and
 p2m_alloc_table() are HVM-only
Thread-Index: AQHXcbg11+nupplxqUK7UHem5UW9BayGyAYA
Date: Sat, 5 Feb 2022 21:17:09 +0000
Message-ID: <99920444-F6CD-4026-8680-F3C18484F070@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <fcd39881-e225-d1a7-a168-9aa9fd9a7735@suse.com>
In-Reply-To: <fcd39881-e225-d1a7-a168-9aa9fd9a7735@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5bddee4-7049-4e6f-e179-08d9e8ecde9d
x-ms-traffictypediagnostic: DM5PR03MB2666:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <DM5PR03MB26661F57C78A13E5F131FD76992A9@DM5PR03MB2666.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZSFeOpRd8Dm/+QmayRw2kFz97mLdQ3mWulEd9vqU7Pbba3Jkl5rEFK1rheydqc0aaCQhOR1wNudK1CQJYGe0Hza1R76q7KldrB+1/yhgYChzm/uyJ5Geo9ulOJ2Ou7rtt5TWskT+Uz7lJxPtkBrvtAhjxXChFSTcWTdfed2mTcFda7o9X2ClciShNy5hhC0tFX4UWa1epLFZ1ud1xzU/s2NERmc81750Oo6KXzT8MYS/+MEx53K5jmvqvdaG10l0fZ2JC1A+ntD16MTCEt24+M7hbPXwG7u7yp/JdC3W2mcgfIJkKBr5u34y7shOyZPOf1k4QXgSNz4mS33HeCsxhL+ovUMWkT7SV/jjrwQnpJ38iEtSFlneYUVMww1W7Top25CE8ormlrkEvhX2JOgO/CinGuZtZ4pyzubQz/bNIwy57er3a8WXFZyy2/7f13MaZLxnyUAK0dsnKYTGrmcLZTdqkL/wMrSJMKYZhW0vVGQBtOEfgmo29Xqa63S6UHE2Q9Xb8tC9/Uay7AHiwh9yVnWbu/vzudEaLkT67Mgtx06Grl9Aeg/wQzmEl81VQUgAb72aklXcPHk28fUJgniiUs5LdfeRhMh5/Y05aPk3kxShc29LJ59KAlVdKdvopPpNRVgs2gHc8kW9QN9aoSnfixcRqAjhPTvOpTu4EcpX9jw9EmYcdK3Qqv/O9OKLaUs5oDEK3RQ6dFiIB6mxqURCeQqD+v3FD9U8PJF3KSIKGEE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(36756003)(71200400001)(6512007)(2906002)(38100700002)(2616005)(5660300002)(53546011)(6486002)(54906003)(64756008)(8936002)(8676002)(4326008)(66476007)(66446008)(66556008)(316002)(66946007)(86362001)(6916009)(76116006)(91956017)(26005)(558084003)(33656002)(38070700005)(6506007)(508600001)(186003)(82960400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J/TTVb77sh4g09q6yS0MgTMBSp/5W5bqJqWHk0uHhD+UXlnK5d8EN9kZ/eqn?=
 =?us-ascii?Q?puW93/TdOFBW8gnulW3mPiBhu+17pEnieJtFZAwD7g5Z+8HmGp9lw1zEHm/a?=
 =?us-ascii?Q?ueDxtzvJ+dFY4jOjG0v/w41hXl8Lr5jU6s9ZJEPq/lAY3wCAxN2vFC/13pSh?=
 =?us-ascii?Q?Hq5BRUESlb4P81edSaBou/8o5XegBp7NsgQ/O2J7ys3Nl48+KMCob51UHrsu?=
 =?us-ascii?Q?sZzBbn6RxOppXADlMZPXonPuUZKDhrgpvgyQNXaEttGrcfyDmaxo132TeqSR?=
 =?us-ascii?Q?2ilGHsJoWp4zlGRTROwgyWZaiJTpKf8dQ5cUqWfS/6pID+08djZutTNj2Jqb?=
 =?us-ascii?Q?POR9q1F6eowHaP3YZ/cARrlBrhc5chAzXyQk9dcDenPUhshyYlWEPzSdTX45?=
 =?us-ascii?Q?3NeIyPvY18FXbTyZS8Ib3pR3lF7CbuX+lBaC6qzNa12dEFpnwObaw8+azygI?=
 =?us-ascii?Q?DdJa6q/8f/zevlnszZlPHtDZDO8RNSPtbQx8Zgt4d8dHqiT3HFHj0iA+joJe?=
 =?us-ascii?Q?a0CCrrYEaDl5yvNg4Kn53AJTx1oUMktFBWOnWVKL9J8LUMCyShRYVeSv+d4I?=
 =?us-ascii?Q?zdSsCUk6JTU9eHQaFaNGbzCvx6iKSAGQBqvZRdUtAT3/cfVMeZlD8vlXscDv?=
 =?us-ascii?Q?w1Pc4bDQeXB9pZuq9v+K7CoPS+M1M9QDTMElJui9iJdFcr56lp5Hrs6gem1F?=
 =?us-ascii?Q?xtRIkN38zT1BQAmn8fSqv0c7KuDWRbkzF/NgceK2cUz1PWThzkGcJEQKPEa4?=
 =?us-ascii?Q?l9uWRbeIRqcYORo8qspYYma70GLdhfA+rb8cacHainnRN3ytUYi3a8MS6Aff?=
 =?us-ascii?Q?k4S2jb1atqNS7mLWvZdaohbl/cnekbF6pze48OR0ctXgEF1+ux8XDcGYQw0+?=
 =?us-ascii?Q?UiA6OQxqv4gqs517AZDhbKf8TxeoEgSXI93H/KjIfv/TvT+8N7S9DA1g8ie9?=
 =?us-ascii?Q?iCc7dqLYQtk0WbkdS2SGTn2p33gn1i1NQXEIYImFfR8+fHMmb2pRJjsbejax?=
 =?us-ascii?Q?UZ3qrdkrlOj4m+4+i8gX2XKm4KSgEhhGPX8VQ/cwNCkjnX00xALrrE3IwRML?=
 =?us-ascii?Q?j6IOnuEKEfCGeTTfUpfNNKJB+JVgeMW/+V4AHifrQkkZRTgoNDx34+l+iVUs?=
 =?us-ascii?Q?IU1ZzM0qwHZPyC8NH7SK1DY5CePK/g/2BKEepncrpiIi1TQ5j8x8wDPqmW5c?=
 =?us-ascii?Q?/O/ua+lF84FMp1q4UyXvYyxpDdGNzM/DCeR1N3/yKALOVk34vzXrVn4BtU+F?=
 =?us-ascii?Q?k2WX20pOkuT+VJr1s1H0ne8WS+Mi73JZBaexQ4kAJivvzWrMRM5kIs03L3qk?=
 =?us-ascii?Q?Sn4J24ZWm3lKNawbRHbQ3wyDASDvQWVgs9zvXZn6O0ZmEzzRgHkgciCuB84A?=
 =?us-ascii?Q?DEcf1rKygO/3IsXQV9RKnCPHCWie4EkieJE5owsVGFrJgT5ZTsPRgvrMtSx8?=
 =?us-ascii?Q?NYJ0chkD03WsuCC6DNp9+MJup9zRggILSEJu1+BEqgM4d2wUMvrFuEBZojRb?=
 =?us-ascii?Q?yc2ffD4CJlZQq6hHkB+CsHJjEsT1oYTUNxPq4DCH2QCsXSpIoU0hHzluLcA/?=
 =?us-ascii?Q?2SOdqKuz50wnJEZ7b4QLD6dbEtbCcf1NufOxUpL/THtngAFVbksJujzPSzkd?=
 =?us-ascii?Q?GlpWStUa4Vxu1u4jtdS1a6QoJMCzQLD7FOKnllJYrPzQUR8I6uGU/jymgtbt?=
 =?us-ascii?Q?X8TX9mAtHFNyLWKjGGrd/CtCDl8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <89AD5DB88BFCBF4CBAC5A9FA9B5DE0D4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5bddee4-7049-4e6f-e179-08d9e8ecde9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2022 21:17:09.3200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2UFhHeu1WqIa3dgeZvEPVH3QHcekbttccdxdo+2tjUOlEKCpLzffcUlBHcq/fkozXE+3+sPY08PQq8NTtNmvhNvuEFhJN6kK5vKFRUCo/LY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2666
X-OriginatorOrg: citrix.com



> On Jul 5, 2021, at 5:09 PM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> This also includes the two p2m related fields.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


