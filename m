Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C61D43466F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 10:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213653.371938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6bK-0006f2-CV; Wed, 20 Oct 2021 08:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213653.371938; Wed, 20 Oct 2021 08:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6bK-0006d0-7o; Wed, 20 Oct 2021 08:05:30 +0000
Received: by outflank-mailman (input) for mailman id 213653;
 Wed, 20 Oct 2021 08:05:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ou1c=PI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1md6bI-0006cu-A5
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 08:05:28 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7917d1a-5f75-4bae-ae1c-92570ad36dd0;
 Wed, 20 Oct 2021 08:05:26 +0000 (UTC)
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
X-Inumbo-ID: a7917d1a-5f75-4bae-ae1c-92570ad36dd0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634717126;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wucdKA0RygAlhaAR59IhWFX2fGhd36Ovw5uoj1QwHUM=;
  b=I2TPPM3MjlJW2uamGjTzq+hAf12ClNh4koOq3P5/KnplC5dzje8ncrT/
   4bhWKq1mIcjVKwgMGGIq82jLnYGqm7P+1c4PuTc6dLpvIM764APgrAK/x
   UbIeCo6ivIX3H+EiuEFc1Qr7YXrNKwc+ygF0eceE+mNIw54lJ7nTpuvie
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QMIyo2Bt100lZ4u8azzn8oibuj+5kHuuf/n1BlOXUCgHgRbc6QwWuclg3f7yGwgLiq6rJyTd8c
 l0Dm5MoPNP70ELGzxf498LLLH1VJE2vNJiaP3YG0/mqgfCgE4v91q0uNwygfhSg+XwPf6BqCU+
 WUzFU5QUBjrTCuWsXKTRle3JqxthlfyAAzv/KJ/ck8xpkJVUJkIDhqQTKvA6bmv3riDjj+oZC2
 au2aYuR/p2LIyApKFrpK2x08Bk4X51/6NcVZ8M13SguyQ5cfCOARh7GUOp1H+vxHxMdbRDgBUK
 sKHxavnbOj01lpj0kUd864Xi
X-SBRS: 5.1
X-MesageID: 56007876
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:r9XlHK9xocUl41NCqqhNDrUD3XiTJUtcMsCJ2f8bNWPcYEJGY0x3n
 2cbXT+GM/aNMTT1fo9ybdmy8x8Pv5PXmtEwTAA+/yo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrZj2tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhIy
 4RPvIGpVjtqJ7SXmr0NVAZWHiZXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgm9o2ZARQ54yY
 eI9aHlIMQTkWiFUJwc6UbgRg+GorH3wJmgwRFW9+vNsvjm7IBZK+LTkLtf9YNGBQsRR2EGCq
 Qru/WvjBQoBHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc+xYL
 0sY6y8/t58Y/UagTsT+dxCgqXvCtRkZM/JLCPEz4gyJzqvS4i6aC3ICQzoHb8Yp3Oc3Wj4Cx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/HhvYUygxTnXttlVqmvgbXdBjXY0
 z2M6i8kiN0uYdUjjvvhuwqd2nT1+8aPHlVdChjrsnyN1wAoZoe4fpOUqkHCtvQZPIGGQFSGl
 S1R8ySB19wmAZaInS2LZewCGrC1+vqIWAHhbU5T84oJrGv1pSbyFWxEyHQnfh0xa5dbEdP8S
 BaL4Vs52XNFAJe9gUabiaqKAMM20bOoK93hUv3FBjalSsksLFHZlM2CiEj54owMrKTOuf1gU
 Xt4WZz1ZZr/NUiB5GDqLwv6+eRzrh3SPUuJGfjGI+2PiNJynkK9R7YfK0epZesk9q6Cqwi92
 48BbJfUlUQHCrGmO3C/HWsvwbYidyRT6Xfe8JQ/SwJ+ClA+RDFJ5wH5kNvNhLCJb4wKz7yVr
 xlRq2dTyUblhG2vFOl5QisLVV8bZr4m9ShTFXV1ZT6AgiF/Ca7yvPZ3X8ZmJtEPqb08pcOYu
 tFYIq1s9NwUEW+Zk9ncBLGgxLFfmOOD31zeZHT7PWBjJfaNhWXho7fZQ+cmzwFXZgKfvsoiu
 bywkATdRJsIXQN5C8jKLvmoyjuMUbI1xIqehmPEfYteflvC6o9vJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SLv6yrMST6/3a4xdMSWui/Yj2ABnj//7+vZ
 LsJwqikYuEHhltDr6F1D61vkfAl/9LqqrIDllZkEXzHYk6FELRlJnXaj8BDurcUnu1SuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4eRyo6jV28byLVVRpEyON0CENfqFoNI4Fw
 Ps6vJJE4QKIlRd3YM2NiTpZ9jrQIyVYAbknrJwTHKTilhEvlgNZeZXZByL7vMOPZtFLPhV4K
 zOYnvOf1bFVx06EeHsvD3ndm+FagM1W6hxNyVYDIXWPm8bE2aBrjEEAr2xvQ1QH1AhD3sJyJ
 nNvZh98Kqi59jt1gNROAjK3EAZbCRzFokH8xjPlToECo5VEgoAVEFAABA==
