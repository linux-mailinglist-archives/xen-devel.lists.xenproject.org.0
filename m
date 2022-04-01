Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A338D4EF093
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297442.506711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIPG-0005gH-Uk; Fri, 01 Apr 2022 14:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297442.506711; Fri, 01 Apr 2022 14:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIPG-0005do-QS; Fri, 01 Apr 2022 14:37:42 +0000
Received: by outflank-mailman (input) for mailman id 297442;
 Fri, 01 Apr 2022 14:37:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dc+m=UL=citrix.com=prvs=083d63866=roger.pau@srs-se1.protection.inumbo.net>)
 id 1naIPF-0005di-6A
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:37:41 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4674ec30-b1c9-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 16:37:39 +0200 (CEST)
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
X-Inumbo-ID: 4674ec30-b1c9-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648823859;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=SBM3jReMSp0MTOSrb5YlZ9UJt9sCxFzYbrvxT8/ggqw=;
  b=eiKLZtdnOKneJ3vjC1jR9NSiIQrkMrSMRFAzIWDIKSlFZ3J0iSDg15LH
   yKFuiRwdtLCGjFI66R6Ffr2qV3S56vhZPw3TO98XdGsY+fQoa1J3w+BjL
   vB3tIN1Xwi3VtswBVBygaG/IepKke7I4ycU2F3xTyqHdmSodDYCJMiRl5
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70164522
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZZ97BakRZlYc+zMvskYiZS3o5gy+JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcXWiPO/vbamr1c40kbIq//UgBv8Lcz4dhHFNlpX82ECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW1rV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYVSY2GoeXoOAkWhB5GGZsJ5V/07rgGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQq6HO
 ZZEM2AHgBLoXhNuPHI7Lb0CgMzro3XEcw1Imle5nP9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyL8eDwDCI9natgO7nni7hXo8WUrqi+ZZCglee22gSAx0+TkagrL+yjUvWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS9wWl2qfSpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9VVOC0p3PlTeLMCE0JigQfxc9Zg4i2oy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxlkhDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGCE6bKMN8N4n9hIx5JFVdoPiN2ZDB01WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMooRP8IrLF7WoXwGiausM4bFyhdEfUYXY
 8rzTCpRJSxCVfQPIMSeGY/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9zbmQp
 CjnCh4FkDISRxTvcG23V5yqU5u2Nb5XpnMnJy08e1Gu3nkoe4G066kDMZAweNEaGCZLl5aYk
 9Ftlx28P8ly
