Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB775FED4B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 13:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422829.669127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojJ5J-0006Yf-4N; Fri, 14 Oct 2022 11:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422829.669127; Fri, 14 Oct 2022 11:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojJ5J-0006Vi-0s; Fri, 14 Oct 2022 11:42:37 +0000
Received: by outflank-mailman (input) for mailman id 422829;
 Fri, 14 Oct 2022 11:42:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVin=2P=citrix.com=prvs=2797e9ea4=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1ojJ5H-0006Vc-G2
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 11:42:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49c0da31-4bb5-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 13:42:33 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 07:42:30 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by DM4PR03MB6032.namprd03.prod.outlook.com (2603:10b6:5:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 11:42:28 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc%6]) with mapi id 15.20.5723.029; Fri, 14 Oct 2022
 11:42:27 +0000
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
X-Inumbo-ID: 49c0da31-4bb5-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665747753;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=TOZrasQg1zEFX7/yUjKWSpiyNeStJzzDFA1QgGgDeoY=;
  b=dWMAW1qAhIcv282+3T8ea6p+7SJgbS8L8ISZsMQnSsRdtnckX9gSXUW7
   M8+uUYdM9uUS/PzHPsKO7eoBRoL5mNVvV+m5cbFJRS97R73FwyV1izsgq
   fPMbl3NfCLDncTT5DVZtzDelF0JxsJ7c6LU1AHghCWVTUeZ4odOIiEGbk
   E=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 83157726
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cKopqqAjlZRsZxVW/4Tiw5YqxClBgxIJ4kV8jC+esDiIYAhSlGxQk
 DNbHCvTJK7JMVJBSKl1O9izoU8GsJWExtJlGgBo+ShgFi1H8MadC93AIk2pZXrMf5edRU42s
 Z5BZIedcp5pQHaG+kyhauS+/CciiK/ZLlaQ5JYoHwgoLeMzYHtx2XqP4tIEv7OEoeRVIiuE6
 Ij/+sDWNACr12Z5YmxJs6zZph0xsP+ssmsV4QRmNKEXsAfSmUdOAcNEL8ldDZdarqp8RbfmG
 rmZnNlV2kuDon/B3/v8yu6TnnUiG+KUZ07W4pZvc/DKqgBYoSAv2boMOvMZaENG4x2EhNk0w
 9hW3XCKYV5B0pbkxaJMDnG0LwkkZfccoeeefSDl2SCu5xaun0XEkq0G4H4eZeX0ys4vaUlS+
 PoRLiw6bxzrr4paF5riF4GALux6RCXaFNt3VkNIlFk1Pt5/KXz3eI3Y5Mcw4dsFrpsm8cAyx
 SYuQWEHgBzoO3WjM7qMYX40tL/AanLXK1W0pL8JzEaeDqe6IAFZidDQ3NTpltOiR+d8tAWdl
 Ez8uDr3Ii9LFdGDzjff2yf57gPPtXuTtIM6MpSdr6QvrHjNg2sZBVsRSEexpuS/hgimQdVDJ
 kcI+y0o668v6EisSdq7VBq9yJKGlkdEB5wMTKtnuUfUlfe8DwWxXwDoShZuZds8u8JwaSEs0
 laRt9joGSZuoPueTnf1GrK8/WjrZHdKdzFqiSksbTAYzvi+ht8PkAPQHthfV4+4nIzrMGSlq
 9yNhG1k71kJtuYb2qP+8V3ZjjaEopnSUhVz9gjRRnii7A5yeMiifYPAwXjW6+xRarmQSFapt
 WIB3cOZ6YgmF5aWnjaKR+YLNL6s7veBdjbbhDZHAJ0J5zmrvXm5cuhtDCpWIU5oNoMIfGHva
 UqK4wdJvsYMYT2tcLN9ZJ+3B4Iy16/8GN/5V/fSKN1Tfpx2cwzB9yZrDaKN413QfIEXuflXE
 f+mnQyEVB721YwPIOKKetog
