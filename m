Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE39E5E99F2
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 08:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411406.654322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oci3s-00079h-Nt; Mon, 26 Sep 2022 06:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411406.654322; Mon, 26 Sep 2022 06:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oci3s-000772-Kz; Mon, 26 Sep 2022 06:57:52 +0000
Received: by outflank-mailman (input) for mailman id 411406;
 Mon, 26 Sep 2022 06:57:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oci3r-00076t-2s
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 06:57:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8809c7a4-3d68-11ed-9647-05401a9f4f97;
 Mon, 26 Sep 2022 08:57:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9146.eurprd04.prod.outlook.com (2603:10a6:10:2f5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.23; Mon, 26 Sep
 2022 06:57:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 06:57:46 +0000
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
X-Inumbo-ID: 8809c7a4-3d68-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8fmdhMt2L0YZw6zGSbUjkQRww9mRPljTjg1KkVWtczugbI3+Hl5yW3apeFJsMR+rA8juzvoHd/JVR5kZ9wrdEkvxDwFW2ZnQzH/8P66ZBDdlWNXWWh3wJYsLGHmk07DgeVYnQD9wBVNE9huEOgyDa2mQ/s1dIkqfvb2f7mcyn/relsXhaO+zzuejzm+S5mKQxufuSHW8VmKTfJ59pZq2+USFXLg/XU/udI0Hdpz1X1nYXVqP0Z5mCaYENsT1vVD0ezCo0gTsIivAPJTcutMgpeaP7ZXTB/c5eYI2aeROROQT3WI158zXaQmWFX7bOPLLh4H02mno2BlMmclNCdkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYf2tP+ZpnmF19YH10EKsbxLjZfVuIssD9txRvQgDGM=;
 b=LWE3CVzyxikx9iexD6moF8DuZyH5HMRkA5i2VB1IJHUI4pTbo7qknFLZG/M54HWXIWDCbQr8xNRT+nOZp4mwuL3Is+m/ylYQVzPgbak7QWpvUGAXnvUYPfo9puqooBTm/dr0Uanpqfus1ER2L1lSmori4bY9mMJW4iTC3UlPOGEpw5Ue8LdXOjN7ywyHQaBtX55SizGrZ+KLX0wAslvyHCHRu7gEA/i2s+TQZN1m3mO4ucGgDJE3TkYe5R7FiNTca+GRgXjuaph3J6Fx3MoRnvmDcX3yW6hme2vKDDRkVs8rUgo8lXQMLetUYlzGoHEbJi5mG2o+4V5E7fytjEEiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYf2tP+ZpnmF19YH10EKsbxLjZfVuIssD9txRvQgDGM=;
 b=NgT0qHVKv8j5qfgqlJgFRri04smUA0eUmCsG3Trp3+obeEYKJqlsrBUDIZwBWRUcxa3IMzebvKRFje7hC2mdTzmD945OP/e7+IltZ6iSPSCE/lPKn2aFV8TIDMGrXv/1ngpQ8IE7enZH34yaYC5feXRhvnt2nwJpGsWI72jXhu6umiO5P4cJggFVHRZDTJTJ5vwY90ElfQUMGp8wD1JIPn6mcc0oeCUedJoIMXz+Rq6zlmXmB6KOovmNE8sdGm51uBdlY/6+Yjz38QGpf7/H/Iq2oY8D2r+roEHFme1aHXlB+XeVGCl7+EX/fSLgVtANJ2bCs7umPCqGZ2uBkfAkLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <192f76e1-4f5a-34e7-84e7-a78da531607a@suse.com>
Date: Mon, 26 Sep 2022 08:57:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Design session "grant v3"
To: Juergen Gross <jgross@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YyxmQf+q0BqsX8Nb@mail-itl>
 <cb4829d0-ca64-9f41-8a0f-48cf6ce84040@suse.com>
 <767eeb85-40ab-70f6-2d0f-f81af0a65f6e@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <767eeb85-40ab-70f6-2d0f-f81af0a65f6e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: aa76a2f2-17c5-4a85-7b53-08da9f8c6a94
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4UU4lfxg8It3QM6xUsmJxt7p+FOBBPZh59B9uuv4n3t3hxTV1h19zN2nwTkMq1YnZjbKcnYJwWs5XxynaNPAQTcA1JNyWW+FoJVock1O5Xi9+SOn4heXrIDPp7RSLUJQnp/DoTaqxv3Xay0GgsCHRYjScMnjOAv+jlbp3rp7r9YZY+qG1ZHSPMlU0jYorLKJ/8ivY7spFy4e0JIobjXpcL7zWjzWbG09dGRv5zsFKNcZatjxgYmuGDQbAQvw13peQcuKKTTA4Azaa8FQ+s9XD9m5LBy97n5EZMUp2iSPY6idHMbn0EV54KawIo+FLC6Uer/MPVDB/tvD0Uyihk3u9mE5eMKhWyUJWD7OcxGn6WlmxQO1JmojwFwIu802+YRpYjDuRIUsljKTjRpPOR+pAH0ZbTsx7Ba9CoTeAHQhdjRer+ICnHehpfuk2+l/ujiG+4ufQpEfUuJ/UvZ8LiETNbIh/Anww8zcnFuLkNJWpOWaCe0TvTuCnQQ1d4Xe3BfIM8dljG0ydKrewyfoJve4333OrzSyvj4JhXE2t8Agzi9Lt1Umvk9WeFtF+N1IXxhPoxCYSknvOcAxQIJFvt9/sYAyYd0nYSraSl6gVRibqHAIkFk/QskpPFJZ9DmxQUKFKSG1eSM8cBSA9JQ6wGOU0joXuUdEmXNC+9PmTBjcytJZAX3GrW83IeMIOMIRSneRnuOGCUYceSTPZUdFAINnht4Eq4cj3StOYAnjzgTJ+mLNQUyxSu4QdwcI/23Td4tsjPobP2I0o5ZyOVxFhREciwlEmHeU/Nb9acOQhRGhaFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199015)(83380400001)(66574015)(186003)(38100700002)(36756003)(86362001)(31696002)(66556008)(316002)(66476007)(66946007)(31686004)(41300700001)(478600001)(6486002)(54906003)(6636002)(37006003)(26005)(8936002)(6512007)(6862004)(6506007)(53546011)(2616005)(2906002)(5660300002)(6666004)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2dILzFkckFheGFpSlMycDVOYmhJcnNkeWg1Q2g3NVFtdnFMZ3A3K0Nxc2xW?=
 =?utf-8?B?elBEQWhoMUxyYkdLNitBSnRoMjZqemIyaGc2U0I3cU12LzIvSVZGeFc5QzBt?=
 =?utf-8?B?RDY2bEh2a05EUTBodFErMHhjb3RJbHFkcGEraUU2cVV4UWJ1bVVBdkpod0FK?=
 =?utf-8?B?WHpxSmVPWWo1Mm5sYVdCNXVlWkNBNWtCeXhocldpMS9FMy8zMTB6dVE2OFhU?=
 =?utf-8?B?NWxoUS9wV0gzUW1aNlVVWUhlRjZSa25xMm9FS2M3SkQ3dW1iZ1JzUXZjTTkr?=
 =?utf-8?B?T1l3NEQ2c3VkQ3BmYzlTb0Y3TmlhakJObERqQThZWW5qNVcvZU5xamFSeUZC?=
 =?utf-8?B?czlJMHJMRjNLclFHTG1LeWFaRXAvYXoxVWZLTnNTbEJyVnk3Y3NubndFaXNp?=
 =?utf-8?B?c0dDKy81VDA5NnlpL2NKQlBvU3RoS1BUMEE1T3Z1QWJUZllKbStjUm13ZlMw?=
 =?utf-8?B?NDRnaHRMNFFBMjR0K3MzTGtmRFRsSVFzQjBrdlFLZ3ViMlF3akgvN2xSekhM?=
 =?utf-8?B?OGo2Yko0Y05FZndoRnh0V2IzQm1iQ1YvWi9tcEU2S0Yra01JRmNRNEF3cFBD?=
 =?utf-8?B?b2tRVEJ0MlFRZ0VuOHI5NG80THhLUlFXMnhrQWRqdHIva1dvemhMZ0hZYWpp?=
 =?utf-8?B?MkgvNXNKZjJhb2tvYlBOajlleTBUM1hmWU96bzNQOVczMFBpK1dMTUpDVGtv?=
 =?utf-8?B?SGk2cTJMTXZZQWxnNEtrS1RRbDhJdzM2cDhlMlVWS1BJdEZTSE01MWhESDNO?=
 =?utf-8?B?b2tubmdCYTBkVVJOT0VLT1pOQXM2SmU4NkM5TEN0eWVHZzZMY1pJUnNZLzYx?=
 =?utf-8?B?VHZ5UTN6bS9rRW5DMU1Cc2dncTk5czJZTWhsRFpYU2lscjlXL3dkdW1XTnpp?=
 =?utf-8?B?Y1I0MjBBS1hBd0RFU1NLQUpLM2gvSjcrZkVueWhhZ0dvd21xYUhBRlpXbk4z?=
 =?utf-8?B?VUY3dGgyZnNsRGErdUV4U1RHaTF6Y1grZzNvWE9sS3FQS08xL2l0L29TNjJu?=
 =?utf-8?B?ZDBSZG4wUWhiUGNWcUNnS1VnZnRaN1ppeUJUemoxTi81RU5GOVZ0ajBUdHpR?=
 =?utf-8?B?TGN2d3Z3SEpsQXBJekR2OTVjR0dCWVRoTXZ1MHZENjhzUlg4RjU2N25qYTBZ?=
 =?utf-8?B?YTBTaWt1N1JIVFZHMThkWGhTeXNLeVZ2ejB3clZrd2phUHVOcGlmM0Qxdjk2?=
 =?utf-8?B?M2ZVQy9GcVo0aE1uZlRtUmJqNHRNaXh4elpBbnYya1RsOHNDTHY2RGFxaHNn?=
 =?utf-8?B?ZUdCbUN2Qk5wV0hwY2pDMTk3R3RrUlg3YWEvOUNsdTlQeFpFSEdtNnV3bnJR?=
 =?utf-8?B?eUM2SlcrTzR4Yk45aVJ1Y2poWG1BekFiMW1pTm8xTGtTNnBoUk1HbnErV2tR?=
 =?utf-8?B?b1lqNkF6c0NUVmF4SHAyWlVRazdscGR1d0xUNkVVNXdGSUhtNGVjN3hGcWZT?=
 =?utf-8?B?bUpTZXlqc1BaTjlHb1hUcmZGMVhIb0lVc0JhaWF1eFVBTDMyWHh2Zm5SVkNm?=
 =?utf-8?B?ZkorMjRxWHZPcGZVM1prOHNHSzNwcVZQT0FRT0REQkZJa3o2eGhzZFRrQkkr?=
 =?utf-8?B?aU0wdURVcml2bEhBc3VCM0VmYytFRFlyYTBRejlFdmVxL3ZIWVV5T1Rmc0x4?=
 =?utf-8?B?TXRuNHVRRk9nMm9PaE9hUEVoVEVsTU9pQTJKQnpIcjFIeHJnOUlqeWVRNFNP?=
 =?utf-8?B?RGIybUlpbTE1OFJKV1VybVB5SDdRZkpWZUtBbjBSRGVyTDlCdUZraThQTHZV?=
 =?utf-8?B?OGp0SzVqQXF1YiszZW4zdUlhUzExMlYzTllod0lYek5SdnE3WElEUE0rL3E3?=
 =?utf-8?B?WE5oRStrVHFVVGczSGx4UklkM1QvRmlEa0l4QXlzekNycTVsN0VNSU9icHZT?=
 =?utf-8?B?Uk1WeHRYMnEwbmtadDQ4cTdLckJtb0pxNngxbXVIVlp0cThsdTRCNFNwSlZk?=
 =?utf-8?B?NE5CR0krWTFCUTZud3RXUGxSSWdlbFdDMW5hdE9JdUdZUlMwK0VieGE1V1hR?=
 =?utf-8?B?U1lkb2RTeXd4amJiV0pQY1hMY0tNYmFETS9NOWNwdGhaL1o2THd5Z3FjYTZk?=
 =?utf-8?B?RkdPVEZIVk9pV3oxOTdZQ3p6V2NZVmVxcE1Gb0R1MnZId25rSWVRVmxxd0p5?=
 =?utf-8?Q?YPl//eS1jRL3euw5dLDbhybb/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa76a2f2-17c5-4a85-7b53-08da9f8c6a94
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:57:46.0106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSDBOZb1HO3Wz7jhsqDamjE3W4yXKbtdCtHYjXQDR6045UjxfFXyMNxZY8rJE8lwJ1I5HeXgmOF7543of8F5aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9146

