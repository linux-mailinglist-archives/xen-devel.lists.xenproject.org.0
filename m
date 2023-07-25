Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60339760AF5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 08:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569463.890230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOBtn-0007fq-Sl; Tue, 25 Jul 2023 06:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569463.890230; Tue, 25 Jul 2023 06:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOBtn-0007d8-Oq; Tue, 25 Jul 2023 06:51:59 +0000
Received: by outflank-mailman (input) for mailman id 569463;
 Tue, 25 Jul 2023 06:51:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOBtn-0007d2-0X
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 06:51:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bec80103-2ab7-11ee-b23d-6b7b168915f2;
 Tue, 25 Jul 2023 08:51:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7554.eurprd04.prod.outlook.com (2603:10a6:20b:2da::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 06:51:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 06:51:54 +0000
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
X-Inumbo-ID: bec80103-2ab7-11ee-b23d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnSweCAiqTVQQWqj9zMPMEpdFt786AbIdMcFcrmSXjIArLFKCRLuwY7pdvdhjAXlfGHMYeGINf6Z7TBwB9BvcoZ93k2dhmy69F5DaTQkrfKJIgx4StHaOWywIBdj4kXb0nZ0W/qqS8p5J/tYL65NHoUS+fZJsJ39w2INAh9r8SnEj45okm5nTBW6SJXVeJ4USjclt0NOCynq7Gy6LT/dgmTbvol2g280dmOR63+YMTOK+RTIIINMqHJFl1XM4pz/k5EQsMvA366pbE9gP69y1rFqA1Gr4RmGN7TX3RyF41bAMk7fClvRDiJxw7FN6JzWf+e53GHKyfvOEZ2JddLtWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0RbcNAgsxwzQByZOv0WqToh+4jZlbpzHh/ceuBS+1o=;
 b=WcUePRVDBwQx/vbHaXpLsLwu0BpBgMu/TXSk/zCKHcegwHdirgvhO7aDUioe/ZGlEsxaky6AAUg7tQ1SWWYP7H740tCKCoUnyertn3trM537Ir0XacKO49/9hYTV8yWUUK2CNUf9/TdRKWm+GpgrrL2wsVxFGrJxofAhRHmhejIoNtjRik3jDQqPhCuVt9oHaYkG6Q2wCxyUMchyTxPAg2MxVbHU1KSjH2S3yn8qjscPrMxzIv9+rDo9ViO7GnKjhx1dGVv4LFqHSRr1WuaFHhYbkwh8pQPgDTP2UAeQDhoM7zuVuhkOVln6uE2d9+AnM1IC57Yb00NYniW3MsWkSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0RbcNAgsxwzQByZOv0WqToh+4jZlbpzHh/ceuBS+1o=;
 b=mt3IyZyO3MnjIUYJ0v9BOQLEh676K15mttBxNa6x26QSqcQwH33kANMP9QJME1UK6Zyu662gMl8Z7OElYPcebUdPM4Oxe29pYdXAnLNj6jAcNOO3/Fj1L/UXy6syOBbm2SmpbKk4nAoxTcKGQMgSc/n0PZhkHa8Zto1or5hklXbNaeEoUc4YMSGb3m4RHKwe7kk2/4ZqThrc7eldcZyvp0C6iFOdj+85o4Zh62xodQhEzoy37C6dfbnMyB7d6Eq1E6eBeOdCFhpmcLt8L+8xIJsyx+MiRNhSgBkE+aC/ihwHf+tXL6HuQIF/hbCYBwgTGftne9kBTR18vv66cKPodA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d28d9cd-8cb3-6d03-94d3-e07a4dab9e95@suse.com>
Date: Tue, 25 Jul 2023 08:51:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] mm/pdx: Standardize region validation wrt pdx
 compression
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-7-alejandro.vallejo@cloud.com>
 <1eb58b83-87ee-d738-08b0-948a8b48773a@xen.org>
 <64be6c1c.7b0a0220.49ba9.0e38@mx.google.com>
 <79ecab0a-cb91-cc95-fd31-c76ec287fa9b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <79ecab0a-cb91-cc95-fd31-c76ec287fa9b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0219.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: ba029042-579d-4677-b4e0-08db8cdba1a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QT27KwuDGm5i5FJe22oYKqAyklBRKoatcmyxHKMqUbyBszDeWA58QTbuyeJzszKmByIi6CLx8EB0k5ratniHXKGYEpXv4UPMqma8/O+wqHCFuinznb60ijV71rh5T7rm8HMz31StLqCSs1l8j2ni+eoLbo8Vy6mcQzTpJJ9it/QDn8TZ/tqrNnuYw4dvC07bEPSK6S26UXpsK5fJRc2ppjfUm6g/ot2WbZvZo2so3G2T6FrWNXy3blCc1KG3qYZJfB1Jqs16F+0Ma550pTN3xGKG2tMe9kYk0+84O6kzimhxNFhrSOdep3jhWtVa4PSPvu7puWpqqaDw8VKHEsSBKtDpDVFKhDskyBcHSr0ruHwlZZn8+tpuVPkFl0IuUbNSNLdz0fpYOYPVV4hM+viR+uP4VcxSf+VGA+UKtD/Au+kmrGwRRB3UDYw/QMKb7K4ZqOawM1OcWFSLPZOEJ+Sl6shNc8HADDEh5iBAbUhvrQG+lGO9PtMQ1alLeH9I3b4llKB+7Ne6uNkjkaDSlW5FbcfOyzgXpqAswndjJgDgAMV31upLBqtTklUXHSkk9lLDjRr2/WRT3RIOwnbVMdeSm/HDdVcu4tOJcs40mPK+BWoSUqIgaoWWM1VclPAROnqwexzlBtxRxFcAVn+m+ZgPWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199021)(31686004)(8676002)(8936002)(5660300002)(41300700001)(316002)(6916009)(4326008)(54906003)(2906002)(66946007)(66476007)(66556008)(6486002)(186003)(26005)(53546011)(478600001)(6512007)(6506007)(31696002)(86362001)(36756003)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0pUMzVyaE9FVS95YWtCL1ZmSlhyWnhsblFDVjYxY1Y2ZjZVd1RhRDJLaXY3?=
 =?utf-8?B?SmFiV0JZYU1YT3NXSjhMQ1dudyt1SHo1azRQU3ZBanljY25RTFg0Sk0rYkRJ?=
 =?utf-8?B?T1FXREh1M3QwVCtSeVh1WVE3ZWF1bnpWV3NtRThCQnd5bDBNZkRFZnFYRXNE?=
 =?utf-8?B?eUVnSFBkSk1yWjlxM0hWeWNKWERKT2NlRmhBYXRNUjQ4MzhCRytyTTJHaWFm?=
 =?utf-8?B?Szh3UTluUWFxdFVTbWw2b0FsWmtaRklPeVJ3djZoNi8xbXZtV29YRysybHJF?=
 =?utf-8?B?QmRPaDJvK2hJdmw0Vk9NcFRqdWpXTkNuNjJpdzNJQ3B2L1A1YlZuQkJTMGZD?=
 =?utf-8?B?bENYTXZWbCtieC9GZTNXMnpZeGIwUFpQNWxGYmlQREFVc3YxNDJzclNzaE1z?=
 =?utf-8?B?OUlpSmhWN3YxelFrb2NzalJxQkdYVDVMTnJrbUxsaWYyVlhva0EwcFhpbngz?=
 =?utf-8?B?Q005OE1reUhCRGFsd09LbkJZa3JWS1BaeFhjd2JEd0hRTkpvSHVpUnp1NE14?=
 =?utf-8?B?L1M0MjhWbUtmSVZySmFGR0NUVVMrNWQzanR5d25NWmRIOURSN3doWTBMYzha?=
 =?utf-8?B?SVA5c01mdFRKVkNtZHBSejNKL0JzTW5uYzFSdW9BVDRmdyt5c1RrRXpYTUQ0?=
 =?utf-8?B?T0VGbWh1Sm1QeGMvVTkxMGxyMmRHNUlWMTN1Ukw0V1YyRkdncWhySCs4Y3Ja?=
 =?utf-8?B?Q1hBbmE1YXZjZC9WdUVwMXJaTnBmK09KcHdSRGxoK296Q1o1bG9wdWV0Ujhq?=
 =?utf-8?B?TGx6V1VWcEMrL3hxb29wa2pjd1pla2hkYVIxYWVLTkhuTzdjK3d5M3AvQkRO?=
 =?utf-8?B?eHZsbG83bEp0VTBHa2kxY205bTI1MkhNems4RTh6VGRIT2dSZDNHdnd3SStF?=
 =?utf-8?B?di94OGlOcVVEWlI4Ti9SY0IrbmZtSDhjemdiRElVUHhXaW96NUgvT3B1M3B4?=
 =?utf-8?B?TlJScGRrajF1WVN3QVp6bTkwZ3ZaejNBSlZsL01ZUVA5NllxMG13dSt0VkpL?=
 =?utf-8?B?ZldvcDB6a3J1TkY3QUpSQ29BZzBUdDdQbWg4VFhhbmMyYjVOdWhTd3B4WEhP?=
 =?utf-8?B?Rm5WTHNTTEthZlUxaW5QeG5xQmh2SWZ1MEIydlhkbytZU0Z3QUlHVVFZUW5B?=
 =?utf-8?B?cFpOUS9LNHZBMlhseXNNenkva2gzdHlETWpKWFVpaXRxRmE3TTA4QWJVdUlu?=
 =?utf-8?B?Vjc0U1RIZitPSy9WODF2Q2RlWTJrYVE3dFl0ZjJLUHBrYzMzNlp0Qm5WNzQ5?=
 =?utf-8?B?UEpKcFArcnhhVlVqVHdOYTVCZWFlT2lyMlhaR1J0QUI1WWVzY1JyZGVFcDJE?=
 =?utf-8?B?WjBHSHYvNDVzc01acEN6UzNUckFPSUx5d1VhM083L3dWOTE3WE0zY3hSVHNT?=
 =?utf-8?B?bUp0R2N0MmVjMmg4Qy95aW96U3RNZWVscHNGeE80ZThkaWhSS3BTcEkrbnhC?=
 =?utf-8?B?L0tIdkRlOW5EeDFPWUFEWGdSY0N5cElTZlhMVHNIUjhWd1VjM2p4aGU4V1pF?=
 =?utf-8?B?L0VrTkRYTTJteTFWSTFYdXY5TVFxeVE2dGt0VjBkUFkrZ0tEOFc3ODBkeVd6?=
 =?utf-8?B?QmdkcWZkWTk2TkY2RnRPcTRhRU52TTFPcUxpQjAvWHdlbTBRQzZMNHlXRDl6?=
 =?utf-8?B?QnI2UzlJNzBuc3NibXVIb1BPb0xpdWd1d2h3Qkl6WTdDY2Z4UXhaaElLK2Nw?=
 =?utf-8?B?cnBIN0VMN1I4L2pJQ2F2UFZtNitpYjV0c1NNeTJKeWF2bjQ2TXdwVU1raU9s?=
 =?utf-8?B?cjNMVkxLenowTDhMUTVENFZ1RUs5bWV6VmhENVplbGt5djFEMTl0Vm9FNWc4?=
 =?utf-8?B?a2tZWml2aDd3am9RSGpSWituY3FPRWY1VzVScmF2ZXpOS0JtTm5IWHBBVDhW?=
 =?utf-8?B?ajFoUTZxT0E0UUR2RUJYNS9uTE5vSC8zNnZyVEd0SW9tWlViTE5sMjd3eUpD?=
 =?utf-8?B?NVgzN0xYMkNmZ29xRmx5NFU2SzlCZHJEQ25IYjFQWUtuTDlmeVdDOE5TeXFl?=
 =?utf-8?B?bWFEc2lEWTd4TVBXY2lSeisvelZWcDRVKy93V1dhS3NjNXduc2Q4aEcxN095?=
 =?utf-8?B?MFZYM2N1anlMbVhYNjlTK29uR1VzbnFDS094T2dQR1dHWG5IWGxlL0hjS2dQ?=
 =?utf-8?Q?A8y9WQGJf7+TyqK06z5r8Hk/4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba029042-579d-4677-b4e0-08db8cdba1a3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 06:51:54.1668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPpR146zXfExDJzVxh++T1Gsyh4GrE2m6Kt1ag94zhtdzDzM2Hm0fxruXMkEpNgwlG4C2gDdThubp1DKHrhHVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7554

