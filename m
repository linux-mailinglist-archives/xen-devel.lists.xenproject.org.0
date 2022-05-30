Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EF45378E7
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 12:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338477.563254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvcX9-0005f1-4O; Mon, 30 May 2022 10:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338477.563254; Mon, 30 May 2022 10:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvcX9-0005dF-1V; Mon, 30 May 2022 10:21:59 +0000
Received: by outflank-mailman (input) for mailman id 338477;
 Mon, 30 May 2022 10:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/g88=WG=citrix.com=prvs=142343f38=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nvcX7-0005d9-7y
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 10:21:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 535ff97b-e002-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 12:21:55 +0200 (CEST)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 06:21:49 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BN7PR03MB3713.namprd03.prod.outlook.com (2603:10b6:406:cb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 10:21:47 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082%5]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 10:21:47 +0000
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
X-Inumbo-ID: 535ff97b-e002-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653906115;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=hxNWiKgoM9uZt2M11yH5/jTUWWtDPCugBCciGv6qVUc=;
  b=Jn5lbQLjeAcYS0crRwOQdEkenMEBbLKSNWEfby1Pwhlrz4WSL3ccHQzx
   rdXfXzb2KXtvODwOcMa+BtrpAEmP/dy3i2nqeeKqrOJsXBVg+GEqWay6P
   +0/4tZ/Ym1fz3YXUBqsod7h2wwgIVe+w0V9b5Z9A51j1dICVSSLQ41i7w
   4=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 72294393
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Z9fVlqN6cImmnOTvrR0alsFynXyQoLVcMsEvi/8bNLWB5Y4Qp3Zem
 TxOHSzEb+HbITHFz+oGOoXi/EkAsZeHm4NlTABqqX09RSJGpMSYWIvJdh7+NnnNf8PPEhNut
 51FYYWfcJA+RCeC+hrxOba49XMhj/jZTdIQZAK81gVZHGeIHw992UILd5cFv7NVbfiF7yKl6
 N2i88bWYgao1jB9b2lEu/yO8EIx4K/5tWIW4wdia6ga4FOGm3crV59OfqvZw1kU42V38kxWY
 86ZkdlVK0uAp09F5uuNy+q9KgtQKlLrFVDmZkB+AsBOuTAf4H1rukoHHKBEMx0P1m7Rx4kZJ
 Ohl7vRcdy94ZsUgp8xFO/VoO3kW0XpuoeKvzdCX6KR//mWeG5fe66wG4HIeZOX0zt1fE2BWn
 cH0HRhWBvy1a0Ba95rgIgVkrpxLwMAGp+rzsFk4pd3SJa5OrZwu38wmTDKXtds9rpkmIBrQW
 yYWQT5hSRDLZUFwBnwwB5AVrOS6mXTtcRQN/Tp5pYJvi4TS5CpY9eG1dfbwJJmNT8gTmVuEr
 GXb+Wi/GgsdKNGU1TuC9DSrm/PLmiT4HokVEdVU9NYz2AHVmjNVVU1QDAPmyRW6ohfWt9Z3B
 EET4CUj64Qv8kiiVvH2XgGioW7CtRkZMzZVO7JgslDRkfuPi+qfLk1UcGFEdvM4jcYJdC0D1
 3qNjdjgFwU65dV5TlrYrN94twiaOyIYMGsDbi8sVhYe7p/op4RbphDSStduFoalg9uzHiv/q
 xigoTIinbwVgYgu3r+i4FHcqzu2o97CSQtdzhXaWCep4x10YKahZpe08h7L4PBYNoGbQ1Kd+
 n8elKC29/wDA5iLk2qWXOwHEbWt5vCEGC3dhV9pD98q8DHF02W4YYla7TV6JUFoGsUJYznkZ
 AnUoww52XNIFH6jbKsyb4fvDc0vlPDkDY68Dq2SacdSaJ9scgPB5DtpeUObw2Hqlg4rjL07P
 pCYN82rCB72FJha8dZ/fM9FuZdD+8z07Tq7qUzTp/h/7YejWQ==
