Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4535B2F8032
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 17:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68395.122468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Ra4-0007hZ-Rh; Fri, 15 Jan 2021 16:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68395.122468; Fri, 15 Jan 2021 16:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Ra4-0007hA-OY; Fri, 15 Jan 2021 16:04:08 +0000
Received: by outflank-mailman (input) for mailman id 68395;
 Fri, 15 Jan 2021 16:04:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0Ra3-0007h5-Eo
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 16:04:07 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fb0938d-af67-4514-9a9a-9e0390546484;
 Fri, 15 Jan 2021 16:04:06 +0000 (UTC)
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
X-Inumbo-ID: 7fb0938d-af67-4514-9a9a-9e0390546484
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610726646;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UEBCZ5p6Z0fwLAo/y1JaoBUWkA8/MoPdm4Dq0Sr3Pt0=;
  b=EeIAzxaCDHIpDnA66fU7aqeR2Tj0rQrzmqi4VtSHBNdcea58jFZRP5jp
   X1WSQXLWR63MIpImDtveaKw7oLRQpVDMpw+50PLs58UfH+h3JQCpij7Px
   8j9qwcqzZDvyBzrBFP7XQybmtiVrx1dws19hjgl7bNcehGrHRtYuLItO5
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HbdBEcerxLvuRU/ir3ZW7okwRdCwnJ1olTnoMOhLaFN48O+jU+Vf1iKK9wHibKHCRR+G1KKlTO
 HFZrgSeCXRe6uMtg/3IqCjjpYnSSHX5xBNRoAhY1mWtYQpMewnm8zlS2qc3kZK6n96eBZOHm2e
 6rqu6TlrheZQj4uwOOx3YFGz7bQsMSZKX5jUIAVYWhe3Zl3U3KXVcFD3LcksuMWdShe5LOrunJ
 e1c7EQ1zUM4ExqCxiMIirhIW00ngqB3BKqwWkTtPw7eDvYjbw6u4EAbOQl48PbBQz3gj6ntGAv
 QmQ=
X-SBRS: 5.2
X-MesageID: 36480279
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="36480279"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYzEj0VI2mDBBP+gk9FPTs74tCBlzoyZlFkiJ9FOK1wog7r4UFTYOw23jBrHm9yikLUcon2NPSWeyA2lxrH057TIgLiJs6w6583sg2XCnSle4YfA9ZvZbSPBtkUxDvau3KnYVB65aoY7tzNKD+kg2qILANQwDPCNv1/7doGaSoFh5WzElAyooYBYVWDF+uSoFuOMMhhLpk7Q7KeAgPnyWZY2BSd/gFRRKuF82k4L6uHP7gIrAjvY8KWxz9NQx5xcC1xjKqMjd1eaJ0dkbKA3OYazTOFGBlnNNPjfLpbShldYAkgDbVHDDKiDdJwllBbOnmrBdwQ59isMm+0y8uz1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa6jF8TU3dgpq4dyO8YbQkf9qjm65eSiyvxfe3r9z+0=;
 b=C4WnKxsBjXMG96ja7DqfkS1ZJ60vVOfQPcDNyfJ7kgDgs6a+LkSaiLIMwYYBkDW4eFOqhV6Ir8fNC/h2CQbmkBzF0bQhjboIrWdElrOSXx0ka9HIcSnHj+uWd0MRUVEFTAIwNqAOQbF8J+Ujap4anWvW2faiz3V+FvhbNwlUzTijsG67ujtgbE652jkgh5ChARHX/E5hJdEEe7tCKtiIZ6LijEckzzDQDms1wyfHarwpUmyeieQQaoWkEYxVW3OQ7ac3hbczmCADUR3lL3rxe0rFCoZjy9rRcpfwL0RdEok5M3guewDKJNvtJFqaMwKoyBVZ9MqBwIIFJnei73hQfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa6jF8TU3dgpq4dyO8YbQkf9qjm65eSiyvxfe3r9z+0=;
 b=vyfM3dZZ4w0Www4bM8hRyI8CrjSn511LxTKZn4TM1NyZdFhTc8OXQlTQ6SJMGaNdEYFxDg2nwE8UxOnI2+2cPJx/GPFlpEqwQlKO9mLo9e0jgi8pNMJM/SosQJ0SCbqKQPxBs5zVwnd4u2q8/3GFPMhihRbz5V3nbsdgZvMuT4I=
