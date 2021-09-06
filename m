Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E88401CBA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 16:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179967.326429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFCQ-0006iq-RL; Mon, 06 Sep 2021 14:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179967.326429; Mon, 06 Sep 2021 14:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFCQ-0006gi-Ni; Mon, 06 Sep 2021 14:02:14 +0000
Received: by outflank-mailman (input) for mailman id 179967;
 Mon, 06 Sep 2021 14:02:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNFCP-0006gZ-33
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 14:02:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78630ac1-b7f9-430c-9a05-e82bf196302a;
 Mon, 06 Sep 2021 14:02:12 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-Eyatc_WFNDCP8D4IV-zIgw-1; Mon, 06 Sep 2021 16:02:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 14:02:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 14:02:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0501CA0060.eurprd05.prod.outlook.com (2603:10a6:200:68::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Mon, 6 Sep 2021 14:02:07 +0000
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
X-Inumbo-ID: 78630ac1-b7f9-430c-9a05-e82bf196302a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630936931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKa39fBdUuKKjVZJgUwDa3lk0XUVFaHOI2TGt9dFD3s=;
	b=VYuYQG0BsbzWN+jyxdREgeQYRyjpGkkYHbqVYnG6qOIC2anAQKSL8wgN5q7Un5M7QdHm4o
	IeYrTq4Sn83KvBwahHb2fAq7zEsSdzTw1fS3jk31K91V9dJjt0kNf24UjeMN4BlnI/fD5u
	1z2IIhpAvUeUZxOo4v57M+eWxkrYLkg=
X-MC-Unique: Eyatc_WFNDCP8D4IV-zIgw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBbCop4iwZ/1vJQhPYwnF0RG0nIBJNsg+txUdd9x4e6zVBL6fCgspB9H6NgnFDmYmFQUhKy4CalZLwo3ZmTC7WbE2N1g9e/+tpi8wQLSCMIfb4F1g9CezJCozlIH1zxblftsIKAi4rTBanZhOCTjoqz6h/bkDjithrqfWKWFeC+0Te4NHV4LnDJT9dgAiM0RkAPBbv6itR4MYBYM/z4tOUjYKT6B6vHeuy0YZCPhtPBZghRHw/wQWlWvng8upywK7g79AyUP+hfwtRM9Fsf1Tae8LxluumwgRvi7/+KtK0Wu3OU7QhW89r2RwBfjCaORy9+vNjN/byZnDh2wgTPZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cKa39fBdUuKKjVZJgUwDa3lk0XUVFaHOI2TGt9dFD3s=;
 b=U0FhI7l3QY6+6kb7R8iCDS4voC/A/nkRC/GyVuCOxQp/j7np6B5piRyZ7pZaD9SmnNJPTBEdw0KT/xOh74I75mMvMGbxinWQoP3tDeRQcekSONcetQq4rWQHwJNjH2aRpxi1INUWYMFoVhPKcyYFsG9SJDMFGCaHzWsIqkkQgTktqnrQr765jtC4S2gwgt9ATb5Wnuqexz8npeddnUKFDRijcGqZ1ZIWy+GX7FTpdtzYdfSn8nwSx48wv3H5hZSStcrIAth8w87Lz5nfXJRn9nAvHlMxV/nq36QOtik0A6cuEUPoAePLwYGMDnNNfuqtCIKqOjbZwYUTLmlEIURxCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/9] gnttab: fold recurring is_iomem_page()
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <06eeea76-adf8-4f40-eced-57db1526eba8@suse.com>
 <cb4f6360-4d80-be4a-e631-553b00b06a29@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5c960a54-7860-2de4-d3c3-0075740a69e8@suse.com>
