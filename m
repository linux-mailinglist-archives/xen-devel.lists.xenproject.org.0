Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F05251AE
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 17:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327852.550736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npB9T-0001fk-IR; Thu, 12 May 2022 15:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327852.550736; Thu, 12 May 2022 15:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npB9T-0001cV-F9; Thu, 12 May 2022 15:54:55 +0000
Received: by outflank-mailman (input) for mailman id 327852;
 Thu, 12 May 2022 15:54:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oUmD=VU=citrix.com=prvs=124635f48=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1npB9S-0001cK-6f
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 15:54:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db8ebf7b-d20b-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 17:54:52 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 May 2022 11:54:25 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by MN2PR03MB4781.namprd03.prod.outlook.com (2603:10b6:208:ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 15:54:23 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082%6]) with mapi id 15.20.5250.013; Thu, 12 May 2022
 15:54:23 +0000
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
X-Inumbo-ID: db8ebf7b-d20b-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652370892;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=M6DFv98rSUDslMM/jbjOuQqpHVNLgUf7Keu1HTAwI2o=;
  b=K0tkLPFZ61uMW/F+5fti87yWi6pdzMZchuIi1CyAQhY3W7U+39SAyEsN
   qt9/YGFWjwyL/npHFTUHGu5LqF65zodwUNVkd0LTxpQpFmMjfwyecVKYO
   eP8AUCesMwn3mxbtOV1srpBpT6Mp2evO6jo56rfBIeKLroKV9UKokQ5Ng
   s=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 71173517
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jWdECaMf1SVZBODvrR1mlsFynXyQoLVcMsEvi/8bNLWB5Y4Qp3Zem
 TxOHSzEb+HbITHFz+oGOdyw9EoHvpLSzNNhTgVoqC42QnkXo5rJWI7DIh6pYXrPdMeeQU4+t
 shBY4edcpBlQHOMq071buTq93Qmiq/WS9IQZAK81gVZHGeIHw992UILd5cFv7NVbfiF7yKl6
 I7585OONgD7gWMoOG4fsKzS8Egytq2r5GtJtQM3O/0a4FOGm3crV59OfqvZw1kU42V38kxWY
 86ZkdlVK0uAp09F5uuNy+q9KgtQKlLrFVDmZkB+AsBOuTAf4H1rukoHHKBEMx0P1mzTx4oZJ
 Ohl7vRcdy94ZsUgp8xFO/VoO3kW0XpuoeKvzdCX6KR//mWeG5fe66wG4HIeZOX0zt1fE2BWn
 cH0HRhWBvy1a0Ba95rgIgVkrpxLwMAGp+rzsFk4pd3SJa5OrZwu38wmTDKXtds9rpkmIBrQW
 yYWQTlFXSTKaT9kBkYsFbwTpOOogVv+ahQN/Tp5pYJvi4TS5CpY9eG1dfbwJJmNT8gTmVuEr
 GXb+Wi/GgsdKNGU1TuC9DSrm/PLmiT4HokVEdVU9NYz2AHVmjNVVU1QDAPnyRW6ohfWt9Z3B
 EET4CUj64Qv8kiiVvH2XgGioW7CtRkZMzZVO7JjsV7Wl/OLi+qfLkkdUTNTZYUUjdIdHC5zz
 kWRmdPEOgU65dV5TlrYrN94twiaKSUTaGMPeyIAZQ8E+MX45pE+iArVSdRuG7Lzicf6cQwc2
 BiPpSk6wrkW08gC0vzj+Uid2mrw4J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1TdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:SegidKxDtNrZVcVmf8sNKrPxmeskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBZpTnyAtj6fZq8z+8+3WB1B9uftWbdyQ+Vxe1ZjLcKhgeQYhEWldQtmJ
 uIEZIOb+EYZGIS5amV3OD7KadH/DDtytHKuQ6q9QYJcegcUdAD0+4WMGamO3wzYDMDKYsyFZ
 Ka6MYCjSGnY24rYsOyAWRAd/TfpvXQ/aiWLiIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH53KO+qPu2oyWsmVM7rq4m2ecJ+OEzR/BkufJlaAkETTzYIbiJbofy/AzdZtvfrGrC3u
 O85CvIdP4DkU85NlvF3CcFnTOQnArGokWStmOwkD/tp9f0Syk9DNcEjYVFcgHB405lp91k1r
 lXtljp/qa+nXv77VjADvXzJmZXf3CP0AwfeC8o/g9ieJpbbKUUoZ0U/UtTHptFFCXm6Jo/GO
 0rCM3H/v5ZfV6Tcnic5wBUsZeRd2V2Gg3DTlkJu8ST3TQTlHdlz1EAzMhamnsb7poyR5RN+u
 yBOKV1k7NFSNMQcMtGda88aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy+7kx7PHCQu198HLzou
 W1bLp1jx9CR6u1M7zx4HRiyGG8fEytGTLw18pZ+591/rXhWbuDC1zwdGwT