IronPort-HdrOrdr: A9a23:hNxBx6O+zWTsusBcTzf155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoX5PwO080lKQFmrX5WI3NYOCIghrPEGgP1/qB/9SCIVyAygc+79
 YYT0EWMrSZZjIb/KXHCWGDYqodKbK8gceVbInlvhJQpVYAUdAc0+41MHfsLmRGAC19QbYpHp
 uV4cRK4xKmZHQsd8y+Ql0IRfLKqdHnnI/vJUduPW9u1CC+yReTrJLqGRmR2RkTFxtJ3LcZ6G
 DA1yj0/L+qvf2XwgLVk0XT85NVst38zcYrPr3EtuElbhHXziq4boVoXLOP+BgzveGU8V4v1O
 LBph8xVv4Dnk/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBrZgxSGqV12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsZl/IJhXA3a/pVVFZol/1RwKppKuZPIMqjg7pXUd
 WGTfusr8q+SGnqI0ww5QJUsZyRtndaJGb1fqFNgL3X79FspgEJ86Ip/r1gop4+zuNMd3A93Z
 W9Dk1JrsA7ciZEV9MLOA8+KfHHeVAlByi8cl6vHQ==
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="scan'208";a="70164522"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaYNmnCu4pSbJdM62yI4HnbVe6YCskTvqPBGy9PrDwBR4+DmKTTbwBojmfjFVr6MQ7BAcDZ3+pL1+QRhm9cp9DIX+KppMh3UMav4NsASvvi5c22ad3usbfVKreBpv0bRGIzoOThKHXhCip2MLhdUgXAbolWSGo7MD9Amgr0tQdDqFvJlvkucD78stJT7FiZg0DV7itnB885cl2V47dafBc0Cp/XZrtyE5uGMKbMZfVBMMKdgGUOZ8uX/p4rxS/Zv4UkCciHe/5Mp16RaLJCHEMb0mJbcRx67BxmUg1v3sqPpCGMOP49Q+ShuZXOCRaFS7i3U4qswr9HMq6Bi/Hq97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8SoxtM7TVWy0iuy4I2h1zyL+9dHRA10iClwSi6jFxo=;
 b=RU4Ej5wm65f8XGeonNN6JJ5mYPBgXpWOiB8retcFGEDsch3/XtO7DFHbzXd0wsF3cmu9MrX73YBXYW5npN7CCiDG1teJPJLN3Xt/HNN+5+yiwzwq0mGc4KRA9F3MK4PgRdkYLJojnORRlwyiel7k1q01ltBLe62d9qyfMvYNip3SgnlZhimbukrdMBxBOZraLe7pbqG9PkIu2JL8funfmhXdDKt06604iTjypjpObs08M9MycA0okKvFNkPSZf+qTnIBc3Aj4mDEptEtNOa+567ssr+INok0grclMUTirzRHescs7rBIDepqlM1iT8h/o2aWlVz8EUf0G6wRNC2dRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8SoxtM7TVWy0iuy4I2h1zyL+9dHRA10iClwSi6jFxo=;
 b=tsIu/LTWO0bq5t1aQWsEbzLTnRw5JwFjPz44CO3FPbWniRXikE678KCeX6Mm+7wEuh+9a3SSBiuTRPlruwsg6e6/nDgh0nNHHVFNu1+ap0LfJbUqAT+zAmqlpa2l4m3BBGpxG8pLyhVBZrjiLmGNE/o9df8xFJfqYeU0cxH64XM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] firmware: build fixes with gcc-11
