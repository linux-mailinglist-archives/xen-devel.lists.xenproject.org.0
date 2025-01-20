Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB80A169E8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 10:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874898.1285261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZoP2-0005bt-5G; Mon, 20 Jan 2025 09:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874898.1285261; Mon, 20 Jan 2025 09:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZoP2-0005Yr-1y; Mon, 20 Jan 2025 09:49:04 +0000
Received: by outflank-mailman (input) for mailman id 874898;
 Mon, 20 Jan 2025 09:49:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xfr=UM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tZoP0-0005Yl-NX
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 09:49:02 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c70c3a50-d713-11ef-a0e3-8be0dac302b0;
 Mon, 20 Jan 2025 10:49:01 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so4088168e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2025 01:49:01 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af60913sm1264997e87.123.2025.01.20.01.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 01:48:59 -0800 (PST)
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
X-Inumbo-ID: c70c3a50-d713-11ef-a0e3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737366540; x=1737971340; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+J/LNJvWYY+tHim3tSirhQiRwXTYSBgfGctgoztLNU=;
        b=lxXBO1A8fQ7QN+mWqVY4Jp/tlTOa5i8ncieHJgvv8ZaTYsby7/YbQ+D7WHaVhN4M6Q
         f7RIdFUOt+eU+cZIEzC4A1Z8KHiG6aa+3TltU2NZ/mch1ZT8uPi9pNNYCk3AvPJIELV9
         dyXAoem9jTLLoG8CiUZzVk6RBU0IdOkJukuMwU+LXD3GH6QIrIijly+Z6xx0VZEk27Ly
         ZNznTsmAqEjt3AxViLjzpiN0ixyi0F/jAmctkNusyn+MCdV3hfwRiDjxuwyQR8nkbL1C
         uVvjpoWrlJ78LXvcgV2CDnDzK2tRvQbH8qviitneEdwglZNeE0NIZyBLeKA5X+jhPhBM
         IkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737366540; x=1737971340;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+J/LNJvWYY+tHim3tSirhQiRwXTYSBgfGctgoztLNU=;
        b=Xk+ufXlmm8LJeWhPB3jKXBfWHa0Chn6vKvsEcVypQYLDVszj3AI8IADpagn4ALeLZy
         Bs97AbBIMKTRL/vpXRf5MYkQqd87oJjPxQVzuCl0HKjU2iRgzS/OI+IDSmpC7K/k/9ps
         XFQiOlyKzGR+Xw6yM49qPDSBs0smAQibaq3bYKOG7pblHqIz8xBXjBfi2fnXQYxl1WRt
         91dgIVwIOLsaSaC3t965aSaWOCDY7KhAvKBhs/XGKFewewowAcd/fxfETRvt8zI3i5h5
         sY+r1bI3rLanFsWdleEOtMai25BYoIm83yHyNyzQd3pBgadNHDWovYtMR5fI1lMJ0To9
         ujPw==
X-Gm-Message-State: AOJu0Yyhj+iyyWsuPg/vNnaK48PSOiBlQ6QaUcjIWEW23HgBxv5EFIQt
	AedLKwWWWwBn9WOVGrJBbHVfoerBnH027t91Q1QWR2rvmytLJ2NIngtcCw==
X-Gm-Gg: ASbGncv/aEdgm0yzlje5A/6pOLSosOKqAzF9fOvDAA3g16jSf+9e1bSbNTPng8KkdDg
	y2+3mjI+6wu6Pi+UwkKIbzWO2T8LfmroJZhRKVGzDVsrpClsQ0pI5mVd/300nWOOVuf39vdXsZi
	ndb1IykObd4do/6GfuVQY+8zHVz74OhK6vYsgsOidbaHMG+b9gRhrDmap0lutNsR7Zmx0DW/vUM
	8VcOQqp5N2Fs+OBhmHXmbLmAISoXuqqqBrkQuBs8MjeA6e3DLNxU60wqjL7chCdBW08+XjWEZTB
	hYnaGOw=
X-Google-Smtp-Source: AGHT+IFQYU+eXGZVdwiQ4sYivTuKqaSG3hPjfFGrNYKmmi0S01UOIQRN8jq0Ihz/XXMRoBG5HK6vcA==
X-Received: by 2002:a05:6512:4808:b0:540:22e0:1f80 with SMTP id 2adb3069b0e04-5439c229158mr3469326e87.20.1737366540074;
        Mon, 20 Jan 2025 01:49:00 -0800 (PST)
Message-ID: <9ce473c2-0735-4ded-9f44-6e8c0605cf3d@gmail.com>
Date: Mon, 20 Jan 2025 10:48:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Hard code freeze date for Xen 4.20 is Feb 07, 2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

The hard code freeze date for Xen 4.20 is  February 07, 2025.

Bug fixes for serious bugs (including regressions), and low-risk fixes 
only may
continue to be accepted by maintainers beyond this point. Please add me 
in CC
for the bugs and fixes you think should be in the current release.

Thanks and have a great week!

Best regards,
   Oleksii


