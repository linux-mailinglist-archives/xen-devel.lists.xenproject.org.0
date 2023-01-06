Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D93E65F962
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 03:04:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472283.732456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDc5Y-0005uw-7U; Fri, 06 Jan 2023 02:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472283.732456; Fri, 06 Jan 2023 02:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDc5Y-0005sx-4J; Fri, 06 Jan 2023 02:04:08 +0000
Received: by outflank-mailman (input) for mailman id 472283;
 Fri, 06 Jan 2023 02:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDc5W-0005LO-1i
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 02:04:06 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64263892-8d66-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 03:04:03 +0100 (CET)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 21:04:01 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5162.namprd03.prod.outlook.com (2603:10b6:5:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 02:03:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 02:03:59 +0000
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
X-Inumbo-ID: 64263892-8d66-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672970643;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZHeOMSQywW2NTLeKBWaSVPj0grpZVg+YVmImQT2V6Uo=;
  b=iAK4+TIk7ZZ/pk0q0ikgq8cx7A7/5xDfNIowJrCLod3KsypndzUXhE1g
   ByHIbi8vi2mICf/Zcenv5gmclwNQRnQLXIyzx35HtAadT8jOEqslgR1M8
   wkpQ0oPFdvsST9wVrslykwf1xkjdQOZUivS1uMzRX9z6deoZPjGoqRBH9
   o=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 91823839
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Xy5d+aCDG/WEBhVW/xjiw5YqxClBgxIJ4kV8jS/XYbTApDMq1T0Fy
 mpMW2HXO/uNYDanfI1yPNyz8U8B6pDVxoMyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6p4GpA4wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwwvswW2ZXs
 s0heBdWcEu8juyTw4uHc7w57igjBJGD0II3nFhFlGmcIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuuze7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6WzXmgCNlDfFG+3tpSvgOr23IyMh8be3KjvPKrulWuCvsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluaJSkQBX8PY2kDVwRt3jX4iIQ6jxaKQtM9Fqew14XxAWupm
 2/MqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgPpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:Y2b5N6pNurjA8vGv/2n3SOEaV5oaeYIsimQD101hICG9E/bo9f
 xG+c5xvyMc5wx9ZJheo6HlBEDtex/hHOdOkO4s1NSZLWrbUQmTTb2KhLGKqwEIfReQygc378
 ddmsZFZuEZ8jBB/KPHCQODYrAdKHDuytHQuQ7W9QYUcT1X
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="91823839"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXxZGYJTLZKwAG0Q5EA8XxDz9HOMkTmpeIgS8gbRrifJE3CfsgaOBXYuNhFmXvwxrNYGnE3CiSEI4UrBMwQEOcyWdSVcL1EYLkmJ670oE9dS94bGkZySlZaiUtdnfNJZUFg+lEaQC6eRfXos4y/zLLWTrXrvQufv4r8gf5pZRI0Fo+lg5jsouL8u5vEbmZMRa8tLUCjeCdavN9dVI5Q4+VWnDApXVSg4kIqQqbes4luxgaY7CkaNCJHt82zJacrKcM8SpZGKvvdQRXazS+z+t+PeAaTnPLIrGITX9wobhsLOFjZ2h/5GXLLxbyfXhyDH732qflND4C/cY0Uety/HXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHeOMSQywW2NTLeKBWaSVPj0grpZVg+YVmImQT2V6Uo=;
 b=F4jc4xG86ipihN3KWfOT8ihmCHPSbT+Zofto1dc0KzSUOn5WhtMtUI4Ll246LVoqq5dwsLlHEy0t5jeIHA+yDjTj72NvtZZdpkroj3Ea7pdrijlpxFZ80kQ4Y7TldeALk70QdkNx5hkN8Y/ajKaFemcqwBpKIVA5KokMUex9Mx09xcRHwTQ8ohpxtACGwpTjzxYwmkaaz+5UAj1zkseOM/rScKIvf+P3NcIKaSH+ZYEiXL8DCa7I3tM7k/mI2293odg1acRcTCJ3z+Vkd12LufFHx3fMmeZwgXSXXiwQAj9ki27J0dWOnW4rBJwbAR7qCQB59Awrp0HcWWxUdixi1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHeOMSQywW2NTLeKBWaSVPj0grpZVg+YVmImQT2V6Uo=;
 b=KZoHF1BSiVE1njAGPTjjpTq4yyCO2ZR+TO7qswTyFUEYLeT9adH64iNbdtykn9ga6p9o30bmmWej/PJcbaxbDmYrL6XCNJULLlFKCHqTWrbr4GXcG2XrGhRbbwabuzd85YMFXyGlDWZ55F84YmDMt2EWJIK56qRjbBqHB/MFY4s=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 00/11] x86/shadow: misc tidying
