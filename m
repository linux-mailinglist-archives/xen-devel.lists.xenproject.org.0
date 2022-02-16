Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89D24B8D05
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 16:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274274.469692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKMg7-00004t-He; Wed, 16 Feb 2022 15:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274274.469692; Wed, 16 Feb 2022 15:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKMg7-0008TY-Co; Wed, 16 Feb 2022 15:57:15 +0000
Received: by outflank-mailman (input) for mailman id 274274;
 Wed, 16 Feb 2022 15:57:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKMg5-0008TS-5R
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 15:57:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a47bd82-8f41-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 16:57:12 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-BaX_eRtfPXusMu9qVQMNow-1; Wed, 16 Feb 2022 16:57:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7980.eurprd04.prod.outlook.com (2603:10a6:10:1f0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Wed, 16 Feb
 2022 15:57:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 15:57:08 +0000
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
X-Inumbo-ID: 1a47bd82-8f41-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645027031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nl3meSd5+jGLXE+GmNVidJkJ2Zx1TVlh0Ie83tElCs4=;
	b=jw0Em4SKsHSW5pCINt+eiv2rJ/4YtXafkoPP/5V4gI3BuTlyqjPSxjCWMx6CTVOOZ+1ruF
	sLRjOzHXPdCcdHCXDy7eow9wSwQblLc02lCVkRfgB6DW0PbPnTDaK5aRZmEVZZPI6NvK3b
	QinViXY9uz/SaBCXi39CvRsfwYqHD+U=
X-MC-Unique: BaX_eRtfPXusMu9qVQMNow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkvyHbYAT1XMLC2p7gzt/WalAYOILPEBfaO5AILHyYmOLOM9gyXEBntHkvy2CEhndNti+7PN+ski5wQgKlFv/f5cXWGfdbKxLSKRt1CLM7IF2+iS+s9qjUuHqi1ADzu1NdJycXdhVODmoNLiaZk5tH1ONug38L4ypJW52qU126AnxFEcV4Z//ba74gXKdPl0vXG1nTqLSi4QNCm5a6gLcelMgIu1C/3QzKJtyNiNQS5oX4Lntdr2ay0ZmYs1H3YC6Y/9V4DfjYsbYvh+rZ7kO/xcJjWbJSNl4jy8HIKtv9n/K8fqZvc6lhSMZnuo3DefUSzJnvm/hrwKbMmjZAu2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl3meSd5+jGLXE+GmNVidJkJ2Zx1TVlh0Ie83tElCs4=;
 b=SBiI6uLxVEHcg1Cccf85FCDBtcrGvhGrZ60HGxTWBwI6tHIbSgMtfXWg3yQZZP85dUf1PEoxGLOhu7cqIMSnqA26qngOzbKZxFcFDRzB7zZKjXXtvDRRkH4meyLac5+G+yRMhDY92tmklW4pDEAJIplDFcgkjq3CJrjrYhNVy9lGpimOmC+jxkrP7s4/TrSNNGTPP4iu4nGIygQINHEh6DxA7p48rMrbPk+a/hyLjmmxv/Rf/5uT//XUgyHdJl6FNnkkjJJtz3Xjw2/uF1TGP+j1GXjNVCPD4RqBZwFt8Ip01H8iSBOYgwOSGPtZtB7JSG8Aij+/J5OFvMWSqxN1fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09091db3-9711-6971-bd62-6dc337cc84c1@suse.com>
Date: Wed, 16 Feb 2022 16:57:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 3/5] x86/vmsi: add support for extended destination ID
 in address field
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: dwmw2@infradead.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220216103026.11533-1-roger.pau@citrix.com>
 <20220216103026.11533-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220216103026.11533-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0102.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40599085-2ac9-48f4-b24b-08d9f164fc81