Date: Mon, 6 Sep 2021 16:02:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <cb4f6360-4d80-be4a-e631-553b00b06a29@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0060.eurprd05.prod.outlook.com
 (2603:10a6:200:68::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88148904-6c42-46c1-acce-08d9713ee9ff
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71505BACE9EAFC12C4AEF277B3D29@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	906ee7+/RJst/2GwNTTyxZy9QjJaRDNHme48ltmvGZigVpShOcbraNUy1O3fvAVj1IKVZtCT3g1Qdu95cETg4BT5CHcPmNKPy5hBJ+AlRhsopb6CAdEk5WWVjfmWWc8zYn39V0sWhTrNsZpOAOLXZhXPjnxnwsdgzP3gTqcGBm8Cxbc/VKHQTRt84fNgs8y7u/jBiGsw94/IbVR80a2Sn6I9c3R4amdhtXv+OzveS17lLtXrjt/dO4d2oI9zuK/A7fAEJvX+cAmFXMfqmrCtzxDCpfPrzM4YQmBE2yXyefdLGbsyEsFLxUYMjaRrizbSAc4F9oqUqQfQiFVgTQR4gR6PJaBX5dbxJf06a/3UaYDjGDKFNvWFkdflt0bJEu8Mw0KA1gfbFT0fY4PPEBPgLPLpPsh3st46rx381Bpw6wdIxeZHitzG2WZhAZCYDv/jQbWIve5gJoUQaWyqFmRkoptOn/Ed0dUzDQZOQrDCpT+lEtCVZuQzRJ+SPS/zsMjx/gxVoSlkC5kHY0XDcsecZSUTuoumTe10EOrj6pgsiqd7UVlLovATrnn3eCGTX14Vw0QfJevwiPrsmarwPymvyaUl7zoIZo3zT20RmtO4MFYc0e5fdKyzWpzVqzVlJoR4okl3rVcCw/wr+fhwSTkwxk9kq8QcE831QMEvmfCZLcsphev6RTmU29VuHR3LK49Mb2J/Z2sNOwhEPwlRGeUzzWp+oRk9fDKYrVXnSBjF/Cw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(136003)(366004)(346002)(54906003)(5660300002)(2616005)(2906002)(956004)(316002)(53546011)(66946007)(6486002)(66476007)(4744005)(8676002)(66556008)(8936002)(38100700002)(86362001)(26005)(6916009)(16576012)(186003)(31686004)(478600001)(4326008)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enRqRDlxTk1hMzRST0l2cHJxdFlhWXlYWFBDakZGWUowbDFITy94ZG1zelhp?=
 =?utf-8?B?dTVxQnVKUDBmVEN6Uk9zOWZlQUdZMEdZcG5HQmpsMzlNUmtOUjZiUm4vYmVk?=
 =?utf-8?B?czhaS2NSS3duYjBEUVRtbnlUWCs4eDNkS1oyV1J1QUNCV012L0ljc3VjMmlN?=
 =?utf-8?B?NjQzV0UyOGJLUVNQZnJ2ZXdDdDZjcmpqZnFkVlI3Z0M0SXFzWFMzOFZUa2xh?=
 =?utf-8?B?bHdrSTBXQXVJazcxZVVXZHlxeWFPbm9hUWE1VFhIL3RWb1JHVi91bC9sSU5F?=
 =?utf-8?B?RDZPN05JVjJ4UlhaMTkvOHQxNHUrWVI0RU02RmtFdllXUWt1RU5aZTQ5UDFR?=
 =?utf-8?B?bUwybU5UenQvcXpOS0pHeTBCS3AvZWp5ejExcEdFRnhyUnFKUnk4RXMrbXlP?=
 =?utf-8?B?WEhIRTJUcTlqRUtUamRKcUt1cURkaGdHUU5JdzFERjlpTHpXZ0NtRFZHVUZN?=
 =?utf-8?B?YXF1ZmJmeFRCY1QxWUtVL1FNVVAxSHQwNnpoUFFLaTBzN1pYYlRCbXV6RDVn?=
 =?utf-8?B?R3FaK2x5cUZscFRWU3JleEVRNUtyVm9YdWcvQnphZGFPZ3JtRTRMdXYvbldq?=
 =?utf-8?B?L3BMQWJoRTd2UUdMNVd5TTdlaC9SQnllY0wwb0VWRWtsOWhnYWw0dXZMSlo0?=
 =?utf-8?B?cDFKRkZ2MWJRZzh1RTdvSHlsdGx6RlhRd2YwVEdRWTM5L3AxMWl6Q2FucE5n?=
 =?utf-8?B?Z2lLYUdsQUFNSXFKbGRRVldVUmFsalRKc3pRVWtnZ29xR0FtdU1CT1NoRzdl?=
 =?utf-8?B?ZmxJZ2djSEpoMWR3YXpuWTYrVmpSN3BvSWtuZ2I0TzhsT2ZLbm5qdEt0b1M4?=
 =?utf-8?B?N09YRGtZbjVKNnZZdUQxT0JicFNmSGNvNmtYSEQ2V2RBbUZVUTMzTEp6TWV3?=
 =?utf-8?B?QzR1ZWJFNHJtOENCOWNxQ2J4RVFLWEtYT0tOc3hlWGxvNkgzNlA4OVk1MW15?=
 =?utf-8?B?Zm9sK3F0ZUpBbW9qTG9qN2JsVU9WVzczRTh4MWVQeC9pZG9mUnYzYUhiY3dZ?=
 =?utf-8?B?VTFWMmdZTDZUelZuYTJSK3AvTlZRaWpTeTFtL3U5Skp4bWh4NDAya3FielZ0?=
 =?utf-8?B?TG91cmlZNHJrUnFXeHVjZVR2a08yczlrM2VCSmtBdU8yQjNISDhsbkdVVk5U?=
 =?utf-8?B?Wjk2bXRUcis4ZWV5ZlltenhrR2h6MGVaYk8rSUEvKzhURFhFUnZyZzNTYWJu?=
 =?utf-8?B?ZHZoNmhrcUt6QnljbUNVdWs4cEhMU3l6SkY2NlFHZTY1czc0UzFwNk13MkhD?=
 =?utf-8?B?cUZPdnBYZk1UT282NGZWQ2hBYU9rblpVSTBHYjRIaVhXSWFUVXd5N2JvaHpY?=
 =?utf-8?B?MC82bUdhV0Z5OFd6SGNlRFFPTUxGVWNlQlFWV2tuVzlaUkRWR000bllQeXBL?=
 =?utf-8?B?VjlJVURzZlpvQkdaN2ZEVGlqdGtvTmxZYVJ2aXdteUFienJUT0NvWVVOdXRD?=
 =?utf-8?B?dHc1ZVVGdlREYVN4cnNGenNkMVRnODlJSUdNMTJ4Z0xjd2NrbjVRZkZldjdY?=
 =?utf-8?B?TzNsS0lVTWo4N09Ha3V3RjNSTWcyT3pTckFtcjNBenpiS3YrNGRaSUt5RFVI?=
 =?utf-8?B?WkF1RzVORm5hSDc2YkorakErdGRkQnZuaURtU0hGNDhWR1Y5dEtWSzdRWkor?=
 =?utf-8?B?U1AycFM5dFlBNFI2MzBhb3lja0VPQlgyQzlBZWlwZ3U0cUtwUFFsb1ZwcXBv?=
 =?utf-8?B?WHlYa2JPYzlBaTlkQjBDTUJhMk9HeS9CWXNjUkFhZlRFRmhxUUpvdElqRHpu?=
 =?utf-8?Q?TtAQiaQZA3C05NtNUwkADiyIWPy/KajbXDF/dOH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88148904-6c42-46c1-acce-08d9713ee9ff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 14:02:07.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42m5QWFXHVwN7qHOwcvb287TO4mTAsGuLYUo9pMGAdzIsoJnI3w3/xZ06T7R5lCZRpDnhiC82D6RGy0/8oR+6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 06.09.2021 15:35, Julien Grall wrote:
> On 26/08/2021 11:12, Jan Beulich wrote:
>> In all cases call the function just once instead of up to four times, at
> 
> extra NIT: It is more like two because there is a else in 
> gnttab_release_mappings() :)

Well, I was viewing things from code gen pov, not so much execution
paths. And of course "two" is not wrongly covered by "up to four" ;-)

>> the same time avoiding to store a dangling pointer in a local variable.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks.

>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
> 
> [...]
> 
> Everything below looks a duplicate. Might be an issue in your tools?

Oops, indeed - some kind of glitch. Odd.

Jan


