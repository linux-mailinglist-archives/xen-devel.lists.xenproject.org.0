Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B409489B92
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 15:49:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255368.437563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6vz4-0006an-OO; Mon, 10 Jan 2022 14:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255368.437563; Mon, 10 Jan 2022 14:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6vz4-0006Ye-LC; Mon, 10 Jan 2022 14:49:18 +0000
Received: by outflank-mailman (input) for mailman id 255368;
 Mon, 10 Jan 2022 14:49:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mw0=R2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n6vz3-0006YY-4E
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 14:49:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 795e51c0-7224-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 15:49:14 +0100 (CET)
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
X-Inumbo-ID: 795e51c0-7224-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641826154;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=K8e4XgOsC0KJH4cEqRKPO9CiH9y2Ex0kVzGMciqfwlk=;
  b=dhrlAjaSpPaaMSvHeBA5VC2PvfSr+BZJXKWy6iYoNkJNen9MUWwwV/wQ
   ntjXKbl7We3AUMsKadNH+y+byI4lRyeYqASkQXm4NeU/F79K8d1YojZge
   m33yU0Mkh+rb+HeOnONz1A3NakOv6X1nZDyFqEhK+2cBhcTxY0K4eYACm
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZjF7PJMPwyZj75V6o2pxyMLidfMXbwsGnXfbir0IPinh9FOsXq7errm7VTj79BnHTtnGiUqVdf
 v/sKFUFxpTXtRPTCaUO6rkYpd6uOX1TaO5gx+BUn43XIou7BbjEeHroqmFNJiDxs5PWCxAu3CX
 87STZYPN3QrPPuiWF53jEmbGt+40Uy8YVNziG9OZs8FqBQ1p0lgGVXT5RujL2Qj2RKurKoatyq
 xqCjI52yzwIWwzkyieagWE09bHMNruetyjoJ7/xi9jaUvij3hQtHoNR8/6so6Tfvf11LDoZhdI
 6qSA/oi8NLjDLXt4SpiHol2g
X-SBRS: 5.2
X-MesageID: 61580950
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NvHINKqZqqbypnRrAtGhBKFkgqleBmKXYhIvgKrLsJaIsI4StFCzt
 garIBmCOfffamf3ct50aInjphgP6MDdytNmQQs+/ilgQyoRo5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2IHhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnb+wQB9xFa6QpNUyYhQGPX9DIvRD6oaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4XQKaGN
 pdBAdZpRDbhTiceAVo8NM59s/yt1yf0TiN9invA8MLb5ECMlVcsgdABKuH9c9iHVcxTkkuC4
 HjB5H/wKhcRLpqUzj/t2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZtv0WhCj5W6JuDYQWtxfDOQ+7EeIx+zJ4G6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHk72cUSq29euonByDNHY7c1IdPCoWdF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdj/9tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7YalUwYnY1RvHNEghBHVb4JOi8BxkkdC9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKyNMYcVP8MsJF7dlM2LWaJ29zu0+KTLuftuU
 ap3jO72VSpKYUiZ5GfeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313DbOiCgGKr997BQ1afBATWMGtw+QKJ7HrH+aTMDx7YxMn6el/K9UNcmU8vrqgw
 0xRrWcDmQWv3iOWeFzaAp2hAZu2NatCQbsAFXVEFX6j2mQ5YJbp66EadpAteqIg+vAlxvlxJ
 8Tpse3ZahiWYjiYqTkbc7fnq4luKEaiiQ6UZnL3azkjZZ9wAQfO/4a8LAfo8SAPCAuxtNc//
 OL8hl+KH8JbSlQwFtvSZdKu00i14SoXltVtUhaaOdJUYkjtrtRncnSjkv8tLsgQAhzf3T/Gh
 R2OCBIVqLCV8Y84+dXEn46eqIKtH7csF0ZWBTCDv723KTPb7iyoxooZCLSEejXUVWXV/qS+Z
 LoKk6GgYaNfxFsT6thyCbdmy6469uDDnb4Cw1Q2BmjPYnSqFqhkfiuM0/5Qu/Af3bReowa3B
 B6Co4EIJbWTNcr5O1cNPw55PP+b3PQZlzSOv/Q4JEL2uH1+8LadCBgAOhCNjGpWLadvMZNjy
 uAk4ZZE5wu6gxssE9CHkiELqDjcci1eC/0q5sMAHYvmqgs30VUTM5XTBxj/7IyLd9gRYFIhJ
 SWZhfaairlRrqYYn6HfyZQZMTJhuKkz
