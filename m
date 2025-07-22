Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C3DB0DB39
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 15:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052659.1421403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDJx-0001wW-NI; Tue, 22 Jul 2025 13:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052659.1421403; Tue, 22 Jul 2025 13:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDJx-0001uJ-KC; Tue, 22 Jul 2025 13:46:17 +0000
Received: by outflank-mailman (input) for mailman id 1052659;
 Tue, 22 Jul 2025 13:46:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SuC6=2D=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueDJw-0001uD-9T
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 13:46:16 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37ad00b8-6702-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 15:46:07 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAWPR03MB8913.eurprd03.prod.outlook.com (2603:10a6:102:331::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 22 Jul
 2025 13:46:02 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Tue, 22 Jul 2025
 13:46:02 +0000
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
X-Inumbo-ID: 37ad00b8-6702-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fjk1NYiwX7v/QJFqWS/Mo+n9w3AJcGqwjXUsUAgA49yYWhXzJKZPSYlZSq84/bEKXBay3nRb87U4r3p2+ibev+alzamSFrEzZPiql4b5XSyMXh04d3hHDyTGpRZUTNDEimjlRSW20zIkzA09sRTbK23aq2FirsLjJ8A4KFMmWF0zSHP34yGu+nwBlHYvzGKmX90XFOK4JFPGNUi/PWdE/Rc7PU7hCIJiV72rgynvNJMPaM0dZd4+NIVwUkMts1yD8Lw8voU72DWBm7HlNirHf4y0LhTMmRRD5VQt5A0dL0AjPu3t+GrULgrMbwj1az0uisVbA8sWgKM7bUNRfQyvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0IHKCwgZNtKFki9yhPYWZGCcxCDgwbmSTApxsomuec=;
 b=nP27kiIFT4gYkdDwJjVvayS+fTdq0yao5Q2JaLEfu3eIpJxt+DQS6JElCIejUxQ30tK80OWSkrpLpoXPWcYtBgtSZBHNvfOc0zHqcrZAiybsrBUbBtSlGdaPBDds5oP0TfFd8xismTJGD7rCOpDckAup0HghTCZHDWGe2Wo8qQW2i8YKA35FYBu8L0VHQHI78ORJGrGzf4SmFizfIoOqRhg4PX2lbZfsa3Qr0ldiNgR7iG0AUlTthxiYc91uOHXM44Dvca7wI9Zu1vM/UX8LNI/fubS2brgmsVm0QKDcwgNWDuUO32Nw5ZNroyrahwrlT+QhRYS6zb7PUGLm28V5pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0IHKCwgZNtKFki9yhPYWZGCcxCDgwbmSTApxsomuec=;
 b=M0B5FHw5DxcpcKVop+ksjmxiedsrgj+SuzT39bn36srg5hA3hfJmN/YoJlpJgUSrDIMNFwzu2mKN4A4HG4xuo1Prxmy3xZWFuiNwZwK3wVZo2Bu+A3+jGv2v8HHEinm1WbTmefIwSe6rPPkf5LLdLYAs2KcU7wg4IybMJ4x+1kenO6IkLZGwmCtyHkUJEwYwipkJ9yF6DkMgy8kuqlcECpa4x+ZdH4N6f07eI3AH20T9X1yairTSfJaeIZSeOKbgNoYcjdhYd6dOKuw8obrA/DqQOKo5hJS5MectLaBQcEzoR5ucqQtCUER8bS0f/aM11UOmb+Dj41CmhHiCcF8bqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <614706a4-8bb8-4c40-aec8-3031ec465ae8@epam.com>
Date: Tue, 22 Jul 2025 16:46:00 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 1/2] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
 <f1605fd9-4e98-4ab3-8fa8-ed52b0f76b56@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <f1605fd9-4e98-4ab3-8fa8-ed52b0f76b56@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::12) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PAWPR03MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 1724ce5f-0dda-4946-7842-08ddc9261911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clU5RGNENHdzem9FR2o4Smh1eW9XdVAwS2l4cVMxd080aENFUFJDUFRhMmhS?=
 =?utf-8?B?bkE0M0tZMDlOU0xVdFhUWFMyanlCMHBHOHREVFV5a3l1YjJ0dXlQTzVuUC9l?=
 =?utf-8?B?d2h5b2l5cVpvLzJkUDBMUHdCK1FncTFFUTdTczVROHZhRld0QjM0T1VRYjVB?=
 =?utf-8?B?OGdqWHlTU3haWUQwYlQwdS81WmlKblFidXg2dlhobWl4ak94UlVuazZzbFJF?=
 =?utf-8?B?Uyt0VW9rRnBHRXgybFFYTXhkdmEyd1VYa29aWW55aW5zelVxdE1LYUNSemth?=
 =?utf-8?B?VkhwUHMxbElrcTB4UDd3dSs4RmZMbGphMUw5dFNYYnBmWDIwSk1ZaGQvbDNi?=
 =?utf-8?B?YStoVWtXYXREbmo4bVVLSlpjRVM4bVI4Y3Q0cUl0VnhLa1cxMTNjYS9XUHZj?=
 =?utf-8?B?aVVhenB2ZVVyN0dBMUJHR3dxdGpTMnBvZURaS0dPQXNpdUU1aDBEVEJIbFVN?=
 =?utf-8?B?bjJrZmRWT1dSazNYWlcxUWV3alBhWWV2bzhGOG1WampuSzRNSGUwNXMyOU00?=
 =?utf-8?B?K2lQTU9hejNMNjN0Q3VBVjRxTFVabXZNa3NsWkUrdm1FZjNVWVRDRnlKWWJM?=
 =?utf-8?B?bDNmR3pPRTNRdWFHR0Ntc2UzOG5ubC9nR3ZJcE92MWJUdkhKNXZtUndDMW5B?=
 =?utf-8?B?OHB6NmNObUQwbmxEaThqVjR5dWJWNEcxV3hpN2puczZtb003b2J2a3Y1NUJz?=
 =?utf-8?B?eS9BTExBVUdOSjRmdHFPT3NxUWd2ZlE0YWpGd3dlSDZTbkwrZWMvZXJaSkdY?=
 =?utf-8?B?YS95OTRNMlkzQmhBeERVdXZTWmdkZFYwUC96UXpZTWdPQ1hQL1U1ZC9uNnAz?=
 =?utf-8?B?RTJYM0duMFEzcUFKaVg4LzFxUnFWYVp5OERFWFJKVU95OHBpVzlsWFVVazhQ?=
 =?utf-8?B?emRBT3lUZ1pRaUdEb3BUbUh2ZGcyajQ3ZkYyT1NUTlBnWUpNbWtHNlZqRGhI?=
 =?utf-8?B?MlE5V0JOMzUyUXlTRnlRc1BJVUVmUVJyV1NUMXRVWVhYeDk1Qit6bFdIZ2I3?=
 =?utf-8?B?aTJIWFZWY0luUlpWRko0UDlUaE5CVU9VMlowd0dpQzllQXFaNzhzOTlub2Y1?=
 =?utf-8?B?a3c4Y3VzSmY5VlVZYlM5TXEzeldLOU9nYmxlOEhSUkpkOGdzRTZTZWhqOFJU?=
 =?utf-8?B?Mm41TStXZ2FQTUlSc2xDRVpvQUMxZm43NmYyUUVDZDFqYnBOMXh0UVYrTlVo?=
 =?utf-8?B?MUFsMXFiYVF5OXhYblZFK0hTZU9ObjA0eDlGdDcyV1ZwNEtGT2xBUlliVU53?=
 =?utf-8?B?WUQ4eDNJV2tDWTRKM0hGRm1JOVhDSU9BUUE1VkhSa00wUHFQeklpVTRabzQ4?=
 =?utf-8?B?OWhzRncxU0RPcUxZaGhDWmhoazI0MThicUlKcjk0UkhEZGhqMExGNW96SCs4?=
 =?utf-8?B?Rmd2Smx2bGcyekJxZExvajJKeGFBSWl1a2hKalMyV3FiVEkzaDlKVFpzMWdh?=
 =?utf-8?B?aHJvUStYbnIxTVN6b0FIenZzMmNrcDNmYTJNRmkzQVVLYXZWQ05wYkhSaEZM?=
 =?utf-8?B?dkxUcC9qK3FaY2lNa1ZmejdNWnlJNjBsbEcvMUJlc3pKOVdXMW05M3NBaEE3?=
 =?utf-8?B?bTVOTVhWN1FxbkVnR3lUQysvMk1wc2NWd0YrWHlHaXU2MlArQkFiUFNxcWU2?=
 =?utf-8?B?QTVtKzJEaGIrby93WHpTM2k1OFU0Q045Y0UwY3EwSExEK0pJNUQyRnJKTHp0?=
 =?utf-8?B?KzNZMDVXaVM3S1VlTHB1NEFCMFlLTmtyRTluM3F1bUxpQjZjaWFJZ2M5SVBF?=
 =?utf-8?B?ZkhwdEh3NkNDZUZZSzF4bUFkTXplWFNGWmttaTdnUVpRVWVXVTAxTXpHMlpx?=
 =?utf-8?B?aWk5MWdGUHpDZ0lFWUJCeUx2TEFmSkd4RG5aQmkzSGhLMkdlbWE0WndjVnhw?=
 =?utf-8?B?RHp6ZnU3dTlQVTJLZE9peWtZQlVocU8vam90WFFkVTJlTkkxWXl6eW1oWTU5?=
 =?utf-8?Q?6qajUet/BXs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1k3VnlzaTV4d1FkcGNaZGVoNERSS0czTmVPZUdlWWNzMFlPSTIxN1VmdG83?=
 =?utf-8?B?ckFsY2sxakZLMldITnhKZCtQYTlqQ1VLTWRuY0VnV2pGU1hpdlBHN2EzWUpX?=
 =?utf-8?B?WlIvSVRNMS95bVBVcDNCQjEycXBkR0poZzVlbnBYVjRHNko1amxIVStsODlR?=
 =?utf-8?B?SzFKV0FNRVF1QTFaOFI5M3NvOWk3azFEazJkYks0TWV0bUtxbTBabllIZVRO?=
 =?utf-8?B?WTMwd3RERTgzNGs1c1pmUHRVVS9CVStmWGNSbkNhQkJpR2x3ZWNXS0dzcEhj?=
 =?utf-8?B?QW0zTlVhRFNmbmdqYWE0ZUxGQllFckRjUFdHVTFPRTM0QlBmNFJ6N2ozcGNu?=
 =?utf-8?B?enJZRHBGeHh0VXlHeWc5OXRUR2RKcWluOWFGRUI0cVMzSXFlSnI3UnpDc2Vs?=
 =?utf-8?B?K0FQNTFyUE9hVUo2bVBieC80Y3ptUjRPamNQODF5WStBMUt6Zit5aDdWbHA0?=
 =?utf-8?B?ZjJEYzM3OU91UjErVGZYNng3cUpDZndjMVNsUlRyeW53YytkdFA5VFFWalE3?=
 =?utf-8?B?Vk56Yzg1c2FLcS8zM0VDM0F4QWlsYitObGJtNFZVN01aanJMWG54NFRweTl0?=
 =?utf-8?B?em5CbjQya3MvU2ZaUkNTcnptcElsZkJsQmRoNWVienBZWjRKdjVwTDcrcFNn?=
 =?utf-8?B?azZnMDRWL1hHMzM2cVZUd29QVVpwaEEyQkp2clRGOU5zekZQaFhtc0Uwb1p2?=
 =?utf-8?B?TFJCUWF6WnU4TEh6NE1QUjY1RHh1VWNBVTR2SHR2dnh2U21CVjluVFAxeWxR?=
 =?utf-8?B?d1BvMmxHa1NNYVkzb0oyQnBWV0s5Wm1vVFJ6TnVqNENXc3FNblN2UVFPeFRF?=
 =?utf-8?B?SXNaMm1hSUZ3R3dnL2hONlk1M1pMUmFwWG1QbjA5Z3FKMzdPT29BWC9HK2JV?=
 =?utf-8?B?bDlXWmhUSmVFNTNxOURYU0VTTWhvR1FaMXI0SzZUdjhKMzdNN0FST3NrTmdE?=
 =?utf-8?B?NExabzVuYWlXOTBld1BQVk93M0VuMEZoUVpwK3JjUmdMZEdxZmsrSHNCLy9i?=
 =?utf-8?B?VHFRVnFnanRscTAyYjVTZWx2bWtqZllnNFdwd2E4TXNLcXU4RXdGNUk4anlj?=
 =?utf-8?B?TTByTk9XZEJaSGkvZFVONnllWU1rNC9BWG9qR2JvQnJ5N29wZHlqdGMrU3J2?=
 =?utf-8?B?WlpuM0NCWUtrakZlZ0c2bnc0OVAvdHhXNDhrekI3V3ZQbmtmdkdINjNsWDZL?=
 =?utf-8?B?bEI1NEhUbkFHRjZMbGJGOElhSVFlLy8xc2hDanRsOWtTSzZ1ZjhXVmIrS0Zj?=
 =?utf-8?B?RWE1YUhvTmlLM3VUYTlxSEZ5SVgzUUN0Y21qWDVaOHdvOGcrb1dibnUyNGlv?=
 =?utf-8?B?bDh1dWhWMWxZVGZnNmR0RUl5VGc2THpocUl5VSttTlMxZU4wdjB2MmM1KzhX?=
 =?utf-8?B?Wk5GUjc5eGlYZW1uSHhhRXdWeCtzRmhIckhpN29CZUh2V2pSdEhXT29aVktL?=
 =?utf-8?B?SnFPcGFmaEtXMjVRWnBGK3VpemZUWDdqc1VjSXVCT0w2MnFKWG1sd2JCU3lu?=
 =?utf-8?B?c0NjRTczazJhSEMvc0tBMUhUK0JQWHoyc3FYeTY5SGZCMW1YQmIwc01sZ1Nq?=
 =?utf-8?B?dmlZWFUxQ2s4VjhWZ2Urcm5FSDU3cmRES01CMTRWRTBTNlhuOFBoVFJLR1VH?=
 =?utf-8?B?WW44UkhqT042RmlnYVBsR21PZ2ZsK0VJUndnVHRsNVgzS1YwTTB0K016WDV4?=
 =?utf-8?B?b0p4eHJlbXRTUVhJYU93MW9WeVp3TFh2d2g1WkZwWXJWZ2U0VzJaOVF6OHNz?=
 =?utf-8?B?Z1ZUTG5ZMVBVVk12WElyaC9rbEZZNG1kcXFRUjRLR2NaYlI4QXBEY0tvejFl?=
 =?utf-8?B?U0pYUjZFUHlBOFNhcnJBUXhVWG9WSXlhajRhVWw0UDM2Q090Snp6T1QrSkRL?=
 =?utf-8?B?UXE4eVY5UURFZC93WCtpNTZuU01jcTRaak14OEpXU29aOGhsdHYzZHNuZDFP?=
 =?utf-8?B?VzBvM0ZnVUd5SXV0cmQ2MW9zTUVMcUR1VWpKWjBicElqQ2twUVVIUzk2aEpv?=
 =?utf-8?B?SVdIVDNmUzRsMkFnK2RSemhsM0ttR0FWdXg2ZWlZdzFIZkpQRjdEKzBsMHZP?=
 =?utf-8?B?OEdVUmpTUTZ6VjJ1MlFiN1U1SCsrK01UdzE3dWE5WStVazk1dnRCa0xkWHho?=
 =?utf-8?B?T1FGTENOTkwyNks0eTdHWEduSTk1R3V3UjhoWUI2OWZ3dTNoOXovOEhQM2M0?=
 =?utf-8?B?Nmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1724ce5f-0dda-4946-7842-08ddc9261911
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:46:02.4215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 060yYZYmXmabHd9LwVv3ewgj/CaKr87EjdfNvtNZZdYhewwTF1kCmcBsNXR54eHA5ulSJtvi+aK5Vy+WQdy8sHcY1FW4qfgW2LAXRMgHjOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB8913



