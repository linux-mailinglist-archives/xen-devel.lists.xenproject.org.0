Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA653CAD1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 15:44:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341536.566770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx7av-00039j-0K; Fri, 03 Jun 2022 13:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341536.566770; Fri, 03 Jun 2022 13:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx7au-00037S-SD; Fri, 03 Jun 2022 13:44:04 +0000
Received: by outflank-mailman (input) for mailman id 341536;
 Fri, 03 Jun 2022 13:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MD4n=WK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nx7at-00037I-QB
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 13:44:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a495778-e343-11ec-bd2c-47488cf2e6aa;
 Fri, 03 Jun 2022 15:44:02 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2170.outbound.protection.outlook.com [104.47.51.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-D9pnXIHKMzWWOz8rqFiqBA-1; Fri, 03 Jun 2022 15:44:01 +0200
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM7PR04MB6983.eurprd04.prod.outlook.com (2603:10a6:20b:102::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 3 Jun
 2022 13:43:57 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b%5]) with mapi id 15.20.5314.013; Fri, 3 Jun 2022
 13:43:57 +0000
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
X-Inumbo-ID: 3a495778-e343-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654263842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQR9zYVAX1Kqo90P5iiXDcawPbH4FFqZT3c/W4o1Y/E=;
	b=DI1AS3vwCYHDpXU3K6bFyc78HYdr4FelFwe8oGpmfROQ8lI3d4Mhrqtj31jfCrymBAN74B
	P5yy8OJreO3AphQnpu7sZRTk8xTQUqVOrwOkDLA6MtVcqRgaYoOUP6Yjbk5XyJFAFSD22V
	HXpGpH5MynfZwkvrbdPKUXonRFTT2T4=
X-MC-Unique: D9pnXIHKMzWWOz8rqFiqBA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WL9FPfrR2U/8xVe6VjIYXtYBAmPjCKYW8J0FpmqbwWh9r2lj6mVFhbmGEyPuUZbgVfdczImmzuCzQ70UhRHRpe7OOT7tnIYGCMflUR86pS/4BQfkCv8tZPdUl+Y9I8vcA5wHCLKYBGgYM8VMoBoggWVdfGgJBQom2HcGPtigNrH2IdhfjIyb8jKE5I8XBzOoy09e2x/lnbR3vnH/kotLQFEf2vBNdgEc8xoOw+f+fUUx9X87OXOpxglZ6BPBbfTqg5SFlZMDMTWQdjVzJiEhqbEPWIuWyOtQQpa0lGCn+wT28CVAW4SlfKnlNJFCv5EdPVq5drnpLw2gZg9cUErcAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQR9zYVAX1Kqo90P5iiXDcawPbH4FFqZT3c/W4o1Y/E=;
 b=RJEJcFWQc3a+qjs0B47UxslNQebyvx3wUAXcEHuc/Apf+1rz7m8Wvs0mJPqVluuFn5dp4wWXAKfns1QLfw4K6PvHDWepYbqK5fe7izqyY/7Qos1Ju6Xqvk2wXuJJ7uATYZp1d3GoIa60jzbJ8/htX1JVlQWl99keRnScwGydyURPxbqwAUhT14c4aZ9dquMBKnzLOQSqryH9gAKczAtR/WFECvT2RvLIcNPVwImZGFikviNd0HtNLFDWhLOWPOLkRRTjM3fCpOQNq7O8ZUZKqXu3eLFqu/FFodKaP/5F+Oz1xSSO4rbSYT55E3pq3AknkJXIW+//gZvleetvfXYLnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5590d8c-2255-6dbb-6823-2db0ff714da6@suse.com>
Date: Fri, 3 Jun 2022 15:43:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v2 6/8] tools/arm: Introduce force_assign_without_iommu
 option to xl.cfg
