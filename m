Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D17D4C6BE1
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 13:12:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280482.478428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOesv-0002Od-Ss; Mon, 28 Feb 2022 12:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280482.478428; Mon, 28 Feb 2022 12:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOesv-0002Ly-PC; Mon, 28 Feb 2022 12:12:13 +0000
Received: by outflank-mailman (input) for mailman id 280482;
 Mon, 28 Feb 2022 12:12:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMlY=TL=citrix.com=prvs=051191599=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nOesu-0002Ls-Cm
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 12:12:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6993fc1-988f-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 13:12:10 +0100 (CET)
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
X-Inumbo-ID: a6993fc1-988f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646050330;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BoN8B1+cDkPXX9B0BoNFj3nAifW7TvSeiefJpZxzqc8=;
  b=VXRU4L2gvlHA3Q2sznwY9+maS7sTL8Nrbvrd0IwP4UjwMmAcq4TXM3te
   JOVMJTuehdnht+rN9ZQF3EXmxthzrEqT+59vch7ETGmmnSpeCRyH2jfGP
   tD6M2ijxPftwhwVQdbswe9Pi/MlSg/Z59oJXU/f8T32n0Qdqt06fiJ92/
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64557514
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UneF6Kn9EdmDPfQlRy0OVc/o5gwwJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKW2GEPf6NZjShfNp3ao3lpx4EupSDnIQ2GQE4pSk8QiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DjWVzV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYbxcbH7CWpr0hUjZzHyRXZ6haxOHDGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3mHhmwHf8BPIvRZnFTo3B5MNC3Sd2jcdLdRrbT
 5RFNGcwMU2cC/FJEmgzK7R5scCPv3W8aCxGgUinu/Rr7meGmWSd15CyaYGIK7RmX/59lEuCu
 njP+Wi/BxgALcGe0hKM6HfqjejK9QvFX4YVGKy95+RdqlSZzWwOCzUbTVK+5/K+jyaWWc9Zb
 Uod+SMsrK073E2tUtT5GRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQp2
 0GImZX1BDVpmLyTVX+ZsLyTqFuaJiw9PWIEIygeQmMt4dPuvYUyhRLnVct4Hei+ididMTP/2
 TeRtwAlmq4ey8UM0s2T5kvbijihopzISA8d5QjNWG+hqARja+aNZZGs6FXdxeZNKsCeVFbpg
 ZQfs5HAtqZUV8jLzXHTBrVWdF202xqbGBvMs39yRad4yzWC0HKmVNpV/A0gIH48Z67oZgTVS
 EPUvApQ4rpaM32rcbJ7buqNNig68UTzPY+7D66JN7KidrA0LVbap382OSZ8ykiwyBBErE0pB
 XuMnS9A514+AL8v8je5Tvx1PVQDlnFnnjO7qXwWIn2aPVuiiJy9FO1t3LimNLlRAEa4TOP9q
 Ys32yyikUg3bQEGSnOLmbP/1HhTRZTBObj4qtZMasmIKRd8FWcqBpf5mO19Jt01wP0MyrmQr
 hlRv3O0LnKl2BUrzi3QNxhehE7HB84j/RrXwwR2VbpX55TTSdn2t/pOH3fGVbIm6PZi3ZZJo
 wotIK297gB0Ym2foVw1NMClxKQ7LUjDrV/ebkKNPWlkF7Y9FlOhxzMRVla2nMX4JnHs7pVWT
 nzJ/l6zfKfvsCw5VJeGMK/0lgjp1ZXf8corN3b1zhBoUByE2KBhKjDrj+9xJMcJKB7ZwSCd2
 RrQChAdzdQhaadlmDUVrchod7uULtY=
