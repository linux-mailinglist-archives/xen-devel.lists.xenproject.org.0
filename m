Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C079B83DC9B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 15:43:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672058.1045696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTNQN-0003VT-VF; Fri, 26 Jan 2024 14:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672058.1045696; Fri, 26 Jan 2024 14:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTNQN-0003SZ-S0; Fri, 26 Jan 2024 14:43:19 +0000
Received: by outflank-mailman (input) for mailman id 672058;
 Fri, 26 Jan 2024 14:43:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K+M0=JE=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1rTNQM-0003Jd-6G
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 14:43:18 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d7e9ccc-bc59-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 15:43:16 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40eacb6067dso9506815e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 06:43:16 -0800 (PST)
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
X-Inumbo-ID: 3d7e9ccc-bc59-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706280196; x=1706884996; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EhLQSD7+BW8XOT2H7obLO80KK16iLrWUr/ASvWBkRuk=;
        b=OD0OCQFVmoEV/vDQe3Vh8khYLxyqnh/WoWsLmywiMzXpNZwX1wwfYxpqUCKXePAw0R
         t1aXUzYqAAwXrQ14Ppvql8XivREAopkGXukXUDNBpKPLa8rIULwdtdAtmxM4vQr53fc7
         8qYZDkix/d5rPZbHbCG0Q6omyZzG3FJC01uxxeiEjLpe5TEUEupVd+P8LSXLNMsqpDMm
         iJfAkC8xzLKioTfqINy8cXIZ8IMM64dN+RQ5Y5DvrJrPSwobZeI/MAASm2j51mASVmPb
         GPu81b5qRxpZcgYSShiXrBkgYuYbtvoYJ6x4VEKsLKNTfn5g/aI2VnPtEk2ihsWaLjgo
         Lv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706280196; x=1706884996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhLQSD7+BW8XOT2H7obLO80KK16iLrWUr/ASvWBkRuk=;
        b=MZVlDLGfEAX4yar4w3c6BFohU5VvbWznZ3NVRg/1E8zQIPcW00A9kqoSettCSSMcE0
         hAbocItiPx4HKh5EYukSaDEQlkCFI8R/RerlyxT1+ZsmP43WCDzDNKUaupjwja26EEPd
         HZiQpdm4zcYYRWv4X3l360Oa4ViMcLp+ZGl7NDEw9hj7g1KEjeCNp49u+7NReKN86dQu
         eGjfp36ABmlRV3SqQPo8c/BuCSYPSfIpfFjkDHsNwQDDcf7AXf24T8bm047EQKRzS32B
         LSHSBj+gI8YUJd6dWXa9obrM+db77ndvPcwhEK/TuAwGiZKEDCim+9+JZghkGID+wNi3
         9Y0w==
X-Gm-Message-State: AOJu0Yx7KwQurD3OlX7twOtp82RLf5gIIVGZMstFSONN9DV4cYaZ6zD2
	2zZrUdLrk1zncIvrOy1Wzy7rn4xZHZeFUJ/JWho5l85xB/mo6onXlWyr+R8ku9zSfBgJJVydL1z
	3NawhceAuXn2H9bJ1xRDKTNZOlhKFmWBZd9mpYQ==
X-Google-Smtp-Source: AGHT+IGgFYkEGapICfD+7OZIAc7B1qLYTLJlzePH6Kestx1lg5b0pP5KESins2khUNkI4Y7yAyfKuXsSzxAbztCM8KU=
X-Received: by 2002:a05:600c:1992:b0:40e:5577:189 with SMTP id
 t18-20020a05600c199200b0040e55770189mr568615wmq.147.1706280196041; Fri, 26
 Jan 2024 06:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20240108204909.564514-1-dwmw2@infradead.org> <20240108204909.564514-2-dwmw2@infradead.org>
In-Reply-To: <20240108204909.564514-2-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2024 14:43:05 +0000
Message-ID: <CAFEAcA8JtnXezmo-h-rFZcbqsN_-CnOYCTUfLfd_q=F0702U9g@mail.gmail.com>
Subject: Re: [PATCH v3 01/46] net: add qemu_{configure,create}_nic_device(), qemu_find_nic_info()
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	Beniamino Galvani <b.galvani@gmail.com>, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
	Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>, 
	Andrey Smirnov <andrew.smirnov@gmail.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	Helge Deller <deller@gmx.de>, Paolo Bonzini <pbonzini@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao <gaosong@loongson.cn>, 
	Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Jason Wang <jasowang@redhat.com>, Jia Liu <proljc@gmail.com>, 
	Stafford Horne <shorne@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Nicholas Piggin <npiggin@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, 
	qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jan 2024 at 20:49, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Most code which directly accesses nd_table[] and nb_nics uses them for
> one of two things. Either "I have created a NIC device and I'd like a
> configuration for it", or "I will create a NIC device *if* there is a
> configuration for it".  With some variants on the theme around whether
> they actually *check* if the model specified in the configuration is
> the right one.
>
> Provide functions which perform both of those, allowing platforms to
> be a little more consistent and as a step towards making nd_table[]
> and nb_nics private to the net code.
>
> Also export the qemu_find_nic_info() helper, as some platforms have
> special cases they need to handle.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>  include/net/net.h |  7 ++++++-
>  net/net.c         | 51 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index ffbd2c8d56..25ea83fd12 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -207,7 +207,12 @@ int qemu_show_nic_models(const char *arg, const char *const *models);
>  void qemu_check_nic_model(NICInfo *nd, const char *model);
>  int qemu_find_nic_model(NICInfo *nd, const char * const *models,
>                          const char *default_model);
> -
> +NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
> +                            const char *alias);
> +bool qemu_configure_nic_device(DeviceState *dev, bool match_default,
> +                               const char *alias);
> +DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
> +                                    const char *alias);

Could we have doc comments that document the purpose and API
for these new global functions, please?

thanks
-- PMM