Thread-Topic: [PATCH 00/11] x86/shadow: misc tidying
Thread-Index: AQHZIR54p1+0rBg1XUyPGnzUS/cXvK6QpAqA
Date: Fri, 6 Jan 2023 02:03:59 +0000
Message-ID: <2e261172-76b3-936d-e95c-e12ed6acf7bd@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
In-Reply-To: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5162:EE_
x-ms-office365-filtering-correlation-id: 2c48cc74-d03f-4fe9-d4e9-08daef8a46a9
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dz5fwdiBu9cLqBv14/BMXOXc3QxZPzIsc0yARruOdDRnUTYZWNPABrp9baAWxoirtFzTnw9NP/mJE4cEVHt6L+pGP5giTi2uHQMSuwHuJnLt+A+/pHh/DBFpVENBv2V1Kqj6cjPr38aAAqJZzhHXJvZ55YzvFGoDp6kvbZ/mFW77bNN5RJ0firuH8fWXH9Ho2pJhlqFJRfORBCLMSMN7MI6k5eiGtTgxmAaujXOlKvzBYC/K5FsQW6FJGiBeldU/SCQjPaQ/Si/Tw12slllSZ0FUcXtYufeYw9/fFqxM/He/DTckVf0Z2mGnnTNt0JwSc1jpC+yTNHBviBXLfuENnlo3pQJK3lifBFNeCvvwrBF749L2x5rHkTZaUky7JXf6G9kme7DkwA5FPknrk9mXvcFWs/xvs1pyET/6UT0L1X9PqDAJUyfwmD5yxh/KcyzedzffkkmZ+IZEl61wiVR711/9rhkHl21mGQI6zABd4Q3YRjpM9EdpYDerymkxlvODFEv71rh0bRlf7H9bnLqfbxXqXoq4ksXEXjOclc6SnuO2ZrXLyT1s2SqdarZP7winZ1dY31g1ZGURhq+tJxBvgdGL+tCcHyxGpQgxkobOpZ2uI8Fm9iuc97eQGTZnOj+1rpV/P0yXZZjpOyMdYXpe/1QYSIFSRUCSLzngGpq38zoVKgO56YMCZ+sTnG7YklT1saJpq9N3XmPYkknY3IngH0AtD9msURd1FyXvcveKDM+Q0XohMOIRD9xy4b0lIIJLvYw0L61fJrWn9FIGYTWjBg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(5660300002)(4326008)(8936002)(31686004)(8676002)(2906002)(41300700001)(71200400001)(66476007)(64756008)(66446008)(91956017)(66946007)(66556008)(316002)(54906003)(110136005)(76116006)(6486002)(478600001)(6512007)(6506007)(2616005)(186003)(83380400001)(107886003)(26005)(53546011)(122000001)(82960400001)(38100700002)(31696002)(86362001)(36756003)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WXNpZDV3RGJBWnFYWTN5dzlWYmozS09lMG4wS3l2VlRYdGMzVTZvSzdPVll6?=
 =?utf-8?B?QVV2enE4Wm1zbjdpcUVjcnNTRGdNWW5PSy9Ya2h5QzlzdUVmTHdUcUkyWXF3?=
 =?utf-8?B?Y0F5V3dhR3JOSnFXZzl0bHpsSDA0Sk9PNWttRkdjYVBDUnNwSWM2dENtWnV1?=
 =?utf-8?B?a2Fud0xySDZIZ0ZGbDI2MVZyTVhKNERTUzVjR25uZzVFc3NkQ3FWUlduN0Qz?=
 =?utf-8?B?V3ZEMXdZTVZKWThTcWZUK3M0MVhzOE1URlNNZG1uR2ZTa0J5MExWK013T0Vi?=
 =?utf-8?B?RnViWjBsdG1XcmVXKzZxb3pSM3RZcUFJU2Q3WjFZSnRaek56a0RNZU8zSlBL?=
 =?utf-8?B?aDRHV2diQ2RYQWxJU1ZZQWlnS0FQQ3BLN2poMTJxWUFiOS82cTFoL0tpZGM4?=
 =?utf-8?B?SVl5RVZiOUxLdGc2ZktUODNFd1lJOVpVRjBaZmJQbS9VVUtqb0Zoajhuc2ov?=
 =?utf-8?B?L1RPN2VjbThCMC8rSG5TbzlYUHlJSS8zSGlGYlpjc2xvNDV6eVRHZGN3MUw1?=
 =?utf-8?B?MGJmclBJeWZnT01UYy9wSkUxQjVHbE45WUQvV1lTbzVBdDc2YlU0YzVFeWh2?=
 =?utf-8?B?NEJYS2pIdzZTTVdSZWJtYXgwWmlOM0c3VzRWcjVaYVpMUjF4UjRTdEhReERn?=
 =?utf-8?B?ZHJjNkoxT0ZzK2VFd2VEU2cyL2c3UTF5Q0lrcHY2TnAvNjVMK290TGRSZHJO?=
 =?utf-8?B?WUNlRDMxOTU3MzFxY3cwejBudHFMY3FRM0RDZUdrSENmdGt4bEw0UnJYZjl0?=
 =?utf-8?B?ZEtlS0ZPYjc3ZXMyWTRVbUx3YS9MSHAzWU1kU2dVaS9xdXg5dEQ4dkllL2ox?=
 =?utf-8?B?L2I1L014K09LR3hhT1RtN1podjBaVU1XQzEybEdGT0ZrcEs5QkJ4bXhJbTlV?=
 =?utf-8?B?cElGQ2h5bDdHTzNPVGNCTVhlWWZnWWV3VWUvRUgwSGJTazl4TEJSeFhMeFJI?=
 =?utf-8?B?VzVyREJZcFAzY2FwYTQ5eWhBN1FHUjNGR3JiZ04xRFV3N3FLU1ZaSllaSmU0?=
 =?utf-8?B?c3pLUERXOElFektYVGRFOU5iWUprRGJVRXRpUEp4SVJPRzk1SkNYRHBjci9n?=
 =?utf-8?B?MGNPMm5qb2g3ejdFaGtLQnlXVFdvbEZ5WHpjWTc1S0xMM0pMZ281UW1tSU5o?=
 =?utf-8?B?a0FDdk8rblM5Rm5WcUYzY1RhZFBGWm9vcmZ5TUdodTB0RXBQZnF1cnVTNngz?=
 =?utf-8?B?bUV2YmtFK3RTQ3ZUSVc0Kyt6RUtuYnpiblEzZDZpNk9OYmMrWktmbEFOZEpH?=
 =?utf-8?B?NHV2djFjcUdhbTBxS2hUWlAvNjJ6OUlrZVBEakRqVHl0UjF4Yk5TcTdpR3Uv?=
 =?utf-8?B?ZmJNWnZBRXl6aERNRU9Fcjk5bjlMRTAwSTV5U3ozTnhVT2x5QkNlemxTbjM1?=
 =?utf-8?B?VXJiVDRGdFB3OFJ2dzlMOHRROHd2V2tjMzR1WGx1aG90NHl4UWFMcFpYUVlh?=
 =?utf-8?B?Yk9RR2JPend2RTd3ZE1mMFJuS1dvVllpdHM3UTRqdFZKbWlick9Wdmp5VlJE?=
 =?utf-8?B?dFV3MUMrYzFrNlg2WExrbDFqK0J5OFZWeWJldXlDNzBHa21USkExbUx4ZlJE?=
 =?utf-8?B?WlFnbDRyZ3Z2NU0rYkZZbUgrK1RjUk9jMXNGMUo0cFR2ZnpQUU50WmRTaTlF?=
 =?utf-8?B?TzhKaGE1U3NKdTRidi9naW14aUlNQU1CNGIwaXJtSC8vTGhTK1dNUHVDMkxj?=
 =?utf-8?B?S0JjSHQreVR0eE03SXVVa0FwcFcyTEVEY01LOHFKT1BtVTNkeGZ6dld4LzZr?=
 =?utf-8?B?cjVRR2pDV1dWRFF4dElJbGtWTHpUVFpmYy9yZnJoY3pJWk4yU2NCSm9rdUFk?=
 =?utf-8?B?alFVdVN2bVVuajQyb2QrWDVaOWtZUy82dFJOSXZQSXRldU93NGtJd2ViNnNJ?=
 =?utf-8?B?SldvL3dCMXQvTTNXdmN5aTVtYmZiT3dSNWorcERwVGFaaGF0cWtOU1MwVHEw?=
 =?utf-8?B?VW11WWNIa2RDcm1SUGV0cmFUOERCdkliTHdYVlh1UHlhc1VuZ1UxZENjSmpz?=
 =?utf-8?B?S0t4YmdURG1RZi9PTlhqaTVFQVRzUHFmM3QxaHJhUFN6QmNBY0E1ZysvSFRq?=
 =?utf-8?B?UUpwU1daT1p6N2FCeDhIdEUyc3RPcXU0UUcxMGlmOE80QnRlenVpc000T3do?=
 =?utf-8?Q?aJEvNMrgxEfIKhd70CKmi7tUh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EAE227FBBA47F040A9464FCB5CDC828C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wdfGT9vTdyWvZoIZk62splpgef0lKnxDHXkbPy2HA7xUtEPHGjbIVLzQDT+boh7zBfSLj9ZDV3+tMNDmXxTScCiXykCZ8fXW2C/W0Ea3NjohGdDbm4Ug/aDqpEbQpNiNeOUdtT5LsV/e2dlJAH74DgPVWsqLhnzp+3UvLWBklQB7jIt6AEysVkgOnrcIE01XidF5WMh+t3ERP5JHfkRm5XPdcm6NIIfXYqYOb2ohCb/DCEdE8+Gl3okivv+BSJSlsu6j6KPHD81Mp3Kn2NH+AOBBOtHF+Ni6MYToAvusRx0TfdyqR5orcBdIGfmqfIIXaGklPVn9i4uKNRY94ScHb3sjoa308CyZr7NTNIfhizo7jc+wXn0ZnSz93VWMKsNAj5oiqbDysszX4A+qdt4FSLgPRB4X0bezEaFqhAs+7yKi4EKqw0oAYFSUc7XNcps3146vyU7DfJRaNDxmMGswBsoADMqvXg7/uniEHR+n/aWksNlbaWfxbmT/nrDZZLXCk2/GcVTCUQUTNxkjbJVgLHiGqBeM1LgNkuu8ixQnH4xlm3m9OL6D7efbTLM4frWOyFTFh0Uzprn7cPdYZYImT6qfRDXq124clI4cMsitBpOtUn9kC8XbbrWL/fdDzMQgvuYr1YtgQynOwqj3E5W5zdPiYMIS7xNC/J1KYT+eWMMTL7Gw3MzPwQcjCfs1zpTLiurYGFlLWEchkRttDvZAzMvIZbbWvHXSGYj6xuRx3c5wAu6+hn+cBcDfyQXD8eK8yCijsdffjJpLgdS41PJtgVs1DqvSlXBPmKM4kskamlo/3g80sG5pmHp22XbmWMzZKvntj37heTS+A2brCfEYSg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c48cc74-d03f-4fe9-d4e9-08daef8a46a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 02:03:59.6094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6BTaOhygdNgILOORG6vr6r/ecbiEQdNOQyxGgWPx4G6HC37lnhzX+nKdjGwE0P49bHa4viw039Gxoj6QC3ChSmp/Rjq978Cyc0t7ybkhGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5162

