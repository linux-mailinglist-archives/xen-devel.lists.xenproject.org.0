Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E2BF1203
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 14:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146275.1478716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAotE-00012q-6k; Mon, 20 Oct 2025 12:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146275.1478716; Mon, 20 Oct 2025 12:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAotE-00010t-41; Mon, 20 Oct 2025 12:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1146275;
 Mon, 20 Oct 2025 12:21:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vAotC-00010n-5G
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 12:21:26 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 480f2340-adaf-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 14:21:20 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SA6PR03MB7688.namprd03.prod.outlook.com (2603:10b6:806:440::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 12:21:16 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 12:21:16 +0000
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
X-Inumbo-ID: 480f2340-adaf-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xoz8ZYlsPE9MHCrFKzHGagRH6WRYIIOm9GtMNoFHauMHj5IfwX01GV0O46P4bZo1dv3duZvbyH1SDzyhvvV87ciAXHwQnVcPHKd1nkozNmZ1wTnWHAaIHXaUCu01HC0xT9/pCCih1bKvEzfY/fIpkslyIAsnylaC6IszZ7UmvfYrMtGRnQKDlO2Gm4qUjPSr96CzHjo/tqTDBabBLUbGtv/axg6tw7o1P+XLZrkJ5eiFq2OK6oGhVMhZUO5b5N9Yegn16W8wvekM4FlWFEowlm6XQ85+HrJVXOQXQTPRf2a/YT87c5zRH0pGzJQGuyhfNOP+rwrmhXD/oLi5KHwILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8lGfR1TvN2D25hNGTy1nzdUjimJEtQYwoLxwiFrF3Y=;
 b=QBTQUPk9vdLEuvK2N/pCzIYuujRqIW7XkOhZBOHVTKXgT70fiGpJVAMyU/y0g+21nsF8u4hVOZfkYwqEhv/1ijkZAy7csTxd0NSazmeMo0/lMgaVx+O8H9bvfHiiT0Ybx5+CrGJjfqIVilfCJXPUg1pzRrIFiPrVRi1rbp0ZcC/sLyOtceYCcM/if2dvlXMvwGXR/K2YBLAs0ziA2/ShAc5WT3Rh22PL1NL6F4UCB/g+0Xlq7REW9z5AB/M5ehxOJoD9sHVanob84yFy7riuSNDXkNNP1xU+v7oCs7bRSXcCybpO4Di36ftHxOW+2LBtCGQrJIONDim4ROe6/a0X4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8lGfR1TvN2D25hNGTy1nzdUjimJEtQYwoLxwiFrF3Y=;
 b=aJRqeUQgrA/T7UMn8BFa4PpaStMhx4KNfhJt0vC0xnPxneVCmLwL5dQuF0bMn80sGLAnG/61rtzlU8lPY/6aeWs/wXgOZ4UonW3oEsIRI/64dEe54RhtAZ3YNt0Oo/xQim++x72yXKB0KeT/Er8UO6z3H0yeRMfnlFgOx0YLgBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH for-4.21] tools/xl: fix for dead code in list_domains_details()
