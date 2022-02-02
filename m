Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C514A75B0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 17:22:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264354.457431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFION-00076Q-HA; Wed, 02 Feb 2022 16:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264354.457431; Wed, 02 Feb 2022 16:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFION-00073m-DQ; Wed, 02 Feb 2022 16:21:59 +0000
Received: by outflank-mailman (input) for mailman id 264354;
 Wed, 02 Feb 2022 16:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAZh=SR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFIOL-00073g-JK
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 16:21:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b1f5cac-8444-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 17:21:55 +0100 (CET)
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
X-Inumbo-ID: 3b1f5cac-8444-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643818915;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NuQHegXm7Ik4y7VVZynrjLwz4N8D5X/RJeOs54iO/6M=;
  b=FpFLwSTgxLFoc7KN7wWU6srqv2jxCEQJi2AJ2nd5mrmZndJK5A5MJM8o
   hm3qG3oS8iigCqVc7uG7fm16ZYVRdbUWJPH1Kp/vxL1XPSUtt+SoYBOX3
   eV9txgNIaZlncsXDdGRo7xhjMjLHSXS0Xi3ifGhwUP5W90Cz/V+9wIm2G
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ANsPVcZJiRCn47DXYyUQQ1W6NMHmhKTb7WQdUXLBvd8pcQGBDucRxMFOLSCQnB1/z/XKah1hZh
 CQUgauqG9i8MDeGqU3ugPyA03h7bCfNzS3pQCF3zsHuHs+LzqbE55j0vZFczjF65N6l7cGlkwJ
 /NXdAQ288rTl0qaHjQomBNaHhf38J+9xuv6sWSgXf0DNoCMqmBtFqWBspTCpgm2FOKUj2AssK3
 bVnbNFSU/nvd+4fOB2d3qM4V0mrTG90YZittA6/weA+pdksh3LGAmztCmmpZIbBa99opa7YavC
 KP488YNQilTx30S6r/8xy+QH
X-SBRS: 5.2
X-MesageID: 63336349
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xTDdAaMKnnXClLTvrR0dkMFynXyQoLVcMsEvi/4bfWQNrUpxhDIEn
 GQaC22Ha6neZWT9f4sjPIvipx4GusDVmII1Twto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500o5w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoyiZkd8t8
 /4XjJW5TV4ZbpfHn/wwCDANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uRvoQGh2th7ixINfnMb
 OcWZHlGUEyDYURMP1o+Eb07vPj90xETdBUH8QnI9MLb+VP71xdt2bLgNN7UfN2iRshPmEuc4
 GXc8AzRAAweNdGZ4SqI9DSrnOCntR38XIUeBbip7MlAiVeYxnEQIBAOXF79qv684mayUsxSA
 1YZ8S0vqe417kPDZsb5dw21pjiDpBF0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 TehndnkGDhuu729Um+G+/GfqjbaESoaN2gZfgcfUBAIpdLkpekOYgnnF4g5VvTv15usRG+2k
 2viQDUCa6s7kN4F2PmA1gr+ijuo/6iZdAUy/iiMdzfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8R5r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C8RLwJtdiON7Kih6SdkyfcpElTiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymHxlmj+KFMGmlkr3uVZ7WJJyYexdWGZik8hjtP/UyOkr2
 4o32zS2J+V3D7SlP3i/HX87JlEWN3krba0aWOQMHtNv1jFOQTl7Y9eImOtJU9U8w8x9y7mUl
 lngBB4w4Aev1BXvdFTRAlg+OeyHYHqKhS9hVcDaFQz2iyFLjEfGxPp3SqbbipF8pbE6kK4pE
 6JYEyhCa9wWIgn6F/0mRcCVhKRpdQixhBLIOCygYTMleIVnSRCP8djhFjYDPgFTZsZuncdh8
 bCmyC3BRp8PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2vIz
 RuSDDcZufLJ/90//u7WiP3WtIyuCeZ/QBZXRjGJ8basOCDG1WO/2oscAv2QdDXQWTqsqqWvb
 OlY1d/mN/gDkAoYuoZwCe8zn6k/+8Hut/lRyQE9RCfHaFGiC7VBJHia3JYQ6v0Rl+EB4QbvA
 xCB4NhXP7mNKfjJKl9JKVp3dPmH2NEVhiLWsaY/LnLl6XIl57GAS0hTYUWB0XQPMLtvPYo56
 u49o8pKuRengx8nP9va3CBZ82OAci4JX6k978xIBYbqjkwgy01YYIyaASjzucndZ9JJO0gsA
 zmVmKud2OgMmhucKyI+RSrXwO5QpZUSoxQbnlYNKmOAlsfBmvJqjgZa9i46T1gNwxhKuw6p1
 rOH66GhyX2ywgpV
