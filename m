Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7563834E51F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 12:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103375.197256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRBJ1-0001YS-FS; Tue, 30 Mar 2021 10:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103375.197256; Tue, 30 Mar 2021 10:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRBJ1-0001Y5-BO; Tue, 30 Mar 2021 10:09:03 +0000
Received: by outflank-mailman (input) for mailman id 103375;
 Tue, 30 Mar 2021 10:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WORZ=I4=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRBIz-0001Y0-SB
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 10:09:01 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1074bbb0-2247-4615-850b-4941c15a4417;
 Tue, 30 Mar 2021 10:09:00 +0000 (UTC)
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
X-Inumbo-ID: 1074bbb0-2247-4615-850b-4941c15a4417
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617098940;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4CXlE14MKJ2QvzQjAo7O0NyZS581vcAdqqMkffONxUY=;
  b=bZttLKvvHkrQ5jP5BaxlcZfgJfcbWISY7hPTKhUcs05O6mpSOxXMorBD
   3gGOZxWzIhvT9M6y14H0Km1RyTswpLn09I0U2Xtkzv4mtdw9geq0H3vdu
   SZ5wCcqnvLyAkvbprlfrvIi3Ot8mPjnPHJxmcuBLqajZ1QSb2cgD0hPF1
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OaDHeD8ztMphzvzZADdE/mRc+asV1pZlsgWKTLBSiKqfcAv8XJheLy744F19MvI6V6paB+crPa
 D3vdZ387T2L5hu9WVRK/ka0MGTlbe2az6Gu1V60nRi2lgWwu22C4WyeJcqumtOZsNW0jbxLbF7
 p/4iRKhKBRZqLZvG8SLm77lvvTAtOMSFlNH17DFnFH836Vkks0O7SJr4fnFT5bOpPD6sBxaC7O
 /vv1pu17oP6h6D5lwZ1pe9AjaxTeWqjuAmj0poYzH3K5aM8eMfQiAPE/5b3TGhdDLg2foQWo9f
 vCY=
X-SBRS: 5.2
X-MesageID: 40410050
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:aCnrWqwxtEM1RJ1jnEDzKrPx/uskLtp033Aq2lEZdDV8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr3//dOgbU5F7GkQQXgpS+UPJhvhLGSpwHINg/f0qpm1a
 lme7VjE9GYNzJHpOvz/QXQKbkd6fad9qTAv4nj5lNMaS0vVK169Qd+DW+gYyhLbS1LH4AwGp
 bZxucvnUvCRV0tYs62BmYIUoH4zrWmqLvcbQMbHBli0QGSjFqTg4LSKQSS3RsVTlp0sNUf2F
 XC+jaZ2oyT98uV5zWZ/G/V4pRQlrLau6Z+Lf3JsOc5AHHBjg6pYa5oRrGNuiskydvflGoCoZ
 33jDoLe+h19nPNbkG5yCGdpDXI4XIVxFLJjX+enHf5rsTySFsBerR8rLMcSDT1wQ4EnrhHoc
 V29lPcjbV7J1f8uR64wN7yWxRjhiOP0AEfuN9WtVNze88jcrNLxLZvmn99IdM7Mw/RzpsoK+
 VqBNG03octTXqqK0rUuWRi27WXLw0ONybDRkADv/qc2CRNkEZ4yFMFxNcekm1ozuNEd6V5
