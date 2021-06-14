Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A2B3A5CC1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 08:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141127.260792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsfoE-0001Dz-Bo; Mon, 14 Jun 2021 06:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141127.260792; Mon, 14 Jun 2021 06:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsfoE-0001Bo-8B; Mon, 14 Jun 2021 06:10:54 +0000
Received: by outflank-mailman (input) for mailman id 141127;
 Mon, 14 Jun 2021 06:10:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lsfoC-0001Bf-6p
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 06:10:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42a75b2c-8451-427a-b394-d7d3ac5ff65f;
 Mon, 14 Jun 2021 06:10:50 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-NLfOUfsTP_CXgJCwPsZYVQ-1; Mon, 14 Jun 2021 08:10:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6672.eurprd04.prod.outlook.com (2603:10a6:803:127::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 06:10:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 06:10:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4P190CA0009.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 06:10:45 +0000
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
X-Inumbo-ID: 42a75b2c-8451-427a-b394-d7d3ac5ff65f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623651049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OjUMcnKkFA/XkpJf/PjyDSuqSh/sM9esCQ1SiWmy8PU=;
	b=TRVC+cMIIL+494aiYP78odRIm3Uel5/Fj+h0vby/L04+bgnroHaobDKgMWEkLU/BGSj/GX
	zrohsOUFRtsynFlSR57nhjeDJQ4ctRhymSdc1QlXc8Bs2gJzO+rv46O8NozIicQMK5nLCX
	udN2kxZw5Ei5AFB5sxtI3zM9RFowsTg=
X-MC-Unique: NLfOUfsTP_CXgJCwPsZYVQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sqz6rM88WtRSjjazmM+BNe9Bp96K+w/OVbnxbi0tXV6PY+lkmGTLCsfm4rySXBeSOLF1gQgyI5bDs1lSM+emcXRiswFz5+T2YT3/6BtI1pRgA/b3N/VVwXrZdJKjGZKBiXaphZMGqAColRlcpQmvIj8HV5Hy+wBxNjmpYGzhGYQmY+tq/rOFqmOr/25CjaiAAkVPI9KcAuNx6r6lvM948JdxJUWOhMiPy3zB+ylyQ0CytvPwEkukY6UVF3oZRyxLauRIGtGHi5KkijApl63YqpjUZlhZCDa4gy66RdjgKDUtidmedPuOXry7sqGhnJsU7cjJiik1YHbMnw2Bx7DZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjUMcnKkFA/XkpJf/PjyDSuqSh/sM9esCQ1SiWmy8PU=;
 b=IJByn5glAbe7PosviMEQpgNVeFTHm8REEy1Ty1krbcNf936GjdebPEtHqUE9lw5+OQZKsJpF6vG8QTDW2qG7Iort5fFmvUyV4SLJ9T+XQb3OwJLAf6p7zHtUlVK+bu1xZF/djKPtwo3QIplOTD/8pEFV4lyYttmI74meyHlcS04CTOgpcIpzN5ivN8ni9a+AQoGrf0GW4mhY7ha3e+zf1RM/aVGAbAAKkgAxOBi2rHuRraIgvODdm7WJwg0OktmIohrw5QS8xcGMmY49ATBJvVgEcN03C+TczluZtUU3oXDJpfKhHzftgn2yavtQWxIbcE3trFF6ZXqx7WEsloAMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [OSSTEST PATCH] ts-xen-build: Turn on CONFIG_PV32 again
To: Ian Jackson <iwj@xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20210611170230.20195-1-iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f45a45c0-b847-d6f8-d613-f2111c390929@suse.com>
Date: Mon, 14 Jun 2021 08:10:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210611170230.20195-1-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b89e9546-3625-4765-d568-08d92efb25d1
X-MS-TrafficTypeDiagnostic: VE1PR04MB6672:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66720DDD49470812CECFBEEAB3319@VE1PR04MB6672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EJXt3GJeTzGszV9eb6mM14XawZJ5Dm80yI3QmPCsIo4YtjCqULhnLfNOeusrzdq4D9OhzrFNG0Id2kP1TnoIAQIARM/QYoHRNF8puwSjAYZYDP0tIf72SvVZ13m4ln23T93yYVmesdPUdc5oiPHNs/nvxNzvoJ+uAXnLKkjDsoPCspQqLNQ0x/kuV3/hpl0bSFKV6goYitFgU2CYMtiWJq3304paLG7/O9gC0yZgvzpWCr2xij2/2NtjrnHAz2EDzTF6k99Z4/3JyAE1PKUBH1485gbOQLI0ggJ2ENPPIKPUkOKYDdJPTzlrbr3oJVp2+g6W8Ecd2vFE+OtykndExfQ3qKR4gnVwb5PhdTsdyMTvOo4pKo5+bjEdvOooN8T4yMQxRCzTxgQkT16536O9X3JviVHZn+9GbLcdR/ZvQ4VSQvHNeGutBJVW0Ta3bmlIbISdaZ0SHprMsqUs8zxJtAPHhvWwQRiwWXRSkKGyvtKdV44amL55CWyqzIAuCqtNuJ2cFOPrLh8Gu/TP8hXGpnpWrwwRvoga8IhKLB+IbJMionxtTe+DTzvY6OZJD/BweO7c0Ct03muxRfIo8ihBm9bvTWCJAEuBlL6KOlXm4PnA67OxYHqJ7JdDOxqJtHwNwswg3cuxQPIVt4//U3X3+3pM4tpEG5LYA+e296jVyYwSmm8eowdM6z53VtYYi8D3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(396003)(346002)(366004)(376002)(6486002)(16576012)(316002)(478600001)(2906002)(31686004)(53546011)(4326008)(66556008)(66476007)(8936002)(956004)(66946007)(16526019)(2616005)(26005)(86362001)(558084003)(6916009)(186003)(8676002)(36756003)(38100700002)(31696002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTVYVGIzK0dTYTUva3FtUEVRekFXZFY5a3o4M2NJRXQ1STR6d1U2V1NFU0dH?=
 =?utf-8?B?K3pyOGtER05QbzI3R3JleEZkRkZlSmdWTzFibjkwK2d4UDFyNWZ6VUVuTHk1?=
 =?utf-8?B?c1pkcGpGajVBRmVCYnl6V1h2RXA5OFlEdEVOS0dOb3ZWeTNDaExqOVFWUGNw?=
 =?utf-8?B?WFc1dk9pZ0ZjUTcyajdEdm5tV0RoZnMxTW9oNFJVQzg4c1BYcEJLTVZrOWp2?=
 =?utf-8?B?bTJtQVM0VWNQNElkNi91L3VUNmNCUjh1TjVxSXh4QS9XdHBPcno1cmpITEEr?=
 =?utf-8?B?dk5BSFI0aGwreXdxcWliaDBMSSs0ek80MnhXajBhTEU0VUJPeXFEN3pWaU44?=
 =?utf-8?B?azVNU3hmVExVVFBqNnVXZnEraktTcjdSVytZWDgwOS80UTdUcVM0TExqR0Zx?=
 =?utf-8?B?dzdid3hzS1pmdlJpWGVFd0gyMTFSb1ZiYTFKN2Z2d2VqMXVZVUtNS3cwczNh?=
 =?utf-8?B?V0hTcDlNK2xSMXJJYlpTcDYyQ3Z3b3p0QlVKOGJPQytuVzJNMk5JZTY0VnZJ?=
 =?utf-8?B?ZkE2cDRWMkFOdmdBU1FxSWQwekE3YVJtWnRwa1pJc3E0MU1UeXJGL1FzZUZh?=
 =?utf-8?B?TkxTUC9UbEIxZ0I4OW1IRWRKcHUxTTVoR0N0STR1TW01cVFUeHF2NTdvUzFo?=
 =?utf-8?B?NmtNcnBNaW5sUUtId0R3K1IxWk1kZmVSSDY5MEk1L2YzbkJ5L2tBUmRuQVFj?=
 =?utf-8?B?UmxBR3Znc3lldkFsekxMWEdEMnVmdW5KQVQxQVNIZGxub1FwSTA1UnU4VFpM?=
 =?utf-8?B?VG43dWQyMEQ2cWNhWjA1UGxEdUNRRzF5RENKQkQ2VFlMMUZvN2c2ZXlzK202?=
 =?utf-8?B?a01pclRkN1NtSVlYV2tpQzdCdzRiUUZnditPVHY3clYrWjRWeVMvNEJQSkN1?=
 =?utf-8?B?ekJ1eVUrLy9pZWxnVEErK09JR0xRRDRtOWtiSk1iOEtQd2FMRTlTdWVybGhE?=
 =?utf-8?B?RlNWdlJSWHAzWUorbzFML3N1NkJRQnBleUhrR2o4azV6eDYvN0VXbk4rMjVK?=
 =?utf-8?B?QnQ5Y2F1NE1VQm5Gbk5lZ3FDbkRiTG9GWDh0eTRIY2o2djRDeGVJM2NZRUFp?=
 =?utf-8?B?b1M1OWs0V2ltbTZpdVcvazU4eEI2K2dJS3MyYkFJV3pSVFE4UHdXQy9uRzFX?=
 =?utf-8?B?VmdndHlrODJaQ1pEUEFzM2tkSFFkRzhIZ3FNSlZhcWJzSTV6Uk9TajF2bUNu?=
 =?utf-8?B?NmhScC8vdXB1dlV5T0FGNEhoZ2tLRk5ybUZlV0htb3lRNnFSTk1qR2hXZktK?=
 =?utf-8?B?ODd6a0JGalVNTFBJYXZEWStvZDJrejVmYkVvcE9TWHVUVkcrVmxMMzhjOXRy?=
 =?utf-8?B?UVBreDVCZjlvVkduWjBRUGNxazkvK0E4ZzM5emE3V0dPL1U4RFdXWTFxMEVl?=
 =?utf-8?B?YnZxK0l6MWVrVGFKY3hicG50YUZDbFFuOUlKay81TlErRjlBYTM0a2xuYmtY?=
 =?utf-8?B?Q3E2c08ycysvcTJ3aHB4Tm1PQzdWSFpiWFJ5cGxEczlHRS9hZFhWUzR6cy90?=
 =?utf-8?B?dkhJMEdoR1dUbkcvRkpHTjJZRWFNZUZOWVlCMjd0WkhnSXJzVVBPUDUyUkh5?=
 =?utf-8?B?Nk82YllFa3lJS1pQUVlzRk4zZzVvblAxaWQvelFVSTlsZk13RnZ2VHRNNFE3?=
 =?utf-8?B?dHFQRmsyWGUxTFAvam9HMnlrclJKNXlORDhDc1RXY2FNRHpnSUdUMHBaNHdS?=
 =?utf-8?B?V2t3aFB6T2ZUWUtGRE44SXlMNlRKZjJTWnBvajRYZUVlMUROVWJqdkppSjVv?=
 =?utf-8?Q?9baWiJRpQ8AHWLF42qhrbyoK39hElj01a1wrUtf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b89e9546-3625-4765-d568-08d92efb25d1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 06:10:45.7342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSDjdUnStz7LrXZMJo9AB2Rid9agGrMnHUahxc7+mTNLIJ9yMdSGubavronUoy7H2wa/ZNKpr/fJfEipspkfgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672

On 11.06.2021 19:02, Ian Jackson wrote:
> CC: George Dunlap <george.dunlap@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Ian Jackson <iwj@xenproject.org>

FWIW:
Acked-by: Jan Beulich <jbeulich@suse.com>


