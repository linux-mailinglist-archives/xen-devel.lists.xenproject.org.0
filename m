Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAD22688A9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:41:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkzK-00019c-IV; Mon, 14 Sep 2020 09:41:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP2S=CX=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kHkzI-00018X-M8
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:41:28 +0000
X-Inumbo-ID: 89edb45a-d61e-4600-8d81-d91208300be1
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89edb45a-d61e-4600-8d81-d91208300be1;
 Mon, 14 Sep 2020 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600076477;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PZvb7YB9iVYu0uRFwdrsdhAxtqVpSZwP5QqIGvZjSV4=;
 b=aQX23HjZyiDv4ELdvvEHYE8DMORtnGqUOkAW9wwgtt2OBA9SIBAi73sS
 kBQmKYwBsGQf/Rxq2XTLYtJq1NTftpSZFAw0qDIq/aB8nMyyYMRc8Cull
 cQUnH83QEAaSmTvLcbhVh1+fGKhykWZ+6yHBrbCai5yk84jvrInhSy9Vk Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8pr0EzXJYm7PIeB49aoUIklVLSUkUC+GPh3Gc+Pe3LkiXrPtfscLwyJtn6xb0tKY8OLWXIv7yz
 VOBOyeA1eKoS3kuJTpWorMETHvz93cGbQNs37po7+ieVm2u2J91vdA2AhafTtc68gpU3RID4FZ
 IcWHytDHU3H94XlJE1Pd+mJU0NOOpSJbgYhBJPqctaqfZgeD87nOERuguJ5fiIS1WVSduIuiVP
 zkOVniA4KPTuK4AkcJhuwJlaAijDQXdWPolC4Dtu4gyN+mwDyG45xWhJi3wu8qnrFgQeGpj4S3
 MNY=
X-SBRS: 2.7
X-MesageID: 27590254
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,425,1592884800"; d="scan'208";a="27590254"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5RGAG5Ys4R41z/LlqvriIDgEzT5RE5SenUWTq+YpDxaaMVVNqhSjWkMUGkv79qALFP4TQHvoiqwYBJ6+cHmaxedvcTyCsAYMzJORVIPn7LKFfpQNwFqNpbtmvW6jSeDVO/zDD837/csRv6YXiDORpr8T8utTTf9YHP2AYpDZTpF/Bu89GNW0KJwHhmz4kCb2Hbpqv/saWrdelfm+caPWJh1PAO1i63XF1VSce2wpci3V3giqUlHiUPElLQXGgHIjYT6doc5GskKgU3OJtZrSiVhewR40vYN8OueR7qOAanqUXsH5iVQFe83VEzkhaSwkrAICX79ZhgqAi55CVWf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9opC/y9a+LQzmkygsnxE1NJbRXEiM2C3ZLh/zdxZu8=;
 b=Ob654Iww4puBtE+HabHMBTlJOvinhytdA6BCTxoIx9edvmcjQFPCKvzLlGxf4rrzlEQDeK9PnB4OSRepxS3fa2xEvjLw84CJ4bgCSaNPIXI/4c9QVnjYNmLE4cR4gxAT6fu3AU6KwoP0yCtin8GUHipt1gKsig1lnDsgE5GFWP5Gwb44VqJhcgqG5apb29IaCIVi4NSBJNgySTE+aPwtq5hXi/IYOoug3ZSnMdnEetKDd6kPim5fTm6aZ3hFjUW/Dl+glWtTDCCf7D5Az+l2YJzRHxN71YtVQUk6uFt1HGwL4zD3o5E9/ysldRMr5Ce85wcs2A5PCmcJpWGL3Lhecg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9opC/y9a+LQzmkygsnxE1NJbRXEiM2C3ZLh/zdxZu8=;
 b=P9zCqCBZ3WA+CCNQSJSfME4VIjUPblbeqhPynuG+RGMsRUpIQfplfRqr+HjFHFDbTRMcRAQyEf1dUBO6PKevuibQyhDkStEkIqmftjipvFgzJKEijTEoMvbm9WFlVF9tBoJhzCgF4FZ/SHh2DxC6faH4OyKfIsqJF2wG00rP4Ow=
From: George Dunlap <George.Dunlap@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
 <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien.grall@arm.com>, Paul Durrant <paul@xenproject.org>
Subject: Re: [PATCH 0/8] Finding a home for the Code of Conduct
Thread-Topic: [PATCH 0/8] Finding a home for the Code of Conduct
Thread-Index: AQHWiDjAKrlEjRI70E+ZSfQOA06BL6ljps+AgAQ/FoA=
Date: Mon, 14 Sep 2020 09:41:08 +0000
Message-ID: <96F2F69B-8650-4078-AAA3-FD9D8922C335@citrix.com>
References: <20200911124009.3760032-1-george.dunlap@citrix.com>
 <alpine.DEB.2.21.2009110946560.28991@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2009110946560.28991@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a2ce669-4583-4aef-1227-08d858924f0f
