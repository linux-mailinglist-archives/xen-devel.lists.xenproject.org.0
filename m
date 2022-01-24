Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB5497B11
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 10:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259757.448281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvKc-0007RO-1L; Mon, 24 Jan 2022 09:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259757.448281; Mon, 24 Jan 2022 09:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBvKb-0007OT-UT; Mon, 24 Jan 2022 09:08:09 +0000
Received: by outflank-mailman (input) for mailman id 259757;
 Mon, 24 Jan 2022 09:08:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BDBv=SI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nBvKZ-0007OL-Ao
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 09:08:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22a9b5a4-7cf5-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 10:08:04 +0100 (CET)
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
X-Inumbo-ID: 22a9b5a4-7cf5-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643015284;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bSWD8WeG1WsTze/cHXxtJR8kEFkJdhZrcn+uAHXHNbY=;
  b=d3QziJe65BXUVQzW5mLfBzuJ/8Pft22UZ874F8Werw3pglyfAMYXYVub
   41eCJ/aHMqcKlLSFicginGSeeimA9PpWI7LCgkKXThGjzOl7ygjfyXcz3
   VgTcPSP+kdiASTODXDSJ0oKtIjyO906IOSIk6OPhVJTrCu0jEha4HJgiA
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HQrN6nF73DL+2fyj/1C+GFzq+F/EWk+pXT6IKiPWgdfCcPmGgSbEelQ7lTAGiYVh55vm7ZXEKz
 gqAIb23ZMt01BD3GIZUAApbebcNjE/tGtuuhpNKRMEEe1T/gID9q5FDGbCc0YwXLkcqnqyScLl
 lsk0XABijc9MHwYMkNxnQkFuXzfD8cd8Sx0O4rzgkCRE0/BmlloC32QQHDng0HtzLZLdYkQUvY
 OU3VcJ/w/3ZfH/nTlepJ5viSNJKpYi2MOEshn1kVh75HU86HgmcrSivhjuA2S+iiGbiCTmUeNd
 SLmFWPc5VvXhO9bK0Fjn4X9i
X-SBRS: 5.2
X-MesageID: 62078064
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DwMYVKKCU5h9otbtFE+RIJIlxSXFcZb7ZxGr2PjKsXjdYENS0TQOn
 2sYXTuOM66CMGfxL992aYm0pkMBvp6DzNMwQFBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5wLZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2bg4ljm
 NRK76WPEzgTNbPRuvgZaythRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Uv4cHjG9u2qiiG97Oa
 fcBQjptZyieYjQMagYqJ7M8ofWB0yyXnzpw9wvO+PtfD3Lo5BN80f7pMcf9edGQQ8hR2EGCq
 Qru523kBjkKOdrZziCKmlquj+rChmbrVYQ6GLy++eFjhFnVw2FVFR5+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxa5UgU0AoQKVbdgsUfUl/SSs13x6nU4oiBpesB/pp83QmYT6
 QW2pdj3GB5ztIWncCfInluLlg+aNS8QJG4EQCYLSwoZ/tXuyL0OYgLzosVLS/Ds0ICscd3k6
 3XT9XVl2e1P5SIe//jjpTj6bySQSo8lp+LfziHeRSqb4wxwf+ZJjKT4uAGAvZ6swGt0J2RtX
 UToeeDDtoji7rnXzURhpdnh+5nyv5643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK518LtcEIZyb7PPEuC25UNyjN5fO4fekJq9iONoYeCnSPXFHvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOTCDFbIF+ZtGAbeP4gRsfLfyC2Io
 ok3Cid/40gFOAEISnOJodd7wJFjBSVTOK0aXOQOJrfceVI3QT94YxITqJt4E7FYc21uvr6g1
 lm2W1NCyUq5gnvCKA6QbWtkZq+pVpF6xU/X9wR2Vbpx83R8M4up8okFcJ47Iesu+OB5lKYmR
 PgZYcSQRP9IT22fqTgaaJD8qq1kdQiq2l3Sb3b0PmBncs4yXRHN9//lYhDrqHsEAB2ouJZsu
 LanzA7aH8YOHlwwEMbMZfuz5FqtpnxByvlqVk7FL4ALKkXh+YRnMQLrifozL51eIBnP3GLCh
 Q2XHQ0Zta/GpIpsqIvFgqWNroGIFepiHxUFQzmHvOjubSSDpzit245NVuqMbAvxbmKs9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy7IF6wu7X
 kWDpotTNbmTYZ63FVcQIEwub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4YNE/3
 OMsmM8K8Aju2BMlP+GPgj1Q62nRfGcLVL8qt81CDYLm4ubxJoquvXAI5vfK3ayy
