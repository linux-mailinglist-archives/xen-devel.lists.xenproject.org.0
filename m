Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A49953BA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 17:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813263.1226120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCQO-0004O6-Ap; Tue, 08 Oct 2024 15:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813263.1226120; Tue, 08 Oct 2024 15:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCQO-0004Mb-7A; Tue, 08 Oct 2024 15:47:00 +0000
Received: by outflank-mailman (input) for mailman id 813263;
 Tue, 08 Oct 2024 15:46:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J5/k=RE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syCQM-0004K6-6c
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 15:46:58 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ca4b495-858c-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 17:46:57 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5398e4ae9efso6330291e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 08:46:57 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec8255sm1250464e87.83.2024.10.08.08.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 08:46:56 -0700 (PDT)
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
X-Inumbo-ID: 8ca4b495-858c-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728402417; x=1729007217; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YGSBdGVHlzIh/+oS8TTr6YgrG7CcHINbGde7fUVmVfw=;
        b=cLEmYDCLQ7iZHdmvN2fqoQrr+HcxT8Le64XznuVV7xgxW3ftl37KwV8YnRfDpxSd5w
         +BIPi48K8xOk4GbP8ZCgxJusqTUmNdEzrI3rWn36HasLbakX6iwvZd9ySx0ud9YsCnKu
         U79W52y7VGDux02McOFY5/S+hmi2HH/ExMgdvNJ3PXJ51TabsWwGMs158ATWAuXD7UZe
         Ag34YFnrWx6FlDlj20hrfXgyKyTaUKnBzrtjwFmRU8bdyeXH/NXkjsE0o0Bk8OZCnxC/
         xfznWuHXbPJRzF2TfZ9ky8fv39HWuyt1WhGDR6Wr0hoN3GQJvDWEe3//OyvcB3Pmi1+j
         T4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728402417; x=1729007217;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YGSBdGVHlzIh/+oS8TTr6YgrG7CcHINbGde7fUVmVfw=;
        b=o7WHchGdnMOTQVSExOyvzflZASRUKupXvYpHVbpBfFxU1DE5jHlaRv1PEi6Dc8fFOm
         gLqMkspNtiWXXDLyuRr4zyizoOgCj+R0/hc6vsv3AK0rE8jrppz5yDETndB5zyZX4Eue
         wSuMtlSKFiU14nFqAJEYF99PX5AvOCkCYKGpq+NPyYFLqErud1WVdv8L+4GHLHJTmRQ3
         7nS7hfLdTF3YN2RUiYnq+e4Gt0jB/OwSWREWYA98CLHynXZRnImMHRNGtvBTWlmbfoNo
         TA4SsV4SJ9Jc0mXslWhzeiCww+JC4uOXeeg2buStOo/RFUPtUlm4PswE3z4kGGNnKJF2
         SwDg==
X-Forwarded-Encrypted: i=1; AJvYcCV77ArayW5xswLn9YIvlYgFG57ySqOAk1GkbI0DMiz9MM0RtILxBzYtaYAxdnSFNQEdJNy1nWu4254=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPOLYYotzH/vpzy4R69UmVRIDV3aoL+MS58LHnw3KsnLWA2cCP
	EU7PeMkSD9cPzmMBDTOF7RHAMHUHUm8q3IGSdkq1pXbBPhDMdJzl
X-Google-Smtp-Source: AGHT+IGv05znTk/rXN9oxLcNIdcxYbTUyzPZ/Thuw8hNPZLu+vdxuFycSq4DdTAHc8D6RKM5r+DY6A==
X-Received: by 2002:a05:6512:31c3:b0:52c:8c4d:f8d6 with SMTP id 2adb3069b0e04-539ab9de3f1mr9215652e87.45.1728402416607;
        Tue, 08 Oct 2024 08:46:56 -0700 (PDT)
Message-ID: <17c7d988e45d7c82448b81fe66b01a5ceca0c15e.camel@gmail.com>
Subject: Re: [PATCH v5 0/6] Move {acpi_}device_init() and device_get_class()
 to common code
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 08 Oct 2024 17:46:55 +0200
In-Reply-To: <0c3f6b3d-7040-43e2-823f-520dcbeec31d@suse.com>
References: <cover.1727452451.git.oleksii.kurochko@gmail.com>
	 <a2c4278891263ee8d3431321367a32246d7498c7.camel@gmail.com>
	 <0c3f6b3d-7040-43e2-823f-520dcbeec31d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-10-08 at 17:30 +0200, Jan Beulich wrote:
> On 08.10.2024 17:25, oleksii.kurochko@gmail.com=C2=A0wrote:
> > Except the comments ( which Jan wrote could be adjusted while
> > committing ) for patch 1 everything is properly Acked/Reviewed ( if
> > I
> > am not missing something ).
>=20
> I didn't spot a PPC ack so far; did I miss it?
Yeah, you are right I confused ( I thought that he gave his Ack before
and I just forgot to add it ) with another one patch where Shawn gave
his Ack. I will ask Shawn to look at patch 1.

~ Oleksii

