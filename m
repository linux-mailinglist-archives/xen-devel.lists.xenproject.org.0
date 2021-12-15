Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8702D475471
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 09:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247238.426291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxPtW-0005Sf-7E; Wed, 15 Dec 2021 08:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247238.426291; Wed, 15 Dec 2021 08:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxPtW-0005PU-1m; Wed, 15 Dec 2021 08:44:14 +0000
Received: by outflank-mailman (input) for mailman id 247238;
 Wed, 15 Dec 2021 08:44:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iD5n=RA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mxPtU-0005Nq-Tl
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 08:44:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bae42ba-5d83-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 09:44:11 +0100 (CET)
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
X-Inumbo-ID: 2bae42ba-5d83-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639557851;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LiGmE41CA0sxKglQkTC+aAionA4riLwh9n/+hRtPagQ=;
  b=becK6jpJlibGVe3tobCf/NcRbh+qORf8qlf9b+lBAfraTyVujc0iRNHm
   7kf5vd/KljhVLoIGFpuoEvTH4OHSd6xmP8KkdiG6qj5Asu0oZAB/8Fc59
   lo78LThoP4W52z6PmJu5MpjmsCerkgKXfsy+V/tQ+XwxMCh0CqFwIt8Mw
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: X7EN5DQ0lAUxfrZl+No+DvQ/AfiWSa4tchedwvMmrdxElN+PkxSpnZy4bI5f3rxCR5nlgE5+iU
 ONZeVFB7xxGvsWLB4P7k5aqwlNWio/Qn8BnZGdIZ9tBJsI7bFyCvMj/8wNJiUO4Ojs41hDC0hV
 eyMgyL1uHYyzE7P6/7EpoWgxJ346v/rAFgwdddr2ZadVir2kZcCOH/Kboe6cWGMR8k6p1yEToZ
 9CVHTUxcC3AD8CCfTH5Vq4aGRmr2aFOJLbjejKAgVIk8D4qGsMoCjfgNvDXLYUTBx3nKIyDZ5k
 Aqug8HgBSHitUljvSqPgNi/8
X-SBRS: 5.1
X-MesageID: 59560885
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sK+/iaJ68LL64/V1FE+RBJIlxSXFcZb7ZxGr2PjKsXjdYENSgjZRm
 GoXCzrTaa3fYGX9L4pwOYu/8h8H6JaAzN5jQFdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH140Eg6xrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3OkfpX5
 fBBrqfoVCovYqOdpd0iAgJhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XtIIGhGdg26iiG97XX
 MVBMQpSci7pbiZOGmoTL8ITucun0yyXnzpw9wvO+PtfD3Lo5Bx81v3hPcTYfvSORN5JhQCIq
 2Te5WP7DxoGctuFxlKt822urv/CmzvhX4AfH6H+8eRl6GB/3URKVkdQDwHi56Dk1AjuALqzN
 nD45AJpo4IU2WmnVeKlQjC+/HDVgycjCsFpRrhSBB629oLY5AOQB24hRzFHacA7uMJeeQHGx
 mNljPuyW2Ux7eT9pWa1s+7N8GjsYXR9wXoqPHdcFWM4D8/fTJbfZ/4lZvJqC+aLg9L8AlkcK
 Bja/XFl193/YSPmvphXHGwrYRrw9vAlrSZvv207u15JCCsgNeZJgKTytjDmAQ5odtrxc7V4l
 CFsdzKixO4PF4qRsyeGXf8AGrqkj97cbmaN3AYxQcl8p2r3k5JGQWy2yGsgTKuOGpxbEQIFn
 WeJ4V8BjHOtFCXCgVBLj3KZVJ1xkPmI+SXNXfHIdNteCqWdhyfclByCkXW4hji3+GB1yPlXE
 c7CLa6EUCdCYYw6nWHeb7pMjtcWKtUWmDq7qWbTlE/8j9JzpRe9FN84Dbd5Rrxjsf7f/lyKq
 4032gnj40w3bdASqxL/qOY7BVsLMWI6FdbxrclWffSEOQ1oBCcqDPq5/F/rU9U+90iMvuuXr
 Hy7RGFCz1/z2S/OJQmQMygxY7LzR5dv63k8OHV0b1qv3nEiZ6ep7bseKMRrLeV2qrQ7wK4mV
 eQBduWBHu9LFmbN9QMCYMSvt4dlbhmq216DZnL3fDglcpd8bAXV4du4LBD3/SwDA3Pv58szq
 rGtzC3BRp8HS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbDj
 lSYGxYVo+XJsrQZytiRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvocgQbZmyaUyu4nmq7NAl1k2GXzKaxKgC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Dv/06LXLz6DJz4LfaA15ZOAOBiXAFIbZ4WG//L
 TzNZCLCB9SDtycX
