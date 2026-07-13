Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BpzuCyDCVGoCSQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 12:46:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83738749F20
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 12:46:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VFoNwkLS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1361615.1613796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjEBR-0006pl-3U; Mon, 13 Jul 2026 10:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361615.1613796; Mon, 13 Jul 2026 10:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjEBQ-0006n8-Vq; Mon, 13 Jul 2026 10:46:44 +0000
Received: by outflank-mailman (input) for mailman id 1361615;
 Mon, 13 Jul 2026 10:46:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjEBP-0006n2-0q
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 10:46:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjEBL-007rEB-UH
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 12:46:39 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a54c202-2eae-0a2a0a5409dd-0a2a4506e73a-20
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 12:46:39 +0200
Received: from [209.85.208.172] (helo=mail-lj1-f172.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a54c20f-0835-0a2a45060019-d155d0acd5fd-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 12:46:39 +0200
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-39c86945164so22989231fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 03:46:39 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1783939599; cv=none;
        d=google.com; s=arc-20260327;
        b=S2fh12dHQI2kWMFMH+i0VXoBMb91wKjf/LImJRFhzWowu4k5u/Bz3VUC/BoxyD9OcB
         25wbmqtdmoSPgT1joesNrteUM2aSS8sJLiBgnb0GrpP5VP8e9k/TjfK3hwhyzVuwZAlB
         UPkR1KWYUFnXYkYdDaqqKWnYGq2UbXVFTkzUPghBGBoCzskrcOWPYeMc0NPaPEUxIZ0i
         zXf5k7kqSwMEcdSxPGr3vc9sEoXdku8c7yM1W6pA2lAPBV5sDNSAQu4JBS/+aDSTL0Gs
         wffwa6mnkD/Ur4I+JVrQdc+skbBgUiIurgZNNUST2xjZkCxxT+25gvM0FAERFRO6QStN
         O+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iDB3+p5lwzfbkaqoV1rncrIre3UWi97X1aaumaM+hLc=;
        fh=MCAliuBSvUc8sa0isdVtlFj4rb5YczShrJEG40DSQwA=;
        b=VkHG7odkItD1/bwErxduSs9qCMvJUs8EhZZJZ/gtN90KMSsnRQ+qS4IIJFSLTCWXjV
         o9EX1p1hmdYIaz6DUDdEBbO8S0N5Z0BGEdAICilKzoFVMcrfBI9d1GwWcR9MQgh/Dup7
         zAkN24VNNhaJ/qMzw+g0VCav6rhXnR9pQo96c79SJJG5XPNIqUP8Uxp5FKlsNdjLe/W9
         n0KEKLUiYhmeHSyzKpoA+541eXfDGbYJbMMfHnbTLJrNhxSUHSx7WdBSjALC/Xk7SF1i
         +xRct4xItYiUZn0hBesrYKRuhOyZXbZwKCs4pj7GOq0TsM9+5IHBTrNL80+pPHR954yA
         Vpkg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783939599; x=1784544399; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iDB3+p5lwzfbkaqoV1rncrIre3UWi97X1aaumaM+hLc=;
        b=VFoNwkLS5MK54qi2QiVdJ2zPh1FB6zqdr9Gn6/9r4mzI/Zwi7cZWK30PrCVsvD6/VV
         5GOO0O6A1r4V1o8Qu51tEni0snoYwuljznzWmkSzrPCI7OVYgfCOA0xaO979ZonrO7XQ
         BA+LXI9zQ6QMJzv0HnGO/8xkXTf9Wjcgsly5iHntaFVkS9NFv+1TCCa8ZjtgV0DvTXl9
         YNhmRXu8LzyR5jQlz7iIJZUDfGQoTiJP4lH/mbrFLuqke6kv6zea6IKDFNHQyv7FSmAZ
         JzbwgYIb6iWK7hMv4RgrTtFecZu0boQLuBPblHoLOXymAqh30kWHTIRXrxwDpX5VUYyl
         445Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939599; x=1784544399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDB3+p5lwzfbkaqoV1rncrIre3UWi97X1aaumaM+hLc=;
        b=lW0A3TgczV31tuuGNewxYWEIZJVCJori6qQZ2fvHVNoumup+hpNE1QJGWMODWpnKXJ
         xEuMovwTcu73eJhsIuqT7ttp8iCEUAT3zlv2rlHLHqutR4fJxDnd8F+rkPbu/rAR0j7C
         IBccJRaEKPXuegEnYmNB+qY4ynPyDhYDSt34zfo0+2nZOjJyQsOxKkIMgEfUh4N2qf83
         2jILpzo/NWmYixDtV+7SETaQDIbpKnsyALlKsbF+wZzugpnI6QCXUyw7DWlspj0JB1Dm
         8fyrNp+LgPH+MRG3C/9RoZD+UcjuYrVB5+FXyMZD7kWxUxCABd5igj33knTkHKJNWDaw
         3+ug==
X-Forwarded-Encrypted: i=1; AHgh+RrikvouJioeEFFbIQzsMfjsmhIF+tUOkttavW8HF9hwB1zw3Rkl0M127uDPNGs489g2dztoWZ0agyk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvVQba1SH0wBoIxF5KafeJE0h6aNjypbtJkEhSVs9aJVwgJbL9
	rZihLRF7Kmed/VdLdsl1Hs0qjSD/MbnpryzuvzKbOfUag2+/Qlw/MD7DCs0eSx/DQdikGiRUh0y
	ix2wnwRFHlKb5HM6mxCVdFiGkiqcSveg=
X-Gm-Gg: AfdE7cnUj3PlvlH7q5dAZk5FcdfRk5VnfBOD4xpJiaNmmoaHF0eEBCZIRazz2+8MgN2
	bD/N+MTs1LGuPmc+MFuSCI9zT0rqL4J5reNUi+EY+pLoKJb6k4mzPzN7dhFg/CMR8X4hNINE+/O
	wcHP5YK9sEAwR3P7H5Gi+uteDPNOqQ0LBFwMu7Q+xU28dRiozoVCCDVYS9Hb314sAHymzC1fBst
	XfOnB+LwCoHVoMVcv8JDOT9qkp+weet1GqoM1/fwrqjBK/ctmPaX2pP/8Fc22XDDxXAFeKbGGfm
	54jB
X-Received: by 2002:a05:651c:1b04:b0:39a:ea4e:7363 with SMTP id
 38308e7fff4ca-39caa10314cmr18567311fa.10.1783939598928; Mon, 13 Jul 2026
 03:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783671887.git.mykola_kvach@epam.com> <1843da2e028635773638ef73ed10907c7ae7bb53.1783671887.git.mykola_kvach@epam.com>
 <e6468083-f901-4a1e-94d5-d347068fabf0@amd.com> <2ba97094-c9c8-461b-adc4-64cca978dd6a@amd.com>
 <u46k277cxsw53rb2d4pnxksbbwr35rjp54vwxqm2phbrp2ywll@etlvezzojxvi> <9a75baf4-b889-4f2d-8cfa-d8a229411b68@gmail.com>
In-Reply-To: <9a75baf4-b889-4f2d-8cfa-d8a229411b68@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 13 Jul 2026 13:46:27 +0300
X-Gm-Features: AVVi8Ce6gqyo7KdYbM2ict3pETOgeww-GRzVL05_RJueL5lDIg1RHx7Mqs9CXiM
Message-ID: <CAGeoDV-wPnhUuC2XRndZNEJOSAC2-tkkTpUi-jKCRn5eiQG6Cw@mail.gmail.com>
Subject: Re: [PATCH for-4.22 1/2] xen/arm: validate IRQs before descriptor lookup
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1783939599-F8D44617-D5E1E2D1/10/73395122804
X-purgate-type: spam
X-purgate-size: 2598
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83738749F20

Hi Oleksii,

Thank you for the review.

On Mon, Jul 13, 2026 at 10:39=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
>
>
> On 7/10/26 1:48 PM, Mykola Kvach wrote:
> > On Fri, Jul 10, 2026 at 12:44:44PM +0200, Orzel, Michal wrote:
> >> On a tangent note:
> >> I can see that you pushed quite a few "for-4.22" patches. We are appro=
aching the
> >> release, so afaict at this point we should only be taking crucial bug =
fixes.
> >> Moreover, when sending "for-X" patches, please include a description w=
ith your
> >> analyzed pros/cons of taking a patch in.
> >
> > Ack. I understand. For this patch specifically, I consider it a crucial
> > fix for 4.22 for the following reasons:
> >
> > Pros:
> > - It prevents an out-of-bounds irq_desc[] access which may corrupt Xen
> >    memory or crash the hypervisor.
> > - The issue was introduced by eSPI support already present in 4.22.
> > - The change is small, and valid IRQ handling remains unchanged.
> > - I tested CONFIG_GICV3_ESPI=3Dy and CONFIG_GICV3_ESPI=3Dn builds and
> >    reproduced the issue on FVP using a fake DT interrupt with reserved
> >    INTID 3000.
> >
> > Cons:
> > - The trigger requires either a malformed DT interrupt specifier, such
> >    as reserved INTID 3000, or an eSPI unsupported by the Xen build.
> > - The demonstrated failure used deliberate fault injection rather than
> >    a reported production failure.
> > - The patch adds validation to common Arm IRQ setup paths, although
> >    valid IRQs continue through the same path as before.
> >
> > Assessment:
> > The hypervisor memory-safety impact and the presence of the affected
> > eSPI code in 4.22 outweigh the limited regression risk.
> >
> > I will include this kind of pros/cons analysis with future for-X
> > submissions.
>
> It doesn't seem as critical. IIUC, exploiting this issue requires
> providing a malformed DT interrupt specifier. If the DT interrupt
> specifier is valid, the system should behave correctly.
>
> Given that we are very close to the release, I think it would be better
> to proceed without these changes. If the issue proves to be critical, we
> can backport the fixes afterward.

Okay, thanks.

What do you think about the second patch in this series? I believe it
is more critical. Unlike the first issue, it can be triggered with a
valid eSPI configuration: freeing a valid eSPI uses the raw INTID as
the bitmap index, causing an out-of-bounds access that may corrupt
memory.

Could it still be considered for 4.22?

Best regards,
Mykola

