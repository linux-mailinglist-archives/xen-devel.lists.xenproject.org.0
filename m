Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EE6478492
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 06:26:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248394.428481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my5jl-0003DZ-Of; Fri, 17 Dec 2021 05:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248394.428481; Fri, 17 Dec 2021 05:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my5jl-0003B0-Kn; Fri, 17 Dec 2021 05:24:57 +0000
Received: by outflank-mailman (input) for mailman id 248394;
 Fri, 17 Dec 2021 05:24:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NBDy=RC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1my5jj-0003Ae-LA
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 05:24:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9f1ed38-5ef9-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 06:24:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EDC641F3A1;
 Fri, 17 Dec 2021 05:24:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4FB613C60;
 Fri, 17 Dec 2021 05:24:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iwtUKiQfvGFRNQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Dec 2021 05:24:52 +0000
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
X-Inumbo-ID: a9f1ed38-5ef9-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639718692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KrLwFXrOXNgdZGzFcZIgGi/2ArwW6pwqm5lJFKjfhSU=;
	b=Jlo0evCcAMtD0Q0VJxCyj0YkI3i8H5AjHwF0G0dcfqLL1ZQD3oeke2ImMQn7W8gmLs6nU9
	uI6v1KGfGHot4OrDNAEX3VL3P1Ajn9ym1psgYbC1RGJi0T29lw5VI6f6iSHfpPM4r4eV4d
	vbXHiO1crxmaMrdK+9BLsbZOIDXvniE=
To: Andrew Cooper <amc96@srcf.net>, Anthony PERARD
 <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-37-anthony.perard@citrix.com>
 <42048d21-c02e-9fea-b228-7ffc60009be9@srcf.net>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 36/57] tools/xenstore: Cleanup makefile
Message-ID: <ed48b603-b484-4544-f12a-1e816b6c007d@suse.com>
Date: Fri, 17 Dec 2021 06:24:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <42048d21-c02e-9fea-b228-7ffc60009be9@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vbbsecW2qHdYBEwt65FPxQuc8YOsffWK9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vbbsecW2qHdYBEwt65FPxQuc8YOsffWK9
Content-Type: multipart/mixed; boundary="xCGTv6OJ3oygMCpknu4fYg2mLOy6FyHvT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, Anthony PERARD
 <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
Message-ID: <ed48b603-b484-4544-f12a-1e816b6c007d@suse.com>
Subject: Re: [XEN PATCH 36/57] tools/xenstore: Cleanup makefile
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-37-anthony.perard@citrix.com>
 <42048d21-c02e-9fea-b228-7ffc60009be9@srcf.net>
In-Reply-To: <42048d21-c02e-9fea-b228-7ffc60009be9@srcf.net>

--xCGTv6OJ3oygMCpknu4fYg2mLOy6FyHvT
Content-Type: multipart/mixed;
 boundary="------------7254733AC05BA0E70E6D90C5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7254733AC05BA0E70E6D90C5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.12.21 19:34, Andrew Cooper wrote:
> On 06/12/2021 17:02, Anthony PERARD wrote:
>> Regroup *FLAGS together, use $(LDLIBS).
>>
>> Remove $(LDLIBS_xenstored) which was the wrong name name as it doesn't=

>> decribe how to link to a potential libxenstored.so, instead add the
>> value to $(LDLIBS) of xenstored.
>>
>> Add SYSTEMD_LIBS into $(LDLIBS) instead of $(LDFLAGS).
>>
>> Remove the "-I." from $(CFLAGS), it shouldn't be needed.
>>
>> Removed $(CFLAGS-y) and $(LDFLAGS-y). $(CFLAGS-y) is already included
>> in $(CFLAGS) and both aren't used anyway.
>>
>> Rename ALL_TARGETS to TARGETS.
>> Only add programmes we want to build in $(TARGETS), not phony-targets
>> (replace "clients").
>>
>> Store all `xenstored` objs into $(XENSTORED_OBJS-y).
>>
>> Replace one $< by $^ even if there's only one dependency,
>> (xenstore-control).
>>
>> clean: "init-xenstore-domain" isn't built here, so stop trying to
>> remove it, remove $(TARGETS).
>>
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>> ---
>>   tools/xenstore/Makefile | 81 ++++++++++++++++++++++-----------------=
--
>>   1 file changed, 44 insertions(+), 37 deletions(-)
>>
>> diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
>> index 292b478fa1..7fe1d9c1e2 100644
>> --- a/tools/xenstore/Makefile
>> +++ b/tools/xenstore/Makefile
>> @@ -5,7 +5,6 @@ MAJOR =3D 3.0
>>   MINOR =3D 3
>=20
> Actually, shouldn't this MAJOR/MINOR be dropped now that libxenstore
> moved to tools/libs ?