IronPort-HdrOrdr: A9a23:C8Zfeqyvt/HOkozXvp5nKrPxtOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cJzp/ktHNZA7dc6MLuK41P2MGDx2UKpUB3a/fI8SjrwQ6Ce2sRB2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.88,337,1635220800"; 
   d="scan'208";a="63336349"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8PHBfuGW3FT7deHRf+chzbWa/6TDM0DH1mNPyCC/JEoeuwOXFnlCT+XHsomQ8+cROcPKXFYmM12q91COhuh+zARcF/gl029IToOAxMiB//1lYAG+VmOSIhVxpvahOar1n5bf/Y7JHnj4m6Fu5ewBqXDgEZQXBhUPTwOq/XTWVangmPsUfR44ZlwZsTq9UwAqbrRqE7sLx/ad/vyxKK/43lWZimqcdIwAT36HUfTrsgpz0yJqh9gINeCKIGgcCr0Y24mkJTu1TTflKerF6hdCmjEBCz2ZuGjKAyvhmsdYOI4U83b73Y8sTiyYrsTab51Nz8BFe8bhSFTBFtA+MIc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oX2XUgQZLdvJTKeETKdvaH3bGnwRKUNefaD29Rt6NWc=;
 b=CJKwiQTPScSfNmi9fA5E9VckzONDKfK2CTv9f4k8dZYXz+uQGGs61cCfXzTnt6FvrgD1ZTNbEAK6cjFlkJK8QTH7ABWaAtFNnVzh+R/GxpCgLdUV614g5ipQio4y6iNG6b4oPy39YtXZ8eFaa8ajuhiZS5+ayrPC224BLeBKwvO8fuLZsAxtqAf9i4lPRjcIcn1O7rKjP+OTu20MowTc6A4LJMrktqHV9OshdxfXxQEzTaGUXaGfiiTqzCBb8TarnD32lqZYwC5VSeqtKHXs57iEZG9jwacAyEJnIpmWLcz4/bKBRtcgVVKSX+Jvlzkt36bxtFrtWtC+xKhx8dAYUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oX2XUgQZLdvJTKeETKdvaH3bGnwRKUNefaD29Rt6NWc=;
 b=KUhmD3UTKxyZDIrKtiOQVwB6gRCQXc6vPlloPlh98iTMtsKclyer4OLA+4vViXjdXqeak+tIMyxkNu1bfJqVtMUe0V3IYFL2D9M4OXnamPjKNOwjiL1lofuy6lXjaQgu+Hc6G4SU+xivpg0HxqJjN65r7mZQSL2KRcIwCc+pxzQ=
Date: Wed, 2 Feb 2022 17:21:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YfqvgvnKvkLCuupA@Air-de-Roger>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-3-jane.malalane@citrix.com>
 <YfkFJTYXa/7DSTaI@Air-de-Roger>
 <1364444e-aeed-7e0c-dc81-67365324350b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1364444e-aeed-7e0c-dc81-67365324350b@citrix.com>