IronPort-HdrOrdr: A9a23:Koqglq2x3+EniEJGSxo8WwqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W1Dk1frsA6ciYnV9MNOA4/e7rFNoXse2O7DIvAGyWvKEk4U0i92aIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.88,277,1635220800"; 
   d="scan'208";a="61580950"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ignES6sGSkX1nBBzRN80OHPdB6yJ5IUCCGvXn7tUOk39UG1MlPbJm0gOZXsVbRoG9M6IM8ugqKtXGQWcAc0uwU/3sc6QO1KK5bt/8uabAcyKWpfYsKnqv9ysGhvP3Z2ppZXKZzq8e2kXMFgnf5mY92fWt3NGQKnmRnVy44HWLsfKSpe6zwrSkGWEtCaLAZwaf/NVl2XGUOE7qBJHRgaDLjPfTNtYeLs3yq4gIcLeTgKpWHqI7FEDa3fJzDfRVkj2OLdvhHrbwRvsV9YUByQsqKxNp01p+0i/iUT+tJxXnZUVK7HaCvyxQUu6HqYpXDPJW8Yp8xbhxAZ8FbE4smsJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/rOWBZkCHOf6m+suA2xJZXcPVQDCubqcGBRn1yALfc=;
 b=PN3ec06BkPv/0/fyPVe9BrInJrpG/+HX2rrZjjPrPjK7EoUSKDLPBCcVP2MUBMNYYqxB6tEJWOyB9q+hkNhr7OJVBBeSKjFwad1Wmb5ONrwEHhLb6A1342wj8JgmZj2GgOOvV4nhdlYotSjBr6iOUV+p0IhpGjXz8xuU+BWxt2Gdw7wblkXPo3LsdObHTAj5RpIBRHKcZONUvSie5v2a6Nc8BCqsBidRg4d0NFroBg3/DfKZ31n06KFIx9lb4SbEgDzhoyyfDpMbdUXTwvOYM0kP97x6F14I1CvtHisuxRDh0/VD18AJhQ61qLx8weqUIh3AKtUqAwvAaJkih4VG7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/rOWBZkCHOf6m+suA2xJZXcPVQDCubqcGBRn1yALfc=;
 b=E+16K//CD9iCf6gTSUP/Yg0yHA1snJkqM8/gK+PcaWPbTDZxqCPic9U8n+7JfoccnFyXLD3/sLubm6F6mpBtHn8XR+YdU1DQQhImqvBWPLVSAQN4smHPGV/9Mj/29KleZXkIVPrVBl5YTVBXMs/LLDo79ed5mfyBTsiL9ksMi40=
Date: Mon, 10 Jan 2022 15:49:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: James Dingwall <james-xen@dingwall.me.uk>, <alexander.rossa@ncr.com>,
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Message-ID: <YdxHXqVUpUE+AAsx@Air-de-Roger>
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
 <c3b5ada4-a396-719d-79e9-6cae44b949e0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c3b5ada4-a396-719d-79e9-6cae44b949e0@suse.com>
