Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AFF30E17A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81018.148918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7MLQ-00033s-4Q; Wed, 03 Feb 2021 17:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81018.148918; Wed, 03 Feb 2021 17:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7MLQ-00033T-1G; Wed, 03 Feb 2021 17:53:36 +0000
Received: by outflank-mailman (input) for mailman id 81018;
 Wed, 03 Feb 2021 17:53:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7MLO-00033M-GD
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:53:34 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cf56b8d-183e-4496-b642-36e61c393a8c;
 Wed, 03 Feb 2021 17:53:33 +0000 (UTC)
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
X-Inumbo-ID: 0cf56b8d-183e-4496-b642-36e61c393a8c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612374812;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+3gRgyzegJYh7p68ifCETicxsBKAJlnn3+Zs9hKqvB0=;
  b=aWton2qDz4hx/NxA2oNAvWoKWKNpXBAj2h1YOg0SVayOaPgbjIcPeYnw
   Mk43lHwGkX5T1Ub8Bz1lUi1KuzlTvvuhxKVBHyQ0XgCphFgLepVLHo/fi
   YT69nGJkK/LuFBoDOieg3LrQO77+8QDWdXLgLqARsL99AhjtGOIV8s+aT
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6dAi2n9oqQPgZdbf7QqYdjFl5NVlssJb0Rf9VbtOfWZF4PsNFbTtHzeFXBwfTJaRJy4ZJipFno
 JVWw6ocRfxJomMvug0oRCs6brfzXDlgOl5wY9ySdZIThPgtzD61bdLJ9Xb9olrYtmWnqnyhCQI
 lPW1ZniTbnNqanZbVjz2zl2VKNPkWyweRSdeRG5FdCGJ2SIH1iWOYYqzPLLRt8yelYTUY2xRYx
 e9Su5/GyPQJIfL8PA8z/BqCIXmJjrsF0ivbRsipwN4LMge4Kx3a0vLLDY6bkLPr4mCyTIK7dyn
 dWc=
X-SBRS: 5.2
X-MesageID: 36683542
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="36683542"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSX2DzvZEqudm1AArxNF4e0AcmZ5WcJUWepkDz7GLdiCE1eqcg1lMdMQjwoWF7TQqMP/ciNzHuMjpMyfSI4d9neTM6hzy8erUo3k5C0X2BnZmwYXKWeYbGYNX3HpMvhWAIWE3qhGqnUGHSxhXwHxQTMNdnK1vkaXzD9KeRZT873+hriAH8Kowv0tY702TcdTivq863lFZ13GS/O0ba4yuvxOlbxbSCDE6Z8QzgJwXH3wta2RT3+b21yJbGLVoR7ZKkXwYUWCBd51RiRHbKhFEcTX365O465DK+WWgaOjK8QwID3cmnJqO8xDlvkPDc/vsbdL7yzJsufKTRX3fhkXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1RuMOxAsejss2NVD2n4KkH0wh3MGAfBL0OKR5o0nWA=;
 b=QZEd4joBnvx9KZ4MIecP6PRlgbJlXmLAlFYEGPXeNYgFuj6tXDqijn8VQdJOjBlI4sLXcfCBpoQ5MBqHyArd5cZhx6JxR5A69J5ZWrqP3jo0sVqYf+d0mBeun1HGs3TUNDiCwdi+0BWXwGytlnaJ5cAJe4zCHYiBj9LvW9SPWXtGIboUOlLZqjnKKW5YUcSxAGd2ieSHPxKhGLH2xl/EzNxB6QeNNYzbZTV9SrLflVfq7ISoRNuyk2+GnisKy8OHX3L/pK0jdMEWwD1go2OnZ89XW7+7ptupX1vd80t1syVm5AEIRlBNM/OqiwlhY9Ln0CbyPRtUpjs9G6Xwea5/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1RuMOxAsejss2NVD2n4KkH0wh3MGAfBL0OKR5o0nWA=;
 b=BMGeU4QKCfjJ41/bBfFfZcPViccfpYzNoev80oylF6XDPpZsuiTk3SabPd4NJsosA84a9ZvSx2pGDU0MfMGd5fEGXwv+REM5HhkIcxH1D5gCTBgfiN3s1IIfkqh8yDL3yoJt+yzBBhe/8mzJHqGm2UPIcI2RaQWLkOtZrcTqHAI=
