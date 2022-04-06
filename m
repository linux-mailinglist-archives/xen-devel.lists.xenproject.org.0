Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139BC4F5830
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 11:09:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299752.510911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1fJ-0004Bo-4d; Wed, 06 Apr 2022 09:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299752.510911; Wed, 06 Apr 2022 09:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1fI-00048g-Vl; Wed, 06 Apr 2022 09:09:24 +0000
Received: by outflank-mailman (input) for mailman id 299752;
 Wed, 06 Apr 2022 09:09:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc1fG-00048Y-Kq
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 09:09:22 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d08103d-b589-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 11:09:20 +0200 (CEST)
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
X-Inumbo-ID: 3d08103d-b589-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649236160;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+/q8LMKWQBwo7vUKafDQSgSd5VockUhKFgX9yElxyuY=;
  b=Z2aQgEbPZPSpvEeIBn1o8bCGSB+3Nlz1Dcjdvr750dG7Kd0YA5zywlUu
   HBPQ1MG0PVTjLGw04x9OSon9l1hXzrTjEHG9KMoRVU34G0RIpC34RvKGb
   naJrYOj43ZrdH7OyAPgUd4BjecYoI/UVwxSo8ANIhV6woUyw8C00s7ZUo
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68150733
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aDzzTavCmvGYf9ESg0eskg1/TOfnVLReMUV32f8akzHdYApBsoF/q
 tZmKWCBa/+OZGXwfIwlad7lpEtXv57Rn9QwS1Rqry1jQioS+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/V5
 4uryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8MHPTKl9UCVyVUOHxjGbBF0bP/GmGw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AN
 5NEMWU0N3wsZTVLa3MIBbMfwtuaxUj8KH5cqXmo/bcetj27IAtZj+G2bYu9lsaxbd5emVqE4
 G7P4WXiKgoGPcabwDDD83XEruPAkS70Qos6CKyz9vkshkaagGMUFnU+WUOgpPilima3Q99FN
 1EP4S0qsLQz80qwCNL6WnWQonSJoxodUNp4CPAh5UeGza+8ywSQAGQeXyNCQNMjvc4yAzct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi+QPu6lq0EiJFIw6Vvfo0JulQlkc3
 gxmsgAbpewVgv8U05m31g3apy+vj5TxdRc6s1C/sn2e0it1Y4usZoqN4Ffd7OpdIIvxcmRtr
 EToiODFsrlQUMjleDilBbxUQer3v6rt3Cj02wYHInU3y9i6F5dPl6h06So2GkpmO91sldTBM
 B6K4lM5CHO+0RKXgU5Lj2CZVpxCIUvIT42NuhXogjxmOMYZmOivpnwGWKJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35ilDqDGcCrn0T4itJygUJ5r59fbjNiichjssu5TPj9q
 Y4DZ6NmNT0BOAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+zvlOQwkc5wvq6ep5IeRNxv0N/s+Rp
 y3VchIImTLX2CycQS3XOy8LVV8adcsmxZ7NFXd3ZgjANrlKSdvH0ZrzgLNsJON9qbM6kaAvJ
 xTHEu3Zaslypv380211RbH2rZB4dQTtggSLPiG/ZyM4cYImTAvMkuIItCO0nMXSJkJbbfcDn
 oA=
IronPort-HdrOrdr: A9a23:HhOSsaDffCNW02HlHehIsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHPlOkPUs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QDJSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IXjJjVWPHpXgslbnnZE422gYzRLrWd9dP0E/M
 323Ls4m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUbqFh/dL5kUUtDPpZ1fSKWMB2FffueChPbHbzYfJt3T04l7aSHp4kI2A==
