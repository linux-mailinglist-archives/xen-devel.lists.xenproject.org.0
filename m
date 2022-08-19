Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2655996B9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 10:12:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390119.627357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOx6l-0000Dc-UK; Fri, 19 Aug 2022 08:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390119.627357; Fri, 19 Aug 2022 08:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOx6l-0000Bn-RH; Fri, 19 Aug 2022 08:11:59 +0000
Received: by outflank-mailman (input) for mailman id 390119;
 Fri, 19 Aug 2022 08:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOx6k-0000Bh-3U
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 08:11:58 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10054.outbound.protection.outlook.com [40.107.1.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9778dbcb-1f96-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 10:11:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8600.eurprd04.prod.outlook.com (2603:10a6:10:2db::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 08:11:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 08:11:54 +0000
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
X-Inumbo-ID: 9778dbcb-1f96-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixrTm4mFYeiJnlZ0515cwaaIpZjMpSB8/rg3yqgXPqxhX4z1xi/GDI0w4K/eImgLz/zf78ImMlAoRIREFkLXX7HUAECX6EQAIoX76yV1WQXqE4Tfn9T7E00IXHlCswtKqgP9DvZyb3EWtr3RE+ccDg24Cx3dj7gty3v4SJIVepsLSWfqZuuFox2HCAKHfW6Qc4qQCW+GUYf4H6jNihRc+lFeDMB4Bati6qfAwdAdLxVn71iJ7R0gCzlrrvxqH5RcqDTGujZioFZIMi1rxmmtgHf1oJj3QTE/YN/ggWbb+3Woa3LK4O5Qb0bff8DB9dJ0yvgHEz5EAx9RYE2yf/yk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjlgEtmW/ECdrd5wVCKP1t/iJue45rLdbC3MQTxTBDQ=;
 b=VlqPBRYz98aL09etMUMRff+nUnQP2+pqYKFJ75XD+Y/jjZO9ky17/WZl+4yDOu6ZL22fW+ApGvD33cISbjme8fW84+1ufSELCoNEOZQcP/PrUk488jp1oEpYocwLYP7VQ6IDu0hvd+hDWR7B6bAeKXz9xjJzgNhy0og07q49iJ1HYNjSDyJKFR9Ru0z1O+l8D8FqCHYSjjqBNZKFFLgHwinPiC7ThrZE0OkuR0j6oPxjPl0RulR0NBManFVGDrjnkhzBF81kbofhzWBIfUPm8ty8uUbEoHKzuNTIK/IswUWBHQ++pd62TdNwjR+PI322sbRG9B7e0Gj4sThmKBVdIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjlgEtmW/ECdrd5wVCKP1t/iJue45rLdbC3MQTxTBDQ=;
 b=AmWaR8HHPW+hr3LhV88Ov+UHb3FSx+BYvQfIMkEX/97TWHiBm6tdhvk3mXPMs6ikK5mKKxpomtd/YBY+OLcViwh2gas49PU/p3QyVOZGkEidXW6JZSAyC0bC9lSJzNH1+ov2gnqBF2lNwizzkZguhQzcjeEztEI7yX8gP4OBYg/Ih2QBFVKF4Lqe/aVt8RTd0C6U9ywoOWKL6dpAlHBkEDVA0yMPUAWCZ4lj3f/2p0mOpAFPan5BeerWD5zYTro9z9C13okEJ+uNK9acEiJotWJ7aXjO2Pp7qB8onEYMLwUpyAV0WayXoBNiC2JnW4/b310JiII2YToq+BBBsmxrJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f0e42732-87fd-396c-5d79-2087666b0eda@suse.com>
Date: Fri, 19 Aug 2022 10:11:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] Arm32: tidy the memset() macro
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <80abb94d-67d1-ef71-afbc-4d0bd9d8a557@suse.com>
 <6da837d7-4784-f517-5c24-2bbe6a2af2be@xen.org>
 <1e5496f9-47f1-3cf4-794a-9a840ee7c59f@suse.com>
 <acdebd64-0f0e-b391-271b-0725e4a56c43@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <acdebd64-0f0e-b391-271b-0725e4a56c43@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 546ad639-7790-4151-a773-08da81ba7a14
X-MS-TrafficTypeDiagnostic: DU2PR04MB8600:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QMNazArgNGtyHictlqC/1stx7vS4tZPWDpDuWFSJyKfbvSg/icS9/DahojzaOJ8tfPnqC4xOJpOuHNf3tbjLzVZGWnyZoNGQiH/LfQlqhikaocOKINJxgIHonD9+lYe47zyJQP34yj5dvSFow31Kbzu1lfDcFiyBhAzhMberN3m9EbzdPbXfkrWdq2ARaokNl9D90pqlLxR56zZs0yZxzegHTZ+VQfVfyhPBrQ9CCdDNlqAQ4d7A5hw8PMtUSFdP3rIiBrXY3v8ak9z120neMCYhZjUIULqN4kAaMDIvXQVrXjzNvHCbuAXq6nDOzg66rBx35B5llMSSGwHHyOoTrkwepdqVmeKUKDiUQWchoLQJrka/hr5rPaO8r+hKtx6F/bu2QZomdv1elw5XaL+q6aL6NFboppUwrsiRTwufEI4ySDH7R+TDNmgZ+DE+3OJdfEw1dczOGPcCZCDyElideXQCaoUkegCc4r7lamSSFzNEzj78HPBdbsYLK8+YARiDY6mVIDaA/MtlU9xs82gZH1TfQdlrImbBwtD65b2fjzr6JmNFX4QbHvFB2qc5lCsCuM71qjahV4BGTNe+DnAll4VDUdO+a0etsojcY2SFlrpxgZmSiErjwoKxgU76VjQKQhwxE76VGetC0c5YmVL3FSEgAO6u9NZihRlDrLc8RF3aVt11FywQwVdgNuFXqecjVbiVdxemHZxdobl2EIgRmgqt4D36K7rA0kFXwoReCG7x0iu9+DuOMmLka5h4gzbfYsszbRylvrGn/fAEtA6dVnCna1hyPZ86VBXeTBvtdx4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(376002)(39860400002)(346002)(2616005)(6916009)(316002)(186003)(31686004)(54906003)(36756003)(38100700002)(6506007)(66946007)(4326008)(66476007)(66556008)(2906002)(31696002)(8676002)(53546011)(6512007)(41300700001)(478600001)(26005)(86362001)(6486002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFlOeVF1dlJTdFl0OFVIOFkxMHdVL1Y2dmFDeWNWNGEwcWdFRjczcG5aR1lZ?=
 =?utf-8?B?YjlvMjVHMk81WEQvWVNhUHY0dk5FZ21nMGtPSVZTNHFjTC84RWFwNlpiTGY3?=
 =?utf-8?B?SmRDMldnTWRMaFZzWUt1QzZ3M2Q3MzA5TXd4VXEvR2VWVmlzbmlHY205MitW?=
 =?utf-8?B?Y2VOaFdIWFBRSTVHUEJITTdpbVFEbDlNa1Fxek9PWmk2Z3JmNTErbXdDaTdP?=
 =?utf-8?B?MktoNEsvNWRhSHc0R2xjK3lCOVllemQ1N1BPdUpLTGhWZlJMUUJxM2ttYk5h?=
 =?utf-8?B?bGZPaGVTZ09WazdDYkNkTFlaWFBNZDc1NVlmSWxYd1hML2xGWkV0MVZpV0k5?=
 =?utf-8?B?ZHpZdUhMaVl5c3ZESFJhblZkQkdvQ0MxYWtaU0ZYVktLcm5NK0FFbk95VUVB?=
 =?utf-8?B?NlQ2eG9hei9tdmVEYTk5R2tIZDUwRjdLeU5mWWo5NnFoVExHZjZOMzdZTkkx?=
 =?utf-8?B?L2ExalVGbnNmTFVjUjFGdUN3SG9kS3NZTVAycHdwZTdqb3E3eUFFL01YSFlU?=
 =?utf-8?B?SEN4bzEzYlIxYzR5aVBkcXJRSmcwQjZEb3lTR2FRZFRTeldmelU4KzlOVDFG?=
 =?utf-8?B?bXBBWGhDYVVwZmRsNXRJWHozSGxtdDlqQldiOGlKL1pNTTVnaktSb0FYU1hy?=
 =?utf-8?B?cnREZTJQV1d2V2kwaXNWRVg4REl0TWlyS0s4UHdEcUNxZWxuTVNFRlhoZWJX?=
 =?utf-8?B?T3VzLzFPUEdENEI5cHlWb0VOb3J1d1ArcFd2WW5oYm51ODBTSDE4NnZRM1lE?=
 =?utf-8?B?eng3ZFp2MU0yaU9tTDk0Mk5VeHIrY0UwSmtmTFhkeUowRTJDUk83ZDV6UmxJ?=
 =?utf-8?B?S3AxbGdZeGN6M0x0Y1ZGVENZZWF0eFg2L1gvRzgzT21iZHlXT1E2R2VZVHVJ?=
 =?utf-8?B?Z2lZNHBSME5RbjUxOWtEUDhCRWU1QzNqUHh5WFZDRW5tSkorOXBGWHNiWEtW?=
 =?utf-8?B?YTNTaGhEN1JUdTVyWGpaRmpIaGVpaFBOZXV1ZTZjNTl2S1p6b3g5SXltMlRp?=
 =?utf-8?B?OGJSVkZzY3hCT1JaY0FjOTJTWVZ1aVQ4V0pFK3FkUE1lN2tnOUtSdUhMTG5B?=
 =?utf-8?B?M1owU1RUTThGcU9uODhZM0RMamxVdGU1dklvWitEa25GdTRPWE9yZnhBU1p4?=
 =?utf-8?B?aW4rVm9lV2c1NUNsai9JWTlVTjhBa2Zab1RIdDVPUTJjeHVES0Y4NWZQTDMw?=
 =?utf-8?B?azVvNmwxM3FEUTU1ZklLRUUvMjJLVU9HOWJkakVTT1pweU9EaERMN3hiZWtw?=
 =?utf-8?B?Y251dVZ2clB1ZERxVllGellXczlpM2NUcVdvL0h1RHNrTXJQdWoxWkFSM2ZX?=
 =?utf-8?B?TVo4bTJPaExrZXpnVlovaXF2dU1YaXNhVEc1d2JhdU93R2ZWbGc1V284R293?=
 =?utf-8?B?WW45aHFiYllCQ2t6VHNDZURVeUdXNjVQaHU5WFV3V3RDU2xBQURscTRtVC9S?=
 =?utf-8?B?bzE3Vld1dmx5VWk5V1BRZCtMbEtvSE43NFZIUnVBR3V5VDdtVnZPdkk0QlZV?=
 =?utf-8?B?ZEsvem0yeVo0TW9adkdsdUtheFE3S0VXdE1HeUVHTUlQNHRQVm4vUXN2NmtX?=
 =?utf-8?B?VS9iN3ZIaDJqQUFubTdTdndvcEo0N1VzUHlYNFlrd2UxVTdTVXU3WXpCc3Ev?=
 =?utf-8?B?TlIwZG9xUEZKV0RXOHhrS0tCUEhZM0tobys0YXpoSG1hQlpYa085a1ByeVpy?=
 =?utf-8?B?aUJqbHN4Y3U5NEIrQm91M054TmlEMjh3UGhmZWVoRzh5YjJsajVBRU1sb2V0?=
 =?utf-8?B?a2RWSzAwcWFIdGlFVExsdkh6cHpOYTBHLzdwaDVpbDVpOStoYiszb1pLeUx1?=
 =?utf-8?B?VW1xWDMvVFZndzU3YUFsZTc3UXcxL0wvRzU0YXhGTWJHOEVjQ0VIK2hJQUZD?=
 =?utf-8?B?YisxakQyeTk0YVJ3b0JwVWd3SE5sVjY1NkRVaS9oWTg2WnBVTHY1cWNTbDhI?=
 =?utf-8?B?aUQ1amIrZFduRDgwQlZTL3gvMnZLc0xGK0JERVg1SFY4MStQMUVDTlhQY3NS?=
 =?utf-8?B?MjFMN2ZiTHZIaml0WWRLL3FLa0dBYmNRUmNobHhVZzlVRThCZzEySUdLOGRL?=
 =?utf-8?B?Z0xwQ3EyamdwVGdmNDBUOFRBVG9RbTJFc3NaY0FURDJsa0QzekdEdlFyT1hD?=
 =?utf-8?Q?JwgkArGsyrXF8vRGsLXcYmNmM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546ad639-7790-4151-a773-08da81ba7a14
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 08:11:53.9670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+It7jyYCTGyLVe7BpBiaRkmKM1gt0p+A0L+oITj0pAKJ93b+/mm6Fg4heXQxi4M77pB5RP2Db+mAUcYeBUiOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8600

On 19.08.2022 10:06, Julien Grall wrote:
> On 19/08/2022 09:02, Jan Beulich wrote:
>> On 19.08.2022 09:58, Julien Grall wrote:
>>> On 19/08/2022 08:50, Jan Beulich wrote:
>>>> - add parentheses where they were missing (MISRA)
>>>> - make sure to evaluate also v exactly once (MISRA)
>>>> - remove excess parentheses
>>>> - rename local variables to not have leading underscores
>>>> - apply Xen coding style
>>>
>>> This code has been taken from Linux. From you write above, I don't see
>>> any strong reason for us to modify it (even if it is small).
>>
>> At least the MISRA issues want addressing, I suppose. Plus I wasn't
>> able to spot the macro in Linux anymore (nor __memzero()), so to me
>> there seemed to be little point to consider keeping anything "in sync"
>> here.
> I read the last part as we want a re-sync of the code (we haven't done 
> one in the past couple of years).

I'm afraid I'm now really confused: Which last part? I don't see how
any of what I have said could be read that way. Quite the opposite:
By stating that Linux doesn't have this macro anymore, isn't it quite
clear that there's nothing to re-sync against?

Jan