IronPort-HdrOrdr: A9a23:SU8YuakqeJutfaBqSa6TWWbM9qTpDfOBimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdS9qXO1z+8R3WGIVY3SEzUOy1HYUL2KirGSjQEIeheOutK1sJ
 0PT0EQMqyIMbEXt7eY3OD8Kadb/DDlytHouQ699QYUcegCUcgJhG0ZajpzUHcGPzWubaBJT6
 Z0jfA3wwZIDE5nCPhTcUN1ONQryee79q7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NTij9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDt1L9qqq
 iPn/4TBbU215rjRBDznfIr4Xin7N8a0Q6m9bZfuwq7nSW2fkNjNyMLv/MnTvKQ0TtfgDg76t
 MQ44vRjesnMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1VwKr7KuZ0IMvW0vFvLA
 BVNrCV2B+WSyLvU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegI28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1D8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/sukaSReoeMM4YDHRfzO2zGyfHQ08n3KverKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="64557514"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZy92LsyLFyneych8UrTzw6IdgEVsiu22FuoUM7BcL6afPdAPXU3tN5wru7DH1cNRM2Ao1d0k11pEBkQ4Kcu1lLtU5+dfxisH/LN3KMaPtDlsqs8tvoE3NN7HLVnIHreHSKYfUQqHjd0EIrpFZaFE8ObCavccAq3SW2g70mCFZVqPRtTzXIWZLiVwY7OS0h06O4TXXXLgA82XfjkBsA1cwQ7esbo9LgYg/CiDYGT7edxVf35+2H+oh3066rDOsItJNlFlR8RRjvrW6PdcOKT+7zMwAlD19UXcXCRt6//2HbAkpuEo0HDmHzqQjhXiwTQF//dptklWEU7P5NuUNQayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoN8B1+cDkPXX9B0BoNFj3nAifW7TvSeiefJpZxzqc8=;
 b=EjWnu2PT05DMYzDJp4x0o09cKzVFcEu7j03Q5aE23ykMoRHqQG20v8O+IOOL4X0AQtkn/Kel6LHlyAvvGmYA4BSK2lH3VgpnLIaUXrZ5igAMoGroT7rtVWG+qfoJbNtZ0nCZPl8rt0xVWHj8PlWnW7McMg/khV4SDFeoNaMxiWJ9xY8CAVvIwY8h/X0VL6xqCjD9d+vH2bAP1riKF+9pw0ZItAaf67mcaBR/qWfUcF+cWW8Es8sRFBznR7RyjrIpGtS00oQEn8FjeRScdQmgfyElagblugkyV1CpfjmL87yTWRUUTXdXfw7CBE1GMXgvovOUiqQxqDMgKvlzUGhl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoN8B1+cDkPXX9B0BoNFj3nAifW7TvSeiefJpZxzqc8=;
 b=V33RfkifVzlaGPpcztpzmvBO4/WBqGnsWgRjSbgIQtpGNUA6nis6YxQYsf1P7TvC8k/VTgW3l1aFM626arTNr6nviAK40OsZbeo7TTrKdIuGTe8z+R2H2D6nHwWkG9JmWKKnMzTrR/pdhXChzR4MjCWB/PzNyAar5SC/mpZLmVs=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYJO06JWynylsFtkyl8WR8WaDosKyixjKAgAGyPACABChhAIAATiCA
Date: Mon, 28 Feb 2022 12:12:05 +0000
Message-ID: <b1d6a6c6-9a57-e4e2-1c8c-448d6f8af9bf@citrix.com>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
 <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
 <22ae35a0-9df8-9357-4b44-2f00586144fc@citrix.com>
 <de431523-ad71-1cb6-a28d-07418886ee23@suse.com>
