Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762473F17BF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 13:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168547.307731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGfw2-0000Wq-BF; Thu, 19 Aug 2021 11:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168547.307731; Thu, 19 Aug 2021 11:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGfw2-0000V1-7w; Thu, 19 Aug 2021 11:10:10 +0000
Received: by outflank-mailman (input) for mailman id 168547;
 Thu, 19 Aug 2021 11:10:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGfw1-0000Uv-Fc
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 11:10:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9938e80-d5fa-49cc-ab66-9d532fe9e89e;
 Thu, 19 Aug 2021 11:10:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-uNoFujycOUeZdFIn9arBkA-1; Thu, 19 Aug 2021 13:10:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Thu, 19 Aug
 2021 11:10:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 11:10:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0012.eurprd09.prod.outlook.com (2603:10a6:101:16::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 11:10:04 +0000
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
X-Inumbo-ID: f9938e80-d5fa-49cc-ab66-9d532fe9e89e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629371407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6w97TOntY/prn9DUSvtMN1qyrXG60d8REduGPNvHIbg=;
	b=UDmiOYfQvuX2MqHLQLRFvUAphvj9Ln1c5Ckc/oFKDS2InBIHNvjTZ2IePZmvbZ+LKytnrv
	pjYUKW4hAPT4xThNZiDMbjPEMPSD9tQb4wFbUGaWkwdTeu7wTm5PJWxKlOGw8j+gkoIa7F
	QwK1/paHwlx+Px0vRMBvsBil8EMaJzE=
X-MC-Unique: uNoFujycOUeZdFIn9arBkA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcDW/pnYD9Uv7+pEFYLUTODSdZ28QtYhIHcwSfezjM6xPA2qaLqXcaDS4RlvV8j55X66UddYHaNhNQhKt24MXKKIStbZBqzPmK6yIvpoJj7FwCBTjXPq3SyzGnSmpqVDjPp5zENCApvkabDj8/0U0ObnY5ApblCDvH/U3RfUwz37w7w2C91I2+KFN4O3J+1vi7v9qLZ8Nkm60msO+d9/CCGYbAR1euEV/WB1gtKTqxRp/ZNbcS7wGCmenYqPWKJYaClVESOd02sM7pHYQ5GVJn7fYB5ToKsIWOlbFu063R1ewUF3eU/ER1Sb6GdTsexyDBQCJREg3doOWtMNcTskZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w97TOntY/prn9DUSvtMN1qyrXG60d8REduGPNvHIbg=;
 b=kSg4TJMeyr9LIK+F2kyBZsXqHKcdKNkUC28b5BDtctli9mUSfFGDtH6zKfIY0j+ZePC/gxn1MIeEZwI17LC42xoBPOKkRwNK5KsHokoqgZPF1Q31rc0ETfLjRICES5RFoBBQXnVevFNCr4oFys+rsUIol5xxFNGBH5uoYecTUe3YIpWIUnfQ6jR8jH/WjgQl4Y0KPTpeCsf/ux/2Wx2VNNyCOYgnOdkHL8RV0cUJigjIMNxUeLY7q/CSVcHtOWucgwQ0S3LrInIBCnpaNCi6FTkl/YKKF7Y7iNLuzYfRegwLhOWpo6kk/MB2qcFisYgTTEzSwuAAjYlWIlWdvAoaHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: meaning and use of IOMMU_FLUSHF_added
To: paul@xen.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d6a6e5a3-5ea2-638e-1eb5-2fee73d82188@suse.com>
 <496eb0fb-138e-d807-ebad-fc4b792dd9be@suse.com>
 <d426b1fc-cf57-469a-59c8-a2d28ed2e312@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f89011ff-dd4c-aa60-ebcb-1baba5c431ed@suse.com>
Date: Thu, 19 Aug 2021 13:10:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d426b1fc-cf57-469a-59c8-a2d28ed2e312@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2PR09CA0012.eurprd09.prod.outlook.com
 (2603:10a6:101:16::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da522228-9d12-48f8-7092-08d96301e5cd
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB438139B7F6087C09E96F9E97B3C09@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	253c55HFw4t9ktlYu0L3r7EbcaASCeSWk2Mc7YT5yxGlepV0sh/VLrZ1mJhJ0mjzqymxNwVo+BBJRB/Xi6ZLCeX5h1L3u+LSAx9wWyvkSwnzG9ga8H/OgB+Q7/AwRuw29E/dCpZ2ovvj/Qf9wDQScf49A9LIef595H/uqQojjuGGTggPBDqzkQSR2pil7bWDHInkoujCRQBuRLt34SOL4ycHgXh2tAkCF5aDthX/Rf/pgrSZfnO8dV0QGvSmhUBQ7pklVnz1iCZ+k/KVHtW0BXEES6UXPDO++/YivwHJAVeNG5MMelVMjqU8dYziuOL3xFfld0Jxz8mYfGNSCysGaT7tL0aMRkFS1HUD7AxYcd9t7GqSe+7zYvQqCP0ghCZ2VA15V6jVXKiK+wmURu9mEiWQ1pl/nRC99cQnTwDKDSja+L3iptC6vurQ/0iHkrMIG6RaMyOpwqlSBBO1CaJ4F8JoibR7JbJzB8UiPX65wn/cxxg+8SwsrrNFOCyFXqJ/f0rc3D51oHHRBoN/qSzeSSBBtLW26EnuQdL0Am5ht739RYuuF8CWLnLu0g3LF4FEDys6bj+rFAByFrrViJ3oTlDgN3yIf6VNBSe4+YqNYqt3PqgoHoOlScqaeUTBjP7Dk7xBSpatgnLbiw1bQH0oNOuZPxKR9yFvp7dbNQ6yREq2oYnrFz12sJ7txrfi5ZeIjC68WXbLAOhCR5IWE0OKegClQq1b4z1253RnmNL+Yv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39860400002)(376002)(396003)(136003)(36756003)(956004)(6916009)(83380400001)(38100700002)(4326008)(53546011)(8936002)(2616005)(86362001)(2906002)(26005)(8676002)(186003)(16576012)(66556008)(5660300002)(66476007)(31696002)(478600001)(6486002)(31686004)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ykc2UHFVVFJlNzFqclRpbGdwVUpkL0REbFdrZk9hbXdGZVIwbjdrNFRFQ2dp?=
 =?utf-8?B?Z3AvblkvQ1EwcERZbytYUXpVR3VRTlJCU3ZMNElMcU1HWG1MM1pkb0JieGY2?=
 =?utf-8?B?d0tncmVvV1B5R0hWa3J4enNWY0RJTU5vREo1K3AvM3I2bmJUVU52RGRGekRj?=
 =?utf-8?B?bklQaDhNL3FGTnNaZkVFb0c2OGRPaUlGbFI1NDlPK1hyaWxvMHdYblVXSEIy?=
 =?utf-8?B?T1VJNkQ3Y0phbWlRbHllSDFzZG1ZQml4WHF5eEFKa1VvaG9PcFljelNucnFl?=
 =?utf-8?B?SEJPd2JodG9YaDhVdXFsd0xxL25CbS9vbEpaUnJZeXNoWGdWc0ZvblYxWWlV?=
 =?utf-8?B?bXRTdTdXYXlZY0dEQnFZUWwxRmJGeUNOMU5zOTAwd3A2VVRiUDdoNklXSVRC?=
 =?utf-8?B?M0lJY2FNZ3FUVFZYSERJcDR4dVY4dXBXN0JNVE5vQzY1SGhJaDlpVGdoMkZN?=
 =?utf-8?B?RjZZeVJnZFNGYTNwbUUvRHkvS2dlUk9MZ3NWbzIxcXZ2K2FSQXEyQXNSYXVR?=
 =?utf-8?B?d2ZQdmpnSUhsanVWMElyY3dJUE5pNkw3dk9VNkI0bW1sOUxNdksrVjVRRVla?=
 =?utf-8?B?cDBJWUNCWFNBWUZ5N1c5MnRlOEhnaCtJVm5lRkppOXlpYUJ6Mk5rN053eGJY?=
 =?utf-8?B?ZEo2bjlYRlJkamZ4NEJNNVRrZ2VWZW5KRXluaDNrS1Z1V21yeUpLblBKWUZK?=
 =?utf-8?B?OWVXODgvejNSQjBDd3JOZjZESWtWdEZXVmJjM3RKZ1dXVTcwYVdWbzd5OUQy?=
 =?utf-8?B?TkNWQ25XTDBNd2ZHTTh3ZDNOajZiZzJqZGxuUkgwQzR3VlpUZnE5a2pWbHZm?=
 =?utf-8?B?Mmw2cE80RDZwYjJZTDFDS3RhL0JvUlc5bnZxZ2pqbHY3cWszZm95S01lL2tJ?=
 =?utf-8?B?eXdpdUNXdkRSb1Y5end4cDRjUitQODlDZWQ4UUpyVUVTcGNaQVg3OWxYNStH?=
 =?utf-8?B?a1lRdEEyTGNhdlA5RFZ3dkt0OHlWTFZpZXJQcXVRdEE4Q1I4UXhlVnVXa29y?=
 =?utf-8?B?WDlrejVBZkYwamhtaDM3L2oraTBzZ0dtR1lEdGN5ZU53TXhhc1BoZEh0Yzdr?=
 =?utf-8?B?UENvc0FBVGJnb0dvNGhIOFRMS05IcnBRTGxWUG02UFZ5TUVJMjNVT3REK05t?=
 =?utf-8?B?cjl0ZEc2OFlnREV0WXRYZDQydDhiRnMrZ2pJanh1bHV5T2EvMnYwNlE1bEt0?=
 =?utf-8?B?d3ozdTBPWjhmQTdlMFkvQUZqTlQ1d1AxZzVrREFQQWZqQ2tuRHJxNDFZL0N1?=
 =?utf-8?B?bjlwV1BOQUNNYmZRTjZGUlljTGZUME12elV5eEJKcUVhcjRGTEtTdGF6VnI3?=
 =?utf-8?B?ck5CL3JnY0Y1Mncram8wR0JudEhqQ2ppS2pCOVZhU2w2TDhja044OEt3cDFD?=
 =?utf-8?B?dmJIUlYwSzlhTVlpS1Y0VUc5TFhhTEJzMmtDZkhyRzg4bGU4cXBOVExENHpR?=
 =?utf-8?B?OStIa3ZMazVDZllsWXpOOC84THpBeFZITkNueGJoMzhJTUg2aGtIeXRFcUMy?=
 =?utf-8?B?Z0JQSUVJanEybkI3Y1pNVzJGOUNLQjl2TEgwUWhlWDlGVzJHVFRrSTAybDVt?=
 =?utf-8?B?dWRqem12SmY2WWovTFdzRVQ3NEZSZ1U2K0VTdThsM2czRGRDNi9kMEtRRlVs?=
 =?utf-8?B?QUxYbHBZeGE2Vkh2cjl0ZmFjYkVNUHNESUgxOW1CdFRVcisvUlRtc0FHUDlk?=
 =?utf-8?B?WmhDcVBFN1Y0ZHI0dFg1MzJ2WkRXLzllUnR0V0RkK2dzNFIrTUNFSk5ZS3F1?=
 =?utf-8?Q?iOBhfz9tccDHCrg/M5IJJYooxGiWEmFXdihEm2b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da522228-9d12-48f8-7092-08d96301e5cd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 11:10:05.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OP8D6dnabrQgeZN2hf/HZtCARcs9h2yGb5B5fR2I9+hMMVt1BI7kv9QUDTZdjqNLC+fHgwbYPhUwCTMDqEGvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 18.08.2021 16:15, Paul Durrant wrote:
> On 18/08/2021 13:09, Jan Beulich wrote:
>> On 18.08.2021 12:51, Jan Beulich wrote:
>>> back at the time I did already question your intended meaning of
>>> this flag. I notice that there's presently no consumer of it being
>>> set (apart from yielding non-zero flush_flags). I'm afraid this
>>> model makes accumulation of flush flags not work properly: With
>>> both flags set and more than a single page altered, it is
>>> impossible to tell apart whether two present PTEs were altered, or
>>> a non-present and a present one.
>>>
>>> VT-d's flushing needs to know the distinction; it may in fact be
>>> necessary to issue two flushes (or a single "heavier" one) when
>>> both non-present and present entries got transitioned to present
>>> in one go.
>>
>> No two (or "heavier") flush looks to be needed upon further reading.
>> I did derive this from our setting of "did" to zero in that case,
>> but that looks to be wrong in the first place - it's correct only
>> for context cache entry flushes. I'll make a(nother) patch ...
> 
> Yes, the intention of the flag was simply to allow a 'lighter' flush in 
> the case there are no modified entries as part of the accumulation. If 
> it is impossible to tell the difference then I guess it's not useful.

Actually things can remain as they are, I think. The problem really
was the flushing bug (patch sent earlier today): If it was necessary
to flush previously present entries with their actual did but not-
present ones with did 0, the flushing logic would have had a need to
know. With that bug fixed (and hence with flushing only needing a
yes/no indicator), all is fine as is (in this regard).

Jan


