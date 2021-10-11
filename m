Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B2F428F68
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 15:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206038.361502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvo8-0004h4-4h; Mon, 11 Oct 2021 13:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206038.361502; Mon, 11 Oct 2021 13:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvo8-0004a2-07; Mon, 11 Oct 2021 13:57:36 +0000
Received: by outflank-mailman (input) for mailman id 206038;
 Mon, 11 Oct 2021 13:57:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkLr=O7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mZvo6-0004Xm-4i
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 13:57:34 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28f87a94-f6c2-4bdc-ae05-aba2611f8aed;
 Mon, 11 Oct 2021 13:57:33 +0000 (UTC)
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
X-Inumbo-ID: 28f87a94-f6c2-4bdc-ae05-aba2611f8aed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633960653;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9bjk6dE1Nz+mYAsLuuE9x4KnANKe1N2GxtK0dBcJxwY=;
  b=EbLm/rIdAIOX5QDl53AdxUFVMyweH0SOfgTMrUdMpuAwP76AI/pq9Cg5
   0wBN9eWGvQJz0XkramIWWbbaEG70HoT1LorREkqb/xBEUw9b4MTsYy7M/
   S+8QJdDgsb+OwvE1btq0u7vDBgPPZGKLDZjB67u37nwcKHnHhEPM90sEt
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pHlAMyrXCFajDoqAi5tU8v0JGit3yd3x6yASQvOQf3XKYfGEVnOwVma0u87SR1tl0qDtRVzbLw
 1/vFmtu3ebvDZ0R+dMyFgPFWJCdX8EZ8tHh2jJdipuTa5OTJ5u+H4Zp5krwes7lq5aT/xtp9Hp
 YMne8OcnIKQDf+htxBWOu/x6Kw3lYBz9Ic5agQ7lOLKu5wQQ5z+LwJjCLuzHpoAlmw6oHZp5b9
 84hrweBm/Fg8qkQGRo3OnPk7oDmgHpzRuv7Hr2KQwV5mTTBH+oW8SZPcxv0NbN9fR+TON+YDl5
 ik3c92yigyQ1oDILUHqn+2k6
X-SBRS: 5.1
X-MesageID: 54860451
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:R9sxg6nmjbBjzBr/e0/KQino5gz1IERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXGuDM66LamTzLdAkaY7k9ElTu5GAnNBhHAA9ryBmFCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdg2tcx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OtCtKC+VjsvAvDzocRBcBtyLGJRJ4QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gps1p4WQauHD
 yYfQQp+MBHNXQ9FBn0WD6M1xOW0xUakfgQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 33E13T0BAkAM96SwibD9Wij7sfUhj/yUo8WELy+99ZpjUeVy2hVDwcZPXO5ruO+kVWWQM9EJ
 gof/S9GhYE0+FamCOHnTQynqWSNlhcGXpxbFOhSwCaJx6nP6gCVHF8tSDJbdccmv887Qz8t/
 lKRltavDjtq2JW/RGiB7L6SoXWXMDIMMG4ZTSYeSE0O5NyLiJE+iFfDQ8huFIaxj8bpAnfgz
 jaSti88ir4Py8kR2M2Tx1nHnjbqnZnPQQ4d7x/SGGmi62tEiJWNPtLyrwKBtLAZcdjfHgLpU
 GU4d9a20u8PMZ+SqCqxHdo0PO2K5dy6cxLGqAs6d3U+zAiF93mmdIFWxThxIkZ1L8oJEQPUj
 F/vVRB5v8ALYiP7BUNjS8foUZ5ylPm/fTjwfqmMNoImX3RnSOOQEMiCj2ar1GfxjFNkr6g7P
 ZqKGSpHJSdHUfo5pNZaquF07FPK+szc7T+DLXwY507+uVZ7WJJzYe1YWLdpRrpohJ5oWC2Pr
 75i2zKikn2zqtHWbCjN6pI0JlsXN3U9Dp2eg5UJLbXTc1I5QTh9VaS5LVYdl2pNxP49egDgp
 CDVZ6Ol4ACn2S2vxfuiOxiPl48Drb4g9ClmbETAzH6j2mQ5YJbH0UvsX8BfQFXTz8Q6laQcZ
 6BcI62oW60TIhyaq2V1RcSs9+RKKUX07T9iygL4OVDTibY7HFeXkjIlFyOynBQz4t2f7JNk/
 eL7jF+HGPLuhW1KVa7rVR5m9Hvo1VA1k+NuRUrYZN5VfUTn6o9xLCLtyPQwJqkxxd/rm1N2D
 i6aXkUVo/fjuYgw/IWbjKyItd7xQeB/AlBbDy/Q6rPvbXvW+W+qwIlhVueUfG+CCDOoqfv6P
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAbvA
 hCP99BWNK+nIsTgFFJNdgMpYv7ajaMfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s4ZdE5Ra+hxwmNse9ohpVr2ncfGYdV6gHt40BBNO5gAQc1VwfM4fXDTX74c/TZowUYFUqO
 DKdmIHLm69YmhjZa3M2GHXAgbhdiJAJtEwYxVMOPQ3UyN/Mh/tx1xxN6zUnCA9Sy0wfge50P
 2FqMWxzJLmPoGg01JQSATj0FlETHgCd92zw10ANxT/QQESfX2DQKHEwZLSW90cD/mMAJjVW8
 dl0Eoo+veoGqC0p4hYPZA==
