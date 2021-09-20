Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E7A4110E6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 10:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190310.340151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSEba-0004qa-1i; Mon, 20 Sep 2021 08:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190310.340151; Mon, 20 Sep 2021 08:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSEbZ-0004oM-UP; Mon, 20 Sep 2021 08:24:49 +0000
Received: by outflank-mailman (input) for mailman id 190310;
 Mon, 20 Sep 2021 08:24:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pAY=OK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSEbZ-0004oG-3o
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 08:24:49 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e571aaa-350e-4913-8e85-f981df22da30;
 Mon, 20 Sep 2021 08:24:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ABD9620041;
 Mon, 20 Sep 2021 08:24:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C6F913ACC;
 Mon, 20 Sep 2021 08:24:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ysJuHE5FSGGNGgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Sep 2021 08:24:46 +0000
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
X-Inumbo-ID: 2e571aaa-350e-4913-8e85-f981df22da30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632126286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KG9nN2IOsT4a5w0uHs+Gi11848zjWgSPv3lXhfAD5uo=;
	b=eGzBTSp2wL66vo61MJMX+mLk4xEawq2JwFxzC1cSNuDkx40cirTpwRDMPJNeV0wb+wyaB2
	YxYVEv0H6U8/+YV2RfsI5T1t8VKBPi8sQfboNLgjM4z76G2vqQvGJQ9NTBJTraiw0B7cPK
	ZjmQoNzpgbxyeI73fsu6/D7+OYmXp6s=
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <20210917154625.89315-6-roger.pau@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH DNA 5/6] tools/xenstored: restore support for mapping ring
 as foreign memory
Message-ID: <b1fb5e04-29a8-c60b-c754-5a4275a0601e@suse.com>
Date: Mon, 20 Sep 2021 10:24:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210917154625.89315-6-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Hsp4u7qZ65kAJHwz1ETznUGJ4lJeCDzwu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Hsp4u7qZ65kAJHwz1ETznUGJ4lJeCDzwu
Content-Type: multipart/mixed; boundary="M7VJ1cDQq1MuKlTopkoGEWM0fgh7UKna2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
Message-ID: <b1fb5e04-29a8-c60b-c754-5a4275a0601e@suse.com>
Subject: Re: [PATCH DNA 5/6] tools/xenstored: restore support for mapping ring
 as foreign memory
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <20210917154625.89315-6-roger.pau@citrix.com>
In-Reply-To: <20210917154625.89315-6-roger.pau@citrix.com>

--M7VJ1cDQq1MuKlTopkoGEWM0fgh7UKna2
Content-Type: multipart/mixed;
 boundary="------------A99C9F8B3E6D7D0E4FB0E828"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A99C9F8B3E6D7D0E4FB0E828
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.09.21 17:46, Roger Pau Monne wrote:
> Restore the previous way of mapping the xenstore ring using foreign
> memory. Use xenforeignmemory instead of libxc in order to avoid adding
> another dependency on a unstable interface.

Mapping a guest page via xenforeignmemory is no good move IMO. A guest
not supporting a grant table for security reasons is a rather strange
idea, as it needs to trade that for a general memory access by any
backend without a way to restrict such accesses. This contradicts one
of the main concepts of the Xen security architecture.

At the same time this will either kill the use of xenstore-stubdom, or
it will require an extended XSM configuration allowing xenstore-stubdom
to establish arbitrary page mappings of those guests.


Juergen

