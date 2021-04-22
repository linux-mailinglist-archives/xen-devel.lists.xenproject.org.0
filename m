Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FBF367EB2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 12:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115252.219784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZWfs-0001Uo-VU; Thu, 22 Apr 2021 10:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115252.219784; Thu, 22 Apr 2021 10:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZWfs-0001UP-Rk; Thu, 22 Apr 2021 10:35:08 +0000
Received: by outflank-mailman (input) for mailman id 115252;
 Thu, 22 Apr 2021 10:35:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=96sM=JT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZWfr-0001UK-TI
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 10:35:07 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0590ec49-16ff-4566-a656-192799c4da0b;
 Thu, 22 Apr 2021 10:35:06 +0000 (UTC)
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
X-Inumbo-ID: 0590ec49-16ff-4566-a656-192799c4da0b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619087705;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Jy7uQqMuxwAHVgBlc2BouGIfXYS1T8KmICg1OCcmqWU=;
  b=XXtlwrZUAGsUHfgMJSgPgKym43vKW11wZ3l7oqWm87eyIj6ByNG9MZlD
   Y9s6KkTIKNXogNsfRSQAJKzSxXjO8/8AGrGxaT0vUlFnhGq3EEDxF07e2
   nySHXm8pmYEEaV6QVDOMQAPc+rw6ftCYMb/xgy0HvuVM2RY1Ed3xcomJ4
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZcGrtBDBaPlFxjMb9DuMtknNhn/MT4uMRbZ/yi7v5WpdNCHFn8zMJ0MyMkhCLYpBERKOUZroMC
 TWyR6saVc3oRvg7PF2cmac0DB+PWxzZRWP3lUcoziipP1eW9THlqBw+dS7YSYz08Icy5WuDupT
 CR7WGZZ/NAiY+v5eFYiFpZeh4hROFcxfIuBaT34v3LjyYhNQnWXEsU7ec/oFbAqSr/st1QeZiE
 TZ9MZATWCEDU/TtrxU+3VetdV8riQFqq0wRCH2AiW6y9IPPVTv10QXxAu2+kcXKY9QrYbPa3Fu
 +t0=
