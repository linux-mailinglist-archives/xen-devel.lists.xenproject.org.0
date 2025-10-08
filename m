Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56981BC53AB
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 15:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139660.1474922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UIm-0008Aj-J5; Wed, 08 Oct 2025 13:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139660.1474922; Wed, 08 Oct 2025 13:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UIm-000880-Fe; Wed, 08 Oct 2025 13:33:56 +0000
Received: by outflank-mailman (input) for mailman id 1139660;
 Wed, 08 Oct 2025 13:33:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bWZK=4R=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v6UIl-00087u-5D
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 13:33:55 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e577c2c-a44b-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 15:33:53 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so58038955e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 06:33:53 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fa9d6fb41sm37330325e9.17.2025.10.08.06.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 06:33:51 -0700 (PDT)
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
X-Inumbo-ID: 6e577c2c-a44b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759930432; x=1760535232; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2Kq0ecbrcDKxmZ86GMz8w/l5BGzueOC+AYBMCkW07s=;
        b=pwR6MIYR4kAlGMMJIseVMidHBJaq/YapwVumMeLnfMkqI6rQtCo1sF310kD+9uk53w
         bkvTDcw9xNdjUw9XDwBmwf1p8+yjzOSkhmQwWnWwAdq/AjYoI/Xct+cw1YBeyjxSzsqF
         zEuR1JaAfv+hN5P4zuCiEGKz95XjsBEkuPChE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759930432; x=1760535232;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2Kq0ecbrcDKxmZ86GMz8w/l5BGzueOC+AYBMCkW07s=;
        b=oaZvyKwAsqZzgzCueuiw1TTyBPoiP1q9g+xjQsFXrFpvVDnCFUjPbei5ZpL7bFverL
         fa5N+igECFp8KFcYFHbCF6GtyfID+/FLPsznTWtUbaipRhgUuU7BNVM+uEc9u6IQluEk
         V5EKbaQjyzLenFwTEDoXw6V+tmJj5g3A1fY3twj7CokVT68J8BKw5C1lMVcCMcfw2l70
         7KRskPw4v80DfzxooCXiUP/LnU6rxOGT8z3gZAcPpQRAKsIm330m7ln88MB8Pe5Bap4B
         DdzzDi+qiCikrvZbPjjk7SoAy2zDUbKhSB1oy1wJXdKLtq4R1g6kQDrFcqGjwtuZ+q8z
         sfpw==
X-Gm-Message-State: AOJu0YxhNv2WGCGntzrYvuSx58jAVnf5kRWjWkxGkl3EePlpkwDW+z7x
	YOwDatWgBIhtRUbU+DLcJXieldPw4wRac2tRCWjlFeL0bo9Mdr6iutxkpUsr0yFzZR2cn+625dy
	8G6H9V5pAMA==
X-Gm-Gg: ASbGncvLSvi2B55Ppyue4w4oGuVxXzVCKvE5NLalSySCelHqu328KkQuzjQB+6+J9KS
	0k74wArZWsE5vTL+Q15eUjojcIablQgOa7lD3Nn56/gP1KvveHcgv366ur7tooEVWFlWCaeefmw
	+EEWn02NJeTQdSyoqiTBojmKYexWgCpdoy6FBEIKbgy17GECVo36yv/uZosD8e6+OB+AmDufkin
	6JcedEVGb7q1vvKyN3cTj5knI6EH2wWTCh484a1vKJOJOCd8oEDpape0W8pXWTsI3q6Wg/P3Ldf
	hDll8ePVa9EKaR08fr4WO1I5FTX4pXewUkCu4/8/zyoDbGAdMDJ4ZA4Pnotjhiqt5Xj45x766Jc
	Tpvsv+QxlXUowAfc1t3HQj7ybU4aEiaxI53FS0HJ7hEvsPGQ9NlFsxNnELrZE/c+2/1owPPIKcJ
	8BPUg4nud2bItv
X-Google-Smtp-Source: AGHT+IFx1D1kSArHE9FUJm4IPCRI96naK0Hg0LmH2LGHIzfGkvhFz3Th0Epg2dTaKYYUi9UYocTzjA==
X-Received: by 2002:a05:6000:2003:b0:3eb:5e99:cbb9 with SMTP id ffacd0b85a97d-42666ac410emr2144250f8f.10.1759930432178;
        Wed, 08 Oct 2025 06:33:52 -0700 (PDT)
