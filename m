Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4B7A88BF5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 21:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950969.1347321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PAs-00025a-JK; Mon, 14 Apr 2025 19:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950969.1347321; Mon, 14 Apr 2025 19:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PAs-00022Y-EB; Mon, 14 Apr 2025 19:08:54 +0000
Received: by outflank-mailman (input) for mailman id 950969;
 Mon, 14 Apr 2025 17:13:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rghC=XA=gmail.com=francescolavra.fl@srs-se1.protection.inumbo.net>)
 id 1u4NMw-0006cg-US
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 17:13:15 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfc1808e-1953-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 19:13:14 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so39128505e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 10:13:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:5d29:f42d:74f6:abb7:53c9:817c?
 ([2001:b07:5d29:f42d:74f6:abb7:53c9:817c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f204c500bsm191180875e9.0.2025.04.14.10.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 10:13:12 -0700 (PDT)
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
X-Inumbo-ID: bfc1808e-1953-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744650793; x=1745255593; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:in-reply-to:date
         :cc:to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhLhCv09lRa1OLV+bmnI0sicXwTDVpYEF9Itb4YCx/Y=;
        b=O3OHAtCaMkPn20hIvxWUWumklbC1k4Tpb5SGk1WrH3tAB2fVpOefuvROSkx2soZ1Qy
         q8ETJ1YL+n4mdB1bXC7Ifcaol8rnZJsUl33m4J4w8/s44wGbGs+Hwf+rnPHP4a/GWr5v
         HLaF2Z66wEqrDRVqIP0rtd4onE6R7ba9qoRXBocrOb88hMNVkI4ihTAwct8/aXM1ybia
         KgT8vGuTKm5TLZY3U2Z1cH8dx90Up+DZcpEKH7kPQ9IoDUHaSH+McxoxJWKu8PnwFU4E
         eY9jLDsf+lRMKKBsMhZIAc7o4INVoHwF1A4mYtZhpl6mkJUZCOwdz/IhatmTtGE3OkC7
         s6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744650793; x=1745255593;
        h=mime-version:user-agent:content-transfer-encoding:in-reply-to:date
         :cc:to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AhLhCv09lRa1OLV+bmnI0sicXwTDVpYEF9Itb4YCx/Y=;
        b=NaYhgxSawpkQmFsfWY7BWCQUMpqNEHgLAaKMoqeFVpy9gt44Fl1jvLyKT315dJZrK5
         nHLMJKKp5z4w1bsR/EncYnlhrWsD3VlWFeb2HenT62+/BZcNUp1KoIsP0Z+5xBgt5VNj
         hBfCmBFZENimmmjx5FO+pGTCct6XCjnKbMWqSm3auN+0Exk1O0ww94eY5D8dLura0Xd1
         Q/bgsV+6+ViEH4b7VlGWbrwE9cPqVmy5E/HOB/2CMf5UHOwIa6IryY5Jk4CAdTac1I8Y
         +g5R143Xcdo8opmCrrCXrtwhoQBioRR2d2KFoKXQwU+BE4D1cDqPkAtV5D4Gvv1BM/Nv
         NL6w==
X-Forwarded-Encrypted: i=1; AJvYcCVoffCMmWJUEJ4TRxF7TUYLOUY7msmlJzIsqq3pY1Ew/c89K45xztJszUD+Bo5yTugz90+91yt8R1c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVvUeX/l5LygwkXZM0Lh3cu1VxWJqH2MY+NRMT3r2nNpi1a8Pw
	DabYe1iGWGlHnyfjjqkkIHe0WBPcgM8PgwHhnL2ONv0WRyYBGRTb
X-Gm-Gg: ASbGncvFVW/R4up7E+OUxOR3YC4AxTz2fL2mtMc1kkb9ibskw8l8X2Ps8nnW0V6DbgY
	GFZ0KTTYZEC0BvDy5V2ZEvmn+rl1ColKic/2iP+1e54a/i4ZhT1Bs5aj6YdWsHR33loYKTShNAQ
	Lh0mOeBfdOwn+aUYm6I21/nUp3IOiWadbYDPwQEWknGPufR3sLzxNgMEjdW3AJm4E5E/4cErpjn
	Ql9qZjB04zlSiPR4RF5qV+0sSTMueCPzdHK58MVYpeztTszFqZkAnkIhOkigQDI+lfpDrgjuliM
	AZ2s709naDqhMI21Qtqz2iiuS1Tl4CkVt6PPJ1alUSuvYFYdpSeLWZdJLl/zcIALnDwP0nvwDDW
	n2S4/HRPc0hXhYXmT3wJJbg==
X-Google-Smtp-Source: AGHT+IFaPusiZQT0QiFcyLJp0TXK65g3+z16rgMNv9l2dKvCZ0RLPJLCBzoBrYTr6CV/HfnsWx9kLw==
X-Received: by 2002:a05:600c:8519:b0:43d:300f:fa51 with SMTP id 5b1f17b1804b1-43f3a93ebb3mr115773795e9.9.1744650792986;
        Mon, 14 Apr 2025 10:13:12 -0700 (PDT)
Message-ID: <0f4f2ed70829fffb2eb816e34e26be22681705a5.camel@gmail.com>
Subject: Re: [RFC PATCH v1 13/15] x86/msr: Use the alternatives mechanism to
 read MSR
From: Francesco Lavra <francescolavra.fl@gmail.com>
To: xin@zytor.com
Cc: acme@kernel.org, adrian.hunter@intel.com, ajay.kaher@broadcom.com, 
 alexander.shishkin@linux.intel.com, alexey.amakhalov@broadcom.com, 
 andrew.cooper3@citrix.com, bcm-kernel-feedback-list@broadcom.com, 
 boris.ostrovsky@oracle.com, bp@alien8.de, bpf@vger.kernel.org, 
 dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com, 
 hpa@zytor.com, irogers@google.com, jgross@suse.com, jolsa@kernel.org, 
 kan.liang@linux.intel.com, kvm@vger.kernel.org, kys@microsoft.com, 
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org,
 llvm@lists.linux.dev,  luto@kernel.org, mark.rutland@arm.com,
 mingo@redhat.com, namhyung@kernel.org,  pbonzini@redhat.com,
 peterz@infradead.org, seanjc@google.com, tglx@linutronix.de, 
 tony.luck@intel.com, virtualization@lists.linux.dev, vkuznets@redhat.com, 
 wei.liu@kernel.org, x86@kernel.org, xen-devel@lists.xenproject.org
Date: Mon, 14 Apr 2025 19:13:09 +0200
In-Reply-To: <20250331082251.3171276-14-xin@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0

On 2025-03-31 at 8:22, Xin Li (Intel) wrote:
> diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
> index e672632b1cc0..6e7a9daa03d4 100644
> --- a/arch/x86/xen/xen-asm.S
> +++ b/arch/x86/xen/xen-asm.S
> @@ -399,3 +399,37 @@ SYM_CODE_END(xen_entry_SYSCALL_compat)
>  	RET
>  SYM_FUNC_END(asm_xen_write_msr)
>  EXPORT_SYMBOL_GPL(asm_xen_write_msr)
> +
> +/*
> + * The prototype of the Xen C code:
> + * 	struct { u64 val, bool done } xen_do_read_msr(u32 msr)
> + */
> +SYM_FUNC_START(asm_xen_read_msr)
> +	ENDBR
> +	FRAME_BEGIN
> +	XEN_SAVE_CALLEE_REGS_FOR_MSR
> +	mov %ecx, %edi		/* MSR number */
> +	call xen_do_read_msr
> +	test %dl, %dl		/* %dl=3D1, i.e., ZF=3D0, meaning
> successfully done */
> +	XEN_RESTORE_CALLEE_REGS_FOR_MSR
> +	jnz 2f
> +
> +1:	rdmsr
> +	_ASM_EXTABLE_FUNC_REWIND(1b, -5, FRAME_OFFSET /
> (BITS_PER_LONG / 8))
> +	shl $0x20, %rdx
> +	or %rdx, %rax
> +	/*
> +	 * The top of the stack points directly at the return
> address;
> +	 * back up by 5 bytes from the return address.
> +	 */

This works only if this function has been called directly (e.g. via
`call asm_xen_write_msr`), but doesn't work with alternative call types
(like indirect calls). Not sure why one might want to use an indirect
call to invoke asm_xen_write_msr, but this creates a hidden coupling
between caller and callee.
I don't have a suggestion on how to get rid of this coupling, other
than setting ipdelta in _ASM_EXTABLE_FUNC_REWIND() to 0 and adjusting
the _ASM_EXTABLE_TYPE entries at the call sites to consider the
instruction that follows the function call (instead of the call
instruction) as the faulting instruction (which seems pretty ugly, at
least because what follows the function call could be an instruction
that might itself fault). But you may want to make this caveat explicit
in the comment.

