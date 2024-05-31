Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A68D5BA6
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 09:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733335.1139512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCwr5-0002vy-Nq; Fri, 31 May 2024 07:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733335.1139512; Fri, 31 May 2024 07:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCwr5-0002uN-Kr; Fri, 31 May 2024 07:39:15 +0000
Received: by outflank-mailman (input) for mailman id 733335;
 Fri, 31 May 2024 07:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFcc=NC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCwr4-0002uH-JI
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 07:39:14 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df19e9f9-1f20-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 09:39:12 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4211e42e362so18835515e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 00:39:11 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421270ad52dsm45890645e9.42.2024.05.31.00.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 00:39:10 -0700 (PDT)
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
X-Inumbo-ID: df19e9f9-1f20-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717141151; x=1717745951; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cDc024rXtosex59CMa4/lBxCrn3pW6jBZBTVPYFmpqI=;
        b=WyUT4zFDZBEb7W1pU4RJchCwSX11zENtTwBJpO0X7b6/cSd0EAF4pA9n36435Y57g7
         PitQ91wFJ7x6XGtejGkQujbNdt1WXHmi0iB5pkri9qe4L2cejxn9d+zRqPuOhZE7kb1B
         vRRa9Zh1NDiyqC394M/G71/wWAkzrJA6Vl6j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717141151; x=1717745951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDc024rXtosex59CMa4/lBxCrn3pW6jBZBTVPYFmpqI=;
        b=ZTQ2NTeJpj/D6goEd+xeR8KWuyhGbPS9tMi0KJG2ZZsXUaEfCjstYVlYx0n9xINk22
         r+2qEfx2AJBLxi9ZDM7DJxhQqJyu0TxvXdjOtrip28WnFkHx7ybmESslWw/LAqBh1PC+
         0gNZhze6Yx8Tru4zy6+vKnBXrBlTz3cFo2Eidr4Ba5jw+q604FgtwpO5V33Hf+S/XCLQ
         a/Ia0ETiKeCv5c7PiY1Z2/E5aE0wPEjmLkiFKeQQBUqtAdKmUW9LlQpKKwSzZDRWTLIv
         tw1XsRXqiLpC83W+xVV1Hphpo5NIv8FljG/oMSXLyBkpX7ulIWsMt9LRf/uP5NFO/T/7
         FiZg==
X-Forwarded-Encrypted: i=1; AJvYcCWJVEwm+Vf9hRrWH1e0u1oKBp4sC1CZcuH1ctLzj94dhCKXjWihiQfEdKktJ7trhQ+vOjpOr15XKrEKFWdB+vHipO1SupirRM4oLekcQ/8=
X-Gm-Message-State: AOJu0Yx+BvlKgB6z4oybA7dpWeisQkadLmHHsKbg0HpDN8/N1D44EWxF
	c1l0wKX230HX4froNXEKQR6GSOxwyBiEqSEBEoTRgWkxbF5BVkAwU5pQ9Wn2AJI=
X-Google-Smtp-Source: AGHT+IGtWhplZak+P2xZbJ5xQnjQ1blltKczKDPJirQKSrAYXHU9PD/YUY00ruNvL7VgR8Rv6A2yug==
X-Received: by 2002:a05:600c:450b:b0:421:2990:7f8b with SMTP id 5b1f17b1804b1-4212e044c39mr9594985e9.3.1717141150893;
        Fri, 31 May 2024 00:39:10 -0700 (PDT)
Date: Fri, 31 May 2024 09:39:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19 4/9] x86/irq: describe how the interrupt CPU
 movement works
Message-ID: <Zll-nd7hdZDZy-gn@macbook>
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-5-roger.pau@citrix.com>
 <24201381-2a43-427e-a3e5-1de316d212b8@suse.com>
 <ZldJgwu2nDGv2HJP@macbook>
 <011d96d4-8778-430f-bb93-4a48f7ddd32c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <011d96d4-8778-430f-bb93-4a48f7ddd32c@suse.com>

