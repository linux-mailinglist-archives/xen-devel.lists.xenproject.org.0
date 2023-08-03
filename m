Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AE476EFB1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 18:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576507.902724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbKM-0004qS-EI; Thu, 03 Aug 2023 16:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576507.902724; Thu, 03 Aug 2023 16:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbKM-0004pX-Bg; Thu, 03 Aug 2023 16:37:30 +0000
Received: by outflank-mailman (input) for mailman id 576507;
 Thu, 03 Aug 2023 16:37:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7Gs=DU=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qRbKK-0004pL-G9
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 16:37:28 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 079ecf4c-321c-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 18:37:26 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe45481edfso1267375e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Aug 2023 09:37:26 -0700 (PDT)
Received: from [192.168.23.238] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c218d00b003fe2bea77ccsm310591wme.5.2023.08.03.09.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 09:37:25 -0700 (PDT)
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
X-Inumbo-ID: 079ecf4c-321c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691080646; x=1691685446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vL19yjeY0vCMtRBqOHZepEaKWa9q/fOl1WB+ypjiWzo=;
        b=VswwiWhCpaAA/nAaW58Gl+e9P0fTofSI4xljCW1yc/tyfxUxSqCO/8TnkG9b3s3TQf
         yVKHWJ7oqE3q8d6zU4HKT30aNuIyOEez7KLgBkJkPgT9Z72abG1FkdMx+9vUq0w/1J7E
         R9DHrMHfP5ECNJc34nbO2gij2n2T2TY9oE1IT+5HnqG7PKztpgpiD3+45oLzXaeUFdZp
         D4/lt5VCvKrCiincpz6jiorfjuvzFt2FTEbqaIOGYjUlM7Pouw68jGkXuIQpvHqMGQBl
         7bqH7a1JETEAYAY9uIP5I+n+3cCEnAn9HDkpGsm7K5fbbS6/d7FhG4Ysp7/u1avWKHMq
         oNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080646; x=1691685446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vL19yjeY0vCMtRBqOHZepEaKWa9q/fOl1WB+ypjiWzo=;
        b=DFcOf42tNUJfXhBL8Z7uF3oGDxqCv9FMSZdcww8YKExMIw1e8pxZ3DYUUQX5tFdIq9
         srWm2iv8MKEVzClXlD9RvnMit9oIaeg9nI9rmocCDrRulN7IlTcmYvXiUBxqA+j/iEoU
         FyOWWexlaJTneTzcWZdy2c9BchaV4L6m7wdizdXfJa1rkdezqrgnkzRJAxM+hUarTC2v
         at8KrtyTgCKpniOzvpv5umy9yDzOyyfGAtF6m8wt7aae/dyXHsE9/HftzGfLHNEvrOS4
         9raZX+2gHE67oGZlvFv+epuMs6dZNUNEUJYqVYp9ANNHQYrKMwhUx0+ER1r3EbF6c4gV
         Qv0A==
X-Gm-Message-State: ABy/qLacxNnOKSqcvj4xDext2zdfVT/CByMWuJcJhi/BJ0hTnbgy0Bpt
	m0yG+1n/1mls9AXsDhjqXPw=
X-Google-Smtp-Source: APBJJlHgqNyyzAgqI3bStyQ5BWKGoNks90Mb5QHinX8EbDmAxrooUb9Hd7VWeuYxH2won5req5en4Q==
X-Received: by 2002:a05:600c:219a:b0:3fe:2108:eb8e with SMTP id e26-20020a05600c219a00b003fe2108eb8emr7731597wme.34.1691080645588;
        Thu, 03 Aug 2023 09:37:25 -0700 (PDT)
Message-ID: <cd7b8657-be12-5550-82a3-5a1d07d60f50@gmail.com>
Date: Thu, 3 Aug 2023 17:37:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Reply-To: paul@xen.org
Subject: Re: Ping: [PATCH] x86/HVM: drop dead assignments from
 hvmemul_rep_{movs,stos}()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <32e33a0b-d572-ea7f-b1a8-3263711582e5@suse.com>
 <alpine.DEB.2.22.394.2307271141500.3118466@ubuntu-linux-20-04-desktop>
 <97527049-e3ac-9d8e-806c-2204ed7f68dd@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <97527049-e3ac-9d8e-806c-2204ed7f68dd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2023 12:46, Jan Beulich wrote:
> On 27.07.2023 20:41, Stefano Stabellini wrote:
>> On Thu, 27 Jul 2023, Jan Beulich wrote:
>>> In the latter case the variable altogether is then unused and hence gets
>>> dropped, eliminating a Misra Rule 5.3 violation. I'm afraid I mistakenly
>>> introduced both assignments in 57a57465daaf ("x86/HVM: use available
>>> linear->phys translations in REP MOVS/STOS handling"), likely as a
>>> result of some re-work on the patch.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Paul - any chance of an ack?
> 

Sure.

Reviewed-by: Paul Durrant <paul@xen.org>



