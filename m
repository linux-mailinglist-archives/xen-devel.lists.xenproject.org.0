Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB1569F432
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499481.770634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUo2Y-0007mz-Lz; Wed, 22 Feb 2023 12:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499481.770634; Wed, 22 Feb 2023 12:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUo2Y-0007kA-IT; Wed, 22 Feb 2023 12:16:06 +0000
Received: by outflank-mailman (input) for mailman id 499481;
 Wed, 22 Feb 2023 12:16:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vuU=6S=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pUo2X-0007k4-0g
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:16:05 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc9b3a2-b2aa-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 13:16:03 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id j2so7341334wrh.9
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 04:16:03 -0800 (PST)
Received: from [10.95.97.18] (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b002c55521903bsm10289016wrq.51.2023.02.22.04.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 04:16:02 -0800 (PST)
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
X-Inumbo-ID: acc9b3a2-b2aa-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Op3GqQejLWil+XviHMTN9lShBYElpQ9YfeVLRqy5Tio=;
        b=E8+dEoQiJKdt7O9wrejlauPiWeebG59CqBpg66DBf5a5BJHtHGPwpGiVYcwJ4pQyPA
         +k1B2GW3fcN7fNIjnWyWFESXLpp5dBZ5wfDH6iQYAKMzoc6jTcb3OHshYG9aBCLRVm2b
         OkjaKJ7FnURjavzIsLBR7uZ41P6dwTp96XYYgWrws9fReXPAbdH/z2j6JF1ZODQKLvvQ
         R/De8q0F3yNBxrdD/Co9iSHxm1A+eGtfEe40sZ6+s1cD1kTBD/mC3VR2nbKwtka9ujl7
         9KaLhJusvxnUhONpJ0eWL8e7QS+yxcZYIr8CFlD9qSHvOOZ2tdtGYye4F1wp8ARHNTZK
         l2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Op3GqQejLWil+XviHMTN9lShBYElpQ9YfeVLRqy5Tio=;
        b=y4XNMLqjgDJejwXJnWZi3qGWMX3zDx6uqfcRmyG5AOwep9lRNwhrL7sAfLqWhjMbI7
         2uMXIJpsLXPnTOY0Jc3Y/BkBdAIUshGPR0J2I5m8Ey3vdkAwO40ZD+xHofXUQMZz+/iw
         HqKO+qZzejAlvUDTEhnZtaKc8hHgYMynav0dkrNptevAFhOJuazYnU0P0BR3I91027Yd
         7LVGU3mW877boeDGsBdkSxZI0NvwC2NXd8iuoGj8lRZH0Q1Uj2k8swIuTgy6jGfsijDQ
         nsvgNLFCHlOoHGumDfZX+l8qdUak3WEQ5nU3fXEsFU8eFXTLVXpjuNHELwWh+QxzjdUt
         Pejg==
X-Gm-Message-State: AO0yUKU+rJd2zBAYRpzlRb4EgUPrv/RwXYpjfZb+vBJrX88qFe1gxbas
	uFHqQsaZtCSjMpEm76WdMRI=
X-Google-Smtp-Source: AK7set+owGjg60Xwb1oOv12YJlBd5+0UfVLCpnwFbMldFB8lqUrN1PmHrgd2QqdzYmChKwauuMrB7w==
X-Received: by 2002:a5d:678a:0:b0:2c3:e142:5fd0 with SMTP id v10-20020a5d678a000000b002c3e1425fd0mr7944714wru.49.1677068162486;
        Wed, 22 Feb 2023 04:16:02 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <307f63c0-b3b5-d424-8a93-d76acc0934f5@xen.org>
Date: Wed, 22 Feb 2023 12:16:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: Ping: [PATCH 1/6] x86/Hyper-V: use standard C types in
 hyperv-tlfs.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
 <f62c157f-b4ed-6bb5-9862-992d8b881bff@suse.com>
 <2def744e-e074-db7f-cb8f-3ec2e6ed273a@suse.com>
Organization: Xen Project
In-Reply-To: <2def744e-e074-db7f-cb8f-3ec2e6ed273a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/02/2023 13:43, Jan Beulich wrote:
> On 09.02.2023 11:38, Jan Beulich wrote:
>> This is the only file left with a use of an __s<N> type coming from
>> Linux. Since the file has been using an apparently random mix of all
>> three classes of fixed-width types (__{s,u}<N>, {s,u}<N>, and
>> {,u}int<N>_t), consolidate this to use exclusively standard types.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Ping? (I'll wait a few more days, but I'm going to commit this eventually
> with just Andrew's ack if no maintainer one arrives.)
> 

No objection from me, but I assume the types were as they were because 
the header was imported.

   Paul


