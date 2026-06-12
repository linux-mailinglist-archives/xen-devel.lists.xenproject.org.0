Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ko3fMdORLGoCTAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 01:10:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D93967D018
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 01:10:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=trp6I5oq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1337048.1598696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0E-0001pn-Mw; Fri, 12 Jun 2026 23:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337048.1598696; Fri, 12 Jun 2026 23:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0E-0001n0-Je; Fri, 12 Jun 2026 23:09:30 +0000
Received: by outflank-mailman (input) for mailman id 1337048;
 Fri, 12 Jun 2026 23:09:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wYB0D-0001md-ON
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 23:09:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYB0B-00HIs8-OY
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 01:09:27 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c9126-5cb7-0a2a0a5109dd-0a2a4501a0f6-48
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:27 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91a7-c1f2-0a2a45010019-d155802aa805-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:27 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490b8ac62baso20243755e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:09:27 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d28sm10035907f8f.20.2026.06.12.16.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 16:09:26 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1781305767; x=1781910567; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vKX3UaL8sRVjHuxwXMOXB0orZhpfl8ztB+sFX753uHo=;
        b=trp6I5oqTZ+OhoFONDUHW0eVcGbe2k5fJs3wr0mVz3cYsuFKW8osSYtfHqMgw77gA4
         OgP+AAhbTTi3xlOU68uiMeChHcMek9YUxCXzGygamT2brSUwDQWs2P31EEyUXXFaCKHN
         fWctkbRVXtKAaHrXn3ptGiezyV4FUxx2gLD0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781305767; x=1781910567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKX3UaL8sRVjHuxwXMOXB0orZhpfl8ztB+sFX753uHo=;
        b=S2bC4Ye7Be0sIzY62YGRSz8R5KpPuQBHs/NCuDRLbi1OPTvIytRIjjsf8dvxuZJbfC
         yGoao97s1Ptt9NLTlPETP/OXH+/hfWoI6Gc5usWlqWW+hkfar9Gw/yWBL1mk/mzNKRFJ
         JRLISF/ei4+0NNox/gDiCEigVmFxFKqbFg9IbxfUHKXIhci5aHhwac9rhyzEv5ts2OOS
         WmetabIO0mjIwrDSm2FgkfXuDlHF4TIBw3bcr2lIAV/PJdLxKvf2SaWs2kZYA2aNWor9
         NFV6Wp4HsV6rtH2L0I2bIeronIMCTgH7KSTXGDuRbiTo50kHN+F2ItNX6cbxQ8OrHmz6
         dsFw==
X-Gm-Message-State: AOJu0YzvdWcogOKbixGoysmMTIzYVHmQSlfCRzdzMqDetBfJOn0MJ3Wf
	o0r9nqjtQazPmFalH7BUWIw/mWWpJEaZ9ZBsaCnso8382ZdPGnk0o4GMQBqG1qliJQ2mUER7nhU
	+GxSE
X-Gm-Gg: Acq92OEEZdnZJMaDCicrx7NITrEkvxMsEUfD2k2kH6ZXfmmIw+Oqx17M1tQAW7w7yJo
	RKZNPrdJFM29qCClfNWLM06/eevwO4tXFA0BdSmpV0kXmOdRPI2G6VQM7zlt/o1pAjWFjjWGY8e
	+EGudfd2DvW0vvKCGemcIMz9EstKVIlKcxgl8nFFFUIyJRS9FVkEuH3y7jYdpUHoszQhXSDGrSy
	gESIvVYftV020LqccS2shIIDDkX24NNMOiN5IH+3NCmw5dvOjes383vckyrHlWVCXYiw3tIlZVh
	y9C1ziqH6mQQ40f4LMieIDRp4lw30oT4UTD8+2jrlHkXAcbSq8Bio4NpRfysZ4VeFMVNjfwxATa
	6YHwjxhJsq405GZMza2Boc10JcglNwGQwSOLJrotaAAtw3qAJvZaNVDYqADbQXYtV4hev5ekDxi
	JG00x6OEaC/F0GYDYjJKdNeQiep2VNZv/bwSXCxoiynHTKfmk4EYAEg8ZPdoQBDYEbeh/KPy3eQ
	yTk
X-Received: by 2002:a05:6000:719:b0:44f:b82f:2d18 with SMTP id ffacd0b85a97d-4606cb2b59emr7056920f8f.11.1781305766863;
        Fri, 12 Jun 2026 16:09:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 0/7] CI: Refresh Alpine containers
Date: Sat, 13 Jun 2026 00:09:17 +0100
Message-Id: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781305767-B4173FF4-A064707B/0/0
X-purgate-type: clean
X-purgate-size: 2346
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[config.mk:url,gitlab.com:url,qubes-x86-64.sh:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D93967D018

Refresh and update the Alpine containers.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2598243590

This gets us off an obsolete version of Alpine, and finishes several
improvement projects (naming, and non-root containers) all at once.

Andrew Cooper (7):
  tools/xenalyze: Work around GCC-15 -Werror=nonnull false positive
  Config.mk: Update QEMU to include pip-25.2 bugfix
  CI: Introduce new qubes-hw-runner.dockerfile
  CI: Update the Alpine x86_64 container to 3.24
  CI: Update the Alpine arm64 container to 3.24
  CI: Fix inconsistent use of x86-{64,32} vs x86_{64,32}
  CI: Remove x86 microcode from arm32 jobs

 Config.mk                                     |   4 +-
 .../build/alpine/3.18-arm64v8.dockerfile      |  51 ---
 automation/build/alpine/3.18.dockerfile       |  52 ---
 .../build/alpine/3.24-arm64v8.dockerfile      |  53 +++
 .../build/alpine/3.24-x86_64.dockerfile       |  65 +++
 .../build/alpine/qubes-hw-runner.dockerfile   |  21 +
 automation/gitlab-ci/build.yaml               | 202 ++++-----
 automation/gitlab-ci/test.yaml                | 385 +++++++++---------
 automation/scripts/containerize               |   2 +-
 .../{xtf-x86-64-config => xtf-x86_64-config}  |   0
 ...86-64-efi-config => xtf-x86_64-efi-config} |   0
 .../include/{xtf-x86-64 => xtf-x86_64}        |   0
 .../{xtf-x86-64-efi => xtf-x86_64-efi}        |   0
 .../{qubes-x86-64.sh => qubes-x86_64.sh}      |   0
 tools/xentrace/xenalyze.c                     |  11 +
 15 files changed, 444 insertions(+), 402 deletions(-)
 delete mode 100644 automation/build/alpine/3.18-arm64v8.dockerfile
 delete mode 100644 automation/build/alpine/3.18.dockerfile
 create mode 100644 automation/build/alpine/3.24-arm64v8.dockerfile
 create mode 100644 automation/build/alpine/3.24-x86_64.dockerfile
 create mode 100644 automation/build/alpine/qubes-hw-runner.dockerfile
 rename automation/scripts/include/configs/{xtf-x86-64-config => xtf-x86_64-config} (100%)
 rename automation/scripts/include/configs/{xtf-x86-64-efi-config => xtf-x86_64-efi-config} (100%)
 rename automation/scripts/include/{xtf-x86-64 => xtf-x86_64} (100%)
 rename automation/scripts/include/{xtf-x86-64-efi => xtf-x86_64-efi} (100%)
 rename automation/scripts/{qubes-x86-64.sh => qubes-x86_64.sh} (100%)

-- 
2.39.5


