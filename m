Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C74D7CF236
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 10:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618976.963370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOC2-0008HO-KI; Thu, 19 Oct 2023 08:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618976.963370; Thu, 19 Oct 2023 08:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOC2-0008FJ-HT; Thu, 19 Oct 2023 08:15:46 +0000
Received: by outflank-mailman (input) for mailman id 618976;
 Thu, 19 Oct 2023 08:15:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zn2w=GB=citrix.com=prvs=649eed31f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qtOC1-0008FD-LR
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 08:15:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0c96220-6e57-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 10:15:42 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Oct 2023 04:15:33 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH3PR03MB7481.namprd03.prod.outlook.com (2603:10b6:610:19a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 08:15:27 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 08:15:27 +0000
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
X-Inumbo-ID: b0c96220-6e57-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697703342;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9A/FDpwCBRXR4SYaIbUSDk+/wUUKA4XFTt15ytapKBU=;
  b=AHbYQVbzEKx8hsVtG3TDSfVJQZyr3qMT0zc5jOhtLzZ87y2T0btM3UHX
   Jj4YAC0g6cfMuFCBerCdBNx8GgNYIOb0ecLxLiK4MZwGlbb/mjiOnV+PS
   mfdnmIOtx0kT+BQ/foj9kbsjLpoFwXDTtxDNX0nFZjzmXlMxuAfmhaIMI
   I=;
X-CSE-ConnectionGUID: 9qfAUeBQTWiOrtZsAaFEUg==
X-CSE-MsgGUID: B54AY5OvRDWH5EZsorEoeA==
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 125276395
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:4YgE4KOOaoanflvvrR1hlsFynXyQoLVcMsEvi/4bfWQNrUor1j0Gz
 2oeWTvXO6vZMWKkfIwladm38kgOsJXXzIJhSQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42pA5wxmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rduD0hz+
 NYhFA8MSQqftfmfyZyWd+Y506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCKpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyjx3LCRxnKmMG4UPJflqtdb3XqN/EAsKEA7Z0C8u9S+h2frDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O8037hucjJXd5QmxD3IBCDVGbbQOt8IoRDpsy
 l6AmfvoAyBitPueTnf13qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8aIYsbdHDjxx
 3WPs3I4jrBK1coTjfzjpBbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulzURhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:FD8A36pG7C2KW63RD9UJfCQaV5pIeYIsimQD101hICG9E/b5qy
 nKpp8mPHDP5Qr5NEtLpTniAsi9qA3nmqKdiLN5VYtKNzOLhILHFu9f0bc=
X-Talos-CUID: =?us-ascii?q?9a23=3AcZL7Cmpgwu4sfdee1TFXHNzmUZE8fFTgwV3pH3C?=
 =?us-ascii?q?5Lnx1eqa8QHG9xawxxg=3D=3D?=
X-Talos-MUID: 9a23:ptKppQbNWWC5RuBTnWKwrQA/E9lSz5uOVW0/ipIcls6JHHkl
X-IronPort-AV: E=Sophos;i="6.03,236,1694750400"; 
   d="scan'208";a="125276395"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZznVT4fLJ20z/K2A6R7omFadBXUPzawXBa6Zshhza4yQt2YpqP/ubPu7wqS2Lx52zLfRN/EeLpmCI9upsmfK20rmm6BgjzUSFB5sGimifb7Xt0Y2FEKJ3AaaYqjFfYDJSpNhgDmfpFfSgU+cRyayBK39WtWoImMFB0WGr5c29WnvqXSmJ18ITxWeVpinETYIycuRHkzLDv4WcGUG0bECCE0xSztk9HceWqDBbVp03D6+Iu+ETrq88RBQW5HGjuiKWBKG4QU+4JxITVIoiQrrJ9eZ6/X6gSax8vEn2t8wrbOgCbBOyfPqZuFFtT5sHOVV8/qito4hloQWpnoz+USC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jvos5fguPvWUro2R8PFeK+E4zfH73B+XhM/AMdCEFiM=;
 b=cmnmxfN1+EKC3PK2c6S44JHKP7ujJUDbT9NstNH9JucvAe3FdxXegSplow2DAZXvJOzKKlk8hJTfD2JPVE8MDMV+iJnF/zVI2QYRoNCustl5riJw+x8XjhRki2VL8PyRLhS25SOT4LLaoaHx0E8V9+01m2VMxJDPhpupJpMwJXNQ8b1813V+aOHGnB7vXntewXiaUaRTe+6Ff7D0bvTc2RCDj8WWq946YYRJkUeNkIpe3vW87OtN/UwBuclNHoJ1XQNBu1Al0O4Z6Gds5TiUGwLgMlncj9CBvJb5CoflaMal4UNtVWN9EQKuydhDccRqGwjL8QO92h2NRQHOMhTYjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jvos5fguPvWUro2R8PFeK+E4zfH73B+XhM/AMdCEFiM=;
 b=MUw0ofBnmGrqE2vyPCruE/yHt5YkKtIEEgswZctMz52KJsThXBOJzyoeaMN4UzMUM4aQj6lADpzz8RHpXck9153Mq2RAebHq1Q498yUrJZOyViBuo9jbsA8uUiEQj8MqKMGFS3cVtsb3ezwgsICKU1R7+/d6iNmsC2AM0S3d/uQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 19 Oct 2023 10:15:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.18 v2] iommu/vt-d: fix SAGAW capability parsing
