Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E24B989E113
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 19:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702583.1097701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruEwg-0003yq-UN; Tue, 09 Apr 2024 17:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702583.1097701; Tue, 09 Apr 2024 17:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruEwg-0003wb-Rh; Tue, 09 Apr 2024 17:07:42 +0000
Received: by outflank-mailman (input) for mailman id 702583;
 Tue, 09 Apr 2024 17:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mUTu=LO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ruEwf-0003wV-SF
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 17:07:41 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abd1de7f-f693-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 19:07:40 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-343c2f5b50fso3901466f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 10:07:40 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n15-20020a5d4c4f000000b0034403ee44b1sm9684846wrt.14.2024.04.09.10.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 10:07:39 -0700 (PDT)
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
X-Inumbo-ID: abd1de7f-f693-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712682459; x=1713287259; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7W0XoYJG1ABQmQWziB6ZTH+cVgNmcQ5aFQjOf+T3hBY=;
        b=JoCjzx5lYAI/itI+oZaH6R4B6OFgxThwOsbz0OTanq0jqC9+Eg+7wswaLOar5FMRkK
         qQpPA8rOvX6MM1vTSQy5LGtqCphY+dLVm+iw3qL0gN0SEeHM5XllcLlvvk8qtpp4IXtG
         lkBs806493NA7utbQtXgita5jBih4uH+P7d08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712682459; x=1713287259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7W0XoYJG1ABQmQWziB6ZTH+cVgNmcQ5aFQjOf+T3hBY=;
        b=iJbKgDekf38fV/vLnEOEOu/YXtIn6KEqqTJ4yHoL7f7Qezp9ZrUgNgvyNeF+UjAf3f
         F0frvGe0v741/cQTg2X35QcEm+hHxZ12LyGJVVKzdtk0x2JYN56Z4OH9Fb0pAGZnx85z
         uMA8IxW9BSm+DWR4prqiu/0sXJkj55cGJw8hA7PP8mOFb0pOxP2J1AMUb+iqFGQmbybq
         NLvZvlSheVE+tKi1MT0RgIQxfKzf5vSW9Fr2L3D5Zv+LJl4gkMESEVfaxIiYJ6rdrCEx
         Osc/oloY3d1bEli7WskR/kIsJ0gKYyHT+W0qf5c47dCoSKAvN+sQLUL/b3hUQirua3aA
         3nng==
X-Gm-Message-State: AOJu0Ywr3dE48RKxBOQBk/IaHNmyj1rEA08YT941M3ED0muO7J5vo1Yj
	a7ChBvoGW3szXmI59pBaQmLkgopObBcAOoeU6375dvqKP42yyAxNtsxLuOhz1L6hJ9y5/tLyeBh
	2
X-Google-Smtp-Source: AGHT+IF36X3R37sJWQQsGWyDknjDaHlA6Rqcww3+1bjXUXjN3OV6iND4TxbzHCReXGXLptbL1BYAmA==
X-Received: by 2002:a5d:58d7:0:b0:343:a2fb:92aa with SMTP id o23-20020a5d58d7000000b00343a2fb92aamr169104wrf.71.1712682459335;
        Tue, 09 Apr 2024 10:07:39 -0700 (PDT)
Date: Tue, 9 Apr 2024 18:07:38 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: leigh@solinno.co.uk
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	slack@rabbit.lu
Subject: Re: [PATCH v2 0/6] xenwatchdogd bugfixes and enhancements
Message-ID: <67267013-2505-4685-b2ac-b62645e73ca7@perard>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329111056.6118-1-leigh@solinno.co.uk>

On Fri, Mar 29, 2024 at 11:10:50AM +0000, leigh@solinno.co.uk wrote:
> From: Leigh Brown <leigh@solinno.co.uk>
> 
> The primary intention of this patch series is to replace the 
> pathologically bad behaviour of rebooting the domain if you run 
> "xenwatchdogd -h". To that end, I have implemented comprehensive 
> argument validation. This validation ensures you can't pass 
> arguments that instantly reboot the domain or cause it to spin 
> loop running sleep(0) repeatedly.
> 
> I added a couple of enhancements whilst working on the changes as 
> they were easy enough.  In particular, being able to run in the
> foreground, disarming the watchdog on exit, help and a manpage.
> 
> Changes since v1:
> - Add Signed-off-by on every patch.
> - Make global variables static.
> 
> Full list of changes:
> - Use getopt_long() to add -h/--help with associated usage help.
> - Add -F/--foreground parameter to run without daemonizing.
> - Add -x/--save-exit parameter to disarm the watchdog when exiting.
> - Validate timeout is numeric and is at least two seconds.
> - Validate sleep is numeric and is at least one and less than timeout.
> - Check for too many arguments.
> - Use symbol constants instead of magic numbers where possible.
> - Make all functions except main() and global variables static.
> - Add a manual page for xenwatchdogd().

It might be worth mentioning something about these in the CHANGELOG.
Probably not need to go into detail, maybe just "improved xenwatchdogd
options, see new man page."

Cheers,

-- 
Anthony PERARD

