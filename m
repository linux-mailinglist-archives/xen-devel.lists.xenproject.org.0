Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F160D534DE0
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 13:13:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337557.562201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuBPt-0003kN-8i; Thu, 26 May 2022 11:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337557.562201; Thu, 26 May 2022 11:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuBPt-0003iN-3T; Thu, 26 May 2022 11:12:33 +0000
Received: by outflank-mailman (input) for mailman id 337557;
 Thu, 26 May 2022 11:12:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibG2=WC=citrix.com=prvs=138a1b502=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nuBPr-0003PI-Hy
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 11:12:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb814efc-dce4-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 13:12:30 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 May 2022 07:12:29 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6527.namprd03.prod.outlook.com (2603:10b6:510:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 11:12:27 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 11:12:27 +0000
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
X-Inumbo-ID: bb814efc-dce4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653563550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=PBMWe2e5tnSEdJ6Bv9dpHzpzqoZNTScW7UnwX7GdXCc=;
  b=AE+kmoaam++d7ygjxWOp5M+kelb3goE+19yt3GD+b8uaQyIFXVVPr5fA
   ApOyLWJ1GxDjVx5gRiUrIEXVB7qgowGm5lhWyRLm5THnpgzaPPlz8rz5T
   gZ9Sy+zMB3qZ1UT13TfAgoX+Bg0dQI3rlbokimj2YGJBoxlGMV8o/xRrt
   I=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 72630641
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iNNw7qkzJIOpRukJDxFHDjXo5gybJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfC2uFOfnYMWqgKIh1YNzg9B8D7MeAztNmTwdopXo9ECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWV3V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYFlonbpT+nckkfTJRMQpmHJUb9YDCLi3q2SCT5xWun3rE5dxLVRhzFqpBv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXu5kBgmZYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8gzO/fRrugA/yiRS14CyPcfZQOa0YuYJxhiIt
 yGd0U3mV0Ry2Nu3jGDtHmiXrv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWWc9Zb
 Uod+SMsrK073E2tUtT5GRa/pRasvRMCWtwWD+wz7imMzLbZ50CSAW1sZjxLZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICQDFA0M5oC6pJlp10yeCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:OKsqgaudjBiRXfPL0vLFpIZk7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.91,252,1647316800"; 
   d="scan'208";a="72630641"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVWWVI1/eWU1EoO1flrPBYmt2KOI82+nHJu1GiEsU8jbBA6G0qnLDnDJExQm4tW4TFHgfIopS0KQCqunUHYEtBYJFfuKxQp4AkPmoHxb6k2wuIKNRXRbWwzDldXRUtgsj7b3azKtvR6GMpjHfNXdFPIUMQjXjT6kNaZtJ8gRTv0LjLnYzmAEpJCKl89XJCdFhPD/dSdDvNBW4UffYCHTMsSMDXhH+AqOun1fsiiRbIcJwAAtY1B/q3cc0uuPISlKt+/GcuGXrAaFllsbV4UHRnyfou1Ysfhk6Z7GiYH06kVvncvit5lfWGwX8NF2qNADhvNRgNRoSSoxjLcix5JFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+B7jXwaQnmE/NSaDWI4p/4Ntnz7GpbMI32FmcxFI1dg=;
 b=Wzilfgy+UBiWaaoOjQojBobMfW6DQ2m2uTjtQFPTwKzDVlOXhBb/VuDlRNc/bH707hKrTTgGJ8N8IHfgjtU2bC1GUyO4herJ/onxCeRoDxY5c1aGBx5+p/DIpe/n2yGg8ecZVBp8cgygHZ11bgj4Fp9wnLthtvQrFTnnZUgJWZUHsak1EKCrcwFWdk2NnM71XBmg+E2oQ28gxIHdO2LHYLLRlLhJRzb82/RZF5IZBet4p53Sd4M47vbff1uzeOeyjp+mcliAdxiIJncfsXc77BLIPjhjpVpMofZVK2hQiMI+VSkKItvwnWk8nBKRkOlbGGodxeJ2kU7DCvbf/ScQWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+B7jXwaQnmE/NSaDWI4p/4Ntnz7GpbMI32FmcxFI1dg=;
 b=V9eOqVAxRYcFQIElI88n3GxmHbKI0rrAZQGwfSftIZdqwRXGUB6zYTk/BsLbYvTt8338rU0+zACnIFEhgq9/d4r4mvlpi/ep3jr3pEOhUdOysgErkNzKw4CB5fTiCyyefS0C1nmjUxGefTxuqcx4ThmYmLcPW2NA/YoMQszgelU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] x86/vmx: introduce helper to set VMX_INTR_SHADOW_NMI
