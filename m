Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE09EB1EBE4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 17:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074800.1437293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukP1W-0003PX-R2; Fri, 08 Aug 2025 15:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074800.1437293; Fri, 08 Aug 2025 15:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukP1W-0003NO-OS; Fri, 08 Aug 2025 15:28:50 +0000
Received: by outflank-mailman (input) for mailman id 1074800;
 Fri, 08 Aug 2025 15:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukP1V-0003NI-7j
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 15:28:49 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 604a1026-746c-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 17:28:47 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-458bf6d69e4so20138025e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 08:28:47 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dcb86d6asm193478935e9.5.2025.08.08.08.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 08:28:46 -0700 (PDT)
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
X-Inumbo-ID: 604a1026-746c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754666926; x=1755271726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L+fjovgMHvAMO2GTAbojTnvppBMO9jbILXOU0N9Q2PE=;
        b=l8phi0yDGUExs7W9sa/SoV2yB92njG0DVcBt+kXFtr9LIV7JHQAKpJSAdudvIcm/AD
         3co/dW0HJnu6Nrt/Qz5R7YrCHxqieN4u9wwW4EkoOkeHs7fqD6gbxT9df4nq7LdwntL5
         UCZiZKoUSJM/aDzhK0PEsBJlCh8f08zgfMbDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754666926; x=1755271726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+fjovgMHvAMO2GTAbojTnvppBMO9jbILXOU0N9Q2PE=;
        b=mgpJScYJTOjtAs8Aqs/vQb/f8q8CUuo2gU1bbBGNgRGRnvWV3fsCXoaHaP5EQEF5ZI
         p+IIJ4+HwYsQW91hlHbwpFvrs9cSQZSlgZn7t6B0k1nVZOttImLO1f0IC+KtX82I8YAs
         y7/tCRGUfkeQsr5lCLXtFX8MOUooUsjRkLLfU3WmgAdRlxd3yeWBrOs5rSUqspkkh8ai
         h3TfNH6D7F40UypDyuDxLb+V7+K1nMCnW1hYyaghCnZYRglbDlhgT2nhyki4WKfoK80u
         kYu0EfXgqRewAduG42Ccn1hVktZEx6kHKJzruhfhKzXvByq3sBUlRmJBAsgFGZqxUcFB
         zjkA==
X-Forwarded-Encrypted: i=1; AJvYcCWPsQWzlF1ahBdaAONtVVRt+EqlDfEI6j7pDEmFvR22Rvy+Kb6+W2/U9NmKH4E9Rw0HY8k8sJTtOgo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgsalsmfbjV0j5InqVr2Fb9xcoL9mama7oGqwfhubSVZTP0xdw
	9t83bqvSQwHCywmcbiU1iHLiivEt2PH8xHKvYLGIfnehxoVCh8/zGF9iB8MwGTpCp/M=
X-Gm-Gg: ASbGncvcl6OxBxsyzmpLGKqDwD3+tT2k72kGaf3+bYgjzT26WQN0uLpy7/p4AlIpfzr
	1Y5Zyn5u5zRgIz50bqFHcpXS9+ltg08OJiLn/Usoe9m3rJ+TrNJmZmDLGBUA2CNTgGjnDWoEs14
	XkF+ozHvsd1t+Wumi518TypekVsC92TIass5oWcBMclHTRDPIRD5mMdwaAvVZFZrObVGAR6cX00
	C5vMqy1siTw+rY3Fapk1YHSw5tKj76bFymj2l4dR0Rqx8v2N4YOz4FBFi5XcfPZ626YKgHM5vQp
	R/WfLhAhb0wXToX+q9TqQQdaLkQa8VqyltmIIKuQLCmUx4tGcrWuj6nINX5lOLbrEEmoIqBYJIQ
	eI6P0GgF09g8NmffPTDa/+ygXVJpN+Qd2uC72mvfhfFdvxb3wiJt3ObWst87N7uEM+KHz
X-Google-Smtp-Source: AGHT+IFmr7aXeMUDqxisXJmiOXnf0OsqiQCyhbexW56xGxwGZz64qTrkFGgXx52O3bptJ9U08y9q6Q==
X-Received: by 2002:a05:6000:2890:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3b900b49992mr3370730f8f.3.1754666926520;
        Fri, 08 Aug 2025 08:28:46 -0700 (PDT)
Message-ID: <bab1e787-d690-41fc-8406-28695f0887fc@citrix.com>
Date: Fri, 8 Aug 2025 16:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: restrict clean target to xen
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>
References: <a1127245a45139c3c3fcd05b07c1c1e6dabb66c0.1747387457.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a1127245a45139c3c3fcd05b07c1c1e6dabb66c0.1747387457.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2025 10:53 pm, Nicola Vetrini wrote:
> The clean target also clears files outside the xen directory,
> which is not needed for the purposes of running an analysis.
>
> No functional change.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

