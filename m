Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0FB60E08A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 14:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430523.682295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfQJ-0001nM-EH; Wed, 26 Oct 2022 12:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430523.682295; Wed, 26 Oct 2022 12:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfQJ-0001kY-BR; Wed, 26 Oct 2022 12:22:19 +0000
Received: by outflank-mailman (input) for mailman id 430523;
 Wed, 26 Oct 2022 12:22:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onfQH-0001kO-US
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 12:22:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d41cabad-5528-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 14:22:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7369.eurprd04.prod.outlook.com (2603:10a6:102:89::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 12:22:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 12:22:13 +0000
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
X-Inumbo-ID: d41cabad-5528-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTVogthQ36FhZEaBS6o4AqRB5isJa9J33npjV4zo8byrLFNjvlixOH8jRaiZHQj7oT+nYJWk2m9iQUosUIiDYOvGUBFqkSUtQTXti9TDgIYABQ4Bnf+qSQxxx56XNn6JHwYk72NcZEI+m42UMn8cQKdKOeUUswjUNrIlUizcsIOzrHCpN0zn1GaaIG1PHrHUHF5RInE8GDsuzM9BjKBO5CkXSUB6Emlz11NTj9p7C64Zayyl+ZldAzEqgT8k56DpxWRu71X+H6nyEDeyFmtE0vgyr8e2Z2GuJa9jsQ/8BYSrkYcsyhc2NxwXiLhrj9tvQVqm6QCFu+kPRA/31J5WJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5ZL3M2l+5oszwDBX+lnLb+1M2f0j38MXzS0Lu5aqWM=;
 b=d6habteaZ+AEHpp01p8dfq2u8DisQoPZwXm2dM0l7wkdqPCYtRm+ZIV4gt4eQDW9AuugvyuJuJ5SuIBQd3VqrbDpb3sewU6d40pMoFN8AORgP00cwpmKCa/cbrSERYz5Ii+sWCvnnYHfWJafrOVFKZkZmFE+QjfdizG8ENG80sR3isAqJLz5nKZbt/LoIBy0tgWOJeg0IR6VBQmfF5WhpJcVOWtjx1xBXvjp/M51jaW7JIf6t2aHK7rOF07hJFgvqLUnLxhbQr0iPlr9JJO+GnuRcAg0Ip0ucmTqkBq8xXmIkapiOHpeDpXHekc/6CRgA4MRQdw2yQ9z0oO7N0aOYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5ZL3M2l+5oszwDBX+lnLb+1M2f0j38MXzS0Lu5aqWM=;
 b=ma3kXZwv0h8NYnTsR6ZTt5n6ZYtQQ0AnbzOAP5iRS9DYphTj7Vy1mkbtnS5GWmru12HO3rLSY6+sttkuqIbu16QdEE5p0vcnbddFbMIQBVPKzE96BidxEnKhBri09uV5lt9V/QiqMDe4zu6ggmPApNWPSpyCB6s7FBPCs8Hsexu3vRhcKpDci6VyIMC2bVNcu2alCQD5rRjQh2TtOCmcrNe96Wz8RJ5HdsZBPbEFZqHGqaRsvtTFVry8dFuL/OWTcDRxKE5KVGQMT7X7PLEothrXeNuykMTVJMzodBlfX9Ta8KyqoZEvmfcwQJwe3UHkD0YsC4MHbHd1R0lDEd+KMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4a7f3a4-1685-a14b-4800-2d1277a26a07@suse.com>
Date: Wed, 26 Oct 2022 14:22:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] xen/x86: Make XEN_DOMCTL_get_vcpu_msrs more configurable
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <854cdedcdd2bfff08ea45a3c13367c610d710aaf.1666630317.git.tamas.lengyel@intel.com>
 <0c7ca888-3142-1719-13c2-4f006ecdf683@citrix.com>
 <CABfawh=RXrPgj+MA-4QGogM0o3Oo4GEJ3ipbqHKE0TV4GHdCTg@mail.gmail.com>
 <f5673a0a-853e-fa2c-2f4c-e76b7b7aba87@suse.com>
 <CABfawhmjcv0mu4cqjTaOPxgrOuMQ5VyAA1OoNtOmr6g34a6Ezw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmjcv0mu4cqjTaOPxgrOuMQ5VyAA1OoNtOmr6g34a6Ezw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c03a33-2472-49a4-e6ee-08dab74cb672
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VmikshT5we2G6Y9GMPEIarHiX3IT4gluzAoV8CQbclq1vi5QzIFausNRw4ZRNh+ojPshq20lH+vtfSuztDcmCyXo9GGwmBomjlcB4enPJ/nb8D7j3BJcP6K8xdSOXu7b8h+auRSw+nXMyq6/iQMKMHWYKyvHBw2c8Sa9l13PprpdDPoR+YWiLAUwKfz6ch8+7aWVzo65R+qOBRD/nnCs9vBE61tlMtTn+wprYJYK95DUUKUYOSw4JqaekS5AITaMbf4i3Btbm+1vlLvozTTujA+g4/jo/4ZA+iXVoz6Uc2Qw6pso8IrFun9y4BcKP6gnJGuXd8pl4EtOb7gD8v0TaQ2jrm5DXxnSBVpdc2B7SQji6ux5kBk6K/YmQjmadO09FTyVKcrVmjGZxQ8W9uk6h1i0zdiyy7QaM8qqySg74mtwJei7KlUi2n1n94a0afXmLwMbf9WiaBT7+I+0JG7mTOijplQ1/XXr2IvnWSpyI2WWEMoYZ69HgvLEuJ4K7VNFKg4iCY7cJV0hGw0co9quZIr2SC5bht/RjgxJI5VsQKiI3XL1Ry6FfcPHYfcHwAZmqeMCqMP0yvejPNnjFyT5yz5I5lNXdYNos8ajibMaH/qNzamCUUxqJ2edtYzuqH/CKb1m0zCQEfT5qDR/UaxVY7NUskVWKKcnB4zhLAnBL78RuruUkEcEoADXfNeL00YfskAKOkqLGv8OgEq0QcSsKi5by6AN6rk3RENJ1BevjZGs4jf0CcQ+LPDFT3lu0wGor2rj22EEmwsVtMd1DTGDmmgZXmvU51JvhzwQ2caSJmk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199015)(31686004)(5660300002)(41300700001)(8936002)(186003)(66946007)(6916009)(54906003)(2906002)(316002)(4326008)(31696002)(36756003)(8676002)(86362001)(66476007)(66556008)(478600001)(6486002)(38100700002)(6506007)(6512007)(53546011)(26005)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFJ4UXhQbitNZ1I1eE9iampwSG82VWxsc1RNcXdiUXhta1FQTi9jcDJHU2dw?=
 =?utf-8?B?SUxHd2hZSTduNDdlVEJhZTVaNmhURWtGRUJWVTJ2cWU5dTlKYUZIK0pWcmxm?=
 =?utf-8?B?UndSN2grQ2ZTcFExMWxyVnY4cU1lZVVIclZUaVhHR1lScmFMTzA4dnVJZDJa?=
 =?utf-8?B?Vk1uUzRTQ0V2OU4rcHRxTFJNQmhTeWNsdmZtSUFvai9QR1c2YjA3c1dpa01k?=
 =?utf-8?B?bFpzWDZ4Wno1OXd0S3BySWFhYVo5RENkUmN0WHphZVN4VlV2dkdwU0dxR3VW?=
 =?utf-8?B?VXFUcW9CaUhJN3FKbU8waWFZUDc0bXpiNkpuZEhZVGRIMXh0aVdLeUJjakRn?=
 =?utf-8?B?UGtKU3AvWHAyZmwzRUtudTRmYUZYd0xmS2VaRzV6bDJBOFRTaS9WYXZ1WTVM?=
 =?utf-8?B?emhVTjlOR0pDUmZSSG9wV3pwT0lKWk9NWm0zRnJIeDhTSER3c2ZFMTRSWHZx?=
 =?utf-8?B?QmVubWUzQTl2Y2YzdFlyQVYzb2xaN0JvN3dkb1B6QlRXcE1MTmx3cjVPQWdT?=
 =?utf-8?B?T2YxK3JnSWt2YzFST2Q1ZzNjM1FkaUlkSjRFdjRsN091MGFmVVZYdXVmMG1Z?=
 =?utf-8?B?ZFdzU3NvRUlscUU1dXdRc08zWkw2WnZrTFFLamRBUjdUMEZQS3lRVWNlUlBp?=
 =?utf-8?B?bnFZRnhwdXRocm1jZEhaY2J1WVdSa2hVaExUZ1dPQUdnNDU4ZEEyazN2NXVE?=
 =?utf-8?B?cjQxK1VpRHBxVlVxRWN4R3lpM1FzOXVXMjFQT013WUZ1alk3Z1doWnNTV3Vq?=
 =?utf-8?B?RXdKaGxhSHZEeVJCT2N0eVBFMkRKeHp1b29jTlQ2VEVUSnRRQzhIaFh5ek9M?=
 =?utf-8?B?WkwwSW1YK05GeFAycDd0QWpocXQ3cGl0aGxVZzVLM1NjakUyaE1Na0twVmZT?=
 =?utf-8?B?TTRiaTRHWHc2Q3ZaL1Zvbm9IQ2thbjZwM3ZmWmhyeDFxc3BsZFFQeFlmWDZV?=
 =?utf-8?B?S3htaHhFeWxaOTcvRU9iSSt1OXo1eDVWQVk1ZGtCRE03bldpNmVwZDVuajdZ?=
 =?utf-8?B?ZHNwREcya0N3RVFRajdJTUNuUzNpclNJNUNQa2pWWC9xU25oTlFjVEdKNEZM?=
 =?utf-8?B?SjhjS0pXR2lnWDJmU3ZBTXV0ZGdzQ2JoWklnUlk4aWtIaE9OSkkzd3lUZENT?=
 =?utf-8?B?VFlOODJHT3FneWdPdWpwV245bHJIeng1RGJsaFlEQndDWmJleHhWdVlFYUk4?=
 =?utf-8?B?VHQwbW5EOE9kWmVNK1E3U2VWUTVmMjU0dUk0c2llNnBCbTcwVWFLVk5FN3VH?=
 =?utf-8?B?bTF2eWNMZjlXUXVKVFJiWHg0aGNuQ3NSN2J1Nld6M2JQeE1JbHlJY2VmYmtC?=
 =?utf-8?B?OHd6WXBma2krSitHcWVOY1JOM3ZPelFJV0FoRHRGb2gwMy9YNUU2MGhuc3dE?=
 =?utf-8?B?TXZkeU1Td0k2OWg2akdIY1NhN1RGTVQ1d0ZQNUhYWHM5VnVLUkFzdnh3K2tU?=
 =?utf-8?B?K3NTMWNZSHVlK1I1eW9Hc2NEUlNEeWRjN0IwK2pqMi9zS0lRdzAvWWlqVGVX?=
 =?utf-8?B?Mng0U2F1Q0d6YkF4cS9RaDBCbnNOaTBvNGxuTzRrMkY1M1QySlFadkNUcEg0?=
 =?utf-8?B?bGVBWG1md0d5Wm1pcG9pTHowYkdVZDBaVEVoOXRQOXNmZXJGYjM2WWN5ZENZ?=
 =?utf-8?B?bkRmdFc2SkdHMVJVenpCQnZxUWRwdGMxaDhVaGZVWTBnc1NGVGEvUkx0bDc0?=
 =?utf-8?B?VG83RmpIOWhzSTFUVTIwMVVXT2xDQmFycFMzRDFvUzRCUktLd0NFUE1hN2k4?=
 =?utf-8?B?ZUc5Q3Yvb3E5ckNITDQ4a0E2S09lMFNkSWpHU0I2dllnSGFZRExHMXlZTjBy?=
 =?utf-8?B?OER5SzdWTVcvWGovckJWSU5pZ2xna0h0bFpmZTlXZ1A3R1ZPQjQySGMwTmM4?=
 =?utf-8?B?WjVUN3JVTTMvYXhCbnRmNWNQU2kzMGQramlnV09kMDRxaDhBUFREajlUVUp3?=
 =?utf-8?B?M0w2WmNZVWpNTERpU0dzV1RmZU1wRjJjc0g5VzhCQVFNYVRxNlV2ejJISkJy?=
 =?utf-8?B?ZEY2OVhSRHNKYStEdWg5MWI0TFZFTVlNQlAzM0VNWDBWVkU4UEN3UXFVcHcv?=
 =?utf-8?B?QkVOUTRmd2xGZkQrT3k0bjhlRjc0MTdGd01YR3QzUUhIbjM1V1lMaUNMSjJ4?=
 =?utf-8?Q?ET+8AE14sr33yKaKVitS9Dlnc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c03a33-2472-49a4-e6ee-08dab74cb672
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 12:22:13.4289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKVFERMmt2biwYKB+2q/aLLRZ7SVWuC5/aSrfM9o+cLI8yS3kaKmjzxHUVZH0sO7P6xmyYxVWaQ8TR5hK7RR3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7369

