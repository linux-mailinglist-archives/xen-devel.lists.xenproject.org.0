Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933E435175D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 19:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104695.200533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS1Md-0000NL-12; Thu, 01 Apr 2021 17:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104695.200533; Thu, 01 Apr 2021 17:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS1Mc-0000Mw-Tj; Thu, 01 Apr 2021 17:44:14 +0000
Received: by outflank-mailman (input) for mailman id 104695;
 Thu, 01 Apr 2021 17:44:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lS1Mb-0000Mr-IP
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 17:44:13 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2f63e19-1bb4-40ff-a719-d6786882b7c7;
 Thu, 01 Apr 2021 17:44:12 +0000 (UTC)
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
X-Inumbo-ID: f2f63e19-1bb4-40ff-a719-d6786882b7c7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617299052;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+791JNpeEdaqd7sL8/wPJrh4NVafG8GswQ+wOJdn8Cg=;
  b=DlY3T4FP+egsAd8OU51wzWYnG53JYh/IsVqJDlV5PocYqSISUFfFYn0x
   qzRSOUte0ma80bjxO2Dre6k33V70ClQIcmvZwEYPfHHL8p5nsPsrS8tQo
   uAc50t7zT+bilTWJ12K+oqtfwVqYEFobNEX+OAommtEemKZr+TV/2I2yL
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lPQNur7rz93qhrVQe/y/aFmx6nG6P5Xq6ZfvKzbP4Pmmz5Vkp1FnJ8mZNMDCEWM4sG0Bda9MAg
 zn5Aqh+H/OfhhVQq5KfSOu85P6mX+LY2wdbcwL16ZtsWZ1bws+zSIFWFo2P5EYV90Zisdnf/cU
 vo7EGGuw5NvYsV2kAgGDKWXxsrB0w7gzxBZymSM9KgFIf92oUk9G4q5pFkctRiEThpxRHD1wSa
 loBgKCub0dPOGV6pYQgtPqgD1r+1rEXP5SDV+JBNw7hQ1oL/UZhGZ+SrZ9kH4ReFKoichBCLE3
 ncY=
