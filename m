Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FADC876619
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 15:14:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690318.1076210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riayl-0003he-9b; Fri, 08 Mar 2024 14:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690318.1076210; Fri, 08 Mar 2024 14:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riayl-0003fE-6d; Fri, 08 Mar 2024 14:13:43 +0000
Received: by outflank-mailman (input) for mailman id 690318;
 Fri, 08 Mar 2024 14:13:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7MCP=KO=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1riayj-0003f5-K9
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 14:13:41 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10344cd1-dd56-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 15:13:40 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51381021af1so1172035e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 06:13:40 -0800 (PST)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 gw7-20020a05600c850700b004131cf78b4bsm217270wmb.12.2024.03.08.06.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 06:13:39 -0800 (PST)
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
X-Inumbo-ID: 10344cd1-dd56-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1709907220; x=1710512020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7XAbHe3tvltBkDMNXGP8CG3mD1nQs603kllqrVvmKiY=;
        b=fuYattArEH/Vg6Sznsi6ff9Uflv/AbvOD64pmEUNZ/2P6ewrsTccwpa7Tg91VgzOde
         8bcVPY68Kv0gitdMQh899m5WFCFLH+cDLMMYmkuo6/8b3UEtWoOlbD2ncCl/eSIVOT+T
         cyVwoQOpqHS/EaBzrLUEy7x4YVvagO1axRXswJeh2kh22EETcSi7aWT55vWPHqz9YcH9
         KuIFwCN/wx122wJqLTRY6/aCmg0+CYxTH7JiXbFXNp3x6cA+08GxdLQKyu8N3twZDS3H
         ORO7FyYx59EP0nNvodPGOKoa9NqcCYwPjwpFAwmJeSGJP14DxGAU/Mi2lCi7OrrmhbuP
         uOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709907220; x=1710512020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7XAbHe3tvltBkDMNXGP8CG3mD1nQs603kllqrVvmKiY=;
        b=p9iteSjEEflqUo3MHQrgOQJRAie19oELx7QCI0NeSrYsrQYCghN/v3xMhhZZqrMGva
         nsAR6UNscTmNYg9UiR1Yh+nfQawpgIORrxP8IkG/lgz9bVP0ezHfR3ym/n/YEqFzwGF6
         qHoOR+QUkwckvLYaQL5rhmVhuHuQNuqV+MyBSgxlHO01PP3GHHyV/8WNWVcrqtwZDfUS
         kzIh1qUHUW1LhgrNJfqaGlgwRgwrTxkvBSRZdBvnrvFHGz7aO4GRgIrXz3+7B3eDvKEH
         tAYaC2ikfuecwBuw9DEMWWc53UIqM995jchjOcL4MO0a4gbGkV7cCP/h5DiLZxoajPhY
         5rOg==
X-Gm-Message-State: AOJu0YxjvwNh3ET9p6d0cm22H+B8s3J7Ee4cPYWFiuxw4zAMdtN7v1lz
	5DGEt6OS1GACcXuuKF073eGAE0FEe1qW8yYEjToWQo3NYJzlY92PCKEQxyEKDz4=
X-Google-Smtp-Source: AGHT+IHHyMgfPmmrz8wWvAMD475ekmMq2W1vHljLZEFs+uHP/F5Y0ttyry/ouByw4YhvR8jCf0PFKg==
X-Received: by 2002:a05:6512:3b9:b0:513:5dee:3a7d with SMTP id v25-20020a05651203b900b005135dee3a7dmr3081205lfp.50.1709907219716;
        Fri, 08 Mar 2024 06:13:39 -0800 (PST)
Message-ID: <172632e1-9d9a-415d-a6e7-47e3803ab6c6@rabbit.lu>
Date: Fri, 8 Mar 2024 15:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/man: add shutdown reasons to xl (list) man page
Content-Language: en-US
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <019602d6da2ff78e6582b9b6aae6d76216e150c3.1709678713.git.slack@rabbit.lu>
 <5e8987de-36b1-4e00-876c-79a93e5334a9@perard>
From: zithro <slack@rabbit.lu>
In-Reply-To: <5e8987de-36b1-4e00-876c-79a93e5334a9@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06 Mar 2024 16:43, Anthony PERARD wrote:
> On Tue, Mar 05, 2024 at 11:45:13PM +0100, zithro / Cyril Rébert wrote:
>> Add the shutdown reasons to the paragraph of "xl list" concerning the
>> shutdown status.
>> I have copy/pasted the explanations from the source code :
>>
>>   - tools/xl/xl_info.c (L379)
> 
> Instead of a line number, how about the function name?
>   - tools/xl/xl_info.c (list_domains())
> 
>>   - xen/include/public/sched.h (starting L158)
> 
> And here, I think that would be "sched_shutdown_reason".
> 
> Line number tend to change as we add more code, which mean that the line
> number is only valid at the time it is written into the patch
> description. But functions and struct name are less likely to be
> renamed.

Agreed, and for all other remarks too, so will send a v2.
(I'll also add Roger's remark about wrapping the long line).

> <snip>


