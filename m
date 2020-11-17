Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 675912B67C2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 15:48:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29056.58268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf2H2-0002NV-Uk; Tue, 17 Nov 2020 14:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29056.58268; Tue, 17 Nov 2020 14:48:00 +0000
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
	id 1kf2H2-0002N9-RJ; Tue, 17 Nov 2020 14:48:00 +0000
Received: by outflank-mailman (input) for mailman id 29056;
 Tue, 17 Nov 2020 14:47:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UWEc=EX=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kf2H1-0002N1-7J
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:47:59 +0000
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6908074-aa12-48d3-a597-c8204e8fff0c;
 Tue, 17 Nov 2020 14:47:58 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 142so10909824ljj.10
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 06:47:58 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s26sm3084683lji.31.2020.11.17.06.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 06:47:56 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UWEc=EX=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kf2H1-0002N1-7J
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:47:59 +0000
X-Inumbo-ID: d6908074-aa12-48d3-a597-c8204e8fff0c
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d6908074-aa12-48d3-a597-c8204e8fff0c;
	Tue, 17 Nov 2020 14:47:58 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 142so10909824ljj.10
        for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 06:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XpSxvfpdzP1lQuCn9JFmOxA384xIAGn8YKeAo1cdXno=;
        b=ZiMJ64FS5r16N5/za6VPjb/b6oz1QnE0t7IbuWlLP7gjj7/wT+Hm9TtwOjfkgfpnxw
         QWTObHI8SqzfFi3IB44qQpP1Ddsx6toBk5PIKc4XFkFgQ8E3DxvfHksSvHFaPnLhAU/a
         DGd3ShX7Xj1yTcuB25rwIuLW6cWFHwZZwEgxnOAUmKK3PrJ4FBYzUVCSVh5+qBDV1+gy
         qmb34tsP2hTbY3c8JoRamfL4NdVFErdiLtBEfotlRWZdGspz+VPyJEPfu29sqNpOMOOp
         uG/g8hm31w4w5yWm8J6ClLtlbNbhz272O4TB4nAmp3dKFprk1x3lgMJedaG8gN/IVS7w
         dEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XpSxvfpdzP1lQuCn9JFmOxA384xIAGn8YKeAo1cdXno=;
        b=JMTR5oM4nM8xFQ/L9mtQviSrZFimfSKZ7HiAhd2whLBAjUBV7tyo2KXT1vpDrA98p+
         OIs0cLEOU8ZExll3zB8am0fHtXw6CjXQwCkNxo9X4Cg9bNzkA77RovYiYteVzyfPmMEy
         XSf4zr/unJ6HDiPqQJsubHcpSlU/89ByoRcYFX+8uHG5y41sukEMhNfO1l9NagNINj4d
         ISS9O8ktJRhpwhVJrvkcZIyjolmMB+otS1nZXjpc+zb6HQRXb2vPRzJdBQDDsBP3S+XQ
         Td3GakJpdxUdOmr/hpscAQflS/4eDsV6dUO6Ot46Z7IdKzGrR6Zu6MxMcCqmJzb0BMHN
         FA6Q==
X-Gm-Message-State: AOAM5322rtKSiyjmsyKnaAwj3cUMV2AqykjlLb0QmyQHbnjutNf0sJUc
	xVXrzM0PIpMdsVsa7l/1bBM=
X-Google-Smtp-Source: ABdhPJx/nUOhJJtuN0gHyX6KFxjGpHkQI9bdJpUKR1VOEFtFoX1LIu0TSgkm9SsXOB24vOiLhwXcgA==
X-Received: by 2002:a2e:6a14:: with SMTP id f20mr1853976ljc.377.1605624477002;
        Tue, 17 Nov 2020 06:47:57 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id s26sm3084683lji.31.2020.11.17.06.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 06:47:56 -0800 (PST)
Subject: Re: [PATCH V2 02/23] xen/ioreq: Make x86's IOREQ feature common
From: Oleksandr <olekstysh@gmail.com>
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Jan Beulich' <jbeulich@suse.com>,
 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Tim Deegan' <tim@xen.org>, 'Julien Grall' <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-3-git-send-email-olekstysh@gmail.com>
 <004001d6a6b6$9ffd3ac0$dff7b040$@xen.org>
 <436143ea-609f-f6c3-4952-19fcf410fe8f@gmail.com>
Message-ID: <34133df1-bff2-f4df-00a5-674a2af867fc@gmail.com>
Date: Tue, 17 Nov 2020 16:47:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <436143ea-609f-f6c3-4952-19fcf410fe8f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Paul

>
>> The 'legacy' mechanism of mapping magic pages for ioreq servers 
>> should remain x86 specific I think that aspect of the code needs to 
>> remain behind and not get moved into common code. You could do that 
>> in arch specific calls in hvm_ioreq_server_enable/disable() and 
>> hvm_get_ioreq_server_info().
> Well, if legacy mechanism is not going to be used for other arch and 
> should remain x86 specific, I will try to investigate what should be 
> left in x86 code and rework the series.
> As a side note, I am afraid, we won't get a 100% code movement (which 
> I managed to achieve here) for the next version of this patch as we 
> need arch/x86/hvm/ioreq.c.

