Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD558FFDC0
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 10:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736370.1142430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUXd-0006tO-2v; Fri, 07 Jun 2024 08:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736370.1142430; Fri, 07 Jun 2024 08:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUXd-0006rR-0O; Fri, 07 Jun 2024 08:01:41 +0000
Received: by outflank-mailman (input) for mailman id 736370;
 Fri, 07 Jun 2024 08:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sFUXb-0006ps-5z
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 08:01:39 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ab0743c-24a4-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 10:01:38 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52bc1acb9f0so76386e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 01:01:38 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158148f43sm78902655e9.33.2024.06.07.01.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 01:01:34 -0700 (PDT)
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
X-Inumbo-ID: 2ab0743c-24a4-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717747298; x=1718352098; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9/xRDRaw9IjmuC5zhzgHBuN7KyG4TeGScPgoRhTfSY=;
        b=Z0NAfRp/3Me4aI29oiQWR4w8Th+12nww6Hl3O7x6Wi/+y0ho2zJ+nKFQicWO3Xv/QG
         0Cld0LuyqTAOn4QKduI+exDLJ7SFHMidzj5TT1cAbKxTFm3CZLeGeNNhD4RgvlUyQjxh
         iZtXXyn8/ZUoOSytl8YTDNnEx28E518tYeEcBUMe1yQqHS9kyg5FpcTliNWRhKK2E66/
         Zvh4bCYCv6CDvBLVuxSC5m66ACOlIFnGj1ApPx2rMDY0XitCBudCyrYaIyZGwJKL9tLj
         G1bzGj2kPBsxKTZ6WybVrML0LpVfBPsduMVzhotrsHTfXq5m0n/fzPQhz1U57O8Wkg2p
         tnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717747298; x=1718352098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9/xRDRaw9IjmuC5zhzgHBuN7KyG4TeGScPgoRhTfSY=;
        b=X2uOCZmnSGVDH7WLkdBXdCviu4Bj5irSD7AIOFXg4NrBPOOema/pwAzARRWeBL7kFz
         kWJQPzmovCiYdgGd9AYl+hRKou5/+jI7/IR75yIU6L5o4lypfUwFxnj7GsFojPLgoHEh
         SNl5tY9VxP1EjKBNSkAD/rBqHlwpfAJhyOvszl2YAWxfpXgXRf4cql38JVCCDcAsmZhg
         dHQpEOfM64EtqjDFwsoZOws6WWgWApYErCZrPGs4E3zT8uDjz1sE1zZsR4AO6fXhL9u7
         H51fGtAd6m4cOyF3F0M0FIH46odkSE1sYV/JJLMkvmD3aTwalTynKmehnwnDEY85jfpW
         7U2A==
X-Forwarded-Encrypted: i=1; AJvYcCVRXgVNZgLjIcOu7YQMch41rs1spa609n7l0A3XgA6LcYYibiDb+w+ugYF9+v8ay0O4QACZmZkpU6Wdsq61QfHftlsRJFL5Z+nu7MNXWdw=
X-Gm-Message-State: AOJu0YxGdpsEUSjtpAOUUKUyMIv9qaKsEsGUIpU02/77qd0qM/Hq5ddO
	EagwOJrrY1HkPMHvWq49c0jkxqEov1WcLpEsnRBz9kPXVg6LT0iU51qC+YyVoQ==
X-Google-Smtp-Source: AGHT+IFusoyKcbwkYeZXcbfH63P1qHPHw5S2y9bGslUCuxZhDp1UdiZpeuGoprFOe8h1mfqQYrT9yg==
X-Received: by 2002:a05:6512:3e07:b0:52b:8435:8f22 with SMTP id 2adb3069b0e04-52bb9f84ca9mr1370194e87.36.1717747295044;
        Fri, 07 Jun 2024 01:01:35 -0700 (PDT)
Message-ID: <9255e072-f86a-4c82-90dc-9c41d11326fc@suse.com>
Date: Fri, 7 Jun 2024 10:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 07/16] x86/hvm: guard AMD-V and Intel VT-x
 hvm_function_table initializers
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <25d4ade03f22ae4eb260af3eae5f48528f2e3ca8.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <25d4ade03f22ae4eb260af3eae5f48528f2e3ca8.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:20, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Since start_svm() is AMD-V specific while start_vmx() is Intel VT-x specific,
> any of them can potentially be excluded from build completely with CONFIG_SVM
> or CONFIG_VMX options respectively, hence we have to explicitly check if
> they're available and use specific macros using_{svm,vmx} for that.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
yet again I think this could sensibly be folded with the earlier
two patches.

Jan


