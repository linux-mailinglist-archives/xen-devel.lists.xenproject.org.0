Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9226D9FB023
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2024 15:39:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862744.1274451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPjal-000640-Jd; Mon, 23 Dec 2024 14:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862744.1274451; Mon, 23 Dec 2024 14:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPjal-0005xD-CJ; Mon, 23 Dec 2024 14:39:31 +0000
Received: by outflank-mailman (input) for mailman id 862744;
 Mon, 23 Dec 2024 03:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TDFr=TQ=mail.com=hehongbo@srs-se1.protection.inumbo.net>)
 id 1tPYy2-00049B-1a
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2024 03:18:50 +0000
Received: from mout.gmx.com (mout.gmx.com [74.208.4.200])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9efd8e73-c0dc-11ef-99a3-01e77a169b0f;
 Mon, 23 Dec 2024 04:18:47 +0100 (CET)
Received: from localhost.localdomain ([202.81.229.170]) by smtp.mail.com
 (mrgmxus004 [74.208.5.15]) with ESMTPSA (Nemesis) id
 0MWTs4-1t1rzC0zxy-00M7r3; Mon, 23 Dec 2024 04:18:44 +0100
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
X-Inumbo-ID: 9efd8e73-c0dc-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.com;
	s=s1089575; t=1734923925; x=1735528725; i=hehongbo@mail.com;
	bh=eXjQDWaXpLEY9puH98Z0TBjr+nf7dLcr0LXLQmuMJr8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=R8DZRDeOo9jQi/pmsrCkRBfG4RqVpwPJiIDMcl8O+7R25kXpb6e1Shvg79knPV5Y
	 Ri7PCuak6G/cnOjSaE4dJdmrFoQZqb3X9ylxjaUq5AmmQqkKDaR69fmZsgmSYJtxq
	 4LNPsNsULdHy2GsJgOMt4y9B68LMZxBYPv6OE1sUPL8RW3HdgZjr2qncJIyOAjXie
	 8iZ5MwyY8+rA+ho7kUPYVAtPLOWxPm1yiCB+BG2gyf6sQ6Q1AtzxiWlaUPrxmRmRM
	 1FFPT83eitDvwR1ZihgWb47UfSOn0KuA1rDAbvAlRFHmLPl8Fg4ynlTha37S6n6ee
	 aiNDZskBWL6nlbfEvw==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
