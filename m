Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F035C3718FE
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 18:13:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121754.229653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldbCJ-00062s-H3; Mon, 03 May 2021 16:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121754.229653; Mon, 03 May 2021 16:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldbCJ-00062R-CN; Mon, 03 May 2021 16:13:27 +0000
Received: by outflank-mailman (input) for mailman id 121754;
 Mon, 03 May 2021 16:13:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWh3=J6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldbCH-000624-9l
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 16:13:25 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b024c3e4-3e74-4bda-84f1-4a9e5e505133;
 Mon, 03 May 2021 16:13:24 +0000 (UTC)
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
X-Inumbo-ID: b024c3e4-3e74-4bda-84f1-4a9e5e505133
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620058404;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jH4UhUCJPHw7dk6mHkWcv0bMFFryveuWTTTIp1cX3c8=;
  b=ZU9A9Fh+PPCawdMUvNB6LUBDjMVybTJZlSZ9eB1frzZDuDIT2Yu6KMKl
   SoBk/e0vW9B87g02wCkLrng1HZ9UbKuexre6isF9lPzP1DqXlfXnCvELs
   R9DY2S876ZBCS0+ye47oxokWlnHIXcED9bTHKaZThz6/jzgm3ALWBTyk9
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Cj5dIroF/np1ujJQtIqMkcFXkSgdBP+xqZ4fcw5eqN0z+4wCECv18UO9l5BG4nAwAAnSYhw/nl
 l+gsdRMxmyHqT3+eDh1awDD6lcanZP/GhhJTWQiQceGsIWerN6sINkcUm8FV8RVBdxey4seFH3
 PD8nQifflTmGXMHfKd4o0wSNbtoMTDF5dAm7rVIrPPFtrwVRIZh20DbHe6QIZPKNaGwJrFGqal
 BKroFSX3g9NebDG/kdvLmPJj+aTkOeV2zHlt59fCga3+xwd43w3FylrYrllVe9Clfj+52R1qEY
 YL8=
X-SBRS: 5.1
X-MesageID: 43335974
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:hBFHQak+GHJsWy0SLwKN3KaWzuHpDfPXimdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMWOqqvWxSjhXuwIOhZnOzf6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7/yDNXQRhue+Vc6W5Ce2WmO2lXYCUDOpYjDp
 qb4aN81l6dUFAadN6yCHVAf8Wrnb32vanraxIHGBIrgTPm5V+VwYX3HBSC0hAVXykn+8ZBzU
 H/nxHk/aLmivmny3bnvFP71Yhcm9fq17J4damxo/USQw+Mti+YIL5PdpfHlzAzreGp5j8R4a
 XxiiZlBetfwTf8emm0pDHkxgXv1i0/gkWStmOwsD/YjuHSAB48FspdlaJVGyGplXYIjZVH/4
 9gm0KfqpZNAhvLkE3Glqn1fiAvrGWYiz4Gs4co/hpieLpbUpB9h8gj2XkQN5E6ECfz+OkcYZ
 NTJfCZ3tl6WxendXzD11MfueCEbzAIMTqtZFMNgcCR2yg+pgEF82IogPYSmXoN7/sGOuF5zt
 WBNqxpkYdHRdMNYZR8A/8cQdC2Bnale2O2DF6v
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="43335974"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb8ipjnEExQEPOyth807koJLyArm6peG/COPSaZYcHuiRRFW6oCDK+TSoyBpmXxqZyRlTEi+gzRnGxgkVEAVFMeJEO+fx40Sc4PpsiBK1qP7FmlfjN9I+DG0HAAhA6xrdbPPBM+yPCb99zpxaWuR1QgoFjw9dzlFqh/d9Vsluops7WTK6cGKQk+Fc/PxwnnvJgMFKz0KT6O3FyIn1ULzHne8hS15fiAxzhREiETWPERBfk7WlxR3slQnBM249B2nKbtRj2iEDt8V+fw4/pr2T2wF1CEwt9m/cgSIYj34I7eYXOazPJlLVWo4zIOUgHT86LJAjBCB1Yk9q0LMxrm5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jH4UhUCJPHw7dk6mHkWcv0bMFFryveuWTTTIp1cX3c8=;
 b=cWr8R7kAQb3QyjR/cB4APLNQmyI+kqjeY9+hFT7RaunyVxmQiw4kUGggHrr4XqfT64URW7jtchzja6SOQ8qavFR8v0JmviL2TBdTitsDwubxG0M8QRV3E8srki9zi/EEIOrb97WGMS5LiDhBihjb7JxlgBLgwG1j7hpv8SE6ZAyaihtnBlfEMLRoz3Nw+/LpUdwrxM7M9pLCsSTm2Wzxm2MTR4t7W7b+nB1Ha6eZxKj0Jq9ElGa5C2ncNuAkg6jFdHt3ebQ9YnXytALw1NmPzRgwvYrPDPk33v+CtGjChHokuTz3hsu0jx12rH8snaeWkfTlpu7HuYQQuuS701HMkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jH4UhUCJPHw7dk6mHkWcv0bMFFryveuWTTTIp1cX3c8=;
 b=MyYIPBkg61qwLxcq8nRp+lerZwLJPvAIyAK3YFRxnBhTuBE1n4HY9yM0NTuotvLWzo/3HMFNCypDZX0uy5z+Y51/Awj+ZJdF0WUmWQ9vkZBbRd8u/nsgRJssRR/5Tsc2WDefg8m27EoBFqKIk+5xMsENSibRv6uJfu71KY++rps=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <434705ef-1c34-581d-b956-2322b4413232@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 05/22] x86/xstate: drop xstate_offsets[] and
 xstate_sizes[]
