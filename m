Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F48F9689C7
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 16:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788013.1197466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7uU-0006eo-TY; Mon, 02 Sep 2024 14:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788013.1197466; Mon, 02 Sep 2024 14:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7uU-0006bk-PI; Mon, 02 Sep 2024 14:20:02 +0000
Received: by outflank-mailman (input) for mailman id 788013;
 Mon, 02 Sep 2024 14:20:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ekl=QA=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sl7uT-0006L5-Mv
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 14:20:01 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70790128-6936-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 16:20:00 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a867a564911so518982466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 07:20:00 -0700 (PDT)
Received: from [192.168.23.176] (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891a3e5dsm563276466b.111.2024.09.02.07.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 07:19:59 -0700 (PDT)
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
X-Inumbo-ID: 70790128-6936-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725286800; x=1725891600; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K9FybQD1nNcl2uXYb9XlnSggqTyaGWgFlPnIa0kN+1s=;
        b=dX70Lrqag9DJ/JCXF12xjkfkOeNofTpHbhDf6BYtg1vGpMaIWjKf5bF/6eM3VJ7IkQ
         Vhfr4ya4QwufCDEO7YRPMUAtgpVXm3GFMe+qPIvk8xRTy2K0GIv0VSYpbJyrN7wiQPMJ
         kmf27bS/CQAUFBwCa6qHDo8nhEriO5BD1dNcxNGpJJinMW6RtZ2whnbmCiMIj7C4gNN5
         afDqqQICA4RxcQAl/0qVqLnP/IYbY/FPYT2K5eIHrxkQ9yt2/yzruU6gmKuOuRJWNocH
         BnpAJAG5dG5F0q0iRPFRKtSu2TSPgpsIP6Vxsw0Z0U0SWIGmnk54Ub7jFofJ3BD6Aypc
         Nqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725286800; x=1725891600;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9FybQD1nNcl2uXYb9XlnSggqTyaGWgFlPnIa0kN+1s=;
        b=gUaqKOzSTEjilaWMx6WJX7oHTFFbQGB8dxeqsv3RlNwIauF2FJiKjywtoSGbvKlyGk
         HoM08cKg2qZS+fiZ1RAVJk0Fl0Ep15ibkMqjoH2vVuqJbBjdB1WYOn+MBv4NU8OFrd/9
         svwbGdncAogGZKriiOeeMBji/K377/Ho8HUgXOHj25V90WelQcOvBshL+Ti8oaYiMujd
         aAzS2cJEB3OB47cRs8h2wc5ggRQ2BH8VL2XEt54eOKMLf+UK0kivUQFFjcblbUEZti57
         O6Say3AXZxl9GVmjhJ4ebRPc5JyXvY6gdCDf28hPEzp3YfXmw3yMUVMbA3pSfNbSbmMu
         GpUA==
X-Gm-Message-State: AOJu0YzaX4NaWIICanMT1n8CCtRsl2bRfL+1YL1nQtsxiQDRWv/fbMce
	pQ4EjRb4hYyuoSqO7o9X7x7oswG4zydmDHXg4S1RIPA6XRBaRwI/
X-Google-Smtp-Source: AGHT+IGnCSk9QWSHsHdHuCTtifPgn/WpM2M3W5UB9Bk9zDuI7XjOfsNr3uTMAdK/y84ABcDjdgKZzg==
X-Received: by 2002:a17:906:fe44:b0:a86:96d1:d1b with SMTP id a640c23a62f3a-a89b94b40fcmr596486766b.16.1725286799677;
        Mon, 02 Sep 2024 07:19:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <13d84592-64c5-4e34-93be-3f8ecb7afb15@xen.org>
Date: Mon, 2 Sep 2024 15:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: Block protocol incompatibilities with 4K logical sector size
 disks
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Owen Smith <owen.smith@cloud.com>,
 Mark Syms <mark.syms@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
References: <ZtBUnzH4sIrFAo0f@macbook.local> <ZtB0fMRCGajdcfap@l14>
 <ZtCW9Qq9k8UQ-jJC@macbook.local> <ZtHus/ytlA1UnHEI@l14>
 <ZtV9hteu_sVyvnih@macbook.local>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <ZtV9hteu_sVyvnih@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/09/2024 09:55, Roger Pau Monné wrote:
[snip]
> 
> Thanks for your input.  I would also like to hear from the blktap and
> Windows PV drivers maintainers, as the change that I'm proposing here
> will require changes to their implementations.
> 

So IIUC you are proposing to refuse to connect to a frontend that sets 
feature-large-sector-size if sector-size != 512? Is that right?

   Paul