IronPort-HdrOrdr: A9a23:r7Pej6GDaJkwHOpqpLqFXpHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdgLNhd4tKOTOLhILGFvAE0WKP+Vzd8mjFh5ZgPM
 RbAuVD4b/LfD5HZK/BiWHWferIguP3iZxA7t2urUuFODsaD52ImD0JbzpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlEawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontprcZrau5p+7f63+4sowwbX+0SVjUNaKvi/VQUO0aGSAZAR4Z
 3xSlkbToNOAjjqDxyISFPWqnXdOXAVmjPfIBaj8AXeiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfFr9dLSU3am2a/hGrDvCnZMZq59ks1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgl/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9M0OM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI74X65b0kjdvaDKDgDKFC7a
 gpfGkoxlLaIXieePFm9Kc7gizlUSG6QSnnzN1Y6txwpqD8LYCbQxG+dA==
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="asc'?scan'208,217";a="83157726"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qkw3G1IXhOLIHkVfwcDjfnXdIlEYYYliU+l2UYfNKTdAzdnWvyvchR0uacid3p3oTZuQ+Mg0Et/7P4V259F/G5lxQMlsdKZdTyECy6n5ajIRRmAyStxGNu+S9g/iY7S9u4P10VUHrPB4y9ghWAy/xRPTUMAIQJ9Im5zZVMKALaBUHRuWE2c63k6NurEUGMLOjw9cyRLvfRTIf38XBxibC7+DIgot4xN6/q0vipHaRG/XEL/zD8LpwR+jU2nSk4ann43DiOozs3osQEvthbAdJcusx/CrxXA+0h/bb8pxwjybDLX5c9hyaS6tU5sPcajpO0OT0On7T673n2ADvM1txw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUYAnCOl6FJHCAvCkNgS7MLqmz1eDvRsP4Ci0ztpp5k=;
 b=lwJTflCUAqzei4TGMCVs4eBZR9bWFCyW7GNlbQDxvNCebat/zKA5rxN5CS23JtfULIga4G3vjDAEBifKtaD0RWRSzXjX21OnZDHJlfhOcHLGfVDwihYDk2D8n82tRmcn6fNErULLQvoS056oCAdMEAvgBOsYgVyfQHcPNfcgtA/QomqsDUfecxd9ifGRtMeHWg1mW8rVvBtihC45cIZUHYH9Hv/2AhSo/qBq9gpojPbFAAjMXzaOSB8tdf4joogjeZKrw2TJp3WjW7MxnZBjmdILFZ/c1FSCimCA/gBKZxIymyGrAiPbA7fDplfpGh4V2c5SJ5FFPht8bIkqhOFFFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUYAnCOl6FJHCAvCkNgS7MLqmz1eDvRsP4Ci0ztpp5k=;
 b=qUKqn3n5mNyEsqNvgp48EgUW81IOtBQgIwkP+GfaKZPoIHfP9MhzwMqBkfDllooqsDjaw590urEiK+491F1h805AhfQ9hEw35LmUqsT3w7Kobx9ov962SIgBdl/Vehl/pyPlrwh0DYHdAJJCrX3ywrKnacNSbkwor2+ppsXZAWg=
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH for-4.17 v5 16/17] tools/golang/xenlight: Rework
 gengotypes.py and generation of *.gen.go
Thread-Topic: [XEN PATCH for-4.17 v5 16/17] tools/golang/xenlight: Rework
 gengotypes.py and generation of *.gen.go
Thread-Index: AQHY3wTwBw4XcUEnKkOCwbXR47HHg64MavwAgAFV8ICAAAOrAIAAAWwA
Date: Fri, 14 Oct 2022 11:42:27 +0000
Message-ID: <AAAE12CB-696B-4736-93F8-0F8F81BE3687@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-17-anthony.perard@citrix.com>
 <3d5e662c-91b5-a390-c21e-90391961bd45@citrix.com>
 <C3A38BD5-E338-43BD-9EA1-3600378EE3B4@citrix.com>
 <532f15c0-8615-5196-e555-86a2d1094335@citrix.com>
