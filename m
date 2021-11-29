Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159D34617A1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 15:12:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234523.407074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhNu-00087A-59; Mon, 29 Nov 2021 14:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234523.407074; Mon, 29 Nov 2021 14:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhNu-00084R-1X; Mon, 29 Nov 2021 14:11:58 +0000
Received: by outflank-mailman (input) for mailman id 234523;
 Mon, 29 Nov 2021 12:59:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ajmq=QQ=gmail.com=blsv.anton@srs-se1.protection.inumbo.net>)
 id 1mrgG3-0006hC-RG
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 12:59:47 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a96d6c6-5114-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 13:59:46 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id bi37so44353827lfb.5
 for <xen-devel@lists.xenproject.org>; Mon, 29 Nov 2021 04:59:46 -0800 (PST)
Received: from draksrv.localdomain ([188.187.75.98])
 by smtp.gmail.com with ESMTPSA id g6sm1335958lfu.86.2021.11.29.04.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:59:46 -0800 (PST)
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
X-Inumbo-ID: 3a96d6c6-5114-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=umzZaYOF+dL4hqvZe222a+3Qiotff+3RWBjwx3Fvnt4=;
        b=At4RZ29jdQ2lusIxL88Ii8Tza1HcDcK8CXkOnNISU0uJZtChtFikY50rZ86GWN1wDi
         l4VyOqIaUTKUBFr1i37rnmhravocHxGP34HD/87FCNyC4erRUOEUOrm9N4yZ/tjP85Hw
         ZUkqlc8fartAPpQjWFlobnHdm3nbskfVN4MET7zYLmCM/BRUWBTk6PmGYYI6++sw97kU
         8PkvBejWLvzETeUOOypD+QfJa+HODE5C4j7C2M/8w0d+s53gJvAzJVBMBhUOzzDtE+0o
         z34tm32UIa3+MLO+9zGnJIsGuzRJIN/s+LZLgp2wE1JFR+mdA8PjtVfkyZr9TYbBWnMj
         NvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=umzZaYOF+dL4hqvZe222a+3Qiotff+3RWBjwx3Fvnt4=;
        b=g96ufMnurSMySLs8hwKZvRZwFGi3lo2RyJtWGU7ZGr+qmbNHvMIuTFMus8qS2j2A8I
         m0E0LmzfGiTuw8+tZaywjDLz0w6mEm6itzj2872XsKOLveNsVL14Ecgj61nqxo/PHaDX
         8hZ9RhTFV3emb4/XjqD463Hh8I5xrfWA+WZkSY8yHjD1XEnfZqCQcQPlubJtwM/4Zf1g
         iOTy/sM3zqTqPjBpomiQfefRVm0KxhfWl4XRTvNiJGpc9VRPDc6rMwFtLZ3ux4lby9kM
         zGpGGo8noQujfye++KPKef9RvBkUjm1L72crdWK8OVcMemrkuNAwX6z0H0d26W9nW4HE
         lmTg==
X-Gm-Message-State: AOAM531rnhHw5eDk0ou3uQGyJ8jON9nB7cDBSr8gy7GIgQF4YZHIBznU
	R9Gbk9ccOv8F6xLy2SP/rI2L57+/2vo=
X-Google-Smtp-Source: ABdhPJxssPUGhndiwjvz9/qWgGyDLsK1FhEYIxOvKrvOel4CvzIUJ9EdGcAUsGyMbjSM0ltVN7QkZA==
X-Received: by 2002:ac2:4ad9:: with SMTP id m25mr48044693lfp.193.1638190786239;
        Mon, 29 Nov 2021 04:59:46 -0800 (PST)
From: Anton Belousov <blsv.anton@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anton Belousov <blsv.anton@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [XEN PATCH 0/1] Add support for SMBIOS tables 7,8,9,26,27,28.
Date: Mon, 29 Nov 2021 12:59:28 +0000
Message-Id: <cover.1638190663.git.blsv.anton@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This update is done to improve virtual machine stealth from malware. There are AntiVM techniques that use WMI-queries to detect presence of this SMBIOS tables. Example: "https://github.com/LordNoteworthy/al-khaser/blob/master/al-khaser/AntiVM/Generic.cpp"

Anton Belousov (1):
  Add suport for SMBIOS tables 7,8,9,26,27,28 to improve virtual machine
    stealth from malware.

 tools/firmware/hvmloader/smbios.c       | 146 ++++++++++++++++++++++++
 tools/firmware/hvmloader/smbios_types.h |  76 ++++++++++++
 2 files changed, 222 insertions(+)

-- 
2.25.1


