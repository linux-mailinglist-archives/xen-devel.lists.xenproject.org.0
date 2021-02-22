Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B203219F2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 15:15:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88098.165509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBzF-0000Gl-SK; Mon, 22 Feb 2021 14:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88098.165509; Mon, 22 Feb 2021 14:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBzF-0000GH-Oh; Mon, 22 Feb 2021 14:14:57 +0000
Received: by outflank-mailman (input) for mailman id 88098;
 Mon, 22 Feb 2021 14:14:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rhT=HY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEBzE-0000G9-7H
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 14:14:56 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d116a056-e9df-4980-b0a3-5602308c7432;
 Mon, 22 Feb 2021 14:14:55 +0000 (UTC)
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
X-Inumbo-ID: d116a056-e9df-4980-b0a3-5602308c7432
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614003295;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3lmTV1PBGM3mXwHF87/m9EanEs9qhoWaVDRMmX6XpzM=;
  b=G3a4Zh1/RHEDbUs53ULECK25TMVz3v9H2kuIDp6BLgU5RximgXPLUyvR
   Vlkv9Nd0iVBKbdGPLRLM6COJNEGrx9nAIY6MEaenx+J22TaM+55jL53iO
   4P8TWp6ylTo7fsEo74g9UTlN60PE7sB5x6+fEkeV8GuM4uCYGFKtYRWyi
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: C/0ZGe2hfj7XGcu+wLznZlBOB2NKuHixLOUaaGQdeDBEL+H6HjTWMTVdffmO9EHuZ8hrp156CM
 WN00SbnDbGPnoKK8+zcPp9ERHijvAsvRVo5LaEM99NbBsY52nzvwSOygvQCujDMAf7VoVmj2UX
 WprtAf7tuoLcdegjFB0ZbguAfozzmuoBnvtXdv/4BIKo8orxcYfT2dPClKaLIlyyy07A0IcLIc
 zHGP+UBMkxLzZTFp6X3FyBKPiCI4QhjmLyJSu29/MS6s73gC+7GmwPKEcaTZRgD7YFtH7NtEmA
 WCA=
X-SBRS: 5.2
X-MesageID: 37668868
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="37668868"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fofRHSN6xY9+vnXfb7VV74xAT31ESyxgxy+F8bHKXQKHvWaNWgjn5FD259U0mrtFpvs2AnZ0q/+hRBmTUXoCZexGS11dNlLq0sQ6siY5/rO0H1vycQUSQnrfIjPyxzrVulMeZARG+KC/03qO0Bq0wl/HBtvsU+vZz28pDNPqsmRYbUFokwWqVZ4H7cFYrpmC02OQFPQCA0au2NiBVxhhZMaoT0WQ22TCuSQ0Poez6uuUVAAZ6cHPmgI5O/ejRm1E4pcu5A0diFpHfAm4Kjm3CIG2ZiyQ+OZOVvxrTVoc07WrD0PxNiVZpDnhbGeTRYfaG42UkQcCuOb79oFRVqfjsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m00Gap14DRqIJ0WKC6WtlbHhK11veJDP5sWPZ6s8I6Y=;
 b=NZvtaMpBWo8RJGYVCozl9311mPWs917kDzW/Fi9GV+u8gvtD0E0IQMtdXjNLujqye/8RPlPSeietGRQFLcxV2jhhwCCyhjv59tytNO1tlFLQECQdqH3PVunFV9zwKuOaJd6QRciQvx0cPmov8NXsORRrPSOeVL+NWV6fuDIvxTttAp6fB59vVw45N/agbqEV7o1FZ/6BGdg4gvRuoxWmILgZdvNeVN3Af1muYhxLwUUK0Z+Ew0npgVD8P+V/Q8rApBjgaKnqtQoULm030i9XiMEOywp1bb5eO+5ldKl3hQCx/FMO1877Mto65N7c8D8EEyazrT59HO5kCdNnfF7Y8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m00Gap14DRqIJ0WKC6WtlbHhK11veJDP5sWPZ6s8I6Y=;
 b=ToLWKPtYAclJVr8GFV6oYGcuAaDEzB+dai/IN8i26BEj87Ku9d0VkS0a8v6l5crIpGhlrWfqDXUktzdc8Ov1xj7+R4AnKyRFGaKmwR95Vlr9q26faUahUzDzHdQT+LJz8SxehI2sVLilCeYNUjecmni5azCRjC8BN4b8uMH73Is=
