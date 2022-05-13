Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5194526493
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 16:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328521.551568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWMe-0000G4-3R; Fri, 13 May 2022 14:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328521.551568; Fri, 13 May 2022 14:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWMe-0000EA-06; Fri, 13 May 2022 14:33:56 +0000
Received: by outflank-mailman (input) for mailman id 328521;
 Fri, 13 May 2022 14:33:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kM4v=VV=citrix.com=prvs=125061258=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1npWMc-0008Tw-Ic
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 14:33:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b50829b5-d2c9-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 16:33:52 +0200 (CEST)
Received: from mail-bn1nam07lp2040.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 10:33:46 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by MW4PR03MB6524.namprd03.prod.outlook.com (2603:10b6:303:127::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 14:33:41 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082%6]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 14:33:40 +0000
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
X-Inumbo-ID: b50829b5-d2c9-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652452432;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=+jpNM+czW8A7/uCgkLM+7pl+hrs0Gr/18GnPnKfQtLo=;
  b=bx08c81FBcdoE6tihnk6iEXubT31YFfArh5mulVCSAhZmCLU9lvcNdYK
   xj+xJZ8mSmHeawZtQVJoYYmAzTn0xkL1fjMCu2Sb6ww1g1taF7F3NP1vX
   AE7d5AgDzsBI0RPI3UALPbGqxt+UwzEZ6HArutH/1TZc/ipLsppsF+ttZ
   w=;
X-IronPort-RemoteIP: 104.47.51.40
X-IronPort-MID: 73759418
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zONEmajpU4P8NIjDmhJdtx/RX161zhEKZh0ujC45NGQN5FlGYwSy9
 lOraxnFY6jUMyawOYxoOc7lxf41yZHXzII3TlQ6/H1jFS0T9cCbCdrFdkmpY3/OdJOcRhJrv
 59HN9Kccc5tHi/R+E/3Y7G/oXNy2fGFTOWlWeSZNnEZqWOIMMsEoUsLd7kR3t446TTAPz6wh
 D/SnyH+EFb0g2YtPjoZtPnZ9Blm7az/5j1JtAA0PfsS4AWAnCNJXc4Tfa2/ESD1E9JedgKYq
 0cv710bEkfxpUpF5gaNy+6jGqEyaueOe1DI0BK6YoD66vR4jnVaPp0TabxNMC+7tx3Tx4ork
 IgU7sTqIesUFvakdNo1AkEw/x5WZcWqyJefSZRomZXOp6FuWyKEL8RGVCnaD6VBkgpEKTgmG
 cgjACIMdni+a9eem9pXfAXOavMLd6EHNKtH0p1pIKqw4fwOGfgvSI2SjTNUMatZammj0p8ya
 uJAAQeDYigsbDV9I24qJ9EEo96Kl3/PaS9Zl1HWt7Motj27IAxZiNABMfLzU/nSH4B/uB/do
 WjLuWPkHhsdKdqTjyKf9W6hjfPOmiW9X58OELq/9bhhh1j7Km47UUVKEwfk56TgzBLmMz5cA
 xV8Fi4GgqU17kOmCPXgWRmxuFaPvwIGWsoWGOo/gO2I4vWPvFvIWjFUJtJHQIIqjslmYxcr7
 1uQ3NiqACZ3gp2JClvIo994qhv3Y0D5N1QqZyUJUA8E6NnLu5wog1TESdMLOIS4lMHvEDf8h
 RWDtjEjhq47hNQOka68+DjvgS+op5XPZh444EPQRG3NxhhieIevaois6F7axfVNNoCUSh+Gp
 ndss9iT6qUCAI+AkASJQf4RB/e56vCdKjrejFVzWZ47+FyF+XG5eptLyCpjP0ovOcEBEQIFe
 2fWsAJVoZVVZX2jaPcoZ5rrU5hyi6/9Cd7iS/bYKMJUZYR8fxOG+ycoYlOM22fqkw4nlqRX1
 YqnTPtAxE0yUcxPpAdajc9GuVP37kjSHV/ueK0=
