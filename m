Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7697B432C98
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 06:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212630.370579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcgen-0004Y4-Cv; Tue, 19 Oct 2021 04:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212630.370579; Tue, 19 Oct 2021 04:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcgen-0004VV-9l; Tue, 19 Oct 2021 04:23:21 +0000
Received: by outflank-mailman (input) for mailman id 212630;
 Tue, 19 Oct 2021 04:23:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5uN=PH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcgem-0004VP-9D
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 04:23:20 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d95b2a69-753f-4ece-9e7a-7ea4b3e992a0;
 Tue, 19 Oct 2021 04:23:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 974751FD80;
 Tue, 19 Oct 2021 04:23:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 414F913B04;
 Tue, 19 Oct 2021 04:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BS4bDTVIbmGwLQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Oct 2021 04:23:17 +0000
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
X-Inumbo-ID: d95b2a69-753f-4ece-9e7a-7ea4b3e992a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634617397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BqX/MKOaaO0VfUDWbPZmr6y2ERUMFmkmrpwGes6xJsM=;
	b=P3LDIG5wfh8HSjjF4yUSJaP/n1u/iL/36NQptL50hj1nHjqppGNedasIOQtxkvxee7Lyzo
	ZlKBf35iR4dLcCkwDLA0fAjOp6TXusVFwdB2ZYR/6UeS7c5dkUSb3YiKLlpt43/ExqLPHN
	ES/YPEXiEL3btPPFfM/+TOa/Raj6HhQ=
Subject: Re: [PATCH v6 1/2] tools/xenstore: set oom score for xenstore daemon
 on Linux
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20211012134148.6280-1-jgross@suse.com>
 <20211012134148.6280-2-jgross@suse.com>
 <alpine.DEB.2.21.2110181616400.21467@sstabellini-ThinkPad-T480s>
From: Juergen Gross <jgross@suse.com>
Message-ID: <01adb8a7-a4be-2171-ae4c-5dca24ce5838@suse.com>
Date: Tue, 19 Oct 2021 06:23:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110181616400.21467@sstabellini-ThinkPad-T480s>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="o189TqNcO0FCvgbw7MqsEXYwjfsaCPIb5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--o189TqNcO0FCvgbw7MqsEXYwjfsaCPIb5
Content-Type: multipart/mixed; boundary="lMmq8dDo5d4KI9ry2id77zwb4lu23icPJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Message-ID: <01adb8a7-a4be-2171-ae4c-5dca24ce5838@suse.com>
Subject: Re: [PATCH v6 1/2] tools/xenstore: set oom score for xenstore daemon
 on Linux
References: <20211012134148.6280-1-jgross@suse.com>
 <20211012134148.6280-2-jgross@suse.com>
 <alpine.DEB.2.21.2110181616400.21467@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110181616400.21467@sstabellini-ThinkPad-T480s>

--lMmq8dDo5d4KI9ry2id77zwb4lu23icPJ
Content-Type: multipart/mixed;
 boundary="------------14EFCDDF60A833E78D18823C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------14EFCDDF60A833E78D18823C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.10.21 01:25, Stefano Stabellini wrote:
> Hi Juergen, Ian,
>=20
> This patch broke gitlab-ci:
>=20
> https://gitlab.com/xen-project/xen/-/jobs/1690080806
>=20
> ---
>   * Executing: /lib/rc/sh/openrc-run.sh /lib/rc/sh/openrc-run.sh /etc/i=
nit.d/local start
>   * Starting local ... *   Executing "/etc/local.d/xen.start" .../etc/x=
en/scripts/launch-xenstore: line 64: * 10: syntax error: operand expected=
 (error token is "* 10")
>=20
> illegal value daemon for XENSTORETYPE
> ---
>=20
> See below about what the issue is and a potential fix.
>=20
>=20
> On Tue, 12 Oct 2021, Juergen Gross wrote:
>> Xenstored is absolutely mandatory for a Xen host and it can't be
>> restarted, so being killed by OOM-killer in case of memory shortage is=

>> to be avoided.
>>
>> Set /proc/$pid/oom_score_adj (if available) per default to -500 (this
>> translates to 50% of dom0 memory size) in order to allow xenstored to
>> use large amounts of memory without being killed.
>>
>> The percentage of dom0 memory above which the oom killer is allowed to=

