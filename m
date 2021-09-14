Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDC240B420
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 18:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186916.335665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQAvc-0008UN-7C; Tue, 14 Sep 2021 16:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186916.335665; Tue, 14 Sep 2021 16:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQAvc-0008SH-40; Tue, 14 Sep 2021 16:05:00 +0000
Received: by outflank-mailman (input) for mailman id 186916;
 Tue, 14 Sep 2021 16:04:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQAva-0008SB-80
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 16:04:58 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81185a3e-1575-11ec-b454-12813bfff9fa;
 Tue, 14 Sep 2021 16:04:56 +0000 (UTC)
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
X-Inumbo-ID: 81185a3e-1575-11ec-b454-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631635496;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=o89xmoAng9uJ125V3mShyKJrpaoF7fXbYluT9p9XaKg=;
  b=C9DBD16OJGfxQoie3fWu0wGvBhX2hsvMYcTjHmJFPk1R41E4KCGXSgtP
   jtAD+FWyriBHBdur6yS1QfgrL+9O/R4UVu7LDAhu+vGF8H/0o/NgrNAB0
   ZqLLGKN9PxelfME2i8o+idGdIFGCXRuirmIB2FTly/s955Xm3roh31VZU
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gryE06ybVrYslK1/jhVVBP+yMptAdKC/AZrIlPKAvSiKiF0U+s4JCd2zqzaoMaiQSkvn4GxVst
 VhLVXpF/reQoRV/7SQolxQdLxatxBLP9F6JvzzepSA8m4YKxl9O8IfNJu0yq6RWMfbXOEF1Sco
 7kZdtB0vOsFxd4LPHPdV+PABSHkcKpJT5zTbjApTtslyYGa1OCKjoqGDLzX1AvCgAjBq2/h2FF
 Y8hLhgfCdSAa6dnhYL31zdyLraEtVQ+sl9v/pg54endrEVa1UHqZr2RNisrfm+1OTWz6cWdkOP
 yRmwAH+m3iiEaOAHNT0UXAXB
X-SBRS: 5.1
X-MesageID: 52714329
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nbuj9KDH7xGk8BVW/wPkw5YqxClBgxIJ4kV8jS/XYbTApDomhjZUy
 2IXC2/Vbv+CazOhftt+btvloR5Su5DdnYUxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w0E47wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/jSi4k+pV9
 MhxtJGWbAYJJaiWlbkyTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHv+VvIMDhmZYasZmFtbDf
 ZRJTgNVaBntUjxhY30zMpFipbL97pX4W2IB8w/EzUYt2EDDwQo03LXzPd79ft2RWd4Tjkuev
 njB/WnyHlcdLtP34TiP/2+oh+TPtTjmQ49UH7q9nsOGm3XKmDZVUkdPEwLm/7/p0SZSRu6zN
 WQS5xsil4wO6XCqQ//YXj2jpSSJ4zEDDo84//IB1O2d9kbFy1/HXTFZH2EeNoVOWNweHmNxh
 wTQ9z/9LXk26uTEFyjFnluBhW7qYUAowXk+iTjopOfvy+Lqpp06xjnLR8xqeEJepoyoQWysq
 9xmQS5XulnysSLp//7glbwkq2j1znQscuLTzl+JNo5CxlklDLNJn6TytTDmAQ9ode51tGVtW
 UTofeDEvYji6rnWz0SwrBglRun1t55pzhWF2QMH82YdG8SFpCf4INE4DMBWD0Z1KMcUEQIFk
 2eK4lg52XOnB1PzNfUfS9voU6wClPG8ffy4BqG8RocfOfBZKV7YlByCkGbNhggBZmB3yvphU
 XpaGO7xZUsn5VNPl2bvHLZBjuZwn0jTBwr7HPjG8vhu6pLHDFa9QrYZKlqeKOc/6aKPugLO9
 NhDccCNzn1ivCfWO0E7KKYfcgIHK2YVH5fzp5AFf+KPOFM+SmogF+XQ0fUqfIk8x/ZZkeLB/
 3ecXE5EyQWg2S2beFvSMn0zOqnyWZtfrG4gOXB+N1ifxHV+M52k670SdsVrcOB/pvBj1/N9U
 9IMZ96EXqZUUj3C9jlENcv9oYVueQ6FnwWLOyb5MjEzc4Q5H17C+8P+fxup/y4LV3Llucw7q
 rym9wXaXZtcGFgyUJeIMKqilgrjs2IcleR+W1rzDuNSIEi8opJ3LyHRj+MsJ51eIxv02TbHh
 R2dBg0VpLeRrtZtosXJn62Ns6ygD/B6QhhBB2De4Lu7aXva826kzdMSWeqEZ2mABmb9+aHkb
 uRJ1fDsdvYAmQ8S4YZ7Fr9qy4M45sfu+OAGnlg1Qi2TYgT5EK5kL1mHwdJL5/9EybJusAerX
 l6Cp4tBMrKTNcK5SFMcKWLJtAhYOS34TtUK0ckIHQ==
