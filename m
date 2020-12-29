Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A512E718B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 15:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59960.105133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuGQz-0006Ob-LL; Tue, 29 Dec 2020 14:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59960.105133; Tue, 29 Dec 2020 14:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuGQz-0006OC-HV; Tue, 29 Dec 2020 14:57:13 +0000
Received: by outflank-mailman (input) for mailman id 59960;
 Tue, 29 Dec 2020 14:57:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuGQx-0006No-HC
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 14:57:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e062b61-a496-44fa-b46e-e2f217855d0e;
 Tue, 29 Dec 2020 14:57:10 +0000 (UTC)
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
X-Inumbo-ID: 9e062b61-a496-44fa-b46e-e2f217855d0e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609253830;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2uimnoncgjqTx1zKH3TF44gVonlV6rys2NRMrk2z8YI=;
  b=ZKvK7kN+Xv+/ZFzf3ln67tv2LcFlj3VlZCrroZ+FVlh0fny2N/7A2HOX
   I+jHGwhWwsE0Zu8D31z9/ZobHVTLvYLS/68qS5R7Y6adAaco29ko6eGvh
   /3Gba/SLmW0ln5cJ0Y6FJmMLFLOxEOYr3F4Yt4wzx2QFzT0fNakpijNR2
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l5EndpRZJpWKPMs89znV2PSNW2xR3l5mphKHdpwxGpPEx5dno6Zel3oLgryDKGBrNg+KySbzF5
 2DbUZ/dIV7VnLLRN+cKngJJEPyWV0zJUnd6PwT0uqn6XpGJA1ODCoEY+y3PeGsWid+wqpIB8sS
 dGpm8U6BNiCgogh3v/ZwRQkD+9QY/2HOkUBeo5habQYEh/OW+CoWhY9G+D3eBOWTCGLUBY5UIE
 oqkJaNFG2ZFfWy9/3kn3P0eHnvL9oIOPdNTTqA8hQDmffM7+ufUPNukRN4chVWxJmZCWIN2Wep
 nLQ=
X-SBRS: 5.2
X-MesageID: 35347451
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="35347451"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLdifREpNrXk8aOLCstGykRtwDmmgESv+33FwUs6pulF5NiQbll5Xna272TW8l15qnR4I4067vgJeF3qSPLfUZ0IBGx8K/KVe9tlazKnce7/EFOuk/2XhunPgdU5E/13gGYlfjZc4x33OoAtF3yuSBnO2qlvlR3NZoQ99Rs006Oa8JdFeazWLbGUFz9Xqi9V2niajRUnyplboeLNIwrYIqyIC8pscHMC9+mx0nFASMlkbwNBH8J5Q4tqf6ccrm1r0NbpAY48HC/QLimIJNmD4ijcKu49etPFdtjExmi5brSPIGrdwRgAjHIJ0lQuixPIGjpSZ2Fgzi/umdP2BHoYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uimnoncgjqTx1zKH3TF44gVonlV6rys2NRMrk2z8YI=;
 b=IHJ/uXFNyi+0jaiLMFTbkyLpK7IR9AM2v45vXhs6iat8aMuDho0urcp9W+tYTIbhE+A7UWeafgP5qa/DZ70HyGzEPb8GjROjXZK4MsoaoIEhhUI9GZgAajA4D1JuC0tZyShLPduDthaMJ9FoyKS2BB+1j94VtoiUWysTrKu/saFRP29KPsOY1/n7N0u+8A/4tW5GToVfWIHidFpTJ8rA8C8+bPRlx7UxCl8ZZ4jkIshAlRMOz0lLdzzS8ASMSvknC4GedaPigEN6+B04a4n2fjx7NKGvulCbGAbU2w94H/fDLwjriLVfidDQvgtMSjMdiDnQQsrdFxGfiXQ7nILT5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uimnoncgjqTx1zKH3TF44gVonlV6rys2NRMrk2z8YI=;
 b=szB1R5JjNOhR60KerF2aw3l9o06yG06Jpudb70wBnxYzr2yuI/7jkQ8seVz75JCHmiNheZ6H4ZVnQuGp129G7CLvcM2t8KAaw4zZrCBLxFs+OxlRI2QM9wHNz01DSd4Y0O3VE/9ausvn26q7K8jPZNMjgzV51887GoilMlLYn1w=
Date: Tue, 29 Dec 2020 15:57:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 22/24] If PTHREAD_STACK_MIN is not defined, use
 DEFAULT_THREAD_STACKSIZE
