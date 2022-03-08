Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC19A4D1D12
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287185.487052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcbP-0007Tt-9N; Tue, 08 Mar 2022 16:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287185.487052; Tue, 08 Mar 2022 16:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcbP-0007Rc-6A; Tue, 08 Mar 2022 16:22:23 +0000
Received: by outflank-mailman (input) for mailman id 287185;
 Tue, 08 Mar 2022 16:22:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LykH=TT=citrix.com=prvs=059d7c239=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRcbN-0007RV-Jw
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:22:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebf4e2db-9efb-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 17:22:19 +0100 (CET)
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
X-Inumbo-ID: ebf4e2db-9efb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646756539;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2tOxA7101Hx6xpBYG1rG8rx/WHUgXWK1sWB7SXyUwXc=;
  b=G7c3oXc3hetCl+Sv7/Rd0nI3OExAHvZeC4tSFyj/SFKb64VmHN/v9li0
   BuvldRnHF/MoxHD6mZt1E7l7+QPhYk4VD+xYXhAgVH91Y9o42nu3PbPEH
   nzdNrktN7HCAfHGzYpQn8F9sUTfzvVHsP7EP+KgZsb69boebHjiOxLIqs
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65721001
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gJNeH61Lf6XWYXzp4PbD5fpxkn2cJEfYwER7XKvMYLTBsI5bpzAOm
 mcZUGqDOvyJZGr8Kop0bYjj9UoOvcTTx4c1GQU/pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw0YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1vj66SSlc0EpfolcEyfitaGi9mOfRZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiDO
 JBAMWI2BPjGSxNeGlsFGLs6peb2pkP6dH5FiGqShbVitgA/yyQuieOwYbI5YOeiSdtPl0yVo
 krN9mLlCxtcMtGDoRKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGS0SvHtUhv+p2SL1iPwQPIJTbd8slvUjPOJvUDJXQDoUwKtdvQEjv0URmw3+
 mWtkvbGKA5tubONTSuCo+L8QSyJBQAZKmoLZCkhRAQD4sX+rIxbsi8jXuqPA4bu0ISrRGiYL
 ySi6XFn2u5N1ZJjO7CToAif6w9AsKQlWeLcCu//emu+pj10a4e+D2BDwQiKtK0QRGp1o7Tog
 ZTlpyR8xL1WZX1uvHbUKAnoIF1Pz6zdWNE7qQQzd6TNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0MfEpPNLsUJ16kPOI+THZuhb8NIEmjn9ZLlPvwc2TTRTIgzCFfLYEy8nTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+8zN7Ti7eHwP9Dz+ieD2TCfMEd8taQLSBshkvPLsiFiEq
 L53aprVoyizpcWjO0E7B6ZIdgtURZX6bLirw/FqmhmrflI2SDt/WqWKndvMueVNxsxoqwsBx
 VnkMmdww1vjn3zXbwKMb3FocrT0Wphj63k8OEQR0ZyAhxDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:UbPPAKtNdk8YsWkADPYqMlbC7skC2IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPiftXrdyReVxeZZnMXfKlzbamHDH4tmu5
 uIHJIOceEYYWIK7voSpTPIaerIo+P3sZxA592ut0uFJDsCA8oLjmdE40SgYzZLrWF9dMEE/f
 Gnl656Tk+bCBIqh7OAdx44tob41r/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJppmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF491HqWxa0u
 UkkS1Qe/ib2EmhOV1dZiGdnTUI5QxerkMKD2Xo2EcL7/aJHA7SQPAx+r6xOiGplXbI+usMip
 6jlljpx6a+R3n77VXAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYdw99Q/Bmcka+d
 NVfYnhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtR5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdY15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAp23G4gMyKeFPGC1zwdLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65721001"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amE+oeYp+iuYqAEyVK7Z0LQ6ToAhmwvnNDes6iiTetEZIy5QKB6oZw2ebT+hfd/oDHZCvwrWvQxXzIZzOiDITNU/QborsnWUqlUuMmMIggZpOHhoPoylKWbtb+eHAnrvaGNck+WR/5iXn2iNOnLQnOCPUHwSv4LzPZiyLc4kAPZPOSAuSTBeV02J77vBRaYWcuhClmq/c7W2rAqSRzTNt0TMi1XFrWmzRCQ48cyJNgsSOcEG43pZNBRdb4wm0r5Pc51QZR9Rrjgil4VhbuHFE0G6shyU14tGy+wLMCSSHh9U2/WwqI9tniLvLQFdpiwnEMPEyvwenio8anhk5pW0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tOxA7101Hx6xpBYG1rG8rx/WHUgXWK1sWB7SXyUwXc=;
 b=eBY3UF+/vTAjjUL0x7+bUZUzhemaIaIv/0zTETSc/rjH71R/LGlRjCOxA6BhW+/feuBp0LiWe+kCzTwaeOKo1Mu2UQezvJWtVNw53alu4DmpTTfNsRzG3juaUG4DoGN6klt3PwW5FfLDtyPri22uq8TgVDXJv7rX5nCjD7+EIpsocOvFsVWmqU4AY7jaclu+8d2NwB62/ikGkdjgVjd+zld6yUTq9rsEl9tIRgTAYjeEL33MvelJ/6vJLWfG87MzanIc++/sYtykV1zF1WoqHS5LtHNQ9V4mpspsJNRnvmsW9gualOJgspL66Ff6NCJ6BdjfWxDllp/twVyhikoYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tOxA7101Hx6xpBYG1rG8rx/WHUgXWK1sWB7SXyUwXc=;
 b=cJgAXXs+P5JYp73ekyjeIUYA0AqgFoNAjERCIGQLJJe4PQV20/PbY5eHC2eZjem8BTYbIwxzFe6cemH89ShcRRKEZDwPzicB+r1K8pPQmLDqtxWkWHoENLiWkhI/K2hn2GB5V8knhtY3VWsVMM7UdrsaQNzFHPApg1jktYDhH00=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, David Vrabel
	<dvrabel@cantab.net>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/kexec: Fix kexec-reboot with CET active
