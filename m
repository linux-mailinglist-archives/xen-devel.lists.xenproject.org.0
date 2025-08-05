Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C971B1B6D6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 16:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070540.1434153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujIvW-0002nF-L4; Tue, 05 Aug 2025 14:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070540.1434153; Tue, 05 Aug 2025 14:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujIvW-0002k7-Hk; Tue, 05 Aug 2025 14:46:06 +0000
Received: by outflank-mailman (input) for mailman id 1070540;
 Tue, 05 Aug 2025 14:46:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fV7N=2R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ujIvV-0002k1-2e
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 14:46:05 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e93691e5-720a-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 16:46:03 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-60c9d8a169bso8056592a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 07:46:03 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8ffb8d7sm8602309a12.47.2025.08.05.07.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 07:46:01 -0700 (PDT)
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
X-Inumbo-ID: e93691e5-720a-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754405163; x=1755009963; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVKjcG+I5FfwHY+H43Brm9z2hdRjzirAlr0kKUF8qoY=;
        b=WCzm9NO8ThYYt9UB9vZjN2O5sUbctqwG8jiAILvwf8b/eqYtLGzya2FYKlSn3nTAxR
         TnxQziDpuQ61DzBujcy9NIime182W4RUPKQ89IvCC3ytain+l1jC3bQmnmIECIQWVcC9
         zDCDluTGzI4fQPiq8jnA3R3ZFiWyUxQJVq0VHt5/fbHMUnWzih+Pi3iGmflmdW154JKj
         6j52WBB4iwrEXjPVxCAqm+QQikSD6aiTdxjZ2OiH/djQlLLchxXF8zlZgVdcWOeitzyM
         JKE0CpSpvbTnLUrgeOQi6SID4cPqn7In6tgH/KSD+6koNsvLNcEYIhrZvRAkid50kOX3
         +UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754405163; x=1755009963;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AVKjcG+I5FfwHY+H43Brm9z2hdRjzirAlr0kKUF8qoY=;
        b=jnHzYyyVu+x9eRrQhH/ZC6ofIpHv+HGZ847RsLasXBM7k9FGvGDljeR4Xvr0GYWSxM
         cjwJ0Tr55F5DnkX94jXggmfkqNObvxvWXgoVQVQ/mgyDZNO4TZm2MEdz3RBViNi31LDl
         IXstbbiZqIWII+30YD6cquNEKy03+7n3nqYdNn3SqCxlVlXpKIjXc7PVaN2a1K2088Bo
         B4C0aQTuiKHQXzOK7+Rb2w9YtS9tHdjCw4/sfIjHIBP1woahmtBOXyDHcpVznJku5u1w
         fjU8dqt2Xa9nQ+TWwoqfG6MJQZ+ZkG/VWsqXIeTdxWldKXOMsUv8RrUMXYW2KpvQnuQn
         FLTw==
X-Forwarded-Encrypted: i=1; AJvYcCWQEaw5W1OMRY0ZrdcXhHJk64nevFXXKLHlhjoYA1OWFxR1NaaBgGju2PX3KbuuMhHHERtGMLf30Vc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWAagDVGcFSlh7BKKA6FcFeYR3jVbp6E9hqjJG5P2bVa0PJdoB
	mPM9cTImGZL3XtWt7X678N8xf7Ns5kCdCgMvCA/Fp4GC6MSH+FoGcbwv
X-Gm-Gg: ASbGncvpMzBSfX9lg6GLeZl27Ow6nC1p12vfqXoPmg7AHd33W+8KzoFdZ0TFBzsAFUw
	w/9KzCnaT6aIkLo+0rraMtWkqhVf87SsiBbKmjobl6hfvmNXptqCz5SDYYbfbPxNJsXxUC3IhT1
	v95Kak74vwAn6KLGr1jlnfJCARlzF1ZvwbJGjnvckf95+v5k7SS+1xWw92f9PUIqCTAYQ3BYnD/
	jjmZaV9DCQNU16cHbHqWyix2FcnE6uiOxhwNBHH7TxzqWoM9/lVo9NwWjG/7OnIwj/i4G7O95Tc
	pRl4OgsaCc9fJcyH9pBC47S2DhlCTV8CeztTd0/+f6gbee9ucLCqf1FlqGcb3zg52BEJwyDIpXR
	tUuNvbBXoax42SlykrR6jiQ7rseZk8a2YHyIEC/KXnGw+6AdSS/TEJp7INmERXN5bFMa5Gs4=
X-Google-Smtp-Source: AGHT+IFF1XTBKw1iO6PFALH9OmUpeTkFS7RBU3NdPaMsrVp/Tpubo2pzCQAcXih3EjLTU/V6tngEEQ==
X-Received: by 2002:a05:6402:354f:b0:615:adc4:1e66 with SMTP id 4fb4d7f45d1cf-615e7173006mr13415278a12.25.1754405161413;
        Tue, 05 Aug 2025 07:46:01 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------kdt00xxFjWrjsxUeIoZikbxX"
