Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101D3BABCF6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 09:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133787.1471849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Ujg-0005Ny-5H; Tue, 30 Sep 2025 07:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133787.1471849; Tue, 30 Sep 2025 07:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Ujg-0005LW-13; Tue, 30 Sep 2025 07:25:20 +0000
Received: by outflank-mailman (input) for mailman id 1133787;
 Tue, 30 Sep 2025 07:25:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Uje-0005KE-Ao
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 07:25:18 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d4e9eb8-9dce-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 09:25:17 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3f0134ccc0cso3772947f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 00:25:17 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602f15sm21415396f8f.39.2025.09.30.00.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 00:25:16 -0700 (PDT)
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
X-Inumbo-ID: 9d4e9eb8-9dce-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759217117; x=1759821917; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXfoHJKzAEoZlm7EIBN8HZ0wCcnvYyoGTCHOMSnDlqg=;
        b=Pb0tDXA0Q3Zo+SI4fhbQ9aLJS2kRIBODKtmt1idn2d8s5SEf+F/m5A3w6HZRBAOoC4
         qNicizJj+aHYkuRAhvmRBaInzU3vlIoCavXKSRjlMBp+8xesBa8zJTYDzCR/nMgRguir
         ca6gHApPS0F/WkeIcj9UG8klyYvwg8A4icRGF8Pkubjc7wUBdhO1MVC3ToqCTIV9ZtFW
         w6MQ73S3cjQZ2uYSMnlvZXACXL7PDK7AVjWJjR0bnVZFDsES44tbqRyKiPx3bAHBokTf
         uyc7Ui4dogyTBIagMY/LW+aaHUxU457xcWgqj9kQs1SokJaekbXUAefYXWXYPz+brA13
         E60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759217117; x=1759821917;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXfoHJKzAEoZlm7EIBN8HZ0wCcnvYyoGTCHOMSnDlqg=;
        b=EePaaKLdbJMY9u5ubqzVPDOvdI6Dp9kZm04SwvCxHbVXtFOP+P5eCz91T+o1vvgY/d
         4e3BbnfbB7/P4YSDyDX1iadm/x+psr133n/izBdCa23pLDcHEf/eA9KurhDX2s7C4ZTf
         pQekX2kAnM+mS+ycOObMXpvIQbp2aSxTf0YJdyg+CQxz2Yb2gqZJMw0df9+r3R9GTy2S
         a79AF7LM71nYY0SDq1opbZ6eOr74nxMrJcm6yqn9khXAgEDVpbURvyX2BQYoA4SdXAm5
         n+P6S+NtXyLr4t0sJTpIa0Ta1wCAmHZ/lpzKeTKNdk+xxMKcflkmXY5Qun2uutxTqPvp
         gcog==
X-Forwarded-Encrypted: i=1; AJvYcCWPTjZ31qkCdKKe4V47M8jBV2Gc9rTJmf8BeLSbKHVlaWAHL1luBZN0RTfXBN4UWMynPUcfGHOHl94=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdCHsOyjvkvtN8gTQ1Ido0SuZ50Vp1A9xEBRfV+eGoO/t/AECB
	8yiJuHm/l51e4Nfjrb3SsQrIQ58TO/IrbLTuy4dfLStkp3+kEJvPJy90itaoXJbyWiU=
X-Gm-Gg: ASbGncuYikutFv4Xvruw8fZ/m6XMnT+En7JIVQg8Q/gdCevgd0hKk/wlyFbl5GwhxtG
	gITg+ZVBsCX80WTiZUrd0yXl11znf9pvpGHQzOOHB8mO2INrq0IAJuPvZ1WKMIfZfkjoNi99YHs
	PIZDvQnUxnDzH2bv5cMfKCl8ZS/NS9nfhcRe7RfhanzVR1Itx62E0R7Pw8dMJD/ywhjvuLhSmSh
	Cnf0S4F2GM135Fo5JtDnWiCF1pXPKCkxYpIa+SQGTJuztA0rz+drqS0kwlUKdtzOZiMnIvYtihZ
	jqeR8jdZk9UYGpl9YlxFYi+OOu+1IvzpnfXbQt3Y4SkSVJZplsaGZ0hgoVJDg0jM4R6XQWjtDLP
	NNip7PO3UB28t/au+imaYE7U59hXQo8r9InG5PtsX8SWShsn7UsXS0urgOZMPF1+vyxREJBjUgp
	HBsRr/h9SO5S4yJkcCZ1VM/4/6
