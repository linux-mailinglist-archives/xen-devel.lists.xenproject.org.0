Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A767845BEB
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 16:44:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674508.1049480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVZDq-00065M-Kz; Thu, 01 Feb 2024 15:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674508.1049480; Thu, 01 Feb 2024 15:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVZDq-00062n-HN; Thu, 01 Feb 2024 15:43:26 +0000
Received: by outflank-mailman (input) for mailman id 674508;
 Thu, 01 Feb 2024 15:43:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Zkz=JK=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rVZDp-00061u-Cu
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 15:43:25 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a240a512-c118-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 16:43:24 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e76626170so9304235e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 07:43:24 -0800 (PST)
Received: from [10.95.167.50] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c260c00b0040d87100733sm4683354wma.39.2024.02.01.07.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 07:43:23 -0800 (PST)
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
X-Inumbo-ID: a240a512-c118-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706802203; x=1707407003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g2UrnwlOgsItEDKTVLgJCkedsveuSTltHV+AVhMWfwo=;
        b=jMtTrhX8uL6LODSVrmT42juVnhrpOHZKIEYzr1QBh8NbFYFLffvQHgXbnHHTkJvh5l
         LLT+3EvTY4JbfLF9kyggyc7OYtXskXlzrPix2bDe2LJWeOf9cUb0eC7BFtqDPMz14yjH
         UgPy37X1YtM1wtPzalR9XRVlNWXSH6KwXAwQ4dpj5rlWIgUTCAcGeRM3tZ9vU8wmm40c
         0eFNjg1RP+WFUU3Up56Tn8O+5godcbo0C1fQgOichHwMwgddn4ogam4xtpuqJepvGm3l
         frpbswWLyBFz0OZF/R+mltBBL+sEPHmMnA5AETEnnMM1kItLK6W9+5VzYbdhc1pRgyY9
         eq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706802203; x=1707407003;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2UrnwlOgsItEDKTVLgJCkedsveuSTltHV+AVhMWfwo=;
        b=pAw/gdwY1Zge1C395g9s1uxPrWs7gfLCsn5XhBCQkhznRI4EshW3EAxSlYVig1Nn4l
         U9Sewp6JHnimMYwe7LGlGbYc+oIqNbAmESzsfGc7xMrF74ZcAkMKeGSfe0AxBnf0j+EC
         Z9IPJq0enkK8AvgIdnu3Vb17rA9KccpvCn+rSG+1iPZA/JwOfY3jZ2N0CUZ2WxNTCWMS
         EepNZXKunqEpoaipcfWMnTbsjws9QRkublNQUavqTTMo8OPESqxakIEZ5lFJXm82JtP0
         qSPzTFdZyV3Y6Qk4Lo80ogeIi+X+XanF8kecRRgdxvmv8B0/z8wdXjlBcX28Noslvewd
         5ksQ==
X-Gm-Message-State: AOJu0YyYwUS/5G4CikH+zb12YVm6e6PM5vUTKvO4Fjj8FY9/2zIbnqUN
	MxZN4/nypod84iWuO0mvYGS4cPQxo/6EkxBpKLqSGLLY4nsNP1P2
X-Google-Smtp-Source: AGHT+IGwEQbXnJ24dLKwBX9KdAuPoFpCEhwu8WSK1M5x2HdTKaFyDg5C3nBYtavqD107Kr1ecR86Gg==
X-Received: by 2002:a5d:440b:0:b0:33b:182f:eb9d with SMTP id z11-20020a5d440b000000b0033b182feb9dmr1261356wrq.43.1706802203356;
        Thu, 01 Feb 2024 07:43:23 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWhQorHyBHjSUpH8dxTdPXUf5nO8Z9/mt5FVm88AJruzfba5njDn7SvUjQAgNPuU7tlZqD0U5nA3VizSmFmtAhGM9Ry5S8SuJSInCWFV5UlbgMbv8KnpMdlcRXnteE3NnhGPS4NFlly26oaQtBBnbptkRA=
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ee98c944-610a-44a3-a26e-a10c25c12eb8@xen.org>
Date: Thu, 1 Feb 2024 15:43:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH net] xen-netback: properly sync TX responses
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <980c6c3d-e10e-4459-8565-e8fbde122f00@suse.com>
 <20240131162336.7d3ba09e@kernel.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240131162336.7d3ba09e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/02/2024 00:23, Jakub Kicinski wrote:
> On Mon, 29 Jan 2024 14:03:08 +0100 Jan Beulich wrote:
>> Invoking the make_tx_response() / push_tx_responses() pair with no lock
>> held would be acceptable only if all such invocations happened from the
>> same context (NAPI instance or dealloc thread). Since this isn't the
>> case, and since the interface "spec" also doesn't demand that multicast
>> operations may only be performed with no in-flight transmits,
>> MCAST_{ADD,DEL} processing also needs to acquire the response lock
>> around the invocations.
>>
>> To prevent similar mistakes going forward, "downgrade" the present
>> functions to private helpers of just the two remaining ones using them
>> directly, with no forward declarations anymore. This involves renaming
>> what so far was make_tx_response(), for the new function of that name
>> to serve the new (wrapper) purpose.
>>
>> While there,
>> - constify the txp parameters,
>> - correct xenvif_idx_release()'s status parameter's type,
>> - rename {,_}make_tx_response()'s status parameters for consistency with
>>    xenvif_idx_release()'s.
> 
> Hi Paul, is this one on your TODO list to review or should
> we do our best? :)

Sorry for the delay. I'll take a look at this now.

   Paul

