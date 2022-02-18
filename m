Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68934BBA25
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 14:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275419.471279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3Ot-0004yS-7S; Fri, 18 Feb 2022 13:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275419.471279; Fri, 18 Feb 2022 13:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3Ot-0004wS-2q; Fri, 18 Feb 2022 13:34:19 +0000
Received: by outflank-mailman (input) for mailman id 275419;
 Fri, 18 Feb 2022 13:34:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z2s=TB=citrix.com=prvs=041b9fbab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nL3Os-0004wM-5m
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 13:34:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7734bf98-90bf-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 14:34:16 +0100 (CET)
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
X-Inumbo-ID: 7734bf98-90bf-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645191256;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=j5nv94RfPou9hdDxbDa1pE72QPialCW4xUJnRAqg0yE=;
  b=DN9a0SoIR+QLjJB7+YBFAKAQ6qPBy203Jk8b40Hd4yCVTktPQoh7wZ1W
   Ya2ow/fu1CNkl7mGRu6RJJ7HbAiV8v3SqmRcwUPrdzUTCfqHICD7cnVnJ
   2HxNVpESwWMsSJKTW1bCFNc/bt8MY24y/th3ChAMgaICPw/2/2oREOlEF
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66760967
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2o/wDKMEvcvrzOrvrR23l8FynXyQoLVcMsEvi/4bfWQNrUpxhDIGm
 zMdWDyEP/iOazb0e9p3boiypx5VupaDn4QyGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj294w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 9tgr4CaSRUQY4bUg8s+fERaESxxIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQ6mAP
 5tHNlKDajzDegJIEUgYVKs9v+n1mn7PQWRApGiK8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc91ePvcmwgGf8/f/+x22JUdZTDxMZ8Nz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO93ABbvzt68owGOlor+p5
 Slsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ieR4zbp5VJWGwO
 ic/XD+9ArcKbRNGioctPuqM5zkCl/C8RbwJqNiPBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WkPHGMqNZLdQpiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSevxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:qPaS36iYctj2n/cE+Qu6eCfPW3BQX3513DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwRZVpQRvnhPtICRF4B8btYOCUghrVEGgE1/qi/9SAIVywygc578
 ldmsdFeaTN5DRB/KXHCUyDYqwdKbq8geCVbIXlvg9QpGhRAskKhWYYNu/YKDwMeOAvP+tiKH
 P23Lsim9PUQwVwUi3NPAhjYwGsnayoqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+aemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aOSARcR4Z
 zxSiUbToNOAkDqDyeISNzWqlDdOQMVmjvfIJmj8CPeSILCNWkH4oF69P1km1PimjQdVZdHof
 92Niuixupq5VmrplWN2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZLIMvW0vFuLA
 BVNrCW2B+WSyLvU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegJ28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1E8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/surqSReoeMMoYDHRfzOmzGovHQ1Mn3WPerKM
 pbEKgmdsPeEQ==
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="66760967"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bou7of9rfu1etP6sC1VEyStjhJQhj6HTp1NlTKyf6SsGL6eMWah52Co+K3uBVZhyEjh8tvMW7adMrRx7wINNDgv0uD5vBhjr+m5jhEYpUa91N9/eB2Jks6DHQO3IvVd32b8x9nufH2/079PLWqe2RS2E++UIvj6EBrZb73+vLFcXrVnMQAHOlBSmEwXaaHxEyibptZbcKPEJgNkiuXwk+QDwbQ4/USMhRA66rBvJpLiQPy8LxklHqXuPeqnqydB/POHRPvi4q6AD++bcFg5Ifc8moqOgsMQeRLFx6woVDU4sl14Erp5JQdv7YX5e8xGTRT2UTv0DpyaWY1Xosm4RWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5nv94RfPou9hdDxbDa1pE72QPialCW4xUJnRAqg0yE=;
 b=DsuorAUTo7kT8SBA7p96EktLKlqwg2lJovMFdKogfDtdoEHbA+Eop///9Ri1arbKAlx75B4PK5N5J+S4CRhVzQa3rbY8bFXxYoiHR+AXb08VFvV+0oSbVbj9G8cbCQ/wi+ngqIm1iccyBPpztYsJnCaWWqNoUp5F356Q0KfNC68u6cZZDGoasvZuf7yTb2p3W9Unhlb//oygHjZDDI/tMTc6Ix+pMunuc/jlEHsBEy/XQfa3Oyyjj/UHz4uokpiWoDanQivf+u6NZcdJ10I9dcAib6W+Nx/cPbNFu0iBedRsNKpqRJHhwGI6XSUrJ1a3Ph0BO7UZ1xoDyY66O7o21g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5nv94RfPou9hdDxbDa1pE72QPialCW4xUJnRAqg0yE=;
 b=hD91ESbIqfqwu6NxrMgLtIVdoErJ1BEbIOLtGNTDaeYK8FQ4X2SepMPCjndfiC/TNA5wsxdAnzHR58lJD63FqC3fE86EQ8tsYwGKduh7G7LdBVEEyIJnBdSDC2IJoYXVhxSFzKOltzTiUJAingxS40d885DuDjTv6TlNZprnf0k=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v2 08/12] x86: move .text.kexec
