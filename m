Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821F62E7EF3
	for <lists+xen-devel@lfdr.de>; Thu, 31 Dec 2020 10:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60470.106138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuuCg-0007pM-BD; Thu, 31 Dec 2020 09:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60470.106138; Thu, 31 Dec 2020 09:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuuCg-0007ox-7y; Thu, 31 Dec 2020 09:25:06 +0000
Received: by outflank-mailman (input) for mailman id 60470;
 Thu, 31 Dec 2020 09:25:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIAU=GD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuuCf-0007os-16
 for xen-devel@lists.xenproject.org; Thu, 31 Dec 2020 09:25:05 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4706a326-2606-465b-b0e5-6320295c3935;
 Thu, 31 Dec 2020 09:25:04 +0000 (UTC)
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
X-Inumbo-ID: 4706a326-2606-465b-b0e5-6320295c3935
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609406704;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lfUvN8zfXKHeukRdDnKKp4SYu6Fn833IN8FOshjS9Po=;
  b=UveZVyPq82tengpnI3Ny/D9k3i14G1er2AAWZISkYmDEP6z3F8x48iUD
   PYRgwN/WI68sw9RsKi8YR9jtfZe0csVxDyqGUYaq/DeHJNFxssG2nSMVO
   isQ0OWnqFMvNooReeeR7yZoNXaFZ52nI+qUlFN0KrKXFEkVNYOVizq9mX
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: q7turZOLq4N746f+4E4aueEbCt92DdKlySgMRekIjfkLaAhXRivvLiuwW7cnqLuYcQQW18fU7U
 fAjV3Y7POkqa7Y41+nNPOxWAwzhKs6OxUHOjPv/16B+STlC0Yi3loYa8D6zjGyHYhXlIihDJpz
 HhdiI1UctP3QVjcN/XvbPQdepSJfBcsiTdmAhDofoTL0Q/IrD78X9yekU0UJ4xk3NJ4qJfge37
 q7S2M93cOoALvln16O+ntQZz+pCatZWsxHrZUiC1+LpXXjm3DLkcGJX8A8k8TArJUyWegA2gqm
 xZQ=
X-SBRS: 5.2
X-MesageID: 34561420
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,463,1599537600"; 
   d="scan'208";a="34561420"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtcyqIPEAJgQ0Fo2Xsl7pjVEzLE57fNFEF9wZb7FGNlS1CjP42oDLWRuioqOAe5uKIZv7pRuLWww0jTlzOtQhCXwdsr/yerCS7iJNTn/HB5d48bsXg9rPsoeoIqb7ftpFgXKVuyMPv4gomGfAMyA4RusPXShd+Q1FIYikzWvFvzX6UlBSVip84JTNWvFUaS7zbAr2wsMQlqkEzdQH49cQxmavypopAH5cIsNRQafyzRqrjWcDYHfSIrH7DBDZiZciA+s140PPQo61fEd6QKda8AhONqiJJHwVIbhmZN5VgBmRmq8+94DlH+ZACCeeorqwvq4Z8BU26vB6gM1gI6oJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wRRaUbk1QHoHY+VjKm8jZXNML0hYvvjyVmvCx/fOgo=;
 b=E2pxV2QHcjzpSvXtm47bBE2ZTBHhzWRkOYjojw1JHuiPZKd3oZmfJfjpK2I84P3xea/vpy5JevKZUlk3l6YHdBAl/eMePyDrsVKj26GkDb5PiANzi097iVty6Pf1aiQwE6GrjDU8kCaxTc21hu94n0qMXiOGwQrV2s3pggPwR2O2NJgI6GViEzIGA6zAT6gDG4GsABMPEOtJhs7+nlZerxrwxP+L9EME3CQ6rKr+DBKN+47GGelt62VLP15bIyHODIbgkBt+dfBLA5rHBSpbI01K+59gtBbUxQ44n5ZHp6j4QC7K4gnR8+3wowLWYb7BbA6vI8b7lgXyAi+cLrZ0sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wRRaUbk1QHoHY+VjKm8jZXNML0hYvvjyVmvCx/fOgo=;
 b=TikMOYIRttZy2oAQZwfG4NvL+ESMb0o4IHR+bJGUzPrD9Ne1OKwTGkf4m8KwgD2rf+E9QxmNSbmlz1GQ5JZTrRA7v9eoAi7IEpN4l4fjMvWfrwekMFzn/ciOa8Brbzvvcek4vYn6CL0Ffh2+yEnSXOH4PHBcSvrVMP+XxGN/WlE=
