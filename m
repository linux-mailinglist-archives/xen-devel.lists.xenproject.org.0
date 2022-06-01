Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9E5539E90
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 09:40:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340287.565291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwIxt-0004ht-7n; Wed, 01 Jun 2022 07:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340287.565291; Wed, 01 Jun 2022 07:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwIxt-0004fd-4W; Wed, 01 Jun 2022 07:40:25 +0000
Received: by outflank-mailman (input) for mailman id 340287;
 Wed, 01 Jun 2022 07:40:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=esiv=WI=citrix.com=prvs=1449ffc77=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nwIxr-0004fW-9L
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 07:40:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15eeebf5-e17e-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 09:40:21 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2022 03:40:14 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by BL0PR03MB4228.namprd03.prod.outlook.com (2603:10b6:208:68::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 07:40:13 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308%4]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 07:40:13 +0000
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
X-Inumbo-ID: 15eeebf5-e17e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654069220;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=jq0wdIyUfobfG2FBvyvsaB3PwseR77vdc+81MI9QyRY=;
  b=W5jJVC6p1G55Fhoe59zz0M6vBGcsYEb8HdeQpwPgoqxNokjgzdKyd3Af
   s4pq9OtrwpIi8n2S8EVBpe5mC6DAVehLUvSPK3fKT2VjDn/ND4qPBvtTl
   SMwV0mofsz6JSJdBN9eo7xmaQRiqtXPhg+MMjFTh3HfAm6nitL0XmvOXY
   I=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 71950180
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:N324Vq9PusZMWOWfjvd+DrUDkn6TJUtcMsCJ2f8bNWPdYAuX7wSz/
 BJcAD7Ya7vPIDfrKpolWDmFhUhQu5aHy94xSFBqqCo8FStG95efC4yScB/+ZHPIcJPJER055
 pgQNdKdfcxpQCKN/h2naeTq9XVw2KjUT7SsVL+s1kydPeNBYH5JZUVLx75p6mIRveWEPu+th
 T/Ti5LTNgao0GclamtOsKzYpEM+5aX75mlG41Zhb68bt1HXxiUZVJ4RG/q8fiDyKmV28k9WZ
 AphIJWRpD6xE8IFU4v9+lrDWhRWBOaUZ2Bis1IOM0SYqkEqShcaj+BqbZLwVW8N02/Tx44pk
 Y0U3XCNYVxB0pPkybx1vyZwS0mSDYUekFMQCSHi2SA75xSun0rEm52CPmlvVWEr0r8f7VV13
 e4ZMFgwgiWr3Ipa9l4Zpt5E3azPJOGzVG8WV+oJITvxVZ7KSribK0nGCEMxMJ7dSamiEN6HD
 /f1ZwaDYzzvPBluYnJHBKsQlcaN31T1b35/9liK8P9fD2j7lGSd0ZDLGf+MIpmmYJsQmUyV4
 GXb427+HxcWcsSFziaI+W6tgemJmj7nXIUVF/uz8fsCbF+7nzRPTkFJEwbr56Dh0CZSWPoGQ
 6AQ0gUjqrI9+QqHU9/5VgWQq3+YpB8MHdFXFoXW7SnSk/uJu1/JXgDoSBZ7aZ8LtZRueQUj8
 XqKvc7IVTJBroCKHCf1GrC86Gna1TIuBWMafioFUQst6sHuup0ulQnISst/EamzlZv+HjSY6
 xqHtjQkjrMfy+sCzbym/Evviiip4JPOS2Yd9gjRG26o8A59TIqkfJCzr0jW6+5aK4SURUXHu
 2IL8+Cg6+QJAYCIhTa6auwHF7G05N6IKDTZx1VoGvEJ6DCF63OlO4dK71lWP0xuLtpCdTb3Y
 VT7oh9Y/ptaNj2rasdfaIKrCt82yrDgGM6jXfTddNlmeYR4bguO9mdvYia4xHvxmUIhlaU+P
 5azcsu2C3seT6N9w1KeRe0QzLsqzSAW3n7ISNbwyBHP+biDYH+YT58VPV3Iafo2hJ5ouy3Q+
 tdbcsePlRNWVbSmZjGNqNZJa1cXMXI8GJb67dRNcfKOKRZnH2dnDOLNxbQmeMpumKE9evr0w
 0xRk3RwkDLX7UAr4y3RApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:lVuLdqBZlkfdhrLlHegAsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEDyewKnyXcV2/hdAV7GZmXbUQSTXeZfBOfZogEIXheOjtK1tp
 0QP5SWaueAa2SS5PySiGbXLz9j+qj/zEnCv5a9854Zd3APV0gW1XYdNu/0KC1LbTgDIaB8OI
 uX58JBqTblU28QdN6HCn4MWPWGj8HXlbr9CCR2SSIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijifem0RXRvlWjrqi+2eGRiuerNvb8yPT9GQ+czzpAo74RH4FqiQpF491HLmxa1+
 Uk7S1QefiboEmhA11d6SGdpzUIlgxepEMKgGXo/0fLsIj3Qik3BNFGgp8cehzF61A4tNU5y6
 5T2XmF3qAnRS8pDEzGlqf1vjxR5zyJSEAZ4KcuZr1kIPkjQa4UqZZa8FJeEZ8GEi6/4Ic7EP
 N2BMWZ4PpNa1uVY33Qo2EqmbWXLz4ONwbDRlJHtt2e0jBQknw8x0wExNYHlnNF8J4mUZFL6+
 nNL6wtnrBTSc0da757GY46MICKI32IRQiJPHOZIFzhGq1CM3XRq4Tv6LFw/+2ucIxg9upEpH
 0AaiItiYcfQTOfNSTV5uw7zvnkehTPYR39jsdD+pN+prrwALL2LCzrciFar/ed
