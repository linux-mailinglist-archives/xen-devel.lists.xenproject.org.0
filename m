Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AABB4A86C5
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 15:42:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264885.458159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFdIh-0008IX-8k; Thu, 03 Feb 2022 14:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264885.458159; Thu, 03 Feb 2022 14:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFdIh-0008Gc-4p; Thu, 03 Feb 2022 14:41:31 +0000
Received: by outflank-mailman (input) for mailman id 264885;
 Thu, 03 Feb 2022 14:41:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ap74=SS=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nFdIf-0008GW-TA
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 14:41:30 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dd0d910-84ff-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 15:41:28 +0100 (CET)
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
X-Inumbo-ID: 5dd0d910-84ff-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643899288;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=r5t3oiVXjagXb7bjTG448gBBaQt4H1arjpez6xgFQrQ=;
  b=a20xeHvDgLPdL6zJcwhFYa4+ieZyvQQq1m6jnuHXNMRExLXri8ENwez9
   G1NyeSzxCAJOlJV3pGzJBRUZ1oHzs7WE3yCMjyEP9rLtyRw0uvTyXPH0Z
   qVoGzu2q2cdyPYhH8nJ1yPmAzPREB+/x28Z27n3iN7gyZBKwJ404b3yMd
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: q37zmNw1Q1eAI6n41QOUPpgtHLcg8l6pC73MbBnh/5JxV7bTEvnWATP/fGrCs/aMPU2ErfpD04
 7/ny+gEkpFAZsd88llwgSznNOyOhzsh4KhCrlDzaolk+33yNDzoymFuUen/nrn9+aEyD4VVJJc
 z5UFuSR7VmFjR67P0NOg6RfpcdQesdlCRjzRBiMfcD33NLoQUygkDG7vd7aZZ60kt1M77QZWks
 DsLRQDZRZRGAN/Jab/QX9XF3rY0tA810mIfE4IjNeWP0dzrfvKXuo6VRWHTY6L7W+E7VpG0xVS
 GrVs0dUqJxF4GuqDzVBT1Qww
X-SBRS: 5.2
X-MesageID: 62879565
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SzJWVK47k9YsJa+PSkOE6wxRtHrBchMFZxGqfqrLsTDasY5as4F+v
 mcbXGGCOa2MZ2egfIskbt7k8B4Fv5OAnd9qGQRoqnxhHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2tUw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 9pwi5KoeVkVOajBxtQ8CQh5THxMIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQR6aBN
 pdHNFKDajzJRAJpYlU4MKgHneWqqkL0KmBZt3Wa8P9fD2/7k1UqjemF3MDuUuKNQcJZj0OJv
 FXs9m7yAgwZHNGHwD/D+XWp7sfFkDnnQosUGPu9/+RznVyI7mUJDVsdUl7Tiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0QMFMGuc37AWMzKv84AuDAGUACDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9YXCA8raZqxuiNC5TKnUNDQcbSSMV7t+lp5s85i8jVf46TvTz1IesX2itn
 Xba90DSmon/k+YA2JiF80j33Q6ro5WXfi9v9ySIA1C6u1YRiJGeW6Sk7l3S7PBlJYmfT0Wcs
 HVsp/Vy/NziHrnWynXTHbxl8KWBoq/cbWaC2QIH84wJqmz1k0NPa7y8992XyK1BFs8fMQHkb
 0bI0e+6zM8CZSD6BUObjm/YNijL8UQCPYm9Phw3RoAXCnSUSONh1Hs1DaJ39zu1+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmlk0/3iufAOS/OFuxt3L6yggYRtvjsTOL9q
 I43Cid3408HDL2Wjtf/reb/0mzm3VBkXMur+qS7h8aIIxZ8GXFJNhMi6ehJRmCRpIwMzr2g1
 ijkAidwkQOj7VWad1niQi09OdvHAMYuxVpmbHdEFQv5hBAejXOHsf13m20fJ+d3rYSODJdcE
 pE4Ril3Kq8eF22aq2lBNsSVQU4LXE3DuD9i9hGNOVAXV5VhWxbI6pnjeA7u/zMJFS25qY01p
 LjI6+8RacNfL+i7JMqJOv+p0X2run0RxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkQ8S4YpxGrpm14wk4N7rq+MIxwhoBiyTPV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNIfVgrdOWO0/0QiwL+1/VtLRWo/jJz8ZqGTV5WY0uGhhtCIeYnK4gi2
 +og5pIbslTtlhowP9+apSlI7GDQfGcYWqAqu5xGUo/mjg0nlgNLbZDGU3Kk5ZiOb5NHM1UwI
 y/Sj63H3uwOyk3Hens1NH7MwesC2she5EEUlAcPdwaTh97Ipv4rxxkAoz04QzNcwghDz+8ua
 HNgMFd4JPnW8jpl7CSZs7tAx+2V6MWlx3HM
