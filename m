Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676DD52A6B1
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331117.554595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzCF-0007qd-Ib; Tue, 17 May 2022 15:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331117.554595; Tue, 17 May 2022 15:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzCF-0007nn-E1; Tue, 17 May 2022 15:33:15 +0000
Received: by outflank-mailman (input) for mailman id 331117;
 Tue, 17 May 2022 15:33:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqzCE-0007nG-1I
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:33:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9e21860-d5f6-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 17:33:13 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-ucPLCAi4M0u76HfVOC1xbQ-1; Tue, 17 May 2022 17:33:11 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6920.eurprd04.prod.outlook.com (2603:10a6:20b:101::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 15:33:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 15:33:10 +0000
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
X-Inumbo-ID: a9e21860-d5f6-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652801592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8O3mSKBETLXGP54dCXlFDK0kcF/XfGq7uXQKJ5JjKo=;
	b=K7L6M268JQWIOQHo1/JNO2Lx0FD+FUPgUsr9YRwhnjuOPQTVfEJ4xakKtMwgvz886mNR6b
	wQivFsT+8OeRaVSRyaIPf2TQhLp1S81gs3AVzl/PMvBDtaNtZAW5SB7nBTNgPbKCateWqD
	Cqkivh7l92njWEu26qxyduWK6ZoD1VQ=
X-MC-Unique: ucPLCAi4M0u76HfVOC1xbQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZJXoAVaQueZYV/9dBG26zlrwmEZ1lGxphL/YOW65ILQT3IXe+DWxQXxBAf4a5kOGBKon2dRmc5IVM7Ps1Lf8wKABkCT6rOkXFB+LPdr/hRjURBDiOoCeniWibKjRBNixHZNwb4cZLEcefZQZBw9GNv/RB5uc10sV/ri/syEEpw9WQoS4p+wka4kuuJrJO6XwmzfHpDYaPSEcFhk4VuGBRk9wBwJuS/g83euaooVsmj66Fzy4VHxCNwwyFrKDtgGsf/ixepZgf94Ins1d3ZINTgSqwus7bJm3XMDYvLhsOhgoPCMqgt9asz1P8OpgVuVUHiFs9sKU84K1IoTR+MAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPomcrMHyVS4yEhzFuY5BqzsedvZHUZKTmP9f5LQiEA=;
 b=jJ3PjPf+ps5Zn4SXmIWgq099hxObnqJue65uOA3yISoK0j6+rqIGGxY6C4TsjRtsdKe57/oTKSmW183n0Yu+UP8otRbAbOdM9vnaVW7rkMvQkKrA/NmFvtxzERbWknk+8B8nXwM24ycyNvGjXVMoDPpUSSNUqdFWDqhHN/ARmSpJtodc9jKUS/sesKl21zWoKhzKK9Z0NH6hqc8ysrwJz/DwYMSOg9o6KFhEZGbJ5ZBGOfuc9+Qa1j2X/5bYUWK3+jwmneO70I+i7hflMiP/pKAA66EDR4H3PV0CL3OvQ/0VdfNgHsyrqQIDufS7Xr0YsmGB7/UogDcGPo9R3STuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a08cea0-741f-c60e-02b6-71dbf0c8b0da@suse.com>
Date: Tue, 17 May 2022 17:33:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for
 HVM guests
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220517153127.40276-1-roger.pau@citrix.com>
 <20220517153127.40276-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220517153127.40276-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0134.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::39) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d722526-a086-4bac-cb09-08da381a8ca1
