Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586253EFC6F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 08:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168099.306895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGF0G-0008Tr-Hj; Wed, 18 Aug 2021 06:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168099.306895; Wed, 18 Aug 2021 06:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGF0G-0008RH-EL; Wed, 18 Aug 2021 06:24:44 +0000
Received: by outflank-mailman (input) for mailman id 168099;
 Wed, 18 Aug 2021 06:24:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jUNG=NJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mGF0F-0008RA-06
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 06:24:43 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8238340-ffec-11eb-a533-12813bfff9fa;
 Wed, 18 Aug 2021 06:24:41 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 45B5120058;
 Wed, 18 Aug 2021 06:24:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1AA4713357;
 Wed, 18 Aug 2021 06:24:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 91cRBainHGFQcQAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 18 Aug 2021 06:24:40 +0000
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
X-Inumbo-ID: f8238340-ffec-11eb-a533-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629267880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ELWV/9WePrthQVZs1AOXcFm6/I3hOwYbJur2CWshDmQ=;
	b=pT+eNUAUDkZsOYXrGOwu6/XPIK55b0oJ9U7AASDfSzdsVIg0UWaumwJ3UgGRM3qnzvxIKz
	FXEsc6C0v+s9H07pnFeOIBf+XiBxe4zfqETn0oXMEoC2TDMwt7WqxWxSP6IdO8TSbSTmRL
	5mO5bbLSk/pMqfrLDwuY6XneN9g9qCw=
Subject: Re: S3 resume issue in cpufreq ->
 get_cpu_idle_time->vcpu_runstate_get
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <YRvMy9NgGxYKRcNc@mail-itl>
 <42948041-59a5-e243-ed39-6e2afe3fd1cd@suse.com>
Message-ID: <d700e9f6-8c64-52b6-6881-5816c2895200@suse.com>
Date: Wed, 18 Aug 2021 08:24:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <42948041-59a5-e243-ed39-6e2afe3fd1cd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hefKhzCsV2d5B36fN4ZnZDxj0A7UhNX4f"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hefKhzCsV2d5B36fN4ZnZDxj0A7UhNX4f
Content-Type: multipart/mixed; boundary="fa6yvcSa5vATSfOzGYiH9fT2daJT6sfVQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d700e9f6-8c64-52b6-6881-5816c2895200@suse.com>
Subject: Re: S3 resume issue in cpufreq ->
 get_cpu_idle_time->vcpu_runstate_get
References: <YRvMy9NgGxYKRcNc@mail-itl>
 <42948041-59a5-e243-ed39-6e2afe3fd1cd@suse.com>
In-Reply-To: <42948041-59a5-e243-ed39-6e2afe3fd1cd@suse.com>

--fa6yvcSa5vATSfOzGYiH9fT2daJT6sfVQ
Content-Type: multipart/mixed;
 boundary="------------741F0E58D00347898C394009"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------741F0E58D00347898C394009
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Marek,

On 17.08.21 17:15, Juergen Gross wrote:
> On 17.08.21 16:50, Marek Marczykowski-G=C3=B3recki wrote:
>> On Tue, Aug 17, 2021 at 04:04:24PM +0200, Jan Beulich wrote:
>>> On 17.08.2021 15:48, Marek Marczykowski-G=C3=B3recki wrote:
>>>> On Tue, Aug 17, 2021 at 02:29:20PM +0100, Andrew Cooper wrote:
>>>>> On 17/08/2021 14:21, Jan Beulich wrote:
>>>>>> On 17.08.2021 15:06, Andrew Cooper wrote:
>>>>>>> Perhaps we want the cpu_down() logic to explicitly invalidate the=
ir
>>>>>>> lazily cached values?
>>>>>> I'd rather do this on the cpu_up() path (no point clobbering what =
may
>>>>>> get further clobbered, and then perhaps not to a value of our=20
>>>>>> liking),
>>>>>> yet then we can really avoid doing this from a notifier and=20
>>>>>> instead do
>>>>>> it early enough in xstate_init() (taking care of XSS at the same=20
>>>>>> time).
>>>>
>>>> Funny you mention notifiers. Apparently cpufreq driver does use it t=
o
>>>> initialize things. And fails to do so:
>>>>
>>>> (XEN) Finishing wakeup from ACPI S3 state.
>>>> (XEN) CPU0: xstate: size: 0x440 (uncompressed 0x440) and states: 0x1=
f
>>>> (XEN) Enabling non-boot CPUs=C2=A0 ...
>>>> (XEN) CPU1: xstate: size: 0x440 (uncompressed 0x440) and states: 0x1=
f
>>>> (XEN) ----[ Xen-4.16-unstable=C2=A0 x86_64=C2=A0 debug=3Dy=C2=A0 Not=
 tainted ]----
