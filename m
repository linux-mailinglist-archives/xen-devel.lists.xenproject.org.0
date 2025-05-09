Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D3CAB0F24
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980001.1366491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDKC6-0007T4-Vu; Fri, 09 May 2025 09:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980001.1366491; Fri, 09 May 2025 09:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDKC6-0007Qv-TG; Fri, 09 May 2025 09:39:02 +0000
Received: by outflank-mailman (input) for mailman id 980001;
 Fri, 09 May 2025 09:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMqf=XZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uDKC5-0007Qp-3c
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:39:01 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f8fad48-2cb9-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 11:39:00 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad21a5466f6so136999166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 02:39:00 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad219346383sm123039166b.47.2025.05.09.02.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 02:38:59 -0700 (PDT)
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
X-Inumbo-ID: 6f8fad48-2cb9-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746783539; x=1747388339; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mp32gjzgRrenuo0NKCc9+RfLjre+EXyM2hz1nmonf40=;
        b=CxpT/1GcAmbqi1ADXPsOWEQXSOxiQFyRcmF7Tdqqs7SQWqgd38oRTXKcPCPEJSLLtc
         7CPjuTH3c71ID9PY8uSo+XkHUbR27r4GDRx7eEtZw9svMrK42Xl6GYR2HPIC8hKejsT9
         Wg0T7NGj81TSnA6jTaZkaZYXVn5ND4BT7cjAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783539; x=1747388339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mp32gjzgRrenuo0NKCc9+RfLjre+EXyM2hz1nmonf40=;
        b=UddBMpFHwnNzwHG6JaLUjLi018TD5qgzGLwoBByRKxQYGQU2uSaWcYqZDGE5HWcbDG
         HoXBXhxCNCJkNtbbVHCHMoFS1S+Sf3X+3EjNVx/Onf3p36loNYRxxh/gTfIp5/ymV4Uq
         53WUCh3VYyoGVXT0JkAUAvdnvgoYWFqGttd4xOOChY4SJmu5NKC3FkkXsSosE33Vxh2K
         TsRs+gcHgMr3EqXfGufma+Q9zgVE9Pqcg8MYd9qSb2BcvnXw/HAc6LpVFMuRA5bkhdRM
         ZN1jm5g659ZW31HNkp2e5tvd74N9BzO2docpFL9Hbou+aYQwUImD61iBWZV4HOUh8Ff3
         icOw==
X-Gm-Message-State: AOJu0Yw1jb1mG+ehHa2l+WDzJZw6mFNxiXEmW6+hdamddUBLnlfz+xmt
	o/81AJ4ih6D12XBKvu/SiMX8ZdzzoPJKkhAH6wllfpIl7bbkYwbWwG03ZFHDUsE=
X-Gm-Gg: ASbGncuHmn1VhLL3o6WM+JesneTsRxVnuyxwltUF4gs8mzbPL6xdpS3EExsuUgKz5E4
	VewUFDtir3tPGyDAaqt7uvysaXtKFSEAvDf+DVG4FCqdXBtilVYa7LhP+hG0ttmeR8cNEHIHJnI
	6WIQWUKknqUUTcL7GAetQsbK/CiLXFS2Yg3ZlWPOAnF4X47U/wOEj4mcTKxaIs2fCVKohSsySck
	pqn4Ik4Zp+fDr4VL6iai17heKdT+92N6G9SOZcSganMDby6ZBbngg4cX350kPNrw1yZRrVOxg76
	vAB8xKhvr6Yvi2ZrIGnQfTuHPNKKh/AWJjc8evGyi0KGMv7NBfQ=
X-Google-Smtp-Source: AGHT+IFsdfPxrXYe4mwZ0RP563glGM73ygUXV3Txf6Pj+yIu3vhBQygYd8zwN41xL9Caq//dLt2Hug==
X-Received: by 2002:a17:906:ba85:b0:aca:d29e:53f1 with SMTP id a640c23a62f3a-ad21b1cbf9cmr261272466b.12.1746783539444;
        Fri, 09 May 2025 02:38:59 -0700 (PDT)
Date: Fri, 9 May 2025 11:38:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Kevin Lampis <kevin.lampis@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] livepatch: Pass buffer size to list sysctl
Message-ID: <aB3NMqrkDA-KBnzi@macbook.lan>
References: <20250508170156.558291-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508170156.558291-1-ross.lagerwall@citrix.com>

On Thu, May 08, 2025 at 06:01:56PM +0100, Ross Lagerwall wrote:
> From: Kevin Lampis <kevin.lampis@cloud.com>
> 
> The livepatch list sysctl writes metadata into a buffer provided by the
> caller. The caller is expected to allocate an appropriately sized buffer
> but this is racy and may result in Xen writing beyond the end of the
> buffer should the metadata size change.
> 
> The name buffer is expected to be an array of elements with size
> XEN_LIVEPATCH_NAME_SIZE to avoid this kind of race but the xen-livepatch
> tool allocates only as many bytes as needed, therefore encountering the
> same potential race condition.
> 
> Fix both these issues by requiring the caller to pass in the size of the
> name and metadata buffers and then not writing beyond the allocated
> size.
> 
> The sysctl interface version is bumped due to the change in semantics of
> the fields.

I would be tempted to add:

Fixes: b145b4a39c13 ('livepatch: Handle arbitrary size names with the list operation')
Fixes: 5083e0ff939d ('livepatch: Add metadata runtime retrieval mechanism')

As the current approach can easily lead to buffer overruns in guest
memory, as Xen doesn't know the size.

> 
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