In-Reply-To: <de431523-ad71-1cb6-a28d-07418886ee23@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf254698-8e23-445b-9a6d-08d9fab3891b
x-ms-traffictypediagnostic: CY4PR03MB2647:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <CY4PR03MB26476C0D47735D730D9D9AE181019@CY4PR03MB2647.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uNA4cyzZM3Mgg7YRRPKyW4xiqHWQ8shMLoTYun0DuenesPH5bQHnRe+m/K2RAQbyKjnxVmm4OzUUn5/kXVtAB2nfcOnLNvykK6nsUEHPVHzMwfa7ONIi7RmGyWphGjrbe2hkONl1cUuYq4nTkBqMqt/BjoOSwio0AZEVZoES7ii/Cp959EKiaQeefT+cHLNbaqneiz3EfKaKDcnLCdlkAZS9D38iWAJ1cCOkEvPS1h7PN73rvFXP9ERVlF4mrj8k8pGOdUrx3+GzcUMBaXJM/AIMKhhXi2uxlrfBzq7Op78pDULclalwCTL8llDsmqKeSJyjA5ZfQDkoY9h+TrQzXbryUsHtpocpKc69Ui3B4wWaPEjN/P9f7J/k0ajNi540Xswj4Th6SitmLN94McHs9J4VKwetMSn+lG48GTFhLGOOz/ePFWOftYwtAug2KpHceFdyBsg7S7oBTouA2GNgX5l3V7k0iPyLDnR+qC779T1MyQ3LThpq2XbNa+Khpxw9Ju67rQI08dz7s2jao3YlYz4znmskynlDqxI3cBtbN3lOrGud62nJr+AmmJyo/Nc3wKyVH4m27zzxKxh121sVkCCSdDP/PJowemHRBTi7WZk/WYP/hdJo+rGL2SK0TFXVSuwmBj+1W7OQ4aNq9D4KzTSHTxnxHv86K6aLMbaSyeBWnOnezYqsB2aIDbhh7vp7XSwvy7Ta1HcwZQNvlRZqEijj4+0iEAgRY7Rv/iyH/skStN+/3q5ipyeVNYEfBiv/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(6486002)(53546011)(36756003)(38100700002)(6506007)(55236004)(31686004)(71200400001)(83380400001)(508600001)(122000001)(54906003)(6916009)(8936002)(2616005)(316002)(6512007)(86362001)(31696002)(7416002)(5660300002)(38070700005)(26005)(186003)(8676002)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(2906002)(91956017)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3owV05xRERocTN5UzF1ZE4wL2JVRnlsMTVnbDBoOThmbFk1TXlRbFZZditM?=
 =?utf-8?B?UTZReW81Z1l3V3pwOVBYL2x3NTE3RzNCY0I1R043QW5aZEkrVitoMGVza29H?=
 =?utf-8?B?amloeFg1NG1tVzY3SFNCRG5pTm5oTExMdVRYYURaN1FoUnVHckQzRVBGbFpP?=
 =?utf-8?B?ZFdUNUhBSTV4di9Mbkxwc3EvQ1duNnA0NmpqT2JSQjZUR2hiTnBSMmpzTDZN?=
 =?utf-8?B?TytHSW4zZGwzeGw3b2FMTnJmM05tMjYxWmVvYlV3NmZ2KzFSc0VqK2pMZ1NG?=
 =?utf-8?B?OTR6NGh4K0tRN241dHpRT3ZLQkZ1ZnllM0lNN2RmZU0xUGRKYmpldjlXcXRp?=
 =?utf-8?B?M2NRS2xRNEtJaE5ydzNPVE1oWldZZWZ2a1ZHWHlKQ3dYQ1FMeVcrT3FXQ215?=
 =?utf-8?B?MnZRY0NIMjRQL1dja1RmcU5QMWNXcElSb0k5cENRc0tKTC82OWo5ai9oU1ZM?=
 =?utf-8?B?QTV3aHJQRWJLa2hlNEZSTldPdCsvREtoODF5ZjN5OWFkWUZmSlV5U0ZDUWlD?=
 =?utf-8?B?YnFuTjZuL092ZjRuRFg0aFhIb2FHY3NIdEgzZEV1NndYdlBNUXRlRUhYTjJn?=
 =?utf-8?B?cVBhWWtYdGNBYXNoV3Z4Y2xhcHhhR3d2aTBpY0JFMUxoN0cwamlUN3N5bzFk?=
 =?utf-8?B?NEY2SGFYN1AvUlVpL2FqbzN0N2lIK3FqTzh0MmorMC8vamkyZTVnOHBkQ2Uw?=
 =?utf-8?B?b1JtQlp1c0ZteGhwbk9lZVZJWlFRRGFXNlZxZG51QWlNVXBYNGJoNjIyL2JM?=
 =?utf-8?B?dzZkRGNITTREM2dMWDBrRVdSRVBGVVVkS2swSFlPNFRhcDJKRzVBeXVEdkYz?=
 =?utf-8?B?RFlGVVBRdlFpTE0zR2ZGa2FIbHFpdUJ6S2JHb0ZXc3FmVkFEVVJBRkVBL3hq?=
 =?utf-8?B?VDFaRk9yVmlJVE9iN2dlOFpmWGRpWUhidjJTU0FBbW5MWTVZSFJ4QUZTZ1ZY?=
 =?utf-8?B?NXV2U3AyUGxMWU5tUWl6aUgwV3hya3lZZWZFcjd5WTUwMlN4NW16VjlDK3hH?=
 =?utf-8?B?bGpiSnNHTUNiTTZjU2hvSG5aQjRDK2JFeVpINXNhYXpNd3IwNDNZOVlxNGxO?=
 =?utf-8?B?eXdBQnh4WnVER2NqYnV4ZTMyS3ZsMjZvZXBoVld1ZTdIQldIUTJJb29xWFp6?=
 =?utf-8?B?L0tBR1JkSjFnQzlTMk10dWlIKzl1LzJKV01kczgzYUozVFEwRjAzeHl4Yzl2?=
 =?utf-8?B?bGRFKzNKMWJ3WmZXMW16eStrZDRXU3dDV3JzTFNwNSthYlE0U0t5Q3pYUmhV?=
 =?utf-8?B?dHlDTzhrcEJoQkN3azRzUC91NDJXbDRycHJlaG1nSkhqdHdEQzBydzN2d2tm?=
 =?utf-8?B?ZEVNclZZS01vSWh5aGxBWFBvQklZZzdLLzFlNXJ2MysrZUFFUDMyOHRIWnBR?=
 =?utf-8?B?TWNSVTZoaVAzUjlrbTgvR2lGQmJjek5wNG1ITjJXTnZOSldyZVVrUzRqazFC?=
 =?utf-8?B?Mklyay9VNkFlVVcybEZCUCtSQVEwWTNDNUVMT1ZCUUtjSy9tY3VYWDR6dEJ6?=
 =?utf-8?B?S25lNGdMTW5Cb1RYTkpxVUIrR1VKTUhFUk92VkV3VlF5OHVLbDFyaGRmNEZ2?=
 =?utf-8?B?OWt3aU1JTjkvQVR1dFRSV0o0a3pDTTRHSkVMeUQ1akxETVFLVFJyR0hVOGJT?=
 =?utf-8?B?dlNycVg5WHZyRk50dzMzWDRpU1BZMG9xbE4zY0tNb2pNd3FrdG03WlRtUkF4?=
 =?utf-8?B?YWRZaWRISFVkT2VRTm9lVXQxVGRhUk5Hb3cxT3lUeEtlMzBmajFNbXZidnZT?=
 =?utf-8?B?cTJ1cTd4d2tZK2RYT3pVelFrWEdnZGg0RHJlK05YM0Q3MTE5bitQKzlDakhx?=
 =?utf-8?B?Ym40VTJRcDZ4YktXTHZZL3kyVjhyTWM1RURkd3dXVzZSOEhTblZiRGJJamZl?=
 =?utf-8?B?WnpsVVNtblZTcUJJRUNsSkltREwzZGpLZSs5dkhwdTRNZ3JJR0NZeUk0OUJS?=
 =?utf-8?B?UURIdHl3VUozdW9nWUY2SnZvd1ZyTzl5ZmVGWGpzYjJneWxHaXZ0ZVpwdG0x?=
 =?utf-8?B?UDVDeFc5Y2VxSjllVTJieHFleHNCNHQ3Qk9BNU5EM0I1WGZWVnloSmZQdm5C?=
 =?utf-8?B?bkc5L2NSOU5OMWhIdlNGekNSaEdiZ0tFWFJzbHBKK1RLTmtaYTFOd29yUDlh?=
 =?utf-8?B?VFVEN0V5SEludyt1TzNCQjg0elRLS0Jrdnp5eWFjblZXbTVDN3NHRUJSbVUr?=
 =?utf-8?B?bU1Ja3dRQmFtVEhLSHluMXlMK0xrM0Qzb3FwdnFwOHhsN2pVWW04WmxiRUUw?=
 =?utf-8?Q?22jBzh0yfqXoS5yJtWkKxnJTuGwt0pw61WFmGAxDy8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A96C57A830C5FD4BB8F5DB7FC1B80F9D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf254698-8e23-445b-9a6d-08d9fab3891b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 12:12:05.4451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yCT1nlDlndrOGZCaBmLsPXW9CM/AqSFiys8QxzPqUsxZN2qcseRiSQ9osW/M/SPp2F3LC6ZskvUMAUBzY7V99NwI8ai+VNVAxuB/AIZUDT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2647
