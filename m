Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFE0544AD7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 13:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345126.570769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGbl-0001RY-Ve; Thu, 09 Jun 2022 11:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345126.570769; Thu, 09 Jun 2022 11:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGbl-0001Pl-St; Thu, 09 Jun 2022 11:45:49 +0000
Received: by outflank-mailman (input) for mailman id 345126;
 Thu, 09 Jun 2022 11:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdCg=WQ=gmail.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1nzGbk-0001PM-Gh
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 11:45:48 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3535908-e7e9-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 13:45:47 +0200 (CEST)
Received: by mail-pj1-x102a.google.com with SMTP id e24so21178586pjt.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jun 2022 04:45:47 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 k14-20020aa792ce000000b0050dc76281b5sm17501351pfa.143.2022.06.09.04.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 04:45:45 -0700 (PDT)
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
X-Inumbo-ID: b3535908-e7e9-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1uWRq0qALlsYTQq3er3sD+PXamQFroMLzNzNZ5Baq/E=;
        b=nDYk9F2UkksG7vJXwzdocA1HGXnEFw3FhR+DLGD+lBRr8jWzyttCTlkhOU/M6RtFod
         AtQ7el+DjbiVebfgHf/rkjH+pSUcLBsGXJbLqR5fvzb6ML5W8QC8nA8Dhwbw3uL8SVke
         0hfFTKNtxfZzeospUYTn17XH33tx0FFHrA5ebXazRYhs3mf3nmMvLTiKJzzX+14wpB7o
         dzHgB+4+x2f++5WPxFhGhZeb/glqK+FJlGPWxTpDqsGqHmpyMs4MU+9VJsEvl+MzIpF2
         FgEvPSDwZDYe2ztAARR1NlDLaCM7lo8UtkbRcij8JLSD0Yd96Ngkkn2rQe4ESwX1S5jq
         /VYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1uWRq0qALlsYTQq3er3sD+PXamQFroMLzNzNZ5Baq/E=;
        b=TfIaL/KPXOCUjEBCXaR04xOCdguzoHSc25a6BK2Ok6qV8Lzuk1ivT/W1lpG63VJsSe
         uqdhtCH7Ht9/CD7bvBCYvj9G82O+9Jgw8zHVD6m2uO9z5kurgBR4y3hDcFDAK63Tfnq/
         7GuQg43HcPzakmtPC8Rc4hD+E3RG4L0Dl18cchSlNcYBEpJ9xa6de20aaC9ssuc0phK0
         XqkxBVV46SU620mWDJ8gwSU4B9dAIH+yKWJoGZ6VAUCDBu2yRIdqRZnIvuzu7psq05w2
         IuSVHPoE2uc4r+PRLvF4Ko41G+evYtajItytCraPHDW8TWjj23DBJsLzgrn6d1KEFG5Q
         KTgQ==
X-Gm-Message-State: AOAM532N/GoIsPGNPyS/xkic/gSoa8+6uOEmARalUBH+kxRtlpl5gV1R
	kOtxv7qC+0CWEctPG6KXb0U=
X-Google-Smtp-Source: ABdhPJy6NBGODlL2qFbVm78WCpoq/0vnl33flGVIgU6549lot3LxsKE9L21JFV8c0odlHFpFhjRTgw==
X-Received: by 2002:a17:90a:e7c5:b0:1e3:3cf1:6325 with SMTP id kb5-20020a17090ae7c500b001e33cf16325mr3066860pjb.178.1654775145812;
        Thu, 09 Jun 2022 04:45:45 -0700 (PDT)
Message-ID: <19ae71a4-c988-3c9e-20d6-614098376524@gmail.com>
Date: Thu, 9 Jun 2022 20:45:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/3] ui: Deliver refresh rate via QemuUIInfo
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
 <20220226115516.59830-3-akihiko.odaki@gmail.com>
 <20220609102805.qz2xrnd6ms6cigir@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220609102805.qz2xrnd6ms6cigir@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/06/09 19:28, Gerd Hoffmann wrote:
>> --- a/include/ui/console.h
>> +++ b/include/ui/console.h
>> @@ -139,6 +139,7 @@ typedef struct QemuUIInfo {
>>       int       yoff;
>>       uint32_t  width;
>>       uint32_t  height;
>> +    uint32_t  refresh_rate;
>>   } QemuUIInfo;
>>   
>>   /* cursor data format is 32bit RGBA */
>> @@ -426,7 +427,6 @@ typedef struct GraphicHwOps {
>>       void (*gfx_update)(void *opaque);
>>       bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
>>       void (*text_update)(void *opaque, console_ch_t *text);
>> -    void (*update_interval)(void *opaque, uint64_t interval);
>>       void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
>>       void (*gl_block)(void *opaque, bool block);
>>   } GraphicHwOps;
> 
> So you are dropping update_interval, which isn't mentioned in the commit
> message at all.  Also this patch is rather big.  I'd suggest:
> 
> (1) add refresh_rate
> (2) update users one by one
> (3) finally drop update_interval when no user is left.
> 
> thanks,
>    Gerd
> 

I think 1 and 3 should have to be done once since refresh_rate and 
update_interval would interfere with each other otherwise. Does that 
make sense?

Regards,
Akihiko Odaki

