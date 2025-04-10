Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13490A84208
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 13:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945326.1343532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qNC-0003jU-DS; Thu, 10 Apr 2025 11:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945326.1343532; Thu, 10 Apr 2025 11:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qNC-0003ha-AS; Thu, 10 Apr 2025 11:47:10 +0000
Received: by outflank-mailman (input) for mailman id 945326;
 Thu, 10 Apr 2025 11:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2qNB-0003hP-6y
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 11:47:09 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87210490-1601-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 13:47:06 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso5814435e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 04:47:06 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893776dfsm4651418f8f.33.2025.04.10.04.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 04:47:05 -0700 (PDT)
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
X-Inumbo-ID: 87210490-1601-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744285626; x=1744890426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CtNKRTRSK/rh7mfkGTUf4JbHupBQBE1a+8umq7jRL4=;
        b=Flrv8nXNG7Fw+3lHHiYCELOWTcZu6eudDrYTytTFa5ZGsSCVSTl5SC53/692aG7aQX
         UPJVZHQLuuP62q81EG3nQQkLRURPviy5sr+dRfXB27U4zRDpI06vU+9zX39pA0I4NUVe
         Qnth5+kTzvTw0beeblKiLJ/lNM03LoqQDmGjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744285626; x=1744890426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CtNKRTRSK/rh7mfkGTUf4JbHupBQBE1a+8umq7jRL4=;
        b=bAraLzUBrH7f0lS/Vr0Iqxr/rCXHAc1RNqObGovdtpu/CNaaW4c2Y28edVSmzxa5lP
         szPtlHX9QIiVWRmfd4lGZM0dKqGY5bRMnrY3U/aZzOcQqexIcH3lxgWwNDWXUtFkaSE/
         2Py2IPNpk0dpZhatYLNl0vmBXWQstez6c1+5RaNEvlZqhesPP6z0ZmyOHLRyl92Eo3Qk
         kcERyBGP3qb7Js+LnQKUo/Oql17SF7+ca7PuEOTo12leUCHD8agHH3ZcevaBl3F6fo87
         hUm5bd4v2MUoDrm1v1dUgSF+fZTUv4Mmv4VjkTE2yoFnHKmA1ajSeuzYHg8fjbJT3Wax
         baqA==
X-Gm-Message-State: AOJu0Yzkpx3tFTKoVOgBZjWcjxJtUX7lbThIH53N5aCn7gOAmMc04Gtm
	CE4JfdsO1IA3YB2jpU/geHALixIIPD2kxBoxXTVGjNbYvF5HJAnyPuBcaOAQnv4qMNFUuWy2NS3
	xPdM=
X-Gm-Gg: ASbGncsoea5aqhOIoMPGS2BFz0LN7wZ6b8hySludgYmaudKnx3O3f3uIEy9YpTyvVv4
	5jeppIcplmYImJMtiN7+pA7BmAqEHVjodTr+0UQM1SFKbLsZP2W7+Fns74ax4h+b9BMP2tSDVMf
	L9kK9AR22UEo4qSdTBZG5SVulWGd90WKPIvEJLur/mP46x1L+ZyJnM/HUEG3XllElNazU+J5E85
	Ai8mQlt5Ryhw/z+QcoTQmFUPVEDsK9HB+YjfJKmYAE6UNe11phEVg+WorpVxe/7DTtghchTuT96
	3YRrLHQvTArk5uhCMrIAzhTMwEvsxzqyTXXDaVqvLprzi3Bd5u/X+oV9LzLadlM/dPskgQagVY+
	lGzp64sirsg/H7w==
X-Google-Smtp-Source: AGHT+IH8tzbinte0Su6EBQfrqSQaMnvh3Ng3xFtV5WfRAKJiiiZIXrrGSXXOE+q6rSqTU1beeuMEqA==
X-Received: by 2002:a05:6000:1ac5:b0:391:4095:49b7 with SMTP id ffacd0b85a97d-39d8f474e61mr1928536f8f.25.1744285626045;
        Thu, 10 Apr 2025 04:47:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 1/6] Port containerise
Date: Thu, 10 Apr 2025 12:46:23 +0100
Message-Id: <20250410114628.2060072-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
References: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While it pains me to keep the wrong spelling, do so for consistency.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>

