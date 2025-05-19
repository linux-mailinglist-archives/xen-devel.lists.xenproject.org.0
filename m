Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF30ABB563
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 08:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989546.1373564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGuOX-0006ON-68; Mon, 19 May 2025 06:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989546.1373564; Mon, 19 May 2025 06:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGuOX-0006Mc-2T; Mon, 19 May 2025 06:54:41 +0000
Received: by outflank-mailman (input) for mailman id 989546;
 Mon, 19 May 2025 06:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGuOW-0006MW-A9
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 06:54:40 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2175e4f1-347e-11f0-9ffb-bf95429c2676;
 Mon, 19 May 2025 08:54:38 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a375888297so100988f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 23:54:38 -0700 (PDT)
Received: from [192.168.61.201] (server.hotelpassage.eu. [88.146.207.194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a365bc0b5esm7928041f8f.9.2025.05.18.23.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 23:54:37 -0700 (PDT)
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
X-Inumbo-ID: 2175e4f1-347e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747637677; x=1748242477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pr/iOLFC9VrC0CSrvGh5HRaU41gZYri8cVgn+uBHz/E=;
        b=JPog3QbCxOovxaAe+S2jHjmGHD96351FEbsC5xCwa17kwgY5PscURc2P8aaZNBFt0s
         9HvjMkewhVXepJ+XhF8hmiS4z/8hxWHe7MIKJ72AwUQ0NStmp+BtVq0ldMPlFThtdBIQ
         POzMlgZosnGxn8QUwuU9ekITRKJg4be03yiIWoD61uOBpuSBHuAVXpq9ob0CTZ5187gs
         0nrjv6HMMtBNwMi+5gzG1l2GOmNvI+QC/Zy123GdG9jkABDlVgF6QoTvsp/gvyRqhL/D
         E7uTiGzXJ79pt9cyjnhXYXLSP7CIuZk2UD495di1CPhMwaW7SDZoody0WUNq7/0LWUaE
         yJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747637677; x=1748242477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pr/iOLFC9VrC0CSrvGh5HRaU41gZYri8cVgn+uBHz/E=;
        b=UPMMx/zAH8Nq8d3bHSt97tMMPYOfpQzLQKp18WN0mCg0KFyd0cKO+pcaBmA3eAyJID
         BRiUCW/Qd0NKDMve8u/l3QofwnU+QDNKqoj7wfqiK6y+xfBnbSLob3NE5fdmWfCIrsBy
         6U13NKB4uAFzXWdxtXmZK6VwY3djRLA6g3ag71au9s4AGrauOPhLOaN7o5zk9LswWbUO
         1cMZvmufMcMSgSJvLF3wbq1+Yzs3USLSluKuGXp+MGlnhf5WEQaNN2tprgZRRb9zWgvs
         20/V82Pdc7jI0RURMCQ9Q2t2GlxUzfpGJGYu5uA0/zF5VozLIQt1RFG5F4lhHItpsK/n
         Kgbg==
X-Forwarded-Encrypted: i=1; AJvYcCVBxzzPGX/ClPp/DgebExTxn/1eTRbbU4WUMoHTpot0ambQK56UICqR3Olbor7IW1GmaJj6AP5xKnc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyxAwUJbdXvp6KdOoIx1kwHRpsh8MCVP5jGXn5+z1XGARpjh15
	BwVRmANdrfMTKuj4Ti2aArxyEj7drTEDkp9DXxKNvAro2/03lf4ZJCnY09BGxEi2QA==
X-Gm-Gg: ASbGncs/QONFxzTOxPQw0qUE+L8paMC7BuMdtiRly0diokGhbwFSneJNt4HxcHTiFZU
	8u54YOgi3u5GkRru4pB9bYbXt+lX5gWjXCrJNf8bOggJz+ooJWPo3rXvSTdyVeIL+ouWjuUCujJ
	qUXsqB17S0NqSssdIu00R7aYPoObgOrRmAsnV1JJVhB4hQkn6AvWtiOSx1BLHajhYu7kYER/jjg
	90++9qS+ano8Lb0fJOwgvN8biQdunPNdv9r5L3xzhFl95FdKyxTLddzzVKIQ/5CtPF7kpCtrjV2
	3nqs99F129aNIV6KhPth+Q1hRvk9WQsAJoZ6W8XZAytspAM5z3WBW96UyqysNan9QNOxxbebMPq
	tOB0fZAsUUw==
X-Google-Smtp-Source: AGHT+IH2YRVb8UqkUzFnfg7RZAW1DJuyyPc4TGKbWXhxn0wFbbMTEolC1973kmTtkGu4/kDUHXqayA==
X-Received: by 2002:a05:6000:2507:b0:3a3:6a8d:99c4 with SMTP id ffacd0b85a97d-3a36a8d9a33mr3825445f8f.27.1747637677600;
        Sun, 18 May 2025 23:54:37 -0700 (PDT)
Message-ID: <b4ea2a79-68b5-465f-b4e0-652852596fae@suse.com>
Date: Mon, 19 May 2025 08:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] vpci/rebar: Remove registers when init_rebar()
 fails
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-9-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250509090542.2199676-9-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 11:05, Jiqian Chen wrote:
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -49,6 +49,26 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>      bar->guest_addr = bar->addr;
>  }
>  
> +static void cleanup_rebar(struct pci_dev *pdev)

Just to remind you that any hook functions need to be cf_check.

Jan

