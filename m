Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B6667588
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 15:22:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476194.738248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyTS-0000ru-WF; Thu, 12 Jan 2023 14:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476194.738248; Thu, 12 Jan 2023 14:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyTS-0000pE-Sm; Thu, 12 Jan 2023 14:22:34 +0000
Received: by outflank-mailman (input) for mailman id 476194;
 Thu, 12 Jan 2023 14:22:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0PO=5J=citrix.com=prvs=369126fba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFyTR-0000p6-Im
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 14:22:33 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b2b0e69-9284-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 15:22:30 +0100 (CET)
Received: from mail-sn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jan 2023 09:22:25 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5760.namprd03.prod.outlook.com (2603:10b6:a03:2d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 14:22:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 14:22:23 +0000
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
X-Inumbo-ID: 8b2b0e69-9284-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673533351;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+h3UbKkuU1lIVjdRVZZQkGmzfqawdmEoIuAEuNNsHCw=;
  b=c2K1VFzVI4+4HXXGsaQy+p3JtkLvmkfZQSfzLnWz01CmG1aL51hCdyLu
   SvNPGGQRE3tYBnB9Zj01aXqe2/8RGg038lx4LUeWe10wtn50c29qZMh6a
   9nggArlXkmBPFJ+s466nK1udy0rVpe2AOIN373PsYJYpgCK3Ugb5W3R6w
   0=;
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 92356031
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JWO30KLfGe5VUum/FE+RUJQlxSXFcZb7ZxGr2PjKsXjdYENS0GAOy
 WQWC2iHOq2IMWGnL9t3OYvg/U5Tvp/XyoBhHgVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wVkPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5UIE538
 eUVdAkcSSyhp+m0+vWLdspF05FLwMnDZOvzu1lG5BSBV7MdZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTSOpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eex3imBtpJTdVU8NY2g0CLm3ADNiQRalKfhKGWyUjudNlQf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmL+ITXOQ8J+EoDX0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vXqHRngz
 jbMqzIx750ZgNQXzay98RbCiii1u5nSZgcv40PcWWfNxh1+YImpdom582/R5PxLLJuaZlSZt
 X1CkM+bhN3iFrmInS2JBf4LRbeg4q7fNCWG2QIyWZ486z6q5nivO5hK5y1zL1toNcBCfiL1Z
 EjUukVa45o70GaWUJKbqrmZU6wCpZUM3/y4PhwIRrKiuqRMSTI=
IronPort-HdrOrdr: A9a23:DdH29KEoWAgCTQocpLqE0seALOsnbusQ8zAXPhZKOHtom6uj5q
 OTdZUgtSMc5wx7ZJhNo7q90cq7IE80l6Qb3WBLB8bHYOCOggLBEGgF1+bfKlbbdREWmNQw6U
 /OGZIObuEZoTJB/KTHCKjTKadE/OW6
X-IronPort-AV: E=Sophos;i="5.97,211,1669093200"; 
   d="scan'208";a="92356031"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTixSmmIGw9N/+iRhqPXbYL9s3wA/X/SLaqA3G5XkDyWz4FPR9lfCmWUlGp+L+eH/Trcc5pRfF/sAhtHvNYhN2iPxYZudq/0whopjALnJLUBUmcPVQy5GZ/7ONcU6GhKpbyXAdBKTUpse5YWSl0I7jhaPoeg/bHyBV+jDoO0bSz8GkpeS3lt4FnQwCM54gV7hXrg9F1bLbLuZXXhS2kau3j0Zc5rRYQZwCaUDXbuds35CJIap1C9usrASKBMf8kZVHZ9ho37rPsHxEodYNVQpO3EKKe1mNrY3Dl8KCQFIeKAD7Jbh4rSu6qUC8/2Nu37gu0nHtgVu7TOgELmvf42qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+h3UbKkuU1lIVjdRVZZQkGmzfqawdmEoIuAEuNNsHCw=;
 b=I7XdOH/8c1qMCOptpC0csoqO+qc8xt33lYtpTXAjdE3WbCi8M3apokpxL1X5wK4231L/Jz5okiw7r4d0L7nDRIgjGo1TdWKhsTggiP/upD/GbARMMl+L70/IZnW8ZOs5H45uJaR+eyKudYenX1Wb1mOIzDZR6kuq4R7GZF19X1YqVUCo1N2Bqk+LKbFP2Z7cEC6yDs/wUNogiMHMiETwxVk9BPJhEr44ZTeizGrXpwer5YHVui1DYos2sriLq/4BP38bLzh9wCLRCyOuNKqApL+ErbF0IHxje0Ns1PeuqdhduK6W+pBbmSHOcPktwiZ9CProu0TNqnmxELCiX9QRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h3UbKkuU1lIVjdRVZZQkGmzfqawdmEoIuAEuNNsHCw=;
 b=BoKReGflrZvCpgEjrLeFMfXvrT59fdbwGQchSdNLtGXzs6kJXlrtUgz5o5KPQeUhkqmmdtR6HSq4QwGElE68rOs9V7JxuLZ4zlWBjUS8XaRFmkog4le1UVJ1BF9crpssIwU9h0UUBrKb0RrLC//ATNSyzas6CHA3Lopa3HmUZn0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH] include/types: move stdlib.h-kind types to common header
Thread-Topic: [PATCH] include/types: move stdlib.h-kind types to common header
Thread-Index: AQHZJo5jBKk6QTlSGEGpBgNCxgedxK6a1XaA
Date: Thu, 12 Jan 2023 14:22:23 +0000
Message-ID: <b0119998-b196-8319-fee8-de3231b14d8e@citrix.com>
References: <5a0a9e2a-c116-21b5-8081-db75fe4178d7@suse.com>
In-Reply-To: <5a0a9e2a-c116-21b5-8081-db75fe4178d7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5760:EE_
x-ms-office365-filtering-correlation-id: 58739a7c-21cc-4ff1-ab8b-08daf4a86c72
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ctu0V/6/qXaVilpijfRzUcCWIbUOAylU2DrwGAHhjWUkzSJTpxHDiUcF9fVy8IGU3EtUgahTS7BSsd3dIxSjG/JiU7BrRNcKXhojUSk8X4o1IYtNE29N9LC/lvGF2N7xwfHoSLKLfFNDT3P8wlmpcCYisxHeUy2zcKj7Kxl8KPwZwv1nTqiMv7vNzuDy8dntftsp/Tt1/5iVoO6sTtW1jQ9hHiWbtMbBwuiY5dFC379S/neYcRBsZDlUhrNb9zWs+ga2tNqBaghW/qAtDKUqZwF/wywik+ShdVTTOGS1dYB9ZSoFochQFRMUYfMFgmRA9WBAuGJ8q6GWPkxUiM9YmvY88OxJlGFpfOci9XIZG6+0KpwFMRjlKCyhQ16zr6Pu0m1uSJp5NQfYdLmrEE7P8biPzxqWhJTQp8WvijsBekX5B/BDdLQfOvWOrF0ZOy/Hd6q7LwGH/fFN533ZBxO0Qk9IegETLrloEuR1DE+ybVwXt4BhbKxAmrMkRWDG5k/h0Y6hqcU4oO3yVEs7Ajk4eRNjbdv0XYOyIjE8K/XBcsPEHKipXQFUYxutH1ax9Q5k3G6tsRV5KkeVMnzYSGMuA7dC0Oli2M5uzLcn/w4OfUOaJhMY5i53AaRIFj5hecDdJ3wdtz8iD09vjX/NY4BlUdZ8/9LPaRwdEVcdk7jakeuwlfzgmW7hKfDWCWRQ7RbVXgRVYD4/Efy1KV7y5ArarJYMyB9gGHxysNgvswXmzoDO7BfFNNu1VcimPrA/lFBboJuzH0E2fbYMyA2695tODw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199015)(82960400001)(38070700005)(6486002)(478600001)(41300700001)(6512007)(38100700002)(31696002)(71200400001)(86362001)(316002)(54906003)(110136005)(2616005)(91956017)(66556008)(66946007)(26005)(186003)(66476007)(76116006)(4326008)(36756003)(5660300002)(53546011)(6506007)(2906002)(31686004)(66446008)(64756008)(8676002)(8936002)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTdIbjJGZDB4U0wzS2JMMzFaZUxUU1cxd3ZBNUpXUG9Yc3dkdXY5MnJDRnkx?=
 =?utf-8?B?dkJhaVVmUjk4NEYxUWFtcURBdmdGdU9hWmV2ZURWSmtJMTJ6SDE4blJrOW82?=
 =?utf-8?B?UGhoQmFDa2t3VkJEZGovNGhJenFMMTZKV2VPU1VFMkpqa3QyeHZuVHB3V2Nh?=
 =?utf-8?B?S3J3RC9TbHlVbi9TY2ZUam9DREF0UkFYekxPZytsYS9mRDNtTkJCVWNUUDk5?=
 =?utf-8?B?UXYvUStCOG5HRUZuMWxnbVJ3MEtQYit4TWtFdDF3a2tVM3ZnR3pLWkhBdnpR?=
 =?utf-8?B?YmZjR05wN0hOcHNGNzIrRWVOanlGcmlDRVNMeVRPRnc0dTBSb2JiRDEwZ1Js?=
 =?utf-8?B?NmxvSzRtNzZYK0MveVVDQlhRQ3hxdGZkVzNvYU5xeUIrUWZEN2ptT3k4cXBG?=
 =?utf-8?B?SWw4K0RieVFkMmpPWWpBMlNNQTRERmRWOFlXbHNhQnBCQXMxenpLMUwxalA2?=
 =?utf-8?B?VC82cHB6RDROSEJualpjZk5ncngrREhlaUFvTk1qQkxGQkwyRkI0RUowYklk?=
 =?utf-8?B?NUtsbTVwaTFxcEsySm5qd1pUMWZEREpTeFBTOVVaWmpBWGhWZUZ5YjZ4aWRi?=
 =?utf-8?B?Zm9ScUhML3JaOHdlN2pDTXZGYVc4d1VOV1ZiRWhGMFFQQmx1Vmh1VXpwYndp?=
 =?utf-8?B?SHdOVTFWL2UvR1hEOUt3MTJIYndwTktGMk5WSHA5K1lCRFpSemw0R1p4QWR1?=
 =?utf-8?B?TloxRUpiNGxUQlFOb2pGRUo4WFF5NUdZejJvL2pkV3kxZVlhTm5QUlVMbnN6?=
 =?utf-8?B?Q3FYWW9haTFSZ1M3QWljd0paNUhoWTlKQmJmR2RaZ3pXTkhFQXM2MjRjY1pV?=
 =?utf-8?B?M0hKZWVXcW41TkFSTDJPZXl5TERTMHVFam5sTXFrNHFOM3FUamZwN1ZmOFlY?=
 =?utf-8?B?SWRubUhYdTh0N1RCSW9wRUlPUTRoT01nZHplRW0rRjVnOEt0cGtVOFEwdU1j?=
 =?utf-8?B?eUFZTFJIKytyaW95dVFpQUlZeEpKL0hxTU1rVjFoeFQ2NmxET1AvK3dyVzZa?=
 =?utf-8?B?elpNcW1rZE9pTnBLNC96WnV5NVVHN2dibkczVS9wV0VRaVpMbGNFS2JDU0lt?=
 =?utf-8?B?SmlvVG1WWG1sbitOTkk2UWxaTlowNyt0YTVoMlBMWFJrbzRuc2x1dEtMVFVR?=
 =?utf-8?B?TUxsam9LbUMrbnFoQ0ZNaC9FRFNJV09rQzJNcWMzZWgrWUJ0RjBvTVdac0Y3?=
 =?utf-8?B?Zlc3RW9mS2srWWdxaTJnZzN4dGlCSVV0YUNnQVFQbFlpeEpjUUJJV0tSSUVX?=
 =?utf-8?B?SjA2VVo5QkdYRjVZenkyQkRIaUxZempJczdNU2grNkt4K1hUUElNZG56eTZX?=
 =?utf-8?B?bjVDS2hBbUdtL04yZnJPMkZ4VFBDREx0MG5IR3c2d3V3RDhMUFZRUFIyczlS?=
 =?utf-8?B?SVExWWxGVGFwS2JDKzlqZWFXWVc1YVJYMzBkN3RnaENzeFB0TVExTjl2UkZJ?=
 =?utf-8?B?RTZzdVR5dndQRzc2Wjhpa3l2bHM4c09Ybi8wdEZscHJJbkRKNEcwUExKREx3?=
 =?utf-8?B?Yk41ZnkxL2IvcFNtZ21pVWtEUDVOUjEyWWNFS2o1cmZaTndiYVRwSE9IdTdI?=
 =?utf-8?B?L0pQN1VDMXhXc1dVeFYzVDBTY2lNTUFRS0YzckhOWU5GVFNHMnFScnIzeHVn?=
 =?utf-8?B?a2J1T1lxdFlrS3hEWGlScndBYzcwZjNzMDV3Y0ZJSldGOEdRaWhna1NYck8x?=
 =?utf-8?B?b25pK1V3dldackhuaHFFWEcwbk1HTURzbmV0d2JrdUVHMFNGaDBqS3lzaHNN?=
 =?utf-8?B?R3dvMTJKL1hCSU4rYWhLR3gvYnlSODVKcUdoclNGaElRZFZ0Wi9mTWVIdE9L?=
 =?utf-8?B?N0RXM3lKZVdFN09jL3RFWEd6ODdaSkZ6UHY2elYrTTllSlB1dEdtVUtWRkQx?=
 =?utf-8?B?aFB0RktPNEVXeFFYc2JQZXBoZC9zdEF5VUphMzJhK1A2alBDUGVJdWNseHFq?=
 =?utf-8?B?U1ZGSHd6QjZ6OTdyT2t0WmdjRERlWXhydHFONjQ4UkJDQm01ekZma3EwVHd4?=
 =?utf-8?B?NTlIRis5VEhoQ1c4bUk3RDcwWGh2WmdJL2YwTjVpV2E3MldEbnc5czZMM2hB?=
 =?utf-8?B?N3IyWnl1VzJudjJCK3RjREg0UkNuVHJKUmhOS0hDNS9NbC8vK05FdndEQmk2?=
 =?utf-8?B?ZXFpOXBDQSs3ckxtV0oxdDB5WFNYYWR3NnF0SW51UzBJYTRFTjB2dFpEMzZE?=
 =?utf-8?B?bXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C2EF54913AB7A41AF27243F8AB6DF05@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+gsU0egwR7YqovXveab2slRlomu1J7/5SL/RkGnGvJIahdbTmMv2QWlZRHqJczbnZfABapPQnO/Y5L0HiodKcWAT9uYSntZu88eMhkSaOQ9oFWcLIbRDsw8HIm0+VMamdsw63S/XlpcPwFeYLuQnn4BH7LDy3PhMUOPrcf+jPRWQLEuFGbAp6+DBI6xB1ixxWCtmS+nkkKB07HtaL2Gae4DgiykbxflE0qkb8G2uvW/63Uv+yaGkNl+tE9kQySE1qDVlfuzNvSMHLAPNttpPEruNw7035Oj5xRXtuYmPhmLawlnebsVZF2JaKOfDQ+hMsAICga+nKgPOBPCtFpeQbW5DyYL9Hf4L2I0wKXVu7L6tWIy9rk7+p2NUBsIioTcSAqPCQoK8btBEJWB9Gge0JRm2fHw4kj9WIo/rNvftySUetWxHxmkwysVCXuOiTk6TtK4gAEWqeXCoDG0m+o55ORQW5IpEGR08k7YshqUQ36QJQ42nF+x34dP3jgTlTXqOexz6Yi0OcwR9dNUgCpc8d41K3fKIy2cAvObiPGVZMQsNo0AzVVXMWCzW24o3UEcbvsKYOAlP4RMEmPQYI6UY6kVa/WkcDaGxZGzyMzF5uukCpAMom1JmsxHskSqKcrbsd11+2FIkB06dqdfU+NUr0fSBXHa0O6B3iTwj93dznzvspicZYcXfpMqAvpiWWs/Am8W6dFv3cms6zEAttEGD8Q7uCxk2YzwBns2yDs6msUnn23cU2FVry+l4jwqhf12SRXU+MEc2MWVoZaLnZQcqCL2b8w9Jf7RoWkV7pNip1euwflNNTgo4ejJmqjtqLPD8BDHnMjSnbhUx08F+NoK696VtvLnv38Ui4WpN2bLXVFsmFjqvKsa9Jq2Qv4y44VQ6yyoyAPbLMx/7gTueiNK6Lw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58739a7c-21cc-4ff1-ab8b-08daf4a86c72
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 14:22:23.6858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XjTFtefQ3YrRXUNTJrAm6P2AIyc4VZsat4m4Z3z2BQRxbwyorCrk4RUlRGFMXhXL30Yhu4KPKWng1l613fOgRfnZc36sVC2QYO3MjXV3hKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5760

