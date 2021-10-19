Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4CB43421F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 01:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213523.371749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcycx-00085L-TO; Tue, 19 Oct 2021 23:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213523.371749; Tue, 19 Oct 2021 23:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcycx-00082m-Px; Tue, 19 Oct 2021 23:34:39 +0000
Received: by outflank-mailman (input) for mailman id 213523;
 Tue, 19 Oct 2021 23:34:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L/ih=PH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mcycw-00082g-8U
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 23:34:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b462d34-5745-471e-8493-fbd1e109e516;
 Tue, 19 Oct 2021 23:34:36 +0000 (UTC)
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
X-Inumbo-ID: 4b462d34-5745-471e-8493-fbd1e109e516
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634686475;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/3ZdILkZWfWQvKhXGrR49vKTNlFGMxZ8phKVGYazLn0=;
  b=PqMoG0pr6PV/vURv88xG1BOZ0rhP2xjWax3lljef2XnY8VjA0yLcKA9/
   GUAE26YlY7TUfwI6aA5Fcw6zdfQXvExDv89mfNxtEryTYACZ9H4tp1q6L
   1Zjr1dVDKpQPE1ydXCtojY6ZU1F+wAmrSPlO2XWzJJ5Gu/McVwf8dKiYD
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: P3B8VJk7g9SdpASMt2PyCc0gvC/kF6MsCXXWvKVTpCoJ05wimzfJxsoep093VvbhgsMaUDhLkX
 2L3vVEkTFgrHSNieCuwVlwzZaH0x7IV0DIEYIfZvdMv3Vs9djQgSfcnM3NeP8Ekgq+zfZ5ibs2
 JiO49384zRUKN3tlLYR9Uocoj1kZtawkbOsm1LNcEzCrox2JJCf/NTxJDjWuCni/J/e2hjOGbW
 ouNxKk++5zmwXpIZIdebavMVgVYvnbpLpXGksh2xCJkURgYcK3bzCJK3iqDfTBMWR3HXNVdWgT
 dfam8TI5KLejcjyRgTqOrXLX
X-SBRS: 5.1
X-MesageID: 57489506
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RkfgZa7kT6GQfq6U8d+ubwxRtMTAchMFZxGqfqrLsTDasY5as4F+v
 mUaUGvQPKvZYmanctx/bIS3phkH7JPXyINqT1NlqSoyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdh298w3LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 85rrcy2aSgVDoaSxuM4TEFAMCRdBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTQqqON
 pdBN1KDajzkYhN/PGdQEKscu9WxwWDAKDRnlkm88P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTWogfCbm5/f5Cm0CIyyoYDxh+fVqko9Gph0imQdVdJ
 kcIvC00osAa7EW2SvHtUhv+p2SL1iPwQPIJTbd8slvUjPOJvUDJXQDoUwKtdvR9r+kuFToK+
 WO5tI23Ahlw6KW2TFGko+L8QSyJBQAZKmoLZCkhRAQD4sX+rIxbsi8jXuqPA4bu0YWrQWCYL
 ySi6XFk3e1K3JFjO7CTpAif21qRSo71ohnZD+k9dlmu6R9lf8abbois5EmzAR1ofdvBEAfpU
 JTpnaGjAAEy4XOlyHPlrAYlRujBCxO53Nv02wIH834JrGzFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzqV5p0nPC6SYy8D5g4i+aihLArKGdrGwk1PSatM53FyhBwwcnTx
 7/KGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l7Va+Kn+18I9A/90mX/8+Rl
 kyAtoZj4AOXrVXMKBmQa2Alb7XqXJ1lqmk8MzBqNlGts0XPq672hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:m1sqbas5rEVpDVk/omfvHF8h7skC/4Mji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK5yXcH2/huAV7EZniYhILIFvAf0WKG+Vzd8kLFh5VgPM
 tbAs5D4ZjLfCVHZKXBkXqF+rQbsaG6GcmT7I+0pRodLnAJGtNdBkVCe2Gm+yVNNXl77PECZe
 OhD6R81l+dkDgsH76G7i5vZZmzmzSHruOoXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6c60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKeQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpOCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Qs1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgt/DWVZAV2Iv66eDlEhiTMuAIm2kyRjnFohPD3p01wsa7UEPJ/lr
 352qcBrsAEciZZV9MkOA+tKfHHfFAleii8RF56F26XXJ3vC0i93qIf349Fk91CWKZ4gafay6
 6xHG+xiwYJCgvT4Iu1rcZ2ziw=
