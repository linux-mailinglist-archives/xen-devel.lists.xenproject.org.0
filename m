Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A793E2C0F22
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:44:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34721.65920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khE1K-0001Ds-ML; Mon, 23 Nov 2020 15:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34721.65920; Mon, 23 Nov 2020 15:44:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khE1K-0001DS-JB; Mon, 23 Nov 2020 15:44:50 +0000
Received: by outflank-mailman (input) for mailman id 34721;
 Mon, 23 Nov 2020 15:44:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khE1J-0001DN-Au
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:44:49 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9fc51ee-7db9-4c79-9c04-5f68bd615732;
 Mon, 23 Nov 2020 15:44:47 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khE1J-0001DN-Au
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:44:49 +0000
X-Inumbo-ID: a9fc51ee-7db9-4c79-9c04-5f68bd615732
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a9fc51ee-7db9-4c79-9c04-5f68bd615732;
	Mon, 23 Nov 2020 15:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606146287;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=iMeadjRxQcZlD2zTEb+imI1bmEGKVKytoWBZ5ZeE2+w=;
  b=GDjzQ/Y8lJK3LBU87KVQJi+KHgk12zNufFWjgb8zna2v2ojI8Lkmf2uD
   llOKYZLamZ/NvTrJlFbQGEj122XMWzVrbd4/6WX7Gbos13HFiCPgisEhJ
   afAfFebf1lGPnvZBS0872jHO0SZtFhyr/UeM7CD5bS6emVIWmTW7qRxVn
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SGVF6Jdj7E3ZrWBACYftE+CWJszS3Ln3/A4rBf2mz9dtWCPkuwJwBwD3qH2P/9q+w32u2bjXUJ
 kt4K/6urFJ5zkbMeL1BRiNZIxEcVzs4wylfHA3UQxIb69nXN55rTHeTUR6RUs/Q4emxjW0mTgP
 eOwsOYepgfNRNl6OyY6MkegLGiOdYfOgvQVtRtKJpE5Nu8HLEOGEcy+LTBrwbsG10whxlsiLKl
 89c7Ff2pj6CJTpnSXZO08Zf/PLYuQKJd+7J+HMi8Xd+V2xStOCj4bs+KAeTFkShK/18oSLaJxl
 fmw=
X-SBRS: None
X-MesageID: 32913229
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="32913229"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A93fW7brkgzwEzfuvKBfYRcEpviZLCST6lqXOhFvENAeVUg23zJ46BjlDfjB2licb7PvtbSte2pV2ieggXCt3mypQ+6TSj/wV8LsaWKPyoUEsnXwpe29tHXx/5R5A7VZ3u2wvduqKOUoRuzS+BvWpx/6qeZSRUF0FbGe8z3nXQmJNMUzoo1SMWrVqWlddNYphl0QBv2wpCuXZoY6sCgEIrjptkAE/nb7hRF2/b9KmJTAkQ47pxQJpf4xP5ZUf4vrGJ1u/4pJeM2CZOuLuGk4Hr/+6Qdq7GmVUWbrqd08kRdsZHMU1i7TxzG/iCetldUnuKydaDV5Q1I+4Sn+KPE9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1Wd4GzeYtWnis+nIYyELt1FZdGc5LtAW9yKBZSKUQE=;
 b=ATKQcZxANPykSJMIhqL0uTcRyPOooWILjnA2DXlQ5Fcp5a4CRrNRnX/lmxBa6i0kHMo9cu0JUdpKs39pn3zg/KdkSMthzo3WqH7GQyO/HKHbJg/dPwZKvLmk5whlLab2z2LvmnNcWqX+r9utz5g6HzTbw6T+TEOLDfu3sNwMj+L791QtYmPnH7lgktY7yQcDRkIkz9iuMKGB/sT0CMCKXx1zyOpT0KF6RC4hpG3owOMkuSsF3w17psVYC0lEMAKDmH96+lGW5zhnF8JKySVHmVHv52GH/kfraalifSQStQ1hjTnChLxIvjSj0fadYvItY4TmSJmZ1xnubpz32DgIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1Wd4GzeYtWnis+nIYyELt1FZdGc5LtAW9yKBZSKUQE=;
 b=io3OGhObNTm+258lVI0Vv9+G/nfe+IWrZDloXRaNtM4QDTlwKhbG+dPT0+WEmkyHtlbxrK4YRXUKY6Uc4xxw7UuPET8eujzqKj2dModXKMplXj0aZOg5AoINRIhya9tixUVSUuYcaEUvyMjuGhVMg/9nQpcPo55OknvpzRDqYEM=
