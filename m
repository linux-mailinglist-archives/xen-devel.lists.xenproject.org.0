Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C400367DE9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 11:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115236.219752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZVrC-0004rD-Jy; Thu, 22 Apr 2021 09:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115236.219752; Thu, 22 Apr 2021 09:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZVrC-0004qo-Gu; Thu, 22 Apr 2021 09:42:46 +0000
Received: by outflank-mailman (input) for mailman id 115236;
 Thu, 22 Apr 2021 09:42:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=96sM=JT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZVrB-0004qj-44
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 09:42:45 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dc9ca80-b7d1-4746-884c-88542a209c22;
 Thu, 22 Apr 2021 09:42:43 +0000 (UTC)
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
X-Inumbo-ID: 6dc9ca80-b7d1-4746-884c-88542a209c22
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619084563;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=P6zSqKDHxevT8tPtA5Rdjr63V8JANhtUXglVtva6UOs=;
  b=MVRwfm3q0OAiIUJ6dsWKV7ZNg3B1opRw1z21ArY1iVrIcNhYPg6wRUDK
   nzwFAHPKw0rIGRNrb5dplpRJf/a8XhrOzwv26Fk/6lxXQU8fJlAWDwTxJ
   e4ECC65EbUzV/pIBLQ8hpelFd10blUMEd/qxEk/XYgimxXkbV6mepmWx7
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7D2X7KVAVIo/0HWB10/Sl8XWYI70rtpG9FASS9TVSbYg1KxfxxY1/lypUXGhtz5rqm1mmPczWc
 RQ9jFi7Woq3Wd2SaGh5dgS34bT9p7PRLPqPLv+badPCBtcwkkYpIp5jz7bkNVYsfWQ2p84Kccr
 ldf+lOx+EgTlpKjVW2nvg1xqIygqjU4ohfNJweS79xXjd5Qv+A4zbSdacp8dOsYUjxhDiTH9M9
 Mvs+8k+J8HYqOsJh1zS6xSvG05euR2h/P3rMHGBHbbUy0MZpTqFbLUw67CJYAUUbv8B3VC6o+m
 EGM=
