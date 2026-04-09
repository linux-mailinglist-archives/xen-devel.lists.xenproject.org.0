Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOGrDPoc2GmZXwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 23:41:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6DD3CFF9E
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 23:41:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278150.1563109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAx6g-0004qN-OJ; Thu, 09 Apr 2026 21:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278150.1563109; Thu, 09 Apr 2026 21:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAx6g-0004oB-L7; Thu, 09 Apr 2026 21:40:10 +0000
Received: by outflank-mailman (input) for mailman id 1278150;
 Thu, 09 Apr 2026 21:29:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wlsrbwjd7232@gmail.com>) id 1wAwvr-0002h1-QT
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 21:29:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAwvq-00Ao5u-Kg
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 23:28:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <wlsrbwjd7232@gmail.com>)
 id 69d819de-5cb7-0a2a0a5109dd-0a2a4509dd26-24
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 23:28:58 +0200
Received: from [74.125.82.50] (helo=mail-dl1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <wlsrbwjd7232@gmail.com>)
 id 69d81a18-bf79-0a2a45090019-4a7d52329fee-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 23:28:58 +0200
Received: by mail-dl1-f50.google.com with SMTP id
 a92af1059eb24-12711867ca1so444071c88.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:28:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="To:Subject:Message-ID:Date:From:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1775770136; cv=none;
        d=google.com; s=arc-20240605;
        b=a5zr7ryotsWX88rl8m0BMIK6PO8fNpS/VxY5SVD4JDBBSNCv3lMmooyMYI+qjyUb/7
         v/EYruYoXKkqutYReHVrgmEXAxRdbG6UtGEc3I4I/2CTDflpofS6Tw0V43pjJ/7SjUrZ
         MXGnCWwS6cB7faG/8eg/86QhpzG/KQhdt5pGOihLG7wu7Wk2U6aagXu9K36itGE7XZJ7
         FNx35Wlb2x5UIMPeJwR6V8deI1ziEAKpB/NLbtwpXR/k5e2i/Iqk3sV9oOL87D9sURrS
         joDprxMXqR4DWjvI9o9DdvMETcalxI65hgGtg2c+qeAhPJbhK7O0jXFNRdAMEgEchEpR
         mucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=aZcPhsgjXmF9WMlgqBsdubbSdhhYn+eTZxnIn/m7ywU=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=k827168fVzPf42PbtRVksLB84tUEtZ2BcnYGwH+SgAGrf7awj6WdCMV6rT/7dTnSxb
         8kf1QtJsgv0jig0HCvcLFfZYj+0tfJs3P3f/z4H9XfGTcEi2OFwK1nhG15XAoP+nb3z8
         83GGHWv3iHMVGASku8ufJu44DSc3j6WxUcJ30HsK4MVmVPPr7Y/Tg18KhQdsQQ31kPme
         tX0sCoBWFHUQhLxxOJ0qwhoUX7rlZI4uhJjIeIQZprn9d2+KsHhHyZfoe/QNJZqcXwXj
         R0nMg8g0CI9t+6l/7JzINY2EYsQpmgFQrH2HQ/qhPDB4Hoy5oopdKVVb9na0Cbk4xY4r
         ccWQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775770136; x=1776374936; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aZcPhsgjXmF9WMlgqBsdubbSdhhYn+eTZxnIn/m7ywU=;
        b=WbcDFkR9x+Kz0S+H4CR7UqF1Uv69vIr/dRj8BCNz0f6wf+xHbL2mL7K6R3BK1K6ZMU
         KeuLpG2qILakBpr2l/QS+9EW0ft3AaV6gny1WVzYjJwucpzyZBFccyagUhQtZdCOMr/Y
         JwT/VuYfmNVa+LLGx3LQ9K18iAvoeo7DMifcgocN3SdrKHyHuC/ZTyPn21RVQSl+G6SJ
         2YSe0qErbyUZDDMDTlT++rBIFcT75WgKaBAtW5ZlFIXFkZPUFZzlhO65/tj6i0REGV5t
         uamS4q03uGIrrTrcFpxVa4yTDVpKpPl5Gh7TWDO4P+WK+YkPrd0H1f3GbY21sutS+TkA
         fqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775770136; x=1776374936;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZcPhsgjXmF9WMlgqBsdubbSdhhYn+eTZxnIn/m7ywU=;
        b=a3HyWnTHG8kcIye9kXyzOYdyH+F71x4aUZaB3Jmoj1E8VoR1He+Izhs1cUP18c0cP9
         AUbWmcFHfhvKhqvriP2QwRJ2TRu+LR+kjy7iVE6fcZk+HrLysIZoN6Ux+PcGnhfbRvHO
         Ivj71Y+oAj2uVEf3PArpU9py26x4Y7mKu6Y528TcGD/6swwr2QjncQrE+yaKKyQSP10x
         8CdQBQ+vJOslosGvjjoGg8ZzYorabhEvwbmiGijiJm1F7XWuELxKJyzkNvXF0y2gkShk
         iDR7EP3s6yQkVrhp3gzkS3SPgdMTGhS09ynqDy1KPia2uTDtMJPJzI4cbrg1qHENj6zd
         //2w==
