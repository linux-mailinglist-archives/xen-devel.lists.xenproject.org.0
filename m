Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7F54393B2
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 12:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215719.375077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mexDZ-0006tj-I0; Mon, 25 Oct 2021 10:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215719.375077; Mon, 25 Oct 2021 10:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mexDZ-0006rw-Ee; Mon, 25 Oct 2021 10:28:37 +0000
Received: by outflank-mailman (input) for mailman id 215719;
 Mon, 25 Oct 2021 10:28:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2Ub=PN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mexDX-0006rq-Pj
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 10:28:35 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e5e05de-357e-11ec-840e-12813bfff9fa;
 Mon, 25 Oct 2021 10:28:34 +0000 (UTC)
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
X-Inumbo-ID: 4e5e05de-357e-11ec-840e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635157714;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5UHVpvbxo9aGSH86YC6ATiW+DPi/Zal1+tYeb4QXDKc=;
  b=N2o7r5llhuQixcs4LSTiv7feR6C9068zuRMWiEa9tBV3zitxv3ozs701
   jOSWSi4d2BAKMRc6lB82QOXBtf9rixIahOQAm2hM+eg6DL2TGQmkKragG
   EQPBEsQyWA4/NTIfqrFGdIvVkS9djgOfkApM0roRPIWxmT4R9suIfmx3M
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dp1lQhuESu1f1gcqPbZnKoPGkN7OEfOTtlW3bbdi3EEk7GaTaVqgngHwKGGcimVXykgpYy1trP
 Wpa6GiVABCmHu4jh6JreCgDHGJX5Go4fi+8fdDyUt8XDwp0iOxzXY15rXz5jsM4jKgAEdIWwKR
 BJa6Uey9WbRadM3fgZGEGoy0+0p0Snmib1HRIcttkgdz+lV+i1ct7iwz/rHZJXFgJJ7MzU/uK6
 iyE1yBmjcp/TqkYHUlvXR0Eef0SwuT3asxGH7yL6rIMUbcEgsm3rWeMTtk6WmCxCH3oeSRfUf2
 +JsR+15tNHHNM7QemGVvm8Lh
X-SBRS: 5.1
X-MesageID: 55524042
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VB2lKKspjjWsjbDtRywVs1d6JufnVLRZMUV32f8akzHdYApBsoF/q
 tZmKTuAOq2DZjT3fNwkOom0p0gB7ZXTzd4wGwE5+SA3RH5H+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24ThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplkZefclsXBrHwv9tNUCNUKhNzJ/If5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY250TR6qGO
 5BxhTxHNAmaX0JTfXgrFZdhkf/2rEP2XDkItwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 kre9nn9KgEXMpqY0zXt2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyyKSKVNYcAZdVPsZ5MwMSQUY2
 0XWxsy8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNps1kyXH76PBIbw14evQWihn
 FhmuQBn3+1L5fPnwZlX6rwub9iEnZPOUhIurjveWmao/2uVj6b0OtT2tzA3ARtGRbt1r2VtX
 lBZw6ByD8hUVPlhcRBhp81WRNmUCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hSO4FsJvs4LZCH6BUOSX25XI556pUQHPY+9Ps04k/IUOsQhHON51Hg2DaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPFGN8tbQrVBshkvfzsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBiVMCo8JQMLbDSSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74mxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:rsQMt6qWhlGyS8+4i1wCsOoaV5vNL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QD5SWa+eAfGSS7/yKmDVQeuxIqLLsndHK9IWuv0uFDzsaEJ2Ihz0JdDpzeXcGPTWua6BJc6
 Z1saF81kWdkDksH46GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 T4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRsXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqrneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpn1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY/hDc5tABCnhk3izytSKITGZAV3Iv7GeDlMhiWt6UkXoJgjpHFogPD2nR87heQAotd/lq
 P5259T5cNzp/ktHNVA7dc6MLiK41P2MGfx2UKpUBza/fI8SjnwQ6Ce2sRA2AjtQu1P8KcP
