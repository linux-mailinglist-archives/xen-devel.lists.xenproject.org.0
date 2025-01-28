Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5CA20C32
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 15:43:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878528.1288707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcmoL-0000kH-HE; Tue, 28 Jan 2025 14:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878528.1288707; Tue, 28 Jan 2025 14:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcmoL-0000iQ-EF; Tue, 28 Jan 2025 14:43:29 +0000
Received: by outflank-mailman (input) for mailman id 878528;
 Tue, 28 Jan 2025 14:43:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcmoK-0000iK-KK
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 14:43:28 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b80746a-dd86-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 15:43:26 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aab6fa3e20eso964009966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 06:43:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab676114e78sm788780266b.164.2025.01.28.06.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 06:43:25 -0800 (PST)
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
X-Inumbo-ID: 3b80746a-dd86-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738075406; x=1738680206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KRuTf83lWyflbO7ZbRjUN4I/48s/hNFs2otmIWnKcJ8=;
        b=B0BlBvanSxn6leOggwWouvgU3cZ17T+QKbtb+1FDF4q280T7zepBQ7tbOujBA5/u5l
         Mzt6sTOUdWv4mi6dP7KSVpzsFMPLkbS3DZ2DS+z2j+2ebz+hRZY+iiyFhmsAiApTrYqK
         gyChAdLnkww6lQKR1aBIYwcdeSeoxvDobltrA1dlnwj5r8pAHoOyQoXIdeeR6D6dEEhG
         70KPLxONhgGFooxwDl4XJ8UGNxEifVUTU/hVCMKJ1taTWYPt8Ej0ujR6+gcPQtsqL+07
         nXWvTydu45FdSBdAYRWmVb3oPXDqIdjQZutTAeVNTCdCKo0f7ef+8V6XIWrgV4I2gC+J
         szqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738075406; x=1738680206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRuTf83lWyflbO7ZbRjUN4I/48s/hNFs2otmIWnKcJ8=;
        b=p/n/GGFU4ytJxjEz033x3cAmGInS2SXSpzRnpzBWvnzclZNMz/fg8mF7/PHtHggWaE
         +Dk7F09MiRCucOFe5cFgGYlNHnkK3qB2jn0IrpMhgApu90rdvN7kKet3O/LTtZEf3yBL
         ASPrTyfXUQHQvfPKO63qX1hB5NB7Bra1o7ECKdnlDbBZlg/CPRbPD3ZVyIBBlp9eHWau
         ug9zbxbZ+a0ksXpbJZLiWq1QKznqwW8TOxOQLRZ/yJsoTfI9DPOjB3y8byIiruaK+Xm7
         WLZO6AE6LR8iGytB93khSkgpTZtxn5xrKJYVh73ZIURa/7W+7jeeZXR8CQKSDgyyjDbH
         YBKA==
X-Forwarded-Encrypted: i=1; AJvYcCXmHeFA8CByUEO7Foemy1ioV9bnGb4K6OuUgpLU9XaTWXwBZpZvda08NwN1LpqaJRbzXCJT4R7slOM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxdt3R3latoQLexrFuz0YUz1ET3hbE6+XHNM5H06XLznk2NdWP7
	gg2DCtalYp3StexCJrD+vQWkKMVOzRV7Qt2sW097njElD9qs0BTj6abmR7ZHEg==
X-Gm-Gg: ASbGncskXrTbiMceTwWWJoNGMgHCnGs96+GcSEGTIVzMQ0Dbd/dU2IGpXnaEhpzH8i0
	dTv4piabQ4jxbFEVFt1/M9i7t165B8npbqgUqQ/hhCwKCSDR7oQd53YxgSmbP3kFthhQf+uu8si
	QGwRy/77Y/2gsq7ECyyo816anWyXhBt/gIoUe/AVcmQEH9iXIWEwk1QxlUbxFq1Znj8LT3uVomI
	mWwEXKpCjzOhltB3mKH2jySzlMOnS6jv+9V3ZIOFC/VnC6rBc8VDk+SqiTvLxdfalUsOLSE3WzD
	NsUd8LzPckcgWRQVB+gJjSd0XltSmDHQe07YBYSK2qwrI0uCYTKd+Yn6HpMO1b4bjJpMvy45KHF
	H
X-Google-Smtp-Source: AGHT+IFhnAsfkuLWe55KqmE9AW5Sx/IiKWwCH/ze3QabRa12T7xitF+Q1T1h7zCdb6tgygpDh+3fLw==
X-Received: by 2002:a17:907:7296:b0:aab:75f1:e51a with SMTP id a640c23a62f3a-ab38b44e04emr4761171966b.38.1738075406067;
        Tue, 28 Jan 2025 06:43:26 -0800 (PST)
Message-ID: <03de0e24-dd5b-4ca4-a0de-299cd48de58b@suse.com>
Date: Tue, 28 Jan 2025 15:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/24] xen/console: rename switch_serial_input() to
 console_switch_input()
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-8-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-8-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Updated the name to highlight the physical console input selection logic:
> existing code does not switch only serial console, it also switches debugging
> console (debug I/O port and console hypercall).

Would you mind clarify what you refer to by "debug I/O port" here? I can't
spot console_rx (which what the function alters) having any interaction with
that. I'm also having similar trouble with the console hypercall. (The
renaming is likely still okay to do, but I'd like to understand what I'm
presently missing.)

Jan