X-IronPort-AV: E=Sophos;i="5.81,290,1610427600"; 
   d="scan'208";a="40410050"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxYFGoCNGI8tWT7C0k951IvFIe2RGqc1gKbNn5c8Uzn8hrRuG8fqiybKoGEo8cIK2nV+2UkLCDfvoeVFlki58JbBWcc+emQincq3F1SRhWpphTxHaWSbl36aQjmi7Kuhi/1KYy5XtQqUptCbDmhqHsh0uzBtJE3aNHxwXMJJ3IMyUV1n0XsbNX4l5AbBiYBEHS0nRUg3OFud7wyY5BZyhTrOBR7KLGEOuLaYeoxv1E4puwqRkT1BARQNgnKxe5eCPKw0pAcY9Jf/HdTaOW8YbAAg6bBQ8hc0A1WPnmZ+A5oZuHaFCMYLMQAgPIHNMDY31pqZx5lJg8qb7ZDdyCPj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ByKdTw6aBg7DVZqFftQOx0//c47+Vpp9hugxvmHL/E=;
 b=mWfJEaXWwd2xygdSl8cnuNILEHRuMi43sq0PNu2ymxsqzvowrBD2BlHUoGeqRcdAgzkCuTA3nfVfIDmlc5p9ObzzD/gFuA+gLKJcQzfq4/HG9X4+9Hdj/VfQsmRVQPUVBbtqoD7OwxFBQMQeruubmaXyU5SbZQhWyMAr4rmq3AMTfvsmelZnpCzUDkeUjNnFcnXaFBhotGsxdfJkJFEChVOJaNAvIlpEZVJ4xo1v489RlaPlRmWjceqy7h4h8xXbjrCTL5a2ffEIwhbrJxWNjizOVQZ0IvKOKj7Wr3oI4G4NHroQFuI2aX16JecF97gP+3vdfNs8jqHqWcFZz3xh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ByKdTw6aBg7DVZqFftQOx0//c47+Vpp9hugxvmHL/E=;
 b=HCwEOUjU0FbHtcQE+7gcOZS8C/V1+Hc2OXCPQG3H1ucVHV0s770uV902Lyc6d6wKbWjpGi0FL5/saWqq8UFRClGH4LPP24E+LQNLW704Myd/1sV4T21mFnZBQXcpfw6AWlPfoi/L3LtXzt65js/ouLl5o1lDErw9riIkAnv0KYA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien.grall.oss@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd
 compression support