IronPort-HdrOrdr: A9a23:TJpAW6tsOW2Hxk9JAmqRMeTJ7skDctV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVMqM03I9urtBEDtexzhHP1OgbX5X43NYOCOggLBRuxfBODZogHIKmnT8fNcyL
 clU4UWMqyUMbGit7eY3OBvKadD/OW6
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54860451"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLGhdy017rI6ywLKUKphu1CDx510SvChFO7XHfZGko/qX70bu0HdXy253Yz6r0PMEn68cnYhD/Sgz/W0R2AWJQjbJQgYNOP7XPyu0PKXD/w04lWYIJb1+MGA+SZ80hUkuebsCyUFSaq18SJidyukYM7htZ07N182amaG8NGeUxGl6rFQuHtXF2aXux6CQ6be+KH13HCrIQ70KwU7K/VnUeV1dKm4BnDeG5EcMuztvbmww8G9w68/A9UzWIIfJpkHv+cRhCd4wRwoH8nymQUnB9VxXE3VR4TtMe4hqH8qpFoUaLfFKp/x8J76CXTZ364K0PNoApOdHkq0u3584Re6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gm9m+9orQmzua+6Wo8MR9/V5ClYmSSzecC45NNKeIFg=;
 b=XTQpDVXuKh8eVrkGLZIs13UsD5ZORp1YFgFjVIfgpHxDFme2V379u6EUw7oa5ldhpyoYFs5K+aA9Hjjy9wWdKJRVE3Bog/vPxcqDQWJAKxrP4/7ZAoYIi99nnR3VNacMK2dn53t5Kf+IeU4G0Gwf9F6FgZiO25sOh+JbIMnTsWW2LYUBWzMLiJ/Gk6GKkNTh7/y0e7TTWWlfo78kcxaaD7TaawZdeVJe7K7DLwUagOTHkh5x+xyjHWtGXWKfi+2SptKVoWDfICBjAWomeUT2ZtyA3PrHYDAvxAOgqYTLD3hS62v9haJZV9fAlDboXrUQqemSFXKcxBo206KKrhPRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gm9m+9orQmzua+6Wo8MR9/V5ClYmSSzecC45NNKeIFg=;
 b=TqvoQpeovjnSzZ90VJt3BVIgIoNSFjcYYyOFfc1ruh1i097AHOcnWRCHI7ktNZIw9Wh6Dke2cN9vgZQNjXooJQal4meJ/Jg+iSuzsz6rNEr23v70qltQACa3O675vxAT1+S4JSStrwEnbur88ZJQuT0pjwm4UTZq3iQw3vGRMg0=
