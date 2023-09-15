Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8187A130A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 03:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602831.939604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgxug-0002tr-Rx; Fri, 15 Sep 2023 01:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602831.939604; Fri, 15 Sep 2023 01:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgxug-0002r8-P3; Fri, 15 Sep 2023 01:46:30 +0000
Received: by outflank-mailman (input) for mailman id 602831;
 Fri, 15 Sep 2023 01:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=upey=E7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgxuf-0002pp-Bu
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 01:46:29 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af85687e-5369-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 03:46:27 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-991c786369cso219788666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 18:46:27 -0700 (PDT)
Received: from [192.168.1.10] (host-92-12-44-130.as13285.net. [92.12.44.130])
 by smtp.gmail.com with ESMTPSA id
 lg13-20020a170906f88d00b009828e26e519sm1717612ejb.122.2023.09.14.18.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 18:46:26 -0700 (PDT)
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
X-Inumbo-ID: af85687e-5369-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694742387; x=1695347187; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/We05QBGf54xap/mvQHQ6SHgmclfDs/rkBUva3BMHN4=;
        b=cJceC9q0HvPKBoF0RvBQkxDcOQaovEfVkYcA02fdyE1gdNFGszNFPdBqZDZ8X279TT
         pEed44VV0HA9yZv+j0cVZLtVaf8YqnIL1iHQIJGOzPUZq2xxqVrU3qCrLbyzZ3fPT2d4
         HAIVyfi5EA4ue3R8cMx2oIMo7O14X1gnRnL04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694742387; x=1695347187;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/We05QBGf54xap/mvQHQ6SHgmclfDs/rkBUva3BMHN4=;
        b=dwIhYuS4Stf0x7BIGbeishJlZ8B1s3Uz65Q8MCLa45BgbsSQJutQqE6lelWF+Pu8Pu
         z4ujgilsArgaQlnRAhT2wZbJ7hsFGguebpGfeXQFiZId26ljPtiSFaabQ4Ybw6oh7W4o
         LLp3H0ig1X3WTJx6GVSJRbaHx5Xu8dZpyzunQoax+lyVWoTtoGDR4OWN8nYOFG+MYN13
         UynT6hCqzMKvzufjmrz0T2N/cdQ1i1/kWnjOcXPuC9a2wtewmBzCvtexRor2EcsRFkVo
         SrtNxzNiG5eHUeSVqCIqp0ZOW/p4bZdP09graNJgfGeFy4290QJ37i8k3BWpTtNqIBAo
         7v/w==
X-Gm-Message-State: AOJu0Yxdvw4dlKIFHLB4MNF1x8ctcHVC+kZtRhkoCbJXyaTvLUxmiApL
	jUFD2OCJJubFd+DstvlI8fKaNA==
X-Google-Smtp-Source: AGHT+IHPu+cpAJWccx/7qe6vKXqWPcxLrO1CLKCzaitC2xOztw0rjEqS/irWK79hYFHgOnKDG9NiHw==
X-Received: by 2002:a17:906:9c9:b0:9a4:88af:b82 with SMTP id r9-20020a17090609c900b009a488af0b82mr78302eje.77.1694742387253;
        Thu, 14 Sep 2023 18:46:27 -0700 (PDT)
Message-ID: <af5990d5-58d5-9109-b37b-1f696a43fe86@citrix.com>
Date: Fri, 15 Sep 2023 02:46:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: andrew.cooper3@citrix.com
Subject: Re: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
Content-Language: en-GB
To: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, luto@kernel.org, pbonzini@redhat.com, seanjc@google.com,
 peterz@infradead.org, jgross@suse.com, ravi.v.shankar@intel.com,
 mhiramat@kernel.org, jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
 <6f5678ff-f8b1-9ada-c8c7-f32cfb77263a@citrix.com> <87y1h81ht4.ffs@tglx>
 <7ba4ae3e-f75d-66a8-7669-b6eb17c1aa1c@citrix.com> <87v8cc1ehe.ffs@tglx>
 <50e96f85-66f8-2a4f-45c9-a685c757bb28@citrix.com>
 <5cf50d76-8e18-2863-4889-70e9c18298a1@zytor.com>
In-Reply-To: <5cf50d76-8e18-2863-4889-70e9c18298a1@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/09/2023 1:38 am, H. Peter Anvin wrote:
> On 9/14/23 17:33, andrew.cooper3@citrix.com wrote:
>>
>> It's an assumption about what "definitely won't" be paravirt in the
>> future.
>>
>> XenPV stack handling is almost-FRED-like and has been for the better
>> part of two decades.
>>
>> You frequently complain that there's too much black magic holding XenPV
>> together.  A paravirt-FRED will reduce the differences vs native
>> substantially.
>>
>
> Call it "paravirtualized exception handling." In that sense, the
> refactoring of the exception handling to benefit FRED is definitely
> useful for reducing paravirtualization. The FRED-specific code is
> largely trivial, and presumably what you would do is to replace the
> FRED wrapper with a Xen wrapper and call the common handler routines.

Why do only half the job?

There's no need for any Xen wrappers at all when XenPV can use the
native FRED paths, as long as ERETU, ERETS and the relevant MSRs can be
paravirt (sure - with an interface that sucks less than right now) so
they're not taking the #GP/emulate in Xen path.

And this can work on all hardware with a slightly-future version of Xen
and Linux, because it's just a minor adjustment to how Xen writes the
exception frame on the guests stack as part of event delivery.

~Andrew

