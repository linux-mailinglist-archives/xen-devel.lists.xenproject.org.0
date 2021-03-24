Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301E934794D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 14:16:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101000.192809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP3Ma-0003Io-5N; Wed, 24 Mar 2021 13:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101000.192809; Wed, 24 Mar 2021 13:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP3Ma-0003IP-1W; Wed, 24 Mar 2021 13:15:56 +0000
Received: by outflank-mailman (input) for mailman id 101000;
 Wed, 24 Mar 2021 13:15:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwg6=IW=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lP3MX-0003I1-Rw
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 13:15:54 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6eb9d870-108c-4b20-959d-4f9c5f519458;
 Wed, 24 Mar 2021 13:15:52 +0000 (UTC)
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
X-Inumbo-ID: 6eb9d870-108c-4b20-959d-4f9c5f519458
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616591752;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4770ruhSxyXb36e1yu5oJTwUyg0ZrMh6HfAhTq3NyUs=;
  b=Hue4AWwAwPjWX09o1Y3FapvHsKez+t9xExIqWnz9JhdL2C6wXwXk+k8n
   b3itMR3V35NFhZqmUjwuZ0WWoyXMU4xgVS/p40hsYtDmMluMzKUpmvC13
   zgk3UTMcheEFYJlCkmqJnPVgIgYh8lzaQQkun4Lor0NTRFjKAtaAWMFUM
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5KoQtF7GxhHr/vXLbkQnxHX/UWiURovS/wrXcGBpiYxrm57uooS4plQ482RQGb6CLvp9JXAXXN
 0kOWa12UlNpjLRVnCN+lVYv+OFm3+mkHuL1v1hZfZnI56G5zvGT/2+DWtD190nnqWvZJGm9gBt
 659/X/DASENfocTDcuzjvLV5yjgVijWJ+yrjB2lz26PR2220dijYPy7JNAG4EV14tHHynNqLUt
 ZpJMFfrXrH4OPSaqcOCcnv0rsgt4ibztSyNKwFkom3AeJjcTtq0sPAijdWLUY9E/00S1DrjUBq
 yas=
