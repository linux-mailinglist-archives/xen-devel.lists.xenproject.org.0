Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACReGTDP8GnDYwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 17:16:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A5F487A65
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 17:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296453.1572862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHkA2-0002Pb-UJ; Tue, 28 Apr 2026 15:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296453.1572862; Tue, 28 Apr 2026 15:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHkA2-0002O9-Qs; Tue, 28 Apr 2026 15:15:42 +0000
Received: by outflank-mailman (input) for mailman id 1296453;
 Tue, 28 Apr 2026 15:15:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd4a8f919000f373@swg.vates.tech>)
 id 1wHkA1-0002O3-Nh
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 15:15:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHkA0-009T11-To
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 17:15:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd4a8f919000f373@swg.vates.tech>)
 id 69f0cf0e-bab6-0a2a0a5309dd-0a2a450cbf56-36
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 17:15:40 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd4a8f919000f373@swg.vates.tech>)
 id 69f0cf1c-62f1-0a2a450c0019-b9ff1c22a625-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 17:15:40 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dd4a8f919000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Apr 2026 15:15:36 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id E7E1686439;
 Tue, 28 Apr 2026 17:15:35 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ecfl265qQUiRdYzmgGmvEv3ilzP58U075ntp6nhcQBg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=kAUDdPV/o+dW9s1jDGJOBFWbxdruBH2IyByC14Mzyr46B4aSaXZRGbyU/Aa41gwd76ZtLtSXI
 6jMBZNdYuMMzFhAwbIB4TTmHgri8DP6TsEi5AhvzZuyfqZ1fUGNbVCT1sEJx1EBrksk8Mxk0CpP
 ZeVDn0X6KnHNk92LtezLuFwAJxOAyOZvbZlli630HxN0lH6eDDUQBo0yjv9uytlIn7ksGkIvfCz
 zc46VCtugq+ctVW/l9AAmw87fXQChZE/66wKfdjTDkcPCj7gAL1sJ3V64fUCEgESI3XzMFmJtdN
 +U04EHkI83OaK1BGd+cYBNhkvhDR2NdDGwqo/VuBdPXw==
X-Zone-Loop: 8072d6f56970f7b19306a65672f1b29cff4ff90832e6
x-campaign-type: default
x-transaction-id: 19ecbb85-90a3-43f8-b87f-5b0d3318e6b6
x-swg-uid: 01-b60b17f6-6c4c-469b-936e-382cf3719e80
X-Mailer: Sweego
Message-ID:
 <1777389336.8631fc262581453bbf619ec5b2062170.19dd4a8f919000f373@vates.tech>
