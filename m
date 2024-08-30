Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2AC965C86
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 11:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786300.1195874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjxlt-0000bW-VI; Fri, 30 Aug 2024 09:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786300.1195874; Fri, 30 Aug 2024 09:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjxlt-0000a0-SZ; Fri, 30 Aug 2024 09:18:21 +0000
Received: by outflank-mailman (input) for mailman id 786300;
 Fri, 30 Aug 2024 09:18:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oDj5=P5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sjxls-0000Zu-Ub
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 09:18:20 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb6f0c2b-66b0-11ef-99a0-01e77a169b0f;
 Fri, 30 Aug 2024 11:18:19 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-429ec9f2155so13881025e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 02:18:18 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee7172csm3436911f8f.36.2024.08.30.02.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 02:18:17 -0700 (PDT)
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
X-Inumbo-ID: cb6f0c2b-66b0-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725009498; x=1725614298; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=clW6gophoHKkGx6cqQlzA1T+qYAGXySf1L801sTC0Jg=;
        b=Z89iX5ykFCNa4aHLxlGTQarpe+fH9Eu9bh89ULdI3V5G9vBES8H8GjxROTQIzhegC8
         kmjlHu4tXZECSjOmKwE0lcgyZaaFpqsItfpuFsMygxxnKSX+7yupu5oB+VJbOPl/C1En
         OEyE+l8hWmSvFfUeVYS0cIsXbxo/VrM16dw90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725009498; x=1725614298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clW6gophoHKkGx6cqQlzA1T+qYAGXySf1L801sTC0Jg=;
        b=CUPxlVrtytfI9MR0VSqPM2YoOCfI4uGvhlXy33RYa6VTqQLc3TVZ/AtOlVR2qcprQG
         1H8WlKvIDTba7aLHUZX+6CqLnJCEe8q8U/ZOueIA1IouR+g3+0FqOCoYoyGPn8nOtQ/X
         TjyfQVcci2sSR1X5zIIt4hTKuSsBuQ5GLCq/Xu5fjDKTc3AcEUZP5EGM4Z9nKXOV79XK
         lf0tuIUmp2lLBx5DDvjXi8Wcbn7K/NvIV2Qqceb7pdH/qkiG0g8J15kV5bZyOsO2yIh7
         dBkKzl3+evZq2nHdB7GwFn+dQX1/NgyYTSWXAYdWa+P+cJctrl+33EVPzUnkHdWh1XBr
         cR0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5T6nDJ/hlEIyZY4dUqKpOnrExIjboGeI+Je94bzbxWYfA/RbZ27YfnKM3u2XEL5uwLWarITIG5bs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yynl1UAwGFoQ9LaYQ7Ni6u/f4GQiNeWnKWJN2zrA0oS7rsOMY4y
	XXWtghTfvXaWGj4jbnjTM/cLyrRC9UBAuS7nL2gkJM6Vjv/E4w3N6q0pjO0Ajy4=
X-Google-Smtp-Source: AGHT+IESDthxpe8YtRzfXG5ZRO7mnebgPWfL4Uhun6kqcxaM/jWVK4IhVl8sL1XojACM3BaywVzw2g==
X-Received: by 2002:adf:b30d:0:b0:367:8e53:7fd7 with SMTP id ffacd0b85a97d-3749b54cf7fmr3601637f8f.28.1725009497328;
        Fri, 30 Aug 2024 02:18:17 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:18:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Federico Serafini <federico.serafini@bugseng.com>,
	xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v5 7/8] x86/mm: add defensive return
Message-ID: <ZtGOWAnqGu-XNCgy@macbook.local>
References: <cover.1722239813.git.federico.serafini@bugseng.com>
 <24501d2e7f5d82d8e5a483a80b35e04ce765a7cf.1722239813.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2407291512280.4857@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2408281735020.53815@ubuntu-linux-20-04-desktop>
 <da5d2ccc-6a21-4bcc-8ceb-75b930dcdabe@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <da5d2ccc-6a21-4bcc-8ceb-75b930dcdabe@suse.com>

On Thu, Aug 29, 2024 at 09:04:37AM +0200, Jan Beulich wrote:
> On 29.08.2024 02:35, Stefano Stabellini wrote:
> > On Mon, 29 Jul 2024, Stefano Stabellini wrote:
> >> On Mon, 29 Jul 2024, Federico Serafini wrote:
> >>> Add defensive return statement at the end of an unreachable
> >>> default case. Other than improve safety, this meets the requirements
> >>> to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
> >>> statement shall terminate every switch-clause".
> >>>
> >>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >>
> >> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>
> >>> ---
> >>> No changes from v3 and v4, further feedback on this thread would be appreciated:
> >>> https://lists.xenproject.org/archives/html/xen-devel/2024-07/msg00474.html
> > 
> > Looking at the older threads, I looks like Jan suggested EACCES, I also
> > think it is marginally better. My R-b stands also for EACCES. Jan, I
> > think you should go ahead and fix on commit
> 
> No, I very definitely want a 2nd x86 maintainer opinion here. Or a better
> suggestion for the error code to use by anyone. After all, as you confirm,
> EACCES is only marginally better.

Hm, the only alternative I could suggest is using ERANGE, to signal
the value of opt_mmio_relax is out of the expected range, however that
could be confusing for the callers?

One benefit of using ERANGE is that there's currently no return path
in get_page_from_l1e() with that error code, so it would be very easy
to spot when an unexpected value of opt_mmio_relax is found.  However
there are no guarantees that further error paths might use that error
code.

Thanks, Roger.

