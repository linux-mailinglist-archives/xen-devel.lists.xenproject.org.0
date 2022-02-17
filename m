Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4874B9B84
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 09:53:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274500.469971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKcX7-0008M0-Mn; Thu, 17 Feb 2022 08:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274500.469971; Thu, 17 Feb 2022 08:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKcX7-0008J7-JX; Thu, 17 Feb 2022 08:53:01 +0000
Received: by outflank-mailman (input) for mailman id 274500;
 Thu, 17 Feb 2022 08:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKcX6-0008J1-3j
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 08:53:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00a37dee-8fcf-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 09:52:59 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-gY-5CE-DOryv5Pz2Q-vqjg-1; Thu, 17 Feb 2022 09:52:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5711.eurprd04.prod.outlook.com (2603:10a6:803:e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Thu, 17 Feb
 2022 08:52:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 08:52:53 +0000
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
X-Inumbo-ID: 00a37dee-8fcf-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645087977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AIWwaZsNXUhbiUx2/pIsVIGVMEiOa3To7oqairq16xA=;
	b=WYlWg3E9PD2ID/kB51Ky8fOx80ti42RcYL6q0fLBjbkX/SX6bUbM9HGF9pQ6/dCCmaeJET
	FCBkfJcN45lHF+pQiKO7SYe04mOmuHpcF5WOEt+GikYhzyIwnZQ96cbmsish0/yrGmLg5f
	gfWAmY08PgO5nb1I/G6lBkuEZCb10vY=
X-MC-Unique: gY-5CE-DOryv5Pz2Q-vqjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C29iF97BXAAGfAWZVc1/91fYG0ROqg3mtdkU9tmDcmvI+PKcyqZG9svLvhHLnlbWJPjkHhZdA97aXxT6UrwdoWp/0DbgS2TkWKDEiuGlc+h5lyob0lHFjuMqjnZUYZmBoELj7obR4fihEZD86hJKxqaiQV7Y8OAZ5E9HXtCOm2KRdFeK2dC2N97f7qFK9+hgGHQv2uDa0QtAIIlah3UKguAmBSRRtYctvWM9AiGuD6mDVwVShamVGdymi5Hdtu+euvj8v23ROWDWviIK1ZRGRGvMbi9aunfZGGXztsaYNMpbxUqYWGJraED/z6bjCWUocbLugXnvCAGzfndHxETVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIWwaZsNXUhbiUx2/pIsVIGVMEiOa3To7oqairq16xA=;
 b=cdnXCYOnuFAFYhYu4fplaasMAADG0ejeW9EvOMBWq0AdkHpb9W4lMzRuB5EIQufYdWAYE98+zVAHK+sCCJ7rbuz1wz/M4A5HAv8ughW9hDXN40zVmp2pPzNC3J1eCM+c1lhsRXOUSKb9fMU91/D7Y7uWW0E57ViRzlPyM9MXkg5qdLVGcraIFf+YfAB1Jm5nnmqNjRbqi2B1yeYEfnkZTqveDSm0bJ1C32b4RjS7fRAJRI2oqeEHwV0XvxKUH7j/298gQFn6Ea6GR1zU9/ajTZDWXj9jr6ss6bzCzDETs16u4FxTPwbKEy3dZblOyacd6lTEyBpbCOJDmpWOzBwNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b5a8474-0be2-b4e6-8919-7e22dde1570a@suse.com>
Date: Thu, 17 Feb 2022 09:52:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/5] x86/cpuid: add CPUID flag for Extended Destination
 ID support
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20220216103026.11533-1-roger.pau@citrix.com>
 <20220216103026.11533-2-roger.pau@citrix.com>
 <979fbc26-925c-f58f-9c1a-9ccd72275c9b@suse.com>
 <fd22f7e19590b0e8679e5a3a15992bd1f8a92126.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fd22f7e19590b0e8679e5a3a15992bd1f8a92126.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0003.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6386ed0-1c72-4a5d-a177-08d9f1f2e280
