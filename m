Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7C060AE7F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 17:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429206.680093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omz0T-0006ah-Mo; Mon, 24 Oct 2022 15:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429206.680093; Mon, 24 Oct 2022 15:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omz0T-0006XY-JX; Mon, 24 Oct 2022 15:04:49 +0000
Received: by outflank-mailman (input) for mailman id 429206;
 Mon, 24 Oct 2022 15:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmwR=2Z=citrix.com=prvs=289ef416b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1omz0R-0006XP-9t
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 15:04:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ffe2965-53ad-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 17:04:43 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 11:04:22 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5056.namprd03.prod.outlook.com (2603:10b6:208:1b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Mon, 24 Oct
 2022 15:04:21 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Mon, 24 Oct 2022
 15:04:21 +0000
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
X-Inumbo-ID: 2ffe2965-53ad-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666623882;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3vxSWai/x7YVhv/3LVpA/Let223PEwV/k3jF29YcV+g=;
  b=HkyyMaW4aqsDgyfZ2kBcHKGhLPDIUiIqv54d+qdxlZXyiBFRqvNTNPkn
   LXfYiSRGMiX0wWlNSA2IwS+qEIXIkGZuN3BD+dTYd/tTNPu3eNnVLJcO2
   kQjYWt27karxXEad8IDYeDMpiXUkFjjwPF+MQld/BL0nY3sS5hhiCjylR
   8=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 82484344
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:K2MAIK+6yRu1n8KNrLRrDrUDl3+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WMaWmrSaf6Da2H0cookbI618EoF75+Dy4djSgFk/yE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5ABmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0v5wM313x
 6cVEy1XQS3a2ruu3rucafY506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCKpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toijw1rOUwX+TtIQ6OISqzsF0nASp4DY6URQcT3/qrcmYlRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9+4FHhRqubyRDHeCrLGdqGrqPTBPdDdbIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCQJuLpzm07hl6Y0z4=
IronPort-HdrOrdr: A9a23:PGzLmammpLli2kDMNMg9x0rGr6XpDfPJimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtND4b7LfCRHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaFp2IhD0JbjpzfHcGJjWvUvECZe
 ChD4d81k2dUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInpy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zUYIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6R9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF79tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcoa+d
 FVfY7hDcttAB2nhyizhBgv/DXsZAV5Iv6+eDlPhiTPuAIm3EyQzCMjtb8idzk7hdEAoqJ/lp
 X525RT5c5zp/AtHNxA7cc6ML6K4z/2MGbxGVPXB2jbP4c6HF+Ig6LLwdwOlZGXkdozvdMPpK
 g=
X-IronPort-AV: E=Sophos;i="5.95,209,1661832000"; 
   d="scan'208";a="82484344"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4e1pM0P9wZBLt80cj5oe3PurMKCaHw/QXOaRLCyJk1FJJj2orzD/7CrNb9nyzWe+iOth1ZbvrFpFYX3/MIBm17JzLryaBbA7aUJkMIaB7Ss1PCsGdkLnkdvjaBEztLiejDP81gc21oBoigdYbqxeuYrq9TW1lfWumSjz22Kk+yIBPdHBH33Hj6/CAts5rBxcn9xbap1SUrlzh60rmaB4Tb+PAc3a9tcKVSmF/y3KON5IPupzsMJ0e9yC2OLXijmW7ifBjVj/m/PH3ASG4Tb0fYe6wI2Op03PtpnZ+ICx6vh6fq6ix3wqZj/m3+2KGdDEZSJyYTiiJR57RvUalKdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wY/FMlcRPFDBZIEYTMjtgmpieWNWtqEmprrtNPF4HVs=;
 b=kPokHmYoLOuGFEcPElIq8jh/RkuBwIZsqdIF5V3gV3i+6e2Yp9L73/JpcEBUixuhCK5oi6TRD/JFiAVrnc9EwBfrLZfrQLAYf6dWNDgVXTnhksqTgwBn1QFg6BBUHYpnrEJX6b/goR8jBpffDXmKb9ioxFlMJzN2oCSx1BWFd/ioDVqbM3QZxvFmmffnQ2sdwTSJFu9HBmsVzlx/6Z/3QfEU8NwRux1BNhqop5c0f0+S7EdhQB/6Z/JcCy2A4Jtzri7X6I2B9Vs6FgMJ5RhhNAgMDZTXFjGipfiubY2+7+fA8JDfAQlg126rj9gbAA/FRHlLgVzdszV5OU09o9T48w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wY/FMlcRPFDBZIEYTMjtgmpieWNWtqEmprrtNPF4HVs=;
 b=HypEi7btVECjTwbyfHiHItnl+TI9EoaHwMJPFSD5/4ExBB9iQjS/5J+HLKFMbppp2BWVT2iKl3O2t27tVIOANKWB4HrdU8R5+HBJu6WzEeCoFDSKTHLwB/LfHb3su8tmUdGUKDZcm2ygXDzgH1yuNaoMGlUp127wwf1cckb/bPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 24 Oct 2022 17:04:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 6/6] vpci: refuse BAR writes only if the BAR is
 mapped
