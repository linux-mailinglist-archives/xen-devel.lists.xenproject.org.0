Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9778175C2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 16:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656193.1024252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFlx-0007Q3-HT; Mon, 18 Dec 2023 15:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656193.1024252; Mon, 18 Dec 2023 15:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFlx-0007OO-EO; Mon, 18 Dec 2023 15:43:13 +0000
Received: by outflank-mailman (input) for mailman id 656193;
 Mon, 18 Dec 2023 15:43:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5ff=H5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFFlw-0007E9-4j
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 15:43:12 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2573a54c-9dbc-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 16:43:10 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c2bb872e2so37361935e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 07:43:10 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05600c450b00b0040c495b1c90sm31865042wmo.11.2023.12.18.07.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:43:09 -0800 (PST)
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
X-Inumbo-ID: 2573a54c-9dbc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702914190; x=1703518990; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4r2A/h8diWCfKxEqoaJYQKuno0t/DfyVZzjLiv/hWkE=;
        b=JEZ5DwoPSBgIXj9NTGj3w6FSKDOQIKPEAcfdlWfm4MiLFRyWwSRpKJxmPG+cUNf3OP
         Schn8LUJTZ6DfSrYFBJT+ifnRN3OlwcdBNzcL782/n+HFnYX36Meb6GcRSZ/e3IY0q5r
         cg1SyJcOpCVZ0cF5u4VqdpSpcayy1eUadwMHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702914190; x=1703518990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4r2A/h8diWCfKxEqoaJYQKuno0t/DfyVZzjLiv/hWkE=;
        b=darLJEyc9z/rUUPXxLXnngvOsugvL62Gw2XkUt1pnnEOWKeA1ELMZQPvUWOCXeXjyu
         6g93X8FFY1Q9zw3H1RYChHIn5uOIOAVNk8W91Ty0XBW8Y1Y/LPLznCPfrP4DOYzdeM5g
         AGQ+at6OMJg51l3ft0nbm0ipDYw8cJzETZZb/NW039pengrfNJnUGbCEfoDnM6aL4e7A
         1ziXk8eu/lT0xu1bIxPIQNGbCrU4fpfLLFEIWNTe21tZNdPIhYzJH5xjkWdp4m6fW9QT
         Dt6aEMyHd1zL+ChjpU1hO2GudMQi0Jr/qZ697GHg3H6k6qsWprB7XSyzoIfhEwWrRMkh
         POjA==
X-Gm-Message-State: AOJu0Yw3UJrIKcPgyKluxHqm1eDeadbDHu6weajuo9JSiHSDvmCE7T+J
	C0ikXR1xjQPiXjcVOdHl/gBQ+5CUqGx4E6USMJ0=
X-Google-Smtp-Source: AGHT+IGRgl+CQLeClcV0xYW5BSkzEXxEpRHgtuehgliY4Q34thBPZOroQhcqy/AMx3BGoghwd5pzWQ==
X-Received: by 2002:a7b:c40d:0:b0:40c:31f1:144c with SMTP id k13-20020a7bc40d000000b0040c31f1144cmr4137247wmi.87.1702914189694;
        Mon, 18 Dec 2023 07:43:09 -0800 (PST)
Date: Mon, 18 Dec 2023 16:43:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
Message-ID: <ZYBojHyqUeB9FWmh@macbook>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <31da79de-bd6b-af95-793a-c16516992bc7@suse.com>
 <ZYA3Db53Z3fvBlwn@macbook>
 <1c00c3ba-4d10-4cdc-ae2e-ca2fb2157be6@suse.com>
 <2f6367bd-d63d-435f-8d6e-553d5e129eb5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f6367bd-d63d-435f-8d6e-553d5e129eb5@suse.com>

On Mon, Dec 18, 2023 at 02:50:27PM +0100, Jan Beulich wrote:
> On 18.12.2023 14:46, Jan Beulich wrote:
> > On 18.12.2023 13:11, Roger Pau Monné wrote:
> >> Hello,
> >>
> >> I'm not as expert as Andrew in all the speculation stuff, but I will
> >> try to provide some feedback.
> >>
> >> On Tue, Feb 14, 2023 at 05:10:42PM +0100, Jan Beulich wrote:
> >>> In order to be able to defer the context switch IBPB to the last
> >>> possible point, add logic to the exit-to-guest paths to issue the
> >>> barrier there, including the "IBPB doesn't flush the RSB/RAS"
> >>> workaround. Since alternatives, for now at least, can't nest, emit JMP
> >>> to skip past both constructs where both are needed. This may be more
> >>> efficient anyway, as the sequence of NOPs is pretty long.
> >>
> >> Could you elaborate on the reason why deferring the IBPB to the exit
> >> to guest path is helpful?  So far it just seem to make the logic more
> >> complex without nay justification (at least in the changelog).
> > 
> > I've added "(to leave behind as little as possible)" ahead of the 1st
> > comma - is that sufficient, do you think?
> 
> Actually, the next patch supplies better context, i.e. is more / also
> about avoiding to clobber Xen's own predictions.

Right, that I got from next patch, but given context switch is already
a quite heavy operation, does avoiding the cleaning of the branch
predictor make that much of a difference?

IMO it needs good justification given it's a change that makes the
logic harder to follow, so if it turns out there's no difference I
would rather leave the IBPB at context switch.

Thanks, Roger.

