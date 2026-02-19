Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OGnNn0Ll2kcuAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:09:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0563F15EEB3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236249.1538984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt3lu-0002l2-TX; Thu, 19 Feb 2026 13:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236249.1538984; Thu, 19 Feb 2026 13:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt3lu-0002jE-Qc; Thu, 19 Feb 2026 13:08:46 +0000
Received: by outflank-mailman (input) for mailman id 1236249;
 Thu, 19 Feb 2026 13:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yoN0=AX=bounce.vates.tech=bounce-md_30504962.69970b58.v1-bb76dc39ba5247aa8f7d123dbbb7a841@srs-se1.protection.inumbo.net>)
 id 1vt3lt-0002j8-Jl
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 13:08:45 +0000
Received: from mail145-20.atl61.mandrillapp.com
 (mail145-20.atl61.mandrillapp.com [198.2.145.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d0b5caf-0d94-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 14:08:42 +0100 (CET)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-20.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4fGtx472t9zCf9KLH
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 13:08:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bb76dc39ba5247aa8f7d123dbbb7a841; Thu, 19 Feb 2026 13:08:40 +0000
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
X-Inumbo-ID: 1d0b5caf-0d94-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771506521; x=1771776521;
	bh=/fo12rAPwmkJaFjqfpPkWAjleZNdG1jgC/lHmOpnuYs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ePKgnaMeaEllxd5sF2U8uuqH8FnHCjy6Ze3YFPX2Dwih3zwe25zJBqGUcqmfsd2L4
	 H80KhC6OLtAyEuLdAPkKll0SL9ClyPHYbeyDb8mA8LJeyugm3YAgE3ubp6GqYfyEnX
	 dO5CuwFsTOq+Ui0V6b34KTYyTXLDaekY/F1AMbP33z+Py+EEaMNRkGItml0ZhnBGVL
	 IUE/LnLgk618YCuL9/iT+EwUpclJxRXxhyHM/s8lRsHKHCRQmBebvBlPD6vRzz48WV
	 QrvjiZhABcV7o39OPOjxkd87J5M17DSbg801e4wN8f8u5UGnDzPnfBfXs76+drh/wG
	 RXsA2ZEaFYLIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771506521; x=1771767021; i=julian.vetter@vates.tech;
	bh=/fo12rAPwmkJaFjqfpPkWAjleZNdG1jgC/lHmOpnuYs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jLeATzysIUb8DC2nIT7lVvggQHNR0fkA2zLUr/xmFwJIeyLOTw7HejwUZ72mkX3JS
	 7zhc2yRX2soGZ9MsdVtY/1BUS6HDAOQjHMp3l3eZCAx3JsmaLmM2LpKPGNB/eLoOmn
	 PS01t4PT7W6zL/bF5RyK2liS8BUyxVxMk9GuuRS+oQABnp67YqNRfs1mTvqfRrfkIZ
	 91OBWyOpNL1T5lNEFFatzPuEZsWBRUXR8BCgQkN5zWewNfHn59VUneyyuovYftJByy
	 TayYWzgiyEA+H83aZmeK3tHgSZACbQPqh6eKeF34KSF/uzdWPLkIMR/qMchbCo8OB2
	 JUKZy/dXf+5QQ==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/hvm:=20Advertise=20and=20support=20extended=20destination=20IDs=20for=20MSI/IO-APIC?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771506519994
Message-Id: <d3b71e9b-c026-4cda-99cc-a8037f302bd5@vates.tech>
To: "Teddy Astie" <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <20260209113412.2603088-1-julian.vetter@vates.tech> <87be26c1-52fe-438f-8aad-1d5ea0f0a325@vates.tech>
In-Reply-To: <87be26c1-52fe-438f-8aad-1d5ea0f0a325@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bb76dc39ba5247aa8f7d123dbbb7a841?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260219:md
Date: Thu, 19 Feb 2026 13:08:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:mid,vates.tech:dkim,vates.tech:url,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.641];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0563F15EEB3
X-Rspamd-Action: no action

On 2/9/26 14:40, Teddy Astie wrote:
> Hello,
> 
> Some comments, mostly code style, nothing functionnal.
> 
> Le 09/02/2026 =C3=A0 12:36, Julian Vetter a =C3=A9crit=C2=A0:
>> x2APIC guests with more than 128 vCPUs have APIC IDs above 255, but MSI
>> addresses and IO-APIC RTEs only provide an 8-bit destination field.
>> Without extended destination ID support, Linux limits the maximum usable
>> APIC ID to 255, refusing to bring up vCPUs beyond that limit. So,
>> advertise XEN_HVM_CPUID_EXT_DEST_ID in the HVM hypervisor CPUID leaf,
>> signalling that guests may use MSI address bits 11:5 and IO-APIC RTE
>> bits 55:49 as additional high destination ID bits. This expands the
>> destination ID from 8 to 15 bits.
>>
>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
>> ---
>>    xen/arch/x86/cpuid.c                   |  9 +++++++++
>>    xen/arch/x86/hvm/irq.c                 | 11 ++++++++++-
>>    xen/arch/x86/hvm/vioapic.c             |  2 +-
>>    xen/arch/x86/hvm/vmsi.c                |  4 ++--
>>    xen/arch/x86/include/asm/hvm/hvm.h     |  4 ++--
>>    xen/arch/x86/include/asm/hvm/vioapic.h | 13 +++++++++++++
>>    xen/arch/x86/include/asm/msi.h         |  3 +++
>>    7 files changed, 40 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
>> index d85be20d86..fb17c71d74 100644
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -148,6 +148,15 @@ static void cpuid_hypervisor_leaves(const struct vc=
pu *v, uint32_t leaf,
>>            res->a |=3D XEN_HVM_CPUID_DOMID_PRESENT;
>>            res->c =3D d->domain_id;
>>    
>> +        /*
>> +         * Advertise extended destination ID support. This allows guest=
s to use
>> +         * bits 11:5 of the MSI address and bits 55:49 of the IO-APIC R=
TE for
>> +         * additional destination ID bits, expanding the addressable AP=
IC ID
>> +         * range from 8 to 15 bits. This is required for x2APIC guests =
with
>> +         * APIC IDs > 255.
>> +         */
>> +        res->a |=3D XEN_HVM_CPUID_EXT_DEST_ID;
>> +
>>            /*
>>             * Per-vCPU event channel upcalls are implemented and work
>>             * correctly with PIRQs routed over event channels.
>> diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
>> index 5f64361113..2cc14d37d4 100644
>> --- a/xen/arch/x86/hvm/irq.c
>> +++ b/xen/arch/x86/hvm/irq.c
>> @@ -374,7 +374,16 @@ int hvm_set_pci_link_route(struct domain *d, u8 lin=
k, u8 isa_irq)
>>    int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
>>    {
>>        uint32_t tmp =3D (uint32_t) addr;
>> -    uint8_t  dest =3D (tmp & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID=
_SHIFT;
>> +    /*
>> +     * Standard MSI destination: address bits 19:12 (8 bits).
>> +     * Extended MSI destination: address bits 11:5 (7 more bits).
>> +     * When XEN_HVM_CPUID_EXT_DEST_ID is advertised, the guest may use
>> +     * bits 11:5 for high destination ID bits, expanding to 15 bits tot=
al.
> 
> As we always advertise XEN_HVM_CPUID_EXT_DEST_ID, I would rather say
> 
>   > As XEN_HVM_CPUID_EXT_DEST_ID is advertised, ...
> 
>> +     * For legacy guests these bits are 0, so this is backwards-compati=
ble.
> 
> "Guests unaware of this feature set these bits to 0, ..."
> 
>> +     */
>> +    uint32_t dest =3D
>> +        (((tmp & MSI_ADDR_EXT_DEST_ID_MASK) >> MSI_ADDR_EXT_DEST_ID_SHI=
FT) << 8) |
>> +        ((tmp & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID_SHIFT);
> 
> I wonder if we should introduce a macro like you did for IO-APIC
> (VIOAPIC_RTE_DEST).
> 
>>        uint8_t  dest_mode =3D !!(tmp & MSI_ADDR_DESTMODE_MASK);
>>        uint8_t  delivery_mode =3D (data & MSI_DATA_DELIVERY_MODE_MASK)
>>            >> MSI_DATA_DELIVERY_MODE_SHIFT;
>> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
>> index 7c725f9e47..263b1bd5cb 100644
>> --- a/xen/arch/x86/hvm/vioapic.c
>> +++ b/xen/arch/x86/hvm/vioapic.c
>> @@ -411,7 +411,7 @@ static void ioapic_inj_irq(
>>    
>>    static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int=
 pin)
>>    {
>> -    uint16_t dest =3D vioapic->redirtbl[pin].fields.dest_id;
>> +    uint32_t dest =3D VIOAPIC_RTE_DEST(vioapic->redirtbl[pin].bits);
> 
> I would rather introduce a new field in vioapic_redir_entry for the
> extended dest part; and compute dest from that and dest_id.

Here I have a question. This struct is a public ABI struct. 
vioapic_redir_entry is defined in 
xen/include/public/arch-x86/hvm/save.h. It's part of XENs VM 
save/restore operation. It is used by libxc and toolstacks to migrate 
VMs between hosts. Changing the struct might be undesirable? Yes, it 
would make the code cleaner. having a bit entry for the extended dest 
bits. What's the general opinion on this? With the VIOAPIC_RTE_DEST 
macro I avoided touching this struct...

> 
>>        uint8_t dest_mode =3D vioapic->redirtbl[pin].fields.dest_mode;
>>        uint8_t delivery_mode =3D vioapic->redirtbl[pin].fields.delivery_=
mode;
>>        uint8_t vector =3D vioapic->redirtbl[pin].fields.vector;
>> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
>> index 27b1f089e2..dca191b4f1 100644
>> --- a/xen/arch/x86/hvm/vmsi.c
>> +++ b/xen/arch/x86/hvm/vmsi.c
>> @@ -66,7 +66,7 @@ static void vmsi_inj_irq(
>>    
>>    int vmsi_deliver(
>>        struct domain *d, int vector,
>> -    uint8_t dest, uint8_t dest_mode,
>> +    uint32_t dest, uint8_t dest_mode,
>>        uint8_t delivery_mode, uint8_t trig_mode)
>>    {
>>        struct vlapic *target;
>> @@ -125,7 +125,7 @@ void vmsi_deliver_pirq(struct domain *d, const struc=
t hvm_pirq_dpci *pirq_dpci)
>>    }
>>    
>>    /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id *=
/
>> -int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t des=
t_mode)
>> +int hvm_girq_dest_2_vcpu_id(struct domain *d, uint32_t dest, uint8_t de=
st_mode)
>>    {
>>        int dest_vcpu_id =3D -1, w =3D 0;
>>        struct vcpu *v;
>> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/a=
sm/hvm/hvm.h
>> index 7d9774df59..11256d5e67 100644
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -295,11 +295,11 @@ uint64_t hvm_get_guest_time_fixed(const struct vcp=
u *v, uint64_t at_tsc);
>>    
>>    int vmsi_deliver(
>>        struct domain *d, int vector,
>> -    uint8_t dest, uint8_t dest_mode,
>> +    uint32_t dest, uint8_t dest_mode,
>>        uint8_t delivery_mode, uint8_t trig_mode);
>>    struct hvm_pirq_dpci;
>>    void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *=
pirq_dpci);
>> -int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t des=
t_mode);
>> +int hvm_girq_dest_2_vcpu_id(struct domain *d, uint32_t dest, uint8_t de=
st_mode);
>>    
>>    enum hvm_intblk
>>    hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack);
>> diff --git a/xen/arch/x86/include/asm/hvm/vioapic.h b/xen/arch/x86/inclu=
de/asm/hvm/vioapic.h
>> index 68af6dce79..b49eb348d5 100644
>> --- a/xen/arch/x86/include/asm/hvm/vioapic.h
>> +++ b/xen/arch/x86/include/asm/hvm/vioapic.h
>> @@ -32,6 +32,19 @@
>>    #define VIOAPIC_EDGE_TRIG  0
>>    #define VIOAPIC_LEVEL_TRIG 1
>>    
>> +/*
>> + * Extract the destination ID from a 64-bit IO-APIC RTE, including the
>> + * extended bits (55:49) used when XEN_HVM_CPUID_EXT_DEST_ID is adverti=
sed.
>> + */
>> +#define IO_APIC_REDIR_DEST_SHIFT        56
>> +#define IO_APIC_REDIR_DEST_MASK         0xffULL
>> +#define IO_APIC_REDIR_EXT_DEST_SHIFT    49
>> +#define IO_APIC_REDIR_EXT_DEST_MASK     0x7fULL
>> +
>> +#define VIOAPIC_RTE_DEST(rte) \
>> +    ((((rte) >> IO_APIC_REDIR_DEST_SHIFT) & IO_APIC_REDIR_DEST_MASK) | =
\
>> +     (((rte) >> IO_APIC_REDIR_EXT_DEST_SHIFT) & IO_APIC_REDIR_EXT_DEST_=
MASK) << 8)
>> +
>>    #define VIOAPIC_DEFAULT_BASE_ADDRESS  0xfec00000U
>>    #define VIOAPIC_MEM_LENGTH            0x100
>>    
>> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/m=
si.h
>> index 00059d4a3a..b7a132e5b5 100644
>> --- a/xen/arch/x86/include/asm/msi.h
>> +++ b/xen/arch/x86/include/asm/msi.h
>> @@ -54,6 +54,9 @@
>>    #define=09 MSI_ADDR_DEST_ID_MASK=09=090x00ff000
>>    #define  MSI_ADDR_DEST_ID(dest)=09=09(((dest) << MSI_ADDR_DEST_ID_SHI=
FT) & MSI_ADDR_DEST_ID_MASK)
>>    
>> +#define MSI_ADDR_EXT_DEST_ID_SHIFT=095
>> +#define MSI_ADDR_EXT_DEST_ID_MASK=090x0000fe0
>> +
>>    /* MAX fixed pages reserved for mapping MSIX tables. */
>>    #define FIX_MSIX_MAX_PAGES              512
>>    
> 
> 
> 
> --
> Teddy Astie | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



