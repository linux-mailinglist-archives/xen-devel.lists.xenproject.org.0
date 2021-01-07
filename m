Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20DC2ED2DE
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 15:38:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62937.111674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxWQu-0006JC-Lo; Thu, 07 Jan 2021 14:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62937.111674; Thu, 07 Jan 2021 14:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxWQu-0006Io-IV; Thu, 07 Jan 2021 14:38:36 +0000
Received: by outflank-mailman (input) for mailman id 62937;
 Thu, 07 Jan 2021 14:38:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2+O=GK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kxWQt-0006Ij-7O
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 14:38:35 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26a3b4af-59d6-4c37-9310-f9a96f20563b;
 Thu, 07 Jan 2021 14:38:32 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id o13so15106736lfr.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jan 2021 06:38:32 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k18sm1286190ljb.80.2021.01.07.06.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 06:38:30 -0800 (PST)
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
X-Inumbo-ID: 26a3b4af-59d6-4c37-9310-f9a96f20563b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8KQ+Gtl6m4X5pAx37bBKmob2DZ29p2VAzxX8gEnbgCs=;
        b=pJyjBjUdKDbmiqikLpQYRkoggqyaHcig4SqqXHJzNYl4HPSe2vom5ivT0ROta08suu
         BgdFeRJdGIMRzNB25hbVXFf5IGJ/mhVKXQwMSbYYy7tRbiq1MDHtwM2fhtbC8dq6mq1N
         8Ym56ynUJG9yGwccL5nrOAgx1dJLPjn2PPjeXXccZ9WWGIBKexGWnYiFuwe0zPuMd+cj
         Vgp8Oqo4j77rr7swctP43JTIRVHQGczPS1ijoeOoq1pSEUrEDnVflelMVvtiIc8VPXl6
         xUYd774st0pr8yplWvNZf24x/klclp7vHyQPBK89/9zT464VCPAq5iW2v01jzgn7FEHn
         GCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8KQ+Gtl6m4X5pAx37bBKmob2DZ29p2VAzxX8gEnbgCs=;
        b=T5mmAFLb2ehIC3IoCXQtzorncQQC05R/JRrd/vhzGWOIFO6HNxiMUmVhECzkjnfyVm
         Rp/a7sK4KFgzxJBEMpYWTzoQaHOK28z0WA4d4NVq9jxU75GAkxK7QGyRp+Rv5yua5Cae
         7cCx8S24piHSTYEKc+c3NAQfMq2ckPWFDgh7/DYXOa65dassPdq7Xm9ry6eVXcusOQBD
         VcqEbvU9kCR0fDrzRFRu1qFIZmC9ycYHwArWq9bA9OVHFCv/D28Pia+J9Cq2YdP9o9sQ
         fBe/7LNXkRt4U2v+EDaqJQrD/VgtuGbvFJMB+94aBBA+CKvXsfMjUv2RF9kWpg8pM+zM
         PDpg==
X-Gm-Message-State: AOAM532Cl74hguBaTP+HMr3YgSarjuXQXL0bHwMByFy24rx8B4UgAFMR
	tAbIY0UiLVCo/mQujk2ZIGI4XJLimrU=
X-Google-Smtp-Source: ABdhPJyHsNb6kwfoe6GR+Pgw9TT0PbgfosWqL5gtOVZVV9Ttz/VyDICIQHCIV0Z8cYNDRaHu/5CavA==
X-Received: by 2002:a19:804a:: with SMTP id b71mr3844461lfd.504.1610030310623;
        Thu, 07 Jan 2021 06:38:30 -0800 (PST)
Subject: Re: [PATCH V3 09/23] xen/dm: Make x86's DM feature common
From: Oleksandr <olekstysh@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-10-git-send-email-olekstysh@gmail.com>
 <00c3df9f-760d-bb3d-d1d6-7c7df7f0c17c@suse.com>
 <24191fca-78e7-3e6b-ff02-c06e8ae79f56@gmail.com>
 <7c985117-2bb4-dd5b-53cf-e217e25b2e8e@suse.com>
 <f7d06c56-7f76-9ba7-6797-ebd9cf133479@gmail.com>