X-SBRS: 5.2
X-MesageID: 42546657
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GG25DqDOWntZnqnlHegctMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmBEIyycFVB7QxQDKJoiDZ
 yH5tdGoT3IQwVsUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbiSw9BEYTj9J3PMe4X
 HI+jaJnZmLntOa7lvn12HV54lLg9eJ8LV+LeGFl8R9EESPti+Gf4JkMofy2QwdgObq01oylc
 mJnhFIBbUO11r0XkWY5STgwBPh1jFG0Q6T9Xa9jWH4qcL0ABIWYvAx/L5xSRfS50o+sNwU6s
 sitAj4xvknfy/opyjz68PFUBtnjCOP0AIfuNUekmBFVs8mYKJRxLZvjX99KosKHy7x9ekcYY
 9TJfzbjcwmFW+yXjTyu2lix8GURXIjHhuKaVhqgL3q7xFm2F9+1EcW38oZgzMp8488UYBN46
 D+Pr1vj6wmdL5bUYtNQMM6BeenAG3ERhzBdEqUPFTcDakCf1bAsYT+7rkZ7PyjEaZ4g6caqd
 Dkahd1pGQyc0XhBYmlx5tQ6C3AR227QHDE1txez4IRgMy9eJPbdQm4DHw+mcqppPsSRufBXe
 yoBZ5QC/j/aUPzBIdy2RHkUZU6EwhebOQl/vIAH36eqMPCLYPn8sbBduzIGbbrGTE4HkzlBH
 8uWyXyOdVg4kinVmSQummSZ1rdPmjEub5gGqnT+OYejKIXMJdXjwQTgVOlouGHQAcy95AeTQ
 9bGvfKg6m7rW658SLj9GNyICdQCU5T/fHFW3NOrgkaDlPsfd84ypGiUFEX+EHCCg50TsvQHg
 IajU9w47iLI5uZwj1nLN67LGSAjT82qGiRR5kR3o2PjP2VNK8QP9IDYuhcBA/LHxt6lUJBs2
 FYcjIJQUfZC3fJkqWqjJsdAcnFbNliiAKXIcpZwEiv9nm0lIUKfD82TjSuWcmYjUIFXDxPnG
 B89KcZnf69gzq1EHA+h+45KVVIT2ySDNt9fUO4TbQRvoquVBB7TG+MizDfrx0oYGLl+38fgX
 HbITSOdevGBUdcvX5kwr/nmWkEBVm1TgZVUDRXoId9HWPJtjJI3eiHarGa/kGRZlEBq9ttew
 3tUH83GEdD1tq33BmalHK+Dn0g3IwpJfGYJq8kaavv1nSkL5ComakKE+RPxotsMMnjv4YwIK
 SiUj7QCAm9J/Ii2gSTqHpgBTJ9r2M8l+j0nDLi92q10RcEcIzvCWUjY4teBd6S72LpHanVlL
 p4iM84puu2PCHabMWcxaTecj5ELVfyrAeNPpUVgKERmZh3kr15W6T/e3/v8lps2R0lNsf6lE
 8EWs1Akfj8E74qW/ZXQj5T+1oiqc+GI0QquDHnG+NWRyBZs1bre/eyp4fSobUhAke9tBL9FF
 mW/Spa5erEVUK4pMknIpN1BWRdc04n7nt+uMuEao3LEQ2vHtsztmaSAzuYcLVHTrKCFqhVhh
 Fm48uQl+vSUybjwgjfsX9aJa1JmlzXDP+aMUapGeRS9ca9NknJqqy24NSrhDOycACFUS0j9M
 R4XH1VSN9ChDkkhJA21Sb3apWfmDNbr3JupRd9llDs3YC65nz8Bk8uC3yBvqlr
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="42546657"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxuHA508ADKLRI4coBdoeM0W4kZDMmW5X+nslM2/fuJ3qkLUxFVsSdEDz9FhP5AOy51qQJvB69B3CemfozypFTVVtwjqYaovKzrUfGN1XqYG6LH2rI45eZt25iJtPZL8WRh4MoYzHbwRJ5v2XnZZ6UELBWx0pVID0XUJvXUiWmYRHtSBNViwOvNB4v+FSPKspa6Qt1TwqqoWGJ331UaLFS0xiyvHFWJFtxiYfm4pFGhnoQL6tTQYCJHExINPirDaORPZSDzuUN8L4FHMGvbqm8USi6eDlpMqi1Bi5EQLVLBglL7mI789Mim1SoSAKwsGTEUso4GpnheyD7+30piIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7kp5ri/h8sxT/CzE16wh1Ls+BEg8vxcaigM0NCJQlE=;
 b=YKXBL6Rey2R9ZPWgHKHeDIwxDs2mi2/HnRhulTbr/gL2hosnAB2XRWOwnr8B8aynMoPpJO8qxPo+k+ws3KoXXsQFOBZHW6h80Tec/RpxInq6C98+v+5rr8ZaHlrt6KZA0dsaco39wWLWDBIJyp710EAbrbJDu1cRa4md/VQbQAw8+BTDdPJoAU4CDhOUuFApbbDAD4Sr3+vwwqX0S5Vf1suKJNPm4ULmBgrgyQH71ZJjTwZn6sJFqNNYG0wga/GUO2qRBtTZNbxTnvEKbtkxYRK2ZPDX/a2Air24Bcg4vLwvVuNA8LTOCPYnwAFO271Qd7p9qkmqXk1Vcjv4DOvHKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7kp5ri/h8sxT/CzE16wh1Ls+BEg8vxcaigM0NCJQlE=;
 b=dkByziGnQeB30F69uZz6lQARePYbHn1V9KfU8rC3ZZpUB/ZRH3AA4LCMMvK/E5PjJZ1bG2v5dZitQrLlKDERRZAPe8s7IrxsO8oqsfqY4tGujWEIn8zViGny/9hiSfaat/VkpoECWt1h58/g7lmH3f+rsNEgUguvdmTXVJTuJeQ=