T24gMTIvMDEvMjAyMyAyOjAxIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gc2l6ZV90LCBzc2l6
ZV90LCBhbmQgcHRyZGlmZl90IGFyZSBhbGwgZXhwZWN0ZWQgdG8gYmUgdW5pZm9ybWx5IGRlZmlu
ZWQNCj4gb24gYW55IHBvcnRzIFhlbiBtaWdodCBnYWluLiBJbiBwYXJ0aWN1bGFyIEkgaG9wZSBu
ZXcgcG9ydHMgY2FuIHJlbHkgb24NCj4gX19TSVpFX1RZUEVfXyBhbmQgX19QVFJESUZGX1RZUEVf
XyBiZWluZyBtYWRlIGF2YWlsYWJsZSBieSB0aGUgY29tcGlsZXIuDQo+DQo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClRoYW5reW91IGZvciBzdGFydGlu
ZyB0aGlzLg0KDQo+IC0tLQ0KPiBUaGlzIGlzIGp1c3QgdG8gc3RhcnQgd2l0aCBzb21lIGhvcGVm
dWxseSB1bmNvbnRyb3ZlcnNpYWwgbG93IGhhbmdpbmcgZnJ1aXQuDQoNCkhvd2V2ZXIsIEknZCBh
ZHZvY2F0ZSBnb2luZyBvbmUgc3RlcCBmdXJ0aGVyIGFuZCBtYWtpbmcgcmVhbCBhDQp4ZW4vc3Rk
ZGVmLmggaGVhZGVyIHRvIG1hdGNoIG91ciBleGlzdGluZyBzdGRib290IGFuZCBzdGRhcmcsIG5v
dyB0aGF0DQp3ZSBoYXZlIGZ1bGx5IGRpdm9yY2VkIG91cnNlbHZlcyBmcm9tIHRoZSBjb21waWxl
ci1wcm92aWRlZCBmcmVlc3RhbmRpbmcNCmhlYWRlcnMuDQoNClRoaXMgd2F5LCB0aGUgdHlwZSBh
cmUgZGVjbGFyZWQgaW4gdGhlIHVzdWFsIHBsYWNlIGluIGEgQyBlbnZpcm9ubWVudC4NCg0KSSB3
YXMgdGhlbiBhbHNvIGdvaW5nIHRvIHVzZSB0aGlzIGFwcHJvYWNoIHRvIHN0YXJ0IGJyZWFraW5n
IHVwDQp4ZW4vbGliLmggd2hpY2ggaXMgYSBkdW1waW5nIGdyb3VuZCBvZiBmYXIgdG9vIG11Y2gg
c3R1ZmYuwqAgSW4NCnBhcnRpY3VsYXIsIHdoZW4gd2UgaGF2ZSBhIHN0ZGRlZi5oLCBJIHRoaW5r
IGl0IGlzIGVudGlyZWx5IHJlYXNvbmFibGUNCnRvIG1vdmUgdGhpbmdzIGxpa2UgQVJSQVlfU0la
RS9jb3VudF9hcmdzKCkvZXRjIGludG8gaXQsIGJlY2F1c2UgdGhleQ0KYXJlIGVudGlyZWx5IHN0
YW5kYXJkIGluIHRoZSBYZW4gY29kZWJhc2UuDQoNCn5BbmRyZXcNCg==