I am investigating how to split the code in order to leave the 'legacy' 
mechanism x86 specific and have a few questions. Could you please 
clarify the following:

1. The split of hvm_ioreq_server_enable/disable() is obvious to me, I 
would like to clarify regarding hvm_get_ioreq_server_info().
Is it close to what you had in mind when suggesting the split of 
hvm_get_ioreq_server_info() or I just need to abstract 
hvm_ioreq_server_map_pages() call only?
(Not completed and non tested)

+/* Called with ioreq_server lock held */
+int arch_ioreq_server_get_info(struct hvm_ioreq_server *s,
+                               unsigned long *ioreq_gfn,
+                               unsigned long *bufioreq_gfn,
+                               evtchn_port_t *bufioreq_port)
+{
+    if ( ioreq_gfn || bufioreq_gfn )
+    {
+        int rc = hvm_ioreq_server_map_pages(s);
+
+        if ( rc )
+            return rc;
+    }
+
+    if ( ioreq_gfn )
+        *ioreq_gfn = gfn_x(s->ioreq.gfn);
+
+    if ( HANDLE_BUFIOREQ(s) )
+    {
+        if ( bufioreq_gfn )
+            *bufioreq_gfn = gfn_x(s->bufioreq.gfn);
+
+        if ( bufioreq_port )
+            *bufioreq_port = s->bufioreq_evtchn;
+    }
+
+    return 0;
+}
+
  int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
                                unsigned long *ioreq_gfn,
                                unsigned long *bufioreq_gfn,
@@ -916,26 +954,7 @@ int hvm_get_ioreq_server_info(struct domain *d, 
ioservid_t id,
      if ( s->emulator != current->domain )
          goto out;

-    if ( ioreq_gfn || bufioreq_gfn )
-    {
-        rc = hvm_ioreq_server_map_pages(s);
-        if ( rc )
-            goto out;
-    }
-
-    if ( ioreq_gfn )
-        *ioreq_gfn = gfn_x(s->ioreq.gfn);
-
-    if ( HANDLE_BUFIOREQ(s) )
-    {
-        if ( bufioreq_gfn )
-            *bufioreq_gfn = gfn_x(s->bufioreq.gfn);
-
-        if ( bufioreq_port )
-            *bufioreq_port = s->bufioreq_evtchn;
-    }
-
-    rc = 0;
+    rc = arch_ioreq_server_get_info(s, ioreq_gfn, bufioreq_gfn, 
bufioreq_port);

   out:
      spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);

2. If I understand the code correctly, besides of the above-mentioned 
functions the arch specific calls should be in hvm_ioreq_server_init() 
and hvm_ioreq_server_deinit() to actually hide 
"hvm_ioreq_server_unmap_pages" usage from the common code.  I noticed 
that the rollback code in hvm_ioreq_server_init() and the whole 
hvm_ioreq_server_deinit() have a lot in common except an extra ASSERT() 
and hvm_ioreq_server_free_pages() call in the latter. My question is 
could we just replace the rollback code by hvm_ioreq_server_deinit()? I 
assume an extra hvm_ioreq_server_free_pages() call wouldn't be an issue 
here, but I am not sure what to do with the ASSERT, I expect it to be 
triggered at such an early stage (so it probably needs moving out of the 
hvm_ioreq_server_deinit() (or dropped?) as well as comment needs 
updating). I am asking, because this way we would get *a single* arch 
hook here which would be arch_ioreq_server_deinit() and remove code 
duplication a bit.

Something close to this.
(Not completed and non tested)

@@ -761,18 +771,17 @@ static int hvm_ioreq_server_init(struct 
hvm_ioreq_server *s,
      return 0;

   fail_add:
-    hvm_ioreq_server_remove_all_vcpus(s);
-    hvm_ioreq_server_unmap_pages(s);
-
-    hvm_ioreq_server_free_rangesets(s);
-
-    put_domain(s->emulator);
+    hvm_ioreq_server_deinit(s);
      return rc;
  }

+void arch_ioreq_server_deinit(struct hvm_ioreq_server *s)
+{
+    hvm_ioreq_server_unmap_pages(s);
+}
+
  static void hvm_ioreq_server_deinit(struct hvm_ioreq_server *s)
  {
-    ASSERT(!s->enabled);
      hvm_ioreq_server_remove_all_vcpus(s);

      /*
@@ -784,7 +793,7 @@ static void hvm_ioreq_server_deinit(struct 
hvm_ioreq_server *s)
       *       the page_info pointer to NULL, meaning the latter will do
       *       nothing.
       */
-    hvm_ioreq_server_unmap_pages(s);
+    arch_ioreq_server_deinit(s);
      hvm_ioreq_server_free_pages(s);

      hvm_ioreq_server_free_rangesets(s);

      put_domain(s->emulator);


-- 

Regards,

Oleksandr Tyshchenko


