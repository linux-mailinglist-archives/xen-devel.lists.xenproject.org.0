Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A36A3EED3C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 15:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167857.306449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFz2B-0002GB-NI; Tue, 17 Aug 2021 13:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167857.306449; Tue, 17 Aug 2021 13:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFz2B-0002E4-JZ; Tue, 17 Aug 2021 13:21:39 +0000
Received: by outflank-mailman (input) for mailman id 167857;
 Tue, 17 Aug 2021 13:21:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFz2A-0002Dy-Lx
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 13:21:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf95b349-de9a-4e92-8abe-ca09a225b01c;
 Tue, 17 Aug 2021 13:21:37 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-baFtpUYCM8G8VZFHsb9dBw-1; Tue, 17 Aug 2021 15:21:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Tue, 17 Aug
 2021 13:21:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 13:21:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0009.eurprd09.prod.outlook.com (2603:10a6:102:b7::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Tue, 17 Aug 2021 13:21:33 +0000
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
X-Inumbo-ID: bf95b349-de9a-4e92-8abe-ca09a225b01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629206496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MX5G3Cv1nz/cWB91VAXY3IUlaFculdx0ZOj4SdSbCYE=;
	b=HrEXGHNy6mforMvdgs+A4rDXkkOWIcAJw0GK7I65vO7Oq0A7m3SThTEXeRz5P51Am7F7MX
	Q+EGCe/rML2orLR8uLLExqtEFse4Z1C20iLFWGl4rb7ECDNPAkwjlKI8eaS7xWNg2XoRGM
	L2E2Y7z+rYNFMeubao+WL0Kc+dPR/L0=
X-MC-Unique: baFtpUYCM8G8VZFHsb9dBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHMXNN+qoIiKrVK3qczZSeoGWUlSWaQXdVtzFmVe6uEYEFkXlXVSUSOK3gvVdJZF6ArBqGH0K1YjOMKxk0L4XeyFccqpYVmGKR8Bjd4x58LPisRjujkQJV5460FvtP7BZ6Fi6UxAeKk5wmpUVl+bcFr7vpkeEqUj+YgbYspM780iwZkJ0jNAClkLJ8Go9gSYEf09HvD28dYJ0AkaiELOd+ffkrdK6Qmlso/Kh1qUudwfvQqifdHi6gh0vfJ06dTbtOefpL7MFUWdovF6SKewkcQQzP8piEt3CcVMqsQrRDzE+9DhIMk7Ut92XXjuIQyW1wBH8K/LyE/iDo4RkhY1DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MX5G3Cv1nz/cWB91VAXY3IUlaFculdx0ZOj4SdSbCYE=;
 b=SSfwKkv2FAwg67NLAjl91vk496a9Mwdn2LQhdTxHighfaXGGQi/LzsxTp/e4g/c8m8Zf3XEODTtaD5Bs4Gn8W4x52dlbwosLSWOZH3FuWLDFvcjsDsi8MiVbbEZ/GOFbUu92J3g50chYtwuiwdKnePSO8x01m1/x5nk3dhge+mqU0sgYiN2zX10PfGGfYXCfcb9EUSGFl00ihJGH1Os/Q6j0+ZdfUnIophUbpBzUXxi/BH+HB9DQ9Oo+AYeLc3Qq9ZbgSQjx03aHsm9jC0oQHr83zUcFdAHoc9i611HFbOqP/2OaTQV4r3/0AEOcpEy3QhRCr+6pMsAJo8IE/peNPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: invisiblethingslab.com; dkim=none (message not signed)
 header.d=none;invisiblethingslab.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: S3 resume issue in xstate_init
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <YRsQArpQcpLB/Q5h@mail-itl> <YRuXNmpT+03aPo+p@mail-itl>
 <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com> <YRuhFWLrplRRV6t+@mail-itl>
 <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
 <78eb61ad-45ba-51f0-a5ba-624408d60cc8@citrix.com>
 <a704d6c5-c818-e47b-32b6-f57b2d9670f5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96fe5a22-d1d2-1e74-313a-c5377e9899d1@suse.com>
Date: Tue, 17 Aug 2021 15:21:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a704d6c5-c818-e47b-32b6-f57b2d9670f5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0009.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3291d0a-7fdf-448f-6466-08d96181ef24
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB702483CBC0D6984C0F423F61B3FE9@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ToUiAoJ2+KFZJq4VQIuRW4vr1Dv6i3KyzOhdhphJM/qO10U1N+uH/M8NjhwIjyf56UwIEeN3Zgn+j4XfRczFPP3OJ1FuS0K9E7Ht8EoHsImZv+gnW33GMLAi6x9ZUR3kgIo5EK4EmwoU+4g4zQc33CbF4n0vbnFZfh+UDM23YWKRNAt/EWo1WJ12lOuOMRTarun97E7LbZDxvs+r+GFBglZc8+cRESOcVfWWnlDG4ajB/yJwnF+Y0YMjJqkSGIUk6xGYUfbySaxxQ5kASeRDbNU0LcOzMe677OICCpJt+wPCF2UNlW0f60p0IjmbVciqjRiXCr7JhhWbN2bxLIMoSJwRc3RA1Of4c9H0B/iKp8MrA/+AmpJ/yBUA+fMtiMRfhDxKB+TONq7DLGK3dpOE9JtDhSU/xMbiL/7Gqmoj0mW6arBmyf1yvqo1r0+PVJK8+c4SbyIP/N6RfSMkfdMSIUEjBCArMatznMheDlsjD4Sy6OiiK5ReemD/1PseWyE4orQf0YCpaGBC75fhWCPY5jtbEYhER10O5VgiA/B7Of3s5VXk84NHxUe6cSvTKwIV13qOC6yg/+8GN9OmrVwxOGU+hzwJinIinvWYXmQOmi0gbUAQjBmh+/azi0+b2No/ofyT82xzygzHKB6FgQVZ3x9Tu/0NQ8zIgcuiL/poUJjkLtzCCQJML63umsULD2fWylSApc2g7jo5/x0oNJDrXKQ3vvBf2C0qkOsBHXtITXI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39850400004)(366004)(136003)(376002)(16576012)(316002)(54906003)(4326008)(31696002)(6916009)(66476007)(66556008)(6486002)(26005)(5660300002)(53546011)(2906002)(2616005)(956004)(38100700002)(66946007)(36756003)(8936002)(478600001)(8676002)(186003)(31686004)(83380400001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDl1Q3BNejMyV3lEZ0pNTExXUVdaVkJ0UTlYNEVJRTc3RDI2ZE13R1VUWUZ6?=
 =?utf-8?B?WVNqL1dsZVpCNVZrMk5pM0U1UUNzM0hEemwzZ0c3dnhvSHI2SzZXYmQ2NWxP?=
 =?utf-8?B?MmVGT2p3MGhLMWdDclJPOG5DZVA4cGNKUkNBMmJJZnVFWXQ0NGRyTUd4dlo0?=
 =?utf-8?B?QU5QdENBZWpsUnVWQmtnWWlTYzdGZW1DSVhpZ3Q0bVhKckU1Z0ZvSkM1T2lz?=
 =?utf-8?B?YlcycHVUb3pJWjM4bWtBYWhwOUNhSit1STNTSkZRMnlIV2lXbFBCMTJPbUM4?=
 =?utf-8?B?QVpmczFWWDZ6TEN5S00zemxtbmtmUUZQSFdzTzd0SG9qSmJlZUdyRnY4dGQ1?=
 =?utf-8?B?RGxvdmdybHU5VSt6aUdtRHNaUlRRd0EwSHBGTHFHRTQwdHJhZ2pVV09Xb1Fa?=
 =?utf-8?B?Y0cxS3RZeFBKaC9WNXBYTU9QQmI0VnZjRlpCWUhDQzJBMU1SV3k0ajg0V29j?=
 =?utf-8?B?eVdLVnFWbFYxc1NQLzZabHI3QjA3b3VVNGNLRXM0ZlBxTWdxN2FFaVA0Um1o?=
 =?utf-8?B?dUFCd1Z3WHlnK3AzYUxaY1NQd1UrdlRTcnI5a0hHZkxlNFdKS3dnN3V2QVlM?=
 =?utf-8?B?TjBCU3RCaGIyeGIwTkFVZlJkUm5PUGdlVDZQYVZKdFIwTEw1eEdJRGoxWTBy?=
 =?utf-8?B?cHpKTmwva0RhaWNrdnBsUFpZUWJxUmE5RkhpdUF4ZlFJY3BES1loYVFhamJw?=
 =?utf-8?B?R0phVFludldsTGEyQXlvbkZudnlBSzBvWkxKQjRHSGVOSTVWeXp2OEc2TFhx?=
 =?utf-8?B?OTI2Rlc3eXN5NnpVaUprL2xoU2E5ZkYvSEhxbVM4SEtmTm1xeTRqQmt2YzRa?=
 =?utf-8?B?azVzY0lTTkJKdjg0cGYvelIvSEErbEFncUxObHByOVdxQ0lmZFJTeklVcDcv?=
 =?utf-8?B?bXNKSExXRUNORWp3R1k3d3RFRXl4NTVZWjVLMjRXTFo4Szk0M0gzS0x2djhD?=
 =?utf-8?B?S0xCUkJuUG9pL3dUeFljWFdBczNBejB3UmdLc1pna05SNkhESS91c3FFd1JI?=
 =?utf-8?B?M2t3UW92QUc1NHBnS3NIUFRNM2t5NHgwSUY2MlJTRElRUnFWRVZVOEVaLzRU?=
 =?utf-8?B?M2IxU24rUkZFL3U2ZjROM0I5K1ovYktYZ2RnVkdhWEFVVzVVTWNtM2lJdEdB?=
 =?utf-8?B?SzVjT3hlT2Q4OFUrd2NPRDZMZE4rVFRuOU43blIzdldibUQ3UUt1Z0NGemxK?=
 =?utf-8?B?cWNwV3Nxcnd2SEVJREhwbis5RW5MZ1hXQUhUVnpTekMvZ0tURUFSdW50bHpl?=
 =?utf-8?B?VEswbkVsWkNtZkpsVWE1TlJXbitjSDAzWUFxYkJlalpnblBaTWpiODZoSGFG?=
 =?utf-8?B?VlAzeWpxSlgrWkVFZWhvZE9pK3ZEVVJFZHZEWHVrQkduUkhBSVZlcTdkaUYr?=
 =?utf-8?B?L21lNnJQbXAzeUE2R3pxSjRrOWx5S2hZbEU0RTZKZ0pHa29mL2UwQXd0N21u?=
 =?utf-8?B?RjZOZFhMbHdsM3lxU0sxWHBRMVczMk9lTkFLcDRYbmQrR2Mzd3dOQ3dHWmh5?=
 =?utf-8?B?bkhOOG1ibVV5NjVRZ2tvSHArblVOQ3JhUjFHN2RFbmdvOFB3UTNjY0wwRmc0?=
 =?utf-8?B?N05pSjZSSHB2dy9WSkVNNzVaWjIwSkZxYkcrRW9XYVZVbEphd3FOYlZCbSty?=
 =?utf-8?B?RmY2cnVHQUZ5Y2w0Y2RBalJpV0wwZ3EveEwrdmVNODkwazJjUXNOeU11WGht?=
 =?utf-8?B?NHZwci9DcEdIVzVQSGdhbHRkMGEwY1ZsNmxRNG10WjJrOXJIWTJZTWtBMmhs?=
 =?utf-8?Q?nLDAAkFx1DddQpTT9QlUvLQZnW0Kl8H3q07pdZp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3291d0a-7fdf-448f-6466-08d96181ef24
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 13:21:34.1550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m10dvNMT0hzjlYzD+XliEv2lbR7YqIN/7VmGvTRrz+7WgPXFQMkCvGx9xVUViJO+xw/owHVZVWnJoiGh2mYCQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 17.08.2021 15:06, Andrew Cooper wrote:
> On 17/08/2021 13:53, Andrew Cooper wrote:
>> On 17/08/2021 13:21, Jan Beulich wrote:
>>> I'm kind of guessing that set_xcr0() mistakenly skips the actual XCR0
>>> write, due to the cached value matching the to-be-written one, yet
>>> the cache having gone stale across S3.
>> This is a rats nest, and area for concern, but ...
>>
>>>  I think this is to be expected
>>> for previously parked CPUs, as those don't have their per-CPU data
>>> de-allocated (and hence also not re-setup, and thus also not starting
>>> out as zero).
>> ... we don't deallocate regular APs either, so I don't see why the smt=
>> setting would make a difference in this case.
>>
>> To be clear - I think your guess about set_xcr0() skipping the write is
>> correct, because 0x240 is correct for xcr0=X87, but I don't see why smt=
>> makes a difference.

Right - as per my later reply to Marek I don't see an immediate reason
anymore either. I could see an indirect reason via different scheduler
decisions, affecting what ran last on the respective CPUs.

>>>  I guess an easy fix would be to write 0 to
>>> this_cpu(xcr0) directly early in xstate_init(), maybe in an "else"
>>> to the early "if ( bsp )".
>>>
>>> I'm not sure though this would be a good fix longer term, as there
>>> might easily be other similar issues elsewhere. IOW we may need to
>>> see whether per-CPU data initialization wouldn't want changing.
>> We've got other registers too, like MSR_TSC_AUX, but I don't think we
>> want to be doing anything as drastic as changing how the initialisation
>> works.
>>
>> The S3 path needs to explicitly write every register we do lazy context
>> switching of.
> 
> Actually no - that's a dumb suggestion because the APs don't know
> better, and we don't want for_each_cpu() loops running from the BSP.
> 
> Perhaps we want the cpu_down() logic to explicitly invalidate their
> lazily cached values?

I'd rather do this on the cpu_up() path (no point clobbering what may
get further clobbered, and then perhaps not to a value of our liking),
yet then we can really avoid doing this from a notifier and instead do
it early enough in xstate_init() (taking care of XSS at the same time).

Jan


