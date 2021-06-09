Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202D03A1483
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 14:34:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139310.257639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxOp-0001jl-6c; Wed, 09 Jun 2021 12:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139310.257639; Wed, 09 Jun 2021 12:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxOp-0001h8-2j; Wed, 09 Jun 2021 12:33:35 +0000
Received: by outflank-mailman (input) for mailman id 139310;
 Wed, 09 Jun 2021 12:33:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YCjx=LD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqxOn-0001h2-Ga
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 12:33:33 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f8f91dc-d610-4f47-b0ba-b3fdb6659509;
 Wed, 09 Jun 2021 12:33:32 +0000 (UTC)
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
X-Inumbo-ID: 3f8f91dc-d610-4f47-b0ba-b3fdb6659509
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623242012;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EznfZ6SEH2iJ9MPfVO7Ls7YtpF35u+5V3Q0yiLlDXFA=;
  b=B9GMdz+knyq+MlEkfUK2xZvfr1me57bAfTIY/E0hMa4xww8jUTe6FwEw
   9vp2v/T8W/6BireIrBzp73hxpxXyaV+p0rSfpOA6qAkA15O1xJ6EFWXS2
   kvMWkkagQ7t2ZQNfWF/XSocpzjpOhmrwNiJtg7LkXOT81wHgtguLzdzkc
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rwYo9U9uKgg30mukgCgwrXXh53A/ZE5ibMgThRLHdgWT6RE8JUO28qXYJpuEK8j31/LerGKlZj
 uslXG3EmB9NKfPUXSuKDFLMIBEdKYsT21AP4cYrEOcuqp0iMAcctsQgIV+ws5GQ26f3x6ePRM8
 /tnvpxatedpv/mi37DUgabw6ldB/76ijIIOsIlrrStMiXJ1kDhA1LDwawYgtJ3/ZhDq7tEhXiT
 sBpOqoZMKJDZWD9yPNmALw9mFbHyRMUKl+2HVUf50uyl2kkpHTcUvyyBl7fN1Yb7ycNk8qYkS3
 xQ8=
X-SBRS: 5.1
X-MesageID: 46093283
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:icbuqqhNvxT4U6/R9YksVvRrVnBQXzd13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskaKdkrNhQ4tKOzOWx1dATbsSkbcKpgeAJ8SQzJ8n6U
 4NSdkZNDS0NykGsS+Y2njLLz9D+qj+zEnAv463pB0BPGIaCdAV0+46MHf9LqQffng0OXNTLu
 vk2iMonUvERZ1aVLXAOpFTNNKz1+Ej2aiWLiIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7XjoyWsllP73tBzop/M29FDDMuDhow8LSjtsB+hYMBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhMF2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtjgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4TkWUmxjIQLH48JlO81Gh+e9
 MeSv00pcwmMW9yVkqp+1WGm7eXLy0O9n7seDl2hiSXuwIm1kyRgXFonPD3pU1wgq7VfaM0rN
 gsAp4Y442mcfVmJJ6VJN1xDPdfWVa9DS4lDgqpUBza/fY8SgPwQtjMke4I2N0=
