Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0164D89BD02
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 12:25:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701890.1096491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtmBq-00061a-1E; Mon, 08 Apr 2024 10:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701890.1096491; Mon, 08 Apr 2024 10:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtmBp-0005yS-Ty; Mon, 08 Apr 2024 10:25:25 +0000
Received: by outflank-mailman (input) for mailman id 701890;
 Mon, 08 Apr 2024 10:25:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djzs=LN=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rtmBo-0005yI-0F
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 10:25:24 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e1aa142-f592-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 12:25:22 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a519e04b142so380623366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 03:25:22 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gt17-20020a1709072d9100b00a51b3d4bb39sm3232208ejc.59.2024.04.08.03.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 03:25:21 -0700 (PDT)
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
X-Inumbo-ID: 4e1aa142-f592-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712571921; x=1713176721; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nTjH8TUnN2BaFbh7NQcnmBBOL2CeQ8UpqBOXW12sZhk=;
        b=Z2LhahIZp5ul8E8HMKeTJoC4d88qFgPdyxoi7NtMIamGPLckW4/HUZnkkLsJ5TqPVU
         CpKwv24BhOQW/2XA+2lLb93wlkWjbBkwByhsMVKSj0DUfSS1dk4NLio3GBVfo6GCEMrC
         xBEjFqzsC1y/DbyGbQhQS0tZw3agkXtueo4g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712571921; x=1713176721;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTjH8TUnN2BaFbh7NQcnmBBOL2CeQ8UpqBOXW12sZhk=;
        b=aE5CaYvjuKWS4TvPbDb/m0Ve7VoIFyHWw565WnOh7wYB3XwdCcMYej7QGRCXXWiKyM
         6K7PIlelTpQ4O1tMmLpwBgPylQwVq7+6TUNnyGSHKiAX6JIUlQZ78/1ceG8CTeCpLXmK
         OUOyjSq7t3OxrBDVkoRBjr75S4VE/ZInZKRjaS0/N8fbBbqGBDSK0HY5i5Ee6Oh8sRH+
         F601JPEglzdUbpmfHSozI6qhVfZQ7IJSqZ3/U2bpLxdcB+vMSlFNGI4jMLUuQyFDhNI6
         Npu9qpBn+H4bDHF75qgZih7YhXDS/NzU2ZzFhctGtp/Y5OegN2P1ByCzQmNg8COI2BS2
         hhyA==
X-Forwarded-Encrypted: i=1; AJvYcCWoAy9iVw9mUcx8/b1xQbO0iEn/k2HVX3+XMO/+9Enq7Tlbti/85v6TDArK0IqWAXQqaNUGi6srJAjlKH/lb/THNlDZ1cG4h5UPyVZ8djs=
X-Gm-Message-State: AOJu0YzjT844Mby8ZJXBtNumgFQHXamM++g8WVL5ccZsi5oeGH/TDAHE
	Zvd9sBJNvj0PGGOqzvMN5TxQ6OY+/shgU7OZfLPkpk7zaWhiKzTYJd7uFEvUl8g=
X-Google-Smtp-Source: AGHT+IFXL4X1RZviJ+DH/25TuuehQsIlW0O+COeUZmAkB3cvxMwxYwxDRWsSXNYyzntD1fP9l/926Q==
X-Received: by 2002:a17:906:594c:b0:a46:22a3:479f with SMTP id g12-20020a170906594c00b00a4622a3479fmr6299841ejr.21.1712571921493;
        Mon, 08 Apr 2024 03:25:21 -0700 (PDT)
Date: Mon, 8 Apr 2024 11:25:20 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: Linux Xen PV CPA W^X violation false-positives
Message-ID: <bab9ec69-5927-44c5-b8f9-0900c9862421@perard>
References: <20240124165401.35784-1-jandryuk@gmail.com>
 <a2246242-627a-493b-9cd4-c76b0cb301ee@suse.com>
 <CAKf6xps9X=6GYxuk9u2cPYh_pzpLu2MQ00smydRQ40TjxDhgEQ@mail.gmail.com>
 <9b5a105a-650c-4b33-9f4e-03612fb6701c@suse.com>
 <f86bc525-1a77-4b7a-b1b3-9a22d9525e90@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f86bc525-1a77-4b7a-b1b3-9a22d9525e90@perard>

On Mon, Apr 08, 2024 at 11:22:59AM +0100, Anthony PERARD wrote:
> On Thu, Mar 28, 2024 at 02:00:14PM +0100, Jürgen Groß wrote:
> > Hi Jason,
> > 
> > On 28.03.24 02:24, Jason Andryuk wrote:
> > > On Wed, Mar 27, 2024 at 7:46 AM Jürgen Groß <jgross@suse.com> wrote:
> > > > 
> > > > On 24.01.24 17:54, Jason Andryuk wrote:
> > > > > +
> > > > > +                     return new;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > >        end = start + npg * PAGE_SIZE - 1;
> > > > >        WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
> > > > >                  (unsigned long long)pgprot_val(old),
> > > > 
> > > > Jason, do you want to send a V2 with your Signed-off, or would you like me to
> > > > try upstreaming the patch?
> > > 
> > > Hi Jürgen,
> > > 
> > > Yes, please upstream your approach.  I wasn't sure how to deal with
> > > it, so it was more of a bug report.
> > 
> > The final solution was a bit more complicated, as there are some
> > corner cases to be considered. OTOH it is now complete by looking
> > at all used translation entries.
> > 
> > Are you able to test the attached patch? I don't see the original
> > issue and can only verify the patch doesn't cause any regression.
> > 
> > 
> > Juergen
> 
> Hi Jürgen,
> 
> I gave a try to the patch in this email with osstest, and I can't find a
> single "CPA detected W^X violation" log entry, when there's seems to be
> many in osstest in general, from dom0 it seems as it's on the host
> serial console usually.
> 
> http://logs.test-lab.xenproject.org/osstest/logs/185252/
> 
> If you look in several "serial-$host.log*" files, there will be the
> "CPA detected" message, but they happen on previous test run.
> 
> I did an other smaller run before this one, and same thing:
> http://logs.test-lab.xenproject.org/osstest/logs/185186/
> 
> And this other run as well, which I failed to setup properly with lots
> of broken, but no failure due to the patch and I can't find any "CPA
> detected" messages.
> http://logs.test-lab.xenproject.org/osstest/logs/185248/
> 
> I hope that helps?

BTW, I did apply the patch to Linux 6.1:
https://xenbits.xen.org/gitweb/?p=people/aperard/linux.git;a=shortlog;h=refs/heads/9b5a105a-650c-4b33-9f4e-03612fb6701c@suse.com

-- 
Anthony PERARD

