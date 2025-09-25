Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891BBB9DFE4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 10:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130179.1469776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1h45-0007g2-5N; Thu, 25 Sep 2025 08:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130179.1469776; Thu, 25 Sep 2025 08:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1h45-0007dR-2F; Thu, 25 Sep 2025 08:10:57 +0000
Received: by outflank-mailman (input) for mailman id 1130179;
 Thu, 25 Sep 2025 08:10:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JIiA=4E=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v1h43-0007dL-Qt
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 08:10:55 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 271dfe40-99e7-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 10:10:53 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB5620.namprd12.prod.outlook.com (2603:10b6:510:137::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Thu, 25 Sep 2025 08:10:48 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 08:10:48 +0000
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
X-Inumbo-ID: 271dfe40-99e7-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqDzJxPulIu74dNkEE9ukhNibm6RlFj5qYtA1PMQzM4L5T/m3sWJ8cNYUdKI1BRG5ebBE86I6b0P/FFTsBgfXm+4xZSnqtwlhEUwAAwjyOoo5h39yU+xWl2f4grGqxmIR+8ECA5pppd5TUyFu9cgSOaGs9m/H2jRpvGDDHAO7gDZlUctFmN0osWSqJYX/ScEggzBHe+zBLOWafqKc/TTAkUFB7jZPVrU4o0wjCmRdwnQT6Mx90L6A9er9TNkK3VRq47mJ7lcboM3DJYNyGRW6EJQQwaUddXQnvQ/M6ZdvTHfdda9HevLUwYPmqt82fO2vE97Ecb5q5Sj/xPye8lG0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ve0AF8Q8uTN+d7J109dtLBBvDpkWypkIvr7VpucyulM=;
 b=mkv5Bcl3ZYPV1f8wQbZ25xx1lH5kQBS0K9PBvGjiWlEF+KUmPLRJHxuJMgIiJFPVTfhljvTF1IZ0PXkLYZ0vBRrs7JwOSCqZNG8WRdG+3vnFi551kjCUbTeJ+zk7LCWhsSKtX1IxDOcLroGMd+aemWZf9pNorqcpCun14vm+LtFA0rUCD+zwGGPv0WLe4qdHDeZUKJ67C34eApai9lBsCrNTJHBqv3hQ8KXU2u2imC0GiGrqoJkjPzg38m5TU04OxB2umaFC75NbIjC6hRgWhw2engjN1A+dw9R2dZcOJMDjiE5QbaZjEvjFAQS9k64OzNpF8r21puqTIRfWgUIhAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ve0AF8Q8uTN+d7J109dtLBBvDpkWypkIvr7VpucyulM=;
 b=Y0+Npw++tVh9gTf78yWCX6SXG9X4+jGtRiSW3Uldr84/8Ev/Su6COAZNyxX6R9aQsK6MsVQBet/zEVBw08/vpSOW2juDAimqSg4kzZA7RaO+55vCoWJYUe54Jscpr6Mzn8xFgD74WT/MYb+4ECHRHTmNMkM3qn1NXfs7PRQseqM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH v2 17/26] xen/domctl: wrap xsm_set_target() with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v2 17/26] xen/domctl: wrap xsm_set_target() with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcIiYXdlMjGvcRv02JcgghJSn63bSNRauAgACV6QCAFcYywA==
Date: Thu, 25 Sep 2025 08:10:48 +0000
Message-ID:
 <DM4PR12MB84519898E48E3CFF3B36341DE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-18-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2509101937040.52703@ubuntu-linux-20-04-desktop>
 <62c80f82-d85d-4d11-a7f2-4193bc882911@suse.com>
