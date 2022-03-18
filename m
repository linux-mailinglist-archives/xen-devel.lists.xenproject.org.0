Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7334DD5E1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 09:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291918.495772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV7jv-0005I9-Ij; Fri, 18 Mar 2022 08:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291918.495772; Fri, 18 Mar 2022 08:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV7jv-0005Fg-FH; Fri, 18 Mar 2022 08:13:39 +0000
Received: by outflank-mailman (input) for mailman id 291918;
 Fri, 18 Mar 2022 08:13:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nV7jt-0005FY-Qp
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 08:13:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f3e5d5b-a693-11ec-853c-5f4723681683;
 Fri, 18 Mar 2022 09:13:36 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-AD75-EAbPdymGFZmRVbFyQ-1; Fri, 18 Mar 2022 09:13:35 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR0402MB2722.eurprd04.prod.outlook.com (2603:10a6:203:9a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 08:13:33 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 08:13:33 +0000
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
X-Inumbo-ID: 4f3e5d5b-a693-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647591216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+T+I06lP1p2GOmGVZz5jCf7qT52pMXAifXqiU2K7fag=;
	b=iSRNGaq/DFuIhNTohZEnirf3XqnIh7ZxJYN77MEc/oBklZOOvXhWmKMiSTdT1HNdWugZfL
	ZXkSFfFmp8B6ldH8GI9Rf9zz4KKC0FsBMNeVAG2d4/JDNugjnlRell6duASBHhVqyBVHUb
	xCgWuy7ActkqGaYkRBt57+Py0qCCuuo=
X-MC-Unique: AD75-EAbPdymGFZmRVbFyQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vsqwm00vNF3oHiqmYAqfI0iG0NRJOJBEtVF2JMk3Y6jk6FiK+LIe8TbPtWxolgwyFEg6g+7G1lxb57Oe2qcUeYMpq7lyMlcWUv8Sx/yutP8ZQ5bZuGNu9PY+pfBVSt22SWfALmUpjWzr5w7X/QUYYKkOz6VVYdp8jkCBRrHXZEozJRKe9oFDz30Wzmcot9Q0Jv8qBtOFl2ZwLw0kSfNbwI3zbZtb1T023IfM+kCpjtYogZm7Q/kTChOi/UKdSPdJfLl6QpIQO1+UZGGVOPJT6nnUA/i18bAc9iYvdkO9+Y3vlbbBJ9A5c3S14DG01dfGR9Cv01T6IoJI7ozuhAAAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+T+I06lP1p2GOmGVZz5jCf7qT52pMXAifXqiU2K7fag=;
 b=MqfKx7P+mcXJvuHMCYsNr+hmdBXnbiLkmjBBvkucFxbXwqFUVuNE6TH7peoT/m2Hlb/NbN6tkyfnZJhaCQso8nLoBHLycsQjCleIAKf059tzlW3/iWZluXMyIQSCOeC2t/xEhJgTTjQ6VzWUkfo6VKAWJzr/llZBvSENHW7+1RWEMelCoNZ6Ax4JzVnJVwCxqyIUNOKH7AT6LJXWQzk6mzjamfl/vpiFVPVADjS8+fHyZifSwM5Z+LRrdwaqBIfg0kToAyLsM66jYVUF8WHk8s+iwte5EFspsmTkhcMH7RSHkGYkJkYTlmIzwQOXIf1SmMPtU2QACnXf9NAxG7ARqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <78ce5809-8df4-c94e-4313-fffb1b86b771@suse.com>
Date: Fri, 18 Mar 2022 09:13:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::40) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10bc8b84-ba61-412e-aa3c-08da08b731a9
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2722:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM5PR0402MB27228635ABBC7286334AF0E8B3139@AM5PR0402MB2722.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7emGx/QlVglxsVwjzrObvCRgUTfG5Bsky7GnKowvFmcISycTdcTe7t0rkUFKhLj3psRUZZhDjtn4ZPWc2r0+Rh3diDWn/NccQjnNGxuMuyVFVcx7ZHH9eoK+monMVRu14V27gfXNyo0XLjWf8h4/1XSFJNmkaZ8/HZh/yvQ11AFxlud41ZrYh4NRo/vY+763lLo20ifeb+cup0rbEQwXqT+05fWfM6i4U5/qpoIByGz02pzJD4jFv/AoBaPptTKFjHKqc1Lyyy1DLtbghTGyIm54Vlf80RlBXuoOhtCZbCQxRrKUbgLS9PNgnW3P1cZsEFlQIUsGk990E4jvBS/2K6O2uMyMvVHIhCBrzdJwrLHzPtkKE6gnbJ0hP6JazVpQNlOpJu9Bb8pC2C/czEB8ZNlmwCdPJBdK6C2XoN+17y0/qCoVC7OVq+3aR1/Td02DpWeyKXbZ/1CLqCkg3kQRSqFaQDKDuLfUBHyVauJQ+eDD//t+qHCI9dKJHFoK5CiW6Cxptk+otvmzBlUxUjerSXxJJ6BkJwMJFmh2/5k29yePt61PUVPvdygs1ZTDYJdMMfSr/uCm8XBV60Bsb1k9vOUhgOi/RMrNOjEVH08343Ep5nMZJHSZt5WcUvsTmaRC+VPlCvSPheSSYF58T66enmY4AKJ83Bst+ujBtfgIsUTy4vFOEsXQCe3v2WR9D/fET0BSfVMxVmOn7oJWRk4ddKKY7hnlKGMmnj3A5QLJsw9pSQYEoL4ZZMgzjqjf3+I9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(316002)(66946007)(6486002)(86362001)(31696002)(8676002)(186003)(66556008)(66476007)(4326008)(26005)(508600001)(2616005)(6506007)(53546011)(5660300002)(8936002)(2906002)(38100700002)(6512007)(36756003)(54906003)(6916009)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2RxZW91QlZwSXhkQXlZSm5MT2JIOFp0VkFjMnJCTW5ZdWIxZ1dldlR6S2pX?=
 =?utf-8?B?MDlvS3lvYjFST1Q5cmRTd05KcSthM2c0aGJ2c2VIS2dEYUwrTTdsZUZNclNM?=
 =?utf-8?B?SDF4K0VHNzFXRUlzUFZsaUM2VVhRUklNZjZOaEpXRzFLYmdGK0pVL056L1Zq?=
 =?utf-8?B?RHNhelN5SUNmRXFBMlAyaVFIVWlqN3dOTTljMzdGa2NJNTN3M242ek5jUTdW?=
 =?utf-8?B?VUtDT2MydVVmV2NlR25GdU5wK0pBb1dqQU5rUy9SSUdsWXR1MWFyRlM0ZkVE?=
 =?utf-8?B?R3hHNHlVOFZVaUI1SWFKYmxNZ1hzVlR4d09VcDhiRHk4ZEdvWlhZLzh5YnYx?=
 =?utf-8?B?T3hIcUpkcE5xVmo5WUJWazdnTmdoU3pIZ0RGcGFQUTM4RVhIMUJ3b0UraTBt?=
 =?utf-8?B?TjV4c25kQm14QnNVS2E3VXZiOXFvU3RUUVk1K1lMaUlUdzFVanIzT2JCWkp0?=
 =?utf-8?B?TzlYaHUzdTVnVEFvM1oycEo5SUhNSHJIREU0d0g0RjR3bXpwRXRKbmN4YWJ2?=
 =?utf-8?B?UmV4V3diaStWei85bzZSMlYrZ2lIR09nRFUyVlQrNlVuQS8zQ1NUOVhrOTBO?=
 =?utf-8?B?eFViTWFNY0VKR1VjZDFJUXV2NXBOMkhneHE0YkRMWFBUZW5nUFJ1ekpBTTNq?=
 =?utf-8?B?NmZtN1RjcDdsM1BldmNHREo3OU5xMVg5VHhHSTJ5NVFHWVZyQ2llMHpTN2Va?=
 =?utf-8?B?Q2JoQlhSTHUxSXlvUGpodHBIbXFVVVFkeW9zYkdEUDcwcGNVczgzc3FNNlJY?=
 =?utf-8?B?U2ttTmk0dzZvZWxKc2NyTVhXa0UzV0QwTnJ0OTlNdElMTThnWHhIK3h5NXAx?=
 =?utf-8?B?dzBlN2R4cG5WRGdpNERueG5LL1oxUjgwdkk0MC9NUVErVDVBRkVWSWMxbWsr?=
 =?utf-8?B?Z2lDY1UvSTM2N1dQQndLN0MwYXNlMDdUcFBrUVdiZlhwOFl5ZmxEeU0wT2JQ?=
 =?utf-8?B?UCtvWjk3NlBpL2s1TmdqU2hxazVNTUVDZUo3UFQxRjBkNGU3YktkNW1OSklU?=
 =?utf-8?B?TWhYRGRRRGpWdU90NlB5a1hDck1YSUYxZklqWVVUYVBib1kzQVBnRW13UHFn?=
 =?utf-8?B?a3VEQTBGZWxMZE12UVhLclI0QmRXbmN5RGwybUY4QmIvN2o3RFVUT2R4TUxT?=
 =?utf-8?B?ZU1YOVcrdzUva3Zqc0xFNmo2U01NNWdIU1krS0paUkJFaGJDVUliK2Ywc010?=
 =?utf-8?B?ckRhWFhtOTV5d1FjdTdXSmUwTWk1ZTVaVDU1cE5FYWdWTElxUVRLYURtTmJn?=
 =?utf-8?B?TDhYZG5QSTh1TTU0QUM2cFp6eHJZZ0xuUktDeDZkR2tBYlNkSnNBS2lQdFFB?=
 =?utf-8?B?bXF5UDV6V0x2a005aW0za1VkK3BVOCtnYytOTE9ieEpBY0FBZmpwTWZxYks4?=
 =?utf-8?B?WVRHV3VQNjV1K2tCdU9pamVkODQ1SzVkeDdWNWI4RkVzb1BaamtqVjVZeThq?=
 =?utf-8?B?WEVEMExsUWdyZTg4ZFZsQVpCWGFDRXc2Y3pGQTZNNzdyUFRjM1JxYnovMFRs?=
 =?utf-8?B?VTJtbWxxRVMrZ3V1dHdNRVN4a2VxOXVLYkx4TzNScEZqY3ZzaFB4bUZyWVFH?=
 =?utf-8?B?VFBZQjZURkVaZUF2YTN3dGNGa3hRbHhBSkh3eCtGSTJpd3dwRnY0S04wODBr?=
 =?utf-8?B?dXQvV3Jrb3FwRzdZYUwyOWszQWFBaVJ1YnpQQ3k1WS9Wcy8wNFp2czdMR3B5?=
 =?utf-8?B?WXp3WmF2dXdIRkZHeHBvZ1NDWDhwVXJLa3BaU1ZLTGVHaStpWTdOQjNiT256?=
 =?utf-8?B?ZXQ1SmFqKytCNEswUjdXa24xbmhnTzRLNkJDWlNNd2ZWTGJ0Y1JnZExzSis5?=
 =?utf-8?B?Q1RHREVPbmovWm04OGtSakljNFhFMG9LNEhXekl6RE4raHJCZXROVUJCa2tI?=
 =?utf-8?B?b1R2MmFGZ0syQVI0MDlzdnFUS29UblBPdmR0bkVvV0YrdndHZWJSaGhab0Rj?=
 =?utf-8?Q?YKhnxjMeJ64aFf3k8i3NW9SBvSXgtkJK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bc8b84-ba61-412e-aa3c-08da08b731a9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 08:13:33.2523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3BssMneDaOiAHwjY+1s3qhWpBJXgKjLj6K/BgkKlFpdDj5F28zeUfisOXK2FDWSzExRd4/g0IxqRj8oOaGgDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2722

