Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E5830A641
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:12:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79757.145229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6X7b-00011w-V3; Mon, 01 Feb 2021 11:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79757.145229; Mon, 01 Feb 2021 11:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6X7b-00011T-R3; Mon, 01 Feb 2021 11:11:55 +0000
Received: by outflank-mailman (input) for mailman id 79757;
 Mon, 01 Feb 2021 11:11:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6X7Z-00011N-Hh
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:11:53 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a74af947-bc18-4698-8a3b-65f25c4febb8;
 Mon, 01 Feb 2021 11:11:52 +0000 (UTC)
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
X-Inumbo-ID: a74af947-bc18-4698-8a3b-65f25c4febb8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612177911;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/0WZgPqKuCzjkbqO3B9jlxzdhmopgRMSE+6vqCaF3wM=;
  b=BSVvnv6PzQzpnMKQIYjqykSmBosCVn3icKSV54npcZ65nDamXaqx1Xnr
   xQkysGjBJOjnIBI6Iv1vgB6QTI41Om8XhoRPdyM2qKECWUdqUkvE/xYwG
   5876FN3ZHWC6FrINjJeGDNWU2kDqEV7d4wO2HKZ4j8t5PoLm8WYBzAXVE
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: O9xCrGXcLhKM4N2MpDmmqdgv8fA8hSyUncQjLbJR6L64/hOyN90fDqQSLKfaF3UDnqk/bk+3YB
 wVxfUpBdYF+VV36Q4ZiISWEjDuIioMpCzF5yNe07gK8E/4aTiNjDReDAHToSpul8oHyOkk632n
 tqGcU01+vf6bzeHgUQSValJrk95FV3/oTDdQWl0v3l44vqx/1Hcof7z6F7NyVtcBTOliAauleW
 I5VRblt+sF/0mY7grY+iP+Dc2r66OvMBmCfgN257Ge/2uCmgNUEp3PQ1kDWPpL05XPMgCw72Oa
 TNI=
X-SBRS: 5.2
X-MesageID: 36305186
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36305186"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=behsLTtOxHweBNicK6o6u4YOweeG4n5p8UCnLG1hCnJCRwmGFxp3B3HpVLMNe7JR95bnWR07cU8erAGzkpN+7c0OZsAW67XfIyxF0gOZNY+0NGdH85+e+9OYjrcuK/LWbvUUImO4evV66FzAyNlIeCQ+p0DbhTWdNRriIeU27j0Guu4i+1w2hBFaLANk7oEhMgGWRSysqid6VpaP5cM7TGmlV3O+/NR3SSjd+ejflyHfxXUBCm1CR8pNHUWa8/Ngbl0eatc6uDz3i/+PwQYrielONniFsRa/HjTXdpGJ8lw/83xwxY7EJzjSNR+lu9Ut8lf0GmIzXwQyzA5wOeNIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cW0y75xdrGwUEFSo42TsmqJIrR3/6nV9yYU4GpM0/Wg=;
 b=EeRC2CtcgdwdTQB8ANFMcavkhIUMqptABmPnZ/QvUws4KccYY5mEbZojz63CgdwdAXTQqE5sqRKSBjMb3NsiD4d4WDEfyzwkoLBck8Nze9kmxdZGMeBt7ivZLF617YwiH95b+DImUOR63NmrswCM9CK7+KqYOX6X7UGN/PwYkF+MxUSirQDjzX1q5a/BqllMBfpl8zncn3Om18BF9gVc9jSPdhkzhviyKgqejZUrXc46Sayhzu98+WACCf61w65LvRWVB15NL1USMLLCIOQ9nBJLQE1P5Y1In5MpJyS4vMk1NwAD7G6Nyt7+JXVyGxk4M/G6E8cJwouz1JZy1UO1Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cW0y75xdrGwUEFSo42TsmqJIrR3/6nV9yYU4GpM0/Wg=;
 b=afo/tOMkNEoklrG459Bd27FK6EjCIY9h3K55X+4byv0v3iR4BbYK14OcJaeM+F57w7KBRUBdVxztjKDDjHeHgqD9GYdt44xYdLJYIXkFH5l+8ojJbf6dAuL6YsTxuJ1IXouXABmGoAn0i0+BAakrsuA39Uzdkp4Ug7grGD/stpY=
