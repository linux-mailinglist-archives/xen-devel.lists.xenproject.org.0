Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF678464C42
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:00:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235871.409132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNLS-0004Ri-9F; Wed, 01 Dec 2021 11:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235871.409132; Wed, 01 Dec 2021 11:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNLS-0004OR-5g; Wed, 01 Dec 2021 11:00:14 +0000
Received: by outflank-mailman (input) for mailman id 235871;
 Wed, 01 Dec 2021 11:00:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msNLQ-0004OL-Jz
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:00:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e925466-5294-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 11:49:07 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-aNetI7jJOlKv47Am3j4Djw-1; Wed, 01 Dec 2021 12:00:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 11:00:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 11:00:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0006.eurprd06.prod.outlook.com (2603:10a6:20b:462::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 11:00:08 +0000
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
X-Inumbo-ID: 4e925466-5294-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638356411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Domd/tDjwr4GN/FZ5p50vnlB3Hho0A6+Sd4g1UWyLvU=;
	b=B1wNNhfsOxLstAwjUq07Z+8OJbskPAcdH/YMk2LaAZfT+40104YJ2WqCPfSWbd1zLjUFZt
	+OtKXQCr3B0wRq3ErYTs9RlEfj70IJ/ewkUavkYgs67uBBET0L3Y4qPQLGgKFKzw8x4GRZ
	htDsByCQp3HNtF5gssyuMUr/qBMfhPY=
X-MC-Unique: aNetI7jJOlKv47Am3j4Djw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3oFWTqMzIwIB3hmCZJjNP1SiPNVIEs0eZx+PzI2teYIpOl8yOL9kT7+pcHAt/Gm432f0SkD+te7xSvf34iVoHiF/jL0NWvW4H8w6Aq5w0ktW2d6Ge7oUQnsQEiU1+HQVPtiDMX2nSt+6hiaYqn6DWbiS4Gfv4UV5ZyVff/WOqgxPEMsdnIf532jyzRQOUwtOf8WfbsTCZ6TPCzkpVUS6K3vMNl54Mo/KMGabC3Fh6E/tzC1vIY8oJ7JJ6HdWJKNSUHJDy8c1MNUtHriM/hqOxAViZd7d7uKRRSUQhLdjSRJLAaehF6FsvRHPEQoVs3ynQcDFhKdxn8PKlUh2Iallw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Domd/tDjwr4GN/FZ5p50vnlB3Hho0A6+Sd4g1UWyLvU=;
 b=SNMpbdgivM4XM3hJXVjFhquFUqyF5lm6oenv81H80N3U/80G82qPQLHjmeyxRRi/DR+CtJ+NuJoHl3XTXK9P3bbKp3spUMp7S1Wb7fHUpcwLql0iZgOpB3Q0v/aeSExJxBoBCQqLO09XEWqjhZv3Zism+Fs4fGT3EX7MHsTx4VIiMILhRIpt5tjoOLxMGKo5FiURu3SQlsCaEc56Ez6+XWAeBhytk6k29cz8HN7w0F94Edmbw/OYmL0064zmyyTfl6XiM8mhE4rkbuxYU6yQ5buh+2t8FRUMq+7nvjBiYs4FtyrYmXtp0paAHCvPh00hfX+E93bxekf2szQkj0uq6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
Date: Wed, 1 Dec 2021 12:00:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/mm: XSA-389 follow-up
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0006.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c9e0ef3-a78c-48ad-01dd-08d9b4b9bd64
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5743DF1EC09105B3EB6E5AA9B3689@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3n5hdaYwKhvlC0SDxP6bZYOUX6uDvMYp5jBfOUP6ZIENupTu7NH1/jJ20AB3uVys7ECneUqiNpl5Vn26W/aHVDJ/EbHlyHA32kRFEwWpjaZLg1lzTpy0cu6bzCbEwzLk/jKveoV6xJpyfUGmEq+Ggp0QHlZmBRnpOAQkMcMlDdfMR82AaFc+Yy++az5jC2TS5XObNaiq0BYJqrYkVK9FqL+rwjnBAIeVvH5yKo9PSqQQSvzKR/rvhNkgcSXs8xApKRDrfBb/MhPa8OC+lvSZzapxbhNxbAvfYFPcMQeIZo0diR4jmZ8Q0c3k4zs7LFR2JErDMgn8f7cGPf2Ev6lLVLL1BAAUQyWDLM9aajf/vGr6KGBKdS4f8sZSHCui1TbPMpZNM+4PLOlt7x/7Z7n9HffUYs4Lb97PXze7oGBeLIoaU03079/QH81A3x9JgAfHlrWXkoaiVvlocMxfu2dKEM4j7Z6ERFUi21TmsB4RZOzEIKb7EmDjKeobbSX1Ahp1o3+Hlsw9TUgyx6JxBXcvAbeJ3o91331f5WFYj+9+BFkqX9Zs5GXAxNvIgL/trYUtiKrVlQIcFdyJYIDM4zHly4FcIo5iiDstmSng7pIBdOwiehya2o2lFY1GNMGqqUCzIziY+Ib1ezZ8xIVQbPWxV9gt2XDeDP2kajpAbBnhOxzEIVhYhd3ckrPsv4vFIycDDuhdPCX3pzDgS2MAEmlznxL9OsbUukR0H4hByWT3HJCwEJhyWNJMrWTU/7iiVbxx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(8936002)(16576012)(316002)(36756003)(6916009)(31686004)(66476007)(66946007)(38100700002)(31696002)(5660300002)(2616005)(956004)(54906003)(6486002)(186003)(86362001)(26005)(508600001)(4326008)(8676002)(558084003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWNPSnRPemk4SDlSVldCMUlzb3h4Rm9DcDhDckxEWG9MbTUwWXZPOUFvdGt3?=
 =?utf-8?B?aDNmeERGQ3M4eHBHUG1aR0ZPUWFZSUZCK3lHUWFVd0t5SHM4czNsWDlYOFRi?=
 =?utf-8?B?V0E4bWVoTjRNaFNBQW1zdDlZbEQwU2NmMk9vVEtoU3BiaHVMR3B6cUJpU1gy?=
 =?utf-8?B?UUgvdHplNmNoa1lINFRqUjk0Q2tTckJsZDZEQTB6YzVEQkdSd0NVOU5TTm9X?=
 =?utf-8?B?ZnFOajhYMlZXMGJLcEU3dExsREloZXlwUjlUSkt2WFptb1NKN3E2L2RHbjdy?=
 =?utf-8?B?WHk0MTFzQ3ZJY2lOM1RMZHBlaEV6ckpWYUppK3QydS9zVFpLYjhyaUZPdEJ5?=
 =?utf-8?B?ZXIxWXJQN0dxVWpyNnpKU2ordlFvaXlzYU1qNVFhWUNpcFZta29uaW5pK1Mr?=
 =?utf-8?B?TkwvTTNSaGs2OFc3bmd1cEl0T1EzTEEvNTV0R24yeU5WVFA3NnJ6elhJWlo4?=
 =?utf-8?B?ZlhvaTZIMFRtUXJDa0lma2ZYWWhMRmpBek83aG50Tkk1c3ZFOTRycEpXL0wr?=
 =?utf-8?B?ZWsrQkhreFJWOEg0NkJUL2VBaGF2NTZIWGJXOHNjb0dQUGg2SVRaeThZL3NE?=
 =?utf-8?B?Z1oxQXJILzJzeE41bC9ZeGVxYWxsZGI2RGt0MmJWTDFFVGZWSU9uSHY0OGpB?=
 =?utf-8?B?UlhTTGNmcmRDWmY0bzR4UTRjMkJXbzFJbTdFUXFZWGNlKzJJcFJPQkphU0pO?=
 =?utf-8?B?ZEJuWU02NzVjSmZOZWFUTVZkTFF0Qm43VDJlWkszMVh5a3VnRCtVaytUQnpt?=
 =?utf-8?B?S0o4MmFWK0VGSVdCRGNoWmM3QXdEQjN1Y2YwMXF6YjYyZHppYUVQcnhCZ1Fn?=
 =?utf-8?B?WnBsV1FJZWZlY0JZZGI2aXlvUjNua2pFK3BuZkhjelJmMmhQV21Md296eTBv?=
 =?utf-8?B?eHRENVZ1cG55czdic3NrWmpWNWVPOS9UcDdRZnFqRzRKQ1B3cXF2aWVmZmNQ?=
 =?utf-8?B?ZkhvZDM3VW5zbHJyeDZqSEVYNEVzWDZCTWxEZzRjeGdnMUtYVkxMTm0vaDFk?=
 =?utf-8?B?TDNOeXI4MlRFeTZtYlFzQ0VpZURIM3lGaWdoUUZ4UWZyUzFkWXdmc3pSOFNr?=
 =?utf-8?B?TkVkMk56d24wTmIya2pMbE1yNVBDNEgvWk5CeWdCeFdiZFJ1cWJzeWt3bGh5?=
 =?utf-8?B?L2tmREE5RGcwTlp5SmhIcVZsS0pTT2ZrOEZYaDVybzB3SFpEWUp0OEd0MU1u?=
 =?utf-8?B?alJaVVhYRUoreitSbi9FRHhLOEtqUDlOUEE2Y0dJSUtPb0dRTjJJODF3NDhT?=
 =?utf-8?B?Y3h1ekUwaEpHRnJ4MHhrUVl1YjVOQkRkSmdyRjFzeTIvczhpbUlqaHB0L2xF?=
 =?utf-8?B?VmlZYWxmMk5jUENta0Rjb0tmRDdlN0FjTGdORzc3Ylg4STVicW84QnNVcGtS?=
 =?utf-8?B?MXY1TGhFOTFJQkQrY1F3Y3BTYmo0V3NsNGQ2MkQwVWFsd01YR2Ryb01CTWlS?=
 =?utf-8?B?Z1UyZ0xlWEc0OGNLZ0p1VzA5U3EzOWhRVEdROVhoN0JDUHU3TjArZlZBSWtL?=
 =?utf-8?B?dDVHeFdab01zZ21MU1FKSVp5dllTbXFHYWsybHg5M3VEakJOd3E4Z2xjeExC?=
 =?utf-8?B?VEUzYUhvcHZDVnlCS0VhbmVSdll3TGM5U0tnZFFLcnUrd2NtbXNmMlM4WHU1?=
 =?utf-8?B?WjVTZHhOUjVHRUlVbnAwUlN3WWZFZGNiZkh3VENLclc1Y3k1cDBOT3Q4eVRq?=
 =?utf-8?B?OFJLV3R3SFphR1ladkRrcnY3SU1tQkRHTERZSVpVRGw2ZEFVQnNNZWp1bWFS?=
 =?utf-8?B?akdDVFZuRXRaSC8wR04zYXMweVZRK0Ryb1FyeWNYNFdzY3psWjNGRklRUmk0?=
 =?utf-8?B?T2lJTlN5ZzJMQThEaWkwbDVWd1V2MkFsTWdaNmpYd2pwNjBBV3loMlpKdU8z?=
 =?utf-8?B?WGNFTmdScFJWUkZpbWVDa2JWUzAyYVVIWUQ0aWluZGtBTUNLc1RjSEorTWIy?=
 =?utf-8?B?bWJ6d29ScDRURFM2U1BzRTFXemtDQzRFeDlJTVFPSURTTThrY2NNUzFEbzRK?=
 =?utf-8?B?YTN6NHZXQldDRHkwZ1JpMTR3cVdhVStGbE43SmIvais4ZmF0YnhaRnlZeGUv?=
 =?utf-8?B?c2tvVURSOWI2Tk5iL01jSGhrMk12NDlvUjd5cExUTXRZdFMrZGRqSFEvcVdO?=
 =?utf-8?B?aHVIVDErNElKU1crNXZacUlCbHBCV2Q0STNKWVJsNiswMTJrU0E4OXNLcnBN?=
 =?utf-8?Q?Pjw1Fn8a4X8jsKIfqUSIGjQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9e0ef3-a78c-48ad-01dd-08d9b4b9bd64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 11:00:09.1451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxV/bwJlr0IbkhUA9TQPjPA1quzKZ4+UfPqg8X3eEbdyhXl+1YFW0NzRUKN3WXDG+OugtI7GQ+d8tfRVXxVjOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

1: mm: don't open-code p2m_is_pod()
2: PoD: move increment of entry count

Jan