X-ClientProxiedBy: LO4P123CA0405.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09d1b435-3dac-4062-0f2e-08d9e6680f29
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6389:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB63897F26018971B2964D29D08F279@SJ0PR03MB6389.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZtzRv1ZCFHKiKhgFeP8cfvu1T0GEGoXvKuPVHJko4xXhF1HU1FTT4nU9Y6hDrTJ8oyxnPoIPASAzW+tWQAiXy9pYz4ZMudPDiBvph84FKBIup4vva7oW0153TvU/bOcBKc+/VfMkbIQdT1d1ZvxuZCoHtDulqEAmEeDYvU5HF65x5n+SEvvGBweQZP9ra2XQa1pd7MGKHOeWK+yFX45+KfXZoXO9uj7uwzIECuaIMZ7p6G0iTk0Q4ePPPcahS2OPTKJnCg+h0J4RNaXlaMEKSJV5VU6nYO7UjeQJ5Tu0yH4pfOH3zdjVMzkjVTiyRii1OIL5b5YNY0niyjhvxT4K8xpiEkBeUfHFBI04R5DTrbGO9IWAvIsevzebiEMiJmI4Hy2qfoZ05FBXhQdeShdBHldIjq2aMrKgeD9+uLWydYjeAPg5Qf9JcWtkhi2EhdaIxLeBeAZeIK0CsBEDKf5kGHSKrHwtpZ0Xis14xbEm7mXgYffPqp1ndnscQ+95UTypQOkoflv3Yhu8t/MSku57CpSKN4iWanvn17uvadJyFsKRLaKiy/PjR/1C2YqWpXOnvzpJw2C0vsOUcCfXJkudpA9O3qTEoeRDO4zyotiGZ4wbh90f6Ri969B4EpYIdKY2yClC2ZxB1QbN+JB2+5opTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(86362001)(33716001)(38100700002)(82960400001)(53546011)(6506007)(5660300002)(4326008)(66946007)(66556008)(54906003)(85182001)(66476007)(508600001)(6862004)(8676002)(8936002)(6666004)(6636002)(9686003)(6512007)(316002)(186003)(26005)(83380400001)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qzlyek41bnpjcnJ2MDBuWDdnNDBKOWoxRHc5WlQxU2tBOUdYWVRlMFlXa0pB?=
 =?utf-8?B?YldnZ0Z0YTVmcVd0VnFsN2NPYnl2UEFOL3pBU1hKcGNLYXNwMEJJNklheG5Z?=
 =?utf-8?B?b25jb2hFNk1yU25pR0VBV0pQbE95OUtLRWxYL29lcXZjeFN5c3ZqMnF0cUd3?=
 =?utf-8?B?SzlReVA1NXJScjcxRGozT1RZb2w1TWRXUjRoSzNBNFFuR0ZJVitTWFdob3p6?=
 =?utf-8?B?YklKZ3lySmJtbkw3WXppSjg4eGZreWl6UzY3aVNJcUF5d08yZzdoNjBBNzJH?=
 =?utf-8?B?bTVOQmxkZVRUT1Z1MzhCTE44OEZ0dFB2RVJhcmp2RnNxUUNOc2VWdTBlTThl?=
 =?utf-8?B?UGpaMitwZnhqbUZmZU0rUEk1M1RBbUFQU2pheXdWWTk5UnpheDNiVkZNR2xv?=
 =?utf-8?B?eFhGWit6ZE5UQnBMOVBMQmphRnVwc3habEl1NXhsc2R4TlJGMmpEOExTUmtH?=
 =?utf-8?B?bzNldFBPVmZadGw1L2t1NjNHOTZuWTIzQ0pwSkJ5all6RndYaWxaMXdSVERr?=
 =?utf-8?B?Ym1sM3lXeG9MeXYyTS9ZRVdKYUFCK210TWQ3RkdpYW5mQkdRSFpjQkU0Nmxn?=
 =?utf-8?B?L25zWG5TUzhaSmxzeEtoZDYySThtTmJYaU1xSU1UaGlRTVVwQUdPM2c5TUM5?=
 =?utf-8?B?TTE2TlJGWmpINTIyRjV4UGEyMnhuVFdkd01QTzlwQWlOb1VvczY4MUNDeXQ2?=
 =?utf-8?B?aG0zY003TitrMStTelo5UzVBUXlNVTd6Rlh4b1NmTENSVTdONm5xVDUwMlRu?=
 =?utf-8?B?Y3JWRmNMbkFsVmVOOGF3TlBudlA0M3E0Y3RpWTFIdGVFQzlnM2VKYVZ0RTJS?=
 =?utf-8?B?WTQra3l5aFlnOWdEZFdydUswM2k5a1Y2MGxkZ1haNlNRYmRhTHlJYWRMbDNN?=
 =?utf-8?B?bStNSWwrc0NnRlRNZCtZMDB4UnRTTi9FUk9BQ1RudDgyR25ZRTdkMVI2VHNk?=
 =?utf-8?B?anNnNDRadXNHUkdjUHpGOE1jQ2hUNjJLbVVsenNTRkRqUVNGRE00WnlMYjdp?=
 =?utf-8?B?ejJDRmZNemQxZkQwQnd6U2MzdnU2d1BjSnNNOGw1K3lTK09ZOEJxQnl1T1RW?=
 =?utf-8?B?NllaTVM1bVVFbUZlR1VQNXRrcE5jNk9nMFFVK1p0WWtkMmwvb2tQTUFFNlNm?=
 =?utf-8?B?NFF6SjBDUjZBMnB6Y3lWdkJWNlR2VUpQSmNkMXBQUTNseGZ5RFkxaXlQYWdj?=
 =?utf-8?B?TmJtQTdUdDY3bmdIUmhZdDlTWGNCc1Nud3JxMXppNGZjOERyaU1qMFQ3c1RN?=
 =?utf-8?B?NEkzdFVTdTBPeUFSb2tXbFJDRTJGWWhnbXEzOVI1OStsRlM2cUNndUYvOSsv?=
 =?utf-8?B?VXVyWGhqcXBtZzF4ZGFTUTVwbVJvTktVdlN0RDZhSTAzUFpqRXRyaWNtQWp1?=
 =?utf-8?B?NEJGNmtMMHNvRTdGWExscDJPY29IYkwyakFpUGlOMmlzaS9vdUpvQnFwUnZr?=
 =?utf-8?B?TlVlZ0doanExaEVmVzFHQk9lSWxodDlEQWthTElWSGx2UEhtRitHYzZzZWlV?=
 =?utf-8?B?VFpKU3YxRHBHNDA2dGZBTVU4VG9VSzlnTmsydlY4TGt0MzVVcElKcXlhRk9E?=
 =?utf-8?B?RG1hQVI2cVk5VjUvRHhOazdFSzRUKzVFUEVtS1RCeFpLcHltK01kWlp4UjMv?=
 =?utf-8?B?bUM5Y3pDZW5ZckFuTWUyenVNYlRUMW5Qc0VsVFY1VkZoOFh4MW5tUFZKQXUy?=
 =?utf-8?B?RDh2VU95K3NhOXhTQzlhcHl0WnVnbFhaZk83SVVoMUNIcDMyM3JRbkJ1QWJ1?=
 =?utf-8?B?TjJHZW8vMnpnUDdpL3BBU3ZCZGx1NUFaQXNmQ0xvMUF4MVpJb0plRVN5Z3dl?=
 =?utf-8?B?WEQ0SHptZnY4UVkydDB2c0N1cEU5enNVQ2laVGZiMUpNdUkybzdURUkwS3Rv?=
 =?utf-8?B?L0JXeTBBckh2Sjl2TTJPSEF6UnZydEpnRDB6U3JZQUlIUGQvOHpmZmM5bEk1?=
 =?utf-8?B?NzZOZTBMZ3BCdHl1YnAzWGZiSVpQZkJ4U2I2NjcvQytOczM3Sm1ZeFY0UTA5?=
 =?utf-8?B?aUJYaGpoRUppYVg1WTl1SG5KUVJnanVybEpnS2ZWY2dVSm9NOWR0UDA1MCs1?=
 =?utf-8?B?KytqemhBV09HNytGbzI2TjBCZHZBSUNBOWZYQ1Q0YkRXZGNTVWcxQ0pZM2hW?=
 =?utf-8?B?OFNDZ01keGJ0TTNkY1h2QmpSZjZBb3dHMFY4TzRNU2NZK2ZpL3dIblNROFZF?=
 =?utf-8?Q?kKNHCGhhf4jzrt2/euvCMOE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d1b435-3dac-4062-0f2e-08d9e6680f29
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 16:21:25.7159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mH6pm45+gLbGE90mR5Hea82C3E+cTDWAEByt6UEWmLqyqXR0/gX2igs3b4SZKRcCH8aMQoJTjKXZZmddBFnwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6389
X-OriginatorOrg: citrix.com

