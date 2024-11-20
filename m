Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBD99D3A3D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 13:07:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841091.1256599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDjU1-0008Bh-HT; Wed, 20 Nov 2024 12:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841091.1256599; Wed, 20 Nov 2024 12:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDjU1-00088Y-EO; Wed, 20 Nov 2024 12:06:57 +0000
Received: by outflank-mailman (input) for mailman id 841091;
 Wed, 20 Nov 2024 12:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8JZW=SP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tDjTz-00088P-9F
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 12:06:55 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec0a1f7a-a737-11ef-99a3-01e77a169b0f;
 Wed, 20 Nov 2024 13:06:49 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9aa8895facso360479166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 04:06:49 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e081574sm764898166b.179.2024.11.20.04.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 04:06:48 -0800 (PST)
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
X-Inumbo-ID: ec0a1f7a-a737-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVjMGExZjdhLWE3MzctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTA0NDA5Ljg3OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732104409; x=1732709209; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mZt4WzbXSGVnoNwUN9VSlqfqaDPaLVeH7dy3QiCAhSM=;
        b=ktlD4hFHB/0UJICYMWGe5FZ6qL7Or4kYZUX1t6GmQEVATUkPNZVYydiMneDGf2Rper
         YWzUd6o6xNuBxZutEjkdXY3tNB28xZrE0jWsk6jVzbekIUogEnE6TB5/YGkwdYz1VgYm
         0nU8A78lOvQl+aw1Ps0vBkJVBLX2Y3uFmqmqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732104409; x=1732709209;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZt4WzbXSGVnoNwUN9VSlqfqaDPaLVeH7dy3QiCAhSM=;
        b=Y4sPfrDyZfLsQql2twDU8JEyoKHbmak3YTL1kO6vZk8h0GI+nG4aSjXDhvqyR6NC5o
         yAWjDwU+vUjsiCV8/tuhpysEIkwxWaMCfJopdFrrCboPc2JhJLn5G55/oYjBlsy+Nkd2
         Q3/ocljqkqt25cUy61ke42d40y4pszU8WEgu8b2t1PB21fP02oh+WB16/58oPViioKv7
         m/5Paob1A7MmwGGiuyaeeIBtvMSprU4PmJ0j7UmaztxdhG6w8/A2RN5jW1pLC19A979B
         FvF+o/YKkUbuaAbn7uPagYQv99I7wuHAGcW9AV2J+eNjId+8XTyTetmFDA/S4orb2Vy2
         cNlA==
X-Forwarded-Encrypted: i=1; AJvYcCUXZq7CkNyCpMuczraANRzOsss2WaES8SSSqo/vgcreafVrdhLfctbedRlBKhj3pGAt3m6di5cVFFM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlBouXGZn/Ov2crrXf3GCgVeCAnKsm8h/msR71Xme0JNOX0QFB
	1a/kgcgdZbS/pa1/Umiw6cMI4PGuII9e7bAmetlHNMoeqDeG7CLpEa4GbvdaYb4=
X-Google-Smtp-Source: AGHT+IEg/HBXjv7Am1nQjxuwlRsP5bNrV133PGOyz6ldIWjfu6UCvLmf+Vz1v937XiwwRzm2a5VIog==
X-Received: by 2002:a17:906:ef03:b0:aa4:a810:79c2 with SMTP id a640c23a62f3a-aa4dd57ce42mr239737466b.31.1732104409280;
        Wed, 20 Nov 2024 04:06:49 -0800 (PST)
Message-ID: <b9772a66-ee5f-4cfc-ae55-8d53788f8456@citrix.com>
Date: Wed, 20 Nov 2024 12:06:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/irq: fix calculation of max PV dom0 pIRQs
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20241120113555.38146-1-roger.pau@citrix.com>
 <20241120113555.38146-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241120113555.38146-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/11/2024 11:35 am, Roger Pau Monne wrote:
> The current calculation of PV dom0 pIRQs uses:
>
> n = min(fls(num_present_cpus()), dom0_max_vcpus());
>
> The usage of fls() is wrong, as num_present_cpus() already returns the number
> of present CPUs, not the bitmap mask of CPUs.
>
> Fix by removing the usage of fls().
>
> Fixes: 7e73a6e7f12a ('have architectures specify the number of PIRQs a hardware domain gets')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Yeah, that fls() fails the dimensional analysis sniff test.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Is there any hint as to what the reasoning was?

~Andrew

