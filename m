Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ED09A3EEE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 14:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821875.1235839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1mVj-00025g-Pp; Fri, 18 Oct 2024 12:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821875.1235839; Fri, 18 Oct 2024 12:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1mVj-00023Z-Mh; Fri, 18 Oct 2024 12:55:19 +0000
Received: by outflank-mailman (input) for mailman id 821875;
 Fri, 18 Oct 2024 12:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7i1V=RO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t1mVi-00023L-M8
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 12:55:18 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38ec9cb3-8d50-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 14:55:16 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4315df7b43fso15945485e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 05:55:16 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ecf118b67sm1881243f8f.99.2024.10.18.05.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 05:55:15 -0700 (PDT)
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
X-Inumbo-ID: 38ec9cb3-8d50-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729256116; x=1729860916; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PIrRIcxrInlX5eGaIHFdn51+ZgGAHXcudRiXCHVXzso=;
        b=DmlthkBG97c0LN7MSOWNFlqYQjnkXkBJxKpVmfOl9bF9TOr4/eudhYrETFsX0KSXOd
         TGJEqKosB1N9ryeQmcXrqRsmfHSmcWQ5MNbTSh9lX9mXTRp8JWNqimM1FFUEKfen1zzk
         ivTRIq7+nw0wFzrNB+IhtXnoVWc3wYaXMF7eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729256116; x=1729860916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PIrRIcxrInlX5eGaIHFdn51+ZgGAHXcudRiXCHVXzso=;
        b=f2iIV0WL9++mNjWoSUrdhg/P9sgUblf2tS8lCm3KUXinsvC4dw7Kp9HM5W8d1cqUoD
         TjuKit7+gF4gWmcy7496K5bxJcDL2UEeiNe3XlCLeXldAGhzi/H8CgCHOd3oBCcSTgi8
         E1w0a5aq37f9jxRKsrHZhPVLtZ53GDEBBu7aVz+zxN5iRrYJecUaIwLwCLLkTO0qDXVF
         kFOMTqxmV2z48MGYYJT5CyLY/6WQAvDWm7qGqJnUvxT3HEPDupTYqQEP1KmXc3KH1ww2
         lDVTNYEj/Q8uCTqzEE4iu76q9022tz478ZcdsYmQm2S3hvOJUnuHgAnYlnWXpCWrZlLU
         OU8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhh+8gePvxxcKMOho+aI5meVJ4blhhJzbdY77O4lHkaYTldmMNd6xJmrH9wTgSCMLlWHZ2AomsmEQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsPDAw1kSJMIUpBRSjStM2zRGrxKBvgXl+N7vaBl5aoj4Z3x9M
	jmvCpjgyColLLkGAoj7ZnnK2BtGiP3FpyE5S5JrGDY8G3a1Y65GW2rHaWZwBU40=
X-Google-Smtp-Source: AGHT+IF5Tu8AkZXTitcXlLO3RDS63yNt8O1Yvga9WFdlNacI8SRB1IrgO09uzKNJaLNDxfl0w1szpg==
X-Received: by 2002:a5d:4535:0:b0:37d:49d1:1e89 with SMTP id ffacd0b85a97d-37eab6e46b9mr1595857f8f.27.1729256115863;
        Fri, 18 Oct 2024 05:55:15 -0700 (PDT)
Date: Fri, 18 Oct 2024 14:55:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
Message-ID: <ZxJasvLomAlvMEws@macbook.local>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com>
 <ZxJJZvOCQLzU_Q5s@macbook.local>
 <7afb8389-3758-4633-a97a-3623513dc917@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7afb8389-3758-4633-a97a-3623513dc917@suse.com>

On Fri, Oct 18, 2024 at 02:04:22PM +0200, Jan Beulich wrote:
> On 18.10.2024 13:41, Roger Pau Monné wrote:
> > On Thu, Oct 17, 2024 at 02:31:19PM +0100, Frediano Ziglio wrote:
> >> @@ -25,14 +23,47 @@ $(obj32): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
> >>  $(obj)/%.32.o: $(src)/%.c FORCE
> >>  	$(call if_changed_rule,cc_o_c)
> >>  
> >> +orphan-handling-$(call ld-option,--orphan-handling=error) := --orphan-handling=error
> >>  LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
> >>  LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
> >>  LD32 := $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
> >>  
> >> -%.bin: %.lnk
> >> -	$(OBJCOPY) -j .text -O binary $< $@
> >> +text_gap := 0x010200
> >> +text_diff := 0x408020
> >> +
> >> +$(obj)/build32.base.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff)
> >> +$(obj)/build32.offset.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff) -DFINAL
> >> +$(obj)/build32.base.lds $(obj)/build32.offset.lds: $(src)/build32.lds.S FORCE
> >> +	$(call if_changed_dep,cpp_lds_S)
> >> +
> >> +targets += build32.offset.lds build32.base.lds
> >> +
> >> +# link all 32bit objects together
> >> +$(obj)/built-in-32.tmp.o: $(obj32)
> >> +	$(LD32) -r -o $@ $^
> >> +
> >> +# link bundle with a given layout and extract a binary from it
> >> +$(obj)/built-in-32.%.bin: $(obj)/build32.%.lds $(obj)/built-in-32.tmp.o
> >> +	$(LD32) $(orphan-handling-y) -N -T $< -Map $(@:bin=map) -o $(@:bin=o) $(filter %.o,$^)
> >> +	$(OBJCOPY) -j .text -O binary $(@:bin=o) $@
> >> +	rm -f $(@:bin=o)
> >> +
> >> +quiet_cmd_combine = GEN     $@
> >> +cmd_combine = \
> >> +	$(PYTHON) $(srctree)/tools/combine_two_binaries.py \
> >> +		--gap=$(text_gap) --text-diff=$(text_diff) \
> >> +		--script $(obj)/build32.offset.lds \
> >> +		--bin1 $(obj)/built-in-32.base.bin \
> >> +		--bin2 $(obj)/built-in-32.offset.bin \
> >> +		--map $(obj)/built-in-32.offset.map \
> >> +		--exports cmdline_parse_early,reloc \
> >> +		--output $@
> > 
> > See xen/Rules.mk, for consistency the indentation should be done with
> > spaces when defining variables.  That would also allow to align the
> > options.
> 
> And ideally also such that the options align with the first program
> argument.

Yup, that's what I was attempting to suggest, sorry if it wasn't
clear.

> >> +
> >> +targets += built-in-32.S
> >>  
> >> -%.lnk: %.32.o $(src)/build32.lds
> >> -	$(LD32) -N -T $(filter %.lds,$^) -o $@ $<
> >> +# generate final object file combining and checking above binaries
> >> +$(obj)/built-in-32.S: $(obj)/built-in-32.base.bin $(obj)/built-in-32.offset.bin \
> >> +		$(srctree)/tools/combine_two_binaries.py FORCE
> > 
> > Can you indent this using spaces also, so it's on the same column as
> > the ':'?
> 
> The first $(obj) you mean, I think / hope?

Indeed, it's one space after the ':':

# Generate final object file combining and checking above binaries
$(obj)/built-in-32.S: $(obj)/built-in-32.base.bin $(obj)/built-in-32.offset.bin \
                      $(srctree)/tools/combine_two_binaries.py FORCE

Preferably comments should also start with an uppercase letter.

Note this already exceeds the 80 char maximum, as the longest line is
81.  I think we have been a bit lax with Makefiles however.

Thanks, Roger.