X-Google-Smtp-Source: AGHT+IEGShYXZImSoJS6MrCCwqqS6lghItgATnZgdwGJCwRUeVTX2I6q+QeiUjF2A7MJ30GqrUAwEw==
X-Received: by 2002:adf:e646:0:b0:415:b650:a775 with SMTP id ffacd0b85a97d-415b650aca7mr8753025f8f.0.1759217116998;
        Tue, 30 Sep 2025 00:25:16 -0700 (PDT)
Message-ID: <04098b7f-c9bd-4531-87f1-2ea26d4a2a53@linaro.org>
Date: Tue, 30 Sep 2025 09:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] system/physmem: Un-inline
 cpu_physical_memory_read/write()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Herne <jjherne@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Garzarella <sgarzare@redhat.com>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 Eric Farman <farman@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Zhao Liu <zhao1.liu@intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-s390x@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20250930041326.6448-1-philmd@linaro.org>
 <20250930041326.6448-15-philmd@linaro.org>
 <193cd8a8-2c4c-4c2c-af22-622b74c332ee@redhat.com>
 <61c31076-5330-426a-9c28-b2400bec44f6@linaro.org>
In-Reply-To: <61c31076-5330-426a-9c28-b2400bec44f6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/9/25 09:23, Philippe Mathieu-Daudé wrote:
> On 30/9/25 07:02, Thomas Huth wrote:
>> On 30/09/2025 06.13, Philippe Mathieu-Daudé wrote:
>>> Un-inline cpu_physical_memory_read() and cpu_physical_memory_write().
>>
>> What's the reasoning for this patch?
> 
> Remove cpu_physical_memory_rw() in the next patch without having
> to inline the address_space_read/address_space_write() calls in
> "exec/cpu-common.h".
> 
> Maybe better squashing both together?

That would be:

-- >8 --
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6c7d84aacb4..910e1c2afb9 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -131,18 +131,8 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
   */
  void cpu_address_space_destroy(CPUState *cpu, int asidx);

-void cpu_physical_memory_rw(hwaddr addr, void *buf,
-                            hwaddr len, bool is_write);
-static inline void cpu_physical_memory_read(hwaddr addr,
-                                            void *buf, hwaddr len)
-{
-    cpu_physical_memory_rw(addr, buf, len, false);
-}
-static inline void cpu_physical_memory_write(hwaddr addr,
-                                             const void *buf, hwaddr len)
-{
-    cpu_physical_memory_rw(addr, (void *)buf, len, true);
-}
+void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len);
+void cpu_physical_memory_write(hwaddr addr, const void *buf, hwaddr len);
  void *cpu_physical_memory_map(hwaddr addr,
                                hwaddr *plen,
                                bool is_write);
diff --git a/system/physmem.c b/system/physmem.c
index 70b02675b93..a654b2af2a3 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3181,11 +3181,16 @@ MemTxResult address_space_set(AddressSpace *as, 
hwaddr addr,
      return error;
  }

-void cpu_physical_memory_rw(hwaddr addr, void *buf,
-                            hwaddr len, bool is_write)
+void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len)
  {
-    address_space_rw(&address_space_memory, addr, MEMTXATTRS_UNSPECIFIED,
-                     buf, len, is_write);
+    address_space_read(&address_space_memory, addr,
+                       MEMTXATTRS_UNSPECIFIED, buf, len);
+}
+
+void cpu_physical_memory_write(hwaddr addr, const void *buf, hwaddr len)
+{
+    address_space_write(&address_space_memory, addr,
+                        MEMTXATTRS_UNSPECIFIED, buf, len);
  }

  /* used for ROM loading : can write in RAM and ROM */
---

