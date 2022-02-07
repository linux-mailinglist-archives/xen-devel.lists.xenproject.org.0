Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75174ABE9C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 13:42:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266807.460515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3L0-00008c-OI; Mon, 07 Feb 2022 12:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266807.460515; Mon, 07 Feb 2022 12:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3L0-00005L-KZ; Mon, 07 Feb 2022 12:41:46 +0000
Received: by outflank-mailman (input) for mailman id 266807;
 Mon, 07 Feb 2022 12:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH3Ky-00005F-Va
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 12:41:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e354091-8813-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 13:41:44 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-TE3A7iSROz21CoTMATeUGw-1; Mon, 07 Feb 2022 13:41:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5203.eurprd04.prod.outlook.com (2603:10a6:208:c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 12:41:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 12:41:40 +0000
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
X-Inumbo-ID: 4e354091-8813-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644237703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duSxtW2eQ3TsYRP9Wn9zG9Pu7EqttDmD111mvNROXkQ=;
	b=b2nHT/PBQmqdPUUXZ3nJJEZtnrqIF4gHEVrWlWoAxZFBsFh2SnxZ+vn9d/sonbiJf2vmQJ
	5JRTeoHUXJnan+sxwAP/eqxD02TJzvDeK33CbcwmrSHy9hafAh2t/PYEgqyfg5n/A+AL0S
	gs+WsdxrYSA3EN+B6PfHVn+lTuHYUSs=
X-MC-Unique: TE3A7iSROz21CoTMATeUGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQCsllE0Hr2fcXSZy17vYkKMECY3lg4bHblaehz/CRN4f56IzIEItqTkace1I5eoCk5kgaFFfDrsZKgJ4RJ3p2CR7cW6zdmoQjo7lEx1F6pNQw+XSuslnjVSzMKBXCfsHQu+C6PvmQnKiAe65G8pKWCpzWEUmtEol0LZqUdwcEwMddrpyvsfqlGzWrT1ufcFUKw8IMrLGiIf9gl+e865Qzq5RP/6S38xesudmEvbmZWG4BfdVKFrevqYU7weRRpY7kO/tMn/SqHjmbItEHuY/3EtG9bQpXe0+g67tpSyzMcL4m7y90xRMqPXGjUwwPYDJnJti+DPbr8glXbwwE3kYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4R10ktZCtmCirU7Gcu/ja3tt9ZkhyyzH680Pa3r7kZM=;
 b=D2jw4KblAs62Lte/8Zd8054m3hXTCQC/sYNbTDgfXnBwBE4DvPKXcYe3At4SmDORIO9+9j3Lto5uW8dDaEIGDiRXeooWdRyuZOxVVtCx7kz7ZkMXAmIqfrTN7p3mCZOPcYPVR3Ka+0VvSpRN6uC4gTATXJnbLI3OmI2byrjFfDhJiXS1YP4wv5JnakfB3KNPRGSC4lUnYxzbPP7vcmkHaUHvsXqAF/RXpY2vGBquRN3JGV/DOtTbbtnf2vWUgPBEN9q+MqrGvwPs4IYvqMMUMeomICFYtxIxmyYgUtF1avKwISp2LeeQUumvX8Vez0+MU9Dff75CXpfL7T5d7De9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66b9fd95-bac4-55f7-2f3e-701f8444f37f@suse.com>
Date: Mon, 7 Feb 2022 13:41:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] dom0/pvh: fix processing softirqs during memory map
 population
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220207112008.51085-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220207112008.51085-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0311.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b183020e-fc86-49b1-bc44-08d9ea37303d
X-MS-TrafficTypeDiagnostic: AM0PR04MB5203:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB52035CD73EB2E5B54ED33373B32C9@AM0PR04MB5203.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WOm3oVW7tZXyaAbZrWs+HCeqJgRrq8M7AcDip7vw/teiQMNSgygdfv1Fg+CAKF8QDzVTFGid/mRUw12nq6uhzKzN867j/kQrbOBEWO6C3RJC8FFAcFwFprZ1t2TSj9ttzolt60Away2MS0bT+hRHQS1wf/B3PQIc0/fKAFEPnUJTRXmJxPK/l68MFNOOEpXcvHPRA1ijh7OoTMUjvRUsEC94JSD4CNLt/w1K/hFER7eKUC2CCVVbtklAN1TzKwxT/UN4IjJIPmKXAdwATUraL2n8UKaalPHDcqV5AeDhppoY7o5MBpB5LHB3joprELGivTubaBa4ivc5HlUoOB6+fAPlupbt19gZLwPHT/3R+BOWOlGDYv4jsF83+BErrXqqYy+1rmBzJ5D39/XgG5QPuu+I5H21ttoMQbR2n+xQABBzgrRiLkZPqaL1yVDQ5OzK2DTbkvido5mrcicnLuVF19kktl0bG/6rPGS217+QkLC0Or29/NTBFvUiPUkeMXLM1Lm73mbF067wlvxx8OuRs3Dg7ZpWQc/vpUX4MXVrMkFVd+Yqwg17SMKUrCr7jG+ctrNpuQAaFKapb8IieYf9kr+a+2Ku+dudUAmnGIX3G2yfz0HA0AhvS+A05hyq61OFlJiH47nsgpmtr+M7UkKyGS3oW0ms7bD5qNUshZM9xObvJOuRozQ+YhylfJ2ELUpjLm6eYbNS4ynoPfepz4GJyh7z/zzgYIuRHnFN27dPoRE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(2906002)(38100700002)(6916009)(6486002)(4326008)(54906003)(4744005)(86362001)(5660300002)(31696002)(36756003)(53546011)(6512007)(31686004)(6506007)(8936002)(66946007)(8676002)(26005)(66556008)(186003)(66476007)(2616005)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PxvFY4HB6SD0fu88ErbF9MhFB0Jpqj9mvbq5XCl4libW+TEhpep9F0nOdgW1?=
 =?us-ascii?Q?MeFwx+ehl6E9hRgKuF9ywWZ7FDeiFHLtO5NB/sB/BaUgnfPT96b6/PKuSON9?=
 =?us-ascii?Q?8s+uVZCXkR1JV445k5uRo5elztIwsWZjXcYn1woEz226aBnAUgqCGPXijaq8?=
 =?us-ascii?Q?5d5zidgyuUVDgt5sgKBgg8gTr1J0VP/vSVvO5TWyW66T20UIHVtmtAp+05BB?=
 =?us-ascii?Q?7ULoGnhwSwo5JJ6eFuxFUumIgmj6BC+/r88mlClp9Plj22nZWAgVU3VGk6Lo?=
 =?us-ascii?Q?EP2iuHhlzY4xkMeO0WSP24HeIJn01gWgwHMa/m1VtcphVPnd1MQhPT2XRbjz?=
 =?us-ascii?Q?OQUYJKiu32iqlmCGWrpp6y+BwmBjSYPjB35I0m0L3MpQ6AYgD+zFUskn7ISY?=
 =?us-ascii?Q?IkIl5J4cFgJZ411j6/014t/Le6A5XQKYAWRiuslxn4JV2EpRpjOi3875pVAV?=
 =?us-ascii?Q?6nGXEBsglpOj1M/HoBphUoLE9kO8zLMNOLmQYoLtydKZOEj3OaVYNPzG35GV?=
 =?us-ascii?Q?6HXtOjE7tpZzhyPcmi9JMspJ9Kj1oAdCSg3JoW6jmwXYTG31h5g+CfcSFPWY?=
 =?us-ascii?Q?q9cWNbZUC6RVMED0fUAIcPJs23JGZuPp39rZYJ1KG59QrvmSr2or+/561OHt?=
 =?us-ascii?Q?3Rfu4KZuLqaePeigQ0hvmCJcDMHCLjqIpDXk63qtlNPiCMp/xdsXEchAeRu2?=
 =?us-ascii?Q?ncSaalpv1E/Nwl/vr1davIyoItWMaNd+lT+0AYe6rqWKhyfafjpNMUf/FG6A?=
 =?us-ascii?Q?eiz8mn/oPnI5/QcP6zWGMkDqcTh+5em0lmdTCKmcej4rrLDHBvmGqnpj2QI2?=
 =?us-ascii?Q?AlNAeXmi6A9H3v1XlKc2dhnL7zqYZd1Jvq0AkNh6sP6GCLV0ZLQjp3mQsGaB?=
 =?us-ascii?Q?lQk/6xLH9IiZLch9c7bJA9WwQ97w6nDi0FZCFoAfAZqh6F35nDtDF6nQZlj7?=
 =?us-ascii?Q?QL0fX1eVDxIlR1z7FeVzF503qOwl+Jk+5jvTTFA/Aes+WWVLhQhuG/6i+xld?=
 =?us-ascii?Q?60t8STIjfvZqmQ9giwBlN/OoV36zpfGpfDuveI1nYfRZWhJIFMMHCZugwtCa?=
 =?us-ascii?Q?4bIH2U1kNNNHEjIrqmtMcosUcbbBw/QQq5Fxnu7Kj5Xk3rJHmy0Haex207i1?=
 =?us-ascii?Q?Zv/DmCBBsc2McHdmHexJbpuiosBOZt3rry/qci/2PhOBHriD1aKKHm3SGUJZ?=
 =?us-ascii?Q?bhrJH1E9zRr8kIk/Hs5wRK1IEuk/F0lH3n/OkStwV6O946rUfae3SJvEBrqm?=
 =?us-ascii?Q?zlCXS/2z3i6StRE29SBaHpPymWopoiiL4rA5k/RIgvFMGp+AJdeRZzu63mcp?=
 =?us-ascii?Q?znkQuVsDWHcdJ9z99H7F1K0XnYpGk3SxE5uMlYSXgSmuV1fr5mI1xvrshNcH?=
 =?us-ascii?Q?8c24fKxodKD4e14dUuxfsBLH3UE7NMOa6HL7bmwPeBuoi7U8gNI+HGTBKPNL?=
 =?us-ascii?Q?HU7HuYVrLnblcmjE+GIaPTJirDaOb1aZmhd49vD/1fzjKDc0Y8ZiF0dgjzBA?=
 =?us-ascii?Q?PkuwOPmoLn2TVWNym31CAXGZDRliAgZnhWYKNqR7STIQScuUHDa8G8ME5k7w?=
 =?us-ascii?Q?jpSWk9h0aFKUrAa2ItOLxyZ5UG62CmiQM/aS5TEFbhk4p1bJC6f9+nvUxnW0?=
 =?us-ascii?Q?zvELzpBgXLXvdlyqGD47CF8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b183020e-fc86-49b1-bc44-08d9ea37303d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 12:41:40.5120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sc0r1Ff18pmJ3PhxfIKfbRRBK7NBfNPqtDHMka97nMxCcDwo3Cy2qAEaAnprKRjSeBq6Qgl8ISZCcK/5pPJBnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5203

On 07.02.2022 12:20, Roger Pau Monne wrote:
> Make sure softirqs are processed after every successful call to
> guest_physmap_add_page. Even if only a single page is to be added,
> it's unknown whether the p2m or the IOMMU will require splitting the
> provided page into smaller ones, and thus in case of having to break
> a 1G page into 4K entries the amount of time taken by a single of
> those additions will be non-trivial. Stay on the safe side an check
> for pending softirqs on ever successful loop iteration.
>=20
> Fixes: 5427134eae ('x86: populate PVHv2 Dom0 physical memory map')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nit: I guess it's "and" and "every" in the last sentence. I'd be
happy to adjust while committing.

Jan


