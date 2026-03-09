Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG2/DOjermm/JQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 15:53:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89E023AF7D
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 15:53:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249553.1547029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzbyq-0004NM-4X; Mon, 09 Mar 2026 14:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249553.1547029; Mon, 09 Mar 2026 14:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzbyq-0004Lb-15; Mon, 09 Mar 2026 14:53:12 +0000
Received: by outflank-mailman (input) for mailman id 1249553;
 Mon, 09 Mar 2026 14:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0g9R=BJ=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1vzbyo-0004LV-Uo
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 14:53:10 +0000
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [2607:f8b0:4864:20::112d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0104d8f-1bc7-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 15:53:09 +0100 (CET)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-7986d231b3cso146093667b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 07:53:09 -0700 (PDT)
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
X-Inumbo-ID: b0104d8f-1bc7-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1773067988; cv=none;
        d=google.com; s=arc-20240605;
        b=ZDmw0P2xg3rzGpam7ekL8IaqS/+qwldA779uY2fzVd+APRS9O3xcJM7topL+/PYRM4
         z+dSwE784ygRur3Im1JhMZZx6qbD1tRefa+5iKai2c5h/TXLVFgxSmprVE4wfzEE9hB0
         U9yO3AIs+ZOfPtl/GGzH5eF15PJ8d0joP5aY1ncbMT8eU6wrCj5VbjSbtvULTa7tDx8H
         INPT7bfAvbhdhhNe9U1XQupjqTAH7Sy/Vhybamx6SpXgmVNE3Z94sniiimpQXVhBVxVK
         FCx1iMN1HOVksOxSp6ag53aNEbfGWzn0OTuSYBZIwHKDqgxOFsmgg93zfmNtjJamHNt8
         Ta4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Lmlr5xwlzExeVLyiIX4eKEZ6XfFdWyLdssC3qJF98xs=;
        fh=TDIhF0REsZYF3tEuaM1c9m2WWJLNBdvBT/MFEObGrQQ=;
        b=UO+eINfGdk2JTtI7ha4UY2LLpGBPanS+cQcV0j9RySgwDdb4fLsD1VS9vad1gug2wY
         uOtd/p+b5mvcajqhQAeUXaBY6pBkRt54WlBwa8o0CHr0Ravv/VFFvQqgpXW7eRwNsT2J
         HzEpbF/TGwHFsmlXX3kvoWKlxl87RTWl8BwdRwr9axNqjDqerwZvpJVmY9wzo0MzVyqV
         gRrLHPjQYl5nIygkMPryDs3IYFHe02XpiQNMRZov2NzwilSwkRlZzUN5JYA6CbH3J7rV
         LDxJL/H5X0lovWttPFO9mkja5vpcUiV+hiSElaSkI3sknknhIhjqkXQkOLs/6uzl8i7i
         G/yw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773067988; x=1773672788; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lmlr5xwlzExeVLyiIX4eKEZ6XfFdWyLdssC3qJF98xs=;
        b=jYUW3H1khmbdNhXoRHSWWLw/s76ZHHi1v+fT264rqLTl1/kpIu3htF0flrEVv94duC
         0/Iq7VVLLJQUcRVOW4InrsO7/YHK7n7KKHF/maCZc+THLc8Slg//z0qt4hOeC3QAxYUG
         qtfPldwmp5bkCNh8292TM28yxcpfjgK8pyfGZ2yuTKnPkaHnY5BYOtIq81pMFMERG2+u
         b++2XrTLMozzdX9KBZCtEfJ8QrUOTlPJuS/ex0XXZ1lDR3d+3nj+MpBYm94JQYCvr8nq
         /BzAKqw+NqSWqvD52lR5zDKZxY5wZA2Rb3o2cVAP+Gwg74/Kpc5oLGY/UuYdkkjcd+HY
         c0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067988; x=1773672788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lmlr5xwlzExeVLyiIX4eKEZ6XfFdWyLdssC3qJF98xs=;
        b=rQS8DGZBhNr7spXVpKBYmxTkkjrY/8Zso54aqdsx6/GGddSrs/9mWXUFnYQa8YATTi
         5amIe6wK/OS260gQ2O7qKMrwg1h16YsENlh4bxnTKN9nuGTpg5NcI359KHoDraXjt2jw
         yaI6zGguJAvfta8+f+nDWFpUiLtQsmvoQAOa8N9Gkf8RB4lF61tKEOcIWuz8WNFBAmec
         8AFcWbXKxiWSNZxcGVDZMsE08ePwiNiV1iJh6Z4CAFKSOtCkUFy6umIANrcPkTPMYhvv
         Zqlo3DffgQEUpnfo4EQaD0Qw3MxuzpNbVPHloAfvsSEf6478C3NUm/YR6jorNPDX5td2
         BRJg==
X-Forwarded-Encrypted: i=1; AJvYcCXYvlitBQ3L6rJWrTXDsGFX/AlvoIYzAV2SpWUuGWC/Y6v6V6xWn+fQljJRfHwtrG5HzjjBvfWvCnw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHBeKBmlbGfTo0p4T0LYtWcRSv0SSKBeAbFTqiImqYmcSldwX/
	5OiqbASyXktf2WObgVdTZxxWVJO1pZIQA62SU/VWvCg/BfZrx6ngm7csN9Rhn+8Z2iAnaiWCcxk
	/PJw6N5BlrJn/Kn1GXx2wwW1S7pmYgnGsmJt4NFPjfg==
X-Gm-Gg: ATEYQzw4Zq6DCQ7MOlKXGHgpKNq0vGT1arxBR1LPR8VT2R0JfYzj7AOjQE18sZQe20L
	PCQ541TEx6ILOZTCi9loGfVWupSo8Puka94NZlEjsUTsZRaO4wMvW14JcBScshiSKJ/LdoF4MJ/
	KFCjL/SsWA+ozk5WDTD7TDfFhYv8u9aNe9tnAY6PwgoHBfAVlV2rIfK2chvQ1E1SWCCGrwwSlkB
	aAkcmyvGlwpfwwkXexQc0wWq7WfQpEor5yA7IpTd1iKQ9wThFopK5BI/N6s2z5xKv8mM4dYmy0R
	mhxq10Ts2QvXq5trt63qx/wluZmyy3gR2oyzDrr/VF1NIHHc0SVfkMuuv1Zy/2YjXLU=
X-Received: by 2002:a05:690e:444d:b0:64a:bde9:3423 with SMTP id
 956f58d0204a3-64d15477513mr6647221d50.9.1773067988458; Mon, 09 Mar 2026
 07:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260309064436.51860-1-edgar.iglesias@gmail.com>
In-Reply-To: <20260309064436.51860-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2026 14:52:56 +0000
X-Gm-Features: AaiRm52x_MZSsoQWEpX_SVubQ81MNXoACRIsTZMqUhmaBur07rlXpMyBFnbdJgk
Message-ID: <CAFEAcA90Xmi0iFXQj1Z7FaNJ+cqHNHL8sQ8yi6Yo2avKwRXY4w@mail.gmail.com>
Subject: Re: [PULL v1 0/5] xen: pvh: Add machine option to disable the mapcache
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
	edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C89E023AF7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edgar.iglesias@gmail.com,m:qemu-devel@nongnu.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[peter.maydell@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,gitlab.com:url,qemu.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[peter.maydell@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, 9 Mar 2026 at 06:45, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
>   Merge tag 'pull-11.0-virtio-gpu-updates-060326-1' of https://gitlab.com/stsquad/qemu into staging (2026-03-07 11:22:16 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/edgar.iglesias/qemu.git tags/edgar/edgars-xen-queue-2026-02-09
>
> for you to fetch changes up to 83d1d9a49e8eb970f87508ae4ce0f222084df365:
>
>   hw/xen: xenpvh: Add prop to enable/disable the mapcache (2026-03-09 03:24:02 +0100)
>
> ----------------------------------------------------------------
> Edgars Xen queue
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.0
for any user-visible changes.

-- PMM

