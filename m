Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E47539A393
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 16:45:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136468.252998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1looZe-0001ED-By; Thu, 03 Jun 2021 14:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136468.252998; Thu, 03 Jun 2021 14:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1looZe-0001C5-7w; Thu, 03 Jun 2021 14:43:54 +0000
Received: by outflank-mailman (input) for mailman id 136468;
 Thu, 03 Jun 2021 14:43:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z4WE=K5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1looZc-0001Bz-Td
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 14:43:53 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 151ba2f9-3a92-4677-bfa8-77ff2b1e15ce;
 Thu, 03 Jun 2021 14:43:49 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 394AF219FA;
 Thu,  3 Jun 2021 14:43:48 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0C5EE118DD;
 Thu,  3 Jun 2021 14:43:48 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ORXNAaTquGAjUgAALh3uQQ
 (envelope-from <jgross@suse.com>); Thu, 03 Jun 2021 14:43:48 +0000
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
X-Inumbo-ID: 151ba2f9-3a92-4677-bfa8-77ff2b1e15ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622731428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lGBbOnGU+NJtjn0Zub4m7iAkGrmgQwLPP/B7yW5z1oA=;
	b=IzCCZwOSvRkVbKenzalsVNSOZQqSK2uy3AJ3dWARilk65NSTTnqJDD/lOA18r9Pu1vcsFV
	WSLYl9p5jn3l5Xkce2rFuIT870jMXv33pFTP4Q0oAiMzLsAx1tVFgvGtQSB3R2PFALgiC6
	hX9A8G+pJrRvHydm9G6ONRiatwZJlq8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622731428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lGBbOnGU+NJtjn0Zub4m7iAkGrmgQwLPP/B7yW5z1oA=;
	b=IzCCZwOSvRkVbKenzalsVNSOZQqSK2uy3AJ3dWARilk65NSTTnqJDD/lOA18r9Pu1vcsFV
	WSLYl9p5jn3l5Xkce2rFuIT870jMXv33pFTP4Q0oAiMzLsAx1tVFgvGtQSB3R2PFALgiC6
	hX9A8G+pJrRvHydm9G6ONRiatwZJlq8=
Subject: Re: [PATCH v4] tools/libs/store: cleanup libxenstore interface
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210512144832.19026-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <d767389d-9fc1-76e8-3928-734b16a11819@suse.com>
Date: Thu, 3 Jun 2021 16:43:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210512144832.19026-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FVSMMg1HeqT0CRTtZXq8wr0XtOMXlye9u"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FVSMMg1HeqT0CRTtZXq8wr0XtOMXlye9u
Content-Type: multipart/mixed; boundary="86U1Q58838eTKE0PrpmthRR4TYati14QS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <d767389d-9fc1-76e8-3928-734b16a11819@suse.com>
Subject: Re: [PATCH v4] tools/libs/store: cleanup libxenstore interface
References: <20210512144832.19026-1-jgross@suse.com>
In-Reply-To: <20210512144832.19026-1-jgross@suse.com>

--86U1Q58838eTKE0PrpmthRR4TYati14QS
Content-Type: multipart/mixed;
 boundary="------------45C0131E856EEBA87D5D6AAD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------45C0131E856EEBA87D5D6AAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Ping?

On 12.05.21 16:48, Juergen Gross wrote:
> There are some internals in the libxenstore interface which should be
> removed.
>=20
> Move those functions into xs_lib.c and the related definitions into
> xs_lib.h. Remove the functions from the mapfile. Add xs_lib.o to
> xenstore_client as some of the internal functions are needed there.
>=20
> Bump the libxenstore version to 4.0 as the change is incompatible.
> Note that the removed functions should not result in any problem as
> they ought to be used by xenstored or xenstore_client only.
>=20
> Avoid an enum as part of a structure as the size of an enum is
> compiler implementation dependent.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2: minimal variant (Ian Jackson)
> V3: replace enum with unsigned int (Andrew Cooper)
> V4: full variant again, this time with version bump (Ian Jackson)
> ---
>   tools/include/xenstore_lib.h       |  54 ++------------
>   tools/libs/store/Makefile          |   4 +-
>   tools/libs/store/libxenstore.map   |  10 +--
>   tools/libs/store/xs.c              | 112 +---------------------------=

