Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ebmQMd2vT2oNmwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 16:27:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6CD732381
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 16:27:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NC4dwvC8;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358221.1612447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whpiY-0001ZT-QL; Thu, 09 Jul 2026 14:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358221.1612447; Thu, 09 Jul 2026 14:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whpiY-0001Wn-NI; Thu, 09 Jul 2026 14:27:10 +0000
Received: by outflank-mailman (input) for mailman id 1358221;
 Thu, 09 Jul 2026 14:27:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1whpiW-0001Wh-Fs
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 14:27:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whpiV-00CLFo-St
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 16:27:07 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4fafbb-bab6-0a2a0a5309dd-0a2a4509d454-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 16:27:07 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4fafbb-b440-0a2a45090019-d1558030b468-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 16:27:07 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso9619365e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 07:27:07 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6cccfdsm65341035e9.1.2026.07.09.07.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 07:27:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783607227; x=1784212027; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MigA0hIdreQVCT7qpbPJCea6C7Q9Iz8yyiyEcCmO4lk=;
        b=NC4dwvC8oMuONOeSSxsTjwLQpo8sqzcdxkuEYSPADsSZVlNEAYGetWb25Vb85Ne30c
         7fxy9wJVnvUeX3shgf5MzqfbQNSion90kD+hkt9hTMcDkSL0no2q6yFAZA4UbSFXLUTi
         HYdwCez4f9IoL4ZAl0vcbf2m+xiHUC2TNioGfZ8OGyPaUQ6knUmhsxF2FTT2CTGtyoz9
         6fnh7nrHLF9bqvWf1kx7Bk4yVZMDjT/pwtx/o9WIj2FuLIbVO4FqVzD1kVPQvtOtZGOw
         kKrCsHstcqFpJs3DsdnXEwnim7so1cZCwFCYAFnJILURrPItYIkqJfOJpZIx4SOHy49q
         AvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607227; x=1784212027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MigA0hIdreQVCT7qpbPJCea6C7Q9Iz8yyiyEcCmO4lk=;
        b=XecXI5wy9ey9cDCVYLJ7n/Fe5gC0K8fRQ8A0NW6K8UB7mAbri7iZjKJLP5Lxj8MltR
         Cz28HynyZoA4y+iuan75JVoBv7ZBhb6vfalBj9i+zCEMiUjlDqefcoDIOYsk7xgNBIc6
         BOKOaAWxGnFxvLt6R9YtwmjBO1GIBWSE57SXyscQD5Xq1papsay0jAyVY0/CC9cyE74L
         vXHooGX+E37UC25rptMZDN/1qtJdm7pn9FQ+2BaFhRPCWf19syku6z2xV5W7csD9rc34
         wboyPZwPJEz0vj+o4HZZJl5xFN/CTLPVtCrCpZw3KGYNgA4dWDgJ55qwA15TziOhfqWz
         syag==
X-Forwarded-Encrypted: i=1; AHgh+RrWr42Zvfqhru0Lf+GInKxciYngBOqXgGdQuWCvH4CgAyu0bunpIvyYZWDRN1xUpsVEMCMvt4yDapI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrnPbIbJY+KhZghZUBskl7dvCj/qZyCEQv+MtY/s16sJ3KE5aD
	r2g636o2mQ8k0JSs6IGydn1gXFY0cwhgtAXbdElrP9v1Kb7X9gjip0Y3
X-Gm-Gg: AfdE7cnt7RZ2RAp5IHfxwbl3l4pPK0IcOd0/tN1yJZrGstXUs21FDrjB8/h+gbsLy5H
	Su/5fGOEWqEckhOtqwGt3OmOEjAbe20K/btOmWWhZgYwi7687P2meyMrfz7/ZqCQhxxxZDZBLHJ
	yL0DpLphUxvPbt+yd6tbNcpc/ZjC5DljQ5S6TI7V8RMZm+8Em3Nx4docAB9f6wpiZqC1E9Fc4xc
	FyoeUSYuAMpbdMJtDItBB1M/pV7L1kcgtevG3DgF6PQvT92sYahr6bIXgqx8/GVEzAFSGv1Wx6I
	pCL/aulibn+OzC0WZRYDi/cALWD6Eth0QEKs4wcYXLlWX7/QW76JZlJe89YykumQssedAwfRwdQ
	XI1e+Mxp/eIwFcpmeSsSftjXPN4ilIBiFct9nBIo/nMJ0VK1Ly2gHOXcoEcFfr0pWnhcJqbcaKh
	9aqdWGlg6p8DOZ6rxsSlJOyeBsktdhkRUCjISfMvbhkisMD2mgQm0kwuexsy2GhiJ7yh4=