Thread-Topic: [PATCH] x86/kexec: Fix kexec-reboot with CET active
Thread-Index: AQHYMmV+YpEym/vCiE+yJp1ocNsJiqy1JJaAgACH8wA=
Date: Tue, 8 Mar 2022 16:22:12 +0000
Message-ID: <d6112602-b488-0b63-0131-fedd39c05eae@citrix.com>
References: <20220307205313.31247-1-andrew.cooper3@citrix.com>
 <c3d9a1db-bda0-22f4-6733-11dfbb1bebfb@suse.com>
In-Reply-To: <c3d9a1db-bda0-22f4-6733-11dfbb1bebfb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4654875b-caf8-4133-d558-08da011fcd5c
x-ms-traffictypediagnostic: BN6PR03MB3217:EE_
x-microsoft-antispam-prvs: <BN6PR03MB3217054EC561D1E8814122D2BA099@BN6PR03MB3217.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ncobkshmJRX5xsR7Gg9YxhWXh/eEhep1ZqBKViNMl+3hPy5wG8F9dp8lkVgX1TAyiKxdcXx82lq3angv5smYV7/6aAAQWt07MmuqHfvSIRZqLLeCXa8ha5/JX/QPbJeomxl7pdVGdM5oHmjuBYYBxRm8qDEJLky634YZSKZwhSbi6biRu0jxD6BU9h/BT1sfWM+h8pvNF2v0kABtpWWGKjZPe45OqrfIgattDQt/sao/017f0S6Tls80lDIGvxIRDNK3VkHar19wryWlPL2sqvQSAIdNTj5pI9EP0d63mlKEoeKAObRQu9PVL2r9eeizZ7qkN9crW5BPLlmm2P6YXhZmCQhEpw8OjkObyHZ4kHCN/2QJnuV2y7WCrr9XbKNjenx1yfIl7J3WdwaD+gdVj0QmqplGaUm3spfs2jHNQkRZLN3jVmhhZzGNpTElb74ggvvk/BXm2A7KSYgWvK+4040NCYVqqdOIDDtMQtvYfUG2XWr9sxO4KrOei9PHQxKxfRBfr+XrBQPegXaEJ7JXyp5b/mOqe/njGU1jPpyOpeI2laUDXlG70FlgoDFToxo87C3j3IwFal4U9NFH2iwvXOEmVV0yubpN+BemY3zB3rITfYPoXmYiU6w4BeBDgvpeRXCkQCNE97054iocrS1kPMCQ9byMWLp3ac/yNOTQWblWXHFyAMrmkr0UyAPR6ydLeuTGt7Grwv/bzqGwZdYlks5bHMxy6L9MdUbqiVR0zSKPfizevGh33utB7uk6dZLyEbywiBWZwOPw7E5il9FzEg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(6916009)(66556008)(71200400001)(186003)(6486002)(8676002)(66476007)(66946007)(66446008)(4326008)(54906003)(316002)(508600001)(83380400001)(36756003)(6512007)(5660300002)(38100700002)(2906002)(76116006)(2616005)(26005)(8936002)(53546011)(6506007)(122000001)(82960400001)(38070700005)(31696002)(86362001)(31686004)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXNRSnNFQ1NHckkwazBHK3RBYy9Eby9yT3VQcC9ZcHd2YTcvR1BuQzFHdjF6?=
 =?utf-8?B?Uys5eXNLSVdMWThFL3FYakQwVGZQNk9JOHNxWHlZL3F2dldsc2JWSVIyOUJC?=
 =?utf-8?B?d3hxbjQxa0gxaHQvMG51SGY4YkRqRXhvVGFRRUJ5OGVtVnliQ1FIcGZYZm5B?=
 =?utf-8?B?YnVmS3FpcUpxVTB6aFgvWTl5L2FoUHVLam5kdzJXOTJxdFkzQUJlaTJvSFJv?=
 =?utf-8?B?WFh4bXpQcWxjT1k2YVRTVTd1TmlKUzdaSGMxOWk4NmlLZUVWQkVSWFNGc1o2?=
 =?utf-8?B?SUJMMUFwWVRYU1RkQnhvdGU3cFdJdFg4QkNQYVpjSzI5WFUwSGtrRWZZTEdG?=
 =?utf-8?B?bEtNR3ZBc0lENEwxaFVWdXdFSGZlTExNU3dQQnc3ZEtob21qVWlhMFovQ2hS?=
 =?utf-8?B?eWdxREJzdXNuQURtSTJ3b3pYdWhXcksrTldhRkZ1M1FHRXlqMUsrZXZIdzZ2?=
 =?utf-8?B?U0MxcmRRaTVYSzJGMkxVeTRrVGpUaVBNSlFVU0ZJZ2U0Z3JkSTJhNHpsUnpE?=
 =?utf-8?B?TlpRZCtDQzFOcjV6NVhHTmgrOElGOTVjZ21OeDhXcTltR3ArU3JOT21LMDVx?=
 =?utf-8?B?RkVSeHVWL1FYOW5SanBZSWI5MFpvaWswTkcvc2RpdmpxNlowODdPTHhiUU9Q?=
 =?utf-8?B?QWkzWTZyMzIxNEM2TFVQcHJVN3dZWWphbjUvcFJERFAyMmQ1UjVCSWkwTVk5?=
 =?utf-8?B?dk9aV2xXaCtZMGdhNzAzTnJTRHJOLzBDeEdtc3FLVEZ2cWFmZ1cyQ0tDQncy?=
 =?utf-8?B?Uk5Bbmc5QkhJcjcwY2FyMGlneVBjTXptWDVGUi8zdUloU0ZSOGxKZ3lkdlVh?=
 =?utf-8?B?NVA1bi90THMyeWNLbFlKV2hXbUtINnpDSXZVOG4yV1g3SkRwUTNYZGplSWw1?=
 =?utf-8?B?UUVmZ0k0dGExVUdJYWNJWWcvM1BQOEYwUW5scTFyZ3AyRmZqKzdJcjRPMldN?=
 =?utf-8?B?em13aERKQ0o4Rm5wU1g4WlBjWGdZQ1B0aEdVZ2NzWGpqU2VkNUZQNklZbzk0?=
 =?utf-8?B?b2tOMExtcmRKQzU5aWpVZm8vUkJXcUxkR3hqRFc1eE1uK054ZmxEZ24vUFF0?=
 =?utf-8?B?OE44SFVnUjFOdUFVSngwalNQaHZlZ2tCSlZWMWQ0KzFoUVVVaU5mbGdsU0c3?=
 =?utf-8?B?UDJCYkFUak1acTlyREk0VWVPaGR2YU1DTmQvK2RUTGZZSk1Od2RYd1hYd1RM?=
 =?utf-8?B?QXREekpiWHE3UUJDUThxcjdMR0pjeW1IV3NyVTR6dG1JSXY0cFlSOS9Qa2Zm?=
 =?utf-8?B?dHhjNXRCMkpjd2hmOTN2cUZyTFFmczg4VmtCNFNXRlNTMFdLbnM2Rjl2S2Jt?=
 =?utf-8?B?c1I3bUVFcTk0L0RQZXl0YmtGWnZjanBxMG5oTmN1Z0pUWXdUbjc4TmdYYVQr?=
 =?utf-8?B?OVZPeDBnSkMxS2lrZ1p4Y0ZOc0J6U042QlRYMnRqVS94MWIxVUJKWmxmMjEz?=
 =?utf-8?B?eE9DZi9Bc2lRbXF3RjBZUXpUTFIyT1RCSk9mcXEyRWpXUVBmQjJva1U3ZHRx?=
 =?utf-8?B?azBUS0VxUndSS1pJSlJ1eFhaOEQrbHl2b09QcnlZbFUwd21COTMxa2NMUVh6?=
 =?utf-8?B?cldEVVhqTzExR21hVmlzVnM1Z05GaStrMWFSdEV1NjNVbkhRSTVxdHNFN04v?=
 =?utf-8?B?ODZ3WEFsc01Faytnd1Nya1dFekNoYzAySzNITjZPcUlDV0lMcXZnUWdFN1h3?=
 =?utf-8?B?NGhNd0dyQTk1cndtQzRoS2Y1amdTU3AwbGF1Uk1WV2VuR2ZyamlBc2RXY043?=
 =?utf-8?B?YzJCOG1HRXhzaTNaYmYvL0tPLzlVa28xNkJ5a2RiWkdnVEtqMTZlbjFBUFcx?=
 =?utf-8?B?VkYyUCtSRlFIU3BhdE1TN3B6anNNYk52eUd4akpzZllCVUd4RUllbHdlR0dr?=
 =?utf-8?B?RG5DR0FoTFZzVmVPYktFMVJrYjVnSUZGZlA3dG1IQ3NxU1ZNVWd2TWJkYjRD?=
 =?utf-8?B?NTQrZEVvTHJNNFMyMjdRWWRQMTZoZENPODRCSXFtRlNZQjdDSU5RK1FoYllq?=
 =?utf-8?B?NzlZa3Z4bVJUYmpJV3U5YWVIei9BSHprWG9Id0FWWWpxNFhLMmwwR2lRSkZn?=
 =?utf-8?B?bGdFaTZOR3JuMFFFckNobjNRTUVaNGo2ZWFnU2FlTmIyTGg3RHZmYy9PMSsv?=
 =?utf-8?B?MlRCbUVZVHRqYk8za3V2OERqME1TMXJIVnVGQm9Cd01kZjBMS2tOSTVHN0w4?=
 =?utf-8?B?dTZGa2VkMk1WZWMydkx3b3FvYTZFVnora2dKeU1MZlk3RUkreTJnYk9aU2Ri?=
 =?utf-8?B?NjJ0VGs3VDRIa1dDWkhJamY5aWZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34FDFC36343EDD4887D2FBE0EC38C39E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4654875b-caf8-4133-d558-08da011fcd5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 16:22:12.6434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FnLBzjKTIQy/dgHj+9IvDEhXquoDUykhYYdk4g84uYjo8dou9EVx8LVSiKWJtBhgWM46RoXhutZ0SHPJUtfdUZW7LH3VQq2VQrjjqtdAOVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3217
