Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8873EAE628B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 12:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023550.1399548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU0yX-000805-LI; Tue, 24 Jun 2025 10:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023550.1399548; Tue, 24 Jun 2025 10:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU0yX-0007xB-HK; Tue, 24 Jun 2025 10:34:01 +0000
Received: by outflank-mailman (input) for mailman id 1023550;
 Tue, 24 Jun 2025 10:33:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctQ0=ZH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uU0yV-0007x5-Fi
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 10:33:59 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbc756cc-50e6-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 12:33:57 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ade4679fba7so46545566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 03:33:57 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae0b618251bsm17148066b.55.2025.06.24.03.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 03:33:55 -0700 (PDT)
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
X-Inumbo-ID: bbc756cc-50e6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750761237; x=1751366037; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpYl/+rgNV5Exgpr6I3d3Pp7PRlvJtiIjdFGqf/ENjA=;
        b=jtZKXlEFkfzqnbPOiwrqkCZWI4FCDxwl4/jN8rkpLUk4hHtSMYmgEWyNxdq6C7sZ4t
         Ji72reTEB4I5keJ9wNsrzrx2q9T2YmMxB7698NnhIZ2Xdxf6uu6KaYXkOfOJbhRUWvPg
         ZGPughYQv1mAINLLx1MIXEo0UnbmBiSfxfxEzHq7jPuAupytmNHc+wF0FwS581AgsvM/
         CG98aPNTw04daJJmXcqL40aW5FuI5nT6JqSxwXczQMmQLHOfMPeowxluR5eqTEvA1Gze
         z8GoFwAqrroB44abPcpOOkgxIunjoCuFXxCboztQHj7at63xyFxEIig4jelLYk8XZ7s5
         5QKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761237; x=1751366037;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PpYl/+rgNV5Exgpr6I3d3Pp7PRlvJtiIjdFGqf/ENjA=;
        b=q3vivzQKgdjmJfpsL7C4t4ydW2d9YRYim1yh+8uCew648qCoR1EobQ4LOgDXkmr/Q3
         BNLKiAk6A2YtW/fD7w6KSu3uDpsgjJmAY5AQcb3Q2Pi4VDCYxaZtv7QseWWU5g370fQz
         weqZMPgjpFaERhScjJ6Xjv1ogB6sQLSwnFvLIFC1KBu+AGcCkVT3wEEx21byEQFm7r9I
         bwQDf3IEsd5TgPc+17MEo9jrx9kAKuzXIqP++g8+IKCkES8VJ9tCJGDrmwjmeOZ3dqgN
         ZdtrqKywwyDXJuYBqgrvZi/yMFg+Ow7go1pRrnCV6UhBvSuG+pUBUwETSeTphgVo6Sui
         87Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWT0A8/xdafQb6ArE4slSB2iMH3bLuAUuY+2kKAlpjHSSG1IlsQe6zAr/zukRoqL6gAi40Z6ynntns=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxnVhs8j32YgSDxrUTwOpVFKJvFnSOhx2Gwn78ntqYMW6IjoJp
	X18AMQ7ripZlseY1ZG78g1VcPBHBz6bgUEJ5uHed/pJkY6hpctvZOGCV
X-Gm-Gg: ASbGncvslxxzs8kyeCW5YPJThQg2KR08DgBqW2z8w2XV1z6OeHn5c2sgloO0SWnbXQZ
	f2SOPLMXqlaTVPgJObBtEoWnYfizay0vASdJVNXqAH3QX1oH2nlADxTfSKfLeG/iCnAusYO6IEp
	AUxf11Nyu7Pbxo2b0hZuOAkRMoiOWtEqyEQc64srMv//KhG/FluOYfqd4eriW6XzAa6LipXQV/z
	U61hHh0rDE5E3VrZE9NVmZPFm5u6PVNRDeN0eTX4SALeD8uSJZqldD3D2gktt5C0H1x6tc8RneJ
	Qqk8z9koTOLXz8q+h/6ZHQwQECQ3BjJENsil+obSCT4xp2b3Dj6H0mB4hXqDLdj5l55OOrqtL5x
	cYwUa/t4J5m/LbedBR7XTb6DEpfsHMg0KcaI=
X-Google-Smtp-Source: AGHT+IFmT4rxMzjg3fpBe+bkSRV7Pdt5X68i1wzOIhUhrDBQJo2pGsd8IRcTtSPMgjd4fj9db/l1Rg==
X-Received: by 2002:a17:907:3e95:b0:ad5:34cf:d23f with SMTP id a640c23a62f3a-ae0579246eamr1359036266b.21.1750761236307;
        Tue, 24 Jun 2025 03:33:56 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------RAhJxSzatQHsZlWOo1iK9zJz"
