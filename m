Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B6B5832FD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 21:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376432.609195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGmMq-00051R-56; Wed, 27 Jul 2022 19:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376432.609195; Wed, 27 Jul 2022 19:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGmMq-0004xx-26; Wed, 27 Jul 2022 19:06:48 +0000
Received: by outflank-mailman (input) for mailman id 376432;
 Wed, 27 Jul 2022 19:06:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEwU=YA=citrix.com=prvs=20023c9d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGmMo-0004xr-8G
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 19:06:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f3e476c-0ddf-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 21:06:42 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 15:06:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5474.namprd03.prod.outlook.com (2603:10b6:208:285::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 19:06:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 19:06:31 +0000
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
X-Inumbo-ID: 3f3e476c-0ddf-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658948802;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=w3X0sSNPYg3fWQo3nObExbbQryl3IJ699yK/+vB1REU=;
  b=M7vF1etD6IYo/gVm73DquBV0FFYimubDU3lIgT15ps1dqrdvGylMDUuL
   kPC+GTaGGgFPibG5Rfrh83kvqCOWXRgbWmto0Isde8yyaiJvtBv7SFogo
   64Bw2axMMw+31IAa3WhIAefNK0dNC61RpLzoF7kVlS2tYvdpGrZi2CXnY
   o=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 76568630
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ddYj16haUXtqFdIVUvWAUd0tX161TREKZh0ujC45NGQN5FlHY01je
 htvW2+FaKqIYGSmLYogbo62p0JU6JLRnIRrSVBtri9mH3sb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15Kuo52tC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eDdUdocBZPXl1q
 +URciwtKR+oit+S+efuIgVsrpxLwMjDGqo64ysl6A6DSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsG9hTJ/cLb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+trSzx2L+RxnuTtIQ6P7S12OYzkRqpxUsvFzdHWWaV5vXghRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4DOkS+AyLjK3O7G6xGmkBZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ2kUjJR9M6Sqqt1IWpQXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:9wxUwaylCzH91j+4Q8G/KrPxdegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7kvZKqm72EeNt9MbsBuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGbf2x4Uh37D30XklZqvoJhiKobwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7FjDsJCy8zBrZLQQF6+YUFrlde8qPMCBcCeU+
 qvOfttcoreEVc=
X-IronPort-AV: E=Sophos;i="5.93,196,1654574400"; 
   d="scan'208";a="76568630"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJQ11MICVY0qhdeIYDJtZVNjBUewDVcap5kTcVj8hUmx/CCXXdvmvt5vB58l8n6E5GuOF9VvAMn3IODWaeYh8jxyoVON9L20Omtw/fD7feohPT2H+ijOInqL6puYK+9g1vmOw1abw+2MTBoihZptBYwqrmmZwgmAZWM0r/eTSHgUxRmpBLz7xvA/Hqu3/BVQ4ilmPj2bOvjyPGxyx4a5gEV7htMzZU0aTdDitv1+FvjHOggRkVKjBkXN5YxwrBOUJnxZlXPIgvEoSL59fAfu8exSBE5YJwp+ESmIn87JU6BTN4t3je5JYq8FamjJuZJZoJYABVFNplrqDne2ZzuyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3X0sSNPYg3fWQo3nObExbbQryl3IJ699yK/+vB1REU=;
 b=f27/Dgkw2O/Y0T5jrtX6/sZsc5owWfxXc/X4FoVkaWESrJ1jCX1mzRUdp0etiGhziPxyTKzGxh6Yfg0d3bVlS4nQEuYtoFuHOKHgI6oBcufpcwJRRzdNDBxXcEMBia996TaAKZ6eOBEB43tGZ/iMeATe1GUV2s2u4+Crg+0jA76nLYPAR7iTsmZQK0w2ys4Zrd1rWge4zG8ctjOmzzxrnVT5n+pHNOKNfoPPBwUU3MNmui7VuG4Kh/1VYtf+BFkeeoieobUH1GkGTx2AMxP+VWZjYwYu2eD85nomps8Des+/MjcdASoxmmZBLQEpM1AWsWWd9QIk4LFq35HIac5iDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3X0sSNPYg3fWQo3nObExbbQryl3IJ699yK/+vB1REU=;
 b=f/+MyPKFZ0sbwgH3cIhBiKd8ofWoX/kG2IEX6jDHdTkViiYJHx74assnZrnr0Db1SwvVeN1jakUr/g1twF/S2V4hiv+62VP2pFshnKd3Bf0Vg25L4Ryd3xUk6j6pamE0BewoSNvH1Pt+gcQFCEFOLVlAV3mCBgLDtS2VvXV4Hb4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/8] x86/shadow: properly handle get_page() failing