IronPort-HdrOrdr: A9a23:Vbhqo6yjaW8cs1QYEeduKrPxnOskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBYpTiBUJPwIk80hqQFmbX5XI3SFzUO3VHFEGgM1/qE/9SNIUzDH41mpO
 1dmspFebvN5DFB5K6UjjVQeOxQouVvhZrY4ds2uE0dKD2CBZsB0y5JTiKgVmFmTghPApQ0UL
 CG4NBcmjamcXMLKuymG3gsRYH41pH2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8F
 LCjxfy6syYwr6GI17npiHuBqZt6ZvcI+h4dY+xYw8uW3fRYzOTFcVcsnu5zXUISa+UmRIXeZ
 L30mwd1oxImgnslyeO0FbQMkDboUoTwm6nxlmCjXT5p8vlADo8FspanIpcNgDU8kw6obhHod
 R2N/LwjesrMfrsplWI2zHzbWAcqqN0mwtTrccDy3hEFYcOYr5YqoISuEtTDZcbBSr/rIQqCv
 NnAs3Q7OtfNQryVQGQgkB/hNi3GngjFBaPRUYP/sSTzjhNhXh8i08V3tYWkHsM/I80D5NE++
 PHOKJ1k6wmdL5eUYttQOMaBcenAG3ERhzBdGqUPFT8DakCf2nArpbmiY9Fkd1CuKZ4vqfatK
 6xLm+w71RCBH4GIff+raFj41TKXHi3Wyjrx4VX+4V504eMN4bWDQ==
