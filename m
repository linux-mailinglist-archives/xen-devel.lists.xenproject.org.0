Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AE4455CCA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 14:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227426.393344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhYt-0004nE-1a; Thu, 18 Nov 2021 13:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227426.393344; Thu, 18 Nov 2021 13:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhYs-0004kx-UW; Thu, 18 Nov 2021 13:34:46 +0000
Received: by outflank-mailman (input) for mailman id 227426;
 Thu, 18 Nov 2021 13:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnhYr-0004km-F1
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 13:34:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a959a52-4874-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 14:34:44 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-FGdETZy1O4Ow78U1oJkrSQ-1; Thu, 18 Nov 2021 14:34:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 13:34:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 13:34:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0246.eurprd06.prod.outlook.com (2603:10a6:20b:45f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Thu, 18 Nov 2021 13:34:42 +0000
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
X-Inumbo-ID: 4a959a52-4874-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637242484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmCGzeGuWKb32AVWn8aZJOcGm5Or68mZhwJbH2Q6nMA=;
	b=SfuV01sDgt6pt3zsy4tZLeknmJhbxTl2AcxwFBlmi5BTcbT/WxqFyi8XeaPnuwoDIbCK3w
	/rPdhVvU46NxP1Zt5p1gHLkZhFvhdR0WghsbvGgKVbxqT+lXxdpbYUCL5kR1UtBtKdw1uM
	E83hKBjwVaDR6FZc6XVJdoSiSk1wsX8=
X-MC-Unique: FGdETZy1O4Ow78U1oJkrSQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j63cMyLmtd4B0BLZShNAK3MAR4RoH3HNNfxhB5ueDR/ovVSqFr9/+hi0hDE6ADwuzcbTP2ixV6nhwN7ral2n61wAPFP5RZ08BgrZOPjkmh3F/glDILQxqKQzmqlcGKcSVmz0EEgN5YoiZ+cMLwLvkq35oAtmNJrS0dtmyYaPyUe44Aq8J2EwruNW1t4sPAeLH8fe7RX+idVkiLDquvttQM+h3vQsmoc6l00snQsu1E7L45zKSWp03t8jGbcb8Z3ikvlNT9XIDZVBLUw9/DvBGiZBElSoDjsiUQ6+fZ09JCAEt3petxK3vTgI7BTTllYXpQruGQU99Mm3tH46V+nY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxaPk6KylYqBA6TKcE7yXlK1ISqGjzElhwR7l/ecyRg=;
 b=BdSkJFK55iMpug4Ai7+YcLmXjLA92Sdwl7xFOmxXkgFZNeyl9B52BIccHX7kGBb3atTczqrvqVuiwV8sRrso/AfIn1vQk8DhI1Z0Qunqjnb5DuC134u/JVjwUjMFl74rWdEVQYeJK/tzb7HLmLaAi7Jb6GeaqT/4ZWAvx1GGG23gk9E5RoDp1u2hq3cqLco6YzAjGb5ymkWJqFar7P2gn+YqV9Ls9sLMtbmXI1szl0tpcFQs9xwvNQ7q6T4gH+OQ6R9KsnXpaYEK4CVuY6aCbVB2K7B7KyuCAN0gjag2XUOZ4kO+Y/vLySIrz+nbp5DsSMRFrkPGPJHoB/C53HIiXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44ccd257-6c8b-c35c-a0be-1ebdbd6d8ad6@suse.com>
Date: Thu, 18 Nov 2021 14:34:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3] x86/Viridian: ExProcessorMasks handling improvements
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
References: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
 <0b8a1864-5ae9-3b19-4d43-893a5777985e@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0b8a1864-5ae9-3b19-4d43-893a5777985e@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0246.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f63d25d7-6b2e-4026-f330-08d9aa982d64
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5742381DC4EEC6A17D27D04EB39B9@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DiYY6EUMP+LsETi2HYOW5MsVWDOSztjxNQiI7tCN66PJp2woqBb2/zrN1GNZMJpoMhNt8v9MazZooz/57wNAS7d+1Ry9fnUQZiRdi6pl6n9voPZ2R7ml/bftE2/dVafrRwvA6WgOxYna0G3BcbqRSVHbUmS9Xt7XvD12C8S/lCFKbqBxs80IQWwHb62L79z4Jc8uEktzrbHVkAK6BzWeeG52cvtR39lsyk4II7EMHe51bqCWAPcg8Z83qzUOTtT7MFBv2M60ZGBUzL+2ql28Udo1OoR/1W6XmB6U5H3BQlHUy/cSdS+ykMA/6nsyflqOpw27GJs0wM4EK7lBntFCR9VHQHcg35CZ106B5PfwLdsVlqSwml2Pc9WogGq/+VgQXt5xJpqRdsJBr+e63HCSCWuaNuW77XMB7rnBcFJCyIcCqZbwJ2brh2CULtFy0YAxlwe23utxVR8LLIkyxCi6xh92DSr21Wikixi7b/VRhx35Lp1WMbme/SIX1T9lcm4xIkWmvQAe6C4cGZgvVSPsYhkNiknn9xFFWdHnvFjzGn8fmTLqahw41z0TgrqEVnrpWtz7H7ck3rHE0pG8PhzqKG0jpc9a8rvursY5rZtJSJdXxBzD9Qx/Qy3JSbRwS52x7UP0C50vAe7M6wxkyoJlotsAlLRj2l4YQ2CWFE+sgJkvairkyJVRwcTVu/tOWLFN4tnWJXvmbcGdC0q3pyQt7GNLZLv+98JKERkpqmdkPX6BjSUnqgmX9alVk/9M5tnX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(366004)(508600001)(86362001)(4744005)(6486002)(8676002)(2616005)(36756003)(956004)(66946007)(66476007)(16576012)(31686004)(53546011)(316002)(83380400001)(66556008)(186003)(2906002)(5660300002)(8936002)(38100700002)(31696002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vrd0lIS5TH6z/J5nPpHSBNkUTlTPPvZ4NEqChvj2tBXWOSz2IDLJD/9ozF0k?=
 =?us-ascii?Q?6dLukPIvMAaXnq3fivgoDLdE9VVrBZl1CcxDOQwvKQJmwe7BolvPQV/DHs1g?=
 =?us-ascii?Q?1NV/NswzSWl95rT0gJMiYx0Edilh1jyLQIYzhdbudcw5twgJVnrKiiBHuJ6r?=
 =?us-ascii?Q?G/lezlFS/bqqm5YWbptNjqekBFIv/+xC0dSg9lwnzg+EV56zw8B+UB4Q34WA?=
 =?us-ascii?Q?LtK+TcBqSusU0PgdOQjLcRZgF8YKAr6qlPZGbJL0Af6yk6OjBtcF/8itiWib?=
 =?us-ascii?Q?P7ShmeubuvRl4iSXgsYkvW/ffMEOrgu2LPbvBL4sDdFJl6IZQDljz82gFshY?=
 =?us-ascii?Q?OHUwX9/fQxIvxRC7oBeYQasIiC2jPt6nXTF7PBP+Nz099KWXqSO3qKaMmICg?=
 =?us-ascii?Q?2aUUWgQfIvfmyFNCXbvnruxF4mLcdAMzg+90nI/EW23Fy/7k8o/WgHKLrUwY?=
 =?us-ascii?Q?zfFbewC3NtwhNMMMuOGPEjrk/KJZHKAXih4p8iDh/mtxwJCqCttd1zeXjYIv?=
 =?us-ascii?Q?iURwS59b13lL/dfnQ3mM5EaiWW12SV1IlTr3n6yWj7QT9vAji8oRa7BOCult?=
 =?us-ascii?Q?rXbw9TkqvIbckZTOWB0GkChR9l/ChrawsG7p4myMI+CcV1+cPfZNgKRi7aQH?=
 =?us-ascii?Q?iXn4DwcmsD+MK+s37x/KYU+qdzGoDkaz2NI0Asgt243qUcLGIr4fcwhJ0OX0?=
 =?us-ascii?Q?ZlgEi3OQll0V7X3wC+p3khTL0Axpul8HP/38uQdwmC3oZaOHfwUEkimfyAC1?=
 =?us-ascii?Q?ZvGH/lSQ5vOml9xJSN2VB3Hu8iT+KOXfM5JnsE2sUWJBRIRd+9h0JOmpQz+P?=
 =?us-ascii?Q?fxeny7cuLmTZWroLfoAZvbglHpt/RjwMG/BApci7symUfz3uH7nW6eyzl07L?=
 =?us-ascii?Q?oZDb4WZOrllGWQQ3MEnVacD7nUtx0tanJ21Sy9Qu8KppTDWEsUoao9+2l7zJ?=
 =?us-ascii?Q?6H5mecuGt+td0c/7JVBGIhtQ2bE8suf3du4HNyAe7AcO9IuzzW+xitj6O7Vp?=
 =?us-ascii?Q?b0Erss5Eh9fBpshd0qY6N/00mnSOQqOgdkYQMavBRvOCwgjUQY6Et35r+tSc?=
 =?us-ascii?Q?wgknXRsOvG9yolWgkRn4h7i60zcni9O4FaMLqCutyZRPHblEG3WEoHGvnn0S?=
 =?us-ascii?Q?SttH2+87p60h3WtIHn8D5Fu3T+oIv4+jRYNGMlI+D3LeNLvRpxwn9/2q3BuW?=
 =?us-ascii?Q?sTvhZddpwmLPi9GEX76LxTA8i+SiXs27npDBiUehwV8AOI7K9rG6CFe5+joW?=
 =?us-ascii?Q?vnI3b0BpFw4hAUBmp2ApC61E+8gq0EWtmMbKvWCwS1D0K22GR3DQZBzG0Bv9?=
 =?us-ascii?Q?+3HYlzP8hWSgoDIPoYdEKJn4hzRzjw7isCw+bf2OEbZ53Dyb4fyTnMo5NqGC?=
 =?us-ascii?Q?48X9aZxPryLc4cGzhYz0rEudglObKrXVH39I/ilFL5uk+K4Z9HKCccYsqiF2?=
 =?us-ascii?Q?smkz6B4uESbvJTdLjGMwMwgUHBO0qEbM7rWnzAC5LmRBptuHLcB05iy4LoJ7?=
 =?us-ascii?Q?bRrXYjXbisz4HyOeMRSzoE1BqDnke13lu7SdyTmcttgwdo2fuJF3VQQ69Xhe?=
 =?us-ascii?Q?q8qwiYWsjzR9L5MbIcO0tq5UO1WDnLHJc1WFD4ei32YDRUXfQGlVOnwI3EM+?=
 =?us-ascii?Q?Rq6MEy1lXQQ5Ua1kgH2QhPg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f63d25d7-6b2e-4026-f330-08d9aa982d64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 13:34:42.4646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/rqPAX05/0JdQhcEWWAumlIRw5r1/E9cvXW95I2QFLupxBXVcm+g7FBGsBqPg/pL3K9iovSC1SycJhS1EnoRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 18.11.2021 14:20, Andrew Cooper wrote:
> On 18/11/2021 13:12, Jan Beulich wrote:
>> I've noticed the bugs fixed in patch 1 only while doing the other cleanu=
p.
>>
>> 1: fix error code use
>> 2: drop dead variable updates
>> 3: fold duplicate vpset retrieval code
>=20
> Oh, nice.=C2=A0 This makes it rather easier to do the flush short-circuit=
 for
> HV_GENERIC_SET_ALL.

To be honest I first thought it might, but now I'm not sure anymore.

Jan