IronPort-HdrOrdr: A9a23:cKbWV63qix3L+e8QJ5CwYgqjBRZyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/heAV7QZnibhILOFvAi0WKC+UyuJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZm6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngdOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k/Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXIISaCUmRMXee
 v30lAd1vdImjXsl6aO0ELQMjzboXITArnZuAelaDXY0JfErXkBerV8bMpiA2XkAgwbzYxBOe
 twrhKkX9A8N2KwoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIeLH4sJlOz1GkcKp
 gkMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNwd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDmRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dg/22J6IJzIEUaICbQxFreWpe5PdI+c9vcfEzc8
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.88,340,1635220800"; 
   d="scan'208";a="62879565"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKFeJGPYDo3IfQT+VmHx2Y0EMEEK8sqinI3BAqjxJxdSFWI4CTTBDZoxVv/um4AfA5TAxVzFz/Oi+fudbc/5f/amYB0nmdsgY2LSrttqZEVoDXwwBbBHynzGwcz/dn10uIvhfzKR4PSS0MN21xXtjkK9DwIR7AvJ6Ej+WAbZUH1rUYgbaOWglplM2Tch81j4yJU4w9FKG/JU08h1fb77VUEI183E8MIV6pzRw7+/xKR4iBbE8XELRFrdjf5a2SsrY0qo3CXKppwtTvSGmedtacOcmYnfIxtFxc2guDCdJLJWay0TEdrkoPKml68zFQr1BSePIddORJnH01XU7QoJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5t3oiVXjagXb7bjTG448gBBaQt4H1arjpez6xgFQrQ=;
 b=comSFbZvwcgB30JtEpb1+8VfQIUBv6lsiN47jGJUkOkiJ0Azlxyj8MUcfLY3k/0vfnRPuGxLYJ5re7NbkY84haQPi+OXyu3GEZsmz32/6XlvcvUPKof0nJUOqwBvSotKz9Whxjfk4wC3YIqHPa5EOFIlXLzA/31LyDGoUbEfzxtdXR72JHl10D9fq77/wZDLcJpCYIqUG2NEl4ahJhjns7GF9/Zh60juLZx3FaH9ndFiOTshrxMyiXQIKWNRXGplTRLpVols3dUFXM5rCNAn9wKMDlambTXSGYKWhFS2KVQpbcLPh/A07BMGyYlqe9c1SJXElP913/1gsGbXfGV9vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5t3oiVXjagXb7bjTG448gBBaQt4H1arjpez6xgFQrQ=;
 b=sb4qEyLtP3wATAhDxFOm1/lGb/3JrqdeWQ20ZvaWiRhEQdzk8Uv66bGBb+yrkx63TUUadrYU2dI5y4/KW3fZPemfaviA2qYw5y0OmDU29QIs3vwl/qiTsCvSJ0nE3Rnqzs2mI+YHFn/MG5L4W6VZR9DFQiZGvkESoCWs7v4uRjk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Modify domain_crash() to take a print string
