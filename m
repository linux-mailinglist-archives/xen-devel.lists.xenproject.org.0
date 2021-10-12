Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA6242AB5C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 19:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207595.363473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maM29-0008EH-CZ; Tue, 12 Oct 2021 17:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207595.363473; Tue, 12 Oct 2021 17:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maM29-0008Cg-9V; Tue, 12 Oct 2021 17:57:49 +0000
Received: by outflank-mailman (input) for mailman id 207595;
 Tue, 12 Oct 2021 17:57:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4MT=PA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maM27-0008CF-Kb
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 17:57:47 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b1c4a2d-3409-4e12-a2f6-6eee232f4971;
 Tue, 12 Oct 2021 17:57:46 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i24so314264lfj.13
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 10:57:46 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id w8sm813408lft.293.2021.10.12.10.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 10:57:45 -0700 (PDT)
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
X-Inumbo-ID: 1b1c4a2d-3409-4e12-a2f6-6eee232f4971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=eRywIytHJi/TgEwZvUVmCXQLQQ1Au7IWYpYam+eX6QA=;
        b=iKS99wr2tRobObhcnFmU7QcjJgs31sN0SquFHMMt9Z36G2407aIx8RsaIP7p/j0CH8
         JFzNKl00cuE8gM2ejnv1r5SjBd3fbLtHAsDY9xoAyGeMQeuVsESm6uVkhcelKa+G11gm
         KW6iSOErO6jgl3/yTy3wUP/ep5fc7ADqkznXx99ylOEN16p8x/fPkhxZuvzwYLZ9DkYj
         BCBn5fxGY2S5oWFXdjQcKJe7gkei92h50cf6I5gIVUAqn2Xp9N01a18zftItBfdemRwd
         igUZj874YdaB31YHxs0fP3wHDUjazSX3NvFuFg2YHEoLkerKhBO6n3l7Sp06rFUPyGSN
         fjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=eRywIytHJi/TgEwZvUVmCXQLQQ1Au7IWYpYam+eX6QA=;
        b=2C0eATavsbbnGGUmItur7eMOUDxBua0iZ4fiCRTcUeJ4JdiJIxzUEBi2vC30X3QYZd
         hOzxovXRUP4UaOtXQvnhSdML0YI+JmANc7VopWuIl0vUYfK2cTojirEWk0M6LGlOuy7M
         jMi15KM0c3xpwXRok3EWCFepswiXLgVn2a4zlaZknvl9q5Vn01PG5tALjs5an7B1JRwp
         A3V7hMMgsEDw5fQqnlp8UTvQxoewAJORIFSxO0nCG7C8uMCAUlgfqcDw71+QBvrUMoGt
         2sqoepOdBtWul1axpvKll0vy3Gf64JiYoRprpxReZ3ZHSf2r+36HGbVo3CTvTzaVshkO
         HSOg==
X-Gm-Message-State: AOAM530HAztEG4k04rIx2lL7nlGhbAe1kdGa0elGD4Zu2wnM6+tLu5+X
	ZKdQbZaM+lM2qsjwKBS70xU=
X-Google-Smtp-Source: ABdhPJy3VAPl86wuApQEinuOvSfSVaQUSgRrK0gU6y9KK5E/j90AH6FXT1S6yT8MDAmRnrceJXCOBQ==
X-Received: by 2002:a2e:9097:: with SMTP id l23mr32494656ljg.416.1634061465491;
        Tue, 12 Oct 2021 10:57:45 -0700 (PDT)
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
 <24933.42667.311553.565032@mariner.uk.xensource.com>
 <60541d52-4b44-e212-cc06-bb41e9ce67f9@gmail.com>
 <24933.46428.243423.112077@mariner.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0392bca6-4eb1-bc07-ecc9-fa1def156bfa@gmail.com>
Date: Tue, 12 Oct 2021 20:57:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24933.46428.243423.112077@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.10.21 19:18, Ian Jackson wrote:

Hi Ian

> Oleksandr writes ("Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo"):
>>> Oleksandr Tyshchenko writes ("[PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo"):
>>> You say "to the toolstack", but you are exposing this information up
>>> to callers of libxl.  Do you mean some higher-layer toolstack that
>>> uses libxl ?  What does it use this information for ?
>>>
>>> FTAOD I am not opposed to exposing this in this way; indeed it seems
>>> likely to be useful.  I just want to fully understand before I give
>>> this my tools ack.
>> I didn't mean any higher-layer toolstack, sorry if I was unclear. In the
>> first place this information is
>> needed by the entity which generates the device-tree for the guest on
>> Arm (tools/libs/light/libxl_arm.c) to properly calculate the extended
>> regions to be inserted into the hypervisor node.
> Right, OK.  So I think this is being exposed at the libxl
> gratuitously, because someone might want it in the future.
> I approve :-).
>
> Reviewed-by: Ian Jackson <iwj@xenproject.org>

Thanks!


Please note, it is going to be a new version of this patch based on 
today's discussion with Jan.


>
> Thanks,
> Ian.

-- 
Regards,

Oleksandr Tyshchenko


