Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF0416D0F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 09:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194980.347414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTfvD-00062b-RL; Fri, 24 Sep 2021 07:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194980.347414; Fri, 24 Sep 2021 07:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTfvD-000603-Nj; Fri, 24 Sep 2021 07:47:03 +0000
Received: by outflank-mailman (input) for mailman id 194980;
 Fri, 24 Sep 2021 07:47:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27y=OO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTfvB-0005z8-Rr
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 07:47:02 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1e50fdf-72a6-4ef5-9eda-43ef928678e0;
 Fri, 24 Sep 2021 07:47:00 +0000 (UTC)
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
X-Inumbo-ID: d1e50fdf-72a6-4ef5-9eda-43ef928678e0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632469619;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pTlBDqZdKY4LeD58fEyRgJYHin+WlU3LZwcyGbFp3TE=;
  b=WC3Xgaec/eLhhPJ2u4um6xpCu55boRAuye0zqouu7wMhCWxJBvxsVLgz
   3GZlmN9WM8Dqq653Q2lfpY64liYppd3U/kuuuriCbuUicyi6uvd3ud4pG
   sGjgAdmxhuSaD3gqL8lY7EEa4G5/MNFRBs7xryAlzq+o56H1idMtDVkn8
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ysZPMm5LZL8YMZSypebsTMT5tLJt2ekAXAsbGEqn96Av9Sa+Tr48HiUyjlYWcQlYNogK/2Fd3d
 /zrIWYv2HBEs/GDG9jJ7kvuPPVCHRDVLAPYm27x1igt28jPAgOlm/mM567WN0ZV7+k6fcWIskR
 BG6txSQLeoM3yxdgpaTvXjhYMz3tJUmBU6GNKPSCedro4kpekTH5B7hg/dFqRWYAfFzaWdJJ0K
 F6VcALjVHm/hfPJ2jkMhDdQfg7r/mltGH3bQVIEeO5fzDNl4oJmI6Y8E4YazCO++90AFtuK9hu
 AllwU+X7f21sPz4Uk5HNSirc
X-SBRS: 5.1
X-MesageID: 53536726
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dBBWY63s8t9I7YHPMPbD5bd3kn2cJEfYwER7XKvMYLTBsI5bpzZWy
 WUcCGuCPfiLN2v0fdB+O46ypEkCscXUyN5hHVc+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywbJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhlI972
 uRSst+McjgWAYKVmqMmeiRUHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIQFh2lv3J4m8fD2f
 pI/OSQ+VQT5YTZqOG80OMsFkd/xmSyqG9FfgA3M/vdmi4TJ9yRz36LqK8H9YcGRSINemUPwj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcLwVELq05/t7mmq5z2YYCAAVfVajqPz/gUm7M/pTI
 lIZ0jAjpq8z8AqsVNaVdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCA8raZq3W9IyERKSkFfjQsQg4M4t2lq4Y25jrQSv5zHajzicf6cRnx3
 DKivCU4n68Uj8MAy+O851+vvt63jsGXFEhvvFyRBz/7qFMiDGK4W2C2wVOE5+RxM4HacmK+g
 0crwsrZ18kzAZ7YwURhX94xNL2u4v+ENhjVjlhuA4Qt+lyRxpKzQWxDyGohfxozbK7obResO
 RWK6F4Nvfe/KVP3NfcfXm6nNyg9IUEM//zeX/bIZ5JlZpFrfWdrFwk/OBbNhwgBfKUq+JzT2
 Kt3k+7wUR726ow9lVJaotvxN5dxnUjSIkuJGfjGI+yPi+b2WZJsYe5t3KGyRu449riYhw7e7
 sxSMcCHoz0GDrakPnONrNFOcQxQRZTeOXwQg5YMHgJkClA6cFzN9teLme9xE2Cbt/49ehj0E
 oGVBRYDlQuXaYzvIgSWcHFzAI4Drr4lxU/XyRcEZA7ys1B6ON7HxP5GK/MfIOl2nMQ+nKUcZ
 6RUJK297gFnF22vF8I1NsKm8uSPtX2D2GqzAsZSSGJkIsE8F1CXoI+Mk8mG3HBmMxdbfPAW+
 tWI/gjaXYACV0JlCsPXY+io1FS/oT4Wn+caYqcCCoA7lJzE/Nc4JirvoOUwJs1QexzPyiHDj
 1SdAAsCpPmLqIgwqYGbiaeBpoavMu1/AksFQDWLsefobXHXrji53ItNcOeUZjSBBmn6z7qvO
 LdOxPbmPfxZwFsT69hgE6xmxL4V7sf0o+MI1RxtGXjGNgz5Cr5pLnSc89NIs6lBmu1QtQesA
 xrd8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8ePeA0tIPhSKhChMF5dPMdsok
 bU7pcobyw2jkR52YNyIuT9ZqjaXJXsaXqR56pxDWN33ihAmw01paIDHDnOk+4mGbthBPxV4I
 jKQg6ae1b1QylCbLig2HHnJm+FcmY4PqFZBy1pbfwaFnd/Mh/kW2hxN8GtoElQJn0sfi+8ja
 HJ2M0BVJLmV+2Y6jcdOaGmgBgVdCUDL4Uf20VYIyDXUQkTAurYh94Hh1TJhJHwkzl8=