X-SBRS: 5.2
X-MesageID: 40018780
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:laoH5azBp7UNTGW5RekyKrPxV+8kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpczx7BCkV/Mpx9ea+K6l7N2usktFZysCUdAE0y5SDAGHHkpqAClqbKBJWq
 a0zMxBujamZDAzZsO0GnEKU4H41qH2vbjhZgMLAANi1RKHiimm5KW/Px+T2BofVD0n+8ZizU
 HulQvl6qK/98yq0xO07R6d0716uvvEjuFCCsuFl9QPJlzX5DqASYx9V9S5zUkIic617lJCqq
 iunz4BOIBJ52rVbiWJp3LWqnPd+RIPz1On9lOCm3vkpqXCNXIHIu5Mn5hQfBecy2dIhqAF7I
 tx02iUt4VaAHr79UyXjbmpazhQmkW5unYkm+II5kYvKrc2U7NNsZcZuHpcDZZoJlOh1KkcDO
 JsAMvAjcwmFW+yUnHDsmFjhPyqU3gjdy32JHQqh82P3zBa2E1+1ksTrfZv+UsoyZRVcegn28
 30doBT0J1eRM4faqxwQM0bR9GsN2DLSRXQdEqPPFXODsg8SjHwgq+yxI9wyPCheZQOwpd3so
 /GSklkuWk7fF+rIdGS3adM7gvGTAyGLHbQ4/Abw6I8lqz3RbLtPyHGYkspidGcr/IWBdCefP
 qvJpRMAbvGIXH1EYhEmy3yMqMibEU2YYkwgJIWSliOqsXEJsnBrerAasveI7LrDHIqQWX6Dn
 wfXCXiJclJ40yxM0WIxyT5ajfIQAjS7JhwGK/V86w4044WLLBBtQATlBC466iwWHt/m51zWH
 E7DKLsk6u9q2Xz133P9X9VNh1UCVsQ5L3hVnhNtBIbKk+cS8dbh/yvPURpmFeXLB52SM3bVC
 RFoU5sxK6xJ5uMgSY4C9ymNWqeh2AJpG2DSoodnqHr37agRroISrIdHIBhHwTCEBJ43Sxwrn
 1YVQMCTkjDUi/1hb69l5wSDuHHf9x6iAOmSPQk8U73hAG5n4UCV3EbVzmhXYqrmg4oXSNTnU
 A02bQYmqC8lTGmLnYfjOw0PEZXUnmeBKtLAW2+Fd5ps4GuXDs1bG+RwRSGlhk4ewPRhjovr1
 2kCRfRRNbmLR52vGtC3qPj7VVuH1/tAX5YWzRdqo1yFWPPp3Bp9/SED5DDjle5Ykcew+0bLT
 HOaSYTJAQr3NysyBuJgl+5ZAUb74RrMerHALs5dbbPnnurNY2TjKkDW+RZ5ZB/KbnVw6I2eP
 PafweUKT/iYtlZqjC9tzIgOCNurmMjnu6t0Br57HKg1HpXO4uYHH12A7UaKcqb9W7qWrKB14
 h4l8s8ua+1Pn/qYtCLjaHRYDgrEGKYnUemC+Upo4tTp6Q8qf96GITaSyLB0DVfxwolRf2E4n
 82UeB++vTMK4Vvd8sdd2ZQ+Ucojs2GKA8uvhbtCuEzcFkxhxbgTp+0yquNraBqDlyKpQP2N1
 Xa6SFb8vvfVyaI1LIRCcsLUCxrQVl57G4n8PKJdoXWBgnvavpK+0CiNGShNLBaU6qIFNwr32
 FHysDNm/XScSX22Ard52QmZq1P9nuqWsO0DkaHH/VS/9mzJFSLhe+r7aeI/ULKYCr+b15dg4
 tPMVEUZIBEjDIpiYUsyCi8SqDtuCse4hJjyCAikkSow5Ss5WfQAFpPPgLYiIhHRDU7CAn7se
 3VteyDkGnn6DdL2ZPfBF5dc9FHFd8XVJX2JU5VWLwtla/t+bEujCRFaAovCGB5iCmV5ZIU4Y
 uE
X-IronPort-AV: E=Sophos;i="5.81,274,1610427600"; 
   d="scan'208";a="40018780"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJP95pQ/M1fcqJTNsKxKtlngrL+zLsLhDc9IKIMU4PSozOt1gbUL3SN73QlSjlabtEVepgfnmJZGHlQYWT5NE+1zxiZfDXI3NPBPSSpt81RcqDLwACwQdzzZcP+P51nDkYC2mIuBSXoMNEfU4hbfSmiBVgojqswj8At/R7W2XAAdz3NwHRo3fc+k0VQvW9fZa7k2h7NdkArzgO6iIB+3zumq/ee+0KAml5HrbH77apllHL8nr5UGULGXZrz1E4pN83q8xiw/1eyczT4VldJhxj3wt9mAj7cdpKpxdOl+ewiclMUYY7RjQboStnVDXMQa05DSOtWKfjsOI2aJm3mgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4770ruhSxyXb36e1yu5oJTwUyg0ZrMh6HfAhTq3NyUs=;
 b=e7JTRXk+T/RWVDhZf8rW7g2RQdx8CXzNpO65Ua/4H5Y/x4c9SO7vaMF5LucZhz2B3nLfpEIOAgyWHhRwx+Hti3wUHoVZG241+KNvFiEVe4QW7XaVosGcm3IGlyD3RdT4M301ShvXEwqglrJFbh5Qj2smkw1y2P16jTDken7tPzOFfiTF2W5hU4D+6eXsCmagofvNuMYsk+d3u+PAnZmto6rWUEuiS9s4tgGEWDid5uI872cjHcFTND6WW4rFe5fM+eLadQgnTHXpi//YdyuzsfxrIFXQx2x8VdNhYWI4hFANc5qD6qTYx8gFam05jXeHyLGvmvTsvfcJZqaDGxUdLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4770ruhSxyXb36e1yu5oJTwUyg0ZrMh6HfAhTq3NyUs=;
 b=bEGlOunN8uutuS19ho8XwzMsUEYOD7lX/9xlhtyCqh6OJaAhpfVEKUBCfDVOJPDlF0eaP8m4kMgDcdQjucLVSZyc4Io5smHYgEBMxRfYviHInF109EGjr8dq3XV+mW66VF9hIa9NR/BcQkRnpnKpZIzZ1MTwxtrs/ZLoX0+HMrk=
