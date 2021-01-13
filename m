Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2BF2F54FB
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 23:43:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66789.118777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzorA-0001qU-UH; Wed, 13 Jan 2021 22:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66789.118777; Wed, 13 Jan 2021 22:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzorA-0001q5-QY; Wed, 13 Jan 2021 22:43:12 +0000
Received: by outflank-mailman (input) for mailman id 66789;
 Wed, 13 Jan 2021 22:43:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFkA=GQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzor8-0001q0-ML
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 22:43:10 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31b25cbe-f805-4773-bcb0-77d1e8fb465a;
 Wed, 13 Jan 2021 22:43:08 +0000 (UTC)
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
X-Inumbo-ID: 31b25cbe-f805-4773-bcb0-77d1e8fb465a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610577788;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CHK3TPbEvP80D9hfpjBRtbp2box2kCz7820JZ3w17zU=;
  b=H7zBlOBurqNKMCHq+DAEhqd2UAoWIlP4FVGGm805Z99xT/1p+0fvAvqm
   tF8LWZn3kISBAXZfr5WXMsgNKPfBofIjRAZ8A48Cg5+t+QMcLZxJYe3I9
   2eclLsZkW3kN+vZnR9gSZbGRx+8itvKVGpmuMYqC112zaKGQmjP5HuKQm
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4jcvqLg62+Uht7JpxIWMPJmRqjf9DSEsQkrcnTt/ndfwBYceYc5Gl2TXkFPPJXzC+koQqOVlwu
 sunoGlk8EgDaaLt1RTr8/Uo/196NqKwMXmTtA/oArz2SfAHrO/ph7X22iprMdLvKaHh5Tk8CMb
 0DbShPDBOCIMovQRQ0KxRE2u3BvTJsRqkUufrJDx84YBhHMXDusgtLqv7AFXRdkf+i1dvunsjV
 6HfYMs5Ou6omuhA7//2X4WoB3M9dvMkwsKyZ9gzU1rcEKBaX9E3GnWy5EsSweqhraSjK3mRNWq
 q+Q=
X-SBRS: 5.2
X-MesageID: 35045294
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,345,1602561600"; 
   d="scan'208";a="35045294"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2jqFVHCN6ruGjSESLcGtPGcbIUoJIlJBtSuni7W44to43koHa2ggOI6W5EC8kzntjYVJYYpc7+GPDQhUGzfAbTz0XKoGnveFXtRLZqn/X9hm4s2YonNS4fkQd/rnMprF/mt26zZ1NKIKKB4VfgY+yu8J+asLTWl8F6rrpDXSBkS/miFNFaplLY1+lknEqFbliLjwnow5hMy5DR6FZg0OhBxD7xatRa4ie9XuiXLDaWpoqjbJ4EGNnGlctWLoBV2PX4Gg+pKkVJlbsbBtQPtAAx4wJbKL794bfFDif31uwtcTon10Uucn5fQHfXrBiSG/VWX3sSGG+2vxO7EiKNmHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHK3TPbEvP80D9hfpjBRtbp2box2kCz7820JZ3w17zU=;
 b=hN96yu9eCam9P7wMKwlzVyHbB1T93z8wNwDf/WVooJsgQHNhk2EBHuXUFAvIxAXhIKwPAuZkCUbbOfUig+8W+NKGX77w1qGjGZx4EUchcfdkO69Odp6p1Vwb1z1mTJBKBu7xYtNgwE4rqWAEfPYGi7QMWYiUhm5kCqx1Tlmgc52u5Y3lr/hsEMH95bx2tflz1Xs7oydKJTTaXis8QVLCduAeGVxGrHa969MUej/uWh8xcfzR6q7Dn99SyrhPNEP7Mgvdahck/1HdMfWmF2Q0SvP/+mtq2FLa+lHJ/D3TUO8oLgZnKcmLf5X/J2Pl3UCBkEa7qsJyV36Vf2nrK6rkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHK3TPbEvP80D9hfpjBRtbp2box2kCz7820JZ3w17zU=;
 b=kU8c/SXd4yh6WcZOvYJn6vSAx7PCmGowZX9a4Hb6ktT3VlBSCr1C3rfzpBxynO7sRQQeOoAVQtgcXoZKsu26BJcj5mULUm3hoJKR8XgDv//1RWmtw14mfNqeo+gZLYHBcj0o86BvSQAVk3k0074iXJlBLh94w6Eg0DEYQQrCvZU=
