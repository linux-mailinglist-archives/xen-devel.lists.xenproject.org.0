Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F40B19325
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068287.1432299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiUkU-0001Rm-J7; Sun, 03 Aug 2025 09:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068287.1432299; Sun, 03 Aug 2025 09:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiUkU-0001Oi-Dn; Sun, 03 Aug 2025 09:11:22 +0000
Received: by outflank-mailman (input) for mailman id 1068287;
 Sun, 03 Aug 2025 07:56:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oNBg=2P=grueninger.de=foss@srs-se1.protection.inumbo.net>)
 id 1uiTaU-0000E0-0Q
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 07:56:58 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c7e33ad-703f-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 09:56:55 +0200 (CEST)
Received: from [IPV6:2001:9e8:a0be:6a00:96e6:f7ff:fed5:1fce]
 by smtp.strato.de (RZmta 52.1.2 AUTH) with ESMTPSA id I5c4521737usMHU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Sun, 3 Aug 2025 09:56:54 +0200 (CEST)
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
X-Inumbo-ID: 6c7e33ad-703f-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; t=1754207814; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=l7/gIZbqhbUd/Jek7SDRLb3HCoGVbyb5+WFOyuRgOw6A33WjmludgjkXU9bNxDX1Cu
    fQ8vivlLCYoPKrtkOO7jRWYUAxrIYHo7NYo5GjFOnbROWUhIPs/VKQSOyAZLi8FPNiI+
    F00fcfg6jTACs0oFoon6aGfbU+vWvALRXBIGNrWjKiELil5/HD7o89xLh0S27NHen5yL
    Vd606J5AcdxfCwdsgWEkDtxkMOi1jzeC6VnoOf4n/gdvUKC5MLaOk9DgQ1G/pxwi8rjn
    OajiuHt95VKwwsy0ZL5tIrE14StRdhTMWQzn49Hb3hrpxBjvTj4/2gh+Lna3dE75NvpA
    VgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754207814;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=oxRyrRdMFbMhmCe0eq97BCX9Ag5zxLASFk7yCih8xD8=;
    b=QhQf99972d6oA9vx9kfR4fYSR0qLmGltJWNFfR4OnOqh7UdUC3/71+Dc8u3z0/l6HH
    tbyXWzOM9yoid0ZcfuWw39TFeXbg69YByaUsb7dAEyLfhAKAL13zQ4uw4xneJk4fymxK
    iMjqt/XstPqh68DK025l8Sop9ZDUkm8uldAVrpB45bX6OConI2I1JdPMAbjRioiqV6MS
    HcEpfsVlji+ZljOaUG2lOzVNKWgzwGp45HbgtS5ydakAgFTN2lWoGqTSFWn0ulfBSKbX
    jk8GO8ydl4M6oIsZBkmn9tgTzkcLHjapkFtyO3XbHJoBkhe5mW0+MtCPH4Vdlf0P7jaF
    WiHg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754207814;
    s=strato-dkim-0002; d=grueninger.de;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=oxRyrRdMFbMhmCe0eq97BCX9Ag5zxLASFk7yCih8xD8=;
    b=rSyl7eU2W6yjoqmKZ4pKvmz7QaS7vTg/S1p5fshtRHqskT/tC8/+yhpBQ/0zrgSoYk
    XBQlSynlqU7yjSy9fHJWAC+pduK2S14+0iM6A9xOB7PyWhqZSXIuE05YQatjCSUP2Yuz
    RSzINemRCZpFRLGoMrhKi9+5lflAb/T88A3Lgvf8lfkoU1mKL5v+beWwqJijMm1QcN/U
    ptbqOZwI+abEdwcgI0A+TV5reZU3mCTXBuXYBAq/WwEDLBqPehBuHWWM+kHSWR0II1JQ
    hmdcqQGx0SekiuYRoD+oUHOZ7b504zdortEEQvYC61N0TE+82qY98X4A1PwrTQOmwGi8
    Gnsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754207814;
    s=strato-dkim-0003; d=grueninger.de;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=oxRyrRdMFbMhmCe0eq97BCX9Ag5zxLASFk7yCih8xD8=;
    b=5RK8Bsmf7+FSi5kS3oJ12SycQLvkL5XMLtqrbEMbBIhKyRe46XnoDKjvOa1ArzUoEj
    ZKf0jPz+I71qVJaDK2Bg==
X-RZG-AUTH: ":KmMXZmCvaeohc7VigFhGhYQlaG+8Y2WlGQK9xTU69ffPMhoFOSeiO+VI+ciLbGc4IjutRIFZHx2sq+HYevetoU0qrrbpApDaHjU="
Message-ID: <d49ad645-35dd-4bd2-b166-d1803b2d95ba@grueninger.de>
Date: Sun, 3 Aug 2025 10:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xen-devel@lists.xenproject.org
Content-Language: de-DE, en-US
From: =?UTF-8?Q?Christoph_Gr=C3=BCninger?= <foss@grueninger.de>
Subject: Fork or replace dependency yajl?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Xen developers,

you are using the dependency yajl (yet another json library, [1]) to 
parse JSON files. The project seems abandoned with the last commit 10 
years ago, the last release over 11 years ago, and 75 open pull 
requests. Packaging yajl requires patches, e.g., to make it compatible 
with CMake 4.0.
There are some forks but none has replaced the old one yet [2].

I think there are three paths forward:
1. Xen could pick a prominent fork and use it as its main dependency.
2. Xen could create a fork of its own, hopefully attracting more people 
interested in an maintained successor of yajl.
3. Switch to a different JSON parser library that remained healthy.

Sure, you could stick to option 4., do nothing an offload the burden to 
fix yajl to distribution packagers.

Xen is an important project and its decision can create momentum that 
might lead other projects.

[1] https://github.com/lloyd/yajl
[2] https://github.com/lloyd/yajl/issues/252

Kind regards,
Christoph

-- 
Most customers will not accept source code with compile errors in it.
                  Dan Saks, CppCon 2016 (https://youtu.be/D7Sd8A6_fYU)


