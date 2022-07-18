Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E6E57804D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369603.601052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOQ0-0002Vt-VA; Mon, 18 Jul 2022 10:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369603.601052; Mon, 18 Jul 2022 10:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOQ0-0002Tx-Ru; Mon, 18 Jul 2022 10:56:04 +0000
Received: by outflank-mailman (input) for mailman id 369603;
 Mon, 18 Jul 2022 10:56:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDOPz-0002Tr-Fn
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:56:03 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10051.outbound.protection.outlook.com [40.107.1.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36b1127f-0688-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 12:56:02 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 10:56:00 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 10:56:00 +0000
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
X-Inumbo-ID: 36b1127f-0688-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frVI2WLFmjoMNjweFpj2TVSNNnPLwa0wT1u+xSn41d402zBY2PzBF7czE835n3ntmY+CL5MDPNWUehd+OqHB+e+OqxhRM4ntYoRDXFPrrYydT9sXhGT69+ioXZlw7Xugc87h9osCo7PvUPlyt3p0AByxQyUSYlMT0B/YN8CjRYbUtHwQG5KFSIklQtUfYbC+5XRF7+B93JevJWJ4HQ0yrkHHhHsDaKKuutItI9buiBJ3OwAJKTjnYuzU56e8jwqiMVNTcFmL9m+qFwBXH6w5MFg9RA4gcurVzNF0FTTny5IvaySR91YXmScGwY0IUvjejLWjzKy+DE27jriicz5bww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lGpFAMlZVVIdqkRLYieMXmuA70mRMfIRSkHyGO/dmI=;
 b=FjLqS7UBDvTs2soFDSSk9SP0pA3mQN4UgV4n6TZ3yYUxhtlXEo7gnh51JuAVCUhKl63j9KTRwiUvr3oPR/0lVbOhlOrPKOJ0ZzM54ioK7Ua6hhHpNUgQR5S135nG9sP5nl9kIJwV7vgmhDct/83o5Hago5v7IhiX+9Njh97S3mJ2TZkeUaDodzdndx1i037JNcYi/nU6/XImBhEr3VaItEcafh3eCvzo3tvE53Jmn15BoVyDanPCIvRStRK28JQimSC0ZvUXYqxvCv449L8TVux9dBkuscy3CV9ufggc+UZFs8lGbT3Yk1xg3Gj0AT5OBG+WvfAogYlynHAKjv+lYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lGpFAMlZVVIdqkRLYieMXmuA70mRMfIRSkHyGO/dmI=;
 b=DDqJ5lMy7VlUZmnhQEALfn9j7cUKb0xGLpQREvIZ78KBttI8rGtg6PR24DjHTw7IDO8/UdbjyPul+655a8FwzTaUJ1S2BzN7qcm1UHB1b7edgXYBjrjnks0HoAC4Ccbmc3SeWMXyVKrfdYrhXqumGULRxeccHC41iUVx0oSIFbMcv3MB4rHJoHxJ9XylkubK4pmlgMPzIF+gZ9gr7reJIczo2SGe1a8wZvTjTsifNrSiFliNnG3ZdiCD7KMMasEYDJF72n4Tn6WjU0hg1eChwYZTAxynhTpPTwKWFCqymmByC+tQ97w7RyRSp28EzWiik5Hv1VpLnkpnwmOOVFmCyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c1705d03-4f98-27ed-a854-7e68a88b10b1@suse.com>
Date: Mon, 18 Jul 2022 12:55:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/9] drivers/char: Add support for Xue USB3 debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Connor Davis <davisc@ainfosec.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
 <5a283b4d-8d1a-52cf-d863-350e2ff39566@suse.com> <YtU50+Wz4HWQ6p2Q@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YtU50+Wz4HWQ6p2Q@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e08db31b-7227-4564-bd22-08da68ac19ed
