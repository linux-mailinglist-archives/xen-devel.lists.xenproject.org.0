Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BAF3ED467
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 14:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167331.305423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFcBo-0000ZY-0c; Mon, 16 Aug 2021 12:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167331.305423; Mon, 16 Aug 2021 12:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFcBn-0000WA-Tt; Mon, 16 Aug 2021 12:58:03 +0000
Received: by outflank-mailman (input) for mailman id 167331;
 Mon, 16 Aug 2021 12:58:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFcBm-0000W4-HJ
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 12:58:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b02be02f-d70f-4e58-b029-d1c99d983d44;
 Mon, 16 Aug 2021 12:58:01 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-vrIqcS-jP8aXeHX6ir7Z6Q-2; Mon, 16 Aug 2021 14:57:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 12:57:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 12:57:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0207.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 12:57:54 +0000
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
X-Inumbo-ID: b02be02f-d70f-4e58-b029-d1c99d983d44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629118680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LoVMMJnXTuj51mnjJV/gHxsypoXFIvEdXo8115uGv7g=;
	b=eN+H76BipD3OFX/An6LtTR9TMNioFpMJ4Ouy3iaDWBGoREr2CeJxFI77BeAxYIEaqQ6OgQ
	cxu/1QsTNlQ0A1DLXCDy52OwWIWJ2aVfH6KZkVgLIByLpkaGg0iubFBzTTmYJ6lfhT+x1M
	j6OZIs8NMMEB9SLFEDFyRjhyo8qrQ7I=
X-MC-Unique: vrIqcS-jP8aXeHX6ir7Z6Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhvTNbNqPR8ZUfcgHUPrx8kz/VwqU+6ms4Lnm6pkLt9DUB7+9ByMRawd0pHFWOSZIOWI8sIZn78piRevkp2+OF1E1HdngcH8V9y/w2w1yFoqQJuicJZDoqZJcWkMuCELxWI+quEaoJ2OiaDMIwW/yjqXyg6Kh0QHzfidA4k8oKhsnUunc+kCU0RWRcCfBa3b4ifC/N2His1sQMVg/+bhEWjITEN6Ty82DoF0sajh6SCiJm64POhbyHsG4j1Fn415ZOcj2dekb5Z3rIHH6Js5+j2HN7/MFFLvm4sTtbYXCPm/kCURxq+kBxBwWHaonRNPuekKOm2taGyAwSFqhEYSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9vFlkNw0IMkPaHSuMlVQuZNTssPIbuL561oH5v+rFg=;
 b=WEcP6H+t0otIs5XDNeXurSwIAC/p7j979o1PkA+iPvPn4Av+wkTjcq1BhC38MqaAiqlfAR701dGcn5MnBwwux4XSGI4ZCPJK/S+Y5I61NuDQ2oV3QNU7LdgUYnL0Ny+WeNF5ED05MvEaD2Dk+pk7HkiFEL11KiKRA30tpqxvs7vAF6KNvgBL5chdf4xaPe3XjOmxlDEpWzq1PH3CYUxDr/hTGQdb+QX/tkHSXIdmm9GocXVWUxXuLksNTuZOLMlX5arWvC3iopBAPNFZjPWMrCVjDXK0UpnMTDttyW8Ivt3NKLosf0noAnLYk6xX0ZEDQBoUN5VqO6hFYjM4/tXXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 2/2] xen: rename wrong named pfn related variables
To: Juergen Gross <jgross@suse.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, x86@kernel.org
References: <20210616073007.5215-1-jgross@suse.com>
 <20210616073007.5215-3-jgross@suse.com>
 <8dbeb9ea-56c9-de30-4d5f-fc9c0ced6ac4@suse.com>
 <79434ec4-4543-97ad-b010-3f2c1b6a55ad@suse.com>
 <b9c64bcd-4192-0075-ddf5-711e84301063@suse.com>
 <94d629fd-27e2-f2be-ed26-c3e04e95c5b4@suse.com>
 <4a5d8b43-7ffa-cbcd-943c-3c459d56e55e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <257be998-be20-407b-144b-db66ca4b5928@suse.com>
