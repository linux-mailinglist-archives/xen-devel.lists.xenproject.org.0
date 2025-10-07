Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C0BC071F
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 09:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138520.1474225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61hh-0004mz-6d; Tue, 07 Oct 2025 07:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138520.1474225; Tue, 07 Oct 2025 07:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61hh-0004jk-2j; Tue, 07 Oct 2025 07:01:45 +0000
Received: by outflank-mailman (input) for mailman id 1138520;
 Tue, 07 Oct 2025 07:01:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v61hf-0003wm-VS
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 07:01:43 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aa6c4cd-a34b-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 09:01:43 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS0PR03MB8224.namprd03.prod.outlook.com (2603:10b6:8:28c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 07:01:40 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 07:01:40 +0000
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
X-Inumbo-ID: 7aa6c4cd-a34b-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMhfGwN/7RUKsBIVSCmhNS+BKAgpff9cIWiGlSV8aNLsfVRJMnJsnsimFFqjjG4cRmNLfBdB/PqBVEITJXo0rfiTOAif5C8TP8MdJ8MSDyu+W5Dlc2eQ+lyjR3H0JgEVmHD6dUfZl35ytL50uHwgYZRSILbG9iFo5ZLE9ckh64d/lvYORiN8NZ6/MrnFGAo67X5nS3a5oNOg2eJCX6zj5S3lHBRsR3mv9nOFvfuYlHw0efhJBcVC2LOp7tPF3X0/I5duUP6vccnsCtb3UEGsZGIHIFpWwzx2xd6SuddT7ESQ7JuQ3eEEUDsKbNLdGvOsyrzJaDgs4osqp4hpxFbzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQqnAeZ7dYF5Jd6lum83qWIWjAO069J3ZPgresUmxAI=;
 b=y9zOmr46bfXuE9gZlqgDxW6RvC5MnVnSdlYjH2jmCEhYbSh5YJN4iPl8ZgbrUwmiAxUSTkWPPxQ/6zgJ88cITb81SaOjmelETsEul9c/NN97IkFrCTVxZbMqDsY8LLn0Eank/y5KSSSXqZVLwC2S+IaBl7W/XfziPty36hJFxX7lz1P+b1al0rziET/y37Hobx91ZJMUPRkavtVu6MHBsn0G9qeKdOrcpNequ7J6YBdOEjDQ44kWFVuzOxClaT34uheXAzCyBtVgUE/fDvK94cVHHZigkZBbp3SD+gw7IiTpouin8fk7IQ79hCsQ0zwXL3UIm9BmsjtQfNUQpklq0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQqnAeZ7dYF5Jd6lum83qWIWjAO069J3ZPgresUmxAI=;
 b=B8H7BRXFdO11XHKdqNMK8nfRw65YdgO1kTuZ/X/4g2qo6xkN+1AeqI+dXw/JQgE+LCc+WjPk6QILjbj5JJra6mvFwEyu6D5t0ciTYbR034ofnRp9HCfK2ixerdp+T9NP9Iu66eR9LcmGqA4MYllPR9lW3u58AjTzmm3crQiBE9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.21 v2 3/3] cirrus-ci: bump FreeBSD version
