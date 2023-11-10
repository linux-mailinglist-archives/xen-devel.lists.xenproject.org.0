Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5A57E7ADC
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:31:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630030.982696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nql-0004I2-Ki; Fri, 10 Nov 2023 09:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630030.982696; Fri, 10 Nov 2023 09:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nql-0004G6-H6; Fri, 10 Nov 2023 09:30:51 +0000
Received: by outflank-mailman (input) for mailman id 630030;
 Fri, 10 Nov 2023 09:30:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r1Nqj-0001XY-Gt
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:30:49 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d490e92f-7fab-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 10:30:47 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9974.eurprd04.prod.outlook.com (2603:10a6:150:11a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16; Fri, 10 Nov
 2023 09:30:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.010; Fri, 10 Nov 2023
 09:30:18 +0000
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
X-Inumbo-ID: d490e92f-7fab-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/1smTd/U5W/l897e/zpPXNFQ/9KyD5+HpvdEJH4zKYvagtLMVt3fcG19zRVPTf0YrV28gbu+3jkPkypwEtyClYTx1tyOBp4qFdAhTQEjMR4aXOeNqa5cYiUz+majaELYrB54fojYOHAPIsJMaJbXtNCwpAkxz3tbR3WvHiyajjIFkDZmF1eXZsoHSvaCsbkkFO/+jmvbVmI7/k8sDfWfcKLOXfMVM9Xt70VXULD99n3RQoH4MgtcNYt2IqyLNYojYTO4ekmXiLJF31/dgqcnQBIBtfOLISqUfJIRYOyi+L7pawea9Q1/gTkUe+1OF2exPb0tXPVH25WBiD2a11eYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvEW3lHlPjDqZW6RjabtN6gmhKE3xf1ZYztQzCTecSo=;
 b=DMVRjHnJRa0ZNzXrSnBdp0aXbjQ+nx+erMJVyrFnbqtn2eiIOFbITOYxHkgbdfEy03dvdBR7iU532E2Z8fkuCi6BPg/ubwFQ7aG5/GCJDXn5OGTju0HHq4E6Hh7aLx6S5iOrRl3NYdlN37EjedH1lo++H5ZU0jrEhC3bqDhdInCjjX6evXtgYqae3RqTqgiO3BdeVtDOyQQ0AknFGBSCZGRYyrgWRVzmpaWEpSVFxsJp+9oJTJIIQZcrX8+sTWZrQtNCQRu2a0Y4iqzDqzZ1jfY4D5BXm8kyNW9nF0fFGNnHR8U6ZfT/NZFGdscdKjZ2QLE5fmtCOM/GggPZmaeYhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvEW3lHlPjDqZW6RjabtN6gmhKE3xf1ZYztQzCTecSo=;
 b=tZ5kR+UgL7on0ejo9CTbXtT95VY8kwnbgQFbgMmlZNnQtfCl2dV6e/cpbKtVybD47QSQZR9kbEk+MHL8mbICCM2uJ7QFVtE5epSDQq1hU/fGSM8NcnKgk+qskSK17aeFCPEYwHzX8TSVkMhf4r6SuokfGQMUmQ92s2Sxl6v+QWwCJozJR/pBhBTDLYc/d+jJjGkYXwycWx/tN+fVDO8p8uceC3G1JvZwAbDFWuVZpvWFIzUeJcI69vRF9Oqc7Z7W6gryNPCZxfw40NtShUYCnhGvwHyj19Ma+bLs7/41j7hgpEc1+XI+OU3OCQhMep7myhg/GOE5dZwVPsRtLPDXAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ae66eda-3560-2930-4bbb-87345a719f32@suse.com>
Date: Fri, 10 Nov 2023 10:30:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] include/hw/xen: Use more inclusive language in comment
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>
Cc: xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
References: <20231109174034.375392-1-thuth@redhat.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231109174034.375392-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e3923f-52ca-4884-8217-08dbe1cfa75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d5/xI2/rrcWpsxMxR6o0Rn/QFMZhk1/PFwfISIaMi62ypc5dE6E5l7gEoNoo5njvBPXfRu5RAW7L/G4r/NDbmaMSb/10jH0EHjgXbArxthFlru6Uweh9uRK6zHSG8rgyM6VzcU+vko2ItzaBz1JBT0E5BQWXXHFiUyl3Hq92YDnEtDDomVrK6dysQZGXT+OzmcX1gthOu6eDIb0/9SyTAhviYSoxIYREGTY6FnxjcqfQcFXv9X8xVT9oOCAxI76SAj/Sn8TIaABsu07IkgytYnKpqmMEDzyeC20yDQeeueW8c41RWOnhrmM6MrwajMwI8jdnBtqCG5zmmJ6xtl9jUDXWbBqVv9KI4vMQxIISvdAkGy9gr/iRLlxQmROVX/BglH20Ll6K8nvqQmTRdsQE5LgpU5sAzQ7yAp7ggj0zU//1rWLCss7PTmeHuTSPPOlVw11A0bvDtsAhA5lUgaPX0myVyyw4JElcwx1kOI2dy6/UFnxhRgRM8ryvGQLA93sQPcGJw6/L1YD2rD6+kNijqpYv45Y0ColgFojidusoPFkQVIllRO0LiW24oPjF16PTsVY9Fco4fVQOcUGCYhc1fODLNm2xrgxrJl0+75a10rBIhbI2tBggzIg31WrBiF0brM5xFcfKNcOgQQF4UpqSiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(366004)(136003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(36756003)(31686004)(86362001)(31696002)(38100700002)(53546011)(26005)(6506007)(2616005)(6486002)(316002)(66476007)(8676002)(66946007)(83380400001)(66556008)(8936002)(54906003)(4326008)(6916009)(478600001)(2906002)(5660300002)(6512007)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmVkS2hBMEJnNGZpNEt2Z1E2NFh0c1FaVlBpRHFPQk96QlZTZnNFdFQ5Q1Zh?=
 =?utf-8?B?Rk1YR05vUEQ2QjRzbzZYVnY1OFpWTmNmazBDbG9paGQ2bDY3RDduTFh4UnRM?=
 =?utf-8?B?VzVnVXZYdWxncXhGeFEyTXhHSzBhaFhNRGhXRmlPNDF5dktVcTdmN2RKT05N?=
 =?utf-8?B?MTFjL3N4dkpZV2hjZTlKS0R6U24wbWp0K2JCYWRVeVJPRHh5NFJxT3AxNWZj?=
 =?utf-8?B?bFFVb245Y2U4TDZ4YVczcVBlU1laaW5pMk5XL0hkSm1RbHZUTDhTemxlUEZP?=
 =?utf-8?B?MHlQOXRKNDBXYnU3U1drcVcrNktIN3RGOERjNEZoN09CTHVFbXo3OTI2OWFM?=
 =?utf-8?B?T0lUT2NxZmVsMEZaWTV5VlVXZHU1elRzTUV6d3E5SnY5SDJDQWc5YzlaZ2sr?=
 =?utf-8?B?U1VHb3hLNEM3ZVEvWFNGVzlSSWIzN2JNYkdYTVUwM203ZUlnbHpGQ2FMNXZp?=
 =?utf-8?B?dWRkSlo5ZlYzdlhmY1FPMlJlTjRNNDA1OU5JRytaN2QzQ3FsZWxqQi9FZS92?=
 =?utf-8?B?ZDBEQ0xSZ2JvaE55c3FIanlsOVJNVkc2VFhONm5jOThrSkFUdld3YjRjVDdr?=
 =?utf-8?B?byswN1RLM0UyWHFKcG9kSFdxTEszSG9IeVFsY0FDVXJTTXRwTU1EbjF4UEt4?=
 =?utf-8?B?QTJ6Vy94dFJMeGtZWTJiQWhxMVFCNHErTHBKWXBuOEJ6Rzc1VkxLckJXbXpq?=
 =?utf-8?B?SkN6ckg3UE1pNXdWSmg3cWNtQmM4RTQzTER6blBDS3FsVm90NnJkSjhuVUxh?=
 =?utf-8?B?clBqR09vSFJkUEUwSGNKTGlhTVNOTEJkMWhaMTl0dkRFVW9SUkc0bTJmQkpN?=
 =?utf-8?B?cGsxMUVQaFJWQmdmVVRhbnQ1eUQ4czExbmtJcXk3dU5hYUNNRHl5emNybUw1?=
 =?utf-8?B?cW82TGdnMGZKMlhWV2c1dGtNenZza1VRcnhlRTFjT2pTdm42dFA2M0NqRnFY?=
 =?utf-8?B?Uy9WSXRHZ0pDN0hDN2hWOGc4N1I4SFBjSVVTUzFUcTM1UTJUcUM1U3VkOEVB?=
 =?utf-8?B?eEx1U2RoM2NjSGxwMk5vQWEwUHdBWWlCWGsvMFBlUm1zdnFMSkhsaHZLNGd3?=
 =?utf-8?B?YWRoT0Uwamg3NlNkR2NYRW9wcGMxOWpjTkJadDJRb2JQYXVQeWV2MXpSRUZL?=
 =?utf-8?B?TVFjbm05dkhQKzBEdTZVMDBZWXBFSk5pb2thSWNVM1F6SUNXYXZKek1PTS9M?=
 =?utf-8?B?UVhIRFl0S0gvVzBJeitnMHdkTTV4eDJRRDZQVlExK0x0bStVdS85NDNiODdP?=
 =?utf-8?B?V1NLUjM2c3V0a25JbC9MOTN6WURtMXdFNk1YamlrcEFNWVNjU3pSZDVidUtR?=
 =?utf-8?B?di9INENVY09lSVdINnFvWDFGY2Q0RVZ6b2tyTGFLVFUyT0pSRkhCeTFVL3B1?=
 =?utf-8?B?U0ljMG5vRDlkWVdEQVNOVVNyejBVa25LL1VRODJuelFKMDN1UUhwdFNRdGxX?=
 =?utf-8?B?R1FxNFJiRlNxd2tQRkhyVDJRTHBFVU0wdE9UWmxuWllHUUNtRTA4WEF6STJX?=
 =?utf-8?B?eVQ3Y0wvTFRUczRTM2xnTmxack1aMUYxTTc5VDRBYWtJSTE1U2JMcWp5MWp1?=
 =?utf-8?B?LytHbkcvbmJUbktuaW56NDZMMytCYXV4YXV0RVlIZUZDanlZNG5zRXAvbEty?=
 =?utf-8?B?OE9zRGJGaWM2K1BRSnhoSG04aHNMS3pxNmY5czRsSHpMdlpQbjJaZ1E2WU1s?=
 =?utf-8?B?SXE4b0R6aUFlaG1ZdXNJWjVQYlppaVEvbzFRMW9neXFIOW5FQ3FRV05xRzVa?=
 =?utf-8?B?dkR5dEJIVmpSKzVQblVUNmp2cVF0S0F4bE16c3VmU09ZT2tBYVRvQWd2dkpX?=
 =?utf-8?B?cVRLSDhoL1dpdHJMZHJaSkNOY09mcGZJdmRhZVRIUVM2L1h4YWZrZ2g3a0p0?=
 =?utf-8?B?RTF6VnZrYmZ4Z0xjS2g2dWdkMWRwZkovNEc5eWZlbXdzeXJ4MmRxai95QWY1?=
 =?utf-8?B?YWQwZlZOSmE3YkhTZ0l5cm9WWFMwamNvUTVxK1NGQWptcDg3OXJuckxjenFp?=
 =?utf-8?B?Y0dhUFpoZHp0NVRmZUFaYUw2aUI3TnZhaHFRVms0UFBvUm5wUFh1bGRrVm1k?=
 =?utf-8?B?RitiS0g5M0x3TUVFSFNXVzhiQ1RFbk1MV2Q4ZlRsUXl4T0pwOVZ4SndUT3B2?=
 =?utf-8?Q?583b0gsY50cBUtiQhcn+RS3m9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e3923f-52ca-4884-8217-08dbe1cfa75a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 09:30:18.6388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4Rkptm/ieZtSmM50ebRLskeisBlan4OFSpwa5Jx7P7IW8UYJrMyzonyr/uvrOm8nmFtZu+ovCrMju8ybtFVmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9974

On 09.11.2023 18:40, Thomas Huth wrote:
> --- a/include/hw/xen/interface/hvm/params.h
> +++ b/include/hw/xen/interface/hvm/params.h
> @@ -255,7 +255,7 @@
>   * Note that 'mixed' mode has not been evaluated for safety from a
>   * security perspective.  Before using this mode in a
>   * security-critical environment, each subop should be evaluated for
> - * safety, with unsafe subops blacklisted in XSM.
> + * safety, with unsafe subops blocked in XSM.

To avoid another round trip when you send the patch against xen.git, as
already asked for by others, I'd like to point out that the wording
change isn't describing things sufficiently similarly: "blocked" reads
as if XSM would do so all by itself, whereas "blacklisted" has an
indication that something needs to be done for XSM to behave in the
intended way. Minimally I'd suggest "suitably blocked via", but perhaps
yet better wording can be thought of.

Jan

PS: Personally I'm against such avoiding of certain words. Them being
misused is not really a justification. New wording (perhaps not
specifically here, but considering the underlying wider theme) is going
to be misused as well, leading to the need to come up with yet different
wording, and so on.