X-IronPort-AV: E=Sophos;i="5.90,239,1643691600"; 
   d="scan'208";a="68150733"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icm14drdwQEcEvfuaLoW4SEGAaijJ32oYzwCSeljtAUY+VO53y/+4Tgebhpaji7Juw6p1sr7hXm7f9BMjXgQhOsi3/4R8pLq1pLon5JpaGddQ5xjInh3aKQJ99XeSqpotgEv1+AlcS8iN1dl6RWcKZX7QBCIyorScO3L9C6BcKGLjw2EoQoH63VBJ9V3XGIwIZCxXiBjhvCF5f906a/tuduy9pA8dTSL6uf37GcIlDQ8wRhCWDiJl6OkAQ6FKeH804SNKxOYoO0/P/+0Nxrjt66dIhnwURcOIQT45m49hqzU6BmQv9uVi42qAYlocg8OBMXW8iduCmk3azCSDKktSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ki0E0TtXjHFVIPiYj6hRHXoysLy/KKSHYe9avwDFzQ=;
 b=bf9oWn2kw4FjLm9bmFQCyWOcYRlbyGLfEPHorgX4Ytx20IXvJof1Ys80P85+otTfuCZull5FlIcNijddh8nj7xEINV2LiWzt9/kJS3ytZwvUlcVbuLqKsMrIywOlMhaKeTLc9rTmvl/B1YlpeaMDNGYyPT1O1lrTi6vs4X2963bHGcHxrmRrKrTmvzqmaYu/B5gdLYNnicVNHhIBL5ICzVljGH1YTNMXBs+ndos7ozkcH18B4Fyr/0bJQdrhCJPJdaD7fmXOWVruViJbm1P9qYC5WaZBhdrR9uDZW0XKQ6hDgILqWyRvCBbO77W4MiumooK2IM6tPMxdHURI/dklew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ki0E0TtXjHFVIPiYj6hRHXoysLy/KKSHYe9avwDFzQ=;
 b=BdczxX5wmdJw8VNkQaz7G0V/9k9er+/sQoDGr2JAVNWGKPAVpUf8QcYSHzIjF1nc3Izbp2Y6ZW440JQrebDlP2NtHI6lrTFKzNZ48WaqG/9uCnLtwLccHqJTNIBc3s9F6OCrHgT+hRTi8H7yCIwdTTQwixFceiuE9j20q72nCrI=