Date: Thu, 22 Apr 2021 12:34:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 15/21] libs/guest: obtain a compatible cpu policy from
 two input ones
Message-ID: <YIFRQu/CLEId2uMi@Air-de-Roger>
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-16-roger.pau@citrix.com>
 <391b56d0-bb4d-8d3c-231c-e2e3ad7e2f42@suse.com>
 <YIFFBEhPYSYQhycf@Air-de-Roger>
 <c692e77f-1a9a-ea1d-e029-2a8f62ee0e35@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c692e77f-1a9a-ea1d-e029-2a8f62ee0e35@suse.com>
X-ClientProxiedBy: MR1P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a9d344d-34b8-4456-1996-08d9057a40d3
X-MS-TrafficTypeDiagnostic: DM5PR03MB2635:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2635F0F9B5E222017DC434FD8F469@DM5PR03MB2635.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qf0Uw/E19H8NfLENl0XOKQ00EI0SWUyw7Rc6OvJABsd7wTcRyY8E2skq888PfyllD0ThFPUA/+hqPcFO6pYgWvAxkVRin97PljCZ79diTaphr8YSh+jHe2bdDgZf3wQDM4xYzcvrI51xgfsgfE33qvUtkc5EbRm+qVvWW0ETyKyYHl0SllotfvTJZnxHZEQ9fLlKFYs1wFib/fVFNXRBVtIOR7GcJG18zobQK76lSBQBh6qY50vY6GCVUebTzP+qBiqju6nQERBflYgN/G/hqpVdMwMPs6sNtiHFKL4gn1xSqtmYFMqOBulpeCslaDALO3t9wRKXfJRzOqO+sOt3aUQUaa7+CrVFe7QIIHkv3ndTkDkmnSI5l0ePhLoT5XvagfOesyUEmpttJ4an63Ho1do7R0rtoQIXn+Gyq/A05unX5bb4XIk6Q/bNt2hsu9jW7ddEiJMTuLHAWU209PqK0I1JcKvULQOTq4n/wsvUZaIZNO5b45npvQTLCokGFde4zofYXz6bQuOOdyVVUNFDxJ9Ee62vhg7ksQIAa/v9XUsbsKKRsbwWHWl8VCh95Fy70IS/LOp7Uyi2cG8NtSQ0QOK8CAbkYmwiis5/J+cTEy6A0aB0cLeFIOUyF1RkA/RtxulZwzXtZ69lRgsmA6WvqcpWBoUM3s1cV6qQH+xt5z9zck+Cp8xTJI2HozFv8mLs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(6666004)(9686003)(66556008)(6496006)(33716001)(4326008)(38100700002)(966005)(86362001)(5660300002)(53546011)(6916009)(85182001)(26005)(6486002)(478600001)(66476007)(66946007)(186003)(54906003)(2906002)(16526019)(956004)(8936002)(8676002)(83380400001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MDU5emx2OUJPNVNhWFE3cEhnTzQ1c3B1RDhjWk5Ibmd5cERtM1VEcThxQXYz?=
 =?utf-8?B?eFhRUmpYQVlGT05nS2tZYkRFTHVOV1BNU0NqTXlSbHdJand1WXFJbk5HeFpw?=
 =?utf-8?B?Y2tnVzBaK3RXWlhUemI1ajFaNlBPRm5GTXlKU2g4MHJucFB0a3NBeTl1UE9Y?=
 =?utf-8?B?cTJBR2Y4SHpiL1gyOVhpRFhnMkdCZnIxZ0FFeXVSZ1VQVkI3U09neG40TFlH?=
 =?utf-8?B?bURXMk40RFRrd2crQ1V1NHlQUml1YnVjZWVFMmxVbjNRWWwwbnJjZ0JzUWdS?=
 =?utf-8?B?MG9wdVdYbS9SUkNqekFVcmsxRG1zaVhXejhRVWpzQ2tmYUE2RzFNdms0NDBC?=
 =?utf-8?B?eXEwQmI1cDlGbXMvV2RvcEUxcDVEazBWV2RrdFdHSDJ3cURYZ2Z3aFV6RS8r?=
 =?utf-8?B?UU5BNzRMWlFIYnJIa3lCa21ZM0FpUTdqbUYrOElSUVVrbzZ4UEJ5YnlkZTdJ?=
 =?utf-8?B?UjJMSytNcGNPY3ZiT0tRaG1QcE9GcU9JTTRycHRXaUNkdm1xdWU0SE5aY09S?=
 =?utf-8?B?ZmFOL1E4RE5oeERzQ0dWcW16dVJnNkxRb3JEV0l6TTlrUWwyVGE3RHhlb3Nm?=
 =?utf-8?B?Y3dmTlR3R1BSWUcvSDNXd2hOV0NSK3BmT3M5RDMvK2FaT0VuQ25ycEVIOHJa?=
 =?utf-8?B?Q2ZXYXdNVnRZOFVaakFBNStPQ0h6eXV1Zi9GaWlkOU1PaUtZQU5LVDJDM0Er?=
 =?utf-8?B?NGpmTHluN2ZRanFKbHdEVnFyTmIxcHJOY2VEejhCNWc4SVNNRElGK3o0azdC?=
 =?utf-8?B?b1lobUFXam45OTBFMHZ4Kzd1ZGkrNlNrYTEwaXlreEltWlBGUHJ4MHgyaFBL?=
 =?utf-8?B?cUJqM1B4SUhjZHRVUE1VK2xoWGF3bFZtdjI3WmtaTDJBSzQ1KzZmLzJjTnFG?=
 =?utf-8?B?Q3RHNjdsdW5BWjVQcmZqanF4MmxOOGttemQyUi8xQWM5ZTd6S28zM0lTc1ZI?=
 =?utf-8?B?T0ZwcG9XdUEzSjlrb0dhQkxtODRnOU5FRkg2aGI2ZTVzVjV4cXJsSWV1Q3hE?=
 =?utf-8?B?TXVoMThHSDVqd0xJMjdXUDdDWHNGYVRsdUFlNGM3VTR2WWFmQlZrUHRnZllx?=
 =?utf-8?B?UHFFMzJmWlVwS2NXMXA0c1dwcTVKbGZjS3hsbDVrOURnWGNSK2Zza28zelF6?=
 =?utf-8?B?SERramtRbFlONkMvbzdaZ3FFd2drZ21NVTBrellmRG4xSU01S1NKVUxkR2ZQ?=
 =?utf-8?B?Y2xoQWlXbytYRHk3QmpYbkt1SkN2ejNybll4dVJ2bnU5a0I3MVpHcU5HTXRr?=
 =?utf-8?B?ejVhN3NtZWZrOW8wMzdobStXVFg1ZHJPNDBwYXF1ZldBQWpwTmsrbUNxcmRR?=
 =?utf-8?B?T2FmTllzckpXOWxJRDlOQnlLdXY2WmwxVU9xTWRxTWpJQTZGZ0greGgxVnpH?=
 =?utf-8?B?S2dyTWpvK3I3NmRoZ2NlalpCa3lTT1Bkd1FOMG5zcHh4VlpKSUZHMGpIUkll?=
 =?utf-8?B?WVFPZFcxSFZON2ttODVoTkVUZHA4akhKOUJCNHZZMW53UzJsVTdzejZldVFy?=
 =?utf-8?B?a3c4VmNKS0dwelNneXJhVnNIelNoM2p4aXB1ajhZNFUweU9kekJocUhyN2x3?=
 =?utf-8?B?WldHcVNQbC8rZmxnQ1ljVzZDMW0zNVUrNk1XdGRSZ3hyNzJKdkZ3bzZFTHZC?=
 =?utf-8?B?K0EyelJoOThXMmw1L1JabnYyU0RaU1VodnQ0Z2dCV2lzNmVDR1lFRHROekdS?=
 =?utf-8?B?S3BKSDlwSmo3V2NUNzNWbHJSbzNvaGo4R3A4M09TRjJPMzNFUE10UjJSNnhM?=
 =?utf-8?Q?vbDYtaTq/Wv/4QR4Pklncs7s9Rxb9uEAsAxLTHM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9d344d-34b8-4456-1996-08d9057a40d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 10:34:48.3452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QwxLstr0M3gEGgu0MwCvak2SgZ+iTwKPSwI5lfkNX6HXzYX27reeRz4ti3M3dBWvVrRVdML4hDVbS5ryC8GTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2635
X-OriginatorOrg: citrix.com

On Thu, Apr 22, 2021 at 11:58:45AM +0200, Jan Beulich wrote:
> On 22.04.2021 11:42, Roger Pau Monné wrote:
> > On Wed, Apr 14, 2021 at 03:49:02PM +0200, Jan Beulich wrote:
> >> On 13.04.2021 16:01, Roger Pau Monne wrote:
> >>> @@ -944,3 +945,130 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
> >>>  
> >>>      return false;
> >>>  }
> >>> +
> >>> +static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
> >>> +{
> >>> +    uint64_t val = val1 & val2;;
> >>
> >> For arbitrary MSRs this isn't going to do any good. If only very
> >> specific MSRs are assumed to make it here, I think this wants
> >> commenting on.
> > 
> > I've added: "MSRs passed to level_msr are expected to be bitmaps of
> > features"
> 
> How does such a comment help? I.e. how does the caller tell which MSRs
> to pass here and which to deal with anyother way?

All MSRs should be passed to level_msr, but it's handling logic would
need to be expanded to support MSRs that are not feature bitmaps.

It might be best to restore the previous switch and handle each MSR
specifically?

From your reply to v1 I wrongly misunderstood that you initially
wanted to handle all MSRs as bitmaps:

https://lore.kernel.org/xen-devel/f66e61d5-e4a0-cba3-f15c-73ca54ac4964@suse.com/

> >>> +                       xen_cpuid_leaf_t *out)
> >>> +{
> >>> +    *out = (xen_cpuid_leaf_t){ };
> >>> +
> >>> +    switch ( l1->leaf )
> >>> +    {
> >>> +    case 0x1:
> >>> +    case 0x80000001:
> >>> +        out->c = l1->c & l2->c;
> >>> +        out->d = l1->d & l2->d;
> >>> +        return true;
> >>> +
> >>> +    case 0xd:
> >>> +        if ( l1->subleaf != 1 )
> >>> +            break;
> >>> +        out->a = l1->a & l2->a;
> >>> +        return true;
> >>
> >> Could you explain your thinking behind this (a code comment would
> >> likely help)? You effectively discard everything except subleaf 1
> >> by returning false in that case, don't you?
> > 
> > Yes, the intent is to only level the features bitfield found in
> > subleaf 1.
> > 
> > I was planning for level_leaf so far in this series to deal with the
> > feature leaves part of the featureset only. I guess you would also
> > like to leverage other parts of the xstate leaf, like the max_size or
> > the supported bits in xss_{low,high}?
> 
> The latter is clearly one of the things to consider, yes (alongside
> the respective bits in sub-leaf 0 for XCR0). Sub-leaves > 1 may also
> need dealing with ECX. Yet then again some or all of this may need
> handling elsewhere, not the least because of the unusual handling of
> leaf 0xd in the hypervisor. What gets checked and/or adjusted where
> needs to be settled upon, and then the different parts of code would
> imo better cross-reference each other.

There's a comment in recalculate_xstate that mentions that Da1 leaf is
the only piece of information preserved, and that everything else is
derived from feature state. I don't think it makes sense to try to
level anything apart from Da1 if it's going to be discarded by
recalculate_xstate anyway?

I can add a comment here regarding why only Da1 is taken into account
for leveling so far.

Thanks, Roger.