IronPort-HdrOrdr: A9a23:MelBEaE1CrxveYEWpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.91,262,1647316800"; 
   d="asc'?scan'208,217";a="72294393"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIpzxkJ326gm0MeMRiFSrYDlphLpgYJQ1dX7iN2xpi4w/hWjvkHvIxRpGFI2xuI2f/GJr3lqnS8NyyP9EuDe9CHsN4LrxDJIWt2ws+OVPb9dC6ODnP3VoPKo4FGPFtetRtrTQXeYI1ZpS1f32hnqsgAod2CM63lXpI0XUxFqwmgM5W5jgd7c64vJ4UqsJHsQL19++uehdVEElbyUCs+7uMEUH6+YDMBV7CcsrNZAAG6W6l071Jp05mHehi4pDU8mvJfNmu+/nw0btLIq+CW1QxAmlY25fDefTppi9NEntqRM55qCgvFPHFfBoFLufITMFNb34nAGuNKbqp3zg/rk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5mV+7evD0CmbiOs8GugWlozumwiUqkJm56WZD5Qv4s=;
 b=DHPum1UdeSRef4NJtfrxITNzjqTnz9VKKw0q5rKrfMGNTxL8JDUw0Y3wT+ol+jXTqBNJR+2HLppHddzNpz7ImN6Rgn1c2p2eawEz8Wgjae8Bmyb36b4LkIMYeL1xaUjgima5+lIx86d999scPEqlNhKdS/w/aE+iaTcbQvgy0zmyUFO98KPBWk/eIhTBZYX2A8NoxsFC+d6pIVzo3bUr75LxWjRIb/LWMI9iW326QW1m364Hj5vBzOS5Yr18FOCTbxkVEYHPZ9X8b7iqE59AtmhJcs5lxTSZS03DLIUloFC9pxNavehtJGv7it7i8t2nrMw1nzUvvJ1TimSu6PNi3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5mV+7evD0CmbiOs8GugWlozumwiUqkJm56WZD5Qv4s=;
 b=NKboty/XmSnpjlD2eR0eVH5znSbWBgJNCXUWz2KNVGpJDjFxSY1h2zXOCpmO7UY2AufMUcawCqDic8WOAlFvq1G8WRQ8moc1ytZbJul6PluakPOYRCVPDLVlhBBwUAQK4TYKqG4xus0O/Qab7qHQEyABpLy0tGj7GgvhZXeIHyc=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Thread-Topic: [PATCH 1/2] docs/misra: introduce rules.rst
Thread-Index:
 AQHYb89PX1LGuEcm0kCKHXEgaA2yKq0vNXYAgAEjhQCAAJGbAIAAAxGAgAAFpgCAAC97AIAAc0MAgAC4OQCAARHVgIADyvaAgAABVgCAAALZAIAAAdqAgAACLACAAAPcAIAAB2IA
Date: Mon, 30 May 2022 10:21:47 +0000
Message-ID: <A7121189-9A68-41C6-A8EF-D823A0BBF4FF@citrix.com>
References:
 <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
 <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
 <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
 <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com>
 <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com>
 <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com>
 <765738F2-97E9-40EF-A50E-2912C7D2A286@arm.com>
 <alpine.DEB.2.22.394.2205261233000.1905099@ubuntu-linux-20-04-desktop>
 <c0b481fb-5172-3515-764f-dba9f906c049@suse.com>
 <alpine.DEB.2.22.394.2205271602320.1905099@ubuntu-linux-20-04-desktop>
 <3882cc86-72a7-8e19-5f7b-b1cc89cce02e@xen.org>
 <5b790260-dd5c-9f62-7151-7684a0dc18fa@suse.com>
 <0cc9c342-f355-5816-09e9-a996624c6a79@xen.org>
 <6d6115a9-2810-0c9b-bba3-968b3ac50110@suse.com>
 <d4c6aa78-cc94-274c-db05-c62ff0badc9d@xen.org>
 <dcafd462-f912-8c59-f1bf-32f65ae45fd4@suse.com>
