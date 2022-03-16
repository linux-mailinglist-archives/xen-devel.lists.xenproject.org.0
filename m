Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF34DB0C5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 14:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291187.494060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUTSH-0004z2-5o; Wed, 16 Mar 2022 13:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291187.494060; Wed, 16 Mar 2022 13:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUTSH-0004xB-2d; Wed, 16 Mar 2022 13:12:45 +0000
Received: by outflank-mailman (input) for mailman id 291187;
 Wed, 16 Mar 2022 13:12:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsrA=T3=citrix.com=prvs=067c1f106=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUTSF-0004ne-IG
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 13:12:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c15357ad-a52a-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 14:12:42 +0100 (CET)
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
X-Inumbo-ID: c15357ad-a52a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647436362;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qgrN9qCKWRTkoyS+nzaFnibP3J8EdIgeNnMadD/71Ds=;
  b=ia/KfAExTG1gUfXmQUCaxUoPBxUkV7hguBt0rZ8hJLIZPoP2xW4zl61v
   15IZ07sXlZmfwGmcHRhOtXq6k0qWvy8a5LR9CfLb231Rwc915K4/fR0ym
   Dd2G6Qxa5JyUYmM2S/+66ujNO9OUqoSurLTsDn8+hgJqrvktSxcps+YF7
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66786621
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1WbIAaLulylpYNfIFE+Rw5UlxSXFcZb7ZxGr2PjKsXjdYENSgzMGz
 zAWWjjUbKzeZmXxe951Poy2/EoPuJOAn9VmS1FlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dc22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PVSu42oFkQvB6CSiNhFUxBEQjMiJYQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6iBN
 5RHM2MHgBLobyF3eUczIY4Es8zy2SL7SB9mgm+UnP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJwDOMr8F7OzJPZvRalXmgNUm9TNMQP4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud1IWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 yBsdy+2trxmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8iex04aJ9eKWazO
 ic/XD+9ArcIZRNGioctP+qM5zkCl/C8RbwJqNiJBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WlO3iJq9FPdQ5WRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:dl3bCKPpaavgeMBcTvmjsMiBIKoaSvp037BL7TEWdfU7SK2lfq
 yV/MjztiWE7wr5OktQ/OxoUZPoKRi3mPIbj7X5W43SPzUO01HYSL2Kg7GSoQEJx0XFh5NgPN
 xbAtFD4RnLfCAK9reBkXWFL+o=
X-IronPort-AV: E=Sophos;i="5.90,186,1643691600"; 
   d="scan'208";a="66786621"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGk2dEFTltuIfXC/1rmSvKXkFgFxHOj/dHjDrqSFWob8rpePbV4eoQNJace7r3VUld/5SJfelwhaFhmd5j29XD8a1dIgNQtcFIUiydq5wUzmdC3/J6YUH0MQddxWK/Ajja7GMMisqARWQMmEs7Z31Dkg8VwhfxJtLcnnBc6XsxjXAmnBIZA33XqgS+KLlPWHwT2unnpNWtY2unTON/H4awKQN4ms3h0b4zt4ZZ8w32auS7GEY2zYBc8l1Rs5AXyxc325ugPQhn7/IJLMISzto2MLvR/yETDqaeMTJ7Tt27FM7MGZaGBs4p1QcDnQ9LCB95S/+ulaVEmh2k1+i2TC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgrN9qCKWRTkoyS+nzaFnibP3J8EdIgeNnMadD/71Ds=;
 b=DOYEF3ARPmFR+EivePPZG3ssMl40Wueg0nbsA0OcgmUKJ47gYoq8Ol3dZ+YC/klHLjQZ2UXkoyajZjcyz0V8t1M7Mq2q76Kjjwd97368O20qUvsfzdX21b/jSz3e9+5YM9qoJc4K7nATGKNtU6tHYOnd6yfpIRIQ74WoinT5ybfBsFidPCxfQisnV8dt9pmFdL0gt/rFBwSZ20XXdXr0Mhs2cY/7ixZo9/HTRoQrCACfwmjVCJ2Y0SRleGnp60od/DqVOI8X7vwrE4rcOudDHlZaldx07vhwtibQJp8Ex3pqFhtN4Qpfv0lYJK2SeOCUhJFZgBEpYm0d+bnhlK+kOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgrN9qCKWRTkoyS+nzaFnibP3J8EdIgeNnMadD/71Ds=;
 b=cMOCGDlROqy06tCRnb4fMBJPJhxAixSwnKVD0M59eEL8gOEleZ3eYVtqqje7O/KQoYKry20pUyXis1wK6rHGSXDrJgs3o5NeVlG49vsMbl0dD+mKrhI7Dqu0AsyIb6OX9Xx30hT4wdo8HaszZcvycDf5OGdOF/INuqIXvvpOMzs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86emul/test: correct VSCALEF{P,S}{S,D} entries in
 predicates test
Thread-Topic: [PATCH] x86emul/test: correct VSCALEF{P,S}{S,D} entries in
 predicates test
