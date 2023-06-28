Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE081741269
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 15:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556476.869049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEVFu-0001kT-RJ; Wed, 28 Jun 2023 13:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556476.869049; Wed, 28 Jun 2023 13:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEVFu-0001ic-ON; Wed, 28 Jun 2023 13:30:46 +0000
Received: by outflank-mailman (input) for mailman id 556476;
 Wed, 28 Jun 2023 13:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gtaj=CQ=citrix.com=prvs=5364a0850=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qEVFt-0001iW-2n
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 13:30:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9cbe589-15b7-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 15:30:43 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2023 09:30:34 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5647.namprd03.prod.outlook.com (2603:10b6:a03:279::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Wed, 28 Jun
 2023 13:30:33 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 13:30:32 +0000
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
X-Inumbo-ID: f9cbe589-15b7-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687959042;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QmKpoXh0q9IyF+GtCNx+LTPuvVKISp9kjElp2H+OnvU=;
  b=iVNmzxs2cnplWbBljUFTxMIIGwSj4NEUjYRh9dNVYkvEnT1JgiqqbQID
   yHrr/mUZ4qTKXMRkbjkoKaoWNbgOBbFBqXtIyNWHnWTn65RXQjwD1ng64
   kIPXIpIEbSmTQFXPHz5VjyLyrhVOPpzjfAP1Q476F0BJ3pxXky45FbBNS
   c=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 114486605
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qhhduqp7jN7r2opYa4Rvozrgy8ZeBmIyZBIvgKrLsJaIsI4StFCzt
 garIBnXOf6IYzHxfI9+aI7j905SuZ+Ax9MyHgc/q3owQyMVopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weAzSlNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAk9Yw28o+7p+4O+RrFmmuEzMfjSZapK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKLEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtOSO3mqKY36LGV7kc3LBxRSnyRmv+4l0mjdosHE
 G4boxN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBq177qRsHa+NDYYKUcEYikLSxZD5MPsyLzflTrKR9dnVauq1Nv8HGiox
 yjQ9XBgwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBewKByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:KPuhw6Gn9kLW+gw4pLqE0ceALOsnbusQ8zAXPiFKOGVom6mj/f
 xG885rsCMc5AxhOk3I3OrwW5VoIkm8yXcW2/h0AV7KZmCP01dAbrsD0WKI+UyGJ8SRzJ866U
 6iScRD4R/LYGSSQfyU3OBwKbgd/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3AspHupGuLdhP+f59ek0pYe9bB6IscQnDA81PcfHS?=
 =?us-ascii?q?JDGoxQqGwWUKhwfpNxp8=3D?=
X-Talos-MUID: 9a23:dIDHvgnRBNw6X0iJxMAidnpJEONppLuJInsLkIgBpuTdbRdSNG6k2WE=
X-IronPort-AV: E=Sophos;i="6.01,165,1684814400"; 
   d="scan'208";a="114486605"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4g9c4YwQ0WtCrBhV1V5IziWZsGMOGHd+tqpcl0EA4Vmq+ajCTuSNbP9DAsRkBqvBBzJyBmw14ZRlF2H6sXz/JQvSdbHseKrCdCn4shrsJGBmX3XYAixnEhSJcm/V6f1PaI7af98dUbGDmk4E/RDxMLRNjZRrbBMplmVnt6EPBdRXojmXCMtQyfRt1A5xufANY/rJJA3HPse7DkpjmbfLjo9GOwbHOWshNRBXIpyakcrZklo4qAK2BqilvFTj8YQTyxTWbSpx5hEfO3mbGi+fU3VFBzU0+1obCuLlgbKXqlzovObAW9Kz7Fgj2g6armWH8yzgqPyQ95I1Ia+I2ok2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8QDkzeJKWMWSET+9ZsFxDedtBmOzxg9Hl8z+lRGViE=;
 b=OcP9b5Vjo3FF3EWQ25G9X7v3RvQZURiNVpm26u8TK4CGh0+Ld7y8WnMGvcfI+8eNFU5go9cumOldEx/yPQQ/yS12FNZbGfex9lm19j9GHucSk860Zztl90yYxN1MQKaPG7eYHm8N1ZFBovSpzqwXwdphUw0menGGztKP7V+uP0SDl98/rZ54llaoGnKvXNBjqmSEKmkyN1b+jqyuCtQ1c1k3zpPjCBjgKTnr9QSUiLgK+FwBhta/X4n4onyazzGFV2hbb1sOOAsEjCqn0eLQLaHyQK8W6MZhig5kYXroyIOkQvFMO4hRhN8Hkd+Sb4FfsVxDe1S1wcJOoyWlUJDjpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8QDkzeJKWMWSET+9ZsFxDedtBmOzxg9Hl8z+lRGViE=;
 b=CKWqlyOxVrDwYEIOEwaa6122x6p6LhEHbqmfSzHyYfitYRdnRelwbts3PT7kqMlcZY69uzS1PCbhLWr+Sy+mshviN0q5pQ19ahESJCVaYYRJ0QXKg8XkHSYocmWuWNMXxmiIBXhD6No2sPcPgNfb6OmHpG9RkoDPRumS7WiFNcY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jun 2023 15:30:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, qemu-devel@nongnu.org
Subject: Re: QEMU assert (was: [xen-unstable test] 181558: regressions - FAIL)
Message-ID: <ZJw18VbU1qe5kAig@MacBook-Air-de-Roger.local>
References: <osstest-181558-mainreport@xen.org>
 <ZJwoK50FcnTSfFZ8@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZJwoK50FcnTSfFZ8@MacBook-Air-de-Roger.local>
X-ClientProxiedBy: MR1P264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5647:EE_
X-MS-Office365-Filtering-Correlation-Id: e74ad293-1c9e-4ae6-af6e-08db77dbd8d4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S43GAhgjh5YM0a/KZl4CCxvLpFTtHdd2b/96oXS6fHC9xywu0jNKrQ42ubJAf4ihtXV9yC3w6qSZRfMAMiA80Wr6lxppu0r4U1fCFUZOqlANpgz0zp9JvWIh7+NfCARfNGvk1pQvbUx5CqtwKn+8VxJJjxjQQtmUFOLSou+CRlnZ9LVvC8iaQDgvV72HEnuwOSMctoNvWjxVR7wHpGnLg57fR4rqI66SHfzAT2gSMxciTNpHjBqA2iCNZrRxPukrALZ5ijmyMHJhHzOzIeUVUnISJlRrrjmQqCJrj7B7rfGJqY048qYgMssE2IKR5ik2gKgDlcSuyb/OLhddLIRew89C90L0MBT2Lr7xvZku42jQyb1IYri/kTcfYfSS1kzECp/DAZED1mnKIjl1MtR/TdQrijwZdLdUi4rOSU9DUgfDKfnRC5zZMWa5uvWG7paeaePMyClcj1nM2sJ9KjikL/KhW2RcGXQKio012dsN0c7nLWwHTJm87JMKJl5fpHbYGS/ZpYXdX1XapjNxhvitj1eZ9wiewlzcrX8Z8JrxLTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199021)(6666004)(54906003)(966005)(6486002)(478600001)(83380400001)(82960400001)(86362001)(66556008)(6512007)(2906002)(66476007)(186003)(26005)(9686003)(6506007)(85182001)(4326008)(316002)(66946007)(6916009)(5660300002)(38100700002)(41300700001)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEhkcmhHaStSL3c3ODFxNlVPc1JRbEJYSzFYUmJKdzd4emdEL1RvcUdoTms2?=
 =?utf-8?B?QnZTaUUvNmY2ajdCK280UXZ2Y3pycDh3T3BxRDFJbU9zL2x6Z29NUXloMVMz?=
 =?utf-8?B?TVQyQXJIYndpWWlEcytxak9Rd01hSThsVzlqVXVJc0g3VW5Yc1dzcXlWNmFp?=
 =?utf-8?B?Zkp2ZENIODVrTytteGFPRysxQVRzdXkvZVR3UkY2Z2VtWGFUSFJwb0lMMDU5?=
 =?utf-8?B?b3Njc0FET0hvRzJGSkl3NVVFbDlLR2lIejZkRlpkemNKN1l3bGVBS2kzNWxj?=
 =?utf-8?B?M2tyekE2VmNWRFRpdndIQm1IbnJBZEtsampKWUdYL2pmMWJpZG1zSFVpU3h5?=
 =?utf-8?B?OXBDeXl6VWN3Z1dwYXBJaFA5M3pydElZdWgrelIxZGRyWlpJdjc5ZE91ZzRo?=
 =?utf-8?B?YmZjdGhHNjRQYVBvK0lmbjRDTWF6MzBzWlQvOWs4QitoaHlsT25WeiszQXJH?=
 =?utf-8?B?MERtZUlESVBJNktrNi9iVUhNNFd6UE1Gd3hTOHRuaGpnWlZIajBwK1lDL1Ur?=
 =?utf-8?B?SDFNNUI2cnA3Z0dqVmJVR2lWZUpmTFp6NTR3RUVualZPNkFTaTV1cFdETFEv?=
 =?utf-8?B?amw2ZUdRS200YkgvUGh2T0syc0E0a0R0a2hyM1NkOVVBZ240UDJaREJ1RWhW?=
 =?utf-8?B?d2J2UmFPRUpRb1VpbmhVdTJLZ0loUmZQVVYvZGJVemwyTzloWEdxY1d6UkFF?=
 =?utf-8?B?c2FIM2NuVW5teWpSQUxPeHBUNDdSNTd5QXc4QW9VbWdiZ1E0SHoxM0dtRVVs?=
 =?utf-8?B?WHVjU3Rka2NOdm1HKzBMd0RKMVVUc3dyVktrcys0N0pxYlQvSWxjcEVNbG9L?=
 =?utf-8?B?NVJIM1JDcTJvaUw3MTBJTWFoZjF2dWlQckJZOGdDYmJTMm9SUEY2NWROdTFD?=
 =?utf-8?B?TDNGcDdOcCtHVEExTzg2WW9YR1FwdFRUU3o0eFJBN3ZURlNsNUtOMVBheUpl?=
 =?utf-8?B?QzJRWk1PeXVCa1k5MHJiRXJzdDJYS2xqcVB4VjNWVE1YQXZGM1hGOFdpMjdF?=
 =?utf-8?B?OWtSS0JzZTVCQ0ZwQ3QyMzBGWmJYZjNwUDZHZzR5bFpFamprN2ExbHIrTThR?=
 =?utf-8?B?OXQ4b21MRjJGL3dvSm9Eby85WGc5UlNRbGtubkpVNUNNUmJqTHorak1uZkVx?=
 =?utf-8?B?NnlGNnFWR2libmdOandBaWlpM3NZTnNhRy8xQjI5cHZJSnFGN0IrRHNUekFX?=
 =?utf-8?B?VmR4ZVpKbjNXTC92bWJha0ZkcDZ0VDhudjlPTUN3ejhlaE0xRmMwQW9lQzNK?=
 =?utf-8?B?a1RmdHlDZHE2UmJvS1JkK2NsSm9lYTF0Qld4eFJPanhCYklweDlzai9HQ28y?=
 =?utf-8?B?ZllqeXd5WENYdkdXRlNNWmpUUGkzODEzYUpFamJvYVFtQStNdDlocEp5NXp2?=
 =?utf-8?B?aTU5T3BRNTFUWmVGQncyazVTSGNRY2VYaStQQ0Z4aGdmWTBReFdTZ0pGVmNs?=
 =?utf-8?B?dGVGdEY5TDVodGJaM3JkRTVXZm8xZmR6dmk2YVV1em9jaWNEQzRmMTdCeWRx?=
 =?utf-8?B?MVJ5N0s4UnFubE1jK1BHSGFSdUJFK3lSUFRpMVRKNTBscWhUZDZtSldmQmg1?=
 =?utf-8?B?MklRaTBRVzE5anphRHR1bGp3NEhFNGgyLzU2ZGVEZUcvRW9hTTVoOVFFdmpR?=
 =?utf-8?B?L0xraWR3anJFblFWTU1xeW1UOTVSL1NjTUVzNUxnTkh0SU55USs5OGJadFUr?=
 =?utf-8?B?RCs5by9IZ21OaVlOc1dRRFp2a0VXRWJrNmVnU0JwZ1I1cHF5VmRyWnJHQXJW?=
 =?utf-8?B?cUZ4MEtBdVlmY2pEbE9CTEFBaXBVUzI1MHoxM1lDc1ZWbk1BNXRlUUIxRVZi?=
 =?utf-8?B?OCtpUmlTNi85MUI2a1VsRGFVWWtuTFdNWmR6VkNRcGhaRzJkUE9PTGVuZWpr?=
 =?utf-8?B?WmdUQm1Bd1QyV2xXNEN5dlVvMkY1aGFDNzlYSk1YRkdKNy80WmpkallGNXln?=
 =?utf-8?B?SUQ0OGE1a3diVWVxRFd2MzRDaUJwY3NmV0lnNk5VR1BDUGpMUzV4NTNtT3c4?=
 =?utf-8?B?eGhPMk5uVW9yeHowNU1DRG42S1E1MWVna3AvUUhQY3Nob1BPYWVMWE1SUGhB?=
 =?utf-8?B?NjlmY2xkaUU4NkQ2T0VZSVJHekdlKzYwWmhzR09reVpQZ0gyMWllb1lVWmlG?=
 =?utf-8?B?NXFndjc1UjRWaW5MOVdkbXhoNGtRTjFmZHVIQXp6OUQ5RC9yQkVyTXNMVDBN?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	avhNPEl7NUPs9vjcn4HJeI6SA/9yG36+5ORKOd+sOesIDcGSHJy9cBh14HH0deel5X8ZmuNcb3OcNanQFH2Ff5fWYQlWRwWmeObWD3q2A0l+y4HaG+hgw6bzRW5lGhaVtXQMziHhRBix3S9jV1ui5tSPtfDGxvThwr8kQDMfjbvMGkEWXe2Jz04Rowe7v87Rv8pO8c9y3h6f4CBxpwfsdqBxKpR/yW+4jGl0EsmXM/xMw+J+eVuj+UrKE/ETw2K6TjouX1VractJv/cpFGHPVeoXYOhH9aBjMppsdsskd4CV4ov00fQfn5GaQxkIZPiFvVM9vWoz4fYQ+VXVQtHIjZzPvfm7UZpiELHtRwenhfNEHiJQdLxxEsHyBhQ6k171IWTD/8LQmIdsElnNAgeoYvi8LcV6U22ojQWOnNBDD7FFkISqROxIzFgqS7PG2ymWZhVz34OtxG9O4LGL6V/1g4fPU8A6X1fiCKyP2gvlsT2Mol9RMfC+d5X2n0tCfQwL5gMApW4+vS+I7p/LQfFGdPUke9eN7EQPmT1+IUvEQxg2E1S3UU5Yllm4nPe53A3AKPzcvSH3w6GFk2owocde43KSS2Job/jgFlPe3OxD/U3DYCJiuySEE4ya1y9f6e5XH0FH4O3v7khkqehgXvL0tOjuu3biSdvYx7HEcXGaVBOvWOF1vFCTjDagLlgE21jPawoRg874vqPR578K6+xAkfGnk5GnfaHiath6KhuEAmqGYqZq8djuBwVsKoIwZPFz50qxtnEiEXcmtZ1K4iGaUkcgaPLCq8suOy1t1U4+1Fn68SjWmeuPq57uTFvQp9+9DLqQAT02zcw/XLZgWXu+iA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74ad293-1c9e-4ae6-af6e-08db77dbd8d4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 13:30:32.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDxjQBTGzphCEggSO7Z2W35EMtrJZVK7Qw4oWlwbiQD1Ecy3PD34jDUUKkl6vELK/dsdKd5iGImXkO8/19wf8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5647

