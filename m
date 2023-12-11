Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0797E80C42C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 10:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651537.1017234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcOP-0003iw-25; Mon, 11 Dec 2023 09:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651537.1017234; Mon, 11 Dec 2023 09:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcOO-0003hE-Vg; Mon, 11 Dec 2023 09:16:00 +0000
Received: by outflank-mailman (input) for mailman id 651537;
 Mon, 11 Dec 2023 09:15:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DOfJ=HW=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rCcOM-0003gv-Q0
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 09:15:58 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e50663a5-9805-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 10:15:58 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50bfd7be487so4720468e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 01:15:58 -0800 (PST)
Received: from [192.168.15.251] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 k3-20020adfe8c3000000b003334460e256sm8066228wrn.92.2023.12.11.01.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 01:15:56 -0800 (PST)
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
X-Inumbo-ID: e50663a5-9805-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702286157; x=1702890957; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ucSgeYlaSTptwTOrfqO4eZBdPvsqYJnEMgFfVhJwg+0=;
        b=kEbIsESom9uq9uaCbMfw+tmgsM8CArDAvmeUgdjeKtwGi/IpZF2sw1FptKecipI2bC
         dKt/zQa127Snl4S8GHDTbJoyeSxSeUBjySa7zXSs0WRfsR5zMyK2tDP/KF5w6V4Ldx6X
         zkVRhOdYUeXOaOck0IEZsw72eVMW+OhGj61c+L2CK92VzUNzSWD1Ecs05s4mo+EWd1eb
         G+3Lp7/aSa1/jdwm0IL82GUXhwaSi9Z2xE0+NH3hX9VcWnVmvw7KKUcH4jSq2pUHmAB+
         0Sx+lPooaJDTMnxZSrRpmzIolH4i90W2+s1Dz03Jbn5z+zGJzIsUfqJFLGB3j36STEEf
         rGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286157; x=1702890957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucSgeYlaSTptwTOrfqO4eZBdPvsqYJnEMgFfVhJwg+0=;
        b=L2JKV0udex5nklhKgLtt+29r/dehOoSaT+9iMrlbFJNZfBEfKH78P/hXxfaPbSbkbz
         a9lli6/wkSn9ow5UoUBvxGJeWxUe3rc80V8f5FTlTwRZpHtATtQaN8NxhDpTxqa4cnws
         TXQMGEYRioWKLL0txmjBWL32faufKzS/OApTZkws6KF7Wstg3Sk1Gp6NM7Ns33hn4BhH
         LTkQcvw10pXHfn06dXIP0BMn2pmP2Csx4jXYTQI+K9pPRFjzCO0/oNhNZJ093BedLOm7
         3HgEUgh9V9S8/9EMVOv4DrJ6M1eHRi5Z81ckyApzPjroM39MOSKediNNRTYfe6NWDCJh
         Yufg==
X-Gm-Message-State: AOJu0YyL40fwiJ2dx+IGdO8D1KwjUxzkNzgXxkWRbaNJEklYMLVGE3v8
	NW6SXxGatJCkbLqkbOfbmco=
X-Google-Smtp-Source: AGHT+IEVw3YNQrNEvYjlg8HXVQyO0FShPYGmP5m+MjLX8fscBtoeOEqFwREP/JNm/An0kjhECAcGuQ==
X-Received: by 2002:ac2:48b9:0:b0:50b:e40b:f8b2 with SMTP id u25-20020ac248b9000000b0050be40bf8b2mr1690917lfg.42.1702286157213;
        Mon, 11 Dec 2023 01:15:57 -0800 (PST)
Message-ID: <c981de39-1105-423a-8782-e17bd35cc2ab@gmail.com>
Date: Mon, 11 Dec 2023 09:15:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [XEN PATCH v3 2/3] x86/viridian: make build_assertions static
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Paul Durrant <paul@xen.org>, Wei Liu
 <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1702285639.git.nicola.vetrini@bugseng.com>
 <2bc69a77a0fae290902019822230dd863b1041b5.1702285639.git.nicola.vetrini@bugseng.com>
Content-Language: en-US
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <2bc69a77a0fae290902019822230dd863b1041b5.1702285639.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2023 09:14, Nicola Vetrini wrote:
> This is consistent with other instances of the same function
> and also resolves a violation of MISRA C:2012 Rule 8.4.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   xen/arch/x86/hvm/viridian/synic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Paul Durrant <paul@xen.org>


