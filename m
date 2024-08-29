Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A29964299
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 13:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785660.1195144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjcyI-0003xk-FF; Thu, 29 Aug 2024 11:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785660.1195144; Thu, 29 Aug 2024 11:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjcyI-0003us-CT; Thu, 29 Aug 2024 11:05:46 +0000
Received: by outflank-mailman (input) for mailman id 785660;
 Thu, 29 Aug 2024 11:05:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ugx=P4=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sjcyG-0003um-Hm
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 11:05:44 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1e704bc-65f6-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 13:05:42 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c0ba23a5abso496456a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 04:05:42 -0700 (PDT)
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
X-Inumbo-ID: a1e704bc-65f6-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724929542; x=1725534342; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QAxJPme2nq5IE9WRfCabt2OHBetHDLSVy8OJAqrdbJQ=;
        b=LC4jXyGVx67ho6TUoA3nuB2bNUn+4X61rBJPB2o5SJcUaDWmmJ6x1s0ePWYsq+5FTZ
         PBBL1FlVKA4PEIsNsZMQ1JRbqS1qgFFdlSttsTiyrcc1pzHGY2/yU5hP9e0g4RWscJRW
         plMzAuI5UbE9eIsxLF9u+DICmOL1FGbbnpRVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929542; x=1725534342;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAxJPme2nq5IE9WRfCabt2OHBetHDLSVy8OJAqrdbJQ=;
        b=GvoIfBwUoD5qJP15JJyOBCI90CHyYaEgMOmP8FK6R24oEsvp4rs2T6lj2jVJ9W1bL3
         FUI9x004VWe5Fj5VDJ6Hm0wGooiKajYuiNy+N7masFVa9qHej56zJdP/l3C/8ReHYOeH
         Px+SUo5UQnBhMmR9XWpy4n7TtcNtuOr1YEEP5SkBZMGhc+YhzHUCioTE9iQwxNld3Yuv
         U9E4gzo7/uQjgp8GsT3b5Yhd/CxIuvSPVfzQj+fr+Cy7/B8ndGfmj92VGuLTQb2gTSSf
         H6hepr1/Dwm/qUi9+hGVLk3zs2xAzV0HOSNSQhDw1/G29xlfx5lTZWavDmXTxBcioKtW
         wQsQ==
X-Gm-Message-State: AOJu0YxbUn7wyMpmAo1Q7eps3/KcU9Mg3zHKhlDs85bTNH+Zxe5n2iZa
	Qw0zHi2guXekkT0A//0YWwsCP+nMReOBdmX5gTY0FiESRLTHyvX4zRkpEtzR1NX2QoeKJmajHpE
	0rbQ30q/7G+JC0hcTaMA9yN2uPfCd/4fn9UGuXvjr1QVtDE5y
X-Google-Smtp-Source: AGHT+IFOBaS1lHlfCMBMY8Zj9qkS7ulQsKiRRRC0Qr+J5necsE4L9rHv2LYTHFVIJj9lrZWpoGtFEzcNWu4en+rUAmY=
X-Received: by 2002:a17:907:7208:b0:a86:94e2:2a47 with SMTP id
 a640c23a62f3a-a897f835caemr201372066b.15.1724929541268; Thu, 29 Aug 2024
 04:05:41 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 29 Aug 2024 12:05:05 +0100
Message-ID: <CAO-mL=y+AGD7Yw2WNK7GWKBEYvcHXTHFbRSSJLFREHMG_KGwZg@mail.gmail.com>
Subject: Call for next release manager
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009223e90620d07402"

--0000000000009223e90620d07402
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'd like to thank Oleksii for his hard work as the release manager for 4.19.

As we prepare for our next release, we welcome any interest from the
community in becoming the next release manager.

Feel free to reply directly with your interest, or you can raise this in
the community call.

Many thanks,
Kelly Choi

Community Manager
Xen Project

--0000000000009223e90620d07402
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;d like to thank Oleksii f=
or his hard work as the release manager for 4.19.</div><div><br></div><div>=
As we prepare for our next release, we welcome any interest from the commun=
ity in becoming the next release manager.</div><div><br></div><div>Feel fre=
e to reply directly with your interest, or you can raise this in the commun=
ity call.=C2=A0</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>M=
any thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"col=
or:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136=
,136)">Xen Project=C2=A0<br></div></div></div></div></div></div></div>

--0000000000009223e90620d07402--

