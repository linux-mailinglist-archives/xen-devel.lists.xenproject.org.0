Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806DA4A80EB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 10:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264533.457648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFY2Y-0000mL-2D; Thu, 03 Feb 2022 09:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264533.457648; Thu, 03 Feb 2022 09:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFY2X-0000kN-TK; Thu, 03 Feb 2022 09:04:29 +0000
Received: by outflank-mailman (input) for mailman id 264533;
 Thu, 03 Feb 2022 09:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mjBt=SS=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFY2W-0000kH-Ak
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 09:04:28 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47407957-84d0-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 10:04:25 +0100 (CET)
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
X-Inumbo-ID: 47407957-84d0-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643879065;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=22L88+kokrff2C8t6uJKWddo4PWEBQxHLZzX805np1c=;
  b=KZve4AKO4FwFPX1MTD/0ipJDIA6FkAoz9PSnTGJ6PoV5heVsH36scvBQ
   LMP37hNWLXRUEldc2JHEVmOGB50jAFbyqJFeSKXc/qiKKrKyDLsccCz4P
   agtrADRt/If5H2kKwPVeBJ1bbNxX1UaSdmDSGW3C4tbE40djjbOGHYSMh
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: G0tugr9LC+vytqwYYIeJd3BzB1tQ1CFPDfPyixwhttoEwCQIQKyiU37FxW/80jNfciWUK70D5C
 Q8GLzkr5TD0xNqtJRH5p3/IEbHvsfBwQ7s8eGeV3gtF4OI5hBkD6y3GtrzSbjP2CesN0T6Q8ll
 s8U7cfcEyoFg/KjkUbd+6qKAmgzYoNxzHds9N9reQBZtVJ98w+TPE025wu5eCBCpq9Ti20sLKj
 z7ZOAPzHTuI511oXc95kRJ1sHOM+BsmITinr+h5J60UXpeDczqlJHlVKkrHSs8lM7eH5uKPYtj
 Zf6jEbn4rvjkN6TrAV3e67ie
X-SBRS: 5.2
X-MesageID: 63394355
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BhW6WaBEWLvIARVW/5fkw5YqxClBgxIJ4kV8jS/XYbTApD12hmcEy
 TNJW2/VPq3fY2ugfNl0aYq+9xsAscfczNc1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970Uk7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/2wjRx89I6
 8p3vIHvQlY5JIvutcIATEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf6RtIMDgWpYasZmOvT9Q
 OhHRj9UXRnebDpUMFFUVKMMg7L97pX4W2IB8w/EzUYt2EDPxQl4y5DxM97YfNObSMETlUGdz
 kre52XjCRgePdaC4TCE7n6hiOLJkS7hHokVEdWQ//9xiVyXz0QZCQEaWFW2p/W0kAi1XNc3A
 1Qd5y4GvaU0skuxQbHVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqPHFeC1Ffup+6/d913kmnostf/LCd3uCtQS7J4
 C+wpTVhjOQDl+gp+oOm4gWS696znaThQgkw7wTRe2uq6AJleYKoD7CVBUjnAeVod9jAEATY1
 JQQs43Htb1VU8nR/MCYaLhVRNmUC+C53CowaLKFN70o7HyT9nGqZui8CxkudR4yYq7oldIEC
 XI/WD+9BrcOZBNGjoctOupd7vjGK4C6TrwJsdiPNrJzjmBZLlPvwc2XTRf4M5rRuEYti7ojH
 pyQbNyhC30XYYw+kmbtF7xAj+J6nX9lrY82eXwd5078uVZ5TCXNIYrpzXPUNrxphE96iFm9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUXX9ritw/G7gtWre1I8cEl4Uqe56ep4J+RNwvoJ/s+Vo
 CDVchIImTLX2CycQS3XOy8LVV8adcslxZ7NFXZybQ/ANrlKSdvH0ZrzgLNsLOR+qbw+kaUpJ
 xTHEu3Zaslypv380211RbH2rZB4dQTtggSLPiG/ZyM4cYImTAvMkuIItCO2nMXXJibo58Y4v
 ZO60QbXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEWR3Cae2
 iaXHQwc+bvHrbgq/YSbnquDtYqoTbdzRxIIA2nB4L+qHiDG5W7/k5RYWeOFcGmFBmP58amvf
 8tPyPT4PKFVlVpGqdMkQb1q0bg/953koLoDllZoG3DCblKKDLJ8IybZgZkT5/MVnrIA4Fm4Q
 EOC/NVeKI6lAsK9HQ5DPhchY8SCyeoQxmvY48MqLRio/yRw5reGDxlfZkHelCxHIbJpG4o52
 uN96tUO4gmyhxd2YNaLiidYqzaFInAaCvh1s5gbBMngixYxy0EEapvZU3ek7JaKYtRKE08rP
 j7L2/aS2+UCnhLPIygpCHzA/etBnpBf6hlFwWgLK0mNhteY1OQ82wdc8GhvQwlYpvmdPzmf5
 oS/25VJGJiz
