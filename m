Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3425A4946A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 10:08:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898540.1307070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnwM4-0008Ly-PZ; Fri, 28 Feb 2025 09:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898540.1307070; Fri, 28 Feb 2025 09:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnwM4-0008Jh-MH; Fri, 28 Feb 2025 09:08:24 +0000
Received: by outflank-mailman (input) for mailman id 898540;
 Fri, 28 Feb 2025 09:08:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zu1c=VT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnwM3-0008Jb-2B
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 09:08:23 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bf5ae39-f5b3-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 10:08:17 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2211acda7f6so42916555ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 01:08:17 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501fd28dsm28766795ad.94.2025.02.28.01.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 01:08:15 -0800 (PST)
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
X-Inumbo-ID: 8bf5ae39-f5b3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740733696; x=1741338496; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oVKPAo4CoaDSIv7Ii+G3vI3jczLnmFRq0BASTbd0kug=;
        b=KJ67ZjDCURSTcWer/cigbIktN0m+o7y8rcndJecdAWliFdGYiRfMowXEirxnrjVZmd
         E/K/c+HpK1aBIKv3BbK3vfMR4HXvvE0qIIO1CVfDXzVX85s55cdrFfcMCpmJHWYaW3af
         Y3BfjQxqKiV7sbwupNMW4p8l2QyBawdZpJdPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740733696; x=1741338496;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVKPAo4CoaDSIv7Ii+G3vI3jczLnmFRq0BASTbd0kug=;
        b=gUuyvLtN+xtKVTr9kX4npuqVCMU6pyMPx0nV5+Z/VjHiA9iDBrIGZZ5oyG8sdFtYci
         P6ek89retOkavi09pG7C77/DU5kq4yejMY3v1w99m3UhOKHTlvBR0QasozjAxVwhOnzn
         Xob1OPus8XLRob2ljzruXGKAhdjLQpJD1Hg2SllNA5rX/kX/a5POH1cBQemjjSRRCVoM
         8Ze2LwG7DSnS1QYstONvC7DkF8EeaYCh9vMJZ4v6pHt1XXANb5XwDc1PBkeKW77FFOTC
         78Ho8JphwQZNepRUiu2IPtCF6hs5QGzXBkl+fnZozC+iNenQR5NxMFJSgF/y+5kiU0Q7
         jowQ==
X-Gm-Message-State: AOJu0YwIa2utxPJNO55erJfR/AdZXMVnbUImT/bcFolVfHXdsOBVkQWz
	0I0DyPwSSTVQ4YUgoh9tjNDmbvb2KFWE6SbyaD1Pg+eHyu6lNyRdl0LPP+oV704=
X-Gm-Gg: ASbGncujAPJy6dlP+q7n7m3/vMb9cOKRskBh0TPZbqjcNs9IqO0VD4ZWEOAlus1Eje8
	NH6h7KHfY4PzoWGhlSR7vwz6Yk+r96IJyxgFmrAedF2Auo3zI73uVeGU6h8f4ZklQ3+wvji9TGq
	PRjxM+bbJPTUIqjWgHx0GUxFNhJkJsY4Hnd+Wp1kYNZpH6HAgtQwBA/jEyQaSa584Lq0AEDA6da
	J6SQcXxXz/9ffgKJFQVnXWvuadgnvnVysjd94HIYRNoKlv/Bc7RiTUEsEhDFtDjVSJ/uRIkp9yR
	91Dy0mswLal2c0ByVly8tHu0U+CZjutwCqCR
X-Google-Smtp-Source: AGHT+IFQBC4GqXL0Ka0hd/1pRFQtHYa+tc+4bwOUSdflCIOko47yWczwCbC+DcNJSBPqnXS+sO96eg==
X-Received: by 2002:a17:902:fccf:b0:220:e63c:5b08 with SMTP id d9443c01a7336-22368f6a1b5mr31291855ad.11.1740733696153;
        Fri, 28 Feb 2025 01:08:16 -0800 (PST)