>>>> (XEN) CPU:=C2=A0=C2=A0=C2=A0 0
>>>> (XEN) RIP:=C2=A0=C2=A0=C2=A0 e008:[<ffff82d04024ad2b>] vcpu_runstate=
_get+0x153/0x244
>>>> (XEN) RFLAGS: 0000000000010246=C2=A0=C2=A0 CONTEXT: hypervisor
>>>> (XEN) rax: 0000000000000000=C2=A0=C2=A0 rbx: ffff830049667c50=C2=A0=C2=
=A0 rcx:=20
>>>> 0000000000000001
>>>> (XEN) rdx: 000000321d74d000=C2=A0=C2=A0 rsi: ffff830049667c50=C2=A0=C2=
=A0 rdi:=20
>>>> ffff83025dcc0000
>>>> (XEN) rbp: ffff830049667c40=C2=A0=C2=A0 rsp: ffff830049667c10=C2=A0=C2=
=A0 r8: =20
>>>> ffff83020511a820
>>>> (XEN) r9:=C2=A0 ffff82d04057ef78=C2=A0=C2=A0 r10: 0180000000000000=C2=
=A0=C2=A0 r11:=20
>>>> 8000000000000000
>>>> (XEN) r12: ffff83025dcc0000=C2=A0=C2=A0 r13: ffff830205118c60=C2=A0=C2=
=A0 r14:=20
>>>> 0000000000000001
>>>> (XEN) r15: 0000000000000010=C2=A0=C2=A0 cr0: 000000008005003b=C2=A0=C2=
=A0 cr4:=20
>>>> 00000000003526e0
>>>> (XEN) cr3: 0000000049656000=C2=A0=C2=A0 cr2: 0000000000000028
>>>> (XEN) fsb: 0000000000000000=C2=A0=C2=A0 gsb: 0000000000000000=C2=A0=C2=
=A0 gss:=20
>>>> 0000000000000000
>>>> (XEN) ds: 0000=C2=A0=C2=A0 es: 0000=C2=A0=C2=A0 fs: 0000=C2=A0=C2=A0=
 gs: 0000=C2=A0=C2=A0 ss: 0000=C2=A0=C2=A0 cs: e008
>>>> (XEN) Xen code around <ffff82d04024ad2b>=20
>>>> (vcpu_runstate_get+0x153/0x244):
>>>> (XEN)=C2=A0 48 8b 14 ca 48 8b 04 02 <4c> 8b 70 28 e9 01 ff ff ff 4c =
8d 3d=20
>>>> dd 64 32 00
>>>> (XEN) Xen stack trace from rsp=3Dffff830049667c10:
>>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000180 ffff83025dcbd410 ffff830205=
11bf30=20
>>>> ffff830205118c60
>>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000001 0000000000000010 ffff830049=
667c80=20
>>>> ffff82d04024ae73
>>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 0000000000=
000000=20
>>>> 0000000000000000
>>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 ffff830049=
667cb8=20
>>>> ffff82d0402560a9
>>>> (XEN)=C2=A0=C2=A0=C2=A0 ffff830205118320 0000000000000001 ffff830205=
11bf30=20
>>>> ffff83025dc7a6f0
>>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 ffff830049667d58 ffff82d040=
254cb1=20
>>>> 00000001402e9f74
>>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 ffff830049667d10 ffff82d040=
224eda=20
>>>> 000000000025dc81
>>>> (XEN)=C2=A0=C2=A0=C2=A0 000000321d74d000 ffff82d040571278 0000000000=
000001=20
>>>> ffff830049667d28
>>>> (XEN)=C2=A0=C2=A0=C2=A0 ffff82d040228b44 ffff82d0403102cf 0000000000=
000000=20
>>>> ffff82d0402283a4
>>>> (XEN)=C2=A0=C2=A0=C2=A0 ffff82d040459688 ffff82d040459680 ffff82d040=
459240=20
>>>> 0000000000000004
>>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 ffff830049667d68 ffff82d040=
25510e=20
>>>> ffff830049667db0
>>>> (XEN)=C2=A0=C2=A0=C2=A0 ffff82d040221ba4 0000000000000000 0000000000=
000001=20
>>>> 0000000000000001
>>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 ffff830049667e00 0000000000=
000001=20
>>>> ffff82d04058a5c0
>>>> (XEN)=C2=A0=C2=A0=C2=A0 ffff830049667dc8 ffff82d040203867 0000000000=
000001=20
>>>> ffff830049667df0
>>>> (XEN)=C2=A0=C2=A0=C2=A0 ffff82d040203c51 ffff82d040459400 0000000000=
000001=20
>>>> 0000000000000010
>>>> (XEN)=C2=A0=C2=A0=C2=A0 ffff830049667e20 ffff82d040203e26 ffff830049=
667ef8=20
>>>> 0000000000000000
>>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000003 0000000000000200 ffff830049=
667e50=20
>>>> ffff82d040270bac
>>>> (XEN)=C2=A0=C2=A0=C2=A0 ffff83020116a640 ffff830258ff6000 0000000000=
000000=20
>>>> 0000000000000000
>>>> (XEN)=C2=A0=C2=A0=C2=A0 ffff830049667e70 ffff82d0402056aa ffff830258=
ff61b8=20
>>>> ffff82d0405701b0
>>>> (XEN)=C2=A0=C2=A0=C2=A0 ffff830049667e88 ffff82d04022963c ffff82d040=
5701a0=20
>>>> ffff830049667eb8
>>>> (XEN) Xen call trace:
>>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04024ad2b>] R vcpu_runstate_get+0x1=
53/0x244
>>
>> This is xen/common/sched/core.c:322. get_sched_res(v->processor) is
>> NULL at this point for CPU1.
>>
>> The only place that can calls set_sched_res() and doesn't expect the
>> previous value to be valid, is cpu_schedule_up(). For non-BSP its call=
ed
>> _only_ from notifier at CPU_UP_PREPARE (cpu_schedule_callback()), but
>> that notifier explicitly exclude suspend/resume case:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 static int cpu_schedule_callback(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct notifier_block=
 *nfb, unsigned long action, void *hcpu)
