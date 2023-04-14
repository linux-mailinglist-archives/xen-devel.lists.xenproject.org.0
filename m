Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F3A6E29B9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 19:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521186.809574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnNd1-0000eb-A2; Fri, 14 Apr 2023 17:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521186.809574; Fri, 14 Apr 2023 17:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnNd1-0000bl-7H; Fri, 14 Apr 2023 17:54:31 +0000
Received: by outflank-mailman (input) for mailman id 521186;
 Fri, 14 Apr 2023 17:54:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YiN8=AF=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pnNd0-0000bd-8o
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 17:54:30 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65118504-daed-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 19:54:27 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by PH0PR12MB5434.namprd12.prod.outlook.com (2603:10b6:510:d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 17:54:23 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea%6]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 17:54:23 +0000
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
X-Inumbo-ID: 65118504-daed-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wd0p5OaEyMrCDZAHixCs9kT3OPLKs/tVMjP6BJ91nJLOLMRZMlGN2g4fhawEQiVQp9BR7C9YlJDOmmVkhUIlQVdHJa2cK7AdZzM0mKJl51S8sZsOh0MlL6h8w6d2CZ2iNM/sdLlVMHsdfQhsh688bjXr4kQP1KKDY4TmnlA7knjJmr+O+L51GjvZF5Fk6T8c+uEajW2LvbBlbd+KQa5/uUIC9bjwnnJXkE803ImMK6zs4jgG5yNWZX0VXO1geUOX+xV9fDJ4GfuN2O4xuI9Jyk+4eg9NnfOCac3ORcet0NEwSrvZ1SeJ7bQl7Jh7bodTYJqlDkvlJ2ubMehKPGodgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhD2gGUs0psgEuiecZN5i/3qHZ0Elom1MVvlI/TlWIU=;
 b=FiPJ+vhy4d3vAnJInwIkrNQsuD9fVDnkB9mhTmLpX1PM29nV6AqOEXVaRFQ+fpJ9otuYuyZ2EnMtVVubQuBIq4uwCJ6EbAWoyhu0mM6x6BWiz1OGG5IFijlRwxR3hupuwXgUHy9+Hb3w2bq4NBwsTS71rFcRZ7pu7iSlZbZ7VtLiQgkn2CEzWksYmfAEiiFkJRfkgJ2EmRW5w7hi7zjb9AHjzwQteRl0O9Z4yi6KZ6kK4TevL8oiTxZDpo67Mbwx5N+F/crY7BAfk9tNd1yA5jATPfEuc2BlB7jUMVuxk4oTO7ONWtZx0AC0kTpc3DvpV5h775E52iC78wpE/0LcUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhD2gGUs0psgEuiecZN5i/3qHZ0Elom1MVvlI/TlWIU=;
 b=eEybioKefLPy3NEzUxyHUANAsvSrQyT88Wo+TPAbFw+vvdaPyLCK+U2SmxjGNvDtRi9ZBpQiXI1/lBkJuG6VaM/JGilhDUaexluXFqu9sSEzEmRGQCtkuo7OfhhWlj5HRCQUQQhpUhpRkXTCLUKHc8kxeLZz5IH31NHm9B/OfIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7dcd0b9a-f986-e6b0-46c6-95936799f39d@amd.com>