IronPort-HdrOrdr: A9a23:ahX1dKqnKZQyQ5g42073Pn8aV5u2L9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QD5SWa+eAfGSS7/yKmDVQeuxIqLLsndHK9IWuv0uFDzsaEJ2Ihz0JdDpzeXcGPTWua6BJc6
 Z1saF81kWdkDksH4mGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 f4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRoXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqqneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpj1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYDhDc5tABGnhk3izyxSKITGZAV2Iv7GeDlNhiWt6UkUoJgjpHFog/D2nR87hdsAotd/lq
 L52gkBrsA7ciYsV9MOOA42e7rANoX8e2O+DIusGyWTKEgmAQOHl3el2sR+2AmVEKZ4u6fa3q
 6xCW9liQ==
X-IronPort-AV: E=Sophos;i="5.87,166,1631592000"; 
   d="scan'208";a="56007876"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nI/t32u9cO+HOm5Tq9bv+HVs7pFltMCS6DwGKgPBcqNFaqFQpbhV6eVy9LSft28e80OyuloyD69nsiDifDDcblObscPQmnK9TLzjvEQjnmeMTnS5haLYmlWW0qpDSI00VMXg6zPLtbtqmygcqXauHrWCyD8P8aGYI9ocr/GXu4jlSvTxT8fTa9aYVTfPBpiijFsdZpYMiWrafL7CaajybFMrzT8fdY/z7FLBh/Uh903cvUNrOUakL48F7YOUT/8+PFcsbBguJv4eQKPHZ+QfNdFjAOLhoQKGNfpdFToqrcMYfgF3W4cKnBbvTyd0N0zG6bOW5ju2RNARee0kOK59WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyOT0Pr+szytsUQEfzSP45LbnH/3LUj0vec8V00ENuM=;
 b=ZaV+fnNF0aoLYRGXK0qgsHYePV2bShuHZ8eD1fTgKUojWEPJidMkqZ0trqLfwh9YZ8lU8lVqAYh9L7knCNp741Cx8Jyrq3FmfHPQV4c1hJWOdyDraN+JdhNsogm6GTCVwBxGJ719rjsURMxx763PFYfpDyyM6Mkm0dMhG6j8oyCfc26U16zVbXA/6V+Q4x0XLfVUNYfi16ywlFy8NR1+lNm5uR4dHdUlyIvuSixekmNRLXwaEbvKilbSm1XNr/NffSHNbdmNmA1QUhCGUw4aSQL5mU+YkjOIFziWJDRBNT/ctzHu5A+WnvsmTCDkFcCThyA63nIem4sj8qpDjWhOqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyOT0Pr+szytsUQEfzSP45LbnH/3LUj0vec8V00ENuM=;
 b=EPkXLr0f+ZSloRvWI2am+Z4QCZE96/TWWNnRnC89krKIsqZ9sesg0Qe8sNeiBYMgBEvexh9wRYjUtOD390T6IClDsfxLZ+Dc6otvM4Es9T4XXk565/i9r28TiUVFsfoZjJqVCA8weIQkd5bfK6qupGXcbgHf1HZghOmKBqavqQE=
Date: Wed, 20 Oct 2021 10:04:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Anthony PERARD" <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/6] gnttab: allow setting max version per-domain
Message-ID: <YW/NipJMLH0Zz05s@MacBook-Air-de-Roger.local>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-3-roger.pau@citrix.com>
 <f5564634-5f9e-0b94-f73a-d44ae65c30f4@suse.com>
 <0b58667f-b6bc-d5b5-2dd1-0c8996367319@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b58667f-b6bc-d5b5-2dd1-0c8996367319@suse.com>
