Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67724AC4E7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 17:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267206.460927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6ZB-0007Mr-OR; Mon, 07 Feb 2022 16:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267206.460927; Mon, 07 Feb 2022 16:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6ZB-0007L2-L4; Mon, 07 Feb 2022 16:08:37 +0000
Received: by outflank-mailman (input) for mailman id 267206;
 Mon, 07 Feb 2022 16:08:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYSm=SW=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nH6ZA-0007Kq-B5
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 16:08:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 329b8c22-8830-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 17:08:34 +0100 (CET)
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
X-Inumbo-ID: 329b8c22-8830-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644250114;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RDRDAxOv4vlR3Ub5vRqx2g31TMmRHTezg+oAg/H9tXo=;
  b=Ct7ZXAO/ZircH4TGTidMi0hG/J2AqwFzGZnDFIPXbOg4CdtlDUhni9EM
   lR8D41gmYrBl7oWwWQHyNlMH3z558dllQXTsgtx4s8PNaDJ8Q/k47bs5/
   xKgShvSEXOcQ7AJ7bTQpEa8qWY+JdB+9qxSwC7Th6UchcsN0/KcTkZMA6
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RQgt49YBbZYuTld1IJPQk8VkKRR/Fym01dt7Vv/0n8/pSDICe+cJ106jOHOp2WCB0l5rZCYvDO
 48nja1N0cdzRBKZEqvAMnG+keppcvEvf1f5vUahgUfxWpEjlP4Cc3+YNPsxPbzer0Y3HeBVnfz
 QqbIWLaV9YYkXTwdJCdqLnyKjZzKQIfOeBYxysLDOgp47n0GoaMa00x9dXSz13V4YTcXjKDEe9
 0tewcZjwVcEgnCq2Y0lhd3mhNB5uTHBJ68A0gCO7pDPRrXgapDuJ6O+YVF5I3uSTtT5biSgDYj
 hqpgyalFajlM6B8bOwoJM+m3
X-SBRS: 5.1
X-MesageID: 63659437
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QMdf4K0W/4TKb/AdAfbD5fN3kn2cJEfYwER7XKvMYLTBsI5bpzRVm
 mIdXTjUM/eCYGT1eoojaNi1pkMGuZDWnNQ1TABkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5w7Fh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhr8FK2
 MpPvsKLcAIpF6zgicZDCwlbKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4QGgWZs3Z8m8fD2S
 +VaSSVkfhf5eTZ1YE8qKYkCv76tiSyqG9FfgA3M/vdmi4TJ9yRp2aXpGMrYfJqNX8o9tm+Cu
 m/DyEHoDRgbOcK3xCKM9zSngeqntSn2Qp4IHbu0sPtjmkSOx3c7AQcTE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JKGu0n7EeWy6zb4y6QHG1CRTlEAPQYs8sxSS0vx
 0W+tdrjDjxys5WYUXuYsLyTqFuaHiwYLnQLYyMeeiID78P+u4E4jh/JTdFLHba8i5v+HjSY6
 zKAoTU6hr4TpdUWzKj99lfC6xquu5zIQwgd9gjRGGW/4WtRQ4qoZJeh71TB2spRN4aSTlSHv
 38sltCX6aYFCpTlvDeWXOwHEbWt5vCEGD7Rm1hiG98m7TvFxpK4VdkOunckfh4va5taP2+yC
 KPOhe9PzK9CB2u1b6QpWLu0C+0r4bnCS4z1VcmBO7KifaNNXAOA+ShvY2uZ0GbsjFUgnMkDB
 HuLTSq/JS1EUPo6lVJaU89YiOZ2nX5mmQs/ULiml0zP7FaIWJKCpV7p2nOqZ/tx0q6LqR69H
 z13Z5rTkEU3vAETj0DqHW8vwbIicCJT6XPe8ZU/mgu/zu1OQjBJNhMp6el9E7GJZowM/gsyw
 lmzW1VD1H30jmDdJAOBZxhLMe2zAc8u9CtlbHZ1Zj5EPkTPhq71vc8im2YfJ+F7pISPM9YoJ
 xX6RylwKqsWEWmWk9jsRZL8sJZjZHyWafGmZEKYjMwEV8c4HWTho4a8FiO2rXVmJnfn5KMW/
 uz7viuGEMVrb1o5Vq7+Nqnwp25dSFBAwYqeqWOTeYINEKgtmaA3QxHMYggfeZ1VeU6dl2fFi
 257w34w/IHwnmP8y/GQ7YispIa1CepuWE1cGmjQ97GtMifGuGGkxOd9vCygJ1gxjUv4p/evY
 /t71fb5PKFVlVpGqdMkQb1q0bg/953koLoDllZoG3DCblKKDLJ8IybZgZkT5/MVnrIJ6xGrX
 k+v+8VBPenbMs3SD1NMdhEuaf6O1K9Il2CKv+g1Okjz+AR+4KGDDRdJJxCJhSEEdOl1PYopz
 P0PoskT7wDj2BMmPszf1nJf9niWL2xGWKIi78lIDIjugwst61dDfZ2DVXOmvMDRM41BaxB4L
 CWViazOg6Vn6nDDK3djR2LQ2ed9hIgVvEwYxlE1OFnUyMHOgeU63UMN/G1vHBhV1BhOz8l6J
 nNvax9uPayL8jpl2JpDUmSrF10TDRGV4BWsmV4AlWmfREi0TG3damY6PL/Vrkwe9mtdeBld/
 a2Zlzm5AWq7Ipmp03tgQ1NhptziUcd1p1/Ll82QFsiYG4U3PGj+iai0aGtU8xbqDKvdXqEcS
 TWGKAqoVZDGCA==
