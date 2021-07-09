Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF993C211D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 11:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153484.283578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mMt-0004c5-6C; Fri, 09 Jul 2021 09:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153484.283578; Fri, 09 Jul 2021 09:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mMt-0004ZQ-1D; Fri, 09 Jul 2021 09:00:19 +0000
Received: by outflank-mailman (input) for mailman id 153484;
 Fri, 09 Jul 2021 09:00:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqbd=MB=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1mMr-0004Yf-3A
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 09:00:17 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13997968-e094-11eb-85d9-12813bfff9fa;
 Fri, 09 Jul 2021 09:00:16 +0000 (UTC)
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
X-Inumbo-ID: 13997968-e094-11eb-85d9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625821215;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=PCQi+EMHDJS+sZ7ct1tpemYXZp+PSoR3mMxplyEHJu8=;
  b=RKeoTxy9uClq58binGX+UHA45ODoP7YtOo8b/Uug1V2jBbIX7Ihx9Tct
   fKyQNQphmnLaPTy967f7AfLpYCQU4QppvQexDPv1x25mBYlBSag9X93mJ
   9bg6TGIoNPMTakz/eNUCktaJBVOZmfDnCKr7Wyc1WighG7MG58/ch7Pau
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: D0Bx8NAqjgCM6rgXpSvGqpVwl3oEnp7K9wDSsreuFFQZM1jrXXxiQvWgbs7TJptO+1XQmRIi/8
 z+O+yCQHq18LeCT3OekVgHz9FjSap2YRKHe+8CI5+j+1iuvaZTqDYjhUq/ixJx9wu33HiCvhev
 aLs+a8oObUWZKmENKh063h7jKXmKLvWjq8paSHBb1sO219CCjxM72kBOkGL4U4I4S2vcTp1fAv
 k7NRfcyVWDZhXOwFG4ra+rG3oNmNWRSmMPkGYFyP6ZU2y04pnZgzG343WFWQhshtPwt+xOJ2Lz
 Lyw=
X-SBRS: 5.1
X-MesageID: 47909293
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+1gu8K0lszc4LKssuwuAygqjBUJyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTnyAtj+fZq6z+8I3WBxB8beYOCCggqVxe5ZnPPfKlHbakrDH6tmpN
 1dmstFea3N5DpB/L/HCWCDer5KqrT3k9HL9JXjJjVWPGVXgslbnnZE422gYytLrWd9dP8E/d
 anl7F6T23KQwVoUi33PAhJY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeop8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4K8uZkRkIMkjgYJq3MkiFBs/KuZFIMu60vFoLA
 BWNrCe2B4MGmnqKEww1wJUsa+RtndaJGbPfqFNgL3S79FspgEM86Iv/r1Xop4xzuNJd3B63Z
 WyDk1JrsAEciZEV9M2OA8+KfHHfFAlByi8aV6vHQ==
X-IronPort-AV: E=Sophos;i="5.84,226,1620705600"; 
   d="scan'208";a="47909293"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2PwUfHndHwtFwed5QCn13g+DAnuntbPEhQG82Aq94NoDWZzM65F0V+/G2eAAcqo0NRaHDQQHQ8pNBk3jrLL1Wt4HyOwXqo4azJJX23vUChKXy4f1hemP2FpLsdiseii5ovT8xA6/H6efJ2qVd+1dYAhKFNiW4WWazaqQZAuSGZ8K3c3PwNMydy8JP1ktAkRvPiIb6lf/kk0TL+PU3UmL/ljB7NB2GD4rUc1aW9tUVP5aGT7TMMgrWxhZpvULndvOvOAa7Vt7VvFF0aVPVmHBpnuyap8pEQsMWDSAONCfX+E49K0E0p9ix8HEs+s/dvbs2YjsNioa++PxqPnj7LxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCQi+EMHDJS+sZ7ct1tpemYXZp+PSoR3mMxplyEHJu8=;
 b=eFLhfUKuTELNDBv1mfHmN+pu8i57RU0FRG/QptN+BVNm6O+WXDqJsHwoQ4YqDKKPKpQFGoGvV5dfkj2Z3K3yHYGahxdNSAAqzqz5+2188w18Iksu4PUGt/kbeXVbd96yJJBzPkL9DQuFfCRORqm29r3+R5JCEZxIyOtu1HmLtOaIKcecNm+FmzGAKOEKQkEnB+tNQHf8/ESwpxExI4rdvuqmnNpvt3A4+ENR4V/ej7fvSaet46vWU3FAJVQOAER05S83qTlBlX3L95bgQUotRSUykwJvTvDYZ8K848anbbbycQNATzP3eUdCwNgHl+n9jjAbqP07r+z50Ve2wcFo5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCQi+EMHDJS+sZ7ct1tpemYXZp+PSoR3mMxplyEHJu8=;
 b=VsAfcvKHnVSwBG40aYnmaTLqAaejAwJxiimA+actR5Pi8xFcWj0N5+7OafnX3BIZL02/zlw0k+PR5bgDqbsFIwgf4PmN/FwS+SVshEI7S4kpGiI9jAkDkp+h7ZTlResPtHZRbF4A/2TCQWSXcmRewikmy4UzTyE/4a2MeEBU6ro=
