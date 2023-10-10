Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA177BFA75
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 13:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614700.955948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBMa-0004IT-GK; Tue, 10 Oct 2023 11:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614700.955948; Tue, 10 Oct 2023 11:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBMa-0004GV-Dd; Tue, 10 Oct 2023 11:57:24 +0000
Received: by outflank-mailman (input) for mailman id 614700;
 Tue, 10 Oct 2023 11:57:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rlhl=FY=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1qqBMZ-0004GP-2K
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 11:57:23 +0000
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b72ab68-6764-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 13:57:22 +0200 (CEST)
Received: from [192.168.2.166] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A113366072B4;
 Tue, 10 Oct 2023 12:57:19 +0100 (BST)
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
X-Inumbo-ID: 2b72ab68-6764-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696939041;
	bh=wJYs30MEiuAzJZmbMZ3VI4oXBaOgMnqSjxIcpU2jV2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DpsPJxqSR+ASF1Kug9+XAPPcWk91pF6GiOxnNLPkP+PruSexjirRJIrWkU3RkAmJf
	 JumiJK2Pqe8x7/D7NAA96dUAgKk5KhQvKiWi02ucceAg6Ad/YNtWydmNcySptbcgNE
	 ooovbQlD9+dty/rlR0XPR+PNtpx0ZaunHXjwotdrgdaPxuI/M4sQFyHct7JNLtXY3f
	 Q8TtXPp69qYhlXU3btZ8s76Xi7SMr80BwW1hpKIyK/XiUfKs//8rYU2G78kTD/4e5b
	 szKx1wvR0A3OiB08tiPxm2tAB6hvTSEiTas0cUe3A5ZHyHPSzz6qcFiELDjoBWOqNu
	 HsspeywEE/rLA==
Message-ID: <ff99baee-a1c7-69cf-bc27-55cf2d0208ab@collabora.com>
Date: Tue, 10 Oct 2023 14:57:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [QEMU PATCH v5 00/13] Support blob memory and venus on qemu
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
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230915111130.24064-1-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/23 14:11, Huang Rui wrote:
> Hi all,
> 
> Antonio Caggiano made the venus with QEMU on KVM platform last
> September[1]. This series are inherited from his original work to support
> the features of context init, hostmem, resource uuid, and blob resources
> for venus.
> At March of this year, we sent out the V1 version[2] for the review. But
> those series are included both xen and virtio gpu. Right now, we would like
> to divide into two parts, one is to continue the Antonio's work to upstream
> virtio-gpu support for blob memory and venus, and another is to upstream
> xen specific patches. This series is focusing on virtio-gpu, so we are
> marking as V4 version here to continue Antonio's patches[1]. And we will
> send xen specific patches separately, because they are hypervisor specific.
> Besides of QEMU, these supports also included virglrenderer[3][4] and
> mesa[5][6] as well. Right now, virglrenderer and mesa parts are all
> accepted by upstream. In this qemu version, we try to address the concerns
> around not proper cleanup during blob resource unmap and unref. Appreciate
> it if you have any commments.

Venus uses blob buffers. In order to display Venus/VK application using
GL display server, the VIRTIO_GPU_CMD_SET_SCANOUT_BLOB must be
supported. Otherwise Venus itself isn't practically useful because you
can't run VK application with a usual Linux DE because Venus will error
out due to the unsupported command.

The VIRTIO_GPU_CMD_SET_SCANOUT_BLOB support needs to be a part of this
series, IMO. Can we add it to the next patchset version?

-- 
Best regards,
Dmitry


