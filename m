Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7304E2442
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 11:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292889.497407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWFCX-00080d-SP; Mon, 21 Mar 2022 10:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292889.497407; Mon, 21 Mar 2022 10:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWFCX-0007xd-PF; Mon, 21 Mar 2022 10:23:49 +0000
Received: by outflank-mailman (input) for mailman id 292889;
 Mon, 21 Mar 2022 10:23:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWFCW-0007ui-51
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 10:23:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcdb1707-a900-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 11:23:45 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-L0Gl_n6zN2-ZhwqCgTwmJQ-1; Mon, 21 Mar 2022 11:23:43 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 10:23:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 10:23:40 +0000
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
X-Inumbo-ID: fcdb1707-a900-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647858224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YBdn6zNEd3dRTr0pr4+mAvFwFl8sX+ftxiOhYclJNE=;
	b=k6+URyu4sgnfoRJkNRhUcpTP9NrCnnfpDRaBxbZbQJbL30CdUOt5vDvhLQ6vWLi/V/Ndky
	N5vqtFjXvdYBZ9MKPE2jsHsZLGIsCWglR7Y/02eLaFCNEw7w4PtSJLsrnp2e/oIQFKw/re
	r7kFRJSVxpsTs1pHPjfP/bU2Ju7qzFo=
X-MC-Unique: L0Gl_n6zN2-ZhwqCgTwmJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeBfiuKevhwRd5gq9OPz406ToCSgrXpLABg4KzBXam3xjMWfKGlrDdRr8OCNRxJTCiA2uzo0T6fQlBILX6Ej3PtTzMmXt5TWGzQu8M2M+htqhAm9v6NaNtEbx4ypV66KdyCP8a6SDvli4g9Jwqz3pvJkk7cWpmPRsG3GRGUhAZbX4iUOEDNjiV5ogSwhDNXSPT+stn9Nrlubm4Mls9zOXr6Qqd5c2W27X7Md8CtoIxXXXDLtGzYwSR19QvKxvONg/OU05SOEgk5tblN63Txy6xRxKVHqkMGAHjR5NEVipHEQmgHCCiETqo5GkzjHIcZcQyxLGhXpF7L7HCks2xuuLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySGHTc544f/Qufkee5IH+zC4zeekNrT4XznitEkUels=;
 b=jgl9UVA52s3nALwrUpZ32ECrQFnFiqMmnZNNgcUtOmEdBoxCMOQxp19G6PhNoQsq+vfRJ5RY/X5SHu25R8raA/5/be8/9pHtuABz15zRQ9ZCMSq+/IvZSI/7KGfNUsMkx3I5OJcN/yH+4/MumdFKQjr6DnDVga6KtJ5RF8B8MjSs/Z6W99udawiOk4Evt+oqR21bj1mtTOuMLYFINU2yBfglHRiXfRD92sRUM0jlRWrbUU+Q6lOV8cWRWkLfL7XvD7jD4UR/ztPcxFSndyi7rUbCnhGHk2hE6sh8CTETPyKS6vIku7W7LFkWmcZYd85ZSHQNwuVdLc4IAnRadKmlbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2930b69f-9fba-e26c-8ed5-90ca93db92f4@suse.com>
Date: Mon, 21 Mar 2022 11:23:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] xen: Introduce a header to store common linker
 scripts content
