Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E84C269A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 09:53:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278025.475044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN9rx-0006Pg-Qv; Thu, 24 Feb 2022 08:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278025.475044; Thu, 24 Feb 2022 08:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN9rx-0006Mp-Nc; Thu, 24 Feb 2022 08:53:01 +0000
Received: by outflank-mailman (input) for mailman id 278025;
 Thu, 24 Feb 2022 08:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gX/V=TH=citrix.com=prvs=047ddeb39=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nN9rv-0006LK-Vy
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 08:53:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28d2dd0d-954f-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 09:52:57 +0100 (CET)
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
X-Inumbo-ID: 28d2dd0d-954f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645692778;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QFtYiwqGKrxsokiVRlNx+Fyl2G/YwI/C5+xbSq7EDyQ=;
  b=MG2YLeF4fE2M7v+nadgkLDenVyCr3JuQMvJe9KHSmdrKRiyjSIe0+mbO
   A6+XFgA5z8lS524VMU3KUOQTKcVFa365ONVt8WVfxj0ddZYBdB1+g/dZq
   edIBRpaf2NlypmLVrKs7lyhynFErqdjkbuk6IgZb/6lF8tfujNoOZjE7B
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64887340
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XiZuSatxwydn6nELnuBS1XMzBOfnVHNeMUV32f8akzHdYApBsoF/q
 tZmKWqOOq6PNjake9l2a9u0/EoG65fWzd5jTARo+3g2EHsT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQzy4bVvqYy2YLjW1nX5
 YuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8JJO78xOYPcCVfDhs9I4xp/YLEJnWG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 5pJNmEzNHwsZTVCF3Y0Fq4RkNuUm0H7KjB0llS7o/c4tj27IAtZj+G2bYu9lsaxbdlVn13ep
 3mA9jz9GRYcHNOawDuBtHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWFTGWs50BGHYAKSqtjtV/LmvG8Dxul6nYsbiQCWIAkpuwKQiEQl
 UGosNbUBjtiiejAIZ6CzYu8oTS3MCkTCGYNYy4YUAcIi+XeTJEPYgHnFYg6TvPs5jHhMXSpm
 m3R8nBi71kGpZNTj82GEUb7byVAT3QjZio8/U3pU22s9WuVj6b1NtXzuTA3ARutRbt1r2VtX
 lBZw6ByD8hUVPlhcRBhps1XQtlFAN7fbVXhbaZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusMOYifwMfUsPNrqYyjP8UQGPY67PhwzRoATCqWdiSfdpH0+DaJu9zqFfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9rxIpdwrh3SMVj7HMihpzz+iOL2TCfMFd8tbQvfBshkvfjsiFiEr
 L5i2z6ilkw3vBvWOXKMr+b+7DkicBAGOHwBg5YJLrXaelI+QgnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTZ0TA4X7AN6AfXLuS
IronPort-HdrOrdr: A9a23:n0AUpavR9DdeJyMd/akZm1UO7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.88,393,1635220800"; 
   d="scan'208";a="64887340"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHaC65uYW1ZjA8MHlZvtfHtvhh1o+ukBNZlXBpxMgeFcYvkq+uA5FbKUkOT2pxUcLDCKa+55LH9jvZ17Jgj0ZYaSNTkOESoqfKAU92UKVLZJwTwN/ZGoiIkrhIxFE29IZKHSdC+kwZdnDeLc/K4laLQ6H0hQ8hjfvIgIk0ib5K7VIf3LGvgHb1tB22Qm2a3jlsnEHohFpr+6npYPrDZcyBt+SIV/YmYa1TyziCz6mfWRU8EDONmIcY8tFnPMoI3imWPuMFowKFvXKCT4wcN2DfH+kOkGc4LPjSuOvjzgd/pz5FhaZBNws3ziyUx464ac5dLU+W1HngeX7QKIoNkxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muXJK6EoVtkgr7j9P3+dhgM5a16YrMk6iISD3fXVho4=;
 b=TGnNU8bUzw7JTP1FyaLM4b0qmdq5/dN+OkgSjAO5jK0BxPpIlS0tksfdrYrG6PkwMHmhltNmhfw0+23u0qtTQVHipnBgM+u87UfJHCA9NNwQ+tBuAKp4H5u1vhD2LsV9ZqWIp/n+qCIEkriQtdQ9vfYvwTR5Vypwx/5ERV+b3T3e6Cwrbp4Vjr0P4d6WkY8rGoL8GtMGYO5GV1/rlCd6DgPU8MViD7fxXBdAXffe71IINxwYxU+UM32cVhfxNFIgIbIUNxZz70/lDRv+Sq7GrGInW9lFAfEjfi9xVMX5M3ngv2CawEM5mEDA94Hiv6ZMxEhZj1/3P7IYWj+L06Wf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muXJK6EoVtkgr7j9P3+dhgM5a16YrMk6iISD3fXVho4=;
 b=LqYf4mYp9U+YBamoV02ijGEpQE6luQlJW0KGkABZEJB/MBesUk/b49Y3taHcEZmV3QE+vlRBnub0kBi6vPmMdE+E1M4a2vgrwyRYxmPxXFKAUBc9P8vcSiXUIKK2p9Ec4Tz1PHGYDKkhAQWDFR09OvvRGzNhMvBpvKW2mYOAbxI=
