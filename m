Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 396DB83C60D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 16:05:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671595.1045014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT1Hz-00059e-3s; Thu, 25 Jan 2024 15:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671595.1045014; Thu, 25 Jan 2024 15:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT1Hz-000585-0x; Thu, 25 Jan 2024 15:05:11 +0000
Received: by outflank-mailman (input) for mailman id 671595;
 Thu, 25 Jan 2024 15:05:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KpLG=JD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rT1Hx-00057z-2a
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 15:05:09 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 204c901f-bb93-11ee-98f5-efadbce2ee36;
 Thu, 25 Jan 2024 16:05:07 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5100ed2b33dso3134416e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 07:05:07 -0800 (PST)
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
X-Inumbo-ID: 204c901f-bb93-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706195107; x=1706799907; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujVQl2eHoFIN1NSaiWIIT/EwOKwIdEPVDpBXFuNHGPY=;
        b=mMKMrUdIpDihORht6UrMYwZNt/14fsJmj9CBg3OwYipyp4F+yaShchKP2EMzbOEX3r
         jOCOkps2gyFoQiRMkJG9E5QxoM7hLhoeR81cnePj41hO8N3YtiV/+dJ0GgSSyuxw3/R7
         IZtWqypiB+mB6qegVo+CAIe1v+pwpRSNhJew7dJMJg77l2uABv/1qj6vIQHBy9TuR5BF
         STxxwh30zlgb070VX4+umeLFOB52NEQdBhFnzLfleDso70F9d9bQrzRkSfNQbJAsvyiv
         n/mc1jkVrR+S4oxGskmMCTq8k6d+wbsjeKH2JJy+q6H64RW0Eh+qsRpEGL2HoB3jUzD0
         wMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706195107; x=1706799907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujVQl2eHoFIN1NSaiWIIT/EwOKwIdEPVDpBXFuNHGPY=;
        b=Al+hFhbDzdcmVjppf0mf/L1bjLFEcq0DzhCcOmwGMLOAqvUEelLWqJmr4Zt0sspOeA
         +Lgikbsb5nohiBU8gP6d1dmL1QEIBVnX39ZoHyLOdz+xZ1QgGR0JZ4HgPrAbY7OIbi0q
         ypRvN+rE5ZZd/y0Meo9+UI1RuWNinXV5vnYeIgyC1Ouq52sMLC9NLgJx4aEUDeaFdYa3
         M4ZFiEggasap2D4yklepIU1g+naqp+HX0AVvhyjO6BlpURAzJilQQdHjiHd8KKBxZhif
         sYxAmn2aKGE1uLyN10QJFwUhFxuZAMlnusnVMAbpij7HJCIMs4as+Kg4FZsgziyKb7Po
         5RFw==
X-Gm-Message-State: AOJu0YzjkvpzQE3FaXwxrx0gZyKsbirbmwPdhj03893OsfmN+2s4bCX7
	e1BSsPPDZSHOKnF2SjXrUdzC4ipLEm0/MKotaXExQBwAPgZMc88KMbRYzyN9YZU/WVbeWPVFsOj
	I6f28cGRAFtwVftpTPDPajotAoa4=
X-Google-Smtp-Source: AGHT+IF2GsjJao73A40LDKWcVvT06jIqx2xkwjQejp3diA32/kINlerhHNfs/OC1cs2/HVghJCA0zJmv26F/1G8WuM0=
X-Received: by 2002:a05:6512:3d21:b0:510:c62:bcd4 with SMTP id
 d33-20020a0565123d2100b005100c62bcd4mr824535lfv.55.1706195106499; Thu, 25 Jan
 2024 07:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20240124205922.67266-1-jandryuk@gmail.com> <20240124205922.67266-3-jandryuk@gmail.com>
 <a9d6efce-8185-4dc8-b1d3-097ec49e3b28@suse.com>
In-Reply-To: <a9d6efce-8185-4dc8-b1d3-097ec49e3b28@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 25 Jan 2024 10:04:54 -0500
Message-ID: <CAKf6xpvR3DYseUM0BTmpoDy+WZN7vrdB-7gM4D5F4sOrBXa7rw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] xenpm: Print message for disabled commands
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 9:31=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 24.01.2024 21:59, Jason Andryuk wrote:
> > xenpm get-cpufreq-states currently just prints no output when cpufreq i=
s
> > disabled or HWP is running.  Have it print an appropriate message.  The
> > cpufreq disabled one mirros the cpuidle disabled one.
> >
> > cpufreq disabled:
> > $ xenpm get-cpufreq-states
> > Either Xen cpufreq is disabled or no valid information is registered!
> >
> > Under HWP:
> > $ xenpm get-cpufreq-states
> > P-State information not supported.  Try get-cpufreq-average or start.
> >
> > Also allow xenpm to handle EOPNOTSUPP from the pmstat hypercalls.
> > EOPNOTSUPP is returned when HWP is active in some cases and allows the
> > differentiation from cpufreq being disabled.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> Largely okay, but a number of cosmetic remarks / nits:

Thanks for taking a look.  Sorry about the cosmetic issues.  All your
suggestions are good with me.

Thanks,
Jason

