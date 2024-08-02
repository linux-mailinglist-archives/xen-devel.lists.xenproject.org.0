Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A42A945661
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 04:57:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770064.1180917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZiTT-0005Hd-Gj; Fri, 02 Aug 2024 02:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770064.1180917; Fri, 02 Aug 2024 02:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZiTT-0005GR-D0; Fri, 02 Aug 2024 02:56:59 +0000
Received: by outflank-mailman (input) for mailman id 770064;
 Fri, 02 Aug 2024 02:56:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uPwv=PB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sZiTR-0005GJ-Qk
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 02:56:57 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfdce348-507a-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 04:56:55 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH2PR12MB4101.namprd12.prod.outlook.com (2603:10b6:610:a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 02:56:50 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 02:56:50 +0000
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
X-Inumbo-ID: dfdce348-507a-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlB+b6Ca11NXPflWO3OFpRBl+C5A0t1rL08QHMNbIszdiwQ0h+c/1kUqyIw+ff31NGwELKOo7fifoUPL/DADBmzDCzWHZktktexoMbkdpnBSTZ/o2tBEJp6GPEaz43z1GZ3FdVyZcsXPdlLkFQ/f06eBBctubIM27BIDgwGCm1SpQPPGDqT2myzuDlFlssTxo4Tk+eQmlVmQsjUqZW08z5aEKdmZbW0lDlFE0eax1UTVUa7Zf0O2FfiVawSxmtanLHlE8Mhfd1SpflTcP0J1Lr5H0NVVtntc4hgOvtfYeQr//7tEXAmixqd9t+lAv3DsWoZd5vZS0mAdGZLFx0YvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25+9rBOnUI33mmwEw2JICV7RQqjmPOEKfpuXev6iRKU=;
 b=JSl7JUpo64LLpp2FL/UylEDhSgF2PG/1eWdgKcSQtOLkl3m6Ip1eGW2pGfj6MAsB0Tzh4r7TV8mg0n9lRd9+JHMaiGQfS8yJursH6AANa8Qguq1mi3EyWZmdBabNDKG7kHxdqjKpKpmEEKkHPGGBumdTleNsVJRa5ijVUB9i914GJ5m0v2jCJxAHsBxeUX8UU72qUtwargxLX3Z4h1WUYkPxYWt0fOSjLE9zoE9SRrBWSJ+tZy1sB4yFn3UKkkU+dJUtUKn5nAPUoPCIIiqoVauqEBIAjccxFBuwtxn1TVC5UqJTcz9VR/ebX2TgQcupQqCeY2weqcH3GqRQ3l+PCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25+9rBOnUI33mmwEw2JICV7RQqjmPOEKfpuXev6iRKU=;
 b=Z/TU7aHoK8rjxUM9HElHSwW0EjOHJyk69lQ4gh6QIx0G6yd8dQ4ID3AzEuONJuj161MfC9YDKPkso0xAHwNm+b5xA0dcM0M/k+e84XtPx/ve4cbpyKkN2SXJWu41ZWwVantPtpPkzm7dofcg3KNahylIIHwhz6kOrTrNkW2W9Mo=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
Thread-Topic: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
Thread-Index: AQHa0SvTLcqHcyv10kCa3wxjMJYih7IRIeaAgAAA2ACAAAQnAIAA9LaAgAHSh4A=
Date: Fri, 2 Aug 2024 02:56:50 +0000
Message-ID:
 <BL1PR12MB58492B43AEA9874CF55455CEE7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-2-Jiqian.Chen@amd.com> <ZqpeiWhuqPXiTeRZ@macbook>
 <23730906-f6c7-4a9a-bb2f-2969625c741e@suse.com> <ZqpiulPi3FbdpDoF@macbook>
 <1a35b90d-969c-4ef2-8dd1-4dc36f56fa30@suse.com>
In-Reply-To: <1a35b90d-969c-4ef2-8dd1-4dc36f56fa30@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7828.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH2PR12MB4101:EE_
x-ms-office365-filtering-correlation-id: 22c8241c-9180-41d4-e519-08dcb29ec196
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QTQwWXl6TURuVDJYRGdQUE9xNmIyaXBpSmtnazI1TjRUMldQaUg2LzhWaWpo?=
 =?utf-8?B?SHpIOXJkb08xUFBuUGJLaWIrSU4yVWdNWjhGL1ExOE00MEQybnVHM0FvY1lK?=
 =?utf-8?B?eHh5cVRUYmFQZ09NSkkzeHZKY1VCMEY0QTBRQnRRaGt4REZWWVVMRWIwU2cv?=
 =?utf-8?B?RDV1S1kzSUZ2WGhMMDRJSTZlNEpSRHVNRVlObkVxclFLdURVVDVlcWZGSGZo?=
 =?utf-8?B?UFdjWlQ2QVdLcGZobkwwTTFhQjl6Ty9qdVNqQ285VkpVbEEya0lFeFhmZS9v?=
 =?utf-8?B?Vmc1YTNoT0JuQWczaEl1c1RtcjF6cGlhVFU5K2lIbmkyR2Z6Qm0rY1BQVnph?=
 =?utf-8?B?QVNGeVpjSzZlN0hVTXVmcXhXOGFRdnRMWDRjdGY3OEViRVRjTmdIeW12TTd2?=
 =?utf-8?B?LzdNNUJPUnJWSjl0RmtadWlCeWx3TSt3UHROU1k4NVd0Wng1Zy92NWpVcStx?=
 =?utf-8?B?MFR6SytVSHg4Mmo3Y2xuTUlWdE5vL2VTY08vYlJ4Uys4aHJDdVZwYWdmN1JE?=
 =?utf-8?B?UTM4cXp5SzBqRURNL3ZSaVJSYmdyc0VSSXkrcjJIWWhJZmt3SUp6K3ArYUdQ?=
 =?utf-8?B?ME5EdEQ3MngweWNRVkdiZ1NZeUxHQXl0RUNONU53NFdtZi9HS1k5Q1FpM1Vz?=
 =?utf-8?B?czRzbHlHWFYzRXFqV1Y3RFV1dmphdzBVeFpTTmRVakh1OU9FWUhNdENvV25W?=
 =?utf-8?B?Q2QyaVVoTWVrb1FUZzAyTUdaUkVaMUZRb0VyQk5KM3ErVkpYbHdkRlBJQ2dK?=
 =?utf-8?B?MTU3aHh6VGZ5ZXh6WkZxQ0kwTG5DSEdEZkVwTDJOV0kxL2dENmxlaFNrUDdE?=
 =?utf-8?B?OCtsTHhkTlhsTlNlUUh2RnpnRmdFRGhBb0xBU1RBTEZPUkJwWFlWYWxnSFlG?=
 =?utf-8?B?KzUvQUZoOXNXeEREM1paZ21hSzRPMHI5K0VBSkhmTkYvKzJ0em5uUEw4TUwy?=
 =?utf-8?B?eGlwcGVsa1lhSXduY21WNkl1WEN6WGdTRGZaeTJTUXhSZktna29kbFhWMkhO?=
 =?utf-8?B?NFpzZTJsRFAyYlJ0Z3JzeVFDemxkYkVOUnFtQmtrcmFKcnhKNXgzWkJjYmpz?=
 =?utf-8?B?SGlDVGxENXlRZTdxRVU0Q0p0ekdvanJQL0VXakZ0Y0VpTXFFQTQraFBRYmw4?=
 =?utf-8?B?dzIyMmpROXJmWlRBVFE5ZlV3eWhTSFVNQjhLcm9pUVNRdEJBZUwwcVI4cWFw?=
 =?utf-8?B?azl0VlVFZlozOUZDYlBRdDJQNkloOGJjc3B4OUNDNzZxQ2xUam9zZm52Z1N3?=
 =?utf-8?B?cEtRNXRZOGtZMkVscGFLQWhYTFp6endxNUFyNjA1dDZ2QzhDRGE4aGlLRUZJ?=
 =?utf-8?B?cERicHhrL3AxS2FrM0RmYzVEMjBUZVJoRitvZkJsa0pkRlJ2aFY2M0Y4Ry9D?=
 =?utf-8?B?M2NyQU1MTzgwUFdEZ2l6M0E5a2JuL0U2ckxwK1VDYjN5bjhUcDlyb3NjeWRW?=
 =?utf-8?B?MmFYUzdoMm9tKzBWbzB3WGZnWGNRcGtIODFaZEFuYytUSEZTUXhWd2EzcDNK?=
 =?utf-8?B?aCtTU2gxeGs2cWNZcitzUEl3WUhDOC9DcFAzcXZKUzJxbUhsRzh0eFBwaTFD?=
 =?utf-8?B?VlRmS1RtU3FHL3N0OTB0NTJvN0Z4UnRGWlozZ0tjTEdtOGtNOFFGaVpUWkIr?=
 =?utf-8?B?WlZrd3ZXMzJmcXRaSmJOazBSZVpaNE81OCt4ZWFMQ0xESjJlRnl6RncrQTlr?=
 =?utf-8?B?NkFBcGE3M3duRFlKd3REREpVVjJ3ejV4dUllYmc2bU5WQ2NhdVZsZGlKM0dJ?=
 =?utf-8?B?eEQ5ejBrZm5kWThaRFpoRURVN01FVnNrM1FxRXY0OXdsSS9EOUNKRG5aS3Rw?=
 =?utf-8?B?dExMVWJMeTdQcXE4ZnhKVXNEWmJxK05TS3d3SEd3VTJvZjJNV3lEaGliUkZY?=
 =?utf-8?B?S1l0RmxWWjBDdWpPNHU2eHlkUlQ5QmFka1ErdjdVc0lySlE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTBZWlpIc3NLeGhNWkh0YlRlMlh0d3pBc2pUSy95TnFOakZ1Rk15ZkE2K1c3?=
 =?utf-8?B?ZENhVUwvRWRXU3QxaUVONGM3ZVZxY01sNy94VTIyNWJza2Uyb2VSei95Ry95?=
 =?utf-8?B?MVIwT0pQY0MvLzFycjlKQkZaVzhuam1YVFF4WjZzOGRXU0VOc0hIT2ZIYmgy?=
 =?utf-8?B?VnA3MTNtVk91Y1JsTGpYeVhLNVQ4cks0bDhHUDdFUngyS2ZwaFRrZVR2YjJk?=
 =?utf-8?B?L2tOcFNMMm9wTmNsdjZXcTFIdTNHSVgwbWxOWFM4Kyt6SmJhUVhKYnJ0T2d4?=
 =?utf-8?B?SVVUWVgrS3hYVU83NmlDTlByVldXVjRVTmgzS2VZOFQvaU1URUIrL3NZMklC?=
 =?utf-8?B?Wk9jMElacndRalpWbm1uVi9mSzhaTTNPbUxNTE9DRDJibWU0aFJoQ1hyOE9X?=
 =?utf-8?B?RWZmVUgybTg5VE4yKzRQWUVzQ2pNMkJ4TU5YQ21JWjZUbGVWSFNTRVlvZTY1?=
 =?utf-8?B?RmtEY0VOWWtOVk01aDlzL0owb0o5NFRkaHF3RFc2NGViOS9zWXUvSERYMkFZ?=
 =?utf-8?B?dUpyUnpqblN3NmNWWUNCQkVkb3B1L1VVK1FxR2hSY2dMS0lTUXdHNS9GSmsv?=
 =?utf-8?B?aHFnTmtGQlhWV1c0eVNpcUdPRkc2VEpoZTlBSjdvNTk4ejB1SXI4U3ZVNXNC?=
 =?utf-8?B?c1ZLV3NEelc1YXNVem9SZ2M1Z0hqaUhEaFNubzZjWjlEblkwUHZCckc4THNx?=
 =?utf-8?B?STNDMjFaREw1TWV0ajFUeGFYWlBySG9rdGpMR0YySEJuOXJOem5JREszNHNE?=
 =?utf-8?B?OUsvNHJWVkpNVWp0MzNqck1tSmhoeWZtQ2VZMmEvSjQwM3BoUXVEdzNWck10?=
 =?utf-8?B?RXdyb1RHYnpISVRiRUx3cmZocGJNYlJRL1ljTVFlOUZTWHdsSGN5ZGJ2RWQ1?=
 =?utf-8?B?MDhzb0JLRHBEZUFUSlVENzlmNkExMTJoeWJnNVZVa3liZVE5Y201ck8xVGJ5?=
 =?utf-8?B?aEZDdzFNR2xwUDdxT1VjQXBXdXJxaCt2S1VTb01rUXJEd2NjcVlUaEJBTjl5?=
 =?utf-8?B?QkJFVWJVOEwySG04YmV6SDdSK2xYRWNIYUFZZDdzK21pakRtUE90TXNHOUtQ?=
 =?utf-8?B?VXZQYnFMblJxSzdyMzBKVGdrT05hc2txcHpsdjMyZmUvQ1EvOHhxRDhLdGw4?=
 =?utf-8?B?L1YyVnFDNXppWS95emJMVVlmRW8xQ2cyUnZsS0wwdGYwamd0NCtTd3dSMytG?=
 =?utf-8?B?c0tlaDd1NlZ4SFJiQWxsaGZxY1pQREpmM3ZDempRdFg3SVdobmFkMmxZU3VF?=
 =?utf-8?B?RjE0U1B4NlVFQXZkcUIxN3psbjNNV2VDMENxdjBJZGsxY0cwcTNZRHhsSnpt?=
 =?utf-8?B?cWd1OXB0cTFRakpmeTFlaFQycTBORDVETDREYXhlN0IvSndUN2dDbXB3SU9D?=
 =?utf-8?B?UUxUU2NwS2s4QllTakJaOS9tZmo3cEJTMk5CTnBnUWhYRk9iaWpZQUxzY0xK?=
 =?utf-8?B?VWVLVm9MVzZRTmIyZlAzWDFBYUtUTjFMbitkUEV2dFV3MDZ4Sm15WVZ2dEI4?=
 =?utf-8?B?WlBjYXRZcFlYL1NlN3V4M0h6czFUcWl1eVp2RUhTeXo4VGVEb25Ea0gyQ055?=
 =?utf-8?B?N2c2Y0V6Sk9MS1BROStMdGsvSVptOXc3WVdhdWRJUXNWRllPK1doOXlZbGc5?=
 =?utf-8?B?KzQxenBnY0JyQ2RHSlFiVU42aEEwVUM0Tm1tUDFKWnRDTWZESXNvK0hGbnRh?=
 =?utf-8?B?aENUc3NLV082RDFWMWxlVjZrWlFLelo2NFpMc0RWSWNZN1BlVGs5b0k0eWdT?=
 =?utf-8?B?c0Zjc1pIZ2htNU5zQlk4RzhmU1o0QXBUWXdSM2pyLzBnUUdnMnFYN0d3NWxX?=
 =?utf-8?B?NDRmMkxHRnQ5dVpJaGFEMEgyWUF4cVZ6eFQ1cTg3dmhaYTVqd05BSTdmZnN3?=
 =?utf-8?B?Y25UUlpLYjk1WVJwaDdncUpGNFd4REdNZnhsZEI3NytkTlZUaXVyMFBkSHRF?=
 =?utf-8?B?djc3RWY1S0FrM0RidUVOUUNqbTc3K092dVFXa29hOHg2dTJZMHd5cHNsLzVn?=
 =?utf-8?B?QWNOWW9HWGN5REJjdUI3ZkUzUmVDSDdORHR2Z21XdjVZWGt2UkRkT2c4TEZ4?=
 =?utf-8?B?REJPTWlUS2ExN2drZVhCVnRYYSswMFcrelZRT1NYZ2p0YWRZSFlOMHM0Nkh2?=
 =?utf-8?Q?DHzM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB7EA33509F7884CBDC22D54A775DC93@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c8241c-9180-41d4-e519-08dcb29ec196
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 02:56:50.2204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QgblGnT5xlSt84tYaqEcNNZC4Y6PH8s7LBd8tZL745m4n1j+R0VZDWqV54ZvZJPTDDyD0eUN4xMN1mKVrB+ozg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4101

T24gMjAyNC84LzEgMTQ6NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMS4wNy4yMDI0IDE4
OjEzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4gT24gV2VkLCBKdWwgMzEsIDIwMjQgYXQg
MDU6NTg6NTRQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMzEuMDcuMjAyNCAx
Nzo1NSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4gT24gTW9uLCBKdWwgMDgsIDIwMjQg
YXQgMDc6NDE6MThQTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+PiAtLS0gYS94ZW4v
ZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMN
Cj4+Pj4+IEBAIC0xNzIsNiArMTcyLDE2IEBAIGludCB2cGNpX2Fzc2lnbl9kZXZpY2Uoc3RydWN0
IHBjaV9kZXYgKnBkZXYpDQo+Pj4+PiAgDQo+Pj4+PiAgICAgIHJldHVybiByYzsNCj4+Pj4+ICB9
DQo+Pj4+PiArDQo+Pj4+PiAraW50IHZwY2lfcmVzZXRfZGV2aWNlX3N0YXRlKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2LA0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBy
ZXNldF90eXBlKQ0KPj4+Pg0KPj4+PiBUaGVyZSdzIHByb2JhYmx5IG5vIHVzZSBpbiBwYXNzaW5n
IHJlc2V0X3R5cGUgdG8NCj4+Pj4gdnBjaV9yZXNldF9kZXZpY2Vfc3RhdGUoKSBpZiBpdCdzIGln
bm9yZWQ/DQo+Pj4NCj4+PiBJIGNvbnNpZGVyIHRoaXMgZm9yd2FyZC1sb29raW5nLiBJdCBzZWVt
cyByYXRoZXIgdW5saWtlbHkgdGhhdCBpbiB0aGUNCj4+PiBsb25nZXIgcnVuIHRoZSByZXNldCB0
eXBlIGRvZXNuJ3QgbWF0dGVyLg0KPj4NCj4+IEknbSBmaW5lIHdpdGggaGF2aW5nIGl0IGluIHRo
ZSBoeXBlcmNhbGwgaW50ZXJmYWNlLCBidXQgcGFzc2luZyBpdCB0bw0KPj4gdnBjaV9yZXNldF9k
ZXZpY2Vfc3RhdGUoKSBjYW4gYmUgZG9uZSBvbmNlIHRoZXJlJ3MgYSBwdXJwb3NlIGZvciBpdCwN
Cj4+IGFuZCBpdCB3b24ndCBjaGFuZ2UgYW55IHB1YmxpYyBmYWNpbmcgaW50ZXJmYWNlLg0KPiAN
Cj4gSmlxaWFuLCBqdXN0IHRvIGNsYXJpZnk6IEknbSBva2F5IGVpdGhlciB3YXkuDQpUaGFuayB5
b3UgdmVyeSBtdWNoISBZb3UgZGlzcGVsbGVkIG15IGNvbmNlcm5zLg0KSSB3aWxsIHJlbW92ZSBy
ZXNldF90eXBlIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdh
cmRzLA0KSmlxaWFuIENoZW4uDQo=