X-SBRS: 5.2
X-MesageID: 40730594
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:UBRIVa//5mftcagWf5xuk+F1cL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2OmO2dxQxRLAod8MZ
 Ka6NZOqTbIQwVpUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbySw9BEYTj9J3PMe4X
 HI+jaJm5mLntOa7lvn12HV54lLg9eJ8LV+LeGFl8R9EESVti+Gf4JkMofy2wwdgObq01oylc
 mJnhFIBbUI11r0XkWY5STgwBPh1jFG0Q6Q9Xa9jWH4qcL0ABIWYvAx/L5xSRfS50o+sNwU6s
 sitAj4xvkneC/opyjz68PFUBtnjCOP0B4fuNUekmBFVs8mYKJRxLZvjH99KosKHy7x9ekcYY
 9TJfzbjcwmE2+yU2rUpS1GztCqQx0Ib2y7a3lHkMmU3z9KpWt+3ksVyecO901wha4Vet1q4f
 /JPb9vk6wLZsgKbbhlDONEesevDHfRKCi8f166EBDCLuUqKnjNo5n47PEc4/yrQoUByN8XlI
 7aWF1VmGYucyvVeIOz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykuO7ys9vQfHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk8pss7YVSTucjGQ7ea9tDzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzvWmx7Ud3TxelHu3J55HaTAltJjjbQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eaqACNjCL1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXWhT2XCANyJuVs++Kn
 8Zm31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3oqO+NniYZF9Kpo9QqR+GUHqGnVO6EdXgV
 YGTDVBal7UFzvoh6ngpocTHvvje951hxruB9VVp3LZvUC1vtouWXMfYj6rXaes8EQTbgsRom
 c0374UgbKGlzrqA3A4mv4EPFpFb3nSPKhLFz2fZIJfmqnifSZ5SWviv03dtzgDPk7Rs2kCjG
 3oKiOZPdXGGEBUtHxj3qH2y19sbWmGc0Vsand1jJ1lGQ39ywRO+N7OQpD2/3qaa1MEzO1YCj
 3DbDcICi5Fxty81neu6Xy/PERj4q9rEv3WDbwlfb2W52ikL5eQk7oaW9VO+ox+CdzouugXcO
 6WdgOPNgnkA+cx1wH9nAd9BABE7F0f1d/40hzs62a1mEMlCf3JOVJ8WvU1Jcqf42WMfYfA7L
 xJyfYO+c2+PWX6ZoTYleX5bztfJgjSpmDzZecyspxQtb8zsrw2P5Sza0q+6Fh3mDEFaOHznw
 ciZY4+xpbrEIpmZdYTdCJU5UBBrqXFEGIb9ijNRtYjdlQshULBN9yH47D0uaMia3fx0DfYCB
 26yWlh5P/LUCuI6K4CB48xKWpQblIg6H4KxpL1S6TgTCGrffpE5ly0LzuUd6JcUrGMHdwr31
 tHyuDNu++cbCzj3g/M+RN9P6JV6m6iBee/GhiFF+IN09u0Pz238+eXyf/2qDf8Uj2gbUsEwa
 VDaEwLd8xGzgAYs7df6Fn7doXH5mQ/k1Vf5jl7llninqieiV2rY31uAEn+mZVZXT5aL36Sq9
 /KmNLojEjA3A==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40730594"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeVm0ZCRELaqX9eG9DkrJd405agACnmMP2L5JXfCHOlAs3lz8jKOfL7VyrhSOZgYLHLKbcKO76Rtk+2PtAS60hKRJ6w34ddQKiOR0x2JT+sjTPZnnbu8k7ZCRn0zZHLFPZ1qGAtALACGPQPAeDduMLrtLZVckqTEREghwvgBfsz3b66yEpgex0DYBdiDB0RDD99dsodqbw+pJLCBJvDIxglYkUYZxiQMY3R58TyNU3j4hlk/08C0nIcNvCYaVSWwapuf/rDU/p0m0Mmi++MFxEXT/KIM8Xal4BVtYRlfrvFcBIzHf9rW9jOyIcIEqqvkqyxzgKkDvgaGBMgdmUcmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+791JNpeEdaqd7sL8/wPJrh4NVafG8GswQ+wOJdn8Cg=;
 b=j9XlgDMaSoTjBmIMTaSdDB6gXQQznmi5VLhRdMbqKFBCddd/mT9akQNm/FWpHzmkEN6MhZvlZpUarUeuiRw6QbW80k16Jdm2Q245AiteUdC9qKTBIo7XdvUsqy5EVuyitPF+YATbgXZUdOtgsgQjbLvBAewe75c5h+rG9g+R8HTze7ZNfA6WUquPGhrUFwW30PmuxxZRR61klPy1M7bTBJ6MA7m5+sb1GUROMJ6gYVyYIdw33BkxPEVio99dF6xJUPzVuaipVqRqwlurpchKd/8ddP1jaG5FicagdPTq8TrNCAec1IeZZ/zXa9+3zLpqIQ5ItdmcCgMmxdmyovVrsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+791JNpeEdaqd7sL8/wPJrh4NVafG8GswQ+wOJdn8Cg=;
 b=tvmlld+60Wcs8ZKk3CppQaspm/TrK2jvEyxzQoZXunzKITRiKEGJOcZuS8a464nAscxTv27PM9ssLyGCuJxfjHNmiOj9Ef1d5wETWrowsmjnqapwfgLnA3ySzUf+FMGQ/ex4FsHbRI7JPYy74eshnmsqKhCDpGABwq3KRp2vXz0=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-21-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 20/21] libs/{light,guest}: implement xc_cpuid_apply_policy
 in libxl
