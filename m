Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771D2406718
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 08:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184059.332586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZk8-0007Ih-Bg; Fri, 10 Sep 2021 06:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184059.332586; Fri, 10 Sep 2021 06:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZk8-0007GJ-8S; Fri, 10 Sep 2021 06:10:32 +0000
Received: by outflank-mailman (input) for mailman id 184059;
 Fri, 10 Sep 2021 06:10:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOZk7-0007GD-7k
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 06:10:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20faa24c-9c0a-41e6-bf83-4b6531a90ab3;
 Fri, 10 Sep 2021 06:10:30 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-7CqhNc6IPtKDaK_k_fppfQ-1; Fri, 10 Sep 2021 08:10:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5744.eurprd04.prod.outlook.com (2603:10a6:803:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 06:10:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 06:10:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.8 via Frontend Transport; Fri, 10 Sep 2021 06:10:24 +0000
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
X-Inumbo-ID: 20faa24c-9c0a-41e6-bf83-4b6531a90ab3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631254229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9uOvY/Pl51wD3i0eQQ8FBhnALb8LVICAwNjRHuvdLI=;
	b=kHRSW3nwzPr2KMQ0mHNigN16SAowFwAYtACEiZuKLFdFzhzTKqhGc/EZkuR9iRgJVy/PkU
	EjfGTkTUxaw3m3bR/bmGv1Wu5VqVOI3x+oV0oVHqfcLKC5gm3wnvNt/7MzO8HcSL2Zpt9L
	Oey1HmQnlhfCoxx3LAN2UXqDQdQ39rU=
X-MC-Unique: 7CqhNc6IPtKDaK_k_fppfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kz4J99pX0C3HzDzKrGUH1osSo3NPvylBDpnmc7Edfpa212vfQX4o/YSaYIsuMecibdnELtjuAwkpT3/AdKFtvhTXSTdojUWsyS8JVPjwi16hUUHrcLh+v2QtTwd5IWaAmVfKzh9nBWhUA4BrScHI6nUH4p3JpDYtgWakNui+F12m5841GM/WkObg14UUDL/O9l0XWvujSqZjwCY4lrpaUMDd9PkDNMjlB/xgyYjpB1wecwvXAMg7XqU8TAsoozE8zhcPtT64yBkWRCNyvzvFoqAMfc5HEvCeFgNHMDq8uutZBAOdioXhY5hdTMYKHjdVrrg6XTdmjpcDEyRfGq+f+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=m9uOvY/Pl51wD3i0eQQ8FBhnALb8LVICAwNjRHuvdLI=;
 b=TovbCvxvVF9JDCBFIild87SDMxpEmdepkF5bKmGRIYQs3X1JV8O1ofwGzAUVr/K83m2EjIxbSu3blmUe+YoPbLKIvmV9MAMcUjBjMsqWk0UIKaVoX+HEm1JwCjPRj/aPrXBVEZjjQSbez+ZNii9vT8zDSmz4Ic3ami/rSzcLFzsc6AahnpG8UfC8Wh4CMSu4SUekdN8rjtrG2vEFmQMKSwFWXytPtN+xXIDvgKlWplP8PuuBZs74jRi1k/G6LKLSPZSBeExoVqB7LAfRIR7xYqbk0HFy/c2uYFCW7Pr+RtoMXPvKfAjuYg5O35Rm7jmAOYWS+LGCuFDT43UnjOqB2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 01/10] xen: Implement xen/alternative-call.h for use in
 common code
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210910021236.15082-1-dpsmith@apertussolutions.com>
 <20210910021236.15082-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac8670c3-a7d2-cc33-5043-22474567ed11@suse.com>
