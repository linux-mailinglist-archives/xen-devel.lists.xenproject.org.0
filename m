Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0115F44446E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 16:13:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220983.382464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHwJ-00040a-Nx; Wed, 03 Nov 2021 15:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220983.382464; Wed, 03 Nov 2021 15:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHwJ-0003xa-KW; Wed, 03 Nov 2021 15:12:35 +0000
Received: by outflank-mailman (input) for mailman id 220983;
 Wed, 03 Nov 2021 15:12:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=neJr=PW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1miHwH-0003xU-Eb
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:12:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76f9d306-3cb8-11ec-9787-a32c541c8605;
 Wed, 03 Nov 2021 16:12:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD7451FC9E;
 Wed,  3 Nov 2021 15:12:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D16213BAA;
 Wed,  3 Nov 2021 15:12:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vJNCHd6mgmGcLwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 Nov 2021 15:12:30 +0000
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
X-Inumbo-ID: 76f9d306-3cb8-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635952350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QDG207j/LxwR5zKodJ/hRC4GvKdTBNClHf8puJmT+bw=;
	b=ZgOwHneDIK/wkwpaigQYpvI2yKDE7f1UneFQXloxiVSBoCEFvz2nsxzcheEksDq/QdZChi
	eHA+Fdp1fyE7V2EPNZY19MsCEDJbYPKfn2Aqaz3bKkQgKwOeUo5IYy+ra6M0dhZakIlB/L
	aNzfv6G28ubOhBKY6iNutB2kaQeS6o4=
Subject: Re: [PATCH v2.2 07/15] xen: generate hypercall interface related code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211103102059.19621-1-jgross@suse.com>
 <52aa88a8-4c86-0e5a-d0b1-1d0431a97fd7@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <50363292-3af5-db24-781a-912004b66feb@suse.com>
Date: Wed, 3 Nov 2021 16:12:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <52aa88a8-4c86-0e5a-d0b1-1d0431a97fd7@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="unfgGDGOL9Ve1wYNtoNuvWjfYqO4LXhqI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--unfgGDGOL9Ve1wYNtoNuvWjfYqO4LXhqI
Content-Type: multipart/mixed; boundary="Vns8PW5NAQt3VlW3jTGS4IRGYsk1YNAFc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <50363292-3af5-db24-781a-912004b66feb@suse.com>
Subject: Re: [PATCH v2.2 07/15] xen: generate hypercall interface related code
References: <20211103102059.19621-1-jgross@suse.com>
 <52aa88a8-4c86-0e5a-d0b1-1d0431a97fd7@suse.com>
In-Reply-To: <52aa88a8-4c86-0e5a-d0b1-1d0431a97fd7@suse.com>

--Vns8PW5NAQt3VlW3jTGS4IRGYsk1YNAFc
Content-Type: multipart/mixed;
 boundary="------------0EFA0B646AEC59419545C052"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0EFA0B646AEC59419545C052
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.11.21 16:08, Jan Beulich wrote:
> On 03.11.2021 11:20, Juergen Gross wrote:
>> +# Generate the output
>> +END {
>> +    # Verbatim generated lines
>> +    for (i =3D 1; i <=3D e; i++)
>> +        printf("%s\n", emit[i]);
>> +    printf("\n");
>> +    # Generate prototypes
>> +    for (i =3D 1; i <=3D n; i++) {
>> +        for (p =3D 1; p <=3D n_pre[i]; p++) {
>> +            printf("%s %s_%s(", rettype[pre[i, p]], pre[i, p], fn[i])=
;
>> +            if (n_args[i] =3D=3D 0)
>> +                printf("void");
>> +            else
>> +                for (j =3D 1; j <=3D n_args[i]; j++) {
>> +                    if (j > 1)
>> +                        printf(", ");
>> +                    if (ptr[i, j])
>> +                        printf("XEN_GUEST_HANDLE_PARAM(%s)", typ[i, j=
]);
>> +                    else
>> +                        printf("%s", typ[i, j]);
>> +                    printf(" %s", arg[i, j]);
>> +                }
>> +            printf(");\n");
>> +        }
>> +    }
>> +    # Generate call sequences and args array contents
>> +    for (ca in caller) {
>> +        if (caller[ca] !=3D 1)
>> +            continue;
>> +        need_mask =3D 0;
>> +        for (pl =3D 1; pl <=3D n_prios[ca]; pl++) {
>> +            for (pll =3D pl; pll > 1; pll--) {
>> +                if (prio_list[ca, pl] > p_list[pll - 1])
>> +                    break;
>> +                else
>> +                    p_list[pll] =3D p_list[pll - 1];
>> +            }
>> +            p_list[pll] =3D prio_list[ca, pl];
>> +            # If any prio but the default one has more than 1 entry w=
e need "mask"
>> +            if (p_list[pll] !=3D 100 && prios[ca, p_list[pll]] > 1)
>> +                need_mask =3D 1;
>> +        }
>> +        printf("\n");
>> +        printf("#define call_handlers_%s(num, ret, a1, a2, a3, a4, a5=
) \\\n", ca);
>> +        printf("{ \\\n");
>=20
> In order to require a semicolon at the use site(s) of the macro I think=

> you want "({ \\\n" here. Everything else looks good to me so far, but
> I'd really like to take a look at the generated output: Would you happe=
n
> to have available an instance, to supply in reply?

Okay.

The generated file is attached.


Juergen

--------------0EFA0B646AEC59419545C052
Content-Type: text/x-chdr; charset=UTF-8;
 name="hypercall-defs.h"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="hypercall-defs.h"

/* Generated file, do not edit! */

DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
typedef struct compat_platform_op compat_platform_op_t;
DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
DEFINE_XEN_GUEST_HANDLE(trap_info_compat_t);
DEFINE_XEN_GUEST_HANDLE(physdev_op_compat_t);

long do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
int compat_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
long do_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop=
, unsigned int count);
long hvm_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uo=
p, unsigned int count);
int compat_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) =
uop, unsigned int count);
long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
int compat_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void=
) arg);
int compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(v=
oid) arg);
long do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
int compat_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op);
int compat_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op);
long do_callback_op(int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg);
int compat_callback_op(int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg);
long do_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg);
int compat_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg);
long do_iret(void);
int compat_iret(void);
long do_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
int compat_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
long do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
int compat_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
int compat_set_timer_op(uint32_t lo, int32_t hi);
int compat_multicall(XEN_GUEST_HANDLE_PARAM(multicall_entry_compat_t) cal=
l_list, uint32_t nr_calls);
int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);=

