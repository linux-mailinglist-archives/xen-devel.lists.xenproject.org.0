Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AFF416220
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194466.346436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQiS-0002Qh-KD; Thu, 23 Sep 2021 15:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194466.346436; Thu, 23 Sep 2021 15:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQiS-0002Nz-Ga; Thu, 23 Sep 2021 15:32:52 +0000
Received: by outflank-mailman (input) for mailman id 194466;
 Thu, 23 Sep 2021 15:32:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTQiQ-0002Np-Tz
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:32:51 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b887012-d133-440d-8d37-48b6af99417a;
 Thu, 23 Sep 2021 15:32:49 +0000 (UTC)
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
X-Inumbo-ID: 0b887012-d133-440d-8d37-48b6af99417a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632411169;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mRYhV/YxFFDWgN2paOw5bft5dY4LTyWLa0EQtr5zxJg=;
  b=QH0cazgI7wFm39SlCvzyHIEZgqIwRR2om950BVajZyiRE1vAe9l22N1d
   ak+zk6sbk81pi2oIxWAziNPUidmRkcHwLf8HjvfLjt/K1PzfA0c+Ea9rP
   8SyQ1Ygylc4p9s+0tsfkio8UoOf3KqXoTmGZSXbhfOQWNfezLTdcqEI+P
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6wUaDRBw9jS01BN8Po48pkde8pPtEGawwOJK7nIdLKya1KfWtZ3LFY/qTAsESwDGwo63G8PYAj
 yIVhQlCzyykIQmJI0W0UBf/nNeijQYwQ5QJzaXfvh7olR+TCVYrGZfl1ZFAt0/oDpMnp06JKhv
 xw/AKTjOJZYWWCnndwPl6zC4ZAx/jsg5ciRrAf7lM7QN850DIfXogHDszWrXDY3O51hq60WfTS
 lP3myj6Kq1DwNZXmsHolHkfCr7pelHzMWgeh/T+9rZeggMLdVUxhCQLvqplB8LOle+FZeiZOyr
 n7+W9p1RC6kTWkf8Jg3+kR4a
X-SBRS: 5.1
X-MesageID: 53448890
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KqBYBq3TlRf24cPxrfbD5Q12kn2cJEfYwER7XKvMYLTBsI5bpz0Hz
 GVODT3QO/qLYzD1copzOd638E5QvMKBn9dhTAY6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywbVh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhz/dI1
 fQdjMWKWAoFG7OdmuEhbxZ5DHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIQEgGdg15gm8fD2Z
 uA4azlsagn6PTp+HwZMN801jPr2vyyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PL+y++NugVaT7ncOExBQXly+ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTXoh0eZn04lAuBBHsEf9lCPz5bo7CeGUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P8mjvY3Z9wXsqIHZeFFpYv4CLTJQb00qXJuuPBpJZmTEc9dvY+
 DmMsCF2rLEal8djO06TrA2f3mrESnQkSGcICuTrsoCNslgRiG2NPdXABb3nARBodt3xor6p5
 iRspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD4J9sLuGkleh04Y67onAMFh
 meJ4mu9A7cJYBOXgVJfOdrtW6zGM4C6fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEy8kC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPQkEgADL2iPHOHmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcDoLYmrXGYewiMdF55b7bjAcR2oX4hZHR+Nle0wXkzJ42o6f5HJZcweLAm8s1lzOJ1E
 KZZK5nRXKwXR2SV4SkZYLn8sJdmKEahizWRMnf3ezM4ZZNhGVDEo4e2Ygv1+SASJSOrrs9i8
 aa43wbWTMNbFQRvBcrbcty1yFa1sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JsqYvHn6GJqYutAtBSJEsCEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iqrIGnARpGHLHMwaiBr96eyTU2MBOsutGx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577WA0xdMi6FhDFZMLYoYpgux
 v0suZJO5gGy4vbw3g1qUsyAG7ywE0E9
