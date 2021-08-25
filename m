Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDCB3F74DB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 14:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172141.313910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIrmH-0005It-1d; Wed, 25 Aug 2021 12:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172141.313910; Wed, 25 Aug 2021 12:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIrmG-0005GQ-Uk; Wed, 25 Aug 2021 12:13:08 +0000
Received: by outflank-mailman (input) for mailman id 172141;
 Wed, 25 Aug 2021 12:13:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACUI=NQ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIrmF-0005GK-V0
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 12:13:08 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f69ab12-a034-4eb5-a661-e1d675619c28;
 Wed, 25 Aug 2021 12:13:06 +0000 (UTC)
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
X-Inumbo-ID: 6f69ab12-a034-4eb5-a661-e1d675619c28
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629893586;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1rdx4H7Pkrgk3f3AFrkfPVmQW/lrMEclDuQ0tnQPDJA=;
  b=OI5o8wRooUA+T2AWOtk6VYFJI/gtLuh2f7ciTlsQAMcSS2Iojh8D8Y1Q
   +FTtvalJS0Hkr/BBlHQWT52Kbg/FyTOE1ZpXMGxA52trX8JEvWsJvN6Vf
   FNmMu5dpYyy1V5xQsHMYIHBrPti9hD6n7RM9XUsIzKJ6fze8Ak2j75dyB
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Fk3ZrPRMafCF4LGfsE+gdP/0Rc+n8zLOKfICbjAXgukvZtggpoRO+kSiXRG7WPoWj4E17s6OK9
 nHKhUM9nBsMkACtGETdl1aIGKARTO8hLT4WX+wAgDQBmeBRmHLwIQe8RBHWyX1mgPIsHnY0S23
 0uuIK/Z+S/DL66rjvn8GhGC83HW2vU487XHPBm7fDsBIvJw/GadNJRbSfdDOegnBCIJiNvA3nR
 ze/KIPzu1jwzfk7CZ0EmdPWelxb4xErFi7aSm8VPtvYOcTm+cwrZO2bsWGfCGbikmoPz/bhXnr
 baeL1I8f6Kx4na8eKDhBnsUF
X-SBRS: 5.1
X-MesageID: 52982971
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:l8Glna2QoV3uQmwahbWJ4gqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.84,350,1620705600"; 
   d="scan'208";a="52982971"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBHgfqSrWl3fOHJhdyr+0Aey1yCoWGeEIhcH5AOVzEADWlCuRTTyQFVYj9Z5MiMNF9lFHvOUmA21dUK/4Bb99vGIvK0QvbZfE5ONrCx21F3hvb0QsPjSU+l/thaDa6bjgUvs4wXO2iEA5k5+YWM1S2QpriA3FuGfC8DB2sEjn+p9f0QM58zKBLJ6qCCuetSP37M6BH4+YOMLR0mgsSrr45m0aDoe7cqSuX+ki4QEE5ymTtFgm6x1h3ZF2pVs0+iVIF7WBtaPlEBM2RGT8l4BiAz4eJLM7Ic7E/YpE64nhbdn7uuO8SKIBM6XsDrRQT8T8DOpeTaKkVyABgWqiQMwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjcwIFR2soi79DmaSSqn5JRnra4kUad/w+M3RBxZSHs=;
 b=hbaRv+i9RBZgebkXr0j9YlRzjm6rqXBNQBqGNE+pdaaBctJRbX5jNWloyuCmlUMyClA75dL0nl1TKSvUpTiuLYXMFjkDazTWqmPNGPFAPEvWVrlGSETvE/q9ZjxU0/GmukMSvRr0qwpW9ijWj9J8t+wotHEv29DEs7Bhxn2dTSBU0foQxQJyDJ0YnnXXqpKJrjdYXdag3gyxCYPavf/LUL4GiIQ0CrfGCTCcIW+Z9UfPP9xwMYpdeLa5N8bRVOjxTzB2TVK6DS9AR347vQ+219E31yFDQ0cDSBXHHhTJz+MoTiB8tlJc8V+0cht5I9ZLDpWvySIwxs3/4RcLVfKxOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjcwIFR2soi79DmaSSqn5JRnra4kUad/w+M3RBxZSHs=;
 b=he/Jh3bhjosO2xWMXoxvm4y9qnJErf5B/MEwO+dYeCBGvxlKwL6IHbaMidWK4mh5AtBgS484n39Wl61a4MIXSAfPEQkv908G0stTW89VNHStMHrVojsgl2gna/GBpwlRiCiIp8DqOZUBdERxMVHyltU2OaFjuHbfj8zQZiLEDM4=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210819162641.22772-1-andrew.cooper3@citrix.com>
 <75e80f6e-f7e8-60d6-93fe-1a48e40593b5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/spec-ctrl: Skip RSB overwriting when safe to do so
