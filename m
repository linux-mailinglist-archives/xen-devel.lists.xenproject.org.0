Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080AC604B64
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 17:29:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425881.673981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olAzR-0006cM-K9; Wed, 19 Oct 2022 15:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425881.673981; Wed, 19 Oct 2022 15:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olAzR-0006Z0-Gz; Wed, 19 Oct 2022 15:28:17 +0000
Received: by outflank-mailman (input) for mailman id 425881;
 Wed, 19 Oct 2022 15:28:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ql0W=2U=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1olAzQ-0006Ys-Cr
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 15:28:16 +0000
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [2607:f8b0:4864:20::a33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a583081b-4fc2-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 17:28:14 +0200 (CEST)
Received: by mail-vk1-xa33.google.com with SMTP id s185so8492141vkb.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 08:28:14 -0700 (PDT)
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
X-Inumbo-ID: a583081b-4fc2-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I6tvXcyWMOlmBE2vfqP0Hlyf7Pqf5lS5gm7azA9VEYQ=;
        b=FO0ZcKD8zLAuKgUKhmDljyBrYc48p7n0VTpHLEyI4iCp7c5IdN/dxXI/64ly0GHu/o
         MYhyvnuruD60+/7N8QZ8bWo9B3VfBCkG3AwCNYzfIcKMYKp4nPm0qbxHAseW/6dSfyjB
         F+6Ws60CtHl8QYtAxBjOuukOQbj34DfGHRPNr68b0cJhNF0dqC+khK5Y66DuKY+U8JVq
         vpL6hyEVslhMo5a+KToqUYiN+hmY9TVnRc+1Q+aICIBsn/ccrRNb7Pr7LomF0SsPGPPU
         15OyAALHs6EceimTi7kT5c1PH8EEIIQAPcUvEtaoz9X9v9jRfGlhg+0dXweUA4fRG4ER
         cmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6tvXcyWMOlmBE2vfqP0Hlyf7Pqf5lS5gm7azA9VEYQ=;
        b=GC+46HH5kyuXJdU+B160tsLRkjpGBvmY9xRKFogpHDTw9Dd1ayzubwPfXDJr1JsiOt
         Chiee9VYPtwbSKT28+zSgFjYELV9NdmzoBIjsKHQNO71r8eQDcYoR35rMj1H76j1+GUQ
         IU+A1JfT6pdrDReNHkoRIj9IeI+eD2A6MljehGQdAH2aD1GY9/GQCSe6htbQA+M5hTPz
         fVbXUEuFaffuVE70r1miQblexII+UtMAUUzNPX+PiafviDJqRTd4tsSf2+PttyYtAC/v
         a/pZuFC6aXXvNhhCwqPj53+GSTanKwKYUOzN/52oU40ZyYYvvES8o0p7HmHDSPPddfOC
         yDgA==
X-Gm-Message-State: ACrzQf20sp9n1zyCM3oRJ2YFMwShKTR6bkh8MJvzwstN3/Q8jP+fD1is
	RFgAKUZOWEF76KhhEhvGr2aKrylr85jP9E3vJaaKB/ZI
X-Google-Smtp-Source: AMsMyM4vmVOTItpM3pno1d8IhXom4nGEhV5qPs96DsFonilKz2DMFAePyLfQDiKmT63m+vF0tQQvJ8Ew6BexVzH63m4=
X-Received: by 2002:a1f:32c8:0:b0:3a2:914f:b490 with SMTP id
 y191-20020a1f32c8000000b003a2914fb490mr4084700vky.2.1666193293291; Wed, 19
 Oct 2022 08:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221018142346.52272-1-Henry.Wang@arm.com> <20221018142346.52272-3-Henry.Wang@arm.com>
In-Reply-To: <20221018142346.52272-3-Henry.Wang@arm.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Wed, 19 Oct 2022 16:28:01 +0100
Message-ID: <CAFLBxZZ59zkuNJM1vQSv_Syv8i0Q_dAFk0p-JXY4oFs0cCUSnQ@mail.gmail.com>
Subject: Policy: A release acks for the release manager's patches (was Re:
 [PATCH v5 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in p2m_init())
To: Henry Wang <Henry.Wang@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000005fb54005eb64dbae"

--0000000000005fb54005eb64dbae
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 18, 2022 at 3:24 PM Henry Wang <Henry.Wang@arm.com> wrote:

> Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
> when the domain is created. Considering the worst case of page tables
> which requires 6 P2M pages as the two pages will be consecutive but not
> necessarily in the same L3 page table and keep a buffer, populate 16
> pages as the default value to the P2M pages pool in p2m_init() at the
> domain creation stage to satisfy the GICv2 requirement. For GICv3, the
> above-mentioned P2M mapping is not necessary, but since the allocated
> 16 pages here would not be lost, hence populate these pages
> unconditionally.
>
> With the default 16 P2M pages populated, there would be a case that
> failures would happen in the domain creation with P2M pages already in
> use. To properly free the P2M for this case, firstly support the
> optionally preemption of p2m_teardown(), then call p2m_teardown() and
> p2m_set_allocation(d, 0, NULL) non-preemptively in p2m_final_teardown().
> As non-preemptive p2m_teardown() should only return 0, use a
> BUG_ON to confirm that.
>
> Since p2m_final_teardown() is called either after
> domain_relinquish_resources() where relinquish_p2m_mapping() has been
> called, or from failure path of domain_create()/arch_domain_create()
> where mappings that require p2m_put_l3_page() should never be created,
> relinquish_p2m_mapping() is not added in p2m_final_teardown(), add
> in-code comments to refer this.
>
> Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M
> pool")
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>


Henry brought this patch to my attention because it needs a release ack,
but it doesn't seem proper for Henry to be the one to release-ack his own
patches. :-)

