Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C7196A126
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 16:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789334.1198930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUry-0003f7-Ex; Tue, 03 Sep 2024 14:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789334.1198930; Tue, 03 Sep 2024 14:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUry-0003c5-Bu; Tue, 03 Sep 2024 14:50:58 +0000
Received: by outflank-mailman (input) for mailman id 789334;
 Tue, 03 Sep 2024 14:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slUrw-0003bz-LZ
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 14:50:56 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebd63d75-6a03-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 16:50:54 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c210e23651so5711707a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 07:50:54 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c262cc7cc8sm1904366a12.91.2024.09.03.07.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 07:50:53 -0700 (PDT)
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
X-Inumbo-ID: ebd63d75-6a03-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725375054; x=1725979854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=whfCzuKmI+MBqMZS4hevtlR9zzP+fKT0z0RIkuTqwY0=;
        b=SNQn+GoqoCCVlNR7uxZIYzRTH8iPaYU+/Pc30Gya4qkv4svwiIo0ZFqebmQWwu+Lv/
         CL/PFlCucpqMXUtHHrUZUJCRLmeG4wBvfS28wCv1MTMzf4sg2ATqLdEEB0CdrRs7bqjc
         ZtFf+A2XQ5wMnc4xGTVrO4BagJiyGFCAT8lkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725375054; x=1725979854;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whfCzuKmI+MBqMZS4hevtlR9zzP+fKT0z0RIkuTqwY0=;
        b=YXUjrgY9UH+iOr4dVpnp06YPM28ZMXpx3grhB6zwP4m6qo6EtSPuuuFEqxC07Oxh5a
         lyByIpVb3v8McLwgixv94FNzKDIWH+l+/OLGPeMoanEqT6Yj2pbYfzZ2HqKGLqcnuMKi
         752Wi9k62yet0JFKUBazzeU9IlJ0ZfpdsQEx4sl7Xhkr9tgAHOLsfL7bRSq9rpVw3zJn
         8dru/6fj565PfMlx2h8mzLLJSoStsRBlXIpcwN+KTn51TSlOeejMODgReRGEpvEe8J5e
         uKxNJ+QW53cTRTUZnk+wGZBSr+IqGGdm4Lzt8urrRWBIoIEQnYhQWs0x5dQiYuk51S/V
         kjBA==
X-Forwarded-Encrypted: i=1; AJvYcCWFMpb8ykUn5AuUkdLOKvWlQyMavFHwqAj3RTD8N3x6vhwXL40yTdfCPW0Dhy9YNFLWGQmllE8maC0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVdmf/8PKYFfDvu2t1MxPFxYT/gW6/yNmK0FnoUlx0Wr2kVYO1
	WYM7f2EJDfY28nYjOg3z/3Z2Ak39m0PvpCIOyZGzH7Jb+y+dxo2CKfImgOlMrE8=
X-Google-Smtp-Source: AGHT+IHA7FAnQA+Nbxo4Wlajj1w4jAHi/MXjeLjuTZDTxZtU2mefPiihDujo2i3S/eP6xcGb5c+B5A==
X-Received: by 2002:a05:6402:50cf:b0:5c2:53a1:c20b with SMTP id 4fb4d7f45d1cf-5c253a1c231mr3703422a12.18.1725375053464;
        Tue, 03 Sep 2024 07:50:53 -0700 (PDT)
Message-ID: <a6456b7e-9e31-4582-88b0-aa86de9c729e@citrix.com>
Date: Tue, 3 Sep 2024 15:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/boot: Fix include paths for 32bit objects
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
 <20240903115334.3526368-1-andrew.cooper3@citrix.com>
 <2115ac3a-84d3-427a-8601-c37e4732089a@suse.com>
 <8b34106b-7dec-4de8-9479-ae38625c5658@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8b34106b-7dec-4de8-9479-ae38625c5658@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2024 3:33 pm, Andrew Cooper wrote:
> On 03/09/2024 3:32 pm, Jan Beulich wrote:
>> On 03.09.2024 13:53, Andrew Cooper wrote:
>>> Most of Xen is build using -nostdinc and a fully specified include path.
>>> However, the makefile line:
>>>
>>>   $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
>>>
>>> discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.
>>>
>>> Reinstate -nostdinc, and copy all -I (and -Wa,-I) arguments from XEN_CFLAGS.
>> And the files in boot/ indeed need the -Wa,-I? I'd favor us not propagating
>> such without actually being required for a particular reason.
> Hmm ok fine, I'll strip that back out as both you and Roger have asked
> for it.
>
> I'm still waiting on Gitlab CI, so haven't pushed yet.

Eclair has just said no, because the -include is needed to pull in
Kconfig, ahead of compiler.h using CONFIG_GCC_* symbols

I'm retesting with:

@@ -14,10 +14,8 @@ $(obj)/head.o: $(head-bin-objs:.o=.bin)
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
-ifneq ($(abs_objtree),$(abs_srctree))
-CFLAGS_x86_32 += -I$(objtree)/include
-endif
-CFLAGS_x86_32 += -I$(srctree)/include
+CFLAGS_x86_32 += -nostdinc -include $(filter
%/include/xen/config.h,$(XEN_CFLAGS))
+CFLAGS_x86_32 += $(filter -I%,$(XEN_CFLAGS))
 
 # override for 32bit binaries
 $(head-bin-objs): CFLAGS_stack_boundary :=

which is the best I can think of to find the path of config.h in
XEN_CFLAGS.  This is the same pattern we use in filter-out elsewhere.

~Andrew

