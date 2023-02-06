Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815B368BE75
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 14:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490450.759149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1iG-0000yv-NK; Mon, 06 Feb 2023 13:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490450.759149; Mon, 06 Feb 2023 13:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1iG-0000xE-Je; Mon, 06 Feb 2023 13:39:16 +0000
Received: by outflank-mailman (input) for mailman id 490450;
 Mon, 06 Feb 2023 13:34:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TkEH=6C=tibco.com=andcooper@srs-se1.protection.inumbo.net>)
 id 1pP1dH-0000ke-LP
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 13:34:07 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecb13344-a622-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 14:34:05 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id y1so10389277wru.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 05:34:05 -0800 (PST)
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p4-20020a5d68c4000000b002c3e4f2ffdbsm3886192wrw.58.2023.02.06.05.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 05:34:04 -0800 (PST)
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
X-Inumbo-ID: ecb13344-a622-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lz1YQM/V65A11ioBaYbc6K4s50kvUjKP/4O031kUCbw=;
        b=rVINT2/of2qKlac1Q6VBZ6ux20RzF7iqcPOMFd8HIo8WM9jnXYSKKY4+q/LFZ9up10
         Oxp2TmxFiJ+606bsVThrIb3YEQoj7kSyoJrID94qdJ1cZhEoXGEXPu7vLTBB1HOC2WoB
         bZfbshKtTW5Zs0NkROMkJHtS0n2WP6cYJn/2oZvmuTdeyitODy2mDju816vEpqcYr3Rg
         wGnmrzck5i1OCLXjmNvMsk2No6jPyqEXadhfIgT4khySahK9mE/7CSKFUmtb0v80RFmV
         gD9+er+djiL63oedwRInGX7yO3wcIgsPMRppmia4VYiZNAYF/+nDi1LuNwRNHk88A3Bs
         +eYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz1YQM/V65A11ioBaYbc6K4s50kvUjKP/4O031kUCbw=;
        b=KCEygar5v/vhXJpBdIJOqgNm47axySKj1Il5TH2/R4GdHQMe0Vda/GlOoOL5+RRzeD
         INcf+WVV/nOvdMVe2fY9jq3DzG7i7rFGCgJJGdX+St8p1jiqT6uN35WzNYzmcnD+wPyP
         V+aOLUIpvkDvHRiqvZ5yAHCMX/5jJ7BiYt9W3+38Ccc4q65gfdJp/EAVWj/rmSvphid4
         nsCrZfolEEoL6kUD89X7miuKK/jS6T6I/q0ODgmTvxJfniKgRClpcTeOgAFEZpk+bpf2
         lO6gaQrrnmADiDVwhTsZHh+oS9CTIxNht3WMmPAXSOqNbInl/Tv+2Ity5BMEObUwUnFo
         X0rA==
X-Gm-Message-State: AO0yUKX/aoD1zf4qXKX2qG1zFE3xojoBFRww0nFRlJm91hlm0OLXJQAH
	SFiBYA/IQUudvDqnVtvRqT2ciw==
X-Google-Smtp-Source: AK7set/RzzUveeDHSzOdWCnLEArFHeAnUZmW+E6ylhq9Q/cM1Wv00/bWU0RDMOdKXQo8gIHphSs7PA==
X-Received: by 2002:a5d:6c63:0:b0:2c3:19f1:77aa with SMTP id r3-20020a5d6c63000000b002c319f177aamr23461271wrz.37.1675690445239;
        Mon, 06 Feb 2023 05:34:05 -0800 (PST)
Message-ID: <39520206-0375-ea2a-709a-992900014705@tibco.com>
Date: Mon, 6 Feb 2023 13:34:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] libxl/x86: use public interface TSC mode definitions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <0d80ade5-dcf2-b0b3-ba4c-010962a6febc@suse.com>
From: Andrew Cooper <andcooper@tibco.com>
In-Reply-To: <0d80ade5-dcf2-b0b3-ba4c-010962a6febc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/02/2023 12:33 pm, Jan Beulich wrote:
> Now that they're properly represented in the public interface, stop
> using literal numbers.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

