Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EBC5F4508
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 16:02:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415574.660183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofiUP-0003i2-S1; Tue, 04 Oct 2022 14:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415574.660183; Tue, 04 Oct 2022 14:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofiUP-0003ek-Nz; Tue, 04 Oct 2022 14:01:41 +0000
Received: by outflank-mailman (input) for mailman id 415574;
 Tue, 04 Oct 2022 14:01:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ofiUN-0003ee-IK
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 14:01:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f3ffe7c-43ed-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 16:01:37 +0200 (CEST)
Received: from mail-mw2nam04lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 10:01:34 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5289.namprd03.prod.outlook.com (2603:10b6:5:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 4 Oct
 2022 14:01:31 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 14:01:31 +0000
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
X-Inumbo-ID: 0f3ffe7c-43ed-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664892098;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FwXzeRBo4t59rYqAMNeKiXB2TA2uuiSyBomlytkxYMw=;
  b=e1QeToAOUzeE2vjOnSugqhV7h0fQk99gWnzwSMwq1THgu1KIz7uryqbL
   WMiOp7HK4SlwrMNT2B4Cq4ZwonCPtKeHF+bGXXfj4xDSzdKKyrGoeTFNf
   PKRZf7pZwHSYQRObzBTWmsS+ZDX/lAt2d+A82hAyGjjdIyO/kgm16j65B
   8=;
X-IronPort-RemoteIP: 104.47.73.168
X-IronPort-MID: 81956677
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AyGzR86OsT4LtZsrvrXNrnJbM+UGnJRDYMC5AM?=
 =?us-ascii?q?hGNyHUsbckhNZNtJIGfuHABrxKzqlm3KX5etJlLxnKJdwjsjhDGtqeqGrOJG?=
 =?us-ascii?q?gSNmMmLc1UII77QgL6/Gy6PkQCkrA7wfCPPG9J3oalglSoQp2622bilpUdc/?=
 =?us-ascii?q?+IK6CkDrJ9pEX+80R9g1w6OGMqrOHdfSBf3NafZjqw4Ea3OgGKTBc02S9PaU?=
 =?us-ascii?q?a1OWUgebZ88SCABZ9bivDKJEGHr4y3KW+LG/DuF2OXuyTsI0y/kqqTEWkPcg?=
 =?us-ascii?q?hDFyQ5rucQiQVAwir+/oBv7wPUoUbPRxbtmDTxWFdwAqeJewywrlZZTcScS0?=
 =?us-ascii?q?hQvTXVySEyTdeqSw+mT2p/EaiOLf/Lc3vGBIGF60KrSN194eUFOFX0/7cnzI?=
 =?us-ascii?q?mKUwtSQerWBGxSZtxCtZPEv8GJdmDtVFAhmHKk577g9HQoZ/rs+n/ku2wxWL?=
 =?us-ascii?q?BTOEyH/6dvkbt13+aNCVpqcs29rvi2FNnTI8zEZosByK2wUF7qvJ8lpZJzX3?=
 =?us-ascii?q?fuyJxsCT/YtqEE7tZQ0qT4/hGaEjpJ/XKzX5BGUZFnMjUYnWOcNijHt1Jk2Q?=
 =?us-ascii?q?DrdCPNhSq8v2Zf3HaZ5IUzp8cKJCFBMfcnVsPe5FTIWIRifCwYZXG8hOQwgO?=
 =?us-ascii?q?A8wAbKJ8uY9+XgWveOb8sE7onTGSqsDFuwTAkeUd5UKldp60WGvEhevAwysS?=
 =?us-ascii?q?VtrMR0PocQqItzWwczUsn3noGBRCO0Lw7UA8F+2csng2L8qRGhithSoLwd6S?=
 =?us-ascii?q?8H3eCmPLThT44Xa6xzUZkW0UUJRdlFkQS8iQNFwVhwo4H/0KZSY9/52KCB+O?=
 =?us-ascii?q?LdRZ8K9APXYOzfHPNCXk/EEYG8myZ5NRg7AMwv776+NT73PyWKdEWeU6jH9l?=
 =?us-ascii?q?RYWAmSYX32uxHEwS4vHkyspkoWhmdmXEt3C8oAWH9KC3TUmp9g16+zw6iggd?=
 =?us-ascii?q?eYk33DgTTTV2tbcl95acRs0GF15HA2aY8gUs31GitUAs1egdTSH7xMK3lpHy?=
 =?us-ascii?q?ogfvfIR+20k4WSGB64+0JToKqReVkBVeJ85br6I7MCp3eyy5ggA9VVI02p1T?=
 =?us-ascii?q?xwL62nuPTS6AIRQjfghJQSj1bqC2Vc9ip+UkkxNT5fm1M6NeGl5TFJ7rcWeG?=
 =?us-ascii?q?LJXaFRqvFs6NRkT5jZWocaDGTFMfMRtiTSKeyh6OBVBWfdsq80NjTbf4w+Lw?=
 =?us-ascii?q?PCCTJ6FOH+Z454ybMd9gnVYt7ovybxAdBH5K+axc8aKTX6yX/oujPz6xP2C0?=
 =?us-ascii?q?X0XDFPMR2Ce0tp8axQolRv39gj/KDF1cKy7W9tIvFV39umHPtn1pgzqOEyR9?=
 =?us-ascii?q?mvL+9nlNJ/WVQMzaHgYut6oEJRcjBi6iGm2F6wcNbDTs2ZXytttdM7IFQq98?=
 =?us-ascii?q?tm/uibKR0Msupsusy+8u63l0sFBee/hkikFxUDNpkJ1OnHY/1D841ytGQhDa?=
 =?us-ascii?q?+lRL3KELGVaagWvS3qcKKAQXZXvl1nC8FMZt8MEsiN0hELuTiNElpKkfi3E7?=
 =?us-ascii?q?7+jARnnYBUMXi8Xkc9WWXYwrrG4s9egIF69RplTgaEkASrdu7WYm3Z8SNIT5?=
 =?us-ascii?q?+dYmi2AKKgt6V8dVPyej8RlyEQ5OCAAtq28xBjIa31LpsLYK2GDp6yeZGrOk?=
 =?us-ascii?q?9ox/gfKb9pvxoUva6tCgAmxCMWd94OnPllW7CF1Wadtzp1zHt8KJn2t7FNEj?=
 =?us-ascii?q?QO9B5nFrgnsLR0nX3edRFNvDoiQhEMEmtd416leWOMP/N+xnl9oFPniY9H5K?=
 =?us-ascii?q?e4ZJ0/Ei0C5Kej73ql28q1/bQcWDcaMXbvXVOO7GjpBLkQpwPEyqwrj3t0bG?=
 =?us-ascii?q?igRfOJr83OSAqLVKu3JNjiTVXHSRWL494vwZsbU0JZrBAHCWt+jhyYTAMY8a?=
 =?us-ascii?q?rrnBiewwjuhj3IRgENMUEGhwgbB98l6MBE8pE9N5E0n271VvEPfARZiQPi0K?=
 =?us-ascii?q?ktI3tFlQRhbX+fPlEWnMGeF5qYoUU7o8VKUj5Qutkh7eCxMmjgLdTCyq0cCx?=
 =?us-ascii?q?WS/ETLaOPth169C7v38Sj2hW3trxRmowRzlwqoCK+b1z0gbHRCHo+9vPgXKi?=
 =?us-ascii?q?VAlvfOC1k43MxZgR5qn10T2i8r8KzW586REHynW3lJgLJ7w1aXXfmxDFuWhR?=
 =?us-ascii?q?U/3MnLsKq3LuIXe/L4reFVpn3Z6L3VFpAIhy1NAkl1WKcA1oQzytccuCf6Lr?=
 =?us-ascii?q?HO4EmnohWJL+teY6Y0zxWWmdAlaQJtH/lGtC+C5xH9Ms+TYIrXZqpP1OKzVQ?=
 =?us-ascii?q?jMSgwLOlCH/0XLSkWp9WM5DKC2pXAQ/2zih9ipfpUBqijuRM69W89fGGT/77?=
 =?us-ascii?q?oltOzY1X6mOUvmc4xo/ldLrZGSRF+bXSAbLQneXcOr1iwJIolZuG2dfWAoZy?=
 =?us-ascii?q?VPxCHp2JEf18qPJMYQHKfc8bvQ3V6KbGHg7n0VraZ+K/4hn8hp9tkSv3hs2z?=
 =?us-ascii?q?alAaTD0ZpFESB9erbJMsIPuKPwSHOjgudHZQ179lvhPWK6Ezj6vpbXrroB4b?=
 =?us-ascii?q?gvCQImvlKT1D2UqsWjs/U+3bt88fa6/OYql5PleyEBCfmI7hmH9SEGLi2FWo?=
 =?us-ascii?q?sSWR2rD/97VepL9xw8OJ0EAuRAnFNea27KCCEIx7x8vgbT/3PsfDnvQDvlMV?=
 =?us-ascii?q?rn7K/+mI8w97xvmEA6BQzSVm25FKM1tNG841+pUgNj46JjPCVbayOtFqelZZ?=
 =?us-ascii?q?jCv8LewCIkIdcDXiMDNqWEV78zD6i81/ytqyEUjW/6DyboU+s8Tvk+/n5EU0?=
 =?us-ascii?q?eL/SMqLLQ=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.95,158,1661832000"; 
   d="scan'208";a="81956677"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgzgGVvZazqY80Gm7DN/kwrVv1bSOjHOnsO52L18dszXbc7jOarZP8SHhUCfAjH6B/9JqmhhNJU15cVUDFZh9/QzlKD14K13Q86M4By1HLUgkdaiiAz1w3njBBZJZ0FP/w8zvGZlRU2zZ+teexVdIpd+Ki7Wq2p7kpAGh9QO+aAciGK0lhPdgquzTLe7+WZSsuYrLe4lcT2CJLJA9NEbzJNLMqbpdxM0tnZoV/Sne6pGLdxrQ0dZ2QkVokp9PMm7ubVJ3/uCyrm0GIfIgIu0mK99hzKRN3OHo19+IhgsICKcrsRuNBHdoSGzvOuGdFVKm+sJ4+/CvLYA37xk1m5rkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGgqx1lqiO12eGMjUZ8a3OBh//MxmppzY7+ROgOLLFI=;
 b=jGmBfQ/t+y8xnqahcBercMYBIXr/+QW5m60CKmXHEjEoakon6uFJdxSQxZnMA5ZMDiCDgmoq6QR4CxvkTrK1zCRTJJkxuYdisLEyeA58nh+m6+2py73QfMEdfTCnx4As0rF2Jlt2beR2AFuJaxw7O6JaImdxXfwX5JCZvhwvPLKmOnA+CIMpW1F4lpB3Ji2yRQlwhj5Ekp25CbPVIVgGWEdgeOhx88b377MCuPTJZcEBIxzWf8EyO3lFbcutZvh2CwJOoyZsjkFIyOTCMGXR1WM0lfSg9I6iBxH+K4E1BlwoANhrgES8TZ9OoCJ6mdKzPj5aIIwYBSM23/i7svaCVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGgqx1lqiO12eGMjUZ8a3OBh//MxmppzY7+ROgOLLFI=;
 b=IcPrZPhlbWRz7ZpS8B1cM1aINDiaJyxWptIU2cMsJIkJjg6Gp/60Nc64YqTu/pQIImX17zU7kRSAzV4zsGkGvorx4ipotJBM+FKRB9wdrM9ntpaT9FZe859yANOV3iDKSYawjFSkDheGfIG2d2lYoHMJoQmAeuJeQlu88EBHU0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Oct 2022 16:01:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Message-ID: <Yzw8t4oECUL6tzNB@Air-de-Roger>
References: <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
 <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
 <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
 <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
 <YzwNGd0wiAbhDR9e@MacBook-Air-de-Roger.local>
 <db9856f9-1777-8fe5-5b5a-ef3f132193dc@suse.com>
 <YzwQymW3jkfzUQrI@MacBook-Air-de-Roger.local>
 <9aa0569a-bc18-9480-c86a-817222d4fea1@suse.com>
 <Yzwsq/LL/i9ARxiJ@Air-de-Roger>
 <8fcb15bf-4477-78f4-f8ee-33603ef20995@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fcb15bf-4477-78f4-f8ee-33603ef20995@suse.com>
X-ClientProxiedBy: LO4P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::8) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 625f66dd-1033-420c-c54b-08daa610f0af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QIHDqrNJYehnkp8eyxNoRjiqh9rOFhiVSaSJNinzIHnar+xvzDv6SbqyfPVqkBoVx1s4ZocCvOGU4ST7ZO7r2JU33uBpmDnmqrm/I+IvhC54OgGnTA/A4mrz1IhGN2Xm3FjEz/aTTUxlMSDCQWTswWIS38sELJH2q5O1ToMaw5BnpTpZ1Tj380InDNC/WKBwOEwK83ohCs4LZdxuxYX+Qa46qhczzlyYH2TJBWEe3Af8QQW7Lhq4pAwY7/W4nZ6ixUfGs7GCLLK3RftjzbRr0Ngb1eMEVGjFBvLzLQXPzX058tmmemipjKUokDRudoZrCngB2VOuoxJ/bF+70WdaAzF06Ezjt5y222mg6Xcdbr4QKQvNhHK0PkcAndHn5TNjh56Z9IqakHBI8Xb7ra6ALzbwtgvzOOJUs4XOi9fZujp+sYtwNWBbVDy4KuMfeDjEK8jeccON5mOMADfMOspXgI5UAcCmrof0ZJ19vcKLqSjpQV4MdJqzahiBhbwo8gQgR5ZQVDVZOz/sT+r4FzLs5gan2KgZBswzY3gOA480mK/ISmj1hACpasS65m+sRDNDjqBfaWSyy1LU0hScX4ymoDjZk4dRqwZYhFpGqAjTD7YnWyl6HDb2Odw1y1ogT0o3CCKTBPpch2kGxdfjeahztqDdZl/ag8fsIdZBD52Dvr0KyQu+DbavBTODOhPkkLKtRVH1oKTphmNLKv2OonFOFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199015)(8936002)(41300700001)(2906002)(38100700002)(478600001)(83380400001)(6916009)(85182001)(66946007)(6486002)(6666004)(66556008)(66476007)(186003)(5660300002)(54906003)(6512007)(9686003)(26005)(8676002)(33716001)(86362001)(53546011)(316002)(4326008)(6506007)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmV6S09OWGM3Q01BTWJwbnljVEt3blIrWVM3dnpZWGVmb05ieEl2Y29NTWkz?=
 =?utf-8?B?eGdBTmRWcS9YRVQ4cUtSMVRFem9yS05SUU1SVzdvNzFNODBnVmljRGw1QjU4?=
 =?utf-8?B?M2RYQkkwOEFIOXFuYlBhVjVYVUdxWm1vbWpmMEt1TE5QSnVVbWgvL3F4YWY1?=
 =?utf-8?B?YTAzNU9MVmF5bGFmWGhobEFZMG04RGJLQnl6cXVxOE1oSG13TytyVFF2RDJP?=
 =?utf-8?B?ZUJvTytVcGdodGwrdXN5aS90ektvNnlDRi9CUlllVGM4VWtqdm1wOWMwdXJB?=
 =?utf-8?B?dGpKWEhjYXh3aWx0Yk1OSXloTktYcTA2NXlScmNEalhMeGtJSmZ3cTRIVVhS?=
 =?utf-8?B?NmZlTmIzV1d3NXF6aEVMUDlpQTk5OGxVQ002RTVJU29KTE52b3hrU2NZZCtR?=
 =?utf-8?B?ZGM4OS9DRTlRdjl2bk5OSnhldTdMZEJUNFBPQVY0WkdSeFBoUlJsbDhvbTIr?=
 =?utf-8?B?TjhKL1UzWmNvUEUvMG5na1Jyd0M5M3hqOXI4aHBRcWxlSWZqUHFWS2dqZTgr?=
 =?utf-8?B?ck10VTA3QlFGMERiMUluMmU3ajdtMXRUU3lZN0VqdEpVRVRVRno1bitJMURx?=
 =?utf-8?B?Y1FoclJXbEIwRjJaQTQwelZlQVdyUkpKSXljN0I5VDBxQXovajI5MEFFbVlm?=
 =?utf-8?B?VUVsOG1uUHZONDB3dzNDb1pHNThPSW1jWUUxL3dSL29lNkRoSzJ0OUhoajVu?=
 =?utf-8?B?TnlQVXR3d094SUpVNmgwU2EvQkM5akgxK0NvUGt3NGIydVFya0tONmYxSWdF?=
 =?utf-8?B?b2V6THN4aDd2eEU3Z1d3cnpxUXhzYXFvRXpsdytXNUlVSC9rZnh5UUl3MHoy?=
 =?utf-8?B?RmdRdXdUZDROZ2txekxidHJ5elpwWWEwL1hiZ2JqSUF2SmNqQTB3QURNdkl2?=
 =?utf-8?B?TU54SndBcGttODRObU1vYUJZUEtESnVBNU5nR1ZBWWNYNElPSUMyZzdFZSsz?=
 =?utf-8?B?UHcvYnM0eE1TMlNVMFY2dDA0dzJtL3VpeHRQc2dsVnRabkdvczNMUjVTbkZn?=
 =?utf-8?B?blFWeE9hN01LRnptY1lsL2ZvTitCTzVYS3JncEpGK0xNWDJ0cnV5aGg1Y0c2?=
 =?utf-8?B?N2xteFlLNFo5YytPUTEwZWVEVmdqQUNBRy9OdTVoVmplVEpZUU9reWFjTGI4?=
 =?utf-8?B?RzFBNkRNZ3hyc3ovQWxIbi9TSGowcXljbTBQUWpTOTBBeXJJdC9kdU9CdE5J?=
 =?utf-8?B?U25LQUx5WW44SHZiVE5NZk9nL3JYOUR2a3Noeml4WFhSS3NhSHVudVgrMFFL?=
 =?utf-8?B?VEl3MHprQllpZGRTb24xVlhSVHdPTGNwTk9PWjc5QUJHeU1aSkQ1MWxYMzNu?=
 =?utf-8?B?THpPai8xVVhGdVVYbXpaRkFCa2w2MmcvR09sVjU1WmN1WVhMcmJUdEJZQ1Nj?=
 =?utf-8?B?akRrYUoxWmtab2ZYVUhDbFoyWU9rUUZaanF5R01VRkY0eGtrRDhnT1JudGlz?=
 =?utf-8?B?TVRsU0FWT2Ruc3RJRG1yeWxPVjQ2QmdLWVVuNWJuZnNTLzhaRW9zREhVWXh4?=
 =?utf-8?B?bmsxUjlDTmZwamtyYVdyQmg1cU5DQXdza2ZteTllS0dkdE1TTTRNRmFYZC9F?=
 =?utf-8?B?Q21Ncy9Sakk0YU56bmd2ZlVCcVUzSlQvcWwydDVEbGZCY29NV1M5MXJRaGdD?=
 =?utf-8?B?MU5Ea0I5T0ttL0RRQUZocHdINjk3YVFoVGV6VUpudkFSRnM1TFZkWmdGQTdO?=
 =?utf-8?B?dFcyWjRlaGZyZlpSLzVXcjVTNDI5MXFEbzVqUzR5MHdXbitNK3pLLzA0eFZB?=
 =?utf-8?B?NHh0VGhNdUViSi85cm9UcVJ5cTE0NForK1EwYW5ia1dNVmszV21IZEIyRTVu?=
 =?utf-8?B?ZHUrdk15djg4UnRMU3lVZmV4WHVoL1ErMHBQWEo5VCtUR2xwV1hOc2x5VnpC?=
 =?utf-8?B?TnVOdE5CeWVYaTZybkFEbTNJNUlzZmcvUmFFMWh2b2wybWJaSlhFQk9zU1o0?=
 =?utf-8?B?RFAxSUZEVlo1UkNZWFVnNEVjQjZpNTNIbFM5TmdSdU8wM3dsUGRFY2toSjA3?=
 =?utf-8?B?ZlRPUDByK1h2aUxJTHlscFhaaklOTUY1OERzb0p1Q00rYlliOUFCaHdrTWhi?=
 =?utf-8?B?M0xjVjdhazJhZUtJZmRYbFhDQVEvdFpWa1dlVlVxMWM5S2VVMWNOQVUxelkw?=
 =?utf-8?B?ekZmcFZUT3o5MkJBUFZOa2RKUU14NWNwakxyRU9iaUlXaWZGUFZDekplNkQr?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 625f66dd-1033-420c-c54b-08daa610f0af
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 14:01:31.6428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mdt/o2n14xvyed4tpJdYgc6bRckbjl4k3kW/CihyJ3w8h9+BUxG27bKo6ms5Y1jK8GfCUJGOPh4d3gVga86/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289

