Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CEF435E67
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 11:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214265.372770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdUov-0000lW-IU; Thu, 21 Oct 2021 09:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214265.372770; Thu, 21 Oct 2021 09:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdUov-0000ja-EQ; Thu, 21 Oct 2021 09:57:09 +0000
Received: by outflank-mailman (input) for mailman id 214265;
 Thu, 21 Oct 2021 09:57:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FF+c=PJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdUou-0000jU-Oe
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 09:57:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4098c6c5-1b7b-4df0-bb5b-f9ee10cea8cc;
 Thu, 21 Oct 2021 09:57:07 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-WLdd5qL8PU6RCGS4byBPvw-1; Thu, 21 Oct 2021 11:57:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 09:57:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 09:57:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0138.eurprd04.prod.outlook.com (2603:10a6:20b:127::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 09:57:03 +0000
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
X-Inumbo-ID: 4098c6c5-1b7b-4df0-bb5b-f9ee10cea8cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634810226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=58hIKBhXICJXlFTMq5AIXN6HCS3Ro5jaiuK1zsxE30Q=;
	b=GWMdwRdhypcQyWgzgN+Rpqq6GTnDR34BH8gBFQdtPsnI1CLV9U8VW41i2gQOGtvALyszaT
	iAcPOctQHqJRYNgRdli5XS/SB39TZMcYQZYIqk+IQaaQ+U/TNY5UQf4IWMZNJ+0FvZSKg5
	1Z7+kDGxNihJpCI50M4DFZncw0TPMmo=
X-MC-Unique: WLdd5qL8PU6RCGS4byBPvw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dS/eGmSW5gaWsf5lyGXRTzwtwfxyL/wZchCBx2Vk44r24t6opTYiN0umJot8eq+xQ1pZv105nWGjD8oe7CIh/QRIBFQ3lC6cztEtpWksXfgjhbW2MzAEwTsBaXdGGd+/y2RTrd3pPPxato7OmCFfDeB38Z8+lW2mKDw8kJlfWHtxnXuHsst9H2nNqElS/pwwofgDPdjDxC6m2ws3KFX1l/1gMGsx+Ya4WgD1Ec094tZ3uJJA4pBJoQjL180S+KmUmpnjBduDdRoQOevGBc01bRvMa4l0ErfKpXrLyV6U7tebIAIWVvp7TP6UbZ5D8pBcQZw8p12A8d+lxft9wrIYLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58hIKBhXICJXlFTMq5AIXN6HCS3Ro5jaiuK1zsxE30Q=;
 b=oPzuywY+quxlRefm5mEbjNrYv1VLrbZ8fFLut8+BO+WHJDnm+xOvThHSP5uzLJfUUY0o5H10/4sK6E7lS0YGtoGrEqGBvD9ntCHvJcAEX2gxQqP/vjmrFHDdtGPbfH15xcdd+MEzxHcJWgcO+2vnx2xwsh4B2/KcLk0g5igFhJBThOh5MIDZkocMtHmtKi1BOO/7A8vCEsTH0/8yX0YNuay03FLFaF9a6ptX13EdCN01mFFfqo+U9HshX+eWmt7Q9VrA5Vxmx+XN2OH2PoSwe9djXUUeo7419SXaJVqgdIdJfSnENJQX27f85DGNnW7kglfwIKoWNwFAA2c5WWAlgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] x86/IOMMU: enabled / intremap handling
