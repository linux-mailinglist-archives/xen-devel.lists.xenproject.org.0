Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153206D63BF
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 15:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517876.803812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjh0r-0005Zi-RX; Tue, 04 Apr 2023 13:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517876.803812; Tue, 04 Apr 2023 13:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjh0r-0005Ws-Oq; Tue, 04 Apr 2023 13:47:53 +0000
Received: by outflank-mailman (input) for mailman id 517876;
 Tue, 04 Apr 2023 13:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8slJ=73=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1pjh0q-0005Wk-3m
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 13:47:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49ac961a-d2ef-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 15:47:50 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-soMn4lKEOgS4lM9Mr4vtAQ-1; Tue, 04 Apr 2023 09:47:45 -0400
Received: by mail-ed1-f69.google.com with SMTP id
 u30-20020a50c05e000000b0050299de3f82so10374672edd.10
 for <xen-devel@lists.xenproject.org>; Tue, 04 Apr 2023 06:47:45 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 u25-20020a170906109900b008e22978b98bsm5996684eju.61.2023.04.04.06.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:47:44 -0700 (PDT)
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
X-Inumbo-ID: 49ac961a-d2ef-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680616069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NXZVAuXURCCUeEyCJ3Apt7MqMRoeGh4PQRIsfTgOkBg=;
	b=Y+VGdb+cQ0Un1Bfr731INk2BFXRgrmxlmd8dH6m6QAfIFciwB3qKeAeZOSPPUZthpsF70O
	KajTWvXkThnPdZNW6Ha+ZIMFj9qdbmdudX8LZ56oCrE7EootRaLN/kcyps5BhCAnay0yVl
	SzxUZzQ97067GL9bRpzUqiNiNcVxVF4=
X-MC-Unique: soMn4lKEOgS4lM9Mr4vtAQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680616065; x=1683208065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXZVAuXURCCUeEyCJ3Apt7MqMRoeGh4PQRIsfTgOkBg=;
        b=GJjzaPP6j2RNmErkH7tg+w6Kj1i5jqPJsLvOdm7QCAlks+ZSDmGbUlo672hUG4KHar
         WUxNt+thSENTuQTJ2ODSydGI4IW2d6fT9JIrBdqbStM58RC4VpXVYB/RtcgXc9+bUbpL
         zy4Ik3ekZhUFqctgUL9F1SlL26tEjajc2pVGnJtocAJ9ME7TeEFkIR01lmyXREb8QwcE
         zId1quFZQwvz2PMmMPc+pIklOUWNeOTCWO02CyEZnEmYbI5WFGbn4cQ67dJHGmrFdaWn
         zx+AIy/gs/3AFVDq89mRL4OC1RRVAWfEVmR6co5d9soiAb2lfnUYsY9pbOF6RKniSYmx
         6D2w==
X-Gm-Message-State: AAQBX9cs3N+bWxWlBOF+nz5NAVCMim7xKlscvwYP2Mjh/w02DHgmiGWW
	A+HjG197yAkxxYe3M5+PBPIL1VZIP4zBrY4ZDJxrH3UeQTRxzEQPDXiQvwjCrt12new5m0PuY8n
	QZNPbB/8hbBLwRBprvkF3LYfk73g=
X-Received: by 2002:a17:906:68ca:b0:931:b4d3:fc7f with SMTP id y10-20020a17090668ca00b00931b4d3fc7fmr2638023ejr.30.1680616064890;
        Tue, 04 Apr 2023 06:47:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350bTUWpDfEkQMztCXSp3lAzmKMLlNkSrHzGGYgK9EE7DOW/ArYgtjIo2Ha6U6gSgxkvegrzexA==
X-Received: by 2002:a17:906:68ca:b0:931:b4d3:fc7f with SMTP id y10-20020a17090668ca00b00931b4d3fc7fmr2638000ejr.30.1680616064630;
        Tue, 04 Apr 2023 06:47:44 -0700 (PDT)
Message-ID: <df512475-d1b0-eb76-9a0b-28760b5a73d2@redhat.com>
Date: Tue, 4 Apr 2023 15:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/13] virtio-scsi: avoid race between unplug and
 transport event
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Julia Suvorova <jusual@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 Coiby Xu <Coiby.Xu@gmail.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
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
 <20230403183004.347205-2-stefanha@redhat.com>
 <2bbe988c-0802-55c3-b2a3-05e3f94e2f04@linaro.org>
 <20230404130658.GG428487@fedora>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230404130658.GG428487@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/23 15:06, Stefan Hajnoczi wrote:
>> Would this be more useful as a qdev_is_realized() helper?
> Yes. There are no other users, but I think a helper makes sense.

Agreed; anyway,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


