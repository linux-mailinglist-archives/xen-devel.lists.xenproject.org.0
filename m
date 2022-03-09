Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94B74D2CF0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 11:16:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287669.487760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtMu-0004Ax-Fr; Wed, 09 Mar 2022 10:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287669.487760; Wed, 09 Mar 2022 10:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtMu-000494-CY; Wed, 09 Mar 2022 10:16:32 +0000
Received: by outflank-mailman (input) for mailman id 287669;
 Wed, 09 Mar 2022 10:16:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRtMs-00048y-Lr
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 10:16:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faac0bd4-9f91-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 11:16:28 +0100 (CET)
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
X-Inumbo-ID: faac0bd4-9f91-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646820988;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=E0CjDe5uKYEYDSvaiT+zPosQ6lvbgBG37goKydJ1mss=;
  b=VQsit1wLAyD+TtM67IqCOpZlht2+MHJw+ZHRr+4RTxhh7sgHcfKXUybE
   CNgWTyV4+KuxbSSwm+SwW28zU4ozpYu411HqMolI5oEYQxvqeHy3jQ5vZ
   VFLyc3bmXiqiT3v8XeUDYZrcGn2ZlEQ254v4xvRX0DASEnSqri7wvPskO
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65724506
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jlgJHKBd+ES+uRVW/9Xjw5YqxClBgxIJ4kV8jS/XYbTApDkm0GAEn
 DBMWGzUbvmLZjCneNxxPdyxphwEv5KEytA2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh09Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhhm
 IsdrIOuRjsKAbzrn7QWAz9HSSVHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgWhq2p0WQ54yY
 eI5UzNVSU/BaidTK1k1Mo4FmO2DnWfwJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHN6CzTuI9Fq8i+mJmjn0MKoKHaC83u5nhhuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQonSJoxodUNp4CPAh5UeGza+8yzyQBnUACAVAbtMmnMYsQHoh0
 Vrht8ztLSxitvuSU3313p2Zty+oMC4Za0oLfzYZTBAt6sPm5oo0i3ryos1LSfDvyIevQHepn
 m7M/HNWa6gvYdAjx/XlrUnYnT2QhafYaQll7VXxQTih11YsDGK6XLCA5V/e5PdGCY+WSFido
 XQJ8/SjAPAy4YKlz3LUHrhUdF29z7PcaWCH3wYzd3U032n1oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9/y4Dpg4jfIUO/CdkTNrGgk0OyZ8OEi3zCARfVkXY
 8vzTCpVJS9y5V5b5DS3XfwB9rQg2zozw2jeLbiikUj5juTCPi7JFetbWLdrUgzfxPnUyOky2
 4wDX/ZmNj0FCLGuCsUp2dV7wa82wYgTWsmt9p0/mh+rKQt6AmAxY8I9Mpt6E7GJa599z7+Sl
 lnkAxcw4AOm2RXvdFXbAlg+OeiHdcsu8hoG0dkEYA/AN44LOt30ss/ytvIfINEayQCU5aUtH
 qdfJJnYXKgnp/au0211UKQRZbdKLXyDrQmPIzCkcH44eZthTBbO4djqYk3k8yxmM8Z9nZFmy
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:1J0HRKAa4bsEkiLlHehAsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dC/DDEytHRuQ639QYTcegAUdAH0+4WMHf+LqUgLzM2eabRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJunfwivZv3Evoz6hNO6Ws19
 60Q5iAq4s+PfP+TZgNc9vpEvHHfFAkf3r3QRCvyBLcZeQ6B04=
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65724506"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kbvi+66Sgc1qyfc3RGaqN9q0efesQTzMFKNyYutD8HYTpovhZeTL6pEGuzKY68S4L4K18L8dqIaDLSqNvawpmf38JFfB5TtN3qsD8SzVTw1dmCDe6Dl9Zxz1NOw5Dgr9eMa14XE5OHEZKxncqYYYPzDEkuiuLXpxF9pUUiLzk3BPDab06heyjEQCPPDOBki8cvAHEbnz5GwwVBwhdR3g0FiMltz1bQgf7HSW6TFs+2xOWLiSoOfw0QxtCqQLXaFhlS9eblD8EMlDgKipRopBcWDggx0PVpuciyW9I6KKSpmHxyqL4MhOD+hWIhxjLNP89LTqz80CrttUXtLefjzIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buEnencRc6gurbkDDOchaLWP2QtAK1NPFLb2PKOhETE=;
 b=OyvB0lhwixbv1r0ypLdNEtLzH2dgFzS078GZAiSk8fEVz3X6noRi0Iy/W/5Z8xVkG1l5UfV+rgUnlJCzpRAcPJRpPBCslMrj9ilkGkvvetRUK3FPJ6Nkgoe6wB06/JdYmwkdYS2ZwD7AFpasKLNDk+MQJQRKR8a64cjZL6GcE2Fj01aDfmW1UYlDUqQYRp7qV6Bd4YmZDq66WACL+FBLyhTNd2IXg+M07TmbYLGV1M8QZVneTiiQGRDtJKPrNyO0wIi6E79oJSXmpC+TYy+cJSt+T8AnKCbQEO4Q5iabuKYqKzIRDoiAz+zEzMYtI4EGoArKQZ326+E4dX+oDuRoPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buEnencRc6gurbkDDOchaLWP2QtAK1NPFLb2PKOhETE=;
 b=AkaXGQTA6yUSLzW+1c6wfTIRrNgpvT+IcAP41gOtLmP9iu2zgqBb5FMyVHhoP7rUk8aGsLzhdHn/ns9PI7OI+/nAk5n7PYLevGo+6+yhfFbrRNJjaQ20cvcNtcoz0incoISzmG7SH27WPauA/yS7DFoK5cIt8FPsxGkKjSRkP6c=