Message-ID: <b9fb09d7-ea4c-4b23-811b-f87ca658fff7@gmail.com>
Date: Tue, 5 Aug 2025 16:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/20] xen/riscv: implement sbi_remote_hfence_gvma()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <b0649cf7b071d0a1cdd7fc9b8d73abea5d0646b4.1753973161.git.oleksii.kurochko@gmail.com>
 <829f9477-2b18-47f0-8fb3-57bffa8d133d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <829f9477-2b18-47f0-8fb3-57bffa8d133d@suse.com>

This is a multi-part message in MIME format.
--------------kdt00xxFjWrjsxUeIoZikbxX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/4/25 3:52 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
>> covering the range of guest physical addresses between start_addr and
>> start_addr + size for all VMIDs.
>>
>> The remote fence operation applies to the entire address space if either:
>>   - start_addr and size are both 0, or
>>   - size is equal to 2^XLEN-1.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich<jbeulich@suse.com>
>
> However, ...
>
>> --- a/xen/arch/riscv/include/asm/sbi.h
>> +++ b/xen/arch/riscv/include/asm/sbi.h
>> @@ -89,6 +89,25 @@ bool sbi_has_rfence(void);
>>   int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
>>                             size_t size);
>>   
>> +/*
>> + * Instructs the remote harts to execute one or more HFENCE.GVMA
>> + * instructions, covering the range of guest physical addresses
>> + * between start_addr and start_addr + size for all VMIDs.
> ... I'd like to ask that you avoid fuzzy terminology like this one. Afaict
> you mean [start, start + size). Help yourself and future readers by then
> also saying it exactly like this. (Happy to make a respective edit while
> committing.)

I just tried the following wording in SBI spec.

I agree that using [start, start+size) is clearer as each time I'm going
to check SBI code to verify if 'start+size' is included or not.

It would be happy if you could update this part of commit message during
commit.

>
>> + * Returns 0 if IPI was sent to all the targeted harts successfully
>> + * or negative value if start_addr or size is not valid.
> This similarly is ambiguous: The union of the success case stated and the
> error case stated isn't obviously all possible states. The success
> statement in particular alludes to the possibility of an IPI not actually
> reaching its target.

The same as above this is what SBI spec. tells.

I've not checked SBI code deeply, but it seems like the code is waiting while
IPI will be reached as looking at the code:
	/**
	 * As this this function only handlers scalar values of hart mask, it must be
	 * set to all online harts if the intention is to send IPIs to all the harts.
	 * If hmask is zero, no IPIs will be sent.
	 */
	int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
	{
                 ...
	
		/* Send IPIs */
		do {
			retry_needed = false;
			sbi_hartmask_for_each_hart(i, &target_mask) {
				rc = sbi_ipi_send(scratch, i, event, data);
				if (rc == SBI_IPI_UPDATE_RETRY)
					retry_needed = true;
				else
					sbi_hartmask_clear_hart(i, &target_mask);
			}
		} while (retry_needed);
	
		/* Sync IPIs */
		sbi_ipi_sync(scratch, event);
	
		return 0;
	}
and
	static int sbi_ipi_sync(struct sbi_scratch *scratch, u32 event)
	{
		const struct sbi_ipi_event_ops *ipi_ops;
	
		if ((SBI_IPI_EVENT_MAX <= event) ||
		    !ipi_ops_array[event])
			return SBI_EINVAL;
		ipi_ops = ipi_ops_array[event];
	
		if (ipi_ops->sync)
			ipi_ops->sync(scratch);
	
		return 0;
	}
which calls:
	static void tlb_sync(struct sbi_scratch *scratch)
	{
		atomic_t *tlb_sync =
				sbi_scratch_offset_ptr(scratch, tlb_sync_off);
	
		while (atomic_read(tlb_sync) > 0) {
			/*
			 * While we are waiting for remote hart to set the sync,
			 * consume fifo requests to avoid deadlock.
			 */
			tlb_process_once(scratch);
		}
	
		return;
	}

>
>> + * The remote fence operation applies to the entire address space if either:
>> + *  - start_addr and size are both 0, or
>> + *  - size is equal to 2^XLEN-1.
> Whose XLEN is this? The guest's? The host's? (I assume the latter, but it's
> not unambiguous, unless there's specific terminology that I'm unaware of,
> yet which would make this unambiguous.)

RISC-V spec quite mixes the terminology (3.1.6.2. Base ISA Control in mstatus Register)
around XLEN:
   For RV64 harts, the SXL and UXL fields are WARL fields that control the value
   of XLEN for S-mode and U-mode, respectively. The encoding of these fields is
   the same as the MXL field of misa, shown in Table 9. The effective XLEN in
   S-mode and U-mode are termed SXLEN and UXLEN, respectively

Basically, RISC-V privileged architecture defines different XLEN values for
various privilege modes:
  - MXLEN for Machine mode
  - SXLEN for Supervisor mode.
  - HSXLEN for Hypervisor-Supervisor mode.
  - VSXLEN for Virtual Supervisor mode.

