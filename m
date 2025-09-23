Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00E6B96A83
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 17:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128529.1468856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v15H6-000858-9h; Tue, 23 Sep 2025 15:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128529.1468856; Tue, 23 Sep 2025 15:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v15H6-00082C-6u; Tue, 23 Sep 2025 15:49:52 +0000
Received: by outflank-mailman (input) for mailman id 1128529;
 Tue, 23 Sep 2025 15:49:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOel=4C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v15H4-000826-6V
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 15:49:50 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee4c3385-9894-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 17:49:47 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3c6abcfd142so2969267f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 08:49:47 -0700 (PDT)
Received: from [172.20.5.108] ([50.239.116.157])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698033d2a7sm162324465ad.132.2025.09.23.08.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 08:49:45 -0700 (PDT)
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
X-Inumbo-ID: ee4c3385-9894-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758642586; x=1759247386; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIXLZ6wtLSNO82FKH5qMMgF8Aw0iglLLXwNwoihRs7I=;
        b=NyRGaYT+vynd258YP/ucJ1MPTMTW4b57QTAVy2+/XBE1C7br2yTi0GBevFoqu5QF+0
         qYlu2TlXS1I838GZiTFwUhIhawMYx2Jmhbfz/K6C6gNDNjIYAjKcPadYM22wOWQYErhA
         Fxu7WPCgz2FQ/ZXqfefcHOV7bXba41s9q/46iY+EJCpMd/mHY92hfwsealwMjsAJzyc5
         iYL1t0Jei1t6uwXIUJbkE3/74EMAWhW4Bktwj1FLeLBUWuHc3UVlT0c5CMntd5XxGR2r
         n7ptvpcPUdVJ9MqoyhK581wMiBoigyID+JiTRNHBhripNZ+h6SvZQ3b+HPkndf+rmsD8
         J4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758642586; x=1759247386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIXLZ6wtLSNO82FKH5qMMgF8Aw0iglLLXwNwoihRs7I=;
        b=O1RfWfkJw6vm8oL1jAt4rhTDZaQjqZ3qKNdGlY5JvXPA3akWWOGRJX7Mwjs8Q6YElH
         xDm0qf/Y6RPrRo6K6rRqIGUJ6Z2ysraqkVB5p3fg863UWZGztZ9e6rABrLbKsJ+1xQrm
         3RzpjLxCNahBkprteutUEz7u1KnWiyLN3f/Jq0SDKNo4UOJUNC0MJZxQIH9fu43R310y
         +qF47qwHaA3EGuhlwUKmpaS+KtCWHTYRltTunUOsE1DGbKIdA6pTi1u7xPIIvXNVIhKo
         vgcL5RwLi5HcKzyIDc4B9E4n3VAibYTmAxyeEW4VXsAi2BAnRsQydS4Ch8NAz5zOonX2
         hRLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPZ3WmHm4Otvz3sIRvE5ET8KsGi1D/RvbeMyMfIannaY3wZGZQIJmT1GZwPKh8nIegMp3Inu7GDZo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz34GsxlKGtNcC9wG6Rjd23apyyNOnwLg+gmpjBPl+57+63/r1H
	7tUOW16ydUxtq/FEKCua2SoRXhk5liwRmksRpVPDYUbVF67KHY0ARsBeUYT46Qv7+Q==
X-Gm-Gg: ASbGncubJDSZqgBu5t4q+cY0N+YOBKM2fxEdFyb/x2EmKyMZB26ldY7N+ggL3aVtB4/
	UTk7YnakbJDh5BKsLE4It1WxkV84wWHP5qNOmk7tK/K6sqkch2M3f86rVEbLOY3lEBGQfhe2VZc
	HXr5e8b1ItzEfq6VW7AfmJ8v5wlKOPhQ+K0KkOjDSIYZUWDgM3yPAW9rvtCi3wm3V0Vw/X24lSM
	zPkUcjxUvYZdgjbOs4fiFqgaI8LepN4XBgRuFZpn11eHyM2I+e2dIpxI7Ex7ru1XPkpYIyOkOGg
	J6yLuVnNMVlRiR6jqTSy3ZhUiDPEeD09/w9q3cmtiwBsQby+HPvauYFqNIz7huQJmjxgFZXK80Q
	6Aois3pO+pncwAnpSUVPF5n61tAZU9HK0
X-Google-Smtp-Source: AGHT+IHDZO4d7554m56fpV/LMcCzijcOVPHpqvWSUxHwVTIcNmxdYtTqX9Dp+iA6oFJmJPlUMlImrg==
X-Received: by 2002:a05:6000:401e:b0:3e7:6104:35a8 with SMTP id ffacd0b85a97d-405c9a01d96mr2258466f8f.35.1758642586403;
        Tue, 23 Sep 2025 08:49:46 -0700 (PDT)
Message-ID: <e77fb934-2215-42a5-b48d-ded753dda392@suse.com>
Date: Tue, 23 Sep 2025 17:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] xen/page_alloc: Simplify domain_adjust_tot_pages()
 further
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
 <15ae395c6933e74da0cdd8f9d71d349a7bfad3f3.1757261045.git.bernhard.kaindl@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <15ae395c6933e74da0cdd8f9d71d349a7bfad3f3.1757261045.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.09.2025 18:15, Bernhard Kaindl wrote:
> When domain memory is allocated, domain_adjust_tot_pages(),
> also reduces the outstanding claim.
> 
> Replace the checks to not over-reduce the claim beyond 0
> by using min() which prevents the claim to become negative
> (and also not be over-conumed for the node and globally)

I'm okay with the code change now, but upon re-reading this it still
feels as if this was describing an issue with the original code that
is being corrected. Afaict there's no functional change here, and hence
the above may want re-wording accordingly.

> Cc: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> 
> ---
> Changes:
> - Was added as 2/7 in v2, the review by Jan Beulich is applied.

This, imo, isn't a useful ChangeLog: It requires readers to go look up
the comments on the earlier version. You want to say what has changed;
upon what basis the changes were is (again imo) secondary.

Jan

