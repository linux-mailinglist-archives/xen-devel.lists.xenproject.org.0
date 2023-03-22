Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8366C43BC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 07:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513102.793610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pesRe-0005t6-0R; Wed, 22 Mar 2023 06:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513102.793610; Wed, 22 Mar 2023 06:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pesRd-0005rH-Tt; Wed, 22 Mar 2023 06:59:37 +0000
Received: by outflank-mailman (input) for mailman id 513102;
 Wed, 22 Mar 2023 06:59:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pesRc-0005rB-HG
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 06:59:36 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a328de1-c87f-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 07:59:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9091.eurprd04.prod.outlook.com (2603:10a6:102:229::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 06:59:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 06:59:32 +0000
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
X-Inumbo-ID: 1a328de1-c87f-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAr8rne+VDXuGC9ei52Hw/uY11qhwscAeYNg3VfAFV+ynhzw680GVltxK00D3UsN737M90QomKjAPCkLvwz9K+UQarsX4/YZdSfyqVsf3zwnIH6fRTf5dgqUPRRlic8V5A6MwVW976qL5OH4pMrHAKv+DK6G3TcVygSkaAYSnI7QRWbViKIxfM0tKgLe3cud3Irtr7klCsbEql3y9ONn6PbOz2LEAFleQi0OwVYmPSuSQqWLVzkwzE0uPi84+rqkD5eeyyH8Q3if+z2HrSOwmlQSGVaZWIxlQKA1JuYqYkQ4mtCZ9Mnd3rXybL3rG3Bo6PxqpkbXi+U9z0mJ6lO/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Azqc6YVWAQyr/PmMldzzABVgRpIjCYiYyTdO7M0cbDQ=;
 b=FaYJmGSMVmdV5eDvo7lb6zjQRAZWrB1Fml8aNZn7Cfpno/U6fs9gGPuYTNiyx4ImifrWFb88kbHhxVgSgmpHESzsRkUf9OBD7uE997nrdLu7Cy5P4xdzkqH6AK+S29by2xzreIZI47+i1WKCccvuitzVqMVo7+TnsZ9tzHQ4OGh+ZLdwiMJsfc6YXLVTDCvtfL+tFaQK+x+nKBq9G4UkXAheWYTYUNny2FoWnhT8XHo1aOZ7sZiJxZX2FVITmYKr58QvcQI6cGEu0Q5PQS5UOqlZ96N/HoMg1I32CzjesmKyZ5SYxyFK0NcwniVu3olZz1+nWlE+yDWjOmt3jKLUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Azqc6YVWAQyr/PmMldzzABVgRpIjCYiYyTdO7M0cbDQ=;
 b=Vb0jNZUPU7aoYxUK4usPaxwFNxV70BphZbwzyCY1KzW+JKHeyUMduQgqpiDZzvopY43iefj9Ij2KNw70zvzZVswm0b9ynnyri2Ks1nLj57a/zYTE3DOqcoM//ClHsBLWbF/d4rg4cKItI1EIjQ2iD5GJ++v9Hx2Ri6mvGXeJaXqgspNqKmpUd7u+udnrUWq0/NmPsk9VSvB6lLG2aMFGf8UZdDkbhEeYln4qrlqQ/Twizx9IQF6s/Uih3uoMon1SGWq+WqiKbl2yaVrd2ToaDBrldH+UGtz4bDs7BkpsXloeCADGVScHl8MK4vSgkoujY8X/D9psTUnkqexAtrFJpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <205658ff-e0ac-1656-2d12-099abd891fcd@suse.com>
Date: Wed, 22 Mar 2023 07:59:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN v4 07/11] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-8-ayan.kumar.halder@amd.com>
 <7d90ad7a-5daf-915c-2055-a27ca50d8581@suse.com>
 <e268e11b-8e93-c506-668b-c5c004b3aa06@amd.com>
 <1883c9a3-ad25-ac45-b1fa-d29e19b3cc14@suse.com>
 <01a800a5-1c0d-b9d4-05c7-c886b3e3009d@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <01a800a5-1c0d-b9d4-05c7-c886b3e3009d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9091:EE_