Message-ID: <e2efa715-b523-9c78-79c3-04ad6ee32746@citrix.com>
Date: Wed, 25 Aug 2021 13:12:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <75e80f6e-f7e8-60d6-93fe-1a48e40593b5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0230.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 412c2c83-f8ef-4cc3-300a-08d967c1af99
X-MS-TrafficTypeDiagnostic: BYAPR03MB3735:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3735359593319A9DCFB65C63BAC69@BYAPR03MB3735.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OoTcOTnQRz4MQG4DKjSOzeR3gohqNupvH1eW/odD3dpqRz4qqI+d/UlBlWYspxYKOOBxJCxNuS133PI4T7N02TbVX8iFBCn7iEqQHNR3xWkasuAGV/wA0jUQgsz5YFPYjwPv5hEIHH9KqPAc9RRrIuKwY3d/pdNetIGXekglMn6NvZjs0gwx12F8u5hiuan5/kYgtZVQRFh+Q3b8AzorB5/6D4eVqn92S/UPMIqTsaEltQXeDNy4s02xFOcsQTasMu1V5OM5dHq1N30Q/G8J8nBnQljeVX+AUhnPxu8GYttenp/30erpBDouiWkYCWPKeCwVv35egkP9vXxqSgjmqmbrKM9WUepC8nPzVVsLxiYuHdTqp13zvxWPIu++KFLDeghbvWiRSWEYt1j6rIGpsUa5sEJAmDjOTR5ZZcqh6oWNzJxvuBjbhNDtvpQzuLFG4W7D+m94GJtv5l8MVLtEIC2VvTbcBfX947VvgZuWcFdToynVgOZDzDsqrYwOTg5sQRMeuix++ex+A2fqiROzbq5ZsM4rbDPnLdlBhlTL+/KacAOZ0RWULCclCSZtFqNJsQdIJAW84JEfFSrduWRw4yGmcxSrg/THWv1p60gcWUOKofeCQLBj/Lie8u+ZLcWRLmzfOwOJzWIf+QYDERcL7p6PfqH3GSw7QOSkKyyzydf2XBYm5WN/+1tJOlNMsKm0/SoYPweWgqtJdir5adSkPtRmpN09pndOJCOR7z7i9EU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(83380400001)(55236004)(6666004)(53546011)(8676002)(36756003)(2906002)(66556008)(26005)(66946007)(66476007)(2616005)(86362001)(186003)(478600001)(5660300002)(31696002)(4326008)(316002)(54906003)(38100700002)(6486002)(8936002)(956004)(16576012)(31686004)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmkrUytobjZ4OGhSalFJM2xhNER5Njl4VHMyNnBDd1RIQnFDMnhQRUNCVElS?=
 =?utf-8?B?bVpob2xCdXh4bmlnVGZuNlFZL3FIa25xYzdrTElFK3AwR1p2VFNZV1ZOZ1lR?=
 =?utf-8?B?dlJuWnFUYWhiUVM1anpwUzJTZmh0cTN3N2xTU0FuS3F3RnR1V1hheXNIVmlj?=
 =?utf-8?B?Qmg1OWNpNmNUek12ZmoxdVhZdTlUN243OG1KZGNRUmNKNC9oV0VVS0VwYU1l?=
 =?utf-8?B?ZXF0b3c1SWlyaGJ4eFYrZGdCWnhMWmZrWkVaNDNaTDlYM0JjN25qVE9WQTN1?=
 =?utf-8?B?allXeUhsQU9IaDY1aWZtN0ZGNWdnOW56Vk1vUHd3ZVB4SmhmLzc5SWgyTFN6?=
 =?utf-8?B?Z2VnOHMzTFVNVExSWnBJZS81VHBZV01tVjUxWTNhdXk4QnZLd1BiOGQvUjIv?=
 =?utf-8?B?WFNUWFhROGVTcE0wamQwL3NVOXREb0RyWG9rQ0Y2S2JDbTk3WWpabkljRWRP?=
 =?utf-8?B?Y1J0RXJjQy9rcGtGT3VWakFwNmozU1hCdElNSDJZM25na2FxV2NxeUxINUVq?=
 =?utf-8?B?bUJVUC9NUFN2bU5iSWhKNVgzM2NXRU5yTnBPeEoxNkFSSnRNblhTa0hjME85?=
 =?utf-8?B?RVlGZUlVNmoyNEZKekRNT3RsVkR6ejlPNFloMFhGd0pYKzhpUGU0Mm82UWNu?=
 =?utf-8?B?OS80ZGY1WStuVFRaSGpaUnMwYlBzc2dNa3RVVkU3blBKOTlCQ01TTlRJb01O?=
 =?utf-8?B?aTB3VVRWY0RXS3dLaDlrcnE5dDU2T1R0Q2xJSWpJSVNEWUxucWtHcVNndElV?=
 =?utf-8?B?OFVJVk9rWm9tZXlMSkVsd21VeVVvczRlakhjSWZMdmdoblhSS1lKMGdHSWs0?=
 =?utf-8?B?Y0RBc2FHK2x2bHJNTzJPRis3L1g4Z2cxd0pBMmprS205bHlReDAyQzRTVURx?=
 =?utf-8?B?MTJxVmFFT3FQZ3BuenZvNFg0cUo1ODg3b2tqWFMyWDNzYk9oYWp0Mmoyc01o?=
 =?utf-8?B?a1FMQlVsZ2ZvZjIwaVM5Z0VGNGxOem5UWGFzMHJhSW5vSzd4c0pvQmhvYzVG?=
 =?utf-8?B?RGVmUjBFM3NuMVl4RVIyM0xWUE1US09xbW8ySXZuV3R3SkQ0dHZiZDhHTEVR?=
 =?utf-8?B?MzJDOVdJTnoyZmVBZ0FSTHJBR0xtWWhVZ1ZTc0FBT2NJeXZUUFNlZ2xGR1h3?=
 =?utf-8?B?UnIwTzNRc01UTkgvVkh5NktlT0psOGoxL29CTzNXZUlBOXpwVERsMUZmRVR0?=
 =?utf-8?B?ejUvYzBJU2IzRHJtejgvVFBhL3g5Q1h4eFN0SWYxWXJnTy95RW1vcXc1UFhJ?=
 =?utf-8?B?QWhFWkJwU2lxWnV1L0tYeFA1NjNrQ2ZveVl1aTdKNUtuTVZRRTVHaHNPZDdH?=
 =?utf-8?B?SStIeDJhZFlzQjVkOS9yUHVOVmxqaVV0V1FIQW50ait2Vm5TQXlYY1JucjZr?=
 =?utf-8?B?NDFXUHN4KzVqRmdYeXJNV3RXN0RlY3QvVjdSQ0dBTEU5OUxoVlNVMktoVll4?=
 =?utf-8?B?bE4xUnVURStJaW1QRzZuWHVraEp3bG9YcnVoZ1o5R3pmNjJyQzB4VzdPdDly?=
 =?utf-8?B?M2ROdG5xQ0JsMGtMczhkSFVIWThvMjlSeG56K29mRmJaTnVKYkFxMkM4OWpV?=
 =?utf-8?B?MHpXUjY4aEhQR25ncUJjRElWUlBzSkR1VE14anMwYkRuTms4bG1RRFgva09R?=
 =?utf-8?B?NTNjMy93SXV4aXJTdG0vVmxhajllQ0YrS0ZCc3lIbC8vNTVrM1Arb2JPZ2lF?=
 =?utf-8?B?M0sxaSt0cVR3b0VaL1RZVFpQVjFCYnJjYy9wS2tHMTd5Zk4yb1haY3BHdU9V?=
 =?utf-8?Q?+saOv2foMNObSVgo+Y4BrrxDHO7qxg/DYzI0elG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 412c2c83-f8ef-4cc3-300a-08d967c1af99
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 12:13:02.3226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5Df0Y45hsph9yol5H5aCz4Ki2JWYEqjM5OEB5l/Vb9ezbpMKhwE4ykHKAhpDxxzofF4om0jll8McGEFHGFr9kidDz9zt1qhiLM3GjzHvhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3735
X-OriginatorOrg: citrix.com