>=20
> This in turn requires storing the gfn into xs_state_connection for
> resume purposes, which breaks the current format.
>=20
> Note this is a preparatory patch in order to support the usage of
> xenstore on domains without grant table. This not only allows xenstore
> usage, but also makes things like "@introduceDomain" events work when
> using such guests, otherwise the mapping done in introduce_domain
> fails and the "@introduceDomain" event won't be signaled.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>   tools/xenstore/Makefile                 |  4 +-
>   tools/xenstore/include/xenstore_state.h |  1 +
>   tools/xenstore/xenstored_domain.c       | 69 +++++++++++++++++++-----=
-
>   3 files changed, 56 insertions(+), 18 deletions(-)
>=20
> diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
> index 292b478fa1..9a9f7be5cb 100644
> --- a/tools/xenstore/Makefile
> +++ b/tools/xenstore/Makefile
> @@ -67,10 +67,10 @@ $(XENSTORED_OBJS): CFLAGS +=3D $(SYSTEMD_CFLAGS)
>   xenstored: LDFLAGS +=3D $(SYSTEMD_LIBS)
>   endif
>  =20
> -$(XENSTORED_OBJS): CFLAGS +=3D $(CFLAGS_libxengnttab)
> +$(XENSTORED_OBJS): CFLAGS +=3D $(CFLAGS_libxengnttab) $(CFLAGS_libxenf=
oreignmemory)
>  =20
>   xenstored: $(XENSTORED_OBJS)
> -	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(L=
DLIBS_libxenctrl) $(LDLIBS_xenstored) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLA=
GS)
> +	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(L=
DLIBS_libxenforeignmemory) $(LDLIBS_libxenctrl) $(LDLIBS_xenstored) $(SOC=
KET_LIBS) -o $@ $(APPEND_LDFLAGS)
>  =20
>   xenstored.a: $(XENSTORED_OBJS)
>   	$(AR) cr $@ $^
> diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstore/i=
nclude/xenstore_state.h
> index ae0d053c8f..8dcc8d9d8b 100644
> --- a/tools/xenstore/include/xenstore_state.h
> +++ b/tools/xenstore/include/xenstore_state.h
> @@ -80,6 +80,7 @@ struct xs_state_connection {
>               uint16_t domid;  /* Domain-Id. */
>               uint16_t tdomid; /* Id of target domain or DOMID_INVALID.=
 */
>               uint32_t evtchn; /* Event channel port. */
> +            uint64_t gfn;    /* Store GFN. */
>           } ring;
>           int32_t socket_fd;   /* File descriptor for socket connection=
s. */
>       } spec;
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstor=
ed_domain.c
> index 8930303773..f3563e47aa 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -33,10 +33,12 @@
>  =20
>   #include <xenevtchn.h>
>   #include <xenctrl.h>
> +#include <xenforeignmemory.h>
>   #include <xen/grant_table.h>
>  =20
>   static xc_interface *xc_handle;
>   xengnttab_handle *xgt_handle;
> +static xenforeignmemory_handle *xfm_handle;
>   static evtchn_port_t virq_port;
>  =20
>   xenevtchn_handle *xce_handle =3D NULL;
> @@ -66,12 +68,18 @@ struct domain
>   	/* Generation count at domain introduction time. */
>   	uint64_t generation;
>  =20
> +	/* Store GFN (if using a ring connection). */
> +	xen_pfn_t gfn;
> +
>   	/* Have we noticed that this domain is shutdown? */
>   	bool shutdown;
>  =20
>   	/* Has domain been officially introduced? */
>   	bool introduced;
>  =20
> +	/* Is the ring memory foreign mapped? */
> +	bool foreign_mapped;
> +
>   	/* number of entry from this domain in the store */
>   	int nbentry;
>  =20
> @@ -196,16 +204,29 @@ static const struct interface_funcs domain_funcs =
=3D {
>   	.can_read =3D domain_can_read,
>   };
>  =20
> -static void *map_interface(domid_t domid)
> +static void *map_interface(domid_t domid, xen_pfn_t gfn, bool *foreign=
_mapped)
>   {
> -	return xengnttab_map_grant_ref(xgt_handle, domid,
> -				       GNTTAB_RESERVED_XENSTORE,
> -				       PROT_READ|PROT_WRITE);
> +	void *map =3D xengnttab_map_grant_ref(xgt_handle, domid,
> +					    GNTTAB_RESERVED_XENSTORE,
> +					    PROT_READ|PROT_WRITE);
> +
> +	if (!map)
> +	{
> +		map =3D xenforeignmemory_map(xfm_handle, domid,
> +					   PROT_READ|PROT_WRITE, 1,
> +					   &gfn, NULL);
> +		*foreign_mapped =3D !!map;
> +	}
> +
> +	return map;
>   }
>  =20
> -static void unmap_interface(void *interface)
> +static void unmap_interface(void *interface, bool foreign_mapped)
>   {
> -	xengnttab_unmap(xgt_handle, interface, 1);
> +	if (foreign_mapped)
> +		xenforeignmemory_unmap(xfm_handle, interface, 1);
> +	else
> +		xengnttab_unmap(xgt_handle, interface, 1);
>   }
>  =20
>   static int destroy_domain(void *_domain)
> @@ -228,7 +249,8 @@ static int destroy_domain(void *_domain)
>   		if (domain->domid =3D=3D 0)
>   			unmap_xenbus(domain->interface);
>   		else
> -			unmap_interface(domain->interface);
> +			unmap_interface(domain->interface,
> +					domain->foreign_mapped);
>   	}
>  =20
>   	fire_watches(NULL, domain, "@releaseDomain", NULL, false, NULL);
> @@ -363,12 +385,15 @@ static struct domain *find_or_alloc_domain(const =
void *ctx, unsigned int domid)
>   	return domain ? : alloc_domain(ctx, domid);
>   }
>  =20
> -static int new_domain(struct domain *domain, int port, bool restore)
> +static int new_domain(struct domain *domain, int port, xen_pfn_t gfn,
> +		      bool foreign_mapped, bool restore)
>   {
>   	int rc;
>  =20
>   	domain->port =3D 0;
>   	domain->shutdown =3D false;
> +	domain->gfn =3D gfn;
> +	domain->foreign_mapped =3D foreign_mapped;
>   	domain->path =3D talloc_domain_path(domain, domain->domid);
>   	if (!domain->path) {
>   		errno =3D ENOMEM;
> @@ -436,7 +461,8 @@ static void domain_conn_reset(struct domain *domain=
)
>  =20
>   static struct domain *introduce_domain(const void *ctx,
>   				       unsigned int domid,
> -				       evtchn_port_t port, bool restore)
> +				       evtchn_port_t port, xen_pfn_t gfn,
> +				       bool restore)
>   {
>   	struct domain *domain;
>   	int rc;
> @@ -448,17 +474,21 @@ static struct domain *introduce_domain(const void=
 *ctx,
>   		return NULL;
>  =20
>   	if (!domain->introduced) {
> +		bool foreign_mapped =3D false;
> +
>   		interface =3D is_master_domain ? xenbus_map()
> -					     : map_interface(domid);
> +					     : map_interface(domid, gfn,
> +							     &foreign_mapped);
>   		if (!interface && !restore)
>   			return NULL;
> -		if (new_domain(domain, port, restore)) {
> +		if (new_domain(domain, port, gfn, foreign_mapped, restore)) {
>   			rc =3D errno;
>   			if (interface) {
>   				if (is_master_domain)
>   					unmap_xenbus(interface);
>   				else
> -					unmap_interface(interface);
> +					unmap_interface(interface,
> +							foreign_mapped);
>   			}
>   			errno =3D rc;
>   			return NULL;
> @@ -489,19 +519,20 @@ int do_introduce(struct connection *conn, struct =
buffered_data *in)
>   	char *vec[3];
>   	unsigned int domid;
>   	evtchn_port_t port;
> +	xen_pfn_t gfn;
>  =20
>   	if (get_strings(in, vec, ARRAY_SIZE(vec)) < ARRAY_SIZE(vec))
>   		return EINVAL;
>  =20
>   	domid =3D atoi(vec[0]);
> -	/* Ignore the gfn, we don't need it. */
> +	gfn =3D atol(vec[1]);
>   	port =3D atoi(vec[2]);
>  =20
>   	/* Sanity check args. */
>   	if (port <=3D 0)
>   		return EINVAL;
>  =20
> -	domain =3D introduce_domain(in, domid, port, false);
> +	domain =3D introduce_domain(in, domid, port, gfn, false);
>   	if (!domain)
>   		return errno;
>  =20
> @@ -718,7 +749,7 @@ void dom0_init(void)
>   	if (port =3D=3D -1)
>   		barf_perror("Failed to initialize dom0 port");
>  =20
> -	dom0 =3D introduce_domain(NULL, xenbus_master_domid(), port, false);
> +	dom0 =3D introduce_domain(NULL, xenbus_master_domid(), port, 0, false=
);
>   	if (!dom0)
>   		barf_perror("Failed to initialize dom0");
>  =20
> @@ -758,6 +789,10 @@ void domain_init(int evtfd)
>   	 */
>   	xengnttab_set_max_grants(xgt_handle, DOMID_FIRST_RESERVED);
>  =20
> +	xfm_handle =3D xenforeignmemory_open(NULL, 0);
> +	if (!xfm_handle)
> +		barf_perror("Failed to create handle for foreign memory");
> +
>   	if (evtfd < 0)
>   		xce_handle =3D xenevtchn_open(NULL, XENEVTCHN_NO_CLOEXEC);
>   	else
> @@ -1189,6 +1224,7 @@ const char *dump_state_connections(FILE *fp)
>   			sc.spec.ring.tdomid =3D c->target ? c->target->id
>   						: DOMID_INVALID;
>   			sc.spec.ring.evtchn =3D c->domain->port;
> +			sc.spec.ring.gfn =3D c->domain->gfn;
>   		} else {
>   			sc.conn_type =3D XS_STATE_CONN_TYPE_SOCKET;
>   			sc.spec.socket_fd =3D c->fd;
> @@ -1290,7 +1326,8 @@ void read_state_connection(const void *ctx, const=
 void *state)
>   #endif
>   	} else {
>   		domain =3D introduce_domain(ctx, sc->spec.ring.domid,
> -					  sc->spec.ring.evtchn, true);
> +					  sc->spec.ring.evtchn,
> +					  sc->spec.ring.gfn, true);
>   		if (!domain)
>   			barf("domain allocation error");
>  =20
>=20


--------------A99C9F8B3E6D7D0E4FB0E828
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

--------------A99C9F8B3E6D7D0E4FB0E828--

--M7VJ1cDQq1MuKlTopkoGEWM0fgh7UKna2--

--Hsp4u7qZ65kAJHwz1ETznUGJ4lJeCDzwu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFIRU0FAwAAAAAACgkQsN6d1ii/Ey9b
SQf/Z1afyFTCfUjM2Xw7BBOxu/XLkEl0EJnYY6wwmlqsrqzDftcWj6me2kOBWA4e97WvPhSvdzbL
pCibiBMAbQjtfkgP9CWmhYLDgL39fs4SIZ+hGYr2dAusxMHRxSD133+/L1z9Gfiw6H3W5hW3JCZV
srjGYR179+GAv6bP2EDCDh0nloovppbC4cufZLq37gdRRW8zzZEno9LX9mAD95CzL8fSmR3+1Y01
Z7w7Oasqt5IR+jpt4sQlSk+3a/aQIVAl6S6LdMdvJodvAiT3D/OtKYt66ziqAZjqZCMbRmb/VVoS
j2FV8F4ssJb7Qvz6XCt/kfPAf+WKh+/kcRMgRNSnlA==
=TKD+
-----END PGP SIGNATURE-----

--Hsp4u7qZ65kAJHwz1ETznUGJ4lJeCDzwu--

