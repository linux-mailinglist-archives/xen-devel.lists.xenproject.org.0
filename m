Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ECD6AC320
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 15:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506969.780197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZBkI-0002na-1X; Mon, 06 Mar 2023 14:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506969.780197; Mon, 06 Mar 2023 14:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZBkH-0002lT-UM; Mon, 06 Mar 2023 14:23:21 +0000
Received: by outflank-mailman (input) for mailman id 506969;
 Mon, 06 Mar 2023 14:23:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opIj=66=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1pZBkG-0002lN-1V
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 14:23:20 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70d85b09-bc2a-11ed-96b5-2f268f93b82a;
 Mon, 06 Mar 2023 15:23:18 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id bx12so8967559wrb.11
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 06:23:18 -0800 (PST)
Received: from horizon ([2a01:e0a:257:8c60:48e5:bfa:d652:b8ef])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05600018c900b002c5a1bd5280sm9962275wrq.95.2023.03.06.06.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 06:23:17 -0800 (PST)
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
X-Inumbo-ID: 70d85b09-bc2a-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678112598;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kLPMiR6YYwqNgf2OlRvfzJqSL0t/mkX/PsJDY3H57xw=;
        b=k3R31LV7JvDl39nt0S9VkjCUZoCyt9O8ISPSj+joNhpmwvK8JPlGMyXLzseJTV/JVH
         2bSQa6UUZBL3BiNIzW85NbmIZd20mOnu5wCxX9zOk1OrGLfHS//36kEUWwxx/kWrOZUx
         eZ1j7dBJj18x3FxZs9P5cjzImG05g4j3eAjj/ILk4eoSOWWzHOMywQ7KXpKKm5NAQ2ze
         wrbxlieCjOGYhN4BZAThtPmIYyQPjau0sCn/rCGIrjpx8aHk9DCrC+A1YLgDsE+aHv7B
         JDYGW8ZFw2ry52Mm+s+rEy6C7astEvr0wWcBJxIwDQuSNIE1MFrMdclW6swuNBUFGio2
         ZgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678112598;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLPMiR6YYwqNgf2OlRvfzJqSL0t/mkX/PsJDY3H57xw=;
        b=U63DjTD5+s/lfeQNUwKuiqAVthTLul2mWMcaeYOSoPe1v5tKfP5Nt3yQgaKwHtMhpk
         7lcMPzTuHOKlHvyW5KcfjBMmUSBX+6wtYdQGKeCr7O3RYxl/eY5ijVP0SdIS2XNbKJuS
         vPsg8/7M0+alo4IsNWdmTvdvZCaZMr19bE7J6oc+f5mGG9V4vFonC2D8kt9nMWfQdnHV
         Fn90PaH5ycWiQ4yWH2Vts3HCFKnbBlA5tG7h9+XRNWnN5zXOE6nOYU4rMndP6uqc9nJc
         SzcO6D9KHdEfgX7SxrfxQgQugxOmlzFBS+zkOV+I9bDsxXt5ExxsYPc8mGRnYXyUtQ5n
         CsTw==
X-Gm-Message-State: AO0yUKXKggwP6oaw9tMK0Bzf2PDq1kNuzxFxEBvBubjRaHA0hMT1mqmk
	q4pqVfTspG7vo3GVU+ZJpZYdVFPY0p0=
X-Google-Smtp-Source: AK7set/X9acdGdf+HnkIBmL5miVkVxZaa8WO7FPuXAwt0OLPaGPNUyfrAhfrjcO+Cd5poaDrB3yikg==
X-Received: by 2002:a5d:4d02:0:b0:2c5:58fc:e1bb with SMTP id z2-20020a5d4d02000000b002c558fce1bbmr7739372wrt.10.1678112597867;
        Mon, 06 Mar 2023 06:23:17 -0800 (PST)
Date: Mon, 6 Mar 2023 15:23:15 +0100
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: API/ABIs: Re: [RFC PATCH v2 0/2] Add a new acquire resource to
 query vcpu statistics