Thread-Topic: [PATCH] xen: Modify domain_crash() to take a print string
Thread-Index: AQHYGQNtP3H+icKR40C9qFef/QWZtKyB12EAgAAGeoCAAAIkgIAABjKA
Date: Thu, 3 Feb 2022 14:41:21 +0000
Message-ID: <8a28b63b-a5f6-db0f-3108-646475912abd@citrix.com>
References: <20220203133829.7913-1-andrew.cooper3@citrix.com>
 <c0d82900-64d1-fe16-9283-deb7c324ff8a@xen.org>
 <ad7467d2-1cae-c8ea-1217-69f0924044d4@citrix.com>
 <348f062c-9aed-0275-f0ad-87a0eff8e986@suse.com>
In-Reply-To: <348f062c-9aed-0275-f0ad-87a0eff8e986@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5aa15e95-3313-4f0a-2b83-08d9e7233f40
x-ms-traffictypediagnostic: CY4PR03MB3031:EE_
x-microsoft-antispam-prvs: <CY4PR03MB30314EC6C054B43D87DDAE0DBA289@CY4PR03MB3031.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HNeLtnYzAP6pEJprtmd0FZFaeLrk6OHJNzhKujCPyzFa5xXe2PBfPEgf4zumdZGTW6dtROu4Ve3FRggIm4uj6wmq+imBuEVTjvrY+KnKfysREJBHy4fwmJAbuwh2km7y3nOMPIIyAfRwIif46dGPolrm++evNEG7QOj6O3UlR517RRzRSmc13Nivub9ctio1i/6FJZBW0mw5Dwetf5K7c3zKLm3UUZRVq8FxuGPpUNrrQ5JV5K9DB2FwwPQ2yTl9qkq/E8NfP51OoG3vJF6/Faq7iXi46LA/TGpwOwVp7u9v2hSAs6jMvZ5/oa9dEr6/qqbPVFWkOqUAk5VgPYQrkdIJpine1TfQhsSdoZ1/gEWCbCDIGdU+Zt/hPIccAZnU3NrrDEnibnXCY+5MfF0XxGdZTrj0QkZ4KrvqCVJ8X8dG+odAhOlDn4fYUYrrr5HagTPIdQNv45B/dqQpQfjBPdsFiXx2ettlwCgePHGIxjqKZLX2lsrJP5z12IFv45acZLCYjtOf36+DnxcU5JlJbZUkNpZ+96gQd2/a5lC1uQdtWkAYE0CQ0DsReFsDXRge3qoGiBI24mNEqtELjwmJR/CxoId2gQP2NblcC92NHTyg+RH8DQZ9YMIB+Enks2MMoVT0zZaOEvIgvAbIVlmKMkvEzOgYoivsxDhyb9jvB5gZd5rw0PbFUfYchqmHX6+Y8VahRuClcGKT2Xj+hhkY5dwfjaGhjmvyq0djNWPnitZ1dYl34Pd9waZY6NTHbDndNkw31ciYJyRpTQrrUzdByA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(6506007)(83380400001)(186003)(53546011)(38070700005)(5660300002)(71200400001)(31686004)(36756003)(122000001)(110136005)(54906003)(82960400001)(316002)(66946007)(66556008)(66476007)(76116006)(6486002)(6512007)(8676002)(8936002)(38100700002)(4326008)(2616005)(26005)(31696002)(86362001)(66446008)(508600001)(91956017)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZU0yeVZ2ckpydlA0aGtEb0JYTlgzZmN4VnpONlVZT2VvU3hCM0lWeXBTRzdj?=
 =?utf-8?B?UFRYcDlURXdTSTk1bHhCS2hidmdnYnJyZHpIOGZ6WlpIUUVFWHNMQTl5bzBI?=
 =?utf-8?B?VjFseFhnYklPbGpwNHFUYlllYklkNEI2SVVabXp0UnF6cm1OYnJBdEg4Zndo?=
 =?utf-8?B?MnNUZVN5dzA1NG1EcWlMUkdsZ3R0T1FmemltRVlQYSs5bTBOOGFDMTRUZklF?=
 =?utf-8?B?cHpHQmovcFdiZ05HNlNKaEdYZHQzRWwwenR2dEpJVUl0eGJjbnNFaUlRcysr?=
 =?utf-8?B?d082Qm53Qm8vaXZmdmM2Q250YmNzNVdKa1JuZUVid3p3d2xaYTU3VUwvSk1V?=
 =?utf-8?B?aEl0Nnh5dFJ1UDQ2OXdBQnNVTUlua2UzbjBpbzBIenkrNXVUNkI2TThXR2VI?=
 =?utf-8?B?b3V6ZW5hc0ovQ1lJOEsxYysxRGp1M3N4OFBzWG5sMENGTEo0WHhGdDJ3VHlU?=
 =?utf-8?B?QXFrbXlwU25Mc2Z6NDNEMVBCSEkvZ2pJVjN4WjYxYi9WMnNpL3l0Y2l5V2lB?=
 =?utf-8?B?MVp1Wno5Nis0U2F4STErRGRIdmwzSlc2R0FiME9SUDhaSFJHTkJORk50T1hN?=
 =?utf-8?B?SVRtQk9wakZPT2VFSzBqUjh3V1VTeENVaHZveDluZm8yS1g0YWZZVnNXVWN0?=
 =?utf-8?B?eXJKNmFvNFV2anRMNVJpSS9odlNVWjVaMjJ0WjVUOEVOSGZCTW9aUm5SOWI0?=
 =?utf-8?B?bGxXZWxFZHgxZ2hpeEw1Ym9aK240S0w4Ym1zdUdSUUpCQnRKOVB2RlR1dmdC?=
 =?utf-8?B?NStMalhSQ3pyUlFJdEp5dFRLY3NoSTZWb3J3aDlCNjV4Ynpheis4cUp2S3Zk?=
 =?utf-8?B?M25DNGxqaVUyRkM1OVhLQXF1YzhDM2RPN1lpLzFMVUZucnJCR1p6dkpQdzJh?=
 =?utf-8?B?NllsbE8rdTgweUZiZTJSQ3MwdTRDVzhrUXVHOGNyKzFqbkxYalJJYlZaN0J5?=
 =?utf-8?B?STBGamhZZ1JGT2xLZWUvUGE1T1VRYzhGMk9sWG1abzBJYlJKT0swZGNLYmxZ?=
 =?utf-8?B?SEVRN1RxQWtHSFpkUThkdmVSWTZMVUJwTmM1Y2RxZUJVTEM2TlVab3Y3UjJY?=
 =?utf-8?B?aXBZK2NtZjNJa0U1RnF3eHRmTmtKd0llQzM5Q3VLMWpLcFY3eXJoK1cweTRV?=
 =?utf-8?B?Y042MTk1U1F5Zm1RNGtpQ1ZoMnA5NzR5ZTN4aTJCTWNvM2ZOWTRGakNGOVdG?=
 =?utf-8?B?OHp6akFvNXovck1GZ0xueHRROFg5Nm5SS2puUk5PcVRqKyt3ZHIyWTJ2MEZM?=
 =?utf-8?B?WVhuNG5FdGlXL25SUlZIZytiMWVFNDN4MGZSUkdHZ3lQMmRnY2M2dFpKM2Iy?=
 =?utf-8?B?VnRkZHN0MWZFT2Y1NG92L05EQzlla3gzTExXSGg4UTdvWXlKNXlqaFpDemhw?=
 =?utf-8?B?dTkvSFd5Wi9ya0JTc0JDQkprd3NQZmd2UEt4MU9mZUVxNkZzVWhEWmJiTms0?=
 =?utf-8?B?UkJkZTFpWjJwZFVaWno2MXY4TitYTC9lb3Y2Yjl4c1pxcDJjZHg4azZ2cjFD?=
 =?utf-8?B?VXVpdnhNWmNkSlZpaTY0QVRMRGd6SGVCWVdaNkJEQWZSeDhKWHdjeW9ZakxY?=
 =?utf-8?B?a0VTbWJDdHR6em1nL1o3aUYraGN3VUdmWm9HRlRTUVoyd3ZQQThTVW1zNWYv?=
 =?utf-8?B?MzlSS3NwUUZiZEUwd3M5QWZFeDJlT1pmTm5JMi9WK3g4cU82VDNhZjZkZGNW?=
 =?utf-8?B?MHZXSEVnUEg2SnVSa0JReTZISSt2UUtFclRiOGFsQmxNdXMvZTdSSzdqc2Zi?=
 =?utf-8?B?dDhtTEVUcTJlbE9WRWFWVll4ditLd3diaGhaU3cwSkI5UkVOZlU4VHYvQTdQ?=
 =?utf-8?B?MW9oaCtnMzVxY0phVW1LdmM0aFdIYldneE9YTytSYzBSL1pNMFpVSklFNGZP?=
 =?utf-8?B?b09LMjV6dCs2WjFEOFdpOEJFakwyTThNeVRLRTRvOGpWWDJ1KzZUbkpsb0JX?=
 =?utf-8?B?b0VGRDAwSTE2WENxS1JYaXlZVUFtMWpRdmNqNWZDQVhLL1JpTGFmeENOVmlG?=
 =?utf-8?B?aGhlZFRBOXRHd2tMYkgxQzQ1SjR5MmZxUFRVUEc3b1VRNWpWVnltVWFvQVcx?=
 =?utf-8?B?WWw0ZW1nZHN0ZGVuY0tocnJEYUhuRi8zaFpRWjVrSDNZWHpQNjYxWThIMFBj?=
 =?utf-8?B?UnVpR2UzUGRMYXhJcitlaGZ0WWl4Z2xNODNjVGJrVG1hL00rMitON0s5MnZ3?=
 =?utf-8?B?QldpRkRoV2hRMmZzQ0lOaFZvUWRYVHZyZmRBYmFYcDNPMmxSQk1rTUdHTGFD?=
 =?utf-8?B?WnFVSVZtdnd4WWk3Tm5mMlJ2ek53PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD0F3C40F175124595C5E07831D16E62@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa15e95-3313-4f0a-2b83-08d9e7233f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 14:41:21.9583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /fxyTurIeKxk6gLF+J5PA1vsfqITBpF3za8IbFhYyAdddPQ/564tZfhs8uGK8oaHqXmVHkY77hhMP+T67KSXhlwAOnDetalN4jQzXE0RUUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3031