In-Reply-To: <62c80f82-d85d-4d11-a7f2-4193bc882911@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-25T08:04:53.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB5620:EE_
x-ms-office365-filtering-correlation-id: 60139f70-c0fe-46f2-30a2-08ddfc0b094c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?T0VpU0dGWWkydytEcFovYWxlYW42bE5tSUFEQ0I3eTdWM2tTRGM3L21zekUx?=
 =?utf-8?B?UkZDZFR1Y0Fmc09iZHRldkdDZ3E4NENROVhQSnZhb1VaVlpRMDJ3aUxjRVhy?=
 =?utf-8?B?NXo2YU5IRGkrbS9aZXMvV0pKNDlmMjBtb2ZINUxOWFo2RnNBVWZHTTBpcUZm?=
 =?utf-8?B?OWt1bDhVZmVicWpPSk5CS1BYQURCcVBxUlVpTTdOVmk4RWdPdWpQTDd1b0xh?=
 =?utf-8?B?K2RaMk5sbTUrb1F0UndtcFZkOVI1TUs5Q2laZmFWNGJleThiR1VNN3FuMnhu?=
 =?utf-8?B?dnF5bFRnRXVLaHE2NjBlMkZLZE1QMXhQeXBicFhjSTJCSGFoemYvZGNPMWxo?=
 =?utf-8?B?bjN1QmhuL2pXM3h0d0ozY0V1RFNKUDFRT2ZSNHhwRUxia2NiOG5QMUxPa1M3?=
 =?utf-8?B?K1ZrQ2dTcnFLMjhIeFUvL2hJdDBnVWxLUDlWOXdkNVF6MHdhcDhBLzJOc3R6?=
 =?utf-8?B?eXlrRldjeFNvYkFhcUlVcDlqZlNBZVExWU1IMXFCMFpIOGFZRFg3TFJQazZ5?=
 =?utf-8?B?bGFxdEcvbnN3cExVclhTVkdMTU5sT2Y2L1BaTnBySHFKbnVONXhVZ1NGRWNw?=
 =?utf-8?B?MTVsYU9ub3pXRDZaQjcvYk0vWHpyMVNRczdpMHNXaG01M1R0czE0MHoyYVll?=
 =?utf-8?B?YnMzYlhFQjdhV2c2Wmh4L0xzeUM1blB3b29QZWNsa3hpeEJHcGNUUm9SM3FJ?=
 =?utf-8?B?OGJPWDNhVzVidU9VdExEUjh0aGJrZnllMExyUEEzZFRkNVFyd21icEhRY0Jy?=
 =?utf-8?B?M09leU5kYm05ODNTZXVYYS9hNnNuMlZFRjJBbmNvSUY2OEMyZVl6UDN1YUhS?=
 =?utf-8?B?aFdMc1hEcmNOV1l3bWhibDN4K1AxU3dlSnh2ZFFJYmdCeW5meVhCRld3Yk43?=
 =?utf-8?B?RFdaei9NSzM1RFZpVmdqK01qNkxwTlVpeVhZZEtNVGJ2dTkwa1Q0c3owclUv?=
 =?utf-8?B?akRVUmtYSWdPQ0J5L2xJell1M1VacG14TXhqcWdaWjR5YVhEYXZpaVJVWXNh?=
 =?utf-8?B?T213bnJTYnRiUVRFcDFTTUlucmpmYitackN0MDF5ZU9WL3BHNTA5OFB0L2pZ?=
 =?utf-8?B?N1hnTlRWa0dONDdUZ0gvTXNpcEdCTklMZmU5L2ZzeTlrc29FSGJscUhiT2tW?=
 =?utf-8?B?YisyU2RVRXFMSzl6d25yaWtISnZsUVlzUktabFY0eXc5dDBBczJjQnA0UjJN?=
 =?utf-8?B?TCtqeFNrVS9PQmFGOWdONCttc1pzUEZTN29sb3RmaTdVclVKT2pwbEdqL1Nr?=
 =?utf-8?B?bmpUU05EclIxWE5IR0FpY2pYYnYvNmFTdlBMNlFpc2dnODZpM3k0S3B0NTNH?=
 =?utf-8?B?N0ZjTTFHSk5ia3FNVkxwM2pXU0lkOXBZcFhFYzMyYnJZNXVwVUNuVTN1bkUv?=
 =?utf-8?B?cFlGLzk4czBQazRLOGpMNzRyUkJJSDRxQjRvVXErQjQ1WG1lUEN2Q2M1WGFu?=
 =?utf-8?B?dUdlbkp4S3RrRW1VQWkvaUtIV0RxZlBFdXV0bjVkRy9iWlp3bzBtT1hLODc0?=
 =?utf-8?B?ZnhSTnkxcncwbmt3SEtIa3M4TUM0ZTBtdllqaWxncG16WFdqbzNjOUJzUVZj?=
 =?utf-8?B?L09RL0YrZVVyS3doUFBHWC9GeGtSMG04eXFORS93blN1NkdtdTdHSndNV3Z6?=
 =?utf-8?B?SjkxU1FmcWVRZ1MxM2s0Z3hHSG9BcW5jTGg2alJ3d2RGSHNtb2NoSm1WTUpa?=
 =?utf-8?B?bXIzMDF0T0hPZVdqbTkzZ05ud0xnVEI0ZE9RNTFHY2czRG1NYnRQR1ZlSEhQ?=
 =?utf-8?B?RnF4WFhYQmFDaVhhV0tDaDVxUzFzd2Fid2tZaDRqZTNCdVk0cW5zcVh5QjJG?=
 =?utf-8?B?OHZiRVJsSzRHNHZRTjRXMHlOS2g2QXl4dDlFQzkwWWZiMW4wdEkvS29lQW1p?=
 =?utf-8?B?ZVZPTGxzL2FSa1BLYjQvV2VGdXpPUlhDajQwU1JBQWhVa2Via0pTcURjRnRI?=
 =?utf-8?B?MHpDZHYyU2NMd1JPOGFEbGZFUjgxU002V3lZVmVLb2F0bVpvQ3c3YWRlNUpG?=
 =?utf-8?B?OXh0M3dtSzdvbWJzNllIOWtscGdDUHM3L1lOTDdWakZIYlFscWxNL3M2M0dE?=
 =?utf-8?Q?7NtrGn?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SG9MQ0Flb0RESWVMaE1pQmdXREdDYkJEQ1V2SFNFUHlZWncrc2FaR09hWHoz?=
 =?utf-8?B?WW1LNTFGQTNncSs1MHdENDNXNG1tMjkrSmNSc1N1YmkySU1CVUtud3ZuOC9q?=
 =?utf-8?B?bldRZ1MrNitEcnVjSHFCandzS1BwMVRyMDBRTW8rRlQ5OHAydlZCbXZXRVp6?=
 =?utf-8?B?a1JUQmZHMGJYaW1XZDJnK253b29VVlBmeHNRT21HSklaQVRoYzNNNEdscVRr?=
 =?utf-8?B?Zy9yQ2hlRnlycjFxNjd3Z0tUVmcrTzMyaXlwaDQvdlp4d3lmaGYyZkpVZGc1?=
 =?utf-8?B?dzJBWVY1alp5dEpTM3p4bWdRUFlONnpHQnFmd3dicHJORzRCKzNOTzRuOWVM?=
 =?utf-8?B?OE44N3dvNDlNcUl0R05XczlYMHpNclRtbTh3R0JabUIvVlJlL3RjOC84WWM0?=
 =?utf-8?B?R2N4SXgxZmpzTnRXVmtjUGs5L2hkeGxBOHlaV1RYanExc3I5cnFxemxHSjdI?=
 =?utf-8?B?TjN4eCtpS2pZb3ZzRUIvNEhqVU5UVkFEcFdDTTBienMyd01TeCtZZjN3Q2dZ?=
 =?utf-8?B?TXB3d2NmTzVHUTN6WGxRMUlSb2tYZit0cG1hbXNIOUd2UUlDcmNGUHozcHVa?=
 =?utf-8?B?dnlTKzhNU3pVdW5Wc0NPN2N4Tyt0SVRQcmpzeHBEK0ZXRXRzSFZleUpqeDk1?=
 =?utf-8?B?Q0FKeThxcWhYSk04RU8zWkx6bGJVWCs5NkM5SjRUVW91akl0NGpIcFJPN3Q4?=
 =?utf-8?B?V3d1cE9sQXVnYXFmcGxrRHRYeUtqMjZxSnNKcXpqenpRYzRyOTdoVmM3dlJE?=
 =?utf-8?B?QTlXcXB5eVI5aEtJY3RrZEVQQ29ZRHVpeVZIWTJzTUg1TzdPVjFzNTN3S0pr?=
 =?utf-8?B?VndnblZkeDc2aHRYbThCRXZ2VmdDdWI4YjQ4SllYODB2RDdWbDZaMmkreHA4?=
 =?utf-8?B?cVFONGM0WUZ1amNQVEVDQ1A2TjIvcUlzL2JqRnlrYVdHR01PMkVwVW5sZnoy?=
 =?utf-8?B?enQwUm9FeFZ1QjZpQUM2VGMrUGZCMHVPaU1XcFdsRjBRMEw0Y01EWWdBQXpC?=
 =?utf-8?B?cWN3VTk2QzRyTldUbUdoZCt6NDBITmVCVEJFR29KZ1l5cVZjb3dGQ3VUNEx3?=
 =?utf-8?B?cU9IaUQ3cm9KejJUSDBiZGxudjZFNE5IcC9SQnd0Z2dUVVZ2azZ3N2k2SS8w?=
 =?utf-8?B?TmhkSDQ5eU5lS2FHbngxUXlLeHVNNHh0Q1NDRERTVGVZWmo5dXFkT2ZBblda?=
 =?utf-8?B?V0g5VXVtVHZ2QVMzVDRQbEY1bEsvSmRnRnNMVWNuOTExaFFQS2ZMOG0xU0lr?=
 =?utf-8?B?d1VOb2s5YTE3N0ovOVRQQVdrQVl4WVJpWlk0R29PT3Q3cUhUTU1CdGdmQnUw?=
 =?utf-8?B?TFJRelVoUlVON01kb2RBZmZIYlFRMXlNKy9kRUFSeDhMc1RPQm4vY0JqQ3Z3?=
 =?utf-8?B?b08rSzBmdHhINEJTdklTSmxOcE9naE51STlEbXhPeDdYNFdrUis0R0U2bUIv?=
 =?utf-8?B?aUppT1BVb2JzSGptZFhkdGFtTm9wL29LQmtPNkNoaXFGdDQvZThMeG9sM3V1?=
 =?utf-8?B?cEVSb3lsb1VjUGdaRHM5eVhhbGpORC83TXhydW1PSVZ3VGtpSlhncXp0T21B?=
 =?utf-8?B?eFl4U2E5eGJyM0puaHVLRzJJZTFVVFdDN3NZaGxPd1hTZHVjU0RsNHdrZmZ6?=
 =?utf-8?B?L0g3ak5KU2FPejU4VUdnRGhkREhWem5UaitDMm1Gb1pMOUFYQ1ZwTk4zbHlv?=
 =?utf-8?B?bnU2cDdwLyttT2xJMklZRUErZXByVEQxaWtUNTZjV1gyTlNHMlE3RVBPRnJu?=
 =?utf-8?B?Tm1zRzBHK2JqVE85S2I3UE1KT1dmTUp1TURrby9SU094WlFEM1FGMHgrUktZ?=
 =?utf-8?B?UldPdXJFSDNKd2s4d1pOamZid0hPVVgxVWJqTjRSMllKbXFCajNjSTJQNEQw?=
 =?utf-8?B?d05aUER4QnQzQTh4Q2d1Y05hUGhhY1lzRmt3aDd3emFyRzRPNEFLU0xSQTcz?=
 =?utf-8?B?L04zNXZGcnBsR1IwbmpvdStnMHNEeWtiNUhEMUNWVUNKdjM4b3JWS3piV2pK?=
 =?utf-8?B?ZXU1U1cvWkUvZDNnQ2d3Zi91ZmxXTVhzeGxqdkF0Vllyd3hRRmJiTFU3dVhO?=
 =?utf-8?B?bU9BckVsZGszTkY5U1RGazc4QURjVGlzQ1ZxS0ZmaE5naUp3WCs0SnNOd3NO?=
 =?utf-8?Q?GYGU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60139f70-c0fe-46f2-30a2-08ddfc0b094c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 08:10:48.7093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hyC6kjej8kH0OuApcDHNBxxvrhDSuoh1ls3eyweuyQa570euh4TuoICgEzMKsC60llXWN27ZWIILarJBRU1ppQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5620

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTEs
IDIwMjUgNzozNCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBIdWFuZywgUmF5IDxSYXkuSHVh
bmdAYW1kLmNvbT47IERhbmllbA0KPiBQLiBTbWl0aCA8ZHBzbWl0aEBhcGVydHVzc29sdXRpb25z
LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MiAxNy8yNl0geGVuL2RvbWN0bDogd3JhcCB4c21fc2V0X3Rh
cmdldCgpIHdpdGgNCj4gQ09ORklHX01HTVRfSFlQRVJDQUxMUw0KPg0KPiBPbiAxMS4wOS4yMDI1
IDA0OjM3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+ID4gT24gV2VkLCAxMCBTZXAgMjAy
NSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+IEZ1bmN0aW9uIHhzbV9zZXRfdGFyZ2V0KCkgaXMg
b25seSBpbnZva2VkIHVuZGVyIFhFTl9ET01DVExfc2V0X3RhcmdldA0KPiA+PiBkb21jdGwtb3As
IGFuZCBzaGFsbCBiZSB3cmFwcGVkIHdpdGggQ09ORklHX01HTVRfSFlQRVJDQUxMUy4NCj4gPj4N
Cj4gPj4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFtZC5jb20+DQo+
ID4+IC0tLQ0KPiA+PiB2MSAtPiB2MjoNCj4gPj4gLSBhZGFwdCB0byBjaGFuZ2VzIG9mICJ1bmlm
eSBET01DVEwgdG8gTUdNVF9IWVBFUkNBTExTIg0KPiA+PiAtLS0NCj4gPj4gIHhlbi9pbmNsdWRl
L3hzbS94c20uaCB8IDYgKysrKystDQo+ID4+ICB4ZW4veHNtL2R1bW15LmMgICAgICAgfCAyICst
DQo+ID4+ICB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgfCA0ICsrLS0NCj4gPj4gIDMgZmlsZXMgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gTm8gY2hhbmdl
IHRvIGRvbWN0bC5jID8NCj4NCg0KVXNlIGluLWZ1bmN0aW9uICNpZmRlZi1lbHNlLCBsaWtlIC4u
Lg0KDQo+DQo+ID4+IC0tLSBhL3hlbi9pbmNsdWRlL3hzbS94c20uaA0KPiA+PiArKysgYi94ZW4v
aW5jbHVkZS94c20veHNtLmgNCj4gPj4gQEAgLTU5LDggKzU5LDggQEAgc3RydWN0IHhzbV9vcHMg
ew0KPiA+PiAgI2lmZGVmIENPTkZJR19NR01UX0hZUEVSQ0FMTFMNCj4gPj4gICAgICBpbnQgKCpk
b21jdGxfc2NoZWR1bGVyX29wKShzdHJ1Y3QgZG9tYWluICpkLCBpbnQgb3ApOw0KPiA+PiAgICAg
IGludCAoKnN5c2N0bF9zY2hlZHVsZXJfb3ApKGludCBvcCk7IC0jZW5kaWYNCj4gPj4gICAgICBp
bnQgKCpzZXRfdGFyZ2V0KShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluICplKTsNCj4g
Pj4gKyNlbmRpZg0KPiA+PiAgICAgIGludCAoKmRvbWN0bCkoc3RydWN0IGRvbWFpbiAqZCwgdW5z
aWduZWQgaW50IGNtZCwgdWludDMyX3Qgc3NpZHJlZik7DQo+ID4+ICAgICAgaW50ICgqc3lzY3Rs
KShpbnQgY21kKTsNCj4gPj4gICAgICBpbnQgKCpyZWFkY29uc29sZSkodWludDMyX3QgY2xlYXIp
OyBAQCAtMjU4LDcgKzI1OCwxMSBAQCBzdGF0aWMNCj4gPj4gaW5saW5lIGludCB4c21fc3lzY3Rs
X3NjaGVkdWxlcl9vcCh4c21fZGVmYXVsdF90IGRlZiwgaW50IGNtZCkNCj4gPj4gc3RhdGljIGlu
bGluZSBpbnQgeHNtX3NldF90YXJnZXQoDQo+ID4+ICAgICAgeHNtX2RlZmF1bHRfdCBkZWYsIHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkb21haW4gKmUpICB7DQo+ID4+ICsjaWZkZWYgQ09ORklH
X01HTVRfSFlQRVJDQUxMUw0KPiA+PiAgICAgIHJldHVybiBhbHRlcm5hdGl2ZV9jYWxsKHhzbV9v
cHMuc2V0X3RhcmdldCwgZCwgZSk7DQo+ID4+ICsjZWxzZQ0KPiA+PiArICAgIHJldHVybiAtRU9Q
Tk9UU1VQUDsNCj4gPj4gKyNlbmRpZg0KPiA+PiAgfQ0KPg0KPiBBZ2FpbiBJIHdvdWxkIGhhdmUg
ZXhwZWN0ZWQgZm9yIHRoaXMgaW5saW5lIGZ1bmN0aW9uIHRvIGJlIHdyYXBwZWQgYXMgYSB3aG9s
ZTsgdGhlDQo+IHRpdGxlIHNheXMgZXhhY3RseSB0aGF0LCBpbW8uDQo+DQoNCi4uLiBjb3VsZCBh
dm9pZCBhZGRpbmcgaW4tcGxhY2Ugc3R1YiBpbiBkb21jdGwuYy4gVGhhdCdzIG15IG9yaWdpbmFs
IGludGVudC4gQnV0LCBhcyBqYW4gc2FpZCBpbiBvdGhlciBzaW1pbGFyIGNvbW1pdHMsIGl0IHdp
bGwgbGVhdmUgdW5yZWFjaGFibGUgY29kZXMgd2hlbiBNR01UX0hZUEVSQ0FMTFM9bi4NClRoZSB3
aG9sZSBpbmxpbmUgZnVuY3Rpb24gbXVzdCBiZSB3cmFwcGVkIGFzIGEgd2hvbGUuDQoNCj4gSmFu
DQo=

