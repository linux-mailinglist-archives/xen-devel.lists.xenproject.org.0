Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0692414517
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 11:27:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192321.342713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyWf-00016A-I4; Wed, 22 Sep 2021 09:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192321.342713; Wed, 22 Sep 2021 09:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyWf-00013W-F5; Wed, 22 Sep 2021 09:26:49 +0000
Received: by outflank-mailman (input) for mailman id 192321;
 Wed, 22 Sep 2021 09:26:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSyWd-00013O-IB
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 09:26:47 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a4066e4-9bc3-489c-8fda-8ba9de13a1e0;
 Wed, 22 Sep 2021 09:26:45 +0000 (UTC)
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
X-Inumbo-ID: 7a4066e4-9bc3-489c-8fda-8ba9de13a1e0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632302805;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Bv5lzHPLRLFDVicasBh8gMjl+/oe3pl7ljKyz7qv7QA=;
  b=JHL+j4q1daN+h/FzN+8FRbaXpvPuOKoK9U3SLOnWcIdaFO474Yyd2Cu3
   8QbPjptBviX4p6XeJoNNDPt8V57EUmDFMBJ2GGCngxGg/6AwARg4sv+dx
   CZQNhb6TPYfaKBmNE+dMjKx2Rld5ohqJM4cn5cGtuxKXDxJTIT39WGORO
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oogck7G+RwvXlYQTkvzOhp1dp/dr9RLR5nLwk+UPdHu/aslLE3wCSV0Zv+NTlH+hun38NxLJPd
 LRRv3lHPcMxWS0GnEisTu6iqpJllawky+dgLIURD7K+7yQLN9PXXxpgjCNIecI0Uz/Jy6m9Dkc
 xr4yqDo/1Y+TTvCbmoLuPvlAlZREyYR+0Shc4vBZZDXtI4nTZL6xK7T+mlq3MUYOE5gNLbApJn
 minvaPh2GNmHI1m8TL9HBfa/vTUCpW+KlBKHvgtRFqg+wsnYI9sTrloe5Dxe0essszZIJSuqbp
 +bAOGYUxq92CN0pU82trFyR3
X-SBRS: 5.1
X-MesageID: 55105045
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tZtqPqjOr1eulYqM9kpV19+UX161shcKZh0ujC45NGQN5FlHY01je
 htvXGCFPaveNDD2ctp1PI22oU9TuJOBnIVgSgNp+ykyQSMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg2t8y24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1W5LK8Ui07ZJTUldgMTR1lK2JDJqRZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t25kWQK6CO
 qL1bxJhZh3xXQcMPms2K5AUzNuqpkjeKQdx/Qf9Sa0fvDGIkV0ZPKLWGNjIft2HQ+1Fk0Deo
 XjJl0ziGQ0TPtGbzTuD81qvi/XJkCe9X5gdfJWn8tZ6jVvVwXYcYDUUX1ampfiyimalRslSb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6YGWosXjNHcMYhtsI9WXotz
 FDhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTTRVYwceycu5mZk+sgPRSutbU5Ouh8KgTFkc3
 Au2QDgCa6Q71JBQjfzrowyf2lpAtbCSEVVkvVy/snaNq1ojPd/7PdTABU3zsK4YRLt1WGVtq
 5TtdyK21+kIEZjFvyiEWuxl8FqBtqvdbWG0bbKCGfAcG9WRF5yLJts4DNJWfh4B3iM4ldjBO
 hS7hO+pzMUPVEZGlIcuC25LNyjP8ZUM6Py/DqyEBjaxXnSBXFDep3w/DaJh90vsjFItgckCB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikUQHDLKmPXmJrub+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwljITXFXLdleHbG5NcrTqUcotpH43J3V0b12px2IiccCk66JGL8k7erwu9epCy/9oT
 qZaJ5XcU6oXEjmXqS4AaZTdrZB5cEj5jwy5ICf4MiM0eIRtRlKV94a8LBfv7iQHEgG+qdA6/
 ++7zgreTJdaH1ZiAc/aZeiB1VS0uXRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4qYCbi7qFooGlF/pFMnBbR2SLv6yrMST6/3a4xdMSWui/Yj2ABnj//7+vZ
 LsJwqikYuEHhltDr6F1D61vkfAl/9LqqrJXklZkEXHMYwj5A79sOCDbj8xGt6kLzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4KRnOlj+6Q924KGDABdbMBS7gSBAKKd4bdE+y
 uA7tc9KswGyh3LG6DpdYvy4I4hUEkE9bg==
