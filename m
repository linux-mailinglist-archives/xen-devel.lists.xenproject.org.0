Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108B4047F0
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182883.330718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGaf-000404-Bb; Thu, 09 Sep 2021 09:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182883.330718; Thu, 09 Sep 2021 09:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGaf-0003xs-7H; Thu, 09 Sep 2021 09:43:29 +0000
Received: by outflank-mailman (input) for mailman id 182883;
 Thu, 09 Sep 2021 09:43:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOGad-0003xk-ML
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:43:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60feb706-1152-11ec-b1a8-12813bfff9fa;
 Thu, 09 Sep 2021 09:43:26 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-h02rg7DRPUykDqzmikeFpg-1; Thu, 09 Sep 2021 11:43:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 09:43:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 09:43:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0252.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 09:43:22 +0000
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
X-Inumbo-ID: 60feb706-1152-11ec-b1a8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631180605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gRoBOh5Wipkr5PeXQUpNw1uYM4KDM+r1pHZzMrWbHpM=;
	b=QiwTSptg4mxdGQEJCyLekJREYzeHhWCacKzOB7dKpV9kwp12d7S7Q15INNvN8sH2YSntQ8
	83lw7ued/YhgqKtaV3h9dBZZ21SkXt2sDYNy7G4d8Km886BEcBgwa4NxcWwE0KTD6Xnw0e
	/V6QW414BZfjiAW8vWINzqGcK1uE0bI=