Content-Language: en-US
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Paul Durrant <paul@xen.org>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <d333126d12f2281f8df92e66cfba1c9eb2425dca.1644341635.git.oleksii_moisieiev@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d333126d12f2281f8df92e66cfba1c9eb2425dca.1644341635.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0108.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::49) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0671c871-7e36-4069-ab9a-08da45671b61
X-MS-TrafficTypeDiagnostic: AM7PR04MB6983:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB6983CDA6530B94C44B902E72B3A19@AM7PR04MB6983.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cxhhd3vM2FYw4jdD1WOOJZBi1EzfMlQkNF14tWI7m/z8PLRUlYmcOaEU7nRHzaFMVk95e34ZO5TwVL9Db898QrbYP18FGw87Kh8l0NcXHDLOjZe2wl1OXx6MNfrslxPHkTCFcNiuIgxKhD07YUMha+f7ZhKxe1cv5Ezwdf1Uo2XfItGHBSJXTua02wjZ3Lbs8cOPXaG/yb2YQDQm5Dqg2wfm5EDezZuxe41Kc2bYzweWa9fgA1T20nELWyzWUwiEZ7L7Yyyz2VmPSU/XgEdoAbr4XLWtnGj0Jbc6gh9lDJNVFC9qQhYjVX1UPko/L2VqDkAsBMPe9d2wHUnuVf4GaE80Ie5phGBzoBt3A0VBmSowo7dmM4RDO9U3JPIRvwHwAmlTv+acb1X/S0kU7uJNw2/1SPEg8uSFzPgutBSL4xvVtGwMOX21suFa14ZzNY0POEMoO0RIdH593BJwZfjKKRRs0W1WDGIT48n/b7uDVN1niSGy7V42xP3yHVS716YrHzhnDl6JBindqBWTG7hE4hx1/xMuHbxl8XNtQmGC9jQ64jJNkc6JWo1WWVvBb4FOXm7gqMFN/XTTqKOLkLZPdLl3IcVJLclCehDTTzgXmDqWl9iVqa4/LgHTS3Oy6eytzsFUfnkujKHa1uJ/pnYQLrGzI+hWvOjVG4wXH5ZOU7z74WBWlRnqRDJ3EL5hWw3XiTGExArxH+mjQEHR5StSboHYZ+z6sSBFXQYaamBUDwskY0LYnmRQGxpKW9omOeZ5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(316002)(54906003)(31696002)(6916009)(186003)(508600001)(6486002)(36756003)(7416002)(5660300002)(4326008)(66476007)(8676002)(66556008)(66946007)(86362001)(4744005)(38100700002)(31686004)(6506007)(2616005)(53546011)(2906002)(26005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUFHUFloeGZubnBPNVJjS1FjRmVSMmpuM3hrZ1lZK3dOOGpSRXpyaHhvWUlV?=
 =?utf-8?B?dUZpQ2ZhSngrQWpiNnNNSGV4MGlQR01wOGlDM2JNNVQ1VkdvR0NPSitOVXVB?=
 =?utf-8?B?R0dPRWVoUlZQdS9SbGJ1RmUxVjlaQ2xPNXdvd2xGTy9MWjlKTkx1bXlrNFhh?=
 =?utf-8?B?dXRHOUZzZFoxS21USXB5WDl0VEIyZ292MWZYd3JwaUE2cksrbkdud2ZLcEdl?=
 =?utf-8?B?VUhZNXhZaHhMTlRLMjNaNEYwUkVCUjNxNzlCK0RuWm1lMGcyaThZN3BEUk5s?=
 =?utf-8?B?aHN3VDlpdWowMlhwL0hreUthT3lPdmFQbnVxTlBiWXBaOFFGeEV6R0U0cUNi?=
 =?utf-8?B?WFFzU0xQYnNZcEhFUGF5bGZ4OWR4dzBLaUQzaUJQUUFocVg5a240bkVlOElN?=
 =?utf-8?B?cEQ4VGFzMGUvWndsVWtFdHdNbm1wU21iTWd3VW9ZNittdXAyWXl6d3hoZTQv?=
 =?utf-8?B?Y1BpM092bWpMV1YyaFNNdzV4L00zRnNoUklDM09oMTZ4Q0VpazFtdEZrdjlT?=
 =?utf-8?B?dUhMUlpYN2xIRFhuY1k4OHljMzB1eFVPYU5XOXNNZzhidHBrS05PNjNIZTNk?=
 =?utf-8?B?TUZ0SkFnUlZVMnBSTW5DQTVKM2VFL3hubVhoRGczRmt6SVR3Y0ZXOVFabkM3?=
 =?utf-8?B?UXpZUlVyU2tiWUJnZnRmVG5rZmgwMWxOVHRLcllCbXkrVDlDM0phSk1jSzJi?=
 =?utf-8?B?U0ZNN21zTllqRjgwV1BDckZiTnluL0t3VnNtYnpsS0lPT01VMUY5RGFxVzRz?=
 =?utf-8?B?OVdWZVlrdSs2YW9yOStHWHJYb1NOTjNicTVCanVjWTBIeTMwWkRJV0M0bWRM?=
 =?utf-8?B?d1Y0L1dHbW9YeEFHeEZSUGNFZ1oxUGRLdExqTDczSTkrbUw3R1JUVU14SnZj?=
 =?utf-8?B?SWlUNzdwZWpYQ24wOTc5VHlkdmljT3U4WlpHWFhiV0dFM2VHZ0hvVEtzZGIw?=
 =?utf-8?B?VnVIWWZXNmU0YnBDdVlxdjJPOG1WdmtBWlc4QUJuU2RlVTM2MHBBS0REY294?=
 =?utf-8?B?K0gxU2lsVDJqNGtkR2RralJEOTFwR1VCSG5ndU1GV3M5eWIrVitXakF1RWFB?=
 =?utf-8?B?ejZZTXlsQzQreVJDVDJUbDVRL3ROa1pXWFp5TGxLM2RUR05XT3VoTXpsM3oz?=
 =?utf-8?B?Z3kzbjN2MjdoSzZ5SWJYUkpPSVV6cVdLbGg2VDVIZEdCNURMVmN3L1BBVUFx?=
 =?utf-8?B?bGhOU1I5OTlBcno1VzZHWTJQcUh4eUZsbGxXRGIxSzhrNnNkZUxOWFhEWnNE?=
 =?utf-8?B?WFZyaHBnS0NFTEd6U0VCQzU5MUVnc1d1Z0taZDBNK0lWS3dmTVBjejJDZjBN?=
 =?utf-8?B?TXB1MXBtaHNpUi8yZTFLWnVab3FoNk9UWEQ4WTZHMEdRSW0xRVhrL3ZWSjd6?=
 =?utf-8?B?UU5Xbzl2cFhwbEJDSEs5a3Rkc3lUdGR5dUVjaXdMcWNnNncwcWxIVlhuV20y?=
 =?utf-8?B?SWF0M2JlV2NUK1ZqU0tCYjgxNk95ZEdlck0vRmx5NkVNajExdVNUcEZXd0w4?=
 =?utf-8?B?ZHZSdG9OSXRqU1U1Sk1jQXdxbVJGWW4xWEM5VVk1Q0dHOGxTV2VVZWRHdlRT?=
 =?utf-8?B?K3IwWUZKQ0VuTDF2WTNWWkl2ek1VYjIvS1lLRmg2aWc0bENEL3VUclNCcEpW?=
 =?utf-8?B?VFEyYlFpaUwvWVRsY0FVaVcvMUQvZ0MvMjRLeW1zeVFHbUJRamx5dnV1c2xG?=
 =?utf-8?B?a0lOZS9SN3BibC9VV0dlOEEyb2ZXNkhEMEo3d0dxZVB5WURzU0poVSt2enJV?=
 =?utf-8?B?SkwrcS85c1B6aVR2WTFZU2x4R3hFMEVabUFTdVJjUVU4MXFSODlqSUtrMzV1?=
 =?utf-8?B?Q1J1TmtQK1RjRFlPajlYVCtuampiTU9IRm45V2lxTzJsU21lZS9UeTZaNzBm?=
 =?utf-8?B?dnFRcTVqWFRQWlNTNVN2UnR1NkFMd3MzR0xLMEh4WFJxRzNHVndTVjVEcGJI?=
 =?utf-8?B?OEhoRjIyTXhFSnIrSUU5VjI5RlEzYnYzNGZWNmZoNW5RUTV2NXJzM0NXWWdK?=
 =?utf-8?B?NDNycHlDMTNzYVA0aVRwdXg2ZkYwWEdHKzg2RTNKeFViZkk5UWdBYjdvT1Bu?=
 =?utf-8?B?aWEvMDJmb2g4T0xyWDY4MkxJYzJpN21jZDJHTHU5R2hDSUZPUjEwbW9YRUFW?=
 =?utf-8?B?VHJzaEltMGlidldaMDZ3RWRIZ2VZWVNrcnBYVnZtanMzTldJR0haQXhwM25Q?=
 =?utf-8?B?eHFnT08zeWxHZFFsYitBTzVrMDR6SytTOXRNQ2NYbzBweDhEem50WFdaQUFS?=
 =?utf-8?B?YkZDaThEQ0dsVXVzOXJ4ZlVnSTBCU0FJS0N6NGFya3lpdmxMV2pPTmhYcmdC?=
 =?utf-8?B?QXZGMHhyZFRKQ2xNSndjWUMwMGtzV3k0U211RUpzSDJJbStNMithZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0671c871-7e36-4069-ab9a-08da45671b61
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 13:43:57.0773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPpzhZIG39b7SSG8fAv997TPdc2DWAf/4kcyPjjh3hlhRxLUZbwF4SWhQLkZEms2j77AbehVJUJktsNO8f4RDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6983

On 08.02.2022 19:00, Oleksii Moisieiev wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -512,7 +512,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>  
>      if ( iommu )
>      {
> -        if ( config->iommu_opts & ~XEN_DOMCTL_IOMMU_no_sharept )
> +        if ( config->iommu_opts >> XEN_DOMCTL_IOMMU_MAX )
>          {
>              dprintk(XENLOG_INFO, "Unknown IOMMU options %#x\n",
>                      config->iommu_opts);

While in common code this is perhaps okay, the new bit wants rejecting
(or also implementing) for x86.

> @@ -534,6 +536,7 @@ int iommu_do_domctl(
>  {
>      int ret = -ENODEV;
>  
> +
>      if ( !is_iommu_enabled(d) )
>          return -EOPNOTSUPP;

Please don't.

> @@ -542,7 +545,7 @@ int iommu_do_domctl(
>  #endif
>  
>  #ifdef CONFIG_HAS_DEVICE_TREE
> -    if ( ret == -ENODEV )
> +    if ( ret == -ENOSYS )
>          ret = iommu_do_dt_domctl(domctl, d, u_domctl);
>  #endif

Why?

Jan