T24gMDUvMDEvMjAyMyAzOjU3IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gLi4uIG9yIHNvIEkg
aG9wZS4gVGhlIG1haW4gb2JzZXJ2YXRpb24gd2FzIHRoYXQgd2Ugc3RpbGwgaGF2ZSBib3RoDQo+
IGhhc2hfdmNwdV9mb3JfZWFjaCgpIGFuZCBoYXNoX2RvbWFpbl9mb3JfZWFjaCgpLCB3aGVyZSB0
aGUgbGF0dGVyIHdhcw0KDQpmb3JlYWNoDQoNCj4gaW50cm9kdWNlZCBpbiAyMDE0LzE1IHRvIHJl
cGxhY2UgdGhlIGZvcm1lci4gT25seSBzb21lIGVpZ2h0IHllYXJzDQo+IGxhdGVyIHdlIGNhbiBu
b3cgY29tcGxldGUgdGhpcyBjb252ZXJzaW9uLiBFdmVyeXRoaW5nIGVsc2UgYWRkcmVzc2VzDQo+
IG90aGVyIHRoaW5ncyBub3RpY2VkIGFsb25nIHRoZSByb2FkLg0KDQpXb3csIGl0IGhhcyBiZWVu
IGEgbG9uZyB0aW1lLsKgIFRoYXQgd2FzIHRoZSBzdGFydCBvZiB0aGUgIm1ha2UgWGVuIG5vdA0K
ZmFsbCBvdmVyIE5VTEwgcG9pbnRlcnMgaWYgdGhlIHRvb2xzdGFjayBpc3N1ZXMgc29tZSBoeXBl
cmNhbGxzIG91dCBvZg0Kb3JkZXIiLCBhIHRhc2sgdGhhdCBpcyBzdGlsbCBvbmdvaW5nLi4uDQoN
Cj4NCj4gMDE6IHJlcGxhY2Ugc2hfcmVzZXRfbDNfdXBfcG9pbnRlcnMoKQ0KPiAwMjogY29udmVy
dCBzaF9hdWRpdF9mbGFncygpJ2VzIDFzdCBwYXJhbWV0ZXIgdG8gZG9tYWluDQo+IDAzOiBkcm9w
IGhhc2hfdmNwdV9mb3JlYWNoKCkNCj4gMDQ6IHJlbmFtZSBoYXNoX2RvbWFpbl9mb3JlYWNoKCkN
Cj4gMDU6IG1vdmUgYm9ndXMgSFZNIGNoZWNrcyBpbiBzaF9wYWdldGFibGVfZHlpbmcoKQ0KPiAw
NjogZHJvcCBhIGZldyB1c2VzIG9mIG1mbl92YWxpZCgpDQo+IDA3OiBMMkggc2hhZG93IHR5cGUg
aXMgUFYzMi1vbmx5DQo+IDA4OiByZWR1Y2UgZWZmb3J0IG9mIGhhc2ggY2FsY3VsYXRpb24NCj4g
MDk6IHNpbXBsaWZ5IGNvbmRpdGlvbmFscyBpbiBzaF97Z2V0LHB1dH1fcmVmKCkNCj4gMTA6IGNv
cnJlY3Qgc2hhZG93IHR5cGUgYm91bmRzIGNoZWNrcw0KPiAxMTogc2hfcmVtb3ZlX2FsbF9tYXBw
aW5ncygpIGlzIEhWTS1vbmx5DQoNCkV2ZXJ5dGhpbmcgd2l0aG91dCBjb2RlIHF1ZXJpZXMsIEFj
a2VkLWJ5OiBBbmRyZXcgQ29vcGVyDQo8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

