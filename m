Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892997BFB03
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 14:16:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614846.956117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBfG-0008QM-Ni; Tue, 10 Oct 2023 12:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614846.956117; Tue, 10 Oct 2023 12:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBfG-0008Nf-L2; Tue, 10 Oct 2023 12:16:42 +0000
Received: by outflank-mailman (input) for mailman id 614846;
 Tue, 10 Oct 2023 12:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rlhl=FY=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1qqBZk-00044v-CP
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 12:11:00 +0000
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12ee1d84-6766-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 14:10:59 +0200 (CEST)
Received: from [192.168.2.166] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BF11966072B6;
 Tue, 10 Oct 2023 13:10:57 +0100 (BST)
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
X-Inumbo-ID: 12ee1d84-6766-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696939859;
	bh=rkoxdkzpBRiLsu+HZW222Ci6VJ4ZbNZnvJKASj8v+Qk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YJrAlLGQX7F5DItOeK9lDB4Rmq9LJ+dEuwNIqgU04qOPIEGYr8l8yqJaajzXd675O
	 CzGdif2PMURe7hVi7LTVvyng3h1YKcKjIf2bwgCH6yk/xCAFNOA3FVOcuUxeYY5Qa0
	 SjB5iETgnSpSGV/YFDPQsdgHzO9RVvtGbtlCQWoOoupb4LboKZv0Uc2wmpAtLS0c9q
	 eJeBeDes60d8mxTT+FAmhY6XbX5bD5DM81/VGf8Fsm5Hhzc0He9vxPH7LdsY2tgBLb
	 Jc02QCURXNBUMhyLSFeJxJyUbRneWqN80Zcc12Qa6RzjjlGQV8h/6yIrQgIyKBksEA
	 aZJQSDsC2PnyA==
Message-ID: <c5f04687-160b-08e7-1366-c29cba69f929@collabora.com>
Date: Tue, 10 Oct 2023 15:10:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [QEMU PATCH v5 12/13] virtio-gpu: Initialize Venus
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
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
 <20230915111130.24064-13-ray.huang@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230915111130.24064-13-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/23 14:11, Huang Rui wrote:
> +  if virgl.version().version_compare('>= 0.9.0') and virgl.version().version_compare('< 1.0.0')
> +    message('Enabling virglrenderer unstable APIs')
> +    virgl = declare_dependency(compile_args: '-DVIRGL_RENDERER_UNSTABLE_APIS',
> +                               dependencies: virgl)
> +  endif

All the required APIs has been stabilized in virglrenderer 1.0, we
shouldn't use the VIRGL_RENDERER_UNSTABLE_APIS anymore. The unstable
APIs were used for development purposes and shouldn't present in the
final version.

Please remove the VIRGL_RENDERER_UNSTABLE_APIS in v6.

-- 
Best regards,
Dmitry


