Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA191733ACE
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 22:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550420.859496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAG2t-0000ed-J8; Fri, 16 Jun 2023 20:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550420.859496; Fri, 16 Jun 2023 20:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAG2t-0000c0-GO; Fri, 16 Jun 2023 20:27:47 +0000
Received: by outflank-mailman (input) for mailman id 550420;
 Fri, 16 Jun 2023 20:27:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4sU=CE=citrix.com=prvs=524b4a1dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qAG2s-0000bu-QU
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 20:27:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f5a75ae-0c84-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 22:27:44 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 16:27:41 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5813.namprd03.prod.outlook.com (2603:10b6:510:35::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 20:27:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 20:27:39 +0000
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
X-Inumbo-ID: 3f5a75ae-0c84-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686947264;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6g11X0AZslbwtK9CPy/wsZh5Z8TJdEpwq0tHV27YPI0=;
  b=a66fk2j20vPGL0DkFHW6LDOfYBqwl2YLczKZfqTtefV5d3lWI8aETj41
   g3Ehn5KOfyuLvDCoc15z9ZFdiofnuWfvWs0enn4Pjamjh8iKIZPrOUJT6
   CbQ4097VNwqHkmVl/5cvo6K1cxIVTjmfRhpWTlkIXaK4xIqSifVXhm7NJ
   0=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 115656713
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SlCcIaNQO0q49L/vrR0ylsFynXyQoLVcMsEvi/4bfWQNrUpw1WQDm
 zBOCG6Eb/jYMTfzfNx1Pom18R5Q78Xcn4dnGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5wJmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0r5KI3F/7
 qcxEzI2TDCejMe767SAV/Y506zPLOGzVG8ekldJ6GiBSNwAHtXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vJxujCOpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxH6lBdxNTebQGvhCuXOQ5mEXKRgsdVbhgseLq0/vW4lFE
 hlBksYphe1onKCxdfHmVhuxu2KNpR8bc8BZC/E98gyLxavS7guDB24LCDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcefSINVxAC5fH5qZkviQjCSNliFqO4lNzzFnf7x
 DXihCo0iqgXjMUL/76m5l2BiDWpzrDLUwo06wP/Tm+jqARja+aNfJe04FLW6fJBKoexTVSbu
 nUA3c+E44gmEpWlhCGLBuIXE9mUC+2tNTTdhRtlGcYn/jH0o3q7J9kIvXd5OVtjNdsCdXnxe
 kjPtAhN5ZhVeny3catwZIH3AMMvpUT9KenYujnvRoImSvBMmMWvpUmCuWb4M7jRrXUR
IronPort-HdrOrdr: A9a23:A+X3+apbvxg148MmaJMfPAgaV5oReYIsimQD101hICG9JPbo8P
 xG+85rtiMc6QxwZJhOo7u90cW7K080lqQV3WByB9iftVLdyQ+VxehZhOPfKlvbdhEWndQy6U
 4PScRD4HKbNykdsS5XijPIcerJYbO8gcWVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3A4wK5fWksJhfbKDqaco3kxmn8Z0jXOSXg7mfhOBS?=
 =?us-ascii?q?RMmRSap2IQnqd06VfjtU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ARmfH6w82Dq189iTt4l0QMvGQf/5G4ISjDGEIq7U?=
 =?us-ascii?q?L4eq6Bw1xajfGlg3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,248,1681185600"; 
   d="scan'208";a="115656713"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7Z6fqhqmrGyjsbrAwSdoj/NIF+vta73eD2q1WIrg/eUs5O5qxTqX99u9SIGbxf4gLXm4yhyYNmIx9nl4FdFsqyayNWPJPKxxfdHxEwQO3cA2Dfrnj4XniKOJsZ89TR20eegaYL9TLyl/eNs4mtE2seO4EagZSL9MFrV+xkY45RN2HjQNUJbPIUmdH0OPbVQ46f0P77ybOIyPY0WgkpsMWB9Cr+EzpzY65iamYTQEoU6TkQttlfNxjazjbuNXxtU9N+7IEBSBUSjaekSLUsuzxpwyd43QqSLT3Hh9HWJsEz+XSygLQdaD5ubwR00T7+Y2AcEY1DtILij6DPUMLRl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sE+dnkk0SpkOruea8rP1dHOSYF3FZqhXsSLIckzJ6wA=;
 b=hSe1XoFmGh5qr3iBZX+py+1aqJwzX05meHTPxoGHPir2QRtY4/X6D81rFn/+oR9BrjbDpsPtDqPn407aQn0oQ6bXIGiITI9/1zSVrPnSSHREV7ibHKMNKtNe5b93Lxvki8SQR4PJQRzyaDj8MoW/1KgclUo7LVxz2MFDglvdoRVBXx5bTApxXhJIVU3UQYp+/qscqc6Y37J6a7uHuQ8X44hiOQZAar/2uRahbF98qi++QIdow/kX0GDkX2SBzdfAcNU5dISxofO2Ah45bb7kJNuqEPG0YemSl/Vo2poNiMoE77A6fimAyuKQG2jo99CaQW9vtmLo/jiReJ0CdP4s7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sE+dnkk0SpkOruea8rP1dHOSYF3FZqhXsSLIckzJ6wA=;
 b=iu/yIOQw87s/FU1GQJGPBArXh9IRMEnrWbNz9O3W6LJv+zMx11q6oQy/dKhO2wLumvvQhGH90xkAkdP9gzanFygJ1uun2Yf1zfeTGv9Pf2d8p968WGpdUY0Pw3z/Lub6tdI63gw8ebm8Q61iHLPE9/t9rj3G+25xq7i84yX9iFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <33c8e11f-c561-3dcf-e08f-0ea19b34f89e@citrix.com>
Date: Fri, 16 Jun 2023 21:27:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
In-Reply-To: <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0505.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4066e3-cb8e-4d66-551e-08db6ea82111
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4UN7EQvMlYuN4dBf37AMerj1Ms5Kn2K9u7QMGUaSVHTukC7wi5UzvkRINXAeHil91YY3RbYwOWDVDFuvrGfuLme87wdGUHpccanx6swjxcvOcJJ+ljqM3arcu6eezYP/moIgOlvGqwoT3qf1hqdGGcRxRgDYY+x6Yex23Z5IqU/po8rqiNgWaa1jV8PrCPMjYlS+Byv6tCXHeoTfhJbxmezW2tJYapO0mt3BsLUqIHEMJjaCWzcM9MDzb5rZerLV/dtijkt8ebcyMURxkioXbKC4OwZBv94Dcds4+aCgyk9NYis4EFxz+sjRXjozHYSDLyfg+Qcg9R6+E+oeqvns+AoYaEJ1A3iiDkg4W3Jf+Q7E1hhXvmEuoMP3ilNEjqs7Mxm+QSpCduVuhcxQ/ki5t2slm9UJLJb/Z0bJM1ITZr6su4Rz5pjAREEo61S4w0ZX9dLelEp4hmbAKuuh5v+/ICZYUD4dEp7m6PFPaIArSIIh3L+hg5JTGubwtscwKe7BpZkJg3lGUblWQZtWO2RrfvjOsSWRKGYK4uyYq29fSDxTjnBLuzl/KeIy9u6X4/7wrNQklv/0l8mMhSnvouRYBl/wFdVRdJ4cUwINXFMqEdNChcxLSXu0guUrOjX09CQIM9ajthRRLq6uyxYc1sr2qw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(4744005)(2616005)(2906002)(82960400001)(38100700002)(36756003)(8936002)(8676002)(86362001)(54906003)(5660300002)(31686004)(41300700001)(4326008)(6666004)(66556008)(66476007)(66946007)(6486002)(316002)(186003)(31696002)(478600001)(26005)(53546011)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1V0dG9EdFBqd0NrcjkvZXpUQ2JpaWFac2dpMjkzaG9sYWtvVTJCY2ZxUVJk?=
 =?utf-8?B?TktOWFpjWkROTXk4UzF0U2VSNHE1VjFYSnBETDhUMzlhbkhxMHgyVjB4cGJU?=
 =?utf-8?B?S3RSbjhpdzJOUXVWVmIyckh3WjEzT0lzNVh4WFViWlNRNHdZVFh6cFk4Wjlw?=
 =?utf-8?B?bUlxVjRoWW93NGp1RnFwcjRTQ1NYamN0Zk5hVERDTGxIMExub1QzL1lnTldt?=
 =?utf-8?B?K1k4ckMyUXlGV205SzBhem1VeWtvQk9HNWlhc2x2ZlF1eWVveU04SzM4dy8r?=
 =?utf-8?B?L3hXanZDR2JBVk5hSjVsalZZRmZlUnRSQTBnbWk5S2RaeFNRMk00czZ4WVN3?=
 =?utf-8?B?eVE0czRNZ0VtdjZtQTkvcjJkVlltRUR1TFhhNUJiRE9MdU5VRUpJY0M1TzMw?=
 =?utf-8?B?UGxBendUY05ZZE51WGRaZ0FLaTE1ekVXZVBHWC9MZVdGN1hvZHRPbS96Qmpy?=
 =?utf-8?B?cWNhM0c5aWlZSkExeU9rWDlhbEJiT2dGZ0hFTnE1bTNudVgxamtwS1VWSFd5?=
 =?utf-8?B?UGV1TWFjUnhCMjUrcjI4QUgzaTZLVWoyQWI2Vnl2U3lEaWdvUEFzYTQ0UjdG?=
 =?utf-8?B?Q1pvWG4xNmpaYXovc2VXVURCOVhzVlkyU1E2bzA4U0lJNXNaSURkN3RLT3dq?=
 =?utf-8?B?WGRUdlRocWV3UjhiMlRmMVY2dSszSUJvK1lmMTA2emdHVEx4NWkyWVhMWVhB?=
 =?utf-8?B?S3VLdzlMcEJBNklDNGhZSmhwMlY4YXdpOU4rMncyaFBDZ0lyOG1QVU9IcHNF?=
 =?utf-8?B?S3FYVitKRk1sNG9ROFRyY2trZDNlV01iWUxZMEo5MlBJMWY1WG9PV2xhRFFJ?=
 =?utf-8?B?bFB3RmV0RitGbTBSWkM5Nk1MaHMxNjlPN2lDRFFvckxSZExhR1o1eHJ3MCsr?=
 =?utf-8?B?SkJwUkRCR3B4NE54LzFwQStlOWtXQ2FRZ2c1U2d2YmFvVko2OElOWUdyYWl5?=
 =?utf-8?B?NFdMeEc3d3RFamFGZjdIZk1NWWhLMW8xSk55aXUvT1BRWEc4bDJZOWdkNHNG?=
 =?utf-8?B?QjVOR3d2bEQ3M1FwUEx6eE1aQnhBSHM5eDNScTEyNktaSUg1S3ZITjM5YkZU?=
 =?utf-8?B?a2szQnRBTEVCZWtWNlgxd3pwbEJBSlEyMnlZZTlHYWNmdUZ3NFY2VlpHRXpo?=
 =?utf-8?B?Tjl0ZGNSL1R0OGhCSStNVjF6N0g3UXh5R1pqTEFwc3A0ZlZRYkJHaVMxbGh3?=
 =?utf-8?B?Ny94TGpoc2t3SHBVdnhmcTluWTV3R0V1OTdsNFUwOEFWcjZSSEg5eU90V2g4?=
 =?utf-8?B?Z0plcHRtdThGZWtocVY0Snp2YnRmd1hIdDVNRldreHFobHFjWHN3cC9jMTFR?=
 =?utf-8?B?dlRML0JmaHpuMWVVZmpYMFJJaHFTSEZBWlRrRFBvekp3MTB3OW9VaEVXQmMr?=
 =?utf-8?B?b2ZFb3Z4Q0RUbDlMMnZIaEc5dXVBNFFiQ2F3ZmM5ZXZhTFA2N0gybk1SZlNu?=
 =?utf-8?B?eHVRYXZPSmtHR2MwcWVwM1l4RFFMNjV3QXc5VThiZjRkcHg2VVVBNmVQTlhY?=
 =?utf-8?B?ZUg2RnZ2bGZiTE5VMFh3UkZCOGdaRUZlalVRWHBycGdoTXNwa0NBWUFyeWdr?=
 =?utf-8?B?WHYveUZIMUZZNVFSajdNN1IwbEFXSmVkVnJJN01OZjY5cVE1bHlOeDlDbTRS?=
 =?utf-8?B?TFNoTVlBdk8xS2w5Y2VPUUlaVTdERVAxdVM4T1ZRZ0Z2RmkrWTJ6bjFyTFNh?=
 =?utf-8?B?bUNzWUlabU9kK2thMHlsRWd5cHhCNXFuTnFzS25XR2FQZEJ6VHJoeFpMeGNI?=
 =?utf-8?B?cWwwZngwdUM0WDc5ako3cU44NGphNVhqUlpCL2xoL05yUkNtdkJOM1RQQ0Nw?=
 =?utf-8?B?bFF4NXM1dkdPcjZxOFlKWkNvUGlzY2ZMOHI5UnF6Q1gvZ2g0VEF1ZS9jTkdp?=
 =?utf-8?B?eWhLNTdnZXdlcTFrazIrQmtHN3oybml6dkU3KzkzUmhXVTRVUDBiaTAyNTJ3?=
 =?utf-8?B?Mm1lL2wzNG1ISnJqQ3d5Y21vM3FEYUNPTnkwdU5xeWJLS1dxalZ1eDlsekFT?=
 =?utf-8?B?M3lKZUJUWWJIbFgrNUFjenJyTUlGNFUzbGdHbUpuNmFRTlRweXVUa05zbGEx?=
 =?utf-8?B?N1AxajBCNHpOVmhoWGhSdVM0dDA1V1hlTzNPR3pScFJtZnp1bWtMVVBlWUVy?=
 =?utf-8?B?dWxqZldCRVdDbVpVKzVkOUFPZ0hwbnBDQnBEdGVqdVVLSFVXbHFiRlp1bEZk?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iKSkKR1SKBC7VuW8E7moI57LE8PNSlscal3DS1n799VDho9Q7o+SeDvzXg7BsUKbKXct8PByIFgI2rw3DIZAqzfNqNGAUAIS3FcG1UQF3I3Z6689Li8IW8+OC0KJ9anwcOzmqno92ZX5IQOegnFqJkAPFjk9gpyfywdVty277b6AcModr5ltjPgexSqGlIfa3iY6CK/AjKBe8+wruc5vaBr0Axm5LNU3w+gM98fn/YdPCmLkfcifWpAP3g79hundzImaaArsHnapGGjX8s17C/6Bi7RZqu4KHVOhZhUcN6Hl7asCrTTCFBXwQw7wZ3bjtx34FLN8N6p81WpmzmRMYlMI8q4QktmsEk06yyq0OBjAa8k4avLtchn3J0o9kW38oROZCUU0DcmQiKDu0+c7oG6NjE92pJBA8qy68Buu7VadQzz7MLowCv4YjnSz/W0DY5TFej0wr9Iqdn37zh2PHC1AHvTdWlYAEmUb/kIBpjxdE8M7iXQlfSPW1eDzawp85LVrlgno7YykyW8W3BGwoy8Swxn88cZzHk+R2CQcaYGkoHxP1R4kg+4NsjIPkC5SLhYxEawQnHZ7oWG3hvPqMqpxh/1aIWA9FpQUVWKQdub1cyT4Ol4upat1NJyIBCzH0nCIYdrZUjbk2f8HP41WUWbos87jGOsZ2cShJIYkRl8YFu1E3vE1uQaXqTdKsGrKycaKBzBbBZGv6IwHXOMTkVYnYVAFR1R4IKbCkmVUf1SSGCL1wD+DrQUlu3hZCcw8S8q32IM0CR47GyDoxhfD4kHItn8+NvJUnvnR1lR5Z3bnVWqB27ORJe+ja13dMYBSsBV8BSZF37m6oUwLZlRa6JEg83ydr35NTH2dVcdDW1HgL3a9vDYpj1txQmicVR6hqBAAFOw24N8ZHamdftdwNlTFsU/rWTcfbKj1oFJi7ao=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4066e3-cb8e-4d66-551e-08db6ea82111
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 20:27:39.3887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTg7CobHVqb2yckO/MOrMXK2y3F7tSt7GRts4qJUvswd6uxAKuY2bPBBkjeJwINzyYHKrFaLqv2iVGAGznIsGg//stkJMqp0cS6szgsJa4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5813

On 16/06/2023 6:48 pm, Shawn Anastasio wrote:
> diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
> new file mode 100644
> index 0000000000..0b289c713a
> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/head.S
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +.section .text.header, "ax", %progbits
> +
> +ENTRY(start)
> +    /*
> +     * Depending on how we were booted, the CPU could be running in either
> +     * Little Endian or Big Endian mode. The following trampoline from Linux
> +     * cleverly uses an instruction that encodes to a NOP if the CPU's
> +     * endianness matches the assumption of the assembler (LE, in our case)
> +     * or a branch to code that performs the endian switch in the other case.
> +     */

Sorry, I also meant to ask.  How prevalent is Big Endian in practice in
the Power world?

It's another area (like 4k pages) where I expect there to be plenty of
fun to be had with the codebase.

~Andrew