To: Richard Kojedzinszky <richard@kojedz.in>, <xen-devel@lists.xenproject.org>
References: <585c34fd96c6e22847333d9d18843c0f@kojedz.in>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: fix vbd rd_sects stat
Message-ID: <522642c6-6ad9-28d4-469e-53583441287e@citrix.com>
Date: Fri, 9 Jul 2021 09:59:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <585c34fd96c6e22847333d9d18843c0f@kojedz.in>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0489.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46d609c1-85ad-4ad8-b9b5-08d942b7eedc
X-MS-TrafficTypeDiagnostic: BYAPR03MB4808:
X-Microsoft-Antispam-PRVS: <BYAPR03MB480803737C4B910643B7D37CBA189@BYAPR03MB4808.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M4IFpl8wf0LiLzFT4yrHzcTOpzd+5m6oizGYjREldTYc50riEd1jNco2rR9pMP6gq8Qs8e5kk6edZsURI1Dduz7iEyEnHNgMvZpJeSj2kXi4FNlyB7hkZ6KqtVevDyQ2i5m2e1wYZQ+xpnip/IBfAwDl9d/BuOieh/3skGRYojUvYV8t+f5j6oCiMnXMNpQLJfHFUr32JGcxFJIGsn7QD/P7GUkCOmDKwjwLXOFPsAOMTrr+qY5nOYxu42Q0xbLTRUbQDVwm5rss2kfmhTkDrRI6WCsXp59Q+pnvrr6L+uEg2rPXeVkbl7MjdrVKwH052CqMuObRq6sKBxUjFy5zJeD3C5sxzfGzZOlKmBxWL+yOUXKtDS5RKGUzmQ7WqzZYsd6D6cMySTfSWI5qNjTZWpT466aF+EaNi4vNfxO/6uB0r/XnEOJP/UPIUMAoLfAUN9EqVBM9/xgsbafz26Ag9PPwoqYXxzTEfH19ENrdWu6ghfOxScmQV7bBoztxoZf3fCVMB/QwxoWP9tE6ieOZ3J8GtNYiaS9tpY4TN+E6xssdKvRRHPIVv0PO42b/aAHzmHv9KQjRjVKFUocFtA+iJZfN8IAlXsCpdTYIgMU9BKBUpz0bDdu7Bm6FMVmVFhf9GtUDdFWvRa42EoNqbSeXshJ3n82zkf58r9MMYIbFudxJU776ZdF0esae46wPYoyOzLlA7s74icAR8En2NBzqrDmfbdZhFm5qERrVsyW8MRKwJzeqv8TSJjbbCBwRrOuwUpwGwVHixw4HqrqdjXWFGcsdei+ZKL+Ha4MjbvfZPoDNiGGxn+XlhD4Nu+/+6cY4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(376002)(396003)(346002)(2616005)(956004)(66556008)(66476007)(8936002)(83380400001)(31696002)(26005)(66946007)(2906002)(38100700002)(53546011)(31686004)(6666004)(6486002)(4744005)(36756003)(8676002)(86362001)(16576012)(478600001)(186003)(5660300002)(316002)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDlsNndNQy82UlpTYjdSSHZpQWF6d1pVckNhMDlRTWVOczRLN1ZFeDdPUE04?=
 =?utf-8?B?UUxidGcwak8yS2d3a1c3TWdoNnNoVStXNUJ3T0NmR1daYTJibnl3WEhIaHpR?=
 =?utf-8?B?ZVFHNUkyTmNRcWliUFQzSk44VmtzaVY3eUx1ejRBbTFLVFlYSkRGOTRMWFBV?=
 =?utf-8?B?cnRUb2RscG9DSXVnYlFtZE9yckdtT09FaXBpaUdOU1NJb0JtSXNIakNudDlu?=
 =?utf-8?B?K3c1TVdyMFM2OStYOHhPTHRzVlR1djZ2R3NPcVVicFVXSHM3UXRJN2hlSmtN?=
 =?utf-8?B?TFdKVmRaY2pYQ00rQTVGN1hvVkdVdGhLNkRYdlliVTdCRU1EZ3JVMk5tZ2pG?=
 =?utf-8?B?SWF2MXBrWGQzbkg3Z3ZNUmdzSTdQcTBqU2dyQ2lSVHN2R0RXYlgvcG83eldk?=
 =?utf-8?B?M2ducVJlRm1oQUVXSWhRbnJKaGJkT1BpNWp6dmc2ampvV01wcm1hejlxRWxo?=
 =?utf-8?B?NlJncS9XbGt2QWV2aWhxemFjaVBCdTIwaldrbTdEb0MySWtIdFB3OHRJNU4w?=
 =?utf-8?B?NjZkWXM4VHZ6S1R2Z005TVNCN0p1WXhIeE1BNktoQUpjSmFLR0Z0MGQ3a1ho?=
 =?utf-8?B?QkRkV2dUaUxMMWR3M294U05NcTV3UzBzTmdJbmVIMjNTaS9QS2VhMjFWc0o1?=
 =?utf-8?B?ZzBKODZueHFBMzJRR2FhUWYzSlhJMFZZZEFTOGFyL2pwTGdkV0I4VDMzcXNk?=
 =?utf-8?B?ME9NWGg4S0I5UDZtMWUrM05yZTR0WHJGaHVINU5zSitkSUFKcU95NWltTElx?=
 =?utf-8?B?NEY4ckpra3lXdjBUeHMvY0N5WWc5a3lWaGk3UHgvamFWWUhQeW1LcHlFVTIv?=
 =?utf-8?B?b2h0M05PaHRzeDNSbGp0aytYaSs1VmRGZ2NqUmgxZEt1U0ZWYURDQzdJMW41?=
 =?utf-8?B?YzJFRmZranR3dXE2VkZrYVVhZTlvNEdlS1VONy8zUUVXZUlFUXRrSVhOTG1Z?=
 =?utf-8?B?ZmFrTmQ4aHF2cVJ3VHh0Z0hGdjk0bm5STVFrRzFVZ0ErU082NHJVdnM0b2t0?=
 =?utf-8?B?T095MHVMdnIvNFZHUGZSZUx2b1A0ckhIVlBXeGMwR3MrY3BxNnhTc3ZkeFNL?=
 =?utf-8?B?N014dTFVOTY5cndqWUpTMXArUGtBV0dJUjYzcWxiLzNuck8rZjVZc0w1MjJR?=
 =?utf-8?B?SEk1ZzBJbEJDMlAxb1kwSFhTbElFek9ab3RCQlZ1Z2xYdHljL2JJK3k2UStr?=
 =?utf-8?B?ZUlpbEk1L3lSRksySXF5K0tuUnZobUJMRjdjdWlBMXBwUTVtcjZCcmZ1QitK?=
 =?utf-8?B?Ung1WHdSSGNhaWRJT2t5K2RacVJ2d0dXNHZuc2oxUy96TFpuNTd0OXJPU3VM?=
 =?utf-8?B?TGl5ZTRLdkVXQW5CM2pYWDZhLzZLbDVicllsYnovVXE4SXhuZWl6a1M5Y1F0?=
 =?utf-8?B?clFZR3JrUHpWeDBsU2E4Rms2Mkl2bWxyTEtSeUc5QThWNXBaMjZRUkVlY1pF?=
 =?utf-8?B?ZW9vVEtaaW8zRHFXUjI0WmMyQ2JGeVRQOUQ1cU11OGJLYkM3ek5FQ0R5M0xs?=
 =?utf-8?B?a1pFYlI1RWlDWHdLbW5PNGxnalhOYUhvRjdrMG9xMXVHMytFcHF0c2ZONi85?=
 =?utf-8?B?UURCWjdoYSs1bnVvSUJRbEszM0NiV0wwMGQ5MGlzT2VRbWZneHV6akg1OVhm?=
 =?utf-8?B?Mk5qcjB4OGs1OVpnYi9vRTNZdkZrNVpVOWRTWHdueWdWMlVLc0lkODI2M0E5?=
 =?utf-8?B?ZTgwdy9WZkw4Mjlyamhya0dPNFNCc0NCRlZzcG5LUnA3T3l5dzlUOFZjdDBw?=
 =?utf-8?Q?OUDbAxGFbLdF2YU7pNK+coXGHZMdHw0dYYEJYII?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d609c1-85ad-4ad8-b9b5-08d942b7eedc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 09:00:00.5815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/4DpjQS0O4MkE2TkjYNuaYG8K97uRqKZZHXQUvMTqZPQseFenuo7QhEFEHIQax0ixgevITuQOEJS1plAHNozOOrGixqclgU403VbOwE51s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4808
X-OriginatorOrg: citrix.com

On 09/07/2021 09:09, Richard Kojedzinszky wrote:

Thankyou for the patch.=C2=A0 That is quite an embarrassing bug.

However, for copyright reasons, we require all submissions to contain a
Signed-off-by line, as per the Developer's Certificate of Origin,
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Signed-off-=
by

Given how trivial this patch is, feel free to just reply to this email
with confirmation and I can sort it out on commit.

However, for future patches, please include directly.=C2=A0 (Also, if you a=
re
able to use git-send-email, and the get_maintainers.pl script, that
would be even better.)

~Andrew