X-ClientProxiedBy: LO2P123CA0027.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::15)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7228e657-e92e-4a3a-3e4f-08d993a03ee9
X-MS-TrafficTypeDiagnostic: DM6PR03MB4843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4843E37F1AD77E20B865B3198FBE9@DM6PR03MB4843.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CIf+SBQ2rH308t5KiDDiEeiacyoYJaxz7X6uS1tcY9oPvRkNkghWQXXerRp9uMfe3Rm05P2hfDS3f0erQtpOUAewvojzDxGTg8FxSEjFol375x/v7/AUO2ONDZbGpgY/4l3op0IiA05pZqSmBQs2tVTfORD8wNaeamPzWffI3KOr/3fnoGdBRS0Qi/6Qzae4DDtKa+/pWjlwO9QWvBZG+nShc76e+ahNdq6TpQ+uu7VrhOoPiyAUlp0UouFCT1elYTidyyyNF3N/zR1M0JhIcaESuE18gcBAV5j3heYtNv+gNYvYZgmCSRM+ZTDOuC4ozuJSoC9HjXSrZeYY0jTjjOYiQTqyWQ1i27rWiTA+UHzQRFvPNwU92y8PvEzsSNIxr56XXj0Q5rXs1WHmU06SBH2k4ARnJq63wOuip5xl5VIv2C8HuL4prxVV4vMSIxvNQSt5owTPugtAbLnNBwRi2tKXLE5u/314wYNvQXAA5Geb7qnm7jiNGO+AMF7vg7P264rTL10uCcLnXtvCYk06HRrvyPWjxkPXiW7u5gUjtZvQMs6kMDisiuYoVqjygBv+7cbmSxX9UOGi+xkzUvJs2/LR5uDHBUGBXhHVCa3bVPb+nek6RD+jtAWoaEM3ttjwAqTvyTKWeDSesOPKwF5qBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(66476007)(85182001)(8676002)(66556008)(66946007)(86362001)(6666004)(508600001)(316002)(5660300002)(956004)(53546011)(2906002)(8936002)(6496006)(9686003)(6916009)(26005)(83380400001)(6486002)(4326008)(82960400001)(186003)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzZXeHY4V1dKMEo0S3FtWEpvS1h3SjlpMHdrQnZPeVQ4MzVhYnFwZkNoLzd2?=
 =?utf-8?B?MjVvTHBIT0lIS0FpWTl5T0ZweUsxWW02UnlRN2N2VEdHVFhQK3krbytKaE16?=
 =?utf-8?B?SHFQaE5ka1dJc1F3VzBPblVmMzBjMHpoY1VSMjc2WjJnZDhNaHl6bEg3VGxE?=
 =?utf-8?B?dG1OSG9scTBkdTN4d25OUHdUaG9CSnU2dGdlenJvMy9kczhUcGQ1MG1KRjJr?=
 =?utf-8?B?b2FGQ3dGVkpRMEJUeXY1TGRhVEk0RzQ2R2t4Z0ErOHdzbHJZbk5yanllYjVJ?=
 =?utf-8?B?WEFzcUk2TVIrSDY5Y0gxbzhmT0Ria3N3Y2N5UTArdVJmak9MUXZmMExJcmd0?=
 =?utf-8?B?NnM1Rkh4OUVWTWVKekQ3WDczSHc2VlZGQVJyVXVPaHo4cHZoQnVnb21Lc2Ex?=
 =?utf-8?B?L1JlMjZXRmc5ZlJWcWVTTkNXRDBIclVCRnF1bGFlN0UzZG5IYmxXUjZvc1JM?=
 =?utf-8?B?U0VDaFUxQnA0SmFvWjZrbHJlVDYwTlMyL2x1d2F0UTJYQ2JZaHZQdUI0dFBS?=
 =?utf-8?B?aHkrY1IrcEFrd1ZZM25uYzE2Y0xXZytycDBKYzkrZ2VmTHBSN1dVRlZFemQ0?=
 =?utf-8?B?bTZ6ajE0VEFsN292ZWs0Z1JqN3ZhNmw5akwvOHp3L2l1c1VSU2wrbkFKVTNB?=
 =?utf-8?B?bW0zcnRMQzlRTERkblVQRmsrZndlZFlqd0hTZVNNZnAzVkJyZGJyRm9IN3JW?=
 =?utf-8?B?K0V0UE5uM2wxVUhDcWN4OUpkSmhiU2NQeFNGUDBJTHhvZFpIbzNJbXhMOGhu?=
 =?utf-8?B?N3FTVDMzNms1S1RnTElvRzlFT3FOOS9nVlpCRjhIWkp0MW16cy9XaStUc3pR?=
 =?utf-8?B?bHUxbitFZFBjS0hqTDFSVUtCT2plemZKazFISjEzRytDbTVsN3FJdE40S3Zy?=
 =?utf-8?B?WTRYZ3ZPdGpGcUh5OFR4eDNDNlpTSXp2RFpMU1hOZnY3Wm9QRVpvREkwcVVD?=
 =?utf-8?B?WXVqd1ZZQUFIUHZUa1RGT3pFY3NSd0h3R21yTG1aR0tiVzkzUUtxcGZnVHJT?=
 =?utf-8?B?SjV3RWJ4NWJmSHlpRmROS3YvR2liemVmZElkdGhZdzhkVFZvOGdTZWhqK2hK?=
 =?utf-8?B?L3pYSWtQN0hxY09xa2dFRnB4emdpYlZsLy91akZwRG5ERWQwZjAwTGJwcEVz?=
 =?utf-8?B?RTFNZWFTdG5sTnIwM1NqY0x2VkZTOTdCaGRwdjU2b0lDVFBiMGE3aXJuTjZ3?=
 =?utf-8?B?dndkeW5ibmcycE5uWEpIUkFPaTlmYi9BSkQ5ZFhQNDkyYmpUbHZxTDMyT1Rn?=
 =?utf-8?B?clJRMmppRnk2TWpNUUE2aEt4UDNMczB1Z2c1Q3JDMkNZeFJqYjRhUmdva083?=
 =?utf-8?B?R0hGeFZzZitqS0xoMGxLVkV0SXVtWnpTSXRYYTAzdFh5a2xzaHhGS1RnNVFh?=
 =?utf-8?B?TXhSampPL25IbEFWd29ubnhZL2phTTZ3N3pNZzBkQW9oMUNzak5lQVNuY0xH?=
 =?utf-8?B?bzEvelhpMEJDbGhjMXhORjcxc2VBN1RJNWUxbmJSNmlxQU9zdmVNZVdnNHhB?=
 =?utf-8?B?WEdNQURCMFhDY0c2NmJ0aXFaeERPaXFNa2NsRlJXSEdXc3pWK0xxdFBZcWgy?=
 =?utf-8?B?TXhEenVhZWtGc1N5OGE5YW8xOTFzTXF0ZzI4c2JObnUxSnVHdE1jUGN6Mlh3?=
 =?utf-8?B?R3kwN0FsSVEyS0N3V0F4c21BR1QwbldBZ1YvVmVzcUxrTURUaWQ0bXRNWWp6?=
 =?utf-8?B?YVZtN3daK2VOZHdzWm1PM0JjQW80MENYN0RSaGM5NUlyT0M1dnpyeUFYR0dm?=
 =?utf-8?Q?1YzFMg2WX2JTXfu6xU2saiHgzcTu8vIeXdo46ew?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7228e657-e92e-4a3a-3e4f-08d993a03ee9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 08:04:31.0891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4843
