Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD215BFFEA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 16:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409453.652800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob0m3-0004dS-CS; Wed, 21 Sep 2022 14:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409453.652800; Wed, 21 Sep 2022 14:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob0m3-0004Zy-8g; Wed, 21 Sep 2022 14:32:27 +0000
Received: by outflank-mailman (input) for mailman id 409453;
 Tue, 20 Sep 2022 14:01:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qIp4=ZX=gmail.com=danielhb413@srs-se1.protection.inumbo.net>)
 id 1oadoI-0007yu-Bj
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 14:01:14 +0000
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af7323fd-38ec-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 16:01:13 +0200 (CEST)
Received: by mail-ot1-x336.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso1770278otb.6
 for <xen-devel@lists.xenproject.org>; Tue, 20 Sep 2022 07:01:13 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a056830071600b0065892f42157sm821295ots.75.2022.09.20.07.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 07:01:10 -0700 (PDT)
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
X-Inumbo-ID: af7323fd-38ec-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=obx72+8lj9qm2WhrMMX0CKsbEGig5oqUktdJe59wJ8c=;
        b=EYGsqsWfnaYLIUhNnwR+W3+HQV7e1PVwf2K+QWqXr8T8ik7uhUchYwfaPRXzwOSNdj
         Y/VehUxaTawGdfoqwV5K3tSuvfrPWqckFhn+PXkxZYghBOhI2+TO0xbTzdFFrdhpyh2x
         veDoWSvsPDca3I578Fy9amlMqEZxQtbHz3JbXHWjMiu5OfyH5uyFImUWMMUvuKamIuTS
         YG8Kte9lSMN+Y8mrfYFVvuA43odoGtzEhiO8+jo4NP0P6X2/MTgvqMcLEzX/vDtgsO9b
         Gwc7jwC79qXCaM1/HPNBUkVZGrFZS5xRrwr2Ne3iu0RW7Y6naElU5JeR1p5TlLLhSvzD
         4tyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=obx72+8lj9qm2WhrMMX0CKsbEGig5oqUktdJe59wJ8c=;
        b=7R6JVd++CElh7aQ1JX7wioSxtbqvw6KzxH9fLUwd43RF6htwSHxGTpM0AelXimEGAp
         Pc8cbBgapJc7MUMMTHdihnL8VryzKFDUm6vy8/78U4hz0qMYeldCETqdjmOHptZGB3GI
         6lHPCgoP5OBRPEFKxQ1leH0uc9UJQ4SHOD6BqffA94V/MOsWxHdqfdMUW/ZBQ3dYjIb2
         n7APv3h49lBQDtEkD9E++YoyOr4rgnVdgzcygAGTYN8G9kkwzNoUh42aamrupXX6gqGN
         KwwFaWXYMnZm4W6YtwGdHiepvnMH0NEJEg1bE/QtTuqJA2NA84u0qH2v+BSTSWbvhj8i
         1/dQ==
X-Gm-Message-State: ACrzQf1OgjF2dM+gdxbgI56ysAyk3be4kI6ctUuT1pGTjowAH2YLelvW
	u7vX1zezCjh78XS763lXWUY=
X-Google-Smtp-Source: AMsMyM7SJwY7Rzq8kp0hCW9RSDbUha/Eoq34TgM/6q2jfQ2yIYDABRMiwIOljIt9IFN/T/DE/u7ntw==
X-Received: by 2002:a05:6830:18d8:b0:655:1f50:715f with SMTP id v24-20020a05683018d800b006551f50715fmr10392167ote.97.1663682472036;
        Tue, 20 Sep 2022 07:01:12 -0700 (PDT)
Message-ID: <8906f236-dbfc-7d51-a87d-2c02e8c506b2@gmail.com>
Date: Tue, 20 Sep 2022 11:00:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 4/9] hw/ppc/spapr: Fix code style problems reported by
 checkpatch
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm
 <magnus.damm@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Cameron Esfahani
 <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Jagannathan Raman <jag.raman@oracle.com>,
 Greg Kurz <groug@kaod.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Paul Durrant <paul@xen.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, John G Johnson
 <john.g.johnson@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Andrew Jeffery
 <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, Jason Herne <jjherne@linux.ibm.com>
References: <20220919231720.163121-1-shentey@gmail.com>
 <20220919231720.163121-5-shentey@gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220919231720.163121-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/19/22 20:17, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


And I've queued it in gitlab.com/danielhb/qemu/tree/ppc-next since it's not
tied with the rest of the series. Thanks,


Daniel

>   include/hw/ppc/spapr.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 530d739b1d..04a95669ab 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -848,7 +848,8 @@ static inline uint64_t ppc64_phys_to_real(uint64_t addr)
>   
>   static inline uint32_t rtas_ld(target_ulong phys, int n)
>   {
> -    return ldl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4*n));
> +    return ldl_be_phys(&address_space_memory,
> +                       ppc64_phys_to_real(phys + 4 * n));
>   }
>   
>   static inline uint64_t rtas_ldq(target_ulong phys, int n)
> @@ -858,7 +859,7 @@ static inline uint64_t rtas_ldq(target_ulong phys, int n)
>   
>   static inline void rtas_st(target_ulong phys, int n, uint32_t val)
>   {
> -    stl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4*n), val);
> +    stl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4 * n), val);
>   }
>   
>   typedef void (*spapr_rtas_fn)(PowerPCCPU *cpu, SpaprMachineState *sm,

