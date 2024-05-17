Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD40B8C82DE
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 11:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723938.1129095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7tRo-0001m3-Te; Fri, 17 May 2024 09:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723938.1129095; Fri, 17 May 2024 09:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7tRo-0001kk-Qx; Fri, 17 May 2024 09:00:16 +0000
Received: by outflank-mailman (input) for mailman id 723938;
 Fri, 17 May 2024 09:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPUr=MU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7tRn-0001kd-BT
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 09:00:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dec7b3c7-142b-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 11:00:13 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CYXPR12MB9337.namprd12.prod.outlook.com (2603:10b6:930:d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 09:00:08 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 09:00:08 +0000
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
X-Inumbo-ID: dec7b3c7-142b-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDT+hcHSiR0vmUhY6mkb5f/+KHLPoAglh1mYnt3uKw9q2v7NeQI53lHzCL9Kl+7FessOhwUvrX0xtGHg2i2QF9jgvADiXFJSQdbxqcWpiDVnUmAfyiLM19jRqffEyZW7D8DtVIl1zAWoxUxzmsgpOQrgVMsvTQOSxpC11u2otoZArWyYsovSbKVh1wgWkxkbGStGavivpdJGB4o1BCy1JZhxjD4UHEh3K4FonhdzCcQKqx57VfaeoQn45RoKx+f+PCgCGGmH27v9fwP4dgDjsHZ3thdCVJQsLtsG40joJgwS3JbNjJc3x5sM0SXnv3B/96YMxEbxOONpcJpPvP9Y/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+R+nUC/jdNwPhayFfRejkS/Aq6B3U6J0pxAzdnK0lYQ=;
 b=YcCtZLenA3k0fWpn/x2g5F5k1Qc1T+U9910t6QeSF2yCkdziuWAHAqm/lcvCuZVBIbguauO5u3vUVH7ptkA2Bb9GMOr1tZWAxnGi03Lgg8WitpYZtugi8MJF4N30xA6RGRfUzHAZfwjxs8SX8oqz4Xv8rfmDPOg4CtakezEz//6foQ/wJm7dgk6PgoopmvUMD7JJXZz/YYlc9ZI1joBWamNUG+JY+YwVXWTZ8j1nx5jF2rs25P/4VVbSjI8rTwt5UAioQ9lTSqjbPZEPjp8KZbMrUTkMBaCJ+3bwp3tQT+0XwWxW5LE7taHpdOU0q9w5rG/EoA/h4WnQX02ctBI5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+R+nUC/jdNwPhayFfRejkS/Aq6B3U6J0pxAzdnK0lYQ=;
 b=NgaBJE4KNYnNYmLqIjeLkY0j8LWLmgSEugrY5llCrxXjbQLqAYDSjjzEgF5Uz7hJ+2F1ekuckaQn9zDVfcsJtN72B0KfgO6/5iuBthrFcawHcYrgJNpL2HGolVn/c2Jyn/HjESRKd3AA5gY/IY9k3VDc+J64UT1j8qVyrz16qYc=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v8 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Thread-Topic: [XEN PATCH v8 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Thread-Index: AQHap3bbllnzPAJ6rEGPUd9rNZSctrGZ4LUAgAHFMQA=
Date: Fri, 17 May 2024 09:00:08 +0000
Message-ID:
 <BL1PR12MB5849A45EC6E19E53B074A3C0E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-4-Jiqian.Chen@amd.com>
 <34f6ac6d-0bad-478a-86c1-a124df5504c8@suse.com>
In-Reply-To: <34f6ac6d-0bad-478a-86c1-a124df5504c8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7587.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CYXPR12MB9337:EE_
x-ms-office365-filtering-correlation-id: 4f47b596-cc63-420d-4ae7-08dc764fc0a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZU5aT1k2bE1uSkl0MVJDclcyaXBac2gzcVl6NDFuU1BFZ2pUL2prYzZBMG1C?=
 =?utf-8?B?cXpjTzM1cjl2RDVaaVIyc0FmQUNIWS9MYUI0U3YvMlNqUVdaL3I4bzFNc2xN?=
 =?utf-8?B?WnJNREZrSFFJY0FpUHFjK01TK2xjY2tPdUZQR2JLL3BYUnRkQkgycTBBUEpv?=
 =?utf-8?B?c2FCaVN2djNKVlNIYzZHTW5sRWFkUGFtVzdoU0wzN3Z2SVhPZjAwd0F3Wk05?=
 =?utf-8?B?cGJsUnZsc2x2R1QzNDZpMGUzSWQ1ZktZWmE4bkhwWHBlSnJJaVI4S3llcmQ0?=
 =?utf-8?B?cDFMZEhFMVFtcG9temdNU2pyWHRPS0FpZnBWUkpnZW8xYW1pcWttUVVQZVRq?=
 =?utf-8?B?QXpqaU82MUE3blBoVXBUN0MyVE5ocUo1MTkwc1FiSWlSekh5MHp5TUxZN1F3?=
 =?utf-8?B?MlRIUzh5ay9TYkRJaGJha0k5UzNBZ1YxM2o2YVhvSjRlWUlZWFpRNG5jYWp0?=
 =?utf-8?B?S0M2T2ZJdld3Y0J0dnBGaWxnWGd6T2k1YjZvY21SK2JWZHVhWTZMYlFOZ0Fl?=
 =?utf-8?B?QXhZUE1ibnhRTHRqR3dGTUlxa1RMUnBqT2lMaGREcTF6VHBYOG8vekhMYUdo?=
 =?utf-8?B?WCsrL01RSU00d2tJVFJBbmpZV2E2aXJEOVM5aGZzWHNFd1pqWW45QlVzU09z?=
 =?utf-8?B?ZFR5SXU3ZHp1cTQvek9Wc3ZtT0VRbkFDNTc0MWxhWVJnNE9MQkVIVzI1d3Yx?=
 =?utf-8?B?RFRpWlQxVVJJSllTWUR5bmZBVm9FcmJoMUY3OG5sR1UxL3hJZmpvc3JucnJS?=
 =?utf-8?B?SkR1SkdwS0hLNFc3c3VVTHRiVzhQK05uQXFEMC9aeXQ5ckl4T0NYTEpsdlZX?=
 =?utf-8?B?WUhOVnc4QXdVdEFoTURJQ0pUM3A1RW9SeHZrQ2U5Y0RWZ0hnb1lKTjhLVWxz?=
 =?utf-8?B?MlcrKy8rRE1sRlVxMGRmejdRdFd1WWF2U0tmblU2elF1MEJzR3F3eTRzcE5D?=
 =?utf-8?B?UHRGM3Q3MkpaQUxVRzZ4UDBSenU3VTByYk1IQzlxd0pEUk1QTUprS3BQSkRN?=
 =?utf-8?B?VmdqNldJQm92NHBMVkY3RVZlR01QNGg1VXY3SGxCVEx4NFBDQjRQNmFaQXBP?=
 =?utf-8?B?QUEveU14czlIR2VMbXZSSUlFYzB5dnhVd2tZTis2dHF4NXFUNkNrN3ZsOHpo?=
 =?utf-8?B?ZEp5THBiaVZRWStoeVlvbTFFKzlUVXY4dHJ3WGoyRDlSZUJvL0paSUUzZmI3?=
 =?utf-8?B?RFE3NDBRNnBJZ2UxaWk2Z0xVK2drdGxrQzJJTTVTSmYxeHlqekZsR2Z5L2ZW?=
 =?utf-8?B?RlVsQVEyQVFObTNsbjZPQitqYWVudE04NTRIdGlML1JwMkhPQ3luWDRETW5I?=
 =?utf-8?B?eE9BNnkrYktmYXlCakl3VE45a1ozcGJUVkxybFZDTklMRFIzQ0YvSkdoREF1?=
 =?utf-8?B?L0RGQ1hDM0ZkYVR1bHlzRUFmUjRlU3dvSk9ZdG9rVzBXSTdWeFp5c2toWHIv?=
 =?utf-8?B?aTk4bmNJKytDczNJNTlSTDBIQytMK1hhbkNqRm1vRllTbjhaMFBvOGpQazFB?=
 =?utf-8?B?UDI2VDRZN3BmNE5JeXBTM0ZsRXd3bFJ6NTdRYjNEejlNY0VMOVpMUjVBR0dX?=
 =?utf-8?B?UzEycFVDT1EwRFJjem9DeWNhSzRFNTBzblRwajhIUno3dFVldWhEM01nZUZ4?=
 =?utf-8?B?cGhDcks4S2FLVzFaMlRPSlM2ZUJWQnc0dmxDcTRRaGRHVCszM0tYcm5PV25O?=
 =?utf-8?B?V09wQ0VNdGJyWjBUVEVUbkFUbkppZERlZ2JEUGhxWDRZN0t1NDViR2t3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cjlBRGowMlkybUVNbFM0d2ZneFhqTFI1S2RXOStRUVFtNW9JZDZWVmk1Z2xh?=
 =?utf-8?B?dlFVQ0tTRGRZeGtGTjZCUFJKYXBQVkF4bjQ0OHFOYkhYbWc5OHJtNUhzTXFU?=
 =?utf-8?B?Y3FuVXhjVGJZTHlOWkJyZENQdnZ1cEFqZTdKVU55c2ZoL2V6dlFQZFdQTTll?=
 =?utf-8?B?UHc1QktQQ2t0bUJBczYyOW1RTFV4cE52YXNYV0RBdUx4RE5aZDNkazlwOWl1?=
 =?utf-8?B?d2poOWJDNUI0cDJMNnlrTDZJanNCOC9OUzBzY2ZnSC9XNFhGUjdrTWRNN2Rl?=
 =?utf-8?B?MUl0OVNKUFFsSloyR0xVWTZ0K2dHamR2RGRwbWdaY2dEN24yc2FseHZ2UGdM?=
 =?utf-8?B?QWNBWTdGamhwMnl1czRHRE1oZmFuVXdsS3krZDArRDMxOFVqWDc3enNldzJr?=
 =?utf-8?B?enVnWUdlMVVTVmQ5ZzNyRG5JK2IvaHcveVUvMHl3Zm52cjZJbkpVRldkNy9j?=
 =?utf-8?B?MXZkclpzeStLNlJDKzZMMUZXeG9vUlE0bkJVZklXcWxXWk5yUWpuY3BPZ0py?=
 =?utf-8?B?TGVmNXduZCtFb0V5clhwQjZYTk9rbElSL3p0NHVmVHlGZlR4U0ZGbGFtK0lJ?=
 =?utf-8?B?NTEyTzRMRW9JSnRyKzBGblFuSThWZU9YK2lZMkNpcjhJc0hEbVF3bS9IWVZB?=
 =?utf-8?B?V3AxblNqVWx1ZXM3SCtkQTMvRTFOSW9DVTd5dFZzRCtYN0djb3FSajVIQ1hB?=
 =?utf-8?B?YktWbmRWWUI0bm9QNHhlNWlQVnNKakljVlFYdDdNSU5nTkxxME16ZU1xR2dn?=
 =?utf-8?B?Zk5QQ2ppSmYyVkp0MnVLZXFvcHBqNkFwMFFEbGZ5Z0FNNkJmNUdrZWZPWW4y?=
 =?utf-8?B?SndpYmJobjB5M2xQcFFnckp4aHlJU1drS05Da0JVbWR0NUozR2Nsa0IyTGJV?=
 =?utf-8?B?Z3NPRUliR0cvbWFvRElVSndwRnd3Y1Uzd2pLRXlIMGh4czFhV3E0MkJKamg2?=
 =?utf-8?B?NjVCS1Z3R1NDNjIveG9CUW5lUXlSSWUrTzV3MURLbzRzZTd2eFdLSGxNOHM3?=
 =?utf-8?B?MGNRK3ZuTVZUYTBFV3poWk96MHdVMVE3VHBhVnF6Vkg4L1NYRFZtYmxqRXNN?=
 =?utf-8?B?VFFZNVV1Mndmd3BKZ29YNm1NcWdJV2hlYWN2dVVOWXFCb0l1NnhRakRVZlN1?=
 =?utf-8?B?elhlY1A0QU55RFE3a2VsRlhVUkpJbjZORjFFaHJyYS9RL0VvRzhLZFRrN2lX?=
 =?utf-8?B?MWxvRFcweG1CZTQ2KzZJbXRoeDlLZFVqa2hGWGNqUTU0cnh2dHR4NWwrN2oy?=
 =?utf-8?B?blRnRDVISkNhdlN2RVMyOXdKL2EvK2E0bzhMeldXTElkbzRTMFNydXY3K2Vi?=
 =?utf-8?B?QTNZTWRhSGdJbUprZzZiaWxtS1kxbjdwRjJ6M0h1Z0pnRDBidDBYdXVhVTlh?=
 =?utf-8?B?QzFMSDNDQWpoVEFybkJtckRvdG1iQVRFbFZKVm1hM2xKQmNrSjFVK3JuOENC?=
 =?utf-8?B?ekVRN1dJZTBEaE11dWQrTDNPN0x1bUlXZUlpMDIyMFdIdjlZQTdMYXVMT0VB?=
 =?utf-8?B?djNSVVJiS1p0Q3hWT0pLSUpmOUhVb3N4WmtlTzdidmVGWkRhdDd2dE1zckF2?=
 =?utf-8?B?dTVkV2N1cUxwMlkrOVV0WDA3cmV3a2tNVXpxZ0d6dTJKN1FqZzZ1cDZrWUpJ?=
 =?utf-8?B?NTZuZ3dHMXoxQWVlYWJrcHA1MHRJWjdBMGZUaG1ZVFFycGR6UzNiNnRFR2Js?=
 =?utf-8?B?VlZSUzlaRWtOcnREdWZLSjROT09SSkZCRUFwbk5BVlpwd1dCK3luY1c2Kzh5?=
 =?utf-8?B?azM0VVc3S3dWTDJJbVg5SWZUbjNIOHlzUENQQVJoZ1g2OUpjazFDUXZCVzg5?=
 =?utf-8?B?ZU5sUWp0TXVBSy91NlBCYS9lbHBkaGtxOFF4ajQzaXZuMTF2NkluV3BVRzRw?=
 =?utf-8?B?NnY1Tnl6R3RWK05kanRmU1lxNFZzbEkyVXNteVFFbHJoMVZERThGendoV1Mz?=
 =?utf-8?B?OVZmaGhGTHNPMDJkZXY2R29CVVRabE5NOUpYSUM1dXRCM0dubnBIOHJ6bkRG?=
 =?utf-8?B?cVpvemRORjkwT3F1dFlIZmo4d1YzVHQ3V3k2Y2hNSXpLQTFFR0srK3ZDRmpY?=
 =?utf-8?B?eFRpMXN6d2pab3RjS2xGcWFoVGRxOEt2UFBYQy9OKzgrS2M5OW1XSFd3WGh0?=
 =?utf-8?Q?K0rE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <152A4198D8A23041A70D24265DBA077A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f47b596-cc63-420d-4ae7-08dc764fc0a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 09:00:08.6120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5F2vHtpGWyYHMTbOJ/9AKHvHZ6WA+6Lok495MTKu8JxObk4b65UcQwZHHXBvdq36OotoZY9eTSzSz1ouMfsmEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9337

T24gMjAyNC81LzE2IDIxOjQ5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTYuMDUuMjAyNCAx
MTo1MiwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h5cGVy
Y2FsbC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+PiBAQCAtNzYs
NiArNzYsMTEgQEAgbG9uZyBodm1fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExF
X1BBUkFNKHZvaWQpIGFyZykNCj4+ICAgICAgY2FzZSBQSFlTREVWT1BfdW5tYXBfcGlycToNCj4+
ICAgICAgICAgIGJyZWFrOw0KPj4gIA0KPj4gKyAgICBjYXNlIFBIWVNERVZPUF9zZXR1cF9nc2k6
DQo+PiArICAgICAgICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4oY3VycmQpICkNCj4+ICsgICAg
ICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+PiArICAgICAgICBicmVhazsNCj4+ICsNCj4+
ICAgICAgY2FzZSBQSFlTREVWT1BfZW9pOg0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9pcnFfc3Rh
dHVzX3F1ZXJ5Og0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9nZXRfZnJlZV9waXJxOg0KPiANCj4g
QmVsb3cgaGVyZSB3ZSBoYXZlIGEgaGFyZHdhcmUtZG9tYWluLW9ubHkgYmxvY2sgYWxyZWFkeS4g
QW55IHJlYXNvbiBub3QNCj4gdG8gYWRkIHRvIHRoZXJlPyBZZXMsIHRoYXQgdXNlcyAtRU5PU1lT
LiBJbW8gdGhhdCB3YW50cyBjaGFuZ2luZyBhbnl3YXksDQo+IGJ1dCBldmVuIHdpdGhvdXQgdGhh
dCB0byBtZSBpdCB3b3VsZCBzZWVtIG1vcmUgY29uc2lzdGVudCBvdmVyYWxsIHRvIGhhdmUNCj4g
dGhlIG5ldyBjYXNlIHNpbXBseSBhZGRlZCB0aGVyZS4NCkFoIHllcywgSSByZW1lbWJlcmVkIHlv
dSBzdWdnZXN0IG1lIHRvIHVzZSBFT1BOT1RTVVBQIGluIHY0LCBpZiBjaGFuZ2UgdG8gRU5PU1lT
IGlzIGFsc28gZmluZSwgSSB3aWxsIG1vdmUgdG8gYmVsb3cgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+
IA0KPiBKdXN0IHRvIGRvdWJsZSBjaGVjazogSXMgdGhlcmUgYSByZXNwZWN0aXZlIExpbnV4IHBh
dGNoIGFscmVhZHkgKGlmIHNvLA0KPiBjcm9zcy1saW5raW5nIHRoZSBwYXRjaGVzIG1heSBiZSBo
ZWxwZnVsKT8NClllcywgbXkgY29ycmVzcG9uZGluZyBrZXJuZWwgcGF0Y2g6DQpodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzIwMjQwNTE1MDY1MDExLjEzNzk3LTEtSmlxaWFuLkNoZW5AYW1k
LmNvbS9ULyNtYzU2YjExMTU2MmQ3YzY3ODg2ZGE5MDVlMzA2ZjEyYjNlZjgwNzZiNCANCkRvIHlv
dSBtZWFuIEkgbmVlZCB0byBhZGQgdGhpcyBsaW5rIGludG8gdGhlIGNvbW1pdCBtZXNzYWdlIG9u
Y2UgdGhlIGtlcm5lbCBwYXRjaCBpcyBhY2NlcHRlZD8NCj4gT3IgZG9lcyBQVkggTGludXggaW52
b2tlIHRoZSBzdWItb3AgYWxyZWFkeSBhbnl3YXksIGp1c3QgdGhhdCBzbyBmYXIgaXQgZmFpbHM/
IA0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