Date: Wed, 9 Mar 2022 11:16:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Message-ID: <Yih+ZjxKz0SMOXef@Air-de-Roger>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
 <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
 <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
 <175a55cc-70b4-4832-9a78-0db57a9ae4a4@suse.com>
 <1205992D-ACE4-4E94-B554-3B14F6D9697E@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1205992D-ACE4-4E94-B554-3B14F6D9697E@arm.com>
X-ClientProxiedBy: LO2P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13078490-51c7-447c-3d84-08da01b5d5d6
X-MS-TrafficTypeDiagnostic: SN6PR03MB3632:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3632DCE92F9702FAE7F11B068F0A9@SN6PR03MB3632.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /3VXSnJk4eWAAKra8m8KyjEgsOBOUfckM7U/pvsAxgIYCwZswxMrbw9IhqsBrPRcJ1UCmgZJLuKj5sODOjExjqOMKBCukWHkIkwQqJ1GITZhZSJHdLAAPAbheh+wGgJ0dUncNes8h+dNPIX5Z9u4RVSxrboHXm71VvQ3DfXjvavRaV72hFmlZmfUczH3LWRsreRyh+DOB/V+x+O58pAn81uHrzxDEszcGjCfqo9LxE40EN+E1RP9ur5JSR/SKp4dxgMH+F8uFH1dYcSmIxsN9kYNU9dveyHzaSN6drflZSETeAOx7aG9NvEEwosxKPrc39cU3uk+oZC6C8osl/2WTwLVhu201w5qRFCYXifKRqokOTr8suHX8YXkeiojU2gxljLKGaHDRxccXMbfbDd+MqYgMAd4IL6IEpHF8BfXtxJTHzHinzOMqMl5cQM4GpjNO1FUDGW9ngb/vi1VoLPwxvYGxZM/oNKpk2Jy51IVCO9Ih6lHe9o2qwrxDHKIj+dzkzYu78TezGv9xq9w7P6IGI1okwVZPH1LL78exHSDywTcebXU1p2tEG12onQIBb2HacnDUinSj0pu+yX3zeOgGEnaFOHcc0KkRBDncSi1B8Xxs4r+XE8ySuH+PpDKNa1TBJ5eCjHuwfvaaekUV3tAAGlEXhZ+JDP313xBF8mEn3zdYLxQ1BnAXvZvZVku1zTK+6M9wLVdnozNoKRl+AXhpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(2906002)(508600001)(6512007)(8676002)(38100700002)(6666004)(66476007)(186003)(26005)(53546011)(9686003)(66556008)(6506007)(82960400001)(8936002)(86362001)(5660300002)(316002)(83380400001)(85182001)(6916009)(54906003)(33716001)(6486002)(4326008)(66946007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTdITnMwbUZaVWJXWFh2T0FydEhZcTNzODJndkhqd1Y3cEc5MkNHeWtqN0FU?=
 =?utf-8?B?SDVCNVpBeVhTb3BFZTlnN2JvN3hpR0YrNStabTc5ajE4TysrYzVxdmtMQkYz?=
 =?utf-8?B?MTg2ampPNEIvb2lrWFdmUXZpVzhWVUl3THFLYmtyRGo5cW9rWHlwcGt0SU5M?=
 =?utf-8?B?OTFoNnRKRGlEaWpZMldETlNycDNqcGFXVGcvaXdwam5TVHNybmlPc1U3YU84?=
 =?utf-8?B?YW1PeUw3VGlZUVVIY1hWR1pXZmU3c3lqQnlGMVNCcUhVcVBhKytvZjU2Rm1Y?=
 =?utf-8?B?ZTlQWm9lYXl5TG9JNHZsbXUvaE5iTllaWkdWNmp6ak5DMG9Ed3NYY1hzU3VP?=
 =?utf-8?B?ckY0dFM3WFRpb0JMakUvSXlGMk9FRjE5d2JqUTdUTE92dHZtdmtSYjI5L1Vs?=
 =?utf-8?B?L2VSUnB6K3NjQUZPZ09qblZCZXpob0ZHTG85Z0w5N3NjUmtUL0xHbzlPMWh6?=
 =?utf-8?B?MTVHUWlTck5ZRVovcEVHL00yR2dVU0toN1NSUzNrODBjeGVYYXhXemtLZEVE?=
 =?utf-8?B?RmdCOUU1YTdOZTBwZGdLTm1BbzhJdVplcWdrRkFxdTd1NEhmclAxL0VMVi8w?=
 =?utf-8?B?RjZzWnlGN1F4QzQyY2l4N1hFU0p6Q0tOYTFUNjl0V3BreExwZDJhYUFJcUl5?=
 =?utf-8?B?UGMxS0hEVEtxNWs4VXFzVlpaNUtkdFlJSkdja3JTaVBYYlYyT3lmVzVlYmlz?=
 =?utf-8?B?Q3U0QjlFcnYvd3NUdkg3cnNZQ2twNlZDd3BJam1mb0RzTGxwQTJaMkEydUlH?=
 =?utf-8?B?d2VQZnF6bFpZWGxkUlVPZVQ5d3hPcng0NUpGQlVCL2h2ZEY4RENzd2FFQlF6?=
 =?utf-8?B?KzU2SGh4TXNEOWFnMXZITXMxZ3ZJdFdKa2x4VDR5QTQ5RElKTjJ5Nk9weEhE?=
 =?utf-8?B?V2E2bWFYTC9LeDkyVHJBZEZ1ZUZPay9sdnhtTEhDWmR2Nk5RYVhGWVNqcS83?=
 =?utf-8?B?cnhMSUIySTNQaGVXaDhjUGVYM3k2QjRtangrUjQvbUUvY1FDM2I2NXJBUXE4?=
 =?utf-8?B?eWE5eXJrTU1MY3B5c2FrblZvOXdWMUp3MEZOMWhrdlZBZGQ1ZFJCanh5T1Np?=
 =?utf-8?B?QVFnRTZyejlpMkJPM3lHOUJvZ2h6RW5kTjNZNXBxdWM3dkg3LzMvNGNBWHBR?=
 =?utf-8?B?N2xpc0hOd0o0eDNQT21jQlcvWXhDc25qMXpwL1ZYNWZBbno5YzI0MXlGQWdJ?=
 =?utf-8?B?SmYvWWFMYjhpUHhDRVRYMUlWUjFXMEJFRmI1RDNrbnlsSDRPRkx6MFVlb0ti?=
 =?utf-8?B?SzNoUGRQRGE2anQ5STVOWDBUK3hldXpPUU9ZL2pSVk5jT1JHMUM3K0J1dk1p?=
 =?utf-8?B?UUY2OXMvcUNlVTY2amhKNGJwUElqVzQwc0tSNS9BWjE1dWRhancwRUtRQ09s?=
 =?utf-8?B?aUZqWGladFhzaHEyRUtzalhCUW9EbVFyeG04anpMREZIQzJMQzNyS3dzWkhE?=
 =?utf-8?B?MEY1S2lOTWxUelVTaXRwYzM2TkE4MU44NkM5QkcxK1lKMEYxZHdmWHEwR0Ry?=
 =?utf-8?B?ck9zUTF6YWxmRUUwVmNRZ2tsU2RZbFlVOVRqdW9TNEhQTVRCcVpmUkw5UkJP?=
 =?utf-8?B?Zks3Wkxrd0JjOVhFSTZJMGlHeUlLbkd0bW1RMXp3TEluZjhKeWlidzY4dG15?=
 =?utf-8?B?b3FzaUtzV1RPTXN6TzlhSFlZUHNBdG5lL29CUFVMaFFQb2x6akovNkNRQ1F5?=
 =?utf-8?B?ZVJMWEx0YWZncEpxdHp5aFZWYlNkMVgxR2JFRkVxRkF6TEduTk10Ylc2SkFC?=
 =?utf-8?B?WThUc3hiVkVNREJoYnV1N1Z0cmpCU29ITS9TaXRTUWJqVjQ3THVGUExSOEpC?=
 =?utf-8?B?SEw0anJ4aGNQa3pHZThtOEU4b25CbzRwazYya3AvN3pjdlhTMVNBWjdIOWhG?=
 =?utf-8?B?YTJjby9BTlpJdk5jTTJ2UGtKTXlzQVBVTDBDQmtUb3BMeFFRTGNEVHFYazNQ?=
 =?utf-8?B?NXVkMlF5N1JyS2xzb3BKeGE4aS94MGlmdlJLODFLSTBNR0t0bXNCUlNTdmoy?=
 =?utf-8?B?VVY2MEFFSXRqRTJldXZqNDVNa1p3RVlmbzRRSUozMWwxV1UxWHg1N1FFanp2?=
 =?utf-8?B?NDBSZnJkSVdEZm1VRC9QWkU3ODk3eFdGeXlwNEJXaE1udTF0T3NtNUJBSk9I?=
 =?utf-8?B?UTE3emthdjZld2grZ1pzbkxLOUc4NWJHbVh4WHE4UEdLVTJUZm5nektFdGVU?=
 =?utf-8?Q?LlgvPBYXPvKOgndalfKgBYU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13078490-51c7-447c-3d84-08da01b5d5d6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 10:16:11.5891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADRkO53R+xrZ4XxolAb/lrxGZZsSWmo87V1TsXnFyfRix/XI7ic4j2IidFI74qgRcFKzo7tZAcig52hMahFiig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3632
X-OriginatorOrg: citrix.com

On Wed, Mar 09, 2022 at 10:08:12AM +0000, Rahul Singh wrote:
> Hi Jan,
> 
> > On 4 Mar 2022, at 7:23 am, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 03.03.2022 17:31, Rahul Singh wrote:
> >>> On 1 Mar 2022, at 1:55 pm, Jan Beulich <jbeulich@suse.com> wrote:
> >>> On 01.03.2022 14:34, Rahul Singh wrote:
> >>>>> On 24 Feb 2022, at 2:57 pm, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>> On 15.02.2022 16:25, Rahul Singh wrote:
> >>>>>> --- a/xen/arch/x86/hvm/vmsi.c
> >>>>>> +++ b/xen/arch/x86/hvm/vmsi.c
> >>>>>> @@ -925,4 +925,106 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
> >>>>>> 
> >>>>>>   return 0;
> >>>>>> }
> >>>>>> +
> >>>>>> +int vpci_make_msix_hole(const struct pci_dev *pdev)
> >>>>>> +{
> >>>>>> +    struct domain *d = pdev->domain;
> >>>>>> +    unsigned int i;
> >>>>>> +
> >>>>>> +    if ( !pdev->vpci->msix )
> >>>>>> +        return 0;
> >>>>>> +
> >>>>>> +    /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
> >>>>>> +    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
> >>>>>> +    {
> >>>>>> +        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> >>>>>> +        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> >>>>>> +                                     vmsix_table_size(pdev->vpci, i) - 1);
> >>>>>> +
> >>>>>> +        for ( ; start <= end; start++ )
> >>>>>> +        {
> >>>>>> +            p2m_type_t t;
> >>>>>> +            mfn_t mfn = get_gfn_query(d, start, &t);
> >>>>>> +
> >>>>>> +            switch ( t )
> >>>>>> +            {
> >>>>>> +            case p2m_mmio_dm:
> >>>>>> +            case p2m_invalid:
> >>>>>> +                break;
> >>>>>> +            case p2m_mmio_direct:
> >>>>>> +                if ( mfn_x(mfn) == start )
> >>>>>> +                {
> >>>>>> +                    clear_identity_p2m_entry(d, start);
> >>>>>> +                    break;
> >>>>>> +                }
> >>>>>> +                /* fallthrough. */
> >>>>>> +            default:
> >>>>>> +                put_gfn(d, start);
> >>>>>> +                gprintk(XENLOG_WARNING,
> >>>>>> +                        "%pp: existing mapping (mfn: %" PRI_mfn
> >>>>>> +                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
> >>>>>> +                        &pdev->sbdf, mfn_x(mfn), t, start);
> >>>>>> +                return -EEXIST;
> >>>>>> +            }
> >>>>>> +            put_gfn(d, start);
> >>>>>> +        }
> >>>>>> +    }
> >>>>>> +
> >>>>>> +    return 0;
> >>>>>> +}
> >>>>> 
> >>>>> ... nothing in this function looks to be x86-specific, except maybe
> >>>>> functions like clear_identity_p2m_entry() may not currently be available
> >>>>> on Arm. But this doesn't make the code x86-specific.
> >>>> 
> >>>> I will maybe be wrong but what I understand from the code is that for x86 
> >>>> if there is no p2m entries setup for the region, accesses to them will be trapped 
> >>>> into the hypervisor and can be handled by specific MMIO handler.
> >>>> 
> >>>> But for ARM when we are registering the MMIO handler we have to provide 
> >>>> the GPA also for the MMIO handler. 

Right, but you still need those regions to not be mapped on the second
stage translation, or else no trap will be triggered and thus the
handlers won't run?

Regardless of whether the way to register the handlers is different on
Arm and x86, you still need to assure that the MSI-X related tables
are not mapped on the guest second stage translation, or else you are
just allowing guest access to the native ones.

So you do need this function on Arm in order to prevent hardware MSI-X
tables being accessed by the guest. Or are you suggesting it's
intended for Arm guest to access the native MSI-X tables?

Thanks, Roger.

