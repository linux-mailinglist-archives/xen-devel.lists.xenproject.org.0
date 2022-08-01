Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3157D58664F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 10:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378557.611789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQjw-00056R-Kq; Mon, 01 Aug 2022 08:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378557.611789; Mon, 01 Aug 2022 08:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQjw-000538-Gq; Mon, 01 Aug 2022 08:25:28 +0000
Received: by outflank-mailman (input) for mailman id 378557;
 Mon, 01 Aug 2022 08:25:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=omD9=YF=citrix.com=prvs=20515f1b2=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oIQju-000532-Ax
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 08:25:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c523be0-1173-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 10:25:24 +0200 (CEST)
Received: from mail-bn1nam07lp2043.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Aug 2022 04:25:21 -0400
Received: from MW4PR03MB6539.namprd03.prod.outlook.com (2603:10b6:303:126::9)
 by SJ0PR03MB5648.namprd03.prod.outlook.com (2603:10b6:a03:288::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Mon, 1 Aug
 2022 08:25:17 +0000
Received: from MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::6502:2d3b:397c:f409]) by MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::6502:2d3b:397c:f409%5]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 08:25:17 +0000
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
X-Inumbo-ID: 7c523be0-1173-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659342324;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=EDumq/F4j2kDxbTVxuHmlBPPEpxoIkwKd8DOy7XJ4N4=;
  b=fKtqUOWjlmh4MALR9Xz6VQxJli+ok9mwJe7YpvBBcmzF3KSFG4qYq/Xx
   RdIbqoOj3/lSSIyK45BQO/zxBrxqExKx0+S1srtvpAtkn41M+drZ6kyoy
   +rhJswsCXchTmLHZtWkqyfv7uiJNWCrbaobFp1wNJ6lS8RLF8uLB25HZG
   U=;
X-IronPort-RemoteIP: 104.47.51.43
X-IronPort-MID: 76844071
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4fyC/ql4wr0JClXLEY6MOjDo5gyOJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeCDqBaKuJZzb1fYogOYnnoE4Du5+AndVgTwZtrCozECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk346+r4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kfO6EW2/lqGF0Tz
 u4qOiwjSjrYxOu5lefTpulE3qzPLeHNFaZH4DRK62icCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAB7g7OzUY0yzG7IAhZ27j3McHJe9WMA8FUmEqZq
 UrN/njjAwFcP9uaodaA2i3y1rOTxXyiMG4UPKWyrddbiWOI/DQWLiNOewuJgqCVp0HrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAbShZRZdpgs9U5LQHGz
 XeMltLtQDZp6bucTCrC8q/O9W/pfy8IMWUFeCkICxMf5MXuq50yiRSJSct/FKmyjZv+HjSYL
 y22kRXSTo471aYjv5hXN3id695wjvAlljII2zg=
IronPort-HdrOrdr: A9a23:4TDHsqBtpGmocjrlHegasceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEDyewKnyXcV2/haAV7GZmXbUQSTXeZfBOfZogEIXheOjtK1tp
 0QPpSWaueAa2SS5PySiGbXLz9j+qj/zEnCv5a9854Zd3APV0gW1XYdNu/0KC1LbTgDIaB8OI
 uX58JBqTblU28QdN6HCn4MWPWGj8HXlbr9CCR2SCIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijifem0RXRvlWjoai+2eGRi+erNvb8yfT9GQ+cyDpAo74RHoFqiQpF4N1HLmxa1O
 Uk7S1QePiboEmhA11d6SGdpzUIlgxep0MKgGXo/0fLsIj3Qik3BNFGgp8cehzF61A4tNU5y6
 5T2XmF3qAnRC8pDEzGlqf1vjxR5z2JSEAZ4Jgupm0aVZFbZK5arIQZ8k8QGJAcHDji4IRiFO
 V1FsnT6PtfbFvfNhnizyJS6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEB7e
 XZNaZjkq1IU6YtHOpALfZERdHyBn3GQBrKPm7XKVP7FLsfM3aIsJLz6KVd3pDfRHXJ9upGpH
 3saiIpiYdpQTOeNSSn5uw5zjndBGOgQD/q1sZSo5Bkp7yUfsuYDRG+
