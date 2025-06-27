Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968A8AEBA6F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 16:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027709.1402235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVAQl-0002v8-D3; Fri, 27 Jun 2025 14:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027709.1402235; Fri, 27 Jun 2025 14:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVAQl-0002sq-A9; Fri, 27 Jun 2025 14:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1027709;
 Fri, 27 Jun 2025 14:51:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3f0b=ZK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uVAQj-0002sk-M7
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 14:51:53 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40717f9e-5366-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 16:51:48 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4538bc1cffdso16408685e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jun 2025 07:51:48 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4538234b1b9sm81590595e9.11.2025.06.27.07.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 07:51:47 -0700 (PDT)
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
X-Inumbo-ID: 40717f9e-5366-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751035908; x=1751640708; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b+HfHUW1r/ios0M40imSCWazaGCOjQBYU3uC2JYY7LY=;
        b=VyC+gGciro+FgJBsKpKbGdOqfT76oPa9Z1VbBuRv3dFm1gcS+b9XOSkm50zZBUWKww
         7ZzHKB8nZjiJh0DEAWAp0zyHy4ca4cmq9NYyAUcMYTWJj9a2up/IDsjF2GLOzIOKFFzb
         SJNlg8Np4tzwiW2yZxXc3NzNQ05E2sER6IXqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035908; x=1751640708;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+HfHUW1r/ios0M40imSCWazaGCOjQBYU3uC2JYY7LY=;
        b=KDy7Kv5ZUubdVh7W0QnjWwqgrMgaK+ZLDYnC7S0FF+z1PiSonHsAyaZxMpr7zEX33F
         /5bYCBGpwAJxfdpxe0pYYWdjf6e5XJNspn9AWRca9E5oeo1nml+hocMfQ4eW+fK2J6e8
         tBpZBO3fKiwzFMc9LYt14Jd59u+i1+ENb4eYj4u3L8QSIYVro6XqT2N83P35esLD6xcO
         7WjfQ565M0I/n6DjF+7PH5kzZEDHtDJlUUeFIHD/wTzzEC5EuoAxC5Nl/xvM39s8KioM
         00YOSr2RtEexSw1AjaAe5dM75wjoSUsvOTbx9PcEqwrR+AuReuQ8/IEuGdC7tqek6V4b
         +S1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVf6n1nsLlzZGYUaKpIMTuT5Iu/YwceUds0RovEgn6nioVjxS0fMkIJF8bUYbMWNKbgJ0sCIlBqdDc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYGjLJ67aNy5q89S2SFCMLQsu4ivR8yZZU0CxqTaKhCn5MvClX
	x/9x+t0uCQC+jy/eG1apaoWLcs0TTitH2OpNzUMCnomJ2S/23yP+qwZLF9ZugevZXZg=
X-Gm-Gg: ASbGncsl6evz6GYxZN3EhnO8OzW3YtN7Skn7stQn+8l6lkA+JOZGaZsjrWiMHGurx9t
	cFIud8oaiovAR2PF6qHrjJr6Am6ZN06g/eulNYmQz9LxzRzwuFccazklq9HPt3VGAiJZm37uzLS
	hYqrfSwlNIn8uI8nsp67Z9zDV/bZMhNZ3RpW9GhPp5rq6yzeFoJYJDBgKWcZrLoEHVKdTvnmuSP
	XN/vAhSSptAuHerd9DrIyY9Lnh01SYMTqXeCJKuQqpQA29LqsBb8QPfW2UF6FBbBP+PBPN27uyk
	y8S6+bFo+7S5tWE3vSHGe790POS4kjl+hM2BPzrG9K3AlfUCjDpQy18hDMPCeVrBOFz1ufUk42l
	DGMJZO0dxW0mpwdU0q9hMILeMK4CDRfEO/a2pR7+I
X-Google-Smtp-Source: AGHT+IFDzaFfjDNEL88bQEqhIsL906og3ODCt0CCldX4/wiuBbREDwSwFWegQtVn9HcPvSuB067veg==
X-Received: by 2002:a05:600c:3e8e:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-4538ee5ce0cmr38178955e9.8.1751035907632;
        Fri, 27 Jun 2025 07:51:47 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:51:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 8/8] pdx: introduce a new compression algorithm based
 on region offsets
Message-ID: <aF6wAh2VaMc9mYV-@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-9-roger.pau@citrix.com>
 <e0339b2b-86cd-45ad-9b6f-a5e8ddbc623c@suse.com>
 <aFwish8zET1W6-CC@macbook.local>
 <475fb02b-0b00-4aab-b73c-9604fe050074@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <475fb02b-0b00-4aab-b73c-9604fe050074@suse.com>

On Thu, Jun 26, 2025 at 09:35:04AM +0200, Jan Beulich wrote:
> On 25.06.2025 18:24, Roger Pau Monné wrote:
> > On Tue, Jun 24, 2025 at 06:16:15PM +0200, Jan Beulich wrote:
> >> On 20.06.2025 13:11, Roger Pau Monne wrote:
> >>> +bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
> >>> +{
> >>> +    unsigned long pfn = PFN_DOWN(base);
> >>> +
> >>> +    return pdx_to_pfn(pfn_to_pdx(pfn) + npages - 1) == (pfn + npages - 1);
> >>
> >> Aiui for this to be correct, there need to be gaps between the ranges
> >> covered by individual lookup table slots. In the setup logic you have a
> >> check commented "Avoid compression if there's no gain", but that doesn't
> >> look to guarantee gaps everywhere (nor would pfn_offset_sanitize_ranges()
> >> appear to)?
> > 
> > But if there are no gaps, the full region is covered correctly, and
> > hence it's compressible?
> 
> If there's a guarantee that such ranges would be folded into a single one,
> all would be fine.
> 
> > Maybe I'm missing something, could you maybe provide an example that
> > would exhibit this issue?
> 
> My understanding is that when there's no gap between regions, and when
> [base, base + npages) crosses as region boundary, then the expression
> above will yield true when, because of crossing a region boundary, it
> ought to be false. Or did I simply misunderstand the purpose of the
> pdx_is_region_compressible() invocations?

If there's no gap between the regions it's IMO intended for
pdx_is_region_compressible() to return true, as the whole region is
continuous in both the PFN and PDX spaces, and hence compressible
(even if it spans multiple regions).

But maybe I'm not understanding your point correctly, could you maybe
provide an example if you disagree with my reply above?  Sorry if I'm
being dull, with this compression stuff it's sometimes hard for me to
visualize the case you are trying to make without a concrete
example.

Thanks, Roger.