Subject: Re: [PATCH v3 1/7] xen/gnttab: Rework resource acquisition
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, Hubert
 Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-2-andrew.cooper3@citrix.com>
 <ef50aefb-8171-6864-3286-29df1eb25201@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f35145e3-2553-e03b-122f-87d52c6bc9fd@citrix.com>
Date: Fri, 15 Jan 2021 16:03:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <ef50aefb-8171-6864-3286-29df1eb25201@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0198.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::18) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18380afe-e613-4be1-87ea-08d8b96f2dfb
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5855:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB585525FB6E1CC697F854B771BAA70@SJ0PR03MB5855.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ajuuwj4xh3yZX9GwsvuZd7sYmvenvkqBK06hY9ZXG97ny999rdLHXQvrNKEDE8Doif5ofDtSl/ClsysHksG0Yo+0H/gw3eqJhmOq3TAvSXrXSfw/+soW34l+78wNevjdi+NlC9oH4EvzO1MYz49WJuvhxz5JhfrDbwL4bZtl7qBwigcd5o0w41Opa/I2Yxl/p+qcpFT0jhPsZbBv4bgW2ZuyIjcT8uEVQDe7j5zZKRQwrn5//rBrqrns+J+smG26QspXofv5YSB6RT3qMNUoOTs2W027Wj87ADWzVFST36G7wYNSB1j6jdrWQvVtVg/KCgE/opZjxqZLrh7dyG8vN57TzSdiyZcAsF6iqaLSp/jEJAubtr0eS7czMnIc/CR/i4tqOfIUzQDa2v76pV913HTrmhv+sfr1YweSPL/hUAMKYWavdmw3pO8+tcJwkG81myVzxmSpOHcq/hEnw6l0YqiMu7GeEi1obFecqPySm80=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(6666004)(53546011)(2616005)(6486002)(8936002)(5660300002)(86362001)(31686004)(16526019)(6916009)(54906003)(8676002)(16576012)(66946007)(66476007)(316002)(66556008)(478600001)(2906002)(7416002)(4326008)(186003)(31696002)(36756003)(956004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RDEvSyt1VGlydkJUcDlXZjdNUHRFZUdacGxKSy9vQjNhR25wanNHZzBJSVU2?=
 =?utf-8?B?M3liWlNCaHp1ZHJHT0RPN1QxTithYnVjSWJGNmc3T1RFeVZWc205WmZILzYz?=
 =?utf-8?B?bXQ4RzRaSUxaRUducTVnbUVHRTZjdThQNVNBeHloaXk2MC9LTVlkQlRuWmEr?=
 =?utf-8?B?dkM5REhRc3ZDQ3dGZlRBRkR2SjUwT1JZWDZKajVVMmZ3NUdXR1FYR0QzOXUy?=
 =?utf-8?B?UkFRdVJXZWlpbGU4QVNpM25Vai93UUp0RWFkajMrYWNxRGNQMVFodlNCendD?=
 =?utf-8?B?anVrclFQaUpDWTZDR01EWHhqWXdUZXJMWWRpbDB3VlpUUVkzMEpOUzlhdGtt?=
 =?utf-8?B?Ty9PR0dHbldKZloxWHVEaXk2RjZYd1FjWC9YSDZkMHRzOTZ4YnAvVTZJL2d0?=
 =?utf-8?B?emlLNG9HT2s0b1c4NE9WOERLSllIejA1TDFCaWhOcTQ0K1pxK0R2S0FpaDl2?=
 =?utf-8?B?OVJLYTQwYXhSdk5SdEwvajhkc3lLUkQ3KzB1cVg1cXptenB1UUh5bmJIUjVW?=
 =?utf-8?B?d2pqdDdxcmVuMGY2OSsxY2JKb0xlVkMwaGU3NFZBaWU2a3ljcDVDZnp0bmds?=
 =?utf-8?B?MThrV015ZHpkS3JjSWpZNEcrOUJCdFpDNzFOaHpyMUhMUm43aDB4a25OdXRE?=
 =?utf-8?B?LzZNR0FsZzhzWWZKaTVtYmhTUC9CWnovS2RLTnNWeW5KZS91THNTa2ZPVXMv?=
 =?utf-8?B?OGdncmxONTBUOHNMUzRWNGg3OWpFUlh5WXlwMmdRWmVUdEpKaGNjUFRIN290?=
 =?utf-8?B?QmxPZXZpK3h1WG5lanB2Z250dG1VbzVyOE1VcnhOZDhNZ2JydHpaN0NGOWly?=
 =?utf-8?B?ZG1WOE9nUFFNLzhHOTE0RHprTWRlcEUwdVRTcTF1KzN0ekZpMFMxYnJWeHRa?=
 =?utf-8?B?Y0VNWTAvY3ZmT3lCYXRBMnFxZFdOMTZCQ2V1VlpqZHgwbXZoaFZvU0ZyaWZn?=
 =?utf-8?B?OUwwK0lHMjdjY3cvWDVPNGJyOGZsc0pRZDZuVjNRRWFaVm1zcmw5UkxsbGor?=
 =?utf-8?B?T2I2QjZSc2xsZnZiM2pHQnYxU0tSby9PZjhSY2cyZEp0VnVFeG44UnlaQ2dQ?=
 =?utf-8?B?S2sxUTRCSm1kRVlybmZBaTFQaURXVTlCbkNzZzN0Nm9maU5GSzM3UmN2dTZp?=
 =?utf-8?B?WExvNUlDbjRpVk5sQWJEaTNwTkhvY3R4VHpFSnFteXVPRlpCc08zcFV0T1ZE?=
 =?utf-8?B?N2hyMEN0K0RMZTlaeHJQbEZ0VjllZzc5bTNEd0krM0lvcFduT2dMaEF2aWQz?=
 =?utf-8?B?VWxnUkdyYWFjelA4VWhyUTRkazZaNkkrMnJGSGR5V3hZeEZTSXBXckNJY0xL?=
 =?utf-8?Q?mUC69FrdYa+taQ8NMUVi1xUJFAF5vu/3bK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18380afe-e613-4be1-87ea-08d8b96f2dfb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 16:04:03.8231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ix1RO6PiBr6KojGFp7orMSsPUqADR9p/xXNCK87LZfMsx6qmAi0YOg1jWiKnbQuCQliGghSJK1E6dUlKr5mtG7PMELA3llEIsS//91fhe5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5855