X-MS-TrafficTypeDiagnostic: DB8PR04MB6475:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9yL+8J6/YclUE/IDW4QmvO8r1VIBWCjdLnyhbP2m0q5tBOh/0BxFXFzRQjHHdwxe798lzvzq0vd/Sv3iwoIFoYQN8mXJTilIwPxVDUHmOFtVXUpOAZSDJRkREwBcjTCpu98AXjx8eBNXpsmWLj1ACmaKgN5BFylrwlcdhYwXiFPS+lLJVuhLHeBoTd98NO1a5TWOvpY/GgM1fQGvOKFZr3gyzm+ggASgCAI8aiHaM6dgA4Kpdh7PQfUe0XxNh0tpKHTW9yJa/OneCRRM1IxefKLTvvzDWLPcgC4lIF9w6xRa2JYq+gjU6VD62eLaf2gubMyKteABawRFNMJJ1bxhnXMihFj6cnTGsA7O3uAvdT8lIbOfPzAL/TtPYDvrKwKMtUB0AWosu5jTs/nxodXvZSqC1rrrxGMpFuLSzd1iXWTLkjdHaopU6mWsUePM4dVkQkKv2JUDwWzCk+WrFvgH0uB5r3TW4YfRQp7GcU0bjJbt/RuzFXpE/zAkeiB8A6P76fb4PwSX0vbp8/IERCKRviJgjsOsxGgEwzCAJG2znuKMJX76zrVaKiWnyR/ICg+P518cJk01zB4Whd033n5le7wL+PFKOe20YVz4G2OSKY0T5EVRZr6cV1sqO7/hI5E0zEj1FlC0jPpU/FbEE/gDKGEEC52nz46NFDeuLfkOa4dpp8RFV6xMeYgMvsubC7GQl0HHCsUYPmR0rmK69fO8Z42pBeWDvSJcLxslntAUnH/c06cwW6M8K9inZJVf8J62zEHWttDl+LWbXveDxPkc6/mlEWKVaB6CLF0EYVMaFsYVjK4hdmmF3ZUTxt63+cp5J+6uTSa2nk3EExI57ARcZzPGw6cnq8Ep1UpJNcdHj3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(376002)(39860400002)(396003)(478600001)(8936002)(66476007)(66946007)(66556008)(86362001)(4326008)(8676002)(31686004)(5660300002)(316002)(6916009)(54906003)(6486002)(36756003)(31696002)(6506007)(53546011)(2906002)(6512007)(26005)(41300700001)(38100700002)(186003)(2616005)(83380400001)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXJWMmtQVXZyUU93bEJjc3o2QXVXcDBtMXpZRFlrbU82U3I1QSt4YUY0RVZN?=
 =?utf-8?B?U0Rpc2E3UHN5dU8rM3VKUXFyYmxjcHlabHhHL2VUSm1RN1V4cGlnd25oT2hy?=
 =?utf-8?B?THBOTkhQY0l4NSt2WE56Z2xhT1JrSVc5eUY1LzdGU24wVWpPQlZiTXFVL2xF?=
 =?utf-8?B?QkdpOVRSQW95dDhqRDJHN3c5UTR5SENiK1VVUXhmVVQyR0lxOThScy95MkRM?=
 =?utf-8?B?QXhoV3o0dXZiUnRXZHU3YjhWVWhmS2Y2NWlHeE05Y01JNzl4SlZFRTk3OWxT?=
 =?utf-8?B?dmxVWmFJa1dyMUREOUNHNGdKTlhvY3hVREFTZm4vYzlwNVBwMC9ES2tvZzlN?=
 =?utf-8?B?NExhL0I1VDFneWZ5ditMR3VXdW51VnJpaFkrU2tOWVczei9UamJ4cnZKZk1F?=
 =?utf-8?B?VG1QSE5sUkIybE01QUxqQklKYXRHMVFaUzZCQjg3VnhwdU5vbm1vc0dvY1JV?=
 =?utf-8?B?Ly90QSs0dmR0OURFd1p3TW5BWmpScGJsMWtCd1ZpSXY4bzZLakhxeEkvVm5S?=
 =?utf-8?B?dWhmT2h4bDJJekdjTzNuYTdoTjBxbG1zdnoxQXJWaGY5L25XZXNPRElQRmly?=
 =?utf-8?B?c1dNL3ltTE9qRWlkQm1LVXFXSVBORVM0WFRCazBucHhNU2dNNk5KQlFzQ3ZI?=
 =?utf-8?B?SmJEcVpLRlkxSEVsVE1TL29KVnZ3VGhheDhvT3U0cmJVSXFsMityaWNIYVRj?=
 =?utf-8?B?TWw4SGJaajgvTVBVL09pZmFNUC9jRTZDbmlFSDNmY0RlVDk5UEhuR3RpS3gv?=
 =?utf-8?B?WUhjUFMxY2tuNHp0Ly9OYjFGamMwYmE1UU5rNEVVNTM2NVYrd3NqMSt1S0xF?=
 =?utf-8?B?cFVtTUlJZlA1ZS9Va3A1V2tsa2dpVWFmYUFYWVgwemp1OHd3cnk2TE1vSFBr?=
 =?utf-8?B?aUhMUDdFZTlyMWQ1SmxRNmtjb3lkdGRmcm5iSjdjS05KRUppVVNxcUhZNU80?=
 =?utf-8?B?Q0k5V0Z6TnVvazljWldnVkZoanV3Q2xUdU9wbVVFWU5FR3Rab3hsTWVEbzJT?=
 =?utf-8?B?c2VMZWorRlQ1dVF1MnhlalRRVnQ0cGFRZjNxMGpsSkxqZmJXM3dqQWFxdTgv?=
 =?utf-8?B?M3UrNmlGZkVjRE9iRS9JcFR3T0lJY2MxVjlQQUJhYktmWFh2cGg3Y1VEQnVY?=
 =?utf-8?B?M0R3TUE5QXFYMjJDMzdZZk5PN2k0NzVHT0dZdEJJeldFRXk3cW9vVE5xbElq?=
 =?utf-8?B?bE5wTUtNQUFXYi94MG9rbkxRNUFVSHQ1YjI1WGcwb3ZvcUNBaFFuY3FkaU1n?=
 =?utf-8?B?VjlGNmRRUTl0NkJDUGhKUDliYUllVGtSQkF4a3VGUXRjS3NtNEJEb2JSNUlz?=
 =?utf-8?B?NXZNais1aGN2Rmt1OTZ0MEZjditVb1BHVnR1RjhmNENheFYvN2l1MnVFMWc1?=
 =?utf-8?B?eTBmR255ZE40N1FTeGRyV1pVSlM4ZVBXM0J1YXlxekdGUmRCd1dKT01DV0RX?=
 =?utf-8?B?VFYvNGdtdHRqaDJXNU1sanVRbng3dVU3dGo2QlM1WEVpMkRsMmt2SEZJYndL?=
 =?utf-8?B?a3ZFeU41d2VHRjhJVVFIbVozTnJQMDN1ODl6blhDYWw3WnFHOVZSY2FEVGNZ?=
 =?utf-8?B?Sm9YRTRnRmZQTTFWenhIU1NLUmNST09qd3hzR3luZFB5aXJLMCtpYzRUUFVp?=
 =?utf-8?B?cmtmNW8vdklPVkRJd0ZmVUdxNGNMRk51cmlJZ3ZTK2hraTFpN1J4M1VNTWJ2?=
 =?utf-8?B?NTRBQldBN3RhMW5OVGV6dTFDa0lPblB0MGprMXozQnp4VVBvbWFIcXgxd09j?=
 =?utf-8?B?RVR4dVBrbzVhYUpsOUxKRE41QVVVeUtlakRrZkg5Z2N2Vk9KYWowY2tUZ1d1?=
 =?utf-8?B?TzJZQmU4REwwcWZDTDVLaXRPN2sxdjhlVUFnRWFGc05odFhXSythUVAwK2FH?=
 =?utf-8?B?OHlaQk1DZWUxN1g5NjVsRTN0amZ4NE5hd2FVN3J4RG1KRUROTmZaWkFhWmhH?=
 =?utf-8?B?c2l1MHZlc2FNSkt3eVlHdERJRjJUOU0xV01nd2xZWHNLcWtVUzZWZWhRb1hI?=
 =?utf-8?B?bGNkQ1hVd3V3YUZraERqUEtQNy9uVUd0VVM3N3NMdGJiQ296ZzdmeUhwMUVn?=
 =?utf-8?B?ODRlcU1FaVErc2k4bWtTRmRucmQvMERzUExrT2phQkRyd3pFYWUwZ0RQRndn?=
 =?utf-8?Q?jGkpeXf/lcZTfSnqJYqtvy+1E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08db31b-7227-4564-bd22-08da68ac19ed
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 10:56:00.6270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnupceQLg0hdmlQD7pHP3+kH5eMvzq9sNUy018POmQxfxk5YxzQSYF+tun/sNPOmv+a9npx59kEmM6SEsFFTLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6475

