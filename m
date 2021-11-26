Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45E245EA0E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 10:13:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232429.402966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqXHt-0006AX-GU; Fri, 26 Nov 2021 09:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232429.402966; Fri, 26 Nov 2021 09:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqXHt-00067o-Ch; Fri, 26 Nov 2021 09:12:57 +0000
Received: by outflank-mailman (input) for mailman id 232429;
 Fri, 26 Nov 2021 09:12:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqXHs-00066w-HR
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 09:12:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09852fb3-4e99-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 10:12:54 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-QaZtwy2ENyK8sCRlPfSbOg-1; Fri, 26 Nov 2021 10:12:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Fri, 26 Nov
 2021 09:12:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 09:12:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0107.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Fri, 26 Nov 2021 09:12:50 +0000
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
X-Inumbo-ID: 09852fb3-4e99-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637917973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gw2hrgeYlKUPfTP2qHG+X2+y7piKO4xjBha0E/QOFiU=;
	b=DPBz1aF6QVG2iAMyhVlfpPoVZzLACdxbL82OXCtTXOq2uUia4g4Ma17XhzCjGIdW0y/B90
	JXZqFAyNN4X5vVGu1AiY49GHQvZHGzPTnBtvXNnGRv/sQShNoshZdm7Yuzpn+7kRvNe3HO
	v4jumglhq15GK0Okn7ARC4rFgRwIBrk=
X-MC-Unique: QaZtwy2ENyK8sCRlPfSbOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akuAIIc+fAOLwtRlPJz9yg4UYSXv2l2I2m8FIxalsaLH3Ml8yEDVDYuFSrxrl50rWG1lbet4jFElevEtY0t+a22g0rr7uvhlCPAg0kzkcWtXpWVoTi0Rpop5fSAGNaBHTVJuEX9s2BSOjdII++bKtWCL41WdvA42aeZGA0nvOQ7q/Za1aydsyWJmrCHr0ZkQR+zYy3y3Rg7Z+/dsk+ff4YCVYolnjAEFxePCBE//TWbYhjRBcck5YL61rjIfMAkAXx2Qjr7oISN4Y/bS9NS6B2Ga/tpk25U2/nSHsmuzlz40GgR2SzFYV2iiCl1ywEKTiorh2s0nNg/zZTwNT6G6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gw2hrgeYlKUPfTP2qHG+X2+y7piKO4xjBha0E/QOFiU=;
 b=TQd3Hqu3fJ1BeajYtqY/JUeeRuikNfb4O8n/VZN/BQRynLYZxb/7tKXH0gLn3+U4XjpSmmqg0q0M1e3ZXpHsN8J4voA/pU3IrY26fO8Eav3IgYfMqJKW6D7ih/c3QzkprAp4QDgySzduzwmK8N5dSHQeS0sKwtTjXpnXH40lIegh3C4zX4tKdk4naNapKDO/9t3S2rjgGvP3PyoVzbNwTFJw/sEDDwCVbj5LTQ9JNDmrOkgayyFgIagdKI04rFyJphyb9OWOwmCjtvysfLRofoB2kGNNfS89Ddgs7VT9yER3upTYDQNk5oIQ/3YL8pbLlcPb0a9tj+Yv9at3hBTm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