>   tools/xenstore/Makefile            |   4 +-
>   tools/xenstore/utils.h             |  11 +++
>   tools/xenstore/xenstore_client.c   |   2 +
>   tools/xenstore/xenstored_control.c |   1 +
>   tools/xenstore/xenstored_core.c    |  19 +++--
>   tools/xenstore/xenstored_core.h    |   6 +-
>   tools/xenstore/xenstored_watch.c   |   2 +-
>   tools/xenstore/xs_lib.c            | 114 ++++++++++++++++++++++++++++=
-
>   tools/xenstore/xs_lib.h            |  50 +++++++++++++
>   tools/xenstore/xs_tdb_dump.c       |   2 +-
>   14 files changed, 204 insertions(+), 187 deletions(-)
>   create mode 100644 tools/xenstore/xs_lib.h
>=20
> diff --git a/tools/include/xenstore_lib.h b/tools/include/xenstore_lib.=
h
> index 4c9b6d1685..2266009ec1 100644
> --- a/tools/include/xenstore_lib.h
> +++ b/tools/include/xenstore_lib.h
> @@ -26,42 +26,26 @@
>   #include <stdint.h>
>   #include <xen/io/xs_wire.h>
>  =20
> -/* Bitmask of permissions. */
> -enum xs_perm_type {
> -	XS_PERM_NONE =3D 0,
> -	XS_PERM_READ =3D 1,
> -	XS_PERM_WRITE =3D 2,
> -	/* Internal use. */
> -	XS_PERM_ENOENT_OK =3D 4,
> -	XS_PERM_OWNER =3D 8,
> -	XS_PERM_IGNORE =3D 16,
> -};
> -
>   struct xs_permissions
>   {
>   	unsigned int id;
> -	enum xs_perm_type perms;
> -};
> -
> -/* Header of the node record in tdb. */
> -struct xs_tdb_record_hdr {
> -	uint64_t generation;
> -	uint32_t num_perms;
> -	uint32_t datalen;
> -	uint32_t childlen;
> -	struct xs_permissions perms[0];
> +	unsigned int perms;	/* Bitmask of permissions. */
> +#define XS_PERM_NONE		0x00
> +#define XS_PERM_READ		0x01
> +#define XS_PERM_WRITE		0x02
> +	/* Internal use. */
> +#define XS_PERM_ENOENT_OK	0x04
> +#define XS_PERM_OWNER		0x08
> +#define XS_PERM_IGNORE		0x10
>   };
>  =20
>   /* Each 10 bits takes ~ 3 digits, plus one, plus one for nul terminat=
or. */
>   #define MAX_STRLEN(x) ((sizeof(x) * CHAR_BIT + CHAR_BIT-1) / 10 * 3 +=20
2)
>  =20
>   /* Path for various daemon things: env vars can override. */
> -const char *xs_daemon_rootdir(void);
>   const char *xs_daemon_rundir(void);
>   const char *xs_daemon_socket(void);
>   const char *xs_daemon_socket_ro(void);
> -const char *xs_domain_dev(void);
> -const char *xs_daemon_tdb(void);
>  =20
>   /* Simple write function: loops for you. */
>   bool xs_write_all(int fd, const void *data, unsigned int len);
> @@ -70,26 +54,4 @@ bool xs_write_all(int fd, const void *data, unsigned=20
int len);
>   bool xs_strings_to_perms(struct xs_permissions *perms, unsigned int n=
um,
>   			 const char *strings);
>  =20
> -/* Convert permissions to a string (up to len MAX_STRLEN(unsigned int)=
+1). */
> -bool xs_perm_to_string(const struct xs_permissions *perm,
> -                       char *buffer, size_t buf_len);
> -
> -/* Given a string and a length, count how many strings (nul terms). */=

> -unsigned int xs_count_strings(const char *strings, unsigned int len);
> -
> -/* Sanitising (quoting) possibly-binary strings. */
> -struct expanding_buffer {
> -	char *buf;
> -	int avail;
> -};
> -
> -/* Ensure that given expanding buffer has at least min_avail character=
s. */
> -char *expanding_buffer_ensure(struct expanding_buffer *, int min_avail=
);
> -
> -/* sanitise_value() may return NULL if malloc fails. */
> -char *sanitise_value(struct expanding_buffer *, const char *val, unsig=
ned len);
> -
> -/* *out_len_r on entry is ignored; out must be at least strlen(in)+1 b=
ytes. */
> -void unsanitise_value(char *out, unsigned *out_len_r, const char *in);=

