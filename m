Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAA357CB4D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 15:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372729.604642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVqO-00062C-Go; Thu, 21 Jul 2022 13:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372729.604642; Thu, 21 Jul 2022 13:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVqO-0005zY-Du; Thu, 21 Jul 2022 13:03:56 +0000
Received: by outflank-mailman (input) for mailman id 372729;
 Thu, 21 Jul 2022 13:03:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CZbT=X2=citrix.com=prvs=1940a87fc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oEVqM-0005zR-0U
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 13:03:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fd52f9c-08f5-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 15:03:50 +0200 (CEST)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2022 09:03:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6433.namprd03.prod.outlook.com (2603:10b6:806:1ce::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 13:03:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 13:03:42 +0000
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
X-Inumbo-ID: 8fd52f9c-08f5-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658408630;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LmwHlkhS/Q2Wrazq/C1lp3LBA9t5NC5TsjEQb79l8Bk=;
  b=HzrBk8lq7p0dwAbcYJmfTSo032s9FBVINFIrn0ptdF0ca8l88q5F1mpP
   vVhX75/IcIyCss51r1zkd9g4gECp27U8nVWhTgH9CN6uQy6c0Pox434PK
   SiOXgh5S5UasbLGLxRWuSV7gw4JVwuUocdALuODUatXxdEhZ1+pNPM+D4
   U=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 75612341
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:te0s1aiS9Ejt9fBXowIZdIO7X161UREKZh0ujC45NGQN5FlHY01je
 htvWz+DM/qCMDGjeIpzO4q/8hwD65fSxtFiHFQ5+C48Eykb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaAr414rZ8Ek15Kuo4WtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eI84J5L1qLjtyq
 6IYcTAoYzvZ2OO3+efuIgVsrpxLwMjDGqo64ygl4RSHSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF9xTM+vBfD2v7lWSd1JDENtbPd8PMbsJShkuC/
 UrN/njjAwFcP9uaodaA2i3x2LaVxn+iMG4UPL6Kxq9Yu3CS/DwSARlNZX6Kk+mgsUHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAbShZRZdpgs9U5LRQxz
 UOAld7tAT1psZWWRGib+7PSqim9UQAeJHUOYiIsRgIf797u5oo0i3ryos1LFae0ipj5HG/2y
 jXT9Swm3exM14gMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2sIji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:vu/fKaF0SsChrDgGpLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2DwqT+GLEXQI+lllutEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.92,289,1650945600"; 
   d="scan'208";a="75612341"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EY2nri+7shTNKtllwTpB3WNKePPxmZYrhavp4h1bhZ/I4u+plxhvwMW8BcOaAh/t6/FnhOR3arDnCqGA1z5eWHuH+kUFDkYrwccy7AtHrvHUF9+FjHgnsxLDYujGxyrnlJjpRIMHOEKT0vIYe85i9j59sP9YvHJ+zVd3hIspKoqLpW353ZOzM8KFMcx4ih5Gg8+1Wpjb6sNepnMdlqqhREP3SaEatKSNKOBLy/lvemszAWmmhTf9m3av0FLiRbzhSJpHTknrMAu1NWEVOd2wDFNMK48IZVj+yfMwp4Uo/M/wIGgZDI9RJUNWL0ufv80+QbSWAfL4jLAiJBxRahuqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmwHlkhS/Q2Wrazq/C1lp3LBA9t5NC5TsjEQb79l8Bk=;
 b=b6N4iz3uIqr3ZOg9hf1psaQMW2+DLK7JGMGoVyMjRCnoH2rE5ihly2KZdpLkya9D4dgVBS2Yfw9PXEob4+ebw8x3mcQdz9cMTIr+9UBLvFcvL1HGwTBcJJkv7fH5qEyHk88gf5tKGmZpcF3C2XuhrmgGajf4qtoKfwmJEsuUaKPd7CFDh9zd4+bSArxewR69oM2l/j22vZhs6+8/q2aPCgQZ99Spc8sls9NB4MXFastQnKxLZTWlmBtwV5XWKcIApqGN3Dw0PN07z56vke7/9XmrBxbdxE6xPBC0EsEfjkClNsH2LNUKLm9xMO5DByz1UvWv6By5cfW0HHDIlXFNzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmwHlkhS/Q2Wrazq/C1lp3LBA9t5NC5TsjEQb79l8Bk=;
 b=lBNoglBshbMq0VbSyp4GYklWS/4VNQGo9IG3/KuJ6/xs2CUqnYrrZt3cJjZ83yocZeh14nK5+V52hcVRVBJfLcJlDe+AdOdqwOq9SYrFxxCF5ViWLU6KO73lHV3uFrcviAkhRtgjpDdx+1d3bbSi2/C+n+ZmpkMZFawglYMhPDs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "wl@xen.org" <wl@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 0/4] Some improvement for gitlab CI jobs