IronPort-HdrOrdr: A9a23:bBtLvaDDdh1wvSLlHeg2sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHK9JfjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 3+CNUbqFh5dL5gUUtMPpZzfSKJMB25ffvtChPbHb21LtBNB5ryw6SHlIndotvaPqA18A==
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="52714329"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAvpsIDa5pwN4+z/49IA4U3b+GF/C15ns2+NoJhblvMEX3/8ClXm+CQp4HKMkZbn5WI1DVf6TDJ8W22MGEHqfL81k4OD5jjPfUnKumjls5cUHHjHXyAPG3y+9nao5EqqoZeBJfHsSQKX1Ebk2LQq5ziwkfZng4N4M5fMsT+3kMVpqwVo7ZxH/B9rWDyJ3ljgEHq918I176CLkDukullVmgrRzx5PWr8hqBHsFP9pbgti/gZvxsQC9CQG5sw0o6PwtDmPqSTVtVZpCzEPTnbSFSmiUndqoinnMb+BF92eTfBogX5QJSfN1m/2QJwAJEzPc42G/LiCSYYOOjd7kVzhDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MQpun+hJTHP5TYfFSveNxQaob6FXDOnfGmGUw6bbQMg=;
 b=QqD+Zd76/goXnlmIq54qZvvGDjikjS3AlTJcKNNLoW7pTV1K2oeUCfhaVkG8P2it/GWY5B+rw/rr1DgXMiYQ0K43jthfHWGuFDC/yC6MMTo4AXDYs6fGfdLUq6BxUEdUmQ5Remg+NZuXZCgd86Kh3upyU3+h7w/7YKBj6roTc1Ea/yydDmxO2ts7nQJNtWRB0IPCatKSj0QrMqqLHUUUA24/YDsFH+vBfAkRh88KvsfRE2TQ3eGoLrzTnw20yENXX/sy+d0o4hr7R6G3DPNnMo8qj1p9Nb8+njEI5cwtGZQ81qvsXUkZdaX+zpDyEMW/Jw/WRaZoQ8SpF126diK1rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQpun+hJTHP5TYfFSveNxQaob6FXDOnfGmGUw6bbQMg=;
 b=dKW3a1uNZ/E7ti/tLdH1hE8TtXbyTbEQxbWDo7yo8T0MXQfBHbFd/VmuEyHcK8jUMxcWrbyeVhfy3+g2j+YQUahIwqGP8geOpsJBcTv0TgR4qwAHu/9HpV68ub0Kb/Sk97V9EgJSpqdaeYaPtKNkT9XCcQJmRK0T6xUdFEjz5KA=