On 26.10.2022 13:58, Tamas K Lengyel wrote:
> On Wed, Oct 26, 2022, 7:48 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 26.10.2022 13:34, Tamas K Lengyel wrote:
>>> On Wed, Oct 26, 2022, 7:06 AM Andrew Cooper <Andrew.Cooper3@citrix.com>
>>> wrote:
>>>
>>>> On 24/10/2022 17:58, Tamas K Lengyel wrote:
>>>>> Currently the XEN_DOMCTL_get_vcpu_msrs is only capable of gathering a
>>>> handful
>>>>> of predetermined vcpu MSRs. In our use-case gathering the vPMU MSRs by
>> an
>>>>> external privileged tool is necessary, thus we extend the domctl to
>>>> allow for
>>>>> querying for any guest MSRs. To remain compatible with the existing
>>>> setup if
>>>>> no specific MSR is requested via the domctl the default list is
>> returned.
>>>>>
>>>>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>>>>
>>>> Naming aside, XEN_DOMCTL_{get,set}_vcpu_msrs is supposed to be "get me
>>>> all MSRs needed to migrate a vCPU".  (I do intend to retire the
>>>> hypercall as part of fixing the Xen side of migration, but that's ages
>>>> away)
>>>>
>>>> It seems like what you want is something more like
>>>> XEN_DOMCTL_{rd,wr}msr_list  (convenient timing, given the recent ISE
>>>> update).  I think those would be better as a separate pair of
>>>> hypercalls, rather than trying to repurpose an existing hypercall.
>>>>
>>>>
>>>> As for actually getting the values, please fix up guest_{rd,wr}msr() to
>>>> access the perf MSRs safely.  I know the vpmu MSR handling is in a
>>>> tragic state, but this new get_msr subop is making the problem even more
>>>> tangled.
>>>>
>>>
>>> Adding a separate hypercall is fine.
>>
>> Which will then also avoid altering the behavior of the existing hypercall:
>> You can't just assume e.g. input fields to be zeroed (or otherwise
>> suitably set) by existing callers, when those were previously output only.
>>
> 
> I did add a memset to zero it on the single caller I could find.

Some may deem this sufficient on the assumption that all users should
go through the libxenguest function. But then at the minimum you want
to update documentation in the public header. Yet then this wasn't
the only issue I spotted (hence the use of "e.g.") - you also alter
documented behavior as to the returned number of MSRs when the input
value was too small, if I'm not mistaken.

Jan

