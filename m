Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC10A104F9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871153.1282192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXei6-00059m-Ez; Tue, 14 Jan 2025 11:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871153.1282192; Tue, 14 Jan 2025 11:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXei6-00056n-CQ; Tue, 14 Jan 2025 11:03:50 +0000
Received: by outflank-mailman (input) for mailman id 871153;
 Tue, 14 Jan 2025 11:03:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXei4-00056h-VA
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:03:48 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aa5bab5-d267-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 12:03:48 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d414b8af7bso9554418a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:03:48 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9646bf9sm619310866b.175.2025.01.14.03.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 03:03:44 -0800 (PST)
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
X-Inumbo-ID: 3aa5bab5-d267-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736852627; x=1737457427; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=35mB+QjxPdevR8046RphJsKVW0nB2adhW14D5bTUKJg=;
        b=ed/0Yw63WtUIJCtiWXwQb52UAmFq+RrhMkfe8PYpGiYzE4GQrEOcpdTBT/I/Nr64/J
         HiIlrY3Q2fSkTt2rWKCdybIxMBLDOT+OVyhXVD7+JBYOsitj4/ISyJ9elDYZr5Csu6GT
         jJtT1cKivTD+8RY1fW3MWiJQ/RjUcr4+KdDDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852627; x=1737457427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35mB+QjxPdevR8046RphJsKVW0nB2adhW14D5bTUKJg=;
        b=ixIZqpepkvaWbyUx1Sq27xCIb9mpkzvnW9QYnsrZzfMWtrG/xwcwY1fTL+Kod1+s4/
         OoA79RqEuAVhG8edqIteBc3iEZSJvsBN9Sd9Tf5X9MQW4jQt35mLdefsAXd1LAIBTAax
         m/KcOaUEd53wHl3dbh/CqTT7NI4iG46AvQtNXCRM0NQpiFZu3Towof9xhGpZ1/K30XAK
         fw0hC1wAlEPnmwKAVdoq2kfyRfamySoGXjT4Rn7A1Y11T2+09NXn1OZgYE6ddDjz/XRD
         48rtjiwxm+P7aQIErfWhVcFFVLmnRyMa5nIK1kBZ5YqJ5LTsYfBD9dFMdmxZ9+Avf3R5
         5NHw==
X-Forwarded-Encrypted: i=1; AJvYcCUplP+GJF6JSWh8Lj/tHwOXbdLijfPeoiKMIpeu4zH3CW15nZY3ZAua0SiPIQujx8UnRWuDQ2zyOcU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYyV8SPey15TuywV0ftM8brC0GXyPqtTPJOFVKnfvVIQO/sTxk
	6LU4iMt7VNwpHTEvlnwsz05h3Mp7NGA+hjqQfbkbqZIEMix4y3r9K5sm0UrihYk=
X-Gm-Gg: ASbGncvh5OLKIc3/DtwhFsMbEs81XqiLfaaBp0HjabL4B75BYxZ0sDM9L1TRiTsZ9bP
	WfnWKgBUI2yYGJcrUU1af3GLPDYoJnro4iZ4TAc7R0B+ED2STlzJuigXUDVA4nY4xq//bvM2JGJ
	i/ELG/PjGh1tHA95YH1tuV9FN00CYXV5Hh+KDbD4tLrl5Z+6Bn57i4VoL9q9w1Ynw/QG3BIVF/C
	vKd6ZR9IpUFiXZ9wrtdlzm9p1liQh48PLo6yZdv9TkECwfU5zhxB1bbmEg9GPdMp+E=
X-Google-Smtp-Source: AGHT+IGJNe0LSVA3nGJ258TjPthdYloWMFdub4oksN9mfoT80xGa7EGoGjJP2iGpXQ9PWDACteVGUg==
X-Received: by 2002:a17:907:d89:b0:ab3:3aa6:7d69 with SMTP id a640c23a62f3a-ab33aa681a2mr240126566b.41.1736852625094;
        Tue, 14 Jan 2025 03:03:45 -0800 (PST)
Date: Tue, 14 Jan 2025 12:03:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C2=B4nski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 2/3] vmd: disable MSI remapping bypass under Xen
Message-ID: <Z4ZEj3i71TTPkuwc@macbook.local>
References: <20250110140152.27624-3-roger.pau@citrix.com>
 <20250110222525.GA318386@bhelgaas>
 <Z4TlDhBNn8TMipdB@macbook.local>
 <Z4UtF737b3QFGnY0@kbusch-mbp>
 <Z4VDIPorOWD-FY-9@macbook.local>
 <Z4VFAZnQ_09cdexm@kbusch-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4VFAZnQ_09cdexm@kbusch-mbp>

On Mon, Jan 13, 2025 at 09:53:21AM -0700, Keith Busch wrote:
> On Mon, Jan 13, 2025 at 05:45:20PM +0100, Roger Pau Monné wrote:
> > On Mon, Jan 13, 2025 at 08:11:19AM -0700, Keith Busch wrote:
> > > On Mon, Jan 13, 2025 at 11:03:58AM +0100, Roger Pau Monné wrote:
> > > > 
> > > > Hm, OK, but isn't the limit 80 columns according to the kernel coding
> > > > style (Documentation/process/coding-style.rst)?
> > > 
> > > That's the coding style. The commit message style is described in a
> > > different doc:
> > > 
> > >   https://docs.kernel.org/process/submitting-patches.html#the-canonical-patch-format
> > 
> > It's quite confusing to have different line length for code vs commit
> > messages, but my fault for not reading those. Will adjust to 75
> > columns them.
> 
> The output of 'git log' prepends spaces to the subject and body of the
> listed commits. The lower limit for commit messages vs. code makes the
> change log look readable in an 80-char terminal.

Oh, I see, thanks for explaining.

The 80 column limit for code mean the resulting diff (and `git log`
output) could have a maximum width of 81 characters (because of the
prepended +,-, ), but since Linux uses hard tabs for indentation this
is not really an issue as it would be if using spaces.

Regards, Roger.

