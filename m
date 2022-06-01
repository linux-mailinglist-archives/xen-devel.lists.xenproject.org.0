Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7676153A5E7
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 15:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340493.565537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwOL1-0004SA-W9; Wed, 01 Jun 2022 13:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340493.565537; Wed, 01 Jun 2022 13:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwOL1-0004Q3-SV; Wed, 01 Jun 2022 13:24:39 +0000
Received: by outflank-mailman (input) for mailman id 340493;
 Wed, 01 Jun 2022 13:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=esiv=WI=citrix.com=prvs=1449ffc77=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nwOL0-0004PZ-9G
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 13:24:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d663397-e1ae-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 15:24:36 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2022 09:24:05 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by SA2PR03MB5882.namprd03.prod.outlook.com (2603:10b6:806:118::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 13:24:03 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308%4]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 13:24:03 +0000
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
X-Inumbo-ID: 2d663397-e1ae-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654089876;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=wAi3SuFVLEZpKYb3Per3z2ksllRzzuypzMGu+/fasxc=;
  b=fG9PzVHrpZjTc4H84CHWHo21m9IXHmG7enfUZjeIZScNmuJAcUBR4TRu
   Q0+BGVn/WBvIkOqfdlK3Zfxs+LFS4WlL0ou/oOxlCpyJ4V+89IDTUD9KC
   0t/843CI2lzh1OsciCA5Dd/2BD//pVVFCtPcOULAzKD0U5ylLqTaTDK0y
   o=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 71973227
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SUME6aopfR85iB1JeE6PX7Oo36heBmKxZBIvgKrLsJaIsI4StFGz/
 9cnaN20SrzTNTykP5w0PZPnthk2DaWln4VqTQJu+C42E39H9pPJDI3Ff0r5bi6cdcCcQRM/t
 ZkTYdPJIp5pESeH9x3xPOK58HQihKvTTbGnVeOUYyp9SWeIJMtZZTdLwobV1aY00YjR73qxh
 O7PT+3j1H6N0mIsOTIZtv6Jo0Iyt/ijsWNH4gJgOPsW5lSCnSlOXcxOea3pI3XGGYQFReTSq
 8QvbV2aEsE12z93V7tJR56iKhVirob6ZFTI0jwMM0SbqkAqShYai87XD9JBLxYO49m1t4opk
 o8V68TpEV1B0pDkw4zxbTEJS0mSAoUekFP3CSDXXRu7lhCun9PEmp2CPWluVWEq0r8f7VJmr
 JT0HAslfBGb799a9ZrgIgVaambPG+GwVG8XkikIITg0lp/KS7ibK0nBzYcwMDvdGqmitBsRD
 iYUQWMHUfjOX/FAEnY6K7QQnd6BvV2hSGZ4llC8tIYpvUGGmWSd0JC1WDbUUvqjYJwP22On/
 CfB9Wm/BQwGPtuCzzbD6mirmuLEgSL8XsQVCaG88flpxlaUwwT/CjVPDQf9/ab/1BD4B4o3x
 088o0LCqYAd+UuxQdS7cwC+pHeclhUdR8BRA6sx7wTlJq/8vF/IWTNeFGEphNoOpp5ufAI47
 0WyovS4CwVVrO2OElaZz+LBxd+1EW1PRYMYXgcGUA8E7t/LsIw1yBXVQb5LC7Wph9f4HTXxx
 TGiryUkgbgXy8kR2M2T/1rKnjatrZjhVRMu60PcWWfNxhN0YsupapKl7XDf7O1cN8CJQ1+Zp
 n8GlsOCqucUAvmlliOXR/4WNKq0/PvDOzrZ6XZFEoM97T2r9ziGdJpJ/TBlDE5zN4APfjqBX
 aPIkQZY5ZsWOWTwa6ZyOti1E55ykfCmEsn5XPfJaNYIeoJ2aAKM4CBpYwiXwnzpl08v16o4P
 P93bPqRMJrTMow/pBLeegvX+eZyrszi7Qs/nazG8ik=
