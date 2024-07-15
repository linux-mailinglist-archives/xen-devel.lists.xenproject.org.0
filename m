Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B829315F0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 15:40:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758902.1168429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLvg-0002rQ-TL; Mon, 15 Jul 2024 13:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758902.1168429; Mon, 15 Jul 2024 13:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLvg-0002pv-QV; Mon, 15 Jul 2024 13:39:48 +0000
Received: by outflank-mailman (input) for mailman id 758902;
 Mon, 15 Jul 2024 13:39:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TD6x=OP=bounce.vates.tech=bounce-md_30504962.669526a0.v1-011346cb18ff4100918e1fb21664f6e1@srs-se1.protection.inumbo.net>)
 id 1sTLvf-0002pp-A7
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 13:39:47 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b226f91c-42af-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 15:39:45 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WN3GS0Y9Pz6CQ6xx
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 13:39:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 011346cb18ff4100918e1fb21664f6e1; Mon, 15 Jul 2024 13:39:44 +0000
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
X-Inumbo-ID: b226f91c-42af-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721050784; x=1721311284;
	bh=7BZFiptbAmfw2jDuuV5ePzPyMLA9YiFt7igDQO81heI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ktBdLjgyLjiyJ755+y70iIHfdXtTaLI5+rabDsggp2polVjdz0xc6PqHwrSM8U1nu
	 nqsJH0IhhzyhHdc424NZTtWaGT764L5CqCRmknItf/QFDPTvqd+nEl8Z2ZRTeYM+IV
	 kmVo/J+d7AgDr32V2ypGBFv4IkfOYfuW/YH568mFp6heO3NrciZPi/PVn3n/aQ5Npq
	 QZQAlbiU6eJL29mwAxPQgwbaYUQemI13ZIsQdmeC8VgV4zyV1IvXn1Bout6+KXL8B0
	 mrEkn+4n9E5lfF5KKe+fRi1UFcciTbFdZP4Cg2n1xOP/kmQAB2M6QyozN6kFB1/24H
	 f7viljg1z5wXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721050784; x=1721311284; i=anthony.perard@vates.tech;
	bh=7BZFiptbAmfw2jDuuV5ePzPyMLA9YiFt7igDQO81heI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aY5t+1pohW/7iIUxnGp5lTCShtGu+r5tcLczS88e6Z/EshD7FJXoHRp16jQgGZ1rq
	 xx+T51880VvCjJ1WHJaV/1SnjgI1Ufne0cfq8BF0UwM1ulZndGtNt+VqC04rycxKFO
	 4XOrhXX2B8zfte/yNzBV7OOJR2EgRWsvXPc7Gx4VLXysPMFGUw68Lxj31Am/aiz/nn
	 4Q8UnJDtoVLLFHisscDw+DOXpr6SGNO4AWyhapNTVStzUUxwbT4giaw3ALZeep+f2H
	 nrLRT1/hTuiIgqKQIf3QZRQPKMjrJXLK79F7Dn5zoBdKc+18TDExfVu7qxwJOCQfaE
	 MorEBlnKK6vCQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2021/12]=20CI:=20Refresh=20and=20upgrade=20the=20Fedora=20container?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721050782673
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-Id: <ZpUmnrsLD5s0KaeM@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240713181005.3363912-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240713181005.3363912-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.011346cb18ff4100918e1fb21664f6e1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240715:md
Date: Mon, 15 Jul 2024 13:39:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Sat, Jul 13, 2024 at 07:10:05PM +0100, Andrew Cooper wrote:
> Fedora 29 is long out of date.  Move forward 5 years to Fedora 39.
> 
> Inlcude all the usual improvements.  Rework the container to be non-root, use
> heredocs for legibility, and switch to the new naming scheme.

"clang" as been removed, but it's not mention in the commit message. The
other changes are kind of "the usual improvement" yes, as been done to
other containers (libaio, nasm, ...).

The patch is missing an update of the "containerize" script.

> diff --git a/automation/build/fedora/39-x86_64.dockerfile b/automation/build/fedora/39-x86_64.dockerfile
> new file mode 100644
> index 000000000000..e2048a437581
> --- /dev/null
> +++ b/automation/build/fedora/39-x86_64.dockerfile
...
> +
> +    dnf -y install "${DEPS[@]}"

You might want to add --setopt=install_weak_deps=False to avoid
installing "git" for example.
When running the original command by hand, `dnf` want to install those weak deps:
    Installing weak dependencies:
     apr-util-bdb
     apr-util-openssl
     cryptsetup-libs
     diffutils
     git
     libbpf
     libxkbcommon
     mercurial
     perl-NDBM_File
     python3-fb-re2
     python3-pip
     qrencode-libs
     subversion
     systemd-networkd
     systemd-resolved
And comparring the list of deps, these extra pkgs are installed because
of weak deps:
    apr
    apr-util
    dbus
    dbus-broker
    dbus-common
    device-mapper
    device-mapper-libs
    git-core-doc
    kmod-libs
    libargon2
    libseccomp
    libserf
    perl-Error
    perl-File-Find
    perl-Git
    perl-TermReadKey
    perl-lib
    python3-zombie-imp
    re2
    subversion-libs
    systemd
    systemd-pam
    utf8proc
    xkeyboard-config

So, probably only "perl-File-Find" (can be written "perl(File::Find)" I
think as well) might be needed, but only for docs/ I think, from the
previous email.

It seems I go from 1.26GB to 1.18GB without those weak deps.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