On 18.07.2022 12:45, Marek Marczykowski-Górecki wrote:
> On Tue, Jul 12, 2022 at 05:59:51PM +0200, Jan Beulich wrote:
>> On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
>>> +static bool __init xue_init_xhc(struct xue *xue)
>>> +{
>>> +    uint32_t bar0;
>>> +    uint64_t bar1;
>>> +    uint64_t devfn;
>>> +
>>> +    /*
>>> +     * Search PCI bus 0 for the xHC. All the host controllers supported so far
>>> +     * are part of the chipset and are on bus 0.
>>> +     */
>>> +    for ( devfn = 0; devfn < 256; devfn++ )
>>> +    {
>>> +        pci_sbdf_t sbdf = PCI_SBDF(0, 0, devfn);
>>> +        uint32_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
>>> +
>>> +        if ( hdr == 0 || hdr == 0x80 )
>>> +        {
>>> +            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == XUE_XHC_CLASSC )
>>> +            {
>>> +                xue->sbdf = sbdf;
>>> +                break;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    if ( !xue->sbdf.sbdf )
>>> +    {
>>> +        xue_error("Compatible xHC not found on bus 0\n");
>>> +        return false;
>>> +    }
>>> +
>>> +    /* ...we found it, so parse the BAR and map the registers */
>>> +    bar0 = pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_0);
>>> +    bar1 = pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_1);
>>> +
>>> +    /* IO BARs not allowed; BAR must be 64-bit */
>>> +    if ( (bar0 & PCI_BASE_ADDRESS_SPACE) != PCI_BASE_ADDRESS_SPACE_MEMORY ||
>>> +         (bar0 & PCI_BASE_ADDRESS_MEM_TYPE_MASK) != PCI_BASE_ADDRESS_MEM_TYPE_64 )
>>> +        return false;
>>> +
>>> +    pci_conf_write32(xue->sbdf, PCI_BASE_ADDRESS_0, 0xFFFFFFFF);
>>> +    xue->xhc_mmio_size = ~(pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_0) & 0xFFFFFFF0) + 1;
>>> +    pci_conf_write32(xue->sbdf, PCI_BASE_ADDRESS_0, bar0);
>>
>> Why is a 64-bit BAR required when you size only the low 32 bits?
> 
> xHCI spec says the first BAR is required to be 64-bit, so I'm checking
> this assumption to handle just this one case. But then, the size is 64K
> in practice (and xue_sys_map_xhc() checks for that), so just 32 bits are
> enough. Anyway, I can add sizing the whole thing, for consistency.
> 
>> Also you need to disable memory decoding around this (and
>> somewhere you also need to explicitly enable it, assuming here
>> you would afterwards restore the original value of the command
>> register). 
> 
> Actually, this is a good place to enable memory decoding.

It might seem so, I agree, but then upon encountering a later error
you'll need more precautions so you would able to restore the command
register to its original value. I think it's easier / clearer when
you keep command register save/restore to within functions.

Jan