Thread-Index: AQHYOSLNg3H8C77Xb0mvzMc8RyaswKzB/LuA
Date: Wed, 16 Mar 2022 13:12:35 +0000
Message-ID: <0dd4a4cc-cc8a-9c7c-e1bd-28e947b5b037@citrix.com>
References: <cadc8c33-5310-ed9d-69c1-96e41f266b39@suse.com>
In-Reply-To: <cadc8c33-5310-ed9d-69c1-96e41f266b39@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d53b709-62b6-4de4-e7a4-08da074ea363
x-ms-traffictypediagnostic: DM5PR03MB3306:EE_
x-microsoft-antispam-prvs: <DM5PR03MB3306ED989EF8FD671AAE85C1BA119@DM5PR03MB3306.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pytsY4E15+ttDzuWGtrlJU9fDiHBxVcwrW/PzoHgrqebilXxFI0oQnmZGgL0QaXIsMpsY00UHvsEbPWoRrT7uxomiWJUloqF8fIk35/B2drb4LeKaKU7fX22LzQbsJ39s6sp7dv4U9E5iwVBsXVf+wZlJIWCUh0OgcIwkMpH07WgR91HLNF2Uepx70qqZXqBdoaFGQU4yK0J4/QbB/hrGk8z9LyU75nrAx34VhbIXsRWnWRQhJ44tDgFDxySWhdgvT/h8aQcP/er9JVz/Q5IG8659v6p8Jf/6cClEWQdN3uS8qhRfp7sduXZ4TtgNpGvyAqRRA3VVU5bQ+jrzVJ6lhOQw6m+roVt2OjPDlqBAJ/u6oKpMR5mUkY+GFbnKSIJti+HIaf3DZqdN4us/g8DaosYrvyYPGcIy7rKIPm9rtamFoj5h8PtrPFwhy8s4hgTIPBw+D/ghXTblR2t9QEOPqFxDzAD7cO3cS6zE4khf8hvbq8pFaLO3O0/Rh35gQwxJMaF2KUr4Xa0teSkHnyaB8zlLKiKjbmCGqI0TSYGvM9EBWABltKCR/nBd2SxdREI6LuA5VCeH/Ly3m77caOtxl5RRjSIlsqXdIRkjC/Pp+KgewYJ00N9QShQ7fcnzaYyVplBdaZ8qfO/SuRFI+X9Yisn/OxIm/dH9ENAJ+m4Aox2qBHw+UU+7xr9MyPToD7/mzAUzeQfCr8bTehOn6XQBjfeMH09gIiws7Yw1yGEJzleHT6q/WXyfUekVy2ih3K5zOz0pfb8dfdWidae6FR+tw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(71200400001)(38100700002)(2616005)(122000001)(316002)(8676002)(26005)(186003)(4326008)(110136005)(6512007)(86362001)(54906003)(6486002)(107886003)(5660300002)(2906002)(31696002)(38070700005)(6506007)(31686004)(91956017)(66946007)(53546011)(64756008)(66446008)(66476007)(66556008)(508600001)(76116006)(36756003)(558084003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEhBWFlwMnFxcnlaQWNUZFRpczVpRitKM0twalRkMm5UTllpSmVCWlArR1lZ?=
 =?utf-8?B?M3ErUnlzS2Z2OGZYdXU2a0hza25sc1Y3NDhCMnZsRzEwNFBqaVk1d3RpNjlE?=
 =?utf-8?B?NlNWY1V2cGo0dEE3QVFwY3lhS0U4VHNNMnlzbEtzOTNaUnlFN256NDFiLzRi?=
 =?utf-8?B?NkZIbVhuMjRUL0IwYzU4bTQzQVduZXhtTzZRSVcwS0V5b0NDbEpSejI0VnFZ?=
 =?utf-8?B?OGtvNUN3eUgycVVFZVpBV2NXOGdOTVA0WWs2amR4YTdEMXVoVjY4WXFFRUtx?=
 =?utf-8?B?OTlUbjYzdHNCSkVmY1ZmS1BYdytuY0hLaDIrNXJGNzc3d1AxT2NycVRLY0cv?=
 =?utf-8?B?UXdENzBOcm0rY0JmUmJZRmxSN0NKYlVSTzFmamkvZlZxZXBMaXJ1Q3ZacFBP?=
 =?utf-8?B?YVhhTjlFczdGUXVlT0pIeHZQOThNcWU0Nzl0dzZiRmM3c0k3K1l4SzZPckhi?=
 =?utf-8?B?UlMzWkd4QXZveG1ZWm5ZUGJrOWZTZDE0bDcvUjFDNjROT25wZDBucDB5UzJR?=
 =?utf-8?B?OGl3MVBjSWp0Wmh4M2lzMlhiTFJoRks0TUdRT0dzSG5ybzFoNmlaelFLejly?=
 =?utf-8?B?WE53TWs2ZmtqekhvZXBsdDg2elRyTnVRL2hodG5WS2kzUytzaUk0VVVlaExz?=
 =?utf-8?B?cnNIWUpteDFzZUlVRTZwMEswQko4dVRqeVJINEZMS2x5SVBYQWs1S3ZUTGkw?=
 =?utf-8?B?QjVKaE56SkhvVjU5aTNtWEJUVTVXTG00QUNlMER0MnhJZ0J6SzFEdmtaYmtF?=
 =?utf-8?B?VHZUakJRaWprK0drUWVCRk5jcGE3dzlLMU9TampSdGpkWlp5c0JUbC9HaDVL?=
 =?utf-8?B?OHNDT0xyelVzeE1jR2o5MEhmVUg0Mi8rbjl3cUdNcDlQaXhJeWM4cGVpb0Jl?=
 =?utf-8?B?SlRmeWhWZ0dDSzQ0R1lacVhSTkwxSkFvTzBBckJXc0xWcXBuTDQxVkwvV0lT?=
 =?utf-8?B?ejdHQ3J5TE9mRk12ZkRwdlVzdzlidW1iNUs0RWQ2eW5odzVnQ3dhdmhZL2Z5?=
 =?utf-8?B?NEZjd3NtdncxaDVmNlBJSXA4Vkxmek9nd094MkhpNnNoWmhhbkpHZVRBbEt4?=
 =?utf-8?B?L0R4V2FyOE5BTnFvMjk0TzNRSHhCMk83ZFFYZTRSZGtwMk02WERaQUVnWGFF?=
 =?utf-8?B?TTI5OE1IQ3RVeVl3bTVFbXNSR0puM09NeFdMRStqSWZrM1p0N21LSHArVDZ0?=
 =?utf-8?B?S2NwaXRkRzBTOTltazhYOC9sNVZHRXMyMFlaT2twZCtwV1BWVzBQeEcySTRx?=
 =?utf-8?B?VGNPWFNNQ05LUzdLcUY5RWVpOUZialAzczRiYXc2NDBMUmdJYmlBRHRHby9P?=
 =?utf-8?B?cEpvK1RMeVFEWEZyZW51eFNWTUx1QUROVnFQNzdQTGhzSDlSS0kxZGlLMG1I?=
 =?utf-8?B?azErNmM2YkcrYTlYdkdranJvNXpXVC9wa1NQOEtmVmVneXl3Q01iZ2ZDaW5I?=
 =?utf-8?B?ZDJaOGVnWmZOMjk0ZzVyckZoQWR2TCtOT3E3d3dUNk1YYlorREVDWWs5bXRF?=
 =?utf-8?B?czYrRU1WdzdJandOa2xRTXNFcmhCcTFjS1pOTzBTZ3NFLzZORFF1Zld2VTUz?=
 =?utf-8?B?czNkcWMydUZlanVYQnlKeHJYdGdMMjZKNmlqSFNyd1M3QnhUd3NFMmU5R1pV?=
 =?utf-8?B?QXU0cnZna0JqS21ydURZVXRiaEM4N2tkeUpsR2Q3N1hqUnd1M2JrSGtpYVNV?=
 =?utf-8?B?dWNpeXBGelRUMlMxVHZCV3NnWGhaR25CWFIzNUpkbDRGMmh2eWJXRkdYcUNt?=
 =?utf-8?B?UmhmcFRaRm9MZlFPOUVKcFF1RFowRjJEZTkybVlvQ0haRFdROUpWOEZrd21h?=
 =?utf-8?B?Z1Z0eU9oWlcvUkQ1YjJHbUNieVhrVHRtZHRZOEE3SndyNktnbmNNS1dHWW9y?=
 =?utf-8?B?L1E2RzMzRndpdnBlWkJDYlUwd2JuNnMwOCtlT2h6NE5oVm5aWHJwNkxRQU1n?=
 =?utf-8?Q?MJI828HLyaTQHVDCVPycdznHBR4SMCzT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6F9AF8204201048AF4A2B1C91E24E39@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d53b709-62b6-4de4-e7a4-08da074ea363
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 13:12:35.5173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SVN9Cttq5ZUKYBbtPvpL/hwM+aByezXxmDIwZJAqQNAlRQ7L3SlYIRa0gOUUIVEnLNI8OHxJdlt12mgekvOw+ot/tVQvxDWgf6DUbS2Mox4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3306
X-OriginatorOrg: citrix.com

T24gMTYvMDMvMjAyMiAxMDo0MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEkgY2FuJ3Qgc2VlIHdo
eSB0aGVzZSB3b3VsZCB3YW50IC8gbmVlZCB0byBzdXBwcmVzcyB0ZXN0aW5nIG9mIHRoZQ0KPiBy
ZWdpc3RlciBmb3JtcyBvZiB0aGUgaW5zbnMuIFF1aXRlIGxpa2VseSBhIGNvcHktYW5kLXBhc3Rl
IG92ZXJzaWdodA0KPiB3aGVuIG9yaWdpbmFsbHkgY3JlYXRpbmcgdGhlIHRhYmxlLg0KPg0KPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkFja2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

