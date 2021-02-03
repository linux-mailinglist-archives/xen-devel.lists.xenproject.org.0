Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9574030DD6B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 16:02:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80947.148546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7JfD-0007xM-Pl; Wed, 03 Feb 2021 15:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80947.148546; Wed, 03 Feb 2021 15:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7JfD-0007wx-MK; Wed, 03 Feb 2021 15:01:51 +0000
Received: by outflank-mailman (input) for mailman id 80947;
 Wed, 03 Feb 2021 15:01:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7JfB-0007ws-8u
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 15:01:49 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1848eee9-4d10-4460-9432-530d60c46b39;
 Wed, 03 Feb 2021 15:01:48 +0000 (UTC)
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
X-Inumbo-ID: 1848eee9-4d10-4460-9432-530d60c46b39
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612364507;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/xXvjgdy11jdnqvpj+bFwqGUCIwgRoG7akY5RndKhTg=;
  b=DIWK0WPGWPVygVP2eNNhXP6rk+FlEwTjWZ1MPsm2SVOzQ0WQ7/4RE/a6
   IJ4sq78C8XlngcYZcA7TCTSFBuanh0SHw7aNXTmSUnCeTkw+aTRuqdx2c
   TY1B7uD0G1MI6IBOo7UcL5aj+tyafMBKDNCSgklv1ekPTWLtXJDijnJvE
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dAGaf8Fk3JudgqKb7CzgBrhS1RYOSO3q2mUJZFW/mop0jdXsp0RTp81OK9riLQVXWwTZQ6shCJ
 V39kcAT/gGCPGg9BP1kTnBqkRKsoMmH6FDy4qTRdPuYormrbQ1UfoMVbN9Zom1ce+baMrQllCR
 1iBerKVD6RqXedCZ9ke1k+MJi5Y1lZGZWXO6hB351Qb/tD2NsuvTXXKFp4ooWw942MHaP7E+kH
 zrPkrRiwwd686ASXJqo8oCZivPT5+/NSmgRLJDMa5cpsOQkGqKUSKhYo2pPN0CPx8Qxu1XPqkO
 tBo=
X-SBRS: 5.2
X-MesageID: 36418240
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,398,1602561600"; 
   d="scan'208";a="36418240"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBZpWfOkLXg9vmVLwY0p7M3OTMYuh8YKGxjGqrNg/NQY6VWv8lt532lImkuzgbodzNWesnjQM9TxsH2yLEDQaIArT8DFVANX++fhKcWyu2zPUhuuf8wT+IcuwfTF6KlWYiNYvT2BJ3Ak+ErPeFHkKrBAfqTjMDfyMUCgWEQ0dU3JDKL+qM/SUsyFQol1VusBaplp0FikxddP4luedAMsXnzyMmwK7VamM/eWylxLvcRjR9KEsjFAI/mnA2ZVE2pKrPnSh+Q/1nrroU8RB4DzHXCrF5F1PN5XG89OINv0ux89DdG4XjdAsHx9RRj7KreHvQLJoRSdk5QkI+FTCDUuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tc0U3sVt46NDiGTDiofE6JPIa/13SAjy4T3EAcDPUBE=;
 b=DaN/EOSFK8iuyaXuR9nj2i/TIXEHcq/gyESTGZ7Qr4E6BIlg1e5PBgn89isiIb3A7vCGErV8cR0PZzsp3PLX3NyXjxdUpom6P5TgdykkpTPsiyjcR4ItnTUfLSdkYDol6QzPvQDsZwy8yPBubeHzP0gf1OXSCUssclJ533lL3LUQULOa9ZqODiqHUHCg2pTsvkaiXr6X7dq7BVk2xwT/7m9q5tpom61gPE9ltTNMOWMFJUmWSoWYymvdk9PqjnPxJHZJuLKTieJyx6wuyBYUjqlPT9TbbHAARtGpFWDbvV/mVtm9sqOJFrsd3WRWQWlmn1oesX+0jRcFAdcbuPDwdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tc0U3sVt46NDiGTDiofE6JPIa/13SAjy4T3EAcDPUBE=;
 b=jwBYdcTwBYPRyImBctjZeInQeD5IFa/knxvV7+bXAZL2M+bn2lWH3bzeQzYwiEx97PAd+7H3lSbY+XXrZdxm8NrQjCeezzIAisSEhxeNS0o3w1tEJnQhZ4WfHoKJSY4dYuaGNwhwZxLwCwQVU5z7G4kWNlMkzg8SaJmV7vzsG2M=