Dropped xen-devel, adding back.

On Wed, Jun 28, 2023 at 02:31:39PM +0200, Roger Pau Monné wrote:
> On Fri, Jun 23, 2023 at 03:04:21PM +0000, osstest service owner wrote:
> > flight 181558 xen-unstable real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/181558/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 181545
> 
> The test failing here is hitting the assert in qemu_cond_signal() as
> called by worker_thread():
> 
> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> #1  0x00007ffff740b535 in __GI_abort () at abort.c:79
> #2  0x00007ffff740b40f in __assert_fail_base (fmt=0x7ffff756cef0 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x55555614abcb "cond->initialized",
>     file=0x55555614ab88 "../qemu-xen-dir-remote/util/qemu-thread-posix.c", line=198, function=<optimized out>) at assert.c:92
> #3  0x00007ffff74191a2 in __GI___assert_fail (assertion=0x55555614abcb "cond->initialized", file=0x55555614ab88 "../qemu-xen-dir-remote/util/qemu-thread-posix.c", line=198,
>     function=0x55555614ad80 <__PRETTY_FUNCTION__.17104> "qemu_cond_signal") at assert.c:101
> #4  0x0000555555f1c8d2 in qemu_cond_signal (cond=0x7fffb800db30) at ../qemu-xen-dir-remote/util/qemu-thread-posix.c:198
> #5  0x0000555555f36973 in worker_thread (opaque=0x7fffb800dab0) at ../qemu-xen-dir-remote/util/thread-pool.c:129
> #6  0x0000555555f1d1d2 in qemu_thread_start (args=0x7fffb8000b20) at ../qemu-xen-dir-remote/util/qemu-thread-posix.c:505
> #7  0x00007ffff75b0fa3 in start_thread (arg=<optimized out>) at pthread_create.c:486
> #8  0x00007ffff74e206f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
> 
> I've been trying to figure out how it can get in such state, but so
> far I had no luck.  I'm not a QEMU expert, so it's probably better if
> someone else could handle this.
> 
> In the failures I've seen, and the reproduction I have, the assert
> triggers in the QEMU dom0 instance responsible for locally-attaching
> the disk to dom0 in order to run pygrub.
> 
> This is also with QEMU 7.2, as testing with upstream QEMU is blocked
> ATM, so there's a chance it has already been fixed upstream.
> 
> Thanks, Roger.
> 

