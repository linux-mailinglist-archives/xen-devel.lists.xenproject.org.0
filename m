Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBCB82B6DA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 22:51:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666538.1037236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO2xb-0003WB-Km; Thu, 11 Jan 2024 21:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666538.1037236; Thu, 11 Jan 2024 21:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO2xb-0003Tz-Hv; Thu, 11 Jan 2024 21:51:35 +0000
Received: by outflank-mailman (input) for mailman id 666538;
 Thu, 11 Jan 2024 21:51:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pEk/=IV=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1rO2xZ-0003Tt-MM
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 21:51:33 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93bff5b5-b0cb-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 22:51:31 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by MN2PR12MB4271.namprd12.prod.outlook.com (2603:10b6:208:1d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 11 Jan
 2024 21:51:27 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::5aa3:9748:d8d0:87e1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::5aa3:9748:d8d0:87e1%5]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 21:51:27 +0000
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
X-Inumbo-ID: 93bff5b5-b0cb-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAEA+R5O+vVy+VgCqo1J/+DAvUPFdTOrzFyK7DQq1dz+vHeA16tVipZpzvAiLZtPLXal/3pWuzgUHpndHwRP1aEfSdASyDPOndTRzsTR3lcCSUgwbeQetgwg+4Eab4BcfMX5j7xVRld0IYUOlF4lh92vBq6TjSpfnTYlC8WhrNC/1X51Y9mEZvWWaMkPNIIVSlD01+OfiIa2zh+wt5/1EY2Raonh3kOtZVJlG+pspWrLnnPT/U1c5JXMVojUg4BdHf3k4/rFMBVlaPYMGUHtKlfVY8AX+E/nWR4N+gfCns7gfAN5ZMDUI5KBv3RZfgYQ6K51a6Uz2ygTstro+KLTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGzNPc17IxEP2foiiC+1vsTEc4f/VnctGZ0BqNv2/CI=;
 b=jeR99gJmLZAiVySa3wbVUQqPCoS4Q8JisOvO2c+JQsi03DBh6D+dgZezDsODLldkZMJ+VXo4JrddqiZlR1z0VfdKRTSc47b10gMsQE0/s5JKRlOv0s5QvjzxUeGsmdXwaSnsGwlUu5V6YtRFnn4S4wk3Vb3ridw/hE97jT+HSx6BgizNzdO8rY0NLQNX7hH53D+bRmTBf45EYT07MUCfsjGZCU8dza7gsKA9o+jggYQi7OG5hBpjbxCHDatMUumPd9jHWpuo9cfyNq3OjplEoto/xzWkQVvO/bow7+OD/nwlkay7k8nB+IG8K1K1Y1F48ykmEAFZoj8xJ7YVVU3NWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGzNPc17IxEP2foiiC+1vsTEc4f/VnctGZ0BqNv2/CI=;
 b=KfUmLhR3+S26i4J4tzbawJ8LQzzxNpeAlF7WxNBvkFVh18gcJgxjwWOWP+/Hj+8GOLyWptHkYhgtfsyZ8Hia2ZcgObt+5h9z9wp/R+7+Mc864Tz+giQQ74jkcAi6oHa9M8AzKN83rd5DkRqXDYtqG54lvrglcar0JRpxTZUX4cU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 11 Jan 2024 13:51:24 -0800
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen/common: Don't dereference overlay_node after
 checking that it is NULL
Message-ID: <ZaBi3J0aZn3NJUBQ@amd.com>
References: <18b7b16d0cce886728410784a7b6063116be7e2d.1704970589.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18b7b16d0cce886728410784a7b6063116be7e2d.1704970589.git.javi.merino@cloud.com>
X-ClientProxiedBy: BYAPR11CA0058.namprd11.prod.outlook.com
 (2603:10b6:a03:80::35) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|MN2PR12MB4271:EE_