X-ClientProxiedBy: MR1P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 966a0d2e-299b-4916-eae7-08d9d4485bb8
X-MS-TrafficTypeDiagnostic: DM5PR03MB3068:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB306897184245D6DF1EC1884C8F509@DM5PR03MB3068.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aQy+e90+/IJdkIlossL5kzPYDO+45n7aCNOK4Ig0tD7t2iXwA5ZJBrBavE8hT7rD7yLL7cqk6iX9gRmOVB7RVofx0EJM5PSvGib4ARcr3YyqXM/GQnKaubeEvge+Jja5T+JC+xqpyHGf9uP/x36bTo7cu2YAEByKInADv+AVi+p0EllCIaYriNoBVfKgcmMfBZxf6YXkOpdT9LD2ZirtDN4Da3VwEiGHW+q9GxOZqHXN9Lr0pC2B7NqwJXY2Z1L7DCLmANyj67JRjTpdlnh90M94+Y+B8Om/wlIPXEM3mayPTe8mhJ3KXcXydSNf09EY6uxcRXeUsDerozcz/MQ28e+KdngzQlw8R4YafreDnuYA7PMhz6ARkJuc0RhjCuxszmfi+yhp6rvA0u9zLBColdDmysHtvHGw+qB+kg3UYX35ToYU3SkISJGYzcZnHUhfshEZLEOfaoZNeXfNpkv/wUu9jB5LW13ez4p7jV9y5JGQeiOK69o0wlNsvqyBIKhwuXe2IMFuAks70ygkMAYwWxjbjTkxz1bqsWO1Q7QecIru+OsRWQHJm1y2DRQupUpb4H2o0h6HIvUHgHsr+1dD57Ychty10rkt4P0l2YhvC8YjzIyCTh8SyBZ4XViey9bpL4KUms3fjNbgECd4lM0Ptow5L4R3JMNwa9B220rwX/cmiscnry1kbHhWVGjGpDZDxHQlsDmVo694yEo5zBfo2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(54906003)(66946007)(83380400001)(2906002)(6666004)(107886003)(6512007)(9686003)(508600001)(33716001)(8676002)(66556008)(316002)(5660300002)(82960400001)(6916009)(4326008)(6506007)(53546011)(66476007)(8936002)(85182001)(186003)(38100700002)(26005)(6486002)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWR4U3dSNUlNbEVkNUl5azBMcTU1UWJwTDd5NzNEMXp5RWxIdlVHZDVTYUZX?=
 =?utf-8?B?US9iUG9UQms0T25kTXUzZUlqT2xsemtQNk9GQ0IxeVJuVk1VQWdtRnFTaXlJ?=
 =?utf-8?B?b016SnBmbGhYZkpCa1dzZVYzRjJNalp3NVRWZmNydjBmb0twZmNQS2I1YllG?=
 =?utf-8?B?ZFJ0bmZzVUpScTk0ZjlvVjZjQzhpNmtiVllmQlZUMW9EZGN6dUp6MlpjMkRN?=
 =?utf-8?B?T1B3RlBqdjdVTVE3SVQ2anJ5ejN5ZGNHVUJlNGhiakJ6cFpJSzRleFh6VzJE?=
 =?utf-8?B?Nk1JcEVDZnFZWUx0RFAxYWFMenM5UUxLZHp1RldrN2p3ZVUxL2JRZ2J3Kysx?=
 =?utf-8?B?aWhFcUJKWDM5cmZ6bGZZb1hETkpFbUJxaHUrN2drWHZTaVY5M0laNVU3Q01x?=
 =?utf-8?B?ZVlLSzUrQTBVUHBPN2R5QStiZE85V2N2aCtBRmZvRXkrcEFpeUxHNEN0Qkxk?=
 =?utf-8?B?VXpKRjZrWEdNN1NLUzJrazhuNEpIWlVZN1EyUURMbHBYQU4rNVRuUEFRMjBs?=
 =?utf-8?B?SVU4WkNWQitkdU9tMS9oVVhsMThJNWEwVHdXamdZSFgrUUpVbEc3QTZQbytZ?=
 =?utf-8?B?SWRTcjFaemh6cnc4dE1sd1UxdmhDL1NibXNwK0s4Mzhma05hMHJYUlhETXBp?=
 =?utf-8?B?UWx2WlN2eERVZDdKUFI0ckVQbEg2cVhOMDc3amt4bDNlNGN0akp2YmJFeWFy?=
 =?utf-8?B?bzR4TnJWQTRGOUoyaVFMZ2pTMlFCK1QwamQ0V3I3YXJKZVVlZm90MG5WelJ1?=
 =?utf-8?B?a0NrM3ZVeXV6SEJWVEF3eGVVZ1BSUUZESElQM0lFckdlMjRjNjQ5UDhIcUlL?=
 =?utf-8?B?cVR4ckNzdkhWS1p0TFRCRHY3RCtWRXd1SFZyMzhXdnc2dlIwSCsyTGgrWHJ2?=
 =?utf-8?B?UVlDb3MrOW9Rc2dPNU5BYVByK0FGMWhGWjl3SmtrMlEyNjlIRGFFWFBtWFpV?=
 =?utf-8?B?N0JhZFB4RnNoQmJvSXlINlFrNElocTNJTm5mQnZiR3FDWldjbGVFdzRFdGpx?=
 =?utf-8?B?OFpFYkFVVFY0NEdWNis3VEVyOTRLMEtlcGd6eHcxR1o1bGNJVzZpOXdGbDN3?=
 =?utf-8?B?V08yby91cFdUL2kwRmZNTUl4OFVTMm1XMmJXNUp3dVBEUkd4RllST3U5aXFR?=
 =?utf-8?B?b1QxcjFFMTFLdzRTc2c2Y1dkNEhkVHl1YVY2RGFYVjdUeC9uTG12d2dmR0Y0?=
 =?utf-8?B?Z2FVK1cwMHVKVlBoNHlzZkJPczBYU3VRa3A0NkNMN3pDcXhnL3lDdktMVFU1?=
 =?utf-8?B?Z1pRVGlUNjVOMDh5aDlNaG9uV1ZvVFFqbkRsKzd6aHdCY29GcVlFNGZNOEtH?=
 =?utf-8?B?cy9IK1hTMVBWeC9DNGF2TTFZVGhaRUNaRDBsSkVVcnJrbWhjYzVSRlk5SnlZ?=
 =?utf-8?B?d2o5dkNGajcxSlVHL3EzVmJJeXNsbldNcnhKZFRrSFlncWhsbjhPVG9qRWtO?=
 =?utf-8?B?YlozNGZGR0RhSkZhZ0s3RHRyKzl4TWdqRFBaTWxDemFWWGdhSGYzWXc0Yjhz?=
 =?utf-8?B?WDNGQ3Uybmt0OWh5YUtWdXVSOGp4cXBHNVAwWVVaK2htOXgzV3hiTXVYV0No?=
 =?utf-8?B?Wm9KS1F6TUxxUjhINVNjNU1pRWlOaFhNWEg5Ym0vNDgrOTZ5OXVINGF6RkUw?=
 =?utf-8?B?bUQ2aVI1Y0pyTkI0Q2pIcmtJSjBqN2REcXVPVWlYMk93T202RUtZL0pxbDhv?=
 =?utf-8?B?ZlRDaHdxQmNNSEVraWV0ejQ5M3NtYlFDZGxzZHRxZXFPaUxOSTVxampvOGFM?=
 =?utf-8?B?S0RCeXlXYXFPdFJqQk5GVHpPOUtzTFpQTVhrRTlHYjJLaktVMVowSFVsYS9E?=
 =?utf-8?B?dUtPWWoybzBNbnNKQzFGOHJGTjFIS3dtbzEwK1BGNktJT2x4MzVlM1JuUTZz?=
 =?utf-8?B?T3g3RnkxRGhURU85L0ZoeWFIdm1jUk5EQ205dzVWVTg4bDFPcHM1ZHRCSXVi?=
 =?utf-8?B?ZCtQYTRsQWcwcER4ZERYM3ozbTNtaEpreFF3NEpQMTljUkFJTTI3THNpZngw?=
 =?utf-8?B?dzlMVm9xWXkyclZvOHpKUW9uSkNvV042NUwxSVlQUU55YStZckFBL3N1aGVH?=
 =?utf-8?B?dEdVYmtUcUk1TlMzcEk5NVlYMStBbHJJc1pFbXJVdTVVbnJpZGExUkJtUHdr?=
 =?utf-8?B?WGNydFpxZlA5SHpzOS9rM01kaHk1blA5ZzkvSy85c2tyU2U3TFZ2RHlaZFNt?=
 =?utf-8?Q?kXzKMO8jBlqD4d01O7J8Jrs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 966a0d2e-299b-4916-eae7-08d9d4485bb8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 14:49:09.5901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XLiMyug+ZF6qTjF4I5iVmxRJTnbKktsu6Fh2eN+m7fkHFOejcBxAwBCGpp/vqqB/vtQNGsKNlaW62QcZANVDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3068