From: George Dunlap <George.Dunlap@citrix.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Julien Grall <jgrall@amazon.com>, "Julien
 Grall" <Julien.grall.oss@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Rich Persaud
	<persaur@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"luca.fancellu@arm.com" <luca.fancellu@arm.com>, Paul Durrant <paul@xen.org>,
	Adam Schwalm <adam.schwalm@starlab.io>
Subject: Re: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
Thread-Topic: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
Thread-Index: AQHXGhIm6lUem5Agw0SwTR0/wys6MqqJ94wAgAfrX4CAAPCuAIAAUZ8AgAAGPoA=
Date: Wed, 24 Mar 2021 13:15:48 +0000
Message-ID: <532A93C8-81F9-4254-A9B6-B6E3462923A9@citrix.com>
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <20210316031814.10311-2-dpsmith@apertussolutions.com>
 <YFODOnQRAntdETY7@Air-de-Roger>
 <CACMJ4GaWtSWAyqbgqDa-DuLy1bYCBx8E6PucxtGfVeiraAy5cA@mail.gmail.com>
 <YFrxznV1kXeXsRCa@Air-de-Roger>
 <CACMJ4GZMNfbCjTKR5ngQBMwwAfUnSOptP+UJV8BcNqKAUy9Row@mail.gmail.com>
