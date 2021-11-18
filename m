Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C10455957
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 11:45:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227322.393143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnev8-0004I6-1Q; Thu, 18 Nov 2021 10:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227322.393143; Thu, 18 Nov 2021 10:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnev7-0004GK-UR; Thu, 18 Nov 2021 10:45:33 +0000
Received: by outflank-mailman (input) for mailman id 227322;
 Thu, 18 Nov 2021 10:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnev6-0004GD-Jn
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 10:45:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6c6b7c9-485c-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 11:45:31 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-v-Y0ppoBNv6dSyMtAu7MJg-1; Thu, 18 Nov 2021 11:45:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 10:45:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 10:45:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:20b:462::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Thu, 18 Nov 2021 10:45:27 +0000
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
X-Inumbo-ID: a6c6b7c9-485c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637232331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OThHxnLMh6a/fp4/DH5Ojoo2i/SoiQIGmuNLzLU7vuE=;
	b=YBuaMpWq1XKJlCQQRefDAWmREnFtUjXl0iSZhifM/v9/77zVC8WexfJvoKyNIZDAJTjCox
	1onUnyv8HV8cSynEOKNpBtwRuct4TSqbarRlk47ngdUZ0mCeoH2OZ0//85X66D2ZWpEcYV
	UHQ21mnAO1A/t6dRgjipWzURUF1v+dc=
X-MC-Unique: v-Y0ppoBNv6dSyMtAu7MJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwhCfzztOX6co4uzM4PNiL4cxwHW5hCBwGF4b3bSQfaIbafsuRLDVilVbXwgY+smcE4s1geccQ9QAkdfppCm8yYJ1TKgvUBvqfgij12UQUMW2nvgm78eBtVe0HkAt+MZzBna0oQnzJ4jgsbW0j5en+36mBcfdNv4IPwA7GJVkF666DLvA0gG7tfrLnvKhSCbPupKdaeBl5CZd643YmNPWna1WjnVMVqMQL6l7wsE9ILgA7n0/gg3ZrDNRUkqir9GzNjGyeqx0N4M42e2URsvNRqFOIh4FBFk2QnqhNA5hHEpzZCuy5f+TVWeXJb4fvANXRbm+dlzgZfu60wPcu47Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OThHxnLMh6a/fp4/DH5Ojoo2i/SoiQIGmuNLzLU7vuE=;
 b=OtbIWfZmqjlVmbfTB/PiPjenOyNnAjGDJLBvwj5OrlsZfn9jJNspKeiiTKhciOSnIW4wcmwO7GXshQViIlYAazjlJbRQY8js+coSvY0QO03gAEvxJkAfgkd3k0bn/upD5dSF6jXb4iWLfPKTC+qkiMeZiF5KpHITViZa1zNIm2EDfMJCAay4ET/MB8xvuI8zK3MgTfv/D5HoMGJstsHUV0aOOs6THzmBbere4JUgerzWPDxFIVZ7YnG3lGqd8FTZiqs6mzYwp8W3xCcfErklelL/H+PyNolvag/7iA3Kw3gcnNSoZj7o59LVMtdKoVyQ5hly1h/hfzjVKFmMZndLfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df71b9a1-9aed-d0ce-ecf1-2addc69511d1@suse.com>
