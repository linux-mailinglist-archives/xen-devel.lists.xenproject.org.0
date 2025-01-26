Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0396CA1C66C
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 07:19:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877155.1287322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbvyZ-0000GJ-3U; Sun, 26 Jan 2025 06:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877155.1287322; Sun, 26 Jan 2025 06:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbvyZ-0000DR-0a; Sun, 26 Jan 2025 06:18:31 +0000
Received: by outflank-mailman (input) for mailman id 877155;
 Sun, 26 Jan 2025 06:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+Qa=US=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tbvyX-0000CZ-00
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 06:18:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58d73b64-dbad-11ef-99a4-01e77a169b0f;
 Sun, 26 Jan 2025 07:18:25 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SA1PR12MB7125.namprd12.prod.outlook.com (2603:10b6:806:29f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Sun, 26 Jan
 2025 06:18:20 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%3]) with mapi id 15.20.8377.009; Sun, 26 Jan 2025
 06:18:20 +0000
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
X-Inumbo-ID: 58d73b64-dbad-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ai9BI/dq70dYxwXnRpnoJLz1t4alxFlhi/8kOU/pCTuXeT1DJeK7QyLA+E82O8YVJ+OaYFvVBpCodg3RyQOVkrHBPWE9b6TXh/Yc/MnPb9dWFtgBJ8VAPKyzhQ7CVvtmWmaUUmMlXmo/yg2E5GzTp/LjU3aLUktkzso+bI82trNCjljzfnOckc2+3PzjnNx/P6rWxkp9CwwJ5xXZ1/9JT/Jn6SChyNlfS+x4ntGguSm1VnRKbnYOfjn/Hhl3XRbD6L83Jsw1opjB3Wud3q1FZZ/PfnhV92UAFsGa+H7qjQLMkLoVNy30bXEhRtDpn/CNCbicOFluE/ybZKnjSumynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMI2dI7n/rB8+PxcfxXFwCj59zzPoInHpIQu34CHdYE=;
 b=ZoEaPClvcCNrq5r0UOrWmNqRV+wyz26jazXydkc5QDu1xvuaY37GrI3lV6NQrW+iME322sxTqG8MFEuYQsaQzoMhjM+/v/KhDMwACD5n7KkAvL7i9xtupXLDPCDLtCR7AYQs1genAMRB36dmlH3Ok4ogdXWxHsuTK4j3EWcooNPXsq6imze+MIqlUdr2lXQe/DRTCc+UxWjyuViXSCGoIB7YuloIAYNiFplx97pIZXkKibkBc9uJufFcXAqMDRf0Kjg5eED7ld7zqlVtOaJ/1Sli9zb0YvRBTwkWIYtzK32yZKwlPDD/0HzqqnPVcI1WU0EJS1KY1rHtiEyRfnZ5ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMI2dI7n/rB8+PxcfxXFwCj59zzPoInHpIQu34CHdYE=;
 b=bkUQOJeby27E6y/ACN5tZbkwumLsaRI1gegwqiFr10bxRJSbMwyOXiK3bxDJmMOnWQqohdoV8a6kp4Fzlj9uB+TVznmZv9ma4ABLD/RKNUYHcZYuhTtrTRaAHvH00JY9ZF/GH/Bis3hw9Xic0DTjgcIj9ziNGE3IesVXmH48BZ0=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Andryuk, Jason" <Jason.Andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 09/11] xen/x86: implement EPP support for the AMD
 processors
Thread-Topic: [PATCH v1 09/11] xen/x86: implement EPP support for the AMD
 processors
Thread-Index: AQHbRVznRa/Bwz7xKUirr7NfworPsbMOizuAgBpVwcA=
Date: Sun, 26 Jan 2025 06:18:20 +0000
Message-ID:
 <DM4PR12MB8451D5C244F3087963CA9FADE1ED2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-10-Penny.Zheng@amd.com>
 <3f688a4a-c95b-4852-bc0d-089336a5e6ef@suse.com>
