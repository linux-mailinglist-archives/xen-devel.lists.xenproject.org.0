Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491162D15CB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 17:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46818.82973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmJDS-0000w8-HK; Mon, 07 Dec 2020 16:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46818.82973; Mon, 07 Dec 2020 16:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmJDS-0000vj-E0; Mon, 07 Dec 2020 16:18:22 +0000
Received: by outflank-mailman (input) for mailman id 46818;
 Mon, 07 Dec 2020 16:18:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e0y+=FL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kmJDQ-0000ve-8P
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 16:18:20 +0000
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7f94a67-4857-4deb-9252-1b8af9315cb6;
 Mon, 07 Dec 2020 16:18:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g25so227067wmh.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 08:18:19 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id d13sm6289418wrn.90.2020.12.07.08.18.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Dec 2020 08:18:17 -0800 (PST)
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
X-Inumbo-ID: c7f94a67-4857-4deb-9252-1b8af9315cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=dhkLA5SQdwKofqUPxChTpwY9t7sFcnx3FYpG2NJ9IyI=;
        b=VgfYKCm/rZ0Wt0ILjg7IBNEj58HxqAM/BtVxgLVTi/d2heC0EYpJTJ6Pc3qAjVDyx/
         5K2U6OoWnnMknjcUS+U95Cwj9wgVKczhQtbL0CNWsapctSq7VluhTIoOBA0ngUu51mka
         0DcVPCLsvpk0kHzUwcAZ3tZ1bkhe6ZwB9ZR443+IMnQNH4k3LONMSxNVzadl4ot/mA6p
         UsU2/EeaKNVkWCwtCmXqGmpUeUnLzZ2iRWlKFS/p07a4SiBPfNBwZFH0WNnSpNogM6xO
         FtjWoRQ1lh0UwHJA2WsRc+KMZh71/cx1fTj1FjUIG1IQL3jV1LeDemDPAE70eTYm86hX
         bcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=dhkLA5SQdwKofqUPxChTpwY9t7sFcnx3FYpG2NJ9IyI=;
        b=SaZrp2GXuTjij0VuBwwl8F5N2AzaI4APC9BLhUEHCxsQphLmeadgGk+sW+vkQB4V+J
         ziY7TMjf/Hh6I08QH/8UdOU3GMU3vR7Qjt1YDHgq58oYsgX2bjvOIyMPCY9JGFAudCMI
         LdHLxuiZCkKrw7LPypkJp0z6brAT7ZDSG7ZXIyevb+FnKBgmbN96wAAgRcOqG19PRGw8
         dd5bOBM2gYPrtpdDZYeN73PKk2JhO/CCGTG9nm5LgTuEeZ9fsOt5rzD/aV85rrB80H3l
         3CXmcIO0PEl3WABGqiLDMkSB3RLgc/gjMNiwgLrs8sOE+a4xqmYyKOv4ZKwy9xGL1zYV
         /UEw==
X-Gm-Message-State: AOAM533tSQUDcyb4k9lG+4i1dmHrPG+qC8667j7WEd9RIlvNnVKU882Y
	hPlnfc3wdG3gSDYFqx5127w=
X-Google-Smtp-Source: ABdhPJx3km4y6Ptxbo1gRtmUp3RQWIpNpjW7YVghKYqRYc32VogPWecdNa/CIIhbTR9xlsBk6+cVag==
X-Received: by 2002:a1c:6056:: with SMTP id u83mr18884717wmb.90.1607357898220;
        Mon, 07 Dec 2020 08:18:18 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: <paul@xen.org>,
	"'Wei Liu'" <wl@xen.org>
Cc: <xen-devel@lists.xenproject.org>,
	"'Paul Durrant'" <pdurrant@amazon.com>,
	"'Oleksandr Andrushchenko'" <oleksandr_andrushchenko@epam.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>
References: <20201203142534.4017-1-paul@xen.org> <20201203142534.4017-2-paul@xen.org> <20201204111326.5pxgqertdm3tk7y2@liuwe-devbox-debian-v2> <013d01d6ca2f$605fe7e0$211fb7a0$@xen.org> <20201204112141.wdwb54brb23x2bgs@liuwe-devbox-debian-v2> <014701d6ca2f$e414f260$ac3ed720$@xen.org>
In-Reply-To: <014701d6ca2f$e414f260$ac3ed720$@xen.org>
Subject: RE: [PATCH v5 01/23] xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
Date: Mon, 7 Dec 2020 16:18:16 -0000
Message-ID: <0d2701d6ccb4$9251c3e0$b6f54ba0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLNnXLs2pPLw4H6lzH6w2mINWFu0wFb+WecAj+9ygIB0uemdAExrIbdAi9lKOCnt67fAA==

> -----Original Message-----
[snip]
> > > >
> > > > This is going to break libxl callers because the name "pcidev" is
> > > > visible from the public header.
> > > >
> > > > I agree this is confusing and inconsistent, but we didn't go extra
> > > > length to maintain the inconsistency for no reason.
> > > >
> > > > If you really want to change it, I won't stand in the way. In fact, I'm
> > > > all for consistency. I think the flag you added should help alleviate
> > > > the fallout.
> > >
> > > Yes, I thought that was the idea... we can make API changes if we add a flag. I could see about
> > adding shims to translate the names
> > > and keep the internal code clean.
> >
> > Yes if you can add some internal shims to handle it that would be
> > great. Otherwise you will need to at least fix libvirt.
> >
> 
> I think shims are safest. We don't know what other callers are lurking out there :-)
> 

Wei,

Looking at this again; the only mentions of 'pcidev' in the public header that I can see are in argument names in function
prototypes, modified in the following hunks.

@@ -2307,15 +2314,15 @@ int libxl_device_pvcallsif_destroy(libxl_ctx *ctx, uint32_t domid,

 /* PCI Passthrough */
 int libxl_device_pci_add(libxl_ctx *ctx, uint32_t domid,
-                         libxl_device_pci *pcidev,
+                         libxl_device_pci *pci,
                          const libxl_asyncop_how *ao_how)
                          LIBXL_EXTERNAL_CALLERS_ONLY;
 int libxl_device_pci_remove(libxl_ctx *ctx, uint32_t domid,
-                            libxl_device_pci *pcidev,
+                            libxl_device_pci *pci,
                             const libxl_asyncop_how *ao_how)
                             LIBXL_EXTERNAL_CALLERS_ONLY;
 int libxl_device_pci_destroy(libxl_ctx *ctx, uint32_t domid,
-                             libxl_device_pci *pcidev,
+                             libxl_device_pci *pci,
                              const libxl_asyncop_how *ao_how)
                              LIBXL_EXTERNAL_CALLERS_ONLY;

@@ -2359,8 +2366,8 @@ int libxl_device_events_handler(libxl_ctx *ctx,
  * added or is not bound, the functions will emit a warning but return
  * SUCCESS.
  */
-int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pcidev, int rebind);
-int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pcidev, int rebind);
+int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
+int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
 libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);

 /* CPUID handling */

I can't see how renaming these will break anything. The type name (which is what I thought I'd changed) actually remains the same.
The main changes are in the libxl__device_type structure but AFAICT that is not publicly visible. Am I missing something?

  Paul


