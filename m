Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9964BA36C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 15:48:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274819.470415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKi4n-0004Zp-61; Thu, 17 Feb 2022 14:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274819.470415; Thu, 17 Feb 2022 14:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKi4n-0004WU-0I; Thu, 17 Feb 2022 14:48:09 +0000
Received: by outflank-mailman (input) for mailman id 274819;
 Thu, 17 Feb 2022 14:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/h9=TA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKi4k-0004WO-PF
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 14:48:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9be86b9c-9000-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 15:48:05 +0100 (CET)
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
X-Inumbo-ID: 9be86b9c-9000-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645109285;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qTZcx9WChNVhjJksKTzip/5ECScls2qgeTSJAOMca68=;
  b=OehSZBBv4pnv0FKdp7E51zZ9AKlYFY33+L7ZahkQc78GEb2QVINBEoer
   LDsOwKviWFho1Fare8AOvbMNI899IIS/nMSSKfWFEKlYnniB+mM0IXBj5
   2JdiNHwCh4OaXq/thloT33A3Z2LZe3d4NOvUjfcJuxDlzb314Bzu3sX1x
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: p94FuqK+HroUFxlkoGf/bN63jWBua20z89OExIIt26g9S9xmsswk0+uYek/G7Lts8Qj3pOAXcH
 sUX/jbkx0Ie0pw41szjDQwCRRdQlhq30ikqsRMpYh57nV1YD1/aVhRNK7wWB2nXwst8AnzY2m9
 frEJuJPotNiVXPCf3KXz4L76p9VxCH+Aj4FHtMVc4cbE19r9FRP+ogcYd7n6vG+kmM2hYCmN4n
 plDitHapJ+EfY3cLo7YzRs49AGOPYAIHry6tVSexBqBgsj+q9LQTCQGHUGk9OSNgiLFI2iQ65f
 Sawcdn414lKR52dvuxNQBr6h
X-SBRS: 5.1
X-MesageID: 64333349
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:a3ziiqlJj4xUKg/fUhuIyQDo5gxdIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeUDqCOqvfZmr2Lt5zaovi8h5Uu57UmtdhGgc5pSo8QyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc32YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Nhok8yUc0RqB5PzkegRYyhiSRh3GbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gls3ZsVRqqPD
 yYfQSJgfAzkURcTBlMKNo4Hp8SWqCjbXjIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsszs6C/5qUK4D1j6Exqbk0jzDP2EgUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNeZJhKTysDA3CMqsyq7DETFtW
 1BexqCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wNuGohehs0aZlZEdMMX
 KM1kVkOjHO0FCH3BZKbnqrrU5h6pUQePY+Nug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid9404OCrKgPHiMoNV7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4ACXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:cNZa1KrCyAGjkPZ3OR/uJAYaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAe0+4TMHf8LqQZfngjOXJvf6
 Dsmvav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QpiAoos+O/P+XZgNddvpfvHHeVAlYSi8Rl56cm6XXZ3uBRr22uzKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.88,376,1635220800"; 
   d="scan'208";a="64333349"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjE0LLfW8ICVX77NgSmcsEyqUw6jqNefxMpJGfSg4mPog4Ypm3bk4EigptwrvWDr8w4kgzbWcAkEUc0NwF7Us/r4etnh2HyGYjXePWimklizZ4lj8lPXiULzWNloem46uF20/m78rHPalMpMZU/RxaK+H0A8C6YLw5dgjWvpXqFmndHJlb5TuPA9qZ5SrL9StoUPSw4HyDf2GepvfTlXcK0+aAquWoCskmqfG+LmtuUyvvLH+jRCCkbSvqCw+q4BhL3M16Mvn+CxG01wCsSnIR51hmu02iYThE2neAm2dbp5qsnJUlEvR9EylRcz44mPsCyzs1eceo0tsvNRi2FLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FULfcuiL5IXvaRBgERreSKtuIFIoX2cUBj9wvMWN0OI=;
 b=moFS/zt+v1aDq+JdC0TI4Zh3fP5la4ako2ESumJaBAn7BhU8SN8Qrf6GcpPl9qRX8Lca8WnRUfckq5VzYUe9Uj9ZiKLi8D4wdN7E7Y7mp/gwNQwmt3WYJUNlnGRxX96R3vvdkwgBkdAh2va0OLvxWn1IyYxhuw88m8HFcVM8U+aOSoHIb1iM6POSa61iNxPG7M53ObrpIKB2mTmaCuVBq173/QDKXNbCvNzzCzWgNldLHRtctmnJqVRQHlpy7Efvr/droiGiTwdVuLdLEq7etYw8lxjbwC56OLFmnKsmYyTGX1xQuEosfH1wkaes/EAw1tMPEft6V0OTEN80LwCuEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FULfcuiL5IXvaRBgERreSKtuIFIoX2cUBj9wvMWN0OI=;
 b=NBCsCCmJ73K0zzzELTua+3nW6lovqUD4fxXqI6QeLg0BlHyhpiGbkSVUyBzEzW5QgnteCr1agZHDvH4aG5Qcn1Kl56TFBvhvmknBurRZtkeBqek4e8+ZQj54is0n4rQ2LQsEFPlIbhsNwl6fGv+w096I9YeotCPRrnnCpPZxXrA=
