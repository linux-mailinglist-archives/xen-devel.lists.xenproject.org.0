Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A625C9FFB8C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 17:27:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864304.1275498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTO1p-0003Q6-M6; Thu, 02 Jan 2025 16:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864304.1275498; Thu, 02 Jan 2025 16:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTO1p-0003Nw-JU; Thu, 02 Jan 2025 16:26:33 +0000
Received: by outflank-mailman (input) for mailman id 864304;
 Thu, 02 Jan 2025 16:26:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xoa/=T2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tTO1o-0003Nq-H2
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 16:26:32 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52a18910-c926-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 17:26:30 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so121668825e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 08:26:30 -0800 (PST)
Received: from [192.168.86.29] ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea3d5sm461379615e9.5.2025.01.02.08.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 08:26:28 -0800 (PST)
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
X-Inumbo-ID: 52a18910-c926-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735835189; x=1736439989; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OS3A3dIMPTMuvov4aIRV5Thj198Bn/2r1Hb/Uku8GWQ=;
        b=E2SQVXPdVu9dOMbYtk1zsueMd1EOqMaYn5riF6SpJ1tsOgmzumr2jHsvnpfD4LE7yX
         BdE7pJa0pKjZ8a5tReZpRbNR2E3lYgeIslZouQZtcFtnwUYeGMbAvKhjf7LvNdzHTnpe
         KVKp/jDO3H3Feh4ll9RA15XBh5JAnHQ8xJ4kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735835189; x=1736439989;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OS3A3dIMPTMuvov4aIRV5Thj198Bn/2r1Hb/Uku8GWQ=;
        b=slNpnI+LwFcqz224e7cG6w9mrKcDHgaMfH4urbfWzNFY92EnaLAxm3Wt2s33PJ4F1g
         pl3oidlGFKhcE/dKK97VFlrxElUyl64XVja3zzXDNv8L8QapU/1D6P7uzcGsm8TZRESJ
         phbPv3Z0p6ypuSgKCGBmIKrs0KIbSVmFuGl/p0l/jfaBcFLaCX4FukDKZNmCMD0AOgA6
         B02XBiiwrQcAsvK4tiSO8wfp6yKH4m1PbLFPZ4+AsfMoiI5MMKhMhvLYaVbMfHUrc2I8
         s0W9Ie/Vf9WDNRxpGeylWW4qKH6mEzAqy8UMCfFZw9WCnkUfyFcW68lWSBskOIcFywG0
         kWwg==
X-Gm-Message-State: AOJu0YzT8qncaHW8bbpvlaE4cas/elwVG8oU+bFiW8flDgUWiJvsji7l
	LmDh9LIYz7lbOhOodrjOSqpFi0SrOK/xQmegQcenQzrPWyT3HDyJ90Bl1OLZw5h14+x68+9oQ4U
	Zbttnfg==
X-Gm-Gg: ASbGncuUzNNyV0hSDIl9Qt8VdqbAWCivLePLHisVPGs5XZZlXmVQmRfqz1jtQl9Yma3
	BnWj19+cLV+ex8JD9LvByVnb0/eeyHCqhO8s+coXt8ZaIpFvAGYMjJnvic+e//CvXlD69yeIVPS
	+HRv1K/E9IfSEsb5TMEGcMhw5JUIpsdr3pQoV2RVWa8Jsf8cou08ZBu07PJAudJ9vmDZ3yV5dw4
	njrmeO7y2M8XA4uLXit5AzevOlERudi24KEbWhJpsYETsWdoGF7B7pRWqmhZzNNSHc=
X-Google-Smtp-Source: AGHT+IHT4NvASYx3MBl7Exgd3QflQQksVGSRgAU5M8NG9i3cI2Jq5Ea666IF3i+ZNypLs3k0KC4fcw==
X-Received: by 2002:a05:6000:2c8:b0:385:fb2c:6034 with SMTP id ffacd0b85a97d-38a223f830dmr38647465f8f.47.1735835189058;
        Thu, 02 Jan 2025 08:26:29 -0800 (PST)
Message-ID: <0b4d4fa4-7d8e-444e-a4a0-f2dc677178a5@citrix.com>
Date: Thu, 2 Jan 2025 16:26:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Xen.efi "must be loaded below 4Gb"
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Forwarding a bug report from IRC from before Christmas:

---
bit of a random question, but: has anyone had any luck booting efi
builds of Xen? over the last year or so I've tried 4.18 and 4.19, Alpine
and Fedora builds, and on a Dell PowerEdge R430 and an Optiplex 7010
Plus, and in every case received an error that "Xen must be loaded below
4Gb"
---

The Xen.efi path does expect to be loaded below 4G, and does give up
rather than relocating itself.

Right now, I'm aware of at least one blocker to xen.efi being able to
relocate itself, and that is because it populates the MB1 metadata with
physical pointers into the ebmalloc[] region, which is in .bss.  Fallout
related to this was the subject of c/s 0fe607b2a1 "x86/boot: Fix PVH
boot during boot_info transition period" and a protective ASSERT() included.

The ProperFix(tm) is to remove ebmalloc(), and the scratch space in the
trampoline, and instead have a range in initdata to stash the bootloader
metadata, and use virtual pointers rather than physical.  This also
avoids us double/triple handling the bootloader metadata, simplifying
all aspects of the startup logic.

~Andrew