X-Gm-Message-State: AOJu0YzyfIok6IZ2LmSGtynCtNTkb6JFS+LWXEKIPWrfziY5GJe2MVkb
	no8fniElWUGvvoiPPFM1U3RfLnMFgEIs6pjGYXqxCAy4C1H4RgYOvoKrIGY/Joa9N+oVwLFkDH6
	xZ7B6WtehZ+MMZfokC/NDmopoFlcgeInXY49h
X-Gm-Gg: AeBDieuXPTxMs7psaTQPfEn4/l5C39o0JJwuo5KAfgUNW7l37V6OLQOgw66paLl0m7W
	gQbu0wBS8htKEwKMMbz7V5eWO+VsTb0XUNuuXA5shh2uXZRMh+mFsBhlwNQIWtbOH1MfKs33hHJ
	n574URZxeJjooZed3IdukIiV2LQ9DmXkpG7h3XUHK+j8KPWaz0LU0l5TYo8xF6epwFTiRLO3hyx
	cv2F7g845xyYL8eGhxjXvCjj7o8QR9u0174TAYIzEElEi02FzPrRBJPw9NycKUtY6uhRknkmlLs
	XAb9Xg8QWQ==
X-Received: by 2002:a05:7022:517:b0:12b:f899:7178 with SMTP id
 a92af1059eb24-12c34f06a2emr172268c88.7.1775770135878; Thu, 09 Apr 2026
 14:28:55 -0700 (PDT)
