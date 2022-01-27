Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF83749EDDE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 22:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261758.453478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDCkh-0001S5-KH; Thu, 27 Jan 2022 21:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261758.453478; Thu, 27 Jan 2022 21:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDCkh-0001PX-HD; Thu, 27 Jan 2022 21:56:23 +0000
Received: by outflank-mailman (input) for mailman id 261758;
 Thu, 27 Jan 2022 21:56:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5DO=SL=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDCkg-0001PR-5g
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 21:56:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3f23776-7fbb-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 22:56:19 +0100 (CET)
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
X-Inumbo-ID: f3f23776-7fbb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643320578;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3dro7bpOrzYdjVfXa1cR+Dfph1OtQWZIml24Wy7KIdE=;
  b=JTNEhPY5A5STmPiMCKjmqsu3r0a8TgIDzxD9AmgAiDJbeKpn1bmAb9Gk
   TMRLfMY9g9XghcIoddxpjqY7x9vf0VTtGIrwgeDZZdjYzOfc8EY2GoAlN
   wz7uZI3o4pxX8/nYtPQ7uOYMtVBg9HPBsSfaIWv+mJFc8dVnu8C9NOPxZ
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ft+AMviMAtE1rx7KPEq1kNOzYc5hUZwdAHxCnt0I6SPIXY6Jyh01jDbxmq3mjKRIsP8Rp3mpRs
 o12oZ3aPy6Th1NEFSm1pZyanRP5X2E2NI7qKJHt7tyrU5TA2e/mnY0WtdKzxhSudPpie3PCvIU
 vzIvWOku4BkzeHwtNmY6YhnaosjAyHh4GscqjepQr1j7xsvdPSQcrM846tRdQ7ZEML+lZO0Y8o
 HEFR7l5FpITiBdgBaNfi683EZVn2xkPiL626AWQ2Qnfs8Fq2G59L3Wu2cJFgpLh6w7KSLcXVIz
 /6HGCg6kO5qcdnGNlraTFWlj
X-SBRS: 5.2
X-MesageID: 62935773
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KZSmH6rEX/gCXUUbfhAUlqLyMYVeBmL1YhIvgKrLsJaIsI4StFCzt
 garIBnXa6mNZjT8c9okO4rk9E1SsJDWndM2SARo+C8zEy9A8JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZ6OFjcuB6n0o9YYQhh+Fn9VO7wfoIaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZBIMmcwM0+ojxtnPmkbAs8Pw/mSuUbiLBgbiFLI/I4oyj2GpOB2+Oe0a4eEEjCQfu1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PKK83u5nhhuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcU41l69zZPQ2z2rA3kFaDsfQ9o37ZcPEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWDhRqjBNzAJrVkg
 JTis5LDhAzpJcrV/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bp1eImeyP
 hKL5FI5CHpv0J2CN/Efj2WZUJxC8EQdPY69CqC8giRmPPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimkUjP+efANRa9FOdUWHPTP7tRxP7V/23oH
 yN3apHiJ+N3CrOuO0E6MOc7cDg3EJTMLcmm8pMMLr/afFMO9aNII6a5/I7NsrdNxsx9vuzJ4
 mu8Sglfzl/+jmfAMgKEdjZob7aHYHq1hSxT0fUEMQn61n49T5yo6atDJZI7caN+rL5ozOJuT
 ulDcMKFW6wdRjPC8jUbTJ/8sI09K0j72VPQZ3KoMGolYpptZw3V4du4LAHhwzYDU3isvswkr
 rz+ig6CGcgfRx5vBdr9Ye60yw/jpmAUne9/BhOaItRadEj23pJtLij90q0+L80WcE2RzTqGz
 QeGRxwfoLCV8YMy9dDIg4GCrpuoTLQiThYLQTGD4O/vZyfA/2elzYtRa8qyfGjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRCu/EfxrJdvgfqC
 EuD9sMDZOeMMcLhVlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CENfqFoNI4Fw
 Ps6vJ9E4gOyvRMmL9Kag30G7G+LNHEBD/0qu5xy7FUHUeb3JoWuuaDhNxI=
