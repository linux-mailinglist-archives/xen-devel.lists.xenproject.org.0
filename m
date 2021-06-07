Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6095639DD14
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 14:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137936.255467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqEo6-0002mE-4S; Mon, 07 Jun 2021 12:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137936.255467; Mon, 07 Jun 2021 12:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqEo6-0002ij-0j; Mon, 07 Jun 2021 12:56:42 +0000
Received: by outflank-mailman (input) for mailman id 137936;
 Mon, 07 Jun 2021 12:56:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqEo3-0002i8-TX
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 12:56:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5789699c-f74d-43d0-ba0c-7f0121fea562;
 Mon, 07 Jun 2021 12:56:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-aPV173zzNL-UNcya4oWrzA-1; Mon, 07 Jun 2021 14:56:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Mon, 7 Jun
 2021 12:56:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 12:56:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0211.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Mon, 7 Jun 2021 12:56:34 +0000
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
X-Inumbo-ID: 5789699c-f74d-43d0-ba0c-7f0121fea562
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623070598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LrafuEOJAiK/W6czJ4sYhZ31pWhQ97jOBAbw6w/awzg=;
	b=RMTLsEquTPv11BZDXh8sFCyg1TTn0WEkQCTJpIF/viExSc4MDbwv02k+6uEVBweyrt6v1z
	8Q9vZW7ZasjFpxOQrJnfqZROZ50bOimQJtdZDuz8ah23dli5SRCo5ie1E7ard9zH0P0KVr
	Xpfv6RWgoceAd3A+Cr4CV3GRSTDXoWE=
