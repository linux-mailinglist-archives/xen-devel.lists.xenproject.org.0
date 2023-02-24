Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6CE6A1782
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 08:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500779.772269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVSpe-0005Nd-5a; Fri, 24 Feb 2023 07:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500779.772269; Fri, 24 Feb 2023 07:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVSpe-0005Lw-2N; Fri, 24 Feb 2023 07:49:30 +0000
Received: by outflank-mailman (input) for mailman id 500779;
 Fri, 24 Feb 2023 07:49:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVSpc-0005Lo-Mi
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 07:49:28 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c337ad20-b417-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 08:49:27 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id s26so51447225edw.11
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 23:49:27 -0800 (PST)
Received: from [192.168.1.93] (adsl-185.109.242.138.tellas.gr.
 [109.242.138.185]) by smtp.gmail.com with ESMTPSA id
 f3-20020a1709064dc300b008d5183c1e20sm5817225ejw.190.2023.02.23.23.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:49:26 -0800 (PST)
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
X-Inumbo-ID: c337ad20-b417-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6EIuE8IiS1yq9TPJJ+03OXKJdlmDGL+kBrVOrx4FEo=;
        b=T3egfQTWqq79AH1MY8MbekjomcUgyGcENtZQ7FS9P8Y/2XZLELOP6YyAGRdi7Lf2Vr
         /ZvZx6sOVS+BngP2wUpwPs69t8zrE1kg6zlrL2EJGm5+VTBV/GIM6KNoHxo6noLdk5pf
         FYbO8T6mHivmOd5L1al72skRPlupTi3S21WrKmW/I1flVNZetPdFYmHV/9KW9N9IhwyB
         vI2V9cjbhK5Fzjjhx6I4aX5/NFRIOJbTinVpi3nHwngzMCcHdSDKX0g1F0LTzBdjPQSr
         rehyT3gH/QdzZW8i+UgIOirG7M1kCOhxJ8JfMEYWYDpsogpneNJvztunJ+UsqXz932HZ
         4TbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6EIuE8IiS1yq9TPJJ+03OXKJdlmDGL+kBrVOrx4FEo=;
        b=KhZy60T6/FkY+0Pyki9NL/fkThSBE/DdyhMIahd51OU+O1pd5uUXrb6y6ABDStAbdo
         glD1ETQSxksqV8QIOfNWcfBLQTitn+2npMi32aizJu03zRwplu85u3MUKO+/hiJxTlnj
         AO4qL1RKF2dfB+IKDY5i/xxbynJeDTunysUw6hOhgNWBpCQ4Tj14Ofj3fnLBRGxm5Ju2
         k4df/u56SwyPgHg5nQHvcyzItb79S8dHy0HJqt+pfDvlPDAE8cd+RfIa7EDDMReFhbed
         BSAQxBGuNxN07vgDC0g5pByvpQ7Do6LLd7wt4pUKN6E76QAOdu7Mtp6xk8Dg4zCaNYPF
         ME6Q==
X-Gm-Message-State: AO0yUKVxJaLpY5aYb29R61Ml9T5FrHZPfk89TCaL5Cid8pU5jk2CnLqL
	2y55VjpvldwvEVVt5MYyaxL5HeDjIVw=
X-Google-Smtp-Source: AK7set+zNjwWJX4a7MKhegDubQIgGgtjA6OvhPTLH1g53GDlXKy8/SM6HKERJUOSnrReJEFPEOhvIg==
X-Received: by 2002:a17:906:f28b:b0:870:b950:18d4 with SMTP id gu11-20020a170906f28b00b00870b95018d4mr23155818ejb.5.1677224966550;
        Thu, 23 Feb 2023 23:49:26 -0800 (PST)
Message-ID: <37e79367-70b6-f541-ccd8-7ce797082756@gmail.com>
Date: Fri, 24 Feb 2023 09:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 6/9] x86/vmx: move declations used only by vmx code
 from vmx.h to private header
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-7-burzalodowa@gmail.com>
 <0f169088-53bc-afe5-8f10-970c17f261b7@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <0f169088-53bc-afe5-8f10-970c17f261b7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 2/23/23 12:47, Jan Beulich wrote:
> On 22.02.2023 13:00, Xenia Ragiadakou wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/hvm/vmx/vmx.h
>> @@ -0,0 +1,459 @@
>> +#include <xen/sched.h>
>> +
>> +#include <asm/asm_defns.h>
>> +#include <asm/hvm/vmx/vmcs.h>
>> +#include <asm/hvm/vmx/vmx.h>
>> +#include <asm/types.h>
> 
> As in the earlier patch, please use xen/types.h right away.
> 
>> +extern int8_t opt_ept_exec_sp;
>> +
>> +#define PI_xAPIC_NDST_MASK      0xFF00
>> +
>> +void vmx_asm_vmexit_handler(struct cpu_user_regs);
> 
> Even if it was like this originally, this is bogus. This not-really-a-
> function doesn't take any parameters. It's declaration also looks to be
> missing cf_check - Andrew, was this deliberate?
> 
>> +void vmx_intr_assist(void);
>> +void noreturn cf_check vmx_do_resume(void);
>> +void cf_check vmx_vlapic_msr_changed(struct vcpu *v);
>> +void vmx_realmode(struct cpu_user_regs *regs);
>> +void vmx_update_debug_state(struct vcpu *v);
>> +void vmx_update_exception_bitmap(struct vcpu *v);
>> +void vmx_update_cpu_exec_control(struct vcpu *v);
>> +void vmx_update_secondary_exec_control(struct vcpu *v);
>> +
>> +#define POSTED_INTR_ON  0
>> +#define POSTED_INTR_SN  1
>> +static inline int pi_test_and_set_pir(uint8_t vector, struct pi_desc *pi_desc)
> 
> Nit: Blank line please after the #define-s.
> 
>> +{
>> +    return test_and_set_bit(vector, pi_desc->pir);
>> +}
>> +
>> +static inline int pi_test_pir(uint8_t vector, const struct pi_desc *pi_desc)
>> +{
>> +    return test_bit(vector, pi_desc->pir);
>> +}
>> +
>> +static inline int pi_test_and_set_on(struct pi_desc *pi_desc)
>> +{
>> +    return test_and_set_bit(POSTED_INTR_ON, &pi_desc->control);
>> +}
>> +
>> +static inline void pi_set_on(struct pi_desc *pi_desc)
>> +{
>> +    set_bit(POSTED_INTR_ON, &pi_desc->control);
>> +}
>> +
>> +static inline int pi_test_and_clear_on(struct pi_desc *pi_desc)
>> +{
>> +    return test_and_clear_bit(POSTED_INTR_ON, &pi_desc->control);
>> +}
>> +
>> +static inline int pi_test_on(struct pi_desc *pi_desc)
>> +{
>> +    return pi_desc->on;
>> +}
>> +
>> +static inline unsigned long pi_get_pir(struct pi_desc *pi_desc, int group)
>> +{
>> +    return xchg(&pi_desc->pir[group], 0);
>> +}
>> +
>> +static inline int pi_test_sn(struct pi_desc *pi_desc)
>> +{
>> +    return pi_desc->sn;
>> +}
>> +
>> +static inline void pi_set_sn(struct pi_desc *pi_desc)
>> +{
>> +    set_bit(POSTED_INTR_SN, &pi_desc->control);
>> +}
>> +
>> +static inline void pi_clear_sn(struct pi_desc *pi_desc)
>> +{
>> +    clear_bit(POSTED_INTR_SN, &pi_desc->control);
>> +}
> 
> Considering all of these are currently used by vmx.c only I wonder whether
> we shouldn't go a step further and put the posted-interrupt stuff in its
> own private header.
> 
>> +/*
>> + * Interruption-information format
>> + *
>> + * Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit Qualification
>> + * field for EPT violations, PML full and SPP-related event vmexits.
>> + */
>> +#define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
>> +#define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
>> +#define INTR_INFO_DELIVER_CODE_MASK     0x800           /* 11 */
>> +#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000          /* 12 */
>> +#define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
>> +#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
>> +
>> +/*
>> + * Exit Qualifications for NOTIFY VM EXIT
>> + */
>> +#define NOTIFY_VM_CONTEXT_INVALID       1u
>> +
>> +/*
>> + * Exit Qualifications for MOV for Control Register Access
>> + */
>> +enum {
>> +    VMX_CR_ACCESS_TYPE_MOV_TO_CR,
>> +    VMX_CR_ACCESS_TYPE_MOV_FROM_CR,
>> +    VMX_CR_ACCESS_TYPE_CLTS,
>> +    VMX_CR_ACCESS_TYPE_LMSW,
>> +};
>> +typedef union cr_access_qual {
> 
> Nit: Blank line please again above here.
> 
>> +    unsigned long raw;
>> +    struct {
>> +        uint16_t cr:4,
>> +                 access_type:2,  /* VMX_CR_ACCESS_TYPE_* */
>> +                 lmsw_op_type:1, /* 0 => reg, 1 => mem   */
>> +                 :1,
>> +                 gpr:4,
>> +                 :4;
>> +        uint16_t lmsw_data;
>> +        uint32_t :32;
>> +    };
>> +} __transparent__ cr_access_qual_t;
>> +
>> +/*
>> + * Access Rights
>> + */
>> +#define X86_SEG_AR_SEG_TYPE     0xf        /* 3:0, segment type */
>> +#define X86_SEG_AR_DESC_TYPE    (1u << 4)  /* 4, descriptor type */
>> +#define X86_SEG_AR_DPL          0x60       /* 6:5, descriptor privilege level */
>> +#define X86_SEG_AR_SEG_PRESENT  (1u << 7)  /* 7, segment present */
>> +#define X86_SEG_AR_AVL          (1u << 12) /* 12, available for system software */
>> +#define X86_SEG_AR_CS_LM_ACTIVE (1u << 13) /* 13, long mode active (CS only) */
>> +#define X86_SEG_AR_DEF_OP_SIZE  (1u << 14) /* 14, default operation size */
>> +#define X86_SEG_AR_GRANULARITY  (1u << 15) /* 15, granularity */
>> +#define X86_SEG_AR_SEG_UNUSABLE (1u << 16) /* 16, segment unusable */
>> +
>> +extern uint8_t posted_intr_vector;
>> +
>> +#define INVEPT_SINGLE_CONTEXT   1
>> +#define INVEPT_ALL_CONTEXT      2
>> +
>> +#define INVVPID_INDIVIDUAL_ADDR                 0
>> +#define INVVPID_SINGLE_CONTEXT                  1
>> +#define INVVPID_ALL_CONTEXT                     2
>> +#define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
>> +
>> +static always_inline void __vmptrld(u64 addr)
>> +{
>> +    asm volatile (
>> +#ifdef HAVE_AS_VMX
>> +                   "vmptrld %0\n"
>> +#else
>> +                   VMPTRLD_OPCODE MODRM_EAX_06
>> +#endif
>> +                   /* CF==1 or ZF==1 --> BUG() */
>> +                   UNLIKELY_START(be, vmptrld)
>> +                   _ASM_BUGFRAME_TEXT(0)
>> +                   UNLIKELY_END_SECTION
>> +                   :
>> +#ifdef HAVE_AS_VMX
>> +                   : "m" (addr),
>> +#else
>> +                   : "a" (&addr),
>> +#endif
>> +                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
>> +                   : "memory");
>> +}
>> +
>> +static always_inline void __vmpclear(u64 addr)
>> +{
>> +    asm volatile (
>> +#ifdef HAVE_AS_VMX
>> +                   "vmclear %0\n"
>> +#else
>> +                   VMCLEAR_OPCODE MODRM_EAX_06
>> +#endif
>> +                   /* CF==1 or ZF==1 --> BUG() */
>> +                   UNLIKELY_START(be, vmclear)
>> +                   _ASM_BUGFRAME_TEXT(0)
>> +                   UNLIKELY_END_SECTION
>> +                   :
>> +#ifdef HAVE_AS_VMX
>> +                   : "m" (addr),
>> +#else
>> +                   : "a" (&addr),
>> +#endif
>> +                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
>> +                   : "memory");
>> +}
>> +
>> +static always_inline void __vmwrite(unsigned long field, unsigned long value)
>> +{
>> +    asm volatile (
>> +#ifdef HAVE_AS_VMX
>> +                   "vmwrite %1, %0\n"
>> +#else
>> +                   VMWRITE_OPCODE MODRM_EAX_ECX
>> +#endif
>> +                   /* CF==1 or ZF==1 --> BUG() */
>> +                   UNLIKELY_START(be, vmwrite)
>> +                   _ASM_BUGFRAME_TEXT(0)
>> +                   UNLIKELY_END_SECTION
>> +                   :
>> +#ifdef HAVE_AS_VMX
>> +                   : "r" (field) , "rm" (value),
>> +#else
>> +                   : "a" (field) , "c" (value),
>> +#endif
>> +                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
>> +        );
>> +}
>> +
>> +
>> +#ifdef HAVE_AS_VMX
> 
> Nit: No double blank lines please (there's at least one more instance
> further down).
> 
>> +# define GAS_VMX_OP(yes, no) yes
>> +#else
>> +# define GAS_VMX_OP(yes, no) no
>> +#endif
>> +
>> +static inline enum vmx_insn_errno vmread_safe(unsigned long field,
>> +                                              unsigned long *value)
>> +{
>> +    unsigned long ret = VMX_INSN_SUCCEED;
>> +    bool fail_invalid, fail_valid;
>> +
>> +    asm volatile ( GAS_VMX_OP("vmread %[field], %[value]\n\t",
>> +                              VMREAD_OPCODE MODRM_EAX_ECX)
>> +                   ASM_FLAG_OUT(, "setc %[invalid]\n\t")
>> +                   ASM_FLAG_OUT(, "setz %[valid]\n\t")
>> +                   : ASM_FLAG_OUT("=@ccc", [invalid] "=rm") (fail_invalid),
>> +                     ASM_FLAG_OUT("=@ccz", [valid] "=rm") (fail_valid),
>> +                     [value] GAS_VMX_OP("=rm", "=c") (*value)
>> +                   : [field] GAS_VMX_OP("r", "a") (field));
>> +
>> +    if ( unlikely(fail_invalid) )
>> +        ret = VMX_INSN_FAIL_INVALID;
>> +    else if ( unlikely(fail_valid) )
>> +        __vmread(VM_INSTRUCTION_ERROR, &ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static inline enum vmx_insn_errno vmwrite_safe(unsigned long field,
>> +                                               unsigned long value)
>> +{
>> +    unsigned long ret = VMX_INSN_SUCCEED;
>> +    bool fail_invalid, fail_valid;
>> +
>> +    asm volatile ( GAS_VMX_OP("vmwrite %[value], %[field]\n\t",
>> +                              VMWRITE_OPCODE MODRM_EAX_ECX)
>> +                   ASM_FLAG_OUT(, "setc %[invalid]\n\t")
>> +                   ASM_FLAG_OUT(, "setz %[valid]\n\t")
>> +                   : ASM_FLAG_OUT("=@ccc", [invalid] "=rm") (fail_invalid),
>> +                     ASM_FLAG_OUT("=@ccz", [valid] "=rm") (fail_valid)
>> +                   : [field] GAS_VMX_OP("r", "a") (field),
>> +                     [value] GAS_VMX_OP("rm", "c") (value));
>> +
>> +    if ( unlikely(fail_invalid) )
>> +        ret = VMX_INSN_FAIL_INVALID;
>> +    else if ( unlikely(fail_valid) )
>> +        __vmread(VM_INSTRUCTION_ERROR, &ret);
>> +
>> +    return ret;
>> +}
>> +
>> +#undef GAS_VMX_OP
>> +
>> +
>> +static always_inline void __invept(unsigned long type, uint64_t eptp)
>> +{
>> +    struct {
>> +        uint64_t eptp, rsvd;
>> +    } operand = { eptp };
>> +
>> +    /*
>> +     * If single context invalidation is not supported, we escalate to
>> +     * use all context invalidation.
>> +     */
>> +    if ( (type == INVEPT_SINGLE_CONTEXT) &&
>> +         !cpu_has_vmx_ept_invept_single_context )
>> +        type = INVEPT_ALL_CONTEXT;
>> +
>> +    asm volatile (
>> +#ifdef HAVE_AS_EPT
>> +                   "invept %0, %1\n"
>> +#else
>> +                   INVEPT_OPCODE MODRM_EAX_08
>> +#endif
>> +                   /* CF==1 or ZF==1 --> BUG() */
>> +                   UNLIKELY_START(be, invept)
>> +                   _ASM_BUGFRAME_TEXT(0)
>> +                   UNLIKELY_END_SECTION
>> +                   :
>> +#ifdef HAVE_AS_EPT
>> +                   : "m" (operand), "r" (type),
>> +#else
>> +                   : "a" (&operand), "c" (type),
>> +#endif
>> +                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
>> +                   : "memory" );
>> +}
>> +
>> +static always_inline void __invvpid(unsigned long type, u16 vpid, u64 gva)
>> +{
>> +    struct __packed {
>> +        u64 vpid:16;
>> +        u64 rsvd:48;
>> +        u64 gva;
>> +    }  operand = {vpid, 0, gva};
> 
> I don't think __packed is needed here. I wonder if it could be dropped as
> you move the code. In any event, here and elsewhere, u64 -> uint64_t (and
> alike) please.
> 
>> +    /* Fix up #UD exceptions which occur when TLBs are flushed before VMXON. */
>> +    asm volatile ( "1: "
>> +#ifdef HAVE_AS_EPT
>> +                   "invvpid %0, %1\n"
>> +#else
>> +                   INVVPID_OPCODE MODRM_EAX_08
>> +#endif
>> +                   /* CF==1 or ZF==1 --> BUG() */
>> +                   UNLIKELY_START(be, invvpid)
>> +                   _ASM_BUGFRAME_TEXT(0)
>> +                   UNLIKELY_END_SECTION "\n"
>> +                   "2:"
>> +                   _ASM_EXTABLE(1b, 2b)
>> +                   :
>> +#ifdef HAVE_AS_EPT
>> +                   : "m" (operand), "r" (type),
>> +#else
>> +                   : "a" (&operand), "c" (type),
>> +#endif
>> +                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
>> +                   : "memory" );
>> +}
>> +
>> +static inline void ept_sync_all(void)
>> +{
>> +    __invept(INVEPT_ALL_CONTEXT, 0);
>> +}
>> +
>> +static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
>> +{
>> +    int type = INVVPID_INDIVIDUAL_ADDR;
>> +
>> +    /*
>> +     * If individual address invalidation is not supported, we escalate to
>> +     * use single context invalidation.
>> +     */
>> +    if ( likely(cpu_has_vmx_vpid_invvpid_individual_addr) )
>> +        goto execute_invvpid;
>> +
>> +    type = INVVPID_SINGLE_CONTEXT;
>> +
>> +    /*
>> +     * If single context invalidation is not supported, we escalate to
>> +     * use all context invalidation.
>> +     */
>> +    if ( !cpu_has_vmx_vpid_invvpid_single_context )
>> +        type = INVVPID_ALL_CONTEXT;
>> +
>> +execute_invvpid:
> 
> Nit (style): Labels indented by at least one blank please.
> 
>> +    __invvpid(type, v->arch.hvm.n1asid.asid, (u64)gva);
>> +}
>> +
>> +static inline void vpid_sync_all(void)
>> +{
>> +    __invvpid(INVVPID_ALL_CONTEXT, 0, 0);
>> +}
>> +
>> +static inline void __vmxoff(void)
>> +{
>> +    asm volatile (
>> +        VMXOFF_OPCODE
>> +        : : : "memory" );
> 
> All on a single line perhaps?
> 
>> +}
>> +
>> +static inline int __vmxon(u64 addr)
>> +{
>> +    int rc;
>> +
>> +    asm volatile (
>> +        "1: " VMXON_OPCODE MODRM_EAX_06 "\n"
>> +        "   setna %b0 ; neg %0\n" /* CF==1 or ZF==1 --> rc = -1 */
>> +        "2:\n"
>> +        ".section .fixup,\"ax\"\n"
>> +        "3: sub $2,%0 ; jmp 2b\n"    /* #UD or #GP --> rc = -2 */
>> +        ".previous\n"
>> +        _ASM_EXTABLE(1b, 3b)
>> +        : "=q" (rc)
>> +        : "0" (0), "a" (&addr)
>> +        : "memory");
> 
> Nit: Missing blank before final parenthesis. Would also be nice if the
> comments lined up.
> 
>> +    return rc;
>> +}
>> +
>> +int cf_check vmx_guest_x86_mode(struct vcpu *v);
>> +unsigned int vmx_get_cpl(void);
>> +void vmx_inject_extint(int trap, uint8_t source);
>> +void vmx_inject_nmi(void);
>> +
>> +void update_guest_eip(void);
>> +
>> +void vmx_pi_per_cpu_init(unsigned int cpu);
>> +void vmx_pi_desc_fixup(unsigned int cpu);
>> +
>> +void vmx_sync_exit_bitmap(struct vcpu *v);
>> +
>> +#define APIC_INVALID_DEST           0xffffffff
>> +
>> +/* #VE information page */
>> +typedef struct {
>> +    u32 exit_reason;
>> +    u32 semaphore;
>> +    u64 exit_qualification;
>> +    u64 gla;
>> +    u64 gpa;
>> +    u16 eptp_index;
>> +} ve_info_t;
>> +
>> +/* VM-Exit instruction info for LIDT, LGDT, SIDT, SGDT */
>> +typedef union idt_or_gdt_instr_info {
>> +    unsigned long raw;
>> +    struct {
>> +        unsigned long scaling   :2,  /* bits 0:1 - Scaling */
>> +                                :5,  /* bits 6:2 - Undefined */
>> +        addr_size               :3,  /* bits 9:7 - Address size */
>> +                                :1,  /* bit 10 - Cleared to 0 */
>> +        operand_size            :1,  /* bit 11 - Operand size */
>> +                                :3,  /* bits 14:12 - Undefined */
>> +        segment_reg             :3,  /* bits 17:15 - Segment register */
>> +        index_reg               :4,  /* bits 21:18 - Index register */
>> +        index_reg_invalid       :1,  /* bit 22 - Index register invalid */
>> +        base_reg                :4,  /* bits 26:23 - Base register */
>> +        base_reg_invalid        :1,  /* bit 27 - Base register invalid */
>> +        instr_identity          :1,  /* bit 28 - 0:GDT, 1:IDT */
>> +        instr_write             :1,  /* bit 29 - 0:store, 1:load */
>> +                                :34; /* bits 30:63 - Undefined */
>> +    };
>> +} idt_or_gdt_instr_info_t;
>> +
>> +/* VM-Exit instruction info for LLDT, LTR, SLDT, STR */
>> +typedef union ldt_or_tr_instr_info {
>> +    unsigned long raw;
>> +    struct {
>> +        unsigned long scaling   :2,  /* bits 0:1 - Scaling */
>> +                                :1,  /* bit 2 - Undefined */
>> +        reg1                    :4,  /* bits 6:3 - Reg1 */
>> +        addr_size               :3,  /* bits 9:7 - Address size */
>> +        mem_reg                 :1,  /* bit 10 - Mem/Reg */
>> +                                :4,  /* bits 14:11 - Undefined */
>> +        segment_reg             :3,  /* bits 17:15 - Segment register */
>> +        index_reg               :4,  /* bits 21:18 - Index register */
>> +        index_reg_invalid       :1,  /* bit 22 - Index register invalid */
>> +        base_reg                :4,  /* bits 26:23 - Base register */
>> +        base_reg_invalid        :1,  /* bit 27 - Base register invalid */
>> +        instr_identity          :1,  /* bit 28 - 0:LDT, 1:TR */
>> +        instr_write             :1,  /* bit 29 - 0:store, 1:load */
>> +                                :34; /* bits 31:63 - Undefined */
>> +    };
>> +} ldt_or_tr_instr_info_t;
> 
> One file wide remark: I assume you've put things here in the order they
> were in originally. I think it would be nice if some re-arrangement was
> done, e.g. all structures first (unless there's a reason speaking
> against doing so, and of course not including any which are local to
> specific inline functions), then all variable decalarations, all function
> delarations, and finally all inline functions.

Yes I put everything as it was. Thanks for the review I will address all 
your comments above in v3.

I have a question regarding the rearrangement, where are the definitions 
placed (if there is not a semantic relation with some other part)?

> 
> Jan

-- 
Xenia