Message-ID: <94c20a50-9363-c8d1-11aa-7a35f97a03a6@gmail.com>
Date: Thu, 7 Jan 2021 16:38:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f7d06c56-7f76-9ba7-6797-ebd9cf133479@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Jan


>>>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>>>> From: Julien Grall <julien.grall@arm.com>
>>>>>
>>>>> As a lot of x86 code can be re-used on Arm later on, this patch
>>>>> splits devicemodel support into common and arch specific parts.
>>>>>
>>>>> The common DM feature is supposed to be built with IOREQ_SERVER
>>>>> option enabled (as well as the IOREQ feature), which is selected
>>>>> for x86's config HVM for now.
>>>>>
>>>>> Also update XSM code a bit to let DM op be used on Arm.
>>>>>
>>>>> This support is going to be used on Arm to be able run device
>>>>> emulator outside of Xen hypervisor.
>>>>>
>>>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> ---
>>>>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>>>>> "Add support for Guest IO forwarding to a device emulator"
>>>>>
>>>>> Changes RFC -> V1:
>>>>>      - update XSM, related changes were pulled from:
>>>>>        [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits 
>>>>> for IOREQ/DM features
>>>>>
>>>>> Changes V1 -> V2:
>>>>>      - update the author of a patch
>>>>>      - update patch description
>>>>>      - introduce xen/dm.h and move definitions here
>>>>>
>>>>> Changes V2 -> V3:
>>>>>      - no changes
>>>> And my concern regarding the common vs arch nesting also hasn't
>>>> changed.
>>>
>>> I am sorry, I might misread your comment, but I failed to see any
>>> obvious to me request(s) for changes.
>>> I have just re-read previous discussion...
>>> So the question about considering doing it the other way around (top
>>> level dm-op handling arch-specific
>>> and call into e.g. ioreq_server_dm_op() for otherwise unhandled ops) is
>>> exactly a concern which I should have addressed?
>> Well, on v2 you replied you didn't consider the alternative. I would
>> have expected that you would at least go through this consideration
>> process, and see whether there are better reasons to stick with the
>> apparently backwards arrangement than to change to the more
>> conventional one. If there are such reasons, I would expect them to
>> be called out in reply and perhaps also in the commit message; the
>> latter because down the road more people may wonder why the more
>> narrow / special set of cases gets handled at a higher layer than
>> the wider set of remaining ones, and they would then be able to find
>> an explanation without having to resort to searching through list
>> archives.
> Ah, will investigate. Sorry for not paying enough attention to it.
> Yes, IOREQ (I mean "common") ops are 7 out of 18 right now. The 
> subsequent patch is adding one more DM op - XEN_DMOP_set_irq_level.
> There are several PCI related ops which might want to be common in the 
> future (but I am not sure).
I think, I can say that I have considered the alternative (doing it the 
other way around), of course if I got your suggestion for V2 correctly.
Agree, the alternative is more natural, also compat_dm_op() was left in 
x86 code. For me the downside is in code duplication. With the 
alternative both arches have to duplicate do_dm_op() and "common" part 
of dm_op()
(only "switch ( op.op )" is unique). Probably, do_dm_op() could be moved 
to common dm.c as well as dm_op() could become global...


Now the question is which approach to take ("current" or "alternative") 
for me to prepare for V4. Personally, I would be OK with the both (with 
a little preference for "alternative").
Also, If we decide to go with the alternative, should the common files 
still be named dm.*?


diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index d3e2a9e..dc8e47d 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -16,6 +16,7 @@

  #include <xen/event.h>
  #include <xen/guest_access.h>
+#include <xen/dm.h>
  #include <xen/hypercall.h>
  #include <xen/ioreq.h>
  #include <xen/nospec.h>
@@ -29,13 +30,6 @@

  #include <public/hvm/hvm_op.h>

-struct dmop_args {
-    domid_t domid;
-    unsigned int nr_bufs;
-    /* Reserve enough buf elements for all current hypercalls. */
-    struct xen_dm_op_buf buf[2];
-};
-
  static bool _raw_copy_from_guest_buf_offset(void *dst,
                                              const struct dmop_args *args,
                                              unsigned int buf_idx,
@@ -408,71 +402,6 @@ static int dm_op(const struct dmop_args *op_args)

      switch ( op.op )
      {
-    case XEN_DMOP_create_ioreq_server:
-    {
-        struct xen_dm_op_create_ioreq_server *data =
-            &op.u.create_ioreq_server;
-
-        const_op = false;
-
-        rc = -EINVAL;
-        if ( data->pad[0] || data->pad[1] || data->pad[2] )
-            break;
-
-        rc = hvm_create_ioreq_server(d, data->handle_bufioreq,
-                                     &data->id);
-        break;
-    }
-
-    case XEN_DMOP_get_ioreq_server_info:
-    {
-        struct xen_dm_op_get_ioreq_server_info *data =
-            &op.u.get_ioreq_server_info;
-        const uint16_t valid_flags = XEN_DMOP_no_gfns;
-
-        const_op = false;
-
-        rc = -EINVAL;
-        if ( data->flags & ~valid_flags )
-            break;
-
-        rc = hvm_get_ioreq_server_info(d, data->id,
-                                       (data->flags & XEN_DMOP_no_gfns) ?
-                                       NULL : &data->ioreq_gfn,
-                                       (data->flags & XEN_DMOP_no_gfns) ?
-                                       NULL : &data->bufioreq_gfn,
- &data->bufioreq_port);
-        break;
-    }
-
-    case XEN_DMOP_map_io_range_to_ioreq_server:
-    {
-        const struct xen_dm_op_ioreq_server_range *data =
-            &op.u.map_io_range_to_ioreq_server;
-
-        rc = -EINVAL;
-        if ( data->pad )
-            break;
-
-        rc = hvm_map_io_range_to_ioreq_server(d, data->id, data->type,
-                                              data->start, data->end);
-        break;
-    }
-
-    case XEN_DMOP_unmap_io_range_from_ioreq_server:
-    {
-        const struct xen_dm_op_ioreq_server_range *data =
-            &op.u.unmap_io_range_from_ioreq_server;
-
-        rc = -EINVAL;
-        if ( data->pad )
-            break;
-
-        rc = hvm_unmap_io_range_from_ioreq_server(d, data->id, data->type,
-                                                  data->start, data->end);
-        break;
-    }
-
      case XEN_DMOP_map_mem_type_to_ioreq_server:
      {
          struct xen_dm_op_map_mem_type_to_ioreq_server *data =
@@ -523,32 +452,6 @@ static int dm_op(const struct dmop_args *op_args)
          break;
      }

-    case XEN_DMOP_set_ioreq_server_state:
-    {
-        const struct xen_dm_op_set_ioreq_server_state *data =
-            &op.u.set_ioreq_server_state;
-
-        rc = -EINVAL;
-        if ( data->pad )
-            break;
-
-        rc = hvm_set_ioreq_server_state(d, data->id, !!data->enabled);
-        break;
-    }
-
-    case XEN_DMOP_destroy_ioreq_server:
-    {
-        const struct xen_dm_op_destroy_ioreq_server *data =
-            &op.u.destroy_ioreq_server;
-
-        rc = -EINVAL;
-        if ( data->pad )
-            break;
-
-        rc = hvm_destroy_ioreq_server(d, data->id);
-        break;
-    }
-
      case XEN_DMOP_track_dirty_vram:
      {
          const struct xen_dm_op_track_dirty_vram *data =
@@ -703,7 +606,7 @@ static int dm_op(const struct dmop_args *op_args)
      }

      default:
-        rc = -EOPNOTSUPP;
+        rc = ioreq_server_dm_op(&op, d, &const_op);
          break;
      }

diff --git a/xen/common/Makefile b/xen/common/Makefile
index b161381..8110431 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_CORE_PARKING) += core_parking.o
  obj-y += cpu.o
  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
  obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
+obj-$(CONFIG_IOREQ_SERVER) += dm.o
  obj-y += domain.o
  obj-y += event_2l.o
  obj-y += event_channel.o
diff --git a/xen/common/dm.c b/xen/common/dm.c
new file mode 100644
index 0000000..5653bcd
--- /dev/null
+++ b/xen/common/dm.c
@@ -0,0 +1,135 @@
+/*
+ * Copyright (c) 2016 Citrix Systems Inc.
+ * Copyright (c) 2019 Arm ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public 
License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License 
along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/dm.h>
+#include <xen/hypercall.h>
+#include <xen/ioreq.h>
+
+int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool 
*const_op)
+{
+    long rc;
+
+    switch ( op->op )
+    {
+    case XEN_DMOP_create_ioreq_server:
+    {
+        struct xen_dm_op_create_ioreq_server *data =
+            &op->u.create_ioreq_server;
+
+        *const_op = false;
+
+        rc = -EINVAL;
+        if ( data->pad[0] || data->pad[1] || data->pad[2] )
+            break;
+
+        rc = hvm_create_ioreq_server(d, data->handle_bufioreq,
+                                     &data->id);
+        break;
+    }
+
+    case XEN_DMOP_get_ioreq_server_info:
+    {
+        struct xen_dm_op_get_ioreq_server_info *data =
+            &op->u.get_ioreq_server_info;
+        const uint16_t valid_flags = XEN_DMOP_no_gfns;
+
+        *const_op = false;
+
+        rc = -EINVAL;
+        if ( data->flags & ~valid_flags )
+            break;
+
+        rc = hvm_get_ioreq_server_info(d, data->id,
+                                       (data->flags & XEN_DMOP_no_gfns) ?
+                                       NULL : (unsigned long 
*)&data->ioreq_gfn,
+                                       (data->flags & XEN_DMOP_no_gfns) ?
+                                       NULL : (unsigned long 
*)&data->bufioreq_gfn,
+ &data->bufioreq_port);
+        break;
+    }
+
+    case XEN_DMOP_map_io_range_to_ioreq_server:
+    {
+        const struct xen_dm_op_ioreq_server_range *data =
+            &op->u.map_io_range_to_ioreq_server;
+
+        rc = -EINVAL;
+        if ( data->pad )
+            break;
+
+        rc = hvm_map_io_range_to_ioreq_server(d, data->id, data->type,
+                                              data->start, data->end);
+        break;
+    }
+
+    case XEN_DMOP_unmap_io_range_from_ioreq_server:
+    {
+        const struct xen_dm_op_ioreq_server_range *data =
+            &op->u.unmap_io_range_from_ioreq_server;
+
+        rc = -EINVAL;
+        if ( data->pad )
+            break;
+
+        rc = hvm_unmap_io_range_from_ioreq_server(d, data->id, data->type,
+                                                  data->start, data->end);
+        break;
+    }
+
+    case XEN_DMOP_set_ioreq_server_state:
+    {
+        const struct xen_dm_op_set_ioreq_server_state *data =
+            &op->u.set_ioreq_server_state;
+
+        rc = -EINVAL;
+        if ( data->pad )
+            break;
+
+        rc = hvm_set_ioreq_server_state(d, data->id, !!data->enabled);
+        break;
+    }
+
+    case XEN_DMOP_destroy_ioreq_server:
+    {
+        const struct xen_dm_op_destroy_ioreq_server *data =
+            &op->u.destroy_ioreq_server;
+
+        rc = -EINVAL;
+        if ( data->pad )
+            break;
+
+        rc = hvm_destroy_ioreq_server(d, data->id);
+        break;
+    }
+
+    default:
+        rc = -EOPNOTSUPP;
+        break;
+    }
+
+    return rc;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/dm.h b/xen/include/xen/dm.h
new file mode 100644
index 0000000..8451f3c
--- /dev/null
+++ b/xen/include/xen/dm.h
@@ -0,0 +1,41 @@
+/*
+ * Copyright (c) 2016 Citrix Systems Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public 
License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License 
along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __XEN_DM_H__
+#define __XEN_DM_H__
+
+#include <xen/sched.h>
+
+struct dmop_args {
+    domid_t domid;
+    unsigned int nr_bufs;
+    /* Reserve enough buf elements for all current hypercalls. */
+    struct xen_dm_op_buf buf[2];
+};
+
+int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool 
*const_op);
+
+#endif /* __XEN_DM_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 7ae3c40..5c61d8e 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -707,14 +707,14 @@ static XSM_INLINE int xsm_pmu_op (XSM_DEFAULT_ARG 
struct domain *d, unsigned int
      }
  }

