Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44385357E90
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 11:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107081.204665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUQVz-0008Fu-Oa; Thu, 08 Apr 2021 08:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107081.204665; Thu, 08 Apr 2021 08:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUQVz-0008FV-Jj; Thu, 08 Apr 2021 08:59:51 +0000
Received: by outflank-mailman (input) for mailman id 107081;
 Thu, 08 Apr 2021 08:59:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3iLd=JF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lUQVx-0008FQ-Qz
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 08:59:50 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a255f2a-ab06-49c7-8ed0-e72226decdf8;
 Thu, 08 Apr 2021 08:59:48 +0000 (UTC)
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
X-Inumbo-ID: 0a255f2a-ab06-49c7-8ed0-e72226decdf8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617872388;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4Ia33LKwhjbPkscb1Or/7OKSTir3dz8aw/WNARweU8M=;
  b=Eh5zNDW79pt8SsXTh0IloD5SfotUf6nla4sjvLMdmfohpqIEDnvDamhw
   AvpMptJ4Tb6tXuo6xNVMYgtxgP12iWp9FzeqaKdD0TgtrlFWTSU/M9RVj
   3X47Akr1BIzSJFBe4uczj8eTaKHzzKymGlVESJ7FIY/Cy02RL/sFA+lT8
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NabV8eXiVuDFD/cJGpK+WSLLv1yZVlJPBZGJfq5I3696Mf58ha8MBc8jYC3ackXZ8XL9jXJtGm
 Oc1rMSv7iHrahgdAI0YXBIDoekbpbYz9eV6fz/tMMqViS6f9C3dTz9SSHY0Oi/k1j6i2ST8KZQ
 XU+qYOimUvnuoqTM2DyW+sUmRa0rwmGqhqIgCvvc/Niup1vcT5R26JixR70ZG8KbONI4TrUCMi
 0Ur3uTFiLWKlmxHYrLhdicTAY0N9yK64HHVUU5Sa2zjFDUvUZxL9f50wY5asVy+dur8Hhgcw+q
 6sA=
X-SBRS: 5.2
X-MesageID: 41145433
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cFGjX6uXZo27OzFdhlNgd3wO7skCxoYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjjtRICzzKDwQeCBtA50lGJ
 2AoudGvSOnY3QLbsK9b0N1JdTrjdvNiZ7gfFo6HBYh8gaDlneF77T9Hhie0H4lIk5y6J0l9n
 XIlBG827W7v5iAu2Th/kLwz7ATotvuzdNfGNeB4/J6FhzAghulDb4ROYGqkysypIiUmTMXuf
 nK5ywtJsFir07WF1vF3SfF/ynF/HIQ52T5yVme6EGT0fDRYD4hEcJOicZ4X3LimjMdlepx2q
 5KwG6V3qA/ZXir/FWflqr1fipnmUaurX0pnfR7tQ0mbaIkZKJMtotaxUtJEf47bVPHwbo6G+
 pjBty03ocxTXqmaRnizw1S6e3pdHEyEhCae1MFq8yY3hNH9UoJsXcw9YgxmGwN+4k6TIQBz+
 PYMr5wnLULdcMOa7lhbd1xDfefOyjoe1bhIWiSKVPoGOUuPG/MkYf+5PEQ6PuxcJIF4ZMukP
 36IRxlnF93X3irJdyF3ZVN/ByIan66Ry7RxsZX4IU8kqHgRZLwWBfzCGwGoo+FmbEyE8fbU/
 G8NNZ9GPn4N1bjHo5PwknXR4RSE38DS8cY0+xLGm6mk4buEMnHp+bbePHcKP7GCjA/QF7yBX
 MFQXzdP8NFwke3WmLpoRTYVn/3E3aPv65YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gXcS
 JFUfbau5L+gVPz0XfD7m1vNBYYJF1S+q/cX3RDohJPF0v1dL0EquiOYGw65grCGjZPC+ftVC
 JPrVV+/qy6a7aKwzo5Nt6hOmWGy1weuWyNVJVZvqGY/8/qdtcZA/8dKeJMPDSOMyYwtRdhqW
 9FZgNBbFTYDCnShaKsi4FRIvreedl6iAKCOtVVtnrbiEWZqagUNzgmdg/rdfTSrRclRjJSiF
 E02bQYmqC8lTGmLnZ6vP41K2RWaGOcAKtPCSOMYIk8oMGtRChACUOxwRCKgRA6fWTns2EfnH
 boIyGvdfbXOVZFoXxD3qH28FR7S3WFcytLGwNHmLw4MV6Dlmd40OeNaKb26WeXZ1cY6sw2MT
 3OY1IpU0hT7uHy8CTQtCeJFH0gyJlrA/fUC647darPnlm3LpeTqK0AF/hI3ZpsOdz0qNUXWe
 aHdwL9FkK/N8oZnyiu4lo1Mih9r3cp1c7y0Br+9W6iwToRB+HRLFkOfcBsH/isq0zfA9CG35
 VygYhr4a+eMmDtZsWHzq+SRThZMR/XqXO3SeZtiZ08h9NHiJJDW73gFR3P3zV7+T97CuHevk
 YXWr5677DMIZUHRb1bRwtpun4S0O2SJ04quDHsCuAwfVsRn2bWVun5lobgmP4KOAm9vwP+Nl
 mUzj1F89rEVyWF06QGC6hYGxUgVGEMrFBj9viFbYveFUGDcPxC5kOzNhaGAfVgYZnAPbUbtR
 Bh5d6U28eRairjwQjV+R92OLhH/WriYcS8Bmu3aKN12u3/HVSHma2x5sGvyB/xVDugckwdwb
 R/SnZ4VLULthASyKst0iazTaTrokUq13tmiAsX6WLF68yB+2fUHUZPLAvDpI5ZNAMja0S1sQ
 ==
