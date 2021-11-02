Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21499442A6F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 10:32:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219849.380875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhq9O-0000GV-CV; Tue, 02 Nov 2021 09:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219849.380875; Tue, 02 Nov 2021 09:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhq9O-0000Da-8n; Tue, 02 Nov 2021 09:32:14 +0000
Received: by outflank-mailman (input) for mailman id 219849;
 Tue, 02 Nov 2021 09:32:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XxgO=PV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mhq9L-0000DU-UY
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 09:32:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0b7e23e-3bbf-11ec-8553-12813bfff9fa;
 Tue, 02 Nov 2021 09:32:10 +0000 (UTC)
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
X-Inumbo-ID: c0b7e23e-3bbf-11ec-8553-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635845530;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lnFy/6nMka9TH5+76jPpzTqtqizN0T0POTurOXjuF7s=;
  b=QMo/h2SMChJAL+XdLUx+satT1w0ra9jQHA7Mx2XCTJjKj5PoNC5d7H7m
   ZcL18inYiIxdvLJWGBNEeii36VM867W0K0kiTKqqfMC7lEMIkRzKAQjec
   EzzM0WYiplf7f8P7mUsj78HpzO0v/AgDlGBuZ8YV+m/RtbzfUFk2QFf2S
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nvEN43kiGKYOOMCHpw5yPuxDuEygdWKZ2zPojRXFjDxhDY2Mvz0/GOchmL5w1pZiNOZzxh7qq/
 Sq4lklcBKX/WdnF0EHKG24JfLkw3sytP4cW50yC4ci7xf0MVOCy4f+BuwWkM/9nTNNlWrGiHj8
 2VvlK82H8tpctYP/ZN3c54YNdMOaXpG25h1dsw60eBPaNG8fObnhIu/TGhqKRkh32SS+nseo8R
 0FI7PUBBZKeywDItYfTmlzp0PQpf5q6GBG++qOK8MkNO470IZC4rMPa7yP3thgd2BLeYd4OXug
 qvMrFgsK94xhiWjvHzGYDW9R
X-SBRS: 5.1
X-MesageID: 58793804
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wp5gtqgbWcR3rbZjif0vj/aoX1610RcKZh0ujC45NGQN5FlHY01je
 htvXT/QOfeDYWv8L94nO4u/8kME6pOHzN8yTFY/qHsxRnsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cw24Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0KqLqvexoEM5aUgeQSdARYFgB6BKhvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t1p8fRqaGO
 6L1bxJ3cwbCMg9fMWw1M5J9h+qqqmnZUQ1H/Qf9Sa0fvDGIkV0ZPKLWGMHOZtWASMFRn0CZj
 mHL5WL0BlcdLtP34SCM8m+owPTOmyz7cIsIEfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDad3wXAaxpnKeiTcaV8BNCO0x6AyLya387h6QAy4PSTspQN47sM47QxQ62
 1nPmMnmbRRlvaeJU3ub+vGRpCmrJCkOBWYYYGkPSg5t3jX4iNht1FSVFI8lSfPryI2ucd3t/
 9yUhG8joaohkOMG7P2i/V/gnjKph5zwSydgs207QVmZxg9+YYekYamh5l7a8etMIe6lc7WRg
 JQXs5PAtb5TVPlhgATIGbxQR+/xu55pJRWF2QY3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25TI5h6pUQDPY68PhwxUjaoSsIoHONg1Ho2DXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgnj6MFMqjkE79iOb2iJuppVEtagLmggcRt/vsneko2
 4wHa5viJ+t3CbWWjtbrHX47cglRcClT6WHeoM1LbO+TSjeK60l6Y8I9NYgJItQ/94wMz7+g1
 ijkBidwlQqu7VWaeF7iQi0yN9vSsWNX8CtT0doEZg3zhRDOoO+Hsc8iSnfAVeB8qbE4kqIsF
 5HouayoW5xyd9gOwBxEBbHVp41+bhW7wwWIOiuuej8keJB8AQfO/7fZksHHrUHi1wK76pkzp
 aOOzATeTcZRTghuFp+OOvmu00mwrT4Wn+crBxnEJdxaeUPN9ol2KnOu0q9rcp9UcRiTlCGH0
 wu2AAsDobWfqYEC79SU17uPqJ2kErUiExMCTXXb97u/KQLT4nGnnd1bSO+NcD2EDDH09ayua
 P971fb5NPFbzl9Gv5AlS+RgzL4k5suprLhfl1w2EHLOZlWtK7VhPnjZgpUf6vwTnudU4FLkV
 FiO999WPaSyFPnkSFNBdhA4aumj1O0PnmWA5/oCP0intjR8+6CKUBsOMkDU2jBdNrZ8LKgs3
 fwl5JwN8wW6hxcnboSGgyRT+zjeJ3AMSfx65JQTAYutgQs30FBSJ5fbD3ausp2IbtxNNGgsI
 yOV2/We1+gNmBKafiphD2XJ0MpcmY8K6UJDw1I1LliUnsbI260s1xpL/DVrFglYw32rCQ6o1
 rSH46GtGZizwg==
