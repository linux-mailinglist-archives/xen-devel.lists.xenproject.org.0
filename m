Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FB21F1368
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 09:17:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiC1P-0001BZ-LN; Mon, 08 Jun 2020 07:16:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiC1N-0001BU-LI
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 07:16:37 +0000
X-Inumbo-ID: fd31beca-a957-11ea-ba62-bc764e2007e4
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd31beca-a957-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 07:16:36 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c3so16137285wru.12
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 00:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Lb5RKUus1nw/vCNQmPl6ydLOwk5yInAAPsiNBgTIcks=;
 b=UcLYGP+7UQY9J5GHvrXobHNzFqATzO6Y8O5Lxi0WZBiKT7QJ2auIxeFvU0Zwg0Fl5L
 NyEwf1nz3jOPhvkBztumLEbbTSO5pG3VJVo52AcZk8ik5WVxsOPtF+mkVJJuW5Dtba28
 UPPx2jsVQ0wZdX5eoUfLmCTRE/MiuV93o6sYh+iCc/hh5+vhNg81yj2+zM1h4mCnWtcC
 XhaVErY5GNGjXlcKH0pKFqUKVZvx3dG6Teyqrh6ggBeQ2CiZcEIMaOv/PuFV47L8EXnn
 Xk+fWL97IosFE7JiKSxMuDiRp8DITQLM0wy6KICRY6PK/ZjWoISc0bh86mBWSkM8qDgN
 DR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Lb5RKUus1nw/vCNQmPl6ydLOwk5yInAAPsiNBgTIcks=;
 b=GVthxn9NclleSLw0mrHHxnKO67t0+w/wiRvU5wOpvXBwW10BiMNSUjYUXMrnD8D7V/
 nSMDAMvVc5xvTKb+DBy+xNHX/ChNVOvYAxtXgLl4dPsGsgN0yIPCTj6VGmO4CVVNLXe7
 PR8HSoD/rIXiEmqo6GLjpHO9UMVE4y/FieJAT+9AkZYh7eftwVX6PbTflBAdr3kguezt
 EGhTHJ0Y/cXI/WhvdJNKsnKJyTKUkf99TMyJrum5JTjQmQ9SFv8y71mq/s5V6FdUzN8o
 PQn9uXwmsFQttlEYtQqH3LV8qGyy+FlkgIWNhfgBdRS3vjgHqVtCXuF+6Rvd3+vrWsxe
 NOEg==
X-Gm-Message-State: AOAM5323M8t2ftLCSeP3roPYEGiyOmrrAcT8ohBDnH8Kh8TszNNtvrmV
 05VAtbOhaKKtVX4969Lc7aA=
X-Google-Smtp-Source: ABdhPJz+zJr9dXsemaLNBpxq3KOnuu4rehyDFS8hdMpW0iCYk5UkFQQhctHl0jhaedq2O7KmHf3Uvw==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr21865179wru.211.1591600595974; 
 Mon, 08 Jun 2020 00:16:35 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id g19sm1059860wmh.29.2020.06.08.00.16.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 00:16:35 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <ec58c0cd-2e39-15bd-a102-fd5b40e5e35d@suse.com>
In-Reply-To: <ec58c0cd-2e39-15bd-a102-fd5b40e5e35d@suse.com>
Subject: RE: [PATCH v2] build: fix dependency tracking for preprocessed files
Date: Mon, 8 Jun 2020 08:16:33 +0100
Message-ID: <001901d63d64$be475c60$3ad61520$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKkJ/Oy2eqdW+EjW3qdCJH7l2wxc6cyeTUg
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 05 June 2020 15:23
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> Subject: [PATCH v2] build: fix dependency tracking for preprocessed files
> 
> While the issue is more general, I noticed that asm-macros.i not getting
> re-generated as needed. This was due to its .*.d file mentioning
> asm-macros.o instead of asm-macros.i. Use -MQ here as well, and while at
> it also use -MQ to avoid the somewhat fragile sed-ary on the *.lds
> dependency tracking files. While there, further avoid open-coding $(CPP)
> and drop the bogus (Arm) / stale (x86) -Ui386.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Move -MQ ahead on command lines.

Looks like this is a fairly low risk fix to pull into 4.14 and it looks like it would be worth it...

Release-acked-by: Paul Durrant <paul@xen.org>

> 
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -201,13 +201,13 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y)
>  	$(call if_changed,obj_init_o)
> 
>  quiet_cmd_cpp_i_c = CPP     $@
> -cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) $< -o $@
> +cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -MQ $@ -o $@ $<
> 
>  quiet_cmd_cc_s_c = CC      $@
>  cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
> 
>  quiet_cmd_s_S = CPP     $@
> -cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
> +cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) -MQ $@ -o $@ $<
> 
>  %.i: %.c FORCE
>  	$(call if_changed,cpp_i_c)
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -123,9 +123,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-off
>  	$(CC) $(filter-out -flto,$(c_flags)) -S -o $@ $<
> 
>  xen.lds: xen.lds.S
> -	$(CC) -P -E -Ui386 $(a_flags) -o $@ $<
> -	sed -e 's/xen\.lds\.o:/xen\.lds:/g' <.xen.lds.d >.xen.lds.d.new
> -	mv -f .xen.lds.d.new .xen.lds.d
> +	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
> 
>  dtb.o: $(CONFIG_DTB_FILE)
> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -244,9 +244,7 @@ $(BASEDIR)/include/asm-x86/asm-macros.h:
> 
>  efi.lds: AFLAGS-y += -DEFI
>  xen.lds efi.lds: xen.lds.S
> -	$(CC) -P -E -Ui386 $(filter-out -Wa$(comma)%,$(a_flags)) -o $@ $<
> -	sed -e 's/.*\.lds\.o:/$(@F):/g' <.$(@F).d >.$(@F).d.new
> -	mv -f .$(@F).d.new .$(@F).d
> +	$(CPP) -P $(filter-out -Wa$(comma)%,$(a_flags)) -MQ $@ -o $@ $<
> 
>  boot/mkelf32: boot/mkelf32.c
>  	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<