IronPort-HdrOrdr: A9a23:H3orz6spGEnIXY2C++NSwdgi7skC7IMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1FdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqpmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87isIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXsHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa13ackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmP29yV0qp/VWH/ebcHEjaRny9Mw0/U42uondrdUlCvgslLJd1pAZFyHo/I6M0kd
 gsfJ4Y042mdfVmH56VMt1xNvdfOla9Mi4kD1jiVGgPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.88,339,1635220800"; 
   d="scan'208";a="63394355"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByTOdmzmr3RJXoiYNGgYKnCy4TVXCmlIyd2IHmPHIhw8kZgh2myFA9PKixeKOzFiBq6efWwoaopDbEph1JsDfA4eEtpQhrFzYVaQp6pC9Cs06dHfUXhG50BfLfxe2UJfQrwquFqkXoqbBn2pVM3Ph9g+RqZ/2d3RLuJgk40qcmPWNOxuaadOu3ALyJWhaFubMgv8TbGzM7cUPRTovJQXI6V0klMqbh0inhyjKIDVfkTUoeaWawm2ReQfA9PWV7waoWwYnIr+4Iuk72qta92JeOpMG0nFWrLo+3+q3CYHF5JNr2C51jJb8ybGKkJZzkDtUTVNMbYJnVDLBXa0sTh0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zODdNV7ArjOdL7lhGTdFRD4+JJR5lQe2VVceAhdOiIM=;
 b=OkjnSV8Fm9AAXiPjj0+TVUVYmq5yZ3OfpsorPtjZEWoaEAbUc64HaWTRPQeIrkW5thim+KuIkWQPpDdTvTPMD70LAX5X5yVNlvQwvsjTr/B+tcE1QkQ9CVjpz9CaBOUCaphvqMB8eO5I4+3oE+Nt92fJ1YsSpZq+i4TLyzcCQua5h0jUo36AqpPZcBexXkuuZBNV+RyNINzrga07mYXNjru82hHC2xlSzFwUtwLqt+qstwoMaI8kzV0PsOR3jG8qhoiS3qJUF/u2K2grYLhuS+iwrrXbULrscfD2tCxOddMq0YaHQpGptrKEOs++qbu0UYsOWDoNr+ezFspPoRGwyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zODdNV7ArjOdL7lhGTdFRD4+JJR5lQe2VVceAhdOiIM=;
 b=kG1MJd74h+HgbXqXrlAFomfo+OAfanYKfhu0DanjeDnxwsqvBbQss1CirH0JtHTtU0D5WdVsWziTO+75hTQoz6V4q/1EmmdIHLo0HpSJIJ1hQxtJWN8wM77C5+ikdFfXIBx6YHCoiAQUGNy9kb0slujqsmz2QX6ISOWQccgZtbA=
Date: Thu, 3 Feb 2022 10:04:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alexandru Isaila <aisaila@bitdefender.com>
Subject: Re: [PATCH v3 1/2] IOMMU/x86: disallow device assignment to PoD
 guests
Message-ID: <Yfuahx0ntHJ2BQ6x@Air-de-Roger>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>
 <YfqtlZMAKd/HXsgf@Air-de-Roger>
 <2cd051c8-dac0-998c-cced-401c504ad439@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cd051c8-dac0-998c-cced-401c504ad439@suse.com>