Date: Thu, 26 May 2022 13:11:56 +0200
Message-Id: <20220526111157.24479-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220526111157.24479-1-roger.pau@citrix.com>
References: <20220526111157.24479-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42d24729-1ae0-4802-f36f-08da3f089e16
X-MS-TrafficTypeDiagnostic: PH0PR03MB6527:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB652768403BF9E084E9F48BD08FD99@PH0PR03MB6527.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HXZt2q4SEoFqqxfRL7n++shMOb0AWEQaoNkX0MvxafZRym3oXFNJF9UteMFsSobiBE35wGp79+LVZJNRZZglUVjM57euUfA1Lgy7fUwcwrGNAmm1oHu1xlNnhhI3zkr5GaQty0CmPf2a8MBXI/fvx5tx/YbHUyL5qmxmGshWTfDp1Iuut1QCKPkESPZdIk6bG4S8ULrZIz/VQXUE5I0IKunhQWjzX+RnGzjF28Oq2gwD5ZIFwEhvkebS6gkn6BN/hmq2Kvu0clHUe1eFo3kUSLfYNuHC3uxZv47dZbTZfVM7cW3HV0kk2bXMkHb9J9TJZpFOpu1v+WAIPYxBP3/6I3O45nymF3b/odx9I07Zm2rhPCuPiF74lt16Cxj+PVvTAybDSUPgRKBJesfXM5yjoMTItt81WP80dvGJ8ugwKOTAZoM+gHE6amyt9AEMbklyMW774bwfALzcdiWLWZSNc0VZHW3XeaTk0A4v9VpmldAS9XmHBCmxcspQlioi8FrorLQ9Aaygmlu21ZwOqbCrpDBculeylF0Vo7o15TfMXZxN/KfTzjaVzN16Qncits/2qIh41wrpybaJLB9b6uHfM+XyM1z0la0DAtud+UHg4VDxnQplGLHsxiYbDLSY1TC5L7aEDfbGupgXnM3kDZOFTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(86362001)(4326008)(66476007)(66556008)(66946007)(8676002)(8936002)(54906003)(316002)(6916009)(38100700002)(1076003)(6506007)(82960400001)(6512007)(26005)(6486002)(83380400001)(6666004)(186003)(508600001)(36756003)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFR2SncvbXMxK1RpUjM5SFhvMHJSUFdOb3QvbENPMGM1czVkb3llRTdaM3R0?=
 =?utf-8?B?R3V0RVNCbEZvOXE1cGlIR0QrRG51cEhBMEhNNDJ1VlRpdjY1TW5UK3pMSFhD?=
 =?utf-8?B?bWdXQlozTWc3d2J2SEloU2VSSHlNdU5ReTFCSnJ3dVRnMmZiVk15N3UzbStl?=
 =?utf-8?B?RHZPQnMzdDk2aUtwZEVYVmM5bzJXREVBSURvSXlZeXYxWTZMQ1pwLzRlUWNF?=
 =?utf-8?B?ZU9sMVVTa01Gcnp0VHNGOGFxSnNZT20rRUtZSVFDek1GMkR5SzhhQjFEaWhk?=
 =?utf-8?B?bVhWd2djZGZQYUwxQ05taDUwRXRXMDh4ckUvMUh3MkxvMHJzOXB4c1ZSaVZL?=
 =?utf-8?B?blBIS0FYV3BJb1l2eWFHZDFoWEFQSFFLR0pKemFxVHlGNkVaVUtoUVJCcGVR?=
 =?utf-8?B?cmZqN29XYytFNlNZSG1MUWI2N3hONUV2VVAraWlOcTd1dnVOWUdaNEV6eWlN?=
 =?utf-8?B?NSt3SWJZQitvQ3Y0YithZUk2RHVMaGlzTkNrTk4rQnZNY3ZBTkxNcitZSkNS?=
 =?utf-8?B?VU5xcVFXbUpJSDBhQkhDZHlEWDFWcEQybFBMcGcydlVNN2tUemwwdjJWL3hU?=
 =?utf-8?B?ZlJLVFBIaitGMW40RUxTa2tvYXc2ajhlQk5VRHJHMTZJak5IR2Uvd3R5a3pR?=
 =?utf-8?B?K25DaG1HeE12YjBVd3NNQ1ZxQ3M2N1FDREdOV0gyc21raGZraXFqcU5nRHdO?=
 =?utf-8?B?cWVwSUZsOUpHOVVVWjN1MVpmNVRrcDVDNVdkem5meWt2QVNIc2gxalBQcUVT?=
 =?utf-8?B?REVMY29CMWw5MVdoRkswM1AzQnBHd1NuTlY3Nm4zTi9YYzRib3JRZjJCdmw3?=
 =?utf-8?B?M1BJZWdMY3JqNzNQSkV5ODBFc0hVTFdUMjhWcEFrN0d2ZFZuN3pxZVI1b3JC?=
 =?utf-8?B?TkZmelFFalJTeGRiSlRjOW5GWVFnbmxVL0pZWFloMUdDYlI2VDBLK3FGblJv?=
 =?utf-8?B?alQ0V3lPc1dqODlyM1lXZGJpSXkwTDY4MklvbmhwdzJ6SGxqaVRWQ1IrdnRa?=
 =?utf-8?B?VnhqemxYaVBLNjlHSGlFYUkzblFUeERVaUFkUUlTT0pwMWxmZWEyNmJaeFR1?=
 =?utf-8?B?T3BhVXhRdzlOdDAwbmZoSWErVkF0a3pLMTJrNitkeUxwOVlibFBvMWY1cngz?=
 =?utf-8?B?MysxVmlSUjJwZ1BKb2R0MWZzek9lRXNJTGpaYWtNbStqQVAyaGJhZDBFZ2xk?=
 =?utf-8?B?N0pWa0Q3MTZNNDB6ZjV5eHY2dERhNGpvZE80NlBBNHpBQXYxbGZ4cUU3KzFo?=
 =?utf-8?B?SmRiZ0ZXVzJ4SjZQTGlSdzI2bXhvN3JhcGhPTmphTTdUSFQzODlzbnN5Tm93?=
 =?utf-8?B?bno2Y0FRbFNOKy9yRElMZzFJdW1vS0NodGxnRlcxNzB4Z0RhK0twYi96Q2pp?=
 =?utf-8?B?bDNCcW8yQnlod3F3UmdseHd0YzlDLzArWjZRVWp6Q3cvdENFNmttSkRUaG03?=
 =?utf-8?B?L2RCdXNpd2Y1ejJjTUl6OSsyRE9NQWRNa3V3R1NjUVBtS1h3Ni9SUHpqK3Vz?=
 =?utf-8?B?LzV0YVdqeldwUndhWEt0OTFVK3pBR1d1aDcwZWhYTTNaNEF2cCs3ZEpoeHFi?=
 =?utf-8?B?QkJzSUptTmh3M1ZBaHcwRTZHL2NuL1VIWlJhWGFHNngyMEYycEdEYWlmNzFG?=
 =?utf-8?B?UHpXRkpJSHdrVFViek9vb0dLWXZUNWFHWWgxKy9lN0hDODVsYmVId2pkeGtD?=
 =?utf-8?B?Y1pLbnlnYmhjcVk5MkNrNWhvSTJROFA0NGxvQTYyS3cvVVQ0MUR6aEVYbnp3?=
 =?utf-8?B?Qjk4MWNYbU9YOWF5cytjeC9HUmRkWGNwbmhYUkJqNDBvb2drV3lSQXhBZXla?=
 =?utf-8?B?WGRWZlh2YnpEWFZkUUN1OWtuaUlrUFlOS3lBVVU2bC9EZU9JRjhSV2J2SDFF?=
 =?utf-8?B?SVlNc0ZiUnZQdk9sTERVU0NzcmVkbGxxaXExVnRwRkZmZHRzU3RoSHJSaVJ2?=
 =?utf-8?B?bjBuKzBOMWg4MHFMZVJld0dkeVgzUVNtanNZR2tuN0JRRFR6VXB5d2FqVzRD?=
 =?utf-8?B?dE9sZkdxeU5VOWlndlpIYmdiVUJpWGl5RVZIYUFxZ3dLSElpdVloZmV1OXR3?=
 =?utf-8?B?Vk50c1czNjBZMkZSTE5UWmE2M016UVRsYzh3NUVIamI2UXF6ZGt2cjUvbVJj?=
 =?utf-8?B?RVpuY0RkdEJzUjM5N01ac3kyQU1ZTUVleVl4eW1ySVJ2WW55cGhrU1gvT25K?=
 =?utf-8?B?bUxMMUZaOFk0bjJjSUFucXBlcktxcmVzOGJmaEt5TjhmeTZZcjFXNkp5bHhl?=
 =?utf-8?B?b2IzWWJjdUxLbUd6d1UzQTc0OC94WWc2VlJsTHBRZ2R2YzloNFZ0Y0p1c005?=
 =?utf-8?B?WWhmZEc0WW0yM1g1WUQ1a05NQVlEYlJBcGZtSkpzZmtXQjZXMHU4Zi9EVUFQ?=
 =?utf-8?Q?tycQoEs+Z9r77QVk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d24729-1ae0-4802-f36f-08da3f089e16
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 11:12:27.2177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKMUVbZtqd37nEprMYaRp/PSP9DkpN3tdxhyNYHOoURE6YNbkXoIs7ppefQ6UOHZKE/2IUz/6/o/UW4RRZ1/XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6527

