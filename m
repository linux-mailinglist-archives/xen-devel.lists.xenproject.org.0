Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 356ED9F6811
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 15:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860442.1272459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNuq5-0000mB-Ty; Wed, 18 Dec 2024 14:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860442.1272459; Wed, 18 Dec 2024 14:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNuq5-0000jr-RP; Wed, 18 Dec 2024 14:15:49 +0000
Received: by outflank-mailman (input) for mailman id 860442;
 Wed, 18 Dec 2024 14:15:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3PCh=TL=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1tNuq4-0000jg-GS
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 14:15:48 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92f2df13-bd4a-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 15:15:46 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso10789048a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 06:15:46 -0800 (PST)
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
X-Inumbo-ID: 92f2df13-bd4a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1734531345; x=1735136145; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7BnpisuMaAEwGQgH0Urzk5wgzIfUAJbgOtTfBe2eaTo=;
        b=LI1NhTpYp6tuI7oIvEETQ3fVUH43q3DynaYo8Pn3zhnizq+IQcyTiiT/eBfoaGqWKz
         tzRF8i7EPhtV6/eJQjmp5INOMwGs+HWS828dWll5Wm+raXPIyl0R/QuLKeHy/Cvk4Jom
         7zWKX+ZfXTFhl35ddiIi6auXpPxzi87lR6bMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531345; x=1735136145;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7BnpisuMaAEwGQgH0Urzk5wgzIfUAJbgOtTfBe2eaTo=;
        b=QljOmJu4ahWN6D6W4t2PDZg2d1+A/r/QheedxiZO5N7uKZcf3EdT3cInnlRK0kghlD
         EN3scTSOxzOUqQ5H1J7wIlIcvEf1UyojucZOflWn7HksxsSIktl3ygZGeAD+ptNDPtbG
         JaCPWNto3rzQ4898fLg+RDnBaZDM1vr2h9rBe2R9UPMIqnWw/ThKYaMR5ZkpOC7dR1QD
         rAAgyOpL5EOtfXF57twEvvHoYXZGJ5EZ9r3raeHXyv/wVpCFX9SlZj1eW4WzbGoz2q0w
         E6G8bD/wv60DrGT38p7j5MP5jHdSsz6kc97X9sfjSrClO+pmlZqwNpLzPOk2bOYNu+jk
         RxPQ==
X-Gm-Message-State: AOJu0Ywx+K2GvnY9E6Onfy6liKTGIjnT7JMEWO4xDOUJ4SWXZdSl3Iny
	L7kl7ZjeV/SXO+OSuyU+JJAn7AjXyClbh3/K1ltAPk0VmWyVBr7nn1kg7FoRxQ/iMNrDl94Q9gZ
	Li4VJPK/HBd1RoBxo4mBgpkze5O8wz093MTLNVoFOcIxDjlNA
X-Gm-Gg: ASbGncsBgFG4/cLU1w8vbubx5sK0+0XBLlAdqztX41ifpD+EfRrLHCERLaTsEt1IGB/
	4UjQOK5YRgpaI8YbbnvXaU5ZrFmzMVjHe7EDSGF9xXOUuXqceJXl5+P+M9yjVFDJLBjty00rm
X-Google-Smtp-Source: AGHT+IGeFKN9PCECWNun/i2tvqIjtjjyCGbL8/EBOQlAuGPB6p0yF8vP9E78ZLia1lzKVABSn2mCmlRdqNH4p6ag3jc=
X-Received: by 2002:a05:6402:434b:b0:5d4:34a5:e2f4 with SMTP id
 4fb4d7f45d1cf-5d7ee404944mr2741543a12.31.1734531345268; Wed, 18 Dec 2024
 06:15:45 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 18 Dec 2024 14:15:09 +0000
Message-ID: <CAO-mL=zugEZDqELGLQs=ne3LL=YTVJLJmXXyb4wbmuQbP+7p9g@mail.gmail.com>
Subject: January 2025 community call postponed by a week
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000afdd9a06298c0c80"

--000000000000afdd9a06298c0c80
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please note the next community on Thursday 2nd January will be
postponed to *Thursday
9th January 2025.*

Thanks,
Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--000000000000afdd9a06298c0c80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>Please note the next=
 community on Thursday 2nd January will be postponed to <b>Thursday 9th Jan=
uary 2025.</b></div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Thanks,</d=
iv><div>Kelly Choi<br></div><div><div style=3D"color:rgb(136,136,136)">Comm=
unity Manager</div><div style=3D"color:rgb(136,136,136)"><a href=3D"https:/=
/xenproject.org/" target=3D"_blank">Xen Project</a><br></div></div></div></=
div></div></div>

--000000000000afdd9a06298c0c80--