Message-ID: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
Date: Thu, 21 Oct 2021 11:57:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0138.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8e0f474-016d-45d0-5605-08d99479222b
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31180B9823433B2BF75117C3B3BF9@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dSvVpPUmecEtI/Dhq9kqy/mjR60JRSSMNAEBf+5y4CdZh2k4LHKiGf1Iyxdm3S/8FU1cuXSUFW5Ias59/6O12uobLO4abq+GJzTHq0pYZbmgHVF8CMC8EEyeg3nR95CCM6wcO0WGlljxflMrhQVW4g7Q2K3Vz2tVsBZISprdW/wrXM5TAU6Wsds3EqzGqGlwJ4HbrAvXe8chtQGSaeE5OZhfTCMOIorT2g32cxbwBd2jCdF0SFqS7hb/4Z4fpaMryBOpRc6y2pEyfLqZhj+QoZgCQGrS1Ng1y+wfOt5s6BOgl9EeIobadxc1Vz4+B4feYs9hydrF4anDZgf/5fink8CAUqsNNSlpDrZmx1xXRf8HUsC1CpPK7b73ReYWAxhO95K8LbOf/3W4m8piAV3vFBRL8Ru3JhnpJ8I9JKDq+AhBfxJuK2SVkPgCmCrSxwimXnyJNl3cUyQa3ZZQrPD+CnMvUfA9OyihFRfXlzgQ3gKcZoGXPM5Phss9qCl46NPQwEUbxtUpipHD/tH2Tu/D6+Pwp3bWrq+IT6BYo/Q/bNj1s1Bl+eHjDMbppMHKQC3HxVk5i25THabpIEhZ3JSfDVSzRyq78iE6f1rxxOoURMYigU98hy8c5yqTx54tRrCch1ybnsczDZJfbIU0xC/0TbIEonbXX8Ikinil5Xd4mmDCtwvtHoGFfyyGqjEdqF3glq3Bh2ddXqzBkK7HtcRbo6Kg3W8wE+Mr6SVn9/CIBWM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(8676002)(66476007)(86362001)(2616005)(66556008)(31686004)(956004)(6486002)(8936002)(508600001)(2906002)(4744005)(66946007)(5660300002)(38100700002)(6916009)(26005)(16576012)(54906003)(4326008)(186003)(31696002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rldxelh6WkdhMEpSN1V1dzU5aHViazUwN2QyOXJxSDNjYTJLcm45ZmpKK1M5?=
 =?utf-8?B?U01Kc2dSRVBKWG43My8vOWNjSFk0b0lCY1p6K0RDVm9HMmp2blR6cSs0cng2?=
 =?utf-8?B?OE5uQXZqckhBYStvTDlsQVFESCs1bmo2aS83VVJyeFZqVzNsL3ZjQzRsYXhu?=
 =?utf-8?B?dDZGMU8wUXV3Z3hTWWdTb3JXc3ozOFVCdTFQdUhtM2c1Q3ArZ3g0ZkpnYU9D?=
 =?utf-8?B?LzZBN2VDWi9yMzhtdEk2VkdlZk9xVVlxTGt6SlgxbjlhSXdGK2h2SGtVaUxi?=
 =?utf-8?B?NWI0QWRobWZaUllYQjFqeEdoMURkYXlIcU4vL3FLSm9IS1RQVm1zKzJQS0tK?=
 =?utf-8?B?bDVQNFBIdjYxZzdMdDR0U0d1VkhJMTNFeTdmWkhWWXNnRllmdFRwV3VEb2ha?=
 =?utf-8?B?TGpvbFFibTFDNUVFU2Zua2pMUEM2R1dHZUVFWldMYmdlNEVLeW1ZZEJLVDJx?=
 =?utf-8?B?MHBITDVnSEJQZUVIRkJ2aXhPUTlOUFo0emZuSktoT3o5V05sVTVFVllONDZH?=
 =?utf-8?B?S3hSSnFUb1FxeUdXdVRVcTc4dSszNlN4L0xOY28wWHl2Vkxyemd6cjhyTVRB?=
 =?utf-8?B?VWpJQ2phZXB5WTJNUWRsV1o5Ulc5TG44NjJFdGxtb04zSGRlK2R6QXhYVXZz?=
 =?utf-8?B?K2NYMDg3N3MxamlSQm9iOEg5WVlwUGVpcXNGS1JPUkdQMlh3UHBUVlJqTVBI?=
 =?utf-8?B?OXRsQm9uVXZUL2RFS01TVFN3VW5SY2xwTDVuNTA4OHJaeEFxT2hXQ0U0by9L?=
 =?utf-8?B?YUx3SVJzaGNHb1JMUjIyd0ZsZXRsYndhakYxd3daL3N5MUdadEZGTlRySkkx?=
 =?utf-8?B?UzI3cDk1ZmRUVXBnSGxNTGZNMk9qK3VoK29SYitUV1BZeDVSa3g3K00yN3ZP?=
 =?utf-8?B?R25VTDNCZXc0bjhIUzlqMlZxVGlCaldJYlc0WVZ3dm1jcUVIMG9kdnBoT3hp?=
 =?utf-8?B?UUVrWTNJMTV2T2VyQ3FWZFl1ZWF6MHl2a0tqNVBPcEVCb1l3YmF0Nk5ZL1F0?=
 =?utf-8?B?UXRidFRES2ZzWWgyUUdXYXlQVUllbzJKMDFLeFY4MUlxcGIvYjZienJMZVpy?=
 =?utf-8?B?WnM1Q0ZKWDMzak1wOU5USTBvaW1sSWp3SFhzUHc0SStqTGdHUjdrRzRUNnpS?=
 =?utf-8?B?UG5BQmszeUIzR2trMXZkTkx4MVpwOHkyS2Fzc0EvVHgyTDlPU05kYmt5SC8y?=
 =?utf-8?B?Tk9KSnNiMDhKSSsvS1FCMndKOFNIcnNxcDZ5eUM1UGxncEMrUGRoaWYrc0lZ?=
 =?utf-8?B?OE5rZm9CRHJJbC9HZnBXQzlFU2h4RnJJVlhHODRXSEJVTVhvQVVOWkRhcjQ2?=
 =?utf-8?B?U0U5VUp3aGs0THd5WEZrZkhGUjltNUVKVSt0VVl3UjJKUWFiNGRzZFlTeXpv?=
 =?utf-8?B?cmUrN0o5NFZxbDBWT0lCWGhFck1ydUlycVpVNS9SM2VyMllZc29kMXhrQzBH?=
 =?utf-8?B?em95SHhjVjh1cmkwQmNwUnZ6WXZIdUZod0FYVTRXanRZQVBvSXlSb3FhVUFZ?=
 =?utf-8?B?a0Y4S0ZFODFLUEFmMlpidUo0YXYvVXVkbWloQnFVYWRtNjUzMU1ubDNQUWw2?=
 =?utf-8?B?YjBNdTFVU2k0NFIvbjZrWEplMEtEM0lhM2V6SEdkV01QK2dqb1dseTlmcEUw?=
 =?utf-8?B?N0t0VU5zcmIrVnMweW85RGpTdHY4M0J0YXViWC9mN3ZISTl0RSs5MUZKMnE1?=
 =?utf-8?B?ZUtlcDdHaHkyUjlRNE1VdFZ3dG90a01pTHh0bWgwUWcyQzNsRmVRak1qZW9i?=
 =?utf-8?B?WG5FYUp4YkxrdktzcFBGMVBic3R6b3lUc1hUckM5UjU4eHIvMHc4bjJyNUhh?=
 =?utf-8?B?L1l2dlIxQnRKQWRTOWpGS0pON3diZW1rR0xTWHZFZEM0T1FXcURzUVdpbTc3?=
 =?utf-8?B?VUgzbkhnU2xWNERIU010UTRXN2Y2UlhQeStWbk9yVlNBYlI3VmZtVldKeWZQ?=
 =?utf-8?Q?Szd5g4f3GhA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e0f474-016d-45d0-5605-08d99479222b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 09:57:03.6244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

In the course of reading the response to v1 (patch 1 only) I realized
that not only that patch needs further adjustment, but that also
further changes are needed (and there's likely yet more amiss).

1: x86/IOMMU: mark IOMMU / intremap not in use when ACPI tables are missing
2: x86/APIC: avoid iommu_supports_x2apic() on error path
3: AMD/IOMMU: iommu_enable vs iommu_intremap

Jan