X-ClientProxiedBy: LO4P123CA0160.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80b019cc-9d73-4a09-2122-08d9e6f425c6
X-MS-TrafficTypeDiagnostic: BN6PR03MB3041:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB3041CCC6CFCE7EED3B724EB28F289@BN6PR03MB3041.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DQOuMaam2qkNgFy63R5ESEkXQNC4UHLXF+dIzXEbD+kqtgnoo4Sgf5uVJAn7PKa5bEW0M7lb7vrXyheXBsh5uk5pATIGFhCk+tQfYR47EFtH/lqK2ebrKUc/DhbO+eTUO/bCWYIkirKvV8TsLFOB0OU59GDgHJUnp2G9J9IVj+MXmnJ4f/yJXf2GgG9NkvFur7HRuZ6V7zvxM9Gw6TecIfjZoTwQrD/76bGADz76Vo0gKZETAlZaPMYeXMqkSslfQLsoB4Zo33lG8Hick1ACcKD2XoHph+a48ZYq9R7ev7yOYXJrn/OdQNO8imWJK0jf6PrDStY0UoRURjfBGD4py+zMaiS74tWbb4yONn5O9ZCVWXzigr5uCM/FuzDK2Qd8keJulbg5FmX1YwGTYb3XcyRlJzAliNleqnFGNc7WqLRkCyc8voK8o7KfjiNLbHSeRQ/RA0aEuFZyLLbJiIPAa9cHwsaEQqAZxpgAKh0hqqlGl9s73iHYSR9lmSk7W6JmQF42jsHMXWPQL0FSUTEY3Gxwcm8Whunf3uLCymSx+hXGpc6aI7UzOuWWHUm8AGHk1C4iUOqh4IywUqVMSmGPW/uYiFTAIYeEkmaAGwQX25ysQsYZ9CPFyIl7eMAmxW8bY1rEjlazaLi51a0SYRVKeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(316002)(54906003)(38100700002)(6916009)(85182001)(5660300002)(82960400001)(8936002)(8676002)(4326008)(2906002)(66556008)(86362001)(66946007)(26005)(66476007)(186003)(83380400001)(508600001)(6486002)(9686003)(6512007)(6506007)(6666004)(33716001)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGNsd3RmNnFMdncwNWVwKzNTMDR5L2NmMEJOcG9UVjI4a3JlbXhjakxyODBH?=
 =?utf-8?B?SkRxc1daOFFCcENrRlJwano1eVVKWmcrUENSZGw1SVBOZ1FGVmVaZlErdEFr?=
 =?utf-8?B?WTBCM05yeVAwaUtGV3ZSU0RPcVRoY0JFYW82Vm5VYUFhQzN4c2pJcTE5MGdQ?=
 =?utf-8?B?QWVxeUQ0UjlmZWpia085WktxVlhzRVFCVzdCbWxjcisvY2sydCt5SjZMMHZZ?=
 =?utf-8?B?V3p5Sm1yeGFZMkV5U0x3Y3IzWFhmNzBKS21IaUVyNzlTSEoxR2lvTmFHK3Ur?=
 =?utf-8?B?b3NabUl2MVpNQnc2Wm01YU8zeStNbmVqU3JPcEVDajNIemdUSE5pZDdraUx6?=
 =?utf-8?B?dzIyOG9FNVJWenoyQkRUUnNpcm41dEZudDVZNGdRY1R1cnV2M3BwVHVFWnUx?=
 =?utf-8?B?ckJ1RTlZYlpwMGNHUXRkMWp6UENiVWluUkRvL3d2WHZnQmJzOTdMb3RMS0dQ?=
 =?utf-8?B?WUsrY2FoZUZXN2FyeHJUMVk0NW8zem9yRnh2Tm54M05sZFJZRlF4Mk5wb0Ux?=
 =?utf-8?B?L1B1dXFKM2tma2RDaG5FdkhZY2Y1eUJBNEJGRTVHbE5pZ3BuMVYxY1NoYUhm?=
 =?utf-8?B?c05PcWxhOUdGWTdPeFhFQ0ZzL0RkYmlnSjNyc2NpZ24zMlNMYTV4TkxIVTd1?=
 =?utf-8?B?ZjZIYnJtQkNaajVXcGN4S29yVkpodHJtVXJPaHdtbXI1YkprVDFncktvNzEy?=
 =?utf-8?B?bVlRNlFNNVFjTjB5SGl5TVNpa1FQU3BlR29IeDY3V3NzdDhVckRuUzcrRXl5?=
 =?utf-8?B?RWFTVEIyOUxucERQcGxrNTA5cFkxQnpGR0k4bDNCcHZBdzJLaDd6SkI1eVFa?=
 =?utf-8?B?WW85ZURGczkrdWpqUnk3QmwvbGE3STR6UEI1dU1MTW51cC9GdkdDdUljK3Vm?=
 =?utf-8?B?MzJTQkExWHVhRlZDZGRxWnl1STlJZi80VEFaSmVpNkl4ZVEwTmNtVmQwSU5O?=
 =?utf-8?B?N1IxUEdSVWdFN0NBWG9OdDZPM0Y1YXNETkRWeVF2eitZT0ZTZmNFOWxhQ2pP?=
 =?utf-8?B?bUx0ZXdPUGlIck1TY1B3d0JJejdRdDVBUkpOWmI5cVd3VkVFN2ZqUmNiSjhO?=
 =?utf-8?B?djdBcExZdk5GcmxwYWl3S2FNL0ltdGJueG1USzd5NUtFSURhVStHaExlT0ZL?=
 =?utf-8?B?S0dUWml2Ukg3NlhUYXJnektHTW5CSGNqY3JHWUQ4ZDYzeTZGZTZLOGZzZ3NM?=
 =?utf-8?B?akx1T3pnd2xFcTZENmlQVlBVcHJzOWlyTlJTcHY5NnpFMDFEeEhwc0FBMHZJ?=
 =?utf-8?B?WHpYQmZZQlVnalA0OGFiV1g2VmxOMDVscUpvMDk2L2ptekxWODdIMWNrNTVP?=
 =?utf-8?B?WTBvTmdNTVBZYWNnK05Rb2ZCa0t1MjFlOVprMGpBS0pDTXZ0RFVGMkJhekx4?=
 =?utf-8?B?UmE2LzhVcnFqbmo4VnZRamtVcU1JWVZIbDF4UHJnRjM1YkhIV0FSa25PVGpq?=
 =?utf-8?B?VmE2S2RyY2cvNEtHdkhPTjFFb3lFdmZ3UGc0RndNSnBXTWlnRlJDTTVBd0Zr?=
 =?utf-8?B?YUdmejYwNHVuMjhiRUIzT1hMOEZtQnE4UlU5cUZMbUwxUEErSkV2RWRSRExT?=
 =?utf-8?B?R2FIbkNLNWl4UjJtYzB5NjQ5U1F4R2Fvemd4aUUxc0hsZS92bFpwaEFWZzFr?=
 =?utf-8?B?M3FVdDRYQ1M4Z3JiYXIzSXJoNHFyR0RrcGZXU01IWXhsejROUTJFYWl6VmVo?=
 =?utf-8?B?L2tGM0NkaUM2MVFvdzdGMzNFMlFaMmxoOUNlOWd1QWZIQkp6a3hLMCtaOXla?=
 =?utf-8?B?a1FBNWpETW9LMjhsenQ4L1lkT0docjVsMWZKbFQyeUV5WVQyR2cxR2haMGxL?=
 =?utf-8?B?dE1ObWN1eVFIY2xtNkRWK29Ed0htS2tFMkRES2EvdjRwa2x5ZUZodklDRmFp?=
 =?utf-8?B?ODJ5SFF3RVpnaCtvU0dRZWRMOWMxQVEvU25uTWF6TDQzYnJLTnBHVDlrcSs2?=
 =?utf-8?B?TGFoZCtZWUJmdGpmd1IwV3VyemNrRFFRSjR6cEJVWmlpZWNBYnVIVk05TkJ3?=
 =?utf-8?B?TlhlM1A0V2NOcHgzakgvVWhqbFdCZDNXcDRsdmxRRE1VMEdCemZpK0kwVW9p?=
 =?utf-8?B?VGZCMURnSHA2NWtkMm4xSE5iN0NmL2p2Ri9NbFBxWFRuTXJMeXJzVE5RRThG?=
 =?utf-8?B?UFQxc3A5YWZUVmM0YTltbUhKVm1LbkgzVVpvbEZtR1hOUWp4ZTIxK3FVb0hn?=
 =?utf-8?Q?HlaSg+Ha4iT4DNX3D3Rhg2I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b019cc-9d73-4a09-2122-08d9e6f425c6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:04:13.1348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jboA+CmCwDt2MY6GCQCCgtidq5WDAhu2vN+iaEcbiiXpXgfhx7fC8Tz7NwSFe+++eO/JnyKdFA7sgx5fPxn7Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3041