x-swg-bid: 1777389336.8631fc262581453bbf619ec5b2062170.19dd4a8f919000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 28 Apr 2026 17:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] x86/passthrough: Introduce pt_irq_bind_msi() as
 canonical MSI bind path
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298080.8631fc262581453bbf619ec5b2062170.19dcf3882f5000f373@vates.tech>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <1777298080.8631fc262581453bbf619ec5b2062170.19dcf3882f5000f373@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.e7.ea83ac1b51395593.19dd4a8f666.7bd1a80984b505c3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777389336166
X-purgate-ID: tlsNG-d25034/1777389340-F600DCF5-C2A702E8/0/0
X-purgate-type: clean
X-purgate-size: 17805
X-Rspamd-Queue-Id: A6A5F487A65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.e7.ea83ac1b51395593.19dd4a8f666.7bd1a80984b505c3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27/04/2026 =C3=A0 15:57, Julian Vetter a =C3=A9crit=C2=A0:
> Change pt_irq_bind_msi() to accept raw MSI address and data values inste=
ad
> of pre-decoded gvec/gflags=2E Add msi_addr_to_gflags() to decode the
> destination ID and delivery attributes, including the Extended Destinati=
on
> ID bits from address[11:5] per Intel convention=2E
>=20
> Update pt_irq_create_bind() to call pt_irq_bind_msi() via the existing
> gvec/gflags interface so domctl-based callers continue to work=2E
>=20
> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> ---
> Changes in v4:
> - As suggested by Roger replace the v3 approach (v3 patches 2+4) of
>    extending the gflags ABI with XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK an=
d
>    XEN_DOMCTL_VMSI_X86_FULL_DEST() so callers could pass extended bits
>    through XEN_DOMCTL_bind_pt_irq=2E pt_irq_bind_msi() now accepts raw M=
SI
>    address + data and decodes the destination internally via
>    msi_addr_to_gflags()
> - Replace the gmsi=2Egvec + gmsi=2Egflags fields in struct hvm_pirq_dpci
>    with gmsi=2Eaddr + gmsi=2Edata
> - Replace msi_gflags() (v3 vmsi=2Ec helper that packed the extended
>    destination bits into gflags) with msi_addr_to_gflags() which decodes
>    the raw MSI address directly
> - pt_irq_create_bind() now rejects PT_IRQ_TYPE_MSI with -EOPNOTSUPP and
>    all callers are redirected through the DM op path in patch 7
> - As suggested by Roger adapt the comment in msi=2Eh in regards to the
>    extended destination encoding since it's not part of any specificatio=
n
> ---
>   xen/arch/x86/hvm/vmsi=2Ec            | 50 ++++++------------
>   xen/arch/x86/include/asm/hvm/irq=2Eh |  4 +-
>   xen/arch/x86/include/asm/msi=2Eh     | 18 ++++++-
>   xen/drivers/passthrough/x86/hvm=2Ec  | 83 ++++++++++++++++++----------=
--
>   xen/include/xen/iommu=2Eh            |  3 ++
>   5 files changed, 86 insertions(+), 72 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/vmsi=2Ec b/xen/arch/x86/hvm/vmsi=2Ec
> index 27b1f089e2=2E=2E2a4b97e2e1 100644
> --- a/xen/arch/x86/hvm/vmsi=2Ec
> +++ b/xen/arch/x86/hvm/vmsi=2Ec
> @@ -43,6 +43,7 @@
>   #include <asm/current=2Eh>
>   #include <asm/event=2Eh>
>   #include <asm/io_apic=2Eh>
> +#include <asm/msi=2Eh>
>  =20
>   static void vmsi_inj_irq(
>       struct vlapic *target,
> @@ -107,12 +108,12 @@ int vmsi_deliver(
>  =20
>   void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *p=
irq_dpci)
>   {
> -    uint32_t flags =3D pirq_dpci->gmsi=2Egflags;
> -    int vector =3D pirq_dpci->gmsi=2Egvec;
> -    uint8_t dest =3D (uint8_t)flags;
> -    bool dest_mode =3D flags & XEN_DOMCTL_VMSI_X86_DM_MASK;
> -    uint8_t delivery_mode =3D MASK_EXTR(flags, XEN_DOMCTL_VMSI_X86_DELI=
V_MASK);
> -    bool trig_mode =3D flags & XEN_DOMCTL_VMSI_X86_TRIG_MASK;
> +    uint32_t dest =3D MSI_ADDR_DEST(pirq_dpci->gmsi=2Eaddr);
> +    bool dest_mode =3D pirq_dpci->gmsi=2Eaddr & MSI_ADDR_DESTMODE_MASK;
> +    uint8_t delivery_mode =3D MASK_EXTR(pirq_dpci->gmsi=2Edata,
> +                                      MSI_DATA_DELIVERY_MODE_MASK);
> +    bool trig_mode =3D pirq_dpci->gmsi=2Edata & MSI_DATA_TRIGGER_MASK;
> +    int vector =3D pirq_dpci->gmsi=2Edata & MSI_DATA_VECTOR_MASK;
>  =20
>       HVM_DBG_LOG(DBG_LEVEL_IOAPIC,
>                   "msi: dest=3D%x dest_mode=3D%x delivery_mode=3D%x "
> @@ -793,27 +794,6 @@ void msix_write_completion(struct vcpu *v)
>   }
>  =20
>   #ifdef CONFIG_HAS_VPCI
> -static unsigned int msi_gflags(uint16_t data, uint64_t addr, bool maske=
d)
> -{
> -    /*
> -     * We need to use the DOMCTL constants here because the output of t=
his
> -     * function is used as input to pt_irq_create_bind, which also take=
s the
> -     * input from the DOMCTL itself=2E
> -     */
> -    return MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DEST_ID_MASK),
> -                     XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
> -           MASK_INSR(MASK_EXTR(addr, MSI_ADDR_REDIRECTION_MASK),
> -                     XEN_DOMCTL_VMSI_X86_RH_MASK) |
> -           MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DESTMODE_MASK),
> -                     XEN_DOMCTL_VMSI_X86_DM_MASK) |
> -           MASK_INSR(MASK_EXTR(data, MSI_DATA_DELIVERY_MODE_MASK),
> -                     XEN_DOMCTL_VMSI_X86_DELIV_MASK) |
> -           MASK_INSR(MASK_EXTR(data, MSI_DATA_TRIGGER_MASK),
> -                     XEN_DOMCTL_VMSI_X86_TRIG_MASK) |
> -           /* NB: by default MSI vectors are bound masked=2E */
> -           (masked ? 0 : XEN_DOMCTL_VMSI_X86_UNMASKED);
> -}
> -
>   static void vpci_mask_pirq(struct domain *d, int pirq, bool mask)
>   {
>       unsigned long flags;
> @@ -850,17 +830,17 @@ static int vpci_msi_update(const struct pci_dev *p=
dev, uint32_t data,
>       {
>           uint8_t vector =3D MASK_EXTR(data, MSI_DATA_VECTOR_MASK);
>           uint8_t vector_mask =3D 0xff >> (8 - fls(vectors) + 1);
> -        struct xen_domctl_bind_pt_irq bind =3D {
> -            =2Emachine_irq =3D pirq + i,
> -            =2Eirq_type =3D PT_IRQ_TYPE_MSI,
> -            =2Eu=2Emsi=2Egvec =3D (vector & ~vector_mask) |
> -                          ((vector + i) & vector_mask),
> -            =2Eu=2Emsi=2Egflags =3D msi_gflags(data, address, (mask >> =
i) & 1),
> -        };
> -        int rc =3D pt_irq_create_bind(pdev->domain, &bind);
> +        uint8_t gvec =3D (vector & ~vector_mask) | ((vector + i) & vect=
or_mask);
> +        uint32_t msi_data =3D (data & ~MSI_DATA_VECTOR_MASK) | gvec;
> +        int rc =3D pt_irq_bind_msi(pdev->domain, pirq + i,
> +                                 address, msi_data, 0, !((mask >> i) & =
1));
>  =20
>           if ( rc )
>           {
> +            struct xen_domctl_bind_pt_irq bind =3D {
> +                =2Eirq_type =3D PT_IRQ_TYPE_MSI,
> +                =2Emachine_irq =3D pirq + i,
> +            };
>               gdprintk(XENLOG_ERR, "%pp: failed to bind PIRQ %u: %d\n",
>                        &pdev->sbdf, pirq + i, rc);
>               while ( bind=2Emachine_irq-- > pirq )
> diff --git a/xen/arch/x86/include/asm/hvm/irq=2Eh b/xen/arch/x86/include=
/asm/hvm/irq=2Eh
> index 77595fb3f4=2E=2Ec50eee9996 100644
> --- a/xen/arch/x86/include/asm/hvm/irq=2Eh
> +++ b/xen/arch/x86/include/asm/hvm/irq=2Eh
> @@ -120,8 +120,8 @@ struct dev_intx_gsi_link {
>   #define HVM_IRQ_DPCI_TRANSLATE       (1u << _HVM_IRQ_DPCI_TRANSLATE_SH=
IFT)
>  =20
>   struct hvm_gmsi_info {
> -    uint32_t gvec;
> -    uint32_t gflags;
> +    uint64_t addr;    /* raw MSI address (0xfeexxxxx, includes ext dest=
 ID) */
> +    uint32_t data;    /* raw MSI data (vector, delivery mode, trigger m=
ode) */
>       int dest_vcpu_id; /* -1 :multi-dest, non-negative: dest_vcpu_id */
>       bool posted; /* directly deliver to guest via VT-d PI? */
>   };
> diff --git a/xen/arch/x86/include/asm/msi=2Eh b/xen/arch/x86/include/asm=
/msi=2Eh
> index 00059d4a3a=2E=2E93aaf20e27 100644
> --- a/xen/arch/x86/include/asm/msi=2Eh
> +++ b/xen/arch/x86/include/asm/msi=2Eh
> @@ -51,8 +51,22 @@
>   #define MSI_ADDR_REDIRECTION_MASK   (1 << MSI_ADDR_REDIRECTION_SHIFT)
>  =20
>   #define MSI_ADDR_DEST_ID_SHIFT		12
> -#define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
> -#define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & =
MSI_ADDR_DEST_ID_MASK)
> +#define MSI_ADDR_DEST_ID_UPPER_BITS	8
> +#define MSI_ADDR_DEST_ID_MASK		0x00ff000
> +#define MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & M=
SI_ADDR_DEST_ID_MASK)
> +
> +/*
> + * Intel convention: in physical destination mode bits 11:5 of the MSI
> + * address carry APIC ID bits [14:8] (the "Extended Destination ID"),
> + * extending the addressable range from 8 to 15 bits=2E
> + */
> +#define MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0
> +
> +/* Extract the combined 15-bit destination ID from an MSI address=2E */
> +#define MSI_ADDR_DEST(addr) \
> +    (MASK_EXTR((addr), MSI_ADDR_DEST_ID_MASK) | \
> +     (MASK_EXTR((addr), MSI_ADDR_EXT_DEST_ID_MASK) << \
> +      MSI_ADDR_DEST_ID_UPPER_BITS))
>  =20
>   /* MAX fixed pages reserved for mapping MSIX tables=2E */
>   #define FIX_MSIX_MAX_PAGES              512
> diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrou=
gh/x86/hvm=2Ec
> index eff1e8a79e=2E=2E026534530f 100644
> --- a/xen/drivers/passthrough/x86/hvm=2Ec
> +++ b/xen/drivers/passthrough/x86/hvm=2Ec
> @@ -21,6 +21,7 @@
>   #include <xen/event=2Eh>
>   #include <xen/iommu=2Eh>
>   #include <xen/cpu=2Eh>
> +#include <xen/ioreq=2Eh>
>   #include <xen/irq=2Eh>
>   #include <asm/hvm/irq=2Eh>
>   #include <asm/io_apic=2Eh>
> @@ -290,14 +291,15 @@ static int pt_irq_dpci_setup(struct domain *d, uns=
igned int pirq,
>       } while ( true );
>   }
>  =20
> -static int pt_irq_bind_msi(struct domain *d, uint32_t machine_irq,
> -                            uint8_t gvec, uint32_t gflags, uint64_t gta=
ble,
> -                            bool unmasked)
> +int pt_irq_bind_msi(struct domain *d, uint32_t machine_irq,
> +                    uint64_t msi_addr, uint32_t msi_data,
> +                    uint64_t gtable, bool unmasked)
>   {
>       struct hvm_irq_dpci *hvm_irq_dpci;
>       struct hvm_pirq_dpci *pirq_dpci;
>       struct pirq *info;
> -    uint8_t dest, delivery_mode;
> +    uint8_t gvec, delivery_mode;
> +    uint32_t dest;
>       bool dest_mode;
>       int dest_vcpu_id, rc;
>       const struct vcpu *vcpu;
> @@ -313,8 +315,8 @@ static int pt_irq_bind_msi(struct domain *d, uint32_=
t machine_irq,
>       {
>           pirq_dpci->flags =3D HVM_IRQ_DPCI_MAPPED | HVM_IRQ_DPCI_MACH_M=
SI |
>                              HVM_IRQ_DPCI_GUEST_MSI;
> -        pirq_dpci->gmsi=2Egvec =3D gvec;
> -        pirq_dpci->gmsi=2Egflags =3D gflags;
> +        pirq_dpci->gmsi=2Eaddr =3D msi_addr;
> +        pirq_dpci->gmsi=2Edata =3D msi_data;
>           /*
>            * 'pt_irq_bind_msi' can be called after 'pt_irq_destroy_bind'=
=2E
>            * The 'pirq_cleanup_check' which would free the structure is =
only
> @@ -346,8 +348,8 @@ static int pt_irq_bind_msi(struct domain *d, uint32_=
t machine_irq,
>           }
>           if ( unlikely(rc) )
>           {
> -            pirq_dpci->gmsi=2Egflags =3D 0;
> -            pirq_dpci->gmsi=2Egvec =3D 0;
> +            pirq_dpci->gmsi=2Eaddr =3D 0;
> +            pirq_dpci->gmsi=2Edata =3D 0;
>               pirq_dpci->dom =3D NULL;
>               pirq_dpci->flags =3D 0;
>               if ( !info->evtchn )
> @@ -367,20 +369,22 @@ static int pt_irq_bind_msi(struct domain *d, uint3=
2_t machine_irq,
>           }
>  =20
>           /* If pirq is already mapped as vmsi, update guest data/addr=
=2E */
> -        if ( pirq_dpci->gmsi=2Egvec !=3D gvec || pirq_dpci->gmsi=2Egfla=
gs !=3D gflags )
> +        if ( pirq_dpci->gmsi=2Eaddr !=3D msi_addr ||
> +             pirq_dpci->gmsi=2Edata !=3D msi_data )
>           {
>               /* Directly clear pending EOIs before enabling new MSI inf=
o=2E */
>               pirq_guest_eoi(info);
>  =20
> -            pirq_dpci->gmsi=2Egvec =3D gvec;
> -            pirq_dpci->gmsi=2Egflags =3D gflags;
> +            pirq_dpci->gmsi=2Eaddr =3D msi_addr;
> +            pirq_dpci->gmsi=2Edata =3D msi_data;
>           }
>       }
> +
>       /* Calculate dest_vcpu_id for MSI-type pirq migration=2E */
> -    dest =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags, XEN_DOMCTL_VMSI_X86_DE=
ST_ID_MASK);
> -    dest_mode =3D pirq_dpci->gmsi=2Egflags & XEN_DOMCTL_VMSI_X86_DM_MAS=
K;
> -    delivery_mode =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
> -                               XEN_DOMCTL_VMSI_X86_DELIV_MASK);
> +    gvec =3D msi_data & MSI_DATA_VECTOR_MASK;
> +    dest =3D MSI_ADDR_DEST(msi_addr);
> +    dest_mode =3D msi_addr & MSI_ADDR_DESTMODE_MASK;
> +    delivery_mode =3D MASK_EXTR(msi_data, MSI_DATA_DELIVERY_MODE_MASK);
>  =20
>       dest_vcpu_id =3D hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
>       pirq_dpci->gmsi=2Edest_vcpu_id =3D dest_vcpu_id;
> @@ -391,8 +395,7 @@ static int pt_irq_bind_msi(struct domain *d, uint32_=
t machine_irq,
>       if ( iommu_intpost )
>       {
>           if ( delivery_mode =3D=3D dest_LowestPrio )
> -            vcpu =3D vector_hashing_dest(d, dest, dest_mode,
> -                                       pirq_dpci->gmsi=2Egvec);
> +            vcpu =3D vector_hashing_dest(d, dest, dest_mode, gvec);
>           if ( vcpu )
>               pirq_dpci->gmsi=2Eposted =3D true;
>       }
> @@ -407,7 +410,7 @@ static int pt_irq_bind_msi(struct domain *d, uint32_=
t machine_irq,
>               =2Eirq_type =3D PT_IRQ_TYPE_MSI,
>           };
>  =20
> -        rc =3D hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi=2Egvec);
> +        rc =3D hvm_pi_update_irte(vcpu, info, gvec);
>           if ( rc )
>           {
>               pt_irq_destroy_bind(d, &bind);
> @@ -417,15 +420,15 @@ static int pt_irq_bind_msi(struct domain *d, uint3=
2_t machine_irq,
>  =20
>       if ( unmasked )
>       {
> -        struct xen_domctl_bind_pt_irq bind =3D {
> -            =2Emachine_irq =3D machine_irq,
> -            =2Eirq_type =3D PT_IRQ_TYPE_MSI,
> -        };
>           unsigned long flags;
>           struct irq_desc *desc =3D pirq_spin_lock_irq_desc(info, &flags=
);
>  =20
>           if ( !desc )
>           {
> +            struct xen_domctl_bind_pt_irq bind =3D {
> +                =2Emachine_irq =3D machine_irq,
> +                =2Eirq_type =3D PT_IRQ_TYPE_MSI,
> +            };
>               pt_irq_destroy_bind(d, &bind);
>               return -EINVAL;
>           }
> @@ -448,13 +451,29 @@ int pt_irq_create_bind(
>       switch ( pt_irq_bind->irq_type )
>       {
>       case PT_IRQ_TYPE_MSI:
> -        return pt_irq_bind_msi(d, pirq,
> -                               pt_irq_bind->u=2Emsi=2Egvec,
> -                               pt_irq_bind->u=2Emsi=2Egflags &
> -                                   ~XEN_DOMCTL_VMSI_X86_UNMASKED,
> +    {
> +        uint32_t gflags =3D pt_irq_bind->u=2Emsi=2Egflags;
> +        uint64_t msi_addr;
> +        uint32_t msi_data;
> +
> +        msi_addr =3D MSI_ADDR_HEADER |
> +                   MASK_INSR(MASK_EXTR(gflags, XEN_DOMCTL_VMSI_X86_DEST=
_ID_MASK),
> +                             MSI_ADDR_DEST_ID_MASK) |
> +                   (gflags & XEN_DOMCTL_VMSI_X86_RH_MASK ?
> +                    MSI_ADDR_REDIRECTION_LOWPRI : MSI_ADDR_REDIRECTION_=
CPU) |
> +                   (gflags & XEN_DOMCTL_VMSI_X86_DM_MASK ?
> +                    MSI_ADDR_DESTMODE_LOGIC : MSI_ADDR_DESTMODE_PHYS);
> +        msi_data =3D pt_irq_bind->u=2Emsi=2Egvec |
> +                   MASK_INSR(MASK_EXTR(gflags, XEN_DOMCTL_VMSI_X86_DELI=
V_MASK),
> +                             MSI_DATA_DELIVERY_MODE_MASK) |
> +                   (gflags & XEN_DOMCTL_VMSI_X86_TRIG_MASK ?
> +                    MSI_DATA_TRIGGER_LEVEL : 0);
> +
> +        return pt_irq_bind_msi(d, pt_irq_bind->machine_irq,
> +                               msi_addr, msi_data,
>                                  pt_irq_bind->u=2Emsi=2Egtable,
> -                               !!(pt_irq_bind->u=2Emsi=2Egflags &
> -                                  XEN_DOMCTL_VMSI_X86_UNMASKED));
> +                               !!(gflags & XEN_DOMCTL_VMSI_X86_UNMASKED=
));
> +    }
>  =20
>       case PT_IRQ_TYPE_PCI:
>       case PT_IRQ_TYPE_MSI_TRANSLATE:
> @@ -617,7 +636,6 @@ int pt_irq_create_bind(
>       }
>  =20
>       default:
> -        write_unlock(&d->event_lock);
>           return -EOPNOTSUPP;
>       }
>  =20
> @@ -858,11 +876,10 @@ static int cf_check _hvm_dpci_msi_eoi(
>       int vector =3D (long)arg;
>  =20
>       if ( (pirq_dpci->flags & HVM_IRQ_DPCI_MACH_MSI) &&
> -         (pirq_dpci->gmsi=2Egvec =3D=3D vector) )
> +         ((pirq_dpci->gmsi=2Edata & MSI_DATA_VECTOR_MASK) =3D=3D vector=
) )
>       {
> -        unsigned int dest =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
> -                                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK)=
;
> -        bool dest_mode =3D pirq_dpci->gmsi=2Egflags & XEN_DOMCTL_VMSI_X=
86_DM_MASK;
> +        unsigned int dest =3D MSI_ADDR_DEST(pirq_dpci->gmsi=2Eaddr);
> +        bool dest_mode =3D pirq_dpci->gmsi=2Eaddr & XEN_DOMCTL_VMSI_X86=
_DM_MASK;
>  =20
>           if ( vlapic_match_dest(vcpu_vlapic(current), NULL, 0, dest,
>                                  dest_mode) )
> diff --git a/xen/include/xen/iommu=2Eh b/xen/include/xen/iommu=2Eh
> index 37c4a1dc82=2E=2E4672d114e3 100644
> --- a/xen/include/xen/iommu=2Eh
> +++ b/xen/include/xen/iommu=2Eh
> @@ -222,6 +222,9 @@ int pt_irq_create_bind(struct domain *d,
>                          const struct xen_domctl_bind_pt_irq *pt_irq_bin=
d);
>   int pt_irq_destroy_bind(struct domain *d,
>                           const struct xen_domctl_bind_pt_irq *pt_irq_bi=
nd);
> +int pt_irq_bind_msi(struct domain *d, uint32_t machine_irq,
> +                    uint64_t msi_addr, uint32_t msi_data,
> +                    uint64_t gtable, bool unmasked);
>  =20
>   struct hvm_irq_dpci *domain_get_irq_dpci(const struct domain *d);
>   void free_hvm_irq_dpci(struct hvm_irq_dpci *dpci);

There is a lot of bitwise manipulations there, and I wonder if using=20
bitfields could help here ?

Teddy


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.e7.ea83ac1b51395593.19dd4a8f666.7bd1a80984b505c3=---

