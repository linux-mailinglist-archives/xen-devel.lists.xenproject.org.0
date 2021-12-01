Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 052CE464AD3
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 10:42:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235751.408951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msM8R-0003lX-Ad; Wed, 01 Dec 2021 09:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235751.408951; Wed, 01 Dec 2021 09:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msM8R-0003jI-7T; Wed, 01 Dec 2021 09:42:43 +0000
Received: by outflank-mailman (input) for mailman id 235751;
 Wed, 01 Dec 2021 09:42:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msM8P-0003j4-KW
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 09:42:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0686af80-528b-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 10:42:40 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-t941qyhqN5yhiYhLe5q79Q-1; Wed, 01 Dec 2021 10:42:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 09:42:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 09:42:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0180.eurprd06.prod.outlook.com (2603:10a6:20b:45c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 09:42:37 +0000
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
X-Inumbo-ID: 0686af80-528b-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638351760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yCxKdOv38xfLsrtBhC68T2KY7VJQHeYtb/l3qTS1wqQ=;
	b=AFswq5f2MApeqBz8RKrPYv8wqIFThtqZQStl0hXrup1+ULwuNgnPaR+wO2QEgG9bOzPvYO
	iIvmiP77Ldl5rXJORz6/KVLJ0S8q7BhwWNjlgr0f9ezOI90Ebufgdyivl2BhHnXy+N2S7i
	pIdjyQxy0Jcpitp0nLM5ICQpNfm2ssI=
X-MC-Unique: t941qyhqN5yhiYhLe5q79Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1vCqNXhxuJy11f+B+U5t1B/YsF3LFMrnvY1mCw3ESIDUzJSYlbmylwqxICqZ0tsKzeqeZCGZ4Z9+ot/nNEqo7xrxG6MavhNSEF7fUAifiBEcwMRXeM+mKm2DwFGl6B9Tg/3YGoztdSq2nCdH5BtmH799rvCqbzFSEXfJm1Y14O9Vwqsl2rDkpy/muaVfh3eiXr5aBrTXXAXWSBviHN/ql7m2CbFP9rasXUHMsYJ+SGAzFb1+NgtxtT37dBrtH3Gn/YNVufKHDaLh5Eg90uLrzDrryzKz73Mu4wcjRg9H6+AqOnYjgTJShX7GA4XIfdOJFQNoF33VkJmpvdbXCr8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCxKdOv38xfLsrtBhC68T2KY7VJQHeYtb/l3qTS1wqQ=;
 b=fOC+V8VD3lwTebnBrLtgPkNWRDMoywZJFKwty34wmbeXI9wZAA1NkjVqZ+yp5M/i9sMySYkJ+vqAYMhbCLig3ny2SWvtHcE84RY42EwG4lrdxOwxOU+FlCDVBWM0scJZPvgz167iyG8w2RldFgZCn5KfY2X6asDXf1boQA4Rjqw4gyLPCQMEOtvgV1bCaaUbH/faELEc6GOgiJTyEZhwJtWNt46pzWe/a+uviTvQwTETeSlt7hqPYtABPIrwFv3mQzQZLVLSU7ery0dv55WZnMTa2pHjY6z1kOGJbsoeHB02g08wumPc67gfYll3BGiVX1vSoqm0PV//GvjsYNGE5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b53c7853-b53a-37a0-d3bb-81093b19f305@suse.com>
Date: Wed, 1 Dec 2021 10:42:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 4/4] libxc: correct bounce direction in xc_get_device_group()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Ian Jackson <ian.jackson@citrix.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
In-Reply-To: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0180.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fd771e5-7128-4bb5-294f-08d9b4aee90e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55986C46D3AF809E43C12FA3B3689@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JOKdXrSKNWj89xesVVK+HwIBQC1AR5KXsCBIODEjcjcH8L5Xu/rKG7+aPSBr+QVXH1JZQGus8nqlp7L0ywd3V/vlnnzCw3yMwKeTPLoSuN8QXa5uWhWIMtXTfO9z4el7CgVigrY6Sg8dB9SxLsHZirio6KJ7pOqOudz4+rZZaTnAhT/Ei1kADK6X0xBDBW9tnEN5g2glawh92hkblfHxATQ+AjWdRfaUBPwYgNMWtGWqsMBYhkbyUMTf14Z5etzZxbWMggoNLLeVp8tCEBSjC0qL92N8+pNek52QhA+ZqMl3+udZiXVN7kw0ipObigsr3kED3dylq6y8iE7L+RuJSwhqkGQo0907Rd/+hCHar8Rl1MwCtr2Tzr2/ek53wqrSzQxau0FEmggiy0UUFpnnX6D6DphiFydfNyoqkSHCXOjVGToWzN10Pk/CDXU4xUjyJQuCeUJjbClrKnvDCll52PYi+a4DB27cK5M86Xp+4bgwRvG1x1c4NPJzwgpmH9jxi2DGe3NqqjrroKOlT3Cvz36AEhcpB0kn8dSpdaji33GlRlL+Cn3mDOPTEG2vvFgItYL/PVy8lGNLOor4DLOf2hDgfxU+bq/+amUkZhHFkrVfXbkTL/UrV6DdPbRY6U7c7BeoL6E6yPdAHq7Ral2gsBGv1KVLI3i5c2bVjg+DTMyM/L3vTgVAdJM6mDfKsAHVHmm1gnU6dSCl7eBnNa2h417Kri7qqYOX/VTBvZ4JiMo/wdITI+P3+oD+FMge4oPP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(6916009)(86362001)(31696002)(4744005)(6486002)(38100700002)(54906003)(508600001)(956004)(4326008)(5660300002)(26005)(107886003)(8936002)(66556008)(66946007)(8676002)(31686004)(36756003)(186003)(16576012)(66476007)(2906002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1luSkYvaHJ1Q0NzSThzWWlCSG5nUUg1TUVlOWVRTlQrRy9HenVVWFoydVVW?=
 =?utf-8?B?VUtoSVd0RFNuVWRqUk84Qnp3eFBzVll2M3dMVHNzY2ozbDN3SEF0WWN2akVW?=
 =?utf-8?B?S3BVajVtS0NDT3BSanBycjBodTdaTlByNk9LNytabU9hNFlkUmxpYkZxVXgr?=
 =?utf-8?B?dDZmVDFMbzRMZzRjaDBPZXhZMHBFT3BMWlpVaWF5WkVXZ1gxRnNhb29JY1JI?=
 =?utf-8?B?eVpnTGNSc3VMVndXRTdrNjZrMlE1Snk0bFExRHc3Q0IyWG5JNjNnWG5OZlpj?=
 =?utf-8?B?ZTI3UzFISWlkUHk4ZGUzU3R6Q1lUT0dXSllUMnpKdnNhNjl4WFV1cEpmSzlX?=
 =?utf-8?B?aUV0QkVwMmwzODN0TzR1WXl1RzFWU1p1bERORTAvb05CMXVmTGdtY3BrTFhh?=
 =?utf-8?B?YUpxTFFXQW5uWlN2VUVHWldwSzBCQk1SS211V21LZmd4UDNtbmJwOTA3M21n?=
 =?utf-8?B?TTc2VDZqamU3MzJkc3VJc1dIb3ROSGo5Y3FoZTBNZVpYUklyVDF1alRwbm1Z?=
 =?utf-8?B?UWh2OVZEdVpoeUwvQUEyWW1zOTNJRnVFOFRxSVpIcWZqNFk0TStFbXR1d3ZQ?=
 =?utf-8?B?RjJsa3Z0Um5VTjVCakM2ODhGbTRLUFJGc3ZRRU9NRXFYRzVnUnBrUHZWWFpY?=
 =?utf-8?B?Rlo1eDczRnlWVXl6RjBaYUc4Z3NBWVpobHMreWRnVWIxQzh3N0M0YTgwdmpo?=
 =?utf-8?B?aXFuSXNlTW1ISXpjTmJianVJelQzSkdEcmp4WDhBNnRaV3VPc1M5dHIzTEha?=
 =?utf-8?B?TkRqSHA1YmpPRDR4OTdLOXZ6Zndxa1orbmgySjlNQUNuTndoY2RBQmxOSnRa?=
 =?utf-8?B?WEROY1lnaUtUaTdpV2lyVDlNcjlxd1FoL0czT2x0WW9CWE5VN1hGRnhhaXVV?=
 =?utf-8?B?cjVMT2txVVdDS0ZkREZ2cXJmY1dJUGNBbldvaitVQW9LNmFuSU5ON3FWMThq?=
 =?utf-8?B?RjMvdFEvTVR1QUY4OGVmTGwxMk5YVXEwaEpwYjZOUit6U1NQMjd2NVM2Q1ZO?=
 =?utf-8?B?VGhRWWZWb3FUM1hkNzVTUElwdWw0djRyc3BkNXp6UkJCR09LOEplbXovUktk?=
 =?utf-8?B?TE5VSGN2L0NnRmIwUkRLVFFkdEY4ODM4YlBJSHBQUHdYeFN3V3AzTVJveTFH?=
 =?utf-8?B?eGxtc1pQTGNwV3Q1ZHZ4aFpYTmxWMnY3bmRRTWc2MGtvVktKc3NnSkwvS1BK?=
 =?utf-8?B?dzErSFd2Z09yTmJTV0xNbUtMWXZXb0Rta1hpTmxLaW1UeGpOeUdsSENvZTFv?=
 =?utf-8?B?RW5GMW5rcnphTDYzNW1ZZEM1MkJNSUJaVjdVV08rdzhiRjMyajBNYkZESmM2?=
 =?utf-8?B?eTlIZ2d4RjNPdHJFWndCd2k2RU85VmsydHl0YzJkYTNWYU5WY0lsQnZDRU9w?=
 =?utf-8?B?d3g2NkU1ekdUdXhaTEhOWWJxQWFXK042aUxMbFArbkRta3U4RE4wSHZCMTVh?=
 =?utf-8?B?K0JwaktlZG1jVjdrekxEWnJVMXFwell0QVo4dmVReklRa2tnR2I4Qk84d3BB?=
 =?utf-8?B?cWhaRDJoTXN3QkU0b1czR1JZUGo0eTBmdXhORHh1aUIrQnBDYUJsQ1FCUHhl?=
 =?utf-8?B?a005UGQrVnE5dkw4RVdLQVFuZGJxR3gvWWEvUkZtbzZxNm9KY2V6bzFPRDU4?=
 =?utf-8?B?YVBGQ3NadDVmMkk2U0xvTG1DaVNqdkpnWVJyM2dYSE9ReDdPVk9BUUhjODN6?=
 =?utf-8?B?NC9vQWdON2xvV2JiUlZTMGtGeW43VmVTWkllVXFCUHBqZGxpN0tiRTR2MVFJ?=
 =?utf-8?B?TTB0Zm9oV3BYOUdFYi8rSEtHU2EwamEvb3dHZURLbmlzVHNHeXp6S0tGOERX?=
 =?utf-8?B?ZDJTWTlyY05nVGxXVEJUSm56STc0SWdTenZzV05WZDlqd1JGUHp3ZFlISWww?=
 =?utf-8?B?SmhQakZsVEZBVXhLdHRWczlIMnU5cGZYdU5Tb2hzT3ZIeXphUTNIVExvN054?=
 =?utf-8?B?eG5iNmEwNytrNlVmV3loNmRCNmpUSUxYNVl1YnZnMXU5UXNoSEtFRmNoTXpk?=
 =?utf-8?B?OGRJQlJZMlVQSENzUVNML1QwSjA2RXAzZ3ZlN0liQzUvMlV3d01jdEpvWmJG?=
 =?utf-8?B?VnJpa3dETFcyN1R1TW5DNUI4ZHZWZ0tBRHFwRmwxL2oxdEFDcHUxKzJTYWpl?=
 =?utf-8?B?REorUmZGSm1GVnRDanVtMnBIRnRBTW1xaFA0V09uKzhLWDBQZWNoc29xbHBz?=
 =?utf-8?Q?nqYeh8iz6FnrSG6suB4eL84=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd771e5-7128-4bb5-294f-08d9b4aee90e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 09:42:37.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGRmUrEbscc16rKpbJKVNAKJmKOOeYvoadll8FfiVuepf/OxNTuD8NreqB7JXp+qKwqq/o4dlPtPmRm2TdEdrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

The array of IDs is an output.

Fixes: 79647c5bc9c6 ("libxc: convert domctl interfaces over to hypercall buffers")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Clearly the function, including its Python wrapper, cannot have been
used by anything for many years. I wonder whether that isn't good enough
a reason to sanitize the layout of the array elements: Right now they
have BDF in bits 8...23, when conventionally this would be bits 0...15.

--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1546,7 +1546,8 @@ int xc_get_device_group(
 {
     int rc;
     DECLARE_DOMCTL;
-    DECLARE_HYPERCALL_BOUNCE(sdev_array, max_sdevs * sizeof(*sdev_array), XC_HYPERCALL_BUFFER_BOUNCE_IN);
+    DECLARE_HYPERCALL_BOUNCE(sdev_array, max_sdevs * sizeof(*sdev_array),
+                             XC_HYPERCALL_BUFFER_BOUNCE_OUT);
 
     if ( xc_hypercall_bounce_pre(xch, sdev_array) )
     {