In-Reply-To: <dcafd462-f912-8c59-f1bf-32f65ae45fd4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c37e4970-3b06-450f-b710-08da422633fe
x-ms-traffictypediagnostic: BN7PR03MB3713:EE_
x-microsoft-antispam-prvs:
 <BN7PR03MB3713B98BB1395900AA5E244999DD9@BN7PR03MB3713.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GcNbCMr0TOxyPxlFGGUw73baSqYUpxHXitBt43JWBoTUO0m4becYx8dQlr5CE0E3uqLdIVDR0QVGA9iJqDk/4BzBqp9K3ujqAo8E1tIZJwbvK3axsQR4Nfv/HcSYEkBU5WFImN3l5d0XKNj5VUTXLElhJ/5VzPP2Zr9hXK9GJtjcnynYOyAioERUDQEQVs9odwwtswTN5Y3cef11QNBd04MDF9zaQtqHOWtZFXT1Ne1x/wXlbJC6ZgD+EPV2k5r1p5gG81tq+z9uXRgUb190dGuWCWMFWi9DnQSfT2efUoLt0AG5uB4Jb/6U+qh1g2x5kHGUFpIChRs2XnCdKdexjVB4a9Q41V3XsEUHFoOIJSszcEJ3qmNIUIrR+Km1SrWUNb4rojyj/mGn08vgdh8GWz22E6BZVStzakgX0m6uLknEOCQ9gzfSPPpRFLLgx9TXGXMmB1jINHaEtNsrYO60qZZSWLODJwgAw4MHeUbvOpHU422eAsheoZrYM0jFMShJBsT6hWXs6CxKpO/nVw/P24uxMoe3NFdQnmKiJcxmZf1LkmeZ+xBqw3V6MPVkrToZ1qk2kFUEp3hZNzoE4eTMDQ0HnMpTGIvSXivC84kAkAW2avCRcV1HJAbqf7cmhcoQl/kyfwz/Bl/eDuoasWQzXR+Ul/UvFxDYkrvNHqjjbWIalxOVKJFUeEH3Hl2+D+h/qH6E/KKZadEf3mosjJ/jqidIWhu8CaXYeX5RDe9co2dbhHVerlQ3jBkFoV+kWlY9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(86362001)(53546011)(316002)(186003)(2906002)(99936003)(33656002)(122000001)(54906003)(6916009)(6486002)(26005)(6512007)(8676002)(66446008)(6506007)(5660300002)(82960400001)(83380400001)(64756008)(36756003)(66946007)(4326008)(91956017)(8936002)(2616005)(76116006)(71200400001)(66476007)(38100700002)(66556008)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2xGMTlLM21wSkFlZzhkZitob3ZCSkc1dnBsZ1ZYZlVFZWdYTmF4REY2YnV0?=
 =?utf-8?B?b1VVb1B3N0MzYUgvcTBqMm5rTmR2cWRpdksxQVJORm8wa2Q5L1loamhPQjJU?=
 =?utf-8?B?N2pXbXlHdklFK0VKaktITTJWVFIzT0JtQmNLQzdacDgxL1V5QVdIMWxzTWlY?=
 =?utf-8?B?RW93dkhQTnNZd2pBWDlTTUFFZUcyaGtnYVZaVmo2cTkvbGNqV2tHMy9vL0RO?=
 =?utf-8?B?SWQ2b21DKzVNWjBtT1JCa3d2R3RlUnBFbk10QVVUb0VoMGlLdklLNTNqTkF5?=
 =?utf-8?B?VVJEL2xZYTQ3ZzlCREp4RjVidDBWZW9pZytjN0s2Y1pMTTlubFJNZjIzcmcy?=
 =?utf-8?B?a29YOVZvUWtUREV4aTkxMHRVWFR5S21QQkFDZ2xwWUdqOE1BVkltaGZ0cDV3?=
 =?utf-8?B?LzU2WVB0bUhGc0RjOU1UdmxHMGRBeVFMV2FET1p3c2dZSmN1SEtwMWU1ZnJt?=
 =?utf-8?B?UkRDOGp0MkQrbU9PVUpTRGt3VjN1NjZ1L1dEaWxsNEdpZEJROU1zSW4wWUl6?=
 =?utf-8?B?a0JIck8zQlE5NUVTMjU1RVpyWkl0eXloTm9vNFVUcWhsQWplS1VFbm9tK0gz?=
 =?utf-8?B?QnFGd2wvVXhyL29DUnJ6UlVaSnJzeEUwSU9nRDVMa3U1bGY5aFZDRUhRTmtu?=
 =?utf-8?B?L0NXQmZKTG14RXNzaEptRUVQY3ozWU5sMVF4Ky9Hdk9iaCtGNEVmQ1I5WmJU?=
 =?utf-8?B?V1pNbEM5YkVZUEVWcnlwSkFOaGxGbGUrTTFzRS8zNlNod2p5aUp6ZTlTTUN3?=
 =?utf-8?B?Q055cm1MK1NsVzhzQW4va2IxVUt0b1h3emRBeUl3clNudUFFaUdqTzF3bFJl?=
 =?utf-8?B?T3FUd3ExWmJic29MVTBzMm52dzRJY0IyTHhKNGtQMW9FSE50MHJ0ZHlDcjBV?=
 =?utf-8?B?TmZKRFIyYTdJaFFXYlFJaStDVEhrc3BFTnhRZDRyVGlOSTdmYVdoa0pKdFBS?=
 =?utf-8?B?UHc1cXJGVlltUys3SkRmcGd0ZGh0bjhaa0FNODRKaUZWc2NYZFhLWVI5enVW?=
 =?utf-8?B?OTloRU9ydDdUNmxMUFF6c0FWNzRhOTF6S0JRd2lyR1ZDQk9FZFU1SEZwdUt5?=
 =?utf-8?B?UUsvcnEydmdiQTMzalZwcnR1UTdlTWJEanZPSVdWNnB3aHpOZXdKNEVSVzBQ?=
 =?utf-8?B?ZHVPZHdxTzFpeHNBVEt5dEhyQ1hRQVcxejEzWmJPMDdRSHh5ekVqUkY2SFZE?=
 =?utf-8?B?THZzK3lkcEN6NTB5RXlPbzlXanRvNXl0dFVKQld2NXlHSUdoQWVhTFlTdVIw?=
 =?utf-8?B?bmlPbGtnaDBPdGx0SUVKRGM1YzN2NUs4cWw2UGJEZWlLSlpjMlhiMmU3dG8w?=
 =?utf-8?B?NUpNaVhrUkhWb2liVHpOTGl1WU8ycWNxVFJMMmF2bzRFTWNTYUdXdlhBVHBm?=
 =?utf-8?B?Wm9kRWRVQy94TWNNZVdSa3MyNnp6YUliOGZzK3BWQ0lXOXdQZHNJYjVxd09l?=
 =?utf-8?B?aUdnTTRFaFVCcUlGWkNwalo2VFptMzl5TGtEbHV5R0o0SWY0VXFIU3FhRkdX?=
 =?utf-8?B?WkJBMzUwdStNNis5SlIwSlV5WEtndit5RUNrbmJKbjQ1bUVTN2JnZ3FPMW5l?=
 =?utf-8?B?dGl1Q2Q2d3FNV0VpVXVVMEFOMmxCZllWaEI4dnUzK0pQQmpsd29pMENwRVdx?=
 =?utf-8?B?eTZiK2t2ZHhuUnN6WDNyc1ZKL1FKbFE4RW9aU3ptSVF6b3FtZ2lmTGFQbjBF?=
 =?utf-8?B?b1luZzZXR21wNUM4cmo4UWtaYUdCS3d4M1d6Y0hzZEZFbEV6ekJ4M1NNUDRC?=
 =?utf-8?B?MnFHWSsxcnB5MmNZOWYrV0lxZFJtQ0x1eEdNOEMrSVpoamtER2JOS1pZc2xp?=
 =?utf-8?B?THk0bDdUMkNPc0Zxd3JGak54cUJsN1dsRTRxNjFVR1NOMHQ2M1VXbzlRZXVu?=
 =?utf-8?B?WFpIRktOTVVPOWRMN0JKZGR3bjZTbTluUG9HSUJ1U0ZFa1dTM3lWSXppN0VS?=
 =?utf-8?B?dHpFaGg1NzU3SGlieS84cENKQkF5cUQ2SldVTFJIcEt3T0pFSHVyWitHUWk3?=
 =?utf-8?B?VUJ6a1BnOHVTQU8xajFiSjRVWGlXMDllUGxQZlVRVi9mWTVYc05nclpmeHNU?=
 =?utf-8?B?cG1wbEhxZ1RNL01pRWQwTTBJNVhHYjFXWVFZek1kTDZMMm93UVh1ZkxaYVBY?=
 =?utf-8?B?c3l2dDN2cUJZbHhwSVE0c1R4Y2hTbUlPQWFaeUd5Nmx5UkJjZ0RZZFNzb0Qv?=
 =?utf-8?B?c1lHTW54dHk2Tms5dkVIVjlsaktZeXpCM3J2Y0RoWDcwMldGajZuTm9XaTVa?=
 =?utf-8?B?MnlaV3hMcXFKbFdoOHNJVDhyeEw0cnZxTFZLcmxTT0FFdHc4RHlXRnRpR1B0?=
 =?utf-8?B?NllPODFLdFhCUWs3OUVLK3QxUDFhMVAvZDZKeFFkTnpPRHp4K3lkTlRrM05X?=
 =?utf-8?Q?DhB1WLYWabi8CXXg=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FB269E6E-4FB3-4F9B-ACBD-53D20408D831";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c37e4970-3b06-450f-b710-08da422633fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 10:21:47.4711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TE3hwkDAAJ3K8ET04Qyf0tG8biNRbqUUSPwlmmn7uAEyjhCBh9rjBjFXhJIfLj7WJfx+OUwsD7CPp/uU+3rvgrgxC8+j3sgfUlC4qM0xPCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3713

