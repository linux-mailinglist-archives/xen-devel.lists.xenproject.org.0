Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB6A58AAEF
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 14:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381134.615678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwb4-0002RQ-TY; Fri, 05 Aug 2022 12:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381134.615678; Fri, 05 Aug 2022 12:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwb4-0002Ol-Qm; Fri, 05 Aug 2022 12:38:34 +0000
Received: by outflank-mailman (input) for mailman id 381134;
 Fri, 05 Aug 2022 12:38:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJwb3-0002Of-7U
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 12:38:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60059.outbound.protection.outlook.com [40.107.6.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83455438-14bb-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 14:38:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6546.eurprd04.prod.outlook.com (2603:10a6:208:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 12:38:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 12:38:28 +0000
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
X-Inumbo-ID: 83455438-14bb-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK+PNWlStbaulS5P5WfkAM9iNGp/aW/zYkMg7idG376HCPWyhb0i/vaYTC2WXhY1DR2abv5PFgHH/vP78vLdDhF5qRj2M47pIQK5di81nZyFlprwIOU2/1xq29tFUFhh6z5TMQrZfxrGJQQgeekIRBIlXIMJ65RLHMJhtFbB2KGT9UyphevQuA9RtCAF4iJE49UsriEhpbgliHtVZzo6LnOzQO1ollOJ8lBwdOB3SsxXoVuP36kgbvS1Lu11+KVHmuaEbylzzFpqXYtI32RsMoNCgMqlbhVgiVhgTo0D/sSskHIH8+SahqM7lQJ/39W3VoU9ydnSs0ijRd3dAW0tSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii8XkMyPcAtw/F2gScSdDNe2Hasbr7ZwKHZvBWFlevk=;
 b=DcrywsV/Cjyh07cN2StRd8WXqIYMSim+lzAWuSkVth/C/So9I0HDbU+paXkUFD2DwGCGqB8aLAopavs66Y5oSN7phU8qv6m00hysCtyrT9vKOg0pFhJBKBXf/nFufaX0Hwjfv/4FsoC/BPHipGHYQ0qY6autcHR7ZvzMcT5XZb3xl10YZaJPRgvL1ntcvIxo5V+0NZ0jWZv4F0MLk4BA4drdY3taEHHVe9DBL4hfIwyinhiDkwVG0s5tuNYpgInOQ+nqxoe9y6B1EJTuxC1JjyxsT9ySM/vCZY50RUtLrP8WzvGuSHAr49+l5qX6js/Dt57bDyB5d5n4FBpzZv2aTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ii8XkMyPcAtw/F2gScSdDNe2Hasbr7ZwKHZvBWFlevk=;
 b=rSLeWsyagQ2FwTolkwRFvySwsrePRi7HngETjqW6WZq3u/O8V4vxHdSaogI5Emt2qp52T5iSKZRO43RfrZulsNl5G8rr6Ls05af/fsyOJ+RfauryJu+N71Iyz+8B/tgAlzZPgkiFj3aomXUWVbuv0TN7Xyc1qYneY7dMnrJ1LXajDhSmYq8qOJAXVnRq+rWLK7LAfC+GW2ODe0rm/jr5/vsF+9L+/DCGx1c2mZXhhTl2o0roKXRmhpOPu3R6EKzhIQM5GrWzLrjmCpi7h/h3W2oLw3s9kyX66D4A/j9DPd5iuw2Gn0q1qx6yneBRcrIhaPONPT9LwA5oF3Pgpgn7jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <65f4ef5d-a174-2d23-3ed6-1c80e5f6244a@suse.com>
Date: Fri, 5 Aug 2022 14:38:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 10/10] driver/char: add RX support to the XHCI driver
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e273efdbf75cbc37b5c35798da7fde34877ac3b8.1658804819.git-series.marmarek@invisiblethingslab.com>
 <7d263ceb-3727-763b-0b9b-3b9ed82aa780@suse.com> <YuzpuUz5g+HtJdzy@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YuzpuUz5g+HtJdzy@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0091.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::32) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f9a4aa8-ea51-408d-8f2a-08da76df65fc
