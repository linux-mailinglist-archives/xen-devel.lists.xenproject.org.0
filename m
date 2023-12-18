Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1117816805
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 09:28:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655701.1023430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF8yV-0005wS-4E; Mon, 18 Dec 2023 08:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655701.1023430; Mon, 18 Dec 2023 08:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF8yV-0005tg-1W; Mon, 18 Dec 2023 08:27:43 +0000
Received: by outflank-mailman (input) for mailman id 655701;
 Mon, 18 Dec 2023 08:27:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E1zl=H5=bounce.vates.tech=bounce-md_30504962.6580027a.v1-1891faa1f0cd4165864c7527081f5c54@srs-se1.protection.inumbo.net>)
 id 1rF8yU-0005tY-5y
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 08:27:42 +0000
Received: from mail186-15.suw21.mandrillapp.com
 (mail186-15.suw21.mandrillapp.com [198.2.186.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dfffffd-9d7f-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 09:27:39 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-15.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4SttHG3vgzzPm0PS8
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 08:27:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1891faa1f0cd4165864c7527081f5c54; Mon, 18 Dec 2023 08:27:38 +0000
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
X-Inumbo-ID: 4dfffffd-9d7f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mandrill; t=1702888058; x=1703148558;
	bh=DE/IAiWNoIP0sxSwAH4FpSFwG4oZ+DXaMs/NeHMvJdg=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=RsNKDO9raUgadUhaeEHGBp2bS0vvUNU1b4Wd/ON//wcQVsAeN44jxjTy2DCYsqcTb
	 OEzo8iwPnvxjNVqaPkkr19P7z0CPFlMqIlX6PpEB0m7/vJ93sjeNoxrvUQ4ncVSYVG
	 1X+T1z9IMqGPpt2/BjsENTQ9cvDVRsLvEneCekJ4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
	s=mandrill; t=1702888058; x=1703148558; i=yann.dirson@vates.tech;
	bh=DE/IAiWNoIP0sxSwAH4FpSFwG4oZ+DXaMs/NeHMvJdg=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=fEVj+lo5ldd2HQTBGGgOW+xP4mwEsUxinSQE3bQB5qrffxd/BngmMk7Nk0h5UDM6m
	 zRsCiNBTWR165OqfnskAiIpMLiziGWvLdcV+7U17tSbeedJveTDA4npSAreyKMNSDF
	 C63eBNJu3ebBEnmFIZJlFpB4x5raljjWqum+GcrQ=
From: Yann Dirson <yann.dirson@vates.tech>
Subject: =?utf-8?Q?Rust=20Xen=20Guest=20Agent=200.3.0?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1702888057779
Message-Id: <59441526-c583-44b2-aa48-f5a81eeb9f08@vates.tech>
To: xen-devel@lists.xenproject.org
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1891faa1f0cd4165864c7527081f5c54?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20231218:md
Date: Mon, 18 Dec 2023 08:27:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

A new pre-release of our guest agent prototype written in Rust is
available, numbered 0.3.0 [1].  Identified issues and work to be done
are tracked in Gitlab issue tracker [2].

As always, feedback will be greatly appreciated!

Highlights:

### new features

* available and total guest memory are now collected in FreeBSD guests
* command-line flags `--stderr` and `--loglevel` were added to help
   troubleshooting

### behavior changes

* logs are now sent to syslog by default on Unix-like OS

### bugfixes

* the agent does not require the `libxenstore.so` symlink typically
   coming from Xen development package, only the runtime library
   package is now required
* VIF hot(un)plug is now properly handled

### other noteworthy changes

* executables and packages for supported guest platforms (currently
   Linux/Glibc and FreeBSD, both for x86_64 guests) are now available
   from Gitlab CI pipelines
* APT repositories (though not signed) are now available from Gitlab
   CI pipelines
* CI pipelines now testbuilds every commit in a merge request


[1] https://gitlab.com/xen-project/xen-guest-agent/-/releases/0.3.0
[2] https://gitlab.com/xen-project/xen-guest-agent/-/issues


Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