IronPort-HdrOrdr: A9a23:/Wh1gK87Pv5+oL65Xgxuk+HIdr1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQodcdDpAtjkfZquz+8O3WBxB8bsYOCCggWVxe5ZnPLfKlHbak7DH41mpO
 ldmspFeaXN5DFB5K6QimjZLz9K+qjizEncv5a5854bd3AMV0gP1XYaNi+rVmlNACVWD5swE5
 SRouBdoSC7RHgRZsOnQlEYQunqvbTw5dLbSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkjb++r6ov5iAu1zhPi7ontZrcenau59+7f+3+48ow/LX+0CVjbFaKvi/VfYO0biSARgR4Y
 HxSlwbTrlOAjvqDx2ISF3Wqkjd+Qdr0mTlz1CAh3vlvIjWeBIWYvAx3r5xQ1/h8Ewns8h70K
 VXm0Sjl7QSIy/hsU3GloL1vzcDrDvpnZPnq59Ps5UXa/puVFdcwLZvg399CosPEi7h9YwrJu
 FyEcnX5fJbdk6tdXzCpGlox+qtUx0Ib2m7a1lHtcqP3zdMmndli0Me2cwEh38FsIkwUp9e+o
 3/Q+5VfZx1P4crhJhGdaw8qAqMexjwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvfJAT1pM9lJ
 nITVsd7AcJCg7TINzL2IcO/gHGQW27UziowsZC54Jhsrm5QLbwKyWMRF0njsPlqfQCBc/QXe
 q1JfttcrLeBHqrHZwM0xz1WpFUJ3VbWMoJuswjU1bLuc7PIp2CjJ2TTB8SHsuaLd8AYBKLPp
 IuZkmBGCxw1DHdZpajummgZ5rEQD2Mwa5N
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53448890"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0GzuGB+4YLxoZRtukIlmPVu1ArzaH2pIAPm0kneKxwvAZ4JL4gnB1P5938JCy6X0pvSZZ6u92xamCgC4Z+scSNnuS0ZfwK9x9xL6MOS+5l9Tl8nozlQ+DyXx97t22kBXFZj1KfB04eLUWV7TAo8vVt2tS3MnLpo+tRABCr7WYoWAwF0uW8gbFvjYq1EHltWce3zMSx3L3EVp5dH8xlAT7qDY3ItHH7arpfI3AxMN/Bmr53Np4KW95Q2LXllK4waDjZe2OH/2Y8QSJNLfsjXBgvdfDA25nHZwCdLcdSXqWG2G99cMAXM/vFHsDgtUGknlnx0FdiFv3jyTMgD9AdHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GNggsnDnIbmEeToVRGIezV+HEFw+Kkt3ctCENGZ+mME=;
 b=asW/NMPOKpzYvvcVqCjtcUhyY5ouvMipwpqK/MZZ9wy7GJ3WtUD1J9rytyC4i350bPgI8MvesQ/LMXI+wBd8yP+SIEWGi1XhZrB8WbQZmNLUWouyJ4MSW4AI0nAs8IdDQaeLg/raC7HKY/nDCl8lwDinjv2dGU5sBa7L5NB0J5vGJjOY/MaozcU1NB+iS+0DO5ei3hOMHWsl8MZJ+f4j2ldFGyxnSNBeoS9ckr8chxsHU4lEzKAYjMfZhSJctaxkQX/xWTk87GqW4yVQWsYjvkZFzmjeQv8bAjW00Lb2ySFmBMhHPGV6dWYhsa+6GgoGmcD8N55lcSBIshrS0ZC+rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNggsnDnIbmEeToVRGIezV+HEFw+Kkt3ctCENGZ+mME=;
 b=gOhQOERWUmUtZldYu7KQvKrCQCeoplWPKLLAfVkZlBOjZ6tf5gOf5IlpQGzPa9KMb6Dztwvcl8u9kTQgkJj+A5nlGpNdQFkgxvcYV4nEb8Lixv6xO3KIS/UKFSbhniAi+u04oa5TRoIovNXZyrnPa1rT8TppaLmJr/plBukT/ko=
Date: Thu, 23 Sep 2021 17:32:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v3 9/9] x86/P2M: relax permissions of PVH Dom0's MMIO
 entries
