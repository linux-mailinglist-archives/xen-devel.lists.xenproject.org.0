Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8426945B3BA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 06:08:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229973.397714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkVW-0006u3-7E; Wed, 24 Nov 2021 05:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229973.397714; Wed, 24 Nov 2021 05:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkVW-0006mZ-0U; Wed, 24 Nov 2021 05:07:46 +0000
Received: by outflank-mailman (input) for mailman id 229973;
 Wed, 24 Nov 2021 00:19:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j+06=QL=huawei.com=longpeng2@srs-se1.protection.inumbo.net>)
 id 1mpg0a-0008Tp-UM
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 00:19:33 +0000
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e6caec0-4cbc-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 01:19:28 +0100 (CET)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HzM4y7539z1DJTY;
 Wed, 24 Nov 2021 08:16:50 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 24 Nov 2021 08:19:22 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 24 Nov 2021 08:19:22 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Wed, 24 Nov 2021 08:19:22 +0800
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
X-Inumbo-ID: 2e6caec0-4cbc-11ec-a9d2-d9f7a1cc8784
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
	<longpeng2@huawei.com>
To: Valentin Schneider <valentin.schneider@arm.com>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gonglei
 (Arei)" <arei.gonglei@huawei.com>, "x86@kernel.org" <x86@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Peter
 Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, "Boris
 Ostrovsky" <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
	<hpa@zytor.com>
Subject: RE: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be
 brought up again.
Thread-Topic: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be
 brought up again.
Thread-Index: AQHX37hRU5zyn85RmkiAPYCSmtUPkawQ5hYAgADlkmA=
Date: Wed, 24 Nov 2021 00:19:22 +0000
Message-ID: <408748bfefde4a1b963382d372792661@huawei.com>
References: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
 <87r1b6d9kl.mognet@arm.com>
In-Reply-To: <87r1b6d9kl.mognet@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected



> -----Original Message-----
> From: Valentin Schneider [mailto:valentin.schneider@arm.com]
> Sent: Wednesday, November 24, 2021 2:14 AM
> To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>; Longpeng (Mike, Cl=
oud
> Infrastructure Service Product Dept.) <longpeng2@huawei.com>
> Cc: linux-kernel@vger.kernel.org; Gonglei (Arei) <arei.gonglei@huawei.com=
>;
> x86@kernel.org; xen-devel@lists.xenproject.org; Peter Zijlstra
> <peterz@infradead.org>; Ingo Molnar <mingo@kernel.org>; Boris Ostrovsky
> <boris.ostrovsky@oracle.com>; Juergen Gross <jgross@suse.com>; Stefano
> Stabellini <sstabellini@kernel.org>; Thomas Gleixner <tglx@linutronix.de>=
;
> Ingo Molnar <mingo@redhat.com>; Borislav Petkov <bp@alien8.de>; Dave Hans=
en
> <dave.hansen@linux.intel.com>; H. Peter Anvin <hpa@zytor.com>
> Subject: Re: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state t=
o be
> brought up again.
>=20
> On 22/11/21 16:47, Sebastian Andrzej Siewior wrote:
> > From: "Longpeng(Mike)" <longpeng2@huawei.com>
> >
> > A CPU will not show up in virtualized environment which includes an
> > Enclave. The VM splits its resources into a primary VM and a Enclave
> > VM. While the Enclave is active, the hypervisor will ignore all request=
s
> > to bring up a CPU and this CPU will remain in CPU_UP_PREPARE state.
> > The kernel will wait up to ten seconds for CPU to show up
> > (do_boot_cpu()) and then rollback the hotplug state back to
> > CPUHP_OFFLINE leaving the CPU state in CPU_UP_PREPARE. The CPU state is
> > set back to CPUHP_TEARDOWN_CPU during the CPU_POST_DEAD stage.
> >
>=20
> For my own education, this is talking about *host* CPU hotplug, right?
>=20

It's about the *guest* CPU hotplug.

1. Users in Primary VM:
Split out vcpuX (offline from Primary VM) for Enclave VM

2. Hypervisor:
Set a flag for vcpuX, all requests from Primary VM to bring up vcpuX
will be ignore.

3. Users in Primary VM:
echo 1 > .../vcpuX/online would fail and leave the CPU state of vcpuX
in CPU_UP_PREPARE.

4. Users in Primary VM terminate the Enclave VM:
Hypervisor should clear the flag (set in step 2) of vcpuX, so the vcpuX
can continue to receive requests.

5. Users in Primary VM:
Try to online the vcpuX again (expect success), but it's always failed.


> > After the Enclave VM terminates, the primary VM can bring up the CPU
> > again.
> >
> > Allow to bring up the CPU if it is in the CPU_UP_PREPARE state.
> >
> > [bigeasy: Rewrite commit description.]
> >
> > Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Link: https://lore.kernel.org/r/20210901051143.2752-1-longpeng2@huawei.=
com
> > ---
> >
> > For XEN: this changes the behaviour as it allows to invoke
> > cpu_initialize_context() again should it have have earlier. I *think*
> > this is okay and would to bring up the CPU again should the memory
> > allocation in cpu_initialize_context() fail.
>=20
> Virt stuff notwithstanding, that looks OK to me.
> Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
>=20
> That said, AFAICT only powerpc makes actual use of the state being set to
> CPU_UP_PREPARE, it looks to be needless bookkeeping for everyone else (an=
d
> there's archs that seem happy using only CPU_DEAD / CPU_POST_DEAD).
>=20
> >
> >  kernel/smpboot.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/kernel/smpboot.c b/kernel/smpboot.c
> > index f6bc0bc8a2aab..34958d7fe2c1c 100644
> > --- a/kernel/smpboot.c
> > +++ b/kernel/smpboot.c
> > @@ -392,6 +392,13 @@ int cpu_check_up_prepare(int cpu)
> >                */
> >               return -EAGAIN;
> >
> > +	case CPU_UP_PREPARE:
> > +		/*
> > +		 * Timeout while waiting for the CPU to show up. Allow to try
> > +		 * again later.
> > +		 */
> > +		return 0;
> > +
> >       default:
> >
> >               /* Should not happen.  Famous last words. */
> > --
> > 2.33.1

