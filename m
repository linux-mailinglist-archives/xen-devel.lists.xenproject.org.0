Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47557D8191
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 13:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623707.971803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyGJ-00019V-Ih; Thu, 26 Oct 2023 11:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623707.971803; Thu, 26 Oct 2023 11:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyGJ-00016b-FG; Thu, 26 Oct 2023 11:10:51 +0000
Received: by outflank-mailman (input) for mailman id 623707;
 Thu, 26 Oct 2023 11:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ziZY=GI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qvyGH-00016V-VM
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 11:10:50 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 509babe9-73f0-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 13:10:47 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53e08b60febso1111587a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Oct 2023 04:10:47 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m21-20020a509315000000b0053db1ca293asm11255541eda.19.2023.10.26.04.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 04:10:46 -0700 (PDT)
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
X-Inumbo-ID: 509babe9-73f0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698318647; x=1698923447; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Op1P72r2jBgqKancn4QRMMmpfEjGN//e8mAVY6RS1EA=;
        b=iHyp/kT2OMK574A1L7BrYxdpWekHLoEI0klwY2aVQF3lwK8G81FssEHsLbKX5bgzZ6
         EVuXx571N/v0WSpa9Lz0tzNVANcxjjO+cIRsTTNHDwVY76p6zMIx9TQuZJctIRhSkarL
         dSFGO7wKtadWeC51x1RW2n2CDSk2ioEgIACFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698318647; x=1698923447;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Op1P72r2jBgqKancn4QRMMmpfEjGN//e8mAVY6RS1EA=;
        b=WVeZIV7cg4nwx2Xqk+DhLafLsVwQBb66aWg/vOpNdjxEvFc/0FUOnN5p/iof2D8EcG
         vCqaRePaAzTvpDxvCc3OrM8GWHa8YerEnaYxQzUddlGHYkBuReLjsHJVfGZfdd1wIzmJ
         L2WwdE93KY/rVeRzkhpzl7QOTvxlJP6d2OI/KEyN66vYf3h4isHjHp511hdoTzz5NCln
         ltB/d49AX728VXdEtmzNwDD3HCKEYOo/s1uiOIsIsSM6ACEcrk27xHWzPREimizkiTbv
         CEoDGdq4XrT3p2uF1eKFAaCWC4KlOIr80lhr9L1OYP52aOA++eRvv2yinQGunipsAlrM
         eYvw==
X-Gm-Message-State: AOJu0YwEtw32bkZJO+cxLyDLVf/gxnoChkzvsZ/piOr1XPfew9+fVLjk
	ifeYIOiI+IMeVHxo+UcwZk6phA==
X-Google-Smtp-Source: AGHT+IFRpK0VZydHtX5RqHQzB+nQDoXUjSdHjJuH36VZKmqp+KSv1FvfEdcuWEUtWylMS7xyUNe8tg==
X-Received: by 2002:a05:6402:520e:b0:53e:7ae7:bc5e with SMTP id s14-20020a056402520e00b0053e7ae7bc5emr13843133edd.3.1698318647197;
        Thu, 26 Oct 2023 04:10:47 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------10T0lS51W3Nc0Du3Z5dOq6L3"
Message-ID: <0d67d2c6-1841-4771-9e6e-1a6463c0b443@citrix.com>
Date: Thu, 26 Oct 2023 12:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231025180630.3230010-1-andrew.cooper3@citrix.com>
 <20231025180630.3230010-3-andrew.cooper3@citrix.com>
 <85cddaeb-6b75-2f53-940e-0b06396fd1bb@suse.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <85cddaeb-6b75-2f53-940e-0b06396fd1bb@suse.com>

This is a multi-part message in MIME format.
--------------10T0lS51W3Nc0Du3Z5dOq6L3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/10/2023 8:55 am, Jan Beulich wrote:
> On 25.10.2023 20:06, Andrew Cooper wrote:
>> We eventually want to be able to build a stripped down Xen for a single
>> platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
>> available to randconfig), and adjust the microcode logic.
> Linux uses different names for the Kconfig symbols. While I'm unconvinced
> of the SUP part, I wonder whether we wouldn't better use CPU in the names.

I don't see what that gets us, other than a longer name.

> One immediate question here is how the IOMMU interaction is intended to
> end up: Do we want to permit either vendor's CPUs with the other vendor's
> IOMMUs to be usable?

From a randconfig point of view, yes.  These options are only targetting
a specific platform, and we can absolutely make that the end user's
responsibility to describe their platform correctly.


The more interesting question is perhaps VT-x and SVM, given that VIA
have shipped VT-x and Hygon have shipped SVM and AMD-Vi.

I do specifically want to to integrate the HVM setup better with CPU
init - KVM dropped an enormous amount of complexity by doing this - but
I expect we'll end up with VTX and SVM options rather than using
INTEL/AMD for this.