Subject: Re: [PATCH] x86/string: correct memmove()'s forwarding to memcpy()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <a23d148a-25d0-cc5b-6050-88345188ef5a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0d537de8-09f4-9971-466f-8bf42964171e@citrix.com>
Date: Wed, 3 Feb 2021 15:01:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <a23d148a-25d0-cc5b-6050-88345188ef5a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0353.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::29) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e22d68d-9799-4338-1d11-08d8c8549dec
X-MS-TrafficTypeDiagnostic: BYAPR03MB4583:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB458331E1F0BD8EA708D4EF6FBAB49@BYAPR03MB4583.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HL6Ss0XoQ4vz1MGrLVYoR1Z+bSeDkqVuAD73Dzpw6N0zohHWHb6UHkx9rbAsR3y9UokN4GpJAc5pn1lTqWT+af8sA0OqW0lINdG5Hex9/HJ6XrMaHts/sjOnuq+YwCy+kCfZaQmBF28EOXu0kQ/2slGEN6pKx4gCjAwEbyVvmhzf6ChBMYqKYNXqKZCnm/2/G2pdDKxnJwPOu/Zf7PaQy/r0pA1kYvCwpveTLk8jcqg2Y5Gr3tdO8WVvpMmDM7ee1bErSCNaZ++/3ll2bmhCqdu9N2ntIwBiQ0Lnb/uX1OnrBJ57Bpl4e5jTgJDT9nEWqkkHvgZFZXQnT7fi2zkY7eT549H8wLN1R1b/fpLlp69mcJboaj6JFiXpnAu53F9Ryj2GBwIAkzB1l4iG/GcbtuErvvL66M8zkcz6MAKoy55BRejy8rQFrD2ErqIXBZFDtvp05IdWrHf/H74HnVrGOnxiBGBtnzQ+w9Yr/v5RD01Tmmqs84iDmrOH1RFhtpadrrSM45Dye77+XqXYx9FAGFyn8e6f1TpwisJAK3o48IzCqHzBNsrEaKYXriTUODQTc3AB+qEvNvKtHQH/ppSHuv6whciWyg0rMbGKFcmC3uE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(8936002)(8676002)(31696002)(5660300002)(54906003)(478600001)(2616005)(956004)(53546011)(4326008)(66476007)(66556008)(66946007)(110136005)(2906002)(16526019)(107886003)(6666004)(26005)(36756003)(186003)(6486002)(86362001)(31686004)(16576012)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c1FmbE15anBUa0U0ZlU0a1IxSFFjUndOVGhsRHZwUUlNWnJEVWNtR0FIcStL?=
 =?utf-8?B?Vi8waS80TWJ3T3grcjVDYU5TV2U1aGdjb092eWxLMWl2VklPY0EzeDlKUFF2?=
 =?utf-8?B?M1pIQitpdVR3bWNYUzhKVTN3cVN0RFRHQjZqbkI0blh4VmluWEVhUkZPUWc0?=
 =?utf-8?B?K1prM2g2UERjejFQOUc1S2xTQ0o3Q2R2bENOelppMk50M2RBOXo3QTNrUTF4?=
 =?utf-8?B?d2tIV1g0NFdYUlRqNVhFNzI2VkpYdFllNTRKRmRFOXllcGU3c0wxbFVuSytE?=
 =?utf-8?B?Y3U3bXVKbUd6dnBvMllGdzk3VTI1QkJJYW9aYUZHWE9rdDkrZDhCSmZwWFAv?=
 =?utf-8?B?RDIxZE0yelE3bTcyQnAwazFDR3ZmemdxaThiNTNMRlVKbk01VTI3dlVXeEdR?=
 =?utf-8?B?S0hicHBaM25mR0k0SG5ydGdRdU5LRHlWdVRjTklTK1BjazJyclZUTEh0Y3lZ?=
 =?utf-8?B?UFBhZm5ETVJFUG9menJIajhYYVBsVWpnZXIwYklWUG16TVlYcVllOHRMVjRL?=
 =?utf-8?B?S3BXWHJZZ3hIU0hBbHFpTXhCV3VNNlRYeHdiKzVrYTBpZXpGMW9aMzkvdkM3?=
 =?utf-8?B?bEd0a3hJUUlyQWxOdkwrL080ODRMQVVkdDJlQ29BaVdzQUFOdUIzMjFhZE5y?=
 =?utf-8?B?USs3MVQ0UGxvVzFlQzl3M0I3akRLSW1sci9aZWh3TU5VdlNIb0VTNDh6V2JU?=
 =?utf-8?B?Q3JOMXJBZGhDaEZBd1ozR0tseDJ4L28yMTBKVVNVemxTY3ZobjM5a0hEU3dT?=
 =?utf-8?B?QURPSGx3NzR5QU1XWU9hTGVuejFLS1lkRk05WDlVcXdLRmdsWldEMXZmSjhk?=
 =?utf-8?B?dTFMTncwNERWRjJtMkxSaGtGUjBaZW12MHlOSHJyeVFyd3RKVkRQRHZRSUtw?=
 =?utf-8?B?NGlsRnlqTUR3ajlJeUlCeW5id2VyeGllUjd2VGRUVXk1cUpNN3BWeHhvNUVT?=
 =?utf-8?B?ZmJlWWRadzRPSGFjRFpJRVV6Nm5FTW1kQUpVanhXM1F5RHRYYXY0WVFEV0RR?=
 =?utf-8?B?RVkreTJlZDhxRklCRTBYZFJ0YWdUaGM0NmN6TGkvNHdRZW4xRVRaRytqalJp?=
 =?utf-8?B?NWovdm9IVkNLVm1aNGNzcW9kaWJhTW9BU1A4clMxNE9TTERpNXhVVXFiSXo5?=
 =?utf-8?B?RGxrbE9aNERrc2I3TWpma2ZxY0FtZVhZRmthWjFaZ3pucXl5THA0TjQ4Uk1E?=
 =?utf-8?B?NkgwZFJnblJrQ3lrbGRjTFhzVkEvQzl0OVNJZUVSK0wwSE5Icm1CZXg2cnpJ?=
 =?utf-8?B?ajY0cTNPSTkrbWN6eUtjVmtzLzF3L1hXNmdVNTVoaldpQTdXV2daYndSVUZa?=
 =?utf-8?B?K0hTVFphZDcyL2xZRkVDYUFWVVE2VEIyNUVOSlVhemFibFp0eXFTOXVVTmF1?=
 =?utf-8?B?RU43QTdZc1Z3dGhUYmx5WXdBZkkzS1BMMG5XTmdrZ1QrY0R6enducmtuU3R2?=
 =?utf-8?Q?BFGnGb7M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e22d68d-9799-4338-1d11-08d8c8549dec
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 15:01:42.6839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YC7olGAHS6BJgaiscK1S7dTh9akMeFxjBBQx970lTThRJ157mDeEdWStzvFGQzn+aztQOsa2XAvMaZHkT26hAsZZNWkiG6wJh0DPsQi9niw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4583
X-OriginatorOrg: citrix.com

