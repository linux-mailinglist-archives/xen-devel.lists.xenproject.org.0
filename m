Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198E041B935
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 23:24:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198495.352023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVKZD-0008Td-VK; Tue, 28 Sep 2021 21:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198495.352023; Tue, 28 Sep 2021 21:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVKZD-0008RI-SE; Tue, 28 Sep 2021 21:23:11 +0000
Received: by outflank-mailman (input) for mailman id 198495;
 Tue, 28 Sep 2021 21:23:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEZ0=OS=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mVKZC-0008RC-Ij
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 21:23:10 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d7a31f4-9a1b-4d84-a557-d25183b2e48e;
 Tue, 28 Sep 2021 21:23:08 +0000 (UTC)
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
X-Inumbo-ID: 4d7a31f4-9a1b-4d84-a557-d25183b2e48e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632864188;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YmuC0MxgQv3gWGOe9bQXdJuMkj0hqsaqclxYjYBzEEc=;
  b=aZAuZjL3W7N07/+uxDWATxMy1U2dyYyFfDe+RgaZEQ9obBt8ceQhZoK9
   Oab0mOc7KKdU0eZsqDgGuu75jiytjV+ZWnror02qoHAeeYFMT6bkz+0a6
   n7E6T2A35uXZtPb6+Xhetk7QSdRaoWXh11DxUwYKXrjpyDB9Yp6dwSpPy
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 58Ol8i+C4rm434DQYfPIcgX1YmQBHfDfhEhZorncbsXx94qsgKak+wNn9SqzfXxBBYe1YSjB4A
 TMK9iBfTWw7fgOmEaMYICxHsXMcO6l2D45KsWDuJP62O8VavXA2UmLAmv6TXl0iYbMGbwDmdmk
 Kz1Ul3oeyhjyJA10iLF8lf43trcrJHKM0ZVcoqwcsqLip9oocDaw112xNZjU6fQ8Qa0kiI7129
 xK/KXJ7JaglIc/t8c3DU7xhqEBaSKlXOsvE2iJ3uv5bTxJGYpIH4I07MA1nxPsCX5mPZOSmh64
 QC9NEjITZ+GDlSbzOdiUV1JP
X-SBRS: 5.1
X-MesageID: 54270631
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DmPPS6ir8rxOXTeiBMctxIXoX161FRYKZh0ujC45NGQN5FlHY01je
 htvWmvUPvjcZjPxeNp/aoW080wDsMXQzII3TgJvr388EXkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg2t8y0YDia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Ou6O2bSobNJTxv9kmCCZiGhBEAJxZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauCP
 ZVBN2E2BPjGSz50EHQpA5wsoOupmnjBSwZArxXNn5NitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEhPLLnC79cJIfEvu/7PECqFeUzGYCThANVV+2pPC/okG7UtNbb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6nAWwDQi9EecYRnsY8Tjw31
 XeEh9rsQzdotdW9RHaQ8L7SsD2zPDQOIHELTSgeRAAB7p/op4RbphPQTP5zHaitlNr3FDrsh
 TeQo0AWhb8ekMoK3KWT5k3cjnSnoZ2hZhExzhXaWCSi9AwRWWK+T9X2sx6Bt68GddvHCAna1
 JQZpySAxOMAMpepuR6HedgqIYry2MyMAQfhsEE6SvHN6A+R03KkeIlR5hR3K0FoLtsIdFfVX
 aPDhe9CzMUNZST7NMebd6r0W5xzkvSwfTjwfqqMBueidKSdY+NuEMtGS0mKwyjJmVUgnLszM
 JOWGSpHJS1BUvw2pNZaqv107FPK+szc7T+PLXwY507+uVZ7WJJzYexeWLdpRrplhJ5oWC2Pr
 75i2zKikn2zqtHWbCjN6pI0JlsXN3U9Dp2eg5UJLbTTf1Y7Rzp9VKC5LVYdl2pNxP89egDgp
 C3VZ6Ol4ACn2S2vxfuiMBiPl48Drb4g9ClmbETAzH6j2mQ5YJbH0UvsX8BfQFXTz8Q6laQcZ
 6BcI62oW60TIhyaq2V1RcSs9+RKKUX07T9iygL4OVDTibY7HFeXkjIlFyOynBQz4t2f75Bj/
 OHwil2BEfLuhW1KVa7rVR5m9Hvo1VA1k+NuRUrYZN5VfUTn6o9xLCLtyPQwJqkxxd/rnVN2D
 i6aXkUVo/fjuYgw/IWbjKyItd7xQeB/AlBbDy/Q6rPvbXvW+W+qwIlhVueUfG+CCDOoqfv6P
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAbvA
 hCP99BWNK+nIsTgFFJNdgMpYv7ajaMfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s4ZdE5Ra+hxwmNse9ohpVr2ncfGYdV6gHt40BBNO5gAQc1VwfM4fXDTX74c/TZowUYFUqO
 DKdmIHLm69YmhjZa3M2GHXAgbhdiJAJtEwYxVMOPQ3UyN/Mh/tx1xxN6zUnCA9Sy0wfge50P
 2FqMWxzJLmPoGg01JQSATj0FlETHgCd92zw10ANxT/QQESfX2DQKHEwZLSW90cD/mMAJjVW8
 dl0Eoo+veoGqC0p4hYPZA==
