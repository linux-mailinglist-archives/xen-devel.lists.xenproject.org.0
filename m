Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F5BC2AA7
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 22:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139210.1474699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6ETN-0007sc-9j; Tue, 07 Oct 2025 20:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139210.1474699; Tue, 07 Oct 2025 20:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6ETN-0007qo-6x; Tue, 07 Oct 2025 20:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1139210;
 Tue, 07 Oct 2025 20:39:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sa46=4Q=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v6ETL-0007qi-Rf
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 20:39:47 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be19c0eb-a3bd-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 22:39:38 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-3f0134ccc0cso4115172f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 13:39:42 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9890sm27097369f8f.32.2025.10.07.13.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 13:39:40 -0700 (PDT)
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
X-Inumbo-ID: be19c0eb-a3bd-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759869582; x=1760474382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Huud3GPU2Wq8yzT/1e86lVba3MT7dsG5Da+CGdWMiE=;
        b=tYs14obOaeKKgO7Ce/6c2HXrKCyXc/Jrhd8adjocZDpfwnASPfAL5qdd42jDgNonbV
         suCbindR+eMxgCwP2FVEQgAPEw91p2MHAovrA7+rP0AelBfTxtUWcAeCHfvpVMCCby3/
         qO2t56i2mcN66r6dLWSd7S5hiuFbo/d7FawQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759869582; x=1760474382;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Huud3GPU2Wq8yzT/1e86lVba3MT7dsG5Da+CGdWMiE=;
        b=mi7sSHRXtdj60NS7fyxu8024AvB1C1yAIfTGErP6svMTmYmh64+JGMmdXvlnJAKkvC
         gMG3YJQgrQzi2j0gtBDHLc8L95vad4cInGZFSxE/5G6e8WzbQpiGzAinpofWNlGb9Skz
         MKvJBSihSLUSwz+QqGuMASFzAZBG3369HcRHOYYsWRfZiihxsZgV5MMr2Ddpd1StNyVA
         MW0J16POGZLwrh64GlRHnDrTHKCabqS3aCCYGSozncm13rYpAUsIuZCVuLdIRD0kC6ui
         KTDM+IXQehyx3Yf3zIFxVuDNPT0kwfSlEgjDPnEiPNn4dT64RWc7u7KNGAMfXk70vzrQ
         ntGg==
X-Forwarded-Encrypted: i=1; AJvYcCXnKoKcP5NRD1P0s5Xku0UzaDG8DmbJz8zPPcvoWjkfG4V8AwY6DyP+8XVmcUqjYSTdHjyKlpRuIhw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzG56Zeqo864SePeKRZTYw9BGTdX2/T7PnO6XgrIzg8REiexbZ0
	RcgaWr1xxHyFnArQ3cOQ+IlKiEC+68/paCYicJPhpFsHspNRIH0oaXPB8pQhSMXFCfo=
X-Gm-Gg: ASbGnct5DXL9bXg1EMljAZ09UOJmuuUZdzqX3FuS6xKtW41SqpXiOu9aPjVu/XPvDKL
	D/MO/QBXdu374q2Q6/7lt2aOMk4Sb+omam9KvUX9EqLjOuWmV8LHhBBcwB9zQQIOGrieKQYuyqa
	I1Zz4CKhW4n+lxYJZVSB2p75DGFtt/ooJ5GJmpU+SMkW05JphoSUn6D+6NQDnmpW3TqKNixQaWI
	xF+bqCeFFLkOZ0thzRk6DphYxPA8eFo0bR6EaTG8IDQTKGp5XhmSsBpUyNL8djl5zHOt3Q6zYg7
	ubn50dt0seZ5i+kL6l18U6XEyG22eSVhmI59+bS7GLwz6siclNGtNZig4KU7ET+vLOkBMhHcDJE
	KzYS7I7K/QMc+rrgRRGi1lLMEc5QGgr+XP/wn0lzXN80cxK72a+FaqUBk0NvPgzgUi4p/2E61cB
	UdfuiqN00wblSO
X-Google-Smtp-Source: AGHT+IGutE7iomicuyKlMB+6CHz0qFuQ62pNYbkoD0y0SIhjP9jhe6W7n+5wVy7GYIhRNoAZKqO6wg==
X-Received: by 2002:a05:6000:2303:b0:425:7e40:1e02 with SMTP id ffacd0b85a97d-42666ac376dmr357967f8f.7.1759869581847;
        Tue, 07 Oct 2025 13:39:41 -0700 (PDT)
Message-ID: <dc2d0647-24b1-47f5-a249-1bfed0a05e3c@citrix.com>
Date: Tue, 7 Oct 2025 21:39:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fork or replace dependency yajl?
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?Christoph_Gr=C3=BCninger?= <foss@grueninger.de>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <d49ad645-35dd-4bd2-b166-d1803b2d95ba@grueninger.de>
 <25afca10-18e7-445c-b914-98d767016d70@citrix.com>
 <5bef1a60-e608-4f9f-b658-a702e2306ebd@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5bef1a60-e608-4f9f-b658-a702e2306ebd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/08/2025 4:16 pm, Andrew Cooper wrote:
> On 03/08/2025 2:36 pm, Andrew Cooper wrote:
>> On 03/08/2025 9:52 am, Christoph Grüninger wrote:
>>> Dear Xen developers,
>>>
>>> you are using the dependency yajl (yet another json library, [1]) to
>>> parse JSON files. The project seems abandoned with the last commit 10
>>> years ago, the last release over 11 years ago, and 75 open pull
>>> requests. Packaging yajl requires patches, e.g., to make it compatible
>>> with CMake 4.0.
>>> There are some forks but none has replaced the old one yet [2].
>>>
>>> I think there are three paths forward:
>>> 1. Xen could pick a prominent fork and use it as its main dependency.
>>> 2. Xen could create a fork of its own, hopefully attracting more
>>> people interested in an maintained successor of yajl.
>>> 3. Switch to a different JSON parser library that remained healthy.
>>>
>>> Sure, you could stick to option 4., do nothing an offload the burden
>>> to fix yajl to distribution packagers.
>>>
>>> Xen is an important project and its decision can create momentum that
>>> might lead other projects.
>>>
>>> [1] https://github.com/lloyd/yajl
>>> [2] https://github.com/lloyd/yajl/issues/252
>> CCing the libxl maintainers.
> To follow up here, please try
> https://lore.kernel.org/xen-devel/20250808145602.41716-1-anthony@xenproject.org/T/#u
> which should make libxl use json-c by preference.

Xen 4.21.0-rc1 was released today.  yajl is no longer a hard
dependency.  Xen will prefer json-c to yajl, if ./configure can find it.

Please test and feed back any issues you find.

~Andrew

