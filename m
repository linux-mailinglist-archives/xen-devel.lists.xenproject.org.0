Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3202B1EE4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 16:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26693.55144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdb7P-0000LE-4J; Fri, 13 Nov 2020 15:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26693.55144; Fri, 13 Nov 2020 15:36:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdb7P-0000Kp-12; Fri, 13 Nov 2020 15:36:07 +0000
Received: by outflank-mailman (input) for mailman id 26693;
 Fri, 13 Nov 2020 15:36:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zLmm=ET=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kdb7N-0000Kk-9F
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 15:36:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 311aa27f-20e5-4191-8240-9c8e942a8038;
 Fri, 13 Nov 2020 15:36:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2BC93AC91;
 Fri, 13 Nov 2020 15:36:01 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zLmm=ET=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kdb7N-0000Kk-9F
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 15:36:05 +0000
X-Inumbo-ID: 311aa27f-20e5-4191-8240-9c8e942a8038
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 311aa27f-20e5-4191-8240-9c8e942a8038;
	Fri, 13 Nov 2020 15:36:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605281761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ryp64Z30d3UxMICS2PN7CLOmpEyNxTJF3lub8XET8Nw=;
	b=c4SRwVO6a4esWTxKzOBgDU1tltFQSv+OfAWHwGUmz7IePmzq98clOCqmnt3BRuG1iGL0KM
	V0SX2QpibjWFnWgQ0KI3TXdON6UwyQ0S3ZY+poIhp0cAduQ84FE7h12PwMub4HRy0eAzsn
	JPKwqnkI/MzytxGQL15TQPiCq/MPZog=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2BC93AC91;
	Fri, 13 Nov 2020 15:36:01 +0000 (UTC)
To: Bjoern Doebel <doebel@amazon.de>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.co.uk>, Eslam Elnikety <elnikety@amazon.de>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20201113141823.58712-1-doebel@amazon.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
Message-ID: <5ac379ad-33fd-2973-dfdb-9e06ea539809@suse.com>
Date: Fri, 13 Nov 2020 16:36:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113141823.58712-1-doebel@amazon.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VhxVcXNzXEhYwBYwQcp6OXMYrtruzq31i"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VhxVcXNzXEhYwBYwQcp6OXMYrtruzq31i
Content-Type: multipart/mixed; boundary="P4Fykfytw7OBIa4CBxJXkpBIUjBRQjwdE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Bjoern Doebel <doebel@amazon.de>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.co.uk>, Eslam Elnikety <elnikety@amazon.de>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <5ac379ad-33fd-2973-dfdb-9e06ea539809@suse.com>
Subject: Re: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
References: <20201113141823.58712-1-doebel@amazon.de>
In-Reply-To: <20201113141823.58712-1-doebel@amazon.de>

--P4Fykfytw7OBIa4CBxJXkpBIUjBRQjwdE
Content-Type: multipart/mixed;
 boundary="------------3139E45BC8F6F7BC46389DB0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3139E45BC8F6F7BC46389DB0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.11.20 15:18, Bjoern Doebel wrote:
> Right now we do not have a mechanism to determine the version of the
> currently running xenstored at runtime. As xenstored runs throughout th=
e
> lifetime of a Xen host, this may lead to problems when newer user space=

> builds are staged. Then, the running xenstored will no longer match the=

> version of the installed xenstored.
>=20
> To allow users to always identify the running version of xenstored, add=

> a linker-generated unique build ID to every xenstored build. Add
> functionality to log this build ID into a file upon service startup.
>=20
> Signed-off-by: Bjoern Doebel <doebel@amazon.de>
> Reviewed-by: Martin Mazein <amazein@amazon.de>
> Reviewed-by: Paul Durrant <pdurrant@amazon.co.uk>

No support for oxenstored or xenstore-stubdom?