X-IronPort-AV: E=Sophos;i="5.82,205,1613451600"; 
   d="scan'208";a="41145433"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2RerRkRZGkyGgyKQ66fVo80S5wgiHdZ69It0cuNXcWBeWTAQ1s+XDNUdxa7ERXXFPNow694migp8ArPk3v+5xd6ArMnKwjiWg+RUdWTbRxjfME3FPUfi1wf2IVNT4fcJSeQxPVoCzQZBO+aMy8p6tSNwwkTI6DsoHEd3x8MsGj+lPQ0qohgqvERsrhQRYYH0nPqhKhSSbc8hF/WsEgDLRxr5jCIJX/N1+qn5nmmp2KDIE8gwlwiAtg6ZZrypnZu1iTHi1S89qMUXsU1NahhpOW5rWhy80C1AcmV+aeczNNHlNPR4yLVhg1tR/MVYpYLTFlAgcx4F5YNnVbPQX0miw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/Y3Ptp3NvXa7GvLeD1AMwTHEEKEFqDGrIrx1A0D+MI=;
 b=F7zIP64+2yjoyMG60zQ0c9i8p/8z8t/NHYrvH/qxlsmur2k1qt3a6MXjuLrjAwr79wjHtqlVaSwWn3iO+oN47spuYJuWoXHj0HgJySKQl352lI4USeyDzG4wzrPpi7pwwxHen1QONKqs90eNfXW4okOH/NsghXS1X1YKvNdsapp6wT/DJrcOfNIy1Mjb6/zic52aAeo2VL7hqZloA2+QVbH/6KLvFImL4Y3y1ri4MUB3ErvpFKHZo9Rj4NFULb6XWz6WpxzUtp2TIjBz1dl6j/v8T6UA+aKVtAEDkE9RZRcMhYYHbBcK3qX4gTkbxoVZlvElgnLp6OlqcSuKp4SOtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/Y3Ptp3NvXa7GvLeD1AMwTHEEKEFqDGrIrx1A0D+MI=;
 b=kM0YYUpXR8Qqz9620s0vzFskecQOI2KYy/8mmJrwPscScpiqdaYx5Fiss5VQHZUW3elu3yc7dOvZDyMOAkM2PrUzHe2BN+WtVxAo0OywFnIuukDNJcMurs6SuEPLpzSO42viA4FYjAuB/L3+Jx5Oh2vpLrCuzPRE9XBeS5b5AeE=
Date: Thu, 8 Apr 2021 10:59:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 05/11] x86/vioapic: switch to use the EOI callback
 mechanism
Message-ID: <YG7F9afvuvtqgSIS@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-6-roger.pau@citrix.com>
 <f8d9c37f-8896-36af-712a-ac0765567409@suse.com>
 <YG3iAeFFA/ZJh5es@Air-de-Roger>
 <402bba57-4998-fa9c-2767-235e602a06bf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <402bba57-4998-fa9c-2767-235e602a06bf@suse.com>
