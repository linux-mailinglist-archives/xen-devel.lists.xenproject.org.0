Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F25629F94
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 17:50:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444029.698816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouz8l-0004Sw-IN; Tue, 15 Nov 2022 16:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444029.698816; Tue, 15 Nov 2022 16:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouz8l-0004QM-EG; Tue, 15 Nov 2022 16:50:27 +0000
Received: by outflank-mailman (input) for mailman id 444029;
 Tue, 15 Nov 2022 16:50:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxYI=3P=citrix.com=prvs=31178c1ec=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ouz8k-0004QG-1F
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 16:50:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 982e225c-6505-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 17:50:23 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 11:50:13 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5002.namprd03.prod.outlook.com (2603:10b6:5:1e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 16:50:09 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Tue, 15 Nov 2022
 16:50:09 +0000
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
X-Inumbo-ID: 982e225c-6505-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668531024;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Z1ZprQ0FXh3OOGjxzpitGDNCt53FGhHo0sxU3IEOM6k=;
  b=eMc79v1niwGI9V5X12fBIGKn4t2zuaYl6r7dv5vhii6WkfW1L/bo0uOI
   w/oJI8Dp6khNug4BKPrti7tGvf6tWuyFEgljS2W2Iwc7ES5pJL/MqIsVh
   gE8Co+3zuEl55mRoDvu6eQWemgTKi4rpF7DrRnMM1opYQALwsKWMJIoSH
   U=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 83938697
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4JHRTaM/AxFo7L3vrR2WlsFynXyQoLVcMsEvi/4bfWQNrUok3mNTy
 2EaDTuAPviJNmTzKY1zPoWxph8A6MSEm9RrGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5wFmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rxlXF9wy
 MEeFBdOMReSpNKW4e2Ca9A506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toin93b+RzHyTtIQ6FJekyq54sUOo9GERMRlIa2XiuPSClRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkgJSCRQLuMvssAeTCYvk
 FSOmrvBBzZirbmUQnK17aqPoHW5Pi19BXAGTT8JS00C+daLnW0ophfGT9ImGqjliNTwQGj02
 2rT8nl4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CJsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:EfuVp64Mlw6XZQrjrgPXwaiCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oK+RSDljSh7Z/9Cly90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjow4OyjhkQGhYaVmQvmnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF6ifF6k3F6nID+nXiwViXjT/KptH4fiszD45kiZhCehXUxkI8tJUkuZ
 g7l16xht5yN1ftjS7979/HW1VDkVe1m2Mrlao2g2ZEWYUTRbdNpcg0/V9TEr0HACXmgbpXWd
 VGPYX53rJ7YFmaZ3fWsi1Gx8GtZG06GlO8Tk0LqqWuok1rtUE863Fd6N0Un38G+p54YYJD/f
 74PqNhk6wLZtMKbIpmbd1xD/efOyjoe1bhIWiSKVPoGOUsIHTWsaP6570z+aWDZIEI9p0vg5
 7MOWko+lLaQ3ieSfFm4ac7sSwkGA6GLHbQI4BlltREU4THNfvW2XbpciFqryOiy89vcPEzFc
 zDfK6+OMWTXVcGKbw5oTEWZKMiWEX2cPdlzurTCGj+1f7jG8nNitHxVsr1Cf7ELQsEM1mPcU
 frGgKDafl90g==
X-IronPort-AV: E=Sophos;i="5.96,166,1665460800"; 
   d="scan'208";a="83938697"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDYfdX9K8q5j2U9REtwcCCVA6zqlJCqSYH+YHFeZbGXfANd1WrO8cQr4YdEKNgRk2Dof1o510dkjn3Nxi+pGhuJ6McEuIwNWvMntwYkAGuDIg7EwKHfDh9PhWZdKnU0MO+dt26O+aPNt+iJpM3plwNKIBg/6XIi1L57lS9KIL0u2Yq3DoJjklXCfHP4uAJhGuV7WUTJ6KQgURqW6dVhLBjr8U7OUJNJo5VlDoGzfsh7oa/a9Q5ZjqzSIB820aQXoBnD2uKkkCoX6jj/70CZB4uDc02PKq+1uXf52b14DL0q3adrXEik9Rooaml5+LbQx3a/MLhE8iscqtHK/m2RykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPYNm5w9ovo03eANqvdErtCYKxnc9sm041giFK3W+/w=;
 b=Swe4JlTT2NAhggkvtgTpHVGKMaWGK3tA9m4/kf9VTLCKRykVfpNtdi1OhwARz2GHtGUKx4u82jercCiKuFyGyv6mHSy+NYnJGY/xP/U2rYWUT51iq3UAC6UjKpkz0NvpRck56hDqIOYGA5iIScp/KNG6Yr+BajzUnC3PZ3hcGvQ2h4fPVTR6TCmCePCP64rOc15p8ihrwUxYTUENBJbbx5Yo4vBRTFmMchBcHyQ7fqaNMTUkWc4JitjcBx10nXgCCWqlUDAmddNj9eRXY3KPzJiko6Rc7FUV5fc6LXPapZqGsp4a3JcM6l0N70L7D7gUBngLAAORHubv2dBuc9nAGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPYNm5w9ovo03eANqvdErtCYKxnc9sm041giFK3W+/w=;
 b=E/d+/1ivVjBZHYYrm2fvvXY13VHUnzvOmW8zShAzy6Y94BMcVeGdM0JDdlEJXh+EVZlB4wo9yH6Qx18Pz5ktacGdwUaNVe+nA+rzlItmHnoES7eB5qNJuyMY0w60F48iy0gFAk8HCOIyBM7gCEASD1BOy8HEBWGOBWyMXbYJnbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 15 Nov 2022 17:50:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Henry.Wang@arm.com" <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.17 v4 2/2] amd: remove VIRT_SC_MSR_HVM synthetic
 feature
Message-ID: <Y3PDOp4pV/Oyjfl2@Air-de-Roger>
References: <20221115132657.97864-1-roger.pau@citrix.com>
 <20221115132657.97864-3-roger.pau@citrix.com>
 <c698b1e2-c047-1197-9c26-2239ea56c30a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c698b1e2-c047-1197-9c26-2239ea56c30a@citrix.com>
X-ClientProxiedBy: LO2P265CA0103.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5002:EE_
X-MS-Office365-Filtering-Correlation-Id: 18853936-986e-4962-f392-08dac7297460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I+T2olSrYsyYw8kYUgn4eexrpugCdn5TvbL8XZ9cWrG6SDRyEQGizHFDtS2UF4rFyDh2ajzElPms9+H23sTPMx2qXLC7Rp/VtvXOXJr6ql77YISUVF06dzHQ1dfxyHQetL8TMR4ooYW84FLToL59vuTWnMmDGvTRe0PvGz7I4C54rBiDML6XVxpZWTzSB+WWqgsYDPeoZwc8+b1KUDZVOzYI1eApnkvewOxk7V7RHJs2seqYc8QuUnIMr5Xw9gElt7aXzlMkxYCq23Tze7exfw+8LAFPlvMFYz52Kq1BbnRf+pViEbqTQth0gmDHPs8p+0KPSgyq+GHZ++QpvvgQ31PXQyYybnfHJOdSVWeBDdlN06S3ZC/F0QWaxhj5MrFSrZfUZbf34mH3SUGbfwQ3nax1fHuln/uB7NUaBwNzrlV+gQPBxfc0QfE0R34KKn62F05m3yA+aUoxtJd8v7KaVbjOCqzfHbVil7PuvHm8p5eCYJ2NL9XMkg7k75BnYTPsotdmsZGskhwYTZFT17kFJforDf3SMBH/toxi/CRwed/pVQj4TE7DmVkeOwG2BN0QAvWjEl4CvoQ7BSjpy7RHKoBmzoK8A8jwg4XKGEn2L+akvBIwa4N9FBVeqhD6zNWlFdX/dyXA1omo3Az9XXTAGTKM4gR2BhBZufX/fzaV1DZix1Iui0qjOIocOLFp+M4NjHnRYyRfGrInuiYUyXpE3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(6512007)(9686003)(26005)(54906003)(6636002)(66476007)(316002)(66946007)(4326008)(66556008)(85182001)(2906002)(186003)(8676002)(66899015)(86362001)(82960400001)(41300700001)(33716001)(6666004)(6486002)(478600001)(5660300002)(6506007)(83380400001)(38100700002)(8936002)(53546011)(6862004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUtHVWw2eGtuVUdFVFFYMTZSL0hEVDgwMW1malhDR3J2SmUyMU9IbmxjSnBC?=
 =?utf-8?B?aXVoWEdxVzNnOFRDbmVMVmxRc2dsS2Rud25mR2ZmOE5iUUx3MjY3VENxYTU5?=
 =?utf-8?B?MXhyVXFyQkg2bmZWMnJrOVBJbm5HM3l6VjBWTXZuOThXdVBZa2tvem5tYUV5?=
 =?utf-8?B?NUMrb2dYZ3NaZUZLa0czblpqRk1qcExnK3BDc1hXS21iWmFlOEpabFVMMEtS?=
 =?utf-8?B?WGxySXpnZ3NDRHNzVEZrY2g5OERFMDVndXZHeG1pblJVM2s0WEhWOWh4Njlx?=
 =?utf-8?B?Q3ZrQzFSazA3czdhTzE0cjhQY05hejRnaENFZGVyZ213dEhUcVhmRFNWOWZ6?=
 =?utf-8?B?VUE1NE5vOExmS0FZWnhoUERFRGVNb2Jia2JZNGZkellJeEZDQUVtTnJjQVpP?=
 =?utf-8?B?Y0EvMFlZZDVrWllpOFpjTFlUbTFpakZuQjZnZUIyNDJMUzFyMVY5bFQvbjNK?=
 =?utf-8?B?RWN2UURRMXBCOXRTaE5hUWRVZ3JqcDhEQ1R2VEdkaXJ1NzgzUU9pb0tQQ0ZO?=
 =?utf-8?B?VXNubjdnb01waGR4OEdrSVBKeFdvejFWVS9WMVYyR0NwVi9vTWVvaVBDT3V3?=
 =?utf-8?B?Rnc5cVpjUVlSQm5nQjl1U2lNT1BZaGc2NU51dzh5YTVtTGE2YjBhb3puSjQz?=
 =?utf-8?B?YTFOR1hVUE12ZFhFNGEwMXVUeUNjT2d3TFRPS01SRlpFQkNqdjYwd0E2R2xY?=
 =?utf-8?B?YVNxb1BHNGtQTll3bGZ0dmMvOS9ZY2V2eE0xaklhcmdvdi9FclVtOWg1VFpD?=
 =?utf-8?B?Wnp4NUlyc0NlZHZFdGJkT1hhNk85ck9mc1kyS3lCSHNUZjQxYUZkNUZjbTZF?=
 =?utf-8?B?bU92MitqZHl0K09IWjAxSGhFU1JhTy9EeUprTmFaTCt2U0dUSjFJWEc5NmNX?=
 =?utf-8?B?WnJiUlExL0ZNZHpFVjNrSHB6dDgyWTZhR293TXJLUzhyRXJRR1V1M0dHWEor?=
 =?utf-8?B?TEJWMkFNWWNIa1ViTGhwcmxBNkdRRG9Wek0zZDBDT1o2dUZmWFIxTWJZcENR?=
 =?utf-8?B?aUptc0hBL1ljM1NESHMwYlZYNTk4V3V4S2V3c0MrWlFHd2dqbmxEWkZ3ZG1X?=
 =?utf-8?B?c1RaNEsrQXc2OGlYZGxPZ0w5clltVzgyejJYT1pPTFEyMDB5QWIwSzVTZkhP?=
 =?utf-8?B?dVBCMi82MU1XRTJCZ1Fvak81b0hiay9YN2R4alVzaVhIVTY2NWJpaUszSk5v?=
 =?utf-8?B?aGcvL2xOQy8yMG9tOEM5ZW9ZTjVpUFMwRTk0ZlZVQ1htRTIyMjJlZU5HYWpa?=
 =?utf-8?B?SHpMejkzbXcwTFlpWXBRanhsc0JyRk1IVUxucUJlTW9oOWcwU0F5NkhmK29N?=
 =?utf-8?B?aENxdzJXZFRnWnYwMlp3UEJORWREN0o4UjlQOXhQaC9UalQ4a0hQRFprbDRn?=
 =?utf-8?B?Q3ArVTByRzczNTgybnBDZ1Y1WFh6RzR4S28wN0tiTmNYNE1FWGg3clk0UGhi?=
 =?utf-8?B?QXJuSENNMmZWSE9JVnM3UE9VTDh3d01GTFBCYUkvV1BRT2hxUWR4KzVTdG9M?=
 =?utf-8?B?ekh5cEpReXJrVy9GR3FzaVlDUWxuWTRmNkFQL3FOQ0xHS1kxMk5VS1QyenBJ?=
 =?utf-8?B?TitNRkxid2JPeTlxeHNpU3Q1eDMwZjFDcnJRdU04RjRXZC85TkZscnNWakZO?=
 =?utf-8?B?b0V3K3grOUJncGlHcmhxdHBvNEpzaDN6M2p2UVNQQXFIeEZzcTFoK1lmRDNW?=
 =?utf-8?B?NmNFdFhQRVBaeURHalNHN1dOSEJIT1k1VHl3TVNuVU1ZbUJybkZuam4ycmpt?=
 =?utf-8?B?ZGNncXlTR2NHK25zdkRUSTN3RVRWbTA2STB4VzFZa2lyTDdRNnR4TXFYQTV6?=
 =?utf-8?B?cVVWU1ZJTk9NYXp6OVk2UGlCOFlEMTl4MkJZUTRBYWc1K0Y3RnFKbTBvcnFu?=
 =?utf-8?B?bDIweDBhV1BpKzhpMmpOblIxYXVCSEgrL0k4aVZOWTVHQUtGRTJWcTkwaS9V?=
 =?utf-8?B?SnRpN1B3ejZXcjRGRks5Q1hvdDkwS2lDMHlDV1J2U3JnV05oTUtPdXpodGFn?=
 =?utf-8?B?WEtjTVQzWnBLVGxFQUlHOXEzUE44cU9DRTEzZlAxcEtzbFpERkpoUm1VVTd2?=
 =?utf-8?B?NVBERXlwZXpjODI4Q3pnSjlqdWgzL3hpV0pSdWZwcE96WXNJdDVNOXJiTTAr?=
 =?utf-8?Q?NykLYJ6zu/Tez7EMJlcHN3+Yu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3xv1zUXSYd8jMReWCbd+4ha2N1jQ8audg5+6jmU65fKj8iSTAEEWsRnsO+UiY//WIAl5+4pyK7jH6sfG24vL9NXnf67kKGlsPu0CTPlGuSUaWEPzluVbQvQOHllCziRPRmpXVWciG/9jJ/gZgKSrqa7xgWfwU9PFe33SptUn3y7Hx9oIbkgcW9UucxSSkfyPtPRmLo+58A8/L76hz8tBHHGDr+D6w7btscJdpp6e8ZlaLgalb2QwWs++cybMl9upZGyfIgmYkRI6B3rFx+mA++MpptTnv9vnVEH1dtl/0XDtWA+fwQP26jRLuDNDxjKa0Mt1mMNqgJ0dmzmNsVxB7q3bxBSySdl1qwM7oxIx4VdMB/Zf3D60AW0Y5xXwkCOtt1EsqQyJTFP0n0wDsQhdPOZVRzJ4+wNkRFUHZ9PE4uCK+UOgLV9uQaW57ZiMjgPKCc2WC/kOpxkaChk/kqj6F+WyHEVYrAhxbmGRvEzzNVzx1Wq9pSYzs9l6aTQMaGH8DFppwmejvavYavwmpxk7u1lJ+Z7s5jGUj1RM+ut1+6CQR+ejTTpDCK6y1jddn+uSr99kNKE/V4tW6BX1WIhGSwnThNucash5j7fZ60V16kbH+Cg3cyW7PPHFXwgFAj0Aj6JSPcgcLu62P8WmvLzrQ34sXfpTgb6szxvchLRM5XxswIoeAlfi+AFeSNbAy57ot1TJnWUzhdawiP+DqXILUIPIROOI1XiUdmM8vl0rfv9+YvzBBDuQW2EjN/retTTRNbZEhNIq69ce2BZXntSUqrjheXH2KhfLvodPhphlNZszhQ8le1ZMKlHU0iG+YO91Vn3WDzPBmEZhyaGjkM99p+NRaYiC1j7d88nWVS+aTdM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18853936-986e-4962-f392-08dac7297460
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 16:50:08.9255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mOVkB9ZxMyGugt3bfdXNOMJCrerTrx3X+Y4+74RBTiyoltJ/9IBihzi1zSE4ZJSUfEQq/kwOHNDz9rXIXueiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5002

On Tue, Nov 15, 2022 at 04:21:07PM +0000, Andrew Cooper wrote:
> On 15/11/2022 13:26, Roger Pau Monne wrote:
> > Since the VIRT_SPEC_CTRL.SSBD selection is no longer context switched
> > on vm{entry,exit} there's no need to use a synthetic feature bit for
> > it anymore.
> >
> > Remove the bit and instead use a global variable.
> >
> > No functional change intended.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> 
> This is definitely not appropriate for 4.17, but it's a performance
> regression in general, hence my firm and repeated objection to this
> style of patch.

While I don't have any objections in deferring this past 4.17, none of
the modified paths are performance sensitive AFAICT.

> General synthetic bits have existed for several decades longer than
> alternatives.  It has never ever been a rule, or even a recommendation,
> to aggressively purge the non-alternative bits, because it's a provably
> bad thing to do.
> 
> 
> You are attempting a micro-optimisation, that won't produce any
> improvement at all in centuries, while...

Oh, I wasn't attempting any micro-optimizations TBH, just didn't see
the need to keep this as a synthetic feature, and generally consider
better to use a global variable because it's IMO easier to follow.

> > diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> > index a332087604..9e3b9094d3 100644
> > --- a/xen/arch/x86/cpu/amd.c
> > +++ b/xen/arch/x86/cpu/amd.c
> > @@ -49,6 +49,7 @@ boolean_param("allow_unsafe", opt_allow_unsafe);
> >  /* Signal whether the ACPI C1E quirk is required. */
> >  bool __read_mostly amd_acpi_c1e_quirk;
> >  bool __ro_after_init amd_legacy_ssbd;
> > +bool __ro_after_init amd_virt_spec_ctrl;
> 
> ... actually expending .rodata with something 8 times less efficiently
> packed, and ...
> 
> >  
> >  static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
> >  				 unsigned int *hi)
> > diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> > index 822f9ace10..acc2f606ce 100644
> > --- a/xen/arch/x86/cpuid.c
> > +++ b/xen/arch/x86/cpuid.c
> > @@ -3,6 +3,7 @@
> >  #include <xen/param.h>
> >  #include <xen/sched.h>
> >  #include <xen/nospec.h>
> > +#include <asm/amd.h>
> 
> ... (Specific to this instance) making life harder for the people trying
> to make CONFIG_AMD work, and ...

That's indeed a point, albeit I think adding a `#define
amd_virt_spec_ctrl false` won't be the bigger of the problems when
dealing with CONFIG_AMD, and will need to be done for other AMD
specific variables anyway.

> > diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
> > index 4e53056624..0b94af6b86 100644
> > --- a/xen/arch/x86/spec_ctrl.c
> > +++ b/xen/arch/x86/spec_ctrl.c
> > @@ -514,12 +514,12 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
> >             (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
> >              boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
> >              boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
> > -            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) ||
> > +            amd_virt_spec_ctrl ||
> 
> ... breaking apart a single TEST instruction, which not only adds an
> extra conditional merge, but now hits an cold-ish cache line everywhere
> it's used.

Why does performance matter here?  It's an init function that prints
the speculation related settings to the screen, so that's likely to be
many times slower that accessing a cold cache line.

> Count how many synthetic feature bits it will actually take to change
> the per-cpu data size, and realise that, when it will take more than 200
> years at the current rate of accumulation, any believe that this is an
> improvement to be had disappears.
> 
> Yes, it is only a micro regression, but you need a far better
> justification than "there is a gain of 64 bytes per CPU which will be
> non-theoretical in more than 200 years" when traded off vs the actual
> 512 bytes, plus extra code bloat bloat, plus reduced locality of data
> that this "improvement" genuinely costs today.

I wasn't considering any of the above when proposing the change, my
only motivation was that global variables are clearer to use than
synthetic features, and I didn't see a need for a synthetic feature in
this case.  If we agree the above possible performance regressions
are worth it I'm fine keeping it as-is.

Now that I realize it amd_virt_spec_ctrl could even be plain __init.

Thanks, Roger.