IronPort-HdrOrdr: A9a23:Wc1SIqAGITTkE0vlHeg2sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHK9JfjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 3+CNUbqFh5dL5gUUtMPpZzfSKJMB25ffvtChPbHb21LtBNB5ryw6SHlIndotvaPqA18A==
X-IronPort-AV: E=Sophos;i="5.87,202,1631592000"; 
   d="scan'208";a="58793804"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+PO9Pi4+Utu0++DEDXL5Aa0ApNGgbmIqQwVDE4b6H4cUaq/zgWtXVy1H5K/KUqSOIbNg3dzvOrntO4t1qa8aaUMQc12E/b9bBZYbFKyf5zX458BJw1eNPDx4WU50WYkjg/OWMLxxVgNUHJX2QRHVdpGzmewNAN81DHp71B2KJP/6hh3XJuq/kg4KgwBjr0MthA7eVp3oEb5Z3ueyUBkTtLuvrMXyMzEhyHxv7Mfmrhmji8T8drvC+9p6hPLtJAta16KCTu+jb0q4zL9OxJY0Tofy6hp99BtRNfE0H9VFHR2II6TnhndsTfCobXJz96VQZSXTPNXu5l4cfRwLWAc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3AnRFwkrlq0U9ks2qadyGRXD36GeyiCQyvDp6bHxig=;
 b=Y7IFDRKB/YWBXOw/GcHyqxchiNBvLSWHEwkDZCKlZZRf36SvqJAWHr+2QKMX/yVdHh/q3JR66EGXuK0ll53WkgxI1EAUIbnnmANO593KI2auMWvTs2/+eWXCnPAHZdHpYKQZDV83RXH1nbs9Sa4yRQ6D2cyN8YXkl0jzlFzfo+0cBSum+42lOTBG50279g6Cbth46dBCjVoAMG3ue/tNUj6UjbpoiLHm+TbcE/48P+KMR2t/ixSJoE0D1Q9/eT4bOqXGsiYX7KZOb3E6XI7xYuIyPytv7ioWAW/y0gw+w8ZB+p7SmIWOqU5TrX80OtAEryqDb72/HpqYhK9959Fdww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3AnRFwkrlq0U9ks2qadyGRXD36GeyiCQyvDp6bHxig=;
 b=Hkt3SEGhJicV0t7hmVrSZ1N6TaQKLsJZrjE/0Kp5ndmB2Jjb/vtFqUBEQTOS13xkIwQj2KaGZhuM2Z2msTuQPjbx0Q9yrC4K4bF5i2Tpm7P1XO5kekV9baI1yfj8dM7AMt2WgmAEUpEU2cuE2QfZWmeysVDyBOico0l80Mn4yiw=
Date: Tue, 2 Nov 2021 10:32:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Rahul Singh <rahul.singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Message-ID: <YYEFk2WrT/bM+uQp@Air-de-Roger>
References: <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <YXqnS7iZUvokJby6@Air-de-Roger>
 <3206478e-f230-cd91-5de9-85ef6c251405@epam.com>
 <YXrJyLMiMxaNmFAs@Air-de-Roger>
 <5de6c2f1-ef5c-9d8c-4287-9b0e3ff08b34@epam.com>
 <YXuj4frtHIRuSgOO@Air-de-Roger>
 <0ba7aa82-40bc-c0d3-38a2-8c4d141d0afd@epam.com>
 <YYD7VmDGKJRkid4a@Air-de-Roger>
 <adb55c2f-220f-c660-e86b-13868568cbf0@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adb55c2f-220f-c660-e86b-13868568cbf0@epam.com>