Date: Wed, 6 Apr 2022 11:09:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jason Andryuk <jandryuk@gmail.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Message-ID: <Yk1YtHYzS3aAbQlr@Air-de-Roger>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <CAKf6xpuA4hQmPdBtmog1UFcSQQkXL2=+e5bmqeocesgNxqD27w@mail.gmail.com>
 <1eaf4555-5221-6cef-6c01-6aea3797e521@apertussolutions.com>
 <CAKf6xpv0LrmAa2A=dXXK2DSRh0j8ac9VM4aLBhTRK0MtnML0Aw@mail.gmail.com>
 <a4759948-d45c-df06-3130-f95aba05b555@suse.com>
 <Yk1Ta9ujHBuj+svN@Air-de-Roger>
 <dd4fce17-2625-603b-25d5-3a586a682210@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd4fce17-2625-603b-25d5-3a586a682210@suse.com>
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83f3cbda-d9fd-49b8-3da9-08da17ad1e60
X-MS-TrafficTypeDiagnostic: MWHPR03MB2847:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB28470DBDC5F1C12FEDE27BE48FE79@MWHPR03MB2847.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZbSo8Z/5fLtwWDhGqB+ws7NiwrFrWLDwkKzMhyfpENcDg3OA6FT/gSXO32yuxTIZsnHVxd/nX6G3Xejkp/YCpB+ynaVgV6TAPjFoBB1vBXQXCYpHy7MtvOkx+bgOTMT0zb2S4CTTUN599w2eo2zatRThbau6Krn9aBxXlm2Zf26ioU2Rqo0BsjbbdN6xAL4wgZQh4HV/1G0CRWC8/eYjST7zfcQzhyI6Ppq0yEV7CN3bBon3bE4jrsnRX7V4P+C6F8SiLrS7gpjANWbWhk8/yO/ClrD4/BRh4/HnD8t/Jne5bkj79BDsXInOWj1mAisc4B0WGM82WUOjwxhu2bxaet+8ywES1QNTs9fOJfAcd/qycN5QCe9pJxiHeFU9taSj6XODcBnqohB4hA5SCgRXaMeYjP3ng0jpmsLFbErS7uxOQs6hBtIf1LtnNTZBlLuOjkBdnbb6ztAeHyLoWflKQ+SJb1hElMWTiB5n/EvVgHUEauyw/lI6GuTfayDcFgXoFZlPZwRjzxonSj4v5wVkpEb/LCIpORLMU6x66RJq33XG45WOr/4kwEYxryax3QmaNCw8AEBLyswtzSOjn1XrlCm+HqUcDjChV5SkU2Po4I0FR7HcK+Kt4wzgB55Lh/P7elIM6jhFCVnjm9+PxpsTLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4326008)(66946007)(8676002)(66556008)(66476007)(6486002)(38100700002)(85182001)(86362001)(83380400001)(53546011)(6506007)(9686003)(508600001)(8936002)(82960400001)(6512007)(54906003)(186003)(6916009)(26005)(2906002)(5660300002)(316002)(33716001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjNnL0V4WVFJRmNMbHhiNnJMVG0reVIxdndGdG9JbmRLdFhjZzFJb1A2TzJo?=
 =?utf-8?B?RVpSQVBqMXZiU1FaZ1RPdksyWWFCTlp5dFVJNmREeVViRHhNRituWlhEVC9S?=
 =?utf-8?B?NHpvbXBmQVU4Z1cyOVVMeWhGVjYrN0xET2dQdWFYcytiaEErVGlWYktBcjUz?=
 =?utf-8?B?cXg2M0N6ekRMSE1sZXhnem5KdFdPUVdWdkZzakRpSG9xcVRDYU05T3l3TUN3?=
 =?utf-8?B?NFMwbTd0ZVkwTXU4RzZMN05lbjh6d0pRWDhWT1NpNkhoL1d2dTlzdU9la3Zw?=
 =?utf-8?B?MGI4Ry9EcGhuVEV2VWQxL016NFYzbm84QkpkNVB1NGdXL0ZkUEdPeW1wZDFP?=
 =?utf-8?B?UHBVRDdrWTdBZVRPRlplMzhIQjdyYmZ5V3ZZTGtMc1liZzBhYlNScWpRV3FG?=
 =?utf-8?B?ZVlrcjhkZld3QmkzNUJGUmFGaGVZVW4yU1B6aDdLUUlaYkZuRC84WEJqanlV?=
 =?utf-8?B?TVpYTWhwN2hVMU5sTHE0VnhyUmVoTTdqbmhVaVM3WVVKclJCckZWaVB3Z1J3?=
 =?utf-8?B?eG92RmJTRFRSVzlDa2hZMnlRN1ZHTG5PMzNSVElDMSt4bnF2M250T2Jub2V0?=
 =?utf-8?B?cGZ0cG5TVk8rR0xub0JFMk5Wa0VJTFhIemg4TVVKL2FndlFicVdRTjI1aURs?=
 =?utf-8?B?Q1lmRldkYWF5UTQvd3E4Mm5aNkhwUVhWczR0cGJOSThuTUtBelk4YmJaT21U?=
 =?utf-8?B?R1pDUzBtcm4vYlF5L0V0eWM0M0MxeHhKVGRQSHdRK0hkcUdRL1hXdzEwM1lH?=
 =?utf-8?B?Y09HNVlJdGw1YTFMK08yWDcwSG80eWVMSEw4bW1JS0psT2lnWTFyOG8rM0V4?=
 =?utf-8?B?YmJQeTQ4VTdOYm1uSmJCT0R2ZWJjRjRMZHY3QSt2M3JzS3dPTm5Fbzh3c2NC?=
 =?utf-8?B?ZC9ZYlZkQ2xvOThjMENaTTlxOHdDcHYzakN4UnM1cjRkdTRjRDh1NEV0Q3d5?=
 =?utf-8?B?NlNOSEM2QjlDb2xqWjhEa1VTSndaRTVjRHc5WkVwZFdBWnpDcjZSTnB4Um9q?=
 =?utf-8?B?WVFoc2FZUHFlNnNuUGU2dzZDT3JId2UyTDhZS1pMd09PenJ4M0VuUFNXRDAw?=
 =?utf-8?B?T2xJeTg3WFFXMGdrV3VBN084cThCTTg0L1IyZFpvamJCakFQSWdvL3F1M2lV?=
 =?utf-8?B?eTRTKzdMRVd2RFArb3VqYkpwSXlMS3hINDFuNHFlUWhQSVA3SUZ3QVNqaUlm?=
 =?utf-8?B?RjUwNk4zVENSWlJpdDd2VWRoak00Mi9KRi9SUFd2a1h5UytpeUxmL2FjdGV5?=
 =?utf-8?B?NWlheG0zSGlXb2drN29QN3k1SGxra3ZVT3FKei8yMHVHQ0hsRWdQUVB5V0c2?=
 =?utf-8?B?OUFtTjJOWVEyNFJNL3hmazAvMHFqaFBKZGNjSHA0cFlXc1cwbzI3NnBXQkYz?=
 =?utf-8?B?SjdRblNWdmVGanNCc3hMNG0zazRkV2p0cE9xb1pLOWF4TGJ1TlRSdkUyTktW?=
 =?utf-8?B?VnNaK05EV1RYWkxkdUZIUzFnQTZtalA3UHN5d1N2WmVta0J2Skl4djVyWTRR?=
 =?utf-8?B?dmV2T25sMklPWnVTZ08wR2IzeGZUR2Fqb1V5eEJkUkNDYnlOMFgwcmhWM04z?=
 =?utf-8?B?SFRTdHZxdUJCdzcrTVFiRUJ2dHVkVnZnK1VUb0NVTTJtWE1veE5yMTdHN0l6?=
 =?utf-8?B?RUUwaEw2V0pKdHNvbkFpY1R2QXdHQWVqSXkxVm5KOHVZYWh0d3NGV1g1R0RZ?=
 =?utf-8?B?ZnhIREwyVk80SXJjMDFpSDhMUWJYQ25OQ3hGdDVwanQ2VDk2NjVJUjlRY1RT?=
 =?utf-8?B?MWdaLytOMXlJSzdEVXZuVGgvMm4zYkF0TUdkWk93UG5Cb1M0RmVXbTYwMFZM?=
 =?utf-8?B?YWM3aURuYXFuTDdZaVJ3QzdBcnBLbjRMOEZKZFVGc3plU2l5NG9yQi9zOVRv?=
 =?utf-8?B?cU9XZ0g1aTl1N3hHd0huUlNtRzJLT2lRK0JkYWtiYWlBRmFHUHpONkdHcXBZ?=
 =?utf-8?B?bGl5d3Vjay95SEtaVnREZmxFVGxHTVNQZTNXRGdzTW81Qld4aTYvVURQeEhO?=
 =?utf-8?B?YUtxRU1QT29YYjNJNzBScUxRT0VPWnAvdUEvUWNFQy9RNnk1TEsxOFBHdC93?=
 =?utf-8?B?NFlQc2tEcVdrNnN4K1RGR3BVZDBUYU05blVaaUZKbjYyUFdJT0t2aXdpc0Z0?=
 =?utf-8?B?ZGVLdFdNQzVteHEveFlhSlRBNGtzN1MzWXZzQ2VLcmxpZCtJdDFvKysxckg4?=
 =?utf-8?B?RUZMc2lZNDlBbVNxVWJQcWh4K3orU1dpYitmS1BVV29rZ0wzZzN3NkJHTnpV?=
 =?utf-8?B?KzMwdkQyWW1XQTlaZVpYRUdwOGFMVUhjSDQwbC83OFUyY0tIbEl0WmdkMEZl?=
 =?utf-8?B?aUZoK3hHNllmY1FWR3lhSjdmaDVzTFU1RUhwTzR3NXFPRUJENUNJY0tMWmlO?=
 =?utf-8?Q?aoHkI0pWR+Qi5COI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f3cbda-d9fd-49b8-3da9-08da17ad1e60
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 09:09:13.3844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJ69nceEAxFo8JOr2UUjmMqnGpTrx1pt8PQWJZzDY+EqkX0z+h7uXUXidV91pf8DeYpJzTAJhRAjOMBD7I6aBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2847
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 10:48:23AM +0200, Jan Beulich wrote:
> On 06.04.2022 10:46, Roger Pau Monné wrote:
> > On Wed, Apr 06, 2022 at 09:06:59AM +0200, Jan Beulich wrote:
> >> On 05.04.2022 19:17, Jason Andryuk wrote:
> >>> On Mon, Apr 4, 2022 at 11:34 AM Daniel P. Smith <dpsmith@apertussolutions.com> wrote:
> >>>> On 3/31/22 09:16, Jason Andryuk wrote:
> >>>>> For the default policy, you could start by creating the system domains
> >>>>> as privileged and just have a single hook to drop privs.  Then you
> >>>>> don't have to worry about the "elevate" hook existing.  The patch 2
> >>>>> asserts could instead become the location of xsm_drop_privs calls to
> >>>>> have a clear demarcation point.  That expands the window with
> >>>>> privileges though.  It's a little simpler, but maybe you don't want
> >>>>> that.  However, it seems like you can only depriv once for the Flask
> >>>>> case since you want it to be one-way.
> >>>>
> >>>> This does simplify the solution and since today we cannot differentiate
> >>>> between hypervisor setup and hypervisor initiated domain construction
> >>>> contexts, it does not run counter to what I have proposed. As for flask,
> >>>> again I do not believe codifying a domain transition bound to a new XSM
> >>>> op is the appropriate approach.
> >>>
> >>> This hard coded domain transition does feel a little weird.  But it
> >>> seems like a natural consequence of trying to use Flask to
> >>> deprivilege.  I guess the transition could be behind a
> >>> dom0less/hyperlaunch Kconfig option.  I just don't see a way around it
> >>> in some fashion with Flask enforcing.
> >>>
> >>> Another idea: Flask could start in permissive and only transition to
> >>> enforcing at the deprivilege point.  Kinda gross, but it works without
> >>> needing a transition.
> >>
> >> I don't think that would be right. Logically such behavior ought to be
> >> mirrored to SILO, and I'll take that for the example for being the
> >> simpler model: Suppose an admin wants to disallow communication
> >> between DomU-s created by Xen. Such would want enforcing when creating
> >> those DomU-s, despite the creator (Xen) being all powerful. If the
> >> device tree information said something different (e.g. directing for
> >> an event channel to be established between two such DomU-s), this
> >> should be flagged as an error, not be silently permitted.
> > 
> > I could also see this argument the other way around: what if an admin
> > wants to disallow domUs freely communicating between them, but would
> > still like some controlled domU communication to be possible by
> > setting up those channels at domain creation?
> 
> Well, imo that would require a proper (Flask) policy then, not SILO mode.

But when creating such domains in SILO mode from dom0, dom0 would be
allowed to create and bind event channels to the created domains, even
if the domain themselves are not allowed the operation.

That's because the check in evtchn_bind_interdomain() is done against
'current' and not the domain where the event channel will be bound.
Maybe such check should instead take 3 parameters: current context
domain, domain to bind the event channel to and remote domain on the
other end of the event channel.

Thanks, Roger.

