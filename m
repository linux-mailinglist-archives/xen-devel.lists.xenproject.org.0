Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1F455A1CA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 21:28:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355859.583797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4oy3-0006eJ-CC; Fri, 24 Jun 2022 19:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355859.583797; Fri, 24 Jun 2022 19:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4oy3-0006b1-8t; Fri, 24 Jun 2022 19:27:47 +0000
Received: by outflank-mailman (input) for mailman id 355859;
 Fri, 24 Jun 2022 19:27:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jTea=W7=citrix.com=prvs=167c355c5=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o4oy1-0006ar-PL
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 19:27:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b77d4b2e-f3f3-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 21:27:44 +0200 (CEST)
Received: from mail-sn1anam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Jun 2022 15:27:41 -0400
Received: from CO1PR03MB5665.namprd03.prod.outlook.com (2603:10b6:303:94::6)
 by SA2PR03MB5804.namprd03.prod.outlook.com (2603:10b6:806:fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 19:27:39 +0000
Received: from CO1PR03MB5665.namprd03.prod.outlook.com
 ([fe80::8037:ee0a:e1bd:bdab]) by CO1PR03MB5665.namprd03.prod.outlook.com
 ([fe80::8037:ee0a:e1bd:bdab%7]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 19:27:39 +0000
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
X-Inumbo-ID: b77d4b2e-f3f3-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656098864;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=VaOXPvTVh3H3j0ZMITtM3LzJ8kx4wmbAeWr20urHe7I=;
  b=Xy3JnZ5XW9NGLHLhQEFBmtrWDj2Am4za4MVWuz6QRz7aROcR8TSS5aP6
   EbgUicj5Z+l726ZaxIroUJM2deH+EovoYW+B0s7Cx0EwlLfh4IkNAJmpZ
   Z5qVcEp/WdS5Dal14obSJaUri8W9IffJ8DzB6REhmWjioE7Guzwd90M1a
   w=;
X-IronPort-RemoteIP: 104.47.57.42
X-IronPort-MID: 74375579
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1J2596CCf2aO5xVW/97iw5YqxClBgxIJ4kV8jC+esDiIYAhSlGxQk
 DNbHCvTJK7JMVJBSKkkPYnn8U4Ou5LTn9M2QFRtpXtkEy8Q9ZDLX4qTc0r6bniff5zIRRs94
 s5EMYOaJps5RyOM/xz2OLW483Qg3vGCLlaQ5JYoHwgoLeMzYHtx2XqP4tIEv7OEoeRVIiuB5
 4r785KPNACo0GUra28et6+J8x4z5/6p6D4RtAA0PaEXsAfSmUdOAcNEL8ldDZdZrqq4vAKeb
 7yepF1s1jqBp3/BMvv8zvCjNBdirof6ZWBisFIPM0SZqkUE93ZaPpoTbqJGMx8J0WnRxLid9
 f0W3XCOYVZxVkHzsLx1vylwS0mS6oUfpdcriVDm2SCi5xWun0nEmp2CP2lvVWEswc5lAHkmy
 BAtAGtlgiZvJQ6B6OnTpuFE3qzPJSRwVW8VkikIITrxVZ7KTX1fKkljCBAxMDoY36hz8fjii
 8UxNAA+aySZfzlzEVoWAck3wf+huiDZfGgNwL6VjfJfD2n76iVUiOKoC/yMP9uASINSg1qSo
 X/A8yLhGBYGOdeDyD2DtHWxmuvImiC9U4UXfFG63qcy3BvPmSpOV1tKDzNXotHg4qK6c/1SL
 FYb92wCsK42/VSDRdjhRRyo5nWDu3bwXvIPT7ZltVzSm8I45S6SW0UUZzdoMuABj804Qhlw8
 Xi4gvjQUGkHXLq9DCj1Gq2vhTG4NDURLGQCTTQZVgZD6N7myKkjgxSKQtt9HaqditzuBSq20
 z2MtDI5hbgYkYgMzarT1U/DqyKhoN7OVAFdzhnWW0q14wU/Y5SqD7FE8nDe5PdEaZ2fF1CHt
 X1cwcyGtrhSV9eKiTCHR/gLEPex/fGZPTbAgFlpWZ486zCq/H3ldodViN1jGHpU3g8/UWeBS
 CfuVcl5vfe/4FPCgXdLXr+M
IronPort-HdrOrdr: A9a23:jOJrAqxPAS72trJmZJcVKrPxgOskLtp133Aq2lEZdPULSKGlfp
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
   d="asc'?scan'208";a="74375579"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfqSO9xs6ohX0JsvXulV4IUzMwy9GtlqtmtlZnbRzmf45nUDhYgsZOGO5KYFVofVQ2hMvsHYxCunwN/Ozx1rrT5M8UuTJLGxg8ySaUbT4V0jdl/oke0rFgOq9RGIMJlpDp+VsgZTa6Na+5p0smSY4EkzYwr7ZTCK9hw7jOK3vsTSF+YpfmAWZjmsykhBp2PUUNBobCYFj4Vm41gDpv1+iCBJ/zL5fzoHKy0T2bU6vfay6L0mxsAKT09t+ExUZ+dUH55xPXTGrjmxj6QKmvyjz0WE3Yk/OBnxtt3UIjSvhVyYcmD3HmHjhmrMciavtdHmTCZcnDYU3kyM6RfvDEsqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsrzEX+WHrlrFoJN3ARiAkM3lVJAx9ElXP1C50OvT5w=;
 b=XbXRXGJ82PZNy7vnmyFS17VMVc7Zy+XQ2MssvgJ91x7hL7z+PCW8V87kC8/nk7FtW6MBR77Gol6pKyDcEWQCLFDhLWRMNvzryZOTJ9ovEgXuZMSFuEuJTTLgpywLxguYssedSoy5G8HOT17xWBbToFUYpcXL8NSYslhAREtHgP2D5OflJW6Y4Y8xEIm9ImDKqiDRvnIuJChmfGDmRHIQArPDpZTFzlNF3gn33V4Q0+dM/jxIWVaLqjKgvL/Vkou1tHIG1pJRaPoJ3XpR4ecWwMntswtUykpK2musgs0C0FV5HKof0YVvrRkGMyhU/eLApQhhTkMvgfma/MPHDsBBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsrzEX+WHrlrFoJN3ARiAkM3lVJAx9ElXP1C50OvT5w=;
 b=TPGQTgfqOkidiavSb7sGva3d1ElgpSM3eHtMXAyObMx1DQJOQ9djPCeToaLBAvQlrfwYLJpQlcqYh2pI35l8BtY7ANyqioXCszSqIR9Fha07BDWi9Ydr1U9Xa7gUQmiuJl9sr7v3FR9kDrNyTIPh3k2Bl0d5P3oaIDomSOD7cRQ=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 2/2] x86/P2M: allow 2M superpage use for shadowed guests
Thread-Topic: [PATCH 2/2] x86/P2M: allow 2M superpage use for shadowed guests
Thread-Index: AQHX7O/bKX0sOdH9/0aIlntq4rv2Q61gJw0A
Date: Fri, 24 Jun 2022 19:27:39 +0000
Message-ID: <8D91423A-67A6-40B3-A3D7-44711DC41A7E@citrix.com>
References: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
 <7a80d08b-edd7-43c8-a7ce-42eb85d6f3be@suse.com>
In-Reply-To: <7a80d08b-edd7-43c8-a7ce-42eb85d6f3be@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ea361ce-18bd-4fda-4b64-08da56179a27
x-ms-traffictypediagnostic: SA2PR03MB5804:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9UN/l7tTp94qFF2NvmFNZo9qdcpHcUMjOqyJKMSwQ8kYNcub04zlyXSwq1thGDYC5DW7oDPyZnTpCiw3UJtW4hXzk3MmEG4H4JSFWI90Ose/Z+GTgL3zPxaX132Tci4NTxhr4JXdIdizeHNqfZu2ttNQ8EjhUnn0ujT6wWBt/cPRVQyigqDBAUoo38MmPwT6TaQjR26rdCfld5Ot8pVzigK8hz+xvJw3/aXOKZkvvKg2DSqFW8BDtCizatYDESB54AA3JWVc7oucywe7HgO9iCWEeqI7JFVWY2vm282bMgP71O/z/HxPyVSBEsChu7mSVWcP/vD4GtJoaIS6mzuJ6c3LMdSRfL2PWg4VAjWZMKv7R5emH62Ip0XA6n/Lk/Ck45rWAmisipJRxyr4+kpKM+nU8qA46Be6KEsvr2QxsSPrxqEOgYAsySPVoQMeLttOUP2aqy6zQ5OhYY0UN7CpMUNOClGs+AXXEYsCCflYmSjxNMz4MW5VsxUMvyEcryQ0JEIktqnneSFKUB5DEz3v6kZfIpvFusNMxHe7GXq/fyKl6gNNZ27oRV8XQZxWX7gyQyXdPNQTmLmkKpe2Db8WMpqZLwITOFnhgkrfVbz228PQmAIonaTxCv3R6QB8/QDgEEOlifRD52W+MrDbA8sLwi9E39JxcHfS1VkJ7MZ+RKywSw7wJ5FMIUCD756M0kgyUI5XReZH0gz0IgKkYsi9/jrhXPJHwLdseGSyc1Mwx3PJRTFSHtJceVTmjyiaVY7/iOqRUFm5YTQHUxCkpTJSILKIlhM3b+4w+/aBbhDIjGUFXZTzfxPEsUwgwkv3tzDMXBNc1DkWGmVv0LnwwuBXLw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5665.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(2906002)(66556008)(122000001)(6486002)(66476007)(478600001)(6916009)(26005)(86362001)(54906003)(316002)(66446008)(36756003)(8676002)(64756008)(33656002)(71200400001)(53546011)(91956017)(66946007)(6512007)(41300700001)(76116006)(2616005)(186003)(99936003)(38100700002)(6506007)(83380400001)(5660300002)(8936002)(82960400001)(38070700005)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2hrYXFqY3NORkRGa2krVDhJNmlMWkF2ZjNZQzBOb0ZKN2ZwNHhncThQdnRM?=
 =?utf-8?B?RUlaOFhQY3RObTM5TzJ4NFU5YVNVS3kxdmQvd3hIZk5lOHZqazExUDdUaC8y?=
 =?utf-8?B?d3JPaWlscllnNVdHeUFNN1podVl0VlJrSU83N1JCVy90N2l4OVBmbENwdGxs?=
 =?utf-8?B?bUNESHU5STBBWlFRSXliejQzVmZSZWJuNEQ1L1dTdGQyeWk3aXh4VVBFQzZ2?=
 =?utf-8?B?YitvTjlHS1JXV1RsaEljY3ZZUHYydUpzK1NrNTI3MEFzK2NyQ0xSU2dMMGRv?=
 =?utf-8?B?KzVZam1xS2FvMFpnKzJaNkJIZ3BNSDBaZGgycm5jUzMxL0xSeVcxM3Y5Z3p2?=
 =?utf-8?B?OW95NWhnUFY0YWVOZTd4c2dlRGZ0cTVaMDl3ZEh3WTlBOSsydGlsUHdXSVFX?=
 =?utf-8?B?QjQxNGc4ajh3UHBRYm9talJ1VVRnWjRuNVdubUZucWlHQjBYcHF2bHB5Wmdn?=
 =?utf-8?B?aStnRjNicUMyQzBKVWtDMldaRGNhdXI0Vzl4UHZwcEJHTGEvYnZjenVJSS9T?=
 =?utf-8?B?REZhenRjbWpCQnNtbzUzTmdDcmpPeXBDb1liNEJIOHFpeDNrN0g5Y0xxRE5R?=
 =?utf-8?B?dUw0NFlCTXpFK0RNbjlzRmFnTGRVMklLckk5MWMxdnFtZGF2QWJOY2d1VXJ1?=
 =?utf-8?B?UnFUMjVIeDdmYTR1cHFNaDJKeUJMRjlIQnZuZlFmNlRybTdhN1ZHU2JoRnVa?=
 =?utf-8?B?R2hNZGVSd2R6VTZWTjUwdFpxZzRyL3N2TTFheHZMOTY5RWgzNEVsYjV4aHo1?=
 =?utf-8?B?OUxvTkZHeU1rY3BRbVpsWkVnSDNMMFhCOGNUbFdkS2JJNkl6OXloZ2hpMXll?=
 =?utf-8?B?Z05HSTQ2aStEZFptZkdkcmpRY251aUtIdHh2a0tSbC9sVUIva2o3R2hxUEFh?=
 =?utf-8?B?UFZBZXRBYjlOd0xYR2hOdXkxeDg0c0dsMDVuVFpwYnY4SnFWWUNVUUhXVkZZ?=
 =?utf-8?B?QW13QTlWVUJkYkRrYTZua1cwaHE0ZWozZ04wU09zOHRZSDRNR0JZZU4rdzVh?=
 =?utf-8?B?T1d2b29jcFJ4bHZGVk81UG5adEN2YVdXK2ZPM1Yvdjc5QUIxZUFqM1VWZjAz?=
 =?utf-8?B?eG51YTRZU0ZWMjhKcHgrR1NGY3FjaS81SEZtVjljV285Tk9rc3hKZy90ZTNY?=
 =?utf-8?B?RE9Rbk53d3pyc1U2bVUzdi9TNVRIUG1zSWh4Q0xOREtsNk9ueUtmdkZUcmJS?=
 =?utf-8?B?YWhGankwQVdVVnRtSjFxL2tQVkhrbWxocm15RjBMMkhLczlHQjBkaTJsdDE3?=
 =?utf-8?B?MDFiMEk2MVJ5T2JZbGt4TUl1RmFraTNMWjJkMnBKQUdBQkdJV0x3YS9UcG43?=
 =?utf-8?B?YjRIV24yZHNML1BXTHhNZmhhbFpvWDU3alhTUjRqQkdhS2V3NDNWT2J3c1ZI?=
 =?utf-8?B?Z3hlMjBObUluVFlkb0NSU3dyVlNwUUExYmpJN3dSWEpLN3N5MVdqTDZaODh1?=
 =?utf-8?B?bk5kWUYxbGdYcHptZjBlWWxZOFU0ZC9QY0xkRzUxTWN5dUNXVXZXcWNaY2RT?=
 =?utf-8?B?a1ozdllQNXhEdGdjQklUaXB0T0MrRzRQMXM2SkN1ZHB4dVFwbWhZV1EwTUYx?=
 =?utf-8?B?bU1xaHdpd0hTeVV4Rm1nblIyMG9ha3Zpa2h6emtCUitNOTMraWt2bkZyckgx?=
 =?utf-8?B?akduNzRzU21pS0psenJzQ1I3UmdramgxeXQ2bVZMWEwyaHJTai90Q0Vzd25a?=
 =?utf-8?B?V29EZlArVi96Z3J6RVUwRkNOdTN4RHRTek10N3dTdGFIUEhnYWIya0lLNzZN?=
 =?utf-8?B?VjcyOTJYb0xrY2FrbXhKc2swaSttTlMvdnRTVDBCS2VtQXRua2d0aXMxeWtz?=
 =?utf-8?B?aWdpYjVMelJqTWZHb1pwc0h1aHpMY3NsUTlHak95akFwSTJRSlBUZXlJRytM?=
 =?utf-8?B?WlJwdzlFc2dDRWM4TTE2Nk44MGRXK2FpTXN5Zjc2VC9QOGRQVVFncS93NEJu?=
 =?utf-8?B?NW00YW9UdVlZdFRQb1FGemlYRTAzcFNxblJodE9NdVp1dEQ5bVZtc2NKNHZk?=
 =?utf-8?B?VHRTSlRGcWlJK1dEVlRzUjFjTlhXbVhob1QxU2pwcnI2c0xsaVE1eXh5a0Fx?=
 =?utf-8?B?cWlGVnZ3OFVzMG9HSzhqWk1rZXhlTHc3YUpKdHFPZFNBNEZqeUVNN1VJTlFH?=
 =?utf-8?B?dGpqa2F2K1dNUmVsMzB1NytZaVUvZG84ejd5SThlMHpMZjUzN0F4ZzRTS2Zp?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_64CD8593-F695-4F63-AE43-137DE7998877";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5665.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea361ce-18bd-4fda-4b64-08da56179a27
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 19:27:39.6537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hIqRf5n4fH7jChdwGnO1cMMDnqcxI+8X/LJkxF2CQl6a66mfqo59npP7Zpr8Vx/g1bjC0ebgJH9n4xH482uwsphfMdOeI5W6mxtow6soWlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5804

--Apple-Mail=_64CD8593-F695-4F63-AE43-137DE7998877
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 9 Dec 2021, at 11:27, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> For guests in shadow mode the P2M table gets used only by software. =
The
> only place where it matters whether superpages in the P2M can be dealt
> with is sh_unshadow_for_p2m_change().

It=E2=80=99s easy to verify that this patch is doing what it claims to =
do; but whether it=E2=80=99s correct or not depends on the veracity of =
this claim here.  Rather than me having to duplicate whatever work you =
did to come to this conclusion, can you briefly explain why it=E2=80=99s =
true in a way that I can easily verify?

e.g., all other accesses to the p2m in the shadow code are via =
get_gfn_[something](), which (because it=E2=80=99s in the p2m code) =
handles p2m superpages correctly?

Everything else looks good here.

> That function has been capabale of
> handling them even before commit 0ca1669871f8a ("P2M: check whether =
hap
> mode is enabled before using 2mb pages") disabled 2M use in this case
> for dubious reasons ("potential errors when hap is disabled").

I=E2=80=99m glad the days of random patches being checked in without =
comment or discussion are behind us...

 -George


--Apple-Mail=_64CD8593-F695-4F63-AE43-137DE7998877
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmK2ECoACgkQshXHp8eE
G+17BAf/dVhpD+0XMfIz7lGVIVBDcdvueI7VqgPIwruO9QjSBb6hcSs+oW4sBjCZ
Us7FDYOMDTnUpaHrvjQhuyvLMWsMELZxQQJR5DzHHfdqEmQb0RVVJOQiHsSZRPEM
1O6qkA+ryCVSHvi25d96bj81lYUKoYHl0ZiB9Hk4TAXImBRiXcyAaaoMl+FaB75q
IyHHwlP1MABxg3B9MU6DDIIzFSk6kb9aQ1qpqzRlHMOuPKmTtnCfQVvccpf04ZBM
8uj4Q/Zk64GlSp/9W0X+I02zaS6BMfdiSEfmgAPCvILsawyGoN6iIL1MdHnerMb9
n5ui6NGXnMtXXCy4lM2HedyC7WL4fw==
=Kssj
-----END PGP SIGNATURE-----

--Apple-Mail=_64CD8593-F695-4F63-AE43-137DE7998877--

