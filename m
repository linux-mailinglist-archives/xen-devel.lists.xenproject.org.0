Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74FA57CB9E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 15:15:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372745.604670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEW0x-0008TH-Uj; Thu, 21 Jul 2022 13:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372745.604670; Thu, 21 Jul 2022 13:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEW0x-0008Qv-S1; Thu, 21 Jul 2022 13:14:51 +0000
Received: by outflank-mailman (input) for mailman id 372745;
 Thu, 21 Jul 2022 13:14:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CZbT=X2=citrix.com=prvs=1940a87fc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oEW0w-0008Qp-J8
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 13:14:50 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17e2aab4-08f7-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 15:14:48 +0200 (CEST)
Received: from mail-dm3nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2022 09:14:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5643.namprd03.prod.outlook.com (2603:10b6:806:bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 13:14:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 13:14:41 +0000
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
X-Inumbo-ID: 17e2aab4-08f7-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658409288;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uaLlxGElwCUILzeJNH5B/gg0vok9yn+3/ew19wtHBQg=;
  b=Vj8vllWC4D+XB+ZY28CgT6rcGnrJcP56ae0kpR44+YtMrygqzLmRkUer
   AMDsDy6z0Qi9dJCZTqtNVs48j48nDz4JeGGlKqQadH/x5TtmS6PDJrTYF
   e1JIW5LBg8Z3/rg/1AmBsEzn2x03ubA19ojYqexPsJhmIB3HHYf4Nukf1
   I=;
X-IronPort-RemoteIP: 104.47.56.43
X-IronPort-MID: 76128603
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LLrWyq0gCoyJl3LwSPbD5eVwkn2cJEfYwER7XKvMYLTBsI5bpzcPy
 2NKXGyOO/vbYTfweNtyaIjk/BsHuZbcytNlSgBlpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQXNNwJcaDpOsfrc8ko35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6+xkVlwYBoMCwb1+J3BE/
 8M8EQoKdx/W0opawJrjIgVtruIKCZGxea864TRnxzyfCus6S5feRamM/cVfwDo7msFJG7DZe
 tYdbj1sKh/HZnWjOH9OUM54wLju2ye5L2YwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPBkGDVrCr37gPJtXPxR91POYHkzNdJoVmcwzURBTE8FlTu9JFVjWb7AbqzM
 Xc86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLL5y6JC25CSSROAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+fpCm+PiU9JmYYaSgJCwAC5rHeTJobixvOSpNvFfWzh9itQzXom
 WjW9245mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 hDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:63KNWKAtoH791l/lHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
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
X-IronPort-AV: E=Sophos;i="5.92,289,1650945600"; 
   d="scan'208";a="76128603"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0bEvnLhBge4w6MmDcQck2QJ1KxBU7SSpFH1HavFwgYXBt0UUL8tnqJHXmcrOcBOyKG6x4G6/k+dKAH+JFUv2h2MR5xSm7c1RmtdRJ+x+bcQoQwYqc9o9fgydpoBuwdmDIbFRBlqVMalLPI3X6aO5CEpV416L5+v16ktmyqXuRynFGK0vGD4pMJfTIcKGEgE1j1waRwRXgZ7jnnsDL8+d52zT3g1FQWCI16/mHvC5mf0esvNXLlc1gfLZiXM973ntfJTef0Cxptr6Y7hVYKtajsMm7HlQDl0OHdBt4C5kF8Ia1q4KvUnjbvT77QlW8HRIjg90KJpgIWnc6S9xiQN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaLlxGElwCUILzeJNH5B/gg0vok9yn+3/ew19wtHBQg=;
 b=IB1/3Ii8iwwxWLYzVuELcojNNGDQrRstqb7hpPj9BG/Bd3LRuKkaGStf0V4G5xb1JNFxHArJlb0wnejfTKuF2Swh/beP+RHwT80OOCOJTDLUKSMWsndG1upvV/97jV1iOrX21kNn46bwXd89ld6ZDDyPZmDftZvBLq5aQkOC/QbFRjvqwLaHRpf3DgI4zMwTpwKacb9He+P4fqf92JL/MTY25NHwCwDgP03ZfNvk5+dNw90wzRvhYSQQKtgYPnHSCB0tGGdYnEtv8OLzIevVbIE4yvyAUxQm2lCL3fo1U7QXdJa7WrjOE53cPr+c1ZF0JE5pUso3q1YH3TBeoq8HVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaLlxGElwCUILzeJNH5B/gg0vok9yn+3/ew19wtHBQg=;
 b=XX0RntGxYcZYMdfP0Sp8+CZvyewyXymTzqv0fcdtx/xowszmsR2VF2eGmm2B57qFtLprO4o95iSOn1RDzjEZFhtZLcpRSJjLDvcJqq5qLrJg9jgM3TpS3tFSNu54JnVCa1T8PaDg1c/cozgbndUYyP8vJ+X6kOtiCTI8zZTTG0c=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"wl@xen.org" <wl@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 0/4] Some improvement for gitlab CI jobs