X-MC-Unique: aPV173zzNL-UNcya4oWrzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hx7zZviTfvT8DCUktCZBXB8nccxeEj4eREARUKHv8Wq4dN7gAvma71ZzOnubWQ1oF/MwC7Nc3TM/7+/76vcn6ex6EqBb3dDR26l4mxiplECrxVTqWzCuDXsV03lhjLIDFn9qQhUIlUGODGU4rit34CkRpGg+nCuBnWAf74jqdDGerUHeHZap0vWgsL6vRSk8u5ZUUW+B3nLmCC8O1BH7aFD/44XFfhfZt5Xp8mUbFLZ8x03AoDHJsjeNsPk3dU4Z0lWL9/cqIcyjd3HEMHa1KrR7qLPMa3q9XawEtsAMclKIbljeGYXIxZZOPhO/D+lA75G3z1HIh66tYUZBJ+LT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrafuEOJAiK/W6czJ4sYhZ31pWhQ97jOBAbw6w/awzg=;
 b=Js5fIw3potEkWg5l4UkUJcMvwauslmuh4XnZKIurwG+pis2UqZyOzmv/ucMeXo3JhthrmLv0kAlCT1emqKW269K4q5QjJAAAeHgbutZzhpCZhJuy/lkOOvQNDdvCLBjGlefn5XsSfbgJVD1tu8pCUQ0SB3orViXGXNxihZYn3p6pn3M+WRglWq6HibBxnR2AgQjRamepeuuI95IuxNgWYKGMoG3DCfs6QqPs6wL8JdvPPqFDAhVRFsTzFGkDe8wfWrL0w/hgIusWr+kIDtG28TLI4rmgwouqQiRrcNYFMhuPscg02O89m6DctR27DxF1Vcui9vTUm7+WIYNHktGNCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/cpuid: Drop special_features[]
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210607124141.24767-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <407475db-08e6-0056-fe71-ca9a8b04d7cc@suse.com>
Date: Mon, 7 Jun 2021 14:56:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210607124141.24767-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0211.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11bd4efb-5684-4760-f837-08d929b3ae48
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3390A04797ABBBC9D7FA6A26B3389@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MdriZPjHOBpBktxeJJRMpInp+ulITTzCQ+WbzLgcr9jMA7+sU16CVUIi3nrbcYQuSQOyG7b0edb376UOdGSQrC9Dd+sZ1ghHvL7NmbPit3SVefCocnq438NsS1PFqVRpFKty8uQjG6PUrDPysF1qQJERkLX2UfH/UZ2b9qGnDg/glJG9ig3uXt1HKQz5EpKxuFm7vd9BzjTQ3rVrHMj3qDLwwfTem+dBywMwOUg56/UUuKpYiJJmcsgKjmFn+E3hfUwIN+XilY4UwcIMuAYMehr3QmRDepvMdDsdebLuZV21Nqnrf6fKzwiYEDVe0FM0BBbkgMcC6sPdhvkLtghDP2d56lJritXFAjx3tW800vK7vuRfpmI7ZwLPvCK182std3Phqs+ouJOlWT8DiTutffGudbLO6ptm/aa8mogs+g4/ZVj6CcoAJfeMUZEnNEoqVGg3SVkUpakCky6I+YIUV9DUjfWVqfEdJ+cobHs8cNT1XB7oiAFReDIHhNfIKfyImahfrwDyF95tBNUcp4CsW9N7St1wU2Z5/QRyhPwIhwkqPF0M05/ppkUsT+kx0OcN6OjwIXVolWrPmdDhcs0XMtmtHU34pweHald85SfHZgLxvepfldhDh9yNtgp3QfnyErS4hyrACejAQ7IIGI5/zcuzh0VnMS+th/F8eBzMlB3OKz+/RQX12cmVqsBgxWF4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39840400004)(376002)(136003)(346002)(396003)(6916009)(6666004)(956004)(5660300002)(16526019)(86362001)(31696002)(38100700002)(36756003)(2906002)(8936002)(2616005)(8676002)(4326008)(66476007)(66556008)(31686004)(66946007)(558084003)(26005)(53546011)(186003)(6486002)(16576012)(316002)(478600001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?cmhacDV2YlYzOHIxa0ZlTUNBTmdNaHEwRkFFZDZPdCsrdFZPYVV3eVQwT2g2?=
 =?utf-8?B?T0IyRXJNQ0VzN3B5bDdlZ01vSm9tTEZZZlZ3ZTBwYUNqZnZ5Snd0Y3VoOUZU?=
 =?utf-8?B?L1d3clRxT1RLNVpOQTlLbFE5aXF2UElMVmdpcGdEMS9RVzRIL1VlTWJjdlBI?=
 =?utf-8?B?akVXOTU1cXJYME1DaUJHWDhIcjFIN0V3Z092ZFRCcHNkd2U2N1BiRWt4ZG4w?=
 =?utf-8?B?bXVMd3A2YnVYTUxBeGxjTXRLRGlFWUdDcktIQ3FLYnRrYzYwR0ZKeVc1aUo3?=
 =?utf-8?B?UWlGZG4ybWFISFdFaXZwQ0VDN0ZObXhwQ2htM3NSYlhkekhDZ29mT3ZDSzJE?=
 =?utf-8?B?WExkazRPdVd3ZHNPbndkY3RBODYyd21jcy94Y0lpVGIweWNCSWRhMExIT09Z?=
 =?utf-8?B?U1FDanBRTElYbDcrNDByMERKTjRua01PSmhsQlFOaHhycW0rV1lTaGVxcEtz?=
 =?utf-8?B?YUlRUVgzRUNwdzFZc0ZLMkszZkxVbnJKR3NyMFczYWpDY0trWWRRdkI0c0NK?=
 =?utf-8?B?VkhCaWNjWmt1N3pUL0RzcHU3Y0lBTzQzcXZTZnBqZDJWQURRYnRHQVF0UGk4?=
 =?utf-8?B?OGM2alM3b2VQRjBIeTBKemtGSVZORjdTQ3F5QkFsaDZja0pwZ3NiVmZFa3F0?=
 =?utf-8?B?c2dTNUtiSDNRMzM1VFk0OEhocktTb3ZsOGE2M2h6dWpQdzFnSEc5RDB3ZVRO?=
 =?utf-8?B?UmpYd0xNdTJ4dXJOQkEzYjRvMWxsMVZ5bjdQUVYzRUQrcWxXL0RCdVlUeTJq?=
 =?utf-8?B?QlJGRVhMMm1VaTNTdS9uNU95RnFURkxGTzVXcGN3cUEzODR4V1BYQVlFOGNm?=
 =?utf-8?B?Nm1PeTNBTWI4RWJ4VVM0WTJhUFh5Y3NVRTZrY21Gcm9hQ1lnb3hPeUpLRDRV?=
 =?utf-8?B?Z3UvSUlxTWpDOStWN0pVWjU2bUlFbWtOeVg3SzdHajFUVEFHdEltSU8yazFz?=
 =?utf-8?B?M3hxdmFFVmhQUDQzcXNsOVpCOUdteHBpbEp2Zm5majRmK0ZBMG81aFRMc0xV?=
 =?utf-8?B?WDRCOVRqTjBhWXRIK1c1Q3BJRndoSGIyOU5tekV5VHdoT0FqSmsyeW9KMlpr?=
 =?utf-8?B?TnFNTStGSmlDUkY4S05FZTFYN0RyUGg1ZXRyLy8wd1pmeW4xZi91dnZjWVFI?=
 =?utf-8?B?Q1pTemEzeUVkLzh4dUJmS3hRRjdqM29tcC9pTjZqL0hRWjdjRm95L2tENG55?=
 =?utf-8?B?TmwwQkNTU0RUZnJDWm9uSis4MWpXbi9TVDZGOWp4bERHMWJpbG4rQzhxcmJN?=
 =?utf-8?B?cFlESXM2Z3g4ZHlRSWRLaUpkeVJQMVR6azBqV3R3K3ZjeHFiOXJ1M04zWmlk?=
 =?utf-8?B?Z0pRbm5aZjhleU4zQkV0SmViRVNXUlFzYUpaR29jQkNhQWEvK0lkUUYvZ2pi?=
 =?utf-8?B?VjlaZS85RDFFZkozck13U0FQYjN0MWJidkN6dFFuRUxtQ2RBcmtic2dvcXMr?=
 =?utf-8?B?bHRFelk3Tm1xdEpQWlMwOWRmYVBqV05sZlg3MmJQZHA1U0RScjJCVy9lMVZS?=
 =?utf-8?B?WWZTb2tjZ0k1YkdFeit3WmlFaDVBcXJlZm1vRHQ1ajVESUY3Q29ubjZlRUZ3?=
 =?utf-8?B?emI3WEtTWkNZZTJqNU5wTnl4NFBOK3U5ZU1UUUZwNGhIdkxiYWhSQVYvejc3?=
 =?utf-8?B?Z2Y2MjJqL3dLOFRMeGZpd2hkRkVjOTFBQVhVMFArbDJTTjhQSk1XSnJSWFlP?=
 =?utf-8?B?T3lGNUIwWjNVT1cwTjFhN3pwQitGMXlEdy9RaDliL0tJZTc4eE1KK2ZWQmlH?=
 =?utf-8?Q?LlDWesJo3a5FzUK6HeKVIKCIXNORkRMZhrJkl3o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bd4efb-5684-4760-f837-08d929b3ae48
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 12:56:35.0507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHmLvsEiYWB3ElW/rgZPd82myD9auYhjwsGNkyvSfWqcyvIh+fYd/NeAB//UDXJlqJDRYIIVpsBo0M7mIpz09Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

On 07.06.2021 14:41, Andrew Cooper wrote:
> While the ! annotation is useful to indicate that something special is
> happening, an array of bits is not.  Drop it, to prevent mistakes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


