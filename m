Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D150A19D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 16:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310229.526933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXUt-0006dh-20; Thu, 21 Apr 2022 14:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310229.526933; Thu, 21 Apr 2022 14:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXUs-0006ae-V8; Thu, 21 Apr 2022 14:09:26 +0000
Received: by outflank-mailman (input) for mailman id 310229;
 Thu, 21 Apr 2022 14:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MTNk=U7=citrix.com=prvs=103b1a447=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nhXUr-0006aY-6G
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 14:09:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0a95e50-c17c-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 16:09:18 +0200 (CEST)
Received: from mail-sn1anam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 10:05:59 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by CO1PR03MB5907.namprd03.prod.outlook.com (2603:10b6:303:6e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 14:05:57 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::9981:cb1d:41c8:5530]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::9981:cb1d:41c8:5530%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 14:05:57 +0000
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
X-Inumbo-ID: a0a95e50-c17c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650550163;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=x0ZAHfLPo+RLjLOtB3HPJVhPseLBSbaqlReY8TmEaFA=;
  b=KgFHkyij0S3P/ilBAoMso9C8O9PJOr1fWStcUYsSKTMbmYp0SNAv01Ps
   AM8d6XoV55nMVI4Dg1mRopRm2PrNjhIN96NtWHbWbQ5ktj56wHy7bDRG+
   /ORv1UaFWWQoyWanKsUgXk3bLwT7FYGwZDe6NQoZ+6tLqDjnWyYCQBJ+S
   I=;
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 69633762
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23: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
 FhHmIKshispYJ5ev7jlpqS8
IronPort-HdrOrdr: A9a23:ovshHK8h5Yr5MUtnOFNuk+Ftdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQkdcKO7SdK9qBLnhNRICOwqUYtKMzOW3FdAQLsC0WKm+UyYJ8SczJ8R6U
 4DSdkYNDSYNzET4qjHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCajqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOoXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6T64aT1eUWpDLS8KoBOCW+sLlWFtwqsHfsWG1VYczDgNnympDq1L9lqq
 iKn/5qBbUI15qYRBDJnfKq4Xit7N9m0Q6c9XaIxXTkusD3XzQ8Fo5Igp9YaALQ7w46sMh7y7
 8j5RPRi3LGZSmw4BgVyuK4IC2CrHDE10bKUNRj/EB3QM8bcvtcvIYf9ERaHNMJGz/78pkuFK
 1rANvH7PhbfFuGZzSB11Mfi+CETzA2BFOLU0ICssua33xfm2141VIRwIgakm0b/JwwRpFY76
 DPM7hulrtJUsgKBJgNTNspUI+yECjAUBjMOGWdLRDuE7wGIWvEr9rt7LA89IiRCeg1JVsJ6e
 H8uX9jxB8PkhjVeLOzNbVwg2DwaXT4WyjxwcdD4JU8sqHgRdPQQF++dGw=
X-IronPort-AV: E=Sophos;i="5.90,278,1643691600"; 
   d="asc'?scan'208";a="69633762"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWg34iEL9tv0FgjwTvYS/IdlOkLxDSxtbUYV+/hBTQUPBgVFDvVmJc+kafv2epIfLrFSBRhN2emLnuUhVGy2lPKH5t2rz6wr+5jy9yiOMbsjFdls4JV0o//TR5W5fd+s1td/AwKIDQ5i0UQmREBNnzVS+gz/DbcueAmIQYPuq1M7gyUoqaUNXwVUtRoswdoHewdPdAaqa0C4PtwQAwj4XF3by4VyNwzMDRgm/+rpekH7sStEJJVmWmO8qnPe4J9MDe6qtAz1uQqLZYyUQEcYnF73YyoVyOdzC/xgrpj9ZTyNR7aMtBn4Nf3dqVF5CmKrw0+ABoghVZsq9wzYzjS4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afOtrwEoP3isJg4lNyUk+9tUuNr4rW2pgSxV3lpuKic=;
 b=K5ZPgVp7wwJk21WHOPX5HfuqJus8rMX1iAxE8EtYhj2Dko1B1xxWExWBxfqndZUEt+znyUgQBWLcy+QZyWzZp8viO+Cgd1KFtj/XlKX5RgsxncqrfVynhZ5k0c6gEE1nnF6XJWrjpuZvAURHm4kvN72e5PErs4umcKSXQZlpqeAhVH3Q7FviWY58r03bIeFPBg9AhNylNvbPH6R5mvMsYAFZv6n8lrgt4XWSFuWPrq45AXiiC9KPhCduHQp4IKCV9eZA+smyChvucdQqjfQ1ovxcQMZGi9tRSmQDh6e83fbW49E6fyGBdBpEoLk9EmJxhTfzlDOMgGaaB4/EQN6vhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afOtrwEoP3isJg4lNyUk+9tUuNr4rW2pgSxV3lpuKic=;
 b=Nny0gTOfmn73TUzQb2/q3Ntu53FzyqopLFBYFnnoGlwoxnEv8pJKBdxIpF/JnyNBp/T0MOnZQv3s9IFZ3bGZXRPmdHI5vZPKCkdb/Tgg8C5iXlP/m7Ep0to181uzbZsdUtQrGhNqtKZNtTCB6IU4OD7LLTHAAochFYbS1uTmwK4=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel
	<tamas.k.lengyel@gmail.com>, "intel-xen@intel.com" <intel-xen@intel.com>,
	"daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Christopher
 Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>,
	Kevin Pearson <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Matt
 Spencer <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, David
 Woodhouse <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Ash Wilding <ash.j.wilding@gmail.com>,
	Rahul Singh <Rahul.Singh@arm.com>, =?utf-8?B?UGlvdHIgS3LDs2w=?=
	<piotr.krol@3mdeb.com>, Brendan Kerrigan <brendank310@gmail.com>, "Thierry
 Laurion (Insurgo)" <insurgo@riseup.net>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>, Scott Davis
	<scottwd@gmail.com>, Ben Boyd <ben@exotanium.io>, Anthony Perard
	<anthony.perard@citrix.com>, Michal Orzel <michal.orzel@arm.com>
