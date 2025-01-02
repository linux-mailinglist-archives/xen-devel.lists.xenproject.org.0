Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB2C9FFB04
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 16:32:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864150.1275423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTNB2-0006eF-1R; Thu, 02 Jan 2025 15:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864150.1275423; Thu, 02 Jan 2025 15:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTNB1-0006aj-Ue; Thu, 02 Jan 2025 15:31:59 +0000
Received: by outflank-mailman (input) for mailman id 864150;
 Thu, 02 Jan 2025 15:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11hu=T2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tTNB0-0006aK-LW
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 15:31:58 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b35feaee-c91e-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 16:31:56 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28881d6so16512634a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 07:31:56 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f56csm1808981966b.24.2025.01.02.07.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 07:31:54 -0800 (PST)
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
X-Inumbo-ID: b35feaee-c91e-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735831916; x=1736436716; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mi4l6mQiox6EMT1JrUAeL7uMkXcXkD+Z0FQnXiNFgRY=;
        b=Q/BHfE63qJ/OHs7nwCZiqHxsw3B2tKyCAsq0OODpHoof4/5i3vRXJX5iYtgCLR3lp9
         K212SYfqvTZM2dsrjtXSxRj3B4fyedU1ja0mPEZZvpymC4dVcNfBVQhdqKxmpgGT/xQy
         CGbrUVaY6nAh0eEHKWsH3+XrPpKQij4cc3gzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735831916; x=1736436716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mi4l6mQiox6EMT1JrUAeL7uMkXcXkD+Z0FQnXiNFgRY=;
        b=a47EzMO1X0LtgFoXi1kCJEaLE50vUGHtsgAH8K9xdKHAyhnMJFr87YWHlvknR6vzS8
         V/sKaWOJHZ3hJOI+rg+XTSqZFwTukAP3aI4j6CvCCRnB/rqa9pygQgTuavNOOwvosmIp
         Z3JENxXBFVjQAl+Jv2AS2iO7iuryQCc/n/IYKZ14YD28qsCYPXyrQ/YXXaWH+EFMJoBl
         wgR2H5yR6gh86N8K+fM+HZ87IKKT9lfGsyJU4zqPPQLe/emtZaWLACbK6asYSDBPr2l9
         /zRgknPEJY4f5fP2+OqElTfhXvnHgTCCN4LC+O2JTARSECPqw3Bp5pQKqQqq/Lk9eUMk
         6F+A==
X-Gm-Message-State: AOJu0YxWlFqg+8tUVW4vedtmQeQpa6ShjiIygfwKGAH+CbmBHJxlfqEJ
	o6NmNbhPtBGx0elliaB33l4FiNdDoYaj8g+5uZeXdyC3593FC8moSeBziqysqi4=
X-Gm-Gg: ASbGnctUYKUawNaiQerL46Ef3LozoOmM/hbKTA+h8kB3qLfku/Jjh1xlVsK/h4YHlFK
	uj1pHh9HM8zjJaA+SXis7Q0B+oFsuXS2wQe9KfCbVZpIuHWluCokR0E3DhIRfQCFHoNOlKYejDO
	d2URiURT2mmPnq/NViKZrG92soDHIqKkPDpxDmFymocFJW0eTYiqaMMN/g03iLbGM1qeZ0HYa/P
	5JZxMv2zphHP5/GLZ6m86yPM2uesJeIfQ9kKH5ed0RvbbXjFALnstLfrlBlIg==
X-Google-Smtp-Source: AGHT+IGuR1kQgNPc4pmoSDtxhw/xf1G+uSKr5Flpnta6qR7wyICGxjfydGQRvve1uqApDTnsGJZ9Bw==
X-Received: by 2002:a05:6402:3604:b0:5d9:d58:bcfa with SMTP id 4fb4d7f45d1cf-5d90d58c161mr2173921a12.27.1735831914831;
        Thu, 02 Jan 2025 07:31:54 -0800 (PST)
Date: Thu, 2 Jan 2025 16:31:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3] x86/spec-ctrl: Support for SRSO_U/S_NO and
 SRSO_MSR_FIX
Message-ID: <Z3axaRUXroc9SyzC@macbook.local>
References: <20241220193424.470994-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220193424.470994-1-andrew.cooper3@citrix.com>

On Fri, Dec 20, 2024 at 07:34:24PM +0000, Andrew Cooper wrote:
> AMD have updated the SRSO whitepaper[1] with further information.  These
> features exist on AMD Zen5 CPUs and are necessary for Xen to use.
> 
> The two features are in principle unrelated:
> 
>  * SRSO_U/S_NO is an enumeration saying that SRSO attacks can't cross the
>    User(CPL3) / Supervisor(CPL<3) boundary.  i.e. Xen don't need to use
>    IBPB-on-entry for PV64.  PV32 guests are explicitly unsupported for
>    speculative issues, and excluded from consideration for simplicity.
> 
>  * SRSO_MSR_FIX is an enumeration identifying that the BP_SPEC_REDUCE bit is
>    available in MSR_BP_CFG.  When set, SRSO attacks can't cross the host/guest
>    boundary.  i.e. Xen don't need to use IBPB-on-entry for HVM.
> 
> Extend ibpb_calculations() to account for these when calculating
> opt_ibpb_entry_{pv,hvm} defaults.  Add a `bp-spec-reduce=<bool>` option to
> control the use of BP_SPEC_REDUCE, with it active by default.
> 
> Because MSR_BP_CFG is core-scoped with a race condition updating it, repurpose
> amd_check_erratum_1485() into amd_check_bp_cfg() and calculate all updates at
> once.
> 
> Xen also needs to to advertise SRSO_U/S_NO to guests to allow the guest kernel
> to skip SRSO mitigations too:
> 
>  * This is trivial for HVM guests.  It is also is accurate for PV32 guests
>    too, but we have already excluded them from consideration, and do so again
>    here to simplify the policy logic.
> 
>  * As written, SRSO_U/S_NO does not help for the PV64 user->kernel boundary.
>    However, after discussing with AMD, an implementation detail of having
>    BP_SPEC_REDUCE active causes the PV64 user->kernel boundary to have the
>    property described by SRSO_U/S_NO, so we can advertise SRSO_U/S_NO to
>    guests when the BP_SPEC_REDUCE precondition is met.
> 
> Finally, fix a typo in the SRSO_NO's comment.
> 
> [1] https://www.amd.com/content/dam/amd/en/documents/corporate/cr/speculative-return-stack-overflow-whitepaper.pdf
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

FTAOD, my RB tag stands given the changes in v3.

Thanks, Roger.

