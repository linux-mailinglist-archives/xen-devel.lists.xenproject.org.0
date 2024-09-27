Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D008F988147
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 11:25:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806149.1217475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7D6-0006yn-K6; Fri, 27 Sep 2024 09:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806149.1217475; Fri, 27 Sep 2024 09:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7D6-0006wQ-H9; Fri, 27 Sep 2024 09:24:24 +0000
Received: by outflank-mailman (input) for mailman id 806149;
 Fri, 27 Sep 2024 09:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1su7D4-0006wJ-Gm
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 09:24:22 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4690f21e-7cb2-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 11:24:20 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c3d20eed0bso2129788a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 02:24:20 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248bf61sm913929a12.59.2024.09.27.02.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 02:24:18 -0700 (PDT)
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
X-Inumbo-ID: 4690f21e-7cb2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727429060; x=1728033860; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zlYTD8WfKshjTuZMqYukxKXATDsyCs5cxT+XLL6L9gI=;
        b=hIKv4O54z/iAuicakFkD806pEOueXECNBT54RdmVBS8R+twj82VhYcyH5tyxJHBvuw
         7vxbyXekgOxfRClVFdxqqz55/J7zE2IKEWuH/inrA81cgto3OgBBB9XYaLsEfIL4bJgl
         IXqH/zyfovZRXrwy9KDXleLQhPhqyh9Izg+P7dtFYbRk7Zu/Tw69NNTTZlwbkVhS1cJZ
         cBHYsxTFZPtw6s81gpSvnoQTfeGmUNAwLgkP+Om66Eo9uZz+fJ3v7PLEhM2crnTPObvd
         L7YUe2wcr+pd6A/EkbTPo6GYsTdi3zk4Ey+dp3Ft7BbjA9PyI8YvUUbJbfTyL5z4ARzZ
         3O9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727429060; x=1728033860;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zlYTD8WfKshjTuZMqYukxKXATDsyCs5cxT+XLL6L9gI=;
        b=TSEyxNoyySC98I2PiwYgeakSIvZc0wAI8Vg9FZlxVQKV6LfvRfJROfJViQ2wFU0sSm
         aNBfNW/obVziDrI3NCJ1g380K1l3U5D+3vJdANGJ0lRiYsdb/uxwbeuk+Wi/+JIk2wl9
         ycwvKMD8pFrYySX3q5UQDTGx/j8uCQPf9P0endYGzlQVHl2udXqsVz1kTysbi14T4tdt
         UffNoh4H4C56wOrzfZwu43kGQuzC+x+sj5rgoogXtfxYJv4A+qv4Q4YQhh/FlJIHqIs1
         YVmUo8CR1acyFQwsGsRxkfIpZ7QtH2FFJ03QCrcC+vEn/6rAwvT0vTiXY3KyQbc25Mvb
         lHeg==
X-Forwarded-Encrypted: i=1; AJvYcCWUsrWthtWIAuf5VqBjEraGXxdfVeU96+y37/3qmrYuGOS7xZiRJZfTN78bpglyIOJ1jQA+j8u6WQk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxew0QdGttEItk8xWkQGudGWXEX+WXqnaIqaygKdstYKrhQXaLS
	dzF2bazBLRoi5dRG/EpF4mBdn3G4Co/eP2nMlWPZyn9O7lRDxX2qykE7eA==
X-Google-Smtp-Source: AGHT+IFMoDNnZ7l1PW0BA7+/7pB2tQx57/pzQHVbfgQipKFtUyukmCyHmK3iE/7CTrQoBa1c7zO5aw==
X-Received: by 2002:a05:6402:4410:b0:5c0:ad76:f703 with SMTP id 4fb4d7f45d1cf-5c88261ab2bmr2013769a12.24.1727429059363;
        Fri, 27 Sep 2024 02:24:19 -0700 (PDT)
Message-ID: <427c90f5824732790449a1dcba9e94facd04a462.camel@gmail.com>
Subject: Re: [PATCH v4 2/6] xen: define ACPI and DT device info sections
 macros
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2024 11:24:18 +0200
In-Reply-To: <18b146cf-c49f-4133-ac21-b710bf59d113@suse.com>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
	 <c5fd649a4ccd3a65a81dfab505fc99b2a679cda6.1727365854.git.oleksii.kurochko@gmail.com>
	 <18b146cf-c49f-4133-ac21-b710bf59d113@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

