Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 229CE3CFC97
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jul 2021 16:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158799.292151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5r2a-0001r7-1T; Tue, 20 Jul 2021 14:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158799.292151; Tue, 20 Jul 2021 14:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5r2Z-0001ns-U2; Tue, 20 Jul 2021 14:48:11 +0000
Received: by outflank-mailman (input) for mailman id 158799;
 Tue, 20 Jul 2021 14:48:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8y=MM=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m5r2X-0001nm-Tx
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 14:48:10 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffc9e165-abfd-4066-b938-fd8ee80951a4;
 Tue, 20 Jul 2021 14:48:08 +0000 (UTC)
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
X-Inumbo-ID: ffc9e165-abfd-4066-b938-fd8ee80951a4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626792488;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HDBfrtPbftgfNXOy5gQSAx952JBZXpimI+76vEiwm9o=;
  b=G5DCQxN4CnxG5TQU3xALvq5QQmesxwHUiWLThNK8Ubn+8Tws9vhtGdo8
   LM1KaOKLVPsreCLidgtIOZO5cJwXKnTuFl/mwqGLL3qsXnTFe9Rv7EAjk
   NliwP4c0Dogyp65zrgXdHFgJ79alZRanFkqTyGttOEv0BeWiQPTOS8VD4
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Bfnqmtyzjrs7Z/2J6HdqBso8JYnmcqv1yIuBmc+YyiDw6UY7fLGinNNMp0Emw993Eg0sG6k4PG
 BMKEZo6CJY9jqwHy+BcFdaetlr3GZApUlb6mzP5EqzwUB0+Kcg3rN+Eqbx460Jmg9k+iYCkLU1
 TvIUXmchR/maSnKhBW+fcB0AT8QW2U4/KAnk55X1AtegLLdRP1uWXCKIXCkOFOY7tw78jp8F4O
 2AHS4cUaclAgx9LHdkXNOPsTpGN8Ax17miIO9DudTCnAtUhyJK16SaRgBrlc0xFT9QoQ5asnOx
 z5bKTPCt3L6nh4uOJpR20lA0
X-SBRS: 5.1
X-MesageID: 48717618
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Kg2Z4qysbBU631mKmGNTKrPxrOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjmfZquz+8K3WB3B8bcYOCGghrVEGgG1+rfKlLbalbDH4JmpN
 5dmu1FeaDN5DtB/LXHCWuDYq4dKbC8mcjC74qurAYOPHRXguNbnmFE426gYz1LrWJ9dP8E/f
 Snl656TnabCA4qhpPRPAh1YwGPnayEqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD69jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbUz11rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxyL5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwtmrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGagoBW+q3qYp0PJGbBfqBb0fbligS+3UoJjHfw/fZv2kvpr/kGOsF5D4
 2uCNUbqFlMJvVmJ56VSt1xGvdepwT2MFvx2VmpUCPa/Zc8SjnwQq7MkcEIDd6RCeo1JbsJ6d
 j8uQBjxCEPk3yHM7zH4HQMyGGWfFmA