X-MC-Unique: h02rg7DRPUykDqzmikeFpg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMKAQ0BTtoKXz+aTlCfWxHI1n2snpWt0BJlFyF20tiNjVYHRVuH4tFtxkFOzDDn65RL/FrP14WRd1UBm5EgcnHCKfe74joaI/sX4g8gFbzLCELkMXF+K0E7JOwx+xOCoDPLy4HJc9SFM00HD+26dAlsJ3Y/kKfhArVLb6DjJ0qblAy0WVnb1lPjOoTtStumttq5wePt7l5Mf/YMqSgeIGeI2I9JfspeW095kgEcnW25QK7L+clp53lap7WKq65zItJc+gIIB6UE3umQiZDYLdoJmYYsLPUB/Qcxj/9cbWZChOxb5AO987wpigTOl8AGhwIcS8+g1sU/eZYZC77c73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gRoBOh5Wipkr5PeXQUpNw1uYM4KDM+r1pHZzMrWbHpM=;
 b=EKX+8uDAjpMl129VxONrAzdxVjPikJXgPNTdzwj3SZPmFLm47u/e9JRH8uKF6CEJDvbS43vpdJ7opfxfK7jeRb1ZNtL3Pbwy312BqO514w41zVJA6C6m0DjEloR3outX72jlkf33RMUYgIucUFm+9nLRjyPTUoTkn+0cK3578JkqwkxYnwOb3mQH5WMc8JK8DvHz4/rMT4Lj30zRZ7vVSXnyV8lXtjJdCFgnHt8ZFHCHcG9iZzKkHJTQeoswj5OJ8axzpanoeEDz+K9HMo0StaRgwe7E/i/bDPEb2at2ftkNiDnXjGUA0PgzXf0u5cnA30fsigKqVXLnJ6TgW2fFbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/spec-ctrl: Print all AMD speculative hints/features
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210908173352.3627-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf3c8ca0-7df1-0f30-ca6b-aba524bb80d4@suse.com>
Date: Thu, 9 Sep 2021 11:43:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210908173352.3627-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0252.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::24)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a976689a-0b59-4d33-a987-08d9737643d7
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68630BCAEB2E1D76CDC82E78B3D59@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WzSy3PO8YyWW0+g5Q87O7IbWiza6wUTk/Vln+R5Prol9Uc3grVlNziQ3WbU5ZRBPt+nJUWuxqkrFuoklk13+RXmB1TGzWajlCbU/GYpJVPiwxM+EVul4b1QQg6D0CEsOp6wQqtHSZ6DgEq/4nqpGma+9hW5BRaxX4PT6xpqORTRUDsIJc9jXAMRLzKzWtbwSzgNRpdlNAC8rWRT7tgLfYx8H8uPw9XElJnj9LH5rbWpEpN7gHgh9PPDFkTF/aE7/ZK9XrRbz4DAaasX/Ub6jXWERo6TP0Yk/g63qwzhMc8GpE0LzXjpQicMnnio2QrK8Lzw7lhTbU1Q6JSCMe9pksOffIPV5T938zw2xHiSbC/xCtka1o6cvdrZ4g4VWm7TW//a97Mt+PMW1UawszwUqbosZI3+SxfeTj48qHBrZm+dRIxmORYpTOGYSAJn7cCn0OREC8iAY2bsaEnRR7jxSeZVWg+zFCcMFdVrnkmtjUGcTdlNzL19RcXTSRHo33IF9C4aQRmOmjTNtbyFA0dmkT6baE6Lmhg69aKVXZi0iFWl1XTqGmrFHFMpZAFuXoPWF7GOvheFP8UXL/uGtjCwAItNFdtSlY2V5h0a3zrTrEwzpEkWewiHYLd130YOqWiXLT96bYET0LS3YXBdSRySUC30ltWAuqbynVXPmwgCDycEYMiqXwzkGvoSttAtjbaC9piGTntQjK2kC5S4x9i8IAOIY6y7S3gbsXDjgDNz8fH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(366004)(136003)(396003)(376002)(6916009)(186003)(5660300002)(478600001)(316002)(8936002)(54906003)(8676002)(2906002)(66556008)(36756003)(16576012)(31686004)(38100700002)(2616005)(6486002)(53546011)(86362001)(66946007)(31696002)(26005)(558084003)(4326008)(66476007)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDh3YVNpS2czamE1VG1qeVJnb2Y5a2JjTnp0aG54aEprV3k5NDNWMWFGUmha?=
 =?utf-8?B?Q2xPRU5pL0szYTUva1JWeFB3Qm1aNk1CZHRSMjVYeGxFdi9iTHFzTTBmTG1i?=
 =?utf-8?B?QitqZXplbkppMFNBZk1pSEdWQXh5Wm5YUW4yaVp1aThxSE1TWHd2VEtPVFBY?=
 =?utf-8?B?dHpYN2hodFlGc0hsbTljN1IzSERFK3plYjBtSWhNN3EyZ0ZPd2UydDFMRzdX?=
 =?utf-8?B?endsZFZzU0s5UkxqUWt5UTdqYkszNUp1aDNMbWNoVUdMaUVqZlgwWFdVZ0dz?=
 =?utf-8?B?NUo3NGJxcU5RbXpLTGFDU0w0cSs3MFJHRXJwWitob2FTcEJYY2p4MFhhTlRX?=
 =?utf-8?B?NWNmYU5KY0NDWWg2ZWpGdHFmaytPakdrMVdleE94NWFYTTlSRTZpOW9FM0xt?=
 =?utf-8?B?YkZDUmdTKzJJTGtxdFNsSnZZWjdoRnVWS0hOOXZzSVJ0TE1QMUtDeUpGZC9T?=
 =?utf-8?B?TUx2S3gySkpQekJ5OFUxS1FZQldGYTd6SFR5VmRnMUpzbXQvUjlKVEx3QUlF?=
 =?utf-8?B?YlNJRHhLSCtETnNPSHZWeXBiTks1aTlNdS81NWdNeGhheG1Tbjc4Y21PQzh6?=
 =?utf-8?B?MitJSnAwTGxjNDhkeDVuRitDUDlsNGtvOWhYdTN1eEFncVZXcXU5d3N1U0V6?=
 =?utf-8?B?aGc1MUsranBqSVc3NGdJaUwxZzRlOWVCUUJUVm5KaVZGZDR5aWd3R2wyMGR1?=
 =?utf-8?B?cU1rSXFrMllOZzVrZi9VNkZwYUJvTGYwMlBycEd1SmZxbjNVVmNSazlQUGpP?=
 =?utf-8?B?b1lqN1FkdmRteVMrT1llWVlTNE00OGxDZktGdHFmVTd5Zk9uTUh5by9TOUZ6?=
 =?utf-8?B?ZzMvR2RxeCtka3JXQTY1SVI1ODQwZFNRSnNhV1pHK3lsZEcwOTJBaU9LZk44?=
 =?utf-8?B?OXZCWUlUWTNrTkJUdEhTNklqeXY1dGZXQ2lyQTBSTFFVOEVNQWppRzhleFFG?=
 =?utf-8?B?MkVqR0RMOWhySFVjVEQzUTl1a3hyd2FGcThFbHBuSWtKWC9FN3pJUjlaVWg4?=
 =?utf-8?B?SkRZdXk0SHlMVnBpSTBtU2dUNW9Ja016TUZXSDB4aFNDeG1SWDJhbWJGenAv?=
 =?utf-8?B?aEYvOWNZQ3IzWXJxZmJoWjBiVS93MW9wRjh6dDJ4ZkZRSU5RMlY2ZVRCUkRT?=
 =?utf-8?B?OVNRNEJGc3JrcHR6cjhxSU9uOTFhK3hrNEJQUE1RM1FuT1YvdjEycFl2RFFa?=
 =?utf-8?B?NEEveEpSTHE2aE9UakFCWGUwSFIvR1NPdjE3cGQ4d3grRnZUaml4SWRNTUVF?=
 =?utf-8?B?SVVRMFl0dWdHQ29sZzRlcHc4N3JJaFlVbGpKM2lzYnV6dWpGY0p2QzdQVVU0?=
 =?utf-8?B?aCt6azVTYlgybmNSMXhMb3dpVHduWGlBRXdUN1JDRW83NmkyeGcxLzJFN0JM?=
 =?utf-8?B?NVFMZ1FHcStsb0xlZXFYRUhkOEhpQXdTVDJSRkphNklPcEFGSjhMR3FlVERi?=
 =?utf-8?B?cnZnTU1NV1cyUGJoVmkrazR3cUROdzJTKzFuWmJaSmdJMkprUGV3MUFxNm1n?=
 =?utf-8?B?OGM5eWk1WC80TDBRbU9HbTVqejhRZ3BBU3QzZ21yb3FjUHNTOEd1UFBoc2kr?=
 =?utf-8?B?TDFtV0tGOFZkcWQwU0tCMVJTNGF0SjJlaENBTnVhK0pyUkpXQVVFbVg5bGhT?=
 =?utf-8?B?VENBRERqeHlzaStaMzhncHR4M0Evd3pPenl2NFBpUjBmQ202WjhZWUhnOExy?=
 =?utf-8?B?a2ZrY1dkQjkzT1ZyQUg3dll2UnowQmh4aEJKNmZmR1ZqdDZxeDQybUxmV3I1?=
 =?utf-8?Q?KG60Yx9+/jZa4zz3Grl8zWM+RAO70I1YIvznauR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a976689a-0b59-4d33-a987-08d9737643d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 09:43:23.2567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NNmr0WUCBkbDVOtBiZCftfcZEM73NjTekiSvIOSbkU60zNOyE0nZ1R3ZydsWRGO9eOe579m4AKxEmes2RzpTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 08.09.2021 19:33, Andrew Cooper wrote:
> We already print Intel features that aren't yet implemented/used, so be
> consistent on AMD too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


