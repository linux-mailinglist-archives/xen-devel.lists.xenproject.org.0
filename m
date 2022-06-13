Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4D54860A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 17:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348411.574656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0mMf-0001jB-5g; Mon, 13 Jun 2022 15:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348411.574656; Mon, 13 Jun 2022 15:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0mMf-0001g2-26; Mon, 13 Jun 2022 15:52:29 +0000
Received: by outflank-mailman (input) for mailman id 348411;
 Mon, 13 Jun 2022 15:52:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7V0V=WU=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1o0mMd-0001fw-8U
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 15:52:27 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1a83659-eb30-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 17:52:26 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id a10so5990329pju.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jun 2022 08:52:25 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902ed8b00b00163f8ddf160sm5320656plj.161.2022.06.13.08.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 08:52:23 -0700 (PDT)
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
X-Inumbo-ID: d1a83659-eb30-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5DgRlsCxoN9bkalUqnw2erGL7IQHDQQ4iObLzReHoSI=;
        b=nkJAiEZtArgp2MoZqgKrUMmhIFGzFLs+Y6TQNOubKl3j0zpto3lXz60GoxoxmNave6
         EK3i9ue27BnOinFxBW6T1f1WD2qdK/g5EFIObDyf5+pjTFKs2fBfIa6Aez6DJqD1cv4M
         aI6FBE5ZtryGyeMGQTX8ELQT5UKfgSkg70XYTP9a3dVHDZjVBjNHOGDlbKIr/I74qxGg
         ppfotO6lwT6XGY84hgmUr/ME2aCRp9k41CPyf0NxNolzH7HQeOispfnBtMV+5e5THOKj
         VcAYNllYsg3Fpy6MtYnd3ZYbhlS5IxGZfzu123JIKb0Hs5Cq3vH6bHWe2R0FJfmZs2wa
         poHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5DgRlsCxoN9bkalUqnw2erGL7IQHDQQ4iObLzReHoSI=;
        b=g1fjqLO3M7B35U+YGdMwg187h5GarOxzni6aoOm1DZkh9fPkenRoWRUGapXMue3wDz
         Pk1YrkOV2U3pvSqpfVmx2j55ITrwscYaZytwsNDCzR46jkG/9SG5deTkTED76yMcopF9
         sdNexW++qaKItJNzc52RH7BLHIG9IVNKCdO5JGbg/H2U7NUxEGQs00dK7dXRFsHGTERc
         gYse71A8o2hvE2B48E4jWS5Lh5rXTDp9XdZpN4Gk0ovCHt135+aJUHY4if8FbANzgNeR
         9L+LoZQfpMM+HO9eKnRx6mn2U7Kj0gA+IE/d+IeBST0MSdyu6nU8GqGqCLSX7TPMrkI+
         a+tQ==
X-Gm-Message-State: AJIora9r8wAMF5VtXDvNqzuLa3r9Z0Bo0gLygot/IBpY+FKV6ovzawnB
	mJpWKeS9rYp+YDHx1UbnXIzBbg==
X-Google-Smtp-Source: AGRyM1ubha0bGe1oEKe7F5ycVr8z5V2V2OEkRKUkD/yVVmiKMsFJwOMNv0AHYZzze4taNq5ayMAWEg==
X-Received: by 2002:a17:902:b683:b0:163:4ef2:3c40 with SMTP id c3-20020a170902b68300b001634ef23c40mr268488pls.123.1655135544401;
        Mon, 13 Jun 2022 08:52:24 -0700 (PDT)
Message-ID: <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
Date: Mon, 13 Jun 2022 08:52:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/16] Kraxel 20220613 patches
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Canokeys.org" <contact@canokeys.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/22 04:36, Gerd Hoffmann wrote:
> The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:
> 
>    Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 21:13:27 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/kraxel-20220613-pull-request
> 
> for you to fetch changes up to 23b87f7a3a13e93e248eef8a4b7257548855a620:
> 
>    ui: move 'pc-bios/keymaps' to 'ui/keymaps' (2022-06-13 10:59:25 +0200)
> 
> ----------------------------------------------------------------
> usb: add CanoKey device, fixes for ehci + redir
> ui: fixes for gtk and cocoa, move keymaps (v2), rework refresh rate
> virtio-gpu: scanout flush fix

This doesn't even configure:

../src/ui/keymaps/meson.build:55:4: ERROR: File ar does not exist.




r~