X-OriginatorOrg: citrix.com

On 15/01/2021 11:43, Jan Beulich wrote:
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -4013,6 +4013,59 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>>      return 0;
>>  }
>>  
>> +int gnttab_acquire_resource(
>> +    struct domain *d, unsigned int id, unsigned long frame,
>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>> +{
>> +    struct grant_table *gt = d->grant_table;
>> +    unsigned int i = nr_frames, tot_frames;
> It doesn't look like this initializer was needed. The only
> use of i that I can spot is the loop near the end, which
> starts from 0.

Its possibly stale from v1.  I'll adjust.

>> +    mfn_t tmp;
>> +    void **vaddrs;
>> +    int rc;
>> +
>> +    /* Overflow checks */
>> +    if ( frame + nr_frames < frame )
>> +        return -EINVAL;
>> +
>> +    tot_frames = frame + nr_frames;
>> +    if ( tot_frames != frame + nr_frames )
>> +        return -EINVAL;
> Can't these two be folded into
>
>     unsigned int tot_frames = frame + nr_frames;
>
>     if ( tot_frames < frame )
>         return -EINVAL;
>
> ? Both truncation and wrapping look to be taken care of this
> way.

Not when frame is a multiple of 4G (or fractionally over, I think).

This ABI with mismatched widths really is obnoxious to work with.

~Andrew