X-OriginatorOrg: citrix.com

T24gMDMvMDIvMjAyMiAxNDoxOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAzLjAyLjIwMjIg
MTU6MTEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwMy8wMi8yMDIyIDEzOjQ4LCBKdWxp
ZW4gR3JhbGwgd3JvdGU6DQo+Pj4gT24gMDMvMDIvMjAyMiAxMzozOCwgQW5kcmV3IENvb3BlciB3
cm90ZToNCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmgNCj4+Pj4gaW5kZXggMzdmNzhjYzRjNGM5Li4zOGIzOTBkMjAzNzEg
MTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+Pj4+ICsrKyBiL3hl
bi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+Pj4+IEBAIC03MzYsMTAgKzczNiwxNSBAQCB2b2lkIHZj
cHVfZW5kX3NodXRkb3duX2RlZmVycmFsKHN0cnVjdCB2Y3B1ICp2KTsNCj4+Pj4gwqDCoCAqIGZy
b20gYW55IHByb2Nlc3Nvci4NCj4+Pj4gwqDCoCAqLw0KPj4+PiDCoCB2b2lkIF9fZG9tYWluX2Ny
YXNoKHN0cnVjdCBkb21haW4gKmQpOw0KPj4+PiAtI2RlZmluZSBkb21haW5fY3Jhc2goZCkgZG8N
Cj4+Pj4ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4+IC3CoMKgwqAg
cHJpbnRrKCJkb21haW5fY3Jhc2ggY2FsbGVkIGZyb20gJXM6JWRcbiIsIF9fRklMRV9fLA0KPj4+
PiBfX0xJTkVfXyk7wqDCoMKgwqDCoMKgIFwNCj4+Pj4gLcKgwqDCoA0KPj4+PiBfX2RvbWFpbl9j
cmFzaChkKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0K
Pj4+PiAtfSB3aGlsZSAoMCkNCj4+Pj4gKyNkZWZpbmUgZG9tYWluX2NyYXNoKGQsIC4uLinCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+
PiArwqDCoMKgIGRvIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICggY291bnRfYXJncyhfX1ZBX0FSR1NfXykgPT0gMCApwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJp
bnRrKCJkb21haW5fY3Jhc2ggY2FsbGVkIGZyb20gJXM6JWRcbiIswqAgXA0KPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fRklMRV9fLCBfX0xJTkVfXyk7wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+IEkgZmluZCBhIGJpdCBvZGQgdGhhdCBo
ZXJlIHlvdSBhcmUgdXNpbmcgYSBub3JtYWwgcHJpbnRrDQo+PiBUaGF0J3MgdW5tb2RpZmllZCBm
cm9tIGJlZm9yZS7CoCBPbmx5IHJlZm9ybWF0dGVkLg0KPj4NCj4+PiBidXQuLi4NCj4+Pg0KPj4+
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
XA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmludGsoWEVOTE9HX0dfRVJSIF9fVkFf
QVJHU19fKTvCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4gaGVyZSBpdCBpcyBYRU5MT0dfR19F
UlIuIEluIGZhY3QsIGlzbid0IGl0IHJhdGVsaW1pdGVkPyBJZiBzbywNCj4+PiB3b3VsZG4ndCBp
dCBiZSBiZXR0ZXIgdG8gb25seSB1c2UgWEVOTE9HX0VSUiBzbyB0aGV5IGNhbiBhbHdheXMgYmUN
Cj4+PiBzZWVuPyAoQSBkb21haW4gc2hvdWxkbid0IGJlIGFibGUgdG8gYWJ1c2UgaXQpLg0KPj4g
UGVyaGFwcy7CoCBJIHN1cHBvc2UgaXQgaXMgbW9yZSBpbXBvcnRhbnQgaW5mb3JtYXRpb24gdGhh
biBwcmV0dHkgbXVjaA0KPj4gYW55dGhpbmcgZWxzZSBhYm91dCB0aGUgZ3Vlc3QuDQo+IEluZGVl
ZCwgYnV0IHRoZW4gLSBpcyB0aGlzIHJlYWxseSBhbiBlcnJvciBpbiBhbGwgY2FzZXM/DQoNClll
cy7CoCBJdCBpcyBhbHdheXMgYSBmYXRhbCBldmVudCBmb3IgdGhlIFZNLg0KDQo+IFRoZSBwcmlv
cg0KPiBwcmludGsoKSBzaW1wbHkgZW5kZWQgdXAgZGVmYXVsdGluZyB0byBhIHdhcm5pbmcsIGFu
ZCBJIHdvdWxkIHRoaW5rDQo+IHRoYXQncyB3aGF0IHRoZSBuZXcgb25lIHNob3VsZCBiZSBkb2lu
ZyB0b28uDQoNCldBUk5JTkcgaXNuJ3QgZXhhY3RseSBjb3JyZWN0IGZvciBhIGZhdGFsIGV2ZW50
Lg0KDQpJZGVhbGx5LCB3ZSB3YW50IGEgbm9uLXJhdGVsaW1pdGVkIEdfRVJSLCBidXQgdGhhdCBk
b2Vzbid0IGV4aXN0LsKgIElmIGl0DQphcHBlYXJzIGluIHRoZSBmdXR1cmUsIHdlIGNhbiB1c2Ug
aXQuDQoNClRoZSBzZXQgb2YgcGVvcGxlIHJ1bm5pbmcgd2l0aCBsb2dsdmw9ZXJyb3IgaXMgYWxt
b3N0IGNlcnRhaW5seSBlbXB0eSwNCnNvIGl0IGRvZXNuJ3QgbWF0dGVyLg0KDQp+QW5kcmV3DQo=

