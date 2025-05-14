Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEC8AB63DB
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983859.1370044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6It-0004aH-E1; Wed, 14 May 2025 07:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983859.1370044; Wed, 14 May 2025 07:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6It-0004Xj-Au; Wed, 14 May 2025 07:13:23 +0000
Received: by outflank-mailman (input) for mailman id 983859;
 Wed, 14 May 2025 07:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rkt7=X6=boeing.com=sookyung.ahn@srs-se1.protection.inumbo.net>)
 id 1uF6Ir-0004JZ-I2
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:13:21 +0000
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net
 [130.76.144.163]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6bf49c3-3092-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 09:13:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 54E7DDEr014098; Wed, 14 May 2025 03:13:13 -0400
Received: from phx-av-01.mbs.boeing.net (phx-av-01.mbs.boeing.net
 [137.136.102.153])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 54E7D3lg014027
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 03:13:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id
 54E7D2dU008202; Wed, 14 May 2025 00:13:02 -0700
Received: from localhost.localdomain ([144.112.81.43])
 by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id
 54E7CtL1007958; Wed, 14 May 2025 00:12:56 -0700
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
X-Inumbo-ID: e6bf49c3-3092-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1747206793;
	bh=tGgowmEjCeMgBFJGQbk9Nmldf+ksVlLvr0nD6YK9ygA=;
	h=From:To:Cc:Subject:Date:From;
	b=JEqTKCZtlm4umrdST4vnd8l3NCgMdwI32rTnQx2e6ADKpun/SugxPKjP6Y0z2tx0U
	 2CUa/xEbbYrSeUZOGae0VlecRsi1NZXcexMSU7bpiB7EMgg9TelcPM6hixExId4IrS
	 0OijPONSxUfq2FTSSw1PPbFsdw5JK26gDMlNg4cQ6mw5szQb0uVPPAoLzvo3byVr3Q
	 unk7e/ebbX8LWh/gjgFOlrVfNOmXNum0p4doIluqU/OJEW5paUejQ8H7nttY1PHZNn
	 PX5G3dP5/NaZlqByEEOawy7qwOMuDMVWW80wLcStfkBQPEHrLNHCx7x8lpMp3uLIWD
	 0BXUMkCx3MrfQ==
From: Sookyung Ahn <sookyung.ahn@boeing.com>
To: xen-devel@lists.xenproject.org
Cc: matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
        Anderson.Choi@boeing.com, brian.j.wood2@boeing.com,
        haesun.kim@boeing.com, Sookyung Ahn <sookyung.ahn@boeing.com>
Subject: [RFC PATCH 0/2] Propose an minimal xen-tools
Date: Wed, 14 May 2025 07:12:48 +0000
Message-Id: <cover.1747205627.git.sookyung.ahn@boeing.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

I am writing to propose an enhancement to the `xen-tools` for users who require only a minimal subset of its functionality, particularly in safety-critical domains like aerospace.

I believe that the addition of a new build-time option, `ENABLE_MINIMAL_XEN_TOOLS`, will significantly benefit users by allowing them to build only the essential components needed for their specific applications. 
This approach not only streamlines the toolset but also reduces the potential for unnecessary complexity in safety-critical environments.
This proposal is based on `dom0less` environment.

The proposed implementation includes:
- Introducing the `ENABLE_MINIMAL_XEN_TOOLS` configuration flag.
- Modifying the build process to selectively include only the necessary components based on the configuration.

This implementation can be effectively applied to the following use cases. 
- Minimal APIs for `dom0less` operation. This involves taking existing Xen functions and shrinking them to minimal needed parts. For example, we can use static device tree instead of XenStore. 
- By retaining `libxencall` and minimum part of `libxencrtl`, the Hypercall interface can be utilized, enabling support for the Xen ARINC653 Multiple Module Schedules service. 
- Addition of ARINC653 Part1&2 APIs and services (hosted on the domain OS.)

I would appreciate any feedback or suggestions you may have regarding this enhancement. 
Additionally, I would like to emphasize the importance of community input in refining this proposal to ensure it meets the needs of all users.

Sookyung Ahn (2):
  changes for minimal-xen-tools
  add document minimal_xen_tools.pandoc

 config/Tools.mk.in                    |   1 +
 docs/designs/minimal_xen_tools.pandoc | 147 ++++++++++++++++++++++++++
 tools/Makefile                        |  19 ++++
 tools/Rules.mk                        |   9 +-
 tools/configure.ac                    |  47 +++-----
 tools/flask/Makefile                  |   4 +
 tools/hotplug/Linux/Makefile          |   6 ++
 tools/hotplug/Linux/systemd/Makefile  |   6 ++
 tools/libs/Makefile                   |   9 ++
 tools/libs/ctrl/Makefile.common       |  92 +++++++++-------
 tools/libs/ctrl/xc_private.c          |   6 ++
 tools/libs/ctrl/xc_private.h          |   7 +-
 tools/libs/uselibs.mk                 |  76 +++++++------
 13 files changed, 325 insertions(+), 104 deletions(-)
 create mode 100644 docs/designs/minimal_xen_tools.pandoc

-- 
2.34.1