X-SBRS: 5.2
X-MesageID: 42543761
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bPPnDKHDdlHUMUDWpLqFeZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYfNi+wFEpqSA5aQbc4Do
 Ob/MpbpzymEE5nFPiTLH8DQuTFupn3hIvrCCR2fCIPxSuvqXeT6LD8GwWFxRt2aV1y6Jor7G
 StqX2a2oyNqPe+oyWsslP7z5MTo9f5z8sGOcrksLlpFhzJqiKFILtsQKeDujddmpDf1H8PnM
 PXqxkte+RfgkmhB12dmhfm1wn+3DtG0RaLojX58BiT0vDRfz40B9FMgohUaHLimjIdlepxzb
 5R2Cahv4dXZCmw4hjV3cTCVB1hiyOP0BwfuNMU5kYvNbc2Wft6qIwS+15tC5EQHC72w5BPKp
 gQMOjsoNlRal+UdHbfoy1Gx8GtRG06GlO8TlEFodH96UkaoFlJi28jgOAPlHYJ85wwD7FC+u
 T/K6xt0JVDVNUfY65RDPoIKPHHRlDlcFbpCia/MF7nHKYINzbmsJjs+og44+msZdgh0IYysI
 6paiIYiUcCP2bVTeGe1pxC9R7ABE+nWy72981Y759l/pXhWbvQNzGZQlxGqbrvn9wvRungH9
 qjMpNfBPHuaUH0H5xS4gH4U55ObVYEVsk4vcs6RkKursrHJpaCjJ2ZTN/jYJ7WVRo0UGL2BX
 UOGBLpIt9b00ytUnjkxDjdMkmdOHDXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHlnuqwyd0
 1uHaP/nsqA1CyL1FeNy18sFgtWD05T7rmleWhNvxU2P0T9dqtGnNmDZ2ZI3j+iKgVkR83bVC
 5Tzm4Htp6fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IPCYZM3DpEvXYRrDgXVHxlJmQJnwV
 0zKDMsdwv6LHfDmK+lhJsbCKX0bN9nmjqmJsZStDbir0mGnNouQXEaRjaqdsaSjW8VNn5pr2
 w015VarKuLmD6pJ2d6pOgjKlVDZF6aB698AB2faJ9Zna3qfw9MXX6H7Abq+y0bSy7PzQE/l2
 bhJSqbdbXwDl1Rtmtx/4zq/Fl3H1/tN35YWzRfi8lQBG7GsnF83au3faK1yXKWcUZH6PoaKi
 v5bTwbJR5Oy9i72AWOoiuLEWwry/wVT6vgJYVmV4uW9mKmKYWOm61DIuRd+4x9Msvy9sAMSu
 CSdmauXUTFItJs/zbQgHkrOCN58iZ51dzp3QDo92i+0joUB+HILFFvWrEcJJW94gHfNoO1+a
 Q8qehwm+26dljVQJqh74r8ajZYMBPdoWKsVYgT2NlplJN3kIE2JoXRVDvD6WpO0xo/JvrljU
 92etUI3JnxfqtUO/EIcy1X/lAVhM2CAUsivAvxGPI/dzgW/gvmFuLMx7rDsrw0BEKd4CP2JF
 mE6iVYls21FBer5Po/C6gqJ35RZ1V5wHN+/Pmaf4mVLAmxbelM8B6bNXC6GYUtApStKPE1rh
 xg5cuPkPLSXy3k2BrItT8+G5lwyQ+cMLWPKTPJP/VJ/dy8MUmNhaXvwPfbtkaKdRKLL2IChY
 NEckQMaN9kkTdKtvxw7hSP
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="42543761"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6xT4PG4krzaZsvwzQc3qS8M/YXUexKmFROFbLScvosSQQutDLMlmpyXTfpjAbrBH1j38TaAIQcG3nuQC5/oVuyv92u/sdXjdWedfVvlCWx0KDIwhMe9cQKdfHDIJ+k0LSPgkYj3OVDuIhMrSTNkQCoN0Yq1f8SfEK3+TYX5799K3c/7xFuuHks5K/+/KikD7d7foLYS4j01iPgjfuVq+xEnR71ddqHbD2gvQA3b+UpV/c+4D6X6Bv1CHyms5ieOpcDJ2MMz4ReM1m6gMCFdy3sBnsk28ZkcI8Uoxh0YhLYPEzkToTM9JTfvCi4qpYoK2VUwtDi8Q2z+sircJ6RbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPPOEqZJVmC7xgnLNiRIPVUuPOvmYYEnNAeoVmY6X58=;
 b=EJxV7NRExIpRLkGKgCzp1s6Kz93dJveGvrNOHN0O7Ca26UrHmGChEn+g3Pd+q+fUpsk/GPMmpuEuq1blgFK2R/qpIdUdkTouZymdYhsl2SpiwCo8QV26zPpgZlsTI/Z/5dE4IcMTpn0hO4zbRMb6STWxvGm8Zgo5JY7/Z1niTCFZJL4cb3z2/xbcD9Uc+qHn2I39a25QGp975lYumyroP/5HqxO/i8KKJHkVKTt+IK1/Jr309LdhAD21ZWN8UVqY2mS+JrCb6rZXvip43T0iVWHtzL8joKyQ5PKBlKp74Vm0wQ+OKuryCwCFk47Mlm66AR2HUr5U12pW+7dXjUfYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPPOEqZJVmC7xgnLNiRIPVUuPOvmYYEnNAeoVmY6X58=;
 b=tN1KXfeDY8kJO/27P9D9CCrrtUAl/bSz3E0Rw0iuCeF6dJr0GTxa+CoHjGDPUvE5Ys0A5O4NxYYoIl38Oe0EB01JJsI3yzee+p1Wnz4Hkh1iIcgifAoGk+nqsV5TNo07eFkZNN/1igr/51fstIm3f+HG/hrowWZOg1ZrKJXfb0M=
Date: Thu, 22 Apr 2021 11:42:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 15/21] libs/guest: obtain a compatible cpu policy from
 two input ones
Message-ID: <YIFFBEhPYSYQhycf@Air-de-Roger>
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-16-roger.pau@citrix.com>
 <391b56d0-bb4d-8d3c-231c-e2e3ad7e2f42@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <391b56d0-bb4d-8d3c-231c-e2e3ad7e2f42@suse.com>