Date: Mon, 16 Aug 2021 14:57:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4a5d8b43-7ffa-cbcd-943c-3c459d56e55e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0207.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 967e1384-69f1-4a9c-d9f9-08d960b576e2
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190B39D2641F9AC999418C4B3FD9@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sr08BwiFnwCCCu8YLVGMfPKHJNaONDAgyctAagvmdFWmwUsXY6Ot3yyyx5TULRwBhJ+VXaCl3+i0nYfyKIq39SOOZ1YPFUxZbNszcTEH9Bx7AXGgYibOFs6sQ5+XaQgAfiI3Xb2rnAMNIApwsUw+HFqG4ZcrRYRmqfB3ncFMW4QDe8X1qtcr1kNZMcj74QayW+TgSOO7t4hzqq39ZvQY6Hh6niv9PgLcCGJYJJ6peyro2Pn5HXLDWmnBcDn+51eipI4EvdQlAEDpqLSDen3Q0Un/lydevBOxzi7pXiW8KR+CNwQzcsQidHjW9HEzVXPVD8hqm8DqdXUujtdHwxlhI3CzAg1rHtP7M5tRCQLSK3IeQ4FvzMMsuTWfsOeLIiA7mrOW+iLBDIAm5iCz81kDtiyE2hmlaaHtj2cX7Dy3Avfj9FctQgXfFvitg7MfSZmi9achCnj3mfM72sIZuQ9/2E5hsrKVGxP0dKXhj/oZFzK2zFc8DhAbnnsKbucNYCsTP3g9T1HABFJrgo/OBZY4td5snedcLMvUvetUcI5xysGabGslPXKU7s/yEl7RgTUNyPmfeOP6yAYlM23qUAgEtXAK71pc2XorSnrz1AYWasbt5q7T8i6T+HWuhGCUQsRWe6YYz3riuG1+j71faxi4XD5cQTo1K5YGhQj8W8KU7LBvSVtd03deXzMi7zcVwITo3hLHE2F3AQhzhq3yznwgbiwoCObAqmVthIPTyvSf2ns=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(346002)(366004)(376002)(136003)(36756003)(2906002)(186003)(54906003)(26005)(6486002)(6862004)(6636002)(5660300002)(53546011)(4326008)(316002)(31686004)(956004)(2616005)(16576012)(31696002)(38100700002)(8676002)(37006003)(8936002)(66556008)(66476007)(66946007)(478600001)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I4qaslQkdHfNBJM+Lb1E1PKA4lkvRuq1UZgw8+ve0eeBI18z0LGNrlmWIKlQ?=
 =?us-ascii?Q?9mX9N/SkWeLCMEKVmaNtPW8l1QHzhTwPzTD+0JhJUqaCusOtn/X9PKhIs+K5?=
 =?us-ascii?Q?/j3WXkJX3i2znLqniUDwU2F5rUVg9qTf8+Nog1RpE4bGsu3e/fMmXkXTlrwa?=
 =?us-ascii?Q?1aq72n1KtcS2ay70lBDYPwP4ujDfmppjOwsyek/LQ8v066Pu1KbhU3fPW/UL?=
 =?us-ascii?Q?tcozelMVnFNvcSW7YVyeNBhgvfidnPmJKrhxfNwqFNrTR88lMpRuRREwCDrs?=
 =?us-ascii?Q?KMc615cFgRLEGf/nV9q82UpCHM15CGgG2jqTWRs/UCxdEWiOCPisjLvSRVL3?=
 =?us-ascii?Q?+/04YICsy46fpWzGT3pO6pClvRdI22WmzSMN75SKdlYvgqbuNb6CCz6h4/bd?=
 =?us-ascii?Q?Lltj7XHZ4vGhzkJAi100aRBVbeyxqmFOP4YlQ8od9qKwXNwoqBiV5NqJ7qKM?=
 =?us-ascii?Q?+ioYjvChpEtNpbyO9dQnOeZ/rJLZyzWvd0QeQkwl+KLJzK9u45YZ0knjw+FH?=
 =?us-ascii?Q?GL6DrjijhrwS2NgjX1IH7YzAn1snf44OIX0lGWmcL42YJLQuNwPcuOIuA+50?=
 =?us-ascii?Q?UTomW3rYanKclAZC1MLLArkenQPImJZ2K9tIzwDQUZPOr9DC+RnrB5Fxxd33?=
 =?us-ascii?Q?S0t3OMzDyHVCP4tza1oChx4NrLjCvvpGCdR5Yg5xBDkkPJSWOyCXb52000Eb?=
 =?us-ascii?Q?47O+UPzT1TAw2IACnDQezgNmwYOIspl8Thnm6025IifDg0Gl8t/PumsJRorb?=
 =?us-ascii?Q?ImiVDOrCtCeVaPYp6AjgSedxTJ8h+z3U1OdxncZTOd78geRp5JDdIZoL7WjS?=
 =?us-ascii?Q?hr7s1shNNkzW+sDGQUSeBIrnYBsEOVbPkHMccp0QfUHvx9w4FJuJbYBKW415?=
 =?us-ascii?Q?pDEDOcL88QjncUjH2cXfHXcW3VKtchVcS17LjkPHBk2NSZuM/uYf/VpN0C/K?=
 =?us-ascii?Q?9HpJMjiJr6HtccjLbT7G8e/BzFfEW0BSuu/G3FdkWDnXDKL8ARaMVqz4Nsct?=
 =?us-ascii?Q?tFM7q8EImRhLkoyk/j81hqsRPoHLUP7rtQWpl9QYl+ijPVTFF0wj4AWUigJz?=
 =?us-ascii?Q?ebSAXoz4FogAw0JqYOI4b2FPzOv0sj9vVUPgmtjdFsCUffliIhBWuDVIDgHu?=
 =?us-ascii?Q?vsBBX1O0GQ1c5Kyi/EL7TknlG7kIrjaKlHbXOUwNVMMTUwjen1KhXNGjrN9Y?=
 =?us-ascii?Q?YHTjC0J8HSd/Oh+y9JUbn0UJKyBJHTQ+P5hyaICeRZDV/DhyTTemktNJrxgX?=
 =?us-ascii?Q?A0/Ekt4BW9ED+ev4bgWWNNaL78OcgJj6pfjvBFiZmq1cmTMcg9YIL49q8Gqe?=
 =?us-ascii?Q?rQh39kfcq8DMx9SkaMXrScnw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967e1384-69f1-4a9c-d9f9-08d960b576e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 12:57:55.0330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWSrbIdoZqOUV9krrMhJ1mEEXbc73B4YH78DqRVhgoThRmraMowl6xIWlEDMrMmZvSC/J//QyHo0a3vzfZe2IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 16.08.2021 07:25, Juergen Gross wrote:
