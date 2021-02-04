Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9535E30F122
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 11:46:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81228.149686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7c9Z-00073S-1h; Thu, 04 Feb 2021 10:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81228.149686; Thu, 04 Feb 2021 10:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7c9Y-000733-TE; Thu, 04 Feb 2021 10:46:24 +0000
Received: by outflank-mailman (input) for mailman id 81228;
 Thu, 04 Feb 2021 10:46:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jl0U=HG=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1l7c9X-00072y-33
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 10:46:23 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d1bc1e8-05ed-4362-be27-3a92bc487383;
 Thu, 04 Feb 2021 10:46:21 +0000 (UTC)
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
X-Inumbo-ID: 2d1bc1e8-05ed-4362-be27-3a92bc487383
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612435581;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/NewM2VVKP3hcHJgOQAKw5LUOopwqm1DLlrgJC/ccOo=;
  b=ZsKVXV6TAzw5V87+R4RL/4DRVUfbxvms9Ed6L1gGmY1xHzUQhoGbAdrK
   zS38DZQpAqVbORb6dU1GRdQWLb8bft62yQzHXBA0VcQXeFf727r15aij3
   8BDgV9WfkC0NBSjVr/TVAg+AGBkH4RtnsI5cBak7ypUdxl4CYkBHKE3bd
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dlS/zBTk2qDV3uXF8ruq52Zjz9m4M5iKWb87UosRj1yEYGpQNas4lexstT0MCHZej+64d8Eyg1
 r3cB1r/EWngLANEwCAm1CX713N81v9soPjTfJz/2ADUVWI84y+bLw8OchBMaagnLPuvX2L2/lh
 NaGUvTsf3A4jCaWyc4FF+/l9hceLOidEFcX37gMi+R+h2G42cqPwHr07nbZOVXjLCAPldA6Pl9
 vUnELYTVAhFQ+5G31N0mOst5OQlte1td7c7b8W7X64rvwfXfwdgKQ6Rgr5IuGxmgQnZfK1kTCV
 ia0=
X-SBRS: 5.2
X-MesageID: 36919768
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,400,1602561600"; 
   d="scan'208";a="36919768"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zj4hZSAMQ4NrmGa5JLX9Mdh0BN6fW7H7eeR0GUllot1eSAsi0lYF4oICrhkV1RemRE89kOKi/Vv8mtthXzfva2ysPB4zruxexQuGNUVG4kSVwfNm1MzJ+YMIZhh/IfrpeIdu2uOVv6jPoIOYTmUUgmN7FTU8dfCfOePpi5p301wsGZBQwQh1RnnnYW0pjkPBGJrIXW0qsDhEPg3049QhQJ4nhR4T3ESi9AELkVcZblxq8/6DguVIpmPAUHVsE8EzAk/sXMUhXpfo6TwIZpsRjEVJ+xjGfkFbMLaxagXGMybiBJ53gJS8eEj34swptan0WVelDf7xWVsM/9aZXDaGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfDk3QzAsOePUuwSbNMBLSPc+que2ymKyfD5YuUyz5g=;
 b=TYZBGXuEzwZDhteZvb2tdpNqFQqeBvkayEntAXsqertkfW+SQQA2ASz7PGrC9S2XQqp+jWmmspgg6hWrKKYEdQqjJ129Lchq++jPrz4Yqoqug/dQvdkSheIl6loCxMnE9SwShDk6MZVlycvvl2gUP7+H0z60binCpoOMtZp2qSN+IYq5lYav0YSz3E/9NddY5EXiVZy4iz6zbtwCx5ba5GbOMWtjhExOKbFkhqg/0GWpvEFkxaQjTM7MvJ5sIxYIyNGxaKhZWsAb0iPrNwrTyXlzhpmW1GzFq9ZC3zFmGPPmCh7MCoY92iOZ0HMUNUbeabqxMipLtFpqUIUjnotUZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfDk3QzAsOePUuwSbNMBLSPc+que2ymKyfD5YuUyz5g=;
 b=wD3CNRmQQgcmBvJUN6IFGZzJd7P3FYrcBDMkNeMIsvjhiVLQLghVYLtewgklfGVUjjrex2rwe/mt9ckKIZC+Y4e7nd39MSNN/kZoaSrKESQdl63CmKVOL6uAt3/lx8+GKcnyulF3Tee8Dcl8ROWbr6/y3YsCHMa30F11mF15NOA=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Edwin Torok <edvin.torok@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15 0/3] tools/oxenstored bugfixes
