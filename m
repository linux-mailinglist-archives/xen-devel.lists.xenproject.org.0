Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6DD48DA4C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 16:00:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257242.441992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n81a0-0004kk-FT; Thu, 13 Jan 2022 14:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257242.441992; Thu, 13 Jan 2022 14:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n81a0-0004im-C7; Thu, 13 Jan 2022 14:59:56 +0000
Received: by outflank-mailman (input) for mailman id 257242;
 Thu, 13 Jan 2022 14:59:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fwfT=R5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n81Zy-0004ig-RB
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 14:59:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 768f0100-7481-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 15:59:53 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-g8Bk302DPB6JLiyM5xy10w-1; Thu, 13 Jan 2022 15:59:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 13 Jan
 2022 14:59:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 14:59:49 +0000
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
X-Inumbo-ID: 768f0100-7481-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642085992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f8ITnExiHu8U/qU56duDMiO+CW2rnT+AKznX+0j0i6Q=;
	b=H9lrJhHmLkFJCLtVI/g9LzrZyTOex5otyuTK6wrEevW2aj/RJjXQz5d4RldCnmDUQYSvra
	3k9UyvSxWsQQ3T4oqWgTGjfjrObZVp9MQlbz3zPkC9X3AUFUkQxXXzIdWVMTKrCNNuYwp6
	6hrlIHUJV1IihU9ov7wOd63F/4A0FaU=
X-MC-Unique: g8Bk302DPB6JLiyM5xy10w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UybwcT/5AnZh68q/5HPoe+C64MdYRgdNDYI6UNmKnIgYr5hp3bk5obT9DZIfjr664bKls94GUgB8W0Ga/p8Eh9eJHSFZ4LzQaJyFV51g76qoGMrFxJMe2m5f2rvLqlmX7ZbdZpJD5s4Ao8ghgYI3K2/BQvTi3jIi2/Z50+pN+hJWgTPlOs62sHErkgljnOU775KwVR78uJDCpgBhlplxVzJ0Eqz7I8wwPoKrw58Dei8UQ9O3yxzCjOimA529KT4HUNi29UK8xYY/2HdqT3LAzEYvIKUJz7Kgyn3trIKUr9wucFh8yj38VTa5moyK+UAaq5vVavXe6JuX2rBDSDU8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8ITnExiHu8U/qU56duDMiO+CW2rnT+AKznX+0j0i6Q=;
 b=T0PCX0n+eam78Fv9qmtTWj6teaJELdenOp296Umqy+2g4P6tcTYlXB+ShrgaE8OCmNn+qHZ5BrbIprRnZy9cNZIuf8pGcbzXxOAdi5pKTnuy9pZGTf/CT5/44MlXCPZkBtGhcq4OfxtD6esIl+HPJq2muDa4vYYlrUf2I81tBXg53TI8qnFp9ZM7LxBhg+VMOPrMn7+oueWN/wrEwZQly7Jl0Sar4JQ1TqvxE7v51x8l+n2plxBjAyUu1XvDEIy5TwLhNSqIVsNFRD6pNZQnnZc7rPXwDvaF+l226/5ZYggZmllr7DIRys69+2K+jsifrHOxuVWCmcTLUjLFrNN+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26d0a352-d489-2952-c527-a90118a00bfb@suse.com>
