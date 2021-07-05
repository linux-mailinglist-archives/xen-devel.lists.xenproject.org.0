Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A843BC122
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150402.278084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QjJ-00052l-IM; Mon, 05 Jul 2021 15:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150402.278084; Mon, 05 Jul 2021 15:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QjJ-00050N-FI; Mon, 05 Jul 2021 15:41:53 +0000
Received: by outflank-mailman (input) for mailman id 150402;
 Mon, 05 Jul 2021 15:41:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0QjH-00050H-3y
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:41:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 831114bc-dda7-11eb-844b-12813bfff9fa;
 Mon, 05 Jul 2021 15:41:49 +0000 (UTC)
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
X-Inumbo-ID: 831114bc-dda7-11eb-844b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625499709;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Tr66IaaFKvdb6843PQjk0JRCDkL/c0JzHSQRIzV86/g=;
  b=D4kOcBjFFIEMZQGimzUea868S+AnD5cIJwBxMxV//Gs6hCkLTjxb5P+/
   q+i53aq9wW7+DURI7vIJvgp7JK4LPetbgt4msxwjnopZeEQ3Bu7cx+TaH
   6K20iquAkSw+gkZ3R7ToaFBfjf7fkjKIyWOA9deD/Xbnxz6jza/zypy9p
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: k8W6xbtHVd1YajN2LsSwuXP1Ry/QnXS4boS43LMelsSolWTRCF0hiKTm5c9FnQkJIySMNLf1P3
 qiVlZc+eq7dwERrx25QYbbsr6Y+s4b7eQ0xCaOofOhIbIOROxMURe7OZgXWBk3vMkDvkzW6y6n
 umMFKJLMzR/d07iwrqwGJ0D0zroQNMsiPvXFDpnt2rd9Jw6NUtydzfQNCxbbaZtOsKxomOH5ca
 e65UxkbZM4MIoQotklHyBMsdP2XurpIT+xRZaCxPNi6YvZ74SjmgoTAB9GSQVWmLxewETZd6DQ
 s48=
X-SBRS: 5.1
X-MesageID: 47593132
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6iosoqMDQ4mwtMBcTwj255DYdb4zR+YMi2TDj3oBOSC9Evbow/
 xGWc5roCMdiF4qKQkdcKO7SYC9qBLnhLZICOYqTMuftWXdyQ2VxcRZnPrfKl7bam7DH4xmpN
 hdWox/DNHbBUJmtN396gWjCdosqeP3qZxA7N22pxwBIW8KGsUQiDuRSDzrbHGeLDM2QKbRf6
 Dsnfav0gDQBEj/Gf7LfEXtMdKz3uEjoKiWJSIuNloK+QOKhTOt5KXaFQKE0holUz1Jyao/6m
 Te1yj0/L+qvf2D0RnX23XI45k+orvc4+oGKN2Hj8AULjn2qgKwf4RnRpWJoTAyp4iUmTMXue
 iJjwYrOsxy73/LXmWtuhvrxizpzToo4W+K8y77vVLT5eDpTjczC85MnrtDdArIzkI8sNZ3wM
 twrgGkXtdsfEn9dOuU3amHa/nG/XDfnZJ3+9R9s1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fd/azqhHiPkl1gq5ObpcmU4Hx+ATERHkNeSySJqkHdwyFZd7NADn00H6Ik2R/B/lr
 T525xT5eNzp/ItHPxA7aY6MJSK41X2ME7x2bepUAXa/KJuAQOBl3e42sR2lbSXkFph9up0pH
 2LaiIqiYcIQTOZNSVVtKc7tCwlCF/NLwgF6vsuv6SR6YeMH4YCx0W4OR8Te/XJmYRVPiUtM8
 zDdK6/hJTYXD3T8VIj5XyoZ3AVEwhCbOQF/tIgH16eqMPCLYPn8uTdbfbIPbLoVTIpQHn2DH
 cPVCX6YJwo1DHqZlboxBzKH3/9cE32+px9VKDc4ugI0YAIcolBqBIch1i17tyCbTdCrqs1dk
 1jJ66PqNL7mYCSxxeB04xZAGsWMq8O2sSWb5pjn35CD6rbS8d2h+mi
