Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9EA58320F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 20:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376419.609172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGlpD-0000HI-4P; Wed, 27 Jul 2022 18:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376419.609172; Wed, 27 Jul 2022 18:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGlpD-0000F6-0f; Wed, 27 Jul 2022 18:32:03 +0000
Received: by outflank-mailman (input) for mailman id 376419;
 Wed, 27 Jul 2022 18:32:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEwU=YA=citrix.com=prvs=20023c9d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGlpC-0000F0-3y
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 18:32:02 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65f239e2-0dda-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 20:32:00 +0200 (CEST)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 14:31:57 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5160.namprd03.prod.outlook.com (2603:10b6:610:a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 18:31:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 18:31:54 +0000
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
X-Inumbo-ID: 65f239e2-0dda-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658946720;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=s8GfIK9qtpk5yq4g8U3sd9KpWmv+v9lj+ReXvn3Xrek=;
  b=eP9janOOC6SMtUxijSBEMsVWwYIz/iW66V+V5HnRHA+EkFuSQfDJXEAC
   tYSO43W7UCmW8akrEAzrExe0Ielej86c24JN35GGLTjK1pPk7yXl/t0BF
   wStcYk0GZN+ETcCGYI5xj3gfAWiL+nKa7/z+z6SzHCIL6OzbQWqycSYeD
   A=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 76771307
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AiX/t4aoO4EOqQ63HxSvpXVsvf55eBgzWbkWyX?=
 =?us-ascii?q?Er9NTMEsledRL0lAxOEDZn2NF/8yPai0Z0tYoZLMTjUnqJTxd6LuMDNqeDwX?=
 =?us-ascii?q?FawGq36OsfuZIp0/bnD4W8TnMk4sk7A7xb10xoAraXfW+c89vpWIJDbwefvj?=
 =?us-ascii?q?D/It5HOzDGdJQiS7WILDQ1gwh3o8wXLMEtNR32uRuBm9tdzgv5FUJ0mN5noH?=
 =?us-ascii?q?K6w9TjVZijWiiJhBIKKiK+83VXpomWH9ZKm+yCYGw4Yn33naJdcwhUW64WYS?=
 =?us-ascii?q?aOHPjo2lSwJ6RqIp5foJSkHOjtw4idDe1NZgipzW3eFzGk3Nr8J3IRx+QXzy?=
 =?us-ascii?q?RZGl6jKhGNkhjXrNysvxhFF6lOKngQ0n/F9Epx0iX584wuhCzjKMv0N9kKdS?=
 =?us-ascii?q?jSF7graJmMNoAQ73zhJwTynsIRdof8c2hvZy4nfV3Y+kWvNym8r0BOxC+zMP?=
 =?us-ascii?q?pWYMIjglCCIG5SR0BbDBPJvafM/qn1wVjuJtQDT6vZZ8JXViBHyZ9WUkzb61?=
 =?us-ascii?q?KUH27dVXtbT5gF095GXaiABG7Io0AOjl3ZPKXuAlIRogqT8nkjUpNRdlja2f?=
 =?us-ascii?q?+LTtwxeTTd7JCJqF+Eu+a9t0UE+S/8L68TRDL5rHlBoOwYA0qaO253aFvGdN?=
 =?us-ascii?q?3nLATwICk4m7ZBdgK33gp160ATC4kwkzc9g3QymPwvcc9ROi6sGXwo6Zlkse?=
 =?us-ascii?q?txrt8iIrAqDyGiMtIkAjaS0EkStX5GOdMey4pJ2d47lzvScRLJW5DKE2YVvM?=
 =?us-ascii?q?cT7TqOgmo3hjFNFErxr6Bnzvp0fs09je2NMnm0WdeWZcyjF1HTOx/g2H8Ba0?=
 =?us-ascii?q?xbYqw4B4Z5C2AO2G7wrhQOwidHfmc2Vh5ZtPozz85SXc19ugN7M5i7HYQBSc?=
 =?us-ascii?q?mygdQhTYl/BbNEMPYfUM33b45DzMBmegSBZlhE7NftyHTX7X1lShsTiKInLk?=
 =?us-ascii?q?TH+lU8rUDVjsRMXPYLzSHTs3F3xZVIm0YN3EDISD5N5vjsLO5ZYwtdHxCshI?=
 =?us-ascii?q?uTDwXPYG7vwMz0UzKm6QxJ5coBFyAN5V2ZyjX0nEqkowHCgq7qM01rmbjuGY?=
 =?us-ascii?q?drq8G9xtZooadCKFzLRrNQb9guaEAe0HKDnlA90M9Zmg3n3nEcrDOl4TO6gt?=
 =?us-ascii?q?LJQAa5/fCWBNJN4Dclzcx9gsierFUXbsgEjtGC3VaeUXOQ76JCL2cD0ysseO?=
 =?us-ascii?q?hbh+s/k/cpLSukjNY6bEXqxdiKQLxyEFKYq+KaGhNhZ+swqfW0CCD1cRGejO?=
 =?us-ascii?q?ubm2LTZ+omfKFI532BquGrIQHnbb0ANZz7iUBRg6ARZKaNUefmTRHruMRQdZ?=
 =?us-ascii?q?YC/cQ4mY9hDIJjrMVy2zZsIbFjpW59iAuBK66Knq+YRC1VbeYM0W824Srrs3?=
 =?us-ascii?q?XkTyGqcp7m0G91h+pTOpNI5FHVGwIet/NHjdhdQapqplsVut0K5NsY3491S2?=
 =?us-ascii?q?Gmy7Uyzx+qW9Z+XXwp6RWLjt+vhkJ8iOK5+vydT4CNkNR7NisW17Sz7UeG72?=
 =?us-ascii?q?bI+44/FnSJjuJqC4nIypQrStGfhZ/gCvta2LjnMCXSsfYC9VHKE9SE5OXmgD?=
 =?us-ascii?q?rR8L84aNo8oL6RRXjg1m0H0yYRKFSgiLworOb3NOUC4+cG+SbhwbtMUd+Hrx?=
 =?us-ascii?q?FSl1gEbqZCXmn2SFSXRaDVWx5aJcDtWfEVKjvqqKzDEYy00ZKiHsORZGco+J?=
 =?us-ascii?q?TLa2O7Z+rC5K1tN40oiGLEcuAKyjahvSZ1kYmffOFfJadUIQ2ETowp/ik2SN?=
 =?us-ascii?q?c8W5MFNErYWaoU9cJJlD5VOcBXjSiebjhhQG1I+5OAiApS8Rnp6plA9ZNz8Q?=
 =?us-ascii?q?/CMmUb+XYFzCaZVcnZN5fL6j9cKHCX0aMhn31ozC/n+cNEVvrbghGuy1ly+M?=
 =?us-ascii?q?+htPhDhi9BPa+UoM1qa7mk178JnWrm1vXlcL2YyjgJ3M0cG0aZ1uJbywzZ4n?=
 =?us-ascii?q?7ubnYemHXc5x8hmFtSAfEfNHbzMnhv9qXxfQAsN8zLcwoYUgXWdmLRkDmMWE?=
 =?us-ascii?q?dUY75v0HJ2oADkePZXeo+f5mTXak6tsNww5DFjB/1JUzJlZMWdPro7M3v79B?=
 =?us-ascii?q?UbuZS1tARNylvnEf6uiaMMtTHNXJybrBlYAru9wMnYR+XQtcJP7GugNQ2moU?=
 =?us-ascii?q?DGVZIHpT75p8w9cPdTrHcjnd1OYaAAK7HdaUmRRPZZGoJyPdAuctQ92nR7C+?=
 =?us-ascii?q?e7s0ZEVptUH3kYRw+q20eR8HcIL1mamMW5/i25c9DSdq9UtI1RitihY4I6WJ?=
 =?us-ascii?q?jIwYxIBy0fhIWqDABgq1raB4Y6RHAjNTOT1ADX89QlONLfj6ld8+VFtPImLC?=
 =?us-ascii?q?Qzd0pVPWfq5sys+ZDz1STyOTMZHSa5uvAZlSkD4nRKjRFAw8x30zZPL/WRTS?=
 =?us-ascii?q?ZjBZ+4+pZ0A1J4V3ZdnVD7pecgTYrmFKC2BMXOnF8eThWPrOsSx5piVFeXDt?=
 =?us-ascii?q?Auvz1GOZDmn36JdAUxbcDPKKg3u4Ueut0F13TrZp2msBpkRoioDdQRoAInq3?=
 =?us-ascii?q?1ZwgyBgc991GsmmxOeIbukvp8dSRVRB?=
X-IronPort-AV: E=Sophos;i="5.93,196,1654574400"; 
   d="scan'208";a="76771307"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJGj6Ms6Bns/ybFUDDccY9tqz0HctoG9xD3bibqJc+Yjlpi1C2wF7CYpOMcX41puokeiM9npa8nz7uEue+byjZOj4z0Nlk0n739ERv6DzB1v2ySWVhsnVUsUN/EdaPu7iColh3HIduBOxYu+yNLIhrznU/9PDAogo+sXSuKXJF+NngS/XLqteuXhZ7zkZR+48WjcFC3TxMkrbgJzf8xBcmBhhOQnHgTaCzedCFkOgul4RtX/qx7T+NPrMfcMoxkYiTXvVcWS2pYtVPPUUOe++UjrjhopBgx+zAuoIUadBXO8xhf/jq+uiFp7mDzNCHBzuQgpoWK53p/zefknKSFqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8GfIK9qtpk5yq4g8U3sd9KpWmv+v9lj+ReXvn3Xrek=;
 b=PuL7T+vqkSOLBvpGDb8uvA4bEO88bYxaLXgxmX8dvHrP9Mqccg/M5WqmkFQvS6KOK41iPlC+fRk2XVevv70gwkKlFoaGvjikr1W0HAsQc3/witWLYmv4oZq2kIzV+ssT0o1c5GFCDprI/g8C4RS9E0wb9vv3nAucE/sHJHvYHbnDby7Lb23YsoznGHExkbbRJ+uj2aRMDLiZCxdt5JPHhJXwYIEueeeml67NE02BuUKCGS98Zzx/feRn4fATovWrpDkIsG06GKXdeb/kTrVNOdOBKan9i7HhiY7Ub5GwKTBkizuMBwWKfSi6XS5+zyZGiHsqEPu8/HF7FYNDIUfYiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8GfIK9qtpk5yq4g8U3sd9KpWmv+v9lj+ReXvn3Xrek=;
 b=D7RtQs5aD2qGIt4RiL7BCka5ytefsBF8UoGDJk1Qm/bn6xKZFDuK7HHXPI03gWZ3V9hBiBmmTeO3blFNuc7Z0MuxVlhyw+oUNaCXm96dJ+HDqp/AZGOtYdWkgWK5zjI7KZmRDItP3euFNxJbAujo39SS71svt6jQ5VlQEPheBeg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 8/8] x86/mm: re-arrange type check around
 _get_page_type()'s TLB flush
