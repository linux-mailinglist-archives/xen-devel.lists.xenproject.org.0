Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED604B86C2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 12:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274023.469351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKIZr-0001mI-UK; Wed, 16 Feb 2022 11:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274023.469351; Wed, 16 Feb 2022 11:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKIZr-0001kj-Q6; Wed, 16 Feb 2022 11:34:31 +0000
Received: by outflank-mailman (input) for mailman id 274023;
 Wed, 16 Feb 2022 11:34:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nrBo=S7=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nKIZp-0001kZ-Uc
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 11:34:30 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6571f948-8f1c-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 12:34:28 +0100 (CET)
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
X-Inumbo-ID: 6571f948-8f1c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645011268;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=Tn7bVSJVe0TQihNERmSZm9Ar/5n1NiKTWVncNWpVH84=;
  b=gxBVkeuXzvMcHjDLdp04msxFjEkIjVA8Zg0/LuNNuvnTLapbAXnSePAy
   K1uzpcWXQ4WfVAahTT5VXjr6IKWC86K/O9he5QXsNQy7rEMrl204RN9bt
   u8JLeyERzuZh875Np/7yZYIHV55rBNy3FXbrd2K/6i2p4mDUwKj/fTciu
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oSprCU1l+9BcfjiZ7sgraq/iBIQN6QKu+zxIY++g9sVCRtKrehGK/tLAIhazUZq6eD0P5v5kI0
 lEVgWggmnu5gCqQu3pmXYmN/ceNtT8SJSIbZG4rtSOrxSFNorj0UwkXecUvctv3X5p16G80j6C
 uOu7CLjvZZ4UJ72y7mEL1ty6wualIsFRTlyEc8pE2NsINGsqw91CgWooDLnd8DwD96Ogj1S6ck
 ELoBGKcfynTA/WkVoGHBFRGL13F0NQqEkP0V9GWnvXwXItjZB2xsnEwFqlYrd7yOtGFdUC7foo
 pkG//mL6D9DVEPe1gwatknf+
