Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032EA5604FC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 17:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357942.586834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6a18-00085m-JV; Wed, 29 Jun 2022 15:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357942.586834; Wed, 29 Jun 2022 15:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6a18-00082l-GB; Wed, 29 Jun 2022 15:54:14 +0000
Received: by outflank-mailman (input) for mailman id 357942;
 Wed, 29 Jun 2022 15:54:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gFtW=XE=citrix.com=prvs=17228c8f8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1o6a17-00082f-4K
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 15:54:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b644e214-f7c3-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 17:54:11 +0200 (CEST)
Received: from mail-sn1anam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 11:54:00 -0400
Received: from DM5PR03MB3386.namprd03.prod.outlook.com (2603:10b6:4:46::36) by
 BLAPR03MB5539.namprd03.prod.outlook.com (2603:10b6:208:29a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 15:53:58 +0000
Received: from DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::298d:4044:f235:c782]) by DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::298d:4044:f235:c782%6]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 15:53:58 +0000
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
X-Inumbo-ID: b644e214-f7c3-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656518051;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dOJWYZSZwxLQ1p14xgUczEAKCz098QDeQcy3Z1ip4dg=;
  b=SO1pK2NEO2T80t1XKlLTsFLvV8Ky0u+fSZAHVa1cgbSt4YgVwxgTHaTe
   MSzDC86zK6D2M1GL5PwvyUK/C8aX4njy7ffceMdiYH1VGAKwJbhsAF0x0
   1uLkjKWBrs8AT8lfw3r/pV+kDft+jXe/E+9+m9kVBQm2RT9O+Cqu/47I3
   s=;
X-IronPort-RemoteIP: 104.47.57.48
X-IronPort-MID: 74036694
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7CrCDa0/cDW6y6cqfvbD5VRwkn2cJEfYwER7XKvMYLTBsI5bp2FUn
 GAWXTuBOP+DMWb1KIp2OYW39koP65Hcx9U1SVA5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tAy0IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0UrL+gbwEvBJf0lfwUfEZRMjNgIZRJreqvzXiX6aR/zmXgWl60mbBVKhhzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82cBfmajTNb9G5YasRmP//Ya
 ow8YD5maB3GbjVEO0sNCYJ4l+Ct7pX6W2IE8AnL+/tri4TV5E9o/7jOMMHFRoKhW8gLw12bj
 zjox12sV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24makXMlVM
 UsT+SwGoq079UjtRd74NzWnpFaUsxhaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOttIyRDEs/
 k+EmZXuHzMHmKaOVXuX+7OQrDWzESsYN2kPYWkDVwRty9vsuoYolTrUU81uVqWyi7XdFTjuz
 hiQoSM5hrFVitQEv4254FaBhTuvr5rISwcd5wPLU2bj5QR8DKamapKp7x7H7P9GBIefUlSF+
 nMDnqCjAPsmCJiMkGmWRrwEGrisv6yBKGeE3Q4pGIQ9/TOw/XLlZZpX/Dx1OEZuNIADZCPtZ
 0jQ/whW4fe/IUeXUEO+WKrpY+xC8EQqPY2Nuiz8BjaWXqVMSQ==
