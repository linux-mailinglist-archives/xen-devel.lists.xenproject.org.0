Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E634547C149
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 15:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250453.431385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfwP-0003j8-HN; Tue, 21 Dec 2021 14:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250453.431385; Tue, 21 Dec 2021 14:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfwP-0003i9-ED; Tue, 21 Dec 2021 14:16:33 +0000
Received: by outflank-mailman (input) for mailman id 250453;
 Tue, 21 Dec 2021 14:16:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzfwN-0003i0-Ra
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 14:16:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97d99131-6268-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 15:16:30 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-NHqUIrD3O6iAGq4k9tCf5w-1; Tue, 21 Dec 2021 15:16:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3533.eurprd04.prod.outlook.com (2603:10a6:803:b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 14:16:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 14:16:27 +0000
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
X-Inumbo-ID: 97d99131-6268-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640096190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkaCEXNhsQM+1BxFqscUz+K4mN1vCuV44dD608ybx2o=;
	b=IWFUMxzuwA+IluFBcf2vW8HoO3KYwlTCq1mF8nXDxx4qY+515L5Pc8bc/znhFfjnJaQbIQ
	mZ8hE60GggRr/HtsC5hT87eM6Am47Rk5VTr/yu/RhU8CsydKlS9sMjE4AkzMvpmOCKqL/T
	wyUO9cHlxJiudrA6HINhDt6C4AeJMIA=
X-MC-Unique: NHqUIrD3O6iAGq4k9tCf5w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFyHjNlHC3AXLwXJTOlDZj0XbxS8K1ytfiHHZ/ZQUDqn3lbS4w9vo9p4PYk1rYh+FZtss0dyZ/pnZr9QMEDO1HExPen/s49Cq3d/BRr5K9Ff5c4kj37sC1FI/lIRphJI5oeGVi51GdJMXc1dAY2dvRAmeb0958LK5CX5Acv+wXzmeFVHXQSz/er0CG+gf01vVVK01abC5TZiY99u5AHXytDn2RfWoKNwQtT/Imb/S5O3cJ6lDY+06NAQSSistmW2JO28GvO8vLqgwcnD5FO5NEfj0f8DWjBweoShgDOAP6/ndSHy6x6rLx8406ANf40yiW0X4G35ZbiI790XyB5L0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkaCEXNhsQM+1BxFqscUz+K4mN1vCuV44dD608ybx2o=;
 b=WDMY5/MRBZbHZ4HomfOTZryZtEiUXLAX8UB20S9Z8l7eKtutzQaRzjuEJuWMkljsaotQFHI2N9FsjzM81Vy5fC+D8rigZx7u7CWti+it57+0lznZPNF6Zz9Sus+ghRhv76JXu0W25Fmttz2V3NFP/yGQIgoBzN5Fq4K/25MypsJt1bRXMa9MCAuYhwFuZGxXqezHC/iy6ac6hZ2RKOfFeml9zVbPqvslUB3ZzN9wz5IkdCmU0d0JVDA1sBZhMAxucQSi+uy+wqSfSQYVs0ch7JjHfgfW/OazAtA3WjGFrvIj6h2ewvFQ9S/tlisxOawYYLF2i+XK6M+1rOrd0Nmabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8045db2-a647-fc5b-0c98-890edce10dc8@suse.com>
Date: Tue, 21 Dec 2021 15:16:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 31/47] build: specify source tree in include/ for
 prerequisite
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-32-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-32-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0032.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22d7f527-b573-445d-d1ff-08d9c48c7a0e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3533:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3533F841AFAF265DC8865D15B37C9@VI1PR0402MB3533.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5sJw6zHPEFuKQY9Z7aq9T/cLX9R7M1G+2p7BLFBY6HZO9SsHqVgpNWshBJUZy13cTvBm0EtJgqyyPSJqw+JHgR19R4H4qu1Q3EgfLy51aduoFJEcGiSBPaYw6n9UsJhIBTO/+4crIvJPkxC92TPmqXeJjQghjzYq6mELaD6qsMvcntnFf6S7aOzgv4GuHQYT1CUISDbXsKVKLTX3LOZbWkQ7v8WyS+GLadQiHps57joqu9daLz0bxihXS22LbUl5kL9s8Eo5t+Qphhdb/rRaNdPMh4RZoP1AgdfA9TfilYSKorkrOT0aq9gToJcuFyl5OYfbT9jqyOPYQihl1JGEUnr43v2oC9tcpcnm5mSztmZBkVOKVu2zD5lw8mOHefKMfsXYgjyguUFjLMtdjijtzcLUAELhsTY8s6Fm88gk5IurW/F9feg0pVbug3/NMZ0Zl8V6lJw5PgpNxIt10FpI1dKbA9Kc6JxpRNZpxplBqj1woqRsOe5jNXamukAGs87SmjYI0nxTqjegiTNnjdKCk9xO37hiMRGVYjLwAnPY+V6vO+9k4cbRuoqQdncS/sCIwN1wHlOio7WVcaxO6pGpVGvCIgynwN7fEjbqu3hCAb0Q4H6MEhtEPGtIzba4+bb54tdtvzjUcLpXui1k7ekAlQ5izlMYM7DYz4VMSHtCpie46ZsLc4LAJOJWgj5kyvVihkZptLTtqbgzR+itcqrDCWu4w0rA+EDybbjyjTDTedxO/DY+5j7AVE3PWo7mKa7D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66556008)(66476007)(6486002)(8676002)(4744005)(31686004)(38100700002)(6512007)(4326008)(8936002)(186003)(6506007)(54906003)(53546011)(2616005)(31696002)(6916009)(316002)(26005)(5660300002)(36756003)(86362001)(2906002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkxpelhWNmRVdWpxeVUxMGw4RWV4Vmd3WDNkdENVMkp4a2w1di8xOVR3Z1k5?=
 =?utf-8?B?aysxS1VMQUNGL25RVm4zODFYTlNHYlpxdWJRbUFQYkFmeDBDa3VEdlNVN0ZY?=
 =?utf-8?B?NWtleTFJdFVtSDBIRlo2byt0azBqNnpNR1FuTjRXc1lEdWFzYWZvSlVMSWJn?=
 =?utf-8?B?OXRyWjAwL2ozME5MQ1oxVG52bnJFZ2JlTW91Y0o0V0d6eHJGZ2hZczhqOU13?=
 =?utf-8?B?SVpCMDJ4ek0wZ2VJSVF2all3cHZnVlQ5ZnVHQXEycjZqbTU4UmlXeDNkOTFY?=
 =?utf-8?B?N2hpTk9vUWM4QitqTmVSQTVHMGFENTB5ZXhyZUZScGJpVjUvM2VuZVFmbzhu?=
 =?utf-8?B?U2xmZkVCQnVBWG5HS25KbUg3dkZOa2k1RFRrRzJFSmJZRVpEYlpnT2pUVjY2?=
 =?utf-8?B?UzdWTTRWQ3ZaMERzTUc4OXFFbS9mQ3FDTTlzOHl3REJVRkgxQm9NckpkQjFh?=
 =?utf-8?B?Wkx5aTVpb0MwcUlPSmN6R0RiVXV6cW9hc0huczhneFVwS0QrcUpnTTV2ZnVl?=
 =?utf-8?B?UlhZUnh5SkVPOHEwRXEvanUrVE5OdXdlN09rNHY2T1F1d0Z1cFJMTVFHRHds?=
 =?utf-8?B?aE5VY2QxL3lvUEgrUjMxLzVtS0t5QkhobVRzMUluUXVwbkoya0RSdzlJbURp?=
 =?utf-8?B?WkxWblJGb1B4K2NEUVZoUW9ySGdsblNlVDMyS0EwZkcvKzdkR1l6ZGJrdGt6?=
 =?utf-8?B?cStxa1RlYzV1dWZjak8zdWdydUZxd2VxSnFqWGN6NUlkSjMwQ3dmS2J6UWhT?=
 =?utf-8?B?MmJ1ZWZFZ0doSFU1Mm5KVHEzOFMyWHgzcFR1VE03L2ZCSmZlSEZoYjRrT20z?=
 =?utf-8?B?Ui9ISitqc3hrS0c3S3dSaEtSVmovakZoMVphcjZxL2cxK2Npdnk2UUtLa2c2?=
 =?utf-8?B?YnQveHVKUnYwZUY4REw5RlpQbTZFS2xPYmZUT042M1hOOEU2c2hYcytZQnlw?=
 =?utf-8?B?WnJQYkswaXVVbDFwMko0bzg4WUs1YzZTcHNzN2JVK1VhcndkSzluWWdmKzh2?=
 =?utf-8?B?c3ZqbFFNY2JIbUwrUlJkckdwQmNJclVJNzk0V2JVVExuOUJDclhiL2hrMTIy?=
 =?utf-8?B?RkI4ZDhnbTNxNVljdzRCMkJ1S1ZFNkcxWlIzbUNNdEZCSllPdnZaaUMxUm1k?=
 =?utf-8?B?VXRqOHFISlpnQ21BRGJsY0IxYkhIWno1SXZXY2pXdTVVWjZlZUVCZGFsV1FU?=
 =?utf-8?B?K24vclVZbHBHOHpsUURjellBWVkxc2wvMFU5b2dZN1U4Ulo3V2o3THIrSEJ1?=
 =?utf-8?B?azZ4eS9xU2psZE82aGp5RFArb25aZzVrOEIvcDFpY0Y1VHRGQlZ0MTF5N2xq?=
 =?utf-8?B?UlJKU0VlTmF0bXJrdlIyL2w4bnVjNm93dHV5aGVBenZCN3RWQ29jYmRFVEpD?=
 =?utf-8?B?aFlqRWRrWUpuUFdac3MzQnZ0cWJyVTdYRkJXa0FJOWwrZWt3RVhQV2pITDV4?=
 =?utf-8?B?dkdiQlFyZ2tXeUNtd05UazhBMzBNSi9VRXpjK1Q4bUVma2V4cEVRSVgxblE5?=
 =?utf-8?B?bXJrQVBPQ2p6QWZQQjllYmpweHpXZE1FcTJWeEI0VXluWmZoWGZrK2hHZHFJ?=
 =?utf-8?B?Q3cvd0ZUMXl5YjBDdE0yNEVnRmZISzdoZVNJVjdjMkV4Yk52NUhtZ0F0TjdM?=
 =?utf-8?B?cDJpZ25mbVVHRVUraU16NUFXWU9IMkFidnFTNE4xelRzTUJCeWxHTWRzMjdt?=
 =?utf-8?B?c3hZalB3R1FwcmFKOHRyVmhsUGJwTjRqN29JYm44TlJjY2lVV0FJKzZmQmR0?=
 =?utf-8?B?OFoxZHpkL1plNXF3Z3BXVXRsVlBhTkxGbTJESmVUL3oyQ3Vlc05sVGRDUmRk?=
 =?utf-8?B?ckNiWnFDUEJWTkh3NzNKTjR3MVFYK3RKMHBXeko5Tnh3OXBVVWdzMENBT0FG?=
 =?utf-8?B?ZlRHcndkZUdtakZuV2dUTEVVUytxYW9IZGQvVWFsVzY5R0g5Q3dwYTliOXNr?=
 =?utf-8?B?Q1lEMnAzbEVUajVNNWFGdVVDK1FGbHZFSHF0dGllWFE0UEhpMTV0TUQ2dXhn?=
 =?utf-8?B?ZDZhOXl4YkR5VDlRMTNIN3R2NEtsUnVvMWl5YWRTend0WkRFMmVsUmtDUk8y?=
 =?utf-8?B?YjZIdHpMZml5Q1ZiZkZuZDlQaTU3WGsxamNRNld1N29tWmRCbEhmclRrUEt2?=
 =?utf-8?B?Rkl1VTZ4aHhQTDh1QUtoRlhZTm9idElqd0JVcHhZODFLL1pZRy96OHQyZkk0?=
 =?utf-8?Q?MY4cmEPFL7Uy7NYnsZqpe5c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d7f527-b573-445d-d1ff-08d9c48c7a0e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 14:16:27.3182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnAzlANpC5BqyLmEwmAvQ65dkhn92or8+O0+328WWP95GyxXROuff78HoqHWz1KRC+NWQ2X9egpAf/j8V24DHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533

On 25.11.2021 14:39, Anthony PERARD wrote:
> When doing an out-of-tree build, and thus setting VPATH,
> GNU Make 3.81 on Ubuntu Trusty complains about Circular dependency of
> include/Makefile and include/xlat.lst and drop them. The build fails
> later due to headers malformed.

A circular dependency would mean that besides the expected dependency
there is also one of include/Makefile on include/xlat.lst. Where is
that? I'm not aware of anything include/Makefile depends on. Is there
any dependency being introduced in this series, perhaps by way of new
(generated) dependency files? It would be good to have a clear
understanding of the issue - as you describe it, it could as well be
a make flaw.

The adjustments themselves look okay to me, but of course they don't
help readability.

Jan


