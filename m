Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529CE9EC93E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 10:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854196.1267459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJ8d-0002dV-Bz; Wed, 11 Dec 2024 09:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854196.1267459; Wed, 11 Dec 2024 09:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJ8d-0002b1-8h; Wed, 11 Dec 2024 09:36:11 +0000
Received: by outflank-mailman (input) for mailman id 854196;
 Wed, 11 Dec 2024 09:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqCb=TE=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tLJ8b-0002aX-GM
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 09:36:09 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:2417::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57d7988b-b7a3-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 10:36:06 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB7409.namprd12.prod.outlook.com (2603:10b6:806:29c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 09:36:00 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8230.010; Wed, 11 Dec 2024
 09:36:00 +0000
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
X-Inumbo-ID: 57d7988b-b7a3-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilZ6BLWq/Rzqx9TxHXFImWwoyvl02jWsizADWqopEzRjTitZ5/EvPYFYpA0LinJcfBXHJcAqP7Ne8ngR90lzRwYuxa4Udg3IanXl6CG2K4ZQ39LXVoQanRYKA/Bo2hVj8f6Gim2stcYCrOTAVZFA9TibErxyIwDzoWvwPXZzBTudncknxAJKcrAFjgDhmTqCI9Sat3FQezN39KxzC4X0WIxdnCfFR59DY1xkgxAlWMQDrOo6wb3nGQrqQNeq+8nMUz914H/x4pfh+F6HPVK/NpyYXxVN1pwLrPRN3tKave9sG2M5awBTrNS57mj815MkjIaATLptp6weNInf+eJeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JiLX/zyj4DDjCmIMZb5KyLG0RQYZl2sZpAhoa/iYos=;
 b=QWcennDchDC4nmAY7j13GS5El7y4roJT8VvsNU5BtFkS2pbW0q4CdjzNnIfgB0UEl0jbRz3Bh0fbYqfgy3jr136hbhCmhqwhGakNU2hABDkpufA20KjoEY84UdPlKWhhyR4SjuC3HVdmoG2Fq07zZuYjpvz0/zQWZB92cbWIgH0yRlWVrrIsQClHxT6rIObiFZxKYFZyGQi1sX3ZE051t5qzqeuUK8cmCycyWvBUj3E/RMXNE2ceAs/PSq6vGThVgfnKnwH5/SPOuIlihCBb1AWgwPd4J9dz4dmGPaggzUhLHgvouZJoY6PNLDMuAxEeBhkA18TkE+yy3KcW2DtmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JiLX/zyj4DDjCmIMZb5KyLG0RQYZl2sZpAhoa/iYos=;
 b=3fnOKzajRoPRR5kzkt/BAl4BvJqxab2Dili4d/nUSo7NkSy/oM99ozAfDwXY//af7ryAlyPqWaRCNWSpMmRcNptpXarWhfSwPjyiJkJMcHF477oQveCOcTl4RZTiq5MMf6f7GPbZtv9YYpM4RKI2E9Z7yxIb9PLJzXLU7mbLwxI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Topic: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Index:
 AQHbRIDgGHZ3ofHO0UuqqXvn+EZCabLd/CGAgAGXh4D//4qBgIAAiieA//+hwICAABlHgIABx3CA//+WDgAAE2rUAA==
Date: Wed, 11 Dec 2024 09:36:00 +0000
Message-ID:
 <BL1PR12MB5849450C8BF9CDE27777AC03E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
 <Z1glF5FJjnSzRqsB@macbook.local>
 <BL1PR12MB58494BFB7FBB042450189684E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z1lKRLmmtXKCjIDO@macbook.local>
In-Reply-To: <Z1lKRLmmtXKCjIDO@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8230.010)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB7409:EE_
x-ms-office365-filtering-correlation-id: bcf9015b-e512-454f-8a93-08dd19c73969
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Nkt5QjBiNStTdENOTmZjdG00bXRGa1BjS1dJK1MwelduRllNR1cwRFM5RFFI?=
 =?utf-8?B?TkpWM0kzSzFRWFYzT1BEbXhlWnVIclNyWXN2UWlTTCtZdm54WlpickY0MWZS?=
 =?utf-8?B?TWdCS0I3RVJ5cTZ0SVZxaDJzZ1k4TWJOaHhMdnVCdjhvV0xKM2IzZ1J5dUdX?=
 =?utf-8?B?eFUyKy9LWFUzWDhrR3dtUk8vK3BDN3gxUFFPcndPR0ViZVhKT29wZ1NrZ3k5?=
 =?utf-8?B?V1ZieVNEMk1iVDZyRExvOGlpZ0NZOFYrbXZKRnJRdnNyKzkycW1sSHdxYXRE?=
 =?utf-8?B?ZUEySGRocHZLRklHVklZakI0d1cvaW1rRkIwanFGUTNIU3VQazBMSkdOMFRs?=
 =?utf-8?B?bjFoOS9PSW95ZWk0T09aRElXK0JEZkVUd2pXVzNLakNTZXc5a0dxdDUvaUNP?=
 =?utf-8?B?V0ZsMTYwcE5ZL1ozSnBqTmt3WUZ3V2pGa0tFTWhHQm1FaitHRytWOVNWVFVh?=
 =?utf-8?B?WDFzbGV3SDhkdUYrdnMrRkxydDcxb1ZMTmtSd3MrTGFxL1ZjOS8xeUo1K0Z6?=
 =?utf-8?B?TVk4RHhkV1Z2TzVOalJ4MEZpaFV1c0hKaTlhNEdTcVEzNUJNbW5yYThuSEVC?=
 =?utf-8?B?WEpQcGFwSWk0YXBKbkRvTUhvemJnVnVsaEhZNUNqR0dCRWJOUkFka3lFRzRv?=
 =?utf-8?B?ckIrTCtOWXlPT0pyNDBrRnJmS1pPeEZUYjN1S1lWdWc0a3ZNZ2l5cVUzSDNj?=
 =?utf-8?B?dkVkWEkvdTVYcXp1MWVSYXgxQ3ZKSW5wMWljdGJ6U2w0UEZZWDV0cEFjZFY1?=
 =?utf-8?B?anVQVmdKb2IrWGNJbHc1MGdpUmZPM1B1UnpwLzVnaXJyRlNiN20wdjFjcjZm?=
 =?utf-8?B?RGkwRGpEM2lzdm9sN2h3ZlJWdm1CNG9PV2dWUytKb0JzSDEweWxzeWg4S2I0?=
 =?utf-8?B?cHM3UWJYMDV0L2R0VCt6WWl0VzRnbjhWSkNBRWE0b2xkV21uQlMyY1J2c0Zt?=
 =?utf-8?B?Rys5cVRqSTVvTmtMUFkreGNraWEzd3NLdHpyWFdTWWVNalpLMEVYQ3FFT3BU?=
 =?utf-8?B?MTVmNk00SDJqb2ZyQ0NabGVtekp5L0YwYVRQeEF1Z096SGZEdmdCeEJXLzRj?=
 =?utf-8?B?WFdYT3kxZXY3RFU0Myt0Mzc3dVhDZGFSb3FGSmc4UXVTbDZYdTdWSlp1a0xt?=
 =?utf-8?B?ZFl1WU1iOUE0amdCU2VJMUhZTjBYUEFPT05abTB1eU91OUtPMmw1TmttMHFh?=
 =?utf-8?B?V010R05VUlFFL3JIMnN1UkgzUEJneVdBL1I4QlovVXhGZFlqVDF4Vy9qMjFI?=
 =?utf-8?B?dU05YmRBQUZjejR1WmI5cUpBQURKdVE5R2dSOWhwWm9hNlZ2V0J5Y0FsOWxN?=
 =?utf-8?B?VHFMclFid1ZYN2xzRVkzWG1mQXRjMlBneDFrUUt1Skx2L0VRKzJTbG1IaXV1?=
 =?utf-8?B?RUFEYTlIZTg4VDJvNEllZjNrNHJkdCtTS2VYbXpDOWVZUmhhTllQOGFmWDJU?=
 =?utf-8?B?dzVYbFFsWDlrWkZYMjBEZ0RWd1VLTzBTdjc3YWFxZWJVdWZPVHdCbkhWNXp2?=
 =?utf-8?B?MTlJRHVuVXFUN01lcHRrTldiRkJ4SnZiYll5SHo2VWRDanVXY2FGancxS05C?=
 =?utf-8?B?dnpEYTA5aFpSdjk1b1dHcEFRZnd5MFRnZTJWMFhoOVI4elpJMS9oRmpsVzZJ?=
 =?utf-8?B?aytQcGlFck42dVVoTzdxNlovVTZKQ2RGOWxIdXRBWU50dDdmR21JNXJMUHZZ?=
 =?utf-8?B?VEdwcEY5dlJJTWJ5eVRNM2ZZWFNUYi9mWE00ZGVFRE83MHhDeW1CUlRkZE00?=
 =?utf-8?B?Z0tZcFVJVXduWUpZT2NNOWhFV3lubWxhSmdacWR1WXE0TyszUkVZa0x2cjcv?=
 =?utf-8?B?K1p5b282K1RneHlBa0twYUFPK3ZMRnNNWFFUb1F4NWVtelBKTHk0eTNGblAy?=
 =?utf-8?B?S3UrTTVFQytrWkFiRi9Da201Nm1GcE9yOXZUYWRjOW9YOVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWVLVjg5TjNXaUt5b2ZXN01oclNtZzJEamx3ZVhvaUplUzA0TTdMTEVvKzQ4?=
 =?utf-8?B?WkVzMVdHOFRac0xtSXkwUy83L2RkQ012T1ZiVDVBbnZJbFNwTzhDc3JsQ2JM?=
 =?utf-8?B?cXlHdnVOeW42OTJndGlpWWM1NURGQjBtelFnUDd3QlJJSjBWdVBKVnNtS2or?=
 =?utf-8?B?ODAzK0U5bmt3Um55aDROK2E0WlR1b3FrQVhNeWpTR2Fza01iM2htQU5qejNt?=
 =?utf-8?B?SGxtdytVUWFKYXlEbGNQak52Nk1Kc3NFT0ZLUDZldTlsOGdKY1NhY3VWY1Uw?=
 =?utf-8?B?K1Y0VkJUdjY0aWNWcDRITG1Tc0toSmwvcDVDanhFbDdtQmJrQ2plSEtkNzg4?=
 =?utf-8?B?ajBRQW9Wak1EUnNKeXZzckJDVzQvZnB3S1U3Zy9pbzlJc0pzODNnY0JiVGVi?=
 =?utf-8?B?OHNPbUYyZEVxZzhEZ0xBa1Z2L3lBK2s2dzlDS2p0V05YN3dqVmhjUk1teWFC?=
 =?utf-8?B?U2JhWFR6Z0FQWnZ2eVkwV1hkWHh4bXU1eGo2ek4vMjZsVlo1bmFoaFpBcEFs?=
 =?utf-8?B?Ui81L2dTQThpa09BRHlYRlN3dzNtdTlkbllIN2s5OERObmtJS2ZPSTZKS0xN?=
 =?utf-8?B?MGMwOGszT05MZFV0T0R4djFCMlpvSkx3amplTDkxVnZGdEpkWUdBcU5CaTNV?=
 =?utf-8?B?bVdScG5paUtTTmsxbkR4WlJjNzd5djlyQWpGVjc2cHVDdHdsdlhKNDhFWTZ2?=
 =?utf-8?B?M0RYdzFidXVyM1Z0clJSdFVFV0VpR0RJd1M1R3M3dTc3L2YveXdOY2dvTmEw?=
 =?utf-8?B?a1RuRmx0NjRjUHFocWtBOGN0bTFha3FpcDI1aG1LOXZlMEtxTkY5dEJjNHFO?=
 =?utf-8?B?VnArbC9nY2ZCYVJnUENvbU5zUmZlQWRYUXRRMExPWm85aVBKWGRXSVhLL1Yr?=
 =?utf-8?B?c1RTVXpYalVzaVQ3SGMyYjl5TndGVnl5Y3hOa3JUdW52SnBUbTNTS1Z1NmlV?=
 =?utf-8?B?QXdtbjBPeHYxOHRjTlZwYlpZV3dzcTMrWkU3N0F0YWl4UmQ2UjQ1WCtRQ1Jv?=
 =?utf-8?B?SmpibkdRVW1PazF0akJEMExhSVV6Vk90cXBYMktMdkdIRU5CdGRxdStCWmhR?=
 =?utf-8?B?ZTJjejFzU1pEc3c4YUJicmpqRTI3dkdzRVd6MEpoa3RCd1p0aHE5ZDlLUzlC?=
 =?utf-8?B?Qi9YcGZYeHluMFFYaEVwNkJDNnUwSGJTN012SDcvUTh3NlVtUjBmUXhqMUli?=
 =?utf-8?B?NDZSYUZtODNSU05LTnJuM2puNkloVDJCcmYxdkFRd0d1M2M4RXVDL0pWNDJE?=
 =?utf-8?B?NnI0Rzl3eldZUWJZVFVCQ1pGMmx4eUJtN1VKRElZWG5BdnhWdGRsS3hPeWxk?=
 =?utf-8?B?SVVwUEdJby91MXVSN3Y4dytzcENvVG84RlhlajFnVEw4YVhlTndmSVVrTnQ0?=
 =?utf-8?B?SWlUWDRDU0NMeHNDMzZZVzE1RVc2K3RscXdTZ0J1NnllWU5lVU5aNUtGd1kv?=
 =?utf-8?B?cG9WQVZwcTN4bGh0MUJtQ29ka2FGTVRtN3RyV1MvUUNvK29WUHRIUU5jbHFC?=
 =?utf-8?B?NDAxckFMRGVwRFJwUmEvRVU2RDhaREZJT3BqMlhxbHZ3emgydCt1bWZnd1Fq?=
 =?utf-8?B?UzVmcmNlU0Q5MW9LU1d5SVcvZi9CbXpWcklJQlhnVU15WTdBVS8wbFBkQmJW?=
 =?utf-8?B?Q2N6UDdFYmtkeVBtMEZzdFJSZmFBSlVEMEp6bUNWUEl2cFp5anBmRlVSVVJM?=
 =?utf-8?B?b3paRUUrQThEMFRJU1ptME1GTHNBemtnV1EzclRRKzMxM092cDRTc3lReVBm?=
 =?utf-8?B?ZGhQaTBKNG9GUFVBbUFEQTBHSU5uQUViRFE1U2tldk9QQWtpckVOMTdNaTBB?=
 =?utf-8?B?UkxWOXhiMHUxaVpBVUtSaVdPWW1UbzJ3eFRhdEZrUkY1a0NENzhOaHFuWGph?=
 =?utf-8?B?bWc5Z2gzSHZQRjdidkc3cURQMnZpWDIrdTdROFJ2WHpmcjB5SmRlaWdNcTlD?=
 =?utf-8?B?UVozMkxDQmhwK3pROHZSNWRYMmF3bWlFNlZQQ3NJb3E4SG1mVzduMmNacEsr?=
 =?utf-8?B?d1ppQXRYVEI3aDloaXFNYlNlWUZWQkt2SDNqQ2pMaVY1UXdSMDdxLzJSRThM?=
 =?utf-8?B?YldIdHVQSmpheXpLcVluQzdsSGN2QUZiNGExYnBGZFVNVjBONWQwK0dRcnMx?=
 =?utf-8?Q?AA3U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C1CF23925528248A8760FE4FB6DD408@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf9015b-e512-454f-8a93-08dd19c73969
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 09:36:00.8384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bXav9Fzu1Iy0tbqUgXZLH1Olj3WjHrqnfyHAlx2ajcF9/HQLFD7BoLL9mr1F9gb+SSjM0hLtaUsdGdHL+mxwNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7409

