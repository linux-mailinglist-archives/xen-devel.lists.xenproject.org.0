Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE714F56CF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 09:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299658.510707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc002-0001kI-NM; Wed, 06 Apr 2022 07:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299658.510707; Wed, 06 Apr 2022 07:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc002-0001hZ-KN; Wed, 06 Apr 2022 07:22:42 +0000
Received: by outflank-mailman (input) for mailman id 299658;
 Wed, 06 Apr 2022 07:22:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc000-0001hT-Gy
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 07:22:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56e25e99-b57a-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 09:22:39 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-p8ZHjdxeMEepCpRfaPrv7A-1; Wed, 06 Apr 2022 09:22:37 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR04MB3223.eurprd04.prod.outlook.com (2603:10a6:6:e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Wed, 6 Apr 2022 07:22:36 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 07:22:36 +0000
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
X-Inumbo-ID: 56e25e99-b57a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649229758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/X8fWXnw3uZdperyAkoMOelm4vr1TgeVyBGLOeETng=;
	b=HKlF2oiiENameQuoPxRs4LmviuRTCOkL75hsbv7blK0TeO+N4kMHKrfbGOXZ2OZIy8oG6K
	5CtB1L9Y3/+YyhYsp0N2elnT4FsshemneSI2EoITy3qaLEjDObwLzPZVW9WVu6kicUZeVp
	5E3xVX38LXcfH/VvOBUwEe59+Eul644=
X-MC-Unique: p8ZHjdxeMEepCpRfaPrv7A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQqYOV1qTtlf7aco+YWOGxVHkk6blqlTDooBgRTJZw2t5mebmfabS0/pnnKgDQXkLuzfvNMbr/tEULyqA0U+17ZmpVhNUbhA9iCLy5NJ41uYu9tJj+5xVuRTp7a/6xlQG63hlqVFebXowa++k5qsUyjlV6F1viBHp36ZfK5QBQixiRHjYvsNFt2LGp1kiNvPTeeggLteQUiAVv0M0HYtBmMuVORWCRHYUQOVRPYCZc36x8l0ulnxMVcYAnE/e3wyxndsioKv0pkpISOJgmArVeNp1KBmB1cCvB0UJW6FT+rHpaKr7JzcB6g9sz/tZGDNw91zg7LJ1iVwzrjTIJtgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/X8fWXnw3uZdperyAkoMOelm4vr1TgeVyBGLOeETng=;
 b=It89gz3X1dISvHH1Efcvw8+i8jW/pRzcflhbgCpn1ToO5zU/pLR4BGnXYwTKl1HR9paulmZl/UyP6hTvuMSPi4jMaUz+xpdkxw1IExj0TMR6jVZF++dowTlIJbkHNJ0lYNEFhhzX88J4+79uWjQ/RVtwV1PZYn4td7wCr4Ucr/kHCy36ksKcd6PUA6oRXdxuQOJxXPJNyDkpg00ZlwLFNZdHq3jRrsdcl+jIFN/TZpRLIhZoiLJmPHikrnUHiCA1aHij6D3Zzl/hCbSXuOqxh4IK/kSosrS9Zywb+8RKU5kvOVBRaU7vRIiQ/N9MmNv02pw2EYjSR/I00g3gzBUqwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0e84ac8-308e-1784-982e-271705c13b7d@suse.com>
Date: Wed, 6 Apr 2022 09:22:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [xen-4.14-testing test] 169170: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-169170-mainreport@xen.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-169170-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0205.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d286a27e-818f-4739-2612-08da179e3963
X-MS-TrafficTypeDiagnostic: DB6PR04MB3223:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB3223C586D0E01994AC0478B8B3E79@DB6PR04MB3223.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i8ck/dT1Q+w4DLD4xq0qpPtkcNTEUul86dk0ImscleVY0j/dAzpHidpXRarp7SWR6U7lX6/mqJ00JNf85iaLU6ClrBBNcMhWcl61asiOrXZR2xcRzj/ymTaoOTJU98IGWJ9ZI29z+gOkCcDBb19FWG1KyX3m0F0mR9KbKD47EFUqXtwJUJd66aXBabl2lt0/YeB433mp4vgORiN95vzB6e5u0cUNpblZZsKOlgJ/c36WqOTxmm7t69rhiC6lDJm5zu3R9UvYVuwOT54lSAcVeQZvexRZPvtFOBmDRgRT7Zz3pcQO1FlrJgXhntRvKdt0iEZze3V/rvdLJHRnewiCBqPLMEzOZXC22YZpbgUQ17TFvG6WnIPhYRmYfBE8+6tUVa8/2m4wG62zEwb074aVtH1nw5VYvn5IpIeSCplwfya+HJKKsH2bi9+O38ox8FZ0HNjhkssXclByMVGdZZywMxIIGqiW9N34h6HY0+Z2FiAQCOSTjkkxhMqWLRK4a29yWu4NTwERYzeqCDHnZdWdPyXshqhLIbW6FOb5+l4spPXVD1ZjWoEJ1330ijBUfONEsu6jyTFp/dkPm+z2vme1A6R4+qiOON6lR2+o1goseNkK4yW6al4Eeo9IsGbu+Uoco2mN960mm6Rbs97fxKNxn6aeiHDbFpLqF/7VE1Unp1U6FR8qiXm2DVBfcQnVVzJgzO/VJ7kzoyHHL6xYFycdZRXHDeYguj7P9T+dCgxdDTu0CO7/6rxb449v2fPmThtYYrJNQ71VfBVrjY3Vh4cPNInfxhsMDFstiY8A+HWWvcN3X4DKrtUWpiujZ2bRwOwr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(66946007)(26005)(4326008)(186003)(6486002)(966005)(508600001)(36756003)(66556008)(66476007)(83380400001)(8676002)(31686004)(2616005)(2906002)(6506007)(38100700002)(5660300002)(6512007)(8936002)(53546011)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHo4ejQzdGo5d3o4RnJ1VTRXZHFpbllTSlVmbGxtK0xxK2d6NWVGWFFuakF6?=
 =?utf-8?B?NkJQdS9WVkwwelN3Vk13UFphamp2NXE1Nm1iZHZFMlVMMzZsNkpnNTBsU2Jv?=
 =?utf-8?B?LzV4Rk5xYWVDN1VvKzRaSkx3RU5TbHZDT1VRZW0rRE0wUlJIenU1NXhBQVFG?=
 =?utf-8?B?Qy92a0VDRTh2WnozRlFOeFpRWldSYVY1REdnZG9JM05iSnM5cFJKeW5QZlht?=
 =?utf-8?B?eGoyaDRDNGlJcEw3Uk5DSGlMZy93SG9mVGxWVW1yVFhwRDJ0VmpCNVVWRkdp?=
 =?utf-8?B?KzE2cU1Xd3g0cVJNMDV0VHg5ZWFuTEc4cVc4K0hHVnRRMUZ3bWJTVHVSazZN?=
 =?utf-8?B?TzZZdFhBNUsrVlJuUHIvZ2xLTjJTSHZ5cnpQWmg0ekFHWnlYekFrR1J6OHQy?=
 =?utf-8?B?NW9DNEJ3MTNKbmJ5SXZQeG03RTRTT1JjTm85VVpHSWZNbnl2SjlZZ3h4Nmtt?=
 =?utf-8?B?NkpDcWN2R1BxcEpQZFFFRkdmV3B2MlJrYXRaSkZkYmlha3psenlxNEREVEgw?=
 =?utf-8?B?UVpka3U4M00vQk44MWZodlp0YkMxMlVwbTcwN09Gc2hhRTNVdTFVWEdpc3dT?=
 =?utf-8?B?b1JqUmNZR2twSFFrSjBqR0dsUHFOSi9oeWpiRjlDWmw1VzZjaHN2K3lvSDZR?=
 =?utf-8?B?dDh6OHZLaSt2UXE2R21BeVRIYUhEUlpPeHJ2MHRtZFVnNWRIYmhWR3hKZkFa?=
 =?utf-8?B?M1NzQk5EZnR6aUVTQzBZalRONDhtcnVXT1EvR0VaaWY5ZTl0aVNheXlGRHZR?=
 =?utf-8?B?UVozMTNiUnlyeUNNM3VDQ0RLSEU4UG8ydzIvZld1T0tTRjh6R0NYc3RKQ25a?=
 =?utf-8?B?RHJ4empjRGNRc2pNdVQwQUlRRXBjWjB1ZW1wK0Z2TFdMZ0NLa2VpZFdKcWRX?=
 =?utf-8?B?Szk5ZmxuenN1TEVmblBpSkdoVTNHUWhzWDJsWUVieHVpNHJIV0hWaUdYRGdE?=
 =?utf-8?B?Y0hNdFA3UEE5SU0zdm9ZVjJvcFd0cjZlb2tMVDBsWVc5TWw4RTRBZi8yZlRq?=
 =?utf-8?B?TTZ4Z1lGQ01idFZ5T3hTT2QwUCtXOFBkdXV0M0NkYWVMM09LZFE3WjErZDZn?=
 =?utf-8?B?di9Qam5EMlJ4SkpRYnUwOHJzWm13VVNqcnBPUVlmTjRkUkFyK2RqeTcvbndS?=
 =?utf-8?B?eUR2VnBJeEMvc1E2QVJSVHdJYmFpUlhKUVdVK3VYSXBOK0tPV2xWY3FJVnZr?=
 =?utf-8?B?MkFhM091Vi85Q1ZvRW91RlJHdFo5UjNXQ0pPZkozL2pvRHc2ckk0b3RudWFD?=
 =?utf-8?B?VUdhcTRLYWN1dFA1VjNUSVBFeTltR0QvNUROZll1Q0FOM2xFdlVCelQ4SWRk?=
 =?utf-8?B?TlgwZWJZQ3dqY2NxSDMxNm5nMjMvb3hJQjBsV1o3bFVvMGNyQ3g5UzA3Szlh?=
 =?utf-8?B?a1dPSHYzZ0lSV3ZyQlZKaHYxaUxVWGQ0bis1WUhrZ0RDb1hlTWZHMmlkNW9D?=
 =?utf-8?B?eVB5cXJrSzMvZHNialFZNVd6M3VpbmZ4QjdmbFVLc2I4am4xYlJ6NzVLbkFK?=
 =?utf-8?B?Ly94RjFRL1BCbmlrRjRkYzRDSERiL1VBdHkwNUxzNmQ0bDY4aW04K2pYRlNJ?=
 =?utf-8?B?NWlxWGNGMDR1VjBUNnd0Y21XRGhPN3EreDJlQWhsVUR3QU5ScEtranhabTd6?=
 =?utf-8?B?MXF6Y0Zud051eU90Tk1vVVNOZE1EUTRCdVFnK015S3RVVkQwMkVObENqZmUz?=
 =?utf-8?B?SjdDNWRYdWNSdXQ4bm8vd09xU2FUN2RJTjdRM0x5S29tRW5NVUxycDQzeCt4?=
 =?utf-8?B?dC9teUVMdVo5VVEwMmN0aGtpVjJJN1pOMngwMmFJaXhuZExHUFdIN0E4YWVy?=
 =?utf-8?B?K3BrcjQrN1FLdXVJYTg3bU5nN1JMYzVDbm5heEFDbWxFZmxxL1UxSWtTUERJ?=
 =?utf-8?B?OHFtU0lNYTRwdlU0Wmc0MDF5ZnB0MFFLRTBoWDVRUU12dWcyREREclY1ZUJa?=
 =?utf-8?B?dHZHZkhJSm5naGtNS2R6ZTVjU2xmM0tVdEd4d3RSTUw3d1IzZS8weU5jNm12?=
 =?utf-8?B?OFBPU0dKQXNBZGJkWUdFRGc2SWJYVVFLM1daNjZZSTFrYWpncldWYVhNRUcw?=
 =?utf-8?B?VkxMNVJYa1d6am9QS0xtekJOSGhCVGJaKzJOMzVQUU5ZRTUyVWJEeU5QdU9r?=
 =?utf-8?B?Y0ZOR21HK3NVdmJwQXhPSzAwd1pha3dwQmwrY0x5Smo1bEJRYzJzbCtBTThk?=
 =?utf-8?B?ZENHQWdKUXlKamUvV25GRkE5OWZBQzJNTXFhU1prOGEza2pEakppQjVIY2E2?=
 =?utf-8?B?ZDJtQVJ0QWRJVUc0RHZKT2RwWWNiUldxMTVvYkJ2Z05kRGhnWDBoRVlmcWUz?=
 =?utf-8?B?S2FQQXFvUmhFYkhXWWVuaXFVTW1vN2xJMzVPdXpnbkRXVTNqZVFSUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d286a27e-818f-4739-2612-08da179e3963
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 07:22:36.5791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLYynUtOxqBEEK3iezkSv7CqO3p0sYpLDgmUZCr06HKjB0p/KH4hKbpCbO8HNi9DMd5iWpi8tcddRGMarNd84A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3223

On 05.04.2022 16:53, osstest service owner wrote:
> flight 169170 xen-4.14-testing real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/169170/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-xl          18 guest-localmigrate       fail REGR. vs. 168506
>  build-arm64-xsm               6 xen-build                fail REGR. vs. 168506

Urgh:

  CC      hw/virtio/virtio-bus.o
  CC      hw/virtio/virtio-rng.o
  CC      hw/virtio/virtio-pci.o
  CC      hw/virtio/virtio-mmio.o
  CC      hw/virtio/virtio-pmem-pci.o
  CC      hw/virtio/vhost-stub.o
cc: internal compiler error: Segmentation fault signal terminated program cc1
Please submit a full bug report,
with preprocessed source if appropriate.
See <file:///usr/share/doc/gcc-8/README.Bugs> for instructions.
make: *** [/home/osstest/build.169170.build-arm64-xsm/xen/tools/qemu-xen-dir/rules.mak:69: hw/virtio/vhost-stub.o] Error 4

If this is going to recur, I don't see what we ought to do about this.
This doesn't look to have any relation to the recently added two
commits on the respective qemu stable tree.

However, if this wouldn't recur it would be similarly alarming: That
would suggest the build environment to not be stable.

Thoughts anyone?

Jan


