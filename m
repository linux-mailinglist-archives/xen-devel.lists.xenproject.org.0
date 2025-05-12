Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E61AB4538
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 21:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982120.1368672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZC5-0005HC-42; Mon, 12 May 2025 19:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982120.1368672; Mon, 12 May 2025 19:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZC5-0005Eb-0o; Mon, 12 May 2025 19:52:09 +0000
Received: by outflank-mailman (input) for mailman id 982120;
 Mon, 12 May 2025 19:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4yg=X4=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uEZC3-0004zZ-4L
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 19:52:07 +0000
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94bf6181-2f6a-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 21:52:06 +0200 (CEST)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b1a1930a922so3571689a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 12:52:06 -0700 (PDT)
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
X-Inumbo-ID: 94bf6181-2f6a-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747079525; x=1747684325; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGTv3/aA0s0HwZUogkKn2jUr+jH8cCBc+j6D0zSQ/PQ=;
        b=QSMCqXQNJHcoGCGYqknlfQDpiRz6qOOgdJ9zBGB/ih+dijNwi2cXLEk8na8h6/eSFR
         iqVN5XlUgVF9DvaKs60PCVnz1ZSRlqtcWq/uo9LUb26Dh11ZYIe9JvfbolsmagXjpXP0
         PJFhWgRAbDTwUydLRKAso/DOll6U5g/igMrRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747079525; x=1747684325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGTv3/aA0s0HwZUogkKn2jUr+jH8cCBc+j6D0zSQ/PQ=;
        b=BHfmGYJdqwhmnsRWVyBbKNKDm5NX6+rg55lBV0BXH2xmqHypHPSt6dE7gXWbwTPtxH
         GLtRjEaG0gCEGSOGpr5W8ZoWD3iROzBQxLSG8rT0N7S9Y/RC2wDOfKf7aXcQQ+w0Zuaa
         o+GJ6elvpUpPIwBznelbjYcmm6rv/+Q7OAqxOGTzQxZpWnXxFHG1JqAWkmC/6JLn2Seo
         ufXk+o0sR+/qB+Po3HayCxuzbh6C4Eu3UiVYWriIW0n6ekxZA9nPTorTxqLcRm9EiQI0
         DEK6IZAE55rl392+hUSl3ValMYdWmsSBKb5KpAjPZuiAFEub72yVdIucrueeD8NFDc3c
         iYFg==
X-Forwarded-Encrypted: i=1; AJvYcCW4wdqHSh/dJ9QK1XEP5LA1KqmTTfAbmy+CVka1psaBx5cBMSjuXEfsia+uNbC54zHfaxBRkeWRpkY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDw710yGPaOsDt4jaNIJD5H0cJVkSTf0QLdHubCYFGLDjWkKo1
	spCwjRjWHihivDSSzCSpMPUhdTHw35Vuo5xQCT23M3PXyiiSTErCMod7rlhIOLBbhpWCJSGPtZz
	nZUe/b3CJK6ZZen6FcApJZp9i0cqCk4hVQhdAow==
X-Gm-Gg: ASbGncsV96B7s99doV3nCYf+kskaHjL9Gq6jnaUboEoKzOMmJnNjW1lVzSsbdXvrMCc
	XF9tjDereO8EHDlqewBCUzve24a2BE7fCewuluQbqsY0qLKz6c9/jloNG5kALJGgPzh3ylti3RU
	g7M9o4bOI0H1useSRSN1DuUopGVukSX8Y=
X-Google-Smtp-Source: AGHT+IFsWMPz3f8zOO8mOEYTFNd80BUVgatRmSmeE75kxwRXdpKaj/7wZ8rrWasZUn+qIt9cSX6y0Y5XPjhtjjRUouQ=
X-Received: by 2002:a17:902:ecd0:b0:22e:634b:14ca with SMTP id
 d9443c01a7336-22fc91aeceamr200811645ad.50.1747079525096; Mon, 12 May 2025
 12:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250506162347.1676357-1-kevin.lampis@cloud.com>
 <10454237-2ada-4972-8e31-8ae21a6d6d22@suse.com> <33bb2c1d-0283-4cea-b1ce-84ef0ea950ad@citrix.com>
In-Reply-To: <33bb2c1d-0283-4cea-b1ce-84ef0ea950ad@citrix.com>
From: Kevin Lampis <kevin.lampis@cloud.com>
Date: Mon, 12 May 2025 20:51:54 +0100
X-Gm-Features: AX0GCFsaNp41-24XDxqXzlJQ-Vs6m3D4Sxow2Yl1RJMnL8qLHEGwMwCtm8cvLjU
Message-ID: <CAHaoHxbAkZprmUx01WgWM3hqiwgGPAGm1TmoxbgOL+pF+7xFRg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add lockdown mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 12:51=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> Kevin: It will be best to resend the series in full.

Ok.