Message-ID: <7b8d5688-bfc3-4341-8fd5-8e9feefdfa82@gmail.com>
Date: Tue, 24 Jun 2025 12:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/17] xen/riscv: implement sbi_remote_hfence_gvma()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <ea7a15c0ecfd2bae95c11a92e4c0cb71b155140f.1749555949.git.oleksii.kurochko@gmail.com>
 <728ee92b-0e4f-4ccb-8c6e-54687bd75c62@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <728ee92b-0e4f-4ccb-8c6e-54687bd75c62@suse.com>

This is a multi-part message in MIME format.
--------------RAhJxSzatQHsZlWOo1iK9zJz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/18/25 5:15 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
>> covering the range of guest physical addresses between start_addr and
>> start_addr + size for all the guests.
> Here and in the code comment: Why "for all the guests"? Under what conditions
> would you require such a broad (guest) TLB flush?

Hmm, it seems like KVM always do such a broad (guest) TLB flush during detection
of VMIDLEN:
	void __init kvm_riscv_gstage_vmid_detect(void)
	{
		unsigned long old;
	
		/* Figure-out number of VMID bits in HW */
		old = csr_read(CSR_HGATP);
		csr_write(CSR_HGATP, old | HGATP_VMID);
		vmid_bits = csr_read(CSR_HGATP);
		vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
		vmid_bits = fls_long(vmid_bits);
		csr_write(CSR_HGATP, old);
	
		/* We polluted local TLB so flush all guest TLB */
		kvm_riscv_local_hfence_gvma_all();
	
		/* We don't use VMID bits if they are not sufficient */
		if ((1UL << vmid_bits) < num_possible_cpus())
			vmid_bits = 0;
	}

It is not clear actually why so broad and why not hfence_gvma_vmid(vmid_bits).

And I am not really 100% sure that any hfence_gvma() is needed here as I don't see
what could pollutes local guest TLB between csr_write() calls.

RISC-V spec. says that:
	Note that writing hgatp does not imply any ordering constraints between page-table updates and
	subsequent G-stage address translations. If the new virtual machine’s guest physical page tables have
	been modified, or if a VMID is reused, it may be necessary to execute an HFENCE.GVMA instruction
	(see Section 18.3.2) before or after writing hgatp.

But we don't modify VM's guest physical page table. We could potentially reuse VMID between csr_write()
calls, but it is returning back and we don't switch to a guest with this "new" VMID, so it isn't really used.

Do you have any thoughts about that?

~ Oleksii

--------------RAhJxSzatQHsZlWOo1iK9zJz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/25 5:15 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:728ee92b-0e4f-4ccb-8c6e-54687bd75c62@suse.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap=""
      class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
covering the range of guest physical addresses between start_addr and
start_addr + size for all the guests.
</pre></blockquote><pre wrap="" class="moz-quote-pre">Here and in the code comment: Why "for all the guests"? Under what conditions
would you require such a broad (guest) TLB flush?</pre></pre>
    </blockquote>
    <pre>Hmm, it seems like KVM always do such a broad (guest) TLB flush during detection
of VMIDLEN:
	void __init kvm_riscv_gstage_vmid_detect(void)
	{
		unsigned long old;
	
		/* Figure-out number of VMID bits in HW */
		old = csr_read(CSR_HGATP);
		csr_write(CSR_HGATP, old | HGATP_VMID);
		vmid_bits = csr_read(CSR_HGATP);
		vmid_bits = (vmid_bits &amp; HGATP_VMID) &gt;&gt; HGATP_VMID_SHIFT;
		vmid_bits = fls_long(vmid_bits);
		csr_write(CSR_HGATP, old);
	
		/* We polluted local TLB so flush all guest TLB */
		kvm_riscv_local_hfence_gvma_all();
	
		/* We don't use VMID bits if they are not sufficient */
		if ((1UL &lt;&lt; vmid_bits) &lt; num_possible_cpus())
			vmid_bits = 0;
	}

It is not clear actually why so broad and why not hfence_gvma_vmid(vmid_bits).

And I am not really 100% sure that any hfence_gvma() is needed here as I don't see
what could pollutes local guest TLB between csr_write() calls.

RISC-V spec. says that:
	Note that writing hgatp does not imply any ordering constraints between page-table updates and
	subsequent G-stage address translations. If the new virtual machine’s guest physical page tables have
	been modified, or if a VMID is reused, it may be necessary to execute an HFENCE.GVMA instruction
	(see Section 18.3.2) before or after writing hgatp.

But we don't modify VM's guest physical page table. We could potentially reuse VMID between csr_write()
calls, but it is returning back and we don't switch to a guest with this "new" VMID, so it isn't really used.

Do you have any thoughts about that?

~ Oleksii
</pre>
  </body>
</html>

--------------RAhJxSzatQHsZlWOo1iK9zJz--

