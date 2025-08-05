Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803F3B1B6FD
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 17:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070571.1434173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJAZ-0006ET-7O; Tue, 05 Aug 2025 15:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070571.1434173; Tue, 05 Aug 2025 15:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJAZ-0006Ck-3z; Tue, 05 Aug 2025 15:01:39 +0000
Received: by outflank-mailman (input) for mailman id 1070571;
 Tue, 05 Aug 2025 15:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujJAY-0006Ca-5A
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 15:01:38 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14fafea3-720d-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 17:01:36 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-af958127df5so513087366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 08:01:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a374dsm915770866b.36.2025.08.05.08.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 08:01:32 -0700 (PDT)
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
X-Inumbo-ID: 14fafea3-720d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754406095; x=1755010895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KYYu+Z1IE6b41h4Pk5zDGzMcaFnvtPZ30MbOVI4uOiE=;
        b=BpF6xqMD2Lc9TfrCMbpkjY3JU4datWwcnwZPEDgnWBqflr/H5u8cCx0nXGS0bFXggY
         0XZD00D44jxbULMaU3eqd2aeZ7DuT5dPdn4cC0Pg/kMvOFuSKk9wxy71W4t/kyKTkCDC
         PhyZoAaiF2rbDFj8eXOGAAe45MLY5A4oovUEpIn/xy3spnRYKDeEgfRH3gN7fo+woUb/
         81uAhoQ1WU5c638N+rbjnFFELMGrzV5EAp87qfzXiEAVoeYAy2AA3LeUt0FNjM+Ggody
         J7kOG3W2pYYNV7YXIzZOYihJt+AdO3CzzUguPF9mQU1lCYkihgWNPu2jj3liiGHzz/3p
         o/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754406095; x=1755010895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYYu+Z1IE6b41h4Pk5zDGzMcaFnvtPZ30MbOVI4uOiE=;
        b=LyONhVP3kjDnJYDeS8DN64NZBGsoL2PcpUfcwTcxm6ckOxlPKoTkv1MGsGTm3MAnRy
         3p5sR+EBuEhA+IHeVxcdC0wf/tGnj1AKnOoUqXf8yB3+4Fn1tFQ/5QXcN3u5UypYkS60
         iZ+V4cC1KQWHEclOUqJUWSgO/PrXj6b1gkXiMPuo2pQk8vsOYuWrlXLyynT29y3+i65i
         85Ayr77OXW0WwFlQOlKNTvSRa8h+n/WIp4WKGCZk2kIDMqzloeBjsxN3eS2jsMiAUO5a
         ZmT33O1Lwl58xFuDJEIvMSkseHoC9Dgzm0oyyTyfLvpEKnTzbEgaEh0oLMuNqQhZHPr8
         92mg==
X-Forwarded-Encrypted: i=1; AJvYcCXPUxiXAusNR3CxGn0XnDVpet5UsrXQsm7YT4WwgAyDXe+3vvyAUff4cu8FlGsu/iPloTihfbdqfnw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlVNl6FNOFCJZ/fTlBOag6q3X88EKSuXgj/UX1Pe0Mm6ywbHD8
	b+tk0wwsVl7U3pbXPlocHlq/YUMBhoVTah+jxr9x8ixABkiEPBPrugLIMj4TtlFmRw==
X-Gm-Gg: ASbGncvFRnvTca6HU3bNL0cHB2WtvqeYNgohIj2JBzZ5wBIPB3hiJsoKIoCnUCklRPd
	4jpn+R3/80ergDi45nZfpBxTFaamJ7gAun2tcaY3Yy854+onPKAecnJdGBp+OCL5SC4fQdAi7ik
	mpgYHsOHnvsaI+4FSLwkLzSzxBZ1HVYmWiwbJ6JmxagbK5cbUeW5H1b4CDfH9zVnxhkVGxRu+Ee
	8x5zALIejyZOlu2jGLFsu5MppLYvhCc1Jzf+RkyaXLg5Gr+3hJuMv6YFunXnvGtoPEQlSWKrySH
	GOpY/qUoumbL0yHUR2iOHl1Es4Fb1H2zFgroTZ+On0estWK4ULvjL6iSzRv/PjHIcANTSz6SUj0
	MqP0qlW2HObLihi1W4yxSHm6DTGKgboFgZeP/uTVU7bhyGKYou7BK25mc+zgOEQ90TxieXUe9o1
	6ONM7EQXs=
