Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64021B1941D
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 15:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068614.1432588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiYtJ-0007h8-UZ; Sun, 03 Aug 2025 13:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068614.1432588; Sun, 03 Aug 2025 13:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiYtJ-0007eH-Rk; Sun, 03 Aug 2025 13:36:45 +0000
Received: by outflank-mailman (input) for mailman id 1068614;
 Sun, 03 Aug 2025 13:36:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iRTh=2P=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uiYtI-0007eB-Gb
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 13:36:44 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4b5bce4-706e-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 15:36:43 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3b786421e36so2050659f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 03 Aug 2025 06:36:43 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9386sm12320444f8f.18.2025.08.03.06.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Aug 2025 06:36:42 -0700 (PDT)
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
X-Inumbo-ID: e4b5bce4-706e-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754228203; x=1754833003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gcZ57Ju+AG87FAmYQ9GK17sdn22oACPVY3R5b3qBqjw=;
        b=vHb4TJ5MObqIBK4HS/A8B+w2eoAXh0s1FwU8/80t1RpFuoyDEQD39oW6O/c2+aOQCE
         kPqc/I8D1J7XVLmN7L7q5HNtanc54U9AxsFTA8H/63pDCyNoq4w/CLM4wsoVJABtCRSa
         z9pALEcIy72GZG1rcLDJMwadOH5YmnhM7x9ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754228203; x=1754833003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcZ57Ju+AG87FAmYQ9GK17sdn22oACPVY3R5b3qBqjw=;
        b=KS8gHsGSsijZrwAyRbROKr0hf9FEhvr9mSp6xcXiD22P4mn4Z438SRIP2uVlnpt9vR
         g+LTszI/B7FvkP6NmtPNleMO91wBHIuhTcwCi7lYjawfRm6CAtKu+XcDi0434z3pZ8dY
         zRCvGK9gC5f7qHGpjcOahLgo4XeDEbxCoEfVL0n/B06pngYXxs54o3RS6Zy0APWLy/N4
         5pRvEiNxthQ2mE76+nHTlr2S0H1z5ruwiuG8P+Es+wAR+RkRukSBId0U0umnGJiffvOt
         YubcOw0oesMaYA0kGymiTEnIybp4CZPGiyCT9vUweWBcJxGM3zGfiYVbzZso9875Eybn
         AR+g==
X-Forwarded-Encrypted: i=1; AJvYcCVa3vnUFHNabARIkucFKjcezXqDLetz20MOFboYN7IHmRu/EWbmlDlSqUtI15CA4xOAZ97ohJAYJGA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtiKD1Bd4rts/lBt8JtJow34tiCMGh16ZNQokxKd3QE6r7uJjZ
	qGDxSIGI3DHBWrpBn+N4HZM+kmruvVgvJqJvAYR0LRoKxCL+bGo78CukDU8oOasZ4+0=
X-Gm-Gg: ASbGncuwS0cA3nhBtphE5qalpxAMTGIyeJcTmimuBw+ganUSAhcxFowB1Yr2z4FFJek
	q34vFXmjKgWTKloLMBfTLOWCpAc6YlJ9S0B7ZzODGJwcV/iTIzhJwPch8og1SN8zRgBX+xw3ZGd
	WdVyb3SalwDoapKeFcRMH1ONxs3pwBNFvIp8GZOqFBWPeAysnzK4pAszcEBEsCDGssJ00Msp3VR
	PlrZJoX0J4IpF6+wbGw0ECanHvoTTBRKiuWXFb7zPjXJ6cX93qN7tBgtyn+zsBXetvH2NzZk9Lm
	5o/xRdmzV7iXqYWnBm4f4DHjiOCbGpORBjxJOWPyWy6KH8OZaGXqMp5tLrxtta7fL98ZM1PMEy2
	nVqrslibZjNQCwAOyfjUEh7Ldg/KkzkZ3QOsGyz26hthMjhUrL5tfoHnVoyHWVA2ZYueg
X-Google-Smtp-Source: AGHT+IESOPAnau0u8S0AKGncn4+UuUNzqeKcgCeasLBX7eoVSx3Ebp/3yfgiRQWHlnfX9KYyCIZIsw==
X-Received: by 2002:a05:6000:2c11:b0:3b7:9214:6d73 with SMTP id ffacd0b85a97d-3b8d9472ee1mr4463794f8f.20.1754228202945;
        Sun, 03 Aug 2025 06:36:42 -0700 (PDT)
Message-ID: <25afca10-18e7-445c-b914-98d767016d70@citrix.com>
Date: Sun, 3 Aug 2025 14:36:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fork or replace dependency yajl?
To: =?UTF-8?Q?Christoph_Gr=C3=BCninger?= <foss@grueninger.de>,
 xen-devel@lists.xenproject.org
References: <d49ad645-35dd-4bd2-b166-d1803b2d95ba@grueninger.de>
Content-Language: en-GB
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d49ad645-35dd-4bd2-b166-d1803b2d95ba@grueninger.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/08/2025 9:52 am, Christoph Grüninger wrote:
> Dear Xen developers,
>
> you are using the dependency yajl (yet another json library, [1]) to
> parse JSON files. The project seems abandoned with the last commit 10
> years ago, the last release over 11 years ago, and 75 open pull
> requests. Packaging yajl requires patches, e.g., to make it compatible
> with CMake 4.0.
> There are some forks but none has replaced the old one yet [2].
>
> I think there are three paths forward:
> 1. Xen could pick a prominent fork and use it as its main dependency.
> 2. Xen could create a fork of its own, hopefully attracting more
> people interested in an maintained successor of yajl.
> 3. Switch to a different JSON parser library that remained healthy.
>
> Sure, you could stick to option 4., do nothing an offload the burden
> to fix yajl to distribution packagers.
>
> Xen is an important project and its decision can create momentum that
> might lead other projects.
>
> [1] https://github.com/lloyd/yajl
> [2] https://github.com/lloyd/yajl/issues/252

CCing the libxl maintainers.

~Andrew