From: Hongbo <hehongbo@mail.com>
To: xen-devel@lists.xenproject.org
Cc: Hongbo <hehongbo@mail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 1/1] tools/libxl: search PATH for QEMU if `QEMU_XEN_PATH` is not absolute
Date: Mon, 23 Dec 2024 11:17:53 +0800
Message-Id: <20241223031753.13709-1-hehongbo@mail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nyqOynpEIhEP3SWr866rrGH943lej5zvmPYXO1Tw0Gfb7ScdKUL
 4cbQ/bWk9n/TG9B6zmevRjru2Ml33eD+8xhQ9orgb1WXOUwxhLS5wAbFFL8Nx6Kw7RS8i3c
 TCHejwW6RfKXlVLZvNgUeU6LNSERzFTXKyEnX6b+/HfGk0KyJLi7YaG/VZDtXDSu0iPrrL0
 lqiAAtUySwul2VkqdRzQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:37rkl4lZ3b0=;JXZdHxCSgB/RUNZkBvvi0D5OZp+
 /fuecYD0wN+mnutgQynoHIdzHXnoRSN7NRXo41w2fXxu+KURZqZ91+E68gDU2iLHaACgmMGSz
 NWca7OS8NvTZjD0C0NLf1CYX6uSHpi8QQ3KOjoIbx5HDkhd9jka9h1XrNZOBCRGnwea0l1nb1
 iRX+Y4DPqzJexEuWvktX+XqF7/JePtpG2sSBVvLrZghOQTLBHKW8WLyZyYG1o1XmabgYjsc97
 RmyiygYRr2WtiAEDjg6DpCy+IKWzBrZ7ZhOPLQcnL88CLBbK9BNAdj6RJkxf5raptRWtTkpUH
 Scd5N8jZnZ5rTlFT22E0j5HX4dWox/885iUDokWQFZxrEZXPNaeEubXXmLIOd3Ho1TcAANfLb
 5RGoHeD45I8KrFlNkfA3KJAREOEkF57vay9O8Yash7Nqfmb5wDERF6pLiuB47w1LyfehaOfhT
 teCP6pPrnJ8MuWcrTiVouWbMouog1/41NYykfYOUvhXTQ2I5Ue2pHj8qMuQCZVPOrzyB1toEQ
 n9dMfR78kuUDgmfeFnvJA9f+wfcMy6UGo5pxb2uKnXpB/xNUCbgvpQi0iD0V8pq2ddu+jUIYX
 uZPXsq/zmBB4ZKH42doJR94jmWKzIbKeLVLZF+sAHOFlNQiQQEnfIY7OH5gouM38QjPumJTrc
 AlYgc6n8gtODViBppn5nG6O2L/nmOwYAGkF3Bps+mpS6Lcw2gQ7MJ4hs0NhiR/ZuXjgFjjoN0
 y+oCe5JWrF5MXP24fJ5zvlimHUnnK3m5huFCR4+xNvuEbPf6rQ/Ru+Xa10zNUlnEDSwlFy5uO
 afrnXc3XQ6Z9z3/Ih6iTlWSET/u6tzGLQahP4p1AnXsgkLaFDHbnZIk3B+9OZWuulNH4suMIo
 m3r8ahhzGNwGd5N77iY3TVmRsE3FpXQ59CxEwWU5hnbc9yU1bvi0eJUnMLIrtTbbnVg6AqqCh
 qkLHqqhe8upEupKpUW2h8gj/aUtzr5HbgLM3ig4DDazKWruUiqUba8pZo3PSvaPV/7Pr0hlPe
 uPF5FKcuT3R0fZlwJGc9olj+GzeaAEfOhJOQb6T2+gscelNvVGONlZvbGiZKrUc7prOSEgZ9Z
 sx+p7vrywB43iXqRRHHhvVEQZPubzF

`QEMU_XEN_PATH` will be configured as `qemu-system-i386` with no clue wher=
e, if
`--with-system-qemu` is set without giving a path (as matched in the case =
`yes`
but not `*`). However, the existence of the executable is checked by `acce=
ss()`,
that will not look for anywhere in $PATH but the current directory. And si=
nce it
is possible for `qemu-system-i386` (or any other configured values) to be
executed from PATH later, we'd better find that in PATH and return the ful=
l path
for the caller to check against.

Signed-off-by: Hongbo <hehongbo@mail.com>

=2D--

This patch is from the maintenance team of the Xen Project Hypervisor at N=
ixOS.
We encountered this and thought it was an edge case, and came up with this=
 while
maintaining the package and module of the Hypervisor at NixOS.

According to `xen.git/tools/configure.ac`, `QEMU_XEN_PATH` will be configu=
red as
`qemu-system-i386` (relative) if `--with-system-qemu` is set (as `yes`) bu=
t
without an absolute path. However, it will execute `qemu-system-i386` from=
 the
`PATH` only if a file is called `qemu-system-i386` in the *current directo=
ry*.
That is because the existence of the device model executable file, in this=
 case
`qemu-system-i386`, is checked via `access()` without concatenating it wit=
h
current PATHs. And `access()` is not tailored for executables, it will not
search for the PATHs for us.

See `libxl__domain_build_info_setdefault()` at
`xen.git/tools/libs/light/libxl_create.c`. It reads `dm` from
`libxl__domain_device_model()` and then uses `access()` on it. If that fai=
ls, it
will modify the `device_model_version` to qemu-traditional. Then, in
`libxl__spawn_local_dm()` at `xen.git/tools/lib/light/libxl_dm.c`, it read=
s from
`libxl__domain_device_model()` again, and `access()` is used again to dete=
ct the
file's existence. In my investigations, if I comment out these 2 existence
checks then it will run `qemu-system-i386` from the current PATH without i=
ssues.
I guess if it's not blocked by those 2 checks, it will finally reach
`libxl__exec()`. Then, inside the `libxl__exec()` the device model executa=
ble
will be executed by `execvp()`, which can certainly call the executable fr=
om
both absolute paths and current PATHs.

