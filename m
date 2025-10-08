Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F31BC584B
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 17:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139905.1475118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6VlY-0004tS-RS; Wed, 08 Oct 2025 15:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139905.1475118; Wed, 08 Oct 2025 15:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6VlY-0004rk-OT; Wed, 08 Oct 2025 15:07:44 +0000
Received: by outflank-mailman (input) for mailman id 1139905;
 Wed, 08 Oct 2025 15:07:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tb2B=4R=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v6VlX-0004hW-JK
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 15:07:43 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88a34cad-a458-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 17:07:41 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH0PR03MB5815.namprd03.prod.outlook.com (2603:10b6:510:37::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 15:07:33 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 15:07:33 +0000
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
X-Inumbo-ID: 88a34cad-a458-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRe7zWSCEMwR0Off78Ih5pXEITYaWKYkhBOgmo03VQiVefzzIJxYHKyFmX1cYuuI99iVPqNQnzU3Fb3/ooTyoHWT6Ojvh2uASgJ8/5BQ8R74jbEfVcCS0Y67miZW1QB0tM9Vm7teohq+7bQdkYZMoeyViXw2b70uwWXivxE4fs3RKC3cn2Sgr9MwwKwOPCTDD1kaw2aBDtkNsxxjZK386Wisrf0OSMjyhWtGroKFT1YVYNtFJ7OuYZp43f1qHlXoIzQEREKAwwfVAFDUB3PlgXCOL83/jKxkK6QLqUVVadmRw7MAOySXZ5Du1nQ13tVZUx4Lej/6+Uv2D63xsuXVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtOeElyIR5YUcsuNXZICGlpmkQ6AjNzAVIH2oXN3xzo=;
 b=j8r8h0ryIwST5k3JFpBxFh10N0tQs/N0XynwU8W+m1jzgcCEXkt8ZsmaTsZC0KYxMjeZX9BBk4l+uVw5pzi/c83r9J+lWcNJ/BJl8/y/CNIc6nn+4GEiWuV3pVathaeq7CTY5LOfKG+ZECCyl4Vncu6Yy0WzYEH4Ap7u7MD0GwKIxw3JQje6kWcS/RZH5oJOKioX+zHr/gBhY+N7fxlGD4CedNJovrk/SxOT8pUzPIWtT8Gi+4Mbq4Sd0bpgrHvNi3gKZN605psy0alX1dYIq9WwRqVRZFdiMaZknwye/u/a2FH64K81/tzA+mopmPzaZ4FXHDbSV9UCEVAoswX86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtOeElyIR5YUcsuNXZICGlpmkQ6AjNzAVIH2oXN3xzo=;
 b=EIt8HaiTudA9Eq2Qsdo6Zus6LQC3aOmO6A60410kATFsHjdxMzxEYaK9VW4AdxTM/w0AmwBUxUUR8aVq/nm2WMfEoT1kA4CZx+Yx/roJxb40DwsnBSi+BA88WXJ4pbqXX5HSSBCSfsmjJtFlDse0YMAuEFbhA7HhgZOdG/EWQJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 8 Oct 2025 17:07:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21] tools/tests: don't pass -E to sed
Message-ID: <aOZ-MY8jP6R1I9Uf@Mac.lan>
References: <4d985a6f-59e2-45ea-bc3d-ecd2da032a17@suse.com>
 <aOZ1nneO_4-KvvVK@Mac.lan>
 <dd1f9a5f-fc45-4ffe-b541-6f250b74dfb6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd1f9a5f-fc45-4ffe-b541-6f250b74dfb6@suse.com>