In-Reply-To: <CACMJ4GZMNfbCjTKR5ngQBMwwAfUnSOptP+UJV8BcNqKAUy9Row@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b72eb8bb-2553-4754-f3be-08d8eec6f142
x-ms-traffictypediagnostic: PH0PR03MB5670:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB56707B6A594FB56BEEB31E1599639@PH0PR03MB5670.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pxgJHJgthgJ+jnsdL1Vsm3QjexBfvYeD3Oyq1349+4RiKRcYN9xraza8RxaFzHgerhZu5bMC+vSQlqM05JE6n2ufOBeuFFNl/Z7dgzYcgnbtS38+/iSNlY5XKnHNrrLFnqWt/EncY3rSuI4Vx6usMvgniIwyZ7TbsnpiHXPkSyWtY0Ka8u2r/0zKCtWRatBS00U0zNoC9A+eZZmJAnTlp+Ls3zXafnlpLi89ZyiymzhDsrM7NzIqX6Rhde3ZjVXRv7ERGoR9bcML6O5Ay0PwdmdZfNnO2evj0JgVTvTFhcro025hE2MdtvyFiqPPdhsIfgH4nkcxk4jvjQL06CUqfVZ9WcTaDQdBuaLRqVKxTxTybERhxijdVK16PCk5YL5OFnCX2FwdGGsH1lPxXY1vIT+rJ549unh24QVrvznaNo2qVIAiL5RoodufjkFEPgMnAtqyPBSauSQNDnK/2tsp4rtXkesNanIpEJjhj3Mox1en5ACpyuGCfy6d0wova7ja0KrIbiMRC/mMoW+MiAh0xvI9N18ba0elIJALTQpxm80cNcQxzUZ6Jm6kiY/Rh6bRMeC9H1z3aKJRFepRYcl5P+ASeRwcZA5tqf8TS0d90uzecrs9JLk73XGlqU6pKHzMJ+DTdFmQ/T5KG2fNEJuMOm/hWCgIUQIlKVaoOSj4E3pdYJt3+2Lkdzvkg9YtOAru
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(36756003)(33656002)(6486002)(76116006)(6512007)(478600001)(7416002)(54906003)(91956017)(6916009)(2616005)(66946007)(4744005)(66556008)(53546011)(186003)(8936002)(66476007)(2906002)(5660300002)(64756008)(316002)(8676002)(38100700001)(26005)(4326008)(86362001)(6506007)(71200400001)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TmFrZGRuSmhXL2E3b21aWXY4WXRsMXJib1JaSmE5SDdHU294UU5ybUFldVlq?=
 =?utf-8?B?N2RRd2FpaGdIekJKdWd2U3c4a28rZkcrTWJialBKVURiSDB4VEhXRWg4eW5u?=
 =?utf-8?B?VkxRUlI5eWlKZ3MwVTkwQkVPMkpUTWZEdUlPMzJWbndXLzZVTnV6d25HODlX?=
 =?utf-8?B?enZhSGhaSE9qSVFXdGpJRjhWNW9DdDY0eTRqN0dLdk5mOEowbVFHZ2t4YXBt?=
 =?utf-8?B?SUNpU3FxL1NDVzBDSHlRTjhPOXlwaG1mdDZuSTZEY1g0R0RTS0IwYTJpSGwx?=
 =?utf-8?B?Q1FnMExrd0ppNzkzWXErZG51Qk02RW55TkFzTFpSbVBiOGZlb0h5TDJETk9y?=
 =?utf-8?B?bkoxSXNUemErYkpoT2owaXJTTTMrRzBaRkFTYkh3UlUzaGhsN0w2dURNMHpv?=
 =?utf-8?B?dkwvUEUxd0xXY1ZLcFN5K0JSVHdCVzJTQW9NOWU3NWVBQys0K01jWjhSakIz?=
 =?utf-8?B?WDdnUnMzeUkvV2REdjAxSHdWUHl0S2VzWmtwcE9FZ2hyaVJMMHJKWE50b2F3?=
 =?utf-8?B?TndpQ05ZOGNYaVFVbUEwZnpsSlh2TnQzdms0L0IycWRGNTJTN1IzS0tXOUtw?=
 =?utf-8?B?UG9LNmNQRUxFU3F3aEVnQ05zOVJiRFFkUTl0bFBPMlBQMDRXN28weUxBS0VT?=
 =?utf-8?B?cmdnZVRqaVdsR0puSTF2M1VGakMwRmRveEJwclBCSmRwOWZ3MEsxWFdETXp2?=
 =?utf-8?B?ak4ySmRwc1pzQXFkeDlPN1o4bnJqK1NoOFpsUWZ2SUZ0dGdNNndTM1NyMzZ0?=
 =?utf-8?B?eWhHVlVkUUQzSHA5bWNBT25RdzlwVTBxNXhnY2xrcURZRWRhbVVXd1p0dzFT?=
 =?utf-8?B?aGozT0MyblBpek1jVGk1aTBPSmcxOW02Rk9RRzNmZEcvREF3aDdzbWxrV3FJ?=
 =?utf-8?B?NmRRSUw4Sm9adnUzL3VLZitJUW1YWUY3bzhPNVdFQkFLbzRJTldsRnFjeHpP?=
 =?utf-8?B?emRSVVRic3lmZ1NkWU5yNDh3bjVRNWo3d3VjaTAwNGNwcjB4ZUlKb3FZQjF2?=
 =?utf-8?B?VURPRjlCRzJ6dERoRzlEMTIzUElKZk93b3pwK1RTWDRVdVpnRGFqRXp0STBC?=
 =?utf-8?B?VkdNN3h5Yk1IeGxubG0vSlcxU0xDcTltQjhMZXNxWFY4U2hmMjBCcFdoTXBL?=
 =?utf-8?B?VC95VjJqTjRsTSt5Ulh6Z3VCZGhCaFlQV0dRQWRTU2pvNzAvY2FhZllYeGUz?=
 =?utf-8?B?RDFTK3BSVkhnVDZISnZGaVpFK1o5YnVTMjJwTmVmUSt2amc0OHMvSGpJWVlo?=
 =?utf-8?B?WEdjMGk1c1Y4ajNiamhXZ1c1MFdvbThJZkxiTFE4MWprOXZtdTMzVVppV3RF?=
 =?utf-8?B?NUJTbnVmSXlVZGZHU0UrUkllQWtGQWhUOE9majgzaDk1dU8xNVhjZ1ZRZmYx?=
 =?utf-8?B?ZGFnTUI2VWIwNUd0YW9qTHlETnJ3RFlQOEs3aGtsSFE5VkV6YmJBMyt2YTZU?=
 =?utf-8?B?N2k0bUY1c3ZLOTI3NGo5WmxWdE1IOEZoai9zK1Y2OGxGVWZNUVVQMjFpRjU5?=
 =?utf-8?B?MlZSWFdoeHFJQmRkNXBGbWFNUHJ5d2JmVTAzZW1TR1dsVlVHdUNJUktGTklo?=
 =?utf-8?B?TU9jd205cjExNFE0eEV6LzM3aFNObDNsSDVkUmJZME9HMi81eEZxWlNhTzd1?=
 =?utf-8?B?aDlEWEhVNk1GSGtXRDlMWHhHRzBxVndWc3RuOTM3V3pKdzVQalYydGNrMjAy?=
 =?utf-8?B?S1doSUtXNENwbk8vWGtUZExCMHVuak52NndROVZZR2FUTzQ2d1Nxbi82bHM2?=
 =?utf-8?B?Z0w1SXZrMDU5Vk04cjRUZ3Z4UDNEL3F0cjZVV0UzVGJmdDk0aldaOHhpWHQ1?=
 =?utf-8?B?UzhBbWRzbnFabWZBTHNzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60525790CBF3404FA98049DE155860E6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b72eb8bb-2553-4754-f3be-08d8eec6f142
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 13:15:49.0004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bhl053wyuz1DQPcuI4rZAwRnXhZOXuMW/eFVhQnc4fl8q+bNkIIVrw+ckvPuwy3xqkdOIdzR3jNkRkJ6Q7sT6wVeeRBHlzYUFTfuoVeNnIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5670
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWFyIDI0LCAyMDIxLCBhdCAxMjo1MyBQTSwgQ2hyaXN0b3BoZXIgQ2xhcmsgPGNo
cmlzdG9waGVyLncuY2xhcmtAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IERvIHlvdSBrbm93IGlm
IHRoZXJlIGlzIGEgbmVlZCB0byBwZXJmb3JtIHdvcmsgdG8gc3VwcG9ydCB0aGUNCj4gYXNzaWdu
bWVudCBvZiBQQ0kgZGV2aWNlcyBhdCB0aGUgcG9pbnQgb2YgZG9tYWluIGNyZWF0aW9uIChpZS4g
aW4NCj4gZG9tYWluX2NyZWF0ZSksIHJhdGhlciB0aGFuIGhhbmRsaW5nIGl0IGluIGEgbGF0ZXIg
c3RlcCBvZiBkb21haW4NCj4gY29uZmlndXJhdGlvbiwgcHJpb3IgdG8gdGhlIGRvbWFpbiBiZWlu
ZyBzdGFydGVkPw0KDQpBSVVJLCBsaWJ4bCBhY3R1YWxseSBkb2VzIHRoZSBsYXR0ZXI6ICBUaGF0
IGlzLCBQQ0kgZGV2aWNlcyBhcmUgYWRkZWQgdG8gdGhlIGRvbWFpbiBhZnRlciB0aGUgZG9tYWlu
IGFuZCBxZW11IGhhdmUgYmVlbiBzZXQgdXAsIGJ1dCBiZWZvcmUgdGhleSBoYXZlIGJlZW4gdW5w
YXVzZWQuICBPbmUgYWR2YW50YWdlIG9mIHRoaXMgaXMgdGhhdCBpdOKAmXMgdGhlIHNhbWUgY29k
ZXBhdGggZm9yIGFkZGluZyBQQ0kgZGV2aWNlcyBhdCBkb21haW4gY3JlYXRpb24gYXMgZm9yIGhv
dHBsdWcuDQoNCiAtR2VvcmdlDQoNCg==