int compat_dm_op(domid_t domid, unsigned int nr_bufs, XEN_GUEST_HANDLE_PA=
RAM(void) bufs);
int compat_mmuext_op(XEN_GUEST_HANDLE_PARAM(void) arg, unsigned int count=
, XEN_GUEST_HANDLE_PARAM(uint) pdone, unsigned int foreigndom);
int compat_set_trap_table(XEN_GUEST_HANDLE_PARAM(trap_info_compat_t) trap=
s);
int compat_set_gdt(XEN_GUEST_HANDLE_PARAM(uint) frame_list, unsigned int =
entries);
int compat_set_callbacks(unsigned long event_selector, unsigned long even=
t_address, unsigned long failsafe_selector, unsigned long failsafe_addres=
s);
int compat_update_descriptor(uint32_t pa_lo, uint32_t pa_hi, uint32_t des=
c_lo, uint32_t desc_hi);
int compat_update_va_mapping(unsigned int va, uint32_t lo, uint32_t hi, u=
nsigned int flags);
int compat_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_compat_t) =
uop);
int compat_update_va_mapping_otherdomain(unsigned int va, uint32_t lo, ui=
nt32_t hi, unsigned int flags, domid_t domid);
int compat_platform_op(XEN_GUEST_HANDLE_PARAM(compat_platform_op_t) u_xen=
pf_op);
long do_event_channel_op_compat(XEN_GUEST_HANDLE_PARAM(evtchn_op_t) uop);=

long do_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_t) uop);
long do_sched_op_compat(int cmd, unsigned long arg);
long do_set_timer_op(s_time_t timeout);
long do_console_io(unsigned int cmd, unsigned int count, XEN_GUEST_HANDLE=
_PARAM(char) buffer);
long do_vm_assist(unsigned int cmd, unsigned int type);
long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
long do_mmuext_op(XEN_GUEST_HANDLE_PARAM(mmuext_op_t) uops, unsigned int =
count, XEN_GUEST_HANDLE_PARAM(uint) pdone, unsigned int foreigndom);
long do_multicall(XEN_GUEST_HANDLE_PARAM(multicall_entry_t) call_list, un=
signed int nr_calls);
long do_mmu_update(XEN_GUEST_HANDLE_PARAM(mmu_update_t) ureqs, unsigned i=
nt count, XEN_GUEST_HANDLE_PARAM(uint) pdone, unsigned int foreigndom);
long do_stack_switch(unsigned long ss, unsigned long esp);
long do_fpu_taskswitch(int set);
long do_set_debugreg(int reg, unsigned long value);
long do_get_debugreg(int reg);
long do_set_segment_base(unsigned int which, unsigned long base);
long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc);
long do_set_trap_table(XEN_GUEST_HANDLE_PARAM(const_trap_info_t) traps);
long do_set_gdt(XEN_GUEST_HANDLE_PARAM(xen_ulong_t) frame_list, unsigned =
int entries);
long do_set_callbacks(unsigned long event_address, unsigned long failsafe=
_address, unsigned long syscall_address);
long do_update_descriptor(uint64_t gaddr, seg_desc_t desc);
long do_update_va_mapping(unsigned long va, uint64_t val64, unsigned long=
 flags);
long do_update_va_mapping_otherdomain(unsigned long va, uint64_t val64, u=
nsigned long flags, domid_t domid);
long do_dm_op(domid_t domid, unsigned int nr_bufs, XEN_GUEST_HANDLE_PARAM=
(xen_dm_op_buf_t) bufs);
long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl);
long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
long do_paging_domctl_cont(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)=
;
long do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)=
;
long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg);
long do_hypfs_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(const_char) arg=
1, unsigned long arg2, XEN_GUEST_HANDLE_PARAM(void) arg3, unsigned long a=
rg4);
long do_xenpmu_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(xen_pmu_params_=
t) arg);