X-IronPort-AV: E=Sophos;i="5.84,255,1620705600"; 
   d="scan'208";a="48717618"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+CdO/L8cSytjH4qFGmo4+LStJxpj4yx5YYKhEhKHcHs37q0Xx9H5Kk0F2pNCch+t+qj7thZaHWOhfumKtdt8EwZtVz7laxRzQyWqhz8Ix31L2vkyTPLueY64NLayJ2N4P0LJYbLt9QzClsSzj6nLolGA31Gp27JO4YedErQEakedykKbGMEtl+Uq9n3rmKnLn/NF9mpGMAd4Yu0GJ7gYS/ZeyE93nZeSydaAukWcuwAlkG5D09Ojl3U8h97Bc8v+cascMmNP4l4rvwgItXKRlc/RSpRFOqTG+Wky7VD8l17ZuBGIVYx8oGzRmRZM3BXJ5e5U5EBNqB2W91GnqF2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TQcZZGfdxXFd9mUeIoVz1FJtc3s6ePMUdIdij2JFNI=;
 b=A7C642ey9FSsabWQz8OAQdSdcJ1cmJC2njljiyHIizds90so6bkna8Tr0v79rqo9qqn19U1r/SMuXAXQbYVgUCojc1oSTcCW0FZhwD7bjnbK1978MbykbYomo/Tkw4ivsNPsjdtuJjCNdyyfhn5VKVwcsdzWvbbYsCCP3ofDzSdkZHPqD/i0xCf0pbpDyxI326B9fmWmRvj0zGVDLD6CVYA4vwO72WoV8JKuOWJ9POSoJT1x+0H8g3rRm9k0B9aygr3AEm43RXvzcWjvZC3NRH92b77vDz0D7u1D1v+UwaV36WeusFKjFqdr7ETo7jev2XHKE0sfCSBjEl9QzbM8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TQcZZGfdxXFd9mUeIoVz1FJtc3s6ePMUdIdij2JFNI=;
 b=p+D2Vjm7r2TN1k8stU/+TltgY7UJDAt7chet/WmOFNH9KsatqwQ700uFZbx7dTlZ+8aKvRwPrSbqB14ekk36BI7zCFmAOEUYS+AeNYrquAykhMjaplF/HkgDZVPHcwwpf6e5XFz/E1drZhDCfdomlO+DFM52USTwLplTjw0Blkc=
Subject: Re: [PATCH] x86/hvm: Propagate real error information up through
 hvm_load()
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Igor Druzhinin <igor.druzhinin@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210719111449.21337-1-andrew.cooper3@citrix.com>
 <2b12abb9-4fde-f21a-e763-38de14847e3b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2d0d1736-e4e4-58e8-7a01-4937c75885d2@citrix.com>