On 14.03.2022 04:41, Chuck Zmudzinski wrote:
> When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
> opregion to the guest but libxl does not grant the guest permission to
> access the mapped memory region. This results in a crash of the i915.ko
> kernel module in a Linux HVM guest when it needs to access the IGD
> opregion:
> 
> Oct 23 11:36:33 domU kernel: Call Trace:
> Oct 23 11:36:33 domU kernel:  ? idr_alloc+0x39/0x70
> Oct 23 11:36:33 domU kernel:  drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
> Oct 23 11:36:33 domU kernel:  drm_reset_vblank_timestamp+0x5b/0xd0 [drm]
> Oct 23 11:36:33 domU kernel:  drm_crtc_vblank_on+0x7b/0x130 [drm]
> Oct 23 11:36:33 domU kernel:  intel_modeset_setup_hw_state+0xbd4/0x1900 [i915]
> Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
> Oct 23 11:36:33 domU kernel:  ? ww_mutex_lock+0x15/0x80
> Oct 23 11:36:33 domU kernel:  intel_modeset_init_nogem+0x867/0x1d30 [i915]
> Oct 23 11:36:33 domU kernel:  ? gen6_write32+0x4b/0x1c0 [i915]
> Oct 23 11:36:33 domU kernel:  ? intel_irq_postinstall+0xb9/0x670 [i915]
> Oct 23 11:36:33 domU kernel:  i915_driver_probe+0x5c2/0xc90 [i915]
> Oct 23 11:36:33 domU kernel:  ? vga_switcheroo_client_probe_defer+0x1f/0x40
> Oct 23 11:36:33 domU kernel:  ? i915_pci_probe+0x3f/0x150 [i915]
> Oct 23 11:36:33 domU kernel:  local_pci_probe+0x42/0x80
> Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
> Oct 23 11:36:33 domU kernel:  pci_device_probe+0xfd/0x1b0
> Oct 23 11:36:33 domU kernel:  really_probe+0x222/0x480
> Oct 23 11:36:33 domU kernel:  driver_probe_device+0xe1/0x150
> Oct 23 11:36:33 domU kernel:  device_driver_attach+0xa1/0xb0
> Oct 23 11:36:33 domU kernel:  __driver_attach+0x8a/0x150
> Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
> Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
> Oct 23 11:36:33 domU kernel:  bus_for_each_dev+0x78/0xc0
> Oct 23 11:36:33 domU kernel:  bus_add_driver+0x12b/0x1e0
> Oct 23 11:36:33 domU kernel:  driver_register+0x8b/0xe0
> Oct 23 11:36:33 domU kernel:  ? 0xffffffffc06b8000
> Oct 23 11:36:33 domU kernel:  i915_init+0x5d/0x70 [i915]
> Oct 23 11:36:33 domU kernel:  do_one_initcall+0x44/0x1d0
> Oct 23 11:36:33 domU kernel:  ? do_init_module+0x23/0x260
> Oct 23 11:36:33 domU kernel:  ? kmem_cache_alloc_trace+0xf5/0x200
> Oct 23 11:36:33 domU kernel:  do_init_module+0x5c/0x260
> Oct 23 11:36:33 domU kernel:  __do_sys_finit_module+0xb1/0x110
> Oct 23 11:36:33 domU kernel:  do_syscall_64+0x33/0x80
> Oct 23 11:36:33 domU kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9

The call trace alone leaves open where exactly the crash occurred.
Looking at 5.17 I notice that the first thing the driver does
after mapping the range it to check the signature (both in
intel_opregion_setup()). As the signature can't possibly match
with no access granted to the underlying mappings, there shouldn't
be any further attempts to use the region in the driver; if there
are, I'd view this as a driver bug.

Furthermore I've found indications (e.g. in the Core Gen11 doc)
that the register may not hold an address in the first place, but
instead a set of bitfields. I can't help the impression that the
driver would still try to map the range pointed at by the value
(as long as it's non-zero), which would imply unpredictable
behavior.

And then, looking further at intel_opregion_setup(), there's yet
one more memory range which the guest may need access to:
opregion->asle->rvda (or a value derived from it) also is handed
to memremap() under certain conditions.

Jan