IronPort-HdrOrdr: A9a23:mcBfNal05SwCZSiymX/JBiD1EaXpDfOIimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdS9qXO1z+8R3WGIVY3SEjUOy1HYUL2KirGSggEIeheOudK1sJ
 0PT0EQMqyIMbEXt7eY3OD8Kadb/DDlytHpuQ699QYUcegCUcgJhG0ZajpzUHcGPzWubaBJTq
 Z0jfA3wwZIDE5nCPhTcUN1ONQryee79q7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NThj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDs1L9qqq
 iIn/4TBbU115rjRBDynfIr4Xi47N8a0Q6n9bZfuwq6nSW2fkNgNyMLv/MnTvKQ0TtfgDg76t
 MX44vRjesmMfuL9h6NluTgRlVkkFG5rmEllvNWh3tDUZEGYLsUtoAH+lhJea1wVh4SxbpXWN
 WGNvusr8q+sGnqG0zxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NZlIqM0q9
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzbGqoLx4r8y+Oa2EaZ4gacaid
 DEShdVpGQyc0XhBYmH24BK6AnERCGnUTHk2qhlltFEU33HNczW2AG4OSITevqb0oIi65fgKo
 WO0bptcoreEVc=
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; 
   d="scan'208";a="62935773"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hctyBWSd5sfLXvV/DZLL43gjaf52J0YhU5L3EpuGtggfmMStpmimLryzZJ0BgMHhYljQCHCaP8x8yzPHW3g/SRFHLHx5itx2ARjUeux0xkIGiZTjVXWIewnDNg0bJyH5w9Wemak+pFtjrkhOvf5rFzsgHFcUtZXjCrgzqy50FihACwmA5dten7j0KmZ/SXJwg9p+6M7HvRpx6N6ChcTBLVt7kbWQAiMhl1AE45Pv9hDqWbj4yf/HW2IW/1P4HejTD199ODSfKPkl/ShsdKa6yXA2RkyzrpHcRUVLjldctdxHj/5benxMt26JjphbTKT9Py3642xd7HlZLopUsCV84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dro7bpOrzYdjVfXa1cR+Dfph1OtQWZIml24Wy7KIdE=;
 b=jVJm39QoOdGQja9j3hXc2pgbvvDz/p+Jd9wQZY2ygOww0H9/7z8O8B3auGddn1yMtXUsSjDqTbBllRFjqZcfpozjKRbBCwa3TYFLS1oClMoQHxrHk3XEAnavUeLYQYkHrs77xSbi5EZTHMnyvjUBj4ck6ZbTbP/tZNEFah/Qr/PYZOvTFuX9yPVr/8BPg4hEYPYb552MxFQkfqbB3uYc4J1p3RK9PrU0qahtGeL294Jn6DU2uX6jONOCCE8ZWe/MZWMu/944E9hXkTqnbUaKd9yWIijMTmC01HI1rPQdmAM9s4V8u+FhLsL4LY5gj58GQrP5WnVTQwo162Al5K+cbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dro7bpOrzYdjVfXa1cR+Dfph1OtQWZIml24Wy7KIdE=;
 b=VF8oe7cs9XSQcQVc/pCbZpOzABZr0tC33hmN33jW2x1gdU17t2u1d3ozq+bOoCB6UfwriQp4bd9hUDqw+9kevdyhzhLCjzF3jSUWTKWLq4LFaBViWdBq3dmC2hT+J7LWLOm+nD4VjL1jcszd40sl7UndVtswKr202kSHiCPx4io=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/8] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Thread-Topic: [PATCH 3/8] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Thread-Index: AQHYEpEQO22I/y1Di0S4u/YrCMvx5qx1hJwAgAA5Y4CAALsGAIAA8yeA
Date: Thu, 27 Jan 2022 21:55:54 +0000
Message-ID: <a807efa6-bea7-a624-cec1-412b4041557f@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-4-andrew.cooper3@citrix.com>
 <f5c1134a-f446-7031-877e-6a3177120de9@suse.com>
 <e987b428-d617-ec8f-16f1-7fd32005f9f3@citrix.com>
 <6431b317-a3a5-013a-83e4-37b5c716ceb2@suse.com>
