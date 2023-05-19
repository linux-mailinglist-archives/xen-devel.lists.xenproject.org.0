Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1306709577
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 12:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536942.835686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzxkJ-0001Ua-TL; Fri, 19 May 2023 10:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536942.835686; Fri, 19 May 2023 10:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzxkJ-0001S8-QN; Fri, 19 May 2023 10:54:03 +0000
Received: by outflank-mailman (input) for mailman id 536942;
 Fri, 19 May 2023 10:54:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzxkI-0001S0-DB
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 10:54:02 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76383ec1-f633-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 12:54:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 10:53:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 10:53:57 +0000
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
X-Inumbo-ID: 76383ec1-f633-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgXT8LVcKp/r87nRK+8BKUJTdrRJSxn8GmB7Mo48RlN4cNTBM7Jm9DI9A+H6M7u3DWUh4OY9Q3+/iPE+QgTReIiaOwPdN4vyeZJuIOxVgYXxIKdNYE/H6CO2mORHPZlI97mnfF6gyuswEJ5yfwL7+ikaSzDJugP4myqw6QOfy7nANKI0/jnCQ14oY0oy/h4+vflUG3fBMKKoOMcCgAoKJJqWg+R57d2/XWITeuf3xpXOIjl1zc2MG2qeDBVSeEowTIdzbUSVfOq7J7h/d2yAJcQ2Azz0c9oL6TUABM5H9FkivWI9SRvf909Vcmu4IJ/cMNyY1OMi2sUFfwC1V5xYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ib20T4hZdR1RQXO2Snx3fTo7JI+hIMSkXXpI4ZrdNg=;
 b=hWB6sWj/PBhcA6TcD4FGQT+4R2Deh4C8Dvrc6sX+AjM3+ybCvk0At9DJ9Oz2aUJzwIWqFyzfNNdfwRG942iS6Xb3l9JNILPDfAWP7NlaSPVJTQh+fkZck2U/pKjbAMCh0P741Zx4mAamsmlN12MzcQ05/cfTEEyrVhhJ9MhSwy5NDxo6pq8o/tR3HvEHLr0jYw8pVla2aT5uNC2UhEygH/zy+mW+jQeriql6jj9f80m84hd2c4hVUIZpfpqYX92xgt4uE1z5my4TFBjtxPm1yf3HyfYH0KGIP/+ZGnNJk9QQzyimuAgM02R76J29CFpWGNvIa2yR+0n1/KLaSYd5DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ib20T4hZdR1RQXO2Snx3fTo7JI+hIMSkXXpI4ZrdNg=;
 b=oouLQodKS5YCe/lYF2QEWkH+WAGe5KZQMMoBiu2mZY/2/Lr9x0Js6E4C9JPl2tLzGTDtBatk8InmMq1XyXnXRYTEhl/WTyT/WOh8GuslR79sI4vGiYFKBiWeUxhf5KW7V6OTmdesKNA3cQRLriP4TiNK0E07pK9LnhBFJ3mHqq7HL1H7vvYYCuRsXmyFsqtnij6utpefDbVp4ah/1V59lnwQc+63vCzplAoygBwSKszWe7QI15T0zjhU7hSPeplArURdkJC4WAj2EVk6rLbVxq3IPnwDnQ83lksn/Nr+6WRnD6eYSYSq67b9jNfIX2DJsTrppv5JgG4EKUIcwjSfKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <94cc53ec-17c4-6ec7-7f13-e4f0f9e31e2d@suse.com>
Date: Fri, 19 May 2023 12:53:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] xen/misra: add diff-report.py tool
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230519094613.2134153-1-luca.fancellu@arm.com>
 <20230519094613.2134153-2-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230519094613.2134153-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9224:EE_
