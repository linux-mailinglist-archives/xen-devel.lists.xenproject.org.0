Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97BA92E16B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 09:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757139.1165876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRohX-0005wY-KR; Thu, 11 Jul 2024 07:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757139.1165876; Thu, 11 Jul 2024 07:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRohX-0005u0-HD; Thu, 11 Jul 2024 07:58:51 +0000
Received: by outflank-mailman (input) for mailman id 757139;
 Thu, 11 Jul 2024 07:58:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DKXR=OL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sRohW-0005tu-2p
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 07:58:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2009::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65bb8c79-3f5b-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 09:58:47 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN0PR12MB6200.namprd12.prod.outlook.com (2603:10b6:208:3c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 07:58:42 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 07:58:42 +0000
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
X-Inumbo-ID: 65bb8c79-3f5b-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vln3mO+kVoO/7txU4OgssXTmuty9D8DvlGy9HUGAB1gzCjhzMpkx0VK/QL3xWOs/VoURqQmsJtRT5UDRFP6PaoaltBskJg36csPLcE6zGwI0V9UXV+CH9T4pZUABoKajoNjZlsBOv9QzALEUdXcrGkBeEtU+OjMjRgAMSGlb9N7lKAJ23I6Df66VBNvr0v+m6hDHhLb40yjhGtauY5JOW8/XOPEX8FV8jTRtx/k0wzhxElpclnTWfc6BVIAdVdamQ1EyPIPMyEkFOZHwS4rxyh2fwl+bkGy01EpjDVrapbXsufwwo1rBZuRAs3ZD1V2bYpB9RiHF10WnSAiITRjsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQogeKqUUYiT3ibHFsO2hsuVHgoYYVf69izTpM7EAQQ=;
 b=TqFCJVumSWKrSoYKonwmtvnBpcRpO3oLTFi7KY5bsZwdSGSHk0Sgw71xPUFGvsJU4DPxDJ0uWGd1QDVGtBtm9PNLMi8Hou1iFrtvyhDDClH6/10RdwUX9bQ8zLZo8tENztHph23z5I8+iz9WeShZEjn6kDnZ55oOMXjHaShX5ZB3E1JBoEFLZzHaPITfVdDk8jLRLvbr7JSIs9tLhTcovbkmalms5ypz06ma1jfJuGIkrRUO6k2pKk0gS8otsK7+EuHgAiwKGPv5/qNZwHPRwYVhYzcs+jtkxsOQ+45MHYrNYTFz3EuGf1Cj4Won9ceYCD+hwQXXA6pIsORa28xQSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQogeKqUUYiT3ibHFsO2hsuVHgoYYVf69izTpM7EAQQ=;
 b=i1tQ2qFeLonscp+PJxIWBSel+b5M2i9tciseO0LX1vyC7OkLNvDxImdbE7H+8WpUGdM4q2H9nBDaeNox+O1mA/ofnSyUqUuqjQHp/XxqwGmG7iDyYarZPIukniHk2kK5g97Jv+IonCrxK8AkSJpKIrEVXpghaH37e1T5+yMzPhk=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Anthony PERARD <anthony@xenproject.org>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 3/7] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Thread-Topic: [XEN PATCH v12 3/7] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
Thread-Index: AQHa0SvX+81a6HzJk0WXqL6d0XE9YLHxsO4A
Date: Thu, 11 Jul 2024 07:58:42 +0000
Message-ID:
 <BL1PR12MB5849988FE792B36499650F18E7A52@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-4-Jiqian.Chen@amd.com>
