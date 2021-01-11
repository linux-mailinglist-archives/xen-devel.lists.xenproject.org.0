Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CEE2F1806
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 15:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64891.114760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyy6L-0005gx-A2; Mon, 11 Jan 2021 14:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64891.114760; Mon, 11 Jan 2021 14:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyy6L-0005gY-6l; Mon, 11 Jan 2021 14:23:21 +0000
Received: by outflank-mailman (input) for mailman id 64891;
 Mon, 11 Jan 2021 14:23:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kyy6J-0005gT-Vq
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 14:23:20 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea9440a2-6ade-4f10-81bd-cf016b8ce84d;
 Mon, 11 Jan 2021 14:23:18 +0000 (UTC)
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
X-Inumbo-ID: ea9440a2-6ade-4f10-81bd-cf016b8ce84d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610374998;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FHRk73s3AgDtrZPMOOqUQvKTNlhuIzJKKvGbnKCIMF8=;
  b=aPv3m2xENwbOZbid9zr2KgYOnRRC0xUbjrHw5HJIL+yymRECNjHbxbbp
   8DIS8FJI9/anT5s0SOQ9/XcEJXmkkzRKbGviCcEFiqRUxZ+Mzyco76jCM
   ZX2fb1bEO8CAELTMUEonbBAwtbvB4eam8nItdDp+a5cMHLfDaOyMNusd0
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uXqGgVn3oq01JTA9sRSt5Xf1n1olUdrLTaIYNL8tgxnOuEMPjHa2LbcHAY80nnYUoCRaA9TyC6
 QuPw4vQ0MsVXP4aoZQEfpIRwPnH442cjxS+SITdFiuDDU/LO4TzEX7o+BUUUguHr2wH3mYZAsm
 cVC25v6BBFEjfOhViOaG5/Hkm/RWrZdX4lCk2kLLlBZYJUTYOARfP9cpCcfp4DfJbubJjXs570
 OV4pdBT2aeqo7W/2GyG4YPo22M6q0fryoM/A1wxNf7+Pv0K5kOr7OSgQtWmoUNICWmCAT26LN0
 Mp0=
X-SBRS: 5.2
X-MesageID: 34869100
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="34869100"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fz8q0my3C+yWFXv2Uo1EsBelE8fNR7HtafHz/cH+p6jYvlKDSX0RZNuEk29Ym4JRK6qh9pM5oIv5ozd694oM77s8oeHSWoMfh4LDmrm3BfPGJNm+phmKruStY/g41YLlTz/9yRrI6HwKjPwxOThBTcP8FCFFMY0j8XGIWTGsyuyBEg7Iw1Y0cos27tM0EOFRx0QymfwgwjGCtOfaArV4GK6IVVw80GDx/7q8w+Fzqj6YMrx4CNfKK/1gDCLnonBwnHiyuZb3lf4FSL+faEJCrLC9wXSy7bS/QfjxnCxDoDkA0/WEaxrJtwONwRkdunqKBk35gL9CI3+ovJ/B5HgdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHRk73s3AgDtrZPMOOqUQvKTNlhuIzJKKvGbnKCIMF8=;
 b=dgq24890LYa8IkJl6tX8WeBws64cRWS58/fOVi8NVXNlECJsu5aWzI6lCBkiy6mhrVyCfe0xNsjJEWCMQwsFk5s0i3uCrOZkuKNOW2EUjGa72YOJOltqAXoz1MT9GW2Uljw+nbBhHQdvDDJdkN2uLZjs/oF4hMX7WKb1Yu6YH33IB2JzoTIlbsRYBcrBupDgPFuc1wsK+QqVmGghPPSrEO5+xksRLO+t5elG401d5LYHn6A/XqvzTzOLs1wgz439e8c6heoCWYNdRG0YmbEXwEL6wGwa1yWDVRsgtJ5XjXsb4qsSP7pJqRiV0xJPohPUYIKYmqa4F2oBdD90YTDzGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHRk73s3AgDtrZPMOOqUQvKTNlhuIzJKKvGbnKCIMF8=;
 b=ZVl/ljV0Qk2VYsYo3gLVcgrK09lme18dpk3ypBUfF1o0bqzi2we+hKKBrQC4QbM2W4NldH3pJNoCM29By3+UcueESzFkgfiKC+OQBxLMEORIUdoIGJ3h6tY4PoGumaSZlg64XN//pGG+GNk0ef+75fFMB9SkdvUx23HzMF9B/UA=