On Tue, Oct 04, 2022 at 03:10:57PM +0200, Jan Beulich wrote:
> On 04.10.2022 14:52, Roger Pau Monné wrote:
> > On Tue, Oct 04, 2022 at 02:18:31PM +0200, Jan Beulich wrote:
> >> On 04.10.2022 12:54, Roger Pau Monné wrote:
> >>> On Tue, Oct 04, 2022 at 12:44:16PM +0200, Jan Beulich wrote:
> >>>> On 04.10.2022 12:38, Roger Pau Monné wrote:
> >>>>> On Tue, Oct 04, 2022 at 12:23:23PM +0200, Jan Beulich wrote:
> >>>>>> On 04.10.2022 11:33, Roger Pau Monné wrote:
> >>>>>>> On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
> >>>>>>>> On 30.09.2022 16:28, Roger Pau Monné wrote:
> >>>>>>>>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
> >>>>>>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
> >>>>>>>>>> higher priority than the type of the range. To avoid accessing memory at
> >>>>>>>>>> runtime which was re-used for other purposes, make
> >>>>>>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
> >>>>>>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
> >>>>>>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
> >>>>>>>>>
> >>>>>>>>> What about dom0?  Should it be translated to E820_RESERVED so that
> >>>>>>>>> dom0 doesn't try to use it either?
> >>>>>>>>
> >>>>>>>> I'm afraid I don't understand the questions. Not the least because I
> >>>>>>>> think "it" can't really mean "dom0" from the earlier sentence.
> >>>>>>>
> >>>>>>> Sorry, let me try again:
> >>>>>>>
> >>>>>>> The memory map provided to dom0 will contain E820_ACPI entries for
> >>>>>>> memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
> >>>>>>> map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
> >>>>>>> overwriting the data needed for runtime services?
> >>>>>>
> >>>>>> How would Dom0 go about doing so? It has no control over what we hand
> >>>>>> to the page allocator - it can only free pages which were actually
> >>>>>> allocated to it. E820_ACPI and E820_RESERVED pages are assigned to
> >>>>>> DomIO - Dom0 can map and access them, but it cannot free them.
> >>>>>
> >>>>> Maybe I'm very confused, but what about dom0 overwriting the data
> >>>>> there, won't it cause issues to runtime services?
> >>>>
> >>>> If it overwrites it, of course there are going to be issues. Just like
> >>>> there are going to be problems from anything else Dom0 does wrong.
> >>>
> >>> But would dom0 know it's doing something wrong?
> >>
> >> Yes. Please also see my reply to Andrew.
> >>
> >>> The region is just marked as E820_ACPI from dom0 PoV, so it doesn't
> >>> know it's required by EFI runtime services, and dom0 could
> >>> legitimately overwrite the region once it considers all ACPI parsing
> >>> done from it's side.
> >>
> >> PV Dom0 won't ever see E820_ACPI in the relevant E820 map; this type can
> >> only appear in the machine E820. In how far PVH Dom0 might need to take
> >> special care I can't tell right now (but at least for kexec purposes I
> >> expect Linux isn't going to recycle E820_ACPI regions even going forward).
> > 
> > Even if unlikely, couldn't some dom0 OS look at the machine map after
> > processing ACPI and just decide to overwrite the ACPI regions?
> > 
> > Not that it's useful from an OS PoV, but also we have no statement
> > saying that E820_ACPI in the machine memory map shouldn't be
> > overwritten.
> 
> There are many things we have no statements for, yet we imply certain
> behavior or restrictions. The machine memory map, imo, clearly isn't
> intended for this kind of use.

There isn't much I can say then.  I do feel we are creating rules out
of thin air.

I do think the commit message should mention that we rely on dom0 not
overwriting the data in the E820_ACPI regions on the machine memory
map.

Thanks, Roger.

