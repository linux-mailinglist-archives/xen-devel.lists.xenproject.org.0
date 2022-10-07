Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C25F7729
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 13:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417869.662610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oglBX-0004MU-Pz; Fri, 07 Oct 2022 11:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417869.662610; Fri, 07 Oct 2022 11:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oglBX-0004JP-Lz; Fri, 07 Oct 2022 11:06:31 +0000
Received: by outflank-mailman (input) for mailman id 417869;
 Fri, 07 Oct 2022 11:06:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nDAh=2I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oglBW-0004JI-A7
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 11:06:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17bd581e-4630-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 13:06:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9057.eurprd04.prod.outlook.com (2603:10a6:102:230::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Fri, 7 Oct
 2022 11:06:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 11:06:26 +0000
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
X-Inumbo-ID: 17bd581e-4630-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLiSCoufCjTh6Zpu9OTTjQvFcucHuJ7zQBlyFiSZtL8WDwUq7fyLxoJTCJD6vYTHtbTdAAbkjUVPLJodOC49rHPTW0/VUlsMReTZEz6UkReQ3/I6TP4K4JBygCrq5jbeUhCAxUpfy35Rx2B2T/ZznA5NVY3ixVHr7q1/TvwYiDFjAKk2/MHqOJT2rh2rfFNpH6SUhXlbbuf5O0mZ9XaO9Qhpn1UZQSIzv8sbR6afCDqBroXBEsWB5VMPTi/gvNa8cT/YEmiD4qKPi/7nFhTI9oeQc1/qbsNFK2Nn6V2ammmXucA/IUg4+54bTMn+Uo3LdQ6c8NDKaRC13bfc8ztSuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffhbbvy+ilneO2Pgt0qQWWL+Aq5K3/876vSX0P+N3Pg=;
 b=nqlFluMZUhG38P05m2f5u4SEXT/9fWW0r91sel0674pURBI09uPgwX/2onFX2/kR4fbVY5YftNrjbBH838T7uX7zdKezXv10jY94RV0yLZZGDYyovcvieLvWSczBEHFKz0GYktqpnYBbHIzumN7dRNPDDCLSYnHaDubUo9vnVu1wmhtIh095c+H4b83bUhoHjDRrkGI6gNL8kbLIAlD35jELqRd/CU4QkjrfYDs2ZMuf5aJpesRsvdSWsVDyJhb7tD38lMinTUJpS7XB+Y7fGtFRH74EvpHHs1IELB9wYRaCJ78QQKPx121mQCvMJ5ClSs0bIOUzMxlVqdxmTm3iWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffhbbvy+ilneO2Pgt0qQWWL+Aq5K3/876vSX0P+N3Pg=;
 b=hL8JRud4Ngpm99TcdIuacClcKluTkI8wPWK4hp5BVIk+V4JRbZ3Z+EajJXVFOCNgieeBf0BbJZ8paDVNUspDOYMDg+JMAprQlt68yXnlQeXOVWYuEeoOXyY5bKXCNs8xPkM3lc8ebBQ21nFV3TRmAU/JCz0vUAKL7kho8y7cGUjPXo2ETXMELZsHqeXGkGTE5GYEj61FkI04CUXF9x3rPa8owfKbLAl3SIz5SR0YO5wH15QJzx1CWeVZKaKlrr4UQZzuHEC6+LHmGmGrQZCmimlODIiXVRlRLnJmztsiF/fYIyNHamrO6YegMoTLc1sVYkSYbtprGz14J0ferFsoSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <304f4bbf-3598-2f42-5cee-83e58c1909cc@suse.com>
Date: Fri, 7 Oct 2022 13:06:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 3/3] Update Xen version to 4.17-rc
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Henry.Wang@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221007091341.58542-1-julien@xen.org>
 <20221007091341.58542-4-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221007091341.58542-4-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0590.eurprd06.prod.outlook.com
 (2603:10a6:20b:486::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: b065bd26-8c46-4591-2732-08daa853fa94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t2PxTUkf4LNcFJMhMY+1v+bQIAS4dhUng8MvEdEp1avs4oZWUgqQfYBg12WFpAgQiRsdjamMYMmLn+rT5rsfMRIXOXK2GcBHDNlNzqdjwIjDoULwacwXSOGILLSQB+9Z6nrca/D1S7ve5iHdZDMAROaRXln5TYWfjCx9m5wjuLtvOhnaKlBcLOXzjpVO3ROR0juVnIbxgW10tKtFUB3hvXT+fe0TmMC0rE2/2tyb1FSIAZCVicw4CpWdS846QBI0MuLdgmtrfdaLxxzqdWZJEBhk/8TySNT7oEqwtLcZTnK2gOW1eM9m+qZ07re3oicUfa46qmhkl8dmoF3TUYKLiBCCtOTqDU2jxCjZe2BaHjGrfDdx/g/IchLJ7awpnFyVdC8dGd6dTveMVnEZorKvmfHutHUXWuKDqZEvFxclQX3FkUiQ6UjKqiElI5Ale9DxwfoP3YJSd1P/hDZFPypgGJzlf7dVaeEPIUro0xNPN7eyimkbiaEijhLrnLgr02eeoUN14CGugkPsErGKhtD3EsJrjZCI1lqWzOiH22cqV7t7VuiT0R9H0dbprWZ9VexDNnDN9EV+P1e9peDDhosr8keaPxq/RJA+z+1wHuCbWelE1ftzXvbTWsOsOFbryIC9iaeVnNyo2OV61iJ+LgouDibstMWtiE1L9ZNGWfI+7Zkuo2foq0xk/lOYfzpNpvqUq/ZGfggaSrbULBuskYoxJK5tLaTaqOlHEaszDvP5z4/bvyAuPfeaGbya17+iTuJH0JBaZcu/rmKVXMO5JhWX3n5YBpHKJViMgAewm36/iLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199015)(8936002)(5660300002)(38100700002)(41300700001)(4326008)(66946007)(8676002)(66476007)(66556008)(2616005)(36756003)(86362001)(31696002)(2906002)(15650500001)(6512007)(4744005)(53546011)(26005)(478600001)(186003)(6916009)(54906003)(6506007)(83380400001)(6486002)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0JkazJHOWNRQzJobVRkVjNmamIrR1FvN3UxVFFEb3dkQmJFdTlDbGNLVDk2?=
 =?utf-8?B?T29tdHNhMm1xbXpjeG1OWmtIem9mTWRFVVhCak1pU08xZWJPdFh3ajJDMklX?=
 =?utf-8?B?MDNYekN6RmRibDRoQ2JvU1NQbitSUW41aVpTOGcvZHZqdGFHV3VxWUtWbS8r?=
 =?utf-8?B?aDZoRDAzTW81QlFIc3ZraVBzT0V6d2JHK0k0WFRselA5L1ZWV2F5bDd4dG80?=
 =?utf-8?B?QUdCOXNPK1dUTDgzTUxHOGRHNE9ucmU1ajNhUnliWkhlNVJ5Wk54TUtSV1lD?=
 =?utf-8?B?dGpVZ0hoNit2bjF2SHR2MlNvQ2labGplMmdWUnVqUklldE00QVd5NkdLM21T?=
 =?utf-8?B?YTlXdExJTm1yN1ZkVGt5bWo4TzVtODNLVWF4TCs4REFCbTRLY2R6RFpVSlVB?=
 =?utf-8?B?M1ZvV1JuVndWTGpvQkFEVUVCM1p5dEFIcGlNVTdtWXU2eUF3d1ZSZ3Z4QU9T?=
 =?utf-8?B?OW5pbjcwSkdKQ1A0cHN6RUVReVp4dGJpRUVvRFExcmFBMEJSR2owM1J3cUVS?=
 =?utf-8?B?eStFTTFUeHU5QkFDSVZuME1KUkpjU00zemdOZ1pQNFJ4TUtxY3AzZUtlYUpa?=
 =?utf-8?B?TnBRQzh0ZnJZbHMvZjJrU1FsSFFjd2swOHlVRWlqazBVSU0vUXBZZHJaR2Rx?=
 =?utf-8?B?K1RLS3dJRjA0SHYxSS9hejBwd0dHbGpuQytHWDdHd0FwOE9OclpiUzMvRTlJ?=
 =?utf-8?B?OUlOQzNEa0FOTDFHNTBFeXpVNEhBNzlXVTlaOHFMMHF3SGN0RFlndTFzeWkr?=
 =?utf-8?B?T2JSNWVhenlGSmE0RE5xUU5QSFhFSWdsQ1NCTUcxNzJFMEtoVGhQQmVpR3Y3?=
 =?utf-8?B?Yk03RkdQY0V2d05xazM0L3Ava3pzZ2VlaTNZLzFnK0gxcWVXdkRwSW1ROU92?=
 =?utf-8?B?L2ZNMGlsY0RtNWV3bHFjekcrYnlCSUh3eEJST0tFc1B2U3F1NHRNc08zQTA4?=
 =?utf-8?B?aW51U3MvZGE1dW93UlRpbGQ5WXhSaU1Wd29pZ0MwMlkxWTFKQ2pRS0ZQbG44?=
 =?utf-8?B?eUhianBwZVRXT3c5WjZRWWpDRTRCRDdGNEllL0EvZmM5RXBxUE4weWtNOFE5?=
 =?utf-8?B?LzkrRTE3KzkxaFlJbERMWUQxb3grR3loZjZJTVRCT1ljV011ajlsUnkrRUxU?=
 =?utf-8?B?L1pRS3gwQzJZUTE0R05TTTg0bkloL210RnJZQTRUZ1Boa21nNFRpRVN2a21S?=
 =?utf-8?B?cVR3RUNWZGp0dlJsQ255VUJWTFpSWU1CQzdrc0JlSjF3NjhrVldMbnRuV2NR?=
 =?utf-8?B?MWxOaUhWQllVQlBDcXFSN3M0ZHJPZC9uUEljNnczRjhBT2JYdFJ4b1pkc0JW?=
 =?utf-8?B?U0RKNWZ5MEZoQVBtSE1mcFdkTEtIdHp5aFlJVWxiaFRONlg1Lzd1dVY0MkNZ?=
 =?utf-8?B?QTNJTWpQV094ZW8rMzBOcG9LWDYrY0ZkcUJOMWt2bUFhem14RlF3Q3dmVDVH?=
 =?utf-8?B?TmQwcHFBdGQ5N3VDSzFaeTRDb1pVVTNzWnpiOWExV3dMQkNqdDhVVDUwNW42?=
 =?utf-8?B?QVJCaEVxdGhCanpnM1VLcHFEem9ra1gzZ0kydDZYdXJFMmNPWVdkaUNYQWVC?=
 =?utf-8?B?T2hEbHpJbVBZSDc2TW9DclhaeTI1R0JJRHpPYllWUmFhZjdWenZnUG9rWXc1?=
 =?utf-8?B?SHYrNWJnV0ZyNzdpQ2dOL0FMUXQvOUQvQ3BYV0MyeDZHZFhCZUg3ZG5XRmtZ?=
 =?utf-8?B?UFBNZG11WVd3dGsrNXNPUnduazFzUm04N0ZGOVFVRG1TM3g4Uzc4U3ZKWlFx?=
 =?utf-8?B?RXRVbHZTSUhxUWdtTWI4b0dSRmFHaDBYRXJYcGN2TUdHbEwweWZzTGNZYUdL?=
 =?utf-8?B?d1N6T2VCbHJaaFlRUVhnSVNQaHpsbXh5Qk1xSy9jTE5vZERIbkN6dEFaU2dJ?=
 =?utf-8?B?WkQzYng5VzZ3bGo2K2ozbDIzQUxLRjkvOUZ0c2F4Wjg3bXRWemdvaEhmZmdQ?=
 =?utf-8?B?Nko4Q0xXbTdvWkpOZWdqSmh2dng4K002bVBrazgyQnV6cEZQQzZPNi9QU2xo?=
 =?utf-8?B?WkY3a24vOWQ1WWhFMjdDSERtR1dyckZSYkpGckVvNlRRN2VxekxUb3NPci9l?=
 =?utf-8?B?NXJZRkFYdy9oKzVTblQzQ1F6L2lzdkp5SUVnbXg1UzRlMCtWTXh4amxmMCtQ?=
 =?utf-8?Q?SodNr6RFaABPU4TOPOmkakXUU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b065bd26-8c46-4591-2732-08daa853fa94
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 11:06:26.7517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2I6jiMcoHoggsRjBsFGuUQU4t6Ioj3B6FTdeHYuITFWO/SLIzmXt6pBSc7XrO9Sltsm7QCVhjVVhvPQ9dJsD9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9057

On 07.10.2022 11:13, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  README       | 16 ++++++++--------
>  SUPPORT.md   |  2 +-
>  xen/Makefile |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)

I assume CHANGELOG.md is then going to be updated only once for the actual
release? (Not that I think that the -rc is relevant to have there, but the
version could as well be changed to 4.17.0 already now.)

Jan