Thread-Topic: [PATCH 2/8] x86/shadow: properly handle get_page() failing
Thread-Index: AQHYoQlhV37xX0Hh2kWLBKJVPAkGN62SK82AgAABxgCAAGhPAA==
Date: Wed, 27 Jul 2022 19:06:31 +0000
Message-ID: <df94aba5-59bd-7fd8-a9e9-6d4d25653081@citrix.com>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <c5797fa8-8ee1-7668-936c-392f8298dff1@suse.com>
 <6c5b5339-f645-4214-bc53-2b7ead004367@citrix.com>
 <f803480d-4c31-1465-4aa7-c8f0bdc11c4c@suse.com>
In-Reply-To: <f803480d-4c31-1465-4aa7-c8f0bdc11c4c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b379c93-ec79-4af3-5919-08da70031dbe
x-ms-traffictypediagnostic: BLAPR03MB5474:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7CoYjKz5VwRhnPTbMGDFgtv73ZkPGbG5WJg3+GMpskIy4zeKuLSmgSR/wS8sYEufLOEoe3YzfBZz1tB4Kt1hdW7bmkVKQFcnmpPXX83MxnqgKPiXn00KBr6uU6R5u3jnNKpg1F8WIpxb3KF3FyGqb4w56iZSC/72uQuR5CUg7d22pCBqmGD5KE6I44UyTcuPEFWFUEgmmWSW25PecS5JxPNtIvVbkf3c9f0sK5s1RwWnL1mscd/UEuBRT0rc/dgLgNTPtdGJpeSP+m0qN88rOpL5+raiQLTo0SeXuVLACy+K/feeis9t+kcI8R/eY4fM2D1+/90lHjsX11VgWqA5JnswzWZp15fwM+kx8s7mkZf/gPFVWpelvHUF0Ouw2n2NMv4iLIPX11B+kTAEliVeQS396kiGkVMVC55OVO3hQw7eoWJb/d87QeIGhPqGJvkNZYLGOwQ1cC5Je59s0CLUlb1evfWuLlYNgzFUj7OwsxeqI0jAMWBvT7URkcqAQW9hmvBksqPOtmixRRUbL11pdy/NzpPvq5Hj+HI5JPbtjTkL9ojH9t5b54J4rNnQvOIE75bR9irQ/wOkfjU68SLDLTbYnxgwTTGWavup0/oz/7GZmwIC2QbUogQtZrsJ3sHO4BViAcE0oLeP2JeUvaYS8UlJ6w1JjHfp3UZDfLbF5Rdc8wG947vpcIT+faoPme9UCXgjoZ1JmwW7PNg0vUeQ5YP+/rSUEjEfX9FcWARi/VJaCqLS2tqmOgqnSDlsR95txsnprn5C12cfzU/Ar42WC1f2OlPEWaS1xN47XL3HtlhLp+anvYcvQKpLuse/9Pz/00wMEajNpmLUPlekalJ2IUZw4A/a6IVaatU5kdxQWDh48f9A5jXdonvUOA9ice0n
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(38070700005)(83380400001)(2616005)(38100700002)(186003)(66946007)(54906003)(76116006)(66446008)(31686004)(71200400001)(64756008)(4326008)(6916009)(66476007)(91956017)(36756003)(316002)(8676002)(66556008)(6486002)(6506007)(26005)(41300700001)(478600001)(31696002)(6512007)(86362001)(53546011)(5660300002)(2906002)(8936002)(82960400001)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WXBUWUtxYmY2QWxnVmVWclNRd3QxRTNNNTZxZTFUamFyallGbVNhYklFNW9E?=
 =?utf-8?B?bU44UWdQaWNDNDhMYzRKdFpjeW5yRmxMam9oOHZuY2VlVG1rRjdpVXlJanQy?=
 =?utf-8?B?VVJVbDY2MXFPNUlOOVRSRWx0NDFXYTIzQ0drTHR1Y1duN2FybkljdFZWazVt?=
 =?utf-8?B?ODVCTEFZTWJVTUliZm1Cb2VhSlo5Nlc2bzJFTFJHK0RXZ2NjSW8wVkNQRnJX?=
 =?utf-8?B?dytMYjNoekNoR1FOZ09sdzhsVXFPczFFdDNyUEI2ZVpvdytmak1mdXIxaStn?=
 =?utf-8?B?Z2U4ZG5nRnpHYUFobUQ2SUJqQjhQcC83a1RoRXdRbWF4eUlzSDhURGdJbnJh?=
 =?utf-8?B?N1FDRStRTDd4clZhKzFnWmxUOWFNa0UweGp4dGdSY0lad21YNGViMDQwOEhL?=
 =?utf-8?B?SE0vcG5QYmdkaVl0dXhpNXZBaGtza1pIeHlyUEkxWEswdXdXK1o4b2MyVnp1?=
 =?utf-8?B?TzF0MjR2b29lOU5PTWFNRThvc0VQeExDaTYvaUhsSm9CSnBxYmkvdFVabGJO?=
 =?utf-8?B?WUpMekUwdkUzeDcxV29UQitPWGZyTVVtV2w2QUJPQmJaakNicHRXdTJNY2kw?=
 =?utf-8?B?b3V2Rll1ZGp2OFVrbDNzM3NCQ3V6TEFiSTVoRGwwbGVNWHdZSlJRMVFPNnRy?=
 =?utf-8?B?TXlFanh4VFdySjNPMko2cTcrOWhLdm9pTTF6RUlqRXI4VGhDUUxNQVMwWHpm?=
 =?utf-8?B?bVVNejczakpqeDFyU1ZtVGYzS0lZOWE5Y3dVRzl4RGJPVW5ISXdaMjdtUnV0?=
 =?utf-8?B?NFVMa0VOVDlXT25ITUlIN2poLy9RYXRUZDYrMVJmeGh6MnQ2c1I3b01tdEM5?=
 =?utf-8?B?eGgwS0d2cWc2SFFIa0VUb0EvN25idkN6T2NhT2lkRWZBaVlhYk1MNWVSKzRo?=
 =?utf-8?B?SVM1SkwxKzQrQjZRZXlnVzJYWHNpVlJ6SWIwNGsxWXErN3FycEZyQ2cyTWRJ?=
 =?utf-8?B?UmgyeUpFYjNWYkNFZmFQMHJZdW9LNHg1cjhraWxyL2M4RGZjQVdNV0hEajl4?=
 =?utf-8?B?c3dEN1dzTFVmeXl2K0ZHKzNyd1lEbmREWmhMdldBck1MVE03SUZZeGVLdzBI?=
 =?utf-8?B?VmZYY3p6RGxFVmd1WEdubWZKYnFGbmNka0lIWkIvd2taQlZWYWhUelFiUzZx?=
 =?utf-8?B?STRHWHJVSjBlKzMrUkhOOUhGQnB4ZC9DdC9EcnNJbmdoMW9vRi9pTVJXYUFi?=
 =?utf-8?B?dVF3VUhHbkU5VTBLWlY3aVlOYlpYYnRGeHZnOEdEeGVDaUJBbk5zRVN2L3VT?=
 =?utf-8?B?SUlFVFdweVBiOVFNYjUzNjA4RGhHMGd0RERPSkluL0JJeFN3WXBDQkNYY2lk?=
 =?utf-8?B?N3pjZVhQb3k4c2JmWFZjS3RkdHNlMXBqTnNnaXhiMERKVFp1SllBU0kwcnJB?=
 =?utf-8?B?RXUrUVpGMU1hQXJnWml6dlNkMUtsVTgxV2I3WU9qZ0hJbW9yWndpUFNoYjVa?=
 =?utf-8?B?K0xHU2R2eXByS0ZPbkNXeEZsYjkxWTBMdkhhTDNLR205SExuTmRLZEVBTWFW?=
 =?utf-8?B?OEtadlljdWR6YW9NdCs1ZURSNE9HUW1DeVVHV3NENVR2Q2NMWEJhcG9YWGpD?=
 =?utf-8?B?VEdGbTlxR2xKN09sa1NhMEhISkJmTUNXdmdPdnN6bUthRDRMTmVsM0ZjWno3?=
 =?utf-8?B?RlJGS0JHU29qdXJRR0lWZEJtTGJoVURYN2ExK2Jwdy8yM1h6MTM4eE05Y1U4?=
 =?utf-8?B?bm5McjlldWhDQWJzSjhscnpnTTk5Sy96QVpESzZyODhFK2pPQmErYmMyZ0Fi?=
 =?utf-8?B?ZzZBZ0E1TW1aZWNNVkdSK3ZEeW04a1Z5NTBFRkl5NjJZV3dodFovaVd6OS9v?=
 =?utf-8?B?cHE0ZVFYWStJc1haeXZSQ2h3bUN0QnAvdDV4ZEdCaHNQWThmZmVINE1XNlFC?=
 =?utf-8?B?Q3BEbi85U3cwSm9ROE0zeEVwNmVTdUJKVG9zNWpPVjVURlVnVVZSanFET2w3?=
 =?utf-8?B?YnY1WlMyV3lUQTZTNXMvdmI1NTI4SEQ5Qm93Y2svcjdLQ0I0VitDYlprWHd3?=
 =?utf-8?B?Lzk3eXVIMFdDSVBkTmtPTjhUTlJTeHpGaExEcm1MSnN4TzltaUxtUDY0d1FQ?=
 =?utf-8?B?dHVjUHFRc3ZxSkRuMmdaQXZReHpFT3NUV0dzbTlzSGpLYldpNnhEdnJteEtn?=
 =?utf-8?B?dWRSa0dQQmgvc25GdjMrUENxSmNnOGthWVRsUTIzSzNHNTN2TCtyYVcrcm9r?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEA6E9133F46AC408C3D63379D6E713A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b379c93-ec79-4af3-5919-08da70031dbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 19:06:31.1948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eSUoVdsSHZ0QqgJ+hdUTByPKY4xufKTJwkqiuwq6jCIn/VEedJ3D7oiEnbCflYjgd0XocrXxLpa/D9EXk2LQfrEEdy5pEhdU+ycHve9OVwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5474