T24gMjAyNC8xMi8xMSAxNjoxNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gV2VkLCBE
ZWMgMTEsIDIwMjQgYXQgMDY6Mzc6MzBBTSArMDAwMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4g
T24gMjAyNC8xMi8xMCAxOToyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBUdWUs
IERlYyAxMCwgMjAyNCBhdCAxMDo1NDo0M0FNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
Pj4gT24gMTAuMTIuMjAyNCAwODo1NywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4gT24gMjAy
NC8xMi8xMCAxNToxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMTAuMTIuMjAyNCAw
ODowNywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4+PiBPbiAyMDI0LzEyLzkgMjE6NTksIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMDIuMTIuMjAyNCAwNzowOSwgSmlxaWFuIENo
ZW4gd3JvdGU6DQo+Pj4+Pj4+Pj4gK3N0YXRpYyB2b2lkIGNmX2NoZWNrIHJlYmFyX2N0cmxfd3Jp
dGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+Pj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCB2YWwsDQo+Pj4+Pj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSkNCj4+
Pj4+Pj4+PiArew0KPj4+Pj4+Pj4+ICsgICAgdWludDY0X3Qgc2l6ZTsNCj4+Pj4+Pj4+PiArICAg
IHVuc2lnbmVkIGludCBpbmRleDsNCj4+Pj4+Pj4+PiArICAgIHN0cnVjdCB2cGNpX2JhciAqYmFy
cyA9IGRhdGE7DQo+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+ICsgICAgaWYgKCBwY2lfY29uZl9yZWFk
MTYocGRldi0+c2JkZiwgUENJX0NPTU1BTkQpICYgUENJX0NPTU1BTkRfTUVNT1JZICkNCj4+Pj4+
Pj4+PiArICAgICAgICByZXR1cm47DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gSSBkb24ndCB0aGluayBz
b21ldGhpbmcgbGlrZSB0aGlzIGNhbiBnbyB1bmNvbW1lbnRlZC4gSSBkb24ndCB0aGluayB0aGUN
Cj4+Pj4+Pj4+IHNwZWMgbWFuZGF0ZXMgdG8gZHJvcCB3cml0ZXMgaW4gdGhpcyBzaXR1YXRpb24/
DQo+Pj4+Pj4+IFNwZWMgc2F5czogU29mdHdhcmUgbXVzdCBjbGVhciB0aGUgTWVtb3J5IFNwYWNl
IEVuYWJsZSBiaXQgaW4gdGhlIENvbW1hbmQgcmVnaXN0ZXIgYmVmb3JlIHdyaXRpbmcgdGhlIEJB
UiBTaXplIGZpZWxkLg0KPj4+Pj4+PiBUaGlzIGNoZWNrIGlzIHN1Z2dlc3RlZCBieSBSb2dlciBh
bmQgaXQgcmVhbGx5IGhlbHBzIHRvIHByZXZlbnQgZXJyb25lb3VzIHdyaXRlcyBpbiB0aGlzIGNh
c2UsDQo+Pj4+Pj4+IHN1Y2ggYXMgdGhlIHJlc3VsdCBvZiBkZWJ1Z2dpbmcgd2l0aCBSb2dlciBp
biB0aGUgcHJldmlvdXMgdmVyc2lvbi4NCj4+Pj4+Pj4gSSB3aWxsIGFkZCB0aGUgc3BlYydzIHNl
bnRlbmNlcyBhcyBjb21tZW50cyBoZXJlIGluIG5leHQgdmVyc2lvbi4NCj4+Pj4+Pg0KPj4+Pj4+
IFdoYXQgeW91IHF1b3RlIGZyb20gdGhlIHNwZWMgbWF5IG5vdCBiZSBlbm91Z2ggYXMgYSBjb21t
ZW50IGhlcmUuIFRoZXJlJ3MNCj4+Pj4+PiBubyBkaXJlY3QgaW1wbGljYXRpb24gdGhhdCB0aGUg
d3JpdGUgd291bGQgc2ltcGx5IGJlIGRyb3BwZWQgb24gdGhlIGZsb29yDQo+Pj4+Pj4gaWYgdGhl
IGJpdCBpcyBzdGlsbCBzZXQuIFNvIEkgdGhpbmsgeW91IHdhbnQgdG8gZ28gYSBsaXR0bGUgYmV5
b25kIGp1c3QNCj4+Pj4+PiBxdW90aW5nIGZyb20gdGhlIHNwZWMuDQo+Pj4+PiBIb3cgYWJvdXQg
cXVvdGluZyBSb2dlcidzIHByZXZpb3VzIHdvcmRzOiAiIFRoZSBtZW1vcnkgZGVjb2RpbmcgbXVz
dCBiZSBkaXNhYmxlZCBiZWZvcmUgd3JpdGluZyB0aGUgQkFSIHNpemUgZmllbGQuDQo+Pj4+PiBP
dGhlcndpc2UgY2hhbmdpbmcgdGhlIEJBUiBzaXplIHdpbGwgbGVhZCB0byB0aGUgYWN0aXZlIHAy
bSBtYXBwaW5ncyBnZXR0aW5nIG91dCBvZiBzeW5jIHcuci50LiB0aGUgbmV3IEJBUiBzaXplLiIg
Pw0KPj4+Pg0KPj4+PiBUaGF0J2xsIGJlIGJldHRlciwgYnV0IGltbyBzdGlsbCBub3QgZW5vdWdo
IHRvIGV4cGxhaW4gdGhlIG91dHJpZ2h0IGlnbm9yaW5nDQo+Pj4+IG9mIHRoZSB3cml0ZS4NCj4+
Pg0KPj4+IEkgdGhpbmsgd2UgbWlnaHQgd2FudCB0byBkbyBzb21ldGhpbmcgYWxvbmcgdGhlIGxp
bmVzIG9mOg0KPj4+DQo+Pj4gdWludDY0X3Qgc2l6ZSA9IFBDSV9SRUJBUl9DVFJMX1NJWkUodmFs
KTsNCj4+PiBzdHJ1Y3QgdnBjaV9iYXIgKmJhciA9IGRhdGE7DQo+Pj4NCj4+PiBpZiAoIGJhci0+
ZW5hYmxlZCApDQo+Pj4gew0KPj4+ICAgICBpZiAoIHNpemUgPT0gYmFyLT5zaXplICkNCj4+PiAg
ICAgICAgIHJldHVybjsNCj4+Pg0KPj4+ICAgICAvKg0KPj4+ICAgICAgKiBSZWZ1c2UgdG8gcmVz
aXplIGEgQkFSIHdoaWxlIG1lbW9yeSBkZWNvZGluZyBpcyBlbmFibGVkLCBhcw0KPj4+ICAgICAg
KiBvdGhlcndpc2UgdGhlIHNpemUgb2YgdGhlIG1hcHBlZCByZWdpb24gaW4gdGhlIHAybSB3b3Vs
ZCBiZWNvbWUNCj4+PiAgICAgICogc3RhbGUgd2l0aCB0aGUgbmV3bHkgc2V0IEJBUiBzaXplLCBh
bmQgdGhlIHBvc2l0aW9uIG9mIHRoZSBCQVINCj4+PiAgICAgICogd291bGQgYmUgcmVzZXQgdG8g
dW5kZWZpbmVkLiAgTm90ZSB0aGUgUENJZSBzcGVjaWZpY2F0aW9uIGFsc28NCj4+PiAgICAgICog
Zm9yYmlkcyByZXNpemluZyBhIEJBUiB3aXRoIG1lbW9yeSBkZWNvZGluZyBlbmFibGVkLg0KPj4+
ICAgICAgKi8NCj4+PiAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLA0KPj4+ICAgICAgICAgICAgICIl
cHA6IHJlZnVzZSB0byByZXNpemUgQkFSIHdpdGggbWVtb3J5IGRlY29kaW5nIGVuYWJsZWRcbiIs
DQo+Pj4gCSAgICAmcGNpLT5zYmRmKTsNCj4+PiAgICAgcmV0dXJuOw0KPj4+IH0NCj4+IFRoYW5r
IHlvdSB2ZXJ5IG11Y2ghDQo+Pg0KPj4+DQo+Pj4gTm90ZSB0aGlzIHJlcXVpcmVzIHRoYXQgdGhl
IGRhdGEgcGFyYW1ldGVyIHBvaW50cyB0byB0aGUgQkFSIHRoYXQNCj4+PiBtYXRjaGVzIHRoZSBS
ZUJBUiBjb250cm9sIHJlZ2lzdGVyLCB0aGlzIG5lZWRzIGFkanVzdGluZyBpbg0KPj4+IGluaXRf
cmViYXIoKS4NCj4+IEkgdGhpbmsgSSBjYW4ga2VlcCBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9m
IGluaXRfcmViYXIoKSBhbmQgdXNlIGJhcnNbaW5kZXhdIHRvIGdldCB0aGUgY29ycmVzcG9uZGlu
ZyBCQVIuDQo+IA0KPiBJTU8gaXQgd291bGQgYmUgYmVzdCBpZiB5b3UgY2FuIHBhc3MgdGhlIGNv
cnJlc3BvbmRpbmcgYmFyIHN0cnVjdCBpbnRvDQo+IHRoZSBoYW5kbGVyIGRpcmVjdGx5LCBhcyB0
aGF0IHdpbGwgYXZvaWQgaGF2aW5nIHRvIGRvIGEgUENJIHJlYWQganVzdA0KPiB0byBnZXQgdGhl
IEJBUiBpbmRleCBmcm9tIFBDSV9SRUJBUl9DVFJMLiAgSXQgc2hvdWxkIGFsc28gYXZvaWQgdGhl
DQo+IG5lZWQgZm9yIHRoZSBpbmRleCBhbmQgQkFSIHR5cGUgY2hlY2tzIGluIHJlYmFyX2N0cmxf
d3JpdGUoKS4NCk9LLCBpZiBzbywgdGhlbiBJIG5lZWQgdG8gbW92ZSB0aGUgbG9naWMgb2YgZ2V0
dGluZyBpbmRleCBmcm9tIFBDSV9SRUJBUl9DVFJMIHJlZ2lzdGVyIGFuZCBjaGVja2luZyB0aGUg
QkFSIHR5cGUgaW50byBpbml0X3JlYmFyKCksIHJpZ2h0Pw0KDQo+IA0KPiBUaGFua3MsIFJvZ2Vy
Lg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

