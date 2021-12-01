Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D4464BB6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 11:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235817.409032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msMwU-0004TO-Sd; Wed, 01 Dec 2021 10:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235817.409032; Wed, 01 Dec 2021 10:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msMwU-0004QV-PN; Wed, 01 Dec 2021 10:34:26 +0000
Received: by outflank-mailman (input) for mailman id 235817;
 Wed, 01 Dec 2021 10:34:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msMwT-0004QL-So
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 10:34:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b49490bf-5290-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 11:23:20 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-7NTm5iTiOT2Ra5UOVdUCfw-1; Wed, 01 Dec 2021 11:34:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 10:34:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 10:34:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0208.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 10:34:21 +0000
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
X-Inumbo-ID: b49490bf-5290-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638354864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1hBoJ+vcM00ig3TnGPRAkYpQNAf20p1/o9B6CdQj1RI=;
	b=I1xQ4XiCVWwXzyP2jzIa+Kg/dY4oreyLo+yhcVVRP1cl8kmbP4OwlAc2iqDqcnV7N9K44H
	008QlsbyUTMavsam6q8RtMLv6aa5+uNa/n4rJB2k6fn4/j9o1N4AUsCl1Me1S3LIX8gd2C
	ZeMN4DFsmEcjkeXo/hJ6oOQ2i/4kU0w=
X-MC-Unique: 7NTm5iTiOT2Ra5UOVdUCfw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Twx7s1XEWY8PEM4lGdVWNLFyAnReg8XdmI2Z0036eoMU0VFGdDwa37uCCcBVO9oiWdmzIUxw/2Rp+pVPnpnI+Eaqez647xwkfyvhKf0v77tBXxcipIXgvpG8UwjNm1zGU2rRTMwBE5GcmZRc60YYUB8UXzZMXYGwI7LeAo3YnZcHKpV9YKi1YOp3dNI12B4bkFty2CM0+WFeQjhqKVPcpRHMmJj3qyiZPxtSF1y07PDmpHji3ttxpmSL1AR+yANBcYv8lstzFYjKQMVhZGpSyJIeg97XMSx8Z8rioKah7X95nvz/HxNG+WzLoocftfgueFCB3vhu266nrKkWRJA7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hBoJ+vcM00ig3TnGPRAkYpQNAf20p1/o9B6CdQj1RI=;
 b=ZtGGvndG/ak6WX9O5Xgs2xz4xcIlMBaA4AHc1YBjHyWFGkAqL+4gSuI0PhrOFt2QkdIAsDL+dpDBNPgncmznTA9oKAxtAODzuze3u1XVdr3AFxcmcYHcsvU1blAtucUgOgXHH3Pq0mNxJQMUqQX8dTjraDSTrkxx7E4ZxXL7bpc3OLPgNxO2iftvoZ/P24jJYfELkHa7jwTYlgzqyCcBjQ9AASrP2FC2lb+2Mh+GIyl3S3vonftm8fmICjothFbEn89tYBCJU4W7jgAeKRPBafi2513yVCcFkgEagc/8rA2fXKmJMWLa08qjHUtCqoTMAvQYEdd2qG5wvAJHrI4bKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69b75eb5-82fe-e075-146a-28a9758da433@suse.com>
