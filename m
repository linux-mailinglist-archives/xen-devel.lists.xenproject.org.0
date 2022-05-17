Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2046452A7A3
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 18:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331225.554704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzjV-0000Sq-VO; Tue, 17 May 2022 16:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331225.554704; Tue, 17 May 2022 16:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzjV-0000Qh-Sf; Tue, 17 May 2022 16:07:37 +0000
Received: by outflank-mailman (input) for mailman id 331225;
 Tue, 17 May 2022 16:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqzjV-0000Qb-9x
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 16:07:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7783111c-d5fb-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 18:07:36 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-e_fG5dLXMdWsmvaezydskA-1; Tue, 17 May 2022 18:07:33 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6143.eurprd04.prod.outlook.com (2603:10a6:803:fc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 16:07:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 16:07:32 +0000
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
X-Inumbo-ID: 7783111c-d5fb-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652803655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BEP/oERyYYK8Ui+6e0nWabj/WNxIr1Uz8aYLVSV9mZA=;
	b=YuN1TW6CqEU+fzcIU+erpm4QU//8/+UWQyx343mK6Wie78aFKu3FtRU7+vKYsdq1MdmCPU
	PnjQY1pXqZ1f4Olt5R4wwKAmXrHfYX7DQURgdJosoviR5/P5P+lspKT+E9DQMh7UEH3Je0
	+0qCcU7OaOL7pMWgXRQfVUlBInCEZb0=
X-MC-Unique: e_fG5dLXMdWsmvaezydskA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvYxbijBYqyPKO6NaR9X1RRyncHsu9KbClcBIOIPD8tgCQWdQWarzUutFyviyg6wMQzeguSzd2ARO25kJWZ6qFRVF8z4BAtLe+btlyjYR8znjNvgdd063mYypU0EHIh810ADaYSeUd/dmvBFTiRAZ28wz7FWdj+U8SpL+Gh/wolTPUq4hcxKSsW+XgPSXz6w5RI0FRS0f16LJZZrTrSKTHesPrXBoXqpRDbYYh+414gHUEIl2jFYzWwcjr95iiRuY3OQI01QgK5YaxpcGPDh8PZMF7u1ZUQPqohM4czYbQQg1chCEo94ZBivV2LZzRGlChMWarfiD2riX/5IXqJiew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEP/oERyYYK8Ui+6e0nWabj/WNxIr1Uz8aYLVSV9mZA=;
 b=LDrXGakaoqm4zjItv3niadO++sIpLSnqFUNQts1XrE5mKZkjxcpFT/dmsxqI9aD7S5Dn60RePwXkB6PzbmnEAZGbS6eF5HeIOdLC5j71Mk1xd89jJSpMxkGT1CAaLOBIAF6JRPWAcB90/hDXPBlmOAL8bU8lr3K1tXHrCCLKqTG8RkLsI356RawWzwPqOKU1wzuNotIXhD9L9G1bMYGte8sS5yDj5CyPAz3qn9TLwZGZBI+Rxct16R4vuxnrYfSggCt4+WmhGv5+CL2FyzIfF0Hp25K7rdES78gJrZIryUBWvFHqXCIE0KHDlLosw80DsNMyWMlxZhlcWZmYhd/iWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <70d936c4-966a-391a-4d12-33b58b502aa6@suse.com>
Date: Tue, 17 May 2022 18:07:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 1/6] xen: do not free reserved memory into heap
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-2-Penny.Zheng@arm.com>
 <2ebda9bb-8045-56ec-619b-d0178d57ee17@xen.org>
 <DU2PR08MB73255BBF708979822747FF2DF7CE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <511fd0cb-348f-b65d-cb7b-effd822c7f20@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <511fd0cb-348f-b65d-cb7b-effd822c7f20@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0328.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3de536ec-a079-435c-386b-08da381f596a