X-ClientProxiedBy: MA2P292CA0018.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::8)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH0PR03MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: 416f85a1-3009-4e4c-1f20-08de067c6870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTBrN1A2NURIeFYyRFBlakNLaTlPcDF0cWpGTlZMZ2ZweDR5d010T1pVWDVT?=
 =?utf-8?B?KzhXeVdLcDlJWE9KRWxvcDAveCtXcXFtdzJXWnJHL0VoMHlzbzdFbURFZlVz?=
 =?utf-8?B?Wll6WW53NnY1bTNQQlpSa1dJSmhVZ1FkS254MkJzMHBRTlgrQVR2aTdVcGFN?=
 =?utf-8?B?SUFKY2U2aHVCZVMwVWZaTGpQSUFRQW9ocXVyZ1h2MXJqL3laQzZhV2Nxd0tm?=
 =?utf-8?B?ZUtPRzFQajVMNWRRMXF1UVdFT21HTlJwL2o2WXF6R3k3Ymx1UWlxTkdyc0Ra?=
 =?utf-8?B?aHBzVnVpUHpJR2svRStsWG92U2E3L0NZVGZGbzZvQ2dIZjFtbU50ZXJmOFNo?=
 =?utf-8?B?eWJwS01JZU9lUmpEYVBhVktEUnhjT05OWGtnU3crdy9nQk15YmVXNHRYK3Z2?=
 =?utf-8?B?d0dCQWRSd0RXTVJVZ0RkS2FaS3ZvY2k3b2tMN2U1WUNicmgvSFdkYWpkRldh?=
 =?utf-8?B?RkltWkpFSHNsTUpXSEZVV2FQVlBCUUhmODNPNk4wY1lSdFliMldEd0RNSG9j?=
 =?utf-8?B?YWxWa0RzMDNEV05HQm8wNWtiOTQ0a2F5MVlsUnNMUnE0dlVlRmQyZUxVUDBE?=
 =?utf-8?B?eS9JNGpXS3RSTW1NaFBjcHFodGlSZEdrTVg0VFk1NllwRExiYzk2d003ODhW?=
 =?utf-8?B?SFZaTkZyenBGN3JVbVV1R0JIZUxaN3JNWjI3aEVmRWVPMmVySHhadDJUTFdQ?=
 =?utf-8?B?T1lBNjNneUw3Y3NMMlBBMys4SFBIN3VxOWNOa0llUWJ1QklmN3JEMU8yTWdv?=
 =?utf-8?B?eDlOT01GV2toK3pHYkM1TVNncmVVN2dvenR3Q2JETlB1S1NuTm9nY2hCaktv?=
 =?utf-8?B?MWpVNDI4Y0QxMCthbHRUMlE5ZEZ0cXFmVnU2Q24vYVQ5TENrZ3NhUTl4YlFP?=
 =?utf-8?B?elAzaEZiMmZBRnR1SE9SSDBrcTJzTTJ3OUpnWkFxanFLS01QUWRYMWw0MUdL?=
 =?utf-8?B?aEtNOTRzK3IxcFlBYlVSOWNjWkgzU3BzaE8zRWFsa1RUR3ZtdlIrYTZLRVVZ?=
 =?utf-8?B?ZHpCamVPdTk5eXV2bDFESDQwZy8wTFhDOHZhbjlxRDhad2ZVYzE5alpIS1J5?=
 =?utf-8?B?OThCSjRhTE1FQzZ0K2VQc3hBL0hJTHRrdC9qZkdZbmZQdWl1SkYraEZLZnJM?=
 =?utf-8?B?V05lYXF3YXdFNUduMTIvRTROUUpRQm84MnVXeHVJQU1CTEsxTEVmUXF0MUJq?=
 =?utf-8?B?cnJWUW1tM3lTaHpBUHNwaTVkU0dWVktFaVhVQWNzUVU1UVMrYUZVQllKS2dn?=
 =?utf-8?B?R205T25TNGxDS2dGNEptUFE0S3N0R040MlRucFNkcEpXaVA3QUlmejNIa0Fl?=
 =?utf-8?B?V0VQTDAxeWJLYjlubTdZN09lUkd3L2o4REF0WnJwVXFqT29JM1lTN3hZVkla?=
 =?utf-8?B?d1VtR0plU1ppTExmWEplS0hnelFDc1E1MHg4ejRhT2ZSSDZ6ajR4RkNua0NL?=
 =?utf-8?B?N0Jmd2FTTTRadUdUKzIyODFVa0lESzRsYTA2MnF6bGsxNjQ1WjhlcXZNaTVN?=
 =?utf-8?B?dFZHQkRDS25wb2pUNWpTbHN0S3EwSXdycFFMR2RNY2czWmQ3YjR1MkcyT3p2?=
 =?utf-8?B?UHp2SUJYWFhuRTM3aVlXYVlRa1o5K1YxeXdsN2pJRHIzZnNJTjhXdCtWOWR5?=
 =?utf-8?B?TUN4dlIwdFdMU1NVcFlvaUlWd1FkMS9oaGh4VUV5b0xJdEpCYnA1UUorSWhP?=
 =?utf-8?B?dU5QOE00Y0hqZFNCRXRFMTNPV2k0cXJUbDUxaElmYXZLVTlZTEYrVVJuOVNp?=
 =?utf-8?B?WlNqODF3bEdxandVVUZ0UGZ0ZmZ5Z1J6YkFqd1htRnltY0dqNFkyZ2ViOUxX?=
 =?utf-8?B?YXJCL29CRUZGM1FYN0p1ME9KQktGVGg5SVRjYlo4YUNQWWJhdnZUNG9tQ0Nu?=
 =?utf-8?B?M3BFb3NWeDMxWndXZW9taEZibEZSL0tJc1g2SjBucHEvRWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmJwSVVON0FpYkVZS050MkllVjlaaUhDNmdTZDFZaHdBalRYTmtJa0x0YUJW?=
 =?utf-8?B?SmpPKzZvYkpQUCsvVGVweW5YZCtiNG94N3hZa21kaFloZGNmUlFJSm9TK0xi?=
 =?utf-8?B?ZlhGeXkwelJPZ3BtYXhJY2ZBMDU0YXVKTGJudVkxeTZUMGo3aXZVRXQreG1T?=
 =?utf-8?B?WE1rei9NOUVoSGRScWkvMUk0UHZrYTczcy83NWNTaWxuTUVWeFVRMmVUcFVP?=
 =?utf-8?B?dTZ0bzRIb0pXc2hjUXRJbDRzZlpteWNYbFZXTG9uZVVFV0VvcmdkMGxyRkJm?=
 =?utf-8?B?UkVNWlJLWXBaRmwrNE1VcGo3cjJ5SzlaZnJ5aXJQa2NQb3dFSVVBZlhNN2ZS?=
 =?utf-8?B?TkZaeGdTczZBeEd6dG41YWxDN0N4MWsra09sdU9aZXFSczRjZUpjaU9iQTBs?=
 =?utf-8?B?ZHkrbWNkY2tJcFFPc09XL3V2RGpXWk1ObDJnSUEvMGxtaVdtN3FPVG45UHQ0?=
 =?utf-8?B?bmZtOTUvNG5RZEdwWW5qZDMrMng3dkJSR3h2ZmhjODRVZ0MxWG5LMXBFb3BH?=
 =?utf-8?B?Y0orbW1KbHZDa2VpNzNmK2JRd0Z0M0d4aXNjNGxQM3VTR3kydVBWeXJnK3Ju?=
 =?utf-8?B?NU5yTU8vaEJQb0VCcG05VFZvVkc4dTZIcmJKVXlWMHE1TEd4cnFGbE9sMDZn?=
 =?utf-8?B?Tm9wcEwrUC9jTUZYTlhYeDhtVjhua1RHWTB2Qy9RYjBoUUtJTmhkQWJaMG51?=
 =?utf-8?B?MG1OdTBXZEtCQmtkU2RhakRCRWZsYVpQVHRqeFlBSTc3Ky9RWFp0TUN2NTV5?=
 =?utf-8?B?ZHpSQlV3SHJZNVVCTENQTWVXOXQ5SG9lMXd4Rm5WNVVIRWN5cmdpNzFSd1hI?=
 =?utf-8?B?Z0hmc013cnpLVHRaY2ZwNUFsYk1VVHRJL0c3VlJyQUlYeXJzWXl4eUw3L1RG?=
 =?utf-8?B?VHd3cDd0L2V1TlVCNzFDODg0b0pmbDVRL01PdUlydk16QS84aHJRWHVjUkF4?=
 =?utf-8?B?djBGOWtWb3dsVU1uM0FyejNnUG9GVlBwb245U0lHUjEza3RuaGxuYUpXZWJS?=
 =?utf-8?B?MWkzZnNqdW1HdldEay9sdVVKK1hrN0xEc0FHZlNnejlNUENvSU10WHd2RlNz?=
 =?utf-8?B?dlpCcEJENzBIdGlTeEN3YUgxT3pOSnNtNVk1c0RFZmtWRitCZEp0ekY1TFdO?=
 =?utf-8?B?TlI4UG14clRaVWxEQjhIRzExblk0RGgzYlhNeVUwdW9BNE9HSE1OdUNzOGZ2?=
 =?utf-8?B?MEtrcUpuc0kzbHpjbDJQTEZSYlBESEN2ajN3QStKSnFzb1MwWWdqbDZpR0gz?=
 =?utf-8?B?QXE0OS9tQnRlKzdMNVVlU2ZtZk1VL3V5NEhPZkhSaU5JQzZmYmJmaU0zeUZB?=
 =?utf-8?B?YS9wQ0JBQ0hIeWlRQWtkcW1DNmhBZFlJcGhNZlR2eXYwV1Ard0xUaGM5Qkk4?=
 =?utf-8?B?ay90Q1VrL0h5YlJ1QTR1cWFmUDMzVTh5ekxLTDdPTi83QWZ0QUd3Q1FtMnk1?=
 =?utf-8?B?QmlSVk15WmIrWWxVLysyUWYyZWkyak1RWlFWRk9jUk55RDY3U0RaOFl4cFp4?=
 =?utf-8?B?NmtYbCtQbDVRa3ZCYWFLNmRIY2k1UDBodE5CcnNjeFBLMnRudmFaRktWY3FV?=
 =?utf-8?B?YXA5OWtCMWlJdEZOOGFIaGdlLzJTQ2cvNkxXcERsSFRGMm03OCtSN29rTFE4?=
 =?utf-8?B?eGNTcE1JaDhGRWJ1TlBad1BWODM1YVVJR3k3ME1Xc3lzTHJjdy9ldEFiMy92?=
 =?utf-8?B?K2FpVm1aaXBZNE9CQm9ZRWNjUzIyWUlZT1l1WFRIczhJSS9tQzJyejJWWjRv?=
 =?utf-8?B?cGdKd1RuaWN0dEJRNmVZQzZkT1lMK2lEZjRTQnh2NldjOXR4QUdMaWd6MUFU?=
 =?utf-8?B?U1lmSU5iTFJYandTUHQyNHpWSjZXaVRHczRadkVELzNySGZWeHRmUHJRUTRG?=
 =?utf-8?B?K0MydzFYR0VxckVnOG1oS0RVclNtTmJRUXlFWWpYYzVBYkd1NUN1YndzeWo5?=
 =?utf-8?B?SXkzNVVCWlJCczJnUE9WNEVOWERlQ2xnTGNBVEpteTN5UnZrTk50Y1Q1c1Yx?=
 =?utf-8?B?WkgyTVJ3SllieHU3aEdaclZDMU9Sck9yUGhaMngyb2lacVFrR21vaERHS0hW?=
 =?utf-8?B?U1FoNCtOY1JQT2tOdWphTUw4c1g1UG5MQ0lIYzNWVWxLTmhMRzFkU25zbWNx?=
 =?utf-8?Q?9zTVzPBwPZNZCqem/FfyZCdKZ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416f85a1-3009-4e4c-1f20-08de067c6870
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 15:07:33.3185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+AF3VE6TQ2YMOk/UVRphgDiBvQXoMgil9KH5VGz0OcSsAw3+lyvUPb2PGIFuAAxXZEmgBYFS/w74EqGih3Pgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5815