> ---
>   tools/hotplug/Linux/launch-xenstore.in |  2 +-
>   tools/xenstore/Makefile                |  4 +++
>   tools/xenstore/buildid_symbols.ld      | 10 +++++++
>   tools/xenstore/xenstored_core.c        |  8 ++++++
>   tools/xenstore/xenstored_core.h        |  3 ++
>   tools/xenstore/xenstored_minios.c      |  4 +++
>   tools/xenstore/xenstored_posix.c       | 52 +++++++++++++++++++++++++=
+++++++++
>   7 files changed, 82 insertions(+), 1 deletion(-)
>   create mode 100644 tools/xenstore/buildid_symbols.ld
>=20
> diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Lin=
ux/launch-xenstore.in
> index 991dec8d25..a6f2254030 100644
> --- a/tools/hotplug/Linux/launch-xenstore.in
> +++ b/tools/hotplug/Linux/launch-xenstore.in
> @@ -62,7 +62,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && =
=2E @CONFIG_DIR@/@CONFIG_LEAF
>   	}
>  =20
>   	echo -n Starting $XENSTORED...
> -	$XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
> +	$XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid --buildid-file @XEN=
_RUN_DIR@/xenstored.buildid $XENSTORED_ARGS
>  =20
>   	systemd-notify --booted 2>/dev/null || timeout_xenstore $XENSTORED |=
| exit 1
>  =20
> diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
> index 9a0f0d012d..c63350980b 100644
> --- a/tools/xenstore/Makefile
> +++ b/tools/xenstore/Makefile
> @@ -66,6 +66,10 @@ $(XENSTORED_OBJS): CFLAGS +=3D $(SYSTEMD_CFLAGS)
>   xenstored: LDFLAGS +=3D $(SYSTEMD_LIBS)
>   endif
>  =20
> +# xenstored: enforce creation of a buildID section and use a linker
> +# script to add additional symbols around that section
> +xenstored: LDFLAGS +=3D  -Wl,--build-id=3Dsha1 -Wl,-T,buildid_symbols.=
ld
> +
>   $(XENSTORED_OBJS): CFLAGS +=3D $(CFLAGS_libxengnttab)
>  =20
>   xenstored: $(XENSTORED_OBJS)
> diff --git a/tools/xenstore/buildid_symbols.ld b/tools/xenstore/buildid=
_symbols.ld
> new file mode 100644
> index 0000000000..d74024c4e9
> --- /dev/null
> +++ b/tools/xenstore/buildid_symbols.ld
> @@ -0,0 +1,10 @@
> +SECTIONS
> +{
> +       __buildid_note_section =3D . ;
> +       .note.gnu.build-id :
> +       {
> +               *(.note.gnu.build-id)
> +       }
> +       __buildid_end =3D . ;
> +}
> +INSERT AFTER .data
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored=
_core.c
> index b4be374d3f..c6f107bdd9 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -1844,6 +1844,7 @@ static void usage(void)
>  =20
>  =20
>   static struct option options[] =3D {
> +	{ "buildid-file", 1, NULL, 'B' },
>   	{ "no-domain-init", 0, NULL, 'D' },
>   	{ "entry-nb", 1, NULL, 'E' },
>   	{ "pid-file", 1, NULL, 'F' },
> @@ -1875,12 +1876,16 @@ int main(int argc, char *argv[])
>   	bool outputpid =3D false;
>   	bool no_domain_init =3D false;
>   	const char *pidfile =3D NULL;
> +	const char *buildid_file =3D NULL;
>   	int timeout;
>  =20
>  =20
>   	while ((opt =3D getopt_long(argc, argv, "DE:F:HNPS:t:T:RVW:", option=
s,

You are missing "B:" in the short options.

>   				  NULL)) !=3D -1) {
>   		switch (opt) {
> +		case 'B':
> +			buildid_file =3D optarg;
> +			break;
>   		case 'D':
>   			no_domain_init =3D true;
>   			break;
> @@ -1948,6 +1953,9 @@ int main(int argc, char *argv[])
>   	if (pidfile)
>   		write_pidfile(pidfile);
>  =20
> +	if (buildid_file)
> +		write_buildid_file(buildid_file);
> +
>   	/* Talloc leak reports go to stderr, which is closed if we fork. */
>   	if (!dofork)
>   		talloc_enable_leak_report_full();

You should update the usage printout, too.

> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored=
_core.h
> index 1df6ad94ab..712280626c 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -193,6 +193,9 @@ void xenbus_notify_running(void);
>   /* Write out the pidfile */
>   void write_pidfile(const char *pidfile);
>  =20
> +/* Write the buildid file */
> +void write_buildid_file(const char *buildidfile);
> +
>   /* Fork but do not close terminal FDs */
>   void daemonize(void);
>   /* Close stdin/stdout/stderr to complete daemonize */
> diff --git a/tools/xenstore/xenstored_minios.c b/tools/xenstore/xenstor=
ed_minios.c
> index c94493e52a..ef1151aee4 100644
> --- a/tools/xenstore/xenstored_minios.c
> +++ b/tools/xenstore/xenstored_minios.c
> @@ -24,6 +24,10 @@ void write_pidfile(const char *pidfile)
>   {
>   }
>  =20
> +void write_buildid_file(const char *buildid_file)
> +{
> +}
> +
>   void daemonize(void)
>   {
>   }
> diff --git a/tools/xenstore/xenstored_posix.c b/tools/xenstore/xenstore=
d_posix.c
> index 1f9603fea2..ec017611d6 100644
> --- a/tools/xenstore/xenstored_posix.c
> +++ b/tools/xenstore/xenstored_posix.c
> @@ -20,6 +20,7 @@
>   #include <sys/stat.h>
>   #include <unistd.h>
>   #include <fcntl.h>
> +#include <stdint.h>
>   #include <stdlib.h>
>   #include <sys/mman.h>
>  =20
> @@ -48,6 +49,57 @@ void write_pidfile(const char *pidfile)
>   	close(fd);
>   }
>  =20
> +/*
> + * We don't have a working elf.h available here, so let's define our v=
ery own
> + * data structs and accessor macros for ELF notes.
> + *
> + * https://docs.oracle.com/cd/E23824_01/html/819-0690/chapter6-18048.h=
tml:
> + * For 64=E2=80=93bit objects and 32=E2=80=93bit objects, each entry i=
s an array of 4-byte
> + * words in the format of the target processor.
> + */
> +typedef struct
> +{
> +	uint32_t namesz;
> +	uint32_t descsz;
> +	uint32_t type;
> +} elf_note_hdr;
> +
> +/* ELF Note accessors, copied from Xen's elf.h */
> +#define ELFNOTE_ALIGN(_n_) (((_n_)+3)&~3)
> +#define ELFNOTE_NAME(_n_) ((char*)(_n_) + sizeof(*(_n_)))
> +#define ELFNOTE_DESC(_n_) (ELFNOTE_NAME(_n_) + ELFNOTE_ALIGN((_n_)->na=
mesz))
> +/* GNU LD: type =3D=3D note (NT_GNU_BUILD_ID as in
> + * https://sourceware.org/ml/binutils/2007-07/msg00012.html)*/
> +#define NT_GNU_BUILD_ID 3
> +
> +
> +void write_buildid_file(const char *buildid_file)
> +{
> +	unsigned int i =3D 0;
> +	FILE *fdesc;
> +	extern elf_note_hdr __buildid_note_section;
> +	unsigned int id_length =3D __buildid_note_section.descsz;
> +	char* desc =3D ELFNOTE_DESC(&__buildid_note_section);
> +
> +	if (__buildid_note_section.type !=3D NT_GNU_BUILD_ID)
> +		barf("Expected GNU_BUILDID note, but found type '%d'",
> +		     __buildid_note_section.type);
> +
> +	fdesc =3D fopen(buildid_file, "w+");
> +	if (!fdesc)
> +		barf_perror("Error opening buildid file %s", buildid_file);
> +
> +	/* We exit silently if daemon already running. */
> +	if (lockf(fileno(fdesc), F_TLOCK, 0) =3D=3D -1)
> +		exit(0);
> +
> +	for (i =3D 0; i < id_length; ++i)
> +		fprintf(fdesc, "%02x", (unsigned char)desc[i]);
> +	fprintf(fdesc, "\n");
> +
> +	fclose(fdesc);
> +}
> +
>   /* Stevens. */
>   void daemonize(void)
>   {
>=20

In general I don't like the approach using a file for this purpose.
In case there is no generic solution possible, I'd rather have a
XS_CONTROL sub command to get the current version from Xenstore. This
will then at once cover xenstore-stubdom, too.


Juergen

--------------3139E45BC8F6F7BC46389DB0
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
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

--------------3139E45BC8F6F7BC46389DB0--

--P4Fykfytw7OBIa4CBxJXkpBIUjBRQjwdE--

--VhxVcXNzXEhYwBYwQcp6OXMYrtruzq31i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+up+AFAwAAAAAACgkQsN6d1ii/Ey+G
NQf9Fvi0Ygz7LuxV+QMNi2VfNal3vsC6W6bGqJeTHqzosAfzTRaR2QajcQnLe3/DXGZ7Ex009Tlq
iKFCX5OrpdZiN/kwz6516zppusxziMfYKdRS4wY0CyNz/gHDF7eD2tleCtVL1GlWLsWCh3I0wVjS
Xx2W70JmFKD0tOrg1fW7XaaA7BQL07vvE7EzDm0Tr3WVHUuD17noQ6VqBZ60VHGwiKYc0Llw3lgZ
5ecXJqpE2fZzus2+rAF8S9o70iZY7WZS6WQtM6iokSQW3v/4e2BxxBmzRYSsJYAY2qI8QtL+8XTN
x1ELHkCghaooJWKXiuQ5CKEp0EdG5PIWJcNhWpvPTw==
=CS8L
-----END PGP SIGNATURE-----

--VhxVcXNzXEhYwBYwQcp6OXMYrtruzq31i--