X-IronPort-AV: E=Sophos;i="5.91,223,1647316800"; 
   d="asc'?scan'208";a="73759418"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTVIYA7mo6je4cyS7pa8amrds1Tq214VQbF+jJH3KgoFVAIZtYx3ToBqUYA8JfqGHZNHkZEP0W5Tn1d3AWSXcuH6EEYoiEs08TFrOg40CPgpRPW5HLH0moSjcBEyyAwFYVb7oevPk4gjlanV8neMJH2WUGnin6NnQQJhJUp2s+0AL4WhdksqKB0OL+SJizH2HwNPiTEoTNQ5Sx/oePnjOC/MvuOrnsXTf4IipnzjX/IkSJkzbcgf1woswOQl4TprkgPdk0UNsDsG6OQL0RPSDjvdbSTNsFHU7iFRH1V2KCqOa0QgfM0Diknm4tQVG8aliXL6HF15Dw2/N15uaxFGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfWjeWJ5F6b0q4cP6BoEx2st6elkpyS+axL6JKzqyZc=;
 b=QLstdDi4pqW0qvYGUrQzTXFFG1YXQoh00p3IwTk35uKMWV4xbLoCtAMHv1I8KUnygKXR55AMhi0DIwwLDxvCmjitnIAvuVDQsNj7AvKqjx7xRn2mnbLKOUdUNOVFrGzbNFDhso3zZ0lTeApcg+jI4apKBxbpe3kqEYYWJHYk2PESmmomfMo0NAqcbLekisWI9cmiQuRGBxyzKP4/3T5QEhdi0bECgoTuLJ9KiPaAlKZDXFgN1+RWkkAQigb3Yh911QxvAWjNM4bFSLAfT3a77dPLKe9OMUhe8Wl4R1/qybO3uV1zY0mzdc4oIntrQFySze6qxwZ+N5o1LDphoPmlfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfWjeWJ5F6b0q4cP6BoEx2st6elkpyS+axL6JKzqyZc=;
 b=anV4NfoPdkQcvnX05fRzdsRjBEHlXVI9eDePwK9fuXtLwY820n0H5Wbjw4IH2V2KpUXnjUGMSPTxbF7HsiXi40s8FEtqxplwB85PiiZodjyfB+s8g+ZMhdHQck5OO/IkjvPZSc2rqI7FTStLGF4BePcTzGQTevBtFuApFcLxViE=
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Process for cherry-picking patches from other projects
Thread-Topic: Process for cherry-picking patches from other projects
Thread-Index: AQHYZtZwibZ3DwtT5Ea5wKgBtO2ACA==
Date: Fri, 13 May 2022 14:33:40 +0000
Message-ID: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5abaee09-931a-45d6-249e-08da34ed933b
x-ms-traffictypediagnostic: MW4PR03MB6524:EE_
x-microsoft-antispam-prvs:
 <MW4PR03MB6524BC84E98E04AC039B367299CA9@MW4PR03MB6524.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xb+xFYRX5wIPmXwDDZQ+uO9OaaNYfMQxNwAP39DDToTp/Y1zEOg51vyA6FZCCi4hMeX2OnmXrnFATzSoRaCyZTSxbu/5NnoJyrTVpgCMMH4OYwK0WdsSUl540Et6mvEsX7W27xotCZrSOHz7uWsELvgKBVrd4/B8EOvWAEjXJ8BADoulCNUlefBliFoumNwcB5tvwkd4ES+KObnlJ+qguhXzGZ2kDPtfPcs0Iz5jDqhtzLRFuzKuPYflwwjn37SZj2HHV5OMAzP5PiBTb5ebPHjGMp2K6W6rz6D5rit/v7JDPzsRRbFIVv+a83JUlY6CZk9WG00eLqJmnSlCrdV0yigEDc5CbC9du6jlWKHYDas6JN4EceLWk6yWBnFohE5+jPNMlayeO7nQf2PTtoWZxOslVAohnoploOLxxW9gjWtAE3J0fP18Z4gZd2NnO6H3hsJlFE8Iq8ApQj1HEsTcMVN5uS77KrqZgi2UeHts9wP2yCgxjNV58QYhxMoAswpHOLkzzLylA1DY+NiQs2b56NSR3fFeE1WmZ3VGzEZzBuTrmRXZh6el71t9PjPW3qSSlrzwFxRwHPxX5u3Tvh3aG/WEup3K2Mfpgoy6/L7F5TpZ9CIeanSxpkcCpc5qbNB0AGCUbB3ENr49ulgStjM6Yr1rTipsb1S4ZvSO/41Ax+FF0vafGyYTNLSYql5/5wl9/2qFMt0HzFlmOFiMtXQRrOkTsrtH9hKcUd9xnXTUFIpl0yk31Vpl9S8i232JPte4VVDhBl2tFcqXjf9xqg2A03dQsUP2OFkaN3Xxj0ISKC4oSbkSytn6PF2zGfWxWRajj6ybpyZILYDQypFgwNPrwg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(2616005)(26005)(6512007)(186003)(2906002)(6506007)(83380400001)(71200400001)(5660300002)(6486002)(508600001)(91956017)(33656002)(8936002)(64756008)(76116006)(84970400001)(66446008)(66946007)(66476007)(66556008)(86362001)(8676002)(4326008)(316002)(38100700002)(38070700005)(36756003)(122000001)(110136005)(54906003)(82960400001)(99936003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V0dQRkEwUklrYWJLUTFoUU9pY3BJbzJJbExpclhOZjNHVkExRTAyOVNDNXJ4?=
 =?utf-8?B?aHVEellSWmczZm82UWprTGVlZnJ2UnFMWVJwa1BQamZYeDJEa1l5WEJpbmU2?=
 =?utf-8?B?bnRnOVpZaFVrVjVOUHlyQW9XeGlYTThYSnNwYm9iV3dLNncwemU4V1NKSVlw?=
 =?utf-8?B?VXlNRCtzUm5SWXFBeCs4cUtBNmhTZ21BN0pHN1dYWnNKdE5DMWVPeEVHaHBH?=
 =?utf-8?B?SzhGa0xEbXRpZkdYUDhscFdxdWJWcWlsbnp5eXpUb0xReTV0RGgybHQxYVNm?=
 =?utf-8?B?N0VQWXZOUWFsVzltZEUxTDZZb3NXZ2lpcVFvQ1E5QzlpOGx4U1pPQ205c2pw?=
 =?utf-8?B?TWZITHJEdTB2MDBlaGxZTENZeGkvWXlKbzIya3VoTXNJejRmaURXR3RYdkNU?=
 =?utf-8?B?bmkyRnRkSDZtTWhDemVRTGJXUDRPMlUxWUFjZVVHWDhuZzMwR2MzYkpjNHk4?=
 =?utf-8?B?Y3k2UVhVN0wzMFdPdG9GZEc2b3hDeFdCd25hZStUYVRkY1hkUGF0cXRhdDh1?=
 =?utf-8?B?OU9mUEF0bW0zUitqc3BiQmhpZTI0dXhhbS9SWUI2Nnh6QlhWUVk2THAzNGRr?=
 =?utf-8?B?UkwrbTVaK2NIMmJDTUlFbUJCd3ExUHlkZ2k3RHFub1hBKzJCQngvWXZsRWdj?=
 =?utf-8?B?N2MxdWdNczVNZzloNE5FV3I3TGFBelh0aGx3d050SDk1SGxSeEFjbFBydkE4?=
 =?utf-8?B?MXZkZ2hPVzc5Y3pvWU4wd1p4NFJDWTZ0WGVEcGxIQ2paTmFrZUsxcXoyWE1H?=
 =?utf-8?B?Ynp3UCtOcnJHWVNxR2dGclVCUVJOd2ZMQnloem9qT1IvRkp2U0llVW9lNWRL?=
 =?utf-8?B?Mlo1QUFXR3NLY1ltWUdyTElHQ0wydFF5RzJueHY4SWpORUdDRjJnbWppY1p6?=
 =?utf-8?B?ZlhXN3pLOFdkSTYxZHo0d0tjNDV1N0VuV3RlU3ptTU1uTDdWR0hMUlY0WXR1?=
 =?utf-8?B?SHE2ZExYekhJQm5EdWF0R0tvS3dxZ0JCYkJwbFByOE1LOHZXQnV5STg3NER5?=
 =?utf-8?B?cWtqdUNrM01JMks3bjVxUGErTkcrajVkM3NEVHl3OFZBMURyQ0IxVXNHbEUy?=
 =?utf-8?B?alV4cHRkTXNyeWo5ZHNHRzZGZkR5c0RmM05rdEg5SG5FQzV4OFFheWdhSy9X?=
 =?utf-8?B?b3BkUyt6Z3c4cXlCeDJ6MUwyTk9tQ0VXL3h4QlpuZU5paElHV09xZ0g4eHJY?=
 =?utf-8?B?YzlYNGZaN0RocWJRSjhtS3NoWE9VK2pDMWptUWV1TTlrellFNy9ZNzVleW5F?=
 =?utf-8?B?cTZYcmRHT1JYem9QY0lVMjZjT3AxQlBPOUw1ZklrNGVPVVpDYk1lOWhNckQx?=
 =?utf-8?B?alAvVDBPT3hYV1J3WUNSQlJPWVlTT3NlTzQ2QjRrN3IxSTVJVWthRTQ0VDl0?=
 =?utf-8?B?QWpEY2gzb0M5dUhteTltcTJrZ1FneHQ4MkNmakpudUFlVEVPVG1jTlF5bTZM?=
 =?utf-8?B?c3hBMU45SlN2UUhFUlhxcllLdkJONXVYbEh0YzJvYTZNaVdTaUdDczUwTnBR?=
 =?utf-8?B?d0VoOThXSzV2YWlESW11c1owaStHcnV5eVkzajltaHEwbWt0QUk1L01KcWZG?=
 =?utf-8?B?dk1SQjdHWHdqb29VOGRaWllyNko2Qk5yUWN5RmpXb2V0UnQ3LzdpeVozOFE3?=
 =?utf-8?B?RE9PVDR3c08reUZkc3R3K0M4OGYzanQvL2dPWHBzZ0JWSnJFK2F6amtBZTBX?=
 =?utf-8?B?WjBPblppVXZpNHZlTTlrbGVGcXgwaXBKeXI2eVFtTUJrMmx6QlFaQWg4Ukk5?=
 =?utf-8?B?ekVIYWhnaVJ1VjIyQ2Q0Y1RmaDVLaG9rQW9YNHp6VHVyWXhVWWFwc01SSjZh?=
 =?utf-8?B?QVA4cHpRMkZmMUk5dkxjRU1HWkdVL3pBOXJVRXc5V00xZXpGSXNmMkFBcVlt?=
 =?utf-8?B?OUZvR0dHL0lENE12VnNTZnFqS3J2Rm9za25YcURPeWcwd2xaNE9ZV3FvSGhV?=
 =?utf-8?B?YzE5ZDlXUkh3M003NVByTXpsdm04WElxOE4rZ0J4eVhZbnBPUC9CSWM0ek9D?=
 =?utf-8?B?SW81L1JDeVdndjZCWm9jYUduUmhhcGNnRlpNSnRJYklQSWdmZk9tYzMvRzRn?=
 =?utf-8?B?TUt4UmxOZFBhWFZTNFJMbnlkNWN2ZldSeVpaVzlIbmVnTGNjbGVOSDZ5a3pp?=
 =?utf-8?B?ZThPb2NGMlFRMXBKVExGZk0zNDJVZlhHMzd2MHlFNVFXeXR2b2pnSmhDZEMv?=
 =?utf-8?B?V0tCT1hXbjRjMmZGVWM4M1RFamNWQVUwS3loU2VCK3hRcGxJdVIrZFJyUC9l?=
 =?utf-8?B?WmtvUXozNnN6cFZJcHIvb1hFSFkrc2tvTStjSkl2NVV2UU1oc2FCdXRLTDlp?=
 =?utf-8?B?VHFBekNCY21rczk5V1dmZlBXWXM4T3BoWE4rQk91M1Bla0x5MERuZTNrc1Jn?=
 =?utf-8?Q?PN1tWsmaLZw57oicY48Ik7WKMvGlZcvpOPB7H?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C16ADF53-A71B-4FC0-A324-0E1A88C143BE";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abaee09-931a-45d6-249e-08da34ed933b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 14:33:40.8054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fn7il093ChM+sUz/Me2qzNveBSSQIXIGxCCIdCffTK8DUTsszjVFQKOMj+BLsnl4argdnCvBUDij2ECn005Bzy+kyZipJXrlWOc5tz1Wtz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6524

--Apple-Mail=_C16ADF53-A71B-4FC0-A324-0E1A88C143BE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Starting a new thread to make it clear that we=E2=80=99re discussing a =
wider policy here.

This question is aimed at Jan and Andy in particular, as I think =
they=E2=80=99ve probably done the most of this; so I=E2=80=99m looking =
to them to find out what our =E2=80=9Cstandard practice=E2=80=9D is.

There have recently been some patches that Bertrand has submitted which =
pull in code from Linux ("[PATCH 1/3] xen/arm: Sync sysregs and cpuinfo =
with Linux 5.18-rc3=E2=80=9D), which has caused a discussion between =
him, Julien, and Stefano about the proper way to do such patches.

The =E2=80=9COrigin:=E2=80=9D tag section of =
xen.git/docs/process/sending-patches.pandoc suggests that there are some =
standards, but doesn=E2=80=99t spell them out.

The questions seem to be:

1) When doing this kind of update, is it permissible to send a single =
patch which =E2=80=9Cbatches=E2=80=9D several upstream commits together, =
or should each patch be backported individually?