Since the device model executable will be checked twice, both of which wil=
l call
`libxl__domain_device_model()` to get its location, I think the preferred
solution would be patching the `libxl__domain_device_model()` function its=
elf to
tell if we're referring to an executable in PATHs, and resolve to the full=
 path
of it for the caller to check against.

It's indeed an edge case. But why would we need this? Because in Nix (the
package manager) and NixOS, we use Nix expressions to declare dependencies=
 on
the dependents, and we ran into the issue of circular dependency - to buil=
d
QEMU with Xen support, we should give the Xen header and libraries into th=
e
building process of QEMU, that makes Xen (`pkgs.xen`) a dependency of QEMU
(`pkgs.qemu_xen`), which prevents us from using `pkgs.qemu_xen` in the bui=
lding
process of Xen, and in `--with-system-qemu=3D` argument in particular. It =
is very
different compared to those distros and package managers that follow the
Filesystem Hierarchy Standard (FHS), in which Xen can be built with
`--with-system-qemu=3D` points to a non-existent FHS location of
`qemu-system-i386`, and then use these Xen libraries from the artifacts to=
 build
QEMU afterward. So we decide to build Xen with `--with-system-qemu` but no=
t
including an executable path, taking advantage of the fact that `QEMU_XEN_=
PATH`
can be configured as a relative `qemu-system-i386` when omitted, as declar=
ed as
the `yes` case in `xen.git/tools/configure.ac`, and that results in we fin=
ding
the aforementioned "current directory" issue, and submitting this patch.

In the patch, I'm using the existence of slash (`/`) to tell if `QEMU_XEN_=
PATH`
is relative, and begin to search in PATH if it is. I'm sort of iffy on thi=
s,
would it make more sense if we do this on inputs starting with a slash ins=
tead?
And should we notify the user if it's not found anywhere in the PATH thus
proceeding with the value configured in `QEMU_XEN_PATH` as-is?

Let me know if it's appropriate and if further changes are needed.

Best regards,
Hongbo

=2D--
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
=2D--
 tools/libs/light/libxl_dm.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 1f2f5bd97a..db05f20a5b 100644
=2D-- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -332,7 +332,39 @@ const char *libxl__domain_device_model(libxl__gc *gc,
             dm =3D libxl__abs_path(gc, "qemu-dm", libxl__private_bindir_p=
ath());
             break;
         case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
-            dm =3D qemu_xen_path(gc);
+            const char *configured_dm =3D qemu_xen_path(gc);
+            if (strchr(configured_dm, '/'))
+                dm =3D libxl__strdup(gc, configured_dm);
+            else
+            {
+                const char *path_env =3D getenv("PATH");
+                if (!path_env)
+                    dm =3D libxl__strdup(gc, configured_dm);
+                else
+                {
+                    char *path_dup =3D libxl__strdup(gc, path_env);
+                    char *saveptr;
+
+                    char *path =3D strtok_r(path_dup, ":", &saveptr);
+                    char fullpath[PATH_MAX];
+                    bool dm_found =3D false;
+                    while (path)
+                    {
+                        snprintf(fullpath, sizeof(fullpath), "%s/%s", pat=
h,
+                                 configured_dm);
+                        if (access(fullpath, X_OK) =3D=3D 0)
+                        {
+                            dm =3D libxl__strdup(gc, fullpath);
+                            dm_found =3D true;
+                            break;
+                        }
+                        path =3D strtok_r(NULL, ":", &saveptr);
+                    }
+
+                    if (!dm_found)
+                        dm =3D libxl__strdup(gc, configured_dm);
+                }
+            }
             break;
         default:
             LOG(ERROR, "invalid device model version %d",
=2D-
2.39.5 (Apple Git-154)