T24gMjcvMDcvMjAyMiAxMzo1MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjA3LjIwMjIg
MTQ6NDYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyNi8wNy8yMDIyIDE3OjA0LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMN
Cj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMNCj4+PiBAQCAtMTMyLDcg
KzEzMiw4IEBAIGRlbGV0ZV9mbDFfc2hhZG93X3N0YXR1cyhzdHJ1Y3QgZG9tYWluICoNCj4+PiAg
ICAgIFNIQURPV19QUklOVEsoImdmbj0lIlNIX1BSSV9nZm4iLCB0eXBlPSUwOHgsIHNtZm49JSJQ
UklfbWZuIlxuIiwNCj4+PiAgICAgICAgICAgICAgICAgICAgIGdmbl94KGdmbiksIFNIX3R5cGVf
ZmwxX3NoYWRvdywgbWZuX3goc21mbikpOw0KPj4+ICAgICAgQVNTRVJUKG1mbl90b19wYWdlKHNt
Zm4pLT51LnNoLmhlYWQpOw0KPj4+IC0gICAgc2hhZG93X2hhc2hfZGVsZXRlKGQsIGdmbl94KGdm
biksIFNIX3R5cGVfZmwxX3NoYWRvdywgc21mbik7DQo+Pj4gKyAgICBpZiAoICFzaGFkb3dfaGFz
aF9kZWxldGUoZCwgZ2ZuX3goZ2ZuKSwgU0hfdHlwZV9mbDFfc2hhZG93LCBzbWZuKSApDQo+Pj4g
KyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+PiBJJ2QgcmVjb21tZW5kIGNyYXNoaW5n
IHRoZSBkb21haW4gaGVyZSB0b28uwqAgSSBrbm93IHRoZSB3ZSd2ZSBhbHJlYWR5DQo+PiBnb3Qg
dGhlIHJldHVybiB2YWx1ZSB3ZSB3YW50LCBidXQgdGhpcyByZXByZXNlbnRzIGNvcnJ1cHRpb24g
aW4gdGhlDQo+PiBzaGFkb3cgcGFnZXRhYmxlIG1ldGFkYXRhLCBhbmQgSSBoaWdobHkgZG91YnQg
aXQgaXMgc2FmZSB0byBsZXQgdGhlDQo+PiBndWVzdCBjb250aW51ZSB0byBleGVjdXRlIGluIHN1
Y2ggY2lyY3Vtc3RhbmNlcy4NCj4gSSdtIGhhcHB5IHRvIGFkZCBvciBjb252ZXJ0LCBidXQgcGxl
YXNlIGNsYXJpZnk6IERZTSBpbiBhZGRpdGlvbiB0bw0KPiB0aGUgYXNzZXJ0aW9uIG9yIGluIHBs
YWNlIG9mIGl0Pw0KDQpFcm0gcGFzcy4NCg0KV2Ugc3RpbGwgZG9uJ3QgaGF2ZSBhIHNlbnNpYmxl
IGNvbnN0cnVjdCBmb3IgQVNTRVJUX09SX0RPTUFJTl9DUkFTSCgpLA0Kb3IgYSB3ZWxsLXRob3Vn
aHQtdGhyb3VnaCBwaWVjZSBvZiBndWlkYW5jZS4NCg0KUHJvYmFibHkga2VlcCB0aGUgQVNTRVJU
KCkgP8KgIEFsbW9zdCBhbGwgc3RhdGUgY2hlY2tpbmcgaW4gdGhlIHNoYWRvdw0KY29kZSBpcyB2
aWEgYXNzZXJ0cy4NCg0KDQpNb3N0bHkgd2hhdCBJJ20gY29uY2VybmVkIGJ5IGlzIGl0IGZlZWxp
bmcgd2VpcmQgdG8gaGF2ZSBvbmUgcGF0aCB3aGljaA0Kb25seSBkb21haW4gY3Jhc2hlcywgYW5k
IG9uZSBwYXRoIHdoaWNoIG9ubHkgYXNzZXJ0cy4NCg0KfkFuZHJldw0K