X-IronPort-AV: E=Sophos;i="5.83,325,1616472000"; 
   d="scan'208";a="47593132"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBFlchwK0WOftdz0YE4mNUAKcQgitlgF30s/sEOoQvDXRNGfViffGCC9VetwWAYwkQhNSEJviRCmXUbP6Srytqlq0JQXHe8vkKl6p1Yn+qCQtpWrhJ69ehK2VYjx84XUTo58inRVL7FFeZivo7SeeoZy2JxLcMwWO7w0exihE7+Vabd835ajqHXfBMm67tm5BnJD3BluMjJ8ML/xIzNbDu7h1Frpm+FEHJItHyXwZtBFezCXhBSw/LDmhpWqKYJ/1NH06Nomfe9Utd0jnxfK4r7DsA72eda39zSrz1t9omKp8sVqAYEAEdCmV68Ix7eU4bRJviB8WHHdvwMuSHnRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr66IaaFKvdb6843PQjk0JRCDkL/c0JzHSQRIzV86/g=;
 b=GxZHvKJlLjMWLxQrVu0nqPqs59H7Rj0hjPk/eaEXKmWqrymaRsaMXKcTPXh5R+HY0wy82i17i7yuzmBCNPj2ZWWESUetPOXIUQ71ivvgKILNxcHQLN/0T+ed6ruGw97rX3f5PAtOPpkQIias8W3lQhZZl23HMwSt81b1W1q8ELSJiV2IopB7Tz0NcKtJOFSvDk+hhM+lk/2AMC5h0OB43bTqFh8uVjRpmVyIz0K09KDCE2594+lj6DurF5h+QKCr9TCiI2kO8fOgL0PA77/4G6++JrmkgUNfIskUODA6G5yVb5cY4QQo/fyKlny41jDB5OOh2kMYTVZGKJOa1x9O8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr66IaaFKvdb6843PQjk0JRCDkL/c0JzHSQRIzV86/g=;
 b=C9Hb9Gbs9b5Wrj9GYshtKKuuWsD07Tm3SMSmtZyIZYgmvOKRAjtsxFTx6bPomZeJ/LTqU2diP3MH2SlZ+Cre9tgv+FkAA8p62ZOtUv2Wqdd67ja6+w8H5kdcrCE1vVbuyJnN+/vSmxCTnVphEd5EYEb3bm4F+LpuspqiKAuyQwM=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
