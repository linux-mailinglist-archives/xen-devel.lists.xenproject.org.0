Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A65A2975
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 16:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393931.633146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRaMb-0007nX-T3; Fri, 26 Aug 2022 14:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393931.633146; Fri, 26 Aug 2022 14:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRaMb-0007kj-Q6; Fri, 26 Aug 2022 14:31:13 +0000
Received: by outflank-mailman (input) for mailman id 393931;
 Fri, 26 Aug 2022 14:31:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vie8=Y6=citrix.com=prvs=230ac0225=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oRaMa-0007kd-KG
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 14:31:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b65304b5-254b-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 16:31:04 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Aug 2022 10:30:54 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6168.namprd03.prod.outlook.com (2603:10b6:208:319::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 14:30:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 14:30:48 +0000
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
X-Inumbo-ID: b65304b5-254b-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661524265;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ptR4FedCuu5NV8CQRVy79FFuLP9AKf6nZyNMA1jqltY=;
  b=eOwUMkNOMTZk6MUS3mgNkwKEjd/802WB1o6DvSlZtyBx82eCnaf3vw+7
   +VtDfa3MU+2/O5aDUYXIYYwtXJVyATQ95dEv3xo3NAQVcxc17BA/OnHY3
   eGT28pBD+mrD0meRYZV1McQzvRK+VHFXaza80kFn9TAAf5Q5sCgtXklTX
   I=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 78786966
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QtnB2Kr0llOLXHJ2KGud9ahbP8VeBmL4ZBIvgKrLsJaIsI4StFCzt
 garIBnVMvbfNmXweo0kYYm+/U0H6peAyt81GgQ/rCxgEXkQoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6GlG5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUSwsxaKF1J6
 cc5KWsIcUrbqfqPnLaSH7wEasQLdKEHPas5k1Q5lXT8MqxjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/I4/NvvQA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE2b+QzX2qBtx6+LuQ18w6n1CumVEoCBA9VFSG8NyehWjkRIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS7QiXz6PO7gWxB24aTyVAYtgrqM83QzMx0
 laD2djuAFRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWr6Uei4sH2ru2+XjDgimwvd7ZQwgt/ALVU2m5qARja+aYi5eA7FHa6bNFM9yfR1zY5
 HwcwZHGsqYJEI2HkzGLTKMVBra16v2ZMTrax1lyA50m8Dfr8HmmFWxN3AxDyI5SGp5sUVfUj
 IX742u9OLc70KOWUJJK
IronPort-HdrOrdr: A9a23:UbqF26CvVW0LXSrlHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgLfIBej8AfeSIrCNXwH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7giwlGl/NLAgF4vsulKRRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.93,265,1654574400"; 
   d="scan'208";a="78786966"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtExuAwgGfUHpdSxkE0RLWRHhrytN1NXWDoh1jFAsDXNqFpX7fZpex6386l8b7JnLt5e0aKWuzzFlS/fhk7L4p2e7yNEGxvfBvf9bi2jlZyVmAun9HEeE+HKizFCTMLIvNnp3Hz96FRp998867F6TjTN5LcDMfopgUe6gTp3kTLI1QYQlh0GOWuSg/c1N+CXXFcFMATZ1FhIrA710GnoSfrVyfuJCYxUO3WwdeofRo+Qw7XMK/T0HB/HT86S9tEtMAWkFoYtoC+D1FB5vR+K8VV70SZ48R/n29hlKiKPrivB7IS6Z19iy8lsMBNSw+yZ+Yxo/lvjA5Da9mKlA/a9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptR4FedCuu5NV8CQRVy79FFuLP9AKf6nZyNMA1jqltY=;
 b=CUafkeq2Hn7aWkvFL0ysdanleOa5KmoH+bjIIPIVIwW045VQXTGNB+kXMAunWmTbz4QFDRmhI6rm63jytOCTODOppOp0ofTa57TCDz4EixUEn0IM5ZRv/e2kpXlZcEyoSMN72Z2odPn26eBDzdNsbZxbW2Zhieh4ObfgG9RIf35CetyGdkHIr0Vx9kibeDuXJztB6SQ2xrarGdDFKwAD9aILFNyqY/VEsuhLZ5yhPC45nE9wc8fR3pcmqLMXZJvqx0snydRLooZ9/P3KPHr66eh95eDSdktlVH2Roc4+h28HyCSKAVJsXXRHfpji/eqOXVPgrVM+rp2nESda3FsW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptR4FedCuu5NV8CQRVy79FFuLP9AKf6nZyNMA1jqltY=;
 b=jspOy4cynAj61MIhtMxO4czcJ3PhQ+grEE7D64S2vt8B4Zxb7GOxFNyPjoSBuCcoQShq8DBlPvBB0cMm58wZyo50Ek7/VSq1yVzYtQZ2yF9ah0mOIMyk6ilIECjkilsRrPy+hoHbiaCrIlDZyjF2voebTgWvU1Lou6vDE8BdZWM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 1/9] drivers/char: separate dbgp=xhci to dbc=xhci
 option