X-MS-TrafficTypeDiagnostic: AM0PR04MB6546:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VpQS4sQcJruAUoWHwessk0bqbtpfMENCvX5xGnvaXZYVPfsjwcb3Z+6sTy5PewDkaaf6CO+XKW3ie6EVPaA3Ro5SoqwcagncOmTfeVQ7oIFUDoYnTDe07HdYULSwCN29zIIoNAFrGFk3Ort+pZmkhFKCANdeakswtt6jZj0GIVZF9+lV6i3qzTsBRqFbj1EZ9O6oq7+fgiWbQaighLRMZsmDqTkMD3KustPk0waMi2H5Pw3O5ezCQ5ODRA8NALCFMdcNlHrf9GFgSYPpa7RrY2Su2ZQ3emu7YykunV3vXsMzjKIBm3equ6varHmCWG9z5+XvrALtQFXUYgWZnbeSVPyX5FId9MKKJY8RR+1NZhLZOLRQ0n3mTrz8EZ8ExA8pnwhnplNFJVa3dz20C+73WBl9YIfNNTrX1qbNLhQGtOPRd8ZcAp+VpiBQ5D0/PZs2BpGtva/RA9SN1+gqlEeRDcfFt+HEiX8JvksWNA+3chY+L/4ZtRr98rxQ8kmCAjwCVpiKl1Al5XBVJno9vbjn1s0S8Zq7ctrRmTijiilHd4oeZw7NuGh4lP3+OXPhUOWGx2uUwaQNi0PxRj372RwlOCgeNcBSkXfv71/5OqnJMHYwgG8hPx5WX39WG9qaYsYdqS2U4Lyn0qNkb4URm6Kubt90ZS6k+TBXj8FoKP55Vn+G4n0LnA/gFxoz8m6wqKHY3oEmaykHsPr0D5U/UQBvGHOTm0FbgwZcRk3HZs8H/UORdrkzeL6ao7shVdZIa7Snb5Mb+IocRIOcWfDcSWWZchzXm7+34vKrpFscsEbpYHSwKrM3VBCo06gqzbm2HJZ+Cgrav5HfFeiHJ0SHCcm7Lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(396003)(376002)(366004)(346002)(31686004)(6512007)(54906003)(186003)(6916009)(36756003)(2616005)(66574015)(26005)(38100700002)(316002)(8676002)(6486002)(478600001)(53546011)(86362001)(41300700001)(2906002)(8936002)(5660300002)(66476007)(4326008)(31696002)(6506007)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmhZS1Z3TFd2M01CRnlLTkNFOWRWTnAwWXFXd0VEdzAxeXhWSzBFNTdOOFBm?=
 =?utf-8?B?eFpMeGZURWcxNnREc01adXR6Q0ViYjdQTkhkS3diQ0RLdnJaTEVBNEh1c1VW?=
 =?utf-8?B?QkI5aVB6RDZMTEVBQTVhYURvUnpkY2hxeklWai9NVUZUcDdwNnBWS1h3S25z?=
 =?utf-8?B?U3I5SklVK3JLS3dWZDFwUFY4YUN0Zkx5QUFua0p0MWJkcWtHRnNXR2k5WUgz?=
 =?utf-8?B?R0lLMWk3eExyWEg0M05ucEh0US9SdjJsNUlXQVoxbVRRbUpkK3lBRTdUYU5k?=
 =?utf-8?B?Wnppa3FrK3dpR2dVWWYrc3kzSzBMTzJNVjF6bEpqbHBwZVhvVHB2ZWVRcjJ1?=
 =?utf-8?B?cTM2OG13cW00anJBcEJjZHp5KzNyNldWUVhaU0hqQ01JR25Rd2FIQU4wbFZZ?=
 =?utf-8?B?azNZdFdCa3hUcGFWaGkyakF1S2xkSlI3WEgrYll1bERrZXlnemNpcUM0Q2E0?=
 =?utf-8?B?UUNQb2tGRVRJMWd2NlRIbGZ1R0JVb0VXZ09KWHFOSmhLZDZpR0xYWWE5Y3dE?=
 =?utf-8?B?dGVXbmtJVERVRzVBYVlYcWd2R3BYQ3JnbWxFOGlud2hQRXI3R21DWnQ3VnY0?=
 =?utf-8?B?MjlTS2oyTFJ2T3pLSSswUU45clFrS050dFVFMXVhcWhvbEZ5elQ4S1pSQm9K?=
 =?utf-8?B?RGdIc1ZpYVBWcVZGcXdzQ2crMy9NV3pYODRkaldsNEcyckxBS0xpaUVFaUti?=
 =?utf-8?B?RlRGUEY0RzNRRHRwMjZialRZbFVnT0hia1JJTWRObDlmRGZWSTlBcXRITkhJ?=
 =?utf-8?B?ZUVGNHNlZHBBVG5PY3Jja0R4K0R0cWYrTG1tRFNHS0tmQ3pUalByWFdMSkxM?=
 =?utf-8?B?d0VvWldCZUU2QkxQMHZza1lzOGhweXg1a0FUQ2QzZHE0alpBQm43N3k2dWIv?=
 =?utf-8?B?WTJSdEc2MU56enZJZjhWZ3lMdytjdzBMZ0VtVWM0UzRoMVJzUVBVZW1WbER4?=
 =?utf-8?B?MkdMOG9GeXZENmNUOEEwdDgzWTFPZU9xaDJaTGd5RkIxZGc5K0F3VXBDZEo1?=
 =?utf-8?B?RkJlV2FNN1dOa1VYZVI1OGpwVis5aVRhMDZ0b0NVSWJSSFdwWXNybk8ybTBX?=
 =?utf-8?B?eGNaOEVIZWJHV0tETHBYUjN3MUx4cUcwQ2c3RzQxeTVhd2hyOStFRHI4cUMv?=
 =?utf-8?B?MXRWbTg4SDFKeDMraloxRXZhdDMvdlJtTTlwZVN2VG9VaWhCUEVBVVBGZ2Nm?=
 =?utf-8?B?WVdDRTdkdHB2dkNYTjNZWW0wYXlVR1JBMThyZWg4Zld2OXpWLytpMWZIK0pw?=
 =?utf-8?B?OTFZNHFoNnhBRGV1YnFiTmd4b2F2SHhHWE13dk9teWRHMTFPSkF3NEJ5UzFQ?=
 =?utf-8?B?U290dE51RXJ4dDFGN0N5QitZVnJZbzRHMVFNUi9YM1pEalhjVktKZC84eHFl?=
 =?utf-8?B?alkrTEpmRGxRald6bkcrbThBMFQ3dVpNc1BMMy85TW9HQ2hzY3ZYSFNJNXM4?=
 =?utf-8?B?cWM2VEhIbjdEa3ZjVnhqbWk2V2VIYmtsVEJ3SWlya2hENDk3WHFISXMvdy9N?=
 =?utf-8?B?bEZBRDdKb0ZlVVNGMEIwYWZPNGlsUEoyQmdEQVNCcmVDTVlUNnkvZEVhc01F?=
 =?utf-8?B?czZXanZiUjVZajR3c296MTdZaXdwWXZrWnRjM0htTm9MdHlTeWVsNmtoZ2hz?=
 =?utf-8?B?RmRqVmwyK1ZwVUlFMkt6b0N3UXY2YUUxL3lGWlFVWFVRc0ZvNERlRmtmYVVa?=
 =?utf-8?B?VHlSRnRtMURsS3pKbFVyTm1iM1dTRWFocFhmWHBiVXhPQ1d1Y21DSHhtUUJk?=
 =?utf-8?B?U3hXWFVGbEs0N2ZTVnc0cE5QZVFMa1NTNzNyYThwaDAxMVRnSE9CWjNaQkxV?=
 =?utf-8?B?Skx2TGVJU0E4NUJsTzZ1Wm9LbnhkU29kT0V5djNOeTIwa1ZuQWVONHJSZUdv?=
 =?utf-8?B?TGk3SWNCQ1o3SUQwbS94RXJReW5CcWYxZzV5eExCMUo2eFdZNWRuczYvNVZn?=
 =?utf-8?B?SzFzelhjQjk4c1dNbkQzV2tPaFZRbDBDOGlBZFkwTktqTmk5MzVhR0ZNcTJh?=
 =?utf-8?B?aThMRGg3YzlxL2xRYU13dWxvcDdsLzdRb3ZNdzdWZEVidndQS1ZKbGtwbXdQ?=
 =?utf-8?B?dWlLc090aWJGRHg5d3RJZnlXdWNKdmdOR09SSzg2SGZ0NEx3c0tCSUp4OFdw?=
 =?utf-8?Q?enJjzY1x7LZLT5IusPen/29Iq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9a4aa8-ea51-408d-8f2a-08da76df65fc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 12:38:28.8587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdV/UEPJUughtjlib/A6so8Fz5dc4vIcwrDNZitqv8F0KdVCOmgSyz7KfEKVAh7eUg78FrP2Ln4wqeNQt+s9vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6546