Message-ID: <Y1apcHK6O7IDWlKF@Air-de-Roger>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-7-roger.pau@citrix.com>
 <cc94a021-aa76-87da-0d14-e01f09377b57@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc94a021-aa76-87da-0d14-e01f09377b57@suse.com>
X-ClientProxiedBy: LO4P123CA0126.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: 80a23646-50cf-4ad0-bbbf-08dab5d107ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+hR7jEpuhVGz/UXrAM8omUqo7MuMC2HLKCGRbdg7PudHrXeurLO/b2OGoSnu12hpnfQ32goZFHQ71MtTQJwVKMdf9B2jAsuyCS1nZlWGVOpYZ9eYUg7vBkAIzFmOcoExh2XGNOExa1sWFK2nux1pZ1Dz0Tb0JW+CnujXKlZ0NQhUDN45E0eY8VveUJ2dnvYHrKPIxiAibz4FWkWfml8uj15WQTJPiQIxX/OMM3kwW0Lf3hP/8gG6XXJaiXEpJ6ihaQ2aCfPyMbkpmm5EsCU8bTvt4/Mspg1yPJWr6AGhR4tZyKmDpl01q0jcXB1rObglt1We8OrJ4nPydYwJTZZziKZ7DK9WCZcYdH2BObf+uS/4yiQzuHAscHrRJMu2xf9s6z00bYUx0fGibABb6S6l0sncc9ojtgDxy2h+kwE6vCKbH5EjJF2PJWL8L/lK9CA6yUl4kQjK4l0t/9PNtkLlG138/aIYMTqAmAMMyh3vA4rnBla7rPKycKmig05EN1rfj/C6TYebyEGIoIzycAlZc4Vd8rUb9eZ271cc3FXbsfAqsZuLwlfzBKQwNHdXt3oNrLySrkyDnvCx3zFpJ6SzFfGwz/aXTqmlEXsr6EV3EgqHdQKoNVC52C1G/xkT9PVb23vXamwnWfvYnFi5wvz672SNLfHOAw+ypy3XJ8CNKpkF6pU195lkXUWsr7FlHI1k7Q0zpoOc1nGiLigSvzhLkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199015)(66476007)(53546011)(4326008)(478600001)(6666004)(41300700001)(66556008)(66946007)(316002)(5660300002)(8676002)(26005)(6506007)(6486002)(6512007)(2906002)(9686003)(86362001)(186003)(83380400001)(82960400001)(38100700002)(8936002)(33716001)(6916009)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2tJY3ZuR3gzcmY0VkdBamk4NzY2QjVkUEpsdkJRenYwUVNIV3o4UlFIbXM5?=
 =?utf-8?B?eW12UmFpUGNjOUpwRXlTbmo0L0x1UkpLbTJWTEsybSs5dlpjU3kwUEhrelZo?=
 =?utf-8?B?UHE5U2Z4Rmh2SUdheldWeW1NbnF1RldyOW9HY2JhY3lPd3lLS3BYSnV2ZStJ?=
 =?utf-8?B?SkdWVzllMStPUXQyakNjUENDa0UraDFyMm4rRTBrcjgycDRpbURrRDM0SnJ3?=
 =?utf-8?B?a1FoWHZqSkdVVTcrdU95aFpyaEZzRTRueWE5dVEwajlMV0M5ejE2K21rREc2?=
 =?utf-8?B?TXh0S3VzS3IvS0NuUUpkclZBcUhkeFdkMGU3V05tSktoRENRK2lMTXNiK2FF?=
 =?utf-8?B?VUlyanhnZFk3VmR2L2dFd284b3NrWTV2alovQzJWRGt6cUNLYllUNGpoMzhw?=
 =?utf-8?B?YkdubkpGcFFNOEVPbEpnQWg5VldWbzhmTWh3TzhoUUNPUHBEUXpBYmNlL0Fm?=
 =?utf-8?B?UkZDdUg5QWtncEUzOWNjMUNJZzZYTzN5aGJyRUFlenZySEt0QUppSEFPaG9G?=
 =?utf-8?B?K1p1WEdka1Y1eGtJTm5sRkt0Uk5xYVdHcG9WQnZwaGZaR3hjWU1xS3preHhT?=
 =?utf-8?B?MWxaYjNWeit4TEpIRHVjWi9ZdDBPb2tMRzBNQllBK0hybnROLzgzbksrNkox?=
 =?utf-8?B?VmlsQmw4T3hGN2RETUo1REpuM1hNeEc4QjEyakNZRmdTU09kTXFERUNsdHIz?=
 =?utf-8?B?RUs3K1MrWVZFcGY1ZnErYnpaQUErV2MwMFlQcDdnQzIzckQ1V2xndHdXMlpE?=
 =?utf-8?B?cmVwMHR3bDc5akd1VXJ6ZWtVRmtBVlV1SndXUXBoV3lmNm9qODNDZVIzMity?=
 =?utf-8?B?eUR0TjR5aEt3SFdLNUFhRjI5Q0NUS3NwVFp2UzJ5TE9NU0t5M0Y4ZG9GUnVx?=
 =?utf-8?B?cXV6WEk4NVZYQS9Lamw0WU1VU2JYTVV2Y253RnpjMjFqNlJBSGgreVVqOGZR?=
 =?utf-8?B?dHFCTnlYSTU3WnBjNWwvbUkvclM1MlZ0UUZJcXhUb3hIZ3RqQlVVY1ZONnRr?=
 =?utf-8?B?WnFwMTBvMmVPQlA0S09ZZ1o1RFVtcnRoQy9aVWJQcFZzMDllTlB0L1V3TVVu?=
 =?utf-8?B?cUlDZE9FWG1DTFJsRmIwSXcvQTIzL09Ba2pQdlNZc0JLNHNMazFZK0tYcUJV?=
 =?utf-8?B?OEZaUlErRjBOcHhzK1N5R3VYZU9kL09CQTd1VmFNNWtUeFNlenFEelJMZ2xj?=
 =?utf-8?B?L3pQQkRQanhVNUM1dkF4QmtvdXZ0NFZyUytHSG5Qd1dPNFE4N0Y2NzcyZ0M0?=
 =?utf-8?B?QmRMQ1A5STZZTW9ISW93am10T1h0RWZBbldHcTkrNFc1dTJNR0VOWTlXTksx?=
 =?utf-8?B?WWd6RjRTb3pacUpjMVpneFdXYWRpUVl6b0xyVlZJL3lycnh1aE1nV3YwdEgz?=
 =?utf-8?B?dVBFdjNGL2pIL2dZWmRiRUdoZkc3aWxjNCtwdUtBRjltVFdYaFQ2YWtsb01W?=
 =?utf-8?B?dnFYdjVsUWtacmJBZVFOTmJuQkxSKzNTVkpvK1JYWWg2SE9rbVdkZVlZaGdF?=
 =?utf-8?B?WkR1NVQzdG1LZDNEcm1ObHY3TWZFcDVrb2c1TUxHUmxFR0pEUW15b2pHVnlw?=
 =?utf-8?B?bmFFL0RiL1dPcDBwUG9wMk5GQ0RZdUgzODA4Wml5NTdxRFlRbDVxVmxrSFAv?=
 =?utf-8?B?YVlTUC9vU2w0MmtnVDhEK2NKN2RTY3VWN3dDOHJkd1BDZXpJNUs4V1ZPNk5n?=
 =?utf-8?B?OWVNT3pZY0J3aGhVblA1NUJ5QUlSTG1rVFNNM1NsV054UFk2Qk5xUDNuUzFV?=
 =?utf-8?B?ejd3dG5EU0dabm5WdHFmZ3FlSkJZNlFCb2dXQTNCZGlseURzejZYdGJaSm9v?=
 =?utf-8?B?WjB3MW5aS2Ezam5hK1ZRSjE4dnRYdHZiTkdTdHNRYTlGR2t3SVpqaHNadWlq?=
 =?utf-8?B?Q0JEYXordWd5ZW5SOTZJdlVpbEJTa2tFdytJOFN4V1l5SU5hVkk2eGhMZStt?=
 =?utf-8?B?UDd0L3F5cUpnQkFXMWNtTWRIdXRTZFlRdjBFVzNTUXg0V1Vuc2t3bmJFOFkw?=
 =?utf-8?B?eGhISGNzRUNpRkhtTjVPRTFJQVl6RHB2cTdhM2JNZTNsMlVZcVhRMVdCMWxT?=
 =?utf-8?B?L3ZvWi9BSjVlUWtNUnV0OGthb2RBMFYrWDFWcWt0Y2ljL1FvSWI4QWFCU1V2?=
 =?utf-8?Q?fe68g/hn8TMVO/KWkVEUFClQT?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a23646-50cf-4ad0-bbbf-08dab5d107ad
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 15:04:21.0933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRIDAU6N1LR7htQLXowXX4lokUfsIRv/9dvZcGyJkIVQRxH9SBwBS2BOroi+VnBIjIoqcjQN9i46TBhDP173iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5056

