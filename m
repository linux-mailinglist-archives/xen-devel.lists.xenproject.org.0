Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8E144639E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 13:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222298.384423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miycx-0005Sx-Ne; Fri, 05 Nov 2021 12:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222298.384423; Fri, 05 Nov 2021 12:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miycx-0005Ph-K6; Fri, 05 Nov 2021 12:47:27 +0000
Received: by outflank-mailman (input) for mailman id 222298;
 Fri, 05 Nov 2021 12:47:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miycv-0005Pb-QP
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 12:47:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 863c75b9-3e36-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 13:47:24 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-POx9wcENOKisZdnQ6GmGTw-1; Fri, 05 Nov 2021 13:47:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 5 Nov
 2021 12:47:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 12:47:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0221.eurprd06.prod.outlook.com (2603:10a6:20b:45e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Fri, 5 Nov 2021 12:47:20 +0000
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
X-Inumbo-ID: 863c75b9-3e36-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636116444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WmmuYe13+6QfsQMsh3TbBdhckZveyiGTojp8Dc28lrI=;
	b=XA9pW6WXKpXaxYu9BJm2BLkPiiW8vbC4BZxIIeP2wLMB2l+fDSvOcAM1QVbHQ8NxrXxv8V
	qfWSIqD+of2lypvvwf7tvyzQLRbdjYGQVT+TPvG2pAjBDnJkDHN7gJItvHToSm2aLwFbn6
	jFGv2Ig6jSjIchYoI8UWgSO3NtYL3B4=
X-MC-Unique: POx9wcENOKisZdnQ6GmGTw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XY5nyhpToAk5loznZrzdETJYbm8JYFc+uG9Z42IqxaOqWOlxdqwLqwN/+1m6PhemBCBf6Q3iM7nhLjxKZwTKTP/Qnt6NfeEDz4eiYkd2glns2K5TkEvQ+fOYo+sHdF0uZAj4+CCTboIgXcs9PKuietXJKfpEJzraqIm/sYkuzqE7JXnLIjOnplvFMpn5t/7uJfWwxFgsNsSEZsXfuu93P/W5kclCrn/YcXvuWFRZLGj12DuQE3brGJm7amKOzGsU4HbgKM1LywpXSrHV1hErBE2kNPx1GeGs/yiFiobwLIZUUsK81AFHj1M0k1H/msyLcpMTe65ekjW78PUR8jBpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmmuYe13+6QfsQMsh3TbBdhckZveyiGTojp8Dc28lrI=;
 b=U+Rf85aO6N11zw8vAn2KD+tYlfpcpeFet7ILuJnDsovSB9SNZEiwDEnlLC/7JyjEaCDxxKiYPVmWw6WtFIKhCsB0PtfOHeSvSvPd9oWy0w153KlkeDvwwrC4bEpsDIs7QICh7ZiRNiAVURTwe3QV4L1dmj4lE7KR7xpprqvSIsR24PtA2q5VvspbPnU+3OsmB/LVZqr4LAiGtCUeQ8u87YAn8RPEKCYjhNcrxAgN0VMAjYBxMPaeql/o4thdFqjxCULvZivSAMc1YrEmO9tn/xcfAM6Ku4SS5p7MfJR3UpbgQSQv1cDzTQAADjOAkPp/kRm/11mFD+zjZcXVyjUmNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9802643a-243d-76c3-a976-f630b8d6ea7d@suse.com>
Date: Fri, 5 Nov 2021 13:47:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Error around cc-option on AArch64
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "julien@xen.org" <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <VE1PR08MB5215CBA5B28A1FB90D7B161FF7D39@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <VE1PR08MB5215CBA5B28A1FB90D7B161FF7D39@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0221.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c42a84c-d282-447e-028e-08d9a05a688a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4381FF4FF974986EBC3D0E17B38E9@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P7tT9WgBBGYsqbX71HVoEEVYsEA6dlkkSzf3xrcChfS0j85nR8BWZ4RSco+sL2sMKXdtURQpoPP6wHQfMEOtT0jnFtp/rRnLOmntNcU1z9nSUwCLFDPwa1WbR6wGXP562/EAh4BJqLGUUw0K/ruHZXOLgUG9KB3nurgJi4WWc1Hs6xFoWH13lgwpfAe+n9fbduO8Jq3rYtYEi4Z7TNdFnvM6VtIjSiLL8DZPayswNeMq0tZ91mdP673d55fDyFLupw7O1A/sQP+PO2enULIBvmmSMqVIs03+FIB47ULPd9AGaTpDvhxIdcquFTusEud9zeyu/ezioFbbDmaNGtPMEmEwPbFK8XF6frLAMVnRMJHpHU6tlFB1CsPWd6Kvx4nyZC6jxbw9Z2QWNa//sbsnnSpZQkpsxdyqGWzDrZYoSbWc487OE5IbsuZ9a49j7f66HMvy9rwHO8/MklRB5RCUJaQ6R40b/IWQZN5Qk5YvHdDUZs8Q0tUO3y243pkEbdm/6W6ykjqVo9YersbGh0x/ymGIw1l2Rn2y3/ZEugV5nlJEL78xiG2qQilU1zZNfa8AxMzKLJJ7TqpbNLFTqDK5A/5hbH1aKZw8yH1AYaUvW4zHLMNFwokvsGIGuYz6JGTh2tn4U+4LnUKeiWDO5XcLUUbqhZbRicObYK9BWgoq5PKQbjRbEaHlTqITwzMS4nQqRVMSe6tosxRvIldeRbqRXFf/b3NJGRfvapAs0UsxztTgs8+bibjQycIOWf7VNw1dL0sivnIMe4DUl0+Wjt8ym5GP3d83pOwF2N7dHk0qS8db93NE9qsWCc2yBqyanqMvRQZIuEXjWky7kcKjhrrYvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(2906002)(8936002)(508600001)(83380400001)(8676002)(26005)(966005)(53546011)(2616005)(66946007)(5660300002)(66476007)(66556008)(36756003)(186003)(16576012)(31696002)(316002)(956004)(6486002)(86362001)(54906003)(6916009)(38100700002)(31686004)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlJ6TUxQRkpTMkJSdS9wMWFGbjNwMlpEWXZIL084SmFJaWpGWUR6MDU3TXdC?=
 =?utf-8?B?TXZaR0hkRlBuQW5NUXREemdwaEk1bEFSMWNzZ0VkMDJHTXBhRlNzWUtEY0p3?=
 =?utf-8?B?eGZNTEtGRTRORkVOMkxoQkZRYXhYNnpLS1huQkxrLzEzaGJ1WU1nV3dUV1dp?=
 =?utf-8?B?MmRYaUNYWC9lbWhVQ0pQLzdieFN2eDgra2hpbktsWVhyQ3VuYWFHWm5Va0wz?=
 =?utf-8?B?UE5vRUFlZDM1YVg0aWNpVGpKV0lOWVkxY0RRbEtOSjBhVk45eXhPUVRtSlFh?=
 =?utf-8?B?YlF4QlUzZCt6QnRybzZBK2NxN1dsdnhYKzlBRzhoS2h5ZEljMklNSzQxb1dh?=
 =?utf-8?B?MnVjSzhGMmlFMFVBczl2TndmcGNIcWF1UXphbTdodFdWQWtIZlFzNUxOdDl0?=
 =?utf-8?B?TFU0eEpFVEhGVTRCeUk2MFNpQ05TbHlXRlhPVU9JQ3o2YWQ1dDZnR21HVmZy?=
 =?utf-8?B?VndnTzJSVmp3bmgrRXQ1M3pUa0t5M2MvSVpLRWY3NktsSjZkbmFHOFl2cVkz?=
 =?utf-8?B?QXE0cFA4M1JFZHoyUVVXdXlFcTRDcUNQVTVZc29sSnNOLzF6MFpDcEs0S09N?=
 =?utf-8?B?TVZVV0pjSkhqdHdTOG9kSlpvemhjODVId2V3bTM3VlZ6YkRnU3hxRlkrUTAv?=
 =?utf-8?B?VGlmQ0k4a3ZneDU2QXhJYmZ6VThhUWhwa0ZOUnZRZXB4VThLNzhkYytSMThx?=
 =?utf-8?B?WExYZ0N1N1RJako0OFRMVUNhMmJ2TE9DcWRKYVhaOVBOS1Z6WFJjUWQ5Q0lF?=
 =?utf-8?B?VTRpM3JONDIwdzdiQ2FBYzZhOXoyUm9ieHpwZUNRZmlieFJQTjAxdkt2Risw?=
 =?utf-8?B?WVQvVFEwaDBHRFNYMklMZ3NUd3BFbG1vMmVDQzcxVlU4N05SY1RsZTBjU0hU?=
 =?utf-8?B?NnRZODRuYmwvU2g0WHVyL2RkVjZZZHUwcXhBWlM1UTRoMFkxb3Q3STMrNlhS?=
 =?utf-8?B?eVBkaXdPK0NDckdBNFhLVy9nTXlZUFlYemhES2lDM2NtRHpDSEh2V0V1RzlW?=
 =?utf-8?B?ejh4UExmdnVEK2R2MXdJanIrV3pYRVptcGVtbHRLZjhlcGFRMGRZRUZ6dXVs?=
 =?utf-8?B?eVJ2cWkxdjJnVkRYZ1pQV3gwY2QvWERkZktYdFVNek5VYTRmYXRmOWhkUUIx?=
 =?utf-8?B?Qi9wbCtOaU02ZDBzbHlKMk5XUDNrQnFoRXFhM1BtZ0hiNkhxWG54bmFwcWIy?=
 =?utf-8?B?OSt4YnRnNGhXajI0clhlaWcraDFFSUUzTVBPNy91OUdWeUhNbG1qdjZleG9R?=
 =?utf-8?B?dnJYdVEwcXltNk4vSTNXSE5LWStaMi95WitLZU5BOURqendjM1k5bEtVOWFi?=
 =?utf-8?B?SE5kREhWR01UcFFSK1FjcFVpRG1BVUpDc3J3eVN3ei8ydlZ1bVNuUUhONkNq?=
 =?utf-8?B?OTNLdUhDZE8wUTJZdVFYZFVjeGgya2MyS0dianJha255S0tyY1g0L01LRGd5?=
 =?utf-8?B?cFg0WmdJT0gwUDhrQ2tsbXhwSUdPRXV3bGUvT3ZmNUY5Q3JQdmt5ZEh5Mm1S?=
 =?utf-8?B?QjB1NHY2S1dIYnlQcGMxVlJlTEwrMWNFd09zaTJETkFkS05jTEY2WkJqaXBu?=
 =?utf-8?B?aGZDb1VpZEN3L05WOWlqc2FjNWZrb3NNcEllVFUzSzlOdFkvQ3Z1ZERQbklv?=
 =?utf-8?B?M2RVSEhBL1JveFhHWFhNblZ5TnZnVmxWZlRZSnB6ZVRUY1pyL2lUVWwzaGNQ?=
 =?utf-8?B?Zlp2TTdCRkwwc2llWGd3TllVYkdDQUZwSCtmeVk5K0Y3YUR3Kyt5SXM1TWNS?=
 =?utf-8?B?T0hiclVKQUFySk9uYUZJaVd3MTlkbm5pVWZaNVIyZndpKzBLRFU3RzJlQUto?=
 =?utf-8?B?MHFuSjRjL1kzNVJwa3FjSkphMUk3NUx6U2lVRFJRckVzNTNESjVlV012ZFZk?=
 =?utf-8?B?azV6Y0cvOTJHcjREM0xoSXFnYXlVczJFTCtXWjFsazc5a3VsUlNYb1RzWnJG?=
 =?utf-8?B?b3RjTTVvaUV0T1NFNGJWNWlDUjVOWkpBQlBFSXNKVmF4NUtKNXJuY3l5OTln?=
 =?utf-8?B?QmFSQklKRDF4cDFkckR6bEZPOGJxS2V1NlIvdWo0V2JyTVE1Rm1JcDUyV292?=
 =?utf-8?B?MkZXb0RwWHRtS2dvTkRydDZvTVdDZitQdG1nUGZ3L0FyOEtBZktQZm00V3Bn?=
 =?utf-8?B?MEgwWjB6dVVxK3Y0UGxsSyt0L3FXcUh1QXUrOTJ2VVFMcWJPcTg4MEdwazNr?=
 =?utf-8?Q?vL4tpDYwRLDgl/8ChDyd/r8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c42a84c-d282-447e-028e-08d9a05a688a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:47:21.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3NjrWIIj/sWyC/uLeG/viRyp4yOgAYmUdOcbiE87zhtDVwShqP3z5WAILgafnTDQ2B39xzgaZyC1hBTKyW0zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 07.09.2021 15:03, Penny Zheng wrote:
> Hi Julien and Stefano
> 
> I found that the "cc-option/cc-option-add" is not working for "-march=xxx" option on a few very common aarch64 compilers.
> Here is what I got when trying to compile XEN on r82 platform.
> ```
> diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
> index 11caec86ba..d2d71baef4 100644
> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -10,6 +10,10 @@ $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
> CFLAGS-$(CONFIG_ARM_32) += -msoft-float
> CFLAGS-$(CONFIG_ARM_32) += -mcpu=cortex-a15
> 
> +#ifeq ($(CONFIG_ARM64_V8R),y)
> +    CFLAGS-$(CONFIG_ARM_64) += $(call cc-option,$(CC),-march=armv8-r,-march=armv8.4-a)
> +#endif
> +
> CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
> CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
> $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
> ```
> My gcc compiler version is as follows:
> ```
> Using built-in specs.
> COLLECT_GCC=aarch64-linux-gnu-gcc
> COLLECT_LTO_WRAPPER=/usr/lib/gcc-cross/aarch64-linux-gnu/9/lto-wrapper
> Target: aarch64-linux-gnu
> Configured with: ../src/configure -v --with-pkgversion='Ubuntu 9.3.0-17ubuntu1~20.04'
> --with-bugurl=file:///usr/share/doc/gcc-9/README.Bugs --enable-languages=c,ada,c++,
> go,d,fortran,objc,obj-c++,gm2 --prefix=/usr --with-gcc-major-version-only --program-suffix=-9
> --enable-shared --enable-linker-build-id --libexecdir=/usr/lib --without-included-gettext
> --enable-threads=posix --libdir=/usr/lib --enable-nls --with-sysroot=/ --enable-clocale=gnu
> --enable-libstdcxx-debug --enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new
> --enable-gnu-unique-object --disable-libquadmath --disable-libquadmath-support --enable-plugin
> --enable-default-pie --with-system-zlib --without-target-system-zlib --enable-libpth-m2 --enable-multiarch
> --enable-fix-cortex-a53-843419 --disable-werror --enable-checking=release --build=x86_64-linux-gnu
> --host=x86_64-linux-gnu --target=aarch64-linux-gnu --program-prefix=aarch64-linux-gnu- --includedir=/usr/aarch64-linux-gnu/include
> Thread model: posix
> gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)
> ```
> However. even if my gcc compiler is indeed not supporting "-march=armv8-r", above check will not identify it
> "unrecognized option" and seek to the "-march=armv8.4-a" as expected.
> See the resulting errors, it still uses "-march=armv8-r":
> ```
> make[3]: Entering directory '/home/penny/FVP/r82/fvp_aemv8r_cortexr82_0.0_6347_gcc6.4/xen/xen'
> aarch64-linux-gnu-gcc -MMD -MP -MF ./.asm-offsets.s.d -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall
> -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs
> -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith -Wvla
> -pipe -D__XEN__ -include /home/penny/FVP/r82/fvp_aemv8r_cortexr82_0.0_6347_gcc6.4/xen/xen/include/xen/config.h
> -g -march=armv8-r -mgeneral-regs-only -mno-outline-atomics -I/home/penny/FVP/r82/fvp_aemv8r_cortexr82_0.0_6347_gcc6.4
> /xen/xen/include -fno-stack-protector -fno-exceptions -fno-asynchronous-unwind-tables -fcf-protection=none
> -Wnested-externs '-D__OBJECT_FILE__="asm-offsets.s"' -S -g0 -o asm-offsets.s.new -MQ asm-offsets.s arch/arm/arm64/asm-offsets.c
> cc1: error: unknown value 'armv8-r' for '-march'
> cc1: note: valid arguments are: armv8-a armv8.1-a armv8.2-a armv8.3-a armv8.4-a armv8.5-a; did you mean 'armv8-a'?
> make[3]: *** [Makefile:413: asm-offsets.s] Error 1
> ```
> And the reason is that in the implementation of "cc-option": To handle this we do a test compile, passing the option-under-test,
> on a code fragment that will always produce a warning (integer assigned to pointer). We then grep for the option-under-test in
> the compiler's output, the presence of which would indicate an "unrecognized command-line option" warning/error.
> ```
> cc-option = $(shell if test -z "`echo 'void*p=1;' | \
>                      $(1) $(2) -S -o /dev/null -x c - 2>&1 | grep -- $(2) -`"; \
>                      then echo "$(2)"; else echo "$(3)"; fi ;)
> ```
> Here, that is, we are trying to grep "-march=armv8-r" in output message of the test compile, and since the output
> message(unknown value 'armv8-r' for '-march') doesn't contain the COMPLETE string, it thought the compiler supported this
> option, but it actually not...
> 
> Tracing back to the commit about the implementation of "cc-option", it discards the linux method(using exit code to tell) for dealing with
> disable-warning options.
> See https://github.com/xen-project/xen/commit/28f8fb7d2b3fde2f5cbe5526ac4f1c932e3f5d26 for more details.
> 
> To fix this issue, I could loose the "grep check", instead trying to grep the COMPLETE option string("-march=armv8-r"), only partial(armv8-r) is
> enough. But, hmmm, the way of greping output message to check is kinds of reliable, IMO, since there is no standard for that.

Since we need to be careful about not relaxing this too much, my
immediate suggestion here would be to split option strings at =
signs, and then use grep to check that every resulting piece is
present in the error message coming from the compiler. Afaict
this should cover your case and might also make a few others
less fragile. Unfortunately I expect this will make for quite a
bit more complicated a make macro. I wonder whether Linux hasn't
run into the same problem at some point, and has found some more
elegant and/or robust solution.

Jan


