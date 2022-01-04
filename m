Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749924845F1
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 17:23:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253313.434426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4maw-0003qO-Rq; Tue, 04 Jan 2022 16:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253313.434426; Tue, 04 Jan 2022 16:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4maw-0003oO-Ol; Tue, 04 Jan 2022 16:23:30 +0000
Received: by outflank-mailman (input) for mailman id 253313;
 Tue, 04 Jan 2022 16:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4mau-0003oI-OX
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 16:23:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a534a9c0-6d7a-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 17:23:27 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-E6ZTKsnCMvKvfonemslaiw-1; Tue, 04 Jan 2022 17:23:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 16:23:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 16:23:24 +0000
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
X-Inumbo-ID: a534a9c0-6d7a-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641313406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsmp+6aPx2HqhGU3fHFOvJ/4nWJw+MGDL4wD9ukdiTc=;
	b=AxFHjA2nZ5LkUqn8IGCNQc+CJsM5dMUzxOSXZmrKgIsQlWOswoiutoqYeM0bJMUC/Azxr5
	Rxtel7Qpw/SrVfgBEl7q4ILAbRvl510ONnonhDrMpfQ9+mWAPslg4GsLST1x1CjElmPjFy
	odYc+6bWh6L7iuRG1D/Cr3twFsoGCoA=
X-MC-Unique: E6ZTKsnCMvKvfonemslaiw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0mumByEHgVDLIMe8Yq4HlGdcT+N7O25OEEgZLarBjvaWXEbn/xjvLQy62q/Uvx7tQbTkcI5g5pZI8Y9xipTgJE4/Y5RipGY8qRJ2oNwvvDBwLnGM/Jju6PDF4S+/W4t+s3eMbhNR0VKSoriHlMQqWY7iUL9AN9tQIUUs8j6n5BXNW1chKj03iRUJWG/zAJsTzyj3ZEXkIN/G0a7uY3NkEpalPCRu0qXdaizf7OMYvBQFsi+VSdw2L0ENpQk4eS5BrWzuQg9VY3YyMxRWGGg2EAeXkHnl7qowBNt189WUhZSSFrUq4ttz82s175gLWWZH+SHOJmnN7MUPVqVoVnNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsmp+6aPx2HqhGU3fHFOvJ/4nWJw+MGDL4wD9ukdiTc=;
 b=NHEaFbuR8HYIrf/Ouy5YNDpTBlpVL0N+JMDlkfPOhO15Mls9Ky/Bn0xSs3j6fUhRmwGmu86upKIjTaJA2YckZA7aPfVdy7pNW3CLwpxpw/+cAAZjZnTVfgtQ2W+Xrn9QKZcqJsUtT20qPkCrJ9YQiYJThQtlz0Vo8laYekY4l9o1Ag41GgZU8ic7pCpG22x3WdhdDaAwZexjqP1Usfnje4UkdHyJf88t5YtBKz8Ln4cAzPNMq544OfFNd7Rbgg3p1JLazdVyv1c1CocLzzvcQPOLWu4ISAH3ntoufiRk98yOvXb+o45FWsdGVZnl4iHh7b4EDSly9/EOXYYuSKKk6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a22af5d4-292e-78b5-1a34-54db40b9b614@suse.com>