X-OriginatorOrg: citrix.com

On Thu, Feb 03, 2022 at 09:31:03AM +0100, Jan Beulich wrote:
> On 02.02.2022 17:13, Roger Pau Monné wrote:
> > On Tue, Jan 04, 2022 at 10:41:32AM +0100, Jan Beulich wrote:
> >> @@ -359,7 +360,10 @@ p2m_pod_set_mem_target(struct domain *d,
> >>  
> >>      ASSERT( pod_target >= p2m->pod.count );
> >>  
> >> -    ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
> >> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
> > 
> > Is it possible to have cache flush allowed without any PCI device
> > assigned? AFAICT the iomem/ioport_caps would only get setup when there
> > are device passed through?
> 
> One can assign MMIO or ports to a guest the raw way. That's not
> secure, but functionally explicitly permitted.
> 
> > TBH I would be fine if we just say that PoD cannot be used in
> > conjunction with an IOMMU, and just check for is_iommu_enable(d) here.
> > 
> > I understand it's technically possible for PoD to be used together
> > with a domain that will later get a device passed through once PoD is
> > no longer in use, but I doubt there's much value in supporting that
> > use case, and I fear we might be introducing corner cases that could
> > create issues in the future. Overall I think it would be safer to just
> > disable PoD in conjunction with an IOMMU.
> 
> I consider it wrong to put in place such a restriction, but I could
> perhaps accept you and Andrew thinking this way if this was the only
> aspect playing into here. However, this would then want an equivalent
> tools side check, and while hunting down where to make the change as
> done here, I wasn't able to figure out where that alternative
> adjustment would need doing. Hence I would possibly(!) buy into this
> only if someone else took care of doing so properly in the tool stack
> (including the emission of a sensible error message).

What about the (completely untested) chunk below:

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index d7a40d7550..e585ef4c5c 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1160,17 +1160,16 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
     pod_enabled = (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV) &&
         (d_config->b_info.target_memkb < d_config->b_info.max_memkb);
 
-    /* We cannot have PoD and PCI device assignment at the same time
+    /* We cannot have PoD and an active IOMMU at the same time
      * for HVM guest. It was reported that IOMMU cannot work with PoD
      * enabled because it needs to populated entire page table for
-     * guest. To stay on the safe side, we disable PCI device
-     * assignment when PoD is enabled.
+     * guest.
      */
     if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
-        d_config->num_pcidevs && pod_enabled) {
+        d_config->c_info.passthrough != LIBXL_PASSTHROUGH_DISABLED &&
+        pod_enabled) {
         ret = ERROR_INVAL;
-        LOGD(ERROR, domid,
-             "PCI device assignment for HVM guest failed due to PoD enabled");
+        LOGD(ERROR, domid, "IOMMU cannot be enabled together with PoD");
         goto error_out;
     }
 


