Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE95C312D91
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 10:44:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82670.152665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l935Z-0002Uv-EY; Mon, 08 Feb 2021 09:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82670.152665; Mon, 08 Feb 2021 09:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l935Z-0002UW-BB; Mon, 08 Feb 2021 09:44:13 +0000
Received: by outflank-mailman (input) for mailman id 82670;
 Mon, 08 Feb 2021 09:44:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0k8o=HK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l935X-0002UR-TL
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 09:44:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d700b4a-5c21-4089-ad6e-2f95fa6e0d54;
 Mon, 08 Feb 2021 09:44:10 +0000 (UTC)
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
X-Inumbo-ID: 8d700b4a-5c21-4089-ad6e-2f95fa6e0d54
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612777450;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1CILNLGQk+nV1NwutoxKVcy4yXu72qzm4UlRJNpn/QE=;
  b=P5/lLBzcZurcFuSE5XCkfgJIUtmv4MZt3D72950hjo8fcNijvYsnskSC
   8zWQnObVjLEa8Ud9ReRWJGzijK1g+NdYXk/+nI70speeyRtSdhZ1vGfXF
   dXFpix/rlbW6WTQ9qmxaUXEQdFnslDscq88Ob7Eyizo+yROId31p58B1G
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VacezOIW4l9LHyr1wEJF/5aOIJrH9RGzuijKW0bRL2rR4n7XcTT2YPLKn9TNsJ5L0Qkjcdl85C
 V8SxRfMMhpcnvDkIBizyAB7VdCbbXLtxERD8z16SSXdmEwPlCsnTyy293HKgBFL+RQUlLGv5f/
 KneKc2Dh11A/ZiSvVeLd1WPI1ybzTS7j/cjaeS+7ouhU7vv49mVmrKmfQ+8ecJWsz2x/TnTaOZ
 RgBDgwpGlhMV7xj5OFCJs3XMEHRScGm6iawRY5SDMJbiMDieof70S18o+2lX138wn9Zxmqu+k6
 deE=
X-SBRS: 5.2
X-MesageID: 38106338
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,161,1610427600"; 
   d="scan'208";a="38106338"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6mxGID9lcHLwDItkqUjJNKevM3lvZ32G4rDUWrUlbJxxyuHGmpQwPR8o9RkxfBHVuDExjNNy9dI85QF5tObDXWWDenE4kdi+RZsctYtNpQpwrQiSRzMH3XSVh85pcjeqXREGYYhwGNCl65wo64xoLWzW/zsF3Iewdty5s24IhQ0exPo1+QCKTWBRDKpJUa5v492Y3st9hmie64BkWLzVjhS0/H1U1UPE4dF5GZVFkAYpwGo/kQ2gOeLQpcGzmPpL7VPPmqrunKQgoeeR9nzbMJaJcFGRwDMubyLtgqtd1pf0yzetrw/tqhHyVJIEP/2lRnmfLeju7cwKI9+W7Ziew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CILNLGQk+nV1NwutoxKVcy4yXu72qzm4UlRJNpn/QE=;
 b=SKiBmjD+qT7e5aq3pFLZg13sE6Xs/NsUX1aIA5lEG/nOqzeU+JyDLDIQ+fnpBPsUhgo/Clnp/UD+okUwGQXSuKA+2JnwqQvxqmlBd0kztfGWQfbQtH6wDTQI8UKoI4ofgQOX8kbuMIPjOcupu2rJSjyLxCxD8oAvuYLjAYcagnzhu+IhGqS6mvApUerzKCHMSQ0YJa/OSCc4EnJFR2xz/AZT/i0TGPwQxbjNxV2vU5uRP3AynjlpK2a7UJE+onOJjsUwixtchoZrYNxsukItwOkNo+abzsvsguJEEVO5pDg4tazVgqLYdAeCnScyMcPGs8O+gYcC3RSmV8Lqzg8HoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CILNLGQk+nV1NwutoxKVcy4yXu72qzm4UlRJNpn/QE=;
 b=geA3bPxxeh0tL4JbDcnwsOA7ZP0Kh8BwLCBfH5DxQHFXbHkwlH9zPkKjsC9Gu0VhquQt9/0UB3F8lGPw0svTsDhPG2GJy2lXt11UhXIvNJ1g9b8r4XmIaf/QqdbfKt2Q88kUL2D+uz7NXU7bNZ4rWWEeoeXyr3mLP0lnFvpwRGo=
