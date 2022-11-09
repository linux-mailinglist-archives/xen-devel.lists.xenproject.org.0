Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8F862345D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 21:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441130.695444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osrUo-00011T-1A; Wed, 09 Nov 2022 20:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441130.695444; Wed, 09 Nov 2022 20:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osrUn-0000ya-UU; Wed, 09 Nov 2022 20:16:25 +0000
Received: by outflank-mailman (input) for mailman id 441130;
 Wed, 09 Nov 2022 20:16:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4xbn=3J=citrix.com=prvs=305fe0018=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1osrUm-0000yS-G1
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 20:16:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60490cf9-606b-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 21:16:22 +0100 (CET)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 15:16:13 -0500
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by DM6PR03MB5178.namprd03.prod.outlook.com (2603:10b6:5:240::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 20:16:11 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::5d4b:6b1d:efc2:20e5%9]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 20:16:10 +0000
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
X-Inumbo-ID: 60490cf9-606b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668024982;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=SyOUv4VDnvtYScPq6xPFgMTCE8uxiQ1QzichdeYDGpo=;
  b=QGN9DBIwhgsLcb98RGCcPD2iUAx37Ghto0Iho3xh7PBwiX0k1wbo6XP6
   wfU+miHRssgy7ZEJglD2B6mJaWEN5qwQOKDTMQODfkglWgJqXrhfUES6b
   5ftYtGFg2Iyqvoh2HZ6ixG2+lF4/u48md8DitF3VQSrgD5CEyZyN7upRg
   o=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 84108518
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:N1wBoaxlv8mMr/w8H/Z6t+dRxirEfRIJ4+MujC+fZmQN5Y8a5oE1v
 iFGDjfXfrrIN3ykOIpG3L7Go0kCuJTRmt9hTARu+CBjQS0W8saaC4jHJEypZXKbcZXPEhg2s
 ZxBNonNdJA+FCKE/xmgaOCwpiMljPrZT7D3UYYoVswJqSpMEU/N3jo/y75RbvdUvOWE7yOxV
 fLa8pSPM1T50jUuajtP5/zSoUM/4quj4G1HtAI0Oa5F5QWPy3VNAJwhfqzgdHGQrqu4vAKZb
 72akOzmpDOxEzMFUI7NfmPTKxVSKlLqFVHSzCEQA+362EMqShUais4TLOAbZVpclwKHltVwz
 MQlnZGrQEIiM7akdN41CnG0KAkje/wYkFP7CSLn65bKlhWXKyCEL8hGVynaA6VJoo6bPkkWn
 RAoAGhlRgyOgeuw3IW6RoFE7ij0BJC2VG+3kigIIQDxVZ7Kc7iaK0n5zYYwMAMLrtJPBZ7ji
 /8xMlKDWvhijypnYT/7ALpm9Auha+KWnzdw8Dp5roJvi4TfIZAYPBEA/7M5d/TTLfi5kHp0q
 UrMp0rbATwrBODP4gai4EP1hbXLwyrkDdd6+L2QrpaGgXW170lKUFg8cwT+pvO0zEmjR9hYN
 koYvDI0qrQ//1CqSd+7WACkpHmDvVgXXN84/+8SsVnRjPaLpVnBQDFcEFata/R/3CMybRMn0
 UWGkpXFGDpruaW9QnOB7LaE6zi1PED5KEdSOXZcHVZcs7EPpqkynE+VSspTKpWRj/+qHh7z8
 iu6vCsH0uB7Yckjkv/TEUr8qzCjvJ/SVSYu+x7aGGmi62tRdIOjIoCl91XfxfJBN5qCCEmMu
 mAenMqT5/xICouC/ASPSugQGLCi596eLSbRx1VoGvEJ9Smp+nOlVZBd5nd5PkgBGt0fZTbjb
 UvXuAVQzJxeJn2naelweY3ZI9su5bjtE5LiTP+8RvpDZIJgMjCO+i5GbFSVmWvqlSARfboXP
 J6adYOmCykcAKE+lD6uHb5Fj/ks2zw0wn7VSdbj1RO73LGCZXmTD7AYLF+JaeN/56SByOnIz
 +ti2wKx4003eIXDjuP/qOb/8XhiwaAHOK3L
