Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7420942201C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 10:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202091.356766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXfSK-0003PC-9k; Tue, 05 Oct 2021 08:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202091.356766; Tue, 05 Oct 2021 08:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXfSK-0003Mc-5u; Tue, 05 Oct 2021 08:05:44 +0000
Received: by outflank-mailman (input) for mailman id 202091;
 Tue, 05 Oct 2021 08:05:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/jnY=OZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mXfSH-0003MW-Vl
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 08:05:42 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07f0d304-25b3-11ec-bed0-12813bfff9fa;
 Tue, 05 Oct 2021 08:05:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C077223DC;
 Tue,  5 Oct 2021 08:05:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11D1913A78;
 Tue,  5 Oct 2021 08:05:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j+oKA1QHXGG8WwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 05 Oct 2021 08:05:40 +0000
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
X-Inumbo-ID: 07f0d304-25b3-11ec-bed0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633421140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mNS2wV6jSY6IP0Jf9wHa0Hx2MuFhbu0KcztaVF58z8E=;
	b=ltzMcl7IwVglx+cobDoydm4ULI7+2D/wDbCOxDJXkOE68sOv8LRNfN1i71zSIVb5xlcC89
	OAxsPtxjQR0sNEQookdFwdvpBia2LBRA2UZOnPQbKvlWbq5gTLBRz5kDtkSZckM/r8YDkT
	g2FW7Svz/FGuKy6HtyBD87I8ZyQPYlE=
Subject: Re: xen-balloon thread using 100% of CPU, regression in 5.4.150
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
References: <YVk11h2l/u4GJNv0@mail-itl>
 <37c22c61-80be-fc48-18e6-2b1ee22cc765@suse.com> <YVrF65BAVsXTgRsd@mail-itl>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f707c956-6cdc-9b32-5f22-227e0f5a9f10@suse.com>
Date: Tue, 5 Oct 2021 10:05:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YVrF65BAVsXTgRsd@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mhwC5aop5uFcSu15uaLNzT91NGrYN4Nv1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mhwC5aop5uFcSu15uaLNzT91NGrYN4Nv1
Content-Type: multipart/mixed; boundary="nIt1A3U6j0WdSLKTUVWEjcBmjavjJosFB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
Message-ID: <f707c956-6cdc-9b32-5f22-227e0f5a9f10@suse.com>
Subject: Re: xen-balloon thread using 100% of CPU, regression in 5.4.150
References: <YVk11h2l/u4GJNv0@mail-itl>
 <37c22c61-80be-fc48-18e6-2b1ee22cc765@suse.com> <YVrF65BAVsXTgRsd@mail-itl>
In-Reply-To: <YVrF65BAVsXTgRsd@mail-itl>

--nIt1A3U6j0WdSLKTUVWEjcBmjavjJosFB
Content-Type: multipart/mixed;
 boundary="------------C795C15D33C6DCA3DCD191B2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C795C15D33C6DCA3DCD191B2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 04.10.21 11:14, Marek Marczykowski-G=C3=B3recki wrote:
> On Mon, Oct 04, 2021 at 07:31:40AM +0200, Juergen Gross wrote:
>> On 03.10.21 06:47, Marek Marczykowski-G=C3=B3recki wrote:
>>> Hi,
>>>
>>> After updating a PVH domU to 5.4.150, I see xen-balloon thread using
>>> 100% CPU (one thread).
>>> This is a domain started with memory=3Dmaxmem=3D716800KiB (via libvir=
t). Then,
>>> inside, I see:
>>>
>>> # cat /sys/devices/system/xen_memory/xen_memory0/target_kb
>>> 716924
>>> # cat /sys/devices/system/xen_memory/xen_memory0/info/current_kb
>>> 716400
>>>
>>> Doing `cat info/current_kb > target_kb` "fixes" the issue. But still,=

>>> something is wrong - on earlier kernel (5.4.143 to be precise), it
>>> wasn't spinning, with exactly the same values reported in sysfs. It
>>> shouldn't run in circles if it can't get that much memory it wants. I=

