Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705D8546C6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 11:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680336.1058444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raC5J-0000AR-Mi; Wed, 14 Feb 2024 10:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680336.1058444; Wed, 14 Feb 2024 10:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raC5J-00006q-Js; Wed, 14 Feb 2024 10:01:45 +0000
Received: by outflank-mailman (input) for mailman id 680336;
 Wed, 14 Feb 2024 10:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raC5I-00006k-Fi
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 10:01:44 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d9a4aa2-cb20-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 11:01:42 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5638de1d953so90932a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 02:01:42 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3ce8093f6esm1921867ejd.179.2024.02.14.02.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 02:01:41 -0800 (PST)
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
X-Inumbo-ID: 0d9a4aa2-cb20-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707904902; x=1708509702; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gtTT6VXl3pTBbwRSdecHEoBPSziWRDHJr7gxYr2gngk=;
        b=eclVRYznRnwvqY22iUKkqvf7kwo79TcIoQLPyD+grU9t3bNxmTVlaNRE8vav8XydDE
         VR5ySWkB3+0Dibj/PVmvjSDkntswhSotL7rZVn/d8Ts9glbg+7AXhrG2iH04yayA87rE
         WV1wQx3om68JCZ/RZH+D090huUtViCLddWgct8oAlsCG52paCedmzB5Jw3pqOKjW+oBd
         OPugX5wZCWw2AUFOtGh1ubG6MShKhqzTPYE6ylA84FyeI0kZORjSDmbuTBivv5QwW2gf
         ejCt6snDL+pYNm6h7OQTfnvTv3BNbB+V2PdP+0jG05/mRz0eu5LJWM2uTglXPqDfiK2V
         4qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707904902; x=1708509702;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtTT6VXl3pTBbwRSdecHEoBPSziWRDHJr7gxYr2gngk=;
        b=YSbtHSAgj0UgdmjMUV3TGN1MvZpizbrGdzrkXrRKuWYzDG62AiNAwe5d2177gS/hH0
         FYsgxOBwMARPSWBmmfCyIJlo1DoHDsrjXspLFISvXd5GcyafpxozE496TSzx6DJFRbPq
         ccOwJPCtPqObc3hBIOLTgWF67rByHRm4Aydn9lbXEzjXI+UviUletf6/9IJFmN/Yo/hW
         3IEPrYisQyl7KICEbwHFrWomMfN7lvJ4HFr4JIsKXqTBi5lIcUoSVclViRcRLy0pU+Mo
         GE+MRVhujfWUG1qT5MQ9JRof2xc2XKtTLWcfDboE1EMP3edDrV+CMqxNwsjm1yW9QYKG
         /TAA==
X-Forwarded-Encrypted: i=1; AJvYcCU3+7WIOKb0v7LoJ32CIdPVtRXcSve2builc5a03vK2K87drRABlGHIfRbGlbQd1aEH3NbWs8rAfZwgWnquyCBrtGEb4YLoIPymGVpWND0=
X-Gm-Message-State: AOJu0YwoVZsQzat5CiJFLMhpQhmsBXxgNYWwNMSP2ta40wsQ+39XnGMS
	vYpcmutABmSfsE+T/H7QN7yAJUb8lHZyYBKfQeR1CJoodHeOYfa6
X-Google-Smtp-Source: AGHT+IH4jARuR/kt65qvT/4tWtF+Zj4SxshcNkM+rOpBqsTUL0FY9t8J3TK17B05EfsXDk+n3xKOUg==
X-Received: by 2002:a17:906:f0d1:b0:a3d:3a5:f7ad with SMTP id dk17-20020a170906f0d100b00a3d03a5f7admr1373318ejb.10.1707904901861;
        Wed, 14 Feb 2024 02:01:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbqQq5r/fobu6cUCg0A+SDak9YjxdSky3yOE5mqSIZomcMvJtSMwOWDCsQKcJzXwLEQ5jJm5/TrgCGIiMJT12WiX+cncgWHwFFLGIA7vuJ7YduxlAzjnwa+HEV1vl7cu7+LCNXbt4CeXd6IQ8xOim4f+6RwRa13G/YM6t01wqb7VDbT2UxFAMoDcSrX2reUn5MmsNk214Dy0kcrQ9yx3R1nyYY0pW/7HMoqp5dlVReEXtj7FgbuKLhDpkDF21yD0wRy3p7UaCWahkLHwji9xmKXyY3hv1Fe/W6CSPK67lMdHomCiALbSI=
Message-ID: <dae11b4707f35469a0e9da798e5cab9cd5af280e.camel@gmail.com>
Subject: Re: [PATCH v4 05/30] xen/riscv: introduce guest_atomics.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 11:01:40 +0100
In-Reply-To: <ec76c372-8c17-4550-9896-eab3e0ab0c66@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <542c61229e1056c3fdec3a5c086136e3b5909b07.1707146506.git.oleksii.kurochko@gmail.com>
	 <ec76c372-8c17-4550-9896-eab3e0ab0c66@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-12 at 16:07 +0100, Jan Beulich wrote:
> On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
Thanks!

~ Oleksii

