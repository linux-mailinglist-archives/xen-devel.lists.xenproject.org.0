Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AA34D2CF5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 11:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287675.487771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtO9-0004nb-Tl; Wed, 09 Mar 2022 10:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287675.487771; Wed, 09 Mar 2022 10:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtO9-0004lZ-Qe; Wed, 09 Mar 2022 10:17:49 +0000
Received: by outflank-mailman (input) for mailman id 287675;
 Wed, 09 Mar 2022 10:17:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRtO8-0004lR-9N
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 10:17:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a699652-9f92-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 11:17:47 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-E76_nBlrP9GysqIF1Lz1Dw-1; Wed, 09 Mar 2022 11:17:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 10:17:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 10:17:44 +0000
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
X-Inumbo-ID: 2a699652-9f92-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646821066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/gMHvXM1DSzQjhLY3u5lQ8uHgRWvz92nnasTau0o5U=;
	b=gHU/xgtkSmNknkF1+8Qs5Qx6kqx8iSIZ8bfsee6bfrs7t9Eb/lJiAG0Pq2g+rVinC7FY0M
	o6FHTmEpaMc68cDZn/oCbKKeazUvmgvAxq+ykgAZRH+xyWsDgGBlcy5CSsNI3GNWPYOCjr
	dzkWakJ05rdh8oCy/X424o981EZS3L8=
X-MC-Unique: E76_nBlrP9GysqIF1Lz1Dw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uy8cJ4STCTlpsTKN6kEdXqyy03pefyuTiMzXlZTNWz9FJqagQBdaROMpS1Fa+PA5w8I8f1PPfJtY1lRn76j/kW8oEcx+Rw39uiWx7Mx643ihqu3vWoquIHER+1pyXCS6n2pfLEAXYcdjh/cD3Dc9k2TkU5L8hcx/Q1UnzHg7Vpc1kqQv50nByy3Bc0DHG3W0bz864HZxaAFyd5QynaR4Y/9AGS6NUXVSnhwjiwPwvNruZFHUqqt/4Pezuq6nyugINKnTv5tq37j1RZRJLgZx2E1pFJsNrl60PkMwSBmiShPvMuWzCzFqQF8YpibLwaJjKwyJSZTyu8dHiFlbjfOnJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMs8XTQk+K6cRRuQPDefSTTSfTrFJkP5qBeI/gBQFRA=;
 b=LO4SWvmGAA51hPiD1HPcD4XxkCDXiaovAdSIvWjrf+jfWZ9lvYg/uHfMBVOIQUZB446rZrnfYmDRmrEH/TGkn5LMkKMqIUF06ILT7i0mKXpOYw1FFLZm1T/jLHXnCGc+BSV9Xg4l7oCn4crFuvWao9v3Dr2ndjqgLhbUrKzGGPcamEn5OFR+2IVEApp3/AbJ5WjigBUpCEjSUsAyOy/11a4sY0XuEv0p+xXYWiHqHWi88IDIHp0hCn4Z1QEpMP1U/Te2PVf3/RkOj/iFHpAHyIIt6P8OI2LqKXoxdr+2nj2aoG6aVQpYhgZNyKg60HDppQWKg9KE/0RxXBWEfvbwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35ad9273-956b-86d6-55a3-c737575a7880@suse.com>
