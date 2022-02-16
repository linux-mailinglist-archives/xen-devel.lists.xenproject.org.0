Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC2F4B933A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 22:35:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274397.469850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKRwY-0005TA-Iu; Wed, 16 Feb 2022 21:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274397.469850; Wed, 16 Feb 2022 21:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKRwY-0005R2-FO; Wed, 16 Feb 2022 21:34:34 +0000
Received: by outflank-mailman (input) for mailman id 274397;
 Wed, 16 Feb 2022 21:34:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6VyC=S7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nKRwX-0005Qw-9R
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 21:34:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38c4f4e9-8f70-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 22:34:31 +0100 (CET)
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
X-Inumbo-ID: 38c4f4e9-8f70-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645047271;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AgdBK7sUvLgEaiJIffffzhuXLDVk8ixdjkNCD5Km92c=;
  b=gsCWgSUOO38YfxmdJSjmYjnfcVoT1ZPqITlTSudPoroEfzjPSrk9aHUL
   uxlsi2KGtNsO/oRhth1bKyoCX9kOVPSDpMl6ZaJva+TUzI1/thQIaEqen
   aSdlcoxc8cmVjwMaaMTxwwTRIyvKIJqbz5JDhd2CwjHco9nikQN4EWNmM
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: G84SvqdtrEHcTfvW0lzFkka4Tw1RFjydBtjP6BvC6maKhrJZ5YV7mKfyDuweBvZQeLQ+sYzwAH
 7AQRlD+eGk6MTm9mGyctgbnOti870+na+C8gJW6KsE7ahk7ld4aurWpuJ2e2v4CS2uUxg+OGbO
 6foGCY2LSVLRDVs2+afex62rKPSLoQBbvDEEBaYoQ5G3v09AKS0DKF5pJTc0g4X37SlIAGCEfb
 nV7i3SWijW7UH7OeVd/4D6b++x3CxFfPmBtEujYOLpO5UFmpfcicmdRZHjFVmT5sEdgXL2+THz
 cWN+meIUyWejaKSMfr0lnQ9q
X-SBRS: 5.1
X-MesageID: 66622945
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d5hlJq1LJWXbBMB6l/bD5QR2kn2cJEfYwER7XKvMYLTBsI5bp2RTz
 GMXXmmCMveCazPzeN0kPYrkoR4Au5TWndI2GwFopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrBh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhwPEs1
 P53r6CLZV0JGZaPxucXFBZaKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u2J4UR6eCO
 qL1bxJhfjTiWh8IYmwPGcsyvbuSv1n1SGVx/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfnnyn2RYYTH72Q7eNxjRuYwWl7NfENfQLl+7/j0Bf4Ao8Bb
 RxPksYzkUQs3BOKE8XWZQeEm1LenjknGIRTGao16jjYn8I4/D2lLmQDSzdAbvkvu8k3WSEm2
 ze1oj/5OdB8mObLECzAr994uRv3YHFIdjFaOUfoWCNYu4GLnW0lsv7Yoj+P+oaRh8a9Jzz/y
 iviQMMW1+RK1p5jO0lWEDn6b9OQSnrhE1ZdCub/BDvNAuZFiGiNPdHABb/zt6soEWphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AAzQ8h8rm78qi/6J+i8BQ2Swm8zb67onhezP
 ifuVf55vscPbBNGk4crC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6ENJGPiatM5TWuBF0y8kXY
 M7DGe71VCpyIfk3nVKeGrZGuZd2l39W+I8mbc2ip/hR+eHFPyD9pHZsGAbmU93VG4ve8FWPq
 IcAbZLXo/idOcWnChTqHUcoBQliBVAwBIzsqtwRceiGIwF8H3omBeOXyrQkE7GJVYwO/gsR1
 n3iCEJe1nTlgnjLdVeDZnx5Meu9Vpdjt3MreycrOA/wiXQkZI+u6oYZdoc2IuZ7pLAyk6YsQ
 qlXYdiED9ROVi/Dp2YXY67iodEwbx+snw+PYXaoOWBtY556SgXV0db4ZQ+zpjIWBy+6uJJm8
 b2t3w/WW7QZQAFmAJqEYf6j1Qrp73MchPhzTw3DJdwKIBfg941jKirQiP4rIp5TdUWfl2XCj
 wvPWEUWv+jApYMx4eLlv6Hcotf7CfZ6E2pbA3LfseS8Ox7F8zfx2oRHSuuJI2zQDTum5KW4a
 OxJ5PjgK/lbzk1Suo9xHrs3n6Iz49zj++1Twgh+RSiZal2qDvVrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoPraZyPUZujjO9vBkckz16Rh+8KeDTUgPbQKHjzZQLectPY4oq
 Qv7VBX6N+BrZsIWD+u7