Message-ID: <20201229145701.rfbfou5oupwuf5ei@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-23-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201214163623.2127-23-bouyer@netbsd.org>
X-ClientProxiedBy: MR2P264CA0115.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d75093a8-1c66-43ef-ed7f-08d8ac0a0329
X-MS-TrafficTypeDiagnostic: DM5PR03MB3145:
X-Microsoft-Antispam-PRVS: <DM5PR03MB314539CA92E8832BB65FC2478FD80@DM5PR03MB3145.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OF9yt9/iL7A0PJwW7NbKXl6B5+Y6j+ZovTkUtutgRxrHjp+Ez8aPgepqn3zlEzktXHKZNHdilZVXDXnImhPX+uVv32UFUWQ5t9Z+bx+Rc+XqmZvalcDVmaz9TuZhoMeZyP0TyT6WVwoMGWUaWSqSvRacK1NUc4t9pcZ/mbRBAq13rUUad+hDcL0UIiw3QugnDiUOPJlWBXit6QFXswVZrX+Mrp/BDVszLKbiJDDtxhxMJDmpnF9/F/Y1Pv4OlHk7Bodvfpx7j4PUF3INF6/p5LzJ9uAFHsUA1HiHNIazkC89K5cmSwd5wbtSQaDf5VshfFaE7JjB2Cci9KNjCkw7+AyiM1Bs+XhLPW76+7ZqaPiQLXKSvTzNaRIb3LyU/YSj3inOHJX4etG+SwshwguCpKN9Je+A1sK3mfxKQetiYSHSJjKzHsdy+PSbMJltNpYRZoai4gIjCPjAQG46ebCrmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(366004)(376002)(136003)(39860400002)(5660300002)(9686003)(66946007)(6916009)(8936002)(478600001)(1076003)(66556008)(6666004)(16526019)(186003)(66476007)(4744005)(8676002)(956004)(26005)(966005)(86362001)(2906002)(33716001)(4326008)(85182001)(6496006)(316002)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Nkl5S2ovMzlnNkljWVNZRE1wQnFjdXZrUkV2V3JpR3hYR3NKSDRwRHNQL2Y0?=
 =?utf-8?B?NDQzeWhGNjZnczQzWElsL1BQK1FvZGVKNzY2VnFWU1krQ0dxMU5WT1dMTmZz?=
 =?utf-8?B?VHNzTmxSVVgvR1R2bktXTzFEYWxGVVdTUzI0KzJkSGVJNVRmUjd5SCszcUdC?=
 =?utf-8?B?RFIybGQvQUI2VjJ0TUJPVFJvbWpmNzAzNEt0QXRyUFZNMk9oWEp2OUdiNTZx?=
 =?utf-8?B?Z0N6NjRUWk9IK0dqR3hKNHRBWmpWWm1qUmdFNjZZRWd1RzgwdXlsalhzYmhP?=
 =?utf-8?B?L1Zzb3M4b1A0NXp3WDcwdzlid0VXWjdZeWhTbXdLNVl1QVhZd1FveG5SbXdw?=
 =?utf-8?B?ek10T285bjZNMzRSY3BIa1pQTndlQlJmbTJyZkxENG0zVE9JNGRzZDg0YTEw?=
 =?utf-8?B?TnBlS1RLWi80R3JPTUd4enNrUXhOVjg2UGhEYS9qTUdqbFpiajRBQzVkL0pG?=
 =?utf-8?B?cFNmVjIyR3JNV0kxbFpERm54SFhwQytNYzNIMDhETlNUKzV2OEg1eUY3amxD?=
 =?utf-8?B?Rm5ZcFhnejBtdmVadmdvSFFjdjgxYVg1c1FrMVczQUNWby95dVU1dTFWV25W?=
 =?utf-8?B?amJDRENMMWlYWVRyMjIzSG44cGN6U3pyMTNjL1AxSXlBMUttcWJsdmM5S1VJ?=
 =?utf-8?B?c1JrREF2MGgxVEJGK0FPYnk4WUVyMGdUWmo3V251TEQ5Kyt6cG9ybUFEV1k4?=
 =?utf-8?B?M21ZWmFhTUVPMVdMSFUrRFUvQmxjcTlIQzV3bElkeWZrTUVJckcvNGY3MEJO?=
 =?utf-8?B?QTBhOWxyTHozYitJRS9ISkk5anNBME1lbjlzenZFdEdNWTYzN0tmRHhIMFhs?=
 =?utf-8?B?RzliYUgrbHM0S1pXNjRFZVFnai9ST2FyZ0ZDWDRDVThuMUJSNTdISUVBclhV?=
 =?utf-8?B?YzlXaWJyZ3ROTWlQU3NHcXV2cFlXNEhsNXdETWJLZTY1NE8yb25mdDJlM2pU?=
 =?utf-8?B?V0R6L2krZ0VCZkVsUUdac3hvdDZ0WGlWTWpjeHhBaUQ5L1J4WmVzellrbFl1?=
 =?utf-8?B?Y2VJSG0wd1l5S2F4S0xFZnRFOHdxNnVoNHVhOUZSditmQjFHN3pJWW5JY1JJ?=
 =?utf-8?B?M3NpT1M0d0VjaDU5RXJ2cVYwYXNISW5VZVNVVHhySHlMWkVWMWl2UnhGNytx?=
 =?utf-8?B?bTJ2QVdYVFgzbWs5UkZhdnNYNXU0ZG16bFlpOGdFMVFvS2QxbmtIME1YaVdr?=
 =?utf-8?B?V1NPUVk5dW8vdnVVZnJycVNibFBVNHFkZ29lcE1NaUVTcC9ZSFQzRGlwVjJx?=
 =?utf-8?B?QXA0THdWdmFMV3VGWnk0NmU4ZTlwNk1DTjB0bVQrS2RDMmVwNElIdDdaZ0RX?=
 =?utf-8?Q?iFkCXKKOe7tQvMNyLEYrNt1otu8RGOWxwr?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 14:57:07.4908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: d75093a8-1c66-43ef-ed7f-08d8ac0a0329
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TG14aoZTv4QSNPvcl/havytAKcGa1LmD5uEHobzCuNTo2kXpL/kOkSeq8DQ0LT8wHi/3vrIy5YcFzRIuZMalg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3145
X-OriginatorOrg: citrix.com

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I've been told that PTHREAD_STACK_MIN is not designed to be used like
this anyway, and that what we do could be dangerous:

https://lists.freebsd.org/pipermail/freebsd-current/2014-March/048885.html

Please adjust the subject line to mention this applies to
tools/xenstore and a bit of commit message saying it's not available
on NetBSD.

Thanks.

