Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DED817597
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 16:41:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656184.1024242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFjn-0006HD-6P; Mon, 18 Dec 2023 15:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656184.1024242; Mon, 18 Dec 2023 15:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFjn-0006FX-2r; Mon, 18 Dec 2023 15:40:59 +0000
Received: by outflank-mailman (input) for mailman id 656184;
 Mon, 18 Dec 2023 15:40:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=De97=H5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rFFjm-0005ry-5i
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 15:40:58 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5b3d333-9dbb-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 16:40:56 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50e24e92432so2695808e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 07:40:56 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l10-20020a056902000a00b00da02a2ef6afsm7693663ybh.30.2023.12.18.07.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 07:40:55 -0800 (PST)
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
X-Inumbo-ID: d5b3d333-9dbb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702914056; x=1703518856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b6fLVb/vulkuNQXxodn4pu2ol4A2t+yKrYSWudKFm7c=;
        b=gq99cwD/YM0g5K1dW2SllJPkzkBc59ziKtrk6p/IsC8xs4fv6G45rVkNPTL1btxhWU
         OR1MKOK1jZzVeuGV3mX14wtq9ZTBPeC3SAiJeUl/n8IC+JEAgM0QOdMosSgRp807kij9
         zcvFwhaxiFOEYXsrVU+P5Cu4/I1lr8ikqQtZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702914056; x=1703518856;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6fLVb/vulkuNQXxodn4pu2ol4A2t+yKrYSWudKFm7c=;
        b=No4bnYWvfEad1n8GOkB+DW3bd638OGEIUw6Llr4mJFYbqGfPik2Nh+6EswCM8GUalP
         8Qku/qJzhvA/y7lQDRYG3YsmHm9uBY/+PEcutTJzv73fm2IW2HobmOSB12305b2yHf+u
         8ShS1DlvVRKKOWIDnlRflrIMfsLwYttFIxWl2W9qQedWyrMCCxP8oz4xlDei9moBcfvH
         kSDP6jcLwXIFdsDmqTVv5lOP4YnzxFDOaoK0cvZwe6sCD5MBnSrji331MN9WIpymBTcW
         GJ67r5afm1gHjClbjLBZEunMYrcdICBrnZHTYaq6lH7h/CojEXnd0yb1u7+Enk1m32PH
         //oA==
X-Gm-Message-State: AOJu0YzwXIttxAL5OsmkJeHFFGBevQBR2ii9mzEDOFlxg9jbONc9wSbv
	YU6T6pDXT1es7+GTyWR1q1X1GA==
X-Google-Smtp-Source: AGHT+IF5AdRVsLm7L0S4j7YEnjOZCu3M8n9lk9JZ8ch07/ouI41VBWT0pu4RYmyM4wjQydWR4li5LA==
X-Received: by 2002:a2e:b602:0:b0:2cc:7472:80c6 with SMTP id r2-20020a2eb602000000b002cc747280c6mr694019ljn.35.1702914055749;
        Mon, 18 Dec 2023 07:40:55 -0800 (PST)
Message-ID: <9cc86706-5791-4967-802c-3e665bc97804@citrix.com>
Date: Mon, 18 Dec 2023 15:40:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Possible bug in Xen
Content-Language: en-GB
To: Joe Tretter <j.tretter@gmail.com>, xen-devel@lists.xenproject.org
References: <de8b87e2-a4a2-4e49-80f5-97c745f46500@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
In-Reply-To: <de8b87e2-a4a2-4e49-80f5-97c745f46500@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/12/2023 3:34 pm, Joe Tretter wrote:
> Hello,
>
> I discussed the below problem with the QubesOS team on Github
> (https://github.com/QubesOS/qubes-issues/issues/4493) and they suggest
> that this seems to be a problem with Xen, and suggested that I post it
> to this e-mail address.
>
> I have problems restoring backups in QubesOS release 4.1.2 on one of
> my machines.
> Other users reported the issue too, but no QubesOS developer seemed to
> be able to reproduce it, therefore nothing happened for a while and
> the assumption has been that it's some sort of hardware problem.
>
> I analyzed the problem down to the "scrypt" tool 
> (https://www.tarsnap.com/scrypt.html) falsely complaining that the
> password would be wrong.
> I proceeded and re-compiled the "scrypt" tool in it's latest version
> and found that the self-tests show intermittent erratic behavior.
>
> This issue only happens with QubesOS/Xen Kernel, if I boot into a
> kernel without Xen, the problem can't be observed.
> The problem can only be observed on one of my machines which is a Dell
> Inspiron 5675 with an AMD Ryzen 7 1700 Eight-Core Processor.
>
> I hope you can help with this issue.

So the issue is specific to your AMD Zen1 system, and only when Xen is
in the mix.

Can you try booting Xen with spec-ctrl=eager-fpu and see if that changes
the behaviour ?

~Andrew