MIME-Version: 1.0
From: Gyujeong Jin <wlsrbwjd7232@gmail.com>
Date: Fri, 10 Apr 2026 06:28:43 +0900
X-Gm-Features: AQROBzB07u40_JtQJtBaaMEe18TkugmhZzhmQNiJqWEpx9jZzpL_aZxZ9Cwa980
Message-ID: <CANrF8CHA1XacwRzNcw3zt0goEV-7in_=vtEYhLxSjwaV62jrTw@mail.gmail.com>
Subject: [BUG] Potential double-free in Xen dt-overlay attach/remove error path
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000026e311064f0db476"
X-purgate-ID: tlsNG-bad1c0/1775770138-55D57152-76FABAA7/0/0
X-purgate-type: clean
X-purgate-size: 7794
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[wlsrbwjd7232@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wlsrbwjd7232@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8B6DD3CFF9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--00000000000026e311064f0db476
Content-Type: text/plain; charset="UTF-8"

Hello Team, I was advised to report this issue in this way because
dt-overlay is currently experimental and not security supported.

I would like to report a potential memory safety issue in Xen related to
the Device Tree overlay handling logic.
------------------------------
Problem Description

A double-free / use-after-free condition may occur in the dt-overlay
handling path when an overlay attachment fails and the same overlay is
later removed.

The issue arises because rangeset objects are freed on the failure path of
handle_attach_overlay_nodes(), but the corresponding pointers are not
cleared. Subsequently, handle_remove_overlay_nodes() may operate on these
stale pointers, leading to a second free.
Affected Component

   - Xen ARM
   - Device Tree overlay subsystem
   - File: xen/common/device-tree/dt-overlay.c

Relevant functions:

   - handle_attach_overlay_nodes()
   - handle_remove_overlay_nodes()

Impact

This issue may lead to:

   - Double-free of rangeset structures
   - Use-after-free when accessing stale pointers
   - Potential hypervisor crash (DoS)
   - Possible memory corruption depending on allocator behavior

Given that this occurs in the hypervisor context, the impact could extend
beyond a simple crash under certain conditions.
Root Cause

The issue originates from inconsistent memory management between the attach
failure path and the remove path.

In handle_attach_overlay_nodes(), the failure path frees rangeset objects:

static long handle_attach_overlay_nodes(...)
{
    ...

    if ( entry )
    {
        rangeset_destroy(entry->irq_ranges);
        rangeset_destroy(entry->iomem_ranges);
    }

    return rc;
}

However, the corresponding pointers (entry->irq_ranges and
entry->iomem_ranges) are not set to NULL afterward, leaving dangling
pointers in the entry structure.

Later, in handle_remove_overlay_nodes(), the same fields are used again:

static long handle_remove_overlay_nodes(const void *overlay_fdt,
                                        uint32_t overlay_fdt_size)
{
    ...

    rc = remove_nodes(entry);

    ...

    rangeset_destroy(entry->irq_ranges);
    rangeset_destroy(entry->iomem_ranges);

    ...
}

static int remove_nodes(const struct overlay_track *tracker)
{
    /* Remove IRQ access. */
    if ( tracker->irq_ranges )
    {
        rc = rangeset_consume_ranges(tracker->irq_ranges, irq_remove_cb, d);
        if ( rc )
            return rc;
    }

   /* Remove mmio access. */
    if ( tracker->iomem_ranges )
    {
        rc = rangeset_consume_ranges(tracker->iomem_ranges, iomem_remove_cb, d);
        if ( rc )
            return rc;
    }

    return rc;
}

Since the pointers were not invalidated after being freed, this leads to:

   - reuse of freed memory in rangeset_consume_ranges()
   - double-free in rangeset_destroy()

This creates a double-free / use-after-free condition.
Environment

   - Xen: 4.22-dev-517-g500ee5fe0f
   - Platform: Linux (WSL2 environment)

Suggested Fix

After calling rangeset_destroy(), the corresponding pointers should be set
to NULL to prevent reuse:

entry->irq_ranges = NULL;
entry->iomem_ranges = NULL;

Alternatively, the remove path should defensively check pointer validity.

Best regards, Gyujeong Jin (Giunash)

--00000000000026e311064f0db476
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hello Team, I was advised to report this issue in this =
way because dt-overlay is currently experimental and not security supported=
.</p><p>I would like to report a potential memory safety issue in Xen relat=
ed to the Device Tree overlay handling logic.</p><hr><h2>Problem Descriptio=
n</h2><p>A double-free / use-after-free condition may occur in the dt-overl=
ay handling path when an overlay attachment fails and the same overlay is l=
ater removed.</p><p>The issue arises because rangeset objects are freed on =
the failure path of handle_attach_overlay_nodes(), but the corresponding po=
inters are not cleared. Subsequently, handle_remove_overlay_nodes() may ope=
rate on these stale pointers, leading to a second free.</p><h3>Affected Com=
ponent</h3><ul><li style=3D"margin-left:15px">Xen ARM</li><li style=3D"marg=
in-left:15px">Device Tree overlay subsystem</li><li style=3D"margin-left:15=
px">File: xen/common/device-tree/dt-overlay.c</li></ul><p>Relevant function=
s:</p><ul><li style=3D"margin-left:15px">handle_attach_overlay_nodes()</li>=
<li style=3D"margin-left:15px">handle_remove_overlay_nodes()</li></ul><h3>I=
mpact</h3><p>This issue may lead to:</p><ul><li style=3D"margin-left:15px">=
Double-free of rangeset structures</li><li style=3D"margin-left:15px">Use-a=
fter-free when accessing stale pointers</li><li style=3D"margin-left:15px">=
Potential hypervisor crash (DoS)</li><li style=3D"margin-left:15px">Possibl=
e memory corruption depending on allocator behavior</li></ul><p>Given that =
this occurs in the hypervisor context, the impact could extend beyond a sim=
ple crash under certain conditions.</p><h3>Root Cause</h3><p>The issue orig=
inates from inconsistent memory management between the attach failure path =
and the remove path.</p><p>In handle_attach_overlay_nodes(), the failure pa=
th frees rangeset objects:</p><pre style=3D"text-wrap-mode: wrap;"><code>st=
atic long handle_attach_overlay_nodes(...)
{
    ...

    if ( entry )
    {
        rangeset_destroy(entry-&gt;irq_ranges);
        rangeset_destroy(entry-&gt;iomem_ranges);
    }

    return rc;
}
</code></pre><p>However, the corresponding pointers (entry-&gt;irq_ranges a=
nd entry-&gt;iomem_ranges) are not set to NULL afterward, leaving dangling =
pointers in the entry structure.</p><p>Later, in handle_remove_overlay_node=
s(), the same fields are used again:</p><pre style=3D"text-wrap-mode: wrap;=
"><code>static long handle_remove_overlay_nodes(const void *overlay_fdt,
                                        uint32_t overlay_fdt_size)
{
    ...

    rc =3D remove_nodes(entry);

    ...

    rangeset_destroy(entry-&gt;irq_ranges);
    rangeset_destroy(entry-&gt;iomem_ranges);

    ...
}

