Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE124BDA2A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 15:18:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276281.472400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM9WF-0004zt-MQ; Mon, 21 Feb 2022 14:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276281.472400; Mon, 21 Feb 2022 14:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM9WF-0004xc-IB; Mon, 21 Feb 2022 14:18:27 +0000
Received: by outflank-mailman (input) for mailman id 276281;
 Mon, 21 Feb 2022 14:18:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nM9WE-0004xV-Eo
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 14:18:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21eea363-9321-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 15:18:25 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-0XG_9FroO0eAlQN-FlefXw-1; Mon, 21 Feb 2022 15:18:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Mon, 21 Feb
 2022 14:18:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 14:18:22 +0000
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
X-Inumbo-ID: 21eea363-9321-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645453105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XYRP3BhV7zvkGGTmEbeaVC0JEmiUIRVhHZ+PkCd1HWw=;
	b=Z0NDFxlpgCRKfOerK5/9WmEpKgzJr8VXuzZUKd97dVuk4aG7h87veDIUTVW6wiKcz/mEZq
	1rj5gqqc83OEtVCLnVJit7Ayfy6WneRHxfIpEsUBMZRCkq23sF9IDOYjJ7Sag69FMho9Rt
	kczpnNvwlw1KvMSAUYEXbmkkHO2rfVI=
X-MC-Unique: 0XG_9FroO0eAlQN-FlefXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJx2KEPCFKjWtPLK3WeDv/uyQuHWxNhUZ1jPbs01HHV7rLTJbwHpaD2NexYdNXUi9YjUbGX1iYOeSqhzW8rYvXwf9p6R/TEube345WiUkV2E4nuXuMjRpcop31zGRm26zDmN7gBusl7CATPG14PXwk215VWoUOXZe1pe5ukIHWSQqjCcTKhCEcZxxwO88SUTvd+x5ZAy0CMEsJ+/YXibZM+H8ivykVcFYbvkYKBsQ6I3h7Jn+Nlbr7cP3whmC99vaWDKWrtrExqmvfDHpMy/3SRmmQEwISDbltyi0vAqqFcBUihBCgrrdlm2G0BsYWJ4eZntrE+hM99BY+TKVjvyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYRP3BhV7zvkGGTmEbeaVC0JEmiUIRVhHZ+PkCd1HWw=;
 b=QVcTMQEl6EBnvGZhIbquMt4uD3kaVDMEFS2BrILjg6se70T3Tf4ZzCfQT6LItBsVA1LgPi8PNk6ZX+8zqMGXsza/CHd5B1jJSDnTT749gyX/z+W6c9DA5cEWj4GhktOLIzNygEVQeFv410RffluMwchaoU9mV+j+PqCEp7y8uVRVHsgTQVHRwCJgrOcP26y3yh94EnDUuYFSKTydwBEDP46C3snbC1A8ZwTlsyAgKH6g7W8YpCd6Lw+HNBxCxVtMEMenOzA/5kimFC8d9xQMNZr8UdVadubXSJAeS+wnmJKlk8tthKDnbXsyNkDJNOOfEnSb6gV4bIBH8yhi16L3dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
