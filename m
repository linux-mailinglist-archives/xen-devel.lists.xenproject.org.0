Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D91B93A252
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 16:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763264.1173529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWGBp-0003ry-6t; Tue, 23 Jul 2024 14:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763264.1173529; Tue, 23 Jul 2024 14:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWGBp-0003on-4E; Tue, 23 Jul 2024 14:08:29 +0000
Received: by outflank-mailman (input) for mailman id 763264;
 Tue, 23 Jul 2024 14:08:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1nq=OX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sWGBn-0003oh-Dy
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 14:08:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2414::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06397dcf-48fd-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 16:08:25 +0200 (CEST)
Received: from BL1P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::13)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 23 Jul
 2024 14:08:21 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::27) by BL1P221CA0025.outlook.office365.com
 (2603:10b6:208:2c5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15 via Frontend
 Transport; Tue, 23 Jul 2024 14:08:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 14:08:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 09:08:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 09:08:19 -0500
Received: from [172.23.111.139] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 23 Jul 2024 09:08:18 -0500
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
X-Inumbo-ID: 06397dcf-48fd-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3Eu5lzcFX9FLBi/PPf/lCxTKiTo+McefbyeMJ88f4mW5kuuo1tgzhjkofgPvkOZUNqA8/exi5tzZoN+ofIOj+LiC3J/DJ9I7+q77m0q1s9SgIeQxAH0Xhc86wE2YarVNLaXCttDD5mkPmTl8u6bnHQujfFiXDt/87oKw2rsB1f/PKnvbSLGr6e+PF9FqyQNMMAaBb/0SCsHrND3XRUKbBnafz2zotOYtld841gGJhiVw+gnT0TaubCtoImHkFO4Tgtdn1ejugeKWyOT/AxjrLHXi8R1IYcES77xQeXOugvl3PzTt0uEf4fk0gH7TIe60Qv1wvy+qM18tFEIBswMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrOKkQBU4TDjr90t1Z4yRMA7wSjtwgBuAkIgZmtVEdA=;
 b=ieLV5LWiBsVPJK+jJfYTCYmdubOAWW3nOA2odrM1V54YckP3NHhkiAXvXlM9KmevZezyQ9CPtFZ+2RcJTaNUv51SpZagUkyJJpZMaMTHtXDYsEgquqzER19nRRTtz8PO6+OeeOgir/6i7+zpRM68Yoc9szmeWI4T5L+HOW/sIY31lfqu5D38/AvynABQFsqg5ThKDKUD79uYUhFt52yj22FD067R2hb1Ohg7e78e08g8+yeN8swUDnQEjh9Wmyb/j6OMIZbx4ok1euq30pxA0SMO2ir4AnDP0nk+A8F/m29oE+wxRkPQhgcojWnkeF1/ex2i5u77L2lQEdzTRZcJFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrOKkQBU4TDjr90t1Z4yRMA7wSjtwgBuAkIgZmtVEdA=;
 b=Yws/wGKaFQLbMnz/SkQrFBcy6nLZywGDdSugfEvZv77RCjirgLxzZxJvyBQD05NjKxwk8DvxK+d83QfD47WkEAKM5PY5mt6VJ5OESXznXMnIl0fzUmipr9EKTHLnznt1H2pBih5cz8HYrga+Wk/RyH7dJ1snoUEQ1xJnl6PRxD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <296cccab-118f-4b42-b48d-f4927d10162d@amd.com>
Date: Tue, 23 Jul 2024 09:45:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 5/6] tools/libxs: Use writev()/sendmsg() instead of
 write()
To: Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Frediano Ziglio
	<frediano.ziglio@cloud.com>