Subject: Re: [PATCH 1/5] common: don't (kind of) open-code
 rcu_lock_domain_by_any_id()
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
 <12b46155-3b07-7ee2-3cda-160dda01e8fb@suse.com>
 <484a5c4d-5a46-f22a-7bd9-0ca597ebf52d@citrix.com>
 <7038d7e3-2d83-ff6e-94f9-567f427d0547@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <afe78547-06eb-2351-920b-3458051ee8d2@citrix.com>
Date: Wed, 13 Jan 2021 22:42:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <7038d7e3-2d83-ff6e-94f9-567f427d0547@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0418.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::22) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9980dbd2-b3ac-421a-fe84-08d8b8149423
X-MS-TrafficTypeDiagnostic: BYAPR03MB4533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4533AF66F2CEF451A9AF7284BAA90@BYAPR03MB4533.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /8z7gUIIP57yY07PzPLcbPEOn5S4f2f2VwXCSKBeL8jKrn63btsJe4oW01cKuv0H5jlCv7sYnn0I9AymDwErf3zjmgiYXchT2rfQ5sHdKsY4pOmatE2x4+JxPR2uMP+X1BQBn7HN1Mgbu1CNqHFeK2OXLLiacaTDJnt1AvI+CcvjLJcmgwBfy0fwPrAo61a1Jvu08lTyZmXijAG1I02EnFkBYz/dtDlnjrkTfke43XFtNjtkUuY3B2mxKRJZpjgdkJAfk9hocl6qu35ncvvcL8tcReFGhhpBEuYziadBctQHK84iSpnJw2+nKgK0wY8Yjj0xllTT6fjJICokcrBpfKmfwnff2bvU5Vmg6SRAHjamqepUTF7RutBklteVBNQ9TLl625Uvjed6/ZnQ/5Qah4dptZdq3eipaTicPloQrAn51xKgbDERzc6NEL7TEq3jNqbrzGx72DiY4nKo5pe2uTALdh7WIkHpHc74zgttu7s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(31686004)(478600001)(54906003)(4326008)(83380400001)(36756003)(6916009)(956004)(2616005)(8936002)(31696002)(6486002)(53546011)(86362001)(2906002)(66556008)(8676002)(66946007)(66476007)(186003)(16526019)(5660300002)(26005)(6666004)(316002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L21aUzU3Nk42NWZpTkhNcG42TWJ0NkxrWE9Sd09TMmJlS3hadGhkaTVKM2lG?=
 =?utf-8?B?S2Ixa2w5cXhyZTNVdTRGY1BuZzFZUnBGZFBkNzlJdFVOUThkYlhMWDdMajFn?=
 =?utf-8?B?dlQzcDlRRFJUU3dBMk9Pb25Id1IyOHhiMTMwYlY1NXUvRkVtMHRTa0NzenVu?=
 =?utf-8?B?YVZ3bVpocktEVDdzVmhuQjgwcGJqaDdMeXh6cWhpUzN6Y0luWGNYU0ZRcWNW?=
 =?utf-8?B?QlBXNEdlNHhoUDk3QklJL2tXSEhGcWdFWTBaTURKQmxGTHY5cHVUNnVpbDZa?=
 =?utf-8?B?Q2ZjTndTYlNDS05IeEJrcUo3NFM1WkVDcXRsN3NQcmltRis1RUhuM3MzcXJh?=
 =?utf-8?B?R2NSL2VGdHg1MXMyZ3prK2RmSUsxbTJFbmEycUtVRGpoWFJzTjFGdlcvMDE1?=
 =?utf-8?B?M3lYQXE1MExoWmwyRUlrKzZXQXU0VnpabER1QXFCenJKQ2JsU0dkLzJDd04x?=
 =?utf-8?B?WGZ1TlYycUh1aU5CSE9wVWtXOE1xRkJzSVZPTUdGZ0FqaUNyYzVHd2hZYlhL?=
 =?utf-8?B?aExWM1pvM2lUOGlTSEpzZEd2MnBwUW8zdDQ4OVJTQVNOTTJnQWNocVJsQlJN?=
 =?utf-8?B?UXBMcG9vUlJJTlg4VEREcjJMa3R6dmlCVEdaeVVuOWJaMGVwWTVWTDc4TE9T?=
 =?utf-8?B?U2k3dC9JbEYxSUhSaEIvYnR2VW9NYm84T3JUeEhKSkwyNEpoZ0Yvb3ptVktP?=
 =?utf-8?B?ckVFbEdicEF6b3dYSkFLOVZGY3FmR0RyeHRmTXFnbnRhbGFWTWpaT2FPMmFO?=
 =?utf-8?B?Y3BjdUVmOVJmNXB2eTBGVlZUMWpYai8ySlVLMENHNlo2cThjenhoa0tmaWdI?=
 =?utf-8?B?QmkxM1dwUnczWEt5S1FseDFkRnpUZHljWThQVFhVeUhtZjMvQ0lnb0hPOFY4?=
 =?utf-8?B?dDBwUk42OURFM3BFeTY4alB1ZXFGMExMeVJFMGtVbWdUdk5zelpiS1ZqREFP?=
 =?utf-8?B?WGdXNDBpWS9XbUkwUTkrem03cHpadzM2SXpOYjRqdjlqY3hQTkJ1WnJCSlF5?=
 =?utf-8?B?VlJOL091ZHRNdzlDa1VKdGE4ektOVzhHbjMvSFQ5QkNGMXJoSGNZdGlRMGZT?=
 =?utf-8?B?OStJL2VtQjBlVS9aRHJRaGt1K0wrbFYwalpXV2NicitBRnJUOXVCNlFCUUJG?=
 =?utf-8?B?U3J6azlvUkpKci9VWGdnakRtQllGb0NteVU5T0VXalBrL1BpSDFWbklLSGFj?=
 =?utf-8?B?Y1A1aXgreDJoQkV6aWN5U2lWeTdoYzdjU1JNcWxDd0pIcDNENVU1Y1ViQ1ZZ?=
 =?utf-8?B?Q2ZZVUxCN3NvbEZYY3ZLZFEwaW1FVE42TEQ4UTFSdFVVZldwVndyM2NmNEFs?=
 =?utf-8?Q?rszNP45MqJPGNPN+lc+8YSgxY7MHu1xR9w?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 22:42:59.5829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 9980dbd2-b3ac-421a-fe84-08d8b8149423
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66t8prrrhyElxaq+BW7IaW+ng3YM0zTnDd9PZatozrTypu01jbVU3XfhHhraH+NyB3/T9BGFAoLQo/hZJrNAorU+u/iEF5A8wAd1ZLcoBw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4533
X-OriginatorOrg: citrix.com

On 05/01/2021 14:17, Jan Beulich wrote:
>>> ---
>>> Besides get_pg_owner(), gnttab_copy_lock_domain() has similar strange(?)
>>> behavior: They accept DOMID_SELF, but not the resolved ID of the caller.
>> I queried that behaviour years and years ago.
>>
>> According to Keir, it is part of the attempt to force guests to not know
>> their own domid.  Xen itself does (or did) its very hardest to prevent a
>> domU knowing its own domid, while at the same time the "domid" key in
>> xenstore is mandatory for setting up PV rings.
>>
>> I'd personally think was a short sighted move.
> Let me make another patch then, unless you can see reasons we should
> stick to the current behavior. Figuring out its own domid is possible
> for a domain, after all, and even shouldn't be overly difficult.

I don't see any reason to keep these semantics, other than the general
argument against relaxing things vs compatibility with older hypervisors.

I honestly can't make up my mind, so whichever you prefer.

~Andrew