IronPort-HdrOrdr: A9a23:T2Lz7qGw1rGhmbANpLqFTJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVp2RvnhNBICPoqTMuftW7dySqVxeBZnMTfKljbdREWmdQtrJ
 uIH5IOa+EYSGIK9/oSgzPIU+rIouP3iJxA7N22pxwGLGFXguNbnnxE426gYxdLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxs4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1Ssl
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGYFq/QpF5d1H2mxa1+
 UkkC1QefibLEmhJ11dlCGdnzUIFgxes0MKh2Xo2kcL6vaJOw7SQ/Ax+76xNCGptnbI9esMoJ
 6ilQiixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MYiFW5uYd899RjBmcsa+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zs93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkfgIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehT1Yd0s8LAp23FUgMyPeFPbC1z1dLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.88,374,1635220800"; 
   d="scan'208";a="66622945"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQcBpjbkHWQ69GfKGrdoJ7Co/rcg6Jp1sVU4I8eRwEc91gxPZjp9Wlqu+82ES03YVWfxj4GJf3zi6nFc24S2FaT+Fafc7CBQZkc/q1A/6M8KgmjLeNI4MqXEQxpPdDPte6bbSQLAbstnrJ7HYATii5zwzLm2GekoTNmen7+fXUBSqwe0CgoyxdQmHbZWPtiABnHCNJTiNU45azgPaGtVywptb03qyxkoiaLZpHnARtYD0xYKiD9NemL1DtX2yDfiUSb9HyrtRPQNI9ayRGu3flL0q6cuozze9hk0E31GhPq/iHNqUGZwUOvwIhiTQGb4aVTAn7AHOnCFB6rLfG+Z4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgdBK7sUvLgEaiJIffffzhuXLDVk8ixdjkNCD5Km92c=;
 b=du958pim3qok83Ruf5239enGJ2zY7TAqGbF97APiCmPbJYqn9W8kumAEh6CM6b0UG9yFzikereMvgRxCsBDIBtUs/Br7FWL+xo+p45f7nFAlvJgFLrFiqPS6kh3/Le7lu2soAH6TloW8GUa5+utvhVNU8kbyIsL48KD8rG97mXOwdtkp5zhPvnJGQoPUqMO68rFCy7sBM1aN/exxQIr3MHrVcArh32U3LmJmrclbC71U37LCLMOfunUSaVUAEs+ew+WkuO1yzPaSOjgWOwCUQQUpg3dqSH1xbz3scgzoiMIVjC1fkydFmDdDQHB4o7RpcBdzFACOOVjhLvJ4iXsbtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgdBK7sUvLgEaiJIffffzhuXLDVk8ixdjkNCD5Km92c=;
 b=N4LjNoEA+wBYVdcmZRDHOEVPqs1gutXdrBpV6BSSqN5K6ki9piE2pxcFMy6QsUwjrnacdgoQEizv2AXP2XArvHRGjAPB3EXtZCcHBxwvYaTmVidBl8l+UbZe6hSqOraHlRaHvsc/CJVSYGCaRRHTZHVvLnFaNNDVuy6AFj8866g=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 34/70] x86/emul: CFI hardening
Thread-Topic: [PATCH v2 34/70] x86/emul: CFI hardening
Thread-Index: AQHYIaPBW5BDF7b7HkCjMh8IXdikYayTDOOAgAGT+YCAAAhigIACDWqA
Date: Wed, 16 Feb 2022 21:34:25 +0000
Message-ID: <18ddd7f8-98fd-a1b4-e694-32bc338a33ea@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-35-andrew.cooper3@citrix.com>
 <2a5e1893-506e-e4fc-dbff-6001feec1e99@suse.com>
 <d62fddef-5cae-7334-ed0b-cc2c9313f040@srcf.net>
 <21e40ac1-277a-8675-1299-54561ab3d2d6@suse.com>