Date: Thu, 24 Feb 2022 09:52:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Alex Olson
	<this.is.a0lson@gmail.com>
Subject: Re: [RFC] Avoid dom0/HVM performance penalty from MSR access
 tightening
Message-ID: <YhdHXc9zF1vnlYF+@Air-de-Roger>
References: <949b4776e23e4607776685a7e2705b9e77f5b717.camel@gmail.com>
 <a1099ae9-9e0d-cf54-e786-835c13f2ba40@citrix.com>
 <d11e54d47776008c17762458e6abbd44ab0beed5.camel@gmail.com>
 <YhZcxkY/BgPy/MTh@Air-de-Roger>
 <40942f98-5caf-43b8-5763-81b59a7b800c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40942f98-5caf-43b8-5763-81b59a7b800c@suse.com>
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27f0d4aa-e87f-4b73-6bcd-08d9f7730a63
X-MS-TrafficTypeDiagnostic: BL1PR03MB6088:EE_
X-Microsoft-Antispam-PRVS: <BL1PR03MB6088AD23C448FD94570130228F3D9@BL1PR03MB6088.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5eDBEgHqQv88iNoPqspxeXItW0n3EjTsSoIFOpjDbLJQItNjQQO61EhakF3uOmcCnsyQcFW0j6BnV+GfJyUbaWp7/v/8qG8RztJJOQdVpoI/FX4NY7ED/9MhieYQIpFDBPSHcWcAmm47ZoKSsbxs1OsR40lVqHSVFt7O2atSpSFq382BYx9kmX7K6nOT/lguhDyTTwN2KC/qhg+WOV4A1Fp22Jk7UVErO+E/ENdUk/233V7zKKtMJJJu6SulLJj7aVpFlnqpvt3zY6+pF/PnfmL3nyWnAs2WE3WgyoTzQpuVke3Mn1DRNa7NvUZjl2bMNicGCi6rY+aURuRlvw2Kfp9I6wa4DNSQf6KVpz8AtoD5DOkiU0gAIuWKIftnEqY1LqypiiM6j9DE8UVb1WZuMG9EwL3NBrug7IUWKij2uBlVlf9oVslxzMEF6P0akN7tdF2mRA5lU+XE0kTXsGexVHkkv7OR6wBbLsP9EqIo2puroeam3xHhK66vp+kho2QQtrjkkx0Ib2GXsdH58AgZLF9DqIS45VlqqpvrugKZZXOZuRzAgiOTBpqvxaoI/8R580slqujNJeqXTYmpPZStGxm05vgb6RoNbbcvRiwi9Pc3NQhO43nR3CYYUoEIQtcC4wL+Foytf1usn4i2i5/Tkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(85182001)(33716001)(54906003)(6916009)(316002)(186003)(26005)(6666004)(82960400001)(6506007)(5660300002)(83380400001)(2906002)(6512007)(4326008)(6486002)(86362001)(8676002)(66946007)(66556008)(66476007)(9686003)(38100700002)(508600001)(53546011)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk1zTTd2VGJwWUdKL1cwNE9MZGd4OVp2RC9wdWVnVVdOWGwyQkxQOHgrL1gz?=
 =?utf-8?B?Nlo3MXl3eFcvK3lwYnZKNldyRXRRWndsQURjMzkwZkJTRVZZSDJlOUhZeWlK?=
 =?utf-8?B?NXE3VldoaXFHNjJ6NjJiZ2dtMDVjV2hRbHR0dG1IenRGZnRLSEtNZXhrc3hJ?=
 =?utf-8?B?TW0xNWhOS2hpUXVOSGcrQmxaVFZ2a204RzFaTXYvd1ZnVW1NbFZjMm5hV096?=
 =?utf-8?B?RHVaMDVpY3pwSW5PcW9JeXBGMzkzQllJUlNMOE9VYzBUcERaRVhOUVFCc0ZF?=
 =?utf-8?B?UW1mK2xMR1pmbUZDYXpmOFlPUG9WNEpZMHVCbkE1T0twM0lHdUdDd0VNcTB2?=
 =?utf-8?B?Qis1b1A4VzIvOWZWL1BBckEzR3A5K1A1QTl5MTU0NWRTUmEvcFV0TkRwNUFn?=
 =?utf-8?B?cjBha0FMS2tRY2tvMkI2R09EVVBRWWs4b3ZVNGhhSzdlOEdlVVhuS1d3V1Z5?=
 =?utf-8?B?RlF1RDgzMjd5elpEU1N1bFJ3WnlONWVMNkZxcGRid2puRE5IM3JoSjkzVHNF?=
 =?utf-8?B?bllGUjZJRnEvTHhlRnZiaktOcVNLQ0V6Uy84ZW1WbUtaeXo5UW43bDUrVXpl?=
 =?utf-8?B?bXAvbUxJS3o0VVU1YWFTSGN6RGJ0d200cCtmMTdOWTJ1OXdnREgxd2ZqOW9E?=
 =?utf-8?B?cXNZOG5BcG5FL0VRUEJyRkdCZHFUVnRXUUUwUXIybXFVSm1VWUxuc29CaW16?=
 =?utf-8?B?WGZweVhKYlV2d3dxSVl4WnRySklnNWg4ZlYyMDUrWS9QVGVpVU1rMVJ3MEJP?=
 =?utf-8?B?SVphQzB2cnowajJHTHZNRWZpOG91Yk1wRU1BbUpHOVJJRW91OUJRT1ZEMWZw?=
 =?utf-8?B?MFd6QjIzWGF2L1dhRnRXLzVkb0g4Y21EVE9CVitLcEE5QjhOSE1YckxNWFNW?=
 =?utf-8?B?eTg2RXZSMkdEV3lDcDc2bnY1YU1EVDVtVERRWVBpVzFZcXBiemdKdDgzVnAz?=
 =?utf-8?B?eGJaQmNOaFZ1YmMwSE1lSVpLa051QnB1VHBnc3dLUHB2YVg5TDJVR2srYnM2?=
 =?utf-8?B?WVRTbkFSSUZlYm5RanpRMFB4cmd3bXdlaGVxV3FkUnZCdU5LTUE1NU5RQnpo?=
 =?utf-8?B?WWw1Sm1DY2NRTDZacXppdk9uZ2crM29TN2MwMlB0WEYzdW5mTGJSdWtLRU5i?=
 =?utf-8?B?ck10T1h4N2hYaFNtU25nNTlQcmdXSytuL0NSNVMzdFpVZFA2MGZYNTAweE5q?=
 =?utf-8?B?dDI3NWRBNnU1OStiVW1sVHd1VDAvUGFmdjREWjg1MGFzZEQ2UXBkNnQzdTF5?=
 =?utf-8?B?elpNaHRIdytHS0s2aWJlbitlVmE1aDZlYndvaWVqbnUrNlVNYm1SNG1LVE9o?=
 =?utf-8?B?ZlAzeVhHcnYwSFd1TGxNQktsekZsSmdaUE5qemZ2ZGdadko5bFlvRzRablVU?=
 =?utf-8?B?R0N1WFVlR3hQbFZYeHV3WFNEdHFlbTdTTU5SVnRXUmF6M3BuTEV4NVVrOVpp?=
 =?utf-8?B?bDZhaVlFNGVEcm1vVWxFU2gzbTRFdDZtQU5PSDZtbFJFUXZaMTRXbmdtMm9N?=
 =?utf-8?B?dHVGNHJlYmVXWW9hM2tRekxXRGtMcVFqNTh5TWRLQ29kc1VsWFVlaUVEUmFC?=
 =?utf-8?B?YkdiQWxUZjNIazhmZk1va1hRNXQ2VjU4RHFCUUFHSUNUMklXUEtRaG42a2FI?=
 =?utf-8?B?L3I1YnpEdm9obWkrQ0VHakMranJ4ajJzMkVYNkZCYnBPOElacXZzQzBydnF3?=
 =?utf-8?B?Sko4VDFwSzc1c29WTTQ1MTNtOHNTWEgzL0FQWlBpSGZwcHh1RitWNldWMzFK?=
 =?utf-8?B?Zkt4Ym9Lb3B0czc5bGVCY2ZRNUhuTDVXLy9kK05lYk1aN25TY0hneElEQzZj?=
 =?utf-8?B?MTVaTlI0V2E5cmRsbmZqTk9hMW0vcE05Nm1udUcyM2VDaDcxQmM0SG1rRTBV?=
 =?utf-8?B?RWd2d0Z6ZWxIS3V0a0x0cUhGbjI1cVlyeDlIVjFLdVhDNEt6b3FJTTBjeXI0?=
 =?utf-8?B?R010YWtIckRkWDJmTG5NRVIyZUROQWdHcEkrNWpFS1BDWnJZR2E5WmJzb21J?=
 =?utf-8?B?SWx4NjFwU29ZWlZmTmQyakdxd1Z3U0FHZ214cnBTeGlPWkhGcUVWd25TbXpx?=
 =?utf-8?B?b2RGbmxqdmZXaEhLWVkvOTAxUk96SlNRa1hIb3NwYkpRclBFTWZqYUs1L0VB?=
 =?utf-8?B?NnFFelZkd3ZuQzNCMGQ3c3BCV0IzSU5wZXBkcU9NYTUyV3k3NHkyaFZUNXlh?=
 =?utf-8?Q?/0wbWAio/QFiueJXHPdb49s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f0d4aa-e87f-4b73-6bcd-08d9f7730a63
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 08:52:51.9723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1W0GB6EtH96KF0PiiETtlnBUI+RGUGpKL3f9vpcFINpqu/oF4zuvKf3xPDbeBeu7CfvWWpZL46n2WHM4VvLV7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6088
X-OriginatorOrg: citrix.com

