Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 141BF46FE15
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:45:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243688.421603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcTE-0003DN-0J; Fri, 10 Dec 2021 09:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243688.421603; Fri, 10 Dec 2021 09:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcTD-0003AN-S5; Fri, 10 Dec 2021 09:45:39 +0000
Received: by outflank-mailman (input) for mailman id 243688;
 Fri, 10 Dec 2021 09:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvcTC-0003AH-H6
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:45:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed812434-599d-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 10:45:37 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-9YuU4PszPNOjbZdaQiYqQw-1; Fri, 10 Dec 2021 10:44:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 09:44:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 09:44:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P189CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 09:44:28 +0000
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
X-Inumbo-ID: ed812434-599d-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639129537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V6ZVvdHpKOBQ0B2guTFtvy5s9m0PX1YMTarGqu6D8AQ=;
	b=JNXz3ajdDHAV9tT8vkEsdVTH16TTMKE4XYu4higH86vHkVeQyp/Nr8VKubG/sEb5UpgK44
	pW9aK6AR2ml96xzzT8Pd8ll7Bg3BhFtKb/oVOYFTC0kBq34uCq5pG2XVLW56a1gMTsT3m0
	156fVDzQVBlpCQ6jRGni0mHMwCYa4uA=
X-MC-Unique: 9YuU4PszPNOjbZdaQiYqQw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKoq8INNo0hUNuI8tf3DRE3KocFc1nCNI509CQcZoYtly3pRPvB1T+bunbl/14pfLmmHFmr7kjS6H+KwaTXdAV/y7b7KyoUrGKp5UqfLjVmoA8tWzzDUHXWsvF+6CsgEma7TdwuWDD/RAbKYehVJnCJzUJAdiCIvJvunBorxW+nsZ1r9pUzegRiKW0DAaTer2OUFVYgN66s07ilIOpS1SDgTz+HzNmM4sguML3levHDNPrftEfScjx0eQCPaQPPICF25PF/BHubsbrumMrDS/ksk+aqpS0VXfhqqFWKNTlgOG8nNPce797Mqs8MMHnVebed3bO4qLvcJl/yjJarx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6ZVvdHpKOBQ0B2guTFtvy5s9m0PX1YMTarGqu6D8AQ=;
 b=SdOfxe7afJt4NW2aCtJVsIRdK+cckQ4K3jCS7zRwuBihYbTOCIsVk9SsxvqXo58svCFrTv/5hs4z4G0J1flQ8K6FSTpPigYJwm1jY/yZDmNWBy1riFUOckYozzvP5rRu+mhPgm28RoqL/jI6YN1A6HLsX8l5z/aRnAsXDSgEa9xGzktMMlB0SthL9FMykS1cxNLfOTHHlJYGljq7L5nlVKYwwXMZddzVCcIFEZ1fbOBsUMR2Tv4YK10C+EoCGV64dg3RH3SkQsjpLBd4UlndKiAV7AZc4yUBTRuItbDfqQs5wfymU32WpW6s3FPuwiPb/X2FpjK6CBPvasFZJuCvXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <850a3be8-0e84-3bb3-150b-42a6a3a0c7ef@suse.com>
Date: Fri, 10 Dec 2021 10:44:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Ping: [PATCH 2/3] EFI: constify EFI_LOADED_IMAGE * function
 parameters
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
 <d9664972-b0b8-605c-403d-4e2340442cae@suse.com>