--Apple-Mail=_FB269E6E-4FB3-4F9B-ACBD-53D20408D831
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_AD7493BB-1713-417D-BBD6-EC8A411028D9"


--Apple-Mail=_AD7493BB-1713-417D-BBD6-EC8A411028D9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 30 May 2022, at 10:55, Jan Beulich <jbeulich@suse.com =
<mailto:jbeulich@suse.com>> wrote:
>=20
> On 30.05.2022 11:41, Julien Grall wrote:
>>=20
>>=20
>> On 30/05/2022 10:33, Jan Beulich wrote:
>>> On 30.05.2022 11:27, Julien Grall wrote:
>>>> Hi,
>>>>=20
>>>> On 30/05/2022 10:16, Jan Beulich wrote:
>>>>> On 30.05.2022 11:12, Julien Grall wrote:
>>>>>> On 28/05/2022 00:16, Stefano Stabellini wrote:
>>>>>>> """
>>>>>>> It is possible that in specific circumstances it is best not to =
follow a
>>>>>>> rule because it is not possible or because the alternative leads =
to
>>>>>>> better code quality. Those cases are called "deviations". They =
are
>>>>>>> permissible as long as they are documented, either as an in-code =
comment
>>>>>>> or as part of the commit message. Other documentation mechanisms =
are
>>>>>>=20
>>>>>> I would drop the "as part of the commit message" because it is a =
lot
>>>>>> more difficult to associate the deviation with a rationale (the =
code may
>>>>>> have been moved and you would need to go through the history).
>>>>>=20
>>>>> But this was added in response to me pointing out that code =
comments
>>>>> aren't standardized yet as to their format. The alternative, as =
said
>>>>> before, would be to come up with a scheme first, before starting =
to
>>>>> mandate playing by certain of the rules (and hence requiring =
deviations
>>>>> to be documented).
>>>>=20
>>>> I don't think this is necessary short term. It is easy to rework a
>>>> comment after the fact. It is a lot more difficult to go through =
the
>>>> history and find the rationale.
>>>=20
>>> We all know what "short term" may mean - we may remain in this mode =
of
>>> operation for an extended period of time. It'll potentially be quite =
a
>>> bit of churn to subsequently adjust all such comments which would
>>> have accumulated, and - for not being standardized - can't easily be
>>> grep-ed for.
>>=20
>> Well... Scanner will likely point out the issues we deviate from. So =
you
>> we have an easy way to know where the comments need to be adjusted.
>>=20
>>> By documenting things in the commit message the state of
>>> the code base doesn't change, and we'll continue to rely on scanners
>>> to locate sets of candidates for adjustment or deviation commentary.
>>=20
>> The part I am missing how documenting the deviations in the commit
>> message help... Can you clarify it?
>=20
> I understood Stefano for this to merely be for the purpose of =
justifying
> the deviation (preempting review comments).

Right, so at a very minimum, if we say =E2=80=9CThis is a rule now=E2=80=9D=
, and a submitter wants a deviation from that rule, then the reviewer =
needs to know the justification for the deviation.  The commit message =
is the obvious place for that.

Obviously something *else* we might want is a more convenient way to =
keep that rationale for the future, when we start to officially document =
deviations.  Given that the scanner will point out all the places where =
deviations happen, I don=E2=80=99t think an unstructured comment with an =
informal summary of the justification would be a problem =E2=80=94 it =
seems like it would be a lot easier, when we start to officially =
document deviations, to transform comments in the existing codebase, =
than to search through the mailing lists and/or git commit history to =
find the rationale (or try to work out unaided what the intent was).  =
But I don=E2=80=99t have strong opinions on the matter.

 -George

--Apple-Mail=_AD7493BB-1713-417D-BBD6-EC8A411028D9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 30 May 2022, at 10:55, Jan Beulich &lt;<a =
href=3D"mailto:jbeulich@suse.com" class=3D"">jbeulich@suse.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On 30.05.2022 11:41, Julien Grall wrote:</span><br =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D""><br class=3D"">On 30/05/2022 10:33, Jan Beulich wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">On 30.05.2022 11:27, =
Julien Grall wrote:<br class=3D""><blockquote type=3D"cite" =
class=3D"">Hi,<br class=3D""><br class=3D"">On 30/05/2022 10:16, Jan =
Beulich wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">On =
30.05.2022 11:12, Julien Grall wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">On 28/05/2022 00:16, Stefano Stabellini =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">"""<br =
class=3D"">It is possible that in specific circumstances it is best not =
to follow a<br class=3D"">rule because it is not possible or because the =
alternative leads to<br class=3D"">better code quality. Those cases are =
called "deviations". They are<br class=3D"">permissible as long as they =
are documented, either as an in-code comment<br class=3D"">or as part of =
the commit message. Other documentation mechanisms are<br =
class=3D""></blockquote><br class=3D"">I would drop the "as part of the =
commit message" because it is a lot<br class=3D"">more difficult to =
associate the deviation with a rationale (the code may<br class=3D"">have =
been moved and you would need to go through the history).<br =
class=3D""></blockquote><br class=3D"">But this was added in response to =
me pointing out that code comments<br class=3D"">aren't standardized yet =
as to their format. The alternative, as said<br class=3D"">before, would =
be to come up with a scheme first, before starting to<br =
class=3D"">mandate playing by certain of the rules (and hence requiring =
deviations<br class=3D"">to be documented).<br class=3D""></blockquote><br=
 class=3D"">I don't think this is necessary short term. It is easy to =
