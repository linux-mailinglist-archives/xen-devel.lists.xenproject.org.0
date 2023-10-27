Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2677D8FE3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 09:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624260.972678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHK6-0008Vv-10; Fri, 27 Oct 2023 07:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624260.972678; Fri, 27 Oct 2023 07:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHK5-0008Su-Tq; Fri, 27 Oct 2023 07:32:01 +0000
Received: by outflank-mailman (input) for mailman id 624260;
 Fri, 27 Oct 2023 07:32:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwHK4-0008So-1K
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 07:32:00 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e918aca5-749a-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 09:31:58 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4084b0223ccso13595885e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 00:31:58 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id
 iv8-20020a05600c548800b003fefaf299b6sm929618wmb.38.2023.10.27.00.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 00:31:57 -0700 (PDT)
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
X-Inumbo-ID: e918aca5-749a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698391917; x=1698996717; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3WQCodtLeMa/vLM2901WzSloIhFtxV+9ehL3oSRrzfA=;
        b=lWjWqdJHQyCTQnt6Na486Ukiq/yHDGn4Qg9WZ8pDeLPnXpu809Nd1N6Lmb1xh3XkVu
         pqXqYCaNkvpm0wpicESl5i4PusfdFwQcK8SRzrnA+WldwUlV6ZbtdQwVg69NFLrJE1sc
         Y4QbpUUSSOV3Jp/bdaJtrEQlegMMBJstXu6KayXfpwPm/JCgjSpXn1UXgPVAev3Bv6k4
         i65KWr77c6rmtH+f3sx3OYwuNrDWH24IFq3HOxSc7cD1y9KN70imH2TlNOqlcAN6xP6c
         ML8OSjFbC2vY5S53M/EuEfQSFo9znGjigYF2ruqxbGQnun9vJSx1EYdVZdsh4DLXW0EH
         hDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698391917; x=1698996717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WQCodtLeMa/vLM2901WzSloIhFtxV+9ehL3oSRrzfA=;
        b=blb5R0VFVjeSGzrlnMQt0BJJK/Af0iHOlXTHimloZjuw8TfutRh7Zj3aIZFmYBxpDT
         5Ts+OaByyOkjO5UOQfGz1WKd1u9bAr2IlyKEAwho35gXxCs+JCEOKbnkHmRhQHYLzrP1
         +wjuw1kTPRyzxWVkO/70B42CANlMBWokaOmUV087RJeiuSJcersRULe12mrZLmtmxslI
         7q1m86eGeuCb+RDBFhHBq8y2fWvGJyLg7Hp0jP7RQqDsJCG3U2L9ZyOp0y0yHia1eQcW
         Ucvux6hDZY5QoMO4AjBPlrvLgomV5G820A7XIxzCwy2afH2rlYfIeyiyp4NfU1a2ZbnE
         Hvdw==
X-Gm-Message-State: AOJu0YwwMltLND26Saf1ca66n7dqiPKukJaSbbAAVXkHOb/lWDVzGRZH
	aeVnSbAQr21L1Qd0B9DGJ5k=
X-Google-Smtp-Source: AGHT+IEMg/Tnlu8eq0BMbhOEZDo19OPcdSvp2reFdXjF66hF1stq7Cv3VhULPpUY2sBAaCOfyGVFVg==
X-Received: by 2002:a05:600c:2206:b0:409:295:9c6e with SMTP id z6-20020a05600c220600b0040902959c6emr1557480wml.30.1698391917503;
        Fri, 27 Oct 2023 00:31:57 -0700 (PDT)
Message-ID: <72d847b6-1031-48fd-8155-1cd441f37f8e@gmail.com>
Date: Fri, 27 Oct 2023 08:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 14/28] hw/xen: add get_frontend_path() method to
 XenDeviceClass
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
 <20231025145042.627381-15-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-15-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The primary Xen console is special. The guest's side is set up for it by
> the toolstack automatically and not by the standard PV init sequence.
> 
> Accordingly, its *frontend* doesn't appear in …/device/console/0 either;
> instead it appears under …/console in the guest's XenStore node.
> 
> To allow the Xen console driver to override the frontend path for the
> primary console, add a method to the XenDeviceClass which can be used
> instead of the standard xen_device_get_frontend_path()
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xen/xen-bus.c         | 11 ++++++++++-
>   include/hw/xen/xen-bus.h |  2 ++
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