On Wed, Feb 23, 2022 at 05:31:53PM +0100, Jan Beulich wrote:
> On 23.02.2022 17:11, Roger Pau Monné wrote:
> > On Wed, Feb 23, 2022 at 09:38:56AM -0600, Alex Olson wrote:
> >> 1) For conditions in which MSR registers are writeable from PV guests (such as
> >> dom0),  they should probably be readable well, looks like MSR_IA32_THERM_CONTROL
> >> is currently one of a small number of "unreadable" but writeable
> >> MSRs.  Otherwise seemingly valid read-(check/modify)-write operations will
> >> behave incorrectly under Xen.
> > 
> > So it's one of those MSRs that's only writable when dom0 has it's
> > vCPUs pinned. We could allow dom0 to read from it in that case (that's
> > an oversight of the MSR handling rework), but it would seem better to
> > just remove access to it altogether: it's bogus to allow dom0 to play
> > with the MSR in the first place IMO, and it won't really solve issues
> > like the one reported here unless dom0 vCPUs == pCPUs and all are
> > pinned, so that dom0 can fix the MSR in all CPUs.
> 
> Dropping this is imo only legitimate if we decide to do away with
> "cpufreq=dom0-kernel" and alike.

I would be fine with that. I think the mode is bogus anyway: dom0
doesn't have enough knowledge to take meaningful decisions, and it
would require that dom0 vCPUs == pCPUs, or else it's only acting on a
subset of CPUs which is already bogus IMO.

Thanks, Roger.

