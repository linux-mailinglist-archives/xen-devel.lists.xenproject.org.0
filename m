Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPkoEZD8cGmgbAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 17:19:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CB759CA0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 17:19:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210006.1521871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viavO-00020g-5y; Wed, 21 Jan 2026 16:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210006.1521871; Wed, 21 Jan 2026 16:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viavO-0001yt-2I; Wed, 21 Jan 2026 16:19:18 +0000
Received: by outflank-mailman (input) for mailman id 1210006;
 Wed, 21 Jan 2026 16:19:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZBm=72=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viavM-0001fn-L6
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 16:19:16 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecfbe5c0-f6e4-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 17:19:16 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7677.namprd03.prod.outlook.com (2603:10b6:8:1f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 16:19:08 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Wed, 21 Jan 2026
 16:19:08 +0000
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
X-Inumbo-ID: ecfbe5c0-f6e4-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2Fy1zKuG/2+AGVzeP6hyvY2W5AT5tefTATAlwQdJZOHOxsLqLNdE1MQWYbEFmplsoi49PNtB1LZbblBrkCRYdxJATad85I3shOl5KRDVLi7dQDu6x+6o5EumIdNK6qaqbutOiPRd6Mx25rzVZ4u7P2RLCWoDMbLNlYSSLffx5KdHPSktXJK8YJCQuoipcUlv+kY881cf1vjWKIGUU2hLi/I19YfLj3SUcBVnfeocxPPNysd0qPbFlUGBjFYhwuITN7IMagoJ2ac3Nfp1j6O+4xNN4UZMQNgA77gATGztuZiZezcRZV3jmZojk1Nyfg0GC98IDV+DPpOrShm4aCNHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrL40zoKsUTP6RSqiAVWjE+F74fL8LTYeUMQC72YRIc=;
 b=qFK1CuskYXei8x6dXY7JhOEHBwTHq9Agen2/36Ye1DpPoP2fwVIb8DSJQ17w64pI0RxrZpUhE+sbEX/648zQQMdgynFB66rxtzLfODjzXyLTEbVDT+/y9YptSlU0vfPEDqkqd7/vIWT3ftjsHrhQVAfd6v4qaxMlMTzYeYCwLVY7TOge4RX6BGHynU9nxKwCTxNFUst3T5zIKeLvAx8RK3VYhjaJjIuxAzEAmL544eRHLWF3qD8xuVj+naDCBdLsismKP+eYFKzxul2C+nj1kX63lSHvlx5XilohcTt5cZ6zhnt/p3qc3SenF+tVOW0LvXRYxZeaToTGiTqVR8wr5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrL40zoKsUTP6RSqiAVWjE+F74fL8LTYeUMQC72YRIc=;
 b=KMpK/3FSJ2g1YXgJ7CQ3yP/rKZgQ0UHHFPXfVG6ifAXBcILCMMvJUJ/+Q9g+pj7UiS8QVpc+iPx/tGo5Jjggx/uC30ru6IJpcF19ftuUwD4TGU9qfUAkPO2Q0ICWuSms5Qx3ChHyPk2v4uXLrG0x4BWzY/yHgugJv/fr2zs2o88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 21 Jan 2026 17:19:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/8] x86/HPET: avoid indirect call to event handler
