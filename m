Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134996AE6DC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 17:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507621.781372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaLl-0001Ws-Sh; Tue, 07 Mar 2023 16:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507621.781372; Tue, 07 Mar 2023 16:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaLl-0001Uu-Oz; Tue, 07 Mar 2023 16:39:41 +0000
Received: by outflank-mailman (input) for mailman id 507621;
 Tue, 07 Mar 2023 16:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZaLj-0001UX-N3
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 16:39:39 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a59c6db6-bd06-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 17:39:36 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso7584656wmp.4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 08:39:36 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b003dc4480df80sm19079797wmq.34.2023.03.07.08.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:39:35 -0800 (PST)
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
X-Inumbo-ID: a59c6db6-bd06-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678207176;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L//rXDlKqzEMIkgwZ3oxBiFvOxaRWL3SJBF76UN8nUI=;
        b=gjTI2LnHpSUTYtcVwjHTpPBNJmXLRQXCHoUgY6B17wxb8Y9Oq2K03Cxpw9nRMyIHjI
         r7kstc2Nu9xaP3+KFEqeJmB0VjY/wYRmf9XwsWaYWBQfz6rKRN1OdorZ9VPT79XcMfzr
         ME+bvaAQqxqhq+1ZbcNG7mhLGI0ETvLXcgBwuybwRsyd40hTq5OaeW7XhvSLnPcWw/uv
         s4evxWJCEbe0bwvHXsAFlYNAm+/L+SIoHGG8vzn5tbCLDVAZjF1Vrx1uNdGrZOklb+8z
         gqjH8IP4JsPxTTrZPihTOofvaA+IR6470YIzZTa/o6hO0kVCmW0AQ35l/Mr8s6y4Mn61
         NVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678207176;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L//rXDlKqzEMIkgwZ3oxBiFvOxaRWL3SJBF76UN8nUI=;
        b=mWhKSMTrqC5+F1rTQa3mQvlEmRzaSLYbJg+2LepoZfymMd6EAWtdFreF4BEG6kX9Ml
         o9tknZLlPGQwXCoNT9HSKhDNcjkA5bfKheXFgOwBFlSg2a1LadBIDTIu/nPhAE/Iyvdh
         bV+krpdFQV8H0FdtDSHpWGNrjy8RsZML400hzL29j5+MdY02BNu96qN4P2msqUaWshg1
         aZoGKi4fgFyDQdSnmR0Ym0rs1/PostiE7aDKljIkwcvUxECvejia90y1Owy9Tc6K0TzE
         Tub6cg6yeXa82n4g/ZIFEXjWoS6r8Uk8u54acPVJDwoF90GO1OTAJyBAAqQUdczJssBQ
         7ZaQ==
X-Gm-Message-State: AO0yUKWemzud9migdO5ZZQJiIFBU3LjqSbL/Oydk1DzrdBZ/4dawW1nV
	6FN0DThgDeyWcsNc5ftqh3M=
X-Google-Smtp-Source: AK7set8jBCCEPQWdi9BtsTQEIBjJwDZXJkCBMeQntK6DMuwwruJy0VyvZVk32HTTVhWJO5C0TGIDEA==
X-Received: by 2002:a05:600c:1c1f:b0:3eb:246d:7efd with SMTP id j31-20020a05600c1c1f00b003eb246d7efdmr12902808wms.2.1678207176053;
        Tue, 07 Mar 2023 08:39:36 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e1e4f027-25bc-2e1c-4451-b4d304493f16@xen.org>
Date: Tue, 7 Mar 2023 16:39:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 07/25] hw/xen: Implement core serialize/deserialize
 methods for xenstore_impl
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-8-dwmw2@infradead.org>
 <5f03307a80c33b62380128bf3f638d47eca74357.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <5f03307a80c33b62380128bf3f638d47eca74357.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/03/2023 16:33, David Woodhouse wrote:
> On Thu, 2023-03-02 at 15:34 +0000, David Woodhouse wrote:
>> From: David Woodhouse <dwmw@amazon.co.uk>
>>
>> In fact I think we want to only serialize the contents of the domain's
>> path in /local/domain/${domid} and leave the rest to be recreated? Will
>> defer to Paul for that.
>>
>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> 
> Paul, your Reviewed-by: on this one is conspicuous in its absence. I
> mentioned migration in the cover letter — this much is working fine,
> but it's the PV back ends that don't yet work.
> 
> I'd quite like to merge the basic serialization/deserialization of
> XenStore itself, with the unit tests.

The patch is basically ok, I just think the serialization should be 
limited to the guest nodes... filtering out those not owned by xen_domid 
would probably work for that.

> 
> Perhaps we can also set TYPE_XEN_DEVICE or TYPE_XEN_BLOCK_DEVICE to be
> unmigratable? Ideally I think we want TYPE_XEN_DEVICE to be
> unmigratable by default *unless* the specific device class (including
> net and other as we port them from XenLegacyDevice) says otherwise.
> 

Yes, that sounds like a good idea.

> Is there a way to do that?

Not something I've looked into. I'll go look now.

   Paul

