Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA54671070
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 02:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480067.744253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHxeh-0002Lq-Kk; Wed, 18 Jan 2023 01:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480067.744253; Wed, 18 Jan 2023 01:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHxeh-0002JM-HL; Wed, 18 Jan 2023 01:54:23 +0000
Received: by outflank-mailman (input) for mailman id 480067;
 Wed, 18 Jan 2023 01:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ljc=5P=gmail.com=joanbrugueram@srs-se1.protection.inumbo.net>)
 id 1pHxeg-0002JG-M7
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 01:54:22 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05fdbd83-96d3-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 02:54:20 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so427312wmq.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 17:54:20 -0800 (PST)
Received: from solport.. (80.red-83-42-43.dynamicip.rima-tde.net.
 [83.42.43.80]) by smtp.gmail.com with ESMTPSA id
 q12-20020adff50c000000b002be25db0b7bsm2043264wro.10.2023.01.17.17.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:54:18 -0800 (PST)
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
X-Inumbo-ID: 05fdbd83-96d3-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thVLVROfX6AvPBKTUyk8ux14/6qppawT7dt0nyTi8Lc=;
        b=gfLdwhvtjCP6/74XGTQQJcA7iGaS4m87AHEBSP5sD16YNFRhl9vS4OwpV7jSH+idhH
         srgibYZnk4NkHdvQTDvKfaHBmvrYCg5+yb9Q6PvBmHIeXuq6+DfT4LmwtBTHF/EGdwXl
         C3coOPpKVt+Oxh6I5rBOFA1MzJI93BDRoB/wOgptl9DAqWel2T1Akf2L+y6gUi0qtFex
         NS8+DnE5VyO9TqY8PIefBcJCmZ2SaCcIlm92DPzXUJ6cymW9vPmPTMm+m+uZ/N8kj/Xv
         YHJ7dZ35CItYN65ejGnk+UDmi1vzXgr9DYVUIKpjUO+iMu+Z0PbRfvjPmNTmO1jPngoy
         tJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thVLVROfX6AvPBKTUyk8ux14/6qppawT7dt0nyTi8Lc=;
        b=FQBb2j/JvCAg7DilTbmTzWAv2kqD4GRmjnopP1AniMvEjAPUtdv2eIGNCt2qGImOkJ
         LHsEGt/8BwM3Yr71aF6SErbtL6m9c5xWUYKBGZJeasapE8KHc0J+GuFxejQX9VPzghjm
         COYWgaVJil1lUz9qgJI9oV/9KcEpBgt7xO9k8fVOeSNgroFEdhtrkFv37AEx+IDBq4Xo
         BiFIPCh3ZQs5+Ud9P+KrE+g2sQOJZCGz+fo45D+0Hqc/WMwz/FGagqfv9K6/uxmjMXy/
         5pI7xshxx117cHCUN+JJH0AHwNdYEL+Bq3IWrDe4BbZ3vYEw//1EbAx4mDGVXZ3o16mO
         LtxA==
X-Gm-Message-State: AFqh2krxmp97kh/YASbuZDTsCA1t4rO5CqpouSzd1l86xy0rpKTYEGYl
	cu7QeFQUwkhGB6aTBlZMpyk=
X-Google-Smtp-Source: AMrXdXv//7iE8nVbevIc5WQF2jxSlhQMI2dNCCYQgusye0d7toEjXRfqJCmv3LQ9+KG9V6qyZyXi6w==
X-Received: by 2002:a05:600c:1d22:b0:3da:f66c:795d with SMTP id l34-20020a05600c1d2200b003daf66c795dmr5261659wms.9.1674006859635;
        Tue, 17 Jan 2023 17:54:19 -0800 (PST)
From: Joan Bruguera <joanbrugueram@gmail.com>
To: x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	"Juergen Gross" <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	"Jan Beulich" <jbeulich@suse.com>,
	"Roger Pau Monne" <roger.pau@citrix.com>,
	"Kees Cook" <keescook@chromium.org>,
	mark.rutland@arm.com,
	"Andrew Cooper" <Andrew.Cooper3@citrix.com>,
	=?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 0/7] x86: retbleed=stuff fixes
Date: Wed, 18 Jan 2023 01:54:12 +0000
Message-Id: <20230118015412.273150-1-joanbrugueram@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230116142533.905102512@infradead.org>
References: <20230116142533.905102512@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks, I've been testing those patches on my real system (i5-7200U) for
the last day with no problems so far, waking from s2ram works as well.
I can also no longer see those `sarq $5, %gs:0x1337` with %gs=0 on QEMU.

Regards,
- Joan