> On 03.08.21 12:42, Jan Beulich wrote:
>> On 30.07.2021 11:00, Juergen Gross wrote:
>>> On 16.06.21 12:43, Juergen Gross wrote:
>>>> On 16.06.21 11:56, Jan Beulich wrote:
>>>>> On 16.06.2021 09:30, Juergen Gross wrote:
>>>>>> --- a/arch/x86/xen/p2m.c
>>>>>> +++ b/arch/x86/xen/p2m.c
>>>>>> @@ -95,8 +95,8 @@ unsigned long *xen_p2m_addr __read_mostly;
>>>>>>  =C2=A0 EXPORT_SYMBOL_GPL(xen_p2m_addr);
>>>>>>  =C2=A0 unsigned long xen_p2m_size __read_mostly;
>>>>>>  =C2=A0 EXPORT_SYMBOL_GPL(xen_p2m_size);
>>>>>> -unsigned long xen_max_p2m_pfn __read_mostly;
>>>>>> -EXPORT_SYMBOL_GPL(xen_max_p2m_pfn);
>>>>>> +unsigned long xen_p2m_max_size __read_mostly;
>>>>>> +EXPORT_SYMBOL_GPL(xen_p2m_max_size);
>>>>>
>>>>> Instead of renaming the exported variable (which will break consumers
>>>>> anyway), how about dropping the apparently unneeded export at this
>>>>> occasion?
>>>>
>>>> Why do you think it isn't needed? It is being referenced via the inlin=
e
>>>> function __pfn_to_mfn() in arch/x86/include/asm/xen/page.h. And
>>>> __pfn_to_mfn() is used via lots of other inline functions and macros.
>>>>
>>>>> Further it looks to me as if xen_p2m_size and this variable
>>>>> were actually always kept in sync, so I'd like to put up the question
>>>>> of dropping one of the two.
>>>>
>>>> Hmm, should be possible, yes.
>>>
>>> Looking into this it seems this is not possible.
>>>
>>> xen_p2m_size always holds the number of p2m entries in the p2m table,
>>> including invalid ones at the end. xen_p2m_pfn_limit however contains
>>> the (rounded up) index after the last valid p2m entry.
>>
>> I'm afraid I can't follow:
>>
>> xen_build_dynamic_phys_to_machine() sets xen_p2m_size and then syncs
>> its value to what so far has been xen_max_p2m_pfn.
>>
>> xen_vmalloc_p2m_tree() sets xen_max_p2m_pfn and then syncs its value
>> to xen_p2m_size.
>>
>> I therefore can't see how the two values would hold different values,
>> except for the brief periods between updating one and then the other.
>=20
> The brief period in xen_vmalloc_p2m_tree() is the problematic one. The
> different values are especially important for the calls of
> __pfn_to_mfn() during xen_rebuild_p2m_list().

I'm still in trouble: Such __pfn_to_mfn() invocations would, afaics,
occur only in the context of page directory entry manipulation. Isn't
it the case that all valid RAM is below xen_p2m_size, and hence no
use of

	else if (unlikely(pfn < xen_max_p2m_pfn))
		return get_phys_to_machine(pfn);

would occur during that time window? (We're still way ahead of SMP
init, so what other CPUs might do does not look to be of concern
here.)

Jan