+#endif /* CONFIG_X86 */
+
  static XSM_INLINE int xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
  {
      XSM_ASSERT_ACTION(XSM_DM_PRIV);
      return xsm_default_action(action, current->domain, d);
  }

-#endif /* CONFIG_X86 */
-
  #ifdef CONFIG_ARGO
  static XSM_INLINE int xsm_argo_enable(const struct domain *d)
  {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 7bd03d8..91ecff4 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -176,8 +176,8 @@ struct xsm_operations {
      int (*ioport_permission) (struct domain *d, uint32_t s, uint32_t 
e, uint8_t allow);
      int (*ioport_mapping) (struct domain *d, uint32_t s, uint32_t e, 
uint8_t allow);
      int (*pmu_op) (struct domain *d, unsigned int op);
-    int (*dm_op) (struct domain *d);
  #endif
+    int (*dm_op) (struct domain *d);
      int (*xen_version) (uint32_t cmd);
      int (*domain_resource_map) (struct domain *d);
  #ifdef CONFIG_ARGO
@@ -682,13 +682,13 @@ static inline int xsm_pmu_op (xsm_default_t def, 
struct domain *d, unsigned int
      return xsm_ops->pmu_op(d, op);
  }

+#endif /* CONFIG_X86 */
+
  static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
  {
      return xsm_ops->dm_op(d);
  }

-#endif /* CONFIG_X86 */
-
  static inline int xsm_xen_version (xsm_default_t def, uint32_t op)
  {
      return xsm_ops->xen_version(op);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 9e09512..8bdffe7 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -147,8 +147,8 @@ void __init xsm_fixup_ops (struct xsm_operations *ops)
      set_to_dummy_if_null(ops, ioport_permission);
      set_to_dummy_if_null(ops, ioport_mapping);
      set_to_dummy_if_null(ops, pmu_op);
-    set_to_dummy_if_null(ops, dm_op);
  #endif
+    set_to_dummy_if_null(ops, dm_op);
      set_to_dummy_if_null(ops, xen_version);
      set_to_dummy_if_null(ops, domain_resource_map);
  #ifdef CONFIG_ARGO
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 19b0d9e..11784d7 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1656,14 +1656,13 @@ static int flask_pmu_op (struct domain *d, 
unsigned int op)
          return -EPERM;
      }
  }
+#endif /* CONFIG_X86 */

  static int flask_dm_op(struct domain *d)
  {
      return current_has_perm(d, SECCLASS_HVM, HVM__DM);
  }

-#endif /* CONFIG_X86 */
-
  static int flask_xen_version (uint32_t op)
  {
      u32 dsid = domain_sid(current->domain);
@@ -1865,8 +1864,8 @@ static struct xsm_operations flask_ops = {
      .ioport_permission = flask_ioport_permission,
      .ioport_mapping = flask_ioport_mapping,
      .pmu_op = flask_pmu_op,
-    .dm_op = flask_dm_op,
  #endif
+    .dm_op = flask_dm_op,
      .xen_version = flask_xen_version,
      .domain_resource_map = flask_domain_resource_map,
  #ifdef CONFIG_ARGO




-- 
Regards,

Oleksandr Tyshchenko