In-Reply-To: <20240708114124.407797-4-Jiqian.Chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7762.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN0PR12MB6200:EE_
x-ms-office365-filtering-correlation-id: e485982f-b135-4e4a-ba51-08dca17f4832
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MmY5MkI5QTVONDArMXMrMDExTnlZS1IzR0R5RUREVmNjTDJtN3FuS2lacHZT?=
 =?utf-8?B?YkREcEprd3FKQWVNTXRNZ2pid2FTRWh3QlIyd0lVZjI4VDNSSEYvK3Z3MEM2?=
 =?utf-8?B?anVyTS94Z1pOY1dmdmx0SU1wUDhaQ1RYQlVyMXJ3eXVmdE5hdGM0eDVmaWRQ?=
 =?utf-8?B?TE9YUCtGeXl5U1hJdmkvSndLcTZ5M001QmxUVU5BaVBldVgwQXRyRDcxb2Rx?=
 =?utf-8?B?dlpubXdlZE5yYmg3dllUYkVOUDhUVS8xSFpSNW1DQXdFaitoZGZWV3VZT2gz?=
 =?utf-8?B?OXlyVDFEWC9CK2dZelNhR2RTVEk5aXNPWTJ3WHdsQ0lualBydnVsMHRIT2tm?=
 =?utf-8?B?STE5U1ZCMVdQSVMrUEREMXFaRFZsSTUwTWZqSFlQQWhvQW02QlJET29TM1Rw?=
 =?utf-8?B?VWcvc0pXcklERmRySit2eE0vSVVPRkdsR1E0VFVJa01KTnpzMjl3b3BFbVpm?=
 =?utf-8?B?Yk9BYW1tdGFMWldhRkJtUGdUM2M0aXg4c3E0aHZBWnp6YWsrN1dzRzBaZmV2?=
 =?utf-8?B?WnBVM3ZoUHFNNFI4alVsc3RsbktZTDBaWFJxZU5Ka1B2WVlxTVdqQWx5MGxB?=
 =?utf-8?B?RU9LdWdJdDA5RS9GbFFvVGpxK3RkN3Y1Rk9Kb21LTFloS1RFU2crcm5yYmM1?=
 =?utf-8?B?aWZIbWpkQk55RnBpVkl1bHpSWjVXS2Q0S29uNjR3UFl0bnRXOHc5aFd2S0o0?=
 =?utf-8?B?VUhkQjV1aDRHM2dSb05Lb25qMjhBbU9nd1gxT0tPUTZZclpLWWQ0UktrSnU2?=
 =?utf-8?B?eUxzcGdaYnhXSlZVU3BqMk0rb0lldjVxUjRySEhVbFB5RWhiM1FoZXI5Q3E3?=
 =?utf-8?B?YVI1NjBRVjlxekVOMXl6bFZVSmNvNnlsb1MwbkFsL2FSbW1aZlg4aGE2dFRK?=
 =?utf-8?B?SnhjSmZNVG9DUXhMZyt2aXlxbERUN3Q3ZWcxcGk2UzNodEJIekIyNGtBLzlh?=
 =?utf-8?B?VDU2UXNKbFVxK3VXZmk0bE1hb2xBdGZ4a1V0cGoxNzExK3NMemNEQ0QwUHNX?=
 =?utf-8?B?ek9UN1VnNE1qbVI2UEkxZHVPcGNTQStSUCtUN2pmSHl5U0sxMXBXRmVPY2gr?=
 =?utf-8?B?MXBCa1Y3dEhhcVdySit2bElOMVJOMXE1RHNVV0pEdHdxZlpHTjVUc0dxU2pH?=
 =?utf-8?B?bjZMUDRXWTJyQUpzWVQ0NTA0SEZnNnhKR2xXWFdlUlhhSnRGUlVkV251QkRj?=
 =?utf-8?B?YzMvMmRWZ0hqM1N3V2RFYXFHSlJIdlYxbFd1NVpRL3BKNWNaQVlrbmZsbncz?=
 =?utf-8?B?TTF3UDNhMVdYa2xjU25UdkV4c0ZjUU4vS3E1T2JPWmNPWXFVV25DQUVWNEZw?=
 =?utf-8?B?RVo5WXgvQWkvamxGbHZ1ZDYrM29tSUQxbTZ5Y3Y1M0YxeXVrbnJkQm1KUkxz?=
 =?utf-8?B?eEFSV2ZmRDVZM0tWay9IZy9uZDNadlJvVm5VVUhMYjVvd0dodUFjWEpmY0t5?=
 =?utf-8?B?M1NDRnpzWUdTL2o4bmtsTFRjQ1RVWkxsU0d6WU1GcGdWWTBzRWJNMXBuZFpP?=
 =?utf-8?B?L3BvcTBmR2d6VytKc2d6NldrQkg4TVhUc2dyWUN0NFNKdDVnTEFoTGdZL1N2?=
 =?utf-8?B?bm5TdVQ0anVMZjVJTlFrOVpzQ21VVjhaV3RqaUlnZ1B2eTQ4ZzI5SXRFR2Y1?=
 =?utf-8?B?bUNhTTlDeHFsUXMvUUhXYVdGUDFrT1AxYTlveG1XYkw4ZTBKdGFaeWF5M1h0?=
 =?utf-8?B?RTlyY1A4N0tmdFNISERjZE1TN1Jqam9taks4NlNNTW5maWZiV2NPbnJybm5w?=
 =?utf-8?B?MnJyckhLZC8rcW9LNEpmSi80N3RCVnNTZGlxZSttR1VJQTBTYUFEVHdFZnVV?=
 =?utf-8?B?eWoxODcxakVSMlZoZnBEQm82eDQ3enF5N2JGRUpwYmViWVV0WGo3Y2V3ZEwy?=
 =?utf-8?B?QVcySTV0ZEJBV3pnZU5USWhSWjBlTzRhR1hZQWtpOUJOcUE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXdaUC8yZ0pqT1dJKzliR2N5cVVPV2RtT3gvWVJNVkJmTmtuZW96NW13Z2hv?=
 =?utf-8?B?TEtUVGpibEVFSzBzQzJ6MzR0NHd0MUttblk3VFlmOFdlTXhZdnpPWDNCeEN5?=
 =?utf-8?B?bVBLZzlJOXRkakZhQ1FNcExCYWtXRlJiMkNKYzk4SVg2Wk9NQnRqYUc1SmY2?=
 =?utf-8?B?N0xmYkZrVVMySUdOMURNSHR1MjM3eWVuZEovaVJmQ2pEUTJVQkszSDlCUFdl?=
 =?utf-8?B?OWZLQmVWNzBnMDkrUWhhUnEzL3ViVFJjeTl6K0JiYWZBMVhQeE5XdWt4TGM2?=
 =?utf-8?B?cW5xS3JVMUthc3V3N3FhYUplRUhMZzVGNFA1bG5rNDFDdHVhdlArOTJQa0pS?=
 =?utf-8?B?ekJuUUJCbE4zTjBUTnc3dUR2U0xnQUhYc0JxcktkcEkyYUlpWWVBTjFoWUFl?=
 =?utf-8?B?THFENzZRTzBqb0hCWkxHOXhZS1dsUVhwbW9wbUhkQVIwZC9PYWFqcngyZHlK?=
 =?utf-8?B?SmFjTldubHp1TGJZK1VqYks1UDlraitrK2Y4aXF2MEQyelhQNVR4bElQVFNj?=
 =?utf-8?B?ZkNFSS9OaVBLMkUweHFNTUtpZVBuNnF6ZHJPamJwM1MyemRhSElVODNsTExo?=
 =?utf-8?B?cFoyd1FJQ1NrZDg5YmVIMFlIK0ErZVJ3eExJN2xBSVdCQTlRUDUzRGN5b2hB?=
 =?utf-8?B?UWtSVXZLLzBXbHhmWHZiZXAwZEEyOGpYWWh3dnRmWHhlWldSS3RJazFIRnJw?=
 =?utf-8?B?ZC9FMHl5c1lZQlRzaWNoTWd0RGVLVmV6M00waTRMNjc4VmRuVUFVZS8zMnBh?=
 =?utf-8?B?NnNhRlJDVUp6UWc4TE9aeSs2OHRJaEp2RXNLNVp0V1MrSVQ4NndzbGJXWWd1?=
 =?utf-8?B?VWF6aTA4ckMwalZieUVpZVg0NWlrRnBKTUdTYWFyOGVKNkdLTTk0WCtwK0M1?=
 =?utf-8?B?YzYvcExvVEJKblFHbVA4UVltR0FLNURnTmg5L2tRbU9kdk92RWxMUmJJektJ?=
 =?utf-8?B?YnJJbVhYQjJqTEdqM2Q0RTdyQ0h5eUZCZTJTKzFaWEJneC9nV2xUdHNEdm5B?=
 =?utf-8?B?d0VydEJFNFptd25GY2RNV3Z1MHN6SW1xMVRXRmNRYnpzSnZTV280aWUreisr?=
 =?utf-8?B?YVRLUkZhVFhEMlJLVk1Yb0sxdmlCbkllcjN0cXJ2SkJTZ2RmQWlXTmdOMkdz?=
 =?utf-8?B?Ykh5NkxuL0NxWms1dUVsSUR5UmhwTzk4T1FNaW1FUlIrYmtHMmo1ZnR5bHZL?=
 =?utf-8?B?WFlHRStQL1Nkd1VXS2Z1RHZ4VUc4Z2o1ZmJ0eUZ3YXJHZlF2OHczZ3lma0Fa?=
 =?utf-8?B?YUNiMU5rd01iUkNBdXN5ZEx5cjBXZjQ5UVpUcHpwRGN0a2FhY1ZNU2ErWUx4?=
 =?utf-8?B?VHNVT3B6bkx5NkxoWTFibkxTbVYweDV1VlZaN1JYZTJRVm5OUmpQOXUzNlJF?=
 =?utf-8?B?Q01GT1kzQzFvRlZuNE1tSHJTMXlGRHBuTzZxc28rSXlhL2pPT3Z2WThwdVpp?=
 =?utf-8?B?L08wb3Exa0g4Vmh2L2Y1U0MrTFI0V2o2Znk0eWlYMXB6ZmozblJDRy85VitK?=
 =?utf-8?B?Nk5TVGdpQXVFTXFsRU9tV1V6dVZnQndQQ2FWcjNVYnc3OWh3TmVmdW52d1Z0?=
 =?utf-8?B?K2VJWEVQVlY5NUFzQXlpRm9pbFhGd1FTeVVydisybmV3cStjdnk1V1RGOTJX?=
 =?utf-8?B?MGJHTC90RWRBMTExbXhSd0s5b29mSERUejRwSWp3czFQMVFaRWw3M2ZGYnF4?=
 =?utf-8?B?VW1WZDRMalpOckJveEsvcHI2cElLOEwyV2lPNm9ldmg5bUJjZUUrUmdQMzZa?=
 =?utf-8?B?NGtmN280aTh4aCtFbzJuNWdOakpkYWFjTzl6YmlQS0NPbFVyR2pCN0tDNnIy?=
 =?utf-8?B?NmhVL2R2QjBBVHQyaFpPNXVYOWp1UTlkSkF6cC9USU5LV2t6cTJCU2pmVTBN?=
 =?utf-8?B?ckFHQUJKeUtpSk13TUx6RWNxbllsblhvVm1jTnc4d2dKR0R0S0Y5cVoxOXVW?=
 =?utf-8?B?bURYNThQV0xaMThPSkxweTBrQWhzc204d0ZNaHRuaVVxS0xmZXhTMHFLSENZ?=
 =?utf-8?B?Zk82RkFjZmp1dzRmWlhSMWs2NXhuT2dQR2UyNGY3RmJRbi9TYWRPd1RMNSs1?=
 =?utf-8?B?UkhHZlVIUzBMK3BnR1FyWnk4bDkvUkNIYXcxdWVtcnc3SGNVcmNpOU1pSTZG?=
 =?utf-8?Q?ixUE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43428057F48B4043A44C94E6E91CF62D@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e485982f-b135-4e4a-ba51-08dca17f4832
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 07:58:42.3537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: keQRQRU7F5hbqIppRiqNUJlxymL54+OzqReXwSUFpG9FTRSfk1DEyVQGEW/CrzMaytefvi8K+0dSojDKwjtnYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200