v2:
 * Switch back to alpine:x86_64-rootfs as the rename isn't in the series yet.
---
 containerize | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100755 containerize

diff --git a/containerize b/containerize
new file mode 100755
index 000000000000..fd488cc57596
--- /dev/null
+++ b/containerize
@@ -0,0 +1,94 @@
+#!/bin/bash
+
+#
+# DOCKER_CMD should be either `docker` or `podman`.
+#
+# if using (rootless) podman, remember to set /etc/subuid
+# and /etc/subgid.
+#
+docker_cmd=${DOCKER_CMD:-"docker"}
+[ "$DOCKER_CMD" = "podman" ] && userns_podman="--userns=keep-id" selinux=",z"
+
+einfo() {
+    echo "$*" >&2
+}
+
+die() {
+    echo "$*" >&2
+    exit 1
+}
+
+#
+# The caller is expected to override the CONTAINER environment
+# variable with the container they wish to launch.
+#
+BASE="registry.gitlab.com/xen-project/hardware/test-artifacts"
+case "_${CONTAINER}" in
+    _alpine-x86_64-rootfs) CONTAINER="${BASE}/alpine:x86_64-rootfs" ;;
+    _alpine-x86_64-build|_) CONTAINER="${BASE}/alpine:x86_64-build" ;;
+esac
+
+# Use this variable to control whether root should be used
+case "_${CONTAINER_UID0}" in
+    _1)   userarg="-u 0" ;;
+    _0|_) userarg="-u $(id -u) $userns_podman" ;;
+esac
+
+# Save the commands for future use
+cmd=("$@")
+
+# If no command was specified, just drop us into a shell if we're interactive
+[ $# -eq 0 ] && tty -s && cmd=("/bin/bash")
+
+# Are we in an interactive terminal?
+tty -s && termint=t
+
+#
+# Fetch the latest version of the container in hub.docker.com,
+# unless it's a newly created local copy.
+#
+if [[ "_${CONTAINER_NO_PULL}" != "_1" ]]; then
+    einfo "*** Ensuring ${CONTAINER} is up to date"
+    ${docker_cmd} pull ${CONTAINER} > /dev/null ||     \
+        die "Failed to update container"
+fi
+
+if hash greadlink > /dev/null 2>&1; then
+    READLINK=greadlink
+elif [[ $(uname -s) == "Darwin" ]]; then
+    echo "Unable to forward SSH agent without coreutils installed"
+    unset SSH_AUTH_SOCK
+else
+    READLINK=readlink
+fi
+
+# Ensure we've got what we need for SSH_AUTH_SOCK
+if [[ -n ${SSH_AUTH_SOCK} ]]; then
+    fullpath_sock=$(${READLINK} -f ${SSH_AUTH_SOCK} 2> /dev/null)
+    if [ $? -ne 0 ]; then
+        echo "Invalid SSH_AUTH_SOCK: ${SSH_AUTH_SOCK}"
+        unset SSH_AUTH_SOCK
+    else
+        SSH_AUTH_DIR=$(dirname ${fullpath_sock})
+        SSH_AUTH_NAME=$(basename ${fullpath_sock})
+    fi
+fi
+
+# Figure out the base of what we want as our sources
+# by using the top of the git repo
+if [[ -z ${CONTAINER_PATH} ]]; then
+    CONTAINER_PATH=$(git rev-parse --show-toplevel)
+fi
+
+# Kick off Docker
+einfo "*** Launching container ..."
+exec ${docker_cmd} run \
+    ${userarg} \
+    ${SSH_AUTH_SOCK:+-e SSH_AUTH_SOCK="/tmp/ssh-agent/${SSH_AUTH_NAME}"} \
+    -v "${CONTAINER_PATH}":/build:rw${selinux} \
+    -v "${HOME}/.ssh":/root/.ssh:ro \
+    ${SSH_AUTH_DIR:+-v "${SSH_AUTH_DIR}":/tmp/ssh-agent${selinux}} \
+    ${CONTAINER_ARGS} \
+    -${termint}i --rm -- \
+    ${CONTAINER} \
+    "${cmd[@]}"
-- 
2.39.5