On Mon, Oct 24, 2022 at 01:51:03PM +0200, Jan Beulich wrote:
> On 20.10.2022 11:46, Roger Pau Monne wrote:
> > Writes to the BARs are ignored if memory decoding is enabled for the
> > device, and the same happen with ROM BARs if the write is an attempt
> > to change the position of the BAR without disabling it first.
> > 
> > The reason of ignoring such writes is a limitation in Xen, as it would
> > need to unmap the BAR, change the address, and remap the BAR at the
> > new position, which the current logic doesn't support.
> > 
> > Some devices however seem to have the memory decoding bit hardcoded to
> > enabled, and attempts to disable it don't get reflected on the
> > command register.
> 
> This isn't compliant with the spec, is it? It looks to contradict both
> "When a 0 is written to this register, the device is logically
> disconnected from the PCI bus for all accesses except configuration
> accesses" and "Devices typically power up with all 0's in this
> register, but Section 6.6 explains some exceptions" (quoting from the
> old 3.0 spec, which I have readily to hand). The referenced section
> then says "Such devices are required to support the Command register
> disabling function described in Section 6.2.2".

It's unclear to me whether setting the bit to 0 is plain ignored, or
just fails to be reflected on the command register.

> How does any arbitrary OS go about sizing the BARs of such a device?