Subject: Re: Poll for new Community Call time
Thread-Topic: Poll for new Community Call time
Thread-Index: AQHYSmRtw5Y+hIDN70CUQUPEZT9yi6z6fQEA
Date: Thu, 21 Apr 2022 14:05:56 +0000
Message-ID: <3863CBF8-797A-418E-A4D0-5C8CC93EB052@citrix.com>
References: <A4C455B8-C7DF-4287-9DB3-BCFBDBCAFA12@citrix.com>
In-Reply-To: <A4C455B8-C7DF-4287-9DB3-BCFBDBCAFA12@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 867238b8-fc14-41be-ff52-08da23a00e73
x-ms-traffictypediagnostic: CO1PR03MB5907:EE_
x-microsoft-antispam-prvs:
 <CO1PR03MB5907B791B8280243A5E4C9A899F49@CO1PR03MB5907.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SGnKTgJlN4cAgEqc3bAuWXhu8Qri59Ue7aPCjsJEXb7Wd/yS/7acp7Xhu0IzhOQhJPOJGzNggnKT3BhMKEYbwXsvn5uMhxiHc2Mt1yjvB7tBdH0lmzsMS38HM1Nmtp7quQflYBPtGvSEo5oz1vsl1kA/TlC53PsYnUj0CCz1NcTVh/X7zGvGzVAI98stsVb1Ro5jjXe9Y6wLUHku2D4D/s+8aqGCRcv5Vt+e0RnwwmJ6Y+JwFb328r2az3YAKqgd9gmdQ0azW2uncrI5ESHjhlyKKQ+OLjsC2jtIBeb3DRO51zsbwicw1soM3FrDaT3OiwIXLlZoOlIk/P/2vyIKxeLT05Zv09d+hYYYmfelxNGP5mw282P7F5sSKOKY+VoqR/h+onElesKDh6ykGD12p4tzRorXgBZq4P8jp+G8Oljx7r2E5RH5MtGnWya4nyjRb+ZdihD31HysLKvwuJ9t0nlqMcpu/A+DGtXFDYQ85rJ9xh6osVmEHX8vNlL0ukbTlrPRQ8wwtdSF7uI6j1viHBLprKH/Y+b9HL5THb/ABXy6SmkO8yYbc0C0lS0633E1Eww6X3zUSmEjgqeN4a+imdNZ9hko9Jid0dSGLRur6szWNES3zD/gbQCsX5aGqYCmi5LhP0CSw1WbwMOYOuKo+Zpezxbx6y34RsMjRQllGyZWpm/0pHwTqthAfGfVhiBoKWfM+PBBZfh9mcxr1fn4Mqztb4KDUYxQ+jTKL1qDCxn3MNsIaCgNOZmn4RwDxqtg+EyRX8KH5DU4RLkVsrqEbzRO5UsWi/C+ciGiOwUDeLFJQi33vEvjj78Mb3w9B+0OxueOxHqcXFMBy6+Bj0rmKlYTlQ3JaKHQvV8igd7owNM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(66446008)(2906002)(91956017)(4744005)(8676002)(99936003)(66476007)(186003)(66556008)(66946007)(76116006)(110136005)(36756003)(33656002)(5660300002)(7416002)(7406005)(8936002)(316002)(26005)(86362001)(6486002)(71200400001)(966005)(2616005)(6506007)(6512007)(82960400001)(83380400001)(122000001)(38100700002)(921005)(38070700005)(508600001)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGVOb0kyTzBUTnFQbFFBMHZqK1JoOFR1OVBFNjkyTWdJczVFc0pyT0o3YS9G?=
 =?utf-8?B?bDE1bXlVb3I2UnFWODhZQWNoVUNLRWlMdVJtQU5XcEtBMlpqMys1OUljS21G?=
 =?utf-8?B?Y2JVQlh5alFMQXNHZVdFQnYvTkk5elp1QU9VNWsyN3hxMHpITUhnS25haFQw?=
 =?utf-8?B?d2sreFJ0eHIzRmNLbnhXeGFHdHpQRENNTk45T3lXTHpOamJ3NnhWeDcxaDZH?=
 =?utf-8?B?Y2FDNHdVQU5HSFNkU1RPalV3encxbjBZVlBrQ2xpV0tNRWo3WWpMWHlFTk9l?=
 =?utf-8?B?QzYyNnM1Vzh3aGtSSDdwWDluYzhuNE5lbE9nTW15SnNaVnRzV1k2SU1tRTVm?=
 =?utf-8?B?YmpUNm9Sd1JEK3dKZVluOTROZDNzdzVqUDVLcjlBRkJHdS83NUNmOEJzSzJl?=
 =?utf-8?B?ZWhjbUszQVNIY3hRNnhMdElVcERQc3EzNFBrWUgxVVhoY01RQ2dxb01hRFc1?=
 =?utf-8?B?clkrWUlhVjYzZnFNVUtYUmgyWnVtTVd4S1pKb1c3RExhNVBjYWtqTXB3S2lU?=
 =?utf-8?B?a0pMR1Awb1R2T2tueTlWRVQwTFl2OHVVK3FDeUtQZjRuQy8wdzhOVjFDZzNh?=
 =?utf-8?B?NXVGdWpHdTZZN0pyNFZyemdqNnRIQ3N5NEhsYmxtdFhlQ2ZBWmJtMm1NVjVI?=
 =?utf-8?B?WHlUL3hhVlZvaVlQb3JnOTl4bzdScU92R0xkTy9ZZEdhemNIZHAvcTYvUUg5?=
 =?utf-8?B?WTU0QloyQXlnTnB0dEdCTWpMWnpmK25DYW1zdkxUV1dNeXZNS1pZWm5lN0hC?=
 =?utf-8?B?OUNvQ1U0L1FWQWh5aFJ2ZlZERTFLam5Ndk84U05hQWdpL1VJWW1lc1VnQnly?=
 =?utf-8?B?Qi8vbjNsKzNONnlXWE1VcUR0ZjhtUEU4L2UxVFNGNko5QnBVZktPcWNQQWRM?=
 =?utf-8?B?YzJrTWZkYnMvM2NqSUhTa253M1kxNEdUam5ra1VLZXlJRGJSSDdjNXRxM2F4?=
 =?utf-8?B?YWo3SlA5TXgyOFcrYWxxQWpGMzFiZ2RLL0Q2ZExWcHMrOFJud0EyZ3VrNU9q?=
 =?utf-8?B?azdoZFdjKzY3dm84MEJ3VUF1N2NMcFFUNmVVekExTDVyNGNPbFVtazUyRGJP?=
 =?utf-8?B?dUU4UCs5UnVqRHpIVzc3dHc4QVNVYmNIUlNaWk1ZUTJjTjZZU2RIOFRKdytu?=
 =?utf-8?B?N254OUVBangvcGh3dHMyNEJxelRKT0tQYjNIMnpHeFV6WTRpQk1KWTNJT3Ra?=
 =?utf-8?B?SFlaU0VtajgzU2tUWGhUVThHb1cwcG9FM1VMa25kdlAvdjlPYVdka25paDRp?=
 =?utf-8?B?YlJQbmlxbDhCQjA5c1VheGNqYm9EclNFdDIzUWs3b1ZzeVBhcDJQMk1Ea2Rt?=
 =?utf-8?B?SHlyR0N5ODJPT0NTaVNMUDV1N2lhdVMzRGovUG10Mkh6OXc5VWtCOVVpUjZR?=
 =?utf-8?B?OHhvc0daVUs2WDNuMGtNT2JXSkx2dkswUHFVL3l6dkJlVFZXNWFYaVdUaXY2?=
 =?utf-8?B?Vk9nV0dsSy9DMmNUMFVyOFk0OENVcHFEVWRvblV5MEo1VUU1cUFCUWFQYmJu?=
 =?utf-8?B?YkhYdkZLMUJ4MEEyVjJxeDRnSmFUVlNveC9Pc2hLZkcwcU04cmNnSjg3RXJU?=
 =?utf-8?B?NzA3RzFzQk93MXovU2JZVnhhVE5Hd0dQOFpFNGZCN0xIZ3ZnV0d5aVNIRm1h?=
 =?utf-8?B?cHZYNUFEOGZmVkUxYkgxaW5qbUFKSXI4U3VJR0pnVEZibjNyYzU2eGNxRkNk?=
 =?utf-8?B?US9vRi80engxc2o0bFRxRU9JR2wzV3g3cEpLY2hzYnZNQmNNZlprS2poODIz?=
 =?utf-8?B?WjJ1QjZMV1ZUSTQxSFA3VHRjaThLL2U2ZXU5eW1ZSjNLNzZSbEZGV2pmWlpt?=
 =?utf-8?B?djRFNFZjWDY5cDNGZ3lSVnhabTZkT2lsYXo0Y09ySTVpQ3prc2M0a1ZLMi9k?=
 =?utf-8?B?MnovR3hNRzE4WTlKdWxwdVRhSmExdENwczdSUkRWWExheThrZnNSUHlrVXFt?=
 =?utf-8?B?YkVDTHdmTlFOWE0xTDVRS0d2N1FHUTNvb2RNNEo0b3hubk1nQ1pXSHh5NXli?=
 =?utf-8?B?U1B2TjJ6RVV2NkRVUFlFcTdzUzFYY0FPU0VwQVpRY0pjam50YzdhV3pESXhB?=
 =?utf-8?B?b1VKVml0SnhadFNlK2hDaWplakxId2pqaFRKejU3N1Q0Y1JCbTVma0ErQlhO?=
 =?utf-8?B?b1c1NW1MQXFWa293NG4vclR2ampkamZyRW9McmpaemJPRGd4eWVEOGZqTFpI?=
 =?utf-8?B?Zlp3Y2xiLzllWlpDZWd3eE54S25wa2w0cytHSnEzV2NwMW5qc3ZreE92ajN6?=
 =?utf-8?B?NncrMDlHK3MrKzRZbmJYckxKenBkNmtpT0QvVXhaTHJFUzhEbDN5LzFxM1pU?=
 =?utf-8?B?SnFuNkpqMWcwbzhSTC84UGNXUzh6VmRmRlZlOXp6L2hYOHBSS29KbGhaam1V?=
 =?utf-8?Q?YSG0KKgqJ9Tel6EkyOb+2F7vt6zvD219XOrtt?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6312E44F-4C5A-4B46-8F59-4DA274E0E10A";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867238b8-fc14-41be-ff52-08da23a00e73
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 14:05:56.9944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nyae3gh5iJmoSg8xPeL5MuQBkgi1UePeQ71uhaovMT9y6LIIwvrSrNoWLvb13SmYVMmpiLes7PkDwW4NNM2aROyeONV+jGIncVrMzGfASq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5907

