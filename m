Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C83B84ABA2
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 02:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676614.1052813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXALu-0004In-Uk; Tue, 06 Feb 2024 01:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676614.1052813; Tue, 06 Feb 2024 01:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXALu-0004HI-RS; Tue, 06 Feb 2024 01:34:22 +0000
Received: by outflank-mailman (input) for mailman id 676614;
 Tue, 06 Feb 2024 01:34:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4KK=JP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rXALt-0004HC-Rq
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 01:34:21 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9b8a42e-c48f-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 02:34:20 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51025cafb51so7559237e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 17:34:20 -0800 (PST)
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
X-Inumbo-ID: d9b8a42e-c48f-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707183260; x=1707788060; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbrH1sImvlrG3C1Riag1f9VpsJwpPYrDcJrwv9y4gzQ=;
        b=iZXwR3/mvjBQF9SEAJC7VdDijrwXq+bBz2W/M6ORx6paEyy4juyzw5vo6ySBxgsadP
         AOW+ShZ73gQkKbRta+8oEszcsij+KCgE1HELjoTQBl1dfPFR+dMrpBVcY9u2X6Oh+yhi
         HBK464FLJcvdAtXBn1U6wQ9oASi/IoYTCDQLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707183260; x=1707788060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbrH1sImvlrG3C1Riag1f9VpsJwpPYrDcJrwv9y4gzQ=;
        b=iu5OcBk7bo547bJD4aGMIat9aSEq8rAUOVeagVnW9VEkE+n4dC02zKUyOqmldUkqkk
         sZfwO7f9TeiUGehHN19NLNnArJw9oYq5wB8yhxZ56mILHHf13HZGqB6CYREDBUeVuxDr
         UffM8m8ATulIqeUhvwVS2NthrFafank8NZBA/aCPLTX1R7ystTXbU8/ded/Nn5gOUOsH
         YdMukp9aZowEe5MPX9WCYNZnPOMMafJ8tzoJbncTSveLDt22FyojP0EghAgWKKnS3UFJ
         qen/6YPs9C6QCMrSLekrRllc21rKjP8DIRalQwSKOkG0lfPEWLBPNenl/V/gB8z3skFB
         CQkg==
X-Gm-Message-State: AOJu0Yxo7fUMl99YKGqVnOQw43QtCgXw5V8VkKkhHnZrMjYnWbDJLTiq
	WRrRroW7cxBMrkOHWytehJgt92HOxcXi+sFPEHKZdYmWMQUgoIE8xx75mBp7zooJqxFqQxglNPG
	ocaUZYXgrrRGSSuq5ier6g8fWfrasS3qvGXcWHENwuUTPyLd81mU=
X-Google-Smtp-Source: AGHT+IGbTCWD3B5BM7Y+OMzCe6vKbM1c5kR82VgYSKsd8P6ifi4O5HJO91SIPukLts1RDL3d4L/9DRi9A5a4X0q0r08=
X-Received: by 2002:ac2:494c:0:b0:511:4c52:8fc8 with SMTP id
 o12-20020ac2494c000000b005114c528fc8mr750063lfi.8.1707183260010; Mon, 05 Feb
 2024 17:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20240206012051.3564035-1-george.dunlap@cloud.com> <20240206012051.3564035-7-george.dunlap@cloud.com>
In-Reply-To: <20240206012051.3564035-7-george.dunlap@cloud.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Tue, 6 Feb 2024 01:34:08 +0000
Message-ID: <CA+zSX=YtseSSJrKeCrpU_tfv-Lvyod2eb-z7LBS6Dd8Qv17cLg@mail.gmail.com>
Subject: Re: [PATCH 6/6] svm/nestedvm: Introduce nested capabilities bit
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 9:20=E2=80=AFAM George Dunlap <george.dunlap@cloud.c=
om> wrote:

> @@ -655,6 +658,12 @@ static inline bool hvm_altp2m_supported(void)
>      return hvm_funcs.caps.altp2m;
>  }
>
> +/* Returns true if we have the minimum hardware requirements for nested =
virt */
> +static inline bool hvm_nested_virt_supported(void)
> +{
> +    return hvm_funcs.caps.nested_virt;
> +}

NB this is missing the !CONFIG_HVM version of this function; I'll
include it in v2.

 -George