X-MS-Office365-Filtering-Correlation-Id: 961f7442-c7eb-4e07-59d9-08db2aa2fcf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ka5WznXt7B0KkoZNKb4jN6Btj8Tq4X0dfX2VjX5QLEohbhagTT4XvJ61Uz9zNyc9zw4PgpeHsEnU/CEv39nB7QrsGNeM6//B5XJemQJRvaokV5dh0vGbbjN4HG71RHLFqGtZa66OWy8P5JE+8FfzyAjdYHdmAAZTYsTR2JZnbHDCxvyLwVuyHPvHfn4gOdjJtt0reHfoNjj3uUOhDsfmwnw+jRzD1kyqMELC5q6JviGALDqXIpKyTZPzXTH9jFaGHm0SwWnc/D79PLTXv3f9UjteoaeJj/1sJ1mSEagXCh5/ZFUqVu2uARGorI+jdIKfSvmvJpOKPj7Hxy7BwFbHvTj3qbQokw52b0Wcj6wjXcSjnDX6vQaHiywVeem2J1qAAODqgfqk07YK0pWigg+ufajU1MaLFBxnSW/eD+l3DVdrtAOOFG+RRwIezSt+TCXOm5ysjNSwF8zgVgP2FWV3XPaEs0XNlVVPOXoegsGtDJFhgBkLUOkHBEbCimgXs/vKp3zK/+Q/zumuJpBXw+fJfA2T0PKW8iedyJ0zvLNcMj4eGcTDhiT7TjU2lrO+ryyauqS+JVvuf9t53pbirnIqm/K6piJuuDoU9v4Lu/s4uSKqNpUxGkIfMfgDdOclYVXLfVp4ee2fRsLj93wIgTkV+l/PD+qQsYKsSkaEW0i5wfARRkstQCSi5haezov1r3/erumxbZdmA8IfrOAbMvpNtoulYFRRx8XqVZ8Tlk+semsOYb1vXUNKg6Hw+zfxyg5H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199018)(2616005)(66476007)(6486002)(186003)(966005)(4326008)(478600001)(83380400001)(6666004)(316002)(26005)(110136005)(66556008)(66946007)(8676002)(31686004)(53546011)(6506007)(6512007)(41300700001)(5660300002)(7416002)(38100700002)(2906002)(36756003)(31696002)(86362001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anJCbU1ZcytjSUllaEhRc1UwcUhzMWFHU3dKWFlZY213dmNaSmtUR1RxWitR?=
 =?utf-8?B?VFVEdXQ4YUd6ZDV1b2VOWHh1TnZUeWZXczI1WWJCSml2SVkwMnlvdG1HUXpY?=
 =?utf-8?B?d0MyUnFkaFRzZC91bnl5Y2Y0aVNCTm1xdjFNZkRiMUFNMXU2K3lTT3ppKzVR?=
 =?utf-8?B?VGgxYlBxOTh5Sk5FaWRpMGdEa0NUYkxiSXJRM2NYVzlxUmEzRGlrK2RMcEdn?=
 =?utf-8?B?U0laUE1RVjV1T0cvYWhkeENiTUMzT3R2VHJLVnFFM0NBVzlFT2RTZDBSc0ts?=
 =?utf-8?B?aHZnOGluTnBKZngxcEVWem53b3R5SmVsdW9PVWhRRCszV3NHLzdFMzBVbXBK?=
 =?utf-8?B?MnNhY0tOVXBpRzVIT1BTbFBRRlQ4WHJhVGQwaXlSaDRVbjhjRUdiOXF6cjNh?=
 =?utf-8?B?SDJmQ0NMS21BYkdJcVB6ZWpTNnJkN3BnNXZoaGE0ZFFDcUpQZWFWS0Fmd0Rv?=
 =?utf-8?B?NVI3dEFwLy8vb1JqOWhwN0h0YkZSWW5yRkcxWEJuUlhiTk9MTlNZWDExMGxU?=
 =?utf-8?B?WGwrSFhtWFFFRUFxcjEyZVZpemhNK3NyREN5VFhDQ1lUd245U2JmTVpRbkhY?=
 =?utf-8?B?MU9uZVNSdG0wNmNMVVFJU2thSTI1WlFFRXJZcDcxUkdaSlArL1I4NjZzNmJ3?=
 =?utf-8?B?aGhyZ09YUkh4K3pERDB0OTJIZC9pZG81T1Y3TUN5T3VwQVRVR0tPQVBQS2hy?=
 =?utf-8?B?Nk5EbHpZbzhXTWZ3Y0d4R1lhd001Vnd1bDg1Q1grTWE0THZrQmpJV1ZGQVpp?=
 =?utf-8?B?ZlVQL1VqUGF2WDRTVTZ2WUpqdjA4NWFFeHQ4Ynd6aWZpaGFaYzFGNGE5UDFr?=
 =?utf-8?B?MDJHOTFocFRGczA5aytTcHNpUVFGVlpwMiszcjhvWG01OU53QXpLTEc1RHRw?=
 =?utf-8?B?SW54T3gxY2dUUUJUbzRUNnVQYVVKc0hESEI3Zkg3NXFSR29WM3J0MWU1cHZj?=
 =?utf-8?B?aGdTdWVMZ1g5RzVnc0VKSmdrMWE3dE9uYXFYU0VwV1dLSlVwTkhIanlGNi8v?=
 =?utf-8?B?eXc4azJFTFFwSXBaUWdBNzFsNGpFQWpZNm5tVFdmczl0OWt2WFZ3cnBXOHk5?=
 =?utf-8?B?MlhIWGp5YlNVT0VmYzJzRjZCVUNIVXpYVEIwQVFWRlhqMXhsQ05OUGM1TkNO?=
 =?utf-8?B?SVl6RmFTcGlNczdNcEUwaU9JOEhQMktxZEF6WXlrVHhBN1hwdU9peFFXRTBr?=
 =?utf-8?B?SFgzN3FNYTB0elZoL3ZMdC9sbXRsYkhEVWlEZE5BbjZvU0g1dTJoTzB3TlB6?=
 =?utf-8?B?c2JQdlZaZkdmL2xHKzRtdkd2RFJUYm5rUkl3aTBjZFlDM2RpSk00WmswNlpy?=
 =?utf-8?B?dzd4dHBub2taeUhjcHNHTm0zbjhQekVUMXJQMXcxZ3FodjlHTkZiMkQ0MDF1?=
 =?utf-8?B?QUxibXJjV2VsTFg4cmVBU3VlZ3EvWUhLVnVtWlZPSmtrRTl3QTF0d2F2VXFF?=
 =?utf-8?B?eFJUaTZ1WkhkbmwzTE5RR3ZxRjc4MHl6UldnYkdsT0VNZ0JpRTBQQnFKbXRC?=
 =?utf-8?B?MW85RGlaYWN2TFFWNEF2SnRkSDUzeE5GWXl5R09YUlkxcEJTZnh2ZjVOVSt3?=
 =?utf-8?B?N1BuYTJxMHlkajcyRjhBL1poMXZ6VVA3RlI2NjQwTEdTeTlVQ2hSanlLeWNy?=
 =?utf-8?B?UDZPSzF0TEJNUjlNeGUvZEtmRmRNOEhQMXRzeWN0dTJVVk1KMTQrVWxKYU5D?=
 =?utf-8?B?MEcyNjV1cWNsNU9TUVdZVEZWVHpvdkQzR3BWcnd5OUhkWW03M3kzM0k3d1FO?=
 =?utf-8?B?MG81VjYzcVFVbDdPNFJZUFJBYWk0U2t1VUhpMDc2dUtPQUdaZ09sVlc5UDc4?=
 =?utf-8?B?VWJTeVBhNUw3Yks2RDFmbGR0Vy92eUY4dkhIS3lwbVBJcTh4emZSaWQvZzNB?=
 =?utf-8?B?UTNHVVBycm9scDRZOE1oUFE3ZEtpeW42Q3dvR1dvR1VjQVIrWlFRK0VtUFN5?=
 =?utf-8?B?aHYyV1NObjhhVE85MjB6aWNLVytIU29UeDViY1FUb0lPanJFYjdKaTBmeEFz?=
 =?utf-8?B?Wm1tRHY1TVBISUFVWUlHTFZydm5Gek9ZcWFpSEZ3ZlFtZk56NzVLYnVYNFlC?=
 =?utf-8?B?SSsyMEtGTW9OTjJBckFkNXg4Vm5oaHFCL3RYRDl4L3FkNDJSUFlSQXFlMGx6?=
 =?utf-8?Q?uxKZ9CWWZd70ai74HHfHPcsZ5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 961f7442-c7eb-4e07-59d9-08db2aa2fcf1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 06:59:32.5113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRnIjDwye/XQPGoyl4b73QRzzrHCglPwf6xfE2RakLVZk8mhDChbIjUFWEuasKqTpCNcbc7V8DUP7P2YUclZeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9091