IronPort-HdrOrdr: A9a23:VPNIDqzQlqN4bDlasGusKrPxmuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk80hqQFm7X5XI3SFjUO3VHFEGgM1/qE/9SNIUzDH6tmpN
 9dmstFeZDN5DpB/KDHCWCDer5OruVvsprY/Ns2pE0dLz2CHpsQizuRfTzrd3GeKjMnObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUazpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZXcI5p4dY2xY/ouW3bRYzWTFcZcsnq5zXUISdSUmRYXeR
 /30lMd1opImjTslyqO0GbQMkHboUoTAjnZuBOlaDLY0LLEbSN/BMxbiY1DdBzFr0ImodFnya
 pOm3mUrpxNEHr77W3AD0ihbWAUqqOYmwtUrQcotQ0obaIOLLtK6YAP9kJcF5kNWCr89YA8Ce
 FrSMXR/uxff1+WZ23Q+jAH+q3mYl0jWhOdBkQSsM2c1DZb2Hh/0ksD3cQa2nMN7og0RZVI7/
 nNdq5oiLZNRMkLar8VPpZIfeKnTmjWBR7cOmObJlrqUKkBJnLWspbypK444em7EaZ4uKfaWK
 6xJW+wmVRCCH4GU/f+raGj2iq9MFmVTHDq1txU4YR/t/n1WKfrWBfzOmwTrw==
