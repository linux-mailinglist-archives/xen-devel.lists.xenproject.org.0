Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4561DAE4D
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 11:05:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbKeM-0002wd-RU; Wed, 20 May 2020 09:04:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cwnj=7C=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1jbKeL-0002wY-8e
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 09:04:29 +0000
X-Inumbo-ID: e8b6bb14-9a78-11ea-ae69-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8b6bb14-9a78-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 09:04:28 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id i16so2229693edv.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 02:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=UDVSD7u//uj0am04PC5Ekp2qfxEdEYl9GujtwfxuudE=;
 b=lnfqMkyxhn6kHVOBwqZTwvZGZHJh2Hj0ZMlNgHZrxgrTlh+N1S90kA8YcvCLOrHLBY
 nYF3gw9vKSTWAzeMInbpQy2fHTNBQr+BV45fQnG3FavTY8sekyBMuDXMnSpGYgjXer4x
 gxnV70wHWE3tV/PT3JklhmKqk0JujQLlgezzXN5z9KuKEfTvgkWIyPDiy8SQL1KICOzs
 znPagc+w0/jbF4y6DB88MZA8ytCqFVCCvFowLfkCqCxs9d2xAsDaVAZtMP3NLNnn6ndz
 +kDXjQlQFN0oS8hnduR9R9qZ4tTkY5va/OcGjueqxtwiHTy6TKZPq5jnvIzUZA7jGlB3
 zLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UDVSD7u//uj0am04PC5Ekp2qfxEdEYl9GujtwfxuudE=;
 b=HJ5RGyH3zKSwyS8iPfEz5xE5MjjolK58n0MSKkQUEIsxdL0yzF8LvMA6YEkXXQ0p7v
 YsiJIdIPgQ8W6K512hDMXloliv/REyB3VaSEU7GTQGOLvbkzz2EpK1gfDPI9wuBZAqnR
 kj1oRfbnEzPuBvwLW53fD6v/MFGYEpJ/cFsV0JbdejLjbxvoIhCtUfKo39MVo2ZO/bi3
 dvDgTVgt3eMrvNLA2egmvlQTVbwNjoJ0icjzOMhrnMZsZANwrLRzJAoW9We93+H5pk80
 solWJH5QeXEDBi6MES7XKilBVd5hja0gwUNeCUY1PF+RMlIVF1FyWmnd3vjq4nu4WdTe
 XofA==
X-Gm-Message-State: AOAM531c7XWRMAWxkVrBZyGYaOxD5IJ518DW938R/Y01SXSn1/53mOon
 SCAE4gljDqgdw3kuP4LqK4/Db3lz
X-Google-Smtp-Source: ABdhPJy8osHuSsngOvt/HStV+1z+S7bmu8+AQZPtnLON0DcdHsJ6cDy9cYv8wldo0f8hwW3gGMRcAQ==
X-Received: by 2002:a50:9317:: with SMTP id m23mr2577446eda.65.1589965467041; 
 Wed, 20 May 2020 02:04:27 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id p5sm1324811edi.82.2020.05.20.02.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 02:04:26 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, jgross@suse.com, ian.jackson@eu.citrix.com,
 wei.liu2@citrix.com, konrad.wilk@oracle.com
Subject: [PATCH 0/2] displif: Protocol version 2
Date: Wed, 20 May 2020 12:04:23 +0300
Message-Id: <20200520090425.28558-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Hello all,

this series extends the existing displif protocol with new
request and adds additional parameter to the exiting one.
It also provides support for the new parameter in libgnttab
via ioctl. The relevant changes in the backend can be found at [1]
and the frontend at [2].

List of changes:

1. Change protocol version from string to integer

Version string, which is in fact an integer, is hard to handle in the
code that supports different protocol versions. To simplify that
make the version an integer.

2. Pass buffer offset with XENDISPL_OP_DBUF_CREATE

There are cases when display data buffer is created with non-zero
offset to the data start. Handle such cases and provide that offset
while creating a display buffer. Add the corresponding filed to the
protocol and handle it in libgnttab.
This change is required for bringing virtual display on iMX8
platform which uses offset of 64 bytes for the buffers allocated
on GPU side and then imported into PV DRM frontend. Otherwise the
final picture looks shifted.

