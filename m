Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70136AC4C98
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 13:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998251.1379031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJs1p-0006oC-7t; Tue, 27 May 2025 10:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998251.1379031; Tue, 27 May 2025 10:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJs1p-0006m9-3w; Tue, 27 May 2025 10:59:29 +0000
Received: by outflank-mailman (input) for mailman id 998251;
 Tue, 27 May 2025 10:59:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0jbf=YL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uJs1n-0006lz-Jy
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 10:59:27 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4eda8ae-3ae9-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 12:59:21 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4c9024117so2462410f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 03:59:25 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f38142f1sm264813715e9.31.2025.05.27.03.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 03:59:24 -0700 (PDT)
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
X-Inumbo-ID: a4eda8ae-3ae9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748343565; x=1748948365; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h29etSjYCith9Rt5c0e0WrcOLkdV6ZSMP06fnHdPpL4=;
        b=goMv7xAZEp2Naixd32ZF6IDWG9JKaSQY7nZBf6eeKhZZNiBotryLlidlze/VFGlpBG
         9q1ElIYfRfTGTXv5WIL6UuBqizB2hWvJX5/tNk400+V+eFJBt/RM4qRbx/mS0zBJ3LeB
         WMNq+x8BCyRtqUZ4R5qTfQ6A6mSVlZClhPT1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748343565; x=1748948365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h29etSjYCith9Rt5c0e0WrcOLkdV6ZSMP06fnHdPpL4=;
        b=Kse17QXrtnAJcbT/4+nNKXj/x5x9vRixn1uYJv8JHU7FDbeVu6PE7VSPCa9VK5mwR2
         GbCq98YhLSoz93zwgDmFAfmw7zebS8hntvpx9usz7rrKSVTUjXVbEk4WSm4HoaAE+xCw
         8l3l5D87J7qELMyb1rx6Gvdz6lLXE1pFKhbOTVaUgguwWv0PuYBhDHFfqvOuiaPS7fJb
         tBoginfkku7JUPHGk0dKibIdpyK+ayMuECWI5aCiVFsmbh3vEufqsxMlqWJDrDFcGEp7
         hEa+Jk8dw4fy5EAxfhwM0+/6N4m8llwon3hvBKVZ068nWXoM/PCfsBuvvos2NI+UGwQm
         VRoA==
X-Gm-Message-State: AOJu0YyruyejfAVpnXyxKzWlohgcrnzF3Wsd6KAeJrQ8K2v7hUsfhT8V
	ul0K0ewB9FYSLejcuwWKn6Dkl8Z0Q2dIgmyY2Gtu1nwKFFFtli7/0G6ykTyQPIiJESw=
X-Gm-Gg: ASbGncs5W663Dcs4dPeK46SdsG645aWYx9PyzJBbwQM4Hcjy/QwmDpByAwv3XRsqlkl
	UA9JLQDRyHMPI8MMaBON8DQjT6T7xEw71trOrtRQHoDfJCnw9hsLo8yBLy11xJ8i8ah7GQUhD6Z
	AQif+c5JhZKu/0UgCymfNSxEqZOWYNKj6+aDHGrb8tJCKwUtRV5yhfr9u/crXKd0P6hz40fmmQQ
	D0pQYuk3iiJIA997KlPGRgOlSVLE92bAkXopmX7lcqf+lXVe1tbhIa/MNSwBCHjPQ+/1d1nMolr
	VWQkAm+YBusQHpCGcLvu4y/q2MmC4/JuRnWabtfW1kZA4ILCcNIe5iDKDz+f/fo71XrBTpCtVAl
	KaHHG3hvJEOtAVlLOPc/L8GhA
X-Google-Smtp-Source: AGHT+IEKuiuhECiy38BXHjHEquj1+nXtx9Zw7dyv3TzAo0XzE968/F4NksSqH+zi9ZhjBTz0iGE8yw==
X-Received: by 2002:a05:6000:4012:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3a4e5e9e265mr103570f8f.18.1748343564908;
        Tue, 27 May 2025 03:59:24 -0700 (PDT)
Date: Tue, 27 May 2025 12:59:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Manuel Bouyer <bouyer@antioche.eu.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/pv: Fix breakpoint reporting
Message-ID: <aDWbCzpdBxMwGIkX@macbook.local>
References: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
 <20250526205302.997387-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526205302.997387-1-andrew.cooper3@citrix.com>

On Mon, May 26, 2025 at 09:53:02PM +0100, Andrew Cooper wrote:
> x86_merge_dr6() is not a no-op when 0 is passed in; it will discard the
> previously latched breakpoint bits.
> 
> The combination of do_debug()'s manual call to x86_merge_dr6() for external
> debuggers, and pv_inject_DB() calling pv_inject_event(), results in two
> x86_merge_dr6() calls.
> 
> Feed the same pending_dbg in the second time.  This makes pv_inject_event()'s
> update of dr6 effectively a no-op, retaining the correct breakpoint bits.
> 
> Fixes: db39fa4b27ea ("x86/pv: Fix merging of new status bits into %dr6")
> Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