2) If =E2=80=9Cbatches=E2=80=9D are permissible, when?  When would =
individual patches be preferred?

3) For =E2=80=9Cbatch updates=E2=80=9D, what tags are necessary?  Do we =
need to note the changesets of all the commits, and if so, do we need =
multiple =E2=80=9COrigin=E2=80=9D tags?  Do we need to include anything =
from the original commits =E2=80=94 commit messages?  Signed-off-by=E2=80=99=
s?

And a related question:

4) When importing an entire file from an upstream like Linux, what tags =
do we need?

My recollection is that we often to a =E2=80=9Caccumulated patch=E2=80=9D =
to update, say, the Kconfig tooling; so it seems like the answer to this =
is sometimes =E2=80=9Cyes=E2=80=9D.

It seems to me that in a case where you=E2=80=99re importing a handful =
of patches =E2=80=94 say 5-10 =E2=80=94 that importing them one-by-one =
might be preferred; but in this case, since the submission was already =
made as a batch, I=E2=80=99d accept having it as a batch.

I think if I were writing this patch, I=E2=80=99d make a separate =
=E2=80=9COrigin=E2=80=9D tag for each commit.

I wouldn=E2=80=99t include the upstream commit messages or S-o-b=E2=80=99s=
; I would write my own commit message summarizing why I=E2=80=99m =
importing the commits, then have the =E2=80=98origin=E2=80=99 tags, then =
my own S-o-b to indicate that I am attesting that it comes from an =
open-source project (and for whatever copyright can be asserted on the =
commit message and the patch as a collection).