X-IronPort-AV: E=Sophos;i="5.91,220,1647316800"; 
   d="asc'?scan'208";a="71173517"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWCd5xUNUxU3N0Nm9NGGUSESX7/NKTr7AnujnaAm6GH4IDjDoJhBtwDmWm+sAvQFqnqSZZZ44ZGYgh2BWKdUDeCz2pbWC8Kn/2QWWHHbd8el2HU+dUq7Aabfo+CFTo2kc+3LrEnY7FNmlofn88HEjpVKz84vjHxNJhCVGvqCSeFl3xfhGDlld3CRDbbeB1HazCyGc2gzkdoq+VuBqHwOILuLzauN9ajKASy5K0OBq/OPLXBROjCHIokU29I/kNcWBdfc/0533TGbSb1nAi6YbjWVMJKjeKRuGJ6NHPQEfJgEBzBQhU23IVEr+1DKgk+kSjW5pFkHslSJwrrcP/fX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypHvH+wwF3GZMLF8U3YypIb5nOEeFBb8deuTjYQHWuo=;
 b=BhvUMny4i5VgnOtdMUcNyTwkiiSD+1QdBasYnSKWzOBWfkqyC7vBD7FBHB2Vq4CVMREJyhvY1w70nMzOAaRjLYhmwdY3Ccb/uGW61RR5P8ISxNXkjJAxACEdzp47eeoTXdFG8RbMfEDp/3WnWGu0ikI/YpokQUafe3D4zER0BABQZCTyyXlLsMGL2/46gRH6Sjjsdc28T8erGmNfoCUgZ09XHAt8Mf8MlqCEtTqCaGQwgMQ4swBgNFhpTTEP+3yeLPDRUDHGdJJCXSW1+vk2M26fmgl/HEnIkrSQEMCg4iutVn2drUlru9njbr2E2wo0zw2T/plkQgNoikjFcZWmJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypHvH+wwF3GZMLF8U3YypIb5nOEeFBb8deuTjYQHWuo=;
 b=xjcB4TqMr4+/eLf4kNO6IJe5X0zU+wd7l55NT6qgxmPBCYOwFFpCsQiVnQ598nAiDKdwkZ9VeTheTEg1UITi9WUdQoUoo/Clq2lkHzN2iPPWw9mccXgu3ROKtwhSj/VPkRBiXf8jd3ABhJzBtTYwUrNHEW7ScrZWTp5at3aVPas=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: PROPOSAL: Delete www-archive.xenproject.org
