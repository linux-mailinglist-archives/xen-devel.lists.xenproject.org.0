Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219D744004
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 18:44:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557585.871068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFHDU-0002e4-TY; Fri, 30 Jun 2023 16:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557585.871068; Fri, 30 Jun 2023 16:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFHDU-0002bp-Qz; Fri, 30 Jun 2023 16:43:28 +0000
Received: by outflank-mailman (input) for mailman id 557585;
 Fri, 30 Jun 2023 16:33:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42p4=CS=tibco.com=mgranado@srs-se1.protection.inumbo.net>)
 id 1qFH43-0001bs-R7
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 16:33:43 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de9ac9b5-1763-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 18:33:40 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b6c3921c8bso33651771fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 09:33:39 -0700 (PDT)
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
X-Inumbo-ID: de9ac9b5-1763-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688142819; x=1690734819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dxb/O+JswpHRqDeYdVbgY0s1pnpS0eAChQozAuR9Ek8=;
        b=XSze45En8TPX11GvwstEKTjzJVe2qBycJbPrl+8j8s5q7cH3npeLKTanTsmrdkSKVB
         sLVXoppZn2LMfSktvkPfLLn3cB6O8m3Z1+YN8USsl2Uu02rD4AiDJz9cZHOTowVtWQ8R
         XxVGpXFSWfFimTWNqfSYTZEcn4B3E2kIIw2AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142819; x=1690734819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dxb/O+JswpHRqDeYdVbgY0s1pnpS0eAChQozAuR9Ek8=;
        b=b2xmpFC6Zhe9+hEyUjZRYzPuJcbZe+h4UbmHqiUjyykMUy9euYXc4ekXZkDaNzLWbW
         6rreBdTeXO1NAiPTehVuM0Vnds73u+9TnoJaRvfs+bUrN6A9v82DkvB0YrO+f4UGpSqb
         pRlvkSTawTUR5zCdTvgKwvbQG4ZRoUa27UTLpgOniQI8vbsHr568w1143C2vcSuJ9X3S
         ePxKkAvxm4XRpxFZx1iKlClylitvpOy+CcmCDKNkf8/WNOE5JZEtcS0jGpbBInLz9S9U
         dL61wf/GIJpd3V37Vpi0c54Ez19QAMgFApE8uWv+fqH8NleQev674ncj/xsyRB4jZWHQ
         wi3Q==
X-Gm-Message-State: ABy/qLYR2g1/ulCqjLEXeyU9BQUDy0zMg94iw830zpcKYErUe+UhjuJ/
	1EpLT6VIj995Mv8zsZjLXMkJZ/sR2Ecof9y4TE17Xw==
X-Google-Smtp-Source: APBJJlEIPXk54QN4sodTOpnRUCCZb8lf6Una46pz9MNjMEgeFi5ruhcZ7ct+h8Y7cHAOfQaq6JGvGYyyHPNy/sMKVGg=
X-Received: by 2002:a2e:7a0f:0:b0:2b2:1f2f:705f with SMTP id
 v15-20020a2e7a0f000000b002b21f2f705fmr2244697ljc.4.1688142819490; Fri, 30 Jun
 2023 09:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230630113756.672607-1-george.dunlap@cloud.com>
In-Reply-To: <20230630113756.672607-1-george.dunlap@cloud.com>
From: Marcus Granado <marcus.granado@cloud.com>
Date: Fri, 30 Jun 2023 17:33:28 +0100
Message-ID: <CANNkNPKjWc9jD1PTf3nzQx+Euk-a9bdoi6quzCJhtDuvCkiJRw@mail.gmail.com>
Subject: Re: [PATCH 1/2] credit: Limit load balancing to once per millisecond
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Jun 2023 at 12:38, George Dunlap <george.dunlap@cloud.com> wrote:
> ...
> Add a parameter, load_balance_ratelimit, to limit the frequency of
> load balance operations on a given pcpu.  Default this to 1
> millisecond.
> ...
> Without this patch, on a system with a vcpu:pcpu ratio of 2:1, running
> Windows guests (which will end up calling YIELD during spinlock
> contention), this patch increased performance significantly.
> ---

I tested this patch with the following:
- the vcpu:pcpu ratio of circa 2:1 in the host,
- host with 72 pcpus
- and 9 Windows guests with 16 vcpus each,
- with background load inside the guests, where a few Windows apps
were starting and stopping in parallel in a loop in order to hit 100%
vcpu usage in each guest, so that the host pcpu usage was constantly
at 100%.
and observed a significant improvement in the responsiveness
experienced by a user moving the mouse and using the keyboard inside
the Windows guests, compared to when this patch is not present.

In addition, when launching a trivial executable like 'ver' remotely
in the Windows guests during the background load above, I noticed
that:
- when vcpu:pcpu is 1:1 and host has 100% pcpu usage -> with and
without this patch, launching 'ver' remotely took 1 second or so
- when vcpu:pcpu is 2:1 and host has 100% pcpu usage -> without this
patch, launching 'ver' remotely took several seconds
- when vcpu:pcpu is 2:1 and host has 100% pcpu usage -> with this
patch, launching 'ver' remotely took a couple of second only -- so
with this patch the host seems to be handling the extreme load at 100%
pcpu usage more gracefully and the latency inside the guest is more
linearly correlated to vcpu:pcpu..