Yes, you are right. They should be dropped.

>=20
> It's definitely wrong now, seeing as we bumped to 4.0 for Xen 4.16.
>=20
>>  =20
>>   CFLAGS +=3D -Werror
>> -CFLAGS +=3D -I.
>>   # Include configure output (config.h)
>>   CFLAGS +=3D -include $(XEN_ROOT)/tools/config.h
>>   CFLAGS +=3D -I./include
>> @@ -16,36 +15,53 @@ CFLAGS +=3D $(CFLAGS_libxentoolcore)
>>   CFLAGS +=3D -DXEN_LIB_STORED=3D"\"$(XEN_LIB_STORED)\""
>>   CFLAGS +=3D -DXEN_RUN_STORED=3D"\"$(XEN_RUN_STORED)\""
>>  =20
>> -CFLAGS  +=3D $(CFLAGS-y)
>> -LDFLAGS +=3D $(LDFLAGS-y)
>> +ifdef CONFIG_STUBDOM
>> +CFLAGS +=3D -DNO_SOCKETS=3D1
>> +endif
>>  =20
>> -CLIENTS :=3D xenstore-exists xenstore-list xenstore-read xenstore-rm =
xenstore-chmod
>> -CLIENTS +=3D xenstore-write xenstore-ls xenstore-watch
>> +XENSTORED_OBJS-y :=3D xenstored_core.o xenstored_watch.o xenstored_do=
main.o
>> +XENSTORED_OBJS-y +=3D xenstored_transaction.o xenstored_control.o
>> +XENSTORED_OBJS-y +=3D xs_lib.o talloc.o utils.o tdb.o hashtable.o
>>  =20
>> -XENSTORED_OBJS =3D xenstored_core.o xenstored_watch.o xenstored_domai=
n.o
>> -XENSTORED_OBJS +=3D xenstored_transaction.o xenstored_control.o
>> -XENSTORED_OBJS +=3D xs_lib.o talloc.o utils.o tdb.o hashtable.o
>> +XENSTORED_OBJS-$(CONFIG_Linux) +=3D xenstored_posix.o
>> +XENSTORED_OBJS-$(CONFIG_SunOS) +=3D xenstored_solaris.o xenstored_pos=
ix.o xenstored_probes.o
>> +XENSTORED_OBJS-$(CONFIG_NetBSD) +=3D xenstored_posix.o
>> +XENSTORED_OBJS-$(CONFIG_FreeBSD) +=3D xenstored_posix.o
>> +XENSTORED_OBJS-$(CONFIG_MiniOS) +=3D xenstored_minios.o
>>  =20
>> -XENSTORED_OBJS_$(CONFIG_Linux) =3D xenstored_posix.o
>> -XENSTORED_OBJS_$(CONFIG_SunOS) =3D xenstored_solaris.o xenstored_posi=
x.o xenstored_probes.o
>> -XENSTORED_OBJS_$(CONFIG_NetBSD) =3D xenstored_posix.o
>> -XENSTORED_OBJS_$(CONFIG_FreeBSD) =3D xenstored_posix.o
>> -XENSTORED_OBJS_$(CONFIG_MiniOS) =3D xenstored_minios.o
>> +$(XENSTORED_OBJS-y): CFLAGS +=3D $(CFLAGS_libxengnttab)
>>  =20
>> -XENSTORED_OBJS +=3D $(XENSTORED_OBJS_y)
>> -LDLIBS_xenstored +=3D -lrt
>> +xenstored: LDLIBS +=3D $(LDLIBS_libxenevtchn)
>> +xenstored: LDLIBS +=3D $(LDLIBS_libxengnttab)
>> +xenstored: LDLIBS +=3D $(LDLIBS_libxenctrl)
>> +xenstored: LDLIBS +=3D -lrt
>> +xenstored: LDLIBS +=3D $(SOCKET_LIBS)
>>  =20
>> -ALL_TARGETS =3D clients
>> -ifeq ($(XENSTORE_XENSTORED),y)
>> -ALL_TARGETS +=3D xs_tdb_dump xenstored
>> +ifeq ($(CONFIG_SYSTEMD),y)
>> +$(XENSTORED_OBJS-y): CFLAGS +=3D $(SYSTEMD_CFLAGS)
>> +xenstored: LDLIBS +=3D $(SYSTEMD_LIBS)
>>   endif
>>  =20
>> -ifdef CONFIG_STUBDOM
>> -CFLAGS +=3D -DNO_SOCKETS=3D1
>> +xenstore: LDLIBS +=3D $(LDLIBS_libxenstore)
>> +xenstore: LDLIBS +=3D $(LDLIBS_libxentoolcore)
>> +xenstore: LDLIBS +=3D $(SOCKET_LIBS)
>> +
>> +xenstore-control: LDLIBS +=3D $(LDLIBS_libxenstore)
>> +xenstore-control: LDLIBS +=3D $(LDLIBS_libxenctrl)
>> +xenstore-control: LDLIBS +=3D $(LDLIBS_libxenguest)
>> +xenstore-control: LDLIBS +=3D $(LDLIBS_libxentoolcore)
>> +xenstore-control: LDLIBS +=3D $(SOCKET_LIBS)
>> +
>> +CLIENTS :=3D xenstore-exists xenstore-list xenstore-read xenstore-rm =
xenstore-chmod
>> +CLIENTS +=3D xenstore-write xenstore-ls xenstore-watch
>> +
>> +TARGETS :=3D xenstore $(CLIENTS) xenstore-control
>> +ifeq ($(XENSTORE_XENSTORED),y)
>> +TARGETS +=3D xs_tdb_dump xenstored
>>   endif
>>  =20
>>   .PHONY: all
>> -all: $(ALL_TARGETS)
>> +all: $(TARGETS)
>>  =20
>>   .PHONY: clients
>>   clients: xenstore $(CLIENTS) xenstore-control
>> @@ -62,37 +78,28 @@ xenstored_probes.o: xenstored_solaris.o
>=20
> Urgh - there's a mess in here.
>=20
> the `dtrace` line has trailing whitespace, but xenstored_probes.d is
> going to be clobbered by the dependency file logic.
>=20
> Given this is utterly broken, perhaps better to drop the CONFIG_SunOS
> chunk entirely?

