Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vRzaICHZK2paGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3446A6788F6
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Pj+VEvqL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336505.1598353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyi3-0005zk-Vu; Fri, 12 Jun 2026 10:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336505.1598353; Fri, 12 Jun 2026 10:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyi3-0005wM-Q5; Fri, 12 Jun 2026 10:01:55 +0000
Received: by outflank-mailman (input) for mailman id 1336505;
 Fri, 12 Jun 2026 10:01:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47d2c2000701b@swg.vates.tech>)
 id 1wXyi1-0005qT-N0
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyi0-00D9qT-PK
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47d2c2000701b@swg.vates.tech>)
 id 6a2bd90b-5cb7-0a2a0a5109dd-0a2a4504a10a-16
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:52 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47d2c2000701b@swg.vates.tech>)
 id 6a2bd910-1dec-0a2a45040019-b9ff1c12b34f-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:52 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb47d2c2000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:46 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4CA518617A;
 Fri, 12 Jun 2026 12:01:46 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=KuTs+bSXa+dcOfhfb0dZ0lGUt1UPSmHtM/144RpaMA0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Pj+VEvqLhZHSmASf+BNIFuKoeeT7nLzAEUeVtOeivCZWOJOmrWL5/SfClmjFexnXPjyvl/EQu
 HUMEq9bj8IHHXWAZ3KgkqYT8iINW+FijMZIkTLRPLuACbgbqGaP9tUGBh+Med7O5naz3ZMA8LzD
 zQUalKnWF42Ks4Gsufon+uWhc8p2pjillHNNR9DQ4WC6y05dn+X0viFcOn8G9uAYivQNjDQ2zSh
 ren4ppDn+yOBnlMxq5We180ZoNEW/nFhkj69NX/8RraZjblzxPdWpZUwfL0uTH/DddwPc0EZD8K
 y/354NzUxK8vij0QqOX4qVnLrxswsbNHX6HlYNkz89yg==
X-Zone-Loop: 0549202ccc57666715d195a37ad392d14561d1702665
x-campaign-type: default
x-transaction-id: 72262f71-b515-4eb8-a3c5-716d3e2bfab5
x-swg-uid: 01-f1687bef-dfa1-4d44-bf21-ad82cfc249d2
X-Mailer: Sweego
Message-ID:
 <1781258507.8631fc262581453bbf619ec5b2062170.19ebb47d2c2000701b@vates.tech>
x-swg-bid: 1781258507.8631fc262581453bbf619ec5b2062170.19ebb47d2c2000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 09/17] xev/hvm: Add HVMOP_get|set_ecam_space hypercalls
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-10-thierry.escande@vates.tech>
 <afC9XAtGOkug0qFB@macbook.local>
Content-Language: en-US
In-Reply-To: <afC9XAtGOkug0qFB@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a3.dcd0808d80f4b787.19ebb47d12b.e630d13cf4dd56dd=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258506539
X-purgate-ID: tlsNG-ebf023/1781258512-43F6D3FF-06033B98/0/0
X-purgate-type: clean
X-purgate-size: 7003
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3446A6788F6