IronPort-HdrOrdr: A9a23:msYiv6xQUBlSVBy/DxzGKrPxjuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESttu/oXvUjZ1SxhkFxnAid0idvrD
 AKmWZmAy1H0QKSQohym2qq5+Cv6kd215ao8y7kvZKqm72EeNt9MbsOuWsRSGqn12Mw+N57y6
 5FxGSfqt5eCg7Bhj3045zSWwhtjVfcmwtqrQe9tQ0tbWIyUs4nkWUkxjIiLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3f7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCD34Gyff+qaGj3iq9MVlVBw6dtP22z6IJyoHUVf7sLTCJTkwono+pv+gfa/erKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.92,231,1650945600"; 
   d="scan'208";a="74036694"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EU5TN8cPFQRWz8Pt57sPbA4AnLRGgrCrwH/sU5ca2O/JaaIGeKDjQl+MLURZO0Hvao+fVYsJNWvbZ5EOdU6LnkTwzJYMG4dkLVFYAiVJ/hoj4vR3dzeFTWXkniJC+/lsdbVySZCN+RhanWwpKu0/x4y60xxzyD9kSlhXRNKgukV+lAmjaN+zvmbxqXYO1MaIVG/aZVzk23UgxF24hyym3kPQ/leicJQivNW5fPQKOJwj9IdrnYJsxd1t61iQcpNI0PMtbfebw216MRCNT0jL6WlClUV45BQ1aaChLJsZb8urY7SF5t0ckeTW/RZb/OJr75GpzXwuEeZwk7JUba+POQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOJWYZSZwxLQ1p14xgUczEAKCz098QDeQcy3Z1ip4dg=;
 b=VMLgM0nqXopfIgUyhIWVvGoMUZdmA0dM0Nid38Vl4wQTPjL358ITJR2u7DTb8KSGovb6VwQFWSHwu3Ir2CTGuPHpSHmSKs3lZclW1cpHy98k5BXpj51y8wQbu2Y88X3dNlLd4O7bBkFrwuFlVv4OotERThovulT9GCAuwNtPk9tDVaN2tsDugWkWq6IHQvY9bByvfWsWd2tpAxzOlT/dqRrdI7CiU1BwWkDNWr3SrLvmhxpU3h3j668NFZJ6fchhrHO81Af2dWIU4+7jqGPm2dj6PlCs8GmS9ba3/701cJuJzx/2PyvI6mX7OXKcubpkvDJlglxPxue7W63UOK6c3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOJWYZSZwxLQ1p14xgUczEAKCz098QDeQcy3Z1ip4dg=;
 b=oBMjDxyQhewLouXEateeeNTxBo15WNPhn3SlJ6wagkLli4/tbNXSiUw86efbsidl+lQ/lnqz3WhD8KRw54Yb6gm/gZcfx1U5VXGW4BmYDla3vRKdYvkxaN+Hu9nQ66In7O4PdlvBcVXz5OjtOGJfT0+xsbDwSyjTK1IXvKICBy4=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, David Scott <dave@recoil.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH RESEND v10 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH RESEND v10 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYi8AZy145ktbIbk+rkdBDuBblea1md2sAgAAR9QA=
Date: Wed, 29 Jun 2022 15:53:58 +0000
Message-ID: <0840f806-cd45-45c3-e6cc-cc3ed8b0bb43@citrix.com>
References: <20220629135534.19923-1-jane.malalane@citrix.com>
 <20220629135534.19923-2-jane.malalane@citrix.com>
 <29B192D0-DD84-45D8-9D1E-83C004F015DA@citrix.com>