IronPort-HdrOrdr: A9a23:9v97I6wZYCRX5RNPHYDuKrPxveskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurAYccegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LS0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13DDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3O
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0ITEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fy1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfuspcq+SWnqLUwxg1MfheBFBh8Ib1O7qwk5y4KoOgFt7TNEJxBy/r1Zop8CnKhNAqWsqd
 60dJiBOdl1P7srhJlGdZU8qP2MexrwqCL3QRGvyGvcZdQ60lL22tXKCeYOlauXkKJh9upEpH
 2GaiIAiVIP
X-IronPort-AV: E=Sophos;i="5.85,319,1624334400"; 
   d="scan'208";a="53536726"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EL0WcxrfLJRmJPDoxpX6GwHnKYX8Lyf7EgkRNb0OhrpubbRyfLLXDLkMkXcwH/tU9PuzdoFmQ2KQy1FxFTu3RO5CQ2szhd08olKCfslk9OVcNdFXNJmWG6ielfRCzaWWRaMeUfqexE+67o/pgbEw89HlBcKIzPIK+nIWZwXZjbSS31wKVuBaeqYX5cK/kuLuv4iVZhMSA3fyQOL1f1yLRgz5n5dET7+BSvNd+63pkEoe0cR5+MxgHUqhg89JPr8ctZGA5D9JNnJgpT2l5N7juWNzreJhAj8lAYmwVQvOX/9lPS3sYOmpgReSR7gU6XYDyscpXKDdX/khz9uWfKxngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dDWIilNdVyaucOEu4Us4hr6C1PWIhQ6ULkkUa/Vip1U=;
 b=R6KU7tE+kR7HuPFpejSRxJMuw2qRpIeEuY4BXNitVO+xC8n2kot9I3eX4t1oi4VZJUtEGXlLLFKz1/ZeOsXvb0q1/kN9kDO9Q44X/UgVocKSieYBcN1mg5q33wJ9CwW2lz1Gzcw2e7J/bogTQdJbQlcq57ivqYXlGg10jnB6ErRMHJeEGq/CsfeaoaYw3IsJ3EBkGw7vdcZfwzvizixRyIJCrnUsfiX5HebM9SXIDQkNuausBrWIS1viWr1WR3FWvhOszpMJ/9vDWoaHUnTuDem9HkLzN6sVCDLnawvoBoral8Wvm1EHKkLnPBWUU3EuC0F6/jn12TPQS9Uc4B6Izg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDWIilNdVyaucOEu4Us4hr6C1PWIhQ6ULkkUa/Vip1U=;
 b=B23gtK5nKppQcSFUqQkc9YXN3WSGvtU7j+vZXr4sJEmDrPGIkS93TTPWEFb0o8awe+zuaF8BnFpdKUkrHOFI7H45GvBqNTlXZq71wwuhgMhEQ+bZ19emaE2PNwvoE8RF+aQWddZYYPsusTgK2QOTwy+TSBUxbWU3ODCLMKGJuqU=