References: <20240718164842.3650702-6-andrew.cooper3@citrix.com>
 <20240722162547.4060813-1-andrew.cooper3@citrix.com>
 <cabf929b-11bd-4401-88a2-7d4c8ae4b606@suse.com>
 <702ac4d8-2eba-4b4d-bf43-3cc8277c5778@citrix.com>
 <34350564-2faf-4af7-a66c-4ef3960a98ed@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <34350564-2faf-4af7-a66c-4ef3960a98ed@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: faf4e7b7-6a78-4122-0230-08dcab20e904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2FHendIK0NiM3hBK1dZRmN4czd6MGFzdngvVlAwclYrNTlDaEd1aGhaekJE?=
 =?utf-8?B?bnAvdUFDUklxRFNhRTNaYUFGaTdkYlExN1A4bDN5Ym1IWmNyVlpsaUVkb1dn?=
 =?utf-8?B?L1NDVDk4RlNQSExiNHpFVnFiK0ZRY2E4WEk1MTMzNkRzSGZZZ1dGOFlrTW5a?=
 =?utf-8?B?bFJOVmI2OS9zT0FrM1hXRzlHenlrQjFzbVpmWXlTQzM1UDkxTmloZDJWTFFr?=
 =?utf-8?B?d2VLN3hqRitvWWJEUktjZFZzbExMRHRVbS9zaGlZM1A1dVlRalE5Rk93ZVVk?=
 =?utf-8?B?dHQxUzBtdGRRdWlubUpoMjZyVzAvUjBnLzR3bHd1UVYvdHJSZWlWT09DYmUr?=
 =?utf-8?B?TmRZZ0ZWLzB3bVNTdmpKR3dRTEhCVW9SYkFOTkVtUWwyKy91bWg2NDk0WlBm?=
 =?utf-8?B?TmIyQytKY2lBeHVqNVBYSXc5N0VuRzk0cTF0ZkVDd293SXNpZE92OXNINnRl?=
 =?utf-8?B?NnZOcjBCSVV2Z2V3Z0hrdWg3TW8zSk5zNTdKN0UwZ3NwcXZRWldiUHhkcDVz?=
 =?utf-8?B?dE9ldlpYaFQ1R3lOR0YxMEhzb05IcXhJUHZXUG14WTU4a0dLY3VSN3BOaVhp?=
 =?utf-8?B?SGZRRUZpOGdsOXFRN2xldmUxNFlVd2R6OTBDbitSMGh2ZGVyOU04NFAvRzZC?=
 =?utf-8?B?QTdiUWFKR3JFeE5IZDNNRnBmWlQrbExreGhSa0kyamJZblZpQVptS0Q0ZDVl?=
 =?utf-8?B?bkNWMjd2Y2ViVTd3ZUQyRXBRbGUvNkFUM0RYOXBTZWZBV2MwWnM3eEVCNzcw?=
 =?utf-8?B?RlpGYmk0b2RGN0hTY3FmOHR2bVgyTnJOdWtGcGFDN2hHK2lBbDBqcVFXZ2Fz?=
 =?utf-8?B?UW1IQS82OVYzaWFRdDBIMUpIcDRvKy9VWTZ1TFM4dTI2UjlURlNWckFuZkdT?=
 =?utf-8?B?VGZtWTZkdW81WnJzRUt2Wi9ZS0N4aVVzS3l0VVhXU3dkbzcyK09JeXpkRzY1?=
 =?utf-8?B?OXhsVEM5bUhWY2ZzMUVLMEpHOU8rVlYrRS91cG5NWEhYRWl3V3lZdW0zYmo0?=
 =?utf-8?B?N2VpazRtU3ppZ3hKN2ZIOVZHZ2JBUDltWlpTTTR5K1F3aUVsQk5GMElVYVcv?=
 =?utf-8?B?K3dvdFdURE5Wa3A2TWtWRm14MVJBQ0o3a0JjcHErZUxNWjBQdXQrT0piMVVi?=
 =?utf-8?B?WnpNejF0dVIvU0dBUFJHYW1hNytuUzJPblYyYTJ5VThQYnNLb05MelpqbFY1?=
 =?utf-8?B?VGIyZFFLZWxxNU5PN2tzVnl4K1JkWUVHQUtSdTVncEpoWUZoOGZKUmtpREoy?=
 =?utf-8?B?YVUyTE5xUnpuSjRKNWJwK2l0UGovclhRV251MmdJWEx1RCsvYjA4U1REaDhj?=
 =?utf-8?B?WWp1cWJuM3lQNTVhb0RBRGRKMzBIbTNta0pTeUpkNS9yRzBDTnVoRVh4cTZX?=
 =?utf-8?B?Y3pEeTBwVGkwSEtkc0lwU2V1YkdWaFo1eSttTGdXeFpPMUQwNWZPakpBUGgx?=
 =?utf-8?B?bDhkdXlLa2MwWS9BUWlXRDhubFh0Z290NWFyNHJMR2Era0Y1OEF3TFViOUt4?=
 =?utf-8?B?NlpWbmZzU05YcGRHMnFkRk1tazArS2FoQjNveThpeDZ5eDFQQXNJVFpSeHJx?=
 =?utf-8?B?SitLOVEzNU01dlc1RDQ0SGhtQ3czdHcrcE9HVVh6RjZNSkpsVWkxT0NhamYv?=
 =?utf-8?B?ME5tMkpmUDVNbzZ1TUZ1Ukl4eWlPcmNaS1VjUlRQSkQvWmhlRjRiUU1wTGZZ?=
 =?utf-8?B?L25rYlZxOUdycDdWVlNvQUU1Y0N4bzROYkNwVXNWUnBsMVpoWFhTTXk0dE1m?=
 =?utf-8?B?RVRWaEFJQWVJeGdIcTdzcjRaWDBtcCtuK1hNMWVOeEZML1hvbVlRK0ZweVM1?=
 =?utf-8?B?ZFNLYmtKWmU5dnFWZUNTQzU4Q0xwVzdqb3R2Z3M2M0h5dGJaUVd0WEpXbThM?=
 =?utf-8?B?bEZ5SGRFY1ZObjlLb0ZmMnNZSGRJcXIzYTZhaTVOR0dRcWJwcmU0a1JxaDFP?=
 =?utf-8?Q?NKlLZXB9FlZ2uNJAv6HFtUD+LzxjsLiK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 14:08:21.5799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faf4e7b7-6a78-4122-0230-08dcab20e904
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754

