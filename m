Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD86968AD2
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788127.1197576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8vv-0000Vl-OC; Mon, 02 Sep 2024 15:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788127.1197576; Mon, 02 Sep 2024 15:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8vv-0000TP-LA; Mon, 02 Sep 2024 15:25:35 +0000
Received: by outflank-mailman (input) for mailman id 788127;
 Mon, 02 Sep 2024 15:25:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ekl=QA=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sl8vu-0000TJ-Az
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:25:34 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97d635e3-693f-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 17:25:32 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5334a8a1af7so4644736e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:25:32 -0700 (PDT)
Received: from [192.168.23.176] (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989021dedsm569800966b.80.2024.09.02.08.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 08:25:30 -0700 (PDT)
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
X-Inumbo-ID: 97d635e3-693f-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725290732; x=1725895532; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cVNxtY/StSSLRVXLeR6Miu6lypjwXbUPZeJzEc864nw=;
        b=g5mHeWemG5y9fmbtssmVDOEddLi35oDwG+XEnMUCFOWOP1+BcENI5nguw5qlHPNOCO
         uFL0NvFt7JpgBCRlDdhdYPT/ZBz10o3H8LvCFE4RW8pLJ85lNcKLjuZvJHKclspouRDB
         /1z3Hj1eh6Jc8N+uPRt4r8uRqUDDu/4wgdfyFiqWu/hAkjsaEiJho68nfTgMvBI2tGwB
         81GrCzP5Wj6f2jVqr5F42OeC4fPbbpUj/fmuV5Evk+NUgOeqGWkL/IkKNTjKGxm0KGL3
         /h2flKfq8qD2afvvRTA0HLyYQI0ulyi8hO0njumAiPV6su6rtS70hsgTdQN9hOuz5Upl
         aujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725290732; x=1725895532;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVNxtY/StSSLRVXLeR6Miu6lypjwXbUPZeJzEc864nw=;
        b=QyYdojUaUuva6VSFNQOFZ5vQw7jxzRdoyGFQrBV1U8OYaJwl6wHYJCTOWusOZ0hod/
         84w6FAwXZPOFdFR/PAACCnlu4yEZnzdD88DgVl/KVBnLGRTdXQKGYKqEh0vzgz7DQA6O
         XT3K3sZvjuEPHt3ISizjHrDfcQ+rFN8eErBzbPiVlKCC9+dEnbZI3rQg98JlKRlIsSIl
         WFxjVbrYaLKXWwDloFXS4Pxz9vyKqgmd6inoYyqQk2Hx+CRX539A+Y5h7Fi7EO2OubVD
         lpYnBlx87MIfiDObIxSwdpRRWgP9phjzkdaeO/MtAFptKWpvndAq52r0lsVzRlqi7BE4
         0wPA==
X-Forwarded-Encrypted: i=1; AJvYcCU7McfoX+t/o0JHc6ZI8zpPig05vVhQT8pqzuyhdWmcZi7oBTVKaf71Y2gPMOwveRm03Rolwcq6oGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwchETLr6dWxhIvRP/trQVfiQ/FZWC6ZqRL4+mRXS+GHsIMX53R
	RuS6EoxWQIsDfMNdlaki1CC5ge7tK2J6rtGanLCKBOwSFkjyIkya
X-Google-Smtp-Source: AGHT+IHaR+V0JJXtElScx/5YzXFOV61Iu0S7jphlYGOZzFhxI+fLofD4RoCGHwJH0zFKs66kallEiQ==
X-Received: by 2002:a05:6512:3d8e:b0:52c:fd46:bf07 with SMTP id 2adb3069b0e04-53546ba6762mr7485974e87.49.1725290730935;
        Mon, 02 Sep 2024 08:25:30 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <570feee3-0a81-4a61-ad1a-8e560b39af30@xen.org>
Date: Mon, 2 Sep 2024 16:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: Block protocol incompatibilities with 4K logical sector size
 disks
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org, Owen Smith <owen.smith@cloud.com>,
 Mark Syms <mark.syms@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
References: <ZtBUnzH4sIrFAo0f@macbook.local> <ZtB0fMRCGajdcfap@l14>
 <ZtCW9Qq9k8UQ-jJC@macbook.local> <ZtHus/ytlA1UnHEI@l14>
 <ZtV9hteu_sVyvnih@macbook.local>
 <13d84592-64c5-4e34-93be-3f8ecb7afb15@xen.org>
 <ZtXYeaKp-ug8oFjX@macbook.local>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <ZtXYeaKp-ug8oFjX@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/09/2024 16:23, Roger Pau Monné wrote:
> On Mon, Sep 02, 2024 at 03:19:56PM +0100, Paul Durrant wrote:
>> On 02/09/2024 09:55, Roger Pau Monné wrote:
>> [snip]
>>>
>>> Thanks for your input.  I would also like to hear from the blktap and
>>> Windows PV drivers maintainers, as the change that I'm proposing here
>>> will require changes to their implementations.
>>>
>>
>> So IIUC you are proposing to refuse to connect to a frontend that sets
>> feature-large-sector-size if sector-size != 512? Is that right?
> 
> Is is worth retrofitting this into existing backends?  My suggestion
> would be to make `feature-large-sector-size` not mandatory to expose a
> sector-size != 512, but I wouldn't go as far as refusing to connect to
> frontends that expose the feature.  I have no idea which frontends
> might expose `feature-large-sector-size` but still be compatible with
> Linux blkback regarding sector-size != 512 (I know the Windows one
> isn't).
> 
> I think we have reached consensus with Anthony on the approach, so it
> might be best if I just draft a proposal change to blkif.h because
> that's less ambiguous than attempting to describe it here.
> 

Yes, I think that would be best at this point.


