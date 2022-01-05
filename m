Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F53484FAD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 10:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253530.434689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5296-0004t4-IQ; Wed, 05 Jan 2022 08:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253530.434689; Wed, 05 Jan 2022 08:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5296-0004qV-ED; Wed, 05 Jan 2022 08:59:48 +0000
Received: by outflank-mailman (input) for mailman id 253530;
 Wed, 05 Jan 2022 08:59:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5294-0004qP-Oe
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 08:59:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d30f02df-6e05-11ec-81c0-a30af7de8005;
 Wed, 05 Jan 2022 09:59:45 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-5wbL_VxBNCKwP36U8tOgVw-1; Wed, 05 Jan 2022 09:59:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 08:59:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 08:59:41 +0000
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
X-Inumbo-ID: d30f02df-6e05-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641373183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f4uOLk1yA8ftDIHqA7szN7tOuXuu/j2/qWBba+c54n8=;
	b=nUoXx5MZdXZKk17TGkxBtQYxm3SYVB2NbUEckUwzFw/USE+LvxjHIBR2175tjFLERLsGtT
	IOkK5OsyX39Z0PG5UTlKTzrztrvJ5vluRbNXL0Jh5xD+2LLXxu0PRT5art+3Om7sNqHgU8
	/ECMv5rsUMUjGea7TRp87YOfUV4DKJs=
X-MC-Unique: 5wbL_VxBNCKwP36U8tOgVw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNk7Wg5M6tHbUzJ3eBt4OUF/L9QNEuoxp61gZTlv92PKrE8WRSvIewTsk552TeyL8G3n/ylDR2qcKfdKmM2+BtzgUZ+CZeOPz6qwh0EOKz55aBzUds+AFOuKXZuj6JzeXlUDup8CaVIENlZlpUWlRG97VrCdcK1TksscEVLyzXYDIzJ0pSIpWaAjgVTT8Yt/N9Ykr5uXttQsbsWPSBX46UP0HWqM4vqlBlQCFOyjifjoLAXihTGA1lD2lnn/Q9tICCpnLF8XFgoZQ2E36YGoYh3RMSZqeaE5mPwyg5/oLVkThs/Deh+8N2pW42rW/75NMHDwkYaRAUKJYx6zt1/8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4uOLk1yA8ftDIHqA7szN7tOuXuu/j2/qWBba+c54n8=;
 b=RXh43SsxrIfCRdFoI7qxDf2WyHgxY7yaI/xE5m6XJdkO5OBRfqVw0DmHv7Q6h47Xv/CRTL7Qi/vLnmIHPG/QqsTfK4O6EoKJMjP9LZoV9AquDoEfW7wR40Q8hlh+7GpEVw22TVZltAJzOCywUntWmR5TJmFLyjVTQMudM2U2+pd5zg3Ea6nmSHhwnvMhByIZkhlmj0u4KbAb9hd787vyAyJlH1tTd0/VMbf3MleXhLGBjYUzpAxqY6tmPE1k4CmuvALXtBqXKPt5iVO7Sw5AdtyWht0rdh1NWaiAHoIUpCTtXd8B1NNcvimpjsWe2TbrfF4U57Jg1os3e2o53rWzoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f13f983f-9190-99d4-7a6d-c73be651896d@suse.com>
