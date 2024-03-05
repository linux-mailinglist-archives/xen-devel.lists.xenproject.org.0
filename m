Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026C5872282
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 16:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688825.1073493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhWWU-0002nS-It; Tue, 05 Mar 2024 15:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688825.1073493; Tue, 05 Mar 2024 15:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhWWU-0002lw-FZ; Tue, 05 Mar 2024 15:16:06 +0000
Received: by outflank-mailman (input) for mailman id 688825;
 Tue, 05 Mar 2024 15:16:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4c3Q=KL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rhWWT-0002lq-UG
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 15:16:05 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48ba4548-db03-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 16:16:04 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51341a5aafbso2883770e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 07:16:04 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a192d11000000b00513200975b8sm2260118lfj.43.2024.03.05.07.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 07:16:03 -0800 (PST)
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
X-Inumbo-ID: 48ba4548-db03-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709651764; x=1710256564; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hbwnm/lnZ1y0xmDyH+7GJGCVmhMJAz7GGhVKYVpt7jo=;
        b=WY1Avh1nyEEcHewhVclEPhtA06WY6VcZjhCxLU6DSqd3w4yivA87A2MDZxbnUhmGmj
         mHDMWB4KPTMPvc7vOU4R+6VuTZs5YCTiFseNvtoEC41j9U6nDpa4W0hDJmIO3ciguEh4
         eCOEn4PattfhcYE7W1leOiMAMcjQ7/kwNansCyGLM7RqKsjyFQKr7ohpyN9nRBpjS/4Q
         jQs8hLTYmpGYyMddGd102WDfnVVI/eb4lznC0l/B7CL8Kbo/xtXUIjauC3KmEO//eLjT
         OUyjUpMMRTMSJHT+K1c1ptXRbLX5ErTuaB6HZYUhGD1QizIVlWk2afKSgUA7HPT9EU9l
         3SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709651764; x=1710256564;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hbwnm/lnZ1y0xmDyH+7GJGCVmhMJAz7GGhVKYVpt7jo=;
        b=p4niSRftshh6PnEjd4wHwLHO3l/lKeQyMw8aN1vbg7G2T41c5nT0oxiYt5TBL/2uDl
         /hj5lhiYfABArV1n0ShWObYklrklIj6jTq60pLxHFaSHOImbMEcjQ6RVvo6q81iOTSln
         2AmXlvmd3WXEqr5zi9bV4dM7VKMHvpOY7Ha4rL8SGpWGLveYW5DyU+c//pMEzDGTwtSy
         eRMQqpFEJKpJfEQgrAbGR0ZZJuxuxoPAoELrShUpckl9VLZlEGlUBJ+fAGVk2XLHOnqm
         rpJznNnFjVMfS7fjhZ7jqblq5843SoGThPjlwP5WwTEOpW6zE3NtaYEuB6E7aFoOx5st
         tLRw==
X-Forwarded-Encrypted: i=1; AJvYcCW7n3N2DoUjXpge+FfizgbcIIVAJ6M0QcXDpAunw+PvBeuCVd+EOqVr6OlpsmDdiN4byA5bmlhHOCN7auuVa1ydlWYNXhJB2JijYqkU8ko=
X-Gm-Message-State: AOJu0YxjO9zwgbWTyoVzXZlZP9nvxHx/sIqFP6nsnqE0DZe5j4RshFXQ
	3Dltnjp6icomcKPVwaRdu81TAF8TOEC3qqut9JgEp2rmXe0KmviH
X-Google-Smtp-Source: AGHT+IG9hZHYqYmYABjFYqhyZOBijiGqvkxv+KonlpWkCBRXJI8n6ZZGWWXKTqndkpXe6j7tpCB/hA==
X-Received: by 2002:a05:6512:208d:b0:512:9dee:44fe with SMTP id t13-20020a056512208d00b005129dee44femr1267105lfr.26.1709651763912;
        Tue, 05 Mar 2024 07:16:03 -0800 (PST)