IronPort-HdrOrdr: A9a23:cfZaKavxwExEGpVd0P9Hqh3C7skC2oMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKdkrNhR4tKPTOW9VdASbsP0WKM+UyGJ8STzI9gPO
 JbAtBD4b7LfBRHZKTBkW+F+r8bqbHpnpxAx92utkuFJjsaCZ2Imj0JbjpzZXcGITWua6BYKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/H2VwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5p+7Y23+4gowwfX+0SVjbdaKvi/VfcO0aWSAWMR4Z
 rxStEbToNOAj3qDyeISFDWqnTdOX4VmgPfIBmj8DTeSIXCNUwHItsEioRDfhTD7U08+Nl6za
 JQxmqc84FaFBXagU3GlpD1v4EDrDvKnZMOq59ks5Vka/pWVFaRl/1swGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlJhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OGDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowlLau3ieffFm8Kc7giwlGl/NLAgF4vsulKRRq/n7WKfhNzGFRRQnj9agys9vd/HmZw
 ==
X-IronPort-AV: E=Sophos;i="5.91,268,1647316800"; 
   d="asc'?scan'208";a="71973227"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUzG1EqbAGH6RJRa+tS8i5MYZIBm/OUCxRVPWIfzm4vCPj46aqouRc5X+U5yPMG8Fm4Jv9iLzcS6lMAnCcIut1fSCdUOgYnKuqenjKNUuUU0Br8P+yfQcYwmbxu0tbSTfBtpZ8/xR/Q9rFtIAbVOct2p6tYXbHFIcvoVuJaPX5OxhFkpCLyyab9JUALk2iFIO6IlvupdPZWcTGpAqegoqnZpPzVrVd+4OTOLyCTDAQIQnURNAuaBSYGXRXpvXni6PQaKInPhXQwt4/zssbDFBvglAUaCOG1htk9kzRuAb5XxJ8URxtyAeiJbiHe+Yy4yXTyIHzlp/0bMdtyJzeZajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjG9hrypZaAfzJEJFVUpDDNmNj+90uGx/mUfxj3Etvs=;
 b=ibCy6BThcQ7yWdtvy7lHl22qTtIfWLMdcgc+Ja5Dlja1u9naZ9qlyGwwIGONbwmWFICEBHfXIeeQMLYsKVuQ99/FH36vneaa3kIf2U8AFa2tVb1hqut1beKHMnPFLnRoF+7CAwbh5VNyJvMPGpFdKZo6cQhLK888z4Kbcix+Ej9MF7QEErTUlmvE1lZpIWglkeRnLwRCR9Pu3CpFjv7P/cDvqgxej7rviLyB+XujZSDEziMf9rVCWSqzZ0m83GH5b7uJ9yc4MR5oe3oGgw4wpl4X+aVG+A7PE4DENX9cao3ZuufNSi4dO/kh70j1v0sEzfqRPnf3GJMP6kAfHWm7rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjG9hrypZaAfzJEJFVUpDDNmNj+90uGx/mUfxj3Etvs=;
 b=w9UgQs/sAIptxXCH96Sqv7QXnzqfh3gFMsQxfIW+WRIsY97t0odRhiaE+12nkDfxMl0/ynHqk3dmiIhOb6jcNW60MkA3DDnBALnowWGSkhqMEn0BHJOe/BDt52xF7yXhhUQIOual4jlj6WPy0eQE6tkBCxV/deEUZSmC3j+8pBE=
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Juergen
 Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: Re: Process for cherry-picking patches from other projects
Thread-Topic: Process for cherry-picking patches from other projects
Thread-Index: AQHYZtZ1suK3TAKIFU2tuY9R7u+Tcq0jN1mAgADFIoCAAEpAAIAWYU6A
Date: Wed, 1 Jun 2022 13:24:03 +0000
Message-ID: <EC24A8EA-BB7B-4D66-9799-929761913493@citrix.com>
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
 <5e4d505c-a02c-eb54-8299-b1078943a8a5@suse.com>
 <alpine.DEB.2.22.394.2205172012100.1905099@ubuntu-linux-20-04-desktop>
 <9bb6855e-ee93-691b-877e-b187db91dbd7@xen.org>