I propose that a suitable rule would be:

"If the release manager themselves have submitted a patch which needs a
release ack, then the patch needs a release ack from one of the Committers
who is not involved in the patch."

Given the time-critical nature of this patch, I propose that we adopt the
rule as an expediency now, and we can discuss afterwards whether to make it
permanent.

With that in mind, it looks like this patch is critical for fixing a
release issue; it's in core code, but has also has a lot of scrutiny.  So
with that in mind:

Release-acked-by: George Dunlap <george.dunlap@citrix.com>

--0000000000005fb54005eb64dbae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 18, 2022 at 3:24 PM Henry=
 Wang &lt;<a href=3D"mailto:Henry.Wang@arm.com" target=3D"_blank">Henry.Wan=
g@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 =
area<br>
when the domain is created. Considering the worst case of page tables<br>
which requires 6 P2M pages as the two pages will be consecutive but not<br>
necessarily in the same L3 page table and keep a buffer, populate 16<br>
pages as the default value to the P2M pages pool in p2m_init() at the<br>
domain creation stage to satisfy the GICv2 requirement. For GICv3, the<br>
above-mentioned P2M mapping is not necessary, but since the allocated<br>
16 pages here would not be lost, hence populate these pages<br>
unconditionally.<br>
<br>
With the default 16 P2M pages populated, there would be a case that<br>
failures would happen in the domain creation with P2M pages already in<br>
use. To properly free the P2M for this case, firstly support the<br>
optionally preemption of p2m_teardown(), then call p2m_teardown() and<br>
p2m_set_allocation(d, 0, NULL) non-preemptively in p2m_final_teardown().<br=
>
As non-preemptive p2m_teardown() should only return 0, use a<br>
BUG_ON to confirm that.<br>
<br>
Since p2m_final_teardown() is called either after<br>
domain_relinquish_resources() where relinquish_p2m_mapping() has been<br>
called, or from failure path of domain_create()/arch_domain_create()<br>
where mappings that require p2m_put_l3_page() should never be created,<br>
relinquish_p2m_mapping() is not added in p2m_final_teardown(), add<br>
in-code comments to refer this.<br>
<br>
Fixes: cbea5a1149ca (&quot;xen/arm: Allocate and free P2M pages from the P2=
M pool&quot;)<br>
Suggested-by: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com" target=
=3D"_blank">jgrall@amazon.com</a>&gt;<br>
Signed-off-by: Henry Wang &lt;<a href=3D"mailto:Henry.Wang@arm.com" target=
=3D"_blank">Henry.Wang@arm.com</a>&gt;<br></blockquote><div><br></div><div>=
<br></div><div>Henry brought this patch to my attention because it needs a =
release ack, but it doesn&#39;t seem proper for Henry to be the one to rele=
ase-ack his own patches. :-)</div><div><br></div><div>I propose that a suit=
able rule would be:</div><div><br></div><div>&quot;If the release manager t=
hemselves have submitted a patch which needs a release ack, then the patch =
needs a release ack from one of the Committers who is not involved in the p=
atch.&quot;</div><div><br></div><div>Given the time-critical nature of this=
 patch, I propose that we adopt the rule as an expediency now, and we can d=
iscuss afterwards whether to make it permanent.</div><div><br></div><div>Wi=
th that in mind, it looks like this patch is critical for fixing a release =
issue; it&#39;s in core code, but has also has a lot of scrutiny.=C2=A0 So =
with that in mind:</div><div><br></div><div>Release-acked-by: George Dunlap=
 &lt;<a href=3D"mailto:george.dunlap@citrix.com">george.dunlap@citrix.com</=
a>&gt;</div><div><br></div><div><br></div></div></div>

--0000000000005fb54005eb64dbae--