Date: Mon, 21 Feb 2022 15:18:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/include/public: add macro for invalid grant reference
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220221124221.10245-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220221124221.10245-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0070.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d71abce7-0e7d-4c37-bd45-08d9f545042e
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7152A83FE0864DF911C4914FB33A9@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ar6/BA9CLK7ikJmyTrqLzSrKFCV97AYNxe5w3CIIxQ08MsRUeCfk2nY8nGGe2JcgoBLod9OXdDkoLn53uYqCBuOPDAAUo1tsbGzDaYFJUrBY/ztxThxwg+vozNipDYwvuu47e8x5apMZ+9KQcVvp4atJufbER27qruXka9klAM5a1x9vY0yRYqypSgjUe3BQZn0ueV5EbYOTanv4RbSIJBYm/9soEYaMd7ZMQkFqq/d2AVj0YgRfsS0A0vBdvELNx56+SZplXWr8gLIUegigWFdXrIQnRKyt93X17o8C8Px+4AyG6heDoGLvbKDQp6eU3+7YmHNaKg1g983k56cZJKrW2ChI+Uo+mptsfytyFHCaDl+UYBy25w/9isBNF65cGnh4j+bG3GoWm6+gAuLJl1ih4Vpb8InYNBBiLvHk91Vf4Tsu67MW9tI0LtcKalnzx9RVrHEp2lEWLtG2f4g9STrWPtjP7LjHYOk7BKUjxGVu4oNJ0JqKzecb+jycpctpH44cG+Dss0Toi4+qVwYZ61QYBfJMugxM5Eyczmg84B3kEMBrpIYsyDnrn9Srib64RaGfu9TFRrCYiFY0XpF3IYfxHD5UJZdWzJWK59VikEXxOZDkG8d2CJYke0XQbStnd/o/zCVeG0+qkMC0mJJYdGwvmWjJR2agIN3+Wb9vtoIKj10SkDVKTGB6UjIAawjQXo5rALPUYhjJz9DubpJh0F4DCvQJwssMf7Z9ezKx89Js5SYxufF7x5sWoLPK1BjX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(86362001)(2906002)(53546011)(186003)(26005)(31686004)(36756003)(38100700002)(66476007)(8676002)(66946007)(316002)(508600001)(54906003)(6636002)(37006003)(4326008)(6862004)(6486002)(66556008)(6512007)(31696002)(8936002)(4744005)(2616005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlUwcU5NUWNocU4xYlVSbFFna1V4LzJvQldwNXJwMFZ6U0R6N0h0a3FTUitV?=
 =?utf-8?B?RmlVTko5VzFiNGdYTXMzeWFIZmlVT3krVDJ3b2lJbUdkanhDY3EwNjEvNjFI?=
 =?utf-8?B?RzlBdDdEVEdGNWVOY2hLQ2FubFk4OG9nWEZqSGY1a2c1MS9BY3Z5Nk5kZ2Ew?=
 =?utf-8?B?dGVrYXdoamhsN0JrOXM5SkNlTWpwL2JoNHI0dEd3NEZvUTJJZkhtRUlpUzNE?=
 =?utf-8?B?akp2aC9ocFp3M2ltTDh3RlFKbHpQRWR2aUZ1TUdTSkIvM0tYM2ZOYVYyNGFL?=
 =?utf-8?B?YzhWME1JUVB0bkxlMHptdjd2NVFHeVNieHBaWGVlbHVzcGNOSFljYmVDTGpk?=
 =?utf-8?B?cVhTbnVPc3ZjeFRqQUNmNWdRQ2U2UDk4QXdMYzN1dDFreVVLcHhlR2h5UFFS?=
 =?utf-8?B?ODI5OFZ1SG1ydzdWdXZZRldTOC9Ybk8zdW1NWEp4a2FnQjVlWldXV1FhNWxk?=
 =?utf-8?B?TmlxMkdFM05DQXpoODZBUDJ5aUdvb2drNXg3WEVKSlZvNHpkYmFLS0pRWmtq?=
 =?utf-8?B?RHF5VC81eTB2Yi9wdkNFZjZzL2FvLzhJdGkwNmRHUHNOZHdGSXVhdkpVTG52?=
 =?utf-8?B?cnpTYVFUVG9xK1dkQUVFb0NuZ0ZZRzVzZDFJM3hYNkVOYW5Ja0d0MzYrR2dG?=
 =?utf-8?B?SFVGaUlMTUNOZVZpK3h6Kzd6UTlYd3YweXVmMVpTVGZDSjlnZjhrdW5TNUtN?=
 =?utf-8?B?QkFqY2xsTnl2OEJYMWs2ekZyazRrRTBVRzIxRSszc3JUOGJYZE9tVjI3enVJ?=
 =?utf-8?B?Z205N2d5NDJXVGtFWUxOdjU3Wi9vMmFwSWV2USt1MDh3NDhyQzRKNHlFTEdV?=
 =?utf-8?B?MXRBei9OaUlweFBQTEtpRWV5d1BnQjlmZElUVXBYajloTGNDTkYwRlJEUGRN?=
 =?utf-8?B?V3VJNGxxTytCUDk3eVZxdExraVVuRFZheWVwaWJGRUYvdytTa0RMZTJVRmVY?=
 =?utf-8?B?SnZ0ZGdzenVJdTZSTk5ZUCtrei9iRzNSRm1pblg3cStJWk5NRUhQTmRBT0NT?=
 =?utf-8?B?Y1ByelNDUVhVYjJWcWtGL1V0R1hoTmZtS3o5SXZreVZpN2VHQ2FVei9vZEZE?=
 =?utf-8?B?SkJqMEZwRzg2UmlTVEpPcVFURjAyMndqT2IzT3YweFNSdHNXcnAxNjR0TE9k?=
 =?utf-8?B?aG0wajdqWWYrZXBBZUYya0RYZll0ZUJFejdkalhMN1FxeWxJc0x6dFlidlFR?=
 =?utf-8?B?bC8yTExPK0RoZFIwd0x1RlZKcnN2NEx3NDVNNnU5SVJZOHZDMHVWOG01Qk5p?=
 =?utf-8?B?bmtCRENOYmQ1OFZIQm1pSUdsdHlhdzNCUmxmTy8zdG5wT2g3SElJT2s2K1hq?=
 =?utf-8?B?S2w0TGJtZEVFUTduVVlWWFRTTmI5dkQ0M0ZqYnMzSWIrYlFuQU1lckhJVk1L?=
 =?utf-8?B?amswdENwN1dMTnhXV1BNWG1SRzdKSWFCODFLeDA1N3hDQ2ZFbHp4ZFBFekQ3?=
 =?utf-8?B?UWh2M2Q2ZkxZaEFCdVd3WmxUei9uUFFMakpWenVNdCtLVjZ4TEJZNkx5UzFG?=
 =?utf-8?B?WUJjWHhSWXI5b2JFeVZiQ1JIcm9QaTRLL3dQU3FJYkIwK1B3dEU2akhlZGNj?=
 =?utf-8?B?M0VjcHdhdlU5RDdBbWt6L2F0aU85YmU0SUZZc0xXM2NBRGtQTGVSUzB2SzZ3?=
 =?utf-8?B?cUdiTXFpRmpFcVU0MytEWW5UU1YwS2RYNmFRVjR5dG1SdlpoQ1dLeUFITTBP?=
 =?utf-8?B?Q1ZQR2E3WjJBS0JjVUFNVFhsZWcyVmtNRTRFdldTektGbVVDOWpYRnc2VlFy?=
 =?utf-8?B?WFNzM3dhb3o3NDVuVjBBUTdBalcvMDM5ZVFtQitDUlhDYWxZMmd6eExxRjdR?=
 =?utf-8?B?SUxVR0JVdm9zU0V3T1BXYlBiRmtxamp2cFg1MmFqVnFHck0zQlpLZWh3dXNu?=
 =?utf-8?B?WjYyOUQvVTJEWDdGeTNBbVRVL21qMmprS1NoNTFSbVRLbVVSVXd3N21lUjlW?=
 =?utf-8?B?MGtiNnZFb1ZKT29ob0cveGhOMTdLS2UxNTVHbW9HcU5JYVJuL3JyTFhHY3Bz?=
 =?utf-8?B?L2JkWThjVzBDalEvU29wY3lhdXdTN1ZnZTUrcVI4VVpKMG5BRDB1Uk1pUFBC?=
 =?utf-8?B?eWFvRlNzRlhlRHUvTmR3OEhDNTRRTHFJeEVoc0ZYY3F4K2xsSllXZDYwZ1lB?=
 =?utf-8?B?U1NYV1hnRWdyT056OWM5ckw4enQ3enc2QmgzZ1NOMzBIVGlMa1l1M0x3ZC9m?=
 =?utf-8?Q?b/NaGL2nXaA6/WtiBWV82mg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d71abce7-0e7d-4c37-bd45-08d9f545042e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 14:18:22.3231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G30+qytcccohb3/9R0fu7nQ67Gtlnr8wZtEN7gaR2Hkztjn8q80/lBrH0jw/wVopJZNCGVdwlg6PpJ1RaY/+tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 21.02.2022 13:42, Juergen Gross wrote:
> Providing a macro for an invalid grant reference would be beneficial
> for users, especially as some are using the wrong value "0" for that
> purpose.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Over the years I've been considering to add such to the public
interface, perhaps even more than once. But I'm afraid it's not that
easy. In principle 0xffffffff (which btw isn't necessarily ~0u) could
be a valid ref. It is really internal agreement by users of the
interface to set for themselves that they're not ever going to make
a valid grant behind that reference.

Jan