IronPort-HdrOrdr: A9a23:oduGBaF6Bl75yxXNpLqE7MeALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgviMc5wx8ZJhNo7+90cq7IU80l6Qa3WB5B97LNmTbUQCTTb1K3M/PxCDhBj271sM179
 YET0GmMqySMbGtt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,350,1635220800"; 
   d="scan'208";a="63659437"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNaeeHvGsilSC0Kuc322HwmQa8JiSj47XKtR0NeuVuyiLRRZ41QLaQHYq1f1KX/9gRyNqXYSSpVKwwvY9gm/U1RjIer+YbvGuiQ/S4xJwIxLY9TwbQeHpCNOQtKLlh6AecdgJfS+cRoQUqMAjpPK3ffQCb0H0R1S6wNJnWQtNpCH+p9lKV7ltNfMVdgMQ+E2w6/5CcMLdHpJDVI5JAjpx5dwJfu7FiIWVDCZ7SRgj8eUBKgSYB9Rh6J8z8dzy5IKUPJckeSYfI086JzJvM0gB0t5x/ouG6Rhbb+DvDlaYmr1tdExfGU1dk9jSvxqtwVGwLGspaxCKxlHnGbpLTT5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rx4MvDk5QIewHCsNtq9PZOT1rF/nb3JP8sHO7rhVH+k=;
 b=Yb8sAjhe5Ogv6FlZWKyhVLlSubzLJ+PXOqK6u6jbw8xKFMA8u8fLlNVGtsPKYiBuailgMFnIGXbqx1qdW2F2jDKddcXnuJRUNZ7NLl3TrWrlh02pGUW75SInFLV+7ZsIK1C3rdynOhIhUo1ZsHX0HxTRE1bJdeljtk/0ORg8hTPhAfWmUyG+W0e+/LosfHkXuPEhTitAQJrY0FZkYfXBsHAkaMzFtaYwf1v2/zwkOAWUkivC9L8OiWC/FNXa+T1vVJdt4pOnAgANiDwMULZeLLrP7bg/UZRDplaIygC6NXh4GnpQ7/5bF6TvyDq7FtF/QH5bg7+c3Pyck6JZh4D0Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rx4MvDk5QIewHCsNtq9PZOT1rF/nb3JP8sHO7rhVH+k=;
 b=ojSHxf/Qd0zQXQyEpj25Jkh7zwH7NQ7mtMWGRHdldweHHdksVSFaL2MvEYTumNGLRQ662UCY2qsUHa/dsRapTWi1O3SMu9BbtKUdNHPX97i2sGaqCziqGxRTEWgDnhiGhK7wZIspvAYy5Y32TYwEDIk0zVQjR9f0TsunzuoHu2k=
