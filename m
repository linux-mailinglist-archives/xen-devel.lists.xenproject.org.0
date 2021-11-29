Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236CF461B79
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234725.407342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrj2l-0005d4-M1; Mon, 29 Nov 2021 15:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234725.407342; Mon, 29 Nov 2021 15:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrj2l-0005bF-Ir; Mon, 29 Nov 2021 15:58:15 +0000
Received: by outflank-mailman (input) for mailman id 234725;
 Mon, 29 Nov 2021 15:58:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fA4G=QQ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mrj2k-0005XU-1X
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:58:14 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28453374-512d-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 16:58:13 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id f18so45937492lfv.6
 for <xen-devel@lists.xenproject.org>; Mon, 29 Nov 2021 07:58:13 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u7sm1385051lfs.144.2021.11.29.07.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 07:58:12 -0800 (PST)
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
X-Inumbo-ID: 28453374-512d-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=C8O58H7FMIFDIE4tI39SVeIxbVB3KQGfg4tkHZFEcRQ=;
        b=BYCB+0UGk/nVKYufQFG8fIgVfRerqaAwoHs8S8LN2HPwQ+ZUmZPx6t4PfhamU3OfEL
         3aqTmMsaISqGM9wRM6usguRbV4HdNZzvY/R+K8FbXdY83zFJcb8gTPrY9E52VRS13Yq/
         rQP47MqVY2sNPjWY3CRBV4RRXS8ZmiAZQyeWHZUrfPWUtWj8cSrVvVgGGYPx1Vu6Lfd6
         rXJXE9Y+it2tflk0rU6n5myotsLJhHe3B8bOSL0MsRGbjb3foiJGxU00w1nvXIPCljjI
         BFeC0lXHsM+Se737kJkSdt8V0ka7xTyF8L4D/jM98fi1Gfha0XGn5D3kFeWVzevVEhTl
         CR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=C8O58H7FMIFDIE4tI39SVeIxbVB3KQGfg4tkHZFEcRQ=;
        b=sGc/LuOpzLGQu8OcTqhG6bvKYGQVTmTL5CdxlXrr9a464aJQwnZw3H7OfqC7gPIO7U
         KICHXQMPrvmop3KjOJamTiynF2nbeaHsCa8F1WfN5iR2OBwFnsxJkYyYJ3vq9EBXEvbC
         QyfJDflxBVYqH27faOIkjtyrBpmYD4JUvtWQ55CZwKLKkWa03g6zRYUPAC5rpx4yqH8N
         /kjRsryX/wI3kPO9qjXXGPcHgZib1z4c+sg75x51n9Sb3KxG/mhGWFZi9vmD+tceZzN9
         QOidzpkRRI3I/53CMyJyV8XpnwFjzEfhQAMRCiuWPw144VnIbXZzGQSELFV5Wu6CgRNl
         nZeQ==
X-Gm-Message-State: AOAM533tsJTASsKHd120A6YmM+wu2MtXpZSVDOCtHnclluL2Dkdj4h9w
	wlhokTyOy2pZFleu0OVJr+s=
X-Google-Smtp-Source: ABdhPJyUVGG9Fwx/JJBZwqfiu0LX1DoL3QTq8fJMkXQ9fOxeDr/5MIdwglVwoHrt9TNZbl5iodrs7Q==
X-Received: by 2002:a05:6512:b84:: with SMTP id b4mr49288259lfv.472.1638201492921;
        Mon, 29 Nov 2021 07:58:12 -0800 (PST)
Subject: Re: [RFC PATCH V3] xen/gnttab: Store frame GFN in struct page_info on
 Arm
From: Oleksandr <olekstysh@gmail.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1632425551-18910-1-git-send-email-olekstysh@gmail.com>
 <863c9a06-f0af-eac1-fb04-e059e4ce0a09@xen.org>
 <89f27a30-187c-6223-9dbb-1e3f52213868@gmail.com>