In-Reply-To: <d9664972-b0b8-605c-403d-4e2340442cae@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24ca0db1-571f-4db9-228a-08d9bbc1a9fb
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51660D8523F8DF237DF675C5B3719@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iaVzgZcCQuHsbnuOIbVSgUHQovlmsy1N9bkoDWRkEMbQIQohXxVJnMZHnGSvQazwvX9XUsfHfGOu0OSRtq8qakcIAwHT9I/91rcNwpiICjDM/ZIB80sOgWIt4C7TEserIh/v7frolxCJDdQuE6MW73+HtAVl2PgTaKVmZeshYl8bMitjdDj+ylDUCXQBvRhuUK/mcZPAZLUrJZTVPrPf8HiVCzT7/VL5/Ex7MZPFSondnDzZ14omLR0e1WG4bndjjr3lhFDkqRV7bJ+6dza53ilV2xw/bLAO0BFsiWaqbgly8mdCH8o8EvYoeYAYW8ddhkYrGwuw2osUo+bx7ncNXVrdLWbcVcGfr1mwHUMnJ0oJ1J3+y+ieBJGeh9IYpS1d4x2jKoaUraptI3fKtISvpImhXtM6f5HXdqiBo+JG6diJ0yJYf+bA3UgQL5cuplVIlRGBM8hDW3cFyWu3o9qQR7gnMe/UCPij8l1fl0F4Aic6J5RRBSYYjUkU3jm+mKsWVGPcQCe2v4MmMIv3KXRwbwJa495+HQf3TO52WSDkOdXW5ieyGNPPjsx4jkB1tBxgFljyetPr9N0rqLgZ/9Jw2atGMUtFHTR8P+ClBSZTlg9YNWQy6y1ecruvOiwjLRCmyzrrgYx37HFN3WApOwZ4U0VfTkFCOaAADK+bYOGGW+XoHsxZF5mh58qdLYYURYicKYAo87oIj94rNtLOK2GvDZSI2pDEVytYtJrlWlffri4A7YVlQ+PH2mLXScgMzBXu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(31686004)(5660300002)(66946007)(4326008)(508600001)(38100700002)(66476007)(6486002)(86362001)(956004)(2616005)(53546011)(54906003)(110136005)(186003)(83380400001)(31696002)(316002)(16576012)(4744005)(26005)(2906002)(8676002)(36756003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFFLZnY1eEQzK0lwT0FmMmdnRkFLL3k1bVRRKzRoMDA2akJKaElDem1pN0dy?=
 =?utf-8?B?QmVHajRnUFlWTXQvbDV5TmI3YlhNM0tMSDJndzBaTHhWTFFpY214S3RibmVa?=
 =?utf-8?B?ZWxOcXBBSW1xKzNjVmNpR2xjNVp5ZXQwK2hydVFkWkZSWUhlRDFqbFBEZmIv?=
 =?utf-8?B?TFV6VXFyamFvWWZpWkgyNkVIRGYyUlRvdUdpanRxUGJqd2RXNEh1ZE8zT2xE?=
 =?utf-8?B?eFRBUmdwSjMxNzl3cjRwU255RXFuZUVDcXE1OVp1dTNDVUJJdU50alhHOUND?=
 =?utf-8?B?Y250WE1qak05ZHJObkM3MUEvdkNRKzhUWWNKZzYrOURZWWUvdnJCYy85TFdY?=
 =?utf-8?B?UjZPdlFkVmdnRWI1bEdtR2I4VmhnemFVbnBMSkk2akpROEUxQ1ByODNhenVi?=
 =?utf-8?B?ejlVb0JQL1RrZm5qeEt6M3Y5R3JsV21iUWxYSXF2ZlBDVVFNSmNpeWlkckxp?=
 =?utf-8?B?NTQ2MHdWWERCR0hJTW9MMlFzMitLUmxyQjZQUmx4dFU2eDlyQlh1Wlg1UFhS?=
 =?utf-8?B?K3d5dWpxUTVKSit5Qlk2UC9hWnB0Yk9YVGRWejNNcmk0WDZtdGVKQVlsQkda?=
 =?utf-8?B?Mzd5ajVJTjMwZHpQKys2K3dvcVdrdHVhVSt2NUNabmN4RFdPaWsyTzQwZk9U?=
 =?utf-8?B?MnNuYzYyNDhpM2R4RWwrYVZnZUpBS2FFTk5vYU5STG5mSXJaTDZlUkNhWXF2?=
 =?utf-8?B?SHFycDY0dEplWGRJell6dG13RlhMMFpOVHhGdDhRb0IzaTBtWUU1UGVzM2oy?=
 =?utf-8?B?T2pxOEJ6TjcyalhINHpjS2xYTkVSVWJ3TXMzL2E5SUhuYlZhWlo2WDRwbmp2?=
 =?utf-8?B?TUV3RDlJV0J5dGhTYk56Tm9VbE0zZXhUb1A5Y2hMejNLeWhBU1orWStxVHhu?=
 =?utf-8?B?QXVsQkxVR2Y5cXpZN3pVS3hPc045UzM5Q2poeHoreG9XRE5MbE8xcmtnWWpx?=
 =?utf-8?B?aVRqdUtXZUFtZnN1SjkvL0tCM012c0ZqSUE4cTg1enhuRi92eURmSHZCODJi?=
 =?utf-8?B?N1hycGhiaFNVbkhNTUZpYjJ5UEttT05IbzhPVFdLUldLcGdGSXpSS0pGajFP?=
 =?utf-8?B?UTBkR1NIR2MzcUZhTUplNnpsdHkwcEJnd1J4Mi9iQkkxK1FLaFdVejhGN3py?=
 =?utf-8?B?TUZMWjJKbUNDZnM0VUdmT0Fka2VNZXpDNDdPUUkrY3I4YmpYRDRHR3AwSDFr?=
 =?utf-8?B?dkl4S2VoVjZqTEhNSmF1S1QyN0ZyMkdDN25SWmVXUkNBWE5tSGF1MUYxeTly?=
 =?utf-8?B?Mm5qR1Y0bG9rT00ydFdaUlJyUUhnbWdQN3dxY1NoeUdncGx5azNyc0V2N1hn?=
 =?utf-8?B?RHpscE1DRU45WnJZOHNnaUxSQWpvMEVZNjVHbExuTG1BcHRZRmNrQ1VsZ24y?=
 =?utf-8?B?aTZvMDNZQ2dEQk9STHcrQWpYazk4alg3dE5xbFpyVWdCckNwRWkrdC9NRmha?=
 =?utf-8?B?SmJ3b3JhbVZNeURKS2V0MkRVbHRuL2l6K0poazN2QmxDd0ZhUHovN1Z1b0Uv?=
 =?utf-8?B?Ry9YTEUvTlI4ZXN3T0hwSUs4SW82a0syVnZjTHJ2SW5FSjc2aERCSDdTZHFs?=
 =?utf-8?B?V3YyNHI3NlpIOVVmeUl6YWtqYW9SZFpLZjAvTVhubFZFOFFmam0rUmxIei9C?=
 =?utf-8?B?MEYrYkFkd0tOemtDMGNBMlQ0dmJaMVgvRXBiNkZFaHpPeG5WTWh3c20xbDUw?=
 =?utf-8?B?YjQ0RGxiT0l3R2NPNWpueDhQU2t4bFRNa00zMUl5MzZGOEFRajcwQzJzWXFG?=
 =?utf-8?B?WlJLSEN4b01vaWJBZU94bnZtVS9xWFB3aGxOV01xT1ovVGpGL0U3VGpPaFAw?=
 =?utf-8?B?eWl3cE5sTjFERk1TR0hjbW1VSUZkZ0NkY2MzV1l2bFFWalhpL3h5Q01mNmJk?=
 =?utf-8?B?bGFIbjVHTml2R0EvSlRuaG84eDJobVJZY28xN3pLTWM5TzFTcWYyOHZkbHNB?=
 =?utf-8?B?QVdlMTQ4ZnNiT1dqWlc1YnBONStuSlRtRGRscDhOMnpHRmltMFZMWTRQdm9w?=
 =?utf-8?B?UVlpMm5icjQ3VWhBQlVTYVp0L0MxSU1oOTBQNVhreHJCTzdJS2Q1UGUzL2pL?=
 =?utf-8?B?TXJoSFNjVTFFUmVaTXV6SXNUWEowemxSU3lJcnFNTkFhUG05ZUc2SXA4cWRa?=
 =?utf-8?B?Q25tanRab2MvdUwwQ1MxaThuMTNldUVsbTRBQ0d6QVhxNFZZdWpRbDdIWGtj?=
 =?utf-8?Q?EbxzHYX8iWRv7I7T5skFPzg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ca0db1-571f-4db9-228a-08d9bbc1a9fb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 09:44:30.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9CtYlMYH6OyPks0fulcVC0I5tjD8GhuzlwT318quzInt/B6kGZt2ugG6pEmHy8YeFmXMdgBYy5OTm9H/I7JdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166

On 03.12.2021 11:57, Jan Beulich wrote:
> Instead of altering Arm's forward declarations, drop them. Like
> elsewhere we should limit such to cases where the first use lives ahead
> of the definition.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

May I please ask for an Arm side ack (or otherwise) here?

Jan


