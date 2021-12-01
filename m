Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B092464C1D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 11:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235852.409098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNF8-0001Yt-U0; Wed, 01 Dec 2021 10:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235852.409098; Wed, 01 Dec 2021 10:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNF8-0001Wz-QZ; Wed, 01 Dec 2021 10:53:42 +0000
Received: by outflank-mailman (input) for mailman id 235852;
 Wed, 01 Dec 2021 10:53:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msNF6-0001JS-SG
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 10:53:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 652bfe92-5293-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 11:42:35 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-FgZvrVmPMySAsPVC5_PT4A-1; Wed, 01 Dec 2021 11:53:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 10:53:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 10:53:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0107.eurprd06.prod.outlook.com (2603:10a6:20b:465::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 10:53:37 +0000
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
X-Inumbo-ID: 652bfe92-5293-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638356019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0OKNfDnsUjtw+PEZVjp549hJsBhAjbhkyxNkaubCrTw=;
	b=ksPPHNcVgyP7OTl5f7QeT4eqRoyop5MQcbEspB+6ZldaTGQb32NTBsIajmFObzosBbdcpP
	w5XoZPw00SnSdtsNm/RSvjkc4EWP5nxSC+POc3QIyq0hYobu71H+i8QPfk9Q2VYYSUg4ZS
	Y1r/rEqPKJmbvNaoYQrrxqlzGWxHMGo=
X-MC-Unique: FgZvrVmPMySAsPVC5_PT4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJBBbvD0w7X4v3pY/jwz8YMyceXAaw8Vq5k63hcV2BNRxC6V5BFPlLX/cg6NtTX0bFHphr/2Vs0lbTxaUdmYCeP9Hf5HE3s42Jt8V6HpKWz645lM9mDGDC8VBJIF+o4wFUpGZ0vrQfIhpyfz+J7bJ235IgWP7Su7i9mqDMg44e35PdoPZogX/uxHPmq76Aeblx0IX+ixIZb29vxU43RMNB5rIOPbkzBHMKLiqcBzc0N7r4oIpxobVR2l56tpNE6obEIbNouP6rRwmHVVCNgr19hQN8/XiHbCJt3IIupRgGHmNicvQj93aImxQ4mP2fO8V/Z5Um07GvcgkRDZerCHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OKNfDnsUjtw+PEZVjp549hJsBhAjbhkyxNkaubCrTw=;
 b=e/IEfBMBeEA03WImd7WmMt1dpA9nJkbjXdZRjLJR6RqqyO8iPSt3esURIz0W1Y0ErP6ApGd2vd6J9COc8ytYM0GNOjT2Sh3Odeh86fg1Ew+1ZdMgX98N3zO81JNRoNDSefPlEif8si6xL/EdN2sXw4kN3HiYusKQvDTTzKYW2GjggyT2zq/X+5cMQ9/v7o6sHJogzKWPreqY6Bj/oMRE6uvH+YvxA7lEYfOU/X380SJeey3FfqL8jmMNyxiHaDtq9f962sggCdQoXfdHWA4DGr7veeoYRBtwfOeccVC2/b59dkLOnsIynlduSVJ5uUPNDYqxVFd/EgTx5gzy8iFeRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ec2eb9c-a4b9-65c3-3751-3a7fb9b760c1@suse.com>
Date: Wed, 1 Dec 2021 11:53:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 2/4] x86/PoD: HVM guests can't pin their pages
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
In-Reply-To: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0107.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf323e91-2674-4621-5917-08d9b4b8d447
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5741E63651C152EAD0B3A105B3689@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JcK5rrlheRLPTKBLj4VCCKqMgct6tlF0uhZO+eO1P/Vio8ZpAMUgos1dHCBZOWCfm6ok9mZKkHMoygiEYUhzcLoOslpR79F/6rjwWPlDpKdtpFkloMf2qKlwDPJzSKlswvYdC9DhGrdiTupTlOiqsH74GvqEIt+7Yz0QHHJ/4jh+IXuApKEFun7o0BgVM07ryJAh3D1oqhmF5gTonEGy7d/GZzpzZEvaZ2EUK8KaAPpxagjIRxn4cFOvCZqWld3dsTaUwb9cdbTTuoOqSyMSAJPXA1UQFfXRKOKIXxwXDTwhV6iBeCEDElHXddOfQ8riljekEsG73NBS6kCv46WpcAUtx0j6pOmiol9ojIHwixRSBlilJ0I5Hgryf6mUH3axRyONRgj36YuuWcFjUnepsRoJ898yZgFrE65KjHllXqxCKAOCBREq4RU3vslfBsKc49Nr8x6UXE0pMrc/UWrJGzBx0lriHiEkaiJ2WAD+K9LIOiu3jisLAzYPFtgePHlFOeh6oAHW2c6AUZccPYNpfXVz1sdRYO9h4ZyQTjsLAcXGKncmoleq2lolHlTL1s26jwEMxm5BsQ52pZ3BDNeDIpuKZncNNYUZei51TN125pc2VeXm00aVVdVDRnX06mnRvmJUCTO777Sowd48cqfciEEd488sQpUK/OHCfTB5DXyA7DMY0qNWNLq24EGpBajoHwixOqyEpiUmrUegmAjHZ2jL0Jpm/f4uOcXFsM4uir8erDmWcL6M4QbPNwpkiqE+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(508600001)(66476007)(54906003)(2906002)(6486002)(5660300002)(66556008)(66946007)(8936002)(38100700002)(36756003)(2616005)(31686004)(26005)(316002)(31696002)(4326008)(86362001)(956004)(6916009)(16576012)(8676002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk1NaktQK3NqVlVyaVFjTFdpZnlDRlRJaWFlK29PajB1NVdhdDBNYXRkbys5?=
 =?utf-8?B?dEN4SCtSb3VtYmNTSFBMd1dwSEdyazQ0ZFBtVHhkUXJ5elJlNlVUVU1wR240?=
 =?utf-8?B?d2hyaDZUTnk4UXZxYVplQXhWcWJCQjNzOVBjbWo1ZkFtN0lQZy9ibXJmSkU5?=
 =?utf-8?B?MG1ML0NpZXRmdGVpeHVMSHlTRWc1M1Fvb0pOZWwwMjJhSC9wRzR4QW5xYUtH?=
 =?utf-8?B?Szg3cnBmSlU5WFl2RFRtOVZsT2J1VGxtd05FZlZwZU4vQVdRUVlXeG81UTFL?=
 =?utf-8?B?RFdyVTJRODRqM2xUbGtrcGtoNStkaXZwYk1tRThqKzNZV0RiQk5yZkVCdmUv?=
 =?utf-8?B?aWxMSzVFTS9lVVp2OTkrekM1TkFScElidUYyWHN5MzdIMUI2NFdLaXJIV3pi?=
 =?utf-8?B?cy9NbVoyWkE0S1grbVo3YmFhSUtJUmE2KzBzdU00eUdLaTJOOTFWT3prMEdP?=
 =?utf-8?B?c2I2cy9LWWhLbXAySjc0dGQreTRkR3VtVStrUHRMOHpDSEh6RC9EN2pTSi9p?=
 =?utf-8?B?dUR6eFQxTDhlcWVVc1NIc1dZUDlYWEhYdHlsYWhsT0xZZ1JQMjNHSzZWUjJj?=
 =?utf-8?B?Q28rbWhzcVY0R3RnRGNhcWtIM1VNRGR1TDRrQWVjUVNHM1FCQlBmZnFqWFNB?=
 =?utf-8?B?RnoydkxkZTE3Z1ZOc2piRnNPRXVibjgxbUt1MHhYZ3RSaWYzM0NIUmNmNnp3?=
 =?utf-8?B?UUhMaGZvV3dSckVMb2hyUUtWSkV2Sjh4T0E0dWNDdzQzdHZZTFNRK1RZR3RJ?=
 =?utf-8?B?a3FWdGdGdWNNRzFwK3lJMitsNGVVS3NTUnNUWGpLckV6ZHZ0eVQ0TFhrRzQz?=
 =?utf-8?B?ZmN2OEdxTlBZRW1kb2RGZjZrVkRpL2xCU3IzUjEwRVpaMjBzaERpWXJzbEpo?=
 =?utf-8?B?SW5JTzhaL1EzUzF5VXJUbDVPdndkK3I0eERtSnMwNlJYT3BtMXd3UHh0QVlK?=
 =?utf-8?B?QjRBTWNvc3RPZmZ4blpzeHR1eVNYSEJEM2tCL3F5T2RhWjV5WGxzdEFCUEM5?=
 =?utf-8?B?dzVvME5VeE5RbFFuc0dKckJSUmJPc0wzWVNqemRQem9CbmFDQ1VnTUEvNXZ0?=
 =?utf-8?B?Z2RYUXlvZWtWdXczaUR6QTkzZGlMV0Npb2dOMEFPU0tsWnEzNkVpY0FXaDJx?=
 =?utf-8?B?UzlIc3EwVTdnRUxpREFVWUhnYzdQdE9QbFIvNDF4ZUwyYW5Tc3NWTHA1NVJv?=
 =?utf-8?B?ZXdDc3VkTVcxaUtNYVU1N0tJb2MwQjI1M2wwemIwdEtXdU01UTdRUlRGbmF4?=
 =?utf-8?B?d0dNbCttK3RNVERZSUFsWURwM2tNVXo5eHo4MmVLOVk2UytJYk1qOUtQd0RU?=
 =?utf-8?B?b2c5RFJnUmR0Mkg1M2RoeVdsRFQxeFJqdTdWanM0U0JSbnozdkdGaDJIVHRi?=
 =?utf-8?B?WmN0NlVBRGhBamFraFpYV1B6dTZsSXRwQWJESEVBczU5WWZUbWVpbUN5RW50?=
 =?utf-8?B?UTdYZzI3UXZha3ZpRS8wbVNpUUR4K0Q3OVlDc2x6QlVZQ2drcCs3ay9ycjNS?=
 =?utf-8?B?ZUhob1ZsZ0F2MnpBUG8yWi9vVXk1Uko3K1E2anQ2TnZiUzhsWlRBbWswbFNi?=
 =?utf-8?B?U1lBZzAzb0hZa1IyTzk0YVQ4L21HQ0JDNCtia3hlbG1VNHFyazU3Y2RFZGpN?=
 =?utf-8?B?S0M0VFB4MERBeUxWNk9kN1E0c1VhWVl4bUNvS1VlRFovWkhMSWJkV0dDdEdy?=
 =?utf-8?B?Nk5saURhczJVQldYd2t0TEFmQ3V3MW5YMk9ReW1GM2FKTW1rYXpqaTJ3SVlZ?=
 =?utf-8?B?eEFhNUVjbFBvSlRzUmljN0dYVlh0cy9Ba2RGRGZHbFVPUEVlc2VCUDF1MW9C?=
 =?utf-8?B?aUFCUCs1LytoSGxIQ2JoelZqUzJQRkFXZS96YnI2WE1MbElRelNhcTVQWFR1?=
 =?utf-8?B?aFl4b1grM0Y3RWY4bFNFYlB2Y2JOK1FicHJPNGwzV2lVeDdqTDJuUXh6ckpT?=
 =?utf-8?B?bUtwK3h4cGFOK0dzQ0dBdEh5VWpjUEN1UkNpQjgwNmpQTnpSUmxHV2dIRTRn?=
 =?utf-8?B?MTI5Y0lXa3BocTRVOFd3bDhoOC9BcFJpR0lyQlduaWF0SlRQbGkwODZlQVdx?=
 =?utf-8?B?YjJKcU4zVnhyZmttNkJwYXFNOElnU3g1Nzc5WGFkVjFaUkhKa3U4Uk5wc3hZ?=
 =?utf-8?B?WlhaSjNibUwzSUhkVGpPQTFRMjErclloYldjeldEaEVwNm9qT1hxL1hBQ3dx?=
 =?utf-8?Q?I4iKWdBf4ABELio7SMYgJTQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf323e91-2674-4621-5917-08d9b4b8d447
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 10:53:37.9252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxCtCIvilLraJpxPKoTcFeAQn21s/cCQebirkaoCfNgzTbPwhzCFjchJSgudAWhJqMm/ZTg9jNqtCnRCSe6Thw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

Pinning is a PV concept, used there only for page table pages.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm actually inclined to hide _PGT_pinned in !HVM builds; the downside
of doing so is some new #ifdef-ary which would need adding.

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -260,9 +260,6 @@ p2m_pod_set_cache_target(struct p2m_doma
                 goto out;
             }
 
-            if ( test_and_clear_bit(_PGT_pinned, &(page+i)->u.inuse.type_info) )
-                put_page_and_type(page + i);
-
             put_page_alloc_ref(page + i);
             put_page(page + i);
 