Date: Tue,  7 Oct 2025 09:00:56 +0200
Message-ID: <20251007070056.83423-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007070056.83423-1-roger.pau@citrix.com>
References: <20251007070056.83423-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0424.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37d::24) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS0PR03MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: d4214920-dea5-41a1-cb21-08de056f5daa
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RU5FWDJmMVhUSUpVMmxYNTZ4NU9Cc0k0aVBLTWhGMkVRR2VHRU12UjljR25Q?=
 =?utf-8?B?cVo4bU9VZ2Y0NE1Gb0RHWFA1QXdQbFVMOEpvSythRlI5TmNkQnZOM0RjVzhE?=
 =?utf-8?B?YlBGQmdsSFVUcWVCRDBxdWVOZFg0Z29wcnZrVVVMQ1dOcnp4UlJPVnNPNnQv?=
 =?utf-8?B?M29TdG9KZnlCdkd0RWZLSG9hQUl1Ym0rSmIyc0M4cURYZkJiTXZVMURvYTN5?=
 =?utf-8?B?Zk8xc1o2K00vQ0JuUXlZWjkxQ3RYcytkZURFMWpVQ1JCemNJdUFFYzNURlJ4?=
 =?utf-8?B?U0VvNS9WZ0NEb2s3a25nTTQxZjYyU0FqQXFtdWVrZnVMRnpYNG5DYTR2a1VK?=
 =?utf-8?B?aWFCQ2gzc2ErQ2gvSnNqemRraWhCUG9aRjlTdDRTZmhZVXNlY3dPN0REU1lV?=
 =?utf-8?B?eTFrYmhpQzFwYURXSUU2dTc5QnFiZ2hTSXJ3MFhlbENrdzYxZ1ZkazJrcWJE?=
 =?utf-8?B?a3lneUxOWkMxdUNCM01vRHhoL3d2RUl0ZnRac2d1VlM2SWFUUG5xVlJ2b3Z0?=
 =?utf-8?B?bGxJeWdrSWU1VytEZ24xeGRZOEFjRVJSSkp6cDhBVUJNcW85a3V3d1dHaG9i?=
 =?utf-8?B?Z3RuN2FHSDlZWkVpTnNhSFRNMDgyd3NQRzA3U3RTVTBVY2orMnhFdENSTmhp?=
 =?utf-8?B?dGd3T1JBSE9wWDlpSHEyYnlRYW1jVUU0ODJ2VXBSTWxaVUovUU0xVi9LVnFE?=
 =?utf-8?B?Z2NTcjNHM2E1S3lRb1BJZTlxOUhCTDc3VlUrOGRoRFVQWG1aeWZBTVdXdDgx?=
 =?utf-8?B?QjdjZHdQRmRLNXlpemJwWFI1TU9BMXA1eUlzQ2ZNaVRBMU1YaCtyRTNPK3dS?=
 =?utf-8?B?TmVxNFczYWFyR1IzOVYvcVdLa1NYdWU1VTkyOWtUSEpEbmVqVVh0QlFSQ3Vn?=
 =?utf-8?B?dEZ6ODBEZTd4R09lYWRqV1JXRXM1STBSU0wvcXFRZHpFUW1LdHBwaHIvLzIx?=
 =?utf-8?B?Tldpa2R6WXNWK25yaXhPaGlxVjZXRHVUakR2bmNrL2dwWUZOU1NTSmlVVkpW?=
 =?utf-8?B?RGVTbmhiRk8rL01NOFZOcTJ1VWJ2U2xIblZJOU9ma0tMcTJxNExXVU5iWmNE?=
 =?utf-8?B?dXFZTlhCam1uVFVtU1E5emNDbithTytvc1FXQmxiVjhiRXFXUDMxNmw3RHU5?=
 =?utf-8?B?NG5VcHJQKzkvNTVYc2lDUVFNd0NOTzN6YlQrS0FDVWVKTW8relVpN29KTi8w?=
 =?utf-8?B?SGpTdzdzaGh6MzY1S1NmcSs1bU1CaUxRUy8vV1UwTmVrN05mNXUwQnBJVlRu?=
 =?utf-8?B?YnE2MHg2QzZqbUJiTmFJaXRFNCt4dERlWGxucWJ6M3YrVUJiQmp3YW9XWGw4?=
 =?utf-8?B?eUlZUVhGV1llMWNjU3dvWmFDVnFkYk5VQ0Q3a05wNnpwYUF3bmNvZml5eUtM?=
 =?utf-8?B?eitKOWpUS0JqSDc0RXFIQXRhMUUvclRLZDkyYm9QRUdHb01MVDlEQzhpUzZj?=
 =?utf-8?B?RDRhSUQ1Zk5JaVYwUGFuYjZHWFI0U3N2OHU4cWpGOFNOelRucXlnRWVydWxG?=
 =?utf-8?B?RXNneFpTdStCYVUyTjFrMVhQWmhsNnM4YVZEV28vOERpdmk1SW9LWWpTU0pn?=
 =?utf-8?B?UnpZM0RxN2hsbG5sNXJxcWcrN3lwZ1hPQTQwMk0zZWJ5ZnduelNVeGNScjVu?=
 =?utf-8?B?QzhXZW1RRE5MbnRuQWRTMFo5TjZ5VlhwK2xObmdFWmt3SU0wNDRUa2xrQzZL?=
 =?utf-8?B?TTFGRkFXb0JPbDNMQUpSa3U3SVRqcXcwMXQ0SkpKMEZRaVRyQlM5QzhTL2ZQ?=
 =?utf-8?B?eTBlN3lteGpJcUJaSUFaL3BRM1dwQmJSbjIzV05pTjNtYXdkdmpmakJWdjli?=
 =?utf-8?B?RCtMOVc3VVcxaURYQURsa0I3dXRrT3dPTUNid1kydERleTZJa01BTDJWaU9t?=
 =?utf-8?B?elRwYTc5QU5lZ05TU3FCK2FkSFpXZ2JXYytvZnNjT0FoQ2tCbjZyWU9CV1Bh?=
 =?utf-8?Q?lmW8XYIyoboHwbdOpZuZkbYzob+Wo+v8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm1vUXM3NDdhT3A4SVdoVlhtdjcrOGYrM2g3dzRUWEg4NEhwZU1mNVFYV2sw?=
 =?utf-8?B?K0Q3SEJUSEtPMkw5N1BOa1h4d1RLa1RQRTd0UlpIUUYvOCtKNG5tVWlrZis0?=
 =?utf-8?B?U1hOT1ROVlc1M2owVi9vQ1FFcVlOZ3d6Q0RQMzZzcHlnSkxpd21tNHJPUjlJ?=
 =?utf-8?B?R1R2N1VlUWhGUWFLYVloSnBjV3NxSTM3dUtyd0xuMlo2OWZWeDRJKzFlclBR?=
 =?utf-8?B?NzZkZ29rRHp4Nk1sNGdOTG0rSkg5RVVRaGQ1aW9hZmc4Q3BWR3k2dGJDTVZ2?=
 =?utf-8?B?aURqSnpHN05oNUllcGtMN1FRVitEdzUwa0NTOG5rbEhiMDNLSU5qZ3VzdUdE?=
 =?utf-8?B?a3lrM3RZNXZ1TWFieEEvZWdLQXhlUDhwczRyREJXc1FRYWdPTllLOXdRcFpX?=
 =?utf-8?B?T252WHpoRE9vc2YxNnVuVTR3VkxUeUxkWk1XVlZIaWhBOEpQckJYcWF3QWpV?=
 =?utf-8?B?SHR1WWoxUVZDaGFtUFBjdUUvVS9SMXJmbzBDSFlqZEM5bVZZTG9JSjBlcHc1?=
 =?utf-8?B?MVhrMS9ZSVdiKzBxeUJpcFRDK3g3KzZxMTUxakk5UEdFYk8vSWVxendDL1hH?=
 =?utf-8?B?cGp2MkllSGNOSnhoLyt1ekQwa2pvckdCOWRzd2hmZTlJRFFNL3FGT003eXJj?=
 =?utf-8?B?ejZQVE1iVHh1V2xrR1JTN2xud1BGYXJsR0hwdVhITDhBZlNmdFNsQi9NY0NM?=
 =?utf-8?B?TDRGZGg3eWtMU21HUnBsanlMQjhoSFVvQjA2NlU4em5JelgwVEdoMm9acnRx?=
 =?utf-8?B?c0V3Z2U2NW92aUI5d3VnVkU5aGUwR3JQVzA4aEkxb3dBTjdrdldWaG8vdk9L?=
 =?utf-8?B?Nzc3eXZoY20zcHRBQzVtQkgrdWIyTzlFK0hkZjdxMzFSVzZ1amJIVXNmM0U5?=
 =?utf-8?B?SDduNzQ1MnhCb1BTTFBDQnBUeVlYeTlhY2l5aDFXWjNXNjlwSEN2ZEFLOXI1?=
 =?utf-8?B?YVlEU2l0bklOdDhOb0ZqK1d2QXNlS291akdLSm1SdHBWSlg2R2lFcWZ0MDFs?=
 =?utf-8?B?SDBqcDZQS1BTZktNOWhwREszWk9WUE9XRTd2ZzZYU0wwRlZpOTBTSWhjYXZ4?=
 =?utf-8?B?V0VKejRWOUhDTVV1cjZrNlNFbzBHYUt1Y0ltMUpLVjZ5VFhYZUwzN0xrVmxU?=
 =?utf-8?B?WTZhY3d5OHgxekt5NEtGREtwYjltdkkvMnZUcGxkbFNma3VabVdTR0xHZ3hB?=
 =?utf-8?B?bXE0NXFqZEcrYmlvT3RpVVhDMHpGU2N3K3FpQlk2dk44UG1ZQmI5VkJ1cDEx?=
 =?utf-8?B?aHNqeFhJTEFxNGFHZXN2Zm5qbWRRSDE5eXhSa3hsb3BhYmpTUUFvMEMrYStG?=
 =?utf-8?B?N1VRQmpWMS9aSGtTRDduamg4cy9LdG1IalNsL3lIV2lpdHBRb3RmUUJiTTRt?=
 =?utf-8?B?c2lteWdYSE9DV0tlRVg0Vkl3b3lBOVY0MmFOejJvRDU1Nlp5NmxKY25HRWRh?=
 =?utf-8?B?MWpqTjgrTFNKUWNlTm1kZ0VCdTRDMnM5ajRrR0FZTyt0MlpJa0VwR1c1VVdX?=
 =?utf-8?B?MS96T2dLWUpzQ0d3UjF1dFJTQllMNHBZTlRHK3g1enFPU1JIUjhZZHpsampC?=
 =?utf-8?B?K3RMazFMTkNVaGZuYUVQNTVHTGlMM2lVSFJlRE1ldjFYaFhLUlBmS2h3YSt0?=
 =?utf-8?B?NXFMeHNxQnR2aitrejJGdG4zODhXY1R5OVg4OWFJbWl2aUQ4c0hGRlAvRUhS?=
 =?utf-8?B?bFhrKzVmRHgwNDV6a2NocExpSHlJdWdndXBxT2x1RC96RXJHN0hDTENxOXhM?=
 =?utf-8?B?UjA2QmlTRDNoSkVtQ254cjcxSDJNM1FabzVXMUtveFpuTjloS0tLa1M3TWk5?=
 =?utf-8?B?RkRaZ3k1dlVPVXg0U0NWQk5wcklrcEsybW1YVk4zZHpuMVltbjcxRDJKT3g2?=
 =?utf-8?B?RkJpV2ZkM055TndIbDNXd0ZMb3lDUGRMYncyZ2M0R2toeHVwWHh6dTVzakVJ?=
 =?utf-8?B?aFhORldJNG12STZKNzFIMjBzQzRmemZhczVwWHJXRHo5TFRCbGpabEdLeWFl?=
 =?utf-8?B?WWQ3aG9ZSnhaSE03UFBYTmpRem04bXB3MU5Cb2MvZ2lyUFB4TlUrSmNNRG1H?=
 =?utf-8?B?QzFQOVpKbnMvd0llMFNvTXNDZnJhYlZCNmU1M0RIUUdKV2dlRjJleHRhcExi?=
 =?utf-8?Q?BboqT7V/E4yPoFNVKOj+bX2d+?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4214920-dea5-41a1-cb21-08de056f5daa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 07:01:40.6738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cv5tDmGMY/aHHL46Uj6YMFfC6NUKs8XwiwOzCmP+OG3Q9+ERgk1uGgjCOJKMERyDaQdFAev0XpzznDKLmLXoCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8224

Update to latest 14.3.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 30108892b751..7df7ff552222 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -2,7 +2,7 @@
 freebsd_versions: &FREEBSD_VERSIONS
   env:
     FREEBSD_LEGACY:     freebsd-13-5
-    FREEBSD_PRODUCTION: freebsd-14-2
+    FREEBSD_PRODUCTION: freebsd-14-3
     FREEBSD_CURRENT:    freebsd-15-0-snap
 
 # Build jobs
-- 
2.51.0


