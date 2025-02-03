Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B673FA26088
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880916.1291011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezcs-00087S-OQ; Mon, 03 Feb 2025 16:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880916.1291011; Mon, 03 Feb 2025 16:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezcs-00085T-LP; Mon, 03 Feb 2025 16:48:46 +0000
Received: by outflank-mailman (input) for mailman id 880916;
 Mon, 03 Feb 2025 16:48:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wUg=U2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tezcr-00085N-Bv
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:48:45 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bada1e06-e24e-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 17:48:44 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso32379755e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:48:44 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc6e00esm201245135e9.28.2025.02.03.08.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:48:43 -0800 (PST)
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
X-Inumbo-ID: bada1e06-e24e-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738601324; x=1739206124; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1y6g/rCHy+A/VqpM9WqsaAEVdkA7P1mLjvLPTyS3iyk=;
        b=NB9FCN9SuMtcn76qFO3w10AnOqrwU/9aXe6xqBahWx1R1IqHeHgqMIKxqZv5oLJCt/
         Dw+BKYEo2NFjHdsv4ma1tiUsXNBfD65bIRju6ahIcDtyNKwJKVVUo6nN3IbSf74FFhQV
         FdO7PzMHIabbZluZoR3hdP8b7+iLhtf1diBQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601324; x=1739206124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1y6g/rCHy+A/VqpM9WqsaAEVdkA7P1mLjvLPTyS3iyk=;
        b=B0ZBzgjAj+M8u5ZNa2ey7eD7hl4kuartsngY+TxrbVMaMk5FuYfoMN5jIjwo0S5/du
         GRdtjzWHJu/PBh2Qzqdgb5xXv1dm6YC6M4hDL2MmVXQPoM2RUZe19jRldX9z7LxqVOMf
         21c4xYJWC4iHrnAySExcFkgljHLHUS8zjpieRahXOBGnioYXatTvG/q0FedBLWUF+lux
         41jwRrlU7dRIo3prcxwZV51Sq5p9adww6dr5u3PrW5NDmtoAs0LONJoKbJtct8KT3Nku
         vRmcJUZ6rjNvCocNiXTp7m0ZQgFifJkhj8z8O8H/aitEt92WhVVsyiAD5pOSiIrfs+tE
         Tp3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWH7inSufDT4bRXykNG13L+Ee9Ij+hKbi89hMZHEIK1vpvvF9psAqyaZWPNXJiuAQmqUrNh7a7/kXk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7bHKTw6/S07LQlvZb89xcn3tMIFsz7xT+54cGjDPdtcCZ7Ivq
	X9AL8nrWTqXgqQnHzm4woqOW87Hc3FyO5ybiQsC57TTQM2tl9OHgLaugCj6aBrU=
X-Gm-Gg: ASbGncuG1du270hsG/yL5J5aRb5BrsvB13ON91eAWM+H9Gy3TI7mDdL0oaV2L0Th7XT
	CwvDOVUpl0EhpTuNwsAMR61KKGAzCL3nf/lMx+eDcSPQrYR7uS6l+CaeWCNEvSlryVqoRP1Fp1l
	ySvWSOBhNyVLFyIUsm+34R4jcP22ESIAihnIP3xoRBpHZBklbCQ4PBaTnX7V1RhiHedAjlzR2WP
	G/5xMUnZLT2gvPOpo8qOXXPAOYqrCD6+urvlfTp2Md4x0Ri3pJ0xNVBACqlw1ARlxa/SjU/6gjR
	bEoiRAB4kkPbCRW4YtFMaOup4v1gBfWUZ4tNxYrLh+do5fVqm76jgRk=
X-Google-Smtp-Source: AGHT+IExuDk9DgM9w4JPYEUBAELQopcmKNJCyNv9JwS2xkBjOu1BvG0p3ef3Uw9eDQqZ7EtI8HI30w==
X-Received: by 2002:a05:600c:6d5a:b0:436:e8b4:3cde with SMTP id 5b1f17b1804b1-438e01febf7mr191845295e9.14.1738601323696;
        Mon, 03 Feb 2025 08:48:43 -0800 (PST)
Message-ID: <528e3341-45ce-4e82-bdb5-ee3dc72a6925@citrix.com>
Date: Mon, 3 Feb 2025 16:48:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.20? 5/6] radix-tree: introduce
 RADIX_TREE{,_INIT}()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <bd8d65e6-e887-4afe-8ff0-df86416fa869@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bd8d65e6-e887-4afe-8ff0-df86416fa869@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/02/2025 4:26 pm, Jan Beulich wrote:
> ... now that static initialization is possible. Use RADIX_TREE() for
> pci_segments and ivrs_maps.
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'd not considered having RADIX_TREE() but it's nicer than my attempt.

However,

> --- a/xen/include/xen/radix-tree.h
> +++ b/xen/include/xen/radix-tree.h
> @@ -72,6 +72,9 @@ struct radix_tree_root {
>   *** radix-tree API starts here **
>   */
>  
> +#define RADIX_TREE_INIT() {}

... this ought to be (struct radix_tree_root){} so it can't be used with
other types, and radix_tree_init() wants to become:

void radix_tree_init(struct radix_tree_root *root)
{
        *root = RADIX_TREE_INIT();
}

instead of the raw memset(), so the connection is retained.

Assuming you're happy with these adjustments, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

~Andrew