X-MS-TrafficTypeDiagnostic: VI1PR04MB6143:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6143F1E6DD9F9F752E73A8A4B3CE9@VI1PR04MB6143.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+iPD2AEWwRARzMMw9Zbw9jPkjkVePX/ariYKHEea4fK1moJ7ICZqsVY7MVh1QMfDXXanYCKc9I+NeDPCqsPg3aw1rik7cowRpf3l0LAfYMGou0t0OgwLY6Dg3eBcdf68MLA1lMBmy4SusAOxgcAIogjI84bOBGnjiyBizcY+pz9+rV93SYjfJBRDAaiNo1JUekvrX2s8q7LkI9otJWjOpaK6MK2g0OaOmE4DEgqhC5daCZP85+DocFRSDClV2A6uUJrC2z/Qxfsr3F6OWfvLLgHRG7lnlPT+p1bxIfwuPl/Zo7eZjvCUKqy/TWTlr6N/LcnhRVronsvvbZocBYfWi/jSbMqzmFninOaNyUNHwzbtnxs0dZqgTJTJaqOMP0koXgNvOfCmFoGev/Yl7ECQehJ3mt05oS2dh6N7oUtbzWajmjHfZx5MjsjFaIgmhvyNf0+cAYcOzQgp5E9qavAqNA1nF/5LX6oHDy/xJ13IwhIw5xtTQoSsCWEQMBm/0AcxEjNhvLC7fxXRV8xnX532rSq5LcHcS7VX/YSXr3ZH13PhS4sZNsDuaqLnXEhZS25qS01dpeBxj1BrcrvPBSTvPiAfaCcN2Mkzm5R8GSoOh9ailZ2sq4h4TUHe17AViAml2GGYt+DSxONpn4J7ykTuAKOjqHQ50Mz3BSEQ8jiy7ln0+No3QdqtD6ZTM9T3/uPINDQbVqJTAGCoS00eSlQsFBavjF9kJlzRPUVBYWaLUub8MQ8asOCQR3oDauXDQAdY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(26005)(53546011)(36756003)(31686004)(66476007)(508600001)(6486002)(6916009)(54906003)(31696002)(6506007)(86362001)(38100700002)(8936002)(2906002)(316002)(5660300002)(2616005)(186003)(66946007)(66556008)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGh0NlpTVTRXM0doeXFIRWQ1Z1hxalZxN2ZOT0lRajQydzZ0UzZuVkF2a21p?=
 =?utf-8?B?Sld5UjNxM2FsNmN0bzVwdE9kYncwWUdzM0NQRm9HR3kyZjUxWmljWTEyQWo4?=
 =?utf-8?B?cEFITW9lVE1ydyt6aWx2UjVMUUI3VUN0TFhzKzZ5cE9rUVlTbTNMQkhHN3lO?=
 =?utf-8?B?Sis0Wkw0TmY1ZUN5OVpKaFBXWCtKT0ZYRzJieUsrSUx2ZDhNbVRKY09DVU5i?=
 =?utf-8?B?Z1lodHRwMDRQUGVXekNFclhKZDRmTmRnM0RSRnZucFFuYXE0dVlhUmNQd0lE?=
 =?utf-8?B?YUlnNlgrK25nM09mOW9JamxRTWJFL25QTUhyUHlpYVRsZVVNSWM3dFlzNG0w?=
 =?utf-8?B?ZHdPVEJRTExsTXZ0dFhtUnNuT2FkNnBHZ2NDdWFTT3BXbEZMMEExT2R1bDlQ?=
 =?utf-8?B?WUorZDk2T1RnTFRtbEZKaW9XMWEzeVEvNlpSSXFlSFYzLzdqR1NtOUM1UjFa?=
 =?utf-8?B?Q0lsalpVMkRtVWE5ZGRtR1BTL282OEFjcjR0VlgyUTJ3aXRVb1djZGJ0YjJC?=
 =?utf-8?B?cm1TOHU4NkNKNzFyWWd5VzNTdXRDSG40VnB6OXk4SmhIbytxZDFCSG1GNkdN?=
 =?utf-8?B?S0xjUDFIMHNLdmkwdEtyQmVDYnNTR2RqVFY0eEo0aFdnaFF5My9hWWF2VnFT?=
 =?utf-8?B?UTFXeFY1MW1GZ01BK1JjMUxUdFB1eGJGdkxRM3JzRzdGOTVpNDdnT3pMS0k4?=
 =?utf-8?B?TXJaNStTbmxyc0xseGVwNisyUGVaSFNKMDZWbmxtWFlrb2xzR01HSTBDMDVF?=
 =?utf-8?B?WUpNckdZYlgwejNtT3FMandaZkpGZDJZMkdiY0F5TCtFbXhhYUczQU82bEl2?=
 =?utf-8?B?TkFxaTB2dXJibnpWMG5RbkxQaVNWYmdBUmhVWXhGOEJURyttKzZ0RUlSdnNG?=
 =?utf-8?B?cjlLa0kwN0w4ODRFU2p0TEFsek8yWEpybThsUXdpMG1NSXlPc2JKSTltb2Nn?=
 =?utf-8?B?Yis3Q1dMUW5ua0hQWXl6RUVSZGFTTGFIV2xXam9WeWV6QStSdmpCZTFYaGQv?=
 =?utf-8?B?Nyt5TW5pUzdTOUxqczZSUGVMN1R0cit1VWgyVkVRYWhDVC93Qks3b2NzYXNT?=
 =?utf-8?B?Vnkzak9JTVJtT25PdngwZ0dSdXhWbS9qblpueG9MTEcvUmhGVTlac0h1UVlH?=
 =?utf-8?B?WFA1cVhSU21KQW1aM0R3d01jZ3F1QlNsbXBteGZrcnYyb01jenRaeHVvVXhq?=
 =?utf-8?B?NzZCZ3ZhV0FjS1RSMURTQnJUcGU4UElIN1YyZGtJMHlxS2lzZmw3MDFXaUxJ?=
 =?utf-8?B?V2NrbG1PRHNWV1p1QXRoQWN1cHROYktOZFUrbDE4TTdlQ0VCNUN4TjNxeUwr?=
 =?utf-8?B?alk4VldMd0dJV0ZCMTJ5bVp2TmU5TlpzT09oZHNGckR5dGtFVFRlL2Y2aGJw?=
 =?utf-8?B?dlpydUxGcHlncnN2aXIwb1JaUjhGaTNVZ2E5cURBVkVjVTh6bFBuK1lqZ3hS?=
 =?utf-8?B?OStEMlBWZWdCMHpzS0UwK0xYRDQyU0pEQ2RFWDlLQ3BxRDZOMEFuaEVRWDlE?=
 =?utf-8?B?b2hqUC9EL25vak5NRHVzL0dqZWRuVmxSelMyek5FNi9TRE9LUmJ3TG9oaXdT?=
 =?utf-8?B?ekF0Q1N2QnQxSm9WbUloUG9TTXhYWGRJRmtaVHpSNEorckxBRVVPTk52SWdG?=
 =?utf-8?B?YmUxL1B4TzJBMnV0T1EwcUhBWEtmQUZmdFUwZFNCZW1RYWY2ZUhnQXFNRnBV?=
 =?utf-8?B?U2JVamp6RGtSNE9mbndZamNsdzhySUZMWHpRcmUxbnRQeTVHRUZuT3Vtbkp3?=
 =?utf-8?B?Sy9vdVFXRnlURkhiM1M3WHErMU1lc1hiWERNM3BVTFhTUVRCUCt1Ynlod1Rn?=
 =?utf-8?B?aTYxeXVPSEhqT0tPcEdJdnBHZEVEaEVKbWNTYWVDNTRVY0lUWFpnK0FOcjhW?=
 =?utf-8?B?dXppaEFjTm9ZN2dDNzEzSmtrNjdicVU4SVlsNnZCbHhXc1BYdzVNMDFSYUd3?=
 =?utf-8?B?eS9SYjZPSExKUVBzYVA1WVpmVDZUajBaY0FjYW53aXZQbldSUFVIMlV2Z2c3?=
 =?utf-8?B?bHE3cDRmV044eStSaUhkUnYyblZJUDhJNzd0b05nVW9xdERuRVovYWJGbXVu?=
 =?utf-8?B?cjJtcFBRVDhsemxLVWg5aS9EUnZPcDJkYnRhc3lMYTRTS1lsN1IxL1pKR1ZG?=
 =?utf-8?B?VlZaZ0VpRS9uNDExNEN2T3ZFdjgyZjdWWTdmUnhZMU9VYVNrSVcrcXBkWEdk?=
 =?utf-8?B?citNeGk3OGNIbUsycGptTzBqK0E0U3hqN1g3blBXNk1DeDZCWkNnMDZMQWFU?=
 =?utf-8?B?NDQyNmZDSWIvR1JZZTcxK0xMVjRtK0tGb1c4RVJMelpKaVI1S25WazVTT3ZR?=
 =?utf-8?B?ZHFRWE9tdFJYbksyNWk3K2hBVVJ4TDU5OWxTRzlHNDlYUUJpeFc5QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de536ec-a079-435c-386b-08da381f596a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 16:07:32.3027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40slzJwL1wZz9twml84Uy1utkjKXwZRDB7r95H3sH7G+Q2i+tgllZ/3jplUqZpf9lGO5n7Scp20dBm+mQ6bGhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6143