Date: Fri,  1 Apr 2022 16:37:17 +0200
Message-ID: <20220401143720.23160-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6382def-dc38-4512-e8fa-08da13ed2900
X-MS-TrafficTypeDiagnostic: SA2PR03MB5801:EE_
X-Microsoft-Antispam-PRVS: <SA2PR03MB5801017AC9614151793460018FE09@SA2PR03MB5801.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nWTXz5QGPXraiZdj9TG6aQC1nNK+AV9x9P0BNY4Zm0KURowBk973/aX3Jrz30ALqgD+dAOBaatDXyAgA0zaNbcmQknQOI8pcOufffNPu/rq8PCqJMedYf/rNXVgtFeVDF+Fr69F/hoFRV37flaZVBCmQrzrY/IhQ+bCEeZBMV8XsOL3EVmBnMpsBWFKWUG+QxQ0rKX0ZMM501Qd+MldcWo7c3u5GKp49k7vwQuR8JKdCLKJ08x/6dTnueAzCndBl6J8ciOppRokF/2SD773n4EH8Qp9c8Qd0ZI/OOhHgZdAApHGOT9xRRURxBjhjuk9UHkaSXj8riZNr8LLTQujEZiT7osoOj8L+rKLnL0MyBMRJX9X5diymNUakXXGj9ZeVT2ggk8wwVfHDgxVP9Uw0e7YA0lKj7Sk+hpDZDTgHN0LWPTM90yzXRcctRok/4KkDBUhKO/xLAkRZtx/BdqBuSjYeB0+FTRg7HEzwJphU7rOd1s0e0JH4Gd0vhFHW8eb+kzgjnHp7ATnesZXRLPJjdGtxf0TM6Ixp81V/VqKVtJUSTdxE7CB1SQJSE7SVG7WX5WjncSrKcICmJrP93uS3yIEu8by/tmnU2tRm83bC+6L4Aj6Kd+79MfJMJ6yyyD42k83uEpxpDMoW4rZoXQwsZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(66476007)(66556008)(36756003)(8936002)(4744005)(6916009)(2906002)(66946007)(316002)(54906003)(508600001)(6486002)(6512007)(6506007)(6666004)(8676002)(4326008)(82960400001)(186003)(38100700002)(83380400001)(26005)(2616005)(1076003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFgzZHptMU1Jak5weWFld0p0OHZWYUZ2MzZaNE8xUnpvamtycXl5RzhBWGRo?=
 =?utf-8?B?MkNnR2ZRVHJQcURjbE01dThyVEdMVGZGQkdqUE5tZ3ltY2laTkZVK3FNdk50?=
 =?utf-8?B?RzVYczdYQ1gxNHBENzEvNUZrQmprdWlUcDBTWGhBOXRMTUM3bzJGcW16eDVv?=
 =?utf-8?B?M2x3V0RiTVlRV2NDL0RUTDlzSnBwSFZQTGd4N2UwNDR2bWVmNlh4YkJESlEv?=
 =?utf-8?B?MW9hNlhZakRDeWdaV2tOczZxbVVIM3lwaEltRmpGc244MnR3czcwVUFrZjZ3?=
 =?utf-8?B?M1RJVjhmWUZRaU5Ec0ozMWtacWZRTi9VcjEvMnFoTDlTUTZsSE1HNHJHNUFn?=
 =?utf-8?B?UmcvY2FVM1hTMGlHaEdIdEE1VWtSeGNLNjlZUDhGWDFLb0pFWDJ2MWttQjd1?=
 =?utf-8?B?Zi9uckFQaGhKNm9RdmY4Z3U3TTJ1Q0hrcnN1dm9wTy9tSE5wejZsMjYwSDVN?=
 =?utf-8?B?emhpd1k5TGthbHJ2RHhRTUg3dzNGWW5tZ3ZiYktZeVJkeWhNcjNYV2xhb2lh?=
 =?utf-8?B?TTIvbCtDNkFhK1BGZVRtUWQ4dUZLcW9yL25jeHIybGxNTkIwK2s1dWhvQUxq?=
 =?utf-8?B?aGRkK2thVWNlMFhGMktFNFFSUzJJNFZDOWNMSGlxZDVybG9ZVmhwS0M3ckZa?=
 =?utf-8?B?MWhvaFFzaEF1bTl6d21vNE13eEJiaFFmb0dwYUc2OEk4RytycnZmQ1hvR0dr?=
 =?utf-8?B?Ym82VGJaTnFEWk5oQ1NsT1gyREs5QURHTHk2UlpTeVptOWxhZ3loM2VZTWc3?=
 =?utf-8?B?QnpoV1JCazBTSWdhOVVMeTd5c0RtUGtMRkFEWGtjK0JwQWorK1M3S2luMjRM?=
 =?utf-8?B?R002ZUJKYXZyQnBYejRIMjZjWXE5bE1ocDFjKy9UMmtHcVcyMVZhaGQ5Ry9l?=
 =?utf-8?B?QnEvUW9hc1ZyQ0RWdmowaUgyam5hbnY4eDhCelRXUEY2YWhBalZXOTVUU3Yz?=
 =?utf-8?B?allWVndISUM0RWVFWUR2Rzc2QkxtdWp1S2R6N091ZE50dzJrVWhWanUzVUlw?=
 =?utf-8?B?V1huWXg5cThMeEtqYjB5STkwcS9wa05HYUJxUm9LOWZXcUMxOVNXQnhZSGNE?=
 =?utf-8?B?ZFpTWUtmb2NoVWc5UXBBUC85WGNBQS9mR0NLUlJXRzJVZ2hDYmNIY1ptajEr?=
 =?utf-8?B?bTBpTDBMWTZ2aUp2endpaWViTlh2dkFFM2NsVjY4cGl1U251cUdic04xa0V1?=
 =?utf-8?B?SnJoRFYyUEF5eGdmTmxxSzZ0VVlVS0pSNmNjdFZWN3F6cTJwUE1xYmZNQUFa?=
 =?utf-8?B?aVl6YUZlVHhsWFVoaDlHYVN5ckNxWGp2OGZ3Z1BnWS8yaEpENFlHRWh6NlFv?=
 =?utf-8?B?ZnpnbkNIcFl5QkEwNE1tbGVWQmJGOWR3cDhib3NzMjl5TVJybTljaFhYQUR5?=
 =?utf-8?B?ZCtjUlczS2hwQWxxb2hzWlRBTzkwK0xnRTBFYmJVbkhlUU1ULzlyWkJQVjZU?=
 =?utf-8?B?bmtaMHg3b00xcEZxOXpnTUhDanNCUXVQVXRCdGVDeWZZenVxbDNoZkltQjNi?=
 =?utf-8?B?OGFqMXIwMFArQ01ZbG1ETDQvVnhLOUQ2UGIrbDJYVGhZOFFTSWVpZjlNYmRW?=
 =?utf-8?B?ZnFxcWM1M1doNlp4Q2kzOVNuMlZvUUgvR2ZVSDVNVng4RmE3T3hzcnd1ZmZZ?=
 =?utf-8?B?d0lDVjZyek1BbGY5czJuU1BkK1JjS1FXOGR1Vko2ZlprU3RMdzJ2WU1Ib2V3?=
 =?utf-8?B?eFJTNkJ0OUhEVjNUbHlrN2o3M1V5Z3FReUhzaE1HTjNodENDYnZxSWRNWk94?=
 =?utf-8?B?ZlU4eWorcVJJMGU0d2lDYTBTdG9BRXVvZkZiY1NWNVhHMEVsckRIQ3FuOWxl?=
 =?utf-8?B?c25ZUGVwYThwWHVmbEptb3FxSHlaM0lNL2ZGTGFtQWdOeGxQdUpyVUpveEta?=
 =?utf-8?B?Ymc2L0UvQUZZQTZkRldTTzFacDcyWFphbTQyS1pYWU1CdlJub2gyeHFlSXpN?=
 =?utf-8?B?WWF5bDRNd1J3Ymh3VzllOGpOT0Q0M1htdmVTNC9lR0hjQkRsRUdrbUt2MjRs?=
 =?utf-8?B?cGhjNXk5NWNGd1FFVXNUV1RraklYdHg3MTllRmRKUEFoYzcreUpQOGV4a3pt?=
 =?utf-8?B?N1JlK0duZ29XQlI1MlpuOThmajhRY21wT1M1Sy80bWt3cmlvemVMYm83WUJh?=
 =?utf-8?B?YU1NVGRHYUYwUmYrTEgxZUgxUUxDWlNjMWRORUI1Unk3QU95YTljVTErL2Vy?=
 =?utf-8?B?QkRFd3FLWE8rTnMxSmZtc0hmZ2VLYnlKRXBoc3FPTnR4K2dBQzZYZUhMYmY1?=
 =?utf-8?B?ckhXU2lFL0JBY3gzMEEwNEtSaHRnMjJPbGZldkFhaHR0ZGJVcERnZWVGMnRV?=
 =?utf-8?B?QldvV2hCQzhCYk11ZnBWajFhZkdhWVp0TVppS29HVHEzeWM4T0kxUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6382def-dc38-4512-e8fa-08da13ed2900
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 14:37:34.3542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEO3APC113Ebq4XSL85NcFFBhvBFxlMw+c7xclGEcxaDXoiDaOI3c/hJUhWQtM74QZihNWp7WvzE8Cl2ycP4CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5801
X-OriginatorOrg: citrix.com

Hello,

The following fixes some firmware build issues with gcc-11. Note that
dropping of .note.gnu.property section could likely be done in the
linker script in the hvmloader case, but rombios has no linker script
and such note is causing a non-working image. Other options could be
using objcopy to drop the section, but those seems more complicated than
just using the compiler command line option.

Thanks, Roger.

Roger Pau Monne (2):
  tools/firmware: fix setting of fcf-protection=none
  tools/firmware: do not add a .note.gnu.property section

 Config.mk               | 2 +-
 tools/firmware/Makefile | 2 --
 tools/firmware/Rules.mk | 6 ++++++
 3 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.35.1