X-Received: by 2002:a05:600c:34c1:b0:492:7083:e5a with SMTP id 5b1f17b1804b1-493ee0fe824mr25661445e9.31.1783607226995;
        Thu, 09 Jul 2026 07:27:06 -0700 (PDT)
Message-ID: <cd78972e-88d5-471d-a201-5f9cd1392c73@gmail.com>
Date: Thu, 9 Jul 2026 16:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding Locking in the MMIO Handling Framework on Arm
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Orzel, Michal" <Michal.Orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <89509e85-3345-41f8-a6dd-5dc4ba3619ac@gmail.com>
 <e540b651-f9dd-434f-bcb1-11f5198d1267@xen.org>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e540b651-f9dd-434f-bcb1-11f5198d1267@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1783607227-5C77AA0B-75A0BBF2/10/73395122804
X-purgate-type: spam
X-purgate-size: 7114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:Michal.Orzel@amd.com,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E6CD732381

Hello Jullien,

On 7/9/26 2:09 PM, Julien Grall wrote:
> Hi Oleksii,
> 
> Thanks for the report.
> 
> On 09/07/2026 11:49, Oleksii Kurochko wrote:
>> I have a question regarding the locking in the MMIO handling framework 
>> on Arm.
>>
>> Is it sufficient to have read_lock() only in find_mmio_handler()? If
>> register_mmio_handler() is executed in parallel with 
>> find_mmio_handler() (which I assume was the reason for introducing the 
>> rwlock), aren't we still exposed to a race condition?
> 
> When the read-write lock was introduced, we didn't sort the entries. So 
> it was fine at the time. This bug was introduced by commit 8047e090f4 
> ("xen/arm: io: Use binary search for mmio handler lookup").
> 
> With this change, then we...
> 
>>
>> find_mmio_handler() returns a pointer to a handler, but the object it 
>> points to could be changed by a subsequent call to 
>> register_mmio_handler().
>> If register_mmio_handler() runs between find_mmio_handler() and 
>> handle_{write,read}(), we could end up operating on a different 
>> handler than the one that was originally found.
>>
>> In other words, shouldn't we acquire the read_lock() in 
>> try_handle_mmio() and keep it held for the entire duration of 
>> try_handle_mmio()?
> 
> ... either need to keep the lock for longer

I assume that register_mmio_handler() won't be called very often
after domain creation so it looks to me that this fix is simpler then ...

  or rework the code to
> allocate the handler structure.

... this. IIUC, you suggestion is to do something like:

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 9707cadcf80e..a587135a6907 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -238,24 +238,24 @@ void register_mmio_handler(struct domain *d,
                             paddr_t addr, paddr_t size, void *priv)
  {
      struct vmmio *vmmio = &d->arch.vmmio;
-    struct mmio_handler *handler;
+    struct mmio_handler *handler = xzalloc(struct mmio_handler);

-    BUG_ON(vmmio->num_entries >= vmmio->max_num_entries);
-
-    write_lock(&vmmio->lock);
-
-    handler = &vmmio->handlers[vmmio->num_entries];
+    BUG_ON(!handler);

-    handler->ops = ops;
+    /* Fully initialize *before* publishing. */
+    handler->ops  = ops;
      handler->addr = addr;
      handler->size = size;
      handler->priv = priv;

-    vmmio->num_entries++;
+    write_lock(&vmmio->lock);
+
+    BUG_ON(vmmio->num_entries >= vmmio->max_num_entries);
+
+    vmmio->handlers[vmmio->num_entries++] = handler;

-    /* Sort mmio handlers in ascending order based on base address */
-    sort(vmmio->handlers, vmmio->num_entries, sizeof(struct mmio_handler),
-         cmp_mmio_handler, swap_mmio_handler);
+    sort(vmmio->handlers, vmmio->num_entries, sizeof(*vmmio->handlers),
+         cmp_mmio_handler, swap_mmio_handler /* now swaps pointers */);

      write_unlock(&vmmio->lock);
  }

