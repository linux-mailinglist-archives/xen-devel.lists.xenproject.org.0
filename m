Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD0C9D4C77
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 13:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841455.1256941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5rZ-0007Xv-Nt; Thu, 21 Nov 2024 12:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841455.1256941; Thu, 21 Nov 2024 12:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5rZ-0007Vr-LK; Thu, 21 Nov 2024 12:00:45 +0000
Received: by outflank-mailman (input) for mailman id 841455;
 Thu, 21 Nov 2024 12:00:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JH7e=SQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tE5rX-0007NN-Nn
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 12:00:43 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a258195-a800-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 13:00:40 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43168d9c6c9so6995875e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 04:00:40 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825490bfd6sm4799041f8f.25.2024.11.21.04.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 04:00:39 -0800 (PST)
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
X-Inumbo-ID: 3a258195-a800-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNhMjU4MTk1LWE4MDAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTkwNDQwLjI3ODE5OSwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732190440; x=1732795240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EO9H7L51gE6cPNefBYVK5KHtIK+HLO0v1Tul0wks2V0=;
        b=aAsXBWCn+B0uufBmTbtY0VYvVsZnRQhNxq9Iv/zf8na3yZkhX5iRikS8+oqx65k62j
         hb16Ted1bKCdvPBiTKMp2lkyQiNJDeMBYlU9Wv4wAwk02kwuG0xDpAjByu2y9Mc3GUHY
         +g+iwJCiizcWHhOuT9o7kFz3kxLDXyNhoomhwb0B590AIamavZM2nX1VpfjExKVkwMZv
         2nlEaGFaY0kEzHpKM5NU7g8Z2QQ+ZoScgxiK8wp3UpCHq7vgVLMtFVnN06r+1MS34Pkq
         vtBGpCGsGko6z2AepeoWIaLwkznbZuFM/c+Wc+0d+C+l0vCkd97yjNXqeDZRzwz3A+oe
         tAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732190440; x=1732795240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EO9H7L51gE6cPNefBYVK5KHtIK+HLO0v1Tul0wks2V0=;
        b=Sl8iFnSTX1aJxqqySONVpeFQTCMBLmJNh6bggBEdOfCLSfzWMQa4xTD1uHbVn0OaZ0
         TH18M6EtQBkc/miKLvXgZ2jur0IFWvsuNptaIWNv4CRwJ9FV9C3nsJQ7gQbSJzkU4nea
         ZOmlyEhrFGBh7crfkMf9TGsXIg/bQI6FF5iurT3wL4eGvFiy+Fb5iiIecrZZZjDYdIlJ
         V5DRKjt4ADAxzMn8zEONRFzc1SZEXxlKS+0WKUO2pTN58EXKYyyNAwLpWrjw//MdEDKL
         nHPLorxLopzYVPm96i5eqlSouPwkrhL9AN5aN+p14sEQxi18dFjvw6vZ3tiYJ5Itq4YP
         ledQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC9EbLhfP6QOTUhQahL4XIgwSZGTPxqvFX95NmEUaORYYdHyAh0/z8bksVBDINIqev8sLMT9c7x/U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXx290QLr0OM2QIsL2Ct/EhJDbAbWuPV1MIDRM6KGQy+78kkR7
	BsQQgMel3Elt1Zb7JdmzmWQ8/CZ1q/urdu2JzkAwGsbSBfqMvY5+xzJPQp+X/ZY=
X-Gm-Gg: ASbGnctDxXcfWolLryM8IEGqmnyu/O6NkaEhDYs8wsRvpCpc0DWNtswjUstJvqmko9i
	8EHMRL2ZbqM1+hnnsqIBZ2jMYDiHRMVOtNHI4rly2lq5xiuHO/7d7iURZu+sXthruMUAhDOm3bv
	bxpkmfS6ySJILZBxHgdD9y3X4egWbcrqLRXeNLfqFEs11Y6cSUcwLAtbSuIn+lsUdbqjbbY/PSY
	1PGAtSj1BflY+xycFtzN/i4sMnekL3/NSst4vXkAw+AVLajCTbZEKWSuJmlbrAPsc081kxDJ+gC
	OoYmm5sEDPsArx3nxxYTssmid2OUSkD6zlDA4038XuMyz+Vdgkab4G0Z4tJfmq7BllNGzf3TSxU
	=
X-Google-Smtp-Source: AGHT+IH/3NH9JKgLe2HMj+sVAVSzV5oHzHhIknlp/HwTvLcOeg4S3MgtK3eWa+wQPxuOZjcu3rfShQ==
X-Received: by 2002:a05:600c:444f:b0:42c:b4f2:7c30 with SMTP id 5b1f17b1804b1-4334f017137mr48829815e9.23.1732190439548;
        Thu, 21 Nov 2024 04:00:39 -0800 (PST)
Message-ID: <82dbba56-e803-4332-81f7-225e35048e1e@suse.com>
Date: Thu, 21 Nov 2024 13:00:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] 9p/xen: fix init sequence
To: Alexander Merritt <alexander@edera.dev>, v9fs@lists.linux.dev,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Simon Horman <horms@kernel.org>, Alex Zenla <alex@edera.dev>,
 Ariadne Conill <ariadne@ariadne.space>
References: <20241119211633.38321-1-alexander@edera.dev>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20241119211633.38321-1-alexander@edera.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.11.24 22:16, Alexander Merritt wrote:
> From: Alex Zenla <alex@edera.dev>
> 
> Large amount of mount hangs observed during hotplugging of 9pfs devices. The
> 9pfs Xen driver attempts to initialize itself more than once, causing the
> frontend and backend to disagree: the backend listens on a channel that the
> frontend does not send on, resulting in stalled processing.
> 
> Only allow initialization of 9p frontend once.
> 
> Fixes: c15fe55d14b3b ("9p/xen: fix connection sequence")
> Signed-off-by: Alex Zenla <alex@edera.dev>
> Signed-off-by: Alexander Merritt <alexander@edera.dev>
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

