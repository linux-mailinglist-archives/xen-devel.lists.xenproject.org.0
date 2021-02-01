Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4941230B304
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 23:57:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80174.146449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6i8Y-0004H2-BX; Mon, 01 Feb 2021 22:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80174.146449; Mon, 01 Feb 2021 22:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6i8Y-0004Gg-8M; Mon, 01 Feb 2021 22:57:38 +0000
Received: by outflank-mailman (input) for mailman id 80174;
 Mon, 01 Feb 2021 22:57:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6i8W-0004Gb-GS
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 22:57:36 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a51033c-f72c-499b-8b77-9495d8ef4ec1;
 Mon, 01 Feb 2021 22:57:35 +0000 (UTC)
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
X-Inumbo-ID: 9a51033c-f72c-499b-8b77-9495d8ef4ec1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612220255;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Xdl/2+QjCEGxk+tS3//GTKL2aq2JBAwe02rAZ5YaB+E=;
  b=QVzGCl4FI2h08WqqxOqcoUl8KtQ8R+dnn6SlN38huuVABesYYw+RNkDT
   Wqjflqc8PAVHXMAR451E7sMoo3EtUnklMDG8M9WNWSl88ljchL3P14xDG
   S7LSIRqrYNBEk2wE0AVBqr4m3MsbPNSMrTUa6/hCH5S0wjIXO7Kf4ADVg
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ndA/aa73tBtr6qYSKd/AduCog0I0KNEuvXVNtQtIvMBRwJlQz240CwROlLNTy+4VNuct7r+Fce
 JCFvHZahf61ydRfnHGyeZifQjq6gXgqfG7PXH5bhCKWDcDBKtz8G9AQj9SZm4saI7GvCt/1ngc
 U5LkhuLo9klQKBInzYpfG7AkrTnZTYJnqBoUWBJEpctWqMh2LxTgqsf+xc0XP70N2hBiFQSZuf
 zRY8fS2dGsF7efe/i1GtnTA8Ge3UPU1Jqv3qRq/ZZBMeGYYTDqVDhbbsL1AmpYDKQ2KT5EHBjb
 pI0=
X-SBRS: 5.2
X-MesageID: 36521532
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36521532"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTwg9hxnXiMiRpAuQebt37Id1yX1p2wQ2PWpjFoVARvUZDkQZveGZw7TzT144UFoenuXDUL82I6Z0iPaa6XbhA3fXCF8tX460nlB0eZC9CTnk7wrXJu8mn6HpBiwl9agJazeHr1xxp9x5IxX/XDwiiGvBS3RIjaQZRGCKnQvY/Jw7VVfyCJqBuB/pqH2EYbuMN9VVWAhtt6N8qq+f3MFKwXy3lEXt1vi7mG9DHAVc6eboqnaT7CsGuAPrNEL0riUzQmUQ0mmyaAprMA2sv6PzwIYObX2LGEwQzOLJZuYftddboe+gcAfpXoeyauZsBC4e+wNXUNbsCGhoCNxmiZ/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=patjk2+TXivoRpKNWbyC+vTwSrfzHjyuIVOtJBdv/d8=;
 b=nx3apTR4iPiVrlhxk7Gb9PALj7k8A16AnDKE12xWZUXzyIub2GxmAA0oRhO4O/OqnuHSyBstTVu7pbqDHyt0394BeifdfPnkNzCKs0tZw9SchGj108Lp1OsEvLRBm1/h377LOqyDwHSr6Xkt+RfpAEyQXmqxGkY9xxBGpaZvJZyz/KAbm+SVztvll9ZMLnSbSbaBFBbwtaImRBXfInG9jzYzHs72lxq0cAIW/ZumvC3/Nlo5+t2ZQge1VVcMH3mrOkdeA8H6LSWjolmIQytwR593Bnrr6aiY1orhRAju3EGqy8qOslWJ6t+pn+z76vooxczFd4wQOs2NkQ9UQ9sCbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=patjk2+TXivoRpKNWbyC+vTwSrfzHjyuIVOtJBdv/d8=;
 b=U4J184JLpoz3AvocncLx/+bU91qIMGGQRZKBG+myjbqtcttumq8Ws3T5OaaSerxZB+iGKF358re4Kd4jHMDdGCns8xDF6k/lvSpovydbbUEHdOLJ8EPs3Sg3dDI9fSejeCOxyIGg096G5fZwMnNTQzwXfiNznbpNKjLuAasnM44=
