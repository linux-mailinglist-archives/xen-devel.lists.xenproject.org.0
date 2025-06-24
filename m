Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162F2AE698E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 16:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023814.1399882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4zT-0004YN-TT; Tue, 24 Jun 2025 14:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023814.1399882; Tue, 24 Jun 2025 14:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4zT-0004VF-QW; Tue, 24 Jun 2025 14:51:15 +0000
Received: by outflank-mailman (input) for mailman id 1023814;
 Tue, 24 Jun 2025 14:51:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VtPk=ZH=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1uU4zT-0004V9-2i
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 14:51:15 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acb9005e-510a-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 16:51:14 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so49838685e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 07:51:14 -0700 (PDT)
Received: from [192.168.0.18]
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453646dc66fsm142056145e9.18.2025.06.24.07.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 07:51:12 -0700 (PDT)
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
X-Inumbo-ID: acb9005e-510a-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750776673; x=1751381473; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgrYtW/tv35w17TFnrQWr/y8Cm7FKQy0c9kZ6+U/U+s=;
        b=J+2oYapEdIPT6zTX9lxNlKWX5Ej5ypSC1S3ZK6dg2j0GG+PB0xVqUdM4oLnRd0CVdr
         AeP2H/kasfPch8e3frO/O1pE4zCHJmeAD7Yq5zEE73k0H2o3IlGXKfJn74MYoAqz4yPA
         19oGQO5p7ezqaazsfuI/t74Ty7RIV1s6pTG9jcrO+FwgdN/tPzaRYrJphwFHLFvelJhe
         C3nv24Z5RXd23hVSTRjBJuerVYJOObwTkvSCEqYSQBvFFAHZCD7TAOM6MGvQxp3PjpD1
         C86Q/vQPYS2UeuNSpWIxP58yXD7Qd/kKwC0i9IoDrmr3bfHdvyFKiMmsmnVwvP2TKGSa
         jGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776673; x=1751381473;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QgrYtW/tv35w17TFnrQWr/y8Cm7FKQy0c9kZ6+U/U+s=;
        b=eyzbwnToOJ+OqH2ZWJprnD5fa4lEV5J3jteQE/A/GxvCnCicZuei1Xy3pMppR85/fU
         gQn/ZlRUI0P7dI29qRYr4uwRomN8Z4b8CwiwBN+AW4A/Vdz0wH6tVjEsjOiuWFC1Tkkn
         t4dE7RFXSCZmM2gH6LcLTmjKz+7RDbZe2+CVbZsHa6XsjbGI/BD3rSK91nITV+v3xADM
         kjqR2gtY08YICugViZlomj7lOq1dDWGS+a5OvEOOzHr38Sp/hP5w4PJeePvwGJnlwCYR
         L9tHyxmFH0jI83vNMYtsZItXn0GrIUVaySk6xH7cc0pU3jZZ1BY7MJ1bp4ETJtn6JHf3
         TWqA==
X-Gm-Message-State: AOJu0YxLg86btdxzpa3CIXHeVF9iXpLVqxOQccVYoDIV8OmBfOpFCv1U
	dihbfHHInszStgSCUD/IXyv83qzKFBUiXgM9ZGVlHWjyCeHhGOh0Ml89SOud+0O7
X-Gm-Gg: ASbGncvWKTMQNrhED8q9/K9o7OWviSjp+0SFhJ4emwkuh7VEWaB6YWGsVypk6U0kba+
	ce8Za5q+58Vc/cpFQh47e5fGnIHnurz6xqXqTZ7sJGXA85LfzhQWxHWuMe81bOAnQDwxZfmWvJE
	gogNEJuArqVVGgD+oqfFJAxbpWXfXdsgG1l+ODA0dvuz39Ywjj0d/StuP+pN3o3ArLMXIUS9De3
	WZTaS+Mx6+wwSs4F2AakR/zf+w3UG7/oRlo/OiWPYnd99Yjnc4fb9kEawJRanNX1yTjbir8isvH
	pvpsj1s3tLPs+ykpLW5HRs8i6pgeoq8SAtwC8gCFX20f6fXbbIF/lQG8pJ7hRoFfpXfbjf5UgyT
	QAzzy64h9MDOXHDWP739b/L7yb/eJHoDC9pE3Zv7VYIyT1Xuh/mESFk1Ai5S27rU=
X-Google-Smtp-Source: AGHT+IFSCvw/fw3R7K3iRr+8t+Pvr1NIG4EpvtU0OP6x9SiFpy8ySl2l5/c7PhEW85sTOg+pPZI0MQ==
X-Received: by 2002:a05:600c:3b8d:b0:44a:b7a3:b95f with SMTP id 5b1f17b1804b1-453659f82abmr143099565e9.25.1750776672834;
        Tue, 24 Jun 2025 07:51:12 -0700 (PDT)
Message-ID: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
Date: Tue, 24 Jun 2025 15:51:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xen-devel@lists.xenproject.org
From: Andriy Sultanov <sultanovandriy@gmail.com>
Subject: xenstore - Suggestion of batching watch events
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 ngoc-tu.dinh@vates.tech, Christian Lindig <christian.lindig@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Currently, as far as I am aware, the ability of xenstore clients to properly
handle and detect batch updates is somewhat lacking. Transactions are not
directly visible to the clients watching a particular directory - they will
receive a lot of individual watch_event's once the transaction is committed,
without any indication when such updates are going to end.

Clients such as xenopsd from the xapi toolstack are reliant on xenstore to
track their managed domains, and a flood of individual updates most often
results in a flood of events raised from xenopsd to xapi (There are
consolidation mechanisms implemented there, with updates getting merged
together, but if xapi picks up update events from the queue quickly 
enough, it
will only get more update events later)

The need for batching is fairly evident from the fact that XenServer's 
Windows
PV drivers, for example, adopted an ad-hoc "batch" optimization (not 
documented
anywhere, of course), where some sequence of writes is followed by a 
write of
the value "1" to "data/updated". This used to be honoured by xapi, which 
would
not consider the guest agent update done until it received notice of such a
"batch ended" update, but it caused xapi to miss updates that were not 
followed
by such a write, so xapi now ignores this ad-hoc batching. One could 
imagine
many workarounds here (for example, some sort of a mechanism where xenopsd
stalls an update for a second to see if any more related updates show up and
only then notifies xapi of it, with obvious trade-offs), but IMO it could be
worth considering making this easier on the xenstore side for different
use-cases.

Suggestion:
WATCH_EVENT's req_id and tx_id are currently 0. Could it be possible, for
example, to modify this such that watch events coming as a result of a
transaction commit (a "batch") have tx_id of the corresponding transaction
and req_id of, say, 2 if it's the last such watch event of a batch and 1
otherwise? Old clients would still ignore these values, but it would allow
some others to detect if an update is part of a logical batch that 
doesn't end
until its last event.

Is this beyond the scope of what xenstored wants to do? From a first glance,
this does not seem to introduce obvious unwanted information leaks 
either, but
I could be wrong. I would love to hear if this is something that could be
interesting to others and if this could be considered at all.

Thank you!