X-IronPort-AV: E=Sophos;i="5.93,206,1654574400"; 
   d="scan'208,217";a="76844071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqjIA5fmUEbiczMWqKSWffi1Vv17cd4ScP7FJ7kGR+XMelNQ1jX2NvszonPbCxNIUGK89R0mctGWN6YSnwuQkQXJ0cMZDszCegwsNv6nZVhUdsZyOZtuAv+KtWMk9Ymb+REcJmt1/RnHYnNKiUw/zRjIJrQgAbGB8CuX529Pdb/3A9/HK3E28BX2Hg8PdnU6oQWfWJ7abDvOMFbR9An0ZbKw7Fvh5J2KA9o9r7IvpV4Z0bfNgWd4wg7uASU08k3rMpT6xrW/NXkRn2iAxqvI1SbYiuiAZBNm4a0r+NmPvrjPA9JjhhK3naMOYmZ/BdV+8iefx2+r33nWc9orTe9a7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDumq/F4j2kDxbTVxuHmlBPPEpxoIkwKd8DOy7XJ4N4=;
 b=TuFubqoczLAo0Cgfx+P/nKbA2yq9Elm3XQ+GTmAULRJVfs5g+xXor56tW+SDxyNG51i62ns5IQDg+1YGXMwUmO9pjQCA6UEVUASJKoWMsjD2xPTTY2j2gvAi/BpToRe4voxzYIx/Dd8JwJPXLtgOiDzi8oMq1xd4ikqZ6TTbk8NRjzXsk4O2athWXSaBZWM8fNv93vy6cZpR3dsFtrIHZRifyo969SjVAJ4N+omn9KbobcLh839Jl1jlPmvsd12a1W2PR/nyXla+L4SafzmQ1/2wgxXFah8u5ySQJQquMRT6KTa9MDnvK8A4rib3ZLlLpqVYMVWdWHbbQ2vTIWQgHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDumq/F4j2kDxbTVxuHmlBPPEpxoIkwKd8DOy7XJ4N4=;
 b=FcTYfdNprfp5XOHHHf2/j21ToLLdDj4ajU8ks12FYGdmN4Q4F3PL3XspWC1FIJC5Om/kL1FtdXgh+crCitN2FFT9mmHm722tExDcIn9Hk9OHhGtPLcISqvfizUUX8Q/NGZl6z7PqgycP8TqpxmidkFpvxDrDbJaq+8xdAe9/UuQ=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH] tools/configure: require OCaml >= 4.06.1 for
 oxenstored
Thread-Topic: [RFC PATCH] tools/configure: require OCaml >= 4.06.1 for
 oxenstored
Thread-Index: AQHYo3ahzvPmBiaZf0yszYJQIeCpG62ZuYiA
Date: Mon, 1 Aug 2022 08:25:17 +0000
Message-ID: <EB6A8EB0-F9E2-47E1-B612-345D7CC95CCA@citrix.com>
References:
 <ac885ce2b63159d26d857dc3e53cf8aa63ae3646.1659118200.git.edvin.torok@citrix.com>
In-Reply-To:
 <ac885ce2b63159d26d857dc3e53cf8aa63ae3646.1659118200.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c8ab860-728f-4433-5894-08da73975daa