X-OriginatorOrg: citrix.com

On Fri, Oct 15, 2021 at 11:48:33AM +0200, Jan Beulich wrote:
> On 15.10.2021 11:39, Jan Beulich wrote:
> > On 22.09.2021 10:21, Roger Pau Monne wrote:
> >> --- a/xen/include/public/domctl.h
> >> +++ b/xen/include/public/domctl.h
> >> @@ -87,14 +87,22 @@ struct xen_domctl_createdomain {
> >>      /*
> >>       * Various domain limits, which impact the quantity of resources
> >>       * (global mapping space, xenheap, etc) a guest may consume.  For
> >> -     * max_grant_frames and max_maptrack_frames, < 0 means "use the
> >> -     * default maximum value in the hypervisor".
> >> +     * max_grant_frames, max_maptrack_frames and max_gnttab_version < 0
> >> +     * means "use the default maximum value in the hypervisor".
> >>       */
> >>      uint32_t max_vcpus;
> >>      uint32_t max_evtchn_port;
> >>      int32_t max_grant_frames;
> >>      int32_t max_maptrack_frames;
> >>  
> >> +/* Grant version, use low 4 bits. */
> >> +#define XEN_DOMCTL_GRANT_version_mask    0xf
> >> +#define XEN_DOMCTL_GRANT_version_default 0xf
> >> +
> >> +#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_version_mask
> >> +
> >> +    uint32_t grant_opts;
> > 
> > As it now seems unlikely that this will make 4.16, please don't forget
> > to bump the interface version for 4.17. With that and preferably with
> > the nit above addressed, hypervisor parts:
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Actually no, I'm afraid there is an issue with migration: If the tool
> stack remembers the "use default" setting and hands this to the new
> host, that host's default may be different from the source host's. It
> is the effective max-version that needs passing on in this case, which
> in turn requires a means to obtain the value.

Hm, my thinking was that the admin (or a higer level orchestration
tool) would already have performed the necessary adjustments to assert
the environments are compatible.

This problem already exist today where you can migrate a VM from a
host having the max default grant version to one having
gnttab=max-ver:1 without complains.

Note that adding such a check would then effectively prevent us from
lowering the default max grant version, as any incoming migration from
a previous hypervisor using the default parameters would be rejected.

Thanks, Roger.