Date: Wed, 1 Dec 2021 11:34:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/mm: address observation made while working on XSA-387
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0208.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0fd7c3f-8fe1-451e-f20c-08d9b4b623b4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4381497B03AF1355C32A1743B3689@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KMQ69jLHJXDaeQkZ03f2Cc55hiOsLK7hSeCnLbmt8MEcTQtrhiZmSTlBB49OeMkd+MmooX29zaYUDDZxDeC21r5p/IBEHiVMRZfQKIwsUm0E8ksgL48unZqPhmjSmXf3dt4LKjZNKyR9tw9H+E05NwTZfCWDkPYxILNpaIGyP9sRWSG1VXyOaiyPPEILYcUK0UVYkyliLYxWV5u7zEq9i6xUuXB6qMFgVkWb6Kpp/0OO6Mgi8U3XM1b5xUu70s6FpY5pGfuE7QidYuKgYAPARZDbBzpq92kYSgI60Gb+OY/FRRWlUQylL8n/XhHN+wYyA1ng3hX5QbtuIM72wLziKWvcTWW6hb5fdeg9j4pVBb08abyuKsgPVcC36ylkn/OzO4Jfv8Fd97ykT08wzCyf9F/mKPeRjqZhYgvpLIzhmlHEDWPZms7LUAgiDGqPBgi8OTD+T9RTGuOzHlTIHpobro+mUMaqom5c9cnnzAcpgwnlWjA0aRojYRqot4M8bLzWhc28DHWXnr+3GFgcDGFhQK6ylqFkX8DnlFgUbLW7TneLiQTv6PgJgQA2wuhLhR7cTsl7y8M38sZBoo1H5zyNFFwXU1KkZi1sGXsFpX68l3jOl5a9bDWUOQwTPkpFn+yeU07aF7CiOK3p9TIJQMXTZS/Y5sjSSyLe8YtOFBNfJhTQm4bhDEgiCg+GHNNgkyPnNV6kOtOuJUUaOfcVCIQIUopCHvOG++TiMXWt2LH0gxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(36756003)(66946007)(66476007)(66556008)(956004)(186003)(6486002)(508600001)(31686004)(8936002)(54906003)(86362001)(31696002)(316002)(16576012)(5660300002)(6916009)(2906002)(4326008)(558084003)(38100700002)(2616005)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGZWNlFPQW9jTGZWa3JqQzZUZ3M5L3hyY3FHSGVubzZIY1pMMDQwT09TTXhv?=
 =?utf-8?B?c24rWWJ6cVo0eWtuWEVxdUw4RzdwaFpGWmg1S3ZGaSt4QjhBS0NyY0NramRL?=
 =?utf-8?B?ZzBneWVadnA0UEk2Nk9ZS3dhWVQrOGJ5c2pOekRYOCsvbVM1a1NuQmlUUHpC?=
 =?utf-8?B?emI2NU05Sm5zRE1CRkgvQld3NzlhY2RwcUZZV2IzWU9qU0ZoY24xVXBxQWk3?=
 =?utf-8?B?SlBBZ2JhUENudkJiam5aRUszOU10MzZpUWI5N2Z3dTQ2VmhIQ2RLdERQWXB4?=
 =?utf-8?B?U29JamN2VjFXRk1zL0hIZERPdHByRXgyaml1MTJHLzlxMU15Z3dLZ0dtanB1?=
 =?utf-8?B?Uk5vZnppbEtscjZpOXFPQ2srSThObFNxOVAwNG9HL1dGMFI3eXE0dTFZY0tV?=
 =?utf-8?B?eUpoTk8zeG1ET25uVzMzU001Wm5sRmdNcW15OWl1b1hGYnljTW1tWGhFbEdr?=
 =?utf-8?B?R1dxWWMwUEcveURMKzQwTXc4YWpWUElPUkZBc2V2L1h6UjltTFpXMHI1OUMz?=
 =?utf-8?B?dUw5MU5wY2lqZnpBaUliWTNDbGJZRlp2OXZOTDAyaWx0REdUdjhwayt0ZmV1?=
 =?utf-8?B?QWh0K3RZUG5RWVlmeFJKV25VS3ZzeStjQXp3QzhIdSs5K05wWm9NenM2ZUt1?=
 =?utf-8?B?YksxQTJ0ZzhLUUtyT29EL1A0SjlDNkpyZHo3U1BBaE42MU1CZkVQUXE2RkF2?=
 =?utf-8?B?M0lSWkJ1M0JlTW1Bc2hmNGJmUU41ZzFZcU9xZW9NU3lzay9FZWg0dG93NmhV?=
 =?utf-8?B?QnlmaElocnQxSUYveWtGTXZzdGxTVGwxZXpaV2ZSRk1NN01VZ2o4MUNoS0hy?=
 =?utf-8?B?NEQ0NFVNdER5bjZieFhvRkdxWGwyOG9OWEpVUkV5WWxKNHRsTnRxcUV0dnNv?=
 =?utf-8?B?N0FjY1psVzVqRmRYdTdJSWlYMXlJRUxWL3FJRlNSTkIrT242WElVREpFOUw2?=
 =?utf-8?B?M1h5WGV1UlN4VWZaU0FvS0w3ajQ4Tmt2aVpwNDgvdnNtVW1XdzZuSUk2R04y?=
 =?utf-8?B?MHFDM1QrNkpoTE40MUdZSEhGaGhZVW5rZE1SdUVGdVJFbHZhVGRuLzJlYlQx?=
 =?utf-8?B?czBzYjVwQkQ2MVYyS1VzMk9XSTFVSjhYTHVCYjVlamYweXhnWWgyT3lBUmlz?=
 =?utf-8?B?dHdkbmJMbW82d0JpOHVoNXhwazA2Tkhxd3ppM3RROFd1Wk1meFRpK3Znd0Jn?=
 =?utf-8?B?a1hqMzBHZDN2RHBOVUhGQVpleUpLMHRTMmZsd0duRXlaUEo4Mmk5OGVjVzdE?=
 =?utf-8?B?emxvY1lGekxNanNNQUlJdGRwZlZCSGxtOEJ4RTVXSDRYRzhqTWQ1TnFCVU9V?=
 =?utf-8?B?RWFwdFVXTGdhRERLODdFUmxoTFRHMDZqSWFLd2ZvR0dTTlVoeG15dDljdDRu?=
 =?utf-8?B?dm1NMkc0cmpSd1MycS9Sc2c1TXBFMVJJUlo4dkN3SkxrYWZzZEE4bzRVZkJC?=
 =?utf-8?B?NHpCL3hwMnU5TmIxYTJpYW5EckJuUXR4QmZZbXM5OFdRQWg5akJMSjQ1bkZh?=
 =?utf-8?B?SktTSlUzVFBhNmRzb2d2R0RnVU1kV1o0eGdyb1l5ZDd4YVJlZDJuK2N0eE1t?=
 =?utf-8?B?L0Q1d21yVVZNQkxMUyt5alErVEtDYWtCM3NWczlpdHIwbEw3blArQ3ovRVBz?=
 =?utf-8?B?ZzAzcGNFaG1tbm12eDgxSFRBOEcwQzRuWmw2UFdOcFk0Mk91ejQ3d1dIcjZV?=
 =?utf-8?B?ZVhLM0ZPdERldDRyYnFjK3lWVm14eW1RSWVPU1dXQ2ZyZUE2dFZ3bXFOWUVG?=
 =?utf-8?B?VVVqN2U5YmtXM2RvYmxob3RLbURFLzg3MW1CUVE3UUMrTDdTbjZQOTI3MWVJ?=
 =?utf-8?B?aVBLZGNkZy83R2QzNXYzT3ZpSWtnTE5OSmgzM1dkbHdaWUFhRm04a1dCSktI?=
 =?utf-8?B?ZkFOTE5OTjRONXdkZlBqbjBWcE5GeG1Wb0FPOVZncVBtQmFJaUlJdGtXcnox?=
 =?utf-8?B?QVB6SkZMaW0zQ3RLaWcyU3FxMzNwb0RDMlFPV2xTZnNhTnRrWkV5NzI2TUxn?=
 =?utf-8?B?eWhpNGRmTmlzbExsY1hOTkk1eG1uaEFIK2RhTXkzY2pQVTlzUWMvQjJKZzhC?=
 =?utf-8?B?ZGM2Y3VwcjNGYW5OUVIvUnZKckRoTytOd2ovQXdnRzIwRVRSY0h5MzZmYmZw?=
 =?utf-8?B?SEpYNVpudnI3TFcvcDdLR0h5TG1ZSUFOVnJnb0tCb2wrR0xVKzFmSTBTcUhQ?=
 =?utf-8?Q?e7+QkbktjZUuLZ7JGewYc6o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fd7c3f-8fe1-451e-f20c-08d9b4b623b4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 10:34:22.7613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ny295bYyWUERl/P1CJ+KK5R0rQK0dEge9kBaYlMIajoRE7FiiSfEc9HAw1ilrTFDNAnzvKYxpZHbeEpt1jFOzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

1: shadow: defer/avoid paging_mfn_is_dirty() invocation
2: paging: tidy paging_mfn_is_dirty()

Jan


