Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A413F4F84B4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 18:16:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300952.513516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncUo1-0003Bh-Vt; Thu, 07 Apr 2022 16:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300952.513516; Thu, 07 Apr 2022 16:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncUo1-00039G-Sl; Thu, 07 Apr 2022 16:16:21 +0000
Received: by outflank-mailman (input) for mailman id 300952;
 Thu, 07 Apr 2022 16:16:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E9KF=UR=citrix.com=prvs=0897b442a=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ncUo0-00039A-2T
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 16:16:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d341fc8-b68e-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 18:16:18 +0200 (CEST)
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
X-Inumbo-ID: 0d341fc8-b68e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649348178;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IE8ojdgnhP5M7dJdFkLCgcDcNg8pTX7z4DBM2Yhk4LA=;
  b=KfBEWUme/0WNXsHMZwaSQqlHn4azubAyHKXDRIyIUdk0+FPHHrA92fVI
   zw3t9B6T2KtBqD2AgYMeaqZgRKb4dclVsIkg2b4pcAYlgbwOusm/cIhJB
   yq/m64s0KUlU5h+lRB83jEYH7m8jy1sZSikC5guIKU5VFYEf16bMj7Al/
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68690557
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/XfhV6mhei5SNjvIsQoZUsro5gyLJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMCG7UOP+OZ2WnKohyaYXjpEgH7J+Gz4MxHFFk+y88FSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW1zV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYCigvD6+TnfghQhgCOCZEIoZUoKOALi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZ71nfdBPkrW4/KR6Hi7t5ExjYgwMtJGJ4yY
 uJHOWQ+NEmdPHWjPH9ILqJhsrmTt0PkUCRe8F6kqIFw2Gr6mVkZPL/Fb4OOJ43iqd9utkWfo
 HjP8yLmAxUZHNuFwDGB/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0GPVWIu9l7R2x26uOyAGjGUMWFiIGZ4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPc1
 JTjs5LDhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGAkdBo0YplbIGaBj
 KrvVeV5vsI70JyCN/EfXm5MI55ykfiI+SrNCJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3DLWlMnaKq9ZKRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:/4eOVqE84VJfBbO3pLqEi8eALOsnbusQ8zAXPiFKKSC9F/byqy
 nAppkmPHPP4gr5O0tApTn/Asa9qBrnnPZICOIqUYtKMjOJhFeV
X-IronPort-AV: E=Sophos;i="5.90,242,1643691600"; 
   d="scan'208";a="68690557"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XeQHF6umAfQDb/xvZsI1v6v4F6z7WwBquc4DDg7tSr3DwrwLcWEdPdKLlDkO3DSbZ7L0Uw6986ZXV4g1XgQL803wLnKW60AVQJ5dUwYPdVEgVB0Gqfcile+oiOdNj4pRCRrTMKmzQH3GQNjqIn2g7o5qS5fud/94RajbDPvfXfwNhy5hHRIeWPfkw/YQwukUld8HoJmjGu+Po0xVp6/zwHL1ApM40OizmoO1UcudA1a1tvvZ7944E6zxvJHDgsaU3sZO4s6AnBkDziHNX2k1qQzdtrvNDUjoJhe+SXervmnjCmqbCM35T373xeXLYTcTGYXnP9872dS7DyUhJl/UkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+bKdzziTzyhaZjlUs5f17T9HEOXH44BuH4BfxkL9Fg=;
 b=ZVdcZ0dNSx8bo1I+czyqV3Sa0H/5VmzCFvAM6r5lMknVf0v9nKrcTQtbeIU9ATx4HNlbl/rDMDkvkOZ+2VzaZxOYJsLAbNJQ18ThU0gmbndY/ieHEouyc3k/9boRdr/d7rmjXYHTSW86Boiy1GVmkDBKff9JD9062xNp5pJrfvzSZaaMiuVWc+92nfj/53bLVVWZLab035M6S+yoOwVLRIYkHmV5iKfBQAfQhE1SXLf7bLQQELgEST87WIzo83ZKx/7uLyA/QQI8wVxZYDsLIpspBCoO+s2hZNqJd9ZaQGkGFi1msdbwMMf1AGjf+iY4q50MYeUvprcpU0I4NSfXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+bKdzziTzyhaZjlUs5f17T9HEOXH44BuH4BfxkL9Fg=;
 b=C4D4u9qLcybl4q4/cexYKg6iH/4PiqzmEroaF6//MD21SISPJzLxWAEvIhdq0xTaDPjq1ngjJ7Xq/QxzntFq24a7L9+JzGLU4w2/a6TXwjZzDUA0UIXNNBhWtticBSFhIqCLNhvK4TInCjkhqo/tF3CtbZWt3gxkNRQZUPRZdKU=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 1/2] livepatch: do not ignore sections with 0 size