Thread-Topic: [PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd
 compression support
Thread-Index: AQHXJLa1tVPlJJfTcUCinve5Y2vCr6qbUIkAgAD/aYA=
Date: Tue, 30 Mar 2021 10:08:54 +0000
Message-ID: <87E259CB-2BB4-4BAE-9916-BE46584E0EF4@citrix.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
 <20210329161457.345360-3-george.dunlap@citrix.com>
 <CAJ=z9a0DxKKkLGMDK1nisVsefwE=8RQcD8M4vpOO1QopjzZtjw@mail.gmail.com>
In-Reply-To: <CAJ=z9a0DxKKkLGMDK1nisVsefwE=8RQcD8M4vpOO1QopjzZtjw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12729f76-bc9b-4383-ea37-08d8f363d33d
x-ms-traffictypediagnostic: PH0PR03MB5782:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5782EA2C3ED66DF92E6C640B997D9@PH0PR03MB5782.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NQhbc0IAnCYeP//1c7m58Ho6ODVLwvcHRuJmxP5SjThA2+S7gGTyI6qcCRuti0L2d78qm/8qNRtmk/nJJ+fkpiSJjBSdr4j0GeRLR5P4HYWP6gbApEL9XzeEaRyeWXuEO0GN/AlRUevQp5GlMpIsoD71YhrqEm6z00cOrHfrIr+kkGePWXrt3XpdulB/Fe1L6FGnb/B6Fjq+cxY9FUNdVh3TI5Ln1Nf4ratlhghGOThrlSFl7kUk6jqbuiiHz1GwDVX1XPFInGNxQ/XM3iKZMjboXr8rhNvYtvlFjZbLx3io0vBga9WngvwOHJaRLta4zc5dga0TuId/9PkkTp7MOyxV9VV9T9DsdqBCgmVQ8zmTqmqkWIaRWRcLRlTowzCsgFDaJW0necAB+5fCw8PchmAk2xn8AgOgRWw4N6BuWnw6IYc2HdzDu6gJTImYUBOfSqH2cAA120lsh8ZYPouW58xUD49P+9tg/NGLHktQIMwj5E7cblk87bkAiR08cLe/9Sdg5NCnKwMYakHxaMH9yDVsVNUo1RobABYJaeRt/HmEwNX3w6iORcOxtdACbP9FhWTbkGcZBuG42m5H+j/6WhLIOaNyEDnADPPSSQ2Bf0KHCMuCT2An3CR8QRqaxzzhNshQnf86aBpal59HO0TfK5RNlE55C4L5RCt3XMJHDeKkeYknAT2VkpRe9cipleulQyPxaCDHnarwSZy043ds9U2ZxSMWyj2+5k6aNxuAxmtvhSs/eCR91KESPF4UHQrhkld6Kan1mOjzLFcoC0NQj2MiGmngDBvgEr0jKo+ek1HUh8xN5C8ja8llm5tzlngB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(186003)(5660300002)(26005)(91956017)(66946007)(316002)(478600001)(36756003)(64756008)(66446008)(8936002)(76116006)(86362001)(38100700001)(2906002)(2616005)(4326008)(71200400001)(6486002)(53546011)(6506007)(33656002)(4744005)(8676002)(6512007)(54906003)(66556008)(66476007)(6916009)(107886003)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: dd5iIPBcUhqKAL3Sk/srCj07T493Aunz5bOLKiARfpGxgt6r9R85iSCJ2zPOWPKnwG+aKsqGXAcwLqq2Z0Z97uTf6dlrM6t/JnmCSfXxbv2GcHc7n/Pf0WcfjlxkogshT2Gu+C7oCiuEv4HzMe/qf/nlF0MueQfSyMRsBcN2LNPyl+ISFB+af3JaqNJ1nqrJu+McShf6WmZEtsW2TZ7rT7T/5Nc5ZpuwK6tGs6OOWcXoo3RUzCXyl0ypxOQuA7KYOBKYA7vRvQjteVQH23/YqFAR5sTuB5jx8gvsLlVYEWc7Y2L9pkBAQWuI3QZBlHythLCC7OlX6fJiHgmoqxxH23eje85o6Li7MSarmfFq1Uf921XdGp135vBmTFw3Swobx54dJBiBVWllX5x8If4f1uCIsaI1ENurCTXtJCluTHiFs3CkJ0wIih6rnWUQQlKHaUKbj+tMhdjXYIc1RXVPaeVVJcHbnKTV+Krn8jkzWwiXuHbjz2KRsIFYYIu1uQquPVVvZxeCZyyrAOKGExTGwOZvWLuLFcskKjcihPPn19Zx9XOIvJh7UEaXRQrrwIXRZyGssGGpfm3iMprYB89JjqbMDdlt0zT4a3FsgzoMI1EFaCBR4FR/rhXSJzMsF+i+lhD3Wn71asJ3PqJNvwwkqu7dYt8Mjpd5SRsPo6vx14/qOkd8VcYA/nd3o/MuRID6BmEO+h4GeHLdtcJeVxSJA1+N8FJu/xo9vc593CKO4njGrmc8iz7H9x+IQUCxKquY
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B9063F241F53424FAC0B68E1ACFA8977@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12729f76-bc9b-4383-ea37-08d8f363d33d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 10:08:54.2943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HAhSqRW6AdovLjx1/EJR/SFk47PcW5PaJraao0vLNb/j7hKzuQh14gVPMATUpHFzsM0m+k9J6563xdGCq0WG3VComCi93jtXdrboW9Sp8kY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5782
X-OriginatorOrg: citrix.com



> On Mar 29, 2021, at 7:54 PM, Julien Grall <julien.grall.oss@gmail.com> wr=
ote:
>=20
> Hi George,
>=20
> On Mon, 29 Mar 2021 at 17:15, George Dunlap <george.dunlap@citrix.com> wr=
ote:
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 8c89212f14..538eae611c 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keep=
achangelog.com/en/1.0.0/)
>>  - ARM SMMUv3 (Tech Preview)
>>  - Intel Processor Trace support (Tech Preview)
>>  - Named PCI devices for xl/libxl
>> + - Support for zstd-compressed dom0 and domU kernels
>=20
> Looking at the log, the feature looks x86 only (at least the dom0 part).

Oh, interesting.  So what about the following?

- Support for zstd-compressed dom0 (x86) and domU kernels

-George=