Date: Mon, 23 Nov 2020 16:44:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH 4/4] x86/ACPI: don't invalidate S5 data when S3 wakeup
 vector cannot be determined
Message-ID: <20201123154438.r4dspkhbmgos5j7n@Air-de-Roger>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <d2b9d231-8a05-6164-66f8-74d7bfe4b40f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2b9d231-8a05-6164-66f8-74d7bfe4b40f@suse.com>
X-ClientProxiedBy: MR2P264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a363ef01-2813-44fb-df15-08d88fc6b2e5
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB263381619EAEC7335E0572FF8FFC0@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lby4VmSivWS0hw1GCxxdpD2E6CPFpXJyATsGDvJdrcxowNWODeg81SyZWTM+tAidMWLgy5tvxP2HlonRv65VI6T4dhHYbJgHs0JyRmFyOs70Ku4+Ai6T4yx0gfYZgAdVjbHLfwV6S6Ni2GmWIF4/8zdXSuAeeoVbnVXh/kBbTnA54QYe2/PDuJsqSM+hSjHJif4t6bN/HJUuwonAnnrw3pSHCvFXbC0kp+vWsnhVlBODCWo6NBCLdjKOsg8T3hwjTgLWvRatl5adwWtI1WZBoJJWak/aYJlairyy7KMvgoiWPSybdPeoXn00A+aTQFEL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(376002)(346002)(39860400002)(396003)(366004)(9686003)(6496006)(6916009)(6666004)(6486002)(33716001)(8936002)(4326008)(2906002)(1076003)(8676002)(478600001)(66556008)(316002)(4744005)(54906003)(66946007)(956004)(85182001)(5660300002)(86362001)(16526019)(186003)(66476007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: rTuF6NHP3JdKnqTV39Y/BWd7YbwmxtMwzUNg99Vjn06qPb14IjyHPe0exExz2LttfmdLw4cjwcgYpRyylsdmN5c6qOUsB9PoURRbml0XZ2RkCpnSuuWRQEbL781F43KYeDkLLHlQJjdFJfLWKFTiGqRvRuUUEeU00lV617KuLm6Mwzj/gI2lCluTrMTrxY0Y36boYoD33uy5WtHbziGWFiM+OgMS/j7sdrK1rcTDkNQ1j7pwvNg1RcirnTsNbOZ/FaV+cwErgyKkXEx00+A4EZs1pAgl5sve1Rx+mUj2MmcaK019jd6ZqSmpAl2cSgv52pP7FMlL/55nZZSvqJjioAZE2+/f/aXYPGM4+Dt9X6WQbxxk/8qaO9S+z3JW/dtgW6HB2KHtOdCpBX2r5MHNsEIGAZT/PoJqYwVCWl9b07BKhP9SmXSu6JrckhcShLSV90QF536/tf19Dq7LfI+5/ZKeyXbkUwe3itq4UCDZzcmQJMLeMQZLPx7JtInEUUF/vMrr2auMZKe2Un5WGEgUOf7+zRBR3pB2vMwDF0Gmrq4k/4PlKAZ8A1P99bBLc5/pW/eKsgxoWDm6iDTpd+fVlmIIxLG8Ocy4Oj+dq1VZUV8kBd436GwCv+epl4k8sgYYFMft7WvWqK2OP/AlGVwdIx6bn0Ox+NLdwFzHnyH+Ac2f+x+QYoPrJx3IosiVn4s5BygBaxNECBJ3WDWKbXkr8iIzzNUz8KC+sayD9LptHEXgezcDb4kO+m0LULWmMidEVMTMW9Sil+ZqNvLY5MsvvJ72fTUoM7af8W23LiF6gmumh/4yMLd/zKWuXovYgwcJVqe1jAn0zd6/lyvg1nV4AgANaw5+5TFTAQyJ/CIr6iwvIbDPypaKZ7EI6h0ZCAJciYiaFdkqAshF0GG54hASdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a363ef01-2813-44fb-df15-08d88fc6b2e5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 15:44:44.1825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bD/AGpwmBRA8FgJh8x4WNLCby8lL1og+DwI1dMoZg3F3jAUUup0rzuy5WgFxxw3yfRIUF/m0mmiQIcfScI5oCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

On Mon, Nov 23, 2020 at 01:41:06PM +0100, Jan Beulich wrote:
> We can be more tolerant as long as the data collected from FACS is only
> needed to enter S3. A prior change already added suitable checking to
> acpi_enter_sleep().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