Thread-Topic: [PATCH v2 08/12] x86: move .text.kexec
Thread-Index: AQHXUvSjTUOKHmUOM0uSyn1XCQornKya8oIA
Date: Fri, 18 Feb 2022 13:34:11 +0000
Message-ID: <80777b20-fbf5-0671-cfbf-413c9a483612@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <f964e5bb-6b84-40d6-d247-7655ef09d47b@suse.com>
In-Reply-To: <f964e5bb-6b84-40d6-d247-7655ef09d47b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f28682a9-d701-438c-1274-08d9f2e358ee
x-ms-traffictypediagnostic: SN4PR03MB6719:EE_
x-microsoft-antispam-prvs: <SN4PR03MB6719F8AB7E96519641FDD44ABA379@SN4PR03MB6719.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: izg2rgUbYb5X7dc2G1HShsCcYAuGZ9IE1cUaS5zTBmi0h53ilCHeLRhRVnzZvW5wSKtE2UXqauG5aAzLaaji/+IEsivatFLDKl0HZ1S3wYYulIimxk9Sdmr267QLPF9uNjkHs9A9OFYn8L6xaA3RZk4ibgZmMk5WPXx13lqDQneUTJtHi7vSHdfqbk+DSbCJXF55Cl59N19URiJ8SLiIpRZVw1Mq/NOPLC3FX6QLB3qFRYarBzWkI4OmEKaXmJ9vtldUzKYoJArGd0eBHRjc83KR5B+4ZgZeasALDsYMzJgQAbgVRia9RJ+7b5jypt4D00QM6WW5uxF+pPa/Aw3JDAzwTHhkuu1sHVxbbvAtLvl9TwpFsYAAqv0Ek4M7VswcoBm1y4ETlKtAzFSd8UCSnDtQ7J/J9bTiQSNgD+VTG0K5tTiVA9kdOsfu2jiJZsKUA6sMyQ1So6ob8ubCWUPIPYdwwZ01JaHOKiubbL5dd5Ra+VM6KpF7i+raVYzsAYp+y5xBbP7MBwPa9zq5/qXuJSVueRhtdj+2GQDDis2kbzlH6pa9aZuO/9/MhJCbEQL9mGJ10yeWpGWRCUKF2+4uzbzr5bX23pkz8DVVpWZxUrY8kaUOw3+S3o+zI7ethD1sCHxyPz05z83p9C4T9nFvGvV3RVP7trAF7+0b8eFEc1qROsFAQ4AuK9ViZe+znLNvqsmKVprF7LMTaXJrNBXSNEiUo4VOlEdX07qu20jYlaucQQdjVNG+KMn4vFHl13gA/3TDXzWehatJTHkFXQopUEfWQYkXWdMcuwZDbLu09As=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(508600001)(4744005)(2906002)(107886003)(110136005)(6486002)(5660300002)(66946007)(26005)(8936002)(186003)(76116006)(31686004)(36756003)(4326008)(66476007)(66556008)(91956017)(66446008)(86362001)(64756008)(8676002)(2616005)(316002)(82960400001)(122000001)(38100700002)(83380400001)(53546011)(54906003)(6506007)(6512007)(38070700005)(31696002)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MG5TNTlXdVpiNHhHdU9Jb3M0aHFyVHhUcVNRdTl0K0s1ampFS0dQMUd3ZEIy?=
 =?utf-8?B?UkVlQVZkdzdkVVdRalJYM1I4SGNqR3RBTmdVbXJWMzRIWWxnZUIrOC8xWjVI?=
 =?utf-8?B?NjZkNSt6UUFsajFXd2Nzdm4wdjlGWnhuUkxTNitGNEhmNE9mT2pLUFQ2MXZo?=
 =?utf-8?B?MUM4U0FINy9SZVFYT0xXOXRxUlBSaHlLLzdTNjdLOW83YnRHWVRJN1NVdTh5?=
 =?utf-8?B?RWNBOGQ4Zk0xTGM0YWpVaUdhUWYrR0hTQ0VGRnYwZWdtaUVDeVhBbXRuNDlP?=
 =?utf-8?B?WUZmSHpmcjY0c2ZnTUdkdzBxemJoVXpJT0lDbDNqZGZtR3BCTDJjRExrUDNj?=
 =?utf-8?B?RkVobUtVTUFLRUZKczBXSXVBSkFaY0pna0ZKcDVBdEhkVDJnZU1EQWF1TGk2?=
 =?utf-8?B?bGMyc3NQa1VVVThTbTFRS3FjVzUvdFFaUE1DUkFHbm9JQWJ2clJUb3dubnNN?=
 =?utf-8?B?dUs5cXd0MzJKZnRMOUllNi9KVVF3SEJvTlZxbjB4WXRSTUt2enFTWU1ORHM0?=
 =?utf-8?B?VFFLaUVtVWxUSjFPK3ZpY3hWcUpkL05SdlBPellscDNNK2hNMjBNV0hWQUg2?=
 =?utf-8?B?c1RwWGtjYlJjL0kxT2l1S2M5bUlQR1Azd0FwamQyblM5ZklvakdINzRvMGsr?=
 =?utf-8?B?UXZwWjFLa3RRWFZhY2lpeDdmcnc0WnVaQTNBOStneWdMK3J2eE5Ua0Q0cThZ?=
 =?utf-8?B?VmNhaGVFd1hJNVRDU3V5Mk44bzJSNG5ScjZiTlBoejlSY3ZXU0xoTlFhdEtI?=
 =?utf-8?B?ZjZmeExBeFd0akFuZ0NOaHBhSHV3cEVMYlRXTlcyanJDTU53dlB0Ylh3b1Rl?=
 =?utf-8?B?akp1b1d0eG5MdTVkWmxqb0xSZi9IUEZmMDZEYUZxUEh0ZzhuVFNyV3JpSzZL?=
 =?utf-8?B?NmJrUDhPUWhHVjlWQkFJMTNhRzY0K1NoVWM4OWRXcGovVlFEaDV1VDhvK0dW?=
 =?utf-8?B?dFZFYjVoejNCb0FJUEJWWmduS0JGM0pNY05wWGIwbStxNDA5SEpOVVowTlJ3?=
 =?utf-8?B?bE9EbXhsL0FxcUxscSt3MUh5YUkvNXFPV3B2M1hJUHpnVkVpSDcyRVRUWWVk?=
 =?utf-8?B?dnhPMkV2eW51b3pJa1B3Y3ZLWUFDdEF2SHl1KzRLUXR0M0c1SXl2bXZGZC9W?=
 =?utf-8?B?d0ZYMkc5R0tYUk1CbVcwYWdpQ05veEwzNXJqb0RuRjlTTGRpTEV4Nng4WU1W?=
 =?utf-8?B?VUFZVE9RZGsveDcvT0h1dmtRUWlkRHR0SUt4VklnUDRQZEdYMmxrWXRhWE5Z?=
 =?utf-8?B?WEhzQ082OWxEL0hhL3dVazQ3RFVjbHFUenBmUTFSM0pKM1VUdkdzVGora21W?=
 =?utf-8?B?RjlCaTJoc2tBNzRsZ1Jtanl2Q0VXaHh1VGxPRDZYSlZxd1p6b001VGwrVytv?=
 =?utf-8?B?SjVGTURXTUZjTTJma2lxdGhvZG1HWmpCVXYzb1dlSVZqN0NhYjFHalc0M0ll?=
 =?utf-8?B?UTAvMVhydktoTWZJakJmbmhQMmswMHc5TTl1T016Q3FORytuQzVGalE4MGh5?=
 =?utf-8?B?VTAzRWF4UjlqcTJDSG1kVFRuUE9BNStpM2NkMmhsNFFpb3FZa2RWclFLSmJr?=
 =?utf-8?B?Tm03WFRBYWRPajVTWExKVk0yUTh0T2dUNk5pMnhES1Y3azI1b0lPSVNuRXNi?=
 =?utf-8?B?UlV2RFQ3Ky9xZVRSWHRJeHJKWWYzTlliRmVRY2lyVmowZUNqNEFKY3V5OVhH?=
 =?utf-8?B?RVJJVURhMVNUOWxzc3RMNWg1bGRvdk5LSmpTelB2ak1xeXZlZUQxM2FYMmtW?=
 =?utf-8?B?NmxMQTJXeHBIYUpIaGcwa0ltaDEwSFF3ZlVBVUlBcXNTS1g1Z25pbkUyU25P?=
 =?utf-8?B?NjBmWDQzUUM3dlZnTEpSTlE5b0cvK0t5NmxjZnh5MWNKSXF5RTZPMXp4OUFE?=
 =?utf-8?B?c3RlaUJPMVh0dml0dHlCRXArdHJOUUpSTEpoSlBRYkRqK3g0c2lOdFlMdXRV?=
 =?utf-8?B?TkZONDFhUFV0QWNTenltcFlnWVdONE1Xb1hmcUNwYUNwQWZBYStPSWo2RGxD?=
 =?utf-8?B?NSsyOE1SVnpPYTJjSmVpMXNXOUg0OGV0ZWhKTlR0cmF4QXBBNkhmZU1CalVP?=
 =?utf-8?B?NUtpL0NZWWJObUxqcElZS1FaZ05TQysvcjlVOFllY0tQMTNYVTVPQnJubVF0?=
 =?utf-8?B?Y0hrS0pIdjFJV0w3bUQwRnZtdWpFOVRKQTVSajBIczkxeVNhV2RsZkcyLy9n?=
 =?utf-8?B?dzZJU2tEQWtzcndTTWc1bVo5NlAzTHZzUE55RTR2VmcwTndKZzFndEVqWGtn?=
 =?utf-8?B?Z3BwNnJkZU9Ma01oaDl1aUJaZ0p3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF063840B9E40649A3314C8D34AB5337@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28682a9-d701-438c-1274-08d9f2e358ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 13:34:11.1724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7iG2G8ChYnHBuo5F34i173HEo+IYi+6UTCS1Ia1HsQjmol70xHluY0Xy7qQ9mr47X7THcNigyvgY73iPJFyzBfaknBEGlHg70u6ACDtlISs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6719
X-OriginatorOrg: citrix.com

T24gMjcvMDUvMjAyMSAxMzozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZSBzb3VyY2UgZmls
ZSByZXF1ZXN0cyBwYWdlIGFsaWdubWVudCAtIGF2b2lkIGEgcGFkZGluZyBob2xlIGJ5DQo+IHBs
YWNpbmcgaXQgcmlnaHQgYWZ0ZXIgLnRleHQuZW50cnkuIE9uIGF2ZXJhZ2UgdGhpcyB5aWVsZHMg
YSAudGV4dCBzaXplDQo+IHJlZHVjdGlvbiBvZiAyay4NCj4NCj4gUmVxdWVzdGVkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpJJ2xsIHJlYmFzZSBteSBrZXhlYyBt
ZXRhZGF0YSBwYXRjaCBvdmVyIHRoaXMuDQoNCn5BbmRyZXcNCg==

