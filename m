Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA840C0F6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 09:52:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187242.336038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQPgx-0007pA-Id; Wed, 15 Sep 2021 07:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187242.336038; Wed, 15 Sep 2021 07:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQPgx-0007mu-Fd; Wed, 15 Sep 2021 07:50:51 +0000
Received: by outflank-mailman (input) for mailman id 187242;
 Wed, 15 Sep 2021 07:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wWxD=OF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQPgv-0007mn-O4
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 07:50:49 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3713586-15f9-11ec-b4e7-12813bfff9fa;
 Wed, 15 Sep 2021 07:50:48 +0000 (UTC)
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
X-Inumbo-ID: a3713586-15f9-11ec-b4e7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631692248;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MKup7DxC8nYEi3wI/1H/6Z7GE/ElfkgyRNFUzYgNg2c=;
  b=gEqqe+ylUzxh7HOqcxkomTR9f6OUw3F+rWF+FVifnFI2nFnNsEK0fLh9
   k66I1mCaqixr6PLgV/L+ejYLbkDxlbSHg7RDZE1YUY3vWKzRSXJFkUtPw
   /T10APdsZM2dOLss5OoPzWKoMZnKvWoWWpSIklEU/l/+pY4/oaSTRt7PD
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RMhcBG6rE2+MJHp3oUswB2K9suNxkGEWPj8FNTZLEDEx+XLAQssuHTUSxJXjRakQQNNlIJW6SD
 JlPLWpWMVo+IxpY9fOxkzfJ7n/bW5CS0tC2uTe1vW6SAb4WEm3/U+z8ROd9/Lift3XtQ/iiS69
 iNExidkDaO9cjYPoG8yX8O31dXOxkBRbMDWHbfGwaTgwDxIXP7cR7gGK9HUfdJ8ClpMv8ABrSt
 zl2ipgFiUggWoz89Na+lbEUL5JJM2GVqpnzk6fS1TBDwomgOoa7xR8C2tbci7gSO8EeFH9J9US
 ZCIVqpKchgkUQEyXoLQT3Lsw
X-SBRS: 5.1
X-MesageID: 53164880
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5/0Mva6zZ62rqkrl3QpuUQxRtAbAchMFZxGqfqrLsTDasY5as4F+v
 jAaDTuOaPuOZmChLdwgO9/i9U8B7JWAx4VqHVRkr3gwHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrZo29Mw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 /BJp5erZ1kTAajcqsgMAl4fVDt7BPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWxp2JweTa62i
 8wxNSExZUr4bD90KloLCLMBoPuUoVu4SmgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3ErvDLtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlbbmxoOUMF+TdcF7RG/5ruFpEHeHG09G2sphMMdiCMmedA7/
 gbXxIq0VGMw7uT9pWG1rejP/GjrUcQBBSpbP3ZVE1FdizX2iNxr1nryosBf/LlZZzEfMQr5x
 SyD5AM6jq8a5SLg//TmpQ2b695AS56gc+LU2uk1djn+hu+aTNT8D2BN1bQ9xaweRGp+ZgPd1
 EXoY+DEsIgz4WilzURhutnh+Y1FAd7fYVUwZnY0RPEcG8mFoSb/Lei8HhknfBoB3jk4lc/BP
 xaI5FI5CG57F3q2d65nC79d+OxzlvOIKDgRbdiNNoAmSsEoLGevpXgyDWbNjzGFuBV9yskXZ
 MbEGftA+F5HUMyLOhLtHLxDuVLqrwhjrV7uqWfTlEj+iuvCOyfOEN/o8jKmN4gE0U9Nmy2Mm
 /53PMqW0RRPFur4Zyjc64kIKl4Wa3M8APjLRwZ/LIZv+yJqRzMsDeH/27Qkd9A3lqhZjL6Qr
 Hq8RlVZ2Bz0gniecVeGbXVqabXOW5djrC1kYXxwbAjwg3VzM5yy6Ko/docseeV1/uJU0vMpH
 eIOfN+NA6oTR22fqSgdd5T0sKdraA+v2VCVJyOgbTVmJ8xgSgXF98XKZAzq8CVSXCO7udFn+
 ++r1x/BQIpFTANnVZ6EZPWqxlK3nH4chOMtABeYfogNIB3hqdE4JTbwg/k7J9A3BS/CnjbKh
 RyLBRo4pPXWp9Nn+tf+mq3Z/ZyiFPFzHxQGEjCDv6q2LyTT4kGq3ZREDLSTZTnYWW75pPeia
 OFSw62uOfELhg8X4Y91ErItxqMi/dr/4bRdy108TnnMal2qDJJmI2WHgpYT5vEcmOcBtFvkQ
 F+L9/lbJa6NaZHsH1MmLQY4aviOiKMPkT7I4PVpeEj36UebJlZcvZm+6/VUtBFgEQ==