In-Reply-To: <21e40ac1-277a-8675-1299-54561ab3d2d6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49843bcd-bdba-4e2a-8546-08d9f1941ae5
x-ms-traffictypediagnostic: CY4PR03MB2949:EE_
x-microsoft-antispam-prvs: <CY4PR03MB2949BCCDF29DBB09FBBEA554BA359@CY4PR03MB2949.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T3LMDNeJ03PGxUmjdR0WVsvHmKi6JTuatAoxC+CAJgwFXj57jaXeOO1IvoIa3oAaXKlcGE41JX5G1OusbLSepay4vkyyQUaZR0Eku4hz8CzSXAzfMp90g7zKpcTuKxNGwfl8cOd/cO9EErICSAryht19G3G7Dncla3zOjvgoLqaZv3UWycbILXzQoavOX3cbbFa/b34X29UoSkYUooNIeKu6lwd1K4vhTmFdMGCIWDK+QW91+lyZtcgfhyXHdf9asWOZbD/HmanW6mso4ZG7u42qomWk3TtiJPcfViVEnYKMd9/5vfsb+LOqlO0aZq46xe/TYOygE6cRxxnNQOzsto88DSv5YbPwlaH+gNnsSmR4olxeXkdq41MfDNG5QpFf8HW6ssi41bDopY1Q+Gv7gkCDVmchwh4bl7eKapaBbLSjg7trr16JMbW+TFr+4TfFzn9HIEmJLs9Rc3Jd/GiUduQVBXE7p1irHp3/hFLtVMsdzNBEPuqWF9mdmnLPgXkfvIwE3A02x9lI9emmxZE1X3p1jWjaKL9iD+0e7yREA8CBnOjDZP9SRXwPCA+lDlF/k8HrhsxCjB5lRzyix9SbE5CHjah508+rX/3U+JTzwYzV2eJJqlos6ik4vFtqdUnmNSznCFgSNOMhxR3suq5bqFcovjLe5N+TdbrKOyW0DiV9Xxozs6eRmHxdjDFHaD6kBnQDOvrEpoRJxKFKfdEwflcxBpu3BFWQwn3AOMj2ht6Tr19aKr8vlMwqHkGKa0zpJa1j7CVW5vIfiH1muPE5oA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(64756008)(4326008)(66446008)(66556008)(66476007)(8936002)(6506007)(53546011)(38100700002)(66946007)(26005)(186003)(91956017)(8676002)(2906002)(71200400001)(5660300002)(122000001)(82960400001)(6512007)(2616005)(38070700005)(31686004)(31696002)(6916009)(6486002)(36756003)(316002)(86362001)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVFzcUhWODdtd3k2cFpMb3dFY2tRVFFid3ZCUlhRemVJakU3UHMwOWxrRlM5?=
 =?utf-8?B?TDR0VHVnSHd1TFFtMGI5eC9jRm5IQjBVemUwblNrZ2xoVTlJb1JBRE5xY0o1?=
 =?utf-8?B?WVNubXVKSHp5dXJvMGJBNzFwc0pUU0VWNjN3VUFjaVJQUzFObitpTVhiUVBm?=
 =?utf-8?B?NUxLVFhIdFVEOG5TaDlvTTlYZTMwT1ZFODZHN3NxQlZwYmdpaDM2WUFhYm9K?=
 =?utf-8?B?N3hkc0FqOWRKTFpQNGRab3RCT1ozYi8rdUdRbHZwd0NNRXpZU3laRWlXWlcr?=
 =?utf-8?B?SDhLZlo1dUNMRXRnN2NjeHJ1RE94RXRsQ0Y2am1XQXU2MkkxMVJRM0loczM1?=
 =?utf-8?B?RHNjK0hVVkhwTmhMQUVCK3RwU0cwMzMrUHU0QzlnN0xkbG41QWo3a1ZpYUFJ?=
 =?utf-8?B?aFo2MWM1REJyd3NZL0s0bG8xS2h0alFrcE5NYTdmRGFUTW5oRDY4VVpuUEtj?=
 =?utf-8?B?RUh4WHo0YTloZThzMXF5elZwMUxCTmprcUdRck1IVGRLK3lJSmtCZVc0OEo5?=
 =?utf-8?B?aWJaVGhZL1pyQm84SmdURG1vSU5VNGk4aXJxOWxaR0ExQy82RkhqMS9VcGRR?=
 =?utf-8?B?QlRxNVAwRDZnSks4VU13dStDWTh1ZEEvRDRBZVJJaXRaVi9DQkNvZXZrYVlv?=
 =?utf-8?B?RnRTZnB6aGQvTTFRN01Wd1R0TEF5aGFRZlppb3N0VTUxQW9BU09zZ3BKcFla?=
 =?utf-8?B?TjBXQTVOcDlDSjQ3UGxPaUt5WFpmWFMxWkhhYmJyUmNxQUdKbUtyQ3pYMUtz?=
 =?utf-8?B?cEZjZFJGUkNJYnYrSzVZNmNYcHRqSHJyelp1VmlhM2ZMUE10cURQL3BINWxp?=
 =?utf-8?B?NEZKVCs1NVFuTm1lQWF1WGswbXNzTUlvUU5uR0xRS3RvK0FrejNQZnJRQlJX?=
 =?utf-8?B?QUw3WXMwZFhsZ1VYUk9RaFFQYjNXOWNRRzBSTEFaNDRlbm9GWDNKZ0FIZ25S?=
 =?utf-8?B?RzBQYllsUFcrdWl1YkJMWUZIUGNPeG1wRlp4bzFZeWlSSTRoVkkyNm54ZFpT?=
 =?utf-8?B?TkVBWkZmNm4vdG5HR2lYOVBVc09GSFBIcFQ0NUovRE1qb2NrckRrM21qSDVN?=
 =?utf-8?B?bXp5TWE0T2hzNkRaRnFUc2tFYTJXNzdKclZrVmdwWDlLT1JlOWlCNUZnY1h4?=
 =?utf-8?B?a1VFbXQ1WWhTa3FkMTdpd042WHdKRWY5MXNMSVNDWDhBOFJTS0R1d1NxZWpV?=
 =?utf-8?B?Tmg3eVo0bUdTdDE5SDRYTDdkZ0pUR2ZvS21yZHZsK3prTXMvTm1JdXJjbTJj?=
 =?utf-8?B?aGNOcHJCVUFGSTNsY0hoa1VLYmpEWWZYR05qRk9neko0czRtcFJYVHJxRkNT?=
 =?utf-8?B?NktzbDhqSWdQTlNTT0h0bnBnVzlNSlpBU0Nwd2FtWXFzTGVBWisyNVhRRXY4?=
 =?utf-8?B?VTRZd1Q0K0ZjaE5VS1ZmbTRsNnhSNHMzZndxeVlqTlVQdVhPdUFrL3JTbFRw?=
 =?utf-8?B?aGN0RUNyWVN1b1V1UW5BWVlkenZjdWJZZE11ZUp6TnYzRDBaZGZ5akczd0tR?=
 =?utf-8?B?TUh4d3liZnpnWWVPSlNkdjltcWJ2N28zTVI3Y1BSZ09icE9CWTlTTzhTcFRi?=
 =?utf-8?B?ZTE2NFZyQWpTMW05VmdMRHhoQ1FpcW9UU2djU041TFpvRHVoU0lrYm13RWJB?=
 =?utf-8?B?b2swbjV1MlRWLzExeEhHQkZXSUE0Sk9tMDJ2Q0JWaVJIemVGMDUrQVQyOC9h?=
 =?utf-8?B?WmRQUVoyTE0ranhuMXA1RWhxV1FmOXpSaVlIQnMvSDZjdHN5SFNqR1VjVTUw?=
 =?utf-8?B?V0paS3V4ZnI1SG5HVllNN0plMUREYVRMUnV2RFpvSWxWN3BBSzhMOFEwWnhH?=
 =?utf-8?B?N2xlODJWMURrR2luZkp0S0JKYzNFTTFWS3czK3huZTgxalYvTUpMdTc3MTRj?=
 =?utf-8?B?SCtwS08vaFZEZ2xHM1lDbCtDVmt0L1cwOU1iNmlhZlZuUEZUUXQ3ejJGMXJl?=
 =?utf-8?B?TVpab3duaE9wYW00blNpMDNNU1JFbFQxbHJxVGxkdFhnQlRURXp3SmQ0b1A2?=
 =?utf-8?B?ckZ5NEh5YWRWdXkya3dldll3bTg5Vitxbm9BRzJSbVI3dEpNVmpnejRldXJJ?=
 =?utf-8?B?TWh1bk44SzY0SWFtSnIyMk1Cc0lXaU0xRWNsWUFyaSs0YkNWbFp5aWpJaUg0?=
 =?utf-8?B?UzRnejdEaGJXdUU3cGxBYjc0VTJYRFcrajQ3N1k0UVBSRzI5RzRPaThKY2Nx?=
 =?utf-8?B?cVRMUlh0amdKRFY4VzZXcFl0am5HaENjaVR5eUwwdnYrMmVZbytsNVFObXhV?=
 =?utf-8?B?MGdOcFZUbmRqMXltMUJ1ZEVhUXlRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC4F5A3D0BF81F4C98AFE31F64237A53@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49843bcd-bdba-4e2a-8546-08d9f1941ae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 21:34:25.7089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x1pzp8A4vKGLGSw7aJQHlVMokADlf/OFzI4F4VsPDrzGlqdeCrtgZvdr8N5dBm0phOXvtPmsiOsP+LZJ05FTGvVe7x2g1vcJc/PjZ3zi2t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2949