Thread-Topic: [PATCH v5 1/9] drivers/char: separate dbgp=xhci to dbc=xhci
 option
Thread-Index: AQHYtjuy5TV728PIfkyn34xYcrxlPK2/xsYAgAFPoICAACs6AIAAAsWA
Date: Fri, 26 Aug 2022 14:30:48 +0000
Message-ID: <f4fa6f4e-1cff-99eb-c826-5271d772af4d@citrix.com>
References:
 <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
 <edff5ba0d286a41b94a6b4bb332b63228f7faebe.1661181584.git-series.marmarek@invisiblethingslab.com>
 <b323ebc3-68fc-f6e1-b9ac-d508855a605b@suse.com> <YwiygukKUUqiAke9@mail-itl>
 <2fc50656-24bb-414f-4f39-3b23c4c3aa0f@suse.com>
In-Reply-To: <2fc50656-24bb-414f-4f39-3b23c4c3aa0f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 255d41b1-d4a7-499b-1628-08da876f91a3
x-ms-traffictypediagnostic: BL1PR03MB6168:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2zYloJR3ULa+iE9QUVC/cabNv3JE4zkqEG69hWlqZdwGpsCj7lE3EyeSiSw9XrhyykiByvc7viCU4jC+oPV1fBnN+/dSwbflaTsX/aoYBVmMLloXLOh9o5x6roA2rdHFJLAgORiH4c2z6NQaLkXYTpmNud8C0oZhuEOT/uxV4Q6CwjktWXj64Y0AddMwSGt76aD4U2pfRCbqmQY6bR5ZeoHGztKYIpDGy5hYQ5NUP8Z+QeWlWWFTKrxLKHhP38pKqOG6RSPar7tUG2BMkNz210mQmdY1Yzg6JVZvx8R4D0/y4ry1zdbsNtKpVx3dCZzzI/k9Ot3Mc7towOkFIkdQiO98KhB9tgvXhg0zMO+KwUgE4BdKWZ6X6K2yFZZku8grrWxok966fMlC9JXv4QvOhyMmWo3hPbc8jYgMkEflDNFsNnTQKVZon3zBgosuVLw83E0WvgWatYeoFsJTRx2s7HDWLcLKW8hiLw4FZhgPWxf6aTQYJoADlLzL9G9gL02En0ccb3OonZrJcbhSEKUJpt7a/9F9Er9kONOFwu4t7ealmJCVdWfVDhwNAYKk6nfc8sLqSd1gMSTxqiWBmbsHmC7qs+IPdqxyw/w1JqUxT8Q8S0xINv1y7JTZkChSukm9doswShRHORSl3IB4vEZoi0OYHpk2Grbl3xrDJYuwn9Zh2y4bUaOW9Wqh6kFE1UufwtNaZNLvgB2HHP8gljinJ4VFrMOpqmJJ4YP6c5nNh73wNWt98yWj6KdvYBnKfQrLJs+nOhhgt/jQ7tND7MT/zHmhUAtFYm7hwCxHloT1wNl+cZTE5lVshOcj2Nr7h0iXomYQOPCmj2DemuO65+oMlw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(2906002)(316002)(31686004)(76116006)(91956017)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(54906003)(4326008)(6506007)(110136005)(71200400001)(41300700001)(478600001)(53546011)(6512007)(6486002)(26005)(2616005)(122000001)(86362001)(38100700002)(31696002)(186003)(8936002)(5660300002)(36756003)(38070700005)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0pzZWlPNmJYWGhmK3pSNGRvVjR6WC9VZnBxNUR4amZZdEJ3SnlReldnUW1O?=
 =?utf-8?B?dWMzcjhOdjZLSUdON3Vhc3AyN3JYUEV2bGVrVDFtek9QWU9QMFJPVy93NHNF?=
 =?utf-8?B?QTJxVTNuZldBVFNIZG5GM1AyWDVzc3ZyZHNVUnlKYXlTWU14Rk82Q1djR3Zp?=
 =?utf-8?B?elVGNkZ3bHFMckdpYzBjVzZWbUorZ1drYzZ5RVVaemxvT0ltK3JERXFqamhJ?=
 =?utf-8?B?eWF4TGdoT1p1L1A0RXJzNXZvem1WbllTYXMwNG9oczRwK1o3SW9kallZVlBX?=
 =?utf-8?B?dURZRVFoT2UvTzhCWGdvMm1qeXFJc3pQOFVVbHBYcnpXcmxXRVljbGp2K0Nj?=
 =?utf-8?B?Q2xnUTA3NFdod3pTcTFIVEhDK25lNzljNTVUR3BTSkVhYnVySlBqbXVBSExO?=
 =?utf-8?B?N3VhYVlzODR2NE11MlhoeGZ6a2xSM1hwaVVUR3Jxa0ZUaW1JMFF6MkFieW02?=
 =?utf-8?B?N1J1Tm9ZOXUrUDNKYTBFaExKak5qSUZoSncvNndWbE5ZUi9ya0pLNmt2VTI1?=
 =?utf-8?B?M25Sb2Z1Y0hsTVczOVh2aUZBbFJXdzBLcGVxeU1GMlZyb1BFaHpSTWZFV01N?=
 =?utf-8?B?S1JkTC9Xa01BVlNYL3dMOUVsTlBhWHhMUjU0VFFJMTNYSDZFYktlY1NNcHRC?=
 =?utf-8?B?QzU4ZWljcTZhS0Q2cjNOcWdxa2g4TU5sOFlzR1c3K0ZscUVuSEs1a2xrSW1X?=
 =?utf-8?B?UFlLV2NqclhCSW45dzROcmpzVW9aUDQ5RUhmcGJMQmFtZWcwaTBQdnkrb3Fq?=
 =?utf-8?B?YXgxWHo1NzJBTjdMYXcwTW5KL0g0Q01SWkZhaGhxcGVaVGFRMWtRaTIybzdL?=
 =?utf-8?B?MVd6RERneTRsdWdrVDBDTXdyM2Y1QnNJbnE0QkZEQVRNM0tKS25aVkNFVnBF?=
 =?utf-8?B?YVFkQ3U1c0VyUnBadEZZUU9WcWQ3bWNZRUVWU0pwaksxb0UrRDRjYnovZ0xt?=
 =?utf-8?B?U1c0Q1hiMHVvT3Fvb3pybGFMZnFLd204UkVCOGlCam13K1BHVEVPV1JtdytU?=
 =?utf-8?B?Vy9zTklVMFYwR1MzZVRlOGZjQVFMc0dFMnNhUXZ2YlB2eE5jR1g5eTJYeEw2?=
 =?utf-8?B?Uk5GaE8zcm1SMkpsQ1MwOU5GVFNJems2eHpSQzliZkduakdtU3ZLL3loc3lT?=
 =?utf-8?B?Tkc5M1RmcUM2cUJaVDlSOE1YbGVoOGFRNnpXb1dKbHBweEQ1Y2M4TnVvRk5G?=
 =?utf-8?B?TEJCNjZINWhNMTFLbU1LdHBFNWljaGNBdGRJM083MkxGRi9scm5LcjZobGg1?=
 =?utf-8?B?cldaWlgwYlFIVk8zUVBQaGdRTGxmK3Y3M1k1OUFOS002VUZSdW4rNlFCYzFl?=
 =?utf-8?B?Y0FaWUQ0MU1RdHFMZUM4aUFlTHJyYXI5QTEwMEJ3MVJYc0EvUWcyc3JzK0FH?=
 =?utf-8?B?Qzl0UUdTRGpUWEJycCtBY3BlYTZldHd4OU1XRDI0SWpabkNnYnpLMFQrdi9s?=
 =?utf-8?B?aWgyUWp2RUN5SVBrM2RncnNiQTVITUhHQ0pwS2lhMitWYzlTNnFEdm1panY5?=
 =?utf-8?B?MktObVJtdnMzQnliMzBqQi9JbVdCZnBCbjlkQWV5NkRGU0xqcEM5dXU2Ym5P?=
 =?utf-8?B?TEFLT0JhRGxCeTFMd2dmVGw3U3JGN0V1VWZxYWU3cERHbytqeVhUak9IejhY?=
 =?utf-8?B?UWM5d09wbzkvaEd0bHlQcGZsZ2d6NU4rZ0dPbTJCcDNrTENmZURiMzVKbWRF?=
 =?utf-8?B?Mk9lR1BxcTJ6Q2p1L29WV25PWFpoME1DbjRaWlorRU9paTZBblRub2ZHZ3Zi?=
 =?utf-8?B?L1BRdGg3WFFldElVUCs5OHllUlJ4Nk9CUmszc3VHVUFtMThaZWFFQTk0c2xG?=
 =?utf-8?B?VUhhNFdnQWtEODYvc1NuMGVWNXo5ZmpxbkpPVDRQQmxhODNRMysrZXd1eVVF?=
 =?utf-8?B?dW0rVG1GcFEwZlR1Q0h3YmFSZWRYL0R4OStTdDQvSm95M3FHZzlKOVFlVzNv?=
 =?utf-8?B?TXVWVkc0dXc5VjZZdTVrTGlpOU9STnBmVTl5NEdnbGRwNHQ2alZuWkVCbDhv?=
 =?utf-8?B?L2Q1ckV1Qk5OeUVnM1dxeUhPWWY1QUc2akhXcEc1cWRML2FMd1JXK2ZRZkh0?=
 =?utf-8?B?ZWowWm5uOEdIZ2dMRmc2VU9QOHN2VXY5cGFCcUQxbUZCUVJlRk9XOVNqOHY5?=
 =?utf-8?Q?BvNp/D4sMiTWKUE7HErlCR1gB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFBE486622854D4AA2CAD6E55D8C3E25@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 255d41b1-d4a7-499b-1628-08da876f91a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 14:30:48.0694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P4chjAYAcxyeLtApZB7ebzmpz+d9dR3aSMobAVYf/am/gKI1gF1nOrQ3EacPsoAyrHLVn0udyz5iU95OkLyEbQP26BFQ9OAw5Q3582sQHWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6168