Date: Mon, 19 Jul 2021 13:56:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <2b12abb9-4fde-f21a-e763-38de14847e3b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0456.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5f534f8-11f0-40af-950e-08d94ab49c67
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6272:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6272C98BA34D639F97838EC1BAE19@SJ0PR03MB6272.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aSl66Kis/z79O9zeLllOaDDWo4+y/oL9IrQvMAbuA4vJc4/huwgBwLgsCgmhYiGqSlq9t9n3a3IDI2tgwa/hxKQaDXzEs4rmlJUMVpzGYraiVG9I98/gETOU4R9sCYhiQ/+U/7pMn1zdZgnPe1oGzIL2BHq4j3KFsmvkd8UKq2iU8/58q7rp7mdZsw5Ia9JvWTMEm0EhZqG+178UxmJvcsmeMBxX4bMyvL5S2QQ9liRT3kXYc88I6Wv+tNngTmQB3I5SEYPEEy56vbKnwpnIC/iB1CAFXXOrV9smMURiwSKyAJd7flvmb0A77LuoxoRt7a0nKkoSFh6Plw1Poru0nzMdWn8UOXjIWp22fO9fNijqdIhYbjxQg0+D9ErdtTWKDmi35QYHLAao4E+aLofTbFZdRMHZsUZd+TLZTWUEGrEzErD5iv1et6Z+8drFmuUv5RFEUOIDeTSvyFwxAKmmH/rFPGlpQaICWvZkPKaVgz/eMGE5NPiP17JtPhaKPGRJkmjdId0CkkEgKcS+UiF1qGdZOYwc3O+hG97Exp+Px/XXGXtRjpNqcNft0byGt/ocVqsCYfKd+tBBahp7Sx7WeYLxfA7VJB6vC2sjATV4/3Vw+F9Re1tfYSpKKQGEeF5WusBGkRhH1uLu/Sh1dbVMRavhtms/wsBFZ2PwqdzrjvWZ0BxtBi9SPhgN9gxgboXdrI/2x5SK4YwC57T6dw7NPGj2jFjy6OYiMOsY7Go6awo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(316002)(86362001)(186003)(36756003)(83380400001)(53546011)(5660300002)(54906003)(6916009)(8676002)(6486002)(2906002)(6666004)(16576012)(478600001)(956004)(66946007)(31696002)(31686004)(26005)(2616005)(8936002)(4326008)(38100700002)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHYwM01ScEd5OWpJQnVCMklJbFBGRW8rUU1ZN3hFRzRDUi9IZmRIcUhGWmtJ?=
 =?utf-8?B?anI0WXYrczNiNVlMTkVKZjNKNU83azdZVDJ1SGxuRFQ4NC9MRGxaRDh5Z3ll?=
 =?utf-8?B?M3g1NDVvMTRKdUhoQzJKQmd5Q0FzQzFjeUs5MWZ4UzhETWVkdjlRTGpBbWE3?=
 =?utf-8?B?a1V1WEplaEpIdWtpQ0Juci80ZmFUMm1FUS9zZktuSzBJWTh4ZGZQbU4rSUZn?=
 =?utf-8?B?NG82ajN6azBBWVhGUFJudmd6MEVzYUl1Q0hoUXQvdCtXdGVMTEdvNlROd21K?=
 =?utf-8?B?aVNkczdOaWxNSGNFSjQrc3JPYTlkMExqTnpRQmZMWTFJV3JpNGxPM09FSlg3?=
 =?utf-8?B?Q2xVTC9rNUhJam9YdWdoWnBxNUhWNTBpSGVUeFVRbnhsY0VTNDR4Ykp0QjBv?=
 =?utf-8?B?TXhXcSswRDk1VEtteWtpdXdQOEpTN0hRb2Z3d3Qwb2tNME9jN1Blakt4Yk9I?=
 =?utf-8?B?QS9TRnNiRkJoUHNIb0RyQTRyMWFTSUFVeG9TeTRPcFJXSUJvUzBrSHcvTTR1?=
 =?utf-8?B?anQ1TldCMC85NHBvdXgvWVRmb0ZnRlN2SXgxZUNLZ2FvN05nVUp3MEo0YnVI?=
 =?utf-8?B?eFNvUTZZd1pqZXBBS3YwNnJQcnVOeFI2SmkzL1M3SDZocU9GRVZhYVl0Q2py?=
 =?utf-8?B?MER4R2FNNmFxMnVobnRBZndZQTl6TUhISFFqeFEyeS9nU0pxNXhVQytucHVE?=
 =?utf-8?B?SEk2MUR4SHJlRlZRNDhrZTBXdEd6YUljd0hMazdPTXgxNmM1Y09xeTRaTHBn?=
 =?utf-8?B?U3lqNkNEN3kzVzl5OEk3MXBWWStRa3pOdGVtbldCZjVUWHd0SVFXeXZEcHZS?=
 =?utf-8?B?REZQZktmaTVqN3R6Z09aa25HWXlIamV1c0pNR3lQTmM3YzZveVpZWEozenJk?=
 =?utf-8?B?d2k4U3RyMndmdnJmWk5ZeVZRMUtvVW9xelRZNzBMcXFkZEdJcXpqTVlOL3R2?=
 =?utf-8?B?Rkl1eWdIMTRTQmJKMC9vVUhsV1FpcTNNVC9VVXp4eHF2b3ludDZMTGxHV3Fs?=
 =?utf-8?B?Z0J1WlFzUGVVaDR0WUJkazVDUWoydWJMb3ZMbTlOeXloVHZSQ0N1eUVVL1BP?=
 =?utf-8?B?THQwdk1iRmlFdnAvUDBXek1nOC90Tm94a3VQOFJCS0tFakpQMDM1WGN2QzVm?=
 =?utf-8?B?TklTM2puNFdaUVdCZHlzbGZOeDhBTWkxY0NUempMOWdTRjRZQXZwK25ZRFBr?=
 =?utf-8?B?SitnNGpLbE5nQ3BpTkZVL3JrMVJPUjAzSVg2SzhFa3MwTGc3a1gwS2lOdTFm?=
 =?utf-8?B?eERsZFhXU1FSV3dFWEhIcm41RlhqMWdHQU53cWNVclJrRS8xb0treTFTRzdj?=
 =?utf-8?B?dzArZjJMQTk4cXpYREpnVnVKeEZOaFBXMTNoa3l0VG5vV0U3a1lkU3RqUDVh?=
 =?utf-8?B?cWZFWFR0Y3d0TityR0Zsbkwzc0VoOVc3YkhPNDlOM2txUEJRYlBWVis3M1hh?=
 =?utf-8?B?Ky82aU9ydGVxNmtiUXVpelBLL2dmMXlQRWh1dVE4SHEvQUY5aHZVbDRyNGZz?=
 =?utf-8?B?SHErcFRLQmxRQnB2aUp1V2ZLVTFDZURwTFliKytFL2hUd0ZQcWdTcFp0NEE2?=
 =?utf-8?B?S0JiWXRObHF5U3lUVzVLTllRWXJpd1lqeU0wbnpiTk5SbEVya0dCT1U3dytC?=
 =?utf-8?B?ZUVNNmxrU1h3MDVscTlvREZMWFBiZ0hrcmF1Y1VsZ1JXNHBqTVdLVmZZK21v?=
 =?utf-8?B?a2d6aU5SMk1tczBYNXpzSjdNVmFjdy96U1h1ckpNWUdPNlY5WDRtL3d0a3d5?=
 =?utf-8?Q?nNk+2zJ7YIlgh8i3ZX6IX37WVevRqBdQiwDAG4p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f534f8-11f0-40af-950e-08d94ab49c67
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 12:56:23.0207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YoZXx2Olta/3iw50DxLtne7qPGprD/uZf2/acL2kU+3AYaHa0iq/46bkyBskY0lkKPMhPSk027iKHrG2t9Tc+bepRO4TsMmUwO3Tb1Z5zrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6272
X-OriginatorOrg: citrix.com