Subject: Re: [PATCH v8 06/16] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, Hubert
 Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-7-andrew.cooper3@citrix.com>
 <YBfTpTzi+wo7AFSH@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <53a26fb9-9c43-d1c4-90cd-bb29d57e106b@citrix.com>
Date: Mon, 1 Feb 2021 11:11:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <YBfTpTzi+wo7AFSH@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0076.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::9) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecb7b00a-bb94-46bc-16a7-08d8c6a22997
X-MS-TrafficTypeDiagnostic: BYAPR03MB3478:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3478769B6EB58EE713696A52BAB69@BYAPR03MB3478.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: llDGCKYnazmm3CS/Cuq8Yre+TEVR2CBcvTcA5ZARGzZTt/CfxbKror6OujQq5gbsk4f/WkJDjJYCrXTqe/88SN2Vwya1oWtjuXVbF8qqAIeB/rGA5TpK3AiWP0CJ60Agoz5VhqG1Jz39PZH5CA7kjnB72h4FsushmeYTAawXBgM8+NMVVnmUGROx0xtbtg9xGjJvZL5ECBSIEX6l/Mm7PIZAUIngwqn3aTChMuaj7VCjPi1sIPyrXQnN0BRfrw2EEiy/fLD4aqrUMQKDfuAHQzviA2kXKrbknklo5wra6rgDPqLzDgHr5+2zfjbF/Xlv3M9NJnA+pyqiPkpLS6xMMB2JvkfVGNxw4HXUU0y+lN1jNm/NJrdvAM6/Sd6abJI2nkT/IyduIJh9xsUw0m8KojwVscuElI9W4Aab8qxUsgtxHaAHSsnvNPehzaZJkxxhM6vhWQToB3w5bKv5BUMQn7lRDzczXOaR5A2nOoiZeBGqUvawqkzwUA5Pf+jmQ7ayhGuktrDVAbZqEZOcmfM/Vi1OTFYZxRTOKzwKy1XCEnyllQnrHanf3RFfj4DUsx3GFV6KYrgtBvnPjs9vTruRZLR9whoZJuShCR1aVzRORQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(54906003)(66574015)(6666004)(37006003)(316002)(16576012)(31686004)(956004)(2616005)(26005)(53546011)(83380400001)(186003)(16526019)(86362001)(6636002)(5660300002)(2906002)(36756003)(478600001)(31696002)(4326008)(6862004)(7416002)(8676002)(8936002)(66476007)(66556008)(6486002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dDRYVmMwTkYxMEtLbE5uU1NHcnVEd1V0TjNZRDMrOGJDNW9iRDFwb1BnS290?=
 =?utf-8?B?akYvcmdSQ0pjZzYyeTdURVgrN3Y3S3FQQTlkbE1VNWs3UHIxYlp0QmpPWlZI?=
 =?utf-8?B?dTN3QjVEajZNYm5zYUNUVWhDM0F3QzdteWhVK3hyendXd3N4K0pZSTlzeDN2?=
 =?utf-8?B?OGlFVEtEcGkybEhTY2RjYWZ2MW5jRjV4cSsxL0dHQ2dJVnFSZGJiR0RDQUor?=
 =?utf-8?B?eEhhY1dibG0yRHFTaFhkZFBxMkNxNTZ1ZkFaaGlFbGZBZ20rZXNFVS9GeDFR?=
 =?utf-8?B?YVBnSmhMdnJ6N1JJWTdDK0Rvb3M0U0dSYVRBK1NGZ2pZVmdUV0l1RlJhUkx5?=
 =?utf-8?B?TXJ3ZDFUcmk3S2VRcUhhLy83Uy9HNnA0MzN0dEpTNWg3U0RkdTN6YllCbnN5?=
 =?utf-8?B?Vit2NFhCVnZBSEJZVUlXakVtZGdYb1F4L092N3hhRStlMUMwWFEwTTBVV1J3?=
 =?utf-8?B?THdjWkFURmJtSjBUUDlwRiswZTFJblJpeDE5cUNRTHhTMnJVbnJBblhtVUl4?=
 =?utf-8?B?cmVTSlBvdGs5RXFXL2hpbFFVYXZGdkJQK3dqZGoydGJac2ZnclZ4NGxjaFo5?=
 =?utf-8?B?cUFjaUU3NWpQVWJFd21HallnYzYvUUVad1hCR0pTemlyMy9VUkZZZGxUTnlw?=
 =?utf-8?B?aUdlTmFSV3kwY1hRMGtha25hL1EzSXd2Yy80dEpGUTJrOUN3MmVPZFJOaGdP?=
 =?utf-8?B?Yzk4eUJQSUsxNERsaWxOWnp5Zk1rYzlybHQ5NVIzZFFBRTdGN0l0OHpPMGlK?=
 =?utf-8?B?RlQ3M1ppZlIzQTNGTDFJejdtWUgybmFRVWpJYmdWUlhnSUVBM01vd0cveUs3?=
 =?utf-8?B?ZlhpaFYxZnMvMHlKekxnK05JN2llb1BYaTY3Vk1EenV1clRiRmFrb3d4NkUw?=
 =?utf-8?B?d1IvL1dYR0cvMlE4cDN6VENsTkdJanNkTUdJc3NwdTJ6eWNJNjFTWERBV0Yv?=
 =?utf-8?B?OGZuWXNRR3F4RW5kWE1sZ1lJa0cvQktJY2gwSnJVRkRLN3FxcTZPaW50TDRx?=
 =?utf-8?B?L3YwalVIT1JySmtWODJ4b1hwenBRMm0wQjF3QU4rdlAvTzM3K3JTMjlZY3N1?=
 =?utf-8?B?RWFFd01YaFc2K3pBMmdlaHphTlRsMDZWVzJDajVHaVRCVkd1SHNCZG5ycEdo?=
 =?utf-8?B?SDkzZ0JvVUFrUjVReTh5aUlWNEZWZXF3YU1aRE9QZzd5WW1BdHkzdzlOUWpa?=
 =?utf-8?B?UVU1QUZnbjMraURSZ0NpeGxMZXZwY3MzQmFDN2hGcFMvT253YW9QTGV1NG0z?=
 =?utf-8?B?SVczcisrNXp0aGZnK1ovbUtrVXgyU3JISjV5U1k0MTF0OXYwd2ZsdGhnSEc4?=
 =?utf-8?B?am5FS3RTUWtNUmhPQTEvVm85Wmszam5wbkZ1U2JFczczRXhWRlY2ZHZrbUM2?=
 =?utf-8?B?N3QrSW1ZNVZFcXI5OE51am5oTTZENHovdy9rSXMyRm83VkhSOFVVektYVGJw?=
 =?utf-8?Q?MRf0UY1m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb7b00a-bb94-46bc-16a7-08d8c6a22997
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 11:11:46.0013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MD9gFnMEIfKJHTzgFP1NiTFdUbxkS0Yth95P37bWNVkp6LNUcsn53Ele7Jt/pJ7qPpVpr4/rHvTpew8AVFc4hDf80+mrjB5BhhoPdFK5Vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3478
X-OriginatorOrg: citrix.com

On 01/02/2021 10:10, Roger Pau Monné wrote:
> On Sat, Jan 30, 2021 at 02:58:42AM +0000, Andrew Cooper wrote:
>> A guest's default number of grant frames is 64, and XENMEM_acquire_resource
>> will reject an attempt to map more than 32 frames.  This limit is caused by
>> the size of mfn_list[] on the stack.
>>
>> Fix mapping of arbitrary size requests by looping over batches of 32 in
>> acquire_resource(), and using hypercall continuations when necessary.
>>
>> To start with, break _acquire_resource() out of acquire_resource() to cope
>> with type-specific dispatching, and update the return semantics to indicate
>> the number of mfns returned.  Update gnttab_acquire_resource() and x86's
>> arch_acquire_resource() to match these new semantics.
>>
>> Have do_memory_op() pass start_extent into acquire_resource() so it can pick
>> up where it left off after a continuation, and loop over batches of 32 until
>> all the work is done, or a continuation needs to occur.
>>
>> compat_memory_op() is a bit more complicated, because it also has to marshal
>> frame_list in the XLAT buffer.  Have it account for continuation information
>> itself and hide details from the upper layer, so it can marshal the buffer in
>> chunks if necessary.
>>
>> With these fixes in place, it is now possible to map the whole grant table for
>> a guest.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Just one comment/question regarding a continuation below.
>
> I have to admit I had a hard time reviewing this, all this compat code
> plus the continuation stuff is quite hard to follow.
>
>> ---
>> CC: George Dunlap <George.Dunlap@eu.citrix.com>
>> CC: Ian Jackson <iwj@xenproject.org>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Paul Durrant <paul@xen.org>
>> CC: Michał Leszczyński <michal.leszczynski@cert.pl>
>> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
>> CC: Tamas K Lengyel <tamas@tklengyel.com>
>>
>> v8:
>>  * nat => cmp change in the start_extent check.
>>  * Rebase over 'frame' and ARM/IOREQ series.
>>
>> v3:
>>  * Spelling fixes
>> ---
>>  xen/common/compat/memory.c |  94 +++++++++++++++++++++++++++-------
>>  xen/common/grant_table.c   |   3 ++
>>  xen/common/memory.c        | 124 +++++++++++++++++++++++++++++++++------------
>>  3 files changed, 169 insertions(+), 52 deletions(-)
>>
>> diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
>> index 834c5e19d1..4c9cd9c05a 100644
>> --- a/xen/common/compat/memory.c
>> +++ b/xen/common/compat/memory.c
>> @@ -402,23 +402,10 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>          case XENMEM_acquire_resource:
>>          {
>>              xen_pfn_t *xen_frame_list = NULL;
>> -            unsigned int max_nr_frames;
>>  
>>              if ( copy_from_guest(&cmp.mar, compat, 1) )
>>                  return -EFAULT;
>>  
>> -            /*
>> -             * The number of frames handled is currently limited to a
>> -             * small number by the underlying implementation, so the
>> -             * scratch space should be sufficient for bouncing the
>> -             * frame addresses.
>> -             */
>> -            max_nr_frames = (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
>> -                sizeof(*xen_frame_list);
>> -
>> -            if ( cmp.mar.nr_frames > max_nr_frames )
>> -                return -E2BIG;
>> -
>>              /* Marshal the frame list in the remainder of the xlat space. */
>>              if ( !compat_handle_is_null(cmp.mar.frame_list) )
>>                  xen_frame_list = (xen_pfn_t *)(nat.mar + 1);
>> @@ -432,6 +419,28 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>  
>>              if ( xen_frame_list && cmp.mar.nr_frames )
>>              {
>> +                unsigned int xlat_max_frames =
> Could be made const static I think?

It is a compile time constant, but the compiler can already figure that
out.  static is definitely out of the question.

>
>> +                    (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
>> +                    sizeof(*xen_frame_list);
>> +
>> +                if ( start_extent >= cmp.mar.nr_frames )
>> +                    return -EINVAL;
>> +
>> +                /*
>> +                 * Adjust nat to account for work done on previous
>> +                 * continuations, leaving cmp pristine.  Hide the continaution
>> +                 * from the native code to prevent double accounting.
>> +                 */
>> +                nat.mar->nr_frames -= start_extent;
>> +                nat.mar->frame += start_extent;
>> +                cmd &= MEMOP_CMD_MASK;
>> +
>> +                /*
>> +                 * If there are two many frames to fit within the xlat buffer,
>> +                 * we'll need to loop to marshal them all.
>> +                 */
>> +                nat.mar->nr_frames = min(nat.mar->nr_frames, xlat_max_frames);
>> +
>>                  /*
>>                   * frame_list is an input for translated guests, and an output
>>                   * for untranslated guests.  Only copy in for translated guests.
>> @@ -444,14 +453,14 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>                                               cmp.mar.nr_frames) ||
>>                           __copy_from_compat_offset(
>>                               compat_frame_list, cmp.mar.frame_list,
>> -                             0, cmp.mar.nr_frames) )
>> +                             start_extent, nat.mar->nr_frames) )
>>                          return -EFAULT;
>>  
>>                      /*
>>                       * Iterate backwards over compat_frame_list[] expanding
>>                       * compat_pfn_t to xen_pfn_t in place.
>>                       */
>> -                    for ( int x = cmp.mar.nr_frames - 1; x >= 0; --x )
>> +                    for ( int x = nat.mar->nr_frames - 1; x >= 0; --x )
>>                          xen_frame_list[x] = compat_frame_list[x];
> Unrelated question, but I don't really see the point of iterating
> backwards, wouldn't it be easy to use use the existing 'i' loop
> counter and for a for ( i = 0; i <  nat.mar->nr_frames; i++ )?
>
> (Not that you need to fix it here, just curious about why we use that
> construct instead).

Iterating backwards is totally critical.

xen_frame_list and compat_frame_list are the same numerical pointer. 
We've just filled it 50% full with compat_pfn_t's, and need to turn
these into xen_pfn_t's which are double the size.

Iterating forwards would clobber every entry but the first.

>
>>                  }
>>              }
>> @@ -600,9 +609,11 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>          case XENMEM_acquire_resource:
>>          {
>>              DEFINE_XEN_GUEST_HANDLE(compat_mem_acquire_resource_t);
>> +            unsigned int done;
>>  
>>              if ( compat_handle_is_null(cmp.mar.frame_list) )
>>              {
>> +                ASSERT(split == 0 && rc == 0);
>>                  if ( __copy_field_to_guest(
>>                           guest_handle_cast(compat,
>>                                             compat_mem_acquire_resource_t),
>> @@ -611,6 +622,21 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>                  break;
>>              }
>>  
>> +            if ( split < 0 )
>> +            {
>> +                /* Continuation occurred. */
>> +                ASSERT(rc != XENMEM_acquire_resource);
>> +                done = cmd >> MEMOP_EXTENT_SHIFT;
>> +            }
>> +            else
>> +            {
>> +                /* No continuation. */
>> +                ASSERT(rc == 0);
>> +                done = nat.mar->nr_frames;
>> +            }
>> +
>> +            ASSERT(done <= nat.mar->nr_frames);
>> +
>>              /*
>>               * frame_list is an input for translated guests, and an output for
>>               * untranslated guests.  Only copy out for untranslated guests.
>> @@ -626,7 +652,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>                   */
>>                  BUILD_BUG_ON(sizeof(compat_pfn_t) > sizeof(xen_pfn_t));
>>  
>> -                for ( i = 0; i < cmp.mar.nr_frames; i++ )
>> +                for ( i = 0; i < done; i++ )
>>                  {
>>                      compat_pfn_t frame = xen_frame_list[i];
>>  
>> @@ -636,15 +662,45 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>                      compat_frame_list[i] = frame;
>>                  }
>>  
>> -                if ( __copy_to_compat_offset(cmp.mar.frame_list, 0,
>> +                if ( __copy_to_compat_offset(cmp.mar.frame_list, start_extent,
>>                                               compat_frame_list,
>> -                                             cmp.mar.nr_frames) )
>> +                                             done) )
>>                      return -EFAULT;
> Is it fine to return with a possibly pending continuation already
> encoded here?
>
> Other places seem to crash the domain when that happens.

Hmm.  This is all a total mess.  (Elsewhere the error handling is also
broken - a caller who receives an error can't figure out how to recover)

But yes - I think you're right - the only thing we can do here is `goto
crash;` and woe betide any 32bit kernel which passes a pointer to a
read-only buffer.

~Andrew