Subject: Re: staging: unable to restore HVM with Viridian param set
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, Igor Druzhinin <igor.druzhinin@citrix.com>
References: <CABfawhkxEKOha7RYpSvTaJEtxyBsio9Pcc=xtRD7DszHm2k2pw@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <12e17af4-3502-0047-36e2-3c1262602747@citrix.com>
Date: Mon, 1 Feb 2021 22:57:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <CABfawhkxEKOha7RYpSvTaJEtxyBsio9Pcc=xtRD7DszHm2k2pw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0449.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::29) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d853598-6365-4aa7-014b-08d8c704be2e
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5741:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5741E4608145D9B8B13365C0BAB69@SJ0PR03MB5741.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwvKEsd0mL70IhxqTIrhw0boUBP6wjQdmzdIt7drMUbqbijQ7tQJtReFajetSsCnkIokySsLi/UdRKK/b2U3x9PDC1H1lHNwGzx0wjkqbUrV1RkW+LP0C1Wm0LKSq+leM+NLu1aRiBI6LBbh8HgeBMNSTubzOEQ0UMLqj/VxoeFi/avDcDqblDLpBStNLRs/k/p+mOC0QtPFKNIJ+XSBjvxZhpwhDaqtBxVIgCp63l9oYTPp8aZQ1S0HLnkN6Aw5Op4EeOYtds/BUIDWgZrFZOQDQXg1cbKM7u/UNyuLLzPtvMPlgfskG2jRef+Z6WNUQWIYIoqE79ijj0k629Zw4ej5etxHsLm/Fw3AWFbvIdoz/6N3UOvKe5p+pfJ1bpd+pT2Fx89B7L4sAbG5kiTIoCsG0exGfj8UUA/9fZebhJ8C7vv6O++saTrTyETo+XPTkOUjOWxOlwA7YvCtfJGSg+UsTNI9QiSpcgtGMN0Av+y1apD//Xs3VW6SxpzqUilwwUPUOis77KRdCJC2IaPPaHcU6Lfz8vnK7/71zHLGi+z3lNHcOCwEKRq0Es3lq7WhU6aa/NkxtopSZO8oXK77Y5da0pGwiJyLrUDLIeqvbVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(956004)(26005)(16526019)(31696002)(8676002)(53546011)(6636002)(8936002)(86362001)(2616005)(83380400001)(186003)(36756003)(478600001)(6486002)(31686004)(66556008)(5660300002)(110136005)(66946007)(316002)(66476007)(6666004)(2906002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bUczcEpJT1VtaG81VDZvcGk0SG94Q2R5MEhoajR4OHJqbThHTVMyQ3dQUkYv?=
 =?utf-8?B?TXRoSXV5ZUt0QnAxVjFUZ2ZTRGtBc3ladFJmb1pMSU03dzJPZDB0bmw0UEJZ?=
 =?utf-8?B?OXZ0VFFWcVRPUCswajRGeXAxbFVRcFB5MmZXZlVxdk5GeHI3YWxUdFlDVFNK?=
 =?utf-8?B?Rm1lOXcwVjk5d1Y0dzlPQ3hTdEpFVTRiRWhrNFRsUXlwL3IydG5hWmR2V3ZK?=
 =?utf-8?B?ZnUxYUZqcFRWYzhCQzJWMUVVSjUwU2RCc05JSU5ZdGdJVlphNVZjdDZNbXlp?=
 =?utf-8?B?VGcyR2VWakRGYit2WGlhV2RGR3dSR3l5S21VMDZ0N0s3azJGMDVuNStBTmFW?=
 =?utf-8?B?ejZ5NHpOMjBSbFFlUlNGa29GdlBSelh6ZUpqd09GNVpRd0UraERjQlJpTWVD?=
 =?utf-8?B?WjVCSEZscUxPYitJTnpiditoaTBzeXdVWXo2TzFPRC9tSFpaR3VyK3E3amlj?=
 =?utf-8?B?SFdoQnYxMk5VZFVRL2xQNnhsdjVYYjl1SEVPVkJTNm0zSTRZMmhwczFWRy9q?=
 =?utf-8?B?K1BySDc3OXFUcko2Rk4vRUtvY0VZN040ZFA1ODNwNE9DTzBCQklsSFI1VWNR?=
 =?utf-8?B?Rm40NDdaUDhJT0l5Mk94K2FYY0FiRVd6T2pPaVA5eEF5VjRwb3NSbXVoWEIx?=
 =?utf-8?B?Qk9Vd0VMOTQ2NzNUVEN0RWkwbFRVWlE3dzZMNzFYcStKaENzbGpWOG8yM29u?=
 =?utf-8?B?R3d3dXE5WGpwZHFvbUF1NENVd0VOeGhlTHB5SDFQUlFmU1Q1QzdLQ2NFd0hh?=
 =?utf-8?B?VGFzU0lXM012MXBZQUxXSitveUE2ZGZLMzZzZW4zV3UyUG5tSnNndGltdlZJ?=
 =?utf-8?B?NElEd1B5NWhtZEZnZ1QzbGJjZTB2c3E1WmNqc0crd1dhaXlCL05NdU5BNGVS?=
 =?utf-8?B?R3VrT0lNdzU2ZFIrQ3gwSmJhYzJrYmZDRGVsUXk2OUkwY3J2N1FWUWZoeVIr?=
 =?utf-8?B?YUhyZGlaWjRJM2JjMUNlNVc3dHQ2QUp1YStiTVFuRzVSUDZGTDN2c1JWc3Nm?=
 =?utf-8?B?QmREYzk5dC8zS2FWdEp0UC9LakV6dURGYWlibkVZVTl1L051dnl5TmFqanFx?=
 =?utf-8?B?REJMalNDcGRhZnBDVW8zR3JrY1ovZGRHQnNEaXJ4SGtvQ1VpSHVJVFF0VnZX?=
 =?utf-8?B?dFF0MkEzQ0xLRmNSbEVEWU9HUWxIek5NU042cWVDNk1RemRWUm9nYkw1MmpI?=
 =?utf-8?B?ajE2RE5jVkk1Z2U0bW5vblZPV3BkYlBsZytzL0pkLzZGT0owWjNsRlpqZVJF?=
 =?utf-8?B?ZkNnNm9HVkdGbDJESnM4QkZDRkoxMWh0ZTJKS2crczFHenVSRnhZNmwyaUF0?=
 =?utf-8?B?VFpPd2haUUZHbXY1UkZ3VFNITzJBNmU5aVRqOVJ0b2d3UzdnMWlFazNJKzZQ?=
 =?utf-8?B?N2wrNWJESlNmUzdKa3pWU0cyMHlDRkxBOTh2YXVDNk9vSHpRT2k2Mk1lUC9X?=
 =?utf-8?B?SU90RFdCRncrOFpGOUVxaG5oZjBubm1EcWpJWHFRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d853598-6365-4aa7-014b-08d8c704be2e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 22:57:25.9446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1eFUkgtP1+UDECWx4lwfx07+GlkUJ+a2nCOezWFzfL8QW9GAI2GBBpKGiuM+icVu3N7qX/3dCHDpzEJuA+Pu8MxYoSL09cYJlXe2qcdbvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5741
