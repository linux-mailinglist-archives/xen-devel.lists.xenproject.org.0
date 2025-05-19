Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8852ABBF0A
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989819.1373773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0RM-0004Nc-I0; Mon, 19 May 2025 13:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989819.1373773; Mon, 19 May 2025 13:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0RM-0004Kv-F8; Mon, 19 May 2025 13:22:00 +0000
Received: by outflank-mailman (input) for mailman id 989819;
 Mon, 19 May 2025 13:21:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG9i=YD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uH0RL-0004Kp-8g
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:21:59 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c61edd1-34b4-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 15:21:56 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso5615316b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 06:21:56 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b26eaf6e6a5sm6185140a12.17.2025.05.19.06.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:21:54 -0700 (PDT)
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
X-Inumbo-ID: 3c61edd1-34b4-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747660915; x=1748265715; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy1pJC7nbP1ymJfqNb61gZHd0v9aVsfr1yp1yHFOYIo=;
        b=IVXNjCuaJl5A4HOln2DGVrhX1Mc8Y3iFcrHk+uUnp/LUiKLLZYRzNzYiyefdAj7gYX
         i7+kA6u+PuH8LiencbZ57PwK/uJxRpI/PQUvaDt4HKunsCANQ6MC7pYxfCXw9wNizwOc
         VKZK5Xu6YqrPJ9eb0utD+0B7sJxHaUM6RJYlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660915; x=1748265715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sy1pJC7nbP1ymJfqNb61gZHd0v9aVsfr1yp1yHFOYIo=;
        b=bu7PQdV+4ksviEZI7zks3id3XNFhBjOeNczGtBSjlXdKxr5mtrwA24WInlvsQHNES/
         NNmlxGg7LsVCISBLesqhq9xKdtwc8YQOdiwPKIsqvOHKvoT2a8lrtCLIwAZW1w4+1Ofb
         BzeGXhy/2CtiBabCMMAT04xg4Nab+jkTV84T7y8VAuBc/fXnJHOWPp7Po4682RIXjJkY
         3IeYAemJa1sgaetwF70g4O10HlKAH2JOGfUlMgIh+AIyk0Sp+y4EVgqNViNa+18Vlqz0
         YdiSlCrqQ5N8Z65ra8EPbwUULuWN5guAfA0+hDEMW0OEACnIryVARSwQ1J+1tZJvo+F2
         0MCg==
X-Forwarded-Encrypted: i=1; AJvYcCVOZrz2K3ziKGhyzVc44kNJC/TvptN2H+B+lRXqM6dyxhLrUSI630N9twjR7xWeV4F9zlze/deV6zM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPsnpYaRAUAK8Kj/haZDWikdBA8c9UWVtTtRnHQTj20ckzXhA/
	AoBkMUXr99CIv7f9YoXm1Uw2Mv337cFqvPQv9pklPoYtniWkm5K1AgK0FLTUZSasPic=
X-Gm-Gg: ASbGncv+FEw7WEIfDPVV+mOAXyJdLWr9t29prHFi8/D3i0qikgjQ0nl5amA49cYuVpM
	p34LYYlfpbgra2tF6srdv8Z4I7cSBWOGNxD/MlEQmVCf5gNsA0JniE0Ws2l0oyZs5W0u/GsEeRu
	MSHD98c4wkoIZtYo2Ra4rTdgyr3hDM4ExcoP+JpnrD7tKtJ4uuVFAUBk+TtGLK3iDOXqQdSCuzO
	W5S2vUGedMiJ4+XXTuG9CMMmUWQ3N3x+Ez9mGBozkEy2NlShp0E3kiuHWJ58oInwkFQKxZRNk2d
	iHY5jtHvwTFd64rv+N60499cYN01MrWFgabaGNwERR/I/0ZdQEv4xWvcx60CUiDDyiOIZalbCzw
	QTB2vNsKoQwZIC0GTU3NqI/coGERFF3kbIOY=
