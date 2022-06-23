Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA65557A8A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 14:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354914.582278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4M9n-0006Xo-73; Thu, 23 Jun 2022 12:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354914.582278; Thu, 23 Jun 2022 12:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4M9n-0006UM-3O; Thu, 23 Jun 2022 12:41:59 +0000
Received: by outflank-mailman (input) for mailman id 354914;
 Thu, 23 Jun 2022 12:41:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMvu=W6=citrix.com=prvs=166a928b5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o4M9l-0006UG-PA
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 12:41:58 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc33ee43-f2f1-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 14:41:55 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 08:41:50 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5870.namprd03.prod.outlook.com (2603:10b6:a03:2de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 12:41:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 12:41:49 +0000
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
X-Inumbo-ID: dc33ee43-f2f1-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655988115;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kCpTq1JNCOQ+Xyus0Jrgcs5/tVCqsWepHnlfpIKqwbY=;
  b=dDq48Cq1NNAKlvCI5gNyex9cb6F0t5n4R1q1XXg6Nb/oVP9KmcQe5uVb
   DbN7oK71i/9GiQz4qOgp6BFxRUcAqMnrhSBHvpjAkMtaz0xMNwv9HA7Aw
   Mbxab/KyThmOxgUyVbBJCfvB7i4d2aQnOHahenCX+5TEWHVDqhDBJYOpM
   0=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 73595860
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CBdLl6IOCViAmOeCFE+Rw5QlxSXFcZb7ZxGr2PjKsXjdYENSg2YPx
 2oaCz3UO/mKNGqjKY9wYdzi/UkEsJ/QztFqTAVlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3NQz2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IxrkISyRzsuAojnpbQHbwRbFw49HrITrdcrIVDn2SCS52vvViK1ht5JVQQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM6FGvuajTNb9G5YasRmNPDSf
 ccGLxFoawzNeUZnMVYLEpMu2uyvgxETdhUH8w/E+PppuwA/yiQrgZHGKcbWYObVXJ8Ok16G/
 mjm4l3QV0Ry2Nu3jGDtHmiXru3AhyTgQ6oJCaa1sPVthTW7xHEXCRAQfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6g6Xw67Qyw+cD3oDSHhKb9lOnNAybSwn0
 BmOhdyBONB0mLicSHbY/bDNqzq3YHERNTVbO39CShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlddCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:fK3qi6/GIdqnPnBSAfRuk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-IronPort-AV: E=Sophos;i="5.92,216,1650945600"; 
   d="scan'208";a="73595860"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGJQnt5oYkj+pJw7xbHD2kPkGZTJhGtOUf1Za++q2Icj8RakF5tFY6+VOUDBEV1hPGim+hKy628GXYr+I3tjpI8TkXG2kS3oNgCs3jT6AApSsPfenAcFHGLCdiEpRjNxwWMso/TAVQZM1Z5rgFVV5x3wpjBEguKN0ROI7UxQirUIKKHfWMrsbzdJDm7MOub0nIEk+uG1vwkxQnRVTg/Ku0z1G3h2rw/BQdVqGIyji4Kh7Yb6go7gMtlWPknvXxA42iPrQ2WHpExcJ/hREpy45YN/W3WuWaW/vtiAwalN7gLSRJN+DSImd44Lis6oVVOEwofjcRSNFIH/uSVsxNiz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCpTq1JNCOQ+Xyus0Jrgcs5/tVCqsWepHnlfpIKqwbY=;
 b=Z3iX6d7LGQjiUqe5YH0dfVkyIV5T7ovHLYJh3vlSauYiwLECeQ+DVX8MF1JiRNAwxjCeYRI/jhEjwxxu0JZa3HMrfY8bN8rUnm8ARkDCezg5nr+g07UBDV9U1ya9SPK3210DesmSZcFJsNKKVa3NpAs2dFJIG4XuVTGuDnTO54MrrEu8uHYb3OYjRtbBfMcufXviBbCaIApAGfcnireMLYFJBXKS3Y51fTpv7K+zLsE5ugDKKLCtp8WscydBXMVmY5HEOALbQFyhzefmkXx80VmlKABiBefJudqff/GdDslFykknWIQmK1yQEaGZpfsBvo3eRuX6fYzT3czXCrg/TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCpTq1JNCOQ+Xyus0Jrgcs5/tVCqsWepHnlfpIKqwbY=;
 b=Ve5QjnUO+sfzMkHmmsPi5OpYSnlQPP3x9ynwtr4iisL07XA1y8hxYcUdhEvmLM45Ujb7wQBJu2WEqlgGC33kn1IIZGk7CNzA9Xbx5qJTp28Bw7w5yf4uq7oA9WiF+d1tOkaL7SAiBFArtPJtucqgY+0WbBar84Iq8Je9KLnDhvA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/xenstored: Harden corrupt()
Thread-Topic: [PATCH] tools/xenstored: Harden corrupt()
Thread-Index: AQHYhvPL6UjRJR/HKUCr4NOCggNq961c2uKAgAAUbIA=
Date: Thu, 23 Jun 2022 12:41:49 +0000
Message-ID: <1b0ea627-f325-b290-4159-57aa50d1f713@citrix.com>
References: <20220623112407.13604-1-julien@xen.org>
 <1168a21d-80be-1a9a-6a7b-7732a7126bf0@suse.com>
In-Reply-To: <1168a21d-80be-1a9a-6a7b-7732a7126bf0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6921d816-8fdb-4974-ac7b-08da5515bdd2
x-ms-traffictypediagnostic: SJ0PR03MB5870:EE_
x-microsoft-antispam-prvs:
 <SJ0PR03MB58706F14FFCC0319D7561C3FBAB59@SJ0PR03MB5870.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 N4e6rshCxuBPUaDAHohCmhCM3RdgWg8y7PWlLKBMQB0JqaSdWlgn+bGCwWmvz04q745dK88omQSc+nqGI3VYTcz4vB2sETkQq27dK7IMESjGe3O076t9oilzFbRTwWGMLuANhRMpVjaYSQ8/FMbLjPD4S07uiGUNoBFwBW1UrCXdPoJ5qTKGuBTdq5jvqmIZtg2F3onuWDBg9R2hN+w5m/wdTMK+Y7+2gxOHYItWk+XVb/6jSygSj9eF6XezRe6tc3tPazEGyaHc2bOv22W2znvyLV3zwQ7io7hFglpvp0XAGWyFeYeLGpQ07EosPHDZfc3FdlUazoZ1XguHyqbwdIqQpEo8ToR5v7z9XVoC/HYh7MflT8N9FA+hby1p/iFO72OdMNqGWr2rPaFWh14Os7PCKHq/MvI/cUGacuW472a6U3i2eUW4NuYrgmmlTw5gdcs+tLSTJV6SA7fCJrpzpZk4xOek8Y5/WxPLLX0MmaZJZJdEzCVLrwnNqlnvz1V+KpMeeXJSQBtbBtxGiC0+Sd/Y7egGMSUwWAcWhm3P8Z0k94s95Hem9zfwVi1XsfhafNgZbvsyqrLUlUqQx8RmYn7bpR/WzRiC7Aey4jaCN1xuiqaFfio+dhhxszZewPpoGs9cC4fO3y/KnXI3Dungf3ob/83klMZnBZtoTbz1g14Phr/PmE0vnXJKRiFo5BjFCCfi/SY2on/gSt0lvbJirq43e5LL/rzOcB8WmNaGoS6k55nZWmiTaR1DijDnW7W8558bZ0hNiMg8TJn7l5m0ldNKCFfGTjX/XZI16tQ6Aa2ywMDGaLC7XilxgICxODHHihj/ZlYJSa59WNtea/UZHA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(66476007)(91956017)(53546011)(6512007)(64756008)(6506007)(2906002)(66446008)(26005)(82960400001)(66946007)(6486002)(76116006)(8676002)(54906003)(31686004)(86362001)(31696002)(38100700002)(66556008)(110136005)(316002)(38070700005)(5660300002)(478600001)(8936002)(83380400001)(36756003)(107886003)(2616005)(41300700001)(186003)(4326008)(122000001)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2tTMnpGa1hrM3YyRUF4N2ZERUs5MHVzRHlHRWZ3azdWT29lQ1VjanVjWm9H?=
 =?utf-8?B?Q1BYRmlDN2xnRjNTUWcxU1lqaHpTdmN2bGJyV2Y4YTZuUHUzNFV1NEtLdnZR?=
 =?utf-8?B?Y1IzR2NqQ3VJaWQ3TU4wV3dwMVc4Z2lFOHFHVEVhaEZzaUhHVXVESnRIRzBV?=
 =?utf-8?B?VDB2WXVKaEVvOGFOeWd0cTJIZStrN05FbDBML2lRY040cWFMZzZNOEVFVGhT?=
 =?utf-8?B?QUgrN1RrUHo5SXlsZDVzaWYzQ1ZmR1E1c2FBa24zZlU5SFZjWGNDbGhtdTIw?=
 =?utf-8?B?b3kxRU9SclVZV1k5NnVLSFJPcHQzYklSWTlxOElHZjljb0VMNndpUmNocEVX?=
 =?utf-8?B?SzhrWWo3RExxaFA2d2tIRmM5Yzd0ajR0MDRnMXVxM1ZHWFZUdmNpQTVteER1?=
 =?utf-8?B?ZVk1dVZtNWR6ZmlucE5TVjFSMXBMaFBKemtHUlBYL3MzVmxTTms4Rmp6VERo?=
 =?utf-8?B?eHN0UkxZS1pFaVZSTTNpUUdMcDdUcEhzdmVQM200MmZZVnJKVzZLV01CMUZ4?=
 =?utf-8?B?ZGZJeng5S0poOE1pZGhEK1RadmNJTzExdFNPRG04RnBGSXhJSU8yU2pycFh3?=
 =?utf-8?B?UHptNlhzc2FDZ0JLQlFBL1JZYjFUOThiODlpTlErWTc4VzNkYS8wQjJlVUlG?=
 =?utf-8?B?eWcvQk5yM2xiYUxFQmJBa2l6MTlxNm10NTJHRUdtN1F0M3pHN001WDBmZHYw?=
 =?utf-8?B?dTc5Nmhob01lUTd4MDFVclBoQjVGY2xxeklHa0ZKQStMOEFiZCs1bDUraiti?=
 =?utf-8?B?Qlhmek9YWFlpSjRoTG9oa3g2M2U0aFc5dytUcXJDYXB4MldhTVhxeFpDUWFI?=
 =?utf-8?B?ZndFb21ueWZDc21jUVYvZTdCTWNNTmhUbkdtYWFPbC85SGtwQ3NHeVVnOWtn?=
 =?utf-8?B?dHhYVnFvaEo5MVZQby9mYjcwWDBLa3hqWFRPa3lWYVNHczdnL2poMVgvQmJP?=
 =?utf-8?B?RkkwS1VwR0F5SjVveVJuTWRwM2pYSlduUUtWdWdJcHN0NFppeEVCSHNvb00z?=
 =?utf-8?B?ZndtVGxrMHpvQzIvNnVKSXBMbzBXK0NNY0xrV1VNak1sYWJXK1VlYm4wUm16?=
 =?utf-8?B?TjFRU2tQdEUwa3Q1RHcvWGF5anZaaDJrNU5hdmVSVkJiZHdqYXdOVGIxZ25s?=
 =?utf-8?B?cSszQi9rcThacXFXOStSeitZQTNoc25meS93VHdkTENjM25GUTFJRnVUSDZD?=
 =?utf-8?B?MGtGazFJL0xxTTBaa3JmMHhrbE93RE83amxTMjArLzFXN1BHVHVLSmZXTkZF?=
 =?utf-8?B?RWpkRDhRVlViWVF1MWR5RldIaW5YTTl4dDBFWWdDSWNUeEhCT1oyNVljbitI?=
 =?utf-8?B?Nzd5bzRGYlR5djk2NnY4ZVNFOC9tV1crNkIvVGdnNTFQL0xQTEdqSjc3Wk9s?=
 =?utf-8?B?UHpzMmxsbUJlc3kxcGUrRThRZ0kyWmdIR05nYSsxQkNPaTVnYUdSYS8rWWI4?=
 =?utf-8?B?b2VLQ2ZvKzRxYklKRk1reHFjQXRqSHN3QWxxaHJQT3BWVGcwMTJiWWgyaVBS?=
 =?utf-8?B?emhNaWhUZDM5OXBlcHg4NWl4VjViV05qS2s1QnB2Nk1Cbld3a3MyY3RkRDJB?=
 =?utf-8?B?eXhuMC9WR3Qyb0M1RkVSWHNmdXJhZlNvVDBpMm5OMUZaQ2lOZ0hNdENBalFz?=
 =?utf-8?B?Y1laK28ydk5CVTVjMTNab1FEVmptVGo5cStGZnN3RG0vektkaElwYTNSNjBj?=
 =?utf-8?B?UUdRYXA1T00zMW1GUW1pUkQ1a2Fleld1c29kSEJoRlhyTnlYcUdkVEpMR1Fm?=
 =?utf-8?B?Sk5lYXBVUjFDRVh6QnlWbkZtOHFhNjVtL3hKdWR5cXRxVGNnVXRwa1N5ZWNs?=
 =?utf-8?B?QzJyRXJJclNVWFF0a3pXTU1OajJ2c1RMLzJtcVluN3dDQWt6NjhRQ0QrMzVj?=
 =?utf-8?B?ZUJtNVhiMUN0N1R1U1R1elptWDZOcTBQRVJ6Mms3THo4T3NwSndlQVFlQXVq?=
 =?utf-8?B?dHd0YXR6UEN4V2dib1NuNFVUYjJiY2grYlFlSWJzWWJqdE1ORVVRazRNTDVn?=
 =?utf-8?B?OVdiT3FrdTF1MHJxS1JtMDBZaEVSS2dLQ0NBTlZsZHNNZVBOTVM5SisvZWhv?=
 =?utf-8?B?NFRkb256NnptR052eCt1WVRNQmxvc2JudW4yMnpVYlgveFhJVGJnZExLTTlr?=
 =?utf-8?B?TUJFMzMzOFkyTVZsVUxneGVWYzkzaVVqb0NtZWg2c0JlRUxiWGpqQ2d1SVI4?=
 =?utf-8?B?ODVCMGFFWmtYYy9YcUlJQnJaN212bDEyOU52TWtkeW1LdzNOYmxld3RZbzJJ?=
 =?utf-8?B?a3FUQ2cyTVNCMnI1TVA4RlhWa3dTSk9PM01lMzFjanhCM3o0alVpU2NNeEQ2?=
 =?utf-8?B?VE83OGlvNnQ2RGVNcldQd3p1TXdSSThFU1N4Vi9wSUs3aDhRQWZqMFdKdk4w?=
 =?utf-8?Q?D9uAy1/nR7txA0A0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27B277B80163E94498F7A75232122E0D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6921d816-8fdb-4974-ac7b-08da5515bdd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 12:41:49.3252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vr0cczENZhlvmeuDJyq7YtQ3iBPZUzIZQaSbtCNmz2YK3xBmXhCwf+QPOAQnhqHhnzZBPDkH398NXSVNINtOCo1NJD9DNBYRj5Vvl+5xsto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5870

T24gMjMvMDYvMjAyMiAxMjoyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjMuMDYuMjIg
MTM6MjQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxs
QGFtYXpvbi5jb20+DQo+Pg0KPj4gQXQgdGhlIG1vbWVudCwgY29ycnVwdCgpIGlzIG5laXRoZXIg
Y2hlY2tpbmcgZm9yIGFsbG9jYXRpb24gZmFpbHVyZQ0KPj4gbm9yIGZyZWVpbmcgdGhlIGFsbG9j
YXRlZCBtZW1vcnkuDQo+Pg0KPj4gSGFyZGVuIHRoZSBjb2RlIGJ5IHByaW50aW5nIEVOT01FTSBp
ZiB0aGUgYWxsb2NhdGlvbiBmYWlsZWQgYW5kDQo+PiBmcmVlICdzdHInIGFmdGVyIHRoZSBsYXN0
IHVzZS4NCj4+DQo+PiBUaGlzIGlzIG5vdCBjb25zaWRlcmVkIHRvIGJlIGEgc2VjdXJpdHkgaXNz
dWUgYmVjYXVzZSBjb3JydXB0KCkgc2hvdWxkDQo+PiBvbmx5IGJlIGNhbGxlZCB3aGVuIFhlbnN0
b3JlZCB0aGlua3MgdGhlIGRhdGFiYXNlIGlzIGNvcnJ1cHRlZC4gTm90ZQ0KPj4gdGhhdCB0aGUg
dHJpZ2dlciAoaS5lLiBhIGd1ZXN0IHJlbGlhYmx5IHByb3Zva2luZyB0aGUgY2FsbCkgd291bGQg
YmUNCj4+IGEgc2VjdXJpdHkgaXNzdWUuDQo+Pg0KPj4gRml4ZXM6IDA2ZDE3OTQzZjBjZCAoIkFk
ZGVkIGEgYmFzaWMgaW50ZWdyaXR5IGNoZWNrZXIsIGFuZCBzb21lIGJhc2ljDQo+PiBhYmlsaXR5
IHRvIHJlY292ZXIgZnJvbSBzdG9yZSIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPg0KPj4gLS0tDQo+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfY29yZS5jIHwgNiArKysrKy0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVu
c3RvcmVkX2NvcmUuYw0KPj4gYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiBp
bmRleCBmYTczM2U3MTRlOWEuLmI2Mjc5YmRmZTIyOSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3Jl
ZF9jb3JlLmMNCj4+IEBAIC0yMDY1LDcgKzIwNjUsMTEgQEAgdm9pZCBjb3JydXB0KHN0cnVjdCBj
b25uZWN0aW9uICpjb25uLCBjb25zdA0KPj4gY2hhciAqZm10LCAuLi4pDQo+PiDCoMKgwqDCoMKg
IHZhX2VuZChhcmdsaXN0KTsNCj4+IMKgIMKgwqDCoMKgwqAgbG9nKCJjb3JydXB0aW9uIGRldGVj
dGVkIGJ5IGNvbm5lY3Rpb24gJWk6IGVyciAlczogJXMiLA0KPj4gLcKgwqDCoMKgwqDCoMKgIGNv
bm4gPyAoaW50KWNvbm4tPmlkIDogLTEsIHN0cmVycm9yKHNhdmVkX2Vycm5vKSwgc3RyKTsNCj4+
ICvCoMKgwqDCoMKgwqDCoCBjb25uID8gKGludCljb25uLT5pZCA6IC0xLCBzdHJlcnJvcihzYXZl
ZF9lcnJubyksDQo+PiArwqDCoMKgwqDCoMKgwqAgc3RyID8gc3RyIDogIkVOT01FTSIpOw0KDQpz
dHIgPzogIkVOT01FTSINCg0Kc2VlaW5nIGFzIHdlIHVzZSB0aGlzIGlkaW9tIGluIGEgbG90IG9m
IHBsYWNlcy4NCg0KfkFuZHJldw0K