X-MS-TrafficTypeDiagnostic: AM7PR04MB6920:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB69202D9A3C9F12B123B10CFAB3CE9@AM7PR04MB6920.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pqQ1/7n46cDu0lHWGWBkm8F2SNiLUdKSwyWClQcRmZGL7Jr4qEIOUlIO455Z1tCQ4XDSbVHX6ze1E3uTB3rimEc9ynT0oxwIErGasCskLMIXfJw6pO0Z15uWmVoTDBEhpN5trvaWyP899EWaKF411z+TTU1WbyKmuivLxDYCgNbvXs8ka65BpQorFAmbTKtpapJEKPu7dkDPuRuuJTQ+Gs93Lw9egftfgcyNUgmx9CgeByuJ/G1dqKwLgOLzgVcCajPR2epeU/pHCqqeP24dSYsh0roc2vXCsEucMrNP08e0fbns+L68rxRu45KPjGufmqEjRpZsMI7CHAtuNkLNbXxZmfCV3gfSPZJaY+e86CxjoMefQ4YiDpRhlCIuMao0tPJ6jA//mNsCeNhmXPEBXE41us13qbwBwLhLZxfEHO76eZqQsw7/guZNSCXvtZhhWs2iBEX7HMCwV5I03Sp5feXc8iIuBBP1sggbDZyQFvoMngQqSs2yuvHTtNvG7PeuFWNdLnF8hgInfW/EWAfoqghJxpHZ86BRq9D62HYmbE3ob1VG+Ddsm3175/w6AuMb8A78v82yxPuECePX9iLW3ca4uPUHwlYzzB0Z1/Ipc/bxDJ2isA2ffm2caGB0JwfMGiZb87cgOkjM8IWgxtbsuoYTQNFC1b/BswvYOyapOnBmdUNgUXUfTXNAtEdy4b8hhuJLLFrukvy8T55Nwn1Wn13N0J+wzBhamEucSHLP2kIBUJVOCQOqLbltinMeHSlu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(8676002)(4326008)(66556008)(66476007)(2616005)(31696002)(316002)(86362001)(4744005)(83380400001)(8936002)(5660300002)(53546011)(38100700002)(186003)(36756003)(31686004)(6506007)(6486002)(26005)(6512007)(2906002)(508600001)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5I7ueWxFtPw7QswKQ7+2F2E7xiPGxHXeQ7Z0KGWl4qdutQE0E54B3jjVefS8?=
 =?us-ascii?Q?Br9uMn3vny3oe4T2uJAGYh17JAnHIQuvt73MZ+THZHHj5FyCtXM09C25UxmL?=
 =?us-ascii?Q?ufAIE8IberNS3v0g8oKLTrF2g9d/s/+F4eaRco6AMB0T96Xmon4gq6AJSDNp?=
 =?us-ascii?Q?dx2L5kEYjilokukVHGLJrPuM7nrn//734hCSVNW+1sBw+WPbZg+Vq2lZEXtk?=
 =?us-ascii?Q?ceRziXRx8dlT6KfWh19C9VRzGbm9nW6lclCBJRQhTjC79vJPefqRFP9c5q1d?=
 =?us-ascii?Q?U27EPT0LknDlrqtw4hEN42iHziOZmvkwTNViqXl2i0rFvpsSpJO1SFjNvRNx?=
 =?us-ascii?Q?AtkbFoZi9/SleVHA2+/vZ6RLJydZmg+In38PyU5Ib7t+KgVU++GtpIakk8hh?=
 =?us-ascii?Q?p8J1s3dspOQpYIMx87dfHYvWe58JQR6yzdkcdcTHk351FwG6keOI+3wFo027?=
 =?us-ascii?Q?UHqx7BKKepMdZG7GrFjIbYCd0keQrF8ucUnfdhRo5q9yENW5Tdow6JpryWQP?=
 =?us-ascii?Q?L2x/t+trLpyLVMilytbu8WX8ITMOW2RUVkdu7NypAfdbBxX6KrGGwNioRZBa?=
 =?us-ascii?Q?xbi9xPB+YRLjQTkjLapQXrc0DFT0IGelv8SJcG/e78MGS1ERIz5BIBvYVOoR?=
 =?us-ascii?Q?jSYTk5GTh9JI2NZhxK6r9w5XW+KF07ng++shnXu++np8jqd7jpDu60oOA2Gj?=
 =?us-ascii?Q?KPi1a0rkGL//mZkV64yZuQrD9noqDzSAH9Gjog+c3X1U8tWILcL/DyjIZLpw?=
 =?us-ascii?Q?WeZgdSI1CuY+hrNssG7o/E1lSFrTUPeM6R5ot7OC1qB3uVFphvhkRuQfP9x9?=
 =?us-ascii?Q?p2rDvlDZNjqXDYCAectiRXX0no/q0g4wGnuq6MescKmwDo5+TgC9HM8wh93o?=
 =?us-ascii?Q?/eE/A3s71/HOZzWQWIV7BMfWw/6jOWpa9f5uslOWGcklw0bkZRVKqFKEESiD?=
 =?us-ascii?Q?cad5znmleRRF++7ENMpdwiYO/h0WworMbyJEPeiM9TQL4bw/bjPuu8Vg4r1L?=
 =?us-ascii?Q?OahkA6Ir/n3hEiqT2UDPt4lG5grt4+0xTLbM56nhUW5RYZ7ZivPxuXh8SEIw?=
 =?us-ascii?Q?QAj+fXFVYm3I0iOrApJBNxMj3DiiUfxe9KJxOfED43X+B1bK4m4S9cPCiyaC?=
 =?us-ascii?Q?tZgaJL2mahv2tCpDwbZIe5o8aBB4O3hiyevf0X2q54n0YTge6VSfAve1tUon?=
 =?us-ascii?Q?Epgc/a9FMFs30ldJXC5IbSLN7AsSOUOo03v5uKvRfm32fRVvuNcVT252uLUQ?=
 =?us-ascii?Q?eUzy9JhKIw2wyXIYNNRSBnO/kZYGAihMteD+pI52ahN7Hftq9vKRTcENJRHJ?=
 =?us-ascii?Q?WlhOpuaoEdo0iXLjsM7Mi+HPxXQP2DoCIRhdwHo4+FmrziG/ZCREmBKfYi+q?=
 =?us-ascii?Q?518lg60IEsDKeh2C7zoDG4/Bygk0pshI1wzXPkXLYvU9xwaOo85lEuYqs/iT?=
 =?us-ascii?Q?Dd8RT4EsAlAh0bL7pBXtiueqU9q7YHPleuV0ZxNiwIr475rkPRnJkOLlFKxY?=
 =?us-ascii?Q?Er/8uSQHj8F3Ori2oux9vxWw3vQzTKt7a6TjD7qppD8ZODGmyGxSMEaxST4R?=
 =?us-ascii?Q?NUlgV3yWmsakvHMXhu8fN7/ycf/yxCO63fImLscaHGatC6pF99uO3KpFSnU5?=
 =?us-ascii?Q?rXUysHirSX3MPy3FpnTG6WP+qG7zIQsZfB/pNU+0vRdmj6Vq0pjBNJa/3+s8?=
 =?us-ascii?Q?qaKcfjTw/Cg5x0IxEBC/H2HxeoTM0ywf52iHCkaEDw3LzgkKRSQCn+rvnjVm?=
 =?us-ascii?Q?PKVvGNcEfw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d722526-a086-4bac-cb09-08da381a8ca1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:33:10.7783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75Iczx3iJazL97ZphXMvivn7LQEIBUyZdBbvhsvK0OhPD6oYnJ9G9D9wFJWWmt7G5n9HcYu6FJbqXCmG2desyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6920

On 17.05.2022 17:31, Roger Pau Monne wrote:
> Allow HVM guests access to MSR_VIRT_SPEC_CTRL if the platform Xen is
> running on has support for it.  This requires adding logic in the
> vm{entry,exit} paths for SVM in order to context switch between the
> hypervisor value and the guest one.  The added handlers for context
> switch will also be used for the legacy SSBD support.
>=20
> Introduce a new synthetic feature leaf (X86_FEATURE_VIRT_SC_MSR_HVM)
> to signal whether VIRT_SPEC_CTRL needs to be handled on guest
> vm{entry,exit}.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