>> kill xenstored can be set via XENSTORED_OOM_MEM_THRESHOLD in
>> xencommons.
>>
>> Make sure the pid file isn't a left-over from a previous run delete it=

>> before starting xenstored.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Ian Jackson <iwj@xenproject.org>
>> ---
>> V2:
>> - set oom score from launch script (Julien Grall)
>> - split off open file descriptor limit setting (Julien Grall)
>> V3:
>> - make oom killer threshold configurable (Julien Grall)
>> V4:
>> - extend comment (Ian Jackson)
>> ---
>>   tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 9 +++++++++
>>   tools/hotplug/Linux/launch-xenstore.in             | 6 ++++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tool=
s/hotplug/Linux/init.d/sysconfig.xencommons.in
>> index 00cf7f91d4..b83101ab7e 100644
>> --- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
>> +++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
>> @@ -48,6 +48,15 @@ XENSTORED_ARGS=3D
>>   # Only evaluated if XENSTORETYPE is "daemon".
>>   #XENSTORED_TRACE=3D[yes|on|1]
>>  =20
>> +## Type: integer
>> +## Default: 50
>> +#
>> +# Percentage of dom0 memory size the xenstore daemon can use before t=
he
>> +# OOM killer is allowed to kill it.
>> +# The specified value is multiplied by -10 and echoed to
>> +# /proc/PID/oom_score_adj.
>> +#XENSTORED_OOM_MEM_THRESHOLD=3D50
>> +
>>   ## Type: string
>>   ## Default: @LIBEXEC@/boot/xenstore-stubdom.gz
>>   #
>> diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Li=
nux/launch-xenstore.in
>> index 019f9d6f4d..1747c96065 100644
>> --- a/tools/hotplug/Linux/launch-xenstore.in
>> +++ b/tools/hotplug/Linux/launch-xenstore.in
>> @@ -59,11 +59,17 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons =
&& . @CONFIG_DIR@/@CONFIG_LEAF
>>   		echo "No xenstored found"
>>   		exit 1
>>   	}
>> +	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=
=3D50
>> +	XS_OOM_SCORE=3D-$(($XENSTORED_OOM_MEM_THRESHOLD * 10))
>=20
> These are the problematic lines. They don't work with busybox's bash
> implementation. Originally I thought it was an issue with busybox bash
> implementation but it looks like they don't even work with normal bash.=

> Specifically the first line is an issue, it should be:
>=20
> if [ -z "$XENSTORED_OOM_MEM_THRESHOLD" ]
> then
>      XENSTORED_OOM_MEM_THRESHOLD=3D50
> fi
>=20
> Right?
>=20

Oh, shame on me. Turned out that I had XENSTORED_OOM_MEM_THRESHOLD
set explicitly in my xencommons file. :-(

Patch is coming...


Juergen

Patch is coming.

--------------14EFCDDF60A833E78D18823C
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

--------------14EFCDDF60A833E78D18823C--

--lMmq8dDo5d4KI9ry2id77zwb4lu23icPJ--

--o189TqNcO0FCvgbw7MqsEXYwjfsaCPIb5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFuSDQFAwAAAAAACgkQsN6d1ii/Ey+5
Ygf/dSqqDrKZgfod7Dv0gmb8sAie09qfQIBZN5SAYQqJub7e0oVjZ+46jGxWobUnrxS4VZlsuUQ3
dB8uTbbsUUGfvq1ngYUSc0A2BOfVd4WFQgrNe60k58Jl/0OD0TFUQVLNAJ0aUksl/Qu3vG9mr1cP
QtkraXSVzpA5vVmfaT8nc1Q5pskv97UEN+SuBJqbaJuon65an4TR6WVc1UUONog8Ny0Fw7QTRzMX
ik+tLZGCqxuU+AcKQlSDrjCa3PHZpgLS8MRnLee0R7Ky/pkvkJK9GMhi3PTX2USW7T3+dV/Z0og1
c6Bm5Pv1Yi5uHgiqcdeB6mbNltsf/nTK+uX6giXdIQ==
=RZ6o
-----END PGP SIGNATURE-----

--o189TqNcO0FCvgbw7MqsEXYwjfsaCPIb5--

