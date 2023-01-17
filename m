Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF03166E68C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 20:06:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479764.743812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHrHr-0000LE-GS; Tue, 17 Jan 2023 19:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479764.743812; Tue, 17 Jan 2023 19:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHrHr-0000Iw-D0; Tue, 17 Jan 2023 19:06:23 +0000
Received: by outflank-mailman (input) for mailman id 479764;
 Tue, 17 Jan 2023 19:06:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHrHp-0000Iq-Qi
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 19:06:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03ad1cd2-969a-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 20:06:16 +0100 (CET)
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 14:06:08 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6439.namprd03.prod.outlook.com (2603:10b6:a03:38d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 19:06:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 19:06:06 +0000
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
X-Inumbo-ID: 03ad1cd2-969a-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673982376;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EVjnqygt9lDMeGJvS96PnGRQazzQEO6BqfdcIli78ZM=;
  b=aZSb3scqsYN573EegvKhsbqozGU6ECWlZ4J0dMI3Zkl6lhL/+j/Ogq/w
   +YopYLJcT3596288C7cYzNl4FlH/Gv0IezKXZ16SgF/j/MnpsmQhvXrKI
   c3Duu2sc8zSKkT3huKb/2MZOeyrhfwheNO6FrNsDrP4e4/BzLbNECYsU8
   M=;
X-IronPort-RemoteIP: 104.47.56.41
X-IronPort-MID: 92500914
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jT3ZxaiFZWOHSVhetByAQqB9X161VhEKZh0ujC45NGQN5FlHY01je
 htvXT2OOqzbM2HxKdklOYq/8E0CvJKHnIBiG1FspS4zEiob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5QaBzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQWIzYnfB+DwNiIyeKyELlNrdkeFevSadZ3VnFIlVk1DN4AaLWbGeDmwIQd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluS0WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDTuDgrq8z3DV/wEQMUUwST3ziisXoyWKFcuNSL
 BYZ6xQH+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqTTMFSCMV7t+lp5s85i8jVf5mGa+xy9HwQjf5x
 mjQqDBk3+lKy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDEhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:kmVhhqHRyqPfscl9pLqE5ceALOsnbusQ8zAXPiFKOHtom6mj/f
 xG885rtiMc5AxwZJhCo7G90cu7MBHhHPdOiOF7AV7IZniChILHFvAH0WIg+VHd8u/Fm9K1GZ
 0OT0G2MrPNMWQ=
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="92500914"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZ631gS05Zh0lO9MtLYxIGzr8JVvXhEqotxbf3M6HsuPTidKb5ckswAXtNtX5a2hs1lLUjf+6O1KnIca6XADeqDLjrw10ELMLRtIu2bGPVnDt45UjivCS2TDsdZQx75sTc1mIrIsw9C01PmbemnCLIWPIgSGlqnk7pdlbI9AsoTDQJlDtKLmMLUhg78Irc95/2dqLugFgmNDSf8msmKKeoBKDjJnFstgaj+F/vnWV/GGqjbDgUZoyAr5fQlBdGDANECxvDg8NyuTjyuhBzoVvlMcgzVHeN/ei3DjS13NesWwqwu3i8/UhiAUVyju9JmHbVFaSGXEzO29N5VpjDlvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVjnqygt9lDMeGJvS96PnGRQazzQEO6BqfdcIli78ZM=;
 b=ccwReucDj8wMh96zMNBg/YQKHhyHK9S04D35XbbQTPkjf31IEy699OvZOX5WVAisPyTqeKXxjE49QlRkXnEQr7qIipTCw39pd2BWgKEB8xG3DC+aSJ7QxvYYEuIF87blO0X0U1bSEJs7zv4xc2gXRJku4e5Ne8wUeKgvTKLCCn3lV00u1/ag986bPyJQF8Xpt9Dkgw+UAtBAw4fSwgAERGW8W2pRYTzh0ldUunXT/SgoTICa+6rMc4ZGnCWuU+9Ny+O3U4t9L8/P2c070fn3SyYJM1wJAW4E8qFijTBgawtKlJL+vnEUcn9VfoBDxyytpIx1oHfUroB5NikW5WjF7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVjnqygt9lDMeGJvS96PnGRQazzQEO6BqfdcIli78ZM=;
 b=IswvgmxzXse8BT3iCp1bO6TRUiTdIteas4ZdScgQ130UjA10HT7NPytGbZrGEw67mOBuB3YGRVOTxBgNVt9NXZ/P2VgM1Cg1nccOGD+Sj++3lxpiOD56i9w1ElSkI6uz/vqISCoyuUmHpXrf7XzmdfmCuGFLVtxJb9Xh2+D3TNU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2 5/9] x86/shadow: L2H shadow type is PV32-only
