Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA6057A833
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 22:29:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371160.603002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDtqH-00010a-29; Tue, 19 Jul 2022 20:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371160.603002; Tue, 19 Jul 2022 20:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDtqG-0000xy-Ur; Tue, 19 Jul 2022 20:29:16 +0000
Received: by outflank-mailman (input) for mailman id 371160;
 Tue, 19 Jul 2022 20:29:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LuP=XY=citrix.com=prvs=1929f1d84=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDtqF-0000xs-D5
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 20:29:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73683edf-07a1-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 22:29:14 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2022 16:29:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5676.namprd03.prod.outlook.com (2603:10b6:806:116::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Tue, 19 Jul
 2022 20:29:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 20:29:02 +0000
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
X-Inumbo-ID: 73683edf-07a1-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658262553;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dfd9Qg21koYFJWiBMBhFrh7igxUgJod9k0RsrkbG4TE=;
  b=N0yhboaGd7BrzOH9kGjJXVI+9itqBuGaKI2XP8wgh+2FnRLh7+D7nSOM
   2m2QYKxO35hgpevDwNqeRQu482+xJmSiNzb+fj+bm2Hz8PlWPQ7J5Vtmg
   56zV9WHpZ9S7Px3nMNpdGLg8zJo76BRORkwPreoFbh5+PF79KsgmSH5Cd
   Q=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 78740272
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5wc4h6/9+I8Qd4wqzk5YDrUDtX+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GIdDDzVP/6KZ2T1KNtwbYW2oRtU6JOBx9RqTVBsqSw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gVaYDkpOs/jZ8Ew27ayp0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGVhgLOYoC3OFNIUJX0
 /YFBiodfzuhvrfjqF67YrEEasULCuDOZdpakFcwiDbTALAhXIzJRLjM6ZlAxjAsi8tSHPHYI
 c0EdT5oaxeGaBpKUrsVIMtmwKH02T+iI3sB9gP9SakfugA/yCRY1rT3PcWTUduNXchPxW6Tp
 37c/nS/CRYfXDCa4WXVrS703LCV9c/9cJ0sJbKg+fxOuWGC4WwfOC0IX3GEhebs3yZSXPoac
 ST44BEGr6E0+Fa6U9rVUBixoXrCtRkZM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht9HjCCFrsbaVYWmA7brSpjS3UQAKKUcSaClCShEKi+QPu6k2hxPLC9xlQKi8i4SsHSmqm
 m7b6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHa1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:fp1UH6mcZ0O4Apl83G57Hs9xuKTpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duv22vaIJy4EUbICbQhGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.92,285,1650945600"; 
   d="scan'208";a="78740272"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKtnHlgKYWGyTCrBwIF8d+l92oRf5aNc4VFDBmvlGyqI/jQYINDWxSYik6dj/09gwlIatiJ84aDIoLiLkOMNbLujsbviaAqvDtlYohtlE7B51FvTa8dmIVGp3fbEpIGNPWw7OHLUGa58FRrC1PSSbjmSUhlXGki0hjnXytuwaeV0FSi+goLYv+5xptRrZdUr4BSoeARJrIHyAru2Q2kJDj5dhgzMgDTnzwrtKF0NChonHu1p0EnGxQl5dWYOFGcVjNgQMY+5cQS5tl8TUY+uLR90XWGBABDzSmm/76T8I39Nvzx82jOpwktLJ4etwtoHaFLEMmTusFxducOu0C21zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfd9Qg21koYFJWiBMBhFrh7igxUgJod9k0RsrkbG4TE=;
 b=kCmHvHFJIE20xjLfjBHqFVUBy/awlBmoFNq05an4neULizG7T026PNBRVdRe6m64Fys+bs1PRNWAetn3afMTbwpJV0BmNtD3jDNFCJ0R+V5zvCg00xnmvxt/qZKZrTOoW5qUjRJ32OYIPCp2BZCZcoEd44PE0bu3X0Fi29diPZ0P+TZ1Ecq+OyqkZo0FbYAv6R/dSCjsG9QfR8ktQjXwI6b7TQRfRjVzJRBvARoZvIR/Tta5iUsB2MdP1V1CXkuysdMJ/OtQvKwoSPrq9A4hV6KGbAyYCRw+UjWh3+j2+SPgOUyeoLs22s/Hx9iZfGrJD7bI01qbipomwZQ/w8kYIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfd9Qg21koYFJWiBMBhFrh7igxUgJod9k0RsrkbG4TE=;
 b=wczjExH7fRgvS3qe2H2HOXYUYpwYAoc+MRSAXGEuHS/VDPTa4HgMEAWcRsPjSp67vEezVZpy/4Fku2yXAoOaTClw2kd3r8Z5eJPwbHSo3IU4kpSUhZEJJw977um3POt5Ji7LHUnHbEWuj3U36/PrljgB+pa/bggbFm0yF6KOPwA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: Expose more MSR_ARCH_CAPS to hwdom
Thread-Topic: [PATCH] x86: Expose more MSR_ARCH_CAPS to hwdom
Thread-Index: AQHYm6tQOqkwxP1MXkWBPUBpFSB52q2GJQcA
Date: Tue, 19 Jul 2022 20:29:02 +0000
Message-ID: <5a1e78c8-1982-f787-46a4-7197b23d53e8@citrix.com>
References: <20220719200815.69884-1-jandryuk@gmail.com>
In-Reply-To: <20220719200815.69884-1-jandryuk@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b325d08c-a3b9-4c24-e7c6-08da69c551c6
x-ms-traffictypediagnostic: SA2PR03MB5676:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 O1MlW1hOigqa9yj26JRqx8OmVC1oUW6IVV+iW3qMiLALUbbbgx7IJf2BHInlhUJ9T1xN+bzaSpvjX84Cr2mNTZiJG6b89GbB7FRR34cR8umKDlT/OXXRiEhgoC8y1MILw9GUzZyf93zagU/LMDcYIu7T5wkXqgF4f5G8NFKe7ZJrPsh4n4i9MtUS2JuqzB1oF5X/LrqddraAPz0nqxbtnG2XwFdP9+OuNpDJwZkZN7ZZfWExgDkVaqVx7KcUATmF72Yh7CExncUxdP6WzBAUson+JDz3hnoNqTAdkdnwrD8mbW9w0xkZBQ46iRH0uYNQOfHfc4x/aHY/HOApamd0j1fvlaDsaIyasRw9HDFIgqzsvvd44Km26paoNHlyPgR7V7mxjYO3TYKK7R99Jh7TTmSCgjYOwW50bi3mEqB0AxQu0IlSqhbxby24d0bmQO+DYIDiC7ZL2RamsfPmORVKhgvWSYaNmQ0+Mx4qPsJGNFQpXzafR7OXNOk0c0F6QYDR7hjbNEuNTzHV6V3cH7FvG41lJaQg1jpiHeDtEtQQMR8Ea0DwtsM2tInCO40wtusVu2PlOV70xFSiebrv3EFwwsa8OO9CmRHdFlfYjN9w2dbR6OYH3iFWLYB/WE+g/1SczGfY6Ew2rmhpq4s3Y+bdsu1N+SvhLINkfxrh081q0ROgqM7dvVheKVjqajA+Wf/uKGpg3RFWXM7lgufRs9wHKeUsksB7Vz/0eGL9sVYFp5yH17NRS+b7kW+XRZAqS+0vxyQOuGyZAySen7QhJOJaMxpkh9oCkYE2CRajChvPBB5oYHKko9I5YOrExoKB2zt7GHhjE2zeydGKZSgc4N+b7pQeMyDgc4MAsMSRNzoOL01hQiaymIsLu2qVHbIMdJHV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(41300700001)(5660300002)(66556008)(76116006)(66946007)(83380400001)(91956017)(54906003)(64756008)(38070700005)(8936002)(6512007)(8676002)(66446008)(26005)(53546011)(66476007)(31686004)(316002)(6506007)(36756003)(110136005)(31696002)(82960400001)(186003)(38100700002)(2616005)(478600001)(86362001)(71200400001)(4326008)(2906002)(6486002)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDMyeVk0RmVrbHhWUDlRWDFpWktvMmlJdGJQVUdFY1VOd1ZjSDUzMGo3U01R?=
 =?utf-8?B?a0VWc2xtM2lsQUd4OTd1cXMxMWRwZm5UcnZVZVMyREl1Tnh0b1N3KzJWYXpW?=
 =?utf-8?B?RlJObHBtLzFEVS81Umt0NVo2SnlMQ0JuNGJoNTE2cEpxVlFzU25TZ0xEanFR?=
 =?utf-8?B?NlQ4aDRzYy9yMjJWTWlwSFBlKzRybERKcTNzWDlGNTE3MWZFMjZjZmFjUVA3?=
 =?utf-8?B?V2pjMjErUitzelV3bm51UExUTm1waEFWNjg2bWg5aEZZSHJwU3RjdWs4V2xi?=
 =?utf-8?B?WW9hN0w4TjFlMVNHcWljNFNpZ2hwV01BUmpEdU1Nd2w5ZlFBR2ZHcjlrWE82?=
 =?utf-8?B?VDlvM3VKQXJ0TkN5RitCem11VTM2WWlJOGNiN0hoc1I2WUxpZFJuS2UzTWJL?=
 =?utf-8?B?MWlqRzdsUmhFQkdlOHNISHRETkJ2WFBIcWlYRy9xVkxES2EvRDRrZFg5N3Ny?=
 =?utf-8?B?bnE0ak52UXdVNzlGblZsbk9GcFg3dkZMMWVTVFZKLzJybEdEdWVVQlFJTGs2?=
 =?utf-8?B?Z2NDRmQyVzJ2NVZ2SnFVL3N4Y0lxOHNQSWhxTnF6SG5LVGQxVTNWa3UxUERM?=
 =?utf-8?B?VWNIZVpnVEM4NnJFY1Z4SEdHamduWm9nMitlb0hhRFRCemltdjNkYkZJVzJH?=
 =?utf-8?B?RHJUT2lJbE1JOWFNZlBHdEE2a2lRTlNQdXBSdWJjVVRWeWt3bHhXclBqREhR?=
 =?utf-8?B?L0ZVZ0UxQVFNb0U1bzdyZWRIbU5aR3Y5ZkhJRENhUU9aZXAxaVJ0a3pXa2xn?=
 =?utf-8?B?azh2cGVjYkJsZmZ3UkxzUVk4V0g1VExVZWkyeEc4R2tkZUZLblc3OVVzVVkv?=
 =?utf-8?B?cmdobys4UU1HRmNPRm1ockRqb0U0SS9idnNaRXhaUkJSazRkaVNDRmpQbkNv?=
 =?utf-8?B?ZWlreDJkcGx4a2VjZnN1S1A0dzdaTE5YdTZvSHkzNDIyRzVKKzFzRXdXZFZL?=
 =?utf-8?B?V3VzMDhuNVB2MWNkck13QUFrd1JmeWg2VlFyV3JnZEhSM1ZVVWoxWk5pbnh4?=
 =?utf-8?B?SzVKS3RZV2c4c2lGUHdHdUs4S2tnYURsc1pIU3IxZ0hNeXN3MjFNbXJEMFph?=
 =?utf-8?B?ZDdORlc4T05ERG1zdmZ6eGpjd09vRUxpK3FWYnpSSTdCZzhDRC9OSEFXVENu?=
 =?utf-8?B?aXorMkNEUW85SXI3VlRWUjd4cEIvdzluS1RqbDZXc2VSSzZMSmFTcHdGMktE?=
 =?utf-8?B?QVV1NHNCSk5GWE91anozdEJYQk5QclZiT01PYStOMlViOWk3MHIvbHdtOTlY?=
 =?utf-8?B?cCtZeHhtaW5QbFFxQ3dDSVZzMDhMc1o0WjR2RmVDLzRWempPN3l6ek56djNX?=
 =?utf-8?B?RjZtVkpFdDRJS2VRMFBFRWh4SDRsRDRpTEpqYmJZVnQ2dExvSThTV0FZaWlD?=
 =?utf-8?B?d3hPUUsvR2VGUnp1K2RlMktsZFpKbURydGsvSVN2M05DelpGZ1JESzczdjdm?=
 =?utf-8?B?NENDWjcwL05vUk02MUZ0V1NkOFAzQzJybHpRQ0VrWEF3OEZiYmgwdXVBcHFm?=
 =?utf-8?B?RjNpSjZYSlhwOWZDM3hmTms0MGR0VmkwYXdQcmdNTDRiZ2hOcTlQY3NsZFli?=
 =?utf-8?B?T1FpK1oxRmxVUzRMUDNTOHhzYjQ3eU9oUW1na2xBSnJ2RWhTWStMTHNQUmh3?=
 =?utf-8?B?SW1FcytWNnJGaEo2Ni8wYnpBckc4UDZCNnhkaXp1REg0d05uVkZ3Q3JZOExj?=
 =?utf-8?B?bEVHWFZ4Z1dEcXByaUJKRzFsazlER3Y4azFWcFRUd2JOTkJ6djVUdzRJbDk3?=
 =?utf-8?B?ZjNhQXN5a2dURDJlRldWQmd6TTR3dzBxR2xTanJKdElOMlVxaENLdkhubnpp?=
 =?utf-8?B?UzFnWTJBMDJtWXozcHVqM1Qxb2dlQjEraWw4NndCMytqOTlCK2F4eldCelhw?=
 =?utf-8?B?Snd3bGk4ajA1bTdSNUpuNHNoZlhjK1VKR1Y1OXpvRnlSc25BOUFyWVBwNnU4?=
 =?utf-8?B?REpoQWlvWjkyRFhxTkZMMDc4U0tnWEowcUdVeGFFaXJOV2FkQVZuc3NPdWNv?=
 =?utf-8?B?RFl5K2Q3clUySTZueUpWeWdVWC91SWJyclB5Qm5kT3VEcHNjTklUWnZRQjZF?=
 =?utf-8?B?cnRwSlVQMEo0MFVud1hKcm9qTTNWdVNvSlBiTEttT0xOTXVwMjNpQlVRc2RN?=
 =?utf-8?B?eGVUQkFNWHR0RkNRU2w0UnlWWURnQ3BTYmNrekMxMkZHRnFYbG5yM3k2Y1ZL?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC2842A21BE5944AA5C2A98E198DAC64@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b325d08c-a3b9-4c24-e7c6-08da69c551c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 20:29:02.7341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3NDH39LDHsGT08cm0VayscgM9DqrXNtVn50oV6hrthDNCWHaI9/DLnwSUgE2AuV3dCNu6QP25uB/ldDaa72bS93qt1oO96odzN5Q3zlMy4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5676

T24gMTkvMDcvMjAyMiAyMTowOCwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4gY29tbWl0IGU0NjQ3
NDI3OGEwZSAoIng4Ni9pbnRlbDogRXhwb3NlIE1TUl9BUkNIX0NBUFMgdG8gZG9tMCIpIHN0YXJ0
ZWQNCj4gZXhwb3NpbmcgTVNSX0FSQ0hfQ0FQUyB0byBkb20wLiAgTW9yZSBiaXRzIGluIE1TUl9B
UkNIX0NBUFMgaGF2ZSBzaW5jZQ0KPiBiZWVuIGRlZmluZWQsIGJ1dCB0aGV5IGhhdmVuJ3QgYmVl
biBleHBvc2VkLiAgVXBkYXRlIHRoZSBsaXN0IHRvIGFsbG93DQo+IHRoZW0gdGhyb3VnaC4NCj4N
Cj4gQXMgb25lIGV4YW1wbGUsIHRoaXMgYWxsb3dzIGEgbGludXggRG9tMCB0byBrbm93IHRoYXQg
aXQgaGFzIHRoZQ0KPiBhcHByb3ByaWF0ZSBtaWNyb2NvZGUgdmlhIEZCX0NMRUFSLiAgTm90YWJs
eSwgYW5kIHdpdGggdGhlIHVwZGF0ZWQNCj4gbWljcm9jb2RlLCB0aGlzIGNoYW5nZXMgZG9tMCdz
DQo+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L3Z1bG5lcmFiaWxpdGllcy9tbWlvX3N0YWxlX2Rh
dGEgY2hhbmdlcyBmcm9tOg0KPiAiVnVsbmVyYWJsZTogQ2xlYXIgQ1BVIGJ1ZmZlcnMgYXR0ZW1w
dGVkLCBubyBtaWNyb2NvZGU7IFNNVCBIb3N0IHN0YXRlDQo+IHVua25vd24iDQo+IHRvOg0KPiAi
TWl0aWdhdGlvbjogQ2xlYXIgQ1BVIGJ1ZmZlcnM7IFNNVCBIb3N0IHN0YXRlIHVua25vd24iDQo+
DQo+IFRoaXMgZWNwb3NlcyB0aGUgTU1JTyBTdGFsZSBEYXRhIGFuZCBJbnRlbCBCcmFuY2ggSGlz
dG9yeSBJbmplY3Rpb24NCj4gKEJISSkgY29udHJvbHMgYXMgd2VsbCBhcyB0aGUgcGFnZSBzaXpl
IGNoYW5nZSBNQ0UgaXNzdWUgYml0Lg0KPg0KPiBGaXhlczogY29tbWl0IDJlYmU4ZmU5YjdlMCAo
Ing4Ni9zcGVjLWN0cmw6IEVudW1lcmF0aW9uIGZvciBNTUlPIFN0YWxlIERhdGEgY29udHJvbHMi
KQ0KPiBGaXhlczogY29tbWl0IGNlYTlhZTA2MjI5NSAoIng4Ni9zcGVjLWN0cmw6IEVudW1lcmF0
aW9uIGZvciBuZXcgSW50ZWwgQkhJIGNvbnRyb2xzIikNCj4gRml4ZXM6IGNvbW1pdCA1OWU4OWNk
YWJjNzEgKCJ4ODYvdnR4OiBEaXNhYmxlIGV4ZWN1dGFibGUgRVBUIHN1cGVycGFnZXMgdG8gd29y
ayBhcm91bmQgQ1ZFLTIwMTgtMTIyMDciKQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRy
eXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+DQo+IC0tLQ0KPiBUaGlzIGlzIHRoZSBicm9hZGVyIHJl
cGxhY2VtZW50IGZvciAieDg2OiBBZGQgTU1JTyBTdGFsZSBEYXRhIGFyY2hfY2Fwcw0KPiB0byBo
YXJkd2FyZSBkb21haW4iLg0KPg0KPiBJdCB3YXNuJ3QgZGlzY3Vzc2VkIHByZXZpb3VzbHksIGJ1
dCBBUkNIX0NBUFNfSUZfUFNDSEFOR0VfTUNfTk8gaXMgYWRkZWQNCj4gYXMgd2VsbC4NCg0KSSBk
ZWxpYmVyYXRlbHkgZXhjbHVkZWQgSUZfUFNDSEFOR0VfTUNfTk8gYmVjYXVzZSBpdCB3YXNuJ3Qg
cmVsZXZhbnQuwqANCkJ1dCBJIHN1cHBvc2UgTGludXggaXMgbG9va2luZyBmb3IgaXQgYW55d2F5
Pw0KDQpJRl9QU0NIQU5HRV9NQ19OTyBpcyB0aGUgbW91dGhmdWwgbWVhbmluZyAidGhlIGZyb250
ZW5kIGRvZXNuJ3QgaGF2ZSBhDQpzdHJvcCB3aGVuIGl0IHRha2VzIGFuIGFzc2lzdCBmaW5kcyB0
aGF0IHRoZSBpVExCIG1hcHBpbmcgaGFzIGNoYW5nZWQiLsKgDQpJdCdzIG9ubHkgaW50ZXJlc3Rp
bmcgdG8gaHlwZXJ2aXNvcnMgbG9va2luZyBhZnRlciBhbiBFUFQgZ3Vlc3QsIHdoaWNoDQptZWFu
cyB0aGF0IGl0J3Mgb25seSBpbnRlcmVzdGluZyB0byBleHBvc2UgdG8gSEFQIGd1ZXN0cyB3aXRo
IG5lc3RlZA0KdmlydC7CoCBFeGNlcHQgd2UgZGlzYWJsZSBtaXRpZ2F0aW9ucyBmb3IgbmVzdGVk
IHZpcnQgYmVjYXVzZSB0aGVyZSdzIGENCmJ1ZyBpbiB0aGUgbkhBUCBjb2RlIHdoaWNoIEkgZGlk
bid0IGhhdmUgdGltZSB0byBmaWd1cmUgb3V0LCBhbmQgbm9uZSBvZg0KdGhpcyBpcyByZW1vdGVs
eSBzZWN1cml0eSBzdXBwb3J0ZWQgdG8gc3RhcnQgd2l0aC4NCg0KSW4gcHJpbmNpcGxlLCBUQUFf
Tk8ncyB2aXNpYmlsaXR5IHNob3VsZCBiZSBkZXBlbmRlbnQgb24gdGhlIHZpc2liaWxpdHkNCm9m
IFJUTSwgYnV0IGdpdmVuIHRoaXMgaXMgYWxsIGEgcGlsZSBvZiBoYWNrcyBhbnl3YXksIEknbSBu
b3Qgc3VyZSBob3cNCm11Y2ggSSBjYXJlIGF0IHRoaXMgcG9pbnQuDQoNCn5BbmRyZXcNCg==