Thread-Topic: [PATCH 8/8] x86/mm: re-arrange type check around
 _get_page_type()'s TLB flush
Thread-Index: AQHYoQnO8OzlkeZzjkmlyR5O1pgYna2SjDYA
Date: Wed, 27 Jul 2022 18:31:54 +0000
Message-ID: <d5b227aa-c846-6e23-c24c-e34861353028@citrix.com>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <a8f707e1-528d-b372-72f4-610939acae0c@suse.com>
In-Reply-To: <a8f707e1-528d-b372-72f4-610939acae0c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1dd8c3f2-2011-442a-ea14-08da6ffe480e
x-ms-traffictypediagnostic: CH2PR03MB5160:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NXTdMVG+y7AWEwORWrw5kJzDPs5MZP3TMpKIu3uYXpMZEzttYJcUcdvnMbLzqcmXCYUUCizD4ZXojK0s5taPhjs8IB6LRNu5NYIXxGyA5OHwY/uNnnZWXSIlb5gjlZa/kSFd8dF9Q6FYpg1WcF3ut95JDfrJM5vboOJE+X8CdAyk1Os4qvYvqzexmAileqjxAWpYWVWwI8afC/STwSTIm/Qo/hsSF1XqQTlDJkGxRwWjQ0oA6AIoZkt6jImyUeXeVSDH1EASlNrTtszXxmVbROqzfZyvOLHx7dUqqZKNFI9vxGKHXlyoLUJSHU9C3KBO5yfLrKr8miBuaQdSkgfy734ovm9CLJkBejMxxLcsL2S5DCYiaOYL4Zii+ZhR7BM/OZ6KNqLMV/sesedUoCi3toI194dUwyveDht0z4PK0TD4fX8sVTBBjGOrTczh2MymThwxVDeouxykRHsNoeYxSwY8XLj33ahwdaQnBti9T18Ud9CwGQD2e7IQEcNhdHkjLAMF8cDF/Ib8Qwm8iJnkTF24H/X0aAZUclELT0UUZeKODVfvYKLsIY6WSGTaoL2rbd0N/zpVJDfjWmUmQx0bzrR9V6F6fCT27DmU7wJaCVIDVqq+/uM67hmjUzRzDF9QmtngQ9yZejGmjoOY7shi8wC0JZ3yI6ma6Z/ycPEmtfKnT7jiPt6CHheg9PjxBrpPkgqYUgKRsQh8utz3Hie3xUIa0qvBaeOkZm3UNlLlndayZIHAbwONMHrXM7DJcsKpX3d+TeLOwhn/XlbCIG3Lcg8HeiYahGbOeYPXXue1HALi+SBVHBzEyENK+kZSU8T8/8O6WzANi05bPZQzPqeooN8zTgwppqMVuWnEXpt8RYWRkYTf8YtorS3WcqnIHgeT
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(6506007)(8936002)(41300700001)(53546011)(5660300002)(2906002)(71200400001)(6486002)(4326008)(478600001)(31696002)(86362001)(2616005)(186003)(558084003)(6512007)(26005)(38100700002)(122000001)(8676002)(110136005)(54906003)(316002)(38070700005)(82960400001)(31686004)(36756003)(91956017)(66556008)(64756008)(66446008)(66476007)(66946007)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aWpmQkc0UFcvY1ptZG4vd0x6bWxSUnRBaWQ0dDFYdjZtbTJZR0xybUVZVUxh?=
 =?utf-8?B?aXJ1dGlSZC9JcTZMaDhKNTFheVJ3Y3RvNFpXVTI4dEcxb0VzSU5uMm1DTHN1?=
 =?utf-8?B?R2dJSzJiM0kxQU9YZ3pjZVVHZjdmM243WUZXbk90TzFYMEdXL3ZFeHA5dEJW?=
 =?utf-8?B?ZHVaTmlNenUyZ0w0NklDcGwvNHpOQjRDVzNwMjlYVXdoMW1PZmM5VnBlaDF2?=
 =?utf-8?B?NmN5K0JSU1g2WlNkUzFjb0hCQVZEUTh0RlNJdXI5QmFNTEt1UHFEcUVXRE92?=
 =?utf-8?B?bXpZOU9zM2p2RFd5QUtFMkNaVHJ6WTRxZHY3N2FuVkoyNzVhdjlwRTlRYUll?=
 =?utf-8?B?UFJTY1hMNXBWeE5tL3FSU0pwVlhHK05hbCtXT3ZVdFQrSkE4Y3B0c0Vhcmoz?=
 =?utf-8?B?RWR2YVdGZWYyaE9aTi95N2x0Nm1YTnh2MDJqdkpMVTgwRW1uRyswMjhvZ2Zj?=
 =?utf-8?B?VVc2UVAyT2dPMTFuZ2NqY0xkd0xEb1h5NlV4U1JWQTFwZ01ranRmdlhtdXRx?=
 =?utf-8?B?TXZpMWtBMU9DZytOOHp4K3A5TkpVQ3Q1WitwczhqcXlzclFrZ0FJWC9oeDN0?=
 =?utf-8?B?QzA1Y2wrRkxibS93Q3NxckREd2FYTnpOVGdlaXpNNzkyUlZDbENNRVh6bVpj?=
 =?utf-8?B?UjgvVS9ucFV6azlDSU9SZW01Nk9oM1NSU2VoWituQkRTaDFvMWhobmRvR051?=
 =?utf-8?B?eVJGZEJkRFo1QlpZRUJDL3JKMmM4MEpzNTJ5M09SVk5Yc0FzbXNadSs4aFVr?=
 =?utf-8?B?bnJCTWU3NWZaVVlwY3BJUTFKTzFGNGtQS1JVeW1CUEtyTHp3b3RTU01BYnJQ?=
 =?utf-8?B?UTFsVlRoK2t0endMWmpUb3ZyM3JHWnhLODhKNDdSWnd1R0QvMk5rYS8zNUt1?=
 =?utf-8?B?S2NFVXV0SGJuQnhsUGYxTXBEUmxOSmQ2UERtMThTQ1lIZDdGbElsd1Z6QzVv?=
 =?utf-8?B?M3lYOHQ5L3hZaXNhWjEwQk1hMjdiMzA2L2QvVGNKc0puMTd4SXhudCt3WFNO?=
 =?utf-8?B?bG9mMFg4bWJpcG93aWxLWkJYNVVYV3BVbjY1a0ZDTURnQ3NuNkY3KzBYNTZP?=
 =?utf-8?B?enI0TkdRTWZHT0pTMDJFWm9xamJXcUN4Q3BLZVJOUE9URWxaZzB5ckZ3Wm5Z?=
 =?utf-8?B?YzlZSTdZMFJmdGFlbDVaTWVMeUQ1YVhOM1NPcGdPVzhmenZtaHdzMTRDZjNr?=
 =?utf-8?B?elRmeXNEd093alhabXpEWG9RRFRrSkRMcWV3eUgwNlVUeHVlbk5KeHNhczh5?=
 =?utf-8?B?cGRhYUI1emhyL3p5b3AzcFhod0R1Tm5YcFY2YXEyMEw0Vll4dnVSc0JFTU45?=
 =?utf-8?B?T1ltM1QzVVplNTZIRCtEWjE2bE1panY2ME1xVTlhVkt4YlRwV3ZpS1hEM0xV?=
 =?utf-8?B?cHVWbWxxQlNla3FKYXBEM1NWNjYrZ1FEcVdKSm0yR0JCWUtjZlphVXRLYXFh?=
 =?utf-8?B?eVVZVkhzTCtNMWVXcUFCeEROWUZMYzh4L2tnTzgyam1BVUEyeW9QazBpQ0Uw?=
 =?utf-8?B?V2pCWUJSdzBYMW1HalFmQ2wwSTBaN2NMOWdNM3dEQ0JCMFZpYk5jWWdtczRx?=
 =?utf-8?B?Nk9LZFF1aVk4WHM4R1ZhWjBhTFdubFdFS1Vndmxva1M5REhvSTd1S2FhYW1J?=
 =?utf-8?B?RjVwNVJWMlFzV2JOZm1sRVVjdnRuQXVhN1BLSENJSVFHMmtIM1RYZG9XeWFH?=
 =?utf-8?B?TWV3cU84QTBmN1JWejNiaTYvWUFqdFhVTWl1aml4VTcwTjZ0UTBaZlIvNVBr?=
 =?utf-8?B?TTg1Z0pRZEZvV1g3bXlZNEFrc0gvOGRaL2lXcGhjV3VTTVlrbGdxRlRvZTR3?=
 =?utf-8?B?MXI2N1E0NTMwZjhxUnJUNW1nVCs0U2RYRjl1Z0ROWG8yclZSUkE4NnNNOVE1?=
 =?utf-8?B?UU8xN0VSYkVRb3IyRjBJWms1eUs1TGZQeU9wMlA4emdhR2Yyb1NOYXBUeEpw?=
 =?utf-8?B?VUZJS2xiNGVrTFRRZ2tvUUZFQlVsdjUzd0RZbzk4MGIwZ0Vsd0d1eXJBeDJ4?=
 =?utf-8?B?dWM4ampMSnlRYzE2NVFIeU5wcFVVeU9aNmNja2dNZXE4NlNmeExiR1Rhak9M?=
 =?utf-8?B?azZScDdWUTZTcGx5MlQwalRnY2hpZDlMOTZUVVhLU3lvU2xzUGgvMHdiNTZE?=
 =?utf-8?Q?v5fI+Lq4iEgKj+IKmLJhBkerx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9EDE999BAF2E6D44AF1959A533B9337A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd8c3f2-2011-442a-ea14-08da6ffe480e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 18:31:54.7191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hcKAxu8JlaE8/tmRS7UXcOp0X1zDCHucPK995L0hsm74zXZO8iRmkwYj7qYnkm5StNMVMRAKSjh/mT3UgLx0iH5vCmOreOmxLLtgU5kv94g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5160

T24gMjYvMDcvMjAyMiAxNzowNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IENoZWNrcyBkZXBlbmRl
bnQgb24gb25seSBkIGFuZCB4IGNhbiBiZSBwdWxsZWQgb3V0LCB0aHVzIGFsbG93aW5nIHRvDQo+
IHNraXAgdGhlIGZsdXNoIG1hc2sgY2FsY3VsYXRpb24uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KRG8gSSBnZXQgYSBTdWdnZXN0ZWQtYnkg
c2VlaW5nIGFzIHRoaXMgd2FzIG9uIHRoZSB2ZXJ5IGxvbmcgbGlzdCBvZg0KaW1wcm92ZW1lbnRz
ID8NCg0KRWl0aGVyIHdheSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+DQo=

