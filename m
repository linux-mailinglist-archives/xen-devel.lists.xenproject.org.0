Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL9ZBqm/fGlVOgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 15:26:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2BBBB97B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 15:26:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217620.1527020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlpS4-0002q3-Ri; Fri, 30 Jan 2026 14:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217620.1527020; Fri, 30 Jan 2026 14:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlpS4-0002ng-Oa; Fri, 30 Jan 2026 14:26:24 +0000
Received: by outflank-mailman (input) for mailman id 1217620;
 Fri, 30 Jan 2026 14:26:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlpS3-0002na-23
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 14:26:23 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5134b5d-fde7-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 15:26:20 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN5PR03MB8043.namprd03.prod.outlook.com (2603:10b6:408:2ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Fri, 30 Jan
 2026 14:26:17 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:26:16 +0000
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
X-Inumbo-ID: a5134b5d-fde7-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Re/fyCKarahq8nlKwHC/r2+q3cKOEOTHSSKu8aIkIdNjnLntWHNxAF3/YWjmWmXHe+aWgr7li/BgHUxz397j7S6qz21/jD9KtvAAe3oa8twNZb0y5fRB4K418Kdp0bGzPH8tkCiZ6rgjVCRdBrIhLSceik0d8K0VLOXVVq1CtiVXun8nWBjmQVSFK4oAcy6UbiewprbhqdY7t+kqKvIjqKPQSV6gGh+yxf+yCIYKb65+YWyj1ydr21SkfzCfZ1IKGllFfF9f2B7lTXKdoJZqROl+8+iL4RvmHf5P/lT49S6so7tqAcMh6DWqpNniGEqOVcboZJ6l1tH91HDtZqdv0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqBZceQU8Si33A1G4vH33efcvvXOMvAWcQqV0kmX25A=;
 b=ZDOMrjuYTmx8wGp0OAVwxQsi60ndFMRWCIQSAwTm9PiJI+kSSv4rcEGeyge9lnZ/nzzKXjQsOr0/iZPCxKAjR/K4NxQRudue/QHKakuOvAAgwPsRVCr4C8YzSRqTpibswaN34ds1JjrKryezyoGQi7fUGZSVWMv28PZEF7Qq0Mfx1rXw4B+6f+JglrowQXsxmho5bUs//3jSiRcAP/k6jo+MAxVRSi3zcYsyjBE8Pz0hYVEUaPodp9cp7giyYo1gYWntjSTtQPcqbeUjxFq2GKOqqnPb9KUY2EpUmcvyQMSCnsb58y5AdulxFNVUGic+qWgJpky6Yggq9T1P2AHzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqBZceQU8Si33A1G4vH33efcvvXOMvAWcQqV0kmX25A=;
 b=xeuV/QLv6xGwgm4b+OSsc+R3ZO5gIcCE+O9pD5LcVLaQi2G/s+i46moMJKRNYx5u6Vn5Uma+bt4Hv8J1NTOHltKIv9tgIw6vkO9oBG+UedAFYxQqWw95gtss0OBWi4UH9al3a0Mo7LvxDRaUOS5xXHpU6BGsViq+j1bFzFdQXkw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 30 Jan 2026 15:26:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: allow ->write_msr() to distinguish origins of
 writes
Message-ID: <aXy_hB_nGaXwTyzQ@Mac.lan>
References: <7987f1fc-5b5e-40c6-866e-ac332097c635@suse.com>
 <aXyBT-HOBxZQHeFY@Mac.lan>
 <3743c709-90bf-4a4f-90b2-04935881436b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3743c709-90bf-4a4f-90b2-04935881436b@suse.com>
X-ClientProxiedBy: MA3P292CA0064.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN5PR03MB8043:EE_
X-MS-Office365-Filtering-Correlation-Id: f3cba892-ff0a-40cd-0108-08de600b86e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnJBOG12VEFKSGtMTkJ2QXhwRjhPSnNQSXRaQ29Dd2EyYS9hWFlUZ3V3RGNJ?=
 =?utf-8?B?V0NZdzBZczNPa3c0bFhPMEZQVUtzUnJzaFRsVjVMMFBPVXFNOGptVXhIcE5t?=
 =?utf-8?B?a3NJdTVHWDlIYklid0orbFpTcEw5Z3NhQ1l3ZDVlUDBNeGVsdURORVgrSnlj?=
 =?utf-8?B?bkwyNmRGTXFoMTN2Wk44dzBlNkxKUHBVSDQvZ3diUUpEWlRMWUVNajVyQWNL?=
 =?utf-8?B?N2t2M282eXo1bWgyNThBby9HaVJLMHNaYmM1MEY1cXNDK1MrcVVONVRrMUVQ?=
 =?utf-8?B?aUVOemZmZzN4bmJLUnNubnlaWHNnQXd5cWVTb2QvYzlsUjhUemNWU1p5cWd6?=
 =?utf-8?B?SDl6eGliWU1LLzM0MldEN3QydTZCYnZkNStyK3l2Z0dRdXdhaXhja2NvTXpz?=
 =?utf-8?B?M0F3ZEZ0WFRUbTZEY0hmN2ZoSy9OWU5ydk9ZVy83ekZrV0l0bW5KSk4zM0wy?=
 =?utf-8?B?UUEwOTJWKzZmRE1Sa2hSVlA1WFVBVDFsU2MyS0xKUkNLdmZYSTFnaGMxemYw?=
 =?utf-8?B?a05nd2tXdEl1aTdxclg2dDF5cmVKdEN6aDlHQ1djTzgrZVNaKzViSEk4UVI1?=
 =?utf-8?B?NVBTNks0dXVQU2x3K09EVVo5K2hURjlYc3hlekgycmRoaktHUC9yT0JVWXlU?=
 =?utf-8?B?VFZoZ1dORDVqaTRVb3ltTVZmQUkzWVAzZzJpNFN6b3QzQm5JenJTTUtQNmw5?=
 =?utf-8?B?ZjdXVkFoL3VzSmVsb0NqS1h5S3NYZi8zZDRqU2xvVTVGaGVYYUZkb0JqNGVk?=
 =?utf-8?B?Y1plN1E4ZU9iRlpQU2RKTXBHVVp3NXJweUNlVk04TUVtUWdGRkpyZGFOUXRG?=
 =?utf-8?B?VGtsY0hEaVhrMVkveDdmWFFmZW5sdmhFcHN2dkg4dEtHLy9ISzB6YWNIL2dh?=
 =?utf-8?B?VXFQa0hCOHoxQUltcjBJcEloMU5PVGNIcUs1Z3BCWUNVZEM5aXdsN1FsT3Y4?=
 =?utf-8?B?ZjBhdEE0dFBvNlVIUE1jZ2xDcm1Mb3ZOUlFOZWQrQVFDcEd2aUtFd3J5TGQx?=
 =?utf-8?B?TUhGOEtTOGZkYnV6M25oaDk0YnhIVTVyczlWZG9CRHFiak9ZdHNocThuZVVz?=
 =?utf-8?B?YTVEUFlQNitOaUpMMzdQNWpDdUFCNVhOQjY2Y0g3bTZLaGROVDBaL1RrMTNO?=
 =?utf-8?B?M2h2QmJIUzJEWk92c2xkV0xoRFlwYVE2bEFPR1lLQnZ0SUtQOXJLcFFSZXp3?=
 =?utf-8?B?YWFLWWJ6Ynk1bFliTSt6YVAxcEVsZldudGh2c2JlMFNZcVpMK3NHVkQ3WmJD?=
 =?utf-8?B?YVFaSUhXbGF0ZUw0NHpzSDRLbnJBR2FTY3U3enpIZFN5MjRlTnhJNVBhYXNl?=
 =?utf-8?B?Mld1Ykh4TDRUWjk5RkNFa01DTVQxNlVmM3VERVZ5RmpZeUxLa1BpbHlhM2Nm?=
 =?utf-8?B?anJzcDNIUzIxQ3Rkd0F1M2ZmcWFGaFBGS2lNV0VPZWR0dWtsMmFqcm9rVTdL?=
 =?utf-8?B?cWZnVXIyQUFrQVYyY3U5cjJZWUdFbVZpOFh6Qm5LSHNhTXNsZmdUSUFUemZL?=
 =?utf-8?B?QjAvTlY4MUQ2RG5BRUdkanNsK0lHdnJTdHZtTS9yZ0kwODRhTCs2dk54UTFv?=
 =?utf-8?B?U0pOTm1HaHV6NmRlRDFVYjNwUk1YeWVjS3B0VlZHNENyTTBNek41ZzhMOXdt?=
 =?utf-8?B?UnRrUmJVdnZnMWdSR0pWWkcwejE3bi9MNklDa0RuVDZuZll2VWhaSjRlOGpC?=
 =?utf-8?B?c0JyMFNOK0VtKzc2NnN1WndZUzJrU1hTWUZVOExWZUlNZFhrOUNsRlltWVdm?=
 =?utf-8?B?NjlFaEYxOVE0MmplWHA2UE43L054a2hjVWtCRGFiWS9Ec0hwSFJzWHphQWov?=
 =?utf-8?B?ZjJPREk4RFdVRnJlQk5MdXByY0RkWUZQenRFSnZrbGhwcXB2TW9MZENTZFJh?=
 =?utf-8?B?Rm5HMk4rZDU4ajUwc082R2tiNzJvYmozMDNYOTNzSGFwL2FmWmcrTlZWaWx4?=
 =?utf-8?B?UHBFSTVQM3VPbXdPRFhFQWlqN0xqV29kVlRaWU44d3Y0VEZSTTdGRnhwT0xV?=
 =?utf-8?B?SkQ2a0piMWhINEJhME9qYytkb09CT0o5S01lSGE4U1YyenhMM2xJOXBuN0d6?=
 =?utf-8?B?a0l3RC9yT0cyajdnS2FhbUhzMDQxSmFOV01tUXhsU1g0Lzl3UmRValNML2d0?=
 =?utf-8?Q?0dyw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnc2M3ZuUm5senhNcEpRc21QUlRvam1LQURtRmtoMXJma3h4ZkFqUHVEZG0w?=
 =?utf-8?B?bDdSR2FQbHNwRkFZWEM2LzZsQUxqRTNjNFJZRTloZk1YeW9CR3BOZ05BdDJI?=
 =?utf-8?B?VENYdXVxR01TbGtFaWhPVER0TEg0NmhtSEd1cDlkOURWUXN2eTZpczhTM3Nh?=
 =?utf-8?B?SW1uZzlVMUsrNnVSV2pTclpqcWZYVDhpNTdjSTVoSHAwQWR6d0s5UlJEKzBH?=
 =?utf-8?B?WGZNZEpZR3VlR2FmL0JIK0JYUk1WSGc3TXBhVTFqdWRzRDJtdW9FUlpMOUw2?=
 =?utf-8?B?Z1FlSVM4eFgzTHNXRzRoRWJrZWxvbnp0bWlNR1MwOG5EVGVWZDV2QTE3T1dF?=
 =?utf-8?B?UEladGhIdzU5Nlh4QnB0aXNtQXdqS3dCVHRnUVUwWTRGbVowM1BJelk2Wkdm?=
 =?utf-8?B?N2lEQXh4dFJ3SDA1em1jKzJvZms1SC9FNGd0MHVtcWQwcW9EKyt5K01LcFNk?=
 =?utf-8?B?TUk4czc1ejVoUmZoc1pnWVdxUjBZV0NkY3RrNXBlTG1JaDExeTg5cURmL21u?=
 =?utf-8?B?SGZXVEx5dEZ1V0lvZWc0Nis3dVErb3MxRlpib1FqSjluL2RUWkxKWDBLYmUz?=
 =?utf-8?B?RHhtbkMvcWt3VWVGQzlob25rSnFwTnhXa0RGNmxnSVFOaW9pemtQeHcyekxD?=
 =?utf-8?B?R0R2RFZMbmFydmNxc0tqNDJueFNWTXR3Q0IyL01VVGx1ZExCVzFMOEtwYzBU?=
 =?utf-8?B?OXVoTndVL05oQWoyTW1pYWY5NVlKSTFDVTZxVklXOGc1OUpSaEk4bmJ5TTRO?=
 =?utf-8?B?RnV1clhwSURnaFg1YWE0blB2UkZmelNSVjNDM2t6ZW9vTzZXL1kvZXk0Nm5y?=
 =?utf-8?B?cE9PbWZOTlFMRW9Lb0hIK3RIcEc3QXdURWJJNXNEM3dUVGdvOHVGdHR5VVA0?=
 =?utf-8?B?ekhiejR3b1hHOUM0Mm1nTURsUEV1Ky9aZFd4VTN5VXRDUFVxa24wMkhUdjdk?=
 =?utf-8?B?THRRMm9wL2NibjVQckRTS0xiSFZ4TnNCWENHb3dUZkdxRUwwV0ZEangzemJP?=
 =?utf-8?B?YzBhVDVIc3BFNnBsTkFRWGlTVkVMT2FVWllNRkVrbFptQjJiL0p1SytzOUM0?=
 =?utf-8?B?V1k3MTgyTnVVSEZBNWhHdmZxaTNjMm9oMk9mTjNSSWZZcnJMUEpiNUJ3NGNz?=
 =?utf-8?B?UFVIRjRDaXpXRy9ReVU4bzBYR2xYaTVlTk9EUFJnanNJUWluZ1dPRlhjTUpz?=
 =?utf-8?B?Um9NL1hzSC9SS3YzdVZXVlg5ZE5CeXptQ29qUWloM2I3ZTFQYjF4RFVCdE5M?=
 =?utf-8?B?SFQ4V012QjMxRGJHYUJQTk5LSmJ5UVM1ZkorQlFuOUhTNDJjaXJNMHF0NjMy?=
 =?utf-8?B?QmNHWElEelIvUjAxZDVHQ1kvK25GOEo0UGs3YzRkeHQyM3R0dHJSeG9ZZVFU?=
 =?utf-8?B?NXZBK25OS05QanA2elM3Q1gzMW5RZlcyL2hwL0JlQ3ZGZ3ZOR0w4akw2MS8r?=
 =?utf-8?B?VmNraEdOVjVCVFZPSUh4cFBpQjRjbkkybWN0UHFROTJsTzF3SFNnOXY1WUNy?=
 =?utf-8?B?NmRuK08vdlZoV2RVVUhxU3RMWmJjWDMxSFRBeVpxM2QyVU5IMWNqa1JFL1ov?=
 =?utf-8?B?dFoxbnFWTmEyclJ0WTdLU2dudWxLSGd1UnRCSzExS0xuWmNkaHJHeHVVWGJE?=
 =?utf-8?B?eHROQ2J0MEtPNkZFSHF4TE9TaEV5VXROcnhiTytKUzFiRXlOV0M4Z3VqZFdI?=
 =?utf-8?B?Z3hCL05Bc3RlZERHTFZDQm5OQ0c3K2NiSUZiSnY3ODhHZ0hTQWRxZTBwc2FQ?=
 =?utf-8?B?ZHU5cEIxMThUUWdUQjRRVWt2UlFvRy9Ia3ZvK3M2OHg1N1V6SUVTUHVyT21t?=
 =?utf-8?B?TDZWSjBWZnYycktFeVdGYXlsWlZhWmVDTUJIcGZMdjFtclNCVEQ0WHRsVkQ0?=
 =?utf-8?B?WFFrSzF1cDc2dXdRRWcrZ1A1SUZQdWo5THRkYjAwVUJGYVFaQjlKQ1lsTUdR?=
 =?utf-8?B?TDNJRitoRkZrKzI1V3EwdjFNOVNGaVlrQjVad0k4RnJPS0dVMTJDSk5KWHpS?=
 =?utf-8?B?bndtMXQrOVlSS0NwQ1V1RTBwd2twaE1OY3RqemVUMUxwZ0VtMEh6Y1ppOFBx?=
 =?utf-8?B?RlBnR2NRdm5ibnZRNEJtYUR4T3REQU1EL25KeVFsd1BHR1dRNzBXblk2NDJC?=
 =?utf-8?B?UlpvSWhRalVKWklKUEhYeVc2KzR1Ym9SSFVwcXc3Qk9RejlFRE50SFMrcGpJ?=
 =?utf-8?B?ZGlFRFFqbXJpU3ExZ0lGeEZrNGJWNUFMTXgvdlFxc2k5NHpTK2R5SGs5VTZ1?=
 =?utf-8?B?dFgyV3ZzMUdnOGMzL0RrMEF1R2ZnRVJZMkRhSHR0ZUluSUJUL3hrUHdZUHJj?=
 =?utf-8?B?ZmlqWGJEbHhITGpXOWFsQnV4Ly95NGYxOXdBelhhUWNzbnllQzFqUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cba892-ff0a-40cd-0108-08de600b86e2
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:26:15.9192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEnWkUwOkGQqycapVJBY5CrytBdxyqZ6EV4NZZhvkzdN0480bfSqgJyQb+oaN7nOr+450Erdk1s6iLFcbh+rTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR03MB8043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,Mac.lan:mid,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7B2BBBB97B
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 03:01:28PM +0100, Jan Beulich wrote:
> On 30.01.2026 11:00, Roger Pau Monné wrote:
> > On Tue, Jan 27, 2026 at 11:21:06AM +0100, Jan Beulich wrote:
> >> Only explicit writes are subject to e.g. the checking of the MSR intercept
> >> bitmap, which extends to VM-event's hvm_monitor_msr(). Indicate, by way of
> >> a new boolean parameter, to the hook functions which variant it is.
> >>
> >> Fixes: 6eb43fcf8a0b ("x86emul: support SWAPGS")
> >> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> ---
> >> Later, in particular for nested, ->read_msr() may need to gain a similar
> >> parameter.
> >>
> >> Prior to nested making use of it, the new parameter is effectively dead
> >> code with VM_EVENT=n. If we accepted Misra rule 2.2, something would
> >> likely need doing about this.
> > 
> > Hm, yes, it propagates into hvm_msr_write_intercept() which then turns
> > into `if ( may_defer && false )` in the VM_EVENT=n.  But then you
> > could say the same about the code inside the if block above for the
> > VM_EVENT=n, it's also effectively unreachable code.
> 
> Unreachable and dead code are different things to Misra, though. It is my
> understanding that we deliberately permit constructs reducing to "if (0)"
> in certain configurations, relying on DCE: There's then no generated code
> for the construct, and hence nothing that cannot be reached. The
> situation is different for a parameter that has no use: Its removal (in
> the specific configuration) wouldn't alter the behavior. Hence the
> parameter and all arguments passed for it are "dead".

Yeah, I think dead is a good definition, the variable is possible
evaluated, but it's value doesn't change the flow of execution in the
VM_EVENT=n case.

> >> @@ -2427,9 +2428,10 @@ static int cf_check hvmemul_read_msr(
> >>  static int cf_check hvmemul_write_msr(
> >>      unsigned int reg,
> >>      uint64_t val,
> >> -    struct x86_emulate_ctxt *ctxt)
> >> +    struct x86_emulate_ctxt *ctxt,
> >> +    bool explicit)
> >>  {
> >> -    int rc = hvm_msr_write_intercept(reg, val, true);
> >> +    int rc = hvm_msr_write_intercept(reg, val, explicit);
> > 
> > I've wondered whether we also want to rename the parameter of
> > hvm_msr_write_intercept() into something different than may_defer.  It
> > feels weird to translate a parameter that denotes an explicit MSR
> > access into one that signals whether it's fine to defer the operation
> > or not.
> 
> I did think the same, just that - considering all use sites - I couldn't
> even come close to thinking of some sensible new name.

Let's leave as-is then.  Since maybe_defer is tied to the monitor
logic it might be helpful to give it that meaning, but I'm having a
hard time coming with a proper way to name it that's not too verbose.
Let's leave as-is for now then.

Thanks, Roger.

