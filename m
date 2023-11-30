Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0057FF0AF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 14:50:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644726.1006157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8hQU-0007U3-Sx; Thu, 30 Nov 2023 13:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644726.1006157; Thu, 30 Nov 2023 13:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8hQU-0007SL-PV; Thu, 30 Nov 2023 13:49:58 +0000
Received: by outflank-mailman (input) for mailman id 644726;
 Thu, 30 Nov 2023 13:49:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dHGs=HL=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r8hQT-0007SC-Jg
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 13:49:57 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58809051-8f87-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 14:49:56 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b54261442so7822525e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 05:49:56 -0800 (PST)
Received: from [192.168.69.100] (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr.
 [176.184.17.116]) by smtp.gmail.com with ESMTPSA id
 h1-20020adfe981000000b00332f6202b82sm1595392wrm.9.2023.11.30.05.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 05:49:55 -0800 (PST)
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
X-Inumbo-ID: 58809051-8f87-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701352196; x=1701956996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzXC86kI/230MRmOExolGBgQpce+zyW7qougvXLVSk8=;
        b=DdPybzfowEgoEB8BjASp1vXoTGYhtt0hmNTm+ervACXYGtT4B4cBA8/EpDoXNlaf5k
         oo4iBU5JiQSnyEIrY/8ddcoHc0hd/9MTdBx3oq87drM8VBxEidqZmI0QM5NFjwP78RuJ
         aU55UL1sVvLIwnWkUsttc0pfs8oWWIyZlpZjwuXprGX8Z8E2gbaoJcUNI9mbi6NJRUfU
         uXlp92ov/R4vePTglXPfADx9/+XFoPED1mmW3+o51tA0zLCeuF0Ag/tlXDElQpAGXA7k
         w0TwU7Gk6rzGcHztIMFUWGA+OGRkSyJOgyqmTyXvPJK2jcUsIMXOcIRig06Q80HTuy7g
         FIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701352196; x=1701956996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzXC86kI/230MRmOExolGBgQpce+zyW7qougvXLVSk8=;
        b=K+gWNNRD03NIwhclWo7xz3uX5RCUYBaWlZIK348pCjzq38woDr6WoUUDCG4XOOitB8
         k/vV1XNa+2xvRM0K6QM6Sv0yuaE6F2UUAaiSKve+jh/MEEsQs36/TpS5Z2oZEPlQAW46
         kpGpQxdOEeISivMc7J9PbU/vm7d4Ec52hJSvklpukiqTKklsH5b2htKwxgYFjaxHvYHh
         Rs5ILWxSydjRnHQ9wwech8LhBFX2vQsUj7kXvmUODeyfFO0lSwHVVEkc5DJbsSC/ElWT
         S3nC4IPHmVN/qSLmjnEyMayB4IZjrfguJcXymaOkStQi4EOzZE2NhL4/q+sNj4n8OPSd
         0glw==
X-Gm-Message-State: AOJu0Yy/dESlB6s/t1UkP1+EkoTSPLuttSahe+5ItBKtL+6N8sSkGb7s
	9fcmeIgBDFPwL2KoSMZyGNmUdA==
X-Google-Smtp-Source: AGHT+IGEZM/F60lbKf+pyOaxLGJZDqngSEf0GXts+oJS0AF+AGOPuKqrMqfmt5a2LHBk+wqKglvvAA==
X-Received: by 2002:adf:f588:0:b0:332:eb19:9530 with SMTP id f8-20020adff588000000b00332eb199530mr14573473wro.32.1701352195915;
        Thu, 30 Nov 2023 05:49:55 -0800 (PST)
Message-ID: <fcaff24d-0ced-4547-898f-a9b8bf49be45@linaro.org>
Date: Thu, 30 Nov 2023 14:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] Rename "QEMU global mutex" to "BQL" in comments and
 docs
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Paul Durrant <paul@xen.org>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Huacai Chen <chenhuacai@kernel.org>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Jiri Slaby <jslaby@suse.cz>, Alexander Graf <agraf@csgraf.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Stafford Horne <shorne@gmail.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 John Snow <jsnow@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Michael Roth <michael.roth@amd.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-7-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129212625.1051502-7-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/11/23 22:26, Stefan Hajnoczi wrote:
> The term "QEMU global mutex" is identical to the more widely used Big
> QEMU Lock ("BQL"). Update the code comments and documentation to use
> "BQL" instead of "QEMU global mutex".
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   docs/devel/multi-thread-tcg.rst   |  7 +++----
>   docs/devel/qapi-code-gen.rst      |  2 +-
>   docs/devel/replay.rst             |  2 +-
>   docs/devel/multiple-iothreads.txt | 16 ++++++++--------
>   include/block/blockjob.h          |  6 +++---
>   include/io/task.h                 |  2 +-
>   include/qemu/coroutine-core.h     |  2 +-
>   include/qemu/coroutine.h          |  2 +-
>   hw/block/dataplane/virtio-blk.c   |  8 ++++----
>   hw/block/virtio-blk.c             |  2 +-
>   hw/scsi/virtio-scsi-dataplane.c   |  6 +++---
>   net/tap.c                         |  2 +-
>   12 files changed, 28 insertions(+), 29 deletions(-)


> diff --git a/include/block/blockjob.h b/include/block/blockjob.h
> index e594c10d23..b2bc7c04d6 100644
> --- a/include/block/blockjob.h
> +++ b/include/block/blockjob.h
> @@ -54,7 +54,7 @@ typedef struct BlockJob {
>   
>       /**
>        * Speed that was set with @block_job_set_speed.
> -     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
> +     * Always modified and read under BQL (GLOBAL_STATE_CODE).

"under the BQL"

>        */
>       int64_t speed;
>   
> @@ -66,7 +66,7 @@ typedef struct BlockJob {
>   
>       /**
>        * Block other operations when block job is running.
> -     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
> +     * Always modified and read under BQL (GLOBAL_STATE_CODE).

Ditto,

>        */
>       Error *blocker;
>   
> @@ -89,7 +89,7 @@ typedef struct BlockJob {
>   
>       /**
>        * BlockDriverStates that are involved in this block job.
> -     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
> +     * Always modified and read under BQL (GLOBAL_STATE_CODE).

Ditto.

>        */
>       GSList *nodes;
>   } BlockJob;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


