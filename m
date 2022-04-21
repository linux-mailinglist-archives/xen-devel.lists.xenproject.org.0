Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478A5509CA3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 11:47:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309978.526534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhTO9-00071S-47; Thu, 21 Apr 2022 09:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309978.526534; Thu, 21 Apr 2022 09:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhTO9-0006ys-1C; Thu, 21 Apr 2022 09:46:13 +0000
Received: by outflank-mailman (input) for mailman id 309978;
 Thu, 21 Apr 2022 09:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5Hx=U7=citrix.com=prvs=10361b9f4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhTO7-0006ym-EX
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 09:46:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9435b47e-c157-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 11:44:05 +0200 (CEST)
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 05:46:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM5PR03MB3179.namprd03.prod.outlook.com (2603:10b6:4:47::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 09:46:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 09:46:01 +0000
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
X-Inumbo-ID: 9435b47e-c157-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650534367;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5SUBrspTLvRt4QobPVFslbzu6SyJIfpnPnCedK6hGsw=;
  b=TIFzWmdsFzPZh90slCeUKxy+lsRnwe3ZZi/3qh9og9i8ia/3c4I95X+F
   C8v5D37KpwxOgr1aFQt/OCL4ChKBVNPOpsOeHUHCGrSz9VikJ/OePr3H2
   hYYv+m1dI+csQKPOdSexsdUpWu0HwGeF1Pl1PGEmk4RvI/ymsrUMOXf9M
   k=;
X-IronPort-RemoteIP: 104.47.58.175
X-IronPort-MID: 69993523
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dD2696hR1425mcxc6VeTLb98X161gBEKZh0ujC45NGQN5FlHY01je
 htvWT3Sb6yKZzfwKdEnO9m18R5QsJaHm4NqQVA++yg1F3wb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nU4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YToIY7z2o8g3aTRZS34kLa9q+5zjPlHq5KR/z2WeG5ft69NHKRhveKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuI8ehWht7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJpsjmCl1Eri9ABNvKEXs3JacZR3XyU+
 G7A9mfWUkoAF9KmnG/tHnWEw7WncTnAcIAYGaC89/VqqEaO3WFVAxoTPXOguuWwgEO6X9NZK
 mQX9zAooKx081akJvHiWzWorXjCuQQTM/JSDuk75Qel2qfSpQGDCQAscDlFb9A3sd4schYj3
 FSJgtDBCCRmtfueTnf13r2Zty+oMC4Za2oLfzYZTBAt6sPm5oo0i3rnTNl5F7WupsboAjy2y
 DePxAAuirNWgcMV2qGT+VHcnynqtpXPVhQy5AjcQiSi9AwRWWK+T4mh6Fye5/AQKo+cFwCFp
 CJdxJXY6/0SB5aQkiDLWP8KALyi+/eCNnvbnEJrGJ4isT+q/hZPYLxt3d23H28xWu5sRNMjS
 BW7Vd95jHOLAEaXUA==
IronPort-HdrOrdr: A9a23:1z4Mqq0Kspg6DihbOQ527AqjBetxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hcAV7QZnidhILOFvAs0WKC+UysJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQjuVvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEw9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyTpAJb4RGYFqjgpF5N1H22xa1+
 UkZC1Qefib3kmhO11dZyGdgjUIngxes0MKgmXo/EcL6faJOA7STfAxxL6xOyGplXbJ9rtHod
 129nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMMjgZJq3PoiFXluYd499ePBmfIaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATxRlCvgEl7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTaa5mHu8OTca+F2SISxPRN2CZJ0jhCcg8Sjnwgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3YE7qAd3m5uw9zvkMehTIYd3A8LAv23EigMyMeFPCC1zxdHk+1829vv4YHsrXH/
 6uJZM+OY6XEVfT
X-IronPort-AV: E=Sophos;i="5.90,278,1643691600"; 
   d="scan'208";a="69993523"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DItxplop08xUHaO6FcDfv2apWRQZBP/kUNxI+kJUtwTLxz0cJuO5Cz5iNZ0YC4jP1b/AYL6us9RYYNyXgtUosHpDv1a7sCaAtL+GJTpxszjJxPSbUVMqO1YNMK4anZvffKhgtzP7BrkAwdOwIkCc3E3Bec+XFCfd141c05rNHKR61UR1VK+mhL6I/2a0j6yvdTcJw2VIT8ptyOEn/pcPGp6s2K/QsjUDNDu6mb5wEI+HEplNPKZIyR6tQUkMzLHgxQ5+o8BlxzN3RSzLD6jgQcdoSlOhRNYp71xk4wmM+70mvIkzXB/6cVpxzxxRFVHp5PxX9KB5lgLIvsbSvksEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SUBrspTLvRt4QobPVFslbzu6SyJIfpnPnCedK6hGsw=;
 b=DZ5ymCsuZ44HI9atoS6OKDIJzt8XIIiC0P5xUUJAJ/vkRP17BztljABn+ZpRxRllYgdnDRJ9TnYAd4vRBQJihNqYOsu8XSUOO5X8pmC4f66T67NMaFax0pKPbApdO1iKgdV7XBJCC95DGfkJUBb8URp0PWTpiJ5jueHq4Mb0epzDSNimSI2mNjMWfLelGPLYYHwrayDUrkoniLdAJjXJMz2jnc4PeK7uk34h5FVSyH9wR3jr25PAJgfuDRB2rQ1Vpw1Pv4FahsSU9qB0mqZFx9W7QCzF0U3DDHTpmQxYNg70ewPO92A3u7sHL9ly5nJitN84oHZ/WxZ7/sadNKKRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SUBrspTLvRt4QobPVFslbzu6SyJIfpnPnCedK6hGsw=;
 b=XVrxPItafdHzcEatLzaF2lW/3yuElm9dzmxcSXV3FmyJYS9k3b2Pp2413rC21CEFW+a3udw+lm33yviXHiE5/TMm813LTtVEF2R2r2Sbe8Szl+H33s8IL1sqRN8ymNdF80sccHCuCoJUIMl9kPTIALc+wBL0WD5NKbeb/txP0Jg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
Thread-Topic: [PATCH RFC] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
Thread-Index: AQHYVM9arFIsZUO7iUKZeaUlLxEzCaz49teAgAEjSoCAAAV3AA==
Date: Thu, 21 Apr 2022 09:46:00 +0000
Message-ID: <84c7a32d-9ff6-0002-8e42-4583a776665b@citrix.com>
References: <20220420155657.32506-1-andrew.cooper3@citrix.com>
 <70490620-16d2-6045-f83c-df65540025a8@suse.com>
 <33a37e77-0e38-2c5f-6bf9-2313b5dc5dd9@suse.com>
In-Reply-To: <33a37e77-0e38-2c5f-6bf9-2313b5dc5dd9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d270e99f-5e0d-4518-afeb-08da237bbe81
x-ms-traffictypediagnostic: DM5PR03MB3179:EE_
x-microsoft-antispam-prvs:
 <DM5PR03MB3179D23E1A77C93AF8C34E9CBAF49@DM5PR03MB3179.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4uZkfyB5U1nB4q+SDnHiB3PO9JR7WQVhFOD9rkvYECxn2m+5p6whhRSAJx0i/X9hM8Og1Qn++25BpAHo/ytO5hAyBW3FWHmct3F93uZuXdwLdO3aq+KrhwzoIrPs4xj731GOuOOnEuQmOElpZuLNmfg5HUfQU+B33vZ6sA8OgHBE+mudTp+T/I3Tb07fiC5e0xA8JJiybYqDkt7l/jr9amilQwHgth7s6tfp0SSubPhzMQAJUJ/czg5unLVd0ZL41gOFhmfUA+l5/kT8A1r1VTDpePalZmYxH/22zaZonbpgT5Hz1xtK+JlTEsC1sIf4k5A6O//TPXVFWRVfUc9KU+Ic6dvdKhLmmHNgKYLIfzAhX7SBsqx0cJugk2ox0w48gvbn2W4ot+qIbohuXGkSKFJysmuYHPckaS2ALookco4NPw5mRPtJJxnQf85fiqPUVxbUb8u8/LFAg4XxMqnVmQjG6ZtdlQD2sHEkSISo2N6bS4Q/aSOdDGkawPorHu9cwVPQUD/2l2jqXj+r2WS9qp0GY9tK6RAu6vJXI5Iz1ZmJFfwx2EwM73GHksPcHDhT/xzU5QT0JryQjqKPGkRlXiUMgFRBdxcLGsSXqXLNO8ZUJ9uFxbQ4XtQg2LFrbB0XFsvr4UyGA/j/7DkoowezZli/HkxR3GLue8iWtOUvjAk9MvgyGkIZEGxlU1+UMhfHNWYjTTmNeh1Cdb8L+EZcqS+heDX8G6fKz4skg1K0gM4Ba/IwXBrmXW06CMcSgbyJ9E9BG2rrb25lyYoA5UNvTg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(86362001)(5660300002)(508600001)(4326008)(6486002)(64756008)(2616005)(8936002)(8676002)(71200400001)(66476007)(66556008)(91956017)(76116006)(38100700002)(66446008)(66946007)(54906003)(36756003)(186003)(2906002)(82960400001)(53546011)(6512007)(122000001)(6506007)(26005)(316002)(38070700005)(6916009)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGhIRFd2QjdaZ09WR251NlVLUnA2SDhZWGRYbUV1RnR6SDVzSGJUTk9oQXhz?=
 =?utf-8?B?YTZZNzBVbFd0ZWtTTVhUcEN1Z2Z5UTNYaEJrVDRuR3Q0alpSaVZlcXg3eXFw?=
 =?utf-8?B?N0VYYmZadHdEdUd2ejUvOVJ6ck94Ri9iRWdDTi9Wejk5WVIvVlMyUUJ4TVp5?=
 =?utf-8?B?U0pmS2hqYi8zVnpBTEFrd000UlR2TFNkSkx0TnROb0lTTktIcmNJZTMvQUl4?=
 =?utf-8?B?SWJTYWZvQmo3RTc3a3NQbFBZK25jTnhkZXpuTG9SNE9wdFNCdCtCMUt5M2hJ?=
 =?utf-8?B?RmU5dU00V1dsZm1zNE95K013Wm5oak5Va1cxSjluNnNsNkNDdmVybjRqMXNt?=
 =?utf-8?B?ZTNhYVNhR09RTVgzMW44Y2pTM29MZHRYbGVvNE0vejBIVlJ4VEc0LzV0NDQy?=
 =?utf-8?B?L1JKRks3NWxKamI4Zy9EckE3TS9UZ2I0eFNsZ25MU3ZHOGdROVNuVFFnZ1dG?=
 =?utf-8?B?SHdoTitUR2hCVGlydmcvRFdhckRKSDZQSkZnM1ZXRFQyTmVWcEJ3VGpvOWhJ?=
 =?utf-8?B?RkEzSEl4OTAyUUxIUlZLeXRPb1dhTmZ5VUt6Q21lYThxNUplR1ZUN3I4VzBr?=
 =?utf-8?B?MC8wRGdoTFcyQU81b2g5enFKUC9zWjIrcDYzczBKRWRNcW1mbUY4MlByV3B2?=
 =?utf-8?B?K0pLcUMwaS9TVUpJb1hOOHlzNHhqSzBDd3RhTzRqNkF4dWF4T3RhYnZTb0VW?=
 =?utf-8?B?a2p6QXk2SnlWbXEwMzRQY1l6WWhuRlF5cG9YaThNLzNTWXVxeDYzcXU2OXVV?=
 =?utf-8?B?SE5yelVXeVdiUjN6UjdZeXBrREQvQkErdVoweWNyUnhiVHpUY1RYeGxwSUJo?=
 =?utf-8?B?MHdHV1A0SUF0TzdpeUhHQlV3cDhpWEtMZnpJWFN2aUNkRjc0WEViTVFZcUl2?=
 =?utf-8?B?REJpcFM4UjZkRHNIZ1FNb2JlU1d2Y0JqQ3JVcjBSWk5FbGY5TVhuK2tuMEsr?=
 =?utf-8?B?RkVCOGpQSkdpTklvNi9XSzJkdlM1TXdNVndBZ2R3c3dqMitEYytKSGVESXNi?=
 =?utf-8?B?V242K3ppKzRGVjZBVnBXSnJjNVNoT2hlVXRRWmd0OE1hZTdwamZvNUdkRmF2?=
 =?utf-8?B?bkJEdlNnK0lRY1B3Z2tiTEozV3NQZ1JSSGxCS09pUlh0Qjl4YW1UeGlvY1FO?=
 =?utf-8?B?TlI5WmZtN0dnaytDRlJINTlqNUVIUG9EbDZMZU1ZRVJZSktTSmdhamd1TGJu?=
 =?utf-8?B?YWJ6eFdEUk1YNXNXRUx0NzZ3dTR4U0E5b3ErVm0wTUJIYkVoaVpBdmUrMTli?=
 =?utf-8?B?WHZBZnd2ZWNER285SC8yM290ZTEzL05OaEdTc1NKdDkrQjBGWWhwaHl0aGdP?=
 =?utf-8?B?MnFuTGF6Z1k5dkpWUHV4YU5TTHNaZVo2dUV0clIvUjZkbDkvSU8vczRiRXpI?=
 =?utf-8?B?bDNWNjlyZ09LZGJKelRqb2JZaGVLNjhUemlsSXRaRnRsOG52WEJlRGtWWG10?=
 =?utf-8?B?bmpSMnMzTjhHN2NVRkx6MWtnVFFJVHF4c2NtY0ZoeE9vS2JjelBLc2Z2ZXN1?=
 =?utf-8?B?OUNYTjVZUndFbytzWnpHcUdZbTYrUnFNUXNlU3R3R3ppRFhvQ0F5WTdiQVRt?=
 =?utf-8?B?LzRrQXRLQkIyeUc4MUxYQ09sU3Rlcm9EK2wzdHhXUjJpNmw1Nkg3eTdLRFAr?=
 =?utf-8?B?a0dJbEUyNGIxNVNJOXpTbzJJZXdrN1ZobjRIb2RSMHBGNU5XK0MyQUwzd0lZ?=
 =?utf-8?B?TzZpQUgxQlVnRDdpZC9VNG1XM2hvRHFuNktEM2FsbmI1Q3U1STh0QlVqWHBq?=
 =?utf-8?B?c1Y5OW9TYlEvNVpzbEZSczRuOVZ4bzc0S3A5N1I2Ym9zRE1TNWdsTHFFT3lD?=
 =?utf-8?B?eDNBS2laYk84cmNPUXZDaFd2bDRCWEJ6NEdjRWZHeUEvNm9iVFBoNmREQkUr?=
 =?utf-8?B?NUVpSDZYSjNhVXdBZnJ3UW00VHk4K1o0MElUNjlHb2E0VGgyRWQ5amd4eG5U?=
 =?utf-8?B?a2wxWnM2bE5rZXFVaHREdjNRNVVJc3h3d1JqY09jWmk4cFhSNDVhbmppQyty?=
 =?utf-8?B?Uk5PYWtqKytSeXIvd1FEY2E5TCtYSEN6Z3dJVFpvbzc1aTFVS0w1b24zejJS?=
 =?utf-8?B?NlJRNStyNkRMUkR3OTBXNzBRVkJhTXBidkVlNU9xMG15cTlqYlFCOU5PN0Vt?=
 =?utf-8?B?RWFrTEkxR0hrekhrUXhJWGd0eEl1WHRYTW84VGtrNzBxS1lCUVdZK2lGVTdI?=
 =?utf-8?B?dFVDc1c1UzlDbUozbUljaWhTYjNtUCs2SVN0U3NhVHNoWThkUzZoNFJYdkwr?=
 =?utf-8?B?MmJWTk5keTlzc2pYSWtNR25TbytQcUdKeFZpNUJaemtHTCtiYnkzcTBOa3U2?=
 =?utf-8?B?dUdPNW92V1Z5MlFUQ0ZQcnVGYXA0N0lZUHRVekhtSy9ndVhINkRCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E1CE07ED2A31B4294A6AD7667F42FA1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d270e99f-5e0d-4518-afeb-08da237bbe81
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 09:46:01.0153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjuHRcAotVM9We10anlHEWWpH+rpTVxTHQuO1MTo7DCi1mSP1cE+/+GOv3/fDY/DzdITXCDLQxCcOZeUUg3R6XBVYUpVEcoRZQ8kYvm8DVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3179

T24gMjEvMDQvMjAyMiAxMDoyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIwLjA0LjIwMjIg
MTg6MDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBPbiAyMC4wNC4yMiAxNzo1NiwgQW5kcmV3
IENvb3BlciB3cm90ZToNCj4+PiBXaGVuIENPTkZJR19HREJTWCBpcyBjb21waWxlZCBvdXQsIGlv
bW11X2RvX2RvbWN0bCgpIGZhbGxzIG92ZXIgYSBOVUxMDQo+Pj4gcG9pbnRlci4gIEl0IGlzbid0
IHJlYWxseSBjb3JyZWN0IGZvciBwcm9jZXNzaW5nIG9mIFhFTl9ET01DVExfZ2Ric3hfKiB0byBm
YWxsDQo+Pj4gaW50byB0aGUgZGVmYXVsdCBjYXNlIHdoZW4gY29tcGlsZWQgb3V0Lg0KPj4+DQo+
Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCj4+PiAtLS0NCj4+PiBDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRy
aXguY29tPg0KPj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+Pj4gQ0M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+PiBDQzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4NCj4+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4N
Cj4+PiBDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4+IENDOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+PiBDQzogVm9sb2R5bXlyIEJhYmNo
dWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPj4+IENDOiBCZXJ0cmFuZCBNYXJxdWlz
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+Pj4NCj4+PiBSRkMsIGJlY2F1c2UgdGhpcyBo
YXMgaW1wbGljYXRpb25zIGFjcm9zcyB0aGUgY29kZWJhc2UuICBUaGUgdGw7ZHIgaXMgdGhhdA0K
Pj4+IGNhc2UgRk9POidzIHNob3VsZG4ndCBiZSBjb21waWxlZCBvdXQ7IHdlIHN0aWxsIGtub3cg
d2hhdCB0aGUgc3Vib3BzIGFyZSwgZXZlbg0KPj4+IHdoZW4gdGhlIGZ1bmN0aW9uYWxpdHkgaXMg
Y29tcGlsZWQgb3V0Lg0KPj4+DQo+Pj4gVGhlcmUgYXJlIHNldmVyYWwgd2F5cyB0byBleHByZXNz
IHRoaXMuICBBbHRlcm5hdGl2ZXMgd291bGQgYmU6DQo+Pj4NCj4+PiAgICAgIGNhc2UgWEVOX0RP
TUNUTF9nZGJzeF9ndWVzdG1lbWlvOg0KPj4+ICAgICAgICAgIGlmICggIUlTX0VOQUJMRUQoQ09O
RklHX0dEQlNYKSApDQo+Pj4gICAgICAgICAgew0KPj4+ICAgICAgICAgICAgICByYyA9IC1FT1BO
T1RTVVBQOw0KPj4+ICAgICAgICAgICAgICBicmVhazsNCj4+PiAgICAgICAgICB9DQo+Pj4gICAg
ICAgICAgLi4uOw0KPj4+DQo+Pj4gYnV0IGdpdmVuIG15IGRlYnVnZ2VyIHNlcmllcyBjcmVhdGlu
ZyBnZGJzeC5jLCBJIHdhcyBhbHNvIGNvbnNpZGVyaW5nOg0KPj4+DQo+Pj4gICAgICBjYXNlIFhF
Tl9ET01DVExfZ2Ric3hfZ3Vlc3RtZW1pbzoNCj4+PiAgICAgIGNhc2UgWEVOX0RPTUNUTF9nZGJz
eF9wYXVzZXZjcHU6DQo+Pj4gICAgICBjYXNlIFhFTl9ET01DVExfZ2Ric3hfdW5wYXVzZXZjcHU6
DQo+Pj4gICAgICBjYXNlIFhFTl9ET01DVExfZ2Ric3hfZG9tc3RhdHVzOg0KPj4+ICAgICAgICAg
IHJjID0gZ2Ric3hfZG9fZG9tY3RsKGQsIGlvcCk7DQo+Pj4gICAgICAgICAgYnJlYWs7DQo+PiBJ
J2QgZ28gdGhpcyByb3V0ZS4NCj4gKzEgaWYgd2UgYWxyZWFkeSBzdGFydCBlbnVtZXJhdGluZyBz
dWItc3lzdGVtIGRvbWN0bC1zIChhcyBwcm9wb3NlZA0KPiBmb3IgdGhlIElPTU1VIG9uZXMgYXMg
d2VsbCkuDQoNCk9rLCBzbyB0aGF0IHNlZW1zIGxpa2UgZ2VuZXJhbCBhZ3JlZW1lbnQgZm9yICJ3
ZSBzaG91bGRuJ3QgY29tcGlsZSBvdXQNCmNhc2Ugc3RhdGVtZW50cyIgd2hpY2ggaXMgc29tZXRo
aW5nIHdlIHNob3VsZCBhcHBseSBhY3Jvc3MgdGhlIGNvZGViYXNlDQpnb2luZyBmb3J3YXJkLg0K
DQpGb3IgZ2Ric3hfZG9fZG9tY3RsKCkgc3BlY2lmaWNhbGx5LCB0aGF0J3MgZ29pbmcgdG8gd2Fu
dCB0byB3YWl0IHVudGlsDQoiW1BBVENIIHY1IDAvNl0gQ2xlYW4gdXAgY29tbW9uL2FyY2ggc3Bs
aXQgZm9yIGRlYnVnZ2VyLmgiIGhhcyBnb25lIGluLA0KYnV0IEkgZG9uJ3QgYW50aWNpcGF0ZSBh
bnkgaXNzdWVzIHRoZXJlLg0KDQp+QW5kcmV3DQo=

