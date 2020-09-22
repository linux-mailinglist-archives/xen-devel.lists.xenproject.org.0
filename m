Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3BC273EB3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 11:41:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKen6-0004JB-3f; Tue, 22 Sep 2020 09:40:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VADB=C7=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kKen4-0004J6-Fc
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 09:40:50 +0000
X-Inumbo-ID: ae419e11-355f-417d-8de4-e25d3c63ef90
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ae419e11-355f-417d-8de4-e25d3c63ef90;
 Tue, 22 Sep 2020 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600767649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcZXDbmm8K6dc/e0q/aUuC34Xa0RXIv+ARL8iLaiLKA=;
 b=Dr2FbXZwP0iPo9Ri00y6J/WNXkK01Nbwkt0r9190z8sNDDExgRasZeak1DqVvtWfu4AhHu
 nKPQU9/Zov4BrUgmL+Drge1TOZfS6mD2fAHpr0DDyN/0PVUC13bnI8zC6eopTI8/+25Wf5
 VrV2vyr0rkiwmprd4b5S0GidOIJdiKE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-yHYy52BgPSOlnvinbQiHxQ-1; Tue, 22 Sep 2020 05:40:45 -0400
X-MC-Unique: yHYy52BgPSOlnvinbQiHxQ-1
Received: by mail-wr1-f71.google.com with SMTP id s8so7143878wrb.15
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 02:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JcZXDbmm8K6dc/e0q/aUuC34Xa0RXIv+ARL8iLaiLKA=;
 b=NPdLauIl+2wb+nzHAHZRiBT3WS1MInzgKXizlLuS6KUpRLOg0Uy2oobPph5kS0jCrW
 /1c2Jb6yZRPpVyurl9liZlM3P4KtTZ0WYqoG4IrwyUSgoGaibFQIysDaXxXNrOGLRQ/U
 AR+WNIb2fu2vUkY/qeBlfN7a9BTcb7y5hGNQ826+2PdrO9o5rduLbRAA3Bsr6Lq85K5P
 W74zjcAqYTG2PW4GIILMpMEUIMwjto1CHljZy2DKGgdO5obDaoWl9pKS8jvbhyJYG8k8
 ZfVdA7HViCoQZUVDpS8PDfJo2RRZu5sq/9/dHVi3bbHd8OwLWNerQWR3ZhP86X1Dn3cO
 wLBg==
X-Gm-Message-State: AOAM53021qdkBJyD7S2eMlTyLzqWURRsonT89yw6ZmnrzElFj6jiqaoY
 zu4uYw4ReJL0QMx0klzGGBCOVB+jfFo8rATbzHo5lNg9yT0qNclggxpqJI8WMxTh4PHw5w05BhS
 o8wbte0PNjaV9Ryu5Uqg3yNWc7h8=
X-Received: by 2002:adf:83c3:: with SMTP id 61mr4168372wre.287.1600767644409; 
 Tue, 22 Sep 2020 02:40:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgU+HI/ERoonjI/3fcPuubutXZeWfGi1H0e2BOTW+Gl0d29bP38JyJljoi79ytg5GQHl63CA==
X-Received: by 2002:adf:83c3:: with SMTP id 61mr4168350wre.287.1600767644144; 
 Tue, 22 Sep 2020 02:40:44 -0700 (PDT)
Received: from [192.168.10.165] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id s17sm26920605wrr.40.2020.09.22.02.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 02:40:43 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] hw/xen: Housekeeping
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20200908155530.249806-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8b4dc535-166d-9377-27ff-5d75f8978191@redhat.com>
Date: Tue, 22 Sep 2020 11:40:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908155530.249806-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/09/20 17:55, Philippe Mathieu-Daudé wrote:
> Hard to make an exciting cover of this series.
> 
> Basically:
> - Make better separation between Xen accel and Xen hardware,
> - Move stuff around to restrict PCMachineState to hw/i386/.
> 
> Since v1:
> - added missing include in stubs/xen-hw-stub.c
> - added missing 'exec/cpu-common.h' for ram_addr_t
> 
> (Due to a bug in 'make', while rebasing the archives
>  might not be updated... so I missed this missing
>  hunk as hw/core/libhwcore.fa didn't rebuilt stubs/)
> 
> Philippe Mathieu-Daudé (6):
>   hw/i386/q35: Remove unreachable Xen code on Q35 machine
>   hw/i386/xen: Rename X86/PC specific function as xen_hvm_init_pc()
>   sysemu/xen: Add missing 'exec/cpu-common.h' header for ram_addr_t type
>   stubs: Split accelerator / hardware related stubs
>   hw/xen: Split x86-specific declaration from generic hardware ones
>   typedefs: Restrict PCMachineState to 'hw/i386/pc.h'
> 
>  include/hw/i386/pc.h     |  4 ++--
>  include/hw/xen/xen-x86.h | 15 ++++++++++++
>  include/hw/xen/xen.h     |  2 --
>  include/qemu/typedefs.h  |  1 -
>  include/sysemu/xen.h     |  2 ++
>  accel/stubs/xen-stub.c   | 41 +-------------------------------
>  hw/i386/pc_piix.c        |  8 +++----
>  hw/i386/pc_q35.c         | 13 ++---------
>  hw/i386/xen/xen-hvm.c    |  3 ++-
>  stubs/xen-hw-stub.c      | 50 ++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS              |  1 +
>  stubs/meson.build        |  1 +
>  12 files changed, 80 insertions(+), 61 deletions(-)
>  create mode 100644 include/hw/xen/xen-x86.h
>  create mode 100644 stubs/xen-hw-stub.c
> 

Queued, thanks.

Paolo


