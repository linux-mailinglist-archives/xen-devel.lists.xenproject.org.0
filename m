Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D064A4CA7C0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 15:16:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282259.480897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPlR-0006JJ-Jf; Wed, 02 Mar 2022 14:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282259.480897; Wed, 02 Mar 2022 14:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPlR-0006HT-GL; Wed, 02 Mar 2022 14:15:37 +0000
Received: by outflank-mailman (input) for mailman id 282259;
 Wed, 02 Mar 2022 14:15:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPPlP-0006HN-Rs
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 14:15:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39856e33-9a33-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 15:15:34 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-G3801V12MoG403ruI3k6uA-1; Wed, 02 Mar 2022 15:15:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB9PR04MB8187.eurprd04.prod.outlook.com (2603:10a6:10:24a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 14:15:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 14:15:31 +0000
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
X-Inumbo-ID: 39856e33-9a33-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646230534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kex8qq4jf+Lazih0UJdwgvdNdQX3ZI+g+eEJI7hKduo=;
	b=gGQKCj5Z6TKwoiDGDtxQXyTq2ugo9hE66nFjJz0SyzQtTLZK9OGoBIwrDiga6ieufCRXUn
	uRNGB4U1IgUzN5VvLNgUIy7J0QEyaPkGR0FIgS5O6Cy/JqT/4ibX3ny0vIH4EBKwD7hX3n
	ERvWuBHW7SwOJF6X6PO1fI2F9W+e0UI=
X-MC-Unique: G3801V12MoG403ruI3k6uA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdlmRpwW61ferpDxv3cwIJ+p7UnEpaxmEe0S9s81QN1Xrlf3HdPZ2FMaMKMEWNH5O5bkXtasBvXf6APMuWnKpsHZNno8N2v13pkl9Wl5Z9bPElmQD2DOoWrbAXn/CndPPvyfVU5SLwo+gbQvC4Lc4tSvFnwca3GrfpBbvnMLh1iDbC7pWeB663iazJGe8s7MYFp/p07iiopuOPcgvFhnvPGJccasVkRDSKpFn1Tf/NDIAr8HUpDmrLJqwnZJwZl4WUqtvah70a+PdL8M9JRc19feJwDFL5J7YvosdDF5BDbwf6qGBsaPkIb+SKN2RCC8VEHop/3E96zaoId+U09WLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kex8qq4jf+Lazih0UJdwgvdNdQX3ZI+g+eEJI7hKduo=;
 b=mib305QBesE5Q6zjzC7C80gl5Z1OMSKmyvRNhidq53DUovemvPpzpaHfTy2+N5Smp3qWYRobFhGErJKutekOX+V8zs/6VTEyeQ2+ynCr6Lzo0zS4t3wN+qv4fBN72hMt1rPdA0Os4eK21B5lY6reL10MVtLin46/aySiKUixQncf/sAifR39Z0G5bXOCdE0h2ld2rt4LinlZP84YInmcjQ78PfTj3fgcuU1zzEmYpdnS6HWEvwJQieq6BWNUO3+bDbzSjNmY2s/iruB3vi5OC+t6r6LKejW/rPupdVoG9Ezn7MarSN6cGoiM/tCZ0l2IKR7y+32XyhKu7rQLiFemUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1791edb8-030f-1009-c392-ce793baace5a@suse.com>
Date: Wed, 2 Mar 2022 15:15:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: drop use of CONSTRUCTORS from linker script
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0024.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8daa964b-8785-4d87-e31b-08d9fc571c27
X-MS-TrafficTypeDiagnostic: DB9PR04MB8187:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8187DB94F6C5AD75F08B589EB3039@DB9PR04MB8187.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fIvHwW24R+cm15+lphyrvIIKb5HUUSs6s/xsq5BUxj2D4GD5VZfziR291b9dYMNvIHVClWyiMaHNDjs2/x7aU77i4qt9YD03UsRGotfeOSQAWV6rXswLX1x/1Ep8MvGORA+gfEA2Z74bPJoDTcqIPZrKZ2goawU7VCPjiDVAEtk0hWiE5lPsl+qny35gYHqJJwRMjRUyyukqBPUUQbYHw0HTBOeBLvQEe5I7yTaPWEExEOxNAxdvPPsRuIQ8Rv3gamr6Leak93E7L1+a52Gmk+UouXobkQE2DzyJvtovendov2oCvEkxEA8UglvQ8fWrPob+HBUxx/+G7tqmhQEJWr7eZfjv00aPQjvzFawgv681PvE7jR+W1SK3WHbRcZnASU7YDSZVot5bZJm+B4Z1atMRNgB8dbJ2JrMT4+lTmALy6zA5qh2tDzwJ2voyumBO0UwQSdKNPWHdOMpW4o43cbv/sPsKnUzVzKgSvOoT4BxoeB+GoKhqiqJdjdzp3ZHjH0sFuQj+W15RvhT36cc6NiHGr/TPx7KoTiasGbsqV7yBjpzJZfDdV2mv3m8njApMXLSS9xTd/jdLNu37QuEzinWo31ISvN5wc9CMJP6R+XcbdMU4Sf9oxS8DF9H18ultJkw/bHuM9LQSdYFkn7Fo0unktAMHbTH4lNDqUMo/m78Pmic4TuzmLRHowmQkJHk07nWKYf9SXURvT0EfcfAQHlL8mzrL1u9gdINpsDix08k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(6916009)(5660300002)(508600001)(2906002)(6506007)(6512007)(38100700002)(66476007)(66556008)(66946007)(31696002)(86362001)(8676002)(54906003)(36756003)(8936002)(4744005)(26005)(186003)(2616005)(31686004)(316002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmdOelc0WlJXWUhXQmhmN3h4YWxtd3JWMWV6MjhqeUZDYW4wY01MVzErekxR?=
 =?utf-8?B?bDQzV1h6bGY5Z0FWUTBiSThGOHAwQzRhYUxHK09JK295ZHVKQ3BJTXZiM0lH?=
 =?utf-8?B?QXBsOC9nT2RXa0U1cXppN2xKdmRIYzEvZm43N3p2QXUvelQyMU94N0w0L3Jo?=
 =?utf-8?B?ZlpIRWhqMzdCQnNXV3RJMURtQmFZbFFra3M2QWFRblJRUlZMdUhrNCtoRjhO?=
 =?utf-8?B?TVZNUWFMYzJTZVNkMjA1S2o5WEFlMXZ6MWpiV3ZCK3VVL3gvRWVIRVpBUVlu?=
 =?utf-8?B?MzgwTmZLSk5OMXpZd21HeHllWUNUa3FqUzFpS1JveHJIOFQ0dHN0Y1M2R0lE?=
 =?utf-8?B?N1A1R1pHQVNhdFI0VERWQ09qd2VKM0MyaWpCcEtQYWVPdmRFN3ZxWGFNckh2?=
 =?utf-8?B?MC9IR0c2c09ZeEYzWkhuVWEvbVNQRFd0clJBZlRJQWtjbTF3M1c0VDhQTnl0?=
 =?utf-8?B?V05SMklmbyt1Tnp4OUVpVDhiZVlITFBzbmFGOU1UOW9lejF3aW52eGsyMUtC?=
 =?utf-8?B?S1VCdi9CYzBWYXVUS3NRaGVjdXdOaC9QcjUrckN1TVplSEVOenNTa0RsL29L?=
 =?utf-8?B?TFZrNHVtNFRQWmVzTzhnMGlKY0RDRm14NHdpMEl0aEdHaTlWMitTVTNvTzR2?=
 =?utf-8?B?TnR6Q3ZyL01ST0paZjVsN01nSmdONXRYQ3hUTHIvRGNPMzJ1ajZLUnc1UTVH?=
 =?utf-8?B?MzJMQkxLNGJPaXVjanl1Q0ZyRGR6aFdtanNKckp0Wi9XQzM2bnZUVDVJb0xV?=
 =?utf-8?B?UFMxMVlkUWgwQW0rc2Z1cFE1QjVPZFVwQ0JzdjFBRFAwK0JGS2FUMnIwYW1V?=
 =?utf-8?B?N2o5cW9kUGppRlk3V2VqbUEwcklXMTVkcnY5QnJsOEVoa3YwOUxhVjdoZjB6?=
 =?utf-8?B?K1dyeXN5OFNqSEROSFp0ME9zczdtZW4rclFOSFdoR2czdWdxVXFBMW5CcVJx?=
 =?utf-8?B?aDByRCt6OU5aeXU1c2FGVGZ1eFBUUEdaSVFMa2laNmdxd1Q3QkI3NHBHc0kz?=
 =?utf-8?B?d3pncTFyamluRUxxRnFpUkVDdUV3VGdzYnJYQlBMY0hicFd5Ky9jWGV1bU5o?=
 =?utf-8?B?V2NralFBSDRPQ1pLWjBrTWtnK01DU2dvQiszWExlQVZkVGNHOXovcUtFQlR5?=
 =?utf-8?B?NWJXb0FUcFRacjNxTStRcmRzM3JVVEFabTJrQ2VZZGpIMUc4VzRMWmJsTEN3?=
 =?utf-8?B?UHk1SEFOaldzM0hMTWdNRXNOTGdrRnJybkU4UlV2eDRoUE15SU8xaUVtYXpB?=
 =?utf-8?B?dnh5endsdE80d3NXYS9LQ0pzS0ZZMUtQZzBMZnR0NDZwMmhnZ2R2dGlsTmtQ?=
 =?utf-8?B?U2NQNDNteGVEZmFQOHFqeHU1N096SDhkM003Qy9PWTUvNGltRUJHcmFCN2Vi?=
 =?utf-8?B?d2d3Y2UwZzFoc1NOTUlTZDJFTWhHSWVodXNUWTdwMjFNWlVBUExpQ1VwL1R3?=
 =?utf-8?B?b240UlFZNldSdFRtdDZlUXFJQWpNT3ZMWUN3dWE2b05PV0V5NGdibnJBODQx?=
 =?utf-8?B?SDFRQnpSQTRLeUl1Smhob1NFYmR4OGtlLzd5U3EvNjRENWxlTXhjWnBmL1B3?=
 =?utf-8?B?UXpJTXowbDFNTmdVU1JpWnFmdXllS05sekdKcU9CS3dUVlB3WldwQXRTLy9t?=
 =?utf-8?B?U0h5YkFIa1RFUU1mNW9jbFBiQ3pzUlBRWGIwVlhWM2h5dEFoenlNY0M4c3Ba?=
 =?utf-8?B?SjlrR29KR0JpWUYwdzBGN2VUWGVaNDY0alR2d3plMng0QzhkanlaYUdzc2Ja?=
 =?utf-8?B?cWR3VUtkd2RCOFhZV1FRVktubENJQlNrbkIranZIY2FYbERleDRnOTNHQlpz?=
 =?utf-8?B?SlVqaFp4UGFRK29VV25wSWdmYVpyZEFYVFNhN0s4WVpOcTNYVjMrakYrZzBv?=
 =?utf-8?B?UW5SdTVITzVGMzVteHZYWFVYSHcvMXB6RnVsS3JneFExMEJDdnlRVGo5ZDBm?=
 =?utf-8?B?TG1zUUE0OXMySUdPMGJ3SGpVQ0dqdkduVE1sNHZ1cTFzV0tBY1pCenBFc01N?=
 =?utf-8?B?Ujgrd3pzdy9LMDVzRzI1VTVYaGt1SndnMDZQNzloeVN2aS9DdmVBcG1NQWVK?=
 =?utf-8?B?RHdSV1U3WU5aUm0yUFhNek0vaG5GTk9TMmQzV3l6bE9UWWpjVFQ4am5iTWZq?=
 =?utf-8?B?dWlUcURXZmtMRkw3dVdicEliak9INnU5ZnN1b2RLZnhsMWNQc3RqcTJzeEVo?=
 =?utf-8?Q?jU4Sf2/84P/7PRbMcDJNh4o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8daa964b-8785-4d87-e31b-08d9fc571c27
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:15:31.8428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyiMN36iK/9p08eBRJyiGrYeKSTYRhkeWFmCEQYup6Pbj7FTQATPOTz9W6wlX69lD1yioZZpenvwXc01pH9XHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8187

Current binutils document this for use by a.out only. Plus we deal with
.ctors and alike sections elsewhere in the script anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -292,7 +292,6 @@ SECTIONS
        *(.data)
        *(.data.rel)
        *(.data.rel.*)
-       CONSTRUCTORS
   } PHDR(text)
 
   DECL_SECTION(.bss) {


