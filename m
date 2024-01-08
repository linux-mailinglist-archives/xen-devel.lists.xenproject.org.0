Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B68E82718C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 15:38:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663547.1033490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMql9-0006OZ-72; Mon, 08 Jan 2024 14:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663547.1033490; Mon, 08 Jan 2024 14:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMql9-0006MV-2z; Mon, 08 Jan 2024 14:37:47 +0000
Received: by outflank-mailman (input) for mailman id 663547;
 Mon, 08 Jan 2024 14:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HHUo=IS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rMql7-0006MM-8M
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 14:37:45 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b6823f5-ae33-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 15:37:43 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50eaa8b447bso1736635e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 06:37:43 -0800 (PST)
Received: from [192.168.223.212] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 bi23-20020a0565120e9700b0050e3719148fsm1163866lfb.235.2024.01.08.06.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 06:37:41 -0800 (PST)
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
X-Inumbo-ID: 7b6823f5-ae33-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704724663; x=1705329463; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MQScqalmtmLPJZbeiSOmYv5gdzp9HJBOtiVcnzaPdsg=;
        b=mfEHBRHJDY5I2Ty4TgtNcCooU8n2ifVML7RbJL+dt/d5TPLtYPSl58820Xe4Teo9JG
         weNxtIxL0ifWLPV69UOT3dcdihG+oP9OclCJSr8f4IfTZblUZzh7NwEIGy72J+j8/Cum
         sp/vP8URm2VM6Yj+nl1kj8kRUOxLodl2X3OHc1tqQijJyPeA3Ah+Fqg7j7UkkKTsw9sI
         7qIIiIa09PWn21VpBDe9MlIDX28jxxBj1+AlMWMjzO0fr4x3I1BN0fhrUUK4yUEjdlvr
         HOe3se5LEM7cbOWaIDYNUIbKIopoKX8oTVn7a56RRAsNX3CeJarBTwfGe0PCplc6nNjX
         mzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704724663; x=1705329463;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQScqalmtmLPJZbeiSOmYv5gdzp9HJBOtiVcnzaPdsg=;
        b=mhBNYYMqyFuVE+j520q5h+AkY57HISmPGswmd2BlsNruAf/zentDWhKQsfKfY2QTzn
         NC3t65IEGt3N765rGhZKVVarry1IZKxRDMMlWxa4wuxg81+u8nRXEpJoaRyjRfAEc9Af
         I9mGRhHmw5Oh+dnwfrY8YWQROkIW6F2A8jVZdCe6FmCgUbPm0FrohuJVyvPim3PNYoII
         lpnVeVYLMwfT0o/m2rk2sL4xJrgDh3twWNm0PTMCLFGWJcA3VX8Aw0/nliDPAQH0ChhV
         kjbcL+Qg3UCxMFX6hPdSCn0h+0Z3ylSwQrWQO+/y2Q1fAtdKUHqwNoV2cGHiHJphYvYu
         YPbQ==
X-Gm-Message-State: AOJu0YzKDpFBkNKRFMgYfHrFqAxKTIhtjitCmG8GEIFQUZ7XkG2PUAux
	DfXEYSzo1JFj/hYAgjvTGFc=
X-Google-Smtp-Source: AGHT+IGlHxESYSUZgsAxPCNlZu7m7G6uMBunoKSGbDUSxY4C0yAmTrHq4iWJu0vyNE2TLoVlSIzzzQ==
X-Received: by 2002:ac2:5050:0:b0:50e:7aec:1236 with SMTP id a16-20020ac25050000000b0050e7aec1236mr575728lfm.61.1704724661920;
        Mon, 08 Jan 2024 06:37:41 -0800 (PST)
Message-ID: <61bb0457701582f85f60f81cefb02953587deb06.camel@gmail.com>
Subject: Re: Xen 4.19 release schedule proposal
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: community.manager@xenproject.org, julien@xen.org,
 sstabellini@kernel.org,  Bertrand.Marquis@arm.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, 
 anthony.perard@citrix.com, george.dunlap@cloud.com, jgross@suse.com, 
 Wei.Chen@arm.com, xen-devel@lists.xenproject.org
Date: Mon, 08 Jan 2024 16:37:40 +0200
In-Reply-To: <87f4c67a-3902-499a-b4e3-c1429a0d9167@suse.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
	 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
	 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
	 <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
	 <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
	 <67bf2be7-53f4-40d0-a856-8ae631a054b0@suse.com>
	 <955e9b02-20bd-4279-9f60-bb757cdf1a03@xen.org>
	 <0f729b61-b839-48f6-89ae-b5570b1eae0b@xen.org>
	 <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>
	 <87f4c67a-3902-499a-b4e3-c1429a0d9167@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-01-04 at 13:52 +0100, Jan Beulich wrote:
> On 02.01.2024 17:59, Oleksii wrote:
> > I'd like to propose the release schedule for Xen 4.19.
> >=20
> > Based on the previous release schedules [1] and [2], it seems the
> > next
> > release date should be on Wednesday, July 10, 2024:
> >=20
> > ** Proposed option: Wed Jul 10, 2024 **
> > (+9 months from Xen 4.18 release)
>=20
> Hmm, aren't we intending to be on a 8 month cadence?
Considering that in July, there will be the Xen Developer Summit, we
can aim for an 8-month cadence.

However, in the Xen release document, there was mention of a discussion
[1] about cadence:
"With 18 months of full support and 36 months of security support, the
number of concurrent supported releases will be the same with either 8
or 9 months release cycles, so I have chosen an 8-month cycle for now."

I interpreted this as either an 8 or 9-month cycle, and it's not
strict. If there's a strict requirement for a specific duration, I'll
resend the Release Schedule Proposal.

[1] https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html


~ Oleksii

