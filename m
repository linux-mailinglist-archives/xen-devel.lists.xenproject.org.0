Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20472A031DD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 22:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866008.1277306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUuL8-0002pD-O9; Mon, 06 Jan 2025 21:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866008.1277306; Mon, 06 Jan 2025 21:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUuL8-0002n2-L3; Mon, 06 Jan 2025 21:08:46 +0000
Received: by outflank-mailman (input) for mailman id 866008;
 Mon, 06 Jan 2025 21:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH3c=T6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tUuL7-0002mw-EZ
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 21:08:45 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68fd419f-cc72-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 22:08:43 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso102276685e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 13:08:43 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e528sm49330255f8f.83.2025.01.06.13.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 13:08:42 -0800 (PST)
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
X-Inumbo-ID: 68fd419f-cc72-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736197723; x=1736802523; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dt1f81EVsgW5OvATu4Z5FjJ0Vm5UWbdIlHsy1CTjJ6o=;
        b=oeAzpeDc5u8INQ79ainvTB4xjnxO5gnv7mVTA6zBlMwImbWlQ9lO5GtHLM5NXQQsZZ
         jKTXTe4sV7jnQYa28cJlvX7djvl4RZ2WRlUi21U3VBMP7dArmmjKIQYlm5h+lLjz2BAT
         A/QrbBw/4Tcxx7xSY7SOYJREj+5VR+E26RcXOzvEssEaGR1bYQdtvz0fGGvytYx0vZsi
         KYoqE+Qh8JnSl6v8Qvxtg39R/CFmqLL06WQY39pAY8Sxh0mieCX02ReykMgk1K2w9fVu
         zeXrGr7c3BdBlRmKxOjqFxyyOZpbaNI/cEcm47msf5NhiSV+mIEjRhDITnKH7kqWLY7Y
         FghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736197723; x=1736802523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dt1f81EVsgW5OvATu4Z5FjJ0Vm5UWbdIlHsy1CTjJ6o=;
        b=Vv/4FKhJNLFvBp/lHRgI9LJxo7egI+DokTu/ITut1CYkVZjPJGfT+9LF9yCQntcsTp
         mM7dJdwg0j9MLklaRaxNrG2t+PGpwGiZ6EWerRsockmcYnBcnCo4iNc+8McOQ+BnH6mg
         9ZPZDQM2jLGTKeOx/QVoqC5j0s9JHwdTOe4Q/jcgGogP+GC37SsPFjQJuQKlpUZrYm0j
         phO/xPn7hIYg9wu90x90ZhXRCSappU9sRaBIKopsc0/P9u2f771lk16pLWuahANiMq32
         GGLJjhHn7YdKf2PH+jlPzAvtSPl1VTE0vm4Ay8tO6O6npWOQqx9fzV8KYD6Pq+WVyP6y
         dp8A==
X-Forwarded-Encrypted: i=1; AJvYcCV6eFrbHSyCnEhwbHKNXj/aPxybTZni2Uv/eJb8aFYynULGXfUEq96iPuqmq6dMZQj7L3caBolSRyw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywr/grZALNmVtk+KQIFCPuxzCrFv4Iy9I3ObEo/rwSynl0W4OUC
	MkT0KyKhFo3seOB0dJvbn1orkHaEghf79DDJ2U4Azu+hPHKjj637aFzxOcFbn6Y=
X-Gm-Gg: ASbGncvTwgBFdzp7FP07JfYPoLFMxFPGTyhOmgK/c7k4cfiwxL7GLohigRP2hRndu/s
	bNqXtb1p5Ad61Eu95Gh7CGI3oxgsEObe/4KMQcwl23k3bcSyfWYKmMmXJxqMWh9pVyrbNlTwId4
	UN/+AT3ADcGM4Fz8/3PUvUgtKiDJTf4bC48u++4EKPCZ7g7ecfeyu3EaCBnw50DaSav4t9s6eIw
	DnH58oF658wJY56G46beGLDYalIPS6IdlHZnd6b+0HSolA1tk/K+3LIaJn63uHR4sRR8i2pzr/h
	Pa0Vty4LJAzaj6tkdfjzD8AO