Date: Thu, 17 Feb 2022 15:47:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RESEND v2] x86: introduce ioremap_wc()
Message-ID: <Yg5gGenFpAwZqtSW@Air-de-Roger>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <c56aadc8-e568-4625-5d6f-bd2b8981f3ae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c56aadc8-e568-4625-5d6f-bd2b8981f3ae@suse.com>
X-ClientProxiedBy: LNXP123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbded9e6-ab19-49f4-238e-08d9f2247dc3
X-MS-TrafficTypeDiagnostic: BN7PR03MB3489:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3489C60B44ED78258052C9088F369@BN7PR03MB3489.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GjnGSco/hmrwFs/dNQ6B1tioJJVeAZPK7XL07f4RpGsJn/YLRqgQ1szlgfX2u14srxrNpifYTpeK/4MHkQBDnaRNa+Zu1+g9WEOFZjfei8gwbG5JbAX3LG4tBQ3rfwqHWXuIFtk+DEVn5WVkxxoFlzQuAjiDEd/KSEh5NEVZGbpG5zsIPFDUAee1ipu+lzu3LFuCLBEJQVYCHut9o7Q57Io6uWYuJTP3ztQA9Fb9UqAJ/EK1c835FlSVWIfTOEfKM2V1Esg7H+fsRi45IPg6PIRefo7geNYtAiU+H0Abq3F5sCDq0hyD2R77M7ziRXKMYxcA7yQEX/nImQ74/3M6GCKSz4rtqDlYjLYB0sKmo894w0ouaVMuWpyDZfJZLZjxKHNzqO4xN8Vf5AdX79zQKJb3grU3EJ+dc9MPa6nUij+TCGDbRlRFXd4TZiDOFjAkk/dppgSfv5Pe5olbhYmDUVchhJYrGqobcs4VIGKzz/CyGoFb0TTyUIsecUL2Cv69ond8uyqMIoUMqCsaq6pJju3DoCdjxoPbi+SfXF/Vz3BRm73KZXNtEdjN5pU5Z+Oc9nViOdyFw7tRXorEyRrzKQOCbaKopp7dyzn6zVfgZL0UE4xhkFGv3UgWtv/xc6EWtDZoY+d+WpwLZVUy+w9Ylu6BeAn8TE6XQPAv7ANL2Z9yBwkfE6/JO/rlfERHK+O8cmNLyxHzxv55zyuFG+l+2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(86362001)(82960400001)(2906002)(8936002)(5660300002)(508600001)(85182001)(186003)(26005)(33716001)(6506007)(6666004)(6916009)(316002)(54906003)(6512007)(9686003)(66946007)(66476007)(66556008)(83380400001)(8676002)(6486002)(4326008)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDhuT3FoNDhjWExPZndaQTVTR2ExL1poWUJlYVFlaEZrbmhqWDBNTVkrWFds?=
 =?utf-8?B?Y0JGdnEzSE1QTWRXRUwvMERGbGtDVE9nUjRxc01yUmRnb25uekIyMmdtWnhR?=
 =?utf-8?B?SmFlTU9Uby9VYnJZNlBKVGxWTU4rNkh1MWg1TFkwbEFyV0FsMllJYjFwZ01m?=
 =?utf-8?B?RFpwZXFKYlNiOXUrVWw4WWxhM1hMcVloNDhiYnV6aXRxZVREcWMxRWJwTnlS?=
 =?utf-8?B?SDhXejFzOVYxZDRmd0ltUUwvd1ZZWWJTVEc3V0NxK1BKSkU1aDVva28yY0pI?=
 =?utf-8?B?SEM5TWkzaUM3NGk0OHhSYmMvS0ltUmRQK2JzNVZpRHdqVEtYQlNlY0VzeS94?=
 =?utf-8?B?TjZlb3E3Z0VzL3RodjdwZGtxZXdyRGJ1ckpkbEVHd2pyVlM5MGkrejZlUDZZ?=
 =?utf-8?B?L0hMV0wxdm9FT291V05aQzVFbFdUcENGekZOL042TnFpYkZqeEJvWWRqRkJ4?=
 =?utf-8?B?L0VmLyt3SHdJaVRudU5lYU03NnBINkpEUTRmdWFDTW9xM1pXK0ZJVGVpMzdh?=
 =?utf-8?B?ajI1SjQvcTlVdmVhdURHZ0N4U3paSGJoY0NQVEEvQUxISERoMGJvUEN6c0l1?=
 =?utf-8?B?NW8rMEx4WTArYjdCNEx0K1VlK0Nyc29LMzBTdTA1V3poNkp3blBGbldBM0lE?=
 =?utf-8?B?NjlINVp6U0U4c1dYL3EwMGxLUWJhZFlmNnhGUjRGSlNkNVh5OHBzWFd0V0hF?=
 =?utf-8?B?MWRyVzhJSXJPbnFpY3J2YlN6UUgvSWJqTzh2aThDWTJBM3kzbnNpNHl1emhP?=
 =?utf-8?B?VVhoWmQ3QXRmdEQyOGI2bDdvQi9KaFk5eWVudHNraVUwQnZQTWE2ZExWR2dQ?=
 =?utf-8?B?ZSs1TWxyNkpoelViUW0rNFVHQWN4WUFEdHFhKzNXV2VUUUNOcXFEVndremVZ?=
 =?utf-8?B?SGs3YmJvTjgrYkFyNllJbU9yNzJKdGRLMGlod1VzVFk2SkhpQ1lGSERId25S?=
 =?utf-8?B?VzFzNUFFL09Za2h6QlRBZU9ObUNTcjFWZEp1YStjbE5EVDVHUVVhY3FYQ2Jw?=
 =?utf-8?B?UzhiTklabGVkMWdIb3BUWHJGY0xiZXJBcXVNRkU2WkZyNjBPMVpZd1dSR1pX?=
 =?utf-8?B?aWVGajRCRWRJNktUanhNVFNsU0IyU0wvTmM5eWVmMmpKUktSWGJWZDg1Q09U?=
 =?utf-8?B?Z0dvUVRSeFJOOE51Z2VmcVBKeGkxTlhCeDN2cGxjSUZtTHJmdkVKMlRZWWtn?=
 =?utf-8?B?emRkM1p4QVdJT3BOVkZ4aTlOcWFtTGRnSlpPNTZkMUhVV3hxR0xLdXBBVUV0?=
 =?utf-8?B?ank1N0xYaFJsNCs2eXlpM0tsYjRJWFRzRStYWXdUUjNuSStqK3dWdFRmVFg4?=
 =?utf-8?B?WkJWcytjVnNOQm5vdVNqMXRmU3ZtTnAvcXdTVHZOR2FtL29uN1pBQ05jRnBz?=
 =?utf-8?B?NFZiUHFDWTZudHBZamhpRmZrK0dyb3diNEEwUUw2aWJWTTZCVmFzdWxwT0Fk?=
 =?utf-8?B?VTl3RUlKWHFWSkk5TFJxYlErNGFoRnN6WUd1ZElsUU93L2JQbHFPOEUvMXJr?=
 =?utf-8?B?N3NKWFRDRjBDQjBwZzcvaisrK1BKYm9ZVWRoUTlwZkJoS0VFS0laRno2QUNw?=
 =?utf-8?B?L2NwdEJub2tMZXBzdnBOR1FzU1ZGc1JiM0dUVUYzZ2VUbkxHUXMybTlaSG9J?=
 =?utf-8?B?N3dLQzVqbDZhcktHQTdNYW9ELy9ST05KTkpOaWpwdUZIUHJuTlA5ZXRjWHEy?=
 =?utf-8?B?cldLWmVoRnQrVndiZ2hOTWhaNmE1c3pJVTU0Zy9rYXdEYmk5MWJDb0xtS2FK?=
 =?utf-8?B?ck9iZkpJaUM2REQzYTI5RHBZdGdWQ1lWdXRhVDVPaTZ3MzNaOWtMcnZXK3du?=
 =?utf-8?B?RTRaakZ4c1k1RDFSZDR2WlR2ZzBDWGRXMy9ubm1Hak1qWkcxRUFaN2E4aEJw?=
 =?utf-8?B?Mm1lL2xSNGFJcEdsdmRiU3RvU0h3S2VkelFvNlBBTW4zdzF4UWptUXZESUVW?=
 =?utf-8?B?K1VuVzdvelhiYTJzaDBENG40SFYyOGozL2ozQXNsNHJNWk43UTQrVkpBUlkx?=
 =?utf-8?B?N3VSOG1Da3hIOUZ4dlk1QlJYMUxLVXVhT2E3U284UmlYR3BYVUIrL01EdGVQ?=
 =?utf-8?B?aDBCbzRaOFNINTEvUW05eGpyT2FINHZ2UXJtREJ2MUNhMlZsYUd0RzJqSU41?=
 =?utf-8?B?aDVPWndJVmkvWE5PTXY1MTRwUHBqY1hkbFJ4eVpHMTZOdlBQMFZUakQyQUpB?=
 =?utf-8?Q?wdBB/WMUHg7MnFgmpqCUd6w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbded9e6-ab19-49f4-238e-08d9f2247dc3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 14:47:59.4652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJIblaTEZ3DVaklElc9yEBtIUE0W2j8tYaVPtjaZUGJ4SRYEzkNnTdWWQ75mJNYG4iwRpEgInwkRPFwVzPsO9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3489