On Wed, Oct 08, 2025 at 04:42:13PM +0200, Jan Beulich wrote:
> On 08.10.2025 16:30, Roger Pau Monné wrote:
> > On Wed, Oct 08, 2025 at 11:47:05AM +0200, Jan Beulich wrote:
> >> Even the 2018 edition of The Open Group Base Specifications Issue 7 [1]
> >> doesn't name -E as a standard option; only Issue 8 [2] does. As there's
> >> nothing "extended" about the expression used, simply drop the -E.
> >>
> >> [1] https://pubs.opengroup.org/onlinepubs/9699919799/
> >> [2] https://pubs.opengroup.org/onlinepubs/9799919799/
> >>
> >> Fixes: cb50e4033717 ("test/pdx: add PDX compression unit tests")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> ---
> >> In principle the -e could be dropped too, for being redundant.
> >>
> >> Hitting the problem with an older sed pointed out another problem here as
> >> well: The failed invocation left a 0-byte pdx.h, which upon re-invocation
> >> of make was (obviously) deemed up-to-date, thus causing the build to fail
> >> again (until the bad file was actually removed).
> > 
> > Hm, we could do something like:
> > 
> > sed -e '/^#[[:space:]]*include/d' <$< >$@ || $(RM) $@
> 
> As is that would hide failure of the sed invocation from make. I was first
> thinking to sed into a temporary file, to then rename that file. But this
> won't cover the more general case of the issue either.

Well, it would work if the sed into temporary file is a FORCE target,
and then the move to the final file is only done if there are
differences?

> Meanwhile I think
> that the Makefile itself should become a dependency of the of the target
> header. That way, if the sed expression changes, the file will be rebuilt.
> (Of course this still builds on an assumption, specifically that any
> failure here would be dealt with by an adjustment to the rule. So possibly
> we need a combination of both.)

It feels weird to me that a Makefile depends on itself, but yes, it
might solve the issue you pointed out in a simpler way.  Doesn't
makefile consider all make generated targets as obsolete if the
makefile itself changes?  The pdx.h generation is a clear example
here, but the same could apply to runes used to build object files?

Thanks, Roger.