X-IronPort-AV: E=Sophos;i="5.91,266,1647316800"; 
   d="asc'?scan'208,217";a="71950180"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPoyHLuHqg/V2IGli49OBV46OIZRom69JFN+KcRQFxW57NdidSezY52a4+Sv/c12Th6LCeJip0tL622msYfEenFWxlk0uQDoJn2xZbA2xouKd2BJJ5jDhwmZnjB0MMK0qXcNwQbqdA9dqGCNA4VyXxzOr/2TW4AA0PF1i3p8Y0ukUD6l9fuf3qHWzS0zg7chvfHQTMJUpzgi+QgTzA7r23xTP6ucoLCp4+RqGHsDsGNQaRjvsigb06+ea5c3+ueTbGuXak4FcnxyxIuDL2xBEkJwo5qxVqeH+UufWYBI/T8mD73ksJKdfKvxQZMknfnXVHMXBkf3xzP0kqumPBX45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyVIV3LeyRDNNE3omh0hYjfR0gRzgBqV4vaR1GTJwGc=;
 b=QBcfO1HQMt/WGPSFQ7oU6dCa39K8bIO+GwwDEWRlKTkHyhutMZ5C909NB9pRkhNgMvoNpO6zM0h9yayOfXO417PpfoTeXNyaUv/ABDkk6cm4eyxRsUgpGPJ0XZye63Xui8uevuesuL2fo3mXff+UOLe1G2jMCKPUa1RT2oEPpgLLyntgYyR55FgGRw131pKudGmyIY0KWHTch7kXkcnsTkNxkVyuBUoqCi+c1uqrWMBQP7xGJS4eKH/PuleYJoJjm6ZmYVSNRolxEZyTgenxP3IqLZEVr0+aYBbInJEAyvdwolPzuwTSDheSe9PGUUa9cfEqDFKz5fZ3nkXURls7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyVIV3LeyRDNNE3omh0hYjfR0gRzgBqV4vaR1GTJwGc=;
 b=uu2XpIebykOURZJR5tQWwQDfsqzLhlMZk4Aj+4xHXVOO/wkTJCd6AtlNrMvxInx61U0lHSdjdT3bMR5pdg9L7aScbf7oXrWWEs/uLpX2+PibmDx72Xgclwd9jSz9vDZG7VGXC6omNemU0DMXzmlXAQ8OAPeOlUbn+CIeLLZVXs4=