Message-ID: <ZTDlm_msZrFlhubr@macbook>
References: <20231018160733.24655-1-roger.pau@citrix.com>
 <709ade00-9112-2866-4d2b-3bb718b13b46@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <709ade00-9112-2866-4d2b-3bb718b13b46@suse.com>
X-ClientProxiedBy: MR1P264CA0106.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH3PR03MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: db31dd48-34c5-4d8c-58e2-08dbd07b8d01
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/pKpb8CTcNTR31JitnM1VghlrjoRp3Sk5CIQwFQHp0M4crIJa+Wa8uemaTWxOEOHVyTlM9CRL/ZSqf91R3vqJhqwA/by/Et/hdOlHpfl6XB1ZrHMSnmVThn0kK2LPNj2kRV19HNSFa9oKbNPC3Fj27Zl/aqFOG4CO2JARUbWcqarHnTwq88kNgjKDnUM7ZnAScpsN1Qtns1lA3sUlaDwMZDR56u4zZdj1j5yTw5Pou9ZfMXYsiINix7bWBjQdUOC8MWwzZRPlyaD5aSGhcWQeUpXlnbVh4LIggzlxdP00yl2YQwFIsLqM0HQ5MIY69GnBUh6HcM7iTATl6QILzznP2gbhQuVtUeskYuhrI6VYbBw83x2Vj1rn8btE1XJfHcvn3bT9G/Pu9abbCE/Fz20yVzax8X8UVbLBUsj6Q0LpuRe4ymTjPqT9RqXai6VHVODE8PBe+7VW4uGyo0kmIgAPF+65yrX28gJOY2ojfuKjSrromaHikYBKphLDErgugVObsKFzdx8SwSVCgiyKtEve7Z/nnJEduLfmjRzg/4/EfeoY0wz6oDq4eaxGDb7AHK6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(2906002)(6666004)(54906003)(66946007)(66476007)(66556008)(316002)(478600001)(8936002)(6916009)(85182001)(6486002)(8676002)(41300700001)(4326008)(86362001)(5660300002)(6506007)(38100700002)(53546011)(9686003)(83380400001)(26005)(6512007)(82960400001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGJ1dVlPMzBvRDUzV0xKNjRVSFBkY1FQSkx1YW5FMW1HK0I2dmVZYlY0Nlpl?=
 =?utf-8?B?REZNSDYyZ0xhNlhvaE5oZ1BTUEp1TTJ2Wm10MGVLME8vblBxVktvdmFBUVJ2?=
 =?utf-8?B?SjBBam5QVTlIZmdXeTluNG90ZWpTaVpRSG94U3IzVVRSamZCREh0KytpcmdI?=
 =?utf-8?B?R0xOdTJBSDVFMFQ4eWJXR283RFR6T1dsd3JaVWJaOUxVUU9Vak95WGdKY00v?=
 =?utf-8?B?MTM3cGVncFpEd3VqcG9va2lMei85YTBidCtUUkVNajJEL0Y5allScG95TGpI?=
 =?utf-8?B?bTk1bENGcEZFMC9LUmdvMzJCczZEY1FsNXROZHNPUTFQSWFma3dBc3YvbTk2?=
 =?utf-8?B?SndEOE16ejRpTDlYRHk2bnRwNjJuSEJ4YlJJWFlXdks2a2xXKzF5TVpYUEp4?=
 =?utf-8?B?WG4rVmVvNGh2cTVLUzhOTWNveVliMzhBQjk0U2R6dGpRTGdoVUZKRFhKRTFx?=
 =?utf-8?B?dTRYVy9HQWJXYmRvM1ArWVQ2WDlST3MrMHJxNFYwYXRBZEVIQUI4a3dxRkhZ?=
 =?utf-8?B?VzZTb3B0L09BMEJ6RGVrTWhDbWV1em1XUGM1ZnFRbWdla2dOMlU4WFdIazdW?=
 =?utf-8?B?cjhCK0NiRVhGWndQM2ZuNVVGMjZDSVJZeDJNTlQ0Y0lic0ZwMmZIN2VYNHd6?=
 =?utf-8?B?ODJ1ZkhvYjJoNGt5MVlqSFE4KzIrbDhGOTF2WGxuQzgrSEcyblNwOStIQUtL?=
 =?utf-8?B?ZmZEUFYxeXVoRlVqcENMQXBtWmR0TjRpbGFIa3VyWmZqMFowaXRjempzdTJ5?=
 =?utf-8?B?azRTWThjNVAyMkNWamw0NUh6NjVSUE11ZTZuYldWdmwvbGZzZlVmejFndmlZ?=
 =?utf-8?B?NWoxNUVXZVJOaVRvT21yRXZDOHBZa1pCUmx5OTlTbkIrdnNwOWVKMW5icDgx?=
 =?utf-8?B?R1FoNThCVzRiS05yMDBQbVdDdHpPNmEwY1l6aTNGMktUM2F3OVM5N0Vwa0VQ?=
 =?utf-8?B?SlMxRHdMK3NmTStjMUV0T1A3dkdjNWZVVTNRN3RiK1RpOEREZ3U3d0FCVTBl?=
 =?utf-8?B?bERVa1RNSytQOTMrNTNNUlNXaEdkNkRPNE5VemFvNGlLUzlaalZTa012RE9G?=
 =?utf-8?B?NkVTQ0JHTFdwQVdIUm0vZGZkUlZtV0NDMC9ZOTZlMVdBUml6aldzL0l3V2V5?=
 =?utf-8?B?T0orWjEwMlZ6SmFJRWRyUFZCKzJsTHVFNFZQRXJDNnpIcHphNFVHL0hGWUFq?=
 =?utf-8?B?ZUY2U0VodnhRT21nY1cwbW9GV3BRWlNyWTZ4ZnViTjR6WTdlQ05OaERuNzNs?=
 =?utf-8?B?RjVGOUpDNWp5aTNzV1ZLQ3V4V25DMlRtR2ljM2liUkJhaUE1SmxSUFJVMnk1?=
 =?utf-8?B?Yk5aL3RxMnkyOE84UldQNXdLZytQSzl3M0dpWEZsV2JxdFR3ZHowejZ0S052?=
 =?utf-8?B?SVZkY3ROa1dsdjlBQllCTFhSemNzSExOUExFZk0xWXpqN1RENHR3dWpFdWRR?=
 =?utf-8?B?d1lHaFNTbVNJZWF4U3BNbUJESWdxYi9hSnZ4NjhDMGd1UWYzVUJnK0IwSzFz?=
 =?utf-8?B?c2RPWjNDaExRcnR6NkFSdjdKc0tEeVpKRFYyQlpLd3RDaFpHMVJWL3JtN2kz?=
 =?utf-8?B?NGRkeGdsQmVIeVZWbUM3TktuOUJDM0ZXV29ML3pvdTQ2STcvc3NqcTRxb3dL?=
 =?utf-8?B?VG5ZK3VZUlU1UUlWanlsdDEzM1hnWnp4L2JvQkgwRGVLMXAxZnQ5VjR1ekxy?=
 =?utf-8?B?TlFEVGVhMWpRRWtLSUw1TnNqaXhMOHhxWDVRNWpSMDdwcVA3NEFFTlh6K28w?=
 =?utf-8?B?N2g3cThOL29CZU5LK01nTkprL0xVd2hVcWEyN2JBKzk5U2o0SHVhbGRWa0dz?=
 =?utf-8?B?YlZSQUFTU0V4MVY0aVZDNTFsRlZHVWJ3Szl3NU4xcHZCK25Qc1UvSGd3NWl5?=
 =?utf-8?B?T2gzeXo5ZUlXQ1NXeDhBUGZENDdiRjEzNFNOZ3UxTzVRYnF4Z2N1bmxFYXBH?=
 =?utf-8?B?QVdGSEZRVlZVQXJ3cFEvM2N1VVJYdm9SYWQ5WTBuMlR3M1RSWndJYkt5SU5q?=
 =?utf-8?B?VlNqWmxCNit1d2JyZm9TUExiei9GZ013YVNQTGhzc2ZKZ0dmNU0xdThLK2JS?=
 =?utf-8?B?OHNma3pjYlErQ2syNVZZMytPQzNacm9GQU13cjBUbXFTZUZHVTMwT2YvU0FS?=
 =?utf-8?Q?/4fLhuXCKOqckczUcroCxKBAH?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hkMD7olAgm5F/QyyM6s5husQrDi51S3dNmEnsclAk9oioRWxnDmQ5Ulxxio83zmbjg9haKtNwcE5H+U1dfYXFB/qB4C6jv+GAXRwFiit8n97pJiqoA6Og1iAxUU/2kLYYGQ0XxWP1Dv0Kk+/qvYEfpwE4N9immfGhOxpJkV8GGj2ujZqwMR3LLvWCvrrfRpVPPQ5xUPsR7wFmWdHBEiCq+0kgC+aP/HUb+LNinkXiyqofLTRGQ7NxKBQNbGMOGAO/mWxJboZFWCzJu3wNhvqcxgyiXeiOnjeapU2KNDy2ABe4IuvkiylLkGitC+cgylg5P12nTpwBlvDXYXX3ts0Q9sCnyMaKCrpBSwO8bvNqRYhWNfc0uwMNvsofyR+QxuwLFwEr/lXVG4Z7uGTLdq2OIle8DQ4shwbEEwMXqU4RokMPmSA4isZ0A93rbewqhKS8hKwPwkrTJdQwdmdJJqA6vdE/h+AMdBAgsC94Df9XsTvxbZTkJvwVOyqdkvoIlaLNcvQDeOT8SXHak8Hpqf8c1t7/DrbpBfrVaJveO2n3+KLeMrDGqhsZbuTCvyFBW3yBSYtO1ZzSeX2jn93igBKjZTqgcwJNVawCj+nFEZgCs3td1csYFHiCI3Z4wOW8vqrjKwGG5RNcHN/meGJnV0sWEmi+scHonHZWC+P6zgJq83uxrZHxpcKUDkS1PafYcRhS/dLALxPmSZ3MB4Ram1D5/3aN131PztOQoO9ckX1c/Lg0Mxm5KnFD6Zvg2HKaEPb2PTGRppVsJ6MOL7eujQpBzhGbVgAUO8+2UhZIRv/5/EIC6fYTUBBl5KE+ygVo185idOxEr24vKcQNgrfEP00XxK9zjirMqiDLxVH+C3HxOQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db31dd48-34c5-4d8c-58e2-08dbd07b8d01
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 08:15:27.0975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvsJPO0+XMmA7lxLi/7OrrSjzMlUzAr2G+inKIw16zFXUZ9tjaDzlZcQSbo5CjlzaQIR/7FQWaNP5MMNGpFifw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7481

On Thu, Oct 19, 2023 at 09:41:41AM +0200, Jan Beulich wrote:
> On 18.10.2023 18:07, Roger Pau Monne wrote:
> > SAGAW is a bitmap field, with bits 1, 2 and 3 signaling support for 3, 4 and 5
> > level page tables respectively.  According to the Intel VT-d specification, an
> > IOMMU can report multiple SAGAW bits being set.
> > 
> > Commit 859d11b27912 claims to replace the open-coded find_first_set_bit(), but
> > it's actually replacing an open coded implementation to find the last set bit.
> > The change forces the used AGAW to the lowest supported by the IOMMU instead of
> > the highest one between 1 and 2.
> > 
> > Restore the previous SAGAW parsing by using fls() instead of
> > find_first_set_bit(), in order to get the highest (supported) AGAW to be used.
> > 
> > However there's a caveat related to the value the AW context entry field must
> > be set to when using passthrough mode:
> > 
> > "When the Translation-type (TT) field indicates pass-through processing (10b),
> > this field must be programmed to indicate the largest AGAW value supported by
> > hardware." [0]
> > 
> > Newer Intel IOMMU implementations support 5 level page tables for the IOMMU,
> > and signal such support in SAGAW bit 3.
> > 
> > Enabling 5 level paging support (AGAW 3) at this point in the release is too
> > risky, so instead put a bodge to unconditionally disable passthough mode if
> > SAGAW has any bits greater than 2 set.  Ignore bit 0, it's reserved in the
> > specification but unlikely to have any meaning in the future.
> 
> May be worth mentioning that in earlier versions this indicated 2-level
> paging support.

Oh, that's not even present in my copy of the spec from 2016.  I guess
it was removed very, very long time ago?

> > --- a/xen/drivers/passthrough/vtd/iommu.c
> > +++ b/xen/drivers/passthrough/vtd/iommu.c
> > @@ -1327,15 +1327,24 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
> >  
> >      /* Calculate number of pagetable levels: 3 or 4. */
> >      sagaw = cap_sagaw(iommu->cap);
> > -    if ( sagaw & 6 )
> > -        agaw = find_first_set_bit(sagaw & 6);
> > -    if ( !agaw )
> > +    agaw = fls(sagaw & 6) - 1;
> > +    if ( agaw == -1 )
> 
> Would you mind making this "< 0" or even "<= 0"? The latter in particular
> would already cover the likely future change of dropping the masking by 6.

My plan wasn't to drop the masking, but use 0xe if we support AGAW 3.
I'm fine with using < or <= if you think it's more robust.

> >      {
> >          printk(XENLOG_ERR VTDPREFIX "IOMMU: unsupported sagaw %x\n", sagaw);
> >          print_iommu_regs(drhd);
> >          rc = -ENODEV;
> >          goto free;
> >      }
> > +    if ( sagaw >> 3 )
> > +    {
> > +        printk_once(XENLOG_WARNING VTDPREFIX
> > +                    "IOMMU: unhandled bits set in sagaw (%#x)%s\n",
> 
> I think IOMMU: is redundant with VTDPREFIX (or alternatively iommu->index
> would also want logging). Also note that VTDPREFIX (bogusly) has no
> trailing space. (I realize both apply to the other log message in context
> as well, but still. I'd be inclined to adjust that at the same time,
> including switching to %#x as you have it in the new log message.)

Oh, I didn't realize VTDPREFIX had no trailing space.

Since it's a printk_once(), not sure iommu->index is really useful
here, as we would report just one IOMMU has having an unhandled SAGAW.
IMO if we switch to printing iommu->index we must also use a plain
printk.  But I don't see a lot of benefit in printing this for likely
each IOMMU on the system, and hence I would rather use printk_once()
and not print the index.

Feel free to drop the IOMMU prefix, but I'm not sure what to do with
VTDPREFIX and the missing trialing space, as some users of VTDPREFIX
already account for such missing space.

> > +                    sagaw,
> > +                    iommu_hwdom_passthrough ? " disabling passthrough" : "" );
> 
> May want a leading comma (or some other separator) in the string.
> 
> > +        if ( iommu_hwdom_passthrough )
> > +            iommu_hwdom_passthrough = false;
> 
> No real need for if() here.

Not really, but also no need for a write to iommu_hwdom_passthrough
every time an IOMMU is initialized if the condition is removed.

> I'd be happy to adjust any of the mentioned items while committing, but
> of course I would first need to know which ones you agree with. Since all
> of them are cosmetic, either way
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Let me know what you think re the log message.

Thanks, Roger.