X-ClientProxiedBy: PR3P189CA0089.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9f590fb-d45e-44da-5213-08d90572f459
X-MS-TrafficTypeDiagnostic: DM6PR03MB5323:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5323D5503B97D052CF2526DB8F469@DM6PR03MB5323.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XjLa1HMSO2zd1YFv5ayaKxDrVHKrrk+LHyqIkGiqSbIQcjqLOsaT0y0A7KBnQFQpVS82bq/nqRPcCtWTr6iUclmroKJJu8arJSUkliYYOOeQ1Y+CXm2THiCOZzzWnsTlH6n+QX1pGf+xc7NQH0h8BLxH4QslaQO0cZbJ92H8uQu9+3LOCBDNqISXwjZHwLaXDJb5VGwY3/QKdUe0OZepoUzzuek17KdwDtvx2WJhvgj22lrrYobyxocaW4EUJdyiMcXm61JP0YRPDRA7cs6oiob57CswFtq8P7JtILdVz6O1TFHHsaDfB8CAL4V7m7EoEzpFKYCrON0J6hqnt5rX14473AyYl0UcHWI9mc2J3kWRY4sAoFQPy1UtYiq/dB0TYtFT75UFH5OmDbKzmXuWq6Cs5FPE8W5LOLhTOOBHyZ2shsbE+PIwmov2fvB2RjCXqedUpDtggF2HJgevLJua2Dks9HL/4Suo4vNJv2Ec5hGCZ63MHUGZ5OD7Q5R7CVX92OFDxSzc/bmbB6IaUV1Yc51YrhmS7AUJPHK3e3z/hFHm6L6PHBuhNDziLEd1WXvsB6Bst3h4CJXoUOJ3/uKaTufnboI1NOiI9hJhTNAXAq8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(366004)(346002)(376002)(39850400004)(396003)(54906003)(8676002)(8936002)(85182001)(66946007)(66476007)(86362001)(26005)(6486002)(66556008)(9686003)(5660300002)(316002)(4326008)(38100700002)(6496006)(6916009)(33716001)(956004)(16526019)(478600001)(6666004)(186003)(2906002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b1lxRHRVbDhCaEpzcVBiNWl2NVVKUW8yWHMvUzFqWWYwVWFYdHJ2YkgrVmxD?=
 =?utf-8?B?QkJReGhEMUhTbEZaYXFGdEs1YWN4ckk1M0ZwRWc0UjdaVVF1eUhXUEpOd21O?=
 =?utf-8?B?bk5XSmtRQXJkYlhtZUVoTDg1dm9qdVF6YW8xcVdxSElIaXZMUFAxUXZRMmRB?=
 =?utf-8?B?U2l2RWpQTEFkcVg4czZyV21HMG9zSWpnQ2F3K0ZQcUE3Vy8vSjlwSmdDSWl3?=
 =?utf-8?B?V0p3WnI0S09YNTlaaEZGcDFYRDBPZWZINTJYWmVCUTFjOTlHTWo1MEpmM1k4?=
 =?utf-8?B?ZEV1SXAvdUtGV1Z4WlZEYnRPK2toakdPRDQyR1U1ZGt1c3UyMU5Na3BkQmhK?=
 =?utf-8?B?NEc2MjJySWYzQTBhdmF4a2hWajBNc2NtODVwWmJJMWtFOXZ1UTVxMG1mWExu?=
 =?utf-8?B?d0lpRG5BTXJsSmxMc2xvWVVtU01vRFRtUHlybEZPeW5SbFVMeUxHQUhNbkg2?=
 =?utf-8?B?QjRtTUR5WVpVQmswQVBTVzJVZXZvNjgrcUR6ZlRkMUFoN1ZYanR0L01CL2d0?=
 =?utf-8?B?bTJZREJpSkJuMjRuUmJIdTFBa0pVajVVVGQ0MkFVSE5NcHpwclpOSUJwSVNk?=
 =?utf-8?B?Z3RkblMxQ0R3Tlo3Y0tURzN6KzdZLzdQZmZ0VGcyRW5TNEgrcTEwbG9UeEd3?=
 =?utf-8?B?UEh0MW13QW91STJ3a1RpaitSZ1FaVUs5UTlLQjMxbTlpRm5jRnZZSHNFa21l?=
 =?utf-8?B?cytRZ1VjaHlPWFNnQVZtbnArQmNIZjFnMkN4MG9SU203NUdDQWlBNWVwcjhC?=
 =?utf-8?B?aElhL1BSZ3F2d1R6YUoxY1JSSzh1OUJXRkoyQjU0bEdtR3hKbDBHRVQwMVdS?=
 =?utf-8?B?UzNYaWVmd3U3SjZwbWkxYXNHYkN0R3NCZVJzeG1oRWxIQW1VVGxNekF3elVM?=
 =?utf-8?B?Y3R6ZTIzYzRMSEZxMGQ5b0ExRFd6dXZhNUpWZm9JMDA1R1pka1B4VzR1Q21R?=
 =?utf-8?B?bWpQQXhWU2ZDMXZYcVhqS0ZiZWZYRFVHSkJ1MU9GMjc2WVdFQ3A2czh4Q093?=
 =?utf-8?B?MmFybC91Y09NOHpxT0dEKzJDTld0SjNvZFVPM21LZGR0SjY0RlBxODhTZ1dq?=
 =?utf-8?B?ZnRiOVFsRTFNQjhZSzIxNGxrMUM5TDlhUXF5dklFVGVkS0xJUThVM0k5Qndt?=
 =?utf-8?B?cmdzVTBSR0ZlZm9nQVEvZmN2Wk9ZNVZSblNSRUxlK280QVMxQ3orTVRJUUJY?=
 =?utf-8?B?dXk1ajdSbU9WWjhMTzhUWUIxc1ZTNnFWdUZ1alp0QWlYMHJTMHRxS3FEcjY3?=
 =?utf-8?B?YlU1NGVzT1UvM1B2dkhoUlBKcU9Ja243eTQ2N1FPZTZ3TlUvc3JhTzM0aEtI?=
 =?utf-8?B?ZFcxSmhMQlJZTVA0SFhtTnZHT3VEWktaMGFrWTZoOE05YzNnVzl4Z3VvWXFY?=
 =?utf-8?B?WmJVajA0cmxhQ29CTkh3ZUJGNWkrWXFNalNsUjY0WjU3Rmt4UWU4QVRCVnFy?=
 =?utf-8?B?TjY2V3ZzZUVRRWdjd3V5R2FtbE1yYWRQRjc5eDZrVFN4OE9aWGl3VVNyU0wy?=
 =?utf-8?B?REFUWjAxcHVWN0l5WEF6b2pEdS90Z2RJMFlpM1pqQWhON1ZvRjZTS3pudXFZ?=
 =?utf-8?B?WWhLTTRyU3cwS2g4VW1NU25vVTA5aTZzRzBqQlJvaTNGaFJGeHY3NE4ySy9W?=
 =?utf-8?B?REZ2dnNZenU2WTEzUmc2WGpibDlmcWpBRjcvbUV1Y1E4a3NuSnlucm9BWVpJ?=
 =?utf-8?B?TWYrQit3MGh1bG5YcHkrZVZWSHRYNEVyZTloTDJJUkRBeGZaQ3VRWXBXTzBB?=
 =?utf-8?Q?V2NLD2qlhGuQIrjwYRcg7mq3eGtvACW+ONziTDZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f590fb-d45e-44da-5213-08d90572f459
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 09:42:33.5243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IP+lWYvt+uc23kH0PcdL1RBdtyLlkkmZxO0pA4g0xGgLDDJbfyV8TOXiVGD3WzSGZSZ7R/qLCiWSEuFifemZZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5323
X-OriginatorOrg: citrix.com

On Wed, Apr 14, 2021 at 03:49:02PM +0200, Jan Beulich wrote:
> On 13.04.2021 16:01, Roger Pau Monne wrote:
> > @@ -944,3 +945,130 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
> >  
> >      return false;
> >  }
> > +
> > +static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
> > +{
> > +    uint64_t val = val1 & val2;;
> 
> For arbitrary MSRs this isn't going to do any good. If only very
> specific MSRs are assumed to make it here, I think this wants
> commenting on.

I've added: "MSRs passed to level_msr are expected to be bitmaps of
features"

> > +                       xen_cpuid_leaf_t *out)
> > +{
> > +    *out = (xen_cpuid_leaf_t){ };
> > +
> > +    switch ( l1->leaf )
> > +    {
> > +    case 0x1:
> > +    case 0x80000001:
> > +        out->c = l1->c & l2->c;
> > +        out->d = l1->d & l2->d;
> > +        return true;
> > +
> > +    case 0xd:
> > +        if ( l1->subleaf != 1 )
> > +            break;
> > +        out->a = l1->a & l2->a;
> > +        return true;
> 
> Could you explain your thinking behind this (a code comment would
> likely help)? You effectively discard everything except subleaf 1
> by returning false in that case, don't you?

Yes, the intent is to only level the features bitfield found in
subleaf 1.

I was planning for level_leaf so far in this series to deal with the
feature leaves part of the featureset only. I guess you would also
like to leverage other parts of the xstate leaf, like the max_size or
the supported bits in xss_{low,high}?

> > +    case 0x7:
> > +        switch ( l1->subleaf )
> > +        {
> > +        case 0:
> > +            out->b = l1->b & l2->b;
> > +            out->c = l1->c & l2->c;
> > +            out->d = l1->d & l2->d;
> > +            return true;
> > +
> > +        case 1:
> > +            out->a = l1->a & l2->a;
> > +            return true;
> > +        }
> > +        break;
> 
> Can we perhaps assume all subleaves here are going to hold flags,
> and hence and both sides together without regard to what subleaf
> we're actually dealing with (subleaf 1 remaining special as to

I think you meant subleaf 0 EAX (the max subleaf value)?

subleaf 1 EAX is just a normal bitfield AFAIK.

> EAX of course)? This would avoid having to remember to make yet
> another mechanical change when enabling a new subleaf.

Sure, seems like a fine approach since leaf 7 will only contain
feature bitmaps.

> > +    case 0x80000007:
> > +        out->d = l1->d & l2->d;
> > +        return true;
> > +
> > +    case 0x80000008:
> > +        out->b = l1->b & l2->b;
> > +        return true;
> > +    }
> > +
> > +    return false;
> > +}
> 
> Considering your LFENCE-always-serializing patch, I assume
> whichever ends up going in last will take care of adding handling
> of that leaf here?

Indeed.

Thanks, Roger.

