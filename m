Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CE861A2DE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 22:06:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437829.692305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1or3s9-0005V7-Bc; Fri, 04 Nov 2022 21:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437829.692305; Fri, 04 Nov 2022 21:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1or3s9-0005SL-8U; Fri, 04 Nov 2022 21:05:05 +0000
Received: by outflank-mailman (input) for mailman id 437829;
 Fri, 04 Nov 2022 21:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2WFr=3E=citrix.com=prvs=3001bad24=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1or3s7-0005SF-Jm
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 21:05:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 574ae4be-5c84-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 22:05:00 +0100 (CET)
Received: from mail-dm3nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Nov 2022 17:04:57 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by PH0PR03MB6266.namprd03.prod.outlook.com (2603:10b6:510:e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 21:04:55 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5%9]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 21:04:55 +0000
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
X-Inumbo-ID: 574ae4be-5c84-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667595900;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=o22GLfwmw0A7lrA4JSlXduGjCIrmGoI2HUBL5qOumWQ=;
  b=PIiCBF4C2rMQRk7LZD1u1XIOJZ01f7ZdzpuJxzUXBTGxpOB9a5gU5rh5
   4Ihm0kX4ewNk/2bLYH9NMhtXHjyTU0o7k4USi1Bmbug2ApLb9mzsrxnYA
   4YJxT9W3QoYdXKwoIJuQIECyhi62gDxzeE9VGmJQ5kqlgS7yQp3ZiWTWX
   E=;
X-IronPort-RemoteIP: 104.47.56.45
X-IronPort-MID: 84205673
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:q9FiPa7TkFizOZRfC2AVsAxRtF/HchMFZxGqfqrLsTDasI4TYg02e
 lBvGjDRZK7OJyCgZYg1O70CxjpQvMKDz4VgGVNo/3szHnsQ85qdCYnEcEmvZnmbccOaRk464
 s9OYNfMfJ8+EiCBrEehOOWw8SZx36iBHLOhAbWZUswdqXeIbQ944f40s7Jp0uaE+OSEPj5hm
 e8eguWBNgD9gzMoYz5L4vOKpRli7P6i4mMRtFE1PP0U4ASPxyhJAMoTK5/qIiqjSOG4PAIYq
 8Xrl+jlozyDr3/BLvv/z94Xp2VTGua60TCm0yYQAO76x0AY/UTe645jXNIEc0Bblj6VqN54z
 dRJpPSYRBwge6bBg4zxaTEBe81FFfAAqeGvzUSX65TJlRSfKye0mJ2CMWltVWEm0rcvaY1x3
 aRwxAAlNnirm++wybSnfehg7uxLwB7DZd53VtlIlFk1PN5+KXzxa/yiCexwhV/csvtmD/fGD
 /f1XBI0BPj2j7+jDX9MYH42tL/AanAS6FS0onrNzUY8yzC7IACcTNEBmTcaEzCHbZw9o6qWm
 o7J12PeWz0AE9qN8zjf1nP32f/OgDzRZo1HQdVU9tYy6LGS7ko6LUVMEHee+ry+gEP4XM9DI
 UsJ/CZotbI16EGgUtj6WVu/vWKAuRkfHdFXFoXW6inUkvaSv1nfWzZCEmMphN8O7afaQRQF2
 1iTkN6vKSFptLSNYXmc6q2VvXW5Pi19wWoqNXNeFVZbvIKLTIcbyTjBZI19GqePtMTWHQ2p+
 QmBtQEGruBG5SIM/+DhlbzduBquqYLOVRUd/RjMUySu6QYRTJ6oYcmk5EbW6d5ELZ2FVR+Rs
 X4cgc+c4esSS5aXm0SlQu8AAbWo7PatKyDHjBhkGJxJ3zaw/3+ue6hA7Tc4I11mWu4fYiPga
 kLXvQJX5bdQMWGsYKsxZJi+Y+w1yYDwGNKjUerbBvJub55rZUm49SdhTUeK2ibml01ErE0kE
 ZKScMLpAXNBD61ilGCyX71FjeJtwT0iz2TOQ5y91w6gzbeVeH+ST/ECLUeKaec6qqiDpW057
 upiCidD8D0HOMWWX8Ud2dd7wYwiRZTjOa3Llg==