>> =C2=A0=C2=A0=C2=A0=C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu =3D =
(unsigned long)hcpu;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int rc =3D 0;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * All scheduler=
 related suspend/resume handling needed is=20
>> done in
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * cpupool.c.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( system_state > S=
YS_STATE_active )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return NOTIFY_DONE;
>>
>> But, nothing in cpupool.c is calling into set_sched_res().
>>
>> On the other hand, sched_rm_cpu() (which I believe is called as part o=
f
>> parking the CPU) calls cpu_schedule_down(), which then calls
>> set_sched_res(cpu, NULL).
>>
>> In short: scheduler for parked CPUs is not re-initialized during resum=
e.
>> But cpufreq expects it to be...
>=20
> I'll be looking into that.

Could you please try the attached patch?


Juergen


--------------741F0E58D00347898C394009
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-sched-fix-get_cpu_idle_time-for-smt-0-suspend-re.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-xen-sched-fix-get_cpu_idle_time-for-smt-0-suspend-re.pa";
 filename*1="tch"

=46rom e38d0816a33fbaa3c0c45bcd6e9d433b1e021222 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Dario Faggioli <dfaggioli@suse.com>
Date: Wed, 18 Aug 2021 08:18:20 +0200
Subject: [PATCH] xen/sched: fix get_cpu_idle_time() for smt=3D0 suspend/r=
esume
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

With smt=3D0 during a suspend/resume cycle of the machine the threads
which have been parked before will briefly come up again. This can
result in problems e.g. with cpufreq driver being active as this will
call into get_cpu_idle_time() for a cpu without initialized scheduler
data.

Fix that by letting get_cpu_idle_time() deal with this case.

Fixes: 132cbe8f35632fb2 ("sched: fix get_cpu_idle_time() with core schedu=
ling")
Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
An alternative way to fix the issue would be to keep the sched_resource
of offline cpus allocated like we already do with idle vcpus and units.
This fix would be more intrusive, but it would avoid similar other bugs
like this one.
---
 xen/common/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 6d34764d38..9ac1b01ca8 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -337,7 +337,7 @@ uint64_t get_cpu_idle_time(unsigned int cpu)
     struct vcpu_runstate_info state =3D { 0 };
     const struct vcpu *v =3D idle_vcpu[cpu];
=20
-    if ( cpu_online(cpu) && v )
+    if ( cpu_online(cpu) && v && get_sched_res(cpu) )
         vcpu_runstate_get(v, &state);
=20
     return state.time[RUNSTATE_running];
--=20
2.26.2


--------------741F0E58D00347898C394009
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

--------------741F0E58D00347898C394009--

--fa6yvcSa5vATSfOzGYiH9fT2daJT6sfVQ--

--hefKhzCsV2d5B36fN4ZnZDxj0A7UhNX4f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEcp6cFAwAAAAAACgkQsN6d1ii/Ey+s
ogf/S0kokQhPXVh6JEt/mCge1V+YtfTZXrzTuRz1J+B4fjzO+O4YEiF3b9+v+Y3odE7EVZvzpvx+
gfQUfZbYOChWWhV0cU7doMKo5x2uR6Jl4rXMNuFLR756wOl6U1XJiq/vKvgUys9r7vSnMUMl/P2Q
fzBOCc2wiyY/6IbfsQDxTLpepmD1FUjEs488G7ZKU/jPJ3qOvurploteJmTlGmF1mcJAN98s64L4
fe1P51zG01TSJzLkjrEnAPxU06L6+pkI8uuIw1yWiViz9DuI5OmYCludfiKopAnC1RKpx2VUhK44
aK99tP6IGMUbzSkr09+rZHhoNQR/kKz1EkH1f6KGRg==
=cDVS
-----END PGP SIGNATURE-----

--hefKhzCsV2d5B36fN4ZnZDxj0A7UhNX4f--