In-Reply-To: <6431b317-a3a5-013a-83e4-37b5c716ceb2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73fa29f5-0122-40dc-07ae-08d9e1dfca9d
x-ms-traffictypediagnostic: CY4PR03MB2424:EE_
x-microsoft-antispam-prvs: <CY4PR03MB242440BAD5F89E4D60F9C0C1BA219@CY4PR03MB2424.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RDX8a0C7ds/WvsIOZm5et6tiErJDXjomAHQqivtuLbbnCp7YpqTAg0py/yZddirLu/dMtB8+WW1Vs5eQ0J0TyOcqUh5+LUjjq4L9kfPQZoIkkFLcxj79o6GD6BPuFlK/41Guqghcud87ZrywIsXY8NABraJkGcZfewNoCwiEBsmEWoc3e6HVfip/yDl8KB4b/stlFhKHbz/Fo3Bla4QzoTRq+M+0SBNsxrHicBDzR4dGBCEEvYyciHnDbxo3y4g7N3Bzf9lJ+RqE1DjIEWKI7NtWXAnUNDZ4k28gvjAYwYerkOdd7jBmCjZdI+LF/1Ey4vz/CSxrD23nIdtcTA2aNLbapn6q73aBy9mI3L+GmV0gc2bT/TbEnhSLH4ddcVeFGaab5IBbIOtXWDuKnM8zKEJftQ2b4O0qlXURs2mUJxvX6H+fY9QW4Ms2FDHQVPoa808dHp83UO3sFOIt/l8rqmy1okQ78yZp3VOvkTSQPn6Ndy13nl7LSS65Ve59awvpwGyUsk5Ux4jGXTBInSGpPEHOfTrzaMfrl4jPtrEkZbnjJ/dqvLWYT4Tk1jV/gD0OtMknZcNU5oW+3szs03GOFgI00m4QcLC6lIFVHnQ1+wVAddUYyuSNY3imRMhGNg11PLbKA19FvkVwY6s2QJax4oHlV1BJj2FVlWprQtmNNxljW0BEMKiJJZ/x5DW0ik5gYmUeXSbxjLjVW9vRMJlq0nHKWd0Wyl7wgLofcFEo32EuqKXFaoTvBKR+K3h2iMhWHTcUn5JBb43cwUFz2DZO1A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(64756008)(66476007)(31696002)(31686004)(82960400001)(76116006)(66446008)(2906002)(86362001)(38070700005)(508600001)(2616005)(6916009)(4326008)(8936002)(26005)(122000001)(54906003)(6506007)(38100700002)(83380400001)(6512007)(8676002)(53546011)(5660300002)(71200400001)(66946007)(186003)(66556008)(36756003)(316002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3N5SElJdVFDODVzUGtoU2gwVGtrU2pvWXdIMVMzRFd0L2J5T09mR0RsQytK?=
 =?utf-8?B?QTB2QStqbGF1dHYzOTVkWW80VGgwaSt1M0k0eWJOV0xGcEhTQ0ZOcjQ5Vlpa?=
 =?utf-8?B?SXgrMnpVTk1GYU4wdWc5UWhKTUNxMUR1UmwrdFRxcFpjUml5bURockVGdFEw?=
 =?utf-8?B?Qkp2YzRMK2lOU0tuL3RCL0pKUEdsZ3VkNmllT01GZGlvUmJVSlFieW9Kemdh?=
 =?utf-8?B?MUUyWjJrRnNmSTNVQ1M2bHFhZmFKU2xCekRldW1BMkVxWnYxd2hMTUpqR2la?=
 =?utf-8?B?QzRoS1RKZjdHU2pNRllMTk13WUZzb1JMU3Z6K1dvNlBUaTU5N3E4M1RDLzEy?=
 =?utf-8?B?R2NMQS9nWkw1Y3JNd05JTWtaSEJ4RE1nN0ZXTHZKK29wNk5xdWsrS0Z3M0xG?=
 =?utf-8?B?aVB0VDhNNklPT3VobStTZ0xJSHFhRDc2Z1J2dW1XUVhhbmRqQmg2VFBaVmhU?=
 =?utf-8?B?dVhSTE1yMjRUeFFjNUp4T2pzQm9UUFJ2R0tXbFdLN1NkQlFjYzliWE9Xb21i?=
 =?utf-8?B?d3VBcE5WSHl4Zi9GNUpUS3c0TkM1RXhqazVrOGhJTDRKVEpRVjNuTE5QNE9B?=
 =?utf-8?B?bWRCOXpjNllqdUNNSlRNYXNuaFNzZWVRamttVTdjVEoyMDNnTm5ocGtSUFp0?=
 =?utf-8?B?c2ZCR3BkZTcwYVN3REMrTG1GYzRpRElncFF5eVVtNCt4ZXU3eEU5RFR2UmZm?=
 =?utf-8?B?YlBIWGtBMHhSV2dhS2U5eFNQTVZ5aTBBM1lEblZ1akIvOFhjRVhmSWRXUVk1?=
 =?utf-8?B?d3B4SENMZzFTTW4zNkZWY0cvUVhWNHVqWW1UU2V5NjlwN0VJU0VQeHlscFNp?=
 =?utf-8?B?Y1JQSUY1RFIveXc2RVhab1JhUStOVTNYVUtTVGlLSmo2Yld4Nzd2elpNVU1w?=
 =?utf-8?B?NDU2Mk1kRFJUam90UjFzdlVuT1ZSWThPb0FmUFV4WWIzQ1QwU0FDSElrWmxC?=
 =?utf-8?B?K3pVSVZCSG1JQTdBaHFvRlZoY1lhazdRZlBrWSs1YVlsejlRbFNjZms3emFq?=
 =?utf-8?B?Z21BaW5MeWRndmgwenRFOVFiQklMVVhxWFBKV2VlTEJmbkNqeUozYWhncVpY?=
 =?utf-8?B?Tm5lMjdoMW5lUXNLQzlWbHJ2WFUvN2M3alFtbTFkclhoWGhmYklHbXJjQjFS?=
 =?utf-8?B?SlVscjVBdmlXU2FrWEt5OUFSaGlMQmN3ODFtbkNXNXg2cStYdWlhWHZ1ZHNa?=
 =?utf-8?B?QU1vcStyM0xkTThaczNaNmFtUDZYZnZnWTFtZW43NlRRZHZCWTZEVWc1azZL?=
 =?utf-8?B?Y2c5SGlFZnkydjFVaXNYT2lkd285V0ZZNnM3c1pYNU9pRjNsQklCNkFxYkR1?=
 =?utf-8?B?YzR6RWxsSG55KzJOWFZ6YmFOLzEyazI5dWxmQTFMbWhZODJDZ2l1U3dzWDBF?=
 =?utf-8?B?QUprci9TUElKTk84SXNKOTFQTXJPS25lZlZRWDZFaXBCL2NFaFdiYzZFRkxC?=
 =?utf-8?B?SFFZY00vODBxMFZxdGJhcnFEREdYakgwUHFIeis3VFlpSTBvZmtCaWNiTkpi?=
 =?utf-8?B?SDRrSDBCcGNxSElWM3BTdUVUam9xdEV1SW5oQXdxdTh2Zk5FZnBZbFhQTUds?=
 =?utf-8?B?cnJEdXExSDFob0hTcnoyZlhzZFVWakhHRTI5T3RlN01QR1ozekxubXd1Tzla?=
 =?utf-8?B?b2JINDl6VEVydWd3dFlRR202MlllbXZnRTJMWnpkMUlKYkJmNjZud0RUWDFC?=
 =?utf-8?B?U3VsN2JZSXJqT1lnU0lWczNLL1UwMDdUMWcrR0Y1M25aZlNxc1hmRzFDRGhZ?=
 =?utf-8?B?bi9tT284UU9YVzBsTUNZektMcW5HbzExc0FUYm1nNDJUTTN2R1RoLy9NdTZ6?=
 =?utf-8?B?QTZBRXJaSUdyZmZOUmRiYmRmSGpGU1B0RndpN0RTWUkvZk9BWXRWZXhxT1N0?=
 =?utf-8?B?WlltVTl5WkN4YUVZNE1kdS9qajBBb0VxTm9GVC9TcXNIRkRwTzB0clNRSHc3?=
 =?utf-8?B?TU1IWERpa0laUS9ZS2dnNCtyS2JBREtXaTFUbUt1RVpSOFBteTV2RCs5RE1T?=
 =?utf-8?B?cFl4NWUvVWZNZENMem9OKytSTmw1Qk1udVJoSUZEQkNzNExSOEpqdEpTMmNT?=
 =?utf-8?B?YzdHelBUSG52QW5zODMvcVJvMk5YdHk4ZU52dzY4ZitDUDRreDFoUjMrUGIv?=
 =?utf-8?B?YlZvRGhpRU9UN2wrUTRDWDhTYmZwQUpwWnp3SER6Y3IyVWtKZklpdy82Nm96?=
 =?utf-8?B?cjc0OFhNaTM4b1I0bGkvZDZpWjZkMVN6VTh2WHZJWUlJU0N2QURXMHFVZXNJ?=
 =?utf-8?B?WU9waS9YalJtSk9vejlaWXdlQzhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52AB2CD2DB377C45B9B35E86608781B3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fa29f5-0122-40dc-07ae-08d9e1dfca9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 21:55:54.2100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AmlKr5kNPlAg2/MyJJMxJVFHko/TCklffubvbSsXSWV0ROmA6llzBAeSR9tUP8bHa88U+9HKmN+6Jq3NjZ3Q9QDTLFhgqq+GIldERcNMWfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2424
X-OriginatorOrg: citrix.com

T24gMjcvMDEvMjAyMiAwNzoyNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI2LjAxLjIwMjIg
MjE6MTYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyNi8wMS8yMDIyIDE2OjUwLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAyNi4wMS4yMDIyIDA5OjQ0LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiAxKSBJdCB3b3VsZCBiZSBzbGlnaHRseSBtb3JlIGVmZmljaWVudCB0byBwYXNz
IGN1cnIgYW5kIGNwdV9pbmZvIGludG8NCj4+Pj4gICAgdm17ZW50cnksZXhpdH1fc3BlY19jdHJs
KCksIGJ1dCBzZXR1cCBvZiBzdWNoIHN0YXRlIGNhbid0IGJlIGluIHRoZQ0KPj4+PiAgICBBTFRF
Uk5BVElWRSBibG9jayBiZWNhdXNlIHRoZW4gdGhlIGNhbGwgZGlzcGxhY2VtZW50IHdvbid0IGdl
dCBmaXhlZCB1cC4NCj4+Pj4gICAgQWxsIHRoZSBhZGRpdGlvbmFsIGFjY2Vzc2VzIGFyZSBob3Qg
b2ZmIHRoZSBzdGFjaywgc28gYWxtb3N0IGNlcnRhaW5seQ0KPj4+PiAgICBuZWdsaWdpYmxlIGNv
bXBhcmVkIHRvIHRoZSBXUk1TUi4NCj4+PiBXaGF0J3Mgd3Jvbmcgd2l0aCB1c2luZyB0d28gaW5z
dGFuY2VzIG9mIEFMVEVSTkFUSVZFLCBvbmUgdG8gc2V0dXAgdGhlDQo+Pj4gY2FsbCBhcmd1bWVu
dHMgYW5kIHRoZSAybmQgZm9yIGp1c3QgdGhlIENBTEw/DQo+PiBIbW0NCj4+DQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vZW50cnkuUyBiL3hlbi9hcmNoL3g4Ni9odm0vc3Zt
L2VudHJ5LlMNCj4+IGluZGV4IGM3MTgzMjhhYzRjZi4uMWQ0YmU3ZTk3YWUyIDEwMDY0NA0KPj4g
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vZW50cnkuUw0KPj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9zdm0vZW50cnkuUw0KPj4gQEAgLTU5LDYgKzU5LDcgQEAgX19VTkxJS0VMWV9FTkQobnN2
bV9oYXApDQo+PiDCoA0KPj4gwqDCoMKgwqDCoMKgwqDCoCAvKiBXQVJOSU5HISBgcmV0YCwgYGNh
bGwgKmAsIGBqbXAgKmAgbm90IHNhZmUgYmV5b25kIHRoaXMgcG9pbnQuICovDQo+PiDCoMKgwqDC
oMKgwqDCoMKgIC8qIFNQRUNfQ1RSTF9FWElUX1RPX1NWTcKgwqDCoMKgwqDCoCBSZXE6wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPj4gQ2xvYjog
Q8KgwqAgKi8NCj4+ICvCoMKgwqDCoMKgwqDCoCBBTFRFUk5BVElWRSAiIiwgX19zdHJpbmdpZnko
bW92ICVyYngsICVyZGk7IG1vdiAlcnNwLCAlcnNpKSwNCj4+IFg4Nl9GRUFUVVJFX1NDX01TUl9I
Vk0NCj4+IMKgwqDCoMKgwqDCoMKgwqAgQUxURVJOQVRJVkUgIiIsIF9fc3RyaW5naWZ5KGNhbGwg
dm1lbnRyeV9zcGVjX2N0cmwpLA0KPj4gWDg2X0ZFQVRVUkVfU0NfTVNSX0hWTQ0KPj4gwqANCj4+
IMKgwqDCoMKgwqDCoMKgwqAgcG9wwqAgJXIxNQ0KPj4NCj4+IGlzIHNvbWV3aGF0IG9mIGEgbG9u
ZyBsaW5lLCBidXQgaXNuJ3QgdG9vIHRlcnJpYmxlLg0KPj4NCj4+IEknbSB0ZW1wdGVkIHRvIHN3
aXRjaCBiYWNrIHRvIHVzaW5nIFNUUigpIHNlZWluZyBhcyB3ZSBoYXZlIGJvdGggYW5kIGl0DQo+
PiBpcyBtdWNoIG1vcmUgY29uY2lzZS4NCj4gTm8gb2JqZWN0aW9ucy4gSW4gZmFjdCBJIHRoaW5r
IHdoZW4gSSBpbnRyb2R1Y2VkIHN0cmluZ2lmeS5oIG92ZXIgMTAgeWVhcnMNCj4gYmFjaywgSSBk
aWRuJ3QgcmVhbGl6ZSB3ZSBhbHJlYWR5IGhhZCBTVFIoKS4gUXVpdGUgY2VydGFpbmx5IGZpcnN0
IGFuZA0KPiBmb3JlbW9zdCBiZWNhdXNlIG9mIGl0cyBib2d1cyBwbGFjZW1lbnQgaW4geGVuL2Nv
bmZpZy5oIChzYW1lIHdvdWxkIGdvIGZvcg0KPiBhdCBsZWFzdCBJU19BTElHTkVEKCkgYXMgd2Vs
bCBhcyBLQigpIGFuZCBmcmllbmRzKS4NCj4NCj4gSSB3b3VsZG4ndCBldmVuIG1pbmQgcGhhc2lu
ZyBvdXQgc3RyaW5naWZ5LmggYWdhaW4uIE9yIG1heWJlIHdlIHdhbnQgdG8NCj4gbW92ZSBTVFIo
KSB0aGVyZSAuLi4NCg0KTm93IHRoYXQgd2UndmUgZ2l2ZW4gdXAgdXNpbmcgZnJlZXN0YW5kaW5n
IGhlYWRlcnMgYW55d2hlcmUsIHRoZXJlJ3MgYQ0KeGVuL3N0ZGRlZi5oIHNoYXBlZCBob2xlLg0K
DQpUaGluZ3MgbGlrZSBOVUxMIHNob3VsZCBtb3ZlIGFjcm9zcywgYnV0IGl0IHdvdWxkIGFsc28g
YmUgdGhlDQphcHByb3ByaWF0ZSBwbGFjZSBmb3IgQVJSQVlfU0laRSgpIGFuZCBwcmV0dHkgbXVj
aCBldmVyeXRoaW5nIGVsc2Ugd2UNCmV4cGVjdCB0byBiZSB1YmlxdWl0b3VzLsKgIExpbnV4IGlu
Y2x1ZGVzIHRoaW5ncyBsaWtlIG9mZnNldG9mKCkuDQoNCn5BbmRyZXcNCg==