In-Reply-To: <29B192D0-DD84-45D8-9D1E-83C004F015DA@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30da2121-cad1-4a77-17de-08da59e7944c
x-ms-traffictypediagnostic: BLAPR03MB5539:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kM81fkzzq0bHiHYraEVDmZrRazMxo0wtc+8MtVJZdZM3Rn30qbEW/a4Ro48+YtmzSKPqvC61wawfcsjF/LQMAtr7kcuH2QSew0KJ9CLTFxlQ0EZC743bpGoskVqKJc1ZaHfNigYfKJRvNEg5g9MvNauzPx6ESBCZjLLWJQ1DcHOdticgIylAWhMbE1sdFyfeLBJOWY3ItfOzAutH6ld+QqOMoDngn5f5h5+j1McGjXxFXU8UBOpoEaFHOB2584RLkIpUgnSGys5Bdc7ZnefHFiOQwpZ/uq4HTeXVJ5MrwABdfjJ/4wDbmZ+4/658zO37FOqp8zWJI9MRmzDT7faLpxzVCKBMUev4fp5ZQMyyJ+oH8x5IxY9UnHZWxtWlo4EgwAD4HeOI56wZHy5YJ7ZtQ5IAH/dB7P+qChJWeKdf0fZLi6x895IlgE7LyBEXre8H+WpDZVGdpqrnWVkduSgkTNzhz4dKirdTntUTNuawFqP4IR0twYURKGACwS6hKHB6yUV2iwCNV4mKPrCFCwaXUdvxcP6WfJhSTYpwfYWyqyPsiBgm4vmNulJ9PO5R/CRPGKaArMJrj9w1PO+byCuuyCszWex91bvZtgJuUs7PNkZgEu6Kkgfz4sqb/GC3m72YL4z4/fDn2jQkJXpuBMKF2ffbcMQCLuko2wQVG0po4W8waGy33E3fdVUwc8DHugMTQcdLlzx5wWM8qYpC/n23/+zu1bkUsjnlPLHPUVpJ8HZrAH1GL5Rs9XuyMflGr2cnVbDeIbUCnwzEToEeWhICT/utAKbakMu635towEdiPyqCuj4xfo8YSccEAqT+pJp/2J34X/Ag/D1JzYfGHEDjgw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(5660300002)(37006003)(38100700002)(2906002)(36756003)(2616005)(6862004)(6636002)(82960400001)(54906003)(186003)(316002)(31686004)(41300700001)(66446008)(6506007)(26005)(8676002)(91956017)(86362001)(31696002)(4326008)(66946007)(71200400001)(76116006)(64756008)(7416002)(8936002)(478600001)(66556008)(66476007)(38070700005)(122000001)(6512007)(6486002)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTJXYlFPb1A4VkRQcktNT05DS1d0RUVmZkZaQ0YzQnNLVzR6VUtrZmJqdGNt?=
 =?utf-8?B?UDNXSDQ3Wk1FY2lxaWlQWWd6Y0oyeGVTekRIUXZRUHVMZHRLcDhOUVdrMjQv?=
 =?utf-8?B?d0Nha25tK0MyN0owN2haUWRRWCsyVHdCZ1czbUJnQWlvL3RNbE5YM21ZSzdP?=
 =?utf-8?B?WkErQUxOUzBhdDRTL3FJVktCd3dNQy9xeUswckFNN1NPaUZzdnZoem9mK2VJ?=
 =?utf-8?B?eDVtNWYxeFk2T0FGSWl4Rk1FeFNkdEVNdFBMYnRreWpyNi9qY1Qwdk1yNjBh?=
 =?utf-8?B?MVAvNzgxbmpEdDBlUXNNN2lDZW1Cak52YmVqZy9JMUp0djN1aGZUaWVDQzJS?=
 =?utf-8?B?MFhpaTEwMnlyNXBhaHBsYlhUSGZDNHRRdVdMblNHV3RxOGx1OExUenBLV3ky?=
 =?utf-8?B?QXpoVUcwTzBWa0JXMlMzRDlYSzl2V2d3WlhQOFhpV1ZId3pHZU83N3F1blRX?=
 =?utf-8?B?SG5IMmpMMTZpd3g1NU9jYWdQWXBTMGVpQXA2MVNoN09XNXFMYzdFTnF3dFN3?=
 =?utf-8?B?RmFOcElmSlJNT2gvL25Ma3BVZ1JwTUp0TmpUWklVTlhrbVJxeDNWNG1rLzdl?=
 =?utf-8?B?cXhiUUtMODd5ZDEzNDFyaENka005RkZ4Y3RYTk1haEFWZ3RsVVk3YzBTdUxX?=
 =?utf-8?B?dnNzajJPY09Id0RXeGM2b21FaHFZOFFzUnlNbVFKWWJzRDRsSHkreklkRk9u?=
 =?utf-8?B?N2xhcTNjVXl5K3RHUGNiK2VkM0NHY1g4UDNUZEJlb2ZpekZhRDhMVFh1eDZN?=
 =?utf-8?B?aW8xZ1Y5NnZlOVlEQzNLbG5Mc0J3WFJLMmFncHBNSThPbW1VYWZjUCtPdEts?=
 =?utf-8?B?ZEdETnpEWmM2QkFQVHVBQTk5OTI3V0NDa3hHa3QzWGorRUgrcTJsTUJPZkVJ?=
 =?utf-8?B?ZDkyUzZObyttT2pzQVJLMktqWVh5bmNZNXVlNWZ3U0dtL3NnL01BQXk5Nmwr?=
 =?utf-8?B?K1V5MEJpdjdKSTQ2Nk9HRVlMN0VyK1J0WHpBeGZTT201OXZDT0ptUnVhYWV5?=
 =?utf-8?B?WndMVmQzaExCQWFLelc5Unl5aXNsbjZXRTNBT2dnU2h0MDJxWDZTd1JjdXFx?=
 =?utf-8?B?c2RwTEU0L1dTTnNBZDhnZW82dWtDQ1BPNitwN0xWUHViamszU1h2d3ArS3Np?=
 =?utf-8?B?cit6MlhFVDlGcVRnMDIyUGVndEJySStTWlFTTnFBZ3IwUy9NeTdZaG9OMWEy?=
 =?utf-8?B?WWxENXhyZjFRSjhKNGVhcldEazREUklMaVpZOTNJMnhwYm5WY2xTWWpRaS9I?=
 =?utf-8?B?dnpsMTVYWFVIOHF4WDJML2NFaEdlMk5GL0VBNXNaZlJvWk9ZdDQ4NU5yem5q?=
 =?utf-8?B?cWk3REVkLzRBWnBCWE1GS3M4Uy8rNThNRk1DV0p4VDExbmFKb1RKeVpQOXA4?=
 =?utf-8?B?Y1RXYnRLU2pWQ1ZVKzloWUVmeVB5SDkrWnJYU1lVMjdZMmpLcklRV0tZamFx?=
 =?utf-8?B?RUwrd3Uxai93bFZLKzhtUS9pNmlNYm5xbk9YRW0xOXZnVUFBaVFMQjE2Y0gy?=
 =?utf-8?B?RFJ3V3FHcGR4VkZFZlhBUy8wcHFTMGFoaFVlU0NrQk9XM3liMk1TZ0x6RkhO?=
 =?utf-8?B?Z3ZNaStkdzBHNjVodzBUZ3gvbEQ1RFRCRGlLLzQvKzF3dVVXdFY0eGZiV3I5?=
 =?utf-8?B?dnpBbEt2R0FLQWtFTmErMTdhczJ3OEdmTTFMNTRqbVlnc1NtTlVpdFdQcG9o?=
 =?utf-8?B?ZnpiNC83cmFlRnRodWs5bFBjb1lDRVdXMFhnUkNkTC9RRkY3V2JWbTBwc0h4?=
 =?utf-8?B?MEpnVnRLN0RLVTBFY05YbzlzTmRPYldheDIrNjltQXNZd2Q5SFE2aHEyLzdE?=
 =?utf-8?B?YVVFbDZGaFIwM3Y3aDZoem1pNUNoaTlneTBiNm03RUYrTm5CSkQzQ1JkRnVQ?=
 =?utf-8?B?ZktacmZtMWtWOWd6RmplOGdocjlJY0RENEpLRVBWcGhpOXExQTR5dzF4bGVr?=
 =?utf-8?B?WFVvZVk0a1FibWc4dlRlL0ZJUUhWUDNmRE9LTzF1aUkwZ292NUhXbXgxWHlF?=
 =?utf-8?B?Wi9xWTg5T3hCdUEzY0ZuSkgraG5TK3VFUnZaSmJFK3ZPOXZGdXlnTHNVdWtM?=
 =?utf-8?B?M1NsOU9RQjgrdzN0bnFIc0RXNkc4dllXWCtkR3U2aTRsZDMzTmlpZVlqS0RH?=
 =?utf-8?B?VFhQYS9uMTJlZjBtSUhaQW1jZzJRSVZjcm1GaGk5bWJSM1ZJM0dWUkxNeklT?=
 =?utf-8?B?Umc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66AAAE10AAC46448BC64EBCE544984CE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30da2121-cad1-4a77-17de-08da59e7944c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 15:53:58.6522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WdTQbEDAccc8NFRePgcvS60N2Lm6eoazAROLC91UjiI4I9W2N0dJU7/iEUsidvGbStrG180vcsXAK33iyb7Dq2b8/hvnsvsxjbIosEBpm7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5539

