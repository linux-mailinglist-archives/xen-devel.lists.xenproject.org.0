Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A920C6ABA7C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 10:55:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506849.780038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ7Y4-0005Zh-9H; Mon, 06 Mar 2023 09:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506849.780038; Mon, 06 Mar 2023 09:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ7Y4-0005WZ-6Z; Mon, 06 Mar 2023 09:54:28 +0000
Received: by outflank-mailman (input) for mailman id 506849;
 Mon, 06 Mar 2023 09:54:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4jh=66=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pZ7Y2-0005WR-Lc
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 09:54:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dee2ff47-bc04-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 10:54:23 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-wlcnKIffM4iIr8V-edGNhg-1; Mon, 06 Mar 2023 04:54:18 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 u19-20020a05600c00d300b003eb24ce58ceso3356650wmm.9
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 01:54:18 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-59.web.vodafone.de.
 [109.43.177.59]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b003e1fee8baacsm13959147wmo.25.2023.03.06.01.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 01:54:17 -0800 (PST)
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
X-Inumbo-ID: dee2ff47-bc04-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678096462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/IZ1ky/xkWglsrFT/6nq1KATgbmkO5fk4nyAibCjdSg=;
	b=ZBFhxzEZKxNOIcyblu0iiAixjgHTO0tyP11/J1+j1+c1aG1gOZtO2boo8A36V8pGbaorS7
	YUoebQ4uFwicJlomnMRO5vlgxb5+47JHuzduxKxCMM4gTHRyrQvGMBUy5rtmeWD8bxUC9f
	Jt9bH3yiLdoOl+LXkpp5dc+KLklmFWI=
X-MC-Unique: wlcnKIffM4iIr8V-edGNhg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/IZ1ky/xkWglsrFT/6nq1KATgbmkO5fk4nyAibCjdSg=;
        b=XQpvZwPAyDQf1L2oegFRpZWVct8dWkXUnbpbsBsPjeUbzSnoVL0SSFf0LDGdmKw255
         kZCT1ojwdMPZeD18yaFJkM91EBN0kZoF/j53ihzPg1+NX/M8a6uaP5oo1QSsCHYgwsm/
         Pazwvhf1JrB3Sk9PCTusr3pvtBLRRF2mRobQYkM/2LwTziTnJQlM6iHUWfZqLf3TrpT7
         gJQGIOEUNnTaGZrK5nNFoIPwVpZZaC6NZr93yFBhI9wZ4zT7bLthDYUQz9sHLQ7F/0Nl
         SC4CEyOlvsIkKtj+D5eSH8aQYh8XjdONepTP79O0QcjXJYJ/GWfMrwCRJ0i3OzzGsv2i
         verQ==
X-Gm-Message-State: AO0yUKWX2pnNaipPDU+j8PRcRWnBR136BhCt6Hj7NN0MKylWReiN74Ky
	K6jaqprzC0eFDwU//M2rNUt27tPdRKdztcCDWtAYymo277nXhJSuG4/OpLAt1u8Y1K9aPF4L2NO
	+tI2+B4A5GXPX8so+xSegXtKGQOw=
X-Received: by 2002:a05:600c:4e41:b0:3ea:e7e7:a2f9 with SMTP id e1-20020a05600c4e4100b003eae7e7a2f9mr8714220wmq.13.1678096457800;
        Mon, 06 Mar 2023 01:54:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/Y5fVbS8oNQOxxEeWGw0KXRDmT9Qd7Bxg+i5j65XmudEOzjYgZkZ9OHfobAcs434dEa0zIig==
X-Received: by 2002:a05:600c:4e41:b0:3ea:e7e7:a2f9 with SMTP id e1-20020a05600c4e4100b003eae7e7a2f9mr8714198wmq.13.1678096457477;
        Mon, 06 Mar 2023 01:54:17 -0800 (PST)
