Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3C0B381DE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 14:02:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095965.1450793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urEq2-0007JO-3g; Wed, 27 Aug 2025 12:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095965.1450793; Wed, 27 Aug 2025 12:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urEq2-0007GX-0j; Wed, 27 Aug 2025 12:01:14 +0000
Received: by outflank-mailman (input) for mailman id 1095965;
 Wed, 27 Aug 2025 12:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BCET=3H=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1urEq0-0007GR-DS
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 12:01:12 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85066dd2-833d-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 14:01:10 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-55f3533fd05so4904799e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 05:01:09 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f528ce570sm499049e87.120.2025.08.27.05.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 05:01:07 -0700 (PDT)
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
X-Inumbo-ID: 85066dd2-833d-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756296069; x=1756900869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77JM2ztekbvnP3zJEWNM77vZoV+sSOiR3cC5kFPo0Rw=;
        b=kpfRb45+A8LcAtygafSQ+sh2sHLyNIb8NXNy8gbm21trs/ZuZJQerfXid5gUlAls7t
         Zx7pnKQy7rfFL325xJx5Ai2R9HWYrLQMse0fosXWZgMrubfpIS1TYSsQ3laIhgFC+r+9
         KkHK0+cFQXvbvmD2egLOH4XjM55O13WTm1fD662sRKJXLbtCHQAyhCVf+mLcYV5IkmgT
         69DNtbtNJIk+c+cRpxa7cJXOzxgKTIArPn9yfemhvK+zdbkEvETDavncXKUUHECS6b72
         1iY1v0sJhTFvHRq9T2BPdxfuGsNv7ubgCsZ/Q2ZfXUdqRXrCtX/FBe9T/uJWAzP97wtp
         Ecsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756296069; x=1756900869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77JM2ztekbvnP3zJEWNM77vZoV+sSOiR3cC5kFPo0Rw=;
        b=eDPgLrRpLQSRYCZm5+1sHtNlvYRw+nOS1kLMivLDtc06Yuld+PeKCSMouetbpyQ8QL
         EzMpdyihiD2Lzn+a+iMBKdK88G9XiLx9Sh9VHKDx0utctIVa36Ji0UHDBLAayic1Nwoa
         LNq5fdQ4cvemdr8zEIrQtAcsNCzFkHZzCDtRgFlRgidnE5T0w4mpLtgno1ehx343jMoO
         QPJ10uA1x42wPIf8gnuix1XPJzhQrAi3sM/MP6O9JlsAXSJReoeZRp0GQhr08pMudzx/
         iY9RGKQvFNWQKhoKd7b8PTZzmT7F2nEsUEIGaVuiO14WSRZMiuGBEs1/C5l0BH1ZVewV
         1Tog==
X-Gm-Message-State: AOJu0YzGWZR2unDFYrc+omcxZJOwAbVYKWMisxbxxvIaIrEXs00iwXee
	jHYtQXl5MhOTaq2bJsbR82LhMvYPdhEv9dNlh3Keefin+4Bv0eMVMCslI8ulPA==
X-Gm-Gg: ASbGncv0qCaMRjPxE3HacCrFCbO42IA82AQYCWdm/XwvmwXF2c/9fVXR0TP2C/9lrpJ
	m541YUwA3E1BmIN4uzwtDRw5+eb4Ocm2xi2waG/HL0e+g0qzVfIm2kbvV5vbaRdotiLnpN7Zgmz
	HsRbo4rQcsjdDiebzj7orOK+3sidMg9q71+9ZQhYbkzq6P6swuPBFHpGj82bQgDp/FXZWE3LBIH
	iEFyzog2cNqwlnaxA9icrLFj86N7UtZx7c3AmtRkvLM+F/suF1Li5MJCGRS0qGkZtz08Oa5DJOt
	RaANs2UGYDVt20MxrnfB/hHC48+k6WEhAy5y5OnSm93nmHZulXyFdprDJhsly5V7G803m2MApo4
	DvzyeB4CQw4JT1SYs4MTTgEQeVg==
X-Google-Smtp-Source: AGHT+IHVyYWQb5405VT2roIsRpsyDu9GMnfjdYYD9hee1lYT0NVSSSId6UXqwbNYkqHmUHC5o1Nstg==
X-Received: by 2002:a05:6512:6410:b0:55c:aca3:dd31 with SMTP id 2adb3069b0e04-55f0c6a0cb4mr5202222e87.12.1756296068564;
        Wed, 27 Aug 2025 05:01:08 -0700 (PDT)