IronPort-HdrOrdr: A9a23:P1MK6qmGaUI/v282B9tPH6jO14bpDfO/imdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPhICK0qTMqftW7dyReVxeBZnPHfKljbehEWmdQtsJ
 uIH5IObOEYSGIK8voSgzPIY+rIouP3iJxA7N22pxwGIHAIGsMQnDuRSDzraXGeLDM2dKbRf6
 Dsn/avyQDQHkj+Oa+Adwc4tqX41pH2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr+G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTotOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsLuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DkfuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjDkV1FUsZmRt0kIb1O7qhBogL3T79EWpgE586Ig/r1cop9an6hNDaWt5I
 z/Q+xVff91P5YrhQ8UPpZ3fSKNMB25ffv7ChPaHb3WLtB0B5vzke+C3FwU3pDhRHVa9up+pH
 z+OGkow1LaPXieUfGz4A==
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="55105045"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnUKcw5p9CezGq4cTIM2QhRR3dkuXDx2H6nZEd2jQkQG1rQUZA3ACOHI+AuCuavnsnZ0lxiTVMUGfafqXpE/DNCNFl9dDVFk0+u1QWwBstW/jaYMMygES+AvsuLHhwB8sVxi53xQCVpmzGv7ZmkeYfXIbgUNNmOSDJ4YvOcq8FPT3Op56OWtFU0W8DMiNnLrZpeafIlGq7a7G4jo4hBkh48GJ0FmYYsVBjEf9QMpwN4XCIpAzJeWs1z7HnJbpxqm/EyTrHQLOMwWuBwBdK7N2B0Ha2WUrDHUpnwBnNyDPWzGecO9okTZImpzz5//wQLzpBvcPDmJqMQWXVTNz/7e0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9x5Q87cIOuFleBoYcvIT6cs7a8IkDoF0kihHsHDYnhA=;
 b=oVT+kVI63H8cAQR4fJNchh75CmCO8wx886JqguVj6EClTg1zzbEsqK9EoGmcmYcwLl0kuqo8bbogUAS8/l7LOoHi3PKWlC36mViKSgRDcSBGyVA58uNrEP831TBYiI7Nowoq0eMOXukbv3HGn/OtV6lyJNeHjA7ZOcV3FHep1iCgB2+cERYwRyq2fmMReIpmToSJ7ZvvfGBMMvkyBejZ0XNMSI43aIfYvTIA1DFg6dP0/3TfAppCLWcWwwkop6GktNNr4HfsTdfEiW1G0Capx70DpUtdkLeeRqY4jFQlv4diAnnM2xoilv/XDva+t1pEaMB+BAs/4300T/3AYOwZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x5Q87cIOuFleBoYcvIT6cs7a8IkDoF0kihHsHDYnhA=;
 b=V2HG84YDLCZsus+9aDV1Wd225dQJS/mShHhEwkM1xpFuOk2IxtYwqDUBNhgNNNu+K+9qDPYVmL0gBtKhl4ErayCNJjBeFMOr5MWeFuVPERPhiXhlN7pxAgPlli3ysSApdxwRypf4AsV5cH8POzE+vh4Kv9Gg9/+jNELGOTHyvuA=
Date: Wed, 22 Sep 2021 11:26:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
Message-ID: <YUr2zZL3kV4/nBQp@MacBook-Air-de-Roger.local>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <YUhgdMyTbfL8Hyke@MacBook-Air-de-Roger.local>
 <5c1fd288-2972-d264-d6b0-3c7bc6d67be0@suse.com>
 <YUmYpzhJrBZkSYyd@MacBook-Air-de-Roger.local>
 <ae0fb20c-b7c9-2467-0951-b84b2f647382@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae0fb20c-b7c9-2467-0951-b84b2f647382@suse.com>