On 24.07.2023 20:20, Julien Grall wrote:
> On 24/07/2023 13:18, Alejandro Vallejo wrote:
>> On Fri, Jul 21, 2023 at 06:05:51PM +0100, Julien Grall wrote:
>>> Hi Alejandro,
>>>
>>> On 17/07/2023 17:03, Alejandro Vallejo wrote:
>>>> +bool pdx_is_region_compressible(unsigned long smfn, unsigned long emfn)
>>>
>>> For newer interface, I would rather prefer if we use start + size. It is
>>> easier to reason (you don't have to wonder whether 'emfn' is inclusive or
>>> not) and avoid issue in the case you are trying to handle a region right at
>>> the end of the address space as emfn would be 0 in the non-inclusive case
>>> (not much a concern for MFNs as the last one should be invalid, but it makes
>>> harder to reason).
>> I could agree on this, but every single caller is based on (smfn, emfn),
>> so it needlessly forces every caller to perform conversions where the
>> callee can do it just once.
> 
> That's indeed one way to see it. The problem is that...
> 
>> That said, I think your point makes sense and
>> it ought to be done. Probably as as part of a bigger refactor where
>> (smfn, emfn)-based functions are turned into (base, len) variants.
> 
> ... clean-up tends to be put in the back-burner and we just continue to 
> add new use. This makes the task to remove every use a lot more 
> difficult. So there is a point when one has to say no more.
> 
> Therefore, I would strongly prefer if each callers are doing the 
> computation. The rest can be removed leisurely.
> 
> Let see what the opinion of the other maintainers.

I think [a,b] ranges are fine to pass, and may even be preferable over
passing a size. I'm specifically using that term that you also used:
"size" (or "length") is ambiguous when talking about page granular
items - is it in bytes or number of pages? Especially in the former
case calculations at the call sites would be quite a bit more cumbersome.
I could agree with (mfn,nr) tuples, but as said I think inclusive
ranges are also fine to use (and would be less of a problem at the call
sites here, afaics).

Jan

