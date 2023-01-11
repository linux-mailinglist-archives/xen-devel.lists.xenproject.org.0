Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA5666750
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 00:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475753.737570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFkxY-0007O3-I2; Wed, 11 Jan 2023 23:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475753.737570; Wed, 11 Jan 2023 23:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFkxY-0007Ll-FH; Wed, 11 Jan 2023 23:56:44 +0000
Received: by outflank-mailman (input) for mailman id 475753;
 Wed, 11 Jan 2023 23:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHza=5I=citrix.com=prvs=3687a0f96=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFkxW-0007Lf-Tm
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 23:56:42 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9685ab62-920b-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 00:56:40 +0100 (CET)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jan 2023 18:56:34 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6787.namprd03.prod.outlook.com (2603:10b6:510:123::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 23:56:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 23:56:31 +0000
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
X-Inumbo-ID: 9685ab62-920b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673481400;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+wJnjP+gFDwTbENByDjE9DAEGhVAVwRyGY6u9OSpZ5g=;
  b=UKJHHSqVT3uhp1OIeSRXxkILm1WJv/zxAOZ5utZDsLiCDfyhJ2Ph+v5n
   k7a25Bjaeki9RMZ4+AtIWioErv4hUS6470OaTFvOisXNikb28YOwnm8RU
   QhQF5WzbRe4XPi+XH5/MJXSeX3En1BAyP655Ulyn9ih6h5wEjb30k5lfx
   I=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 91686049
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JtIO1KO0ShuUm83vrR2UlsFynXyQoLVcMsEvi/4bfWQNrUp21D1Vn
 GBLCDyBaareZGvzeop0boq19kMB6p/QnYAyHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo42tB5wVmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vdqCEN83
 +ZAE25TVT7YvLuR64Khc9A506zPLOGzVG8ekldJ6GiBSNwAHtXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vJxujCMpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eexH2rBtpORdVU8NZLvkyQ7EtKKSEHRGSbsfOdjGmuC/h2f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaETQUKEcSaClCShEKi+QPu6k2hxPLC9xlT6i8i4StHSmqm
 mjV6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHY1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:2BHan6yAukz+po36jnSbKrPxaeskLtp133Aq2lEZdPU1SL3sqy
 nKpp906faaslYssQ4b6Ky90cW7IE80lqQFkrX5Q43SPjUO0VHAROtfBODZsl7d8kPFh4tgPa
 wJSdkANDWZZ2IXsS6QijPWLz7uquPrzImYwd77i1NRZUVSbadkhj0JeDpy0CdNNXd77V5SLu
 vt2iKDzQDQCEj/Ff7LYkUtbqz4vtjWk5CjSQcebiRXkTWmvHeT8bvnFBrd9QsfVj4n+8ZezU
 H11zbh47mlsbWdwhvRvlWjiKh+qZ/a095eA87JrNYTJi6EsHfPWK1RH4eauSwzoqWUyHtCqq
 i1nz4Qe/5r7m/XfCWOrQDz1xLG2DIjgkWSsmOwsD/YuMnkQzB/NMZbn4JedXLimjAdgO0=
X-IronPort-AV: E=Sophos;i="5.96,318,1665460800"; 
   d="scan'208";a="91686049"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgP+NOhqtpBrg6HrrVxrdpTCBZRm6cLfGbDKnv84X+QZh8t74ztiC3nghUQDT3CymIg9HuP2x6ufEhw0R4KT5tT3PpZro2VgQkSHVGf8CoKyIRfj2dsPOjJNQiURk03Z2Z33yJAk1mxukjK0fu2icF1poD8PxkGc5X5o5c6MHKAbI/8IHJ+b3Ug/1jXPh6cTI7OC2pTEYE1w7L4qrrRbXnH5NCIt0dRGzH8+tjOSayBiqHgqwsiFXCD97zRVEjJWiU6mAiTrdFQK5ZMKSR+bhvGxIws1DCc2XvxIsCnAfsog81CQ1Nw03YCC7WZFYYFqAbqs4Vt9Wt4VpKEl4AK+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wJnjP+gFDwTbENByDjE9DAEGhVAVwRyGY6u9OSpZ5g=;
 b=nCDVBh7j/hSdw0qXjE0if9FxhUOYgPYKX+JoZ0eJ71bUZpv0dhpLesG4Crj9rQ7mT1FVGcUNAQxH2rCsb2epZQc0/5onHoLyfFxKDdX7nGofzuEP2GbG+4Xn3yBcC4FIgQyrYEOXLEj97NhXf3w9ytGHHc9dleWEJ+1XP8fvPPQYAquGrK+ITuibmcLSgd/gung6c/QfBiSySSVknplVdd4WTRnqxgRbJoFGTe9QfwRQ9nJa5vyt+Tqf6BPIZD0TCqHUtC5zlk4gkr08lvmSck0iPvhnY07xSB7smFlfXWSfHpMx0t3+CizoGgdUdjNbTNYMnimDz6d27nfkel3aNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wJnjP+gFDwTbENByDjE9DAEGhVAVwRyGY6u9OSpZ5g=;
 b=CVOmKgUbQ6coNqZ/g1IqCams8yCeHNv3Ol1KbP6niNAaJcdFGWbx+py/BTS6oFIhZLP4AM4Arbdey6cRVBjRwzav5rT/kht5rQJo51j3DqtVQNtkJR0/6VNogGq2y7LrZJ1MbgWyFwvpoAcXH2dyzGFkqZppCEXqyoG78lp64ns=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2 8/9] x86/shadow: call sh_detach_old_tables() directly
