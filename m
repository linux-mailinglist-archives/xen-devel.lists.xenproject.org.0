Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245846D63B4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 15:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517873.803803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjgzj-00052j-Gu; Tue, 04 Apr 2023 13:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517873.803803; Tue, 04 Apr 2023 13:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjgzj-0004zy-Di; Tue, 04 Apr 2023 13:46:43 +0000
Received: by outflank-mailman (input) for mailman id 517873;
 Tue, 04 Apr 2023 13:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8slJ=73=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1pjgzi-0004zr-P8
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 13:46:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20184499-d2ef-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 15:46:40 +0200 (CEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-mct8Gp3fNoy_iDMr5PIPuw-1; Tue, 04 Apr 2023 09:46:38 -0400
Received: by mail-ed1-f71.google.com with SMTP id
 j21-20020a508a95000000b004fd82403c91so45818213edj.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Apr 2023 06:46:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 ae14-20020a17090725ce00b00947a939f6e0sm5693767ejc.77.2023.04.04.06.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:46:35 -0700 (PDT)
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
X-Inumbo-ID: 20184499-d2ef-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680615999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOC5xMNB8TKUwhrqSALMGxTnLF38Hs5nrhrqBLl6nYM=;
	b=diswIHp3Kk8bHBFXDoC1xDGSmIUco8xblMdh2DwNsGJqx1gOWL07Ka+N52QlWzwF93nF0Y
	4H0C/jfL5xGjK0fSqDPcgKJW+Nd72ImQc18OHjU8TOVNZ/QviIk806kC1RIUdmSW9j/877
	NKbRnQML6TtJFAdS4bIiqz4d/B2bvUU=
X-MC-Unique: mct8Gp3fNoy_iDMr5PIPuw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680615997; x=1683207997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOC5xMNB8TKUwhrqSALMGxTnLF38Hs5nrhrqBLl6nYM=;
        b=Xas72rhRFB8hxvoiNnmzetw0397IEIEncBJ8+v2jPKQK9nvqgKN5V5GYyc/7y3ruUL
         bdqevhapMi8Bbt80J8Y00t8VKIJ+7l1KUv/vmxisPEd5ghgpefqN+AMhLa/2sb3hHgWJ
         Hf8zYj7aEO0xbjciL33uusWrCXsk++oRHllgV4EeKFQ1c8s9G8qX87wEwr4Vakncyxpo
         fhnAlnUM1TDPIT6bi2pZbOC2aHv7Xg5U3hn9nFPhvGld7GHzhOG2xNGXjD4OWrRbl7Hn
         OAXuiShk9R5yiATRuLyRY9ZfolAC/Dy1CSFdRpRJ1zB2y1V3oPt8uKdWNoPJ77z9qQcw
         T3bQ==
X-Gm-Message-State: AAQBX9ejd+YzgALL8NJ1fI1t4t/25vFeadOHKgTLFCkuKp3OWluBtl5x
	LLJSFzDKV0ZuC9/F5SWhvHYUjvxuqf9EpKGvTyOwcR/0shyx72EHDvUKkVzz09JuUW3xFNhxHsx
	BmvIPiJd1FLfMGSwyuDjKNLFP7U8=
X-Received: by 2002:a17:907:8a24:b0:947:791b:fdcb with SMTP id sc36-20020a1709078a2400b00947791bfdcbmr2640629ejc.21.1680615996937;
        Tue, 04 Apr 2023 06:46:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZKGn72BpwOfdhCDqdjHSKetYDAkrw483POzylVVBOQOp0vZ1sAfoVpUPVCPr98oRDnQvzcCQ==
X-Received: by 2002:a17:907:8a24:b0:947:791b:fdcb with SMTP id sc36-20020a1709078a2400b00947791bfdcbmr2640574ejc.21.1680615996616;
        Tue, 04 Apr 2023 06:46:36 -0700 (PDT)
Message-ID: <92b731c7-81d4-ef54-cca9-9dcb944e94f0@redhat.com>
Date: Tue, 4 Apr 2023 15:46:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/13] block/fuse: take AioContext lock around
 blk_exp_ref/unref()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <fam@euphon.net>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 eesposit@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-12-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230403183004.347205-12-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/23 20:30, Stefan Hajnoczi wrote:
> These functions must be called with the AioContext acquired:
> 
>    /* Callers must hold exp->ctx lock */
>    void blk_exp_ref(BlockExport *exp)
>    ...
>    /* Callers must hold exp->ctx lock */
>    void blk_exp_unref(BlockExport *exp)
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/export/fuse.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index 06fa41079e..18394f9e07 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -244,7 +244,9 @@ static void read_from_fuse_export(void *opaque)
>       FuseExport *exp = opaque;
>       int ret;
>   
> +    aio_context_acquire(exp->common.ctx);
>       blk_exp_ref(&exp->common);
> +    aio_context_release(exp->common.ctx);
>   
>       do {
>           ret = fuse_session_receive_buf(exp->fuse_session, &exp->fuse_buf);
> @@ -256,7 +258,9 @@ static void read_from_fuse_export(void *opaque)
>       fuse_session_process_buf(exp->fuse_session, &exp->fuse_buf);
>   
>   out:
> +    aio_context_acquire(exp->common.ctx);
>       blk_exp_unref(&exp->common);
> +    aio_context_release(exp->common.ctx);
>   }

Since the actual thread-unsafe work is done in a bottom half, perhaps 
instead you can use qatomic_inc and qatomic_fetch_dec in 
blk_exp_{ref,unref}?

Paolo