Date: Fri, 14 Apr 2023 10:54:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN][PATCH v5 05/17] libfdt: overlay: change
 overlay_get_target()
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-6-vikram.garhwal@amd.com>
 <601858e2-79b5-35da-df00-2d9061d8ff22@amd.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <601858e2-79b5-35da-df00-2d9061d8ff22@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|PH0PR12MB5434:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a6070f-760b-45c7-0a82-08db3d1147e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jmidc8rV9PYJJJrya2oE90YRImQm76IABv0Ng23qgsvDrnblIeUoNkEF50q7zS7iWbESv9K3LL3kjvFZ15rtOeNNMNZxY6aBxN8bU77k22xPuy+M0ZycyN//ljHjEvOP7w/XEr0G2KqvazHQmue0LNLM4uYuLdGwgccC4S3xP7w/9PHQysHOOpzUd6IR7lNuVop8KlkiZgJa8sIqBIL4gWbRggxjeCbqLok7WcCrbGLrqhacIluPR1mrS2omjhLDXEAVq8kYBk9HSmAbxJthKUY6iRFM9Lll+3sdz9Stjf3Wd9vKQ6WBQj06zA4wGLRjM1Oq794PBBRA2tSWrjAK3a2hdnDJXGLszKmA+cKUvl0JIHKcaZKGludLb4mYoC3dEieKLe/c9aEcu+zk40hhZtWLuwgQY8G8lU/Mc3mBlF6oeKlnqGenVrXny3Vy0Jc0E4+l3dP20eqyJUmJAbocgmmZLCuTOB2uSy06y6NPvhzGURl4Q+rknA9MCTGmZ4BDM5fAfZzpuB3m2NJIlwTHlJsB6p+wZsX3Y6fXLxoCZEYz0YdeXYZEkucAw6guQ/DBQMXQA8NcwGCw9cXzKDLIsJdwEObBH3aOzRYZr7t66uSFfyiBQl/Z00XIvu4j3Po+/ILE4fMdclFl58m/6iwp6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199021)(44832011)(5660300002)(2616005)(8936002)(2906002)(83380400001)(31686004)(6506007)(6512007)(53546011)(26005)(38100700002)(36756003)(478600001)(6486002)(86362001)(966005)(54906003)(41300700001)(66946007)(66556008)(8676002)(66476007)(4326008)(186003)(31696002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QldWeklRQWVHWGNRcVJFaHI0QUZ0djYvamlyZXlCRy9JZktZYnVtWE9kSWFk?=
 =?utf-8?B?bHpYcWtkMkdJa0dnSW9Ra3E3VWpoMkJSVlRjMjlTVTdlUjd3OGVvMVVYR3Uw?=
 =?utf-8?B?T0UxMnI3enlBMkNiTW9sMWFFUU9SVGVNNFBPY2M1WFdHandsMXB1aXM2bGgy?=
 =?utf-8?B?YkQ3bHB0YjdGZ3FIV3IvODNFNVhwRHE2dVpMT3NtSUo3ekpHYnc3SWUrenVF?=
 =?utf-8?B?UXNnOTBOS3pDbmN4RnlveTlXdktyaXlNdWYwMHdwZ1dLK2cvTW1hUUxKTUR3?=
 =?utf-8?B?WlFndnJBY0h3eFlROCswTmZqZkRPQndlaWZqdE5peFFGODU5cmZqM3F0V1ly?=
 =?utf-8?B?cE5hamFpdUZ5eFJqbDRIWDRNaUtrbDV6TVN5SjNLNElyODJ0dmVyWFI3MW04?=
 =?utf-8?B?S3RiMXliVXlhRXNkdnk4VUl1RUR0TkNBYzJVVWJlazJEQzJXMDdsU0pqdFN2?=
 =?utf-8?B?K3A0QkxMUWVqbnNiVTZrOVlabE42UlVwOFdHdkFTemJNeDI1MWVJbWRSR0pz?=
 =?utf-8?B?Q2V4SWg2TXFuNmVudUNnZlZ5SVJYNHBCZkJRdDRzaCtlNkVCN2hkbGtRM0pk?=
 =?utf-8?B?a1p0eWRGS01GWGhRZFVnc2ttM0ptaGcrV0I3a2lVY3ppdjh4aExPaFJLbU5F?=
 =?utf-8?B?NGJSKzRiWlczblZDeU0xWXZzK0kxRzBDelc5bmhoM3gveHZIMmtBWHVDKzB0?=
 =?utf-8?B?TnhNT0FldFVIZHJrMWY4aVdoYy9mZytGMnI1RG5sMHRYdm42N01yaDYxVHNh?=
 =?utf-8?B?RWd5WnU2a1NBVldqby9abUhkbzVRMVViaU9CUC8vMzB2OWxxdVhlK0ZRdG1R?=
 =?utf-8?B?OStRZSs2dENvb1YxWVNwV0MyTUEzZTUzbUpTZUdSaUloVjIrUGxtaTcveHNS?=
 =?utf-8?B?eW5HV3NyUzhZSmY4YXhNTnJDZ3NwelgvbWswR3BjRkdtSlZJc0xlRDlteXNz?=
 =?utf-8?B?eGlKTzhjNHUxcjBQaHN5WVAzTi9qcUl2T29jbG9Wc1cwWWc4a2xueFMzemIw?=
 =?utf-8?B?a1V3Q0ZUTldTZE1jSnExeEhCWkNCdWIvaE5oTlJxaUxzbTlXcHNtS083T0c1?=
 =?utf-8?B?cERMZ2pUNnhXSVA3S3pQcVorZS9heUxueXBCcVZUbFIyYmFnUzdYWDJsYjd5?=
 =?utf-8?B?ZGc5bnh3dm5mSmJWcDlGeFdadmt4eUh1cGMzbU9VTktNTXlsOVplY3g2eW9j?=
 =?utf-8?B?aG5IbjhEb2JmL3Yrak5MY0pla0hhV0QyVnJLaGhTbm9tWG1iN0xWb2JUZEYr?=
 =?utf-8?B?V0xSRndUYS9HODF1MHU1Y09nSHk0QXRUcE8xNC9LSzlKQWtuSndMZG5jaVk1?=
 =?utf-8?B?WW1ReHVDeStJaGdIbzJBS0RkeWU0Z1UrVkZpb3NpcGJIdzhEQUR6SW1PTWEy?=
 =?utf-8?B?dlFKcS92Y0dDeTBLOTlDQWFwWEcwMHFhNUVGR2Vma0o3Y0lTTURjdmlwc1VF?=
 =?utf-8?B?cyt2UXJRZ2svTjducnNwY3dVVURhaXQ5TzlsRXd5Y3lOYnhwU09hRnN5eTgv?=
 =?utf-8?B?OTI0dE5LMUk3dElHVTlNbVVrbHNsU0NkSzkvWVVuSDIvbStkK0I5QTR4WERy?=
 =?utf-8?B?MWthZXVKWExHVnBkU1dsL2JVbTByZFdSamRDZWxMbk5UTVlhN29ubFNwZEpS?=
 =?utf-8?B?alNZVzBHR2xSa2RTbUdwWk5RK29KTTZZMXVVNVpzbWtGOVFnbVlNOXRYYVNs?=
 =?utf-8?B?NEQxSncyQkIxQXVwMFljV29qbzBxTG9OT2VVbE42UFJVZ3EwNkYxbXBsbm9n?=
 =?utf-8?B?M0dpR2dDY25KZFlsSW14dmFXZ0R1dlNhWThHdWwzbExDZVZUMm5ST1hTTkRs?=
 =?utf-8?B?cldFT0ZBSE1iK2RZT2dtRFA1cEdybXhGYXc3SEtrblZ6Mlh4R200YkZjVy9J?=
 =?utf-8?B?UU92SVBLWkdwZElia2JTZzczRXV0V21zMGt1MGdBVHZNTVpMQUp2WThsRk10?=
 =?utf-8?B?dVkzR3kxSkx2WE5hbTlOYlcrTitoK0ZZRXZwZWNDMWtHYmhjZTgyNTRPRVNi?=
 =?utf-8?B?TXBXQ2dPK0JhMHcyaXZvNnFBbi9IbE5KWjRlWG9XVkIxbzZIb1hYUDRJRWtQ?=
 =?utf-8?B?M053cVpRdWJXNUhneEwzWlF0ejBjTEEwL0oycE9ONzJWNTI3anFpT2MrRFF2?=
 =?utf-8?Q?l1XprhOvTtJjNkzelKMeOe+zC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a6070f-760b-45c7-0a82-08db3d1147e1
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 17:54:23.4425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWMVMakvUuGEK2CCSu0pQcNTbr7bUt4jwUsE800BK44orSxiEfoIObFeaDN+8+Bn3cJ/Ej9racejWYHNlF5d0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5434

Hi Michal,

On 4/13/23 6:11 AM, Michal Orzel wrote:
> Hi Vikram,
>
> On 11/04/2023 21:16, Vikram Garhwal wrote:
>>
>> Rename overlay_get_target() to fdt_overlay_target_offset() and remove static
>> function type.
>>
>> This is done to get the target path for the overlay nodes which is very useful
>> in many cases. For example, Xen hypervisor needs it when applying overlays
>> because Xen needs to do further processing of the overlay nodes, e.g. mapping of
>> resources(IRQs and IOMMUs) to other VMs, creation of SMMU pagetables, etc.
>>
>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>> Message-Id: <1637204036-382159-2-git-send-email-fnu.vikram@xilinx.com>
>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>> Origin: https://github.com/dgibson/dtc 45f3d1a095dd
> Wouldn't it be better to point to the main dtc repository under kernel.org rather than github?
> Origin: git://git.kernel.org/pub/scm/utils/dtc/dtc.git 45f3d1a095dd
Okay, i will change it in next version. Is there any guidelines/note for 
this preference? Will be helpful to me in future series.
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> In any case:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks you!
>
> ~Michal