Date: Fri, 26 Nov 2021 10:12:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0107.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b103857-cfa6-4b75-ab28-08d9b0bcebb9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190D4CBB4AC3E8DEA6376E6B3639@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CFCYen7Imr/PC35ZgFuaDKkaTmgWfOgGf67ur+mzcgMn14BoY1mChvyAyMOl4pbAK8o9IECbxaV+UPhqgGVAlIdmwrdvm5nsMSgkNH30upmznzmmFxSipXTd08eZHTor7PJxtYaCj+wpn9H1kube1Tx1i9kZFQCiz9J6dX3GjbRdQZMvua7zl4giO3vqhKkCxhGcMhXmSnbIjV0xAsj2YGmI0uMO26cessnwXIyn99KT6E31ci/NrWGbMrBBGMwd2Xz5SmVoLZAV/rub52jqMj2W0Y33+Mnqdp8bZ+IPCKF4rymxJsO4/vvm2PO2v8eEPe0GAGqo0sxFA9nzKehZZzf2GyX96nOsfF4yB/XPztKZSyGPSxdteP/si/tUWpdWr/7/qKQKa3qvdfIGPxT6UtDM5YZcScl5w20rJpwaBsrQ5EpnPcuHKjtrZN4zH7CTMMG3hFQWAGWoP/tSnnV2PNjXrzZzpDCCoz/CEem0wolb5FWVxSyVi8r7Oe+0PbDppK2sanWAZP9NcvDP8FnR5OgeC++ZXJ15LNtwATwkKcU9o3g5tko84MjCL15f61fkNXl5SyG9e5F2kannHIbs/sucJy9t/a58d4G4mBFydyAX+N+Fg5yTkemwhhkOMcOF9+Syzdhpu2W07Tl1tWdcLMR6nk3QwI/2VkrZSV0KATzWdD+0yrsxL9xzhfGN/nuxapZhTSEgsB0whZwvxxPChu82I1V6f9CMG/F5g1Vpzd8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(2906002)(36756003)(8676002)(316002)(508600001)(5660300002)(83380400001)(16576012)(86362001)(8936002)(4326008)(186003)(26005)(53546011)(54906003)(66556008)(2616005)(6916009)(31696002)(31686004)(38100700002)(956004)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEhPK2dScEZjU2FyMUtqdWVFTVdGVWRqMWNYVSs3ZUgzY2gyNUl6cmtVRjZu?=
 =?utf-8?B?NitLcXRTdUx4a3NXR0NsWmN4dW5QKzI0T1ZPMHV0YTAyLzlVN3VpankvK05p?=
 =?utf-8?B?OENmMU5GMUlkK1B4dnFkcDUxbXhKSFNlUncwMy8xRnJUYXoyaEhPQjVYa25o?=
 =?utf-8?B?cjAya2Y0NG1LbFBIZXY3MWhaaDdCYnhUQVVraXpjdm44OGJVTEdWY25NWFdv?=
 =?utf-8?B?MWN6WFl1RDU2SVBXQktYTDhFNkF0ODFmRDJNb2lkTHB4dmJxaWtDL3MwV3lk?=
 =?utf-8?B?K3J0NFAzcjUxS1JYb29QS1JOQ283R2o2eUNDYkF4dWR4RE5Ib2lNMzZrcG1M?=
 =?utf-8?B?RmJ1UGs1aXZKbUVKTnphRStnVFdoMjVmUjVRV3MrYm5hZEVQeDVTR0JSQWhr?=
 =?utf-8?B?bXNiZnZkSFdlcHVXQW1HeVFzNE1NNkw5M1NrOVBVdWQrbEkvak1EdFEyZExm?=
 =?utf-8?B?bkZuNHpyVCtkSEc2NUVaYWpscmx2c1RqRGE0TVJnaTJuNEVjZW5DL0dTYlpO?=
 =?utf-8?B?NmZCUTJiZjJIdTJNSmlTWDdVcERnWkNmQW4wS1dBcG82RDk5L2xUQTdyWkw2?=
 =?utf-8?B?Rk42N1RQYTFyVGVRZ3h3d0NTMmljRDFkNVdxUnV5SlhpUlZxZlZwTy83eFo3?=
 =?utf-8?B?aVF2OHhPT2ZZZmtVZUZkci9ncUtQYy9GczZJTk1XM3Z5S3lCa2Q0TlFvUUJi?=
 =?utf-8?B?Z20xcDZjbFkrNFZmeFU2VThLYVRoMkxGc0E5b2lrc2xhN1dHRm1USTd6RGVj?=
 =?utf-8?B?YlRRUG9raStYdmdsOEhreldGeTVmb2x6WHFUeHpLa3psVXFjaEFmeGYwYSsr?=
 =?utf-8?B?ZUhzYnpjZjQ4RzNEbzRjVFF5Z2EzUHB1WVpyM1RJM0tHQklTMWJjWWhUVzds?=
 =?utf-8?B?MUR4aHk3Ujd2NzVNMlBRU2xacWxNdFFCbmhYVUlJTEM1ZWo3YzNzN1p6akJ1?=
 =?utf-8?B?c3NCdVJ3Y1B2SThLSEliSyt3d1VrNldYREJTTXhaUmpUVzl3VktVVGVQR1kz?=
 =?utf-8?B?MlEvc2RGRmh5MWh1MnNuV2FBZFlQQlpsSUpsYlpHd0paM01zRDZndWEySGow?=
 =?utf-8?B?ZzdQOHF6SkY1M3dqKy85ZzF0RlRPbnpmamoraGorVWtpQWdkYnNSZW4zU1JR?=
 =?utf-8?B?MXkrWUhZTTlnc1pXVHFzRjN4bCtMWVdlaDg1ZHVTSXZhb3k3dXVCNG1mN2t4?=
 =?utf-8?B?Sk81L0ttOHBJa1Q2WWR2TU1abmFJSEk3TlJFblpmUml5MGhCSlB4N3JDeEli?=
 =?utf-8?B?M09RSE9icDlIbmg1T3AvbHZCZnAvUS9KcmVSK0pwdk9tQkdaV1lWeVBSWCth?=
 =?utf-8?B?RkdnTUdPQXQxV2xGWE9LbUdsWm8zZy9ES3R2RmIxZWRQK3JJcTZZRlAvTDVa?=
 =?utf-8?B?czNiOXZWVUJHMUdHcFRmSGs4em1FV1VtcU9NbUI1YjM2WjFLRGRRTVBVU0Nw?=
 =?utf-8?B?dWlhV3ROVzNsb3h2ay9JVEoyRmNqeTZHQmVRaFpGb1JUUUtueU9sdzRsM0xq?=
 =?utf-8?B?SmMyUjhDRUVmNWRzRkh4K2doNkc2bGdzT085MG5HT0pRMDl0YkY1VzA4WWdo?=
 =?utf-8?B?bEE0SHZ3WGtxd0RKNWZreXJSM3psS2hQNEsxazhsRmJFYTZwb0thTzFYMjY0?=
 =?utf-8?B?aEdmZitxZ0xDMFVPOXhEVlVpOENiMEpGc1RWdmx0Z0JkTWJwTDNHenpUcVVD?=
 =?utf-8?B?eVd6bHM1RVJaeVBsQU41NXFZQWVtYU5jQXFHVjBYZGRxMzV3Z09KY0d4elRW?=
 =?utf-8?B?Yk5XeVBmVmxDRVBzUDhUU1V3bTd2UG9mUDVKQWkxSkFhNEt2ako5bXhycjlK?=
 =?utf-8?B?Z2pteGZTK3A3T1hRMmNUcExsdGgybEkwaHRaV3ZudWkvbUMrdnROM215dmhj?=
 =?utf-8?B?bS9DUmRwRTNnNnU1ekVsamtzYlZ1cHdweFhXMmVKRWU4LzBrNjRjVDRJOWQ2?=
 =?utf-8?B?elIyVmtxaHlnVlhOWkZ6Z1g4WkRFS0RGekxPL0lNaUxLNXVIZVhReWUraVFx?=
 =?utf-8?B?bzBYL041ZGh4bDFUNnNCaU4xcHVjdytmbVlDa2tSUncvemNKNHFuaStIeFFy?=
 =?utf-8?B?bmx2MWhKQWFVbTEvU3dkK3hrajNJZ0tjU1c0R2hFMGRQNitET1VVRVpleVg2?=
 =?utf-8?B?K1p6c3lvcGdwcm1XOHFMYWVEUGJEL2RQSk1BZTF3VXdWSElMUnJieUJSanFF?=
 =?utf-8?Q?dnfRG5Clq7N77etnfHcDclE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b103857-cfa6-4b75-ab28-08d9b0bcebb9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 09:12:50.6538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qt98ZV0uzP5QvKH418S3MmIRdJeR8GEkJnU8C8VtmJpT3YRXjEBEhqKa6panFHB+IxGTF6rkH6Ra0rXEqjv2rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 26.11.2021 10:03, Julien Grall wrote:
> On 26/11/2021 07:37, Jan Beulich wrote:
>> On 25.11.2021 18:13, Julien Grall wrote:
>>> On 25/11/2021 17:03, Jan Beulich wrote:
>>>> On 25.11.2021 17:54, Julien Grall wrote:
>>>>> On 25/11/2021 16:49, Julien Grall wrote:
>>>>>> On 19/11/2021 10:21, Jan Beulich wrote:
>>>>>>> From: Lasse Collin <lasse.collin@tukaani.org>
>>>>>>>
>>>>>>> It's good style. I was also told that GCC 7 is more strict and might
>>>>>>> give a warning when such comments are missing.
>>>>>>>
>>>>>>> Suggested-by: Andrei Borzenkov <arvidjaar@gmail.com>
>>>>>>> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
>>>>>
>>>>> Actually, any reason why there are some signed-off-by missing?
>>>>
>>>> I often keep the author's, but drop ones which clearly got there only
>>>> because of the path a patch has taken through trees.
>>>
>>> This might be clear for you. For me, as a reviewer, I have to do extra
>>> work to check whether you keeped the relevant signed-off-by.
>>>
>>>> These aren't
>>>> relevant imo when pulling over the change;
>>>
>>> They are technically part of the "chain of approval".
>>
>> But the Linux chain of approval is precisely what is of no interest to
>> us. We need to approve the change ourselves; Linux having had it
>> approved is merely a data point.
> 
> I can understand this point of view. But as I wrote above, a reviewer as 
> to do extra work to check you correctly propagated the signed-off-by 
> (see more below).
> 
>>
>>>> I could as well take the
>>>> email submission as my basis, after all, where just the single S-o-b
>>>> would be there.
>>>
>>> That's a fair point. That said, you took the commit-as-is from linus.git
>>
>> How would you be able to tell?
> 
> That's easy. You wrote in your commit message:
> 
> [Linux commit: 5a244f48ecbbd03a11eb84819c5c599db81823ee]
> 
> That's indicating you used the Linux commit rather than the one on the 
> ML. So I will tend to diff the commit and the what's different.

I don't view this as such an indication. I could have taken the submission
and merely have looked up the corresponding commit to provide a reference.

I think our re-using of Linux submissions should be indistinguishable from
their authors, if they were aware of and cared about our cloned code,
submitting their changes separately to xen-devel.

> Anyway, I think it would save time for everyone (you had to manually 
> delete signed-off-by after all) if you just copy the commit (including 
> all the signed-off-by) message as-is.

I don't think I see why you found it necessary to verify the S-o-b set.

Also note that, for things to be useful in our tree, I may also edit
commit messages in mechanical ways (e.g. to change file or function
names). I don't think you can expect a 1:1 match in any event. Review
of such submissions would normally mainly mean making sure that
everything was transformed correctly (besides the question whether the
patch is applicable to us in the first place), not that everything
matches up directly.

Jan


