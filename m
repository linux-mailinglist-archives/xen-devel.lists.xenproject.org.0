Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9E708002
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 13:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536293.834490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzc3P-0005k1-UE; Thu, 18 May 2023 11:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536293.834490; Thu, 18 May 2023 11:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzc3P-0005hg-RQ; Thu, 18 May 2023 11:44:19 +0000
Received: by outflank-mailman (input) for mailman id 536293;
 Thu, 18 May 2023 11:44:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=joHs=BH=citrix.com=prvs=495b323d3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pzc3O-0005ha-7g
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 11:44:18 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fd87529-f571-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 13:44:15 +0200 (CEST)
Received: from mail-mw2nam04lp2174.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2023 07:44:12 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6493.namprd03.prod.outlook.com (2603:10b6:510:b7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 11:44:06 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 11:44:06 +0000
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
X-Inumbo-ID: 4fd87529-f571-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684410255;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=at9DCZDQhDOTD5M6vmDudAM/wFOOvIm5gh38HBZdutE=;
  b=SCyMjIaOthLKxGQpYPTtahJpNZquZIx5qPxNTEkQaTxRq1xvhcDyzPQJ
   DINbRSNZzGg2u4PPTpXCZNMs8eizB7VhSYEIASPqH0IEjKmxp2gNQPbc7
   bgxTtbCJVmkY5njS9IOyI5kIcdVLPlSOAVaS1eNZPf7J6ajldEBrRvTck
   c=;
X-IronPort-RemoteIP: 104.47.73.174
X-IronPort-MID: 109392548
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:z91DC6NvE5AQ19HvrR1FlsFynXyQoLVcMsEvi/4bfWQNrUon3jYBy
 jRNWz+FPvneZmWkKthwO9+/pEhQuZLUyYBqTwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5wxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uZIAk9p+
 dMAExsmVU6s3OL1x62eWOY506zPLOGzVG8ekldJ6GmFSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxujePpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr93b6VwH+rMG4UPOWT9q5Qmkys/Us0BS08ZRilpKO3slHrDrqzL
 GRRoELCt5Ma5EGtT9C7RRS3oXeItx0bRvJZFuF84waIooLW6QuEAmkPThZadccr8sQxQFQCz
 USVltnkAThutry9Sn+H8LqQ6zSoNkA9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 xiRsCUwjrMUy9UX3q+2+VTGhTOEr53FCAUy423qsnmN6wp4YMugeNau4F2DsfJYdt/GEh+Go
 WQOnNWY4KYWF5aRmSeRQeILWra0+/KCNz6aillqd3U8ywmQF7eYVdg4yFlDyI1Ba67opReBj
 JfvhD5s
IronPort-HdrOrdr: A9a23:kRLQPKsdJ+JYObWN4E2+BSI07skDedV00zEX/kB9WHVpm62j5q
 aTdZEgvyMc5wxhOk3I9erhBEDjewK4yXcF2/hzAV7KZmCP0wqVxepZnO/fKlPbakrDHy1muZ
 uIsZISNDQ9NzdHZA/BjjWFLw==
X-Talos-CUID: =?us-ascii?q?9a23=3AOSJ3n2pPgmVRSAGvgdTqFxrmUcAacVP6wFjIGGS?=
 =?us-ascii?q?TMjhGE73WTkC16qwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A/9GrlwzfJ8FZS1n45zHU9bHYrW+aqPyFCBA3i4Q?=
 =?us-ascii?q?5gO6jOBxaC3SDiW65epByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,285,1677560400"; 
   d="scan'208";a="109392548"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQi/l2gQ0i/Z1uY8IBqc3PvKEfqJPIB9e+UCs0SpjiyalWaZW1BkTPiDn1DjDjobxKtlIEaqbitsaITPAPDIYJaPJATmti32gGOtWC+PpOhM56v4Wz25qs3oE0hsIayeNKmCudiTv8PYU5fp7/ZozWxEVUValO7qIZnY7LxEfIiYzBkCBCXgy9bU9yFhpOyYj8AKOvUPxppRtZ3dw0ui/D+/FY/3rMhID0QTGMOeabyu86ROs9uQ7KScCT3CyRq0VIOgAQoQ8dsqTa4d9tj7xQqcPgPq6INKDLBwZ3kkd757BAW3SdDbFDK0B3Nxl7RHFmWC3gbFwoxrPzwFsi6r5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTUiPJ4aaci7VUDmEZj1uJHBr208SvM+4RyxcdBpU9E=;
 b=lt2FILQSN2sVXSWU8JlJQ+Sa1gObxX0CBzX2HIgARExkWgkjefGMHp1Q0Gf/DMSUmZcEJp8DNWyYq6IXI2gbYINPnwTFtsBYjNuSSv+TS+wHISDlLhxsz1mblXBCIFxwM7eQP4aUntQjBTl3TQ0ZFLsNOIzt1y26cooKJo7Ren6QUgIjteeOy0IRZOnja5y6LNA6SbANlzW7/eYqkv9jufvHCPNLgkQE3CAPGc315K8MEn6CJi7f3Dc7hUnycpepC1mtPY9qReyNevhdGGFqR/AO6WujbI62R5TQHLH2Z3i/687Az3ilgyP3HYid1wFTp38Z8YR4Y0xOp/QKDYRwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTUiPJ4aaci7VUDmEZj1uJHBr208SvM+4RyxcdBpU9E=;
 b=RF3+WmGR2ZUKUBnpREkyuC/zgogbT3CZTZh2yaRNmWk3e0D4hSiOV6ZQWrcmjBPDaYcuEU2ABgQnVG9vO6lPUMjuThFtNdPwNWlm1plfY3tYSupcu2Xr2GIJWhprI+ZPbMGzx2vq++tVsBBwvAc5nLhY8BA2fUwI/G4VcTlwzvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 18 May 2023 13:44:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	andrew.cooper3@citrix.com
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
Message-ID: <ZGYPgYiunhlDQsR4@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-2-sstabellini@kernel.org>
 <c22a8925-15e4-47b9-6f5d-f85bbe802255@suse.com>
 <6f3f4e12-ae5b-c58c-891c-fbce08283206@amd.com>
 <ZGXwYsOX44/EBI3x@Air-de-Roger>
 <001b153d-1148-e9d1-e69f-da689a9f395b@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001b153d-1148-e9d1-e69f-da689a9f395b@amd.com>
X-ClientProxiedBy: LO4P265CA0100.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 7016521d-ebb1-4acb-0403-08db57952f88
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NbfHkPtTBvaknJPyBjT5W3lXy+Use8dyF5nzgwoPyLOtmfHAiuDNiaaFyaI7eR8QZrOFmxvlLrQZzbdoYkyAp3vyGgrV07LAh+h3ZRzQek3YBx8TkxALPGJlgjLi+kmHoC/eoCXss+PbslDvhcX7D7EMgEySvSuuoQZtEMkSbN+NCX/Potv5tdgk01wX6MtCjgINMjDdd2pxvWK46eGhv0cTiK9urvYABzwvdlJrmG6N37ggyij87K7bdh8LYace9it93xMJNcIFlLwRbT2uj/8Yj6DYDijcHG25qOhDcGcsH3gFp7BSuEgrRV30E+K3EVEie/F+nqyuNChYaL+0huOFPdiw3ocGbn1I4578FucG9ZjvqneZMzzX5c6NoiiYpCHn7JlTyhZSe4IekzOciO8AUAq32VumkzwVdexxjqV4zyjPJk/JxYKaywmuh7SZ8nMjj86BwzngR82p5xVZ9EIEYaZAhSl+XIFO2ZrBo8LoKs5g3v6bANn1RGj0QxvELz4lFq0rir8NDbeLkYB3KT1EUXzoBAZNz4akGJGVFuttNdQGMebC+RQOHlF0ClGc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(186003)(26005)(83380400001)(107886003)(53546011)(9686003)(6512007)(6506007)(6486002)(6666004)(85182001)(316002)(4326008)(2906002)(66476007)(66556008)(6916009)(66946007)(82960400001)(38100700002)(8936002)(8676002)(86362001)(5660300002)(41300700001)(54906003)(478600001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTNNZm9KSHR4alhQT2pwcnpWMERITER4QWVENThpK3pZS3NJcHVIcEpXcFh5?=
 =?utf-8?B?TjlOeFdzVnBiYTQ4U3FCYnByMWdMaU5RVjB1RDhvOVVZUGZnWnlNRGpiUS8x?=
 =?utf-8?B?NGxHalpBM1dwZHg4VGJYNU8zZS9lNEJhdkJURnUvVUx1cHNrQTREdFJOZUJ4?=
 =?utf-8?B?U3pHbTN5VXlwVWVTcUVMdTlvYk5aSGZ5d3F1cndKVnRCVEo5dTM0RlJCbnV4?=
 =?utf-8?B?S3JNU0ZKT0hZTTVVUHR5WkR3dzF3N0pBejFSQTJpbldLSnNjdG1iaFpGZEpo?=
 =?utf-8?B?Qk45TzBKM082RitJbS9jRUxKODZJRlViT3NYZzBQZW9ZaDlvbmRDMTliVXVP?=
 =?utf-8?B?RG9YQzkwcjNHMXMxeXFiSXJzMzBkbFdVTHRyWnpjdHd5UzBzTit2QndRa1d6?=
 =?utf-8?B?cUMxalFNV05lMTlZY1R6YWV4U1lGd0NNZTFpU1ErcEIxd0lDUHUrdGlkWEN0?=
 =?utf-8?B?TlJkOTJnQ2pwdlgzaEphRDlxWmY0ajkxTWF2RzRzTHN1clorM2pSNFBLaWI0?=
 =?utf-8?B?aTMrS21NcE9welNqVGhNcHpac3ByQXEwSWxuVWU2bzZPbUZJT21lMksycHhK?=
 =?utf-8?B?UVYrZ3RjSU43ck02ejNzVnJCcVBNNGppQjdZZmZJOThYb0Z2aUVocmFYbGlt?=
 =?utf-8?B?ZC8rclBVcXd2aWZXamhveVh1R244K29GR3I5bktJS1BsODlWV29VdlpxWURG?=
 =?utf-8?B?TWJPQzVjdEVpcHhzcGxDRWtWQ25GU3pNOURhVDN3TFpVaFVES0hUNlVFR25q?=
 =?utf-8?B?a0RxTG5LOWtMRS9hQ3hyR2lVWU53cU5ubktuakhjaTZCZ0hsczlJNlJLM3Fl?=
 =?utf-8?B?Zk9CMVNRbGdNVHlhNHJzMVA0S212ZmhXdmJyeWkreTdCaUd6SEVTOWF0bWR3?=
 =?utf-8?B?bTB0aWxibHBpMVgxUS9KOGZTTlpYSjVydXc5alV1MzlUWGlRcHFPYzRDL2RF?=
 =?utf-8?B?K3U0eDZQVWthQVFUY3lUWHNRdXBHQUtsQkFMcEo5MjkxZmFQRWt0bTRqQjhH?=
 =?utf-8?B?MWtEZDdqTjdYekVRbVZjZnppbUlKV3dveVhwR2lyU0JiYUZSTFNtNHRWSGs2?=
 =?utf-8?B?MklSOXVGVERaam9PdUZiZ3BPSFIzU3dDeGdERWcrUHY0ZnY5T25MT0c1Wmc5?=
 =?utf-8?B?dnBDNi9XQ0ZtNEhEcERPQ1hnYlFLSW1tTnRFUWhLOFdiaEVybnNvOWpkcm9i?=
 =?utf-8?B?OHk4eGFUL2JTSGwvV25MQnZGekc2bm5XbElVN3V1UStxbE9IY2dBdTNNMjlm?=
 =?utf-8?B?MVo5R1dObWhDTlEwNWVFZ1U1aGxNdjFFZnJPdGJ4c2lvOTFQeHphY3l5VEly?=
 =?utf-8?B?ejk4clBhWmorQjBnaUxaR1paY3VQVEtNZk9VVmRXcm9mUXQ1Tk85cExFWjFu?=
 =?utf-8?B?UDVaTExVWFNMdUdCM1Bpc1JIUXgzR1FFNWZKZ1k0VFBNdFZaQitSMm90VFpu?=
 =?utf-8?B?Umh6NkhXNkZWSHFFWHJaZmdpYlROMHBiaHRObkFEZWYyR3dnQldHOXIrdWwz?=
 =?utf-8?B?eG45aUh0aTlPakZMUDZMS2FPMWZZa3pCZzN1bmJmY0txeG01YzUyak9FYnBV?=
 =?utf-8?B?a095N1o1K1BWUC96emI4aFBFUkxmbVI0MHgxZlFBa1FxeHZnUWtyc3dBK1Bo?=
 =?utf-8?B?QStjTjAzVkE3bngwbzdlSXU3dmp3MllyTUZ0T1NTYVlqc2RScVhRTDRDQmkz?=
 =?utf-8?B?R2gxYlF5Vi96NHJMZXBOYWlPbVc0SHgrR2RYYUFkalRHdzdTODBPSkR4anJY?=
 =?utf-8?B?Y1lxdWxjNWJzci9aNXd5dFB6TnNzL2E3STN3ZGFoTjc3Q3hkRnpvQmRteFE1?=
 =?utf-8?B?WjNqb3h6M1hDU2J2SmI3SDI3US9DYk10Z21IZzU5T0ZVVXFOY1JpbktONGY3?=
 =?utf-8?B?REVoUU82T1dmZ20vUnFJNnUvdmtUZXhPTU9zdytCa0VZU3hqczk4cXhQTGZZ?=
 =?utf-8?B?UWMwVWFnQWlNK1BwVll2S05OdU5DdEZKMk1ST0pNMVRBcHE3YnFmN0FBNEs4?=
 =?utf-8?B?Y0ZGTmlBVHpRLzlabzYrbzhKZW9mWWo1VGhMMmFNRHdBRmxYUzJkZnVoZFRH?=
 =?utf-8?B?UXdNNUM1NTBUalhYamQvZy96MzMrUlFpbEtqUVRWU1liVzdOOUtwL2xicGNk?=
 =?utf-8?Q?odyjioMygDg6zfnuMRe3t5/3p?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jrVsGDOrgDL/vWdFfmhei0KH5ReMNif/tc2I6IyLuYYik440JraR6cSBd0sQAiGVnq+GxCBKMBeqzSYSk/qpJtGwrJotM0uPb5sFa2c562yhec6iXXzB7yjRFjFnIeuaX5dW7QK/+QqrYZlIiY3DjVE9gNDDLcEhQKygtVQcSpEUlUe3ZjgbHY+fUFvLb5xhEIw53ag924GPz0pwmgeZCX/CLEiNjugYgVc9Om6toogC8zHTdU8/BJsjqhZwb1w058xXb7+9sYYTqa+1BdWu5KOX0Pu59uiXERXDGUuuZPose6ZkLQWzcjAlanGkP6201QK03NMXPWtsi8T7omlFzPcpF2rmAGW0ZjYaW/FYLeByJmmlHA8JjgKbPoghPhB0msRXBs47VrvkbdBU2YzrUIJ3co6ZSlX4jMfBG1QzMc3N6jfGFb0DkZ+9DqY2bbfG2B/cCAoULFgpv/i+Xtt24ZvwA1o4uTHdkSFCE8L2777NsiwXkpspjkvmGNEnA3FrLUyeAtazgUUnElbjV0vY9v2LDZhmMnz0L9iJ+GnmNMG+XM1ODvLa3LZ0bB3PQAtU4KC3x6a0gfrwwC0h2xJu18D8xeH+dpwqgVeWmni7Wc2+DRJFqU6YX8LxQ7umQ3x8HvHnJNdWovbjMn8ukWRmydDSeKNYn5MovwGytD0fVVdS3uwPmsNLjll9Qg5M43I/B3vRYnXK6wXYLNj2X4et62loeJ8EHdK8jMW0+qhTSL9sht2Idv0MlkhUaXswFUJsWqnW0OtPaW4lxjxEchldM2se6c4PnzgIoQrvM/SCmW75gL/MIWkP+Y17t52jlHsNC3GhGSv+ieD+WHperuQxUHrbc8+WcVETERT5DB18IVQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7016521d-ebb1-4acb-0403-08db57952f88
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 11:44:06.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ezgKl3rsAFUtUjO71aQdeyzlcUu9qOSNd8FH10Mkv4JqNEDrBs7McF7oXNGJS9NZXIjfgKlj+MiKY/dVKZBWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6493

On Thu, May 18, 2023 at 02:36:41PM +0300, Xenia Ragiadakou wrote:
> 
> On 18/5/23 12:31, Roger Pau Monné wrote:
> > On Thu, May 18, 2023 at 10:24:10AM +0300, Xenia Ragiadakou wrote:
> > > On 15/5/23 17:17, Jan Beulich wrote:
> > > > On 13.05.2023 03:17, Stefano Stabellini wrote:
> > > > > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > > 
> > > > > Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
> > > > > the tables in the guest. Instead, copy the tables to Dom0.
> > > > Do you really mean "in the guest" (i.e. from Xen's perspective, i.e.
> > > > ignoring that when running on qemu it is kind of a guest itself)?
> > > > 
> > > > I also consider the statement too broad anyway: Various people have
> > > > run PVH Dom0 without running into such an issue, so it's clearly not
> > > > just "leads to".
> > > In my opinion the issue is broader.
> > > 
> > > In pvh_setup_acpi(), the code adding the ACPI tables to dom0 memory map does
> > > not check the return value of pvh_add_mem_range(). If there is an overlap
> > > and the overlapping region is marked as E820_ACPI, it maps not just the
> > > allowed tables but the entire overlapping range ,
> > But that's the indented behavior: all ACPI regions will be mapped into
> > the dom0 physmap, the filtering of the tables exposed to dom0 is done
> > in the XSDT, but not in by filtering the mapped regions.  Note this
> > won't be effective anyway, as the minimal granularity of physmap
> > entries is 4k, so multiple tables could live in the same 4K region.
> > Also Xen cannot parse dynamic tables (SSDT) or execute methods, and
> > hence doesn't know exactly which memory will be used.
> Thanks a lot for the explanation. I checked more carefully the code and it's
> true that xen does not aim to restrict dom0 access to ACPI tables. I got
> confused by the name of the function pvh_acpi_table_allowed.
> > 
> > Xen relies on the firmware to have the ACPI tables in ACPI, NVS or
> > RESERVED regions in order for them to be mapped into the gust physmap.
> > The call to pvh_add_mem_range() in pvh_setup_acpi() is just an attempt
> > to workaround broken systems that have tables placed in memory map
> > holes, and hence ignoring the return value is fine.
> In pvh_setup_acpi(), xen identity maps E820_ACPI and E820_NVS ranges to
> dom0. Why it does not do the same for E820_RESERVED, since ACPI tables may
> also lie there and since it does not know which memory will be used?

So far I at least wasn't considering that ACPI tables could reside in
RESERVED regions.  Given the behavior exposed by QEMU I think we need
to move the mapping of RESERVED regions from arch_iommu_hwdom_init()
into pvh_populate_p2m() for PVH dom0, thus rendering
arch_iommu_hwdom_init() PV-only.

> > > while if the overlapping
> > > range is marked as E820_RESERVED, it does not map the tables at all (the
> > > issue that Stefano saw with qemu). Since dom0 memory map is initialized
> > > based on the native one, the code adding the ACPI table memory ranges will
> > > naturally fall into one of the two cases above.
> > Xen does map them, but that's done in arch_iommu_hwdom_init() which get
> > short-circuited by the usage of dom0-iommu=none in your example.  See
> > my reply to Stefano about moving such mappings into pvh_populate_p2m().
> Indeed, if dom0-iommu=none is removed from the xen cmdline and qemu is
> configured with an iommu, the issue is not triggered. Because
> arch_iommu_hwdom_init() identity maps to dom0 at least the first 4G, right?

For PVH dom0 only reserved regions are identity mapped into the
physmap.

Thanks, Roger.

