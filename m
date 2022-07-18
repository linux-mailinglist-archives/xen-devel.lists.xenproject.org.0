Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799065780AA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 13:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369667.601140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOrT-0001zS-6X; Mon, 18 Jul 2022 11:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369667.601140; Mon, 18 Jul 2022 11:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOrT-0001xe-3A; Mon, 18 Jul 2022 11:24:27 +0000
Received: by outflank-mailman (input) for mailman id 369667;
 Mon, 18 Jul 2022 11:24:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDOrR-0001xW-U2
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 11:24:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c033c97-068c-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 13:24:24 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 07:24:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4978.namprd03.prod.outlook.com (2603:10b6:408:78::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Mon, 18 Jul
 2022 11:24:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 11:24:18 +0000
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
X-Inumbo-ID: 2c033c97-068c-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658143464;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FntpBjMvkMGMFRje2GYFr1e6BOUS7Nh45nyJstXMG/I=;
  b=Hthu0PjdFWWfZsQWrgI7QwgN7fl57xsCCGEKh51YlK3G2dojxNNSp1rm
   RSaMVZTLq/1RqgErv1dxVBbf5muSrBeuZmub1jM48oZpaThToFOvZQ5db
   lpTIDgrvoYEx/RGNW8RmG7XmCJEi+DVDvMz8/t0/yurrPq4haS/m/gYN5
   o=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 76026412
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zSOSOqMer8o6Db/vrR1NlsFynXyQoLVcMsEvi/4bfWQNrUpz1jEHz
 2UaXDyAMq2DMGT0eo9xYITg8hhSsZHVzYRkHAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyFULOZ82QsaDhMtPvT8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPnz/o3IU04YrcS58ovOEJj+
 NcZJgoCO0Xra+KemNpXS8FKr+F6dozOA9lavXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rn2wCWmG9FbgAv9Sa4fym7f1gFulpPqN8LYYIeiTsRJhEeI4
 GnB+gwVBzlFaoTFl2bcqBpAgMfKwSTqdIwiNoez88FIhlm04EY2JSQZAA7TTf6RzxTWt8hkA
 04e9zcqrKMy3Fe2VdS7VBq9yFaGoxodVtx4A+A8rgaXxcL8+B2FD2IJSjpAbt0Ot8IsQzEuk
 FiTkLvBGztrt7GETGOHwb2dpziyJCs9IHcLYGkPSg5ty9Puup0phxTDCNNqCreoj8bdECv1h
 TuNqUAWl7gVyMIGyai/1VTGmC634IjESBYv4QfaVX7j6Rl2DLNJfKSt4FnfqPNfdoCQSwDbu
 GBew5THqucTEZuKiSqBBv0XG62k7OqENzuahkNzG54m9HKm/HvLkZ1s3QyS7XxBaq4sEQIFq
 meI0e+NzPe/5EeXUJI=
IronPort-HdrOrdr: A9a23:rGpbmqrDl5gotZUwzVrNEYEaV5uIL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcItKLzOWwldAS7sSobcKogeQUREWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZa6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInJy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0aVjcVaKv6/VQIO0aSSAWUR4Z
 3xStAbToNOAkbqDyOISN3Wqk/dOXgVmibfIBSj8AbeSITCNU4H4ox69Mxkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pWVFZ9l/1pwKpuKuZ3IAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkcoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWuKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEnieffFmHKc7hywlbF/NLQgFkPsulqSRkoeMN4bDIGmEVE0kldemrrEWHtDbMs
 zDSq5rPw==
X-IronPort-AV: E=Sophos;i="5.92,281,1650945600"; 
   d="scan'208";a="76026412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGgFZAPwdLnPPIniyNl54NOC+Gy1naCSEERmTEiswCjzKlEzPAOmmmAnmUzyt8kXxuSb/P2OyCFChEOEhY8+/tqC0IeSU+TJOoLUPkR3bsWtjtp4MuLysY4r5q3GL8kR3mkj5U5/iUbKFCn1BgDu0rGPm5Nxq20JpSb8fSy/e46DerjcTE+TM4eQMOfhvS5Lo9Dx+/IzLkLKh/0h7feeVlHJC/7aC9dP09oPbNLkhYDaoiNo5nfgYbKRQrCJvXIc64orG3obWGUkp8KhFkAT+31hqv9lTbH5tY+vUhoHTCESbyjXlVNfkDF5Zn+doS/zwi7QVQkNNEXLHEbk4Y3NwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FntpBjMvkMGMFRje2GYFr1e6BOUS7Nh45nyJstXMG/I=;
 b=AoqP5PpvBhd/bptuNkIquBO08Nkq58z34lSDajmMZ00933IXZtZeVqKf6KPXjJas+HPCJhizxrlM5/CZ2aGRxQaJYu+a02NIbyFnA2lbVfQleWo+BEah6CO5x8lZrI99a6BP97qdyo7P4wgvelz29WMyHgWXhaXkC6YlJi08eRjH1OqOYzT91Y8Nu9dP7dBcnp0Dmy3LkEx/B0oo3yBGDuTD+6twhdSImoApraIpoRYkt4CCS0JWRCmHIsziTdHDAJLiIO1SBjoNoGBJWjs+XvSMVrwX3MW6MF6spH9SRhww5Y8dklb46oQYwC3sibNlDXvACGflxnhox2xztNmYNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FntpBjMvkMGMFRje2GYFr1e6BOUS7Nh45nyJstXMG/I=;
 b=iKco8SsFG0esgmBCk2K+rh13bw4+CdY4Nk6ULn2gypKFBOGiyB8/9Vophl2+89YtFEKHFuoiqcVqj5L9/GxsegdDKgXayCED3qzWsO0XY0TzTx5Zuuvkiy1YxVSZbdl0mkOp11+VJ4NtvLrVXVGpclbGXZjtx6BCvBLmXH51rNI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/5] xen/wait: Improvements