IronPort-HdrOrdr: A9a23:J2j5galdCm92FbWhCaWn++ykFtzpDfO0imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmHp6VMt1xNfdfOla9MS4kD1jiU2gPNJt3ck4l+KSHqInc2omRCek1Jd0J6d
 P8bG8=
X-IronPort-AV: E=Sophos;i="5.88,207,1635220800"; 
   d="scan'208";a="59560885"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkNclx5Fi4w2EGGYmYXEmQnpJ0XjscFddgB+ed85K6RNj3vYV4iUpWTmllpTvTReK8nWpFOZqUR+WwU7VQJCaECFraTWtXjqpqu4i6a7vCyUAqk6bJhYMYk6sUvv0/1zU/2YoXsfNoEUIjVcpbbFI4qagEUUyR73+0eqkAwi8GvCvXDNjhmtkQw+FJnhGTWOiyDqmlNeLIakTJZoiGdCLTtj+/9oIxAX5MngjRYMtt24tzfXehQHJLn9+ZtrYlkWutRnP67s/w7XMe/3LjnHAytiGQ4BTq2nWTcsR9tjzEP/GB2DcPp0yrWfaS2oIDTOFog1vML1YEUuF0snBXz+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQo+YxlM23lAFaH0EiGqDgYh8OCGv5h6MGHipUu+WX8=;
 b=Sdv2DQFzZseu8LGVfbbNDI5wF5HM04xJ3GycRJ8ub9UWDGMAxzsSQeseNNhs07FjSJVPLE83jRTQWzhzAGGoXjhLtRFgH1Yd0Gxvudd3TIeDWcB/VMT7ds3gCeK1gZjUDWgfwmz9QDaJwJUx00tZHthoetrDYQdFom1r6UZc/oCep1t8jbQM9sE+yayguHC31s4O4pauRZh/ECRD6rqjF3Sq9bqw+RlbJGPbVEMBSP1YLYcAKGotDaZhLX8Fz757KlA2ZJrdEKA5nrnKg3ZP25fK6F1HBxdAXdYt2xPGMWcdFtJzjelp0yh/j0cylsdL9G5MpZuZv9gRseF4PQrHKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQo+YxlM23lAFaH0EiGqDgYh8OCGv5h6MGHipUu+WX8=;
 b=RB84v1G53fIZejjYugFDGuSikc0ONc4h9W+qPEox/9LlaIKl/x6UZrI1oCAv01aw0gXSeuscD4S/dq4/cp4cmNMt5OKVQHOnI9A3wmxxF4jrNlolYMA4nsnKUvl2Nk4mLLv/08gNyYz1duBXl/TV2AEvUH1Yj0oiKrWigrgjb9Y=
Date: Wed, 15 Dec 2021 09:43:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [OSSTEST PATCH 1/2] daily-cron-email-{play,adhoc}-*: Drop Citrix
 email
