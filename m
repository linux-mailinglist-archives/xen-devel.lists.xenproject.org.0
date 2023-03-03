Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CBD6A9D99
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 18:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506151.779193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY9AO-0005Se-IC; Fri, 03 Mar 2023 17:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506151.779193; Fri, 03 Mar 2023 17:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY9AO-0005Pa-E9; Fri, 03 Mar 2023 17:26:00 +0000
Received: by outflank-mailman (input) for mailman id 506151;
 Fri, 03 Mar 2023 17:25:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Pyx=63=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pY9AM-0005Mp-6B
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 17:25:58 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7588f144-b9e8-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 18:25:57 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id bw19so2980716wrb.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 09:25:57 -0800 (PST)
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
X-Inumbo-ID: 7588f144-b9e8-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677864357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eolyThTGlo6bEtjLFljkUurvUru9DXvRMlLGBK04tqc=;
        b=AesRmXH0khLbC7bbUOs7pw2sYP2zbK4e8Nl67bmVo2NwV7MgG3uU3/SHZJ77e0d0fe
         SSfPiDeJpjF7raa8G9bTw9Sx9/DmIrFzQSvq+Wc7UQTr5w848HcFVcJKan1mzaworwVh
         fQZBWqFaoe89Uoi0kE56w81bobCVg2WxhJn3GvwE0AsxLtT2DvB7D6ZushmObFiqhHOk
         6WEYbwqaMO3gHAWV4mus3QXg+dv3j9BhjgKx5xZBYcxHQ/wRxsQOg8x6iuC/ehf/8ba9
         oFFMQ5H473Aaviut3bUlcEq70mmwVKFpNIxGnydwQ6s+IKdbC7DZqmYla0hIaGu7of0t
         ykhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677864357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eolyThTGlo6bEtjLFljkUurvUru9DXvRMlLGBK04tqc=;
        b=3YvZVnRCxnZiCPsGQ6zstdTeA4uij43tdlZ07hCucooLi6neJhqPUE7yCF6RJkGexZ
         gAkC+lTBvHv2GK8gN9O6ay8gllvlY0PXZIeBwn4cf3oGxs6LlFz2cSxW6YAvJ/1L5wuq
         RHKHcw/dAnpxHW8dM8YvzNnLArIvGlroNk3D+0K64snZ5guBI/PVtO18kRuotBguVHwy
         h14nubM9sgX7/qnXg6xs/V7KUVsq+1Ey1zaOvm1yoD0qHMS95RaS8jlPs2hcIseQblv3
         Aif22FfzuJaK9Rnl7V6mUKAe/jm/JAfVAzomS225mPFSobRTsx6QVDAmil4tKkIcJZZb
         FNxw==
X-Gm-Message-State: AO0yUKWdGVUfki4lT7qvoGtmzWycygJvRw4eBReMnYMMLU5PyPoou0gP
	dcs2pJQxZdir31tg8zWX0nGYhUeCyyvrBlT47JJ48g==
X-Google-Smtp-Source: AK7set+uFm5Ox8uBG0e4DrfiiRS12o40zbZ8qCJfHHpY+y9zrkfvYpgvMi4pcdgNBGcAGeMQQiV+3Fy3eWmrRxl4iOk=
X-Received: by 2002:a5d:428c:0:b0:2c9:8a3c:9fa0 with SMTP id
 k12-20020a5d428c000000b002c98a3c9fa0mr631778wrq.3.1677864356856; Fri, 03 Mar
 2023 09:25:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <50da283fe4a91820a818d13db4ce50fd8414580a.1677079672.git.jens.wiklander@linaro.org>
 <171822A4-1150-4A35-94AD-52879B1B7EF0@arm.com>
