Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4D414903
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 14:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192708.343288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1Si-0000uY-Fs; Wed, 22 Sep 2021 12:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192708.343288; Wed, 22 Sep 2021 12:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1Si-0000rl-Bp; Wed, 22 Sep 2021 12:34:56 +0000
Received: by outflank-mailman (input) for mailman id 192708;
 Wed, 22 Sep 2021 12:34:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U2Du=OM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mT1Sg-0000rf-Tt
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 12:34:54 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7244afea-8d33-4b36-81ac-c95cdf97bebf;
 Wed, 22 Sep 2021 12:34:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AF2F71FE6E;
 Wed, 22 Sep 2021 12:34:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7FD1813D69;
 Wed, 22 Sep 2021 12:34:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v5NjHewiS2GNIgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Sep 2021 12:34:52 +0000
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
X-Inumbo-ID: 7244afea-8d33-4b36-81ac-c95cdf97bebf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632314092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iEnICj58UPLA4HvtWngBbuaRTSvu539gURlAKLeD2KY=;
	b=XjMG4XMz5YmTX/ajvs5ZljKNQ7GxqX2Ktc569vgDTL4cp3Qvbj8aiVvHfMEaPekksx95D/
	CiiINUM8Y+GJSv2j1RVLzGiZ/EN55UCPf6UXrtslMAy6rxmvi4nwzUzlGi/xggWYw2vOHO
	FbKmGgLgVpdN/VYega56/wy5aO4lQvo=
To: Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-6-roger.pau@citrix.com>
 <0aed8667-7f31-b0fb-3358-c5fd9a5734a1@xen.org>
 <YUr+K0tg6mspyOyd@MacBook-Air-de-Roger.local>
 <69285850-4168-b30c-db47-8c0649bd1ffc@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 5/6] tools/xenstored: partially handle domains without
 a shared ring
Message-ID: <09c4bad1-99e3-5d24-873e-4aca9acd6fed@suse.com>
Date: Wed, 22 Sep 2021 14:34:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <69285850-4168-b30c-db47-8c0649bd1ffc@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Ur4F6JcuRd35CZsXnypc8tcNbPcuvTS1m"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ur4F6JcuRd35CZsXnypc8tcNbPcuvTS1m
Content-Type: multipart/mixed; boundary="3vXXGWO8PRbnKaeqYgvEYTtXTaOdWLf8x";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Message-ID: <09c4bad1-99e3-5d24-873e-4aca9acd6fed@suse.com>
Subject: Re: [PATCH v2 5/6] tools/xenstored: partially handle domains without
 a shared ring
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-6-roger.pau@citrix.com>
 <0aed8667-7f31-b0fb-3358-c5fd9a5734a1@xen.org>
 <YUr+K0tg6mspyOyd@MacBook-Air-de-Roger.local>
 <69285850-4168-b30c-db47-8c0649bd1ffc@xen.org>
In-Reply-To: <69285850-4168-b30c-db47-8c0649bd1ffc@xen.org>

--3vXXGWO8PRbnKaeqYgvEYTtXTaOdWLf8x
Content-Type: multipart/mixed;
 boundary="------------9FA4D8B3694414B3F7C17824"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9FA4D8B3694414B3F7C17824
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.09.21 12:23, Julien Grall wrote:
> Hi Roger,
>=20
> On 22/09/2021 14:58, Roger Pau Monn=C3=A9 wrote:
>> On Wed, Sep 22, 2021 at 02:07:44PM +0500, Julien Grall wrote:
>>> Hi Roger,
>>>
>>> On 22/09/2021 13:21, Roger Pau Monne wrote:
>>>> Failure to map the shared ring and thus establish a xenstore
>>>> connection with a domain shouldn't prevent the "@introduceDomain"
>>>> watch from firing, likewise with "@releaseDomain".
>>>>
>>>> In order to handle such events properly xenstored should keep track =
of
>>>> the domains even if the shared communication ring cannot be mapped.
>>>> This was partially the case due to the restore mode, which needs to
>>>> handle domains that have been destroyed between the save and restore=

>>>> period. This patch extends on the previous limited support of
>>>> temporary adding a domain without a valid interface ring, and modifi=
es
>>>> check_domains to keep domains without an interface on the list.
>>>>
>>>> Handling domains without a valid shared ring is required in order to=