X-IronPort-AV: E=Sophos;i="5.87,165,1631592000"; 
   d="scan'208";a="57489506"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0cNbWPjBniOCcoBgb3UNzXpxk/HnVR+jguERs7BSeC4nJgS7jI4f0bZP9SmAQHeJ6HD0yfkaC80ijCMeu9w7qjfIgMebXB9CJmCuNvajzbdezsU/tTiS16e8k/+Eui6fkzQ6hon6jd+sAN1Reqxe+mKnGxwNkjzF9cAdrrW61qQLNmvujluj0Y9hnswLA60USHVjTT88U7uMLGZykX3AuH/2pIq2ZHqRfJIZe9o08cGgJuhNHx7K5nyixIHBcIgsJqYIdSk251ipmTeIP4tJ8oWnGjONBg7VLKiH46QwoghRFTEnh5iv1XeKkZeZjVCNliDpvgSqE1h2n+XfCwRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tZwy9BckBcTDPJizTSESAjlQGQEun8HkD0ZtvpOMJE=;
 b=HYJ+dEalrmL0s6TW/891vYtNjCMPNMdhXUD8QdDnyrjrcyQnpQqf/elx8EgesL8eyZ4BKyYSc4pjvMKEsD0nb0y2p0GU9CnUD01+AfooEK4RikcY7GEwJjIRtlz1cDKLEQbeghl2c29z/A+/RPa6aG4JsOBP8iG9DkPZg4GcDbcudtcgpnSo3gUroMz558vU13rw6OXo4knKhNwLocauVemerQRSyjFwKhNcyQ+P6G74GKN3dePB1JuZrVEdc6cyTxN7rMJhbg7RnHOX2MCffC0N40/RHM9o2VQVLh4S78hmFRht2D6MFmhvhv8HDYSP/YIG39AvnGb5fsARC8vsvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tZwy9BckBcTDPJizTSESAjlQGQEun8HkD0ZtvpOMJE=;
 b=tLQGtMwob+r8L8Wy8Zd7jv/N4a5h8JlEeDMR8J+bankVfDhzIFxvnAdCAfCzVgXGIPpW/5Pkd+qzT/IGk/GwjoknHoEdd4zAVg4hZ6VRPZQLQ06ySEIN0XyMxFjwRhOJK73u+qLAm9/PtNpWC59a9lap8ndgoJjj8P4NYCeZhMo=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
 <d5f76461-70d2-fc59-2213-99a093e3b57f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 1/6] AMD/IOMMU: obtain IVHD type to use earlier
