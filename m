Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DB5976C2D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 16:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797571.1207564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokqk-0001yo-0U; Thu, 12 Sep 2024 14:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797571.1207564; Thu, 12 Sep 2024 14:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokqj-0001vd-TH; Thu, 12 Sep 2024 14:31:09 +0000
Received: by outflank-mailman (input) for mailman id 797571;
 Thu, 12 Sep 2024 14:31:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDyH=QK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sokqi-0001TY-QK
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 14:31:08 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a257ab76-7113-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 16:31:01 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso187533166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 07:31:01 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25833c90sm754155766b.25.2024.09.12.07.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 07:30:59 -0700 (PDT)
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
X-Inumbo-ID: a257ab76-7113-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726151461; x=1726756261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y6ORJYI6vwRvdRTUUuFr5WKOgFoUtpiLpqUVsmbX2Ds=;
        b=PRTDekuN3b+epvGo7w544obPpZyvZpNMYCsYRj/A6IDDnDc49n37H235d40WJm8yeF
         4b8RVhyFWn32MSKxtfUUZl+RcHxQUN/yTHUv0P7OTsz3LcRDcfXu4tDSZacaMjR7hfVh
         Ra7HLAZxu+GGAR70ZemjHcfDgGgaLONLM4+cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726151461; x=1726756261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6ORJYI6vwRvdRTUUuFr5WKOgFoUtpiLpqUVsmbX2Ds=;
        b=wnfz+vWDDWN/KhmHeQ0UdnaEqFMAZ1WKsOimscrLECq9Pxpr2plWQ6CWARjf3EdQjS
         KfzV63PtVymVjqsR1KzoU0N/M7gF8Sqh+PiLP57A1FyYuNLnkiCBRe6dKDLhmfeSIku3
         xZ6inVx578kXnR+40aUKOREBew2v004TC6KiccSIkk/srOe8XbHK8JbQkbqUkcHEQv+I
         slGtLNL+RTdwJAVdNykMVl5xDQnjdPmFWO12F8oCy529XfChAydX83Hs0qtE6GS+4IiW
         h4/6WPCcYznisEfH3u7s1IEmZHx5MwOqFPb9WM6AZIkpNaYb2UtbpR+g5KscWod4MwLa
         VO2A==
X-Forwarded-Encrypted: i=1; AJvYcCVq9mii/8vHov13/ivEzfjp74BuUC0lqjA2R9tIHA5UmH6cfrCwl6wfp9WkrWk1EOVlMiQ8GASu1E8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdV731suJJ3kG8Y7Swu3fLYITj+P83DeKDLdb6ksfiytIcwYwv
	iEPOBvOISzW/pvR8pylcsHdrI0DlU4FUcnS8VQRHQDTJDSaXjE9B0EuN7wmRNFk=
X-Google-Smtp-Source: AGHT+IGRtLyqbtK7ifc3MeFwSOPmNYFLf+/4xOBZFeBEcrYqF/HrK561WAAXjLGKjmtABJRQzrT21A==
X-Received: by 2002:a17:907:9815:b0:a8d:4c83:d85d with SMTP id a640c23a62f3a-a8ffab6cbf2mr933064966b.12.1726151460347;
        Thu, 12 Sep 2024 07:31:00 -0700 (PDT)
Message-ID: <08dc7d7b-3169-4a47-bf72-d25fdfba9a09@citrix.com>
Date: Thu, 12 Sep 2024 15:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/keyhandler: Move key_table[] into __ro_after_init
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240912125154.1708025-1-andrew.cooper3@citrix.com>
 <886dc591-e680-420a-a07f-ffd288ec413c@suse.com>
 <d496cb2a-5485-41ad-8c9f-d77ed680890b@citrix.com>
 <ef867f55-eaf5-4656-8915-aef0c2a25233@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ef867f55-eaf5-4656-8915-aef0c2a25233@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 3:23 pm, Jan Beulich wrote:
> On 12.09.2024 16:22, Andrew Cooper wrote:
>> On 12/09/2024 3:20 pm, Jan Beulich wrote:
>>> On 12.09.2024 14:51, Andrew Cooper wrote:
>>>> @@ -596,6 +594,8 @@ int __init iommu_setup(void)
>>>>      }
>>>>      else
>>>>      {
>>>> +        register_keyhandler('o', &iommu_dump_page_tables, "dump iommu page tables", 0);
>>>> +
>>>>          if ( iommu_quarantine_init() )
>>>>              panic("Could not set up quarantine\n");
>>> It's a little odd to have this immediately ahead of something that can
>>> panic(), but not a big deal of course. The line wants wrapping though,
>>> to stay within 80 cols.
>> I'm happy to put it somewhere else if you can suggest somewhere better.
> Just at the bottom of this very else block?

Done.

~Andrew

