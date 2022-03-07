Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 381D24D0422
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:28:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286293.485770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGEA-00069I-6D; Mon, 07 Mar 2022 16:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286293.485770; Mon, 07 Mar 2022 16:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGEA-00066L-2P; Mon, 07 Mar 2022 16:28:54 +0000
Received: by outflank-mailman (input) for mailman id 286293;
 Mon, 07 Mar 2022 16:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRGE8-00065y-Eu
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:28:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab11dc8d-9e33-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 17:28:50 +0100 (CET)
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
X-Inumbo-ID: ab11dc8d-9e33-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646670531;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/aZEkVonQOClsqokFS5hc2h1yMoKA0ku8F9eRDlD+rU=;
  b=Mp+FzbPKFmqhu598DMqjMelTIXT1FdbHs/x7Enrd9GqaQXgyVZPylevy
   eVM0nTaw20u8lADDGTHj27WMFTsSpl8ns2zpMcp9/GVb56NldaMBY/h3B
   EeWCbFxjRjbvfR2fYKDC7qyM7B3xAdsmbZg+8/8xPSFxhES8MrkccUmCi
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65561544
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/u8oYaCpyYEz/xVW/zbjw5YqxClBgxIJ4kV8jS/XYbTApDkj0T0Cm
 mRLXW+Ea6zYMzGnKdt0a4zi90NXuMfVxtU1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgt8
 oxXp8TvFD11YJPdyac4QzBkNSdxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgWpu350SQZ4yY
 eIXUQhWPCv8ZCdwAU0tE6MPw8qJqXnwJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEmu/OhmX6Q8QbTLmj8fhCj1iax2hVAxoTPXO5q/Skjk+1W/pEN
 lcZvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+llpCN+RTBWTU+EmB/eY1lkd8feRos2
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 23S9EADa6MvYdnnPklR1XTOmHqSq5fAVWbZDS2HDzv+vmuViGNIDrFECGQ3D94ddu51rXHb5
 RDofvRyC8hUUfmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs3b5daIWCyM
 B+P0e+02HO0FCH2BZKbnqrrU5h6pUQePY6Nug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDn3lurUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOXGGodZOdglRdRDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:m9A6VqHi/35ycdVGpLqFfJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdoZJhSo6H6BEDgewKWyXcR2+Us1NiZLW3bUQeTTb2KqLGSugEIeBeOvNK1t5
 0QFJSWYeeYZTcVsS+52njfLz9K+qjlzEncv5a6854bd3AJV0gP1WdEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue72K7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLhSM0llWjoai+quGRiuerN/b8yfT9Hw+cyzpAKr4RGYFq9wpF2t1HoGxa7e
 Uk5S1QcvibokmhAV1crXbWqnXd+Sdr5Hn4xVCCh3z/5cT/WTIhEsJEwZlUax3D9iMbzadBOY
 9wrhakXqBsfGT9deXGlqv1fgAvklDxrWspkOYVgXAaWYwCaKVJpYha+E9OCp8PEC/z9YhiSY
 BVfYnhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdzs0CmXUL8o47VvB/lq
 35G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJK26WKUSPLtBzB5sMke+E3FwY3pDaRHVT9upNpH
 3oaiIpiVIP
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65561544"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXb+nLGunZYlEVpDWDl+LZtYJDanqQNN/EwOIRwXlJq1ZBkB3mLeN20XmDLbROna4oyvR3FlODoPZjV7t4FcrR20hXn35ZAUiPYi4FtoEaxrnUwdEzjqyyCnpFqYDu0Jl2yGrP2GBQcY1X5zzU1/GeGKlAckQzzULY0Aml4YhV2dyFRze7CbGdCBMar1IFnX6ooWBx7Ly1JH7I/7JjjNmD/TWW/OjSlYIKGJhKaIUFRYCE4Sm5yDTiouSYYXPjSziJ5G/mK39eYEnU+DwO22Pq7FYT3BSgZw0lNrhxIcSSd1Bzt2L1/nsHIurWbkIVNb+RjUwvYvxle9ww1UDbF1Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwmDFDYOQUrG51oIRCLnj5H/ptVgEgg2boLsbs0NflY=;
 b=dPazhiA4xMdb7BMy8CIK1p3XY5BS4pb91pzEcogfrztilo2ZvfiopxmoP6ZwlAL+YrN6jbGLecx5mzb9KRG34pNTntLCrzGqa5LxHaTKVFNiHoZXPjrOHoC36jsDHdY5043D2Jrs8gO83YysQFV1PTj92BB2DAdlpbSbTZNHFmtgcYiZYkZIuySHHPMZmAlQKVt7VKP7Jmj/rNXt58AkJHa5k+pafTu3VyW22KuadyIc82HzF9nQ8le1hqz4w+OHpRW4ALnK9++D8Q4inLpcytZMh+nKvt3oYVa919aMxQFFeG45EFimNnYJY4X6pwLUKd9YVeGPJucRlv68179Wwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwmDFDYOQUrG51oIRCLnj5H/ptVgEgg2boLsbs0NflY=;
 b=iGTaGDXVVg7/T5jLQdftlP9UeD6t9H7lXOF+kHIoVKfeyRJZIz28qcmj8Ek2JKCpssUl1dEkq37F5DUQvm9WMysX6+P8nYTUXCDpMISIE1jttfQwc3907hzGXsXoUz7cu5UDWoWDGYB4CvVwrbBCNcb0MEBy/hjj3TckCcfQoJE=