Message-ID: <20230306142315.GA745324@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <90a551bc-ffda-6db8-775b-11c100bf6f52@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90a551bc-ffda-6db8-775b-11c100bf6f52@citrix.com>

Hello Andrew and thanks for the comments, please find my comments below.

On Thu, Feb 23, 2023 at 07:56:28PM +0000, Andrew Cooper wrote:
> A discussion about forward extensible APIs and ABIs here.
> 
> First, its important to say that this should be "domain stats" and not
> just "vcpu stats".  This is easy to account for now, but hard to
> retrofit later.
> 
> For the shared memory, we have a minimum granularity of PAGE_SIZE (4k
> for now, but this will change in due course on non-x86 architectures),
> and a resource-agnostic way of determining the resource size (as a
> multiple of the page size).
> 
> But there are other things we need to consider:
> 
> 1) To be sensibly extendable, there needs to be some metadata, and the
> domain stats is clearly going to be a different shape to the vcpu stats.
> 
> 2) We also want to give Xen some flexibility to allocate memory in a
> suitable manner for the system.
> 
> 3) Xen and the userspace consuming this interface will likely be built
> from different versions of the header.  This needs to inter-operate with
> the common subset of functionality.
> 
> 
> So what we want, at least to describe the shape, is something like this:
> 
> struct dom_shmem_stats {
>     uint32_t dom_size; // sizeof(dom)
>     uint32_t vcpu_offs;
>     uint32_t vcpu_size; // sizeof(vcpu)
>     uint32_t vcpu_stride;
>     ...
> };
> 
> struct vcpu_shmem_stats {
>     ...
> };
> 
> where the data layout shall be that there is one dom structure starting
> at 0, and an array of vcpu_stride objects starting at vcpu_offset.
> 
> Obviously, some invariants apply.  vcpu_offs >= dom_size, and
> vcpu_stride >= vcpu_size.  The total size of the mapping must be larger
> than vcpu_offs + vcpus * vcpu_stride  (and no, I intentionally don't
> care about the rounding at the end because it doesn't change things in
> practice.)
> 

Would it make sense to use different type-specific resources identifiers for
each "stat"?, e.g., XENMEM_resource_stats_table_id_vcpustats,
XENMEM_resource_stats_table_id_domstats and so on. The size of each of these
type-specific resources would be queried by using
`xenforeignmemory_resource_size()`. The mapping would be done by using
`xenforeignmemory_map_resource()`.

The metadata to represent the XENMEM_resource_stats_table_id_vcpustats
resource could be:

struct vcpu_shmem_stats {
#define STATS_A (1u << 0)
...
#define VCPU_STATS_MAGIC 0xaabbccdd
     uint32_t magic;
     uint32_t stats_active;
     uint32_t offset;  // roundup(sizeof(vcpu_shmem_stats), cacheline_size)
     uint32_t size;    // sizeof(vcpu_stats)
     uint32_t stride;  // roundup(sizeof(vcpu_stats), cacheline_size)
     uint32_t _pad;
     ...
};

struct vcpu_stats {
    /*
     * If the least-significant bit of the seq number is set then an update
     * is in progress and the consumer must wait to read a consistent set of
     * values. This mechanism is similar to Linux's seqlock.
     */
    uint32_t seq;
    uint32 _pad;
    uint64_t stats_a; // e.g., runstate_running_time
    ...
};

The data layout shall be that there is one vcpu_shmem_stats structure starting
at 0, and an array of stride objects starting at offset, i.e., vcpu_stats
structures. The invariants would be:
* 1. offset >= sizeof(struct vcpu_shmem_stats)
* 2. stride >= size
* 3. the total size of the mapping in frames, which is the value returned by
  resource_size(), must be larger than (offs + vcpus * stride).
* 4. Xen must not produce any data outside of [base, stride) for vcpu data.

The steps to add a new counter B would be:
1. append the new field at vcpu_stats structure.
2. define the bit in stats_active,.i.e., #define STATS_B (1u << 1)
3. advertise STATS_B
I may be missing some steps here but that would be the overall process.