In-Reply-To: <532f15c0-8615-5196-e555-86a2d1094335@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|DM4PR03MB6032:EE_
x-ms-office365-filtering-correlation-id: 6b1b7c93-48a9-4a13-49fc-08daadd92bb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kDRMjZhyMrcofIwYY5VB2eSNs+QdypCgryinmLbr9FoMXqnriG5pthI2c1o37b92yMLRLnLS3CJrEclxhhuDBSab2WTbsv+bB4YDCSXd6+kxrNCh8gV5F6jnHWxz09rw+Tjp2H1Fia1kQjGH5QBKuJ1faG8O1qYOeH9cg/XQn2ARNWawRWUaGHCYwuH0hWZ8+53ZvJqRSzKe2oHCCsc1EXzdU7YuopYlLtn9skKCBq2+W9wrw+JPsNzGL9ooWX9owcwRhhpy+YzshNEWfjmg1f8AJ4P/PdjhNKi3KOrRtFIRm5qBvWl/oXkQjku3AGWMPZzIN9MQ9y2Woq8inu1asA6XPLb9z6zQd7lAkultI3zXjAvmRAcPb8rPAeeMt4enWJY4HS2qdNri27yCOosX3Tr4UixktwbPvbJlb4uavGfc3/3qKNOp7EcFHZFiu9wQcXJF0rO8SJXZQJ8+ssxQvuR+bCA3vXD71Lrr6QWhUAkXW15bBJ15zhRPZs8rXg4CmmX18Wd5Tz/9nn6KXbipet6zqzDxEpt5FXLGKBWFq0zvqEfxMCaLJY1L2U0AbOfu4q9zhn6p8C1j10/dYweILtYKk+gbG2FTejCE8wc4y0N5uu2nFDSubdlX2HM4T1tRCARvQTwmkap56lxFIvny//NSkDThKo38li5NjriGxzHGVMixPVxjptaEHc92jP/+c9Y4EF6DFI0dpoS09ZIP4Vgn4smoTnIfZBHxPeX3VkDYefO1EL4abmrV1dLSNA4Y/KH9FFws5Vn3tlJ5DIFx/eXkact89RCiazxNEgvT94PI31K8GrOfAV+2rnUvaNOr
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199015)(66446008)(83380400001)(6636002)(33656002)(316002)(66556008)(8936002)(64756008)(8676002)(76116006)(4326008)(6862004)(66476007)(41300700001)(54906003)(86362001)(36756003)(2616005)(122000001)(186003)(99936003)(91956017)(66946007)(6512007)(26005)(53546011)(37006003)(6486002)(5660300002)(38100700002)(478600001)(6506007)(82960400001)(71200400001)(38070700005)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WXVKa1FiTjJmSzNoK0w3eVkvODVmdWVqcE9wdCtPRXEzem14QUh1eXMvVld2?=
 =?utf-8?B?S2tDaUJXb20vVDFGSXF0Wk93SmVkWk1ldEJydlh6RXdMbHFxYUdsM1A2SHI1?=
 =?utf-8?B?NnZSSUxoOGI2RU9OUjhTbEVhblJqQ3g1dXhRSW14TThBcTNTZ2N1WDBTdHFj?=
 =?utf-8?B?K3RLWUxkV05PNUMreDRZcGl4aW45OU5IdFlSZFpSM2RoenI3WVczL3ZCeWRa?=
 =?utf-8?B?dUEvSm11dWgvbU1Nd1ErMGp1aU5jS1pmbDRlM0Q2bW9VQjF0M3RodDJjWkF3?=
 =?utf-8?B?cDBZU0lIRk1jYlczQXFyTzN4RHh4R0sxQloxZkJYRTJ4R29NeVNSUG1kdWNw?=
 =?utf-8?B?TnArL1F6aU5NelkxYVVJVytZU1dYOG9yT2tpc3YvcVk1LzEvUjFvczNYKzFF?=
 =?utf-8?B?NU9xQVZvb3lzQ1lIejNwUmJiekQvV2hWSFZ3eS9MZ011aWtrZmllUVNsY1Jr?=
 =?utf-8?B?SjQ4bWRBdDFXTXRFd09vK1Fxb3lKQW5vOElmdTFoemhEREFMSE54bm5PMWF0?=
 =?utf-8?B?UW9lTm5kbU1jNDZtUDdHdW1UWjlpQmcvQmZIZnhzcmxIQUQ3TXpxRHNhckpx?=
 =?utf-8?B?VkdRTXNyNjBRZ2ZLejMyS3IrUjNJZkRmbjdoT2oybDBTOW0rdFZLcWY3OGZu?=
 =?utf-8?B?ZTZwMm1OOW1RSkE4SE42OWJQU1dsRTRuajBuVUJVUEdoRHNTVW5YaVJpdWVn?=
 =?utf-8?B?SWp3NGpQaGlYZzdmUlVXeVlsejFFSUdSd1dqTHk3NDF6ZWQ2aGQzV1VtSzZD?=
 =?utf-8?B?RWVKL2hSM2pRVG9XMTl0Wm1EQTVoODZ0a1g0NWZwSXErc2VCVDlTVm93dTBH?=
 =?utf-8?B?R1dUdi9pTjRPUzQ2bHpvb3lqdDNHb2VQVDBqcHFMb0wwTXU2bUh2Y1lTR1BO?=
 =?utf-8?B?bUNXMFgzWElwL1ltVEZ3eUlwbDZaR2ZDY21UTmZxZ0VhVGdQNk01RmR4YUtz?=
 =?utf-8?B?RFdDaFdQb2RYWHNjYkgvY1drMXFzdUR4WWNEaEFMZU5leTRFb1NGQ0RVazA2?=
 =?utf-8?B?RldBWjNZaTZxZHRRYnIyQnhuWk5XSE5pNWVqWFU2V2VhVFpIeGpoM0FmUDh3?=
 =?utf-8?B?UTluRHBTNUh6c1hoQXhvVTlDQlp2amFRdEFUY2FFUHhBSmdjcmFreTBoZFZh?=
 =?utf-8?B?UEp5MUk2THFzQlNCS1VrVWNpV3pzZUh1Rzd4bGtuVXdlbFE0M1hsRXp0WVJP?=
 =?utf-8?B?d3FRZHg3ekJtR0pWYzBKNlFBczBnS3BuZFN5NGdISFlMbUxZWlh5V1d4REE0?=
 =?utf-8?B?a0Vhb2t2U05LdnNaWkt1eExNbWtCUGkramlKZy9yYjZEcngraVlVUVB4V2lo?=
 =?utf-8?B?L3oxK3RhcTA0UENwaXQ2Q2FFS2hJaVVSUzF6VXFYMTlUVit0QjZFSjFlbXZK?=
 =?utf-8?B?dGJsQUdEQlc0ZzZSTWs4bkhudUpGdm9PQ21SUWw3d1IvUU9mVGZTUXJaMk9O?=
 =?utf-8?B?RnZHdElPU2RwNyszYitFcmN6dkxEaGV3NGllWVZrSjZOTDQ3TTFQN3ZLZXM2?=
 =?utf-8?B?Y2tTSllZVnV4dU1Pa0ZBNU5nUENtSTdIUGgyNWoybmlndEpVVE5BOWtPN1g3?=
 =?utf-8?B?aFkwSVlvUkxhVjJqK1JtRjJucEVOM3h0OWlsd2xuQ2xzSVIwRHVKektsczFv?=
 =?utf-8?B?eXNtRVhwV1I1L1NFRHJHN0luWjg2OGk4RjU0VEhxZnlJVGwxcnNJMkhvZEZ4?=
 =?utf-8?B?Slk4T0Z3V2VRMFJFUVBpZ3MvWGs0Mkt5RnBEK2VZVzA2eUwzdzNUSW04N2VP?=
 =?utf-8?B?UU11UlJBaGpjbk1HM0QxcnFGZVRXb0kyVkNkWTRSU1hjVTNnMkkxWmhDckFw?=
 =?utf-8?B?TUF2SEZOSk5QelRXZ0szRFQ2UVg3Nitnalh5NFcyQURGMVk1SWRBWUVmbGhE?=
 =?utf-8?B?djNzc0Q1Qm5tZEp3aFhSekpYK1BFQXFDL3pEYnVMZnZZdm4zS1hkL1RtZVJP?=
 =?utf-8?B?TUg0SWYvdkxkRUlkaEQvYTdtQ3JJMEo5Tk0xcGtmMVg5OGF4MVBZZDVGV2Ix?=
 =?utf-8?B?SHFsUUxyOXhSaE96V0ZNR21lKzBEU0VZN1NrclplNnUxblRSeENpa2VydU5w?=
 =?utf-8?B?VzRCdzdKb2xiNnJHZ3J3YjN1UFczSWR6RUROVzVyV1pDZTJnbW1CZVlPMHgz?=
 =?utf-8?B?eDZKSFRqSC9UeCt6STFMa3RxeVRzUE9KNGZzZ1VOR0ltNUZYSWZlM1JrWTND?=
 =?utf-8?B?ZFE9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_042BFC7D-79A6-43FB-9A8A-A73E92828C28";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1b7c93-48a9-4a13-49fc-08daadd92bb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 11:42:27.8712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W+gjcM6UuvMKQ8XRPNNdp4Nan2PpZjZWjU97+FwBzbpvYK/ENmfKMJ1O/vpaEw/28+qSGrch0P3ByZrDkZtHg/6OlG/xrqps8eVNYCccpn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6032