IronPort-HdrOrdr: A9a23:WzGKJqAt0UsnTwXlHeg0sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jIsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6t2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCmlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0hjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXX9
 WGNPuspMq+TGnqLEww5gJUsZ6RtzUIb1u7q3E5y42oO2M8pgE986MarPZv6UvouqhND6Ws3N
 60QZiAoos+OvP+XZgNdNvpfvHHeFAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.88,311,1635220800"; 
   d="scan'208";a="62078064"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+FeIEbu/aKqfGbuO8G1CIZ60hprtukkN/gfy89Qsu8chOaAjfi7l+FqqKeFHw4B2IT2v1yJJu7yRMzsME1mxL58R7te/Wvz5kgJ1UDGwLS7k5uzA9xaX1EuIbEWxt5xm04yaCc2CBr0PJwTnz/GuMeJazy/a3s1+1T7LJDzPTE+pyJf6jWPO0P6O+0CcJgBRJNWTUkFtvuzGxnpz5PTAEWfMjw4YNaWy5YQiCUOslY0338GJHnVjFnD4ZxPlvmG2VbkNFSBJTTDx1f0izanWHcCECMlopHnq3m7N3SIH8tFTRYKmXvErKFwfwvG8H42SnqDIOi8gtb9Tq9xKRNl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNY/xXNXSDtzoPZoLxHjW+QfDUDiK3LrM+FRUyUkGKo=;
 b=VXPBWOwzXW+xr4HymngWbQsH/io5MEeURJgCIuBg3Zoy6DMiUSQNj9hiXepK27Nz8gNpvdSjhuqnj0pAzDJGExa/zA/bokz754HRdI1TFU0c6stAdEDamvrn2tTIGSsJ4vQSmwqvMYa0xQLocrazi2lFURba4higkyWDPvn4HOU0VFtJUs3javEpDR6naNhSNQE/aj18HFLH37NduOpqyXvOXZqQ42dbMKMv77R32057y24mDmkamc3pIH8i7y8Wl4G/F/kd7rlj7rhH09a2I2ve+ElX0ICsIClJA3Ku+xoGc/WJKws/dFNxlbJnzyzBiIEyye7t+CnEfb2u23sY1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNY/xXNXSDtzoPZoLxHjW+QfDUDiK3LrM+FRUyUkGKo=;
 b=XokwtqUnwzDZ2zlYWMyyOENQwbV4ZbTATtvU1/Dt8JR5sAXfc+bLm9jzeqet4AHzTcQJ7xzy34tG3QX84lrcO95TPvXTWqrbxFAMO1jzczpdrY2hkMbXx94K2kpfQTHqcNkkWdkkAoQoQ8GJ4IifwKkAmoGMn1QTP5eMBnatl08=
Date: Mon, 24 Jan 2022 10:07:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: James Dingwall <james-xen@dingwall.me.uk>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu@kernel.org>, Paul
 Durrant <paul@xen.org>