Date: Mon, 7 Feb 2022 17:08:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Message-ID: <YgFD8TFWwBqAe3U9@Air-de-Roger>
References: <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
X-ClientProxiedBy: LO4P123CA0492.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33624a73-541f-47a8-fef3-08d9ea54119a
X-MS-TrafficTypeDiagnostic: CH0PR03MB5969:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB5969D3E07680587D03CE4DB78F2C9@CH0PR03MB5969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xvdBFoy2RflDGw6V2m0v+O0sJmSh5WGKXO/eRVZEs8K6RneTgGgyH+vROLPCXup5yt3pBloGzWoqU7wWvabYk6jg6A2XNlZURGlBmWhABPLDQe5MWB6kqmROdgZbqDKfdimNyhAw6Yr6a+WdxFVXtM/BVHaQZUmyykAZJCnhyKneilZSWCpwazH/ozX2u9degJ726xu0YYtcwG5tAg9qJHxpVPqnqogwP/D5z40OYDDBdMhVoI/erH6paiwInXvAPBeGOuMmIUM+BHEOepcro2Ly1uCxxsFKmCfNCBVZBZipKV0rbcO6D6vwOBOAJreS8ibPp7VS8SayOofmhTrxWD8O/9W/iR6qnUjoq7FP8Fevb4WCNaQsLZF8ToEbXn3LOLU+dqiJlbPwJZt9H0qJyeScidSoL91uogt7aQn0NUt9kLrawhAkIpupIno8aoDVX2s45s/6CZH1o9IhX4MFEPEKmGRAlGeyyUMB3LAGYEwZuZyJdzdE3ERrLmmPK3tFa/B29lBSqXLJaW4/3HORD+I0qyT6m0368srk51pwRfjIHJxtWjXNfKiJYd47mF9qkka3aAaiHV3YJ0AsyNjAOoeUYbuNi7anyFs6Gmc6Mtbp/tUrhiEyhfT+lMQsgoJmfK0mwO2oOyg+2ad2h2xk+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6506007)(83380400001)(53546011)(54906003)(6512007)(6666004)(316002)(82960400001)(33716001)(4326008)(9686003)(86362001)(85182001)(38100700002)(66946007)(2906002)(66476007)(66556008)(6486002)(508600001)(8936002)(8676002)(26005)(6916009)(7416002)(5660300002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3lpL20xUDh0M3VyL2V2U1pTd3NtTGJUbHA0blpRRzNlaEYxc2hUN3kvTjBh?=
 =?utf-8?B?SFNGc08wZ2FGRVNvZ0RON1h6SHpNV3pjcTZ1d3NuRXN2RnB5cVEvTG9vTXh5?=
 =?utf-8?B?aG9VVnJZakROTThoUnpVZ3hHWHp0aHEya3daQjFUWmlYVjJ3L2hDUEg3Mkdn?=
 =?utf-8?B?cjdDU1pyc2JLUlhQR3ZzRnlsUXFKVVRabVNmQWJOSW5OdnZaN1Rtd0x0bndJ?=
 =?utf-8?B?Y0FTcDdLek8wWDc5V2E2OHlVOWdaWTYxTlFYWmd0dkhrM2dSRG9WbmdMSitZ?=
 =?utf-8?B?bURjNC9FZ2FEVW54UzhwNlZWY0ozOUcrQTJmY1FCTFlodytXT0N0dWN1ZEpE?=
 =?utf-8?B?OTlaS2tmQS9nZVZGTW9KSE11b1NKRUd0THBDTEJST2N3T1Y3enBCcWQ3bGZ3?=
 =?utf-8?B?OVp1LzlkeXcvVkpkenFkSmhLc083ZHVUUU5aVkNKb3FoN244eVNvMXNJVTR0?=
 =?utf-8?B?YlNQUlQwNS85aGEwTTJrMHBneENRZnd6VTBvRlA4SUpwRUhxdW0xMVMwdnEy?=
 =?utf-8?B?NDd2L05sajlkOTRLeE5WaW5aV2RyTFlBSExDK3QwTXJGeDBvVktpT1RqaEhj?=
 =?utf-8?B?cFROMzM1YmkwV0lFcGtCSU9xUThPTmZ6RnRtNUh5SnhqcGV6NVh0ZWRQWkRw?=
 =?utf-8?B?NUpYQ1E0RWxKYXJ2eHpNanhERVM1b0pCbmN2QS92VnVBZjVVdGNPWTZlN25t?=
 =?utf-8?B?OHZuNTYyMXh6cUNrZGlobnhONTNTWlRpN0NPNGsyblNxaGNJa0Z2eDlrOTFK?=
 =?utf-8?B?WjR3N0crYWhVdUtycGsxZFNyaUJGTmNiUUxpN3lIVFlTYjVQV2FzRzdteUpa?=
 =?utf-8?B?VGJwOEFLSjFuVzMrQms0MHBrRnpEUy9kSWIrNmhzWDMrRkhBLzhxNlRYd3Fl?=
 =?utf-8?B?RHN6c012VDRvbVJkYU5IK3lRci9ocXZycDVDbHlJK2Vhc0RCUmFtdHBjUkMx?=
 =?utf-8?B?T3ljQjJaeEdYMUdIOStQQjgzN1BjTTJWRURZcGJKeGp4YnEyVlo2aDVtOGVZ?=
 =?utf-8?B?MXQvang2M1hvV3M5MjlRMW1XL1NGM3N5cVhDVmJoUHBrWWVNVitiNFJsNFo0?=
 =?utf-8?B?OUJINks4cTBnVlVFK0J4OVBBRGRFTDk3MlpWYUxMTXo4U244QkZXd0g5Q20r?=
 =?utf-8?B?YWJ4QVFweGlUcXVZb3JjcnBLOEVQMzRNUk91ZXY1NVpjRGJJL25XWWNMOTkz?=
 =?utf-8?B?blhycHErL2FVZzBUVXZSV2JvK0lBRU1ob29kazhvR3Z5K2JOTFFLOEtrdzNt?=
 =?utf-8?B?Z3RIZklRcmM5ODlrVE9zWnRKOWEzdnVKdkdoZjUySWgxN1NZM0NNckpHZ3Qw?=
 =?utf-8?B?WkkwaFQ2K0ZDV1RDMVBmWGVZWDU2RURLUEloeW1GQUUwNTNIZ0J4M05qRlZp?=
 =?utf-8?B?cHFsbUpQQ1RaNWZnZjFJNHkycFJCWmlxUWg4TWNQK240b3ZEZ3BlZFN3U043?=
 =?utf-8?B?NWFCWkh2K3BXRFY1cDM3MWs4dnVkRXlhRDJkV2NVaVgyeHYrSjdoZXFnN0tv?=
 =?utf-8?B?TDhqaUtINjBJRHBIMFlYcjJERzdWZ3NCS09yOE9ZcmhUbXZyZURhTEJ1WmVX?=
 =?utf-8?B?YWZLTGNVSnkyeTNxL2lnRldHUXRPNzJ1eC8vK2NKbFBMTHorQUZSTGZzRW5M?=
 =?utf-8?B?blh5NkdmUmhJUjZEeEJHSDU1WUV5MFBOYjFxUFdZMjVsTWFSZ01XMmRNMG1K?=
 =?utf-8?B?WG9kRmVlNzJsQWRXd1F5ZUMxRnhyZjFNeHRDZzFFRkd2dnVxT1k4M2JPbTdJ?=
 =?utf-8?B?UkhlTXB2RDcxRnJiajY0ZGpoME5jY0w5WWhSM0RrcGpEcHpFanV2UnY2MWFj?=
 =?utf-8?B?cVVkSHU5M2VMWS9mU2FrcFhIdXVRYmp2R3B1RlRlT2tGNHhnVnI2OTRENk1i?=
 =?utf-8?B?MDlRdnI5Tnl6eGdOZ0R3V1ZvQjZPWGdPbXF2TWhxMmhKZUtxM3Jha3VLNUVY?=
 =?utf-8?B?ZTJLOHhjMCs4Rk5KUEU4MktKRlB2aHp0eEF6N05NL2pWdjVPSHFZY3NLWVhW?=
 =?utf-8?B?MlBwVGlZV1VBNTBQdmxObFYrMEZVMFVaTHNZcko2L1p1ejB4TDFiRnRJVHlt?=
 =?utf-8?B?S2JoK3g5aGVNS09CM3VHOFpvUEp3MXB6QkZFaTl4SWxucjQySzVBNFNmeTFJ?=
 =?utf-8?B?RG1yTldNUkZDb0trSmdCMDJBMTdQdVNPbHp2TUZQa3FPMnUrd2ZwdzF2T0Vx?=
 =?utf-8?Q?EiAgSRaac/Y7Nqu9k2GDDpg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33624a73-541f-47a8-fef3-08d9ea54119a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:08:24.4420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnXtRdwXumbOzgziFkkZtCmzTHwXT1+GYpQnYmxCDfv80X4q4SfMjwpwcUbVDX36FGCKdVe4fVXrjFs5gB23LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5969
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 04:26:56PM +0100, Jan Beulich wrote:
> On 07.02.2022 16:11, Oleksandr Andrushchenko wrote:
> > 
> > 
> > On 07.02.22 16:35, Oleksandr Andrushchenko wrote:
> >>
> >> On 07.02.22 16:27, Roger Pau Monné wrote:
> >>> On Mon, Feb 07, 2022 at 03:11:03PM +0100, Jan Beulich wrote:
> >>>> On 07.02.2022 14:53, Oleksandr Andrushchenko wrote:
> >>>>> On 07.02.22 14:46, Roger Pau Monné wrote:
> >>>>>> I think the per-domain rwlock seems like a good option. I would do
> >>>>>> that as a pre-patch.
> >>>>> It is. But it seems it won't solve the thing we started this adventure for:
> >>>>>
> >>>>> With per-domain read lock and still ABBA in modify_bars (hope the below
> >>>>> is correctly seen with a monospace font):
> >>>>>
> >>>>> cpu0: vpci_write-> d->RLock -> pdev1->lock ->                                                  rom_write -> modify_bars: tmp (pdev2) ->lock
> >>>>> cpu1:        vpci_write-> d->RLock pdev2->lock -> cmd_write -> modify_bars: tmp (pdev1) ->lock
> >>>>>
> >>>>> There is no API to upgrade read lock to write lock in modify_bars which could help,
> >>>>> so in both cases vpci_write should take write lock.
> >>>> Hmm, yes, I think you're right: It's not modify_bars() itself which needs
> >>>> to acquire the write lock, but its (perhaps indirect) caller. Effectively
> >>>> vpci_write() would need to take the write lock if the range written
> >>>> overlaps the BARs or the command register.
> >>> I'm confused. If we use a per-domain rwlock approach there would be no
> >>> need to lock tmp again in modify_bars, because we should hold the
> >>> rwlock in write mode, so there's no ABBA?
> >> this is only possible with what you wrote below:
> >>> We will have however to drop the per domain read and vpci locks and
> >>> pick the per-domain lock in write mode.
> >> I think this is going to be unreliable. We need a reliable way to
> >> upgrade read lock to write lock.
> >> Then, we can drop pdev->vpci_lock at all, because we are always
> >> protected with d->rwlock and those who want to free pdev->vpci
> >> will use write lock.
> >>
> >> So, per-domain rwlock with write upgrade implemented minus pdev->vpci
> >> should do the trick
> > Linux doesn't implement write upgrade and it seems for a reason [1]:
> > "Also, you cannot “upgrade” a read-lock to a write-lock, so if you at _any_ time
> > need to do any changes (even if you don’t do it every time), you have to get
> > the write-lock at the very beginning."
> > 
> > So, I am not sure we can have the same for Xen...
> > 
> > At the moment I see at least two possible ways to solve the issue:
> > 1. Make vpci_write use write lock, thus make all write accesses synchronized
> > for the given domain, read are fully parallel
> 
> 1b. Make vpci_write use write lock for writes to command register and BARs
> only; keep using the read lock for all other writes.

We do not support writing to the BARs with memory decoding enabled
currently for dom0, so we would only need to pick the lock in write
mode for the command register and ROM BAR write handler AFAICT.

Thanks, Roger.