Thread-Topic: [PATCH v2 8/9] x86/shadow: call sh_detach_old_tables() directly
Thread-Index: AQHZJcSfDC5mFmcp2UCTS4rgBv7O2q6Z5R0A
Date: Wed, 11 Jan 2023 23:56:30 +0000
Message-ID: <722642fa-4eb0-930a-9755-f7780da65eec@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <8ed7a628-f64e-5512-efdb-4116a7b88a1d@suse.com>
In-Reply-To: <8ed7a628-f64e-5512-efdb-4116a7b88a1d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6787:EE_
x-ms-office365-filtering-correlation-id: ca53f7d5-9d4f-42ba-de2a-08daf42f7634
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nLeyYGoCqW9YYyZNVRHYQqv5g9xdq4sMOibRHYrm1WTaUuLmtSiC/zXhBwUpD/SduDJjg9A3Pqmm3Pwg78pe4m0KLvryONLinugKZhBLq+BCPLjyQUQlWFW3ADmXIxoHbYGLlTXbI/TMnM5jcUjkuFIB7ZvdH/LCjvGbno2NnEI8S3eFnAF6dHgM4Mok/BaHMopEQt5/XX80zWNxcjO0LL9rE2jFJtIaoPVXvd2Mp2DJ+EhKCqP5BNi+CfzROdlRSRyB7g7vwXg4yxAjcd6iptFXfDyKYCurPul2ZgQiaiPF+XVZR2yk3OU9UoSnCJdAYouYCXKvAzEE6YkyrlWK5j/ynOs1wRfhmSqAeDFE43uMmlQVVSMwqd+37TYPECUHj6PyrGQRFKGlmRtofMFhFm9vnZoc4f40jSUyCsIx4/ch7R4haegfS0liqcvDrd8gSejEkHMgRlFJh7akExwC5qr+OqOKU+bjztZwzw2OEW/OOYxvAlSKbuHtrtV54mYNo81pyAVa3qGV3QTtBtIIm1mE1SHNJctFhpQ+u4KqJKtqx+bFNEZihdMVs9fi3DeTNTppuIMuFt3SUdI0vpWFEMK8a+OtgVV0mIxnjx4bqaLG2TIgfUU6Hf4r7I9ml0bMWkRlLlFJlm447+TF0tR+VaZeYW3mdhwWgLCGwaC2/E9yf4HUR+QZqjdPsd1sh++Ts6ZNX/4iOq99PsEzQS0bhd5r6Lv+sH7gVvYwHWYcIa/fmG8t5VLQ1jMotMxVL1Nez2BPhP04RC/WevBig5EZJQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199015)(36756003)(38100700002)(186003)(8936002)(2906002)(91956017)(41300700001)(5660300002)(76116006)(66446008)(71200400001)(66476007)(64756008)(8676002)(66556008)(66946007)(316002)(4326008)(4744005)(38070700005)(110136005)(54906003)(122000001)(6512007)(26005)(2616005)(31686004)(31696002)(86362001)(478600001)(107886003)(82960400001)(53546011)(6506007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXcrbXI2YTZtRlBycW1iR250UkRTMVNBaVcxZm03THgwUE9qcHJvaS9QRUNC?=
 =?utf-8?B?aU5lSXRGL210TjM0U0kwMUcwQ29Kd25kRzR0ejQ0WTBnNElqaGpPTlhDZm41?=
 =?utf-8?B?cDc0WEFnTVpDOXR2MHhXU0JpbTY5bDBKUXh6a3RSNnYxMWFRL2Mrd0xqYXI1?=
 =?utf-8?B?Z09MR29icHdqR0NNbVhCL2R5TWdXVGorQk9JLzBZc3V1SkZUYm1RT2VPWmdC?=
 =?utf-8?B?Wm5adDd1ZFNSdy82d1lMdk9RUlBBYmFxeW1tQlQxdFRHL3B1RlJsL2ViaW1n?=
 =?utf-8?B?cGx2V2xscnpqclIxU1poaHUzOFRNWXgzbHpLbVdVcVZCdE9DcTl5b0dZeTJ3?=
 =?utf-8?B?c3VWOTBGVW9nOFF1dDdwcjBQMWZUZU1XUXNlV0k5VGFhK3c0dndaN1JTZFZy?=
 =?utf-8?B?c2FEMURWQXNKMCthV05aUVN6OVBXTmx3Q1hLV3VuU2E3bFVjZHg2NE40NkJl?=
 =?utf-8?B?ZWRVMi92eURyQmxnVWo4Q3lhaVEvZE1mWEV0bGVaaHpyM2pNZlZYY292aE9j?=
 =?utf-8?B?RVFLemt1WlF1bS9STndnZ0ZkZEVCQ0xFZFdoM3ZpNmZ0T2FvYzRUKzRIRDd3?=
 =?utf-8?B?THVCZ1ZicXlnTVlEMU5lcmNPb2g5QUc5ZHJlVG5GU2RsZEdUSFVsc3JGaGcw?=
 =?utf-8?B?TGo2V2R3Q0kvMHdNckVhcERVeElENzVpR1JjY25jdjZxSzMzSkh3cTBaS1lK?=
 =?utf-8?B?T01xbzBrVlZhNFRDRXZvMXhLMjlzQ1dCYmEwbnZqa0dNeUIrK2kzSGhIT3d5?=
 =?utf-8?B?UVNPOGRxMExkR1MwdlNGNzFWRFdYMThEOTlwQkdISGRhYm5sZUNUZmh6QVhy?=
 =?utf-8?B?Ty9mWjV6Rm1sRGpxVFArcWttNTVwKzRNTWRmYXB5UGhwQk5yeGg1d2NlZk1R?=
 =?utf-8?B?NkcrdTBQZ2lLWm5ZZytEOVZVK2RhbkNxazVLY0dINHB2OERaTXE2TzczZ0lR?=
 =?utf-8?B?VUJXeEs1Umdpb3hnQUU0dmpJU01vSjJmTU1MRmRoUjJJYWFINkZWNXdxTUdR?=
 =?utf-8?B?VFViMHZ6V082RjI2Z3RBaUpva2tsYTM3UVJUVk1uRG5ZUVNsYjJzVEVWeW1M?=
 =?utf-8?B?bzZWY29FZGtGdHJIaStXU2luaVE3ZThleHR0RGJ3YVVXcVh2U3hZTnBPb3Vh?=
 =?utf-8?B?dVZUQUhURDZEQ29iaFVhSEhQTlIxc1JHYXp5UmxHSkhGdVMyOFNBTmlJMEh6?=
 =?utf-8?B?ZkVPSFdiMHdRRkZUUkR3QUJWVCtMbEIwckR3N3RDZ3ZiVTZjMHhyU3VVTHdi?=
 =?utf-8?B?NitQTDZSNnMzcmN3VFFYRDc5Sk1VdGU1dmswK3lBcVRhTmE4SFBrbEozUUZZ?=
 =?utf-8?B?eUp3VVE4MWZ4TXRJTjlEYVEvZHl4TDdXSllYMk4rc3Z4MkZCbzh3aGlKQ2tV?=
 =?utf-8?B?SFV0b2p5Q2xiSHVabGFtR1IrbytmWUhKMWtLN0hscFZTRE9VTzVhRWdkanl4?=
 =?utf-8?B?Q0s3UmNWU3NMZjR2OW0zcE0rbHhtekJ1cXVpSlRrb0loYmE3SHVkam1MU3Zr?=
 =?utf-8?B?eStFOEhUbkIxb1dHN09QTUVVVGxKSjBZQUV4TEh1WmRRc2F4eldWNHBPRVYz?=
 =?utf-8?B?YjJNV1lweWtrc0pVbjQ3WkE1RytwMStna3pKWDZTbldMMlJmNVpPUDltbWJO?=
 =?utf-8?B?UWhuenV0QXVYRFlQY29lR1hidkswTHpBM0JSd0pSakVGM3RQdFdCcS9aK3R5?=
 =?utf-8?B?TXR3amRZVGFuQ28vQ1ZpdTNOR1dzR1FzbHVENFFwbXoyRDBBWGR5azBXeUdH?=
 =?utf-8?B?QnVSVThpQXE0SEt2cGhBSzd5RXBaZExCeW5TTFVFK0oyLzJxRC9vQ0oraVRT?=
 =?utf-8?B?MnZ4MXNTRFRnaG1Ta2RkTFI4UWtxRVlQQk5JN0hNTVY1alYvclBPOG9xdlpn?=
 =?utf-8?B?MnlQU0ZJb0ZIVUszc1ZycXc3dmVIMkdTbEcwM250Wldjd21CSm5IVTgyTThG?=
 =?utf-8?B?NC9JWHhTYWxKMXVBTkltS2RhZTZJQk9sc0VEUWd6aVhoWUlRTE9MbnBjR252?=
 =?utf-8?B?aEJNdDRvSlNoejg3NjN4QnZrdzJsenYwNVVWcDI0RXV3cGRQV05PVjNLVmNq?=
 =?utf-8?B?Wm5hZWFrQWh2VUtvZlA3eEVFZTM1THUycUV3Z2Vua0V4T3JiOENsRFpkeHBB?=
 =?utf-8?Q?SOIVn433i6r5hK/+lr5nTe9hK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F01CFA14EEB94646A10534179C9DEE01@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	me3Q3rIj/HukUybZXzlIpKKu3YsSTdJIGeQZUfD25iXc2AIscICKM5hyGNwq9VCuJRpcXpJ6b69ff9NH8joOWOwfkXRUbas1G/A6DDp5Z77kbGHptvUjdkw+hBn+ddx/A+G+h4eKnBXg20si6nMr3ybGtAYdKk1M6f/EyQeno+SJx4aAlaQr7XC+IPBZLUT9M9Zhh4UlkxHJlxkwQuAsOGrZ4zmsMTQBz3li0hlOfw2zMj0CdWBWvDOJI8OQDbnqSeiP20mcfAgkgv5sdCgZ8DPmXW4PxuTouwY2zWiIGN/Q/1ksif8x9M+gpXrWwjeMt6Y8DWldru/kazVW4a1TNhtNARFWyH5haCRXwQXVHdFkd+OshISuox+k5d9Yjq7oRIhVIwvi2LIXG33roxjM9dQx9oW7frN3PeSUZpLpBj+orUkp/qe1F9cCLKaRKqkIELl7ztmwu+RwrgL2hCfPab851XgsBx8rgW9Jp1/Wva2vpHxjQZaZP1FufyPk5V95KO6W76je30zdJoaJqrxzF7bdL24yZiipjwLpJlvtLq+ZK0W20CF/0nC+CTH5Ji6PecuRvNeBeYvAXfPiMlySpfysTVjQm4pCpCBm1g8/A+MWwI+m9IrxyD6Fae60NpKQDMM0bx+QCQQkP2EgcBYdtMi0Q/pqXTL2Cjw2O0NGZpttSrmn3ZGojKFLqdZfCKr3LbUO6nZMRZeJLr6V4a2H0HK7N8qD5Yq3RFX9UMDHMK5EaejSg4K7KnVnCjL4jtCewsLaODlOpqZ+LD6IiiEHzp19hy6f8WvxIN/hNU9Qv2hzN4lIEItbd1l9Xsb0Twppbrkz2+/mzGql54CeOzPp+A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca53f7d5-9d4f-42ba-de2a-08daf42f7634
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 23:56:30.9538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5BlEYfbHA88gYfQJLSSlsDXfD+ScFyjYq0/eE4VuHoP5RfIJyqL4xwZXn4zR2C0Z9GelYm/Y5s9mUBpotMvS3NqG7BEkY1opndtlm/0M4ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6787

T24gMTEvMDEvMjAyMyAxOjU3IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L21tL3NoYWRvdy9jb21tb24uYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93
L2NvbW1vbi5jDQo+IEBAIC0yMjY0LDYgKzIyNjQsMjkgQEAgdm9pZCBzaGFkb3dfcHJlcGFyZV9w
YWdlX3R5cGVfY2hhbmdlKHN0cg0KPiAgICAgIHNoYWRvd19yZW1vdmVfYWxsX3NoYWRvd3MoZCwg
cGFnZV90b19tZm4ocGFnZSkpOw0KPiAgfQ0KPiAgDQo+ICsvKg0KPiArICogUmVtb3ZlcyB2LT5h
cmNoLnBhZ2luZy5zaGFkb3cuc2hhZG93X3RhYmxlW10uDQo+ICsgKiBEb2VzIGFsbCBhcHByb3By
aWF0ZSBtYW5hZ2VtZW50L2Jvb2trZWVwaW5nL3JlZmNvdW50aW5nL2V0Yy4uLg0KPiArICovDQo+
ICtzdGF0aWMgdm9pZCBzaF9kZXRhY2hfb2xkX3RhYmxlcyhzdHJ1Y3QgdmNwdSAqdikNCj4gK3sN
Cj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOw0KPiArICAgIHVuc2lnbmVkIGlu
dCBpOw0KPiArDQo+ICsgICAgLy8vLw0KPiArICAgIC8vLy8gdmNwdS0+YXJjaC5wYWdpbmcuc2hh
ZG93LnNoYWRvd190YWJsZVtdDQo+ICsgICAgLy8vLw0KDQpIb25lc3RseSwgSSBkb24ndCBzZWUg
d2hhdCB0aGUgcG9pbnQgb2YgdGhpcyBjb21tZW50IGlzIGF0IGFsbC7CoCBJJ2QNCnN1Z2dlc3Qg
anVzdCBkcm9wcGluZyBpdCBhcyB5b3UgbW92ZSB0aGUgZnVuY3Rpb24sIHdoaWNoIGF2b2lkcyB0
aGUgbmVlZA0KdG8gZGViYXRlIG92ZXIgQysrIGNvbW1lbnRzLg0KDQpQcmVmZXJhYmx5IHdpdGgg
dGhpcyBkb25lLCBBY2tlZC1ieTogQW5kcmV3IENvb3Blcg0KPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+DQo=

