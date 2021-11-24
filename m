Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203AE45B5FD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 08:54:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230137.397864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpn6Z-0005RP-JE; Wed, 24 Nov 2021 07:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230137.397864; Wed, 24 Nov 2021 07:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpn6Z-0005P0-FU; Wed, 24 Nov 2021 07:54:11 +0000
Received: by outflank-mailman (input) for mailman id 230137;
 Wed, 24 Nov 2021 07:54:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpn6Y-0005Ou-4G
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:54:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b40800d9-4cfb-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 08:54:08 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-94vEMOxfNHO6aBXPyTQIfw-1; Wed, 24 Nov 2021 08:54:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Wed, 24 Nov
 2021 07:54:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 07:54:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR07CA0026.eurprd07.prod.outlook.com (2603:10a6:20b:451::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.15 via Frontend
 Transport; Wed, 24 Nov 2021 07:54:05 +0000
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
X-Inumbo-ID: b40800d9-4cfb-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637740448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+13BCXAyNHYs2Ox/WODnL1ZpDDuEqkFxsUTr0ND1E8=;
	b=Bth6w7AGg2H9g1NOdOgTsPGSnG39bSnHXVeHnWh66n+eWbZTse5luyPfDdEo4kOddSWXY9
	DZZQd2nDGgKOab3ZLbdPB3etMTdpSaeGqtLShM4+7px5DxBOErf1LsW9ot3YN2Xb97bE9W
	GiEldEmT/yLUggnktQ5fdozyjju+O6c=
X-MC-Unique: 94vEMOxfNHO6aBXPyTQIfw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmpDw1D94v9Jq5nX4M8nsu6kWDso/Gglh2k1ijGfa+rgGMEmxfZNISKv1OBKEf3BjphZx2OX1psPTbNJa3pT11wHDDXiBKErUrHrPekifXuiP4RSRqRCaPR52Yi+mRDelyOuKNyQRSqRweePNILc7ZPEI5NhFuZ4U1UM+qlwE/tYfu3tkk2Ug1f0lQB+y7bPvgTtIHXdv8ISKWk1IIDQ0c2EoFKG1/6sUUSlxzURr/q+eaWSSeygeDIPCHY5LIe5suAVY5mbvQOyKJl0fmb44LyL8gp3KHVZJxGgQDA/pGADxRUxTo0asWZsONmXikO/q7obsH1QQkyl/I0MxhWh9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+13BCXAyNHYs2Ox/WODnL1ZpDDuEqkFxsUTr0ND1E8=;
 b=UfyX8ZIYHC50yVEcRP9QnG//9AbfnR7UzOdULi8YYmPVw+AjfMr8q8vJD3x9S1SF1OC5cZh2WIq+bmUunOcv0P+fbqphQyerBkS/Stji2IvQwiZLxckJKqUD3ipcZd+Pvn4CRzB7Pmc9qB6qofBl3EvHAdYwNdETsS23T3aOh7EAHGZ2sz8iY769vKnKTFDn8QS2wk0aOtNpRFDEVm4t5G/5AYsm3aCdqaKxeIHThslGqYTlQbLEJpFFL1Ts/IpasNM93WMdlFOnoEFNuMObp+LEHhg/TGY2d/SYR1SnRYN3N6hA0zl6gYAl1XFpQuDNWgTL7XLiKRcsl5MhwSSE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad9abcb1-0a17-644b-5338-8c305e9ce4b4@suse.com>
Date: Wed, 24 Nov 2021 08:54:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: About support for memory event on AMD CPUs
Content-Language: en-US
To: YAN Untitled <yanluyi2010@hotmail.com>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "aisaila@bitdefender.com" <aisaila@bitdefender.com>,
 "ppircalabu@bitdefender.com" <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <OS3P286MB1995471B56ADDC423A4EDC9FB3609@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <OS3P286MB1995471B56ADDC423A4EDC9FB3609@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0026.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2948a0ce-bee3-4ee2-9196-08d9af1f968d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445397A649252E937DED3D3B3619@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9GB0hkKLVTvaCeIdg45Drtzkwkn4SQArPqh+99lnuspZFX0FI2y/DRY14qyryNqeg9t/RZOg1Laji+n+qfpJ7LvNiNZgYiXMibXWvUS28ZG0vfUI4fHQbrz3gYo8PsJ1uezLAcFoG26WvImIDmvGriepJF/0ZgNF8KEAMY8+m3Jl8xNbbd2paCAUzs9enHyb4qDxMVWJsRSqSrQ8HJ8izpR8lWt8F1WCVi4a24LVAL5HGsBYq1wUZ1565uj2e7LVx1JRzN5UIDiTCsAhy91Kchfumo9oVPJztvaVqzWbczi6ZkvETZoHwhYht06kJFqbaRmc0IZ8uvBuZGC18Pa0b71VqcmRCTtTsIdWbSAhrRpj4lsqMZWtcb1HhY5sHNjLwpnAOvyvVQKOdYIGC/hxqYdnNJAo3n6ebAWsjPVawe9k0oyKJYhOc+sYUL6N0kq/Zy4VfJoMDd9DEY3ymkgQAAScIptRllcP5xyiWBB9P1FOrvtPIRTK1Ipu9EfP8ufxw4E6m49E9UBS05WYf3kgpWWW2afUaQqBAyuB2jdvdZODaM8uBUQ1sA4wW2dg0m2Al2bbZcwsEwVw7VKitqYgk/vIa5WH3JMOXOqfAi1TINmdi98N2bV9uc5UGZ9ooo39CTxZasXom6ffWAHSpBlbJ6Jz+EovJ/5NJ99pwj47wHqGYdOREhHMBdRIWTqrWlOtLurJdkaIHK4FiQDghqTluwY1hUbRHNXkfzyBDu4RIU04gJw1r0IrsyFKLuCQZ3aKEr33DMTVZZ8y1TyvEFoqZru4qB5HhyVCIDA/jcufyAq5yh+kC+PpXI1wardCorUZKs5nVSTsC6PBosDP4ZIyKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(26005)(5660300002)(8936002)(38100700002)(54906003)(186003)(6486002)(16576012)(36756003)(316002)(4326008)(956004)(8676002)(31686004)(66946007)(66476007)(66556008)(2906002)(508600001)(6916009)(86362001)(53546011)(83380400001)(966005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDA5Q3dXRkhOK3RKRFkrOE54a3dYZGFpa09WcVlXWW5Ma0hJcEFIclhVSVhW?=
 =?utf-8?B?UXptQWFzbkdITzI1VW8wK29UQlMyTGpsWnZteEdKeWNpN0ZtTGUwTklmdFlX?=
 =?utf-8?B?VE5HTUtQTnRhbm5SMGpBSkxKWDZiKzZZSm1RVlNCTlF5bWVlYUIwUkJZcWNI?=
 =?utf-8?B?UTl3YmswS2o3dlhDQlp0TGpKaXp5RGsvVUpndmtKd0lEdm5Ka25EVTd0Z2lr?=
 =?utf-8?B?eHJiQlhEM0c4YTUrb2h1MXN0bFB0YzhrOHQ1SVFha1F2djNOYlBwR2xiWEJW?=
 =?utf-8?B?MXBud3dQeDlLTXBtaDVWM0djWG5yVXc4QUFpb2YwN3p4amZlVXFlZUdEa0N1?=
 =?utf-8?B?MU1SUm9iSlhEcmFHRWJVOTFCSWZTYWljZlVEYXJnMG9WWnJtZGRvTGM1VVBM?=
 =?utf-8?B?UGhvYS94VlFpbjlBWGt6M2dWWVk4OGpYNGtITDUrOXFuTWZwTWcxWlprQ2dS?=
 =?utf-8?B?Q3owZVNjbWZ1YzVhUGNLUmNmS1U1c3lHc01ROHVuY0p3VGZEM3A1YzlSTnhV?=
 =?utf-8?B?ZzlDQlp6VndYNjZTSko2bGR1ZDJ4dC9vT1JkVUlDemJOSDV0NnM4QkpHd1Qw?=
 =?utf-8?B?ZkFsZGdKblRNQUI5OHQ2WGJsQ2VzcER4NDBuNG9KenhiNTJTbFM2OTF5d25B?=
 =?utf-8?B?a3lIdUdTeCt1alBYeHlCSDhTMTA0SitVQit4UFJvVWYvNHRaaUd1dGpaODll?=
 =?utf-8?B?R2FpcGV6RTRwY0EvMjc3VnlzZHBJUStSWkRuWXZKQ3VvL0xoZkZsQXVoVnY5?=
 =?utf-8?B?L0ljaExMNEpUU1lXNmdhdjB0aHhDZVU5c2w5bXpqeGUwWlY3eGFxTWRJNW9C?=
 =?utf-8?B?K2hKamdqemE3b1E2VStxQXZLMzZNVjdwcUFCaTljaUJiRXNVamJZMUtYaDM3?=
 =?utf-8?B?TWdBSFY1SXFuYmlDenpWdFFRbmxoZzB3SCt4Mm9aaDQ5TXUrY3FBUXJNRFlK?=
 =?utf-8?B?RXp4YkxuMnBuVDRtQ21ZLzdxaFpYU090Q1lya3JiZkdqOHZCTlcvQ0t5amNH?=
 =?utf-8?B?Ly82WWVWUWh1TG9NWnM5dUZwUjk4TzFPOGtLOUN2Y1luOFp4TmdSRnJILzBP?=
 =?utf-8?B?eVgzQmYwcnN3U01YSkVLZ1Q0TnZxRk5MbVE3MmRzZ1dvaWxEREdxYnBQZTRt?=
 =?utf-8?B?bUJiMHRHdFdiM3IyamlNczFqN0tHc2FLbTZhcW5DV216THF5OUNrT09jMm5w?=
 =?utf-8?B?alpuWjM3RzJCZ1l6VVBPTFdoam1jVkJCZmFiYkJKbEp4WlgxNXlWd091czZD?=
 =?utf-8?B?VDNEN24xQk5NOGhZVHBVNEFmQ0NRNTJ3YmlGUFlpMHFYMytvMXdPMlQ5OVpt?=
 =?utf-8?B?ZkQ2b25JczJ6eWRtaEF1N1BhYjBoSUhLOFNtNnFMM2xSSkRhY0hTaE1FNTMy?=
 =?utf-8?B?aHRZNE5ZRXY0OWs4M1ZoTnhKRjZXZ0srSUJzOWd2WldQby9HanNnWVV6cTVw?=
 =?utf-8?B?MWkzR1VCQ3NZblEvd2dEM2svSmVoVnJRMmlKUVpQRnd1ZDlkUXhrb0tyZXIw?=
 =?utf-8?B?Yyt4L2V3cFdVVzg2K2lZUEp0V0EySTk2ZjNsby9OMHJGRG9zcTVTUUdVKzJH?=
 =?utf-8?B?aFlUK1RKeUp4NjBoMVlOREFOZGgzb0xLSjlNOWJsYkJEbUM4S1FOenhKNmZS?=
 =?utf-8?B?d00rSUl6ZWNPdlk5RDUwaU15UCtlMVFPZldnWnNaZUxFRW9NTUhUOEtjcXhY?=
 =?utf-8?B?STNFRi9aSVZqeTRuSTE0SzFIV0ZRR2p4djBXckNRZi9WeGI0U1VBTmlkWkVu?=
 =?utf-8?B?UzFmRFI2K2l0TU5QVlBoQzNVKy9vdzZLbXBtMVZzTnJnNTNZcHZ1V2V2emlG?=
 =?utf-8?B?Y0piS2p2WDNKN2ZEMFVMN3ZEQ2tuREIwd1A5U2RkVy9GNDB6eUp2MzhpMTRn?=
 =?utf-8?B?Z2dmVHdiekZsVjZKaXcvbjJibnpXMGZqdStIaEJBdHZNNG9tWXNDcnc1TXlS?=
 =?utf-8?B?bHY0Qk5TS2dYWEFjL0lQR0E5UHVDY0FEMmtOQVVYQkRQTmpoeFlSM1JYODRO?=
 =?utf-8?B?L3VKK2xraVpNVmlKdTEwNTBoaFljNGROQk9wWGVXRWZYcG5FY2gzZWhVSGta?=
 =?utf-8?B?S0EzSTlxcWphU2RXajNidDRsRE85K1VHRHoraGlpQzBTRVd1T3BsMjVBWkhO?=
 =?utf-8?B?WnUrZFQyUGMvOGdocXc3Q3lwdW9yRG5Uc1VkOWhIeGFqVWZnWEF5azFlM0FO?=
 =?utf-8?Q?ALgnkepZMXlYG2LAtgR0E2g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2948a0ce-bee3-4ee2-9196-08d9af1f968d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 07:54:05.5532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/72FGdJqWZ4JySSL9YC9At3cFbrjEznGdxoJywszMZqPmHWmlqlmCuT7V1KyGsmNLijd9JgzPm335saG9kppQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 23.11.2021 18:14, YAN Untitled wrote:
> Dear developers,
> 
> Short version: is memory event supported on AMD CPUs or is it going to be
> supported?
> 
> Long version:
> 
> Environment: LibVMI 0.15.0 + Xen 4.14.3 on an **AMD CPU** (5950x), 64-bit
> Debian 11 Dom0.
> 
> What I am trying to accomplish: register a **memory event** handler, so that
> I can capture all memory accesses within a specific range issued by any thread,
> or all memory accesses within any range issued by a specific thread.
> 
> What I got instead: an error from LibVMI saying
> "xc_hvm_set_mem_access failed with code: -1".
> 
> Some investigation: by inspecting the source code of LibVMI, I find the direct
> cause is one of the libxc functions, 1) xc_set_mem_access or
> 2) xc_altp2m_set_mem_access, returned error code -1.
> 
> After some searching, I found someone else having a similar problem [1]. I also
> noted LibVMI says:
> 
>> Currently only the Xen Hypervisor provides these features,
>> and some of these are specifically only available on Intel CPUs
> 
> However, I can't find the exact confirmation for the availability of memory
> event on AMD CPUs from https://wiki.xenproject.org.

Aiui underlying what you want is altp2m, which presently depends (in
the hypervisor) on EPT being available (and in use for the guest in
question).

Jan


