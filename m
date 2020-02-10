Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179F157336
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 12:02:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j16nd-0001p0-BG; Mon, 10 Feb 2020 11:00:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jbPx=36=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j16nb-0001om-Ad
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 11:00:19 +0000
X-Inumbo-ID: 863388be-4bf4-11ea-b4ad-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 863388be-4bf4-11ea-b4ad-12813bfff9fa;
 Mon, 10 Feb 2020 11:00:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m16so7006812wrx.11
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2020 03:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dh466g/YkUytlM7S2ZIUYnG0AAZ0bZ4cjub32v0ehgI=;
 b=UEqcKTJBiJmQC0zPdXh3AA0JEIQeLVCRxizZoB/jRGKzBtsL/A3WB1R0vCHQr3BDWw
 EIirysJ83Bts7JLVnWh4IgP2BgLzdWMjomZ/tk2bqqILCK4cB5Yh3i711SBAplbvx7mb
 dGVhONM2ejqbjbF5q7SZvF6dTp2dTBym7KyeJ4fdro5gU/5HRHB3a26fkmcZcAD97eRZ
 jFN256uuYarRBSCPzKG3HYtfx2+rxMb5XODqxiV6lHHNQekCXbNcZpFbg8hxbkYUWLei
 arDXJxjHnqg5XBQRY3WMJL3w4JWfx8mg0DtZkVIUG8ymQlotX9uwVum88XOstVdcZxXo
 vskw==
X-Gm-Message-State: APjAAAVE5Z00ihYhfP7b1qv4G4NIy4XwGJe15oWakGlc+Wqxfv7Bs12n
 PlKXK0MFQwRKmuxxomy2/sA=
X-Google-Smtp-Source: APXvYqyH3uvlKEOAw3YVzY+Z5zF1HF/PE+R0FH/xzuyUd7J/pYs7BHfU6Tzi7FENjT+0vU2vLPvsJQ==
X-Received: by 2002:adf:e610:: with SMTP id p16mr1433493wrm.81.1581332418091; 
 Mon, 10 Feb 2020 03:00:18 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id 16sm139678wmi.0.2020.02.10.03.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 03:00:17 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200204173455.22020-1-roger.pau@citrix.com>
 <20200204173455.22020-3-roger.pau@citrix.com>
 <3d067f06-a054-bbe1-916e-ef43e2527f45@suse.com>
 <20200205132144.GS4679@Air-de-Roger>
 <775b8691-068d-2af9-1b59-d66233708595@suse.com>
 <69d410bd-2397-537d-6507-4c710d166396@xen.org>
 <1354b838-e30f-10dd-edbe-064fb159ef7e@suse.com>
 <0542d37e-8128-b94c-19ac-8506bf0d1b8a@xen.org>
 <58391072-5196-62e7-a09b-bc45993b50ef@suse.com>
 <4d6e9d92-d0cf-6f4e-0fe1-8cba69c72300@xen.org>
 <17344a8c-b5f5-ee48-a89d-8d5c0070e81f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <910276d6-a55d-87d2-cb92-055c53b9898c@xen.org>
Date: Mon, 10 Feb 2020 11:00:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <17344a8c-b5f5-ee48-a89d-8d5c0070e81f@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4 2/3] bitmap: import bitmap_{set/clear}
 from Linux 5.5
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC8wMi8yMDIwIDEwOjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxMC4wMi4yMDIw
IDEwOjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFBsZWFzZSBzdWdnZXN0IGEgbmV3IG5hbWUg
Zm9yIEJJVF9XT1JEKCkgYW5kIHdlIGNhbiByZXB1cnBvc2UgaXQuIFNvCj4+IGZhciwgSSBoYXZl
IG5vIGlkZWEgaG93IHRvIHJlbmFtZSBpdC4KPiAKPiBfQklUX1dPUkQoKSBpZiB5b3Uvd2Ugd2Vy
ZSB0byBhY2NlcHQgdGhlIG5hbWUgc3BhY2UgdmlvbGF0aW9uLCBvcgo+IEJJVE1BUF9XT1JEKCk/
CgpCSVRNQVBfV09SRCgpIGlzIG1pc2xlYWRpbmcgYXMgYml0bWFwIGFyZSB1c2luZyB1bnNpZ25l
ZCBsb25nLiBTbyBteSAKcHJlZmVyZW5jZSBpcyBfQklUX1dPUkQoKS4KCkFub3RoZXIgYWx0ZXJu
YXRpdmUgd291bGQgYmUgQVRPTUlDX1dPUkQoKS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
