Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE87F50E3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 20:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639123.996080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5tB8-0007Py-4X; Wed, 22 Nov 2023 19:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639123.996080; Wed, 22 Nov 2023 19:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5tB8-0007Nm-0T; Wed, 22 Nov 2023 19:46:30 +0000
Received: by outflank-mailman (input) for mailman id 639123;
 Wed, 22 Nov 2023 19:46:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5tB6-0007Ng-5C
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 19:46:28 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2ff915f-896f-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 20:46:27 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32deb2809daso58204f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 11:46:27 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a5d664b000000b0032d96dd703bsm180452wrw.70.2023.11.22.11.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 11:46:26 -0800 (PST)
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
X-Inumbo-ID: d2ff915f-896f-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1700682386; x=1701287186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/g9UaOlveAGyu7gb9Q0pn2i6ELlJ8AiD0KXn4w1/KK4=;
        b=DorLRqXkWCMWntlWZPN7lvIZOj2osd+1CZS1FBg/5K2qxZZnHuj/HkI/LATDZSO3Pe
         RNu5sex91IgZ+zbKwToUFsoKUnv55ZMNjoiV09642FTjHYnczLfy+z4rLwW5vCIr7Jix
         xUDUPoHAR0yIFYBF95anSu0ccoGw89xYP9aJsrauAwSrTftuHGghaWgR0BTdJ92Ft60j
         2lk7/tbWCCH0/qtox/UikqAUmL2dffHTwkwsOD9UcoqtJEOJGQm0oCt57WHX8QG6fpKG
         3IkihpOlPbeo3wA7oCTvia/z2HXTaajOSP1+ejqVZ36hPMvTyypgjJ0zurThdz+0auAj
         cJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700682386; x=1701287186;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/g9UaOlveAGyu7gb9Q0pn2i6ELlJ8AiD0KXn4w1/KK4=;
        b=qlX+cpr3bQ/uq3jN7EKN6IaB4NLBgDTcmJTpctgQ5pFPLmfYx2TISqVm7fnwPM5EiQ
         GGdDWQdYyDzayndK7r2FbiIuCdscXbgJvl6Kc25M/TK6I1Dnd7KzeXfY7GSnJv2gblnp
         Cp9T90XCkhm4oXs7k24uMRm7fMuZG7W3oqfDbu8Fq0wgMVLgPBlHDxLZXKW/gpBach0/
         peEqst2+PB8ND0ZMrTit+4FViXz9UNXqy7RDC5niMRiBJKsZ81sbaP+9T944057Nw1b3
         I41hNUj/WrOVI0re8h7i+aLMr5p2ZMVDdGmZFi+Yft6LFpqHUqHvJI2aW/Fet4/H/mWE
         B3dQ==
X-Gm-Message-State: AOJu0YxPSe8gYtRkxym1l56lsbBx3C+Pnu8unernCmrwKKzc6/VPewfJ
	dS+B6vyIZtpnzr4hJwwLbpxjmw==
X-Google-Smtp-Source: AGHT+IF4wKLO6QgXZ2SexWeuXeTUpo3S3qY6tv2IEcx9prKERa5g04g9x/1og8rlTH/d0EKtNEPP1w==
X-Received: by 2002:a5d:5987:0:b0:332:c585:400d with SMTP id n7-20020a5d5987000000b00332c585400dmr2231904wri.10.1700682386576;
        Wed, 22 Nov 2023 11:46:26 -0800 (PST)
Message-ID: <4d31c9f5-faf3-47f7-976e-2d5665ba446d@tibco.com>
Date: Wed, 22 Nov 2023 19:46:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tools/pygrub: Set mount propagation to private
 recursively
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
 <20231106150508.22665-2-alejandro.vallejo@cloud.com>
From: Andrew Cooper <andcooper@tibco.com>
In-Reply-To: <20231106150508.22665-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2023 3:05 pm, Alejandro Vallejo wrote:
> This is important in order for every mount done inside a mount namespace to
> go away after the namespace itself goes away. The comment referring to
> unreliability in Linux 4.19 was just wrong.
>
> This patch sets the story straight and makes the depriv pygrub a bit more
> confined should a layer of the onion be vulnerable.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