Thread-Topic: PROPOSAL: Delete www-archive.xenproject.org
Thread-Index: AQHYUBdKGkaQLBb2wkOW+P2/BX0raa0bkOkA
Date: Thu, 12 May 2022 15:54:23 +0000
Message-ID: <8DD705C9-2878-4F22-BEEC-82619857C702@citrix.com>
References: <C3E2E17D-BFC1-48FB-837B-7FB621A3A3F7@citrix.com>
In-Reply-To: <C3E2E17D-BFC1-48FB-837B-7FB621A3A3F7@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cce1187a-c83c-4adc-9bb7-08da342faf24
x-ms-traffictypediagnostic: MN2PR03MB4781:EE_
x-microsoft-antispam-prvs:
 <MN2PR03MB4781B6AE121D03A2DC86359399CB9@MN2PR03MB4781.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ghGg5iMciN1lT0Dd1mMmSSvw8Q8nMaoOfXtdTa5L3LF7eoHhWjFsNukXmHlyQCOA8MvmRhs5xYkToeYtNGi4sRXDpyT0AK5VgQ0DTx8uKzrB3w5HZgbZ3GhxJ2OSepC8ZBiBFZ3Yi1xXFAX/opLc2geYIj3qLZ0Lu8Ekdrr6Wl7X4fZkTyh9gYGLw8J+78xcYXQfNE2ggO3DSFNtRa0G6FYC25SG5v8lUIW8guX+S7Hc0clW6YwkAvEWLuxgLz/XbjDkvCbmJT3CHh30ZexoE5FKifyZ1xxFwTm6RBB2BnXWspxvcJZZAawMHvIYT3xbJD7vHnXtK+FWSDC7La09SlJdGY8ml9cirgGhsCpLg89Cd7yGfNAq0CO0GM3aNb7bbqtjbZ7s1v9yNfjJk+q/5o8X/RqweLFmcod+LH4N1qZ5NSP4if6jhL9JRi5tunrTsdxL8boq/WGrMVtpDlNA0vZYC3jvSfaxUt8XtrdiVnGj9a3V/y+BczH3147yU7lSf2ugGUCadc9A8V2NK03i9RMKxVvokHsREol0lpexzERsx+26otzweYM8fiOtgid5oaHqC5iSh2jGm+tylxiyYunwZhgDslzxTaXxtFxtV5mWXzw0UhwCsy8kv0UOw0dQizUKn5GN1VZmAItu+6xtX3eO0EaSy9oHB0slqIQtcW4hwP5CszHYqLtuzA0cYHFNYF939sgr7dP5qxTUzt2sNc0jq3zZmMFYF5eSwl3cmAUOUymKsYpAwXQfIkmE0c7d6kiechYkXVlQaWItja2EFA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(83380400001)(186003)(36756003)(5660300002)(86362001)(66574015)(316002)(38070700005)(38100700002)(71200400001)(66946007)(2616005)(66556008)(66476007)(76116006)(82960400001)(8676002)(64756008)(91956017)(122000001)(66446008)(33656002)(99936003)(26005)(4744005)(2906002)(6512007)(53546011)(6506007)(6486002)(8936002)(508600001)(200143007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akJ3UjZqSloybExJUUR2d2dObk9Nb0FybjQ2dXBuNmFPOUlYRXRjWXFoYUlC?=
 =?utf-8?B?TU9CL2tkbmdBVnpITFZDREJORktKQ1lsZXFmc05lR29rNmNLRi9GTWRVQzg0?=
 =?utf-8?B?T2s0OUI5eUhqbHNpRzdlZHFMbHQzaXBSOGdreHdSdnFubzFEUFIrUENPUTE2?=
 =?utf-8?B?Y3BzdSt0MXlRcFB1RVVzeVdMT1h6SDl5Z1c1Mlh5OXpIWEpnY29jcHB6bVhU?=
 =?utf-8?B?T2NoMTFTeXNoMUljV0V1cEN6aFRDa2lRVEhPS2ZOa1V5c24xWnZrb2NrR0E1?=
 =?utf-8?B?SC84d0NwRmtlaFczZEdXbzNEZEdVN01uV0tlKzNlRTNPUms5K3NrZUNoWk95?=
 =?utf-8?B?S3MyWDNZQjR3QkZpbU1VS0RoVjNneUZsV1loM0FxZXQvYVJIWnF2L0d5dlky?=
 =?utf-8?B?YmsvU2M1SnN5Y0plRDJlQTgrTkIzdXlVWmQ4QjE0eTJGbXNZOTFWWU1FeDhr?=
 =?utf-8?B?S1Yyc0FmMlBGU0hrd01reHVWUEc2SGl4cWpBSytMVVFLdk9OYXZYTWVFbG1l?=
 =?utf-8?B?Ykt5UktRU1AxeGdVcW13RitoRkgrQXpPNHFIWm9iNkk1QzFUd2RjYlhNTTZF?=
 =?utf-8?B?amtVS0lCMDY5TTVvTzQwZWVDa1o1RFZOSHhpZUlkVkUzeVpzUDJ5dkR0aVN4?=
 =?utf-8?B?ZlR3Mm9VUTFiYUtOK3NiWmM5QjlFbUYxcXVxdlR0ZmwvdHJ5cStaWTRTa3FC?=
 =?utf-8?B?Q21YaDUvV0szM3NoNDViKzIvTnhUOXM1NGJHOHpCaFJ6Vk1DYlBxc3J5azdq?=
 =?utf-8?B?d1pHeXBiQ0JkVlRzODVDU1V5eTU4OXJKZGxITlZ0SXNESEM4c3NhQ3piZ2hY?=
 =?utf-8?B?M2JERGx1NlNRcGJxSHZXM1ZXMlM1ak04c2dyWE10UXBKc0I5M0JJWEpjbUk0?=
 =?utf-8?B?ZGRsSldGMkpmMzFlT2svdlkxNkhZblorQkRra2FsblpVWEhUQjE2VUk3eUI0?=
 =?utf-8?B?NE9UOU5naC9BWm1rcW44QWs0V05aME56WXhaWDRyZlNEbVdOWnlrQ1ozYkJm?=
 =?utf-8?B?TU5CMHFOQ2pOaldIZ1dVczhnZjJPQ3Nieit2Ny9ZMjRzZ0FxdXRlbXV2anlv?=
 =?utf-8?B?c0Mybi9MbjdJZDZpOVJGRWZ0UnV1NnFNU21iREZhcUVDeHFYL2ZRQVRxYTA2?=
 =?utf-8?B?a0x0QnIrVlpmWFUzaUVkL2dZUmhpSEM0c0JaQktnVHZ3RFJwd0VhSGwxWEZJ?=
 =?utf-8?B?L2JJUUlGVXFtdk9qN1A5cDY5ZUxESHFuNmgyNWlVSWdaL2d1QjVXVE9nTXhW?=
 =?utf-8?B?d3NBSlF6c3dhZnR1NHptNDdjRGVCOGFUNFZCR29rSnVNSXJxbTYzSER6dG5V?=
 =?utf-8?B?NWFvTTJPN0x0bXZrVjAza08xc0FHaW5WN3g0NUFsd05uOVFjK1kwNTlHMWhF?=
 =?utf-8?B?Z2VBZlhYUU54RmkwVTVHM28vS28wU1MzU0hQdjczS3Nick9kUHFobUtXRWpP?=
 =?utf-8?B?Q1hQY0lBQXZhNGV2clNCanB4eUFkaXA4cmdDWDdjb3lQWnhkYVprZEwrVDJj?=
 =?utf-8?B?QzQ0MEpFdVJGSHJCWlpQSDQ0N3JoRFcyQVk0MlI3QTZKSnhXMGRPYW00VS9x?=
 =?utf-8?B?eGN4QUFHZEZOYjBHNlpPM01jbjNQelJPV1Bya0hoUTdhdHo0SGNhWGtEZXhL?=
 =?utf-8?B?eXhUN2FKTzVtSUNCUC9VVVFTOFBhY0ViVnZzdG9xaWUzWWl5dEhjQ2RGWWdW?=
 =?utf-8?B?M2t0WHJiNk1GZHRkNnVadkw2ei9aUjdOdStCWmwrRDg3bnFQcVdQMWd1TVU5?=
 =?utf-8?B?QzZQY3U2ditBYTNsbUVCQ20zRFNxQ3FEZUpzYUlxUUUzUmtpVlRsUjRsUjFS?=
 =?utf-8?B?VnZjWUdIckE5Q2pXM09UcTAxNzFGVGZNTGxadnNPMTZiMVhnSDlXM0dtRWV5?=
 =?utf-8?B?K3hRYmhwMEQvL2l1U0dxVEtudlAwS0ZLdmNSQ0Y2eit5L3hwSHc0VE94M1Bj?=
 =?utf-8?B?NWlWOXkrc09hY1FlZ3dzQjJKaWJkMDZIekJRRjYzTk13TVF3MlR3cy9udWpY?=
 =?utf-8?B?REVlQ2NZVm9RYVFjZ3ZvTUdZRmlKWTNJdjlDQlRURVRIbC9xNWJwUHA0dnhW?=
 =?utf-8?B?Wk1ERjJWdmJ4Y29XOVNFN1pqaFdhRkVBVmxnTjJFMGNERDFBZXkwQms2RTNt?=
 =?utf-8?B?ZmF1VzZFaTBwaWNRNEhwbDBHWDRrdTB2Y1R2Uk5UODVXWW14V3kxQlY2SzhN?=
 =?utf-8?B?R2lIVnhNcE9talJ0Uy9xUUdTeGRLTVJrZ05GZmRjUjhPbk9QMmNnbjI5WmY1?=
 =?utf-8?B?a1M0OEF3ZU5MSkQwdmlIdDd6d2VFbWE5RWU5U0RlRlJCL0hybmtrcXdhQm8y?=
 =?utf-8?B?aUpmWVNJeUxaZGNtcVQ2M2ZDYnl3NkwrM2pHV1JBNFhMQkcrVnVXQlVFdXZL?=
 =?utf-8?Q?vpoISsxwzUgHmn80=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5659520F-1B28-41C3-9CC1-40EAEA2A6ED5";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce1187a-c83c-4adc-9bb7-08da342faf24
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 15:54:23.2397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T+H/+xNAj/yAVt23nWTWFaE8dWNb8vWFuE7y2gKhvmJGJvwZ0hYjrQXu0JcFO6SQURTGkvtCPIyjOFYSZfYDWDxUaNvm7Z8/EOjnSKHvp14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4781

--Apple-Mail=_5659520F-1B28-41C3-9CC1-40EAEA2A6ED5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Apr 14, 2022, at 4:49 PM, George Dunlap <george.dunlap@citrix.com> =
wrote:
>=20
> I=E2=80=99m pretty sure www-archive.xenproject.org is at least N-2 for =
websites; last updated nearly 9 years ago.  As far as I can tell =
there=E2=80=99s nothing terribly interesting stored on the site itself.  =
I=E2=80=99m going to pursue deleting it within 4 weeks unless someone =
objects.

I have instructed Credativ to take the site down, but keep it in a =
tarball should we ever need to recover anything from it.

Thanks,
 -George

--Apple-Mail=_5659520F-1B28-41C3-9CC1-40EAEA2A6ED5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJ9La4ACgkQshXHp8eE
G+1odwgAuhQbZ4VYkcIjLMYKg/6cqiDQd4On+GvZgRR/CwmI9g5N9g2inHlDSPlE
DTrc+Y8KFSwpn5+8uKgc2XYWgIe8AA5/vkadtj6hxLqxd3dxY+qqgM710XBynuCj
N+KOzVyys7pRtoJRaI4H/SOFYojEZ9nQl0ShFFr50nIEUg/vz/qiRlySLr7eNomm
b9ayVzqV0RXBwHs7KIiuEeN6LNGiFdGlOC6DPO7ZTAPIPoDUoQvwgXTV9LbxT8c6
7Qj89eQYz9aRdrL36ShMlk7jzRVLPlTS9g8pAdgNRX3VKvElTZikKenNLKVyuoI7
cot+/wvjdh96ncKelbhm3mm0McBRig==
=XaYR
-----END PGP SIGNATURE-----

--Apple-Mail=_5659520F-1B28-41C3-9CC1-40EAEA2A6ED5--

