Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66A848BF0A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 08:35:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256257.439642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7YAa-00039C-Du; Wed, 12 Jan 2022 07:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256257.439642; Wed, 12 Jan 2022 07:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7YAa-00037L-Aq; Wed, 12 Jan 2022 07:35:44 +0000
Received: by outflank-mailman (input) for mailman id 256257;
 Wed, 12 Jan 2022 07:35:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7YAY-000372-UC
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 07:35:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ebd3003-737a-11ec-81c1-a30af7de8005;
 Wed, 12 Jan 2022 08:35:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C92C212CC;
 Wed, 12 Jan 2022 07:35:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 681FB13B32;
 Wed, 12 Jan 2022 07:35:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UJ8OGM2E3mGxDwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Jan 2022 07:35:41 +0000
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
X-Inumbo-ID: 3ebd3003-737a-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641972941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wvdjA7VaGoLVihs21qy5O2GV5iob1mnk5CnH267+aE0=;
	b=LUAkDjnvxtmH7aPG554O1wAzK+PZ/Q0/cdL094cMm3UzSm9r5AWUiHP3eIGf5zjRIytWmu
	zQ/jcgkXvzILijkL49gDOWTDhYlpSG3JbFaCvQp1l/Keae24hrhscVVHD3HEMoGxi36hjB
	D11Gbt+Wvp4GXo/L+ligRAndW4I2Ah8=
Subject: Re: [PATCH v2 16/18] mini-os: reset file type in close() in one place
 only
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111145817.22170-1-jgross@suse.com>
 <20220111145817.22170-17-jgross@suse.com>
 <d70d8cb3-c34f-23f5-840c-c85a90547924@srcf.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ea04bb0d-c1b5-1f0b-9ca9-f21001e42a78@suse.com>
Date: Wed, 12 Jan 2022 08:35:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d70d8cb3-c34f-23f5-840c-c85a90547924@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="F2T7kkXIZYAior80ZmuWsQ8NhZRO1bbHD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--F2T7kkXIZYAior80ZmuWsQ8NhZRO1bbHD
Content-Type: multipart/mixed; boundary="g4Z3l4Af5WbpM3ZK9FLGa4FaSetRSqegM";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <ea04bb0d-c1b5-1f0b-9ca9-f21001e42a78@suse.com>
Subject: Re: [PATCH v2 16/18] mini-os: reset file type in close() in one place
 only
References: <20220111145817.22170-1-jgross@suse.com>
 <20220111145817.22170-17-jgross@suse.com>
 <d70d8cb3-c34f-23f5-840c-c85a90547924@srcf.net>
In-Reply-To: <d70d8cb3-c34f-23f5-840c-c85a90547924@srcf.net>

--g4Z3l4Af5WbpM3ZK9FLGa4FaSetRSqegM
Content-Type: multipart/mixed;
 boundary="------------5674B16F21DF3BC61C9CC0AC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5674B16F21DF3BC61C9CC0AC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.01.22 19:11, Andrew Cooper wrote:
> On 11/01/2022 14:58, Juergen Gross wrote:
>> diff --git a/lib/sys.c b/lib/sys.c
>> index 0e6fe5d..323a7cd 100644
>> --- a/lib/sys.c
>> +++ b/lib/sys.c
>> @@ -424,87 +424,82 @@ int fsync(int fd) {
>>  =20
>>   int close(int fd)
>>   {
>> +    int res =3D 0;
>> +
>>       printk("close(%d)\n", fd);
>>       switch (files[fd].type) {
>>           default:
>> -	    files[fd].type =3D FTYPE_NONE;
>> -	    return 0;
>> +            break;
>>   #ifdef CONFIG_XENBUS
>>   	case FTYPE_XENBUS:
>>               xs_daemon_close((void*)(intptr_t) fd);
>> -            return 0;
>> +            break;
>>   #endif
>>   #ifdef HAVE_LWIP
>> -	case FTYPE_SOCKET: {
>> -	    int res =3D lwip_close(files[fd].fd);
>> -	    files[fd].type =3D FTYPE_NONE;
>> -	    return res;
>> -	}
>> +	case FTYPE_SOCKET:
>> +	    res =3D lwip_close(files[fd].fd);
>=20
> Hard tabs.
>=20
>> +            break;
>>   #endif
>>   #ifdef CONFIG_LIBXENCTRL
>>   	case FTYPE_XC:
>>   	    minios_interface_close_fd(fd);
>> -	    return 0;
>> +            break;
>>   #endif
>>   #ifdef CONFIG_LIBXENEVTCHN
>>   	case FTYPE_EVTCHN:
>>   	    minios_evtchn_close_fd(fd);
>> -            return 0;
>> +            break;
>>   #endif
>>   #ifdef CONFIG_LIBXENGNTTAB
>>   	case FTYPE_GNTMAP:
>>   	    minios_gnttab_close_fd(fd);
>> -	    return 0;
>> +            break;
>>   #endif
>>   #ifdef CONFIG_NETFRONT
>>   	case FTYPE_TAP:
>>   	    shutdown_netfront(files[fd].dev);
>> -	    files[fd].type =3D FTYPE_NONE;
>> -	    return 0;
>> +            break;
>>   #endif
>>   #ifdef CONFIG_BLKFRONT
>>   	case FTYPE_BLK:
>>               shutdown_blkfront(files[fd].dev);
>> -	    files[fd].type =3D FTYPE_NONE;
>> -	    return 0;
>> +            break;
>>   #endif
>>   #ifdef CONFIG_TPMFRONT
>>   	case FTYPE_TPMFRONT:
>>               shutdown_tpmfront(files[fd].dev);
>> -	    files[fd].type =3D FTYPE_NONE;
>> -	    return 0;
>> +            break;
>>   #endif
>>   #ifdef CONFIG_TPM_TIS
>>   	case FTYPE_TPM_TIS:
>>               shutdown_tpm_tis(files[fd].dev);
>> -	    files[fd].type =3D FTYPE_NONE;
>> -	    return 0;
>> +            break;
>>   #endif
>>   #ifdef CONFIG_KBDFRONT
>>   	case FTYPE_KBD:
>>               shutdown_kbdfront(files[fd].dev);
>> -            files[fd].type =3D FTYPE_NONE;
>> -            return 0;
>> +            break;
>>   #endif
>>   #ifdef CONFIG_FBFRONT
>>   	case FTYPE_FB:
>>               shutdown_fbfront(files[fd].dev);
>> -            files[fd].type =3D FTYPE_NONE;
>> -            return 0;
>> +            break;
>>   #endif
>>   #ifdef CONFIG_CONSFRONT
>>           case FTYPE_SAVEFILE:
>>           case FTYPE_CONSOLE:
>>               fini_consfront(files[fd].dev);
>> -            files[fd].type =3D FTYPE_NONE;
>> -            return 0;
>> +            break;
>>   #endif
>>   	case FTYPE_NONE:
>> -	    break;
>> +            printk("close(%d): Bad descriptor\n", fd);
>> +            errno =3D EBADF;
>> +            return -1;
>>       }
>> -    printk("close(%d): Bad descriptor\n", fd);
>> -    errno =3D EBADF;
>> -    return -1;
>> +
>> +    memset(files + fd, 0, sizeof(struct file));
>> +    files[fd].type =3D FTYPE_NONE;
>=20
> BUILD_BUG_ON(FTYPE_NONE !=3D 0);
>=20
> Life's too short to deal with a theoretical (and short sighted) future
> where someone might want to change FTYPE_NONE away from being 0.

Good idea.


Juergen

--------------5674B16F21DF3BC61C9CC0AC
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

--------------5674B16F21DF3BC61C9CC0AC--

--g4Z3l4Af5WbpM3ZK9FLGa4FaSetRSqegM--

--F2T7kkXIZYAior80ZmuWsQ8NhZRO1bbHD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHehMwFAwAAAAAACgkQsN6d1ii/Ey8h
Bgf/Ss+8SmJfO6FZSEc0g9F5GYPIHhSExeO3ZiC7S0bIMUNlWO/O5VhaeFilRJ+MwAaoupohzgua
Rkfz3/BY2JymF30v8D46rRNlY66g8XPkMbE5wn2ENF5ytlkgoyHn4w+5poegEzxI4RQlXO0WSzV1
qvz3cWQu8d7KjZJQimLgwCFOR/y0HlkhxwZ3xI837cl976s+3J9o18z4rFrmmJUPYvvuchWQI67/
GzqzXsm9BO1atQ10N2TFGR5chJ8Q/xXouQ7TwBvgjqRiKuECcq7tGoLRwStJRkThsVQx2Nny0Y87
asG9do+agnWG8QrcMj3tRWwe6p0C2q38fBDKykYLnw==
=dgfG
-----END PGP SIGNATURE-----

--F2T7kkXIZYAior80ZmuWsQ8NhZRO1bbHD--

