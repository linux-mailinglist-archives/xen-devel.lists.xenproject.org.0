Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EE8876736
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 16:21:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690335.1076243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ric0l-00089v-3g; Fri, 08 Mar 2024 15:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690335.1076243; Fri, 08 Mar 2024 15:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ric0l-00087O-0A; Fri, 08 Mar 2024 15:19:51 +0000
Received: by outflank-mailman (input) for mailman id 690335;
 Fri, 08 Mar 2024 15:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7MCP=KO=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1ric0i-000860-S4
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 15:19:48 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bca6f16-dd5f-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 16:19:46 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41316512055so7978985e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 07:19:46 -0800 (PST)
Received: from localhost.localdomain (82-64-138-184.subs.proxad.net.
 [82.64.138.184]) by smtp.googlemail.com with ESMTPSA id
 d8-20020a05600c4c0800b004130889c7b3sm5993105wmp.34.2024.03.08.07.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 07:19:44 -0800 (PST)
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
X-Inumbo-ID: 4bca6f16-dd5f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1709911185; x=1710515985; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Thr5ENyvPLoF4bqDxKM90EiB1TJ9YdmJBGx+I/Z+q8=;
        b=DO4hSaa6tIxmFn3NXc4O3l0KFQPob5PyFPN6dQikXP9OIR3Gu46sc2VvpcespgsEG2
         pm3tSB1uO8mBubyP0N1SHaUV/uz+N0JtA+fooVSqlvM56RYtPQUbOyPYah5JuiKFqlCk
         4m6mVn/x7WmQJKg/FpKa5v+KlghoNGMUA4V07lWxyOhUVdIpRvB10wbu3ddYDhFNwzir
         WTOLazUx3XXkTNhkqmvpExn4+7v5+4BZYtyPABMVhovTnb1OPVjEVmF/RFfsnzZYnK5C
         8Su6loz6Or1vCvMkKULhW8S3A8m7O8mautd8VS+luhVPRooGCyDh/MWInYmRLwDd4cwo
         06hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709911185; x=1710515985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Thr5ENyvPLoF4bqDxKM90EiB1TJ9YdmJBGx+I/Z+q8=;
        b=rvZgLW9YWz3amAfv+/gIWDNrYOECrlWMkk65VTBsJ02SHhHE+8SeTtmFToy+TNip1A
         9f8l3oxV6966JNPCvoNLDgCJH28ptr6jQV9IFNssAXFHMvc/Cb4f2CenxoFHNrXlRQg5
         NDqYxbsx3ZVhDz+Qd7I2e8weCHEG3kBIpDw4vEaFA8uhpvE6WO6ihPZmqllFQydlw1oX
         qnM51Z4KVk0oL3tiF8e30OAwj/dOMoLeoG0HG9XUGAnK0xNoZArmjB3zdl9gj3G3Wlr0
         qEPo+aiNCihvH2/yqfEj7hluA5NzHR3IRWbE+ljAy3KIeVlx1a9ehkzTh9koByGjlkgP
         zztA==
X-Gm-Message-State: AOJu0Yx1M9jpOeQ+K86DePlsE/n0iH6VgB7wgXpp5v7E0WoTUehkt5iv
	Kgvwmg24+OXjlD0UQBpfT0MX+ByOUEmbWUGefmT+jtgLHWaswNCZw/W+4w5akCJO0IRxSrNOxhJ
	I
X-Google-Smtp-Source: AGHT+IHiaAJqPMGi9k6Smk9LMBKkuT2WruGkYhVCrqw6IuwF0IcCTr53NN+mer6aP7WmLNw7uYa5Iw==
X-Received: by 2002:a05:600c:3515:b0:412:eff3:8497 with SMTP id h21-20020a05600c351500b00412eff38497mr7544830wmq.1.1709911185282;
        Fri, 08 Mar 2024 07:19:45 -0800 (PST)
From: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] docs/man: add shutdown reasons to xl (list) man page
Date: Fri,  8 Mar 2024 16:19:20 +0100
Message-Id: <0a2fcad111622431b8cd54c69adc3dedd24fb572.1709910923.git.slack@rabbit.lu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the shutdown reasons to the paragraph of "xl list" concerning the
shutdown status.
I have adapted the explanations from the source code :

 - tools/xl/xl_info.c : function "list_domains()", variable
   "shutdown_reason_letters"
 - xen/include/public/sched.h : variable "shed_shutdown_reason"

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Cyril Rébert / zithro <slack@rabbit.lu>
---
v2:
- apply changes from Anthony and Roger

Questions (unblocking):
 - why a double space between all sentences ?
 - how to get a "simple LF" ? Ie. I want to use <br>, not <p>
   (a simple <Enter> has no effect, a double renders a <p>)
---
 docs/man/xl.1.pod.in | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index bed8393473..d37227ba58 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -370,12 +370,50 @@ scheduling by the Xen hypervisor.
 The guest OS has shut down (SCHEDOP_shutdown has been called) but the
 domain is not dying yet.
 
-=item B<c - crashed>
+There are six shutdown reasons, which will be displayed after the "s" : B<-rscwS>.
+
+Note that some states will only be displayed if "on_poweroff=preserve" is set in
+the config file, see L<xl.cfg(5)>).
+
+=over 4
+
+=over 4
+
+=item B<s- : poweroff>
+
+The domain exited normally, it will get destroyed.
+
+=item B<sr : reboot>
+
+The domain will reboot.
+
+=item B<ss : suspend>
+
+The domain is suspended to disk or to RAM. If suspended to disk, the domain will
+get destroyed.
+
+=item B<sc : crash>
 
 The domain has crashed, which is always a violent ending.  Usually
 this state only occurs if the domain has been configured not to
 restart on a crash.  See L<xl.cfg(5)> for more info.
 
+=item B<sw : watchdog>
+
+Restart because watchdog time expired.
+
+=item B<sS : soft_reset>
+
+The domain asked to perform 'soft reset' for it.  The expected behavior
+is to reset internal Xen state for the domain returning it to the point
+where it was created but leaving the domain's memory contents and vCPU
+contexts intact.  This will allow the domain to start over and set up
+all Xen specific interfaces again.
+
+=back
+
+=back
+
 =item B<d - dying>
 
 The domain is in the process of dying, but hasn't completely shut down or
-- 
2.39.2