Message-ID: <a230ad6c-294d-488f-ac2e-6fc3a7cf33fc@gmail.com>
Date: Wed, 27 Aug 2025 15:01:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/11] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
 <bff3d1c4302e8780771abed42f624cafe76776cd.1756216943.git.leonid_komarianskyi@epam.com>
 <874itt4r5t.fsf@epam.com> <1cf0a662-b717-458c-8174-6b03187b4b6c@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <1cf0a662-b717-458c-8174-6b03187b4b6c@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27.08.25 13:25, Leonid Komarianskyi wrote:

Hello Leonid

> Hello Volodymyr,
> 
> Thank you for your suggestion.
> 
> On 27.08.25 02:08, Volodymyr Babchuk wrote:
>> Hi Leonid,
>>
>> Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:
>>
>>> The Dom0 and DomUs logic for the dom0less configuration in create_dom0()
>>> and arch_create_domUs() has been updated to account for extended SPIs
>>> when supported by the hardware and enabled with CONFIG_GICV3_ESPI. These
>>> changes ensure the proper calculation of the maximum number of SPIs and
>>> eSPIs available to Dom0 and DomUs in dom0less setups.
>>>
>>> When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is
>>> enabled, the maximum number of eSPI interrupts is calculated using the
>>> ESPI_BASE_INTID offset (4096) and is limited to 1024, with 32 IRQs
>>> subtracted. To ensure compatibility with DomUs (Dom0 setups) domains,
>>> where this adjustment is applied by the toolstack during domain
>>> creation, while for Dom0 or DomUs in Dom0, it is handled directly during
>>> VGIC initialization. If eSPIs are not supported, the calculation
>>> defaults to using the standard SPI range, with a maximum value of
>>> 960 interrupt lines, as it works currently.
>>>
>>> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>>>
>>> ---
>>> Changes in V2:
>>> - no changes
>>>
>>> Changes in V3:
>>> - renamed macro VGIC_DEF_NR_ESPIS to more appropriate VGIC_DEF_MAX_SPI
>>
>> Will VGIC_DEF_MAX_ESPI be better? When other code refer to "SPI" it mean
>> "common SPI" (less than 1022), while ESPI is used for extended SPI. So,
>> naturally it feels that VGIC_DEF_MAX_SPI should be equal to 1022...
>>
> 
> Yes, I agree with that - VGIC_DEF_MAX_ESPI sounds more appropriate in
> this case. I will rename it in V4.
> 
>>> - added eSPI initialization for dom0less setups
>>> - fixed comment with mentions about dom0less builds
>>> - fixed formatting for lines with more than 80 symbols
>>> - updated commit message
>>> ---
>>>    xen/arch/arm/dom0less-build.c   | 12 ++++++++++++
>>>    xen/arch/arm/domain_build.c     | 11 +++++++++++
>>>    xen/arch/arm/include/asm/vgic.h | 14 ++++++++++++++
>>>    3 files changed, 37 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>>> index 69b9ea22ce..f4f9077db5 100644
>>> --- a/xen/arch/arm/dom0less-build.c
>>> +++ b/xen/arch/arm/dom0less-build.c
>>> @@ -286,6 +286,18 @@ void __init arch_create_domUs(struct dt_device_node *node,
>>>            int vpl011_virq = GUEST_VPL011_SPI;
>>>    
>>>            d_cfg->arch.nr_spis = VGIC_DEF_NR_SPIS;
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +        /*
>>> +         * Check if the hardware supports extended SPIs (even if the
>>> +         * appropriate config is set). If not, the common SPI range
>>> +         * will be used. Otherwise overwrite the nr_spis with the maximum
>>> +         * available INTID from eSPI range. In that case, the number of
>>> +         * regular SPIs will be adjusted to the maximum value during vGIC
>>> +         * initialization.
>>> +         */
>>> +        if ( gic_number_espis() > 0 )
>>> +            d_cfg->arch.nr_spis = VGIC_DEF_MAX_SPI;
>>> +#endif
>>>    
>>>            /*
>>>             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index d91a71acfd..148a8bdb60 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -2055,6 +2055,17 @@ void __init create_dom0(void)
>>>        /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>>>        dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>>>        dom0_cfg.arch.nr_spis = VGIC_DEF_NR_SPIS;
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +    /*
>>> +     * Check if the hardware supports extended SPIs (even if the appropriate
>>> +     * config is set). If not, the common SPI range will be used. Otherwise
>>> +     * overwrite the nr_spis with the maximum available INTID from eSPI range.
>>> +     * In that case, the number of regular SPIs will be adjusted to the maximum
>>> +     * value during vGIC initialization.
>>> +     */
>>> +    if ( gic_number_espis() > 0 )
>>> +        dom0_cfg.arch.nr_spis = VGIC_DEF_MAX_SPI;
>>> +#endif

So we have almost (?) identical code and big comments in both 
create_dom0() and arch_create_domUs().

I was thinking, wouldn't it be better if we put this into a helper? This 
way, I think, we will reduce the number of GICv3-specific #ifdef-s in 
common domain construction code and will not need to worry about keeping 
these places in sync when updating the check/comment.

Something like below to be applied on top of your patch (not build-tested):

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index f4f9077db5..02d5559102 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -285,19 +285,7 @@ void __init arch_create_domUs(struct dt_device_node 
*node,
      {
          int vpl011_virq = GUEST_VPL011_SPI;

-        d_cfg->arch.nr_spis = VGIC_DEF_NR_SPIS;
-#ifdef CONFIG_GICV3_ESPI
-        /*
-         * Check if the hardware supports extended SPIs (even if the
-         * appropriate config is set). If not, the common SPI range
-         * will be used. Otherwise overwrite the nr_spis with the maximum
-         * available INTID from eSPI range. In that case, the number of
-         * regular SPIs will be adjusted to the maximum value during vGIC
-         * initialization.
-         */
-        if ( gic_number_espis() > 0 )
-            d_cfg->arch.nr_spis = VGIC_DEF_MAX_SPI;
-#endif
+        d_cfg->arch.nr_spis = vgic_def_nr_spis();

          /*
           * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 148a8bdb60..39eea0be00 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2054,18 +2054,7 @@ void __init create_dom0(void)

      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
      dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
-    dom0_cfg.arch.nr_spis = VGIC_DEF_NR_SPIS;
-#ifdef CONFIG_GICV3_ESPI
-    /*
-     * Check if the hardware supports extended SPIs (even if the 
appropriate
-     * config is set). If not, the common SPI range will be used. Otherwise
-     * overwrite the nr_spis with the maximum available INTID from eSPI 
range.
-     * In that case, the number of regular SPIs will be adjusted to the 
maximum
-     * value during vGIC initialization.
-     */
-    if ( gic_number_espis() > 0 )
-        dom0_cfg.arch.nr_spis = VGIC_DEF_MAX_SPI;
-#endif
+    dom0_cfg.arch.nr_spis = vgic_def_nr_spis();
      dom0_cfg.arch.tee_type = tee_get_type();
      dom0_cfg.max_vcpus = dom0_max_vcpus();

diff --git a/xen/arch/arm/include/asm/vgic.h 
b/xen/arch/arm/include/asm/vgic.h
index 0bb025f5d5..0350122a74 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -367,6 +367,24 @@ extern void vgic_check_inflight_irqs_pending(struct 
vcpu *v,
                            min(gic_number_espis(), 1024U) - 32)
  #endif

+static inline unsigned int vgic_def_nr_spis(void)
+{
+#ifdef CONFIG_GICV3_ESPI
+    /*
+     * Check if the hardware supports extended SPIs (even if the
+     * appropriate config is set). If not, the common SPI range
+     * will be used. Otherwise overwrite the nr_spis with the maximum
+     * available INTID from eSPI range. In that case, the number of
+     * regular SPIs will be adjusted to the maximum value during vGIC
+     * initialization.
+     */
+    if ( gic_number_espis() > 0 )
+        return VGIC_DEF_MAX_SPI;
+#endif
+
+    return VGIC_DEF_NR_SPIS;
+}
+
  extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);

  static inline bool vgic_is_spi(struct domain *d, unsigned int virq)

******

Also, if VGIC_DEF_MAX_SPI (or whatever name you agreed on) is not 
supposed to be used outside of vgic.h, I would even consider dropping it
and using "ESPI_BASE_INTID + min(gic_number_espis(), 1024U) - 32" (to 
reduce one more #ifdef in the header).


P.S. I might be wrong, but it feels to me, that description for 
"nr_spis" in docs/man/xl.cfg.5.pod.in needs a update within your series 
(it mentions that "Max is 960 SPIs").