Message-ID: <aXD8eUkfsCKc_iS-@Mac.lan>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <1af753e5-33a1-46de-a407-969059e7228f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1af753e5-33a1-46de-a407-969059e7228f@suse.com>
X-ClientProxiedBy: MA3P292CA0029.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 30907d5b-3d46-4744-2e7d-08de5908cdf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFVtUy8xUy9jNWkvVGZuRk9zSVRNS0ZsYjBQUWgzYlkzWlNFdTM0TldoVGlF?=
 =?utf-8?B?VzlWTUllT3ZKMWFIejVtZG9LTW11QUsram9QOGV2ZXBJeVk5eWNMY3dqQXU0?=
 =?utf-8?B?VEhqaDJqbmtGTFFETjZaRWFLSXhxMmU0TVIyUEg4WnptOEVWMjh6WGpZN1FY?=
 =?utf-8?B?TXRsbDRWT0tJb21MaStsb0JocXEyNTJYNGN3WlhxRHJnSFczWjh0MDRxNTlX?=
 =?utf-8?B?Ry9Kam4xSUh3TnZOWElYV1lDUUFiZVN1d0Nza2FlZ0M4SW9HZy80T0xVbXdj?=
 =?utf-8?B?U2hwM2c0cEFrTUtXRlFrREM1ckRqWngyUEpsNUVEUkRvQ3J5aDNYOUpiZ1Z6?=
 =?utf-8?B?MFZUM2UxYXAwRU8wc2hJRmhqdlVDaldOYmFxcHRib0lobER3NWp0MFZQcEFH?=
 =?utf-8?B?bEVmTXpDd25aR1gxc1NxcWVWMWg0djJhckdHdERVSUxacE5LYUpzYWRJeGpq?=
 =?utf-8?B?L2hxZ0hDaVJWMXFiN0VqbTlHNEkxVi9nY1UxbW5jcmlDNHV3aFBXSEZTeTBh?=
 =?utf-8?B?NGRpdjlpTlcxOXdvNWZzQ25JL0I2Zm1teldCbGZsYkh1YU9rU0NiVXR4b3J1?=
 =?utf-8?B?YUpsSXpRSDBHUFd1ODlzd0RQZ1RkRjV4dkJOWlE4THE1YkMvTDRwM0RwVHdP?=
 =?utf-8?B?T3A5UVJ2QTJTVmV5Mm9hWTMyT0ZySUZJYVF0ajlLTk9SN1BnQlRnOXAvaGdq?=
 =?utf-8?B?T0ZDYUp0VnY0bkc0VTU0Wm0vS1FpUEdRSHlEVXBxVFRXSGhFNXl2VFJxWGxG?=
 =?utf-8?B?NStFc3R5bzE0MG1vUExGQWttNGQ0OXpiSERYVDZqSGhJVDFhTm84UWFkLzV3?=
 =?utf-8?B?VjhnL0FRRWhockszRUNsVTEzRHZnblZkZE0yN1NlYlJ4eDdjM3NJcFY4NU9z?=
 =?utf-8?B?NURGOE5oRTI5VXJEVXppSTExRllPa0ZzN0c0M1V0RkRyNEx1UC8vNHl1R1pQ?=
 =?utf-8?B?dHpaaHREYnJPdzViWE9ZaHFha25lb3BkVVR0aG51ZUxobUEwb0tlU0RMRjJK?=
 =?utf-8?B?R1A3Z09Ka3I1R2tYVmpWSjBZc0NkUXB3em11WW56ZU9JWlJEcHora1dwOFZz?=
 =?utf-8?B?SVpITzA2YjVMOG1KS1hWNGh3NEI4RHRmTzkwNEtUS2UwazQ0bmFuNlBrbEZk?=
 =?utf-8?B?UGREZEd6TzlTZXl5OWwvc3U3TWdwbzF4SnA1R2ZaU1RIVHRkeXpzWldManY4?=
 =?utf-8?B?ZFB4eGFIbnRVVDRBemFCc0dwODVRNHNFUmtXbmhEalhzUnZnV0RzZTF5RGRK?=
 =?utf-8?B?K2V6ZWc5Rk42ZEYxOU9DOVNod3ZaM1RnTTJUdTRkMm5pUWNBUENRLzJoV3RM?=
 =?utf-8?B?ZU55akFibldHUGJycmZ5N1F1VWthNmRVaWZpcy94bm9jakUwZkcxYi9zeHh5?=
 =?utf-8?B?Y2NHcEhFWjFyVTNzUm9VMGU4MGRrTXR1RzU4QmtVK0llcnRBaElJMldWdGov?=
 =?utf-8?B?T1BDRnNmemdNRDVYS2l1NWVvYjI0LzI0akFsZ3RZVHNQK3RVYTNMVTNZRlFt?=
 =?utf-8?B?OUFwc0pZL2lCNWZ2d0llY0E4dVEya1VvM20yMURITzNZMXVraTZQWVV3ajd4?=
 =?utf-8?B?RTE3NU5nbENISG4wbnQxYkNsWGtMb2VrU1hNS1hsaGRFVnExOEF3ajBBYjk2?=
 =?utf-8?B?bEUvZ2VvQ1dUcE8yWGY2eEp3aTZ3Qk9mR2c2aVFaNVBpN2tiN1NMR1Q5K2tR?=
 =?utf-8?B?aG5iRTZNamp4b1JrWVdDb1YveURGSXZ2Q1U2czkvU041Tm41UGpqRXlFdnBG?=
 =?utf-8?B?UG9JSUt1VVV2S2xwbW95ZzYveVFRVnArMnVmY0ZHTXMyR2Y4SGdNcWs2VEN4?=
 =?utf-8?B?bHRBYkRXa0Raems3enE1M2VoUDVQNVgzUXBremVPZUFJWGZnejNuNWpuMjZG?=
 =?utf-8?B?ZGx2RU1RSHI5UkcvWVo5S0NDbmQ2N2U1RkljYm9KMUZJQWIvUE9JQlNRMW9Q?=
 =?utf-8?B?MEV5WTlvRnFqNlZQWmtyTVE2MTFSNnRjM2R4a1VrcWQ0WkxRZlFXWWIxbzk0?=
 =?utf-8?B?blJMUVd0dmhtL3FRSTBBckZiS2RDNkNkV3N4TTlkektmQy8rUXYrUmh2OVp2?=
 =?utf-8?B?dm9wYm5CRmMweVArWWVxWko2YlhIVHdiL3R6VWh4ZXdZeFNpV2I3azNZWnhv?=
 =?utf-8?Q?OPKk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjVHd3JtU2xIMGFaUnc2bjlucUtTdjNMaWxsaGFqVjhZYTR5eWNsZm5RdzN4?=
 =?utf-8?B?WkxGb2dma1crNXNhS0FhZVhZTldlQ3RyTC9Qb0o4Zk90YmdpVkR1aVI2ZGlz?=
 =?utf-8?B?Y0JaVklKTktkK3gzZHNjVTFlL3V6YXNsQUExQm5WTEU1NnVEdFdkL3UvVW1T?=
 =?utf-8?B?eFZSbW1USW1GR2M5b05zNjRRbjhKcHVhMk5meFVZbXE3TjVPaWRsQ0ZsUDVo?=
 =?utf-8?B?SlpCME1CMmkvZll0aWFkMzFpOTRYcXBEMkVpN1ZjNjZnNldSNWRBc3RoTUQz?=
 =?utf-8?B?NVZSYm1NZmpRSlUxWHBtd3l1azVRckphcHMvR0FDaDIvKzJFSko0dEM5RGpO?=
 =?utf-8?B?RWllQ2pneWE4cERsT3NvdEs0L0VzWFBYQXYyMDdPTVNwcXRWYm9aTUhKZFdz?=
 =?utf-8?B?NXZzdW9YeWdTUkVIOVYwOFZtdGNYU2hLNE9oOGZaL2w0QnJDVVNnQlZCY0lV?=
 =?utf-8?B?bjFKTTlla0x5R3EzYzZVOVV1MEFFUXl5VS8xOVhvS0JtYjdaaEc2MzlsL0Q3?=
 =?utf-8?B?bnF4czQxeXYxa1I0c3d0T01jbkVwbXFDb1k4OEpvSlpncmx4VjhuZm9uU2l6?=
 =?utf-8?B?WkZXTGF4WWNoVU1naFMzZURvN1V1RUxBMlVFeGpxVllTaHVtYmMxM25sajRE?=
 =?utf-8?B?L3N4STc2dllFYnk1REV0UjZMQi9xNEpXOGE0UEd4b0M5dnd4QTdGYWprUlV1?=
 =?utf-8?B?VWM2RzduVldheUlLeFhnelFvSGc5NGlHcmNZR25RWmZWVUFRd24zZ0xYakMz?=
 =?utf-8?B?NllxUDNXWk9qWXo2Y1Y4VmU1VmdYVHhvRm5zbHY0S1FyOThoa0J4QWtJeHB6?=
 =?utf-8?B?cG5xTTBXMlFFZnNQYmljRi9EdzhTWlVOV0lqamNkblhkbkpyR2VzYUFFRkFp?=
 =?utf-8?B?dzlORUpBMHlpL2JsL3hjRlJMb3B6ZDRZaE9BRDJMNS9OMWVhMFQycmRMd3A5?=
 =?utf-8?B?N0ptTzBUVGRyQ0kreFh6eUI2UnliT2V0Q25pWU5BeHBSQXRBMUM5UklvbzBa?=
 =?utf-8?B?c2ZIakM0b1hPNWVMUzlVbHdWeDdjZThTTmRUWDMxRmNHR0p3c0hSbzcrenRH?=
 =?utf-8?B?cDRqY0lBSXV1Sk9idlo4QSs4OHg0cG54VDNuRVlRdmZkTzdSbTdCcEFQSDUz?=
 =?utf-8?B?eGVtMGR1NGE2VFFkQjZPRmtlTG9zNHdhTStOVFg0ckhtYWQvbVNROUE1ZGto?=
 =?utf-8?B?T1JyZlRMYmp0NTBQdFg2LzhGUTladlhaeVZnUGpvMlRsQ3poN3Z6QjZwLzFZ?=
 =?utf-8?B?Q2dEOXJzZ01oRU5oekRkcEo4MkNkbWJTMW03Z1VPTTdBUlh3Zk5EQzhLbG10?=
 =?utf-8?B?RFM4OUcwenNCcFVtd1o3ZFZMZEVtZExpVllZUE9tNnVlNHpVRnU5STdjMTRm?=
 =?utf-8?B?NHo1MHMzNGhSSWVFYzdJeVRxdUE1b2N5d2F1aVM0RnpqZ2lRWlg3VGdRUDlL?=
 =?utf-8?B?WnlwOGszbVJ5dE9yL0NCbFptS2lIc01vTW5idEdOQndGb3NZRGx0eldzZ2kv?=
 =?utf-8?B?MFI4THRncXdIMzdpWm1hUHpmYmx3clZyUllObGR2THJVeHhFTitYUEZVZVlW?=
 =?utf-8?B?b3h5bVVRbGJIbzB5Q2k2a3RlUkJSTnVJRFp2ekpKWFRKUnNPRFVta3dNa3da?=
 =?utf-8?B?MXBoM2pXbHUrRTU1dkNVTjZzQk9WNVVza1RWQXVlQXFEV21HcU82Yldtd2RZ?=
 =?utf-8?B?dU9pcFMxSkxsZFZ5UmdHd1VOaGFqbUNuczY0Uk9vYkE5VFpiVTFXbElWTEQv?=
 =?utf-8?B?cUwrOS8rMU9YMWN5VXB2SU12V1dXWWowOHoxeE9kYW9yNk9Rd1h5RlphbUcw?=
 =?utf-8?B?amlRLzJhQzhYWjlLU3c4RGx2MUZlSWlPQmt2ZWg0dG9qYTZPQVNRU0ZwUkNo?=
 =?utf-8?B?djR2QUpFZXRMSmJ4WFY5cUhqL2FyWmtSN3UwY0hUaytHam9IdWhrWFEzd0ow?=
 =?utf-8?B?QXd0MWdzTnowUmI4YzZUcFN6Wkd5Sm56cVJKM1hobUVhZDQ0TEJLeFBXNkdV?=
 =?utf-8?B?bVpzRzVONUs4aFpDbWt3L0lCSVdtaG0vSmpxRDBlek1nZUl0SGtYeklVRm1R?=
 =?utf-8?B?ejZUUER2eUY4K2JTMWtralBER0szMFpkNEJpa2UvbUVidjE4TEZaWERVODQw?=
 =?utf-8?B?dFlCUTJJNXhZVk1pbmtEU1MycHJwNlEycVVBRnlPalpmdlBCdWNkWjd5cEVO?=
 =?utf-8?B?SUNwM3lsem5IZDRid2dmZkF3b1J6MzNDdTNLZ0gzSnF5Q1RRSjFPMUtadkxo?=
 =?utf-8?B?cVBJc3VFV29JUFZhZkwvNGI2Wm41cElXMXFxWUx1OE5VempIYUNBblNDeTNN?=
 =?utf-8?B?SEdGUThQSytuS3JBRFB5NGk4a3NNNjlhWlN5blNQTldDa05CelUrZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30907d5b-3d46-4744-2e7d-08de5908cdf8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:19:08.4381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKYPP9Jg3Qul2ipl2zWPHIDDEovzesVHx4cKEHmR94pidFtIbG4MTSdu99vqTNtJWrUvlzKbyIEGgOgfTv9AxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7677
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,Mac.lan:mid];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C7CB759CA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Nov 17, 2025 at 03:37:04PM +0100, Jan Beulich wrote:
> It's only ever handle_hpet_broadcast() that's used. While we now don't
> enable IRQs right away, still play safe and convert the function pointer
> to a boolean, to make sure no calls occur too early.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: Re-base over changes earlier in the series.
> 
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -40,7 +40,7 @@ struct hpet_event_channel
>      s_time_t      next_event;
>      cpumask_var_t cpumask;
>      spinlock_t    lock;
> -    void          (*event_handler)(struct hpet_event_channel *ch);
> +    bool          event_handler;

It would be nice to also get rid of this field, but I don't see any
other input that we could use to ensure the channel is ready to
receive interrupts.

Thanks, Roger.