Thread-Topic: [XEN PATCH v2 0/4] Some improvement for gitlab CI jobs
Thread-Index: AQHYnP/ekdkOx/Oyl0y0AyUNUkwaXa2IypmAgAABlACAAAF/gA==
Date: Thu, 21 Jul 2022 13:14:41 +0000
Message-ID: <2bba32aa-6ff5-f1f2-87c6-682c65dcf84e@citrix.com>
References: <20220721124602.9910-1-anthony.perard@citrix.com>
 <b7aaa9c3-bd06-4d76-36f5-381333247697@citrix.com>
 <YtlQABtrS1yk1AZY@perard.uk.xensource.com>
In-Reply-To: <YtlQABtrS1yk1AZY@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37497402-7d29-46d0-972c-08da6b1af8f6
x-ms-traffictypediagnostic: SA0PR03MB5643:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qd+GocMMLVmLytCHwIzNXVvOdSmWK8W2UInUnyLdHDI4ZRVuoMOAIqH5b4xJRUfYDO7CzFHHaSJT0r4FBi4JMazV69X3zETQMgFUNIfNnRID+S1/BIxuOsNkofmwfBZCoFduAHS+MQB64p+J74+scnWx8XaE60GUKfMrkUbSpNptyeO3Z5MN9WhU754kVRpR71teggfYNHIsrmsFuZU+QMLDJpiwIZQqfgPqWWKt8/ye5FHCpHaLyqygFyOKd6gkJpy7QMBZTOJLSVazc99WpI6FfetuA++ZMtVWy1kF8aDcxMWJbCRw2z6nnK3s8H9d77ptpcnavIvX2KrTkmaPvuWXdL61u8OhHN5PIq/lcFyLtWYW+QDFwKZuKWTGS7YvpH/EU4dHmZ6lfvlGlBSDD1xdwGL4XoMS0RM6st1BYd4WYREOgdm+igCcW3UJCtefinqQkkKuTSsov5SNYNdIWqJfo2Y0edHfv68J6x1pxilEidRLTS6pBUlX486myq4RSSCDxBO30dDlqI8gp3HDw0pQPrWZLR+NXIDAL4WK/exENhr7Bj4H23CuAjT4dsntxt+8+GXrKOJs9kFWo0jDrgDSncxduCDT02Nvij9evwMLqEzoKQxE2UpBZCYkdaLl3JX5mZfI10NE5M8hxDiq3P30ziLf/jgyB5l48J+a38QRcReK0+JhvYQ451hmIY18xH0UoJzIyHb3FtiIJfOM0MEFIRaLZ2JgSDQaVxJkeiHXdqS72SgD3kFbimCLZph/EV6tVR4+EGHturY6j1beGxQiH7uLyGMYgNHnEeeBw8B+oiBZktVVnvi+mSGBsptpbURUvRhoeIfuiUiffl04FErU3eOcoPzqRcJo/cZyZbI8oePcGsIMmux7Gj1B1nqbEqNy4r3S8w4g/lVocx9EX0AB/hAbYr0Xe0EiTADX9hDtWeCAKI7RSTLmPzDLTekP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(66946007)(54906003)(966005)(478600001)(76116006)(37006003)(6636002)(8676002)(6486002)(41300700001)(122000001)(316002)(8936002)(71200400001)(66556008)(36756003)(66446008)(66476007)(5660300002)(91956017)(31686004)(6862004)(6506007)(4326008)(2616005)(6512007)(186003)(31696002)(26005)(2906002)(53546011)(64756008)(38070700005)(82960400001)(83380400001)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1ptWDR3Z3NIa2tZVlBkMVhwM0hkM1VsR2ovNVk5bGxyRGlwbmg0aHBORG90?=
 =?utf-8?B?bGdYNDhKc0JlTW94ZzdCMXp3RHlGNTdaQUdJVGJrb1ZtNzc0ZWphQlY1N25Z?=
 =?utf-8?B?MlVUSFR5K0ZySnB6UFB1Qkk2ei90VDMrVGdwWlJTOFk4bUlnaTVmQ283VFMw?=
 =?utf-8?B?MnAwRzhwTTlqSXBrMkVwem1ocmN5aU9mSW41Q0w1Yk5sTXZFNElTSHJDYjU5?=
 =?utf-8?B?Z1V3RFY2VWptcGMwUkZDd1ZhdzBBU1h1cXlta0VGdVl0cW5DaG9GNlgxd1A5?=
 =?utf-8?B?SVljOGhaamZPNXA5cTBUcXFUa1l0UTZlMFNFeDhsQWEwaDRkR0Q0UGFHRW94?=
 =?utf-8?B?QkNFN3JVSlVZYzBZR0FLWS9qS3J2U3BwZlZPNnlrcjl1U0FxVXl6dk11eGRH?=
 =?utf-8?B?RkE2T0g4by8vcEVzNGpaTjJvblBNTHpFNmFVNVllMVVpajV6L1dTQWFIWmts?=
 =?utf-8?B?ZVdoeG8rS1B0QjYwYmZSMk9GMlFRbHhMbjNjNXpOeHZHcmowYTRWMmF1aUNR?=
 =?utf-8?B?d3YyS0xtaXdQZjJBd0E0clN6ZWF6Mk9hODBnWGR3TDVaUk1zMjllc0dJalhu?=
 =?utf-8?B?NUFyQnlmRnoxMkJFKytGbEZYejRwUnVUSmVTY0RaV3Bxb3AvZExVd3ZTMFlY?=
 =?utf-8?B?ODZ1bVVjQjY1WUtKakFPMGNIMVVKQmU4MUxGVUt0UWhwbms5ZkpxU3RXMU5B?=
 =?utf-8?B?NHlnR0NuOUpZUFVSTWtVQ0kxaDZVQUVTZnNDY01CSzFLVG96dHZ5cUM0ZUJy?=
 =?utf-8?B?ZkE3UkY0dnhWL2F4UVg3bU9EczVRNzJLN1JNcnh6V0ZKQlNyeExFN3ZkSGRM?=
 =?utf-8?B?MVJsT1RRemY2SEdXbWI4Rmd6UnFOTkE4MGU2UUhmbkNoVFd6OWgwNEUyTzA4?=
 =?utf-8?B?VG85YXdXUVBWZE1DYVc4MTJFT2RsOEwrK3EwRHNwQkF0VmFndmxPc0xXdDlx?=
 =?utf-8?B?SW5HNklscjd0N1pxVHRReVhnZlFWUmRXSGRoOCs2Qk5SV3lkOVlncnREMlhs?=
 =?utf-8?B?T2JOM3FjY1lKb3pFVW1SM3pYQm9mKy9sSk12YzVFeGlXbk11eW5IVEhyajkx?=
 =?utf-8?B?cy9BNytHOUx1SC9JZFB3V0hkUEJySkErTFNJYXg4MGFxWk96TFl6Mlk2R3I4?=
 =?utf-8?B?Mlkya0d4UGpPeml1UEJSKzhaSEtaWFdHOU5lMXhyU256aTFQTUY1ZUlubHg2?=
 =?utf-8?B?ekhZZnpNYnpTMmVGbFpEdStNT1Q1N2Y3K1A3VGJxS0tiZm5MZmV1UjBYQzhn?=
 =?utf-8?B?RG44Z0dPTWYrVE1weHNrUGdJZ0VVc3lSK2piMDg5V1JkdDIvSGEva3NzcTlk?=
 =?utf-8?B?QkRMYjRnRUJIOWpqUGY3ZGFNU1MwK0lTNlZDQjlsVUU5K0J0MnpTeWtjd2hV?=
 =?utf-8?B?VmZScGtKOWtDT05Takdsb0hML0xldDl4Q0pldENoK004OGpLY2ExRDMrYVd4?=
 =?utf-8?B?NEhGTnliWUUrS09lQ2JnK1R5T0E4bGwyUEcyL05yMnAzWDhPanZ3b1E0NTEw?=
 =?utf-8?B?Slh4dllNZGRWTENQRnNnWUlYSDdpK2dhbXlZbGpMUTNHSWQ0RldnMnU5Qnd4?=
 =?utf-8?B?c0QxVVRLWmJSaWdGc3g0Ky9mS2pHRHVPY0dvZFZCekQ3Y1BsSXlVYWNuZ0tP?=
 =?utf-8?B?UlZzR1pSeHhQaXkvaDdXL21Iak5hZVBUd1ZHMWprdTQxSGFFaHRXWHhCbG9V?=
 =?utf-8?B?UXhpV0pPUk4xeFRLc0tUNndvWnJEM1JRR0s2eXQxdkF5ZllUanpnNXd1SzZQ?=
 =?utf-8?B?L2dEYko0SDc5OWRqQmhlc1FuelFHUGZlaWFMUmFhdTR4amxaMTdldy96UWxR?=
 =?utf-8?B?Mm84VWVaSEJLVUdTcTZoK0ZqN0lUWmdEQ25uSTZnL3pRMmY0Qzc3ZkpUSHkz?=
 =?utf-8?B?TllDcWJTT3NJbzg3SmtQMjBNdHU5bHA4NXpZTDlXWDZJdlNZc1hqYUY5L3Y2?=
 =?utf-8?B?NmFOb0x3TW11VE9rU1NVL0pvL0x3TnRKNnJpcTBsSld6SDRRVU5HR1pYem4r?=
 =?utf-8?B?SU13czE5NFIzUExXWWJzOEEzYTV1YWt3SGNramJGZCtlQzBRZUJzcmp1aG5p?=
 =?utf-8?B?ZkpOYTEwV1p1YXF0cnpTVGViWE9FK1NHQkloanQwZ1ZSS1RyY3lXSWlRSjFU?=
 =?utf-8?Q?9FneXXFPPUSZRwk640iPhl+of?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9368F94B8322984EBD1A047E8828AE81@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37497402-7d29-46d0-972c-08da6b1af8f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 13:14:41.5953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDDfVg/Fu7OvSFPJbOTerCRcltZp/yNX1PNeVICaz88kVgT2euwrjgVBOSPB8U+FxFnyCwXj9rO7da9M6Lvt7vuepjrOucDg02t2oSaRyVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5643

