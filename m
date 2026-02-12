Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEQ3E9PnjWkm8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA7A12E79C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229153.1535173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxg-0003rh-Uw; Thu, 12 Feb 2026 14:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229153.1535173; Thu, 12 Feb 2026 14:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxg-0003of-QT; Thu, 12 Feb 2026 14:46:32 +0000
Received: by outflank-mailman (input) for mailman id 1229153;
 Thu, 12 Feb 2026 14:46:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hp9h=AQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqXxf-0003LH-Vk
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:46:31 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e482e60-0821-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 15:46:31 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH5PR03MB7838.namprd03.prod.outlook.com (2603:10b6:610:216::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 14:46:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Thu, 12 Feb 2026
 14:46:29 +0000
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
X-Inumbo-ID: 9e482e60-0821-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDEt8Nkys8WGkSI+raz67/GydavdObuct+rVESTwMqv9FQIP4bDiBXp17kc3Vpa2q0gQpo+g9V5OYi7dsnBmhn0JUi4E9Cqc0uAdw2WrbAEXK0xavr0PHlD5vVLPtOTMtfPu8QSExF7TrV/lTk7w9ifbvps1ssKELv5uayywsbTE1RZ1kf0mS/7las+sm5xiQU90Vb3H8idUmeP+U6U+suzUZZEHTS/dJjoD0M7d+zSifeiW7rFVPVeprFcfR6r4Oc+v27KCnvZ8acWal33Qx3xTQZrJNC1BKUr24ALrq0AkrAzX4n3BIiwIfKFNmnbMK/m4AkJNsp9Fn4FYJJaZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Neh6QaVEtW9q3mlfrOk5GxOs2RNXIp81nmsab9QjLs=;
 b=eqYtf+vbxHd4cnxYgatZZsALnR6LjA92tnj5JFnyjXBPV3JPbS+hWcs9tuiRciTjGVK1hdsnJYk9d0DsTZpGbmA6+R4Rf0LaGHXa3zVH6ufqA4XSC1i1x2jRetp/GpPhixcfMw4Um06eYIy9tRhQxBOyfcLHeRTglkpm8swHRBjshurTQC8GCkKMEwgxxNyxj0ryygOJP24X4sU7AmrfZ1umpO9hvV0Somtpjk1Nd7/fwQj5Xy+KaXrECiFqDGh/pqYbQ3bko+1Dm1usH2iktEi6jdJhfxGWsnpn0wSOH+idwxvlxpqvQ22r0JcAtMRfggT9znIpX5lukTe+muCeMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Neh6QaVEtW9q3mlfrOk5GxOs2RNXIp81nmsab9QjLs=;
 b=iHAuGoPwCLPoXenWgigi2WM2oaF3g6eYhXNwdMh+/BpNY/fsY3EgKIl11bEqJv74H7jC1P/OWnNwPTjQYiJ0MeC/QVWRfkRaht8cuvAAcl0S74nciVPc641cyfvckhmOTkGEmqWdw3KzX8fDRs4S9swzmir80ZSaQ+YjPNFHiec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 2/5] xen/tools: remove usages of `stat -c` in check-endbr.sh