On 17.05.2022 11:28, Julien Grall wrote:
> On 17/05/2022 09:21, Penny Zheng wrote:
>>>> @@ -2653,7 +2657,8 @@ void __init free_staticmem_pages(struct page_info
>>> *pg, unsigned long nr_mfns,
>>>>            }
>>>>
>>>>            /* In case initializing page of static memory, mark it PGC_reserved. */
>>>> -        pg[i].count_info |= PGC_reserved;
>>>> +        if ( !(pg[i].count_info & PGC_reserved) )
>>>
>>> NIT: I understand the flag may have already been set, but I am not convinced if
>>> it is worth checking it and then set.
>>>
>>
>> Jan suggested that since we remove the __init from free_staticmem_pages, it's now in preemptable
>> state at runtime, so better be adding this check here.
> 
> Well, count_info is already modified within that loop (see 
> mark_page_free()). So I think the impact of setting PGC_reserved is 
> going to be meaningless.
> 
> However... mark_page_free() is going to set count_info to PGC_state_free 
> and by consequence clear PGC_reserved. Theferore, in the current 
> implementation we always need to re-set PGC_reserved.

Oh, indeed - I didn't pay attention to that aspect. Which then, however,
means that the comment also wants adjusting.

Jan

> So effectively, the "if" is pointless here.
> 
> Cheers,
> 