X-IronPort-AV: E=Sophos;i="5.83,260,1616472000"; 
   d="scan'208";a="46093283"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpjR6uvcZNIKGUjXAjiH7m3Ilh99J6fhIl79pu/EdOYDQoLK1XkHq8hSFJiPcMte0+g7W/MU65D+3GdJupiyrnddMb0PYbPgA1glc6CO1Jiwf/btmsE8ZoU/fmyq7kz7BqLdZ/i/q5IZ0Di7pusAD/G+cdaK0fag5JtrebZRdvJHAH8MP3vL6lR4Lkq/iLFP1/nQklWl+0HFxqeWQLKaLaJNK4EXN6GVl2bzuo/+Opn3gjIivv+2Fy8CstINR91OlgwJz4NLKJVUnPe2skDkbQ4C6x93CzmvxVoPr6ppgPcXjKUKwgL8IuljLsps7Uw0jEb6mNTY6uu1saegXfUxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDP1MljM6Yiu02bJ/qCb/SYip8xqaEoD0Ax/qBR8ZcA=;
 b=NUMWrMv+T11CEFsiSO569v2MaHiwbbkj0rRwP6scK04krqRcrnO4o+ate+8LbjL9KC5nCcWDY/s9h7hNm9EyhcUN7DWa2zeNQr+80DsxqtzT5DqGOmanPlkOS3hijv40gBTBQpKi/8Ttwc1nKsoE4Wztraa2xztpoczV9eGOd5yoIwRhr/UB0NUNsPMM0PT9dt7gGOwTTpEHlaLI9GDb8L1+l7oOGkStPNeMpyO/X4OwNjg8SurDZvmldvzZVCSfDqa4zddnop9voCJGc2NelTmi4rts33h03Lt2SoyTSoezEPLUIcnCN//52x6YsRvQd9UW0tK95nXhsUXRxCOk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDP1MljM6Yiu02bJ/qCb/SYip8xqaEoD0Ax/qBR8ZcA=;
 b=ovkmvGXAk67GCV182x0vlcr44wylR+OFMUj5Tph3B0/qXE+7SsiZm+mcswYVVAsmSYwhHJNxLMsN0fbabZCXJYX+IMSIacRs/+COlVYHBzxVpxgfSz9iRpmDnIc/JjtwI2OXSEpHQKQXbwOI+stC+zV5C8PReX+r02/wiNgH2Vw=
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <1bb49cce-537e-9fba-80bb-82bf502728d0@suse.com>
 <1fcb1140-b9b4-5c0b-de6c-e14d33937318@citrix.com>
 <e3283632-7621-69b8-5051-ec528c6ad8fc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/9] AMD/IOMMU: redo awaiting of command completion