In-Reply-To: <3f688a4a-c95b-4852-bc0d-089336a5e6ef@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=764e3bf6-b76a-4c11-81d9-b0c72bde7b73;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-26T05:47:59Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SA1PR12MB7125:EE_
x-ms-office365-filtering-correlation-id: 138a5cf0-83ba-4c63-aa04-08dd3dd13ad4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UnFTN3owaXJ3cVloczNyL2ZzdEZURUxtbU92aVZTRnJmM2lVVlRibTJwWDhB?=
 =?utf-8?B?YWZhMXVaelZ1UDFGbllXMzY3RUNUaHlOV3FrU3dlU1p3SDdINzFwN1QrMmFC?=
 =?utf-8?B?b0YxRUxwNjRqZTR2ckViakJOdnMyQlUrZnFWUVpGQVlzN3EvWWtPUnN6Ymw4?=
 =?utf-8?B?cFNneGdYeCs5Sjd1Q1hNd3FjZlY4TGNZaThsano3VEp1SUJIZzRRS25SZE5r?=
 =?utf-8?B?b3UreUJ0UTIrR2ZwTkpsbmFESXZPRXl6RkhNNW9DVXo0RXphZENwdlpoV3NM?=
 =?utf-8?B?S0Y0aW41RFVEOU4wVHY3bU5HWUNyRXJFSVdycTJrcjEyOTdERm8yMWFIVzNL?=
 =?utf-8?B?OERDSkpGcG9DUGZpNXRBYzY4Q1N2SU9LUnFvYnNsU0FSTlBXRzNUS1N4YkVm?=
 =?utf-8?B?MHFmZGtVVlVDVjh3WVBXSE5TS2JXdGwvQkEyam5LYlQvSEx5L0VxZnk4Tllu?=
 =?utf-8?B?R1JRTnV6c2JPWTViRnk4eG1WTTk1MWxVdjZTeWJuNzg2REJQOEllOWJhcmJ0?=
 =?utf-8?B?Nm9SNGZuOHEyeEVsaUh5M1lSR0gyQzY3UStSbUx3aEVpWTA3UTljYmdhekM5?=
 =?utf-8?B?OURjWWYyRjJ3VjRvRlJEWUFJRWllelBXT2pwZnNOaVdSUVhVbmIvd202aS9r?=
 =?utf-8?B?bSt0RFEwWkZiUFNxK2R2OWVER2txM0NhdkYvVGhuSGFMVG9HTzViZkZNREVo?=
 =?utf-8?B?MG93RnhPakg4MjlZTUs1UE1zUHY5QnZkeU1OQXR4RGZPa3hvMnJJdlkya3dC?=
 =?utf-8?B?UFRWZGg4bGE2eWtRMmRBUUpkNjJMQzB0SG1icGl1aXhCUDBzdEd2MEZ1czQx?=
 =?utf-8?B?Q2xVaFBHRnhRVGo0c0Y5ZmZ3K3EwY3ZkWEhONThrK2xZOFN0UGRHcTcvd09a?=
 =?utf-8?B?R1hkLzJMRnBveGw0a0V5cnhTVUsrNGpTVVIxamQrbDFmSGVTaWJmdU0xcFpV?=
 =?utf-8?B?TzZ6R2RiUUF2MGhEcFVDU29ISDVPaFRoTzNpTmwzOUNjcE5lWElZL1h1SXlo?=
 =?utf-8?B?RnBWdmJTVW1WTlRDOVRvdUdKUHc4dW9XQ1k3Y1JwcUNxZGhFWDUwV0NvU3Vh?=
 =?utf-8?B?T0ZJWXNHYTBObFJsZjBXazJ1NW15cUZzcjM3aCtMRlc0ejhPVkwzYW9pMVBS?=
 =?utf-8?B?a1ZLSTVUYm4yM3lEK0RuRUxObHpEaHRPTmZzckc4dDZ0N0lQSDJFb1pJb1Bp?=
 =?utf-8?B?azRzcjdjbU1kOVA5MUMvRWtuRmowRU10eGVCNGNvWjFPOXhiVmI0TVdmcWwy?=
 =?utf-8?B?TW9EUWZpMXo2ZmlKZUd6cnlvdG1rM1NIa09sMmxsWVF2YXN2dkU3TFlYblN1?=
 =?utf-8?B?QnpwWFF0YzBFR1Y5WE1teVFMRC8yczE2d0R0c0RBdXcyNXRjcXBKVUdkQ092?=
 =?utf-8?B?WUs3cTZOd3FJcmNhZ1hwcVdpcVhNNmd3V0FyQXMrK3A3cVNOQmhwdDAvWWlK?=
 =?utf-8?B?VGo0OU9NTXJCWlBsVk4yUkdHb3BzUjB5NEU5YmVWSmVHSTh1OVZXVlM0OTkw?=
 =?utf-8?B?dG5CUWlQc3c2d1QxdTVzYUkxLzM1dXUyM0ptcEVxSFRDTURySWM5M0RQVEhE?=
 =?utf-8?B?eFF2eCs0WDVTSzRSNEFJZkZjVUZISW01QS9KTTNHOHk0WC9lNGdSZXdVWWNU?=
 =?utf-8?B?RjIzOWczVGsxRVV2SVB6dEt4RWlHbVpYN01LeHFEZVJHUlBNc2ozUEEwN04v?=
 =?utf-8?B?bkNZZE1LSkZMcU42KzZEVHhMd2VTTzE2UC9oME00Y0lxMGk5aDQ3NlhIZDZ1?=
 =?utf-8?B?cmw3enFCQll0YjVwdm5Uc2hpY0VpdWkwYlFWMnJyc3BHRm16OXVtVVRtcG52?=
 =?utf-8?B?cE1RbHplV24rS1BzQ0JtSldYL1dVbU9UL1pCQXNPdjZtVEUwTXBpYzBaM1lJ?=
 =?utf-8?B?aitscy9IYTY1d29GY1JNUjRaVGtoZzJwZlhWL0FkK2pTWWZ2YjdTTzFWVERG?=
 =?utf-8?Q?66l8QLmyR4fY6InwMgXohBJ6YVXEP/fX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3NtQjFXM3hnekYvWDRobk5KU3dWN281M3dlQkJmaldxRm56eU1PYWs5M2cz?=
 =?utf-8?B?L0FPdTJTblZnKzlkZmpOUG1mUzVjdmZBR1JHcytoSVBZbHovb2RNYmpmbVdY?=
 =?utf-8?B?YlMwT1pHeU5XWm1HOEpuSytkcWJqb04vZVRaL2ZpMGhuSXplRjNCcWZ6eThY?=
 =?utf-8?B?eGtCRHJLVnp3bElIUDhxV2RHeDhleUU5dGFLNWNyWVlIcldwT2R1L1NaYW1l?=
 =?utf-8?B?M1gzUjJRNXBLbmxVNk5KbnYvazNCOVlGVzYybCtkb0ZDOVVmWXRvUDAyU3ow?=
 =?utf-8?B?dDFJS0F1dWVUTTRPTjk0dE9mcHhhYjV4R3RERkZ1cTlyR3AvaUR6YXpRRC9u?=
 =?utf-8?B?bndYcjBiWjF4cDRTZ0dWZWpmREZMNWtidG5LRDhOakRxZkVBMlBhQURYd3Nn?=
 =?utf-8?B?aFJTbWpGYVlQZ3M5Lzk0cDhvOFJweTFzdy9XQ3ZyY09qamZPK3YzbTFuL2x4?=
 =?utf-8?B?dktlMDhOb2cyZWl6d1l0L24yZ3VUdVVhNGZ5Sm0rMFBwQUkrRGdnTFhYQit4?=
 =?utf-8?B?TjVwT0x6VnppWllJMkFFdkp5U1RNSUFQZ3FwTFJJMnJQTnBNWTJDbmFwRzVl?=
 =?utf-8?B?cUk4WlVTRFRYSHBSWC9oQmhXNk1yNGo2L05YdjY3aGt0eTRhMkl6Q0ZyN0E3?=
 =?utf-8?B?bDlrQXAyOFI4NGpWRW5qQmU0YTFiNjVzbkNzNGtUQXdGKzdCdTZld2NaRzdp?=
 =?utf-8?B?NzU4L2VZaVAwSDdncTNsejgxT0ZRa1BsSVFDOTAza0xmSnlFTDlNV0RTVGc1?=
 =?utf-8?B?NWRNYy9KRjlDYXVacy9Xamcra2dwVTZnZ0c0bVB3SkJLcjAxY2tSSXpoUmkx?=
 =?utf-8?B?TE96VXA2R3lBU0VSNnFpQk9VbXlpMkpkYms3UTlTVFdxNkVwODFmd0RtWFFi?=
 =?utf-8?B?RGRYK0VzbzlRY1NiN0g3U0NIZEpuN1FCMkNMZVlzUzI5dlp2NjFMeUhCRDc4?=
 =?utf-8?B?eE5udlJVaG1sbHc1UUVyQy80SFlva1Rjbm5heWtSZ2VoVlVsV1VYSStZanpK?=
 =?utf-8?B?bGtLUHFNQmRTWkdtajI5amFRVndnbmx0MUVYL1VMSExWOWlqQTdCK2FWMTBR?=
 =?utf-8?B?RXc1WkJUMmhpSHpEc2FsUWF4VE5zUVhkMzh1eUlqNHRheG04YitKK2tqclRX?=
 =?utf-8?B?VUJrU3NDZCtLMThGOGJoNHNBZXNrYTlwaDc5eWZHbVVzTXI5NnhZWGF1M2dK?=
 =?utf-8?B?SFJza1IxbzVOMGhRNXhwQ3ZWbGZlY3RlUGRqZUJGQTJmNlcvRXgwU2FlYmpM?=
 =?utf-8?B?YUhJcTJJeHpsenUyMjhXWGoyZm90WnBseWdOa2VLS0FyN25hZ3pLVjIvQm42?=
 =?utf-8?B?cEF3SVNoVElZMFhwTzRBR0l6Y2R1bVloVkE5UzNGWkpUcGwzK0FWTkRCdUNj?=
 =?utf-8?B?OS9IMHBRSW9ucndQejJQY3BsR3ZPSU5WY2JtUFpad3RrZXhOUVFRVWZaTTha?=
 =?utf-8?B?Zyt6Slp6aXhrT3VFNE1QVlEvbkFDOGxFNXpFZmxUelAxcC9INDJ2djRnT2ZD?=
 =?utf-8?B?NGQvUzZmS3Yrd08zVUZRZE04N1ZyVXU3dFRaMDA3L3FzUW1ES05ubTRlNXZY?=
 =?utf-8?B?MlUrb0E5bVpQcmJjcVhQMEhvZ2RVY3phUVRRWHJBL3pkaVBCNzN3TVMvUGRJ?=
 =?utf-8?B?bTErQklHNGhNNm1LUm5Wa2h2cWxaNXVCN0Fyc0lueVNQdTNZZ2dralU5Qi9X?=
 =?utf-8?B?OWcwblpJd2xwU0hvTDU2SmVnZmxBYkNvb2xNK3FBOVhGWEIrK3d5eUh3aTZT?=
 =?utf-8?B?c2k3a3FsOXlIdzNsVHBldnBkUGxFMzJXUHZSdDEwSlczcWhncS9VSVRudW40?=
 =?utf-8?B?YW5MZTlvZVp3Z1VUSnhkK1VGbmk0TmtkU3Vtb3N6SjhYbkMxYmtRSVUwQ0pz?=
 =?utf-8?B?dXVOZ05RbkY2YmljS1FjOGdkcWt5WmVaQm1VZXpsbU5lN3ZrNkFhUlp5V1Jz?=
 =?utf-8?B?SmZ2OGhEWlRoR0ZFVUhHSmNxS1h1TnJMbFQ1UFNqY3VESmU4bkRPN1pDa0JV?=
 =?utf-8?B?UnpDR1AyajdXcXRZanFzNnJnVzZpS0hWT1NOVDdNV0FPZ2FjQUE2TUc2a1da?=
 =?utf-8?B?bnkwSzE1eGNXNWJUVitLYzZPYTFwakdEQ1BTbW9kM2ZLTFFJOXVLclZmVlIr?=
 =?utf-8?Q?pi0s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138a5cf0-83ba-4c63-aa04-08dd3dd13ad4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2025 06:18:20.0513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lUgJUs+T6UlA9kLkssmt9pwdXVigd9ahb8a/ySfhSbYT8lxBPllVUKirI40KzKpJ3oaHYU1pxLbPD437yr22/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7125

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSA5LCAyMDI1
IDc6MzggUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IFN0YWJlbGxpbmksIFN0ZWZhbm8gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPjsgSHVhbmcs
IFJheQ0KPiA8UmF5Lkh1YW5nQGFtZC5jb20+OyBSYWdpYWRha291LCBYZW5pYSA8WGVuaWEuUmFn
aWFkYWtvdUBhbWQuY29tPjsNCj4gQW5kcnl1aywgSmFzb24gPEphc29uLkFuZHJ5dWtAYW1kLmNv
bT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEp1bGllbg0KPiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4
ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djEgMDkvMTFdIHhlbi94ODY6IGltcGxlbWVudCBFUFAgc3VwcG9ydCBmb3IgdGhlIEFNRA0KPiBw
cm9jZXNzb3JzDQo+DQo+IE9uIDAzLjEyLjIwMjQgMDk6MTEsIFBlbm55IFpoZW5nIHdyb3RlOg0K
PiA+ICsNCj4gPiArICAgIC8qIEluaXRpYWwgbWluL21heCB2YWx1ZXMgZm9yIENQUEMgUGVyZm9y
bWFuY2UgQ29udHJvbHMgUmVnaXN0ZXIgKi8NCj4gPiArICAgIG1heF9wZXJmID0gZGF0YS0+aHcu
aGlnaGVzdF9wZXJmOw0KPiA+ICsgICAgbWluX3BlcmYgPSBkYXRhLT5ody5sb3dlc3RfcGVyZjsN
Cj4gPiArDQo+ID4gKyAgICBpZiAoIGRhdGEtPnBvbGljeSA9PSBDUFVGUkVRX1BPTElDWV9QRVJG
T1JNQU5DRSApDQo+ID4gKyAgICAgICAgbWluX3BlcmYgPSBtYXhfcGVyZjsNCj4NCj4gV2h5IGNh
bid0IHRoaXMgYmUgZG9uZSAuLi4NCj4NCj4gPiArICAgIC8qIENQUEMgRVBQIGZlYXR1cmUgcmVx
dWlyZSB0byBzZXQgemVybyB0byB0aGUgZGVzaXJlIHBlcmYgYml0ICovDQo+ID4gKyAgICBkZXNf
cGVyZiA9IDA7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCBkYXRhLT5wb2xpY3kgPT0gQ1BVRlJFUV9Q
T0xJQ1lfUEVSRk9STUFOQ0UgKQ0KPiA+ICsgICAgICAgIC8qIEZvcmNlIHRoZSBlcHAgdmFsdWUg
dG8gYmUgemVybyBmb3IgcGVyZm9ybWFuY2UgcG9saWN5ICovDQo+ID4gKyAgICAgICAgZXBwID0g
Q1BQQ19FTkVSR1lfUEVSRl9NQVhfUEVSRk9STUFOQ0U7DQo+DQo+IC4uLiBoZXJlIGFzIHdlbGw/
IEFuZCB3aHkgaXMgdGhlcmUgbm90aGluZyByZXNwZWN0aXZlIGZvciAuLi4NCg0KQWNrDQoNCj4N
Cj4gPiArICAgIGVsc2UgaWYgKCBkYXRhLT5wb2xpY3kgPT0gQ1BVRlJFUV9QT0xJQ1lfUE9XRVJT
QVZFICkNCj4gPiArICAgICAgICAvKiBGb3JjZSB0aGUgZXBwIHZhbHVlIHRvIGJlIDB4ZmYgZm9y
IHBvd2Vyc2F2ZSBwb2xpY3kgKi8NCj4gPiArICAgICAgICBlcHAgPSBDUFBDX0VORVJHWV9QRVJG
X01BWF9QT1dFUlNBVkU7DQo+DQo+IC4uLiB0aGlzIGNhc2UgKGUuZy4gc2V0dGluZyBtYXhfcGVy
ZiBmcm9tIG1pbl9wZXJmKT8NCg0KSWYgd2UgcHV0IG1heF9wZXJmID0gbWluX3BlcmYgPSBsb3dl
c3RfcGVyZi9sb3dlc3Rfbm9ubGluZWFyX3BlcmYsIHRoZW4NCndlIGFyZSBwdXR0aW5nIGNvcmUg
aW4gaWRsZSBzdGF0ZS4gVGhhdCdzIGhvdyB3ZSBvZmZsaW5lIHRoZSBjcHUgY29yZSBpbiBMaW51
eA0KYW1kIHBzdGF0ZSBlcHAgZHJpdmVyLCBzZWUgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9jcHVm
cmVxL2FtZC1wc3RhdGUuYz9oPXY2LjEzI24xNjQzDQoNCj4NCj4gSmFuDQoNCk1hbnkgdGhhbmtz
LA0KUGVubnkNCg==

