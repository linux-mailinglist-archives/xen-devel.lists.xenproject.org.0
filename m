Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473A24530AA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 12:31:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226250.390907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmwgF-0004B3-4R; Tue, 16 Nov 2021 11:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226250.390907; Tue, 16 Nov 2021 11:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmwgF-00049H-14; Tue, 16 Nov 2021 11:31:15 +0000
Received: by outflank-mailman (input) for mailman id 226250;
 Tue, 16 Nov 2021 11:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmwgD-00049B-UE
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 11:31:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aeb18605-46d0-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 12:31:06 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-8gPQD07eMvaVwK4zC7s9wg-1; Tue, 16 Nov 2021 12:31:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 11:31:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 11:31:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.7 via Frontend Transport; Tue, 16 Nov 2021 11:31:00 +0000
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
X-Inumbo-ID: aeb18605-46d0-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637062263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HAF4dnWUTlGBODvANNc/XeWb7Q5R3sebTFH/Ja2y1R4=;
	b=id/bLNhCVII8xZjmkWR9qv2zbDcVhHfRmVVkK6AwJze98X4PLxUYNL8GiNHcT/1VYEwT0E
	exr/a2+YGkq/fHEOfnTxP3yz/AjtP/avXhQjLDPomyNz0eCWx5t7ZCWrJLMHgHxhAlRflZ
	82jYfDZeTlAuKUI0F7EKb0CEUWZAurI=
X-MC-Unique: 8gPQD07eMvaVwK4zC7s9wg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6T5bVf+bsq8mbCE7gDwlLjRTcUxTZtBxbmf4XmSYwHyCRmyNF/gmkvQctuuEqRVAA3gx9wHv1KR30u7b4Fr0cz4PzFRJIJUP36hqiHyLuPBuU7f8zLkPVBQNP8EeymSRK2XSKJNORRr8+5+XRp/QFlSmXaaXVkBh66MAtjR01bVaj+d0nCKakx3kTohpf6Li6IxvUDF+Mn+hyUMqgX16nBocdY0qiR4AW4MGPLeuF5o6UEriE+EL2VKrc3hlWJTmMfju7T2M9XQd4b8ZBDl+aQESNelmmq3dd6dRyl7+LrDO/xeeGFF+n0xo3NEfVOjE8iYUKCwoAXVFnS68TCiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAF4dnWUTlGBODvANNc/XeWb7Q5R3sebTFH/Ja2y1R4=;
 b=i1hRL/a9Ryb6+4IlpVAmWqf735OiqK8/F9OUCz0f8hpol2kGsowkkDPlsKfICxunSuJvcC1GMBJdCkfNG2apbrrue18//ciOvFhZM3G9Nc0A1hP9+nmAnDF2bSrGraCKc/KXyBYthkUD1bYH2znUHLkzQU2U5mMBgenkY2ezoR3QWFNFFgwZGDt0PUS+BM4lV0TkJmYR0pgRqVvXSI4z4us6qudXEd/ef58J/a0EYjM2jm38/MxWzdvcJprnZrGzX8M8VLYKu6xzFSc/ZRPF1Yjky/dNYWFAVW2cC5x0eoUeLNny7daCs0C8lxR9+CJO6/Rc9tLKSioRzR7VW/cj3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01e2d2ed-ad23-f8fb-a8f8-c5998b082ba5@suse.com>
