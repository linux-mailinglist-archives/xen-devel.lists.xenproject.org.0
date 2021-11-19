Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5987456D30
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 11:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227741.394017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo12x-0004rl-PI; Fri, 19 Nov 2021 10:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227741.394017; Fri, 19 Nov 2021 10:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo12x-0004p0-Kz; Fri, 19 Nov 2021 10:23:07 +0000
Received: by outflank-mailman (input) for mailman id 227741;
 Fri, 19 Nov 2021 10:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo12w-0004k5-6H
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 10:23:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aec93a50-4922-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 11:23:05 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-iWGrbT8jPouzRdHVT6wxsw-2; Fri, 19 Nov 2021 11:23:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 10:23:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 10:23:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 10:23:02 +0000
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
X-Inumbo-ID: aec93a50-4922-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637317385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SFdBl4oly+v5EDzv1v3dC+TsVpDheb1hphiY7sT/fCc=;
	b=hXXqJR9cXAgsoMrY81CfjfTLdBbACqBSKOqY+JVarD4n/SxsaIBedd0eN+H+7tAzdL1/sF
	UFwRHm/6xalBIrEYEdGuQoCnXH3Ukv+QueD6OE22RVagXeR5uvrBCCYv0DU/6qLrGo7O2a
	ARpEw2KUgFa9ul45nl8ZVDz4Zd/IXK0=
X-MC-Unique: iWGrbT8jPouzRdHVT6wxsw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNemgzmkMLSJ/oACIcUgMxygPlisTFMU7uqhl2l3UArf+sfT6JwQaSKkL/82ThjkcTQpNteLC0+6jVn31IVTzF+X/7hPClkYwkUX+Q3zDJqdi0Bfb9BthWftILihR8O8bApPYxbvHadr0v1lberaD0Rh5mzNshCF97EqffpQvr5927a5AmyF0OnZ6srGUmieZa4wvk1NGqWNuQXAjyRrsiNMxKAduPddFlDNS5vQBbDD1zNUFAKaNBixo6OqF/Hx3S4xu9oApvv8ZNpAD35zUgabcf3nohyBC9Dg0ojwdaBsbsFQ6UEI9Io+b/2szFlisF+1aLSuXei8WnYn92hmAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFdBl4oly+v5EDzv1v3dC+TsVpDheb1hphiY7sT/fCc=;
 b=mSL+a6A11WVESi64NgWk9HhsWhscKAoq2jIYgAmxGpR+hn2FF+faD31rWps0WStLSINnmnQ6P57G79xZSd/5GMEBB4K581LRIku8NfhtyQhG4OFVovRK5bQuWNWXpRc7ygCNWxArlVDm+xl++Ic5O3OT0znYOZ8ZgsmQ9zIE8AJ7lqLopUOLyAn8tUStXh1s94iPMur3BwSLJmb/pu07XgG2Q74ROM1Di7w4jDB+YHWsoU6RJrJkxB25naYSdKjsInt7on+JrEl8gH3b5vH3r9PayyisYIDAxOYErmRuqV1xgFT6g4YDAojMOGzs4w34mj3G2BZKphNgAzCDMHlkVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae6be008-0097-3b7f-5895-ee88f47b5fa9@suse.com>
