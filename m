Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8107139F7E4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 15:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138517.256409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqbsC-0001Pn-3s; Tue, 08 Jun 2021 13:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138517.256409; Tue, 08 Jun 2021 13:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqbsC-0001Mo-0T; Tue, 08 Jun 2021 13:34:28 +0000
Received: by outflank-mailman (input) for mailman id 138517;
 Tue, 08 Jun 2021 13:34:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRSi=LC=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1lqbs9-0001Mi-KI
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 13:34:25 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d00a3cd0-2dd8-483a-989b-281d37f7492e;
 Tue, 08 Jun 2021 13:34:23 +0000 (UTC)
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
X-Inumbo-ID: d00a3cd0-2dd8-483a-989b-281d37f7492e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623159263;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=sQSwTol2/uZCe0gs276S7RPn49SxJ7eC2tmlK1u5+Bk=;
  b=KBqLwfZmkJBQxUdX/IoKhBkbw/GJs1noM3WsMmmVZtg5kZpMqWRVLTUy
   Z3XC5VwTgGApFztbdEDDFtxsW3cVlTdemPhAvsLPp1OWmg8+X2JaVyA0y
   nlK6RsRUXN1lgUWtbG9mYc6Nj4B29Rdy1I3XFV4nPpFxZkwa5lwYO4rwW
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OFoZAir28eUXPJ7I0jbCBuuxNsu5GCF1IOvOINYp2YpWUEL6JRO6JVgsaOTL+hl/fnn35C34FR
 XP5NxnN5ruGMPC/3jU61yM3UtG95BO98gxMVpftgtVnx3mvDB1kKWUyHl616K7hqxTXMbvCJiq
 b+Y2Jr1fE5BMrU5oLgQF7NZvgegQB3qXyP87SqQEw1hDRHQs3ylxrAigQI6dmY8I7LVTWxytNs
 kp9gVZrUjP6KMb/ooYBYRGhm5b+S+upcL4MV4i58eJCsYEl5QWtUmRQEp++2ejTVQHV3/jesc3
 KbM=
X-SBRS: 5.1
X-MesageID: 45623121
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BWkdZKt6L+04Bi6Xy8Txx1cm7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.83,258,1616472000"; 
   d="scan'208,217";a="45623121"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrtKYwYT5LUJtO/CzcOdxAeIBMtRPjczFPagN/XOrFH/bor6mQX2pCjPh6K+4Aepeip7eYU+S/JeDyWREr+pllAi3eGO6D6NW6FJ4MD/nz3jmFabqrNfpfk3jkh2iZ40N1XJ8dTitvQfMNR6TFx4FpAbd+dNQDmStW/JhHqKMnGsJQ6CrYJLUN9FQz/hJlOeRvKEXT2kIIVwx7fzvdOojdG9DizjdRvu+Z/rHOXQ/ic1oYQ5aYDTdzc+A27pQy3sW3sZkBWCDxmIbmei+wuggUWllODnozaDIDUU55qu8BnMvTSAA1a3fa7J92awXF/ABPCeUEkecNpEBvof5VhbLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE6+oRxbKNJo7ZPKq1oHeK7zWBfy6gXm7RqYweJ1C1k=;
 b=YQt4gQq2wtA636894V652QEPnXX6yyLILFUMGsQRwRWMTJg89EQjmLacY1OTadfppKQls0yU8ZQLEiSe0IbNc54zD2fugsB5xp3+OmeQS7yUwtQ9xE//BF3D3z7mbFxVfom12S+aKZjlBHZALd75/F+Z/QN70DASPT8CflQjnbLRJsPIno8DgBRyv8SKlDCMBM09oVvG9qJwLBSFWH6pG/tg5b5d7vKdPIhWsSgUYTPIN4gsDTbHCS8vq2BoKjIjp1N033VQjmP1xT833bAdJDTQBm0AdJ0FtJkbS+Ja+rOfEnFDS9ueNixXzAHoi/7XQZ0hi6Q/J8Z9Ie6xz+kElA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE6+oRxbKNJo7ZPKq1oHeK7zWBfy6gXm7RqYweJ1C1k=;
 b=oA/MWuWlKYc+/MF6fugXGRArBm8W3K57jyftT7Rvk5f9CPnlJM/g8gRvaasoXlzq+1e6+0aWBTC9fu918wkOsZG3IYRfpMKgr4zUWp8TUGDUhZK3yLv2i5rwQWHMxVgkKZ+1AfXdZeh34CHEPeOJdzVijVcv1L5Q3pTUeI7vmes=