Message-ID: <932476cb-9667-efaa-65e9-7dc4baa3dc7c@citrix.com>
Date: Wed, 20 Oct 2021 00:34:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d5f76461-70d2-fc59-2213-99a093e3b57f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0402.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dab93a2a-07e3-4aac-961b-08d99358fef3
X-MS-TrafficTypeDiagnostic: BYAPR03MB3942:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB394226B466EDEA074417D070BABD9@BYAPR03MB3942.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RKJNIQfa5qpy0R9Lw/6zEc/VwI/DQQJLozvPSmwd652zGqv6ebl1FcfbVmTSDok1VNB9VZU9rXellm+5Grm8LFMwqR1IumSPzmYz2KwvZBAqxk5hRb+vfCtdM/DZXirTXQHVwbldAmuKIzeyFOjN3p4WjWs0AayqaQeHImdg5BDvfXURsxT46QSnvPJ8CM9QKJNAbkgBjFCyQerAWRQskMBDkWsymZaq7SXFnRy0jEb8r1mrqtQzOOzXNJghwY3JfCk64LSbHvETiYGGSerxe0lWv0Mm4OTeC52JZVgOP3VV3qGLgFDnYWDsG3KtfyGKZilERHFcVDvtPzlZgFHHIrzShiK78sFdeKj25hejMw+rJabawC8dHIIUQZfJFhp97wMj5Sqg6GYOuwn08SCgmRqJakrSNNzTgso0RAI1NIQ3kZ9gZ2NNxVSD6PV301qCOLoKW0gOlN6BgwIAYSHivqeCSf66ZXzbguprGxYyVE+lEh1LgDdTent6pIQtgkYhPOgBEfnkjTr2+mdbaIYbDprAscNWuPRY96s3vYLbQpSazo1MDQOZNBnHPbxFdcfjGZ1UJ5yoGTyQ+o5UIOHMOYDCYp8FMNqU1cJKwK1Xc8fyZEIvjA9qy2dMyozaBuw/VGe2QwygVldUS6OmGPpkxT5yOuOB/JC7yBZC9aFsetRrql6o1Ssmsgo26UPsfEK0ORjuTkXh/1Tpo+TW+GRoGDjje3qOgcTHa/AWEkKuKHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(31696002)(107886003)(6486002)(53546011)(956004)(2906002)(36756003)(316002)(86362001)(5660300002)(26005)(2616005)(186003)(16576012)(6666004)(8936002)(4326008)(66556008)(83380400001)(38100700002)(110136005)(54906003)(66476007)(66946007)(508600001)(31686004)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWRZRU5FcjA2QjBlQTZOQWJMamk0Q3Rob01nUHZHYWZiSkFqa05pOCs1M21L?=
 =?utf-8?B?RE9Xbml5YUJCZWZUZ0NZaHdHc3k4L3JVUm9tMDFhV21rZThGeE1pOUdPQ0l0?=
 =?utf-8?B?TVY5c3lkeFNuZkpDV2hjaHlUOHI2UmpHVVh1UjgyMWlPMG5Pa3JtZzN1NGZJ?=
 =?utf-8?B?eWp6UnliVThzYWNvV3cyc0EydnMrb2UwWTZvam1kRUlZTm9mN1RaZnZHeXhL?=
 =?utf-8?B?Smc3Y0dnQVEwZTFKNUUrNjJ5TXQ0N2VNeSswNUExRHcwRDkrMml6Q2lIeW1P?=
 =?utf-8?B?K0xjUGJlcUhMTDNxU0Q2eHkxVlRxRU0zSmkxV0JSanNoRTdiNitCVXA2enU0?=
 =?utf-8?B?cG9JSDMrMzRUMmxXTGEyd29QUmR4SmpVR3g4OUZBWG9ScmNzbHhSTER2TWMw?=
 =?utf-8?B?L05jMDc5Wm4zbXE1WG16MW9FNG1xbkdScThlRVp1M1AvMHVIaEEyMHB3VU5I?=
 =?utf-8?B?SnY3RmtieTJJNDlMbWluektXOVhjSlpzV3laeloxaFo3TUhFNGRGeEl0ZWh3?=
 =?utf-8?B?QXRCNDlySE8wVnBpQm9mY2FHeEp0OHovQ0hOMnM3bzJmdnR1TGdjRllkYzdp?=
 =?utf-8?B?M0tmd3NSd1pjbHc1dFZwcGpiN0w5OWNXRFV2STZzUnd6SzI3Vi9LWURBTncx?=
 =?utf-8?B?K0NYWThENDFkSEUvZGhyc2dMT2c3UEN4YXMvbW56WWtYbXAyd2l5T2tiTEU2?=
 =?utf-8?B?V0VteGt4MjlSNEJQQ0dURFhCZXF5WUx3eTgxN0RpZ0pCZWdPeks4U2VQMmFY?=
 =?utf-8?B?ZC9aZVNHK09sQ1VyMlg4Z2hIR2V1aGtDSWlDc3p5UFRYRjBMdnVUdW03TUMx?=
 =?utf-8?B?US9qb29wNXJDRWExSHIvMXBUMms3Tnc5cldrZW1xd1hYRmdhOHAwYkRsR3g5?=
 =?utf-8?B?WjdhSEpGOHduWGtLcjVNNkY3RUxkVFUzYU1LL2k1Y0k4ZzJsdEk4REVxZmVt?=
 =?utf-8?B?NXhoNExvU3dod0Z0TU56UVZuaDEyZnlmc2I5aUdnZVg1R0pBWXB3UzVTOFl6?=
 =?utf-8?B?WHAvRVU2MGlFRFk4d3lmTDRnWVlmMEtDQzFvV1UzRzNXRWtYWVA1NVkrQ3Vn?=
 =?utf-8?B?OCtlc2lxZUFOVElvdnFQaGdGMWJPTWhSUGh4a05xNFhEcGMxTnp2MmVwdHE5?=
 =?utf-8?B?OHlWT1lmaWlVN1FQQkpNNmpFdWZRT3dWOUpNWDZwR3NzRm5IUmdaWFp2dGcy?=
 =?utf-8?B?MzlwM1VNQ2NFd3Q1YkIvdndpNW81YjF6dllaUVBWMS9aZTd2bks0UzhseVNO?=
 =?utf-8?B?Wlo5OHRvbmdsRC95UmpJbTcxYVhGQW40TytkRVY5OGxXbUFiaVFnRzhEWVpR?=
 =?utf-8?B?SVc1aHBrN3ZlMU95QlV5RkhNV054dkFHZkpDbnkxOUgvc3loUGNnTkMxdG9v?=
 =?utf-8?B?VXpFRFMxa0VQRVVSS3lWakVQVk9IdTVONzQxeVhaNDJVQ0VQVGZJbk5udnpY?=
 =?utf-8?B?T21seHVmTnUvS2Rma29PQWR1SkZXZ2ZsN0NqUGgxQ1NGbm1jcUNsRUUzNVpS?=
 =?utf-8?B?Nm01YXBzLzVwd3pZUHErOElOOURYV3M1Z09vR1lwMVc5dFRuYUJHbTdzemN4?=
 =?utf-8?B?dHB1c2luaStVZGlYdEJ6MDBRQlNxRW1Ub1VXcjlNOHdBd0NsRXMvNVBqMS9W?=
 =?utf-8?B?QmsxbWdrOW9nckgrRXduOVNZdDlPZll5V0h3aFNtbzdzcU04cEg2bEF3aEx6?=
 =?utf-8?B?b0c2ck5UYTRBZzdTRmtzbmh3R2R2T05pUG9pdldEdFBGU3ZScy9rejZ0ZW5p?=
 =?utf-8?Q?JSnDYQyUUGl9+AZi9Qbus5+Q8HofPj6iPP2vwxA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dab93a2a-07e3-4aac-961b-08d99358fef3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 23:34:29.5326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P66rDkDnaKkL77M/jNsofUvxpp3k3+x3weZ0wzE40mP7GawX+RUzUDaMpjLA1RdAwcjpDbDFJGPMpLx2ciGzFqERVc+Xj/FI4835ukI7vgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3942
