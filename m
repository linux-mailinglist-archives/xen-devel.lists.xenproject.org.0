Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787C4AC4C3E
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 12:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998232.1379009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJrXR-00023V-Ub; Tue, 27 May 2025 10:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998232.1379009; Tue, 27 May 2025 10:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJrXR-000213-Qb; Tue, 27 May 2025 10:28:05 +0000
Received: by outflank-mailman (input) for mailman id 998232;
 Tue, 27 May 2025 10:28:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrmh=YL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJrXQ-00020v-TW
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 10:28:04 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e86f851-3ae5-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 12:27:52 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso34488155e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 03:27:55 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4d9982c96sm5323425f8f.64.2025.05.27.03.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 03:27:54 -0700 (PDT)
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
X-Inumbo-ID: 3e86f851-3ae5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748341675; x=1748946475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Cn3kZtLDnaDZ3kTw3vFwSxIIaokAbnFgenElSMn6SE=;
        b=g+U6AkI8fHEiiHVa/fDsxeuOz03Ae4/jfd9ZsFXYRApv9P1AETHodUZW/uOo1+H55W
         cMq0qmo3inae1GJahIQSu/vTEsjMz2D1ZCZxsJbjzDgFme+x8Oqta4x0JWzPNgQZw11X
         cE7KijSMlU1kgwQ5XfOaqZh/ILqh8+YDazNj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748341675; x=1748946475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Cn3kZtLDnaDZ3kTw3vFwSxIIaokAbnFgenElSMn6SE=;
        b=lijh/H5YluHvd+TwCR5atHJowt7FgW/NPhDoPI2ZqLFD87yvhSc5O64csx3hctRmet
         6yikeNk5nL8NN5oi1dgUuR7BKDR4grMMtQVXpVAcxMsl57qqyCQ3BWsr2rgfcjJ3Udxh
         +AoN6TpnEWk25fZL9B2+MMAaJi7PcoOsaX5BeGVlSKhTGjhMqtDITR38EAi7a67I+In6
         eDKGcWC2AMm0LggK+n2wp8+CZNsAswXbt7WtN4IFNxZ5GUe4HriLVxJ6CD6PmLer+qqf
         myTt+iUU8/btgshNOt0Sj8kHVAhNsF97M1qyUsLymWaTHWt2+c7eBbbR7bHPxZY2yvx+
         43xg==
X-Forwarded-Encrypted: i=1; AJvYcCUXbP9Daz08vEIOK0jyN5o9UOEwUL54TcgmbYUvoY1uB/tgJd7LZF/TVo8DjXfuT+9XeoZidXh7eeQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZ2DkXR+71hqcZizMXF/DHWrrJTUdNW0HZ0i45D7XdEYdSUs+Z
	wdqdg7D2aFi0QvnthFc7HpXQo3Wtn/89pV5V4WLyZPsAVNU8Va0VunGmjPxVVFrl8Jg=
X-Gm-Gg: ASbGncs9EaMhMxgbCMZ5as2bfBgJx2wa/sKJCNKilBGFCU0UpcSfG4QYltnF8C0e4hQ
	T4lFlfKEvyn989mhInt6hyMRcOQfEK7QLtkTjdS0Y2c688WqSCu479hxAo3W9EYYgKF9rc7crvK
	Ls3BWu6ye7nX/VO+vQ/Qh7ixj8Tb82N5JesT9/dTISewrLg19lmwUcVrCltWWnK+woQ2C03OvaT
	VAETfwk/pm1BL1fMw2F5P/RhqCFf+71QW078vjqxcVl+/qbMtIx/xizPJ3OkUmJ51+CQTNHQQc9
	HL9yMecCs7OqWcD66OnLlLTnn8Jx1YCtAq/UwVQ/p22PtImxl4qyMwzfdDcHWN9N3wimqlmgxOX
	66pOyfjV4QZT4ECV4
X-Google-Smtp-Source: AGHT+IHMXI6/cx7U53XJhevZs9GwhIg+y+pzU9y72Jg938zG3dASdMd3d45Ri1xyAltcjOUOEMZxNw==
X-Received: by 2002:a05:600c:4683:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-44c932f9572mr117959115e9.30.1748341675095;
        Tue, 27 May 2025 03:27:55 -0700 (PDT)
Message-ID: <f1cebdfa-2ec9-47f4-bec9-e54b7da92d1b@citrix.com>
Date: Tue, 27 May 2025 11:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvmloader: fix order of PCI vs MTRR initialization
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250527085504.77444-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250527085504.77444-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2025 9:55 am, Roger Pau Monne wrote:
> After some recent change the order of MTRR vs PCI initialization is
> inverted.  MTRR will get initialization ahead of PCI scanning and sizing of
> MMIO regions.  As a result when setting up MTRRs the MMIO window below 4GB
> will always have the same size, and there will be no window above 4GB.
> This results in malformed and incomplete MTRRs being setup.
>
> Fix by making sure PCI is initialized ahead of MTRR, also add a comment to
> notice the ordering dependency.
>
> Fixes: 2c3dffbaa324 ('tools/hvmloader: Replace LAPIC_ID() with cpu_to_apicid[]')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

