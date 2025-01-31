Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EE1A23939
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 06:11:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879832.1290038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdjIe-0006aP-9F; Fri, 31 Jan 2025 05:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879832.1290038; Fri, 31 Jan 2025 05:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdjIe-0006YF-4F; Fri, 31 Jan 2025 05:10:40 +0000
Received: by outflank-mailman (input) for mailman id 879832;
 Fri, 31 Jan 2025 05:10:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KoDZ=UX=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1tdjIc-0006Y6-M6
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 05:10:39 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2bbedae-df91-11ef-a0e6-8be0dac302b0;
 Fri, 31 Jan 2025 06:10:34 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-216634dd574so18537165ad.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 21:10:34 -0800 (PST)
Received: from [157.82.205.237] ([157.82.205.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72fe6a1ab2fsm2394763b3a.170.2025.01.30.21.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 21:10:32 -0800 (PST)
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
X-Inumbo-ID: b2bbedae-df91-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738300233; x=1738905033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AEuIBL2MpqAbCSETjlQmOC2W7ELmv7LgDjDwZVJiAM=;
        b=GHyJ84wrd1iLkmILIeTuYXsw9btkrBjhtTbGIyNwAoQ3ggin0wDesWI55rv63dsEWE
         dPbxjeGQQu4ZSyd6G8/cGQNe1/T/0kE7Gaoky8cm7jn/qd9ymP71Wgv/M8uHkhboSSXO
         2OyJzv6oc3AB371/LxDbgOBUTiUMwt0f4u15OaWbEJWUMiiPz1w0AXMSgAujZc6At5A9
         bJATmNwyOEJ8wFoDwOLZdbYRKCg5TVkeCwTCXTTohaej/V8zNDR/9CPvYCOGgfynsRY9
         YpBtKzO3/Imkfzt3Aiz5G2E5yw/ESwBIYqF1jcBJlwWu4O+Gm8P1Y4kK+QPT/kXM87la
         GZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738300233; x=1738905033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AEuIBL2MpqAbCSETjlQmOC2W7ELmv7LgDjDwZVJiAM=;
        b=wmEgTX8S9tSdHZOG9QNOeDhs5JKww2skUmtMcOw503tFB1qS2T5jXJP1cYfaRLCus4
         3DgST067+AFzCbxymjmf2cRj2On56z0LKvJWGvV15dfUeEg71JIucwUHD9wsdT6Uan/u
         9dX7S+nYvCAde2NrSvLMAYWgT8hJVKnsyzntCYLzrfcheDsxuDnEeOxSBGYuIyBMCmO8
         M49cNqaS/ucykr32VB4/p54eGmTSdlni5JoW8eTGW/PbEa9g2+3UgYOFVDAoH1QfBkII
         51pY6cQKytG+CDwUtE1hoq1v7+9y0LfHVoRldkseb5p5R3JdIOzwuvhpm4KUGCW5FNa1
         NDOg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ9DoEy6PXkMYRqpW06YfzKYTB8v8RurUUrRCnpzV67xa2VSHjvibmTOEcPWJTtujMJ84pOPCnlp4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTsk1bWwSG9KHw0mx6c4rFp6yLlj2kEvZyp/IsXPIWhDtNXcYG
	VbOmeloFr+mAbPfWNLohOR7iKxffSBlfZEN3rRwh21UlJ+EWdhXyOtW+DoYN8hQ=
X-Gm-Gg: ASbGnct5azNQQynWhorY6X4f7Zft3+zKrsucks3r3o489CmjYOvsB2iXU1haUNUrlk9
	uzQHmw6/1fg4vv8hfh5uEvyM/Ad7gFwd1krtQ7XbVRUdOQrCJPvSmzdFET4Mc5OSrOy2Wx394gs
	m/8aqQqvs/6GUxn4kRu/DRM53U5KJOhT+XXDaN9Xk2C0sRu8DmIirnOsHQ8GDD48IIIywPYWSMW
	W1fQ8iXOry4napSj9ftOiTA1uSXXu3h31qm2K7j8QIC2cOxHku4Z7/q2XZKTQ9Hno69rWFCydgK
	8OapgPbywT02ELUVHs8SdV51tkUQ
X-Google-Smtp-Source: AGHT+IEERU4Y46yPMbU8raM379YD/b5udqcqVEsnknx9lXHDT/ie/0QIeIU/54YQkQtrxoQmIg9iVw==
X-Received: by 2002:a05:6a21:458a:b0:1e6:8f10:8ba2 with SMTP id adf61e73a8af0-1ed7a462f12mr15978249637.9.1738300232735;
        Thu, 30 Jan 2025 21:10:32 -0800 (PST)
Message-ID: <bc74db8a-2970-47ab-b0ba-ede783299abc@daynix.com>
Date: Fri, 31 Jan 2025 14:10:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] tests/qtest: Make qtest_has_accel() generic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Phil Dennis-Jordan <phil@philjordan.eu>,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>
References: <20250130103728.536-1-philmd@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250130103728.536-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/01/30 19:37, Philippe Mathieu-Daudé wrote:
> (Series fully reviewed)
> 
> Since v1:
> - Use g_strconcat (Akihiko)
> 
> In preparation of running QTests using HVF on Darwin,
> make qtest_has_accel() generic.
> 
> Note, this also allow running other accelerators such
> Xen, WHPX, ...
> 
> Philippe Mathieu-Daudé (2):
>    tests/qtest: Extract qtest_qom_has_concrete_type() helper
>    tests/qtest: Make qtest_has_accel() generic
> 
>   tests/qtest/libqtest.c | 110 +++++++++++++++++++++++------------------
>   1 file changed, 61 insertions(+), 49 deletions(-)
> 

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

