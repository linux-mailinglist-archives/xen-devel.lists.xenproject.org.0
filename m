Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A6B1CAA5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 19:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072066.1435397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujhsY-00070W-1W; Wed, 06 Aug 2025 17:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072066.1435397; Wed, 06 Aug 2025 17:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujhsX-0006wy-UY; Wed, 06 Aug 2025 17:24:41 +0000
Received: by outflank-mailman (input) for mailman id 1072066;
 Wed, 06 Aug 2025 17:24:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kasG=2S=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujhsW-0006wp-S8
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 17:24:40 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36202aad-72ea-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 19:24:30 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b7823559a5so31380f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 10:24:30 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458bbf91b69sm103940455e9.3.2025.08.06.10.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 10:24:29 -0700 (PDT)
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
X-Inumbo-ID: 36202aad-72ea-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754501070; x=1755105870; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fw/+6mXx5CPspFt0bbPlaCwA4OY4W//Q8nU4jM5mZHY=;
        b=wQv40vbNORTZO0rlYCTlysFaNK+1ShpB66tohfU1IXoxOEm5sKfBkV9XQmhpMpf8tC
         99X8qHlOYrTqWV6v8Dc2JSv+BS4gcJU2wcHBogljEVnzvNbi1ndSPiAORZCpxE4LRSLA
         M1BbnL3bKLhHEUaw+yP1im6RUZBHIxUklpC8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501070; x=1755105870;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fw/+6mXx5CPspFt0bbPlaCwA4OY4W//Q8nU4jM5mZHY=;
        b=orBRrrIs9mlfHD2d1hMoMFJUNo45symn4YNwKtQUKezjl1PoOTCjC00+/e+8vcZBon
         3RUsCkuYy52Z1Cu+GLcRZV6JI5sZyBLiqwPRmuU3RGA2E4FhNSpnv8ptCngYYySWnNe3
         5wUipm8kjXQYRzV2OCVYf1JZa33HhCtdlJx4+1/6cWNXXtCmpIhjNM2KqlbR/dMbbW8n
         qAzfcrUbnh0G0m5YZuMD5hor75GchDgnMYY8kH1/SlQAC9pxhfkiFATcFOw9rnRozLWi
         t5DrIfA9yWxYultdOV3Ovfhoc33F2aMN//vDc4poeixHggNihLHCQwOTo9THMYCxnn/C
         AujQ==
X-Gm-Message-State: AOJu0YzOFlQDfSAkmcs7NaSPprB9bHWg1N+I4AH9z2WwltSjj1GZYO2l
	TAg+M2rPkvpeJL8AYkSz5ODXkIRyxtf5tFSq6N7DWdi+A3DLfnBetiPsD1rE/T7RBVU=
X-Gm-Gg: ASbGnctXte7wDkcH9jQfC1ALHyQ4Nnx+2et3c1NflazlSp6dQd/uO3dQgU+R1bV0Y0R
	AEYDi3QZlURtUGU3x4Zq2FgA6TyfWtoLn7IakHrAu0FjYrblZkdndl8ZAGqn3I3LRJ/vBiXGzMk
	YYaw02yL3KjlKaFO9NBaHTT2v+Z7UC2NF+brZjEFePNnR9Dowbq2JEP+qMewHlLJmPkfzPLFmmg
	irw+tLMv5oxg5D8Bj+VD87PLhO5ye0nq8N5A1B/P3o/8eYCkKQ9fLwurIS8wdBXU0FdVLdUvPRt
	RAfucs2uvBjiwWkvbNKRt4WcuFwO2G7QptTeKiEHKdUoljPHYTfu6t5q7KwwxLda84CqmYX8hIy
	0yPphWsx42hZJJAYKSv54umtqaKUNQ9XnQNzY1LDQ1PVLh1AxAhcFcuCZnrvybMkOUTLDYMzgGZ
	UN
X-Google-Smtp-Source: AGHT+IEwpUIqxnnrBJOz5ap7U35fW0fNn/Zvw9qrLl79T8nna5FoCNOfXioLKhyrQi84kiKHyjLG7A==
X-Received: by 2002:a5d:64ed:0:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3b8f41bb845mr3189379f8f.13.1754501070177;
        Wed, 06 Aug 2025 10:24:30 -0700 (PDT)
Date: Wed, 6 Aug 2025 19:24:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v4 5/8] emul/vuart-ns16550: introduce NS16550-compatible
 UART emulator (x86)
Message-ID: <aJOPzSluXlDgBP-g@macbook.local>
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-6-dmukhin@ford.com>
 <aJNvcLgsUOahsQZl@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJNvcLgsUOahsQZl@macbook.local>

On Wed, Aug 06, 2025 at 05:06:24PM +0200, Roger Pau Monné wrote:
> On Thu, Jul 31, 2025 at 07:22:06PM +0000, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> Overall I agree for Jan it would be better if this patch could be
> split into somehow smaller units.  Is this something feasible?  We
> don't want a patch for each register handle, but maybe you cna somehow
> grup those into functional sections, so that patches can be < 250
> lines?

I've been thinking about this, would it be feasible to have a first
patch that introduces all the boilerplate, like adding the domain
create option, wire the libxl bits, but doesn't actually add any
emulation at all.  Then further patches could fill in the emulation
slowly, starting with a patch to register the IO port handlers
(initially would be empty functions), and progressing from the basic
parts (uart initialization maybe?) towards the end implementation that
you have here.

Thanks, Roger.