On 21.03.2023 19:33, Ayan Kumar Halder wrote:
> On 21/03/2023 16:53, Jan Beulich wrote:
>> On 21.03.2023 17:15, Ayan Kumar Halder wrote:
>>> On 21/03/2023 14:22, Jan Beulich wrote:
>>>> (Using "unsigned long" for a 32-bit paddr_t is of
>>>> course suspicious as well - this ought to be uint32_t.)
>>> The problem with using uint32_t for paddr_t is that there are instances
>>> where the paddr_t is modified with PAGE_MASK or PAGE_ALIGN.
>>>
>>> For eg , handle_passthrough_prop()
>>>
>>>               printk(XENLOG_ERR "Unable to permit to dom%d access to"
>>>                      " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>>>                      kinfo->d->domain_id,
>>>                      mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
>>>
>>> And in xen/include/xen/page-size.h,
>>>
>>> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
>>> #define PAGE_MASK           (~(PAGE_SIZE-1))
>>>
>>> Thus, the resulting types are unsigned long. This cannot be printed
>>> using %u for PRIpaddr.
>> Is there anything wrong with making PAGE_SIZE expand to (1 << PAGE_SHIFT)
>> when physical addresses are only 32 bits wide?
> 
> I don't have a strong objection except that this is similar to what 
> linux is doing today.
> 
> https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/page.h#L12
> 
>>
>>> I remember some discussion (or comment) that the physical addresses
>>> should be represented using 'unsigned long'.
>> A reference would be helpful.
> 
> https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00305.html

I see. I guess this will be okay as long as only 32-bit arches elect to
use 32-bit physical addresses. Maybe there should be a BUILD_BUG_ON()
somewhere, accompanied by a suitable comment?

Jan

