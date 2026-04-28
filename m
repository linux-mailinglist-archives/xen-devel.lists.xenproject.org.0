Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOmDOPPR8GnDYwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 17:27:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5288B487D1C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 17:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296473.1572891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHkLP-0005BW-5G; Tue, 28 Apr 2026 15:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296473.1572891; Tue, 28 Apr 2026 15:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHkLP-00059k-2Q; Tue, 28 Apr 2026 15:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1296473;
 Tue, 28 Apr 2026 15:27:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd4b3af44000f373@swg.vates.tech>)
 id 1wHkLN-00058f-QM
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 15:27:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHkLN-00GbAa-65
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 17:27:25 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd4b3af44000f373@swg.vates.tech>)
 id 69f0d1be-e002-0a2a0a5209dd-0a2a450cad4a-36
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 17:27:25 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd4b3af44000f373@swg.vates.tech>)
 id 69f0d1dc-62f1-0a2a450c0019-b9ff1c22855f-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 17:27:25 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dd4b3af44000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Apr 2026 15:27:18 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2104C8620C;
 Tue, 28 Apr 2026 17:27:18 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=gPnfE3i2wg7zvoKVRWncxs/JqV5yt7VVIOEdHbdeNAs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=HcULH9J4pFWUmnj+olzrS5AxKslmG9HFP/nD3BJP5HNFb17TG9JjZjDHGuWu47tM4emhecWE1
 Mk2J9xynXbSYLNM/jsQq4UGHocLXOTjak12JBMqDCo8mNJJS2TpxDJ2sJjxVMU+Ilm/ZkY57J8u
 R3/7mHWpXaaWA4c4sqvDFHyMoGHd/GdTT5aOblgyIvzSccByyHMIZpoQdPiM+EB1ery4j/2kilf
 ISFTN53OsGV9laVZySdvT685d26J6WN5BDoEffmn3Srf9DstavghhyMe/FyCD24L+QlV1sBDo6O
 shnVGWgKc0zCp6CU2urNf0GGQDNkrT8MjJUpYtcJHd2g==
X-Zone-Loop: 30834fa9f8c989e48159e538aa8a3c14ad691e20e635
x-campaign-type: default
x-transaction-id: e521da65-7d7a-45ea-9a09-f9ab5b7d0766
x-swg-uid: 01-23f4bfb3-cba9-4a2e-aa80-ff8c7920cd41
X-Mailer: Sweego
Message-ID:
 <1777390038.8631fc262581453bbf619ec5b2062170.19dd4b3af44000f373@vates.tech>
