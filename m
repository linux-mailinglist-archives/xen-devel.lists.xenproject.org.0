Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17B07CCA21
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 19:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618317.961815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qso9t-0005ie-JX; Tue, 17 Oct 2023 17:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618317.961815; Tue, 17 Oct 2023 17:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qso9t-0005go-Fe; Tue, 17 Oct 2023 17:47:09 +0000
Received: by outflank-mailman (input) for mailman id 618317;
 Tue, 17 Oct 2023 17:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QnrG=F7=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1qso9s-0005gi-Ap
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 17:47:08 +0000
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2edfe77e-6d15-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 19:47:04 +0200 (CEST)
Received: from [192.168.2.39] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 354A166030BF;
 Tue, 17 Oct 2023 18:47:02 +0100 (BST)
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
X-Inumbo-ID: 2edfe77e-6d15-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697564824;
	bh=7IsusT1dT12JlmsWi9fTD4lUiRDuxbrgFdaEhWCoJCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HqEcLArg8mFxNxd6e0qNpQnrW/kTfGv9MFOTfihiBbA4ALKaa60aAYs3U45zbolVk
	 YZBWCy2RzPd0CCq39L0nUWRED41AUzcenQJs0SLWp/8sMxKvG3wzCrfMotL7TIjhHx
	 PfAAOxs1mBQT1tBn4LDjAGjjJ/zKIshrSX56s7RdU4JQDxBEa4RBMse8ZUOXPA+CEp
	 KKqgQTl8Sk3bx92mT0elWyVa62zHIGtw3x5RjEaKMXwoXtakNcx0pMJOthySgvsbJR
	 Sax8j8eAxAXSkrsq5A7dO3VqkY6InDoi3sCEAxkzQuCMNH6MCnCXjCYrI13PBB6KpP
	 7BQEV+XKTyAwg==
Message-ID: <1d902287-2ebf-fe0a-ccbd-bf671c04eddf@collabora.com>
Date: Tue, 17 Oct 2023 20:46:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [QEMU PATCH v5 05/13] virtio-gpu: Configure context init for
 virglrenderer
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Albert Esteve <aesteve@redhat.com>, ernunes@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-6-ray.huang@amd.com>
 <16520a76-7177-f97c-049b-302d8baea616@collabora.com>
 <ZSU6pqcyBxTPTcwc@redhat.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ZSU6pqcyBxTPTcwc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/10/23 14:51, Daniel P. Berrangé wrote:
> On Tue, Oct 10, 2023 at 02:41:22PM +0300, Dmitry Osipenko wrote:
>> On 9/15/23 14:11, Huang Rui wrote:
>>> Configure context init feature flag for virglrenderer.
>>>
>>> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> ---
>>>
>>> V4 -> V5:
>>>     - Inverted patch 5 and 6 because we should configure
>>>       HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
>>>
>>>  meson.build | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 98e68ef0b1..ff20d3c249 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -1068,6 +1068,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
>>>                                         prefix: '#include <virglrenderer.h>',
>>>                                         dependencies: virgl))
>>>    endif
>>> +  config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
>>> +                       cc.has_function('virgl_renderer_context_create_with_flags',
>>> +                                       prefix: '#include <virglrenderer.h>',
>>> +                                       dependencies: virgl))
>> The "cc.has_function" doesn't work properly with PKG_CONFIG_PATH. It ignores the the given pkg and uses system includes. Antonio was aware about that problem [1].
>>
>> [1] https://gitlab.freedesktop.org/Fahien/qemu/-/commit/ea1c252a707940983ccce71e92a292b49496bfcd
>>
>> Given that virglrenderer 1.0 has been released couple weeks ago,
>> can we make the v1.0 a mandatory requirement for qemu and remove
>> all the ifdefs? I doubt that anyone is going to test newer qemu
>> using older libviglrenderer, all that ifdef code will be bitrotting.
> 
> We cannot do that. If is is only weeks old, no distro will
> have virglrenderer 1.0 present. QEMU has a defined set of
> platforms that it targets compatibility with:
> 
>   https://www.qemu.org/docs/master/about/build-platforms.html
> 
> For newly added functionality we can set the min version to
> something newer than the oldest QEMU target platform.
> 
> For existing functionality though, we must not regress wrt
> the currently supported set of target platforms. So we can
> only bump the min version to that present in the oldest
> platform we target.

Well, then alternatively we could specify supported libvirglrender
features based on the lib version to avoid those pkgconfig+meson troubles.

-- 
Best regards,
Dmitry