Date: Thu, 12 Feb 2026 15:46:15 +0100
Message-ID: <20260212144618.43200-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260212144618.43200-1-roger.pau@citrix.com>
References: <20260212144618.43200-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0064.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH5PR03MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: f1db19b6-8a8d-493f-1122-08de6a45818a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjAwRk4yTFptWnBXTmVHY0RrUWU0aDkvcFk0Q2RtMHJ0a2F2Wk1saU56Z2sv?=
 =?utf-8?B?WFhYZmVNaHBMTWwrWW1EQTVpWnJJNGlCb1Rya2oyTGtKcnJNd1pqZDdFV1hx?=
 =?utf-8?B?b2h2ZDdsSnBkUkJuZVhxN1JjNzhTTVZSUGN6cnRTejNtNmY3M21kbmJjc1Ri?=
 =?utf-8?B?bW5JbGxhVnVQYXRyRU1MT3lWMEJxck9wSU0xL3NzOEdaY2JORUcyY20wOUNk?=
 =?utf-8?B?V2lic1FmQXY4UWxsczBsUzVTZVFRemtLaGlkVktFNUorUjVWR3pKVWptS0xv?=
 =?utf-8?B?RWlJWDk2a01rcTFHWnRCWTI4Mm5HUWZYd1Z4Z0M5RjdTdHBaZ2dUWW56OWZM?=
 =?utf-8?B?MzhJWXk5ZzNienJoQkRsay9IcHVxZ2hMcEUzMlgyUjhRNHB0ZkJycmQrZFln?=
 =?utf-8?B?QWRob0R5b2ZucFlwU3ROSlpDbGFzRVBGQkxvVEYwT2prOGk1TGM2czRSM3dq?=
 =?utf-8?B?VHhKZ05WMVhNSk9MS05PMW9YbjBFZWVKNlpheUdsQUR2U1NCZTBzUWtRL2lw?=
 =?utf-8?B?VmllMDY0RjlQWVUyMnZZaEVqdjNFZk1JV3M0UUMrMmQvNEx0OVJ4UVRnMTZi?=
 =?utf-8?B?dUhKYVY2L2ZvYURsU1FneDgyR3NkbFhlUSsxZTE1MVhoanFTNlFXRmRvcGRj?=
 =?utf-8?B?RkxrMytnM1hKaER0b0xJL3IxUXV0NXB0WVFac1M3UTVHUnBwZmpFUmdCaHha?=
 =?utf-8?B?VmVEVDZ6T1JVQzhieERlQ0xlNTFiTUlSY0R5TllVVUpDTG1GN1F4bmF6WUpy?=
 =?utf-8?B?dEp1MmdFYjNYOGVIdkV5TkZhcXliZWNGV2JzZkNiUzdldmtpSjltTzBMdnZk?=
 =?utf-8?B?TVpuYzg3MnNUQXlxKzlFUWN2NjB2ZGdDOXRrbDdzOWcrTVlyZ2hYWXJ5eDVo?=
 =?utf-8?B?N0owM2huTjljSTFuUFJ1M0RtVmRnYTMyWStFaERnaUpHWHBwc29EMjNQV29a?=
 =?utf-8?B?VzRNWXR1Vk02dC9jcEtVeHpsd1Ixc1NjdlY1RDJnN0FiY0cyN0RuREpYcnN0?=
 =?utf-8?B?MjkyQTIvTUtac01LSXl4WE9IQkkzdExZRXhqeDQ1aTNJZENMM1lVZ3VKS1Jz?=
 =?utf-8?B?S0VGNFhsWTFhWWVVeVdjM2xqTTFQd2FFTkZ2eG9IR1BkOC9tMmRad2duL3Bj?=
 =?utf-8?B?UGxNbmRBUjQwUlMxY3VxRE4rRU9LWjdoK1dXK0xhc0xLdUxCcXpQdFBMaXcx?=
 =?utf-8?B?YkFoeGlWT0tCU24vQ2NWV1g5YVl3ajVKVEJreDdid2dvUk1NbkFOSzNxQ2NJ?=
 =?utf-8?B?YURTQjdDSzArWUlWRzZDSDhkY2JCQ25lUklJMmJHVHFiaVlCc3VWVFc4R0pY?=
 =?utf-8?B?SjRIbXc5RVZ6aFk1RyszNFcwUStiaFFPRUJqTWxvR2hHY3dIK2ZDWEpLTDE0?=
 =?utf-8?B?SnU0d1c3QzBSQ1Jibk1IaHkzeUo1U3dHS0tORzlMdXVETWF6bTk1OEZheGxt?=
 =?utf-8?B?Mi9YVm0ySlVWZUNIejJVNks2TmpnME05T0xpQ1FoQ3JmYTc5dXZGdXQ5VHEr?=
 =?utf-8?B?cWEydEVROW1wb21LQ1VQWmdHWkZWb2lQSklJckxMaVZ2d0lxdWIzazVMUE9l?=
 =?utf-8?B?THhhYTNkdkJuVVUySUhZTzdJRmhjbFNOaXpyU1NOMHcwSWtDdEZWdnhIMmJR?=
 =?utf-8?B?dHcrYi9ZQ2F3amdqMndhYVloaHZPbXdqN0ZEM3FXQUI5eU1KbzNDRmpwRmJE?=
 =?utf-8?B?SmE1YmRBanJLMmkwZXhCZG9VdjAyZWM4S3puTmJxbWViUU1ySncrZGt5Yml5?=
 =?utf-8?B?dHNoc085bXdtcVo3SjY3bzh5K0IrejlDMW01a0h3WjFjeVFxTUs4VE01K245?=
 =?utf-8?B?Z1k0UlRZaTBDTlFranFKVk9mTHdiZUdhdG1sTkp0V2dXc0xYYkdPcjg1R0hK?=
 =?utf-8?B?THlKcXl6VHU0QnpvY0Q4KzFHWWpBc21oZllSTnVoRENkR1dFcFc2d2R1Z08z?=
 =?utf-8?B?L1dUWS9xYm14elN3MkJCQ1lWUXNEL0VyUUc4bEpKelh5U0s4ZlFiYi9reUV4?=
 =?utf-8?B?OEI4bGdUZytDZFlOYnd4Y1hxSnp3MTFUWXZJK3RxYVVkWXR3dlNhRVJMVW1Z?=
 =?utf-8?B?b1pwZ0laZDZPMXRPUVlHMExYZ0Q1RjBsQ3kxdU8weGZZQ2ZqZHRYRmMvVmYy?=
 =?utf-8?Q?GHPs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjloTHV1QXM2MCticThkK2k4Q0JqbEdKa3dTbjM2aWt6REtDR0EyNEFNUHd4?=
 =?utf-8?B?eThVMjExSSt5TXRBUVZhbGY5OWxlR1AzNy9rRDFHZzVSd0hSQXdlTHRVVXlx?=
 =?utf-8?B?ZkdXVkttL1dQUGVhRTVWbWc1MkVzQzNjMHhtT2NVTXlVWnVaWG5ldjZ3QTRY?=
 =?utf-8?B?YWMvOEhEWDJhOElBVmZUUjhKdDQrTlBVYWRhR3VLMDROT0xTTDVkMGJ5dEkw?=
 =?utf-8?B?R25YRUlJcTNySEdNTVBTNGhjYUF6OVhhQW04OUhQd0VrZ1lGcU56cTlCdGhw?=
 =?utf-8?B?dWZPTVMxTGpVejBaYVZGdkQza1N4NCtQVHZURERPN2xIbzJRNmEwWHhlbGlG?=
 =?utf-8?B?c3hZZXBRNThmMWM0K0ZWdTlXWUdNeGN5Yk1KRHFFamYzN2xmLy82QWw4S1Jm?=
 =?utf-8?B?d1N0NzhCUWhub3RVUFg0V3FUbnFFRU9PVVp3bzFyU3F0TnI4ZDRwUlRkSU9i?=
 =?utf-8?B?THhSeDV3U1FOR1kzWGcxQ0F0YmJVZUpFZG12QzRiSmxrNUo5T2M0ZEpaTXYw?=
 =?utf-8?B?SWM5K0xUbUZCMDh4RmZJYVNReVFwSngzdEJUZG42ZWo0KzBQN2hYVlRjZzV3?=
 =?utf-8?B?dHFpTWk2NTVQYTgySVAzM0E0L3pWakszcmZ1T0pTWXovc2sraWNGWnJ0dVlK?=
 =?utf-8?B?LzZONUZMRnZEMkZVYnlMVXFSVW0zQ1JKUlE5VFhzdUVicVZicTAyRjFwYTY1?=
 =?utf-8?B?R3lReFoxMHlvSnBsQ2IwTmx3UkJncFZoU0w3T3EvWUg1eUpiTGE1WmVYYXJz?=
 =?utf-8?B?YmhSblljVE95TGNjeFRMRWVCTVNQempCM0hkcFFVajlyRTJ1NEtZU0MvblRk?=
 =?utf-8?B?Wm14OEpxUnVweGVaSUhmNmdIR2lhYmJEbGZMTVFoSm8wWDdaM0FxWWZncDcy?=
 =?utf-8?B?MEorUGZsODdNTWw3ZGJlVHhhUXI4QTlLNWpnV1h2b2RSMC9SdkFMQW9lNFdw?=
 =?utf-8?B?WmlpdEZCM0xwWnd2NnYvcDFyMGlEMTJzZGhOWEZsUnArWDd5c29GaWtxd3Rk?=
 =?utf-8?B?eFZPVEJ3NGJsWkpEcUZ4bVl3am01WS8yb3dVV1dBV1JqNE04Mks0bmIrOFpt?=
 =?utf-8?B?emNRdXMxZERoaG11NTl2dlU0N2J3QktyUWsxMnA3QXloZllRcm9GdmRpWXhu?=
 =?utf-8?B?cWRWdEV3NnA3Nm02clZkQVFsb3pYVFpad0lDMitVQ3FvWGExVGtCd2FlQzZw?=
 =?utf-8?B?bEpGZ3ZHREZxY1FYbXJhcFpDdWpYWUEvck1FeDBadHF0WGZ2bmk2cTdOOUEx?=
 =?utf-8?B?NnA4dnBZZXM4c2d1cG1lalU0bHp4UW02QUNXcnZMT3ArbGJsRGhkL3Z6TVEv?=
 =?utf-8?B?NSs3dkVWUHEwY3NhRkFqQk1kcmU2NUFBcEgybUVGQTFuelFjLzRmOGlZclVw?=
 =?utf-8?B?Vy9ldlpKRW5LY3A3OHNqckQzdWl6UytTOEFnYnNmakgrNGNNTVlEOXFLUXgy?=
 =?utf-8?B?bDMvdURuZVBnZ2RVOG00QUE2Z1ZIWHZya2RsbWJJQWg3c2RYS0ZoallkY3Zp?=
 =?utf-8?B?UzdhY1FuYVRJZmlvSisyM3FTaDF4a2k4RlNPMkNVeGJ1MTJlK0hUUmxrbUVx?=
 =?utf-8?B?enRHcXhkMzlxOEdaeG9xZmhMeTFvc3lrKzJHdmREVENKQVRUUnd3bHFIbldt?=
 =?utf-8?B?OFFoMWZaRTdJb0d3TWJreW9WdkV2UDFtSE93TDMwbGpzNGhlN3pmUktSd1dk?=
 =?utf-8?B?YTN1VWdWR1dnRDZneUhISHZBZ3ZKRUxUMjhEQlorVmFONDFkSG51RTE0allw?=
 =?utf-8?B?SWFDOHVJZU5YelhTOFRMSDk3ejVpTE53dGc0bUM3VjJGS3Z2QlVCbUg0bzky?=
 =?utf-8?B?NFN4Tkk5MjZpQVd2ZG5wTEVzQ213V1pDbVhpQUtjcWlBZ2tTYlNBbVQvNG1x?=
 =?utf-8?B?a3RuUDZMQnlJWW5BY21YUzBVbzJJYUM4SDBPY0JjcGZTMzZnd3U4SU5WV0lP?=
 =?utf-8?B?NkVUT1NGS3NQbU0xMCsvdTNncjJ1ZjlaZDJlVkI5WlhyVWJEU0dNR0tnUzNJ?=
 =?utf-8?B?M0wzNmhzazZhYXVqRjR0YkhVUjl0MFdlcnhQQUY4Y3B4TVFkMitxRWpWNFIw?=
 =?utf-8?B?R2huVVE4dnE4RTFRdWxaTkRuZjQreEtYUkpSOHdWOXhaYzF6b3B4UDJ1dEgv?=
 =?utf-8?B?NVg2K0NONStyc0pVNHc5SXBlL0FPdHJoOVFyWWlVeHN4Wm5PVzEzZ0l2RkJW?=
 =?utf-8?B?cnpqanY0YUJHelRydHc3eHp1UHlTMEpCL2tTRUZFY0ZSd0JBZ0k1bGNYSWFE?=
 =?utf-8?B?UDNPSHl4VDg3bU1LenV5RUVJQTZtN1lkVi9iNk9WcktiWjNRQzdiVDQ2MzE2?=
 =?utf-8?B?dVRtZURyMHk5LzJWbVM4WTVGdk1VWmZwMk1GN3p3MThFT2pnb0UzQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1db19b6-8a8d-493f-1122-08de6a45818a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:46:29.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kV0+RZxbT1Nvgqw06j+X6HdOY1DGmE89Iv2r97V++6nh+D1DfFdmsHHAG4cr+gGfwuMY14++GabTE80WFjQHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7838
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DAA7A12E79C
X-Rspamd-Action: no action