Thread-Topic: [PATCH for-4.15 0/3] tools/oxenstored bugfixes
Thread-Index: AQHW+lMOjXsd9xiVCEyL7uf9ydPmOqpH0O5D
Date: Thu, 4 Feb 2021 10:46:15 +0000
Message-ID: <MWHPR03MB2445EC99795584AFB0F6D7D3F6B39@MWHPR03MB2445.namprd03.prod.outlook.com>
References: <20210203173549.21159-1-andrew.cooper3@citrix.com>
In-Reply-To: <20210203173549.21159-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 308e6dc2-9886-4ca8-785c-08d8c8fa18fd
x-ms-traffictypediagnostic: MWHPR03MB3184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR03MB3184D3288CFAA85C415C6BEEF6B39@MWHPR03MB3184.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YwPXZrPPi+efmA3I12qtDxsoHqIJ3tXHetBw9+HshFRhEVqCYqC/fwYi1f6rRyo56GC1Ychz7v/ya2zioKXKXkNVrcU+m1JEdEeA/AxovcssJXXrnLuK1YMYzK5iw3WXMA5pmyYfh0NGfAk4PrL0RYR4QphsoaOi3L9/obEaut+tmcG+qSJRSkS3D6ZG6emZYriaISJVv5HHelapn2LQTKalnHxdk++ZFnol2pavGu07reQGTb5A78wGYOhzY53oqNsJuCRkmLwEjDilSpnQ1esFZJhGQTKPcKKLT+FmcYS5is8F9iy0qxZsAqRpPMoRueGf25Bwowo/5kz08dYQ0tAIODOrzZTN86IeXiVK6KMdlpb8jq+uRzgzhHysefiVjucJiXjuDaHk1djJ9sUZOIjsLIr+t/UTXeY5XhzqQ4OYX7N+R7afPx8M5oLSbhzXrZtGTghkHE1fLljaLn0SvfWqw76LNRiEDyfaAymj6OENeAwTUr/wLVX+Gj5j4e4o5qIQX+23AACtP2kqYkoJ9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB2445.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(4326008)(478600001)(66446008)(8676002)(76116006)(7696005)(86362001)(66556008)(186003)(53546011)(6506007)(64756008)(8936002)(2906002)(66476007)(26005)(66946007)(71200400001)(5660300002)(33656002)(110136005)(316002)(54906003)(6636002)(83380400001)(66574015)(91956017)(55016002)(44832011)(52536014)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?OMr+gGPfU3tsSzQFLiyGjdC75nkr7ccXoTKaWZgxQBzgPZtLaBEwSCWNcM?=
 =?iso-8859-1?Q?rBBYSDzPO7X50SGYrMgM3+Xhl4GeSI4uk3T4vRXO3xGNyp+8kfneT2Ntwq?=
 =?iso-8859-1?Q?Y7G110y+sjjyvXNZeV3yzgxufZy8zcAk4lt08I/n23VaFdML4KP2aTdycG?=
 =?iso-8859-1?Q?xL92YJYJpXz6Vnlq69jzpG6YyjBAGEVxZE9SY+g64bYrT6jfnMgygHdw2R?=
 =?iso-8859-1?Q?B96N9VGFvkHS8ViP3elcuVQouUo4eGxQ2bYxwf9OWKXuUiTAh0CrFo9koJ?=
 =?iso-8859-1?Q?cTxctU9waVHxv9RhkwmZHsp0JZQCLzjWBi6xuZBb5sjGFPMJ8oZZfJYH+B?=
 =?iso-8859-1?Q?RUwLr9a/bnHG3rn9yPIoM9MCNCedFnMRt+kxSgqB/l+MeFHpUS2te647pn?=
 =?iso-8859-1?Q?8lRgLbk5msuBLCe8pIISuJewpHcsz+St7JAWu7chU/ZZNTjaFKtpMVcZOQ?=
 =?iso-8859-1?Q?r1fnRaLQY120gFmeQQL+EFvRpLhhdKTEipYFZB3Eryh/YMyc+HWlj8SsYm?=
 =?iso-8859-1?Q?OZYVc+wgogzly/5Sd3ydh8rupsODgVUdHmAylP/r9w+SbOer4XHb9Dd4fb?=
 =?iso-8859-1?Q?hI09QBVXN5jR+vnEJFuH0Ixg+IZvv619uQd+N5Mjc1KkoKXr1EjpbsWrZe?=
 =?iso-8859-1?Q?Nt/YrYL01pAu+4K+Nr2C13qhUGra5lhv3uvZS9rhMTkdLXTEueq2Zn9wCj?=
 =?iso-8859-1?Q?UiiYlWngNZk2cQPlTO/q0tnP9cEo2tV6UBYw6eVruxH2FedzDJNv2S6dLD?=
 =?iso-8859-1?Q?MaHFLWsNGiNW1CZFUBbVAautBwQZx0KfPpKFwy9VAI+HUbemQ9Qo+Y0dQr?=
 =?iso-8859-1?Q?3cJiFQQcIDByxgO1cVZLT8eE5lBHi3jfERI1CgkzmUfBOn7HUUR1OyFEDs?=
 =?iso-8859-1?Q?tTcYyZX7rj/JkCJwlqdEWX3jNeKGtIDjN4LNKnD4DIZ20C6GyI9cFSWuFq?=
 =?iso-8859-1?Q?Bi8jPhYtoZuE3mLlBSv7B6uR3hs3pj+hNHChYQ4whnT+BUM/JI/XS9IuCc?=
 =?iso-8859-1?Q?CP+hsnh3DM/poPcCDQNRajfV1BHTk9CEYH24vu9O9QYjTEr55hN1bF86zr?=
 =?iso-8859-1?Q?oNFeoIHrbxcGS17BTkJ0oyXNq0Am37dQW32mrl5ArLBP?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB2445.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308e6dc2-9886-4ca8-785c-08d8c8fa18fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 10:46:15.8564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G/eNm6WFNoreA+Y0J3a+u15CqKvNSsDEK+Ne7yD3SwLt7GGS+0he/fHEUhXnR+2k9anvRNl/qwRifCAJAeu2aO/GDnYaPMrITHqeDuBNB/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3184
