Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3973F9C5666
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 12:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834398.1250026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAp2S-00033j-PL; Tue, 12 Nov 2024 11:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834398.1250026; Tue, 12 Nov 2024 11:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAp2S-00031d-MR; Tue, 12 Nov 2024 11:26:28 +0000
Received: by outflank-mailman (input) for mailman id 834398;
 Tue, 12 Nov 2024 11:26:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yVpr=SH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tAp2R-00031H-CH
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 11:26:27 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f24b5cef-a0e8-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 12:26:23 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9e8522c10bso857083666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 03:26:23 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dee5e6sm704321466b.137.2024.11.12.03.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 03:26:22 -0800 (PST)
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
X-Inumbo-ID: f24b5cef-a0e8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYyNGI1Y2VmLWEwZTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDEwNzgzLjkwMDgwMSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731410782; x=1732015582; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YDUeboFTqpfDpgTyvfpA/Swkz5Hj6r2NHKCdkbebt5A=;
        b=ZGfSVcJT4/oxKS6eE7BvVhd7zuSKf8SLiNOVrgIN8FEWuI7CmdvyRGhRHgLnGooNGp
         2tuExP875XJYO6fWoDuGykyA/yntTC34MpWI2IoRE3t+/gV6JG9iBkLYQwnFkPAPmbvD
         KYs7O3RHutA0eF9v1mApFXeTE0JRyEeska1Ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731410782; x=1732015582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YDUeboFTqpfDpgTyvfpA/Swkz5Hj6r2NHKCdkbebt5A=;
        b=Dm43JhM+KpWE10aTALIdSyul6CaMGa6k9dxxQgaK0SovlgrZ3QGwNQI4q98NXC1OlF
         RlWEZ7CV1mC4v5xQRXKavZ+nsSBKN4LTxgaabRl+s7LGoXzwKaEYmmOHaeGoT0n2mthV
         sWS76MxLSuWfc/ia9iHixoPJKavQ7NMw6CfMAOlovlRxFjM0c+H7N2cOLdMW1hDPIvPz
         zbXfOugBU5RyLZc8Eii0Mx2mLU8rOwYwRT6U6k9hz7aCzih7TY3LpZia2XAlcnPxAEkt
         MA3bymbCkkzjzRDPLYS8ehP/CY35Fmce04kMSLBsWecpu2zUVwTUruUpLDOsOkwSl4/B
         UBmA==
X-Forwarded-Encrypted: i=1; AJvYcCV7hK60LjNp9gteFmGdbWFBrrYihdn+TLYQ1FQJ8XB+vx68nRjA0t8RUDb7/VwH8ks7lFmYq0qSwfA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCrpgzF1DRVfqrt/YXwTiOUhH3YBFdJGrUpyvajgivF6las084
	YivKTYsKmqcFqBjYh8gykP8X4NcOWCqPn/Dt9vsdPckAzcJH1M2GTJQjiXHmldc=
X-Google-Smtp-Source: AGHT+IEAMyArMZN66COTvW23x62lBLsbglG8DuIZGTgVFUxR5UVU5ftDDQqof+PQqDbAA1fuqahPeQ==
X-Received: by 2002:a17:907:7b89:b0:a9a:5b84:ac81 with SMTP id a640c23a62f3a-a9eeffe9032mr1099774566b.31.1731410782507;
        Tue, 12 Nov 2024 03:26:22 -0800 (PST)
Date: Tue, 12 Nov 2024 12:26:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen/vpci: Fix UB in mask_write
Message-ID: <ZzM7XZmKfFxys819@macbook>
References: <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
 <ZyswF4grJSNcVqY_@macbook>
 <Zysx4ZwCUv62uTBw@macbook>
 <6d3f322f-7047-4033-95b5-86751a58cc70@suse.com>
 <65d2043f-5e6f-4d84-8241-eb28dd94fc45@epam.com>
 <ZytkOP_7nmeSVEYH@macbook>
 <7c57371b-803a-418b-97cb-55e79516eed4@epam.com>
 <ZyuDwnYj5-uCWrMy@macbook>
 <f5d8396b-26a7-476d-9871-63f603b983bd@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5d8396b-26a7-476d-9871-63f603b983bd@epam.com>

On Mon, Nov 11, 2024 at 12:21:32PM +0000, Mykyta Poturai wrote:
> On 06.11.24 16:57, Roger Pau Monné wrote:
> > 
> > Let's try to figure out what causes msi_maxvec to be 0 in your case
> > and then we can see how to better detect this.  If msi_maxvec needs to
> > be checked it should likely be done in init_msi().
> > 
> > Regards, Roger.
> 
> Hi everyone,
> So I have done some more investigations, and I think it finally makes 
> sense. The real cause of my crashes was a long-standing bug in yet to be 
> upstreamed vpci patches where the register value and offset were swapped 
> by mistake. And this bug was hidden for a long time because mask_write 
> skipped actually doing anything, respecting vectors = 0, so I failed to 
> spot it from the get-go.
> 
> Regarding msi_maxvec there seems to be an implicit dependency between 
> CONFIG_HAS_VPCI and CONFIG_HAS_PCI_MSI. If HAS_PCI_MSI=n, then 
> pdev_msi_init gets replaced with a stub and msi_maxvec remains 0, but it 
> is still used in control_write unconditionally.

Hello,

If HAS_PCI_MSI=n then vPCI shouldn't attempt to handle the MSI(-X)
capabilities in the first place.  However that can lead to incorrect
scenarios if vPCI is used for dom0, as vPCI not supporting MSI(-X)
grants dom0 unmediated access to the capability registers, which won't
result in a functional system at least on x86.

I think the more robust solution is for vPCI to require
HAS_PCI_MSI=y.

Thanks, Roger.