Message-ID: <YUyeGYFMdeiPFHV3@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <a141e1a5-0185-4923-a91e-68c06a4f78cf@suse.com>
 <YUxgsF47nrTn8WrS@MacBook-Air-de-Roger.local>
 <ec456bf7-df78-59f2-6c14-5bda165125c8@suse.com>
 <YUxrE/kx8wmftVIX@MacBook-Air-de-Roger.local>
 <33abd731-7c2e-8c9b-963a-fd446a21e87a@suse.com>
 <YUyaCrdAdpnn/o0K@MacBook-Air-de-Roger.local>
 <959850f7-1d06-7dee-b9fe-0d28d068b8e4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <959850f7-1d06-7dee-b9fe-0d28d068b8e4@suse.com>
X-ClientProxiedBy: LO4P123CA0452.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42b2d216-d033-4edd-1960-08d97ea7645d
X-MS-TrafficTypeDiagnostic: DS7PR03MB5606:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5606F2A4B09FC1FD2C98C6D58FA39@DS7PR03MB5606.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +E49BChgq53ZqetzIOHdaB5lDikflxelQ+Ujd9zEuNvS5W/RX0PrR3GYCwH6ggIidp2qQQ3V4wenJpO2DRpdjrNNFrm3DJm7MN7Tu6W+SgXjmKJqewoRP9LBqCD1ehN/Uhd5MF+85G/lHCPhy963Qvi0YsH7sgDDIMereCOueK9md/R1I6NCA+bdahX4wTkTgIjh9SXIna0A5AzLA6iPkTbtK7iz68Dy67N/aF6ZrzkmiimJyd5P1L/PEV8fiAVzvwYQJkhJgfMVTjExpmDcp7i8vcsLpoIJTeTRcfbCD00wZ+EAJ7mSekhWAlMTguqQtaoPix4fJwKedRLNE8nDNRyM2ieecEaRkeTAmO/AXhx+8VeeC8ybXLMAeklVc4bfxY8b5M/QxMHW5eNPt+6Sppsn+5UBa5pH370HmFnCV6+mnVo4cgiZov12tDPec0K2X+h9BrgxF7TIMu/F7NTzVgXCFEYxtwTdHWL04EmL0cXAlPb6b1DtF5ble3h7h7+dBuM+Qh8AAdtAA/+JWespEBLTC6xHmu9tjNk52SHt8D8WeyYdVOURySvT0Oweyqp34z/UyeupceYeWr3srvaHOyrLF7nfhzfSB3NwjxtP4WqMoiXyyRx4wijNeF1beIJKhBp6x6dC1Gl2ZAS5UXU7Sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(38100700002)(83380400001)(26005)(53546011)(8936002)(6666004)(54906003)(316002)(6916009)(85182001)(86362001)(6486002)(6496006)(9686003)(66556008)(508600001)(66476007)(186003)(107886003)(8676002)(956004)(4326008)(2906002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTg0YWRiaTZMMjFrdkk1WnQ3UzlWWkR3ai9LbVZYeDNLYXhOdTcxNDVoODln?=
 =?utf-8?B?NGJHOTFNTEtnTm54ZWQ5Q2VFcXNSZEF6RlVrT01qa2swM2k0aDhVeU9jMnB1?=
 =?utf-8?B?K0dSZDd5OTB0Tkcxc0w5dXBsdC9mbzh3Z0RYMGRGR1lTbzJ0aEpkL0gzWHpB?=
 =?utf-8?B?MUZacHkwSnBUcUxNZE8rRGZsQTVSTGJCWTFKa3A4ckc2N00xYVBkajNHQzRm?=
 =?utf-8?B?MHlnaTl4MFBJNVNLTWp4V1dWdzJuQ05XRThwWFpEdDhhZlF4MXNseHpHaklv?=
 =?utf-8?B?VnR4Z0tQYVdtTlY3SkNwYVFzSlptOGZGd0doVWdwNXVXNGFOZ1o2VDRtNHZo?=
 =?utf-8?B?SHc0bi83MUttQjMzbWg3dktGalF1WjZidXhRbisvOTVrWFFNcUwySEthYWtX?=
 =?utf-8?B?S0swM1VaRXk0THE4cnF2QmtRYnNEbmc3UnlmNEsrcjc0UzFTUEI1UGZaSkdI?=
 =?utf-8?B?NUN4L0FlazZtNUp2d2p3U0czOTFWN0NvK2NIeFo4MHJRbUtpd09sZjY1a2Ez?=
 =?utf-8?B?Nmt4QkxQUHNkV25PRU4xMDVCUVByU0EwazcvWXptdXNJVkk0Q1JCWFZpWEJ5?=
 =?utf-8?B?VXBWMzF0RnY4R1RQRzJpM1pzZTRpYS81Smh5YkZDTHZSZVhhTnFsdlcxYVY3?=
 =?utf-8?B?RmpHWHFvWHlSenJHZWpQVnczUEx6Vy9xcWdtY3k4dVRTWHp2bURiT3V3bHpo?=
 =?utf-8?B?bUFKZnJzWXBHbXUvanRTcjhteHhmd0VWTlZneFN2RXNJVHg0N2ZtdVdrS0JE?=
 =?utf-8?B?UUY5aWdJT1ZJUER4bEJCYkxBRUMrUCtuOHpNMURKaGptM1A5OVRNL2dObWtM?=
 =?utf-8?B?T1lRL1BJS2hSdHpOam1mb0ZsY1gxcHMrbEVUZkxSaUZrSWgzNEZPODIySXpM?=
 =?utf-8?B?eVdUaExUaVJTSmk2NEV3MUUxWEdFVEdJYkxGb0J0ejZpZ1gvSmlJTnRJOFFy?=
 =?utf-8?B?eXlJOXQ4aWdQTC9qV0tQRG1DeG1OcC9BWEpjUHVheTl5VGxoSHJZdkQwRnlV?=
 =?utf-8?B?OUNxcHFUeWY0bWxFeE9XUmdJWVZFc0lzcUhHYit2a21nZmFCVXlyVjBpTVc0?=
 =?utf-8?B?cWY1RUFCWjVzeGwxNnZaZUFSelJNY2dQZUprdlMxZWdMUW9IWDN0TTR6OXdJ?=
 =?utf-8?B?QjFaZERFR1lvcTAwYjhkZ1luNFpvZ0Y2UUFqWHg3MlNlSUgxUmxiWHJhMUJ5?=
 =?utf-8?B?UXNML3FULzEwMERySDNsNW9Kd291WDJVdlZHcW5DT2R3VzlQRzdpWUJ4TVJr?=
 =?utf-8?B?K1N1WW9UYTJVOGtlSlZhcm1TdW9JNDE5bXB5RTZJWm43NkRENjB4dSttcHl3?=
 =?utf-8?B?SUJSeGsvQ0w2bDFvYTQ3ZTRuc3RKanZGZGVWdkM4cnNSU0d5VmZVOHgwL3g3?=
 =?utf-8?B?VDFNNU5vR0I1UWVLQ2RVQXFuQ3FsT1I5QkRadVNySEMvbXR4bmh3cVRTcW5X?=
 =?utf-8?B?dWpjak9LQ3hnZ0k0UXdtWmFXTkt1L2hxMmFrazdlNElHcWNJMlBHNk9ZQVB1?=
 =?utf-8?B?VnlSY1k3cTVFTVl4Z2xpMEtMQk5aUmwvTnFFZlM5UHc3YzJJcHlJK2xKVEFY?=
 =?utf-8?B?dzk4YzduT1JiQ21rQlhQcFgyQ285d0Fmd2pNUjBzaDJpZmJZdzYxNC9SdWpM?=
 =?utf-8?B?ajBnd24yLzlCTXAyVEVNd3liQU01c1dwR0lwNDNVKzNPR2tYRlVCZXgxbFJL?=
 =?utf-8?B?eXdTRHE1UVZwMi9YK3BrV3JWcHEzclpXNEtjdUR5eHVSSEpzMW40c3pTN0tm?=
 =?utf-8?Q?g0PBu34M2cXfN6t98FiRBRFLZ2rnbDtcZ/IeWQ0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b2d216-d033-4edd-1960-08d97ea7645d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:32:46.0128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLuEn5+Dj5DPBZYZkmm4aSh+jS9mBAPvTYYxbk7e0l+m6nBahvxYJKEASLruPH0IA0NqAsCXBDDb7nyAcIUIFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606
X-OriginatorOrg: citrix.com

On Thu, Sep 23, 2021 at 05:22:08PM +0200, Jan Beulich wrote:
> On 23.09.2021 17:15, Roger Pau Monné wrote:
> > On Thu, Sep 23, 2021 at 02:15:25PM +0200, Jan Beulich wrote:
> >> On 23.09.2021 13:54, Roger Pau Monné wrote:
> >>> On Thu, Sep 23, 2021 at 01:32:52PM +0200, Jan Beulich wrote:
> >>>> On 23.09.2021 13:10, Roger Pau Monné wrote:
> >>>>> On Tue, Sep 21, 2021 at 09:21:11AM +0200, Jan Beulich wrote:
> >>>>>> --- a/xen/arch/x86/mm/p2m.c
> >>>>>> +++ b/xen/arch/x86/mm/p2m.c
> >>>>>> @@ -1319,6 +1319,18 @@ static int set_typed_p2m_entry(struct do
> >>>>>>              return -EPERM;
> >>>>>>          }
> >>>>>>  
> >>>>>> +        /*
> >>>>>> +         * Gross bodge, to go away again rather sooner than later:
> >>>>>> +         *
> >>>>>> +         * For MMIO allow access permissions to accumulate, but only for Dom0.
> >>>>>> +         * Since set_identity_p2m_entry() and set_mmio_p2m_entry() differ in
> >>>>>> +         * the way they specify "access", this will allow the ultimate result
> >>>>>> +         * to be independent of the sequence of operations.
> >>>>>
> >>>>> Wouldn't it be better to 'fix' those operations so that they can work
> >>>>> together?
> >>>>
> >>>> Yes, but then we should do this properly by removing all abuse of
> >>>> p2m_access_t.
> >>>
> >>> I'm not sure I follow what that abuse is.
> >>
> >> As was clarified, p2m_access_t should be solely used by e.g.
> >> introspection agents, who are then the entity responsible for
> >> resolving the resulting faults. Any other uses (to e.g. merely
> >> restrict permissions for other reasons) are really abuses.
> > 
> > But some p2m types don't really have a fixed access tied to them, for
> > example MMIO regions just inherit whatever is the default access for
> > the domain, which makes all this look slightly weird. If the access
> > should solely be used by introspection, then each type should have a
> > fixed access tied to it?
> 
> I think so, yes. Hence e.g. p2m_ram_ro and p2m_grant_map_r{w,o}.
> 
> >> That
> >> is, if e.g. a r/o direct-MMIO mapping is needed, this should not
> >> be expressed as (p2m_mmio_direct, p2m_access_r) tuple, but would
> >> require a distinct p2m_mmio_direct_ro type.
> > 
> > I guess we would then require a p2m_mmio_direct_ro,
> > p2m_mmio_direct_rwx and a p2m_mmio_direct_n at least, and ideally we
> > would need to differentiate the mandatory regions as present in ACPI
> > tables using yet different types.
> 
> What would we need p2m_mmio_direct_n for?

AMD can specify no access at all for certain regions on the ACPI
tables from what I've read on the manual (IW = IR = 0 in IVMD Flags).
AFAICT amd_iommu_reserve_domain_unity_map can already call
iommu_identity_mapping with access p2m_access_n and that would get
propagated into set_identity_p2m_entry.

> And what's the (present,
> not future) reason for the x in p2m_mmio_direct_rwx?

Mapped ROM BARs, but I'm also unsure we shouldn't just map MMIO with
execute permissions by default unless stated otherwise.

Thanks, Roger.