IronPort-HdrOrdr: A9a23:+qf486oUIdLl+Ygn9zyLawwaV5uwL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHK9JbjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 xoWp4Y4Y2mdfVmHp6VMt1xNvdfOla9MS4kD1jiU2gPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.85,294,1624334400"; 
   d="scan'208";a="53164880"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbu/hLyaA7s+UP3oXCDkiDrrwmEuPuDQtpEvZJ6xtbvtFoZH7lCbu7sSXyKL+TSz9XxBWoFgSGWRLFSNyWjNB4FRiBqD3GYHlzPIVg5EWukKFX1zDSX3UPHJFolkzsFkliLWKwEz/oE6R73/z0iPoK00CTV0IQwPnzwQTDjt1IKkc+ILZj3q9K7qK/i6/50RqRbCnXLVr9qqegEaP8kuUGaQY5Fgxo048IoQbZmYgnX/IOUCtrNRT4X0/TGAFFWbEyUNkQhcWCvDKDemICcxdd8M7yf8y9qhufnyDh6AWGOivcLAMSrYsXgVy3opcHyB2i8ErXb7OO8TPzWGL0fKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5W6DN5j2PLL8WQ1KBd6ZY06LmsFB+DZCdaeQe9CMJAE=;
 b=Z+oowZrbZDuZLJud6z58dJY77NWEFa/3OU0ABy7qQ8NWNrsdFoczsCqg4/fhX7gqxs8qHw3CK75id19iVGKtlSEXxsX0nF6lTQx0M9fYb/480w6IF74Of575BFzDCpfugYNHYtZZow/pCWgRYAEH2TX2/MHAVdWvSPTznlu0MNvsOhJgaB0QrJtBdPX1BgEBR5m2Uex4v9ZcKiBYJCt6tZo0w4huV3AbcCyLPBso5pcMS0wIQ7/yv6enCoSOYQD0h1TeA34uIAlrsrKJFjFemfjoGxaPapAR0SYxKdmYPfHbexkXHvOYWdLxKrAFyzdbLXRWRCkN0n5j/zQeXvdQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5W6DN5j2PLL8WQ1KBd6ZY06LmsFB+DZCdaeQe9CMJAE=;
 b=gpav5XTel8oKFS5I3aTblv6AzotN3JR9apB6Mh4xbDtZrs40Wjp/NeLLq3yRfCES+9M71XGyc4TP0Alhnm8A6k7RDRN2FzWqzmKhGe9Lh9E7CA+IqXBKDNe4lHlnMwqBI9rTaBxKebE5dnLFztHLfCOtRh5osWjYJB7d5EKXlao=
Date: Wed, 15 Sep 2021 09:50:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/p2m: fix xenmem_add_to_physmap_one double page
 removal
Message-ID: <YUGlz9A+MbbzB/W1@MacBook-Air-de-Roger.local>
References: <20210914133419.8407-1-roger.pau@citrix.com>
 <96c7ffdd-57b4-15f6-7fb5-560c6ed0504e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <96c7ffdd-57b4-15f6-7fb5-560c6ed0504e@suse.com>