Date: Mon, 20 Oct 2025 13:19:59 +0100
Message-ID: <20251020121959.54337-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0003.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::20) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SA6PR03MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: 455f8e07-a4c8-4a50-1b7f-08de0fd32a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnVvOUZ2eFhlckdYUVBjbERhQmRxaUd0Znk4WGxYdzljME1YRmI5Z1VnMXhH?=
 =?utf-8?B?WFlMRk1EbzZQRmxPUHJjbnlmLzFTQyt5Ryttb3YvZE16cGJYSVladWgyd3Yz?=
 =?utf-8?B?T1ZvTnlDOXB0TVdqUE5kaWV6N2Q3YUdHTzBGdEtQdUY0ZmpDS3RENjdGWWlw?=
 =?utf-8?B?RzNwQVlMRHZmNThOUXBwUkdSOTFBdFJ4Q20wbzhkazV6S2g0SWZSV1R1bHJ4?=
 =?utf-8?B?am5Na0h2WmRwTFJhRWxrYU5ELzVJWWd5UUUvYlBSZXpBTFFxZXQvQXNTN2hI?=
 =?utf-8?B?M2h6bm5QWXlRK1RkcU93cmVpckJPWmhxMFRmYmVNT0Y2dmNGMWM3WFRlQURK?=
 =?utf-8?B?RVhsNUlJazJPMnQwdkdkQWFydnMvU0lSbXpIandZM3RTSDRpZW9SVVVGbStP?=
 =?utf-8?B?am9BaVFIWDBqWTJiWUpKek1ONURlL0FxR2ZrRWMxMmYwTTk3MFROTy9BTzBj?=
 =?utf-8?B?dXZtR2gyOWJpQS96SDhLck53QS94MzJrWDN3bmp3NWQ1Z3BQMnpiZjlOM2hD?=
 =?utf-8?B?RkJRNSt1MkJHV1lpRWg0MmwrdnNsVERVS2g2cG9ZZjlWK2tNcHZ2eDRyUWt6?=
 =?utf-8?B?dTExdXpjZ0RhTTlzN1JIOXJna3VQVUxrWkpsaVRUSXh2RDdRWWMySitWNVdI?=
 =?utf-8?B?VW9rSlRraDQxeFo4cGd4c3UwMTRrcTZ4NlZLa0JpSlQ2NEZoSVlMYjVLdmpk?=
 =?utf-8?B?MloyZ0lab2lmTnpSbVU5ZnFkZEdvTFRMcXVuOHJKeGt2bEhJU2tseis3a3V6?=
 =?utf-8?B?RUJSaC92UGVWZjNTL3pLWDhoanZPTHZFVGdjUmJFMFppY2V3ZlRVRTR3L2Ix?=
 =?utf-8?B?MFVFQmR5Y0s5MENwaXlXaEM5UjQ3RWZPejlOWXVmQXVJck95R1BkZGd0ckNM?=
 =?utf-8?B?MXAyaEczZ2NqSFhmTnlqSTRBeFlEdnFUdytUbHM4RGUwb3RUV0lNUzQ0UDRq?=
 =?utf-8?B?NzdwdnJ1Wi9oeFZSU3ZzVklRQVlkeGIxeTJ6c2lFUFMweVhsQTZObHdqK0VZ?=
 =?utf-8?B?dHNQN1Z3bDNwSGxGdEY2bzJ2UDFmY2dTYjdDZG1JUWh3a0JVS1pLUk4yenor?=
 =?utf-8?B?NWc5WUU1WHY3Um9mdGprS0pRVkU3YW5JWk9HTDZMUkZtUzJlbzdIeDlFNXJS?=
 =?utf-8?B?d0Ivd0MvWUVRb014OHN1ai9Pd0FBeWN5bWFiUnZ1TzJac2lreTBJYTNWbW9Z?=
 =?utf-8?B?bk4ySnNYa0ZrQkt2bFJreGV0TENuZUlUZGkzZ1Z4MlUwSTQwelRlSEttVkIx?=
 =?utf-8?B?UmFTMDNZMmw1clhkWlJoaGszd0VxTnpOcVRveTdGVTgyNk1oNDZZVlJWTndr?=
 =?utf-8?B?K2FCNlFqb0xOYm9ZNExOdjBrMkRxTkFtOGR0WGEvZWx0Q3RLeHZlZlZXUmV3?=
 =?utf-8?B?a0V3eXh6NkJFckVSV2N2V3hBVjF0SWZKRWlrNkt0L0NaM3NyV1hORENHMERR?=
 =?utf-8?B?eGNXLzJ6L3VsdFNlekhOcVQxOXZNQ1R1TFljaG9ibkp5cEVRVFo3aFV1V255?=
 =?utf-8?B?USsvYlg1ciswOGd2WnRxb1RWWHFFbzh6V0tJTExSK3ZleXJrblRhblgxSFhV?=
 =?utf-8?B?eks1WU5ONndrNkpHSXMzbWR3Z1RveFZRS3F6MEIyMWZhWmFXSnpFMTBROVNu?=
 =?utf-8?B?dk1Ba2pJOFFlV3Bqd3FpcjJyZUF4R00wNjVoSjBub004NitDVmVHOU95MlYx?=
 =?utf-8?B?dkl1NFNQKzZTd0o2VlRUdTIrL1ZabEdWbDhEalBzYnFwVlBCeXhaOWY1YW1F?=
 =?utf-8?B?ZnUxaC9hK3p5RDJlZ1JWS0VZcTVGS3NRT0V1MWVreTdlNGpwWlVrTGlvT3Yz?=
 =?utf-8?B?cGxSeE5NS3o3aEMxVmJEWkN1c3dXaDl1QTJaZ2RnaFJ4N3ZUYVRmNU8rVU9h?=
 =?utf-8?B?cDc4a2h2NEFzQXIrajczazNPRkhZVkN4bWxjaXJPVzZ0aU5SWldoYzNhTVhL?=
 =?utf-8?Q?TkPO8JOQd1njNJ1Q46C+shlOPDF8+oPk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXlqUWRmWjNjdU9SaW8xV3BqRDgwelhwNEZjSkREWHl1OEt2OGREVlFVMDdv?=
 =?utf-8?B?MTF0RFg2Q2hCS3FFSUpndXBuaTJlQ2xwdEw0THhzblBjbS9yVjBkLzVHQ0xr?=
 =?utf-8?B?S2swTE5NUjBwK3FCQ2ZGck4wZWthMitLNXpCTWMrV1Z0VnlOK0tUOXh4bjd1?=
 =?utf-8?B?ajRzQXZtRlczZFV3REprRkpSRmg4bVVpa21BdFBxQmdabGl1UkVQYlhZM0g0?=
 =?utf-8?B?cVdIY1MxZGkvSGtkUXFvQXZjSnUrTFhFdG52aUxLWkVPblFRbVZWQStYNUZY?=
 =?utf-8?B?NzBwYzB5a282Y2F0ZUFQb1hsbDc5K2Vpd2NDbzRLQXZzUmhtTlQyN2NzZ0Ur?=
 =?utf-8?B?eE9oT01IT0xVZWdzYTZ6WUNUOWUzZjdHKzFHWW9CYmg3WjFuaGNBSy8wclFO?=
 =?utf-8?B?WlRNNzIxS2JOM3BjalJGVkNYUDd1VGY0SkJiSTVWY2FjWFd2SEZmdU1zdERO?=
 =?utf-8?B?aFptcG5qZHd5R2JCREhETDdzTUpqNDZBMk1nVzdjNDk5cDREUzdZZS9aaHNy?=
 =?utf-8?B?eE5vSjVlNm95MU1JVVZTZ2dWQXdyZ0FYblh6U2hCNlQ3TUxSUjlTdTliY2gr?=
 =?utf-8?B?Ly9GWml4ZzZFRzFHV3ErYzRicFN4c0tvN2ZsOTJmeGlvTTdtSFc4ZzF1MXgz?=
 =?utf-8?B?cFJZWDFCaEZ6NGFySGlSZ2FhcG51aFJwdUZwSWdlaE9oRWVjYzVJdFdUdytO?=
 =?utf-8?B?WGhaOHFCeUpMQ2dxQlNIU0owTUVXTHc4dUlyaGpRVHVLalIvakcwcHpISnc4?=
 =?utf-8?B?YmFyaGFWZjlVUkVLRHNlOGhWZnN5UFVPQXExMXpSRjAvWGdlZWk3V2lMYXkx?=
 =?utf-8?B?am4wNmVMaTQ0RkM2SURWSjl5R0RuZXhmVmZCTDlUaG1IR09lZHVBaDhTZTRm?=
 =?utf-8?B?MTl3VVlEY0UwYTdiamJ6cTRFTlgxV2FWcDNFaUpDZENEK1h6bjVOZCtxazlu?=
 =?utf-8?B?K1VNdEMxRThBUTdVMUEwMkFhalowcTNPUnNHT1ZRRmFXMVltWDFuY3NMcnJj?=
 =?utf-8?B?OHhGOE9ibFNqdzZGT3NpVUs1V1JnOTdGb3JXMTdZV1ZIQlRaUW9vVjVjZ29y?=
 =?utf-8?B?ejF0MU85Y1VlZHVMZUJ5U25lUFlyeVUraGV1c1loTHJOZHN2RkF2SzVVQitx?=
 =?utf-8?B?eVlWNEdYdHE3Z2x3N0Y0NWtXZnJqeXdFRHdxRWY5QnJHYkVxRGZscFNGdDRq?=
 =?utf-8?B?dXU5YlkzczBnVXZlQ3Z1VmpGbGRON1ByWnR2d1Y5SUJQeVI5RCs1UHRETVZo?=
 =?utf-8?B?SFVjWk5Md0o1TWVmVFQvWlo5YUtRUnhWdnZ1OVVmb2xUVzNEQTMwRnhoZnNH?=
 =?utf-8?B?VUdRS1p6cllRQnJ3Sk5iUXlDQnB6Q0xGRWhWbTRJdkJjSDFPcXAxai9sMHBu?=
 =?utf-8?B?eVNUQjZ1UVRDa3VrUHRLQzVYS29iMDBRZ1dTRi9yckl6ekxnS2pOVnRrZEVN?=
 =?utf-8?B?SVVML3dDdVVEdGgxendkb2ZURDR2OVlrbDRhdFFBVEdEVXBTRGNXaWRrTm9z?=
 =?utf-8?B?NG1abXNudDlnVWJzU0gxb1FDWmFvWnNRaCtKUHFrc2F5UHYwQlRVRk0zVTJi?=
 =?utf-8?B?MXpRbjBFUzZHWjRjd0RDWUMwSEk1ME5sNWg1MmhPaXVkeDZjT3VXWTdpc29z?=
 =?utf-8?B?THRMQjJuZkZBZXYrUjZZNFdkcksvcWl1SS8veUlyWS9jZjVOb2gyR01FYktq?=
 =?utf-8?B?dno0RHBuVlpZa3JodmpUbXlNMjNUYmxCTTk3Y3pSa0pPVjdTZ0JPdUFwYjd4?=
 =?utf-8?B?aDNjQWtCZWpodFQyS253aEd4UG5CR2VvN0IzQWxITU9TZUdDbHhWb045TVZl?=
 =?utf-8?B?ZWpPaEpsaktEdXl6dWkrOFJ5TEFEakd0ZTVNVnB6NVNjYU5jYzVmR0plNFdB?=
 =?utf-8?B?N1dWWi95ajBEaE9yZ2tQc1NqSXdCL3hzeTh4MktZeW9USzdYWGE4Zi8xRE1I?=
 =?utf-8?B?QTZNNVRxUWVPZ3U0Zjd3WFFINFJyaW5ZZVpQV1NzMDF2UU0zZi92ZEhZNmFk?=
 =?utf-8?B?UXcrSVgzaE82U0dscHowQmdTTEw4emMrL1JOUXJ0SWNjUXpKajFKRUYyS3pu?=
 =?utf-8?B?anhnQmtXSTBzZUxtcFd2ZzdON3djLzFFdFQ4c0hPaVNJcGlsTUdSVkVwMCt5?=
 =?utf-8?Q?I0079NPbtO+hpL9/pfCdW5FBT?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 455f8e07-a4c8-4a50-1b7f-08de0fd32a8c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 12:21:16.1626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AdceMrukc1RADLJ4JqrwbeYB439nAUC742p2UKPSn3gl3ZQYeQW7EEb62jGcD9NvIW6sWOlAZw1jtOgg6gJFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7688

Commit d0193c6d6716 introduced checking for the return value of
printf_info_one_json(), but failed to remove a further check down, which
now Coverity complains is dead code.

The correct fix is to make the call to json_object_array_add() conditional
on printf_info_one_json() having been successful, so that the further call
to libxl_domain_config_dispose() is not avoided.

CID: 1667251
Fixes: d0193c6d6716 ("tools/xl: check return value of printf_info_one_json() in list_domains_details()")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
As with previous fixes, needs to be considered for 4.21.
---
 tools/xl/xl_info.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index dbb682cc52a6..98fc879e636c 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -584,9 +584,8 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
 #ifdef HAVE_LIBJSONC
             json_object *jso_value;
             rc = printf_info_one_json(&jso_value, info[i].domid, &d_config);
-            if (rc)
-                goto out;
-            json_object_array_add(jso, jso_value);
+            if (!rc)
+                json_object_array_add(jso, jso_value);
 #elif defined(HAVE_LIBYAJL)
             s = printf_info_one_json(hand, info[i].domid, &d_config);
 #endif
-- 
2.51.0


