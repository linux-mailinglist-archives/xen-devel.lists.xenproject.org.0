Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C216C9ED7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 11:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515080.797617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgilt-0003fQ-RO; Mon, 27 Mar 2023 09:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515080.797617; Mon, 27 Mar 2023 09:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgilt-0003cm-Ng; Mon, 27 Mar 2023 09:04:09 +0000
Received: by outflank-mailman (input) for mailman id 515080;
 Mon, 27 Mar 2023 09:04:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xFYs=7T=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pgilr-0003cf-Ms
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 09:04:07 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52db4a75-cc7e-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 11:04:04 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id m2so7879249wrh.6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Mar 2023 02:04:04 -0700 (PDT)
Received: from [192.168.26.216] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 u13-20020adfdb8d000000b002d2b117a6a6sm24567852wri.41.2023.03.27.02.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 02:04:03 -0700 (PDT)
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
X-Inumbo-ID: 52db4a75-cc7e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679907844;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXHUgllCiE+YVplh4F0vC+TIMQgHYLAcdKhqqMncm+M=;
        b=UjgOhIU/pavH2tlMiWKycQqAigQYIjgXPIu4oocRPGzCa6LiVMGOvqObrg/PRgkmVu
         9Xnhg4WGVJjU3lOJoCVQ3UYykePZC+rJIGQhsMn5smPo/OHUQWgnk0LqVyle5s5lsPX9
         ToiZQ+OZguuNokmfrIAl2lS9WK4Q4SvyYi+2GIqflDRN3t4HaR+m2AfzLnCmhcdjb9vl
         p5o8JEG89pLh5h9zUx7yYvO8WMqBtMnjVx7B6Bhhv0/XcI8FcsMimYzxslgt9LrfgO6H
         KJEquB69ob74KiHksS94yNZveY1kMYPS4TsXHra/0UD5uSQkXuOjOOe2Vh/wn+YamevJ
         t5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679907844;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXHUgllCiE+YVplh4F0vC+TIMQgHYLAcdKhqqMncm+M=;
        b=XNTLRQgqdgJyFHNz0LcKvbiQcn0ut2xNaaNQN6OFxLtAsr+mW54GwXr50xufFmnRvE
         h7i6WJXKTwfQvW2kHLiJ5IC5chjiZN6T+s3oM98E35dsHlQzR6iQYWl2FOE+s6yC5gI4
         BLYBuP/sRfJcR8kMqSh0dFDD/ZPTZVsdRr91ZkOH6dYIoPtRUBNY4xolo1Dv0YZWDGOX
         tSUM8C+uTF2gLH2PYkO784RujESbAdQJEVw/PDQkMbhHZK5MtFwKld109TDB9C/lplIc
         pDEJ1jG9c3HraTllGR1RLCOftjEXQGZ/hsvSCXvasadsE4EuRy8n3U8nymWSrP0Ox9c1
         5zug==
X-Gm-Message-State: AAQBX9dfySnaru1jfqSY3fSVfKWP8y4Uk4LIiOEjZk+Y+UzCuZBInGI0
	V3tknd0kciqICIwo1DuqhAU=
X-Google-Smtp-Source: AKy350ZCDxEOhvB06k/8nFr/OHWO5YAaSfzuL2Y8qzIAkmCg7c3/PINVfRoQvVapYrT+OqZlGSCrbw==
X-Received: by 2002:a5d:63cb:0:b0:2d5:2436:b584 with SMTP id c11-20020a5d63cb000000b002d52436b584mr8944362wrw.42.1679907844064;
        Mon, 27 Mar 2023 02:04:04 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <04f7b88c-a7dd-6d63-4938-06e71a194aa3@xen.org>
Date: Mon, 27 Mar 2023 10:04:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Reply-To: paul@xen.org
Subject: Re: [PATCH 1/2] xen/netback: don't do grant copy across page boundary
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Wei Liu <wei.liu@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, xen-devel@lists.xenproject.org,
 stable@vger.kernel.org
References: <20230327083646.18690-1-jgross@suse.com>
 <20230327083646.18690-2-jgross@suse.com>
Organization: Xen Project
In-Reply-To: <20230327083646.18690-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2023 09:36, Juergen Gross wrote:
> Fix xenvif_get_requests() not to do grant copy operations across local
> page boundaries. This requires to double the maximum number of copy
> operations per queue, as each copy could now be split into 2.
> 
> Make sure that struct xenvif_tx_cb doesn't grow too large.
> 
> Cc: stable@vger.kernel.org
> Fixes: ad7f402ae4f4 ("xen/netback: Ensure protocol headers don't fall in the non-linear area")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   drivers/net/xen-netback/common.h  |  2 +-
>   drivers/net/xen-netback/netback.c | 25 +++++++++++++++++++++++--
>   2 files changed, 24 insertions(+), 3 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