X-SBRS: 5.1
X-MesageID: 64736905
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:X5zeoK/DPJDS6MmYUfGDDrUDiniTJUtcMsCJ2f8bNWPdYAuX7wSz/
 BJcAD7Ya7vPIDfrKpolWDmFhR4AucfXmoU2TQdrrS41QikUopLPW4rAJBigZHqfdJKfEhg34
 pkUNIWfcJ8+QnaM+Bvwa7G5o3Ali6+GGbalAbGs1kydPeNBYH5JZUVLx75p6mIRveWEPu+th
 T/Ti5zRZwP/0mMsaTxNuvnY9Esy4v2q4GkWtAVvPf4XsgSOxiUZVJ4RG/q8fiDyKmV28k9WZ
 AphIJWRpD6xE8IFU4v9+lrDn8ljrof6ZWBisFIPM0SZqkUE9nxaPpoTbqJGMx8N0mvRxrid9
 f0W3XCOYVZxVkHzsLx1vylwS0mS6oUfpdcriVDm2SCi5xWun0nEmp2CP2lvVWEswc5lAHkmy
 BAtAGtlgiZvJQ6B6OnTpuFE3qzPJSRwVW8VkikIITrxVZ7KTX1fKkljCBAxMDoY36hz8fjii
 8UxZH1wQk7pbUB2KgkxWJIht9mloWLzSmgNwL6VjfJfD2n7yQVw1P7mMcbPe8zMTsJQ9qqaj
 juYpSKjWEhcbYHBj2remp6vrrancSfTd48VDrK1sNJ3hlma3kQYCQEMVEv9qv684qK7c4wDd
 BdKq3JzxUQ03FKGd4W6XQ+XmSC/4DguB91uEfQgxyjYn8I45C7GXzNZH1atcucOr9QqTDYn0
 luImdLBBjF1trCRD3WH+d+8sjeaKSUTa2gYakcsTxYB4tTliJE+iFTIVNkLOKy/g8DxGDrw6
 yuXtyV4jLIW5eYh2r+n51nBj3SJr4LQUw8uzgzNWySu6QYRTJ6oYcmk5EbW6d5ELZ2FVR+Rs
 X4cgc+c4esSS5aXm0SwrP4lRe/zoazfaXuF3AApT8JJGymRF2CLcMdPzmtXKhpQIpgiKT/2S
 3Henhhd3coGVJe1VpNfb4W0AsUs6KHvE9X5S/zZBuZzjohNmByvp383OxPJt4z5uA11yPxkZ
 8/HGSq5JStCUcxaICyKq/DxOFPB7gQ33ivtSJ/y1HxLOpLONSfOGd/p3LZjB93VDZ9oQi2Iq
 76z1OPQkn2ztdEShAGNrOb/ynhQcBAG6Wje8ZA/SwJ6ClMO9JsdI/HQ26g9XIdugr5YkOzFl
 lnkBBMEmQem3yyWeFzQApyGVF8JdcwixZ7cFXZyVWtEJlB5Odr/hEvhX8dfkUYbGBxLkqcvE
 qhtlzSoCfVTUDXXkwnxnrGmxLGOgC+D3FrUVwL8OWBXV8c5G2Thp4+1FiOypXJmJnfm6qMDT
 0iIi1qzrWwrHF85Uq47qZuHkjuMgJTqsLgiDxGTc4YJIRiEHUoDA3WZs8Lb6vokdH3r7jCby
 xyXEVEfo+zMqJUy697HmeaPqILBLge0NhMy87Dz4enkOC/E0HCkxIMcAu+EcSqEDDH/+bm4Z
 PUTxPb5aaVVkFFPuot6MrBq0aNhuIe/++4EllxpTCfRclCmKrJ8OX3aj8NBgbJAm+1CsgysV
 0PRptQDYeeVONnoGUI6LRY+arjRzukdnzTftKxnIEjz6CJt0qCAVEFeY0uFhCBHdeMnO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDday2AQxy1xEbZjNMQPM4cmCO4dWL00nA
 j6In66e1b5S8VXPLigoHn/X0OsD2ZlX4EJWzEUPLkiik8begqNlxwVY9Dk6Q1gHzhhD1O4va
 GFnO1csePeL9jZswsNCQ3qtC0dKAxjAoh79zF4AlWv4SUi0VzOScD1haLjVpE1JoXhBejV7/
 a2DzDe3WDnnS8j9wy8uVBM3sPfkV9FwqlXPlc3P8x5pxHXmje4JWpOTWFc=
IronPort-HdrOrdr: A9a23:aGgfiqpPpsIoYaEW8fqxXJMaV5ucL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXcH2/hsAV7CZniohILMFu9fBOTZskTd8kHFh41gPO
 JbAtJD4b7LfBZHZKTBkXGF+r8bqbHtmsHJuQ6d9QYXcegDUdA50+4TMHf+LqQCfnghOXNPLu
 v62iMonUvDRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCClaDPY0LLErXQBepF8bMtiA2vkwltls9dm3K
 1R2WWF85JREBPbhSz4o8PFThdwiyOP0DAfeX56tQ0vbWIyUs4YkWUkxjIfLH7AJlOP1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgE082IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBLB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+laGjMiq9NllVcQ6duP221qIJzYEUHoCbQhFrYGpe5vednw==
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="asc'?scan'208";a="64736905"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaqRwGpva5iQm9cREGeYTMco/16Nk/fC5jm8RSPwPmBxNxsk+mIxNLXXo3nYRJfzl2QJwFKjnbQmV8shfbQw0SInbdWSv7BLVEy7IWd/HBiZLSU7KH9dBKcKgQJoUGeJB1gl6EoH5QNpFg9gQUtFbXWHtxs8PS2oEm/omVce3fUBucdAObid/ji1bQbQ982lttIwwzGbuzGyHqqVNdxQUEkrlxNUbrnyV7gCYlBdwTk/Z7QPvKFzjQ5glBt00Q3gEOrYD5DQaKBgBzWQz0xHu2Ig/Z43xXkmkr2sGy7X8LP82WNuCD8570KZneXYrzUGAAO5aHy+r5GcGx7tbOoDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsdX51WXsh9P2Sj+L7xGle/P8pJ6O5xUJG2Rw6EWCc8=;
 b=MpT0QeUKyWjJlIOJP/spAYoWWTl5JdKSFFgtALLzkx1wkqHv5MH+r5BdUc5neA1H7lxWMQoD5y+MXmKqOZYzB8g3vdodlhuPb6IDEsE+PjMjDqqzDTZNniA9synyc1g/aGNC2Jb8s9VlZZoNBgRZ5WCkuor2erkUclyS3E8Hlis9VbXzZ6dOmym30gNDaKxpN1bi4CB0xnZZh8MJ4NV1wFGbJsQw7nt30DuBc4wEO3T7+Y9cbMUIGdq0aa0AP7vHov0VUzD9zKGj8DieWzBOE4Q7YxC2+f/zSGZ+ArcdcyPbnYaKc89ByA8tGxI3rHqZral833liMbWKIpSdfKAfnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsdX51WXsh9P2Sj+L7xGle/P8pJ6O5xUJG2Rw6EWCc8=;
 b=AXuWUjgyali87iNK3Z082HKhE3a9TE1J+kQQe8UDCkd/Qe/7xFcxX0QFjOn1MZnC+502lvNrfhroEwHeMhF8xf+8nUnD+GnULBJ28zjrEnEtUthvsBiiVMs3pUUVJIN7wKy2Mq6LNpfsYYitlkdMAhh7BqFlstxjZmG5Rzk1XjA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] lib: extend ASSERT()