From: George Dunlap <George.Dunlap@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, xen-devel <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
	"scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Thread-Topic: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Thread-Index: AQHYdHaBi3mMFaceck2YWC859wyqAa04suMAgAAbYQCAADQ0AIABKjuA
Date: Wed, 1 Jun 2022 07:40:12 +0000
Message-ID: <8F3BD9BB-EC62-4721-9BD0-3E4CC1E75A22@citrix.com>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
 <2F13F24D-0A55-4BC3-9AC6-606C7E1626E8@arm.com>
 <4ebbb465-00ec-f4ba-8555-711cd76517ed@apertussolutions.com>
 <YpYdqglsWIlsFsaB@Air-de-Roger>
In-Reply-To: <YpYdqglsWIlsFsaB@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 713bc76e-cb6e-4b25-57eb-08da43a1f66a
x-ms-traffictypediagnostic: BL0PR03MB4228:EE_
x-microsoft-antispam-prvs:
 <BL0PR03MB42286A53C6776069A4F4E49A99DF9@BL0PR03MB4228.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 EIaBlOVbVKAHTWB5JbThGgS65Bke3c6dNGVauuaE8VEPfnUiQDu/f/IIDMcIbfjDH6187qykB9I8tmegDoUU3whP6x1rRaBa3GfMoRfxhOvBnXz74Q+71vLoQqmxO7PcelvYDc5qZOcNNx+9+65Z3GtalWG44mTzhhZ03jT5hk8kZpaSrRGamVcTG7yfvSvY2EZeRQarB1FFMb41EXaQvvsZlIyBBV3I/JYCkMa8xTtMnk2jrD4xTWP2NG9oKazUvQ/N4kC6NRFK5oB0ffkoVUmLhFRJdDegyM4YocEBUr/JD/BJ2xPG+I8XSDDdY/z2AzxBS2n168uKfoav2GChSlcIJVMPrOFRWNOJb3r8Rrtl53zZJE63EOMx5/Ofmvm8FKVEXKJpkTBZOGzuPUcK4TvDGzyk9ha7neHtw776j6Z1mNhdXb4RuehHL9XAVmABA31lA3sHSAtcXvflsduitgWKbt5T1V5ncssFO2gm8/0MdjRSmThnmQhX6O7fTjrkN0vIvqmUhkH6oVy30fKA7YePV2/1gQbLFZ7gvzlgtIqvE26N5/reX46GoMwQ2Ac0qqtZ0Qa1k0p+Ko43n7mFsoDbufwehabDk982NPl0A5KyS+MyF0e7geKdVZrtwtIYVGo72GrYHjxe5L2t68mocs3pUS2KZPDRE5gJq1FjHYHUUlKkhXs+VIG4zASmkb8NAZOIgFP5Pvpr6/6jJxb5mH8L2DezG2r45jTuNgM8uXp0xkiinoGshFqvQuhrhnKM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(122000001)(53546011)(38100700002)(508600001)(83380400001)(6506007)(5660300002)(91956017)(6862004)(4326008)(8676002)(82960400001)(76116006)(36756003)(64756008)(66556008)(66946007)(66446008)(66476007)(33656002)(86362001)(2906002)(6636002)(8936002)(71200400001)(316002)(99936003)(54906003)(37006003)(6486002)(2616005)(186003)(7416002)(26005)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmFGaG5qdVQvWlNVMStTZjcyTW1aZUFkOC9qcEp0OEQxWGd0d2owdGF3MlVR?=
 =?utf-8?B?SDFPTU9RZnVnbmlTMmRIU0ovK2ZwRWtnT1ZiTmlVS2pXQVZBemkyYjJ3ZjdF?=
 =?utf-8?B?Y290MU5ualZVVjhkNXcvNklnTWw5dk4rMHl1elFMZFdPeUNEMWFraU1WL29F?=
 =?utf-8?B?eXliT1EwZ0tsK3h4M1dKbzZjNlV0TWZaSHB4bmo2Q0x5WFNYWXRiNEtjb3J0?=
 =?utf-8?B?dTVZaG9tRVFGNU9PSzErejFOd3Vqa2UxN1gyaThmQWRWUEVpb2F0VjVrVmh2?=
 =?utf-8?B?ZWhrQkVtNmw1dStuZjd6dFUwUW9qZkpodThKUWVUMEkzUnNrRkdBVlg2eVBG?=
 =?utf-8?B?QmI2cFBaQ3g0RlZBTGM1UHVmYTBwZzZUNDhaZERyZWx3OTdVRHcrSGp0TVJK?=
 =?utf-8?B?NTJodmhvcVdLdDhIbTQyVDhheUpUNmkzRmpvZ2JIbG1UbmM5NlE1VGFJQlpG?=
 =?utf-8?B?NlVWcjVYS3orbExoZ2h5Y214UXE4aTA0ZFNOMVVnVDkyQVdjNmxxNGVhT3Vy?=
 =?utf-8?B?TTRWUmxrblZHdnNPdFFWMTFRVUdCTHFyQk12RzAxMGNqSFlkbXZtU1hMdGhz?=
 =?utf-8?B?Y0VqMmx4dFhpdXNDTC9ob2dQY2VGblRYVDJQeWhDZGxzSFZQMHU3Q2RQbS8x?=
 =?utf-8?B?ZHFBdi9yckx4Y3RLejZ0S25wZlMraWJxeU9HUmtrWk8yVDV1NXovU1lQRTBZ?=
 =?utf-8?B?Zml6ajI2WEpQd2pMYlZaOVZ5ZDZkRGlraUNBVzYvdEJTZEdNYnB5V1huRDdo?=
 =?utf-8?B?UGdycWFuYkMzM01qeDE4V3R5ZUJqYThDY2IySzU5OGhEaGE4cjBNL0ErMWEv?=
 =?utf-8?B?RlJwM1J0WUxadjhaSE5YK0MvUWlpWG5TNlQ0b3JXaXFvMVVZOVgrSHAxd0Fq?=
 =?utf-8?B?US9lVXcwQmtvcU5JNXkyWWc0K1F3NjBNWXp0Mi9ZdzNCdXFPcHQyVUNLRGZu?=
 =?utf-8?B?c2VEZGdHS0U0RmRsc1dKT0hHV0xrT1F3MGlRQlBtL1NXSlpWRU16OWIyRGxE?=
 =?utf-8?B?NGhCMmZpdFVGbG9TNldhdzY4NUFGNHRrZjNlUEhaN3kxV2Q3UGpwZXdxRUNi?=
 =?utf-8?B?N0pGcVRPcW5ldkNwdklZTVJXZmlydlJucmJhdGcwdlNKamxBbi9mOGFwTmx4?=
 =?utf-8?B?Qk5FVkxVNW5RbzcyS25USUMwMnNnN0NTUlpLbk5maEN0OTVzNmgvcStxb2lV?=
 =?utf-8?B?Mm5WazdRdnZPekxYYmo1UWVnQ28wdE54ZDBDUkpjeWRMeXU4ZUlwTGtWaWl5?=
 =?utf-8?B?ejFlbFd1TG9qdGMvNW14bGJ5Umc5ZTg1dmFVcEdHUnAzTWVGUDVaZStWRlpo?=
 =?utf-8?B?UExGMmt0ZS9qY21jMVhpOHoyL0VJRXpQY0RHZ3MzeG05ci9rYWVRejh4NnJ4?=
 =?utf-8?B?d3U1VGNzbThIcjhlVGYrNGxPNk0wYmNtaHVveHQ4SGFtSVNqSU1hQ2sxOGRQ?=
 =?utf-8?B?aXpQd0FqMktGekRYRHRyOUNEZEVLL0hWdGZKM3RvRmNUTkVXRm13SXUrSjFj?=
 =?utf-8?B?K1A3U3BpZXcrdHNrNlkvbjA0UjY0K3FnVHRiSFJxT2VTcitUcmZhRUhreEJt?=
 =?utf-8?B?N0RnWDFlckpGK1JyaXRRbXpCYUJtbS9PSmJENjJKdWFYTS9ZeWt2OXBZYm9h?=
 =?utf-8?B?QmtyVDVMYVRQaXhpTVhDMzRveXhpVmpySk9ZVWsraE9OaFM1MTAxT2VsaCty?=
 =?utf-8?B?cDcvVWV3NEpobU5URnVQL0RqNFRNNzh1NXQ0M1p2UG54dWRXd3J1Uk8wNWY5?=
 =?utf-8?B?cGxoUXQzZ3FtS01wd3BjeWJKWVE2c0tnYi90ZnY4L0N0Vk5Rekt5Z3FvVkpN?=
 =?utf-8?B?ZTl6Q2M4UUEwR0E1TVF0RWtyQkpNemxMazFCMU9CRG00eUM0VVgyWG96NU8v?=
 =?utf-8?B?VkQvQmMrU2k2LzBMSTBZMnJDVUVubURVTWg4ZWJ1V3R6UllvM1diLzFxTi9W?=
 =?utf-8?B?c242KzNYcFF4YS93MXBQVkJJZnZJSlEvRjYvNzd5NC9ROUxlVzVhSDFEVEI4?=
 =?utf-8?B?MlhmOWFIRnRnMWEzOHVRNCtJaHR5OW9EcUsybG9LV1VzVTZNRDBtNEpPazRm?=
 =?utf-8?B?bGh2QW01SGdTWElTYXpleEdhbnVpQ3dVRG5hMjJ6OUEwUnFWTm1xZmZWb2h0?=
 =?utf-8?B?aUJlNWZxdzltYi94R2Jjbm9WVDcyb25rSkV6eWdhb3R4SkpHcWhYNTBnQW9y?=
 =?utf-8?B?TDlvUGNFUGpVNGdjM3M0cUQrU0lnU2sxU1Z3MTdkOHg5b1ZLT3MvUy9LQk1H?=
 =?utf-8?B?cVlweDl4a1Qvd0NZWURtR3F0VExzZEcranFNTCtPZnFGTTV0cFg4VnVNUlZP?=
 =?utf-8?B?Q3R5VFQvNkpGNEZtTXZ0cElKblR3MEZpSTJkbzh1YVAwMXI2c0JLZkNheUFJ?=
 =?utf-8?Q?imdmdfehTEWgFzpE=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_89C0914C-E71D-4E70-861B-5565183C51A1";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713bc76e-cb6e-4b25-57eb-08da43a1f66a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 07:40:12.8681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F1yoCfPlxoaJIS8xrms/6AoiP2SWZ64P8Flp2Khsk7xrCaVzRtzHFoHNUd777ACsP2b6DQ0CXVbx4c6OZuorxXfMb2R1e/d/NrgasBIc4pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4228