X-IronPort-AV: E=Sophos;i="5.96,151,1665460800"; 
   d="asc'?scan'208";a="84108518"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1hD8IbQuDhliSdhfjUXAM50VcVy88yLzAslW6ComOpRYrQ5BDDlBo0twYBgKRQUoMZuMGJo4h6UNTo7GJnDLKnK+tmQuWzf0LMjbXtxinhCCDgwsQOeU9OHGYQLeLcj7sEYYkmwQmKq6oNIgtWmsgSE0wBxlDcB4qIphWkInNIXB/2TLxQdiB8a/neyYu35ZUHzaVHkvuFsoUHYDtlLUaMKtyAvam2rwrk8Be5eslZMu/0Ttt6qmqDUsxAYe0o7aYWXxMU+ATHF+1bnvbcSeb1DhrlXvdIJ3cZN6gENofHUsU3EuK3Z8E3lnx280tHZYM3xlgElGnCC+QwNuRk4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnwwo6rFXfDvbocKGyBzR6K3h6CcGpWdic+HRT3+kw8=;
 b=YM/oL2oRYUwt0CoTYOr4vKUXKi9CdhtoTnGUWGlncmt3A6wyn1p/TKJfMRsKuCh7qdFvDBw9yvJimk3yE1tsBp/3jzLyYLwD1F6tcxONw2R7Go9jIOWlUAs5bZuSzU12efzhq1EM3vnANzF5s3H8Ge6hg/7kfKgsoBA1FRce6QU7iihSfZTzRRwCVRbM2GWmyCmH2O5GYFa4qhlWgZ73GU3syR/DL0o5mxTo6ZemLvq8JJo7dozrQ25eTkRpLlbAJxhISmKJEzC1klG55o9yevJUQ7KQjhk8pvRTEmKDqbphn6hX/yqnMtSXSCfH9S9MHEsp77PAIfUWF6UtEXWAxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnwwo6rFXfDvbocKGyBzR6K3h6CcGpWdic+HRT3+kw8=;
 b=bGhxPGX+9k3KKaXmU9JhpBzMykEkBq6+I+sDfaidQ02G55jKjwxVrPvCUFdZQ7k7OHO+DInPiagoAD2hx4CJodUczTcqtRyal3Y8l+k1tO6Le5Xtusdq2OyOZlnEPgalcpyxvp6uXuJWcIi6K0neJtdn0QdeOcTf0p6sYgMJ3dc=
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
Thread-Index: AQHY76JzZdOUSWsV/EuMjC67io5Dyq4uNcAAgAjbHYA=
Date: Wed, 9 Nov 2022 20:16:10 +0000
Message-ID: <C8C5E837-5A3B-4E79-A18E-41EE4B6A4086@citrix.com>
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
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|DM6PR03MB5178:EE_
x-ms-office365-filtering-correlation-id: 27adfd9f-6d13-4d56-630b-08dac28f3e44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 h68ZRQ3fCZC8dX/jUw/C52wnjM8q322VKNVpSAAkW0M/dhWRuoGWCK5VXfYAe7c88TwKxkxFuNgJCv8xHG+5yza7JVqxAEEvqPfnIhPyiqBtfepd0WSvGMXtM17W0jOzsyEK51oGx7IPU6Tlxcz63NRYbCHMUTMYR6H6a+lGEY3z/UgVWjBeEABteG41SZhntupBz3dswwkZRbeKOckRtYqWGz0jHb0kLs/bdH8gUEz8FQVsqGvsUHAVq0YxQzpTRYHz8hQHudOocIQD7K6B2Z3nauyEDCy/fZX9XyPyFSG90MYdeSaLie97a52oX8/g9GZO0G5+XbzRd1NA2O6CesxvYBZg0Q3CINvMXFn4OEG2kbKjR0yWqpqLCzd3eDDObxfuQHBvItOW4o93CMm2P37ru06hYxu4JoBDRmw64d0Bf0AUmWjZq2LFHWavZ6K298Oz1kMbHbibtv+8+Bu0PvK3xn98nwh19fGf6LHyKy4Q2A5GPlKiO2vHxSs3aHW7NRJMSv8RKlQkuLuuKAYGzD7nKdfn+6AU7RHDEFULISGKY+0k8O3+QKGB+poxQGc08WuvCODwW4YjLkMDJ9kiy7fU7adyQwFGS77OGqvqMDYkFwVJqlvNiVy+5jWXtJdBlPuroWljZeV2PIrJHMPuXPCC9VONyT6Kw1KoK3VltW5Wf/7/xBtE3+IpidRa3SX4B9yRP8vWSyRj3gyeA/JNtwEfxVqzderBEckkIJlA4McWvitCkucbyVCvsyLXeMRLs5b1pnNaGczxkXvHqpfPvOGe+Vssjv4YYK0V5w5Dd7k8OMY3dMlXnPoVVH0CCwzx
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199015)(186003)(33656002)(8936002)(36756003)(6512007)(41300700001)(4326008)(316002)(26005)(66946007)(66446008)(53546011)(91956017)(66556008)(76116006)(6506007)(64756008)(37006003)(6636002)(66476007)(54906003)(2616005)(6862004)(5660300002)(99936003)(83380400001)(122000001)(38100700002)(82960400001)(2906002)(38070700005)(8676002)(86362001)(71200400001)(6486002)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHNPZS9pNVFjclZhekZIVzVSSWdYbzlpRTdhc0NGZFJDMHduazlIbDVTWGc3?=
 =?utf-8?B?NmhXSHMyZ2ZVcUNoNWlITklQb1RVRjQ0OG15VVlJRE1IckZPSmpreDBlOVZw?=
 =?utf-8?B?cEVIY3U5TFVlME5DT1NablNMQTBvckpRQ2VkRUl4TEFkb3k5RXFTWXJmaU5J?=
 =?utf-8?B?Z2xVRGFBNTJid1FaazBTeFQrdS9oSnZQUWlqMTJNR2k5WlhuaGhIZGIwcWls?=
 =?utf-8?B?VDZseVowV3VNbXFIaThKNnE5LytkdWswNzFHSktlYWhXWkZEcW16SEUwa01t?=
 =?utf-8?B?WmczZkYvRUNhVjlZN3BTTDJwRVFSWnZPVHlvcEFvRmtka3F1T3hTQ0k3enF4?=
 =?utf-8?B?ZXBiU3J6SGlrK1VaeUlwS3NSVGNqejh6b1ZwTHc0dFZiRDFOQ2ZOTmtML25v?=
 =?utf-8?B?TWJtdHVqOG1Idm5mZWZrcXdONUNyVElzcmNqbGR2TUgxejNUV0lCNmhRTHc1?=
 =?utf-8?B?YUYxVDF0akg4MDIvaktTOVJaZTZIeWJsbDlFYjhlUUc1VFdOYmNHSlduWWxt?=
 =?utf-8?B?TXkwcm5BTjNxeVdmUGQ4cnBmSlc2RXNzWTBxeUxQSXhzL05mL3pib2dWVGp6?=
 =?utf-8?B?bzNlQ3RQWVJlTnJEeEcyWTg1MTZ4ZlAyN2ZOcFljdDJVMzNjN0o1Y3BvOVkz?=
 =?utf-8?B?WWI4eHBPY1NxbEpzWFJqSFF4ZkdFVjlweGlDRFZrVWZxdkowZlVzVGRtMUVB?=
 =?utf-8?B?UDd5Smc0eGVrRWhoOXFmQXhVaGwrUytlWUdrSFFYUjczU2p2R1JkdVFHZHdM?=
 =?utf-8?B?VE9RSUl4NmFFMHNVSEVWUHltMEZnL3lldDBsbDdIY3NUc2x5NEI1dDdQZEdB?=
 =?utf-8?B?OG4xZ2hET1QxUjcvVG5mV3FUZjluQXN4eFVGcXBkaU9vaUxXa2lObDU2MFo1?=
 =?utf-8?B?UFFJOXhyMFBXcUM1OWZSd1V6ZnY4WVQrazFpM3VaeFpJL3pmR1VOd3piTlVK?=
 =?utf-8?B?Mkh3czdkdkVtUTJ5MG9TOUhZVlBwWllPNE02UXA4UjQ2VXdVMDltTXYyRlhy?=
 =?utf-8?B?SkRoUTRlSzkxdlEzblJRSkhjLzFsVlVvRk1KVDVXZTlyaWM4M0lHZzB1K3VN?=
 =?utf-8?B?TGxXa21QaExJWTJkRlN0VVRmczBveFJ2K0hBYW9OMGdBdlpjUjZMc1IxS05F?=
 =?utf-8?B?NXZSK0VXWnY0RTgvSUdzaDYrcHhjWWUwNlhSMUtGc2dkdU1zRndWTUZMTy80?=
 =?utf-8?B?ckprV2IxUlBpeDZyRHN1MERPTUZGakQyRXJJOXZlNzVJclROWDVFZjE5L2Yy?=
 =?utf-8?B?ZEw3VGRldmk1dnVubXNtRWdCMnhYQXo4dkJPRUN5bkM1K2k2NjlUbEZXT21l?=
 =?utf-8?B?cGJPTlFJckNMRExZYmJvdW1Vc05tcndLMkszdDFKQzdaY01oaTZWYnVsRStY?=
 =?utf-8?B?Zy9XeVRlTEJrUDBwdG5yd3Z3anF3T3NrSkRSUnFKZHJwb05oS2wwWEFINzNz?=
 =?utf-8?B?SjZObHB0eE04RHpCV0owOTRnUHlNcUovVXRya3NFTUt6MTVPcW1aK0VWUHZC?=
 =?utf-8?B?by9ZMjBXbGdINEhxdmlHMTN2ekVOb3Bibk9sWU5VQzZidlZVdmk1M1NmbWd2?=
 =?utf-8?B?U0dPN2s2Z3J0ZjY5YUlXYy9qazBXOHBLVmp5OWxKWHJUaGs0SVluWlgzZGhO?=
 =?utf-8?B?SnpRWkNobE1UQ0N6d2J2Q29uSE01aUR5KzBsOWFYUUxwVkdHODIxdmxGRitp?=
 =?utf-8?B?S0pkRlNYNmdMeW9Zc01SbjJBSFlwd0FINGc1WE5KM21raWtZUFpXN2tNcVVm?=
 =?utf-8?B?d1JGU3BaNjZ0c0VSSFRpUWFjWWd5T25IcTBwOHZkUVNyL3Z1NUVvTHlxeUxo?=
 =?utf-8?B?LzhFdmpvU3RPNmoxd1ROTUQ3d29hNWFrK0UxMHViNGVXWXJIeHdHLy84YlhE?=
 =?utf-8?B?M0RIdm4ySzhPeUllMjFzKzFKWWtTNW5PUnZLR2FRNkNKNVJvS0Fjc3U3Wk11?=
 =?utf-8?B?SWoycnUxVDVicHpqd3h5M1R6L096S0lRTFdYR1JWbnJJS25FK01oQm9Pb0J2?=
 =?utf-8?B?SkxxRUI0U1BGZTRhV2UzRHcyU0ZoVWxtZU5lTTBDYjVZeitvRkRQQXl4SFZN?=
 =?utf-8?B?cXIvWW1PYlhGa1JkVVRwWmN6SmovODU3aWlBRE9MV0dXc0luc0YxbTR4dEFX?=
 =?utf-8?B?ZFJHeGhkcFJMV2xCQ1QvcGU0OFNEc1h4bDRlR2xxQmFMNkZGTCtNcEhwRkdu?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_96B7D1B1-039B-4AE8-B7B0-7608FC895A12";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27adfd9f-6d13-4d56-630b-08dac28f3e44
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 20:16:10.6503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HjSanTrJ+g3DwEXmCCck9ZEGnj7mIBsI5SBh5vutvXMJYvWMyRFDXY3ynPmaSXhXxEwrixv3b63SsV2Qjy9jMY3QTtePzPO2fa53rfUNoOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5178