x-swg-bid: 1777390038.8631fc262581453bbf619ec5b2062170.19dd4b3af44000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 28 Apr 2026 17:27:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] x86/hvm: Support extended destination IDs in
 virtual MSI and IO-APIC
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298081.8631fc262581453bbf619ec5b2062170.19dcf388512000f373@vates.tech>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <1777298081.8631fc262581453bbf619ec5b2062170.19dcf388512000f373@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.eb.c5d8ae115ac7e90e.19dd4b3ad47.d3c253bc4b53bd84=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777390038343
X-purgate-ID: tlsNG-d25034/1777390045-F7A10CF5-9860A5B3/0/0
X-purgate-type: clean
X-purgate-size: 8425
X-Rspamd-Queue-Id: 5288B487D1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.eb.c5d8ae115ac7e90e.19dd4b3ad47.d3c253bc4b53bd84=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27/04/2026 =C3=A0 15:57, Julian Vetter a =C3=A9crit=C2=A0:
> Add IO_APIC_REDIR_DEST_MASK and IO_APIC_REDIR_EXT_DEST_MASK for the
> standard and extended destination fields of the IO-APIC RTE, and a
> VIOAPIC_RTE_DEST() helper that extracts the combined 15-bit destination
> ID=2E Extend the IO-APIC RTE save/restore struct with an ext_dest_id fie=
ld
> so migration preserves the extended bits=2E
>=20
> Use the newly defined masks to extract the full 15-bit destination ID
> from guest MSI addresses and IO-APIC RTEs=2E In hvm_inject_msi() combine
> the standard bits [19:12] with the extended bits [11:5] of the MSI
> address into a 15-bit destination ID for LAPIC delivery=2E Widen the des=
t
> parameter of vmsi_deliver() and hvm_girq_dest_2_vcpu_id() from uint8_t
> to uint32_t to accommodate the larger range=2E In vioapic_deliver() read
> the combined 15-bit destination using the VIOAPIC_RTE_DEST() macro=2E
> Extend ioapic_check() to check for extended destination bits set in a
> domain that does not advertise XEN_HVM_CPUID_EXT_DEST_ID and refuse to
> restore the IO-APIC state, preventing silent interrupt misrouting after
> live migration=2E
>=20
> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> ---
> Changes in v4:
> - Corresponds to v3 patch 3, but adapted for the new raw-addr/data
>    storage introduced in patch 5:
>      - In v3, vmsi_deliver_pirq() extracted the full destination from
>        gflags via XEN_DOMCTL_VMSI_X86_FULL_DEST(), and msi_gflags()
>        packed the extended address bits into gflags
>      - In v4 both helpers are gone=2E vmsi_deliver_pirq() reads
>        pirq_dpci->gmsi=2Eaddr and pirq_dpci->gmsi=2Edata directly using =
the
>        standard MSI masks
> - Moved the IO-APIC masks and VIOAPIC_RTE_DEST() helper (previously in
>    v3 patch 2) into this patch
> - Added ioapic_check() ext destination safety check (refusing migration
>    with ext_dest_id bits set when XEN_HVM_CPUID_EXT_DEST_ID is not
>    advertised)
> ---
>   xen/arch/x86/hvm/irq=2Ec                 |  9 ++++++++-
>   xen/arch/x86/hvm/vioapic=2Ec             |  2 +-
>   xen/arch/x86/hvm/vmsi=2Ec                |  4 ++--
>   xen/arch/x86/include/asm/hvm/hvm=2Eh     |  4 ++--
>   xen/arch/x86/include/asm/hvm/vioapic=2Eh | 12 ++++++++++++
>   xen/include/public/arch-x86/hvm/save=2Eh |  4 +++-
>   6 files changed, 28 insertions(+), 7 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/irq=2Ec b/xen/arch/x86/hvm/irq=2Ec
> index 5f64361113=2E=2Eb43adf8b96 100644
> --- a/xen/arch/x86/hvm/irq=2Ec
> +++ b/xen/arch/x86/hvm/irq=2Ec
> @@ -374,7 +374,14 @@ int hvm_set_pci_link_route(struct domain *d, u8 lin=
k, u8 isa_irq)
>   int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
>   {
>       uint32_t tmp =3D (uint32_t) addr;
> -    uint8_t  dest =3D (tmp & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID=
_SHIFT;
> +    /*
> +     * Standard MSI destination address bits 19:12 carry the 8-bit APIC=
 ID=2E
> +     * When XEN_HVM_CPUID_EXT_DEST_ID is enabled, bits 11:5 carry APIC =
ID bits
> +     * [14:8], extending the addressable range to 15 bits=2E Guests tha=
t do not
> +     * use extended IDs leave these bits at zero, so the combined extra=
ction is
> +     * safe regardless=2E
> +     */
> +    uint32_t dest =3D MSI_ADDR_DEST(tmp);
>       uint8_t  dest_mode =3D !!(tmp & MSI_ADDR_DESTMODE_MASK);
>       uint8_t  delivery_mode =3D (data & MSI_DATA_DELIVERY_MODE_MASK)
>           >> MSI_DATA_DELIVERY_MODE_SHIFT;
> diff --git a/xen/arch/x86/hvm/vioapic=2Ec b/xen/arch/x86/hvm/vioapic=2Ec
> index 43fb165f84=2E=2E527cc770b7 100644
> --- a/xen/arch/x86/hvm/vioapic=2Ec
> +++ b/xen/arch/x86/hvm/vioapic=2Ec
> @@ -411,7 +411,7 @@ static void ioapic_inj_irq(
>  =20
>   static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int =
pin)
>   {
> -    uint16_t dest =3D vioapic->redirtbl[pin]=2Efields=2Edest_id;
> +    uint32_t dest =3D VIOAPIC_RTE_DEST(vioapic->redirtbl[pin]=2Ebits);
>       uint8_t dest_mode =3D vioapic->redirtbl[pin]=2Efields=2Edest_mode;
>       uint8_t delivery_mode =3D vioapic->redirtbl[pin]=2Efields=2Edelive=
ry_mode;
>       uint8_t vector =3D vioapic->redirtbl[pin]=2Efields=2Evector;
> diff --git a/xen/arch/x86/hvm/vmsi=2Ec b/xen/arch/x86/hvm/vmsi=2Ec
> index 2a4b97e2e1=2E=2E7b338c4ddc 100644
> --- a/xen/arch/x86/hvm/vmsi=2Ec
> +++ b/xen/arch/x86/hvm/vmsi=2Ec
> @@ -67,7 +67,7 @@ static void vmsi_inj_irq(
>  =20
>   int vmsi_deliver(
>       struct domain *d, int vector,
> -    uint8_t dest, uint8_t dest_mode,
> +    uint32_t dest, uint8_t dest_mode,
>       uint8_t delivery_mode, uint8_t trig_mode)
>   {
>       struct vlapic *target;
> @@ -126,7 +126,7 @@ void vmsi_deliver_pirq(struct domain *d, const struc=
t hvm_pirq_dpci *pirq_dpci)
>   }
>  =20
>   /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
> -int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t des=
t_mode)
> +int hvm_girq_dest_2_vcpu_id(struct domain *d, uint32_t dest, uint8_t de=
st_mode)
>   {
>       int dest_vcpu_id =3D -1, w =3D 0;
>       struct vcpu *v;
> diff --git a/xen/arch/x86/include/asm/hvm/hvm=2Eh b/xen/arch/x86/include=
/asm/hvm/hvm=2Eh
> index e7c1364802=2E=2E884dd44c81 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm=2Eh
> +++ b/xen/arch/x86/include/asm/hvm/hvm=2Eh
> @@ -294,11 +294,11 @@ uint64_t hvm_get_guest_time_fixed(const struct vcp=
u *v, uint64_t at_tsc);
>  =20
>   int vmsi_deliver(
>       struct domain *d, int vector,
> -    uint8_t dest, uint8_t dest_mode,
> +    uint32_t dest, uint8_t dest_mode,
>       uint8_t delivery_mode, uint8_t trig_mode);
>   struct hvm_pirq_dpci;
>   void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *p=
irq_dpci);
> -int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t des=
t_mode);
> +int hvm_girq_dest_2_vcpu_id(struct domain *d, uint32_t dest, uint8_t de=
st_mode);
>  =20
>   enum hvm_intblk
>   hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack);
> diff --git a/xen/arch/x86/include/asm/hvm/vioapic=2Eh b/xen/arch/x86/inc=
lude/asm/hvm/vioapic=2Eh
> index 68af6dce79=2E=2E4499208bad 100644
> --- a/xen/arch/x86/include/asm/hvm/vioapic=2Eh
> +++ b/xen/arch/x86/include/asm/hvm/vioapic=2Eh
> @@ -32,6 +32,18 @@
>   #define VIOAPIC_EDGE_TRIG  0
>   #define VIOAPIC_LEVEL_TRIG 1
>  =20
> +/*
> + * Extract the destination ID from a 64-bit IO-APIC RTE, including the
> + * extended bits (55:49) used when XEN_HVM_CPUID_EXT_DEST_ID is adverti=
sed=2E
> + */
> +#define IO_APIC_REDIR_DEST_MASK         (0xffULL << 56)
> +#define IO_APIC_REDIR_EXT_DEST_MASK     (0x7fULL << 49)
> +
> +#define VIOAPIC_RTE_DEST(rte) \
> +    (MASK_EXTR((rte), IO_APIC_REDIR_DEST_MASK) | \
> +     (MASK_EXTR((rte), IO_APIC_REDIR_EXT_DEST_MASK) << \
> +      MSI_ADDR_DEST_ID_UPPER_BITS))
> +

We can probably simplify that by using vioapic_redir_entry=2Edest_id and=
=20
vioapic_redir_entry=2Eext_dest_id directly instead of reparsing it from=20
vioapic_redir_entry=2Ebits=2E

IOW, replace MASK_EXTR((rte), IO_APIC_REDIR_DEST_MASK) with=20
(rte)=2Edest_id and MASK_EXTR((rte), IO_APIC_REDIR_EXT_DEST_MASK) with=20
(rte)=2Eext_dest_id=2E So VIOAPIC_RTE_DEST() would now take=20
vioapic_redir_entry as parameter=2E

>   #define VIOAPIC_DEFAULT_BASE_ADDRESS  0xfec00000U
>   #define VIOAPIC_MEM_LENGTH            0x100
>   > diff --git a/xen/include/public/arch-x86/hvm/save=2Eh=20
b/xen/include/public/arch-x86/hvm/save=2Eh
> index 9c4bfc7ebd=2E=2E483097d940 100644
> --- a/xen/include/public/arch-x86/hvm/save=2Eh
> +++ b/xen/include/public/arch-x86/hvm/save=2Eh
> @@ -359,7 +359,9 @@ union vioapic_redir_entry
>           uint8_t trig_mode:1;
>           uint8_t mask:1;
>           uint8_t reserve:7;
> -        uint8_t reserved[4];
> +        uint8_t reserved[3];
> +        uint8_t reserved2:1;
> +        uint8_t ext_dest_id:7;
>           uint8_t dest_id;
>       } fields;
>   };

Teddy


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.eb.c5d8ae115ac7e90e.19dd4b3ad47.d3c253bc4b53bd84=---

