Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8A53ACB0B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 14:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144576.266083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDfs-0007oO-TD; Fri, 18 Jun 2021 12:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144576.266083; Fri, 18 Jun 2021 12:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDfs-0007lO-PG; Fri, 18 Jun 2021 12:32:40 +0000
Received: by outflank-mailman (input) for mailman id 144576;
 Fri, 18 Jun 2021 12:32:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luDfr-0007lI-4I
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 12:32:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20ef7dd4-9602-4dd0-8b04-8bd549dea214;
 Fri, 18 Jun 2021 12:32:38 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-bDZLDxFZNru_03qOs74hWg-1; Fri, 18 Jun 2021 14:32:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 18 Jun
 2021 12:32:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 12:32:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:208:ac::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Fri, 18 Jun 2021 12:32:31 +0000
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
X-Inumbo-ID: 20ef7dd4-9602-4dd0-8b04-8bd549dea214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624019557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0VvfffDXY0tADeBCaRKBm9eCXVH9V93z3KCl6JGhN+M=;
	b=C0dP9j8wwjmgCgIsFoSY9W3RMdV1vZQLJdw1WlhCGBtSU1xaBiW0rZ6RJ3JA9dIjl+yRnf
	AI+K2l9H4uJX6kblznsvmLzDmMKAnTd6IMtqiu+/JXCdSATCvqwxNN49Mrmq90ApsLmozw
	WyuJk5/yWj4Yr+P3klDkAdwhd7VM9Po=
