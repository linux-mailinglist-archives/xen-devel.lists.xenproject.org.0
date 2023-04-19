Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBCD6E773C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 12:11:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523297.813211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp4mW-0007pv-11; Wed, 19 Apr 2023 10:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523297.813211; Wed, 19 Apr 2023 10:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp4mV-0007nU-UE; Wed, 19 Apr 2023 10:11:19 +0000
Received: by outflank-mailman (input) for mailman id 523297;
 Wed, 19 Apr 2023 10:11:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp4mT-0007nO-Un
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 10:11:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe02::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83c7c2c9-de9a-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 12:11:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 10:11:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 10:11:11 +0000
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
X-Inumbo-ID: 83c7c2c9-de9a-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFwjJqE8enGa6aP2p5bg2ibJKhNRIWFHDmYePl9Clugx5e/NVtY1Tubvyaf6ztcBUS6oJN3RiV87GfoRqgTjAdYSPFVS30bpu60hc7QA7Z8gJOiQDKUvGrLZesWA3OrODmk2b39Dqjn2rK01JXpoGCUPrMpzTamNEILo6Uq2p++qZuG7bA76Ec3v9QCAbz1XB/2aQOz8CgCfQieS8F0ABy6/oOOsgkqHhN9OtIhlPci4bynUbr+BWPD3Unk9sXQ0DfxzuTu6HzNT2f+9yFj/RwXGcQBxlGn8eeH7w+JWmNVdfGfd/LNJgiFsDGQhay3iyGHUyq8G83wA7GBhAWplhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwhbEs/gsN5KpCp38BYdSeIDQo3sgtftXc5pm0kvaWc=;
 b=kWzlMFY4ou1h99H4DrTFHn+x3zVXLtU+iyCFk5etU2PcgGjM8XMDWcyN8beatnhofmYmnghND1qwzhJN69xsm7nqCryTdvN2UjMwx90/rTdKqL1JwoOCmUv8wlg06M2tikH06dh2cdUD2Ow4ikLyOV18F4v5tEJVnsvXDAvj/fZf1Fwh/Cll+H5+TSQAUkdCKxKVzS8FsFIib6+prDHKarE+zSv9IHLVgp/75B5JX1CehW8Ami65KU+mDs69qvwqKJWaIUvZuckCDWCFECm1VGsIJ6SbNPQxdPMCE2YKDdW4vwOJktjitmpXUk2sUYqHnKLVUL/nMizGu4KNDaUDTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwhbEs/gsN5KpCp38BYdSeIDQo3sgtftXc5pm0kvaWc=;
 b=ST8n5db5Ipgn6dZs71sSKrhlFUheCuaeFHPFk+IKOL7OPrYZc4GoA6PDZQBlgU4GLII4ADUsUCrUnI98Fj2v7v4+rNfwFbUdma285IVDAWiLg7Mu6dYjh9npb8FOlRkqoYwrPCfeRb8CIeETPxeviDG+l/kJLDNnePnidhFKFXQbCDfaE6stldcYpHp9wHLx3wSBasy/Xep1s6ecWwkXQqBftQMJ3fX3oUth2Z+2h3J6DIj44LDj+cP4Fp9hTp+LjuzTGGnSJPZD37SVGq8xxtbegcIJU8f1J/SlSdZSQVQ92WrKQ/WnpWeZPy2sDLzgocyp2Xls262AYWYsZYiP6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <38fcc039-bdd2-b939-d619-97621abc74d4@suse.com>