> Finally this still leaves out the "raw MMIO / ports" case mentioned
> above.

But the raw MMIO 'mode' doesn't care much about PoD, because if
there's no PCI device assigned there's no IOMMU setup, and thus such
raw MMIO regions (could?) belong to a device that's not constrained by
the guest p2m anyway?

> >> --- a/xen/common/vm_event.c
> >> +++ b/xen/common/vm_event.c
> >> @@ -639,7 +639,7 @@ int vm_event_domctl(struct domain *d, st
> >>  
> >>              rc = -EXDEV;
> >>              /* Disallow paging in a PoD guest */
> >> -            if ( p2m_pod_entry_count(p2m_get_hostp2m(d)) )
> >> +            if ( p2m_pod_active(d) )
> > 
> > Isn't it fine to just check for entry_count like you suggest in the
> > change to libxl?
> 
> I didn't think it would be, but I'm not entirely sure: If paging was
> enabled before a guest actually starts, it wouldn't have any entries
> but still be a PoD guest if it has a non-empty cache. The VM event
> folks may be able to clarify this either way. But ...
> 
> > This is what p2m_pod_entry_count actually does (rather than entry_count | count).
> 
> ... you really mean "did" here, as I'm removing p2m_pod_entry_count()
> in this patch. Of course locking could be added to it instead (or
> p2m_pod_get_mem_target() be used in its place), but I'd prefer if we
> could go with just the check which precisely matches what the comment
> says (IOW otherwise I'd need to additionally know what exactly the
> comment is to say).

Could you briefly mention this in the commit message? Ie: VM event
code is also adjusted to make sure PoD is not in use and cannot be
used during the guest lifetime?

Thanks, Roger.

