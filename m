Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7931680F9
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:58:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59j7-0004xG-R0; Fri, 21 Feb 2020 14:56:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j59j6-0004xA-0J
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:56:24 +0000
X-Inumbo-ID: 53718ec0-54ba-11ea-8692-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53718ec0-54ba-11ea-8692-12813bfff9fa;
 Fri, 21 Feb 2020 14:56:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c9so2386624wrw.8
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 06:56:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IqRIWxKwBJEkaubiveY0lkt8RXGMXhx/NXng+UqORis=;
 b=jxGxtW4LTH+NwwNlscHyfHykQYq8iZ1iqLLCaweDqp+7cZZWDpsQssi1uNUNXTRPHH
 YgsVSsKSljOZFQQW9ojOAiTlJlvAVE0RXX+YE+FLgGYWcLsAGd1DrDVhG8g/QVywaDIX
 kWBd0YK1Eehujs7f8KouyrVWGBW1Butvn5GmURmscO7DeWEpt8WRPZm4XXsEoqKlIY1e
 1ztLK5lLzXEc9McWs8JpVsoB+1m3l6KFdcaqhsqVFIM9yC/R/BJOrMAjSm/d6z5dl0dn
 aAEDP018T2tQWAJe2hfoIh8lDk9NgjL3a/GB0DdiaL8xtcbjryaCgXYKWL4hXe2Poa42
 vyXQ==
X-Gm-Message-State: APjAAAXUlBJjnDvPcWSzL8vIc2b1IC4/tDM1DOzouAqeL3cMEdUE7xLp
 xqyjdIwKs5afCYGTSSBhp60=
X-Google-Smtp-Source: APXvYqxMYVM6pB0B41tu2G9PSviJOm7Qrb29epdqJGq/75vaWX4l6Aw/r7NmbY97pOsFVBgkzL02Vw==
X-Received: by 2002:a5d:65c6:: with SMTP id e6mr21825706wrw.45.1582296982568; 
 Fri, 21 Feb 2020 06:56:22 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id p15sm3957716wma.40.2020.02.21.06.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 06:56:21 -0800 (PST)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <20200221142635.GA4679@Air-de-Roger>
 <41526075-cab4-064b-dbd5-3d4667bb6309@suse.com>
 <20200221144924.GC4679@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <270e3f03-a1e8-1cf8-af82-e7fed515985a@xen.org>
Date: Fri, 21 Feb 2020 14:56:20 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221144924.GC4679@Air-de-Roger>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS8wMi8yMDIwIDE0OjQ5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIEZyaSwg
RmViIDIxLCAyMDIwIGF0IDAzOjQxOjU5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBC
ZWNhdXNlIHlvdSBuZWVkIHRvIGludm9rZSBzbXBfcHJvY2Vzc29yX2lkKCkgdG8gY2FsY3VsYXRl
IHRoZSB2YWx1ZQo+PiB0byB1c2UgaW4gdGhlIHN1YnRyYWN0aW9uLiBJJ20gbm90IG1lYW5pbmcg
dG8gc2F5IEknbSBlbnRpcmVseQo+PiBvcHBvc2VkIChzZWVpbmcgaG93IG11Y2ggb2YgYSBkaXNj
dXNzaW9uIHdlJ3JlIGhhdmluZyksIGJ1dCB0aGUKPj4gInNpbXBsZSB3cml0ZSBvZiB6ZXJvIiBh
cHByb2FjaCBpcyBjZXJ0YWlubHkgYXBwZWFsaW5nLgo+IAo+IFdlbGwsIHdlIGNvdWxkIGF2b2lk
IHRoZSBzbXBfcHJvY2Vzc29yX2lkKCkgY2FsbCBhbmQgaW5zdGVhZCB1c2U6Cj4gCj4gYXRvbWlj
X3N1YihhdG9taWNfcmVhZCgmbG9jay0+Y250cykgJiAweGZmZmYsICZsb2NrLT5jbnRzKTsKCkFG
QUlDVCwgdGhpcyB3b3VsZCBub3QgYmUgc2FmZSBiZWNhdXNlIHRoZSB0b3AgMTYtYml0IG1heSBj
aGFuZ2UgYmVoaW5kIAp5b3VyIGJhY2sgKHZpYSBhIHJlYWRfbG9jaykuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
