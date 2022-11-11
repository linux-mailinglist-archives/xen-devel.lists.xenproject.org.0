Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 684296260AA
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 18:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442680.697099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otY7T-0001UQ-ED; Fri, 11 Nov 2022 17:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442680.697099; Fri, 11 Nov 2022 17:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otY7T-0001Qv-8s; Fri, 11 Nov 2022 17:47:11 +0000
Received: by outflank-mailman (input) for mailman id 442680;
 Fri, 11 Nov 2022 17:47:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caZA=3L=citrix.com=prvs=307ecc5a5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1otY7R-0001Qp-ID
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 17:47:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daf09bb0-61e8-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 18:47:07 +0100 (CET)
Received: from mail-mw2nam04lp2176.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Nov 2022 12:47:04 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6474.namprd03.prod.outlook.com (2603:10b6:303:121::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Fri, 11 Nov
 2022 17:47:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 17:47:02 +0000
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
X-Inumbo-ID: daf09bb0-61e8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668188827;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8YQyqVhJN6151+7qOuGBFn37agomXb/nUWcYX6AHZ7Q=;
  b=BYGXQtBaAiZ58xgeIGtXI+MSRYQf5Uropi/ArHnIrHqim12RzXSuqzeJ
   oc0JBkRZMVp1HRtPCEKBb225QHzqC3+wqpgX4ssy2sfJPKRPoGccI67df
   Dr5Ng1FvidwhetPz/HOF8NyTu2SQo1kNMQIlNRTy+B6JJSeJHoBDaRIsp
   U=;
X-IronPort-RemoteIP: 104.47.73.176
X-IronPort-MID: 84659818
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MtLBSKIwpUXJlkr3FE+RI5QlxSXFcZb7ZxGr2PjKsXjdYENS02MCy
 mdLUD/Ua/bfYjfxfYt0O4vn/U0A7JDdytZlGwZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wVnPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4oE0xws
 vkaDwwnURGkqfm2nrGxEvlz05FLwMnDZOvzu1lG5BSBUbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTGMkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzX+lBdNCTe3QGvhCvmDQ+moVVTgvXHShrb6itmDhdOwYN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml6qfS+RffOWECQRZIctlgv8gzLRQy3
 0KNt8PkA3poqrL9YW2Z3qeZq3W1Iyd9BW0fY2kCRAgM4djmqakyiA7CSpBoF6vdpt74BzD2h
 SyLpS4WhrMPgMpN3KK+lXjXjjTpqpXXQwod4gTMQnnj/g5/fJSiZYGj9R7c9/koEWqCZlyIv
 XxBntfE6ukLVc2JjHbUH7tLG6y17fGYNjGamURoA5Qq6zWq/TikYJxU5zZ9YkxuN67oZAPUX
 aMagisJjLc7AZdgRfMfj16ZYyjy8ZXdKA==
IronPort-HdrOrdr: A9a23:Lyv4Ia5jPA1lxVQpegPXweaCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+843WBjB8bZYOCAghrmEGgC1/qu/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXerIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl+WemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FrQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMkp
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvuX+9Ua1wWB4S2rpXVt
 WGP/usvcq+tmnqN0wxi1Mfh+BEmE5DRStuDHJy4PB9mAIm4UyRh3FouPD32E1wt67VAqM0md
 gteM5T5c5zZ95TYqRnCOgbR8yrTmTLXBLXKWqXZU/qDacdJhv22tbKCRoOlZOXkbEzve0Pca
 76IRplnH93f1irBdyF3ZVN/ByISGKhXS71wsUb45RioLXzSLfiLCXGETkV4oGdiuRaBteeV+
 e4OZpQDfOmJWzyGZxR1wm7X5VJM3ERXMAcp95+UVOTpcDALJHsq4XgAb3uDauoFSxhVnL0A3
 MFUjS2LMJc7lqzUnu9mxTVU2OFQD2JwXuxKtmvwwE+8vl/CmQXiHlltb2Q3LD6FRRS9qorYU
 B5PLTr1qumuGjexxe801lU
X-IronPort-AV: E=Sophos;i="5.96,157,1665460800"; 
   d="scan'208";a="84659818"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7QuXDJmfSGzzPflFl2Omw6zlJcgafQkueGLpP5TM0rDpEInH1+zGkZNlP3040jUulZ1puTzrWEzhgwYvhFJTylD6vK0ngREjuspgAXYPIQ28qJDIbPR7kwDPgKajJzzAtGzGpINsgDzO+To+Ur/dvgYKw1HPnaIO+sM9H7Guv11XFHpHxRhHsLxEtKPwhvmNPm/p0sLK62Jrppu2ADF9+bdzltoirKXO+kWWWDl52y4hBEQ+BzKJbhUzcKvy9zmSEK36IBVylBPX1ih+EagKSkG3vEJ6xSTlKDSJz9Mum5HrSFIgwVH5rU8l0iwcKTTuuUD3yMdZF8TSm+pBvqyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YQyqVhJN6151+7qOuGBFn37agomXb/nUWcYX6AHZ7Q=;
 b=PHQGIjP7tWzpEuihQYAMOlPTZ8XjzyUoC9V3i5iUFxAOfv3MH7+AEWnU2vPv85wJqiewct1qF9EywQFeLF87IDyCoMV6GhqaaJfH51VLxh8S087ABDAsOTi/fQk73TM+L66N2nB2FBAg4KMwUre+BgdnN7KZ69aOA+GK7hKzbfLjogCWm34vvndTGPFh/OhbEXCH7guQMaywIvCo9+IYfFD7z3OnINeUpqJh8X35ccR+lZ9kA1N+Zoy8rPXByCye2v/QwaQwFK6ZNyRI2OCQA0V6lkFmrua/3Dj6wM2JsODH3cL1HfJv5rNoInbpwthhrzaygy0ciAZqevTdUeCW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YQyqVhJN6151+7qOuGBFn37agomXb/nUWcYX6AHZ7Q=;
 b=iho10ML+hhtprGgm32v/2IRDinPSOTobCg8LQSbv7HTBlpE5tuRzpPlQBiAigxbBITmveINKWDRwocwUTQkM2XyJjqEs5JdCEK+ALUXksQ+l/FVKgHv9ImuKGX4CMAszjR/fDCl4F2z/V4rSQexD5rHGcayEkAUhl/uQrccmEek=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the APIC
 assist options
Thread-Topic: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the
 APIC assist options
Thread-Index: AQHY8GkXjZEVf2M/t0iebvsck9V8qq44y+aAgACWeYCAAKSxAIAAA1KA
Date: Fri, 11 Nov 2022 17:47:02 +0000
Message-ID: <1051eec8-8074-39e8-299d-a540d12bc997@citrix.com>
References: <20221104161815.38007-1-roger.pau@citrix.com>
 <69841767-ccc4-5eeb-6e9c-d59dfb197ea5@citrix.com>
 <8e52a065-0141-f75c-03e8-e9ceb18a0aa1@suse.com>
 <4d0edf44-bb7c-85d9-0890-79c999428ef6@citrix.com>
In-Reply-To: <4d0edf44-bb7c-85d9-0890-79c999428ef6@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6474:EE_
x-ms-office365-filtering-correlation-id: 4a07e13f-ff28-47cf-2cfc-08dac40cbd74
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Jx9M5HdFo/BVr/mm4m3i/YIaWXRdg4Qpr0/H9+srXnqCEKUlUXfV2MXOkUEA+4ocuwL/mc1EXvtdPoRmVd4lT1vYc3dqnX6jM/rBFD6hSKTKTwepIcNCdOyRKW3VRs1qUTNQ/spn9id9pXd2G0OFCX5+n3vX4JiV8PV/ix22HjIIBIzAEzMymjfjAi2K15GbXr3ImXpTUf6tJk8H7ythOh1dTtVMV1syfb2hW+RqcIacGaLllS/apXamLd6qz6zxl7wCNqZTAEFbidOeTBBgYr8BjpimTMCDewYlOV5YrU+EDvLJJvhUcGYgnNUGa7o5QaX2ZkMuZmzAn0urMAgSESK7fdQ0NhyNryhTkiFWYqHs3JlyT7B8FdW54SR/y2zAoEtDE2e7DKT/bA+F7pqaVRAsSCgMyyGhXzqJGXViokfLcDwqpJz7FsFRLOD0Vhuhg01HSS5OZRizKC0zlKWb8pY5XsCurqe1dzCUKYaiya1VMaXVHw45IU3YRTGMXoVBB9ytJZP2uO89cJgeag9PojaESMlkoEYLJF4frFaTTU/ZsfWoI7RXTfa+/LnrBZ3ZvFNc8DXMuKUMBUyf//UU8MqVfNVopBuwTsaLbC0p5GP3mlNBFhbEAXabzQDSX4BMlTa2XH/pQxtqWQ23gDHG5KKdHlapPrw9cjjiIJ3sOOpMONl4yJ3CLwL6GBuZz8BsHN/gkqxzwWUkEeYw5At4uqWxN5B3ztvLFTDIeCzDfbRWMfr8tqVvPKf2J9S5YGMmEwVJPlsd71rJUxd4pdp37RN6ivMF5IQ3MM8ePHPovL2GguNnK2+2gzclKD3eh47u6r1zCKDVYo4Ehlz6KZif8w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199015)(31696002)(83380400001)(71200400001)(38100700002)(82960400001)(86362001)(38070700005)(6512007)(41300700001)(4326008)(5660300002)(122000001)(26005)(8676002)(6506007)(8936002)(2906002)(66556008)(6486002)(91956017)(66446008)(2616005)(64756008)(478600001)(186003)(53546011)(66476007)(6916009)(66946007)(76116006)(54906003)(316002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aDZIWmlvYkV4bmxrb0F6QW5jVE8xdUMyTnR6clNjL1hNc2NwT1puQTVuWDdZ?=
 =?utf-8?B?RW41VVlmeWlHb1ArZjhGam45UDVvMjkzdUJVZ3lNNFF1d3lrU3FZRVVBMjhH?=
 =?utf-8?B?MkRYNTUwNG9xT3VzT3dLNHJ3bWszaGlGdW53Q1QrMUNEV3VzOFRYc3VLaVJZ?=
 =?utf-8?B?UWlYWld5QTBnOUJibEc2RTlFVW5ReHZ5cGg2VVluU0ZPdGtWV2RLdUhVZjVq?=
 =?utf-8?B?Nk5oc04zN2dFakpsR2MyQlBLNUJnelQ1eEl2TlBuWjlQWjZUL25jQ2hrTGZE?=
 =?utf-8?B?ZFVNR0wrcERVcWRLRkVIYmJIWXBvU2NKc2c0QkQ4R1FyTDcvd1hBR3RrczBu?=
 =?utf-8?B?SHIyeEVLcUVkKzlSZ1RpUjM3eVJzR285RCtZRmg4TkFhZzRVa3BNbUlvVDdD?=
 =?utf-8?B?ZXREbjU5VDUwdXdiNU9FdUhVL3dHeEIxMEYyb2VYd21pTG5aOGhpeWIyZ3lp?=
 =?utf-8?B?VUFKUC93MUp6Y3hERUhFSjBOODJmMHZHb1RWSm5RVFdHV1RwTWUrZmlxMDNq?=
 =?utf-8?B?WnBzR2ZjWkNtTmVwR2RlL3MvejVmcDBvcVpXK25wVHRocXViZWhtdG1nMUg4?=
 =?utf-8?B?b3B3dGZDb1UyeVFuV25xeXgxRnFiRWtQbGFZMWo4SER2ZTBLZFFFWkZCR3g4?=
 =?utf-8?B?U1A5dmJoZW16ZmFMNDFYMnlNL0dHWGZvRkczRnVjTWJOeFpEYTlkK0lvZ2JW?=
 =?utf-8?B?cXFNTTdqbnpnWG1lQld3aW1iYTI0K2hPVXZVQ1VxMWhtaU1venVHVWJaRlBO?=
 =?utf-8?B?bjU2NEZ0UEd4eE9hOHJjWDQxKzZTVkd2Q3BuK0FDQ2t3ZndwYjg3WkdRY3N6?=
 =?utf-8?B?TFUyL2pVN2Yvb1lMSThUMG05V0RmWTNoSlY0ZDBQNzgzaUptemtqZ3VXVHVF?=
 =?utf-8?B?Mlp2ZVM1eUpDaDg2UmRiNXkyTEhadWpPZXJ1ZUFVNUlxSTBDN1Z3K2NvSlB0?=
 =?utf-8?B?SUF0eWo0Z2RmbzdXY0FMaWw2cDNkMUFvS09wVURBZDh5d2tDV2lIaFZleWpD?=
 =?utf-8?B?K0diWWNLK0FHSXRmWEU2V2VUM3A2cVJYMCt3dzR0b0xjUGV6dlprK05ScHps?=
 =?utf-8?B?dUZDTGRFWWhvUkxDR1BkTmxZVVlzbXNMNFFQQWtwMHNnd2g1TjJaUHdpWkpX?=
 =?utf-8?B?cklGSmVDaGlITGdQa2JpdzFwKzgxL2U0eGhjZmdMdjRBUDV0NHg4YTNJN0xC?=
 =?utf-8?B?VVB3ZlZsRkMvNmNIK1daZHJSR2lKYVkxdXdDazlYRUR0TU9DMWt0WVdnQUJz?=
 =?utf-8?B?TlBvSTNGVDE3Mnlmcjk5Q2hNVGFVMVFtZ20xa1Jtc1BGNlhQU3QxSjlGd2sy?=
 =?utf-8?B?QytlQ0Y0TGxhOVI5bk9jTmVnTElhR20wUUNGN1dKODlBQlpzMFBqMUFPWTV4?=
 =?utf-8?B?QUM3a3RvY0VIeUFMaGV2ZSt0K003YitBL1B1RmF3TEg2NWh4ZjY0cXZXUjJ5?=
 =?utf-8?B?QTdXd1cvQS9JTFd0OU14blloTzJkQ09ZSmt6YWMzTGtnYVMzcWgvTDFtTW9q?=
 =?utf-8?B?U0lpY3hubUhtdDZjOHB5RHBnVkxrdWhsdFVsMWN2S3NLdHg2c3psVXYyQXh3?=
 =?utf-8?B?SzN0eExYbWtWcFJrclc1ekN2QkdTWXp2Q2lJMk95L2JyVHd1Um4rYURkaU85?=
 =?utf-8?B?QnZXWkRjS2FGeGk4UGoyOXRkd255TUd4OWVjTnZpSmxONk51NFRFaW5ocjFD?=
 =?utf-8?B?cEt5VXlKZjh0ZWtIVmJPVXRtSjRTQVU5Z2FjTW5WUTkxeGhlakkzbTEzK0Ez?=
 =?utf-8?B?aTZ3T1AxUk05QW8xYXhGUW9mKzFVM3JqeHJwZXFXcmFjODB6ZWZkTmRRTnpN?=
 =?utf-8?B?UTFrTkxKWWErQnlqSUI2Mzl4anhsZzJlZm1BV3VwYlp2aHZIMVpSZWdNbG9H?=
 =?utf-8?B?ZCt1VVZoR3MrOXNtdlk4Q2pMV0J1WHdjNjI5Q3BLTjh6UnYyOW1QL1hoRklB?=
 =?utf-8?B?eGlKdWJTcHdjeWhnTzRqOUdRdDVVMk50aS9MR2wyblpkeGhOeGl5THlCNllu?=
 =?utf-8?B?Wm9IWVNUTGFGckJrUStORDVTMU5ja3paakgra0t4NXBCVHdPM1BTUmk2enkw?=
 =?utf-8?B?R3d5WkJUZU4zYU4yaG5ZOWZ0c0lWTjdZOWtBb0RxaVBvSUNzMmRpRU82VXJq?=
 =?utf-8?Q?d8S0Au7lUixWNG27DwyH+kc8J?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9BF9359FB6D2747AB948E5CB834F4FD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BhBLN6ZpWuKfKeeOCUTK+tz81noPP2FHQn3TXWIGl7SXHc1Ebz7CZkodKruDsGmC0w0V+iRod9iz4E7eQZBVej2IsnzxrYHH3991kks9O8BMo/FZwRvVNc+sL1WVkRpzrmJi4fzHBqtYuFbvk0/xLNXA/bOg5E1By5fZaSCBabhUlQn7l0GiVDy8W0CKVcEEEPORtfmmB/sRql8icNoKzeUUOroJzAFFkd8zHtFymYzIQetjAuN7R9FZAJQsKy9IqpHfFCXsEDq1teyLG8fIe/gj7MW3qzWwC2mejpQkdvNxgvhjaHpusT/SNsMLZGRo0hafMmMKb+F+YLbImGg+gMxRIoa192NvvyMYlj06DKPuSuUk8AQ/UcAV2Ln7cJ3u4qRkfNZM1yCOUTBUTqhpUJwPZR9uksUA1RYiT3cgOt7MRP/M8WtKA5d6qCzJtwj3+WxpNc2sX4hFu03WSoHiBDJMCSxIb/2Aj2IqAVEdJHeg+JeiZeMortz1XlhUa9GJjW8auQOEzpNfQn8FUhKH8sjHmpFKRbg6XrnmUqRrduEkJmXt8YtBp+vPzFVUgHYOvUzBINexHDIt2MW9TFTCf/dUHIHPVYYR209K3CqNW1G+nYRQKJRymOqv2a5c0QxZoaoqoOivKGTVUZLBgRf74yXNaTSf0NFA8fE7vbnZdpXp/9VMAzlTsHxwbHQ81YfBGc36G5aLuA2pvO/qdtrsqS4NCAqwAYnqC050yk4ovqHTctiAM7J9kezOkG+xPo9691etDWJhInm0dDl7sefyjm6LO+PNg5YOJ6eFy7Jt6sYhOLOVNtvsS68zZmeyNtNCkA7Be5tOcUpS3IvH5Zzv/2cxDpXfuPXOFaHK/MAOD476FFiuSBHQigPri4T4+n1DH19mYutLjI3GdDcCb47BmWduwDJfbDctC7w9huy9Gxk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a07e13f-ff28-47cf-2cfc-08dac40cbd74
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 17:47:02.2880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zfUArlcIB4S0hNa7BzXkTe8xB7nwkMSMYVFWMAMEFEdYrJ/RzkcdU7GZ7GIS/Q1yq0zDJNujCMe+rKJMvy4APLihP773l4aZYZdmhlXNQMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6474

T24gMTEvMTEvMjAyMiAxNzozNSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTEvMTEvMjAy
MiAwNzo0NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxMC4xMS4yMDIyIDIzOjQ3LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDA0LzExLzIwMjIgMTY6MTgsIFJvZ2VyIFBhdSBNb25u
ZSB3cm90ZToNCj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5j
DQo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdmlyaWRpYW4uYw0KPj4+PiBA
QCAtMTk3LDcgKzE5Nyw3IEBAIHZvaWQgY3B1aWRfdmlyaWRpYW5fbGVhdmVzKGNvbnN0IHN0cnVj
dCB2Y3B1ICp2LCB1aW50MzJfdCBsZWFmLA0KPj4+PiAgICAgICAgICByZXMtPmEgPSBDUFVJRDRB
X1JFTEFYX1RJTUVSX0lOVDsNCj4+Pj4gICAgICAgICAgaWYgKCB2aXJpZGlhbl9mZWF0dXJlX21h
c2soZCkgJiBIVk1QVl9oY2FsbF9yZW1vdGVfdGxiX2ZsdXNoICkNCj4+Pj4gICAgICAgICAgICAg
IHJlcy0+YSB8PSBDUFVJRDRBX0hDQUxMX1JFTU9URV9UTEJfRkxVU0g7DQo+Pj4+IC0gICAgICAg
IGlmICggIWNwdV9oYXNfdm14X2FwaWNfcmVnX3ZpcnQgKQ0KPj4+PiArICAgICAgICBpZiAoICFo
YXNfYXNzaXN0ZWRfeGFwaWMoZCkgKQ0KPj4+PiAgICAgICAgICAgICAgcmVzLT5hIHw9IENQVUlE
NEFfTVNSX0JBU0VEX0FQSUM7DQo+Pj4gVGhpcyBjaGVjayBpcyBicm9rZW4gYmVmb3JlIGFuZCBh
ZnRlci7CoCBJdCBuZWVkcyB0byBiZSBrZXllZCBvbg0KPj4+IHZpcnR1YWxpc2VkIGludGVycnVw
dCBkZWxpdmVyeSwgbm90IHJlZ2lzdGVyIGFjY2VsZXJhdGlvbi4NCj4+IFRvIG1lIHRoaXMgY29u
bmVjdGlvbiB5b3Ugc3VnZ2VzdCBsb29rcyBlbnRpcmVseSB1bm9idmlvdXMsIHNvIHdvdWxkDQo+
PiB5b3UgbWluZCBleHBhbmRpbmcgYXMgdG8gd2h5IHlvdSdyZSB0aGlua2luZyBzbz8gVGhlIGhp
bnQgdG8gdGhlIGd1ZXN0DQo+PiBoZXJlIGlzIHJlbGF0ZWQgdG8gaG93IGl0IHdvdWxkIGJlc3Qg
YWNjZXNzIGNlcnRhaW4gcmVnaXN0ZXJzIChhaXVpKSwNCj4+IHdoaWNoIHRvIG1lIGxvb2tzIG9y
dGhvZ29uYWwgdG8gaG93IGludGVycnVwdCBkZWxpdmVyeSB3b3Jrcy4NCj4gSSByZWZlciB5b3Ug
YWdhaW4gdG8gdGhlIGRpYWdyYW0uwqAgKEZvciBldmVyeW9uZSBlbHNlIG9uIHhlbi1kZXZlbCwg
SQ0KPiBwdXQgdGhpcyB0b2dldGhlciB3aGVuIGZpeGluZyBYU0EtNDEyIGJlY2F1c2UgSW50ZWwn
cyBBUElDIGFjY2VsZXJhdGlvbg0KPiBjb250cm9scyBhcmUgZW50aXJlbHkgdW5pbnR1aXRpdmUu
KQ0KPg0KPiBJdCBpcyAidmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZlcnkiIHdoaWNoIGNvbnRyb2xz
IEVPSS9JQ1IgYWNjZWxlcmF0aW9uLA0KPiBhbmQgbm90ICJhcGljIHJlZ2lzdGVyIHZpcnR1YWxp
c2F0aW9uIi7CoCBUaGVyZSdzIGEgZGVjYWRlIHdvcnRoIG9mDQo+IGhhcmR3YXJlIHdoZXJlIHRo
aXMgbG9naWMgaXMgYW4gYW50aS1vcHRpbXNpYXRpb24sIGJ5IHRlbGxpbmcgd2luZG93cyB0bw0K
PiB1c2UgYSBWTUV4aXQtaW5nIG1lY2hhbmlzbSBldmVuIHdoZW4gbWljcm9jb2RlIHdvdWxkIGhh
dmUgYXZvaWRlZCB0aGUNCj4gVk1FeGl0Lg0KPg0KPiBJdCBpcyBub3QgYnkgYWNjaWRlbnQgdGhh
dCAidmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZlcnkiLCBpbnRyb2R1Y2VkIGluDQo+IEl2eUJyaWRn
ZSwgaXMgZXhhY3RseSB0aGUgbWlzc2luZyByZWdpc3RlcnMgKG9uIHRvcCBvZiAidXNlIFRQUiBT
aGFkb3ciDQo+IHdoaWNoIGlzIGV2ZW4gb2xkZXIpIHRvIG1ha2Ugd2luZG93cyBwZXJmb3JtYW5j
ZSBsZXNzIGJhZC4NCg0KU29ycnksIHNlbnQgdG9vIGVhcmx5Lg0KDQpUaGlzIGFsc28gZmlybWx5
IGhpZ2hsaWdodHMgd2h5IHRoZSBBUEkvQUJJIGlzIGJyb2tlbi7CoCBJdCBoYXMNCnN1Y2Nlc3Nm
dWxseSBmb29sZWQgYWxsIHRoZSBvdGhlciBtYWludGFpbmVycyBpbnRvIGRvaW5nIHRoZSB3cm9u
Zw0KdGhpbmcsIGV2ZW4gYWZ0ZXIgcmVjZW50bHkgZGlzY3Vzc2luZyB0aGUgY29tcGxleGl0eSBh
bmQgc3VidGx5IGluIGZ1bGwNCmFzIHBhcnQgb2YgdGhlIFhTQS00MTIgc2VjdXJpdHkgZml4Lg0K
DQp+QW5kcmV3DQo=

