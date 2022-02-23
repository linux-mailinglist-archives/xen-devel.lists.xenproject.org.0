Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CB64C0EB9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 10:01:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277219.473654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMnV7-0004cQ-1u; Wed, 23 Feb 2022 08:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277219.473654; Wed, 23 Feb 2022 08:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMnV6-0004Za-V7; Wed, 23 Feb 2022 08:59:56 +0000
Received: by outflank-mailman (input) for mailman id 277219;
 Wed, 23 Feb 2022 08:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMnV6-0004ZU-14
 for xen-devel@lists.xen.org; Wed, 23 Feb 2022 08:59:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7f6e217-9486-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 09:59:55 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-ZxRWhlfoPyCCctOMqGaDrA-1; Wed, 23 Feb 2022 09:59:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR0401MB2578.eurprd04.prod.outlook.com (2603:10a6:203:3b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 08:59:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 08:59:50 +0000
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
X-Inumbo-ID: f7f6e217-9486-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645606794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wHR1n0jidhM72oXQtgLnkz3IrAumUW4H9ri90d8hkj0=;
	b=H0G648wq3JDdZT4jxKG2Eqx6SBXnMwwS4FdHBWNf8B5zDtkQVfeClXoIY8FEZ7jrI7lvqe
	LARPQYQlRh9QGerJhqnkvdKaB5HWosflhbY1ltB7WBd23L0a7ZSHWzIMHUUra2I9INlsqt
	rvoikHu2i55abYzb6srepLECKZ6U/iw=
X-MC-Unique: ZxRWhlfoPyCCctOMqGaDrA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldIFZPXhEwGlMWKlef/qzERM8o+SG3qLvPd4whIe2RBnhVgxR7z3/nb5T1vdZ2hXYytvtHZFX9R6gbUXce0TzQjSVEKtpC579TqXNBQYuNpfT1hveIHyUqwHD/Z/yXo5/DZrDAeuAOVV4dlbQxM4JAQV2CgPLMtaraJCETDsR6Fh8+W21gZDdhfgYPzIo8UYOVgIt1ZKyFKcYurJ/74yBph37dAGK+tWeW1f69ZJsq8CvfDy0HqCOsdxyetVZOA+szi8f/vkECg3Pa0GdXbyBgcJVXjYzesC/epwkyoh9RCmfmy4zOfZXhJX7Hix6es+p78AmBlllz/nvJ2xwgJmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHR1n0jidhM72oXQtgLnkz3IrAumUW4H9ri90d8hkj0=;
 b=GTclnySA9Nj38vTTDDotgnCclHPt9kZdHYolIqrd20tHX8j9b8eOO8emAqAMXdxjAMyvaFQa+bgxPe3KmgsodU2mCq6ibFH4Jnh9mQ8/fy7MRlrOKFWaUGP0PAZDU44cjJAPj1TDKAQqVp8v3AMrUzpr2dQbywhBwUiRsomyoAGPX0xZFR0pvFavkIe/G22jGdnqfZKceX+RIw7R5I58iKSzbfHFOKhbApDJZFJdUnVZQIGQeuwD1xMLjh0c3tpQYuJV+rmgh/UyrhEOHUpdUyjqaF0zNTjJo4m9/hULOQJ7u8koMKaY/nuUT/0cbfKJm7VHfrWbgaEALLk7VilcRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9a77707-5d93-050a-f9ee-da284dbd0eac@suse.com>
Date: Wed, 23 Feb 2022 09:59:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: IGD pass-through failures since 4.10.
Content-Language: en-US
To: "Dr. Greg" <greg@enjellic.com>
Cc: xen-devel@lists.xen.org
References: <20220214060011.GA24404@wind.enjellic.com>
 <198ef291-4dee-ddac-aef6-8451bc1e880c@suse.com>
 <20220217201534.GA29303@wind.enjellic.com>
 <dc1a4483-7dca-aa72-6b86-4217e6840efb@suse.com>
 <20220222185230.GA15532@wind.enjellic.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220222185230.GA15532@wind.enjellic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0037.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffa592c0-a270-4d5b-7702-08d9f6aad9b1
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2578:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0401MB257895DDD8AE5AA489E7DD6FB33C9@AM5PR0401MB2578.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZzinOooHTJbDp9qdV5VKPB21tqygmDkNtz+bJSMg6qS+Z14TFedRJvtL2fnPPeSOpjlNRY2dmCnL9luVg7YmRTZjhveSWbey41RkUvy3TcVhs1ilMPYUzNZNJFsYyB688Hk27YtwhOpGt4ZFVTBDNo/csn5fPA6drem7f/1W05wfuMafQw94FZAbhJokZN1LyCH7FweDdVYKvPYRh05j+pfUuzgLgr9wOmOzEaU2O7IexqXBAZONsFPKXG1wlKtw0WvbwjhukHBBOFvgT5p+rT89TjRWjzRvg3RTXFZTtUz4pcvzy9HXlbWpWOyxntPvWRp+/FF8MIYNbo6XAnVK3b0ipXbeXLYXKAl7xYdS0G2Q5pBL7Kce9kP6ShHowK8UOTnHiZDJs3pnsvM4IdwoYVXsJnd6Gv8zh34Yw8lrTantc2SiNhDrR+ADfk/PFXFAzteForIRiDxSgvl94gHajXhcz0r/lbHniwLl3bUWnwOnWEHKvH7eTWjfqlExFp2K8mLjVyK3Uxm4Hq2Fo9XMhR2SiEtHbhjB2YHyZPO/Gk9XrXo48FDfBuHxOI6TwBDbsb5N9M3KDMR+jpMMmp+DXP/teZnWk07f9xqivoo7MTLDJNPdJkIuIyo7DkUZanemj8akrmVY/g48yoHOcF0aHI4b8zAKiISCnUaVQ5VnSHQnfd8Jhx0uTZoXaQ8ZgTBXlOv1pdaXooZSO/K/kLxcgfvebjdLK/OA4V2oKPOLGQXba7eu9ZlqBebVkMEuYkEB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6506007)(508600001)(6916009)(31696002)(6486002)(6512007)(83380400001)(86362001)(316002)(2616005)(38100700002)(5660300002)(4326008)(66476007)(8676002)(2906002)(36756003)(66556008)(8936002)(31686004)(186003)(66946007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUN1ME1SMDRCaUlWTlVJNFhnZ1dnWTJ2K09BQWF4UUIwWXdCLytNOGJvdkg4?=
 =?utf-8?B?VTNLUUx4NDEwczVpdWlEdWdqWmd1QTlrSFV0KzMwZEVVYXkwQVZ2VHFiVHpK?=
 =?utf-8?B?aWx2cjZIYUFTRlJjRmE5OGdxTTFoTWhXMDN3R2NETGQzbGhnODgwd09icmh1?=
 =?utf-8?B?d3FUWWdLQWYvYVV4MUhyQmhVQUFtcmoxTkwzTHVKQjlCYnE1T3A0SjdZbk5p?=
 =?utf-8?B?NTFtUVpQTmFqYmZoU2YvZTdTRFdPdkw3WnZZN1Z4dVRBUWljZzBTSWtQN09p?=
 =?utf-8?B?WUxxbk53THd4N0ZCTnN3OFNXZWI2ZTZQK1ZxSFVrZUlIQXA4NzVkMUoyVG40?=
 =?utf-8?B?SjhVYWJ4czVQSkJwWDI4MDBBVmVMcmRBTGxrcmdOcGl3T0p6U0owMC9VWkxr?=
 =?utf-8?B?T3VzN1ZMNmJTelVzZ0x2UnppTSt2Z2dmOWVGaXdkakV0bHRxeEQrWUdTZmNw?=
 =?utf-8?B?L3FZQ0lDVXlCdnVSb1R3eDBFa2tqWjFXSEtHN1V0aDI4dGVNNDh6bGUwYkJ5?=
 =?utf-8?B?eE5vRSt5bFArMTVMeGV4N1RwNjlzR1Nwenp4Sm8rK2dPTDB3d0szOVRNQWFv?=
 =?utf-8?B?ZGRJbFB3SE5ncnJld0tIZjZkaStVY0NhN09JeWRDNmZJMmpKM0dlUFNTRmYy?=
 =?utf-8?B?cW9qdFJOMjE0RUZkRTk0M3Z3aTREaFV1VE4rUTg2M1FQdXh3T2xwTHpQWTJH?=
 =?utf-8?B?TW40M1FmL2M4ZHJpbUc3K25oYnVxdXBneEhZTnk0d1dCdklWamdHZVJOdjZy?=
 =?utf-8?B?WHlxVG9Wbm9SSXB2WklsczcxR1YxUG5wYzlBNnJUbWgreEw2cFhzWnZsNUlk?=
 =?utf-8?B?Lzlab2dBMWE2bXNMSHF2aDNiYUNiRjFleStiR3JvbFNFZFcyR2JiTEdjNGR2?=
 =?utf-8?B?amU0UzUyVDRmR1lGRE5GbHdtZVVjUHdNS2FjaHBPS3hTejd0TmlVeEhITS9a?=
 =?utf-8?B?V3NnY0VXUVprQWZ4RUwrUFZJNkpxQWZoTjl0RlhsTVRtN3Y4UEVSMU12bSsw?=
 =?utf-8?B?OEc3UG9Va2dVZUh3M2hnZHRWSndtSExkZ2VqWjI4dzI4MkkyTzZ5VmNDTmhV?=
 =?utf-8?B?K2haUHN2MHVUYWQvWmxmQi92WjdBQnhDdWVJUlBRbXYzNUx1UlFLaXdqS1lI?=
 =?utf-8?B?QkN2OVVsNEQ3UlZGVnE1ZzhDbDVlSWtQUjhIVlp0bFJ2cmRZN243cXE2N1Rt?=
 =?utf-8?B?TjRpK3JybS8wS3lwMlE4Nnk3aE02bHFkeE9Ib0wxRlUyWE05eVdFTzFVeHZB?=
 =?utf-8?B?b2JITEFVc1JSYTZLWERndEIxVkxaSSthU2lXazlrb3ltR1prWlVNdnBpZmVo?=
 =?utf-8?B?dmRwN1E2dHN0U3IwOXdLVnpMdlVidmdncDUyelo2U3cxL1JvcGlHUkVodytV?=
 =?utf-8?B?NGhvVW1OMUxpeDBmSEUxdmxBQWFtZDJtYTJZOUIxM1JkRWR2RzFYcWVMVGMw?=
 =?utf-8?B?K1dEdmhmYk4zYVlrOUlSMDBsaXdJcUtsVzZSM3RNMU5kZ3FBZFNQbDFNN1JU?=
 =?utf-8?B?VHpudWczaEtRMjhuRXM0YkZQcXNzUUFtT0ZwemozbHhNSVVxZ3VuVTFOdHJx?=
 =?utf-8?B?T3ZnVG85a2xMS2JFdWFZSjBWcWh5NXlNREMzc3V5OVJsUEJOVDB5b3VFTTJE?=
 =?utf-8?B?ZXJMeGlQWnlUUk9tcGNNQVQyL3hUSFFYMzJ3ZHhkQTl3UDJSb1g0VkVVUWEv?=
 =?utf-8?B?NGN1Y1h0TmdneFE5cVZjNVRGQXJpeFh4eWdtQTBySEFzMHA5d3d5cWkrK25w?=
 =?utf-8?B?eUsyaE91NGQ5QWwzR0xGaWpaZ2dxVkZDSWI4eGhlN0pjSG9FMW1GL05RWnhD?=
 =?utf-8?B?SElzMUJ1WnFnNW45eEh6UEovcDV5akpkdkZQblB0SGVTc2RYQUJJQSsxci9Y?=
 =?utf-8?B?ODdqcXpXcDk3WjhTdDJLSEI1YVc4UzYzemdMNlVUWHhpbUxDRzB1TWRuc2hy?=
 =?utf-8?B?eE9UbXVLN0s0aStHYWRRNm1sd2FnN0FIdy9sNnVlZ1c0bGZOSThEemF1STMw?=
 =?utf-8?B?SlN6WjhDQnloVGNYUjRYYXpZeVMyYUZlSnFvVC83YVlPNkx1Y0E0Wno1dG9v?=
 =?utf-8?B?am9jem9mTXMyMGdpckNqM0Npek9ZbU8zM2U4aWpNTGNXclVTYVNwNG1HOTdU?=
 =?utf-8?B?NDRzb21COXEzRDJ6Smt0SFZJZGNvTkRNUDRkNG1JSGMxdHc3MlFSekV1aHZL?=
 =?utf-8?Q?TPBCo+jQo7LUXv0YnCfZAm0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa592c0-a270-4d5b-7702-08d9f6aad9b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 08:59:50.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcLusdkafBhtyFIG5DOZRnMgMwj01GbGNWXfmDb25kQi7xW9fEiQNmrjHmMr7H7oPVhjv0gbmYcaGox73Vv4Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2578

On 22.02.2022 19:52, Dr. Greg wrote:
> On Fri, Feb 18, 2022 at 08:04:14AM +0100, Jan Beulich wrote:
>> On 17.02.2022 21:15, Dr. Greg wrote:
>>> On Mon, Feb 14, 2022 at 09:56:34AM +0100, Jan Beulich wrote:
>>> In the case of the logs above, the following command sequence is being
>>> executed upon termination of the domain:
>>>
>>> # Unbind devices.
>>> echo 0000:00:14.0 >| /sys/bus/pci/drivers/pciback/unbind
>>> echo 0000:00:02.0 >| /sys/bus/pci/drivers/pciback/unbind
>>>
>>> # Rebind devices.
>>> echo 0000:00:14.0 >| /sys/bus/pci/drivers/xhci_hcd/bind
>>> echo 0000:00:02.0 >| /sys/bus/pci/drivers/i915/bind
> 
>> ... you may still want to try replacing these with
>> "xl pci-assignable-add ..." / "xl pci-assignable-remove ...".
> 
> We tested using the 'xl pci-assignable-add/remove' sequences and we
> believe this may have resulted in the proper return of the devices to
> dom0 but haven't been able to verify that since the Windows VM is now
> throwing the VIDEO_TDR error.
> 
> Unless we are misunderstanding something the 'xl
> pci-assignable-remove' sequence requires the manual re-binding of the
> devices to their dom0 drivers.

Hmm, I thought drivers would be rebound, but I'm not a tool stack person.
Looking at libxl__device_pci_assignable_remove() at least support this
assumption of mine. You did use the command's -r option, didn't you?

Jan