Date: Fri, 24 Sep 2021 09:46:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien.grall.oss@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 0/6] gnttab: add per-domain controls
Message-ID: <YU2CZMvlyGJvqJ3z@MacBook-Air-de-Roger.local>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <69208166-2356-cc8a-4e78-2ce8d6cddcac@xen.org>
 <YUr525A3B0cs2rBo@MacBook-Air-de-Roger.local>
 <b93a13e3-2ad9-aac4-7f87-b290aa4c3953@xen.org>
 <YUxi2DeEXhsnUTi7@MacBook-Air-de-Roger.local>
 <CAJ=z9a1MxDKg3pB0Qq2JvAfDJ6LHsSoYmg-m2Xotxi_EB1jb1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ=z9a1MxDKg3pB0Qq2JvAfDJ6LHsSoYmg-m2Xotxi_EB1jb1g@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0502.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5d0688a-e44c-4e0e-d82f-08d97f2f77b1
X-MS-TrafficTypeDiagnostic: DM6PR03MB4602:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB460240F10193AEF943A8DD2F8FA49@DM6PR03MB4602.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cXABK+oPks2ZNZSx/qBoGvtHT/LjyTkZO4F2tmPTAGth88+FTaXDXFNZbVGtfgKxKzMwlTwq7B9EdtcAVm9R2zJXtaAfCAOaG4ZD6eDE469l0eLYCTfm/LXvmOZIk9aAYO9FDt7CCQjSZBfJRr7T3cfM7oJuiBBIAyvDXcwHGRLbx5w5JDiSDzcuj2+07ea1Uo8UNeK3E7HuhWxUvB53Qe0s1kP2HzAuEnahkJnyuvsc1Z8vuCEVeCGnt3Qj2ogQW8ak9YXXoH/CKV+ZPH4WngcBqZS/miGqrkIzuJ8q8lgdLaazFIGi61T+dqFWFrGUin7y0iexZlpY5Rz4W+bzbe/JokMAxN+8H8c4NmRF9lAAcHpRYh7aGCAMTiNVgTu0FLjMBAYytMUWPZZJhC4PXIUy8EC+RN64N8jpXAn/RKVfnmiRshm8+sg49RJFOuONGi91sB1Q0RO1YMm//9lCpnXtgtLjJBBokKWBT/IqYZuflJAxQcs8o72+Yq4dludfYt3jR03G3WAA2HVWxJR99kJxSVj5H5vzFaSq6LIqTlX3bYo200RVhiDhGozVC9HPlEI8kIrMp1/XbGMuCx2X0pVrpLiOhqSilMwhPXVmy29mD7QZqE3xEeTYoJr1RNy0hnGalmJud6uPU7oKgfM13ax/agmX/1fVNK+XbOWODbfE1fIFnBEIjfT/3hluqnkqrMAI2Juc7BnWWOazexlPAAV/H4FuQzTP9jN+YT41xH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(2906002)(6916009)(966005)(6666004)(5660300002)(54906003)(38100700002)(8936002)(508600001)(956004)(9686003)(8676002)(6496006)(6486002)(85182001)(53546011)(316002)(26005)(4326008)(66946007)(66476007)(66556008)(186003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cThvbkNlOGF3OWJ5TjBqTUhtSXN4Q3AwYm1EbVZHZ0U0ZzlTdTBXK3d1Zld6?=
 =?utf-8?B?dGlTR0NuNS9pSEZBOWtHTWJMN1psM2VKdkE4TWp5WVhBVlYrdG5OMmo2Sko0?=
 =?utf-8?B?bTFlNW9qSzdIWnhoOTh5TWNHWGpNZk1ob21tbE52MkJDajdFZ3FxODFDcU9m?=
 =?utf-8?B?UHI1YzAxemQ0Mzh5VVdrTHFIQVNjRTJ6amVRWU0wbmJab0NCa0ltUXA0SzNE?=
 =?utf-8?B?TUZFaFNNaUw0NVQ2c1lSMk43SU5saXJ1WWtWS2d6dnN6QWlBSW1GUzBZeGJq?=
 =?utf-8?B?enZ3cFdZWkJiYzE2RDVIZ2FpY3ZOU0IzYTFOdEZ6ZGVRNzNRSXNZRUIzQStX?=
 =?utf-8?B?VFFWQ3dXSGMzWTJsUEhZcXp5aXpmQ1VwQ1ZPMElrK2FxZ2N4aTNYWk1wMWYz?=
 =?utf-8?B?MjF5aWJEYW9ibndxOWszRkZ6YzhPU2FCY09oeWtwK0QvaHRoaXRiWmFoQVBw?=
 =?utf-8?B?Y2N3WlFPQkVvUHhkcVVlcFJNOHNtbTZoRkU1QnVVV1Q0K2pWaWJxQ3JHcG9q?=
 =?utf-8?B?K2Qyd25UWnRlQWFPS2V1Lyt5K3VyYnkyWDdWTFB6UWRhcjdyY3YwalpiS2Yx?=
 =?utf-8?B?aUMrd2VYOVlQU1U1S2JWNFJnNFhCaml1WURMNXJmeFBMd3BCSmIvcUg5Vmh1?=
 =?utf-8?B?VHRnbWFuejlmZGd2djI3VTBkOHhZZXp5eXFaTHJJckhERW9STUJYQndBQ1JL?=
 =?utf-8?B?UHFwdmFQY1NUc2c5WkltRVRIQ0FEZ0J2RGpNZkxUYy92dnN2SkxHM0kwaUhP?=
 =?utf-8?B?MkdDNCtyZDloNEVRSUdVY0hUVUJ5dldodFg5M2owNlFMZWptVXBJVllnLzlk?=
 =?utf-8?B?c1JmVHM0TWthRUs0VWNVS1RiVWR5SEJwTStvRmlscldTczZMQkZTR0pHdW9X?=
 =?utf-8?B?R0c2TytlSjhEMXFxcDM4ZGlIRCtCay9GU09KS2wwcDRtR3M1RGlVSlZka2N6?=
 =?utf-8?B?b3BhdnhEY3k3b1ZDdFhqRytWQjBVRzk0Ty9qaFNIVlZBR3JzZGhzZE9UbGtW?=
 =?utf-8?B?eHdSQ21IWm9JM3ZQZnM3QVhWYjAwOW9CMUx4RFN2cWt2aCthSFRqcEhaSUJv?=
 =?utf-8?B?QThaQWIwY21qcXRqcWVyeUltOUpia0NjWkZ5SU5SWjZkVnlId3VvdWp2d3RN?=
 =?utf-8?B?VTNyQ0tlL0ZJVnVUcng1V1Nsd3d1Rk9DTzJDNHN1Mzl2dkdwZjh6akI4aHZ5?=
 =?utf-8?B?MFZwN2xPV0h6V3VvUS9XQkV4N2JsSWt5OHJuQmtiVk9SUU53OU9ENHUzSDZx?=
 =?utf-8?B?MEVUUVRKQWhLd1ZvRXZJdGt2MFY2bHNkM1o1cXNrT1QxeGd2RVJSTXJmSGsv?=
 =?utf-8?B?WnR5cXdNV08zNFJ0WE9ORGoyd0c1dkdIdVVKSW9YMkVEaFkwdHZ6akwyZG9Q?=
 =?utf-8?B?ZjBmVE16ejYvNDY1WnIvK3Q1Q25sVGpYOTJnSDhIV3lYYjQzemZyaU5CMCto?=
 =?utf-8?B?TDEzWkhBeEplQVJnNmhNblQ1aFJBOTB1ZmowTGRTZ1I5dS9rQ2FlV2dYZU4v?=
 =?utf-8?B?Y2JwZFZkV2FVZ3RxYkgwR29LWU5CV3N3dHl4NktTSGxod3pzMnBSUEJRSGV1?=
 =?utf-8?B?M2ZZVEdaNDZOT0lNcXJTSWgyT1JrT1FGVWdvNE1nRGFDSkJQbW1yOG5tek4y?=
 =?utf-8?B?eGRLd1pxQytWRlFyaUV2ZkY3clpIb3ZTQ3RmR3JseTV2bDJCWkZyNVBLVHY1?=
 =?utf-8?B?SGRPZXZQMTkxSVhaYktKQjM1Y3JVSTFNREFKWXg0aTVKVHFjcHR5dTBxNldH?=
 =?utf-8?Q?OS37+jpcatmCrWnVMSqz1J6OqiOz5JP71/h0BCM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d0688a-e44c-4e0e-d82f-08d97f2f77b1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 07:46:50.0917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiGcIXyei/vR33g3T8V3+BhoZsMKCbRIwPITLn0H6ezOJccTTzhWsfGsdO6JtLf/lbQLDFREDEUyWip78F5vvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4602
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 07:30:51AM +0500, Julien Grall wrote:
> Hi Roger,
> 
> On Thu, 23 Sep 2021, 16:20 Roger Pau Monné, <roger.pau@citrix.com> wrote:
> 
> > On Thu, Sep 23, 2021 at 01:47:37PM +0500, Julien Grall wrote:
> > > Hi Roger,
> > >
> > > On 22/09/2021 14:39, Roger Pau Monné wrote:
> > > > On Wed, Sep 22, 2021 at 01:57:02PM +0500, Julien Grall wrote:
> > > > >
> > > > >
> > > > > On 22/09/2021 13:21, Roger Pau Monne wrote:
> > > > > > Hello,
> > > > >
> > > > > Hi Roger,
> > > > >
> > > > > > First patch on the series is a trivial change to xenconsoled in
> > order to
> > > > > > use xenforeignmemory stable library in order to map the shared
> > console
> > > > > > ring instead of the unstable libxc interface. It's reviewed and
> > ready to
> > > > > > go in.
> > > > > >
> > > > > > Patches 2 and 3 allow setting the host wide command line `gnttab`
> > option
> > > > > > on a per domain basis. That means selecting the max allowed grant
> > table
> > > > > > version and whether transitive grants are allowed.
> > > > > >
> > > > > > The last 3 patches attempt to implement support for creating guests
> > > > > > without a grant table. This requires some changes to xenstored in
> > order
> > > > > > to partially support guests without a valid ring interface, as the
> > lack
> > > > > > of grant table will prevent C xenstored from mapping the shared
> > ring.
> > > > > > Note this is not an issue for Ocaml xenstored, as it still uses the
> > > > > > foreign memory interface to map the shared ring, and thus won't
> > notice
> > > > > > the lack of grant table support on the domain.
> > > > >
> > > > > I find a bit odd that the Xenstore support is conditional to whether
> > grant
> > > > > table is available. Are you expecting domains with no grant table to
> > have no
> > > > > PV drivers (including PV shutdown)?
> > > >
> > > > I don't really expect much, as having guests without grant table is a
> > > > developer option right now, if someone wants to make use of them for
> > > > any reason it would need some thought.
> > > >
> > > > The other option would be my first proposal to restore foreign mapping
> > > > of the xenstore ring on that case:
> > > >
> > > >
> > https://lore.kernel.org/xen-devel/20210917154625.89315-6-roger.pau@citrix.com/
> > > >
> > > > But it's also arguable that a guest not having a grant table should
> > > > also likely prevent foreign mapping attempts. Plus such foreign
> > > > mapping won't work from stubdomains.
> > >
> > > There is another option: extend the acquire hypercall to allow xenstored
> > > domain to map the xenstore interface. This would require more work, but
> > at
> > > least it would avoid the interesting dependency on the grant table.
> >
> > Xen isn't aware of the shared xenstore ring page currently, so that
> > would mean introducing more knowledge to the hypervisor that what's
> > strictly required IMO, as Xen has no business in knowing such details.
> >
> 
> Well Xen already knows the page for HVM/PVH because the guest retrieve it
> through an HMV param.