Subject: Re: [PATCH for-4.15 2/2] libs/foreignmem: Fix/simplify errno handling
 for map_resource
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Manuel Bouyer
	<bouyer@netbsd.org>
References: <20210203163750.7564-1-andrew.cooper3@citrix.com>
 <20210203163750.7564-2-andrew.cooper3@citrix.com>
 <24602.58002.389945.787614@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e6311666-80af-c0f0-ae22-66b4d140e7ea@citrix.com>
Date: Wed, 3 Feb 2021 17:52:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24602.58002.389945.787614@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::20) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20007945-bf37-4c70-a58e-08d8c86c8e67
X-MS-TrafficTypeDiagnostic: BYAPR03MB4839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB48392288381109B97B7B8DB5BAB49@BYAPR03MB4839.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fIXcq7NFhswPxxmBwXiQptU5HLNmezG6556QzCrTNzBvFEVoVbnAbOWNmDZsuPs6wnxmVL1Nsq/I5ni0GvCDprKX4ZNR30URi9tNdeMn4Un4Mkm+xmeL1ySswZuth73MQJtasNYVqPOTdqmb98lOEh4s0mdE/Ym57DbYRKvQRgRwK7zwME778jNroV2G4htI/vnSadn8eIQ/o6oERSb6onSKwBEeQ2rEUETQr/lzgVYA3RtFVqoX/C5KxGhvw6TzalM21pN/Qnm9f0Ip7t+zL6DjJkkgM1ZHaxpJMcbPwjvYK/09ili4tWdaaZTDXJGt9WfQdPdP57/eYWwbEYGC5+KvIbD/UFPWa1UCdIgJTmk9BklN8RO3l3rMo6+osvHNUNuGqu2ctGJ7tVegob05KTy8j5neJsbvyTZT3MDtX5BlH5MObOHmqqvgmjwSH3PIZ5vgAXSOm9RxRRAerZ9wE44pZDhrFAfQE5S2Yl7ZFQ7xL8uR243Ht4jFEB9c92o5+Wy1d3kEPbaygSyqqfEubOcfUvk3FCo80m6AQHDfkboRWiAaAqnMGt2a0kv0JPF1OeXeJN/t3NizCHAeJ1C8ig1EME1/45p+opGruDNywgE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(4326008)(6916009)(16576012)(86362001)(26005)(5660300002)(186003)(16526019)(8936002)(2616005)(956004)(8676002)(31686004)(6486002)(2906002)(66476007)(54906003)(31696002)(53546011)(478600001)(36756003)(83380400001)(66556008)(66946007)(6666004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QW45WVVWemFOZkFxNDdlbnkzT09kNjBTRnZURFE3ZmdNZ09yRHpzNnZlVCta?=
 =?utf-8?B?NCsxSFU4bXJCaEt2Nmt6MDVwbm8wejdiWlhjajd0TS9YY3EwT3g4WE8vd0tX?=
 =?utf-8?B?V2VZZGozTDdCUjkxTDdhYXZPMnphcFJFMERaQnhMcVJqYVVUSGZHV2s0SDVM?=
 =?utf-8?B?cVBlVXN6Y0VYMXgwRjVsVkVsSFMwcTdSNElzWGZEWndPQzErL3hvTHBzNkJj?=
 =?utf-8?B?Zk9VbWdHNmkxT1RLWHV3M1JnMDU1K0FJNm54dHBJSXJuWGdVV0FlZU9EY3c2?=
 =?utf-8?B?akVvVVRuaWtvT1Z3L2wyNjkybzdzeVQrcExDMWxRaTNpMTdMV2pVQ3IvMmky?=
 =?utf-8?B?bUlUYlhJb3NCM2x3SnVzNXovRCsvcmJCTlV5VjcxQlJrMnAwUnRlejF5N1ho?=
 =?utf-8?B?aGNxcWlNNGREY2tvQTYyWitQOUFrdzNTS1RwSTVLYStIRURNZmtuQmtWMFlz?=
 =?utf-8?B?SG9tekF6YkozQjJ1blFHN08rQXRnV2R0UDJHdGp6bnVYYTk0MSthOXY1ejRZ?=
 =?utf-8?B?UHNRbW43aWl0QmduU3NmQlZQbzBpS3hiMStwc0hsZzJyNXVzQU80RzZpYjVY?=
 =?utf-8?B?MCtBRDhmUVJmK2FNaFlNclZNYUVGdnREN0xQbWxaTUYrd0MxRWh6azVKWnYx?=
 =?utf-8?B?NkptejNvUVBtSUh1SVp0YmJJRkx4THk1MTErN2JVL1pxV3RXMzQxYk9YSWd1?=
 =?utf-8?B?Uit4OUc1elFlUk1OWm1zT0I1R2hjWk9rL2dHM3l0SjdPRjRnNnlOY2piOGM3?=
 =?utf-8?B?NXJCZG0yQkYzMUVlWkJZNUlQZzN2Um95VlNja1ZXM0t5RzQzVjR5ZnoxcGpR?=
 =?utf-8?B?MUNPWGtWNHV0N1dQOGtpRlhpT3NFaTJyWUZaRU5Sb09QMXB5NFcwMGVzWTVP?=
 =?utf-8?B?c3Y3N1pvRjYwbkE1aHEyZzJMYXRMQzc4dStmTU1qRFgwVGoveWNxMXAvaUxX?=
 =?utf-8?B?R0JFdlBhdURyOXVyMlZBS1RwY0E5WFNNTTd0b1ZSYUlyVGxoYXFJc3grSUxE?=
 =?utf-8?B?RW9LMTNqUFhEUEhpQUQvRUJTYXA0QVVzYVJ3Q1lvbUpyZGdJbCs5UURBT0lm?=
 =?utf-8?B?cmMxYWFvdkFubkVONEdUbm9pWWY5WFBiSk1aYS9hcnJaVGJmcE80bTRyQ0RB?=
 =?utf-8?B?NEswZ001L0g4dS9GOWxSYmlPWDl0VzZiUkxYMWdoYXF5WTVBOWsvY1VMSUY5?=
 =?utf-8?B?enVCOTcvRHJxMVF1K0o4Z1I1UUxjeldWYlovdVdCRmNwaTRlN3NYNmZ0Q09w?=
 =?utf-8?B?ZjJnTzhId2NoWmVjNGI1dUVxeU1qalVSNTRzd3BSZkRWRGZ0ZHlJR0hCeEtv?=
 =?utf-8?B?azY5emFyelNsTmpnNnpRazNETk10Vk9ETHhhSGxJYVlnczl0UWRNa1BYMWxW?=
 =?utf-8?B?K1hKdGtPb3RWVUpXVldTNGx2UUFYNXNPSjNlQlFDRCt0RXhqaVJsbTJrajZv?=
 =?utf-8?Q?FrGIgkTN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20007945-bf37-4c70-a58e-08d8c86c8e67
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 17:53:04.6654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5VlLGWPavqS+kd4LSrf2e+yBx6VZ0sZ8Q2tlvbxi+YW+VGZuAOjoygWbeEa7qorrXvXfv2utn3Uyqo5s24WAIT4T+SQCl0G0xJicEIaaeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4839
X-OriginatorOrg: citrix.com

On 03/02/2021 17:51, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH for-4.15 2/2] libs/foreignmem: Fix/simplify errno handling for map_resource"):
>> Simplify the FreeBSD logic, and duplicate it for NetBSD as the userpace ABI
>> appears to be to consistently provide EOPNOTSUPP for missing Xen/Kernel
>> support.
>>
>> The Linux logic was contorted in what appears to be a deliberate attempt to
>> skip the now-deleted logic for the EOPNOTSUPP case.  Simplify it.
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
>
> Sorry for my earlier confusion.  I had lost the context between the
> two patches.  I will explain my reasoning for the R-A:
>
> For the first two hunks (freebsd.c): these are consequential cleanup

FreeBSD and Linux.

> from patch 1/2 of this series.  Splitting this up made this easier to
> review and we don't want to leave the rather unfortunate constructs
> which arise from some hunks of 1/1.  IOW, the combination of 1/1 plus
> the first two hunks here is definitely release-worthy and the split
> has helped review.
>
> The final hunk is a straightforward bugfix.
>
> This combination of two completely different kinds of thing is a bit
> confusing but now that I have explained it to myself I'm satisfied.

Thanks,

~Andrew