Thread-Topic: [XEN PATCH v2 0/4] Some improvement for gitlab CI jobs
Thread-Index: AQHYnP/ekdkOx/Oyl0y0AyUNUkwaXa2IypmA
Date: Thu, 21 Jul 2022 13:03:41 +0000
Message-ID: <b7aaa9c3-bd06-4d76-36f5-381333247697@citrix.com>
References: <20220721124602.9910-1-anthony.perard@citrix.com>
In-Reply-To: <20220721124602.9910-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60ad677f-8c3b-4633-985b-08da6b196fd0
x-ms-traffictypediagnostic: SA1PR03MB6433:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BDdzvllgwh0M/zOl+X8uEjT9t97QzYc8Ttf5s2Pjv7eBg0z7vVbm7BEM7Sz+aa+Dm2/zcQg6QaZf1OAWkJ4d2wzL5C1xAqQeiUvDFO4JH42LGUwKoIPdpB/bGslMX0UYrJtP7tFbYgoQV34BpsqniwiDACZtIrgrnFkqNJ/r8RZZS140JI58YXCFPSeJZFAm4pzwLVqSM8hsmbsjqfl4TErI7ixaVp7iiKvTLjMk6lSdipzuEGAsbORV7VJGZp2to+FduIl4uSI2m35AJedk+1SbIvKCr6mXE5svr7xvmI7Wp3ZnyMwbN1Ksj6fXhRkRyAszMqfFVSgQn3b7WssvvisA1bZdWQ2qT7zDgKQPon0euErOqXvE8VcRNbDHqTe7/I8ApExxY+Tk2wfxbcqS01XC+gSMtVW3hYfX1Avcc3KDX4O4R71Urm4n79xPe+dXcsTmh5Xk3FI/HdwBbvD1VDPxCg3Op2Rup+ZJGpgYz1ZHELUSMrlcirtz37FW/6Y7mCPYv4Hl6v6Gc4P+D+YzOU6hV+uB+htGA76kPjp5f+1yp67o5dY0DF8jNl0qBvTvvDRDxqeSKIFoVpOFyGJpNgjGTSxKFomRZotgkGy5AqsnZDCx5FFs0BMKNzWpH3bR+vpHDPB/3FTyEIQ7G1c9gePv+AulXtt+oj0QPIkBNBXuau+cbf0+ZM2dASEc6LtPjd4h21WxBrIs9taNmfd/tv8mDsWSZ+3RINN7Syg11Iym/05HbJPdTGWL+kQhcdla6TkdLtuUXfjt6k27wwNbFT1NdQoGWbHRnufEHluJ813THr6LUzbOR0D+YJnYPnsFNdJy2nyWriU00DEX5gn3o+nOv5tI4s2KGUM6OwLl+w/85asqs3n5xdtDS5CVzozk9JWUCWUod/Jj9rB4LXD6Xg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(38070700005)(31696002)(86362001)(38100700002)(82960400001)(91956017)(66476007)(64756008)(8676002)(122000001)(66556008)(66946007)(316002)(4326008)(66446008)(54906003)(36756003)(76116006)(8936002)(6512007)(4744005)(6506007)(26005)(53546011)(5660300002)(2906002)(110136005)(186003)(2616005)(41300700001)(31686004)(478600001)(6486002)(966005)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHhZbXF0RlMzN2pIMXY4VHZ0Qm1qODdmZzd0UUxLSStqQ3lXcTAvWlVPQ25K?=
 =?utf-8?B?QVVRRVQxUGFWaWJTZU9CelZPVEVxNkJ1QjFoZ2huUGlMd2tFNWo1TENTWTdu?=
 =?utf-8?B?b3M3ZTFpNVI2ZUxxNi9PMGdpaGRpWm1yWmVFSzB6dUxybnRVK3dsMzJuckVY?=
 =?utf-8?B?bE1ueU05bDdoclF0WkdrRkRoejhOakVHdTE0QUhmNFpvMDgwWUZobUhiWGwz?=
 =?utf-8?B?Z0VnLzcxUzVjUnlkNlJPQW9oVnMzMU42NlpKWW5TK0hxSDhoVklQOFRqM2Jq?=
 =?utf-8?B?Z3Z5dEQzbk95V2tyZzBYTmZsV05FN1ZEREN6aS80RlNtY09BUEtnUjBETk5R?=
 =?utf-8?B?dGtYS1V1WHpLbGlLRjVLM3V2d05XVEUwZlA0NGZUNkU4SWlHMlgybmNPdHFw?=
 =?utf-8?B?YngyQ2lXdDRyMVlKa09KMHdZekVrcENsZmtDRWdkbi9mUXlBWDlrMVpZVUtV?=
 =?utf-8?B?ckJYRUxRcXlpQ2Q3azExUXYvTTY4ckRxK0dKaUZqa2FnSVRtSmZmVHBmM3Y5?=
 =?utf-8?B?cFg3Y2czdENXOXZvbGtGam9hdVAzdnJYTFl1MnNoZkVicTNvcjZxQklEUjVv?=
 =?utf-8?B?UUtzVE1LYTNDQ2dUaHBmYko0c2VIMHQ2U2pld25aR1VSVlh2M1grbldHeVVp?=
 =?utf-8?B?M1ppNVlFQVAyL3V3NFVUQTlPb1I0T2hyU3F5ZWVuaDhPR1NCNDdKNVd1M2Y4?=
 =?utf-8?B?dEtHQWMvR1dUVThBSXRnY1VKcDBJUWlUbTVJRlcrM2xDV2JhMzJqbWZhZ0M0?=
 =?utf-8?B?T2NtYVFXNjBVK1NnOWtLZkFYaTNKQm5EYXd6UUNiMzY0aVZyZ0tuVDVwaXAx?=
 =?utf-8?B?dWJBY3RoYnhOb0xHRTlRcHE5d1YzSkdQSWZZY1hjTE5kemp6NUErUTc0ZWRL?=
 =?utf-8?B?QS9SMUU3QUQzbzJ3NlZIMWUvc00vaFBpVUM1WXZzbzJiTjhodG45dnJHcDdT?=
 =?utf-8?B?eGZmY0JVaHUvZ20vbnJsazRpVFpmcmE2RlhGc0pad1VFcmdsU2M4QTlnUXRu?=
 =?utf-8?B?emtXRzk3QlkxcEhzaTRjeWpvVm1NN21ZOFpmSUU2UDE5RFR6ZnlCdFNCcEs5?=
 =?utf-8?B?N1loamRaVlBKVkZpSFZyandmUmFySHd3M25uSGpncGJkS2VnWG5MaEFKdkJN?=
 =?utf-8?B?aGNhMEthcWk1R0k1bUxSQng2SVdNU0x6Z2d1T1ZGcWplZlZNd21EeDRFZXRa?=
 =?utf-8?B?bU93Sk91TjFndG5saVF3TGdKZTNMbWN0QW9POGhvL0txUHIrL3hzczJ1Rk51?=
 =?utf-8?B?cmthTG9CMm54bDcwYkhuVk9qNVNkdGtTSG5SQ3AvbVBoaGdUUnZ0TGg5bFJi?=
 =?utf-8?B?WUNIMW5ySDBpcTl2ZmFoWWFEYjFRb3VtdlA5YXZtUGFEZVZlM2h1czZVNXNk?=
 =?utf-8?B?VGkyUTBNd045SlBRdG11Q1ZjTitaWlVaYW1JS2MxVHYvbnpVNjhvNmlEaG1q?=
 =?utf-8?B?NFozRzhDRVZ2dEdRUWFVaHY1SU5IS3N1TG5LWFducTVzanpBUmViekI4alI1?=
 =?utf-8?B?Q0pCYnl3dzlaY1VRRGdVNzc2NFhjb1RQTit6cC9lL0hSY3FhRXc2eUhwQjdt?=
 =?utf-8?B?SWRIVkdVUUVIZ3R4bGF4akNQWFFFeVA1MDlsc0pIWWNicUpUQisyU3E2MWww?=
 =?utf-8?B?eXE4bUZiTlBSU2NqVzFBM3lzeGRINnBPOGVDL3pCUXhEeERFMXhBQ01Va1Mv?=
 =?utf-8?B?eWJzTzRVeTJLb3Q5QXZCQlkzaFQxcDB2VTFJL0ttQkN0QXJldmtpWXlmTWZN?=
 =?utf-8?B?RnNvZXI5Mk5oMkg4RGw2TVVtSGFTZTBDbnZ2QVRjZUJtRWFJelZQaE9uVlVN?=
 =?utf-8?B?bHFOaXE1R1ZiWmdtL3g1bDlHck81ajBob1I0TmJuZlZjckFJZ2xrYTdGUlhB?=
 =?utf-8?B?bEZrZkNXQ3RyNjFSTlFkNmxHVGREeE5paUdSbmpaelNuNjh1SXc1RnBuOXZN?=
 =?utf-8?B?ZkY3ZmgyajV2STh5eDdmaU9oZ3d3aWovMmZxaTNGNlNmaDdBL0lhaVlUMmda?=
 =?utf-8?B?cktNemRsTnJ1ckg1UkJhK0cvbkgrYk92UlZoaHpWUW90UFR6N1lacHVUc05j?=
 =?utf-8?B?M2lPNUE2T3R2Ykt0UEc2RlBzUjJzZzBDMktIODZYRkM5SVcwSXZNT1hVMVJj?=
 =?utf-8?Q?oorbSR06DwwAlBCxpoNt5JpUL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <232A1CBA32CB9E4E8EE865056FA61B9B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ad677f-8c3b-4633-985b-08da6b196fd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 13:03:42.0017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0yRb8/nBG8T5ZqHvb+BXlNHqwrngpapxDdNdDZ8VJ/Rh9RqZSPHqkj2EMaAfOnX5CZ0AptuMDRXTABLGNar3/b2Im7xy6iNZ/K1PUMqpY6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6433