On 05.08.2022 11:58, Marek Marczykowski-Górecki wrote:
> On Fri, Aug 05, 2022 at 10:38:13AM +0200, Jan Beulich wrote:
>> On 26.07.2022 05:23, Marek Marczykowski-Górecki wrote:
>>> @@ -454,6 +466,12 @@ static uint32_t xhci_trb_tfre_cc(const struct xhci_trb *trb)
>>>      return trb->status >> 24;
>>>  }
>>>  
>>> +/* Amount of data _not_ transferred */
>>> +static uint32_t xhci_trb_tfre_len(const struct xhci_trb *trb)
>>> +{
>>> +    return trb->status & 0x1FFFF;
>>> +}
>>
>> Same as xhci_trb_norm_len()?
> 
> Yes, I was considering to use that, but technically those are different
> packets, only incidentally using the same bits.

I see. That's the problem with using literal numbers rather than #define-s.
But for a driver like this I didn't want to be overly picky, and hence
would have wanted to let you get away without introducing many more.

>>> @@ -985,6 +1054,33 @@ static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
>>>  }
>>>  
>>>  /**
>>> + * Ensure DbC has a pending transfer TRB to receive data into.
>>> + *
>>> + * @param dbc the dbc to flush
>>> + * @param trb the ring for the TRBs to transfer
>>> + * @param wrk the work ring to receive data into
>>> + */
>>> +static void dbc_enqueue_in(struct dbc *dbc, struct xhci_trb_ring *trb,
>>> +                           struct dbc_work_ring *wrk)
>>
>> I can't seem to be able to spot any use of this function - it being
>> static, how do things build for you?
> 
> It's in dbc_uart_poll().

Oh, interesting. This then means that patch 1 on its own doesn't build.

Jan