Date: Fri, 10 Sep 2021 08:10:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210910021236.15082-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e58d47ff-9176-4ebc-0c9b-08d97421add2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5744:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5744B87294C68C19BC3CFDF4B3D69@VI1PR04MB5744.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hsSjKzS9as5XGdyWIsWOsNzxpyfIiUaCdMyH1K6fUaTtyY3aLbzQO0duO7vPRCSFHWc21sNwjbhCa0lCJ5Hb4so/B0H5RFFEF83WC4MO4EGkTLVMfmEKIEc3J6eYYbNuF1A0YQOH1prMJBUieyPv5hRgdDyhMMrWued5UGmC6j6eomPYVsPHDVg6aSGFabsJmPQYX92XxRWy9PkOBSYsvhmtMxtiHGr4hi6TA/RtccieNPGQMC+TYZKHiNSrIfUy7es5qxiR+hJWjnoU36+qhSbBujDPiQz0fkFf0OQtUtlYta/6olgUDN0RbdkfDFRV/AC52NEOA2Rht2EsxsZ8FD8sKNVC9kj4klpIVF0lZE+NGb5+QytdI42AmpWaZRqfPS6st888FNn0ewlN5yQKTKnNd36OaZI+KiN1z7+9OfDFu+rKVNo1bauvK+xkxPbxJEKxabZNf1ptDj16gXajMz66AZP5tDLO2bryeuhGRbKTu44VIhweM28CTsmRLKplqIRX8GejOOzEGL0H7s0sSlo9X9X3ctB7VWlrsMXuRVm1mYUQz0okslwOwA/LPrXbgyoLn+y5EZhvZXKX7EXL2VbKm9Kr5Q169E3VecNnhA8H0kOXUUaMMuLOQUZWoDZw6OURwknLxUxvZTVF8m/BjMzcdgmYirDdZd6wISbjHLTv1cweyXHir1tfc5+2oJ538zBo4hm1c4ArHExNgESd6pDlX+unxtAENc4GCp3J4kQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(346002)(366004)(396003)(376002)(136003)(956004)(31686004)(6916009)(7416002)(186003)(8676002)(86362001)(4326008)(478600001)(2616005)(16576012)(66476007)(66556008)(2906002)(66946007)(38100700002)(36756003)(26005)(316002)(31696002)(54906003)(53546011)(6486002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUNXV01XSXdGMkE1RW9pTXZGSExmVC9YZ3h0cHFCVVF2NHN2ck9jMGlZNFlB?=
 =?utf-8?B?Y3gxSXc3MllZY1p0aFJ6UXl6MTRsaWZJT0lNajd6dGtqcE5MWk85ek1QbkVV?=
 =?utf-8?B?aWlWS3hSaHJvWFBKdFdKSzhacytHSjJqRXRQTkZFbzl0Zlh5TFc5aXcwV1BB?=
 =?utf-8?B?MmJsMXhCQjFTM2VQL1Z5U2o5V3FST28xSFlGNkV5M012ZHdKVlVUQTJ6T2FI?=
 =?utf-8?B?dlFPMVlPNGZGSUVFZStOd0FyNExFdWxRN3F6a2l2Y0lnMDh4OVYwcHd2eG9i?=
 =?utf-8?B?QkFiMlpZcTVqMVVmejQva3JQRXA1UUpLVUFZK0ZMYURKQ0dhQ001OUVkN0t6?=
 =?utf-8?B?V2NOdW1MK0FJMm9zUEtiYUNnRjlIUlFNRlUxaFhZR0JsN29wV3crRGVqZDBv?=
 =?utf-8?B?SmczWUpLTWJJR2RFWTVKTzVZMnp0dzg5U1hkRThobTZiVG1FQnR4WUEvY1o5?=
 =?utf-8?B?T2xZWVIvRkpZem5Lc3BMQiswaDM1L3MzMXRDZDhEWmIxZnk3N080TUIxZ1Ra?=
 =?utf-8?B?MStqOU1ua2JkYkhlb3NnYUdTejJpZGNEbktaOUpiSXRDSzh3MElxVFNWTEVN?=
 =?utf-8?B?cVVKWldsOHZZb1JVQ3A5REdDZldwNDVlRnJGZERmZkR4SGFJSVFuckZXSU5v?=
 =?utf-8?B?UExrQzJYcGJ3ODhHZXp6SktUeTZzcXlrMEh5UDZUZkZDY3RWcEYyVjZhUWlQ?=
 =?utf-8?B?ckNveDRNQjBJaUpYZGhQa2txNDhPR2hJRllBVm5aRkRkRllIUXhlNFFrUkFm?=
 =?utf-8?B?QnRjdE5TSkFMdGJ3NmZxSXN2Z3VnRkFTaERJVzlCZjNaeEYrMHZsdjdwUEw4?=
 =?utf-8?B?QVdYRXprNVk4bkhEODRrUTRQRVp5VitSYTAwRUZ1ZmNydlhXVXBQUWRVZEZQ?=
 =?utf-8?B?ZStwaTVXaUNJdTRQZ2pRRVhia1cwWk9HS3VrYmdvaG1DOFpIRTAyWWZ2VjV1?=
 =?utf-8?B?UlEyc3ZPMGRsVStqK0s5SWZDTzlhRHZlVlFCV2hQK2RvV1hjcVU4NTQ5bHpK?=
 =?utf-8?B?NzZsTXd2aCt2UzdqMmN4UkYxbU40ZkwvZjVWcmJYeHhwZ3NtTEtoWXZsUk40?=
 =?utf-8?B?THVSaDZ3ZFVyL2p6bXAwRXg4M2RnTld6aGh3UmZ3bkZiOXBqV21rZGVEdzJD?=
 =?utf-8?B?a2xKOWJFK2I5QmJyRFNIU2JZYnBYL2JRdForN245dGMxZ0x3ODJQeVZFQmEz?=
 =?utf-8?B?SE1CNXZ1Nnl5REpvQStrQkdOdTRyeWFVMVBMOTc4cGV5cGJxRUpURkwrTzJs?=
 =?utf-8?B?TXdISTROMittNjhra1lZZnNMcVBQT3lJKzUwQXJPRjlDS2hSZ1VlRXFnRG5p?=
 =?utf-8?B?QlVuMUJMd2lqWExyL3NmYjFqbW51WWtpWXJKR1llQ1hHdktKR2lzOGVxTHQy?=
 =?utf-8?B?Ymtsdk9vTytXK3ExOTl0UEZRWloyZS9TZVZJNmN3SGViRmJSQndkNUdGUzhH?=
 =?utf-8?B?d0ZMVlcrQkNTYnlIelVTUFQza3hmOW81QlQ4UzNOVU9YR0p4dGtJUkV1SjBX?=
 =?utf-8?B?ZjlrWHgzemV6UWNEa1hNOW5tczBYMFJwZFRpTGlCK25OM082NXRBQUhsN1BG?=
 =?utf-8?B?cWs3RnNaVS9qODFOZkVuNkZhWjI1YUdMOVB2MHVBcWtwT2lrN1BPQjBoSUdu?=
 =?utf-8?B?Q0ZUV0ZIazE3bDMreE4wSjIzQ1FnUGh6MGRXbjVzV01KZU0vdTB2M3RGdEZK?=
 =?utf-8?B?cW1ycGt1TG1YQnNUbVJ4YmY2Y0g4MWpCYjlkSkdmTEU5djIrcHd3bUJPQTgr?=
 =?utf-8?Q?eHQygju8BLZ7muFXolx8Rv9LNx+nSjN0+6rFTD9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58d47ff-9176-4ebc-0c9b-08d97421add2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 06:10:25.0091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+pZC32I+a9UqB552BqoFWR7v/OG9y8XOuBfxAr5D5Qz5i4oyWtDxkvlDmoVBNrqMaKdUHkU4zDHvnksTwK1iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5744

On 10.09.2021 04:12, Daniel P. Smith wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> The alternative call infrastructure is x86-only for now, but the common iommu
> code has a variant and more common code wants to use the infrastructure.
> 
> Introduce CONFIG_ALTERNATIVE_CALL and a conditional implemetnation so common
> code can use the optimisation when available, without requiring all
> architectures to implement no-op stubs.
> 
> Write some documentation, which was thus far entirely absent, covering the
> requirements for an architecture to implement this optimsiation, and how to
> use the infrastructure in general code.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

I did offer an A-b on v4, dependent upon two small adjustments. Was it
deliberate to neither make these adjustments nor add the ack? (At that
point I did offer making the adjustments while committing, but I think
it goes without saying that upon re-submission the changes should be
made. Unless of course there's disagreement about making them in the
first place. Yet such disagreement would be worth making explicit then,
imo.)

Jan