Message-ID: <f344e7aa-90c5-45ce-56be-9fae24f1e83e@citrix.com>
Date: Thu, 1 Apr 2021 18:44:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-21-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::15) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f630900c-c3ce-4dde-675a-08d8f535c045
X-MS-TrafficTypeDiagnostic: BN3PR03MB2276:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB22769482D83C12F262D92A9ABA7B9@BN3PR03MB2276.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oANtb03pswGLSbkAgG891PHakjXodvWU1e7OdC3IzBoCwlZuKOv5wJ5OUT0XGTcyTDYJkdp6l99J/4XWuBBxsJklFKcIkgWdc4WKhDG5cP5XSvivUjpaiSFCGp7DNnL8Nges787R2l8SGWKw33WFfK3z6lSQsfadzFsTQnm+FtCECIaV7Ka4us5nyoKwED/27KG31Env0kza+oJAo4blQ+Eb7Dta3WPbCfCpvyZSMt2cs4JyUSEmxdiNET9FcJw3w8lTUp4VzQMqlHOqf4O99jez2g3vLTrF4rJGgSb+F5SvZ+tlq8RMjpVOcvCz1G87Pp4AJlM0rysLyjHdreiOVBt7svVC0HFFLm4G7xvxtM0kCa/aaBwJSh3IvYJAPxesTPrL8Ts+JTWHLvX9uzPfU98GaoVRYJyXvcjE/n+puUzlwr3rVxu0CXj95kY1tgJ8bgp+R5tKuv+TkgDmwW15xDK4eGgN/VuI/1XOfBx5WnoLoXwWb+SecT2yEKgB6sd+ldTdmuAMAXizwpPDMwuOR16OvhahXYXSONroflh+hFMeNuPeUzXy2y9EMp13PDJYLz3J9FzdZp01RN1bS8DYQ/sb7AF62z8npjFXA6E7XG2ES5s06PXE2qOZFKpGysHEo15+4xGrxAWOB7EXzw9fWAi0gOha190/qwxSSOQHNzCW5/1Owoi/2XGU8rpQjhRtR6lRzxF418xZ5jpm+dzDA9MBlyhlUckYX+avklzWOJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(8936002)(478600001)(54906003)(2616005)(4326008)(38100700001)(956004)(6666004)(2906002)(6486002)(8676002)(66946007)(31686004)(86362001)(107886003)(316002)(66556008)(16576012)(5660300002)(186003)(26005)(36756003)(53546011)(16526019)(31696002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SDNVSFFOWHF2R0E0b0dHTS83d0ZRMHF1bWJpckNZZ05pTXhoNTNPdEdhWEF3?=
 =?utf-8?B?NEVjZDVMM3liWW5YRVZBbXRlZTYzSTRhVFg0enFVRndEbkZ4RTJ3SkZ4ZVg4?=
 =?utf-8?B?eW1jaTRNUmdDZW05RjloWUw1WGY4SmRlb0tka0d6M25YZ1d2cDI0Y2hVeWc2?=
 =?utf-8?B?YTVnS1JMR3Fka1dlVUZqSytQZ09KdnRDQnhpcW56a213SVlxcUN4WS9mUHkx?=
 =?utf-8?B?cVpVNU5QSnVibW0rWlJoVyt3STcvNlY3RVpCSXJuc3J6NWtaT2x3emM2RTFx?=
 =?utf-8?B?YWwzaDdlVHNLbWsvaUxZejFZQ25JakxxTXlsdDlNY01ub0UvbjAydmI4Y09j?=
 =?utf-8?B?dUVCS3RDUDJOL2pZSkZLM1FPdlRLeUhuOXJGMEhWVlVPZGpvUDFWekE4WFNZ?=
 =?utf-8?B?OUVQR3RteEtlVlhWclpMaE4veFVudXpBd002ekQxSXllTlBnNW83aVgrNHZG?=
 =?utf-8?B?Qi9uZk1hT0lFRGZNQ1IvRVdQNlprOGFwcHVWWTNrK0lrQ0RFZEdXbUV5c3FB?=
 =?utf-8?B?NVFSZjEzZHd6b1FUbWQxcHpETm5qRjcyQ0x5blBDOHRabGQ3T1RKTXdFR09W?=
 =?utf-8?B?N0I4cUlGNXVvWVNSVVEwRjFDeGhET1c0blhiMUxHZHNrb20rd2NGVUZDZ2Ru?=
 =?utf-8?B?VkRqQlZlSDJJRzZ0Wlh5ajZhbnpoT0RQY1lWUHU3Qk1JcEZ2cTNqWHRsclRR?=
 =?utf-8?B?Vk50aHBiUWV2dWRjMG01V1YzUlE4S0hKNzlrQmErYWFGNFdDTlNiczRieXUv?=
 =?utf-8?B?ZHBpOWw1cmV4VzJpZ016bUxsak9ld1lPRDZ5QTRQUlYrVlV2K2NYTk5ZVnpp?=
 =?utf-8?B?YXVOZWtPVzlGU0RlaTNZRWx6ZnRIRUZ3Mi8zcWhkcU81cldESWF6UXZQY245?=
 =?utf-8?B?dWFERmYvTmZnaUJoTlBoZ1ZhbGh1Zm52Yzc0T1l1RjFkanBtOE56d0sxa0wr?=
 =?utf-8?B?WE9QWmlKZmN3bFB2b29pYnVQODkzb2FKeGhvb2lSWERSWkljUHYzc0NXdmdl?=
 =?utf-8?B?Z1hoOGdjMDBPWkhSNFl1V1d5RHhCUXJPUk9xK3FwNFN3Q1JLK1pEVnhPaUlN?=
 =?utf-8?B?U25vbDg2TzZXUzQzcHdkb3dSRVJ1YjREMnk1NGJUL2FJb1B4cVBZejUyb0l4?=
 =?utf-8?B?MHhoeEFsYVdCWTFRRnpXY05vdTRHeXA3d2taN3FIK0hkYkNYMVFOajZuSXR5?=
 =?utf-8?B?VFlaREdsWXVEaXFVeDA4TlRtVWZUOWhaZktoWDFaWjUrSndBOEZKN0VmR09K?=
 =?utf-8?B?VzVMN2xJOW11Y3hyMXdoWklPV0NjVS9EY09VNFEyalZQTEx4YjdSWDhoVFd4?=
 =?utf-8?B?Zy9IN2dxUUZSY2tWcWtZVUJJWVRheXd5OVk4NjdKcVYxT2dKcEg4NTNkd1ky?=
 =?utf-8?B?TU9oNk5VNlFpRHk0b2x3VFJZS0xad00xUzVWMnVwTWpiMU5EUHRDUWFGUHAy?=
 =?utf-8?B?RGVhQk5DbjkrUUJ0MWt0cWtvNmVwTHRmVmkxNWtwUjg3ano5ekpPYlUwaExQ?=
 =?utf-8?B?UDlqL2RrYnJSQW1DV2dmRGgxR0N6cS9CQTNweVNtU3ZxRW9XYWtxYVNXZS9F?=
 =?utf-8?B?Y2RJSGUxY2NqNG9NcVMzNXQ5ZFpLS2c5NUlPczFsMDJIZmpMOVFyYm9mUEJE?=
 =?utf-8?B?eFNaR3VQbllCT2xsc2R6aFRZTTVZZllDV2xUQS84b2dpVXB3VDVQY1Z2TXBJ?=
 =?utf-8?B?TkFrdTBJaHJrQ3dtSXlFbHc4NDJ3RnlOdzFySk10bGg4NjBPZlhSZWFaTDV1?=
 =?utf-8?Q?stCrBhjffUADomFAiT0yBTdHS4F4YjMaHxbbEjC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f630900c-c3ce-4dde-675a-08d8f535c045
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 17:44:08.2639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ve9tOgWQoDNu8uikKDz/PYRleluodQKnG2osYU0HtAbRLI1bMkjDlFj3xmxX4PK3uTEo8dMlAEmTm5CKpgkBCCjK5LiKj0SDQk4n9x1ZdYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2276
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> With the addition of the xc_cpu_policy_* now libxl can have better
> control over the cpu policy, this allows removing the
> xc_cpuid_apply_policy function and instead coding the required bits by
> libxl in libxl__cpuid_legacy directly.
>
> Remove xc_cpuid_apply_policy.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> I'm unsure why this is called libxl__cpuid_legacy, mostly because I
> don't seem to be able to spot a libxl__cpuid (ie: non-legacy version).
> Should this be renamed to libxl__cpuid?
>
> 1b3cec69bf300e012a mentions the process of switching to a new cpuid
> interface, but I'm not sure we need to keep libxl__cpuid_legacy, since
> that's an internal interface that's not exposed to libxl clients
> anyway.

"legacy" was referring to the pre-4.14 migrate-in problem.=C2=A0 It was the
best I could come up with without having a firm plan of how this series
was going to look like.

That said, the resulting function is still very definitely doing thing's
I'd consider "legacy", so perhaps it wants to stay named like this until
we've got a better plan for how to enable non-trivial features.

~Andrew