In-Reply-To: <9bb6855e-ee93-691b-877e-b187db91dbd7@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf493ddb-4ddb-4030-98b6-08da43d1ff44
x-ms-traffictypediagnostic: SA2PR03MB5882:EE_
x-microsoft-antispam-prvs:
 <SA2PR03MB5882E85701930B698D66ACC399DF9@SA2PR03MB5882.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5c0xP3LskNJnZKncu23KbVFSr4651lMqFRQaDUE+ZnCE4PCvNOPx1+aAmmAq96HKG7HosybdmU5s474cQUaMzMudiEhco7XbHrmgvmdADPOQP/XXgXalZ1bt/hznrnt0jBT1nKeqzrbP5oxzXsrsY8GGaFFDa7+A/fNJ8xHNagS4Ak0qRgMPPcZ8Xb6Tos6hWvSGpLSimcWuiwRqZ0y3ePSqVxzIo1FkL8hl8v2BJkF2MgoaV8ALE59Li3IZSFCx/QazL16SIZ0EG4AWFI8Xv9S2vmvVd4g/gUvE0LLTE6xnCxgw65PLUnOxkJb8byqf2TZxhpLTe9GjdFJczho8Y7icNjyAKaxWJ4SDK0UHpJxrGUn5OpeHdTKNlzxyig63vsOEo8gwQvBzjCz4B4U6blCTSx2XHTV64sfUy4X4R5dQckSGvzh46lTky4ldXA5PkAYppw8p3lsvq2Gy3GIsNqTy9YSl1efWq+TuzT9z1NKLh2r+yCLs8/A3YOH1tlcwgu2wskF59N9kGjO390mIDgEzgZRXcKLXacYXUlagZJUOu6ls6RRgih+uHxghGcHUy0MxjOZBiXNp7zpaPELDchr3gdFccGmPU/51nFqRI98blVyXAVY54MBi+aQge0cZYBsXHq3nWGolShl1Hr0PlEaoEdL5ifSnUGjpiz5jIdE8VTCvWwlH0Tj8GZV74xnb02aKEfY47trpzufM9fxiTxO39WXy231WAl3JJaM2cRwKKqCVuA0mkL1+tM6lOVp/CTjIAqqk8WFWGV7+pTiuhqZevNzDf0mC6AisE4UA0bBV6qpjH+V+P+e5YqwthDqInXv3kMeRPrTHnjlXB8B0IA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(122000001)(38100700002)(5660300002)(38070700005)(6506007)(83380400001)(508600001)(4326008)(91956017)(8676002)(76116006)(36756003)(66446008)(66556008)(66476007)(64756008)(66946007)(33656002)(2616005)(82960400001)(86362001)(71200400001)(8936002)(316002)(54906003)(99936003)(966005)(6486002)(6916009)(2906002)(186003)(6512007)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rm1OaG1PaGhib3FXT1RvdE05cW9YU011d1BoVzVvUDdkTFhWYzd2bzFJV0tX?=
 =?utf-8?B?WTdlRXJCNkVPUUVEdC9GVkRyRVFEbktPTk54U3lwLzFqWnZnRzJ2VEtHbGhU?=
 =?utf-8?B?SkpEUWY4YVZXWlhIZ2VmMUVjYURpUllaTWNHZExWdWFITllKbzRTc0VxL3l2?=
 =?utf-8?B?Uk5aOS9sc1VCVXV1NWJhSjZ5UVdsOENoZHAwNXo0MTVwd2FUM0lUdlIraU5N?=
 =?utf-8?B?NStiNGFGNnBDNHRWSU5HRHFWa0ZwNWxzYlZKMUZqRWNKUDg2Mm4rdTBIZ2E3?=
 =?utf-8?B?cGt6cyt0bFRneTREUVl5U0NBczlOcjZ6SS9vQlhsR3lTYnA0TXg2S3FXUkZi?=
 =?utf-8?B?MjBjSnF0ZlNwZVJIZS9oUlNqaXRGVG1rUHRWOWNWbEhXeHBFYW4zVGozeUNE?=
 =?utf-8?B?c1BMczNqM2hJaEhiWmI1SWJRYkErQUIvR2tUc3FuS1F3Tyt1M0VSMkY4ZGNZ?=
 =?utf-8?B?UkU5TWRtTjMxQ3ZjK3kwS1pDSDlRZ3BNak90ak5udW4zODdtekx2bmZSaDZy?=
 =?utf-8?B?WE5MTDZiN1V1Y1FDMkVlM1NKa2x4SU0vQ28wRnZLdkgrTFJjYWcraG1RZVJz?=
 =?utf-8?B?N0RSaVB2c1JsZEpHS3JRbFBoMHVtbmFWaHV4UklLZUl6RUx2OC9idjJwN1lx?=
 =?utf-8?B?Zi80QzZuMU95S0ZXNG40YlhVNkc3ckU1U0ROb000cnowbmVwRGdMaStwNnVO?=
 =?utf-8?B?UjBIcVVld2FqRHVmZ1Y1elhxVzhHQUZTaGFaZ0hCb1FBUTQyL1Z5LzN2S0Vx?=
 =?utf-8?B?YVNqekxrUUMwK0w3Y0lyR29uWWEralQ0TzByeGtTQUo1anA1QlpiTGZ1VGJ1?=
 =?utf-8?B?cG96S1BkWUZvdXQ2SWpSWVNWWjc2a1VWZXhDV3pkNWNBa2prT0kvWGc4SGpR?=
 =?utf-8?B?Q0J6TFd1T1g4R0J0RU5LeWwxZFBFUDhyL2RvZWF2UDB6UW1Pek45MDhZYlhO?=
 =?utf-8?B?RDd5aTMrMHlQaFdEOGI0ZnVCZm9Zbkgydkp6bkdacGpXTlVVR1dZOHFsbTdT?=
 =?utf-8?B?ZnBJM2hLT3pldFhuWUxxVlZDaFE0ekNDTDA0L0E1YkNRQnFGeWVPV2FKeFFa?=
 =?utf-8?B?OWM3TnJOUksrczQrdDNHb3RUNk1xUmV4TUxEV1dpaXhjTGZMT3JRME03VGhD?=
 =?utf-8?B?NGprOUYwamhQODliWEJiWVBlVzh2MHFGUk10QUVvb294RmxrQVp3YzlicTlS?=
 =?utf-8?B?blU0c2g1ZTVjWUNFSUpnRTYwa2dsZ0wwb1I1cVNtcFByWjl5YkVGL1hWTnVz?=
 =?utf-8?B?UDR3NjdmOUFVWmYvbUxBQjhPNUZJMjJwQnE5anhZUW9vZE14Z1UybWFOSUla?=
 =?utf-8?B?a0w0Z3FKbHZvZTBjREVPeUV2NjRIMkNxNzhvZ3dzeUhseERoa2l3SGVib0xR?=
 =?utf-8?B?UUh6VVZpd2dqSERkbVFzS1N0Zkh6UHFJWVVCVUZrbFBEa3YzV3dqSDhwM3Rt?=
 =?utf-8?B?YmRMMVpPZk1mRnQxWC8xcHBLR1VOVms3SExHc2NITVRsS3N0NkcrVUEzR0V4?=
 =?utf-8?B?RXgrUnVWbFpXaTlDaVR4QTlLMEtQRzRZdmNSdHZoUW5JYWJWRFBPRHl6TGZE?=
 =?utf-8?B?NzlLUUxmdGJkcnFkNUtqS21VcERMNVRTZERyL1FZQ3lSOHo3akZsR0wyUTRW?=
 =?utf-8?B?ZVAvL1R5Q2RyTDBDQlgyZ0ZtMWkrRXVJaWRqK1VGR0R6bU1hQmhjTnd5MkhL?=
 =?utf-8?B?blZGbjdrRlF0S1JOTXhtdWh3QjB0amlHUmRYUktSZGFkTWlQaklVL0lMTndU?=
 =?utf-8?B?cjhyK3R3b3pQdjYvL2UxakxhL0h3RTlqNUlDdkw1QmhaNDh6K1Q4cGF0Rmw2?=
 =?utf-8?B?bzUveDdWWWhWWklNMjVLK0VsUTVTbzJvRFVQRktQS05RNGtpbXhZQVY5bVU2?=
 =?utf-8?B?SElJbTNGSHVpMjE0Z2dWdjVKL1A4OFRrbzFkTzhWbUpqemNmZnJMa29nUlha?=
 =?utf-8?B?YzNwYkFhSlFyTWhtNnpnRmQwYW9LVnAzeERuYTN6S0JCVTM1OStjTndtczBi?=
 =?utf-8?B?alJFMERtNG1ydTZPWmFuM2N6QThGRGc3OWMwSGwwNlhseFVPSVhjU1ZTTnVh?=
 =?utf-8?B?ZXQ5T0hDMkdpNm5FM3VOT2tCNnk2K0NSMThGQWovYmovbExGYTNwdldMTHpH?=
 =?utf-8?B?TXBjdThyQURTZkxIRVNsd3JoWEp6eWR3SEkwVk8zVlRoaGNabUtIOWxzRll2?=
 =?utf-8?B?dk5IOStCSEZOZ0RLdHd6akN5TlNEb2EwRHRRWDFIWHl4M1cvVmUyckwxQWdi?=
 =?utf-8?B?aEVqckQ5ZU5SR2IzSTV1LzB6cGtFNGhLb1ZjNUFGTWUzS2M0dFRnRkFWZU9H?=
 =?utf-8?B?YTg4d3pRWnBNWFhxNHV1MTFPSFord1V2SHh4MXhFMkxsbzdQYWNGbXRTQ211?=
 =?utf-8?Q?RfLqEP7CyabCjkUw=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_54787B9F-FECB-492B-B290-9D5F87F874F5";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf493ddb-4ddb-4030-98b6-08da43d1ff44
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 13:24:03.6101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I2o7lLdEfyD4HuzyYr33uNQhJuhE5HeIjUtOSbRrqPeR2NNmNi4K1Mit1VFT7hDqdSG77/2jgcDkd4u9d4c6wB97UX3ODD7cWmnXjW7py1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5882

