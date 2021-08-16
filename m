Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B503ED9E1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 17:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167397.305554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFeZ9-0003Sc-0G; Mon, 16 Aug 2021 15:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167397.305554; Mon, 16 Aug 2021 15:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFeZ8-0003Py-T1; Mon, 16 Aug 2021 15:30:18 +0000
Received: by outflank-mailman (input) for mailman id 167397;
 Mon, 16 Aug 2021 15:30:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFeZ7-0003Pq-5f
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 15:30:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da8ed812-fea6-11eb-a45f-12813bfff9fa;
 Mon, 16 Aug 2021 15:30:15 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-f7xHX3qcOKmrZT2Fe-bGGw-1; Mon, 16 Aug 2021 17:30:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 15:30:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 15:30:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.9 via Frontend Transport; Mon, 16 Aug 2021 15:30:11 +0000
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
X-Inumbo-ID: da8ed812-fea6-11eb-a45f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629127814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c2FQqTC+7zHg8fr8cX2PKnhOZ11ZlAANFIcYhl89bXs=;
	b=jXdswPfrj9yW8kwOvJlRA4tciaOrBPqfgeBiIy9RPyMIc3cIydUWo5tXTcYejYYLWu9QNN
	a+BMbN03PmRKBYGGA8+BeI/g+XFrRCx3++y8j4vfY+rENcLEF6JWTB2ZMN4J6699VK1qPp
	uZfw3QaBF66Fc3PNeWGIZsbTCIjjUbE=
X-MC-Unique: f7xHX3qcOKmrZT2Fe-bGGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/C9knEVGXa2aG8lUcffbHT6jXFhBL0Y+3+mV5zUiPhk6phHNSDJkmXZlbkO7R8V6mkner370ccHY5po8MvKxk12sbZ3ifzLlmJJEU2fKFrpd9KU3N+pa77gGaoFB6V9V0omiMwSRSwePCYuTLWA1l973UGHJGCt7Hmo6N4Xiyg22vcAPTDRzF8nyv05s2okESf7gxduA9xnl7SpPpTOBqPLBO+UCb1yERmU5FSboAB52mJY+tUouDzqBmeAnw6OTPeyQvLa8MH3kdGD0TqqAOmiBLpHqOCPPocbwoo+hrQusIOp3RZ+44wQMk7u2h/ijRbjit8sj0zz0jabYoctow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2FQqTC+7zHg8fr8cX2PKnhOZ11ZlAANFIcYhl89bXs=;
 b=DraB1OXsSQc2PQLp9TjELMzaBug+BVBblUONto0GK9Ojq2iB+VrSciylOhTCVpu2wN2Semsc5nejAeXCannTz4HFKKUEcjTOjvvsrxLe44Tr4i19eTO1B3ers5P3xtuVVVtVi6F4nL4PdSsPwQm+DAWSOlYXEmqDzGc3rhcT5ETSCEl1idEFEWOXMF4r/WgVH3ReTHO41kGQ2Fwvas6w4kW8YSInEjHCZPrL1LkniNGJpQBBIGgQi3g81C07d12ppmf2pSBsrynLA7lee0t6fZUjk8kUNln55Veg6jXKhy8TgxN1q9qxP6mHWhoUjXAhLYw6zwr5qodzmSsgXPr56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: suppress unnecessary Dom0 construction output