--Apple-Mail=_042BFC7D-79A6-43FB-9A8A-A73E92828C28
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_EBAF3AA4-D6F4-4329-9B97-EA1E8F467C95"


--Apple-Mail=_EBAF3AA4-D6F4-4329-9B97-EA1E8F467C95
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 14 Oct 2022, at 12:37, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 14/10/2022 12:24, George Dunlap wrote:
>>> On 13 Oct 2022, at 16:00, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>>>=20
>>> On 13/10/2022 14:05, Anthony Perard wrote:
>>>> diff --git a/tools/golang/xenlight/gengotypes.py =
b/tools/golang/xenlight/gengotypes.py
>>>> index ac1cf060dd..ff4c2ad216 100644
>>>> --- a/tools/golang/xenlight/gengotypes.py
>>>> +++ b/tools/golang/xenlight/gengotypes.py
>>>> @@ -723,7 +723,13 @@ def xenlight_golang_fmt_name(name, exported =3D =
True):
>>>> return words[0] + ''.join(x.title() for x in words[1:])
>>>>=20
>>>> if __name__ =3D=3D '__main__':
>>>> + if len(sys.argv) !=3D 4:
>>>> + print("Usage: gengotypes.py <idl> <types.gen.go> =
<helpers.gen.go>", file=3Dsys.stderr)
>>> This breaks with Py2.7. Needs a
>>>=20
>>> from __future__ import print_function
>>>=20
>>> inserting at the top.
>> Out of curiosity, did you notice this by inspection, or because you =
specifically tested Python 2.7, or because a system you were using is =
still actually using Python 2.7?
>=20
> Xen's build system can't actually create a build which supports Py2 =
and
> Py3, because xen.lowlevel.{xc,xs} only get built once.  It would be =
nice
> to fix this, but -ETUITS, so we state a specific version in the =
specfile
> and mock ensures there is no trace of the other one.
>=20
> XenServer is in the process of trying to retire Py2, but it turns out
> that Xen isn't actually fully Py3 clean yet, so we use Py2 for Xen.
>=20
> The build breaks because the libxl build writes the .go files even =
when
> we don't actually want go bindings in the end.

I think the generation code is looped in even when golang is disabled so =
that we can detect IDL changes during development, even on systems which =
don=E2=80=99t have golang installed.  In theory if libxl.idl doesn=E2=80=99=
t change, it shouldn=E2=80=99t trigger the build?  Alternately we could =
consider skipping the code generation on non-debug builds, since we only =
really need to detect changes during development.

 -George

--Apple-Mail=_EBAF3AA4-D6F4-4329-9B97-EA1E8F467C95
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 14 Oct 2022, at 12:37, Andrew Cooper &lt;<a =
href=3D"mailto:Andrew.Cooper3@citrix.com" =
class=3D"">Andrew.Cooper3@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On 14/10/2022 12:24, George Dunlap wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: JetBrainsMonoRoman-Thin; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" class=3D"">On 13 Oct 2022, at =
16:00, Andrew Cooper &lt;<a href=3D"mailto:Andrew.Cooper3@citrix.com" =
class=3D"">Andrew.Cooper3@citrix.com</a>&gt; wrote:<br class=3D""><br =
class=3D"">On 13/10/2022 14:05, Anthony Perard wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">diff --git =
a/tools/golang/xenlight/gengotypes.py =
b/tools/golang/xenlight/gengotypes.py<br class=3D"">index =
ac1cf060dd..ff4c2ad216 100644<br class=3D"">--- =
a/tools/golang/xenlight/gengotypes.py<br class=3D"">+++ =
b/tools/golang/xenlight/gengotypes.py<br class=3D"">@@ -723,7 +723,13 @@ =
def xenlight_golang_fmt_name(name, exported =3D True):<br =
class=3D"">return words[0] + ''.join(x.title() for x in words[1:])<br =
class=3D""><br class=3D"">if __name__ =3D=3D '__main__':<br class=3D"">+ =
if len(sys.argv) !=3D 4:<br class=3D"">+ print("Usage: gengotypes.py =
&lt;idl&gt; &lt;types.gen.go&gt; &lt;helpers.gen.go&gt;", =
file=3Dsys.stderr)<br class=3D""></blockquote>This breaks with Py2.7. =
Needs a<br class=3D""><br class=3D"">from __future__ import =
print_function<br class=3D""><br class=3D"">inserting at the top.<br =
class=3D""></blockquote>Out of curiosity, did you notice this by =
inspection, or because you specifically tested Python 2.7, or because a =
system you were using is still actually using Python 2.7?<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Xen's build system can't actually create a build which =
supports Py2 and</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Py3, because xen.lowlevel.{xc,xs} only get built once.&nbsp; =
It would be nice</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">to fix this, but -ETUITS, so we state a specific version in =
the specfile</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">and mock ensures there is no trace of the other =
one.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">XenServer is in the process of trying to retire Py2, but it =
turns out</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">that Xen isn't actually fully Py3 clean yet, so we use Py2 =
for Xen.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">The build breaks because the libxl build writes the .go files =
even when</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">we don't actually want go bindings in the end.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote></div><br =
class=3D""><div class=3D"">I think the generation code is looped in even =
when golang is disabled so that we can detect IDL changes during =
development, even on systems which don=E2=80=99t have golang installed. =
&nbsp;In theory if libxl.idl doesn=E2=80=99t change, it shouldn=E2=80=99t =
trigger the build? &nbsp;Alternately we could consider skipping the code =
generation on non-debug builds, since we only really need to detect =
changes during development.</div><div class=3D""><br class=3D""></div><div=
 class=3D"">&nbsp;-George</div></body></html>=

--Apple-Mail=_EBAF3AA4-D6F4-4329-9B97-EA1E8F467C95--

--Apple-Mail=_042BFC7D-79A6-43FB-9A8A-A73E92828C28
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmNJSyAACgkQshXHp8eE
G+0yjgf+OaSSNFBJmDgR7mHzcUKvQRrYjWA361FUNk9P861rSxg3GE6ST4eyHjVX
58dQ2JyGVkt227R/5WmTDrzsaidPQrU+HG5OOTb+8xZh9fGakYxxVCSyPwPfwave
Y+XE0tNT7JkgmEmlTEkypC8DBDZacT/JO1HVfsMKejgboWgFdJXyBPLoGeXXiUfs
PGB95sCI6urWgqrN+1/ZnAfGF5wbWJZ9toK8QULiqigbJCGX4KycOF6UQS1cJpOs
D2yjStRQlG403D8TNssl+m24eIdshGGZAvmcnvdq7ygETgBJHfeub6XcA4Iomopt
jsAR5xdnBpAn2wtx+J+Lw2qVtu60aA==
=tW+q
-----END PGP SIGNATURE-----

--Apple-Mail=_042BFC7D-79A6-43FB-9A8A-A73E92828C28--