X-MS-Office365-Filtering-Correlation-Id: d3af173e-2231-4a3e-abb9-08dc12ef761f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dRt6mTBVnoxR0UNmLkqhyr/cQCPNE6cy1iXgRinxG0EJQUcXqEeODUaf0QjdOhOnklS0OzYk/vBaFE0o5gMudziX9wNHZMLLuk+JPlyHNbdKA8QN2VBTW75aI0lih0gD5UYvu4FCDr2I0A5ejvCdBuSd6vREay5veeAHVFdQ7V/p5ELVM2/x8DToyA049Zz8EcF4yOxfKnnI3CiDcGIdIMX4lDjViqr+n6Hdo/11iW9ls6iuQvnlAW+YclGESLX1MAYX2dQC0+f39O+gTFM33GcdYkoS4H/U749EENyYGZqMvdJwPLMp0rrtt6T9IJ+T127TKfIftibnFaC+X8tJL6eOGiH9lFZ+RCykys4TwdkOV7bVpMtktjQfhX1tp26zBa/6HiDgv45lgMi/vZ9QL/FN4pjIMyVl+anQwOHrLBv1YSHJuMGdIvDWECmdRi9h/MtzwhCq+74BhImPeZBk47QqUwYaVnDfDVr6c8G7wUU5nfKvY0CcVdTkbJfsWAD2nHf3M/scKxK3Mqy7Q0gsEqKJbXZOiUVvYMk602NMATo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(83380400001)(36756003)(41300700001)(86362001)(38100700002)(6506007)(6512007)(6666004)(5660300002)(6486002)(966005)(478600001)(4326008)(8676002)(8936002)(44832011)(2616005)(26005)(316002)(2906002)(54906003)(66476007)(66556008)(66946007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUI4UEFxR0VVWGdNVmJPOCt1bC9GOVEzSDdhOStIQnByK1dEd1NnOHh2ZWVP?=
 =?utf-8?B?TWg4WndMMWtlMTBvR2xNS3RzT2FCQy92bG5jc1pVbVFVbitJaXZqRkFOYTBZ?=
 =?utf-8?B?L2wxZ3hxZnJzai9SeXFuaXZQbUliTkFZNVF1aldMOW15L3I0VlBQc09mRkln?=
 =?utf-8?B?N1lqL2VSM016TENaUm1MRmZRekM5QzI2OXB0a2hLSkZRWWpUYnZFajdleDRt?=
 =?utf-8?B?Z1d2RU90Z05zNzc4Si9wcjNTaklzS3lWZ0lMRTVoamVMMXJjSHdxd2U3cWdW?=
 =?utf-8?B?MGdpc2NFTFRaSUxnMWxaZUpoMTFlTGk2R3hHakVLeE9oa1lRbDBLQWhlaVJC?=
 =?utf-8?B?Zy9jd0JsZ05jc3lJaXBOWi9pbkxZSk91dzkyM3duYk1pVld0K3BrUWt4K290?=
 =?utf-8?B?THppbXpFZzhNMmJvWkdCY0lJalc1NEVKYzNyZ1lmMUtzbEVYajBrRFp1YllU?=
 =?utf-8?B?bDJXSlkzeVdUTHE5R0J6dVNLdXFOSzRUV1p6bUNUdnVwampxRlZuY0tQNExn?=
 =?utf-8?B?Vmp2U2s0anpJc2ZkdUc1WlBWbjdKK3pvZlpZQ3I1R3lpNnphUmY2ZlVsSm9n?=
 =?utf-8?B?bjhWN1pzbll6c3BWNWU1WlNsc0g4amZmaFpQWUJPVmZkQzhGU21sV1dYWlBD?=
 =?utf-8?B?M1djckJZTmtsU3FPV3FzNlRZdVlWSVE5SWQ1NXAybU1tem9UMUtDMW1neVNQ?=
 =?utf-8?B?dDFxaTd5WHdYaFJKVUZUUEUrNkxkdnlLQUEwZXNRNjBXNGpTWnNyNWlBbm1F?=
 =?utf-8?B?a0t2Rm92RGhPRHNRYUdBc1c2SzNYT0pwYTgyWDM1OUpRMVBvekcyOXplYTlN?=
 =?utf-8?B?K2c2TXYwc2tsR2lkMndUbjlldm12QjRLNHFvRDVGRVhUYVhpZkpCNzRIQnRj?=
 =?utf-8?B?ZEdSQ2J1cTB1UlNYTWs5RTEyWUVJOE1oNEREV1V3RzhQK2ZPUnQrRE15Y3hU?=
 =?utf-8?B?T21sSkM1ejFBbFJYdTRhZHhNdERjYzY3bTU2WWlKVElUWDN6bHQ4Q3dXdGd3?=
 =?utf-8?B?QlRISzNNbHJlYmkvQVc2TGwzaHpGZFlWeXlBVGVmL3NZWWIya1NVRTcyb2pQ?=
 =?utf-8?B?ZTRSNkpoZHVWVTN4aG9RTHZYN0YwUTF3YnFqVlMyZDFidTNhcDd3MXptZDFs?=
 =?utf-8?B?MVRLUWhTWXBTZW00dEp3WGRZdWwrc2lDUWJua3BtTjJVRmZtUjVPKzljekJx?=
 =?utf-8?B?TU9Fa0xDMGtIVGJPU2RBR2RqNk1GdFZXUXF6MWcrZWx4RUxWT0drYjFXY2Jv?=
 =?utf-8?B?RC9TdFZsZU5uMmUrdHpEVXIrUHN0TWZ4Nkk4VjR5QlRnc0NvZkIyK1BqYXBR?=
 =?utf-8?B?ZXRGTnNWTTdndEJndE5nQnNleERydGJuU1pJcFhvaEJDWm9uZVhhZUs1YXpy?=
 =?utf-8?B?N0o4WTc5a1hwYXordzVzVnUveVlIOGZWRWZQQlc4WWp4RU1oQm1CZ1FwcTRj?=
 =?utf-8?B?MFF5dmxaK2M4ZzBrTXBqQTBZWnVzcWx2Mk1rcjVURFptKzFZM2lucitOZmJB?=
 =?utf-8?B?WjNNdVM4Ym1TODRlYndQUlV1bGxYM0FZaFl5VHJOVnhxMHMvOUUwTXF6b2tv?=
 =?utf-8?B?ZkpRQTF6dWtzS2ViVGxrUFVrSm11RENCR0ZsNThVZ3pPRlNtdjVnOGl5enNU?=
 =?utf-8?B?cTJsMTVVYlY3aEMzZkY0OVhrS3JFSi9xRkpHaG1aU2Y3ZTBDQlZUdTVrbTdq?=
 =?utf-8?B?azZja2JscExYcHVkcnhjUENGN2lRVkVnKzYxUlpUUm5KREkzakJvTDNNOXgw?=
 =?utf-8?B?U21zQklRUGtDN0VReTZVZ0IyWldKd1RlZzIxWnphdHB6aFU0cllQcnVVWWxq?=
 =?utf-8?B?VlIxaWFpUzZ0V1p3QWZMbFFVUlp4Vk8zWDU4bHg2UzR3V0NBSi81VzltQlNX?=
 =?utf-8?B?dlN3Um04Y0NPN1lOVDJEZjBRQWJlWVU3UmttT3UrVHNvbVEwdnI0dnV4Vkl6?=
 =?utf-8?B?SHZNcEhaN3dmZ0YvNERSakpJRWRpZ1N1cHJMMmRwYVpONmZUQVEzM3FOR2FP?=
 =?utf-8?B?cGxEYkRrd20xQkk3R0ZObWM5SzdDOWk5U2pMdm9nb0drZElmWVVUbHFneXdX?=
 =?utf-8?B?aGdtNG80MmtrMmNjUU5XYmNsbEtSc0tTRERzM1haRVlBd2V0bG5HVllIU0c2?=
 =?utf-8?Q?Jh+DBfQNhdE9EvN5+h7znxNtq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3af173e-2231-4a3e-abb9-08dc12ef761f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 21:51:27.1020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4adYPzSYWrry6IH21Si78U5jPhF4fV08WyzDQ5KB33R92Ioh7fJ08G5N2rIhiOcJXX90y4hoZ0ugGo173mAig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4271

On Thu, Jan 11, 2024 at 12:09:27PM +0000, Javi Merino wrote:
> In remove_nodes(), overlay_node is dereferenced when printing the
> error message even though it is known to be NULL.  Return without
> printing as an error message is already printed by the caller.
> 
> The semantic patch that spots this code is available in
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/null/deref_null.cocci?id=1f874787ed9a2d78ed59cb21d0d90ac0178eceb0
> 
> Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
Reviewed-by: Vikram Garhwal <vikram.garhwal@amd.com>

> ---
> CC: Vikram Garhwal <vikram.garhwal@amd.com>
> CC: Julien Grall <julien@xen.org>
> 
>  xen/common/dt-overlay.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index 5663a049e90a..1b197381f616 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -427,11 +427,7 @@ static int remove_nodes(const struct overlay_track *tracker)
>      {
>          overlay_node = (struct dt_device_node *)tracker->nodes_address[j];
>          if ( overlay_node == NULL )
> -        {
> -            printk(XENLOG_ERR "Device %s is not present in the tree. Removing nodes failed\n",
> -                   overlay_node->full_name);
>              return -EINVAL;
> -        }
>  
>          rc = remove_descendant_nodes_resources(overlay_node);
>          if ( rc )
> -- 
> 2.42.0
> 