X-MS-TrafficTypeDiagnostic: VI1PR04MB5711:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5711715438AAB97B9F89CA84B3369@VI1PR04MB5711.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nz/1EYT8v+V2p4Q5LoRAIo0rq9/DL6su2myJnQO6ko4hxwMOFhg1gbjF+HEHhp7VZWT3aJmP48THnJKZRsj4UTjv4GoZKOKWUAJf/Ebg1g3Zh6FtAgn7q0XD7WKHdhjAW3ykqOeJB78qLS/re1dEwJbeWucvNInNwaEUhyCEFxBr8PPuHKuv+olmUjtBn+MupAFLbqlE+PQS4tkw/NsCUH2CQ1N9WxO12K8NbWn1fEKDIq6ns7d6Hi17iFwYW1LZjDH3RD0Cxzr9G1f7GIvriYa3tegoinFHQMyyU+a13kb99O9DRyd+H61wHQE+F6C41SOuXsslgJ9TUuDxUrNboku9mRO1paeZLE8yFm76jGhXqAzljMUxUcWA7KrSq0wxaAzwoxbV4TQ6hk7jYp7OkXnKix13q9mkcTl3mGm+0fNuje7MmQuyPo3Zunc7TAGsyerwhWtr6ZNlJpVJWH21MSINIh8HLwIiTHEL6Vny2oilE7xp3SgApNQB3thpdHccId9qz/yHeRYtMHwy+qXDiaGualm0J218Mtqk0G6Jz8yf4+vQweTZSBDZWoYIgjybmGysONoPaDpHl9O1a3x0MFjrkpLgux/GBWoaKvc4yaadcP+gy41DkZuZ3v/dGDlO2CUP/ESN9zhlYcX0mN2Twr09W5l4ZQKnh9w0kkoHMBU/MNLFwkr0AypVn851uCPBOrezZtfm8FhkyvpJWsOUG5MlT9Lq2vpol3AHTbwK8hOCm0GfJK92K1MBL48qSCOF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(316002)(31696002)(86362001)(38100700002)(6486002)(508600001)(8676002)(6916009)(66556008)(2906002)(66946007)(4326008)(36756003)(31686004)(8936002)(83380400001)(66476007)(2616005)(6506007)(6512007)(53546011)(186003)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U25Ed3BYWFFCZjRkVXBJV3F5TEFkSzRCVEplbElqRHlCRzNMTEduUWg3aUxO?=
 =?utf-8?B?RmFmRHhiYmFSY0ZqL2NpR1Y5b0EzSmhvUXM5SUhHZ213VXdwS0hUY1dNR1dL?=
 =?utf-8?B?N21zbGwrVHZNYXR5NlEzMDduODk0RzJic1IyK2lodldBeWdhNHlmVXNEZlAr?=
 =?utf-8?B?VndDMWUrLzg4cXRHeHlRWmt3K1hzMUV0U0FYa0NFd1NFaGN3ZTVIZE4vajls?=
 =?utf-8?B?eGhLSk41QVo2T3NZbzIvdTBtNWJKeGpPYnRYZ0t6ZDIzMWd3R2hEUC9VQ0pL?=
 =?utf-8?B?RWZPWlZhWERMRzJxT25DU0tESEM1blBORm5vWENrYmE2N21HYjdkbjRnWG9F?=
 =?utf-8?B?OE1nWVd0Ukx6aW8wTVk2SWUrbVhNSzVhSnpOZktQdGp4MU1Nc3NubExGbTFW?=
 =?utf-8?B?WVplb2l1OXlGKzhwK3ZPVk1xdFVXOU9Ed0RWZWxqa2Y0T21XNzdUMGpYdk5m?=
 =?utf-8?B?NnZKcDNXaXFZeWVlbXBVOS84THNFanJYRms3bE04K0JKR3ZNaG9LVHpmZkpU?=
 =?utf-8?B?VXdQVk8wL213K0kreGpGajQzeUw2OFF4a2E4Z0pxVTFoNEFxY3lTZXF6RVp1?=
 =?utf-8?B?U2swYXFMSis3VkZiNWdZakZMWi9wblBzUnRUYW9wUGgwNDRIYzVvai85cTdQ?=
 =?utf-8?B?TlhKMloyZVNqQXZVV1JpWm45aG82cUdoWEY5bG4zRS94U1RMMVBJaUJLOWIr?=
 =?utf-8?B?VTZ4VVdsVDhEKzl1ZzJPVFFZNDRTVGcxKytHcEorZHNtc1BRVEVva1Q4MDY4?=
 =?utf-8?B?WkdUbDBNTGE4YjY1TDN4ZEhnSmJTV2Z2dmxEOHJtMmk0QWlrRTNTZGtDOTdB?=
 =?utf-8?B?YkliQUtObDFmY3V3U0NqQ2VrUGRZejJkR0Y1Z2ZzTmZ5dVJUcVpaRkFZUTdx?=
 =?utf-8?B?M2o0NWdWTzhETEVUT1pOcnhoVnV0bGNVQ1k1UWFFTDcvWWRuWVMzdDdwemMr?=
 =?utf-8?B?cTVXNzNRUTUxTFB5aHNxeEdEcW1CV2R6SkI3VDVzSEJTVlE2NVFrMitram43?=
 =?utf-8?B?OFVkWDQvVU8rcjhDSXFWbFhSK29OUCttTUdYdHZ2TTdIenp3T1A3N25OclNQ?=
 =?utf-8?B?cDhkaERreDFuWkkvNDRlQ2k5YklzL3dTL0FLbTdSa0ovakdDdXpveUVOU091?=
 =?utf-8?B?MmdRTzZNRTdRblYxVHNLckNFUk5scWVSTW12WXlyVVRFajBMVFBwZ1pWbFJl?=
 =?utf-8?B?aHFQaUdMSGszTHlJWU1BLzMreGpRRlArWU14OVNOQWJwVEYvZDE1aFdsa2Ns?=
 =?utf-8?B?K2JJd2dVNkdSeEkzZElUcllyR3R3TlBJbTMyOVNUb2dLYjBhN2xlWFJGTFpp?=
 =?utf-8?B?cGIvV1hYajFDZGlqR3A4VkdVQlhyc214TG9SNTQ5d1lJck1EaEhsYkc5OE9t?=
 =?utf-8?B?OEk0V3FFaFpjeDIvYTRsQlNVbXFDeG52Y3lkY2NYV3l4cHBvaTlvTjZRb2pD?=
 =?utf-8?B?eEdIT0w1b2RMZks3TlFFbGNFQ2J6cE90V25EZGJGbWJLQVVDVFhJaWVPMElI?=
 =?utf-8?B?bjhNQ29Ka1FUakNrd1h3Rk1kR2xzV1FCUjNFdlphTkE1K2JqSUZTYnNZQlNq?=
 =?utf-8?B?MCtRQkFRYWtXOUQ4L2gwUWdQRWRweEVsaXY4eUNZaVJ1MUs0QXo1d2FaWHFv?=
 =?utf-8?B?aVdmK0RDbGk2NnFGRnFKQ0RsUHpEZS80cWk4Wnp6SlBKRGZ3ak9SNkhYLzZq?=
 =?utf-8?B?dllmb0cwQnd3ZklXOXJFY0xZcHowb3JCRHNONzlva0YzWFNrVFV3SENyOHZa?=
 =?utf-8?B?NXM5L1RwR0U5ME1uY0QxR2o4OUJTcko0dkNpTFRiWEVudVdPZnRLaG5TQzhE?=
 =?utf-8?B?cjkrMkZTaXZzQWtqbmFvMzhpZHZSTVhpb3J5SHdKbllLME10ZEduaFhwRlRm?=
 =?utf-8?B?SCtFdElyRlplVFVPdDRNdmtqbFoyUkNoMGdxZ3FWTk1UT1p5dTF5Uk0zcGJ2?=
 =?utf-8?B?SXhqcVRqd2p2SVUyMW5zOTRiTkkwVlRaa3FkQWx0Q3I0cUdxNXcrY0hhSVAw?=
 =?utf-8?B?NmVQa0dKWjRtNkhleWxSOXlRNzJ0TnF2RjFFUGJzWHI5cUxWNFR4RFBGbW4r?=
 =?utf-8?B?THYvdWduOUNPVTdGMVRTTFZ4eGRJNHZZYS9NZzAwUHBRR1hvWFZZRkRrN0w0?=
 =?utf-8?B?VU1VUjVMaVZtMWd1SS9WTmw1TmtIRDNHazBIZlYxWWJkMlg4UVNjdjBYbG5V?=
 =?utf-8?Q?PU7yI7N1p8JG0VTEt3mKKbs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6386ed0-1c72-4a5d-a177-08d9f1f2e280
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 08:52:53.7846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/9JLl2CCK8T+lT56MSNLGAOdTve3ys1vORGxyTH0XOHT+rZw+zxqVsx+CdiPfT6LJKA809GmxJZg4WWU4bcbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5711