Thread-Topic: [PATCH v2] lib: extend ASSERT()
Thread-Index: AQHYE4shsIFDV42A206yi2y9mPx4ZqyVNw0AgADQCYCAAAHgAIAAIi+A
Date: Wed, 16 Feb 2022 11:34:21 +0000
Message-ID: <DB014136-7797-4A61-9681-33A7D85403AA@citrix.com>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
 <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
 <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
 <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
In-Reply-To: <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa7da722-8748-4060-7e7d-08d9f14046c5
x-ms-traffictypediagnostic: DM5PR03MB2844:EE_
x-microsoft-antispam-prvs: <DM5PR03MB2844231D9E395A1B970DBF8E99359@DM5PR03MB2844.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WTYGieBwt3tC+rjg/P1dFy3o5+GkoP5QOaz9MLPZC6PPPbNzyopOGjv9wd/WOeB4ceO36qILaQoq4UjZWDgod1WLtry28IWK8rY1ILXVjfhNFlyPrqWucpF0Rk9L5BBPfoo3tCy9vGnPgWmq9ATXa2xaxSt+CQBRqdXQ9l2Sod5aZmo508vVgChobJCScxmQKPepDldvSfZh5/kFjD+3U3PN6+vazmB/S/PxiLJ/hRwpNAnFArefI19xC7NWEOXhCXPuZRLS7ts4mq2XStZvmZ6I1HQXAELf4Tog8GkY6EStvn5RmyRk13VIeHBjwO8gb8q92hN4WkVLahl2cA0WsC3YI2pN3RUgej1CRqSt/Ky+693+oVhtl48p+UahoJ/FQq7lrvryH3+gPSw0kHr64FpzYVdjKu+sgGzzyhGmo+9/QTPw2a+o+TC2bpcAhnjthwRWSVMg8e/EPTQ9Iptio4uZFQtVXv/DpVQGJjSzA2BVT6EZ2kGgd6OAGKoIwvWGyZuGGsH45icl0IwzR6Ezyykv7hehfKtVdlCZ8IUOX6phu+6VQNES6G9fF6yFdNOOShNdzVjZE0GdLTEkG7zND7P3EsDZ74OPEDPxYCawjoMRmVtIseMUUDGrIN2ny4ZAJdFqdP2uekSFs0ftGiIjRMtMNPlPDZvFDygRQfAbc9TDVkjV9D+WxOpBjlS9wM1SSKvNAA1y9ki9UQnYfRi25SfF1ESPNfDn59ZGIBovZuaZFQQb10Y1pZlv0uuLcWis
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5665.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(86362001)(2616005)(2906002)(5660300002)(186003)(38100700002)(8936002)(66476007)(76116006)(66446008)(66946007)(53546011)(66556008)(8676002)(26005)(4326008)(122000001)(64756008)(82960400001)(316002)(38070700005)(36756003)(71200400001)(54906003)(6916009)(99936003)(508600001)(91956017)(6512007)(83380400001)(6506007)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVJKYjg3aDNFTWxrZFZ5dnFVY1pTWDE4UkxTQWJKV0tWcERoRUV0cGtKMjJj?=
 =?utf-8?B?WGpJZW9udXJMeDVRRWJ3K2k3TEllQVBQZzVlMXJTR29SUlVLam16THpGU0Zw?=
 =?utf-8?B?c2x4MytpaW0vRHZFYXBCckQ2bzJrTmx1bDFvL2VZNUFDYm51Y3dHRHdTU1VS?=
 =?utf-8?B?S3hNRENkRit1eFg4a2hpMW13L2pnV0VIZUdIRW1QWWRmK3NhOFY1YVg0NXla?=
 =?utf-8?B?cm5HZHptaWNCSGg0ZGZnc29MQnFob0NsTTdwK3FPTlJYaGRESGxaUGtpdnNT?=
 =?utf-8?B?c1Z0VS92WGpDSnRVd0lmOGhqWWpHSGRFdXZIdVNVNkw4c0RmRk1aRE5wbmVK?=
 =?utf-8?B?cTJmcEdJOWdDcHhvMVlmSURJVWlyempqNWhtMUl1SVpJbEFKMldKOEtlRDNM?=
 =?utf-8?B?T1pyQXEzUkErNG51UDJ2KzBQamMyYTB5a3RHbGUrQ2x5UTBtRzBqVTdtVVM0?=
 =?utf-8?B?V1JrRVBuam16UTJPU2gvVU9kNW1yUWVid2lxOFRmT3M2N010V2hRR2dzYldZ?=
 =?utf-8?B?VmwxUWQ0TURFa2J3b2kybXJpK3pveERGNkF5V2tUNXpjc0t1QTFmbWpLRHZx?=
 =?utf-8?B?TEtFLzU4TjVFWkY2U0pTMHRTRDNaUmtGQ3I0SWdsOExWd3hVOUlvMEx5UHds?=
 =?utf-8?B?R0JwY3R4cXBMWkswTzZCeUczeENzbkk0RU0rUzVRTmpWcW5SNURudzlNVXVw?=
 =?utf-8?B?M0kwZDdKeXBNMTFlNWhDdXZQQi96L3E1blRpQXRRd1dPdHBuMWVleFhvWldV?=
 =?utf-8?B?VXJyTVNyVktxRWc4aFB1d1JOSG91Qk5lMG10U1RsdUtVWGw0MDlCOXlYRUlR?=
 =?utf-8?B?RklJL1JMWnpqamo1cWZnR2RESityL1NrbWU2elRHblZuNFpxbHpZSmlqS1Vu?=
 =?utf-8?B?dE5sVGFubVJsQnYxdnJxNy9aK1gyZVhGcGFENmp3N1VoVmVlOGV6bGUwUVRa?=
 =?utf-8?B?Y21SSmxZRlFPTHNMRFZscG9xN1VGd3J5cThjcmhCWVVJck1KMnFoWXg4VW5t?=
 =?utf-8?B?Z0dYRFBTYU52cGR6aUFnK3ZPNFdyRnQ2M3FmL3FSM1FmejF2Wk1EaTF3MC91?=
 =?utf-8?B?WlZYbmtlNjB3d2Y0cTcxUTZ5V2lrQzRoemJLTkRNRmtHT2lwbWVQVGtwQTdk?=
 =?utf-8?B?a0ZzL3J0UFFSUWNqaTdaNEVnK1lrN0JMdkFiZXNFRWMxRjV1bjNRcDY0UnNk?=
 =?utf-8?B?c0trRUtBbXRCMmVsK29ndm1RRjJ1WjZ0WVFUanFlei9pRVlUM3g5RlFPOUdI?=
 =?utf-8?B?by9lVXNla1h6RkIxZ21QdG5LT1dJSVk0VXV5SzFNNFZPRnNLaHI2RFBaUGpn?=
 =?utf-8?B?VTVzc2pZcXcvUTcxaEhad09IRHRLbUN1OVlKOU9QamdkT2prN2E1Nk45K2lU?=
 =?utf-8?B?czdyTGcwVCttM1R0azQ3aVBuaDhxZW13SGN5dlBkMHJKNnZ5dG9zVWtuT1lY?=
 =?utf-8?B?Tlp5eTk2cUQzNDVWQlI3RWxBTzJRNWcvK0RYM1RwY1JLVWFnK0FDMWZEV2pX?=
 =?utf-8?B?MVg2bTZDeEVtL24vNkJaTENKRFBhbHNHSk1oSVlSTnlFUndKeHZOVXZOeVo2?=
 =?utf-8?B?eStRc29oRnRzWTA4a09UZ3ErM3cvbTFNeEpVMDBWMytmQzVCSmpuK2NQTTI4?=
 =?utf-8?B?RSt5dklkekFuTWMxQVBndkpUQUhxT3Y4UWM3R0JqRnVOTmYySUJkUWNFc0sw?=
 =?utf-8?B?dkNlYlppZFNJZlhjNDEyaU5ZelhrWUhuNWRabVhDb3NBcS9TanF5RXpkU2E2?=
 =?utf-8?B?SWhpb1lxZERrY3YvMFkySWUrcnQ3NnZwTlVJanIweS9TN1gxdEtib3hIeVAr?=
 =?utf-8?B?RERTM3J3eGFWS3JITUFsU1RBTVhZaUZnNU1DRUFWWEIxVi9YUExwMm81Y0o0?=
 =?utf-8?B?Y3FaREJjMFZ1NXJqbzRjY0xHa0VNdjFGYlhXeTBWaVRsd1NpaGtBQ01zcEFu?=
 =?utf-8?B?TEhGbkhPUENuYmFFWlVERWpJY0xDVERUQlBmT1JHZ2VUSmVySkErZWpVNnFK?=
 =?utf-8?B?OUlKL1pUZis0U1BhVVQ3RThmRlFiQ1AwKzNPU1ljbFNWam05Z3F2UlRpTWgz?=
 =?utf-8?B?UThaV0FSS1BJOFRIOXhBRDVrVGV6dUpHTVlGaXU3dDhqaGcwNFU3MTl1dHlr?=
 =?utf-8?B?VVNOTFhSYzV2UHVocDl5TXJVa1F0Y1ByaW50MkZHUDFFaUl2QUtVK2h1OWtw?=
 =?utf-8?B?MTM5YkwrNm54SFJ3Z2JYWjZWVWcwK1A1cityQXBJNEJMenRWN2NZcTZOaEpQ?=
 =?utf-8?Q?m5UFQHEKz84umVDvknXSEvhX6S3FznyRNGX4wmWo28=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3FE077EC-1DEC-4920-984F-0BE79200A195";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5665.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7da722-8748-4060-7e7d-08d9f14046c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 11:34:21.6403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJBR/2ofJlin77ViLCmLMwaNskiO39DZORPSYXBaXDMeXMUrfbhwyQCNfrqB8zcXztw7qWw7rSbq2eIrkSlenuzCfShEynlMyq2U7x8AoI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2844