Date: Wed, 19 Apr 2023 12:11:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230418154223.20181-1-roger.pau@citrix.com>
 <225aeacd-7d8d-3832-8043-4f565403c2d7@citrix.com>
 <ZD6/Fk6S6D421AgE@Air-de-Roger>
 <acea0109-967b-f3d3-2a60-b71e5a207ea6@citrix.com>
 <ZD+3Y+YYQxFSoAJi@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD+3Y+YYQxFSoAJi@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4dbe77-1099-4fe6-beba-08db40be66c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BndMoNZCFiS3hWVPFuXTvdvdwCXEVr9amCIyvVJbj8Ftd/qir4LILepYyjKHy/oEApXJCjAisPiV8vv7cjU9vAoTpQNS0i4WIym5+r9oZhbHpfLVyL4sF3dei6CZxGQ/zYpIXCw3MvU4gqlia2LXWG2KV/6NoWILeHpRhGsReFtFzoeaOoeg0GjMGCAKz1V1/HLnD/rvPThjLOf19wvwDt/uSh1ABcjCOsNhAnqkkxuUuNvrdeJDkW8axKS4aSHF+cKo8HgaIAlSujmarOgvVHGyy/Wktk7S2nHS3pxNI4sssNZSPtSdWWLdK4+PdAvFc+1apIktdla69rUR/njfit1oas2qqFAWntH1BI7Vd1f6aikD40e9pVgnzt6dQDr1J5OIdXV0zcfbvH6EthuNv2H5/bIS1xp8kCLaL5L+U0h7rJGTzP3Vtlkc3nNuAMb7ZQWeQScBQ46v3IGGT/8Z5r6zdZ8z+O1nZWqfjnGGn+5m8x+2NImyhgwIVahfEPvcGAaOi7AiFhFWfhRW5QvMlYBsq3Ciho8NRZxnR3/TW8mTGSHfDC7FLiIQEFvFUKRd6G1cJx99MED+xDAn0atMaZo3MvOev+3CK/3yCisb4F+NIf/FDrm9cQrrnE/sUQt2JpGug+7y3Tugjs9XOaswxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(66476007)(478600001)(38100700002)(8936002)(8676002)(316002)(41300700001)(6916009)(4326008)(66946007)(66556008)(54906003)(186003)(2906002)(53546011)(6512007)(36756003)(26005)(83380400001)(6506007)(86362001)(31696002)(2616005)(31686004)(5660300002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2VNUjIxRXNkdGZiRDk4VVVrd0tMU0Y0MENRemZkMTdsUTgxRkUvTmlNMncr?=
 =?utf-8?B?UC9Fb2hJYTFUazRHbjVIWnpYYXMveHZ6dThybWh3WXRlZ3QwZW1CelR5U0tD?=
 =?utf-8?B?Vi9mOTUvL1p5aDhXNVp2MDhMM3IwUHJ1TVFKeWZLcTcwdmJBeGRrckhwK0ht?=
 =?utf-8?B?cXdMbGVnQTI2Z3JxVTZlS3J1bXJVVjdwL1ErTUpWdEt5d3g4VnVGK2J4Mnp1?=
 =?utf-8?B?SnBUNTRrTVVyWDZqVENDUXhSdWZPa1NEUFIyU3ltQzVSWXpocGZaNE0xa2RY?=
 =?utf-8?B?MFVsYkFwYWI1SC9QTHlDVm0rcXVxeDBDUzViSjVFTm94V2s2MmpZK0lhbzRU?=
 =?utf-8?B?ZXRSZTBFVEJwY3Y2RTlkTzNCdXBsaWE0T3pYMVBuUE05MzFuT2kvMlZMbk9l?=
 =?utf-8?B?THA4MW9nRGhDTEJvOEtwenRtR0VjeS9ZT21MZzlkcVRldzlDSCtQbTdkNkJs?=
 =?utf-8?B?TTQvWG5SMVltTXNEOVlGZG1QWWU4MXhBNEdpVzdReVpkbFZpL01ZVWRYd2dC?=
 =?utf-8?B?QjZRbWhSZGdJNms0ZXRtakNQWnJiLzBKbFJja2Znai9kY2FYb1dxZlhaZHFn?=
 =?utf-8?B?cWZLekpNSTNwTm5hUW0xaEFITjliMzVNSE1Eb0pGOXN1bEs1em5ZakFOYWNH?=
 =?utf-8?B?ZnFmOHh3TFdLME1pOXVVbGIvcW9SRUtZR0wwcE5TWnpYaVFjT1IxakhVY2FR?=
 =?utf-8?B?S2k2OW9vYzVVd3gxak4yTWJmQnRSVjEyYkxKQi9ia0xLMG5aSG9NYUVFNE9B?=
 =?utf-8?B?aXZ3UU4vdWtweGhkYU1JREtmQ0pLVkprZW02aHEwclkwR2dkaTlhS3pwdWIx?=
 =?utf-8?B?MnQ0TVozUjhJY2thSVVKSHdHLytJWTl1SFZUYXZmWEk0ak15V2UvV3hwYkNu?=
 =?utf-8?B?WGtjZ2pKQlVxV3d3b2pldUJBbUIvUEFZbUdiUDJEQk1vL3NHYUFmNlVQOUVQ?=
 =?utf-8?B?aTl4K0hYK0JLcUZuZGlMZ3E5ZGkwNk5RYXNsVXhEbFJleFNQU3ZiamNPaUl3?=
 =?utf-8?B?TFg5ZCt2eVB1NFdRYzgrQlcxT2srOWljOEd3dTdGRGpvN0NvVE53bjJENGl4?=
 =?utf-8?B?ZkkxeVdXdFErVjlGQ0xsRDdWcVMxZitpcEl1REZ0ajQ2UkhsZm5nODF2Y2pB?=
 =?utf-8?B?K3NZWmFaNHRGdmFQQ0pqQ2JITEc4bWVya3FidDB1R0NObTExc1YxdThEL2dX?=
 =?utf-8?B?MisraEpSUDcyVVdLbG92WW5hdW5sbll2UGpUaHVZbythR1Z1Y3VzeUhoQlpq?=
 =?utf-8?B?b2FQd0NmWG1PbHBLUFpDaTdENjg4Vy9kbERrSUYrWENVM052TVYzUE13NXN1?=
 =?utf-8?B?dFIyK0dEK3NoRGtIYmNzR2FHU3NaM0svNHpIZ3hPcFFrUDNzemk0eXhsaTNi?=
 =?utf-8?B?NEdabnhZaE1FTVdsTCtrVHpZRWczc2w3aVhISnBsR3JaV3VXT0hoTmFsZStk?=
 =?utf-8?B?NlZiWXBmL0F3Z1RnblhJWFJyZjIybDJOVTR0a1QwU1lhYTlXQzVCazUzU0VH?=
 =?utf-8?B?QTZxNWFZakk5NUpPS2k1Y1JBZ2tZek1CRnBNejBkNkN4VWZDNXEyVWtvQVl4?=
 =?utf-8?B?bTdwdktrV214eGJrVC9VSWRYdlNDZmVWOTNSZm42b3lWNHBRblBnZEVSb0t5?=
 =?utf-8?B?SC9hK2dkWEpVMG9rRUd6L3poeG5waDRnM1BlV21XN1hzVzN3RzlOVXBJWGEr?=
 =?utf-8?B?Zkc3akxLWE03ajJLNWJWWCt2ek1WWks4U0dlN3k5WmxnZ3ZreHRmNEd2R05D?=
 =?utf-8?B?Y2p0QVJ6ekpFWlpQWDhzWTRhNzRBQXROS0VWU25PL2JHbGhwUmNtdjFhZlAw?=
 =?utf-8?B?UEpjN1VsY0Vrd1Z0ZHFLa3pVRHQyYnFiRGZUSGZSUzN1U0QrVzlhNmxEU2FY?=
 =?utf-8?B?cnNZNGozb3p0S0NYeEkrYUpuZjY3dXdpQU1BbWpLWGlXcW5EMFp0NlEvUUgv?=
 =?utf-8?B?V1dmWGMyVkI4NXFES0VCYS9TVCtKN2N6dzR3VXF0Y1h3TUVRTjJuRjU0MU53?=
 =?utf-8?B?bDlESGFLS2Z5c1dlRk94clpuT09uWjdrMWZIMkhEWE5ibE1lMFIxeTJNL3ZV?=
 =?utf-8?B?STFNRGFQRFl0K0ltZ2FOQ2p6UDc1TXFFQTdlOUVna25aYVlsaHZwREhVc1BY?=
 =?utf-8?Q?kaw9EKFvdRlivrw9yj39FMUwJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4dbe77-1099-4fe6-beba-08db40be66c0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 10:11:11.7886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vXIpw6pTEaMoaKInOQ4EepQOcs8sts2uK9sFH4CfgTSvDKj44FtRvLwuU9bcU/F4a4w+S6K408RqYQyKv6TIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9919

On 19.04.2023 11:41, Roger Pau Monné wrote:
> On Tue, Apr 18, 2023 at 05:12:07PM +0100, Andrew Cooper wrote:
>> On 18/04/2023 5:02 pm, Roger Pau Monné wrote:
>>> On Tue, Apr 18, 2023 at 04:54:49PM +0100, Andrew Cooper wrote:
>>>> On 18/04/2023 4:42 pm, Roger Pau Monne wrote:
>>>>> The addition of the flags field in the vcpu_set_singleshot_timer in
>>>>> 505ef3ea8687 is an ABI breakage, as the size of the structure is
>>>>> increased.
>>>>>
>>>>> Remove such field addition and drop the implementation of the
>>>>> VCPU_SSHOTTMR_future flag.  If a timer provides an expired timeout
>>>>> value just inject the timer interrupt.
>>>>>
>>>>> Bump the Xen interface version, and keep the flags field and
>>>>> VCPU_SSHOTTMR_future available for guests using the old interface.
>>>>>
>>>>> Note the removal of the field from the vcpu_set_singleshot_timer
>>>>> struct allows removing the compat translation of the struct.
>>>>>
>>>>> Fixes: 505ef3ea8687 ('Add flags field to VCPUOP_set_singlsehot_timer.')
>>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> While everything said is true, this isn't the reason to to get rid of
>>>> VCPU_SSHOTTMR_future
>>>>
>>>> It 505ef3ea8687 does appear to have been an ABI break, that's
>>>> incidental.  It dates from 2007 so whatever we have now is the de-facto
>>>> ABI, whether we like it or not.
>>>>
>>>> The reason to delete this is because it is a monumentality and entirely
>>>> stupid idea which should have been rejected outright at the time, and
>>>> the only guest we can find which uses it also BUG_ON()'s in response to
>>>> -ETIME.
>>> I agree, but didn't think it was necessary to get into debating
>>> whether it's useful or not, since its introduction was bogus anyway.
>>
>> Well - the reason to actually make a change is that (older) guests are
>> really exploding on that BUG_ON() for reasons outside of their own control.
>>
>> And the reason to fix it by ignoring VCPU_SSHOTTMR_future is because the
>> entire concept is broken and should never have existed.
>>
>> The ABI argument just adds to why the patch ought to have been rejected
>> at the time.  But it was done, and the fact it has been like this for 16
>> years means that the ABI shouldn't change further, even if it done in
>> error in the first place.
>>
>>>
>>>> It can literally only be used to shoot yourself in the foot with, and
>>>> more recent Linuxes have dropped their use of it.
>>>>
>>>> The structure needs to stay it's current shape, and while it's fine to
>>>> hide the VCPU_SSHOTTMR_future behind an interface version macro, we do
>>>> need to say that it is explicitly ignored.
>>> Oh, I think I've dropped the comment I had added next to
>>> VCPU_SSHOTTMR_future that contained /* Ignored. */ (just like for the whole
>>> flags field).
>>>
>>> I can elaborate a bit on why VCPU_SSHOTTMR_future is not useful in the
>>> commit log, and add that Ignored comment to the flag.
>>
>> The important thing is to not actually change the size of the structure,
>> and to change the commit message to explain the real reason why we need
>> to make the change.
> 
> Why not revert back to the previous (smaller) size of the structure?
> 
> That would work for guests that have been built with Xen 3.0 headers.

Are there any such guests known to still be in active use? Linux iirc
requires 4.0 as a minimum ...

Jan

> Currently Xen does copy past the original (3.0) structure and likely
> copy rubbish from the guest stack from those guests, that might
> contain the VCPU_SSHOTTMR_future bit set and end up returning -ENOTIME
> unexpectedly.
> 
> Overall I don't see the benefit of keeping the flags field, even if
> technically it's been so long the ABI was broken that it doesn't
> matter anymore.  But still keeping an empty flags field is kind of
> useless, the more that removing it allows removing the compat code
> handling for VCPUOP_set_singleshot_timer.
> 
> Thanks, Roger.


