Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57AAA72E3A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 11:53:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928947.1331583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txkrQ-0003Bc-2z; Thu, 27 Mar 2025 10:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928947.1331583; Thu, 27 Mar 2025 10:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txkrQ-00039S-0M; Thu, 27 Mar 2025 10:53:20 +0000
Received: by outflank-mailman (input) for mailman id 928947;
 Thu, 27 Mar 2025 10:53:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txkrP-00039M-3a
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 10:53:19 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b05c4622-0af9-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 11:53:17 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e5c7d6b96fso1554447a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 03:53:17 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5ebcd0dfe0esm10903475a12.75.2025.03.27.03.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 03:53:16 -0700 (PDT)
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
X-Inumbo-ID: b05c4622-0af9-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743072796; x=1743677596; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ai4FjQ8u9b863uwr/nRMP9Al9AKv96u44wUWaBGFipk=;
        b=wUEZoVI3k/qc2cPVSxDfPsRu1LQFF6pXmaMAAdZPBCoXihwcsJxK450uLosiu/vnvI
         72E4OPcUJWuvB6LhtMW9YkAXqEmUufsySmU45i1KpnJa3OY5h5fXlS60be9j9VT6QOz0
         PUmYwUtrUuu52g4oJL6e9UKPUGBJg8bIIXb/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743072796; x=1743677596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ai4FjQ8u9b863uwr/nRMP9Al9AKv96u44wUWaBGFipk=;
        b=ZlgW22sheS4SUWooo1u5XD/xwQdeK0TmJTanxK7zgOAXTRQ5ksWQdG9GCF8G0M4AJG
         fjeWD852idwnJDhnqtnGs5E+s+KVqPCHu346It5u4kjj8EDsEo6TkY4ZgfXquvxKhKDp
         bttcAMMqprEnM7O1WR9b0ewgmTdXBhEl+QIMR7OvkWf0Wsn6n1dzPUSbGwq0yKwbrB+4
         ISsT3b5woSlB452socsAxyiViaq9uGd07DYlBPGJoB2RARWWgAEe/czEqjl+L5owOjO7
         0JlFNOMIFpyNAUMW+igj/VReZmtYb4Ll+WZYfgGOlSsplcioNLQPCl0RC/hLOcBdGzxz
         6l0g==
X-Gm-Message-State: AOJu0YxwSwBSB4LEovvdl+XnqZEHMu1lhm2gVfrFB2o+yWE1kkTkjhBp
	EYFogckmAtsFy2VZJtP7dzgG9N7JPicndzhP2ZDym1RHnIMmvEdzdjFheA90guk=
X-Gm-Gg: ASbGncs28PjZtF/MEBq1sc8lStSNa5qP3lLCR6Nulr4dACtdf7CgJSg7RI+ERjHdoLZ
	k4yYWW2HmNvMNOnH72K4WlgVmiuJrqc3KVTgIdZNj51l+HAXTWqwRbajL8JiP6k39gbzuhtm2+0
	efWdwuIxxnUxwn3xu5a/KBjUuLmpPeuhh8z+FPdhrnEptDRZQMF1CMdPZ+tyD5n7WuzR75wwAM/
	tbDF/yiEVPlR7w0wMwOCzSl47QLOc+jnoPV3UG7u1WLq4NLLqHnkcY0xDr28fcBhx21ABo5sDJ1
	DCpzgRifhqaazCzx5NyCnAx50kW9mzS1m0QYH4J6SGahBZDKzA==
X-Google-Smtp-Source: AGHT+IH1i/vGmrhGAMUpLdP39suJhsvTzAaRG3JuCc3VGfR4PHAxtyu2hW3ZBqmHgU+6e8KSYCrjVw==
X-Received: by 2002:a05:6402:1ecb:b0:5ed:17d9:91db with SMTP id 4fb4d7f45d1cf-5ed8e382709mr3135757a12.12.1743072796666;
        Thu, 27 Mar 2025 03:53:16 -0700 (PDT)
Date: Thu, 27 Mar 2025 11:53:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/MTRR: constrain AP sync and BSP restore
Message-ID: <Z-UuG2QW56iSfeFj@macbook.local>
References: <56fbfae0-aac7-4841-ab3c-a7e00dda3744@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56fbfae0-aac7-4841-ab3c-a7e00dda3744@suse.com>

On Thu, Mar 27, 2025 at 10:54:23AM +0100, Jan Beulich wrote:
> mtrr_set_all() has quite a bit of overhead, which is entirely useless
> when set_mtrr_state() really does nothing. Furthermore, with
> mtrr_state.def_type never initialized from hardware, post_set()'s
> unconditional writing of the MSR means would leave us running in UC
> mode after the sync.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/cpu/mtrr/main.c
> +++ b/xen/arch/x86/cpu/mtrr/main.c
> @@ -605,13 +605,15 @@ void mtrr_aps_sync_begin(void)
>  
>  void mtrr_aps_sync_end(void)
>  {
> -	set_mtrr(~0U, 0, 0, 0);
> +	if (mtrr_if)
> +		set_mtrr(~0U, 0, 0, 0);
>  	hold_mtrr_updates_on_aps = 0;
>  }
>  
>  void mtrr_bp_restore(void)

Maybe I'm blind, but I cannot find any caller to mtrr_bp_restore()?
Am I missing something obvious?

Thanks, Roger.

