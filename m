Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B6A4E4EBC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 09:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293808.499241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWwlP-0004Ln-1a; Wed, 23 Mar 2022 08:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293808.499241; Wed, 23 Mar 2022 08:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWwlO-0004J8-Tp; Wed, 23 Mar 2022 08:54:42 +0000
Received: by outflank-mailman (input) for mailman id 293808;
 Wed, 23 Mar 2022 08:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OhW=UC=citrix.com=prvs=074292745=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nWwlM-0004Iy-U2
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 08:54:41 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de4f5241-aa86-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 09:54:38 +0100 (CET)
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
X-Inumbo-ID: de4f5241-aa86-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648025678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uSiIysUHQ/FlnN7e0m+xsuHGfdbYH2H5a+XYXy4RmOI=;
  b=WtMmbpJLFQhoUt2pMNjCBZNOPANjDIeLnaD7otY0UBXwRWacxgt3GUNA
   SlcdHWd+4K3pSambV4VGksKPRR1GjjgzY0CK++rH2pykloKdOkV5Kwto6
   s5jQZtro7ee7/72XeeXOEWAsLRt/WTrV0mpMKuUCDBt6mtxfAqRy8oTsB
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69315058
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:++1YtqCZ1WO3FhVW/zfjw5YqxClBgxIJ4kV8jS/XYbTApD8j0GECn
 zAXDG2Bb//fNmukLYwnaoy1o0hXvJ/Uz4JqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vj2NY06TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhy+
 dN3icbtET04M7/+m/lNQkZnFHpxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGjWxp25gTTZ4yY
 eIeRSN0fi2aTCZ3N0pGFtEFjPeViHnwJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiH21uCQgAYcIKfw3+jOO1/rFvDmeXWdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqVFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tmuVh6b/PuREDGQ3C94Zfe51qXHb4
 BA5dzC2trxmMH13qASDQf8WAJai7OufPTvXjDZHRsd9qGXyoC/zINwLv1mSwXuF1O5eJFcFh
 2eJ5GtsCGJ7ZiP2PcebnarvYyjV8UQQPYu8Da2FBja/SpNwaBWG7ElTib24hAjQfLwXufhnY
 /+zKJ/0ZV5DUPgP5GfmFo81jO5wrghjlDy7eHwO50n+uZKEemWvQKsIWHPXKLhRAFWs+16Or
 b6y9qKiln1ibQEJSnKOoNBJcgxScyRT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAV7ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:EWZj6q0pgw37fbhXs7kjdwqjBUByeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFm7X5XI3SJzUO3VHIEGgM1/qG/9SNIVybygc/79
 YeT0EdMqyJMbESt6+Ti2PUYrVQouVvmJrY+ds2pE0dND2CBZsQiDuQXW2gYzBLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 929lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQlo+a87bW3HAb0cYa
 dT5Jm23ocWTbraVQGTgoBX+q3hYpxpdS32AnTruaSuokprdT5CvgglLfck7wY9HaIGOud5Dt
 v/Q9RVfZF1P7srhPFGdZA8qfXeMB2/ffuLChPRHWja
X-IronPort-AV: E=Sophos;i="5.90,203,1643691600"; 
   d="scan'208";a="69315058"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WT/NBUSwSWYdLRd3t8kDkAMNr+VxCmOgwJHwgIJY3raHfTOown4HMnGg3vvjd3RM+pUDjBVeD60SPg6Cuq8rif7bYI1R+ct3jIPBCBjVSLd/XLtKUUpxAAuLzlVC52SfjHQFbEisnEk6bBrZXVZpDZGt4SyQqf5bItv9srjYlSLNgBheyh7BnmmMafZW+h6gC7eQyclZ/N/QsVFZJWuVP3M4acbGIMOALkkKNfsBhzwO7wspTjzImCFdMICHk2v/sCBZ++vhZDccEoBU086lDJ6t0S9EjFLTcUcvTfDgPyxm6ztXMweaLOOptYdGFEUneAot77mRMeb7kom+FD9bbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UC4N03bVeZ/t5KHvR5dUDqN/ifs2FoNNcar7rJss1pI=;
 b=bzgh4nJ21IjyYekCPXWqkSzlTfyq3ffQIC9vrpW3dj5h1shHTmF9EiAe8Vsf9AXOzqaHKVJELE6hjw2A/voIPYEf+zJzUAqPNT1gCYeVXdw+J4lBASjOoe3/ppEo32Ug4uSJyX71W1/Etmon496G55JpSfG8+owBVpWYfnuFG2CaPSsnvqAjzSWCHEydhWt0hQVQk8KCkyhjRULenL10Pll4KTFawmUZ1F0k9EVTg8yJSd02ZMDky1oaiNpyQJzM345b3afw745mihuZqR4GfzvrpWgV8+XbiaDcSJ8ftBNVMqtQVMM93p24EhPvxB8iapBfm4bERgUfmMMTBsUafw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UC4N03bVeZ/t5KHvR5dUDqN/ifs2FoNNcar7rJss1pI=;
 b=jUYh+gJ/ZaYkavwITqz0ghENJZauMZ4swF30+mVxjES4vEoslZF2DFb3vu6nf6eAeEKu2vj4Dl03t1SkxQhBnTIqJ/AAlTZrpcN0y14XeGiW6WecesDpgfgRJxmw/IVa+GRzq+Uz/HzptW+olh4ZCx6z3lw4MUBORPWguYBn718=