Message-ID: <7df33568918536487ec75a05cd47cee128150c0c.camel@gmail.com>
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>,  Michal Orzel <michal.orzel@amd.com>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Date: Tue, 05 Mar 2024 16:15:58 +0100
In-Reply-To: <3bc0b828-d3c5-447d-b338-c478d8e337fc@citrix.com>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
	 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
	 <c9f92495-2c00-443f-bffd-1b09cb8a8c84@xen.org>
	 <d343c58c-2a3a-45a9-8d67-64d1506d973c@suse.com>
	 <5c06c437-b62c-4bee-8694-1be597887718@xen.org>
	 <141ed8a2-df4f-492c-a192-4ffa7f4c8384@suse.com>
	 <4fb729fa-8519-4244-a795-cc66a79cd346@citrix.com>
	 <c6f9c9fa-a252-41c4-b92f-435c57044cd2@xen.org>
	 <3bc0b828-d3c5-447d-b338-c478d8e337fc@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-03-04 at 17:50 +0000, Andrew Cooper wrote:
> On 04/03/2024 5:40 pm, Julien Grall wrote:
> > Hi Andrew,
> >=20
> > On 04/03/2024 17:07, Andrew Cooper wrote:
> > > On 04/03/2024 4:55 pm, Jan Beulich wrote:
> > > > On 04.03.2024 17:46, Julien Grall wrote:
> > > > > On 04/03/2024 16:41, Jan Beulich wrote:
> > > > > > On 04.03.2024 17:31, Julien Grall wrote:
> > > > > > > On 04/03/2024 16:10, Andrew Cooper wrote:
> > > > > > > > It is daft to require all architectures to provide
> > > > > > > > empty
> > > > > > > > implementations of
> > > > > > > > this functionality.
> > > > > > > Oleksii recenlty sent a similar patch [1]. This was
> > > > > > > pushed back
> > > > > > > because
> > > > > > > from naming, it sounds like the helpers ought to be non-
> > > > > > > empty on
> > > > > > > every
> > > > > > > architecture.
> > > > > > >=20
> > > > > > > It would be best if asm-generic provides a safe version
> > > > > > > of the
> > > > > > > helpers.
> > > > > > > So my preference is to not have this patch. This can of
> > > > > > > course
> > > > > > > change if
> > > > > > > I see an explanation why it is empty on Arm (I believe it
> > > > > > > should
> > > > > > > contain
> > > > > > > csdb) and other arch would want the same.
> > > > > > Except that there's no new asm-generic/ header here (as
> > > > > > opposed to
> > > > > > how
> > > > > > Oleksii had it). Imo avoiding the need for empty stubs is
> > > > > > okay
> > > > > > this way,
> > > > > > when introducing an asm-generic/ header would not have
> > > > > > been. Of
> > > > > > course
> > > > > > if Arm wants to put something there rather sooner than
> > > > > > later, then
> > > > > > perhaps the functions better wouldn't be removed from
> > > > > > there, just
> > > > > > to then
> > > > > > be put back pretty soon.
> > > > > I am confused. I agree the patch is slightly different, but I
> > > > > thought
> > > > > the fundamental problem was the block_speculation()
> > > > > implementation may
> > > > > not be safe everywhere. And it was best to let each
> > > > > architecture
> > > > > decide
> > > > > how they want to implement (vs Xen decide for us the
> > > > > default).
> > > > >=20
> > > > > Reading the original thread, I thought you had agreed with
> > > > > that
> > > > > statement. Did I misinterpret?
> > > > Yes and no. Whatever is put in asm-generic/ ought to be correct
> > > > and
> > > > safe
> > > > by default, imo. The same doesn't apply to fallbacks put in
> > > > place in
> > > > headers in xen/: If an arch doesn't provide its own
> > > > implementation, it
> > > > indicates that the default (fallback) is good enough. Still I
> > > > can
> > > > easily
> > > > see that other views are possible here ...
> > >=20
> > > With speculation, there's absolutely nothing we can possibly do
> > > in any
> > > common code which will be safe generally.
> > >=20
> > > But we can make it less invasive until an architecture wants to
> > > implement the primitives.
> >=20
> > I understand the goal. However, I am unsure it is a good idea to
> > provide unsafe just to reduce the arch specific header by a few
> > lines.
>=20
> It doesn't matter if it's unsafe in the arch header or unsafe in the
> common code.=C2=A0 It's still unsafe.
>=20
> There is no change in risk here.=C2=A0 There's simply less blind
> copy/pasting
> of the unsafe form into new architectures in order to get Xen to
> compile.
So, we're revisiting this topic again.

I agree that upon examining the current state of the code around these
functions, it appears safe to provide stubs. However, the reason my
patch was rejected is that it may not be entirely safe, as Julien
pointed out that even with Arm, some functions shouldn't be empty.

What I would like to propose is that it might be beneficial, at least
in CONFIG_DEBUG=3Dy, to have a warning message. Does that make sense?

~ Oleksii