X-ClientProxiedBy: LO4P123CA0309.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbb2f7f3-62b4-4c1d-498c-08d9781d8611
X-MS-TrafficTypeDiagnostic: DM4PR03MB6096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6096945CE6DB994B3CE1A15B8FDB9@DM4PR03MB6096.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: abEklmOk1CziIYszf/9L2pGIL3swMyOipl4M6DvIR5PXdo29aGE0k0nxJdj2Hc72dWzvfndaIqMnh7TH3fHQI1XQmJN3O0LIuooXFS5f1a1jcSe5tAVctbBaKu3Qn/M4Jpny2ghK400z1VYYuzRCQUjKAZMUmKyS8fdk1nW2ZsTyflv4i3tcXnwRaM+piqs2EL9E1gtf5g2giPEOcbEz1qaB7XPXjQaH3Pz41xWZc4mDP/JPNJw8Pz19S6RojW7jehtOvwK78DngTLekgfNSpxibebP6hzfuk0/zeaMqc31lFuYZo+zLtCRXsg0XsABfjO33Hu1BTi9CQpPVdLxZ/sroCUzsJKfg0QwO1OSrc+uz1AZ3NwO8j07LEDR1LdS7eahl+vkphx+cmu1x1ZHkDgROHfpVhRoT4Rz0XQtKOJuBxkL1WwYi3cez84YpU2nSWSUUJ5THRYv6TcyHhhA0ejIY74W+wHR7x1KymC6fRlAyEVIjb7U4cM9bKRortVEKqU4+gml+XuzoXfcdkU3Huymr+mq1DVH3vf9ptXRyoHxU56PWej7jbeuooyWZDvswCrrJM2Ko3tY+9H8g/0Jsufs3tX4i3b6VHICGPYN7PlSB6hy5YyghszjapfcQS5Iqn/hbYB7iTHCvz/BC2ka18w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(38100700002)(86362001)(9686003)(6496006)(83380400001)(26005)(6916009)(478600001)(5660300002)(316002)(956004)(66476007)(186003)(8676002)(54906003)(85182001)(6666004)(4326008)(66556008)(6486002)(8936002)(66946007)(2906002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2FlbWg0NFZXWVNBWExsZmd4Z0xKblNldU5NVVNpclNaMjZicitIUUQzQXNM?=
 =?utf-8?B?NlhlbXBxMEdzNXd6Z3FuUEcvYkxuTTJmQ0hmVlZId0dDWGJ6ZGVLTC9ubitB?=
 =?utf-8?B?K0tCOXZUOWpGWHVkSmM0UjNlcWh5a21jV2lTdWF1NlVNbkdGZkVzdVp3MkJw?=
 =?utf-8?B?MDFncjVzMm8zT2djdXdQNnliUURJUGtkSUtCdXF2aVdyQlRpM3lMcGlHMW44?=
 =?utf-8?B?UFB1Z3BkeDh5ZGErMlUzdVkzOFZFUk1Nbk10UHhpS0NjQ2hFWUZ4SDdVcVdJ?=
 =?utf-8?B?Vm5ybnIwUEUyeVo4clFFL09vM09lNlFFNDJhL1lHdGJ5Szk3TE5ZcEV4NGJP?=
 =?utf-8?B?VFBZb3loNERuRUtDS1ZjZFZOOXBVTDJLUGhRNDN0cHl5ekRDNjVEZXpCZGN6?=
 =?utf-8?B?NHBHUklOMEZ1RUFHSElWZ1kyZW9TQWFmTk5BdEJBMW5UWlB5WHZjY09QN1Rj?=
 =?utf-8?B?QnFuNUpNNGYwcnVSRmowQnZyMm53dkplYXhnY0NaRmtuSE9FeWd5NmkwVVNs?=
 =?utf-8?B?ZVNpOGR4eGZabmFuR0VhVnVFNE03NWw3NEJ4TGpTNW9xbXltUUdGY1FTa2R3?=
 =?utf-8?B?V1RjOU5TYmpFK00vRVVnYXIzczN1cGx3d3dvRjFlWHRZdERvTlA3ektiTURi?=
 =?utf-8?B?VFo2Z2dWck11bU5RMmFEbUhEUm1JdkluYmVENUxmRmthTGY5a21WMG84MHhR?=
 =?utf-8?B?S2I2UFlsUUUzOEwyRnNYTFczWHBUL3BBTnlQemJlaU9DcnNUYWs4MGVlWUpS?=
 =?utf-8?B?cE9NQXpKTVFIR1NtVVhXN0FsRHJLWkR4NjQrVk93Sk1qbjY5OGxDc2drL3RR?=
 =?utf-8?B?OC9rZnlvSDRoRWNYYzluQ083WG05and0NW56c3ZEajhOV3BlZVA2Wm5ncTFM?=
 =?utf-8?B?cjIySU9tZ1ZoejUvQXlyQnFQeGkyMHNxNXloRFdQQUIyY2h4YTQyTWRyeHNS?=
 =?utf-8?B?UEk5bE5KSWlOVDlzeDFrcWt2YU9Kb1pUMmRqdDBhMVhrV2I1NUtDNVR0ZDYw?=
 =?utf-8?B?cW9JYUo2S2tGM1RHMzk2N29NUmV4REZ6NldCalMvYkVTYUZZY2N6VjRBMmxq?=
 =?utf-8?B?VlJMaHp4WklFZ3ZEaWlOMi9HeXVyZHpWYWtTaFlrbWx5dmtNUHczT3R3MFZG?=
 =?utf-8?B?dkFoSG5lZnQ4Vk5EWjVvbEdiTjRIVlVJK0liaFpCM2l0L3YraEROZEtCSk5r?=
 =?utf-8?B?U25Xa0QwNEp2SDJTNG14VFkyWlRnUW9aZ1M4SGpnWkF2eEpnZkZrSUVJclQx?=
 =?utf-8?B?ZGRKenVwTUdnUXJwdUJ6bWNDaVBEOXFCMjZTaDFDZzJ4SVZYZ2U5Y2g5amxN?=
 =?utf-8?B?NHBpdEJiOVJETjBNMzBsR2h1TFNxL1NpREQ2UUlaZkowcXNiV0l5MGNweldj?=
 =?utf-8?B?LzZlTjM0dnlmSENPN0RnUlRaaXZyRFZkREhwVG9vUG1jUDJacDdXa2o1ZHhJ?=
 =?utf-8?B?S3IvM1lobm04K1FQY2VTNXN1dmdBS2FWMk5KNy9MdXpwNWdyRjdxMENJTVhR?=
 =?utf-8?B?NEp2Y0JOMnBad1lxalR3b1J1Sm1oSXFhSjRBMTA0RnpEMnFRclN0Z0U5K1dh?=
 =?utf-8?B?YnlsRFhtTGlHU2hpRnFQaFVJU0FZVktVbGo3OW11ZlN0S0NBamx3U05KRDhC?=
 =?utf-8?B?cXhIeE1mQnhIWGo2blh4NEJEVGk2ZDVWVU5YYVlXYzRORVdaTlorMmtKc0dO?=
 =?utf-8?B?aWNPeDVRMC9IVGxvSlVyN0Z3NHdHbXB3bm1RNEFBUDFMNDBZZ3Q5MjZXSnBy?=
 =?utf-8?Q?zYqGHDSgrkgGgsjemoFEGvzCySJXoFnj13BwVzX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb2f7f3-62b4-4c1d-498c-08d9781d8611
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 07:50:45.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iI9N07NtCLpHbddgxcxtqxJCXe2RWKMgLGPzHiNNBqtefDQzJwgZWAiEWdc1AevlQzMte6R7rZb3BE/sRTEfnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6096
X-OriginatorOrg: citrix.com

On Tue, Sep 14, 2021 at 04:32:53PM +0200, Jan Beulich wrote:
> On 14.09.2021 15:34, Roger Pau Monne wrote:
> > If the new gfn matches the previous one (ie: gfn == old_gpfn)
> 
> It took me a while to realize that you probably mean "gpfn" here.

Indeed. The variable names could probably do with some disambiguation.

> > xenmem_add_to_physmap_one will issue a duplicated call to
> > guest_physmap_remove_page with the same gfn, because the
> 
> Considering the local variable of this name, may I suggest to
> upper-case GFN in this case?
> 
> > get_gpfn_from_mfn call has been moved by commit f8582da041 to be
> > performed before the original page is removed. This leads to the
> > second guest_physmap_remove_page failing, which was not the case
> > before commit f8582da041.
> > 
> > Fix this by adding a check that prevents a second call to
> > guest_physmap_remove_page if the previous one has already removed the
> > backing page from that gfn.
> 
> Same here (if this remains; see below).
> 
> > --- a/xen/arch/x86/mm/p2m.c
> > +++ b/xen/arch/x86/mm/p2m.c
> > @@ -2813,7 +2813,7 @@ int xenmem_add_to_physmap_one(
> >      }
> >  
> >      /* Unmap from old location, if any. */
> > -    if ( !rc && old_gpfn != INVALID_M2P_ENTRY )
> > +    if ( !rc && old_gpfn != INVALID_M2P_ENTRY && !gfn_eq(_gfn(old_gpfn), gpfn) )
> >          rc = guest_physmap_remove_page(d, _gfn(old_gpfn), mfn, PAGE_ORDER_4K);
> >  
> >      /* Map at new location. */
> > 
> 
> It feels unbalanced to suppress the remove, but keep the add in
> this case.

Well, there's a remove further up which is not skipped.

> Wouldn't we be better off skipping both, or short-
> circuiting the effective no-op even earlier? I recall considering
> to install a shortcut, but it didn't seem worth it. But now that
> you've found actual breakage, perhaps this need reconsidering.

Sure, just didn't think this corner case was worth adding a short
circuit. Let me send v2 with that approach if that's what you
prefer.

Thanks, Roger.

