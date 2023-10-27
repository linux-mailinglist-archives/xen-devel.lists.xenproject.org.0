Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C727D918C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 10:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624281.972711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwIDt-0005D2-6D; Fri, 27 Oct 2023 08:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624281.972711; Fri, 27 Oct 2023 08:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwIDt-00059y-3P; Fri, 27 Oct 2023 08:29:41 +0000
Received: by outflank-mailman (input) for mailman id 624281;
 Fri, 27 Oct 2023 08:29:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwIDq-00059s-QS
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 08:29:38 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6b83e62-74a2-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 10:29:37 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4083f61312eso13892135e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 01:29:37 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c314900b0040849ce7116sm4519893wmo.43.2023.10.27.01.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 01:29:35 -0700 (PDT)
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
X-Inumbo-ID: f6b83e62-74a2-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698395376; x=1699000176; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uawWEYvnU1I7SsFfXaVgl6JK99lbvsL15u5TMr7vQn8=;
        b=K9nyzKXqcS0umrg8ilM4BFAivRhh1Z88D7hH1+6wGaHKPHhzws+dikmLpD10pQIdf7
         IiLN/ajuXMg1l8HQJH9+L3+fuk35labkMfejSWAUuslNCU1ce+vRgeurODgv3fl2cWJZ
         +8I8gs4zeQktX8/+1weH7DNGRr9yYooihm0V150Rd0EW3f/Hrgbcg4pgPL+qg79k/ICb
         YiBe782+Ch2WjobLNHW7hvNI/8+F+On6rTEmCN0qT9NCfd9HkyZG0RFNWtxT9i/aFSLH
         o8P10Hr/+nYsafyshNEdlD2pJVpJadyKIiI1E3OY4bKS0j7z3uyn4RbZhBIvgi8Bf3hy
         X+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698395376; x=1699000176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uawWEYvnU1I7SsFfXaVgl6JK99lbvsL15u5TMr7vQn8=;
        b=dalNFZdcaBUnmaFS8X8zWL+FCdtEsrFeJiOV7LSvp5MR82IWhiaW3BPXSBTh1LZ9QH
         dIwLbK0xaagrSfR4TOQZVNlYmLOsVlHBnjYCwEjXl8lhEA/RwdWNok5V1e2BBKDpd4HG
         iPnKsrrYI2/ksvy+IYerqIYdQ/ivlgjWUJINJ9jg8XnnwHB1uuz9XSQDZ4SVMTJscL7k
         qpl3vYdqzX3Opow2FLyMrlGBElYBLV1Xvy1qQLPw3YrTPzpMyR4Xh8bL5r8oy+9XM51I
         9wELn4oYQkrc+Knjlm+Sc6V7hr6g4W2l3MHJYYNrvDRsN34vAZco6q4UcVjjh6lGl8YR
         plfw==
X-Gm-Message-State: AOJu0YyezxmGZF+ILGBzCdTfOny9UHLsrkevHD1bYd8zlzTNZWI5/asZ
	49kiPVCA3aCPXhsy3RNgVyo=
X-Google-Smtp-Source: AGHT+IEhOFiWCBEfo+wHr0Pp7y4a5kzJHetZXB/E/pRI16RlTXShKDIVxn2mzdbzdHFgDhukzBbnCg==
X-Received: by 2002:a05:600c:1c06:b0:404:4b6f:d70d with SMTP id j6-20020a05600c1c0600b004044b6fd70dmr1726336wms.17.1698395376081;
        Fri, 27 Oct 2023 01:29:36 -0700 (PDT)
Message-ID: <0aabb787-eacf-48d9-83b6-3769c7436cf9@gmail.com>
Date: Fri, 27 Oct 2023 09:29:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 18/28] hw/xen: only remove peers of PCI NICs on unplug
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
 <20231025145042.627381-19-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-19-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When the Xen guest asks to unplug *emulated* NICs, it's kind of unhelpful
> also to unplug the peer of the *Xen* PV NIC.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/xen/xen_platform.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

