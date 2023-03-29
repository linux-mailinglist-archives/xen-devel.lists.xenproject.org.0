Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E246CDAA3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 15:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516273.800142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phVlC-0001Om-J7; Wed, 29 Mar 2023 13:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516273.800142; Wed, 29 Mar 2023 13:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phVlC-0001Mx-GK; Wed, 29 Mar 2023 13:22:42 +0000
Received: by outflank-mailman (input) for mailman id 516273;
 Wed, 29 Mar 2023 13:22:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phVlB-0001Mr-6q
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 13:22:41 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c709bc5b-ce34-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 15:22:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8952.eurprd04.prod.outlook.com (2603:10a6:10:2e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 13:22:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 13:22:36 +0000
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
X-Inumbo-ID: c709bc5b-ce34-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MafniogVHMpePVVmGqvDNP33JSi/q7bDlvQ/Q//dKKukHsLQBNQTmtRYB7q0c9vCUQdxvutc56v3U5P6/E0bYq1Hd+MhTLFSRtW93csO/NYyRTvnwNUCkl6CTn4JbQZiCgvy3g5jOP51BDLdrsQlETPsiY9VF3bYLGth1FczQN7MB61Q0ZnG37shF2GST7WTZZFj9GyXOu4S4gqeBTz+iJdpWgEMQaLlat+hqn0XDwSenLiUrzOtTQIGQAZcU67F7AIGJ+UDOi0dYV+tY4N/TRyyGZH1wYZ3IqWr46EMCRmsMbwFL7xH/N8vQQdtyPsuG9sjW/jYjZaw8GpfUnRwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FNYIWSXSyfAcJlYVXVlF6LufMrN+XtaTunTNge7Cic=;
 b=UwBAfoFVvDv1o5SfdyosWG8Kf9zxinckSdungK53mqt5rEKvBP4OhhTsjNGUjN3dHGpFRaiTwaEwYeuJGwLv2TzKwHgXY5jufDvqjm7bj7z5UuCHkYKKaIuzEZd+WnTVfrfyJHRtwY1q1t2mXD30fRfzEyr3cxLUr62ES1b3nHxx1V+M85z51Q4+D0Bd7ur5NS+6avx6au9UwhlrCIshIeT0ZWdgRM1zO1Ygf0w/Wt/dgGJ4XrMb/ca32kGzQjtSCb0ucohSKwsueHJFME2FPTGus/cdLT+qUJVPbaEUD2sJlOWajpARFJ98UDhWTIPiRyuVTynVygRik7kWgn855g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FNYIWSXSyfAcJlYVXVlF6LufMrN+XtaTunTNge7Cic=;
 b=Sgm+Kx4nm4ThWcIEBGmGXTDlptNpwTKyUMfx2D7CiG306H6WAQdgg6722Tptu5CrEjNy3qvStzXfoYuvAveqauSJy6g3PgBDpZN+OF2fP64e9udmOsJ09Ef57vZlw2dOQ9Sr5Ez8PwAHf/XQ3UAQQKFBvhwu8UAupfaxKrUFBuBpahNk1ACEiROnagO0XsqhcE5l3pBm0gpizkEB1AM9tCOl1CZCxA8CM8+POehX3BZEE2+fXqBGDLT75gCwk48MP7pB9vj+YLQ+G54iGt91n+q7OZL1Z58ymiKKI2bjNQUsLvLExOJMbXDI1IhRQ4WmlPWtkMf1F4R8hCeNQqGWPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77d0a652-89f1-af15-0a45-0bf28a826b15@suse.com>
Date: Wed, 29 Mar 2023 15:22:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] vpci/msix: restore PBA access length and alignment
 restrictions
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20230329101810.84726-1-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230329101810.84726-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d3b7ce-bda0-410d-053b-08db3058a985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YiOEPTws6LaKT1OQAA+Ik2wvj5eKy/VfmgiXw66WVXjcUykWmfEXxypc3aq5MAfjweodc3BgCNAozy+z3xnJPTa35/NjZqAFt8uBgCBgkoJo3Bdz1bbnYn6KW/1d5hw4MR1tK8gJXLFMUrEVcFgIckBVfssDmyUveUdsTVPLFFBDVZy/xg1speAmSK9u8TeKOwj2j4HxH888X3kYIi4r3y1CH1gK191vfz4L0X7/X9g+Qj3LW55qg8N1aiZIe2W9aBazbNpAvKbRc62ZQFjtywkCSVpgnSyHZqzWDBmg/u7wFr6amILz+UxnGOBhmBRiZzIbs2bpjFdkD/aQ61prjsgVZerN4KmsGqwP5QWI3WSqh1J0wvVRo65dcmLjV1USzJF+nesWsnL8qDrQjlKMrjOnoxAi7AdJnZmKPKk198XFYARsZoLsLjLNhLo1R/5zi+FVcaWt4Th5isNAhe2uxncXsIPVIqrpceWfgXcJA+NfvrMNBmgOvZXQ+p5LUfm128tSrqN05W0R9keGYKJS6wLp1g62wC2o6jqi/esVCeFaL0aZxMpAl6SfY0bBfhI3SjBiguAfEKIm6/q2G9N1yhSCJ61bRGAT36hL7wSaVRrF0l1idb7oF7gd5CYOw5AoPlx/qjhkOnZC3pgvh5+lKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199021)(6916009)(4326008)(66476007)(66946007)(8676002)(41300700001)(316002)(66556008)(186003)(26005)(53546011)(6506007)(6512007)(83380400001)(2616005)(478600001)(31686004)(6486002)(31696002)(86362001)(36756003)(2906002)(4744005)(8936002)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGtxaFdoSXdXVjNha3BqbUZ1QXZOL3hZLzV2WmZHVTRYSWdHc1VqamhGMGJG?=
 =?utf-8?B?ZS80TjBKc3V1ZHB6U2JCbjhLb2RnUmJib0hEakNxZjczMkRxanczclUwcW5h?=
 =?utf-8?B?eGRTYTJzdHBjd1djb1V0RDhVKzlTeGtlNUQ2allENmpBQXA0SW1MYVFqZzIr?=
 =?utf-8?B?bTZwTG0vY1B4ckxYeU4zMkIycUhaMkJCK21haFBiQWtKV3B5V012UFJRR2Q5?=
 =?utf-8?B?R1BFZnhDRFJISnpvYXpuaXJBeVVxTVJtaXB5WjNzeWx5WlBIZzAvY29PbXFl?=
 =?utf-8?B?TkNJYmxwMXN1dTRqb0FiWE05UlBkSmJlNm1UUlpZWUR5WGtURlhuSTJmVHZY?=
 =?utf-8?B?UkRpcVJ1eU11NTB4dHJTdFNDTTl3bk5ndkpBV28zNzFXL0lMaTNyQWp2N2d1?=
 =?utf-8?B?UTNLUDd4THVyOGdBRUxjVGJGNDJLQ3hFcG9IK1dPWnplRkUzdU9KUEd0Zkdm?=
 =?utf-8?B?SjNCTWo1dlpLYmVCSFBkWnUzUTVUV0QzWVh3OWdGZ2syMGQ3eHhvZE9qVCtH?=
 =?utf-8?B?L1NtelFGQVdsNHhxWkhreTdLYlQ4UHQyQi9xQ0dVM3NyaVppT1FFUFZSdzcv?=
 =?utf-8?B?SEpVTm80dEdtam13MFMyVFVydHpkN05JWGZMOFVRVjR6b0lEaTVWY0xPdDAw?=
 =?utf-8?B?MHZGWHdycUFCc1cvMkplVEd5cDVmSkQ2RFMwMmpXbnhRandkZGdRVGxxS0I5?=
 =?utf-8?B?dVdLZ041M3dXOXlSZVpPaGhObEs5dVE2WCswTWNWeHBOOVJEWGljQnBQclJ2?=
 =?utf-8?B?eXlJRnZQUC9rTnZLcUNyaXVLNnVMZnUzWk9tV0dXSUR3SEkrSkhoNFFxUHlt?=
 =?utf-8?B?eTIrbGxsUDdVVm1BUDd6TmtOYlNXaTBVRTUvVTJZcUw2VUp3RmJjMkphV3I2?=
 =?utf-8?B?KzF6cUsrbUlabFV4ZDVwRWJJZ0FMN3M3VEgwQUxFQ0d1UHVXcHdvaHhZZUg2?=
 =?utf-8?B?K1pxeTNsUndkREtKaUZ4VENBbzZrTnVVeW1QSlJqdU1iWUVPZE5reUxTeWgz?=
 =?utf-8?B?Y3JhZm45c3FyNnFNT1lkbGoxN0xKeTdzLy9UWDVKa2IzdDhodlJySHpmY0dk?=
 =?utf-8?B?c3BIWDQwcldidnNUVnp3R2Ywalo0eVNyYjh5aXJBSGZ5QTd6dUZYcWJOZUR0?=
 =?utf-8?B?WnhjUmZySk95R3hhREQxMk9BR1MweUxXZ3k1TitSVWMrakIzWFdoMlBzTDJs?=
 =?utf-8?B?WEJId09SRWh3OWJRUmRETWxjVlVhYmtYNFJ6bzJGVjZQNTZCUTI2VGphemIw?=
 =?utf-8?B?blBrWEpBTHExWEQ0UzQ5bklKcE9QUHU2M1hWa3pkaGdKUU1WS1Q4V1VoR25w?=
 =?utf-8?B?ekpBKzd2b0JYaWRKQ3FtbC9jYVU5WVZTakV0ZUROaWsxdVd4d2VDeWlQNEpx?=
 =?utf-8?B?L0N1S1IvaGMyREdiN1VoMDlLb3NwalZxWkJvWEVtQnErMGJuSy83cHd2UnBM?=
 =?utf-8?B?aGNRTlphM2lNUXMyS3BpMDl5QitOMmVRZDk3K0tKZktrcE5wNnRVYjl5ODNr?=
 =?utf-8?B?V2pYTERIOEJiUXF1NUhtaWNiUUdnM0JqSnErNDkya2dlMXBKMFYxVVF0SXl4?=
 =?utf-8?B?UUF4dTE1eUJvTStWdHFlSDFNWEpMSWIrUmcvaTNDd2hIZ0ZraVk5RUVMeUUv?=
 =?utf-8?B?eGk3L2hKOTNld3dEd2VZTVdCNmZWWFVseEZkMmxxY2VxenlnUG5xbXhUaXZt?=
 =?utf-8?B?Q3B3b0tzaEdyVmRaaVpMdi9kWlMvNmdvSVFDZHBwQ2k1TkNyNFMxUmZjMWhj?=
 =?utf-8?B?dnBZWHArTzgwNkVZc0dsTU53UDdqUC96OGdtNFJxcDR5MTR0Z0JVZVdpcHRF?=
 =?utf-8?B?SlE0azMvR0tZTXZLNk9tdlFUTWJYTnFOdTJ1K0xXcEtZU3FyM3ErdTFZdlFW?=
 =?utf-8?B?NnR4bXVnczQ5QnRpSVUvRXBmaTVxOGtkMTBVbVgvd3JIOFUzQ3dOYzFTdzdq?=
 =?utf-8?B?ZUJNMmhhLzNHdm5VbWVQTmw0RThJbVNscmxkUEpoeXlJVkRTOVBvYmMyeVdN?=
 =?utf-8?B?elQvMjd2SjdQeTRVN2czbHBMdHQzN3ZSQjZHbzZmU29OYnRPcWcyMVJLM1BV?=
 =?utf-8?B?WDhqTnFScENiVnZ3Mkd0RnFBMHJlbURHU2poZTRRQm0wdjBpYVNkdUlGODVv?=
 =?utf-8?Q?P6U3I92QgZmsqTMxWqZ5HPjDg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d3b7ce-bda0-410d-053b-08db3058a985
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 13:22:36.4588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ht1apU/EMNEWODIH+29JsABAiF6TrFKAjpjgIa+W8m8pubKkRm57JiPu8vTy/5kiQGLtu9YxFSyaAi/haSlrXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8952

On 29.03.2023 12:18, Roger Pau Monne wrote:
> @@ -419,9 +424,8 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
>       * assumed to be equal or bigger (8 bytes) than the length of any access
>       * handled here.
>       */
> -    if ( (VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) ||
> -          VMSIX_ADDR_IN_RANGE(addr + len - 1, vpci, VPCI_MSIX_PBA)) &&
> -         !is_hardware_domain(d) )
> +    if ( VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) &&
> +         (!access_allowed(msix->pdev, addr, len) || !is_hardware_domain(d)) )
>          /* Ignore writes to PBA for DomUs, it's undefined behavior. */
>          return X86EMUL_OKAY;

While preparing the backport, where I'm folding this into the earlier
patch, I've noticed that this change has now left the comment stale
(the problematic part if just out of context). Not sure though whether
that's worth yet another fixup patch.

Jan