IronPort-HdrOrdr: A9a23:psYckK6DplwutkWHAQPXwV+BI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoMkmsiqKdhrNhQYtKPTOWxVdASbsN0WKM+UyZJ8STzJ866U
 4kSdkFNDSSNykLsS+Z2njALz9I+rDum8rJ9ISuvEuFDzsaDJ2Ihz0JezpzeXcGJjWua6BJca
 Z0qvA33AZJLh8sH7qG7zQ+LqT+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+uemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lgdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNwN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wmJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABOnhkjizyxSKeGXLzAO9k/seDlEhiXV6UkWoJlB9Tpb+CRF9U1wsq7USPF/lq
 z52+pT5ehzpmJ/V9MLOA47e7rDNoX6e2OEDIujGyWUKEg5AQO4l3fW2sR+2Aj4Qu1E8HMN8K
 6xJm+w81RCI37TNQ==
X-IronPort-AV: E=Sophos;i="5.85,330,1624334400"; 
   d="scan'208";a="54270631"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAqMaVMTRu29tzAee0e5sm93JHildLzhpCoIIbbtr/vV0fDTUf0Ko8hEmPpccUTHonGXh6c4xhUA9bjjZpCSMDUfk2tAYRGGD9lk3bBrh4eEXh4yMqESwS5nbGbVzGA4XkUd3oXgC6wWJlFQRPuqIMftQOc8d6RmW1fmXcMyTAx8zuspyS7vHeSAKn1jquB4gf+MWzADJU8YZmbSqoO9KofayJ+As91oFKJ2IGKYPh4s76bStl8KVrjSLy/BYs/jQ5T/3tLtTnv1iwCMwU51i7esxWJKe4oRlQQtXeIWC55UKdBWRQqNLKan7WzFWo6mEOZ2HgcsH0ojt+/WknP07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YmuC0MxgQv3gWGOe9bQXdJuMkj0hqsaqclxYjYBzEEc=;
 b=AZivaa6KyswFhb+ZFkfz5IkZYuxZOQtopSN+8ou6rJa5n+jKx/iYGsg0oPQOt+w9OpPMPKIwgS3ecuqj9x/xfixe9BVeSHp5SOkyR/9z33Eu2c36RQNxxP/3j3gAETxGDRFLoRPe72D6GeLdrhcd8gQo7pR4wjd8ZeXtzPSgf59GqGp1COMYR3BmBSmyrPXBku5jiZjF6lizuTdiodDnwyD7xhRlpxA0apWvMcbOuKO+I4jhBHQSaKiiTAYStFoRhytN2BgVZzeW1ltih5XmjBY4z1AnwSnuTCb7IzuGlU0cMRLRx1jCj+bLAqyEbza2vyYisROMLDcxNPek7jr6fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmuC0MxgQv3gWGOe9bQXdJuMkj0hqsaqclxYjYBzEEc=;
 b=A0fQgvfQ+5R9U8bwLFxespfdSfX1k/6MKRFuGRP2r15NKj8jlIcRTPlCJ8bBQVHkJBCdSRp8jkl31q8dhw745JsKrh6Y4RKk7yeh20VGKL80CQqPqsO2tPxdY/TuYmwFbzEU0bDxpkCWA91VtGkkxXC3iNoxPkvvQa4cyEY+sS8=
