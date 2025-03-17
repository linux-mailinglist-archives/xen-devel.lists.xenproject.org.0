Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223AAA65D20
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:49:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917985.1322751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFWN-00034j-6D; Mon, 17 Mar 2025 18:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917985.1322751; Mon, 17 Mar 2025 18:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFWN-00031x-3B; Mon, 17 Mar 2025 18:49:07 +0000
Received: by outflank-mailman (input) for mailman id 917985;
 Mon, 17 Mar 2025 18:49:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DHjE=WE=minervasys.tech=andrea.bastoni@srs-se1.protection.inumbo.net>)
 id 1tuFWK-00031n-VR
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:49:05 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e221b52-0360-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 19:49:01 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso18144725e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:49:01 -0700 (PDT)
Received: from [192.168.1.21] (ip5f5be833.dynamic.kabel-deutschland.de.
 [95.91.232.51]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c888167bsm15753100f8f.45.2025.03.17.11.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 11:49:00 -0700 (PDT)
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
X-Inumbo-ID: 7e221b52-0360-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys.tech; s=google; t=1742237341; x=1742842141; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHxAf6GAGG9TD0oW4+hIbsIjdNk61GCOxZOxWYPuztU=;
        b=ZclvMzSOLqDmnYOZcP0qJppzaJaSUz386u6Gf4VwifS92hJJAGcRmICgIqCk7sRefI
         fJVXkHmYh5j8BK6vSiVMQBy0tg97nRC7b3ZgVuTwvg6dIynmzduUlqPnaql3toBAhs+Y
         bZAcVzncMPVlknTsJqpB9r3kB2vYXYuYsuW6adjAMfTyUt+j4tari1I8ziNyc4vnQGXe
         qGJcJF5lOkBNxLaO3X53hgeVHM3cp27KHFL2CnwaXtVRS9gsyCX1EqpRsWgU/C3O//n1
         FkO+7GUtYvMz9N4pLZwRvpLbZG2pa15Pb9GRjB0RAh8YVIXSEgkhdSu9B1jJpMlGd4fc
         j4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742237341; x=1742842141;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHxAf6GAGG9TD0oW4+hIbsIjdNk61GCOxZOxWYPuztU=;
        b=J19AuIIwTAKQ6YepRsb3OVEiV6xqR0iLX1/SaA2ErYY3jtyVGjYjdW7l5hbVodp5tj
         1czN8iUyrBLzlWWeUbXAcwBt9xhMVXUV1oQZvgN71kho/9GTkPQQEFpNrobIhqDj9kGA
         vKC8Rba83o0DLdKhvIHlSwQT5qGfTyu90m6AY9RygU9GYWCCzBxVAb7mg9nPBoDp/i3I
         Yf2bCNbFaTO+gqYExGsd1jWNQo5/lnI6Ftwhc0/luiw81UJZtndXnkg6dOwLh2HckyVC
         nKYYe4ixTIpsp2FxgAZ2lFjlAjz2aZ2nv6Y7g1jyrx5Qfu9D+kZnhQ65EW0zJz3Wa6ZI
         1KJg==
X-Gm-Message-State: AOJu0YyaVrWHZJYMPybiJmwt1+K53tim1Cwv8rVEUt34hbRcxvtQ7VSj
	I/6rP/ASjUw7MFuFgoPDHXxdAtCflT52mhVEts7Ysxv+SdMF1NVrQYztc8AEWJDEZXJHmdz6dVK
	6wwc=
X-Gm-Gg: ASbGnct1esPbAFosyBVKDbIq5im3xasaNS97rI8CHeOqZ86VkmlGYN32KkZjc/JRlZp
	Rx6oRqZHffVAO4TgO2kCoIdNEjWaPjK9QSfkQV+UHEDCAgFyQjtiS7UIFeMldq0ozz/y6M65gvS
	SZzKjd3bxljegB+KwKGLMx3iYlhdlPnfQPk6eBgz90PX4VTReDlAFvIef0QI1NIxrSAm8RhLPBO
	QMCt1dSJMOotJ+fsGXepyRRLDtAJEnIznInVuqee5FQ/maJP0pzef5NolNDu7gzcUZcMZS7B/V4
	8lzg0Z8dKYlXxm54jMkxfKsAnK5w3pAUgzzJELR4gcAcArAbWglmDg10guGno3VQJHHhUuKCiWu
	CyWT+e1GeLAebhuKOkoSZpRC4bBmN
X-Google-Smtp-Source: AGHT+IFc0sPIrimsdSnuDYzgcf0oKVNnNKReTFKbRqCslhyGYs+v2Elxkz08srXy4ndCCpx2ll7/QA==
X-Received: by 2002:a05:600c:4fcb:b0:43d:7de:16e3 with SMTP id 5b1f17b1804b1-43d1eccb1f1mr135296535e9.24.1742237341083;
        Mon, 17 Mar 2025 11:49:01 -0700 (PDT)
Message-ID: <53e85609-dba4-4fd2-972c-8c2746074c4a@minervasys.tech>
Date: Mon, 17 Mar 2025 19:48:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Michal Orzel <michal.orzel@amd.com>, VictorM.Lira@amd.com,
 Carlo Nonato <carlo.nonato@minervasys.tech>,
 Alex Zuepke <alex.zuepke@minervasys.tech>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, jgross@suse.com,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Andrea Bastoni <andrea.bastoni@minervasys.tech>
Subject: [RFC] analysis of runtime xenheap memory allocations
Autocrypt: addr=andrea.bastoni@minervasys.tech; keydata=
 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
 Id5SuAU=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

In the last months we have been working with Stefano's team in AMD at tools to
facilitate the analysis of "anonymous" memory allocations performed at "runtime"
from the shared Xen heap.

- Anonymous here means: allocations that insist on the common Xen heap pool
  (i.e., not on a per-domain heap pool).
- Runtime here means: system_state >= SYS_STATE_active.

TL;DR: A set of patches print a warning stack when anonymous allocations are
detected at runtime. Scripts help to parse the stack traces that can be checked
to evaluate how problematic certain allocations paths can be or how difficult it
could be to update them. A full example of the results is e.g., in [1], and the
Readme-details in [2]. Below in the email more details and some commented stack
traces.

Feedback, especially on the paths that are currently marked as "UNDECIDED"
is very welcome.

[1]: https://gitlab.com/minervasys/public/xen/-/blob/minerva/warn/minerva_analysis/1674833972/parsed/x86_64/xilinx-hyperlaunch-x86_64-gcc-debug-virtio-pci-net
[2]: https://gitlab.com/minervasys/public/xen/-/blob/minerva/warn/minerva_analysis/README.md


Here the long version.

The work is a starting point to identify the paths leading to anonymous
allocations, identify whether they could be "problematic" (see below), and
simplify decisions on possible changes targeting such allocations.

Why
---
In contexts like those targeted by Xen for safety, we want to run VMs with
different criticality side-by-side (in parallel).
Xen provides services to both critical and non critical VMs. Shared resources at
Xen-level may become problematic when low/no-criticality VM can prevent
higher criticality VMs from receiving the requested service.

This is also relevant in security context where we want to ensure
that VMs cannot deplete resources shared with other VMs.

The shared Xen heap (xenheap) is one of such shared resources that is accessed
from both potentially critical and non critical VMs to serve various memory
allocations.  While for system_state < SYS_STATE_active we can statically define
the amount of Xen heap that will be consumed by the system, at runtime this
becomes blurry as it depends on the system's usage. This is problematic when a
critical VM cannot receive its intended service due to xenheap memory depletion.

What
----
We want to identify those anonymous allocations, understand the paths that lead
to them, and the allocated sizes. Also, many allocations are expected
to be followed by a "free", and it is useful to keep track of how much memory
is left allocated after a service completes.

To address this, we have been following multiple directions:
a) Runtime testing
b) Offline call path analysis
c) Draft of changes needed for a shared -> per-domain heap switch