Date: Wed, 5 Jan 2022 09:59:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH RFC v2 3/3] x86/altp2m: p2m_altp2m_propagate_change()
 should honor present page order
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
 <d1b6aede-2c0a-df7a-7815-73ad4d795899@suse.com>
 <CABfawhmGxHBEC1M2=zo11K11Yr_TdWFkkVpDpVimy_uvD4nxyQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmGxHBEC1M2=zo11K11Yr_TdWFkkVpDpVimy_uvD4nxyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0049.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd8e09c4-7fd7-4bd9-ae93-08d9d029b5ce
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7149B0BC78F9E23017DAFF5BB34B9@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wlysrlqMP7O69/WO7uDX/zcq+H8X8t0HYvY1ku8kAbO+KqDWQFv/C5dZJAML60ncPSI8/p7k1WS3brM3eynjLbcq3pAX9bjkz2cOsFeJOzmUoVOhFEZzTi2Eglj61p1RD8P5OWHFdYlV5goCMDfBQP6/VGJ/zfjnsf9MZgm2PMBIQ/ECahS4EzYgdGz27gosNAbwAUuf8YYzFctr9BGf9L0tSZ/XcatO20AXfC6MOLO9OEDKllvwBc57cjpuo4Fz818x/9M+abvYWpP1PTDXso8ClvWWS8sKnZFkV3XlGJJSm5S08imdly+7ajTUUn3tDQfGATtWh2t2dbnJEOC+MnQq16wckbkCsd2rSx+h81+VAoWIJ/ZTJbRMNjjxivh8jfhoBnkPYnQzEL/ohp9kH5T2kXkP34iyzyn9YHcPkj1IF2MbKhU0wmT6TqkNR4DOzQuBqnOgS2NhpOfRIFPU4ZPVn8fd42m9qvVyDuiSRKKRWzfpZjxF+6zQHH3XaES4SupwDIIIPOMqtomx43+gc1/b82amnOSk/tQyJaD8CEAMH6fOtA0l1lXQU+p6365vAy6wTQtK+vdlYd89CizeG1h072CRa1ajGORDMihRC/qHBYoZXnA6/6Yus1grwZnBDqUh/DI1RnkVYEIrWINsCY4WDyAu9ZUJKbGUgZzP+T+Cnn16XKrp7oZ+vORSuQs3qkqVCiFzvRblXSpEdg+B4rc0pcflnYATlKcEUkZfRqipP9vCqqoEj1TFaqKJd4Hq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(38100700002)(316002)(4326008)(31686004)(6512007)(31696002)(66476007)(83380400001)(6486002)(26005)(66556008)(86362001)(2616005)(2906002)(5660300002)(6916009)(8676002)(508600001)(54906003)(186003)(53546011)(66946007)(6506007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE1FWnZ2NUhiTG1hdFNYNmhsbXRwZW9CamsxUVErckZtUmtDYjVmcm1SK3hF?=
 =?utf-8?B?VlFLeURZcXo3VGM1RE1DQnlYaU5TWDBKWTN5bVFobjRoS2o3b1gzTnhIWEt4?=
 =?utf-8?B?L3M4dWVVQXVheEI5Q3ZvKzYyMkZoMTA5bENZREpBOUdqd2RVNWw1VmdsdFpn?=
 =?utf-8?B?czBlc3F3VjRTTW9MVXY2ZFlWZnBpQ1Qwc3dzekxSSnFxZERERE1NT3RTd0J2?=
 =?utf-8?B?V0hLYXpXSHowZWdnTDFsSitGYUpGaUhFMWd4ckFZUzFQLzJnRWUvSXhmK2lX?=
 =?utf-8?B?V1JuYWdaTWZ1YmJnYmZDdnc5alpRUFZFSldZNDJDUS9rWVZuMjNGSTNjcDRQ?=
 =?utf-8?B?c2lQYTlwYXVYZXZGZmxYM3hDTE92THdJTFA4M0NkbUdaSzBVRWpiNXhnNkNP?=
 =?utf-8?B?R1pwSCtQc1NBZjhEaDBVMGx2WFptN1ZUSTYyd0h1K1ZSY0ZTbkRERW9vblRZ?=
 =?utf-8?B?VVRSOURmbnhwNGgyMDRaQVJFWkVqT25QOUNNcDlRY1lFekFZd2dlU2ZORG44?=
 =?utf-8?B?L0lPUHFSRlNtSVdOVHIzUE5aK3BvTXd2cTh3RHZpcTRjaVBXYlNkZ0x2aGdC?=
 =?utf-8?B?RzU5amNzZGxNaXdpTURlOXhQcW1yRXdpVnpLWVVBcFBIRGNaWmVRTlJXOHli?=
 =?utf-8?B?VnFJT1o3bUFwM0NhcDN5aHlGNmRzei95akVIVWFVN2wraGpNWjB1NjI5d1A1?=
 =?utf-8?B?QXgrU2FxdmFtVlh3dzVhanFtNVZTZkRkZDl4cHd2bzZhUGdURmFIT2E3bmVQ?=
 =?utf-8?B?ZGxWaUtkMnVxaWQ1MnlPYXkrb0xqeitDeWJtbGM0ajZTMGJ0VGVaZFhzT01z?=
 =?utf-8?B?RFY4V1JrOTVKcjhEV2FXYmpmZ0J1M2lFcnltYWpGTTBuOE8xTlhqNzh6bDI2?=
 =?utf-8?B?SmdDS2hRdFIvTGhOWitQN3p3T2drbWtVYW5YaFY0cDRRbWJtSWNBRnU3Q01Z?=
 =?utf-8?B?YSs3S0xzM3M2OFlUSXR0ZWVyc01aRlhtd3FKc1hCaStpWkdVd1pNVGttZFhh?=
 =?utf-8?B?NEpvdElJWkluMVlLZi9waXZWenlpV2JhVUc4bEF3RWpoQVFDNSt6dm1Db2pv?=
 =?utf-8?B?RG1qTmtrTnMzQndDQ0Vqb09XZGhKTy9GSVlXZEVIWG5OcmkxNmIzWWpOSG1P?=
 =?utf-8?B?V0RYZktBODhiVmMybUg2Yy9yRms2cmdFazg3N0NyWVhHVUtuTkM4aVd1ayth?=
 =?utf-8?B?OXY4Qlp6aWdKaW4wRnlZd1IrUC8yblVsa2VGSUFyRnhCLzJ0dXRZM3BSV3JD?=
 =?utf-8?B?Nk9YTXVFaEJ6K3RiWkFxb3h2SkZyYWJET2E4NVFzZ3FKK21Bd2ZxWWlPQmhK?=
 =?utf-8?B?Z2V2NTBuenRkTFI1eWV0NUxyQXAwMXlrcGtRMWlhNVlaT1JOOFVFY1JYUDJB?=
 =?utf-8?B?VU1xajN6b2Z2V3BNMnJLdndqalRpSUtxZCs3Q05tSk40NkczalFvaExxN3hr?=
 =?utf-8?B?ZDBKNlZWT3dSNUNvMUc5UUxodlJhMVVQQ1VOcWRaMzNwTzg3SXRINkd1Y201?=
 =?utf-8?B?czV5Q2Q3M2JvQmRjZElIak9pLzQ2M0FybzVOcHdhaWphcUQ2OVpxY3dzUDdi?=
 =?utf-8?B?RTdiZEJjRjZ6WEE2T1Vkd05CQmtYRmx1cG9ocTdsNzNWL3RUS0lqOU1scXRQ?=
 =?utf-8?B?UGtGc2ZmSWt6RVc4N29SSHI1NmVTR1pjb0hEbmhPMElEWS8vU3JuUm1GelE0?=
 =?utf-8?B?dVBpLzBiZGxEN084eUdsdFVidjFzM0UyR1ZUU0xpOGg1eGVNU1FzeEROeEJk?=
 =?utf-8?B?akg2ZWpPSGZkMTRHZDFESkVEWlY0aXA2OFJ6NG53VXFnMlJoNFlxdTRXU2pP?=
 =?utf-8?B?dWUzT1dObUF1eHk4eUhFZmQ2V3h5WGprREU0VHp1eFhibXBhanpNbUtadjdP?=
 =?utf-8?B?S1V2YjZSM21RdkpZTVZMd0ZKTCtaR2FJcVJESFFydkNWWUYrVmVQdi9vcHVt?=
 =?utf-8?B?d0s2V3lpSDJYVDY0b283L2tqUXp5OTNMSnJNb1NVeStGcjZqS09BQ1h2VEdG?=
 =?utf-8?B?UmlXdFZGeml3dWxLQkJObWNTbWhzaHlWM3BIQVVmQllHSFVHamlLYVFxK0RE?=
 =?utf-8?B?ak5VWVVsenlEQTNyK3kwMGNRV2kxcWdSazVQa2pBNXY2UlNXMGVTMVZlcW1j?=
 =?utf-8?B?MTFiS1p3MVpSS004UFZxQzkxR3psOE1lWmhnS0UvYnpwNzBXb3BHcWxCd0w4?=
 =?utf-8?Q?FF6m7f1KbJJ9uhGYYFDdK+c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8e09c4-7fd7-4bd9-ae93-08d9d029b5ce
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 08:59:41.4702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWIf2YsOYYFrfOIr4o/rEhiExk/PHUmSu2P7avnRlEbxO5PXw/BxzuIdfzsELJ1rBt3Wndm6Tj8MaFs5WOpw9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 04.01.2022 18:48, Tamas K Lengyel wrote:
>> I may be entirely wrong and hence that part of the change may also be
>> wrong, but I'm having trouble seeing why the original
>> "!mfn_eq(m, INVALID_MFN)" wasn't "mfn_eq(m, INVALID_MFN)". Isn't the
>> goal there to pre-fill entries that were previously invalid, instead of
>> undoing prior intentional divergence from the host P2M? (I have
>> intentionally not reflected this aspect in the description yet; I can't
>> really write a description of this without understanding what's going on
>> in case the original code was correct.)
> 
> This function only gets called from p2m-ept when the hostp2m gets an
> update. In that case this check goes through all altp2m's to see if
> any of them has an entry for what just got changed in the host, and
> overwrites the altp2m with that from the host. If there is no entry in
> the altp2m it doesn't pre-populate. That should only happen if the
> altp2m actually needs it and runs into a pagefault. So it is correct
> as-is, albeit being a subtle (and undocumented) behavior of the
> hostp2m and its effect on the altp2m's. But that's why we never
> actually make any changes on the hostp2m, we always create an altp2m
> and apply changes (mem_access/remapping) there.

Thanks for the explanation. Effectively this means that the call to
get_gfn_type_access() can simply be get_gfn_query(). For the patch
this means that I shouldn't check its return value and also continue
to pass the new order rather than the minimum of the two (as was the
case before), as all we're after is the locking of the GFN. It would
be nice if you could confirm this before I submit a non-RFC v3.

What I still don't understand is why the function blindly replaces
any possible entry in the altp2m, i.e. any possible override
mapping, not even taking into account the original p2m_access_t.

Jan