Date: Tue, 14 Sep 2021 18:04:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
Message-ID: <YUDIIA9Yk2CIYcWM@MacBook-Air-de-Roger.local>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <YUByvkKO+NlIjB2m@MacBook-Air-de-Roger.local>
 <45e8ef36-3f7a-5cd7-e640-61e1c6d63903@suse.com>
 <YUCFxJnDoaVNgHiu@MacBook-Air-de-Roger.local>
 <df432c93-b722-6006-c3dc-7f511b377bcc@suse.com>
 <YUCwD5RWj0WKZZUc@MacBook-Air-de-Roger.local>
 <d8b1b328-7887-cde4-dbe4-bdc43a1d5147@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8b1b328-7887-cde4-dbe4-bdc43a1d5147@suse.com>
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d7fe926-7249-49d7-1791-08d9779963bb
X-MS-TrafficTypeDiagnostic: DM6PR03MB4682:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4682163CBF3E8FA33BE097148FDA9@DM6PR03MB4682.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GKdfoE/NtUakt09vGojh7L64RxJFOQ+x3TidQ7aDnCN6YQZnmehPLMAGNBTGco4GEPxnIAuiRsf7wE5MZkA0sM5nSvlsfOT+aeYsuv8hyneMi3Mmbu1wJl/6M4ZUwLhYvsZUHxrh/fD8+dK2RuKZQsUTvq5Jn1uHXgQEF1fSwDJ75bMZoj/96jv0Nh+ch4PhWPt8p6md18LMi52YyXErMxgDLVUJZuiJjRdGdSTtiN2rs4Iheb7wW36EmmgrKg6/DIuSvcf4Ae8HM2ITCCe8in5F9VgWSpZG2tg0qlXoKjCFxrViiEc3tYhK61pCdJcvbqEMEl5WnnLvS9DeduFy1qftPKxRroHMQFU0jE3H3+ZJ4SzBep/Mc0wquMt7lYYwneAQkSLXtWyXHrpp6kj4TJOFktEYnDA+oqLmu5wGZWaIXEEU1VdIQggItcXwoY7SPgne0LHAwLAjeNHXRc5PJjMGFfpjJDaXzJLhwRIQiQSb/XT1BlVKf64dXgDbRdLpku/UgqcWUBPfXZE+URSQyjXC5wzp2hbgL5eXEz7sA8osxhcl32J9K96Cdpoe9OP3a1a6Ax0nIq96hkJJMnelVtlhfXM4xtyK7QjGNDQouigUmiJGZGR+EJ2ftAHASo96aH8myTqCUZ1IgfxX2uNUiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(9686003)(53546011)(956004)(478600001)(6496006)(15650500001)(66476007)(8676002)(38100700002)(86362001)(6666004)(26005)(186003)(83380400001)(66946007)(6486002)(8936002)(4326008)(316002)(2906002)(85182001)(6916009)(66556008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWpyMGd2SGhkQkdhMkdxR1pETFdZcGdrWHJHeElnRkRlRUtjUFAzTVV0Vmlq?=
 =?utf-8?B?SEIxcitlYzBGbXBHYkp5V3NJTEJGUFIvQURFNTFmRHJodElldXBUeEVpOVhT?=
 =?utf-8?B?Ym1hODdMdU44SlF6Um44OFRRMkNndlN6Tlk2aXo1NzgxdDBmMzV4bWU0YU5q?=
 =?utf-8?B?TURkb3lkQS80cmdaMnpOaUd5VEpxSTVFck55dHU0SStRUUxQaW9RYkxrTndh?=
 =?utf-8?B?TzNMUFpRMjBRb2xWRFFsSTBFQlhBNy9nSm4ycGNJYVRzekxiQjlkTDIrSFdY?=
 =?utf-8?B?eWlBdWd1dkROWGlWQkRzb3B2U2Y3UUhMa0FWc1FCRW1XL0l2TzN6Y2s1ZEJ6?=
 =?utf-8?B?Yy9lUzVhaTdRWmtpck5UWFV6S1Z4RERueDByTnc1MnRuWFM5VXNCaFJ4MFNl?=
 =?utf-8?B?cFdHTkZjeXJSRGx0Ui91Z1JJYTBXM1l5bURTdENMWitqZjBwUnhwSmRkcFpM?=
 =?utf-8?B?WnZwNG9Wb1RwRG9CN1JnZXF2RHlzUU1CcmtHTldqM2VzRDgvTG4ydGY2V2ZD?=
 =?utf-8?B?UXhUdGZDeW9jUHh2ZityYkloQUVVNXF3clVZRHhYVjhLYWNZZjNyWlhxaG9z?=
 =?utf-8?B?U0JZNVNKc2t0dDVrS0VyZ2tkWUoyR085UDlpZ1NmbHNtVU50T0VET1NGR1A4?=
 =?utf-8?B?K3lOaWU5MnJ3cnFqcHd0MkFGeWt0UG5qTEI1ZCtmdjNlYzc5aWR4aVJrb0oy?=
 =?utf-8?B?VXh2T1pCeWV1c2ZOeHovY0lQVWtnVi9GSG9Sd1dzWEMzazY3d28zK3cydFBx?=
 =?utf-8?B?S1BWS0EzRGVmcFhvbE44TGVLZXZYVWwvc0RhaVJsS3FpeGduNDZPb2Y1TEc2?=
 =?utf-8?B?eXdvcExLK2M2dGtURktUWkhLMG0vNjlwNnZwc0VQaEo0OER0K1VuTWpmSmRz?=
 =?utf-8?B?SXEyWml3V001ZDdhMGlEVkhvTytIakoreVVXOTkyeGRmV1pONTVpZm52aEEz?=
 =?utf-8?B?UTZQejhrY05Ed2NPMVBLL3o0ZEpCMEJwOURFd2IzbUw4Mit6clhDODlZNDRC?=
 =?utf-8?B?amorNTV4bEgwS013YnhOUEZ4b2FVajRESWk0SDZKMy96MkZnd3drc0RmbHVL?=
 =?utf-8?B?b3hpYXhMUE5yOTNzTUtNQTNnYjNTYUVpZXZmRTBNbGhvWkJqOU8zRDZwRUJJ?=
 =?utf-8?B?Um50SmVWNWVUcnlkNmNrcjZhak9PQm1POW00VEljU2dvK3hGL3NpL2YrdlNk?=
 =?utf-8?B?aFpNeDFKN0J3dnFab0d2UTl5MEJyeWtrc2dIQVVCL0F2NlNTRzl5VlI0SnJC?=
 =?utf-8?B?ZzBYYVEvSzdueFlQYWhEejFZamg2cjdaMWIraGZXRFhDMjhXVUhBVnFQNG9T?=
 =?utf-8?B?aGZYVFFybWpMbXo5M3htRFFIdWMyOGZpUkJDZjNacUZNZmx4cmhJbmtESm9N?=
 =?utf-8?B?RWN1UjB5NUNPRG54U3pnWmlkYjlhQklyTEZab2JxU0ROOXM3d2VKdUFKRFpX?=
 =?utf-8?B?dXlWdDBOS0h2L3VYanhQU3ZkSmxKWFhRMjJRc1NzWmFFbGNmT00wSTRoVmlY?=
 =?utf-8?B?N0NIclRudWFhcnVoSnNhRjI1ZHY0aEY4MklvR05ldHF3MnZHbW12UUthMUM1?=
 =?utf-8?B?b2RCblZQWnkxSFRHb3E4aVcxSi83ZDMyekZCMUpYMFJEMTgzMmFjK0tUT2tQ?=
 =?utf-8?B?Z3hZelNTbzAwdWZxQ3gyd3kvQUxoMXlOaHIzYnF4c1N5RjlidTdMYzVsNGdV?=
 =?utf-8?B?U1J1Z25VaURiRzE2U01aY2tudDQxdFFNaVNXQlhTRGhWV1paUURlbDNZUnA5?=
 =?utf-8?Q?o2+ukTumQFAypVAP1/rrGeOEe/4UxTKDyXppY+2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7fe926-7249-49d7-1791-08d9779963bb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 16:04:53.8081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJnGsoDTdbvMyYvGaRbU4/Wt4+77pz6uBFUG1Vc/qzOUjfG0x+XaVxw70bW5+bOx+TKHcVAzQ1Hcw/Zct3Nqbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4682
X-OriginatorOrg: citrix.com

On Tue, Sep 14, 2021 at 05:16:17PM +0200, Jan Beulich wrote:
> On 14.09.2021 16:22, Roger Pau Monné wrote:
> > On Tue, Sep 14, 2021 at 02:05:01PM +0200, Jan Beulich wrote:
> >> On 14.09.2021 13:21, Roger Pau Monné wrote:
> >>> On Tue, Sep 14, 2021 at 12:12:12PM +0200, Jan Beulich wrote:
> >>>> On 14.09.2021 12:00, Roger Pau Monné wrote:
> >>>>> On Mon, Aug 30, 2021 at 03:04:55PM +0200, Jan Beulich wrote:
> >>>>>> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
> >>>>>> console) are associated with DomXEN, not Dom0. This means that while
> >>>>>> looking for overlapping BARs such devices cannot be found on Dom0's
> >>>>>> list of devices; DomXEN's list also needs to be scanned.
> >>>>>
> >>>>> Thanks for looking into this, I certainly didn't take hidden devices
> >>>>> into account for vPCI dom0.
> >>>>>
> >>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>>> ---
> >>>>>> RFC: Patch intentionally mis-formatted, as the necessary re-indentation
> >>>>>>      would make the diff difficult to read. At this point I'd merely
> >>>>>>      like to gather input towards possible better approaches to solve
> >>>>>>      the issue (not the least because quite possibly there are further
> >>>>>>      places needing changing).
> >>>>>
> >>>>> I have a couple of questions, AFAICT we currently hide the serial
> >>>>> console and/or the VGA adapter if it's in use by Xen.
> >>>>>
> >>>>> I wonder whether we need to add vPCI handlers for those:
> >>>>> setup_one_hwdom_device will attempt to add vPCI handlers to the hidden
> >>>>> device because of the temporary override of pdev->domain done in
> >>>>> _setup_hwdom_pci_devices, but I think that for hidden devices we
> >>>>> shouldn't add vPCI handlers. We should instead block PCI config space
> >>>>> access from dom0 to the device so that it doesn't mess with Xen usage.
> >>>>
> >>>> The answer to this follows (I think) from the one below.
> >>>>
> >>>>> It's also not clear why does Xen want to have those hidden devices
> >>>>> partly controlled by dom0, as it would seem to me that dom0 interfering
> >>>>> with hidden devices in use by Xen can only lead to trouble.
> >>>>
> >>>> Dom0 can't interfere as long as it can only read from the device.
> >>>> Restricting accesses to reads is one of the purposes of "hiding"
> >>>> (the other is to make it impossible to assign these to a DomU). Not
> >>>> allowing Dom0 to read from such devices would lead to wrong PCI
> >>>> device discovery - some devices would be missing (which may or may
> >>>> not be merely a cosmetic issue). If the missing device is a multi-
> >>>> function one at function 0, other devices in the same slot may also
> >>>> not be found by Dom0 (depending on whether it looks at non-zero
> >>>> function numbers in this case).
> >>>
> >>> Hm, indeed seems possible that missing function 0 the whole device is
> >>> skipped.
> >>>
> >>> Maybe we need a special vPCI handling for those devices that just
> >>> allows reads but not writes, and that doesn't maps the BARs into dom0
> >>> p2m?
> >>
> >> Not sure about mapping. They could be mapped r/o. And they may
> >> actually need mapping for multi-function devices, but I guess for
> >> such devices to actually function properly then there would be
> >> more work required.
> > 
> > I'm also slightly puzzled as to why ehci-dbgp uses pci_hide_device
> > while ns16550 uses pci_ro_device instead.
> > 
> > Is this because the PCI device used by ehci-dbgp must be shared with
> > dom0 for other USB ports to be usable, and hence dom0 will need read
> > and write access to the device PCI config space and BARs?
> > 
> > Note that pci_hide_device is less restrictive than pci_ro_device, as
> > it doesn't mark the device as RO.
> > 
> > That would seem quite risky, as it's likely that dom0 will perform
> > some kind of reset of the USB device and thus the console will be
> > lost.
> 
> There's actually a protocol to prevent exactly that: See PHYSDEVOP_dbgp_op.

OK, so dom0 should be allowed write access to hidden devices config
space and BARs, while RO devices don't. That means that for hidden devices we
need to intercept PCI config space accesses and use vPCI for PVH.

For RO devices we already allow read-only access to it's config space
when using vPCI, albeit it might be nice to also add BARs as RO to the
guest physmap if they are enabled.

Will look into sorting this out.

Thanks, Roger.