There is a bit of linkage between EPT/VT-d and NPT/AMD-Vi (in principle
at least) in the form of HAP/IOMMU pagetable sharing, but as it's "just"
an exchange of superpage sizes, iommu-pt pointer and height, I think we
can make an abstraction which doesn't force a vendor match.
>> --- /dev/null
>> +++ b/xen/arch/x86/Kconfig.cpu
>> @@ -0,0 +1,22 @@
>> +menu "Supported processor vendors"
>> +	visible if EXPERT
>> +
>> +config AMD
>> +	bool "AMD"
>> +        default y
>> +        help
>> +          Detection, tunings and quirks for AMD processors.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on AMD processors.
>> +
>> +config INTEL
>> +	bool "Intel"
>> +        default y
>> +        help
>> +          Detection, tunings and quirks for Intel processors.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on Intel processors.
>> +
>> +endmenu
> Nit: Throughout this hunk there's an inconsistency with indentation
> (hard tabs not used in some places where they ought to be).

Oh yes, that's unintended.

> Also, depending on the verdict on the aspect mentioned at the top,
> "processors" may want replacing by "systems" or "platforms" or some
> such if we mean these to cover more than just the CPUs.

I really don't want to use CPU because that term is overloaded enough
already.  Maybe it's ok in the overall menu text, but "plaform/system
vendor" would be the OEMs rather than the processor vendors.

We do have various platform quirks in Xen, but they're almost all DMI or
PCI based, rather than vendor based.

I could be persuaded to use CPU in the menu, and s/processors/platforms/
elsewhere.

~Andrew
--------------10T0lS51W3Nc0Du3Z5dOq6L3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 26/10/2023 8:55 am, Jan Beulich
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:85cddaeb-6b75-2f53-940e-0b06396fd1bb@suse.com">
      <pre class="moz-quote-pre" wrap="">On 25.10.2023 20:06, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">We eventually want to be able to build a stripped down Xen for a single
platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
available to randconfig), and adjust the microcode logic.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Linux uses different names for the Kconfig symbols. While I'm unconvinced
of the SUP part, I wonder whether we wouldn't better use CPU in the names.</pre>
    </blockquote>
    <br>
    I don't see what that gets us, other than a longer name.<br>
    <br>
    <blockquote type="cite"
      cite="mid:85cddaeb-6b75-2f53-940e-0b06396fd1bb@suse.com">
      <pre class="moz-quote-pre" wrap="">One immediate question here is how the IOMMU interaction is intended to
end up: Do we want to permit either vendor's CPUs with the other vendor's
IOMMUs to be usable?</pre>
    </blockquote>
    <br>
    From a randconfig point of view, yes.  These options are only
    targetting a specific platform, and we can absolutely make that the
    end user's responsibility to describe their platform correctly.<br>
    <br>
    <br>
    The more interesting question is perhaps VT-x and SVM, given that
    VIA have shipped VT-x and Hygon have shipped SVM and AMD-Vi.<br>
    <br>
    I do specifically want to to integrate the HVM setup better with CPU
    init - KVM dropped an enormous amount of complexity by doing this -
    but I expect we'll end up with VTX and SVM options rather than using
    INTEL/AMD for this.<br>
    <br>
    There is a bit of linkage between EPT/VT-d and NPT/AMD-Vi (in
    principle at least) in the form of HAP/IOMMU pagetable sharing, but
    as it's "just" an exchange of superpage sizes, iommu-pt pointer and
    height, I think we can make an abstraction which doesn't force a
    vendor match.<br>
    <span style="white-space: pre-wrap">

</span>
    <blockquote type="cite"
      cite="mid:85cddaeb-6b75-2f53-940e-0b06396fd1bb@suse.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- /dev/null
+++ b/xen/arch/x86/Kconfig.cpu
@@ -0,0 +1,22 @@
+menu "Supported processor vendors"
+	visible if EXPERT
+
+config AMD
+	bool "AMD"
+        default y
+        help
+          Detection, tunings and quirks for AMD processors.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on AMD processors.
+
+config INTEL
+	bool "Intel"
+        default y
+        help
+          Detection, tunings and quirks for Intel processors.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on Intel processors.
+
+endmenu
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Nit: Throughout this hunk there's an inconsistency with indentation
(hard tabs not used in some places where they ought to be).</pre>
    </blockquote>
    <br>
    Oh yes, that's unintended.<br>
    <br>
    <blockquote type="cite"
      cite="mid:85cddaeb-6b75-2f53-940e-0b06396fd1bb@suse.com">
      <pre class="moz-quote-pre" wrap="">Also, depending on the verdict on the aspect mentioned at the top,
"processors" may want replacing by "systems" or "platforms" or some
such if we mean these to cover more than just the CPUs.</pre>
    </blockquote>
    <br>
    I really don't want to use CPU because that term is overloaded
    enough already.  Maybe it's ok in the overall menu text, but
    "plaform/system vendor" would be the OEMs rather than the processor
    vendors.<br>
    <br>
    We do have various platform quirks in Xen, but they're almost all
    DMI or PCI based, rather than vendor based.<br>
    <br>
    I could be persuaded to use CPU in the menu, and
    s/processors/platforms/ elsewhere.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------10T0lS51W3Nc0Du3Z5dOq6L3--