---=Part.a3.dcd0808d80f4b787.19ebb47d12b.e630d13cf4dd56dd=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 4/28/26 16:00, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:03PM +0000, Thierry Escande wrote:
>> This patch adds 2 HVMOP hypercalls, HVMOP_get|set_ecam_space, used to
>> set and get the base address and size of the PCIe ECAM space as
>> configured by hvmloader=2E
>>
>> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
>> ---
>>  xen/arch/x86/hvm/hvm=2Ec            | 52 +++++++++++++++++++++++++++++=
++
>>  xen/arch/x86/include/asm/domain=2Eh |  4 +++
>>  xen/include/public/hvm/hvm_op=2Eh   | 11 +++++++
>>  3 files changed, 67 insertions(+)
>>
>> diff --git a/xen/arch/x86/hvm/hvm=2Ec b/xen/arch/x86/hvm/hvm=2Ec
>> index 4d37a93c57=2E=2Ea46dfa955d 100644
>> --- a/xen/arch/x86/hvm/hvm=2Ec
>> +++ b/xen/arch/x86/hvm/hvm=2Ec
>> @@ -5195,6 +5195,58 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDL=
E_PARAM(void) arg)
>>          rc =3D current->hcall_compat ? compat_altp2m_op(arg) : do_altp=
2m_op(arg);
>>          break;
>> =20
>> +    case HVMOP_set_ecam_space: {
>> +        xen_hvm_ecam_space_t ecam;
>> +        struct domain *d;
>> +
>> +        if ( copy_from_guest( &ecam, guest_handle_cast(arg, xen_hvm_ec=
am_space_t), 1 ) )
>                                 ^ extra space, here and at the
>                                   closing parenthesis=2E
>=20
> Line length is also past the 80 character limit, same below in
> HVMOP_get_ecam_space=2E

Ok=2E

>=20
>> +            return -EFAULT;
>=20
> This operation (and the matching get variant) needs an XSM check=2E

I'm not familiar with XSM=2E Does that imply to add a new flask hook ?
Extend an existing one ?

>=20
>> +
>> +        d =3D rcu_lock_domain_by_any_id(ecam=2Edomid);
>> +        if ( d =3D=3D NULL )
>> +            return -ESRCH;
>> +
>> +        if ( d->arch=2Eecam_addr ) {
>=20
> Coding style, opening braces should be on a new line=2E
>=20
>> +            rcu_unlock_domain(d);
>> +            return -EFAULT;
>=20
> This would better return -EBUSY
>=20
>> +        }
>=20
> You also need to check the padding fields are 0=2E
>=20
>> +
>> +        if ( (ecam=2Esize >> 28) || (!ecam=2Eaddr) ) {
>                                      ^ the parenthesis here are
>                                      unneeded=2E
>=20
>> +            rcu_unlock_domain(d);
>> +            return -EINVAL;
>> +        }
>> +
>> +        d->arch=2Eecam_addr =3D ecam=2Eaddr;
>> +        d->arch=2Eecam_size =3D ecam=2Esize;
>=20
> I'm a bit worried about a domain being able to set it's own ECAM hole,
> assessing all the side-effects of this might be complex=2E

Would it be related to the XSM check you mentioned earlier to avoid the
guest to use the set hypercall?

>=20
> Won't the code here better check the region passed in the hypercall is
> indeed not mapped in the p2m, so that trapping of ECAM accesses works
> as expected?

Well, it is mapped as p2m_mmio_dm=2E Do you mean adding a check to make
sure it's mapped correctly or not mapped?

>=20
> Also, how does the ECAM hole get setup on native?  I assume there are
> some magic registers in the PCI config space of a platform device that
> the firmware uses to position the ECAM space?

ASAIU, the guest kernel gets the MMCONFIG area info via the ACPI MFCG
table and checks if the range is reserved in the 820 table=2E If ACPI is
disabled, it uses the PCI_MCH_PCIEXBAR register (0x60) of the bdf 000=2E

>=20
> Are those trapped by QEMU, in which case won't it be better to do it
> the native way (iow: with the config space registers), and let QEMU
> forward it to Xen?  It would then be QEMU the one to call
> HVMOP_set_ecam_space (or whatever hypercall we end up using)=2E

Yes, setting the PCI_MCH_PCIEXBAR register lands in Qemu=2E So it is
possible to do the hypercall from Qemu=2E I didn't do it that way to
(lazily) avoid big changes in Qemu=2E And that would also be better if the
guest modifies the PCI_MCH_PCIEXBAR register for whatever reason=2E

>=20
>> +
>> +        rcu_unlock_domain(d);
>> +        break;
>> +    }
>> +
>> +    case HVMOP_get_ecam_space: {
>> +        xen_hvm_ecam_space_t ecam;
>> +        struct domain *d;
>> +
>> +        if ( copy_from_guest( &ecam, guest_handle_cast(arg, xen_hvm_ec=
am_space_t), 1 ) )
>> +            return -EFAULT;
>> +
>> +        d =3D rcu_lock_domain_by_any_id(ecam=2Edomid);
>> +        if ( d =3D=3D NULL )
>> +            return -ESRCH;
>> +
>> +        if ( ! d->arch=2Eecam_addr || ! d->arch=2Eecam_size ) {
>> +            rcu_unlock_domain(d);
>> +            return -EINVAL;
>> +        }
>> +
>> +        ecam=2Eaddr =3D d->arch=2Eecam_addr;
>> +        ecam=2Esize =3D d->arch=2Eecam_size;
>> +        rc =3D __copy_to_guest(arg, &ecam, 1) ? -EFAULT : 0;
>> +
>> +        rcu_unlock_domain(d);
>> +        break;
>> +    }
>> +
>>      default:
>>          rc =3D -ENOSYS;
>>          break;
>> diff --git a/xen/arch/x86/include/asm/domain=2Eh b/xen/arch/x86/include=
/asm/domain=2Eh
>> index ad7f6adb2c=2E=2E24ec33fc4d 100644
>> --- a/xen/arch/x86/include/asm/domain=2Eh
>> +++ b/xen/arch/x86/include/asm/domain=2Eh
>> @@ -476,6 +476,10 @@ struct arch_domain
>> =20
>>      /* Emulated devices enabled bitmap=2E */
>>      uint32_t emulation_flags;
>> +
>> +    /* PCI ECAM space emulation */
>> +    uint64_t ecam_addr;
>> +    uint32_t ecam_size;
>=20
> This fields would better be in hvm_domain struct, and there you
> already have the mmcfg_regions list, which we should aim to use for
> the q35 introduced ECAM region=2E

Ok=2E

>=20
>>  } __cacheline_aligned;
>> =20
>>  #ifdef CONFIG_HVM
>> diff --git a/xen/include/public/hvm/hvm_op=2Eh b/xen/include/public/hvm=
/hvm_op=2Eh
>> index e22adf0319=2E=2Ec84febc37c 100644
>> --- a/xen/include/public/hvm/hvm_op=2Eh
>> +++ b/xen/include/public/hvm/hvm_op=2Eh
>> @@ -166,6 +166,17 @@ struct xen_hvm_get_mem_type {
>>  typedef struct xen_hvm_get_mem_type xen_hvm_get_mem_type_t;
>>  DEFINE_XEN_GUEST_HANDLE(xen_hvm_get_mem_type_t);
>> =20
>> +#define HVMOP_set_ecam_space    16
>> +#define HVMOP_get_ecam_space    17
>> +struct xen_hvm_ecam_space {
>> +    domid_t  domid;
>> +    uint16_t pad[3]; /* align next field on 8-byte boundary */
>> +    uint64_t addr;
>> +    uint32_t size;
>=20
> There's also a trailing uint32_t padding here on 64bit builds I think?
>=20
> FWIW, you could do:
>=20
>     domid_t  domid;
>     uint16_t pad;
>     uint32_t size
>     uint64_t addr;
>=20
> As that would reduce the padding in the struct?

Indeed, that seems better=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.a3.dcd0808d80f4b787.19ebb47d12b.e630d13cf4dd56dd=---