X-MC-Unique: bDZLDxFZNru_03qOs74hWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4L2ji637zJDNQWoTVB3LXcyPG8RR47MXtuOEJkf1NWEKj2kskbNVqhumtxp1d08ScrOF6eeXPE/NmiW4NcLgLGF0JPHqHkOej2TCDfsJTWyAE78UY/USjl63fwQV4KA7x3DsR+vvn5gzLVsMIMrfYHkwVc61pqR9YnarhcVSUSmaBrK81635hxGB45to/VrkapSeC/O+LXz7jdoAwpOGvvbomkXC2bax4zKEhDsh89ybLPW8fGFuoQz7GNWxG7/WKaTG3DjCrvAU9ueJih1qibmrPGydA2j0A4xi1kzgZNx9JB4jyl04pGm3ZLhU+Ko+Oq6gap7sWiFr3q80kWhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VvfffDXY0tADeBCaRKBm9eCXVH9V93z3KCl6JGhN+M=;
 b=XzC4l/3BTl27QY8X8I0eETDeKXDN6NABFamgDavvZUrHSGX33UHbOdtWJs7nnVaCOvmJc3zkS+toXtpDAV4tCEprV4xnuTM1OkoTK9bXDqFdbvCyUPztRHrTCNaHjZUcREgxopiVwKDVlo6hXbbcihDatNK8k2esLMcK+W1axbVM3HxQPrWHAcrhIwZkuSt1dnyzpPAdk1WYXsV4bjUR/mjejvwsiggBMiUf/0FO14YEzd4IbNsXX2ecVt6PAD0rRdWRtzykFcE7T/D+zwnvV8K8LzKd66yDO4tgbro8SYy9Kdm5w4oHPQVN5bpkzK0KyJ4nb1rjvXypKdUefoxX5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/6] xsm: remove xen_defualt_t from hook definitions
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-5-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08890bd4-05b2-9669-b9d6-89dc3954b7f3@suse.com>
Date: Fri, 18 Jun 2021 14:32:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617233918.10095-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46946c56-9e24-4a32-3122-08d932552557
X-MS-TrafficTypeDiagnostic: VI1PR04MB6862:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686236E24C40EFF7C5D5641EB30D9@VI1PR04MB6862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3oZicJzt/DnjiB+zrQF02bv44a0X4KlGoYwz4hMmLPphdzxMe29ycIH3U+jqlhK4Wc2AsJOgtemIOaQX4b2a03EZGxG0CaK52/4LRNzTSn/vvjB0BgyU4uul+OFIp6kjHHmkvkiUtjMUInL7LBGLSNtY4RwMKQWZK9m7BaHhyAGg6JOnk5nne5KbJvGuLCLqg+g7bTRdm1AYfU2jWYONjWDxczFzuYHzg/PJ9+IN9H9iX3TDXItIy/S5XH96VC4SvE/wBQ50h513BP7DobjncblV9qegLvNhzQDfihB/cxAeLpE1UA7XYZnMhGvamOIHT044tb0qaprKOra3ke1FpGdw/ZLw+aKCgoVhTzaNS1HRdUNXUKNtqHjUbi7ZI7t9pHwb5Nj3k8lyhz1WjCAjKNe/GKe+4Yo2KLoHdg5keDWt9DW/QEBz2nONcxXCV9iGLpYgvEc1WZE7m6aUrpWkduZDn3QQaJ/J7um6PTFtX8VO+ks0aAVy+f+xFHonpbDM/84lsAqkJo47DVGr6VyCmTPoCF2TTAjZeHuNCyR1xXlJvyRdmO1XvuGkX3Md5ClgXdzm2QTe7wY3xwxlDH0OIPkZ2V4qCJZ2O4aPF3E21n6iLmWBsCnDz5sDJ+7a0VBfLL4huZc3U1D182VYGYMCbjGmtX/AuX+XhAFKaPCLUPo5CPtOJKfpui6FYzGdP2hK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(376002)(396003)(39860400002)(26005)(66946007)(2616005)(4326008)(7416002)(66556008)(316002)(6916009)(956004)(31686004)(8676002)(36756003)(38100700002)(186003)(2906002)(86362001)(4744005)(54906003)(16526019)(6486002)(5660300002)(478600001)(8936002)(66476007)(31696002)(53546011)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WktGTDVPaVhKWndVT0ZacTBWMXYvaFc0aWhIR1NGSlBnTkRoZkUwMXJIekwz?=
 =?utf-8?B?OStzY0t5U255Q25RT2V5ZXNqQ0VxN1RXUndqaXplc1BwWWFzVDBJNmx5VHdL?=
 =?utf-8?B?MW1mWWVCVzU5NEN3ZkkwWGhmQUV4Y3JwUDFvUVZINWFURmQ4M2lLWHg3OUZj?=
 =?utf-8?B?ZFFPSmZSVlE3WXlIYUNLZ29OazBFVFd6Vi92NzlLcDhxUmgyUUp6eFp6Q1Zi?=
 =?utf-8?B?WXdhdE9oRFBxVlVnL0dJVVVFM0pEaGhpZ1ozSTREMFdpUERNRGltM1VLMjJD?=
 =?utf-8?B?Tlo2d1hKaGEyU05rTG9sSk1URkFNSisyaklqMzU4SUxwUFl6R0w2Q1NOUlNm?=
 =?utf-8?B?Q3hjRURsb2ErdnQ5cWROaHBMVzFpa1Aza1puTUVhenJQS3Z6TFdubG5yaURE?=
 =?utf-8?B?YlBDL0x0eER6M2h1L2o1OTRJc2xZbUEwZVcrL28yV2JCeElPZmIvdHlodDFT?=
 =?utf-8?B?TXJITVM1MHdQN2dsMzdSOExwMkRyb00rRVdvQmQrZEppS3ErWmZ0Zm56b3pq?=
 =?utf-8?B?bzFDbEIyU2U5U2dITG1LeU03YnY4N1lISm44dGJJUzJuaUp4YkdZQTl0L3V0?=
 =?utf-8?B?ajc4cGpuZC8raEJIcWQzaFhwNVVmZGQzekpnUi9zaElpMVJlQXB4b1dWdWQ0?=
 =?utf-8?B?NHpsTmo3UkNMaUlkSkdDL3hRWnBWV1dHRjRqUFRLL25PK0xMZVdaN2EzRWxZ?=
 =?utf-8?B?WHRoMU9HWmtFUFRjUmErbEgyTDdrRXR5YzJ3NGhkNmR2OGQ2ckRXaldBdHlQ?=
 =?utf-8?B?bkZIMnJZOXpKcTdxdFg0WVZSalpOTkVvUzlaS2RrR0NYQnFhK0xHM0F6dkJV?=
 =?utf-8?B?L2R5aUhsZ2NaaWtKRU5vSXRLMFZHY2tJZzVYU0R1VFN4WVRDYzlBR0M4ZDdK?=
 =?utf-8?B?NmlqNER1Q3lkWWwxaVNWT2FsRGtZQWpkamZOQzFnNVowTWdybFhmeTBTVks4?=
 =?utf-8?B?UHUrU1dRdkFOejY5NTBWdVI1WFh3bkt2dEdON1I4SW8vTGlhN1lKMUFSUmQx?=
 =?utf-8?B?RmJRNlYybTNnbHNZa0dyRk8rVHk2MW12Qnc1RlV0VXU0MlpTMTBPV29odlZx?=
 =?utf-8?B?K0M0MXNaVEZyZUpyZ2d0VGljVU16ZXhwWEhYNVM0YUk3K3YzZGxJQUoremFy?=
 =?utf-8?B?NXBHRjB4dldqVG9SMmE1bm9wbWRtT1E1SU5KSkdEVlZobTZ2UGRHTUk5QU9m?=
 =?utf-8?B?VXhQMHFucURrSnpwZFRmN2djYndJd0lVL0VsRkR4T3hhNnpUTXlYbXJmcitP?=
 =?utf-8?B?dGh5OE9XUUI0dVZUeTE5MUVKQzhxZTc5cnhmMWdDUXpDaHJZQmFMMytaS2FH?=
 =?utf-8?B?THJuQzZTdXdVT0VhVDhUby9xZnlnR3V2UEFQN1RkOGtPcGl4YmorSkpGUW9y?=
 =?utf-8?B?QXJac0ZGMk9iOWxZd0RwRysrL1ZBOE9oQjRqVEI5UXVJdGl1OWFjUkh2cGlN?=
 =?utf-8?B?YnZVQzJmNkVFbXZhYU56d1QzV3BYTEtNc3QxUExVZlNzY3oybVFsaFZYVGpC?=
 =?utf-8?B?U2E0c0JkNGh2NnJBRi8wSndpTHB1ODlHSlNpWXovS29CdmlpaE51NjM0c2t3?=
 =?utf-8?B?ajQrbkhQSkZxaHJiclAvalZSZDZkOHJTOVJ6QmdJc3VSckJvL2lENjFmY1Ew?=
 =?utf-8?B?Q2FpL05KTWpVRWNCL1NKNUFKMVUzcWo3V1RaQVRHeHFaMG5JVzFTWW5UUUlL?=
 =?utf-8?B?T2FpTWFHbW91RUVlRU5QNzNXVHBicU9lUXI4TlRXMG8xdmhlVnVaQlo5M1Nw?=
 =?utf-8?Q?jfRp68oqpbfIXIoPhL9rDaVq2UJPpuBNSoiatzF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46946c56-9e24-4a32-3122-08d932552557
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 12:32:33.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6nrQDYlqlisohjXlni7mzvwX8L+h0wCyjH1/NQghcGbJvfrz122RE2QbCGbgOnrO5MxB92CD+F1xFgm242TUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

On 18.06.2021 01:39, Daniel P. Smith wrote:
> With the conversion of making XSM always enabled even the dummy XSM module is
> being invoked through the xsm_ops dispatch which does not use passing of the
> default privilege. This commit removes the xen_default_t parameter from the hook
> definitions and all the respective call sites.

I don't think it has really become clear from the earlier patches
that even in dummy mode we now have (as per my reading of the
above) actual function calls, where previously everything got
inlined in this case. I'm afraid I view this as another argument
against the removal of XSM as a top level Kconfig option.

Jan


