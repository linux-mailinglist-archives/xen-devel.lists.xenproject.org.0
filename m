Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3547749F66C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 10:32:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261897.453748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDNcJ-0002JO-Jm; Fri, 28 Jan 2022 09:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261897.453748; Fri, 28 Jan 2022 09:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDNcJ-0002Fy-Ff; Fri, 28 Jan 2022 09:32:27 +0000
Received: by outflank-mailman (input) for mailman id 261897;
 Fri, 28 Jan 2022 09:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NLE7=SM=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nDNcH-0002Fs-8s
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 09:32:25 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3306d439-801d-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 10:32:24 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id m14so9434012wrg.12
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jan 2022 01:32:24 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id t16sm1600627wmq.21.2022.01.28.01.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 01:32:23 -0800 (PST)
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
X-Inumbo-ID: 3306d439-801d-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JRo1T7L6MW/uOzZekDbIeAx5PEsC9wF7g3b0GyFOUz8=;
        b=RwQ2Sl635Q9EooFA16w7vPJnvrNWJwwIrHslEeOqJahHHnERcXo0TdZWZsrYM6XYaV
         XcTw81EXb8+qTjUs5og452xp0c9eCLDa8n6EOLd4DwUaETJRaPt4iRfMddj9qikIkmRi
         a2ZoJQGFZIOrCqQft62FeJ+OKjzSd9xTgd7q4JmsNrkKvgd6iFFtMQLnrWlfwh5ywulQ
         r6BLLshOl6of9QGt/2fOokQVCbZEvfAO5HXybm78zQD+x5mi2CV+wAMYFEXISNsVns/Z
         4OUsXeFu1VO41hrcTvEodrsMo0QmIOZeAwqfBPxs7+gfcA92aGqqGX0n8fUvgRoCL/Qf
         mSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JRo1T7L6MW/uOzZekDbIeAx5PEsC9wF7g3b0GyFOUz8=;
        b=kqXuS7TIHFcUEZ6Qor9dO51IxYRAkFGTmStpu8/i34gL9lE170f35985mz7J/LDTh/
         G7ZvlccqDhAd4TnMAAAQLAF2t5s6/s5vy4AOB0tq4xke7TpGxI8uf5h9biDld6QHzTGi
         Yra2bPL/W8xfXbXNkj66Imz0yXQfke5dDuDC71wP+SJQc8ueXMtKKKSRI3ML0DmDkZ7p
         X7ZbChmAcT4d2hElJPwTrBmTJxSpVS2LxC3S/hSyvw1A4UzV03WOuaaPp/3XQ5/+Iv15
         pQsqDDG6qijQj899i8VGqLOLlhWrI2oM1YDV0V9RULI0iLv2NH1+kh8go5Acz4W2YYOd
         PcCQ==
X-Gm-Message-State: AOAM532IGyqQ+ezI8raDruGdcdJyoioNU+TptDXiTuDklzyRhEqy+Y4E
	XXLaRz7+x3ROnYd/guuhktc=
X-Google-Smtp-Source: ABdhPJzcEgDCfQgyM6LJMQA0GffUJySlPCdLQqCoNoo6jCDnwjh9GVjGF5J9dyxlQ8kXiNRtyviYQQ==
X-Received: by 2002:a05:6000:1a8c:: with SMTP id f12mr6040520wry.511.1643362343916;
        Fri, 28 Jan 2022 01:32:23 -0800 (PST)
Message-ID: <982ac98a-966a-c996-882b-1bddd7423c0b@gmail.com>
Date: Fri, 28 Jan 2022 09:32:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 2/4] VT-d / x86: re-arrange cache syncing
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
 <54c4539f-0bed-c42d-aa8e-4e31c45c4245@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <54c4539f-0bed-c42d-aa8e-4e31c45c4245@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/01/2022 14:48, Jan Beulich wrote:
> The actual function should always have lived in core x86 code; move it
> there, replacing get_cache_line_size() by readily available (except very
> early during boot; see the code comment) data. Also rename the function.
> 
> Drop the respective IOMMU hook, (re)introducing a respective boolean
> instead. Replace a true and an almost open-coding instance of
> iommu_sync_cache().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

