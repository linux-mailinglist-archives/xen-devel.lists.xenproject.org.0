Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2594502DE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 11:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225771.389947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZeK-00055g-M6; Mon, 15 Nov 2021 10:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225771.389947; Mon, 15 Nov 2021 10:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZeK-00053V-Ib; Mon, 15 Nov 2021 10:55:44 +0000
Received: by outflank-mailman (input) for mailman id 225771;
 Mon, 15 Nov 2021 10:55:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmZeI-00053N-TB
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 10:55:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9352de88-4602-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 11:55:41 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-oS_LLfIbOUGHzucypXAGEg-2; Mon, 15 Nov 2021 11:55:40 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6163.eurprd04.prod.outlook.com (2603:10a6:208:13f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 10:55:39 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 10:55:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0215.eurprd06.prod.outlook.com (2603:10a6:20b:45e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 10:55:38 +0000
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
X-Inumbo-ID: 9352de88-4602-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636973741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgJdF0YUrX9dl8I6Mk8SvQd/Fvmv82xtDqUaM7mpsGM=;
	b=KTGigzLGJGat+g65KBEubvzrV9WvnDpPy/sAXVFygFk2l1gfbPGMDq0RHK9RFDLWqe7AX5
	gbGArKih/YbL0uQvQElT309LaEJ3LNMgX1DH+X+Sap5DsTp4rorEi22G6OT6rjyoWRjr6L
	bv/UmrmGBeSKehZtu8jcP8w92Bedfjs=
X-MC-Unique: oS_LLfIbOUGHzucypXAGEg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRqseEckfZKTaQTpB6dJ+3e6OQ7BdGcQVtfAjmzQTBObCInJhF8dktPnYq4T8l7WczCcr1NvxWaovDlug4O+bbBph0irNsEwfd9bGruv0iWqyYf+Z290SxHFCm1KFoKlkVpLNuIF8JmvFtt8Jrldtf9/ZxB0jtoR8hRQlrdBnMjuDP5u+GHVki+CLxFLcAefLxuIbTA8TRGqVWMtdCVO1NeiOODoj8Bcje0vn4gG/EFG1Lawmo3Icj2GZbzQwAqWBehX0qIyX2PgEBMAkw4aiLWdpJgRIYIhh8Ns2gzNwUS3Okw2/o7v0fRhT50l/0Nou8tMEZ3t0pHKUDjNXD2RDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgJdF0YUrX9dl8I6Mk8SvQd/Fvmv82xtDqUaM7mpsGM=;
 b=Tpm+aPFAV4jXmGnXeVOUGvKpM9hBU49xVAzLAdNkkvqbEfj5B0s3UAeT8c0Vu32uzoBdPviSjYr7pDP1vnYxpsPHenVrV+rjNIjO9iGpjE9Vev58z7Bvv9Gbh9OpRZznIKivUhipC/2Z0rIHmx1tqMOxvYf6PQdM3U2sz3TgzvyhbhsMg5PFLr7I+kVn4pOtnsnpERlvkNRQjO7s+NFX3ZBKicX8ojaL8xX0TRfM50axTXIMl6FAJbwGIIWnMK2h27DaDdhWNC8Jy7NPSquTg3Aliw5gQJh7CAFji2oWwz3qluzOsE9ZIn0o0LVlxyDZUtQ4EwVq8AFA1nH/BVR8IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc9fd8d6-7461-367c-01c6-f4c852e13f54@suse.com>
Date: Mon, 15 Nov 2021 11:55:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
 <D0965ED8-C1FE-473F-91C7-3EE18ABAB3C4@arm.com>
 <a1b2aa1b-7d8a-4ab6-cde5-25581ee9841c@suse.com>
 <C3FB48C2-F619-48A2-9268-F0938405133C@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <C3FB48C2-F619-48A2-9268-F0938405133C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0215.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::22) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c04fe92-f543-4f0a-3eef-08d9a82675d0
X-MS-TrafficTypeDiagnostic: AM0PR04MB6163:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6163E0248947BDF263B7A414B3989@AM0PR04MB6163.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DerazcNo4Cxu+ZFTXjWx3qsEgASG/UOxifzFP3YdQVWYKMLSmlmrnM2XvM4lARTzFLVFKFoKmBfA4vdlkGRVqFCNMS6xj9mRLSuMIFAwe8bAbyX2HC1rAjKLBVkDvqFNUnUZtzHLVoGOKpgnODtLW4I1nhZESS1vLCEAHRPmxRrOxENIERpuzoMjt13vratpNuY7KBTOwV/CoVEXRhzNvhXKWx9Gg7u71j84t5RrXC4fuRJD9lmN4UyoLE1xQlhVu1npDEi/L+eJn7Zk6d9v/IjONKx5o9EzrxrsODxGpQ3Gjjxmzn08ufcwPzkp/mXuOXKEkJ5+LWkIsqMlVaJzXpOCRnKJ/fd/feswzIEI2vJW8gZIq2Bl9M6I6x46spMSz9RKaARemnwRAGoFUEOknB0tA1e2dn0IgRFcBf8clooR0Fd23gJtDXSkXx0EjSbpTfSar7WDvRhklMXV14GpjCcVsdQJdw9eSkyhE6bzt4pXPtCEBaUZCQNlIViRpOyQs3GgELtPkPrh0GtD2furxra+HgHhgV7mYdPrj1G2wPginvf+gNagMFWCpeU1DZcwLHfM2EIAXwkIOLp6ZyDKWCuqbW9CpbiwTHoDfjzcXLVPaFMHQoVbHJQnv5qQDoUL9g/6jtiJnlaTeuhM6GLdWFB9cpjAieBZsUZcaiLZ3TDX4znikzmVCFRYLLUzDRMHUtrLaAJW6+nuFbOQGAsm9I4rrFwTyaMAfWsPvFybGOawMUSAQl2n4ibVbXaxBEkG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66946007)(31686004)(6486002)(956004)(8936002)(31696002)(4326008)(66556008)(2906002)(6916009)(26005)(53546011)(2616005)(38100700002)(86362001)(508600001)(8676002)(186003)(36756003)(5660300002)(54906003)(16576012)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUQzSmxyV1hYSSt0bDZQbEptTjRpSmhsZDRsNEVwcGpYRTZCWkJib0VtZ2dO?=
 =?utf-8?B?QnpIZldSM3RFeGZjeTQ1NHNJbjh2eXVyaVd2OHVEQnU1VmVrNHZpSm1ETS9U?=
 =?utf-8?B?NnI0Wit1aTBtTnFWdmhMUjMveUxjVGhHY1VJMWJqT0VoSnFMKzZ5ZFZWS2JW?=
 =?utf-8?B?WVJQN1BnU1lGeE96Y09aY0swUkZmM0RYVDZiVVQ1aDdaZ3RJVU1yWWRwZW9N?=
 =?utf-8?B?MHFHK0FERUVWbzFyeEFvSmJxWExPbXBxUk43TEdLSGxRdDRlTVlNRENBUFor?=
 =?utf-8?B?TW55aHgxbWFQaFQySVJMVHd3USt1WmdhRFJSYTVoQ1dUQ0N2WS9lV0ZxQnhW?=
 =?utf-8?B?ZytNZ2IySUI5MFN2Z0VHM1Ird0I4UFUrYnVyWEpsNXVVTWZnQmVSd1B2TGFz?=
 =?utf-8?B?VzhxU21qYUR0bEJuWWRFSzh2UUQ4ZmRMQ09wOExBTHpYREdPN0xodDVYTy9Y?=
 =?utf-8?B?ODhVOE5YT0tzdWNQa09qaG9wcnkySVBraUYrbFJSZjFGUStpci9GM3VvRDV6?=
 =?utf-8?B?aVFINEtQSnZ4UDdObk94SEEzeSt1YUJCYzBxczJnUEFVL0U1L2d3WXpaSjlp?=
 =?utf-8?B?UG5KWFl0Yi9VVWZKdVdpTHZya0M4Rk10ZmdNOENXeWowcFh3bVl0M0VjR0o3?=
 =?utf-8?B?Y0pOY1NNS2tzanZlcFc4Vk5iRVQ2WmdWaHNBOXBrOVc5dmdkTTNka0RPRTFz?=
 =?utf-8?B?UEdtODJ3NlZFRU5hWVR1S3hwY2YwYmpYTnkxZVFFd1lQM3VEbjJ6dzRLSVAz?=
 =?utf-8?B?SVErWFZKVzJhZ3pUcWNBK0ZZOEs3cXNybzFKLzNETlV0aTlpbzlIQnpES1ZV?=
 =?utf-8?B?Yjg5aGJ2S3Nsdm94MUwvcmQzVngrcUt1ZWN6Z3RodWMwbFpqWDhicGFWaWQ3?=
 =?utf-8?B?Y1JIWjlwRDRzcVQrck1wNFZYRkJnRGZvdTR0QXJEaXlPTWoxUUVJOFI4elVi?=
 =?utf-8?B?YjFqWmlwQ3g0eHZxSlZMQ0JrYWN1UE1FZ2ZVeFhDdXhldkNndkVFcDU5cVMx?=
 =?utf-8?B?UUJQTWc0NmQ4K1g0NytHRSt1ckVJRWI5T0RmdVcwTm1UL2FxU2UrS2tQcU5y?=
 =?utf-8?B?bWVRWDg2YS9kNm9lSk04NWpBMFRhR0RJZmlabmhpSm9vWmZVWGJCOUdlV3Ro?=
 =?utf-8?B?c0ZFTjJ0d0Z6WDdYR2c0QzA2bnd2ckZoa3QyUWpGN2hjQk9UZVpOOXg4NC8v?=
 =?utf-8?B?RFkrdUU2dlRIZnJHa2FmRStRdlY1cCtCRmd3RldKamNNWXU5ZzMvelhRVFcv?=
 =?utf-8?B?NkQvb28zQ0hiUGVEd25PQUFmZVJlRWo0Yms2RFVIZzhPTkZ5VFdKeXJiQm9z?=
 =?utf-8?B?NTVkU1F6aXJtTXVLaXVsSGdZNmJLd1JHZ2pYQXUvZmNtTTR1TjgrM3d6c29T?=
 =?utf-8?B?YUhtczRacytCWDluRmF3eFZwWCtvbmJ6OGZmcnYwTTNHR0RnUVZJRjdOV0w2?=
 =?utf-8?B?dnU3bmNhSnovM2dMa3JVa0pRRnF5YjQzSkN2RFRscDNzaHVMQklzdis0VTkr?=
 =?utf-8?B?d2Zlam5tNlpVMER5L0VZTTFuZ0xsUUVab1NrdUJhUGJqbzV1THRuOVZhOU54?=
 =?utf-8?B?NjBBOXY3aUhQeDNFSE1tZ0lMWDJ1RElkSEtDV0tKMUtOV1VmSGFNR29OV0Nk?=
 =?utf-8?B?M1dJN0V4N1AxZnljd3h6M25OSFdvT3V4TjU2KzhvLzhPUVhPTWN1SVcrb1I4?=
 =?utf-8?B?WlhjbVFCajBZZnVENWtIbnUrTCsrOTRMeWFMb2xmOXRnY1JGMkJER1lvSzJy?=
 =?utf-8?B?c2lpZVFEYWtNRlB0REMzbTRZYzRtb2YzWldSeEJaeXNRb05CZUdzRXNnY0dZ?=
 =?utf-8?B?L1I1ZXplQ2QvSDNYRmNxazR5OE42R2tlK2ZkUG5Jc1J6U0w0RGJ2UGo3RHRY?=
 =?utf-8?B?RDZPSDU5SHRPL1laRCthS1dia0cvejBjNXpDaUY2TXl5ZlVOQjBPYVJxdElo?=
 =?utf-8?B?ZkdLUnRGYkpsOHNLTHBidTdNSXhzRHZuelN5SmEwNEJUMkZraW92S2RKRXdn?=
 =?utf-8?B?dEh5dHIwYjdzeVJrZk5GL2x6SXhzSVErdEp2VVg5dTk2R25jcis3Y3ZaRjZG?=
 =?utf-8?B?eXB1aG5KRHdSZG9JaFlRblJHSFI0YVpTK011emVScUQ5TkRPNFZ4bUk4a1V1?=
 =?utf-8?B?QWFTVE14ZDV5SENac3dRR0pOdEFNRktraDFSTU9nWFRoNzFuUEU2YzRwb25o?=
 =?utf-8?Q?9ee4+R9b8y1LlB8frOru420=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c04fe92-f543-4f0a-3eef-08d9a82675d0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 10:55:38.9730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9P63PDq6LjelQNYP0kBK7+KhonFZD4XFHbh4xiqIVGRrqzuyg70DF42LyoS34YdmYaENqQcuBuQKfmqIr+lF5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6163