rework a<br class=3D"">comment after the fact. It is a lot more =
difficult to go through the<br class=3D"">history and find the =
rationale.<br class=3D""></blockquote><br class=3D"">We all know what =
"short term" may mean - we may remain in this mode of<br =
class=3D"">operation for an extended period of time. It'll potentially =
be quite a<br class=3D"">bit of churn to subsequently adjust all such =
comments which would<br class=3D"">have accumulated, and - for not being =
standardized - can't easily be<br class=3D"">grep-ed for.<br =
class=3D""></blockquote><br class=3D"">Well... Scanner will likely point =
out the issues we deviate from. So you<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">we have an =
easy way to know where the comments need to be adjusted.<br class=3D""><br=
 class=3D""><blockquote type=3D"cite" class=3D"">By documenting things =
in the commit message the state of<br class=3D"">the code base doesn't =
change, and we'll continue to rely on scanners<br class=3D"">to locate =
sets of candidates for adjustment or deviation commentary.<br =
class=3D""></blockquote><br class=3D"">The part I am missing how =
documenting the deviations in the commit<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">message =
help... Can you clarify it?<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
class=3D"">I understood Stefano for this to merely be for the purpose of =
justifying</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
class=3D"">the deviation (preempting review comments).</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div></div>Right, so at a very minimum, if we say =E2=80=9CThi=
s is a rule now=E2=80=9D, and a submitter wants a deviation from that =
rule, then the reviewer needs to know the justification for the =
deviation. &nbsp;The commit message is the obvious place for that.<div =
class=3D""><br class=3D""></div><div class=3D"">Obviously something =
*else* we might want is a more convenient way to keep that rationale for =
the future, when we start to officially document deviations. &nbsp;Given =
that the scanner will point out all the places where deviations happen, =
I don=E2=80=99t think an unstructured comment with an informal summary =
of the justification would be a problem =E2=80=94 it seems like it would =
be a lot easier, when we start to officially document deviations, to =
transform comments in the existing codebase, than to search through the =
mailing lists and/or git commit history to find the rationale (or try to =
work out unaided what the intent was). &nbsp;But I don=E2=80=99t have =
strong opinions on the matter.</div><div class=3D""><br =
class=3D""></div><div class=3D"">&nbsp;-George</div></body></html>=

--Apple-Mail=_AD7493BB-1713-417D-BBD6-EC8A411028D9--

--Apple-Mail=_FB269E6E-4FB3-4F9B-ACBD-53D20408D831
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKUmroACgkQshXHp8eE
G+2j5wf+Ob/aTHvDcDfIt7qrFhjtOfxCz551C0JzGWbA/hpxtZpQTweUCLJXsFVb
nfMHsbIkZIwduQSsviX93t/CxJWdJSlIFXt0F4qeDC7zzSz/nVE8ZcjyCNJoAGw3
JioiDP9MbsYEXaqDa/9NDNAhMsnEPoWq1KYlL2hvp55T7wiI/7cVmrwZ3P6A7oh4
3xT/lwp0YVZNgpLr9OMziKRYjeeFKG7WhFcbfDdiEG23spjQ8O5XtPkyGL96+n/N
x4/gs0UJWPXg+KSvWigMpUAoXNvmpjGaq/kbXUS+/j8l1+ONhRJ67N5qUWFGEfsN
qEuNNdmHmLHb8Nrnn/qVn4JXSOVfgA==
=1MZs
-----END PGP SIGNATURE-----

--Apple-Mail=_FB269E6E-4FB3-4F9B-ACBD-53D20408D831--

