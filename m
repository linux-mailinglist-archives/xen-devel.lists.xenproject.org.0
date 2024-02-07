Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D2984CD65
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:56:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677722.1054515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjLO-0006j4-Iu; Wed, 07 Feb 2024 14:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677722.1054515; Wed, 07 Feb 2024 14:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjLO-0006h1-FB; Wed, 07 Feb 2024 14:56:10 +0000
Received: by outflank-mailman (input) for mailman id 677722;
 Wed, 07 Feb 2024 14:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvxy=JQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rXjLN-0006gr-NG
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:56:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06501841-c5c9-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 15:56:08 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a30e445602cso378717366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:56:08 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 m8-20020a1709066d0800b00a3785efe1c4sm840290ejr.85.2024.02.07.06.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 06:56:06 -0800 (PST)
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
X-Inumbo-ID: 06501841-c5c9-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707317767; x=1707922567; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKhbHBSZ0QAOAy6CUsvXikLiOFRiYlat1iOA7P+iYBc=;
        b=Uy5l0PldsFzKOynautWQgm6Y2piPym9fIvfstyxj/7JCWgaMnfOkKZEk8tEi1V1zRr
         IsMnai06LD4l51Mu2usuhNJEoq5/yz78y6Q+OuuuJ95CG9E8vNTj0weXzA2xea+uXi0q
         fE4OzujmXhGehQeGfUkVyIVJDrrK85jupp6p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707317767; x=1707922567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKhbHBSZ0QAOAy6CUsvXikLiOFRiYlat1iOA7P+iYBc=;
        b=REidBXBV9W0Xl32mATrAKVb66dGnzWVHqVmGp0FudJ56R2kFzSLs3Nz7RxOWlD0DGn
         jUbJNJ/fw858+NHNQfvTY7lrrRrngqVl9yRcN+JRR8FJH8c3vavQXiceTsKoJOGrdpKl
         2ymWELNGl+I3VYDesauWeqrHkkrGry8BJE7F+OdNdbahoOiM0X5HoIg6FNxk69oF9eL5
         JQJalVBEBfl9MSERTNsXLX4NwEHSo8dbzPsYtV6lJIMCzIlkyy+IykgaNj9jZAJuXkjt
         XE7ugQdJdjFQhsRg2tL7N5z4SM9NNOzG0e4g2WT/Zlxmp+ZJygV51AomfW4Blz9NbiVI
         YYpQ==
X-Gm-Message-State: AOJu0Yw0z+GgMWUa4CMjZw5kur81sFp8i890oDHfuurGUGYX1+dkWCR4
	Bs2RDZt9ug7+fPir+rWjRZMLfxEpnplFgy4b82fXU+D/Qg7AMcHvf+dY6ukaYodgySeSyGbCx2d
	c
X-Google-Smtp-Source: AGHT+IE+QavObo6WXUZV2GK0jjcNLqNq2ESEm2T1esia4XHziRsF1cQwIaDXGQ7D7vodLTPeNhisSQ==
X-Received: by 2002:a17:906:f910:b0:a38:567a:6574 with SMTP id lc16-20020a170906f91000b00a38567a6574mr3287765ejb.5.1707317767385;
        Wed, 07 Feb 2024 06:56:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5e49uwKzyqKNvvQX+thy+cmHqjm4W6nMXLX4YG6juO7WiK3fZPfZbc4/fVohlExFQE77CjaqpNeb7MPZ1EFtexlOybrJwKWeBzNVeusfRVlgPH6MeEE6DpkJ3E3OSYxZVGRHkT/AFFN0+vVp8s1Nhv5QZg+yiwYAOya29fmIHJkvI6mwvNDzU/IP7OoyJpBka2WjO8UJ/ECHmw5Q9YP3oayuzPED+SajrJRcp8wMG1yAgOutQ2YCIiv1kxDXPCgJUQulhLPTET8Awbu5+nrrKGDAR9j3wxosC4FQjXGMQ4x4NKHnuylPOzCecAhtJzjDR0zGo3htJzy5QN2UQSAjkOHcD9OF6t8/yYyPf26ZkmEMuKr5ASFTMMTCcMEXiHWYOAdPROtZ3MdsU4JS91bvjAPghX79vNORAOHgnZCpSjYuzVct8lGS5MzlzauhkYaHerjhmkYw5y+NwVF9I4I+3VBmAkdDxcXs7jArJ4PCb5zWeCWb7dr0EFTPHwB17n5Sl0KHBJfQseth6nKCR2ZDHvLlbUe0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v6 0/3] xen: introduce Kconfig function alignment option
Date: Wed,  7 Feb 2024 15:55:44 +0100
Message-ID: <20240207145547.89689-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series adds an additional Kconfig option for the per-arch
code alignment.  Such alignment is to be used in all assembly code
symbols and C functions unless specified otherwise.

Last patch also uses such alignment in order to guarantee enough
distance between function entry points, so that there's always space in
order to do the instruction replacements required by livepatch.

Thanks, Roger.

Roger Pau Monne (3):
  xen: introduce Kconfig function alignment option
  xen: use explicit function alignment if supported by compiler
  xen/livepatch: align functions to ensure minimal distance between
    entry points

 xen/Kconfig                         | 22 ++++++++++++++++++++++
 xen/Makefile                        |  1 +
 xen/arch/arm/Kconfig                |  1 +
 xen/arch/arm/include/asm/config.h   |  3 +--
 xen/arch/arm/livepatch.c            |  2 ++
 xen/arch/arm/xen.lds.S              |  4 ++++
 xen/arch/ppc/Kconfig                |  1 +
 xen/arch/ppc/include/asm/config.h   |  3 ---
 xen/arch/ppc/xen.lds.S              |  4 ++++
 xen/arch/riscv/Kconfig              |  1 +
 xen/arch/riscv/include/asm/config.h |  1 -
 xen/arch/riscv/xen.lds.S            |  4 ++++
 xen/arch/x86/Kconfig                |  1 +
 xen/arch/x86/include/asm/config.h   |  3 +--
 xen/arch/x86/livepatch.c            |  4 ++++
 xen/arch/x86/xen.lds.S              |  4 ++++
 xen/common/Kconfig                  |  5 ++++-
 xen/include/xen/linkage.h           |  5 +++--
 18 files changed, 58 insertions(+), 11 deletions(-)

-- 
2.43.0