X-ClientProxiedBy: MR2P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96d8d5ef-aaf4-4cfc-92fe-08d8fa6ca813
X-MS-TrafficTypeDiagnostic: DS7PR03MB5575:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5575EC74D5D8A0CB141E81428F749@DS7PR03MB5575.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrzoDHsLc7/kHFk15IncguPVa8s7GOIjYLDpPVRKXHU/TxzHAuF+zM4j/Wgeg2HpCIirowu4nzBHk+oIJbYKBf3yOy0fIHkFy8MYOPUPQEEzE7lamwisvu8bXqBz8Sfz8rOlaHe8uw6W/8ITOtTQf+1PjzuoVQGLfQUkjKnczVsYDOR7asXLW0amXdIbcVCwF5sm09kZ9BJ1Vzl+/VzrGpLSEmZZbLAw0SmkDAq9dJt8MAjQmzRRr6BfvhnQtnqTqW8MPdQ1vI0n4CHrRIcAs0M63poLesE7dlY2JatDRgNwXfFaf8fWAwG2cLhFdUZx9pVspsRmScgIk7GgNtY7JmLNM389q0NP600uoJ8/fetATx45P1nrWmstxIjplVSSfI+MXfXou2lkwGEhGkOU8T+KW4H1u4rGJKGWOGXByz5vuWhOuZGPYiPwCLopBaNz3/g5s/S9kQiJ3XbbU/PgY4der7BfdL6PlV2Ri1UXEmv5vtmS3XFTTnDO8PsY/ICDhV5k7y1/Qjp5TEbi8keJJFRYqgOBjFPXyK4FELbtTh0PxlMtmeSMjw5p63JiOVXr+Qr4V9RFvyGrJdUNB0d3qSKZgspw034lGbyT2gV3/2U+Xh4j7I0KLZgkfe/JkIDFuoyZpnDJDnOfcniGyvHy1g08FWNwGLi0r0fLaxOuMAJYQFAMHgOQ5gH8LWLnXvUR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(478600001)(316002)(53546011)(8936002)(66946007)(66556008)(66476007)(5660300002)(38100700001)(4326008)(2906002)(26005)(33716001)(186003)(956004)(6496006)(6666004)(9686003)(85182001)(83380400001)(86362001)(54906003)(16526019)(6916009)(8676002)(6486002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cnQzeWNJNDl0SmhpMnZFTVVueXRBVytxYlBxeHcxeHFpNUVmNGh2eE40M0Zi?=
 =?utf-8?B?anQ3OGtJWXpNRE82TmlHMkg1OXk2OEtQNmF5SGVtTWx5SHQ3WldjWEdaajFh?=
 =?utf-8?B?cDFFUHhFazN4UnY3ZWQrQnlRY0syYkxFRE1WV3grVS81SUlTWXc3bUNaS2lo?=
 =?utf-8?B?aXlFUkJrYTFYZ1pyRDZEeGtycjRmcW5EaG1jd0h1dW1wMUlRTUpQNmJWQVRQ?=
 =?utf-8?B?b29EbUpYUGNlWUpNUUc4aDVvZFJJeENVajNPbERva2srQytmL21uTWswVFhL?=
 =?utf-8?B?NXNzd0FpWmRmYVV3UFlLK0Vwd1l1V1NoczI0ZmJMWFlGUlBaZnk0TmtVRllM?=
 =?utf-8?B?a0h6N05wdFB4OTc3d2RjQmVjTzlDaENRVUJxVVJHWTFJTmh2NnRhVUJmSElU?=
 =?utf-8?B?ZEtkb0hZclFXRDI2Z3BxcDI3ZVhMV0cwc1RodGJJZGJtcWhOQ3RnTzBiUGpj?=
 =?utf-8?B?Wk1MRi94VXF1c2xaTjZCNndNOG5xZE1neFBhOWVHNVNzbS8vZnc3aG5laUN2?=
 =?utf-8?B?OTFiNzI0TXovaWZGQ3RZOURJSDkzTG8vRGlzWWhMc3VoMmgrbmVFd25sL3ZX?=
 =?utf-8?B?QXMrcFYxSUZKNUttbnlUV0tLN3M1NFpuNkVESEZjelNuNE45akZrblFaRG5y?=
 =?utf-8?B?T1JQdTZ4K01OZ0ZaWEZOcWUveThSTk9sQ2tmMmZ4dUcvTEQyclNLeXRpYVFY?=
 =?utf-8?B?Rkd2UTNLNWsvYVRYWjNrN1QwZjVrdDk4TUVYYS85ei9LWll1NTJISjJ2SnZ6?=
 =?utf-8?B?cUR3dFlGYmlzYW85MzVJVzRFU3V6eWtoYnpwaFZIZ1RCZ0lFc1JIWTVpWk85?=
 =?utf-8?B?ZlFUOTZyNEVUZVZTTTFCR2t0VHRlNTVJV2ZEeXB5RDBjRzBsT3RTOVFpcnJn?=
 =?utf-8?B?THFDV1Ewa2xObXlJTC9COG1uY25NWUo3eGRHMnQzQTZkdU90YWJlY0NJaUxN?=
 =?utf-8?B?ZnJHT1JLdzR2b0lkMllFTXhMWXltQzZSbDZzcGErQmV1Q3RzeDlENW1XNTFY?=
 =?utf-8?B?elJXTkY0QmVmWWNpeUJ6dHlDcVNobEpoRkkvRFVJaDFnMzczQ211bnM3dWcw?=
 =?utf-8?B?YVFJRnN4NnJacy9aYUVmemxMSlFXSnNNSTJFRVQ3QzBIUGYvamxXMllweG1E?=
 =?utf-8?B?aTQ0YXNuOHZNVTdLNkRNRk5xTStrSXJyaG1IdDZDNFlta3Z1YUwwYm1Rb3BK?=
 =?utf-8?B?SHM5VEcyZHZRaURia0w2Zm5xNlArZSsySkJuNVVxaVNaTVVCSVYwWTFUM2Zz?=
 =?utf-8?B?VXlpNzdZRitXSnZ6dnRBUUp1azRLbmFmRkw5M294aW5ncmZVcWpiWGFBWmNS?=
 =?utf-8?B?Tm1rRjN6ci81MUZ0VnU1MzkzSlo0Z2N2QSt3VDVCUjhXMjJrbW5EZ0FwaU8z?=
 =?utf-8?B?dHJKeEh0aEU1M2tZTUFvQ2lqaGtTWVo2YzgwVlZTTHEvSTBNcFcrSmpNWmdK?=
 =?utf-8?B?enZlaU9GdGlOa2d0K012elQvbkYreFI0V3ZWNm1pUFA5RG5YMFFCMHdNQUtU?=
 =?utf-8?B?bUlCbWpyak81R2Z5WU9LYWJSSk5uMHRqQkJHQUp0WkRkTVk0M1pjTlBidUJw?=
 =?utf-8?B?ZjcxTnBBM0dLaGsvaldxQXlNSGNyUHZwNUtXSVdEZktVMVExQWpGbThKazJK?=
 =?utf-8?B?VjJVR3dQSDhZaHdsUUFzM2U3VmoySlo4QmNXSWsybzgwMEZYMzVQWk9uMkZa?=
 =?utf-8?B?ZFhlWjZBeWZub2JCTGlNVitYVTM4Tk1UaEZFQ1V6WmNGbXNSS0JrdExIMU1k?=
 =?utf-8?Q?4gYILZHzP8Smv9J64NTnJxUDwsPnmX1zduma0f9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d8d5ef-aaf4-4cfc-92fe-08d8fa6ca813
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 08:59:45.7068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+I/eP6ubOh+YURDIbMvqaArAq4+1OpProHYcYuDJdyA2zy/MzwCKLKG29iQwHMpSrTpjeqd0LMwI6MaKfdd3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5575
X-OriginatorOrg: citrix.com

On Thu, Apr 08, 2021 at 08:27:10AM +0200, Jan Beulich wrote:
> On 07.04.2021 18:46, Roger Pau Monné wrote:
> > On Wed, Apr 07, 2021 at 05:19:06PM +0200, Jan Beulich wrote:
> >> On 31.03.2021 12:32, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/hvm/vioapic.c
> >>> +++ b/xen/arch/x86/hvm/vioapic.c
> >>> @@ -621,7 +624,43 @@ static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
> >>>           d->arch.hvm.nr_vioapics != 1 )
> >>>          return -EOPNOTSUPP;
> >>>  
> >>> -    return hvm_load_entry(IOAPIC, h, &s->domU);
> >>> +    rc = hvm_load_entry(IOAPIC, h, &s->domU);
> >>> +    if ( rc )
> >>> +        return rc;
> >>> +
> >>> +    for ( i = 0; i < ARRAY_SIZE(s->domU.redirtbl); i++ )
> >>> +    {
> >>> +        const union vioapic_redir_entry *ent = &s->domU.redirtbl[i];
> >>> +        unsigned int vector = ent->fields.vector;
> >>> +        unsigned int delivery_mode = ent->fields.delivery_mode;
> >>> +        struct vcpu *v;
> >>> +
> >>> +        /*
> >>> +         * Add a callback for each possible vector injected by a redirection
> >>> +         * entry.
> >>> +         */
> >>> +        if ( vector < 16 || !ent->fields.remote_irr ||
> >>> +             (delivery_mode != dest_LowestPrio && delivery_mode != dest_Fixed) )
> >>> +            continue;
> >>> +
> >>> +        for_each_vcpu ( d, v )
> >>> +        {
> >>> +            struct vlapic *vlapic = vcpu_vlapic(v);
> >>> +
> >>> +            /*
> >>> +             * NB: if the vlapic registers were restored before the vio-apic
> >>> +             * ones we could test whether the vector is set in the vlapic IRR
> >>> +             * or ISR registers before unconditionally setting the callback.
> >>> +             * This is harmless as eoi_callback is capable of dealing with
> >>> +             * spurious callbacks.
> >>> +             */
> >>> +            if ( vlapic_match_dest(vlapic, NULL, 0, ent->fields.dest_id,
> >>> +                                   ent->fields.dest_mode) )
> >>> +                vlapic_set_callback(vlapic, vector, eoi_callback, NULL);
> >>
> >> eoi_callback()'s behavior is only one of the aspects to consider here.
> >> The other is vlapic_set_callback()'s complaining if it finds a
> >> callback already set. What guarantees that a mistakenly set callback
> >> here won't get in conflict with some future use of the same vector by
> >> the guest?
> > 
> > Such conflict would only manifest as a warning message, but won't
> > cause any malfunction, as the later callback would override the
> > current one.
> > 
> > This model I'm proposing doesn't support lapic vector sharing with
> > different devices that require EOI callbacks, I think we already
> > discussed this on a previous series and agreed it was fine.
> 
> The problem with such false positive warning messages is that
> they'll cause cautious people to investigate, i.e. spend perhaps
> a sizable amount of time in understanding what was actually a non-
> issue. I view this as a problem, even if the code's functioning is
> fine the way it is. I'm not even sure explicitly mentioning the
> situation in the comment is going to help, as one may not stumble
> across that comment while investigating.

What about making the warning message in case of override in
vlapic_set_callback conditional to there being a vector pending in IRR
or ISR?

Without having such vector pending the callback is just useless, as
it's not going to be executed, so overriding it in that situation is
perfectly fine. That should prevent the restoring here triggering the
message unless there's indeed a troublesome sharing of a vector.

> >>> --- a/xen/arch/x86/hvm/vlapic.c
> >>> +++ b/xen/arch/x86/hvm/vlapic.c
> >>> @@ -192,7 +192,13 @@ void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
> >>>  
> >>>      if ( hvm_funcs.update_eoi_exit_bitmap )
> >>>          alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
> >>> -                          trig || callback);
> >>> +                          /*
> >>> +                           * NB: need to explicitly convert to boolean to avoid
> >>> +                           * truncation wrongly result in false begin reported
> >>> +                           * for example when the pointer sits on a page
> >>> +                           * boundary.
> >>> +                           */
> >>> +                          !!callback);
> >>
> >> I've had quite a bit of difficulty with the comment. Once I realized
> >> that you likely mean "being" instead of "begin" it got a bit better.
> >> I'd like to suggest also s/result/resulting/, a comma after "reported",
> >> and maybe then s/being reported/getting passed/.
> >>
> >> As to explicitly converting to bool, wouldn't a cast to bool do? That's
> >> more explicitly an "explicit conversion" than using !!.
> > 
> > I've always used !! in the past for such cases because it's shorter, I
> > can explicitly cast if you prefer that instead.
> 
> I agree with the "shorter" aspect. What I'm afraid of is that someone may,
> despite the comment, think the !! is a stray leftover from the bool_t
> days. I'd therefore prefer to keep the !! pattern for just the legacy
> uses, and see casts used in cases like the one here. However, if both you
> and Andrew think otherwise, so be it.

I'm fine with casting to boolean.

Thanks, Roger.