On Fri, May 31, 2024 at 09:06:10AM +0200, Jan Beulich wrote:
> On 29.05.2024 17:28, Roger Pau Monné wrote:
> > On Wed, May 29, 2024 at 03:57:19PM +0200, Jan Beulich wrote:
> >> On 29.05.2024 11:01, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/include/asm/irq.h
> >>> +++ b/xen/arch/x86/include/asm/irq.h
> >>> @@ -28,6 +28,32 @@ typedef struct {
> >>>  
> >>>  struct irq_desc;
> >>>  
> >>> +/*
> >>> + * Xen logic for moving interrupts around CPUs allows manipulating interrupts
> >>> + * that target remote CPUs.  The logic to move an interrupt from CPU(s) is as
> >>> + * follows:
> >>> + *
> >>> + * 1. cpu_mask and vector is copied to old_cpu_mask and old_vector.
> >>> + * 2. New cpu_mask and vector are set, vector is setup at the new destination.
> >>> + * 3. move_in_progress is set.
> >>> + * 4. Interrupt source is updated to target new CPU and vector.
> >>> + * 5. Interrupts arriving at old_cpu_mask are processed normally.
> >>> + * 6. When an interrupt is delivered at the new destination (cpu_mask) as part
> >>> + *    of acking the interrupt move_in_progress is cleared and move_cleanup_count
> >>
> >> Nit: A comma after "interrupt" may help reading.
> >>
> >>> + *    is set to the weight of online CPUs in old_cpu_mask.
> >>> + *    IRQ_MOVE_CLEANUP_VECTOR is sent to all CPUs in old_cpu_mask.
> >>
> >> These last two steps aren't precise enough, compared to what the code does.
> >> old_cpu_mask is first reduced to online CPUs therein. If the result is non-
> >> empty, what you describe is done. If, however, the result is empty, the
> >> vector is released right away (this code may be there just in case, but I
> >> think it shouldn't be omitted here).
> > 
> > I've left that out because I got the impression it made the text more
> > complex to follow (with the extra branch) for no real benefit, but I'm
> > happy to attempt to add it.
> 
> Why "no real benefit"? Isn't the goal to accurately describe what code does
> (in various places)? If the result isn't an accurate description in one
> specific regard, how reliable would the rest be from a reader's perspective?

FWIW, it seemed to me the reduction of old_cpu_mask was (kind of) a
shortcut to what the normal path does, by releasing the vector early
if there are no online CPUs in old_cpu_mask.

Now that you made me look into it, I think after this series the
old_cpu_mask should never contain offline CPUs, as fixup_irqs() will
take care of removing offliend CPUs from old_cpu_mask, and freeing the
vector if the set becomes empty.

I will expand the comment to mention this case, and consider adjusting
it if this series get merged.

> >>> + * 7. When receiving IRQ_MOVE_CLEANUP_VECTOR CPUs in old_cpu_mask clean the
> >>> + *    vector entry and decrease the count in move_cleanup_count.  The CPU that
> >>> + *    sets move_cleanup_count to 0 releases the vector.
> >>> + *
> >>> + * Note that when interrupt movement (either move_in_progress or
> >>> + * move_cleanup_count set) is in progress it's not possible to move the
> >>> + * interrupt to yet a different CPU.
> >>> + *
> >>> + * By keeping the vector in the old CPU(s) configured until the interrupt is
> >>> + * acked on the new destination Xen allows draining any pending interrupts at
> >>> + * the old destinations.
> >>> + */
> >>>  struct arch_irq_desc {
> >>>          s16 vector;                  /* vector itself is only 8 bits, */
> >>>          s16 old_vector;              /* but we use -1 for unassigned  */
> >>
> >> I take it that it is not a goal to (also) describe under what conditions
> >> an IRQ move may actually be initiated (IRQ_MOVE_PENDING)? I ask not the
> >> least because the 2nd from last paragraph lightly touches that area.
> > 
> > Right, I was mostly focused on moves (forcefully) initiated from
> > fixup_irqs(), which is different from the opportunistic affinity
> > changes signaled by IRQ_MOVE_PENDING.
> > 
> > Not sure whether I want to mention this ahead of the list in a
> > paragraph, or just add it as a step.  Do you have any preference?
> 
> I think ahead might be better. But I also won't insist on it being added.
> Just if you don't, perhaps mention in the description that leaving that
> out is intentional.

No, I'm fine with adding it.

Thanks, Roger.

