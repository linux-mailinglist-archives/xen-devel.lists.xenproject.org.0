Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F95AB542B
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 13:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982766.1369101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEoFT-0003vO-SH; Tue, 13 May 2025 11:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982766.1369101; Tue, 13 May 2025 11:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEoFT-0003se-Pd; Tue, 13 May 2025 11:56:39 +0000
Received: by outflank-mailman (input) for mailman id 982766;
 Tue, 13 May 2025 11:56:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0QL=X5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uEoFR-0003sY-VA
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 11:56:38 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52889e0d-2ff1-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 13:56:36 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-441d1ed82faso38614325e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 04:56:36 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67df5ecsm163763805e9.9.2025.05.13.04.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 04:56:35 -0700 (PDT)
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
X-Inumbo-ID: 52889e0d-2ff1-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747137396; x=1747742196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uKWHcb5UhDMvTvtdTVV8vNFfjuOzkIhKzAOTGnbwEO0=;
        b=VdKo6TyeIpD1Hx0qlVP6/1k6eC6MHnsq457XRJm/B8ND46gBNjTnS1vjP2tjAZC+2A
         B2spHDCJjTfxf0bRt3QGjhH+buJxKsZdL71cQR8fssCenHTqNiCvcQDIIQIPrgTiIVWh
         BxCkeMHWDJJ9i9RjnPfy20ErV2cKcebLaUH/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747137396; x=1747742196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKWHcb5UhDMvTvtdTVV8vNFfjuOzkIhKzAOTGnbwEO0=;
        b=BIJ8Ka91GGpQOPTp1r73hwBqR1jpebK7NL4FDFRyDwtaVrNnEVoUoeXL1ZGJsQnWEW
         wH9lX008Ow2gl2Ikub3lsnzW3Zx6TWUV46sJBHW/P8LTD3onE0POGjtuggoNq9SeJKWp
         pQpO6nR5k33x3vnlB4ukwnT76HrxsZu98EESPrIBeAixpp3clx7AjcMINfMkNY6V6qjV
         N7SgWxq0CTLrqn9NOBO3m7SuPW+wtepzmU73h5hoK/xBH9MVo66vCM0lbpcXkhFPdwUg
         QjQL/oUIxrps3ZRMiXOMvUDK0/vx+0aaNI3HgvxgLEHkqqWmc+H/jjylanY3zKoRVk4l
         /T1A==
X-Forwarded-Encrypted: i=1; AJvYcCVim04OunjIwjHksM4mp5CrHpUm5eVyiKnW82QoiBZaG+OaEY170NJjTVHGEsXWFFnL7LYMGD9M43k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yws5SQF2LHN39S00ppE71gr9QZ/ymlIDTAejZxs2wnS6+DO6+OG
	B0nIdcFdDHfx+WbLvMMQpn5YfwtySTfDAAhHtKRje+R+Mjkl/HwnPL39KBSlvVI=
X-Gm-Gg: ASbGncuhsJAy6GXyWExWtu+FfkI6cN6ToSNLrI6wfeKukuaNN44lTZ7GuoBqcZ/zZon
	VUieQD4mHqFYt7+zAiELTdQlQFhWuW2Qjimdb07Qzm05j1je5Qx16fVCbqwXSmzd8OjFNN0Yp/t
	JrrB99a0drohPwpem4xtcoHQRdTuVbntp2csi3Dm31k0XNj0A6Uu9X/SRvhdyD1Tudeii5Yo3CR
	EMV7lnNBwNioUkG8PC4nKqJs2wapDSQ+sDsSO6utnHkDowAeBo8yQjhD637h49sH6Lk7aiSPq2J
	z5DToRIZPs7hWcyBftwL/y9F8kQGBcYjkwiaKVBa7Kej5QQMHHxN5t3zVzK6l1X5Oz1mD91CZw+
	Zat3xxXqA/nU2C96sX/472RMvn70=
X-Google-Smtp-Source: AGHT+IEfoGTwU2AfFnFgCbKafDs1veM3mLjPpDZUhgH/p67yibV96JvUeTV+RfHFDakIwWqTYBYxxQ==
X-Received: by 2002:a05:6000:2ce:b0:3a0:b7e7:1076 with SMTP id ffacd0b85a97d-3a1f646d9ecmr12427534f8f.11.1747137396231;
        Tue, 13 May 2025 04:56:36 -0700 (PDT)
Message-ID: <d76f85a8-cbe7-43b5-85e8-fb46cd0be0d7@citrix.com>
Date: Tue, 13 May 2025 12:56:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] crypto: Add RSA support
To: Jan Beulich <jbeulich@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
 <20250506143218.1782603-3-ross.lagerwall@citrix.com>
 <e59ff21f-b597-460a-af82-371dc454b676@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e59ff21f-b597-460a-af82-371dc454b676@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/05/2025 1:38 pm, Jan Beulich wrote:
>> + *	Copyright (C) 1994, 1996, 1998, 2000 Free Software Foundation, Inc.
>> + *
>> + * This file is part of GnuPG.
>> + *
>> + * GnuPG is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * GnuPG is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, write to the Free Software
>> + * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
>> + *
>> + * Note: This code is heavily based on the GNU MP Library.
>> + *	 Actually it's the same code with only minor changes in the
>> + *	 way the data is stored; this is to support the abstraction
>> + *	 of an optional secure memory allocation which may be used
>> + *	 to avoid revealing of sensitive data due to paging etc.
>> + *	 The GNU MP Library itself is published under the LGPL;
>> + *	 however I decided to publish this code under the plain GPL.
>> + *
>> + * mpi.c code extracted from linux @ eef0df6a5953, lib/mpi
> I fear this line would go unnoticed with future changes, and hence go stale
> rather easily. Menioning the origin in just the commit message ought to be
> sufficient.
>
> Btw - how heavily did you need to adjust the code to pass our Eclair scan?
> Depending on that I then might raise the question of converting to proper
> Xen style (it currently isn't even proper Linux style, afaict).

I've put this through Eclair.  Single R16.3 (missing break) violation. 
Happy otherwise.

~Andrew