X-ClientProxiedBy: LO2P265CA0170.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 870d20ca-7c81-4871-15f8-08d97dab167a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4140:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB414084444B2294BBD245BBB18FA29@DM6PR03MB4140.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kUzZHoLGVvHs6Xv9EX2xbLhtJQKdJ314ZYcnwk16D1pLepbQDBW6+Lpy4tXjNB/6vQP5axjJAC4j9jWmFY/iHwan/bsrG3uhBQcBCGUMD0dBegKXyflZECDhfJtnW0qmzVOfoUgZwsqGG+ZEpXkBq6Tsd1yQ6UTgrX2W+l4gvLTUUxIt/7N5xhZqikDXVy1iU7bifaqS8USCLp036ukDeiSyPiDwGdba/woAmUR8UITOVd4VRqqoyuYECO4uvQx4XZOM62m22xdh838x3bBiFKuj0cA8c2I8H1z5VI5ksHTfZyGHKpNe27NR5tKBvWSvvq6uHbGC1W63DA3UPjv7ae494FA4tTIPjnSkM0GKAVvJAh0zXnUjOQordWhToHhGYOMxlqGi+HYCOCTr0tqLxCAAYb5sbT4Xmap4Mm49zUtOlHLtx5sZrPK4RvXFyGsTN3HJt55Rm1lvv8x/L8L3f4kPXVGthwMKTdHQmqfZ8AsWtc5MpngOv3oqeMOpPCj1EYm2tuSotNX58NSB+eIxOIdTRMxWDJulQmN+t2tDJowx/mNNzLrD5crUpEGv5HEtTnX/cC3NtwZhC2V+5rp5G7J60YEftLL+ssHbcGJLf2K9PiGoA0BD0bMkLzLASU15mZD/3KoGKLSvscRFcSwGziPyYqr4m3u7E5MECD7P5Bl5Ge2lP0TQAdC9ewkVw9Ae4gFqd6w5ZMRCtxwfmb040w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(508600001)(38100700002)(6916009)(6666004)(9686003)(53546011)(66946007)(2906002)(316002)(86362001)(186003)(956004)(66556008)(8676002)(66476007)(6486002)(85182001)(8936002)(26005)(4326008)(6496006)(5660300002)(83380400001)(76704002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm9uMGo0NWE3ck14V0xVRzc0OEl4QlFXeU11TjRNdmgvc0kvVmVrM3ZTYnNz?=
 =?utf-8?B?Ynd2Q2tHYVVPaWpCKzhPb2NnN2RKMFpXeGYxbGM2UHpHQmVFOG9hanFYU1JJ?=
 =?utf-8?B?Zy9xWWFVcU5uUExYY2RDdlNmejZLYzdxVG1VMHZvNmttc0NlT3VZZk9mcno3?=
 =?utf-8?B?YzliUFFFdU9sTTBlSmNDK29BNkNJR3ZpZUsrQjF2MjRMWDNHb2J6WC9oRzRu?=
 =?utf-8?B?dngvNnR2OWFwSG1jOW5LN0VHSGdvdW50eE1GMnJLR0xRRmRXSkdUUlVrTmxj?=
 =?utf-8?B?aDBKQXg1bzVRa3lYMk5xNkdBVGJYdGpYdjRnZUp3WUFkSjZKL05tWm1tVXFD?=
 =?utf-8?B?aHJSL2xpTlhTVmpFYlpsM3Fic1Y5NUEyU0NndURCODhLUDJTZUR4ajZXM2l1?=
 =?utf-8?B?aHlPdGl2YXhlVWpNUnRIY1p0dGlCNG4wR1hMczE0Sys4SklkVGJ2L2ZHUHNW?=
 =?utf-8?B?UnhENS8vakpQcisyQ3VQTUU2R1JaNUVVWllWOXB1WDRmZWJvb0gwcUs2S2t5?=
 =?utf-8?B?ZDR5OGVqc2N0QkpIczUvVU5DUG14UUJLUjdRUjgzbkp2NXVuT2g2QlN6WFAr?=
 =?utf-8?B?WjY4MjNvanJ5UVRGR3ovNndjS2Y2cDNSNm0rRG5QTktpZVgxaW5CUlhuYk5L?=
 =?utf-8?B?RTM2ZHpkMGVDVTdTbngrU2xEdFpPblJDbHdycEVFR0hGc05UNE1zNFpvTXlv?=
 =?utf-8?B?ZFpNYXBqdDhQdlVWcTFsZ3ZReE8yWHhScGNsaWpYVm96NG9ZR2psanJVRmdj?=
 =?utf-8?B?UU5FY2pTcTU0MU1PWVBmaUJxeVRrNjlUUVZWeHQxV1M1Q3dKd0NWVXcxRnF2?=
 =?utf-8?B?MDFkaVNhd3pPejRHc0ladFNVaGFrc3ZJc3Y4Y3hJZ3l3bGNmaFYvdjNyNXYw?=
 =?utf-8?B?K0d1azRQL2tWY3dYQmd0cS9ySmU3WldOTUVQVzhvbnFuNWRrb1BiSHNpczFM?=
 =?utf-8?B?L1ZoeW0vT21XZkY1NW1qUlBzWmxoZFl3ZFlQSkpnVXQ4eWVQRm4zbjh5N05s?=
 =?utf-8?B?UUdBTXJlTjFLcTlQWlhTZjd5WW5XZXJUckhXWVFhU1BTZnRXejQwTzFzMGdv?=
 =?utf-8?B?aVZuaWZXYlMrUERyek9FVUlMLzBYek1lUzNoOEhpNW1KVUR4Q1I4QzZoWldG?=
 =?utf-8?B?Rjh6MWdlVjlYenkvUVYzaXM3N1BMMHIwZDhHUzdwdzJjTUVSMmpSWkQxSVBL?=
 =?utf-8?B?eTFmYmYwUHN3cnowOVM4SmNJVGlWOVRjQ1o1RTZNK2VNWURYSFc0eUVDVk1a?=
 =?utf-8?B?STJLeFF0OWVwZ0RoVkUzZUpEUnRWQWdxMWR0ZEFjTnUxdVBmYVhEWVBINUpn?=
 =?utf-8?B?eWVjTkkwNGl4Y3hUOGZUVkVLL2kxRGhyNjkyMHVCaTdBMlN5NWRTMlRtL3pS?=
 =?utf-8?B?NXg5SXpxZVN0VGxWR0hOVWhseVdSTnFvYldnWi9UeENWWk1VaXFmbzJnUVp0?=
 =?utf-8?B?bERPQkFVblRyZk5PNEhUU0UrWnVrN1hrdWd3bVBnbFNxUFF4QXhKS2l3UHIz?=
 =?utf-8?B?MkdxcEhYVUN3Q3BQcVJoYmovZjdGQ29LMkpPRDZWaFZCZEZHUUsrZmZWbFU2?=
 =?utf-8?B?QS9QYitBc0F0dU9MTkN2U21uMUxVdlZMTnQxK3gvalpaV3c0VUpGTFRrSUgz?=
 =?utf-8?B?WGNRdlVNUXFwekpCcUVXeW01YWp4Q2tZWEQyak56Q1FPUkZQNlBleVBsYnBB?=
 =?utf-8?B?Z3RSQVVXOUNINHBoWitLWUFzK2pPb25aLzl6dmlwZmYzS2tTT2dxQTBEbnF2?=
 =?utf-8?Q?HYULlLBz9W39ibACeMeNJFEVM0ulfNaFJk/ZCG3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 870d20ca-7c81-4871-15f8-08d97dab167a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 09:26:42.1486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atCjGKJwrW0Op6ofq/ekROZe7aWVpnElZ7m8vJ4yWvUzVeCe96BVrVUh7Bpv9T4P3UyBSKduEtjH29GwNGYvKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4140
X-OriginatorOrg: citrix.com

On Tue, Sep 21, 2021 at 12:12:05PM +0200, Jan Beulich wrote:
> On 21.09.2021 10:32, Roger Pau Monné wrote:
> > On Mon, Sep 20, 2021 at 05:27:17PM +0200, Jan Beulich wrote:
> >> On 20.09.2021 12:20, Roger Pau Monné wrote:
> >>> On Mon, Sep 13, 2021 at 08:41:47AM +0200, Jan Beulich wrote:
> >>>> --- a/xen/include/asm-arm/grant_table.h
> >>>> +++ b/xen/include/asm-arm/grant_table.h
> >>>> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
> >>>
> >>> I'm slightly confused by this checks, don't you need to check for
> >>> gfn_eq(gfn, INVALID_GFN) (not ogfn) in order to call
> >>> guest_physmap_remove_page?
> >>
> >> Why? It's ogfn which gets passed to the function. And it indeed is the
> >> prior GFN's mapping that we want to remove here.
> >>
> >>> Or assuming that ogfn is not invalid can be used to imply a removal?
> >>
> >> That implication can be (and on x86 is) used for the incoming argument,
> >> i.e. "gfn". I don't think "ogfn" can serve this purpose.
> > 
> > I guess I'm confused due to the ogfn checks done on the Arm side that
> > are not performed on x86. So on Arm you always need to explicitly
> > unhook the previous GFN before attempting to setup a new mapping,
> > while on x86 you only need to do this when it's a removal in order to
> > clear the entry?
> 
> The difference isn't with guest_physmap_add_entry() (both x86 and
> Arm only insert a new mapping there), but with
> xenmem_add_to_physmap_one(): Arm's variant doesn't care about prior
> mappings. And gnttab_map_frame() gets called only from there. This
> is effectively what the first paragraph of the description is about.

OK, sorry, it wasn't clear to me from the description. Could you
explicitly mention in the description that the removal is moved into
gnttab_set_frame_gfn on Arm in order to cope with the fact that
xenmem_add_to_physmap_one doesn't perform it.

TBH I think it would be in our best interest to try to make
xenmem_add_to_physmap_one behave as close as possible between arches.
This discrepancy between x86 and Arm regarding page removal is just
going to bring more trouble in the long term, and hiding the
differences inside gnttab_set_frame_gfn just makes it even more
obscure.

Thanks, Roger.