Date: Tue, 16 Nov 2021 12:30:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 00/10] direct-map memory map
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <20211116063155.901183-1-penny.zheng@arm.com>
 <9f883c45-05ec-f362-57e7-f87741da08d5@suse.com>
 <c9bc50d8-5840-2712-979d-df2b7b56f410@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c9bc50d8-5840-2712-979d-df2b7b56f410@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 925ecaa7-4a26-4190-5105-08d9a8f490ed
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3119649692641F68E6357A18B3999@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CbmE17TSbWvP6BGVGawo7Ck3fIMkOIlqQspwG5/e87dyZSs9pfnIZ3U3q15ncJLxJzvSz5u58MUSHo74C2cc9Hs6GPrc68qcrAODdsGGVXp4CjEBUFxnHyVK2hwZ3wpZZDypIHZmnKy8OXOhldkJKe8i4wFcRvMXwkcDtoiqFc39v4RqC9OBpMXoYCR7AYPfZVqZeBmnZo1pQf6aaDTmlhfq9RI9mbfrA4sQ/t/6/EiGqAJ3T6LPmiEHvFJrKnuCF8dEnIE0RWKjif8KGAbynOHyWsWzXgWTj1mmanBVFggckchqPWLCZXuFxz5kFsr3xfHd/6E6fDTwNAGZj/XCPSgH/Hqztb7z4TQrnwBek0oxam7f9c5vy+jNM9vKzpiPiZL2fMCJ1V1EL8W/OOvsvRGMON+2+pRuMfawEs+BD9WoFvUT/lj5xUOknWme9NN4ry/ONIuHsQCnj1NQhoFXnHmINof4qHn7T/kgMwN8KlCZT0P+kUYudkdcKhK4F7wT90cu/amPJsRfEzm7PtkAyW60LMYk3Wy5ciTnO1qPZv34giE/KTWm6yDnHDBYmvMzfXtjzemMXMVHr+5m1mBW1yj9Dp8x28hWubXx03e1GoNBDj7nr5vTffnGh8rEXSHCTc4B10WjjtHaICJhZyyBcDQAsickf5Iqbl1kVyMM5PczDWbyLQTJkb/I98FvQ5Hd3ELcwf+EiTk7L1DzKd4jCh9vI/WTUbUrT2LyW52EO2BGeJ0yXZo42uuEZ1ZdALkdFAxdenFsDfOJpXA6rHWgXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(4326008)(186003)(53546011)(66946007)(316002)(66476007)(66556008)(6486002)(31686004)(508600001)(26005)(86362001)(8936002)(5660300002)(8676002)(16576012)(38100700002)(2906002)(956004)(31696002)(110136005)(2616005)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d202YXRlTDl0T0I3VGpMSDhIcVJMV3pIbUgyZGZmQjZZZkRZOU1hSWtZTC9x?=
 =?utf-8?B?OGdYYjF3MW5YaHU3Q291cHRTc3RaZkE3d0l6ZVF2Nkxna2ZVQ0lTNVl1WWdE?=
 =?utf-8?B?em9GaitUd09MMEpzR3B1NGY0aUhSNlZkVmgwd0h4SWM2dlBHQWpGak83R2hv?=
 =?utf-8?B?QUl4b1lHVFpGamJ3aGYwbEVXaGJBcXhwNG55cmtaUWVQUFFrSit5MFh0Vm5U?=
 =?utf-8?B?SHdRREg3Y1ExRGhBVHdGTE4wWTQ2dHI3NXlhYVpCWldhTFVCcGd6b3VLWVBX?=
 =?utf-8?B?dHpoTkttME1uNHNNaW80TFpIOVNIdTdLbllkc3lxb3FrV1pDaU5iaU1TTVk2?=
 =?utf-8?B?b0lsVktFRnh4bWhzUmErOFRIbmNVN1RxaHhoZlFHRXBLeXBocFhlcnl3dXYw?=
 =?utf-8?B?ajZkaGUwdlhBaUZnUE1jZDhoNjBiT0tmaHNiZ25lQ2dOYnRPeWdwY1hGQ0Q5?=
 =?utf-8?B?ckNZSFNsdGNqbFIwdVQxeXNSNzlFcmdlaHhDTWtlWHRpQ1pjRGIvbVVrV0xm?=
 =?utf-8?B?bWx5aXY0eXNmMG5idVR5dVhZNnRsVUVHZ2NMckgyWXVXTk1Ic0FJNmlkVGp4?=
 =?utf-8?B?Ymw1UnQ3RnFkb1NhZUhFL0I4cUdWQ2dVaWVKbTIvejhhekU5NG0wb2pUemln?=
 =?utf-8?B?bThaNll3MXJhR1BIOTd3Qy9xYkFXVEZyV0N2eVBaTmdxTCsycWtINFBROUkw?=
 =?utf-8?B?aUlmTGpQOHlJVmJLRTkvenlCdXdNOGQ3bUYzSTJNL2p2ZnZ5L3BoMUtBWWJI?=
 =?utf-8?B?UTdzZXZjSWJJanEvbEZSN0tBOXUyZHp6emZXQUNhU2ExNStOVlBVUzg5QmdE?=
 =?utf-8?B?Ry94N3ZPcHpuM2E5OHd2a3psd0NhK2NwekpTbEN5N01GMWRLOFhPNk81Z01x?=
 =?utf-8?B?VjVUVUJPOC9KUXZia0JFNEpKWU5WYUdmNno0NXdCT3o4Wk1GTEpzSnBCdlB3?=
 =?utf-8?B?RE9TRXlIaldubGQ0YzF6aE9TcHh0VzlTM0ttLzVqUjErbFQvRTVnV0RKWVo0?=
 =?utf-8?B?eVFQeUpyMUcwWFBXdDdiU3phSklFSkNGeDRlaUdSK1g2dVJFMEVyQ2V1dW02?=
 =?utf-8?B?WWFzQ0pPTkZjSWVXK2tZVE05dDlNQW9LZFVDdCtFeWtRKy8zL0tjV1FFUUk4?=
 =?utf-8?B?QS9LdmZaNEdsRWJPVDFIODVoWjRyTkZBN3Z2dGZlb2NMSHNTdHFqWFRXdnRC?=
 =?utf-8?B?NGVxM1FqRlFkMmdOOEhsd3VoQW5CenVoTUFwNXBIMWNtZUJsbEo0Ylp6ZXMw?=
 =?utf-8?B?dHhwRG5BZXlwcy9Bb214ZDB5MHRBRkUrcG0xdHN4QWkrRThtSmVtbnZpUW93?=
 =?utf-8?B?OEpsSythN0sxNHNPUjFEV0ZpNWVubXphWTlvQjV5YXJjeVpOQTlIOEk2ODZL?=
 =?utf-8?B?b1lkdEpKUGU2ODJlSzgrdEx6ak9qZG8xWVJOUUFTZEtpN1YwM2FndzNETVZu?=
 =?utf-8?B?RWY4akVnVmNiM3Z2SHFaYTJEaHkxdkhueGd3d2FkVXNYcUZkUGZFaFVlRUs4?=
 =?utf-8?B?NDZZM1dHb0dac0pSSHl4VFBucG1hRUw4ZU5kR0U3OTF2WU5LMVU1bUdOV21G?=
 =?utf-8?B?Q0pnK1VEdnNvZXN3OVY5UHoxNWZnR2FsVnIrTkdjUktvTnFQZ3d4c2pWRUJR?=
 =?utf-8?B?N1F2cytJcnZNQ1dlVStodnE0blB0aHY4NStiZmVXWjQxRG5jWHFQYTZBSDd1?=
 =?utf-8?B?RXcrMDNtSnRsTnR6SUpnem1Db25MWDFCVnhFWm52d0lkakk0V1FuQzlBQ084?=
 =?utf-8?B?aVo1M0hQOHd0VW5EWURvRUhvMnd2THZzOHVvTWlYOVQzQnlLMkVhVGlTR2M0?=
 =?utf-8?B?UjdQbU5xUHVjZEJUMS96d3dpZk12blpKUXJveldWMmFPT1ZINHRtU0Jvbkww?=
 =?utf-8?B?ZWYzeVM0dmJSeWVuQXQ3VHRUN0tsdWh5RVRPTU01aldxK1l2ZEkzN21uU0E3?=
 =?utf-8?B?eUxYbE5LWlk0dWtqZFM2MUowRys3NHJwaXdjbFFrd09uWWppNis3ZTZRaTN4?=
 =?utf-8?B?aUZVcnpmdzBCbExBV21PSEhOaTh5aFNYaUM2NVNJZGxjd1ZnR1U5b1N5QnBr?=
 =?utf-8?B?d3hkdHpNRWtYRStxcnN3di9MVmlQSXE3RFQvT2ROQVk4dWNCME0yWW5PdmFr?=
 =?utf-8?B?aytqaWZjOEtBdFJ0R0lNcDhpQmRFcVhGWTRkRldkVnFXdzgvK1RDS0RHWFJK?=
 =?utf-8?Q?5EsDGdqGtasyb1xhYtC1yOM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925ecaa7-4a26-4190-5105-08d9a8f490ed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 11:31:00.8693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzNNusZf0YiIcnwcDN0eaW2Pr4Jm1OQshe5dy3jgYtg32uSDMWbxf1oTTypiVk2RJvzBJNlZ6ImPV9SOTTBgnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

On 16.11.2021 10:44, Julien Grall wrote:
> On 16/11/2021 07:49, Jan Beulich wrote:
>> On 16.11.2021 07:31, Penny Zheng wrote:
>>> v3 changes:
>>> - move flag XEN_DOMCTL_CDF_INTERNAL_directmap back to xen/include/xen/domain.h,
>>> to let it be only available for domain created by XEN.
>>> - name it with extra "INTERNAL" and add comments to warn developers not
>>> to accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag.
>>
>> FTR I continue to object to the hijacking of a public interface bit for
>> this purpose. Not to the degree of nak-ing the change, but still.
> 
> I remember this discussion in v1 and I am a bit confused why this was 
> re-introduced. Looking at the thread, I think you and I were happy with 
> the following approach:
> 
>    1) Switch the last parameter of domain_create() (i.e. bool is_priv) 
> to flags.
>    2) Define a bit in the parameter to indicate whether the domain will 
> be direct-mapped.

Indeed, that's how I too would prefer this to be dealt with.

Jan