From: Christian Lindig <christian.lindig@citrix.com>
To: Costin Lupu <costin.lupu@cs.pub.ro>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 0/5] Fix redefinition errors for toolstack libs
Thread-Topic: [PATCH v4 0/5] Fix redefinition errors for toolstack libs
Thread-Index: AQHXXGLhcoHJqYzC7UuAEWyaYS0iZ6sKHS4A
Date: Tue, 8 Jun 2021 13:34:16 +0000
Message-ID: <09A8A6CD-281F-4D67-9228-3A7F3AAB6BC0@citrix.com>
References: <cover.1623155575.git.costin.lupu@cs.pub.ro>
In-Reply-To: <cover.1623155575.git.costin.lupu@cs.pub.ro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67ab263d-4ab9-42ee-b75a-08d92a821ce3
x-ms-traffictypediagnostic: CO1PR03MB5844:
x-microsoft-antispam-prvs: <CO1PR03MB5844EF2E13D12E225F5C0E96F6379@CO1PR03MB5844.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lUE+v2EBgTfC7sPUK1YuHN0/RcP2yPH3k2u0XyrUTcRMdud4UdF1AaNA62EQtHOfDuRzW3Ykl2fYgRieUxP5uQjqmADKjCKHL8pEpVVwP+Vv64+fhyF7UqF9m0SvCIfzwrxKgkaTMBP4KbKiqFYqSBQZJvMk2Ea00dRgyYhivD/0lWkNoA3WYaO4M2FKuCphN3/a/H0D59mZ0REkY8QoHwfCbrfVZipk2kzTy/Qtuh7Ub9XrjjcizhH8fd4cHlmRiat9adZXp7hCrhExKUmRI4+ijW+hNhhSGsUji52PKablVo4+zk0zHmfQtyhwjUdLyGCRC0oOmiKqdzUxPxGNsuvoxsfBfXuNhZFJvg1sd3ebrm1d68LpV8mCLNNZ8izTVLEEwSLwtKceHTobz7loQt5fn7dwPmFi5qSzF9OVUZbUTDA5WVH2Okq+ZkiVACXjPAOfnAH42+KOEKHH1XTELKo3dJm5KCHm6m5YYiCqpp3DWjoO7b2uSlH8LIHndBOFzVhwOOlvuTDlJW4TV8p67o0W2mrBt1vFunBSkNESCWsFwQRUY+CoGbXtXSSlgFzEAVMbAgKTntyKcz8CYAnq4LGs7OIrOQ7SnMxRbgaNDdWR+c2JWGdUKMOrQATDpSGhvtLDNg1r0Lhc6gx8VhbZmg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6380.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(26005)(53546011)(2906002)(8676002)(4744005)(4326008)(6506007)(86362001)(33656002)(71200400001)(5660300002)(498600001)(6916009)(66556008)(122000001)(64756008)(66476007)(66946007)(36756003)(66446008)(6486002)(91956017)(76116006)(2616005)(83380400001)(38100700002)(44832011)(8936002)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c/S8k+2QtBJ232Y2Ztb+ODA4Tx0Bi+N0Q5zXLaAwgGtL3WQ/AgrY5Htfrssh?=
 =?us-ascii?Q?WkvhAanx/nEkSYnm+I9GeFa+xRcR07+2OIKTyfIa2FK/jk8+u1a35QpA52fO?=
 =?us-ascii?Q?Ke1hnjDsYGn41CCAN5XJ51jL1Tft41A/tSBVzIJG2lVBK6K9794NY1qjmm6b?=
 =?us-ascii?Q?eFmbD24thrF+qEKVW1BuC6674yjX8AZK/zTS65fnff513kDFVryaXyBuIktK?=
 =?us-ascii?Q?5axQuxzVoIfq90O0ekWngkLMoC1RtUcrR8BDSs6G5PU4aBZKulhodqPbzoVJ?=
 =?us-ascii?Q?2nmjS0HO+5kMQwTZuBsI+ozejzILzcZ96IEtTZKNEf/Iqu6ZjrC0H7aDGilN?=
 =?us-ascii?Q?hdsv/eQOAjIAStsaP8+YFUYLww0iGbldO1l/x/5AvoEHdsnarOOlhD5CPt8S?=
 =?us-ascii?Q?x7TXAckMWrffu0Ub/YGWy9Z3dqXnplQmhB7ea3u9YZ0ybiWyPngkM00JFk7a?=
 =?us-ascii?Q?IzQSlGPRhezmkzKuKA5ulCQGJ7Ud4v6r/eu1I2qUUPCYsPGzyhcF+/Kjv++7?=
 =?us-ascii?Q?Xx9ZBWJGPEJj3gYnCGZZeler71wWYt3EZw+neubPzjNlyDzbq/AejgRpYLbD?=
 =?us-ascii?Q?ra28JQyB96jXdlP2p9q6qsVYfhTWa6UPgjw0RmqlX7oSpLkJqkgMzuCJ9htd?=
 =?us-ascii?Q?nqUSctv9dZ2vl24KPqMVA0mNGFjKjjkFZ1sovVUmgcud1BQQfKrxiC63hj8a?=
 =?us-ascii?Q?yVqXzb3O+laokBT345sNuHtzp48RjFpiBcu3frFFkgDYFh4ukKgggo6YN6Ky?=
 =?us-ascii?Q?QCi6n8/uvhLGwpCr0P2ospJ+YGLdnpjCaWOBrbOz1/8I97llmzV+e3cyu4T7?=
 =?us-ascii?Q?nxuuHF50btEO4lPBCcf1CnNvDaRHmWOWShEhDU8duk5Yn+bewRirDRUizNCL?=
 =?us-ascii?Q?cUxy1GlCvaDnWIELFMxOcJVNtB1liwTjAn5yqiD8jsl+eR48KTjqNr85BJsR?=
 =?us-ascii?Q?RqclojNe1lKjbNXZTU8cxfG7jR2HtE1dALx6hNmXp7yyFcmMNwvPuA5sJP2s?=
 =?us-ascii?Q?hXJW41WNgtSURY1cBzhPziHg2NOef6RnTpf21CiaDGtvsqSaiEnb3nYkntxO?=
 =?us-ascii?Q?VImqPaDz/wZpm6lW7MCl+5hWrDaWEqtPWEV4h9o7Uw+aA5qfd24nL+FPzPut?=
 =?us-ascii?Q?Ty3ZhVbS9DtWvuuhSo9jfiYXLDF1jXpHd6GE1ob8cxHiu5BP3rpP/48b3/+H?=
 =?us-ascii?Q?W/90tM2nAXK6G7L9ROYStXEjpNKg8seULvhg5P1gtN3zAxCqsAMba2DGE/W8?=
 =?us-ascii?Q?jWRRuN9VsUe5DcVoxnDd+YQmsUFh0lGsUvMTYIIuOFJSxRkD3hsyckX/9gIX?=
 =?us-ascii?Q?U/mPSFQnGcC7efshrxJv0N0r?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_09A8A6CD281F4D6792283A7F3AAB6BC0citrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6380.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ab263d-4ab9-42ee-b75a-08d92a821ce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 13:34:16.6992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Q9/xVWf6mxGySaAhaUljMJ6dvsaV+77gRGe4EaRu4Xt7tJUxcUZyvwrIHvt98v8TWh3h54UBACNzDICGr9lrvHaetC2yRd4z19/j71KTJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5844