Message-ID: <c5e7aa43-1023-ff6f-e882-0ced8af81613@citrix.com>
Date: Mon, 5 Jul 2021 16:41:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 421f6dee-3b72-45e9-9a2a-08d93fcb64c5
X-MS-TrafficTypeDiagnostic: BY5PR03MB4999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB49995E81DD9686051F5F0127BA1C9@BY5PR03MB4999.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ts3Md0cwVRIhkahzMbHyWNdJdIz/9LTWi+mO5HdIBM/iyvQyFnsJm/P5yElBsVl6+F6XwPYi4XsvaxMxe8Cb+0s+2usAzd/3m3tAfFz1T0lQ/rWlMtcvWO91pCvEEfX2WUnMy68GIRyGTY2svDdJzX0WDLIU+Jw12V8Q/bVLM+tenJjGc4MelwvkYIrgEqy5FzfIr4VfUVmrNb65fqWmUeydfu4YTXr5CwoU+glmATMoAHU2gA9+e1buOwqNBXP6NTMZI5L6xduX76rwJ4OA8mmQ+D7xEXacwiVYI1gdxz9KZR9C7C3+i4CpoA7Ln0uhKtp0321gt8D+kxYSER8dIGlFpIJnC5BZ/TEMy/cI7dxwh8hxg3kRar0TC4xnuMb96BDs6q4c/xpVRYMu6wHIGHA/F2DgjiPVTSwavLe/EzPti4/mRlVXeWfZbmS4IPxgnksQ5xDowUCfWq8XCXDzEgp2XJmMHj1ASIQlcczrShKVYlo1unKsCeWNYFz3MdVRP0/ayDdyMLsRRw49rVkALb+53XVgFyRPmEe0M2yesOJQZ43hhbmjRUtcGZuOo2A/4eiWQStc2LZYn5syZbtTKNz8EYA6qWuKwUpqS9ajzrdu90zekwIAuDvG6Wqxk+hYm4GJNzAe9dbpMpA7ZarwJsI7TLj1vYMlavkwsQRKoNhE0CU9CgNaZyPK5Ojn4+poFgUc2MgrAPkNtYxblfL6efGAbTfq4+X4QIqtFdtaBgLtwELJOU50HhQodnzulzkh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(16576012)(31696002)(2616005)(2906002)(16526019)(36756003)(54906003)(8936002)(956004)(53546011)(4326008)(8676002)(86362001)(110136005)(31686004)(6486002)(83380400001)(316002)(38100700002)(186003)(66946007)(5660300002)(66556008)(26005)(478600001)(6666004)(66476007)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K01XeHBONEZ3bmtmaCtCUWV3YmN3Wmt5UHRBZm50Ym1VVXNBNHpHRTJNTGNh?=
 =?utf-8?B?WXZJU1FZSjBMcWxvQXRvdHlUS2dtVGFkNElCVjZsR1pUSVVEdklFVmZzbXJZ?=
 =?utf-8?B?UEJyUXc2Rzd5Skw0S2hQMDhtSFBVVjFsb3F2TjBxdUNKTlkrZTVKSnVNeENI?=
 =?utf-8?B?bi9KWEQ1Y0pSb1ZLVUJ5TUgwZEFmc2NhMk1IeWQvWERsZkxZNHo5aTRKZEtq?=
 =?utf-8?B?NHExV1FNa2hLTnlQbzkyTjg5QTJtT2s1bDRYaEo3WUNWUGUzdjQzYnlCaVpD?=
 =?utf-8?B?UjR0d0dSK1oyZlBDaFdwL3h5S1J2Z3FCTVlkLzRvZ2laMkZiTFkxaGE4WkF2?=
 =?utf-8?B?SklmdEljQ3FZZzNobUJma2hNbXkrZ3FUYVA0OERSakUxSWRzOU0vRDA4L0Z5?=
 =?utf-8?B?TnBYY29pU1VSVnAxVVhpZlZ3K0RNUUNMUFl3cjlOY0ZUQ2hIZll0bVVjcWRs?=
 =?utf-8?B?Z2k3Q3JScFZYYzV2WWtxbStTYndZQ1Zyd3UwenByRXpEV29VZ1RXMVc4ME5U?=
 =?utf-8?B?MzQ4YkNMSEpBcktRTUlIZGtVUDZoMEtwdVZSb214MTI5WUpJdTJkN0IxTTZt?=
 =?utf-8?B?aXNRSU5XMTBFTjJsUjUreUovRm5NUkgwM2ZJaysvOXdrUDJZeGJSWHUyM3Bo?=
 =?utf-8?B?SnhCR1VTek5IZDVOWlpqYWtVZ3hLOXROSXhTeXJYcm9LK3JqalRwLzUvQ04z?=
 =?utf-8?B?QVdLZ2JSZXR1eGZpbWhRRy9QbHJSbGlpeHZkUXQ4WlhaejNhdzBYVVNkblpx?=
 =?utf-8?B?TXVaaTdvTnlCTmZuUEZoVHpRS1AvK2IwUTR1RFBSZklHcGR3MVl5S2lUckJN?=
 =?utf-8?B?M0o4Mnl3TEtMbDFDVndTOFBBbCtOUmV5TnZKeWQ2ZCtMdGpiVkNUdUJ2S0hl?=
 =?utf-8?B?a1VvVWpjVkxxa05LMFdZWVNGQzRCeEJaRGQxZG1XQ2FOZXdkQm85d2t2dDEr?=
 =?utf-8?B?SzNLQ21lQWhNaEdya1ZBek5rNHhuY2lCZVNJV0pEM1FOTG5keG9GQ3Y2d3J6?=
 =?utf-8?B?QU82NUsrSThKVjhRcnM2T1RmQzB6VFQzb2o3UmhZYXdGWENoREd6ODR1NGkx?=
 =?utf-8?B?c01kTjFidUlSRkkwWTB6ZjJVemN5M1hRbVBybWZSeTZWSjQ5UU55MjJFdVg3?=
 =?utf-8?B?RFFZRm5HeHYzRGtEK1hVdDNlamdDc0J2L2lKQ1hhWUg1ZWhxL041OEltTTJI?=
 =?utf-8?B?MHJqYjdySWdMbEsva2tnc003cDZoWlJOUitXeGliRzhMTVJHclhRNFAzRmZS?=
 =?utf-8?B?TGw2Y2U5RTJiWGsxd0Q4QUZTV3kxYVBpU1RNMDl2T0FSL1V2T3RBdWQwajEy?=
 =?utf-8?B?MWQybHpLV0pYMDVrYmdUNUNYdFU3aEdqM0REMU1EdjJOZWlSNVJlTDVFL0p6?=
 =?utf-8?B?MW9SSzhra1BMUCtNOG9RZk1kQWlkbDNHZGJnWkxNaitDYTVuRmU3dk1jWHht?=
 =?utf-8?B?WTVmTWQvY2xsdStlNFdQcEpwNUhoOHVqSXVoaFkxREZwbm4vdjZzM0ltZ3VR?=
 =?utf-8?B?OHRGdkpIK2VWNjIra3A0V2haSFByN2dqUEZWemdrejQ3V1BNOE5icDg1WWY4?=
 =?utf-8?B?NDFGSkVJNEIvN1Y0aG0vVlBjM3BnLzFZTDJTMDlRbitKZ1V3UTl1a0FORVdH?=
 =?utf-8?B?UU1wWmRLOWw5dmUweHd5d1RBOGdUUnlsQUYzUFFIVGluM0FMb2ZrUFZhVVFr?=
 =?utf-8?B?a3hIdHNrWkV2NVlFOTlmQUF0RllDZ01aMEdtbnRzei9vWGJnZVhBY2wxaWVZ?=
 =?utf-8?Q?E0rDoUnuAcVBBtiF7EefFDjLLgt2QoBtCxS3zPA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 421f6dee-3b72-45e9-9a2a-08d93fcb64c5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:41:45.4136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1em0FHe2W8SB3SULJ7eABCyn1ptPRvTMEZ6AUdHso0y9Nr+ixgNQuAiPBP7QqLpgHHFma9OcPJvGrzbzLyDDVXXQ8+vmEm1JlPj1PTjlkQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4999
X-OriginatorOrg: citrix.com

On 05/07/2021 16:13, Jan Beulich wrote:
> In send_memory_live() the precise value the dirty_count struct field
> gets initialized to doesn't matter much (apart from the triggering of
> the log message in send_dirty_pages(), see below), but it is important
> that it not be zero on the first iteration (or else send_dirty_pages()
> won't get called at all). Saturate the initializer value at the maximum
> value the field can hold.

I've already explained why this is broken...

> While there also initialize struct precopy_stats' respective field to a
> more sane value: We don't really know how many dirty pages there are at
> that point.
>
> In suspend_and_send_dirty() and verify_frames() the local variables
> don't need initializing at all, as they're only an output from the
> hypercall which gets invoked first thing.
>
> In send_checkpoint_dirty_pfn_list() the local variable can be dropped
> altogether: It's optional to xc_logdirty_control() and not used anywhere
> else.

... and why this is broken particularly in the context of a later
change, and ...

>
> Note that in case the clipping actually takes effect, the "Bitmap
> contained more entries than expected..." log message will trigger. This
> being just an informational message, I don't think this is overly
> concerning.

... why this isn't ok.

Why do I bother wasting my time reviewing patches in the first place.

~Andrew