On Wed, Feb 02, 2022 at 03:19:13PM +0000, Jane Malalane wrote:
> On 01/02/2022 10:02, Roger Pau Monné wrote:
> > On Thu, Jan 27, 2022 at 04:01:33PM +0000, Jane Malalane wrote:
> >> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> >> index 42ac6c357b..db5eb0a0b3 100644
> >> --- a/tools/libs/light/libxl_types.idl
> >> +++ b/tools/libs/light/libxl_types.idl
> >> @@ -819,11 +825,44 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
> >>   {
> >>   }
> >>   
> >> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> >> -                                              libxl_domain_build_info *b_info)
> >> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> >> +                                             libxl_domain_build_info *b_info,
> >> +                                             const libxl_physinfo *physinfo)
> >>   {
> >> +    int rc;
> >> +    bool assisted_xapic;
> >> +    bool assisted_x2apic;
> >> +
> >>       libxl_defbool_setdefault(&b_info->acpi, true);
> >>       libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
> >> +
> >> +    libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic, false);
> >> +    libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic, false);
> >> +
> >> +    assisted_xapic = libxl_defbool_val(b_info->arch_x86.assisted_xapic);
> >> +    assisted_x2apic = libxl_defbool_val(b_info->arch_x86.assisted_x2apic);
> >> +
> >> +    if ((assisted_xapic || assisted_x2apic) &&
> >> +        b_info->type == LIBXL_DOMAIN_TYPE_PV)
> >> +    {
> >> +        LOG(ERROR, "Interrupt Controller Virtualization not supported for PV");
> >> +        rc = ERROR_INVAL;
> >> +        goto out;
> >> +    }
> >> +
> >> +    if ((assisted_xapic && !physinfo->cap_assisted_xapic) ||
> >> +         (assisted_x2apic && !physinfo->cap_assisted_x2apic))
> >> +    {
> >> +        LOG(ERROR, "x%sAPIC hardware supported emulation not available",
> >> +            assisted_xapic && !physinfo->cap_assisted_xapic ? "" : "2");
> >> +        rc =  ERROR_INVAL;
> >> +        goto out;
> >> +    }
> > 
> > I think the logic here is slightly wrong, as you are setting the
> > default value of assisted_x{2}apic to false, and we would instead like
> > to set it to the current value supported by the hardware in order to
> > keep current behavior.
> > 
> > Also the options are HVM/PVH only, so having them set for PV should
> > result in an error regardless of the set value, ie:
> > 
> > if (b_info->type == LIBXL_DOMAIN_TYPE_PV &&
> >      (!libxl_defbool_is_default(&b_info->arch_x86.assisted_xapic) ||
> >       !libxl_defbool_is_default(&b_info->arch_x86.assisted_x2apic)))
> >       ERROR
> > 
> > libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic,
> >                           physinfo->cap_assisted_xapic);
> > libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic,
> >                           physinfo->cap_assisted_x2apic);
> > 
> > I don't think you need the local assisted_x{2}apic variables.
> 
> Makes sense. In that case, could I instead just have this?
> 
> if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
> {
>      if (physinfo->cap_assisted_xapic)
>          libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic, true);
>      if (physinfo->cap_assisted_x2apic)
>          libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic, true);

I think you actively need to set assisted_x{2}apic if they are using
default values, or else a later call to libxl_defbool_val will cause
an assert to trigger.

libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic,
                         physinfo->cap_assisted_xapic);


assisted_x{2}apic need to either resolve to true or false past this
point, but must not be left using it's default (uninitialized) value.

> }
> 
> Or do i still need to also check that assisted_x{2}apic hasn't been set 
> elsewhere for PV domains, in which case, I'm happy to add the code you 
> proposed above with this code I have here too.

I would prefer if we actively rejected options that don't make
sense.

It's wrong to try to set assisted_x{2}apic for PV because there's no
APIC at all in that case. I will defer to the maintainer, but I would
prefer if an error was reported in that case. I know we are not
consistent in that regard, so I'm not going to block what you propose.

Thanks, Roger.