Content-Language: en-US
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220321082114.49953-1-michal.orzel@arm.com>
 <20220321082114.49953-2-michal.orzel@arm.com>
 <cb61531a-5482-3aab-58bd-84f99f21ec48@suse.com>
 <AM6PR08MB38148D3FB84D91DB089C48CC89169@AM6PR08MB3814.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AM6PR08MB38148D3FB84D91DB089C48CC89169@AM6PR08MB3814.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0076.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef40d0ed-e517-488d-0e23-08da0b24de45
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5470F0FA8A0EE5C1D25917F3B3169@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	724YwNeoY6s1LHeG0Y8+VzdxJDiZFuPR/8a24ssK8hHlf0V4rfT8eVu0BIwfFPXknKwY2X4pA0SxHAcu1ASIqTYgNd33QAIZLoYv+fveqWxM07TK/bj124j+JCV380SXaSHESiwTupieh3+PVZ6mayw9FlPHgte5vfzqEpyQECscXgl72GP+TWj3EzAi/NEdKMyy/b/wSZGp5qCltBFdliJvG6Cni3jCYGYdLj65KjQXSDT4iIV4fz1Jbsi0waEF4Gjo/sk35Rq30FxzxeT4Rvy+FhMltEX2VWBLdnWIYjATNbNJm+NF+atG6E059d3C9tSjRiCKRijHRCEocHzod8H4Q1Pk8LXrgdpnhEwHGNv3aIJc8hEucu1GI2Xvgvh7lPNBHj5HSdyxGqoK3YnWzwrTEn4dL02tpsWiJsoVduVLlOGGMpP54lA9fTCz4HFImEHyYSH+1n/2iHY8DUrKrdLrrbn9bO/m69ZgvDKOFQtKbf3EXA/Yinvnbn9Brw5UbYkci18eSfED8JwgOnkCAkk51nRn5CDnjch8xSjyIQu1qy21GJOO4VcuXRqX/nQdP3nzPDzwdjEVQcpm0KkSyeVujv0jJZt9OI0tLOC4YCKoPa4qtTb7kMmmTKbIEAYgqqpu2ZjSk1esO7qE426hfcs6jOU9VBrADLGreey9Njfz6gXGBXzaQboF0RjhQDAj66IXvSi2tx1m0ptZXnnN5YxxKfSKelDMK3ubrLt7DKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6486002)(31686004)(36756003)(83380400001)(186003)(26005)(508600001)(316002)(86362001)(8676002)(53546011)(66946007)(4326008)(66476007)(66556008)(6506007)(38100700002)(31696002)(6512007)(5660300002)(6916009)(54906003)(8936002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fOd7qMOLn5dJdl0XQEyMRtxUJE/vKKwMGDDLIGy+KBQZoXAOzZfHvkIx3ebS?=
 =?us-ascii?Q?GnNA7WjEPeDXjgGIJJXGK/YamUp++NOCnpWd8canygAlll5kuNsdaTjhM5ge?=
 =?us-ascii?Q?KvNHNi4iBxelx00KewdZZ2ElETjhV3VdYPrXF/JUjubijDmpGH2jgxpLVdpg?=
 =?us-ascii?Q?OqpPTWz4Yfp2/V5DAkFAqqwILr5hEaNz0SyNGEzZJ+RU11nlqyKVfKXb8x6D?=
 =?us-ascii?Q?dt2cxUH9YKKhsX1t+ZiwjFHoWVliJjQ+pXaw8Thv+fO1T/r6rca7yDSoCH6a?=
 =?us-ascii?Q?5zS4pl6jZ+ACJlBg6/i6nkaVUZyZ+/TDUrxku6h8GqjcAIt1/kvpqCr37Aat?=
 =?us-ascii?Q?GWPtXu/Fd7iIU7kLrm6vKDMveM1ENMHNnZS3FfhJHBZHmQS5A4ugp1tWonsW?=
 =?us-ascii?Q?ZUFqevm8gVp6VzBD0whmsRqf7TPAKCegG12uRIPSf4VJUJ3qp+G9NHFYltYn?=
 =?us-ascii?Q?xSQAH1clqG5fCWN2qbNSTlZ7Z9E+TTFVLjzCZTNyLj3dzR8bi8qEDpM1ErNW?=
 =?us-ascii?Q?xhsQgxFzt3sLQhRBmeQ1x2BJFdIsHc+Gd7mcMvF4aA3GWscr5EWZDgTQ/WIy?=
 =?us-ascii?Q?dc90kGF+fMDSrWG38voyoUf4YvRQ9VktyNFRQcuIsxWaPqP4/qToGomK8XUH?=
 =?us-ascii?Q?ik+UI9FSE4ScOJmWjJgDlQhOaDP9dYd2SN9e9W8uYHMlreDld8FsMs771kRW?=
 =?us-ascii?Q?kBjcyrQES5KxeQtWXQk72h1OKtHORrIV2HMTMsn5NQnhVwVsDOBm6+Glpqpr?=
 =?us-ascii?Q?z0HyRT80ELUi4yYmp86rv3FRo8JSHlBkqWxMF9O9W9PtSa3a3QfUwjag7fjo?=
 =?us-ascii?Q?r1QuY0gzQA4GPiykK2R1VCjJANRY0dimQG8YAM1Kyw4uOSoXLLUr0MjxX3RI?=
 =?us-ascii?Q?kCJpnofJR2MQqdgPYZSFWUgFyHSD97W7q2xtPhdnkGZwwQgTGDi2Ca7O6sc1?=
 =?us-ascii?Q?q+7KLFv//3hEUBWoxzn/tfCUOQY8ZZ7Gqgn0ZngbpThOnjCl6P1Yr1A2vMUV?=
 =?us-ascii?Q?MAL99FDVhTqY322zWHCgyyh51wWRz965wWRxReZgGgW6YQvhXA4g1ijUqRq+?=
 =?us-ascii?Q?PrYO9rXSDwAmut6er4P7k/rSasLLy9OIa9I9dyWct6enPj8Viqn9UzH7RG1H?=
 =?us-ascii?Q?CHv4qy0PjomS0mtYhUtK2y4iV/1CA5xwDxkyb5nBHvVajGKPTeNT858S4cIM?=
 =?us-ascii?Q?SgstljstCz5OgqDksZCdIB4jUwr9gjwCrs6l0rKd3WNwt/f/7kzYrRYLN6+3?=
 =?us-ascii?Q?F6TtZ5czBrxvPsSyfaK7Fjl3Jyx9pveHESe2E32I7Qzjvcuw3EQcJ1/Bxrxt?=
 =?us-ascii?Q?SYCgKwhDefDaAmQudDE4+Q+iXdrVNkfBsb3IUWH1Ft6nRFxLuoqB0vCBsQkd?=
 =?us-ascii?Q?9h6aEadK1VaetTJ+EX4Yo24Drf16OHj4xgK9ocjMiABNG+AP/iYFukNXGfsv?=
 =?us-ascii?Q?MF5oEG1rh61/V8psPIYlVMsSXMxwuMUU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef40d0ed-e517-488d-0e23-08da0b24de45
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 10:23:40.3704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfcZN1yce0stlZIU2eOI41BhENKFqLK26tfDV8YpWrpanndGRY933NjGiCqgNrCrPmIn0ZssNTN2gcWy3uefmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

Note: please properly quote your replies. As you'll see what you said
in reply to my remarks is not properly separated from my remarks, and
hence hard to read.

On 21.03.2022 11:14, Michal Orzel wrote:
> On 21.03.2022 09:21, Michal Orzel wrote:
>> --- /dev/null
>> +++ b/xen/include/xen/xen_lds.h
>> @@ -0,0 +1,114 @@
>> +#ifndef __XEN_LDS_H__
>> +#define __XEN_LDS_H__
>> +
>> +/*
>> + * Common macros to be used in architecture specific linker scripts.
>> + */
>> +
>> +/* Macros to declare debug sections. */
>> +#ifdef EFI
>> +/*
>> + * Use the NOLOAD directive, despite currently ignored by (at least) GN=
U ld
>> + * for PE output, in order to record that we'd prefer these sections to=
 not
>> + * be loaded into memory.
>> + */
>> +#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
>> +#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
>> +#else
>> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
>> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
>> +#endif
>> +
>> +/* DWARF debug sections. */
>> +#define DWARF_DEBUG_SECTIONS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_abbrev, 1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>> +=C2=A0 DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
>> +=C2=A0 DECL_DEBUG(.debug_types, 1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_str, 1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG2(.debug_line, .debug_line.*, 1)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_line_str, 1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_names, 4)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_frame, 4)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_loc, 1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_loclists, 4)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_macinfo, 1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
>> +=C2=A0 DECL_DEBUG(.debug_macro, 1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_ranges, 8)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_rnglists, 4)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_addr, 8)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_aranges, 1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
>> +=C2=A0 DECL_DEBUG(.debug_pubnames, 1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 DECL_DEBUG(.debug_pubtypes, 1)
>> +
>> +/*
>> + * Stabs debug sections.
>> + *
>> + * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These loo=
k to
>> + * be benign to GNU ld, so we can have them here unconditionally.
>> + */
>> +#define STABS_DEBUG_SECTIONS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 .stab 0 : { *(.stab) }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>> +=C2=A0 .stabstr 0 : { *(.stabstr) }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 .stab.excl 0 : { *(.stab.excl) }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 .stab.exclstr 0 : { *(.stab.exclstr) }=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 .stab.index 0 : { *(.stab.index) }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 .stab.indexstr 0 : { *(.stab.indexstr) }=C2=A0=C2=A0 \
>> +=C2=A0 .comment 0 : { *(.comment) }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 .symtab 0 : { *(.symtab) }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 .strtab 0 : { *(.strtab) }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 .shstrtab 0 : { *(.shstrtab) }
>=20
> Please don't add non-Stabs sections to this macro.
>=20
> Ok, I will add a new macro storing the last 4 sections called ELF_DETAILS=
_SECTIONS,
> to be coherent with what Linux does (ELF_DETAILS).
>=20
>> +#ifdef EFI
>> +#define DISCARD_EFI_SECTIONS \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.comment)=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.comment.*) \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.note.*)
>> +#else
>> +#define DISCARD_EFI_SECTIONS
>> +#endif
>> +
>> +/* Sections to be discarded. */
>> +#define DISCARD_SECTIONS=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0 /DISCARD/ : {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.text.exit)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.exit.text)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.exit.data)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.exitcall.exit)=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.discard)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.discard.*)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.eh_frame)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.dtors)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.dtors.*)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.fini_array)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.fini_array.*)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DISCARD_EFI_SECTIONS=C2=A0 \
>> +=C2=A0 }
>> +
>> +#define CTORS_SECTION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(8);=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __ctors_start =3D .;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(SORT_BY_INIT_PRIORITY(.init_arra=
y.*))=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(SORT_BY_INIT_PRIORITY(.ctors.*))=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.init_array)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.ctors)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __ctors_end =3D .;
>> +
>> +#define VPCI_SECTION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIGN); \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __start_vpci_array =3D .;=C2=A0=C2=
=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(SORT(.data.vpci.*))=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __end_vpci_array =3D .;
>> +
>> +#define HYPFS_SECTION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(8);=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __paramhypfs_start =3D .;=C2=A0=C2=
=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.data.paramhypfs)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __paramhypfs_end =3D .;
>> +
>> +#define LOCK_PROFILE_SECTION=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIGN); \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __lock_profile_start =3D .; \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.lockprofile.data)=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __lock_profile_end =3D .;
>> +
>> +#endif /* __XEN_LDS_H__ */
>=20
> I'm not sure _SECTION is a good suffix to use in the four names above:
> These aren't individual sections in the output, and for CTORS_SECTION
> it's also not even a single input section.
>=20
> How about _ENTRY suffix?
> Otherwise we can do different suffixes depending on the content.
> LOCK_PROFILE_DATA, HYPFS_PARAM, VPCI_ARRAY

I'd prefer the latter.

> As to CTORS_SECTION - I'm unconvinced of generalizing this without
> first getting it right.
>=20
> I will get rid of CTORS_SECTIONS then.
>=20
> Overall I think it would be better to introduce this header along
> with actually using the macros. That way one can check within the
> patch that what you move / replace actually matches on both sides
> without needing to cross patch boundaries. If you wanted to introduce
> (and then include right away) an empty header first, that would be an
> acceptable intermediate approach afaic.
>=20
> I just wanted to split this into arch specific patches because maintainer=
s are different.
> I do not understand your second solution with empty header.
> Do you mean that the first patch shall create an empty header (with just =
an intro comment)
> and include it in arch specific linker scripts?

Yes, I view this as one possible option.

> Anyway, I can merge these 3 patches into 1 if you want.

Well, at least part of the Arm changes can likely remain separate.
But where you abstract things by introducing a macro in the header,
it would be better if the original (supposedly functionally identical)
construct(s) was (were) also replaced at the same time.

Jan


