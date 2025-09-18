Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBD2B855CC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 16:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126253.1467886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzFzB-0003wm-Lj; Thu, 18 Sep 2025 14:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126253.1467886; Thu, 18 Sep 2025 14:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzFzB-0003td-IZ; Thu, 18 Sep 2025 14:51:49 +0000
Received: by outflank-mailman (input) for mailman id 1126253;
 Thu, 18 Sep 2025 14:51:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzFz9-0003tX-Fw
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 14:51:47 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb64a760-949e-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 16:51:39 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45f2fa8a1adso17613235e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Sep 2025 07:51:39 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32ed273e52fsm5762885a91.17.2025.09.18.07.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Sep 2025 07:51:38 -0700 (PDT)
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
X-Inumbo-ID: fb64a760-949e-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758207098; x=1758811898; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mkcFqcbtJTni0cLHegPKcXUH5nYMRFNY3ph4Pi0oGfo=;
        b=elMA3NvwFLROb4sa1z7d2YQtd4zbfmqRkC2GcQ4jl5CX1LQtfAPB5CJG3wK7TF1Iu/
         gLqvGrdLizhecocdW9voy7jLSt0PzflHSOUfXozNQy5dNIZOs0oJw5FY3JyrQdCYB5jW
         tNAAq6qNXZ8g6W7QofqkOsLNSkUTQUALM4G+oF5C+i4SV+rOZre0FRaNUY9eEpO4fD2H
         8wYmPP2/V5nMUJITH9Q2hQm0oRULpzKLK++tbw2HxcbFvMVAXoqQZjjDz//Z2j3KoY+8
         rmN+oZbuSRUkExOd5PyRR3UchD/eRtd+USjJkxPOhc16srv12oPXHXUfd/mooUrULGiX
         e20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758207098; x=1758811898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mkcFqcbtJTni0cLHegPKcXUH5nYMRFNY3ph4Pi0oGfo=;
        b=Q+iP3b74mr7SPtUKINreaa5nMQ19CaDX+Fi5iNss7Xvcv0h5eo+S1kKEj4jbig4oSI
         keURwmAVTaUmL9W+NckXluJavGFA0lrcpC96uynw7rQfxymZy1E5iIqgh/Z80CA/E8W/
         Efyf1AZdVk4n4QNJrwm1oXNtJiivaqQTn4dOXoEX42ckd0ZzK8hIKvujSoqZvIKtCSC9
         4RQoDjVOEgTxETflu2mX2vBadwV4WQezCn0nVhfnPqUUcv8/AzzgerfjvD0SOajVAsSN
         +8YPfpdKZ6IXRRUl5wAZgNv00pKoEm2NP/SbLYProUfTpkToHA8POvzXv519WdMJxa2b
         cX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsfqIiCWkUKqEb6NxVTLanAP5X18IQrP5zWBChzRbi5m5pdNmeX57pCnF0Rq39zI0HatphfBzqlWs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWNKQ32LmtesaQpaU8lJmm6yiCmrp2LngYEPOXPxZio08m55Bg
	O3BkVSLMlh/wgLcmNCHDw2llM4dlDlL//a7m0yt8zhTksbtCkzjEZLsMCeOH4OLPpw==
X-Gm-Gg: ASbGncvZkhr+vfpdtp7H4OR7ceViTxEB0Socbz0EKigE/vYJsf7CdA6jVDnCAPjohm3
	eSR0zCyo8MKj/gdIRvXc3zlJcIpxhkbLYoZputcrpRvFVCywLbaT4XDrLn/bdnczxYiDHmRmFFX
	NG6zZ5TKaD4fHN4Mo/3yNgyfbTCFLJYsqrwxvHwDc+4H+bSnNNQ5fSLJ+5kWa3edQ1DE3wtRaOL
	JGL6FjyIuEttoMJbfL+QJk082pGBqFc1q54xIKta39qWdU7WSB83SUzl5EvVDLbtyVcwF+GrrnY
	tSOjPPi0aOu7gZQkDP2BeJ8gjV4U0mxTywvZoPYvtUWB4i+xbR/+ZfCFNX0NpHX6wJ/pBPgBiR2
	EcgKdqxTNnEzxO5K3KEe34zrMvl1PG1CphN1EYEVWQ6EsSCU8MQ==
X-Google-Smtp-Source: AGHT+IF44L+QL593VS46mAuvrrAGaHXr6WomPwjNmRAa4fx/mFLPjh5UBbnjAblU16z8YH6lSCKaXA==
X-Received: by 2002:a05:6000:220d:b0:3ec:11a2:17f0 with SMTP id ffacd0b85a97d-3edd43ace8fmr3697970f8f.5.1758207098536;
        Thu, 18 Sep 2025 07:51:38 -0700 (PDT)
Message-ID: <c05674a4-2090-4453-98a8-8f4cc0f54c5c@suse.com>
Date: Thu, 18 Sep 2025 16:51:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] arm/sysctl: Implement cpu hotplug ops
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
 <34c9b488ad949cbcd93bd8578dd5bc180fab8738.1758197507.git.mykyta_poturai@epam.com>
 <ddce2b69-3ba3-4c04-ab82-092ce2c98cf3@xen.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ddce2b69-3ba3-4c04-ab82-092ce2c98cf3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.09.2025 15:35, Julien Grall wrote:
> On 18/09/2025 13:16, Mykyta Poturai wrote:
>> +static long cpu_hotplug_sysctl(struct xen_sysctl_cpu_hotplug *hotplug)
>> +{
>> +    bool up;
>> +
>> +    switch (hotplug->op) {
>> +        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
>> +            if ( hotplug->cpu == 0 )
> 
> I can't find a similar check on x86. Do you have any pointer?

When CPU 0 cannot be brought down (see cpu_down()), tryin to bring it up
is kind of pointless, and hence can perhaps be short circuited like this?

Jan

