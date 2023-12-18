Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7C816D9C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 13:12:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655957.1023856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFCTa-0004r1-Fy; Mon, 18 Dec 2023 12:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655957.1023856; Mon, 18 Dec 2023 12:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFCTa-0004od-DL; Mon, 18 Dec 2023 12:12:02 +0000
Received: by outflank-mailman (input) for mailman id 655957;
 Mon, 18 Dec 2023 12:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5ff=H5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFCTZ-0004n4-2g
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 12:12:01 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4eb2cae-9d9e-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 13:11:59 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c6e2a47f6so27937985e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 04:11:59 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 be9-20020a05600c1e8900b0040596352951sm44461314wmb.5.2023.12.18.04.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 04:11:57 -0800 (PST)
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
X-Inumbo-ID: a4eb2cae-9d9e-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702901519; x=1703506319; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sxvYF1wjc1IVUHSe1pg6IpLYnJtbNQPeJwvV7IgPw68=;
        b=mNIJBXRhVeo01A2FMKZY/Ymg0eXMeTzDVnSZYG7CV2AmPKAD0NZ5Tcjz9J17G2h6gq
         FBCWvxJ2TZEt0NXmQftLDxW73+AH4GlT/MfTQXH/cejSuP1vAaMSQQiPoJA32dZPoO+6
         Jyyp6XfjDWcCatG1nHthGvF+G/m/D7qwMZf1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901519; x=1703506319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxvYF1wjc1IVUHSe1pg6IpLYnJtbNQPeJwvV7IgPw68=;
        b=q/WAC4bn3Nb9qNCLdCqQ1asvujBHGGEayM3J3nObZfsara4ULDKIVT0i5Cj53Bxb5i
         AEpHVK2fuNG+A1OE7whcMtWVqN+TTFnHokq3Y3SA5SiBXJRbM8I+sUmIHroceShTTqCn
         lzMnQ3MhZd2LByS4QlOBwVxlKvrcdw4ajY3ElCWwBJBYVPx3R/2mGyZkCJJBRh5YbZOs
         KuF7xQnBJqWQflSCJINoIfqjq9VOu21hLxUFmOI662AUz5xZ4GuHeoWIJYjjFwGy7voX
         XolKPd45956gxZU7BR1oGy/eBAKL+05d3E6OTWl1bxtQapPdC5E0Ihp9d5PD+Urrl9gx
         BRtg==
X-Gm-Message-State: AOJu0YwKGO/zRUlKMsKfTw38ifK1TnIXzdD6kkAlkghoGeKpiRHms5ZR
	ZJgbwYtz6DufMwsoAUX1FPLKsg==
X-Google-Smtp-Source: AGHT+IGomCiHaws/pxyKohiOFMjYIupD5ND/LK9juxMLf2SAPbbxh7HSKFk5qupGusP6NlWZ743jnA==
X-Received: by 2002:a1c:6a11:0:b0:40c:4ecf:e447 with SMTP id f17-20020a1c6a11000000b0040c4ecfe447mr2661757wmc.222.1702901518797;
        Mon, 18 Dec 2023 04:11:58 -0800 (PST)
Date: Mon, 18 Dec 2023 13:11:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
Message-ID: <ZYA3Db53Z3fvBlwn@macbook>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <31da79de-bd6b-af95-793a-c16516992bc7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <31da79de-bd6b-af95-793a-c16516992bc7@suse.com>

Hello,

I'm not as expert as Andrew in all the speculation stuff, but I will
try to provide some feedback.

On Tue, Feb 14, 2023 at 05:10:42PM +0100, Jan Beulich wrote:
> In order to be able to defer the context switch IBPB to the last
> possible point, add logic to the exit-to-guest paths to issue the
> barrier there, including the "IBPB doesn't flush the RSB/RAS"
> workaround. Since alternatives, for now at least, can't nest, emit JMP
> to skip past both constructs where both are needed. This may be more
> efficient anyway, as the sequence of NOPs is pretty long.

Could you elaborate on the reason why deferring the IBPB to the exit
to guest path is helpful?  So far it just seem to make the logic more
complex without nay justification (at least in the changelog).

> 
> As with all other conditional blocks on exit-to-guest paths, no
> Spectre-v1 protections are necessary as execution will imminently be
> hitting a serialising event.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I have to admit that I'm not really certain about the placement of the
> IBPB wrt the MSR_SPEC_CTRL writes. For now I've simply used "opposite of
> entry".

Maybe it would easier to just add the MSR_PRED_CMD PRED_CMD_IBPB write
to the vmcs MSR load list?

It's a one-time only AFAICT, as you would only want to do this for
context-switch AFAICT.

Thanks, Roger.