T24gMjEvMDcvMjAyMiAxMzo0NSwgQW50aG9ueSBQZXJhcmQgd3JvdGU6DQo+IFBhdGNoIHNlcmll
cyBhdmFpbGFibGUgaW4gdGhpcyBnaXQgYnJhbmNoOg0KPiBodHRwczovL3hlbmJpdHMueGVuLm9y
Zy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJyLmdpdGxhYi1jaS1p
bXByb3ZlbWVudC12Mg0KPg0KPiB2MjoNCj4gLSByZWJhc2VkDQo+DQo+IEFsbG93IGJ1aWxkIGFu
ZCB0ZXN0IGpvYnMgdG8gcnVuIGNvbmN1cmVudGx5Lg0KPg0KPiBBdm9pZCBydW5uaW5nICJ0ZXN0
IGFydGlmYWN0IiBqb2JzIG9uIGJyYW5jaCAibWFzdGVyIiBhbmQgb3RoZXIsIHdoZW4gdGVzdCBq
b2JzDQo+IGFyZW4ndCBydW5uZWQuDQo+DQo+IEFudGhvbnkgUEVSQVJEICg0KToNCj4gICBhdXRv
bWF0aW9uOiBmaXggdHlwbyBpbiAuZ2NjLXRtcGwNCj4gICBhdXRvbWF0aW9uOiBhZGQgYSB0ZW1w
bGF0ZXMgZm9yIHRlc3Qgam9icw0KPiAgIGF1dG9tYXRpb246IG9ubHkgcnVuIHRlc3QgYXJ0aWZh
Y3Qgam9icyB3aGVuIG5lZWRlZA0KPiAgIGF1dG9tYXRpb246IHVzZSAibmVlZHMiIGluc3RlYWQg
b2YgImRlcGVuZGVuY2llcyIgZm9yIHRlc3Qgam9icw0KDQpMR1RNLsKgIEdvdCBhIENJIHJ1biBv
ZiB0aGVzZT8NCg0KfkFuZHJldw0K