Thread-Topic: [PATCH 0/5] xen/wait: Improvements
Thread-Index: AQHYmnal+A9Ge6gxZ0OfQ7bAaTJTN62D+WeAgAADgYA=
Date: Mon, 18 Jul 2022 11:24:18 +0000
Message-ID: <8a262d9b-3378-ab5e-50a8-1248a69e704c@citrix.com>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
 <bf69cbf0-428c-55d8-4383-6300a3913f2a@suse.com>
In-Reply-To: <bf69cbf0-428c-55d8-4383-6300a3913f2a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2aee8e28-9ece-46c8-4f63-08da68b00e04
x-ms-traffictypediagnostic: BN8PR03MB4978:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4U3XBXe7onKlEsWZSTGn13DWwEEa1uL6bNHF0oNQ43f+JvgSitdX+pKfpzAX35ZM6zt5JAooc3GaFm7+iWnSZy6lK/CZQF33cEyE8eni2MccTeO0H6aNqvpw2rNVvkECP7B+ks/zL9w6ZRtjOPm12MYJfY5bAI3mVWzpW0wH76btxtCbWkOX0sTt4pzf13IBf7evlCDBogmXNis9vkBsEdAt9h5Y/PWJuRtNpZEQ8fTMq4lyDesVzfCv6GWXARH4IVh//6mlvKjAXJJNBENxt35SgAJygBjB3aAOukVETqBLUrEsIM/aJr7boxbMexT62sTCYmC16zMyf7vtl9s133//QFqzsDufvVRnpHgPOWkktbhkoPZPryTnitGEXUAreay/8qmchjFIRgYAuEOclnffVOEO8Uj6WpVlU/NI4BYrZvZuvbcwlPYQtDawWtKKv2qVLmNeXwX16DfImNyumcE/cveMbjq6V07Zy8aQsmfyHgC6jmFJ4ZYd/ExejLC0pJt405JOOTeCn9dc88KYRwJKKbrfX3MS+XoEW7ggtBFDUTqlSJjVtvJEvDdFZNuh5NgNbVs1uQgnypz2wy6Rfv49DSr47OmxpmhqxEtPWxyq2hYF0Oi+b0C/Ke+cW8O+XPNN6bS3Fpsdq3qVxeNlkdfWh9CwrLcLq7VbAbCUxT59jWk6W5D4s4Z+JSAn/yH+rZo8ckPR/pCZ+21JuxCMGRq84uaKI1asjI4p1EBCwfO6U1Djw0HDSMu1cGlxeAubZFTwP3faFsCiO9+HRhjiWiC86plzSrDhoyfcSEIJBhFeQAxEwtHkAnvKq+QRELsSDuXO13WntpLAsKy0cpL90JvdwKBf6EAqzUMP3Mi/usKEz2ydUf3ceuMgURFHcZp2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(122000001)(41300700001)(316002)(6512007)(110136005)(6486002)(6506007)(26005)(31686004)(36756003)(2906002)(38070700005)(71200400001)(66556008)(76116006)(38100700002)(5660300002)(66446008)(64756008)(82960400001)(8676002)(4326008)(66476007)(91956017)(66946007)(83380400001)(8936002)(186003)(478600001)(53546011)(2616005)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UDRrTnhKLzV1c1FBMk15cGhDKy82QSttMjV5bWpyVGN0NVF1TVBFeCtwRkVC?=
 =?utf-8?B?TTdZV1lJS0l0bDNxWUxaUXo3M3hxeEZZejRxMVIzSE5oWmZTKzlQN25kUm5G?=
 =?utf-8?B?MCtweTAwbWRINlZzd2EyZE5iN0tHTHk0RWRlcHdBWTUxSGpNQmp4RHlHR0Rx?=
 =?utf-8?B?YlN3SndkZ3dMVVhzM3BRMUkxRjBvSVhMWHFtQWpMclFpakV5VzA4dGlXc2x6?=
 =?utf-8?B?dmUyT0Z5ZVl5ejdQamdoR0tCR1hqZTV2Zys3UnNLUzlXbmNpb0dScnBsZWpp?=
 =?utf-8?B?VUptUkNwMjZ6WDEzTFVDaEFaRytrZjRKUlBUSklEOGZTVWs4L09ybGhZNjdE?=
 =?utf-8?B?Q0NJa0daenU5eVppVEIzR1Z2dUpBMm50OC9zN1ZieFpvRWxMMjEvQmZ1czN2?=
 =?utf-8?B?VXNteGc5c1NEOXlwcCt1UG5oeFRGN1hKeEhsckEyMW01VjFNU3hudG5YK0gw?=
 =?utf-8?B?dk80dVZCTElzY3ptbmd6L2Qzd0xhNlIycmdqc2dkcEVTeUZIeDZ1Ulh6MkN0?=
 =?utf-8?B?OTNIL29FV0NDMW4yNUZGT2FsZWFDTmFBNEo2WlFsY3kySjJCUXE1Qk81UzdF?=
 =?utf-8?B?N1krSEJNU0IyQzlkRFlndEJ4TDVnTm56TURLNWR6eVBJbmhtMENoaTlma2ZN?=
 =?utf-8?B?OU9LRlVnbGpma0tJbmVRenlLb3BOTGM0L1VFKytETGdUdXFvSVFVTEIrRmxH?=
 =?utf-8?B?amlEeSthQTFyUzdTY2l6R3poNWZhV2FjeGNqMXhCVDJ1NGh3YzNwRkVJaGtz?=
 =?utf-8?B?Ulk4b0NkY1p0RUxhU0g5bklxZzlGeC9HY0IzQjRueVM4RGpjZ1ZnaE10NVBa?=
 =?utf-8?B?K1VscnRJcnh0WHlLekZLYU5WM2FySVBURHk4R2wvMVdHTU1JU0R2eWlHaEEw?=
 =?utf-8?B?VnhWK2MxTDNpV1lqVGFCOG90RjZRcDBXT0JoZ1lFWWdmWkZiZGdJTVRpdGk2?=
 =?utf-8?B?RFYxaCtlL1FLS25na3RmUWRmVCtHYkx6dXVEV1dXZ05sQy8rb3ZHRkdxRzdi?=
 =?utf-8?B?SjluSTRGbGtXZUwzbmJZeWVudjFiUFJtRWUxblRLdkRLRGpUbXNnK2FmdTh3?=
 =?utf-8?B?U1dlOEJPdEVXYnFVUnA3dmhRdTdkaWNOWXpjQ00zSjdKL1VMWE9aaG1QU1U1?=
 =?utf-8?B?aFgrNXJEbkx0QWJQWnlxbU5pK0dZUXM2TVZ4eUhpbGNoWnB6T1J3cm16VTVC?=
 =?utf-8?B?eGVBN2IyRjFuU05tVTlPdjd1cWlrQXY4d3NNWWlsTkVoTC9oc1VlVEZzaml1?=
 =?utf-8?B?R3ZPcG0wRWFOa1hkRjl0VkM5bkFKS2xFTHB0MEpoM3VkVmJWcWFpaC9JV2gy?=
 =?utf-8?B?QzVFUHBXZ3AyVnNiMFFObXFlMnArYVNyaU9zTmh1NmQyeVdlZmlYUWNOL3Az?=
 =?utf-8?B?Y2U5b3Q5NVV1a29mcTF0NCtIRStmaXl1b3dPenZhT1N3TlRYVkR2TjRnTWNV?=
 =?utf-8?B?Um9QcEJCbytsMkhOZmhFU1VhWmp6UE5lemdvU3RaV3hBSDFHVTNkSUNMWGF6?=
 =?utf-8?B?VGp1WjBHKytUKzVzM2VKWFRDWFZMQ05jTGxQWGFmM0hYY2ZsczBxVW40N01T?=
 =?utf-8?B?UkRrYXdVcXVqa21mT3NwOVFLVURROFJYcUVOL2ZVQ2dvdVZTNEs3YTFQbUhh?=
 =?utf-8?B?QnpTdTdrVTQxQ1NyWHUrWmp2c0h0c3ZHR1hWdTB3MzlBYS9LTml4QkNrbFRQ?=
 =?utf-8?B?anJOWW10U1p0cUxBU01zcnJrY2k4U3lKQXJMaHM0L0JkcDlYMGZFUXFCZnZ6?=
 =?utf-8?B?TjVpb2tYd3huNnFsZWVSV1dxdDRZaGs0YW5VMUVwbWFUMk1YZzN6T0ViaGI5?=
 =?utf-8?B?emxYMTJVTG1xU2IzVUQzMGhZVzZ5TzhteTRQT2x2d3Q0WFlxR0FEZlZJRndp?=
 =?utf-8?B?YnJnNUkrRDA4aXh6VUpwUGsvcTRVYVdLdkFnYklCTE5oQkJXYlpmdW9nR2V6?=
 =?utf-8?B?VkwxSVpQUm0yTWVxZklBSjhJSGVZM3RlYW9LTVJsa1l6amoxV0tkbEJqbFpG?=
 =?utf-8?B?TU9aR2pSbm9JVWM1NlhiSDVWSFBmeGRNZ1ZDUncwdEdpdVdmWlhPMDkrNVZL?=
 =?utf-8?B?eFRQb1hOV1NJTm9ZOENwS0twRnhBK1Vvc1hkdGJEVWZ1K2hIbmZSYm1BTTFO?=
 =?utf-8?Q?pM1fsPBtWir3u88YZ7Qf/90cZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3949C975853EA442AAE013A8A3BD3AC3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aee8e28-9ece-46c8-4f63-08da68b00e04
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 11:24:18.4574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0G3bYSK6jACZ0CESKjBFu6dCVchH3XKz6axeTtVnsAewAaaOUwJr1ImDyeebpO0O2XxsBvineRIIYw9REBakMOoxxMr7H0O2dizVyVvJKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4978

