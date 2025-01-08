Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5570AA06024
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:31:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867621.1279187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVY16-0004pT-ST; Wed, 08 Jan 2025 15:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867621.1279187; Wed, 08 Jan 2025 15:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVY16-0004mt-PW; Wed, 08 Jan 2025 15:30:44 +0000
Received: by outflank-mailman (input) for mailman id 867621;
 Wed, 08 Jan 2025 15:30:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVY15-0004lR-7o
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:30:43 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8574317e-cdd5-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:30:42 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so287237666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:30:42 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e830b3bsm2525510166b.25.2025.01.08.07.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 07:30:41 -0800 (PST)
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
X-Inumbo-ID: 8574317e-cdd5-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736350242; x=1736955042; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAPuMNb+M3wU8pgWoX5uBk8yhxbzO4jf0DmnLwT2cns=;
        b=Hh3uNjPbNoVYuS3nUx99TS8Bjb6gpfhr4FGYeNhF1keOFZcROgs+VbUHy4O91qwKlC
         JN7cSqQFGYDKDxvrB6G5S4egCx07WyHQvaTfjMRp8MNh1NddZjDtjUqfhZYM0DYBnxp7
         4tw+mQY/myZQZB6XNNmbR2MKrx8sOSctYnq94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736350242; x=1736955042;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WAPuMNb+M3wU8pgWoX5uBk8yhxbzO4jf0DmnLwT2cns=;
        b=hfbQxyKwEIUz8yxDH9/LaHgmelEokcDaVhwiHI1y0dpu4NExZLih46BsEhlrQ0AnbE
         PYMrI9+snwdUmXhHDL3BuL590dWxGsCeF+yfcVQiX2TlrxOimdaMYgTy9RDB+goAbzZw
         Swekm+tqyQctYtqTlo0+bIOIAkZGTJe1XZQXcDkIiIf4i8iBzJrwlFJNV5IaS09JsQA4
         aFITNmexmlLaG02Xzy2socQ+jqTLXUdymh6sc3Dh990c3GOiLuDf1qYNHZURHBJ/Cu7V
         dzp3qbS3sQXBmSC4f9b/0Ww53ewZSefotDYataGyepWWLtZowlS1RBarN77eIGA20t/t
         i6Kg==
X-Forwarded-Encrypted: i=1; AJvYcCX73H8PHM4GmywLJref86tGl1HMOlw5n+40dWVZkNg6kgm/m2xK8dV1FuHMyG+rWoh0krDlJO76IkY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxi2evuct2Mt8gPVws4Ur/x7Y67Ub4xJQ+LQVp9eA+MJ6vO/ljU
	ETxOCbwjjpa2//fNZE1NcdqZ07GJoFXTZJPSl/8mhAaTvbZT3J9ymJXGD+UIncs=
X-Gm-Gg: ASbGncs7P25JWViOFPFDZIraO2CW31IbS3NEQ441KMi0cL+jjdQLsr90hxEOzPrGQrk
	QwHqA3+s4sd1YiBGIu4qFfQpYQM1BnsVtjmnTShJc7AXDfCrnasUud8oS7vcB4F6Wn+G4OKKS8z
	j8WcEYYks5uFq+jVJ+EDr31fmZvQvFMyAGSSlJSXkn+GNEqxUthOrWxkioV/UcaJPI/6o4bnH07
	J49PcQqzHfZu0zFGerFbzpcqnbrMPuYT6a0BCouD8d2SlK7BrB0GDl8sQDGRHw=
X-Google-Smtp-Source: AGHT+IF1jtzQrenLLUHw/EvIeYNySOEf6iabc3P+fv37Z7gziuh3XNcSRcDsyU7AYc6ytVKdb08DWw==
X-Received: by 2002:a17:907:70c:b0:aa6:7d82:5411 with SMTP id a640c23a62f3a-ab2abc6ca52mr307206866b.40.1736350241862;
        Wed, 08 Jan 2025 07:30:41 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jan 2025 15:30:40 +0000
Message-Id: <D6WSSGJ8EVDQ.ODGHM082XOM5@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis"
 <bertrand.marquis@arm.com>, "Volodymyr Babchuk"
 <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 00/15] Remove the directmap
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>

Hi,

Bah, I forgot to remove Wei from the CC list. Sorry, and beware the bounces
when replying on patches 2 and 4...

Cheers,
Alejandro

