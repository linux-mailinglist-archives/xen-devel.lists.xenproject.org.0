Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1515385E0E7
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 16:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684080.1063759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcoQl-0005p4-MC; Wed, 21 Feb 2024 15:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684080.1063759; Wed, 21 Feb 2024 15:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcoQl-0005m6-JY; Wed, 21 Feb 2024 15:22:43 +0000
Received: by outflank-mailman (input) for mailman id 684080;
 Wed, 21 Feb 2024 15:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6My=J6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rcoQk-0005lZ-Mo
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 15:22:42 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cc4df94-d0cd-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 16:22:42 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5650ac9a440so917201a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 07:22:39 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u16-20020aa7db90000000b005645c4af6c7sm3380979edt.13.2024.02.21.07.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 07:22:38 -0800 (PST)
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
X-Inumbo-ID: 0cc4df94-d0cd-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708528959; x=1709133759; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bBlTt9poW/uW95sB+S7+mNOQfYUBO7fagy8zO2v9oDY=;
        b=dgvNiqAgmSaboMlmI6adJbfLFtXvjRZM76q/hKGwJX1yxO0zL/VEv4rpS8nhOEyC0j
         s7Ha04Wfd/cbVRSvS0qZPz70xMo0+qn5G+cPPIdqSjU7B/OuE7u8K3gaE+wvMGphKu0v
         W/NYckseRtu8hYGxGC2pyeeyWS2tTBeiQJTvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708528959; x=1709133759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBlTt9poW/uW95sB+S7+mNOQfYUBO7fagy8zO2v9oDY=;
        b=QpTMaCXGVI/jmkI+K/DrOtUiN35MtM56VziAQwggx1IeqeNQl+WWLAqPx6xMSKsIx1
         WiZNOid9d2vWWXyngxBz+xtCPzpxSF2vqsSrIlN5lFiizrTiop1dju7XO6Cb0yANLYeq
         am2zCAkcz7E1Mk/iO+1Py82W4UMi1/2E/uTejD+MkQayHSVfCfwafVUqa2ywhjmdMQoZ
         3gYs1LmBdzu6t1QEmZMJxfTmQPaFF0rZoOF1naFRXWRmKlGxuTdeusG0rDy7cn64bCN8
         bO9S9ebcReOd99AYX0SNMqZ6SoTw2cSps2Vv8ih0k3cWQSrpRhmF2TnjLax0H/vIKF/k
         lk5A==
X-Gm-Message-State: AOJu0Yy4EId6T1DsbdWCZoHrwDUFF8kOiNR8FA0QnxTy2ow3dYjIW8tr
	mhVmWUvm7FFr/3xA/y9rUdRJWhjBk+CyaPwOHgXz3xxfWnSbinWryGZZt2gMa0w=
X-Google-Smtp-Source: AGHT+IFzIAwS5710ytBbzLuG8+QaJwD8W5MOmhFdD1ZDEyz0wKc+aoR5WlDuxHU2zMP1FHZPf6bghw==
X-Received: by 2002:a05:6402:1656:b0:564:7007:e14a with SMTP id s22-20020a056402165600b005647007e14amr6178279edx.6.1708528959172;
        Wed, 21 Feb 2024 07:22:39 -0800 (PST)
Date: Wed, 21 Feb 2024 15:22:38 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] build: make sure build fails when running kconfig fails
Message-ID: <ed53b507-8ce1-4496-b2c2-cb0089f384c0@perard>
References: <55c3a781-17f8-47f2-9629-515e1aea77aa@suse.com>
 <b7c22718-ec6c-470e-be72-e613b2af3c54@perard>
 <abbae372-5e3e-4013-a2a3-45892ec96c89@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abbae372-5e3e-4013-a2a3-45892ec96c89@suse.com>

On Tue, Feb 20, 2024 at 01:20:16PM +0100, Jan Beulich wrote:
> On 20.02.2024 12:18, Anthony PERARD wrote:
> > On Tue, Feb 20, 2024 at 09:43:56AM +0100, Jan Beulich wrote:
> >> Because of using "-include", failure to (re)build auto.conf (with
> >> auto.conf.cmd produced as a secondary target) won't stop make from
> >> continuing the build. Arrange for it being possible to drop the - from
> >> Rules.mk, requiring that the include be skipped for tools-only targets.
> >> Note that relying on the inclusion in those cases wouldn't be correct
> >> anyway, as it might be a stale file (yet to be rebuilt) which would be
> >> included, while during initial build, the file would be absent
> >> altogether.
> >>
> >> Fixes: 8d4c17a90b0a ("xen/build: silence make warnings about missing auto.conf*")
> >> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Just to make sure, this patch is a workaround to a harmless bug in older
> > version of GNU Make which print spurious error messages, and said bug as
> > been fixed in GNU Make 4.2, right? Bug report:
> > 
> >     bug #102: Make prints an incorrect error for missing includes
> >     https://savannah.gnu.org/bugs/?func=detailitem&item_id=102
> 
> Assuming you mean the change referenced in Fixes: - yes, that's my
> understanding. (Whether the referenced make bug is the one I can't tell,
> though. But it looks like it is.)
> 
> >> --- a/xen/Makefile
> >> +++ b/xen/Makefile
> >> @@ -375,6 +375,7 @@ $(KCONFIG_CONFIG): tools_fixdep
> >>  # This exploits the 'multi-target pattern rule' trick.
> >>  # The syncconfig should be executed only once to make all the targets.
> >>  include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
> >> +	$(Q)rm -f include/config/$*.conf
> > 
> > Maybe this should say "include/config/auto.conf" instead of using "$*".
> > "syncconfig" is going to generate "auto.conf" and not "$*.conf". And it
> > would make easier to find the "rm" command via "grep".
> 
> Generally I advocate for using $* wherever possible in pattern rules. If,

Well, it might look like a pattern rule, but it isn't one. It's a
"groupes targets" rule that works on version of Make that doesn't have
this brand new feature. It would be written as:
    include/config/auto.conf include/config/auto.conf.cmd&: $(KCONFIG_CONFIG)

Second, the other command in the recipe doesn't use "$*", so it's not
possible to use this rule with a value of $* other than "auto".

> however, replacing that is the only way to get an ack for this change, then
> I would (hesitantly) do so.

Yes please, even if I don't like the patch. I hope it isn't going to
byte us later if something in "tools/" happens to start depending on
Kconfig (only fixdep and kconfig need to not depend on kconfig at the
moment). But the patch currently works and looks ok. So, with "$*"
replace by "auto", you can add my "Reviewed-by: Anthony PERARD
<anthony.perard@citrix.com>".

Thanks,

-- 
Anthony PERARD

