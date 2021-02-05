Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5EB310952
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 11:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81587.150872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7yYr-0000Kw-5f; Fri, 05 Feb 2021 10:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81587.150872; Fri, 05 Feb 2021 10:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7yYr-0000KZ-1q; Fri, 05 Feb 2021 10:42:01 +0000
Received: by outflank-mailman (input) for mailman id 81587;
 Fri, 05 Feb 2021 10:41:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdnZ=HH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7yYp-0000KU-TD
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 10:41:59 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c10c0c0-5f1a-41ec-b246-222c4485329b;
 Fri, 05 Feb 2021 10:41:58 +0000 (UTC)
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
X-Inumbo-ID: 8c10c0c0-5f1a-41ec-b246-222c4485329b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612521718;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=78Smq182kcln96k3zp/qk8qIQnx5uR3A2BgHjdu+2rc=;
  b=BPOzJpyeCkpksVZMmXbToeZcMpErPT0+zEawvNQ59wW7qW8lk2GvR0wP
   2P11Wq2j0PK9OAg0F98t0723ag9yqjGED6DY9yXodh6IrjrgsnULlI/em
   zaPfRqTwcCsbXNheotoPHKcZw++Pv+FNgY9vnhK6KNhF8/CoT0Y/VEOWZ
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0KAX4Gk8A28S9aoEOWk17kaKb59PzvH74uUV7OSVFebBtpIiOQ2y6b0ULA92jF+As8Z3HpgkqQ
 kWYqhzVcleMLBkf0Q1YTNMn/WA1EJCyjv1/GuH9GZYh0ouzp0Tyq7lvdpi+OCC34fEXj8vAX/4
 Ni+Jii6R+1Qq9Br0n7TuUOKdYnFCkc9onG8BuKqWHo2Bxg6jvpBHSfjRS4ZGhdtYjWppDDa57p
 7UNAoUcvEe4LpC2ev71Ev0nR/j/bnGi3i0Fw/sz4ZQ/Q4J+EwCJDQKMWeC9WDKxzmQZtlSROW1
 pSI=
X-SBRS: 5.2
X-MesageID: 37983576
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,154,1610427600"; 
   d="scan'208";a="37983576"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJJDe17+6kP789E/r6sj0QSwkL0P2HxyY0/2stM+ZVdVkCOmls18oWQpfyuxtw2fZdGarNFq8kfH0mKqNAfuU02IclI/DaFVKsGaePjH6JRW+3OZwcYzri5px+AZpftCQaZoo1YWq/BN6yNrFaZwjh0PXPQIfWuFwGIiVHT/UkWBROWvBYY9za3f7k4ZqJwohd1y7Sy/mMLN6R9hX+gyxnjRu5GgmGzYJ+K0tRl5GfmN5hjYXnmQNI2ydZpS20MfEbiRQeXe38bZt6u2z+PJSzv99HNhhv4FjfHZk6ODqeW4AMLjOCb0hPmviOfnEFVU8WOLCg6iuKOOwTi7tIEJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9r8eA83LOvRw2GSa4YUiS/AbKFJ5iGtm51D+Kgfpl7k=;
 b=fl82bik1cauUlAGeUGpoilhKjkcAyScXWIsxzet5+AEBcP2ShaCuM+1P+hYLKPUmymoj7+7+5hE5c/qiYOALuG8wbkZFWMabHIheur+Bq3XnGXarACOBr+n68udwAPwmVZnaAMJjdh7HYXtctO43xPlGwy3WQZAI1LjPZGJ0PYhidOy/q3KH5zKn+nVd8kXwCUtmBf0fpIORbBpSc2CXX+JwwSAnFapUWGadgSrbJLyutQ+pGv6MIZqztG/zkecz7dgaBsegEnfKdvC0bkmdI/YP5yQL2OS5DGf1LZWfdFAEaY9CQatVAll284addhOGf9Om6e7/HTbhrLt31RpiOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9r8eA83LOvRw2GSa4YUiS/AbKFJ5iGtm51D+Kgfpl7k=;
 b=OLjWYnPikqeQdZuC+4OwGi4VU3Jm32x+iPp0aUDBMfcxI/KWC2amZ/al3RkhI55weyBucGVHCHL/lmZQhoQde26SjtIWX+XePD+baDBlODI+MbepjHZyJ+hKQOjwih/nf113BbTgHp0U4dUiCxE5W/A1wFbOQbpa57BTtcccMzc=
