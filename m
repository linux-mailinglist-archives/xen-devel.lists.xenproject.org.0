Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54275973A36
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795726.1205192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so25s-0005ml-8z; Tue, 10 Sep 2024 14:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795726.1205192; Tue, 10 Sep 2024 14:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so25s-0005ke-6E; Tue, 10 Sep 2024 14:43:48 +0000
Received: by outflank-mailman (input) for mailman id 795726;
 Tue, 10 Sep 2024 14:43:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so25q-0005kY-If
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:43:46 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14727c78-6f83-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 16:43:44 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so122160366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:43:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d2583555csm494997066b.15.2024.09.10.07.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:43:43 -0700 (PDT)
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
X-Inumbo-ID: 14727c78-6f83-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725979424; x=1726584224; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+vyt4sM+WhrPDkxvMNF2iWGvWqUQZvwbGu3XicQ/3cY=;
        b=TBIWv8Mejg/Nvnbmy7MVJJHLF35tmD04tv/ZeH9dXR8XpwTOUcnn6ViOD9QqpbZNjC
         HdkKyBuIJEAyBaTtYHvsSKXC3nKAQIAZaoYl0lYa9Cd+PsHCQjc8X/HS8AKA/EdZHqxC
         Pwy8UAjRlPNUYb/jPTDEQQ9SOsP+2fNevR84XKG/dYLG5TL+DccnnhWKNMIoqNPFL0OD
         VjkjRKcM6Ta5SVvTeAA5A47YE5bkBbsnv4NBeQGdr/UDBHYpz/9ljUSUbvKaJm28w+YZ
         A7ffdMiI5JEaan3QuZTUwBmjww/a7WlRYnNRfShCSOhBCNB9bcMgueYiMmmuXZ+mQvNO
         6fJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979424; x=1726584224;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vyt4sM+WhrPDkxvMNF2iWGvWqUQZvwbGu3XicQ/3cY=;
        b=dvl1DRIAES1QPQNUEN4F1OMzbcSnx05TCG1wP2S/yTJsdpVmtbmvyPg3RUpFY33lEJ
         WOO2WvsM4mnzqkUBSUaBtFvaZBTK+pjbavzpu6q+5NkcDF38GqXXpSxkk9YfZlhuoXDt
         TWs9sHlwoE3SBiJkVRvFtX5we/3kz1FzLUqooI9MtnGYr3hMkHpHvo24zhhWWwhRyNvT
         wu7ea/k9F2WKhQ/Lzk9ll7YDYt2DD9HDK8tn4wBY3M2bcICA0M3cqTElciuK7WPXAtWb
         6ZUXbDlGKbNaMVzapgxM5UAc6xFC1Y3gAfyfljKC5d2Tz6LxQhuAk1HKDFPcDe7/v7SH
         mowA==
X-Forwarded-Encrypted: i=1; AJvYcCVgc6Gc3lofBVCdmqafPbGKWW53oinweLpTtBnhL3n5bI1X6FKYNUFtie2zYvi0THu4OmfuQ1XFaV0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxm06RtQcPdI/PQy8bNnSh/YdmkuXJE0OSXaVDBOsUBRz4VG4dz
	j6082hsGb/hNlXpgAaImqLqzmXOy9H3sL+xqqN7ccFGo3hROZJ7ajidBOeW7lA==
X-Google-Smtp-Source: AGHT+IF9XvlRk2Xprpq8/GDi0Ig2EZyVImMgr8DxZan86NqX05VXENTUoo8A5+FccG+E7zr03fFaaQ==
X-Received: by 2002:a17:906:4fd6:b0:a7a:be06:d8eb with SMTP id a640c23a62f3a-a8ffae27144mr118270066b.53.1725979424092;
        Tue, 10 Sep 2024 07:43:44 -0700 (PDT)
Message-ID: <1b112786-f79c-439c-9722-91f5cc77353f@suse.com>
Date: Tue, 10 Sep 2024 16:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/12] x86/psr: address violation of MISRA C Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <ae29b196cb3967b39796047997751324b8ce8a13.1725958416.git.federico.serafini@bugseng.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ae29b196cb3967b39796047997751324b8ce8a13.1725958416.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 12:08, Federico Serafini wrote:
> Address a violation of MISRA C:2012 Rule 16.3:
> "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



