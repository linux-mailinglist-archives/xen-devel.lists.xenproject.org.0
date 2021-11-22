Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27F5458A58
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 09:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228604.395627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4Ob-0002CY-Gc; Mon, 22 Nov 2021 08:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228604.395627; Mon, 22 Nov 2021 08:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4Ob-00029u-DV; Mon, 22 Nov 2021 08:09:49 +0000
Received: by outflank-mailman (input) for mailman id 228604;
 Mon, 22 Nov 2021 08:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp4OZ-00029o-GA
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 08:09:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e05f6f1-4b6b-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 09:09:46 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-wZNV4UfJOT-cLK_yOQD66w-1; Mon, 22 Nov 2021 09:09:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 08:09:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 08:09:41 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM6PR0502CA0048.eurprd05.prod.outlook.com (2603:10a6:20b:56::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Mon, 22 Nov 2021 08:09:40 +0000
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
X-Inumbo-ID: 8e05f6f1-4b6b-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637568585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvlyTqJeCrv6l1qVRD5aGFi88tWPfO20qhQ4Pb3EkZI=;
	b=PRewFiH7ajn2Lzqgv0A28A5eiBQxEsDo77kRoHYs9MeqYL1MM/Evq+EJ1pJxDu+PripYPf
	doh4TXt3kg9quChooay4y9NvAVhN2Vtg4HsNpKPfv6fHlZ0tuSKtUMbs/x9+ER7gje18ja
	YqzR/JzcRC8iFmtM64Y/QIk619jqfiY=
X-MC-Unique: wZNV4UfJOT-cLK_yOQD66w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgACxG9RNAaa6gkrMUO14/wWd3I74hiTMbSif4jJ3baMOosUYb6whIPgbTohf/uxa8jRDPtwAfbyuRtbGW0Xv+CO8eMfPbqRfgoSzgFJLsWXRe3WBCBIvdpCUa/XyT5JscwsOuWbe4QZdfsiOdzBvAmEy0O84yfHKapacw4XhhET9jdp7DnDb81FEsunzWQtedHT1b7LVJ4+LF4G8uVD+imV17rL3q9E5aUefh+lQHHJxnQuurpB7hDxx6WthywpmXef4iLcQLFidGJcb4nxKF2cNpECSDNU163M/qa7WCQbwMj0mfGX+um1346zcM2HZmkRc/ojoI4+lhhvFBQ5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvlyTqJeCrv6l1qVRD5aGFi88tWPfO20qhQ4Pb3EkZI=;
 b=Un2u3aKGzw3QVJyYIttPyj31WvmaaGGD/CeKdlZdNGWBaFK3P4pSjAFpIGKpU3CkcrK63zSU+TS3wac+ujLK1XkyUZbIgN1dmOzK2ozExbBMtlfROeSXR1+C5Iw5e0dWD7YPnOds0EqsJJVrtOlgdwDA1MnthKQhVq6AMhcovLireNei/HheG8qVzgD+QSW6XqFObdbfc7wSs8BXaOwf9WEvDElJjHmwIK1mEZZpTjfFuHQB5fq6GMCbxA6c/l+/IiZLl/HGLrTQQYItYBXUIG3UY3y7gfDzkEO4e3BYddFKgHz17nFGRm5gejV5OGBTvjMnJNsDLQA5KCF9Fzn/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74e9ac33-0685-d1e6-6da1-36a6a113d6fe@suse.com>
Date: Mon, 22 Nov 2021 09:09:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 julien@xen.org, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 rahul.singh@arm.com, ayankuma@xilinx.com
References: <20211119165202.42442-1-ayankuma@xilinx.com>
 <alpine.DEB.2.22.394.2111191721000.1412361@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2111191721000.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0048.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c205a079-82ab-4d4e-b742-08d9ad8f6f70
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6176FBAAC6E132F494B3A3F6B39F9@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L0WpdJcKBBKUst+y/E+JZ7xdCKEhEBwCEpHEZ0QQ+Gpsj6Pf35KrQMdUdV0TVgHes6nI486Qn5/NISkDLwknV5oE3v03ds4rlKpmltSk78YLzEkH2FYi5mtaC3WZAq10tu52u9TZSBr0MhAkjycrdfVumQTCj7mki9uEL1+Ol1/FhPAlctljE/6nKyJXnXJzXFnyID4S7AA1ZnIQYq+5BD4N4lXcx/SA4l1J8cb+uHZpQXfFAgLeVRSxJIv9S2+wy2FLL5/irYG3JNOLAEWQMR0w/5UeORbrGd8HuekZDKzdEKhWh380bPqwDZQHUINBaQAu5M+HyQGchm8hVY9fzDZhhHozKCO7q+HefNhcvnjbe4v8PHEY/Mcb0hKQcCzYNyNrsC0nrA3UeQnLcEJaM+FY9OpSeUXIHjdj/JYMERBOPBYQyNfP8zDZ0bjNyMiE1JS3q/GVJkyncp/J92lBm+nxgRtrx5XUzudwMHlTpr+d6pcY1Rz0KMpzwM6XVbqk8e4tvjOlUe3gNhDQYutA/Jcp+9hHi7IgMwjg27NdqlNQGYUqjYUdO7XYYeMG2+WWxtbg+ZuV2ENHVQAqB1Mr9fxgRrgXRmeDSBDXPDIoVXB5WBYnikV7abKvpXnBppw3zsIcgJlOakNoPad7cWA1Prm7dMDQR+fVcUcccfRaKbDIxGG3jEnO9zt3BQsP56ZBZz21oqGGErKivb+cmD+wf77UHrL9voGVMeZnl2sZ+bk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(66556008)(31686004)(5660300002)(38100700002)(66476007)(2616005)(4326008)(316002)(8936002)(66946007)(186003)(86362001)(508600001)(36756003)(53546011)(6486002)(31696002)(2906002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkhaR1daVVZRRW5FeENRQWJUdnNZRUUvV3lla3NXUWZMU0FRMDFqcG41clI0?=
 =?utf-8?B?clQ4cVFNWW4vUnBSVktsNDN4Z2kvZHZiekZ0bk82MmNxek4yRWlsQzNLeTRX?=
 =?utf-8?B?UnJYRERWTGJhaFUxV2YzL3h6VFVRQUVKR3RtL3B2L1lLOGxVSmNrMldNNzBs?=
 =?utf-8?B?RTA4citmQzI1K1QrRWM1dzJjcy9BK3F0bjgwT3B5eithRE1iSTRLOGZKRjdJ?=
 =?utf-8?B?eXBHWk9xVWRXTk5BMDB4NDZVdFRjMUNQWkJZU25yWjRQd05IVDhreXc2RkNZ?=
 =?utf-8?B?UXhYTE1CUU1ZcHlhanpYbnU0VXVWcjdtbndlOEwwMmkvV1l5MmpKSUFsWE1x?=
 =?utf-8?B?bmdPZzhqNTdIcFFjWVhDSDBQUC9HZFM5My95SFBjdlFzSEVvR21CTVNvODAw?=
 =?utf-8?B?aDRTN1o0NzZuYUlVMkxqckdxQWM1aUlBaWFicitNRWFodHJqL3BBdHlYUE5n?=
 =?utf-8?B?NFRZelNkdmgwUTVGc3JqcVZmcGdPNTYzbjBQUWdmYmpIUGRVMFFpN0hMa2Mx?=
 =?utf-8?B?TjNRT01PMkJHL3BocFNCWDVRZEFTYmJDYy84Ykd3NXRCV2lSaUp1YTNNOXJW?=
 =?utf-8?B?c2VCM0F1QnVNTEQ5RDg5UmpyWVErZWxzakcraXJKQVhwTTV3Wkp2RWM1eW5U?=
 =?utf-8?B?YTAxL1V1UnkzMENzUjBQZ2Y0THJ4R0c1UGdFSGF1QjlpUFJ4ZTFDREh2ZlVQ?=
 =?utf-8?B?VEtMSDU3WHQ2N0dUcTFhTWF1MEx6S0R0N2x5NDFpNGlZYllUWXg5N0xVR3Fy?=
 =?utf-8?B?VmFoZXNJbG1VNzFXemJ1cEZ2VXU4bkV5emlXRjMraVk1c29iZGRFMDMxaElU?=
 =?utf-8?B?ZUxlNE5OcmZDRlZIWlhXUHJjOTFhMkFwRG92TzFlVVdMaEc0RnpjNmJBNDNn?=
 =?utf-8?B?YjRwQ21vTUs4RkhYRFBQZWNvWk5PYXpNdWQwbmlVcHFzRk8zRDhVVXBDd1V0?=
 =?utf-8?B?Q1prb2Q4QlBOWXBybUw3MmRGM2kzSFVYUVBQbEFXTGwwNGh6Q0ZxUmFCODVZ?=
 =?utf-8?B?dEhDS3JEenB3R2hQUGwxcjZVbkZFZi9JOVllZkhjZ09ORDZGVElqNjBYeFVX?=
 =?utf-8?B?Qk10Uks3M0dXVlhZZWVwTVFqc04zZ2t4OXNBTmh2Y0VpeCs0M0s1eUJMTGxz?=
 =?utf-8?B?SkVWOXNBR0Z2TVhDWkszLzVuTzVtUGNQamc3aXZ5UU1UUkZqWmQ2RXJIVi94?=
 =?utf-8?B?NU5Rb3FHYjBaQWFTWGJIcVNVanhsWUhIeDVlY0lkTXFoclcrOFhsbDd2czlz?=
 =?utf-8?B?dkxEcVI3ZEs5TS8vdUJZcTU0RXBIbDF3emxoYUdWWkVsOVR5dHl6aEsySGFs?=
 =?utf-8?B?cUlnSlNnZnhVZzRuaTR4V2o5NVhMQnp0S2tlbERWVmExbFFwOHFBN2pOZ2k3?=
 =?utf-8?B?TGJOdG51dmFuQmMvUlZGRTNrVnFxT3M1YjZCcWhqVlBPbmgyOGFLaWFVV1Vo?=
 =?utf-8?B?MVpZc3pXY1hrQUpXUTFRYkhTNzk4U2RVTU1tKzFQZStYNHNDdlFaeU1CY09R?=
 =?utf-8?B?UjhMMDRqdUU0UndrenNMKzdpbEZLbzVGOWtOcFBrb2hzM3dkTHpvcGM3d0dP?=
 =?utf-8?B?ZnpFUUZXREJrcld3a0hkNmN0VU9uemFmMTk0eGl4akM4WXdTbDAweVUwWnVj?=
 =?utf-8?B?VXp3NmVPcUNyazFCQ1UwQjlwWGVoazJlTk9BZ2l1WmJOTDYrMllkZ2lkaXdV?=
 =?utf-8?B?c0YvUXk0dUUxcEV3bFZidjZJalM0bUgwRUZ6MXlxa2piYWMvakZFblVoQWp0?=
 =?utf-8?B?MGozdTV6dkF5ZGVWNHdtTVlFanpWRGFDdWYwQzkzKzFCVmZNMGg3eGZjZ0cr?=
 =?utf-8?B?T2ZHeWZOT2dvb3RhckpvWmdCajR1VFZ3ZlpvK29nZkR0a0s4ZXdUcnE0UDN2?=
 =?utf-8?B?MjBiUTdBdmhoSFRTT3FTdWtmYW9zZmQ3SW1WYlRLV3BFdklWRW5yTjlTNVFl?=
 =?utf-8?B?VUxqeUw2SWYrV3dkK1lVK2Y1S28rajJCMktoQ3pWZTB2bjVRbDdVQ1JCZ0Ri?=
 =?utf-8?B?V2xvTFR5enI1SHZBNDhBeWpyTTRMLzJPR2dsZDZnSkNhczZpV2dnMGJNMGZF?=
 =?utf-8?B?SFd1R05yZzlTM25xVDFzVnhEWjdKN3kvQ0pzbE8rWlhIOXI0OGZSOGhhN3F3?=
 =?utf-8?B?VXBkc2d4Mm5vUUgwZ3VZWXF0a3ZhOGdGZk9veWlrL1hYM0NiVmQycEhkTjZy?=
 =?utf-8?B?TmpPSDl3T1ErRm5HZUU1SFNHTW5rUldIMzVCODJOSVBoNmNqcEQzRkI1Zmxm?=
 =?utf-8?Q?aO/307qe9b0XfzEg8fWKzpPA91HimBR1FtNfLa5JVU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c205a079-82ab-4d4e-b742-08d9ad8f6f70
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 08:09:41.2791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOKT7iQfDTh8W3PHytw7VH0aFHKx1i/gMjNfU3XBl6Rdgt4bp6QhfNOrzQ5ixnAVzIKbQssEsbxmtE/xrbWUng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 20.11.2021 02:41, Stefano Stabellini wrote:
> On Fri, 19 Nov 2021, Ayan Kumar Halder wrote:
>> +static int decode_64bit_loadstore_postindexing(register_t pc, struct hsr_dabt *dabt)
>> +{
>> +    uint32_t instr;
>> +    int size;
>> +    int v;
>> +    int opc;
>> +    int rt;
>> +    int imm9;
>> +
>> +    /* For details on decoding, refer to Armv8 Architecture reference manual
>> +     * Section - "Load/store register (immediate post-indexed)", Pg 318
>> +    */
>> +    if ( raw_copy_from_guest(&instr, (void * __user)pc, sizeof (instr)) )
>> +        return -EFAULT;
>> +
>> +    /* First, let's check for the fixed values */
>> +
>> +    /*  As per the "Encoding table for the Loads and Stores group", Pg 299
>> +     * op4 = 1 - Load/store register (immediate post-indexed)
>> +     */
>> +    if ( extract32(instr, 10, 2) != 1 )
>> +        goto bad_64bit_loadstore;
>> +
>> +    /* For the following, refer to "Load/store register (immediate post-indexed)"
>> +     * to get the fixed values at various bit positions.
>> +     */
>> +    if ( extract32(instr, 21, 1) != 0 )
>> +        goto bad_64bit_loadstore;
>> +
>> +    if ( extract32(instr, 24, 2) != 0 )
>> +        goto bad_64bit_loadstore;
>> +
>> +    if ( extract32(instr, 27, 3) != 7 )
>> +        goto bad_64bit_loadstore;
>> +
>> +    size = extract32(instr, 30, 2);
>> +    v = extract32(instr, 26, 1);
>> +    opc = extract32(instr, 22, 1);
>> +
>> +    /* At the moment, we support STR(immediate) - 32 bit variant and
>> +     * LDR(immediate) - 32 bit variant only.
>> +     */
>> +    if (!((size==2) && (v==0) && ((opc==0) || (opc==1))))
>> +        goto bad_64bit_loadstore;
> 
> The opc field is actually 2 bits, not 1. I think we should get both
> bits for opc even if some of the configurations are not interesting.

Even more so that checking the value extracted from a 1-bit field
against both 0 and 1 is pointless.

Jan


