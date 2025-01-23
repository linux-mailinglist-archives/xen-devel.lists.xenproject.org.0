Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 208FCA1A564
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 15:02:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876271.1286651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taxn7-0001Ua-TL; Thu, 23 Jan 2025 14:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876271.1286651; Thu, 23 Jan 2025 14:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taxn7-0001Sk-QY; Thu, 23 Jan 2025 14:02:41 +0000
Received: by outflank-mailman (input) for mailman id 876271;
 Thu, 23 Jan 2025 14:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lw3w=UP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taxn6-0001SS-FU
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 14:02:40 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4610c39-d992-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 15:02:38 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d9b6b034easo1981259a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 06:02:38 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc0e9f5a75sm859627a12.40.2025.01.23.06.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 06:02:37 -0800 (PST)
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
X-Inumbo-ID: b4610c39-d992-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737640958; x=1738245758; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/y5Gr8QBrV9P5vy6alHK/Y3zsWpx60h7+msUsErPQDQ=;
        b=Nn67jt20MPO0TME9rkGoOzV89PbnPWfHsD1cQVLyUAE+Wa9DbeaNT9nUryDkPlGgNj
         qPTgOPFwt37oZ04gNhLB/rskA5HWowIct8E6g8VYZ2FcDjZP+e+bccPD+d+mbidOe5Y+
         cGlxI5T1psH7E4vg3LT136EFDv7bT3j6Heh04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737640958; x=1738245758;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/y5Gr8QBrV9P5vy6alHK/Y3zsWpx60h7+msUsErPQDQ=;
        b=ijMjHAvSsv+GDhqkTaZqEtrPyhqaZlj0SwCsI3kFREWFtQKq41UcRtzGkuIOtw7B2E
         AFY6u0W7vWJwX1RjwIEspY4W8Zc5B0a/fuGYdW9njwBsrpJsFw0UIcTmQzSUSoz/GyAj
         jcinp/7b/U6nzz9pkxD7oSUWyqoVdJXgX51cIvgFUcmL1SArXIvsYvzHJ+orMR/y+j7k
         N3zE0I6oA6uPRqay6yCDpP9AebNz6EI046g+Lv5VFlf0uASL/RYyztgph5V6QWioR+Xu
         bgQslptl48PDOAz5n/BZtibLmDrGhOv6OyHJdBzVqSUszgCoedLGpX9EYWIV1EOTMx4p
         D2vQ==
X-Gm-Message-State: AOJu0YxafgoIZzJsPYyctWPVg8xeaOdoOvjWPT/kCPw/Sfq/R7v0nGQq
	NPv0S6B7prebo+Rso4BNaaT728VRBRF74LWUNzNnoroV2JtMqnmTp7anckWptNI=
X-Gm-Gg: ASbGnctmfCxUTXn/a4vOFdTDLi8L7U7sCSQAHiqL42KhBzAqOGVO7+q7xtvWO+Y1cVJ
	W0uxF88piGuUDZID1FOvdak7zTOPGFHDkU8c1qtHUZVJFbnYyy32kL9905Rh8ZBhTiZU0i5SZxe
	y2PzRwZRUhvWCQbR/n3JRl1DiFVAwhWNZ5k8nT9pf8GkFTe8lhqA4jAn+jyfyGjdmlqfY6RYPdT
	nTVGVlR0Hz6IbHlaViLYoVUu+qxymZfwiiqF+8yIHZC1vGQJs/DS6Xfowqz8l6JWxfsJI0IgZfU
	Jpt7pKj5UA==
X-Google-Smtp-Source: AGHT+IGrsTrKj0Bx/slw8fyvnmOSjhQPheiyoBi/n/hH+4wjHznHoLu07nwiczXUoPMQieYHX5J1tw==
X-Received: by 2002:a05:6402:348c:b0:5dc:1239:1e5b with SMTP id 4fb4d7f45d1cf-5dc123920a9mr1232823a12.23.1737640957782;
        Thu, 23 Jan 2025 06:02:37 -0800 (PST)
Date: Thu, 23 Jan 2025 15:02:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV: further harden guest memory accesses against
 speculative abuse
Message-ID: <Z5JL_HXbtsx5g02y@macbook.local>
References: <a537dd1e-bbd3-4ef8-8014-6bb432484c57@suse.com>
 <Z5IuEq9Lauhn8glx@macbook.local>
 <10a655b0-1cdc-4e14-8fcf-221336ccc0ac@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10a655b0-1cdc-4e14-8fcf-221336ccc0ac@suse.com>

On Thu, Jan 23, 2025 at 01:44:34PM +0100, Jan Beulich wrote:
> On 23.01.2025 12:54, Roger Pau Monné wrote:
> > On Tue, Nov 05, 2024 at 02:56:42PM +0100, Jan Beulich wrote:
> >> The original implementation has two issues: For one it doesn't preserve
> >> non-canonical-ness of inputs in the range 0x8000000000000000 through
> >> 0x80007fffffffffff. Bogus guest pointers in that range would not cause a
> >> (#GP) fault upon access, when they should.
> >>
> >> And then there is an AMD-specific aspect, where only the low 48 bits of
> >> an address are used for speculative execution; the architecturally
> >> mandated #GP for non-canonical addresses would be raised at a later
> >> execution stage. Therefore to prevent Xen controlled data to make it
> >> into any of the caches in a guest controllable manner, we need to
> >> additionally ensure that for non-canonical inputs bit 47 would be clear.
> >>
> >> See the code comment for how addressing both is being achieved.
> >>
> >> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> RFC: Two variants of part of the logic are being presented, both with
> >>      certain undesirable aspects: The first form is pretty large and
> >>      ugly (some improvement may be possible by introducing further
> >>      helper macros). The alternative form continues to use RCR, which
> >>      generally would be nice to do away with. Then again that's also
> >>      slightly smaller generated code.
> > 
> > Oh, I assume that's why there's a hardcoded .if 1, I was wondering
> > about that.  What's the specific issue with using rcr?
> 
> It's slower than SHL. Albeit - checking a few places - not as much as I
> thought I remembered it would be.
> 
> >  And why is the
> > more complex set of macros that use setc plus a shl better?
> 
> They're slightly longer (beyond the source complexity), but (presumably)
> a little faster.
> 
> > Why not use cmovc:
> > 
> > mov $(1 << 63), \scratch1
> > cmovc \scratch1, \scratch2
> > 
> > AFAICT \scratch1 is not used past the btr instruction, and hence can
> > be used for the cmovc?
> 
> Such an alternative was already considered back at the time:
> https://lists.xen.org/archives/html/xen-devel/2021-02/msg01067.html.
> Granted I was wrong there about needing a 3rd scratch register, but
> the code size consideration remains - we have dozens of instances of
> this macro in the resulting binary, after all. Yet ftaod, this isn't
> to mean we can't re-consider. Given the above I'm inclined though to
> go the RCR route.

RCR or CMOVC would either be fine by me.  The SETC is IMO too complex,
and using it would need a clear performance justification compared to
RCR or CMOVC.

Thanks, Roger.