X-OriginatorOrg: citrix.com

On Thu, Feb 17, 2022 at 12:01:08PM +0100, Jan Beulich wrote:
> In order for a to-be-introduced ERMS form of memcpy() to not regress
> boot performance on certain systems when video output is active, we
> first need to arrange for avoiding further dependency on firmware
> setting up MTRRs in a way we can actually further modify. On many
> systems, due to the continuously growing amounts of installed memory,
> MTRRs get configured with at least one huge WB range, and with MMIO
> ranges below 4Gb then forced to UC via overlapping MTRRs. mtrr_add(), as
> it is today, can't deal with such a setup. Hence on such systems we
> presently leave the frame buffer mapped UC, leading to significantly
> reduced performance when using REP STOSB / REP MOVSB.
> 
> On post-PentiumII hardware (i.e. any that's capable of running 64-bit
> code), an effective memory type of WC can be achieved without MTRRs, by
> simply referencing the respective PAT entry from the PTEs. While this
> will leave the switch to ERMS forms of memset() and memcpy() with
> largely unchanged performance, the change here on its own improves
> performance on affected systems quite significantly: Measuring just the
> individual affected memcpy() invocations yielded a speedup by a factor
> of over 250 on my initial (Skylake) test system. memset() isn't getting
> improved by as much there, but still by a factor of about 20.
> 
> While adding {__,}PAGE_HYPERVISOR_WC, also add {__,}PAGE_HYPERVISOR_WT
> to, at the very least, make clear what PTE flags this memory type uses.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> REPOST (in isolation) upon Roger's request. The header location change I
> don't really consider a "re-base".
> 
> v2: Mark ioremap_wc() __init.
> ---
> TBD: If the VGA range is WC in the fixed range MTRRs, reusing the low
>      1st Mb mapping (like ioremap() does) would be an option.
> 
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -602,6 +602,8 @@ void destroy_perdomain_mapping(struct do
>                                 unsigned int nr);
>  void free_perdomain_mappings(struct domain *);
>  
> +void __iomem *ioremap_wc(paddr_t, size_t);
> +
>  extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
>  
>  void domain_set_alloc_bitsize(struct domain *d);
> --- a/xen/arch/x86/include/asm/page.h
> +++ b/xen/arch/x86/include/asm/page.h
> @@ -349,8 +349,10 @@ void efi_update_l4_pgtable(unsigned int
>  #define __PAGE_HYPERVISOR_RX      (_PAGE_PRESENT | _PAGE_ACCESSED)
>  #define __PAGE_HYPERVISOR         (__PAGE_HYPERVISOR_RX | \
>                                     _PAGE_DIRTY | _PAGE_RW)
> +#define __PAGE_HYPERVISOR_WT      (__PAGE_HYPERVISOR | _PAGE_PWT)
>  #define __PAGE_HYPERVISOR_UCMINUS (__PAGE_HYPERVISOR | _PAGE_PCD)
>  #define __PAGE_HYPERVISOR_UC      (__PAGE_HYPERVISOR | _PAGE_PCD | _PAGE_PWT)
> +#define __PAGE_HYPERVISOR_WC      (__PAGE_HYPERVISOR | _PAGE_PAT)
>  #define __PAGE_HYPERVISOR_SHSTK   (__PAGE_HYPERVISOR_RO | _PAGE_DIRTY)
>  
>  #define MAP_SMALL_PAGES _PAGE_AVAIL0 /* don't use superpages mappings */
> --- a/xen/arch/x86/include/asm/x86_64/page.h
> +++ b/xen/arch/x86/include/asm/x86_64/page.h
> @@ -152,6 +152,10 @@ static inline intpte_t put_pte_flags(uns
>                                   _PAGE_GLOBAL | _PAGE_NX)
>  #define PAGE_HYPERVISOR_UC      (__PAGE_HYPERVISOR_UC | \
>                                   _PAGE_GLOBAL | _PAGE_NX)
> +#define PAGE_HYPERVISOR_WC      (__PAGE_HYPERVISOR_WC | \
> +                                 _PAGE_GLOBAL | _PAGE_NX)
> +#define PAGE_HYPERVISOR_WT      (__PAGE_HYPERVISOR_WT | \
> +                                 _PAGE_GLOBAL | _PAGE_NX)
>  
>  #endif /* __X86_64_PAGE_H__ */
>  
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5895,6 +5895,20 @@ void __iomem *ioremap(paddr_t pa, size_t
>      return (void __force __iomem *)va;
>  }
>  
> +void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
> +{
> +    mfn_t mfn = _mfn(PFN_DOWN(pa));
> +    unsigned int offs = pa & (PAGE_SIZE - 1);
> +    unsigned int nr = PFN_UP(offs + len);
> +    void *va;
> +
> +    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
> +
> +    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
> +
> +    return (void __force __iomem *)(va + offs);
> +}
> +
>  int create_perdomain_mapping(struct domain *d, unsigned long va,
>                               unsigned int nr, l1_pgentry_t **pl1tab,
>                               struct page_info **ppg)
> --- a/xen/drivers/video/vesa.c
> +++ b/xen/drivers/video/vesa.c
> @@ -9,9 +9,9 @@
>  #include <xen/param.h>
>  #include <xen/xmalloc.h>
>  #include <xen/kernel.h>
> +#include <xen/mm.h>
>  #include <xen/vga.h>
>  #include <asm/io.h>
> -#include <asm/page.h>
>  #include "font.h"
>  #include "lfb.h"
>  
> @@ -103,7 +103,7 @@ void __init vesa_init(void)
>      lfbp.text_columns = vlfb_info.width / font->width;
>      lfbp.text_rows = vlfb_info.height / font->height;
>  
> -    lfbp.lfb = lfb = ioremap(lfb_base(), vram_remap);
> +    lfbp.lfb = lfb = ioremap_wc(lfb_base(), vram_remap);
>      if ( !lfb )
>          return;
>  
> @@ -179,8 +179,7 @@ void __init vesa_mtrr_init(void)
>  
>  static void lfb_flush(void)
>  {
> -    if ( vesa_mtrr == 3 )
> -        __asm__ __volatile__ ("sfence" : : : "memory");
> +    __asm__ __volatile__ ("sfence" : : : "memory");

Now that the cache attribute is forced to WC using PAT don't we need
to drop vesa_mtrr_init and vesa_mtrr? The more that the option is
fully undocumented.

>  }
>  
>  void __init vesa_endboot(bool_t keep)
> --- a/xen/drivers/video/vga.c
> +++ b/xen/drivers/video/vga.c
> @@ -79,7 +79,7 @@ void __init video_init(void)
>      {
>      case XEN_VGATYPE_TEXT_MODE_3:
>          if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) ||
> -             ((video = ioremap(0xB8000, 0x8000)) == NULL) )
> +             ((video = ioremap_wc(0xB8000, 0x8000)) == NULL) )
>              return;
>          outw(0x200a, 0x3d4); /* disable cursor */
>          columns = vga_console_info.u.text_mode_3.columns;
> @@ -164,7 +164,11 @@ void __init video_endboot(void)
>      {
>      case XEN_VGATYPE_TEXT_MODE_3:
>          if ( !vgacon_keep )
> +        {
>              memset(video, 0, columns * lines * 2);
> +            iounmap(video);
> +            video = ZERO_BLOCK_PTR;
> +        }
>          break;
>      case XEN_VGATYPE_VESA_LFB:
>      case XEN_VGATYPE_EFI_LFB:

I think in vesa_endboot you also need to iounmap the framebuffer
iomem?

I would assume this was also required before your change, yet I'm not
finding any iounmap call that would do it.

Thanks, Roger.

