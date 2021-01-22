Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ECA300EC6
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 22:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73115.131819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l33rX-00071h-2Y; Fri, 22 Jan 2021 21:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73115.131819; Fri, 22 Jan 2021 21:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l33rW-00071I-Vg; Fri, 22 Jan 2021 21:20:58 +0000
Received: by outflank-mailman (input) for mailman id 73115;
 Fri, 22 Jan 2021 21:20:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NXE=GZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1l33rV-00070x-4D
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 21:20:57 +0000
Received: from mail-pl1-x629.google.com (unknown [2607:f8b0:4864:20::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5a27af9-6166-4c93-aea6-50b34290abba;
 Fri, 22 Jan 2021 21:20:55 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d4so4023228plh.5
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jan 2021 13:20:55 -0800 (PST)
Received: from piano ([2601:1c2:4f00:c640:3cc1:5f60:de20:49b1])
 by smtp.gmail.com with ESMTPSA id y11sm2071163pff.93.2021.01.22.13.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 13:20:54 -0800 (PST)
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
X-Inumbo-ID: d5a27af9-6166-4c93-aea6-50b34290abba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wRNs23haYnDOzVC0Ua3QZcj9o2Wq20sdqMEocvglLls=;
        b=kdqV/KtCuhEkZnRvX1BfVrH9KWjHRzCJ5Hcq5cvRgjka6DjT9+QfQIDe6KAj9rgg8r
         CUHGQhTMLZ1GF2g4oG4PRJOMStxWhBZ18BtHKHJ7mxudAGYl8vYjOyf4tKsWqALOM1TQ
         mqa7gzit3x6m2aKm2JYbNZFk7NPymN/YZ6nS4i8bZWxd0m49qG8HEJ5L/15AgAGVlxPw
         6wk8K5EomkTJWwb4Ek+6ZRSGBZVLSRHUzW+xpgraYbYnm/hcHR2E945P/V/ev3IuYtnk
         QJU668yf7tcPLH2NkTi4yl+aQM1byS45TGMRGZ8wxeDj0ye5Qx8t/bvfpyQUrEgpYbNI
         YEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wRNs23haYnDOzVC0Ua3QZcj9o2Wq20sdqMEocvglLls=;
        b=Wzgy3ikcaZEKuwkmkvLb7KVzfSmkpDJheH3ZtJxrrlieTGdukc5wzEMuZ5D4fSjsTS
         tG8aueQOCiQpRcZoKiQlTG95wixVjmwnQVMwclA4mUinnvln0D6a8apYYsUYkVCMFmm9
         1j/48mnQNOpsIoxY6QsifdETPoV62z3+EDWAedhk62JZRo1TneBGH7xFUjvlv0aIRAWh
         VqzkpJrsYdLWdF3H/DZRsDGenNa2odT0iGJNwENOBpYI9kHPgHnhMclFXWypF4E8eiNK
         6dCna8iZ8U8fog9x2XgV2iiXB6boOl5CMuHBLhdgaVXyjgNVrc+bPflzV4mwkjk5elK1
         joxw==
X-Gm-Message-State: AOAM5335fZU57RUy+Off7X1ek2uBDFegIeGIH5lRYOh+bl1A9TUv1oJO
	HGj2p8+ufuu6xQ3ZjRbrwNs=
X-Google-Smtp-Source: ABdhPJwS8aadScu7fjws7jb+PIGLUp3GcTBLWZ660aek/+YFjbB5tvFslbMG852ICSlqB8xsnHRspg==
X-Received: by 2002:a17:902:7001:b029:da:bbb6:c7e2 with SMTP id y1-20020a1709027001b02900dabbb6c7e2mr242495plk.50.1611350454996;
        Fri, 22 Jan 2021 13:20:54 -0800 (PST)
Date: Fri, 22 Jan 2021 13:18:23 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Olivier Lambert <olivier.lambert@vates.fr>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 0/5] Support Secure Boot for multiboot2 Xen
Message-ID: <YAtBH/XYrp2Nrfy2@piano>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <109ab168-b312-0082-dfd7-d990bab82480@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <109ab168-b312-0082-dfd7-d990bab82480@suse.com>

On Fri, Jan 22, 2021 at 10:39:28AM +0100, Jan Beulich wrote:
> On 22.01.2021 01:51, Bobby Eshleman wrote:
> > I followed with v2 feedback and attempted to convert the PE/COFF header
> > into C instead of ASM.  Unfortunately, this was only possible for the
> > first part (Legacy) of the PE/COFF header.  The other parts required
> > addresses only available at link time (such as __2M_rwdata_end,
> > __pe_SizeOfImage, efi_mb_start address, etc...), which effectively ruled
> > out C.
> 
> I don't follow the conclusion drawn, so would you mind going into
> further detail?
> 

No problem at all, bad explanation on my part.  The core issue is
actually about the legality of casting 64-bit addresses to 32-bit values
in constant expressions, which then is sometimes complained about by GCC
in terms of load-time computability...

Taking __2M_rwdata_end as an example.  Attempting to use it in
the PE/COFF optional header in C looks something like:

extern const char __2M_rwdata_end[];
extern const char efi_pe_head_end[];

struct optional_header optional_header = {
...
    .code_size = (uint32_t)((unsigned long)&__2M_rwdata_end) -
                    (uint32_t)((unsigned long)&efi_pe_head_end,
...
}

GCC throws "error: initializer element is not constant" because casting
a 64-bit address to a 32-bit value is not a legal constant expression
for static storage class objects, even though we know that in practice
the address wouldn't ever be above 4GB.

efi_pe_head_end could potentially be calculated by header struct sizes,
but doing that predictably yields the same error.

If we drop the explicit casting, GCC throws 'error: initializer element
is not computable at load time'.

tl;dr:

I could not find a way to derive code size (data sections and all)
without using a symbol location, which is an illegal constant expression
operand for initializing static storage class objects... and I could not
find a way to define the header in C without using an object of static
storage class (global variable or static variable).

-Bob

