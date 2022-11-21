Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7914163295D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 17:27:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446772.702575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox9dj-00039G-4k; Mon, 21 Nov 2022 16:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446772.702575; Mon, 21 Nov 2022 16:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox9dj-00036w-1Z; Mon, 21 Nov 2022 16:27:23 +0000
Received: by outflank-mailman (input) for mailman id 446772;
 Mon, 21 Nov 2022 16:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox9dh-00036h-BL
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 16:27:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e5e0f1b-69b9-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 17:27:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8187.eurprd04.prod.outlook.com (2603:10a6:10:24a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 16:27:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 16:27:17 +0000
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
X-Inumbo-ID: 5e5e0f1b-69b9-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0fNpVRGZjrzI4uaz2a4r27xN9Z3GFe5+eBcsOl7cvgs6hGTDCS9S6sQ+O5GwCbqDnpAexs0+Hf5h62NFPtOqBBQswtHeHtrSV8dlU1jJ/OQO4EI+FSGdyC/9sCRXe+6IvjrDIT2Kdhs1zsvewjcgMr+Ypg+z60ZZjRUt8AOKQo7C0zclDDLtLEJoZQaHWXo+oeaIkJZFbUkOLhlpuMd5bxTA5dW8XHEAR4b21IKlqnAtbHjeIGDm0AzlkNDM/KUXfO76IyNQnV16AvaWk8pCm3e3Ev6qDPVz5Syeu7W9uHq24xa7eAJSXYrm7MHuk010TcsEfXWJnFz5EiMiUQqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gweotCxjxxG9H3WOS31m2tZBG9WvznEGBh8ZcsSAN7k=;
 b=VAikol9qkYkgZdB3GZVExlymDwGUr8/fCDoZ00UeLrx0GQ6SDksu4w8o4r86kpIiJG7ZCAYYJz/uaNT6sam7jDwCwAgkQc7/2AQYn2zlqu6VIZ/1XFUDut9LfgHhLvUjbNRQ2dyuTUm/1lwYfEkrWWyw7OaLh4wMdev48uvfwKDYHD/XE1PjKmSLgtu0tKtfRqzf26dxbVsOyxFpEc3ex6mSAFuxPJRPrFJi6Har7x96R1hGltuJJdDbERvRIEVIzpIQGDGVO83qTbEnimHuuiRhSvzjkRzjd1t1y+kSh3ic8rxbYdncNEttO/WySoDrUR5IRnAiCp+yVZ1b2wOkvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gweotCxjxxG9H3WOS31m2tZBG9WvznEGBh8ZcsSAN7k=;
 b=HSkJWJQTdnO3xwYRZ0H2N+rf8jkdJnTQTPMiVlhrKW3AyyeVvNak/KYk2P7nl2Kcg7go0Rsk1RyPAXBUAmN05iJsJGIO4mmlJkU1SJ+BCEJP5UQJIthvLR2Mjc3QVn0VQxggcSfdyeFWJG6gNp7quh0T6Nwn76tVUtRPFq/6R2A8zbD5BkWZmOA2bs7IkiBHugpD+jMhCg5tEfF0lDnXwy3eyygpqb3PIaDObzv6JCwnbgybcvml3FAC+MKkgbppVyso2NJe9v7YNMliGpaWr3YrDvyV4Km5Qb9/LKrXHxWbAZnr8oRkpqnnekzshmEcK0T6CWRy83xQjvOlTOFUvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60663f81-09cd-e46b-bb94-1afe50519086@suse.com>
Date: Mon, 21 Nov 2022 17:27:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: EFI's -mapbs option may cause Linux to panic()
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: e614d7a2-c914-44ab-0180-08dacbdd4164
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bZboaLBNqMQ0K/kZbYLVzIMDCic/c8G53ynjGmvRGBZxoxY3PEW2nVnEqdqNoQM4QAA0yltE6Yd96Sgan5SK7aKzoMN2uns77aK4XnjkK0/voeGsrrrP6WaB5HY6StJ14QlZl9ob4423OvG9EUXkunpTkT604FHERZCacqXHglfQ/4ZvoePePRmsikqgxQ8H1AjnSNnYj0zbAA9YfzZGLvu6U/Sy9OQ/BHvKbErFgqD7vPGIsEiuRYOh7dSoN3JP8dobXyl8HvIDwqxVwWpW7H2REt6NbHQoSXTLJzkyqqmWtezZgoN0Dt5WxjbXDwDug/10RbxpUMw8F2qwvtj8v1PPHPLlv2WlIGlw0KGV4TE84079Altlh7CWOj3PodNsSkWolq2S+PSd6azK8qglvaaueVLloEVe/aKfPtuSqa/B1AlxYWBX+yNavf+6HnsMn4ES+RISg2X/5IUdR3klwqaAqsn3UsJfQJ8zC4A+Kgi4cJ+LmerNQgBLY3Wg9wFca06UMVPa/jsfCwhYrl9CMXAIGgNTZD5kzQEWb8eZgSkQn7761Z3lEogdBrg5LMAVxXyaP1DmrmIxYSsM6qOShBoORYKZKb9d44CnhVr4H9Q79wfSVIZ6TB9rI9DcqN5edGB2/HP877RnAXOd2q3PWFD8lWS/Fvj33rUxruh3HpTyp6N2UxEB9vqctws5Dtd3yCrELevNlZi9Tfo/toyPTKk/INyrlCYm5FaNN4DlSI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199015)(31686004)(36756003)(86362001)(8676002)(31696002)(2906002)(8936002)(4326008)(38100700002)(83380400001)(54906003)(6916009)(2616005)(316002)(186003)(66946007)(66556008)(6486002)(478600001)(5660300002)(41300700001)(66476007)(26005)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mi9BRGg3RVVqbXpxblJnSFpNN1RIZjYrRjBmRWMvY0k4bXZ4Q0VZZFlGbW9q?=
 =?utf-8?B?cXhDbS9peURGWDV5SlJ4YnE4QXJNYkpLOG0rMHVINEtwMWRiQ0F2WjZEbU5z?=
 =?utf-8?B?U2FjZUxxWTIreStZN3dsUTFmcDVObEQyRVN5S0FBeXRnQXNsZjJsOUxacHBo?=
 =?utf-8?B?Q1Q1UlNzbHFtSkJlNEQxMG1NVmR4Mm1jZ2JZYWxuVGRITndPYmNoYmplUkpU?=
 =?utf-8?B?WWNRL01KcEVYajdWRVNiWGU1STJZcGFzZlQvNjRvNjRJeFQ4b1VwUndqbnVo?=
 =?utf-8?B?dlhHQnJKdlgrVUNkRUZnUCsyVmdZTHVSa29aSTBiNktnc3gzOUJWOWs4Q3B1?=
 =?utf-8?B?bXdPY2x2cGtGRDBTMlh5NHpxNTZLRng5R1E4S0Q3UEVzeVBHQm1LRFY3Y1RZ?=
 =?utf-8?B?dlYxSEdxSDhtb3BQSktENWJjb1cxTElncUszb3BjcHFnck1TcGFnWk40YVAz?=
 =?utf-8?B?b3dNWTA5cHBCVzYwUk9MNXc2eVRJRTdJbDlEYzd6NW1vY0VvSGlSMVBFaE90?=
 =?utf-8?B?NGtwLzhEZytPb1ZFL2FhRTFDcVRBY3VDN0xMRUVIUUZ0eHlLcGFrSmI1cWR4?=
 =?utf-8?B?RFo5ZUhucTZlQ1Y0OFFxRThDTHBQdW5rWTdHVnlzTmc0U0NRNUFsNUNkSjdy?=
 =?utf-8?B?Y0RIMHkxQnlRNGxBZTZKbVpHQzNuMGlreSt5QVgwOW5hV1ZXWURUUU5valFJ?=
 =?utf-8?B?WksvWVdmcFhvRytlWFNCL3lLZUg4aWNJVFJKUXBPZGxnNGRvRUhGbW8vV0R1?=
 =?utf-8?B?bC9GRnpVSWt1YWdXVUVTbEhqbUMzRHhUK1hWdjh5MjZ5NHErb3FQSHRXTFRk?=
 =?utf-8?B?NlFtK1VBL2JyUTRSVnZXN1ZLYzdRRjBvVlh0RE92ZEMrWXRiZGhmR21WclRQ?=
 =?utf-8?B?RjB4TVI4MkRnSXA5NmdFNmp2ZkpwbmdxMnVzZG9vUmN1TkFVNTZiaWszNjFl?=
 =?utf-8?B?ZGdLcjZTblA2dEhrSHZjc3c0eTFaS0lNRVZkV0pVYTlkRzFhMjlHSDFpcTJH?=
 =?utf-8?B?UWYxOE9NdXYraEFqa0xRTUdNMTBEMFJEejhSdVpkazAyem5iTjdKUll2VHVq?=
 =?utf-8?B?MTdqRysvemY0M2lVRGtrWFhKRitFSlBjSFk0bDlmdXlRdEZUMVlTUDlHb2Mv?=
 =?utf-8?B?VUUzM1I0K2FhWnpScXVPN2YvUkZJWllxNWx5Wk4xdTAyUFBkQitqWVcxdXVQ?=
 =?utf-8?B?a0cvWXgxOFBDNWtLcnJhc3VjNlI0SnNiR2ZZU05WVFFPTDFqMjBoTVl6NS9Y?=
 =?utf-8?B?cnEwY2ZYYW5rSnJmZktxTlEyTXY2bkdpbDNCaWYxQndPTjEyV2pML2x1RUo2?=
 =?utf-8?B?QVhQbXB3UENQcFA3SGpsRlFwQ3dVZ1hXaTdPM1hkcjJGby9QNkx1NndUcFV0?=
 =?utf-8?B?dmowTEVHdlFBdUhHd1NjcWRtS0k0WWhscnIrdlpKZEZ5Smsrd251eUIyNHJl?=
 =?utf-8?B?N2MwK0lHT2JOc3JncytjZytXUzIvUTZzdzliK0pOd003eFhGM3FHdFVGbUM5?=
 =?utf-8?B?VkVheFNSSXBHekRIZnFWQmlnU015aExLbXdFMjVabFh2WUYyS2xoZnp5YU1s?=
 =?utf-8?B?REtpZ2g2eWdJSWtXdHVmNTR1RHFhOGJVWm9LTENHYVgraVNYVWtlSUdoOVVQ?=
 =?utf-8?B?QmNuZlpHWFVwMWNwUzdYK2FHbTRhaTRPSVdRU0N5ZTdJd0hGNHdjWlRHbk5Z?=
 =?utf-8?B?UGlLOFNCeCt4a0xuSUhwbTlaMHQ0KzN2bE13NmVWKzNTVjYwSUxBZ0tvWU1O?=
 =?utf-8?B?cFErcm1JZnNENjJ1LzdlWG5EUkovbTZYOGllMFBCajFvbGxFTGgrVVVMZU45?=
 =?utf-8?B?WkV0a0hsa3RyVkcwc0pvcGlxN2JHKzdtUnphMW1lVGFVc2JyYmNOU09VUy9C?=
 =?utf-8?B?RWtnVVpuTnJxTXBTSG93NVZpcEU5MHVTRTNEbm5HN01Bc0crWTdocS9PZWt6?=
 =?utf-8?B?N2VTd0c1WGxkbjZFY0FZeXlLMlM5ajZjMldqb2k4L3J5VHpqMW8yMko4YVpU?=
 =?utf-8?B?c2UwdFdKRk5vY1dvWTR3YWJnMWJMOHV1WWFzOVNYRHdoUFdIa2hpQnBtdG1V?=
 =?utf-8?B?SGp6azhlRnY0TnB0STFOcEN6eEUyZW1oZncrd0lYWVNUMkRwdHUzUUF1cWZj?=
 =?utf-8?Q?pf2n99tPgYQlYwoy+dXOB0WS5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e614d7a2-c914-44ab-0180-08dacbdd4164
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 16:27:17.2567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibZetBuCKPnB4T8s0fgpUdA9468jB0O0XZ2uoBJbsptolkHqkBXJKf39+SGEXbiLYweGU8uaW2QWX/ADG3Opxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8187

Hello,

on a system with these first two EFI memory map entries

(XEN)  0000000000000-000000009dfff type=4 attr=000000000000000f
(XEN)  000000009e000-000000009ffff type=2 attr=000000000000000f

i.e. except for 2 pages all space below 1M being BootServicesData, the
-mapbs option has the effect of marking reserved all that space. Then
Linux fails trying to allocate its lowmem trampoline (which really it
shouldn't need when running in PV mode), ultimately leading to

		panic("Real mode trampoline was not allocated");

in their init_real_mode().

While for PV I think it is clear that the easiest is to avoid
trampoline setup in the first place, iirc PVH Dom0 also tries to
mirror the host memory map to its own address space. Does PVH Linux
require a lowmem trampoline?

While the two pages here are just enough for Xen's trampoline, I still
wonder whether we want to adjust -mapbs behavior. Since whatever we
might do leaves a risk of conflicting with true firmware (mis)use of
that space, the best I can think of right now would be another option
altering behavior (or providing altered behavior). Yet such an option
would likely need to be more fine-grained then than covering all of
the low Mb in one go. Which feels like both going too far and making
it awkward for people to figure out what value(s) to use ...

Thoughts anyone?

Thanks, Jan