Date: Mon, 11 Jan 2021 15:23:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH 5/5] x86/PV32: avoid TLB flushing after mod_l3_entry()
Message-ID: <20210111142308.3fowkgtvqy4dmnli@Air-de-Roger>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <181be414-49b4-3bd3-bb55-cef443191e60@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <181be414-49b4-3bd3-bb55-cef443191e60@suse.com>
X-ClientProxiedBy: LNXP265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 956113ab-0a62-489b-0db0-08d8b63c6ecb
X-MS-TrafficTypeDiagnostic: DM6PR03MB5356:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5356F54118EB02A5239B94668FAB0@DM6PR03MB5356.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2/58rDTbVzOc1SeS0R/WUFL8V9ewlkkjN+pl4NhU0lKmkWqdOJaqRQ/LHYrN8GHNW0If5cbxYahGxRMh07cRZ1MX1ALbJVuP3bMxpImTrdUbWRf2CGxPd/Nvq2h8m/bOpx1ofpQqVKU7bbVFaUnzV2tGmffpZMeNAHCJ1rrLz2STK2xtatKXm3flrMMfKgMYKx26N7eEXeWsy3xg3SH9mDAmuabawQM3W2M5R4vopokm03qpEOZU2sH8wHtwyFc8hGj1kuJL37Ce+XQ130vEc6NkwIr0V/F/R0KSeBNYMhXdtIPwCbJNO/10wj1Qf294PT5bNTDxs1/7GAmitxRTExeHzT+JjbEYsjrlV8b51cy9ZdoSatYIOfYyJ4Kr9NShVkELCCy7XlsV2B2A/kdHkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(33716001)(66946007)(956004)(9686003)(6496006)(4326008)(107886003)(478600001)(26005)(316002)(66476007)(66556008)(5660300002)(6486002)(4744005)(1076003)(186003)(16526019)(8676002)(54906003)(86362001)(85182001)(6666004)(6916009)(83380400001)(2906002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?alpQMVpCT2dYUWJUTCtlOTdLbXM2eUpGYjVoQnEvL01TL1dtTjJHSkVZK0Np?=
 =?utf-8?B?RHFZQ3dsSjdqZURoM2pDRks4MkJtR2JqUDh5MXRJNTZnSzdLRXhDY3lxTTBz?=
 =?utf-8?B?bTRmUVJZQTNwalRnOUNUT21JUnhHT3lUY296TWNNL3UrQUkvL01ycjZjK1My?=
 =?utf-8?B?bi9BTTM0VnpDRDc5ak9qUlpScUNGR3BlZ0NsdG1SbkJyZTdac1BIMmpyUllO?=
 =?utf-8?B?d0pJbVhGV3haYzFPeUtVMTN2cktoS1VPd3lXbTdGeG4vZXUwaVMwUjE1MU9P?=
 =?utf-8?B?em9xRlRZTW9lVmxISk5kQ2FWeUtRTkkwSGE2S1NsekQ2bjJwK2xxRmpQOFNF?=
 =?utf-8?B?OXVLMktXczZZb3NaS0lZbDltT2JPam0zaStFeGFQaUFJRGQrc01RZ0hxaEkz?=
 =?utf-8?B?OXkwc1dUV1RoZUlkMktGQmw5WC9sbWxjMGdxVjNoZFNaQ0JEbzVNRGpKR2Fo?=
 =?utf-8?B?akJrMmdiakpucEpOSld5N3Awb0FySDZDcGVsb2pmZFJidE5QSzdBY3BudDNP?=
 =?utf-8?B?S0JZN25SZFZkRVV2bkh6bkt1VjBBRDF4dnZrVFJUdndHL08xTklwWGgxdElT?=
 =?utf-8?B?MHRVN0ZNRzgxWnNSZ2JLSG9raUY3L0F5SlA2ZVR1L3pPbU9yak50OEFFR1M0?=
 =?utf-8?B?NnVoOEVYd0w0dHhaejd5bklBa3RlNUppNXZjZVdtSlByU1h6MGx3MlJndmJQ?=
 =?utf-8?B?UkJQZTQ5WDF2MjR1ZENWc2NDTmpXcjdMNlJsUGdBcjVNQjBIcmNUbi9rY2xN?=
 =?utf-8?B?eGgyRitteXdsWG9RVi94RE9rUzRNcVkyKzR3WDc1LzMvdUhOV2dkRXJwaFNY?=
 =?utf-8?B?bEkrdGd2Mm1RYUh4U05VUThGeXp6MVRNWThDbW5xYjVKQU43dkhuckVNYklt?=
 =?utf-8?B?WFpGZytGdGgzY2pwTkwzVTVPalJaUllKQ2s0c1BRT2tYNjJhWmdVSS9DM2NE?=
 =?utf-8?B?Z2ovOG9zblBKZ1RGUXVjeE45RHJNK0NUSW5iaDJ3ZSs5c2pLOStIMSt0Q0d6?=
 =?utf-8?B?WVZCSlRaQVB6Ykc0cXNJM2d1UEtmK05VRmVtSndCRnRvNmVsZTF2VlhlenVj?=
 =?utf-8?B?N01ha3ltUVMzM0FGVlhHa1lFTEl4U2d6eUJXOTBjRnRuUzZIa1BUZTZQS1o5?=
 =?utf-8?B?ODkwMElFajVXWnRMd1lzYUxMNWd3akJqNmV3aXRxZEhvVnI1QzYzYU5ucFRo?=
 =?utf-8?B?YzdWWHlpbFJQWWhBR25DQWM0UkFWckxuOVlacnZjK1c1S1MydW9MY2NCTkRx?=
 =?utf-8?B?VEdLWkFLaDVFNXpEUXNKOVZIS1hMeUdwTGpiM3BDdUFvTkZKRTExcnR0cXE5?=
 =?utf-8?Q?7GximCojppxcfOmv4XMiTAj0lkk2RBb3Vu?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 14:23:14.4416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 956113ab-0a62-489b-0db0-08d8b63c6ecb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9RXTPZV+iEqfwF06Zz1/8Be4Lp3b8rmCHIVQ1R/CBFD0Zvl/6scNPGCGvhG07GGprNfIONlGqbxGBUJ0IzbVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356
X-OriginatorOrg: citrix.com

On Tue, Nov 03, 2020 at 11:58:16AM +0100, Jan Beulich wrote:
> 32-bit guests may not depend upon the side effect of using ordinary
> 4-level paging when running on a 64-bit hypervisor. For L3 entry updates
> to take effect, they have to use a CR3 reload. Therefore there's no need
> to issue a paging structure invalidating TLB flush in this case.

I assume it's fine for the Xen linear page tables to be lkely out of
sync during the windows between the entry update and the CR3 reload?

I wonder, won't something similar also apply to 64bit and L4 entries?

Thanks, Roger.

