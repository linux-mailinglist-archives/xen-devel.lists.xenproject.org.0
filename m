Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF82FA7FA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 18:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69938.125388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Yji-0003Pz-RS; Mon, 18 Jan 2021 17:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69938.125388; Mon, 18 Jan 2021 17:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Yji-0003Pa-Nx; Mon, 18 Jan 2021 17:54:42 +0000
Received: by outflank-mailman (input) for mailman id 69938;
 Mon, 18 Jan 2021 17:54:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1Yjh-0003PV-4Q
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 17:54:41 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1f9b4e9-174a-4a0d-a31c-0d721b8c02b1;
 Mon, 18 Jan 2021 17:54:40 +0000 (UTC)
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
X-Inumbo-ID: d1f9b4e9-174a-4a0d-a31c-0d721b8c02b1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610992479;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZExzR8fJuioCthOSlOBOWOXOPrqjzyyCkBCAOBax0k4=;
  b=ETOWIN2n5c6GQ74bW/nf3Ref+w7sbvA3K4qB7rqqiLi8GAOFdzohBf6o
   ttOdTLHCEmACDGzWALExoIWkZx5G9AnCjM2L8Aa78YMlwyO2Rw3vuXiRE
   fxbeHsrBVaHb9ye+Bu9lURtAIEguLFcGhkuoMWGtpD1bStnVzs4b4fqhL
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xGyN2qRQlCZOK4OQsMBrQA0Wfxz+K9TtTiq+LbKpN82CFFb5IgtRx6yxpsXxOSCZjZ7X0aQEo3
 nRKHF77KFh7y5S0AoRWflXagem2l9bklvpbCP22Oe6fqBeROuRLN/qyRCuHQqRBrjh+HcHu1Re
 CqpQZhjSutdPZS0542VOwnoouO261m17dFeRF5W/buzvw4HL7+jO/rHbh8kJ6l0HerKqTG5meJ
 pgV7HcqjbRDuB9gAbi7MJbLKJKZZ8Qtwesb7Owok00V5cPA1gstRP8jfC45IrQ0yoyJqQIJgwT
 hDc=
X-SBRS: 5.2
X-MesageID: 35306688
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35306688"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/KFFajOS+FTmTF4/ZOTds+QjUjtztt0+y6F6gli5uERrhbC1pZ+fPniWqaowV8ONHkt97WeVutBtg4IPzhVpl+vKrwmeTlHkrNA/uOI2MKwg7fk3cAaGEppM1DzqRl+m3209ZDC1KTGST/UC8EHjdDcQFR53N9NB8I2bnmwXEZnkBeGAZIlxeDAzR7btU6Eb4ZakTI6tuH30V7Ad6nan6ZxMOVoiv7LPWBqJI/S6rQ4C7Anzbtj4GLkAUyBeiSr+XjIM2siDXjux+DHb100ieqXIyW2/UdgTTh0TFrItrH5JYZxws8VYFX4ZMfSatw4hSccIF/mEMzADy2Ibe+tvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcGuPK2KGdzHupRg18R432AugLQdjTPhXkl/nkgSVpA=;
 b=TfB25FW4nsxrjyz9Z+k48AKejQoZbu3VUVV8Ydqfpsz1iaIGhxI3HpFWDOEakHk0xCX+1zDIHQm+WDlr55JN/ZpxTjOFR2laq87pqceZUe0gHZBgNizdSsloETQkShvu9KcfCq8YrsRisN5S4V5ZoLXEcNO51jrZYxH0W9UWeTt/gPJKXILeEK4Mw0v2CnHjNoFjKKFNLluhpzyKOF0vKwFYI9CJwcJLUQ85zhtzr/Xfim1M94XZNQqVTb2+zAcN6rBgGK/kgZSV9lfN/YVr1kWtwRpNhGrmYBDQ38J2Y6t3+zJZ4YXDlLVRt6sMzXBWO6UdBtZLrKZfy39EqKrvyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcGuPK2KGdzHupRg18R432AugLQdjTPhXkl/nkgSVpA=;
 b=AEgob1vSleCI/DELzFzFYIRCcoX70/vaK9IczGyFuCVSb/qZQwG0utLmJRHPsf5mYTvqNcaK0604RQLih3nI/cm9Ne08BBe6pSS2mrTC505+qid2l0XhWBPxpyYAg1zpaclbDYxvQ1s0PubSDtw5B52/GvsdtH3JZCn/a7xk+lY=