Date: Wed, 9 Mar 2022 11:17:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
 <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
 <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
 <175a55cc-70b4-4832-9a78-0db57a9ae4a4@suse.com>
 <1205992D-ACE4-4E94-B554-3B14F6D9697E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1205992D-ACE4-4E94-B554-3B14F6D9697E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0305.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea136fb3-1195-4834-5e9b-08da01b60ce2
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB80960899CC167BD90B986B98B30A9@PAXPR04MB8096.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gCmW0w0DrX/PtnmHKr2tzpI5wpXQc8FiJ/tW69TCOdnFvS96hVfrhGXUkY683UjutvHkAI8Kkr6hUvOOhaoB77E7P387eyBeztLK4ykti2w6ZZDTi6s1RT9tA33WpPwaYh5szDbTXyf+SRsSsaz8mY5uqmRC6Qa/73Rx9h4Rn04pPxk490oHKxGtY6ZP9gOsmVMmaWKu4cpvGaE7PXmNWO0PZaawz4k57Swcq9zu2daPp0LFgff7m2e3Sd78Z8DubZEBpV0jAiPDW4NBzTjlXMBJvGDw43EsTBajjK3tPhUUJlXdgTX4lmHWw5dQWqZVXK5mit7ZBE7tQELxNfNVaizJqcZk7w044izNl8a8DZatEThd8CksDyR2tk1TTmkz51h4cmrW6TjaNHYkcJTg4Y59v/RgaYlGojQBxd0Nd3RJDyWPyn0SIhmybcKjaL2UnKYYZQOCXPxC+D0/ENt1YwuQRKbQgwfsfLhrgdCqDoBPvk3veFNIzq/OLEquvBbfu1ayRSn+nFIaxZuxV+mQMgdB+IG03u4n+ku0OxinOhKy9h6QJh02z99c27xRPtnFMvjFipXcUxyXvdxHnvsm0iVPWBCKGodYjjPbI5qVjMkoGqThwmLN0K6IbPmH0dG6yRb+Y80+7VIfMUzsmcuT6pdG04e+t46hdz6FFAiXzc5NwItAsCmm51hD/YrbVCdNsG2M15x6vBDRnXXJKdDHYAQfQE3R/kUixPGEXRjpPKo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6666004)(6506007)(8676002)(66476007)(316002)(66946007)(66556008)(4326008)(5660300002)(7416002)(2906002)(2616005)(186003)(6512007)(26005)(8936002)(31696002)(53546011)(83380400001)(38100700002)(86362001)(31686004)(508600001)(36756003)(6916009)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ruiC34Na05+P8uVBkuccI22BpD5bnY22kkuXCi8Y8YmuNLr6Zw15VBQWePkK?=
 =?us-ascii?Q?utfu5vzwTZzQUpm5bLhG5Fb0MEx4WYqek5O+PwUh083NoIyGbjxNx3sz4L5c?=
 =?us-ascii?Q?dqy6MzcCaXPqPve7lRnXv/mu2ZZh8ncncVNtFm33m1yRSMKaTnzi9ewavQwS?=
 =?us-ascii?Q?IsnagHQ8upEdDb9pwWWgKCwqI1CskRZXX1sj085J+P8qGoYeO/P8tCfMjYSo?=
 =?us-ascii?Q?QTHZV4Xfo2wXjYFMUyTlYhQi7rosSfonWDZjgzEv5aa8OC2c64GaEU8n/2FO?=
 =?us-ascii?Q?pYVG1suuvX+YSaMP3un2BltqfhorJxmg2MYV+MURbmFmBY9sapOkT9k3+Amm?=
 =?us-ascii?Q?7KPA2BQOZUFuDppjrwBrcEzmlFdN1H7nY5b2O/ITKxeXpOiFiwsma5qzXoj6?=
 =?us-ascii?Q?+R5jxPsT0BnT2i6LGkrio5pyfpPTW8OqRIzc157t4hZibSlnnZgg8nY91jMv?=
 =?us-ascii?Q?5kk4uWRI6YgkTH4nCqcUYikoGyQCsiJvL/fRB3IwYigUx8m9Xjjj/i7VUS/x?=
 =?us-ascii?Q?wHuxVIXSSDDaOLTHo4ic9/YnOHjTJOeGWYwP67BhKlU389tyYlWAmWWcS0vT?=
 =?us-ascii?Q?8J37kSfa9IV7ifoKehpDCXEwXEa/Oncj6QMuAMKaB3oRpDDbG8RVK7K+0hHI?=
 =?us-ascii?Q?crSt6iYcTroZnR6fKVbMeb2WdnNTRRfVbmBwfv/5C0k0CYzbjzk+jR37ZK0a?=
 =?us-ascii?Q?3O7IO4hUmmVRfiGWHJwKjbhvx5RrnLxw/ObObYDBS9KSuS1F9mbiDSdfiuMe?=
 =?us-ascii?Q?LMxVeE11zER6yq/tUBrYU2AnCuXMs+5wIYkolWrXKydGjxU82eT25kxln4KN?=
 =?us-ascii?Q?I1/iVQxTFKx1ktuYCtKGiEM9q7Kvqfs+l5WXkiEojPNofj3uWxSUUJ6H3z26?=
 =?us-ascii?Q?2jBRRtXm5eWyL+gXMYiR47apFbiZ9gvGLTN7mQvex+qUi7Ewi71AchS/uQ56?=
 =?us-ascii?Q?D7K4faKcIiqwLvtQ1g0RNpoIvxf0ukqsRAi31Pa0WPjzNQZRAEo8swM7TICT?=
 =?us-ascii?Q?3TmoaYhVz3xyk+5sSw2w1jXL6oz6PvpN3z/uFYCyU62RahqCh60PIHlhz82e?=
 =?us-ascii?Q?szZN816NtmWhBKU5xXUIbSbG8O5py42tNNe7hcEtRqylGv0OMcWMt3YfjSvc?=
 =?us-ascii?Q?4QfTO2XqyFnwH9Wd7Qk8hX+JiBw9TaKg3TASeSzFUK/eqO6LLUkBWECcKSiD?=
 =?us-ascii?Q?GurACm0kpubRIUqN2t2KaWCJWYamWILcjd4Pw3NmYSa1wnNkTf/504ym1I54?=
 =?us-ascii?Q?QMxZITxLjzr3a+EO0pim7SulEUvGoUT7oI+RJrvdf+gqEuzAwghUvHAtldiO?=
 =?us-ascii?Q?YY3CUtKRcKg7vmSGSEF4nnEO63HD4C7LQ9Y9pp195TQuCXyTq0twBdtCzSHq?=
 =?us-ascii?Q?iegWlKq3qq21/CNPNQOf7TSDBkS4a99mBkbjZolThblm8j6rudiF4la+S1kp?=
 =?us-ascii?Q?W0CDT66hSfinVdnNzg7FQdfq0pNbOcrDM7iDny56YTnyf2zFLk1rZIK6tB48?=
 =?us-ascii?Q?pExE0EtHzCKBHptgKgJt0h5lBrhbW0GZV6J0DOUPO/QVDLivsW9bofjxJo7j?=
 =?us-ascii?Q?Mea3wGNk5QVVE1BoCBxWg3Ql+bVSbNLDJAF6hXxpj+zLEVj5983qfj9sLA/1?=
 =?us-ascii?Q?fEEQpgqz0Z7JuTc7KcBbuzY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea136fb3-1195-4834-5e9b-08da01b60ce2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 10:17:44.0371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0C6xvutpX9TIStImXdINGvdB4qRWk9aIUWwwSoC5u1QaM/x4kJFE0YR23Ec/fdqVVk5IZjwh2+2VmXor+gJEsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8096