X-OriginatorOrg: citrix.com

--Apple-Mail=_3FE077EC-1DEC-4920-984F-0BE79200A195
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 16, 2022, at 9:31 AM, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 16.02.2022 10:25, Bertrand Marquis wrote:
>> Hi Jan, Julien,
>>=20
>>> On 15 Feb 2022, at 21:00, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> (+ Bertrand)
>>>=20
>>> Hi Jan,
>>>=20
>>> On 27/01/2022 14:34, Jan Beulich wrote:
>>>> The increasing amount of constructs along the lines of
>>>>    if ( !condition )
>>>>    {
>>>>        ASSERT_UNREACHABLE();
>>>>        return;
>>>>    }
>>>> is not only longer than necessary, but also doesn't produce =
incident
>>>> specific console output (except for file name and line number).
>>>=20
>>> So I agree that this construct will always result to a minimum 5 =
lines. Which is not nice. But the proposed change is...
>>>=20
>>>> Allow
>>>> the intended effect to be achieved with ASSERT(), by giving it a =
second
>>>> parameter allowing specification of the action to take in release =
builds
>>>> in case an assertion would have triggered in a debug one. The =
example
>>>> above then becomes
>>>>    ASSERT(condition, return);
>>>> Make sure the condition will continue to not get evaluated when =
just a
>>>> single argument gets passed to ASSERT().
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> v2: Rename new macro parameter.
>>>> ---
>>>> RFC: The use of a control flow construct as a macro argument may be
>>>>     controversial.
>>>=20
>>> indeed controversial. I find this quite confusing and not something =
I would request a user to switch to if they use the longer version.
>>>=20
>>> That said, this is mainly a matter of taste. So I am interested to =
hear others view.
>>>=20
>>> I have also CCed Bertrand to have an opinions from the Fusa Group (I =
suspect this will go backward for them).
>>=20
>> Thanks and here is my feedback in regards to Fusa here.
>>=20
>> Most certification standards are forbidding completely macros =
including
>> conditions (and quite a number are forbidding static inline with =
conditions).
>> The main reason for that is MCDC coverage (condition/decisions and =
not only
>> code line) is not possible to do anymore down to the source code and =
has to be
>> done down to the pre-processed code.
>>=20
>> Out of Fusa considerations, one thing I do not like in this solution =
is the fact that
>> you put some code as parameter of the macro (the return).
>>=20
>> To make this a bit better you could put the return code as parameter
>> instead of having =E2=80=9Creturn CODE=E2=80=9D as parameter.
>=20
> Except that it's not always "return" what you want, and hence it
> can't be made implicit.
>=20
>> An other thing is that Xen ASSERT after this change will be quite =
different from
>> any ASSERT found in other projects which could make it misleading for =
developers.
>> Maybe we could introduce an ASSERT_RETURN macros instead of modifying =
the
>> behaviour of the standard ASSERT ?
>=20
> Along the lines of the above, this would then mean a multitude of
> new macros.