AFAICT from Linux behavior, an OS would just set to 0 the memory
decoding command register bit and write the value, but there's no
check afterwards that the returned value from a read of the register
still has memory decoding disabled.   Xen does exactly the same:
attempt to toggle the bit but don't check the value written.

> > This causes issues for well behaved guests that disable memory
> > decoding and then try to size the BARs, as vPCI will think memory
> > decoding is still enabled and ignore the write.
> > 
> > Since vPCI doesn't explicitly care about whether the memory decoding
> > bit is disabled as long as the BAR is not mapped in the guest p2m use
> > the information in the vpci_bar to check whether the BAR is mapped,
> > and refuse writes only based on that information.
> 
> From purely a vPCI pov this looks to be a plausible solution (or
> should I better say workaround). I guess the two pieces of code that
> you alter would benefit from a comment as to it being intentional to
> _not_ check the command register (anymore).

Ack.

> > --- a/xen/drivers/vpci/header.c
> > +++ b/xen/drivers/vpci/header.c
> > @@ -388,7 +388,7 @@ static void cf_check bar_write(
> >      else
> >          val &= PCI_BASE_ADDRESS_MEM_MASK;
> >  
> > -    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> > +    if ( bar->enabled )
> >      {
> >          /* If the value written is the current one avoid printing a warning. */
> >          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> > @@ -425,7 +425,7 @@ static void cf_check rom_write(
> >      uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> >      bool new_enabled = val & PCI_ROM_ADDRESS_ENABLE;
> >  
> > -    if ( (cmd & PCI_COMMAND_MEMORY) && header->rom_enabled && new_enabled )
> > +    if ( rom->enabled && new_enabled )
> >      {
> >          gprintk(XENLOG_WARNING,
> >                  "%pp: ignored ROM BAR write with memory decoding enabled\n",
> 
> The log message wording then wants adjustment, I guess?

Hm, I think the message is fine for the purposes here, vPCI is indeed
ignoring a write with memory decoding enabled, or else rom->enabled
would be false.

Or are you arguing that the message is already wrong in the current
context and should instead be:

"ignored ROM BAR write with memory decoding and ROM enabled"

> What about
> 
>     if ( !(cmd & PCI_COMMAND_MEMORY) || header->rom_enabled == new_enabled )
> 
> a few lines down from here? Besides still using the command register
> value here not looking very consistent, wouldn't header->rom_enabled
> here an in the intermediate if() also better be converted to
> rom->enabled for consistency?
> 
> Then again - is you also dropping the check of header->rom_enabled
> actually correct?

rom->enabled should only be set when both the ROM is enabled and
memory decoding is also enabled for the device.

> While both are written to the same value by
> modify_decoding(), both rom_write() and init_bars() can bring the
> two booleans out of sync afaics.

Right, bar->enabled is not a clone of header->rom_enabled, as the
later only caches the ROM BAR enable bit, while the former caches both
header->rom_enabled and whether memory decoding is also enabled (and
the BAR is mapped).

The usage of command register value in the checks below is indeed
dubious, as the purpose of the change is tono trust the value of
the memory decoding bit in the command register.

I think the only way is to cache the Xen intended value of the memory
decoding command register bit for it's usage in rom_write().

Thanks, Roger.