On 24/08/2021 14:04, Jan Beulich wrote:
> On 19.08.2021 18:26, Andrew Cooper wrote:
>> In some configurations, it is safe to not overwrite the RSB on entry to =
Xen.
>> Both Intel and AMD have guidelines in this area, because of the performa=
nce
>> difference it makes for native kernels.
> I don't think I've come across AMD's guidelines - would you happen to
> have a pointer?

APM Vol2 3.2.9 "Speculation Control MSRs"

The information about SMEP is in the final paragraph before describing
MSR_SPEC_CTRL.STIBP.

>  Nevertheless ...
>
>> A simple microperf test, measuring the amount of time a XENVER_version
>> hypercall takes, shows the following improvements:
>>
>>   KabyLake:     -13.9175% +/- 6.85387%
>>   CoffeeLake-R:  -9.1183% +/- 5.04519%
>>   Milan:        -17.7803% +/- 1.29808%
>>
>> This is best case improvement, because no real workloads are making
>> XENVER_version hypercalls in a tight loop.  However, this is the hyperca=
ll
>> used by PV kernels to force evtchn delivery if one is pending, so it is =
a
>> common hypercall to see, especially in dom0.
>>
>> The avoidance of RSB-overwriting speeds up all interrupts, exceptions an=
d
>> system calls from PV or Xen context.  RSB-overwriting is still required =
on
>> VMExit from HVM guests for now.
>>
>> In terms of more realistic testing, LMBench in dom0 on an AMD Rome syste=
m
>> shows improvements across the board, with the best improvement at 8% for
>> simple syscall and simple write.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> albeit with one further remark / request:
>
>> @@ -992,18 +1021,36 @@ void __init init_speculation_mitigations(void)
>>          default_xen_spec_ctrl |=3D SPEC_CTRL_SSBD;
>> =20
>>      /*
>> -     * PV guests can poison the RSB to any virtual address from which
>> -     * they can execute a call instruction.  This is necessarily outsid=
e
>> -     * of the Xen supervisor mappings.
>> +     * PV guests can create RSB entries for any linear address they con=
trol,
>> +     * which are outside of Xen's mappings.
>> +     *
>> +     * SMEP inhibits speculation to any user mappings, so in principle =
it is
>> +     * safe to not overwrite the RSB when SMEP is active.
>> +     *
>> +     * However, some caveats apply:
>> +     *
>> +     * 1) CALL instructions push the next sequential linear address int=
o the
>> +     *    RSB, meaning that there is a boundary case at the user=3D>sup=
ervisor
>> +     *    split.  This can be compensated for by having an unmapped or =
NX
>> +     *    page, or an instruction which halts speculation.
>>       *
>> -     * With SMEP enabled, the processor won't speculate into user mappi=
ngs.
>> -     * Therefore, in this case, we don't need to worry about poisoned e=
ntries
>> -     * from 64bit PV guests.
>> +     *    For Xen, the next sequential linear address is the start of M=
2P
>> +     *    (mapped NX), or a zapped hole (unmapped).
> IIUC you mean the compat M2P here - perhaps worth being explicit? I'm
> also not sure why you use "zapped": Nothing can ever be mapped into
> the non-canonical hole.

The non-canonical hole doesn't behave as "a unmapped gap" when the
microarchitecture uses 48 bit pointers internally.

~Andrew