The `-c` option to stat is not POSIX compatible, and hence prevents the
check-endbr.sh script from running reliably.

The first instance of `stat -c` can be removed by fetching the section size
from the output of objdump itself, which the script already parses to get
the VMA values.

The other two instances can be replaced by counting the lines in the
respective files.  Those files contain list of addresses, so the size in
bytes is not strictly needed, we can count the number of lines instead.

Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
 - Use $(()) to convert from hex to decimal.
---
 xen/tools/check-endbr.sh | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
index bf153a570db4..aaaa9ebe6bd7 100755
--- a/xen/tools/check-endbr.sh
+++ b/xen/tools/check-endbr.sh
@@ -92,14 +92,13 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
 #    check nevertheless.
 #
 eval $(${OBJDUMP} -j .text $1 -h |
-    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 9), substr($4, 10, 16)}')
+    $AWK '$2 == ".text" {printf "bin_sz=%s\nvma_hi=%s\nvma_lo=%s\n", "0x" $3, substr($4, 1, 9), substr($4, 10, 16)}')
 
-${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
-
-bin_sz=$(stat -c '%s' $TEXT_BIN)
-[ "$bin_sz" -ge $(((1 << 28) - $vma_lo)) ] &&
+[ "$(($bin_sz))" -ge $(((1 << 28) - $vma_lo)) ] &&
     { echo "$MSG_PFX Error: .text offsets must not exceed 256M" >&2; exit 1; }
 
+${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
+
 # instruction:    hex:           oct:
 # endbr64         f3 0f 1e fa    363 017 036 372
 # endbr32         f3 0f 1e fb    363 017 036 373
@@ -116,8 +115,8 @@ fi | $AWK -F':' '{printf "%s%07x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' >
 wait
 
 # Sanity check $VALID and $ALL, in case the string parsing bitrots
-val_sz=$(stat -c '%s' $VALID)
-all_sz=$(stat -c '%s' $ALL)
+val_sz=$(wc -l < $VALID)
+all_sz=$(wc -l < $ALL)
 [ "$val_sz" -eq 0 ]         && { echo "$MSG_PFX Error: Empty valid-addrs" >&2; exit 1; }
 [ "$all_sz" -eq 0 ]         && { echo "$MSG_PFX Error: Empty all-addrs" >&2; exit 1; }
 [ "$all_sz" -lt "$val_sz" ] && { echo "$MSG_PFX Error: More valid-addrs than all-addrs" >&2; exit 1; }
-- 
2.51.0