Date: Thu, 13 Jan 2022 15:59:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] x86/hvm: Improve hvm_set_guest_pat() code generation
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113135035.23361-1-andrew.cooper3@citrix.com>
 <bfbe31d2-4d67-d7fc-4bb0-5b2caf209460@suse.com>
 <26235a19-4c4c-3bb9-3740-94306c773e26@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <26235a19-4c4c-3bb9-3740-94306c773e26@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75b801d1-1d40-45e3-e53e-08d9d6a55869
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59012F77B861F105287C39CBB3539@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3T1F9urJ1Ms6iemVzYkHbbUH5N9pEzSXJ1UzgDWRnl1vzZpwIldF87F7JMo/9HtfR/s2RJJyvnRVbNj7F/pFXmIM00VrYXn9nmbiGxRMb/P3cmqM7uQb7IF2XK7zO6Fw5odD2clybx8ZfRGoZmZmkSQYdm7HvT+7ZaIvfItJJ64v1SRkDCGznZDA/zRxW4CKsukc3nbrSjko57Tvfz+vNHGQME80V2pFvOt03nEnwsBWK/lKRsogmT7ST7YSt24iIcJUHNAKWjC3qkZ8pcebpI2s9UKmkuL1tw+fq1/AL1MxjOWTu4ynpc5SopLY25CT+ad9uaOhAzea1Ny6WkWOheYNa2eD4NLKKkxB+aiJhknxdXJLCoscC/RrLP20n2+3hmFQ8shB6tXz4/tgunXgbTLXhuQiHdVvApwg3r7c0hk/L+ul4sQen4xbcLJanX7vWdhZiAhsUkF8aHptoUoecnv6sDWpydVcty96goXDnScGC1WjVuonXWKYLkk7zGWaCX9sjKvP8krDtfFzUZ2nt9kliFCg1uZPTtS2h+0cVBfy6dxXHSWFwsaT6qeSOmYZZcsClYSQw0CSVAz/D9cIjLTmaEeGZ9iYeXj+jGDwvdNb1srTD25svWCyVQju6oZBr4ID4y1zaRM8Qh4HCC9fNshnG3vL4AQeVPUxuoDOpG27uq8DqvqMYm5Q8ns/yoAE4m/ZJaDpHacnfekfdmK0oXjZeG9Q+NEsirguBKCXewim5wi393MXkTOZhstuHQ55kuA8GHMln300XGKLGGNc+nCariv6bAZF3J+n9k1T4cL6Pz0rJ4nxmTOXtbpvHLriKEq3bjs1aHX6XJlDPlFNrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(186003)(5660300002)(8676002)(83380400001)(31686004)(4326008)(6512007)(26005)(8936002)(54906003)(110136005)(508600001)(966005)(66946007)(66556008)(31696002)(6506007)(38100700002)(6486002)(53546011)(2906002)(2616005)(36756003)(316002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rnc2Y0hNOGs3R2t2K2lVOTFJZVR6TVFQM1YwUlVSN0k2M1N1Vk91YjNpdGo0?=
 =?utf-8?B?QkEvR2lRa2JpVTcxejFENThoVjl0MnhzUW5RdFRwT0djZ0dyRVU0K3ZUUzBZ?=
 =?utf-8?B?STJNWVJQNFBtZVNzNGx6NkU2cEN2TFhsUFhPUG1XUWYrSzU5Q0lXNXpqNDUr?=
 =?utf-8?B?d0Z4cCtQWTNFamlvbkFjYlBob2YrWlRtL09kWmFZVUNkMWVRWnhoU3J1UUtE?=
 =?utf-8?B?SU9uckRzTjJ0S2krbGZkcEdoR3NiQmRETnE0WFUvQmJJZnRsMWd5VXhLVDRp?=
 =?utf-8?B?c1ptdmJTb2pJSnRxWTZIUXVuczVLVExlMmZWbU1XTkdudEl4UFdzR01reGhs?=
 =?utf-8?B?WmVNcTdidGRLTmJCSm5pUXhvY1VUVXE2QTRxWmpXdm4wejBOblJvUDJLOWtv?=
 =?utf-8?B?Tk5NRTlQbkdRbTFjL29qRTVKQ1p4MEtNN05jdWg0RXMzTWpoYTNnd0tWWGtM?=
 =?utf-8?B?MTY5WVJZRGRCTkEvaFlVYmlWNWExVkpnRjZHWW8ya2tPOVoxQ3hibkxlY0sv?=
 =?utf-8?B?Ni9lakRXVy85YmtkNGYxR3Q0OXZpb0ZjUU53a2pTK2luV0JUWGxBeXQzeG9m?=
 =?utf-8?B?VXdtTnFVUHF3a2dFOFRzQ1lyVVRhalB6TEw1eFk0N2pZZ2U4RWtaT2xKUHB5?=
 =?utf-8?B?U05CWWhxZXFBakFPY2orRW9ldHc2dzBRTXlhZ2kzSmRsZlhVeXVoYis2NFdw?=
 =?utf-8?B?YldFMFhKSXRrOFJxdlFoRTZFYU5UNGQxN3dHQmtJaWwyVjdaWHBoSzlNNVNX?=
 =?utf-8?B?eG9JY20zTTdScXV2eTBOUk5zMmE1eVMza2ZCNDNMR3ZrNVBFTDNJbVdEemFT?=
 =?utf-8?B?WUVjSkh5TXpkUjZiZmlUUzVqT1I3QUY3dWlFM1pud3F0VVNDMDBvZTBSYjFC?=
 =?utf-8?B?Q21RQkNVVU4rRWNKR2pPR0Q2SWhRYUlaYWVncCtwQVNGbmhhYmhJVHp4N0M1?=
 =?utf-8?B?UDY5eDVjTURMaXVpZWs0ZEdqVVpqRjBhWUJXRXdUWVVSdlJkam1QQjQrdWpZ?=
 =?utf-8?B?aEJYRzZSNXl6cHBCUVBYUk1WbWY3aDU1Qm85aFhPRVVUVVdwRmtrbktXMlFn?=
 =?utf-8?B?cWZ3Rlpld0hBOFBBd0FYazBuU2Z2YkRzSU9kenk1bDNZV1dXVjlwMlY4RjNL?=
 =?utf-8?B?NjBiU29obmVCVTJpbHN1R0tOVlNWUmxMSmt5YjRDcUlMYk5ybEJKK2UwSDVy?=
 =?utf-8?B?dEZ6MWRJdFZJYmhPTm45TDVJN25uQWVDUDI2RlpTRUhZSGN0bjBxd0hXZm92?=
 =?utf-8?B?VHkxR3VaL3hmNTJOUEdwbXdhalMrc2Y3L2NJNjBON2Z6ZGVwQWVML0xzdjdi?=
 =?utf-8?B?UXFuOEJKVEpLVmJtdXl0bVlwUkRYa2p0QzBxMVI1U1RobGdEV1JrVFdWQVhn?=
 =?utf-8?B?ZithK0F4T1E1MXhMM3hvVmZwK1BiK0pVaXVleU1YL1FBTWVUeTNLa3dkc1Iy?=
 =?utf-8?B?SGlLbzNPOGY5dVBYTjhtaWxLOHFCRlFvQ2xXTzNzSkJ5OHQwYmFadXl1alNG?=
 =?utf-8?B?a0FsYWpGOHFxVlIySGwrWnR6QzJoS2VtVVJhRzFuQmRmVDV6VlJNUUNxOXln?=
 =?utf-8?B?MmZDMDMxT1cvQU5Nb1hqeGhyakVCNkxYQ09CbVIxWlhXVjJ1NmhwOURGei8r?=
 =?utf-8?B?cVh3dGo5aCtuaHoxdWJvS0J4UGY4QTQvazgvU25rS1BTZmdTN25BZTdmeTRt?=
 =?utf-8?B?c2oxUnJZS29LM3lpdlpUL0h4bFBQRGJjTEpkT0tSY0RzVll3Zlkvb2tBSEpv?=
 =?utf-8?B?V1F0VzlIMmFuRWRKR2ppSVArMDJVZFcvQmFvazN3M09DdUJBTmJXamxkcXpM?=
 =?utf-8?B?VVNvdlp1NE02SXRwcVpsMVNXR04zT1dQNlZDWkVRNWgzTnFUSWZOeWthRUhj?=
 =?utf-8?B?RmtKaFNtemJMTXUvM01FSXR0cUt1Z0U4TkhDb090enhaOTZJc0QrNzk2QXZJ?=
 =?utf-8?B?aTYwUm1qc3hRSkZsTXdQTU5vbEoxU2hLWGhxTmh6YTc2d2RWdkhLZzFCZmZt?=
 =?utf-8?B?VGFLd3R5YXhPTm5wNElUZXR6SGoyV252OFlyN3FleWN1REZNbUpOYnlJenhM?=
 =?utf-8?B?MFE2Z0M3TDAvcHA5OFZwODhFR1Ztam5QQWtSaUpHdTNLc2wyOENRdjR1ajBK?=
 =?utf-8?B?cTB6V0k5aUxmaGNiUDhkeWJBVDliQUNvQmN0eXFsSVVKMk5vTVB1TXNBUWZj?=
 =?utf-8?Q?ns1VuSRS2/lWOgaxRcqG4EY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b801d1-1d40-45e3-e53e-08d9d6a55869
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 14:59:49.2307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFpsBfELamHdjE2V8zDYxavAa6e4vJa581KrVqoCv0/KfCciZ9M2obCRs2lvTDM6zvpSewVUJY4OT/Y5hmWV9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

On 13.01.2022 15:45, Andrew Cooper wrote:
> On 13/01/2022 14:38, Jan Beulich wrote:
>> On 13.01.2022 14:50, Andrew Cooper wrote:
>>> This is a fastpath on virtual vmentry/exit, and forcing guest_pat to be
>>> spilled to the stack is bad.  Performing the shift in a register is far more
>>> efficient.
>>>
>>> Drop the (IMO useless) log message.  MSR_PAT only gets altered on boot, and a
>>> bad value will be entirely evident in the ensuing #GP backtrace.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> I'm curious though why ...
>>
>>> @@ -313,10 +313,9 @@ int hvm_set_guest_pat(struct vcpu *v, u64 guest_pat)
>>>          case PAT_TYPE_WRCOMB:
>>>          case PAT_TYPE_WRPROT:
>>>          case PAT_TYPE_WRTHROUGH:
>>> -            break;
>>> +            continue;
>> ... you're going from "break" to "continue" here.
> 
> I went through a couple of iterations, including one not having a switch
> statement at all.
> 
> Personally, I think continue is clearer to follow in constructs such as
> this, because it is clearly bound to the loop, while the break logic
> only works due to the switch being the final (only) clause.

Perhaps I was wrong recalling you somewhat disliking such uses of
"continue" in the past.

> P.S. if you want to see a hilarious Clang (mis)feature, check out
> https://godbolt.org/z/7z6PnKP31 - scroll to the bottom of the -O2 output.

"Nice".

Jan