Subject: Re: possible kernel/libxl race with xl network-attach
Message-ID: <Ye5sarMTn23g6eGi@Air-de-Roger>
References: <20220113111946.GA4133739@dingwall.me.uk>
 <YeBPG+8D00xG4h0j@Air-de-Roger>
 <1671ad485c35fb86d758951889cfa05d@dingwall.me.uk>
 <Yeq8fdOWLngcjDH8@Air-de-Roger> <20220121150507.GA954743@dingwall.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220121150507.GA954743@dingwall.me.uk>
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bf33a24-0298-4bd7-bbb5-08d9df19045d
X-MS-TrafficTypeDiagnostic: CO1PR03MB5682:EE_
X-Microsoft-Antispam-PRVS: <CO1PR03MB56824A098043402F9600411C8F5E9@CO1PR03MB5682.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xxUp62kxMWQjB2pxQuNcM+hyTGQotxr/0XXl++tiE5wBHdYvki7ovKjC/aBNYGUe8idXhq9vfkfiFIxqi8wl/WPwQO/eDsn//cwJijr2pcRx8skDQl1o/6bR5rpkENs1gSI0TcqtVbA1cLLGPuEVlKRYK388/6E8quu0B7VQCJy4T22kBv5ORQ5ALYScsEKedDSHrivWO3yE3HLbIi1Wa9KYFWt9l0aug/+2N9PW35X4+ejZtEV4pLWhQ4CVtQapwiDlDN1ySwY95V5z1xuQko+xuCyeedG3P6BIJ+LoPi710M2gjzXh5inTvx8828xbvfwB8HN0UberOtiBlqROx0cTkt+DDMKIEZe4pwlB1p9MCWiE9xlAvv+CEaRgFZdBZmiE2iXH2VV0dzpLkLEDpvx1Hl8uxW0phMw+mlVaHfkcmTL+G8ES0BgyMChu2j7osHlAduQ8gB/IBS+5E4nZuW0sxRjpl01ZuCZMS+dUpdysUf9ASiXHygQ9WdtUmCsa3FCtmeHdBhYrqMc8ICVVIhi6zdcBboloIRBWOaQebQWeSujRgDcAeLXywL6pcI0vvtEkmLj5vp1YwXo5Pm2X4WM5znYHrOfWEbcmdgyvoDft/WBVLbHg0swdmsB6zmIX54YHZ3FL4q6FAaOQRKGRMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66946007)(6916009)(85182001)(66556008)(6486002)(2906002)(186003)(33716001)(6512007)(9686003)(5660300002)(8936002)(82960400001)(38100700002)(86362001)(83380400001)(54906003)(508600001)(6506007)(8676002)(26005)(4326008)(6666004)(53546011)(66476007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU1JcVhMUnB1R0xXdmY5bGE0dmkxTUp2TUlWd3o2UDlPU0lkeEdITTAzTnRV?=
 =?utf-8?B?bFJpbUZqVVRHVHl1MDFpbGV0aHd4NGQ2K1FrZkZOL2tocm8vK2FsVUw3Tmls?=
 =?utf-8?B?YkJKL1RBdjlOSmZ1ZEY0cUFabVFQeW9KUDdlblRueWNjR0FEZE01ek1VdW82?=
 =?utf-8?B?SGkzNWNTSGZsRW1odDR0S2tGUldYTXBlcDN6NTJ2L3lpaU9WNHdaNDRyMkF3?=
 =?utf-8?B?VXdjU2ZLRThuY2YvSkViNEI5R0hhZTZKcDZXMm5DOHlnQTZaRHVFcmZHc1V6?=
 =?utf-8?B?VUx6aS9HSHJSUFVtdU4rNjRaWkdvWFZJSnZmTDUwb2ljd1RwZ2FzUlltNE02?=
 =?utf-8?B?N3YzR0tSVStHRlFoNnpOTER1ZUFSajhOSnlKbDVWa1kyREZyT3BiY1pFSk1K?=
 =?utf-8?B?cXBNV0NxWm9iaGxUL2VrV2g5ajZUTHJqdWpiVTFncDNpdUpnVGNuVzdIS2NV?=
 =?utf-8?B?Zi9tMkpJcnV2b1cyOHR1Q0FEb1hhRnlERkYxdW5iUkFSdGliQk5ZYllJUVZN?=
 =?utf-8?B?UFB3dXNrZmZ6QjNqelVNMVhyeWl2R1lORzZrQlJScVdHd1Zhb3c3Y0FPb1ZQ?=
 =?utf-8?B?Sk9oVk02OFdtVGJYd09ENHpiTEh5MEFobWRtcUhVNkZBNUpZY2xMQmFYeTI4?=
 =?utf-8?B?MWdGYWFWWXdlc3JNMzQ3bGMrZlhCK1F3R1llaysyOHpHbE5PWFZ2OGE5RFZu?=
 =?utf-8?B?RDZiVlEwYWYwM00yM1V0NlIydXM5MDZpYXI2VXlYdXpmc1ZWTU9SUFRZVnFV?=
 =?utf-8?B?ZFpzTFZyaTVZT3JlMHhWM2lMKzNLaTJ6MTcvRmhFTU4xT2ZHSmhMUVJYbDNS?=
 =?utf-8?B?UTZGSVlCVzN4QzlCcXN1Mm95TCtnK2p1L0NsS1k2RjBUdHVUZ1V4UTA1L0ds?=
 =?utf-8?B?L0ZMcWc1aTJ1c2htQTEyOVZRdE9FNUx4YlJEaVBlUmxpTGNhcEI1OXY5cFhB?=
 =?utf-8?B?dHI2OWs0dHVPSDJibTVldFlYMGtYOGJIWnZkUFBzNnJZUDNSejZnUE1XNVY2?=
 =?utf-8?B?cmZ3UkpzTGljMWtJbmVKdGMyaVhaOTJOOWNpRlN1UE5iTEc1d29OS1pTN1dP?=
 =?utf-8?B?L0lQUEFrekhPTlZaQ2RmUXEwVjFMN2FGODQ3d0swYytUWmdCZ25MazhvdE5p?=
 =?utf-8?B?eGFwMVY0eWJOSGRVNDBjSHJOSG9ONzRoSWdjc2haWDJWWHRQT2dHNU1mZ0Fl?=
 =?utf-8?B?QXNOOURBdCt4TzJoRDVHYTcwWDhCS3c3dWhhRnI0aXppaGVzYkQyNzVGbTgy?=
 =?utf-8?B?NUQyMWFreXJZNXFpTnJXdHZsRjZHL0xydUt6MUZjTU1ZSWR0bXc4UklmbnZX?=
 =?utf-8?B?REcrcVFQazVqV21LdHB4cm9kb0N5SEI1a3hZdjk3T2NaeXprRHNwdHRZR2JY?=
 =?utf-8?B?MWdQQkpIeGNhU1VpU3pnVCtGN0pXbDBBeVpyNkw5MmN5QnJabzIwdFFLWXdK?=
 =?utf-8?B?TzB1eXBqZmNINS9LbUU5L3ozRXpOa0xCS2t5ZkwrMXNLaS9PSXVxZnZnNWxv?=
 =?utf-8?B?Z1JsQit5N3N5M2RJbXNOb28yRE5pbFQwYXBjMUN0bGRUSHRNOGdqbDFrdmRh?=
 =?utf-8?B?TXhNeXZ2VGNCOVNMQys5S2JpN1VvdFl5VWVURlZjdmlPc1JyaENrS1ZWZkJw?=
 =?utf-8?B?UFNyenlGeVBham05Z1BZWWFTZXVzVjBqMExzK2pvNTFRRVI1VFlmTTdSSmVw?=
 =?utf-8?B?VVBCQStNay9iaEpBMENWODRJOENxSnJSZ1FiNkxwdWptY1EyL25DV2JJTmVr?=
 =?utf-8?B?QjRKdVVwRWxrbnBDNXh6cVlkUHlvM3ZXOHhrMHpEMFVYTXVkTTZSNEpEVXlJ?=
 =?utf-8?B?REtvWExvOUM2VGtVMURMWElVMnZDMHRDd1p1VTNJS0xRWUF4Z0pWaFdjOEJM?=
 =?utf-8?B?VVl1V0M1QXlwMjZ2RnNDNzVDUFpramdma1B3b2o4OEprbzNwdXZ5T2JRMVA5?=
 =?utf-8?B?M3VFS3NEZE11REkwVDRQcDk2MmxXNC9EOHlYRW80Y3RpUUYxYlJTa2tGUWlK?=
 =?utf-8?B?VU50amtDZkpyRkpnT3BLbk00ZXZ4V0pHK0gzdk5sbTczeXAzSHE4VDUrQ0do?=
 =?utf-8?B?WjlQaVMrT3hMUThkZEhDaC9EU2I1YUtkYlQ3dlFSdWZnOE1aQnlOd0doYXR2?=
 =?utf-8?B?VTBGOFRPRDMyK1V0WFhCZUxJQmhaSEhmMmRBZnhOcnNWMm1xSE4reDVuNEMv?=
 =?utf-8?Q?Dg3E2OxuFWFCicUWlPFPk4A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf33a24-0298-4bd7-bbb5-08d9df19045d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 09:07:59.2406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrMj92SyZB2evX9gGids4macBAMS3UmcMwBgpPsXSmKJr8K/ZsEolM26ise/6R9RpYYz/FLeNKdo+1V/0c0BCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5682