>>> strongly suspect "xen/balloon: use a kernel thread instead a workqueu=
e"
>>> or related commit being responsible, but I haven't verified it.
>>
>> I think you are right. I need to handle the BP_ECANCELED case similar =
to
>> BP_EAGAIN in the kernel thread (wait until target size changes again).=

>>
>> One further question: do you see any kernel message in the guest relat=
ed
>> to the looping balloon thread?
>=20
> Nothing, only the usual "xen:balloon: Initialising balloon driver", and=

> nothing related to balloon after that.

Could you try the attached patch, please? I've tested it briefly with
PV and PVH guests.


Juergen


--------------C795C15D33C6DCA3DCD191B2
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-balloon-fix-cancelled-balloon-action.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-xen-balloon-fix-cancelled-balloon-action.patch"

=46rom c0901b425d5939b7f3ce6c3f4bb7a0161b819745 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Mon, 4 Oct 2021 17:05:48 +0200
Subject: [PATCH] xen/balloon: fix cancelled balloon action
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

In case a ballooning action is cancelled the new kernel thread handling
the ballooning might end up in a busy loop.

Fix that by handling the cancelled action gracefully.

Cc: stable@vger.kernel.org
Fixes: 8480ed9c2bbd56 ("xen/balloon: use a kernel thread instead a workqu=
eue")
Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/balloon.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 43ebfe36ac27..3a50f097ed3e 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -491,12 +491,12 @@ static enum bp_state decrease_reservation(unsigned =
long nr_pages, gfp_t gfp)
 }
=20
 /*
- * Stop waiting if either state is not BP_EAGAIN and ballooning action i=
s
- * needed, or if the credit has changed while state is BP_EAGAIN.
+ * Stop waiting if either state is BP_DONE and ballooning action is
+ * needed, or if the credit has changed while state is not BP_DONE.
  */
 static bool balloon_thread_cond(enum bp_state state, long credit)
 {
-	if (state !=3D BP_EAGAIN)
+	if (state =3D=3D BP_DONE)
 		credit =3D 0;
=20
 	return current_credit() !=3D credit || kthread_should_stop();
@@ -516,10 +516,19 @@ static int balloon_thread(void *unused)
=20
 	set_freezable();
 	for (;;) {
-		if (state =3D=3D BP_EAGAIN)
-			timeout =3D balloon_stats.schedule_delay * HZ;
-		else
+		switch (state) {
+		case BP_DONE:
+		case BP_ECANCELED:
 			timeout =3D 3600 * HZ;
+			break;
+		case BP_EAGAIN:
+			timeout =3D balloon_stats.schedule_delay * HZ;
+			break;
+		case BP_WAIT:
+			timeout =3D HZ;
+			break;
+		}
+
 		credit =3D current_credit();
=20
 		wait_event_freezable_timeout(balloon_thread_wq,
--=20
2.26.2


--------------C795C15D33C6DCA3DCD191B2
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

--------------C795C15D33C6DCA3DCD191B2--

--nIt1A3U6j0WdSLKTUVWEjcBmjavjJosFB--

--mhwC5aop5uFcSu15uaLNzT91NGrYN4Nv1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFcB1MFAwAAAAAACgkQsN6d1ii/Ey8p
bwf+JCZ/re4RHkGlzO08wLZNq4/K8sFuWWZeQkgLI3hO7nDw6garNABpOD1BDxX/W6F5Hb+azEPF
xXQrNhMGtRvqQ5mmTw7wUzGEWMX9WzAsE83WkJNayEalFg75brss8PocnAnZ6OlB0LwMxu2Z/G4O
mVc1K9t4/eo75ziYpU1kCzZShdak/tA3pxYkVSWZ0eLPFIAjU9Aprb3vDvlkPgCiuuetnrbiobB0
ZNSav8xtkQnbwQx7n2s500Xn03qoPGoQZ5lf25SFybU9LdozDcjU1Et/Q7v2Gb8XwC5Ix1GFmjB/
Rj8qwXi365mikyHJUr4icj7O3iB+1lqNGp+0N02uuQ==
=6K/6
-----END PGP SIGNATURE-----

--mhwC5aop5uFcSu15uaLNzT91NGrYN4Nv1--