Message-ID: <YbmqzVQSKxf2Vbd7@Air-de-Roger>
References: <20211214145226.2248-1-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211214145226.2248-1-iwj@xenproject.org>
X-ClientProxiedBy: MR1P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 989ee883-7ea9-499a-cebb-08d9bfa70bb2
X-MS-TrafficTypeDiagnostic: DM4PR03MB6096:EE_
X-Microsoft-Antispam-PRVS: <DM4PR03MB60960EAFF416CB2492591A258F769@DM4PR03MB6096.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hpJo9gJONG6Wj8ZNRWuA2zUSAGymwOXh8Av8+pO49v/yckw8ptzbScq7Cx4v+32tj8s2mOnX44JpklqjV+v9+yaO5Q3sVxlO3CALXBWFuG2HK94Dub9iLQEHkJGufsusHcqUcMzckAbFXcISxu4oxBzKZNe3+XQ3uR7crNKTT9XcAIGUNq03kwNmFGl8hXGnPbGU+B16rJ7mro5RhJ5J5GxNAhMF4zBnVYm9A4LWLYK3sK0B2jzJnANgI+YaI10+THm4kz0H98/NiOAmVp+VCEhQ4n/w3SDurYgUoUx33PVuqfbbW55t3phdRP9YgfKvh11JPPLko7ohmUGjSQqgHrF/YC4qeo39rRE7i8vvBWBXpGb92Ekn4T0NBMfbUGYFZGwsZ0aEwg/zoaygvV4LnHqyGpHErdKjJo9d+w3L5jyu2w3GnwA48YPk+/sHMGoHAi2rbuvlLtkRMthwSVg/Py9O97Lo1e3G43b63VwT8xviRbJE2xEyKrS1jChzI5z0hd3J/Zj2VKru6ubreOyIspwr7bWOd439shvGX4Rb8aUgG3pbs0f/qTaSsZ0opt7vorvc3HtOoa0uJxDi7YcKQDjGe0q5zCjZyC3kt2sRi5BpJp6qp6npx0qx+qX7yIQsar5TAldTuwwW3ALT6Kmwow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6666004)(9686003)(4744005)(6916009)(186003)(85182001)(38100700002)(6486002)(83380400001)(6512007)(5660300002)(33716001)(508600001)(66946007)(8676002)(66476007)(66556008)(316002)(26005)(8936002)(2906002)(82960400001)(86362001)(6506007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmtUNCsrc0xtdjQrZUwxNDlMbjMzM3YyWHp0ODdEQ1lYVGNneFN4aTFIU3c3?=
 =?utf-8?B?aHlTYUw0SE5VZkFTR2ZwYW95M2p5L1VBTExjbUo3dGpydkNIZ2Y4azlnZmpj?=
 =?utf-8?B?THlvTVVsWG0ybGcyNi9TVyt5V2toeHYvV0EzdDIxVDMrOTBZTHVXUlRwKzVG?=
 =?utf-8?B?c0UxVW9zSjhvN1hPZ3NXcStJMXVScVFiYlNsUVJZWUtNZ2RQOTZBL3c2SC8y?=
 =?utf-8?B?TGJvTzUvM0lad3V2cmpSdll6RVNYM3BNTEdlVStGcFh3cm5VQVVqT28rMXJ2?=
 =?utf-8?B?L3I3Y25HbGEvTFdvWmxKbGo4TEZlNDU3UVhUV2p1dytvbzgrQVZCcXpFYjNI?=
 =?utf-8?B?SVo0SHUrK1VCaU1acUdVWHR2cnhZUlh4c3Zvbk5KbkJ4dEVGMWo4ZE5hV2tk?=
 =?utf-8?B?NXlMSVlaemxDaXpXYWxZZk81eW1jUThwU09ia2pSaDV6MDkwOXdhemhPYkJ6?=
 =?utf-8?B?dFFWcWZURk1hblhqT1orUWxhZzdnT3JHNnNjU3BTc05UeXhQdElJVmRYL0hF?=
 =?utf-8?B?a3JwN20xS1ByYWllU2k4L05zT2YzdmRZNlFweGlTaVZveUpVYklzeDRoME5D?=
 =?utf-8?B?S2Z3Zkp2NVFMZmtua2lWRXNPZGQvbTVVbmNueDBMMnFpaFpvN1JhdWRiUjc1?=
 =?utf-8?B?OENRNE9TaFNIa0ZWRi8vNUEvR21JN3pnTFd0am1rUEhGSnBGcmRtaFUzTzhE?=
 =?utf-8?B?aWVUWGkzd0FFeDY3UXp3bXgrM2NxZTlaWUkvd1dzQzVoVm83U2xGZXI4S3lF?=
 =?utf-8?B?VXFhSmZPall5UTZoM2NuY0FibWlsaDIvRkRiU2l2NjVzTVZTR3U2Znc1OTlD?=
 =?utf-8?B?V0p4U2hHTEM3Z0ZlR3lqY3hURk9KRHlXVStPbXpnVFhaSlRENGhZMUxhQUVO?=
 =?utf-8?B?QlROd0swWVZUR3UwRWtCaGVXdWlvWGF4R3ZZMHN2dno2N0F4VVpTY2pxK2c2?=
 =?utf-8?B?Ukt4amI5aFp3RkRVRzNUZEdFR3c2TWFLZmhXWXorMDFYSEI4NWdTN1pXendQ?=
 =?utf-8?B?dGFadnRkUTBEcXJXRUJNUytOWHJkU3A5Q2RPR3pvRG4rd2JWakpvL09pYks3?=
 =?utf-8?B?aW42ZGwxQkc5aTFZMFVRSFBVNFJYVGVZNlpNb2tQbkdrN2lZZkpreW1FNjU3?=
 =?utf-8?B?MmxZZ1RGMkZPRVdXQys5NzF2dEdkU25TUXpad3lWdlBoUzNYUGp3d0FGQmxO?=
 =?utf-8?B?Q04rOVVpd2VyTE5BVllwQXBFM2VYOEdBK3VqdmJ1RWdwQmZpVE5rMGNvQmJh?=
 =?utf-8?B?eGI4YnlPdHV6SDNOVTlDU3FiMkkwa1Y0SDE5cXYzRTByNnhXVzF5MG5OS1Bi?=
 =?utf-8?B?Rkk2MlNLOGgvZDRLNkQ5VlBIUitPMzJJVGQ1d0NDWFhQOUVGZWVwTTFkR1Zm?=
 =?utf-8?B?Qlo0dHo4WVRGbkdBcUhVUmJLcEFrbGVvbUlXc2NFaW1BSHhUWG95QXV0aGdJ?=
 =?utf-8?B?eWFpVkN3QStOOUlTazNKajZGTmd6dXZkaGJkRVVDMDRiWDVQb2p1SkRqNGF4?=
 =?utf-8?B?TXEzYjhjTDM4Z3NKeTZHZ1VWU0VVa1lyTDJaQlJaL3E1Zk52ZkhYWi9tMFhy?=
 =?utf-8?B?SEN0ME9aUnU1TmRxUTJrdWVtaWNGVVEwcTJxckFFT2RPd2JyS2xCMytZTHdh?=
 =?utf-8?B?U3ZRbkJEd1JGVDhqdHhwTkJKTkNPOVA5eUhXb3dPZFB3TXJTN0k1MlF2OWFl?=
 =?utf-8?B?NlN3WXJkWUtFSXhOUkloQ3JRNHpkcUtZWW05NWU0M1dxOThaenpFYW50cjNt?=
 =?utf-8?B?UVhSbDliSGtkemNkUHdDdFQvMzdiK2dLYUhnTW9Qb1RoTXZPVEM2NFN1QzZm?=
 =?utf-8?B?UjNIYmNPNXNXTWVRekdhZkFDK1J5VFo4cDdYS3FjZUg2OW5KaUg0YWYzbHJt?=
 =?utf-8?B?ZCtURm95d2g1NWFtbUtJdGp2SXNSUmt5Qk9nc2pkTkduZ2hCSDlVblJHS3Ba?=
 =?utf-8?B?MHRTZHQzSTFudnJCM0MyMDBxcXdGa0xzT01pOEx4QmpXQ1g5dE9WejE1Rkc2?=
 =?utf-8?B?ajl5YjVzbkNPcUNVSm11dFFQTWxaWmdDdFp1QkhJSVduZ3N5VkdLTDR1RkxQ?=
 =?utf-8?B?UVFBMnhDR3pVRTc0S1ptdzB4ZTQ3TVBzSk8yVXg0V0xkdnBJeFdXR2pIdXNL?=
 =?utf-8?B?dndMNllMbWkzMmZkUmp4MS9yVnBlM2FtWm95WktJTTlVUHREYjhQeFRKY2R0?=
 =?utf-8?Q?uwjURUmsQi9HFd1YbOCkPvI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 989ee883-7ea9-499a-cebb-08d9bfa70bb2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 08:44:02.7054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsRbTRHxI5yGarjpM7yjmj9P3qwJ6EyXzh1FSXiXqxkVl9+AgS3N4chGLSMXiJXpCJSGwG1ZV4LkLYty9gVnVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6096
X-OriginatorOrg: citrix.com

On Tue, Dec 14, 2021 at 02:52:25PM +0000, Ian Jackson wrote:
> Any such adhoc flights run from cron should be reported to
> osstest-admin, not my (soon to be deleted) Citrix adddress.
> 
> Now the only remaining occurrences are
>   - examples
>   - authorship annotation of the init script
>   - crontab-cambridge, which would need updating
> 
> CC: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Ian Jackson <iwj@xenproject.org>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