Introduce a small helper to OR VMX_INTR_SHADOW_NMI in
GUEST_INTERRUPTIBILITY_INFO in order to help dealing with the NMI
unblocked by IRET case.  Replace the existing usage in handling
EXIT_REASON_EXCEPTION_NMI and also add such handling to EPT violations
and page-modification log-full events.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/vmx/vmx.c             | 28 +++++++++++++++++++-------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |  3 +++
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 476ab72463..69980c8e31 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3935,6 +3935,15 @@ static int vmx_handle_apic_write(void)
     return vlapic_apicv_write(current, exit_qualification & 0xfff);
 }
 
+static void undo_nmis_unblocked_by_iret(void)
+{
+    unsigned long guest_info;
+
+    __vmread(GUEST_INTERRUPTIBILITY_INFO, &guest_info);
+    __vmwrite(GUEST_INTERRUPTIBILITY_INFO,
+              guest_info | VMX_INTR_SHADOW_NMI);
+}
+
 void vmx_vmexit_handler(struct cpu_user_regs *regs)
 {
     unsigned long exit_qualification, exit_reason, idtv_info, intr_info = 0;
@@ -4139,13 +4148,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         if ( unlikely(intr_info & INTR_INFO_NMI_UNBLOCKED_BY_IRET) &&
              !(idtv_info & INTR_INFO_VALID_MASK) &&
              (vector != TRAP_double_fault) )
-        {
-            unsigned long guest_info;
-
-            __vmread(GUEST_INTERRUPTIBILITY_INFO, &guest_info);
-            __vmwrite(GUEST_INTERRUPTIBILITY_INFO,
-                      guest_info | VMX_INTR_SHADOW_NMI);
-        }
+            undo_nmis_unblocked_by_iret();
 
         perfc_incra(cause_vector, vector);
 
@@ -4511,6 +4514,11 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
         __vmread(GUEST_PHYSICAL_ADDRESS, &gpa);
         __vmread(EXIT_QUALIFICATION, &exit_qualification);
+
+        if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET) &&
+             !(idtv_info & INTR_INFO_VALID_MASK) )
+            undo_nmis_unblocked_by_iret();
+
         ept_handle_violation(exit_qualification, gpa);
         break;
     }
@@ -4555,6 +4563,12 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         break;
 
     case EXIT_REASON_PML_FULL:
+        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+
+        if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET) &&
+             !(idtv_info & INTR_INFO_VALID_MASK) )
+            undo_nmis_unblocked_by_iret();
+
         vmx_vcpu_flush_pml_buffer(v);
         break;
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 03995701a1..bc0caad6fb 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -225,6 +225,9 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 
 /*
  * Interruption-information format
+ *
+ * Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit Qualification
+ * field under some circumstances.
  */
 #define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
 #define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
-- 
2.36.0


