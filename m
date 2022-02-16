Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEBC4B93BE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 23:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274440.469904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKScK-0003i0-2T; Wed, 16 Feb 2022 22:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274440.469904; Wed, 16 Feb 2022 22:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKScJ-0003fS-Vc; Wed, 16 Feb 2022 22:17:43 +0000
Received: by outflank-mailman (input) for mailman id 274440;
 Wed, 16 Feb 2022 22:17:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6VyC=S7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nKScI-0003fM-Fj
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 22:17:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 403a8068-8f76-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 23:17:40 +0100 (CET)
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
X-Inumbo-ID: 403a8068-8f76-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645049860;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2vtSUANBn5bNleSgmkYjLB8eOtq0KzrCK+Zol2UqbnA=;
  b=PWsiP0a0lQteXqosD9Rs8T124SexzqV4l10LGBf+Qo6oUzi+Egc+KlPE
   VeCuoW+DYvlYfyMDBGMCj6M/Q3kLJmyCknn4BrYlIXEv6N4ehC9wyIm+M
   7F+vTBNPQEbw+wEO0AXKLFAoob7xlwIrhdTPYFmN3CqG8L0C4giXclKAd
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: w5QLhn1Kpfa99f4mK21Pj2JUGgc9doAvCNWy9F4dROV0l+AuOvlisfswTyvUs+3Jvc0m5axxiD
 ejjrdGIR4sgoMa/Ms6BKAmR8BEAamHFOA246n3GlBenEbfHoxt3tka48gNFGaj2HrjvhMKFd4z
 aTGThgq4ULMudnDLPCxoUqhbJnR5LZUbQsT3BgB1Q1i2z3MLNpvkCMrqByxuKKVLGxM+sJWpi5
 WZuU0sSAbecaU0exSdHLBOH+vEAODXS8jyCNw2V++YHSZFRrChirEGjbhGxCn2w3YmLgnhm3j8
 k6PGB32N2moPl4IRcaprjMEl
X-SBRS: 5.1
X-MesageID: 64383997
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JDg+RqN+riwTtdrvrR1DkMFynXyQoLVcMsEvi/4bfWQNrUoh0TZUy
 GZJD2jXPa3bamvxKd4gbt7lpEMO6p+Em4MxGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoweEmfZg+
 etxiZ3zSTwoLKfKu/wbajANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmtr1psfTKm2i
 8wxdxNGShfbWiB0OFYaN7klmdaSoGmnbGgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3Eru3AhyTgQ6oJCaa1sPVthTW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc+hdFcsr2T+x9quX4z2YFGICbSZHUfVz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 iVsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ieBY0a5xVKG6wO
 ic/XD+9ArcJYRNGioctPeqM5zkCl/C8RbwJqNiIBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WkMnmNqt9MdwlXRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:xu0WsqvVBExsFHm3b9Ct/7w07skC0oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPmftXrdyReVxeZZnMrfKlzbamLDH4tmu5
 uIHJIOceEYYWIK7voSpTPIaerIo+P3sJxA592ut0uFJDsCA8oLjmdE40SgYzZLrWF9dMAE/f
 Gnl656Tk+bCBIqh7OAdx44tob41r/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJpZmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF4t1HqWxa1e
 UkkS1QePib2EmhOF1dZiGdgjUI5Qxer0MKD2Xo2UcL7/aJHw7SQPAx+r6xOiGplXbI+usMjZ
 6jlljpx6a+R3n77VXAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYd099Q/Bmcga+d
 NVfYrhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtV5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdE15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAW23G4gMyLeFPGC1zwdLkeqbrWnxxEOLypZx
 +aAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.88,374,1635220800"; 
   d="scan'208";a="64383997"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGkMNq4hA3ym1fEM8tbqDrZS1/L0yALn7p2tDfsp5l0EM3Yn1lPz8CBKWjTpsvG8CH9QXVVCpqpCbVtWSFypWV0C6WKGi2p8DYqZDWr5RUWeYXiynHbiFZEX+83xzjHaycn50xa5WqQcc7DXOJpZqqt8ikRd6CmZ8T0eiii+LWsebBrR064SUJR35EYv2I0e4yNBUpc7RjuUkJY94cH5kajhMDJbPdqeTRAEJbWFttGqhAM7Tp2ZpBswe9KK4zSnDUIVeCKNJqeYBJQwxeMFwbAd+tnVEh3e/seKKCOD+QgsZ0YrOzFP/Q0RF74uV8/Ps9oRRnoDu4xxPctBrq/paQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vtSUANBn5bNleSgmkYjLB8eOtq0KzrCK+Zol2UqbnA=;
 b=TVrh+AGcKCPzpYFcb7692zO2vp/m3gnprFFLQ3OdmnP2JzhdJo6B6gYDTSL+ncmy27WhBZskZWO9dZxJOMb4K3j9AGdEpvNN3VffG4575RPQOjX9kw47CCD3yR5AP8EkloDArUxubYhS0t17lYZyy0rWE/HBPGSMQplQw5uGvTs9zPFEC93o/ahBGEgKt+ndB1SdCSO183md/MdvkjlQUeardH+obu9Sag2qtoOM2RtPPR1XtOhDcWRxV+O+HCuknX279SMX4nbExipp81uCd4HG4M/0oYBqiP94gyMv25cxrUpZ62eQfxy5lxi1tlEmAwxTMDSBiuPEteycEpjuNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vtSUANBn5bNleSgmkYjLB8eOtq0KzrCK+Zol2UqbnA=;
 b=hOvxUAnT6RX5FzLmPbEWxYhcOpcrmmRU2eMFD+Xy5xA1VqcyLYQj39o2JtNrtMoOHC7gf8Vw34WHGBZiaZhGEwx6sxP2ELk8uaKBmxOJpc442fNAK1oyXjyaot0ji9Babc3gSN5E79hMfa+7KJHIMRBqiH8MNvyho9BAn4fKk8c=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 04/70] x86/pv-shim: Don't modify the hypercall table