T24gRnJpLCAyMDI0LTA5LTI3IGF0IDA5OjI4ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAyNi4wOS4yMDI0IDE4OjU0LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL3hlbi5sZHMuaAo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL3hlbi5sZHMu
aAo+ID4gQEAgLTEyMCw2ICsxMjAsMTQgQEAKPiA+IMKgCj4gPiDCoC8qIExpc3Qgb2YgY29uc3Ry
dWN0cyBvdGhlciB0aGFuICpfU0VDVElPTlMgaW4gYWxwaGFiZXRpY2FsIG9yZGVyLgo+ID4gKi8K
PiA+IMKgCj4gPiArI2RlZmluZSBBQ1BJX0RFVl9JTkZPKHNlY25hbWUpwqAgXAo+ID4gK8KgIC4g
PSBBTElHTihQT0lOVEVSX0FMSUdOKTvCoMKgwqDCoCBcCj4gPiArwqAgREVDTF9TRUNUSU9OKHNl
Y25hbWUpIHvCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoMKgwqAgX2FzZGV2aWNlID0gLjvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqDCoMKgICooc2VjbmFtZSnCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoMKgwqAgX2FlZGV2aWNlID0gLjvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoCB9IDp0ZXh0Cj4gPiArCj4gPiDCoCNkZWZpbmUg
QlVHRlJBTUVTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPiA+IMKgwqDCoMKgIF9fc3RhcnRfYnVnX2ZyYW1lc18wID0gLjvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gwqDCoMKgwqAgKiguYnVnX2Zy
YW1lcy4wKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcCj4gPiBAQCAtMTM3LDYgKzE0NSwxNCBAQAo+ID4gwqDCoMKgwqAgKiguYnVnX2ZyYW1l
cy4zKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBcCj4gPiDCoMKgwqDCoCBfX3N0b3BfYnVnX2ZyYW1lc18zID0gLjsKPiA+IMKgCj4gPiArI2Rl
ZmluZSBEVF9ERVZfSU5GTyhzZWNuYW1lKcKgwqDCoCBcCj4gPiArwqAgLiA9IEFMSUdOKFBPSU5U
RVJfQUxJR04pO8KgwqDCoMKgIFwKPiA+ICvCoCBERUNMX1NFQ1RJT04oc2VjbmFtZSkge8KgwqDC
oMKgwqDCoCBcCj4gPiArwqDCoMKgwqDCoMKgIF9zZGV2aWNlID0gLjvCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcCj4gPiArwqDCoMKgwqDCoMKgICooc2VjbmFtZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcCj4gPiArwqDCoMKgwqDCoMKgIF9lZGV2aWNlID0gLjvCoMKgwqDCoMKgwqDCoMKgwqDC
oCBcCj4gPiArwqAgfSA6dGV4dAo+ID4gKwo+ID4gwqAjaWZkZWYgQ09ORklHX0hZUEZTCj4gPiDC
oCNkZWZpbmUgSFlQRlNfUEFSQU3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiDCoMKg
wqDCoMKgwqDCoCAuID0gQUxJR04oUE9JTlRFUl9BTElHTik7IFwKPiAKPiBNaWNoYWwncyBjb21t
ZW50IG1hZGUgbWUgbm90aWNlIHRoYXQgSSBvdmVybG9va2VkIHRoZSBzZWN0aW9uIG5hbWVzCj4g
YmVpbmcKPiBtYWNybyBwYXJhbWV0ZXJzLiBXaHkncyB0aGF0PwpJIHdhbnRlZCB0byBnaXZlIGFi
aWxpdHkgZm9yIGFyY2hpdGVjdHVyZSB0byBjaG9vc2UgdGhlIG5hbWUgYnV0IG5vdyBJCmFtIHJl
YWxpemVkIHRoYXQgaXQgaXNuJ3QgY29ycmVjdGVkIGFzIGNvbW1vbiBjb2RlIGlzIHVzaW5nIHNw
ZWNpZmljCm5hbWVzICIuYWRldi5pbmZvIiBhbmQgIi5kZXYuaW5mbyIuCgpJIHdpbGwgcHJlcGFy
ZSB0aGUgbmV3IHZlcnNpb24gb2YgcGF0Y2ggc2VyaWVzIHdpdGggZHJvcHBlZCBtYWNybwpwYXJh
bWV0ZXIgYW5kIGp1c3QgaGFyZGNvZGUgdGhlIG5hbWUgb2YgdGhlIHNlY3Rpb24gaW5zaWRlIHRo
ZSBtYWNyb3MuCgp+IE9sZWtzaWkKCg==