Subject: Re: [PATCH v4 4/6] x86/gdbsx: expand dbg_rw_mem() inline
To: Bobby Eshleman <bobby.eshleman@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
 <472215cdfa754634f8070386bb3122bf3e3cedc1.1632860589.git.bobby.eshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f66fef02-14d4-b70e-30ce-ab372cc03977@citrix.com>
Date: Tue, 28 Sep 2021 22:22:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <472215cdfa754634f8070386bb3122bf3e3cedc1.1632860589.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0389.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8dc57b5-39f0-4f0f-1563-08d982c60a82
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5693734E8A8552F75C00A49DBAA89@SJ0PR03MB5693.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JrT9ws2knFE0ZbU8nfW4tvyUNawHW1n6ZqM4XK216a1LaKdpaq4UwT9MTDh9PMWlUnR7BuO/SoqG1z9OOj5numNRgvfjloEmurBQ+tSqZkzPdlhu8xfOHlW8QhGgOA29IcPEnrcOLnTaGU7JNvkovTwQEfblOoD7lmKfBUIkKjbH0fyT4LtnZmkU6C15NLzeFduqleal6l68392Vg+slghwDPa5Gg3ZP7SUGlYdJzXDKARS2gflVAExB4Sto5BLVF4LSUPu4ZwGNeO3y33i6ls/p+UxWBBvmIub27XSVEA5bQ8/9Foen07L1CPWI2pM8FYfFx0YCmwqK7NsMMcqM7TMiaSkIFlwOm3lb9VCzDRs+yWTRhpkQT7GM2UDFzFtGp4ODGvHhm8uUWWL4QJnjnJ6fdx7kIM7GuTL8RBOKy8T+IhTAn+aG22h9lfTSDAtpO/1ezvbM5xRU3hJOnPu/xQoSlsG28uV37X8CvQPyRikewqApvosqKwcK9WXAehsTSSvCGAd2hojy5H151Z2XErYMBepgre3pb1FKdP00DyMq9JsTUrNBCm9yOPRpCLqorLQB0hXszUghK6m/0bpnVIIwhdHdih51ON+5kd3pYlERsmPq4QvBIDMAbuD0mCswcwMv4IMdyKGBkIcDYrHyKCCFEHWdL20g6jGCV7REFBmk7v6qPaADFysM00pPeiqxIBPYkfsqEJxnBOMaJDIx/Edhz+OIctxo6z5ewWg2SaOnmKy2AcgzYuiz7oZnG1VA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(86362001)(508600001)(31696002)(6666004)(186003)(8676002)(2616005)(956004)(2906002)(6486002)(4326008)(36756003)(558084003)(5660300002)(31686004)(26005)(316002)(54906003)(53546011)(38100700002)(55236004)(16576012)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SURLWmhsNkFCWVdtRi9DenUyWmRSMU9iTnRrN1BOTjJITHJuZ0VSTXdCL1Rs?=
 =?utf-8?B?NzNuQ3VhRGZTZUlIMVVQbGc3a3BoV1UvUkNrNm01UkNDVE5RbkZqV25IOE1D?=
 =?utf-8?B?cm9Ncy9HSlhhck5QbDc3ZWJZL2JqdC9ZazV4YVZzMWdxeWZyM25Pbmd5cmFv?=
 =?utf-8?B?Y2d4RjZUWVpvZk9Rck5DQWU3czczekhKcHp3aXh1enFaUGM3Wkh4MElYTUdB?=
 =?utf-8?B?WEM4Nllqa3VOUnA5R1d0U09BNktiOUxNZDR0K2xTRWY4Tm1hYmRnYzhjMjlY?=
 =?utf-8?B?S3NEU2RleDhOWFdrV2NkUEFsNVJVZ3Npd3QycWpDQjJGelZRSkx2dCtjVFho?=
 =?utf-8?B?S01DczZMclN5anZRaDYyWHdKOXgzTHBHVGJrWkdhQ3E5Z3pHVzBqRTN2QXBi?=
 =?utf-8?B?V3RUN2w5b3daWkJYZmVLdk5WY0xzWFEyd0dpNVU0bldVMzhLdFRacTN0RWd6?=
 =?utf-8?B?NWczV3FzdjQ2SEYzNlBYdDdONXAxTzR3cmt5UnRKT1NvSjF0Y2ZiTzNLTlY2?=
 =?utf-8?B?d0R5SXFmNmJBZ1R2elV4dXBBY2hsamtEM0hvWmhOZWdVR2hxL0lGdlNDSjI0?=
 =?utf-8?B?MzhCZjQyRVFjT1NpWDcvd1VCM2pMOGpSMGZkYlZDZ20vY04wdVRzdnZCT0Vl?=
 =?utf-8?B?UkJpV1dsSEJYcFZNRUNYZnl1b0gyQ2l2UWUrNkdzRW4vUVU4dlNCL3ZLblpW?=
 =?utf-8?B?eEpJcDVvYzFrd2M2RmphQSsvMjhWT2I5Q2d0WlM5TW9BeW1PZEgrRU9PanZL?=
 =?utf-8?B?YXVXcDI2UXRKaDJNK2V3ZWlCZlhFRlBXbmlFTTlLYVRiU0FzcG95SjNlQWlP?=
 =?utf-8?B?ZWlXbkl3cGlEa1FuOUg1eGJuaHRqNmZPbjdZL0pEdGt3cEkxK1hKTlpxTjUy?=
 =?utf-8?B?ZVg0RkxsOGdsVllqYjZCOGMzaWZGNUlxOHQ5WTM0d0VqTlk4UWsrRCt5dlFC?=
 =?utf-8?B?TS9RUU1EVURUTGFZV2RjdEduSGtTUG5WbDdSN1RLalo1am95cmRDZGF0NFJY?=
 =?utf-8?B?VktiWkJ5cTlLdmphS2ZnY1IxSlFVaGpkZXVKYmVlOEJVV2lFUS9ScmUxTVR1?=
 =?utf-8?B?ZFEwcU9TRXg4NE9yWnRFRDRHVGNZVnljTTNPZEM2Y1VlamdFNVptRHhpMjNv?=
 =?utf-8?B?dEJSU3FGTDBsT1lySUxQQjFQd0NaMm01dklidEFnd2o0RkFkOStMSUhaM3VP?=
 =?utf-8?B?Z1M3WGVwZVBmbEh3RjE1M0Vpa3pmZXhHMFlveFhqQ0Z2ek50d3ZXaDJRcDZY?=
 =?utf-8?B?dzVZR0dOK3dyZG1xVXFLRy9DWkh0ZUQxQ0k1ZXdtbFJTRHA1Q1hBQlZUK2xp?=
 =?utf-8?B?eHdFOTNUYmozTXhUWDBjeExCbUVXM00wdGxYM3diS01wUytmcndiZE8zMUs5?=
 =?utf-8?B?aGY0WFU1UjdFVTFNV3BGWFMvZGI1UmhjLzVTd0RoTnZKZEM3ZlpVcUhPQVAw?=
 =?utf-8?B?endjSzlvalpXTDBjZkNSbzNKd2piY0F1NWkwNUVXWndXdGw5SEc3L0xIZFVE?=
 =?utf-8?B?SjNRYjg4SWRoY2d5QnFiRC9NVUN4b2NVeXVtMVNPbDVmaFVPcWZ1bnlBS2V6?=
 =?utf-8?B?Z2JRYUFZNGlOMVJ6c1A4N29IbDJ5NWxHRisrQXRQS1Z4ejZ5eEMyY1pOelZL?=
 =?utf-8?B?KzgyUlJnMm80c2xsdXQyS0lBVzlBOEN6cTVHTzRtaFNHVFpuNVhlRjlXMlB5?=
 =?utf-8?B?RkRhRTcvN3FUUnFaZzNjWnpTZlIwVHg2YXJrTk9rNWhzQzhwOWdoL0czVWtu?=
 =?utf-8?Q?Z3I87ZfTQZ5NZRSq4BfXCkcj7TmYJclM5vBUne9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dc57b5-39f0-4f0f-1563-08d982c60a82
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 21:22:14.2267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Wbu25jG56gpLUki0ynwVZWoNgQGHbVifwNn6ggZuCc7NAw1tCJNOqXnV+e9YBMSP7jzTS3ljg8WOQndUrP8UyB2WUz6NFRLbaqqe+L1w00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5693
X-OriginatorOrg: citrix.com

On 28/09/2021 21:30, Bobby Eshleman wrote:
> Because dbg_rw_mem() has only a single call site, this commit
> expands it inline.
>
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

