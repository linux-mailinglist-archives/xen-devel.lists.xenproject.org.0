Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB23FC804
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175717.320012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3dL-000057-2y; Tue, 31 Aug 2021 13:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175717.320012; Tue, 31 Aug 2021 13:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3dK-0008UQ-VO; Tue, 31 Aug 2021 13:16:58 +0000
Received: by outflank-mailman (input) for mailman id 175717;
 Tue, 31 Aug 2021 13:16:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH2E=NW=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mL3dJ-0008UG-VM
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:16:57 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61597f24-8153-44fb-b66a-6e09a09475dd;
 Tue, 31 Aug 2021 13:16:56 +0000 (UTC)
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
X-Inumbo-ID: 61597f24-8153-44fb-b66a-6e09a09475dd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630415816;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UbPKapcWuIXRvEUH/d+C+gmKCBte+a6bibrzVc9rrGg=;
  b=BR7SPeQbSv1da+U0/Ugq0pkCUuaDHUwxnOxVVpmmU6qEaUADHXpch8wL
   vwlo6NpEJrJZAFHbeFySywe1XYEw9Q/r+GXxrnc4p/rcLH7O0Cl0S4VSt
   X5s9wLjfwwZbMOTrq1MDRT+EO/9XjghlUpcVB0PEYp5d1qAn12VuSeRmf
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ef7OwBayHxTriIFYmw9qDdyw6zabZz2aiJ7CO2YcP/KSgSDpRATBLu7glF10HzZxqC4ANwi0bZ
 ieBN4zVZWm9i2Vdvjxl6l5h/PepQkrMJ/m+YBEXzDUinEV9nOfx7RQMUpKAGsQd/i5+Jdsjks0
 v/3+vB1SDCMalbIixCSgI0Z2BNn8QV9UFcFHpVS2ibVeHVwmpp4SVfq7t1M61aKmDcM/iMtm1F
 74YXxXsnireiQDo3cW6Ids512VpIxNPHbLf0fp4eAOPINqwQcX5z4QH7Tm4OgtDutXwu0BQPcj
 PoIJ3X1mibDY10vfwxRiuaJk
X-SBRS: 5.1
X-MesageID: 51295728
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:upaQKKg3Hv62lNCt6c0ieo5MvXBQX1R13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskKKdkrNhQotKOzOWxFdATbsSkLcKpgePJ8SQzJ8k6U
 4NSdkYNDS0NykBsS+Y2njJLz9D+qj/zEnAv463pB0MPGIaGZ2IrT0JbjpzencGNTWubqBJcq
 Z0iPA3xQZINU5nFfhSURI+Lpb+TpDw5d3bSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1Imj3sV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8fz4+A9opv/MSTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uduxMZ4Kwupk0adbFbRK5arIQZ8k8QOowHBjjG5IcuF/
 QrJN3A5cxRbUiRYxnizypSKeSXLzAO9yq9Mw8/UpT/6UkRoJk59TpZ+CUnpAZEyHpnIKM0vt
 gtW89T5cJzpsx/V9M3OA5Oe7ruNoRhKSi8Rl56Gm6XYJ3vDUi946If0I9Fkd1CR6Z4u6fauK
 6xHW+w5lRCN34HN6W1rdR2G1b2MT6AYQg=
X-IronPort-AV: E=Sophos;i="5.84,366,1620705600"; 
   d="scan'208";a="51295728"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+grZUlv+KKA8BC1xFJAitlmVbw4aDs9t38js2/OqsFFEhsDlvFtPrGfu9YASqmwIEFSu76PEeDupUDMOQR0OAKULRIXiNJ6W/KG3ddWLeeyDxSCbZFHRuMXJTMOJ/OgATNE2lc9njOmCWm8TOhm58Vcatnt8kGBE+4wS1B9YuZ42G1olEB6gLXopAbPRt1ub4s1fAS5E3QuJ4vKv967xM6vS1FnUnj3Hapjdmv6ApqjIbRjdMPKKqe91qgYw6bbq9ydQFlTCIrxc45B0bWWy/1NKJtWIZBBr8PJSbevE8APbH0klTm7FUuxrSNyYL4AkROgymrRDboyGRnGtFywNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbmiHIXfPxn0P76W+oaSNoaoF/UoozDovukYELV472o=;
 b=UhPUGSaZ3nPiB4cJBAMc99++pyMxARRLWNR49+hpOYN9kkLZbS+31mRPQ9LfgyYw/ZAkBt5mJEIE7aR3tAFz0gKVje24UvfsdEKD9/JF6cbMvsZbUoRC7maID4BUUxhFWrXuFfPj8t5wFKUj7yPnmk50iU8auOsKC5aQsknsOoDcCBbHG+6GqrmrYogtNgat5UneQXbzDNvPkowQr5lT6hlQuS6cH6UHhAcPpmVjLBV8dlIpF4esVycG+Rffyxb6Ogp6t4byE7kWS/eRExByUw2wPI8cpYw+VnlXTTmZL63W07b/erxdCfrLI3T0Rphv8pXKd8769a/3dG4nqUPRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbmiHIXfPxn0P76W+oaSNoaoF/UoozDovukYELV472o=;
 b=bB1ue5P+58D15mKsz18FmbDn/6lFKYXT8AYwW1LjRwbKBU18YRLr+arPkmWWoIJILjJ0fC80C5crg/ogDidNEg//KMawAK+IuAlijFQ4NmfNBIr49MlHWTtqftAw56TH6mNjxOMPl8umc+K3RNbNGEpn5CE3YBncWZHa+Ji0kkc=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