In-Reply-To: <171822A4-1150-4A35-94AD-52879B1B7EF0@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 3 Mar 2023 18:25:46 +0100
Message-ID: <CAHUa44GLF6MFanZQwtM1u2ddo+=Kw=ZK6tSTkpcXz6EFG5ihAQ@mail.gmail.com>
Subject: Re: [XEN PATCH v7 17/20] xen/arm: ffa: add ABI structs for sharing memory
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Mar 3, 2023 at 3:20=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Adds the ABI structs used by function FFA_MEM_SHARE and friends for
> > sharing memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>
> All the structures are coherent with the spec.

Thanks for double-checking.

>
> Just one small question after but independent if you choose or not to cha=
nge the names:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> Cheers
> Bertrand
>
> > ---
> > xen/arch/arm/tee/ffa.c | 74 ++++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 74 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index bfd378f7fcd7..94c90b252454 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -197,6 +197,11 @@
> > #define FFA_MSG_SEND                    0x8400006EU
> > #define FFA_MSG_POLL                    0x8400006AU
> >
> > +/*
> > + * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
> > + * struct ending with _1_1 are defined in FF-A-1.1-REL0.
> > + */
> > +
> > /* Partition information descriptor */
> > struct ffa_partition_info_1_0 {
> >     uint16_t id;
> > @@ -211,6 +216,75 @@ struct ffa_partition_info_1_1 {
> >     uint8_t uuid[16];
> > };
> >
> > +/* Constituent memory region descriptor */
> > +struct ffa_address_range {
> > +    uint64_t address;
> > +    uint32_t page_count;
> > +    uint32_t reserved;
> > +};
> > +
> > +/* Composite memory region descriptor */
> > +struct ffa_mem_region {
> > +    uint32_t total_page_count;
> > +    uint32_t address_range_count;
> > +    uint64_t reserved;
> > +    struct ffa_address_range address_range_array[];
> > +};
> > +
> > +/* Memory access permissions descriptor */
> > +struct ffa_mem_access_perm {
> > +    uint16_t endpoint_id;
> > +    uint8_t perm;
> > +    uint8_t flags;
> > +};
> > +
> > +/* Endpoint memory access descriptor */
> > +struct ffa_mem_access {
> > +    struct ffa_mem_access_perm access_perm;
> > +    uint32_t region_offs;
> > +    uint64_t reserved;
> > +};
> > +
> > +/* Lend, donate or share memory transaction descriptor */
> > +struct ffa_mem_transaction_1_0 {
> > +    uint16_t sender_id;
> > +    uint8_t mem_reg_attr;
> > +    uint8_t reserved0;
> > +    uint32_t flags;
> > +    uint64_t global_handle;
>
> Why global ? spec is just saying handle.
>
> > +    uint64_t tag;
> > +    uint32_t reserved1;
> > +    uint32_t mem_access_count;
> > +    struct ffa_mem_access mem_access_array[];
> > +};
> > +
> > +struct ffa_mem_transaction_1_1 {
> > +    uint16_t sender_id;
> > +    uint16_t mem_reg_attr;
> > +    uint32_t flags;
> > +    uint64_t global_handle;
>
> Same here

I'll change it.

Cheers,
Jens

>
> > +    uint64_t tag;
> > +    uint32_t mem_access_size;
> > +    uint32_t mem_access_count;
> > +    uint32_t mem_access_offs;
> > +    uint8_t reserved[12];
> > +};
> > +
> > +/* Endpoint RX/TX descriptor */
> > +struct ffa_endpoint_rxtx_descriptor_1_0 {
> > +    uint16_t sender_id;
> > +    uint16_t reserved;
> > +    uint32_t rx_range_count;
> > +    uint32_t tx_range_count;
> > +};
> > +
> > +struct ffa_endpoint_rxtx_descriptor_1_1 {
> > +    uint16_t sender_id;
> > +    uint16_t reserved;
> > +    uint32_t rx_region_offs;
> > +    uint32_t tx_region_offs;
> > +};
> > +
> > struct ffa_ctx {
> >     void *rx;
> >     const void *tx;
> > --
> > 2.34.1
> >
>