(of course, whith updating of handler field to "struct mmio_handler 
**handlers;").



Also, I thought about just use local variable for handler (probably that 
what you meant):

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 9707cadcf80e..393018e02a83 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -107,19 +107,33 @@ static void swap_mmio_handler(void *_a, void *_b)
      SWAP(*a, *b);
  }

-static const struct mmio_handler *find_mmio_handler(struct domain *d,
-                                                    paddr_t gpa)
+static bool find_mmio_handler(struct domain *d, paddr_t gpa,
+                              struct mmio_handler *out)
  {
      struct vmmio *vmmio = &d->arch.vmmio;
      struct mmio_handler key = {.addr = gpa};
      const struct mmio_handler *handler;
+    bool found = false;

      read_lock(&vmmio->lock);
+
      handler = bsearch(&key, vmmio->handlers, vmmio->num_entries,
                        sizeof(*handler), cmp_mmio_handler);
+    if ( handler )
+    {
+        /*
+         * Copy the handler while holding the lock: a concurrent
+         * register_mmio_handler() re-sorts the array in place, so the
+         * entry pointed to by the bsearch() result may change once the
+         * lock is released.
+         */
+        *out = *handler;
+        found = true;
+    }
+
      read_unlock(&vmmio->lock);

-    return handler;
+    return found;
  }

  void try_decode_instruction(const struct cpu_user_regs *regs,
@@ -187,7 +201,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs 
*regs,
                                mmio_info_t *info)
  {
      struct vcpu *v = current;
-    const struct mmio_handler *handler = NULL;
+    struct mmio_handler handler;
      int rc;

      ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
@@ -198,8 +212,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs 
*regs,
          return IO_ABORT;
      }

-    handler = find_mmio_handler(v->domain, info->gpa);
-    if ( !handler )
+    if ( !find_mmio_handler(v->domain, info->gpa, &handler) )
      {
          bool trap_unmapped = v->domain->options &
  
XEN_DOMCTL_CDF_trap_unmapped_accesses;
@@ -209,7 +222,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs 
*regs,
          else if ( rc == IO_UNHANDLED && !trap_unmapped )
          {
              /* Fallback to the unmapped handler. */
-            handler = &unmapped_handler;
+            handler = unmapped_handler;
          } else {
              return rc;
          }
@@ -228,9 +241,9 @@ enum io_state try_handle_mmio(struct cpu_user_regs 
*regs,
       * instruction on the emulated MMIO region.
       */
      if ( info->dabt.write )
-        return handle_write(handler, v, info);
+        return handle_write(&handler, v, info);
      else
-        return handle_read(handler, v, info);
+        return handle_read(&handler, v, info);
  }


What I am also thinking about if read-write lock is enough here. For 
example, if we will have hypothetical MMIO unregistered (why we don't 
have it now? Will we ever need it?) then we could be in a trouble:

CPU0 (vCPU trapping MMIO)               CPU1 (hypothetical unregister)

try_handle_mmio()
   find_mmio_handler()
     read_lock()
     bsearch() -> finds handler H
     read_unlock()          <-- protection ends here
                                           unregister_mmio_handler()
                                            write_lock()
                                            remove H's pointer from array
                                            write_unlock()
                                          xfree(H)   <-- H's memory freed
   handle_write(H, ...)
     H->ops->write(...)     <-- use-after-free: reads freed memory,
                                calls through a dangling ops pointer

If we should care about that hypothetical unregister case then it is 
better just to go with solution of "to keep the lock for longer" 
basically while handler is found and used in try_handle_mmio().

~ Oleksii