Subject: Re: [PATCH] x86emul: de-duplicate scatters to the same linear address
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <6064996d-943f-1be3-9bfd-e872149da2a1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fcf7e123-3cdd-fd4d-6c58-36facb26a68e@citrix.com>
Date: Fri, 5 Feb 2021 10:41:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <6064996d-943f-1be3-9bfd-e872149da2a1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::17) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90fc2657-70ac-4f6a-a948-08d8c9c2a770
X-MS-TrafficTypeDiagnostic: BYAPR03MB3415:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3415288EC22FD5C41821447DBAB29@BYAPR03MB3415.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HpJI53bNls9O/rW+X3Iz3G20A+wnkwO2Mv2hYa9Ku2WKYQfGlvnn+m8XLT+VklINRD0nhSlgUZJF1Q0tN9shjdz8q8dezA6BAQCCDvpBf43hFeUVA80KhJmAhE2RP/KZxJ2kzrnFELtmaOqYDJSElp9a3IIEmQr7x4QH0Sd9YVWDHH4H5FOPA++Q89JP+TE3/L+YCWOh+U2JQVCVJWCGI65nHFQqk0DAI+gDARYK15erNl2mhPDzY2AlDempvHbpBEb6oRh+Awnwb1LjjTPrGUJSUblXGhEag1Y9xL4+M7OuC93jBXIRtzIRn4crU/Y/V6Qy0ppEGjKKHrmrkUZAC2euSFkYUDHdtTe+n8FNulHO1bqOIXHspqrbtjj/UWYgDPpYK+darLjol7Xkq7klXfuoe/duhVfucAvq8k52R5SG1jM1KRFRxeDRSdJ4fVQTTq7vFjXO8FyLXrCxak0QTUGBG5QcTR1GyOdY4bCDCoUQkbjSw8whqP37g8zCREj8TZYLkRHgGQrao0ajwkSlx6xotxIcQRazJRoVtSTUoHcEOtOdmOVLXUdoVhTmCS3Q3X8U/XdPYtnUdjD4WNynZYvcKa1DbUmQU/9pN8HNZN4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(31696002)(31686004)(66556008)(107886003)(478600001)(2906002)(8676002)(53546011)(16526019)(186003)(86362001)(26005)(6486002)(2616005)(956004)(110136005)(5660300002)(16576012)(316002)(54906003)(6666004)(36756003)(4326008)(66476007)(66946007)(8936002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?clNmVFVnaCtZTDFOa0FvN3B2RVF2OTVEK1JqT3YrdWVBRlNhT2hzZFFSZ25I?=
 =?utf-8?B?eFZvQmd6VlFHSURseDZmNnl1ZWlUaDNIQkVqUTRnRGJUbXRpdGRDZTFielhG?=
 =?utf-8?B?VmQ3RkpJenVjTUp1TFpZVklUdEhoalpkUVZndmsvZDJiU1hyVkxhV2lzTjVT?=
 =?utf-8?B?ckt6eDd4K2o5bmhSSThMa3Z0UGZlS0VqNWRXNktWek96SDV0UjFMdzR0ZXhV?=
 =?utf-8?B?cHgwb1pNeXF0Vzh1M2s5cEVrL0wrT2tZV1JueUhrZ1ZlQWxZZlMxTnA4ZWJw?=
 =?utf-8?B?dVg3VUY1QkNISkRSbnBROG5BMUdHZGFNbGEzNk0rRzJRL21jb0hEVzJuK1lr?=
 =?utf-8?B?Q1JTcUM5c29ZZG9qTXFDQkQvZ2h0eGt1YnVESGpWQ0RRNmdGNThTenVjVmlU?=
 =?utf-8?B?YWtRd3RIZTNrcmVzNnJOWGV0T2tMTDllVE5YcDg2WUgxQjZXL0g3OFZza0Fm?=
 =?utf-8?B?VXVWVnpFR1liNm1uQ3lSS0NJeERiNk1kYWg0Sy9ScVhYbm9ORCtidWNtSGxk?=
 =?utf-8?B?c0Zwb1pCRkdwV1M4b3gwUmVnMnBhV1ZlSk5vc01jNll6Vlhzd1NXcUNCeWU5?=
 =?utf-8?B?dVFISlREYXVaSlN2cnQ3OWZXaXJReU1JcllJUUNMK1RGWDNzQXlEZFJjRlps?=
 =?utf-8?B?SlRGeHBzeFN3R2pyMDJEWUJVQjZvNHE0QXcvR28vdjVpYUY0M3hnT1VYWDdH?=
 =?utf-8?B?aDdVaDhTS3VZNTZ4cUZJRlBBUkpCZW52cmdEemIxdHpVWS9nOG1nMjErVUVD?=
 =?utf-8?B?ZEM3ZExXTTZuWFF0LzRRVHpRQm1ra1dwVTNpYUVNU2hsVnoxNGhMQTRDN0pP?=
 =?utf-8?B?WC9ZeUx0blBnazUwcTJoM0pua0UwaldMVS9Kcis4MkxPdzd1djBGMmNjWmxC?=
 =?utf-8?B?YUdTR2tQNGtUVDA1MG9vQmg3NHVxdGRBeWdEdWV6S2U4RHFzc3BDSjZjcjMx?=
 =?utf-8?B?aGZMQXU1OWVMNkdkbzBEODZhcG5KSTFqWlBEQkI2MGhSMVdVQ0RhbldGaFRv?=
 =?utf-8?B?ZmM2NERrWllXaGJQWTV0UUl0UVVFcS9ncFFZWjkxdEV1ZWJyLzFIdExCcG13?=
 =?utf-8?B?cTYvUHdZUlphcTE2Sk53eS9GeWNyRXNUeEQ3MVFCZktPOGlQaUtxd3h3WlU4?=
 =?utf-8?B?UEFHYll3bXhzcTViZndTZmRyTkZuVExYMHdITzVJc1VaWTNpcXVuSXFJSGNZ?=
 =?utf-8?B?K25seFpiTzhnZURLeGJWM1orcGxBaFU3Z2dvOWN4em00L0dtSUdQdFEweGpT?=
 =?utf-8?B?enpIeWJPTlJlOWwzYVhSVUFhQjZic3ZTVE1TaVZlZ0V0eUZlSllXTWw1TlB3?=
 =?utf-8?B?MXlIbE5LWHc4ZmJkZEhJbzl1alM1eFFIdldGdDkyNm1iekFjNGFOSmlzWG9W?=
 =?utf-8?B?ZlJKZ2Q1SVExQk5jRFg3YkR1L1RwZHdiT3h4T1hPMVF1dlJRZlBYZ2FUMElV?=
 =?utf-8?B?U3BBb0pKRi9KQnFtdnN2SmZtYkVseVdvZXBSTDlXZXdJWDR1bDZQWTBJTU42?=
 =?utf-8?B?aE8wVWVkUVdwM2tjejBoeERpTWQvZ09VR0ZXWTFjbVJNZEYvbE9mSmtIWXZP?=
 =?utf-8?B?UGxYMVFtNDMxOGRHZVYwUTFPT1JkV2pQcS85N0tpc2J4WnBvSjN1L01UcU9N?=
 =?utf-8?B?SkM5MzNtN0VzYlpTQXBaN3VFZHduaE9WeEFJYzNZTTVOblY2b0hnYWF0Y0Fa?=
 =?utf-8?B?MDV2YVNDVXkrVGkvRytJUDJpYXVZY1hmU0FMNUEzeVREOTNFbUFaTm1BWC8z?=
 =?utf-8?Q?ZjGjoQEnQc0lfIwF19G245Y9Yg85qal1Bza3VBC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90fc2657-70ac-4f6a-a948-08d8c9c2a770
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 10:41:54.4211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jfHlaqOmryOSfFBsFiOurhG6tO0SsKLUHAncMGPSItfAn8cFSGPMGrx+VIzWCASF4kijjjUd51Va5fyGxXhkaohuj8w+KQxoLsd7IvRc0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3415
X-OriginatorOrg: citrix.com

On 10/11/2020 13:26, Jan Beulich wrote:
> The SDM specifically allows for earlier writes to fully overlapping
> ranges to be dropped. If a guest did so, hvmemul_phys_mmio_access()
> would crash it if varying data was written to the same address. Detect
> overlaps early, as doing so in hvmemul_{linear,phys}_mmio_access() would
> be quite a bit more difficult.

Are you saying that there is currently a bug if a guest does encode such
an instruction, and we emulate it?

>
> Note that due to cache slot use being linear address based, there's no
> similar issue with multiple writes to the same physical address (mapped
> through different linear addresses).
>
> Since this requires an adjustment to the EVEX Disp8 scaling test,
> correct a comment there at the same time.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: The SDM isn't entirely unambiguous about the faulting behavior in
>      this case: If a fault would need delivering on the earlier slot
>      despite the write getting squashed, we'd have to call ops->write()
>      with size set to zero for the earlier write(s). However,
>      hvm/emulate.c's handling of zero-byte accesses extends only to the
>      virtual-to-linear address conversions (and raising of involved
>      faults), so in order to also observe #PF changes to that logic
>      would then also be needed. Can we live with a possible misbehavior
>      here?

Do you have a chapter/section reference?

~Andrew