Message-ID: <4950c000-2984-a9be-d164-ecb65edffa2a@citrix.com>
Date: Wed, 9 Jun 2021 13:33:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <e3283632-7621-69b8-5051-ec528c6ad8fc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0134.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef94a94a-c436-4424-fea7-08d92b42c7ad
X-MS-TrafficTypeDiagnostic: BYAPR03MB3797:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3797305544236939B67354ECBA369@BYAPR03MB3797.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n5OLw/jk1QVM8HwDeuJ+wMKB47CowXih0nxBjB3CigzRBUkjTDQG17AqH5r6N4FSQ9hnUZThU3UWe1nbXNrLBtkwmYCWWSU0N+HTq7sUPlcNL0m1tojq3sD95DhjSxnuJeg4vgSHkBN6NQxVwC8jp3u8cTg97l6yy3DRm6QEWLULKXYwr3dCf7QBkIaG+MUEkEjtk1q3mRJCuDKBgA3nPETOYzkcxuI1EmlBHxP1kejRGlKtMU5TLruCxArNoqabdy7UPop6h3dxNDLEOsoBiElB3v8c7QARGBfLKEkd8r3ESQ5bmWoT1AR6kVfTmAiCg48oe5HYDlw1t22VTUBo8beLRyljn5TB898Tuv/fLuiCygfLUKR2btylXKZ2r0LeQrn7V9ABk8TssvvLfVnDCUAYE9pGTLxWU6NGWVRmns6z8NP51HQCeDF0jK/4qpj0EIP4zkdLtEqgoVwc5Zg4p1HABMb3Z/BE11n0O8ABkr/pVyt/FIkPxQvI57DlF3EcDXRtgt2FGJGcYPDlccvu3SuBs8DFM0KYZosxEivsWKSuzZxvrh9Vb1ksQ1yf8P3Knb7HmPhGT9Dt8uvfnrfji8j2UNrX9Oh543YCdGe+u6OK4xNRYGGoGPrRrBEo+RB8HNScpIFut0F4oMSXupuC00zzT3P/39tre91ZwwrSRyJRU4kk1a4wzBjpFjaIwUnl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(136003)(376002)(346002)(31696002)(66946007)(4326008)(478600001)(956004)(316002)(54906003)(66556008)(16576012)(8676002)(2616005)(31686004)(36756003)(83380400001)(38100700002)(26005)(6666004)(8936002)(186003)(6916009)(16526019)(66476007)(53546011)(6486002)(5660300002)(86362001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWRlUTUxL3hnUHF5aUhMRkE0d1ZPckJsVk5wS25QSHJGNGNkOE95QzhBL25J?=
 =?utf-8?B?WGJoMDUyMFZSSndDRjFIa1lHSmZqQjI0d1RKaWx6ZDVDajFrT0xnamhRMDAw?=
 =?utf-8?B?TmJ6dXZ6U2lGaHBWalppdXh6SjNDaXR1REVGN0crelRMSDg1bGJWNUd3cTJw?=
 =?utf-8?B?azIzbXBXUHVoejF4WnBrWnZBakZxc1pFTnFPYllic3Q1TVdPRDBIMnU0Mjk0?=
 =?utf-8?B?Y2pzNlRFTWZyR0tEM2tDM2lrRUJiQjdYQ1dub2tTNzVEc3lMcUZ5bWZlcDl4?=
 =?utf-8?B?Ymh6RFVwNWxSei9JcldLMHdxZnM5dm9zWk9tNkNNSlc4TlRheVdvZnYyYS80?=
 =?utf-8?B?d2t0OWV5OXBVT2hUR3hQZ2l3OTNCcmNxL1VLRGQ3b1AvZUJJWEpsTjVJVnBO?=
 =?utf-8?B?MENyaVVDODI2NnFJbUV5V29acTJaUHN0TFJqNWNnYWZXVUMrTVEyZ2ltaVow?=
 =?utf-8?B?N1d6dkRNcWFHS1BXWkVITFZTc3dZMzFIcmpvUXR2ZVhmUWlCTSs1bUl2OWh5?=
 =?utf-8?B?MFpHZWtOUXNCUWd6QyttRzBVdk5IRWJQd2JWdndoVFkyQXUwMTMwRHcrVGNN?=
 =?utf-8?B?M0JEQlo5eHluYWN6SmpLSG4va0d3UkJ1K2pRTEhTWkFPbU5tSC9lc2VnYU1m?=
 =?utf-8?B?Qnp3VU1qRjFtMXloTENERnhycCtkcGdzS3F1TkJrdFlJcEhLc1JyZlhoeWdD?=
 =?utf-8?B?L0FyWTY5Qks3K1NiRERJNmUvcnVseXFHNGJHQTRMQXBIdStQK3Y2ck1Hb0hM?=
 =?utf-8?B?VURPTjlLT1Y1aU55TWQ1K1crbks0ZWJhN0dTMUwvRnVUbmJCSEVtSHlzOXhj?=
 =?utf-8?B?VCtjUGpYNG4xdGF5dVRwYXlHUWY3Yy9RTjVOZllSUmllajl2K2VxNFd5ZGp4?=
 =?utf-8?B?cCtvTlFySERmUVIwRmcweFlabE84dHhLS3c0UmxiTDFDbzFpcEo2QkxkTVBi?=
 =?utf-8?B?QVhHTzR6TEpGVDJPcFpYOEgyaDB4RXFZSDVNbkNsQlBSd2pwbitjRGYxMUZR?=
 =?utf-8?B?MzF3NllmR29NeGRDR1UrdGh1ZmtkUFB1ZUxzRDk2Ri9XSC9vQ3BRVHl1R0FC?=
 =?utf-8?B?QXdGQzNnS0NYblR4SWljbTRrc1JKNksreGFJYnhQU2YyL283MTlrdVR0SEUx?=
 =?utf-8?B?TjVlNDhtNGRUZlZra0RRT3I5aXdPclRpeEJqTUs1bTJ2RHRlZlBGQjZUUmVV?=
 =?utf-8?B?emVRNjJSZVNBWGJnSkR4VGE0TS9NR3BBbGlJVXE0ZFhLemdKclR1UEprelly?=
 =?utf-8?B?TzJrWUZoNFNuOGE1bldaUG9BSzlnbWljNjlNUUV0TlBnbXlQTlV2eW9BT3pj?=
 =?utf-8?B?bkl1YkFRaFNzcjh3a3NzSmFaSTlva3lkakZ6L2k3S0ZoRUFYa3YycjVzekRt?=
 =?utf-8?B?M1QxMzI0SjBDeHQrNVpTUThYZkVKZk92djcvWENIdXRzcys1K21IMHIwdnRa?=
 =?utf-8?B?OHlkR1Z5dnJ0TG5XdURzR3BhMGVUZlNLTUt2OVpQRFFBbXprVmZOS0IxRFRI?=
 =?utf-8?B?VG1WeTVDTHJkK3krN3h5NlFPM3o4SkwvL2JOWUFTZ3RZdE50ZnU1bWZKTDV3?=
 =?utf-8?B?bUpnai81QngyZTAyR0E3czhJTkdGbzRCVzdyalVoTzVGMUl3b1RCbytuOTdS?=
 =?utf-8?B?bVBrWm9oT1Z4UXZTcFVTQVIzd3BFVHBxeTVUcHFXMWNnZGFrK3ZuNk0rTjRh?=
 =?utf-8?B?dEdmNDdHQktlYjJZWVhMeHVXdmJNeHQyKzNXZHB5Mmxhb2FZRjVURWxKYk9K?=
 =?utf-8?Q?B4kEh2cP+cSIH9fTifmURPwg75hu23wCDAT2LuF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef94a94a-c436-4424-fea7-08d92b42c7ad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 12:33:26.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjhVnfgBaFNCz3mHzyOvKcY2LQn5EAGm5Zwdcymw+qVDG/61Z14WcuIB/uT2RBK0pFLWvfZOKs9zdLyDvpS228WB9f3/fYxXq9gSARMX4i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3797
X-OriginatorOrg: citrix.com

On 09/06/2021 13:08, Jan Beulich wrote:
> On 09.06.2021 12:36, Andrew Cooper wrote:
>> On 09/06/2021 10:26, Jan Beulich wrote:
>>> @@ -49,28 +52,31 @@ static void send_iommu_command(struct am
>>>  static void flush_command_buffer(struct amd_iommu *iommu,
>>>                                   unsigned int timeout_base)
>>>  {
>>> +    static DEFINE_PER_CPU(uint64_t, poll_slot);
>>> +    uint64_t *this_poll_slot =3D &this_cpu(poll_slot);
>>> +    paddr_t addr =3D virt_to_maddr(this_poll_slot);
>>>      uint32_t cmd[4];
>>>      s_time_t start, timeout;
>>>      static unsigned int __read_mostly threshold =3D 1;
>>> =20
>>> -    /* RW1C 'ComWaitInt' in status register */
>>> -    writel(IOMMU_STATUS_COMP_WAIT_INT,
>>> -           iommu->mmio_base + IOMMU_STATUS_MMIO_OFFSET);
>>> -
>>> -    /* send an empty COMPLETION_WAIT command to flush command buffer *=
/
>>> -    cmd[3] =3D cmd[2] =3D 0;
>>> -    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, 0,
>>> +    ACCESS_ONCE(*this_poll_slot) =3D CMD_COMPLETION_INIT;
>>> +
>>> +    /* send a COMPLETION_WAIT command to flush command buffer */
>>> +    cmd[0] =3D addr;
>>> +    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, cmd[0],
>>> +                         IOMMU_COMP_WAIT_S_FLAG_MASK,
>>> +                         IOMMU_COMP_WAIT_S_FLAG_SHIFT, &cmd[0]);
>> set_field_in_reg_u32() is a disaster of a function - both in terms of
>> semantics, and code gen - and needs to be purged from the code.
> Long ago I had an item on my todo list to get this cleaned up. But
> it never really having made it up high enough, I dropped it at
> some point, in the hope that we'd manage to get this sorted while
> re-writing code step by step.
>
>> It is a shame we don't have a real struct for objects in the command
>> buffer, but in lieu of that, this is just
>>
>> =C2=A0=C2=A0=C2=A0 cmd[0] =3D addr | IOMMU_COMP_WAIT_S_FLAG_MASK;
>>
>> which is the direction that previous cleanup has gone.
> I don't think I can spot a single instance of such.

It's actually the other way around, for the emulation logic (which isn't
used in practice).

drivers/passthrough/amd/iommu_guest.c:348
=C2=A0=C2=A0=C2=A0 i =3D cmd->data[0] & IOMMU_COMP_WAIT_I_FLAG_MASK;

>  Some work was
> done to introduce (mainly bitfield) structs, but this surely goes
> too far for the change at hand. I can spot two instances using
> MASK_INSR(), so I can see two consistent ways of doing what you
> ask for:
>
>     cmd[0] =3D addr | MASK_INSR(IOMMU_CONTROL_ENABLED,
>                               IOMMU_COMP_WAIT_S_FLAG_MASK);
>
> keeping the name as *_MASK (and I'd be open to replace
> IOMMU_CONTROL_ENABLED by true) or
>
>     cmd[0] =3D addr | IOMMU_COMP_WAIT_S_FLAG;
>
> i.e. dropping _MASK (but requiring adjustments elsewhere in the
> code). Please let me know which one you'd prefer.

TBH, I'd suggest just using

=C2=A0=C2=A0=C2=A0 cmd[0] =3D addr | IOMMU_COMP_WAIT_S_FLAG_MASK;

for now.=C2=A0 The constant is correct - its just the name which is wonky.=
=C2=A0
This in particular will reduce the code churn for ...

>> There are no current users of IOMMU_COMP_WAIT_S_FLAG_SHIFT, and ...
>>
>>> +    cmd[1] =3D addr >> 32;
>>> +    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, cmd[1],
>>>                           IOMMU_CMD_OPCODE_MASK,
>>>                           IOMMU_CMD_OPCODE_SHIFT, &cmd[1]);
>>> -    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, 0,
>>> -                         IOMMU_COMP_WAIT_I_FLAG_MASK,
>>> -                         IOMMU_COMP_WAIT_I_FLAG_SHIFT, &cmd[0]);
>> ... this drops the final use of IOMMU_COMP_WAIT_I_FLAG_SHIFT, so both
>> should be dropped.
> Well, I can surely do so, but like this entire request of yours this
> feels like scope creep - there was no intention here to do any
> unrelated cleanup. And if I remove _S_ and _I_, then surely _F_
> wants dropping as well, while IOMMU_COMP_WAIT_ADDR_*_SHIFT have a
> use each in iommu_guest.c and hence need to stay for now.

... this, which I'm perfectly happy leaving to a subsequent change.=C2=A0
(I'll even do it, if you're too busy right now).

What I am mainly concerned with is not using this opportunity to remove
uses of set_field_in_reg_u32().

>
>> As for IOMMU_CMD_OPCODE_SHIFT, that can't be dropped yet, but it would
>> still be better to use
>>
>> =C2=A0=C2=A0=C2=A0 cmd[1] =3D (addr >> 32) | MASK_INSR(IOMMU_CMD_COMPLET=
ION_WAIT,
>> IOMMU_CMD_COMPLETION_WAIT);
>>
>> in the short term.
> Can do (using IOMMU_CMD_OPCODE_MASK).

Oops yes.=C2=A0 That was a copy&paste mistake.

~Andrew