#define call_handlers_hvm64(num, ret, a1, a2, a3, a4, a5) \
{ \
    uint64_t mask =3D 1ULL << num; \
    if ( likely(mask & ((1ULL << __HYPERVISOR_vcpu_op) | (1ULL << __HYPER=
VISOR_event_channel_op))) ) \
    { \
        if ( num =3D=3D __HYPERVISOR_vcpu_op ) \
            ret =3D do_vcpu_op((int)(a1), (unsigned int)(a2), (XEN_GUEST_=
HANDLE_PARAM(void)){ _p(a3) }); \
        else \
            ret =3D do_event_channel_op((int)(a1), (XEN_GUEST_HANDLE_PARA=
M(void)){ _p(a2) }); \
    } \
    else         switch ( num ) \
        { \
        case __HYPERVISOR_platform_op: \
            ret =3D do_platform_op((XEN_GUEST_HANDLE_PARAM(xen_platform_o=
p_t)){ _p(a1) }); \
            break; \
        case __HYPERVISOR_memory_op: \
            ret =3D hvm_memory_op((unsigned long)(a1), (XEN_GUEST_HANDLE_=
PARAM(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_multicall: \
            ret =3D do_multicall((XEN_GUEST_HANDLE_PARAM(multicall_entry_=
t)){ _p(a1) }, (unsigned int)(a2)); \
            break; \
        case __HYPERVISOR_set_timer_op: \
            ret =3D do_set_timer_op((s_time_t)(a1)); \
            break; \
        case __HYPERVISOR_xen_version: \
            ret =3D do_xen_version((int)(a1), (XEN_GUEST_HANDLE_PARAM(voi=
d)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_console_io: \
            ret =3D do_console_io((unsigned int)(a1), (unsigned int)(a2),=
 (XEN_GUEST_HANDLE_PARAM(char)){ _p(a3) }); \
            break; \
        case __HYPERVISOR_grant_table_op: \
            ret =3D hvm_grant_table_op((unsigned int)(a1), (XEN_GUEST_HAN=
DLE_PARAM(void)){ _p(a2) }, (unsigned int)(a3)); \
            break; \
        case __HYPERVISOR_vm_assist: \
            ret =3D do_vm_assist((unsigned int)(a1), (unsigned int)(a2));=
 \
            break; \
        case __HYPERVISOR_mmuext_op: \
            ret =3D do_mmuext_op((XEN_GUEST_HANDLE_PARAM(mmuext_op_t)){ _=
p(a1) }, (unsigned int)(a2), (XEN_GUEST_HANDLE_PARAM(uint)){ _p(a3) }, (u=
nsigned int)(a4)); \
            break; \
        case __HYPERVISOR_xsm_op: \
            ret =3D do_xsm_op((XEN_GUEST_HANDLE_PARAM(void)){ _p(a1) }); =
\
            break; \
        case __HYPERVISOR_sched_op: \
            ret =3D do_sched_op((int)(a1), (XEN_GUEST_HANDLE_PARAM(void))=
{ _p(a2) }); \
            break; \
        case __HYPERVISOR_physdev_op: \
            ret =3D hvm_physdev_op((int)(a1), (XEN_GUEST_HANDLE_PARAM(voi=
d)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_hvm_op: \
            ret =3D do_hvm_op((unsigned long)(a1), (XEN_GUEST_HANDLE_PARA=
M(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_sysctl: \
            ret =3D do_sysctl((XEN_GUEST_HANDLE_PARAM(xen_sysctl_t)){ _p(=
a1) }); \
            break; \
        case __HYPERVISOR_domctl: \
            ret =3D do_domctl((XEN_GUEST_HANDLE_PARAM(xen_domctl_t)){ _p(=
a1) }); \
            break; \
        case __HYPERVISOR_xenpmu_op: \
            ret =3D do_xenpmu_op((unsigned int)(a1), (XEN_GUEST_HANDLE_PA=
RAM(xen_pmu_params_t)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_dm_op: \
            ret =3D do_dm_op((domid_t)(a1), (unsigned int)(a2), (XEN_GUES=
T_HANDLE_PARAM(xen_dm_op_buf_t)){ _p(a3) }); \
            break; \
        case __HYPERVISOR_hypfs_op: \
            ret =3D do_hypfs_op((unsigned int)(a1), (XEN_GUEST_HANDLE_PAR=
AM(const_char)){ _p(a2) }, (unsigned long)(a3), (XEN_GUEST_HANDLE_PARAM(v=
oid)){ _p(a4) }, (unsigned long)(a5)); \
            break; \
        case __HYPERVISOR_paging_domctl_cont: \
            ret =3D do_paging_domctl_cont((XEN_GUEST_HANDLE_PARAM(xen_dom=
ctl_t)){ _p(a1) }); \
            break; \
        default: \
            ret =3D -ENOSYS; \
            break; \
        } \
}

#define hypercall_args_hvm64 \
{ \
[__HYPERVISOR_platform_op] =3D 1, \
[__HYPERVISOR_memory_op] =3D 2, \
[__HYPERVISOR_multicall] =3D 2, \
[__HYPERVISOR_set_timer_op] =3D 1, \
[__HYPERVISOR_xen_version] =3D 2, \
[__HYPERVISOR_console_io] =3D 3, \
[__HYPERVISOR_grant_table_op] =3D 3, \
[__HYPERVISOR_vm_assist] =3D 2, \
[__HYPERVISOR_vcpu_op] =3D 3, \
[__HYPERVISOR_mmuext_op] =3D 4, \
[__HYPERVISOR_xsm_op] =3D 1, \
[__HYPERVISOR_sched_op] =3D 2, \
[__HYPERVISOR_event_channel_op] =3D 2, \
[__HYPERVISOR_physdev_op] =3D 2, \
[__HYPERVISOR_hvm_op] =3D 2, \
[__HYPERVISOR_sysctl] =3D 1, \
[__HYPERVISOR_domctl] =3D 1, \
[__HYPERVISOR_xenpmu_op] =3D 2, \
[__HYPERVISOR_dm_op] =3D 3, \
[__HYPERVISOR_hypfs_op] =3D 5, \
[__HYPERVISOR_paging_domctl_cont] =3D 1, \
}

#define call_handlers_pv32(num, ret, a1, a2, a3, a4, a5) \
{ \
    uint64_t mask =3D 1ULL << num; \
    if ( likely(mask & ((1ULL << __HYPERVISOR_mmu_update) | (1ULL << __HY=
PERVISOR_iret))) ) \
    { \
        if ( num =3D=3D __HYPERVISOR_mmu_update ) \
            ret =3D do_mmu_update((XEN_GUEST_HANDLE_PARAM(mmu_update_t)){=
 _p(a1) }, (unsigned int)(a2), (XEN_GUEST_HANDLE_PARAM(uint)){ _p(a3) }, =
(unsigned int)(a4)); \
        else \
            ret =3D compat_iret(); \
    } \
    else if ( likely(mask & ((1ULL << __HYPERVISOR_stack_switch) | (1ULL =
<< __HYPERVISOR_multicall) | (1ULL << __HYPERVISOR_set_segment_base) | (1=
ULL << __HYPERVISOR_mmuext_op))) ) \
    { \
        switch ( num ) \
        { \
        case __HYPERVISOR_stack_switch: \
            ret =3D do_stack_switch((unsigned long)(a1), (unsigned long)(=
a2)); \
            break; \
        case __HYPERVISOR_multicall: \
            ret =3D compat_multicall((XEN_GUEST_HANDLE_PARAM(multicall_en=
try_compat_t)){ _p(a1) }, (uint32_t)(a2)); \
            break; \
        case __HYPERVISOR_set_segment_base: \
            ret =3D do_set_segment_base((unsigned int)(a1), (unsigned lon=
g)(a2)); \
            break; \
        case __HYPERVISOR_mmuext_op: \
            ret =3D compat_mmuext_op((XEN_GUEST_HANDLE_PARAM(void)){ _p(a=
1) }, (unsigned int)(a2), (XEN_GUEST_HANDLE_PARAM(uint)){ _p(a3) }, (unsi=
gned int)(a4)); \
            break; \
        default: \
            ret =3D -ENOSYS; \
            break; \
        } \
    } \
    else         switch ( num ) \
        { \
        case __HYPERVISOR_set_trap_table: \
            ret =3D compat_set_trap_table((XEN_GUEST_HANDLE_PARAM(trap_in=
fo_compat_t)){ _p(a1) }); \
            break; \
        case __HYPERVISOR_set_gdt: \
            ret =3D compat_set_gdt((XEN_GUEST_HANDLE_PARAM(uint)){ _p(a1)=
 }, (unsigned int)(a2)); \
            break; \
        case __HYPERVISOR_set_callbacks: \
            ret =3D compat_set_callbacks((unsigned long)(a1), (unsigned l=
ong)(a2), (unsigned long)(a3), (unsigned long)(a4)); \
            break; \
        case __HYPERVISOR_fpu_taskswitch: \
            ret =3D do_fpu_taskswitch((int)(a1)); \
            break; \
        case __HYPERVISOR_sched_op_compat: \
            ret =3D do_sched_op_compat((int)(a1), (unsigned long)(a2)); \=

            break; \
        case __HYPERVISOR_platform_op: \
            ret =3D compat_platform_op((XEN_GUEST_HANDLE_PARAM(compat_pla=
tform_op_t)){ _p(a1) }); \
            break; \
        case __HYPERVISOR_set_debugreg: \
            ret =3D do_set_debugreg((int)(a1), (unsigned long)(a2)); \
            break; \
        case __HYPERVISOR_get_debugreg: \
            ret =3D do_get_debugreg((int)(a1)); \
            break; \
        case __HYPERVISOR_update_descriptor: \
            ret =3D compat_update_descriptor((uint32_t)(a1), (uint32_t)(a=
2), (uint32_t)(a3), (uint32_t)(a4)); \
            break; \
        case __HYPERVISOR_memory_op: \
            ret =3D compat_memory_op((unsigned int)(a1), (XEN_GUEST_HANDL=
E_PARAM(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_update_va_mapping: \
            ret =3D compat_update_va_mapping((unsigned int)(a1), (uint32_=
t)(a2), (uint32_t)(a3), (unsigned int)(a4)); \
            break; \
        case __HYPERVISOR_set_timer_op: \
            ret =3D compat_set_timer_op((uint32_t)(a1), (int32_t)(a2)); \=

            break; \
        case __HYPERVISOR_event_channel_op_compat: \
            ret =3D do_event_channel_op_compat((XEN_GUEST_HANDLE_PARAM(ev=
tchn_op_t)){ _p(a1) }); \
            break; \
        case __HYPERVISOR_xen_version: \
            ret =3D compat_xen_version((int)(a1), (XEN_GUEST_HANDLE_PARAM=
(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_console_io: \
            ret =3D do_console_io((unsigned int)(a1), (unsigned int)(a2),=
 (XEN_GUEST_HANDLE_PARAM(char)){ _p(a3) }); \
            break; \
        case __HYPERVISOR_physdev_op_compat: \
            ret =3D compat_physdev_op_compat((XEN_GUEST_HANDLE_PARAM(phys=
dev_op_compat_t)){ _p(a1) }); \
            break; \
        case __HYPERVISOR_grant_table_op: \
            ret =3D compat_grant_table_op((unsigned int)(a1), (XEN_GUEST_=
HANDLE_PARAM(void)){ _p(a2) }, (unsigned int)(a3)); \
            break; \
        case __HYPERVISOR_vm_assist: \
            ret =3D do_vm_assist((unsigned int)(a1), (unsigned int)(a2));=
 \
            break; \
        case __HYPERVISOR_update_va_mapping_otherdomain: \
            ret =3D compat_update_va_mapping_otherdomain((unsigned int)(a=
1), (uint32_t)(a2), (uint32_t)(a3), (unsigned int)(a4), (domid_t)(a5)); \=

            break; \
        case __HYPERVISOR_vcpu_op: \
            ret =3D compat_vcpu_op((int)(a1), (unsigned int)(a2), (XEN_GU=
EST_HANDLE_PARAM(void)){ _p(a3) }); \
            break; \
        case __HYPERVISOR_xsm_op: \
            ret =3D compat_xsm_op((XEN_GUEST_HANDLE_PARAM(void)){ _p(a1) =
}); \
            break; \
        case __HYPERVISOR_nmi_op: \
            ret =3D compat_nmi_op((unsigned int)(a1), (XEN_GUEST_HANDLE_P=
ARAM(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_sched_op: \
            ret =3D compat_sched_op((int)(a1), (XEN_GUEST_HANDLE_PARAM(vo=
id)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_callback_op: \
            ret =3D compat_callback_op((int)(a1), (XEN_GUEST_HANDLE_PARAM=
(const_void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_xenoprof_op: \
            ret =3D compat_xenoprof_op((int)(a1), (XEN_GUEST_HANDLE_PARAM=
(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_event_channel_op: \
            ret =3D do_event_channel_op((int)(a1), (XEN_GUEST_HANDLE_PARA=
M(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_physdev_op: \
            ret =3D compat_physdev_op((int)(a1), (XEN_GUEST_HANDLE_PARAM(=
void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_hvm_op: \
            ret =3D do_hvm_op((unsigned long)(a1), (XEN_GUEST_HANDLE_PARA=
M(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_sysctl: \
            ret =3D do_sysctl((XEN_GUEST_HANDLE_PARAM(xen_sysctl_t)){ _p(=
a1) }); \
            break; \
        case __HYPERVISOR_domctl: \
            ret =3D do_domctl((XEN_GUEST_HANDLE_PARAM(xen_domctl_t)){ _p(=
a1) }); \
            break; \
        case __HYPERVISOR_kexec_op: \
            ret =3D compat_kexec_op((unsigned int)(a1), (XEN_GUEST_HANDLE=
_PARAM(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_xenpmu_op: \
            ret =3D do_xenpmu_op((unsigned int)(a1), (XEN_GUEST_HANDLE_PA=
RAM(xen_pmu_params_t)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_dm_op: \
            ret =3D compat_dm_op((domid_t)(a1), (unsigned int)(a2), (XEN_=
GUEST_HANDLE_PARAM(void)){ _p(a3) }); \
            break; \
        case __HYPERVISOR_hypfs_op: \
            ret =3D do_hypfs_op((unsigned int)(a1), (XEN_GUEST_HANDLE_PAR=
AM(const_char)){ _p(a2) }, (unsigned long)(a3), (XEN_GUEST_HANDLE_PARAM(v=
oid)){ _p(a4) }, (unsigned long)(a5)); \
            break; \
        case __HYPERVISOR_mca: \
            ret =3D do_mca((XEN_GUEST_HANDLE_PARAM(xen_mc_t)){ _p(a1) });=
 \
            break; \
        case __HYPERVISOR_paging_domctl_cont: \
            ret =3D do_paging_domctl_cont((XEN_GUEST_HANDLE_PARAM(xen_dom=
ctl_t)){ _p(a1) }); \
            break; \
        default: \
            ret =3D -ENOSYS; \
            break; \
        } \
}

#define hypercall_args_pv32 \
{ \
[__HYPERVISOR_set_trap_table] =3D 1, \
[__HYPERVISOR_mmu_update] =3D 4, \
[__HYPERVISOR_set_gdt] =3D 2, \
[__HYPERVISOR_stack_switch] =3D 2, \
[__HYPERVISOR_set_callbacks] =3D 4, \
[__HYPERVISOR_fpu_taskswitch] =3D 1, \
[__HYPERVISOR_sched_op_compat] =3D 2, \
[__HYPERVISOR_platform_op] =3D 1, \
[__HYPERVISOR_set_debugreg] =3D 2, \
[__HYPERVISOR_get_debugreg] =3D 1, \
[__HYPERVISOR_update_descriptor] =3D 4, \
[__HYPERVISOR_memory_op] =3D 2, \
[__HYPERVISOR_multicall] =3D 2, \
[__HYPERVISOR_update_va_mapping] =3D 4, \
[__HYPERVISOR_set_timer_op] =3D 2, \
[__HYPERVISOR_event_channel_op_compat] =3D 1, \
[__HYPERVISOR_xen_version] =3D 2, \
[__HYPERVISOR_console_io] =3D 3, \
[__HYPERVISOR_physdev_op_compat] =3D 1, \
[__HYPERVISOR_grant_table_op] =3D 3, \
[__HYPERVISOR_vm_assist] =3D 2, \
[__HYPERVISOR_update_va_mapping_otherdomain] =3D 5, \
[__HYPERVISOR_iret] =3D 0, \
[__HYPERVISOR_vcpu_op] =3D 3, \
[__HYPERVISOR_set_segment_base] =3D 2, \
[__HYPERVISOR_mmuext_op] =3D 4, \
[__HYPERVISOR_xsm_op] =3D 1, \
[__HYPERVISOR_nmi_op] =3D 2, \
[__HYPERVISOR_sched_op] =3D 2, \
[__HYPERVISOR_callback_op] =3D 2, \
[__HYPERVISOR_xenoprof_op] =3D 2, \
[__HYPERVISOR_event_channel_op] =3D 2, \
[__HYPERVISOR_physdev_op] =3D 2, \
[__HYPERVISOR_hvm_op] =3D 2, \
[__HYPERVISOR_sysctl] =3D 1, \
[__HYPERVISOR_domctl] =3D 1, \
[__HYPERVISOR_kexec_op] =3D 2, \
[__HYPERVISOR_xenpmu_op] =3D 2, \
[__HYPERVISOR_dm_op] =3D 3, \
[__HYPERVISOR_hypfs_op] =3D 5, \
[__HYPERVISOR_mca] =3D 1, \
[__HYPERVISOR_paging_domctl_cont] =3D 1, \
}

#define call_handlers_hvm32(num, ret, a1, a2, a3, a4, a5) \
{ \
    uint64_t mask =3D 1ULL << num; \
    if ( likely(mask & ((1ULL << __HYPERVISOR_vcpu_op) | (1ULL << __HYPER=
VISOR_event_channel_op))) ) \
    { \
        if ( num =3D=3D __HYPERVISOR_vcpu_op ) \
            ret =3D compat_vcpu_op((int)(a1), (unsigned int)(a2), (XEN_GU=
EST_HANDLE_PARAM(void)){ _p(a3) }); \
        else \
            ret =3D do_event_channel_op((int)(a1), (XEN_GUEST_HANDLE_PARA=
M(void)){ _p(a2) }); \
    } \
    else         switch ( num ) \
        { \
        case __HYPERVISOR_platform_op: \
            ret =3D compat_platform_op((XEN_GUEST_HANDLE_PARAM(compat_pla=
tform_op_t)){ _p(a1) }); \
            break; \
        case __HYPERVISOR_memory_op: \
            ret =3D hvm_memory_op((unsigned long)(a1), (XEN_GUEST_HANDLE_=
PARAM(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_multicall: \
            ret =3D compat_multicall((XEN_GUEST_HANDLE_PARAM(multicall_en=
try_compat_t)){ _p(a1) }, (uint32_t)(a2)); \
            break; \
        case __HYPERVISOR_set_timer_op: \
            ret =3D compat_set_timer_op((uint32_t)(a1), (int32_t)(a2)); \=

            break; \
        case __HYPERVISOR_xen_version: \
            ret =3D compat_xen_version((int)(a1), (XEN_GUEST_HANDLE_PARAM=
(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_console_io: \
            ret =3D do_console_io((unsigned int)(a1), (unsigned int)(a2),=
 (XEN_GUEST_HANDLE_PARAM(char)){ _p(a3) }); \
            break; \
        case __HYPERVISOR_grant_table_op: \
            ret =3D hvm_grant_table_op((unsigned int)(a1), (XEN_GUEST_HAN=
DLE_PARAM(void)){ _p(a2) }, (unsigned int)(a3)); \
            break; \
        case __HYPERVISOR_vm_assist: \
            ret =3D do_vm_assist((unsigned int)(a1), (unsigned int)(a2));=
 \
            break; \
        case __HYPERVISOR_mmuext_op: \
            ret =3D compat_mmuext_op((XEN_GUEST_HANDLE_PARAM(void)){ _p(a=
1) }, (unsigned int)(a2), (XEN_GUEST_HANDLE_PARAM(uint)){ _p(a3) }, (unsi=
gned int)(a4)); \
            break; \
        case __HYPERVISOR_xsm_op: \
            ret =3D compat_xsm_op((XEN_GUEST_HANDLE_PARAM(void)){ _p(a1) =
}); \
            break; \
        case __HYPERVISOR_sched_op: \
            ret =3D compat_sched_op((int)(a1), (XEN_GUEST_HANDLE_PARAM(vo=
id)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_physdev_op: \
            ret =3D hvm_physdev_op((int)(a1), (XEN_GUEST_HANDLE_PARAM(voi=
d)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_hvm_op: \
            ret =3D do_hvm_op((unsigned long)(a1), (XEN_GUEST_HANDLE_PARA=
M(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_sysctl: \
            ret =3D do_sysctl((XEN_GUEST_HANDLE_PARAM(xen_sysctl_t)){ _p(=
a1) }); \
            break; \
        case __HYPERVISOR_domctl: \
            ret =3D do_domctl((XEN_GUEST_HANDLE_PARAM(xen_domctl_t)){ _p(=
a1) }); \
            break; \
        case __HYPERVISOR_xenpmu_op: \
            ret =3D do_xenpmu_op((unsigned int)(a1), (XEN_GUEST_HANDLE_PA=
RAM(xen_pmu_params_t)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_dm_op: \
            ret =3D compat_dm_op((domid_t)(a1), (unsigned int)(a2), (XEN_=
GUEST_HANDLE_PARAM(void)){ _p(a3) }); \
            break; \
        case __HYPERVISOR_hypfs_op: \
            ret =3D do_hypfs_op((unsigned int)(a1), (XEN_GUEST_HANDLE_PAR=
AM(const_char)){ _p(a2) }, (unsigned long)(a3), (XEN_GUEST_HANDLE_PARAM(v=
oid)){ _p(a4) }, (unsigned long)(a5)); \
            break; \
        case __HYPERVISOR_paging_domctl_cont: \
            ret =3D do_paging_domctl_cont((XEN_GUEST_HANDLE_PARAM(xen_dom=
ctl_t)){ _p(a1) }); \
            break; \
        default: \
            ret =3D -ENOSYS; \
            break; \
        } \
}

#define hypercall_args_hvm32 \
{ \
[__HYPERVISOR_platform_op] =3D 1, \
[__HYPERVISOR_memory_op] =3D 2, \
[__HYPERVISOR_multicall] =3D 2, \
[__HYPERVISOR_set_timer_op] =3D 2, \
[__HYPERVISOR_xen_version] =3D 2, \
[__HYPERVISOR_console_io] =3D 3, \
[__HYPERVISOR_grant_table_op] =3D 3, \
[__HYPERVISOR_vm_assist] =3D 2, \
[__HYPERVISOR_vcpu_op] =3D 3, \
[__HYPERVISOR_mmuext_op] =3D 4, \
[__HYPERVISOR_xsm_op] =3D 1, \
[__HYPERVISOR_sched_op] =3D 2, \
[__HYPERVISOR_event_channel_op] =3D 2, \
[__HYPERVISOR_physdev_op] =3D 2, \
[__HYPERVISOR_hvm_op] =3D 2, \
[__HYPERVISOR_sysctl] =3D 1, \
[__HYPERVISOR_domctl] =3D 1, \
[__HYPERVISOR_xenpmu_op] =3D 2, \
[__HYPERVISOR_dm_op] =3D 3, \
[__HYPERVISOR_hypfs_op] =3D 5, \
[__HYPERVISOR_paging_domctl_cont] =3D 1, \
}

#define call_handlers_pv64(num, ret, a1, a2, a3, a4, a5) \
{ \
    uint64_t mask =3D 1ULL << num; \
    if ( likely(mask & ((1ULL << __HYPERVISOR_mmu_update) | (1ULL << __HY=
PERVISOR_iret))) ) \
    { \
        if ( num =3D=3D __HYPERVISOR_mmu_update ) \
            ret =3D do_mmu_update((XEN_GUEST_HANDLE_PARAM(mmu_update_t)){=
 _p(a1) }, (unsigned int)(a2), (XEN_GUEST_HANDLE_PARAM(uint)){ _p(a3) }, =
(unsigned int)(a4)); \
        else \
            ret =3D do_iret(); \
    } \
    else if ( likely(mask & ((1ULL << __HYPERVISOR_stack_switch) | (1ULL =
<< __HYPERVISOR_multicall) | (1ULL << __HYPERVISOR_set_segment_base) | (1=
ULL << __HYPERVISOR_mmuext_op))) ) \
    { \
        switch ( num ) \
        { \
        case __HYPERVISOR_stack_switch: \
            ret =3D do_stack_switch((unsigned long)(a1), (unsigned long)(=
a2)); \
            break; \
        case __HYPERVISOR_multicall: \
            ret =3D do_multicall((XEN_GUEST_HANDLE_PARAM(multicall_entry_=
t)){ _p(a1) }, (unsigned int)(a2)); \
            break; \
        case __HYPERVISOR_set_segment_base: \
            ret =3D do_set_segment_base((unsigned int)(a1), (unsigned lon=
g)(a2)); \
            break; \
        case __HYPERVISOR_mmuext_op: \
            ret =3D do_mmuext_op((XEN_GUEST_HANDLE_PARAM(mmuext_op_t)){ _=
p(a1) }, (unsigned int)(a2), (XEN_GUEST_HANDLE_PARAM(uint)){ _p(a3) }, (u=
nsigned int)(a4)); \
            break; \
        default: \
            ret =3D -ENOSYS; \
            break; \
        } \
    } \
    else         switch ( num ) \
        { \
        case __HYPERVISOR_set_trap_table: \
            ret =3D do_set_trap_table((XEN_GUEST_HANDLE_PARAM(const_trap_=
info_t)){ _p(a1) }); \
            break; \
        case __HYPERVISOR_set_gdt: \
            ret =3D do_set_gdt((XEN_GUEST_HANDLE_PARAM(xen_ulong_t)){ _p(=
a1) }, (unsigned int)(a2)); \
            break; \
        case __HYPERVISOR_set_callbacks: \
            ret =3D do_set_callbacks((unsigned long)(a1), (unsigned long)=
(a2), (unsigned long)(a3)); \
            break; \
        case __HYPERVISOR_fpu_taskswitch: \
            ret =3D do_fpu_taskswitch((int)(a1)); \
            break; \
        case __HYPERVISOR_sched_op_compat: \
            ret =3D do_sched_op_compat((int)(a1), (unsigned long)(a2)); \=

            break; \
        case __HYPERVISOR_platform_op: \
            ret =3D do_platform_op((XEN_GUEST_HANDLE_PARAM(xen_platform_o=
p_t)){ _p(a1) }); \
            break; \
        case __HYPERVISOR_set_debugreg: \
            ret =3D do_set_debugreg((int)(a1), (unsigned long)(a2)); \
            break; \
        case __HYPERVISOR_get_debugreg: \
            ret =3D do_get_debugreg((int)(a1)); \
            break; \
        case __HYPERVISOR_update_descriptor: \
            ret =3D do_update_descriptor((uint64_t)(a1), (seg_desc_t)(a2)=
); \
            break; \
        case __HYPERVISOR_memory_op: \
            ret =3D do_memory_op((unsigned long)(a1), (XEN_GUEST_HANDLE_P=
ARAM(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_update_va_mapping: \
            ret =3D do_update_va_mapping((unsigned long)(a1), (uint64_t)(=
a2), (unsigned long)(a3)); \
            break; \
        case __HYPERVISOR_set_timer_op: \
            ret =3D do_set_timer_op((s_time_t)(a1)); \
            break; \
        case __HYPERVISOR_event_channel_op_compat: \
            ret =3D do_event_channel_op_compat((XEN_GUEST_HANDLE_PARAM(ev=
tchn_op_t)){ _p(a1) }); \
            break; \
        case __HYPERVISOR_xen_version: \
            ret =3D do_xen_version((int)(a1), (XEN_GUEST_HANDLE_PARAM(voi=
d)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_console_io: \
            ret =3D do_console_io((unsigned int)(a1), (unsigned int)(a2),=
 (XEN_GUEST_HANDLE_PARAM(char)){ _p(a3) }); \
            break; \
        case __HYPERVISOR_physdev_op_compat: \
            ret =3D do_physdev_op_compat((XEN_GUEST_HANDLE_PARAM(physdev_=
op_t)){ _p(a1) }); \
            break; \
        case __HYPERVISOR_grant_table_op: \
            ret =3D do_grant_table_op((unsigned int)(a1), (XEN_GUEST_HAND=
LE_PARAM(void)){ _p(a2) }, (unsigned int)(a3)); \
            break; \
        case __HYPERVISOR_vm_assist: \
            ret =3D do_vm_assist((unsigned int)(a1), (unsigned int)(a2));=
 \
            break; \
        case __HYPERVISOR_update_va_mapping_otherdomain: \
            ret =3D do_update_va_mapping_otherdomain((unsigned long)(a1),=
 (uint64_t)(a2), (unsigned long)(a3), (domid_t)(a4)); \
            break; \
        case __HYPERVISOR_vcpu_op: \
            ret =3D do_vcpu_op((int)(a1), (unsigned int)(a2), (XEN_GUEST_=
HANDLE_PARAM(void)){ _p(a3) }); \
            break; \
        case __HYPERVISOR_xsm_op: \
            ret =3D do_xsm_op((XEN_GUEST_HANDLE_PARAM(void)){ _p(a1) }); =
\
            break; \
        case __HYPERVISOR_nmi_op: \
            ret =3D do_nmi_op((unsigned int)(a1), (XEN_GUEST_HANDLE_PARAM=
(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_sched_op: \
            ret =3D do_sched_op((int)(a1), (XEN_GUEST_HANDLE_PARAM(void))=
{ _p(a2) }); \
            break; \
        case __HYPERVISOR_callback_op: \
            ret =3D do_callback_op((int)(a1), (XEN_GUEST_HANDLE_PARAM(con=
st_void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_xenoprof_op: \
            ret =3D do_xenoprof_op((int)(a1), (XEN_GUEST_HANDLE_PARAM(voi=
d)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_event_channel_op: \
            ret =3D do_event_channel_op((int)(a1), (XEN_GUEST_HANDLE_PARA=
M(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_physdev_op: \
            ret =3D do_physdev_op((int)(a1), (XEN_GUEST_HANDLE_PARAM(void=
)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_hvm_op: \
            ret =3D do_hvm_op((unsigned long)(a1), (XEN_GUEST_HANDLE_PARA=
M(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_sysctl: \
            ret =3D do_sysctl((XEN_GUEST_HANDLE_PARAM(xen_sysctl_t)){ _p(=
a1) }); \
            break; \
        case __HYPERVISOR_domctl: \
            ret =3D do_domctl((XEN_GUEST_HANDLE_PARAM(xen_domctl_t)){ _p(=
a1) }); \
            break; \
        case __HYPERVISOR_kexec_op: \
            ret =3D do_kexec_op((unsigned int)(a1), (XEN_GUEST_HANDLE_PAR=
AM(void)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_xenpmu_op: \
            ret =3D do_xenpmu_op((unsigned int)(a1), (XEN_GUEST_HANDLE_PA=
RAM(xen_pmu_params_t)){ _p(a2) }); \
            break; \
        case __HYPERVISOR_dm_op: \
            ret =3D do_dm_op((domid_t)(a1), (unsigned int)(a2), (XEN_GUES=
T_HANDLE_PARAM(xen_dm_op_buf_t)){ _p(a3) }); \
            break; \
        case __HYPERVISOR_hypfs_op: \
            ret =3D do_hypfs_op((unsigned int)(a1), (XEN_GUEST_HANDLE_PAR=
AM(const_char)){ _p(a2) }, (unsigned long)(a3), (XEN_GUEST_HANDLE_PARAM(v=
oid)){ _p(a4) }, (unsigned long)(a5)); \
            break; \
        case __HYPERVISOR_mca: \
            ret =3D do_mca((XEN_GUEST_HANDLE_PARAM(xen_mc_t)){ _p(a1) });=
 \
            break; \
        case __HYPERVISOR_paging_domctl_cont: \
            ret =3D do_paging_domctl_cont((XEN_GUEST_HANDLE_PARAM(xen_dom=
ctl_t)){ _p(a1) }); \
            break; \
        default: \
            ret =3D -ENOSYS; \
            break; \
        } \
}

#define hypercall_args_pv64 \
{ \
[__HYPERVISOR_set_trap_table] =3D 1, \
[__HYPERVISOR_mmu_update] =3D 4, \
[__HYPERVISOR_set_gdt] =3D 2, \
[__HYPERVISOR_stack_switch] =3D 2, \
[__HYPERVISOR_set_callbacks] =3D 3, \
[__HYPERVISOR_fpu_taskswitch] =3D 1, \
[__HYPERVISOR_sched_op_compat] =3D 2, \
[__HYPERVISOR_platform_op] =3D 1, \
[__HYPERVISOR_set_debugreg] =3D 2, \
[__HYPERVISOR_get_debugreg] =3D 1, \
[__HYPERVISOR_update_descriptor] =3D 2, \
[__HYPERVISOR_memory_op] =3D 2, \
[__HYPERVISOR_multicall] =3D 2, \
[__HYPERVISOR_update_va_mapping] =3D 3, \
[__HYPERVISOR_set_timer_op] =3D 1, \
[__HYPERVISOR_event_channel_op_compat] =3D 1, \
[__HYPERVISOR_xen_version] =3D 2, \
[__HYPERVISOR_console_io] =3D 3, \
[__HYPERVISOR_physdev_op_compat] =3D 1, \
[__HYPERVISOR_grant_table_op] =3D 3, \
[__HYPERVISOR_vm_assist] =3D 2, \
[__HYPERVISOR_update_va_mapping_otherdomain] =3D 4, \
[__HYPERVISOR_iret] =3D 0, \
[__HYPERVISOR_vcpu_op] =3D 3, \
[__HYPERVISOR_set_segment_base] =3D 2, \
[__HYPERVISOR_mmuext_op] =3D 4, \
[__HYPERVISOR_xsm_op] =3D 1, \
[__HYPERVISOR_nmi_op] =3D 2, \
[__HYPERVISOR_sched_op] =3D 2, \
[__HYPERVISOR_callback_op] =3D 2, \
[__HYPERVISOR_xenoprof_op] =3D 2, \
[__HYPERVISOR_event_channel_op] =3D 2, \
[__HYPERVISOR_physdev_op] =3D 2, \
[__HYPERVISOR_hvm_op] =3D 2, \
[__HYPERVISOR_sysctl] =3D 1, \
[__HYPERVISOR_domctl] =3D 1, \
[__HYPERVISOR_kexec_op] =3D 2, \
[__HYPERVISOR_xenpmu_op] =3D 2, \
[__HYPERVISOR_dm_op] =3D 3, \
[__HYPERVISOR_hypfs_op] =3D 5, \
[__HYPERVISOR_mca] =3D 1, \
[__HYPERVISOR_paging_domctl_cont] =3D 1, \
}

--------------0EFA0B646AEC59419545C052
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0EFA0B646AEC59419545C052--

--Vns8PW5NAQt3VlW3jTGS4IRGYsk1YNAFc--

--unfgGDGOL9Ve1wYNtoNuvWjfYqO4LXhqI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGCpt0FAwAAAAAACgkQsN6d1ii/Ey/L
HQf+NKpmDXn32YXb/3dWwpNpsuXKhST+UVEH6XuHNXUZFxiz09cCqyfR2ZVwJAYSi8bO4DOgAHTk
fft7DlLFWvcOuPgsS1wgub8woA1lXINbS7KFFLEvrLEZ6Hpw3D2V8+ql5OHn4tkTR9UGn6D6monG
u8DMN70QXzQL5yj4jefE9FoLJczkxUa1Vqnpu9+g23vCQ5ctSaVXaVKRl1U0l9mJWaPvkzVcK/jm
P9X5UScaupr1DN179CtgCuuvCLrJPNInH1lEdmDseDqq+WlPGr+PhLzNbu3xl8ITdsNlobmCgoIK
5clXqGepvlIf4EULi6thPInfSIAD4W+oUGqcpM2nLg==
=ywsz
-----END PGP SIGNATURE-----

--unfgGDGOL9Ve1wYNtoNuvWjfYqO4LXhqI--