> -
>   #endif /* XENSTORE_LIB_H */
> diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
> index bee57b5629..43b018aa8c 100644
> --- a/tools/libs/store/Makefile
> +++ b/tools/libs/store/Makefile
> @@ -1,8 +1,8 @@
>   XEN_ROOT=3D$(CURDIR)/../../..
>   include $(XEN_ROOT)/tools/Rules.mk
>  =20
> -MAJOR =3D 3.0
> -MINOR =3D 3
> +MAJOR =3D 4
> +MINOR =3D 0
>  =20
>   ifeq ($(CONFIG_Linux),y)
>   APPEND_LDFLAGS +=3D -ldl
> diff --git a/tools/libs/store/libxenstore.map b/tools/libs/store/libxen=
store.map
> index 9854305a2c..7e6c7bdd30 100644
> --- a/tools/libs/store/libxenstore.map
> +++ b/tools/libs/store/libxenstore.map
> @@ -1,4 +1,4 @@
> -VERS_3.0.3 {
> +VERS_4.0 {
>   	global:
>   		xs_open;
>   		xs_close;
> @@ -32,18 +32,10 @@ VERS_3.0.3 {
>   		xs_control_command;
>   		xs_debug_command;
>   		xs_suspend_evtchn_port;
> -		xs_daemon_rootdir;
>   		xs_daemon_rundir;
>   		xs_daemon_socket;
>   		xs_daemon_socket_ro;
> -		xs_domain_dev;
> -		xs_daemon_tdb;
>   		xs_write_all;
>   		xs_strings_to_perms;
> -		xs_perm_to_string;
> -		xs_count_strings;
> -		expanding_buffer_ensure;
> -		sanitise_value;
> -		unsanitise_value;
>   	local: *; /* Do not expose anything by default */
>   };
> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index c91377c27f..7a9a8b1656 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -34,6 +34,7 @@
>   #include <stdint.h>
>   #include <errno.h>
>   #include "xenstore.h"
> +#include "xs_lib.h"
>   #include "list.h"
>   #include "utils.h"
>  =20
> @@ -1358,117 +1359,6 @@ static void *read_thread(void *arg)
>   }
>   #endif
>  =20
> -char *expanding_buffer_ensure(struct expanding_buffer *ebuf, int min_a=
vail)
> -{
> -	int want;
> -	char *got;
> -
> -	if (ebuf->avail >=3D min_avail)
> -		return ebuf->buf;
> -
> -	if (min_avail >=3D INT_MAX/3)
> -		return 0;
> -
> -	want =3D ebuf->avail + min_avail + 10;
> -	got =3D realloc(ebuf->buf, want);
> -	if (!got)
> -		return 0;
> -
> -	ebuf->buf =3D got;
> -	ebuf->avail =3D want;
> -	return ebuf->buf;
> -}
> -
> -char *sanitise_value(struct expanding_buffer *ebuf,
> -		     const char *val, unsigned len)
> -{
> -	int used, remain, c;
> -	unsigned char *ip;
> -
> -#define ADD(c) (ebuf->buf[used++] =3D (c))
> -#define ADDF(f,c) (used +=3D sprintf(ebuf->buf+used, (f), (c)))
> -
> -	assert(len < INT_MAX/5);
> -
> -	ip =3D (unsigned char *)val;
> -	used =3D 0;
> -	remain =3D len;
> -
> -	if (!expanding_buffer_ensure(ebuf, remain + 1))
> -		return NULL;
> -
> -	while (remain-- > 0) {
> -		c=3D *ip++;
> -
> -		if (c >=3D ' ' && c <=3D '~' && c !=3D '\\') {
> -			ADD(c);
> -			continue;
> -		}
> -
> -		if (!expanding_buffer_ensure(ebuf, used + remain + 5))
> -			/* for "<used>\\nnn<remain>\0" */
> -			return 0;
> -
> -		ADD('\\');
> -		switch (c) {
> -		case '\t':  ADD('t');   break;
> -		case '\n':  ADD('n');   break;
> -		case '\r':  ADD('r');   break;
> -		case '\\':  ADD('\\');  break;
> -		default:
> -			if (c < 010) ADDF("%03o", c);
> -			else         ADDF("x%02x", c);
> -		}
> -	}
> -
> -	ADD(0);
> -	assert(used <=3D ebuf->avail);
> -	return ebuf->buf;
> -
> -#undef ADD
> -#undef ADDF
> -}
> -
> -void unsanitise_value(char *out, unsigned *out_len_r, const char *in)
> -{
> -	const char *ip;
> -	char *op;
> -	unsigned c;
> -	int n;
> -
> -	for (ip =3D in, op =3D out; (c =3D *ip++); *op++ =3D c) {
> -		if (c =3D=3D '\\') {
> -			c =3D *ip++;
> -
> -#define GETF(f) do {					\
> -			n =3D 0;				\
> -			sscanf(ip, f "%n", &c, &n);	\
> -			ip +=3D n;			\
> -		} while (0)
> -
> -			switch (c) {
> -			case 't':              c=3D '\t';            break;
> -			case 'n':              c=3D '\n';            break;
> -			case 'r':              c=3D '\r';            break;
> -			case '\\':             c=3D '\\';            break;
> -			case 'x':                    GETF("%2x");  break;
> -			case '0': case '4':
> -			case '1': case '5':
> -			case '2': case '6':
> -			case '3': case '7':    --ip; GETF("%3o");  break;
> -			case 0:                --ip;               break;
> -			default:;
> -			}
> -#undef GETF
> -		}
> -	}
> -
> -	*op =3D 0;
> -
> -	if (out_len_r)
> -		*out_len_r =3D op - out;
> -}
> -
>   /*
>    * Local variables:
>    *  mode: C
> diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
> index ab89e22d3a..01c9ccc70f 100644
> --- a/tools/xenstore/Makefile
> +++ b/tools/xenstore/Makefile
> @@ -78,8 +78,8 @@ xenstored.a: $(XENSTORED_OBJS)
>   $(CLIENTS): xenstore
>   	ln -f xenstore $@
>  =20
> -xenstore: xenstore_client.o
> -	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(=
SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
> +xenstore: xenstore_client.o xs_lib.o
> +	$(CC) $^ $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(=
SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
>  =20
>   xenstore-control: xenstore_control.o
>   	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDL=
IBS_libxenguest) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_L=
DFLAGS)
> diff --git a/tools/xenstore/utils.h b/tools/xenstore/utils.h
> index 87713a8e5d..9d012b97c1 100644
> --- a/tools/xenstore/utils.h
> +++ b/tools/xenstore/utils.h
> @@ -7,6 +7,17 @@
>  =20
>   #include <xen-tools/libs.h>
>  =20
> +#include "xenstore_lib.h"
> +
> +/* Header of the node record in tdb. */
> +struct xs_tdb_record_hdr {
> +	uint64_t generation;
> +	uint32_t num_perms;
> +	uint32_t datalen;
> +	uint32_t childlen;
> +	struct xs_permissions perms[0];
> +};
> +
>   /* Is A =3D=3D B ? */
>   #define streq(a,b) (strcmp((a),(b)) =3D=3D 0)
>  =20
> diff --git a/tools/xenstore/xenstore_client.c b/tools/xenstore/xenstore=
_client.c
> index ddbafc5175..0628ba275e 100644
> --- a/tools/xenstore/xenstore_client.c
> +++ b/tools/xenstore/xenstore_client.c
> @@ -22,6 +22,8 @@
>  =20
>   #include <sys/ioctl.h>
>  =20
> +#include "xs_lib.h"
> +
>   #define PATH_SEP '/'
>   #define MAX_PATH_LEN 256
>  =20
> diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xensto=
red_control.c
> index 52d4817679..995f671f35 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -34,6 +34,7 @@
>  =20
>   #include "utils.h"
>   #include "talloc.h"
> +#include "xs_lib.h"
>   #include "xenstored_core.h"
>   #include "xenstored_control.h"
>   #include "xenstored_domain.h"
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored=
_core.c
> index 02ae390e25..4b7b71cfb3 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -46,7 +46,7 @@
>   #include "utils.h"
>   #include "list.h"
>   #include "talloc.h"
> -#include "xenstore_lib.h"
> +#include "xs_lib.h"
>   #include "xenstored_core.h"
>   #include "xenstored_watch.h"
>   #include "xenstored_transaction.h"
> @@ -542,11 +542,11 @@ static int write_node(struct connection *conn, st=
ruct node *node,
>   	return write_node_raw(conn, &key, node, no_quota_check);
>   }
>  =20
> -enum xs_perm_type perm_for_conn(struct connection *conn,
> -				const struct node_perms *perms)
> +unsigned int perm_for_conn(struct connection *conn,
> +			   const struct node_perms *perms)
>   {
>   	unsigned int i;
> -	enum xs_perm_type mask =3D XS_PERM_READ|XS_PERM_WRITE|XS_PERM_OWNER;
> +	unsigned int mask =3D XS_PERM_READ|XS_PERM_WRITE|XS_PERM_OWNER;
>  =20
>   	/* Owners and tools get it all... */
>   	if (!domain_is_unprivileged(conn) || perms->p[0].id =3D=3D conn->id
> @@ -584,7 +584,7 @@ char *get_parent(const void *ctx, const char *node)=

>    * Temporary memory allocations are done with ctx.
>    */
>   static int ask_parents(struct connection *conn, const void *ctx,
> -		       const char *name, enum xs_perm_type *perm)
> +		       const char *name, unsigned int *perm)
>   {
>   	struct node *node;
>  =20
> @@ -618,10 +618,9 @@ static int ask_parents(struct connection *conn, co=
nst void *ctx,
>    * Temporary memory allocations are done with ctx.
>    */
>   static int errno_from_parents(struct connection *conn, const void *ct=
x,
> -			      const char *node, int errnum,
> -			      enum xs_perm_type perm)
> +			      const char *node, int errnum, unsigned int perm)
>   {
> -	enum xs_perm_type parent_perm =3D XS_PERM_NONE;
> +	unsigned int parent_perm =3D XS_PERM_NONE;
>  =20
>   	/* We always tell them about memory failures. */
>   	if (errnum =3D=3D ENOMEM)
> @@ -641,7 +640,7 @@ static int errno_from_parents(struct connection *co=
nn, const void *ctx,
>   static struct node *get_node(struct connection *conn,
>   			     const void *ctx,
>   			     const char *name,
> -			     enum xs_perm_type perm)
> +			     unsigned int perm)
>   {
>   	struct node *node;
>  =20
> @@ -873,7 +872,7 @@ static struct node *get_node_canonicalized(struct c=
onnection *conn,
>   					   const void *ctx,
>   					   const char *name,
>   					   char **canonical_name,
> -					   enum xs_perm_type perm)
> +					   unsigned int perm)
>   {
>   	char *tmp_name;
>  =20
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored=
_core.h
> index b50ea3f57d..6a6d0448e8 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -185,8 +185,8 @@ void send_ack(struct connection *conn, enum xsd_soc=
kmsg_type type);
>   char *canonicalize(struct connection *conn, const void *ctx, const ch=
ar *node);
>  =20
>   /* Get access permissions. */
> -enum xs_perm_type perm_for_conn(struct connection *conn,
> -				const struct node_perms *perms);
> +unsigned int perm_for_conn(struct connection *conn,
> +			   const struct node_perms *perms);
>  =20
>   /* Write a node to the tdb data base. */
>   int write_node_raw(struct connection *conn, TDB_DATA *key, struct nod=
e *node,
> @@ -200,8 +200,6 @@ struct connection *new_connection(connwritefn_t *wr=
ite, connreadfn_t *read);
>   struct connection *get_connection_by_id(unsigned int conn_id);
>   void check_store(void);
>   void corrupt(struct connection *conn, const char *fmt, ...);
> -enum xs_perm_type perm_for_conn(struct connection *conn,
> -				const struct node_perms *perms);
>  =20
>   /* Is this a valid node name? */
>   bool is_valid_nodename(const char *node);
> diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstore=
d_watch.c
> index db89e0141f..aca0a71bad 100644
> --- a/tools/xenstore/xenstored_watch.c
> +++ b/tools/xenstore/xenstored_watch.c
> @@ -124,7 +124,7 @@ static bool watch_permitted(struct connection *conn=
, const void *ctx,
>   			    const char *name, struct node *node,
>   			    struct node_perms *perms)
>   {
> -	enum xs_perm_type perm;
> +	unsigned int perm;
>   	struct node *parent;
>   	char *parent_name;
>  =20
> diff --git a/tools/xenstore/xs_lib.c b/tools/xenstore/xs_lib.c
> index 80c03acbea..10fa4c3ad0 100644
> --- a/tools/xenstore/xs_lib.c
> +++ b/tools/xenstore/xs_lib.c
> @@ -16,12 +16,13 @@
>       License along with this library; If not, see <http://www.gnu.org/=
licenses/>.
>   */
>  =20
> +#include <assert.h>
>   #include <unistd.h>
>   #include <stdio.h>
>   #include <string.h>
>   #include <stdlib.h>
>   #include <errno.h>
> -#include "xenstore_lib.h"
> +#include "xs_lib.h"
>  =20
>   /* Common routines for the Xen store daemon and client library. */
>  =20
> @@ -179,3 +180,114 @@ unsigned int xs_count_strings(const char *strings=
, unsigned int len)
>  =20
>   	return num;
>   }
> +
> +char *expanding_buffer_ensure(struct expanding_buffer *ebuf, int min_a=
vail)
> +{
> +	int want;
> +	char *got;
> +
> +	if (ebuf->avail >=3D min_avail)
> +		return ebuf->buf;
> +
> +	if (min_avail >=3D INT_MAX/3)
> +		return 0;
> +
> +	want =3D ebuf->avail + min_avail + 10;
> +	got =3D realloc(ebuf->buf, want);
> +	if (!got)
> +		return 0;
> +
> +	ebuf->buf =3D got;
> +	ebuf->avail =3D want;
> +	return ebuf->buf;
> +}
> +
> +char *sanitise_value(struct expanding_buffer *ebuf,
> +		     const char *val, unsigned len)
> +{
> +	int used, remain, c;
> +	unsigned char *ip;
> +
> +#define ADD(c) (ebuf->buf[used++] =3D (c))
> +#define ADDF(f,c) (used +=3D sprintf(ebuf->buf+used, (f), (c)))
> +
> +	assert(len < INT_MAX/5);
> +
> +	ip =3D (unsigned char *)val;
> +	used =3D 0;
> +	remain =3D len;
> +
> +	if (!expanding_buffer_ensure(ebuf, remain + 1))
> +		return NULL;
> +
> +	while (remain-- > 0) {
> +		c=3D *ip++;
> +
> +		if (c >=3D ' ' && c <=3D '~' && c !=3D '\\') {
> +			ADD(c);
> +			continue;
> +		}
> +
> +		if (!expanding_buffer_ensure(ebuf, used + remain + 5))
> +			/* for "<used>\\nnn<remain>\0" */
> +			return 0;
> +
> +		ADD('\\');
> +		switch (c) {
> +		case '\t':  ADD('t');   break;
> +		case '\n':  ADD('n');   break;
> +		case '\r':  ADD('r');   break;
> +		case '\\':  ADD('\\');  break;
> +		default:
> +			if (c < 010) ADDF("%03o", c);
> +			else         ADDF("x%02x", c);
> +		}
> +	}
> +
> +	ADD(0);
> +	assert(used <=3D ebuf->avail);
> +	return ebuf->buf;
> +
> +#undef ADD
> +#undef ADDF
> +}
> +
> +void unsanitise_value(char *out, unsigned *out_len_r, const char *in)
> +{
> +	const char *ip;
> +	char *op;
> +	unsigned c;
> +	int n;
> +
> +	for (ip =3D in, op =3D out; (c =3D *ip++); *op++ =3D c) {
> +		if (c =3D=3D '\\') {
> +			c =3D *ip++;
> +
> +#define GETF(f) do {					\
> +			n =3D 0;				\
> +			sscanf(ip, f "%n", &c, &n);	\
> +			ip +=3D n;			\
> +		} while (0)
> +
> +			switch (c) {
> +			case 't':		c=3D '\t';		break;
> +			case 'n':		c=3D '\n';		break;
> +			case 'r':		c=3D '\r';		break;
> +			case '\\':		c=3D '\\';		break;
> +			case 'x':		GETF("%2x");		break;
> +			case '0': case '4':
> +			case '1': case '5':
> +			case '2': case '6':
> +			case '3': case '7':	--ip; GETF("%3o");	break;
> +			case 0:			--ip;			break;
> +			default:;
> +			}
> +#undef GETF
> +		}
> +	}
> +
> +	*op =3D 0;
> +
> +	if (out_len_r)
> +		*out_len_r =3D op - out;
> +}
> diff --git a/tools/xenstore/xs_lib.h b/tools/xenstore/xs_lib.h
> new file mode 100644
> index 0000000000..efa05997d6
> --- /dev/null
> +++ b/tools/xenstore/xs_lib.h
> @@ -0,0 +1,50 @@
> +/*
> +    Common routines between Xen store user library and daemon.
> +    Copyright (C) 2005 Rusty Russell IBM Corporation
> +
> +    This library is free software; you can redistribute it and/or
> +    modify it under the terms of the GNU Lesser General Public
> +    License as published by the Free Software Foundation; either
> +    version 2.1 of the License, or (at your option) any later version.=

> +
> +    This library is distributed in the hope that it will be useful,
> +    but WITHOUT ANY WARRANTY; without even the implied warranty of
> +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +    Lesser General Public License for more details.
> +
> +    You should have received a copy of the GNU Lesser General Public
> +    License along with this library; If not, see <http://www.gnu.org/l=
icenses/>.
> +*/
> +
> +#ifndef XS_LIB_H
> +#define XS_LIB_H
> +
> +#include "xenstore_lib.h"
> +
> +const char *xs_daemon_rootdir(void);
> +const char *xs_domain_dev(void);
> +const char *xs_daemon_tdb(void);
> +
> +/* Convert permissions to a string (up to len MAX_STRLEN(unsigned int)=
+1). */
> +bool xs_perm_to_string(const struct xs_permissions *perm,
> +		       char *buffer, size_t buf_len);
> +
> +/* Given a string and a length, count how many strings (nul terms). */=

> +unsigned int xs_count_strings(const char *strings, unsigned int len);
> +
> +/* Sanitising (quoting) possibly-binary strings. */
> +struct expanding_buffer {
> +	char *buf;
> +	int avail;
> +};
> +
> +/* Ensure that given expanding buffer has at least min_avail character=
s. */
> +char *expanding_buffer_ensure(struct expanding_buffer *, int min_avail=
);
> +
> +/* sanitise_value() may return NULL if malloc fails. */
> +char *sanitise_value(struct expanding_buffer *, const char *val, unsig=
ned len);
> +
> +/* *out_len_r on entry is ignored; out must be at least strlen(in)+1 b=
ytes. */
> +void unsanitise_value(char *out, unsigned *out_len_r, const char *in);=

> +
> +#endif /* XS_LIB_H */
> diff --git a/tools/xenstore/xs_tdb_dump.c b/tools/xenstore/xs_tdb_dump.=
c
> index f74676cf1c..5d2db392b4 100644
> --- a/tools/xenstore/xs_tdb_dump.c
> +++ b/tools/xenstore/xs_tdb_dump.c
> @@ -17,7 +17,7 @@ static uint32_t total_size(struct xs_tdb_record_hdr *=
hdr)
>   		+ hdr->datalen + hdr->childlen;
>   }
>  =20
> -static char perm_to_char(enum xs_perm_type perm)
> +static char perm_to_char(unsigned int perm)
>   {
>   	return perm =3D=3D XS_PERM_READ ? 'r' :
>   		perm =3D=3D XS_PERM_WRITE ? 'w' :
>=20


--------------45C0131E856EEBA87D5D6AAD
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

--------------45C0131E856EEBA87D5D6AAD--

--86U1Q58838eTKE0PrpmthRR4TYati14QS--

--FVSMMg1HeqT0CRTtZXq8wr0XtOMXlye9u
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC46qMFAwAAAAAACgkQsN6d1ii/Ey++
Hgf/XIHKkQSNgr4zyO/5WaY/PfA2KtLZoICpHac9QVj/J8cla6FuAkEkLUJtiuRZkPPRV4SP6k5/
anisMBLy4V82xPB7eZffTTGqCY6k2rmsXui/qx6FQ8ELHp9AsS7DXrJd/mB2e3v1mxrKSRozyjj9
zZ4uFFMlRFj56u4G3s5oHrbRDdZ+F2FLMkVNLxB1MCLNVFIuY0xSUI7fnxxpynkV//ZfzpDdNpBc
SPjPIKUTxZbl9GE0x7WQRhkL7v+SP9iex3WLsepTCkQTIknKT85+ZDFllXAQvYYeg27ASMFoQ1sY
aua1s6r2gXElYwoncHe1ZtF5dwP4lGqfZM+ogxXssQ==
=F8bT
-----END PGP SIGNATURE-----

--FVSMMg1HeqT0CRTtZXq8wr0XtOMXlye9u--