Considering that SBI is an API that is provided for S-mode I expect that XLEN = SXLEN
in this case, but SBI spec. is using just XLEN.

~ Oleksii

--------------kdt00xxFjWrjsxUeIoZikbxX
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
    <div class="moz-cite-prefix">On 8/4/25 3:52 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:829f9477-2b18-47f0-8fb3-57bffa8d133d@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
covering the range of guest physical addresses between start_addr and
start_addr + size for all VMIDs.

The remote fence operation applies to the entire address space if either:
 - start_addr and size are both 0, or
 - size is equal to 2^XLEN-1.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

However, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -89,6 +89,25 @@ bool sbi_has_rfence(void);
 int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
                           size_t size);
 
+/*
+ * Instructs the remote harts to execute one or more HFENCE.GVMA
+ * instructions, covering the range of guest physical addresses
+ * between start_addr and start_addr + size for all VMIDs.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... I'd like to ask that you avoid fuzzy terminology like this one. Afaict
you mean [start, start + size). Help yourself and future readers by then
also saying it exactly like this. (Happy to make a respective edit while
committing.)</pre>
    </blockquote>
    <pre>I just tried the following wording in SBI spec.

I agree that using [start, start+size) is clearer as each time I'm going
to check SBI code to verify if 'start+size' is included or not.

It would be happy if you could update this part of commit message during
commit.

</pre>
    <blockquote type="cite"
      cite="mid:829f9477-2b18-47f0-8fb3-57bffa8d133d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * Returns 0 if IPI was sent to all the targeted harts successfully
+ * or negative value if start_addr or size is not valid.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This similarly is ambiguous: The union of the success case stated and the
error case stated isn't obviously all possible states. The success
statement in particular alludes to the possibility of an IPI not actually
reaching its target.</pre>
    </blockquote>
    <pre>The same as above this is what SBI spec. tells.

I've not checked SBI code deeply, but it seems like the code is waiting while
IPI will be reached as looking at the code:
	/**
	 * As this this function only handlers scalar values of hart mask, it must be
	 * set to all online harts if the intention is to send IPIs to all the harts.
	 * If hmask is zero, no IPIs will be sent.
	 */
	int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
	{
                ...
	
		/* Send IPIs */
		do {
			retry_needed = false;
			sbi_hartmask_for_each_hart(i, &amp;target_mask) {
				rc = sbi_ipi_send(scratch, i, event, data);
				if (rc == SBI_IPI_UPDATE_RETRY)
					retry_needed = true;
				else
					sbi_hartmask_clear_hart(i, &amp;target_mask);
			}
		} while (retry_needed);
	
		/* Sync IPIs */
		sbi_ipi_sync(scratch, event);
	
		return 0;
	}
and
	static int sbi_ipi_sync(struct sbi_scratch *scratch, u32 event)
	{
		const struct sbi_ipi_event_ops *ipi_ops;
	
		if ((SBI_IPI_EVENT_MAX &lt;= event) ||
		    !ipi_ops_array[event])
			return SBI_EINVAL;
		ipi_ops = ipi_ops_array[event];
	
		if (ipi_ops-&gt;sync)
			ipi_ops-&gt;sync(scratch);
	
		return 0;
	}
which calls:
	static void tlb_sync(struct sbi_scratch *scratch)
	{
		atomic_t *tlb_sync =
				sbi_scratch_offset_ptr(scratch, tlb_sync_off);
	
		while (atomic_read(tlb_sync) &gt; 0) {
			/*
			 * While we are waiting for remote hart to set the sync,
			 * consume fifo requests to avoid deadlock.
			 */
			tlb_process_once(scratch);
		}
	
		return;
	}

</pre>
    <blockquote type="cite"
      cite="mid:829f9477-2b18-47f0-8fb3-57bffa8d133d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * The remote fence operation applies to the entire address space if either:
+ *  - start_addr and size are both 0, or
+ *  - size is equal to 2^XLEN-1.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Whose XLEN is this? The guest's? The host's? (I assume the latter, but it's
not unambiguous, unless there's specific terminology that I'm unaware of,
yet which would make this unambiguous.)</pre>
    </blockquote>
    <pre>RISC-V spec quite mixes the terminology (3.1.6.2. Base ISA Control in mstatus Register)
around XLEN:
  For RV64 harts, the SXL and UXL fields are WARL fields that control the value
  of XLEN for S-mode and U-mode, respectively. The encoding of these fields is
  the same as the MXL field of misa, shown in Table 9. The effective XLEN in
  S-mode and U-mode are termed SXLEN and UXLEN, respectively

Basically, RISC-V privileged architecture defines different XLEN values for
various privilege modes:
 - MXLEN for Machine mode
 - SXLEN for Supervisor mode.
 - HSXLEN for Hypervisor-Supervisor mode.
 - VSXLEN for Virtual Supervisor mode.

Considering that SBI is an API that is provided for S-mode I expect that XLEN = SXLEN
in this case, but SBI spec. is using just XLEN.

~ Oleksii
</pre>
  </body>
</html>

--------------kdt00xxFjWrjsxUeIoZikbxX--