X-OriginatorOrg: citrix.com

On 01/02/2021 22:51, Tamas K Lengyel wrote:
> Hi all,
> trying to restore a Windows VM saved on Xen 4.14 with Xen staging results in:
>
> # xl restore -p /shared/cfg/windows10.save
> Loading new save file /shared/cfg/windows10.save (new xl fmt info 0x3/0x0/1475)
>  Savefile contains xl domain config in JSON format
> Parsing config from <saved>
> xc: info: Found x86 HVM domain from Xen 4.14
> xc: info: Restoring domain
> xc: error: set HVM param 9 = 0x0000000000000065 (17 = File exists):
> Internal error
> xc: error: Restore failed (17 = File exists): Internal error
> libxl: error: libxl_stream_read.c:850:libxl__xc_domain_restore_done:
> restoring domain: File exists
> libxl: error: libxl_create.c:1581:domcreate_rebuild_done: Domain
> 8:cannot (re-)build domain: -3
> libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain
> 8:Non-existant domain
> libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain
> 8:Unable to destroy guest
> libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
> 8:Destruction of domain failed
>
> Running on staging 419cd07895891c6642f29085aee07be72413f08c

CC'ing maintainers and those who've edited the code recently.

What is happening is xl/libxl is selecting some viridian settings,
applying them to the domain, and then the migrations stream has a
different set of viridian settings.

For a migrating-in VM, nothing should be set during domain build. 
Viridian state has been part of the migrate stream since before mig-v2,
so can be considered to be everywhere relevant now.

~Andrew

