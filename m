Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2924AC86D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 19:22:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267362.461104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH8dx-0003eD-O3; Mon, 07 Feb 2022 18:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267362.461104; Mon, 07 Feb 2022 18:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH8dx-0003bW-KT; Mon, 07 Feb 2022 18:21:41 +0000
Received: by outflank-mailman (input) for mailman id 267362;
 Mon, 07 Feb 2022 18:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+Gq=SW=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nH8dv-0003bN-PJ
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 18:21:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c89408de-8842-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 19:21:38 +0100 (CET)
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
X-Inumbo-ID: c89408de-8842-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644258098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Yce9W6x79QGe5U5nLNq7SWN19QAgA4n10rhq6HVqPoI=;
  b=Xo6XTathqYM+u/Ux6ziY0/12UFfHKC2qRRS3ot7O8ZPOg6QJ4qtwr9VN
   cnL8rG19M8qwFH1xebvgCkRNknGcbCJ3u3CQMUxZj/+WV1Fzb6XmyQxKD
   jhpIXy/hFcpwPa9r3Y97N5Jui3U+endruFKdIFJAwZaO0gF8qQxXcGq8b
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IO5K9y9HhIqRLEMRP8RRdLEWwEMs3qoeeMmM0zWwGvmSeSY2DoVQ/3VRPI7ZaomF5hSBoLg+s8
 ouc+rqMjDAGGNxsJ4fksurgiKRU87H/WX0A+06sORT8qQMKU9uqTiqNF8Re9s+8lAueGyHbdKk
 IdDFT/z3bXAsz9YPORIKmLLu5Cg40pEvwiFbUoqbGAkay7bi4pBTYBkzam2oYi+Qnm5HCSEHfg
 i6ON6gvXjZEolxAI6wnlMNl0mJSsVPHUcdbUuft30s7cCg2To2pkJEYBxZ7HmY79f/ZOfhtLch
 CiYOSCwQYBrl4VYLY9RubaAJ
X-SBRS: 5.1
X-MesageID: 64075063
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:saou06qTUvFJ9JpLTH9lrsXosmNeBmI4YhIvgKrLsJaIsI4StFCzt
 garIBmOMq6CZjCkctkgaYu28BkBupHWx9MwQFBvqik2RCgS+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24DmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaKfbS0VIa/Fo+g6fzdcOhhhPYYcoLCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKEWvHwm6DjdBPIvR53rSKTW/95Imjw3g6iiGN6AO
 5JGNGIxN3wsZTVGK3goGZZlgt7yvUuncDJa80OeiZIotj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+ov+KaQr6AwxgfJnypKVUNQBQDTTeSFZlCWZf17A
 XAL+CMVoY8e2kiCd8b9dEfgryvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgJ8hMwaWNweHmJzi
 ALQ9z/9LXk26eDOFyrBnluBhW7qYUAowXk+iTjopOfvy/3qu8kNgx3GVb6P+4bl34SuSVkcL
 91nxRXSZon/b+ZWjc1XHnid2lpAQ6QlqSZvt23qspqNtF8RWWJcT9XABaLnxfhBNp2FaVKKo
 WIJncOThMhXU83RzX3UGbtcRujyjxpgDNE7qQQ+d6TNChz3oyLzFWyuyG0WyLhV3jYsJmayP
 R67VfJ5755PJnq6BZKbkKrqY/nGOZPITIy/PtiNN4ImSsEoKGevoXE/DWbNjjuFuBV9zskXZ
 8zBGe7yVilyNEiS5GfvLwvr+eRwnX5WKKK6bc2T8ilLJpLEOCfFEulUbATSBg37hYvdyDjoH
 x9kH5Pi431ivCfWOUE7KKYfcgIHK2YVH5fzp5AFf+KPOFM+SmogF+XQ0fUqfIk8x/ZZkeLB/
 3ecXE5EyQWg2S2beFvSMn0zOqnyWZtfrG4gOXB+N1ifxHV+M52k670SdsVrcOB/pvBj1/N9U
 9IMZ96EXqZUUj3C9jlENcv9oYVueQ6FnwWLOyb5MjEzc4Q5H17C+8P+fxup/y4LV3Llucw7q
 rym9wXaXZtcGFgyUJeIMKqilgrjs2IcleR+W1rzDuNSIEi8opJ3LyHRj+MsJ51eIxv02TbHh
 R2dBg0VpLeRrtZtosXJn62Ns6ygD/B6QhhBB2De4Lu7aXva826kzdMSWeqEZ2mABmb9+aHkb
 uRJ1fDsdvYAmQ8S4YZ7Fr9qy4M45sfu+OAGnlg1Qi2TYgT5EK5kL1mHwdJL5/9EybJusAerX
 l6Cp4tBMrKTNcK5SFMcKWLJtAhYOS34TtUK0ckIHQ==
IronPort-HdrOrdr: A9a23:Eo1Kcq4JKa0Qk4kywAPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.88,350,1635220800"; 
   d="scan'208";a="64075063"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH v2 0/2] xen: Report and use hardware APIC virtualization capabilities
Date: Mon, 7 Feb 2022 18:20:59 +0000
Message-ID: <20220207182101.31941-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Jane Malalane (2):
  xen+tools: Report Interrupt Controller Virtualization capabilities on
    x86
  x86/xen: Allow per-domain usage of hardware virtualized APIC

 docs/man/xl.cfg.5.pod.in              | 10 +++++++++
 docs/man/xl.conf.5.pod.in             | 12 ++++++++++
 tools/golang/xenlight/helpers.gen.go  | 16 +++++++++++++
 tools/golang/xenlight/types.gen.go    |  6 +++++
 tools/include/libxl.h                 | 14 ++++++++++++
 tools/libs/light/libxl.c              |  3 +++
 tools/libs/light/libxl_arch.h         |  9 ++++++--
 tools/libs/light/libxl_arm.c          | 12 ++++++++--
 tools/libs/light/libxl_create.c       | 23 +++++++++++--------
 tools/libs/light/libxl_types.idl      |  4 ++++
 tools/libs/light/libxl_x86.c          | 42 +++++++++++++++++++++++++++++++++--
 tools/ocaml/libs/xc/xenctrl.ml        |  7 ++++++
 tools/ocaml/libs/xc/xenctrl.mli       |  7 ++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c   |  2 +-
 tools/xl/xl.c                         |  8 +++++++
 tools/xl/xl.h                         |  2 ++
 tools/xl/xl_info.c                    |  6 +++--
 tools/xl/xl_parse.c                   | 16 +++++++++++++
 xen/arch/x86/domain.c                 | 28 ++++++++++++++++++++++-
 xen/arch/x86/hvm/vmx/vmcs.c           | 13 +++++++++++
 xen/arch/x86/hvm/vmx/vmx.c            | 14 +++++-------
 xen/arch/x86/include/asm/domain.h     |  3 +++
 xen/arch/x86/include/asm/hvm/domain.h |  6 +++++
 xen/arch/x86/sysctl.c                 |  7 ++++++
 xen/arch/x86/traps.c                  |  8 +++----
 xen/include/public/arch-x86/xen.h     |  2 ++
 xen/include/public/sysctl.h           |  8 ++++++-
 27 files changed, 255 insertions(+), 33 deletions(-)

-- 
2.11.0


