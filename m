Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE896CD789
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516150.799810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSvV-0008Bc-3X; Wed, 29 Mar 2023 10:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516150.799810; Wed, 29 Mar 2023 10:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSvV-000890-0m; Wed, 29 Mar 2023 10:21:09 +0000
Received: by outflank-mailman (input) for mailman id 516150;
 Wed, 29 Mar 2023 10:21:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phSvT-00088s-TN
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:21:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66f6f846-ce1b-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 12:21:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8128.eurprd04.prod.outlook.com (2603:10a6:102:1c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 10:20:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 10:20:58 +0000
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
X-Inumbo-ID: 66f6f846-ce1b-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnehlA93MflxS2oFJQ5s6S9Hqt6n5rPa0i+LG92xIgzD8yVu2CLAS/fBEznNxNlx/ReuwqcqCpEj1lOr1CPDO1qOz2KT7hXpfXzmK9dm40J6mf1zXqNfTqvfreBXkPiXPJtKnsFkHlKfxeGZJQVeI+IfpyAnlZym0nXEv20c58KaS0d/c8iUo8Hz0mVGRbA6AdRHb4z9ybxgmUSjQ+C9R9Rjv+dgKAGFQDcNwOQ6yK3TxR1Lttjf/G8HHWo8rxxBXIUs2o8OWDCKJXthZXpMG5VWJWi66Q0VXzJNnNbVtItv6PDYGeLW1lkc5MgHRduTvKU8NMNg2L5WfFQfyKjXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJsv5RmYmoMgi88lUZyoeqZVDXwsABOflEuxeJ8WDc8=;
 b=JxaUlBc+XZMbv3v+6kZ3dZ0Bp5AWOEx95FtPHH/JrFybFsTQORkD7V815hCv7eYLKRuvNwahqOrLlkQOIn4Vpvpfl5mjX2Iwmn4RE9kbTG/xHlr1KwhyQS5TgdNF+N4TI+Kvghy/jG4wiXz9MEPZGJOx+o6CMMy85vDQcX2VSSJXJheJ/CF0s/Na+OQ5+xPJnRdm+5rVAzus6jhzymiD5/DQ7OyUT3o20lyGSG+JmNITu9C+oovzns5McwBxp3zmRwhydtT+/ILKL+vuxvLCmckLDLBszFY8esdg2O9OQLvYZIFJMz2PhjO/1aFeGfNhCpNZ0n6o8r7JMAc/paI8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJsv5RmYmoMgi88lUZyoeqZVDXwsABOflEuxeJ8WDc8=;
 b=HXxHUT2tPy9cqeTzqFuub6yAY8BKnFzqT7bxA4rrmoPTj4PtIcHokW2LlJqWZTIfULY5Y1KfaqzZ2h1SvnQemsySB3ld6CLF67iHhboCbA5phriJGxdYb+lzN5noEzu9njocGkcC0Bs1fY4ZIQcqdBNkzCecvMLYD5lmeHYSa1yW0g7D2TW0g1RjCG+iTnLMX6nP4hwUEb75CAHlXF1p68BEAMWyGZ53pT9e5eItLK7rWHBFh8VDNiGCT3MBegCO3l/kRlvjKzTZHZlFmNxXTOuUVJ72nF3cVTH9ef0/HCkHCmZ2JueGf0UAFkfQWq/HOiQay502/RL8qqd3Mc1BOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e3c8f9d-8007-638a-c88b-21ad2783d8d3@suse.com>
Date: Wed, 29 Mar 2023 12:20:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] build: out-of-tree building adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1a213e-7853-4624-8f32-08db303f49c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DPSoY96eWxu7ZPt3wwTaug9mL5AVQQq9zr8WxoV0xtzmKvHBAQxS0okQw4l6eYyNgrliHYyyx4Bh36vPF5aW2vC6Guz4ZRrtJn/pcyjJfwM8kGbLtVtZ/uB6Fv8h+CT6U+6XnLNof4JSQSQvdfL969uBK12ddlFLkp3RGSgYM+SjtIr1zykjW4YSISo316GX3HCeLI9nXAfrdCdbKG9981myksecbrLUAD4tyegFYuD7Qi/FXpD7owqMi+LUmRRHGe3+8UrjR8SKMzSJedW5lPmojyGoxKKEb+UlnmXEJavgW9aDKM5jdNHsTic6jyXzLo7Ia4WMxctyMgXJpRx+Jmo+cM3Z9t1wMFUk2W8DCs3DNat+IbOQ6r2WD4JcaWyYJJjlf+WT18u34zdaiMEinHo7JE70Yqq5pawai3yWgnqDvt12W7oSKtfSdk4AojQx+i04/ivTaLcVyzhjFG//bkTVF1x/QDkVWPuUmJNdC6vgoMqOH+VDYziSTHWmE6MKXZ508m57IepckoOOR/bqkyO9QJw8Y+TZgGz3VsVgib3uzpnvxoUDJGWhxNKY3ypPLc8MpzwoVwpG2WewCRSQr28f+DiA/GGGd90RLTHI2CAwqMZ259VyhQS5kjT8fVdVQa1SoEI+1XU/d/YC6EZQIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199021)(26005)(6486002)(38100700002)(2616005)(6512007)(186003)(2906002)(5660300002)(8936002)(36756003)(558084003)(6506007)(54906003)(478600001)(316002)(41300700001)(31696002)(86362001)(66946007)(6916009)(8676002)(66556008)(66476007)(4326008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEF1R1VYbHNJWFUyOG11d2lLZFE5Vm5QbUUzbTRwVzJZaXp5bzgyWi8xT1dx?=
 =?utf-8?B?OTdHTDEwcUc4VHpIUHMxVzQ4MU5UZkcwTnZzYUNzUTV0Y0ZDZVVvUkEyWjd0?=
 =?utf-8?B?VkdzWFRXMDhINmZiQ0FmY3BSR2h0VERKSnI1QXlkME5MZlU5WUM5V0x5bnpG?=
 =?utf-8?B?STBDTzNkOEdTNUtGbURPdlFWYVlVY2RpbWE3ZDlyK21wQWNtTzB1a3h6aVp4?=
 =?utf-8?B?b05Kb0lVemRSYklBOFJibVRzcnZRZXI3bWNCZFJNZFJPMXZTcUpoaHMrc0Vp?=
 =?utf-8?B?SDFkdDIvZ2FVeWNSU3dTMVNvRVcwU00wazlYbFhVamVUS1FHRjhHTW4zMk5x?=
 =?utf-8?B?TUFzdkc3b2hRSVNYTXd6N0hleklCSUQ5ck9uTTFtUDRnTXp0TW4zQlRvZDJi?=
 =?utf-8?B?SHQ3REpmOS9zbCtGbDdJeXpHYWo5L0FuMW1jRDVEb3pkazFGZEQ1TmRkVEVO?=
 =?utf-8?B?bXhoLzNLUmFBTjZtM09oQlp0MWJ0WTQ0TUN5T0UxS281dVQrK3ErYTFMdlcz?=
 =?utf-8?B?YVV3L3pNVVUreTlkYlNWOUVQWDlQb1NvY1VzcmtyK3ZCSkcydTg3U2U3eURi?=
 =?utf-8?B?L2RPYm1XUkc2K29FTTd2KzVoR3I1WmJVdVZ3UFR4Q0tkNEhUUG1MN1V0NFB3?=
 =?utf-8?B?T20wQ3kvbEpaMEZUandUSE02amFSNzVvYXJuTnFYRTYvOVZzTFBsZkdGMmhl?=
 =?utf-8?B?U0hyRzhVNER1TTRUL2haSFNrQmU0WjRodjFLbDRPVldJcE5CTVVrU1Z0V1d4?=
 =?utf-8?B?Wm9qQjBDbDh3TzBpaFI0OUZoOWNSaENmdWlmdGR4MXpkOGJudFJhVXNZeFBL?=
 =?utf-8?B?L2N0dWI3QmQwbEFyc3NQcFdEQ2k3VnFSUjdwV3ExYnU1Yisyc0duUXBSUVlF?=
 =?utf-8?B?Ny9oMGozNVUySmozN1piZVVCMkY2N1YrYXBkLysvdlZRNGNlSXlUMXhPR2FI?=
 =?utf-8?B?NzBhQmhCamsvQlZ3dmZ0dXlmN0FJUkYvc29nclRzamtnSTRRMDliSDZkQWhm?=
 =?utf-8?B?QjBCTVVUaVk3WkppVWs2NXhtc3p2d2haTzlMNUdzU1czRVBFREN3WFBlSU11?=
 =?utf-8?B?YnFmR2VTb2ZZem9neWtOWG56R3NXaUdtODh3WE1aaTRNNG9keElHQkMxcnVX?=
 =?utf-8?B?UndZU1N3OFZMUEdKa2pMUUtvU3RBSGt0UWlzQXh2YWUyVEhuN3hScVRnNFA3?=
 =?utf-8?B?Y1YvQjRrNEsxZk04MitDTCswOE40dExJcGlUTnVZT0hpOC8rRUMrb3dvR0Ir?=
 =?utf-8?B?TGFaUEpaQnFycmpXL3Z1UXMxL2NkWnZ1a1JNdkNqNHpLRmg4a09oNUtkUmRY?=
 =?utf-8?B?dFVZL1o3akR0TGxQVzZCblM5ZlZvNVU3VGxKOFhPWVU2QmtUSm1PUEd5Y0hR?=
 =?utf-8?B?SjJJNHphYWRmOEJCUnQzYm56ZnE1anViYmRpcytiMElDVWRVVkhrb3F1cUEy?=
 =?utf-8?B?eGN6cWgzd3J5ekUxM1c1SmY1a0JVVjF2SXg2TGJpN3I1WExXRlo5bzdCOVZ0?=
 =?utf-8?B?TkVvV0F6L3JnNkN0WGVVcmFQTy9URzlWK3Z3dzl1QW9vK1h4dDI0OUdmeXg1?=
 =?utf-8?B?UU1DTnFYc0xqR0NPNHdFeW0xeXYzTXlOcnFmNCtBcFhScUZNcVR2czJqUC9i?=
 =?utf-8?B?ZTBxYlF6UUZoNmhVb2swL2Q4MFdmSThmbDZvb09ZZ3FwUDhRZ0VQR1l6WDQ4?=
 =?utf-8?B?dDBHeENXbWpNQTdMNEJmMU9IUkFsMEUwYlBtTHVJNjR2ZFV6YTJKakhjRzFq?=
 =?utf-8?B?OE1vTHpFUEVWTHAzZVljekRnbVMyWnB1clRNQytnNnNFdDNnT29Pak5Wbndj?=
 =?utf-8?B?VkFLRTZBYjlTZU1jM2xFR3dMTno1Slp6TDhBNHVlWFlZd2FvWDV1THI0RTdi?=
 =?utf-8?B?eS92MnVOaXNQbEdtbUZ1aVFIMmNFUG91Qkhnc09iM2JYWnRzYndFNVk5Y0g3?=
 =?utf-8?B?WnJEWExFVGR2ZGlVbW4zdTR3bWpET0h2TVVmdlV5L2VnUGJpVElncDZNU3ZI?=
 =?utf-8?B?b3NROTdlTU45eU5BcVBsS2VSc0pMb0RKakIzb0tjSlYvdU83SzNEYVZCeGxk?=
 =?utf-8?B?bWd2aUdlbVVtVlBrbVpZZkcxTXFtMHRtRVluTXFGN2N1RXV1Tjk0b3A4MlhB?=
 =?utf-8?Q?g0pJBLs8V93nceBRZN8aXVrys?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1a213e-7853-4624-8f32-08db303f49c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:20:58.4047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MX7wFa05AxZ1rJ3u8HSi60+IdWz+ndu8SYmEOmT1tlR6TNH1qNpguu1wdDJalWNVjM2NlfP9w+7dopuvr9ryUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8128

The 1st patch is new, addressing comments on the previously standalone
(and unchanged) 2nd patch in a way different from what was discussed.

1: don't export building_out_of_srctree
2: omit "source" symlink when building hypervisor in-tree

Jan