--Apple-Mail=_89C0914C-E71D-4E70-861B-5565183C51A1
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_E277AD90-BD39-4FC2-818A-A6A371C2E64C"


--Apple-Mail=_E277AD90-BD39-4FC2-818A-A6A371C2E64C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 31 May 2022, at 14:52, Roger Pau Monne <roger.pau@citrix.com> =
wrote:
>=20
> On Tue, May 31, 2022 at 06:45:52AM -0400, Daniel P. Smith wrote:
>> On 5/31/22 05:07, Bertrand Marquis wrote:
>>> Hi Daniel,
>>=20
>> Greetings Bertrand.
>>=20
>>>> On 31 May 2022, at 03:41, Daniel P. Smith =
<dpsmith@apertussolutions.com> wrote:
>>>>=20
>>>> For x86 the number of allowable multiboot modules varies between =
the different
>>>> entry points, non-efi boot, pvh boot, and efi boot. In the case of =
both Arm and
>>>> x86 this value is fixed to values based on generalized assumptions. =
With
>>>> hyperlaunch for x86 and dom0less on Arm, use of static sizes =
results in large
>>>> allocations compiled into the hypervisor that will go unused by =
many use cases.
>>>>=20
>>>> This commit introduces a Kconfig variable that is set with sane =
defaults based
>>>> on configuration selection. This variable is in turned used as the =
array size
>>>> for the cases where a static allocated array of boot modules is =
declared.
>>>>=20
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> ---
>>>> xen/arch/Kconfig | 12 ++++++++++++
>>>> xen/arch/arm/include/asm/setup.h | 5 +++--
>>>> xen/arch/x86/efi/efi-boot.h | 2 +-
>>>> xen/arch/x86/guest/xen/pvh-boot.c | 2 +-
>>>> xen/arch/x86/setup.c | 4 ++--
>>>> 5 files changed, 19 insertions(+), 6 deletions(-)
>>>>=20
>>>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>>>> index f16eb0df43..57b14e22c9 100644
>>>> --- a/xen/arch/Kconfig
>>>> +++ b/xen/arch/Kconfig
>>>> @@ -17,3 +17,15 @@ config NR_CPUS
>>>> 	 For CPU cores which support Simultaneous Multi-Threading or =
similar
>>>> 	 technologies, this the number of logical threads which Xen will
>>>> 	 support.
>>>> +
>>>> +config NR_BOOTMODS
>>>> +	int "Maximum number of boot modules that a loader can pass"
>>>> +	range 1 64
>>>> +	default "8" if X86
>>>> +	default "32" if ARM
>>>> +	help
>>>> +	 Controls the build-time size of various arrays allocated for
>>>> +	 parsing the boot modules passed by a loader when starting Xen.
>>>> +
>>>> +	 This is of particular interest when using Xen's hypervisor =
domain
>>>> +	 capabilities such as dom0less.
>>>> diff --git a/xen/arch/arm/include/asm/setup.h =
b/xen/arch/arm/include/asm/setup.h
>>>> index 2bb01ecfa8..312a3e4209 100644
>>>> --- a/xen/arch/arm/include/asm/setup.h
>>>> +++ b/xen/arch/arm/include/asm/setup.h
>>>> @@ -10,7 +10,8 @@
>>>>=20
>>>> #define NR_MEM_BANKS 256
>>>>=20
>>>> -#define MAX_MODULES 32 /* Current maximum useful modules */
>>>> +/* Current maximum useful modules */
>>>> +#define MAX_MODULES CONFIG_NR_BOOTMODS
>>>>=20
>>>> typedef enum {
>>>> BOOTMOD_XEN,
>>>> @@ -38,7 +39,7 @@ struct meminfo {
>>>> * The domU flag is set for kernels and ramdisks of "xen,domain" =
nodes.
>>>> * The purpose of the domU flag is to avoid getting confused in
>>>> * kernel_probe, where we try to guess which is the dom0 kernel and
>>>> - * initrd to be compatible with all versions of the multiboot =
spec.
>>>> + * initrd to be compatible with all versions of the multiboot =
spec.
>>>=20
>>> This seems to be a spurious change.
>>=20
>> I have been trying to clean up trailing white space when I see it
>> nearby. I can drop this one if that is desired.
>=20
> IMO it's best if such white space removal is only done when already
> modifying the line, or else it makes it harder to track changes when
> using `git blame` for example (not likely in this case since it's a
> multi line comment).

The down side of this is that you can=E2=80=99t use =E2=80=9Cautomatically=
 remove trailing whitespace on save=E2=80=9D features of some editors.

Without such automation, I introduce loads of trailing whitespace.  With =
such automation, I end up removing random trailing whitespace as I =
happen to touch files.  I=E2=80=99ve always done this by just adding =
=E2=80=9CWhile here, remove some trailing whitespace=E2=80=9D to the =
commit message, and there haven=E2=80=99t been any complaints.

If we actually care about trailing whitespace, then I think we should =
accept random fix-ups as files are touched.  OTOH if we want to avoid =
random fix-ups, we should remove the aversion to trailing whitespace.

 -George

--Apple-Mail=_E277AD90-BD39-4FC2-818A-A6A371C2E64C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 31 May 2022, at 14:52, Roger Pau Monne &lt;<a =
href=3D"mailto:roger.pau@citrix.com" =
class=3D"">roger.pau@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On Tue, May 31, 2022 at 06:45:52AM -0400, Daniel P. Smith =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">On =
5/31/22 05:07, Bertrand Marquis wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Hi Daniel,<br class=3D""></blockquote><br =
class=3D"">Greetings Bertrand.<br class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D"">On 31 May =
2022, at 03:41, Daniel P. Smith &lt;<a =
href=3D"mailto:dpsmith@apertussolutions.com" =
class=3D"">dpsmith@apertussolutions.com</a>&gt; wrote:<br class=3D""><br =
class=3D"">For x86 the number of allowable multiboot modules varies =
between the different<br class=3D"">entry points, non-efi boot, pvh =
boot, and efi boot. In the case of both Arm and<br class=3D"">x86 this =
value is fixed to values based on generalized assumptions. With<br =
class=3D"">hyperlaunch for x86 and dom0less on Arm, use of static sizes =
results in large<br class=3D"">allocations compiled into the hypervisor =
that will go unused by many use cases.<br class=3D""><br class=3D"">This =
commit introduces a Kconfig variable that is set with sane defaults =
based<br class=3D"">on configuration selection. This variable is in =
turned used as the array size<br class=3D"">for the cases where a static =
allocated array of boot modules is declared.<br class=3D""><br =
class=3D"">Signed-off-by: Daniel P. Smith &lt;<a =
href=3D"mailto:dpsmith@apertussolutions.com" =
class=3D"">dpsmith@apertussolutions.com</a>&gt;<br class=3D"">---<br =
class=3D"">xen/arch/Kconfig | 12 ++++++++++++<br =
class=3D"">xen/arch/arm/include/asm/setup.h | 5 +++--<br =
class=3D"">xen/arch/x86/efi/efi-boot.h | 2 +-<br =
class=3D"">xen/arch/x86/guest/xen/pvh-boot.c | 2 +-<br =
class=3D"">xen/arch/x86/setup.c | 4 ++--<br class=3D"">5 files changed, =
19 insertions(+), 6 deletions(-)<br class=3D""><br class=3D"">diff --git =
a/xen/arch/Kconfig b/xen/arch/Kconfig<br class=3D"">index =
f16eb0df43..57b14e22c9 100644<br class=3D"">--- a/xen/arch/Kconfig<br =
class=3D"">+++ b/xen/arch/Kconfig<br class=3D"">@@ -17,3 +17,15 @@ =
config NR_CPUS<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>For CPU cores which support =
Simultaneous Multi-Threading or similar<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>technologies, this the =
number of logical threads which Xen will<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>support.<br class=3D"">+<br =
class=3D"">+config NR_BOOTMODS<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>int =
"Maximum number of boot modules that a loader can pass"<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>range 1 64<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>default "8" if X86<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>default "32" if ARM<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>help<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>Controls the build-time =
size of various arrays allocated for<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>parsing the boot modules =
passed by a loader when starting Xen.<br class=3D"">+<br class=3D"">+<span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>This is of particular =
interest when using Xen's hypervisor domain<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>capabilities such as =
dom0less.<br class=3D"">diff --git a/xen/arch/arm/include/asm/setup.h =
b/xen/arch/arm/include/asm/setup.h<br class=3D"">index =
2bb01ecfa8..312a3e4209 100644<br class=3D"">--- =
a/xen/arch/arm/include/asm/setup.h<br class=3D"">+++ =
b/xen/arch/arm/include/asm/setup.h<br class=3D"">@@ -10,7 +10,8 @@<br =
class=3D""><br class=3D"">#define NR_MEM_BANKS 256<br class=3D""><br =
class=3D"">-#define MAX_MODULES 32 /* Current maximum useful modules =
*/<br class=3D"">+/* Current maximum useful modules */<br =
class=3D"">+#define MAX_MODULES CONFIG_NR_BOOTMODS<br class=3D""><br =
class=3D"">typedef enum {<br class=3D"">BOOTMOD_XEN,<br class=3D"">@@ =
-38,7 +39,7 @@ struct meminfo {<br class=3D"">* The domU flag is set for =
kernels and ramdisks of "xen,domain" nodes.<br class=3D"">* The purpose =
of the domU flag is to avoid getting confused in<br class=3D"">* =
kernel_probe, where we try to guess which is the dom0 kernel and<br =
class=3D"">- * initrd to be compatible with all versions of the =
multiboot spec.<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">+ * initrd to be compatible with all versions of the =
multiboot spec.<br class=3D""></blockquote><br class=3D"">This seems to =
be a spurious change.<br class=3D""></blockquote><br class=3D"">I have =
been trying to clean up trailing white space when I see it<br =
class=3D"">nearby. I can drop this one if that is desired.<br =
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
class=3D"">IMO it's best if such white space removal is only done when =
already</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
class=3D"">modifying the line, or else it makes it harder to track =
changes when</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
class=3D"">using `git blame` for example (not likely in this case since =
it's a</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
class=3D"">multi line comment).</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div></div>The down =
side of this is that you can=E2=80=99t use =E2=80=9Cautomatically remove =
trailing whitespace on save=E2=80=9D features of some editors.<div =
class=3D""><br class=3D""></div><div class=3D"">Without such automation, =
I introduce loads of trailing whitespace. &nbsp;With such automation, I =
end up removing random trailing whitespace as I happen to touch files. =
&nbsp;I=E2=80=99ve always done this by just adding =E2=80=9CWhile here, =
remove some trailing whitespace=E2=80=9D to the commit message, and =
there haven=E2=80=99t been any complaints.</div><div class=3D""><br =
class=3D""></div><div class=3D"">If we actually care about trailing =
whitespace, then I think we should accept random fix-ups as files are =
touched. &nbsp;OTOH if we want to avoid random fix-ups, we should remove =
the aversion to trailing whitespace.</div><div class=3D""><br =
class=3D""></div><div class=3D"">&nbsp;-George</div></body></html>=

--Apple-Mail=_E277AD90-BD39-4FC2-818A-A6A371C2E64C--

--Apple-Mail=_89C0914C-E71D-4E70-861B-5565183C51A1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKXF9cACgkQshXHp8eE
G+1D4gf/RYtMOEqMqayL4bq5yQUDUpykPUFZoUBjGjrwoKSquaQ3Xog41sm6MeR7
GIZ5ZW/e4CXT+iLcLNRG7q28MQ/5ezC0/fyf+rnvhLswLW+qGuaNwO6U406p6SRr
tmgXIIehzNNACZ9rsVwg8j2IOOSYemDEphnQBf32HPj6Q5ceHITn3/zfLd9hQkFe
Rl9O4ufHNL+e4Bl66XfcKZDK7gQxNDHd18DCMDkOVO9enxl2PlN7mw4hFHrK3vMR
7F2b/UM1fzYesDOOkIraLCPuFYh+Dg6yGzvarxrhGyeGkhEIxt8Ep3HK8o5f7YAR
WKKybj86w9btUhDGdmwG4HrATN8Ilw==
=ba9V
-----END PGP SIGNATURE-----

--Apple-Mail=_89C0914C-E71D-4E70-861B-5565183C51A1--