On 09.03.2022 11:08, Rahul Singh wrote:
> Hi Jan,
>=20
>> On 4 Mar 2022, at 7:23 am, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 03.03.2022 17:31, Rahul Singh wrote:
>>>> On 1 Mar 2022, at 1:55 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 01.03.2022 14:34, Rahul Singh wrote:
>>>>>> On 24 Feb 2022, at 2:57 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 15.02.2022 16:25, Rahul Singh wrote:
>>>>>>> --- a/xen/arch/x86/hvm/vmsi.c
>>>>>>> +++ b/xen/arch/x86/hvm/vmsi.c
>>>>>>> @@ -925,4 +925,106 @@ int vpci_msix_arch_print(const struct vpci_ms=
ix *msix)
>>>>>>>
>>>>>>>   return 0;
>>>>>>> }
>>>>>>> +
>>>>>>> +int vpci_make_msix_hole(const struct pci_dev *pdev)
>>>>>>> +{
>>>>>>> +    struct domain *d =3D pdev->domain;
>>>>>>> +    unsigned int i;
>>>>>>> +
>>>>>>> +    if ( !pdev->vpci->msix )
>>>>>>> +        return 0;
>>>>>>> +
>>>>>>> +    /* Make sure there's a hole for the MSIX table/PBA in the p2m.=
 */
>>>>>>> +    for ( i =3D 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
>>>>>>> +    {
>>>>>>> +        unsigned long start =3D PFN_DOWN(vmsix_table_addr(pdev->vp=
ci, i));
>>>>>>> +        unsigned long end =3D PFN_DOWN(vmsix_table_addr(pdev->vpci=
, i) +
>>>>>>> +                                     vmsix_table_size(pdev->vpci, =
i) - 1);
>>>>>>> +
>>>>>>> +        for ( ; start <=3D end; start++ )
>>>>>>> +        {
>>>>>>> +            p2m_type_t t;
>>>>>>> +            mfn_t mfn =3D get_gfn_query(d, start, &t);
>>>>>>> +
>>>>>>> +            switch ( t )
>>>>>>> +            {
>>>>>>> +            case p2m_mmio_dm:
>>>>>>> +            case p2m_invalid:
>>>>>>> +                break;
>>>>>>> +            case p2m_mmio_direct:
>>>>>>> +                if ( mfn_x(mfn) =3D=3D start )
>>>>>>> +                {
>>>>>>> +                    clear_identity_p2m_entry(d, start);
>>>>>>> +                    break;
>>>>>>> +                }
>>>>>>> +                /* fallthrough. */
>>>>>>> +            default:
>>>>>>> +                put_gfn(d, start);
>>>>>>> +                gprintk(XENLOG_WARNING,
>>>>>>> +                        "%pp: existing mapping (mfn: %" PRI_mfn
>>>>>>> +                        "type: %d) at %#lx clobbers MSIX MMIO area=
\n",
>>>>>>> +                        &pdev->sbdf, mfn_x(mfn), t, start);
>>>>>>> +                return -EEXIST;
>>>>>>> +            }
>>>>>>> +            put_gfn(d, start);
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>
>>>>>> ... nothing in this function looks to be x86-specific, except maybe
>>>>>> functions like clear_identity_p2m_entry() may not currently be avail=
able
>>>>>> on Arm. But this doesn't make the code x86-specific.
>>>>>
>>>>> I will maybe be wrong but what I understand from the code is that for=
 x86=20
>>>>> if there is no p2m entries setup for the region, accesses to them wil=
l be trapped=20
>>>>> into the hypervisor and can be handled by specific MMIO handler.
>>>>>
>>>>> But for ARM when we are registering the MMIO handler we have to provi=
de=20
>>>>> the GPA also for the MMIO handler.=20
>>>>
>>>> Question is: Is this just an effect resulting from different implement=
ation,
>>>> or an inherent requirement? In the former case, harmonizing things may=
 be an
>>>> alternative option.
>>>
>>> This is an inherent requirement to provide a GPA when registering the M=
MIO handler.
>>
>> So you first say yes to my "inherent" question, but then ...
>>
>>> For x86 msix mmio handlers is registered in init_msix(..) function as t=
here is no requirement
>>> on x86 to provide GPA when registering the handler. Later point of time=
 when BARs are configured
>>> and memory decoding bit is enabled vpci_make_msix_hole() will clear the=
 identity mapping for msix
>>> base table address so that access to msix tables will be trapped.
>>>
>>> On ARM we need to provide GPA to register the mmio handler and MSIX tab=
le base
>>> address is not valid when init_msix() is called as BAR will be configur=
ed later point in time.
>>> Therefore on ARM mmio handler will be registered in function vpci_make_=
msix_hole() when
>>> memory decoding bit is enabled.
>>
>> ... you explain it's an implementation detail. I'm inclined to
>> suggest that x86 also pass the GPA where possible. Handler lookup
>> really would benefit from not needing to iterate over all registered
>> handlers, until one claims the access. The optimization part of this
>> of course doesn't need to be done right here, but harmonizing
>> register_mmio_handler() between both architectures would seem to be
>> a reasonable prereq step.
>=20
> I agree with you that if we modify the register_mmio_handler() for x86 to=
 pass GPA
> we can have the common code for x86 and ARM and also we can optimize the =
MMIO
> trap handling for x86.
>=20
> What I understand from the code is that modifying the register_mmio_handl=
er() for
> x86 to pass GPA requires a lot of effort and testing.
>=20
> Unfortunately, I have another high priority task that I have to complete =
I don=E2=80=99t have time
> to optimise the register_mmio_handler() for x86 at this time.

Actually making use of the parameter is nothing I would expect you to
do. But is just adding the extra parameter similarly out of scope for
you?

Jan


