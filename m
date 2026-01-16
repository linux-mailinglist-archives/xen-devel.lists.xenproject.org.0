Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7EFD3298D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 15:28:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206693.1520066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgkoL-0007oC-Fp; Fri, 16 Jan 2026 14:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206693.1520066; Fri, 16 Jan 2026 14:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgkoL-0007lw-CN; Fri, 16 Jan 2026 14:28:25 +0000
Received: by outflank-mailman (input) for mailman id 1206693;
 Fri, 16 Jan 2026 14:28:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO3W=7V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vgkoJ-0007lq-Rx
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 14:28:23 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c32e493-f2e7-11f0-b15e-2bf370ae4941;
 Fri, 16 Jan 2026 15:28:22 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-655ae329d6bso1271829a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jan 2026 06:28:22 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8795168b9bsm261858566b.16.2026.01.16.06.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 06:28:21 -0800 (PST)
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
X-Inumbo-ID: 9c32e493-f2e7-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768573701; x=1769178501; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Oaj8qOuIakkOAc62hcs+ZprvirFF3N3/2V+KJMuKZA=;
        b=CFLPe7yTYTlhYX12q6wId3Mp1avOU7kTDgRWI4JLeHXcQcViQS7O2OVNEc8SGMFuBR
         XN6UrPMaJk+HcTz3HmtGzy/VQ++Mgb9Yy1macJwD3MPL3dE31QZpn80xg0txl5dyiYA1
         35nAcHxqI4Hj0rMoj2rDCX9+6yW7Xekddhl3MCljmLAd48L3HR2K3DBzC7Rain5OECjD
         jJ3xHXnykEzDXP60rSTzhTCgdaRjLfd0f8Z8WuUkLComSYAxFS2ALkD2AnCIXuXR2Pw7
         wISMj4bybUGeeyrJO4PVavb54mBd5cFFKg4q5ZT7AwdJpEu6XGnjdCQJLgdF9RmfSng5
         PSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768573701; x=1769178501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Oaj8qOuIakkOAc62hcs+ZprvirFF3N3/2V+KJMuKZA=;
        b=E7/83hvT8yCIPdTSI785UFP8G09TybqkBSqcqR/59uezCmToVs80oSBxhSFsslVI6j
         0KogF8y3NXo2EzK/rIfc/t0bKNivNzyTMIEhsjto0bPL+LlU7ptF3lfMgAy8FNFADlBm
         I8ZPjsYf/Oye/uRVutRh1gVEKvjp47LEpkcZeVhzKfXNwUq3DPmWE0kS1lUeAWiJaeYz
         M8QrFqdrhRtrp/TWF7Cyov4FFdBWJrSHOTaPBmgVisJLWxMJ43WsM7djH3Hcz6TeIwQg
         fZPkoVf92+Ih9FV8ghkOQjvpA+CAb+k3GjOBGKBXDjX69JLTZGjqTBJPrJKoemtcvTz3
         F5Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUzZQjOJ3tYCRsE8/onFEEYYiqthsCAKWAjEdCFqJkE7hNOA4sHABvN6B0mkCNgh4VDk4SFxZ2pKQc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkCzMgi053iO/MKRWZgbimVTt+ewqh/xTfO4ktk7308IPZ78vx
	uX3n7r8qD5iNSuYwhPNEh7BAG81KHLWTqxJX0PXU+lN0jM2n7OvFVEhE
X-Gm-Gg: AY/fxX5q331nyPoNRUWm82pxKrMDToNR70Hugzvs9V79Pk//wLZK2cE8QeiYQGDRiJ/
	9K6Bfzg91FEa8bBunNP9+Am4g4AUNUqslUu+osfyKh+LdcsSFsA34JoZFj2cUQGpkMWdMYlx4ea
	4g4qp+Xhb35fpVulPCrL/fA+RS7ySMYC8/OJwrhNML2SmN5ovpwVRkSqEipbWD+niO6aU0QcIag
	dhb+cKsw6kdHz/ybE7NfKCcGMCkBhU6Bv+yecz5TSx+QmdKfMUvHeFGu2h9TeNKXhhjreEtfQVn
	c9Mc1NSAsQvnHocQaPyPqPPud7mSM8tBgK2g/5NAFXQ4u+UEQ1qV0B+k0b8GV256tGx+09J7Pi9
	71bghJn718LdfUWWNrdKiLw4kVsCO/hBXKBmzoLw6GMCBrqkI/Nls6UqLTKa5K9FGi4ZdWIB27u
	IO1GljYJgq1CLhY2kqIe7Nx6wZ/ADGyOZ6JqcgNvDDaPlCHHxn1X70aqHyMmumEE0=
X-Received: by 2002:a17:906:f592:b0:b86:fca7:3dc2 with SMTP id a640c23a62f3a-b87968d4b0bmr216093366b.10.1768573701522;
        Fri, 16 Jan 2026 06:28:21 -0800 (PST)
Message-ID: <5270a5d9-96c5-44b9-b61b-ce1dc35453e8@gmail.com>
Date: Fri, 16 Jan 2026 15:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build/non-x86: fix symbol lookup in presence of build-id
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Mykola Kvach <xakep.amatop@gmail.com>
References: <f05fbf28-86dc-4910-96d5-922f8e7e4e89@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f05fbf28-86dc-4910-96d5-922f8e7e4e89@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/16/26 11:52 AM, Jan Beulich wrote:
> It's not clear why only x86 had $(build_id_linker) applied to all three
> linking passes. Not doing so will alter symbol offsets between the 2nd
> and 3rd passes for, potentially, all of the symbols at higher addresses
> (intermediate alignment padding may mask this effect, though, so it will
> look as if problems appeared randomly).
>
> Fixes: a353cab905af ("build_id: Provide ld-embedded build-ids")
> Reported-by: Mykola Kvach <xakep.amatop@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
...
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -28,13 +28,13 @@ $(TARGET): $(TARGET)-syms
>   $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>   	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).0.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	      $(dot-target).0.o -o $(dot-target).0
>   	$(NM) -pa --format=sysv $(dot-target).0 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).1.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).1.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	    $(dot-target).1.o -o $(dot-target).1
>   	$(NM) -pa --format=sysv $(dot-target).1 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