Subject: Re: [PATCH][4.15] x86: mirror compat argument translation area for
 32-bit PV
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9eade40b-bd95-b850-2dec-f7def66c3c7b@citrix.com>
Date: Mon, 22 Feb 2021 14:14:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0166.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23791a90-fdd1-4787-c0bc-08d8d73c37ae
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5854595B0A43C98E75CB4337BA819@SJ0PR03MB5854.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pfmqJrJKeBLI/gpikLCyZ/nZuT8Dg5zxqQapgru9E/5648451bGDG3se9cicLRwKQ5CuGEkJSRFdZPJJcqQUjCpBc7jVhJOB/MWUGcwGi1WSzn+cT1o1tGmBcJRZvm5nU2kGLWSEhM+cB6rnb4B0v6H/nZXuHX/gZHeM2vK3c6UyLzdXDFExnSxQURQ9aLuBeXbRCrgRLNjjzOjRkIPaU0ueGKrzKq7Cj+cEYovc5Lwu8ziyRYwfPqjwQvoDvBbEpSD4VtkDgOTIDwpgjusqRLsInFmjMEShgoyIto/gi6R0HbSzm2kbMJF9XL4/vVi+SePgngFyZyTWscH74ArppcK+w9J05h08MrZyhze7Wvo+aPVYcjkjGy2QdVnB2lTYtvYlwyUNSa47Lbh+1gqm8xLNFevcPoEtWCuMgTX9FA1JQ4A2gSmvBPJdjO4cIPHVVFX2/JdBmAkzKQ/j/38GoBIA1AUYTbruUGGYFGqCRUUVVNOEoWIzMQyRfhM8k3oKfJxeiR+XiA7M+EkCR9XwwwbH83Ljtg0jcGswsEwxfw/tl4U4798TERzJD6W0Zr+5U62DwEfYlLAniW68jMM6u72ZvZEwNKs1y6B8+6BI33w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(6666004)(36756003)(2616005)(66946007)(66476007)(66556008)(956004)(478600001)(83380400001)(31696002)(86362001)(53546011)(31686004)(110136005)(8936002)(2906002)(4326008)(6486002)(8676002)(54906003)(16576012)(5660300002)(16526019)(316002)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TGhpVXRWYStseFFkalBySFlJNHpMdll2eHZaS0tHOVB3ZnY3empJZHZsVDdF?=
 =?utf-8?B?U0grYWRvak9KNXUwVUpMS1AzSUU4dWNOTEhWKzJ6Z09IV2NWWUMzMzRGbnNa?=
 =?utf-8?B?VzR1OTV3eGhBNGtkTGFlcWNIRDJJQTJLdnY3UVkvVml5Z25HMmFVaVM1ZUdH?=
 =?utf-8?B?L1VFRWVXUHAzQjVOWUhWMkROeVZwaGJsSEhvRU5XTjlBTFVLSVVycmxCYVZ1?=
 =?utf-8?B?dTB1eEVTUk5KYm9qMXNub21EOFEzZ1RHNCtOMnIyNCs1UVdpQzBQc3doaEJD?=
 =?utf-8?B?RkdUSHl1RVV3Szl0Ny9SekRoVVYzQTlZUkg0SE5CdW9xRnJSaWhZREVWUGxo?=
 =?utf-8?B?eVFGOTE4a01iamp1Y29WRnRHV2J6a0lraUJPVVlzalR5bTB4SUtraDdhN2dw?=
 =?utf-8?B?ZG41ZURXT0JoLzhqTExXNVJ3U2RnUkZrRlFKS0EyenRaSnoySW0zNE1heVhh?=
 =?utf-8?B?di96R1BSQ3lpT2ZORDdGNXhiQjBVV2xjb1lZNUVXKzVTM01YQ1JEOE4yWjBn?=
 =?utf-8?B?Yk82cCtLUnRGRVpTNG9mbk1uV3phRXZXbzFyZ0NuMVp3Qkw0ZUNiMUNTVDVL?=
 =?utf-8?B?Qm5NUkhwT05VK2tlN2xadDJ3UWhncFJLUXdJOGxadEZnYkdwOEYvdXM4WEI3?=
 =?utf-8?B?M1IxMmF4U2lvbUNFcHV6QkZxRFFRMHFYVE9iZVJzRWF5MGtMdmlrYXZ2bFN4?=
 =?utf-8?B?MjMyTTZaZ3NxU3hCZVlZb3YyeUJRaG45RGRWS01GODdiQXM2TFZRYmgrOENS?=
 =?utf-8?B?RXA2eTJMVjlLQjd2Q1BXOHFtcXdvR2kxL2FWRXM3dWxJLzFRU0x5b3BWV1Np?=
 =?utf-8?B?Tk5KWENoblNsWC9hemdJTGpvVFFuY0l5RWV4di9YY2poLzkvL2gyY1Y3eFl3?=
 =?utf-8?B?K3ZUSmd6dHBoWmQ0ZkY1WjNaYVdWaVBXZzR0QnBTaDgyY2dhKzk2RmRGU2pJ?=
 =?utf-8?B?QW11Z2tSTnlZYWxmN01JcTlYZEl5dGl3ZU5HOHhiTk1KVDgvR3lRclF5RnRX?=
 =?utf-8?B?MUU2bmNvRHlSSk1SQlZYWjZWc0NFSk1TOFdObHhYcW8wSjFyWEFhbVR6YlJh?=
 =?utf-8?B?dmQ3cjVVaThNaWRZTkZmQjV3aGJKNXMrRjVLTU5sM2JUUTdQUWlBRlV1b3Iw?=
 =?utf-8?B?b0ZDd0lBNEJzcEwzYkhON2hPMGltRlJ6eURQZ2hMTUM2b3ozMTZ2Z1FVdFJJ?=
 =?utf-8?B?cjI1VWlnQUYyNUh4QmJqVGtCOVN1VlF1UjNUVHdDMEQxYko4aGJMb2VCalQz?=
 =?utf-8?B?UEVnaGpSODFJRTkxa3F1QXc5OFJSSlBZQTlHV3oyNzhmdjZqaXd1dEdSWWdH?=
 =?utf-8?B?NnArYXBleWhxOFNkVlZWQ25kZnFJZVFDd2hOZE5pTW50MnJZZ0FCdXY0Z09w?=
 =?utf-8?B?YVlLTy9kUi9UckpUN0hUSDRsMHRvV2ZsUHpRaU5PeWFiZ3FuWFZLclN2aHZy?=
 =?utf-8?B?Wnh5N0pQZzJmVVBsbWgzQ1ZIQ0U4OUlEZElIMnd5N2FCVGk5RmZLdTNReGRr?=
 =?utf-8?B?ekN3Und4blUzYzVFZkw5VktIcmFwcXR2aFQ4Smw0b09sNFZBZ0pXY3Z1dyt5?=
 =?utf-8?B?RnNuemNQaVdqemZtNFJidmpnQmJRaXRqVkR4WmlmQW0wSW5rdG55bHptU1A1?=
 =?utf-8?B?Rmd6aUNwTTlYcEpRYWp0d2E0QXR0Y0lvK2VqNVREOStTK3NNcy93NTJRYmkw?=
 =?utf-8?B?ZDhMMzd3VWtaL3VXSzNLS2dyRzVsSzdpcDR1dUNxQ2FjSFQ5dnB6SmlPZUZ3?=
 =?utf-8?Q?VRsAVUKfcThUDW8q6EW5Ob7KhqNeb+d16LIZ/kR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23791a90-fdd1-4787-c0bc-08d8d73c37ae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 14:14:50.7113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnwZoTsDsJqViCB1LHJNc5e43UwNds5N72aZQjYWSx4pE+QN2khmfgPDF4pNQ+JfK+ierHTpYkT2e/YAcaP+524J9kd/HDl8uMMqyUjpet4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5854
X-OriginatorOrg: citrix.com

On 22/02/2021 10:27, Jan Beulich wrote:
> Now that we guard the entire Xen VA space against speculative abuse
> through hypervisor accesses to guest memory, the argument translation
> area's VA also needs to live outside this range, at least for 32-bit PV
> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
> uniformly.
>
> While this could be conditionalized upon CONFIG_PV32 &&
> CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS, omitting such extra conditionals
> keeps the code more legible imo.
>
> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1727,6 +1727,11 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
>                 (ROOT_PAGETABLE_FIRST_XEN_SLOT + slots -
>                  l4_table_offset(XEN_VIRT_START)) * sizeof(*l4t));
>      }
> +
> +    /* Slot 511: Per-domain mappings mirror. */
> +    if ( !is_pv_64bit_domain(d) )
> +        l4t[l4_table_offset(PERDOMAIN2_VIRT_START)] =
> +            l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);

This virtual address is inside the extended directmap.  You're going to
need to rearrange more things than just this, to make it safe.

While largely a theoretical risk as far as the directmap goes, there is
now a rather higher risk of colliding with the ERR_PTR() range.  Its bad
enough this infrastructure is inherently unsafe with 64bit PV guests,

~Andrew