X-OriginatorOrg: citrix.com

T24gMDgvMDMvMjAyMiAwODoxNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjAzLjIwMjIg
MjE6NTMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbWFjaGlu
ZV9rZXhlYy5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvbWFjaGluZV9rZXhlYy5jDQo+PiBAQCAt
MTU2LDYgKzE1NiwxNiBAQCB2b2lkIG1hY2hpbmVfa2V4ZWMoc3RydWN0IGtleGVjX2ltYWdlICpp
bWFnZSkNCj4+ICAgICAgICovDQo+PiAgICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7DQo+PiAgDQo+
PiArICAgIC8qIFJlc2V0IENQVUlEIG1hc2tpbmcgYW5kIGZhdWx0aW5nIHRvIHRoZSBob3N0J3Mg
ZGVmYXVsdC4gKi8NCj4+ICsgICAgY3R4dF9zd2l0Y2hfbGV2ZWxsaW5nKE5VTEwpOw0KPj4gKw0K
Pj4gKyAgICAvKiBEaXNhYmxlIENFVC4gKi8NCj4+ICsgICAgaWYgKCByZWFkX2NyNCgpICYgWDg2
X0NSNF9DRVQgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICB3cm1zcmwoTVNSX1NfQ0VULCAwKTsN
Cj4+ICsgICAgICAgIHdyaXRlX2NyNChyZWFkX2NyNCgpICYgflg4Nl9DUjRfQ0VUKTsNCj4+ICsg
ICAgfQ0KPj4gKw0KPj4gICAgICAvKiBOb3cgcmVndWxhciBpbnRlcnJ1cHRzIGFyZSBkaXNhYmxl
ZCwgd2UgbmVlZCB0byByZWR1Y2UgdGhlIGltcGFjdA0KPj4gICAgICAgKiBvZiBpbnRlcnJ1cHRz
IG5vdCBkaXNhYmxlZCBieSAnY2xpJy4NCj4+ICAgICAgICoNCj4gQmVzaWRlcyBpbnRyb2R1Y2lu
ZyBzb21ld2hhdCBvZiBhIGRpc2Nvbm5lY3QgYmV0d2VlbiB0aGUgY29tbWVudCBpbg0KPiBjb250
ZXh0IGhlcmUgYW5kIHRoZSBlYXJsaWVyIGxvY2FsX2lycV9kaXNhYmxlKCksIGlzIGl0IHJlYWxs
eQ0KPiBuZWNlc3NhcnkgdG8gZG8gYm90aCBhY3Rpb25zIHdpdGggSVJRcyBvZmY/DQoNCldlIGFy
ZSBhIGhhbmRmdWwgb2YgaW5zdHJ1Y3Rpb25zIGF3YXkgZnJvbSBkaXNjYXJkaW5nIFhlbidzIGNv
bnRleHQNCmVudGlyZWx5LsKgIElSUXMgYXJlIG5vdCBhIHJlbGV2YW50IGNvbmNlcm4uDQoNCklm
IHdlJ3JlIG5pdHBpY2tpbmcsIGlycXMgd2FudCB0byBiZSBvZmYgYmVmb3JlIGtleGVjaW5nIGdl
dHMgc2V0LA0KYmVjYXVzZSBhYnNvbHV0ZWx5IG5vdGhpbmcgZ29vZCBjYW4gY29tZSBvZiBoYW5k
bGluZyBpbnRlcnJ1cHRzIGxhdGVyDQp0aGFuIHRoYXQgcG9pbnQuDQoNCn5BbmRyZXcNCg==