--Apple-Mail=_96B7D1B1-039B-4AE8-B7B0-7608FC895A12
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On 4 Nov 2022, at 05:01, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 03/11/2022 16:36, Juergen Gross wrote:
>> The code generated for the call_handlers_*() macros needs to avoid
>> undefined behavior when multiple handlers share the same priority.
>> The issue is the hypercall number being unverified fed into the =
macros
>> and then used to set a mask via "mask =3D 1ULL << =
<hypercall-number>".
>>=20
>> Avoid a shift amount of more than 63 by setting mask to zero in case
>> the hypercall number is too large.
>>=20
>> Fixes: eca1f00d0227 ("xen: generate hypercall interface related =
code")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> This is not a suitable fix.  There being a security issue is just the
> tip of the iceberg.

At the x86 Maintainer=E2=80=99s meeting on Monday, we (Andrew, Jan, and =
I) talked about this patch.  Here is my summary of the conversation =
(with the caveat that I may get some of the details wrong).

The proposed benefits of the series are:

1. By removing indirect calls, it removes those as a =E2=80=9Cspeculative =
attack surface=E2=80=9D.

2. By removing indirect calls, it provides some performance benefit, =
since indirect calls  require an extra memory fetch.

3. It avoids casting function pointers to function pointers of a =
different type.  Our current practice is *technically* UB, and is =
incompatible with some hardware safety mechanisms which we may want to =
take advantage of at some point in the future; the series addresses =
both.

There were two incidental technical problems pointed out:

1. A potential shift of more than 64 bytes, which is UB; this has been =
fixed.

2. The prototype for the kexec_op call was changed from unsigned long to =
unsigned int; this is an ABI change which will cause differing behavior. =
 Jan will be looking at how he can fix this, now that it=E2=80=99s been =
noted.

But the more fundamental costs include:

1. The code is much more difficult now to reason about

2. The code is much larger

3. The long if/else chain could theoretically help hypercalls at the top =
if the chain, but would definitely begin to hurt hypercalls at the =
bottom of the chain; and the more hypercalls we add, the more of a =
theoretical performance penalty this will have

4. By using 64-bit masks, the implementation limits the number of =
hypercalls to 64; a number we are likely to exceed if we implement ABIv2 =
to be compatible with AMD SEV.

Additionally, there is a question about whether some of the alleged =
benefits actually help:

1. On AMD processors, we enable IBRS, which completely removes indirect =
calls as a speculative attack surface already.  And on Intel processors, =
this attack surface has already been significantly reduced.  So removing =
indirect calls is not as important an issue.

2. Normal branches are *also* a surface of speculative attacks; so even =
apart from the above, all this series does is change one potential =
attack surface for another one.

3. When we analyze theoretical performance with deep CPU pipelines and =
speculation in mind, the theoretical disadvantage of indirect branches =
goes away; and depending on the hardware, there is a theoretical =
performance degradation.

4. =46rom a practical perspective, the performance tests are very much =
insufficient to show either that this is an improvement, or that does =
not cause a performance regression.  To show that there hasn=E2=80=99t =
been a performance degradation, a battery of tests needs to be done on =
hardware from a variety of different vendors and cpu generations, since =
each of them will have different properties after all speculative =
mitigations have been applied.

So the argument is as follows:

There is no speculative benefit for the series; there is insufficient =
performance evidence, either to justify a performance benefit or to =
allay doubts about a performance regression; and the benefit that there =
is insufficient to counterbalance the costs, and so the series should be =
reverted.

At the end of the discussion, Jan and I agreed that Andrew had made a =
good case for the series to be removed at some point.  The discussion =
needs to be concluded on the list, naturally; and if there is a =
consensus to remove the series, the next question would be whether we =
should revert it now, before 4.17.0, or wait until after the release and =
revert it then (perhaps with a backport to 4.17.1).

(Jan and Andy, please let me know if I=E2=80=99ve misunderstood anything =
from that meeting.)

I have more details regarding the technical aspects above, but this =
email is already rather long.  Let me know if you need more details and =
I=E2=80=99ll try to fill them in.

Thoughts?
 -George

--Apple-Mail=_96B7D1B1-039B-4AE8-B7B0-7608FC895A12
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmNsCnkACgkQshXHp8eE
G+1/ogf/aMnlFUATa4jp5NKlUuzPrgqGA3d2mPI0i5kkSoukVXYtTkn9aEYhc5Eb
f1Ab7uKTGcxO+v9DmtF66GvWCi8DR6kBBAwyACKMNbGNpjCG6y7B7R37Eubbx2/D
rrOQVwoRSXMW9qsOunna/gJcpemmbygCdL3dqlQTUTk+Vtasyz4GlQz/YSvKEMfB
ViRib2G473Gi47kOOz1PCG0qIW5SEsgQarpK9Bas5vro7yCGNh7kHwn7j/UfHBYt
ktLkXfpPDf8nh4wEuPHaxSpXVjWkvXMUS1RC3aGAawZlPVQK2yX+dynQpiC8n2XF
WF9nKjpMzfT/PfqApXHvkb0yNH5kqQ==
=nuN4
-----END PGP SIGNATURE-----

--Apple-Mail=_96B7D1B1-039B-4AE8-B7B0-7608FC895A12--

