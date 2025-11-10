Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E2C45A09
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 10:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158182.1486561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIOBT-0008Tl-9q; Mon, 10 Nov 2025 09:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158182.1486561; Mon, 10 Nov 2025 09:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIOBT-0008SI-6C; Mon, 10 Nov 2025 09:27:35 +0000
Received: by outflank-mailman (input) for mailman id 1158182;
 Mon, 10 Nov 2025 09:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpW6=5S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vIOBS-0008SC-0T
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 09:27:34 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c6ecddd-be17-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 10:27:33 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b7277324054so394164766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 01:27:33 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97d16esm1047362466b.35.2025.11.10.01.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 01:27:31 -0800 (PST)
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
X-Inumbo-ID: 7c6ecddd-be17-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762766852; x=1763371652; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwUcULCL/l6E4Vwj4UeykkUTRA6SwlEiv//sFr+BCd8=;
        b=ZAslsPw/BLi0NaEkpOo4pxMlDxrX84rVHyoeStxrj+CzGdRTW2qMoiRu6Uh0ufooLg
         MkyayTtQ7BzUPD555bfKPmyE6EiEKfhXpvNN6f+dW8V/UtS3xz6q6q6atFYQm8wh4PjR
         O2pGz/eNejjfhTHJQjHDrsRk2UExR+NOL3Txks7nw7MgXhVAxcV8MASuQFajzUgMOjzP
         Ffg3ObcEtbAd/c76c5TCc1GmKXKS8QQdJ2SPmvBUbCxIyRWx/qN1/Eggt6Rsi0wB6pzf
         M/f/h3QPsm0LQZk6m7eCWvoixATC9INGKcyAlWO+i0f4J1JAryquClAUywyzX8QOjPIV
         NtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766852; x=1763371652;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DwUcULCL/l6E4Vwj4UeykkUTRA6SwlEiv//sFr+BCd8=;
        b=gFEd6/v3zE1tXoyhr0zOA94bX8ep/in/NBohgoDLgcpLwgMbsS0vnsmJDxVEdlMHOh
         HtcNkKN91O01uVej73TAG8A5y5hU/oSRsin5s2J6eyjabLV9GXuOqgVuCIZ+EannaBoe
         O7Z3XKO8DFSwB6TV/Kx+nLooRUGqIZcmRy03xp1r+KVADozRaeNhlwqZDqwGE6mbb8A7
         +b74kFET4WTaQvdJ8hnVMabf1Z0MdaTjYK7RgD8KOFrei7Dg0euH4Lr0AWl4JPh3IVAd
         I7uQlWqGesFTzwGASttg+0T7GccY/miTSGJ73JpoXJ69ZJxIzXbQelV7vEDs/3tU7SLx
         Hz3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtOpdURs0NAE+UiHPGVjTG1vrAlHF2HT6AtlX8urSkzuQvUOj2kkJU0DQby5CQzFBqM0AMXdwDD0Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvVcv4HNeZVMs63xGmEj65vv5d5lPD9VKmOEMAjwkUKs918mrk
	xP11KsI3+l3+xR0oHMLE+6f0Q9TaBY/D+R5N2ZPwp9UTm/GZLBcWA7IjE4oubA==
X-Gm-Gg: ASbGnctKrJSMHxkjjkVB0fMyJEcPaQkYSDDCb+r/uuwapmz9VyE/h217Ytpdf4yaT6+
	sUxLf5pwS6xSsu/VDoNO5MgpAC+U8pF6ETyp8Ok2mnv+BLnA0muOs3z1a7yKt8bzObNOoopnpFM
	XWyTH9aItfFhvgxLAu+OCj4t5DG44kqW3dyhawEMEzvIuFLofh43u3+p8WXthWXdxvuggWxwaxp
	HcnK48YVxSs1B6ZwI4dxISCzrVdt/gcz1CJBhs/1F5AkbHeD5eAh61Uknnvb9xS7r2iVumLtauC
	7FzJUoU5zrZOzE+dkhPqT/W1/GVleCfecz3u6S337nDOa6T1pbXgcXnuweqqshmgXdqbwSJB+OO
	1xqKNLx4Hp8wh9rcXjxcu1cq+CKIpRLY1pcaiDNQ6Y+Oe71yFZYd+TJIZM/r8o8rNIKktXBRQUw
	97yAi4EOlCA2RQ4F7Pzkg0eb5TU39NQmE2EdttgazTRJJkvLoB6w==
X-Google-Smtp-Source: AGHT+IE1QuYD1R5kddGCi8WxDMzFkXbSDkMep961KYylK6A+E1y1D6YJ+sqKRLDwpT65wf2PNe4igw==
X-Received: by 2002:a17:907:7b81:b0:b71:5079:9702 with SMTP id a640c23a62f3a-b72e0339aa8mr830464166b.21.1762766852354;
        Mon, 10 Nov 2025 01:27:32 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------0jexM5uCR0K2xI3Y27Hg3Gzq"
Message-ID: <10d0601b-14d8-4a7e-b8e5-dc4bc1d19aa6@gmail.com>
Date: Mon, 10 Nov 2025 10:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Add extra rows to the entrysign model table
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251107134729.20735-1-andrew.cooper3@citrix.com>
 <52dcf4d1-69b7-437d-a01a-eec33f4535dd@suse.com>
 <36cdbd68-3285-4c96-b25e-9a0474a9a2ab@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <36cdbd68-3285-4c96-b25e-9a0474a9a2ab@citrix.com>

This is a multi-part message in MIME format.
--------------0jexM5uCR0K2xI3Y27Hg3Gzq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/7/25 3:34 PM, Andrew Cooper wrote:
> On 07/11/2025 2:30 pm, Jan Beulich wrote:
>> On 07.11.2025 14:47, Andrew Cooper wrote:
>>> Link:https://git.kernel.org/tip/d23550efc6800841b4d1639784afaebdea946ae0
>>> Fixes: ff8228ab4658 ("x86/ucode: Relax digest check when Entrysign is fixed in firmware")
>>> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
>> Acked-by: Jan Beulich<jbeulich@suse.com>
>>
>> Pretty likely wants to go into 4.21? Cc-ing Oleksii, for him to judge.
> Yes, and backporting, but I've got more ucode bugfixes I'm working on.
>
> One in particular was always broken, but exasperated by one of my recent
> changes, but I'm not sure if the result is going to be comfortable for
> 4.21 at this juncture.

I think it’s not a good idea to skip the SHA check, so it makes sense to
accept this patch:
  Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------0jexM5uCR0K2xI3Y27Hg3Gzq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/7/25 3:34 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:36cdbd68-3285-4c96-b25e-9a0474a9a2ab@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 07/11/2025 2:30 pm, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 07.11.2025 14:47, Andrew Cooper wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Link: <a class="moz-txt-link-freetext" href="https://git.kernel.org/tip/d23550efc6800841b4d1639784afaebdea946ae0">https://git.kernel.org/tip/d23550efc6800841b4d1639784afaebdea946ae0</a>
Fixes: ff8228ab4658 ("x86/ucode: Relax digest check when Entrysign is fixed in firmware")
Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

Pretty likely wants to go into 4.21? Cc-ing Oleksii, for him to judge.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yes, and backporting, but I've got more ucode bugfixes I'm working on.

One in particular was always broken, but exasperated by one of my recent
changes, but I'm not sure if the result is going to be comfortable for
4.21 at this juncture.</pre>
    </blockquote>
    <pre>I think it’s not a good idea to skip the SHA check, so it makes sense to
accept this patch:
 Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------0jexM5uCR0K2xI3Y27Hg3Gzq--