X-IronPort-AV: E=Sophos;i="5.87,179,1631592000"; 
   d="scan'208";a="55524042"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fykzw09+ShlFS34wtNIzZRAe+kNVWIMdNCw1XsRg4TtXAIN4PhiXQl1QEE2nbIOg/JS4hDDZXvwWt1I00jAv1xd4WnImAVtWaJHEYBdheMRybHondF1sJWViFYctcPSe2Xvam4hnfN1Ize1Q3BCyaN093KAcpdB7V031EYPzp3jSy3v5hRauuqmXMsSn5I2TTD5gYL8Cw8VDY9bo/HUhcEe3XzPNDMRmY8+goxS4bNMKuFbjKsZnyKRcECdqLx+4GXxi/m97d61gZGI85S+8D5SeoOrmTNQvWi4VOQI51r3T5Kr8sIs1GP9RhzQmvG+5z1JTvS++C9LL8ti5/59gbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVjYceLCBK5cDUZH41XgQndwcnXLlc4EB6C4hRmB6Qw=;
 b=FCeOfvv/iK5jfnIFdtO08pRrA3Fzj5R0KJYNvdKkTBzV6Rk6difQmBQlasDvutT2UltUaHWlN+nUPB23aHba2IhzDA/5wgdo83CN8Dfzc530LotP95MZrW7cjPDf9bUbDO2199JAVHQI2us+eadlYM7nrFQV4LKz78kjd5U11jcWeUT3YKEALejbGOWMpfISUYvNGaPYaqJAwtoLaDCBg3+yMThyle1lBoUCC07gbGi/aGbuZZJGbl2Jjs/r7uZO36Ngz/lG0F0VRSUtDl1ZMhlwiGnvrsJOyxi6pdbm9lFnkjC2EhVn2A5Loef3Prd+pEOrkk3pSCQ5qXxvyAbswQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVjYceLCBK5cDUZH41XgQndwcnXLlc4EB6C4hRmB6Qw=;
 b=Sgf32TJ26yKiJMWGI5F6MisiehdyeuMIBQNL3iFiK1oMH7eAbSHjj2cUwH9WLsxwW9lqUL2naEmHHvFIC2h8dRS1PYp3YSPYOwS0HzG5AeXrh7cei2TgXn24nMte/j7+LyqaE2YVJinG16IEefhWPxW7I/07/gotxwuWiz6Egcw=
