Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D24E228F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 09:53:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292814.497258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDmT-0008TA-Jz; Mon, 21 Mar 2022 08:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292814.497258; Mon, 21 Mar 2022 08:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDmT-0008QO-GK; Mon, 21 Mar 2022 08:52:49 +0000
Received: by outflank-mailman (input) for mailman id 292814;
 Mon, 21 Mar 2022 08:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWDmS-0008QI-1c
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 08:52:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47a5a925-a8f4-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 09:52:47 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-FqEajKA_OwaGmpaDG1iVnA-1; Mon, 21 Mar 2022 09:52:45 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM7PR04MB7045.eurprd04.prod.outlook.com (2603:10a6:20b:11e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 08:52:44 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:52:44 +0000
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
X-Inumbo-ID: 47a5a925-a8f4-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647852766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a6PS7wTlj5dGdjfnn7tkCu/Kzv4CSM0U2LzCGBehyNc=;
	b=GoChmxPaj30fD/84gekshLOnf/BYIsKYA5cdMvbYORQUfipYeMVV5UefUgo6ImcdBxKiPs
	T6zPmt/J3/b836pVt7i3n1GCBzbXcyp9GDr2vmgRF+x5SaUn0s5CHZmvoTLWGVwXR4ksfs
	6BIGq9LNrCKhwiOwvmfJmhcsAT357Us=
X-MC-Unique: FqEajKA_OwaGmpaDG1iVnA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfzXsgDfP152f1576zv8GOwEQtIBJSSPgIpkCmTVY3vxuMl1dE+MtEo35aZJkULB4YdgQLdDRqOgO+zeYZ954gRGtU7zjxqQ1iPXHa/Ufm1MrBsAerdk/CZ1n+noS19FT0wLSUVLmzY4qFQkKrctyvyVvsox8V6HwX4711RkATr6ic4a07MBPP2Qwxz7ZndO8yregfkZbxKKJBudaKe2KxMpRyvNptNyXViQ5ktOiJSHrP4swj00fIKX6TEbXIVkvWqTVoKgBMPv55yu+feE49/F6yxRNbjBv4giEfvvGjXLvsyP/qaS2fjtgnGF/kfabmSHvTrjW9euf9g4dF/t9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6PS7wTlj5dGdjfnn7tkCu/Kzv4CSM0U2LzCGBehyNc=;
 b=DjrgbMp9qQIeSv3TpDQOXDe95/wGkP255w20D/13kslvRPzfvxZOPpKJyz+nptZNIuLPLFrmaRr7VlzL44CM+28Vnm6Ul3acvXgp+Rc59e9QHKplytX1XkrQ8toq2kWk/1/HlBqgb7nF+WwoE7SV9nI+mmzfSAEaNRN6DLXaawE0OSw4rcrYB894fsEkMImPtzUTCxGp7CUayVj/DEYY1VAZ5gkSZW8MwyNUczzzOmJThmLlgEKn6hTdvFtvsYpDBsbaZoD7rX5WSx+abS5T6WzOREDYj7auQMIvaWz8ulbe98ojyoYDgc7M8fAUVHHoNLi68sRRuv99KCYXFK7icw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b25ba642-8708-22fb-751a-d07d9938ddaf@suse.com>
Date: Mon, 21 Mar 2022 09:52:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] xen/x86/hvm: add missing cf_check for hvm_physdev_op()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220321075329.3302-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220321075329.3302-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0071.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::48) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac853d6b-b6cf-416a-f661-08da0b182a32
X-MS-TrafficTypeDiagnostic: AM7PR04MB7045:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB704500001BC0D32CB235FD73B3169@AM7PR04MB7045.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DjM62joJGXnno59GxkwQnQgfpchXwzfMC4qtrdnqzCtNovZWchtvm+vmyHQCSVDcp3csM/lWb1lw7vGFFZT6o4KsdkAM8jDZyss1NcyCKTUdoyEk0h66jIz/9+OgXVILSjGrSdT5JWXWPZLmW4yMrZF0tHuhDWoDuFSe9ILHqtVL8dpRJbY/ndTgTntB8gH5cjWH2U7UX4ZDy5ow8ND0qDAz9ku4Hsft6V22XNIpXz/lThHG2mgzNS7TcWYGypfobCpYylr5dWsRs7/V+ce7n7cAg6N3gyaW0fucF7uQ569pPQrnl73w8LRzhJC4iE/73LfOnNgBmk8DEXCZ0TsXYEVchn4BG+VvB9madwET/iTohOHLTGDJxO2TzssSzERIGS1d1N7LlsmHruJYhb0zFi0n+hiO4HwgpaRHWSAqS3fGp7eeR1l7fLUnIr0UzQwKBoFuXvR4c7yV1ndpk/68GRgdfhz9NpjxLn3KTf7zkSdQKrNmqzFm4AYLams49w0ao+gDiO/zs73xE7I4NMiOTunz9QKxAqySGqfgaYKcT1H+ipFKsB7gBnCqAR9g1ltQwE+nTHPGDUWQXBcnYZII/V4VCHdM3x3JTW93IO4jM354gZQEJ3/3GUUGKjaMwbvxOW47bRUfkL1bnIymdN5jvfrynAn1R/IuOkJPJ2S9K8BSzxnwEV1qvI2Tdi+qI9Lx9m2xQlWC49lcAvECdndaVnCOdnfjvr/BJjl23zambby1MYTr21BRspmuzYQIcwQ9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(5660300002)(508600001)(86362001)(8936002)(6636002)(316002)(37006003)(54906003)(6486002)(66476007)(6862004)(4326008)(558084003)(8676002)(66556008)(66946007)(6506007)(38100700002)(2616005)(2906002)(6512007)(26005)(186003)(31686004)(31696002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFU2aWtvVlBJQXlRUWRycjdJSVdGdDNWNVN1R3BDZmZObWRVTjI0bHJFcmp4?=
 =?utf-8?B?QjB5NTIwZTU3elVJWU5YS3l1alhKVHVLbHI4SFBIZnZ0TFBibVg3QzBpKzJs?=
 =?utf-8?B?NVRycWFIaFJEcGVjd1gzaXFvOFB1Qlk1WDZJT0V5bUZRZlQ3WUR5U1N6Z0Jp?=
 =?utf-8?B?dlZ1SGZLVzRDZGVhanpXT0VnNG8wb2ZpYnJRY2xweVFDQ0IzcU15V3Y5eHNv?=
 =?utf-8?B?UEZ2N0xMVWZ1SzNIbTZjdFlWSjdRRzhnV1pReHFvdlp4K08wYlJhMHppaGJo?=
 =?utf-8?B?L2E5Nk9VMm5HNnpwWUdONDcwc3RmNkswVWFST25EaEI1aytRZjUyd2lvbkRm?=
 =?utf-8?B?YUYyRlN1ZTFjNXVqZkZ2UE1IUmZJWDBNVkhndEMwNkxOeDFjYXc0b1JrZzRI?=
 =?utf-8?B?SzhhUTRRQm1UazRkenBLc01JVHY0UStQUmJUSW1QOG90ODRQcjBWNEtVTTV1?=
 =?utf-8?B?c2VUVTdISmRncWVEVTd1cUticU1qYWRLOGFYYlBWekVmRzZCbGZQRmtiUGVm?=
 =?utf-8?B?dzg4WUFHWkxGVGdPYi93RlVhbS92S0RWT3lhYTdTcjVneFJ5ajJrdDlVbWZv?=
 =?utf-8?B?dVd6TVR6eWVONHJ4NmE2c29kTE41Y0g5blNkeE9PUGRxeU5qNzNOcUk4VTFM?=
 =?utf-8?B?NjlZM2lHekV3bFJKMVVqNlhBRzF2TVdWdlpvVU8rdExTTXduTDYzcVVHaDBq?=
 =?utf-8?B?Qzcwc1lFM0J0Mk55c1EvbWozRUZRYUY0TXVXU3VBY3FramV5TVJFZnE1ci9Z?=
 =?utf-8?B?VEFKSXNuWDhoM2xPdlJEU25OWlcwd0hIb2tmdExyQm1HOFZNeTQxdXA0S09C?=
 =?utf-8?B?OERvdXVRTkdvODFlVCtXbWF6VTZQZ2puVWljaVRYZk1WNDhXZ0RZWFd1R2lO?=
 =?utf-8?B?N1FDbDNySUMyTUY0dEZRT0ZRMUx6VFJtTkhPcFpxSGZVMDZLL2RGVkkwdmVE?=
 =?utf-8?B?ZDV6UytCVzhPSzR0dXYzb1NIQ0FoODdrM2hEYU96UmVHMnZDb0hLSWh6OFV6?=
 =?utf-8?B?Sy9iZ0tqd3RTZnR2R0ZOLzk0U2VoQURFcnVrM25wYWtPRnhZVURIc0NMZkNT?=
 =?utf-8?B?eEMzQ0IrNEpMUkViVXVjYUVmU1lkU0hnVHhKNHVlVHBZOUxuNHd5Mk0wMFh3?=
 =?utf-8?B?amh2WFpuWU90YTZ4Z3FwYmd3bittSlUrQjFseThwUjFZeU1PUzFZVTN3dHJH?=
 =?utf-8?B?YUlyUms0bnByY0ZNU01CRnB6dUR1NmhMRzFDYmJyV3dZUE0zc3pRZWZlMFZy?=
 =?utf-8?B?ZVM2R2Zmb2RiK3BWSmdKNnIyOFovRXFCS3JNeFFUR0FhYlZiR0ZwSW9ydFBt?=
 =?utf-8?B?QjV4blZTY0JrY3RxY0lPclR2TDhUL3ZWN1hCcTFpY2hUK0ZURXZ2UWdHZHox?=
 =?utf-8?B?aTFtcHc5YUhlSHVLc1ROcEZSRVFOVGJzQ3h3bU5ZS29FRTA0TDA5d3VoTjZo?=
 =?utf-8?B?MEVqYVZYS0VxTXlNUktKajYydW1WREsyRFYxM3dUVWZSc2tiQkFMUjhJVGVt?=
 =?utf-8?B?TkFuWURpL0prUWpXczd0S0w1ekNJcmREWnhEblVLNFhDOTExSDFRSjJVVVdu?=
 =?utf-8?B?eTBlYVR6MThGY1dYTWl5ODNSaW1ocVA2dFVtOUdGczA0RDNKTDV1ZHNjQWZE?=
 =?utf-8?B?UWI1d0M3NE51VXpaQUdPeVh4UUk5L1VRNFZlS0ZvSzZUNjFWL0p2RGRnN2Rn?=
 =?utf-8?B?Uk9pcUlHVHpaL0JaVVBha3VQZ2h4RjBuQUJCUFkyTm1yYnFYbk01M0pDMHRU?=
 =?utf-8?B?czBEb3Q0M2hIamMwZmtyQ1NtQW9FMVJMUmhLMlZidzBvaWdrb0EyQTFUZGtW?=
 =?utf-8?B?Yk41Smc0OHlaVE1VM1FReHB2L0M3cU5YckdsQXVqejdMYmo0ZGtGVi9VRC9G?=
 =?utf-8?B?cTZSeVdrT1dvNTJKbmp0RWhQOEZaTUVkUEpGZDdPMUhGU1h1VUFnUE1UZ1p2?=
 =?utf-8?Q?C8WogvsWreEI2hmdC32X1yNVfbxQVPAj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac853d6b-b6cf-416a-f661-08da0b182a32
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 08:52:44.3012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loehBoPbl0krlxzMEAWi6TLWu9/PpaA2HQ9m6YTj9LKu58vfXv3zWiaH9I5ek6YDVCypd9R4RjDv+zNto1FqkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7045

On 21.03.2022 08:53, Juergen Gross wrote:
> The hypercall handler hvm_physdev_op() is missing a cf_check attribute.
> 
> Fixes: cdbe2b0a1aec ("x86: Enable CET Indirect Branch Tracking")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