X-OriginatorOrg: citrix.com

Acked-by: Christian Lindig <christian.lindig@citrix.com>

________________________________________
From: Andrew Cooper <andrew.cooper3@citrix.com>
Sent: 03 February 2021 17:35
To: Xen-devel
Cc: Andrew Cooper; Christian Lindig; Ian Jackson; Wei Liu
Subject: [PATCH for-4.15 0/3] tools/oxenstored bugfixes

All of these been posted before, but were tangled in other content which is
not appropriate for 4.15 any more.  As a consequence, I didn't get around t=
o
committing them before the code freeze.

They were all found with unit testing, specifically fuzzing the
serialising/deserialising logic introduced for restartiblity, asserting tha=
t
the tree before and after was identical.

The unit testing/fuzzing content isn't suitable for 4.15, but these bugfixe=
s
want backporting to all releases, and should therefore be considered for 4.=
15
at this point.

Edwin T=F6r=F6k (3):
  tools/oxenstored: Fix quota calculation for mkdir EEXIST
  tools/oxenstored: Reject invalid watch paths early
  tools/oxenstored: mkdir conflicts were sometimes missed

 tools/ocaml/xenstored/connection.ml  | 5 ++---
 tools/ocaml/xenstored/connections.ml | 4 +++-
 tools/ocaml/xenstored/store.ml       | 1 +
 tools/ocaml/xenstored/transaction.ml | 2 +-
 4 files changed, 7 insertions(+), 5 deletions(-)

--
2.11.0


