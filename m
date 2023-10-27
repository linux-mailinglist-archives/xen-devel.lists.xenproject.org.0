Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5661B7D8FA4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 09:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624242.972637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHAb-0004QI-Bl; Fri, 27 Oct 2023 07:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624242.972637; Fri, 27 Oct 2023 07:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHAb-0004Nu-8p; Fri, 27 Oct 2023 07:22:13 +0000
Received: by outflank-mailman (input) for mailman id 624242;
 Fri, 27 Oct 2023 07:22:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwHAa-0004No-Bi
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 07:22:12 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b67cc28-7499-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 09:22:11 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso9952235e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 00:22:11 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adfef90000000b0032326908972sm1126352wro.17.2023.10.27.00.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 00:22:10 -0700 (PDT)
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
X-Inumbo-ID: 8b67cc28-7499-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698391331; x=1698996131; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PqXLD4gsUSCQcm/bEiQQT7bGyjP9upwq2OK6iOIPglM=;
        b=jUvuep/+eoSBKNxJyiiMZQpVets36ymjV6IwdOLXvTg7B/jgN42qN1fytjqzkEwwrU
         zTy9qJP61eSXS/spj4lAVZwxy4GmomMCE0ArGMN/FfyZLonyJBUYreVjAzjIUkcRmGC9
         abtCHYqbYPhwMPNbDj8Rw/hAm4Cg1ksqzpMQN8SdnFo4mOAPgi+Her9gdeezUefgiGHt
         O0LeblucWyuH/NJ3FtzePzh2whCgBjuEoEovm5kkc9QSuYaHVX0A3riRNGhiaXgWRVoa
         J0Qa/nuc+dv0JimRwxXEcX4+sJDrNYEWYKN0cvgoWpFJmD3zu5kUWfHkZggJZUXOph+4
         wp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698391331; x=1698996131;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqXLD4gsUSCQcm/bEiQQT7bGyjP9upwq2OK6iOIPglM=;
        b=paYebEZe47qUAsTmkybqOLIZcP7fS8iOPEplVRLka61ZHIpRjChuInP+tPAOFZ0NnY
         Qn2WJD0UwHAOQCmDLp1b36WVoQwOAY2xD3u7QBHci1BJ2wuH9laYlbRdUK6R9uv6G84W
         oicSQf8bmlfmf1SHgjS9DgWHWS5H/klVgPvjbsoUU5VZSI8i61JLP1FopXPrT51zt6qo
         HjsU502c3U0exauTfwsxgYf2Az4oGD3ZSo/sZqwh/ZHoiuh/MAmciVq4mlhmdKDiGClM
         hFiuNOik0bH6pW69LGM1de1H433BbjMTHIJnO2ddBNkBCRUTvV+Kg7k0j5a/MlRzEH3A
         kLlw==
X-Gm-Message-State: AOJu0Yz+k0xWG2g8Dsy/td2ykjQP5dUdAuVkMuSM7SON52hrDKpHLIem
	Fd0HB3fT75SQnbar3+LVACU=
X-Google-Smtp-Source: AGHT+IGU6tTMgK6RwsBlq8F1RDINHIo2QB0XP1KOkIfo88Tr96dL8LD0Q31Rr4FqnFe7pGXkQLUMWQ==
X-Received: by 2002:a05:600c:2d8c:b0:408:33ba:569a with SMTP id i12-20020a05600c2d8c00b0040833ba569amr6011223wmg.8.1698391330510;
        Fri, 27 Oct 2023 00:22:10 -0700 (PDT)
Message-ID: <ae99776d-bf6a-4b24-b617-fde8c76d087d@gmail.com>
Date: Fri, 27 Oct 2023 08:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 07/28] hw/xen: use correct default protocol for
 xen-block on x86
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-8-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-8-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Even on x86_64 the default protocol is the x86-32 one if the guest doesn't
> specifically ask for x86-64.
> 
> Fixes: b6af8926fb85 ("xen: add implementations of xen-block connect and disconnect functions...")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/block/xen-block.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


