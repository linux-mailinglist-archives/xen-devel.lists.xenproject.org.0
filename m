Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F36A5FB0F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912773.1318976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslDm-000755-GW; Thu, 13 Mar 2025 16:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912773.1318976; Thu, 13 Mar 2025 16:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslDm-00073E-D5; Thu, 13 Mar 2025 16:15:46 +0000
Received: by outflank-mailman (input) for mailman id 912773;
 Thu, 13 Mar 2025 16:15:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tslDl-000738-5q
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:15:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6921222f-0026-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:15:42 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so10284275e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:15:42 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c4f9d59dsm2591232f8f.0.2025.03.13.09.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 09:15:41 -0700 (PDT)
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
X-Inumbo-ID: 6921222f-0026-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741882542; x=1742487342; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=70tr7Me46dxDdy/OHGrbBDotjQ8EooizTDRqxHCOGoI=;
        b=nflqAD5Dwu7f5b5XfGxXk8lGEF5xnDDSeG3s6bGP3oIiNa6koFHpapjyN/07lm7H53
         bIrxGk8JTN60NfN9gD2VQHCxsMwfbo8EXfN/yvmDsRew/LQm6YT9UvCcjEyHmoliaSmN
         PChKxQntjMDuJMzSciBrhjWCFCNF6HCX9V0so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741882542; x=1742487342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70tr7Me46dxDdy/OHGrbBDotjQ8EooizTDRqxHCOGoI=;
        b=b82iHH23Y2OYWQOqEOkR0BYWCHPe8mfVaY+4J1w4Yo5tuXrrLKWTB1JQtxbXSSuZ0R
         hwMrL0sf+VlGpKCH9hI9CdFoW9zwTVZoUxUoKxWhHxT2bPOLYuvm+1//vEQkAAkbHEtg
         +7dYeqjpbCZbgjTJ9UJ1GEcJ/3yZB69TZqw/NaRaQl6gzvoQHJZX9zoEgFIVlk+IOIZ0
         J789c0OPTioEjypxKr/4oHbQhhLEBJrjz36w3MZxv0AuBKE6T2EPH2th/cVcoYWR2lVy
         SfRgiOO21euJbS1tnQtaicX7LnaXy9wKo6G7DRx2Vw2JN7N9XXfu9RrGTF0p6kobr0Kb
         qATA==
X-Forwarded-Encrypted: i=1; AJvYcCWfC9dkVoGYVmdUlP6x/492/oV9yElK7oVaMWIMFY9oM4fTvQpXBcmWD9la3CN/deyrKr09SZ9bQ8c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd+FvGIWJAcbS8QIojVTUKrdHozl8LMChE9ycw0k1BUy2Sl5Xt
	Xv6ZYmfh/y2tWPVr+G83fUgS3Re9MIh8b0+fQ5hg9HAZlQsWu8VTVBpCBOW/DJk=
X-Gm-Gg: ASbGncuRByIqEKKK9yLXHcowoWl6cL+8ozCRYD7b5KriK4P8rW/8oEmZ5cw/jaw7T3U
	U0q0oD6Vu+YAbT+53H9RR+6JDWqS2aEzeBeoVr8rzEnbmcwmSyb8T/iGamu61LSlry8trMQ9o5y
	Qh9yinMhMVu5ygDwJpec46wXzHhpDgWxvfPUlvmIgDb/Dj4fxy9hSu4JSEtZBT9i0z0cpNtY8TE
	6zvIvVRfNbDylOwvfciUp6DrK4GaLIrmQXUZa9KJdDfAlKBr+S5E/xWEjcOMvvrxEJ83Xgdf7iH
	iw2Dj/Xa9Wz0GWwopn+86nwov2Rgw180Y6s0OI+/R1Ozop/qa5uYmr39NtOnmq2UO1zBC1zFlwt
	cKkQpdvPt
X-Google-Smtp-Source: AGHT+IFzlSfLcmf9x+8ZoFIuqu9gHhSmquLo0XeNW4cxZIAbk/VMUINH6XXZ6dP9k+9FzU93IaWVeA==
X-Received: by 2002:a05:600c:1c0b:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43d1d8976b3mr3298775e9.11.1741882541653;
        Thu, 13 Mar 2025 09:15:41 -0700 (PDT)
Message-ID: <78dc00ee-1225-49ee-a067-8d29f5709c76@citrix.com>
Date: Thu, 13 Mar 2025 16:15:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] symbols: sanitize a few variable's types
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
 <c4b7f6ce-baa9-4b55-bdea-a67ff7d5daa1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c4b7f6ce-baa9-4b55-bdea-a67ff7d5daa1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/03/2025 1:53 pm, Jan Beulich wrote:
> Parameter and return types of symbols_expand_symbol() make clear that
> xensyms_read()'s next_offset doesn't need to be 64-bit.
>
> xensyms_read()'s first parameter type makes clear that the function's
> next_symbols doesn't need to be 64-bit.
>
> symbols_num_syms'es type makes clear that iteration locals in
> symbols_lookup() don't need to be unsigned long (i.e. 64-bit on 64-bit
> architectures).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