X-OriginatorOrg: citrix.com

On Fri, Jan 21, 2022 at 03:05:07PM +0000, James Dingwall wrote:
> On Fri, Jan 21, 2022 at 03:00:29PM +0100, Roger Pau Monné wrote:
> > On Fri, Jan 21, 2022 at 01:34:54PM +0000, James Dingwall wrote:
> > > On 2022-01-13 16:11, Roger Pau Monné wrote:
> > > > On Thu, Jan 13, 2022 at 11:19:46AM +0000, James Dingwall wrote:
> > > > > 
> > > > > I have been trying to debug a problem where a vif with the backend
> > > > > in a
> > > > > driver domain is added to dom0.  Intermittently the hotplug script is
> > > > > not invoked by libxl (running as xl devd) in the driver domain.  By
> > > > > enabling some debug for the driver domain kernel and libxl I have
> > > > > these
> > > > > messages:
> > > > > 
> > > > > driver domain kernel (Ubuntu 5.4.0-92-generic):
> > > > > 
> > > > > [Thu Jan 13 01:39:31 2022] [1408] 564: vif vif-0-0 vif0.0:
> > > > > Successfully created xenvif
> > > > > [Thu Jan 13 01:39:31 2022] [26] 583: xen_netback:frontend_changed:
> > > > > /local/domain/0/device/vif/0 -> Initialising
> > > > > [Thu Jan 13 01:39:31 2022] [26] 470:
> > > > > xen_netback:backend_switch_state: backend/vif/0/0 -> InitWait
> > > > > [Thu Jan 13 01:39:31 2022] [26] 583: xen_netback:frontend_changed:
> > > > > /local/domain/0/device/vif/0 -> Connected
> > > > > [Thu Jan 13 01:39:31 2022] vif vif-0-0 vif0.0: Guest Rx ready
> > > > > [Thu Jan 13 01:39:31 2022] [26] 470:
> > > > > xen_netback:backend_switch_state: backend/vif/0/0 -> Connected
> > > > > 
> > > > > xl devd (Xen 4.14.3):
> > > > > 
> > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > libxl_event.c:750:watchfd_callback: watch w=0x7ffd416b0528
> > > > > wpath=/local/domain/2/backend token=3/0: event
> > > > > epath=/local/domain/2/backend/vif/0/0/state
> > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > libxl_event.c:2445:libxl__nested_ao_create: ao 0x5633ac569700:
> > > > > nested ao, parent 0x5633ac567f90
> > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > libxl_event.c:750:watchfd_callback: watch w=0x5633ac569180
> > > > > wpath=/local/domain/2/backend/vif/0/0/state token=2/1: event
> > > > > epath=/local/domain/2/backend/vif/0/0/state
> > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > libxl_event.c:1055:devstate_callback: backend
> > > > > /local/domain/2/backend/vif/0/0/state wanted state 2 still waiting
> > > > > state 4
> > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > libxl_event.c:750:watchfd_callback: watch w=0x7ffd416b0528
> > > > > wpath=/local/domain/2/backend token=3/0: event
> > > > > epath=/local/domain/2/backend/vif/0/0/state
> > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > libxl_event.c:2445:libxl__nested_ao_create: ao 0x5633ac56a220:
> > > > > nested ao, parent 0x5633ac567f90
> > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > libxl_event.c:750:watchfd_callback: watch w=0x5633ac569180
> > > > > wpath=/local/domain/2/backend/vif/0/0/state token=2/1: event
> > > > > epath=/local/domain/2/backend/vif/0/0/state
> > > > > 2022-01-13 01:39:31 UTC libxl: debug:
> > > > > libxl_event.c:1055:devstate_callback: backend
> > > > > /local/domain/2/backend/vif/0/0/state wanted state 2 still waiting
> > > > > state 4
> > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > libxl_aoutils.c:88:xswait_timeout_callback: backend
> > > > > /local/domain/2/backend/vif/0/0/state (hoping for state change to
> > > > > 2): xswait timeout (path=/local/domain/2/backend/vif/0/0/state)
> > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > libxl_event.c:850:libxl__ev_xswatch_deregister: watch
> > > > > w=0x5633ac569180 wpath=/local/domain/2/backend/vif/0/0/state
> > > > > token=2/1: deregister slotnum=2
> > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > libxl_event.c:1039:devstate_callback: backend
> > > > > /local/domain/2/backend/vif/0/0/state wanted state 2  timed out
> > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > libxl_event.c:864:libxl__ev_xswatch_deregister: watch
> > > > > w=0x5633ac569180: deregister unregistered
> > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > libxl_device.c:1092:device_backend_callback: calling
> > > > > device_backend_cleanup
> > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > libxl_event.c:864:libxl__ev_xswatch_deregister: watch
> > > > > w=0x5633ac569180: deregister unregistered
> > > > > 2022-01-13 01:39:51 UTC libxl: error:
> > > > > libxl_device.c:1105:device_backend_callback: unable to add device
> > > > > with path /local/domain/2/backend/vif/0/0
> > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > libxl_event.c:864:libxl__ev_xswatch_deregister: watch
> > > > > w=0x5633ac569280: deregister unregistered
> > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > libxl_device.c:1470:device_complete: device
> > > > > /local/domain/2/backend/vif/0/0 add failed
> > > > > 2022-01-13 01:39:51 UTC libxl: debug:
> > > > > libxl_event.c:2035:libxl__ao__destroy: ao 0x5633ac568f30: destroy
> > > > > 
> > > > > the xenstore content for the backend:
> > > > > 
> > > > > # xenstore-ls /local/domain/2/backend/vif/0
> > > > > 0 = ""
> > > > >  frontend = "/local/domain/0/device/vif/0"
> > > > >  frontend-id = "0"
> > > > >  online = "1"
> > > > >  state = "4"
> > > > >  script = "/etc/xen/scripts/vif-zynstra"
> > > > >  vifname = "dom0.0"
> > > > >  mac = "00:16:3e:6c:de:82"
> > > > >  bridge = "cluster"
> > > > >  handle = "0"
> > > > >  type = "vif"
> > > > >  feature-sg = "1"
> > > > >  feature-gso-tcpv4 = "1"
> > > > >  feature-gso-tcpv6 = "1"
> > > > >  feature-ipv6-csum-offload = "1"
> > > > >  feature-rx-copy = "1"
> > > > >  feature-rx-flip = "0"
> > > > >  feature-multicast-control = "1"
> > > > >  feature-dynamic-multicast-control = "1"
> > > > >  feature-split-event-channels = "1"
> > > > >  multi-queue-max-queues = "2"
> > > > >  feature-ctrl-ring = "1"
> > > > >  hotplug-status = "connected"
> > 
> > The relevant point here is that `hotplug-status = "connected"` in the
> > backend xenstore nodes, and that's set by the hotplug script.
> > 
> > Having hotplug-status == "connected" will allow the backend to proceed
> > to the connected state, so there's some component in your system that
> > sets this xenstore node before `xl devd` get a change to run the
> > hotplug script, hence me asking for any udev rules in the previous
> > email.
> > 
> > If it's not an udev rule then I'm lost. Do you have any modifications
> > to the Xen tools that could set this xenstore node?
> 
> I am wondering if that xenstore content was captured after the environment
> had been manually fixed.  I have been able to reproduce it by hotplugging
> an interface where libxl isn't patched:
> 
> 
> dom0# xl network-attach 0 backend=netdd script=vif-zynstra vifname=dom0.2 bridge=abridge
> netdd# xenstore-ls /local/domain/2/backend/vif/0/2
> frontend = "/local/domain/0/device/vif/2"
> frontend-id = "0"
> online = "1"
> state = "4"
> script = "/etc/xen/scripts/vif-zynstra"
> vifname = "dom0.2"
> mac = "00:16:3e:5f:fc:51"
> bridge = "abridge"
> handle = "2"
> type = "vif"
> feature-sg = "1"
> feature-gso-tcpv4 = "1"
> feature-gso-tcpv6 = "1"
> feature-ipv6-csum-offload = "1"
> feature-rx-copy = "1"
> feature-rx-flip = "0"
> feature-multicast-control = "1"
> feature-dynamic-multicast-control = "1"
> feature-split-event-channels = "1"
> multi-queue-max-queues = "2"
> feature-ctrl-ring = "1"
> 
> If I have understood the backend kernel code it only waits for the
> hotplug-status == "connected" if they key exists which it doesn't
> appear to by default.

Indeed. I have to admit this is quite weird. I have the following
completely untested patch, could you give it a try?

Adding netback maintainers for feedback on whether it's fine for libxl
to force netback to wait for hotplug script execution. Not sure the
reason why netback doesn't do that by default, but it seems it's been
like that since the module was imported into Linux in 2011.

Thanks, Roger.
---
diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
index 0b45469dca..0b9e70c9d1 100644
--- a/tools/libs/light/libxl_nic.c
+++ b/tools/libs/light/libxl_nic.c
@@ -248,6 +248,13 @@ static int libxl__set_xenstore_nic(libxl__gc *gc, uint32_t domid,
     flexarray_append(ro_front, "mtu");
     flexarray_append(ro_front, GCSPRINTF("%u", nic->mtu));
 
+    /*
+     * Force backend to wait for hotplug script execution before switching to
+     * connected state.
+     */
+    flexarray_append(back, "hotplug-status");
+    flexarray_append(back, "");
+
     return 0;
 }
 