On 19/07/2021 13:46, Jan Beulich wrote:
> On 19.07.2021 13:14, Andrew Cooper wrote:
>> hvm_load() is currently a mix of -errno and -1 style error handling, which
>> aliases -EPERM.  This leads to the following confusing diagnostics:
>>
>> From userspace:
>>   xc: info: Restoring domain
>>   xc: error: Unable to restore HVM context (1 = Operation not permitted): Internal error
>>   xc: error: Restore failed (1 = Operation not permitted): Internal error
>>   xc_domain_restore: [1] Restore failed (1 = Operation not permitted)
>>
>> From Xen:
>>   (XEN) HVM10.0 restore: inconsistent xsave state (feat=0x2ff accum=0x21f xcr0=0x7 bv=0x3 err=-22)
>>   (XEN) HVM10 restore: failed to load entry 16/0
>>
>> The actual error was a bad backport, but the -EINVAL got converted to -EPERM
>> on the way out of the hypercall.
>>
>> The overwhelming majority of *_load() handlers already use -errno consistenty.
>> Fix up the rest to be consistent, and fix a few other errors noticed along the
>> way.
>>
>>  * Failures of hvm_load_entry() indicate a truncated record or other bad data
>>    size.  Use -ENODATA.
> But then ...
>
>> @@ -421,8 +421,8 @@ static int pit_load(struct domain *d, hvm_domain_context_t *h)
>>  
>>      if ( hvm_load_entry(PIT, h, &pit->hw) )
>>      {
>> -        spin_unlock(&pit->lock);
>> -        return 1;
>> +        rc = -ENODEV;
>> +        goto out;
>>      }
> ... use -ENODATA here as well?

Hmm - that was intended to be ENODATA.  Will fix.

>  Preferably with the adjustment
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

> I'll pick this up for backporting once I see it in the tree.

I don't know how much the call tree has changed over time.  Every
handler will need a quick check on each release.

~Andrew