Message-ID: <f3a9b372-c927-70e3-a2ba-fef2bb2c7d7a@citrix.com>
Date: Mon, 3 May 2021 17:10:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <434705ef-1c34-581d-b956-2322b4413232@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0252.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a705999c-e93f-4b96-ebaf-08d90e4dfc59
X-MS-TrafficTypeDiagnostic: BYAPR03MB4358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4358A73F550131C16DD999CBBA5B9@BYAPR03MB4358.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h3runkRA/sxQ50gYrEXoGrEeshJ6Rzfa8KvKPZ/O+QqX+RhNWegBvkfg1fnkkcmOIADtJmvsdG44MHeU3eSnXXtUyRYbiP0vcRYVY1r2LVnJjKHSXKOfWmU3fmzMLOy89DVuntZ5XSlVa06gUDPj9gnedHTfaW4SnJF0SDHVDlKyjQlHfXCPJI/tHckMsAGYvDzwwfUlkR8IelaOfVMu6cXS7KCkN4emwR0UuPhPjxvbWdYWToxL/6tdcTm9htvMXrcoI/ThQcrU3/NX6y9+bFJC1uoLARRckr0wAjvBhB80d+u1bzWxAilse3jVGfZPfwCr59Z3uehCF2I9FsXQHMs+wCq1VJzi3gTJ93OusekHxdLVDdHZ6JGG6NCbYTRva8mrX8qkRR4HNnnB55TV5+lFQO2V50HeaFELde3pW10tTh2s+wIIXM4rPdTojV+EOWRiv7qQnY/aCn33KHrDZBtnvdZxBd8WA1s3dUPyb9sgn8NBd086RHFhGIvsQ7ylGiN65DNUeXUq4icQsTe46o41AKZf/y+REAyIdTvZ/s5dfqQKxnMC0xdTKoLpDZ7GxHZ3olvHGy8RRvxsLfPsnUXHzY+QjOzXcRa6bMgpnvx74I8FLlKgY2zzlVBOzLlzjHwfCmiUxjsXcVcu7EF7CF1JI6eDBH+tAtHP7ArGPmEP2WHHYYELCnLglVhxQH3s
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(8676002)(83380400001)(4326008)(53546011)(107886003)(86362001)(36756003)(8936002)(478600001)(2906002)(110136005)(956004)(186003)(2616005)(16526019)(26005)(6486002)(54906003)(31696002)(66556008)(6666004)(31686004)(16576012)(316002)(38100700002)(66946007)(5660300002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WTd2elN4NEEraDFnU09DSEk0S1V6d0xYTTRxTzc3dXlSWEJzM28wcDZxR2dl?=
 =?utf-8?B?bnhZREoxaU53bmMxMFBYMFdEWjNwOVViTWowVnppc21qTzFTbWxJZm8wUEg0?=
 =?utf-8?B?SEdLVjgrdFdKTzRXd1plcVRJM2RQc3UxanN1ZDVaWEUySWFqQmdNRHlrbG5h?=
 =?utf-8?B?ZmhKRCtBTmppMTlvSmNpSFBtRUdSaW1KMm16Y1I5WjgzaTcxUmxaOExQMXQ1?=
 =?utf-8?B?QlR4Z2NxVUV2Q1grWFhDZnVkU1NHTERFYXNWdVNYUGY2K3hiMnF5RHpNZ3BR?=
 =?utf-8?B?N1FzM0FIVlpWNWVtUTExSzRPZ1lxMHkvc0E2bWxCeE81R2NSellESUZMVW5n?=
 =?utf-8?B?a3VlcCtTWTYwMmpoUE00Z2pCTDZiUlVHaFdYKy9McWxlZTl4U0JvdDdMSTU2?=
 =?utf-8?B?ZnVyZ25nbmQ3aVRlUmE5elQ2c2hCNFo3SDJ0UGg5L2dtV2hrSmpkVkp6Y2tw?=
 =?utf-8?B?UUFMbEZSYlNHUEcvSmg3bFVPT0JLRS9FMzUvN0xOMUhMK1JObEQzNzV5OGJP?=
 =?utf-8?B?QUUrODNRZDdXYjJ0Y1JKRk1oQ2ZjNHJzTXgvbm54S0JmQUcwcTR1Zk1zUmEr?=
 =?utf-8?B?YncyQzA4TUNWSmZRYkRBMlVyVlZTTFE0anAyVVpVTDdPSnJiZmdzUHpTSVNQ?=
 =?utf-8?B?WEFXajRVUmtwN21oUTBwWXVBUjE1OEdYY0thVzA3d2hRaUd4M2FIVFUxWmVO?=
 =?utf-8?B?OVVYdXdoTnhOWFdSTkMrTS8zanZUNTJCa3hUbHVrVVRzNTVud3hSblZaY0No?=
 =?utf-8?B?SVZseHo5MnVBUVY5WklwVnlPNU5RenovR3k4cFgrdGE3cHNXTmtJODdsWUZ3?=
 =?utf-8?B?MlZBaU9JWXpkcTYwcFBSL3FocFFHbFJZbGlFWktyUlJaOWk1Z1d0bkhweDl5?=
 =?utf-8?B?U0p6Z3lQMjRiRnBFMmlNbGorZFpvdFpLTjQwdGZQZjBaRkptanFLUlRnbXdE?=
 =?utf-8?B?VFRrakd6djVCbVZPSHRzVzJ1L2hmemZhNmtpcEhId2ZIeXRLQWp3YUxvcFJr?=
 =?utf-8?B?Q3J3djNIbHVoT1ZzUFE1aTQ3ZVFScWRZenQ2SEpGTU9sdStrRDhrYUw3Tyt5?=
 =?utf-8?B?VldSb1hFZWRMOXNnanZFekNhRDZnTktXdzBiWWRld29YeXVWMFp2NW9qbXhm?=
 =?utf-8?B?Rm9JbzI4eVVOTjcxSUQzVis5UXFzY08vZnR6N3pRQXpHQ245ckFVUFNuYzJi?=
 =?utf-8?B?OE5iUUtPbVFVdjR1cjVqTURRaytNT2hWNVJDV3hDWUloZjZZanNWVGV3MjBX?=
 =?utf-8?B?TkV2ZXRNYXYyZFZTejN4bG03YzN6bHJWaFZxaVpRTDRZQ0RjS0VQK1NqVlJO?=
 =?utf-8?B?UG5ya1dKbWNEUlVCV204cENiUFpzNXZiaFNCZW5LZUp6M0xZMmV2Q25HTzM4?=
 =?utf-8?B?YXdNMEJFYmd3dm9URHB0dS9kNUNibGc0NFJqbnZHdGNwRDRncnJwVWRBR3h4?=
 =?utf-8?B?cXkvOExhQ0l2eEhHR01LUWxkVjFiaTlpK2ZPeUJhclk1NDRQU0FoQjdoSTIw?=
 =?utf-8?B?TURZbjFJMGlsUnRnbnhyelVObEJKRm1rT1U4VXF6cCsvUG45VktYbWlGL24z?=
 =?utf-8?B?T2k2N3l5SjJYWE1qQ2o2eC9WQUt4U1M1dUNYVTFsc3JhN210alZNa3AxSGgv?=
 =?utf-8?B?Z3dDQU1TQWZiZktzeEhCb2ViZURMU1VNZXZwZUF5d1BWTUtqTnhSZkZhZmJE?=
 =?utf-8?B?K3U4U1pudUhvUk5ud2VGZEtMMFk1MHNDNFR4TEZLdkgxRmdsUHd6eFIxdEV3?=
 =?utf-8?Q?Ycq28fGfxk4uNBcbAxU2mjs9FkXlavkoZkNYEBV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a705999c-e93f-4b96-ebaf-08d90e4dfc59
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 16:10:36.2795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YiYWuhW0vPK0d49p/aQFnCGyySrwDf0XI9S9fEDic0g8iam8o3NwX8qHu4UHVP4JigUYJkbW0pitxgKE8WpNpxQc9edqaOZcXEZH+JI0XQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4358
X-OriginatorOrg: citrix.com

On 22/04/2021 15:45, Jan Beulich wrote:
> They're redundant with respective fields from the raw CPUID policy; no
> need to keep two copies of the same data.

So before I read this patch of yours, I had a separate cleanup patch
turning the two arrays into static const.

> This also breaks
> recalculate_xstate()'s dependency on xstate_init(),

It doesn't, because you've retained the reference to xstate_align, which
is calculated in xstate_init().=C2=A0 I've posted "[PATCH 4/5] x86/cpuid:
Simplify recalculate_xstate()" which goes rather further.

xstate_align, and xstate_xfd as you've got later in the series, don't
need to be variables.=C2=A0 They're constants, just like the offset/size
information, because they're all a description of the XSAVE ISA
instruction behaviour.

We never turn on states we don't understand, which means we don't
actually need to refer to any component subleaf, other than to cross-check.

I'm still on the fence as to whether it is better to compile in the
constants, or to just use the raw policy.=C2=A0 Absolutely nothing good wil=
l
come of the constants changing, and one of my backup plans for dealing
with the size of cpuid_policy if it becomes a problem was to not store
these leaves, and generate them dynamically on request.


> allowing host CPUID
> policy calculation to be moved together with that of the raw one (which
> a subsequent change will require anyway).

While breaking up the host/raw calculations from the rest, we really
need to group the MSR policy calculations with their CPUID counterparts.

~Andrew