T24gMjkvMDYvMjAyMiAxNTo0OSwgQ2hyaXN0aWFuIExpbmRpZyB3cm90ZToNCj4gDQo+IA0KPiBP
biAyOSBKdW4gMjAyMiwgYXQgMTQ6NTUsIEphbmUgTWFsYWxhbmUgPGphbmUubWFsYWxhbmVAY2l0
cml4LmNvbTxtYWlsdG86amFuZS5tYWxhbGFuZUBjaXRyaXguY29tPj4gd3JvdGU6DQo+IA0KPiAr
IHBoeXNpbmZvID0gY2FtbF9hbGxvY190dXBsZSgxMSk7DQo+IFN0b3JlX2ZpZWxkKHBoeXNpbmZv
LCAwLCBWYWxfaW50KGNfcGh5c2luZm8udGhyZWFkc19wZXJfY29yZSkpOw0KPiBTdG9yZV9maWVs
ZChwaHlzaW5mbywgMSwgVmFsX2ludChjX3BoeXNpbmZvLmNvcmVzX3Blcl9zb2NrZXQpKTsNCj4g
U3RvcmVfZmllbGQocGh5c2luZm8sIDIsIFZhbF9pbnQoY19waHlzaW5mby5ucl9jcHVzKSk7DQo+
IEBAIC03NDksNiArNzQ5LDE3IEBAIENBTUxwcmltIHZhbHVlIHN0dWJfeGNfcGh5c2luZm8odmFs
dWUgeGNoKQ0KPiBTdG9yZV9maWVsZChwaHlzaW5mbywgOCwgY2FwX2xpc3QpOw0KPiBTdG9yZV9m
aWVsZChwaHlzaW5mbywgOSwgVmFsX2ludChjX3BoeXNpbmZvLm1heF9jcHVfaWQgKyAxKSk7DQo+
IA0KPiArI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykNCj4gKyAv
Kg0KPiArICAqIGFyY2hfY2FwYWJpbGl0aWVzOiBwaHlzaW5mb19hcmNoX2NhcF9mbGFnIGxpc3Q7
DQo+ICsgICovDQo+ICsgYXJjaF9jYXBfbGlzdCA9IGNfYml0bWFwX3RvX29jYW1sX2xpc3QNCj4g
KyAvKiAhIHBoeXNpbmZvX2FyY2hfY2FwX2ZsYWcgQ0FQXyBub25lICovDQo+ICsgLyogISBYRU5f
U1lTQ1RMX1BIWVNDQVBfIFhFTl9TWVNDVExfUEhZU0NBUF9YODZfTUFYIG1heCAqLw0KPiArIChj
X3BoeXNpbmZvLmFyY2hfY2FwYWJpbGl0aWVzKTsNCj4gKyBTdG9yZV9maWVsZChwaHlzaW5mbywg
MTAsIGFyY2hfY2FwX2xpc3QpOw0KPiArI2VuZGlmDQo+ICsNCj4gQ0FNTHJldHVybihwaHlzaW5m
byk7DQo+IH0NCj4gDQo+IEkgdGhpcyBleHRlbmRpbmcgdGhlIHR1cGxlIGJ1dCBvbmx5IGRlZmlu
aW5nIGEgdmFsdWUgb24geDg2PyBEb2VzIHRoaXMgbm90IGxlYWQgdG8gdW5kZWZpbmVkIGZpZWxk
cyBvbiBvdGhlciBhcmNoaXRlY3R1cmVzPw0KDQpZb3UncmUgcmlnaHQsIGl0J3MgbWlzc2luZyBh
IGRlZmluaXRpb24sIEkgd2lsbCBzZW5kIGEgbmV3IHZlcnNpb24gLSANCndpbGwganVzdCBnaXZl
IHNvbWUgdGltZSBmb3IgbW9yZSBldmVudHVhbCBjb21tZW50cyBmcm9tIG90aGVycyBvbiB0aGUg
DQpzZXJpZXMgb3ZlcmFsbC4NCg0KVGhhbmsgeW91LA0KDQpKYW5l