X-OriginatorOrg: citrix.com

On Mon, Jan 10, 2022 at 08:52:55AM +0100, Jan Beulich wrote:
> On 07.01.2022 12:39, Jan Beulich wrote:
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -378,8 +378,9 @@ static u64 read_hpet_count(void)
> >  
> >  static int64_t __init init_hpet(struct platform_timesource *pts)
> >  {
> > -    uint64_t hpet_rate, start;
> > +    uint64_t hpet_rate, start, expired;
> >      uint32_t count, target;
> > +unsigned int i;//temp
> >  
> >      if ( hpet_address && strcmp(opt_clocksource, pts->id) &&
> >           cpuidle_using_deep_cstate() )
> > @@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
> >  
> >      pts->frequency = hpet_rate;
> >  
> > +for(i = 0; i < 16; ++i) {//temp
> >      count = hpet_read32(HPET_COUNTER);
> >      start = rdtsc_ordered();
> >      target = count + CALIBRATE_VALUE(hpet_rate);
> >      if ( target < count )
> >          while ( hpet_read32(HPET_COUNTER) >= count )
> >              continue;
> > -    while ( hpet_read32(HPET_COUNTER) < target )
> > +    while ( (count = hpet_read32(HPET_COUNTER)) < target )
> >          continue;
> 
> Unlike I first thought but matching my earlier reply, this only reduces
> the likelihood of encountering an issue. In particular, a long-duration
> event ahead of the final HPET read above would be covered, but ...
> 
> > -    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
> > +    expired = rdtsc_ordered() - start;
> 
> ... such an event occurring between the final HPET read and the TSC
> read would still be an issue. So far I've only been able to think of an
> ugly way to further reduce likelihood for this window, but besides that
> neither being neat nor excluding the possibility altogether, I have to
> point out that we have the same issue in a number of other places:
> Back-to-back reads of platform timer and TSC are assumed to happen
> close together elsewhere as well.

Right, sorry replied to the patch first without reading this.

> Cc-ing other x86 maintainers to see whether they have any helpful
> thoughts ...

I'm not sure there's much we can do, we could maybe count NMIs and
retry if we detect an NMI has happened during calibration, but we
can't do this for SMIs, as I don't think there's a way to get this
information on all hardware we support. The MSR_SMI_COUNT (0x34) is
Intel-only and requires Nehalem or later.

Thanks, Roger.

