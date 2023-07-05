Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C49748240
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559048.873727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzrv-0006Al-8O; Wed, 05 Jul 2023 10:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559048.873727; Wed, 05 Jul 2023 10:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzrv-00068z-5Q; Wed, 05 Jul 2023 10:36:19 +0000
Received: by outflank-mailman (input) for mailman id 559048;
 Wed, 05 Jul 2023 10:36:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGzrt-000672-Ga
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 10:36:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4ae6ce4-1b1f-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 12:36:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9764.eurprd04.prod.outlook.com (2603:10a6:800:1d2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 10:36:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 10:36:11 +0000
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
X-Inumbo-ID: c4ae6ce4-1b1f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVZNiPM3hiLIrWWDvGEAdBDhHeCdbawB52sUllg0N+1X/Sw0U63ksp/pmevV0Ydkil9PZnmzeDpyWGXaYSTGZtuIBEkOF27O+pDnZu5k1gy4X/453mHVlj86QxSAOlSs6rezOd47gCIWixjjz2tNctVqwVL/EwijkJJXOV6871gCGjOwE16rHGEXd3MuwTlkcwykkCDT1yF2+mFZ618FuC8qbptYfIDkkI4JThi0Chmaif6d+84MD+5IRxwjlBiUr4kI8n73PLVVhJmf/64Yep41olAeflQgH6neaX08FM0QjGWAD+ZozrJ8gJE4wRCrlIhBQOT91UyC+jAdopteiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LngUjxPdqlRRT/0MD4HYtqAs9ZhjYruk+5DtfnwbvXA=;
 b=Hdqi1hI8WJKBYTFLd2z7X2VGW2J1gs7xsBPzNasPBlOWeygn5WLFLyV5sMnouGZYQZdYju+CWmEGXP2drD2Pd0RP2WHRVXaFL5ZGyTfWznZVQMKfBMGGrhmhtsjwbKlSQKtrFhj6sZNY80CrMrSnPab4Q8VBhWRTXUBrG5qN+i4tTv7YqhgqFg/iHAVAWMYmwf8I9WqGcqxwZA3MuEvXI1yYsx7mNHgGqb92/8acHGjwzUw7xNTMGYhTgzPqaBbhpE1vO6ch3oy/9rQCQFomXy4v8emDkbm10jOjuhm0vJv8arly6D/di4wl61jFt1zc/nCHj9SaCnBnbQ/BMTh5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LngUjxPdqlRRT/0MD4HYtqAs9ZhjYruk+5DtfnwbvXA=;
 b=WPVXVMkPrdaP9WZTuH4C0umc9awuXYhOlqyv5dnZF4SJNb87c/VKx5cCsxpC0vb2BXsrYSY6UKqgLfJgm0kcaw0g0c+V4wIQJlDY7/mhExkS/WyscAM+6hY1en/AAlQOpFj0p0z0BnOQhlbngBAFGtcV3DkRfL4xt/bRdkNpeoN/UsFGGHrXb9g4RFQrXf7u/iJizqyjiMo56EkTsAud8heZKwjblp1kQioYwozmebxlOZvZMnjarMfjSHm6Hi9L8rzQ67D52iM7H65J9cJ3Pelf673ErOzO4aBqP1dX2I3pFGsGEaOe8lBwShLyWKBhfAQ6dKmc1lLPK8Q0A4JqAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b1717870-6013-fc4b-6aff-10e560571759@suse.com>
Date: Wed, 5 Jul 2023 12:36:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v9 01/24] xen: Introduce arch_domain_teardown()
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand.Marquis@arm.com, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
 <20230705093433.2514898-2-jens.wiklander@linaro.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230705093433.2514898-2-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9764:EE_
