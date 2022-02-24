Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B180E4C2FFB
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 16:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278428.475676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNGBq-0004KC-8l; Thu, 24 Feb 2022 15:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278428.475676; Thu, 24 Feb 2022 15:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNGBq-0004HN-44; Thu, 24 Feb 2022 15:37:58 +0000
Received: by outflank-mailman (input) for mailman id 278428;
 Thu, 24 Feb 2022 15:37:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNGBo-0004HH-Jg
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 15:37:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc402522-9587-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 16:37:55 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-WCrEa5sPOWq_q6mNZtihVQ-1; Thu, 24 Feb 2022 16:37:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4212.eurprd04.prod.outlook.com (2603:10a6:208:61::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 15:37:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 15:37:51 +0000
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
X-Inumbo-ID: bc402522-9587-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645717075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BteCfqwDRFkREaQhnGaLNsECpBk6t15po9zqcuEo+Cw=;
	b=RBE6cpg1I68ewKLo9AZF/P1cmlPfGUHznisDSQdmyQAQRyLuCuFq85CIASHn2sMm2hSI+F
	mKtCannFjKOjJrml9reV2+qhzWKSiPXD+rrgNMQ+iVUgXA7jeGsN308gGtd5tW7Ge8WXIP
	oiTuslsdmnsH+tfaAxx2qfxc2SJqhl8=
X-MC-Unique: WCrEa5sPOWq_q6mNZtihVQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBhcCQCbTQiLUucLfOaxzAApI9CTLkRBIDlka8r0yl+0kkQYkjrf8AV81qP70HLUgdsI5ycATnIryahSE6H08Y7at4DASwKF6Po3mT0+ZMq5UXQYTgkKiJaTO0oKmVFORhT/injo2+gEgUt/w/WXUYzrts5Wr7ntowhxv8ut8vtpqkGuLpfeSYj+CAe+iOPlzzIZU8b5+B61HAWK16Kcwkh1ParmgVkuUY9OzGXRxubLqv/vbMzUlkOR4WM5Br6pAo58Gn3nPyJ3oeS6z2KwwXqtGxJuHONK2ZhIRPsP3C8zolO6fWbcU7KsP3+pCpRTgVAHZ9ZJDaBw6P1lYd5Qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BteCfqwDRFkREaQhnGaLNsECpBk6t15po9zqcuEo+Cw=;
 b=hWg1tySqrpj4s4iljgYd66dTok2hKFsYNp/vUehdlGVaAADvcfc4/K87oblhQ7YwAotxeexq59SywwCL4l9Bm8RlLcId3ZdAytxMP6zia0NNt2fhATn2RI/3y2x5wgl11JRPTKgq/XCuLGxFKhkLobOBMAVTFYL6nRiC7M5zZGFQhovtaZK43g+Mmi04OhL0+N45SMGFRAvXtHWP9xP+MNlqqOAMjbjePRWMOtUrR/9k3RUtmGCqdlD99Q15D3XIkErm4amTC+47WRSDgNrY/CDVlfdRn57iOe1kYCGZSJa+utjgnegX1M/Lf4TG8J5Op5pcYjrDSi8gvmTwmN6KOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9972f96c-d0cc-d9a8-3566-74dbaf7e9e33@suse.com>
Date: Thu, 24 Feb 2022 16:37:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] xen/public: add comment to struct
 xen_mem_acquire_resource
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220224152414.27948-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220224152414.27948-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa968758-4f7d-44d9-c80b-08d9f7ab9e54
X-MS-TrafficTypeDiagnostic: AM0PR04MB4212:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB42122F73138A997FB5AE5784B33D9@AM0PR04MB4212.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PRfSfB1ITTI4x1cDDhiK7zajd+qlZLe6djQ81+Sb03Ux3P8byRBy2Mr0z8Tfoi1hUD1gBN75QxCqkzgzm53sAUfAjOU5Wnk/UfGe7aF5xheTXJFbRMKlAFmcCYujo7wsStBJ3AKR34MLQZ+R6HuAcCJbBBZ48F0jFm+A+PK1fz2fGGnmIyJUFtCtDXQxfjBLmSNnrLG708oiajLfERZQL4s3Y5m8e77oR6MvjVFFvXGbn7Be99CmUESJdE8/hYiZ4eDBfkb+kxns7LjYLhSehSUMMMpsnFrxsCbFvpOd4c7SkOmCIQH3Z1AY1eXZiUZXGvIAaznez68SB03ZGCY8uCeS2uvDX2WB9BxtpwKiQG3i4vzhNsG941q487PJx5C73/cvamq0gpatO9GuZSJzdapAFYqLSY5NW4aukJriTt1s488M597KZawdALRyYvLqhof7JIBXT5JwiqMiq8EA0mAODCM7hZJtLeBGyvhKd2brTRoMEzvGB6a9JPtRqyX7MYJcyT1vybPh7RGfKW7wkQWs+h0R/XmswCUFrLHSaNQB0IJCALVxVltEPWpcxA6kaqpslEPC88SQffLwaNm5y1uQAm0sHfOdGMoc8czN+zYnASS7kf0ea9urKhx94uZ9HT+5NxY6b9axAf2hQCbeapEo6lBTNrZ5+gLpH5yAZoWXk3FcEwdDI1jb2o49qhfAnHGc5c1tMTwPxvCTNaYqpdoG8w0rHj0kBPnO0jpb+4I1Bip9mtCl+/aOEgrnxq58
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(8676002)(2616005)(66556008)(36756003)(5660300002)(316002)(6862004)(8936002)(66476007)(66946007)(26005)(38100700002)(6636002)(186003)(31686004)(2906002)(6486002)(53546011)(31696002)(6506007)(4744005)(37006003)(54906003)(508600001)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1o1UDFoWndoVm9JSEFhTTVJQ1ZWTFIxZndwdG1EbEVDRkhRN2tpeHBLMHo5?=
 =?utf-8?B?S0VJMmF0YzZlRkpnNTJmeWlCNGJPeWw1anp6cGJEU3BzTjhOaVVzM3NaRFRi?=
 =?utf-8?B?YnZWdWQxT3hzMTgrbWFHci9ldW5ua2RjTlZUVFYraXFlZm4zY2RiOGR5ck1x?=
 =?utf-8?B?RzVyNUNUSlp5Unc1Q05yQzhVZ05VV0hlWlBRMWZjOVhmTGdwKzdvUCt6VHNI?=
 =?utf-8?B?TzRmVGFkazZWU0dFaWtxb0hMUlQva1RFZy9PMkRPblI2NmpMbmxGN0JDTGw4?=
 =?utf-8?B?dFFhRmsxVVhLMkYyV1pQOXVMTDIwS0ltZERNVEVHaXIrZVpJMWRoYzZPODJN?=
 =?utf-8?B?L3NYVEU5SUV6WlFJWG9IWVZhMm9oRWZDY2t4TE1wVlR6TWhhazBzdG94L0Vz?=
 =?utf-8?B?TzNkZ0ZLajh1YnRQNjlYdE43Kzk5aGpLa0hObWhObGRsOWNaWlM1dGVpTTdt?=
 =?utf-8?B?cUhpY1ZwRlc3QTFoWnp3Q2U3L0RwTVNGbFF1NytLUExLbnVoMFE4cG5iOTg4?=
 =?utf-8?B?VWJnQjh5cjBqekExWm1jTUJNTk9LcWU0QmVyRnpLOEtZcENjVkhsamdVQWhT?=
 =?utf-8?B?RkFFOU1NZ3FnRzk4VS9XR3BIbWgzRXpUUXIrbGxvSkF6U20zSGJxZXp5SzI3?=
 =?utf-8?B?T3dySDNtVXRLNm8vclc2OVZnYjR2RHhKUS9EdGhrQVBqSnNEMkNyOUgyaklD?=
 =?utf-8?B?Zko1S0JYajkxeXZMT3JMNVNSdUlWYkwyRnRzRU5wZVphZ1l4M0VRODF1QUVv?=
 =?utf-8?B?Ny84M2l4SzE3SmhFZmI4MnBwTmlRVUh6b3FnUTYzNkxDU0l0K0Yyelg0TzRz?=
 =?utf-8?B?dDZkRUcxN2hTcHV1Rjg0RzI1dFdCL0dMQkw4dEdWeTNxNVBCSWRoUXJSYm9H?=
 =?utf-8?B?YlJKYnN2c1lEZitYclVPSWR0bi9SYmxSd1J2K2VkRHhyM1pWQnF6UnZqejVw?=
 =?utf-8?B?cnc4VGtVR0w2VXBDSzFJOVg1RERuV0dxVXA0bFdPV0JBZldJaFJVTjRIeWV6?=
 =?utf-8?B?VStwR3ZXVU81OTlCTGxnak00aUdQWWE1bGhtYjkwZG1yVHhZa2JzcGFPQ0lK?=
 =?utf-8?B?QzVFN2JjTitpWXI2bk9mbUxEaFhkQnRlMWI1UUNMU3BHVmQvZ2xhNEVVbEY3?=
 =?utf-8?B?bU42WFM4T0NGbjBDU3BmbXdwc3ZyUE1oMmJzWDJCZlFtVXk5dXZjNk1NeGZF?=
 =?utf-8?B?NmZ6VmQ2eGJjSkI3SlZoRU1QRnc3SER6VG5Va0NLODhwelk4Y1lNK3pHWGNK?=
 =?utf-8?B?QlArZVlzamdObkkvbDZrR3dhbnZMYk5XMTFLR3RzZ283aHVmSTg1VDlFZmtZ?=
 =?utf-8?B?SFE5blpSdHQ0dEFXMHV3SzF6MUpEWDBISnVacmRncS80K3VsZXFxQ0dBTEcx?=
 =?utf-8?B?KytyVHI0Z0dQdndNVVNKUW5vck9jY0pFR1luaEhiT21WQjhmKytEZ3Bldm5y?=
 =?utf-8?B?ZTg4bFdieTdIZlQ2OURqeU5JemttU3N6VnFOZWRQZUN0YmoxZHRCVnQ0Sm9D?=
 =?utf-8?B?a0hQS1ZNTUxoRTBzei9Ra3lvdUtnWnRXQjhSbjVXZDVHaS9hTGFlVnFSY1dx?=
 =?utf-8?B?YW10YVhRMDBjdCtqUHdYQmViM2J5YmpFd1c5ZG5hak1UUmxCcDdnOXNML0VJ?=
 =?utf-8?B?dWpVT0t1ZFlGYXJYd0t6NUpmeEkzNTVjTkhuQkVXRHRkamFzWm5oOTl6TXVL?=
 =?utf-8?B?bytRRkJCU0FZVHZraVQraDFqNFhmcStvUGxnenQxekozTFJ5R0sxa040TEFi?=
 =?utf-8?B?VXhTUlJQRnpLM1pQbHVNZnN5V2wvVFEyTHB6MCtidlZtdUdmRVQ5MStSdjFN?=
 =?utf-8?B?bkZZelQ0NEhPUk4weHlhK3ZWR2NnTnByeEh4ekZIRU12emE0WlpGcmVic0pJ?=
 =?utf-8?B?ajJhaFI2K0dMVFQ1UFlzTzdFQ3ZIRVk4dzk3eCttTGVjdGxqNVNRSGlPTlRW?=
 =?utf-8?B?RDRUb2MxRVYvQ25GVEhvZU8vaFdUTDM5dExEdGlpWUoyUmprNUtUOWx3Y3dO?=
 =?utf-8?B?N0V6bDVnVDZ1OVMrNTBhUEJzTUNSL0FHZXkrZEQ4b2xpYmo2V1dLK0I0SC9i?=
 =?utf-8?B?MjJOYXhDdFJrRUVTVTg1djRKbzZleE9KVTkzWG5WSW94b09YYStCZHNZQTR4?=
 =?utf-8?B?aVgzN1cyYy9aZUVZK1l0Q1N6VFJqN0J3T3hUdjFpWWo3WGpNby9oWlY2amFw?=
 =?utf-8?Q?TzCiQYCgCCv3xPlSsbOQluY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa968758-4f7d-44d9-c80b-08d9f7ab9e54
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 15:37:51.8710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMP8jAAw+IMWbOP0ohhAFx1BOMplHYPvq83HL5v9SCwfMzyI+0j+2VGBf4bL5uvbtZ7usAaX1zLEuftgcw6U2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4212

On 24.02.2022 16:24, Juergen Gross wrote:
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -662,6 +662,13 @@ struct xen_mem_acquire_resource {
>       * two calls.
>       */
>      uint32_t nr_frames;
> +    /*
> +     * Padding field, must be zero on input.
> +     * In a previous version this was an output field with the lowest
> +     * bit named XENMEM_rsrc_acq_caller_owned. Future versions of this
> +     * interface will not reuse this bit with the field being zero on
> +     * input.
> +     */
>      uint32_t pad;

Did you mean "... being non-zero ..." and "bit" and "field" changing
positions?

Jan


