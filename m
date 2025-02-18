Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E279A393E4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 08:42:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891100.1300191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkIEE-0001qs-LE; Tue, 18 Feb 2025 07:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891100.1300191; Tue, 18 Feb 2025 07:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkIEE-0001oo-IV; Tue, 18 Feb 2025 07:41:14 +0000
Received: by outflank-mailman (input) for mailman id 891100;
 Tue, 18 Feb 2025 07:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6odE=VJ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tkIEC-0001oS-Gq
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 07:41:12 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20612.outbound.protection.outlook.com
 [2a01:111:f403:200a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3a78ca6-edcb-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 08:41:02 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SN7PR12MB6912.namprd12.prod.outlook.com (2603:10b6:806:26d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.19; Tue, 18 Feb 2025 07:40:57 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8466.013; Tue, 18 Feb 2025
 07:40:56 +0000
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
X-Inumbo-ID: b3a78ca6-edcb-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drg2gDGwvKRjiiEgY5jNW48hzjgzVlfJdtG5x4di5ZE2V4I3giowTJoAfLCj/YfDd7wV0xfq8p13bOxjYmPZQSE60/i+VutKgQ4GOYmKTozlcVHFn0m9xugCjIUTwtD2ZsAc5y+jhhoh8oyW5WJArA4QOGom57n5IuND+3/8eMcVSE0aWy7lhvtMva3UE3PYHc3gZIccUVDD/EE6sbGLUI1SnW6Hin+zJmEcXZzbGDqwUxYohYM2EzIpWkqM12riubV3F5n01iWKPEgBug9MDbwk16ePm+MiGTeaX4Fc4oilzCSqjB8wiaqNWC2yK2sn2CTwqZ+jrOiKjr6qHyHc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QerWoJqWHl/KDNPJOz0zslJIIOAghwdEsf9jvDw9aQU=;
 b=bAA1KP5kNKHAxATbd87n94jTOXMgjOfJullty+WzILIMiMe/guIGlXwpXn29rfaj646//X0eq7HmnGFNiCXK0P146eWtqWz4//hC1C/99oL/zRoxqxRGvzkeQZOgUneIMLgXha42m3xAyKKR2dJw6iWJEYOn4GC2biE1OdFcTLB5RlyqC+VgQjAhjhM80716zRrH/g9Qn8bpuVrUimizY8IY/naD5iNwXDchHSQF6oDxNFfAOn3+0Ru6KWLVpe+8u6hCR0vgiQ2IDipdGXdko3wAmliSGZhQnk8wTJksv44PsRL/E40I/OmKVa7QrJXi8IOztMuew37CRhFlux7Hng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QerWoJqWHl/KDNPJOz0zslJIIOAghwdEsf9jvDw9aQU=;
 b=z2zVHJisdDg6aWdLDvbeiirsoogikwFDK0TrHMts+8RlJI02ONb1giI/TBB/ZYaChFOkR4Y4irb55vsNpdLSU3aeYhm512YmWD4W3mF7EUahJuYueHzYJB7etPuOS8i2YOrS8xWe1FqB8mqjJmSKCn3SF329or7vAznzmdiGfg8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 05/11] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
Thread-Topic: [PATCH v2 05/11] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
Thread-Index: AQHbeHHP6s77OhtOyESwm9UCfT4CR7NCV/0AgApU3yA=
Date: Tue, 18 Feb 2025 07:40:56 +0000
Message-ID:
 <DM4PR12MB8451A1436E68B906D8C2E89BE1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-6-Penny.Zheng@amd.com>
 <0fe9e3b1-3d2c-4ddf-87c4-b0de2a586182@suse.com>
In-Reply-To: <0fe9e3b1-3d2c-4ddf-87c4-b0de2a586182@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=13c6ff0c-6a65-470a-91d6-5c134621b6cc;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-18T06:32:26Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SN7PR12MB6912:EE_
x-ms-office365-filtering-correlation-id: 6862e0fc-4afc-42a3-d917-08dd4fef94d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OHAvbDFRcTJVMWdQM0VrbDhqK0dYRFpmZzFEUmw0RHhJT2JXZGw4TEV3UFk4?=
 =?utf-8?B?bFhGVklzcGdzR29sYml5UEZ1eGtpWHJ3L3VGU0xIdjN6enV1ZDgvRU55MVNw?=
 =?utf-8?B?bzV4c3pFY2J4YVdkbVRpUmFRY0c1cmxsNmV0UWNlUmNUM2IzNnk5emFsNkV3?=
 =?utf-8?B?QmZrV1ZQenVLdVdNSmFkTXNudThBR3hNYmtzMFpFaTF3bnY0eGhIUWZyRXFW?=
 =?utf-8?B?Z2I4RkVvR2tKdmlSNTV1a2ZrTURVb0hKTGFEV1ZlM2ZYbHV5cVZTRVpSOEJG?=
 =?utf-8?B?Qy91cXk1cGpvb2JJWnR4S2kyejFFcFF3em1URTRqbGdlVzhHN2w1M29sc2l0?=
 =?utf-8?B?c3Z6by9LbVArNGQyZ1U4aVBuL3RnUSswYnRuakVRQSs4eG4rREVlZHc0am5I?=
 =?utf-8?B?Zk1aT052ZkRQNU1GTjFUOUJwQUhvS0NOVU9uSGptTkpma3A3S1pNYzBWSzRD?=
 =?utf-8?B?VkdETEIzRCtPOUR2NFNIV1UvK1NjSHovMWtaTG4wWEZZWjFyQnVNSDZUOFpz?=
 =?utf-8?B?TkErT1l6dzFrTTFidCt5Z1oxZUtJOWZaTDArZEl0ZWVnUUFlNFJzVmhpK2lQ?=
 =?utf-8?B?clpWK3hvTGgwZWxzOW5SbUtyMVBsQjBtRTd2LytBSmxYNmtaWWpTdkdTTktK?=
 =?utf-8?B?OGNlaW5uZjg2YnFiTmpJbUUzY3pIcjFwKzU2NGVzL0ZUcFhiZlJuSC93UE1q?=
 =?utf-8?B?c0IySTRBckFjOTVKTUYwYnRwVTBic1JBLzhmNzNpcjBvOW1CTHVWd041RG5m?=
 =?utf-8?B?MmVHYWxBaTNpN2IvQjFNMFVIV0xLRDBYc2JEM0NSd2hPVzB1dFdXVkE0akc4?=
 =?utf-8?B?VXozT1lDa0c2M0VoUkdud2FDSUswYzRBcy8vSm5HMGFhOWRXSDgzeENxREhI?=
 =?utf-8?B?WVpQRlkzVllhRnh1VDA1Qm0xV216YXRCY2pGVXFsZGNLTkNtak53ZE9zcENZ?=
 =?utf-8?B?c3lIUzI2T2ZqSHp4V3liazRTZDF6NmN3RWFRb0Z5Y1VDQlF0aUlkcXVWZ2Uy?=
 =?utf-8?B?RVRBeTRyc0ZjS2VCOXhDMm9idGVOQlYvUXo3cXdySHQyNytiUkVDRXdrUVRt?=
 =?utf-8?B?S3g0My9MRlE0cXNLSDFCY0lkQlhodzFtanBheXNodUJKQ2dhMXFqMVFIS1lI?=
 =?utf-8?B?c1FGdkQrMk1STEUraWoxSGZtRlIzUVF0OStiUGExSXBBVTB0VE9pNXArSTMr?=
 =?utf-8?B?bmhHVWFBUVpQZFFwajA4WG5PWnVnYTd6eEV6Vm1vMXRORVpkRkFEbnFZejhP?=
 =?utf-8?B?eHBnMmRybUhGWDdIQU5KZjlVMnBZZENYSm1WSkphUkRINEtFbFEwZU9MWEx1?=
 =?utf-8?B?ditjb1hqTnBraWVPdC80WUY0NkM4M2VmazJrb2Fmdy9vUnVPWnMvNHcxTzdL?=
 =?utf-8?B?bCtnc2JlT0RLQmhlRERiWFUvckpMUk1maFlFTkc1dVFnd01obmh0NFFTNnJK?=
 =?utf-8?B?SnEyZDZCMDlQVVBZYjUvdXc2bEppRjRVcmM4eXVxSG1vL3JSOElpK2h1eXB6?=
 =?utf-8?B?dENuWVEyb2MxWVRDL25sTmIxbGZoZUErODZlcGJpZ0lZUHdmanJObTR4SXpu?=
 =?utf-8?B?NG5SRkdzRGNyc2dBaXRlWjZ1NXl3Q2NVRllWK05xczIvUmJ4VnJnamJWK2Iv?=
 =?utf-8?B?VTB3L1ZOZlpMdUhsZWRQMk9aSkRqL3RwRm1FYkxxZ1gzekQwWjFIK0RsTUR3?=
 =?utf-8?B?L01kWkFLN2tQRzYzVENlQ08zdm9oYjRRSldzMkJmODNDOG13c1I0NVZVY1BB?=
 =?utf-8?B?K2VuWnBEUkc0YzBkZEEwSzZDVFl3a3h1eGp5RFU5YUtuNGppcDVzOXE0VWpP?=
 =?utf-8?B?VGk5eGMzaTZuanpxYS9BS0JFZTJRV0Q1SDNXdlA5WUJuMFFybGZnalNkbUxk?=
 =?utf-8?B?MEtoQ1RGMmxIbStLUkpxN3VwM0RmN0wrRXp1c2JzSUQ4RUE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkRhWUl6a2oxWDRMWFBTYW54djMvRVJtN2V2UDhYZW0rZU1YSVVvY2J1SlV0?=
 =?utf-8?B?c1pmbXgzZm01ZnE2NHk1NjhJeGtIRW5XM0pvZmhsODZMRWlacHYyczU2UzZC?=
 =?utf-8?B?aTYwWWpNbU5GaWdLeGFFUFQwbGNSejJDeHZkVjAwbUpDdW9JdmJSTGhWWU1V?=
 =?utf-8?B?Mm1BNG5uNTJUdXphb2lNMW1vanR2QkhNR0Y1VWdlb0lOVThza0FScWZrRjUr?=
 =?utf-8?B?b2RmNlp6RjE5YTJaNUNBNzhub0lVeTFQUmF5VzluNmFwRW9OUXVlcHExMllV?=
 =?utf-8?B?Y0pNeTdnajF2T3NETEVVZ09TUnpBN1Q2bUVLN1hkOUkwcVJOekFiaU5lcWgy?=
 =?utf-8?B?dVJrZXNQQm1RVURZemo1OFdIMzFvUzZvWFUxcEdwd09lR2JINGg4ZnFHWXF6?=
 =?utf-8?B?RStySzRrMTV3VVVhVHJqMWthVzk4WlgrVGNjdmdQdjIySDNWQmFaZEpZOUZm?=
 =?utf-8?B?TlFydzkyOTZLZk5BWEhRLzhUSG5DSWZUYnY0MjJlWTl4L281eng4OEtRYjNj?=
 =?utf-8?B?bS9MWVR5SzVSV213cDRSRzZUd0tIeCtJd0JiWjVXMUVLYWlhYU1LYWhyaW8x?=
 =?utf-8?B?cGlHRlhNK3BKNXRkNUpld0V2SkdvYlJhTCtxWlRhWHVVOEx6WDNVTnlBRE9W?=
 =?utf-8?B?QVpkalBYZkRLellOaEtiM2VyMDJCbnFBNE1keE96RXpTNVBxYnJXODF5aFE2?=
 =?utf-8?B?Q3NEd21HYWZsd2tzenIwWVIvajBEanRBM3YyeXNzaVZFMkc4L01qVm00MDl3?=
 =?utf-8?B?bmdTMExwT1JadXM5ZzJUYjNaUVlnb0g5Rm5mZXdab04vK3c2SzA0QVEwQkE2?=
 =?utf-8?B?R1lZU2t0Q0RmeDNYRVF5NDNqVlZqMlRTRE13cC92TklEUkF0YmJFNzBaUU1J?=
 =?utf-8?B?WDhzVDRCVHJLOXc5L3I0TGhBNjJWd0NZZ3hndjA1RkhKZmk1YVdIK0FReXJj?=
 =?utf-8?B?TXRqTUhXU2RERUpLRFE5V09EV1RHeXlIbUM2RTM2MDJleldGZXBiK1JWTnd0?=
 =?utf-8?B?SzYwZ3BhaXFkSFY0bEUwQTBlR3kxejd3YlBZK1ArWEpUSGRQRDlCQlhvY1lk?=
 =?utf-8?B?cm5Ha1FrenFxbmVNaHdtSVdabTNGZmYrK2xHOVFGUlk5K3RjTXQ5Snl0REhR?=
 =?utf-8?B?ZlA1bTlQa1FiYTdZd2xrQVpZUTk5Z1BnRlI4V3QyWEU4TGtaZVVpbUMwQjJ3?=
 =?utf-8?B?YVRDRkFlT2dDMDczZkVScER5WlpFMXpXb0h3S1VINk9IcEZjck9GNDFpdHg2?=
 =?utf-8?B?QXl1NFkzNDBrVmJ0d0FoNDZOZGdSMGt4d1NZN2c1ZTJ2R0dhVjMrQ1VGc3FN?=
 =?utf-8?B?K3h5TG5Ydjk2U1NxN20zUlppaTI2MGJST0lxMXpwRmF4cWtEdEozd1lpQzUw?=
 =?utf-8?B?V0lYWlUzUGFpbWZmTDVkZWM2ZEh1RWFpYUk4cjVYK09Pc1lOcEorZTJ3WDZw?=
 =?utf-8?B?djBmL3IvSXpXWFhicXhDOTFHdGJTVjNWc290WnNMNFNQajJ4YURiN1dvbWxz?=
 =?utf-8?B?S2FRdUxPR0ZEalAza3JMNTRMVFFweVVsdVR1by93cEc5Z1J4SmFJV05Vd0pM?=
 =?utf-8?B?M1RWNTJTVDZ1RUh2WHV6ZzRSS0x6SHNmeXVpUGpxcWZJbzcwTmREbzNjcDBz?=
 =?utf-8?B?WEJWbHFYS0RXa2JadEJqYllpcWd6djBpWU0zLzFMbzJYTXc1ckV4c28xaUZt?=
 =?utf-8?B?RU0xbE5jNmF4U1U5VUdkSks5bnZOL0szSDZVUHplKytlYlpXaWw5a0M3aG8z?=
 =?utf-8?B?V0Z6LzJUU3Q4ZDVrbnJqSk41ZnpaRkIrTlpqU3ovMnRMZlRFR1NYa25aeUhY?=
 =?utf-8?B?ZHFORTRjZk5NVlJVQS9manh2RDgxYjB2dWdQSFdUN3hyMVppRW1yZm5IamtT?=
 =?utf-8?B?VGRkZjg0SXZIZzJ1WU5OL1ovazFLa2ZFalc0cjAvbFNJanYrcGFMRCt0VDlN?=
 =?utf-8?B?TUthSUcyYlVKSE5UTFZOY2VIZGp3WWh6Q1ZteGtCOVhEa21KRzVsSHQ5MW54?=
 =?utf-8?B?bnI2TGJDL1lZTjVzVEZaQmVkelc2Vk5Sb1pCTHV4QkV5VWhtUmttcmNKemJD?=
 =?utf-8?B?b0xnQmIrRU5Vcnh1WVFheHVFSUNVaHRRMnR3SnpCOWs2YURGaEVLNy9IejhO?=
 =?utf-8?Q?2DgE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6862e0fc-4afc-42a3-d917-08dd4fef94d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 07:40:56.8949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wO/QuxC0/F7h42fU2t4HzAgN82d3LzGDNnwZ1/cba1tZMna49c/4zMedk/yYJwBbI/GWsWG8f45/u1YHTgGqWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6912

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMTIsIDIw
MjUgMTI6NDYgQU0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcnl1aywgSmFzb24NCj4gPEph
c29uLkFuZHJ5dWtAYW1kLmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Ow0KPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA1LzEx
XSB4ZW4veDg2OiBpbnRyb2R1Y2UgYSBuZXcgYW1kIGNwcGMgZHJpdmVyIGZvcg0KPiBjcHVmcmVx
IHNjYWxpbmcNCj4NCj4gT24gMDYuMDIuMjAyNSAwOTozMiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+
ID4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9hbWQtY3BwYy5jDQo+ID4gKysrIGIv
eGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9hbWQtY3BwYy5jDQo+ID4NCj4gPiArLyoNCj4gPiAr
ICogSWYgQ1BQQyBsb3dlc3RfZnJlcSBhbmQgbm9taW5hbF9mcmVxIHJlZ2lzdGVycyBhcmUgZXhw
b3NlZCB0aGVuIHdlDQo+ID4gK2Nhbg0KPiA+ICsgKiB1c2UgdGhlbSB0byBjb252ZXJ0IHBlcmYg
dG8gZnJlcSBhbmQgdmljZSB2ZXJzYS4gVGhlIGNvbnZlcnNpb24gaXMNCj4gPiArICogZXh0cmFw
b2xhdGVkIGFzIGFuIGFmZmluZSBmdW5jdGlvbiBwYXNzaW5nIGJ5IHRoZSAyIHBvaW50czoNCj4N
Cj4gSGF2aW5nIHN0dWRpZWQgbWF0aHMsICJhZmZpbmUgZnVuY3Rpb24iIGlzbid0IGEgdGVybSBJ
IGtub3cuIFRoZXJlIGFyZSBhZmZpbmUNCj4gdHJhbnNmb3JtYXRpb25zLCBidXQgZG9uJ3QgeW91
IHNpbXBseSBtZWFuICJsaW5lYXIgZnVuY3Rpb24iIGhlcmU/IElmIHNvLCBpcyBpdCBzYWlkDQo+
IGFueXdoZXJlIGluIHRoZSBzcGVjIHRoYXQgcGVyZiB2YWx1ZXMgZ3JvdyBsaW5lYXJseSB3aXRo
IGZyZXEgb25lcz8NCj4NCg0KWWVzLCAibGluZWFyIG1hcHBpbmciIGlzIGJldHRlci4gQW5kIHRo
ZSBzcGVjIHJlZmVyZW5jZSBpcyBhcyBmb2xsb3dzOg0KYGBgDQpUaGUgT1Mgc2hvdWxkIHVzZSBM
b3dlc3QgRnJlcXVlbmN5L1BlcmZvcm1hbmNlIGFuZCBOb21pbmFsIEZyZXF1ZW5jeS9QZXJmb3Jt
YW5jZQ0KYXMgYW5jaG9yIHBvaW50cyB0byBjcmVhdGUgYSBsaW5lYXIgbWFwcGluZyBvZiBDUFBD
IGFic3RyYWN0IHBlcmZvcm1hbmNlIHRvIENQVSBmcmVxdWVuY3kNCmBgYA0KU2VlIDguNC42LjEu
MS43LiBMb3dlc3QgRnJlcXVlbmN5IGFuZCBOb21pbmFsIEZyZXF1ZW5jeQ0KIChodHRwczovL3Vl
Zmkub3JnL3NwZWNzL0FDUEkvNi41LzA4X1Byb2Nlc3Nvcl9Db25maWd1cmF0aW9uX2FuZF9Db250
cm9sLmh0bWw/aGlnaGxpZ2h0PWNwcGMjbG93ZXN0LWZyZXF1ZW5jeS1hbmQtbm9taW5hbC1mcmVx
dWVuY3kgKQ0KDQo+ID4gKyAqICAtIChMb3cgcGVyZiwgTG93IGZyZXEpDQo+ID4gKyAqICAtIChO
b21pbmFsIHBlcmYsIE5vbWluYWwgZnJlcSkNCj4gPiArICovDQo+ID4gK3N0YXRpYyBpbnQgYW1k
X2NwcGNfa2h6X3RvX3BlcmYoY29uc3Qgc3RydWN0IGFtZF9jcHBjX2Rydl9kYXRhICpkYXRhLA0K
PiA+ICt1bnNpZ25lZCBpbnQgZnJlcSwgdWludDhfdCAqcGVyZikNCj4NCj4gT3ZlcmxvbmcgbGlu
ZSBhZ2Fpbi4gUGxlYXNlIHNvcnQgdGhyb3VnaG91dCB0aGUgc2VyaWVzLg0KPg0KPiA+ICt7DQo+
ID4gKyAgICBjb25zdCBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9jcHBjICpjcHBjX2RhdGEgPSBkYXRh
LT5jcHBjX2RhdGE7DQo+ID4gKyAgICB1aW50NjRfdCBtdWwsIGRpdiwgb2Zmc2V0ID0gMCwgcmVz
Ow0KPiA+ICsNCj4gPiArICAgIGlmICggZnJlcSA9PSAoY3BwY19kYXRhLT5ub21pbmFsX2ZyZXEg
KiAxMDAwKSApDQo+DQo+IFRoZXJlJ3Mgbm8gY29tbWVudCBhbnl3aGVyZSB3aGF0IHRoZSB1bml0
cyBvZiB0aGUgdmFsdWVzIGFyZS4gVGhlcmVmb3JlIHRoZQ0KPiBtdWx0aXBsaWNhdGlvbiBieSAx
MDAwIGhlcmUgbGVhdmVzIG1lIHdvbmRlcmluZyB3aHkgY29uc2lzdGVudCB1bml0cyBhcmVuJ3Qg
dXNlZCBpbg0KPiB0aGUgZmlyc3QgcGxhY2UuIChGcm9tIHRoZSBuYW1lIG9mIHRoZSBmdW5jdGlv
biBJIG1pZ2h0IGd1ZXNzIHRoYXQgImZyZXEiIGlzIGluIGtIeiwNCj4gYW5kIHRoZW4gcGVyaGFw
cyAtPnttaW4sbWF4LG5vbWluYWx9X2ZyZXEgYXJlIGluIE1Iei4NCj4gVGhlbiBmb3IgdGhlIGZv
cmVzZWVhYmxlIGZ1dHVyZSB3ZSdyZSBob3BlZnVsbHkgc2FmZSBoZXJlIHdydCBvdmVyZmxvdy4p
DQo+DQoNClRoZXNlIGNvbnZlcnNpb24gZnVuY3Rpb25zIGFyZSBkZXNpZ25lZCBpbiB0aGUgZmly
c3QgcGxhY2UgZm9yICpvbmRlbWFuZCogZ292ZXJub3IsIHdoaWNoDQpyZXBvcnRzIHBlcmZvcm1h
bmNlIGFzIENQVSBmcmVxdWVuY2llcy4gSW4gZ2VuZXJpYyBnb3Zlcm5vci0+dGFyZ2V0KCkgZnVu
Y3Rpb25zLCB3ZSBhcmUgYWx3YXlzDQp0YWtlIGZyZXEgaW4gS0h6LCBidXQgaW4gQ1BQQyBBQ1BJ
IHNwZWMsIHRoZSBmcmVxdWVuY3kgaXMgcmVhZCBpbiBNaHogZnJvbSByZWdpc3Rlci4uLg0KDQo+
ID4gKyAgICB7DQo+ID4gKyAgICAgICAgKnBlcmYgPSBkYXRhLT5jYXBzLm5vbWluYWxfcGVyZjsN
Cj4gPiArICAgICAgICByZXR1cm4gMDsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICBpZiAo
IGZyZXEgPT0gKGNwcGNfZGF0YS0+bG93ZXN0X2ZyZXEgKiAxMDAwKSApDQo+ID4gKyAgICB7DQo+
ID4gKyAgICAgICAgKnBlcmYgPSBkYXRhLT5jYXBzLmxvd2VzdF9wZXJmOw0KPiA+ICsgICAgICAg
IHJldHVybiAwOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIGlmICggKGNwcGNfZGF0YS0+
bG93ZXN0X2ZyZXEpICYmIChjcHBjX2RhdGEtPm5vbWluYWxfZnJlcSkgKQ0KPg0KPiBXaHkgdGhl
IGlubmVyIHBhcmVudGhlc2VzPw0KPg0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIG11bCA9IGRh
dGEtPmNhcHMubm9taW5hbF9wZXJmIC0gZGF0YS0+Y2Fwcy5sb3dlc3RfcGVyZjsNCj4gPiArICAg
ICAgICBkaXYgPSBjcHBjX2RhdGEtPm5vbWluYWxfZnJlcSAtIGNwcGNfZGF0YS0+bG93ZXN0X2Zy
ZXE7DQo+ID4gKyAgICAgICAgLyoNCj4gPiArICAgICAgICAgKiBXZSBkb24ndCBuZWVkIHRvIGNv
bnZlcnQgdG8ga0h6IGZvciBjb21wdXRpbmcgb2Zmc2V0IGFuZCBjYW4NCj4gPiArICAgICAgICAg
KiBkaXJlY3RseSB1c2Ugbm9taW5hbF9mcmVxIGFuZCBsb3dlc3RfZnJlcSBhcyB0aGUgZGl2aXNp
b24NCj4gPiArICAgICAgICAgKiB3aWxsIHJlbW92ZSB0aGUgZnJlcXVlbmN5IHVuaXQuDQo+ID4g
KyAgICAgICAgICovDQo+ID4gKyAgICAgICAgZGl2ID0gZGl2ID86IDE7DQo+ID4gKyAgICAgICAg
b2Zmc2V0ID0gZGF0YS0+Y2Fwcy5ub21pbmFsX3BlcmYgLSAobXVsICoNCj4gPiArIGNwcGNfZGF0
YS0+bm9taW5hbF9mcmVxKSAvIGRpdjsNCj4NCj4gSSBmZWFyIEkgY2FuJ3QgY29udmluY2UgbXlz
ZWxmIHRoYXQgdGhlIHN1YnRyYWN0aW9uIGNhbid0IGV2ZXIgdW5kZXJmbG93Lg0KPiBXaXRoDQo+
DQo+IE8gPSBvZmZzZXQNCj4gUG4gPSBkYXRhLT5jYXBzLm5vbWluYWxfcGVyZg0KPiBQbCA9IGRh
dGEtPmNhcHMubG93ZXN0X3BlcmYNCj4gRm4gPSBjcHBjX2RhdGEtPm5vbWluYWxfZnJlcQ0KPiBG
bCA9IGNwcGNfZGF0YS0+bG93ZXN0X2ZyZXENCj4NCj4gdGhlIGFib3ZlIGJlY29tZXMNCj4NCj4g
TyA9IFBuIC0gKChQbiAtIFBsKSAqIEZuKSAvIChGbiAtIEZsKQ0KPg0KPiBhbmQgeW91ciBhc3N1
bXB0aW9uIGlzIE8gPj0gMCAoYW5kIGZvciBpbnB1dHM6IEZuID49IEZsIGFuZCBQbiA+PSBQbCku
IFRoYXQgZm9yIG1lDQo+IHRyYW5zZm9ybXMgdG8NCj4NCj4gKFBuIC0gUGwpICogRm4gPD0gUG4g
KiAoRm4gLSBGbCkNCj4NCj4gYW5kIGZ1cnRoZXINCj4NCj4gLShQbCAqIEZuKSA8PSAtKFBuICog
RmwpDQo+DQo+IG9yDQo+DQo+IFBuICogRmwgPD0gUGwgKiBGbg0KPg0KPiBhbmQgSSBkb24ndCBz
ZWUgd2h5IHRoaXMgd291bGQgYWx3YXlzIGhvbGQuIFlldCBpZiB0aGVyZSBjYW4gYmUgdW5kZXJm
bG93LCBJIHdvbmRlcg0KPiB3aGV0aGVyIHRoZSBjYWxjdWxhdGlvbiBpcyBhY3R1YWxseSBjb3Jy
ZWN0LiBPciwgLi4uDQo+DQoNCkJlY2F1c2Ugd2UgYXJlIGFzc3VtaW5nIHRoYXQgaW4gbm9ybWFs
IGNpcmN1bXN0YW5jZXMsIHdoZW4gRj09MCwgUCBpcyB0aGUgb2Zmc2V0IHZhbHVlLCBhbmQNCkl0
IHNoYWxsIGJlIGFuIG5vbi1zbWFsbGVyLXRoYW4temVybyB2YWx1ZSwgdGJoLCA9PTAgaXMgbW9y
ZSBsb2dpY2FsIGZ3aXQNClNvIGlmIGl0IGlzIHVuZGVyZmxvdywgSSBtaWdodCB0aGluayB0aGUg
aGFyZHdhcmUgaXRzZWxmIGlzIG1hbGZ1bmN0aW9uYWwuDQoNCj4gPiArICAgIH0NCj4gPiArICAg
IGVsc2UNCj4gPiArICAgIHsNCj4gPiArICAgICAgICAvKiBSZWFkIFByb2Nlc3NvciBNYXggU3Bl
ZWQobWh6KSBhcyBhbmNob3IgcG9pbnQgKi8NCj4gPiArICAgICAgICBtdWwgPSBkYXRhLT5jYXBz
LmhpZ2hlc3RfcGVyZjsNCj4gPiArICAgICAgICBkaXYgPSB0aGlzX2NwdShtYXhfZnJlcV9taHop
Ow0KPiA+ICsgICAgICAgIGlmICggIWRpdiApDQo+ID4gKyAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIHJlcyA9IG9mZnNldCArIChtdWwgKiBm
cmVxKSAvIChkaXYgKiAxMDAwKTsNCj4NCj4gLi4uIGNvbnNpZGVyaW5nIHRoYXQgYSBuZWdhdGl2
ZSBvZmZzZXQgaGVyZSBpc24ndCByZWFsbHkgYW4gaXNzdWUsIGFzIGxvbmcgYXMgdGhlIHJocyBv
Zg0KPiB0aGUgYWRkaXRpb24gaXMgbGFyZ2UgZW5vdWdoLCBpcyBvZmZzZXQgcGVyaGFwcyBtZWFu
dCB0byBiZSBhIHNpZ25lZCBxdWFudGl0eSAoYW5kDQo+IGNvbnNpZGVyaW5nIGl0J3MgaW4gcHJp
bmNpcGxlIGFuIFthYnN0cmFjdF0gcGVyZiB2YWx1ZSwgaXQgZG9lc24ndCBldmVuIG5lZWQgdG8g
YmUgYSA2NC0NCj4gYml0IG9uZSwgaS5lLiBwZXJoYXBzIG9uZSBvZiB0aGUgY2FzZXMgd2hlcmUg
cGxhaW4gaW50IGlzIGFwcHJvcHJpYXRlIHRvIHVzZSk/DQo+DQo+ID4gKyAgICBpZiAoIHJlcyA+
IFVJTlQ4X01BWCApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIg
IlBlcmYgdmFsdWUgZXhjZWVkcyBtYXhpbXVtIHZhbHVlIDI1NToNCj4gPiArICVsdVxuIiwgcmVz
KTsNCj4NCj4gSWYgdGhpcyB3YXMgdG8gZXZlciB0cmlnZ2VyLCBpdCB3b3VsZCB0aGVuIGxpa2Vs
eSB0cmlnZ2VyIG9mdGVuLiBJbW8gc3VjaCBsb2cgbWVzc2FnZXMNCj4gd2FudCB0byBiZSBwcmlu
dGtfb25jZSgpLCBpZiB0aGV5J3JlIG5lZWRlZCBhdCBhbGwuDQo+DQo+ID4gKyAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQo+DQo+IENhbid0IHdlIGluc3RlYWQgY2xpcCB0byAweGZmPw0KPg0KDQpU
cnVlLCBjbGlwIGl0IHRvIDB4ZmYgbWF5YmUgYmV0dGVyDQoNCj4NCj4gSmFuDQo=