Date: Mon, 11 Oct 2021 15:57:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Message-ID: <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
X-ClientProxiedBy: LO2P123CA0039.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::27)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca021c4c-12f3-4ab6-8249-08d98cbf10a8
X-MS-TrafficTypeDiagnostic: DM6PR03MB3673:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3673FE5C1E77E4D64A29AB2A8FB59@DM6PR03MB3673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xjhy8Y7c/IY0Y9A2btu2zX0m4R5NQVfqo7vMXj3z6pizhs5Ve9AoPi5hCGDX+rt6YxOJ3Ww9keHSwnuEYXuDkWH9+rvsGFyBKZlKk7jzwtw663BHGyvsXL1d2tQ0C2XxqrfyzzexUtx0eUaFZN0ljJnEgX+qfE98NXXHt/Ldk+CTHoNHCtv5a3RmUY/MccHCRlDsQ11zOHgKyyg5q4JbDlCMzLF2URtUwmBz73fuslqQXJnH0C/1OMBZK1A1fTKHMQ/ugfaLXkyKEEuoOo35A/VMFrr2om4DBcad8i+FQleCqh56kEUQHX2Cb6DaJoI0JuNLhl+wJZuwf3SwMXx589dW3DgWCIRGXXVrbB1xxDXdp4ygM6SyVeHG4ayaoBo8KBUEa+XcdyAFJmmAvpKmZMiKkoIjpLIY007/mOSdewBmLT72fsHX2QriIb+Y2XHN4hAla3KR7h+uFct8djeV/lfSzoFTMvWkkvqQ6zX2+ma1wtmjnVS98YfgkUvJZMkUL+DLeZMnCXEkm6fhVhozBiJOSDIhRathqB+AKn9W/QyUhP292g9AxK3OTyiKjL4NPlQj13CV2K2f8rXohejWIBfbx+G6rzZXaW5xrZHOBlcrwawHTTWoLWJJ3QmVtkCDrfiPnjLGJAbQogTsRbdM2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(84040400005)(2906002)(8676002)(26005)(6666004)(38100700002)(8936002)(85182001)(83380400001)(6916009)(4326008)(956004)(9686003)(66556008)(66476007)(66946007)(6496006)(316002)(86362001)(508600001)(5660300002)(186003)(54906003)(6486002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3ZIcmg2UHhDdWlncHRsSEJ4U2ljNHA3eWZxZWwraXoxclJCM0NtWEpneXJG?=
 =?utf-8?B?T29NSlljQ2RkNEFhejd4OEFkTEcwVkFFRkF5TGJyanM4QndsWnU1Zmg5d2d2?=
 =?utf-8?B?bURpNkxKaGRkQTNmR3QvTTBxK1g3czNmdUNYSWFteVlYZitaZXZmSHpRbGpP?=
 =?utf-8?B?TFNGWncvcm4xeGRGeDF6Z1JlblNsZm5lL1Roa0U4YzRHR3pRaVlYS3RUYld6?=
 =?utf-8?B?WTdoTE54TWo0d2E4VmhiZm1HbWljSVRYR2pkNWNtaGpDdC92NWFpQ2doN3Ry?=
 =?utf-8?B?NEFqbFNNZ3lBcGN6bFVja0R3QTFycUg5L1pLeUp0VjBlMFVmdVhZcmhZNE1B?=
 =?utf-8?B?OE12QjZWenc4NkRkdDRWY1NEK09DZ0YrVDFESzNQcFZjTE5uNHY0NEdibWkw?=
 =?utf-8?B?a2RnNE92WGhRdy9aN2lmZGp4MEZNb292K0JwU2JJR1VUamkrM1YwWXYwV1pP?=
 =?utf-8?B?Z3YzSG9iRVZ0aWo0OTEwQ2VTYURwN0hYeEFtckR0MnFSc3doeUJVdGdaSXpt?=
 =?utf-8?B?MHhLNW5yOFBxbG5MakV2bmVuaER0bnJHWE1hVjNwV2tTSHN1VStNdDFTUHFT?=
 =?utf-8?B?MHJMVE41NVI4Zk9laG1IUUxvNzdHT0xaWUpNby9YeU5WVHZSTmhBVHVPbElK?=
 =?utf-8?B?T2tIbFpYYWtDYlEwYjduRGluU3Z1UUI1aFpTMUJmZHZQeUV0YjFpaUNNNno2?=
 =?utf-8?B?T0V4QVM0dTEzMDR1RE5oZkVJZ1JmUUVWQUZGUW1NQUkyc2daMWcvQXZjOXZy?=
 =?utf-8?B?Q0Q4NkZZdmtkNHd3N0NrT0NoU3dtc1hOc0ZtWkw1RmJjcjZuMXlySVVxOWtW?=
 =?utf-8?B?by9XYWtWMUM2MS9kMHVOVk9MMWVLRGFycGNPTzhBZEc3b2xkQ0ZQVlBtclpV?=
 =?utf-8?B?aFlxalhtV0tLNythZGd2VGZWSndMT3RCT2JLYlRHdTFiMWZ3cGJCSUJ1MkhC?=
 =?utf-8?B?dENsZ1RvUlRnVEFaRW9oZURaUWhtM0psRGY4ZUsyNkwrb2d5YlM4TGQ3eWpi?=
 =?utf-8?B?cSt6M0lYTXM2YWJGaTZPRUorcWFNdGJIeUtiSFZoS1JNdGlHZFhPMVFUS0I4?=
 =?utf-8?B?RmNUQm9BN1EwZ3pmWnVrbFRRanc2bEs3ZWx0cm0rTnJSSEpVb3czdzFqQkhK?=
 =?utf-8?B?K3ROejh0N3ljMlcyN3JqUE5mWTJrYy9FQ0lTYWh2RXIyd0pYUkNuSEJJZWZu?=
 =?utf-8?B?MmxqUVBhNFJIM1FRb09uRjhXQUx2ZWFSclZYZ2pWWmthaUlyL2MrajdiMGlq?=
 =?utf-8?B?VHFncEZ5bEMrcGV3Zmp6RUdYOHJJVXFkK1Q4dk45cUtWejNtcjRaTUdQcUxR?=
 =?utf-8?B?RDJza21QemdMRVJ4Z2cwSkRGRUlHMVpXSWpwRzNDTVJBOHRxRk9mUUhaY2lp?=
 =?utf-8?B?alBsUjdKeUJWaTJ0V3JydEdPZkJKSjhBYVN5QjhkRnlaYXRDRnIySTh2dG95?=
 =?utf-8?B?QkRLZHJRK3MzWThoMjU5S1VlTHo4Z0YyQlRFUGk1ampkaDkyMUpQdE13TVRU?=
 =?utf-8?B?WVMwb294MUhNSHdmZEUzWEVJRVhsV1lURFhyU1dRWmovUDZhdm82RzcxQjRF?=
 =?utf-8?B?dzQ1Wk95bWJsYTlmL04xT0ZkZC9nM1BOOU9PSWI1b3hXZ1FuUVFSYkk0OGZl?=
 =?utf-8?B?RS9Xbkh0K2JoWUJSTTlvZUJIblB1dk5CRXVscVdKSkdTQkxzamR5YkZ4R2N5?=
 =?utf-8?B?RHREYms5YlpiRjVzamlhZElQc1k0U1NQRGZ0WW9tVWJITUdFbEw4ZUxEOU5p?=
 =?utf-8?Q?H9pZHw2QXoa9a40Q/zq4imZYQuNc7meEmY0VdCm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca021c4c-12f3-4ab6-8249-08d98cbf10a8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 13:57:29.6812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKBlZLzqZIciku8GaXf5YTOEruzQ0cm98QSUpY8Zw8iSPyvQyqwF13H7ZNyc78myEr+qEhWj7haMpjGJHbrPrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3673
X-OriginatorOrg: citrix.com

On Mon, Oct 11, 2021 at 01:40:30PM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> + Oleksandr to have a better PCI expert then me.
> 
> > On 11 Oct 2021, at 14:20, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Mon, Oct 11, 2021 at 12:11:04PM +0000, Bertrand Marquis wrote:
> >> Hi Roger,
> >> 
> >>> On 11 Oct 2021, at 12:47, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>> 
> >>> On Wed, Oct 06, 2021 at 06:40:27PM +0100, Rahul Singh wrote:
> >>>> ARM architecture does not implement I/O ports. Ignore this call on ARM
> >>>> to avoid the overhead of making a hypercall just for Xen to return
> >>>> -ENOSYS.
> >>> 
> >>> What is the cal trace of this function actually on Arm?
> >>> 
> >>> AFAICT libxl will only call xc_domain_ioport_permission if there are
> >>> IO ports explicitly defined in the guest configuration, or if any of
> >>> the BARs of the PCI device is in the IO space, which is not possible
> >>> on Arm.
> >> 
> >> PCI devices BARs can be in the IO space as the PCI devices are not
> >> Arm specific. There is not ioports on arm so to be used those can be
> >> in some cases remapped and accessed as MMIOs or are not possible
> >> to use at all.
> >> 
> >> But the IO space does appear when BARs are listed even on Arm.
> > 
> > Urg, I wonder whether those devices with IO BARs will work correctly
> > under Arm then.
> > 
> > How do you know whether the BAR has been remapped from IO space into
> > MMIO?
> 
> We cannot, I think the platform will define if this is the case and where.
> @oleksandr: I remember that this was discussed during some of our
> meetings but I have no idea of the details here, can you help ?
> 
> > 
> > IMO instead of faking a successful return value from
> > xc_domain_ioport_permission we should avoid the call completely in the
> > first place, specially if we need to instead issue a call to
> > xc_domain_iomem_permission.
> 
> At the end we will never have to issue this because this will never be a matter
> of “iomem” permission as there would not be any way to cut on something under
> the page. If this is to be supported one day, it will probably have to be fully emulated
> to keep the isolation.

So you have a set of memory pages that map accesses from
MMIO into IO space but it's not possible to isolate specific IO port
regions as they are all contiguous in the same page(s).

> Right now on arm you can just make the more simple assumption that ioports are
> just not supported.

Would it make sense in the future to provide a memory region to guests
in order to use for IO port accesses, and call
xc_domain_ioport_permission to set which ports would be allowed?

I think the commit message needs to at least be expanded in order to
contain the information provided here. It might also be helpful to
figure out whether we would have to handle IO port accesses in the
future on Arm, or if it's fine to just ignore them.

Thanks, Roger.

