Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C5779347D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 06:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596179.929971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdkSt-0006VV-Jo; Wed, 06 Sep 2023 04:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596179.929971; Wed, 06 Sep 2023 04:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdkSt-0006TU-HA; Wed, 06 Sep 2023 04:48:31 +0000
Received: by outflank-mailman (input) for mailman id 596179;
 Wed, 06 Sep 2023 03:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PN8I=EW=fujitsu.com=lizhijian@srs-se1.protection.inumbo.net>)
 id 1qdjWf-0005mY-Ip
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 03:48:21 +0000
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com
 [68.232.159.83]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36747cfc-4c68-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 05:48:18 +0200 (CEST)
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 12:48:09 +0900
Received: from OS7PR01MB11664.jpnprd01.prod.outlook.com (2603:1096:604:247::6)
 by TY3PR01MB11496.jpnprd01.prod.outlook.com (2603:1096:400:371::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 03:48:06 +0000
Received: from OS7PR01MB11664.jpnprd01.prod.outlook.com
 ([fe80::6996:50d0:fd3d:15f1]) by OS7PR01MB11664.jpnprd01.prod.outlook.com
 ([fe80::6996:50d0:fd3d:15f1%4]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 03:48:05 +0000
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
X-Inumbo-ID: 36747cfc-4c68-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1693972098; x=1725508098;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bpBP0SCNVBN2dnjUTUDUlSjAYUO+VNOZmIXw3uJFKBw=;
  b=jyMOnubOJy1EjcgCVJ7GlkHkbkh8iNQc/r9Kj77EHRZrjxIpmJu7h/UZ
   fLHrf3NCpVUsUnWggDYiiRBnP6aqHB2HwSUhK9gI6ZMsLuazPuIPjqJ4R
   87QbpYHvYYvWZSjC8dVIYHYd6dP9kkIAg5ju971oeVFHJ2VjYb/KBZSVV
   jDTU6aFF5D0JcIHzykp0L2SjtvOrKyiwzt23s3XLxiQhg6Cd4ylFzZbvM
   xJHoKaCdyASt7ni/83NDC+KbNGOvcQ9L8gTLbQMhEFbtrHg6jFJQgaHO2
   lyPPDEfstpccLj8bVPkaO1cQKVSQ5rxRflx7BDtzysmmm2xckXRLNr5wh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="94290858"
X-IronPort-AV: E=Sophos;i="6.02,231,1688396400"; 
   d="scan'208";a="94290858"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtwHCt2h5m5qLpPP/0fgyouDOPRJQ/aHZRDl1twllczK6onlfuLgvzll8ZwgkhUPC+2n/YURa1VrVlRtXgoMTM1NEMaQuLsHaiTLlEB7LNM1g0sOMAjq8FwQnzMe8QOAS9de/54D+lgrtePTbuOFUKbwjF6p6W6vrS1+xLOpKF09dVwGHe5PzfWJYL5uhAg95MBn/WzIATDPZ/YR+I2fL6DoiwSl10kgUgxfvTtdywGpCTnn4CxrMwIvtjfrPjbYkQHA6AEOyV8P8h9Fpd76+lZjJCEtu8/4292uARFY5QsjsMrRfjdwSqte2xnsXTQPBbOKKL4Ej8iP4fvFwZ+tVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpBP0SCNVBN2dnjUTUDUlSjAYUO+VNOZmIXw3uJFKBw=;
 b=cbbZ4XNHrP9Ero922b8ykV/kRLzFavw1YF5jnCINfGV30ZT6yg/Gpvx/XRSklMIxhc4ifSkuh3+CtNQqbXB2RO/kHJyXxArgIl1sNtheZWNv+L+MgGW4L6/aUv/OC8AM+rj/6jnkxOmMLj98HxJu5b0dZcqN7KhIUU9TsOb8VIqaH94B5zS/9xP5fYF/q91p9FlUofX5u3gAGvo6DhRyBQ+LyWTshkgDROE4agu/GdGoEBH+lKtXBqhZnUV/2Li8do6EcnMpBeuuho2c48dQr3vmTe5nEN1KjlIueqfXuKbTHxlR8tPUWjUVQ6+eDIIYkX0d4X5wBxJihYzEz5i87g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
From: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
To: Markus Armbruster <armbru@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "kwolf@redhat.com" <kwolf@redhat.com>, "hreitz@redhat.com"
	<hreitz@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
	"vsementsov@yandex-team.ru" <vsementsov@yandex-team.ru>, "jsnow@redhat.com"
	<jsnow@redhat.com>, "idryomov@gmail.com" <idryomov@gmail.com>, "pl@kamp.de"
	<pl@kamp.de>, "sw@weilnetz.de" <sw@weilnetz.de>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "anthony.perard@citrix.com"
	<anthony.perard@citrix.com>, "paul@xen.org" <paul@xen.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
	<marcandre.lureau@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
	"thuth@redhat.com" <thuth@redhat.com>, "philmd@linaro.org"
	<philmd@linaro.org>, "stefanha@redhat.com" <stefanha@redhat.com>,
	"fam@euphon.net" <fam@euphon.net>, "quintela@redhat.com"
	<quintela@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>,
	"leobras@redhat.com" <leobras@redhat.com>, "kraxel@redhat.com"
	<kraxel@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>
Subject: Re: [PATCH 1/7] migration/rdma: Fix save_page method to fail on
 polling error
Thread-Topic: [PATCH 1/7] migration/rdma: Fix save_page method to fail on
 polling error
Thread-Index: AQHZ3A7oCOHOGe53IUCQTH8HwpnDB7ANMcMA
Date: Wed, 6 Sep 2023 03:48:05 +0000
Message-ID: <b363efe3-76ba-14f1-503f-c2ca36864253@fujitsu.com>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-2-armbru@redhat.com>
In-Reply-To: <20230831132546.3525721-2-armbru@redhat.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB11664:EE_|TY3PR01MB11496:EE_
x-ms-office365-filtering-correlation-id: d1a31b88-242e-465f-bcfe-08dbae8c140a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2niVXsa41CVKxjTq/ZP1RetlSyhUI5YRYDuhVKRpffd6AXG7PP8nVwSOXkqyN/qymvZVhREKCq518l5n52n5NF79O6nA16XtlhqkZIxhUfAMfn1JQ34nTtJulIwfYt1sQVbOEHCzThyOcldim9TovfWaDPHytnSDyGPH7WJVYoN4tfrnk9FmfPxhLFBIMXcDBSejHddx9jbEVMP+KZmt0E1Ht/OhpMh98zASwRypMMgcRnQAKyxiknYbDXZUpxIXjx83R2NNDMgf5VPQ1EHbOVIaQMwRPK7HfpWq+HIPo0AR4JpdG04G0zD+6PC3bXuK6/vYBDvOLwc1T3kFiTUT5DoJxkjJMQP2cZa08W2zAS8b81euGraiKCyR6VUQFzG2m3dNbfOzejc5K++5HP7djo2vO+4ZGPx57C769/E9OkAMWsdIKJAC0XU60LfmPt/nIxChZKzgy2Raom+Qkiv6y6fStl002J3NDTRZAPS3wClW56HFZcZEZXGo6MDkXs6gQrjtb2SslX9Q2qwN0LnS882ueZVZ2tKlafePnkBOIYsrX1+HiDG/kLL6FYSyFjpXC/zG/haMhLDkNo49d6/aq3dK4EC4gTMb3SiH5Q6hZfFDzUTAckRU8ogkhcZeVcBmghdXYVG9Ulluct/wdGwXpGGwMpvjXx2VbMiI+pcBuBcEDyP7QUkeAreqqraBCJKxKpVj/qEYPA5id01xEPwaCQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB11664.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(376002)(39860400002)(1590799021)(186009)(1800799009)(451199024)(31686004)(1580799018)(71200400001)(53546011)(6486002)(6506007)(6512007)(85182001)(36756003)(82960400001)(31696002)(86362001)(38100700002)(122000001)(38070700005)(2616005)(2906002)(26005)(83380400001)(478600001)(110136005)(91956017)(66946007)(8676002)(316002)(8936002)(4326008)(76116006)(5660300002)(66556008)(7416002)(54906003)(66476007)(41300700001)(66446008)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1dZYnFnTnFkQ2YwTENvZDExakR1ZURRZkMwb0FxVlpQblI1ZDduekNkNFJv?=
 =?utf-8?B?ZFk0TzZRSTRHcmIzVlZoYzduYWhOUWZwVmxQaS9RekREaEJydEJzb0FybHFm?=
 =?utf-8?B?VnY1TmgzOGRaVUpnSmN5VVJRalZaOXVNZTQ2MXEvbzV5UjhMUmd3Rk9pSEIy?=
 =?utf-8?B?aXpZMWFHOHZkSU1XcXQrQnJpbUtjYVJERnZZVGlRSlk5R015NE1JSFpYM2s1?=
 =?utf-8?B?dzEvUm53bS9ZQytnbG5KZjlWdDBFS1VoY2NpOTdxNW82WGNMUzcyQnhhZEI2?=
 =?utf-8?B?dURoNmFKenhpTUROU2R0dFRtOGl4OVI3TUtGeXB1ZWl6cCtUM1hYRDkwekRO?=
 =?utf-8?B?dVNjYllGVTh5bUZGdUZnS2VGcXVOOWJjY0RmZTBCQy93UVRpWnRLallBOGVO?=
 =?utf-8?B?OXdJOU4xOXltQ08zRWp2WjlNUkdsZGd1ajRaTFBEZXp1UHVFZFNPWitscnJR?=
 =?utf-8?B?Z2QveTBPMG91eUJxbXBIMlRSOWIrUGc2UTR6SFE3QUF1V2dYbzF4cXZETzRM?=
 =?utf-8?B?cDdNL0dZYm92MXY0b3RhY3NsU21QZG1NVmlmSFlDYlRJL25yY1hrdnNVY056?=
 =?utf-8?B?aEl2N3RvaDQwSmx2alZ4SlBOeVdxOTZrTTRlczlveE1PMHhKZjJaWUtKQW9u?=
 =?utf-8?B?MmRxUzF1NlNUN25Yb05EbWlaeXdjM0FLeHd6dWlFcjVnZVhHR0NjRUxtMmdT?=
 =?utf-8?B?aFpOYUovU1lrNW11VTRJRkVpaHJBTHNYL3F4NkxIQXVnNm1oZ2szTzdxQ0Vo?=
 =?utf-8?B?dWh3RDUyZFU0dkZZNU55YTB2QW5pazZ1M3F6dlZ0S2VveVBpcEZtd2s3NTVR?=
 =?utf-8?B?N0pYTjZaTzFkZlBHcGRjZDQ1UWVVQmlYbUF6NXlIdXVyaXRiRFR2bTByWW9y?=
 =?utf-8?B?REpBbUtrM2pyTWRNVlBHVUJmQmtZK21CZThjNlpiSG8xcHJ2dUVkY0RtSVIr?=
 =?utf-8?B?K2NBZ2RhVjZCSnRaQnFLSW8xbTNKK0YwcUVEOWVSOExlanNWVFVKYUZCdTNu?=
 =?utf-8?B?V05zelRSbkUyWFlpQ2hHNnVCcDBvSVFTN3lDWlUvSVQ5VXlDR0hycVlLcUdC?=
 =?utf-8?B?dTdtKzVNeFpTZXNZejZJK3NyVk5SYzkrTzM0WkdTVnh2clE2N3dMRmtHYnZ2?=
 =?utf-8?B?WFU5MlFxUm9jczE2RXRreTQycGJla2NoTkcycUpYVlRyT2hqT2dZTFhvTmlP?=
 =?utf-8?B?aXhreXBsb2F2S1hvMHBmUzB2aE0yOVMyUUFhWEY0TkJjK29VQ1NoeDlFa3BC?=
 =?utf-8?B?MlNPSnIzejExcHlQNzgzN25PbWgyaHZMbjBJZ3hGT3BlVVVzTVhtQndPUFdk?=
 =?utf-8?B?bzdkbkV1K0Y1dGQ0Y3NJb3pTTmF3MVZGNVNwTkRBdjdMUzB1QnZvano2SE4x?=
 =?utf-8?B?VzBORzhPczlWTUkzZTZSS2NkbUswVFprMmt6ME9EeEVLSkZBQVRzbzJYUnJy?=
 =?utf-8?B?MGpzUDZWd0hNVkV5TmZaNWFPNHZ3V1plbHdySTQwSGNDZGg2UldRQmIwVlV1?=
 =?utf-8?B?SmlSc1dlZm84MWljdmx2THlUbm9JN3kvVm1zbG5sMTZUSGxOZnZDaHJTaVpO?=
 =?utf-8?B?S0xxMHAvYXZPQnAvZ1JHUjhqQi9tSUUzb0hvdzRvVU83b1lIOHZzdy9ENnJ3?=
 =?utf-8?B?ZnYyM2YyZ2F6dG1CY1dNc2tNTkxoY3lOL2UxWWRJcjNYWjhtNE1lZkpXeWNw?=
 =?utf-8?B?MEJDVXpjVmpycUs4NkJwTUQydUpGc0o5c3pieWwrOVRYWWFMcE03ZEMySXBV?=
 =?utf-8?B?dEp4K2ZMbUo0dGxqWWFGRTNubzRYeGI2MW1QWmpzbnZ4bENXaytJb3hrTWpz?=
 =?utf-8?B?RGpvNVY4WHUrMDdnK1JuM3BPQ0dXVmlnRzdPK2RYTGxoSGllVVFmOU5jdjBB?=
 =?utf-8?B?RFNoUGFKVkxpN1pWVnV6dTBFNFZySmUwVVFhVDdNRlY5NzUxSGVNRUlPZmdW?=
 =?utf-8?B?OXVzTEY1SDNvNXhwU0Y4NmlqdFBld09vdEdkSmlEWTJCemJ4V2IzOE5XZk1r?=
 =?utf-8?B?REFFNzJKeHNYT3p6R1JFVS82Z2JCc1NvZTYwMmNSUmdtOVMyM1J3Q2JlajYz?=
 =?utf-8?B?QUUyTWtLb2wwc0U5a3RXcFpuTlpKN0k2U28vdVRoYW5aY2orQk43Z2JmU3Zq?=
 =?utf-8?B?bWh4NGNHK1Nmc0NrNktwMUJOVUhtVmpPOUlOTkRYalphTE5EWUdIMDdoakUr?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <215BB8D900A32D48BEF9A0DFCD72C7B7@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?UVZhb2NpT1VRSEIrZmFOOUx6VVJjdnZkcHNRbjNrbGZvaERhbENHMXFIejkx?=
 =?utf-8?B?Q2czYUZGZmZlN3hhVG9KZkgzUWdxNzNZcTFqa0Y2cFlHRzNzc2Q5YTNSbU1a?=
 =?utf-8?B?eng4cFhyaG9EN2Mzai80RVpUeU5Tb1dlb3dsMWVERGo3dkNyY3hsckJDZDBE?=
 =?utf-8?B?bHNhUFR5SnJUZXBjOHBFT0o3OWJZR21mOFZYQ1dQaVlRVzJ0cmcyeGpwWHlF?=
 =?utf-8?B?QXlQRDBMcDV6K0JEaUI1akJNelVtUGtYblZkNzFmbVdvQjVwVDJzLzc0UHh5?=
 =?utf-8?B?QnJHc1lYT1RLWFdncGs5ZkdBMXVqeTl3VGw2TnlmL1R0RkZLYVNmcDRvWmlR?=
 =?utf-8?B?TExjTm44Qi9CQWJQUzcwOGxsdE9IY1hlb21YOHRyS3lnWnBuM1lZSlA1SVB5?=
 =?utf-8?B?WFExNld3ZkJ5VXF6UGFSRnhoRGFROUNpT05MZE9GUWMrREVSQ1hjZ3Z0ckxr?=
 =?utf-8?B?eEN2WlB4RC9vdzVUVEJpUi8yWmdlb1cvN1VRRXh0Yks0UVMzSHpadkc1aU5p?=
 =?utf-8?B?UDRYMHBsRzdoSzRHSFBMU1hUMmtIdW9TdnFqTWRPUVB6bTlaUCtkcVJ0NXB0?=
 =?utf-8?B?bEVDVnhmaEtpVUp5d3ZlM1Q4Zkg0QlRaQWQ2a3htK1BTRnoya3FIbVMyNFZW?=
 =?utf-8?B?UXFLUmJRLzYxNGdDL0JhU015ZXluVFBhMVJnSVhiRFBkazNKYWloZHR3WWlq?=
 =?utf-8?B?Nis4aUZaSm9SclhoYW5RUFlSbFlLN25NYURpdndOTWFNSk9tTi91cjkzYzdL?=
 =?utf-8?B?bjF4c1BuZ3IyTWdyNEU2Z1ZYTlN2SXRPK2lsV0V2YmhZSWQ0REVIM1dLVGgz?=
 =?utf-8?B?cWtiM1ZUYTIrNm1pc2RSNXNuRm9EQUh0U2ZsQ3prYjZQa1RrSWx1U2hZLyt1?=
 =?utf-8?B?OStpVnZnNzFqQWtzbXNZclZnOHl3Vk5nSEhMUG5MWFBCQnhuNFpHcEpCbHNH?=
 =?utf-8?B?ZE9kWkRtWC9LWWlIYWV1aWxkQXlyT1psU0loNkVmWHl3YUVueCt2aWJEb0k0?=
 =?utf-8?B?OVZNK1JkMlM5c3F5OWJ3RFpPUURUN0RDc2RIbjhraTdhbnl5NVMxNnp4cmFr?=
 =?utf-8?B?TTlSQzU4UEtCam82RlR1WEcxd2o1UjV4U0dPNEorTmxRU2JNc1VIMnU2MHVD?=
 =?utf-8?B?MjFKYld0UjNZcElzSmFvUnpvckYxVHVmN3laUTFoU2kvakJZOFAzdUtpZi9N?=
 =?utf-8?B?MDJrdzJvSjVxLzNydHZzclNkdUlXS29lUzFXdGlSb1liY3BZdTNMQm5EdEZL?=
 =?utf-8?B?b0JXWGlqa2lpYlJud3A3Z3NhenhKandBQnU0NVRUQWNaN2kzbk8xdHNUOXhk?=
 =?utf-8?B?OVhwRVhqVW14aGwzbm03K3RHTjFVL0ljR1puL1g3T0o0RnJDZzJySmtLUnIv?=
 =?utf-8?B?N1g3MXdDRTVYdUxkVHVGYUViMHZVSU45ZUJocWtjSkdOUTJWbStWN0w1VWFl?=
 =?utf-8?B?SjBIc0d2YVoyWkhkNDNkeHBqdTVvUDd6SFo5VjR6MWpIdDhsUUxWL0NlNU5F?=
 =?utf-8?Q?tLd71Q=3D?=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11664.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a31b88-242e-465f-bcfe-08dbae8c140a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 03:48:05.7810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pa1IIalk7dWWCHf/i6eHcdJf+iw7VbsOff5+cZXQg2ByPfIKhBA8b0lVjMAXnjDYI9Cv2ApqvlGec3LlpckDsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11496

DQoNCk9uIDMxLzA4LzIwMjMgMjE6MjUsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOg0KPiBxZW11
X3JkbWFfc2F2ZV9wYWdlKCkgcmVwb3J0cyBwb2xsaW5nIGVycm9yIHdpdGggZXJyb3JfcmVwb3J0
KCksIHRoZW4NCj4gc3VjY2VlZHMgYW55d2F5LiAgVGhpcyBpcyBiZWNhdXNlIHRoZSB2YXJpYWJs
ZSBob2xkaW5nIHRoZSBwb2xsaW5nDQo+IHN0YXR1cyAqc2hhZG93cyogdGhlIHZhcmlhYmxlIHRo
ZSBmdW5jdGlvbiByZXR1cm5zLiAgVGhlIGxhdHRlcg0KPiByZW1haW5zIHplcm8uDQo+IA0KPiBC
cm9rZW4gc2luY2UgZGF5IG9uZSwgYW5kIGR1cGxpY2F0ZWQgbW9yZSByZWNlbnRseS4NCj4gDQo+
IEZpeGVzOiAyZGE3NzZkYjQ4NDYgKHJkbWE6IGNvcmUgbG9naWMpDQo+IEZpeGVzOiBiMzkwYWZk
OGM1MGIgKG1pZ3JhdGlvbi9yZG1hOiBGaXggb3V0IG9mIG9yZGVyIHdyaWQpDQoNClRoYW5rcyBm
b3IgdGhlIGZpeGVzDQoNCg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJt
YnJ1QHJlZGhhdC5jb20+DQoNCg0KUmV2aWV3ZWQtYnk6IExpIFpoaWppYW4gPGxpemhpamlhbkBm
dWppdHN1LmNvbT4NCg0KDQoNCg0KPiAtLS0NCj4gICBtaWdyYXRpb24vcmRtYS5jIHwgNiArKysr
LS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL21pZ3JhdGlvbi9yZG1hLmMgYi9taWdyYXRpb24vcmRtYS5jDQo+
IGluZGV4IGNhNDMwZDMxOWQuLmIyZTg2OWFjZWQgMTAwNjQ0DQo+IC0tLSBhL21pZ3JhdGlvbi9y
ZG1hLmMNCj4gKysrIGIvbWlncmF0aW9uL3JkbWEuYw0KPiBAQCAtMzI4MSw3ICszMjgxLDggQEAg
c3RhdGljIHNpemVfdCBxZW11X3JkbWFfc2F2ZV9wYWdlKFFFTVVGaWxlICpmLA0KPiAgICAgICAg
Ki8NCj4gICAgICAgd2hpbGUgKDEpIHsNCj4gICAgICAgICAgIHVpbnQ2NF90IHdyX2lkLCB3cl9p
ZF9pbjsNCj4gLSAgICAgICAgaW50IHJldCA9IHFlbXVfcmRtYV9wb2xsKHJkbWEsIHJkbWEtPnJl
Y3ZfY3EsICZ3cl9pZF9pbiwgTlVMTCk7DQo+ICsgICAgICAgIHJldCA9IHFlbXVfcmRtYV9wb2xs
KHJkbWEsIHJkbWEtPnJlY3ZfY3EsICZ3cl9pZF9pbiwgTlVMTCk7DQo+ICsNCj4gICAgICAgICAg
IGlmIChyZXQgPCAwKSB7DQo+ICAgICAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJyZG1hIG1pZ3Jh
dGlvbjogcG9sbGluZyBlcnJvciEgJWQiLCByZXQpOw0KPiAgICAgICAgICAgICAgIGdvdG8gZXJy
Ow0KPiBAQCAtMzI5Niw3ICszMjk3LDggQEAgc3RhdGljIHNpemVfdCBxZW11X3JkbWFfc2F2ZV9w
YWdlKFFFTVVGaWxlICpmLA0KPiAgIA0KPiAgICAgICB3aGlsZSAoMSkgew0KPiAgICAgICAgICAg
dWludDY0X3Qgd3JfaWQsIHdyX2lkX2luOw0KPiAtICAgICAgICBpbnQgcmV0ID0gcWVtdV9yZG1h
X3BvbGwocmRtYSwgcmRtYS0+c2VuZF9jcSwgJndyX2lkX2luLCBOVUxMKTsNCj4gKyAgICAgICAg
cmV0ID0gcWVtdV9yZG1hX3BvbGwocmRtYSwgcmRtYS0+c2VuZF9jcSwgJndyX2lkX2luLCBOVUxM
KTsNCj4gKw0KPiAgICAgICAgICAgaWYgKHJldCA8IDApIHsNCj4gICAgICAgICAgICAgICBlcnJv
cl9yZXBvcnQoInJkbWEgbWlncmF0aW9uOiBwb2xsaW5nIGVycm9yISAlZCIsIHJldCk7DQo+ICAg
ICAgICAgICAgICAgZ290byBlcnI7