T24gMjEvMDcvMjAyMiAxNDowOSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIFRodSwgSnVs
IDIxLCAyMDIyIGF0IDAxOjAzOjQxUE0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBP
biAyMS8wNy8yMDIyIDEzOjQ1LCBBbnRob255IFBlcmFyZCB3cm90ZToNCj4+PiBQYXRjaCBzZXJp
ZXMgYXZhaWxhYmxlIGluIHRoaXMgZ2l0IGJyYW5jaDoNCj4+PiBodHRwczovL3hlbmJpdHMueGVu
Lm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJyLmdpdGxhYi1j
aS1pbXByb3ZlbWVudC12Mg0KPj4+DQo+Pj4gdjI6DQo+Pj4gLSByZWJhc2VkDQo+Pj4NCj4+PiBB
bGxvdyBidWlsZCBhbmQgdGVzdCBqb2JzIHRvIHJ1biBjb25jdXJlbnRseS4NCj4+Pg0KPj4+IEF2
b2lkIHJ1bm5pbmcgInRlc3QgYXJ0aWZhY3QiIGpvYnMgb24gYnJhbmNoICJtYXN0ZXIiIGFuZCBv
dGhlciwgd2hlbiB0ZXN0IGpvYnMNCj4+PiBhcmVuJ3QgcnVubmVkLg0KPj4+DQo+Pj4gQW50aG9u
eSBQRVJBUkQgKDQpOg0KPj4+ICAgYXV0b21hdGlvbjogZml4IHR5cG8gaW4gLmdjYy10bXBsDQo+
Pj4gICBhdXRvbWF0aW9uOiBhZGQgYSB0ZW1wbGF0ZXMgZm9yIHRlc3Qgam9icw0KPj4+ICAgYXV0
b21hdGlvbjogb25seSBydW4gdGVzdCBhcnRpZmFjdCBqb2JzIHdoZW4gbmVlZGVkDQo+Pj4gICBh
dXRvbWF0aW9uOiB1c2UgIm5lZWRzIiBpbnN0ZWFkIG9mICJkZXBlbmRlbmNpZXMiIGZvciB0ZXN0
IGpvYnMNCj4+IExHVE0uwqAgR290IGEgQ0kgcnVuIG9mIHRoZXNlPw0KPiBZZXMsDQo+DQo+IHBh
dGNoZXcncyBjb21taXQgaXMgaW4gcHJvZ3Jlc3M6DQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4t
cHJvamVjdC9wYXRjaGV3L3hlbi8tL3BpcGVsaW5lcy81OTM0NzkxNTcNCj4NCj4gQSBydW4gaW4g
bXkgcHJpdmF0ZSByZXBvOg0KPiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxl
L2FudGhvbnlwZXIveGVuLy0vcGlwZWxpbmVzLzU5MzM0MDgyMA0KPiAobm8gZmFpbHVyZSBkdWUg
dG8gdGhpcyBjaGFuZ2UpDQo+DQo+IFJ1bm5pbmcgb24gb25lIG9mIG15IGJyYW5jaCBjYWxsZWQg
InN0YWJsZS13aXAiIGRvZXNuJ3QgY3JlYXRlIGFueQ0KPiBwaXBlbGluZSwgYXMgZXhwZWN0ZWQu
DQo+DQoNCg0KQ29vbC7CoCBJJ2xsIGdldCB0aGVzZSA0IGNvbW1pdHRlZCBpbiBkdWUgY291cnNl
Lg0KDQpPbmUgdGhpbmcsIGxvb2tpbmcgYXQgdGhpcyByaWdodCBub3cuwqAgSXMgdGhlcmUgYW55
dGhpbmcgd2UgY2FuIHdlDQpwcmlvcml0aXplIHRoZSBidWlsZHMgdXNlZCB0byBydW4gdGhlIHFl
bXUgc21va2UgdGVzdHM/wqAgV2UndmUgY3VycmVudGx5DQpnb3QgeDg2IHNtb2tlIHRlc3RzIHdh
aXRpbmcgd2hpbGUgdGhlIHdvcmtlcnMgYXJlIGJ1aWxkaW5nIGh5cGVydmlzb3JzDQp1bnJlbGF0
ZWQgdG8gdGhlIHRlc3RzLg0KDQp+QW5kcmV3DQo=