Date: Wed, 23 Mar 2022 09:54:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Questions about Cx and Px state uploading from dom0
Message-ID: <YjrgQOYbsaYOV08H@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: MR1P264CA0073.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08812037-0975-4503-f3c7-08da0caabed9
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6550:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB65506B43EA3F73E2F1F7EAE68F189@SJ0PR03MB6550.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DnnyEfv8Dt3Gw/TDj7UjOt3WsLi7njDaehjmRoAlEJVVadR6ScxhxCjvmLQQPqXgMnAkJKLjE/6hu4u/HIvg2oURlJShCVaTnrJf5fzlxHH8jHh0rfvjIZiHm3WznrEweoXt6M/fecHoRk1AiJJ14eUyRDqfHYD4iWXBtLlfyt7B/7/oIQxo8S0wu0nofsgejRNdKRC8Zxdlbou9Hx+jBG8XiZKqTJJEOr29DnM6QJRV6CFSS5psy9m5tvHaUlVKgCjC1gH+sBda0olEBeSpZibRfoBcrxCbPRLbd/WQJERqJYa2iZRQC+KkOHKTuXRGefDLCrCWfNuaDrSvi+RVPyXZFnVGvYeXLRH14I8xp3f5UCgeFkQTEgq94ffJd+/5Mve8CNn/1XsUpCujOWJ0nCTAVzYSPmWyiKGJbLc35IknVydmTk3i1dzL1BNjjIJGgjgIupF+F9uVxFAUE1durxFJGD+9LPeeH87al3LWAXU+436LGCUn5wkb/wwaOO5IoM5rM7h/KFqB1MBW8AsSywkzkn3KdVj4YGdrUY4f/Q1h9FL4p98E9Kinuk4NsIe9hfpU5fbOp4BCFYH36rI2rA3Ke9pX5NVt3hcetSXHlUkEdJXr0RvNpMXjI21PlcatBY34gG4+my2CreTa9qe+hQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(26005)(508600001)(6486002)(66556008)(8936002)(5660300002)(6666004)(9686003)(85182001)(6512007)(6506007)(83380400001)(38100700002)(54906003)(6916009)(316002)(82960400001)(4326008)(8676002)(33716001)(2906002)(66946007)(66476007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU1UVVQ1aDF0Q2djWXAyNWIyUU4vd3EveU9xcGE2ZElsZlZiOGRDVzc1SWs2?=
 =?utf-8?B?TEd0OWpkaTVwRUgzekk5MWdxZGwzSlZ1QTFQbCsyUnNuZmpYUHlzS0R6VytF?=
 =?utf-8?B?U2hVYWtJSWtOUmtkQXNlOVZCRzQ0TUJNTS9JVGppamlCR0psZ1R2eEw4TDV4?=
 =?utf-8?B?K2d3cXJPaXZENlN0L091eG1JT29TRm10cUc0cUMxaXB5akVJRE9LT0J0Q0NR?=
 =?utf-8?B?MVJsUDVjWno1QVdNUkJJUTZhZTA1NWhzL1ZxaldtZW94MlJxMGFaTy81NmRz?=
 =?utf-8?B?bjN6TUdRZjZxK2hYTGpiMFlPZDNiSWs1cFJQVHBldmJtc05JY2JiMkZuVjBa?=
 =?utf-8?B?elVocFIxV0YrNUR2VXZIZlRmMHBsbGtLUG9WOTVpeUVDRjJlZE1NOVZnYUUz?=
 =?utf-8?B?aWEvOGRHeE5WdVlZTFBBZ3VJYzlNb2lZZHRCUzNZelBUYkVwcjdSdDFudkxp?=
 =?utf-8?B?QVc2SlB2VjBVR2xwY284YmFoQktrNFQyWEkzY1VEUmQ0NUZQczV5bEJGazVS?=
 =?utf-8?B?ejQzWldyamo0aG5RVnlESEowckJUNHY4VDF4TEZ1OUpNNjFLdmVtdHJIT3lp?=
 =?utf-8?B?SE9tZ0FFTFFPZllaRGJMRVQ2ejB4eDdSNW85NGlxZkxxUW9nWFpVZTRkVXZZ?=
 =?utf-8?B?QW1TT2tMc1NocThyQ2tQUGgwMzRlY0RoaEh6ZmFGREhOTFdYS1lPVmxuNFVU?=
 =?utf-8?B?YlVyRHB3S0hsMFY5NFVxT1FEQkVQZUIzbzJaTk5vVjhhNzROVmtTejB6Y1Nt?=
 =?utf-8?B?ZWp3YzFPdVc4U1RvUllqUHVTbGNXck90OXZDcWhERDZjQW12S2ZCMkxyVjdp?=
 =?utf-8?B?UU1IWHNybUFJMytsRllDclNxVkQwYTlGY1NsWlFkK2pRa1RPVDRPNWo2S3RL?=
 =?utf-8?B?WTJrbDA5STdMQjdnZ2Y3ZGIvc093VSt4OHdrL2YrUXJhYldXVTRRdzg4c1ky?=
 =?utf-8?B?bGp6Ni9ZVkJCZ1dkaEEzUktpaVpIWTN4bjZheGdhTWNzdGgyL1JXZjM1cWdr?=
 =?utf-8?B?ZEx3c2tobS92endzWjZCd1QwQlJQeEZjbW5CQ1hJY0pCVVdKQWk4RWE3bXFR?=
 =?utf-8?B?WmtDN2xBWHROQmwrN1VjbmRIUERWWWFZbll3U0htaXJYREozMGovN0djS3lC?=
 =?utf-8?B?dnFmaTM1Sjd3TjVycjdrSHp0YUFuSU9Rb2tWMEtUZVZwbENGY0VXRFRjekxh?=
 =?utf-8?B?Z0ZPeUJBYjgxNW9MR3h1UjZlKzV3bTIzOTU5Z3VFUW9VZzJjOHlxVzJTUW5Q?=
 =?utf-8?B?alM4WXIxVThQZlBWT0hLOXlGei9JbXlab2tTcUZMZ2NDK3QxWElqUU54Tjdy?=
 =?utf-8?B?dG82Nmd1OHdxdTYxemIwUTRrMG5aYXNVTmtPeDBnQmRLT0gzTmVLNkN0TStt?=
 =?utf-8?B?Mk9IMGM2RmovQTFkSC9mV2lMT1c1MzIwT2M4KzNiR09mZCszNjd5Mzh1blEr?=
 =?utf-8?B?YUtPOHRSM05VMFhKQlVzV1dJZUlBUEtPR0ttOUt4MXBRbFY1dmpiU2V3MVNN?=
 =?utf-8?B?ZFlVdGRYOXpGQnRSSCtQTGtiYmpSeFY1Qno3S3BLTHBmNmluVWtqT3IycG5k?=
 =?utf-8?B?Y1VtMjBGMytXZEJZSEtXRnMrQXI0ZFY5eVRvNSs3L21XVUNPQWlVMjZzSlds?=
 =?utf-8?B?c3ZMclEzTmpHclk4eS9XNEJBUlE2N1ZBbG45eFJTWngzMVFrQ3VFZ3BJUHBO?=
 =?utf-8?B?K21qWWpvbmh0d0M3ZlRhUCt4MVpkTmYzUHlFYmhZcFhrbUVMTWRVeGk0eVBa?=
 =?utf-8?B?eFRZTUhEbFVFZHpKa05BWmE1NENrSzNRMWNKcFhSeVRMbWJWZGJzTisrOXBR?=
 =?utf-8?B?bVBqbWFYVkN3SXhDV0JlamxoSmpnbS9BTzFkVXA1VGVCYmM5M2NDc2JKK0E2?=
 =?utf-8?B?NVg3ZkxEM1VZMUsxcmVBbmNuN3dpbTdyYVN0M2t3emNmSGlRcEY2UGc5RTJs?=
 =?utf-8?Q?t8eJbzfRSEpsbKjbSDjli/5VxVXnBJLk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08812037-0975-4503-f3c7-08da0caabed9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 08:54:31.3368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtZXyx3AEAzeaGky/1xplwO7EE6uAaBCvmntkUmM7M/hl3yKKkyZyidjBveLC0kcqj+WJ5GDi0BQTVdHzvOXGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6550
X-OriginatorOrg: citrix.com

Hello,

I was looking at implementing ACPI Cx and Px state uploading from
FreeBSD dom0, as my main test box is considerably slower without Xen
knowing about the Px states.  That has raised a couple of questions.

1. How to figure out what features to report available by OSPM when
calling the _PDC (or _OSC) ACPI method.  I'm confused by the usage of
this from Linux: it seems to be used to detect mwait support in
xen_check_mwait but not when calling _PDC (ie: in
acpi_processor_set_pdc).  I'm also not sure what the hypercall expects
the caller to provide.  Should buf[2] be set to all the possible
features supported by the OS and Xen will trim those as required?

2. When uploading Px states, what's the meaning of the shared_type
field in xen_processor_performance?  I've looked at the usage of the
field by Xen, and first of all it seems to be a layering violation
because the values set in the field (CPUFREQ_SHARED_TYPE_*) are not
exposed as part of the public interface.  This all works for Linux
because the same values are used by Xen and the Linux kernel.
Secondly, this is not part of the data fetched from ACPI AFAICT, so
I'm unsure how the value should be calculated.  I also wonder whether
this couldn't be done by Xen itself from the uploaded Px data (but
without knowing exactly how the value should be calculated it's hard
to tell).

Thanks, Roger.