X-Google-Smtp-Source: AGHT+IHQlDMHE5yzCDH0asXIjYrH5p/B5ofNz91YmLcogyERBoJ0h4sXot+iT1K99vchhPpxIvHj0A==
X-Received: by 2002:a05:6000:188e:b0:385:f840:e613 with SMTP id ffacd0b85a97d-38a223fd52dmr44054103f8f.51.1736197722710;
        Mon, 06 Jan 2025 13:08:42 -0800 (PST)
Message-ID: <6df59c2c-e29d-4b86-8908-4cb9093bad13@linaro.org>
Date: Mon, 6 Jan 2025 22:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/7] accel/hvf: Use CPU_FOREACH_HVF()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cameron Esfahani <dirty@apple.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Alexander Graf <agraf@csgraf.de>, Paul Durrant <paul@xen.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Riku Voipio <riku.voipio@iki.fi>, Anthony PERARD <anthony@xenproject.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, Zhao Liu
 <zhao1.liu@intel.com>, Phil Dennis-Jordan <phil@philjordan.eu>,
 David Woodhouse <dwmw2@infradead.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anton Johansson <anjo@rev.ng>
References: <20250106200258.37008-1-philmd@linaro.org>
 <20250106200258.37008-7-philmd@linaro.org>
 <bd8168fe-c774-4f75-8a94-1a67ec31e38d@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <bd8168fe-c774-4f75-8a94-1a67ec31e38d@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/1/25 21:33, Daniel Henrique Barboza wrote:
> 
> 
> On 1/6/25 5:02 PM, Philippe Mathieu-Daudé wrote:
>> Only iterate over HVF vCPUs when running HVF specific code.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/system/hvf_int.h  | 4 ++++
>>   accel/hvf/hvf-accel-ops.c | 9 +++++----
>>   target/arm/hvf/hvf.c      | 4 ++--
>>   3 files changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
>> index 42ae18433f0..3cf64faabd1 100644
>> --- a/include/system/hvf_int.h
>> +++ b/include/system/hvf_int.h
>> @@ -11,6 +11,8 @@
>>   #ifndef HVF_INT_H
>>   #define HVF_INT_H
>> +#include "system/hw_accel.h"
>> +
>>   #ifdef __aarch64__
>>   #include <Hypervisor/Hypervisor.h>
>>   typedef hv_vcpu_t hvf_vcpuid;
>> @@ -74,4 +76,6 @@ int hvf_put_registers(CPUState *);
>>   int hvf_get_registers(CPUState *);
>>   void hvf_kick_vcpu_thread(CPUState *cpu);
>> +#define CPU_FOREACH_HVF(cpu) CPU_FOREACH_HWACCEL(cpu)
> 
> 
> Cosmetic comment: given that this is HVF specific code and we only 
> support one hw
> accelerator at a time, I'd skip this alias and use 
> CPU_FOREACH_HWACCEL(cpu) directly.
> It would make it easier when grepping to see where and how the macro is 
> being used.

I find it more useful to grep for a particular accelerator, or for
all of them:

$ git grep CPU_FOREACH_
accel/hvf/hvf-accel-ops.c:507:    CPU_FOREACH_HVF(cpu) {
accel/hvf/hvf-accel-ops.c:546:    CPU_FOREACH_HVF(cpu) {
accel/kvm/kvm-all.c:875:        CPU_FOREACH_KVM(cpu) {
accel/kvm/kvm-all.c:938:    CPU_FOREACH_KVM(cpu) {
accel/tcg/cputlb.c:372:    CPU_FOREACH_TCG(cpu) {
accel/tcg/cputlb.c:650:        CPU_FOREACH_TCG(dst_cpu) {