Message-ID: <e5a86d76-03af-6da9-a8ee-da4a494e0e23@redhat.com>
Date: Mon, 6 Mar 2023 10:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com> <ZAWx5eBskd1cItDx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZAWx5eBskd1cItDx@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/03/2023 10.27, Daniel P. Berrangé wrote:
> On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
>> Aside from not supporting KVM on 32-bit hosts, the qemu-system-x86_64
>> binary is a proper superset of the qemu-system-i386 binary. With the
>> 32-bit host support being deprecated, it is now also possible to
>> deprecate the qemu-system-i386 binary.
>>
>> With regards to 32-bit KVM support in the x86 Linux kernel,
>> the developers confirmed that they do not need a recent
>> qemu-system-i386 binary here:
>>
>>   https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 1ca9dc33d6..c4fcc6b33c 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -34,6 +34,20 @@ deprecating the build option and no longer defend it in CI. The
>>   ``--enable-gcov`` build option remains for analysis test case
>>   coverage.
>>   
>> +``qemu-system-i386`` binary (since 8.0)
>> +'''''''''''''''''''''''''''''''''''''''
>> +
>> +The ``qemu-system-i386`` binary was mainly useful for running with KVM
>> +on 32-bit x86 hosts, but most Linux distributions already removed their
>> +support for 32-bit x86 kernels, so hardly anybody still needs this. The
>> +``qemu-system-x86_64`` binary is a proper superset and can be used to
>> +run 32-bit guests by selecting a 32-bit CPU model, including KVM support
>> +on x86_64 hosts. Thus users are recommended to reconfigure their systems
>> +to use the ``qemu-system-x86_64`` binary instead. If a 32-bit CPU guest
>> +environment should be enforced, you can switch off the "long mode" CPU
>> +flag, e.g. with ``-cpu max,lm=off``.
> 
> I had the idea to check this today and this is not quite sufficient,
> because we have code that changes the family/model/stepping for
> 'max' which is target dependent:
> 
> #ifdef TARGET_X86_64
>      object_property_set_int(OBJECT(cpu), "family", 15, &error_abort);
>      object_property_set_int(OBJECT(cpu), "model", 107, &error_abort);
>      object_property_set_int(OBJECT(cpu), "stepping", 1, &error_abort);
> #else
>      object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
>      object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
>      object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
> #endif
> 
> The former is a 64-bit AMD model and the latter is a 32-bit model.
> 
> Seems LLVM was sensitive to this distinction to some extent:
> 
>     https://gitlab.com/qemu-project/qemu/-/issues/191
> 
> A further difference is that qemy-system-i686 does not appear to enable
> the 'syscall' flag, but I've not figured out where that difference is
> coming from in the code.

Ugh, ok. I gave it a quick try with a patch like this:

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4344,15 +4344,15 @@ static void max_x86_cpu_initfn(Object *obj)
       */
      object_property_set_str(OBJECT(cpu), "vendor", CPUID_VENDOR_AMD,
                              &error_abort);
-#ifdef TARGET_X86_64
-    object_property_set_int(OBJECT(cpu), "family", 15, &error_abort);
-    object_property_set_int(OBJECT(cpu), "model", 107, &error_abort);
-    object_property_set_int(OBJECT(cpu), "stepping", 1, &error_abort);
-#else
-    object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
-    object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
-    object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
-#endif
+    if (object_property_get_bool(obj, "lm", &error_abort)) {
+        object_property_set_int(obj, "family", 15, &error_abort);
+        object_property_set_int(obj, "model", 107, &error_abort);
+        object_property_set_int(obj, "stepping", 1, &error_abort);
+    } else {
+        object_property_set_int(obj, "family", 6, &error_abort);
+        object_property_set_int(obj, "model", 6, &error_abort);
+        object_property_set_int(obj, "stepping", 3, &error_abort);
+    }
      object_property_set_str(OBJECT(cpu), "model-id",
                              "QEMU TCG CPU version " QEMU_HW_VERSION,
                              &error_abort);

... but it seems like the "lm" property is not initialized
there yet, so this does not work... :-/

Giving that we have soft-freeze tomorrow, let's ignore this patch
for now and revisit this topic during the 8.1 cycle. But I'll
queue the other 4 patches to get some pressure out of our CI
during the freeze time.

  Thomas