Date: Thu, 31 Dec 2020 10:24:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/svm: Clean up MSR_K8_VM_CR definitions
Message-ID: <20201231092454.awdbppj4hkqpedtu@Air-de-Roger>
References: <20201230193525.12290-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201230193525.12290-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MRXP264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4328ef6e-43e5-4fd6-6ef5-08d8ad6df29b
X-MS-TrafficTypeDiagnostic: DM6PR03MB5356:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5356CCDACA311F9BECB863B78FD60@DM6PR03MB5356.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x+WKcEnR2ne0763N6bG6QfEldk48XOAGVY+vK7G9EOkYE9+Sq5mIqB8mZ77LmO4yA0hQCEkJWNOQPB5xIhSuOxPKWN1QPkxPZmP7p8ONJV6k+csWoxv5dctEaK/LtrXY1ZNr6VnPmJmyN6LKlJHwUpGMYqPxVb3brSyIyint6S47pKDFYo80Z7Bb/xYDTeAGlm8qc07ElH8fumX4oQF9QC5MImu+pOSxFOqZibxmIpbv281PbnKF/TVBqnyQmxZCEQoegUUSrOwX/67XJ8jOZ6xcZ4dKFj956vrJ6fmKrCaJ6VTMxkqM17aoe5zoW98QJJ/LLKQlT2Llcys87RSb9vLpBX23irnmhzBTvV926SV8Xhh3rTxvsVnmTD5wFCu2Cqi7vyE8JNYnDoAWJYePcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(366004)(39860400002)(396003)(376002)(54906003)(5660300002)(316002)(2906002)(6636002)(66946007)(66476007)(6496006)(16526019)(1076003)(86362001)(8936002)(26005)(66556008)(186003)(4744005)(6666004)(8676002)(6486002)(9686003)(33716001)(85182001)(478600001)(4326008)(6862004)(83380400001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SnJVa2xFaUVUckpDTHJVM0xKQjFZSWI5bzNNOHRXK3pzN3o1WGNUV0pMek5i?=
 =?utf-8?B?citmMDRWSS8zZjdKU0xsUDBpVVN3eGxtRVJPRW9pZGorVU8zMGlYWmlhaENk?=
 =?utf-8?B?NHZNaEdPc2NyQVdXUDZHRktPSG53TStZUlM1cUhFZWV1aHRYUS9VZHdrL0tK?=
 =?utf-8?B?Vlp2R0poT2JEbkE2UEVwSWhMZEdyWDQwRG1OVWQyb2tUMVBYOHhPZ2owZS8z?=
 =?utf-8?B?MkNOclB5VHFwUHd0dFFKa2ZqVThVazBmRzRXajlWaTNDaWNjclkzMU9FMlFq?=
 =?utf-8?B?RnpYK3NicUVJMVd2SlNIRE9rMGVrSU5ubm9MYmJYQW1lcSt3UjBlTlQyZ2t6?=
 =?utf-8?B?bXNQaldINDB1Wnl6cFl6R3hSR3dDZmR6aCtVOENaWDc0UXlydWxqOWhuWTdW?=
 =?utf-8?B?czFGUlZLZGI3TncwRkM3TGU0a05uQTB2N1JNQU1iK1ZPdGZPZDBUSktCRUMw?=
 =?utf-8?B?dytDbVlYMkVQdHJEUUNmT3JiWkFNMXgxZnNDc2pWR2s5U255b25EcEdlNnd6?=
 =?utf-8?B?dkFuOCtDUmNiTlE3c2ZoMUtsTmJxclllQk1iTEE2YkNLOGdqSVBRZnJvWTN3?=
 =?utf-8?B?akZ0ZTFCcERZUWhmelpTMW54QUpGVXNFK3k1TVRNOTJad0g4c0Q3TGVKYU52?=
 =?utf-8?B?MURscklvKytleXRKazBPWDZnbkxYb0RXR0xVMzlWMktOY2dTRGJibjcvMkIw?=
 =?utf-8?B?OFR4N1FKMnJQMExPMENjSnNzd2VKekxxVXJBU2ZWR3JJcTdQTEhDc0IwZHNn?=
 =?utf-8?B?QnFic1Fmc200c1hDOU9CYjJ0VUptN1JCcFRZVWhodytZMXQ1Y3NUbDQrSVNm?=
 =?utf-8?B?L0hLVVlVQUhldjgrV0dkbEZwL1NaWVplbXA4bDNlR1VOeUZHSlBVUngrLzZk?=
 =?utf-8?B?M0lkRXR3T1VDbHFhWituclVwOEs3ZHZBNDUyQkRReWIyYXZ4VDY0UHAvRWp1?=
 =?utf-8?B?TjFCZnhNWVk4NVZvTzk5WWhWYTNpL0o1UTNYYVVDUnNMdHBQRHJ4bllOd2ow?=
 =?utf-8?B?VEFJNEtXSEd0Zlh4dUNSSU4vbDlZMStWNlFZa3FNTnY0dmhVUlBLbVVuZ1BB?=
 =?utf-8?B?Y0FHcEFvaytpR3VzWHMvTjRYMTZFaUlTU29WZFEzZlpEYnVjK2licXZhY0ND?=
 =?utf-8?B?cys2SlpvU3JDRjBZZktXSDZ2aXN2ektyNk1hZmdQdUs5b1JLWVBIQmJzM1Fs?=
 =?utf-8?B?ZU5IakdGOUswc0YvZmxTUFo0Z2Z0eTRJaGVPMWQ3SUVFSXVsNlhYZGFWMXNI?=
 =?utf-8?B?aC9RRk5OaWp6TExkQ1RZOWlYMGVNWFRrYkR3Zzh2dmtST283NzlzeXh0b0Nz?=
 =?utf-8?Q?93yM1DxtEF+NRNgb5IQoz/+j19E3gp9Rwd?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 09:25:00.4625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 4328ef6e-43e5-4fd6-6ef5-08d8ad6df29b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0in6rO0I+ye/WMK+Js/8yGLqdS1jVWP8x4bI87AsZXR84F5PkHzVeRRorDtiK0bFITZnP/+1XVGtGYvA2FWTJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356
X-OriginatorOrg: citrix.com

On Wed, Dec 30, 2020 at 07:35:25PM +0000, Andrew Cooper wrote:
> Drop the unused shift number, and reposition the constants into the cleaned-up
> section.  Rename VM_CR_SVM_DISABLE to be closer to its APM definition.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