IronPort-HdrOrdr: A9a23:Tg3cOq7O9OHNYulI7QPXwX6BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qADnhORICOgqTP2ftWzd1FdAQ7sSircKrweAJ8S6zJ8k6U
 4CSdkyNDSTNykdsS+S2mDRfLgdKZu8gdmVbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9p1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUZpDKh8KoDOCW/sLlXFtzesHfrWG2nYczGgNkBmpDu1L/tqq
 iJn/5vBbU115qbRBDJnfKk4Xid7N9p0Q6v9bbQuwqcneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2KIoMxsj+K4KC2Cu3DE1kbKq9Rj+UB3QM8bcvtcvIYf9ERaHNMJGz/78pkuFK
 1rANvH7PhbfFuGZzSB11Mfi+CETzA2BFOLU0ICssua33xfm2141VIRwIgakm0b/JwwRpFY76
 DPM7hulrtJUsgKBJgNTNspUI+yECjAUBjMOGWdLRDuE7wGIWvEr9rt7LA89IiRCeg1JVsJ6e
 H8uX9jxB0PkhjVeLyzNbVwg2DwaXT4WyjxwcdD4JU8sqHgRdPQQF++dGw=
X-IronPort-AV: E=Sophos;i="5.96,138,1665460800"; 
   d="asc'?scan'208";a="84205673"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PU7q8TLAAwZ8GqVeNX0VQieGLykl2y27++9pDFXjCo9Oj3SiTE777aNqPRirDjnJIBUADpP8KIEfZgJZA8XzoiYMlenAWiBK1kqJyKPVSoYY3kM6SJ5o0vd6yhGiQOemfPDK2cbOJBcs1ry9GR/uzC0oP7N035QKGH0UshBS9uquNpFstjpbIbDfVbMY9KOudvdNkA54nlHmO4tPhrAde6WaLdoQTFPMYFLWEVUDZtSHaK9JHG1HeiT3FKFX3SnE82/kWvJhVNCy2117gIZ6JQ/OazJZXo5S1E88Gs83GiBdB2nWfDPcKAPWhstT4U074YYYGefiRb55fHxc48mX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTAADyTg9FxyWr19S8eITGmI5jD4J9aOHbtGBQR31p0=;
 b=MKDCmVdirkctUXT9Wd+Cf0KUNY19AJHp0NBPJGRFmh+418qAOgAAtem/gVwlsmi3ua3Ai/6auzt9BB0VZ5QdC9iMSUCZ/M12nNfWigbhrDJxexHNzqIY3LeoZFjpGtHljJhruUDrxB2bqGajzlts1ygspSOBWAa0zzFQxF4sWERrs99S8SVpjjUItB5jGjTOft3xqMS91vqGPeqNktFLeeFRinspOoMW7/QuhflusbEJSD/CYAAnQzmY7JJGfeQD35n4jBF1Ac9oOiJASLdKKFktRERCU4NRyIzaIY3edG6/KG4jW6dBMG8C63TSlrHXdcH84QKSuDg9D35Jq5Qz3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTAADyTg9FxyWr19S8eITGmI5jD4J9aOHbtGBQR31p0=;
 b=O9xkJ46ApqWvRoZIH0Njm2/JJBBNDccEy08KfAy+cCwYdemvKGHRgBSPm7I7ywJir9HW75MsAa4aDJkZzS29UR4/07B2dDxSb8tgkLPzZt7jDk34TZWQP7051POyD4cuOZ7Ai6WZHFq6g8GaaTV2sFawLKjVhR8IbkkQqOLEQ74=
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: Revert of the 4.17 hypercall handler changes Re: [PATCH-for-4.17]
 xen: fix generated code for calling hypercall handlers
Thread-Topic: Revert of the 4.17 hypercall handler changes Re:
 [PATCH-for-4.17] xen: fix generated code for calling hypercall handlers