X-Google-Smtp-Source: AGHT+IFcbQ3mDedlif+FWmO0q+zWQtQ+MhPGFHUy9ZnwtDjSTBXQ2qu0YeaUuDZVHNofqdJVD6Z0iw==
X-Received: by 2002:a17:907:6d14:b0:ae3:cc60:8ce7 with SMTP id a640c23a62f3a-af94001fea2mr1421950266b.19.1754406093496;
        Tue, 05 Aug 2025 08:01:33 -0700 (PDT)
Message-ID: <55a08131-169d-49b3-a499-d7057e7affac@suse.com>
Date: Tue, 5 Aug 2025 17:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/20] xen/riscv: implement sbi_remote_hfence_gvma()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <b9fb09d7-ea4c-4b23-811b-f87ca658fff7@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <b9fb09d7-ea4c-4b23-811b-f87ca658fff7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.08.2025 16:45, Oleksii Kurochko wrote:
> On 8/4/25 3:52 PM, Jan Beulich wrote:
>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>> + * Returns 0 if IPI was sent to all the targeted harts successfully
>>> + * or negative value if start_addr or size is not valid.
>> This similarly is ambiguous: The union of the success case stated and the
>> error case stated isn't obviously all possible states. The success
>> statement in particular alludes to the possibility of an IPI not actually
>> reaching its target.
> 
> The same as above this is what SBI spec. tells.
> 
> I've not checked SBI code deeply, but it seems like the code is waiting while
> IPI will be reached as looking at the code:
> 	/**
> 	 * As this this function only handlers scalar values of hart mask, it must be
> 	 * set to all online harts if the intention is to send IPIs to all the harts.
> 	 * If hmask is zero, no IPIs will be sent.
> 	 */
> 	int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
> 	{
>                  ...
> 	
> 		/* Send IPIs */
> 		do {
> 			retry_needed = false;
> 			sbi_hartmask_for_each_hart(i, &target_mask) {
> 				rc = sbi_ipi_send(scratch, i, event, data);
> 				if (rc == SBI_IPI_UPDATE_RETRY)
> 					retry_needed = true;
> 				else
> 					sbi_hartmask_clear_hart(i, &target_mask);
> 			}
> 		} while (retry_needed);
> 	
> 		/* Sync IPIs */
> 		sbi_ipi_sync(scratch, event);
> 	
> 		return 0;
> 	}
> and
> 	static int sbi_ipi_sync(struct sbi_scratch *scratch, u32 event)
> 	{
> 		const struct sbi_ipi_event_ops *ipi_ops;
> 	
> 		if ((SBI_IPI_EVENT_MAX <= event) ||
> 		    !ipi_ops_array[event])
> 			return SBI_EINVAL;
> 		ipi_ops = ipi_ops_array[event];
> 	
> 		if (ipi_ops->sync)
> 			ipi_ops->sync(scratch);
> 	
> 		return 0;
> 	}
> which calls:
> 	static void tlb_sync(struct sbi_scratch *scratch)
> 	{
> 		atomic_t *tlb_sync =
> 				sbi_scratch_offset_ptr(scratch, tlb_sync_off);
> 	
> 		while (atomic_read(tlb_sync) > 0) {
> 			/*
> 			 * While we are waiting for remote hart to set the sync,
> 			 * consume fifo requests to avoid deadlock.
> 			 */
> 			tlb_process_once(scratch);
> 		}
> 	
> 		return;
> 	}

I'll leave that comment as-is then, even if I'm not really happy with it.

>>> + * The remote fence operation applies to the entire address space if either:
>>> + *  - start_addr and size are both 0, or
>>> + *  - size is equal to 2^XLEN-1.
>> Whose XLEN is this? The guest's? The host's? (I assume the latter, but it's
>> not unambiguous, unless there's specific terminology that I'm unaware of,
>> yet which would make this unambiguous.)
> 
> RISC-V spec quite mixes the terminology (3.1.6.2. Base ISA Control in mstatus Register)
> around XLEN:
>    For RV64 harts, the SXL and UXL fields are WARL fields that control the value
>    of XLEN for S-mode and U-mode, respectively. The encoding of these fields is
>    the same as the MXL field of misa, shown in Table 9. The effective XLEN in
>    S-mode and U-mode are termed SXLEN and UXLEN, respectively
> 
> Basically, RISC-V privileged architecture defines different XLEN values for
> various privilege modes:
>   - MXLEN for Machine mode
>   - SXLEN for Supervisor mode.
>   - HSXLEN for Hypervisor-Supervisor mode.
>   - VSXLEN for Virtual Supervisor mode.
> 
> Considering that SBI is an API that is provided for S-mode I expect that XLEN = SXLEN
> in this case, but SBI spec. is using just XLEN.

Very helpful.

Jan