SGkgYWxsLA0KDQpPbiAyMDI0LzcvOCAxOTo0MSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+IFRoZSBn
c2kgb2YgYSBwYXNzdGhyb3VnaCBkZXZpY2UgbXVzdCBiZSBjb25maWd1cmVkIGZvciBpdCB0byBi
ZQ0KPiBhYmxlIHRvIGJlIG1hcHBlZCBpbnRvIGEgaHZtIGRvbVUuDQo+IEJ1dCBXaGVuIGRvbTAg
aXMgUFZILCB0aGUgZ3NpcyBtYXkgbm90IGdldCByZWdpc3RlcmVkKHNlZSBiZWxvdw0KPiBjbGFy
aWZpY2F0aW9uKSwgaXQgY2F1c2VzIHRoZSBpbmZvIG9mIGFwaWMsIHBpbiBhbmQgaXJxIG5vdCBi
ZQ0KPiBhZGRlZCBpbnRvIGlycV8yX3BpbiBsaXN0LCBhbmQgdGhlIGhhbmRsZXIgb2YgaXJxX2Rl
c2MgaXMgbm90IHNldCwNCj4gdGhlbiB3aGVuIHBhc3N0aHJvdWdoIGEgZGV2aWNlLCBzZXR0aW5n
IGlvYXBpYyBhZmZpbml0eSBhbmQgdmVjdG9yDQo+IHdpbGwgZmFpbC4NCj4gDQo+IFRvIGZpeCBh
Ym92ZSBwcm9ibGVtLCBvbiBMaW51eCBrZXJuZWwgc2lkZSwgYSBuZXcgY29kZSB3aWxsDQo+IG5l
ZWQgdG8gY2FsbCBQSFlTREVWT1Bfc2V0dXBfZ3NpIGZvciBwYXNzdGhyb3VnaCBkZXZpY2VzIHRv
DQo+IHJlZ2lzdGVyIGdzaSB3aGVuIGRvbTAgaXMgUFZILg0KPiANCj4gU28sIGFkZCBQSFlTREVW
T1Bfc2V0dXBfZ3NpIGludG8gaHZtX3BoeXNkZXZfb3AgZm9yIGFib3ZlDQo+IHB1cnBvc2UuDQo+
IA0KPiBDbGFyaWZ5IHR3byBxdWVzdGlvbnM6DQo+IEZpcnN0LCB3aHkgdGhlIGdzaSBvZiBkZXZp
Y2VzIGJlbG9uZyB0byBQVkggZG9tMCBjYW4gd29yaz8NCj4gQmVjYXVzZSB3aGVuIHByb2JlIGEg
ZHJpdmVyIHRvIGEgbm9ybWFsIGRldmljZSwgaXQgdXNlcyB0aGUgbm9ybWFsDQo+IHByb2JlIGZ1
bmN0aW9uIG9mIHBjaSBkZXZpY2UsIGluIGl0cyBjYWxsc3RhY2ssIGl0IHJlcXVlc3RzIGlycQ0K
PiBhbmQgdW5tYXNrIGNvcnJlc3BvbmRpbmcgaW9hcGljIG9mIGdzaSwgdGhlbiB0cmFwIGludG8g
eGVuIGFuZA0KPiByZWdpc3RlciBnc2kgZmluYWxseS4NCj4gQ2FsbHN0YWNrIGlzKG9uIGxpbnV4
IGtlcm5lbCBzaWRlKSBwY2lfZGV2aWNlX3Byb2JlLT4NCj4gcmVxdWVzdF90aHJlYWRlZF9pcnEt
PiBpcnFfc3RhcnR1cC0+IF9fdW5tYXNrX2lvYXBpYy0+DQo+IGlvX2FwaWNfd3JpdGUsIHRoZW4g
dHJhcCBpbnRvIHhlbiBodm1lbXVsX2RvX2lvLT4NCj4gaHZtX2lvX2ludGVyY2VwdC0+IGh2bV9w
cm9jZXNzX2lvX2ludGVyY2VwdC0+DQo+IHZpb2FwaWNfd3JpdGVfaW5kaXJlY3QtPiB2aW9hcGlj
X2h3ZG9tX21hcF9nc2ktPiBtcF9yZWdpc3Rlcl9nc2kuDQo+IFNvIHRoYXQgdGhlIGdzaSBjYW4g
YmUgcmVnaXN0ZXJlZC4NCj4gDQo+IFNlY29uZCwgd2h5IHRoZSBnc2kgb2YgcGFzc3Rocm91Z2gg
ZGV2aWNlIGNhbid0IHdvcmsgd2hlbiBkb20wDQo+IGlzIFBWSD8NCj4gQmVjYXVzZSB3aGVuIGFz
c2lnbiBhIGRldmljZSB0byBwYXNzdGhyb3VnaCwgaXQgdXNlcyB0aGUgc3BlY2lmaWMNCj4gcHJv
YmUgZnVuY3Rpb24gb2YgcGNpYmFjaywgaW4gaXRzIGNhbGxzdGFjaywgaXQgZG9lc24ndCBpbnN0
YWxsIGENCj4gZmFrZSBpcnEgaGFuZGxlciBkdWUgdG8gdGhlIElTUiBpcyBub3QgcnVubmluZy4g
U28gdGhhdA0KPiBtcF9yZWdpc3Rlcl9nc2kgb24gWGVuIHNpZGUgaXMgbmV2ZXIgY2FsbGVkLCB0
aGVuIHRoZSBnc2kgaXMgbm90DQo+IHJlZ2lzdGVyZWQuDQo+IENhbGxzdGFjayBpcyhvbiBsaW51
eCBrZXJuZWwgc2lkZSkgcGNpc3R1Yl9wcm9iZS0+cGNpc3R1Yl9zZWl6ZS0+DQo+IHBjaXN0dWJf
aW5pdF9kZXZpY2UtPiB4ZW5fcGNpYmtfcmVzZXRfZGV2aWNlLT4NCj4geGVuX3BjaWJrX2NvbnRy
b2xfaXNyLT5pc3Jfb249PTAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8Smlx
aWFuLkNoZW5AYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdA
YW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5j
b20+DQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYyB8IDEgKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2h2bS9oeXBlcmNhbGwuYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4gaW5k
ZXggMDNhZGEzYzg4MGJkLi5jZmU4MmQwZjk2ZWQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vaHlwZXJjYWxsLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0K
PiBAQCAtODYsNiArODYsNyBAQCBsb25nIGh2bV9waHlzZGV2X29wKGludCBjbWQsIFhFTl9HVUVT
VF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0KPiAgICAgICAgICAgICAgcmV0dXJuIC1FTk9TWVM7
DQo+ICAgICAgICAgIGJyZWFrOw0KPiAgDQo+ICsgICAgY2FzZSBQSFlTREVWT1Bfc2V0dXBfZ3Np
Og0KPiAgICAgIGNhc2UgUEhZU0RFVk9QX3BjaV9tbWNmZ19yZXNlcnZlZDoNCj4gICAgICBjYXNl
IFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZDoNCj4gICAgICBjYXNlIFBIWVNERVZPUF9wY2lfZGV2
aWNlX3JlbW92ZToNCg0KSWYgeW91IHN0aWxsIGhhdmUgY29uY2VybnMgYWJvdXQgdGhpcyBpbXBs
ZW1lbnRhdGlvbiB0aGF0IGFsbG93IFBIWVNERVZPUF9zZXR1cF9nc2kgZm9yIFBWSCBvbiBYZW4g
c2lkZQ0KYW5kIGNhbGwgUEhZU0RFVk9QX3NldHVwX2dzaSB3aGVuIHBjaWJhY2sgcHJvYmUgdGhl
IHBhc3N0aHJvdWdoIGRldmljZS4NCg0KSSBoYXZlIGFub3RoZXIgbWV0aG9kIHRvIHNvbHZlIHRo
aXMgZ3NpIGlzIG5vdCByZWdpc3RlcmVkIHByb2JsZW0uDQpJdCBpcyB0byBhZGp1c3QgdGhlIGNv
ZGVzIG9mIHBjaWJhY2sgb24gbGludXgga2Vybmwgc2lkZS4NClNlZToNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jIGIvZHJpdmVycy94ZW4veGVuLXBjaWJh
Y2svcGNpX3N0dWIuYw0KaW5kZXggNTFiMzAwMmIwODViLi5kYjk0NTI5ZTY1ZjkgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jDQorKysgYi9kcml2ZXJzL3hl
bi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jDQpAQCAtNDQ1LDYgKzQ0NSwxMCBAQCBzdGF0aWMgaW50
IHBjaXN0dWJfaW5pdF9kZXZpY2Uoc3RydWN0IHBjaXN0dWJfZGV2aWNlICpwc2RldikNCiAgICAg
ICAgZXJyID0gcGNpX2VuYWJsZV9kZXZpY2UoZGV2KTsNCiAgICAgICAgaWYgKGVycikNCiAgICAg
ICAgICAgICAgICBnb3RvIGNvbmZpZ19yZWxlYXNlOw0KKyAgICAgICBlbHNlIHsNCisgICAgICAg
ICAgICAgICBkZXZfZGF0YS0+ZW5hYmxlX2ludHggPSAxOw0KKyAgICAgICAgICAgICAgIHhlbl9w
Y2lia19jb250cm9sX2lzcihkZXYsIDApOw0KKyAgICAgICB9DQoNCkR1cmluZyBwY2lzdHViX2lu
aXRfZGV2aWNlLCBvbmNlIHBjaWRldiBpcyBlbmFibGVkKHRocm91Z2ggcGNpX2VuYWJsZV9kZXZp
Y2UpLCBJIGVuYWJsZSB0aGUgaXNyIGZvciBwY2liYWNrLCBzbyB0aGF0IHRoZSBmYWtlIGlycSBo
YW5kbGVyIGNhbiBiZSBpbnN0YWxsZWQgYW5kIHRoZW4gZ3NpIGNhbiBiZSByZWdpc3RlcmVkLg0K
SW4gdGhlIGVuZCBvZiBwY2lzdHViX2luaXRfZGV2aWNlLCBvcmlnaW5hbCBjb2RlIGNhbGxzIHhl
bl9wY2lia19yZXNldF9kZXZpY2UgdG8gZGlzYWJsZSBpc3IgYW5kIHBjaWRldiwgc28gdGhlIGZh
a2UgaXJxIGhhbmRsZXIgd2lsbCBiZSBmcmVlZC4gVGhlbiBsaWtlIG5vdGhpbmcgaGFwcGVuZWQu
DQpEbyB5b3UgdGhpbmsgdGhpcyBtZXRob2QgaXMgZmVhc2libGU/DQpJZiBzbywgd2UgZG9uJ3Qg
bmVlZCB0aGlzIHBhdGNoIGFueW1vcmUuDQoNCkxvb2tpbmcgZm9yd2FyZCB0byBnZXR0aW5nIHlv
dXIgaW5wdXQuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