Thread-Index: AQHY76JzZdOUSWsV/EuMjC67io5Dyq4uNcAAgAENE4A=
Date: Fri, 4 Nov 2022 21:04:55 +0000
Message-ID: <23500966-F3C9-4486-BC57-F079977BC716@citrix.com>
References: <20221103163631.13145-1-jgross@suse.com>
 <ca972491-4200-5d3c-18b4-122a9f4e61c7@citrix.com>
In-Reply-To: <ca972491-4200-5d3c-18b4-122a9f4e61c7@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|PH0PR03MB6266:EE_
x-ms-office365-filtering-correlation-id: 695c2cab-607c-4198-bc41-08dabea83947
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 F40jmCb31eOengy4Jvx+K+CpaLwQpGFwrFiX/89QtF7M2HwMsx1V6cwzgs3Np6S7JfBVK1IktAn1FXHVF7Bb/L8FyfLjJhffmgz3w300r73SjW6Q95D/X5oKN3owLr5j3gED+RiCKWZvWgjssBVRjFDK533ElRMGi4kjG+AwOpFXcIHv5mmCsvPck9NhSjVf3mC8R3rIBO7svdw1qvwm5yiq+0soEYgACgDamSeVW0SShNnbU0xjpV3fm4X3lDwIiw6ZfZOsolJygjgnuxiiVHRUVqJRl5LuQfjcWU3WtQ0pFzvvBfxn3IK741S9xF5Hx06DxVV6aW1RpeAcQ/7hdhTFdvJQF7ivej6uhwjQdFjZ5xPPZ8f9YajvviH9c4eT+N8Uc6tCnfQWBU21zSTampWu9uIP6paE1z112VXqRCqeISUg30+cTGPXNpS1zsts/LrtwENe/lgOpU9sqXIkPMf4RKfhrTTNs6Fdz8QsjAZhItDwBRnE93yOLjfAajeOeD5srAYz9CJ8jcycckt8Gn1bbY2M//SCnP4YV4hIP4uvX8WF2XPGWMyYbB+VanDNiktjCGmTrhO5EcRxv8127U/KHPuEyYoWV1wtEYsr5OqnPyaK4uQolKmybWQmGiLFTWaVCI4djQBDEJLoENxwmTdbSVEMbxXltA1whh5FHDeqP487D0pFO9ZzEqnOAw6r792Lg4ncFGjpuKLMnwRdz+4T2c4SNVuw0+YZrDvFmw5PZbs5c7crC1Qck4rEnCFlP7hqTjpPioDX8gLzvHRfztZgrsyGqXRAxdEYeW3qwG3EVtpO0x+P5SxyPinJ5PKK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199015)(316002)(54906003)(6636002)(82960400001)(37006003)(71200400001)(41300700001)(99936003)(33656002)(83380400001)(5660300002)(6862004)(8936002)(38100700002)(4326008)(76116006)(8676002)(66446008)(64756008)(66946007)(66556008)(66476007)(91956017)(122000001)(38070700005)(6486002)(53546011)(6506007)(66574015)(2616005)(6512007)(26005)(186003)(86362001)(478600001)(2906002)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aDFOS1Nwb0xFdWlBOW12bllOSDFtYVFuSnRpYTlLYStiaytLZFQ5RExaVDdr?=
 =?utf-8?B?OE1OZDVDbmdtNHJDWlhzNkx1VzFlTUVOeldwelhSRkxML2Y3MXRtbFcvU1h2?=
 =?utf-8?B?S1UxUXlxbzlKd3dsamlFckdVSVhiNlZUYjZyTUI2T1ZEd3pjWnFIc2RDQ2x6?=
 =?utf-8?B?SENBZ0orOC9wNWdDUjNRVmQ4c2N1VUd6cVQ3c1pKUG5VUDZ5eWx1dDcvN0d1?=
 =?utf-8?B?L1VyOG1pSWU5eXIxalVWL1Bpa1JidzN5Q1NzTVhEYys3MnF1ejFyUFRTbzcz?=
 =?utf-8?B?Q2Zrc1FPOVp6WVhzSmVIdUtyejZCeDg4VGVteHQ1ZmxGUFZnckY2OUovY0V3?=
 =?utf-8?B?Lyt1aUcxeDBMaTY4SDBqVXZvMnVjWTN2RVRxV2djN3hEaXZxTlRWRTFFcVNz?=
 =?utf-8?B?ZFlOOVJCdVo5aGRwYlV0U0pBRWdxdFY5dm5yK1FHdkZoV3dYLzcxMmxnbE5I?=
 =?utf-8?B?akt1bzZxQUt5Y2diSEVwOWlqbk1BcmwzaElJOXhWUU9VQ0lBT0FuNExIKy9z?=
 =?utf-8?B?U0V0cVBWOFBkZmI3QU9Vd2FjODljaFlORU5nRHJYZW1NN0ptdG5sakxiLzZ1?=
 =?utf-8?B?Q0ZwWFlyanlSODIzODMrUi9XVUNVdFJGM1ZGY2EvSnhMYzFGQmNuMEF6RVhI?=
 =?utf-8?B?MFBodncvYUdnb1hBZXRaNGJybkY0ODZuekt4WmRBZC82dzJ3czZiY085MEwr?=
 =?utf-8?B?T3I5UXNzbzB0STNFN2RJaWp0L0l6bW5jTVFUeHA3Q2luMi9zdm95WmgzYmxE?=
 =?utf-8?B?c0R6dFJRN0xUdVdUbSt0eGdoV2h3eDhVeldaSmhqR1gxSVlaNkw2VkxPdlZK?=
 =?utf-8?B?Q3hJU2NXQnR6SlE2UWpaNmY2M0E4bU13UlRiNURJRG8zVnFFS2lUOHJEcEZt?=
 =?utf-8?B?WXo4ZUxDdjhRQ1RpRkZVTDkzWGFlVHM2dEZ5dzJCa2ZCQmY3cUZUMlJhcG9B?=
 =?utf-8?B?U0FxSDFYbWkvenNQTmdkZG1vVXRZelhKdm5Ua0c0WGVocFoxYzEwTHV0SWZN?=
 =?utf-8?B?VFJmaUhnWDl4c1V4VWFGMS9RWTlLY2VCNXo1ZytKaHR5L2xVVjllZm9wV0NI?=
 =?utf-8?B?ZExIbHQ2Q0R0Y0o3TTlGRFVxQUQ0ejY2VGNtRjJ5YnNqRHBidm1pWXFQOFJ0?=
 =?utf-8?B?UmRMeCtyWW9hdFExd29lVVRxUVYyZ1lFaGwxQnpOWVAveWpEM2hFRklTS0di?=
 =?utf-8?B?dnFsaU5nblZSdUFTTjZ1eit4Qm83RkhTR08xVXdPYldVaGNxVGxyVUdRM3Fp?=
 =?utf-8?B?ZEFrclRkS0pvVHJna1ZiNTczUWdJSXpXVTZEbzlRR2FDSmNsMmVBTUJ2djYv?=
 =?utf-8?B?dTdlcndWb2hOa0FibWtTNUxOUTBtRlU4MzloNjlpM1ZhZ3AvYlgxaEVqSTk1?=
 =?utf-8?B?MjlNMGsrLzF4eGlzUjBpajYrMEQ2VXczeW16OWpNU2RydkhHbDVqbzlpUU5x?=
 =?utf-8?B?VnlRa1l1T1dWVDFBdXJrTW9MSHhHWTh5ZjdBaXNSZm9KZ0Z6R3o0eUVKeWJQ?=
 =?utf-8?B?L1lML3Q0SzRnZGVkUkREWnB2WVNoRUtMTmMxQkN1bEdITEhwNmk0SVdIV0F1?=
 =?utf-8?B?azVkY1FUcFlrRTdOa1FweW9FZ1o0d0FuenBIWVlPUWErV2dLY1Bkd3FEL0JE?=
 =?utf-8?B?RG9mcE4rRzkycmFxMkd4RE5jc3lSRmhMbjlUcEk2NERUeVl3enBDZ2Z1d2ds?=
 =?utf-8?B?SkNVSlNPOHF6czhBZFBvOTNGdy9BLy9XR1I3NmtQV1dCeUJXaXFSRkY1dTlG?=
 =?utf-8?B?eDNFNktXWlUzQ3FwdzlZU3RSRWZjaVlNMzFVU3JGOTRFRnJ4dmE5TjkrWnBF?=
 =?utf-8?B?bERYOGxNM3QvWkhpZnRYVTAybDd1b1RHUUVpRGo0cDVyVEJ6SStsRHhwTDRB?=
 =?utf-8?B?a1ZKVVoraWFob2FzSUFjSnQ2OUY2SUNtKzg0NzVxL1NVaXg4b1ZUay9Pd2Fk?=
 =?utf-8?B?S3FBNlVzWklDUzA2Z0MvMHNWVTFsWEx3RG9uaXJrdGwxNVBheHp6d3Q4QTZp?=
 =?utf-8?B?cXJ3VGl2djdxbVIwNi9YaEhRQzhReCtkTVhHdjU1eGJOYldncnJIZnhKNnVX?=
 =?utf-8?B?Z3BVR2pDUFB1TVhPUnBpM0U2SHlETmpJcFlGYzhVS2NndVcwMlJQMkNkek42?=
 =?utf-8?B?R01FOS9TdzJkQURDaDI4SzlPMlNFYWtkaUJEV2VCMEwrZnRJZWdLalVOamRX?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_99E10F5F-7C3F-4CBC-87A4-578AB09B16DE";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695c2cab-607c-4198-bc41-08dabea83947
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 21:04:55.0819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BUzTk/r+S06aXsjAIQkgUWhdE5d60q7AT1Oug70jh9tiGeFvXfbtnisIVvU2K8fc/IxFpEPbCslc9jpNOIjX4JBaf1UngaUSAQLlGUNosT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6266