Message-ID: <e1627855-e7f4-4fe7-8079-68c3a0d488fb@citrix.com>
Date: Wed, 8 Oct 2025 14:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Linux xenfs vs privcmd
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

I'm doing a deployment of Xen on a remote system provisioned with Ubuntu
24.04, and I've found what I'm pretty sure is a bug.

In dom0, to start with:

user@host:~$ ls -la /dev/xen/
total 0
drwxr-xr-x  2 root root     140 Oct  8 20:04 .
drwxr-xr-x 18 root root    4620 Oct  8 20:04 ..
crw-------  1 root root 10, 120 Oct  8 20:04 evtchn
crw-------  1 root root 10, 118 Oct  8 20:04 gntalloc
crw-------  1 root root 10, 119 Oct  8 20:04 gntdev
crw-------  1 root root 10, 124 Oct  8 20:04 xenbus
crw-------  1 root root 10, 123 Oct  8 20:04 xenbus_backend
user@host:~$ ls -la /proc/xen/
total 0
dr-xr-xr-x   2 root root 0 Oct  8 20:04 .
dr-xr-xr-x 326 root root 0 Oct  8 20:04 ..

i.e. no /dev/xen/privcmd.

It turns out that mounting xenfs causes it to appear:

user@host:~$ sudo systemctl start proc-xen.mount
user@host:~$ ls -la /dev/xen/
total 0
drwxr-xr-x  2 root root     180 Oct  8 20:05 .
drwxr-xr-x 18 root root    4620 Oct  8 20:04 ..
crw-------  1 root root 10, 120 Oct  8 20:04 evtchn
crw-------  1 root root 10, 118 Oct  8 20:04 gntalloc
crw-------  1 root root 10, 119 Oct  8 20:04 gntdev
crw-------  1 root root 10, 115 Oct  8 20:05 hypercall
crw-------  1 root root 10, 116 Oct  8 20:05 privcmd
crw-------  1 root root 10, 124 Oct  8 20:04 xenbus
crw-------  1 root root 10, 123 Oct  8 20:04 xenbus_backend
user@host:~$ ls -la /proc/xen/
total 0
drwxr-xr-x   2 root root 0 Oct  8 20:05 .
dr-xr-xr-x 315 root root 0 Oct  8 20:04 ..
-r--r--r--   1 root root 0 Oct  8 20:05 capabilities
-rw-------   1 root root 0 Oct  8 20:05 privcmd
-rw-------   1 root root 0 Oct  8 20:05 xenbus
-r--------   1 root root 0 Oct  8 20:05 xensyms
-rw-------   1 root root 0 Oct  8 20:05 xsd_kva
-rw-------   1 root root 0 Oct  8 20:05 xsd_port

For good measure, I checked unmounting xenfs:

user@host:~$ sudo umount /proc/xen
user@host:~$ ls -la /dev/xen/
total 0
drwxr-xr-x  2 root root     180 Oct  8 20:05 .
drwxr-xr-x 18 root root    4620 Oct  8 20:04 ..
crw-------  1 root root 10, 120 Oct  8 20:04 evtchn
crw-------  1 root root 10, 118 Oct  8 20:04 gntalloc
crw-------  1 root root 10, 119 Oct  8 20:04 gntdev
crw-------  1 root root 10, 115 Oct  8 20:05 hypercall
crw-------  1 root root 10, 116 Oct  8 20:05 privcmd
crw-------  1 root root 10, 124 Oct  8 20:04 xenbus
crw-------  1 root root 10, 123 Oct  8 20:04 xenbus_backend
user@host:~$ ls -la /proc/xen/
total 0
dr-xr-xr-x   2 root root 0 Oct  8 20:04 .
dr-xr-xr-x 291 root root 0 Oct  8 20:04 ..

and /dev/xen/privcmd stayed.


Anyway - /dev/xen/privcmd (and /hypercall) shouldn't be tied to xenfs. 
They should be SIF_PRIVILEGED alone, should they not?

~Andrew