>>>> support domain without a grant table, since the lack of grant table
>>>> will prevent the mapping of the xenstore ring grant reference.
>>>>
>>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>> ---
>>>> oxenstored will need a similar treatment once grant mapping is used
>>>> there. For the time being it still works correctly because it uses
>>>> foreign memory to map the shared ring, and that will work in the
>>>> absence of grant tables on the domain.
>>>> ---
>>>> Changes since v1:
>>>> =C2=A0=C2=A0 - New in this version.
>>>> ---
>>>> =C2=A0=C2=A0 tools/xenstore/xenstored_domain.c | 30=20
>>>> ++++++++++++++++++------------
>>>> =C2=A0=C2=A0 1 file changed, 18 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/tools/xenstore/xenstored_domain.c=20
>>>> b/tools/xenstore/xenstored_domain.c
>>>> index 9fb78d5772..150c6f082e 100644
>>>> --- a/tools/xenstore/xenstored_domain.c
>>>> +++ b/tools/xenstore/xenstored_domain.c
>>>> @@ -119,6 +119,11 @@ static int writechn(struct connection *conn,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xenstore_domain_interfac=
e *intf =3D=20
>>>> conn->domain->interface;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XENSTORE_RING_IDX cons, prod;
>>>> +=C2=A0=C2=A0=C2=A0 if (!intf) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D ENODEV;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Must read indexes once, and =
before anything else, and=20
>>>> verified. */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cons =3D intf->rsp_cons;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prod =3D intf->rsp_prod;
>>>> @@ -149,6 +154,11 @@ static int readchn(struct connection *conn,=20
>>>> void *data, unsigned int len)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xenstore_domain_interfac=
e *intf =3D=20
>>>> conn->domain->interface;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XENSTORE_RING_IDX cons, prod;
>>>> +=C2=A0=C2=A0=C2=A0 if (!intf) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D ENODEV;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Must read indexes once, and =
before anything else, and=20
>>>> verified. */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cons =3D intf->req_cons;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prod =3D intf->req_prod;
>>>> @@ -176,6 +186,9 @@ static bool domain_can_write(struct connection=20
>>>> *conn)
>>>> =C2=A0=C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xenstore_domain_interfac=
e *intf =3D=20
>>>> conn->domain->interface;
>>>> +=C2=A0=C2=A0=C2=A0 if (!intf)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>>> +
>>>
>>> Rather than adding an extra check, how about taking advantage of=20
>>> is_ignore?
>>
>> Right, I just need to change the order in conn_can_read and
>> conn_can_write so that the is_ignored check is performed before the
>> can_{read,write} handler is called.
>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ((intf->rsp_prod - intf-=
>rsp_cons) !=3D=20
>>>> XENSTORE_RING_SIZE);
>>>> =C2=A0=C2=A0 }
>>>> @@ -183,7 +196,8 @@ static bool domain_can_read(struct connection=20
>>>> *conn)
>>>> =C2=A0=C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xenstore_domain_interfac=
e *intf =3D=20
>>>> conn->domain->interface;
>>>> -=C2=A0=C2=A0=C2=A0 if (domain_is_unprivileged(conn) && conn->domain=
->wrl_credit < 0)
>>>> +=C2=A0=C2=A0=C2=A0 if ((domain_is_unprivileged(conn) && conn->domai=
n->wrl_credit <=20
>>>> 0) ||
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !intf)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return =
false;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (intf->req_cons !=3D int=
f->req_prod);
>>>> @@ -268,14 +282,7 @@ void check_domains(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 domain->shutdown =3D true;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 notify =3D 1;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/*
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * On Restore, we may have been unable to remap the
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * interface and the port. As we don't know whether
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * this was because of a dying domain, we need to
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * check if the interface and port are still valid.
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if (!dominfo.dying && domain->port &&
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 domain->interface)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if (!dominfo.dying)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>>>
>>> This is mostly a revert on "tools/xenstore: handle dying domains in l=
ive
>>> update". However, IIRC, this check was necessary to release the=20
>>> connection
>>> if the domain has died in the middle of Live-Update.
>>
>> But if the domain has died in the middle of live update
>> get_domain_info will return false, and thus the code won't get here.
>=20
> Hmmm... I think I am mixing up a few things... I went through the=20
> original discussion (it was on the security ML) to find out why I wrote=
=20
> the patch like that. When going through the archives, I noticed that I =

> provided a different version of this patch (see [1]) because there was =

> some issue with the check here (I wrote that it would lead to zombie=20
> domain, but don't have the rationale :().
>=20
> Juergen, I don't seem to find the reason why the patch was not replaced=
=20
> as we discussed on the security ML. Do you remember why?

Sorry, no, I don't.

You did send the new version for V6 of the LU series, but it seems at
least in V9 you commented on the patch requesting that a comment just
in the section being different between the two variants to be removed.

So either we both overlooked the new variant not having gone in, or we
agreed to use the old version (e.g. in a security meeting). In my IRC
logs I couldn't find anything either (the only mentioning of that patch
was before V6 of the series was sent, and that was before you sending
the new one as a reply to V6).

> Assuming this was a mistake, could someone take care of sending an=20
> update? If not, I could do it when I am back in October.
>=20
> For the archives, the issues would appear when shutting down a domain=20
> during Live-Update.

Hmm, IIRC you did quite some extensive testing of LU and didn't find
any problem in the final version.

Are you sure there really is a problem?


Juergen

--------------9FA4D8B3694414B3F7C17824
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

--------------9FA4D8B3694414B3F7C17824--

--3vXXGWO8PRbnKaeqYgvEYTtXTaOdWLf8x--

--Ur4F6JcuRd35CZsXnypc8tcNbPcuvTS1m
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFLIusFAwAAAAAACgkQsN6d1ii/Ey8F
3wf+OOsUy+XbQCf7BYdqYpEebd0BiJi0YGzzBehVGp7cIxv4QbBS1cJX9fu/JkspdL8t7r9GKUub
ui4CwjVmfIp/SwaTG3mYwTJVHQsJzu6WkUtWuOrhgUuyV8TMM1Ced294Och49F1oHz4bA4ToX7ut
y77heHkRg06NTCTlF7LsjDWTgtysEEGEqWGIzMoAO7Qnm7+2OZQBOS7Nq8MYgfHrMv0DO86mUmwo
9i6x8i24fS7FT91s8+WDbIZNgr+8COYkloekvHgvppF3jt7Gn1Rd4hU3JXQhLv8Q1MLIN29o4Vnp
xomaeh4Tw0ab+gNqLLolqiNgIhZUC4Ir6hPRGiNJiA==
=KvVN
-----END PGP SIGNATURE-----

--Ur4F6JcuRd35CZsXnypc8tcNbPcuvTS1m--