X-ClientProxiedBy: MR2P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ee1e5b4-4184-489c-f4bd-08d99de3a393
X-MS-TrafficTypeDiagnostic: DM6PR03MB5354:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5354CAEFA6E3C7BB4211A90C8F8B9@DM6PR03MB5354.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TgJpvYcJwZdMhVrJkAdR2HnOnvSdm9zEfQ+hnt5iS9uz1/fdqvympaCs8BsZ5SsmMPY9GjHq9050F/Ox5y7ae0r7/GFLFn40DUpnrwH6fIPLphtwbmyZJ6r9m9XNuww4GU8CNg9vJJ2uX7Pzjvc3F922k4/S3O3Sr57t2b/YIXoBdpLg1QQdAgYx+IYGUHeSC8pUBjoUSG9Mr/Fc/y7hWo9Pj7f9lCpJGmnLZs2oOtwhe0XL57vPz1Jeg/jMy+o0A8CupIf+14OVQK5dWv38TgxL8OlX6U4wjyVoaWuDRSuHFPf3aYa2tezTrfqFgtys2fu4FZ7Jd8dBOTiD2k0IAcdl6LJCXRkXb1kRP49hFHnUoRhnpXyJJbrvfjdGSaOv33SAtnXpxFtWafppmja4TUcwhP922YowdBGKMFbPXXCP3CdKlYPvv3zbs8Yrrj0tkgum9cix9FV1WYE2Bm9DosDaMcYOFdRNExccta0LBnh9GXKmxUcq+BJQmOHBj4dH0tyTPB2pf2udk3+88ayxPcGcMwdeuzzllf4yik3yfHIt1iNLItDn29/e2PDv1cZyeS07GMoaV39M+yQTswr0xtKTvuxLt2HDzSr2YGSUEDUs1BsFUd5inNXsLYTgPF0VCNxcHYzqJUxUaeaRhwwiaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(956004)(38100700002)(66556008)(66476007)(53546011)(66946007)(85182001)(2906002)(26005)(82960400001)(83380400001)(186003)(33716001)(6666004)(508600001)(6916009)(54906003)(8676002)(9686003)(86362001)(4326008)(6486002)(8936002)(6496006)(5660300002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z082UVBIUDNOOFJqVUkyc0pENHhWY2RqeVdKbEVaalYrdDVwZGxwYmFUL2Y5?=
 =?utf-8?B?U21hWjRqajZvTDY2bCthMkxKck05ZzNuQzBEVUdOQkZ0QmJNVUlFTU5VTlRM?=
 =?utf-8?B?VnNoOWhiN2xsUVVzNFJ5cEYwZ0NGUnFyaVRYRGRhNWV5cWVXQWk0dWlMam9G?=
 =?utf-8?B?Titic2FZR1VLUmhIeXd1NDBscmd6WVFRckJuZFdRclp4QzFSR1Fld0pJaEUx?=
 =?utf-8?B?MjlWdkFuUzQwQnNSWnkvS2RSb1RrYTUvQnQva3hrWlp2VnpsY0FOTWRCNVdo?=
 =?utf-8?B?WTVnMHl3M0RabFJQRGlsTUZUZ1hoTWJVdXhPVXdXMHNpL0gxQk9Zb0VSVDJj?=
 =?utf-8?B?NFM4UncrUjczK3Zkb01Kd2pob3BNMDhMVkRZZTQzV0xNM3gyNWRJVWRXMzUw?=
 =?utf-8?B?QmR1blJHeXhSODJoSVpCdUthQlR0M3A3elM2TjJucDZ4S3Z3MmRsdnlHSjhU?=
 =?utf-8?B?YnlRZHptdVNNamNSRHZudGNFUmx5cThzMGlsZUt0ZzZmYmVTS3JuNFRuMGpx?=
 =?utf-8?B?ZFBCc3owU1hsVktHcUZKT3JlRVlvWEhzN1BhSWkrWkt2aUp5ZVhkYTFJMWw4?=
 =?utf-8?B?OWRGZzFLbmJsZFRIT2k3Y0QrVXZYRkw5MXkwSFJFM1Rpb0FldnRyV2VhUzNE?=
 =?utf-8?B?QUNIbUx4b09MYVYxQ3l1ZW0rWEVGZVIyNHFuc3hIRFlTempBcERpaXVKcHR4?=
 =?utf-8?B?Z1J2QlVrTldTaWlwdTB3Ym1Wc09ZYW9EcVdHYjM3OGFmUWtYejl4SVRsdUd0?=
 =?utf-8?B?QXlIUFFyUG83TElZRTNnK2RIQkRySmJnQmZPOVIvNG45T09yTHltb1JRcHd4?=
 =?utf-8?B?engydW5GWkVZcVpROFZ5UWFkbUVncGZSQzdUMEM5VExSTkxFVVI1L1JFVjJL?=
 =?utf-8?B?V0JVbStjbjV1WktCMXdzSE1lN2xDMjF2NjJoL0RDTlZWQStWZnhsYnROSlBC?=
 =?utf-8?B?NXVaTUV6Z29oaDFpNGllcUlwa25Za3A3b09PWHR6V0JOQ0ZQOVV5blphNENL?=
 =?utf-8?B?OXVtUkJqS3NYQk9WTmpyZHB1UWVDa0EyeUUyS21nc1Uyb0ZDRVUxQmJ0bGpm?=
 =?utf-8?B?V2I4UjlwbDRrT1Q2Tmo5ei9mOU91UXpQK0tJMTZkUUN3ajlWZGo2bWRJVDA1?=
 =?utf-8?B?YitnRXNoSExFUFBJQTNyZDEzMmgzYWJEbytpVGdWV3piZEtNdmkydXFjSlBq?=
 =?utf-8?B?dEdETkFndzBxLzNtbFlKdVdoMnJSZ2tDd015cmJQZFAyTDhaUHF1Nk1zRlE5?=
 =?utf-8?B?N2ZqeEdCUVpya2dGRjZzZEwzR0dXK2IwNlV3MGFST0RsSjVhSm5CcWJVRFRu?=
 =?utf-8?B?R1YwK1Q0dWM5Z3JQKzQ4WnVmR2xFQnV2NXZTS3NEMWU5UHFWUXZUT0tET2Fy?=
 =?utf-8?B?cFZTdjB1TUdJczcvZk82NC9IMnlmd0ZIa2VodTRBa0xoUnQwaG9UL0xGOFhv?=
 =?utf-8?B?b1BqZUhSaUczSWlieFdvTnVxOVRUS3RBM0Y3TVhHOVgyT2ZERElFZzJpaGFB?=
 =?utf-8?B?MEQycm1rb1p0S1Y1dzhoSTJXZHVhUk10Ym0ydGpSdjU5MXlSdnVoRmtESGU5?=
 =?utf-8?B?dmJJa1VtWmFpV1BzRm53d2V1TXpiNTg2M0tvZEVFK0liaHpic1BWaGVteTBq?=
 =?utf-8?B?andoZzQ4d2hRRnB0SXM3SUdxbXhZYzFiQU8rYmgxMHhPZ3Brbzl3UmV0Y3d1?=
 =?utf-8?B?OC84bUJ2QVhqL0hiV1NUblZLYTFpditjdk91YklzS01na0RZcXFzdytwMzE1?=
 =?utf-8?B?QTRBZ1BsNGMrdGhRZzY3a2dUYjk5Y1NGUVlBb2lTSEwxWUhSRElmYmpMMElx?=
 =?utf-8?B?NjFnSTVWQXNlN0JwSUJ6NzR6NnoyaDhZa3JrSmlpSFFSbkFMbU03TUZhZ1o3?=
 =?utf-8?B?ZmtDNmszM0RlVEFrMXkrM3JidXd3RTZOQy8zYlJWM1BvWFo1OEtqVVdiOHIy?=
 =?utf-8?B?dXFsOU5ETjdoNTYxVngxN1RpUFU2YjNsdnRXQkI3YmVnQk5PdjQ3VGJwbUg5?=
 =?utf-8?B?Z3U1WFdYeTlselF6WGhNaUZ2Wk02WXowTG1UdkxVWExzNXVvVjNQNDVPRU9G?=
 =?utf-8?B?RlVmSU1LbXJkQWxaZ0hmMmlFcVFUamdvcFhzS2hnTmM1dHoxMCswVkh5cklw?=
 =?utf-8?B?UkRZUWs1NzRsMmVFQ2xEc2dQS1ZNM2FTNEloS2hjV001cmkrckhZMEN1Y3Nl?=
 =?utf-8?Q?qbIN9ewnwezirg1Y6G5mXxk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee1e5b4-4184-489c-f4bd-08d99de3a393
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 09:32:07.8220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvAM0kwX4XeL+KfG4JdCZyGAs8p229smIhu+QxVCAzX3hz5ZqWYJHm7A47G0e1cvmNUJa7FE/nY93LmnN1iDTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5354
X-OriginatorOrg: citrix.com

On Tue, Nov 02, 2021 at 09:07:56AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 02.11.21 10:48, Roger Pau Monné wrote:
> > On Mon, Nov 01, 2021 at 06:14:40AM +0000, Oleksandr Andrushchenko wrote:
> >>
> >> On 29.10.21 10:33, Roger Pau Monné wrote:
> >>> On Thu, Oct 28, 2021 at 05:55:25PM +0000, Oleksandr Andrushchenko wrote:
> >>>> On 28.10.21 19:03, Roger Pau Monné wrote:
> >>>>> On Thu, Oct 28, 2021 at 02:23:34PM +0000, Oleksandr Andrushchenko wrote:
> >>>>>> On 28.10.21 16:36, Roger Pau Monné wrote:
> >>>>>>> And for domUs you really need to fix vpci_{read,write} to not
> >>>>>>> passthrough accesses not explicitly handled.
> >>>>>> Do you mean that we need to validate SBDFs there?
> >>>>>> This can be tricky if we have a use-case when a PCI device being
> >>>>>> passed through if not put at 0000:00:0.0, but requested to be, for
> >>>>>> example, 0000:0d:0.0. So, we need to go over the list of virtual
> >>>>>> devices and see if SBDF the guest is trying to access is a valid SBDF.
> >>>>>> Is this what you mean?
> >>>>> No, you need to prevent accesses to registers not explicitly handled
> >>>>> by vpci. Ie: do not forward unhandled accesses to
> >>>>> vpci_{read,wrie}_hw).
> >>>> I see, so those which have no handlers are not passed to the hardware.
> >>>> I need to see how to do that
> >>> Indeed. Without fixing that passthrough to domUs is completely unsafe,
> >>> as you allow domUs full access to registers not explicitly handled by
> >>> current vPCI code.
> >> Well, my understanding is: we can let the guest access whatever
> >> registers it wants with the following exceptions:
> >> - "special" registers we already trap in vPCI, e.g. command, BARs
> >> - we must not let the guest go out of the configuration space of a
> >> specific PCI device, e.g. prevent it from accessing configuration
> >> spaces of other devices.
> >> The rest accesses seem to be ok to me as we do not really want:
> >> - have handlers and emulate all possible registers
> >> - we do not want the guest to fail if it accesses a valid register which
> >> we do not emulate.
> > IMO that's not good from a security PoV. Xen needs to be sure that
> > every registers a guest accesses is not going to cause the system to
> > malfunction, so Xen needs to keep a list of the registers it's safe
> > for a guest to access.
> >
> > For example we should only expose the PCI capabilities that we know
> > are safe for a guest to use, ie: MSI and MSI-X initially. The rest of
> > the capabilities should be blocked from guest access, unless we audit
> > them and declare safe for a guest to access.
> >
> > As a reference you might want to look at the approach currently used
> > by QEMU in order to do PCI passthrough. A very limited set of PCI
> > capabilities known to be safe for untrusted access are exposed to the
> > guest, and registers need to be explicitly handled or else access is
> > rejected. We need a fairly similar model in vPCI or else none of this
> > will be safe for unprivileged access.
> I do agree with this. But at the moment we only emulate some of them,
> so in the future we will need revisiting the emulation and put many
> more registers under Xen's control

Indeed. That's my main point - there's still a lot of work to do
internally in vPCI in order to be safe for unprivileged guests to
use.

Thanks, Roger.