X-MS-TrafficTypeDiagnostic: DBBPR04MB7980:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7980CACA1CEFC3DD1316E946B3359@DBBPR04MB7980.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5+4AQmoGjpBAnfXsq4R33v6B+08NIakSn+1TN7r/AQEfM44dyUQHwIxn6Fx2pjbknCVmhAuqNGl69pKP+9SwUE+X28C5Q8xpOntm7MbJtkektrt3JaF+RJ8MKeweXfdCXVVbpeecViH8E9/46/v/rprUJwAzAxETIrnjo07L0gNLUrEtA+FJwnaYi0+mEu1D1xFIrEuThpX52lqslwu4xb/ikZLvpsDMsiFOEu7O3kHSHK7ounK+r2UxGskq+kQMSYwbCgD8+RzVy00ZgTT0emO25M63oqC7+pH47hyKHqNcYiwy/et9kagoGOcSrQO2sgo1wytfbGB5T6xXy6MTS3qw6cNOFLU50jeevMSV37Bqg9XxCX3yUzeysAQJrYqsTtse6PiQ/JRBHGApdtxmlY1dlewoBqhjl5GckL+0sFXz4eGP58TSkKME6BeE+MmfcdSo1xA/0dzvAbb6ZVHv0isVyIVc9lk1WJLWCV4DI6zP/utoJPkEiINXNAV3wjkuLgAMG4U5GnC+SaKDNEBnKgAK1Yk1q+RIvifN/e18sEQ2/WVgqGt7BBDnuUu3rKX9my9UgdOtMqMBQbaI1+4hqegKsVElOZVfBsemncYGWe8HOTJQq9yHvcA8f0CEcUMgV3hq2mORYqVthiDLMOPJDG4voJkyJE5IR/f6DhhHaIgV4EbSHUDRYDgg+u35EeDCAk0q+p+aNRKzGkx4YxqWI6ksu3cvI//1KGa6oi/rQvg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(54906003)(26005)(186003)(6916009)(2616005)(316002)(6486002)(86362001)(508600001)(2906002)(36756003)(6506007)(31696002)(66556008)(66946007)(38100700002)(6512007)(53546011)(66476007)(8936002)(4744005)(5660300002)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1pJV3dmWlBHWitnUzZqOGtGMnpVYjBxQnJOMDlDaGhnKzFuWjFNK2JFRndQ?=
 =?utf-8?B?YkdtV1JQdUw0LzNmWk5ERFBKWks4ZVNzeFJHVUVIR1NZb0UrbjhZalVzOEwx?=
 =?utf-8?B?VExWTXZIWGJzRUc4ZGdzWUZFNW1Xelpkb1NyRHBJU1VoZHZvMlM5bVcxZnoy?=
 =?utf-8?B?d1IrekpLc0dSZ1FydGlxWjUyVG5rN2JBUGdpaHlmQ1E4eno5RjNYb2FiRGVS?=
 =?utf-8?B?SXRzdDJ2dkVPaDFhbi8ybFFaS1NSNUFVT01tY0pGSVdNcjU4NXJQMStwSzZm?=
 =?utf-8?B?bkl5WVpqdnFyd3M2SjVlSDZLdndDZUxidHJVRFlJMXI2MmhiN2lMeFovZ0Yw?=
 =?utf-8?B?eHU1ZmhmSUM0V1pNanI4c0lrWkZ0bWJKTWd5ZVpYdjlkNzU0aGQvRXJmdTFZ?=
 =?utf-8?B?K2taZ1NSUWg5Vnp4cUN6YkVWaGlsYkN2bTJaMXhrVjVwTUdWYlFDclAweGo2?=
 =?utf-8?B?dTlLc0MrcW9SR1U2L0NLa2hmMzZMd2hUNnlrUU1EYjJQZHV5UWZhVC9tNi82?=
 =?utf-8?B?cHFYNEtyREVzQzROeTB2cWNZNEZmV3RMSVV2ZTZ6MnNaMW90UmpJeDA2SWtu?=
 =?utf-8?B?RVdMcUs1NEM0SHpib0NaZ2RxMTdBWWZERktaN3VTQTBLQWpSK1pUS2k3a0Vt?=
 =?utf-8?B?U2U4NFJKL1VMbmJjOTNxRXB4dDI5dlBUV1RUWFlESE5xQlZOZGh5bDFQZkxp?=
 =?utf-8?B?VXpIMHRNUFVrWncyc0lCbmdGR0xpbW5aZ2NpK29UQTNocHZCMHo3QUFVa0l3?=
 =?utf-8?B?SWNQeHNNaEEzQXNHR2VWZDR3SUVvRFJiVFlYS1lENzFhd0h5bDE2NXczQm14?=
 =?utf-8?B?SElqVjhLMDNJeWFkMzcvK1lYd1Judi8yYVZlU1Rjc2hHQUtKRDFHd3R3d0pS?=
 =?utf-8?B?TTl6WEsybEo1ZUFPalVlbUYzZVFiNzh0c21EZ1VwV0FneGdtWmZNRWtWNDlF?=
 =?utf-8?B?MS9GdGpJRHVnTDh6V1N4RGhuYnFkaDgxbVMveHlZZzdnZHo4OW93Y3RQU1Bz?=
 =?utf-8?B?N3NrM2d2TW5Hc291N0kxWTd6dk1pMUMwcVg5bm9sNmJSaG9Mc2hlTTNocjBX?=
 =?utf-8?B?eTVLcS9POGU1a3BGNWZlMVp1b0xkQzFidlRybHhxemxLTjFKOTJtdGtGSStF?=
 =?utf-8?B?ZmpxQ0VGNW1FWHBNSEI1TUF5UEJoN0VBNlNTM3JIMlBDb3h6M2luZU1uSkVZ?=
 =?utf-8?B?TWYzbDJiQTdGaEFvTGtYcTh4ODMxUU5YRStpYmptYzNDSmhQdXhjREtNYWEv?=
 =?utf-8?B?V3lqMFZTcUoxK2pVMmMvamkrellTZzNrTHZ5RVhUVkJRTmpoMHNTZ1JFMFVL?=
 =?utf-8?B?UGhMQklocjY0L3dJMmlEMFpjOXJOblc2TzFodkw0RldvUFJyOWpaeFF6Nzlo?=
 =?utf-8?B?NVVSZDF6N2kxejEzTTVCMHQ5ZDdiUXc0RWp3OGlSTVlLbEIrRHFTS1I2eDEv?=
 =?utf-8?B?bjdBT2p1L3lFbkF6ei9WdDJMRWdaTndEQmZIR0pZRjl2S1FKS1hacWZCVGF6?=
 =?utf-8?B?V1NZV1g5UXNoZWptQm13WGl4NUVuWTV0alRmblhJWFgzbFZpaXRqemRwUHZi?=
 =?utf-8?B?L0haS2ZtWlBNNi93QmVXVGJGeEtleVBBVHhURi9qL1hMU1BWQ3NrOU4xaUhq?=
 =?utf-8?B?Ynh4MFh3amQrQ012aFZLditGMmY3VkU4b2g0dGVNalh4ZWxVbmg3M3FMSUFw?=
 =?utf-8?B?d2ZrUXdZS3BnSWpRNTdJcTR4OXpDNzE0T3U5UW8vb3Q5bExLNFhaR1RuNXA4?=
 =?utf-8?B?TEl2bGRuZWNTQUkydGtXdFVPR1UwbjJzaW1VTDVqcXRWejVuTjVYTDNHR05q?=
 =?utf-8?B?dGR1UVpIZ1ZWY0YxbGRWak1FMm1jMHMxN1BaREZjRGhzcHR6T3Z6aVJoN2ZQ?=
 =?utf-8?B?Y3JoaWIzK0xHOXllcEdHS2R2MjFORVpKMjU4ZjJBWnNERVdBbWgzUkI2VDA0?=
 =?utf-8?B?RlZZM3F5ZkxUMmVNMHkvVHMraFpJSjJlcHRCTVZsSGhoTGx4K0g1Q0R5TStM?=
 =?utf-8?B?V2tMODlzRE5yOXEzNStYY0dleERoVGM3eWF5aWo2V3lWdm1BOFJNbENCck8v?=
 =?utf-8?B?czY0NWdLUXR1WGgwTHVERS9rWHlFejlBMnBCMXdxMWovUm51ZUhKMWhGcUNJ?=
 =?utf-8?B?YW52QTRieUJrb0sxWk1MSWluQUZVV0ZFOUhtZE5pUVFHdzJidk9hK0VLQVFy?=
 =?utf-8?Q?Q7wGwOunC19ogM1NIeArZyQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40599085-2ac9-48f4-b24b-08d9f164fc81
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 15:57:08.6580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVYmZY/7MZ6Mx0obzV2TQCuN5hNn4feo+WOUy2kTYicSgl5MRWevr6eafDgl5/wXoO0KnnW5a12snXHyvJXl+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7980

On 16.02.2022 11:30, Roger Pau Monne wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -588,6 +588,7 @@ struct xen_domctl_bind_pt_irq {
>  #define XEN_DOMCTL_VMSI_X86_DELIV_MASK   0x007000
>  #define XEN_DOMCTL_VMSI_X86_TRIG_MASK    0x008000
>  #define XEN_DOMCTL_VMSI_X86_UNMASKED     0x010000
> +#define XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK 0xfe0000

I think this is what requires the interface version bump. With that
moved here:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