Date: Mon, 18 Jan 2021 18:54:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libs/gnttab: implement on NetBSD
Message-ID: <20210118175411.lvokghuyvmremdwh@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-12-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112181242.1570-12-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef0a6ce8-0478-4f34-6483-08d8bbda132f
X-MS-TrafficTypeDiagnostic: DM6PR03MB5179:
X-Microsoft-Antispam-PRVS: <DM6PR03MB51795981874667F152E9BDC58FA40@DM6PR03MB5179.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oxolZbkiVN5Bw80NjnpUG7i6VZCnDnEUehS8r9kygRK89cqUEh14pb6OFqMMUfm407MTGQXU/N9vPD/y786svd5X9qRuLkF7KvYBsA96m3g6MOmx+N9/AcpHmpul0pAPGuAc5VXILNSDmHPbqPcJyeE5NejJWF9zMKGlVLFfKbWfnwSNoKxAGu2psAYYBJwjssVOJe9yemDfAGJjkNGCHFjLfzcKWuAHaN7hFML0yW0QCzUQNdwOl53Kv+7UVGO06xRBAl7A58men7yk0mU1fmZMj6HpwFzZNoJCx9JkjcLCYC8RJJ5fW98z7Qoy4+0R7/WoJv3BjLiTh4jmsXn635h/T8MKbRIJoKEnFx/ZorhLsQFgGy+oUhMNKmuxYo9x42SKy4/zUJ21cGOIDSxYKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(8676002)(86362001)(8936002)(956004)(33716001)(16526019)(4326008)(2906002)(83380400001)(85182001)(6486002)(9686003)(3716004)(54906003)(478600001)(6496006)(316002)(6916009)(4744005)(26005)(66556008)(1076003)(5660300002)(66476007)(66946007)(6666004)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dzY4OE5kaVJuZXVOeEJ2dUxJSWl5cFFWTGV5cXMweU1YaklmT3Btbkt0N0xV?=
 =?utf-8?B?aFprMFZUb0dhUnFFaUwyT0lPWmVPWC9FR0NMOTlZWWtKbWhndjFmWGpQc2hp?=
 =?utf-8?B?QTJTMXk2MFYwb3hsUWk2K3RsRENRUk1FSHdaMFpjNTRlcWJXcEVEdEtmZmFZ?=
 =?utf-8?B?OSthZUJzRllwN0p3M09aS2ZEZXU0dFJIMG5tRE1iR2ZDb0w3Q1RVWW5uTXVT?=
 =?utf-8?B?REIyU2x6cnRmczNmSUZJSjJCM2tyK0RFek0rQ0w1cUtQSXdtY1NtMUVQRFNq?=
 =?utf-8?B?QWpuWHNsbnRlTU9JZWlLdUJxelJxWXMxMzBGUlN1QlRQQWJQR1hBVnZXN1B4?=
 =?utf-8?B?aFkyZDFZZE04Ry90SmNhNU5LOS9TdloxQTE5YTJiZy92YmkxVkNlSlVWTWpL?=
 =?utf-8?B?ekJpZ0NuY0hNYnVwUEwwU0ZBelMwWC9pWTYwejdITGljVGNlcmJKMlFER3Za?=
 =?utf-8?B?NmxweThxT2YxRGJJTGlNTFdENXM5dW5PYzBjbTgrdndtaklBTUZPNDlzdysw?=
 =?utf-8?B?SjRpR1piNllVSzNTcVRqbDloTzkrWkg4WFJTdXhaNEdCY0RIZlpSUjVWd0xY?=
 =?utf-8?B?WkVEQ3BhM00zZjkyZDd6bVJhNnBlSUxsMUNOMVVPektsNVVhS3REazMyTEgv?=
 =?utf-8?B?SHdPOStwclN4RzdQRnF3d2VIcDBuL0R5ekdZQWR0eHJFWkJYblFZSmtCM3Nu?=
 =?utf-8?B?RGJxeUd3R0dNcmJvUGpUTEVkSmhaN2h5czZaWTRPQlpENEhFbElERUkvN1Bo?=
 =?utf-8?B?azBsZGVXYWUwUUp2QVYrMDhmblJ5aWRtR2kzTjFTRDVTL2IxUU1neUgyUUdV?=
 =?utf-8?B?a3hhR05ZL2xKK1V2RW9QdFlScFJxUFp3QTkveU9EY21SQTRmbmt4cURJanFN?=
 =?utf-8?B?am9KV0ZwR2twQnlqSVB0V3J2OE45cGdTb2wzZ2E4bU5CSk8zbXdlY3RKZ1lx?=
 =?utf-8?B?S0hEUlFzeTQ1UmN4YlpHeCtRbXpUSE1Uc0t2VUs2dDMyUE9peHp4THhJMHlz?=
 =?utf-8?B?bU9BeDMzSUY3RXlqYnVGcy9MM3FDMXYzOExFcWE3MGY4MVUzSDJXdTNvZUNN?=
 =?utf-8?B?cVNxdmNPYnVnREYxMEY0NkdOZ21lZVJ6RUh4SjVyT051V0hzbnlXcVY3K0ZC?=
 =?utf-8?B?MDdvVlZocTJGd1dhN2J1U001dUNaV3VFMGVEWjFhMUE5ZFFZR0wycE40SlBV?=
 =?utf-8?B?RWZOTUlYUnU5MTJTOVNkcXVMd2hDeWhoeXIxdHIyWk01RUhWVldiZ014Znov?=
 =?utf-8?B?dDNBTFJkWWxDMjhmaXFNL0tIVi8rdmdTek9zT3lFTFZQL2hHUWE1UjIvMHFw?=
 =?utf-8?Q?pI9D3mmY1J+QBjgvQiZ0qXYkHx2d/rD+tr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0a6ce8-0478-4f34-6483-08d8bbda132f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:54:17.3755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qMe8KFtusBzzS4LDkN4P33XGUuQFvOEFfI2M9Vii6h+gdRtI4oVSjNQ4IwbBzdkKgk3++Rawm8coaHBcVQ9PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5179
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:32PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> Implement gnttab interface on NetBSD.
> The kernel interface is different from FreeBSD so we can't use the FreeBSD
> version

Since I'm not familiar with the NetBSD interface I can provide much
feedback, but you have some hard tabs in the code below which should
be removed.

Maybe you would like to be added as a maintainer for the tools NetBSD
files?

Thanks, Roger.