--Apple-Mail=_99E10F5F-7C3F-4CBC-87A4-578AB09B16DE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On 4 Nov 2022, at 05:01, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> The series claims "This is beneficial to performance and avoids
> speculation issues.", c/s 8523851dbc4.
>=20
> That half sentence is literally the sum total of justification given =
for
> this being related to speculation.

The cover letter, written on 15 Oct 2021, mentions =E2=80=9Cavoid[ing] =
indirect function calls on the hypercall path=E2=80=9D.  Internal =
security@ discussions from the time show that we were talking about =
Spectre-BHB (AKA BHI) and its impact on function pointers, specifically =
those in the hypercall and exception dispatch.  Given that Spectre-BHB =
wasn=E2=80=99t made public until March 2022, it would have been a =
violation of the embargo for J=C3=BCrgen to go into more detail at that =
time.

It appears that your view on whether hypercall function call tables are =
a vulnerable surface of attack has changed.  But given that you once =
believed they needed protecting, it=E2=80=99s not unreasonable for other =
people to think that they may need protecting; and given that it=E2=80=99s=
 reasonable to think that they may need protecting, you should at least =
give a *little bit* of a justification for why yo believe they don=E2=80=99=
t, rather than simply falling back to, =E2=80=9CThere=E2=80=99s no =
evidence=E2=80=9D.

 -George

--Apple-Mail=_99E10F5F-7C3F-4CBC-87A4-578AB09B16DE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmNlfmUACgkQshXHp8eE
G+2Zjgf/V2PqMduiNjBswzS/uJfhqBB6B6+ALDcz23F32dubh+7HWsco2JdcQS/W
bRRUI094/OeKcJ7Ez+p9T0hevFiNHYmpElrzcVECOxzT9RCASKoYktMPUhyyvLZy
5T9SPiZvXoVB0MF5cNSc6xGOyIgPHVPaJPwoUXrVxAteC+YBxgRNop4iQHLa42az
dMziD9HBLBQ52vDPWvcbgovxrUUzrioOyFumglbtN4TOTBcOvz0ScIhsIXx55uyW
kW8NqBFEGbOeEm9lAvB74MwDjIjf1GguEAwnZBDGSN/704yb+HkKN9HRrII6nTfP
9x6h/gcJ9YTXNfaIPqlFFzgpTseOAw==
=Y/W2
-----END PGP SIGNATURE-----

--Apple-Mail=_99E10F5F-7C3F-4CBC-87A4-578AB09B16DE--