X-OriginatorOrg: citrix.com

--_000_09A8A6CD281F4D6792283A7F3AAB6BC0citrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 8 Jun 2021, at 13:35, Costin Lupu <costin.lupu@cs.pub.ro<mailto:costin.l=
upu@cs.pub.ro>> wrote:

For replication I used gcc 10.3 on an Alpine system. In order to replicate =
the
redefinition error for PAGE_SIZE one should install the 'fortify-headers'
package which will change the chain of included headers by indirectly inclu=
ding
/usr/include/limits.h where PAGE_SIZE and PATH_MAX are defined.
[..]
tools/ocaml/libs/xc/xenctrl_stubs.c           | 10 +++----
.../ocaml/libs/xentoollog/xentoollog_stubs.c  |  4 +++
tools/ocaml/libs/xl/xenlight_stubs.c          |  4 +++

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>


--_000_09A8A6CD281F4D6792283A7F3AAB6BC0citrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <D717B1FB498D9E45877FE03DA7FF935F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 8 Jun 2021, at 13:35, Costin Lupu &lt;<a href=3D"mailto:=
costin.lupu@cs.pub.ro" class=3D"">costin.lupu@cs.pub.ro</a>&gt; wrote:</div=
>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">For replication I used gcc 10.3 on an Alpine system. In ord=
er to replicate the<br class=3D"">
redefinition error for PAGE_SIZE one should install the 'fortify-headers'<b=
r class=3D"">
package which will change the chain of included headers by indirectly inclu=
ding<br class=3D"">
/usr/include/limits.h where PAGE_SIZE and PATH_MAX are defined.<br class=3D=
"">
[..]<br class=3D"">
tools/ocaml/libs/xc/xenctrl_stubs.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;| 10 +++----<br class=3D"">
.../ocaml/libs/xentoollog/xentoollog_stubs.c &nbsp;| &nbsp;4 +++<br class=
=3D"">
tools/ocaml/libs/xl/xenlight_stubs.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;| &nbsp;4 +++<br class=3D"">
</div>
</div>
</blockquote>
<br class=3D"">
</div>
<div>
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo;" class=3D"">
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Acke=
d-by: Christian Lindig &lt;<a href=3D"mailto:christian.lindig@citrix.com" c=
lass=3D"">christian.lindig@citrix.com</a>&gt;</span></div>
</div>
<br class=3D"">
</body>
</html>

--_000_09A8A6CD281F4D6792283A7F3AAB6BC0citrixcom_--

