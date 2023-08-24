Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90A7787417
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 17:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590160.922309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCE8-0005Yl-Bd; Thu, 24 Aug 2023 15:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590160.922309; Thu, 24 Aug 2023 15:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCE8-0005W6-8U; Thu, 24 Aug 2023 15:26:28 +0000
Received: by outflank-mailman (input) for mailman id 590160;
 Thu, 24 Aug 2023 15:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hMLV=EJ=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qZCE6-0003YG-Fs
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 15:26:26 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 954262fd-4292-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 17:26:24 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bf5c314a57so171655ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 08:26:24 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 x4-20020a1709029a4400b001a98f844e60sm12941605plv.263.2023.08.24.08.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 08:26:22 -0700 (PDT)
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
X-Inumbo-ID: 954262fd-4292-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692890783; x=1693495583;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzi+JYr5WPzOXWq+l4Lu0TIE7ypUPkygPuyA0iL/h6I=;
        b=Ie3CBszxWpKRGd0EvdO7J55YkL19yOhmnZgyOfSju8wGTPIOvhn13wGXJWOm4fGxZj
         3bf212pFoyp9el6Irtb/hIkOPmxDKdTX/vmK/yNKikpIqqODDgIaL6I6m6WvqwNMc/hY
         VYyml2/wulhB/U7j05iAqoxRYeSb5wrRUQRGvulmFHtZXaTZgcSkLrtzn5d7thTnX2qG
         Agl4jhxUtnMwyaeOSrn9bPa3akWPd2zORqei6B1F7xrbeFIpHMGQ4xddLfsewgXz3OnM
         /6AjAw9zdweVgPw8pybbVLM+LbdbY3dECOphtYfF6KT+WwqEVMy6KiDhZcVadfsims4y
         Lz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692890783; x=1693495583;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzi+JYr5WPzOXWq+l4Lu0TIE7ypUPkygPuyA0iL/h6I=;
        b=SJDDBjMbRIRB2aNYabG5fPDA8ieAACmTfX53vS/HpoNb5RBCj4ttCZVfd/MWwJbdsN
         r5eXcESzvEoqVWc0zrW+7/v2OsorxdUYe2CpcwiKMkPt7Ib5xP6Tf447OMh+B2scpUnm
         FfP2CwvRDZIsJUAmURfHspFyfrBs2yYw5/2JP2oyviyo86gJJH15QoKmvwichLi0xiJ4
         IZDNfWq2brRsZmrgWQgo6W2RnR2Pr4N7EDSw7lzaqOocErdSBsMZeGyt63PxAY5tGPxU
         obkQ4qQYkBziN5VmBuQTAmN207H2C1C8cu/TtB+ocffncWHmrY+f8hC1YpWsSmPkQAtX
         UVSA==
X-Gm-Message-State: AOJu0YxwKdqIdP7HJX5iKANYRxOkWP+B2dFYQtDV30iY5UyXqHwUIzZp
	ZzsjFXiycYgE+V5Q9ufDYA8=
X-Google-Smtp-Source: AGHT+IFEcRokbXF2jszjQYgc9by9trrhuGvVaZtxbz3rjCL8bEw2D7mw/E2y54sMWpk4vJibd/VwRw==
X-Received: by 2002:a17:902:c94e:b0:1c0:b17a:7554 with SMTP id i14-20020a170902c94e00b001c0b17a7554mr4582279pla.64.1692890783265;
        Thu, 24 Aug 2023 08:26:23 -0700 (PDT)
Message-ID: <91fe0227-e2c7-f103-44e9-e70ea5ae007d@gmail.com>
Date: Fri, 25 Aug 2023 00:26:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH v2 6/8] x86/hvm: Add comments about #DB exception behavior to
 {svm,vmx}_inject_event()
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Language: en-US
In-Reply-To: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Extracted comments only, and then s/from emulation/from monitor/;
originally "x86/hvm: RFC - PROBABLY BROKEN - Defer all debugging/monitor
actions to {svm,vmx}_inject_event()"

Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

v1 -> v2: new patch
---
 xen/arch/x86/hvm/svm/svm.c | 9 +++++++++
 xen/arch/x86/hvm/vmx/vmx.c | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 6f3e6b3512..7bb572e72b 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1328,6 +1328,15 @@ static void cf_check svm_inject_event(const struct x86_event *event)
     switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
     case X86_EXC_DB:
+        /*
+         * On AMD hardware, a #DB exception:
+         *  1) Merges new status bits into %dr6
+         *  2) Clears %dr7.gd and MSR_DEBUGCTL.{LBR,BTF}
+         *
+         * Item 1 is done by hardware before a #DB intercepted vmexit, but we
+         * may end up here from monitor so have to repeat it ourselves.
+         * Item 2 is done by hardware when injecting a #DB exception.
+         */
         __restore_debug_registers(vmcb, curr);
         vmcb_set_dr6(vmcb, vmcb_get_dr6(vmcb) | _event.pending_dbg);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 4e20fca43e..b35278992a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2022,6 +2022,13 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
     switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
     case X86_EXC_DB:
+        /*
+         * On Intel hardware, a #DB exception:
+         *  1) Merges new status bits into %dr6
+         *  2) Clears %dr7.gd and MSR_DEBUGCTL.LBR
+         *
+         * All actions are left up to the hypervisor to perform.
+         */
         __restore_debug_registers(curr);
         write_debugreg(6, read_debugreg(6) | event->pending_dbg);
 
-- 
2.41.0