HVM params has always been a bit weird IMO, as some are known and used
by Xen (like the identity page tables) while others (like the xenstore
or console ones) are merely used as a way to pass information from
the toolstack into the domain.

> We only miss (?) the PV part.

Right - ideally we should use the same mechanism for PV and HVM, which
would rule out he piggyback on HVM params.

> 
> > The grant table slot used by the xenstore shared page is just an
> > agreement at the toolstack level, but not known to the hypervisor so
> > far.
> >
> 
> Right, we need to find a different way to provide/map the shared page if
> the grant table is not present.
> 
> To me the acquire hypercall is the best way to resolve it as Xen knows
> whether the domain will run Xenstored (at least we used to have a flag) and
> we can do the permission control easily.
> 
> Do you have another alternative?

As said before, I didn't give much through about a practical use case
for this. My main focus where patches 1 and 2 (which sadly seem to be
shadowed by this no grant-table option) in order to have more fine
grained control over the grant table support on a per-domain basis.
The no grant-table mode was mostly the cherry on the cake.

I could see people using no grant-table also likely wanting
no-xenstore and no-console as to prevent mappings from other domains
into it's private memory altogether. Then using Argo or a similar no
memory sharing mechanism in order to interact with other entities. So
I think we shouldn't over engineer this xenstore usage without grant
tables, as it might not even be relevant as a use-case itself.

Using the acquire hypercall could be a solution, but I think we would
also need to introduce a new hypercall then in order for user space to
be able to tell Xen about resource areas, so that the xenstore address
can be provided to Xen without (ab)using HVM params.

Thanks, Roger.