On 03/02/2021 14:22, Jan Beulich wrote:
> With memcpy() expanding to the compiler builtin, we may not hand it
> overlapping source and destination. We strictly mean to forward to our
> own implementation (a few lines up in the same source file).
>
> Fixes: 78825e1c60fa ("x86/string: Clean up x86/string.h")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I agree that the current logic is buggy, but I'm not sure this is an
improvement.

You've switched from relying on GCC's builtin to operate forwards, to
relying on Xen's implementation operating forwards.

At the very least, can we get a code comment stating something like
"depends on Xen's implementation operating forwards" ?

> ---
> An alternative would be to "#undef memcpy" near the top of the file. But
> I think the way it's done now is more explicit to the reader. An #undef
> would be the only way if the macro was an object-like one.

I chose not to use undef's to avoid impacting the optimisation of other
functions in this file.  I can't remember if this made a difference in
practice.

> At least with gcc10 this does alter generated code: The builtin gets
> expanded into a tail call, while after this change our memcpy() gets
> inlined into memmove(). This would change again once we separate the 3
> functions here into their own CUs for placing them in an archive.

As (perhaps) a tangent, how do we plan to provide x86-optimised versions
in combination with the library work?  We're long overdue needing to
refresh our fast-strings support to include fast rep-mov/stosb.

~Andrew

>
> --- a/xen/arch/x86/string.c
> +++ b/xen/arch/x86/string.c
> @@ -43,7 +43,7 @@ void *(memmove)(void *dest, const void *
>          return dest;
>  
>      if ( dest < src )
> -        return memcpy(dest, src, n);
> +        return (memcpy)(dest, src, n);
>  
>      asm volatile (
>          "   std         ; "