I've basically asking to do so since 5 years now. Last try wast last
year and the DilOS reply was:

   we have plans for XEN on 2021 year, but all depends on business needs
   and investments."

So the same as in 2016 (not there yet, but planning to do so):

   i have plans try to return back and look at latest Xen.

At least running xenstored in SunOS has been broken since years now, and
I'd like to suggest removing the CONFIG_SunOS parts from it (again).


Juergen

--------------7254733AC05BA0E70E6D90C5
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

--------------7254733AC05BA0E70E6D90C5--

--xCGTv6OJ3oygMCpknu4fYg2mLOy6FyHvT--

--vbbsecW2qHdYBEwt65FPxQuc8YOsffWK9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG8HyQFAwAAAAAACgkQsN6d1ii/Ey+y
uwgAjyBPUOZxamXde9IehwlnsXkpxSmyFPrWDiVFynVPX7oMNpsSJn7UjuIBGWa/zYOgBXyvOQUW
suVC13QWqn44n17gGBz2SXSJJC9Ff7fatUEUYjg4JGpvfm9ANec3b/0dlB/r/d/FzoyNA1BxEjeF
hNlzvjdIdtki6k81BZHWjq85tpj/dfXFOKH7CmM1im9MEBBjOR1zz/yetl+QlG9qAeoDvgZrZus3
ehFyCvD/tewtgC2fHur7NwzPH6ierifyNVjlFPN0KkG5jBLqQkzxIXzbOh0oJyUHWrMteuqbSM82
iySL2jzkY2fLJnLrIGBwifgxrbNEB2COYNc42/DEkw==
=4hry
-----END PGP SIGNATURE-----

--vbbsecW2qHdYBEwt65FPxQuc8YOsffWK9--