x-ms-traffictypediagnostic: BYAPR03MB4645:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB4645EDB910A26AF0E9A334A199230@BYAPR03MB4645.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BmCSta7uevXnkdnw1fxZLT9t/p110MJ3KFu1gyZRiAVBFzbZ44/tsLar4i0fAqYgt57txF2fU5WI2jv3JHo+qrF/bwWb9QxXO49ekxL/nehOJ3h/D0ScNtz24yvB5mbHH9NYsQGmEMb1r1JrEcsXllDxlckXm8Cuz/lMLfEsFf2eBGBn+OO89QvcDKk1eYUpRcp0RZWKx3Kyt8uHyoMy8NUvk/2ysk5ya0m4l3WI5cAUNboCc1FJIWr3k4N6SQQgdHL3/qvGpWi6161jdd7mmpcjEMVcHp6scrm/K/hLdWIXlQ014XExvXmdeWxwLFzJG4ZnCfJeLfxcHgkCUsXekDsQTgQrT+oSJFe/VmeXwywbrS+2LprWwrGZZwOfbdET1h+yv1vBzgD1XLXn8na9Zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(376002)(39850400004)(26005)(2616005)(2906002)(966005)(86362001)(478600001)(66946007)(36756003)(64756008)(66556008)(66476007)(8936002)(66446008)(6486002)(91956017)(316002)(54906003)(5660300002)(6916009)(76116006)(6512007)(4326008)(53546011)(6506007)(186003)(55236004)(83380400001)(33656002)(71200400001)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: DhIQzB6oW5FS69cT8xTK7na6hs27q7CqyuGMLFsQDhO4/hYIY0KS1hEfqeuxrY/tEztRKkES7S7unxxndfpkb9q27TK6Cg/aYrJAjK+jl4Q2+g/wQFG5LNduJrH/A6eML48F7kCQ16Q55LRh4UuMdX2HHkk6FxYxvSt2pRgqlsF9plqsRlVX1SnhQMvXyNCqWfHkNGiWoqD0Avj+EaB3a7lZHtpmqIzZIb/VfoyEwNBOG8fW0UwYhyb9nt7NhxTuxhWMLa85EF1KDKNPj+QGm2H8L7CusdaA9QISup131Juxy3Fu+4pvEvSdMB7AKYvAytE3wsD6xjHIARwgVmWgogCFAnbwmi2qDQfoksOv2LtxxHoG1zznohfo2vNkDBppx9CwV4c3/AA11yeUSBcGNfWe8j49sAp2RWe7zyBuhO7cAEhvk89l2DMPtGaAGeAzDNbzSK6Ussxyp1qRuFUOQxlyr8K4lYy1MSXC+tgpnvMhKhIhGbGUeNelAT9YKuJG/bEMjXsdNpZDNTn9EMLBkTgZVUDDJoFoX/5JF4nJtlwTuRsrv1jMf1y8hA8FgM9phWU+hZ67cbLjhXuTMcqGfsZ7oGggk87uxxn71UDQWD8SidhP/DH7NZTYhV3h0huUCwOjf5XYUhcQSRM+3ZMbIw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FD1D09D7FE28B84097AADDB53C373C89@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2ce669-4583-4aef-1227-08d858924f0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 09:41:08.6453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A695YfSlom4/aB5zncU3hiyzjfwxdJzJ0SaPR1cnjizCQgem2Zzm3D0Qx9MTxLIXs2IJ896rzXx6IWMDUiwUhknugAp87VjsncWnSRFX9zE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4645
X-OriginatorOrg: citrix.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On Sep 11, 2020, at 5:50 PM, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Fri, 11 Sep 2020, George Dunlap wrote:
>> The Code of Conduct has been approved [1]; now we need to find it a
>> home.  Since we've started using sphinx for the hypervisor documents,
>> I propose doing the same for the project-wide governance documents, star=
ting
>> with the Code of Conduct.
>>=20
>> This series takes Lars' code of conduct tree, written as individual MD
>> files, and puts them into the sphinx documentation system.  After this
>> series, if you run "make html" in the top-level directory, you'll get
>> the generated sphinx documentation in the build/ directory.
>>=20
>> The finalized Code of Conduct documentation can be found at:
>>=20
>> https://xenbits.xen.org/git-http/people/gdunlap/governance.git
>>=20
>> This series can be found on the branch out/move-to-sphinx/v1
>>=20
>> And a rendered version of the governance can be found here:
>>=20
>> https://xenbits.xenproject.org/people/gdunlap/governance/
>>=20
>> If there are no objections to this setup, I propose the following URL
>> as a long-term home:
>>=20
>> https://xenbits.xenproject.org/governance
>>=20
>> And also moving both the main governance doc [2] and the security
>> policy [3] into that system, to make it easier to update.
>>=20
>> Thoughts?
>=20
> Sounds great.
>=20
> I'd suggest to also move the governance.git repository to a more
> "official" location on xenbits.

Yes of course. :-)  The goal was first to get a draft up as quickly as poss=
ible for people to look at.

 -George