On 2024-07-23 08:30, Juergen Gross wrote:
> On 23.07.24 14:25, Andrew Cooper wrote:
>> On 23/07/2024 10:37 am, Jürgen Groß wrote:
>>> On 22.07.24 18:25, Andrew Cooper wrote:
>>>> With the input data now conveniently arranged, use writev()/sendmsg()
>>>> instead
>>>> of decomposing it into write() calls.
>>>>
>>>> This causes all requests to be submitted with a single system call,
>>>> rather
>>>> than at least two.  While in principle short writes can occur, the
>>>> chances of
>>>> it happening are slim given that most xenbus comms are only a 
>>>> handful of
>>>> bytes.
>>>>
>>>> Nevertheless, provide {writev,sendmsg}_exact() wrappers which take
>>>> care of
>>>> resubmitting on EINTR or short write.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>> CC: Juergen Gross <jgross@suse.com>
>>>> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>>
>>>> v1.1:
>>>>    * Fix iov overread, spotted by Frediano.  Factor the common
>>>> updating logic
>>>>      out into update_iov().
>>>> ---
>>>>    tools/libs/store/xs.c | 94 
>>>> +++++++++++++++++++++++++++++++++++++++++--
>>>>    1 file changed, 91 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
>>>> index e820cccc2314..f80ac7558cbe 100644
>>>> --- a/tools/libs/store/xs.c
>>>> +++ b/tools/libs/store/xs.c
>>>> @@ -563,6 +563,95 @@ static void *read_reply(
>>>>        return body;
>>>>    }
>>>>    +/*
>>>> + * Update an iov/nr pair after an incomplete writev()/sendmsg().
>>>> + *
>>>> + * Awkwardly, nr has different widths and signs between writev() and
>>>> + * sendmsg(), so we take it and return it by value, rather than by
>>>> pointer.
>>>> + */
>>>> +static size_t update_iov(struct iovec **p_iov, size_t nr, size_t res)
>>>> +{
>>>> +    struct iovec *iov = *p_iov;
>>>> +
>>>> +        /* Skip fully complete elements, including empty elements. */
>>>> +        while (nr && res >= iov->iov_len) {
>>>> +                res -= iov->iov_len;
>>>> +                nr--;
>>>> +                iov++;
>>>> +        }
>>>> +
>>>> +        /* Partial element, adjust base/len. */
>>>> +        if (res) {
>>>> +                iov->iov_len  -= res;
>>>> +                iov->iov_base += res;
>>>> +        }
>>>> +
>>>> +        *p_iov = iov;
>>>> +
>>>> +    return nr;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Wrapper around sendmsg() to resubmit on EINTR or short write.
>>>> Returns
>>>> + * @true if all data was transmitted, or @false with errno for an
>>>> error.
>>>> + * Note: May alter @iov in place on resubmit.
>>>> + */
>>>> +static bool sendmsg_exact(int fd, struct iovec *iov, unsigned int nr)
>>>> +{
>>>> +    struct msghdr hdr = {
>>>> +        .msg_iov = iov,
>>>> +        .msg_iovlen = nr,
>>>> +    };
>>>> +
>>>> +    /* Sanity check first element isn't empty */
>>>> +    assert(iov->iov_len == sizeof(struct xsd_sockmsg));
>>>
>>> Can you please move this assert() into write_request(), avoiding to have
>>> 2 copies of it?
>>
>> It was more relevant before update_iov() was split out.
>>
>> But, there's exactly the same assertion in the write_request()'s caller,
>> so I'd prefer to simply drop it if that's ok?
>>
>> The writev()/sendmsg() won't malfunction if the first element is 0, and
>> update_iov() will now cope too, so I don't think it's necessary.
> 
> Fine with me.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Looks like xs_write_all() is now unused internally, but it's an exposed 
library function.  I guess it can just be kept instead of bumping the 
library version.

Regards,
Jason