Date: Mon, 25 Oct 2021 12:28:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 3/3] AMD/IOMMU: iommu_enable vs iommu_intremap
Message-ID: <YXaGxX3J1aB39mSG@MacBook-Air-de-Roger.local>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <ff7b68b2-5bba-2927-e3f0-f3062862c466@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ff7b68b2-5bba-2927-e3f0-f3062862c466@suse.com>
X-ClientProxiedBy: MR1P264CA0138.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 613bf886-b190-42cf-68ec-08d997a22e9f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4603:
X-Microsoft-Antispam-PRVS: <DM6PR03MB460322250C5F32CA58DEAD618F839@DM6PR03MB4603.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: erUoeE+Xp6FdC0sip4Bm/nvXj9B9cfSNWcA/UGFQQE9qbkbN4W3cqLnBQHyBV3ehLPrn0WEYxNnM1N0jyt5sjIuzE0jcveXqX5inSJ8aoatJVpmuJgQOlsEox4IUwFS+hi8CVILn3DiXt0nQQR31MIE0c2QBpBhMfKV71tn5fW7VzgxrkAek4O4dqV6rA+1FdMhoB2qJ+rlfRdUk+R4oOgoKY3OzLkCG7J6OsEpoiqAaE9tUcWXjtcIcirEcJHHTSqr9hkw85IPRl68Er5xSz5gpSo0q+LlvEFcXwAjWv6Vz6OrfPTL6tY3pNElA8/t8+v+1eFM4JMzsa6wUO7MUOgnQjF6NX32lROVabINJLF1+Zi3n6x7RkC92WGrzrqvnGbC0mMJhpdEWvuLKo6FXGrdgQxw/oVynzfE7b9loawAIdJZxARQKgZchwR4Z0eq895/A+cNW3J6DhFu6RuT4mp3npwPA3sbXCdCeOamZ+hwAkKoUiYI3GFcB8CCYa5p8I4FejJsgInLKhWob2W1+xVMYXtUsuSSu/XdJ/F4N50vtcKo8MIIFHhfveFHF5jxaYJ4X5wpXO9IGhK/DBmhUygMX6GJRyT81CaDvzvWSyc8n1EY+LI/2LdWm8SuQgAdYhHkmq1OBQoXp/vnZmq9ouw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(38100700002)(6916009)(86362001)(186003)(6666004)(8936002)(66946007)(26005)(508600001)(83380400001)(6486002)(85182001)(2906002)(316002)(5660300002)(8676002)(6496006)(66476007)(4326008)(66556008)(54906003)(9686003)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1hRSGZJNVlzU3RMMmt5WXVad01Ybjh4c05hc1dQc0xtSEM2dTNERmhwa05B?=
 =?utf-8?B?bG40aHVCUkpOWVVhNUJzempUNkpRTFh1Sk5nTVVsTTI5eUJ6Q2lKN3NNZXFJ?=
 =?utf-8?B?c3hVY0pZRk1WbGY1SlczalExVk1qUHdiS3FLY2FpR0pldmlUdElSYkIrWmZT?=
 =?utf-8?B?dnVBRDRNSm1SZkdIL2p2WDFncVVGcUhXOW9pU3ZaNnFTaGd1dVJTVEtGUFh4?=
 =?utf-8?B?WThmSU9lZGlXZTJIZjZvUmNtbU12WlFXbXdNdWNoZUg0MVhaSWptVC91dGM5?=
 =?utf-8?B?UkR4TTJmWlR2cDFHc3VWdVJQdFY2dmR2K2UwUC9uRFE0U05iNlNkYzFRWmxI?=
 =?utf-8?B?UEZPNTZRZW5GbDNEZm9INE1yb1pvUjVQUjFjSlNDeWlTRWxvRk92MUFVSWxO?=
 =?utf-8?B?Z3VCVjBYaDBIbnN0WC9iUUxsZ1BNYlBESEJuM2ZyMkdwTnFSbXdQakdRazBW?=
 =?utf-8?B?Z2VYT0g5ekFzQ2FpK2FlejJ3d3RPWHQxOU1OSzZUa0xYZjV1MnVEb2llejZt?=
 =?utf-8?B?QjFFY2xIc0wreWdjcFFNMjJieWlpamQ1NzNkMno1aS8wRkVYTTRNMFdEWEI2?=
 =?utf-8?B?b3ZMbGlmanY2aW9DWm84RnllQ1BtcFlJYitEazFyQk5qbUllbGRDNENQaCtT?=
 =?utf-8?B?c1I1T09lTjlscjJmQ0pSVTk0MVdhMTlEdnpaNkFEcW9NVE9HNnNLbTZJWTFy?=
 =?utf-8?B?NjNCVkMyLzVzVkQ1aGhRYUQvc05RUHBkZXZ3T3l4N3phR0JUOVp2bllIUzBD?=
 =?utf-8?B?cXQvMklaMm1qVzQzZ3dFSFBCL1dJVUhLbnYxSDE1ZlBJUk5EdFdaMEtLeXAr?=
 =?utf-8?B?clpOUWNnd1ZSczhjMUo5SS9KaDU1SkQzaUhMN29TSFk3M0d3M1JNOElBZCtK?=
 =?utf-8?B?Tk9PeS9jV2ZBVS9kRVI0L2duMXJEa1BMMFFPMXJTQjdxV2djK09MRHRrZjBU?=
 =?utf-8?B?dE0xQ0h0SENNZ0xMOWt3aEtYUmxJWm4wSlBpMHYwT0QvOVZLcFQxMmFQek1p?=
 =?utf-8?B?MjhJaGVtVHg2cWt0ejZBdEx1cWtBMjEwZWxITTFWN2NuYTJUeVVRV1dvRTdU?=
 =?utf-8?B?V1BDOGlWcmtkQjVlSjh0T2JacEVZemxsY0ZOQllheGp1N0RGdEE5c3hJSHM5?=
 =?utf-8?B?c1N0RU5FdnZ3c04rRXpCUXRaazh3VSsxd2dnWjM2UDM4SmkwZnpBL1RWYU1k?=
 =?utf-8?B?Y3R1T0haUTVIQzlZN1V6ZmZUU3U0UklaWHRCUzkva1FLa1IyNVBHd29lcFdN?=
 =?utf-8?B?TGtKOUU3VFJpKzdSa3ZOU1VoK0kvZlRNcno0V3JrYkh3N2JBamw0MEVsaVdx?=
 =?utf-8?B?UjRBQ0ZZK0RVMkpscUkxOE44OG1UQnF0d0RhVkgyRUpCOFNJZlhnTTVUcTBv?=
 =?utf-8?B?WWprOVo2VlgwTXU5TzBYbGVTTWdqY2pBaVpOWkh5bTdXWUEzYVRMd1laME1u?=
 =?utf-8?B?ZzFnK0lUeUVydHQyK0RMSTlFOTRsZTQ5ZnhCN1F4bm16OGpQbUo1ZGxkNlNu?=
 =?utf-8?B?TEtvREhjNktsZmFMdnhXSWVDV05uMmNwQWVCcktYWmJhb0FiLzZxUUhHT2hO?=
 =?utf-8?B?c1lyS2x1cGl4eVd0Qnh4SzNoNndMZzZWRGhXRVVlR2g3aXBZVm9STHhvV2RH?=
 =?utf-8?B?MTFkSGlxQ1dnQVJvREtHNHpMcERJZVNPVlkzdSsxb1lVMTJLVGFucVJuQWpB?=
 =?utf-8?B?YTY5REFiZzdLUHZNSktyaVJ1UmJwSzR6RnNncGIzOXBUVUhRSHo2YWExMUFH?=
 =?utf-8?B?ZTkvcmxCRXN1WWhXNjB0eGpPYXR3cDFGclJRbTdJWVdiZGZiVHVZc1pROVVK?=
 =?utf-8?B?Z3dMTEkwa2lzSVdMQ2pEbWE2UmZBdDcvTytacXhnaG5Tb2wrWFZOSjZrWkIv?=
 =?utf-8?B?QndWN0pEYVhUZGtpRWNxYWN2YXE3WFZFQVVMZzhlajBHMkczdWc1TWFPQ0xR?=
 =?utf-8?B?UzJkZkVHSmJrbmJ6dW9lWnYrTmR2RW0vTXVoSUhsSktWMGpTY0RNU0pQYXhC?=
 =?utf-8?B?Q3IwZGJlbDZhMFNVZzFVWGhpNXQ2bm9ySXVSYXlCWjdhRWpxQnhQMWZaUFE4?=
 =?utf-8?B?UTNjV1ByL0x3UzlDakgwbFV5ZTlpNnNZaW1sWC9Xei9uUlB2Z3YrS0tHRzVi?=
 =?utf-8?B?Qng3SFkvMnJuTmF1MkxZU25uclYwTkRFU2pYZjBVK1BWejlHMjJWNzZwVTRt?=
 =?utf-8?Q?YadLPNVPjt8k+8KZI3AYp6g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 613bf886-b190-42cf-68ec-08d997a22e9f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 10:28:27.4521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkIwaxD15YzCfZVviQ3QSXLSYiPSeAvtH27hclQ+lQ9RNf1Z9dLfQ5fJVyVRBvi4WE6MS3fb+8Q0kJCl6hHmEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4603