X-MS-Office365-Filtering-Correlation-Id: c3dc33b8-0d72-467f-b76b-08db58575850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kvpXnzf36ICWmFLz4nGryfzI8LvmBJxa6eqaaFo/fCVh0npDcO5+2Ijf8/pbUxh91gPmbAGLF5OrHCrvRJv5NJOJFkwEbk9E/h3rQyGph3io7hbgYluX8H0g3ukFw4d/VjVBZOhy4Ps9ypqhIz/1WZg6jKQt4XF5A+hFSwxvDf/8djc0eU6OlJkedCmOLbLcjKOoZ3TfY4XHx/LRuWq/TVKFJNKIM+7yZTk8pDk9Dqjy8e7gpFQUuiq9mCS5icI6+ePTva3xGeOedim16E54l27QM0D14WalJFe7E8E9CMA2mjtsVhbo2dqp1Hu5lPtLTTpqW9w7a9mVxHfrdq9kBTHboFJSJ7GnvgNI1UEtAovoyQb7wOG2yLjN8M7RN296Zc89km0iViFHvuf7eDfkDwCHbTyXGp1RzPQlbRjfOx1yoi7+uK1KqTtN+2QTEEH65j5SX/1x09pmVB+tSKK4FJ3sa+9tULVLylhJKVOFS22nk4zaX1hNMDaBDH3m71dADfYHnlTm74gpVpsYWUke6ryg4S+KU56okl60la3f+Wtw8W89NAaTv8X521bwQF0Ku/8COlR/8lz+CQ5xE2ZsCrobgi/9jvrl9Ikn6GXcgVRldLWWcJ7Ev5lZMf3dS1+aEE543FLFIKCH/4MIs2HSdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(31686004)(4326008)(2906002)(6916009)(86362001)(31696002)(8936002)(316002)(5660300002)(8676002)(66946007)(66476007)(41300700001)(66556008)(38100700002)(53546011)(186003)(478600001)(6512007)(36756003)(6506007)(26005)(2616005)(54906003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVJzTXZ1N3VzU21oZE1wWWRQMkxJYmQ2dGxxSi9vVzlPand1aDhCSUpnUjlO?=
 =?utf-8?B?dDFBV2JvQThobmcreWhHcEwxSkN1amR1S20wOUJVY05VQS8yUTlIdGczQUpq?=
 =?utf-8?B?OWxzazd2TjNjdzVaR2FCTTU5bkE1MzF6ejBFVm84TGhzcHZXNkl4UnhkUkFF?=
 =?utf-8?B?WGExTG4xV0pNalJkS1Bsdkc4Y010TmNHcnBuWGh5dDcybmxoYnArbHdaQkpu?=
 =?utf-8?B?RDFNZXJYSnF6eGMvODNwY3AvNVlDZWtwb3pCVFpZbDRQRjVHRGJ2cnYzaXVt?=
 =?utf-8?B?cnFlQVlUSEdIZEZ5RDJUVGxjUEljM1c4NXBOMlN6ZE55NzVNRTlLa1AweHBO?=
 =?utf-8?B?c1JteWJRVFVUaVJ6YTczMkJGcmhIV0hON3lveEJIcFRDaHZWbnd3b1d2aEwy?=
 =?utf-8?B?K3owMDByT3ZPbnBBcFplQ0Y1RFRRMFIrZ1FaSldjaUJob2YvSzZIckZJV29n?=
 =?utf-8?B?NmFTazB2U08zRWpDaGNxQlRLVzZCNnBQdTI4OXFUREdUcWRXV0VqMUFRdTNF?=
 =?utf-8?B?UWVrT1lCSnJuL2p4RUxwM3MvdkJNakxPRzJLQm51b0h2b3pwaUJrOXV2OXdG?=
 =?utf-8?B?UTV4MW1SRnFNWGVld0lIbHVXRDRFSlNsejNEaURMWVlEam5Cb090MVdGR1lP?=
 =?utf-8?B?azdjak1oVXpITjlpRGRtVXk5MDBCbGUySHhDWkZCOCtDM3BVZG5yV1FFMC9i?=
 =?utf-8?B?alUrK2h0VEZvNmY1Z2dDM3dkWWYrTU00VkhoT2puYWZOYjdMSDJndFZSZkdJ?=
 =?utf-8?B?Mm1GcjhERFAwUVBZRXlSbzU5WUk1aTJTZlBZMlV4b3hYTDRHaWgwQUlsMzZ6?=
 =?utf-8?B?L0RCRmQxbnJtNG16S1NaVUU0N1B3STI2V2JLdGtqTEkzTGx2cTJRYXFENHlY?=
 =?utf-8?B?UndKSzRZV09UM2cwblJPeFNvWjBnQWozVWhLZ2Rlb3A5SE05VDVmc1FBdVo5?=
 =?utf-8?B?MzZ2MStnK0plNGVrVmZ5dUN4eEEzSVJRVmlZSk8zUGJLa1Z1L1dBVGhMZWZK?=
 =?utf-8?B?T1Rqd2tXUjFxNzBUTUQ5Z3FkOG1HZm5zZ2F0a01yS2IyZGI1N0pTdFlYSG9Y?=
 =?utf-8?B?RUJLQlFtWTZOcXVBYzN6RU9pVlJWTExFSzQ0Z2RPK2EwUjhvL1RRVmFVdG52?=
 =?utf-8?B?K0toL1JaNE5aUmp4ZTdsMEtUOHNleWlzeWFZZ2d0UXcrSzZUeEVqSnh1bzcy?=
 =?utf-8?B?YVJtclk4N2RURXFMVXR3cHY5bytRVkVqUVVha2hhdWhmTWNrZkQrc0daMEQ2?=
 =?utf-8?B?dkp6aTkvNGx1b2xzWmVsM1Y3NCt2M1laM2xOMjhzcWdnRXlZSVNXRWtZSXZE?=
 =?utf-8?B?T01vOXR1N2l2ZVU2VHNMWDlodUlwWE40dG9ldDhOUGY1dnZsb3JIQ2wzZml0?=
 =?utf-8?B?N1BlK0UzYkdxR2MyblUyd2h0YXFnU0tkMlNhUlZZS2l5Y0tFcGhZaW5QM25R?=
 =?utf-8?B?SUlBbWdabjdneE03Y2dCVDFUaUVUb01PRFRqT3ZSb1BxMk5ZQy9CdXdMR0ta?=
 =?utf-8?B?KzNZOGN2ejRXZ1E2dVgzZXNWODJobWs5UmNtYVhYMGJua3RHNG4wcFVpN1Q2?=
 =?utf-8?B?aUgwOGpOWXhLdUFIdG01MlR5bnJEb1FCVjFLMytJaVRmMWhhL0xUTGU1b1RZ?=
 =?utf-8?B?cjNmRnhteVZPVUdaNTlBbUZjYVllZWYzM1BRSmdSa2hZRG9ndmEyTTRuYzE3?=
 =?utf-8?B?ckphTmx4MkNZdE9uMjZIdWU2OXpBeDZ4cnFvNEpJc0k0WE9lV2ZQcCt6WHBZ?=
 =?utf-8?B?S3lRR3FLMFhqbW10UE9nQk95cWo3NC9JcGhpWWJDQXZPOGV0UEZNeVhIQ1BK?=
 =?utf-8?B?NVFGa0R0d29ObFdBQVFib2hEQmdSRVhMSzhlbTVTaEV6bVNpclg2S2JoZXhn?=
 =?utf-8?B?a1pnKzRwYjg0dDhMRnJWOEhCampHeGwxUTIrTEFRWDhJd1htdG5hZkNTalpK?=
 =?utf-8?B?cXkzdERMTWdwWkJ6cEw0OXVOOFlDQ1JqbXlBU0w3VjdZT2hYd2ZScmlEY2Nw?=
 =?utf-8?B?ZTlGQm5wZCt0VkN4OEJXWFhFSk9pQk9SdmVDdjRYZFRpaWdEWUlmWTlQWnha?=
 =?utf-8?B?Ujh6OU9ka0lyYnVhdEZoM3FMQ1ZHN2dUSXExNWxHNXNOZjEwYmVrSDhxeEdj?=
 =?utf-8?Q?cTBZXSC+TpWj6QdML5TkGlRdp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dc33b8-0d72-467f-b76b-08db58575850
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 10:53:57.2362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0NoAGSTi4Rvadp7mnnECVwzJlb1wprrsX/LpBXWxs+ySHg5XTQn/A3QenaeXAwicKeQ05aymrEcxopUBS1cow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9224

On 19.05.2023 11:46, Luca Fancellu wrote:
> Add a new tool, diff-report.py that can be used to make diff between
> reports generated by xen-analysis.py tool.
> Currently this tool supports the Xen cppcheck text report format in
> its operations.
> 
> The tool prints every finding that is in the report passed with -r
> (check report) which is not in the report passed with -b (baseline).
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from v1:
>  - removed 2 method from class ReportEntry that landed there by a
>    mistake on rebase.
>  - Made the script compatible also with python2 (Stefano)
> ---
>  xen/scripts/diff-report.py                    |  80 ++++++++++++++
>  .../xen_analysis/diff_tool/__init__.py        |   0
>  .../xen_analysis/diff_tool/cppcheck_report.py |  44 ++++++++
>  xen/scripts/xen_analysis/diff_tool/debug.py   |  40 +++++++
>  xen/scripts/xen_analysis/diff_tool/report.py  | 100 ++++++++++++++++++
>  5 files changed, 264 insertions(+)
>  create mode 100755 xen/scripts/diff-report.py
>  create mode 100644 xen/scripts/xen_analysis/diff_tool/__init__.py
>  create mode 100644 xen/scripts/xen_analysis/diff_tool/cppcheck_report.py
>  create mode 100644 xen/scripts/xen_analysis/diff_tool/debug.py
>  create mode 100644 xen/scripts/xen_analysis/diff_tool/report.py

If I'm not mistaken Python has no issue with dashes in path names.
Hence it would once again be better if the underscores were avoided
in the new directory names.

Jan