On 23.09.2022 11:31, Juergen Gross wrote:
> On 22.09.22 20:43, Jan Beulich wrote:
>> On 22.09.2022 15:42, Marek Marczykowski-Górecki wrote:
>>> Yann:   can backend refuse revoking?
>>> Jürgen: it shouldn't be this way, but revoke could be controlled by feature flag; revoke could pass scratch page per revoke call (more flexible control)
>>
>> A single scratch page comes with the risk of data corruption, as all
>> I/O would be directed there. A sink page (for memory writes) would
>> likely be okay, but device writes (memory reads) can't be done from
>> a surrogate page.
> 
> I don't see that problem.
> 
> In case the grant is revoked due to a malicious/buggy backend, you can't
> trust the I/O data anyway.

I agree for the malicious case, but I'm less certain when is come to
buggy backends. Some bugs (like not unmapping a grant) aren't putting
the data at risk.

>>> Jürgen: we should consider interface to mapping large pages ("map this area as a large page if backend shared it as large page")
>>
>> s/backend/frontend/ I guess?
> 
> Yes.
> 
> But large pages have another downside: The backend needs to know it is a large
> page, otherwise it might get confused. So while this sounds like a nice idea, it
> is cumbersome in practice. But maybe someone is coming up with a nice idea how
> to solve that.

Couldn't that simply be a new GTF_superpage flag, with the size
encoded along the lines of AMD IOMMUs encode superpages (setting all
but the top-most of the bits not used for the actual frame address)
in the address part of the entry?

Jan