static int remove_nodes(const struct overlay_track *tracker)
{
    /* Remove IRQ access. */
    if ( tracker-&gt;irq_ranges )
    {
        rc =3D rangeset_consume_ranges(tracker-&gt;irq_ranges, irq_remove_c=
b, d);
        if ( rc )
            return rc;
    }

   /* Remove mmio access. */
    if ( tracker-&gt;iomem_ranges )
    {
        rc =3D rangeset_consume_ranges(tracker-&gt;iomem_ranges, iomem_remo=
ve_cb, d);
        if ( rc )
            return rc;
    }

    return rc;
}
</code></pre><p>Since the pointers were not invalidated after being freed, =
this leads to:</p><ul><li style=3D"margin-left:15px">reuse of freed memory =
in rangeset_consume_ranges()</li><li style=3D"margin-left:15px">double-free=
 in rangeset_destroy()</li></ul><p>This creates a double-free / use-after-f=
ree condition.</p><h3>Environment</h3><ul><li style=3D"margin-left:15px">Xe=
n: 4.22-dev-517-g500ee5fe0f</li><li style=3D"margin-left:15px">Platform: Li=
nux (WSL2 environment)</li></ul><h2>Suggested Fix</h2><p>After calling rang=
eset_destroy(), the corresponding pointers should be set to NULL to prevent=
 reuse:</p><pre style=3D"text-wrap-mode: wrap;"><code>entry-&gt;irq_ranges =
=3D NULL;
entry-&gt;iomem_ranges =3D NULL;
</code></pre><p>Alternatively, the remove path should defensively check poi=
nter validity.</p><p>Best regards, Gyujeong Jin (Giunash)</p></div>

--00000000000026e311064f0db476--