X-OriginatorOrg: citrix.com

On Thu, Oct 21, 2021 at 11:59:02AM +0200, Jan Beulich wrote:
> The two are really meant to be independent settings; iov_supports_xt()
> using || instead of && was simply wrong. The corrected check is,
> however, redundant, just like the (correct) one in iov_detect(): These
> hook functions are unreachable without acpi_ivrs_init() installing the
> iommu_init_ops pointer, which it does only upon success. (Unlike for
> VT-d there is no late clearing of iommu_enable due to quirks, and any
> possible clearing of iommu_intremap happens only after iov_supports_xt()
> has run.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In fact in iov_detect() it could be iommu_enable alone which gets
> checked, but this felt overly aggressive to me. Instead I'm getting the
> impression that the function may wrongly not get called when "iommu=off"
> but interrupt remapping is in use: We'd not get the interrupt handler
> installed, and hence interrupt remapping related events would never get
> reported. (Same on VT-d, FTAOD.)

I've spend a non-trivial amount of time looking into this before
reading this note. AFAICT you could set iommu=off and still get x2APIC
enabled and relying on interrupt remapping.

> For iov_supports_xt() the question is whether, like VT-d's
> intel_iommu_supports_eim(), it shouldn't rather check iommu_intremap
> alone (in which case it would need to remain a check rather than getting
> converted to ASSERT()).

Hm, no, I don't think so. I think iommu_enable should take precedence
over iommu_intremap, and having iommu_enable == false should force
interrupt remapping to be reported as disabled. Note that disabling it
in iommu_setup is too late, as the APIC initialization will have
already taken place.

It's my reading of the command line parameter documentation that
setting iommu=off should disable all usage of the IOMMU, and that
includes the interrupt remapping support (ie: a user should not need
to set iommu=off,no-intremap)

> ---
> v2: New.
> 
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -731,8 +731,7 @@ bool __init iov_supports_xt(void)
>  {
>      unsigned int apic;
>  
> -    if ( !iommu_enable || !iommu_intremap )
> -        return false;
> +    ASSERT(iommu_enable || iommu_intremap);

I think this should be && in order to match my comments above.

Thanks, Roger.