Date: Mon, 7 Mar 2022 17:28:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] vpci/msix: fix PBA accesses
Message-ID: <YiYyuf6YkydVU+hE@Air-de-Roger>
References: <20220307125347.71814-1-roger.pau@citrix.com>
 <1480fa5d-bcee-e945-6b2f-9db7931c63af@suse.com>
 <YiYtoxcpi/KalGqg@Air-de-Roger>
 <62bc3030-496a-5d33-9278-614350df94d1@suse.com>
 <YiYvltzDBzPCHzFx@Air-de-Roger>
 <758ed960-3e26-e63d-d0f0-be01bed3e4f9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <758ed960-3e26-e63d-d0f0-be01bed3e4f9@suse.com>
X-ClientProxiedBy: LO4P123CA0252.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53c71aaa-4ccb-446d-8c42-08da00578d18
X-MS-TrafficTypeDiagnostic: SA0PR03MB5626:EE_
X-Microsoft-Antispam-PRVS: <SA0PR03MB5626378B35A093AD0EE017AB8F089@SA0PR03MB5626.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uz7AVTihy4Uw5KYhmHjosg+Gpe0Yg4rYSRejddBEaRSOF+sfCNGGrOfcKC/uMm728IpIPqwoaCBadVU0n7S+2h8klgfecCL8Cl1N2VKMkWBz4cEKc/Pq9B+IcO/GXo6e6C0VdTeeuN6ZHn1YHxvE8hPbRI4CP5pARjOy8HG7vELOveDNlQAUCxpv94Wg6VtRTS6JnQqawcIu4Y6SHBDNqXY0L1G56q0rjQRMLZf9A9DcNdo8ChKJ2UWZv2jgqNUnA4arKavfJLCnJEgxLMVCvoURUAAmzGrbomaj3QNH0EdYi6oqwfBW0Buq52PgUOi23jriOewK4qrbCKWzw1+IdW32/2zuAZZSFa/S5BwAFB1+pMUmnFNTTFrns6NRSdpluidZ3mkfhQTtCSxLVDyeaWcypFg6ReG220SH5qr09hCbxR1doXuq/rD6xwPm9bU8VZq0H2SXGZn91zAmoydNJnBJO4Bh+Zb0RhPKkg9sitCnEm+7FcRQk7ecu+YBCW/0FuDYHrj3928xZvN3b9OQ807kMp8nvm152KWUd18p2jTccA84MlNgNDjwKdW/NkS+s1NKGG65AJYo9TT8gDbQkS4fIJa9OzmLdLH84s7YxI1u0xvwXSFiYg/A0nyeVfF4O3kAU4LaJrD817dd0W4tlmRshrX6dkkpxzd7wzowENh13Mz0QfpEozFJCRLzNic+6nFu1F6cQgPYinTVMMgCHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(53546011)(316002)(508600001)(6486002)(6506007)(186003)(8936002)(6666004)(6916009)(9686003)(33716001)(85182001)(6512007)(2906002)(26005)(8676002)(4326008)(5660300002)(38100700002)(82960400001)(83380400001)(66946007)(66476007)(66556008)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3lnUDRrc0F3NUpvMldPNWtMbCtEYzVGWGxvdDQrZlJTeTBKcWFiWE9EbDhM?=
 =?utf-8?B?ZXpBaklNZHY1VFJsYnR1VkZtRVRXbzIzVDQrRXpmUklPbjJ1djlrV2xMbmFM?=
 =?utf-8?B?NU1kUzMzN1NYU1dyYUp0dHljRGlwdUlHUmw0bkVwWW4vdGxzMzBWcndWWjY0?=
 =?utf-8?B?QVM3RHB6SHhYMWcvQnVoQk84VWN3bk0zOE40QUhzRS9ldXpzU2czbkZiWUNS?=
 =?utf-8?B?TkVPSFBhN0l5UUtWZFJEQ3ZvMlZWWk1wZ0FzQU5uOXFYaDhQOFFhY0dnaEVM?=
 =?utf-8?B?YjBqdUZqUlpXNTZOMVNrRWZ2c3BrSEI1aDdSVnNNQi9BaEZhbUFFdFhLd0xr?=
 =?utf-8?B?dzBZTHNBWng5K3ZKbllMaGcyOHpndVZmR1VsSk01RytkaThBTHZZc0xkVlJi?=
 =?utf-8?B?emN0STBBVW9qWDVQN2YvMEh6R1pvSHd2VlU1S1BVT1FBdUI3QkYvamZscGRK?=
 =?utf-8?B?SDFGdllab0RyQVZpWTRuc2x4ZEdZK2RJbUVWOFFqWWRyN0dzbml4OGFmZEN6?=
 =?utf-8?B?ZzI0Wmw3YVROTWFYYUJ5NmRZdEJEVGcxRTUyVHBod2ZVOVViSU0xaUdzSEFX?=
 =?utf-8?B?dERZWTlGUVFwVHU4UEFYc1AvWWllSkZvK1R6ckN4L3U1NERYRi93dkduWkMz?=
 =?utf-8?B?Y3JpejljRmhyQ0IxZlJkSFNMcVM3Y0lIQkpqN3pZMHdXSUUvNnZjWEY1VHVl?=
 =?utf-8?B?Q3M0NC9lRlk5R2cyZFJHSEdWZExuN2s5a0dLS2NTVktPUEdkNzc4WmFjTjFi?=
 =?utf-8?B?MFd3NUhoWmovLzNySFNxL1hPdm9VY1NCOUdsRTcwR1liZzY2U3ZlZFRueWxT?=
 =?utf-8?B?SjhpcHhrTDQ2bVVPdU5iakVlbXpITnFmK0RPNFBCdTZaQjlUVW5iM0xRSHd2?=
 =?utf-8?B?SlFtZFRYZnlMUXV1Vml4N1dnaDNyMG0ybEJqa01KWW5GcjhzcFBUV3U1TUNo?=
 =?utf-8?B?ZE0zenVrZjFCS0dJWXNTdGpjTGt6TVhvWXNZZWVoR3NLeWwzSjJ1YUtGM3hC?=
 =?utf-8?B?dzZtMTlmaHVTeUF4OC9TVkR1WS9xek8yUDAySTVjVko5aVgveVBjdkZpamVi?=
 =?utf-8?B?SWF3bzRTWm5XVU1mekF6Yk1sZEpqcFp0ckJhekdYUWVITVZFS2RrL1c2ZzMr?=
 =?utf-8?B?NHBVN0FZbnQvT21Td0F6Nm5NQkpiN1JjeUJTR3l1RHo4aUdxUGZmVXk5SWZu?=
 =?utf-8?B?cXFCVlhJamxiazUwTWVYL1dTTE5wYkhwcENLRnJ4RUFsKzVlamdMYnlsbXhB?=
 =?utf-8?B?aVJZanQzMEVxdHJ1ZE5JR3hybkU5U2p2NkxhVlJIM1FaVVJwQzh2MDdhaHhR?=
 =?utf-8?B?bjZZQ0VWV2o3dUZhNXdZWFNMa3AzejgvK25WWjkyS0F3cXdNYnZQUFRHSmZm?=
 =?utf-8?B?Tjl2MXJoN1pBK2VtSGZiNFZyV2dQVU9LY1l3YWZJLzJoNyszQWZ5blVjeHRJ?=
 =?utf-8?B?MnlHdjNJVEVwa09TR1ZlekU5dFBKQVYzWFVTMTRmSWM5RXRYdEpvRmNIaUky?=
 =?utf-8?B?ZW9ES1NyQjFlUTRWRG43UC85eFExQ2x2M29uS0YrR1d2SjZ3OFBJYTIwVUNW?=
 =?utf-8?B?VXllR0tvaldrMDlVTGF1MkFNOWhSN29rMFBHVVo4TVNwZGhUS1RVUDZjVTk2?=
 =?utf-8?B?Wi90TklqUi9SeXBmTVk1V3NSM0tMK3pZbEJSK3RGQ2RVMWZwNVVxQlZLRGw0?=
 =?utf-8?B?QWRFdEFveEdZZGVWVnNTODBFUXdqK1ZpOUN1SG9QKzE0OUdRSkpsaFM1a1B1?=
 =?utf-8?B?czVEUnJCUDNmWlFxVHpOVjE5NUdiL0Y3TXFvRHBkZEdLV1pIOFBLWFRNR0t0?=
 =?utf-8?B?UWN0VDZ0OTR3UmlXeEtqYlIvL0Ywa09KNUZYZnlad2RpN0FGQWgwUUl2YVM0?=
 =?utf-8?B?NXVXZkhJVGtPMmczRGNRTVVydWdLU2hyRWpIY1JlV0JrQ3BaRUxJa1Q1Nzgr?=
 =?utf-8?B?QkhyUERiNkJDZ2x0T1h0Y1FvN3gveExpLzE4QW9EMVNaN09ZMWJnZ1k5Z2Ur?=
 =?utf-8?B?T1l3bkxnbWdTenhhVEJ5djRjZlRLMnU0Ly9GZWc2Qno0WU5kQ2VGbGZ1ZVc5?=
 =?utf-8?B?aU1xMStFWllTa2Nvb29qU0c2NENSekpBWUFMbTRvLzBFYUZqUW1HclVnUEds?=
 =?utf-8?B?OFdzM09LSWtqV283TFViYzRhMFJwS2cwbTFDK3RpUytLdlNJUTZkRmliZ2ZU?=
 =?utf-8?Q?l7WxD9jec183OBW1HXWZzD4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c71aaa-4ccb-446d-8c42-08da00578d18
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:28:45.7884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8+Tnj56+P9hdYjsGsMZLJpJH9XFEfn2mkzXROnE2KnQfIy+wVWmIH5lbhdnshuYZOt+YNf2stXZx1teAyWCUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5626
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 05:17:59PM +0100, Jan Beulich wrote:
> On 07.03.2022 17:15, Roger Pau Monné wrote:
> > On Mon, Mar 07, 2022 at 05:11:34PM +0100, Jan Beulich wrote:
> >> On 07.03.2022 17:06, Roger Pau Monné wrote:
> >>> On Mon, Mar 07, 2022 at 03:12:32PM +0100, Jan Beulich wrote:
> >>>> On 07.03.2022 13:53, Roger Pau Monne wrote:
> >>>>> --- a/xen/drivers/vpci/msix.c
> >>>>> +++ b/xen/drivers/vpci/msix.c
> >>>>> @@ -182,6 +182,33 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
> >>>>>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
> >>>>>  }
> >>>>>  
> >>>>> +static void __iomem *get_pba(struct vpci *vpci)
> >>>>> +{
> >>>>> +    struct vpci_msix *msix = vpci->msix;
> >>>>> +    void __iomem *pba;
> >>>>> +
> >>>>> +    /*
> >>>>> +     * PBA will only be unmapped when the device is deassigned, so access it
> >>>>> +     * without holding the vpci lock.
> >>>>> +     */
> >>>>> +    if ( likely(msix->pba) )
> >>>>> +        return msix->pba;
> >>>>> +
> >>>>> +    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
> >>>>> +                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
> >>>>> +    if ( !pba )
> >>>>> +        return msix->pba;
> >>>>
> >>>> For this particular purpose may want to consider using ACCESS_ONCE() for
> >>>> all accesses to this field.
> >>>
> >>> Hm, I think I've asked before, but we do assume that ACCESS_ONCE will
> >>> generate a single instruction, or else we would have to use
> >>> read_atomic.
> >>
> >> Yeah, that looks to be the assumption. It has become my understanding
> >> that ACCESS_ONCE() is generally favored over {read,write}_atomic().
> >> Personally I prefer the latter when the goal is to have single insns.
> > 
> > Oh, OK, so I should use 'ACCESS_ONCE(msix->pba) = pba;' rather than
> > write_atomic then.
> 
> To please others, perhaps. As said, I'd be fine with you using
> {read,write}_atomic().

Well, given that you are the only one that has provided review I'm
fine with using {read,write}_atomic if that's also your preference.

Thanks, Roger.

