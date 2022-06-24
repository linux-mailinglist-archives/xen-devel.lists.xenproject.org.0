Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6658655A167
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 21:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355840.583763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4onO-0003vi-Mp; Fri, 24 Jun 2022 19:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355840.583763; Fri, 24 Jun 2022 19:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4onO-0003tv-Jv; Fri, 24 Jun 2022 19:16:46 +0000
Received: by outflank-mailman (input) for mailman id 355840;
 Fri, 24 Jun 2022 19:16:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jTea=W7=citrix.com=prvs=167c355c5=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o4onN-0003tp-Os
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 19:16:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bc4ff39-f3f2-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 21:16:43 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jun 2022 15:16:35 -0400
Received: from CO1PR03MB5665.namprd03.prod.outlook.com (2603:10b6:303:94::6)
 by BY5PR03MB5188.namprd03.prod.outlook.com (2603:10b6:a03:223::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 19:16:33 +0000
Received: from CO1PR03MB5665.namprd03.prod.outlook.com
 ([fe80::8037:ee0a:e1bd:bdab]) by CO1PR03MB5665.namprd03.prod.outlook.com
 ([fe80::8037:ee0a:e1bd:bdab%7]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 19:16:33 +0000
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
X-Inumbo-ID: 2bc4ff39-f3f2-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656098203;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=ild9snMu/raeOCqx1MqDdXeVWZhRasZNAveMe1vfscQ=;
  b=R2CPn7l1VYonO8E1i0iOdZVIMxQyV8HnB2Yy4U3A6NdQA6S5G7EFPmoX
   0WEhVx7alXndwQrV+HpaL+4wghWZ80FDUifu4ngaggwxr+ZsZYjVq13Dy
   gVSGnY4k5J3BJnrZpQKpWUGVH5Y364Z1AoY5gH5Xs9GqF+4nVPaVnk/Dt
   M=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 74374948
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ujcw3a5xM24ubgxAkIiv0AxRtM7GchMFZxGqfqrLsTDasI4TYg02e
 lBvGjDRZK7OJyCgZYg1O70CxjpU75OGytRrGwJv/ChgQi9HoJHJC9rAchmrMnKcdJ2TFx5tt
 JsTYYSZcpFtEnGH90qnPuaw/HVx2PzSHuWiAeOeUswdqXeIbQ944f40s7Jp0uaE+OSEPj5hm
 e8eguWCaFP40DQraj5Juvvc+EM/7K2s4mpIt1UwPv1B7AfTyihJAMoTK5/qIiqjSOG4PAIbq
 8Uvbl2d1jmEl/v4Ior9yt4XSmVTHviKe1LmZkN+A8BOuDAbzsAJ+vt9ZaB0hXt/0W3TxYgvk
 okV7vRcdC9yVkHysLVFO/VnO3kW0Z1uoNcr9lDm7KR/Z2WfG5fd660G4HMeZOX0yc4uaY16z
 tQKKShlU/y2r7neLIRX6AVbrp9LwMHDZOvzs5z7pN3TJa5OrZvrG80m6TLEtduZaw8n8fv2P
 qIkhTRTgBvoSAVyNwkoT78FjPqqxVvjamdxhGq4uv9ii4TT5FQZPLnFFvPwI4XPbuIM20GSq
 yTB4njzBQwcOJqH0z2Z/3mwh+jJ2yTmRIYVE77+/flv6LGR7jVLVFtKCh3m/7/g1B7Wt9F3c
 iT4/gIBoK8o+0HtYsT7WxSgiHWFogQdS5xbFOhSBASllfaPvFrIWjhsojhpV+YIiPYvfgQQ7
 HiKvPLbJwV/vOKbcCfInluThXboUcQPFkcAbyIZSQoO4/H4vZo+yBnIS75LAKOzy9H4Bzz06
 zSLtzQlwaUei9YR0Ke29kyBhCijzrDWSiYl6wORWXiqhitlZYuNd4Gur1/B4p59wJ2xS1CAu
 D0PnJGY5eVXVJWVznXTEKMKAa2j4OuDPHvEm1lzEpI99jOrvXm+YYRX5zI4L0BsWioZRQLUj
 IbokVs5zPdu0LGCNPAfj16ZYyjy8ZXdKA==
IronPort-HdrOrdr: A9a23:keUu9axFZB9UF3yxQOWbKrPxgOskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk80hqQFm7X5XI3SETUO3VHFEGgM1/qE/9SNIUzDH6tmpN
 9dmstFeZHN5DpB/KDHCWCDer5OruVvsprY/Ns2pE0dLz2CHpsQizuRfTzrd3GeKjMnObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUezpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZrcI5p4dYyxY/ouW3fRYzWTFcFcsnq5zXQISdSUmRUXeR
 /30lAd1opImjXslyqO0GbQMkHboUoTAjnZuBClaDLY0LLEbSN/BMxbiY1DdBzFr0ImodFnya
 pOm3mUrpxNEHr77WzADnfzJmNXftrdmwtcrQc/tQ0obWIlUs4ZkaUPuEdOVJsQFiPz744qVO
 FoEcHH/f5TNVeXdWrQsGVjyMGlGi1bJGbNfmES/siOlzRGlnFwyEUVgMQZg3cb7Zo4D51J/f
 7NPKhknKxHCsUWcaV+DuEcRtbfMB2HfTvcdGaJZVj3HqAOPHzA75bx/bUu/emvPIcFyZMj8a
 6xJ2+wdVRCD34GJff+rKGjqCq9MVlVdQ6duf129tx+pqD2QqbtPGmKVE0u+vHQ1skiPg==
X-IronPort-AV: E=Sophos;i="5.92,220,1650945600"; 
   d="asc'?scan'208";a="74374948"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nC8IpoQS1nBySeh+yF8gvjCJ1azFEZ5r0y/YF3TvFPLytqxIl3RHqGIeKu9PzA2s7Plel0uRe5CgoQH4N+bUjVw2iGgFXfJ3UIEJoJxWQJEIOiqjnCfr2Qf5gQ2NbUNgvUIRoPh9pcBSaZbsvjlHA7t32ToJ96DIBWPnfanFr9aqgDewR4z5AhkcZ6yJkqThH9FhvlQrS/hOV/VOd4zJ6nFPoM63ixMVl/woY9Z5wYaSzbiFAGHdRjmyvtuJtfajs4iIcHNM8YZE8OV2+s6sF6AEQ5pDx6Xo3aTBZFMz/KJ1GU0pGZ+Y4J+pHVtNZRTE+bhgph7EXJyZo94NBjkHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fU9f9et3mZnoAlvZRoVmIqFqPnyz/WIVKE/UkfGTTWI=;
 b=YmIpjVGZZndKzeJIf3/aHVAPoWBoDXcYRYf1B6cGqgqRJKYYhqxKBcHOrSDv9U+wv7a7P89Sf77cT5U0p/6rYFS0XJa55wuaHpipvDJWeetm+ZB4/zZW5fDCaVtLWD0rQFAxgBvqa3cbV17mhlT5qWufSn8bXu2UUGaId+8AXKbErxMQnMhyUAGgnOfGEhvdG5Y29mhqOBOZ7mrrCvn8FAO5Tjwadfdpba5ZicloPPcNQwrClXurwum2yuq3rhAx4kkubv77HxXFhYC+QS3i5RCvcSM004JhHhWueAJTo2F/EAlncZxgMVX4QH0JUvK3iyvDVlMO3kKqdwGzKWom9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fU9f9et3mZnoAlvZRoVmIqFqPnyz/WIVKE/UkfGTTWI=;
 b=lmk+Zo8jFQn9Wjl68WnZW0bdk7r0BZXczXTsJT8EmZMmP1ygRuT3R2nKkk+0Yj6KPzIIfqILsumCx1n48bhzXzGelBd+qjMt5I6oKR9GtOzgxXhCTPRgiIRZrMuBslH2mErJOcIE3RBFZTrqvHlCRqhQJQxgbbhpKlt7++lHz2M=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 1/2] x86/shadow: slightly consolidate
 sh_unshadow_for_p2m_change()
Thread-Topic: [PATCH 1/2] x86/shadow: slightly consolidate
 sh_unshadow_for_p2m_change()
Thread-Index: AQHX7O+5hV+aChvnbkCC5GJvwBDI6a1gI+MA
Date: Fri, 24 Jun 2022 19:16:33 +0000
Message-ID: <87A27648-D543-4122-A354-A37CC4C4BEA4@citrix.com>
References: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
 <521b39ce-2c2e-967e-ecc7-f66281aee562@suse.com>
In-Reply-To: <521b39ce-2c2e-967e-ecc7-f66281aee562@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d167621-e9fe-430b-92bc-08da56160d2f
x-ms-traffictypediagnostic: BY5PR03MB5188:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eHWRF2YyfhLA7GsJvYlZ1ViN7FGkrevoeCy0xSovQ9x/7Mr4MceIUwdAKxrXkfhFnqPnJ7tntdL1JdFpwA8Kks2dXKGzAlM/3hOiaFqXzgu6ZzWkd5Zh/+0fotT3sft7xVPLbUDzghaoHXhsNV6D/uiBbTHvHdxvs6xc9mhPpY+2TVxBSOJ8pIAgM9K3GWeiGKqFrOWfJdeC/+FdfLJl89xZDewKpup36C4L1eM3pLIN1soY4PpAGQDqwOUEcSUFbRUcU8kAzre8DmVrwqH1Fhw/PW5mahP1qMIyhbEyz0zbAGgbxyhA+pPftkpisGbWmDFqLArFHMEBnNeEU9ICAtjYbArAVe6qNiOR5xoxgS6cOondhqU9tnnbssT/vtpu1IG20sDNsVvEi6w5/gLWkp59V0/XxN3LywfcdKaeECLc0GpnxYc2XLLTDfKYxkQTtkrcNqtdq//+h3EvRCwYwhqUDi1489fuHbTnKpeo3OPBKHjEew4c4M1mXrhG67L5LrDuzUMS45H1KEM9EizWaNbgcUe07mAQI1NhY9j5jrjHL488Fo2Yt1nYepdk5IBUQBcfYIuOhJb+6zXM0DNS6iAZo1GOJkNTDceP+G5njf2wA+B2memm2XtKuhL8c7yt8MkOjT5th6dbeVdhdIf09ifE2iXsxbT1iWyZl/SKi+jDV1UxW4nIv2mRbjy34c1zMx8zWWDIkuXGPSjQnrUOFHXLgqiSCWB6R6c2TTaR3x+skutQX0rfbphMPef2rTUsmNqeoZJu7A1gBKG9VTAQo5Z8iRhiHj4V2M1o3j8oaMzRhpqfKT9Tg3xrGFc8uCi40ltuMfSdZWxtPyEKhhZ22xrclwPQY+Dx6uZAn6yZ4vYleGr4viWxyfjKmBYkzmBY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5665.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(4744005)(86362001)(5660300002)(36756003)(91956017)(8936002)(2906002)(54906003)(64756008)(6916009)(76116006)(66446008)(66946007)(4326008)(66476007)(66556008)(316002)(33656002)(53546011)(6486002)(71200400001)(122000001)(38070700005)(8676002)(478600001)(99936003)(6512007)(6506007)(186003)(82960400001)(38100700002)(26005)(2616005)(41300700001)(70780200001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1lXZytxWUNQaFpJZjVmUzFNM05YMW1jKzY0d2xTL1RneXd0UkhwQjhyeTJw?=
 =?utf-8?B?M3UzSGlDQzUwVUZTRkdpdGcrMEpDYjhFMGVPOWEwWS9hQmh3bkNhenZlTVgx?=
 =?utf-8?B?WUlXKzNndkdIUmF3T0hzcXlXR0lFQXJkNnV4QmFjWDF1U1lMMFpadWlzQmN6?=
 =?utf-8?B?bUFxMTR5b2ZKR1JMK1hjNHFTbnE3bThFWndxUWh2RHZtSTNWc1JkVnNtWkVI?=
 =?utf-8?B?TmlraG1lK1ZrTGFJUDc0VndhOUFuemhHblJsT1pNanN2cms5WHpPTGYraFQv?=
 =?utf-8?B?djR3aSs3KzMxQjBWdUd5NXNlaVJVc0FkdkN5emtZcnBWaC9pOVVBd0NsRmhU?=
 =?utf-8?B?YzlmSkRWdk90a2I1Z08reHFaQldKYmhpRVovLzFsN0VBcGRqZzExMWU4dFBL?=
 =?utf-8?B?NU91QldCWWdjZ1FVc3hQa0t4T0w2M2FDR1QyRFloREFpSGtiYmY0bmE5U2pU?=
 =?utf-8?B?b20vcUw3OGUwZWtaUW9Nai9zU2t5YnYzY3JEb1p0elgycnRKYXlpRVRETWlC?=
 =?utf-8?B?MU56TU4xL0dFdk1US2g5RUV3V0c2Qjd1Rk8ySDlIV0psY3BuSjF6TU9VaWFy?=
 =?utf-8?B?SVhKZ1ZOMDI0VnlpdGxQUGwyL2g2NlV0SXRnWVlCSW1ha1UvNDRxcXhnbjJZ?=
 =?utf-8?B?dkFhdGZWMERxekZ0SmNpTDRqQlBqV0NJNU1YNGwwTHF3alZYd0NYZWFWUWhl?=
 =?utf-8?B?THgzcXlDMzYrbDQyUlBKbTNxUDd3U3FtcE5GQ0lQSjZpR2szMXUxN1hJQVBX?=
 =?utf-8?B?UGlKQTNQVjJ0RnZxc1VaLzRGbW5VSnpBdUs5WW9JdEIwTktPTTBTckphY1Fm?=
 =?utf-8?B?OGpmUHljRUlqTzdHNnFJMWo3Sks0Rk94RWg0cEgvL3VrallpakR3bXE1VzZ3?=
 =?utf-8?B?cGRocndXczVvc29KL0tzZ3BHbk1ZODZKTlkxZm5nUGxOSzMxY2lKcnVDaDk5?=
 =?utf-8?B?YUpNTVhuaE8vYm51bU9SOE84RzhucHdDUDFhOXg2ajZqVHV5WnVLZ2Q0NWd5?=
 =?utf-8?B?c1czRUpFK3NXUUltbGIrV2ptK3FuVXJuUXNYMmJFMCtsaXVqa2VQUmcyQXI1?=
 =?utf-8?B?R1ZKbzhPZDJMTFRVQk9nZlFHUDJ2YTNWQ2lZTmdOcUNwQVdpSFlmY0Q5RWJU?=
 =?utf-8?B?cmJNcnRESDhjc0lBV1VKTnRQN3JPbXlyYkFYSDFZdW1LQlJleGIrTDN6YzlY?=
 =?utf-8?B?Ym1BOTd0aVRKejFmdDJ3VmJPd3phVTRJNXYrellVTHl0Q2R6ZVV1b3dFMUlD?=
 =?utf-8?B?aVk2bWpRYmxjbkFkT3k4ZkFWT0lJa0E5c2pXSTdhUGI5ZmhQY2hHZFlvSXZz?=
 =?utf-8?B?N3RENWhXTVc3aDlnK1pOaVFUWjUxbStuV0ppRnRVSVp4WnVKb3VEeUF5eWcr?=
 =?utf-8?B?U1ZMcWoraVZhT3loVGZkRVI5eVVqQUc4S1VDYmpUU1lYaTRyTTJMNmNqLzFw?=
 =?utf-8?B?ZW8zY25ZZ20xaE0rcENzTTBVWDFXME9uS3RNU2o5QjVzb3hURDl0TXozSHRq?=
 =?utf-8?B?QWhNd08wUENBd0pIWGJJdFJMazRNcktwWUsrSU9TNGdMQWRnclFucjA5UDVT?=
 =?utf-8?B?MlRaOXNobko4d1ZxeEgyK3FWeFg0c1llMkc1VGhkSmRuV1NVUS9Dei9MQUps?=
 =?utf-8?B?d2M2eENUS2tHV0lMUHduRVI2SEtrbE40dFZXSHpzUGJvRThkREYyb0o0bnRq?=
 =?utf-8?B?QmI5QktLMUIrRlE0U2pVVGNtRHlZZnRQdDlVOXlwM2w2MmxDNDFQWFJUTEJO?=
 =?utf-8?B?b0NBMFR3eUVvOTZ1MkFnVlp5N1VYaW5EakZFK1A1bGJpSVBYeDRrVzd3QW1S?=
 =?utf-8?B?REVJaHZLV1AxNnBGYWx5MGkwNE83Z25oa29YQThpQzZSK0Z0cjRRQ25Xb0Rt?=
 =?utf-8?B?S0FOSnpEd0xLalhGanFTMHlVTXF3STZSOXFGSVdqQ2hYUkhzWHZtQUdqeEFR?=
 =?utf-8?B?YmpCYVlmc0JoTVhKRWZkYytJdzc5SzBLV0RPQU1UdXlReEw3TlFjT1A2N3V0?=
 =?utf-8?B?WC91ak95a0NqbTg2L2xidVNvVkRYZk50UUVxS3VwTzJNK2FldG81enk3bSt3?=
 =?utf-8?B?S0ZNZVZvRjFSYXkxOWQ4VkZzbzY3cFJTamRDd2kwYlZhUkd5cks4dDhOUUp5?=
 =?utf-8?B?R051NjEyNVJYTjYxYTNtcXM0ald2bTRROElCbXh4cmczSFpTRTU5MzVHNVQ5?=
 =?utf-8?B?N0E9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BBAEB1B2-92DA-4E8E-B9D6-67BA3A8C2166";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5665.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d167621-e9fe-430b-92bc-08da56160d2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 19:16:33.6368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VtmxKndTF5YFwi6AJ+jEsk6nd4yA5SxLIsRI1lfUg5fk92337apJoovV3+PnJPoHlDIATU2Uqs19AGWvYGTTRIVwvPqJgzuc4jj8YQzAb5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5188

--Apple-Mail=_BBAEB1B2-92DA-4E8E-B9D6-67BA3A8C2166
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 9 Dec 2021, at 11:26, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> In preparation for reactivating the presently dead 2M page path of the
> function,
> - also deal with the case of replacing an L1 page table all in one go,
> - pull common checks out of the switch(). This includes extending a
>  _PAGE_PRESENT check to L1 as well, which presumably was deemed
>  redundant with p2m_is_valid() || p2m_is_grant(), but I think we are
>  better off being explicit in all cases,
> - replace a p2m_is_ram() check in the 2M case by an explicit
>  _PAGE_PRESENT one, to make more obvious that the subsequent
>  l1e_get_mfn() actually retrieves something that is actually an MFN.

Each of these changes requires careful checking to make sure there =
aren=E2=80=99t any bugs introduced.  I=E2=80=99d feel much more =
comfortable giving an R-b of they were broken out into separate patches.

 -George


--Apple-Mail=_BBAEB1B2-92DA-4E8E-B9D6-67BA3A8C2166
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmK2DYIACgkQshXHp8eE
G+0ROggAt+Aj2MNbIfwEFxdCsSHn0db4K0r4zUR2frFPjEkFH21L6LqfJ+HN80Xw
bfShhmFH7CjiPOQgwzhBi2TwhSMYp7ixF4+Zw/GugguOmMBXxm1zV0Svt6uO/ndh
e3IICa+C0cmhEPUloueV9u0i5IDgrNA2jAP2uxAy+LB7ZWk2xHkjAJj6rf9liqp2
Bvg0zeFdY7rN+2fFELSN3tJ2kTtD6owrpD4KXYfAbmAiJ7oaLRoodY4wOt3pYUw7
LLWjk4WKGx7/ew9gSakLuKj+OrdbM/nq2eT381yE6QtLAbkhvKKVTMLD4TLdlUn1
2yVfaEc8wSH2h+2vCdCirABklHhUyQ==
=IvKB
-----END PGP SIGNATURE-----

--Apple-Mail=_BBAEB1B2-92DA-4E8E-B9D6-67BA3A8C2166--