On 15.11.2021 11:23, Bertrand Marquis wrote:
> Hi Jan,
> 
>> On 15 Nov 2021, at 10:20, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.11.2021 11:13, Bertrand Marquis wrote:
>>>> On 11 Nov 2021, at 17:57, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -1234,15 +1234,18 @@ int vcpu_unpause_by_systemcontroller(struct vcpu *v)
>>>>    return 0;
>>>> }
>>>>
>>>> -static void do_domain_pause(struct domain *d,
>>>> -                            void (*sleep_fn)(struct vcpu *v))
>>>> +static void _domain_pause(struct domain *d, bool sync /* or nosync */)
>>>
>>> Here you use comments inside the function definition.
>>> I think this is something that should be avoided and in this specific case a
>>> boolean sync is clear enough not to need to explain that false is nosing.
>>
>> While I agree the comment here isn't overly useful, I think ...
>>
>>>> @@ -1250,12 +1253,12 @@ static void do_domain_pause(struct domain *d,
>>>> void domain_pause(struct domain *d)
>>>> {
>>>>    ASSERT(d != current->domain);
>>>> -    do_domain_pause(d, vcpu_sleep_sync);
>>>> +    _domain_pause(d, true /* sync */);
>>> Same here.
>>
>> ... comments like this one are pretty useful to disambiguate the plain
>> "true" or "false" (without the reader needing to go look at the function
>> declaration or definition).
> 
> I agree with that but the comment here is useful, it could be added before
> the call instead of inside it.

Except the form Andrew has used is the one we've been using elsewhere
for some time.

Jan