T24gMTgvMDcvMjAyMiAxMjoxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE4LjA3LjIwMjIg
MDk6MTgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBUaGlzIHN0YXJ0ZWQgb3V0IGFzIHBhdGNo
IDIgZm9yIGEgZGlmZmVyZW50IHRhc2ssIGFuZCBxdWlja2x5IGlkZW50aWZpZWQgc29tZQ0KPj4g
dGVjaG5pY2FsIGRlYnQsIGxvbmcgb3ZlcmR1ZSBmb3IgY2xlYW5pbmcgdXAuDQo+Pg0KPj4gQW5k
cmV3IENvb3BlciAoNSk6DQo+PiAgIHhlbi93YWl0OiBEcm9wIHZlc3RpZ2lhbCByZW1uYW50cyBv
ZiBUUkFQX3JlZ3NfcGFydGlhbA0KPj4gICB4ZW4vd2FpdDogRXh0ZW5kIHRoZSBkZXNjcmlwdGlv
biBvZiBob3cgdGhpcyBsb2dpYyBhY3R1YWxseSB3b3Jrcw0KPj4gICB4ZW4vd2FpdDogTWlub3Ig
YXNtIGltcHJvdmVtZW50cw0KPj4gICB4ZW4vd2FpdDogVXNlIHJlbGF0aXZlIHN0YWNrIGFkanVz
dG1lbnRzDQo+PiAgIHhlbi93YWl0OiBSZW1vdmUgVkNQVV9BRkZJTklUWV9XQUlUDQo+IFdoaWxl
IGdvaW5nIHRocm91Z2ggdGhpcyBzZXJpZXMgSSBjYW1lIHRvIG5vdGljZSB0aGF0IHdlIGJ1aWxk
IHdhaXQuYyBldmVuDQo+IG9uIEFybSwgYW5kIEkgY291bGRuJ3QgY29udmluY2UgbXlzZWxmIHRo
YXQgd2FpdF9ldmVudCgpIGlzIGFjdHVhbGx5IG5vdA0KPiByZWFjaGFibGUgdGhlcmUgd2hlbiBl
LmcuIHRoZXJlJ3MgYW4gQXJtLXNwZWNpZmljIHZtX2V2ZW50LmMuIEkgd291bGQNCj4gZ2VuZXJh
bGx5IHByZWZlciBpZiBub24tZnVuY3Rpb25pbmcgY29kZSBwYXRocyB3ZXJlIGFjdHVhbGx5IGNv
bXBpbGVkIG91dC4NCj4NCj4gVGhvdWdodHM/DQoNCkkndmUgYmVlbiB3YW50aW5nIHRvIGRlbGV0
ZSB3YWl0LmMgZnVsbHkgZm9yIGEgbG9uZyB0aW1lLg0KDQpJdCBpcyBvbmx5IG5lZWRlZCBiZWNh
dXNlIHRoZSBldmVudC9wYWdpbmcvYWNjZXNzIGludGVyZmFjZXMgc3RpbGwgdXNlIGENCnNpbmds
ZSA0ayBzaGFyZWQgcmluZywgYW5kIGV2ZW4gdGhlbiwgb25seSB3aGVuIHlvdSBoYXBwZW4gdG8g
ZmlsbCB0aGUNCjRrIHJpbmcsIHdoaWNoIGlzIDExIHZDUFVzIG9uIHg4NiBsYXN0IEkgY2hlY2tl
ZC4NCg0KSSBjb3VsZCBlYXNpbHkgYmVsaWV2ZSB0aGF0IGxpbWl0IGhhcyBuZXZlciBiZWVuIHRy
aXBwZWQgb24gQVJNLg0KDQpUaGVyZSBhcmUgcGxlbnR5IG9mIHBlcmYgd2lucyB0byBiZSBoYWQg
YnkgYnVpbGRpbmcgYSBuZXcgWGVuPT5hZ2VudA0KaW50ZXJmYWNlIHVzaW5nIGFjcXVpcmVfcmVz
b3VyY2UsIHdoaWNoIGluY2x1ZGUgYmVpbmcgYWJsZSB0byBndWFyYW50ZWUNCnRoYXQgd2UgbmV2
ZXIgbmVlZCB0byBwYXVzZSBhIHZDUFUgdG8gd2FpdCBmb3Igc3BhY2UgaW4gdGhlIHJpbmcgdG8g
cG9zdA0KYSBldmVudC4NCg0KV2l0aCB0aGUgaW50ZXJmYWNlIGZpeGVkLCB3YWl0LmMgY2Vhc2Vz
IHRvIGhhdmUgYW55IHVzZSB3aGF0c29ldmVyLg0KDQp+QW5kcmV3DQo=