On 16.02.2022 17:08, David Woodhouse wrote:
> On Wed, 2022-02-16 at 16:43 +0100, Jan Beulich wrote:
>> On 16.02.2022 11:30, Roger Pau Monne wrote:
>>> --- a/xen/include/public/arch-x86/cpuid.h
>>> +++ b/xen/include/public/arch-x86/cpuid.h
>>> @@ -102,6 +102,12 @@
>>>  #define XEN_HVM_CPUID_IOMMU_MAPPINGS   (1u << 2)
>>>  #define XEN_HVM_CPUID_VCPU_ID_PRESENT  (1u << 3) /* vcpu id is present in EBX */
>>>  #define XEN_HVM_CPUID_DOMID_PRESENT    (1u << 4) /* domid is present in ECX */
>>> +/*
>>> + * Bits 55:49 from the IO-APIC RTE and bits 11:5 from the MSI address can be
>>> + * used to store high bits for the Destination ID. This expands the Destination
>>> + * ID field from 8 to 15 bits, allowing to target APIC IDs up 32768.
>>> + */
>>> +#define XEN_HVM_CPUID_EXT_DEST_ID      (1u << 5)
>>
>> Would the comment perhaps better include "in the absence of (guest
>> visible) interrupt remapping", since otherwise the layout / meaning
>> changes anyway? Apart from this I'd be fine with this going in
>> ahead of the rest of this series.
> 
> No, this still works even if the guest has a vIOMMU with interrupt
> remapping. The Compatibility Format and Remappable Format MSI messages
> are distinct because the low bit of the Ext Dest ID is used to indicate
> Remappable Format.

Well, yes, that was my point: With that bit set bits 55:49 / 11:5 change
meaning. As an alternative to my initial proposal the comment could also
state that bit 48 / 4 needs to be clear for this feature to take effect.

Jan