Subject: Re: [PATCH 6/7] xen/evtch: use smp barriers for user event ring
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-7-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2d354cad-3413-a416-0bc1-01d03e1f41cd@citrix.com>
Date: Mon, 8 Feb 2021 09:44:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210206104932.29064-7-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0491.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::10) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d483c7b6-d667-4a94-6409-08d8cc161408
X-MS-TrafficTypeDiagnostic: BYAPR03MB3605:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3605FAFBF11171785F2383DBBA8F9@BYAPR03MB3605.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZPHs0Tmovse6ARD9nnZc2iqacjO64VmEwBLVzbikoN2rK6f3jTFVvrUtqFn9AbnC6nqleSmasS+K2QUYdc8vTolHpKJfUqEH25/rpsGKxy6PE1fEm7PJ6guqKNamcaPSGVfHWVrEZEfu8pY+QfDfdPzNoa5XPiK9/0PAialQMJNMyDiC5rwqUtlCqRfgj5YxPCq3aRScblwl5E8VN3ZLUNFVdCC0XBjpQVxFd/jbG9zWsthas090KpxPc0GcO1XYnnwaQm5SwbnRAu+xbLRstkw8nNU0Kd4HbxYAYXXP9Q81GxHRpDOhsg+cbXLLBq7j12FAosVdaTVOSgmWsGSjrIW+vQXfGqRtcx+uU0MTq7YDKd441pW0T5KLCifLGrdl/CPbzIInrN1pOY7+CqeBkRxGZje7sUsBbxrLRZrV1ztZY9ZRnkiw+kcmo/5ng4ijTF8J8TKA73yIZKiLAGg8kxSXZ0ADfDaKzWVR7IviY3yI//eBE3hjih5HyDgwSptMjuL0fRqsrI/zVYmKBoBg+TngX6D8H7WPXv97rmQnP06LD6e7HQP46QGLrT7ZZ0uXeigWIg1vXstOkRK2+ZDjeMTWjHw7g7aQpNa5mFD76j4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(186003)(16526019)(316002)(2906002)(26005)(4744005)(6486002)(53546011)(54906003)(8676002)(36756003)(956004)(478600001)(31686004)(16576012)(66476007)(6666004)(4326008)(66556008)(8936002)(5660300002)(31696002)(66946007)(86362001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aGNCNUJMYkVhMk1hVVU2YTFCcWRrMS9hcmh5dWdZVkZoZWtQZ24vSkFDclZL?=
 =?utf-8?B?VzhhaURrU292UnV2QmNrcGxFQVgvSGhKZlNCU2pyamRuTkhHeHdhUWZ4dHNR?=
 =?utf-8?B?TGhiQmlJMDl4clo5ZjV1RUlvdkNrVVpXcU5NZExYUUl3U1RMVExGMWgvcXQz?=
 =?utf-8?B?Vy83b0o1ZVVQUU5XWHJXY0J2aFZzbXlISDNaWktneTM5WE9ITDlhdjhWYVZv?=
 =?utf-8?B?M1ZnOUV5TFRER2JCT1pZYXRkUzBNeWdEeUs2WWU5ckFiY2JWMDNINW1XUDhJ?=
 =?utf-8?B?VmdzYVVwV1hyVEVwTUVUZmNxRTA4YjNUVzM3WTFqQTVmaDMxWjdlNGdTc0hS?=
 =?utf-8?B?anJ1cWtiMkswN3l6ZVNNVE9VblV0Q3ZWTGJiaVF2NlAydnp0WjFhYUM4ZWFF?=
 =?utf-8?B?MFVLOXNwcm5JZGkzb1JZMlFTamg3QXBIWWZraDhjTGJZK3R6cGtjbG9tOGcw?=
 =?utf-8?B?dlNORklQRUpkWGtXd01Fc3VDY2oyU3hwalRxK2Q4eisyY1dVS3czaEkrdVBE?=
 =?utf-8?B?NG83ZEoxMnZ2dEJTKzJmZ3o1OEIvaFQrQVZScW1pRE4wcVZBMmtHR2FPNkFa?=
 =?utf-8?B?OStYQVg4NzdNM0kxOXI0a3kxTmxTcFJYdms2Ni9EWU5sWGtLWE1hajVIaklW?=
 =?utf-8?B?Wm9BbFRlQ2ZFY1JRN21ZbTFOOHBlUFBmVEZ2NW02VE5NbURMSWd2dUhtN2pt?=
 =?utf-8?B?U0tWUy84SWhTNU1JdlN0S3ZrQmJoNWVuaTNaV0pMUTZob1Vmc1NrbVZOQ3Z5?=
 =?utf-8?B?N2Z6WW5DNHYxblZXQjRySytJWjVnWHo4Zmhkakl6VmQzWWdhQVYwa3A5Vmp3?=
 =?utf-8?B?NzRpZnl5YStSeUtmMVNONWNZdzIrTHZ1MFNuRi9heHhPd0lVV21MN2NvTHlN?=
 =?utf-8?B?c1M3WEcrTi9KWVNMY1NzUk11OUloWHRnQzFnQlMrL2RWenNMN1BDTlhkTUJV?=
 =?utf-8?B?dVhhY3YxZTRkNjVwTkxSVXI2WDRuQkNIM3pMUTBJcVJMcE42aWh1cnB6dDdC?=
 =?utf-8?B?eTIrMTdGS1RaaEpiVlk3d2t0VndtdHJpWDRacllOanpnTWpKTENnajhmS3My?=
 =?utf-8?B?WjYvbGFtSHAvMUc0NnBvaE43WTBrdlRVWEVZUkR5QlJVM2VnTTd0Q0pNQWdF?=
 =?utf-8?B?d2pDU21ub0JoOWN2SDFmcHhxZXFXc0R1MW9DWnRVSWFSbkIwVXZyK3BCeDYy?=
 =?utf-8?B?ZXBvVVBHUFpNY1h3d0NRdDZpeFY2KzIyaW1GY0Fyak9GK2ZwVHYxRGlwa0Zy?=
 =?utf-8?B?ZlNwSTkyUm1LUWhMam8vYlV5bGl6bGZobkFDTUljdnlUem03ZW5vOUgyaHlm?=
 =?utf-8?B?VWMzeUxWcERQMi9leUxyRXBCZkdZNENRYzNXcG0rU2RlcE16cnVOejA5UVkz?=
 =?utf-8?B?MStkSDloVmV0d25vNDNzWEozVSs4ejdFTUtNc2RETFNFUytJRjdDcHpBK1ZC?=
 =?utf-8?B?Qnh5bEIramYxei9VWkhqNUYwSjdFMUFvUDNxZmJmVHR3RDNQVURjSjEranhJ?=
 =?utf-8?B?WjFsRmRtUUo4bEp1V3N0Z1IyV01PMk81Z1hyUDhHVUpxNm80dUUvRUIzWDZN?=
 =?utf-8?B?ZVdMZW50VEZWNytXTXZIMlp0S3BYQ1NMUXRqRUpzZmNSQ2graWlqQlozWk04?=
 =?utf-8?B?QWJXTTBmUUZqdjR0Ti82bDFxMkRRM1RNTGh3SkNkUnRqZEF1U0IxTHRhbkVG?=
 =?utf-8?B?ckZZSmpQWEtOSEFPbFlqd0JDUk0vZzlxMUIybXBKcnVFeHY4bCtDYXNveE9K?=
 =?utf-8?Q?G+a9CEqSRUGlPYsdYx11RlUc3/IejuYUoQnSZHF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d483c7b6-d667-4a94-6409-08d8cc161408
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:44:07.4144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2qwwHcm6xgSTbtc3A8SGTcTYmPn1ta+YjNfIfii/bzxZOyF/WX+b83noIHbVkkJ5xC0zKj8QrY/BrZZfvd0nDP0Oh4zavpTXuntU45+bHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3605
X-OriginatorOrg: citrix.com

On 06/02/2021 10:49, Juergen Gross wrote:
> The ring buffer for user events is used in the local system only, so
> smp barriers are fine for ensuring consistency.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

These need to be virt_* to not break in UP builds (on non-x86).

~Andrew