Date: Fri, 19 Nov 2021 11:23:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 6/7] xz: move s->lzma.len = 0 initialization to lzma_reset()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
In-Reply-To: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47676349-3ed7-4dd0-2313-08d9ab4691a8
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51686ABBEBD1E2356DC4A244B39C9@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o6Ve08ZqwddAUZnt8LUF6/sDPpgDmdVgiI1iiGI9kh6WJPEgm6JDFxjBNESYevFRCKxd+orWtLs9WawITiilp0AVa3tVftd07QPj6C+q5AkNmfU56MPW1Vyn39In+kapCdk+Vrz3wJYoEYkqmwg9Ule4iys6QCDgBLalNuis/Dpkqgx0jYYAEmmCHK6/7q30Q2XbTO7mkOWpFn2YrhEIZ4jtzzM39Cj17Pz4dIJBXD2ruYCFCwZYH8yNxNBQX3+y8pVQtg2y2LkGUp8SSKw1Qqw/B9XFnUsq4QgkXreBdKAzsHyigXYzRYjy//mvDK2GV+vuDayQk+ZRDBiytFIIAkFdt3mjoCyJPwVxWM3JeteH9EEFKCj5kmpZIt952UCnZYv9T1KrBE4zBkHSVU6YCJX/QAwvMHFR83zYGcidvENkYU2bwrxIWiGq7riWwGORae6cJc3g7VzdhcNiqsn2x0i4OUOyunfR4mtv4+FF/wdzK7J8bIDX057PgItIYH/SHX6apZX4vsJToof/qHQwLoInurH+8b6ITVMblBcB1JlVyUU82OVma8mxDfpDBZ1GAFk6qeHNm/5t7MHlariLO7I2Z6vtCGe9X9jPkbK+s3630ZD5MSkcDkpjPe+SGr9DudNeGArk46khMsWxHT9TshdFG+xJbpIqFm66KawkNOCjqK3m1BZrJmWcOF3mqKlZpi7Is2REDk/e5vI0PMVMpG2Ts2CA1T+kvnRe061LhvUfoS/OCF1nZX+HSqt5EkdTGlbfQfC9oNn3owxQv4P7TwBQGCVyACnHmXubC3OqvdGo83es1yhz6TksaqpXiw7a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(6916009)(38100700002)(66946007)(316002)(6486002)(16576012)(8676002)(966005)(86362001)(31696002)(2906002)(186003)(956004)(5660300002)(2616005)(4326008)(66556008)(54906003)(8936002)(26005)(66476007)(508600001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlducmJaaXJSZWZVa21URVFUTjVqY2ozZXQ1RmVpTVRTQ3o5ZkpRSGZMRURu?=
 =?utf-8?B?U1htTHlSek00cTE2emRQREllTEp5cXBGdVFGVGV1UmNQL0dINTNyZGp6QVhq?=
 =?utf-8?B?ejBzdGo1TG51cmQ2NERrTjBuQ1RxTURvNVdiTGNaOThUeEhRYUJrSnBlMW1q?=
 =?utf-8?B?SVNIYnpNdCtvbHVDaGEyK0QxQ3ZPRjRsZndNYVFSYWtzRVFaVjIvdzY0YUwv?=
 =?utf-8?B?d2V4SjhFcHZYa0RRVjhPZGIwWWRmL1VCZXZCSXUxOHAwRG9xNmR6eThLZkJj?=
 =?utf-8?B?UnA3ZmJQMlBWSDFYSW5neWFpcXRnd3U1Y2dUQUJQZkRQZkVyVXBxMy9pSDVU?=
 =?utf-8?B?VFFYYnBSQWw3QlQ2dWI5MEp6dytCaUx1NHR4OU5UREY3bjVnN2pmY0x0Wmdy?=
 =?utf-8?B?aW1iYWZUUW5hSkEwNlYyTXdSQUFFNmZIaGo4aFJZR3lJcmNiQ2lJQVczOTZQ?=
 =?utf-8?B?ZzVPMUJRdkVRUEsraUxsNGFpdCtCWEMyVWlEVldxOHBpalFEYkM5SnA3Z2pJ?=
 =?utf-8?B?NGgvaDZ1SzZjMjZBZXpzWUo5bnNUaVh2bDVuQkdqTFdIdG43OEhHVE5RVnpF?=
 =?utf-8?B?M0JBSHZyMXBScHdKS3d5WU5NTXJPaWxsckpxM1puOTdVUlpyMUMvVC9RdUg4?=
 =?utf-8?B?UjRmNXNzc0lNQkJRZDdQc1dlaURscEpwTzJ5bFIvQStUZWV6bVlMalZwaEZh?=
 =?utf-8?B?M3JYcGthZC82V0NsN2VjTHVhWTR1U3RuZERleDl0Sy9NTUJEMmV0a2Naa0Jr?=
 =?utf-8?B?SXBuWVlYRGFHNWt0NzJVWTJQVjd5emVvSUlRQnNCZnJxMC9uWE4wR1EzdEZK?=
 =?utf-8?B?cUhEbVhEOURDNUp2cU9qQjBIVzF6Q2RHRWg5V2szSTJPTnFqbWtUcSs1a0Jl?=
 =?utf-8?B?bWJjTjgzVHhDQXpWUERoc2pTY1RoNTllR0Y0M3RGcU5YZDQ4QUh2Q1JDa2xH?=
 =?utf-8?B?OWVkNVAzN0R1L2ZSRGhLOURraVRHR2JSNEs4OXl0bEpKRlk1dStoakU4OFB4?=
 =?utf-8?B?c0MwMERDVHBoRmxuWUNoZVV5VjA4NE0xMXFBZVJoOGxBZGxNN1FzSG5FeXRJ?=
 =?utf-8?B?dVl6UlNXZncwOG04cXlMNHd3MXFBdXFDTE1UK2dtZmFzYy9ONktOcjZDQ1Y1?=
 =?utf-8?B?SHNSaVRXdVJxTTdhZjV6R1IvNWJUTy8wYnRMSFg5dFFHZlRIWHFyTlg5eHo0?=
 =?utf-8?B?bTdPSmRJRWI5R2FDYnZuVkUyRkFnZEFrUjVTbS9lUC9qWmEzdlVCZWZ0NTlS?=
 =?utf-8?B?M25aeG1sbDRwb2pJWGVVNWh6ZzVQbXhFUktrTWY1TWI2TG01a2xOR1N6OThP?=
 =?utf-8?B?UTdTbnNUTG5TVU9GQnBPbzRlY1U1czBhamFaU1FaUm5oeExlR21hYzA4dGU3?=
 =?utf-8?B?bFJvaGRFQ0hyQUgxNFU2YmJFZTg4OGNOUFBhSThZRmJYSXMycTd3RVRNTmlQ?=
 =?utf-8?B?Z3ZKMDBNT3Jtb0Q5UXB0U2x6dGhmNitLMit5MWhwMzlQK1o0eVFVNXk5ZTF5?=
 =?utf-8?B?MFhGV1VNbi9OVy8ycFRYWWd5aDNkTWNSKzJ5VFNvQW1OSzBLQ0xrd2pGMmxo?=
 =?utf-8?B?bk1rYm5oRUt0UmpWNjMyN1hISzRRWTZKM0xaQkw1bHc1THJOTE1KNUpzYU5K?=
 =?utf-8?B?enlmaDc1NndUZEFzQW9pU1NxNEg4cW1BczVwZGdMTHBXL2Fta29NZlhrVk1F?=
 =?utf-8?B?UmRhNUZLZjVsUDZtdm5BREFsVHIvKzZsOFBwK0JZdVpINUp3UVR0VEt1Mmp6?=
 =?utf-8?B?NHowUE00Yi82RXNqTC80R01IakNqUlprNDJyVnQ5aW1xWDM4d0U3bU1nZFdx?=
 =?utf-8?B?ZW9WVWNaeVFwZDZuajMycWVzSTFhSHRNdWF0VGxKRVZqYWJMeHorV1lldXhs?=
 =?utf-8?B?bmZTRkZmQTJRbzZIVitTQWN6V25mTjRQeGRsUUpUbG5rbi9lOUgzTXZPODg3?=
 =?utf-8?B?bGJ6RTJtRXJuQ2xidFZ0TndxUkwwQ1ZhNnU4UlZqT3FISFl5dHdyUWR4UTR6?=
 =?utf-8?B?SWluNUlKNzFXcituS1BxMFM2dzZLVHZlU0JWNDVYK04vYmU2UEFYM08vV0xU?=
 =?utf-8?B?Rk9mK2JtT1ZUOHJkRkliY0tURUNVTUM2djYvT2V6WEZwRnVCYUdoMFNub055?=
 =?utf-8?B?cUJOTjkyZUNEK1J4SXNid1ljN0lMbERpdW9IUTRIZDFLZTI5WlFhd20vcjBi?=
 =?utf-8?Q?NIdEwKLK3wuFVtKVgfWx/9I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47676349-3ed7-4dd0-2313-08d9ab4691a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 10:23:03.0361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SX5mjQOE9yUhkhMSa8ZLXZFWIQXMTi3AFJis4LzGHZIxqG1YKxCE5dzGUD/Kotr9ZWnur2XEmWuaWoLTrDdlYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

From: Lasse Collin <lasse.collin@tukaani.org>

It's a more logical place even if the resetting needs to be done
only once per LZMA2 stream (if lzma_reset() called in the middle
of an LZMA2 stream, .len will already be 0).

Link: https://lore.kernel.org/r/20211010213145.17462-4-xiang@kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
[Linux commit: a98a25408b0e9b0264abcc3dabfafd9ff2ea1046]
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -791,6 +791,7 @@ static void __init lzma_reset(struct xz_
 	s->lzma.rep1 = 0;
 	s->lzma.rep2 = 0;
 	s->lzma.rep3 = 0;
+	s->lzma.len = 0;
 
 	/*
 	 * All probabilities are initialized to the same value. This hack
@@ -1174,8 +1175,6 @@ XZ_EXTERN enum xz_ret __init xz_dec_lzma
 		}
 	}
 
-	s->lzma.len = 0;
-
 	s->lzma2.sequence = SEQ_CONTROL;
 	s->lzma2.need_dict_reset = true;
 