Thread-Topic: [PATCH v2 04/70] x86/pv-shim: Don't modify the hypercall table
Thread-Index: AQHYIaGhGuRO8pqNlkK4xub7I1FLsayTC50AgAAE4YCAAAF7gIADsLoA
Date: Wed, 16 Feb 2022 22:17:28 +0000
Message-ID: <f0889e93-aec0-443e-b3fc-081892edaf2b@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-5-andrew.cooper3@citrix.com>
 <4d8ab414-caf4-5a12-4cb7-a88c633cfd66@suse.com>
 <e18c0c5a-d00b-adf9-d4b0-28e702a18241@srcf.net>
 <6566bf52-58da-f804-f5c2-fca64c1f150c@suse.com>
In-Reply-To: <6566bf52-58da-f804-f5c2-fca64c1f150c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa2a9983-371c-4f32-69b4-08d9f19a1e91
x-ms-traffictypediagnostic: SJ0PR03MB5760:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB5760B3BA5E1FFB9CFFBDFD99BA359@SJ0PR03MB5760.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HA+OgdWlgib2YZtRxW4qAqq9wh/Z6H5ihnDckMcHn7UL5eKOe0vQx/yGrzJHDdZbwBsZ/OYIA6dGKE7OFX5QvQZWo83htJhA8W4Sp4DiXewomnPrUg+rz6oqE4RSlbL9PfzIV6OuzoMoVOZBjNtxrgRFS5q7Mvx15P9bR3NpL3yDWXd875RmLrBzc0uSsOc2IROj2Z39NUGTcRfmf4/BaVu0UxmwKxrCOT8xjeNJBUO0G1yzJmN5wyoZCNtL233qmDMuklMBxneDga3C5HOO/++er0/rYKtFceWvpnpiKL2fi/U8DrM9+GEGAeRkbq4MtGZ/T9mHSjSoxtzxjmUhgbiZ2Jt89HTu2l1Jdb5+y8Q4DNRSRR3VYLjW9+lDzZ1zGeIwKjA4KmIcmBzW363blcE2JfvLouBlo75HxAxBfJxTheeSGkikE340En3eOA7m5694i2CAKJ2A5c7ZMdbXWDsdcrp5RKH2MTilSgk/X31jdmfKAKlSAjB9ejz8X2DhbtOWA2WUdmZJpFr69qE8imyrX/Vpo2ZxPurpVC5xsAgRuX599guhOzl1+6hytgD7RS8Zo1uVNbAPpoYFHSvnNYvEXHGY1Ft6YFY0GmSRxfOivwamkzHbEfFoO3OP1fX+L4f6+Qgy1dKXuYZsMmq8qF6/3msKIL7hgxJjo10hJkBIVqkEsccV0BuTaUkkTg/DhVK8Z7TNWL5Vk3w50409V3r1idKyBF9EJUqheGhb7jJcqOarFH+jgWe4jy4mjVOo+OuJQUzFhRgmg3AeKbRzZg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(8676002)(38070700005)(31696002)(26005)(31686004)(71200400001)(54906003)(4326008)(2616005)(8936002)(186003)(36756003)(6506007)(6916009)(66476007)(66446008)(82960400001)(76116006)(64756008)(83380400001)(316002)(91956017)(53546011)(66556008)(6512007)(6486002)(2906002)(38100700002)(66574015)(508600001)(122000001)(5660300002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXRLS3k2c0RPczRhYmpNc2hRVkJYK3lxT0l0S1J4OUZyZUVwRzl2MDc3SmYx?=
 =?utf-8?B?Y00vcmUwZ3ErYWczeWdoWVZvWW9pM1RRdXFERDd6OXlmWEEwK1RXVlMrNG01?=
 =?utf-8?B?Ymt3N015V1hxS0NKT0Zubi9LWitSRTZrT0hKRGEvOS9xdW8wMmxmMEw3cVpI?=
 =?utf-8?B?Qnh5WGVTdEJRY2lOb2Q4WURCVmpIUXRkckV2TWpCckREZ2pHVU0xWkl0K2pW?=
 =?utf-8?B?M2tRUXQvVzJiTTVHRG9OUGpKNCtIZG9TVnVtS3diK0F0RURpUFRrVlRyeERH?=
 =?utf-8?B?U2hBYlk2U0JsTlFHWm1GVi9MWXNvOEdwWDcvWXZia2dtNHYxcENiN2VhSWN3?=
 =?utf-8?B?MGRGZDNJYzFXTmFhbmNRckV6dklUNXJqWENuaGpMcmdRZ2FCamcvbXJDUEVj?=
 =?utf-8?B?YmZ5WEpQL1VLZFVPeW9oTFRsc3BhUm1TcERydkg4T3NKYVNSL3RldE1BZ3hY?=
 =?utf-8?B?WEIrUyttb1l3MTRoM293YXdURFpCNHpCY3FhbERiTXI5VFFPcXBEOUxhL0l1?=
 =?utf-8?B?VEpDOFZJOXdXT2p2cEtvamxnU2VTQXFHQ1oyS2YwSUQ5NTBYN3dtRmh1QndZ?=
 =?utf-8?B?MmZRL2xjU2FqL0Q2MG1nWTBNdVR3em1MdjZsN2NXWW4wWE5YVnB6R2FnOWpl?=
 =?utf-8?B?M1o3UGZoY2RKUGJIK3FXWTNJQ2lNNWp0WWtkbFY1Q3ZJWTJzRFVuNGZiRXBT?=
 =?utf-8?B?dlhzc0QvaDZWRzdCUjFnSm4wMXY3cHVXWnpaNS9GMTNOR3EvUU0yZDdZbkV5?=
 =?utf-8?B?ck5Yczk0cU52bEtoalFWcTVKSk5pWU02WE55RHZtclRoZmZVUVdQVnNQcHJa?=
 =?utf-8?B?ZGhyQ2FBRXdPSXJzSlZNSVAvNHBvZ2dBb0Erb01SaGZnTlB5UXU5eDdQTE1F?=
 =?utf-8?B?RDVacGFxRTVsdmVWK3d0UWYrZEFndXhKTUZwcmVYOWdQZGw5MlliaktITnkr?=
 =?utf-8?B?VS9qcm43T2xrMG5mbkFqUDhkSXJlc0dtUmFTQlMwMExaY2xOTzJ2VGZhMDh5?=
 =?utf-8?B?cm5NN2JsSlVXdTdNTSthaGZnVWVMei9zSTQwQ1R6dThIS25PZ0xuaW5XRjRv?=
 =?utf-8?B?L3oydFRQUkZZenBFU2FpbHo5MytkV3ZBWkl3THBVMEZhRU9PY3ZHOFpSK3ln?=
 =?utf-8?B?V0xTQUQ3aks4dS9NNTM3YU1vYWVEb2NPRUlvTkViZ2ZqZ2VJUDZMOU5zblFF?=
 =?utf-8?B?bHpab05IeEFWZHN2QXJ1WEErd0J6Ym1xQkhHaEpyQklZRjBpUlRpZ1dIb2lY?=
 =?utf-8?B?V2t2Y0hwLy9zOHBzOFdwcHpTNmZlb2c5aUd5Q1lUWElZM1RUZFJScVhtUDcy?=
 =?utf-8?B?Q1lYa3FCazVEdEdTbHZvWWN6R0FscmlqT1BGYU9kTXcvMTNDOTB1TENzSVRG?=
 =?utf-8?B?NGMxa2RaT3daZUphd3RWeHJobm8zcGhDaTMzczhLS3NxdTUzNFBGZFRnWFV0?=
 =?utf-8?B?Vmdpa3Awa1RXZGdnNnd4M3hVcG1NOE1PNUlabGZkK1lubjhkb2xSRExVd2VU?=
 =?utf-8?B?TTl6OTNNM1JPUDJNL3N2c2ovRFB5VFpaUWszMThEN2E4eDZ3RThHUDJkVHBT?=
 =?utf-8?B?Ylo5Q0tTckw2QkIzRW1VOVFSejc0QWM0UDRFTGZUcXBodW1uQjMvOWRkbThw?=
 =?utf-8?B?OU90Wk1NOEYyTzFiT3AxSzAvOFBIaFRjRG80dE5xVUFjTS9VblplZmdTRkw3?=
 =?utf-8?B?N2FsSS95U1NUVWtvSC81c2JTVS8yeWkyelhyckdORFVReWpSYktzdGhhMlVm?=
 =?utf-8?B?NFV1TDhmS2hPWDgvYWdwMzNUTWNLamNnM2R0Sm4yMHEwVE41THgyWTBtYTRQ?=
 =?utf-8?B?UURGeVdpbUJnVmVkcFpHNDNqdUVoS05ESjROOGRMTmZmZ0FyS2RnM2ZiRXVt?=
 =?utf-8?B?TGtvM05FRGN0VTVPQWc4ajMwKzBNK01kcXQ0TFRzMHZydklPSmo1cTNwazF2?=
 =?utf-8?B?ZUJNcjN3WndzUmxyR3M4R28xZmM5aHJWZ1NOUWozbGdoaytTa2ZxcWNjVWo2?=
 =?utf-8?B?aEJzNVBjajZQZ3M5MzYvMGQ1VERKeWFXWm96NGRjZy9Iam5YRjNTb2VTWWdM?=
 =?utf-8?B?R0oveFM3USt5TmFSek5hbXhlQ2NRVk5uSjAyd20rUDhjcjQ1N2EwbDhPTWll?=
 =?utf-8?B?UlpIZjVuN3JKRmtvOFM0eHFPcC9jQ1A1c3BmbjlYWGJrU3FWQUx0T2NOY3JW?=
 =?utf-8?B?V05CU3ZXWXhNSWhVUlQxajJhWmZWakkzTHpWMGV6Sk1HK3R0SkVmTXZaaVQz?=
 =?utf-8?B?RlVmNmQ4ekk0WjNFSkJ0eEQ2b2NnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E26D738C3098F4DB4C538D94F342E2C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2a9983-371c-4f32-69b4-08d9f19a1e91
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 22:17:28.9114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0wDTkGoaKnl/CsuQkZsm2S1ApUzDsIcBI1NkZeUz1i0+M1iaxP8IsreekC4XssO7J2x3XVNvBhh64miZNT9bnRim+W1smwCgwcLbpviIWuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5760
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxMzo1NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAyLjIwMjIg
MTQ6NTAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNC8wMi8yMDIyIDEzOjMzLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNC4wMi4yMDIyIDEzOjUwLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4+DQo+
Pj4+IFdoZW4gcnVubmluZyBhcyBwdi1zaGltIHRoZSBoeXBlcmNhbGwgaXMgbW9kaWZpZWQgdG9k
YXkgaW4gb3JkZXIgdG8NCj4+Pj4gcmVwbGFjZSB0aGUgZnVuY3Rpb25zIGZvciBfX0hZUEVSVklT
T1JfZXZlbnRfY2hhbm5lbF9vcCBhbmQNCj4+Pj4gX19IWVBFUlZJU09SX2dyYW50X3RhYmxlX29w
IGh5cGVyY2FsbHMuDQo+Pj4+DQo+Pj4+IENoYW5nZSB0aGlzIHRvIGNhbGwgdGhlIHJlbGF0ZWQg
ZnVuY3Rpb25zIGZyb20gdGhlIG5vcm1hbCBoYW5kbGVycw0KPj4+PiBpbnN0ZWFkIHdoZW4gcnVu
bmluZyBhcyBzaGltLiBUaGUgcGVyZm9ybWFuY2UgaW1wbGljYXRpb25zIGFyZSBub3QNCj4+Pj4g
cmVhbGx5IHJlbGV2YW50LCBhcyBhIG5vcm1hbCBwcm9kdWN0aW9uIGh5cGVydmlzb3Igd2lsbCBu
b3QgYmUNCj4+Pj4gY29uZmlndXJlZCB0byBzdXBwb3J0IHNoaW0gbW9kZSwgc28gdGhlIHJlbGF0
ZWQgY2FsbHMgd2lsbCBiZSBkcm9wcGVkDQo+Pj4+IGR1ZSB0byBvcHRpbWl6YXRpb24gb2YgdGhl
IGNvbXBpbGVyLg0KPj4+Pg0KPj4+PiBOb3RlIHRoYXQgZm9yIHRoZSBDT05GSUdfUFZfU0hJTV9F
WENMVVNJVkUgY2FzZSB0aGVyZSBpcyBhIGR1bW15DQo+Pj4+IHdyYXBwZXIgZG9fZ3JhbnRfdGFi
bGVfb3AoKSBuZWVkZWQsIGFzIGluIHRoaXMgY2FzZSBncmFudF90YWJsZS5jDQo+Pj4+IGlzbid0
IGJlaW5nIGJ1aWx0Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+DQo+Pj4gSSBkb24ndCB0aGluayB5b3Ugc3luYy1lZCB0aGlz
IHdpdGggSsO8cmdlbidzIHYzLiBUaGVyZSB3ZXJlIG9ubHkgbWlub3INCj4+PiBjaGFuZ2VzIGJ1
dCBoYXZpbmcgYSBzdGFsZSB2ZXJzaW9uIHNlbnQgdHdvIG1vbnRocyBsYXRlciBpc24ndCB2ZXJ5
DQo+Pj4gbmljZS4NCj4+IEkgZGlkIHJlc3luYy7CoCBXaGF0IGRvIHlvdSB0aGluayBpcyBtaXNz
aW5nPw0KPiBBIGZldyBsaWtlbHkoKSAvIHVubGlrZWx5KCkgYXMgZmFyIGFzIEkgY291bGQgc2Vl
Lg0KDQpPaCB0aG9zZSB0d28uwqAgSSBhcHBlYXIgdG8gaGF2ZSBmb3Jnb3QgdG8gZW1haWwuDQoN
ClRoZXkncmUgd3JvbmcgLSBvYnNlcnZlIHRoZXkncmUgaW4gYW4gaWZuZGVmIGJsb2NrLCBub3Qg
YW4gaWZkZWYgYmxvY2suwqANCk9ibGlnYXRvcnkgY2l0YXRpb24gb2YgdGhlIHJlY29tbWVuZGF0
aW9uIGZvciBodW1hbnMgbm90IHRvIHRyeSBhbm5vdGF0aW5nLg0KDQo+Pj4+IC0tLSBhL3hlbi9j
b21tb24vY29tcGF0L211bHRpY2FsbC5jDQo+Pj4+ICsrKyBiL3hlbi9jb21tb24vY29tcGF0L211
bHRpY2FsbC5jDQo+Pj4+IEBAIC01LDcgKzUsNyBAQA0KPj4+PiAgRU1JVF9GSUxFOw0KPj4+PiAg
DQo+Pj4+ICAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+DQo+Pj4+IC0jaW5jbHVkZSA8eGVuL211bHRp
Y2FsbC5oPg0KPj4+PiArI2luY2x1ZGUgPHhlbi9oeXBlcmNhbGwuaD4NCj4+Pj4gICNpbmNsdWRl
IDx4ZW4vdHJhY2UuaD4NCj4+Pj4gIA0KPj4+PiAgI2RlZmluZSBDT01QQVQNCj4+Pj4gQEAgLTE5
LDcgKzE5LDYgQEAgc3RhdGljIGlubGluZSB2b2lkIHhsYXRfbXVsdGljYWxsX2VudHJ5KHN0cnVj
dCBtY19zdGF0ZSAqbWNzKQ0KPj4+PiAgICAgICAgICBtY3MtPmNvbXBhdF9jYWxsLmFyZ3NbaV0g
PSBtY3MtPmNhbGwuYXJnc1tpXTsNCj4+Pj4gIH0NCj4+Pj4gIA0KPj4+PiAtREVGSU5FX1hFTl9H
VUVTVF9IQU5ETEUobXVsdGljYWxsX2VudHJ5X2NvbXBhdF90KTsNCj4+Pj4gICNkZWZpbmUgbXVs
dGljYWxsX2VudHJ5ICAgICAgY29tcGF0X211bHRpY2FsbF9lbnRyeQ0KPj4+PiAgI2RlZmluZSBt
dWx0aWNhbGxfZW50cnlfdCAgICBtdWx0aWNhbGxfZW50cnlfY29tcGF0X3QNCj4+Pj4gICNkZWZp
bmUgZG9fbXVsdGljYWxsX2NhbGwgICAgY29tcGF0X211bHRpY2FsbF9jYWxsDQo+Pj4gSsO8cmdl
bidzIHBhdGNoIGRvZXNuJ3QgaGF2ZSBhbnkgY2hhbmdlIHRvIHRoaXMgZmlsZSwgYW5kIEknbSBh
ZnJhaWQgSQ0KPj4+IGFsc28gZG9uJ3Qgc2VlIGhvdyB0aGVzZSBhZGp1c3RtZW50cyBhcmUgcmVs
YXRlZCBoZXJlLiBUaGUgY29tbWl0DQo+Pj4gbWVzc2FnZSBzYWRseSBhbHNvIGRvZXNuJ3QgaGVs
cCAuLi4NCj4+IFRoZSBjaGFuZ2VzIGFyZSB2ZXJ5IG5lY2Vzc2FyeSB0byBzcGxpdCBpdCBvdXQg
b2YgSnVlcmdlbidzIHNlcmllcy4NCj4+DQo+PiBXaXRob3V0IHRoZSBhZGp1c3RtZW50LCB0aGUg
Y29ycmVjdGlvbiBvZiBjb21wYXRfcGxhdGZvcm1fb3AoKSdzIGd1ZXN0DQo+PiBoYW5kbGUgdHlw
ZSBmcm9tIHZvaWQgdG8gY29tcGF0X3BsYXRmb3JtX29wX3QgZG9lc24ndCBjb21waWxlLg0KPiBJ
bnRlcmVzdGluZy4gVGhhdCdzIHF1aXRlIGZhciBmcm9tIG9idmlvdXMgaW4gdGhpcyBjb250ZXh0
LCBzbyBjbGFyaWZ5aW5nDQo+IHRoZSBwdXJwb3NlIGluIHRoZSBkZXNjcmlwdGlvbiB3b3VsZCBz
ZWVtIGhlbHBmdWwuDQo+DQo+IENvbWluZyBiYWNrIHRvIHRoZSBzeW5jaW5nIHdpdGggdjM6IFdh
cyB0aGlzIGNoYW5nZSB0aGUgcmVhc29uIHRoZW4gd2h5DQo+IHlvdSBkaWQgZHJvcCBteSBSLWI/
DQoNCk15IHBvcnRpbmcgb2YgdGhpcyBwYXRjaCBpcyBhIG5vbi10cml2aWFsIG1vZGlmaWNhdGlv
biBmcm9tIEp1ZXJnZW4ncw0KdmVyc2lvbiwgYW5kIG5vdCBlbGlnaWJsZSB0byByZXRhaW4gYW55
IHRhZ3MuDQoNCkkgdGhvdWdodCBJJ2QgZGlzY3Vzc2VkIHRoaXMsIGJ1dCBJIGFwcGVhciB0byBo
YXZlIG1pc3NlZCBpdCBmcm9tIGJvdGgNCnZlcnNpb25zIG9mIHRoZSBzZXJpZXMuwqAgU29ycnku
DQoNCkVpdGhlciB3YXkuwqAgSXQncyBleGFjdGx5IHRoZSBzYW1lIHB1cnBvc2UgYXMgYmVmb3Jl
LCBidXQgbW9kaWZpZWQgdG8NCmNvbXBpbGUgaW4gaXNvbGF0aW9uLg0KDQpKdWVyZ2VuJ3Mgc2Vj
b25kIHBhdGNoLCBzdWJzZXF1ZW50IHRvIHRoaXMgb25lLCBpcyB1bm1vZGlmaWVkIHdoaWNoIGlz
DQp3aHkgSSByZXRhaW5lZCB5b3VyIFItYnkgdGhlcmUuDQoNCn5BbmRyZXcNCg==