Date: Tue, 4 Jan 2022 17:23:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] x86/spec-ctrl: Fix default calculation of opt_srb_lock
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220104144422.29989-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220104144422.29989-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0120.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac3c837f-36fc-4b8c-801e-08d9cf9e87d7
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7360713076E09F6264CE7652B34A9@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3IZarBIKO8WNVPu27bA8GgFJp0WQh7TRnDt3+OKmPq+PGL/y2XjTw7+MiOrsXbHeUkZqUvi0aaFF+2s1Ew38bw6FNKcp6LlNQcEiLY1x1tU2hnjdz9jOfpnMfzGfXJfXps2FBAn/bL5zrBRh9f46pWC1EKQ/70J4KivqWXtDyjcU1DOfl1gFSLOmqw9MgNxYCHd21RWEAJ6DvzOwYq506/JDCh3rOusdT85KrSiXt2XlanxEgKugLkKtInyJ01yL8Km/dR5WoS2ra9n0kxGTVHRLACIkye0Gt+tu+5+o22rBvREeUVwTU8eD+tcO1INYhBAmcx7vwUDg0gLH2vJ6kUMJ3hjjYewBsZJ9t37Ow3iw9vF8YfheJhJtL3nkFCYzPDSn6DK9Ugbwgpp6rYAE1P6JyPGrZWnPw89hgKTHAfqts/L7hCCHB11hpaC88O08rCzkroIE9dORF9WACCsMGIkop1vOlPIlPh0hfqQBLR6rpwi+cxLmxyIAOknbFHlCuq5oRW/G/oMPDR2cHh6magkDvV06/CSVq7siTpTnVmxGxoblMtoyoviGwfSfIZyGeu1ybo56ngyB8LgeRpzWk6VeI7DkIhl0/tiT8qCfo7YbJXliuxftEN0jWNW9dQ5p0pUP9upxxvRet0yt4TKFoebGuy1iCaR/M6TmUvGCVkO2A0O03ucl/E9NNbpD9ymOai0cwNnKs3qL2evEnFrb4Yt/4rye2xBtCEME72Ud5ieDdthtw9CwKvhBfaTAaPn3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(86362001)(31686004)(66476007)(66556008)(316002)(54906003)(36756003)(8936002)(66946007)(6916009)(4326008)(5660300002)(2906002)(53546011)(8676002)(4744005)(2616005)(38100700002)(6486002)(6512007)(186003)(31696002)(508600001)(6506007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk94TzhKTFMvWi8wNDRrT3p4R3l4blRiZjZGUGJ0QXF1SENDbEJManJkMjA3?=
 =?utf-8?B?aGY1cUtjTklSWi94dkZSN3ptZkRYNTdlS0x1QWhNeittMjdEWUhFbksvNzE2?=
 =?utf-8?B?OGZVNzgvUmlSSy9xd05CZjJEenVzZTJocmlRcnQ1NGpxQVZ2Smpyb24zdW5T?=
 =?utf-8?B?b0d1cVVjNXJmU0M5UEc3NXc0ZzJvWHU0T0ZXRVhwN0xPb3pXeDROZk5DY2kw?=
 =?utf-8?B?d2lscVF4SHF5OTY4TTgrQThPS0l5S2VnZmZMY2hHOERlUVR3WmdlYnJhR05W?=
 =?utf-8?B?L2ttTmZ3L0VJN3RKaVVuL3Q0UHlyak0ycVR6alQyTHdWdkFxWHhUcnlVUnBl?=
 =?utf-8?B?RFVDQzhFZ3BTWDVRSllnejdHVlZoUnQ3SDF6NHRPcm5Nb0xuMkducEhvVzM3?=
 =?utf-8?B?ZHlJOW83K0IxT0xkWGVjRkpkVEdOQ3F2M3Y3ejR2NlBqNEVaUEg4elgwVXlS?=
 =?utf-8?B?OG1kR1ZCSG9xWkM1RE5vanJmNEpTbm9yVDNJUzRrbEZOLzVZSWV0amM0dStK?=
 =?utf-8?B?UU5iTi9QdGpqQ0lZb1RGeXg5THdGRGVOZGpCWU1rVHhZMnBtWCtIV1prYkQx?=
 =?utf-8?B?RzVqeFZIRHBqRDFsU21uUGIzcDZYZ1V5bHJpQ2pCTkVrdnpiRnFCYmhCTGZ0?=
 =?utf-8?B?NXFUVUNkUjBiU1VRVnlVY1Z2Z0U4QTZYYnB6RHFVQm9WTzJ3N2V2NlJEcllF?=
 =?utf-8?B?amxsWmE3ZGtmSWdzMDZ6N2UvN2ZSRHhXQXhQb3NPNmp6Mm8veE9LVEl3WTIz?=
 =?utf-8?B?OXZBQmwrMytNUjI1WU1nbmU0Z1lJN01sMFRZbGtuNXRLeWJXbWJKWExYWEFY?=
 =?utf-8?B?ZlVrYUdteDI3dWlkSENHekxXa3E2bGhPcTBVQ3l0SXJyOEwycCtZZy9vbUlU?=
 =?utf-8?B?QTNsYWlBanNNa3Q2SlRDSUxQNk1jdkErUkhMdU85MENZZnlLVVI4Nk5XT1J3?=
 =?utf-8?B?M2ZQZnMxU2ZnbWQ0UGU2QWhSWXNZa21kVnVaMWpSNDh4b3VwR0g1bGduNVpF?=
 =?utf-8?B?a3hsSUNWakhJUjBwSzBHK09JSmlPNXZ2RnNBekZhcDd5U0tzMkJZSVVleHB5?=
 =?utf-8?B?S0ZOeG9CU3plWjVHcnQxb0k4aXRIRXhOY09mcGlUeU5BWS9rSU5SNHliWGZ0?=
 =?utf-8?B?RzM5VDZUcmRmOEZVL1ZVNmJudVNvaXAvZG01SFlrNHoybm1TK3JKM09TVUFS?=
 =?utf-8?B?ZXppUWdMcjMrME9SSDlMV1FFTmFjNEhzVGV3ejcySGx1bUc4R1NrVDR3N1NO?=
 =?utf-8?B?UGIrQkQ5R1Z1RCt3N3dCTVlFSldxdlNLTW9zM2sxRWJ3RCtkR1hUb3NLNldk?=
 =?utf-8?B?ZWlGb09uOEd3SVBOTnUxdkZXa0tHYzNBa3VqRmlCZkN3Y3Q0UlhhK2laWmJo?=
 =?utf-8?B?YThoT3I4T3Z4aFRDTGg3bXNmT1hHcWJUWTBzemdrcXFUVlE0azdrZldJdDg4?=
 =?utf-8?B?cERyQkUrYy9sRzlMRU51ckMzNEx3WmxjZHUyK2Z1V1U5QlkxSSswNll3S0lS?=
 =?utf-8?B?ZGh5ZmpBdnRTM0dpSkZwd2lyWnBEUW1aaHh0Q0FFdFBVM0VkcHV0VFJaNDd4?=
 =?utf-8?B?dmFueEF5SU1kWUtrV21DeFdkdXRpQitLa3RtZm9nU21kUENGUThqeGF3Nmdn?=
 =?utf-8?B?RXRsQzgwdzZ1ZXVCVjNidW1HTXRvWWgrTkx4djREaUVNTXQ1WGY5aCtEY3Q0?=
 =?utf-8?B?blpvd1BUeDg5amN0MllBQ0RkZ1YzTFBEbm9TTWZFZngzcFFHa1FtTWRDcnpL?=
 =?utf-8?B?OERHdjYzdE93Zm8xUDRZM3RtQzZRU1dOKyswUG1VMjF5YUdJbU5RR0hndC8w?=
 =?utf-8?B?OXpVYTBIUlRTbVBqby84QTBvbEpsdmIyRWhNM2IzSGt4Q2VlRjE3aGYxQi9s?=
 =?utf-8?B?WmN0eEJkSjg0NWNBaU5LMTJ1STdacHdDR2Q2TlpBM2tITEdpb21QakxObDV3?=
 =?utf-8?B?TURtR0ZDbGNUOHRPRG8yeUpVT20vS3Z0aHMveDkrSSs1V21EQmNoNnloK0RQ?=
 =?utf-8?B?eXVURitCMU45MVJiWkFKUTVPK3crNHlzRDVGNDdGK1BLMkxTWEFQaThxQWg0?=
 =?utf-8?B?dmlTYzcxcllhREJsSnhZTkRjWHRLRjJkQU9UbFRYZHFlZVFpVkFxK0NUUjUw?=
 =?utf-8?B?UzlSajlrTnBERHlzeDdSWXJPMXdLR2RFK3JvcmFSRzBFUEpjc2RVWkVZTDZq?=
 =?utf-8?Q?4NYWgRRrP6ODApftFsXvi8U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3c837f-36fc-4b8c-801e-08d9cf9e87d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 16:23:24.3143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +28AvU3BfGJ7soWCcwRflu1+m6bk4onpk3YBFcLr7zWNxocf+fySx++Y12HOcognazvj4b28deMtMY0f2Yo2cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 04.01.2022 15:44, Andrew Cooper wrote:
> Since this logic was introduced, opt_tsx has become more complicated and
> shouldn't be compared to 0 directly.  While there are no buggy logic paths,
> the correct expression is !(opt_tsx & 1) but the rtm_disabled boolean is
> easier and clearer to use.
> 
> Fixes: 8fe24090d940 ("x86/cpuid: Rework HLE and RTM handling")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