--Apple-Mail=_6312E44F-4C5A-4B46-8F59-4DA274E0E10A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello everyone,

The polling has now closed.  Thank you everyone who participated.  The =
best time turned out to be 4pm British Time on Thursday.  I know this is =
hard for some people, but it was always unlikely to find a time which =
suited everyone.

Peace,
 -George

> On Apr 7, 2022, at 10:46 AM, George Dunlap <george.dunlap@citrix.com> =
wrote:
>=20
> As discussed in the community call on Tuesday, here=E2=80=99s the poll =
for the new community call time.  If we don=E2=80=99t find a good time, =
we may just move back to 4pm BST Thursday, which is what it was before =
we moved it to Tuesday so that Ashley could run the meetings.
>=20
> I=E2=80=99ll close the poll and announce the new date after 2 weeks.
>=20
> https://doodle.com/meeting/participate/id/e1wwl5mb
>=20
> Thanks,
> -George


--Apple-Mail=_6312E44F-4C5A-4B46-8F59-4DA274E0E10A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJhZLoACgkQshXHp8eE
G+0DQwgAlKfJWMD6O3x2yxgb2ZVq7zlDLm6HQNPLfo06Y40dkQdCfQXVTwa6iPVv
nUlRMXB7ACABz3B1PQWRdF9kj4wdPJMCWgTuC4Zsu7iUnjTBfyKwLr8+WHKBTyU3
PU2Dxl3QNurCmYD+XrVPT8eLQdU6ikgwpWQrev/NDfGLqrociR/PhjVy34AtStks
KrF4Cn0dYQVGXPhlVEkc0WzL1+KMeJrME7Zvt7mckv0cUXy2N7uNcThoFCP8r4E6
vIQwC46SSV66xewZrF5Je1AIetwBWNkQ5tC/EwlkBguOvNHeRBQ1lJ2TB16A15z4
bcUCATwuwrNN38y/zPt/P3wxFFr/8g==
=WKOn
-----END PGP SIGNATURE-----

--Apple-Mail=_6312E44F-4C5A-4B46-8F59-4DA274E0E10A--