Message-ID: <ad1e33b5-d729-2680-7f9f-aa875c2d9cfa@citrix.com>
Date: Tue, 31 Aug 2021 14:16:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0414.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e5cd347-66d0-4efe-19c2-08d96c8197b2
X-MS-TrafficTypeDiagnostic: BYAPR03MB4485:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4485A94128115887F0894DBDBACC9@BYAPR03MB4485.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w501oDA8Up9dFeMcJekmRERNsXAwIFjXu20x8ewClOrA33kqW5Tu4+nRKhDdRUXWGS+2lQ0ARrfroKnB25R2xvyzQYKPpG9fNavtydnR4i30OOXoX7hPhZDkkv8jZOApy5VamqPkf5JRftr0RLPgymIPM4pJN8yywZnHryzwI08aHX8rnUcmFf4MlqqhLx8VuuKxviAVBFqFZ+KEwtfSSTBXZUpdaM/GwDBSUbg1BtG5onwGyoZ88jT5c2KjKoveTx9idueCta7vc70DPZb+/g3No1kyx10iwKp2cRuiKFJpccQ9O1QoIsdzubf3rxQ0WsK6UhSRaJ4IQ5QQJTSzwcfOrFmNBL4LhglT3ScTBrrNO+oCHdsC4J1cUwagIuDHxr0weNg5nlYn7Y3VhE9F2f7hI6O2il7JOHKkvi9gJKiWRw0t/9W3M3sAdtCD6zwFZxRaUeJ7ZHSctL0KhB6p8SI9QzP2/bZZNQsOLtlDaZsvzpr8zqg2gae8W+jZlu64DbdTwKbLLCu18gIdsbjt0Uqyp816UmBzYtA1J4xiFbucvCkjeghg70RoLNdGiZqaclRpkqgGlwKOdwL2hgcMq6ypT7Frpk97QfPWZB5bUvwnqqTxtfUt5nV4ArJxMgiO+TVs840oumw6nzlogur4QlXf4OYlu74r8uk6crKqmk3S27siANoBUcu0FAL8Q6jYbwFv21HsGB5CmDb7k3U2oi+IAOSJDC/poYoL6mUEp34=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(6666004)(2616005)(26005)(4326008)(66476007)(36756003)(186003)(66946007)(956004)(86362001)(66556008)(83380400001)(53546011)(54906003)(31686004)(478600001)(55236004)(31696002)(316002)(16576012)(107886003)(8676002)(2906002)(110136005)(38100700002)(5660300002)(8936002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTIyWHQyWUdaeTgvbjNBVm5qdGh5NU9YQnlaZEZ2K0NXRjRuT05FZGN2RUV2?=
 =?utf-8?B?V1YyVVdNVHZhRSs3Wmx3ZUhqTE9vZGt2RFQzR1ZBcXFEUEZ4YlNVRk9OU3k1?=
 =?utf-8?B?WHMyMzBleDlTTGwzYkhWOUZmMTR4cVZibkUwa0l0b0FXZ0U1Q3o4VVN3M25X?=
 =?utf-8?B?TnB2VFNTd1ZqYjRtQUt0Q3diSWtjSmwzQXo1SE1CMkJTT1o3dldhdThWRHlP?=
 =?utf-8?B?TjgrVmk1bWcyM0pQTUVqNFFkb0Nwc29NcW1MdzNxMk4rR2xucDZFdnozN3Fn?=
 =?utf-8?B?dWRSNzB3ZGRkd0NUeElndURLNUljWVcrU3ZuTm9hQ3NiWUtWcU9PV2dhQ3VH?=
 =?utf-8?B?eTlzZTNWMmNtYTRXdlR6eVhQalB4a1FWS1dYSEoyM3l2bHFNR09mcFMvWXBU?=
 =?utf-8?B?dGJkc0k1a3ZzRTZZaXNmdEdBR3cyQ1o4SWhOOTEwY0k4RU8zeDdPdllhWDFW?=
 =?utf-8?B?Nlc0dSt1cVZoZVFZRWtpcFpyOEp2STd6U0k4U2kvaHJKR2NJMkhCRFRZaGJn?=
 =?utf-8?B?QXNqU2FKNXFvWVBTN29SbjJqK050RnZuYnF3UGEyZ25zNTYvMEhkb1dJZEVO?=
 =?utf-8?B?UDJ0dnB1MXNIUVh4aEpLWHdlR3c4MjE3MHZOc0c4c3ZNMXZBSXM5bkI5a2tL?=
 =?utf-8?B?YW94M3QxTjJINzZEczg1Y1JHQmxYMVVOSzI1b1ZlRVJXeEcxVU56MWcreDRk?=
 =?utf-8?B?ZEZKOWJPazNYL0NsWWs3anJTeHluMVVwenFmUkt2NzJadk0vUitSOXQxR2gz?=
 =?utf-8?B?T2ZRbUFkQUZwbXk4Qm5XRDRqeEtZcHZaYm8wSnVWbE4ySXVNQXFtVGxaQ1pJ?=
 =?utf-8?B?aEFoSTM3R1RHcmhCV2h4Rnl5bFFEM3E2UmxLSzRRZFQ1L0VPbTFnTThYSTIz?=
 =?utf-8?B?VEo3Y3hVT3loUW5tV2owd0hqcGwxaE9jcUZBMTN2YUtEbmdsalIrR1BPZFNO?=
 =?utf-8?B?cDRyQzNzVDE2NXVEdGJ3SXJpVmhxU2IxY1U3SEtJUkoyeTNGMHRvcFQ2VXNp?=
 =?utf-8?B?OGNXRVlFQ1cvblZXNEFZc1I3MUFSQjh5T0x2dFNQb3VLa2pISzcwZElER2Ja?=
 =?utf-8?B?WUQrNTl4TVQ0dHBpR2pQcnovRHE3V0t4RmxzWEVqNHQvRVgxbGk1ampVUnZ3?=
 =?utf-8?B?WnBXV2hQaklnNFBvajJqZ2xheVJlanFwTW9KTS9JMWtOUGF4dDZodkxEZGpm?=
 =?utf-8?B?bGh1MENVdDl0U1hONkdNOEFSOEhQWUJmTkZqOWI5K0wyYXFxN0xHWTZ5bHU2?=
 =?utf-8?B?R20xWEVNZjd6S3pJckIvYVcyT2FIZDJVd1R6cGY0bkVOaUdSRkh1M2RRaUlM?=
 =?utf-8?B?em1RNXl1L2VFN1ZnMnFnME0rZktwWnIwUlhMRmYraFFOYXIzN040UDZCT3B0?=
 =?utf-8?B?YjhrVkYreXNLTE90eXdyNEY3b1JpZURtejJSdVNCRjI3VzJ0M24rMitqOVhr?=
 =?utf-8?B?RkN4YmFRMGdHeThwRHhRSG5XZnNWOFRVMUZTbUJEWUI0bjBQNEk4TzVRY1Vl?=
 =?utf-8?B?L2R4Q0NLNUxzb3hadTJlN3RSZTNvQzE2WmU2UHlpOE12dm4vVXlPK2NUWC9L?=
 =?utf-8?B?bGJsa3ZLRFd1S2RmREUxQWhSRDRDbFoxamRsUUpzdTFNNk1CekhDTkdUcTNy?=
 =?utf-8?B?bkxIa2FHREhtZXg4ejIxUWlwK1BIMjZHTGNpSlVUWUh1ZWpJVzU5eVlxWnBm?=
 =?utf-8?B?Y1dJN3R4YTNEQllqVTZLSFhFbnJnbTJRSGtkN2pwT1Q3Wk9LR2FFRjlkUlRU?=
 =?utf-8?Q?cnHuYwVqeh8UCHu4hSfAF4qmEjERBAcpc/lPd6J?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5cd347-66d0-4efe-19c2-08d96c8197b2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:16:50.2487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZ5NxmqZrWDleftG5tNvnoChR4a1dNUN0L26zNpGmUZ00yIg2hs1vIJyKo1jCZQxcOJs4iUA6Yjl8nuOwG1sBN6UZZsWJOR0xkufzUc6euo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4485
X-OriginatorOrg: citrix.com

On 30/08/2021 14:02, Jan Beulich wrote:
> One of the changes comprising the fixes for XSA-378 disallows replacing
> MMIO mappings by unintended (for this purpose) code paths.

Drop the brackets.

> At least in
> the case of PVH Dom0 hitting an RMRR covered by an E820 ACPI region,
> this is too strict. Generally short-circuit requests establishing the
> same kind of mapping that's already in place.
>
> Further permit "access" to differ in the "executable" attribute. While
> ideally only ROM regions would get mapped with X set, getting there is
> quite a bit of work. Therefore, as a temporary measure, permit X to
> vary. For Dom0 the more permissive of the types will be used, while for
> DomU it'll be the more restrictive one.

Split behaviour between dom0 and domU based on types alone cannot
possibly be correct.

DomU's need to execute ROMs too, and this looks like will malfunction if
a ROM ends up in the region that HVMLoader relocated RAM from.

As this is a temporary bodge emergency bugfix, don't try to be clever -
just take the latest access.

> While there, also add a log message to the other domain_crash()
> invocation that did prevent PVH Dom0 from coming up after the XSA-378
> changes.
>
> Fixes: 753cb68e6530 ("x86/p2m: guard (in particular) identity mapping ent=
ries")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -958,9 +958,13 @@ guest_physmap_add_entry(struct domain *d
>          if ( p2m_is_special(ot) )
>          {
>              /* Don't permit unmapping grant/foreign/direct-MMIO this way=
. */
> -            domain_crash(d);
>              p2m_unlock(p2m);
> -           =20
> +            printk(XENLOG_G_ERR
> +                   "%pd: GFN %lx (%lx:%u:%u) -> (%lx:%u:%u) not permitte=
d\n",

type and access need to be rendered in hex, or you need to use 0x
prefixes to distinguish the two bases.

Also, use commas rather than colons.=C2=A0 Visually, this is ambiguous with
PCI BDFs, and commas match tuple notation in most programming languages
which is the construct you're trying to represent.

Same below.

> +                   d, gfn_x(gfn) + i,
> +                   mfn_x(omfn), ot, a,
> +                   mfn_x(mfn) + i, t, p2m->default_access);
> +            domain_crash(d);
>              return -EPERM;
>          }
>          else if ( p2m_is_ram(ot) && !p2m_is_paged(ot) )
> @@ -1302,9 +1306,50 @@ static int set_typed_p2m_entry(struct do
>      }
>      if ( p2m_is_special(ot) )
>      {
> -        gfn_unlock(p2m, gfn, order);
> -        domain_crash(d);
> -        return -EPERM;
> +        bool done =3D false, bad =3D true;
> +
> +        /* Special-case (almost) identical mappings. */
> +        if ( mfn_eq(mfn, omfn) && gfn_p2mt =3D=3D ot )
> +        {
> +            /*
> +             * For MMIO allow X to differ in the requests (to cover for
> +             * set_identity_p2m_entry() and set_mmio_p2m_entry() differi=
ng in
> +             * the way they specify "access"). For the hardware domain p=
ut (or
> +             * leave) in place the more permissive of the two possibilit=
ies,
> +             * while for DomU-s go with the more restrictive variant.

This comment needs to identify clearly that it is a temporary bodge
intended to be removed.

~Andrew

> +             */
> +            if ( gfn_p2mt =3D=3D p2m_mmio_direct &&
> +                 access <=3D p2m_access_rwx &&
> +                 (access ^ a) =3D=3D p2m_access_x )
> +            {
> +                if ( is_hardware_domain(d) )
> +                    access |=3D p2m_access_x;
> +                else
> +                    access &=3D ~p2m_access_x;
> +                bad =3D access =3D=3D p2m_access_n;
> +            }
> +
> +            if ( access =3D=3D a )
> +                done =3D true;
> +        }
> +
> +        if ( done )
> +        {
> +            gfn_unlock(p2m, gfn, order);
> +            return 0;
> +        }
> +
> +        if ( bad )
> +        {
> +            gfn_unlock(p2m, gfn, order);
> +            printk(XENLOG_G_ERR
> +                   "%pd: GFN %lx (%lx:%u:%u:%u) -> (%lx:%u:%u:%u) not pe=
rmitted\n",
> +                   d, gfn_l,
> +                   mfn_x(omfn), cur_order, ot, a,
> +                   mfn_x(mfn), order, gfn_p2mt, access);
> +            domain_crash(d);
> +            return -EPERM;
> +        }
>      }
>      else if ( p2m_is_ram(ot) )
>      {
>