Message-ID: <bed8e679-b531-e1b4-5ef9-79019fa230dc@suse.com>
Date: Mon, 16 Aug 2021 17:30:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed85aaa3-f7fa-454b-4f92-08d960cabcb1
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32955AC1E427CCE560CF6A34B3FD9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5m+Y9JRoy/8eB/gb9TpObHy4qCaN8MCS6aCUl4SD8CAM/ASuLADx4pZJdTo8gFni0YdtVBMsvrjHod/18VMVIDIed2JyMcMKnIVgrByn2hDQ82SjK/iTGYDCe+VL4rjWS5CARqvkCwivnDltYU3Ne9Uf8+uhoH6WctK7UbBZeoveGQiCIKjqhvLCiewtT0hZHjLVQBNXXGrUfDgssxptIeZ1CPaB3IEPHbOwcxAsuIfdBMuyaGpA7TV9WtfQc1gw9/9XFYAyaOvUc9Osq5XDL4Ep/jxigGFis/w1YsuY5PoQuA7ro8FdgfG4oBWqXMjXG5r+LHye0rqi9y8R6TcsZTIygbK6qOjEHm+YFVg5E3BWCAnZao9/XKRP45IWaeZYmFmY5LVmHXCexIy/nbRla5GLKE6RNJ4HGVBu77wTGc2yMlKu3twB56z5RMVKyzqUVlG6BNXKiodIxJsjuv/JQjYtFRFfhUt7CnSKhoa6z8pSpLrnpLvTYVV4let+2qQZ6wy/5oH5RnI2zGlwR3euktjagtE97+6ftH8jMqs0Bfh3UknHOVEbh8APE430FrA+q3Ziqk3IgDKDD6q+tmQK+PXEOM5cqZi/2s2hMGrR6Kfa6wKtj+byywOABGWsUaVlAppDMCx/yY8+MklnOOL007HsSdGcx1V/WoMOwCWYbIUKd20QpC/4kMVQzzs4pIhp9KC+nPDnD8yZ2V1DjqjfE4VWiRNl+DZS2EaOp2Nao3E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(346002)(396003)(136003)(366004)(16576012)(2616005)(54906003)(5660300002)(36756003)(956004)(8936002)(316002)(6916009)(26005)(66476007)(86362001)(186003)(2906002)(66946007)(66556008)(4326008)(38100700002)(31686004)(31696002)(6486002)(8676002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3JyTEJMdHdGUDVGbVcza0xKWG5sbVozU3pRT3NnU3FuSGVraVNXYVI5ZDc4?=
 =?utf-8?B?VkE4cHB0VVQ3TDE2anhjZnlOeW5Vd1RSaGNXc3BFYW9ScElZdkdtdS9QbVlm?=
 =?utf-8?B?U1BUNFo5REdXOUQ4THNGOFlBYVFPcnR2TWMzVGRyUGhma0VPZHRramdqSjRF?=
 =?utf-8?B?UkJiRXRlUEFIWmwvVUY5T3RlZllrVXFScUxacmh2dm1GZ3E4N0hvTFh5MjFO?=
 =?utf-8?B?eUpSU1ZEWnh0WUQ2RnhSSTVZc29mUEIyemFIVUYzcHA2eEUvOFN1T3liRmFZ?=
 =?utf-8?B?U1VOZlp6N3puODk1cXNQelpFdG5OaDhaN0g1NGpoK2Y5OXVaZ1dSQWYxYVRD?=
 =?utf-8?B?cHlkWXpHOHlDNXFGd0ZOeGNTR2R6cVNmTHkvcnBYUFliOWpocnJvTkNXWTlN?=
 =?utf-8?B?b2t4N2pza2RUajF0UU03elJydFdhV0xSdWZ6YXFLYzZSUFpjL2hJbkpTWnY4?=
 =?utf-8?B?WkoreFUvVi9DUmZlUVV0MXgrdmFwSFpEVXNhVnB4dnBoSDZ0bzFBdjFmeW15?=
 =?utf-8?B?ajNBWlE2cHAxT2F3dDg2T2tGaTJ0L3JlUWNCOXMzWTBQOEJuOWpGT1R3Q3A2?=
 =?utf-8?B?elVwbWE1SUJhVGZVNktQamxyQkZFMUYvZnFOaVNsWUNUWU82VXNzdDdGY2Ju?=
 =?utf-8?B?OENaNGpQekM1YUNVNlp1YzZTeDRZbEJLb1R0STFYS1dPS2FEZ0J3UmVnOGxC?=
 =?utf-8?B?RnpnNWJ3L2VLVk02a2wvRDhmclpDek1xdUN6R3ZYVDZKSWV0MW5VK0dOdU1L?=
 =?utf-8?B?bzUxNVBkWWVkd1c1VE1HZ2VDbnRHR2hNUkVSUEZsM0VESk9aSFJWWldWeWVr?=
 =?utf-8?B?SEZkNy9KN0Q4NzJ1UW9ZUUZSS1ZlcmJLV1VyRmxacXptVlNsSHhReDZkTlN6?=
 =?utf-8?B?ZURTZjQyOFFGb0t5ZmVscm85YkNPWWtlamswaEZmdGZNN0hEVHBGQlJCRkNm?=
 =?utf-8?B?TlpVUFVPbHNrT21PT0dTalNYazA3N1lJdHpsc3J1YVF1WUtDcGRFZTJXS1p5?=
 =?utf-8?B?QmhCV2NpWnJLUE9wZmpEZlltaEhTRnJVM3lOL1dJamErNkQvZGx5QkNGVEN2?=
 =?utf-8?B?TUNXeEJTaDhaOTEzdVQ0R3ByVEhQblBoK3FZQ2NpekkwamJIaWVSbldQaGMv?=
 =?utf-8?B?SGlpdmh0UDZJbGxxaW4vSFRreXRJcEdxcjZGZW94TXVZQ1gremo1aTJMcHg2?=
 =?utf-8?B?UWY5TW5BaXFtNUhuZDBRSVdObG1KaDJOS0JjZUFjME1MSDJYaXNxQVlxejdU?=
 =?utf-8?B?SGJBMWFWdWdYbzNoOVl4ZVdpYmlad1dmTUd5NFVyWGwxTzJmUDJNRVRDMVZP?=
 =?utf-8?B?TWhmMU5wMG0zcDZKdjhnMnIra2RWQm9DM3FhM2VYNTBMMXdzR050RVZTUnd1?=
 =?utf-8?B?UHEwNFdyd0FWM0FrbW9BYjFyZW9sOWZlTW81dnR1NVZxVnAyckxYVkIrVWcx?=
 =?utf-8?B?dk43UmM5WUVWcWMrWUFqTSs2QytYVnZVTVlaWUs5eFR6NkRQU0xKbXBPcWV6?=
 =?utf-8?B?VFJKT3NVR01HY1NadlJXT0t2MGt2WGdIZlAxK2RTMWpSWUhpRFg1WDFPZUNO?=
 =?utf-8?B?QnV1b1FqQmVzeGZHOTBrR2V4K3BMWWVoZHExbFpLUlY4MThqSi9ybWp2N3Fv?=
 =?utf-8?B?Wm5kT2JGa0tETWxTaXBSSUdZSW40UjcrUGc5REk3V0F6bG9QODBXbEF1TkdN?=
 =?utf-8?B?bHRPeWhFbW82M1ptS3JoTWp3cklMV0xWOWtNQ2N6Wm9lZG9UMWk5dFN4Q0gv?=
 =?utf-8?Q?Txwy6IjjcwQBHfYFT5jlO2B+4Mv65DadGwvHGu3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed85aaa3-f7fa-454b-4f92-08d960cabcb1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 15:30:11.6132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6G8NZPjGoZ6/THZd5MXa2T9EI6GbdlCmF93RfRLXOFSwQaNM3Wg+4PSG9Q13tN1FzvcQzYnL+rfLJRI5euNxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

Especially with XEN_GUEST, being a prereq of PV_SHIM, defaulting to N,
v{xenstore,console}_{start,end} can only ever be zero in such default
configurations. And in case video is the only output configured, space
is scarce. Omit the two lines carrying no information at all in this
case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -580,8 +580,10 @@ int __init dom0_construct_pv(struct doma
            " Init. ramdisk: %p->%p\n"
            " Phys-Mach map: %p->%p\n"
            " Start info:    %p->%p\n"
+#ifdef CONFIG_PV_SHIM
            " Xenstore ring: %p->%p\n"
            " Console ring:  %p->%p\n"
+#endif
            " Page tables:   %p->%p\n"
            " Boot stack:    %p->%p\n"
            " TOTAL:         %p->%p\n",
@@ -589,8 +591,10 @@ int __init dom0_construct_pv(struct doma
            _p(vinitrd_start), _p(vinitrd_end),
            _p(vphysmap_start), _p(vphysmap_end),
            _p(vstartinfo_start), _p(vstartinfo_end),
+#ifdef CONFIG_PV_SHIM
            _p(vxenstore_start), _p(vxenstore_end),
            _p(vconsole_start), _p(vconsole_end),
+#endif
            _p(vpt_start), _p(vpt_end),
            _p(vstack_start), _p(vstack_end),
            _p(v_start), _p(v_end));