--Apple-Mail=_54787B9F-FECB-492B-B290-9D5F87F874F5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 18 May 2022, at 08:38, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Stefano,
>=20
> On 18/05/2022 04:12, Stefano Stabellini wrote:
>> On Tue, 17 May 2022, Jan Beulich wrote:
>>> Hmm. The present rules written down in =
docs/process/sending-patches.pandoc
>>> are a result of me having been accused of unduly stripping S-o-b =
(and maybe
>>> a few other) tags. If that was for a real reason (and not just =
because of
>>> someone's taste), how could it ever be okay to remove S-o-b? =
(Personally I
>>> agree with what you propose, it just doesn't line up with that =
discussion
>>> we had not all that long ago.)
>> This is the meaning of the DCO: https://developercertificate.org
>> The relevant case is:
>> (b) The contribution is based upon previous work that, to the best
>>     of my knowledge, is covered under an appropriate open source
>>     license and I have the right under that license to submit that
>>     work with modifications, whether created in whole or in part
>>     by me, under the same open source license (unless I am
>>     permitted to submit under a different license), as indicated
>>     in the file; or
>> IANAL but I read this as to mean that only the submitter =
Signed-off-by
>> is required. Also consider that the code could come from a place =
where
>> Signed-off-by is not used. As long as the copyright checks out, then =
we
>> are OK.
>=20
> I don't think I can write better than what Ian wrote back then:
>=20
> "
> Please can we keep the Linux S-o-b.
>=20
> Note that S-o-b is not a chain of *approval* (whose relevance to us is
> debateable) but but a chain of *custody and transmission* for
> copyright/licence/gdpr purposes.  That latter chain is hightly
> relevant to us.
>=20
> All such S-o-b should be retained.
>=20
> Of course if you got the patch somewhere other than the Linux commit,
> then the chain of custody doesn't pass through the Linux commit.  But
> in that case I expect you to be able to say where you got it.
> "

So the thread in question is "[PATCH 1/7] xz: add fall-through comments =
to a switch statement=E2=80=9D [1].

This effectively turned into a policy discussion that happened on a =
random thread about compression algorithms.  It=E2=80=99s likely a lot =
of people who might have had opinions didn=E2=80=99t read the thread; =
that=E2=80=99s why I started a new thread, to make sure people knew =
there was a policy discussion going on.

I was on parental leave when this discussion happened.  Looking at the =
thread, I agree with the request of Julien to just C&P the whole Linux =
commit message: It just seems both simpler and more=E2=80=A6 fitting? =
Respectful? Something like that; and additionally it saves the reviewer =
having to think too much about whether the removed S-o-b=E2=80=99s were =
necessary.  It=E2=80=99s something that we should just do because it=E2=80=
=99s easy and generally better, particularly as we now have a way of =
indicating =E2=80=9Cabove this line is *their* way of doing things, =
which may have useless data in it; below this line is *ours*.=E2=80=9D

However, the justification Ian put forward in that thread =E2=80=94 that =
"S-o-b is ...a chain of *custody and transmission* for =
copyright/licence/gdpr purposes=E2=80=9D =E2=80=94 must be incorrect.  =
If it were true, then when we import a file from another project, we =
would have to check in *the entire git log for that file up to that =
point*, including all patches.  After all, we need to know *for each =
line*, the copyright provenance =E2=80=94 even having a massive list of =
all S-o-b=E2=80=99s from the history of the file wouldn=E2=80=99t be of =
any use if a copyright dispute actually came up.  I think that shows the =
absurdity of the position.

What we need to be able to do is, for each line of code, to be able to =
track down where it came from and who originally asserted that it was =
GPL, in the event of some sort of challenge.  As long as we have the the =
Linux commit at the point of import, we can track everything else down.  =
In fact, it will be much easier to track down from a Linux git commit =
than from anything checked into the commit message.

I=E2=80=99ll double check with LF legal on this, but I=E2=80=99m pretty =
sure having a =E2=80=9Cpointer=E2=80=9D to where the code came from =
(either a git commit or a message-id) should be fine.

 -George

[1] =
https://patchwork.kernel.org/project/xen-devel/patch/0ed245fa-58a7-a5f6-b8=
2e-48f9ed0b6970@suse.com/

--Apple-Mail=_54787B9F-FECB-492B-B290-9D5F87F874F5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKXaHEACgkQshXHp8eE
G+31eQgAhB7H9S/sKs9QPTrMvd0g20y1ZI5PxqfMQUpSDukDhSndbeY+RHZ/haEN
cGiAPubApwJRKcR7BVOQUrhe0aqBNbyWPTfOz2qhj7Mx9Eh6HT/UH58BFMLVHCpt
xdOnSTPIpFi4maBU7HQ/l7+BNrZM0fnLFEueaBMs00jOxhxT+U50juxp3sK7cSnH
Z1A3RYSzFQSbrfeGtlOBYF7/c50esoYvPS1apsNjP4gLK/edwNE1xyQSZeL6TuKW
P8vxSaXJ5qEIAI9FbkjgrpNLrxToNG+y4HcfjQGD4YtAz2MmBman62UZzO/OC1Lm
zCTRR0rLReV68rzWAfypsTPn6hcpjg==
=v3+m
-----END PGP SIGNATURE-----

--Apple-Mail=_54787B9F-FECB-492B-B290-9D5F87F874F5--