Thread-Topic: [PATCH v2 5/9] x86/shadow: L2H shadow type is PV32-only
Thread-Index: AQHZJcQ2cWKPiq6iKkSag94orDthPq6jAfaA
Date: Tue, 17 Jan 2023 19:06:06 +0000
Message-ID: <af3ad943-de62-66c0-2a9e-cecf2356581a@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <af8ca228-473a-6777-4a4c-a474a5faec1f@suse.com>
In-Reply-To: <af8ca228-473a-6777-4a4c-a474a5faec1f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6439:EE_
x-ms-office365-filtering-correlation-id: 1aef8a6c-9e82-472a-6d24-08daf8bde2c0
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 35+gW3tyLT7vdG8mHNbKYJejdP1HftwBn6Qs8K1Opz4IFoAvGfv9UzBZUCtPRqRE77nTDhEb9hVSAycO9vDHhRGoLxMWUsWdrABdVD4OExkCuocK867tsxoGverY7CtQ2West6eAA9kRyOrEJznvBhU26xCgh8yaDc5OoqSFFrfxr6laKqz++4gFrHp1e1vSkrY3bKQglPfiRaSrp2GfkwVFxwmEEbjZZOolb8wDQE5Nz/S3/Qk1KJ0w61D87QTteo98Qh0pr724Blzjuuitc9TzhHIB79nxPAjjtuB7SWeYBgyCkU1er8BRJ+l76z+SrA6oWiEz00bC3KS9aSb6fE1QoI76oPMm/fC0hKRmujhcC6q059rrZgr48I82EmZLiXZdaAOQQK0XWLGGfWRZbyp9tjgKbrU0BbksnldY+H0tCX8gmRueyNct8HP3eUS847qOTmNumpEIyyyQNdnmcO73YZ4/HFe7kbtwPeJbyIzXQEq1I9RvFcxwpYpEQyp+kGEiyu9FjUK471vLrhBcO5WeU1Lxet+w3NZTrhBNHpaN241tNdunOhIZFm/99x4KgIrnLNpbqOSPPIcO9TUxozHI3JTgQ1StVOdzQnvl6uwGiDhy8O4jbZBqfZw53EHo4fkyWJMj6CG/KWWkGPDjOgJ2HVSxUe6V49XYVO3nt3uyvPZ/InV8+5ZKOglcB2YGt/Wcpmvn4YHxQs0u7oHeNtkO2b4havjb7+uqzuj+3qrEnrPQOOs992U4Ch7kifThcpVacrgcY+7XyksP+wbaSQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199015)(31686004)(71200400001)(53546011)(558084003)(66946007)(66446008)(66556008)(76116006)(186003)(41300700001)(6512007)(2616005)(64756008)(26005)(91956017)(36756003)(4326008)(66476007)(31696002)(86362001)(8676002)(5660300002)(82960400001)(316002)(8936002)(110136005)(478600001)(54906003)(6506007)(107886003)(38100700002)(2906002)(38070700005)(122000001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TS9ieHgrbmx1ZHlhNUVWa3VtTzVKOHowSWZKaTNkUkFDK0lMY0Z4U2lnY0N3?=
 =?utf-8?B?bFRtVXBuRllwdzYyYVFwNDk4T28rN2pTKzFKOWxKNysySXNidlY3bFhSaEVT?=
 =?utf-8?B?dFdUV1hoNHovT0Rvejg2a2lIS204TFFTTldPL29WcWRPTWFyUGs5dm80dXRE?=
 =?utf-8?B?NVBoOTBrL3RqdGdvZ2xud3JZMUkybGhYaGt5NkpNYmhRWjFCbG5lTE9nanJw?=
 =?utf-8?B?TSs0QUpaZmhGY2JBSnQwWkZJbU1CUlFHR2hDSXpCV3NFelZvRDgxenRVbkx4?=
 =?utf-8?B?cmRvNkx3cnkrdEIvS20vZUhXY3hUenh3cHdqNlJuKzRpYVMwemtPWUtaL21K?=
 =?utf-8?B?bDhZK080TnhiWnVZc0dvYnNQajFHbjhod2lkT1lEbVJHanhnM05WYm80cWdp?=
 =?utf-8?B?SVFOSG5WSHk5OVhydTJhSWp2V091NnBVQTBhR0dsclBDTGNpNStYMDRoY1RP?=
 =?utf-8?B?Q0UycjVjbVhQYWpIMVQzeXU0NmkwenFKT3FHZnF0T1hFeXR6MTNNVmRBeXZQ?=
 =?utf-8?B?QjRQdmFkR3Q4d0tKQmx4NVhqcnpPcU5hcU11K2dZdG9jRFNwbDlQWGl3UXBT?=
 =?utf-8?B?RkQ3a1lTandrRndPb1ExZ214MzB5YjlndkhwLzViMzhJRFo2MnV4NmxrWkJQ?=
 =?utf-8?B?MlQ2VTAxUDNOL1RHS3YzdXZRYlBUbHprcXRydmxkTlVuWXp6VzllaHZPQzh2?=
 =?utf-8?B?N2t0bGVUcnI3a2d6ckMyYmM2Wlpjd3l6cHpYYU9QL0VGRVB5WTdyTG9UWEtu?=
 =?utf-8?B?cHk1TXhDdGZwREI0NmlGK0lGbm40MDd0ekFZZExoQzhoVUxpbVJMVVg1MU1Q?=
 =?utf-8?B?RE9BekY3N2JnaDdHOEdOOEJFQUxuUWZpUkdXeGlkQitjb1FLSDlYRlJJWVdW?=
 =?utf-8?B?K2JGbzBtdllyNUdacnByWmExc2JLTWZKMVp2QVcrbkpqNlRRU3g5MTlBRHRN?=
 =?utf-8?B?b2pUK1BrRjE4NW1CQ1cvZVFmalhYRndrQXRONEtBcTR1SFZMaDJYdmUvSEFW?=
 =?utf-8?B?MEJFd2JjZTAxL0xSSXUwNHZUUVJiaGx0ZG95TmYxQk9RdkF4dW4rVlQ5MjR3?=
 =?utf-8?B?V1lPSUJ4bER1SE8ySjlLVmxOcDNBQ2c4NER0cXlpR2Z3TDhxaXN3NTd6NWNC?=
 =?utf-8?B?YUhidyt4RHV5M084RHZxNnRDYXhtYVFBVzkvWFNQZmtMYlFwNXNpdDdwSldZ?=
 =?utf-8?B?QzhzenEwSk4zeEFJVS9EclJITlA3aFhBcWd1V1N5em93dnIzTXJTOSsyMmRP?=
 =?utf-8?B?cm5PUWl2Y040YU44cFNOYzZtWkhKTVlyR0pXTG5jS3hKWG1CYXNwc01TYmFw?=
 =?utf-8?B?WTR2VVRhcnFSVXdUbm5zZTNrL2dwNXN0TTNCSWtReG9CUmdTQ2M1dnJ0czlL?=
 =?utf-8?B?M2xCMXR2NG1VTVN6cXRsL2dqZERoYWZWMGl6c0IvRXF4NDJWcFRzSkxGQkVY?=
 =?utf-8?B?MlBZYlZla05uUCtxZEJFNU5ZWWxYcFQxNlN3SlFnRXhXSklOK2l2QkRsYWIr?=
 =?utf-8?B?aXp3R0huOFI0bFIxR1gwb0M2YkRMWlAyZ3pqZ0tRWUVwUHlIcSswSjE3Z2lq?=
 =?utf-8?B?M0ppL2RQOHpRTlRwU0k3VU93TDlVendHTC9xSUUzNzZ3MWEzaVZlVmVDRkh3?=
 =?utf-8?B?dkIva1p3OFJZby9DMTYwbHAvRWhuQXNDcG9CaVhSSUNOcW50VFNibmxoSkdM?=
 =?utf-8?B?YXVkeFBhRVZXN2lBWlFBeml0Tk9WZVhvSGtRU2ZueE54ZFF6VDBjaFdwdTJx?=
 =?utf-8?B?WDBFdWZZT2VOOCtLb1JHakx4K0I5QnpCNEpxYlJwRFdlNXFKdUF6dHVaQlpN?=
 =?utf-8?B?ZEdLVHVjc2pwWHlna2JGZi9OSG9UUlZQSitod2gvcVBMQVNLYm5rYkt5d0Mz?=
 =?utf-8?B?WjhFeGdMaWJRWEpvQUVOdFg1VkFFTm04N3lsaVRGbjhXMWJMNCtGL3l2K2dV?=
 =?utf-8?B?ZENtVVBRaUl0MjdwbzJHcEYwMkUzQlJjVSthZkRnSWxiOEF1aitmd1dkb1Bw?=
 =?utf-8?B?OTJhWEg0QzBkWG50QVdQOU1LR3RrV0RUVTFVaXFVZ2ptcXMreW4yN1E5QWRW?=
 =?utf-8?B?dGVqd3B1U0g0MmVEOE5sUDhZT21pMnByWENKZzMzVlQybHpVajkrNGJvaXF5?=
 =?utf-8?Q?37vsdZgJBMI5/k6Ma3l6oZsxD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE35608B46E97A4C987C7D8AF516FF62@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U6wp81gAP6ZUlBdcD0m42g2EH9U1ryA9+zazskfUU52AqlaVC1NHwNUuDepFyGAEfCJ6x/VGS5mOIMdvg4Cq9j0zsby6VmR4Ew2J2VFF3Ptnov7PdVGR0QwANfCnTnkWG1xph8YHCuY+zgkV48RJWpirgHz9Ws61WL/KeyRSpYauNyfhEwvWh7vXkD9tbaBlBqbcczzWub3LBrUH/PCyOm03y2MuoPX7/9ODFCygJ96lKk2U/RGNbc9ZJsjeXjYId5WSoS4816WjGwYT8lahzJ4pxLSLJFHo8UTeMXXT8qir+3lxkbnh2ou3j1SQqiYmeLtLqdWf678yFbbLHn7NC4k2GBb7ptr+ypQ4b6VoMX4I45pdUogAKODDB/k458FbfH0UYJ6n0OJaJytx1PJrlJMW6qzE31yB9uaVomrI2HYQIIqnIiVEoXs1yD2qKFpAiO6wV5lfLMF64w4UNOyFULzhru4wJrGaiA/O1+qqnGjiYwRgMB+GNi8nbHRsErKfQ2wjKgzNIc3f097hYojxhx5J0Ndlho1SyjmXh2Oo9ZJAgN1jMRwkrISBZFOdHaVZ7lYVRgc6rzLajBCBaorQgZhqzdKBk3INKzjK4U88XjSxhzZXEA7xBLcqe6h+2T5C/haIW2sweCrfrsfZIMa9+9pAYVZo/bb5SG/KvkW2q1ICbq5YLMnliqqyuy2yqJQSfVq0sYAb8LPgX59YUNxN/22Q186d9fUIWbrEiALejIokoiKjiMBaSzGVj07iaiFBYlJiNgEGsNb8SYh88Ql4yMDB1XnlRfRswVyiJH2HJRD3O5x9gc8T/iYOJuNlfRH8
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aef8a6c-9e82-472a-6d24-08daf8bde2c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 19:06:06.2803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rObM0cBtdLwZwCZ7FQQlH6sEvxkZluP/NJ57NGltT1PH7K/5iG2yWr3YhQEmLP+tXlyhUfMGIerVaSIU7vXzeDeMuYawU0UJEYYxeaJucsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6439

T24gMTEvMDEvMjAyMyAxOjU0IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gTGlrZSBmb3IgdGhl
IHZhcmlvdXMgSFZNLW9ubHkgdHlwZXMsIHNhdmUgYSBsaXR0bGUgYml0IG9mIGNvZGUgYnkgc3Vp
dGFibHkNCj4gIm1hc2tpbmciIHRoaXMgdHlwZSBvdXQgd2hlbiAhUFYzMi4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpBY2tlZC1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

