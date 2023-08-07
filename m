Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A117730B8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 22:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578952.906696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT7Ge-0004Oq-PV; Mon, 07 Aug 2023 20:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578952.906696; Mon, 07 Aug 2023 20:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT7Ge-0004ME-M9; Mon, 07 Aug 2023 20:55:56 +0000
Received: by outflank-mailman (input) for mailman id 578952;
 Mon, 07 Aug 2023 20:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ru+M=DY=citrix.com=prvs=57627f799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qT7Gd-0004M8-6K
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 20:55:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb21262f-3564-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 22:55:53 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Aug 2023 16:55:46 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6069.namprd03.prod.outlook.com (2603:10b6:208:309::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Mon, 7 Aug
 2023 20:55:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 20:55:36 +0000
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
X-Inumbo-ID: cb21262f-3564-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691441753;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=00OESeAFg69Kz2rY49e/l18jDbeyyE7Uov/LuG6aTxs=;
  b=WkffSd7hlrROS5BhObd+cwf+1xeRKemftkOgFWdavp/+QN5W0YSypxKK
   ifAvXVOtWLfgOhEk180oGOWxJafzlHPMrKfLCcDENDw9wmrpF0e/qIdNi
   0wwFo2RAYYLKta7uY4BewVu5e38d38Kj5TFkFMFVUiK9cBswAr2nojynu
   M=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 118057846
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EcE4x6NXmIZSKOnvrR0zlsFynXyQoLVcMsEvi/4bfWQNrUp30zQHz
 WYcCGuOP/uOYWqmKdx3aNy1p0kCv5PcmN8xTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tI5gNmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0r1XA3BF+
 f4nFDwqXxuGi/C57KP4ctA506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/RxvzW7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWzXumB9JOStVU8NY1qn+M33MWLyYMRAukhqWHjmunW99mf
 hl8Fi0G6PJaGFaQZsLmQxSyrXqAvxgdc9ldCes37EeK0KW8yyaUAHIVCAFIbtMOvdUzAzct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/Hop4Q2kxTOUsclFaezh9L4Axngz
 jaSti88ir4Py8kR2M2T/1rKnjatrZjhVRMu60PcWWfNxgFkYI+oYaS45F6d6uxPRK6zQ0Odp
 nECl4675foXEJCWvCWXRaMGG7TB2hqeGDjVgFoqGoZ78T2ooiSnZdoIvGw4I1p1OMEZfzOve
 FXUpQ5a+J5UOj2tcLNzZIWyTc8tyMAMCOjYaxwdVfIWCrAZSeNN1HgGiZK4t4w1rHURrA==
IronPort-HdrOrdr: A9a23:nfSu5KCI6aiYUHHlHemK55DYdb4zR+YMi2TDgXoBMyC9Vvbo7v
 xG+85rsyMc6QxhP03I/OrrBEDuewK+yXcY2+ks1NSZLW3bUQmTXeNfBNDZskXd8kTFn4Y36U
 4KSdkaNDSfNzlHpPe/yBWkFc0t2dyWmZrY/ts2DE0AceipUcxdBstCZTpz23cZeDV7
X-Talos-CUID: =?us-ascii?q?9a23=3AT5d8P2uHCpv434KsOSRkPyp+6It+Un/Mx3vSHHO?=
 =?us-ascii?q?0LldiTbGHRnOBu5tdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A90G++w4gHGv4ORKgaPMDICBhxow3yYaxEV8Itq4?=
 =?us-ascii?q?cqpmbEnBOPxKEjDmOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,263,1684814400"; 
   d="scan'208";a="118057846"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAHXDKZE1D73IucaJJpV5qLBabtiGs1pAJGEYHqXSdKQpBRtHEwvtXuMafFCJ6JAmU/MoH8tgea55Pw2gZXORQDN5GXOF3Wj8v5ucmp2C09gitzjr8xBEqhv771VLsiMVxt/Jx+ldJcxraUkYyafavI4MmfjR9sDVlT0Nj7JhaB/RhPA/neV3bahc9QRPcgyCzXijkK9FYbl2N7Fj6tcAUY0pYim2BnubI3DVFQAgHlop2trMWwZ3n2dyBhWASP25GNGc00TLUrD5DOihphxrzymtK7U3Pm2gTOS2OF3f7blSMVn+EZQG+7qFAVY7Vs3XUCEm72AVbzVlDCkRoLgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00OESeAFg69Kz2rY49e/l18jDbeyyE7Uov/LuG6aTxs=;
 b=aEVLgItnBA5YTj14RVIqoIDstyTOw3xrwKlZVtyeUxcEBBNQXKZeDH4KpD+jEs5+1tSJMn8FNiRtfCMx3waULq34TTkwyC/vT3gESkhJE7O8iuePUi/KVWWmb4sasRzfsy16RAu2nhwHuyWVSMAP05dQRPb3tyz9ZG3kXj4+gY2vLYHiu5mMhNWowPlua+kG8sAIzzRvo9gxwj0sVMeNu1UoljabZStDBu6s7Ic/G/gdQ9/ElT+v42QBy3himCe1tfelkrKhwOV7WF4EzrcsixHwliZWK8tAnsiM7zJ3ZuA1sNFNMgl7gFgB5KaYl+XDRHuZCmMLMAa5nWtM56nGxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00OESeAFg69Kz2rY49e/l18jDbeyyE7Uov/LuG6aTxs=;
 b=swQvHf4ZEXJ7pJwbuRajTSH2fkvuVkFoyvceg7tYFCoc7xPUwz/OtZJ2z6McdkI+tNxN31lcfVkgPtjFsVOkZ5lhwagnQwm7CaY2Qp/EdM8ACc2ZwfmrHhIKurMPQ37wgAix/e6gpeIXe7ansX98Ku3f1ViX9Dd8nzCp416zBSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <70a225ba-e263-48a8-793d-3f596e89fc41@citrix.com>
Date: Mon, 7 Aug 2023 21:55:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen 4.18 release: Reminder about last posting date
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <AS8PR08MB79911746BC3D82A6341EDA6F920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2308071209470.2127516@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2308071209470.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0125.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 60bdd084-4450-4382-a84c-08db9788a609
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q2eCQr+RmNQtkPfV5EZ/9jLUHhDm9C9saVzW5regoxh6oHIVvzyBOZF8v/pPte6zzOQ8cIMw3eE6FTkbrTJyXwxwzjc4EoGRcvZdn1mf5xMzWuXIvwJrglu7sDD6O2Jb6Aum/iy0CQ6hKTM5VgezSJs02nEgdA9z+pDe1p2AAE0iIXwYFJapjH9GcVCy+2+L0OVTd1Hyn0bR1O2ozhh0WE/ZiJ7nyfuOONyJhNCSlxZy5ALjd7MyQKBNDLsyipEoKzjqXOaa3pZAmtZ2ACcGoWMSZqm2eytHC8CFFQ8Nn/Wqaj5DjFtrq0Y0mJqg+VSOaygg4S3OIxMWTYrCI5HAsQW2ssGAcWDgcFvxf+sTgpds9UnYyeOsNtW2vkbnSnnfEpyfWfTOsoFrI/FaIRZ2vGRRtopdVE+mdX0Dd4iI3bMzlHWkKtAHnX9PoVQCBz2/EWKWdCSk9mpWKB3qk/XD4N/Kqd6ATQXED1q6SltTYr718s2E4pF4Bbys6vFJCL7jJ6BV88nICP6Jw4ciGex595xvOSwE9zv9lwq9C8jtVDjwerqJaQYwWYxKDue9x373p2cSG3+I3PAbqQdqO9SykDjpJ3P8H6hftldmyweE4mUOVGuVd2ahewXmCie/Y+34oWSbhw4OlEv7NABdgTSJCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(186006)(1800799003)(451199021)(2616005)(82960400001)(45080400002)(478600001)(83380400001)(31686004)(6486002)(6512007)(966005)(53546011)(26005)(6506007)(41300700001)(66476007)(66556008)(66946007)(8936002)(316002)(8676002)(4744005)(31696002)(4326008)(2906002)(6666004)(36756003)(110136005)(54906003)(38100700002)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R01ENEJ2WjQ2SFZJUjIydWhzdWJoK2NEc0tGclNtSlZqcDlzZzN5RkVoMXhP?=
 =?utf-8?B?NjBtUEhCNnlQUzBCYmxqVTUwUXd2UEN4T3UwWCszaDZWcEFsSlFwYVpYUkRQ?=
 =?utf-8?B?anlwL2V6TkhrdVpqV1p0djdWZnMzcXdDTmNmRWh3bEdBRm5MM25UbnMxRHJN?=
 =?utf-8?B?bk1vWnVEMEpRajVDWmQxRGJlb3JqKzdDOUhwUWZVWlQyaWc5S2dHSFA0V0VK?=
 =?utf-8?B?TFJRWlV6OUNlSWJ3bGNIZkNQZ294NWUwRER6RHVKWTFvaU5zMVU0UUVObTNT?=
 =?utf-8?B?YmZUaHJCTHB0aUdVZGQvM3VyV2hIOGpvN2lHM0pHajhRbS8vWmJVcmhXYWZs?=
 =?utf-8?B?V215V2RkZnc5MHBPSTJsZzNJckIyWGRxTFhYOTRDd3ZZWXA0WFFhRWdHdTA1?=
 =?utf-8?B?VTZKVDY3eDNveUEyM1ZWNXdqU2x2SFB6RHovak1RWGdSUVFrM1JMdTdMR28x?=
 =?utf-8?B?YXI3eU1KWHFmaGNqYXpzR2hreTFvRnM0dEg4S0x5MGxXWTBLbHNjT3Z0bWJK?=
 =?utf-8?B?RzU3TjNJSXJYTmdic0JTcmsyU3BJd1Z4OG1aYXZqNHI2b3dRV1M5V3ovdU9w?=
 =?utf-8?B?VUMwQkMxNjdzTmdJMkZHWmYwRTVrdnMrZU9CampWKy9wWFgvWk9iTDQwQzRs?=
 =?utf-8?B?WWxhYlVvWDVaYWJoTkdaWURNeGJhV3d0d3FhQXBoL2xLb1BnZk10RFEvb1N3?=
 =?utf-8?B?U21uQ2QvZU55Q0pmZXdQNHBsVTdSNFluWjVhdUtNSG55QzJzd3RsWHJaTnhn?=
 =?utf-8?B?Uk1SRE5SL2EwTjBUWmxlNWx3QUwralJnalZXUVZ5VmlPM3RRYTZtaUUvK1dO?=
 =?utf-8?B?MU1zVk5iaGZtU2RhSnlDSURyb0YxRVRqZ21qWjhiMjAwcEhZZnJDeDN6bmU5?=
 =?utf-8?B?WG1SVGtxaHpYSjFXSFRlaUNxTFFrUzExc3RCaFU2R1ljcTQvM1N0c3ZXenY5?=
 =?utf-8?B?d1ZQbS9sdUtia245R0NYY2I0Y2lZaTVIdXRSdG5BLzlDZ2w0aHFJdFNiN0ZD?=
 =?utf-8?B?Q2JLMWtGbjlmT01kejFEQWxaTmcrOUVMTm12am0rOSs2Y3FMclJiZGN0ZkdN?=
 =?utf-8?B?R3VGb0JXS0FxaXBLUjhVRnBsdEpKbkNScjRUcGQ2d3BUT3RsM1NLbnhMeUJR?=
 =?utf-8?B?NDBIanU0Z2tDZGxhV21xMXlkb2dYUWFxWk1QR2t2dWZ1bFMvMER1RmRITE85?=
 =?utf-8?B?eVk3UWlPNEhyZjR5SzhlVlRGcFBjOTBjeDVDMzJudFVGb2ovMFlKSGFvTG1z?=
 =?utf-8?B?Sjd0Vmw5VXplaGRHdE51bmZQYjY3MytDSGRaMVJmWHlBcW90ZmRBVldqQzZl?=
 =?utf-8?B?SnJ6bXNGbG03RU92SnhmRVhSempOUnFqTGpsMVkrWUYwb1hDWXJTODRndGxZ?=
 =?utf-8?B?M0IwcDNxUDhYTVdnTGpGYUhGblhRdTFMZkptQkViVHB6WlF3Zkt6bGVGaHBP?=
 =?utf-8?B?WjBSUFJJZ3ZtNW14WG9pYkNsdUFIQ2hlV3o3YjRiOHBjRHBwNTY2MXB2SHdP?=
 =?utf-8?B?dE14Zjh1U0xmYWJpSHN5M2dJVGRqeGdpeHFIQlc3eXFlUVZML3Fmb3NzZXhy?=
 =?utf-8?B?dVh4bmJ5QnpSY0dYeVJyclNpMkpsSHlQakU4THJxU0d4SWF6M2p4R3FndmJw?=
 =?utf-8?B?UURaK3VqTTJuVGRraU1zcXJSUUlTaUZKdEllU1dyVEtwaExZSG5kZTVMQTRB?=
 =?utf-8?B?dUhQaHFrLzhEODNySnpWVVVRdmNrVmEzUWdKYkVxaVVpS1RweHNPM3NadlBK?=
 =?utf-8?B?cFNBSUZqVFlkbjF2Qis5c0s3eDVadERlS0RQZng4aTdTNlFMa0h0NnIwRm1U?=
 =?utf-8?B?ODBYM2dudTFoRC94cUNOSkxBWmpvbFdsbWYvOGM5QVdnaFh4eU82VjBhTGM0?=
 =?utf-8?B?UXI1ZWxoRXlRVm04ZFNqWllDL0VockQwc2ZkNmhGUkFnRVM3c0cwcjRKcnkz?=
 =?utf-8?B?OWF4Ymsra0k0TjhpbG05SGllclA3eG5sbWpTRnBiMUVSNSthRWRKeDBEbDVo?=
 =?utf-8?B?dTIzbWlUb1lrTjAvN0FIdzYyZlFIM0I0WDhqRkxjUzhpS1NIbHdwVTQwYVR0?=
 =?utf-8?B?M2dzVkRVeVpSTURBT3M4V2s2SzJKWWdxeW1XMmpyYjBLNWtvUkVxR01BUDRL?=
 =?utf-8?B?dHBBaklSSG5sY2VQcWRnWVlJVVkrNnpwNzJKYjJzQnJwTEFwbEtEbWV2Vyti?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	STMBWjxl7covTyo9FuHeWo7BfIoCV4LaTg/DM4WHOe90xt9sh2xbh0coVvp0hABUcvicwJOxUgBGc1rP0bDDe4C+6r9EBmywHX06h8faa+n4VNThR8sliF9SqrYzjK6qDFG/gRpuHt7hv+dvS+IYg4PLf8PwLZS28fMA2Pv9YIs8coKuCuQ3kFJNLuhaRsTpwoaBGf7kbIdikGPmibS8jPB9x5t6+Q045Wr5qjPl5jSnH240JhLupfvglXglzRzZTGFBl8Ty5CdD92bYTVnHFCrJnnu6IwAVzWkmCQGY2b62iPpsJoOEn1iatknvwZS5MJI6d8jgzcTehE0nATmZAeTJHBVR1yeFIXa9U9nBKe+LbvML+QPLlDkiAGbq5n3ieDxCbX0wlRd4N5f3tGoVpCkWU88ii/R5qhFX1QcfmpcCxSZ0/RutrqapaxvFquGHXioS0XduuOKLALnM/qogkUO9G0cS5kBv05tCByT3Df1lhhmH4JGUMxsnLkcUbt/5LHpqxjr65s6ZiuvgHedKGkVSfR5GzgnCpLvEdmzOYHTTx/ynBdxjF0h2YFMQbq6VUkE3f6JFB7QDVlDy0LVEzHZ8NuRfi41Dcn+PuuNqCePcRRve494xSZM2JexbkMp79SppC213iu0lKIruaToMyLtuxvbRsdTEtC0WJqYYG64cYuTbRcAEH/d53MnVfQTjKykbIMoGQHFsDz+VVbBhSf3dMObyHcVn5kweAZPrFHr8OqqW5F6WqXIdzYheRlOFTgQSYLdZOusipXYqgWAeUAATf2/9zkw7myvzJKjm+gTPikVc62lrhQC6xn5I1VwdcpFDV4446SznyHIVi+ICsqEFLcB7Pk2C5ro9kCd8sJhnqQX9xwwexEpjOD7xH33xQEZde7cdeJzFOpBPufvTDlIHqWm17XkrVJ8s67IQHjw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bdd084-4450-4382-a84c-08db9788a609
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 20:55:36.4156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGFr+SILY4iLN3Czn29/QlD4PaVqblxRiPErpMBN0cTVV/1f0KOKALXBgjxzeekTZppV/IyoIx+u/t9sXXtT7leq/Ts5J57So7FT8QHIk6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6069

On 07/08/2023 8:24 pm, Stefano Stabellini wrote:
> On Mon, 7 Aug 2023, Henry Wang wrote:
>> Hi everyone,
>>
>> Following the release schedule discussion in in April, I am sending this email
>> to remind that according to the release schedule [1], August 11 (this Friday)
>> will be the last posting date, when patches adding new features are expected
>> to be posted to the mailing list by this date.
>>
>> Also, note that we currently have 1 release blocker [2] which might need
>> some attention.
>>
>> [1] https://lore.kernel.org/xen-devel/AS8PR08MB79919F9CE0B2BF80E7103FB592609@AS8PR08MB7991.eurprd08.prod.outlook.com/
>> [2] https://gitlab.com/xen-project/xen/-/issues/114
> We have another release blocker in my option:
> https://marc.info/?l=xen-devel&m=168312468808977
> https://marc.info/?l=xen-devel&m=168312687610283
>
> Andrew, would you OK with making it a release blocker? We already have a
> tentative fix from Julien.

Yes that is a release critical/blocker.  No it's not a fix.

~Andrew

