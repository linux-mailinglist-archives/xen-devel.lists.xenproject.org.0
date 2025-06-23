Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C921EAE458D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022467.1398297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTheW-0004Zy-K3; Mon, 23 Jun 2025 13:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022467.1398297; Mon, 23 Jun 2025 13:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTheW-0004Z6-HE; Mon, 23 Jun 2025 13:56:04 +0000
Received: by outflank-mailman (input) for mailman id 1022467;
 Mon, 23 Jun 2025 13:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KmUX=ZG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uTheV-0004Z0-4C
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:56:03 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc44cc2a-5039-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 15:56:02 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so3116671f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 06:56:02 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e741b43sm147930355e9.0.2025.06.23.06.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 06:56:01 -0700 (PDT)
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
X-Inumbo-ID: cc44cc2a-5039-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750686961; x=1751291761; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XqUSitsWp2pgteXZh00gKZ4QeO/aJjEcSFPz25bEpNA=;
        b=fEWmEv6vrU9t4VlawfEk53TfEr8/bGMQyWzTLoP9UIcaWvViBj8V6tSfDrshuNRp3L
         vJ3t4+kS7UF8YkNhGwZ9ASHxsW4+qvg0PEm7uVBjSuz1a/VTwNPKhVlDH9xurlAQGZ2F
         eIK1FVL6nlDltzLUWab8zTVLGX2nsar6qVC7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686961; x=1751291761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqUSitsWp2pgteXZh00gKZ4QeO/aJjEcSFPz25bEpNA=;
        b=hoywiwcvGp0NaQz5xo8VqN+3TxAatnUdCH4EpHdRoUt4EHP0nKJPokVSQDD36ogQi3
         1ccA3K9sJm8dDZLM4i/Rphrhn+j4fkQG3cR4NigpcPx+hoakqc9G9Ar/Zt864THIrqZh
         aw4wpCNES0MhrExSnh7SmyhtCrTvaasx1BC5PFh9fVQOweK6swfwuOm4a2HP2jNZ9pV7
         xv261iEg9GiU5cMk35hNqM48KEz/r3PdZ2j0f53GX1mXA3woicO3qNztf4DcOBcehWGf
         ac3DA6cVt/CTuk3cQpWAUsT5wybdqcdzfVZuCloLNwRksX1yq71S/RYVrW5GHlxW+GLb
         KoMw==
X-Forwarded-Encrypted: i=1; AJvYcCWtg2oZAoLAj+kIV+/qdDBmS1iZQx1K52cYyZrPZsweK6IR4iM0VliBcG55uPlYt99GGKIj+l8ClnM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqMgG/KgURi+UcbBfBo3+vuuH01B7KaNQJKAhAxNNYlOhZZk34
	CKn3PqdFzeaOS6sdImav07T2yxfhfr2iWc/kbE6FYTngJbypnvr3NAPTb5iTjgL8xQeWtdhQa0k
	89/AtfDzY6A==
X-Gm-Gg: ASbGncutCLeY+TqAuna38tmQkiBMfw9VfH/R+J7ZfN23iY0CSVEhcfUmlyOKt5An1Z7
	aGO64CSyp5nmyZjxQJC6XnQ0H5rLpolR/ZOprgoEdLy23D1RrY7KSTSLx2hn7JnlbAwwXbd7DYa
	w3rZ0nKV6AkFA8TYgs47ATmz5+/V4TGWvp7ajX1MyNaxlxH+lHa+QfmVOYDpDT4vM7NhnoRLJLE
	tr82Zb1ryer1EOyDGGXto7ed1gzIKT/fBEf3ZYBVw1IveIV8JwbvvDJzuUnRu1vZpRlWhHC4e/C
	L3ptL0N/cUME5h0dXHq3BTWECKRsfl8WYH8XHj44DRrjh2w3yrFWOxCo57gMV7ThwuAUeC5v8zT
	c/KFNq39HG8OoUGlj4CeBZN9mqEQqbuqGhMd1kA==
X-Google-Smtp-Source: AGHT+IES/BbpeOXvlZ4HaHFPdFSD6d09ypUhq1RpZp7cppTo2Iyh9/Iym6WFaPLQR99v84OJxRVJUQ==
X-Received: by 2002:a05:6000:d82:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3a6d27ef37cmr8355325f8f.24.1750686961408;
        Mon, 23 Jun 2025 06:56:01 -0700 (PDT)
Message-ID: <fe0adc4b-8bbf-41d6-b33d-54f5f9f18156@citrix.com>
Date: Mon, 23 Jun 2025 14:56:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH test-artifacts v1 5/5] Setup ssh access to test systems
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
 <d9e1dc62d2bcf647e0a1d26d90d2d33778d954a1.1750684376.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d9e1dc62d2bcf647e0a1d26d90d2d33778d954a1.1750684376.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/06/2025 2:46 pm, Marek Marczykowski-Górecki wrote:
> For this add also bridge package, so xenbr0 can be configured with
> /etc/network/interfaces.
> This allows extracting more logs out of the test system.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> This enables passwordless root login. It's okay for qubes runners, as
> they are isolated (even from each other). Is that okay in other places
> too?

It's potentially a problem on a corporate network.

Can't we have each job generate a random password an insert it via the
dom0-rootfs overlay?

Or alternatively have the runner drop a public key in
/root/.ssh/authorised_keys ?

~Andrew

