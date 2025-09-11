Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2AEB529B0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 09:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119430.1464796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwbXG-0005Jd-6k; Thu, 11 Sep 2025 07:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119430.1464796; Thu, 11 Sep 2025 07:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwbXG-0005I5-3v; Thu, 11 Sep 2025 07:16:02 +0000
Received: by outflank-mailman (input) for mailman id 1119430;
 Thu, 11 Sep 2025 07:16:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVGj=3W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwbXE-0005Hz-LO
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 07:16:00 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2413::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29f127cc-8edf-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 09:15:59 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA0PR12MB8929.namprd12.prod.outlook.com (2603:10b6:208:484::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.30; Thu, 11 Sep 2025 07:15:55 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 07:15:55 +0000
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
X-Inumbo-ID: 29f127cc-8edf-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Br7WOojWgTIQCeBpM9rtbYGVrA32wohHluU+479m3yO+LEywrXynLAKOnYLqFTPihWNjLbaQ8rpguq1Kp6Q1sCqVHOLU6hiUhabQVu1NuwSjJ+0HLylRv1pY+5Gh9EQCB412xiBbAn+RlnxzNwkr4FWZXWlm3YjiQK9kMLx2aAFpuGjMwmg+3yiDQY0qdYd8bRP/FMs5sFXSxpezrkmRhtEAsj0CwNHYkSbQ0pZRhE1sa4//pcJorzUUQzBbOzrzMV4TloYQI5XSlCm3RJggyI/6jobGexX4UD+jmv7RJ/popPnGn9z5FVdMQWEzpKEjAyoY08DB5HFD/M1WzrDNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akXXZmOus3534TwnnQZvkOuf3V88X7Jud7UbWM7gcPs=;
 b=wkFCYyjAqFqsvcpIaLJ6gUTFRRAezcGD05le9CIufYOPzTd6xLZ4UioKJ38rghPhNC4idv01+9HjRZdvG9qWIWw4dNl+DGttDWPGW+IzvzZlSoD41f0q8AKSTEO21uqGQWzz3sbeUJWXHezsH47o74pRUqTKWO///iAu8AvE5ZGt6Kdep2WnsI+PfqIxdgbYc8/LjDoAFFff0lLGkCKAvJJSz3Ow1Hdb9uKRUeRrLu0xl+Vsdd17spglBMqmrV403eZkqqPkHM5YnBJsINyrCEffL0akqeHntBOIUsEi3sMOqvUNDn8u68nLgU93QMDCxE2EQ8GjwF17TbD6XpFqZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akXXZmOus3534TwnnQZvkOuf3V88X7Jud7UbWM7gcPs=;
 b=Aj3s/GwooIz+EuQ+/7uhIyD6MuNwditB6t40DdkL18BZyFX8M4Qf0j/YNNMQTDQ5XgmbdAx3EQBBCVaapFhcEEOg6P3RN7HCnhSbCeHBbwrnY2byOIffmqlIMLi+2Hu1B5yb+H9IJ6/JGQ3DTeK9//bG5G5Hy+U8BkSk2HO8+WQ=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 03/26] xen/x86: consolidate vram tracking support
Thread-Topic: [PATCH v2 03/26] xen/x86: consolidate vram tracking support
Thread-Index: AQHcIiYBT2pZeRIoyka2sfY1lhJyobSMdHkAgAEcX0A=
Date: Thu, 11 Sep 2025 07:15:55 +0000
Message-ID:
 <DM4PR12MB845197AF26CCC286C1EB1F19E109A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-4-Penny.Zheng@amd.com>
 <e4a0f7d6-6c8c-41b2-9bb4-19f2403c7d3d@suse.com>
In-Reply-To: <e4a0f7d6-6c8c-41b2-9bb4-19f2403c7d3d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-11T07:06:27.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA0PR12MB8929:EE_
x-ms-office365-filtering-correlation-id: 9e30b41f-1227-4b1c-de4f-08ddf1030c63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dFZRdXU1Q2lpZk1Da1RjQXd4b1hmVGswK1JmMDcwL3ZXSmQ3WWZNSlc0YzM2?=
 =?utf-8?B?R2lWNEFkb09rSTVERVVPeVhzWE45dGY5bm9sdGxMemVvanVoT1JqZmpxRFdH?=
 =?utf-8?B?c2l3cXhzVmJOZnFwVzE1bmFUQWZLOVFJMnJaWEpTc0s3bExhMVNFODN6aCtX?=
 =?utf-8?B?ckNMTG43bWdKZ2lsR3ZNMWI2bWdhL01MYjBOdXJuNWh5VWRZVGpaMC9qWkpy?=
 =?utf-8?B?dVEvSUYvOE9LWi85cWVhYjlHbU0ycGN4YUl1TTg3VkFKQmVNeXZvQk9jOHJQ?=
 =?utf-8?B?cjBwZ29PZXJGc1h2SlJBL3NKVmlrNktZRFFhQnZPQStaN1lnWG1pR2EvbjNi?=
 =?utf-8?B?eGlNeDZRK0l0dGlqMktpMDhsMjkyb2NUeFd3TkZpaXB6VGYrVWtjNkZxU0h1?=
 =?utf-8?B?dXpFajAwUUhQRlNqTG1sa2JMZFc5WWVJK21rV1VJTWYwYnRjRzJaeXFXVlI1?=
 =?utf-8?B?T0ltbVllVUxkeUU0NVU5cHF5M3RFZngvd01YQXh4RWtzdm8vSDRGQUIvQk4x?=
 =?utf-8?B?aGE1VnhSRXdydEMzNEJ1OHVSS3ozNndUYjFnZWRjajlUbFJHMDhwVUdwMzI1?=
 =?utf-8?B?T1d4T3haL2tldXE3VnlJaTRQa1U3MXRZYUQ1T0lTMlltZHNRakh3UnMrSDJk?=
 =?utf-8?B?L29jUGJzb0gybThrU0pBZHorak5IUGhCdjFQNHVyUC9lVHZRdFVjcUhScUg1?=
 =?utf-8?B?d3hqV2JhRlFMWGFOMVkrdXBISERxTjBISEt4Rm9POWdaZEtmSS90Q05EQ2R2?=
 =?utf-8?B?SkV4QkVhL3QyanE4d0NSUEhlUUdKbzM5OUZFeDFmRzh4VVBMZGlmcmZEUG0r?=
 =?utf-8?B?YlJrRU1lOW9Id3BFU2hOK1FUMzcyUCs5RDJVaU1mcmVQRkpHZDFoRG90Tldo?=
 =?utf-8?B?Q3NuVGlWNzB5aUJxWnFGVjdXWXB6anFacDI2Z2VUbENBS0pvUmt0bFZmbkVa?=
 =?utf-8?B?V011akxsaitOUGtSc0Z3d0lUcS9aVm1HRUZPVUpUZTVCQ0ZMei9zajc4dTRT?=
 =?utf-8?B?cmZKb3NnczEzdk9CcW5tYXIzMU1tS08xelJQc0lYdDVyb1cySXU3cXc3MlVV?=
 =?utf-8?B?V1JSNHlRVTRLVWFGR1pSMVk2UW90UTBtRG5uOC94bzdNSkJUcUZwRmFyZ3ZV?=
 =?utf-8?B?dE83ZFJJdHVGREt5YnFTQlZGTUN3b0hxZVg3cmJJTlNpSWdoSWFUb3h0MVEy?=
 =?utf-8?B?RnkvN3N0S3o0cS9JUm5WU2tsaGsyc1RBVUZnMVhFcE1TREZ5R3N4V0NhdDh4?=
 =?utf-8?B?eVkvbWdxbDQrYSs4TUlMZS9tenVjTmREMEF5WCsySmgrWFFuNmFUak1ZSG1J?=
 =?utf-8?B?RHFOYkMvQkQxSTNONUhXdnJwa2pvdGxaeFZ3WU14N1E0WGFURVNFaXJLMys2?=
 =?utf-8?B?NWZTZVVENUVwQWVTVitjN0J4MHhVVmZ6VzFuZElsT2tZYWd3bzd3a0VlWGhZ?=
 =?utf-8?B?TkpzK3Rpa0l5bTZnUWZrNml3S0ZDcnhtNHAvSmgyMU1SOUpXUTRzTkZEaUgz?=
 =?utf-8?B?eFpjWWh6YnA1UTU5L0k2SjF6NkY1ak1ZeGhrYnRqT3JoczMzSjZPd2tJRWQ0?=
 =?utf-8?B?dVRVOUlFYjI5QjRJNEtUYTV4Q0t6NmtDbjdnaEpvRGtxdU9VdFVZT0ZxUURF?=
 =?utf-8?B?UWlYamFuMWtkM0lGYzlvWkxVdTFHVCt5STNXbk82OXBFaGkxZ3dnMjdDNHc0?=
 =?utf-8?B?U1NyWHU4V2FGaHhzSE5uRGNQR0dyT2RObTFFc2M2eVFyWUNqa0hEdUJieFNt?=
 =?utf-8?B?ckIzWHdjQWFyMDZUdlBmZkZyRVJ4R1cxRmdCd3JpREdGZjR5OHdqSXN4RnZp?=
 =?utf-8?B?Rkd3ODU5bmcxWU1GeW4xMTB2S2ZNNER0VFVYNUluNk80Tk5jRkRzaU9LbmFj?=
 =?utf-8?B?VnNzYzVkbEVNYkRmdEpvSVlwWDZlYUZxc1NodTdQM0syRzViUUpEcXdXNStp?=
 =?utf-8?B?eGh1WDdlS1ZTTGNONEExTnFzTGpZQWZVaFo3L1dOYm1xQmR5Smp1NFcvREFl?=
 =?utf-8?Q?TXxtEabq/rNN2zqR/h1XMBFJWN0f6Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkM0dnNzNkFWeGJjQ01obk0xS3F0QktWTkJpM3gvK1JMTlNLZ3JZeUtBSHlo?=
 =?utf-8?B?MEhFclk5S24vSXJuRHkycjEzNDY4c3JiR2MwQzFpZ2JqdWQvYklKYys2dGI5?=
 =?utf-8?B?ckRjNFZWbk5NdEZrU3J0cDg2eWhJNkkvaFdQc3FsU0ZqVm9RQ0llT0pJb1VW?=
 =?utf-8?B?Q3dvcEpiSEc4cnZ5QlBrc0praG1hbHBEL0I1QlBIVTdxSmZ0dm9YNFM5dytu?=
 =?utf-8?B?c2l4Q3pLcUJvaWorYTVmVk9pYVBMWk1nbVRtQnh4eEl0WUY4ZW1RMjNHRVJF?=
 =?utf-8?B?RUhBRmJjSVhSZmdxanRWM0ZZN04vN0thbWU4Rmg5RkFQM0Vza2lLTWJ2ZUdv?=
 =?utf-8?B?ZVRsZklxYUFJN1YxUHBRaU1IYkt4dEpWR0IxRGp4S3UrVVN3OVNzNit3Zk84?=
 =?utf-8?B?aHRscTJGb2VOK2xFdXpuQ2NMMUFPNkMwc1dPZUxFc1M4SmhmYTFBZTV3eERi?=
 =?utf-8?B?SlNWVnN1RWl0WHZuZW1Sdmk2YUE5aXVITG1hamVxUnZoNUo4cFdmSnNXamhG?=
 =?utf-8?B?aGI1ZWp3R1lFMkliMStuVXU3UUlsaTF5dFNxMnI0VkZJSkl3aG9KVEpVWUxP?=
 =?utf-8?B?azhTbFd1eTRKUm85ZU0yS015QnRxWUM2ZEsxQXNwTDF3WEFJWG1RaHN4azdY?=
 =?utf-8?B?U0YxemorbmIzY0FWT005QlhOTVQ2SDFXTGlWWVRnYVB0UTRGWmdYWVZwL3Zh?=
 =?utf-8?B?WkVOdEd1MnM0QkxTc2xrYXE2U3dVVHhlcTc0TlFlckxRa253bXZCV2xJWWVX?=
 =?utf-8?B?QXY3VzZXM1VybEdTUmRQTlZTZjI4M3RIRWR0VWZhMURQV0lGUmRvZ090bHJm?=
 =?utf-8?B?NUJYVVN4eTVYbkhUV2UrTzgrajF0UDltOFJqTmJMOVUvUGJSN3NzOERzYUlt?=
 =?utf-8?B?cTBPN0JSTjlVYnV5VEFKb2xiTlNuNmh3K2NQZFNIK25qZms0enM1TTBka05B?=
 =?utf-8?B?VXJpYlI2blZBOHIzZHpEcUdBVE9jVm5VTk5kV0JBVytPeldwWllOREw3SXd6?=
 =?utf-8?B?WTBWNXo2Q2FudzI3bUxGVkVQb0lFNTJ2TWI5Nnc5RXZNVEJpVFJhK2laSC9t?=
 =?utf-8?B?SGtMSExoSHUyei9kakRLZ2g1eHVBc2FWNGlacEdsODRLSm82V0hXc04wTFRz?=
 =?utf-8?B?Q0JYYlNkRnMrbzM0L0JmTnZaVllWcmxHUGlyKy9Nek5LejJ5SVBrNlIvL092?=
 =?utf-8?B?RENyQWIzRUdTbCtjWTVadDAvSEdVREt5aUFzUTdDSW1SMmliMFR1YlVLUFRU?=
 =?utf-8?B?YWFnbnF6OUlaSHN6ZmRRTTJEdVJWT3NVRHkrY2JuRll2TEdRU2pVU1VBM1Js?=
 =?utf-8?B?TFNnWGpUbVFBRnJCUGRsUFo4Rm91VjROcloxbHZHSlB4WGs5SDBpVWVVN0FO?=
 =?utf-8?B?aGxSWm9TUTgvcGExUjRJbVhMSzNmN0k2K3V1SmVpUXhtcm9UYTVSbnZhSllo?=
 =?utf-8?B?ZjN2S1BEWFBBKytJSEhOQTdPZTY0Y0tzdmRtcUlvRGVlZ0VvQ3REbStIYlZx?=
 =?utf-8?B?bVJmL2hkWmZ5RTkrbnhSTU9FMGI3eUVnTTNXcDR3L0tRajZYYXpxT3V5d2dE?=
 =?utf-8?B?TVEzeGNRZkZJVGo2dGYxTmJsQWZTekMyazhlZW1tS2IzK2NBaWIwT3oxdWo1?=
 =?utf-8?B?cERCY0swaHhESUJpK2VzVW9Pa0RiNkFKS002a2JRLzFZMklnN0ZzMlYwSWZh?=
 =?utf-8?B?MG5veTdkblhqNU9OUmFtOUFXd21DaitLQXJPaU9kVDhmZW5JMVZRWDQ2Q0I0?=
 =?utf-8?B?cmYzdERHbVF2Y0QyZUd0RDZjUnBDelo3ZUkzNHdQR2R2S1FjZWZJbFZXbTFG?=
 =?utf-8?B?S3FGS0lFZkRQMm9LQVpKd1Vnc2Z0eUY4MlJDblFDMkhlNFFtRGViTW5ZQXNj?=
 =?utf-8?B?WWs3emNJdFIwbTJnRllGRTRNU0gwdVc3eEo0YzhseE5jTGc1bjIydkNTTHBW?=
 =?utf-8?B?T1Y2ZzQ0WmFDYUVvL01oN2IrSTNFQVpUMkdJWXNmd1FTZzR0bklseW5QYXhm?=
 =?utf-8?B?Q2JZNjhwYUJQWmZtS044L0FTSjZhMVhzTFI1U1Exc0JPbjMzeTNrYXBlSTZo?=
 =?utf-8?B?MEdHWENHYlJwWVZtUEd3MC9HTkpHbXg4d1BIN3dwaTlacWxMaHJ6UDlOd1lm?=
 =?utf-8?Q?w52Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e30b41f-1227-4b1c-de4f-08ddf1030c63
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 07:15:55.1285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6NLEnqI14iyiap+xnD2gHSmz3XoFhsIEzy4Ewrm6G3wKMe9GD0shYbjui+dpPlOd0TxcNMpDBcs4DhlnXAZR0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8929

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDEw
LCAyMDI1IDEwOjA5IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAwMy8yNl0geGVuL3g4NjogY29uc29saWRhdGUgdnJhbSB0cmFja2lu
ZyBzdXBwb3J0DQo+DQo+IE9uIDEwLjA5LjIwMjUgMDk6MzgsIFBlbm55IFpoZW5nIHdyb3RlOg0K
PiA+IEZsYWcgUEdfbG9nX2RpcnR5IGlzIGZvciBwYWdpbmcgbG9nIGRpcnR5IHN1cHBvcnQsIG5v
dCB2cmFtIHRyYWNraW5nIHN1cHBvcnQuDQo+ID4gSG93ZXZlciBkYXRhIHN0cnVjdHVyZSBzaF9k
aXJ0eV92cmFte30gYW5kIGZ1bmN0aW9uDQo+ID4gcGFnaW5nX2xvZ19kaXJ0eV9yYW5nZSgpIGRl
c2lnbmVkIGZvciB2cmFtIHRyYWNraW5nIHN1cHBvcnQsIGFyZSBndWFyZGVkIHdpdGgNCj4gUEdf
bG9nX2RpcnR5Lg0KPiA+IFdlIHJlbGVhc2UgYm90aCBmcm9tIFBHX2xvZ19kaXJ0eSwgYW5kIGFs
c28gbW92ZQ0KPiA+IHBhZ2luZ19sb2dfZGlydHlfcmFuZ2UoKSwgcmVtYW1lZCB3aXRoIHAybV9s
b2dfZGlydHlfcmFuZ2UoKSwgaW50byBwMm0uYywgd2hlcmUNCj4gaXQgbG9naWNhbGx5IGJlbG9u
Z3MuDQo+DQo+IEFyZW4ndCB0aGVzZSB0d28gaW5kZXBlbmRlbnQgY2hhbmdlcz8gT25lIHRvIGRl
YWwgd2l0aCBzdHJ1Y3Qgc2hfZGlydHlfdnJhbSwgdGhlDQo+IG90aGVyIHRvIG1vdmUgYW5kIHJl
bmFtZSBwYWdpbmdfbG9nX2RpcnR5X3JhbmdlKCk/IElycmVzcGVjdGl2ZSwgaW4gdGhlIGludGVy
ZXN0IG9mDQo+IG1ha2luZyBwcm9ncmVzczoNCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd2l0aCAuLi4NCj4NCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVk
ZS9hc20vcDJtLmgNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vcDJtLmgNCj4g
PiBAQCAtMTExMCw2ICsxMTEwLDEwIEBAIHN0YXRpYyBpbmxpbmUgaW50IHAybV9lbnRyeV9tb2Rp
Znkoc3RydWN0DQo+ID4gcDJtX2RvbWFpbiAqcDJtLCBwMm1fdHlwZV90IG50LA0KPiA+DQo+ID4g
ICNlbmRpZiAvKiBDT05GSUdfSFZNICovDQo+ID4NCj4gPiArLyogZ2V0IHRoZSBkaXJ0eSBiaXRt
YXAgZm9yIGEgc3BlY2lmaWMgcmFuZ2Ugb2YgcGZucyAqLw0KPg0KPiAuLi4gY29tbWVudCBzdHls
ZSBjb3JyZWN0ZWQgaGVyZSAoaGFwcHkgdG8gZG8gc28gd2hpbGUgY29tbWl0dGluZykuDQo+DQo+
IEFpdWkgdGhlIHBhdGNoIGlzIGluZGVwZW5kZW50IG9mIHRoZSBlYXJsaWVyIHR3bywgYW5kIGhl
bmNlIGNvdWxkIGdvIGluIGFoZWFkIG9mDQo+IHRoZW0uIFNhZGx5IG9uY2UgYWdhaW4gbm90aGlu
ZyBsaWtlIHRoaXMgaXMgc3RhdGVkIGFueXdoZXJlLCBzbyBwbGVhc2UgY29uZmlybS4NCj4NCg0K
WWVzLCBpdCBjb3VsZCBnbyBpbiBhaGVhZCBvZiB0aGVtLiBJJ2xsIHNwbGl0IGl0IGludG8gdHdv
IGNvbW1pdHMsIGFuZCBJIHdpbGwgZG8gdGhpcyBpbW1lZGlhdGVseSB0byBzZW5kIHJlZ2FyZGxl
c3Mgb2YgdGhpcyBwYXRjaCBzZXJpZS4NCg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9wYWdpbmcuaA0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYWdpbmcu
aA0KPiA+IEBAIC0xMzMsMTMgKzEzMywyMCBAQCBzdHJ1Y3QgcGFnaW5nX21vZGUgew0KPiA+ICAg
ICAgKERJVl9ST1VORF9VUChQQUREUl9CSVRTIC0gUEFHRV9TSElGVCAtIChQQUdFX1NISUZUICsg
MyksIFwNCj4gPiAgICAgICAgICAgICAgICAgICAgUEFHRV9TSElGVCAtIGlsb2cyKHNpemVvZiht
Zm5fdCkpKSArIDEpDQo+ID4NCj4gPiAtI2lmIFBHX2xvZ19kaXJ0eQ0KPiA+ICsjaWZkZWYgQ09O
RklHX0hWTQ0KPiA+ICsvKiBWUkFNIGRpcnR5IHRyYWNraW5nIHN1cHBvcnQgKi8NCj4gPiArc3Ry
dWN0IHNoX2RpcnR5X3ZyYW0gew0KPiA+ICsgICAgdW5zaWduZWQgbG9uZyBiZWdpbl9wZm47DQo+
ID4gKyAgICB1bnNpZ25lZCBsb25nIGVuZF9wZm47DQo+ID4gKyNpZmRlZiBDT05GSUdfU0hBRE9X
X1BBR0lORw0KPiA+ICsgICAgcGFkZHJfdCAqc2wxbWE7DQo+ID4gKyAgICB1aW50OF90ICpkaXJ0
eV9iaXRtYXA7DQo+ID4gKyAgICBzX3RpbWVfdCBsYXN0X2RpcnR5Ow0KPiA+ICsjZW5kaWYNCj4g
PiArfTsNCj4gPiArI2VuZGlmDQo+DQo+IFN1YnNlcXVlbnRseSBJIHRoaW5rIHdlIHdpbGwgd2Fu
dCB0byBkbyBtb3JlIGNsZWFudXAgaGVyZS4gVXMgdXNpbmcgYSBzaGFkb3cNCj4gbW9kZSBzdHJ1
Y3QgYWxzbyBpbiBIQVAgY29kZSBpcyBib2d1cyBhbmQsIGFmYWljcywgd2FzdGVmdWwuIFRoZSB0
aHJlZSBsYXR0ZXINCj4gbWVtYmVycyBhcmUgdXNlZCBvbmx5IGJ5IHNoYWRvdyBjb2RlLCBzbyBI
QVAgY291bGQgaGF2ZSBpdHMgb3duLCBzbWFsbGVyDQo+IHZhcmlhbnQgb2YgdGhlIHR5cGUuIEFu
ZCBlYWNoIHR5cGUgY291bGQgYmUgcHJpdmF0ZSB0byB0aGUgaGFwLyBhbmQgc2hhZG93Lw0KPiBz
dWJ0cmVlcyByZXNwZWN0aXZlbHkuDQo+DQoNClVuZGVyc3Rvb2QuDQoNCj4gSmFuDQo=