Date: Thu, 18 Nov 2021 11:45:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] x86/hvm: Remove callback from paging->flush_tlb() hook
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211117182603.20057-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211117182603.20057-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0024.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84be4f61-4198-47ac-3e50-08d9aa8088fe
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3776388631BD1FA76EF20A5DB39B9@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p1k7QLNcORT4/LQ8YZDV4D/O9rU7Cijiv94UdmBWAdJfhve/LmiF1xrvc+aTnQdwbm556r41F9wswhEHaVPyvQ0gBXsZgLrLr2gQcbCIEfRYQAucJShKUc0OFFR9n6Uou0uzoNa2RIvo+IygVWpourJKrovxYl2Pxap0C4O2DG5rqQjM1FchXUQLi0Oov2UPBiZCVOQZiWds0D/LmrdkSU4jk2oxYTjlLdrLC6pYfaX5BKT+9+80cshZAPuFBV1gw80pHABa8fkW8bPkjtSk/LIpyQZ9gTDsMbk8mEFFJDNhsyiIWU7dgxjFNhrBZ9F5GWLydUYz/WHVaGIIfDAXEw1tecM6iBVL0NZXLfMy5mjMeKA14E1e+rWmWpxKuj32MonqQQjZPJcEFbRyAATql2jhxarCj+FGSVxPsliRBmRVevVwaAIxJiAxJxJA3+lG7tPDRLGT60m6xbiBXuWA15UNuPpZ75TEQ7zMUkAvneAEVzu4bjmasUbM6RSxFgZHNSjwjboOFjA+PbFtInN7sNCLs7lMr5utmvX7taTl+nZt3a7a8JoBZE0icsD1aTwPuCrc1VbTv3J2AtX/QFEZ0lKHAh9aha56u8a5tu3NqsHU4sesfOT0GnFYigYy1aHWKIv985gy4CtOeyVf3QvGdpH71dPn/rLegiePnpGsXFPPFOaK4wHbgAHXcmOzNa9eHhpYmkRpNCXznwAKJcqjXk+ILBz69ksIIHD6yfyHaKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8676002)(316002)(53546011)(16576012)(66556008)(5660300002)(66946007)(66476007)(38100700002)(36756003)(6916009)(956004)(2906002)(2616005)(31686004)(83380400001)(31696002)(8936002)(4744005)(54906003)(26005)(508600001)(4326008)(186003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RS84aDNobVhiaWEySzZGUlFmSjg2VWtxTU1XczcwcmNyMnAzQTE1ZnJCNk9r?=
 =?utf-8?B?NFZBMXEwNVd3ZmJOZ2FOTmJoU3pZMmEyR09Vd2J6NXYwNW10T2krRk5vRkR5?=
 =?utf-8?B?SENvR1cxMjh3Qlg4djA2UXdhd3h2M0JyZWpLNVhYTG8rL1JUSHh3WThTczBQ?=
 =?utf-8?B?WDRoU1pPVC8yV0ZpU1NPbTBtcTZQU1MrNjkzd2w0TUZlVEg3eEE5elRNdVB2?=
 =?utf-8?B?SWtkN3Y1YVd6Y2ZYV1JiOVNmV2RkaUtMcWQxMm5PL3Q1TXJScC82TVNPY0Qw?=
 =?utf-8?B?b0VNdTlNemJYcnBTTlBLamZaemN0TnlwTzRSSzZ3UmtGZnQ1dmRaUUhOc2w3?=
 =?utf-8?B?YXU4VUdvdTBvK1BWRVV0MVVsdEdaNmhld1ZKbVk0N3Z6MHllSFVMb25sNmhQ?=
 =?utf-8?B?SnBwQTRUcURUbmF1V1Nnd1ozc2pFS3h0dm5HbEV1T3FKcXR1UVZ6aEVzZkhR?=
 =?utf-8?B?SVBPMjJjRytZeHlRNWw2YUR2cDM4T2RIZ0kzb3ZvS2dlNWVPRi9yQlF2c2Fa?=
 =?utf-8?B?TElXRFZnc2ZxeVVRK0pGdDVsOUVBbHhDWnE2bjdscTluMlJFVWM2M01OMW5Q?=
 =?utf-8?B?VmdPTWRIa3pTRmtrcXltUk9IZ0NGZUJSVkNVSDJ2amtRMDY3VlNQcEVnTWw2?=
 =?utf-8?B?ZnVMN1Urbk5zQnFVVVM4Q1YwM3hnSjNtYUVDZ05ydGJsdnFGamtPWkJrR1pG?=
 =?utf-8?B?RjNBRG9Bd3pyZkVQVjRWUElIQVVQN3VKNVB2Q3VTN1loTVhJdDMrai9pQ1FR?=
 =?utf-8?B?MzNvZlg5SnlTWS9JWjNaMzkxdWhPUS9NTDVtSHI3NGwrMXVYY3l1eFBiTHNs?=
 =?utf-8?B?WTJFb28vOE5iV3VMbzVTMkVBQXBWdkEzUGxUQ0pXVjRWWURpRU5FdkEwS20r?=
 =?utf-8?B?aEhyRmVxSmtwazRsTWxuNWljaXhIYys1QW9EeE9BMURGUTE1RkQ2WFUvMzU3?=
 =?utf-8?B?eVlvaVlvMWZuK3VZWFVRTjVhdHRianE0bnRRbFVzS01LT1EwaUVoSTRlNnRs?=
 =?utf-8?B?TVZtRC83V0lBUy9YYkx4b2ZrS3lydlBXaTQzTlFSM0psM0NQNzlKNzkvMTNy?=
 =?utf-8?B?emJkZ1dYVXlkSWJyYndIVktGOTdkTjd4QkRNNm1iYU9FclpBTmdycUpNTGta?=
 =?utf-8?B?U2FIT0puV2dnUmw1VnZWQ2pWTHdZaVE3cE95QTRjRzFNUy9ObEEvUjNmWHZ6?=
 =?utf-8?B?Tlg3dGttaGN3eUc0d3ZOVG8vWEppZjNxckJFTlFkeE11VER3cXRGMU5XNlNk?=
 =?utf-8?B?MFNRMDBrWDhkZDJRc2FKeWdPV29wWndhTWtQdGdGTjlqeXhWWmltU3Uzd0RN?=
 =?utf-8?B?Z1cvWUZldVEyNVE1SWpVVnlaK1dtTU1IdlZXOTdWY2FZdWU3cTI0b0pSb2ZD?=
 =?utf-8?B?VWg4ZEFYUHU2aVJvZDhKaFd5K1F1UU52aTNrQWxnL21zZnhTZjRlNURZR3Zl?=
 =?utf-8?B?WTNIdVFJZjhteGZBODRBVS9SdjA3OGkzeTBoWW1WVFlMN0FYbENzUDJxaFlY?=
 =?utf-8?B?Uk81SEpxMW5xakEwM1d3N3hYRTN2Tm4yNHJaWFhTN2M1d1hUUVV0SGY2WnF1?=
 =?utf-8?B?NlMrdnFIcDREWnQ1NkJTaWxvZ01PUStjU05XNE9ybG9SSnF5aGtvblladGtW?=
 =?utf-8?B?cUpBUE9lWFlIWWZKblpxaVRRRWVkSWRhSGZaS2JQYW9oQ1ZSYzhyMU0rQ25B?=
 =?utf-8?B?Y0RSamg5UENxRFE1L0xGUmtaVVB6S2FTcDRmckI4WGs5cW8vUGpRbmZMR0lX?=
 =?utf-8?B?TklzNlZ0Q2o4dm9aL3h2VGxUVUllMXBQUUtrL3dUcUpFdndHN01DNGFoTTFB?=
 =?utf-8?B?Rld0bzA0NHRBT0hpaUkraGtObzVUMVRwWDR4Q0ZZZ3BQY2d3TlQyQ2ZpY2M4?=
 =?utf-8?B?eVBadzJrWi84YjArQjBIbTNKTVZFV25NVTRsSW1xTklGQUpyQkpmMEVRSUFE?=
 =?utf-8?B?T01mRHZTYW9nOEQ2M1d2U2twQ1RCOElNZ1J6a2ErZkdIRWRMYURQeGFyM29v?=
 =?utf-8?B?T0hzaFVvcVFOUURJanRuV0F3OVd0TlJnRGYyU0hnN29IQnN2cktrcHkrckFn?=
 =?utf-8?B?Vm1Qbk1QYlhiWFF2S0RFYTQzb0ZRdUJ3OC9tVFYwSUZ2Q2I2d2hlY1hrd2oz?=
 =?utf-8?B?aVJ2cVA2QlNuOWZqSWdvYnptZEtXSXgrUm1DNVpVTm9aeVNVZ3N6b05rOWxk?=
 =?utf-8?Q?CWgwnHkdkzY0/IUGi1wWK/Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84be4f61-4198-47ac-3e50-08d9aa8088fe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:45:28.2164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpewQq8sjb9Sle5LG3IT09d0MUaCyo7E8hvEyzkXBHxZkujZxrIhWEDOOflhVS+qP7qNtqB/glx7mW7J2yu93Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 17.11.2021 19:26, Andrew Cooper wrote:
> TLB flushing is a hotpath, and function pointer calls are
> expensive (especially under repoline) for what amounts to an identity
> transform on the data.  Just pass the vcpu_bitmap bitmap directly.
> 
> As we use NULL for all rather than none, introduce a flush_vcpu() helper to
> avoid the risk of logical errors from opencoding the expression.  This also
> means the viridian callers can avoid writing an all-ones bitmap for the
> flushing logic to consume.

I think you want to clarify that you convert only one of the two ways of
specifying "all". The other (HV_GENERIC_SET_ALL as consumed by
hv_vpset_to_vpmask()) could also be converted, but this would be a bit
more involved. I have no idea which of the two Windows would typically
use, nor why there are two mechanisms in the first place.

> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