On 22.07.25 11:23, Jan Beulich wrote:
> On 18.07.2025 12:11, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> On platforms without PIRQ support evtchn_move_pirqs()/send_guest_pirq()
>> functions are unreachable (Misra rule 2.1).
>>
>> Move these function under CONFIG_HAS_PIRQ ifdefs to fix Misra rule 2.1
>> violation and resolve call of evtchn_move_pirqs() from common /sched/core.c
>> vcpu_move_irqs() code by moving evtchn_move_pirqs() into x86
>> arch_move_irqs() callback (which is converted to define).
> 
> The patch title isn't quite appropriate anymore with this description, I
> think.
> 
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> preferably with ...
> 
>> @@ -1707,6 +1709,7 @@ void evtchn_destroy_final(struct domain *d)
>>   }
>>   
>>   
>> +#ifdef CONFIG_HAS_PIRQ
>>   void evtchn_move_pirqs(struct vcpu *v)
>>   {
>>       struct domain *d = v->domain;
> 
> ... one of the two blank lines also dropped here, just like you do ...
> 
>> @@ -1722,7 +1725,7 @@ void evtchn_move_pirqs(struct vcpu *v)
>>       }
>>       read_unlock(&d->event_lock);
>>   }
>> -
>> +#endif /* CONFIG_HAS_PIRQ */
> 
> ... here. Happy to adjust while committing, 

Thank you.

> but please consider suggesting a replacement patch title.

Honestly, I, by myself, not sure about proper patch title :(
My options would be:

  "xen/evtchn: evtchn_move_pirqs()/send_guest_pirq() fix MISRA Rule 2.1 violation"

  "xen/evtchn: opt out of common pIRQ code for arches without pIRQ support"

  "xen/evtchn: fully restrict concept of pIRQ for arches with pIRQ support only"


-- 
Best regards,
-grygorii