Date: Fri, 28 Feb 2025 10:08:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: Verbosity during boot
Message-ID: <Z8F8-hQ3m8XTEX5P@macbook.local>
References: <a90f1bb3-90a8-4c3e-818f-498319815475@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a90f1bb3-90a8-4c3e-818f-498319815475@citrix.com>

On Thu, Feb 27, 2025 at 08:38:27PM +0000, Andrew Cooper wrote:
> I've raised this during review before, but:
> 
> > (XEN) [    1.209230] AMD-Vi: IOMMU Extended Features:
> > (XEN) [    1.213998] - Peripheral Page Service Request
> > (XEN) [    1.218849] - x2APIC
> > (XEN) [    1.221536] - NX bit
> > (XEN) [    1.224221] - Invalidate All Command
> > (XEN) [    1.228297] - Guest APIC
> > (XEN) [    1.236062] - Performance Counters
> > (XEN) [    1.244692] - Host Address Translation Size: 0x2
> > (XEN) [    1.254547] - Guest Address Translation Size: 0
> > (XEN) [    1.264313] - Guest CR3 Root Table Level: 0x1
> > (XEN) [    1.273925] - Maximum PASID: 0xf
> > (XEN) [    1.282338] - SMI Filter Register: 0x1
> > (XEN) [    1.291241] - SMI Filter Register Count: 0x2
> > (XEN) [    1.300607] - Guest Virtual APIC Modes: 0
> > (XEN) [    1.309655] - Dual PPR Log: 0x2
> > (XEN) [    1.317801] - Dual Event Log: 0x2
> > (XEN) [    1.326078] - Secure ATS
> > (XEN) [    1.333490] - User / Supervisor Page Protection
> > (XEN) [    1.342892] - Device Table Segmentation: 0x3
> > (XEN) [    1.351981] - PPR Log Overflow Early Warning
> > (XEN) [    1.361040] - PPR Automatic Response
> > (XEN) [    1.369341] - Memory Access Routing and Control: 0x1
> > (XEN) [    1.379012] - Block StopMark Message
> > (XEN) [    1.387273] - Performance Optimization
> > (XEN) [    1.395637] - MSI Capability MMIO Access
> > (XEN) [    1.404138] - Guest I/O Protection
> > (XEN) [    1.412042] - Host Access
> > (XEN) [    1.419105] - Enhanced PPR Handling
> > (XEN) [    1.427008] - Attribute Forward
> > (XEN) [    1.434494] - Host Dirty
> > (XEN) [    1.441308] - Virtualized IOMMU
> > (XEN) [    1.448699] - VMGuard I/O Support
> > (XEN) [    1.456345] - VM Table Size: 0x2
> > (XEN) [    1.491312] AMD-Vi: IOMMU 0 Enabled.
> > (XEN) [    1.499087] AMD-Vi: IOMMU 1 Enabled.
> > (XEN) [    1.506835] AMD-Vi: IOMMU 2 Enabled.
> > (XEN) [    1.514554] AMD-Vi: IOMMU 3 Enabled.
> > (XEN) [    1.522452] I/O virtualisation enabled
> 
> Lots of that information is not actually useful, not even for
> developers.  What's worse is that this is a release build of Xen and it
> still takes 0.3s to print the feature list alone.

VT-d is kind of similar, but not that verbose in the list of features.
We should probably adjust there too.

I would be fine with doing (didn't test this at all):

diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/passthrough/amd/iommu_detect.c
index cede44e6518f..6bb5d5db9ac7 100644
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -72,6 +72,9 @@ void __init get_iommu_features(struct amd_iommu *iommu)
             amd_iommu_max_paging_mode = 4 + iommu->features.flds.hats;
     }
 
+    if ( !iommu_verbose )
+        return;
+
     /* Don't log the same set of features over and over. */
     first = list_first_entry(&amd_iommu_head, struct amd_iommu, list);
     if ( iommu != first && iommu->features.raw == first->features.raw )