Out of curiosity, what kinds of other actions?

I am opposed to overloading =E2=80=9CASSERT=E2=80=9D for this new kind =
of macro; I think it would not only be unnecessarily confusing to people =
not familiar with our codebase, but it would be too easy for people to =
fail to notice which macro was being used.

ASSERT_ACTION(condition, code) (or even ASSERT_OR_ACTION()) would be a =
bare minimum for me.

But I can=E2=80=99t imagine that there are more than a handful of =
actions we might want to take, so defining a macro for each one =
shouldn=E2=80=99t be too burdensome.

Furthermore, the very flexibility seems dangerous; you=E2=80=99re not =
seeing what actual code is generated, so it=E2=80=99s to easy to be =
=E2=80=9Cclever=E2=80=9D, and/or write code that ends up doing something =
different than you expect.

At the moment I think ASSERT_OR_RETURN(condition, code), plus other new =
macros for the other behavior is needed, would be better.

 -George

--Apple-Mail=_3FE077EC-1DEC-4920-984F-0BE79200A195
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIM4TMACgkQshXHp8eE
G+0k9QgAsdq0w65/AV3KvuNEAZvzBcqmhqfnLDDDwkIy4gtCs1gs/X1+0WC/XIqE
r7xO8wxq+X6zN/GdxEod2CO3q3ZU3rRhbZ9za8zk1EBhKg7A3UCxHOtUbhxnlP+T
3Gr0scEEQKETcLPKdFrBBIhkUC33ACFrfRq/vyXnyqB3J+puMMy3IscGpzpJOAIm
kxAxAJbksKi5xczYsL1Qdx0wN9Md9GD29+bD5LA7imysk3iJUBGuCMNsc6Gkqzit
BERt4M26PlDzqZ2nSq2DmxFLPLUwmyylwc+q4/EdDtXTZw8YhTg5hEuIHRy54xKr
fmlZkM1yLki2zOzCsRYI1PIM8olcrA==
=DaMX
-----END PGP SIGNATURE-----

--Apple-Mail=_3FE077EC-1DEC-4920-984F-0BE79200A195--