3. Add XENDISPL_OP_GET_EDID command

Add an optional request for reading Extended Display Identification
Data (EDID) structure which allows better configuration of the
display connectors over the configuration set in XenStore.
With this change connectors may have multiple resolutions defined
with respect to detailed timing definitions and additional properties
normally provided by displays.

If this request is not supported by the backend then visible area
is defined by the relevant XenStore's "resolution" property.

If backend provides extended display identification data (EDID) with
XENDISPL_OP_GET_EDID request then EDID values must take precedence
over the resolutions defined in XenStore.

4. Bump protocol version to 2.

Open questions and notes on the changes:

1. gnttab minor version change from 2 to 3
As per my understanding it is required to bump the version when
I add the new functionality, but I would like to hear from the
maintainers on that.

2. gnttab and version 2 of the ioctls
Because we add an additional parameter (data offset) and the structures
used to pass ioctl arguments cannot be extended (there are no enough
reserved fields), so there are to ways to solve that:
- break the existing API and add data_ofs field into the existing
structures
- create a copy of the ioctl (v2) with the additional parameter.

It seems to be easier to go the first way, but this breaks things,
so I decided to introduce v2 of the same ioctl which behaves gracefully
with respect to the existing users, but adds some amount of
copy-paste code (I was trying to minimize copy-paste so it is easier
to maintain, but the result looked ugly to me because of lots of
"if (protocol v1)" constructs.

Please note that struct ioctl_gntdev_dmabuf_imp_to_refs, e.g.
version 1 of the ioctl, has uint32_t reserved field which can be
used for the data offset, but its counterpart (ioctl_gntdev_dmabuf_exp_from_refs)
doesn't have any, so it seems not to be aligned to only introduce
version 2 of the ioctl for the later.

The other question is if to keep that reserved field in
ioctl_gntdev_dmabuf_imp_to_refs_v2 structure or drop it.

3. displif protocol version string to int conversion
The existing protocol defines its version as a string "1"
which is ok, but makes it not so easy to be directly used by
C/C++ preprocessor which would like to see an integer for constructs
like "#if XENDISPL_PROTOCOL_VERSION > 2"

At the same time this change may break the existing users of the protocol
which still expect version as a string. I tried something like

#define STR_HELPER(x) #x
#define STR(x) STR_HELPER(x)

#define XENDISPL_PROTOCOL_VERSION_INT 1
#define XENDISPL_PROTOCOL_VERSION STR(XENDISPL_PROTOCOL_VERSION_INT)

but not sure if this is the right and good way to solve the issue,
so in this series I have deliberately changed the protocol version to
int.
Other possible way could be that every user of the header has its local
copy (this is what we now use in the display backend). This way the
local copy can be changed in a way suitable for the concrete user.
This cannot be done (?) for the Linux Kernel though.

Thank you,
Oleksandr

[1] https://github.com/xen-troops/displ_be
[2] https://github.com/xen-troops/linux/pull/87

Oleksandr Andrushchenko (2):
  xen/displif: Protocol version 2
  libgnttab: Add support for Linux dma-buf offset

 tools/include/xen-sys/Linux/gntdev.h  | 53 +++++++++++++++++
 tools/libs/gnttab/Makefile            |  2 +-
 tools/libs/gnttab/freebsd.c           | 15 +++++
 tools/libs/gnttab/gnttab_core.c       | 17 ++++++
 tools/libs/gnttab/include/xengnttab.h | 13 ++++
 tools/libs/gnttab/libxengnttab.map    |  6 ++
 tools/libs/gnttab/linux.c             | 86 +++++++++++++++++++++++++++
 tools/libs/gnttab/minios.c            | 15 +++++
 tools/libs/gnttab/private.h           |  9 +++
 xen/include/public/io/displif.h       | 83 +++++++++++++++++++++++++-
 10 files changed, 295 insertions(+), 4 deletions(-)

-- 
2.17.1