X-Google-Smtp-Source: AGHT+IFRcFqUEmDbjhXB/nEScqqHFeANS3C8hjm3Bc9/htyd3VMNuG8wsrgsLzU/PI/36peBjVgi1g==
X-Received: by 2002:a05:6a20:9c9b:b0:1fd:f8eb:d232 with SMTP id adf61e73a8af0-2170cc90d47mr19195985637.24.1747660915251;
        Mon, 19 May 2025 06:21:55 -0700 (PDT)
Date: Mon, 19 May 2025 15:21:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v4 03/10] vpci/header: Emulate extended capability list
 for dom0
Message-ID: <aCswbbh-0GTdr1tr@Mac.lan>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-4-Jiqian.Chen@amd.com>
 <b569f90b-673d-44c0-b350-8a6f5f3c8d78@suse.com>
 <BL1PR12MB5849E0E13D669CE6B2755399E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <bcdc0848-0c12-4ee0-b923-c7d5243bf097@suse.com>
 <BL1PR12MB58494740C0B258C63C3EBC08E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <20d48f86-d7fe-47c8-89ab-61d816e1d6e9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20d48f86-d7fe-47c8-89ab-61d816e1d6e9@suse.com>

On Mon, May 19, 2025 at 03:10:17PM +0200, Jan Beulich wrote:
> On 19.05.2025 09:13, Chen, Jiqian wrote:
> > On 2025/5/19 14:56, Jan Beulich wrote:
> >> On 19.05.2025 08:43, Chen, Jiqian wrote:
> >>> On 2025/5/18 22:20, Jan Beulich wrote:
> >>>> On 09.05.2025 11:05, Jiqian Chen wrote:
> >>>>> @@ -827,6 +827,34 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
> >>>>>                                                   PCI_STATUS_RSVDZ_MASK);
> >>>>>  }
> >>>>>  
> >>>>> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
> >>>>> +{
> >>>>> +    unsigned int pos = PCI_CFG_SPACE_SIZE, ttl = 480;
> >>>>
> >>>> The ttl value exists (in the function you took it from) to make sure
> >>>> the loop below eventually ends. That is, to be able to kind of
> >>>> gracefully deal with loops in the linked list. Such loops, however,
> >>>> would ...
> >>>>
> >>>>> +    if ( !is_hardware_domain(pdev->domain) )
> >>>>> +        /* Extended capabilities read as zero, write ignore for guest */
> >>>>> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> >>>>> +                                 pos, 4, (void *)0);
> >>>>> +
> >>>>> +    while ( pos >= PCI_CFG_SPACE_SIZE && ttl-- )
> >>>>> +    {
> >>>>> +        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
> >>>>> +        int rc;
> >>>>> +
> >>>>> +        if ( !header )
> >>>>> +            return 0;
> >>>>> +
> >>>>> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
> >>>>> +                               pos, 4, (void *)(uintptr_t)header);
> >>>>
> >>>> ... mean we may invoke this twice for the same capability. Such
> >>>> a secondary invocation would fail with -EEXIST, causing device init
> >>>> to fail altogether. Which is kind of against our aim of exposing
> >>>> (in a controlled manner) as much of the PCI hardware as possible.
> >>> May I know what situation that can make this twice for one capability when initialization?
> >>> Does hardware capability list have a cycle?
> >>
> >> Any of this is to work around flawed hardware, I suppose.
> >>
> >>>> Imo we ought to be using a bitmap to detect the situation earlier
> >>>> and hence to be able to avoid redundant register addition. Thoughts?
> >>> Can we just let it go forward and continue to add register for next capability when rc == -EXIST, instead of returning error ?
> >>
> >> Possible, but feels wrong.
> > How about when EXIST, setting the next bits of previous extended capability to be zero and return 0? Then we break the cycle.
> 
> Hmm. Again an option, yet again I'm not certain. But that's perhaps just
> me, and Roger may be fine with it. IOW we might as well start out this way,
> and adjust if (ever) an issue with a real device is found.

Returning -EEXIST might be fine, but at that point there's no further
capability to process.  There's a loop in the linked capability list,
and we should just exit.  There needs to be a warning in this case,
and since this is for the hardware domain only it shouldn't be fatal.

If it was for domUs we would possibly need to discuss whether
assigning the device should fail if a capability linked list loop is
found.

Thanks, Roger.

