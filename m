Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973C547010A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 13:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243828.421901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvfSJ-0001VD-9A; Fri, 10 Dec 2021 12:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243828.421901; Fri, 10 Dec 2021 12:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvfSJ-0001Rx-5z; Fri, 10 Dec 2021 12:56:55 +0000
Received: by outflank-mailman (input) for mailman id 243828;
 Fri, 10 Dec 2021 12:56:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QdnD=Q3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mvfSH-0001KR-PQ
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 12:56:53 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a575a1b3-59b8-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 13:56:52 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso8939729wms.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 04:56:52 -0800 (PST)
Received: from [192.168.1.186] (host31-48-92-117.range31-48.btcentralplus.com.
 [31.48.92.117])
 by smtp.gmail.com with ESMTPSA id a9sm2568872wrt.66.2021.12.10.04.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 04:56:52 -0800 (PST)
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
X-Inumbo-ID: a575a1b3-59b8-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=K1skKFn6ZFJBwrjJmG0QjAN12BDBHj7aa+LG3YPoTjg=;
        b=hMs5QpKsUWFX5UZrNyuGv0yISbJqka9aNypPEqW2MZtmUSzcmb/tWdbOT2hFTo1X5C
         8eMuRl+DjncR5h6PZ6ZfXboO4ZO+jepay/ATI0pac3GzwQQsEDSN0vUNkXIEXMYHXHid
         uqLlt0I4/JPfpdj77dXyL1poJAyioHLnL7QyXinxkSgQ2ND/VQddgUli1PzdO04+fSoB
         P30pTCmzTvQlM69HTFORZcEuSXJZDS3fh28sUassAKB9yNnk81NWH9tAi8yg3DY6kpbf
         cXPomchGQxkhY+sW6cmBrIEDlch1a9Iz/6pF1g8Oa3TdyMfsaO6kzpcolFB3AhVPUpU9
         aWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=K1skKFn6ZFJBwrjJmG0QjAN12BDBHj7aa+LG3YPoTjg=;
        b=J941TT/hHtE1szlXBKLv+xKSHZ6vVVKrPqS0ReP8Yq6D8IH9R7rQpFjhTwutIDNROC
         VtJJKgro8k9vWMC49aXBB82+bBGr9VPol8n58fok8KOjNQR24o9tBK+7YOr1A5UTmcIG
         YYygqkRwAiANhF9o6py4DWS+aslITnkZLMrK/VNcqLYfuyxCQcKd9DPlquSeLXF4gsTs
         +3ai+wMQBBMiHUDVsVneY5rZOH7LZ8X/n2FYuz0mJjNTPawDGtyTC7+ILqfHj1MInd6p
         WFlTUvVwu+1ghAye6zCRlhbA/swuiZYc6OcVwPoyqOEBdn1VtVAXDjrzumK2fElQcjHo
         DhqQ==
X-Gm-Message-State: AOAM532v56xYfJyy4OZtnNeUoA2dTT6vYHCWRh3YQUqexBup9mZA1ASl
	j7GrzRGyICNMCHy5c+9IEbj5+mLuYwE=
X-Google-Smtp-Source: ABdhPJytSuNJgd7C7fyAmkpeaUfDzmWNskGVxhMkVt1KebCODdV2bsZPzLQJHh/VtebhmPGYh7OFHg==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr16669547wml.119.1639141012456;
        Fri, 10 Dec 2021 04:56:52 -0800 (PST)
Message-ID: <06502ceb-6f39-7ea3-f2a4-2e6f52827015@gmail.com>
Date: Fri, 10 Dec 2021 04:56:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Reply-To: paul@xen.org
Subject: Re: [PATCH 3/3] x86emul: drop "seg" parameter from insn_fetch() hook
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
 <53cf0492-e197-d3e6-8898-9e199bbc5399@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <53cf0492-e197-d3e6-8898-9e199bbc5399@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2021 03:23, Jan Beulich wrote:
> This is specified (and asserted for in a number of places) to always be
> CS. Passing this as an argument in various places is therefore
> pointless. The price to pay is two simple new functions, with the
> benefit of the PTWR case now gaining a more appropriate error code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

HVM emulate parts...

Acked-by: Paul Durrant <paul@xen.org>