And for #4, I would do something similar: I would write my own commit =
message describing what the file is for and why we=E2=80=99re importing =
it; have the Origin tag point to the commit at the point I took the =
file; and my own S-o-b.

Andy and Jan, what do you guys normally do?

Thanks,
 -George

--Apple-Mail=_C16ADF53-A71B-4FC0-A324-0E1A88C143BE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJ+bDcACgkQshXHp8eE
G+3nqwgAgMS7tPezKnY3//XGoMPhvh5Ejk50r7AxbveMwyAHhWmhnaGkslRhvXhl
HqUeXUVkkacsN5wjyDBWDyboVTa4xslQlm2uzkgdDKYYCRXK7ZcDBsvR4tBX13F7
FiElHpi7a0EaiKMKIRDC7dlADa64lfedUwovNr5mxDIVe5i9Q0/JEima+KMwTpWE
9zefsjV3vZOl+Sx9aRQQm2a3uDUGcfFxLxf7lcNBeuVZ77xJ/+SWjZfquZrdbpuI
15A2E60L09h3VsypA7h5445no1NvwEKkdJ9LjQjE4BcDQA26mlWKsjM6nJtp9/ZR
xDwQ4T0ntCVWLog8iGCI4ZIH6M1Umg==
=PvfJ
-----END PGP SIGNATURE-----

--Apple-Mail=_C16ADF53-A71B-4FC0-A324-0E1A88C143BE--

