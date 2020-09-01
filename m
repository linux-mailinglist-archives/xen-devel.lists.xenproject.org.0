Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A229258C93
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 12:17:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD3LJ-0003Cc-AI; Tue, 01 Sep 2020 10:16:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NvXq=CK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kD3LI-0003CX-Iv
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 10:16:44 +0000
X-Inumbo-ID: 2701994f-ab8d-4851-82a9-48cee7fbd2ae
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2701994f-ab8d-4851-82a9-48cee7fbd2ae;
 Tue, 01 Sep 2020 10:16:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b79so592453wmb.4
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2020 03:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=jENmCP0gElLVxf6OvYIfwPHnL/g3ojgIL+KrSX815dk=;
 b=ktTJ5qSFTFIt9EfmYr/Lp3UsyrVWN0hqXIKk+2abqfGvUf5I7INSG6k31yCndI9M4g
 6eiXjqXWxan9+IPzc2NXK0HzHP2/aeGuaZGjqs1TmyKdaWk64DcnlUs/+23nzLC1hp6F
 GI4L+ewOB7/vtsDshqwJZEZQrwqyhofbvFalUlcs55/Y0h5np9ydW2FQuZ0YKqnst4kD
 Ml6EWxbae5VuqMzUtH87+xGgEepY30T2nKvv4Ynu896vcK+RNP6xHvmdmu04tn/fX7jO
 9/ZINWPyD7aIlga0fYOxZW+OD0AFnmgK+q7efMDS+CQ6fmGF4pbzqj/KDx5qjEm+BT9c
 k5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=jENmCP0gElLVxf6OvYIfwPHnL/g3ojgIL+KrSX815dk=;
 b=k8t0hIK2hQ3aOdGCEPJ7dNdK4MGum0MPhv4Hor21eJ4jsF8e+DV7p5BKA36/9Y52Ek
 +NYv/+Wq50LdujBA4jHp2oBcTjUXlCiEeoGfZ3zWwJeEHuVkrAwQ69docc+5gCdGcxJB
 yHxpWgK4Dy7nEgVHYJCNlfJeOMEi/1nwo9UEXiljuz1h4e2t7jkCloDhxBMl8JgF8Uuf
 YFHiu2O5P/ZhoWJo5vReorsrTkDwIacg8LWEi+JCD2jZbmOrxvhjlgVJbU0poE0vGHfl
 qva2QsJlp0I4MupxgwDlPue3mX5uYXtvlGxC3HuEOZb/pdZ9MJvmUkF4k04yjvFSpC5C
 BCAQ==
X-Gm-Message-State: AOAM530SS388T5W2pZy6BdcVTlPXeBZb4pxL3Qt8sY1yRfYKcWGLU6NA
 mLyVPZUvnl7sZMrKtqJ2Ih4=
X-Google-Smtp-Source: ABdhPJxCuWdTvpNNbthXsgPucViRLkjYa+hMIjhk25H6Sh+XX2THkIxh7pQKbOquRE/VnTMXQ5Skuw==
X-Received: by 2002:a1c:b143:: with SMTP id a64mr1032605wmf.43.1598955402796; 
 Tue, 01 Sep 2020 03:16:42 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id 31sm454213wrd.26.2020.09.01.03.16.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Sep 2020 03:16:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>
References: <4b71b1e6-c6a9-b4b8-76a0-01417d10ffb4@suse.com>
In-Reply-To: <4b71b1e6-c6a9-b4b8-76a0-01417d10ffb4@suse.com>
Subject: RE: [PATCH] tools/hotplug/Linux: don't needlessly use non-standard
 features in vif-bridge
Date: Tue, 1 Sep 2020 11:16:41 +0100
Message-ID: <000001d68048$fce84750$f6b8d5f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGs/MjxS2+pnV+uGA1wV+BwNmif2KmmmCVA
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 01 September 2020 11:11
> To: xen-devel@lists.xenproject.org
> Cc: Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> Subject: [PATCH] tools/hotplug/Linux: don't needlessly use non-standard features in vif-bridge
> 
> We're not after any "fall-through" behavior here. Replace the constructs
> with ones understood by all conforming shells, including older bash
> (problem observed with 3.1.51(1)).
> 
> Fixes: b51715f02bf9 ("tools/hotplug/Linux: remove code duplication in vif-bridge")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

If using fall-through is indeed a problem then vif-route will need a similar modification I think.

  Paul

> --- a/tools/hotplug/Linux/vif-bridge
> +++ b/tools/hotplug/Linux/vif-bridge
> @@ -77,16 +77,12 @@ then
>  fi
> 
>  case "$command" in
> -    add)
> -        ;&
> -    online)
> +    add|online)
>          setup_virtual_bridge_port "$dev"
>          set_mtu "$bridge" "$dev" "$type_if"
>          add_to_bridge "$bridge" "$dev"
>          ;;
> -    remove)
> -        ;&
> -    offline)
> +    remove|offline)
>          remove_from_bridge "$bridge" "$dev"
>          ;;
>  esac