T24gMjYvMDgvMjAyMiAxNToyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI2LjA4LjIwMjIg
MTM6NDYsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+IE9uIFRodSwgQXVn
IDI1LCAyMDIyIGF0IDA1OjQ0OjU0UE0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9u
IDIyLjA4LjIwMjIgMTc6MjcsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+
Pj4gVGhpcyBhbGxvd3MgY29uZmlndXJpbmcgRUhDSSBhbmQgWEhDSSBjb25zb2xlcyBzZXBhcmF0
ZWx5LA0KPj4+PiBzaW11bHRhbmVvdXNseS4NCj4+Pj4NCj4+Pj4gU3VnZ2VzdGVkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4gQnV0IHdhcyBJIG1heWJlIGNvbmZ1c2Vk
LCBhbmQgbXVjaCBsZXNzIG9mIGEgY2hhbmdlIHdvdWxkIHN1ZmZpY2U/IEFmdGVyDQo+Pj4gYWxs
IC4uLg0KPj4+DQo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIveGhjaS1kYmMuYw0KPj4+PiAr
KysgYi94ZW4vZHJpdmVycy9jaGFyL3hoY2ktZGJjLmMNCj4+Pj4gQEAgLTEwNTgsOSArMTA1OCw5
IEBAIHN0YXRpYyBzdHJ1Y3QgeGhjaV9kYmNfY3R4IGN0eCBfX2FsaWduZWQoMTYpOw0KPj4+PiAg
c3RhdGljIHVpbnQ4X3Qgb3V0X3dya19idWZbREJDX1dPUktfUklOR19DQVBdOw0KPj4+PiAgc3Rh
dGljIHN0cnVjdCB4aGNpX3N0cmluZ19kZXNjcmlwdG9yIHN0cl9idWZbREJDX1NUUklOR1NfQ09V
TlRdOw0KPj4+PiAgDQo+Pj4+IC1zdGF0aWMgY2hhciBfX2luaXRkYXRhIG9wdF9kYmdwWzMwXTsN
Cj4+Pj4gK3N0YXRpYyBjaGFyIF9faW5pdGRhdGEgb3B0X2RiY1szMF07DQo+Pj4+ICANCj4+Pj4g
LXN0cmluZ19wYXJhbSgiZGJncCIsIG9wdF9kYmdwKTsNCj4+Pj4gK3N0cmluZ19wYXJhbSgiZGJj
Iiwgb3B0X2RiYyk7DQo+Pj4+ICANCj4+Pj4gIHZvaWQgX19pbml0IHhoY2lfZGJjX3VhcnRfaW5p
dCh2b2lkKQ0KPj4+PiAgew0KPj4+PiBAQCAtMTA2OCwyNSArMTA2OCwyNSBAQCB2b2lkIF9faW5p
dCB4aGNpX2RiY191YXJ0X2luaXQodm9pZCkNCj4+Pj4gICAgICBzdHJ1Y3QgZGJjICpkYmMgPSAm
dWFydC0+ZGJjOw0KPj4+PiAgICAgIGNvbnN0IGNoYXIgKmU7DQo+Pj4+ICANCj4+Pj4gLSAgICBp
ZiAoIHN0cm5jbXAob3B0X2RiZ3AsICJ4aGNpIiwgNCkgKQ0KPj4+PiArICAgIGlmICggc3RybmNt
cChvcHRfZGJjLCAieGhjaSIsIDQpICkNCj4+Pj4gICAgICAgICAgcmV0dXJuOw0KPj4+IC4uLiB0
aGlzIGFscmVhZHkgYXZvaWRzIG1peGluZyB1cCB3aG8ncyBnb2luZyB0byBwYXJzZSB3aGF0LiBT
byByaWdodA0KPj4+IG5vdyBJIHRoaW5rIHRoYXQgLi4uDQo+Pj4NCj4+Pj4gQEAgLTExMDIsNyAr
MTEwMiw3IEBAIHZvaWQgX19pbml0IHhoY2lfZGJjX3VhcnRfaW5pdCh2b2lkKQ0KPj4+PiAgICAg
IGRiYy0+ZGJjX3N0ciA9IHN0cl9idWY7DQo+Pj4+ICANCj4+Pj4gICAgICBpZiAoIGRiY19vcGVu
KGRiYykgKQ0KPj4+PiAtICAgICAgICBzZXJpYWxfcmVnaXN0ZXJfdWFydChTRVJITkRfREJHUCwg
JmRiY191YXJ0X2RyaXZlciwgJmRiY191YXJ0KTsNCj4+Pj4gKyAgICAgICAgc2VyaWFsX3JlZ2lz
dGVyX3VhcnQoU0VSSE5EX0RCQywgJmRiY191YXJ0X2RyaXZlciwgJmRiY191YXJ0KTsNCj4+Pj4g
IH0NCj4+PiAuLi4gdGhpcyBhbmQgb3RoZXIgU0VSSE5EXyogcmVsYXRlZCBjaGFuZ2VzIGFyZSBl
bm91Z2gsIGFuZCB0aGVyZSdzIG5vDQo+Pj4gbmVlZCBmb3IgYSBzZXBhcmF0ZSAiZGJjPSIgb3B0
aW9uLg0KPj4gQnV0IHRoZW4geW91IHdvdWxkbid0IGJlIGFibGUgdG8gY29uZmlndXJlICJkYmdw
PWVoY2kgZGJncD14aGNpIiBhcw0KPj4gb25lIHdvdWxkIG92ZXJyaWRlIHRoZSBvdGhlciwgbm8/
DQo+IE5vdCBhcyBsb25nIGFzIGJvdGggdXNlIHN0cmluZ19wYXJhbSgpLCB0cnVlLiBUaGV5J2Qg
bmVlZCB0byBib3RoIGJlY29tZQ0KPiBjdXN0b21fcGFyYW0oKSwgZG9pbmcgYXQgbGVhc3Qgc29t
ZSBiYXNpYyBwYXJzaW5nIHJpZ2h0IGF3YXkuDQoNCkkndmUgbG9va2VkIHRocm91Z2ggb3VyIHN0
cmluZyBwYXJhbXMsIGFuZCBub25lIG9mIHRoZW0gbG9vayBsaWtlIHRoZXkNCnNob3VsZCBiZSBz
dHJpbmcgcGFyYW1zLg0KDQpJIGhhdmUgaGFsZiBhIG1pbmQgdG8gdHJhbnNmb3JtIHRoZW0gYWxs
LCBvbmUgYXQgYSB0aW1lLCBhbmQgcmVtb3ZlDQpzdHJpbmdfcGFyYW0oKSB0byBwcmV2ZW50IHBy
b2JsZW1zIGxpa2UgdGhpcyBpbiB0aGUgZnV0dXJlLg0KDQp+QW5kcmV3DQo=

