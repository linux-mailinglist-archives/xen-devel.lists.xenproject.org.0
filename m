Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DFD70D409
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 08:34:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538229.838029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Lb5-0000nD-51; Tue, 23 May 2023 06:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538229.838029; Tue, 23 May 2023 06:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Lb5-0000kO-2G; Tue, 23 May 2023 06:34:15 +0000
Received: by outflank-mailman (input) for mailman id 538229;
 Tue, 23 May 2023 06:34:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9dW/=BM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1q1Lb3-0000kG-K3
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 06:34:13 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4711d75-f933-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 08:34:12 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so6872696f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 May 2023 23:34:12 -0700 (PDT)
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
X-Inumbo-ID: d4711d75-f933-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684823652; x=1687415652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnBGbdHR+3pPeCTiRuqses1R7OdBNjFBvOBL+hIrMf0=;
        b=WUWitROiatqmlfGHUalIGaF8CHKD8DTv+Gm5LXx35YTotGmFE6bxLB4F5k3XVKdQdo
         CAfZZ/zDa6FWGd75xTN6XEOlAjXxvgOGiZOLlgOowfFLhANxetxpma31I/dSCvErRqGe
         ZpfLmh0OC2/RBHwOq32aEebfZDe0tK/eRYbvtHZqUhbPRFXy1czkp/4APSdSjMhpujnK
         nSjWlj7me4CbSnErV0B6mUOwmKGPzuqg089jtXzdcssHL7v81NVO4bojNHNy7A/F56JC
         KlF9M/S99jvNbWXyFzfvr0LFclU/8vzt/KE2fPX80//jelPNUed7UFxBkyq8JuBCiLXM
         MWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684823652; x=1687415652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnBGbdHR+3pPeCTiRuqses1R7OdBNjFBvOBL+hIrMf0=;
        b=LezcPj/J8GIjt4mptrLhNMpW5tx3Pn8jhCd7QjEBKtgXlRgDQs4Yiy1IlGU52ezY7H
         d9Vbx/nDyFgwevyVkZb5MVgmH1rYnZ+phJANoG10xq4QuyVmOIU7F6AuSxSt7vlwTdJg
         abLDxFo8yvMogvleDd9lpqPIfeSctG5s0VDFIoLXkzdVDjS3A2oLNhR/JgqIDfC9L06A
         8rUGclD65U7Pe3AH6jwDlZL5PtBcxlxRheIFUHLBXzavUIjoN9NTCkho0duqVSD+th0L
         w89H7psdeWd4oCRje8ML+rkkZdIFhHf3VKWAuvVhI4RIZw6CDyQOPmKwP655NBSEii67
         aITA==
X-Gm-Message-State: AC+VfDxxIkEBXZP4XCsepA/F4kj74cjlX+uV2qacO+tHEzLkWLjyGWfa
	bwuZwe2N+TpAdIBu3dTmmhuwKGm19AHmKMsgsHp9XA==
X-Google-Smtp-Source: ACHHUZ6t/vpL/D8DuApHt/ChBdBbX0lg33TQPiHimKvX0Fnov9GmcNXBT7hUnABjmPczbFE3MYgIGKiFZPFAjlks/qM=
X-Received: by 2002:adf:e689:0:b0:2f4:170:3807 with SMTP id
 r9-20020adfe689000000b002f401703807mr8368494wrm.44.1684823651692; Mon, 22 May
 2023 23:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-4-jens.wiklander@linaro.org> <45f59b7a-592a-4a1e-b606-c2d564b979b8@perard>
In-Reply-To: <45f59b7a-592a-4a1e-b606-c2d564b979b8@perard>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 23 May 2023 08:34:00 +0200
Message-ID: <CAHUa44HSXOWeyi4PhCtyTLz=uCoiu9zEWuvvvgz7Pn1tTf1VHQ@mail.gmail.com>
Subject: Re: [XEN PATCH v8 03/22] tools: add Arm FF-A mediator
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 4:35=E2=80=AFPM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Thu, Apr 13, 2023 at 09:14:05AM +0200, Jens Wiklander wrote:
> > Adds a new "ffa" value to the Enumeration "tee_type" to indicate if a
> > guest is trusted to use FF-A.
>
> Is "ffa" working yet in the hypervisor? (At this point in the patch
> series) I'm asking because the doc change is at the end of the patch
> series and this patch at the beginning.
>
> I feel like this patch would be better at the end of the series, just
> before the doc change, when the hypervisor is ready for it.

Makes sense, I'll move it.

>
> In any case:
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,
Jens

>
> Thanks,
>
> --
> Anthony PERARD