X-MS-Office365-Filtering-Correlation-Id: c824952c-87e9-48fc-6c0b-08db7d43a6a5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WZR/f73wHxsgy/If4oJvlgorJjVISCKJWPVwLihLJiWPFDi0tx68hk3z8R3Nw/5V8WWIZabDl67zaOqUcqlSVJADKxizlYfhw7E5CURHQKqczJOO/xGJF5G3B1k2vZdgGWLolq2OYvHQrR2IMH3LhhRKTdjl7vsqTyQUTigTK2Jdi0YrNmGsCqeGGuQwNn3lw7qHNGei3rnysGI/HINyW8XvQkJAkFQwU6IJZeD4cHEGnzo6wHyqj0pVJV6kG5Yjsa0E70D5H1vy/Sp7zdPRObFO7O8pohUaRCBQR/wEspKtPVsx5IL/Itpd2oAEJ7b6RSCidiGO5MyHwgjUp0BO8TLlUYPi/0jYgnRXcbFzuUKpSOZbCru17AKm/3Jg2rfkARvheVnH32EorWi4sqLJ3DmrgnNKO1paiDw9GeNStpINYIO5GKrQft5ETCJubkF3sKVf+tJ7DB/JBoOYb8Do8WIqLcYoA5RAS0igY1KqtvoGsbmN/Z1pmDjEINv+LSyILVU8UJKqHgD5mYJGv3wM+AUQpbD0z+BkgxpptTlOg4J7NVZGIgWyGmJz58D6ueSB+q7FA+EATcvoBO4lgorjku7tAYJJSak3KKpYXMmKRkjvM9huoy4AnwYW437irovDq5Qw5KEr5jfDC5qXwGf0hKbEtZ5MRe3g9Ecest+m9h/tJaL35UHYFViexVohxYMiQT/cXR7VLAekuLeq4kwRPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(366004)(346002)(39850400004)(451199021)(26005)(31686004)(7416002)(66556008)(66946007)(36756003)(66476007)(4326008)(316002)(478600001)(8676002)(6916009)(8936002)(5660300002)(2906002)(54906003)(41300700001)(86362001)(6486002)(6512007)(31696002)(4744005)(38100700002)(186003)(6506007)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1NrbzhJaWpNK2llSVhaZTBOdEJMV0p5em1JZVdpcE94cnlXZU1oMkM1dmZS?=
 =?utf-8?B?U3VaMEZabUt4Vi8wRGZxMytTY0RDbzQ0bmJQY2NENGpNVDh3VzhZbzkyVlFO?=
 =?utf-8?B?RERMUFhpd0lIWEZkZnIwcDVzdHo4ZnEwSXptR09aQ05YZ05uZlRyR2VCNzVN?=
 =?utf-8?B?SFNsSlQzRFM0NEdPNS9rVjFaT2F5YTVIN1F2T1paWW82ZkVsYmpRc0pUNlVN?=
 =?utf-8?B?QzdJeFpHVm9GL3ZVT1NZeVNocXFLNlNyWlQ3N1JlZXdJbW5RdUFFUWJZV2Rt?=
 =?utf-8?B?YTBqTG9CY2RkV0dUc2Z5WTN0UXF1SWU2Mk9RbFUzNnRDZG85SkY3Wms2K0h2?=
 =?utf-8?B?NG96QnZiR2w3TkJTd0ZsUXd2N05xVDFhMkFzMDFFMnIrL3lvbFlkNFZSRi9I?=
 =?utf-8?B?eE8vOXA3THVMcks1N1VtN0FyeGlMaUJvc281QzdJdUMzcFlYSENpYzdHRkQy?=
 =?utf-8?B?Rll6eXRZREFlOEk2eENvT3ZEQ29zTGdaZFhCekFoSnEvTzhEMGp3cU4zR3Iv?=
 =?utf-8?B?K3BGOUV1Nk5zSDYwaklEZ1FWMmNEWE9VaEd2MmhMVFdqaldkZ3BDTDFMa2F3?=
 =?utf-8?B?THZmRzVmWmtXVTB0L29scHRNckE5UlJMK3l0R08vU1dpRytQUktLMzFobHVj?=
 =?utf-8?B?QzV0cmIyVlZFcEJWVzBYVjRVU1c4YWdaZ3doMlpSNUN5S3lWMXhrbHRWaVND?=
 =?utf-8?B?MkJkb3dZeENsOTdrOGNrTVdJMU5DOElNaTNwZEFBZEpVVitabTcvM0hlRzVQ?=
 =?utf-8?B?Z2RwQXBDZXM5R3RrV1lWYytick1sdW9IY28yME9HY0REYUJndktsRnpIR2VU?=
 =?utf-8?B?SWFoRFFYc0VFY0p2Z2F6U0ozakRFVi9VMEVFVm5RZEdJSHRsRTNEN2dKbnNQ?=
 =?utf-8?B?V1FIM3V1a0NFN1NFTXRmSnd1enoxUVVGSWc3MjVwN0hnOE9sOUZzSXRHaXk0?=
 =?utf-8?B?a2ZZK3Z6eVhNSEowUGd0bGx6OFpJTld3VlRlT2VYTlI0UnUyYXZBRU8wT09S?=
 =?utf-8?B?ZXdzOGdtYjJnTmNqOXAvdTI2MklNMWlvTkpxeFprRzFPSDFZUjdWUHMrT1p5?=
 =?utf-8?B?amFwNmdEa0FBUmhTbmVEVkdaUktuNXJoT3F4K1RJeGlDRlZMOXRpYmNiRm9D?=
 =?utf-8?B?SmovbEdhMzM3Rnp4d3Y3R1JMd01yWjF0RDJqdDRYdGxQQ0U4TTZJNk01UFEz?=
 =?utf-8?B?Q1Z1NEdjZ0ZvRFlzNXRIL1I2d0s4TjUrc1dvejRmSlBrVXlJS0ozS1NaVEZU?=
 =?utf-8?B?d2xjSENuZy9ReE92WnN0Y1lFdkNtZ0VveGJrcXJSWnhCTStRQ3VEQW5GcWlw?=
 =?utf-8?B?M1pYREJzZzJNVyttV3JsYXhrQTUwR0V0cUJyTGhHRC85Wi9tWXRIUThQeFZC?=
 =?utf-8?B?VmQ5SS9oelR1Z2tKMFhWOTVpaGlYbEJNb3k4Y2ZieFZJYXBiVUErTjZYRnZw?=
 =?utf-8?B?cm1ka3Yyek5aWmpCV3Q5Y2NUV1BrSjdCNVNhOVYyRUFCTVVoUXZ1eXd5RmFh?=
 =?utf-8?B?RFZhdXA0RUdmcEE2ci8zeDF5OG1uMjM3VzJ4STlvYTNiaGIvbzliL1Rocmhk?=
 =?utf-8?B?QTN4VWVHamlyOTBWcXpNbHo4WU9VNWw1S0VSdVdYazFUNDdWckY0RS9VR24r?=
 =?utf-8?B?cFRpaUxjeTlKaGxyWUpxK0l5VjV0RWl4bml6VDJreUJGVHRGWWF5V2JOaGRE?=
 =?utf-8?B?ZWRQam9COUc3bGVWek0zNkYraUxCOGJhS09QTmdRTGVTYlZQdlZMb1BwV0Jj?=
 =?utf-8?B?aks1NFViZHhQT1ZqU01SR1c3cjVzaDVid1VJVnZnQ1FoRlhkenRoeENkUVRs?=
 =?utf-8?B?Skcxc2RBQjVpc3JTSUdURTFFU0F3VHRqYXpKdE1CZWdEV3JQR0hQSnFEWkpS?=
 =?utf-8?B?NlpGRGNjT3ZPa0s4WFJ6MUowcGZXUDNlUVhpZTV0Q3FlTitNVERraGp2RXpm?=
 =?utf-8?B?eUJ5K2h2elJWWk5XVWhGQnluWFNuZ3Q0MmMwRWJOSzJwVnZDRFhJQ1dtTU96?=
 =?utf-8?B?RTRFWnhCajYzR2F5K0R5S1NGTGp0NGdUemY2K2ZTWk1qZ0hnZzFvcDR2ckZG?=
 =?utf-8?B?UlQ3Y1Y0OGdlNmNINnEyN3ltdUlXS1RzRFpCV3V5OFVnaDZBRFZpRHFyQ1JS?=
 =?utf-8?Q?CApUdcWg7jHCGy8yDWfA+61H6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c824952c-87e9-48fc-6c0b-08db7d43a6a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 10:36:11.6377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wOmhRLg+mHYpc7F887fs4xcC+9NhkApRDk+FpRVUVzA2Egr5jpUIT5eGLCWAdatZA6v/A0MRgQgYFCg56/TwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9764

On 05.07.2023 11:34, Jens Wiklander wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Plumb it into domain_teardown().  Provide arch_val in the teardown
> continuation information for use by arch_domain_teardown().
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



