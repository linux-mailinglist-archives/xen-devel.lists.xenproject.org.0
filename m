Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A3B8326F1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 10:49:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668986.1041519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQlUN-0006gS-ST; Fri, 19 Jan 2024 09:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668986.1041519; Fri, 19 Jan 2024 09:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQlUN-0006dw-PL; Fri, 19 Jan 2024 09:48:39 +0000
Received: by outflank-mailman (input) for mailman id 668986;
 Fri, 19 Jan 2024 09:48:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xVsr=I5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQlUN-0006dq-1s
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 09:48:39 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb4c146b-b6af-11ee-98f2-6d05b1d4d9a1;
 Fri, 19 Jan 2024 10:48:38 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so6040685e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 01:48:38 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 fa6-20020a05600c518600b0040e861ad5d2sm10481840wmb.0.2024.01.19.01.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 01:48:37 -0800 (PST)
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
X-Inumbo-ID: eb4c146b-b6af-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705657717; x=1706262517; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QNnSUEiMlS8Eerz2RMRLh5be7V6JC8Av+Vu/QaxqC70=;
        b=suHw2xXxWeMwWIP7disZnMz6Lwn28dwrknOr+83u8hxJoq1hnOrUrqlBwNXX34I9BL
         mCoQHqn3ZrLWW9V0EVX6IuJb2ovJrLPM2++uwBKZZXeFlnmrS4fcEyv20+yCZ7zxehUl
         9u6PBomBROYXUYcg877Z85uK3a6QY28SoskiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705657717; x=1706262517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNnSUEiMlS8Eerz2RMRLh5be7V6JC8Av+Vu/QaxqC70=;
        b=hM8w8IpG6zF9UEW2TR40D3IhcFp8219oR2frlH4Td3lqGmXTyqaYIdBATBbdhH6AT/
         LV51DT9N/HkErXqTSuyffLJPiqJTUMoU2ZWjsPw7Ri1115eja6emdWVAluDydc4+s5hN
         AFCdgaw7FMZ8lEJRtVd4PMnYwvY+Fb/BTTbK6DiZKXfKjBFKtODTX7QNpisy0R60AoOk
         uQ8/Pj++ud7VONU0EIwQRPrFNmAbVYWkyf/1uJI32TMPZ/d0E4VsWtpX1is3Z3eLWwWX
         QwFyQz+iVIuxNdYMnRc9mtqs2FDzkjoIwXyt3m8jm/iO2mWZtyT2+jMpcI01E0kBJqu7
         BBeg==
X-Gm-Message-State: AOJu0YwD7ssqq3CXZ6kvPlk771eqLyVqFZCJz21+E8A/luiOHhKn1ACg
	qdkqB0h8DuPtdRQ5XlODEHiDVqxZKMAvn6K1UjkfQRF5sYzRYFgvDjO0Yq9T2nE=
X-Google-Smtp-Source: AGHT+IHRk8RSKb0srSSMZIhup1QVlzScUGurvVyKXMzB0ZdUKFdhBcqNzECh29/q3w2UxmjjhgfQOw==
X-Received: by 2002:a05:600c:22c2:b0:40e:485c:aabf with SMTP id 2-20020a05600c22c200b0040e485caabfmr1272476wmg.130.1705657717390;
        Fri, 19 Jan 2024 01:48:37 -0800 (PST)
Date: Fri, 19 Jan 2024 10:48:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v5 2/8] x86: annotate entry points with type and size
Message-ID: <ZapFdAcpTcOALgOo@macbook>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <9096ad1a-5d86-4dd1-a7c3-6ad2f7e5a623@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9096ad1a-5d86-4dd1-a7c3-6ad2f7e5a623@suse.com>

On Mon, Jan 15, 2024 at 03:34:56PM +0100, Jan Beulich wrote:
> Use the generic framework in xen/linkage.h.
> 
> For switch_to_kernel() and restore_all_guest() so far implicit alignment
> (from being first in their respective sections) is being made explicit
> (as in: using FUNC() without 2nd argument). Whereas for
> {,compat}create_bounce_frame() and autogen_entrypoints[] alignment is
> newly arranged for.
> 
> Except for the added/adjusted alignment padding (including their
> knock-on effects) no change in generated code/data. Note that the basis
> for support of weak definitions is added despite them not having any use
> right now.
> 
> Note that ASM_INT() is switched to DATA(), not DATA_LOCAL(), as the only
> use site wants the symbol global anyway.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

