Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE2A914FD3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 16:24:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746695.1153824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkbF-00031k-Kc; Mon, 24 Jun 2024 14:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746695.1153824; Mon, 24 Jun 2024 14:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkbF-0002z2-Hb; Mon, 24 Jun 2024 14:23:17 +0000
Received: by outflank-mailman (input) for mailman id 746695;
 Mon, 24 Jun 2024 14:21:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IYJk=N2=dreamsnake.net=aad@srs-se1.protection.inumbo.net>)
 id 1sLkZV-0002wA-0d
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 14:21:29 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a5c938c-3235-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 16:21:26 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7954dcf3158so244965985a.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 07:21:26 -0700 (PDT)
Received: from smtpclient.apple (pool-100-6-75-225.pitbpa.fios.verizon.net.
 [100.6.75.225]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef30ef9sm34454366d6.76.2024.06.24.07.21.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2024 07:21:24 -0700 (PDT)
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
X-Inumbo-ID: 0a5c938c-3235-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dreamsnake-net.20230601.gappssmtp.com; s=20230601; t=1719238885; x=1719843685; darn=lists.xenproject.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vyM7SpnmS6E42kucj9mVuoblNwWj8XmJP/H7ZZM8ROY=;
        b=hH1JPz2MdKK2PSTD9IpuZfN6ePhQ/M91cinzgAbYbiSG8LaHZ+QHh2SoENzI8HJWW9
         Rqs1eO4pvAn9sUptCgmdUG4xaQGCdvBPe7sZfbfwvAv7y5YVbGf/+Ctb0H05lUgPxXpb
         lmTI5fdpooAwbXWHx1PErcFG5VzBsGPCw7svYkgzLIOZvz4Ea7+JGTPmqAuYvrBQUALX
         FDkztveey6KF+CJmUNBY8cCpnlzAImAX7YhhMHknlCGtL3MWS80rQry6KDKrFmfquQ+u
         /Q68A0ouUbDN7edujCrjnf3k9er7eeKsrVr7CBWAx9yQwyrUPPcKfaQIvAfUtVAj2n5V
         ooSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719238885; x=1719843685;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyM7SpnmS6E42kucj9mVuoblNwWj8XmJP/H7ZZM8ROY=;
        b=FKtbRyTwCtaJrMpOu/RKVpzL1rpTqHokhepdM0LHCv1uz3D77M1mHL6D41dmQU1CTV
         To2Q3xSSKffE8aK31USdpFvLFB+tQAUueBpPnIvQCuiTmqCLdKwb4oF80IbNZiuopux6
         6jzM5KxPy7veOD+ZXhiMTuvOVXY2nz9U/MZ4RTO+2Z9rTnaq6N5naze0NWXOuruwvGwm
         Wh46xN9am1MTONgi2mOZjht1ASILsQPrEf4KJu0rgH5US1ZTCb8Xfl3ywKFxYHkGpwql
         UO82Clsswleg6T6ZChfqi5xSDL6F4M+8k35faXhqg3rVkj8vjjTmT+tc1RIqKeHVSfxV
         BfZg==
X-Forwarded-Encrypted: i=1; AJvYcCX8dN3Zg5pl0WsuUUCcajMRG4gZpirTECBWTsNv60Ux+HCjboZYouaHJBlB1YTPa4i2+Zw6gfR1obz19yHzhIIY4PlMeVasr9vNqqkvSTY=
X-Gm-Message-State: AOJu0Yy/C1njFaY2NLMCHP5n1LnP6nhBTXDPI2xBTIJ+JwY9sYH0T/ZS
	fbOzN6robqBXccP/Fmn83SIZYfNJmGcZBa7Ycw0kW2pNssKjVDy8wNTKOFSu
X-Google-Smtp-Source: AGHT+IHXYJoHqe+lVWeHEvpL31lPzpeMHrumwGR4d2Z3MDIXugyalKxqFS2lKuqDdFuxVAxlh+r7+g==
X-Received: by 2002:a0c:f594:0:b0:6b5:50ba:42c3 with SMTP id 6a1803df08f44-6b550ba45a4mr31114516d6.43.1719238885298;
        Mon, 24 Jun 2024 07:21:25 -0700 (PDT)
From: Anthony D'Atri <aad@dreamsnake.net>
Message-Id: <1E6AF1FD-5E2B-49D6-B42E-1BEA85BA7E93@dreamsnake.net>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C8799745-5BE2-4755-A5E5-5C731F6565EF"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [axboe-block:for-next] [block]  bd4a633b6f: fsmark.files_per_sec
 -64.5% regression
Date: Mon, 24 Jun 2024 10:21:13 -0400
In-Reply-To: <Znl4lXRmK2ukDB7r@ryzen.lan>
Cc: Christoph Hellwig <hch@lst.de>,
 kernel test robot <oliver.sang@intel.com>,
 oe-lkp@lists.linux.dev,
 lkp@intel.com,
 Jens Axboe <axboe@kernel.dk>,
 Damien Le Moal <dlemoal@kernel.org>,
 Hannes Reinecke <hare@suse.de>,
 linux-m68k@lists.linux-m68k.org,
 linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org,
 drbd-dev@lists.linbit.com,
 nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org,
 ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org,
 dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org,
 ying.huang@intel.com,
 feng.tang@intel.com,
 fengwei.yin@intel.com
To: Niklas Cassel <cassel@kernel.org>
References: <202406241546.6bbd44a7-oliver.sang@intel.com>
 <20240624083537.GA19941@lst.de> <Znl4lXRmK2ukDB7r@ryzen.lan>
X-Mailer: Apple Mail (2.3774.600.62)


--Apple-Mail=_C8799745-5BE2-4755-A5E5-5C731F6565EF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

S3610 I think.  Be sure to use sst or the chassis vendor=E2=80=99s tool =
to update the firmware.

> On Jun 24, 2024, at 9:45=E2=80=AFAM, Niklas Cassel <cassel@kernel.org> =
wrote:
>=20
> SSDSC2BG012T4


--Apple-Mail=_C8799745-5BE2-4755-A5E5-5C731F6565EF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">S3610 I think. =
&nbsp;Be sure to use sst or the chassis vendor=E2=80=99s tool to update =
the firmware.<br id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote=
 type=3D"cite"><div>On Jun 24, 2024, at 9:45=E2=80=AFAM, Niklas Cassel =
&lt;cassel@kernel.org&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline =
!important;">SSDSC2BG012T4</span></div></blockquote></div><br></body></htm=
l>=

--Apple-Mail=_C8799745-5BE2-4755-A5E5-5C731F6565EF--

