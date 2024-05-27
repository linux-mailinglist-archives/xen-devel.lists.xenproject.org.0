Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25E8D07A9
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 18:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730894.1136173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcvC-0007EB-6d; Mon, 27 May 2024 16:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730894.1136173; Mon, 27 May 2024 16:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBcvC-0007Aq-3r; Mon, 27 May 2024 16:10:02 +0000
Received: by outflank-mailman (input) for mailman id 730894;
 Mon, 27 May 2024 16:10:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClYa=M6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sBcvA-0007AY-Ua
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 16:10:00 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90ca1256-1c43-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 18:09:59 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6265d3c488so439963666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 09:09:59 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c938502sm504376666b.73.2024.05.27.09.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 09:09:57 -0700 (PDT)
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
X-Inumbo-ID: 90ca1256-1c43-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716826198; x=1717430998; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6jrcUzHGOlskCQ/YF23KTYoqp2ziYcD5a/4kXi7Mv04=;
        b=Lqk62Tt5E7XdTsg+k5YDfvRlKBQVMK7IyXwlH1FSCBfFVyOvAmKXUvVMy0KJOX0Prk
         a7hxK85ROl43yCkUI9bdlZdBTYWjofyNalMJUo2mM7mwlN/6sZFo8Y1ORlh/lB86mzgk
         WumUwJe+Yk+BiaR7HkLmYR2X13nBHSe6XXYQMhC8YZBujjZHhBLANRlrFGOZ4Wf4HOHK
         IqYtJWxOhf332jOKy8JvkBFsKW160flVVQlQwdPU+WZW5GYD5/oVql0HOR5QGL0BY86G
         eZEuwP/I81F6SFBHvrUX+tDY9+yppGTvBn28i71iRXtHt/bBDGlo6ij0cGy9Ztj6JoRK
         67ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716826198; x=1717430998;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6jrcUzHGOlskCQ/YF23KTYoqp2ziYcD5a/4kXi7Mv04=;
        b=DHXofkf2qJCGjt90MyUz7KcAtLZacGUQWYB0Ft5HU7sPV2eyYGPzTCkZ3x4Bj9kXWO
         VsCiS1kdAFbaiUspxBP2y7u8SbOCEZBKN1AC3gcBWICZKvcKjvG/zEC6w0x2CCpdasbT
         73u5olox0TyMVNa7CkDNs47Ec4aGq1CBiYEevBoVl20npENtsd7okpp8K0+0ex8Bo6qL
         EKJrrPQoAsYmtpY8QF5YPaKzNObpEqnZC14+GkaUIdgEHc4/9Nj5F+p57FMXUWCfou6m
         VSSavzETxFIpPWDfQQX9h2mR6DkQUrn7zZu9eukXvVCwVDXk3KMigDaD3xxUgqRmcuAW
         qCyw==
X-Forwarded-Encrypted: i=1; AJvYcCW9AEr7Yp4i5J8gMY0ZegKMXVKuoV4RFwFXaUBXQVgByWoI+WnUxLFCh3gR5ylOFbau3aKf9PmepdFLl0WM29S13rw5IBCTknB8JdXChUM=
X-Gm-Message-State: AOJu0Yw12IicYbm9k12VYBcOwulG1iDplAD1b1d8RRWhBKBl8kjNCrGg
	ul0G/KHZrno3ARJ5wciJFyZTSv2VV7N4ujznMCmN4w+aOK1ZKD7m
X-Google-Smtp-Source: AGHT+IGmlP4JkXDvaatweWV00vtHK/G6WptJlpmYG4sygTD4j55h9c7OmeDFzWXrjaurrlTQVfGh1g==
X-Received: by 2002:a17:906:2ada:b0:a59:c941:e5e5 with SMTP id a640c23a62f3a-a62646d5a8amr899802366b.45.1716826198067;
        Mon, 27 May 2024 09:09:58 -0700 (PDT)
Message-ID: <4ef493874d6a3dc5a6403d5c5668e7cef276ce33.camel@gmail.com>
Subject: Re: Code freeze date for Xen 4.19 is 31.05.2024
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org
Date: Mon, 27 May 2024 18:09:57 +0200
In-Reply-To: <2d0c1ebf-fecd-43a5-b616-9869e98ece5e@suse.com>
References: <6a4323b46dd3dbb170c48fa24e78a23fa030b2a2.camel@gmail.com>
	 <a1e65a79-d8a4-4b8a-ad4d-a18544389e5a@suse.com>
	 <48f5e40e1f13ef96e8448b59f76878b522876030.camel@gmail.com>
	 <2d0c1ebf-fecd-43a5-b616-9869e98ece5e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Mon, 2024-05-27 at 17:55 +0200, Jan Beulich wrote:
> On 27.05.2024 17:52, Oleksii K. wrote:
> > On Mon, 2024-05-27 at 17:12 +0200, Jan Beulich wrote:
> > > On 27.05.2024 15:58, Oleksii K. wrote:
> > > > I would like to remind you that the code freeze date for Xen
> > > > 4.19
> > > > is
> > > > May 31, 2024.
> > >=20
> > > I may be confused: With feature freeze having been last Friday
> > > aiui,
> > > isn't
> > > this a little too short a period? I was actually expecting a
> > > longer-
> > > than-
> > > normal one to account for the Xen Summit week.
> > It makes sense to move the last day to June 14. Consequently, we
> > would
> > need to adjust the schedule as follows:
> >=20
> > Hard Code Freeze: from June 21 to June 28
> > Final commits: from July 5 to July 12
> > Release: July 17
> >=20
> > And this schedule also looks good to me.
> >=20
> > However, another option is to combine the Code Freeze and Hard Code
> > Freeze periods since both phases are about accepting only bug
> > fixes,
> > differing only in the severity of the fixes.
>=20
> I'm okay with whichever way you want it. All I'm seeking is clarity.
I realized that we have the Xen Summit coming up, which means we'll
lose almost a week from the review process perspective.

I would like to hear the other maintainers' thoughts on updating our
release schedule to have the release on July 17.

~ Oleksii