Regarding your email, I have the following comments:

- I still do not know how to choose the value of cacheline_size. I understand
this value shall be between the actual cacheline_size and PAGE_SIZE. A value
that could match most architectures could be 256 bytes.

- Xen shall use the "stats_active" field to indicate what it is producing. In
  this field, reserved bits shall be 0. This shall allow us to agree on the
layout even when producer and consumer are compiled with different headers.

- In the vcpu_stats structure, new fields can only ever be appended.

- The magic field shall act as a sanity check but also as an ABI version in case
we decide to break backward-compatibility.

> A very simple layout, packing the data as closely as reasonable, might be:
> 
> vcpu_offs = roundup(sizeof(dom), cacheline_size)
> vcpu_stride = roundup(sizeof(vcpu), cacheline_size);
> 
> but Xen might have reason to use some other rounding.  As the dom or
> vcpu size approaches a page, then Xen will want to change allocation
> scheme to use page size for both, and not vmap the lot as one
> consecutive region.
> 
> 
> 
> For the stats data itself, there wants to be some indication of what
> data Xen is producing, so userspace can know not to bother consuming. 
> So something like:
> 
> struct $foo_stats {
>     ...
> 
> #define STATS_A (1u << 0)
> #define STATS_B (1u << 2)
>     uint32_t stats_active;
>    
>     struct $foo_stats_a {
>         uint32_t single_field;
>         ... // maybe other singleton fields
>     };
> 
>     struct $foo_stats_b {
>         uint32_t seq;  // "seq" is more common than "version"
>         uint32_t _pad;
>         uint64_t field1;
>         uint64_t field2;
>         ...
>     };
> };
> 
> 
> Forward compatibility rules say that you can only ever append new
> fields.  But as hinted at with the stats_active field, its fine to leave
> reserved fields around for future use, generally with a rule that
> anything reserved shall be 0.
> 
> Importantly, this means that offsetof(dom, stats_b) is fixed, and will
> inter-operate just fine if e.g. userspace knows about a stats_c that Xen
> doesn't know about.
> 
> But this does highlight some more invariants.  Xen must not produce any
> data outside of [0, vcpu_offs) for dom data, and [base, vcpu_stride) for
> vcpu data.
> 
> Furthermore, Xen should not produce any data not indicated by the
> stats_active field.  That said, if Xen is compiled knowing about
> dom->stats_c, and userspace is not, then userspace will observe Xen
> advertising a stat it doesn't know, and producing data beyond
> userspace's sizeof(dom), but within dom->vcpu_offs.  This is explicitly
> fine and expected, and why Xen writes it's sizeof() information into the
> dom header.  This allows both sides to agree on the layout even when
> they're not compiled from identical copies of the header.
> 
> 
> 
> A few closing thoughts.
> 
> 1) It is wise to have a magic number at the head of each dom and vcpu
> struct.  This helps sanity check that both sides have correctly agreed
> on the layout, but can also serve double duty as an ABI "version".  If
> we screw up spectacularly, and decide that the best course of action is
> to break backwards compatibility, then we can change the magic and edit
> the structs in a non-forwards-compatible way.
> 
> 2) We may get to a point of wanting arch specific stats.  This can be
> accommodated in the model by having struct arch_{dom,vcpu}_stats at
> positions described by the layout at the start of dom.  It would be wise
> to leave space (reserved fields) there to use if necessary.  This is
> cleaner than deciding that we need to put some new layout fields after
> the latest $foo_stats_$N and before $foo_stats_$M.
> 

I did not address this yet. The vcpu_stats could have some fields that would be
architecture-dependent. Those fields would be advertised by the stats_active
field.

> 3) It would be great if we could have something in tools/tests/ which
> can attach to a running VM and assess the correctness of the invariants
> given.  Better yet if it could compile for each change of the ABI and
> assess the correctness for all.
> 

I agree.

Feedback is welcome.

Thanks, Matias.

