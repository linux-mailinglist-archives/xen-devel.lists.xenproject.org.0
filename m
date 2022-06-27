Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EAA55B9E2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356686.584991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5oku-0005Ug-Jp; Mon, 27 Jun 2022 13:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356686.584991; Mon, 27 Jun 2022 13:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5oku-0005SJ-Gk; Mon, 27 Jun 2022 13:26:20 +0000
Received: by outflank-mailman (input) for mailman id 356686;
 Mon, 27 Jun 2022 13:26:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5okt-0005S7-1x
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:26:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80047.outbound.protection.outlook.com [40.107.8.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b73ca4c9-f61c-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 15:26:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (20.179.234.89) by
 PAXPR04MB8639.eurprd04.prod.outlook.com (10.141.86.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Mon, 27 Jun 2022 13:26:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:26:16 +0000
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
X-Inumbo-ID: b73ca4c9-f61c-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBtRCrFrTLReRy/hXwbcMCuJxK0MKBDVzYIGGyiXHvpi9UOMPGZpmL66SyRPcF2CnIuiCMhus//4yz+gyxqZjFlKflqvLWj7Ws1i8/BLulYKabnMeMOp4ycvNYhb24/RBKNpdM8HdurMtRt/Opg6GSUulrxHMX2UcIIKQp+ipBB6VaT0pOsonTjh5u8od3pJZMLY66oy4Xxl3d7h75FMOmYA7e9e7y/RPZIUdsMwrGOuS+kzR0RTMIY5x8w0DS0/9fj16FV+ZYQGAb3x9Jgty865aVPyaTWtO47Sq71lxtS2i4X1TMkcviJXYQn+nmmumk5QEx0WY8nYGEYz9xVXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ezhv0zzQ1+MrV7DdGElOA2lWszu1wIz+Y/fSWeyX8M=;
 b=oGN+LUpu42qP3kxzgQ0bzomYMaHFRdMdIx4ZaeFZdK/CeFAX3kC408RmnZYEMrlCWI1TucpbdJY4rdHdiQMCw9NIPtCk58YvDBVUYTzlG9PzFPjdi6mmImUfaeCsNK2Ei4UgYGyWzzITaDNf4Q3oWpl+D1/QVPJkJQY7ViRokKbh9BF0oOmNUfOGCfHVAuNFnyVvRMzWdv/xiXa3ODArpqPbzuOezoxG8iM8ufZgaYqTrgBG120CoDj015kB+GqtgTu7U8O3qKk1eRv6ShLbQlkTli1XIBxLcJqih/AQdEAnWAr7OSWUin7M0Nlq6wKdsJSyHEAMB9sVyoJ1EMVWbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ezhv0zzQ1+MrV7DdGElOA2lWszu1wIz+Y/fSWeyX8M=;
 b=XTa4n4hVyhO3Bu/R8CFJEbv9Blcx1sItywvFBLKJo9JnAqrLZ5QgujMNKX+CMTR9ofmp3p+QK55uSlq4TFsgdPFQZ/J/dy2yg30aWqqhWbf7BJrzOw0LI7AvBMpyFPMHl9nxqBHkItDpjmBv1+Vk+HjVz0qRyj43sJVJZGQOoSSGSF5gZlUZRnik6fxSE1cyKQyWDJLlKuUiGXgGRTAAUsSufHnLk8wziM70RGT3EtWXcSbNZTdkWcd3DksPBqypKWOTJXA1bK5ctjDSnOt7UZmUj0NL2HwvpC/pDHUI2xAmyt4reKmiNg+/GlYi5rc4wI3hBWXsGf2QgH2kCU9gCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d71eda4-8695-83fd-d729-5c28070c1539@suse.com>
Date: Mon, 27 Jun 2022 15:26:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/7] xsm/flask: Use unsigned int instead of plain unsigned
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20220627131543.410971-1-michal.orzel@arm.com>
 <20220627131543.410971-7-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220627131543.410971-7-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:532::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ee6ac6d-50a5-4f11-140c-08da58409d2b
X-MS-TrafficTypeDiagnostic: PAXPR04MB8639:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mUXAAC3EVsIGXh2YuGuMGBrAoX2ir+COmPJJSX+NTGSUd2zb32s3eGyHTY7b8g6OtoW/xNOQ11upyzlrHpyWEN665HcF9N8MUDYpbj7dsXjEBedR9pAy/juJHp8F8ZVXMtSib+wBtQYf9vA+TWk5Grc2LXjy5UFvfCEjM011W8hEHCY7YLgJorqnENtmiUf7VkG5Vd3XOdCK3JPBZ9cOjn1PKxfHepVkMt6/hWnx7BlQY74Pa6iodjgkQ+zlLXozYhZpPfPJkCAIBIJn6XKbskFWVzsld2xxlITz/xEi/KjuahG82pYdfDTF8/W3dx1LEmaLvRYFf8DM/zgF2OyULuNI3QL/HBXi19LqrOeTEDURis+8DF4k2FnJ0Ts0mVbgwDTIwesRUwpfhf2hoKmmr/eQLLnqZI5dw+4H+L0lQWyLZcRX2CwMr4zkBozktpYT4T/gSd6CzGcC3ESf+x9f2+zHsI7lPCDKs3inyiajKTvFTE/GS42Nm0IQvizlEu12/NvnlYQWj/33rOIlEpAFfMifP/e1MOl2KhbmpXgjKsiKjmMCplvdke8nIfIlg9MsiilKd3c3RmYsU6bWe+ESi3so7hQuCSb4VuT6QkFv9NUOE8GNLH0E7XPhJhNP41TDXUCHgXBjDkPhST7eI1GGNvX+5FZxe2aET5SVA2n859yAcuWqH4v2vvodF7ihYZRJhFasliB+XOB8Kq7uvX6B0OpU2Xw+CED403NUfFvVZ0xHTa98v47jLL8Sm9S80Aa/aZpQl1Cnvle8vpScEe85VIzceeXIK2lwADdmJwUKzu8O6ljqiHHjlOgk0zj3HA5udNSYbMTcpH5RXzegTlsrSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(396003)(39860400002)(376002)(366004)(86362001)(36756003)(478600001)(6506007)(186003)(41300700001)(26005)(558084003)(6512007)(31696002)(5660300002)(4326008)(8936002)(54906003)(53546011)(2616005)(316002)(2906002)(6916009)(31686004)(66476007)(38100700002)(66556008)(66946007)(8676002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Snk5R0Vlc1Y4MXJlVndFYXRzTnVaNHZ1MmVVVGV6dW5xMXFtTTFjaS9vYUdE?=
 =?utf-8?B?S0NobndSWm1KemY4UDVwYXNuOGdKdmlsN2RFcC9XTjlQRHZiMXdYQVpHQkY4?=
 =?utf-8?B?RkRoQ044SHo5alRvVkRuVmFkWGMyZ1RITVBZaExuS1JEa2tqLys5YVB3ZE1x?=
 =?utf-8?B?U0Z3RGV2LzltaHRDVXhwbnBVY0NyY3Y3ZDB5TzVUT2pzakxqdllMN2N1TUdo?=
 =?utf-8?B?STJnTG9XWmY4a05mbXp1QTc4dTZER1huNUo4Q014WUs4K0pzVDlDZnZXdlA0?=
 =?utf-8?B?cjRjWnZocy9rV0ZiS0J4MWlvSHF3NlcyY0NiNytaZ2pJS3JVME9udEMxUGg0?=
 =?utf-8?B?VHVrTlJoWCt3dEozRnBvUi9jcnlWYVFGdmpQUlJ5dkNnWlZ2OU5wWlFJMEgz?=
 =?utf-8?B?OU1jMW1uN1JybmFpQm9WZi9ZNE1LV04xSUVnRVhzdTNrN2FxNnNTMzZQajVW?=
 =?utf-8?B?dUNsbHhaUHBMUkQ0NGkwbUp2elM2T3pxR25iS3lybGt4QVU1SUREeFl1eWo3?=
 =?utf-8?B?R0VKRGs4RkkrUzRTODZha1VrTHNMQUc4WWE2bDVjSmdEQnNyTG0wUzJuL29h?=
 =?utf-8?B?TTlLKzBNU3UxQ0VhUE9DUTRXZFg0UVU4MkVuWGFTUzBZWEY4dkJVWVZKS1Zu?=
 =?utf-8?B?OFAxS09sczRiSnRxamZFSEsreEdJTTVvZnE0WlJvWG1YZW9SaVdjVFVlUnAy?=
 =?utf-8?B?b0VuSndNSmtHYVlScVoyU3NDQWFqNDFBYzJNOVN5VnhLb1lXa1RiVU15RFN5?=
 =?utf-8?B?OHNlWldyT05ObGlzOUNkSytmbnE4dVZNSFdERmpKL2xJNzFBVjlMZlFmeE0w?=
 =?utf-8?B?YXlLK3pESGJtT2J0N1cwTldmVUFodHY5aXIzakFsY2JaS0g5UUJpemxVS2JK?=
 =?utf-8?B?clBmaWVIR0ZkbE01OTI0bFVJQ0RlVFhxUTBIVExtRDhsd21xTVRqeG9EQ29B?=
 =?utf-8?B?eGVBalpwSEJsUElhbEVoNy9KUWtSelFJOGQwQlhDSlQ5K2ZUSDZrYXRiRHRI?=
 =?utf-8?B?dmhiK2VEUndYcVlpMW55cDBZcUR1YkRORzFMRkVHaHZpcXlQNlRSclFxREZv?=
 =?utf-8?B?MGI2c2xldFNIRWpDTCtwRmpOMUFzVWtZWlNIQXRUanNpd3RnUmVZSHJKTGtR?=
 =?utf-8?B?a2M5d2U1dWY2anppanF3VjNaZ00vOFNnYTB6NFZpb0xuSXVNd3ROQnYvK0xT?=
 =?utf-8?B?NTRIRDFzME9WU1hDR3FNMm1BMDVSUlhPK3hrWXNOeDlmNXhQRzFIbi9oNU04?=
 =?utf-8?B?aXpnL2JUbEJXdVZYVU0xck0zekhhZU5XM05pZVBlaTllbklIdmRnN09KUFFG?=
 =?utf-8?B?NmpEb3YxN0NwdXROMis3LzhCcjNZMHY1TnpZZjE3aGx2WGNpbzRWbWVCS1p0?=
 =?utf-8?B?S2I3QUt6ZHJuTWI1a250YytPV2ZaWVlHSWRTTktUTzhpUllQUUN5VEgzK2R3?=
 =?utf-8?B?eVQyVk9HM2pZL3JrQld6Y1l6cFlobFVxUGZOa1JBNC8rQnVyR2FtbFBOWGFl?=
 =?utf-8?B?aFBMeVRKcjlzZTJGTG9NOXh0MTk5WXV3N25ja0l3TTViUkIyV3BIQ1JoV25C?=
 =?utf-8?B?T0REOGU1S2YxbmdaeDloRm8xZHQwczhNZi9LU1Rrc3BXMm0zZGpIZmQ4Q2Rq?=
 =?utf-8?B?aVFOZE1jSzZPc0ZOV2M4a0NJSXJGQkQ3MG9td1E2RmlqNTFRR3ZQelI0L1cz?=
 =?utf-8?B?U0haWUpKdUJ5aTA4MHVxeUF0ZHpUYUtWRzQ5WXduL1JxVmJMb21NOXU2M3BY?=
 =?utf-8?B?dENSSlFiY0dMcy9CeC9CMFgrZmFQTkpiaVdTVFEvWkRmbWlPTGxSdjZXR0tH?=
 =?utf-8?B?TmdieGNtUTdsWW1EWXkzUTJCbGs4VElLTWc5TkowbXYydTdaUHV6V2FWZ0dE?=
 =?utf-8?B?LzkrK0YxM2JoNkd4UFJWaGsrN2ZZMzFuVGhyOXJTamtSMXl3Z2owN0s1bEtG?=
 =?utf-8?B?aXJvc1NPMU9GWmxQZjhnZ3ZjTkh0ZmpOaTBNM05kdTZERDNUKzcxb2ZxTFYv?=
 =?utf-8?B?Vmh6UnVGcXE5RlltWUFoVExxYjR1R1VpUHFHb1l2UzV3RS8wWFNQdVFRNTNE?=
 =?utf-8?B?Wm1VWFp6OTFiZjZKaitndlA0VEJsUEV6U0NhOXE0eWNoNUU3bU8rNXg5RGFp?=
 =?utf-8?Q?YubwDtAoBnribTQGDm+Hp+1KK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee6ac6d-50a5-4f11-140c-08da58409d2b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:26:16.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJXo5fHH5Zm8d89FItvYlYrz/KsfF+jKcc0i80+A6Y/FBivqYtBYGPM1VrJHeCi9V/FOGeiLijY81b335BEBkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8639

On 27.06.2022 15:15, Michal Orzel wrote:
> This is just for the style and consistency reasons as the former is
> being used more often than the latter.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