Runtime testing
---------------
See: https://gitlab.com/minervasys/public/xen/-/blob/minerva/warn/minerva_analysis/README.md

The idea is to hook in the testing infrastructure of Xen and detect anonymous
allocations at runtime.

The system is composed by a set of patches added to `xen/common/page_alloc.c`
and `xen/common/xmalloc_tlsf.c` that will result in a warning stack being
produced at runtime when anonymous allocations are detected.
In such cases, the warning will try to detect additional information like:
the domain currently running and the pointer to the allocated memory area.
Such information is later matched (if possible) against corresponding frees.
Specifically, if possible, anonymous memory allocated via `alloc_domheap_pages`
is matched against `free_domheap_pages`, while memory allocated via `xmalloc` is
matched against `xfree`.

Depending on the type of test, the amount of information discovered by the tool
might differ.

The execution can be integrated in the Xen pipeline (e.g.,
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1682205969).

A script
(https://gitlab.com/minervasys/public/xen/-/blob/minerva/warn/minerva_analysis/log_parser.py)
parses the CI output and produces statistics and stack traces leading to an
allocation. Those stack traces can be checked to evaluate how problematic
certain allocations paths can be or how difficult it could be to update them.

The tool support building a "database" of comments associated with a stack
trace and can automatically (re)apply comments to known stack traces in further
runs. (See #Automated Generation of Comments in the README.)

An example of the processing can be seen e.g., here (for pipeline 1674833972):
https://gitlab.com/minervasys/public/xen/-/tree/minerva/warn/minerva_analysis/1674833972
Here, the parsed files are already commented with, for example:

```
// MINERVA: UNDECIDED
// Anonymous allocation increases per-CPU heap.
// Allocation not attributable to any domain.
Domain     : d0
Occurrences: 1
Total size : 128 B
return_to_new_vcpu64
  leave_hypervisor_to_guest
    traps.c#check_for_pcpu_work
      do_softirq
        softirq.c#__do_softirq
          timer.c#timer_softirq_action
            _xmalloc
              _xmalloc
```
In this example, a direct `_xmalloc` is triggered from an ISR.
No domain can be held accountable for such allocation and a different strategy
to ensure/motivate the boundness of such allocations should be planned.

```
// MINERVA: PROB_SAFE (under the assumption that hwdom are safe)
// the path is already attributed to a domain pool, except if the domain is
// a hardware domain, in this case the allocation is anonymous (p2m_alloc_page).
alloc_domheap_pages()
entry.o#guest_sync_slowpath
  do_trap_guest_sync
    traps.c#do_trap_hypercall
      do_memory_op
        xenmem_add_to_physmap
          xenmem_add_to_physmap_one
            p2m_set_entry
              p2m.c#__p2m_set_entry
                p2m.c#p2m_next_level
                  p2m.c#p2m_alloc_page
                    alloc_domheap_pages
                      alloc_domheap_pages
```
In this example, the allocation is marked as "probably safe" since the path is
taken only when the domain is a hardware domain.
Such domains can (under the usage-domain of interest) perform allocations.


Offline Call Path Analysis
--------------------------
See: https://gitlab.com/minervasys/public/xen/-/blob/minerva/warn/minerva_static_analysis/README.md

This analysis can complement the runtime discovery of anonymous allocations and
uses compiler support to generate call-graphs (using -fcallgraph-info).

Two scripts support parsing and filtering the (large amount of) data generated.

`callpath.py` generates the call paths leading to one selected function.
`filter.py` can filter the call paths based on whitelist / blacklist of
functions that should be included / excluded.

For example, in the above branch we have used the scripts to generate and
refine the paths leading to `alloc_domheap_pages()`.

The offline analysis can complement the runtime one by reporting reacheable
paths that have not (yet) been generated in testing scenarios.


Draft of changes for per-domain heap
------------------------------------
See: https://gitlab.com/minervasys/public/xen/-/tree/minerva/per-domain-xenheap-idea-approach

We have prototyped some of the changes that would be needed (especially in the
configuration) if more allocations that are now anonymous would be taken by a
per-domain heap instead.

The main change in the prototype is to enforce the current domain as target
heap allocator for all anonymous (i.e., domain == NULL) allocations triggered
from alloc_xenheap_pages().
Also, we force the use of the newly modified alloc_xenheap_page() in
alloc_xen_pagetable()

```
-    pg = alloc_domheap_pages(NULL, order, memflags | MEMF_no_scrub);
+    if (system_state == SYS_STATE_active)
+        d = current->domain;
+
+    pg = alloc_domheap_pages(d, order, memflags | MEMF_no_scrub);
```

The change is _not_ correct in many cases (since current->domain might
not be the right domain), but allows finding the needed configuration
changes and potential needs for increasing the sizes of per-domain
heaps.

The commit:
https://gitlab.com/minervasys/public/xen/-/commit/c1d6baae27932d2a7f07e82560deae5f64c5536a
implements these changes.

Thanks,
Andrea

