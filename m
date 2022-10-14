Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3565FEE7B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 15:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422867.669194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojKdu-0002Rh-Pk; Fri, 14 Oct 2022 13:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422867.669194; Fri, 14 Oct 2022 13:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojKdu-0002Pr-M5; Fri, 14 Oct 2022 13:22:26 +0000
Received: by outflank-mailman (input) for mailman id 422867;
 Fri, 14 Oct 2022 13:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JttC=2P=citrix.com=prvs=279f68966=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ojKdt-0002Pl-Ns
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 13:22:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c79f251-4bc3-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 15:22:24 +0200 (CEST)
Received: from mail-bn1nam07lp2044.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 09:22:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6542.namprd03.prod.outlook.com (2603:10b6:510:bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.22; Fri, 14 Oct
 2022 13:22:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 13:22:12 +0000
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
X-Inumbo-ID: 3c79f251-4bc3-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665753743;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZGxDAQVcrS8OJBF0jrpOCiQmZSbeKaLWnWg10+pSlds=;
  b=HWrC/RIOo+xwucCA1TBUotYco3vj4fyaP50nvoZnUA1+mBgBIrs+aX5t
   VHxruQm9DI8/XcreGcWPLMM5uUEsJQqL5Giou1a2inlwCv+lAB8Y9oCGY
   7dxIEAiXW4jFAcZuvSwonnrFmlG1SDUQ5a5Hx589Bzg203xn4IcfL7R8b
   Q=;
X-IronPort-RemoteIP: 104.47.51.44
X-IronPort-MID: 81855401
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ybEoIawB7NtO4hKUT/56t+cExyrEfRIJ4+MujC+fZmUNrF6WrkVWy
 mZJWDiBOayIYWf1etB3PYmx8RlU6p7SyoM2SlBuqyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtB4gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwob4rLjtQ1
 eMjFhcBMh2jpumf6aznVbw57igjBJGD0II3nFhFlWucJ9B/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI/OxrvwA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE1rafwH6nANt6+LuQ2tF0hVSowEgpUEMud0q5iuaIplzucocKQ
 6AT0m90xUQoz2SpR9/xRQylo1aLuxcdX5xbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHu72PSGmB8a+UoCn0Jm4eKWYYZgcLSAIE55/op4Rbs/7UZtNqEarwhNusHzj1m
 2+OtHJm2+lVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5L2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:7VcKDqnuGnzDAfeLaRA6TT4lZlbpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duf22vaIJy4EUbICbQRGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208";a="81855401"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmlVQAjUh7KBliSxzacb81Rc7aAf36MKWSsYb/IHxIM2NSJf49cN6Z/Ci42Zfxdf77Ve47pj80cugu61jshhnVLHC7Q1EesaDVL7Pvwl9SEEsLuKAnIz7+XFYxbliZH8GzzqG/5/b1fOBuuAqgpj/dWXwiikbE33SdSMvmC8OLCWPmqgQSk/svINijoujFmWMFOd2IoF1OIpLeeuXVTybfJjtxXH3Umkg4os5LFvr4UTLK05XFZoEWczzlHIW+mmRliJy025eJoyIt8pcYdDDi5i+R125URd8fMEsZptkpKlZQZ/0PVUai0YYXGxBPAC87235aCjqZHxI3q6way+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGxDAQVcrS8OJBF0jrpOCiQmZSbeKaLWnWg10+pSlds=;
 b=d2brQohAtIHrBKATnzqHXdfeHeWGaOUsVCfNo9+iWGRZwUakDzDDZoddV4cfMeJXba06Bjv7NDzkXtUJ1xqPeq5jv+lHnnzzp5slli6GHhz6CDsGNhnjrGsGvzXBGeDgRAcIiHcsGn4mFSif30haGqJgwqK6mJmiOMWMzBIVx2RoSJroPQgiWxGfP9y546ugUOP2Cy5WpNCf93eT047joFtg15XmbIDiNSJL4bfQFDn1vex8M0PvJ7hwS5RuJt7z5t1QdDbetORnOyw7viu1hrDxXbA1SyAnLD1R6/wx2Zz+CPvCKRSJMPyTAAtYpNzeiFLkIMwe4Z7xc7LxRafp0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGxDAQVcrS8OJBF0jrpOCiQmZSbeKaLWnWg10+pSlds=;
 b=C5JpQvo6bfBQZhZLCviS5F4oxTfvBZXNZD0VsJ2hzftyWKI69IMhRXf12MQIOsN9gR7lYTNRYlW+sKRPTUrN9kXk+judyV90EOa6qWqdKFqIKNxeLRrs1HhR/qZt7xvP95Me8MLc5XfCR61KhLBLQCPSiicCFlxY10ckOPY/zfo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
Thread-Topic: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
Thread-Index: AQHY2oN8A4y+jZE/1ESf3tQREpmAra4N6ukA
Date: Fri, 14 Oct 2022 13:22:12 +0000
Message-ID: <d12f3e75-db44-c7a5-958d-06ea99f881f0@citrix.com>
References: <20221007193124.20322-1-jandryuk@gmail.com>
In-Reply-To: <20221007193124.20322-1-jandryuk@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6542:EE_
x-ms-office365-filtering-correlation-id: d606dbc2-c807-4edd-230d-08daade71adb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jnNen2zF4lx+HkKqVmA5RQbexL0qVbeuKc0RhERTmN7DP6O6VzlE+tbPvhv6KTMx0cN6pd5D0v58pSt3lPRgVuWf7u1uUb+Y5lSF8z51pVDwCG/CVfLLPkmXAiqr3TRXsLRvV1GLgrke3i+AHEudHtrGcmPBFHguBtWv+9LWL925D0IAveXe9trvzpJyqkAOUuuATpZJb9kJqVEJQODB4zBBsP7uh8r7+dWtxLkruX+ZS8q+bsgyaOxhTVr9l5B0oE9CRskhHKi2F5JakgP1l/ckamwWFRpOloztbuQoWOxWE8tfuwlDP7hwdrZ7MckIEdEdxkK81Pu43RFfr2Vx08isGGSXUbtwy64D3zjtqjOxnlaKRjUT0tVPu5TtgpydTAuIsldgqg4PAAyYJS3lvcsysw13iuqwipQUH2h6qrLOAPET1yB7Xy4yxFzRWEUNOiRNoDsmqk83HN2+VEgTVYVTcjHO9nVQMG38dKKP7P4YJy8n8UEwCCEPPVaayBuQr5vAra5Bsm4wll2KFwahjYBncgpBsUWjBRj7qyodC22PaL5RsomkokmykP+/iJpmx1xh+coZnKiRzLk5wJ9ZcNvdhLvTbev87GlX791/5L9RRrKGRHUsejnU41vkMlk4I3ZShHprMJPSlpyXvFGZ52jTcFqr9TaPG9INomRc5KUXhIO4z1ThUNhN0gTiCT0H+GzVC8fuUg1sSAWEcjkUEAdYSq3EFha2wnNgwN8QF6KaO7Bpc+yLHJBuLHjc8nsSs2fEmeQ2nLTZPQh9jZViiUTXvyL0p1bquciLLyzD9tO3/7H8b6ayHmjp5C6PH2PqrX1pg5BfgeM/UXBGT9lkGQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(451199015)(38070700005)(31696002)(86362001)(83380400001)(478600001)(6486002)(31686004)(71200400001)(8936002)(110136005)(41300700001)(64756008)(316002)(82960400001)(6506007)(76116006)(66476007)(66946007)(38100700002)(66556008)(53546011)(36756003)(66446008)(122000001)(2906002)(26005)(186003)(6512007)(8676002)(4326008)(2616005)(91956017)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzlRSjM5THpNWW1kWUJlbCt5WktmcWpOa28rTlJJUUNNYkp5a2VwSEY4MnJI?=
 =?utf-8?B?SHpyRTdwRmFrNHp5Y3FMbWVUc1cwRFNLWlJTR0pvOWtKbUEwUHVwMGY1OS8r?=
 =?utf-8?B?WlNSSFhXbU82NENZOHoySnEvSERmSXF5SEIvYzlqdXF5Y2xLUzFLeW12SFNl?=
 =?utf-8?B?dTZsbHJmNi9ySW9TeWZ6MzhnVTJaTEFQbGVpQXdTNTR3OVpJMkgxd3plNnls?=
 =?utf-8?B?Y3BuOWdoQTJnaVEzVURnNzdqai9KK2YwNHc4Tk5ZbFh0REpsck5aVHFWTnRX?=
 =?utf-8?B?ays1NzhQK0hYSHJQV1VLdEthWW44cHJIS2FDR1p1UmJ4QU1UTTdIUVZuYkNr?=
 =?utf-8?B?UGJBM1JqVzZ6bm5jR0hJc1JnV3hXSlpQdEtmYTNtenNCdTFjTW15SDJLbmFN?=
 =?utf-8?B?ZFp0Y2FKUzhzS2Q1V21kQ3BzOGs5TFVRVmhaYzNzeVFpM2NTV3JhR0sxdmtl?=
 =?utf-8?B?Wlc1S1R2NWI2Yk9rNmhPcWFnL0VTcU1MbkxHc2ozR0tzeVJjTjBwQks2TklZ?=
 =?utf-8?B?akwxQjl3MEVKNEt2THNuVTU0eDlIV2ZRSUpad2NDQmhzemdRdE5tcnJIeTBK?=
 =?utf-8?B?bzFpVEZPamVHdXZwVWdBWHRVeXl1ZVlQU1lWT2t4T3RVa0M1OHJld2Noem5M?=
 =?utf-8?B?Y3FNTG82L3o0VUg2c1hPZFlhbVlBVDBsU1pUdkZGMzJYeEFPMU41YUtCdVNO?=
 =?utf-8?B?YWQva2taMkpFbVExQkl3ajFUOFJucWVaZkYyRXhvL0d1dTJNK1NqVlpRUnNT?=
 =?utf-8?B?WlM0Sys3MXhqQzJoelE5R0NIOThJYVkvY0l6R2dia0sxVnFWNStsNXovMlAz?=
 =?utf-8?B?QW1rSmZZTnovRHpvcnJCQ1kyckttYUNzMnJ2SGNsOFlQT01ER080WU13Tncy?=
 =?utf-8?B?VHVUTnB5dFQ5Z1BpYVN2TXVrc0lsY1p6ZC9oYkowbFN1NzRuaEpqTWxGOUk4?=
 =?utf-8?B?T2lkOHlSM29WWTlBREtPanZLNDRMZ2h6RXhidlJObXZqRVRtbzBNMFFmUTJq?=
 =?utf-8?B?cUI2eFQ1UmFhVWRpZmhJckJBRERUcm14NVZWeEk3bXpBbWVSU2tmajBNU3lB?=
 =?utf-8?B?NFNUcTZ5QkRqOXBFWFVRd3A4OGcrYm1Zcm44ZC9SSEZHRERjK2YwUzl3Tk04?=
 =?utf-8?B?ZWh2T1Fpa1NoMFkxRVJYbWZId1loQnNmK0J3cjZybjFXZjYwK054ay9yejFv?=
 =?utf-8?B?c2ZyRFhUSEZpTnQ2R1ljN0R6enRUMkRpa3ZSVThYajQ5akpGWkJabFlvNHpQ?=
 =?utf-8?B?K0NmZXdreGtLUVhEWTcrV0xmVHRIL3l5dHlGbU1FTmQvMmtlakZra2pUWHgx?=
 =?utf-8?B?NlJrRHBVZUI2dTl3VVBOYThxeTdCYkJ4N3laWmVvQnRWTkVvQWsrdVFub3pS?=
 =?utf-8?B?cXZIZFNiYXBKUHdBVjRYMjFPZnlaeThONUtERHVFNVNxbkhBNitHd2lmRnN0?=
 =?utf-8?B?YWZsTGtyYTdRQmdDcUhMbnZwM3djQjZvZFJPMnB5b25KVGI3eXpuSktCbktt?=
 =?utf-8?B?ZG8zblJ2SFBLaE85MjY3RFlpWTJtT3h4TXB2NHhLQUltTnV4YTFrMkZWdDF6?=
 =?utf-8?B?OW90QzZRZE9SU0Npdy9UVHJub3UydTUyWjZUV3EzbUpwSGlDb0tyMGtML1NZ?=
 =?utf-8?B?akNGcUtZMUtCaEw1b1pwMldMZmsyU3R3VDAxRkVxQnkraHkwbWF2YmFoYzhx?=
 =?utf-8?B?WjJRdUJnT01PcmlwY0RWME1sTkcyUTRlcWZXZ05UMnhpRFNpZEgySmdENDFp?=
 =?utf-8?B?RkVZQmxURTlCVTlmanNmcWNab2lZMjlha0Z5OVBzTUpFQWlGRGZ6cjhIZXJ3?=
 =?utf-8?B?NG85SzFORzhwZ1lqbXNReDFlSW5qMGY1SkRRL0JSd2xpN1h4SHp0NWI3MUpv?=
 =?utf-8?B?b1Nhek91Ukt5cmlUWmdYZlZjeVhpbFMxTzA5YmJjU25OTlZPR3J5VFRuWHRS?=
 =?utf-8?B?TEcyRFNWR0JEditwVkwvTzlIbDRWd0Zad2hMd0M3WVJ5T3JPQ1pHWUViQ01q?=
 =?utf-8?B?aDRsZlFNLzZtdDI0U1BDVTc4M0tFU1FJd3hwYWFDeExSNkZZNnpTaDNMcXor?=
 =?utf-8?B?eWJFeW9ueXNBNFFTc2k2aTUyVlNTREJtenNvMm1LNzZsOFZpTkoxT2pNaGgr?=
 =?utf-8?B?cE94cU11dVFEODNpWEgzRnZQZEthbUdkUzU4WGxVdmE1dGFGaGlINTB5YVFB?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36A62646188E0544B091C7CAF1A151CD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d606dbc2-c807-4edd-230d-08daade71adb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 13:22:12.5341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXeQU0IDxNAwo/uTJRuo5OzDzCx1LkohYUUzASO2dpTTqncz3nZeY9J2k207n7hawCETX2rA9/Wk5xo1mx5ZUTRaocXZY3kDx9z09MweQVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6542

T24gMDcvMTAvMjAyMiAyMDozMSwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4gSSBvYnNlcnZlZCB0
aGlzIEFTU0VSVF9VTlJFQUNIQUJMRSBpbiBwYXJ0bmVyX3JpbmdzX3JlbW92ZSBjb25zaXN0ZW50
bHkNCj4gdHJpcC4gIEl0IHdhcyBpbiBPcGVuWFQgd2l0aCB0aGUgdmlwdGFibGVzIHBhdGNoIGFw
cGxpZWQuDQo+DQo+IGRvbTEwIHNodXRzIGRvd24uDQo+IGRvbTcgaXMgUkVKRUNURUQgc2VuZGlu
ZyB0byBkb20xMC4NCj4gZG9tNyBzaHV0cyBkb3duIGFuZCB0aGlzIEFTU0VSVCB0cmlwcyBmb3Ig
ZG9tMTAuDQo+DQo+IFRoZSBhcmdvX3NlbmRfaW5mbyBoYXMgYSBkb21pZCwgYnV0IHRoZXJlIGlz
IG5vIHJlZmNvdW50IHRha2VuIG9uDQo+IHRoZSBkb21haW4uICBUaGVyZWZvcmUgaXQncyBub3Qg
YXBwcm9wcmlhdGUgdG8gQVNTRVJUIHRoYXQgdGhlIGRvbWFpbg0KPiBjYW4gYmUgbG9va2VkIHVw
IHZpYSBkb21pZC4gIFJlcGxhY2Ugd2l0aCBhIGRlYnVnIG1lc3NhZ2UuDQo+DQo+IFNpZ25lZC1v
ZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICB4ZW4v
Y29tbW9uL2FyZ28uYyB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2FyZ28uYyBiL3hl
bi9jb21tb24vYXJnby5jDQo+IGluZGV4IDc0OGI4NzE0ZDYuLjk3M2UxZTk5NTYgMTAwNjQ0DQo+
IC0tLSBhL3hlbi9jb21tb24vYXJnby5jDQo+ICsrKyBiL3hlbi9jb21tb24vYXJnby5jDQo+IEBA
IC0xMjk4LDcgKzEyOTgsOCBAQCBwYXJ0bmVyX3JpbmdzX3JlbW92ZShzdHJ1Y3QgZG9tYWluICpz
cmNfZCkNCj4gICAgICAgICAgICAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+ICAg
ICAgICAgICAgICB9DQo+ICAgICAgICAgICAgICBlbHNlDQo+IC0gICAgICAgICAgICAgICAgQVNT
RVJUX1VOUkVBQ0hBQkxFKCk7DQo+ICsgICAgICAgICAgICAgICAgYXJnb19kcHJpbnRrKCIlcGQg
aGFzIGVudHJ5IGZvciBzdGFsZSBwYXJ0bmVyIGRvbWlkICVkXG4iLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzcmNfZCwgc2VuZF9pbmZvLT5pZC5kb21haW5faWQpOw0KDQpJIHdh
cyBqdXN0IGFib3V0IHRvIGNvbW1pdCB0aGlzLCBidXQgaXQgb3VnaHQgdG8gYmUNCg0KIiVwZCBo
YXMgZW50cnkgZm9yIHN0YWxlIHBhcnRuZXIgZCV1XG4iDQoNCnNvIHRoZSB0d28gZG9tYWlucyBh
cmUgcmVuZGVyZWQgYWxpa2UgaW4gdGhlIG1lc3NhZ2UuDQoNCkNhbiBmaXggb24geW91ciBiZWhh
bGYgaWYgeW91IGFncmVlLg0KDQp+QW5kcmV3DQo=