Message-ID: <15a507c7-17e3-6e48-152d-32f54b362889@gmail.com>
Date: Mon, 29 Nov 2021 17:58:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <89f27a30-187c-6223-9dbb-1e3f52213868@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Julien


[snip]


>
>>>
>>> ! Please note, there is still unresolved locking question here for 
>>> which
>>> I failed to find a suitable solution. So, it is still an RFC !
>>>
>>> According to the internal conversation:
>>> Now the GFN field in the struct page_info is accessed from
>>> gnttab_set_frame_gfn() in the grant table code and from 
>>> page_set_frame_gfn()
>>> in the P2M code (the former uses the latter).
>>>
>>> We need to prevent the concurrent access to this field. But, we 
>>> cannot grab
>>> the grant lock from the P2M code because we will introduce a lock 
>>> inversion.
>>> The page_set_frame_gfn() will be called from the P2M code with the 
>>> p2m lock held
>>> and then acquire the grant table lock. The gnttab_map_frame() will 
>>> do the inverse.
>>
>> This is a tricky one. I think, we will:
>>
>>   1) Need to use the P2M lock to protect the access to the GFN in the 
>> struct page_info *.
>>   2) Defer the call to page_set_frame_gfn() from gnttab_map_frame() 
>> to xenmem_add_to_physmap_one()
>>   3) In xenmem_add_to_physmap_one() hold the P2M lock while checking 
>> the page was not already mapped (e.g. page_get_frame_gfn() == 
>> INVALID_GFN) and do the mapping. Call page_set_frame_gfn() on success.
>>
>> This would still allow the guest to shot itself in the foot (e.g. 
>> potentially removing the wrong mapping) if it tries concurrent 
>> hypercall but I believe we would not introduce issue like XSA-380.
>>
>> At the end this would look quite similar to how x86 deal with the M2P 
>> update.
>
> Thank you for the suggestion, I need to analyze the code to better 
> understand your idea and technical possibility to implement it, I will 
> come up with questions if any.

I experimented a bit... Could you please clarify, is the code snippet 
below is close to what you meant?


diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b594db4..dba9258 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1488,8 +1488,27 @@ int xenmem_add_to_physmap_one(
          return -ENOSYS;
      }

-    /* Map at new location. */
-    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
+    if ( space != XENMAPSPACE_grant_table )
+        /* Map at new location. */
+        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
+    else
+    {
+#ifdef CONFIG_GRANT_TABLE
+        struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+        p2m_write_lock(p2m);
+        if ( gfn_eq(page_get_frame_gfn(page), INVALID_GFN) )
+        {
+            rc = p2m_set_entry(p2m, gfn, 1, mfn, t, p2m->default_access);
+            if ( !rc )
+                page_set_frame_gfn(page, gfn);
+        }
+        p2m_write_unlock(p2m);
+#else
+        ASSERT_UNREACHABLE();
+        rc = -EINVAL;
+#endif
+    }

      /*
       * For XENMAPSPACE_gmfn_foreign if we failed to add the mapping, 
we need
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 59604b1..64e9e77 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4167,10 +4167,8 @@ int gnttab_map_frame(struct domain *d, unsigned 
long idx, gfn_t gfn, mfn_t *mfn)
           * Make sure gnttab_unpopulate_status_frames() won't 
(successfully)
           * free the page until our caller has completed its operation.
           */
-        if ( get_page(mfn_to_page(*mfn), d) )
-            gnttab_set_frame_gfn(gt, status, idx, gfn);
-        else
-            rc = -EBUSY;
+        if ( !get_page(mfn_to_page(*mfn), d) )
+           rc = -EBUSY;
      }

      grant_write_unlock(gt);
(END)

If yes *and* I correctly understand the code, then looks like 
gnttab_set_frame_gfn becomes useless on Arm and can be dropped globally 
(x86's variant is already dummy).


[snip]

-- 
Regards,

Oleksandr Tyshchenko