Thread-Topic: [PATCH 1/2] livepatch: do not ignore sections with 0 size
Thread-Index: AQHYOe9tRJv1F56fOUuExIhUnmsVN6zkwUJS
Date: Thu, 7 Apr 2022 16:16:12 +0000
Message-ID: <PH0PR03MB63829916B44D38A5B5B8F72CF0E69@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220317110854.39050-1-roger.pau@citrix.com>
 <20220317110854.39050-2-roger.pau@citrix.com>
In-Reply-To: <20220317110854.39050-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efe1c0ec-3473-471e-47b8-08da18b1eeec
x-ms-traffictypediagnostic: DM6PR03MB5114:EE_
x-microsoft-antispam-prvs: <DM6PR03MB5114E5D9179C26E709C5F4C4F0E69@DM6PR03MB5114.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sv0KQ0LoyMoZLNKCSyphY0hiEu1hOWCqLC19NF/79xrOXpUJn3OeQEWXIV/1WdLpN2JLmuuLyk78BUzAam5rRARwrsp35Tf3OC6/QT1ZW7FOya0n8hRfN8ZNkWun8iWG8DHrBEWAEUXk8gyTMkJUvicL/w+KWTbF1hZcB4a6d6a5oSZ3EoYXziAyrli0sbNUCXa2FQaoJuPfwlf1nkKRq6tsQ2m9El0WpoZuEd6/4i791aJrRllF9WmqNO+ZJszkX6/dY0vOPWIoMVRvgCDW3W4a8dsM7OtaWyOGeGb2tjbhUJ4W0Px2ZMLIRkyD9xDW7FFqINEEzU7NmDxZ1fNInxbKLfptDbwqgdNT8by+Yjre7zaBDfgv+FV9uq/Hckf63VmPBv1+VZZPUho2/5i5e9tn5r4zainWOdlxYZAJ2NXI46rfluyO0ahnenvZWkWpS1pHanwOWzqZ6jcaF4UiNq2ojAF7GdzHCOx0pncCxSPfDhOwWF5LdUQJ3ys810Zax8U2N1+fW5RL4IXbOjmTUdGTHp6NVwti/AsD36ak7wC2O1qFGhqs5EIHzbQtFmSk6DLgXqbwi0GFuoMASwhf6oyxmocfg0fkeReFVJM5uTCwxv5BTamUthX7mo8bs026/X3cnPAy3eD+R9v8Q9oGQsc88v9+zyKlxGM/NkCsF0tVzYIT1y7BC/XEqOx2kVJrgfjsv5XoAEKO6VtG6zMWsw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(53546011)(55016003)(44832011)(6506007)(9686003)(508600001)(83380400001)(5660300002)(66556008)(91956017)(8676002)(4326008)(66476007)(186003)(86362001)(26005)(8936002)(71200400001)(52536014)(64756008)(66446008)(7696005)(66946007)(2906002)(33656002)(122000001)(38100700002)(82960400001)(110136005)(316002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?S0aZcBsCexQ8k0qbc5YTcKIa6UTOQmiQH+D4+BEpCUubuJlJS5UG+0Gc2k?=
 =?iso-8859-1?Q?sq8BzSaaM3ty7V2J/e67yvUe3Br7PVDIrZK4TbI467ZQmHHJJfAL7c17oF?=
 =?iso-8859-1?Q?YW8bDyh6Lx4g9sTG1ULaCZBri7uBgrxgsxqXqye5WZsub0DUhSiLm0fbjg?=
 =?iso-8859-1?Q?Y2DxejzX99zPP9C4lnKCY67uW8FyI4VJ2NIHG9P5bKeKnSq5IwJhQq/Qqi?=
 =?iso-8859-1?Q?uZEYygkdqFqw22UuwJdOMXgA61XGFdlhOnOKGSEA9HdEiRWvNeM0+2kK7y?=
 =?iso-8859-1?Q?ne9Pk0JMy7qe9z5Wtl+PbBSMaFnI0wQBhMacbPai3++QmWuSrZF1nkwDLs?=
 =?iso-8859-1?Q?uMIlxt5/Ms5mehdqUJFnuWLXFyCRuYpp9vQ+BxiAJvmG0d9kzEW84K5IkC?=
 =?iso-8859-1?Q?oiICPpY8NTE5iPeLYtEyZnAymH8sWOYE9VQDtI7h9Ackz5ZuWVfSfa2dyu?=
 =?iso-8859-1?Q?q09l3HN0UGuxsMswD7nX/HF4DjtAOTBjrUqN6i39lpFNcNy9rrMW/TPy5L?=
 =?iso-8859-1?Q?PrL3j59IkpQ0zCbiy1sEXEvZmRIv92FQ/fYA3Lv8JxQN9r7O6gIH140YZe?=
 =?iso-8859-1?Q?xIc/U4cBwPyjEVq4Jx0M6kXrmOxiWHqJE5NAwgBh/tauCSIdb5sR0OOkZT?=
 =?iso-8859-1?Q?KjMS/S+JRDrEsLTqd+F6ieiYcaS2DM99Cg1w0vL/1kZgVkHxYYDx6v0tj0?=
 =?iso-8859-1?Q?XzhQi+HzewzhnkTJmhCpdvtsABXw8off4EnNRP1OP3GNxH9TgFuVmIyTS9?=
 =?iso-8859-1?Q?eAoOT2Kyt9h47d4zvWm5Zm+LXGKZP+EtvezQqJ7MJV9TxiDONPVVnU+8P5?=
 =?iso-8859-1?Q?a2jGJC+sygi0OVBDJAP7hBmzGHVXgXqAfZ7yEfl5pYrLOhssE+Bb721GXP?=
 =?iso-8859-1?Q?WS5cn6TFgNK4PKGMrhA18FGKiWp2KGF9DAOIId5bRKgNyIFIelnbnC431p?=
 =?iso-8859-1?Q?DMJZgy0uH1AEiGC8Yzt9d8VFH2oiFJm+injaQri/3Wu2KhC9jQnNxa6o2S?=
 =?iso-8859-1?Q?hiOwnxkwztk/34nR2zo6d2qyDTccwCB1rC/ZBeNypzxfMN8+CBFyA+9Prf?=
 =?iso-8859-1?Q?kpgi/4ukeJvzrKUiQ2txZ3U9fvbzCKCZOJGNUiLU9LNIrnt3i3hMgsmUPQ?=
 =?iso-8859-1?Q?A4maTq9XG2oTwz+rvApjfCvrv91vcGDY+gE7+AFY2PWL7sns4j8k5y88Mk?=
 =?iso-8859-1?Q?ETXCDh+obQJzb6F+1QgxdP9qkA8cUX+vWQ9CTTj1EmwjXfMEs3HSIRE3XJ?=
 =?iso-8859-1?Q?nBzQH5GMUuMhQZUmruCVc1bphaFLNZUnNz7Hg4Lida7WAz7sDYlUOCFIkt?=
 =?iso-8859-1?Q?1lO5OXNvF4u0BMa1ptef5EFZSKeGQE4e3mFNXBA78M/stYhRRIwrgKj/Zd?=
 =?iso-8859-1?Q?c36NzyyIFRszeFI/uuhZMVB2qxoB9LnDcYfcWxrgq46w/fPQdiuutzl/f0?=
 =?iso-8859-1?Q?ljSSkcJtEw1TLMXbhw7TIdVhpZ3qsXTUHCSWy7yyBOdlW+Q7Du/N68Ztxs?=
 =?iso-8859-1?Q?4eNjB3LNqrFJh7fOmlAkjLrxwRiYfrxlJobsnshOeTc2zcTAB2Dt9gEM+a?=
 =?iso-8859-1?Q?QHHL4zwyz/6IBrg1bnLjV47x9rdfn+wclz8/LAxSWqBoGvcqGns9/m21IC?=
 =?iso-8859-1?Q?k3X45tU44upSUeo5+qijmEUVAdvWE0XfaOrA5rj5aj57a8l0SuzzX4auZw?=
 =?iso-8859-1?Q?i4b9MHqPhWKpznKMn7FBDkpWv58PqIcGop2W+/Hd+btnTTrCDbDwqKoReU?=
 =?iso-8859-1?Q?1zVMUfjb+zb8WNLV8i8RFHZA+EpcMXKXtPx0eEW6Qjzyac3E8WDs81re2m?=
 =?iso-8859-1?Q?9cFxVz+jlg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe1c0ec-3473-471e-47b8-08da18b1eeec
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 16:16:12.2149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAWdi7H6R1UdzqOexWdsFtu3WHd8C2ndd+qpUr77ba1dfBv6283b4t4xyQkNN96wmkB8HWkaHgY332Tan18p2mnWUxBvLZD5pJ3rsRsyKH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5114
X-OriginatorOrg: citrix.com

> From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Sent: Thursday, March 17, 2022 11:08 AM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Konrad Rzeszutek Wilk <konrad=
.wilk@oracle.com>; Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Subject: [PATCH 1/2] livepatch: do not ignore sections with 0 size =0A=
>  =0A=
> A side effect of ignoring such sections is that symbols belonging to=0A=
> them won't be resolved, and that could make relocations belonging to=0A=
> other sections that reference those symbols fail.=0A=
> =0A=
> For example it's likely to have an empty .altinstr_replacement with=0A=
> symbols pointing to it, and marking the section as ignored will=0A=
> prevent the symbols from being resolved, which in turn will cause any=0A=
> relocations against them to fail.=0A=
> =0A=
> In order to solve this do not ignore sections with 0 size, only ignore=0A=
> sections that don't have the SHF_ALLOC flag set.=0A=
> =0A=
> Special case such empty sections in move_payload so they are not taken=0A=
> into account in order to decide whether a livepatch can be safely=0A=
> re-applied after a revert.=0A=
> =0A=
> Fixes: 98b728a7b2 ('livepatch: Disallow applying after an revert')=0A=
> Signed-off-by: Roger Pau Monn=E9 <roger.pau@citrix.com>=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

