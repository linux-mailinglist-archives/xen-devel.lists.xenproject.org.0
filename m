Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E4C5F4729
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 18:08:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415696.660337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkTJ-0006YA-TF; Tue, 04 Oct 2022 16:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415696.660337; Tue, 04 Oct 2022 16:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkTJ-0006VF-N7; Tue, 04 Oct 2022 16:08:41 +0000
Received: by outflank-mailman (input) for mailman id 415696;
 Tue, 04 Oct 2022 16:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YyPd=2F=citrix.com=prvs=269269faf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ofkTI-0006Sk-5J
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 16:08:40 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdb6241d-43fe-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 18:08:38 +0200 (CEST)
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
X-Inumbo-ID: cdb6241d-43fe-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664899718;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hrn5m8BVzCYhqL7ggmk787e3RGFAR22H9oUe1OsxCeU=;
  b=e2WWaBpQ2seCo45SpT7z+aQzB7YrugPMRtweLCBOk5+Yix2CPCt/4WVp
   nCsowqYQ6bW9Ale4X459drXvSggV8CRVhv5xsD2pKQlVJSb9EOklwcKQb
   cefMCnS3lU7pP4ZROcN4zZBgpcW9gxty6GtAoGXQj5zgaq0BiEb/o0nBh
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 84478270
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3PMpLKpekRzX/TJEjGBpCM5qM9heBmLPZRIvgKrLsJaIsI4StFCzt
 garIBnVbKqJYmqhfYh0OdyyoE5Q65+Ey99gSgZtrC1kFnwU9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgT4AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 dcEdRQXSBO6o82V66K+F9hJpucJFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0FwhrH9
 jiZpwwVBDkTD+G/+AjGq0nrj8HFuTvlfsENHZGno6sCbFq7mTVIVUx+uUGAidm0jFSvHe1WL
 UM88zAr66M18SSDS9DnWhSirX2svxgCWsFRGek39AGMzKXP5w+TQGMDS1ZpZNEjtec3QyIrz
 V6Dm971BT1pv6aRQHjb/bCRxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdMRPaz
 i2OrSM+r64OlsNN3KK+lXjYhxq8q56PSRQ6jjg7RUr8sFk/PtT8IdX1tx6Ltp6sMbp1UHG5l
 2RZv9K479kqIrKmhCnQccAtP5uQsqPt3CLnvXZjGJwo9jKI8nGlfJxN7DwWGHqFIvroaheyP
 haN5Fo5CIt7eSLzMPQpO97Z59ECl/CIKDjzahzDgjOiiLBVfRTPwixhbFX4M4vFwBl1yvFX1
 Xt2nK+R4Zcm5UZPlmPeqwQ1i+VDKsUCKYT7GvjGI+yPi+b2WZJsYe5t3KGyRu449riYhw7e7
 sxSMcCHoz0GDrOiMnONqt5Dcw5VRZTeOXwRg5M/SwJ+ClA+RDFJ5wH5mNvNhLCJb4wKz7yVr
 xlRq2dTyUblhG2vFDhmnktLMeq3NauTWFphYkTAy370hCV4CWtuhY9DH6YKkU4PrbcylaEuH
 6RaEyhCa9wWIgn6F/0mRcGVhORfmN6D2Wpi4wLNjOADQqNd
IronPort-HdrOrdr: A9a23:Q/iyV6jWy7bGyOqhjXJnfMWbrXBQXtYji2hC6mlwRA09TySZ//
 rBoB19726StN9xYgBFpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkNK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.95,158,1661832000"; 
   d="scan'208";a="84478270"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
Subject: [PATCH for-4.17 0/2] x86: Activate DOITM
Date: Tue, 4 Oct 2022 17:08:08 +0100
Message-ID: <20221004160810.25364-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Slightly RFC.  I'm a little uncertain about putting doitm into cpuid= but it's
the least bad option I can think of.

Andrew Cooper (2):
  x86/cpuid: Infrastructure to support pseudo feature identifiers
  x86: Activate Data Operand Invariant Timing Mode by default

 xen/arch/x86/cpu/common.c            | 29 +++++++++++++++++++++++++++++
 xen/arch/x86/cpuid.c                 | 22 ++++++++++++++++++----
 xen/arch/x86/include/asm/processor.h |  2 ++
 xen/tools/gen-cpuid.py               | 15 +++++++++++++++
 4 files changed, 64 insertions(+), 4 deletions(-)

-- 
2.11.0