X-OriginatorOrg: citrix.com

On 22/09/2021 15:36, Jan Beulich wrote:
> Doing this in amd_iommu_prepare() is too late for it, in particular, to
> be used in amd_iommu_detect_one_acpi(), as a subsequent change will want
> to do. Moving it immediately ahead of amd_iommu_detect_acpi() is
> (luckily) pretty simple, (pretty importantly) without breaking
> amd_iommu_prepare()'s logic to prevent multiple processing.
>
> This involves moving table checksumming, as
> amd_iommu_get_supported_ivhd_type() ->  get_supported_ivhd_type() will
> now be invoked before amd_iommu_detect_acpi()  -> detect_iommu_acpi(). In
> the course of doing so stop open-coding acpi_tb_checksum(), seeing that
> we have other uses of this originally ACPI-private function elsewhere in
> the tree.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm afraid this breaks booting on Skylake Server.=C2=A0 Yes, really - I
didn't believe the bisection at first either.

From a bit of debugging, I've found:

(XEN) *** acpi_dmar_init() =3D> -19
(XEN) *** amd_iommu_get_supported_ivhd_type() =3D> -19

So VT-d is disabled in firmware.=C2=A0 Oops, but something we should cope w=
ith.

Then we fall into acpi_ivrs_init(), and take the new-in-this-patch early
exit with -ENOENT too.

It turns out ...

> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -179,9 +179,17 @@ static int __must_check amd_iommu_setup_
> =20
>  int __init acpi_ivrs_init(void)
>  {
> +    int rc;
> +
>      if ( !iommu_enable && !iommu_intremap )
>          return 0;
> =20
> +    rc =3D amd_iommu_get_supported_ivhd_type();
> +    if ( rc < 0 )
> +        return rc;
> +    BUG_ON(!rc);
> +    ivhd_type =3D rc;
> +
>      if ( (amd_iommu_detect_acpi() !=3D0) || (iommu_found() =3D=3D 0) )
>      {
>          iommu_intremap =3D iommu_intremap_off;
>

... we're relying on this path (now skipped) to set iommu_intremap away
from iommu_intremap_full in the "no IOMMU anywhere to be found" case.

This explains why I occasionally during failure get spew about:

(XEN) CPU0: No irq handler for vector 7a (IRQ -2147483648, LAPIC)
[=C2=A0=C2=A0 17.117518] xhci_hcd 0000:00:14.0: Error while assigning devic=
e slot ID
[=C2=A0=C2=A0 17.121114] xhci_hcd 0000:00:14.0: Max number of devices this =
xHCI
host supports is 64.
[=C2=A0=C2=A0 17.125198] usb usb1-port2: couldn't allocate usb_device
[=C2=A0 248.317462] INFO: task kworker/u32:0:7 blocked for more than 120 se=
conds.

and eventually (gone 400s) get dumped in a dracut shell.

Booting with an explicit iommu=3Dno-intremap, which clobbers
iommu_intremap during cmdline parsing, recovers the system.

This variable controls a whole lot of magic with interrupt handling.=C2=A0 =
It
should default to 0, not 2, and only become nonzero when an IOMMU is
properly established.=C2=A0 It also shouldn't be serving double duty as "wh=
at
the user wants" ahead of determining the system capabilities.

And not to open another can of worms, but our entire way of working
explodes if there are devices on the system not covered by an IOMMU.

~Andrew