x-ms-traffictypediagnostic: SJ0PR03MB5648:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fAWWrT3pOYHDf1eb17cxt/hBNVPQA/Xqg9lanL5k+AJCom12QgJVXNfvKHqA7QE5EKVA1wWMUuAf+vACyBuEpleqgBK4RRW2Wu3/FXpPWu4erOX8H1xfbOWAByZCbq8q0PkhbHozrtiQKAW9SMKR0PqHYIWaqA50EqL0DhEi1yYYKHWpqi223r/n9tWDKsQxURLco5kdCszr/mHPGzbTxRHwCd35RFV0+S+duSs0R23J/N0Gpl6j3MxynCxflXp82xH6qbET0+CfcEVjVdy1SSu9YylCZv6s3vLb3j+7Nj21/LT11PKozGKdWq6Qh2GEAVlsagq6IKXuDY5QYRH/dHgujrt46aE/xcPlCKax74wmF7+nrdhc/54QaFSN0levf7iSOe3ShsG1gB7PIX2JfyCLo+5RqUy4b4Xeoh/C5f73IffP7jM/HshY9smVXMiyn3/t25tWbJi9kTKHk2/6IukOBbi3FkF1EzyBWJV5YqzFJiloBQGlQjXacXgMiwoAzoUVDu4R4UqWcQGL4Fg6/c3mAqdAgh+UXMsKkZ1JosVasYiic7haHz05Qnm5y3VZj7p/lsm32Tg8/gDE/CkbQfThSciS5w9GwTdUhHe8EssVMwnph1LmFnKTDBPerlLgtxQwUxdHjbGR6mXU5qj9ku2avOFiH0I7m/7nyhEdWN5QI5Y3BlAeBQsqzIwXO3XWRb+LLqU/hm7qNBWIUgUqkh1cb8+Sxk+Xr/PYetNjeXaVlOHUsFMeNeUk4VgfJ+LbMqQyGCg2fqdRym3vsYhZxZLgZyh+e9zt4nhyXmo4FBh7+HkqlI39SO49GHxKIvsqZWgrlBqcgsgd72ir6mfPXA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6539.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(36756003)(6486002)(478600001)(76116006)(6636002)(316002)(66946007)(4326008)(5660300002)(8676002)(8936002)(6862004)(44832011)(37006003)(66476007)(91956017)(64756008)(54906003)(66556008)(71200400001)(66446008)(2906002)(41300700001)(53546011)(107886003)(186003)(2616005)(86362001)(6506007)(33656002)(83380400001)(558084003)(122000001)(82960400001)(38070700005)(26005)(6512007)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmF6T2I4eVJzMGVHajdnTFdPZndzaFJhMzNYR1hXUTB6Mzduc2ZVRTV1aGFl?=
 =?utf-8?B?MzNseXN2Q29HTTdvSWNERGdnUW1CaUFFZHRvQlV2ODdUSWJld1k4RVV2OUhX?=
 =?utf-8?B?ODdwNmYxaTNmQ25Tc0VqTWNSWEZhdnJjdnZ0VW5HNHgrK1dmVHlhNkhVd2p4?=
 =?utf-8?B?clYreUVmTWlNM09aS3R0ZERmUmdVOGVvL0RNYWVORElEQ2VoM0JhQ1cveDkz?=
 =?utf-8?B?aklaU29nYzZ0ek90UFNEZko3dVUraFlkWVQxd3JhNVR0bWVVeGhDSWwxRHQ0?=
 =?utf-8?B?b1Q3OHpNWVdHdzlCTlBSbE1QajRDY2JNd29KelBxcmdkV08wUmF5dEw3M1Bu?=
 =?utf-8?B?cXFEYUE5QjJqbmk5dzlXdDhJZ3A3aDM5UThFMTlFTHE2NHFXRWtQZHJNRmd2?=
 =?utf-8?B?ZUhPbWV3RUwvOTBFeGcyRy9iVTk5L0FUMHNtR2pBRXJRb1F2WkxxZmo5RzJu?=
 =?utf-8?B?c1pQUW9hUlhyLzZQTGJqZUtHSkVGTFgzYTZSdU42TlhzWGlwbTlBeWFYZTVy?=
 =?utf-8?B?N0JYemFaSGV3a1JqdGxpMEx5UlNkT3hrVkVuQkVLTGtOQ05wNDdYaVIwOGZy?=
 =?utf-8?B?SnBMak1vSG55ajBFbFRidStBWmVZWWdNcEl0ZEloK1pVbUErbGkrSUtxTUdB?=
 =?utf-8?B?MkgwS1RucHhTaFRxNlJOaytudTlpeEc1amVwVVErRUJpY28rRUluNE1jaFNu?=
 =?utf-8?B?aVR3Q3NIelNKWUhhZUkxMWhqeXJvajZDMXJXNDBXeUFSTnIyVm1nSVlzb0wx?=
 =?utf-8?B?U05NUEZDZk5JWXNCV3E3RTFoMmxBSE9LV0RacXFBTlB3RUg4N1JpaFZSTWxV?=
 =?utf-8?B?RzBOUzlyUDZ3YzBRdXpwTjMrV21VZitmeHFRY0RkYndsMUgvM1dhVG0yeWZH?=
 =?utf-8?B?dUd3NDFPQlZ1OFdsS3Z4YzcxcGdNaG9WUkt1bG52enc5T2plcElCTGtaS2dl?=
 =?utf-8?B?QTlpcGcyK0c5VzVRdGQ1dFlDL05qSWh0Mi8xeTlHazRnUmxyS0kzeGg1bGxS?=
 =?utf-8?B?TzdabTNGS0k3aEo5MmtWVHV2VSt2dUc1RU5lUUpvNVV0RGFEWHZxc2phbkQx?=
 =?utf-8?B?VG9yUmFEZnpPUzRML2xySm96WnJ0VHliWW5PMXF5dFpYZ1diNjI1VnlYRG9O?=
 =?utf-8?B?emZVTSt1Rmw3djAzbHN1VlRSZkd2VUpRZGRZSU1lNDFRekxzYVNXYWk0RVJT?=
 =?utf-8?B?U0IyeGVzcnRUZUx0SDVyZ2dZakZRZDZmRmFlTXRyWVZhazNmZlRWVEdKdmV6?=
 =?utf-8?B?QXFldFZON3lGZk93a2pvL0pyZjd6MTMxM0tBSmR6TUt3R2xIRFJidkIyT3VE?=
 =?utf-8?B?TTZxdkxuWVZxVm16alN0V1lDdnZwd2tPRjdsZk52M2RlMjFrbkNLT1RJKzA1?=
 =?utf-8?B?ZDNqeklXRk9QU1QxSmI2S2llOERBd3RQRVJwcVh2TmFEd3J5ZXo1K1d4Uk5w?=
 =?utf-8?B?OWNlM1o0R2dhRFdGVmJXK00yUWVXR2xxN0RTSnhNWFM3RXQxS2dQNENIYmgx?=
 =?utf-8?B?cVdpTkxnTi9NTzE3U2RKZ2RCRUxVU2htY0JuNEh5blo2K29iRzZFN1E4RUlS?=
 =?utf-8?B?Y0Roc0JyNHJNMmExQTQxTHJWNXUxaWZmSmJleXVEU3hDT2VISm40cTg0eGhL?=
 =?utf-8?B?TDJaNkoybjJJeXlzSmc1ZnluWUFydFk4UWFyQUhIM1J6Smk5Ri9TT2cwSXZS?=
 =?utf-8?B?NDVqTm9ZSk84NDdoaXBhYXFWZWQ4N3dqbUZ0c3pRVmRjNVhwbGd2dGpNWml5?=
 =?utf-8?B?MHJ5MHQ4dlVNUlg5dENqbm9xeXBzalRTSElENnFSSkc3eFNmdUsrOGsySVFs?=
 =?utf-8?B?ZkhqTlhsK25WaEhUcU9oaTdUM3BjVjc4L1BRYkFoQUhCK2tlcFllbTBrdnZI?=
 =?utf-8?B?MkpZSHJ2ellYdUhnM1FpWUNMWndXUSs3RkloS3pQMWlnNFRIenVZTVBRaGtk?=
 =?utf-8?B?aDA5SW9Eb2JJQ2NXSWx0RVZBN0RaajVNdThlRktsVDEweit3YzEvTVBzUTMv?=
 =?utf-8?B?RHBOYW0yS2pkRjNoVWpPdi91eDlNamtBSDZmZG1ndDQ4UzQ5NmtDMGZRVzB0?=
 =?utf-8?B?WUhqbVdxaE5ydkFXd3ExclI4eGRPellVdE91d2J0ajdkOGpWUkJMSERyRjFH?=
 =?utf-8?B?UloyWm5LUjdzd3AvcmEvWjRSaXhMUkZIRFl2MHYwRzBmZyttL1lUZ1NzWklo?=
 =?utf-8?Q?yHznfU/sfKs9qeGucaZF8/o=3D?=
