Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95108D4946
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 12:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732618.1138619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCcgw-0001Wy-7U; Thu, 30 May 2024 10:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732618.1138619; Thu, 30 May 2024 10:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCcgw-0001VC-4c; Thu, 30 May 2024 10:07:26 +0000
Received: by outflank-mailman (input) for mailman id 732618;
 Thu, 30 May 2024 10:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MghO=NB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCcgu-0001V1-O0
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 10:07:24 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 675e577b-1e6c-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 12:07:21 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42121d27861so7038525e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 03:07:21 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421270ad931sm20198485e9.47.2024.05.30.03.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 03:07:20 -0700 (PDT)
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
X-Inumbo-ID: 675e577b-1e6c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717063641; x=1717668441; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2qgRoi1UruKHEcIoyHWg6Le1Z1y6p+xfsDeU7FtjGEE=;
        b=KrS/s1ddaZ7P/D5EJbVO7P/hJyrM5tguxKQaz3cRX4X88J6phxSeIefTyH7gm09i9k
         yPBZPy75frIskXYtetvq3rLRDNMBBHf0SGfsmnrNwiy2gEUXM5IoQ+TocdZhgs9YQRTy
         +xViD8Zpm5YuSdGf17Gio4zqcTK5QusGF/lcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717063641; x=1717668441;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2qgRoi1UruKHEcIoyHWg6Le1Z1y6p+xfsDeU7FtjGEE=;
        b=sdeVKXWzxtk5shTvzto9kPXFeN22bg6hMk2RywV9PrzddW1mFeWalHSVO9dTkJg95/
         iOYD8OgBzdqLePZjE18WalRRT8dqFp5Syql6OI7mot/jY7cPzmjxKJLAahlErneWqyfv
         GWGkHmGOXLGgS169q2bUk2hIW1xw9s738V4EoQaMThlUuebVVxciDYo8D8/6lRfglOao
         Y4LscbDYx923EMy8BPTtL2FOG6oY5xdvnyZC21u4U9FvnA4RMifd8muq6AOk9q+/W/wC
         JNPAEPmkYBBPVMNqKASaApu933q+LXpOPwmPYgJ0fD/hVxMbW7RLoCQZHJddOjHrS4cm
         si+Q==
X-Gm-Message-State: AOJu0YyMbIbk3KrHRHOAqwNkimCu8xxd/kOJdvLYCpCMKAOY751uoFrB
	jGU+Fl+zJyiVIp/L78QdZqb9Q6QHHHuwhRigILDqvDX7uDcZSlw5aEBTVAIM4BU=
X-Google-Smtp-Source: AGHT+IFBD9Zjdf7eZFhoxfP6yz58jrTNxhhlpIfXv3Vc/WBsCcal9SFYt3KOi3Y2iTNj6JonFGaoIA==
X-Received: by 2002:a05:600c:4f8f:b0:418:f991:713f with SMTP id 5b1f17b1804b1-4212781b9bbmr17113555e9.23.1717063640612;
        Thu, 30 May 2024 03:07:20 -0700 (PDT)
Date: Thu, 30 May 2024 12:07:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/6] x86/vlapic: Move lapic migration checks to the
 check hooks
Message-ID: <ZlhP11Vvk6c1Ix36@macbook>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
 <f87f27de6fadf896bf4d50c8a37e2b9b7201afb2.1716976271.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f87f27de6fadf896bf4d50c8a37e2b9b7201afb2.1716976271.git.alejandro.vallejo@cloud.com>

On Wed, May 29, 2024 at 03:32:30PM +0100, Alejandro Vallejo wrote:
> While doing this, factor out checks common to architectural and hidden state.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Roger PAu Monné <roger.pau@citrix.com>

With the BUG() possibly replaced with ASSERT_UNREACHABLE(),

> ---
> v3:
>   * Moved from v2/patch3.
>   * Added check hook for the architectural state as well.
>   * Use domain_vcpu() rather than the previous open coded checks for vcpu range.
> ---
>  xen/arch/x86/hvm/vlapic.c | 81 +++++++++++++++++++++++++--------------
>  1 file changed, 53 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 9cfc82666ae5..a0df62b5ec0a 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1553,60 +1553,85 @@ static void lapic_load_fixup(struct vlapic *vlapic)
>                 v, vlapic->loaded.id, vlapic->loaded.ldr, good_ldr);
>  }
>  
> -static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> -{
> -    unsigned int vcpuid = hvm_load_instance(h);
> -    struct vcpu *v;
> -    struct vlapic *s;
>  
> +static int lapic_check_common(const struct domain *d, unsigned int vcpuid)
> +{
>      if ( !has_vlapic(d) )
>          return -ENODEV;
>  
>      /* Which vlapic to load? */
> -    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
> +    if ( !domain_vcpu(d, vcpuid) )
>      {
>          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no apic%u\n",
>                  d->domain_id, vcpuid);

The message here is kind of misleading as printing apic%u makes it
look like it's an APIC ID, but it's a vCPU ID.  It would be best to
just print: "HVM restore: dom%d has no vCPU %u\n".

>          return -EINVAL;
>      }
> -    s = vcpu_vlapic(v);
>  
> -    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
> +    return 0;
> +}
> +
> +static int cf_check lapic_check_hidden(const struct domain *d,
> +                                       hvm_domain_context_t *h)
> +{
> +    unsigned int vcpuid = hvm_load_instance(h);
> +    struct hvm_hw_lapic s;
> +    int rc;
> +
> +    if ( (rc = lapic_check_common(d, vcpuid)) )
> +        return rc;

Nit: I don't like much to assign values inside of conditions, I would
rather do:

int rc = lapic_check_common(d, vcpuid);

if ( rc )
    return rc;

> +
> +    if ( hvm_load_entry_zeroextend(LAPIC, h, &s) != 0 )
> +        return -ENODATA;
> +
> +    /* EN=0 with EXTD=1 is illegal */
> +    if ( (s.apic_base_msr & (APIC_BASE_ENABLE | APIC_BASE_EXTD)) ==
> +         APIC_BASE_EXTD )
>          return -EINVAL;
>  
> +    return 0;
> +}
> +
> +static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> +{
> +    unsigned int vcpuid = hvm_load_instance(h);
> +    struct vcpu *v = d->vcpu[vcpuid];

Not sure whether it's worth using domain_vcpu() here.  We have already
checked the vCPU is valid.

> +    struct vlapic *s = vcpu_vlapic(v);
> +
> +    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
> +        BUG();

I would use { ASSERT_UNREACHABLE(); return -EINVAL; } here, there's
IMO no strict reason to panic on non-debug builds.

Thanks, Roger.

