Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5008787008F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 12:42:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688338.1072385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh6hr-0001Ln-Tk; Mon, 04 Mar 2024 11:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688338.1072385; Mon, 04 Mar 2024 11:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh6hr-0001JB-Qg; Mon, 04 Mar 2024 11:42:07 +0000
Received: by outflank-mailman (input) for mailman id 688338;
 Mon, 04 Mar 2024 11:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYvB=KK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rh6hr-0001J5-15
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 11:42:07 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 392090a8-da1c-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 12:42:04 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a458850dbddso4938066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 03:42:04 -0800 (PST)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fw16-20020a170906c95000b00a449b175d2fsm3420559ejb.222.2024.03.04.03.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 03:42:04 -0800 (PST)
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
X-Inumbo-ID: 392090a8-da1c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709552524; x=1710157324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=snfhScXYKNnKUoeQj74fH7B2eTQCxeRrJzY3E9lPG5M=;
        b=LPJXjKuc2nLmshPswClNhJFd7P1OJuDV+Sd0/na2eMiHkm5pdsCMxx1JH5Sxyk2N2O
         kdBUQG+qhxh6oqOIkVKwKFThvjwEXAO7ssOXyGF+wWD8d04UYR8679F5oURyxjt7nKzK
         H4F0jTg1TTPFywlkTJmixeBbstcJn0BF2vPUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709552524; x=1710157324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=snfhScXYKNnKUoeQj74fH7B2eTQCxeRrJzY3E9lPG5M=;
        b=fhZr1OKohoqFQyORhic/vaNqZ6LCpeo64cbhsCnt2OCHNfyKQKvCE0zZsuRNVGhg1Z
         5SXTcYrZQ7/HLQg94qZiAH+QFmHKhT6XLZqRBetLwNveayg1UfVF238CHErz3uMgoAFF
         nIWbfYGNnDjehnABlLvc9z5BANDGOqQh4xkxS7diB0UxAWAe3ixxYH5+6DTiSImK6c84
         K7sXDri39ufkh74mzXM2czxmLpUkTK3g1FL1Ikl8U6rkviJbI2jB5Fjlk2s3OCCrhUog
         hZ40rm6YJo184GRLNPontLfe1NYDxV131c5ejJg/MVvyIzWmRL+g2WWoRB2iO6PKAO4o
         4SMA==
X-Forwarded-Encrypted: i=1; AJvYcCUA4VOIu7Esq138Rggr9FkJ0J2Sd4k0jfe8tCeInFiFLItT/mqCfu8BxPnCqz4Hn7k4J2/90iWwYbQpeelk83ClO3lFq1wBbwzehXkERdU=
X-Gm-Message-State: AOJu0YwOwMo5uhvQv5+c1X70t+PuqlxMG9bknNgrXT7edVM14vyiCEHq
	0RSVjpVMtfrYd/i9r8LbtxSODkOc0x8ypcsXdcUF+duDF8WCT+KSxZyWG5lr6/A=
X-Google-Smtp-Source: AGHT+IFIkWbvxXqzrH9jBqABTlJqL63Uv/BugjsWwGTjPYFdDGbr5WM7ciRrcJjTFfDy525KTkhg0Q==
X-Received: by 2002:a17:906:cc93:b0:a43:e46b:7a80 with SMTP id oq19-20020a170906cc9300b00a43e46b7a80mr5478341ejb.43.1709552524419;
        Mon, 04 Mar 2024 03:42:04 -0800 (PST)
Message-ID: <70fcb88b-43d0-46e1-9d67-1f8a5d89f4f6@cloud.com>
Date: Mon, 4 Mar 2024 11:42:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader/PCI: skip huge BARs in certain calculations
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Neowutran <xen@neowutran.ovh>
References: <090d572c-5196-46b2-9d6b-741b7cb66d97@suse.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <090d572c-5196-46b2-9d6b-741b7cb66d97@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2024 07:32, Jan Beulich wrote:
> BARs of size 2Gb and up can't possibly fit below 4Gb: Both the bottom of
> the lower 2Gb range and the top of the higher 2Gb range have special
> purpose. Don't even have them influence whether to (perhaps) relocate
> low RAM.
>
> Reported-by: Neowutran <xen@neowutran.ovh>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> If we wanted to fit e.g. multiple 1Gb BARs, it would likely be prudent
> to similarly avoid low RAM relocation in the first place. Yet accounting
> for things differently depending on how many large BARs there are would
> require more intrusive code changes.>
> That said, I'm open to further lowering of the threshold. That'll
> require different justification then, though.
>
GPUs without resizable BARs tend to expose 256MiB on the BAR regardless
of the amount of internal VRAM, AFAIK. So IMO 256 MiB is not a totally
unmotivated number. I don't know which other PCIe devices might expose
such big BARs for comparison.

Cheers,
Alejandro