X-OriginatorOrg: citrix.com

T24gMTUvMDIvMjAyMiAxNDoxMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE1LjAyLjIwMjIg
MTQ6NDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNC8wMi8yMDIyIDEzOjM4LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNC4wMi4yMDIyIDEzOjUwLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBDb250cm9sIEZsb3cgSW50ZWdyaXR5IHNjaGVtZXMgdXNlIHRvb2xjaGFpbiBh
bmQgb3B0aW9uYWxseSBoYXJkd2FyZSBzdXBwb3J0DQo+Pj4+IHRvIGhlbHAgcHJvdGVjdCBhZ2Fp
bnN0IGNhbGwvanVtcC9yZXR1cm4gb3JpZW50ZWQgcHJvZ3JhbW1pbmcgYXR0YWNrcy4NCj4+Pj4N
Cj4+Pj4gVXNlIGNmX2NoZWNrIHRvIGFubm90YXRlIGZ1bmN0aW9uIHBvaW50ZXIgdGFyZ2V0cyBm
b3IgdGhlIHRvb2xjaGFpbi4NCj4+Pj4NCj4+Pj4gcHZfZW11bF9pc19tZW1fd3JpdGUoKSBpcyBv
bmx5IHVzZWQgaW4gYSBzaW5nbGUgZmlsZS4gIEhhdmluZyBpdCBhcyBhIHN0YXRpYw0KPj4+PiBp
bmxpbmUgaXMgcG9pbnRsZXNzIGJlY2F1c2UgaXQgY2FuJ3QgYmUgaW5saW5lZCB0byBiZWdpbiB3
aXRoLg0KPj4+IEknZCBsaWtlIHlvdSB0byBjb25zaWRlciB0byByZS13b3JkIHRoaXM6DQo+PiBU
aGlzIGlzIHRoZSByZXdvcmRlZCB2ZXJzaW9uLg0KPj4NCj4+PiBJdCBiZWluZyBzdGF0aWMgaW5s
aW5lIHdhcyBmb3INCj4+PiB0aGUgY2FzZSBvZiB0aGVyZSBhcHBlYXJpbmcgYSAybmQgdXNlci4g
SSBkb24ndCB2aWV3IHN1Y2ggYXMgcG9pbnRsZXNzLg0KPj4gSSBmaW5kIHRoYXQgaW1wb3NzaWJs
ZSB0byByZWNvbmNpbGUgd2l0aCB5b3VyIG5vcm1hbCByZXZpZXcgZmVlZGJhY2suDQo+IEludGVy
ZXN0aW5nLiBJIGRvbid0IHRoaW5rIEkgd291bGQgaGF2ZSBvYmplY3RlZCB0byBzb21ldGhpbmcg
bGlrZQ0KPiB0aGlzLCBpZiBpdCB3YXMgY29uY2VpdmFibGUgdGhhdCBhIDJuZCB1c2VyIG1heSBh
cHBlYXIuIEkgZG9uJ3QNCj4gdGhpbmsgdGhpcyBpcyB0aGUgb25seSBpbmxpbmUgZnVuY3Rpb24g
d2UndmUgZ290IHdpdGgganVzdCBhIHNpbmdsZQ0KPiB1c2VyLiBJIGFsc28gZG9uJ3QgdGhpbmsg
dGhpcyBpcyB0aGUgb25seSBpbmxpbmUgZnVuY3Rpb24gd2UndmUgZ290DQo+IHdpdGggaXRzIGFk
ZHJlc3MgdGFrZW4sIGFuZCBoZW5jZSBoYXZpbmcgYW4gb3V0LW9mLWxpbmUgaW5zdGFudGlhdGlv
bi4NCj4NCj4+IEl0IGlzIHVuY29uZGl0aW9uYWxseSBmb3JjZWQgb3V0IG9mIGxpbmUgYmVjYXVz
ZSBvZiBob3cgaXQncyB1c2VkLA0KPj4gbWVhbmluZyB0aGF0IGlmIGl0IGV2ZXIgZ290IHVzZWQg
aW4gYSBzZWNvbmQgdHJhbnNsYXRpb24gdW5pdCB3ZSdkIGVuZA0KPj4gdXAgd2l0aCBhIGR1cGxp
Y2F0ZSBmdW5jdGlvbiwgYXQgd2hpY2ggcG9pbnQgaXQgd291bGQgbmVlZCB0byBiZQ0KPj4gbm9u
LXN0YXRpYyBhbmQgZXhwb3J0ZWQgdG8gcGFzcyByZXZpZXcuwqAgKEFuZCBzYW5pdHkuKQ0KPiBJ
J20gYWZyYWlkIHlvdSd2ZSBsb3N0IG1lIGhlcmUuIFdoYXQgZHVwbGljYXRlIGZ1bmN0aW9uPyBC
ZWZvcmUgYW5kDQo+IGFmdGVyIHRoZSBwYXRjaCB0aGUgZnVuY3Rpb24gaXMgc3RhdGljOyB3aGF0
IGNoYW5nZXMgaXMgbWVyZWx5IHRoZQ0KPiAiaW5saW5lIi4gVHdvIENVcyBjYW4gaGF2ZSBpZGVu
dGljYWxseSBuYW1lZCBzdGF0aWMgZnVuY3Rpb25zLCBjYW4ndA0KPiB0aGV5PyBPciBpZiB0aGF0
J3Mgbm90IHRoZSBwb2ludCB5b3UgdHJ5IHRvIG1ha2UsIHRoZW4gSSBoYXZlIG5vIGlkZWENCj4g
d2hhdCBpdCBpcyB0aGF0IHlvdSdyZSB0cnlpbmcgdG8gdGVsbCBtZS4NCg0KWWVzLCB0aGUgc2Ft
ZSBzdGF0aWMgaW5saW5lIGNhbiBiZSBvdXQtb2YtbGluZWQgaW4gbXVsdGlwbGUgdHJhbnNsYXRp
b24NCnVuaXRzLsKgIFRoaXMgY3JlYXRlcyB0d28gaWRlbnRpY2FsIGNvcGllcyBvZiB0aGUgbG9n
aWMsIGFuZCB0aGVuIGZhbGxzDQpmb3VsIG9mIG91ciB1bmlxdWUgc3ltYm9scyBjb25zdHJhaW50
Lg0KDQpUaGUgYWJzZW5jZSBvZiBjb21wbGFpbnRzIGluIHRoZSBnZW5lcmFsIGNhc2Ugc2hvd3Mg
dGhhdCB3ZSBkb24ndA0KY3VycmVudGx5IGFueSBjYXNlcyB3aGVyZSBhIHN0YXRpYyBpbmxpbmUg
aXMgb3V0LW9mLWxpbmVkIGluIG11bHRpcGxlDQp0cmFuc2xhdGlvbiB1bml0cy4NCg0KVW5kZXIg
SUJULCBpdCBtZWFucyBtb3JlIHRhZ2dlZCBmdW5jdGlvbnMsIHdoaWNoIEkgc3VwcG9zZSBkb2Vz
bid0IG1ha2UNCmEgdXNlZnVsIGRpZmZlcmVuY2UgZnJvbSB0aGUgYXR0YWNrZXJzIHBvaW50IG9m
IHZpZXcsIGJ1dCBpdCdzIHN0aWxsDQpsb2dpYyBkdXBsaWNhdGlvbiBpbiB0aGUgZmluYWwgYnVp
bGQgdGhhdCB3ZSdkIHByZWZlciB0byBhdm9pZC4NCg0KfkFuZHJldw0K