X-OriginatorOrg: citrix.com

T24gMjgvMDIvMjAyMiAwNzozMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDI1LjAyLjIwMjIgMTc6MDIsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBPbiAyNC8wMi8yMDIyIDE0OjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAx
OC4wMi4yMDIyIDE4OjI5LCBKYW5lIE1hbGFsYW5lIHdyb3RlOg0KPj4+PiBBZGQgWEVOX1NZU0NU
TF9QSFlTQ0FQX0FSQ0hfQVNTSVNURURfeGFwaWMgYW5kDQo+Pj4+IFhFTl9TWVNDVExfUEhZU0NB
UF9BUkNIX0FTU0lTVEVEX3gyYXBpYyB0byByZXBvcnQgYWNjZWxlcmF0ZWQgeGFwaWMNCj4+Pj4g
YW5kIHgyYXBpYywgb24geDg2IGhhcmR3YXJlLg0KPj4+PiBObyBzdWNoIGZlYXR1cmVzIGFyZSBj
dXJyZW50bHkgaW1wbGVtZW50ZWQgb24gQU1EIGhhcmR3YXJlLg0KPj4+Pg0KPj4+PiBGb3IgdGhh
dCBwdXJwb3NlLCBhbHNvIGFkZCBhbiBhcmNoLXNwZWNpZmljICJjYXBhYmlsaXRpZXMiIHBhcmFt
ZXRlcg0KPj4+PiB0byBzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mby4NCj4+Pj4NCj4+Pj4gU3Vn
Z2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBKYW5lIE1hbGFsYW5lIDxqYW5lLm1hbGFsYW5lQGNpdHJpeC5jb20+
DQo+Pj4+IC0tLQ0KPj4+PiB2MzoNCj4+Pj4gICAgKiBEZWZpbmUgWEVOX1NZU0NUTF9QSFlTQ0FQ
X0FSQ0hfTUFYIGZvciBBQkkgY2hlY2tpbmcgYW5kIGFjdHVhbGx5DQo+Pj4+ICAgICAgc2V0IGFy
Y2hfY2FwYmlsaXRpZXMsIHZpYSBhIGNhbGwgdG8gY19iaXRtYXBfdG9fb2NhbWxfbGlzdCgpDQo+
Pj4+ICAgICogSGF2ZSBhc3Npc3RlZF94MmFwaWNfYXZhaWxhYmxlIG9ubHkgZGVwZW5kIG9uDQo+
Pj4+ICAgICAgY3B1X2hhc192bXhfdmlydHVhbGl6ZV94MmFwaWNfbW9kZQ0KPj4+DQo+Pj4gSSB1
bmRlcnN0YW5kIHRoaXMgd2FzIHRoZSByZXN1bHQgZnJvbSBwcmV2aW91cyBkaXNjdXNzaW9uLCBi
dXQgdGhpcw0KPj4+IG5lZWRzIGp1c3RpZnlpbmcgaW4gdGhlIGRlc2NyaXB0aW9uLiBOb3QgdGhl
IGxlYXN0IGJlY2F1c2UgaXQgZGlmZmVycw0KPj4+IGZyb20gd2hlbiBYRU5fSFZNX0NQVUlEX1gy
QVBJQ19WSVJUIHdvdWxkIGJlIHNldCBhcyB3ZWxsIGFzIGZyb20gd2hhdA0KPj4+IHZteF92bGFw
aWNfbXNyX2NoYW5nZWQoKSBkb2VzLiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRob3NlIHR3byBp
cw0KPj4+IHByb2JhYmx5IGludGVuZGVkIChqdWRnaW5nIGZyb20gYSBjb21tZW50IHRoZXJlKSwg
YnV0IHRoZSBmdXJ0aGVyDQo+Pj4gZGlmZmVyZW5jZSB0byB3aGF0IHlvdSBhZGQgaXNuJ3Qgb2J2
aW91cy4NCj4+DQo+PiBPa2F5LCBJIHdpbGwgbWFrZSB0aGF0IGV4cGxpY2l0Lg0KPj4NCj4+PiBX
aGljaCByYWlzZXMgYW5vdGhlciB0aG91Z2h0OiBJZiB0aGF0IGh5cGVydmlzb3IgbGVhZiB3YXMg
cGFydCBvZiB0aGUNCj4+PiBIVk0gZmVhdHVyZSBzZXQsIHRoZSB0b29sIHN0YWNrIGNvdWxkIGJl
IGFibGUgdG8gb2J0YWluIHRoZSB3YW50ZWQNCj4+PiBpbmZvcm1hdGlvbiB3aXRob3V0IGFsdGVy
aW5nIHN5c2N0bCAoYXNzdW1pbmcgdGhlIGNvbmRpdGlvbnMgdG8gc2V0DQo+Pj4gdGhlIHJlc3Bl
Y3RpdmUgYml0cyB3ZXJlIHRoZSBzYW1lKS4gQW5kIEkgd291bGQgdmlldyBpdCBhcyBnZW5lcmFs
bHkNCj4+PiByZWFzb25hYmxlIGZvciB0aGVyZSB0byBiZSBhIHdheSBmb3IgdG9vbCBzdGFja3Mg
dG8ga25vdyB3aGF0DQo+Pj4gaHlwZXJ2aXNvciBsZWF2ZXMgZ3Vlc3RzIGFyZSBnb2luZyB0byBn
ZXQgdG8gc2VlIChhdCB0aGUgbWF4aW11bSBhbmQNCj4+PiBieSBkZWZhdWx0KS4NCj4+DQo+PiBM
aWtlIHRoZSAiY3B1aWQiIHh0ZiB0ZXN0IGFsbG93cyB1cyB0bz8NCj4gDQo+IEkgZG9uJ3QgdGhp
bmsgSSB1bmRlcnN0YW5kIHRoZSBxdWVzdGlvbi4gVGhhdCB4dGYgdGVzdCBpcyBjb25jZXJuZWQN
Cj4gYWJvdXQgY2hlY2tpbmcgdGhlIENQVUlEIG91dHB1dCBpdCBnZXRzIHRvIHNlZSBpdHNlbGYu
IEl0IGRvZXNuJ3QgY2FyZQ0KPiBhYm91dCB3aGF0IG90aGVyIGd1ZXN0cyBtaWdodCBnZXQgdG8g
c2VlLCBub3IgdGhlIG1heGltdW0gYW5kIGRlZmF1bHQuDQo+IA0KPj4gTWFrZXMgc2Vuc2UgdG8g
bWUuIEknbSBoYXBweSB0byB0YWtlIHRoYXQgdXAgYWZ0ZXIuDQo+IA0KPiAiQWZ0ZXIiIHdoYXQ/
DQpTbyBJIG1lYW50IHRvIHNheSB0aGF0IEkgY291bGQgYWRkIHRoZSBYZW4gQ1BVSUQgbGVhdmVz
ICg0MDAwMHguLi4pIHRvIA0KdGhlIHBvbGljeSBzbyB0aGF0IHRvb2xzdGFja3MgY291bGQga25v
dyB3aGF0IGh5cGVydmlzb3IgbGVhdmVzIGd1ZXN0cyANCmFyZSBnb2luZyB0byBzZWUgLSBpbiBh
IGZ1dHVyZSBwYXRjaCwgYXMgdGhpcyB3b3VsZG4ndCBqdXN0IGV4cG9zZSANClhFTl9IVk1fQ1BV
SURfQVBJQ19BQ0NFU1NfVklSVCBhbmQgWEVOX0hWTV9DUFVJRF9YMkFQSUNfVklSVCANCigweDQw
MDAweDA0KSBidXQgb3RoZXIgZmVhdHVyZXMgdG9vLg0KDQpCdXQsIGF0IHRoZSBzYW1lIHRpbWUs
IHcuci50LiB0aGlzIHBhdGNoIGluIHBhcnRpY3VsYXIsIHVzaW5nIA0KWEVOX0hWTV9DUFVJRF9B
UElDX0FDQ0VTU19WSVJUIGFuZCBYRU5fSFZNX0NQVUlEX1gyQVBJQ19WSVJUIHRvIGRldGVjdCAN
CmFzc2lzdGVkIEFQSUMgZ2l2ZXMgdXMgbGVzcyBmbGV4aWJpbGl0eSB0byBhZGQgbW9yZSBmaW5l
IGdyYWluZWQgDQpjb250cm9scyBpbiB0aGUgZnV0dXJlLg0KDQpUaGFua3MsDQoNCkphbmUu

