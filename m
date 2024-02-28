Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6D786AEF9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 13:19:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686547.1068734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfIuV-0000Rk-4b; Wed, 28 Feb 2024 12:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686547.1068734; Wed, 28 Feb 2024 12:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfIuV-0000Pq-1l; Wed, 28 Feb 2024 12:19:43 +0000
Received: by outflank-mailman (input) for mailman id 686547;
 Wed, 28 Feb 2024 12:19:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIhW=KF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfIuT-0007Te-DS
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 12:19:41 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4c460b0-d633-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 13:19:39 +0100 (CET)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-609408d4b31so4020757b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 04:19:39 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05620a03c700b00787f695c487sm18635qkm.98.2024.02.28.04.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 04:19:36 -0800 (PST)
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
X-Inumbo-ID: a4c460b0-d633-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709122777; x=1709727577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zIqV97Yzso96j6r8pPlx9zxMzC9ALupR+ISIpoZks0M=;
        b=IOM8LoIy/T+Lavsu1YYBmX/W6juFF4UYfyJEHbn7Upwfi8JMH8lbv/YDX56M7vCNh2
         k/+QdYzY2Pz7s3yNFMhktRjozBoQmnEMX1kyhXC5CM2ugEo3AxFe3kp52hFSzDV54b39
         hjge2C7sw5HD3kXBZddmxuXu2DuxNs1b15XJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709122777; x=1709727577;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIqV97Yzso96j6r8pPlx9zxMzC9ALupR+ISIpoZks0M=;
        b=exZlIDpbqDhvXx32Ei9hqa2hNvqVBqzOMUCVmWD4+tFeMC6cYySnti5Xau+p30K7o6
         4amRAtYDPFHClm8p+cWivOYekLjEmH9YlB5nk0OflifOheYzBMU8LF4xlFWkKkkBNCAy
         5hKYnkHSPhBSBrYOBhl0rDLfxP4L8aYYNtHFs/IsU/lA8mbjqTPAWLZv54Kx/Tw14rTf
         UMVb7c5b8YSQVJD+UY4axoIbBcmJC0Towny3ue3FJ7QTVC3AW6wNUMUBqSlPTHH3Qvv8
         XqMbqb/xTLfPmB6JX1kYQIGajSfU15/PleGBMePKfXmQErb6/VX4Nveo06wIzkiATN20
         zAZQ==
X-Gm-Message-State: AOJu0Yz4/IdWN/zT2CnXEa8jOMjQokpEYVLHfQ/zP4kYL8L8jQKeROhE
	Orp2qM8GKhveHWnudq3t1tNRLdc/JdfeJ8RnaxE5GQjkEeJWGydBBkQZOVpFzyxSKQIVlSvDPtv
	E
X-Google-Smtp-Source: AGHT+IGP72SvZHhHUPfQYaMtamT0Ld3mmJiNJIBtF+NnVQ3Qw/zpgYIjvYtpPAJrGQmiGc7sVsnFgg==
X-Received: by 2002:a81:b547:0:b0:609:344b:edf7 with SMTP id c7-20020a81b547000000b00609344bedf7mr3259043ywk.2.1709122777585;
        Wed, 28 Feb 2024 04:19:37 -0800 (PST)
Message-ID: <d81f78a8-3e04-4fba-95fc-3b602ee3a740@citrix.com>
Date: Wed, 28 Feb 2024 12:19:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: New Defects reported by Coverity Scan for XenProject
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>
References: <65df054dd791_2895d52c84469bd9989838e@prd-scan-dashboard-0.mail>
 <27fad7c4-905b-4181-9882-f383eb194032@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <27fad7c4-905b-4181-9882-f383eb194032@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Take 2, hopefully with Stewart's correct email address this time.

~Andrew

On 28/02/2024 12:17 pm, Andrew Cooper wrote:
> Not sure how well this is going to be formatted, but there's one new and
> potentially interesting issue found by Coverity.
>
> ~Andrew
>
> ----8<----
>
> New defect(s) Reported-by: Coverity Scan
> Showing 1 of 1 defect(s)
>
>
> ** CID 1592633: (LOCK_EVASION)
> /xen/drivers/vpci/header.c: 229 in vpci_process_pending()
> /xen/drivers/vpci/header.c: 189 in vpci_process_pending()
> /xen/drivers/vpci/header.c: 239 in vpci_process_pending()
>
>
> ________________________________________________________________________________________________________
> *** CID 1592633: (LOCK_EVASION)
> /xen/drivers/vpci/header.c: 229 in vpci_process_pending()
> 223 224 /* Clean all the rangesets */
> 225 for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> 226 if ( !rangeset_is_empty(header->bars[i].mem) )
> 227 rangeset_purge(header->bars[i].mem);
> 228
>>>> CID 1592633: (LOCK_EVASION)
>>>> Thread1 sets "pdev" to a new value. Now the two threads have an
>>>> inconsistent view of "pdev" and updates to fields of "pdev" or
>>>> fields correlated with "pdev" may be lost.
> 229 v->vpci.pdev = NULL;
> 230 231 read_unlock(&v->domain->pci_lock);
> 232 233 if ( !is_hardware_domain(v->domain) )
> 234 domain_crash(v->domain);
> /xen/drivers/vpci/header.c: 189 in vpci_process_pending()
> 183 return false;
> 184 185 read_lock(&v->domain->pci_lock);
> 186 187 if ( !pdev->vpci || (v->domain != pdev->domain) )
> 188 {
>>>> CID 1592633: (LOCK_EVASION)
>>>> Thread1 sets "pdev" to a new value. Now the two threads have an
>>>> inconsistent view of "pdev" and updates to fields of "pdev" or
>>>> fields correlated with "pdev" may be lost.
> 189 v->vpci.pdev = NULL;
> 190 read_unlock(&v->domain->pci_lock);
> 191 return false;
> 192 }
> 193 194 header = &pdev->vpci->header;
> /xen/drivers/vpci/header.c: 239 in vpci_process_pending()
> 233 if ( !is_hardware_domain(v->domain) )
> 234 domain_crash(v->domain);
> 235 236 return false;
> 237 }
> 238 }
>>>> CID 1592633: (LOCK_EVASION)
>>>> Thread1 sets "pdev" to a new value. Now the two threads have an
>>>> inconsistent view of "pdev" and updates to fields of "pdev" or
>>>> fields correlated with "pdev" may be lost.
> 239 v->vpci.pdev = NULL;
> 240 241 spin_lock(&pdev->vpci->lock);
> 242 modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
> 243 spin_unlock(&pdev->vpci->lock);
> 244
>


