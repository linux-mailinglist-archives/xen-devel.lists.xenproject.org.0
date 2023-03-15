Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97A6BAC59
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 10:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509999.786873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNdp-00027G-Su; Wed, 15 Mar 2023 09:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509999.786873; Wed, 15 Mar 2023 09:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNdp-00024e-PT; Wed, 15 Mar 2023 09:41:53 +0000
Received: by outflank-mailman (input) for mailman id 509999;
 Wed, 15 Mar 2023 09:41:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcNdo-00024Y-0K
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 09:41:52 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b92642d-c315-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 10:41:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7063.eurprd04.prod.outlook.com (2603:10a6:20b:11e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 09:41:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 09:41:47 +0000
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
X-Inumbo-ID: 9b92642d-c315-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V68CyonK/zMf5bTOQk7cw5XWgLrFnZpqbBrnM3o7Xs9yPqLTcmlxMpkow0Lxbs+RwQ4GbSY0gkzSJLQoX5QPRzJi+/B1rdsKetCeaBHWbVi3zoJZRkYkIuDzEsABvK2BtT6vsvOgJPa1Y1ZBTN3ZTyTepVkctLvN13bB8oJp/+2bOumydiaTYbu7nmErpEgZJLg7CxCgQaUKmJ5EA4rj5DhlNd41jGGneG7le3od/9NrUJF9MD45qG3BBru/93vc+T86bbS6TgdrfFDq01DBMYgJUXbEIK9ZVTHUbOPBY/CXskOU6JhcSbAcJbcxqYih4iQuHpOeArRyS9PjsSWOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwzEvm9XOJIlS1DQsIx/e2DBLzmRCg1SiOgzZP7dD7s=;
 b=BcCt/b39fJDNndNJWNujcTE5Hfu5UyjhiqVgCTJuSGZRgwhvhGbdWIoWwrnM5J0B7ypHxTmQWxcVWEicRNUQ8iyK9GHh98qRFCKc/OhBjz1BkG0JGz5Xvu+x0qn5P8cpj6GXH5gBM8bR8BJvzllLcjRrSv2YykIR4AwqoDlIhJtndXJkP8FmUR1w/pGjZSoR3+VAd7IawWQq6wNGewjfA+3FJBIxjZSaY92IyAUCC01l2k8C/6MSI+IYdu0GRSQO1jAxOdmDWlRpR9fUptsFSY4OJouQfaYi6WVbG1cheHV9TVnLom7sQMsTQQPhukHrk1uOvfE9KTLD9+IdtEGldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwzEvm9XOJIlS1DQsIx/e2DBLzmRCg1SiOgzZP7dD7s=;
 b=fLKBdjPBpU5/OaWb0LzfMUqEUvDExym0XA27wAzeHD6YV1xy47EcWED0wjeh2rDIFgfgu/+gH8WWYuapXek0jlbQflu4qSgsDCwcKYqKGV/RS3/WvxeVPdT8Dsf4/o2UgOy9/sxf9vwk2qgt/ZD0PgtqEkbuUcTF/3S1ocnKSVu3RpB4ywCjBNM5t9Pms7HdR8u7P0PJCMuDS1vCVCRAcZ1zPUTRkV8iBB/f6pzD6flAk4QeMpOGmUhkO0hL0wGwf/aPrOvFQMp6abb9NE9eZmbXNYZzEsKhXlZHEJdf7vB/i4zOuKJn0Si5NWGj+tMz6eZrj8APe8IDnIap4xXd+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29cf7623-688a-4b88-c684-cf195d0626dd@suse.com>
Date: Wed, 15 Mar 2023 10:41:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/10] xen/physinfo: encode Arm SVE vector length in
 arch_capabilities
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230315090558.731029-1-luca.fancellu@arm.com>
 <20230315090558.731029-8-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230315090558.731029-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: a60e7a67-c1dd-4366-7026-08db25397e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5TW/XBx6U4bN7XgiB8nDeHLRHew6oD+jwyWIbB/nRIHnF6HhxxhqzkiNFTPetnmLvY4qSIdQqhiKXyfRUU3udhphUcxgv2/BV+YoakZfxMLqVgRyxeEtYtYpIVW70QepCWCJBLt3ifEg4cd8VNY9FKVxzE40m5LpIC9R3OyLX96U7pA5Cy07/Sb1168kaExHYK3fUVWU2c96X/RXoKXt6HspPvfqYB9s/JYJzPpy0wfowIvI/XIHuVicm89wt8hRMnrr0Q9ZBDZ6C7K6Ul/RoZCD75VI7RNg59PNBPG20qvjgEaPjlewnltJB86ljSLFZ0ZrGAka+/uPnQJeyPV9zRQ45IS/khhF6FxVeFdGkCxiRidK3ciZhQ5Kq1+CLleifSIRsO0QsGHnX2MU69QkRpSLXTqWfQMmieaoiALsPxTkT5FnBJG5qYdvsSOa05G2xomKwWNdVADtcpxOIiKCcnwFY353VaVDmG4FBniFXYRWw1BZ8qMiWdCx9WJ8Pue4oT3h7jyN9dTCPiZ1JfPd53+2o3XOjI5ZfoZuMHS1GY/xdLLIC5zbGuzzCQG+mjbNE+usaExVMNZOwV/K14IaQNMN352WcrZch1ok8hRJcT9nOsLNJ2L/oBAd7OdFFR7tUTtKwHxg0OVqeglOoGJ8lfAJpms15HvNWTu1WtH1kQyJNbgZMm4uUt4+Jw8rbmW6oWpIT1k8CzkMpSQb8YYKzl3pPV73PPU6U+9rDEHSUts=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199018)(36756003)(31696002)(86362001)(38100700002)(7416002)(41300700001)(8936002)(2906002)(5660300002)(4744005)(4326008)(186003)(6512007)(26005)(53546011)(2616005)(316002)(54906003)(478600001)(6506007)(66476007)(66556008)(66946007)(6916009)(6486002)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTFRV2ZMQXJVOWtUZ0JhM1cvWXVmWmVrRXZjbTM2b0ZCU2hNVUxPZFYvOUJE?=
 =?utf-8?B?YytGYitBWFNGRGQrV3VUYW9NZnBLYll2QVc4VnlwRHNPaVYwNTFjL2FFT1Nz?=
 =?utf-8?B?Y3BncmI1R3hucnRYOHZIQUx0ZkdQM0hDK0k3c1ZwQ2lETGh4VjZ5WkpTd3Fj?=
 =?utf-8?B?eHpaVThJQjd2T2F6NzMyMnovTWNCd1NpaHZ6YVZ3NGZoWEVBdTBpR3NFTUZZ?=
 =?utf-8?B?VlpybURNS000Ym8vTURwOGh6M3Vqc1grS1VJUGVvcTBJMjJmM0poeTRPRkc5?=
 =?utf-8?B?M2d3NmJiR29rTjBkQkV2RERuOGRoWGhzU2M5YmJPU0s5YUtEendpekdZQjlz?=
 =?utf-8?B?eWR4M2xkRXpCd3EvT3NPaTVPTUw0dE9YdHY2dUl2bGpYWHJQdjB4WTZScHBr?=
 =?utf-8?B?MzUrM1VsQ25NSjNPNFFJbzEvTmVkUHJCdkxvWEJBOEw0cDliZmtWNXlENm5F?=
 =?utf-8?B?RnZXU0h0UFdxWmdLUlpwQ24xT0xha1dCaWluRktrcjNXbkNtTFdXeVdWQUVl?=
 =?utf-8?B?S2FoMWpKTHk4R3BpZXIwcDlsUGNPSFVwM05ySy9CaTgvbkNhejgrdGZPTjdX?=
 =?utf-8?B?am9sTGN3MW02azNBbUNJanlpaG5PNU9SUWV3eDl5emUxTUg5bkIxYVdITEQw?=
 =?utf-8?B?LzEzWlMxQU9Pc3laYk00bGMwZjBWczllNEdPcDNpdW41T0xua0ZwdXFSTlF3?=
 =?utf-8?B?QzZwVGYvRzFHV2VxRzVZUDBZQ1oycmNmcTZUcGNXTEtyNDdkUGQ3cERYdmYz?=
 =?utf-8?B?Q3BldElDSTMydGhsVjJhbnF0WGYwcXY3M01zYWFHSCtiMllWYzN3VTAycVVz?=
 =?utf-8?B?enh6Q3YzNSswTzVZQVhDcktTckRkcnJVb2J6YVpVZ2xGUEdiUHN5QWk5NDRR?=
 =?utf-8?B?YkpKTEZKWldCcDZvMHZSRXF2Vlg3OSs1UFhKbkE3K25BYnRPaUZBQlZiTmNI?=
 =?utf-8?B?cmw3MXFKTXdBZU9LWld1L2YwZTFack9rT1ZQWk96MUowcTVCd1R2UTRRYmlW?=
 =?utf-8?B?TGx1eVBNT0hSRCs4aGlLT2c0VHV3NUkyZzBpeDJSWTlSaGtFVmw5RWI5REVr?=
 =?utf-8?B?TUFXVVdNekRhSkdkVVBoS3BRTHo3K01IME0xYnJlTEJaUHdLWTNDV2VQcGsr?=
 =?utf-8?B?UVRGdTNhY0NlR29yalNzcFliUjZNT1lZVHJqUU1yWDJKVkVrRFVFM0YxdU5s?=
 =?utf-8?B?YjJrVSt1UXR2d1NJM0JCazR0M3hmK0s0Zlh6QkxkTDlqcGZmSFRWaHBpM2dY?=
 =?utf-8?B?Vm8zMEtlMXNkaURSZHJoVC96a29vbm9RRm9oUjFkWDlCKzF3azdNT0JqMG1F?=
 =?utf-8?B?YnlTL1I2eEFVVHRxQlIzS0VsekxGSGtxaFVIZUdlVVFQUi8zSC9EQ3FBZlUr?=
 =?utf-8?B?cTkrVUwrazIzM295eS8wcnJUTFFHQnlud1YxYzFJeWFOUk51NFRUdlBUSjhm?=
 =?utf-8?B?R0RYYllKV09ZOXhwYTJFYjNFbnN4YktENkZ4UUxXT01tbUp3eGFvYnBYWUNV?=
 =?utf-8?B?UUZvRUFmVExFTFVVM1RiZi9PNzhGVXZOS1ZHOGhmWTI4Q0lIdzFIOWtPWWNw?=
 =?utf-8?B?THRCRTdsRFlTWldrSXJhdUJsLy9OWTRVdXZDOE1UZENWR3RaV0s5Rmo2M0RR?=
 =?utf-8?B?K1pLZjk3UXBVMVBHVDdpTnVHOWxrbDE4KzFjaWgxaS9sdTJMRHdkWGt3bUtN?=
 =?utf-8?B?RFk4OTBaeVNob0ZUWUZML1pOa2dkOG1rNmk1WnBlQTFzSWZxeU5mbGIyNjZz?=
 =?utf-8?B?SGtDSlYvTWVVUGRRanErNWloRGlIYjZIMS9CNnZadjV3cExaZnpSb3BsUi9z?=
 =?utf-8?B?TkNBZ3EwekdWUEN6ZlNVRGNncmtTZWJHRTRNOXpUVTM2VWsreXhMNnZNaEd2?=
 =?utf-8?B?bExHSkpTT0h1d1VGVWRFTE85OFpWcDg1Y1ZlbTNpZkdyM1QrSTlFWENjc1dr?=
 =?utf-8?B?MkJTeWg2L3QrSkNpWHE2TXkzUGtRVFZ4Q2FtWDJlS25qQjRiWEdxdHNETytK?=
 =?utf-8?B?eUhpL0orUVVDN1ZJaGpKZlFjQUJ2R0FtOEt6M1FPdlBTMUxkbTR0UHlkUnZ0?=
 =?utf-8?B?U3BkN0RHT2ZCNFBHa0thdzdIL3BuZzJZOVR6YnRlZ2dUZnFSd2xpQmk0bmxW?=
 =?utf-8?Q?WIuJBEy2ItL4Sr4Y1GJ1KOyuz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60e7a67-c1dd-4366-7026-08db25397e7d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 09:41:47.0133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBZDAYatB4mZq2bf5zL/BnUJx9mu2pKpenb8izYRGExIL6fujQVE7QxvoKeJthO29YQVOI5HY1nsp45fhsybNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7063

On 15.03.2023 10:05, Luca Fancellu wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -94,6 +94,9 @@ struct xen_sysctl_tbuf_op {
>  /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
>  #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
>  
> +#define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
> +#define XEN_SYSCTL_PHYSCAP_ARM_SVE_SHFT  (0)

The second of these can be inferred from the first, so I'd like to ask
that redundant definitions be omitted from the public headers. For the
code using the constant we specifically have MASK_INSR().

Just like there already are x86-specific sections in this file, I think
the remaining single #define also wants enclosing in "#ifdef __aarch64__"
here.

Jan

