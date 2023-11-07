Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BF67E49A0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 21:15:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629006.981019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0SU4-00019H-11; Tue, 07 Nov 2023 20:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629006.981019; Tue, 07 Nov 2023 20:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0SU3-000172-UF; Tue, 07 Nov 2023 20:15:35 +0000
Received: by outflank-mailman (input) for mailman id 629006;
 Tue, 07 Nov 2023 20:15:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/6F=GU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r0SU3-000149-9z
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 20:15:35 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 681f36e1-7daa-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 21:15:34 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32deb2809daso3613030f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 12:15:34 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 b16-20020adfee90000000b0032da4c98ab2sm3198162wro.35.2023.11.07.12.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 12:15:33 -0800 (PST)
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
X-Inumbo-ID: 681f36e1-7daa-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1699388133; x=1699992933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i0aom8hb3w3PZh7RgpECDWre/7ojOjLNZRNT7kQsHMc=;
        b=FM1COSe7Eb+z1cMlNbzMU7NGDaDbOGu9oMYKhigr20m+pwtaINWD6qiwhi8OKTRzyc
         9V7HxaNazi1IMB1IsYS3AKNsGeH0xqNxYSvD+Kb+fXtoTcZO/oiJjkC6rB4VwVrk70Ij
         X1qbiL8JFgP214hQ/zW2bxi46gwI6Tr6R8Tz5YgCCRvTbNV0gLCY7Bpqt1qJs/7BKaHq
         KBJ0ItEIOtJ+Q5WgdK/CG+xFqkieUcH5SciKsY/BxlP4rOG01+ujp1ONuX+bubAISu4Y
         MsF1fUeSIuCFSMF4F2MENP0vW4cKSXKqBsamHZiXXth2zqv/KYWTeXZ3QW7FpRU1jWwr
         yYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699388133; x=1699992933;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i0aom8hb3w3PZh7RgpECDWre/7ojOjLNZRNT7kQsHMc=;
        b=ZZKGiVkqoEvBpdhlBTaQ2p/vB6vkb+peqR7jeerRRKClOBiZzeHAbp5WHPbOqyWkjz
         UJpoTAErSv3kpYFWZ+abhDfq0Y/Xvl/yDrihbo+BcHk8fr7rQ+a+vxJ/vhl/nYYAOwjQ
         IEoD9mOnj4ui7j6eVceRUW/2FMS/ZV+ecdWcjo+h2QxBxwT1X8Ig/OfMjjw0/EZgJXgx
         kmkVx8juUUKTsZsexWvRf0l+ihP23bCShgeFzzF+EDAJhDeO7AF22YhcW0ExPDKWkuAX
         n87DeaKLw9aAxXzFDXgJFNiBMsdforpgrzC08l6+SpSHLINgEYaSEwLPqJjQlq4G6Jc0
         Nctw==
X-Gm-Message-State: AOJu0YwMvgAvAbr4+K6tkok6y6rb932v8stQANqVPLWASC/0Fxr8w3FM
	gzGarLysCRwcGSpj71HOX/GYtjU4o1MqKEXLcuk=
X-Google-Smtp-Source: AGHT+IEz1ff3yRv4M5mb9taocU6tSbosUvhiLEmhEUf2PX+s2KxtmeWAnn63rCzX0gH/Ktba4Euq8g==
X-Received: by 2002:a5d:62c9:0:b0:32d:baf4:e572 with SMTP id o9-20020a5d62c9000000b0032dbaf4e572mr22282034wrv.23.1699388133471;
        Tue, 07 Nov 2023 12:15:33 -0800 (PST)
Message-ID: <93db0a9e-1d99-4953-9e3f-7ad69f0e78bf@tibco.com>
Date: Tue, 7 Nov 2023 20:15:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support situation for nestedhvm
Content-Language: en-GB
To: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
References: <ZUqVnfZTtjb/W5EN@mattapan.m5p.com>
From: Andrew Cooper <andcooper@tibco.com>
In-Reply-To: <ZUqVnfZTtjb/W5EN@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/11/2023 7:53 pm, Elliott Mitchell wrote:
> I ran into the nestedhvm via the following path.  I was considering the
> feasibility of shedding tasks from a desktop onto a server running Xen.
> I was looking at `man xl.cfg` and noticed "nestedhvm".
>
> Since one of the tasks the computer handled was running other OSes in
> fully simulated environments, this seemed to be something I was looking
> for.  No where did I ever see anything hinting "This configuration option
> is completely unsupported and risky to use".

This one is explicitly covered in SUPPORT.md, and has had XSAs out
against it in the past for being unexpectedly active when it oughtn't to
have been.

> Things simply started exploding without any warnings.

Things also explode if you try to create a VM with 10x more RAM than you
have, or if you try `./xenwatchdogd --help`, or `xl debug-keys c`, or
many other things. 

The xl manpage probably ought to state explicitly that the option is
experimental, but that the extent of what I'd consider reasonable here.

You can't solve educational matters with technical measures.

~Andrew

