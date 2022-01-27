Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A1B49E311
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 14:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261468.452765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4U4-0006ES-DN; Thu, 27 Jan 2022 13:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261468.452765; Thu, 27 Jan 2022 13:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4U4-0006Br-AK; Thu, 27 Jan 2022 13:06:40 +0000
Received: by outflank-mailman (input) for mailman id 261468;
 Thu, 27 Jan 2022 13:06:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD4U3-0006Bl-5K
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 13:06:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f62a0c96-7f71-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 14:06:38 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-ynIPP-DNPeOEeqzGLxYi4g-1; Thu, 27 Jan 2022 14:06:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7357.eurprd04.prod.outlook.com (2603:10a6:800:1ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 13:06:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 13:06:35 +0000
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
X-Inumbo-ID: f62a0c96-7f71-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643288797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YTbiYMKeLeRRmUX8jCfhFqVZvJXEo8KcAB5kW2YxVWk=;
	b=HGM768QL68oYDfdaVCb9cuH1/lI1xTVFWvfxdbJv7Oy3Y6ulBF5CRX++iaGGChIKtWJ5YW
	mMIPJsp8b1JjV54foC31e09C44/r3qev8G3MJkgxO5PA0JGEBfHuUBXufZ5gtVQ6hYSiG0
	ItM3Yry4Th0Y+nOT6g3NkVFRPxFCMPU=
X-MC-Unique: ynIPP-DNPeOEeqzGLxYi4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwnxHPy5iIvf1GNdMDx6ldQUvXS2EwzryFEfUdsLaSa/znesyaKsDCpnOfLDwruSQFVTX9tikg/kVECqMNHKFRl7LjApp7HwiwStxWS14oLUleH10JAynO+atqTs11cnxHBaDnirTWHrWT0kn9B9d+5r+GgCbJGCcej5aLALPNL6ACfhl9zefkfrGwiiZ7ivoH4L5lVSJWq1LCC+aiPaAd3Z1cTsijx5LJeYWC8n7lJ0Lsvu5hhmthTMLHgih/tu7v+/NUZx0BWRP4yT70N68R0pIkH5wYY8NaaAJBsVBVJmkWKnDF29dTCTeYKNm6ZQwVasT4pIarmG+W36QsE6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTbiYMKeLeRRmUX8jCfhFqVZvJXEo8KcAB5kW2YxVWk=;
 b=mZt7JQkli04EbbNg4q+ClUvB3MNNRzJLbQtJTCwV8oLgE7DVyYug/JLka614v6VBtNFQUjn6ypS5p/Sjg65GhHK8WaJGnbP6ES/BILCd9mxI3XmtDPhO1AQT+ifVbbRKSuIqZqVBwqQgP7PAP18e95rLogiJglUZ33k7UlJ2ByzlZ+HJqNKF0z0u4LlpDilrKeaGA+HtRksWq1+QQ8LE6QpgOXNj/NYHP4ek68eXDsnkcbxsmBTXoqj0WCeGW8wBlDtrdhckWVvfvdUitfzmiDopW8mH1q0Ppg3vpvmIxj0XYH1pO4Wwk9iQ4q7MqZ9YfV31FEKICB3eHzwV28BKGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <277503eb-c6ad-af30-5736-e68bba87a313@suse.com>
Date: Thu, 27 Jan 2022 14:06:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/8] x86/msr: AMD MSR_SPEC_CTRL infrastructure
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220126084452.28975-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef46c6c6-9ece-482f-ce75-08d9e195d8de
X-MS-TrafficTypeDiagnostic: VE1PR04MB7357:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7357BD74D36CFADF8026B738B3219@VE1PR04MB7357.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2q6VW0bGGXK/PcIeB6DP4crOswcLjPeuJviP3DZ8lU9q0587ynz+uRekwmvjk2Haf+Lm6ss0M8QxRDuqXJI87N4/17uxNgaHCNfZxVG2L8FqrXx0+NB3l+UASvIt8Sy5BOUQmEP7gwVkfprhVMaByRsRrw/AlxU4STRTR7UQ2/aZkBfTRFHh2O1zITWX5pkOJjXGcSLIRhodh/lXxZhD68VzVhN1luUoLvqm0SC/XVdnG9Fl6/By8/cIFe1E2qJhNC7w8NqXV9/Gc2M2apZMfrC3hGtWDM6PM3fVejpdPcd9xWfBu6gMyNtc2020KZstEKhgiMdWHuSxClfCVNa2z6AkDBPPpoz5VG+cxhcwZOfCK6sGT1aDanqsx9ZcUbRGzxHawr0Lq1hZSQ4JPkwVqCYzty9w+vphoZPwJnHykNoK3hokr6w4GgWUiZ0ScUL9xtWWyI9jSKS35U57jbiu8MO7QmLglHo0kZYUCJLhoNRX8y3u0seTcKz/dTT2Gqvh2n0LfwUv7/EKfO6NjazWhMHCWA3/tdHQM4VbSpz2ko9gGA4/SCS4Nr4JUTcMWiaPA8N9eMAHBk15IrG/oYtbESV6fImM3kfE3jJX+nyZ1xmH2UUWA7rmOIFeq0dHfHJHFHDKSyTHso1Qk2juk4xSoNn85M8+kkhZK+8ol2lCUcH2xx8kLek1aGHS4frPD75CX/lWHvZj+4edcAV80BqZm0kFKi97e3PglHL8UIaZS7DzaaGPlYAvhKz39vQDbA2p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(558084003)(8676002)(8936002)(66556008)(66946007)(6486002)(66476007)(31696002)(86362001)(4326008)(2906002)(6916009)(5660300002)(26005)(54906003)(2616005)(31686004)(186003)(36756003)(53546011)(83380400001)(508600001)(6512007)(6506007)(38100700002)(316002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUJOLzNhcUp2ZFJYREE5SzU1OHJ6UzVMWU83dUIrSjl6YlFLYXd6V05QQ0kz?=
 =?utf-8?B?dDVVaUZLd3BIZmxIVjRuNGVJdVhtdVUzZyt0ODU2Q05FbEFoekYzV3N5Z0VT?=
 =?utf-8?B?Ym83RCs2NDlhdzVjS3J2dU1RZTVFa2VRVmFDQmJpeG03TEVzRGNvNjB6M1Zo?=
 =?utf-8?B?UzFZd052bWxPU0UwU2dkU29TRGRBUjBGcTlyY0JLSndvTWdOZkNPRUtkVDBs?=
 =?utf-8?B?T1VCSEpkZkV5dVBUME9JUFNpTHlveTIxVXNQUzJKRUZOTlgveUV2dTB2WmpG?=
 =?utf-8?B?L0FSSFo2Y2ZKQlVzenFMZ01oY0w0WWdlRmF0RUNoZFRwRk9PYzFaOCtiMmhy?=
 =?utf-8?B?cHB1U2ZpZnNRaUJ2YWJxS1QxYzBKNTN3anhLd1NQbFA5cWpnbWU2TzVtNURv?=
 =?utf-8?B?dUQvN0hIYmJxT3ZscTdRc2dOT2NPLzBwTXNwVDEyQk9ZbXVEMW54M0kxNk5Z?=
 =?utf-8?B?d0lJVFZHNUNsOVc1aE51TGpMOWhOSzNkdnlybzJYREN3QmFPZVZKbXUvOVZY?=
 =?utf-8?B?cGtvTTgxN3lJeitua0lXaFFNYjlWYTBHdHhWZ3Z4bkpYNWp2T2NsKzhaWVVp?=
 =?utf-8?B?VERxNUtmeFJpWis0dGRRODBBNEtNYjRpS0dqR0hFM256WVZvcXJaTEl4VE1S?=
 =?utf-8?B?S25HWTNtRWNtMEdaaWRjVDhncE1ncTg2YTRud2tacWQreS85cmNMU3FJVXdG?=
 =?utf-8?B?ZlJwTHN1L25idS94OGJMSUozcFNVckI5TWdxbGlwa0hEZC9ZZnc0WlpCVzI3?=
 =?utf-8?B?b0ZJU2VqL3RCd00vQ0lSNHpRNk5rVkUvSnV0RXVZeHAzbHpyWDhTQ0xESzFj?=
 =?utf-8?B?M0hFajJyOTEwQXRBVk1PZEdreG92aTBEVnljOXJWUWswdE50R3MrbEhzNC9T?=
 =?utf-8?B?VW9NTk1YaWpsamdVRUI4VVFMSVhDb2oweWc0SUFtRzBqNUFOWVRJelgvNENT?=
 =?utf-8?B?WFRlWUxldzBVeHFrYnp6Qk02ZlI1TUhVRDBlaGtqV1VvdWphOEpDRmZXdDY3?=
 =?utf-8?B?M252NXJiZzBEYnhtdXZ1OFhLZ2tqWG5KRms1YnVicTR2QXpvZDh6TFY2bmli?=
 =?utf-8?B?bG1FOG1SUk5QQ052N1NmZmVMQjR2OTdPWjZoREFQZ1N3eUdTSzQ4YzlkL0ZG?=
 =?utf-8?B?SHJXdnZOWDJJZm8xMEFWQm5vWFRCZ2JibHJ2czlxQUl4YUlnSWdxTlNzTmN5?=
 =?utf-8?B?Rjg2cjVYWnlKRXpKOGo0cGFoSmp4NDlUTE1IWWRybkUzVlRaenhqVDJueXlS?=
 =?utf-8?B?c3p3UEtzVnp2SzVFZmhWZTBCUzRRNDFzeCtNTlZ2cURMU3EwZ3d4R0JmYVhi?=
 =?utf-8?B?UXpyQ3pFU0dXTW5SVFVvYjRlTjFFdmhrck16MWZCdUF2THhMdHVXM2R6ZnFr?=
 =?utf-8?B?TXV6eTI2L2xiczdFSXdhZmE2QXlQL0xUajV0S0wzVkhaR1lHY29JMlhQNDJ5?=
 =?utf-8?B?MmVqMEo4Mm9pUlVhU2dxMHZwYmpWdlRKZytUM3FVejlpU0F5T1NtUVhkMkh0?=
 =?utf-8?B?K0xPRWZDS2k1eU5wTUNkQ2ZzcGhhVkhlU3FmUndHRUFtVDFuMjVzTlBMWFBQ?=
 =?utf-8?B?S0hIdTlWTGVGR1EvOUcxQXI0L1hGZW4xckFIMXB3V3pDandqVlozYkRtZmRX?=
 =?utf-8?B?eXdsQVVWSHZXRldFSTI1RXIzQWtoaU0rcDVZMFRFdTFVR21ZdTk0RkJBNzJz?=
 =?utf-8?B?eWRKcW5yQmN5Y0FCREdWVHA2R3V3amFBV1Fpc2pCRDBiNjZ5NkFnQ1k5clRa?=
 =?utf-8?B?T0VzZzdRU2prWldVbkRrNTlQYlVpempMVEpGdncybElXRnRCZ1VWZmJXNlhJ?=
 =?utf-8?B?Y2NHL2Fzclo2Y2RkL2NxaUFGdEszSTJXOHBXSDVUTnltTk5RbHFzQ1F5V0VU?=
 =?utf-8?B?Rit4cWVoRDl6bFdIWlZKMjRhV2x6RExqYk9CSVFIV015UkFRbGlqVFlXOW9U?=
 =?utf-8?B?NGFiczZ6RnNUeWpiUXN0NW9rQ3JUUWdKUHpNQXRYU2Fid3ZuNXpLMmo5STRh?=
 =?utf-8?B?UEhRTTd5QThlV20yaS9pTUF0SXl2dFJCdXR1ekZCSXB6dnVlSTdQamQyUW9I?=
 =?utf-8?B?NWdtWG9YR2FDYTVhY0FaKzh6bEFTNmVYSVlBQkdCS2Z5V0RXU3hxd05IbzE1?=
 =?utf-8?B?LzhYekg1dWI4T0QwZjlrWDVmbVBPRlFCb0lHOEVDWGQ5b09nRVdqSXVJVVhX?=
 =?utf-8?Q?gUZISi1GB36cwkNWh/c4YCQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef46c6c6-9ece-482f-ce75-08d9e195d8de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 13:06:35.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAnJhBIuVY7BHsAx1VXCeFwo6TPdog2Epwt5HzgU0hqjiqcDs0cxy0rI/dE2StTZ93YpPFRl7ekDYOUsN3UqiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7357

On 26.01.2022 09:44, Andrew Cooper wrote:
> Fill in VMCB accessors for spec_ctrl in svm_{get,set}_reg(), and CPUID checks
> for all supported bits in guest_{rd,wr}msr().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