Content-Type: multipart/alternative;
	boundary="_000_EB6A8EB0F9E247E1B612345D7CC95CCAcitrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6539.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8ab860-728f-4433-5894-08da73975daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2022 08:25:17.4891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nhSPczdBcKmx/g3wIbTRZu4Z2aSxaaLcJeotaZMZiAuGjmUnn483U5LsEiOy/c3lotVcuN96/Ggkq/qHsmi08oDOo48a+cSvVS0h6voWNIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5648

--_000_EB6A8EB0F9E247E1B612345D7CC95CCAcitrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDI5IEp1bCAyMDIyLCBhdCAxOToxMCwgRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tA
Y2l0cml4LmNvbTxtYWlsdG86ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4+IHdyb3RlOg0KDQp0b29s
cy9jb25maWd1cmUgfCAyICstDQp0b29scy9jb25maWd1cmUuYWMgfCAyICstDQoyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KQWNrZWQtYnk6IENocmlz
dGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbTxtYWlsdG86Y2hyaXN0aWFu
LmxpbmRpZ0BjaXRyaXguY29tPj4NCg0K

--_000_EB6A8EB0F9E247E1B612345D7CC95CCAcitrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <8B90F8D2BB07CD4BA246A355D89161FB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDI5IEp1bCAyMDIyLCBhdCAxOToxMCwgRWR3aW4gVMO2csO2ayAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmVkdmluLnRvcm9rQGNpdHJpeC5jb20iIGNsYXNzPSIiPmVkdmluLnRvcm9rQGNpdHJpeC5jb208
L2E+Jmd0OyB3cm90ZTo8L2Rpdj4NCjxiciBjbGFzcz0iQXBwbGUtaW50ZXJjaGFuZ2UtbmV3bGlu
ZSI+DQo8ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDAp
OyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5v
cm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVy
LXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRl
eHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBw
eDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7
IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNzPSIiPnRvb2xz
L2NvbmZpZ3VyZQ0KIHwgMiArLTwvc3Bhbj48YnIgc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwg
MCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHls
ZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBs
ZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBw
eDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2lu
ZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjog
bm9uZTsiIGNsYXNzPSIiPg0KPHNwYW4gc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7
IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTogbm9y
bWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXIt
c3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4
dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4
OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsg
ZmxvYXQ6IG5vbmU7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyIgY2xhc3M9IiI+dG9vbHMv
Y29uZmlndXJlLmFjDQogfCAyICstPC9zcGFuPjxiciBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigw
LCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0
eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7
IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDog
MHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFj
aW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9u
OiBub25lOyIgY2xhc3M9IiI+DQo8c3BhbiBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAw
KTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBu
b3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRl
ci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0
ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAw
cHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25l
OyBmbG9hdDogbm9uZTsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IiBjbGFzcz0iIj4yDQog
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKTwvc3Bhbj48YnIg
c3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7
IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczog
bm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFs
aWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRl
LXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdp
ZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsiIGNsYXNzPSIiPg0KPC9kaXY+DQo8L2Js
b2NrcXVvdGU+DQo8L2Rpdj4NCjxiciBjbGFzcz0iIj4NCjxkaXYgY2xhc3M9IiI+DQo8ZGl2IGNs
YXNzPSIiPkFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnICZsdDs8YSBocmVmPSJtYWlsdG86Y2hy
aXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tIiBjbGFzcz0iIj5jaHJpc3RpYW4ubGluZGlnQGNpdHJp
eC5jb208L2E+Jmd0OzwvZGl2Pg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4N
CjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_EB6A8EB0F9E247E1B612345D7CC95CCAcitrixcom_--

