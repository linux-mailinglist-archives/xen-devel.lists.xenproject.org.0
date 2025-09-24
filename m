Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05DDB9879A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 09:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129004.1469135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1JfZ-00020z-Ju; Wed, 24 Sep 2025 07:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129004.1469135; Wed, 24 Sep 2025 07:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1JfZ-0001y7-HM; Wed, 24 Sep 2025 07:12:05 +0000
Received: by outflank-mailman (input) for mailman id 1129004;
 Wed, 24 Sep 2025 07:12:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abgr=4D=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v1JfY-0001y1-SJ
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 07:12:04 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c20a3d4a-9915-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 09:11:58 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB8295.namprd12.prod.outlook.com (2603:10b6:8:f6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Wed, 24 Sep 2025 07:11:53 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 07:11:53 +0000
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
X-Inumbo-ID: c20a3d4a-9915-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUeZhW3QL7ad4HsMbB2YvYHy3+A0Q+BCOHCrsPLWwzPKKa8fQQC0eG4btCdKv89zHomQq73zmYaYjRsfnFaG5jgn4s89WPdennKhxFHgjmGZGElzCr8ybBlcD6rn3CQpY7puFMajCumROeu7N6bOsiQuI51OQ4uMw1OeFqee1no4DexSCbA3Lbwbs9lIqRk68shyVgO7SHDp2MvW6RgIwYIqA9MdTpbSlSTrzq7hvJRwMBYJqm8sUgZwQseCH4Rn0cETuJx0sk6+nG/eLa8HORftA+auFeEPCy4kSFneYS9XZeGcR0XvbS8mCf+mrCvhXvKGomtmpj29/HgjDlRbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwdAdAa7M+69MdMkwP13EIIAqpDEPr/avoIE8DCxgCk=;
 b=T7Fuox2SxeudGD/WzIG6qGd/YpXZW6wvPrrNZU4Y7AZ6fMTPwsv+lez4+1sJj4rGtyWQoCxwzHxphx4POmn/B254Vp/Pf8QajKGD2C2Oi71arLG2KGVb//yoq9Be6Ap7LZFLQxA3Iz8Otc1coJA0NDA0oJT3GEnYoS5PNAPvwwPmd/T1jJJYnrfBsItEXAa8JAndRRWq2uy+K+rRgotdhj6A8HD130aQ3YuBcMeTRZZ55219nGDNvEDlQAI7oEY/aRL4G8vy1wbbqWe/80WPGsAO4irU7sv97nEvJ1ioCoPyLxb9cPdiJV5VMOmakRe9Aj2KBpVLTGO3k9ueaK+h6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwdAdAa7M+69MdMkwP13EIIAqpDEPr/avoIE8DCxgCk=;
 b=1KbhTfyvymjYTyFl4CbZX4gYQIOTMtcBCGVnfOQ0OJrUCItV5rm8f0O0cD6pTW9/hLOObaAoH1omACdF91xr+m2nZeH67jUrBpqmHDwUbADD1jAW8EOs3K1OVYgaLdHuo9ky34MT1SJXG+ad6IF7qUi2YHRTMoB5aO4wWN1atFE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 07/26] xen/domctl: wrap
 domain_pause_by_systemcontroller() with MGMT_HYPERCALLS
Thread-Topic: [PATCH v2 07/26] xen/domctl: wrap
 domain_pause_by_systemcontroller() with MGMT_HYPERCALLS
Thread-Index: AQHcIiYFaSMS8x+uC02GcRYZiIpQDbSMhVsAgBV2NTA=
Date: Wed, 24 Sep 2025 07:11:53 +0000
Message-ID:
 <DM4PR12MB8451DCCB718F5764C3910234E11CA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-8-Penny.Zheng@amd.com>
 <99737b48-2f14-4d49-85f8-5acd4a434dde@suse.com>
In-Reply-To: <99737b48-2f14-4d49-85f8-5acd4a434dde@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-24T06:53:35.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB8295:EE_
x-ms-office365-filtering-correlation-id: c18e2d21-1356-45e3-2e78-08ddfb39a3be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bVRRaFNUZWJ4b05DTlZjNjRPeUpvYTZIQzMzQzZaMlhuKzBDbnpJWnJDcHFa?=
 =?utf-8?B?bE9udDA5dVM2VHZlemNFdUdZY3A5dXBtdnhuZHpRWDFJNkVGWHBCaXNlRllL?=
 =?utf-8?B?L0dYdXEzRWZKWEQrUXZkSGlhQWljRkhkSmhXNVp1b2FGMC9RVTJVb1lXbGVS?=
 =?utf-8?B?T0Z1aEI2RWl0TWVrSk9Fa2JCOGx1U1Zpa05qWCszRUdvWWxlUWhpd1I4NXRl?=
 =?utf-8?B?Z1dmaFJEcWtQUHM4MGF3ajRONCtNbXBSZ01wVDZiTnJ5aUZZcmJvbGFPVFFz?=
 =?utf-8?B?ZW9tVXpFRFY3cnNZamZiblM1cFNGTkR5QUR3bnY0NGZuMzZrVjkvNWZjQjdS?=
 =?utf-8?B?eUdKVnFVVTF6Q0RicWZaeUt6YnBYUFFzVEN1M2tpRjdPWDZqTG9hNjV6aW80?=
 =?utf-8?B?MUZSSjNOQlBoQzgxZS9oalV1eGJwbGE3TkxMTU4xN2pvT0FrdXhyeDRSSmMx?=
 =?utf-8?B?R2k0bkJiNXpKekc2NjZHUFJyblVRWFpXUjRMZDZwZTRzZ014ODhNbmVIRUxG?=
 =?utf-8?B?bzFLdWFTeTRXSWNNMjVnTkk2Wk91ZW8rYnFEcUoyQ1NhMUo2VUs2Yk1NTGEz?=
 =?utf-8?B?YzJvZkZVZS92UUhDdi9QU2JFaVh3U09TKytncWFYNWszMHBOY2l3TU1VUDVw?=
 =?utf-8?B?ckdHY0tITFI4a1ZSYkNxeUhxYmhvaXVkSmhYTUJYVTNiU3JaNjQvamZSbGxo?=
 =?utf-8?B?emZEdTI2VEFiQW1qUHg1TXpNWmJWK2xPT042T0ZLQnluTHRzUHEvMThJSHdQ?=
 =?utf-8?B?RWVDemdqSEZyZVlSZ2Y1NzF1M3Q5U0lGQkNkQjRISUJCR0xKQmU3ekN2T2xk?=
 =?utf-8?B?YjdmcFB3VU1OV0JMQmt2ZHhLLzJuekFKeGJVdGd2Z1VyYWxia0NQMEhWM0Qw?=
 =?utf-8?B?dXpKMlQzS28rNnUyODU2UTBId2UvdlhvMDQvRS9uN0R6MWt3WUJoYm1sNWNE?=
 =?utf-8?B?ZGdSMnBuRXdROTNmS0hoUE81R2tEVlBXaDFyeFp6SWU4YVVVb2RUZmRUa3Qz?=
 =?utf-8?B?TFo4ZmNOdWx3RmZSQXNXVVJucy8wRU9xYWFKTlROdE5wZFptQSttTUpacTRM?=
 =?utf-8?B?dzhMWWdhaEx3WVVQbzdKS0xwRjAvVXF4TUdwQlVCRFdCcW1Ib3V1c29aaU5Y?=
 =?utf-8?B?ejZONUhpbWRBWFhOQkpYU1dpU0lOeEN6eXhIY1YyclRQSUloZ1hJNVFMcWsr?=
 =?utf-8?B?ajA3b0JOMjZ5ZWFUN1kxK1JJT280UVJ3by9rc1lUcUUybFc0V3JQY3NZTm1H?=
 =?utf-8?B?ZzdMalhINHJmdDdySUxEdTloZW9ybmxEbVZQako2Q1lGK0hldmFyaktZdTk0?=
 =?utf-8?B?UWlhc0VBU0pCYUJHcjNDemdpUHpZOFRHdWRzYjY5by9rdUgxWWlNK3hXa0ZW?=
 =?utf-8?B?MXNheVN4S21xSFVmOGViY05uZnV2U0JXcCtaaXh0bXE5c2xzaUJrNnd1RjRa?=
 =?utf-8?B?WmFyMFd2aytVeFoxNURBL1VUQzJNWStNa1NEYkQwc0Q4WGxpOFRmNU5Kb1pV?=
 =?utf-8?B?V1lKcHZnZXQyWDQ3RnpMVWdURFR4RjB4SHdMVHAzRGFtZTFKVU9sOS9yMmF0?=
 =?utf-8?B?R2Z6dE5DNnBCMG96S080TUJKQU1CeVM0am9MbW0rYzFNbVNYUlVSenhHUDdN?=
 =?utf-8?B?NjlmblNUOW1Sb3MwZWd5SWxKZVJKNnMweUE1YXkxVzBwT2dLOFVKaVhVNGc5?=
 =?utf-8?B?ZTArRldHL0dxNzRuQ01ublVSaHZHaGYrckNUYi80bHFsdjFiamptU25aSStP?=
 =?utf-8?B?REloUy9UWVBkNlcrcm1reGFMVDBYRHpJZlp0N3B2QlZVTTI0MWFsWCtKYlgy?=
 =?utf-8?B?NHZuYTh3UlY0blJSdlduY3YycUF1U2xEdWs0WG1VWTFxZTArTEJtWHVDSDYy?=
 =?utf-8?B?VXhpK0hLQXpmOUJDeFNLSXVkQkpWeTJxbUFrSllrQ1lpZVRUbXZXYVZ2Zi93?=
 =?utf-8?B?WDUxMDNxRUozNWE2ZmpMN29HalE4Z2VYSzhIVUZaMFRmOUYyY2RMRXZucGNm?=
 =?utf-8?Q?WOCic1f3Up8ZOkw0SZRZ+XFWV/S208=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TE1zcUllOXk0ZVRHaFVOelpRVTFtd1M2U0RxcXVBZy9UM0hiczk1S0RKNDN6?=
 =?utf-8?B?QUpyMWxKZEFKS0pBTHdNWHpzU2Rha1pMOTVTTjFaU3FxZUl3MkpzeE4wTWpj?=
 =?utf-8?B?Um1jb3lod1ZmbGREaWVyNXc1ZUg2QS9udGtDdUxOeVViQVMyYjlyZHdSL283?=
 =?utf-8?B?VjBYV2ROU2NkN0NMbmN0OFlrYVRJS2FRTk1CL0xMTmdkQnZ6UnlJNTlac3Bv?=
 =?utf-8?B?aEs4RktEZDBkWktRU0g3SWxIL2dLWTlnZ0VscFo1MWYzK09GamNJY045aUlo?=
 =?utf-8?B?cFZzblN1VW84Z3IycXY2WWZwSFNqL0RFOHdkV1FXYkxFK2Z2OERBQUQxRVVy?=
 =?utf-8?B?WStCK3V4YnI3dlI0V2pBaVR4QlNsOEw4bnAvSGd6RThnMVE1R2hoeHVZOFFJ?=
 =?utf-8?B?Z2tJR3kxd1BTUGRLRFE3ZHdVYUplUmo1Y2JBeFp3OXpQWHVYWngwaHZvdlpm?=
 =?utf-8?B?VFh4eEVvbGVYWWhYem5nUEw0b2RWeTFoektGVUVNVk1lMzBDZ3ZvUjdQYng0?=
 =?utf-8?B?ZUN1Vml2ZVZKa0hmaFMvb1NhbUF3L2YyQkIzMVh6TlZLRUl0bHFzK3hqS3Uv?=
 =?utf-8?B?blpERzFId0t3VW8wY0hsNlp4bmpEWE4wekdBZHZMLzVUUXFOQU1Ea2l6Z0d2?=
 =?utf-8?B?WXhOa0loRURwT0VYbFRTSGw1c2Mrejd0U2dyQSs2Z0xzdnlSTDM0UmtTWTVE?=
 =?utf-8?B?cWtRbDB4VkQxWFVsR1NKR0dPeVd2QnBkQkJya2FXdVl0YWpNSG5qTllUd1h5?=
 =?utf-8?B?blp6UFBUVjJUUnF1bkExcEZYa05tY2orejRFN1d2bkVvZnZ2cGhlMU53a0lj?=
 =?utf-8?B?TEZxTEhNTmpuUitGYk16SWxPR0xHWmZ6aWViaTE0bzMzZTIrMWNIc2o4d0Zt?=
 =?utf-8?B?b0xFc3dFbmZ1Z1l5MW50ZjlETWRvUG1odDZsTVhzQTlubFRkM1llaU4zNFBv?=
 =?utf-8?B?TjdzOU54ZDl5Uk9VRmpRZmRIUGF1SnBzVWtHbHJiMzd4VWZ4WlFvZ2FBdmJk?=
 =?utf-8?B?Ti9FeWVMNnZMeEZQYzN0Z0dzRUFSWm1nTmpsWVFUR3ZwclFGbHo0NDVUT2ts?=
 =?utf-8?B?WEorc3BBOW9vdmhxNGlzMEF0cTZBOHVEQWhsbURpMVVndEk5eVFZZVcvM1Ar?=
 =?utf-8?B?TkhCWnRiN3VOR2dzL1cwZklkZTVpTkRzczZPeUplV3ZJc1g4d01jY2JhWE4x?=
 =?utf-8?B?UUg1QUl6NUwwVkxlNzF5ekRqNzJ6VytkbDVtNkVmRTVFMGpOdUhPaW9POEpn?=
 =?utf-8?B?ZmRwRnluTVF1RXVhdG84dStJMUhTRVVudzl4WjNKanNwVFI0Umpob2pFZHVs?=
 =?utf-8?B?T0RVTnJFMzZyZCt4bENOa21iVXNQRURWQzZIVjhLYjlQNndXVFpxTSsrQ2c4?=
 =?utf-8?B?Q2JYV0k3bFBuTm1xUGo2OGUvblB0OUtWTkMyVkZGOFlJZkpMaGE0OE1ZZVZt?=
 =?utf-8?B?ejJ4SWI5QTRvL2RXbXBWNzhQdkhMK09tS2l3cU5NSUk1UGZmeG5hQkViZmJI?=
 =?utf-8?B?UE1XN056OTBIM2pKVkd4N1M5WjNzVmNLdldFdmpkck40bmpMU1RHcTZEcktI?=
 =?utf-8?B?UFdEdnBqVzhQQlNIL1kzeTFuRHlWUWErK2o5dGF5VlEvaDA1cUVlL2FqcTFu?=
 =?utf-8?B?UDdGMzgzS1pLQXBhZEhqdU1SUSs4U2svVjR5SEVIZ2Q4OCtGdWVlejhuUHVF?=
 =?utf-8?B?c1hTMENlRVJCcXg0MEVZQkQ1bVFoL3JxN3R5SUNWZ0ZQWXVpa0kyQ0dnSTJR?=
 =?utf-8?B?NElBVklCZDM5OGRyU3VRUHpLWkNzT2FITHNpRXNsMWlXbFVIbWdOenNzVVl2?=
 =?utf-8?B?TldkM3BtcnJWeWJTam1xQTFoS1NnQUh3TG5IQjladGlEUFlBVWFYNWwwWkFM?=
 =?utf-8?B?VmxocE5mTFNKKzlYWVE2eEFlYlpUcGh6Uk9tNDNCSjRWUVRjK1RFdXdObXlZ?=
 =?utf-8?B?SjBXaStsVGpsZjUxL25rNHJycGlEcXE0UzRuREhDQTBCMXdFb3lHeURUb2lB?=
 =?utf-8?B?NG5SVnBWbWVQV2djcXVEMi80QStCYVZFTXVwQVdIZThwWFZ1MW9vS2JlSCt1?=
 =?utf-8?B?Wk1zSXlCTEZVQWRTRVArRE5BOWZML1FmOGxOZDZjbFN0Q1BvQTVDWVVCNTZh?=
 =?utf-8?Q?869w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c18e2d21-1356-45e3-2e78-08ddfb39a3be
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 07:11:53.5163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vnIhdbQqc0prwF+QuypvDp3AeTbD2Jjd74tmukfk33U18nDMdLHWwiSxMVuLAZ+V958ohU4iKXWVp6U/O4mbRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8295

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDEw
LCAyMDI1IDExOjA5IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAdmF0ZXMudGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdQ0KPiBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYyIDA3LzI2XSB4ZW4vZG9tY3RsOiB3cmFwDQo+IGRvbWFpbl9wYXVzZV9ieV9zeXN0
ZW1jb250cm9sbGVyKCkgd2l0aCBNR01UX0hZUEVSQ0FMTFMNCj4NCj4gT24gMTAuMDkuMjAyNSAw
OTozOCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYw0K
PiA+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4gPiBAQCAtMTYwNiwxMCArMTYwNiwxMiBA
QCBzdGF0aWMgaW50DQo+IF9kb21haW5fcGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcihzdHJ1Y3Qg
ZG9tYWluICpkLCBib29sIHN5bmMpDQo+ID4gICAgICByZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+
ID4gKyNpZmRlZiBDT05GSUdfTUdNVF9IWVBFUkNBTExTDQo+ID4gIGludCBkb21haW5fcGF1c2Vf
Ynlfc3lzdGVtY29udHJvbGxlcihzdHJ1Y3QgZG9tYWluICpkKSAgew0KPiA+ICAgICAgcmV0dXJu
IF9kb21haW5fcGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcihkLCB0cnVlIC8qIHN5bmMgKi8pOyAg
fQ0KPiA+ICsjZW5kaWYgLyogQ09ORklHX01HTVRfSFlQRVJDQUxMUyAqLw0KPiA+DQo+ID4gIGlu
dCBkb21haW5fcGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcl9ub3N5bmMoc3RydWN0IGRvbWFpbiAq
ZCkNCj4gPiAgew0KPg0KPiBJIHdvdWxkIGhhdmUgYWNrLWVkIHRoaXMgaWYgdGhlcmUgd2FzIG9u
bHkgdGhpcyBwYXJ0LCBidXQgLi4uDQo+DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9kb21jdGwuYw0K
PiA+ICsrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMNCj4gPiBAQCAtMzkwLDExICszOTAsMTMgQEAg
bG9uZw0KPiBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVf
ZG9tY3RsKQ0KPiA+ICAgICAgICAgIGJyZWFrOw0KPiA+ICAgICAgfQ0KPiA+DQo+ID4gKyNpZmRl
ZiBDT05GSUdfTUdNVF9IWVBFUkNBTExTDQo+ID4gICAgICBjYXNlIFhFTl9ET01DVExfcGF1c2Vk
b21haW46DQo+ID4gICAgICAgICAgcmV0ID0gLUVJTlZBTDsNCj4gPiAgICAgICAgICBpZiAoIGQg
IT0gY3VycmVudC0+ZG9tYWluICkNCj4gPiAgICAgICAgICAgICAgcmV0ID0gZG9tYWluX3BhdXNl
X2J5X3N5c3RlbWNvbnRyb2xsZXIoZCk7DQo+ID4gICAgICAgICAgYnJlYWs7DQo+ID4gKyNlbmRp
ZiAvKiBDT05GSUdfTUdNVF9IWVBFUkNBTExTICovDQo+ID4NCj4gPiAgICAgIGNhc2UgWEVOX0RP
TUNUTF91bnBhdXNlZG9tYWluOg0KPiA+ICAgICAgICAgIHJldCA9IGRvbWFpbl91bnBhdXNlX2J5
X3N5c3RlbWNvbnRyb2xsZXIoZCk7DQo+DQo+IC4uLiBhcyBleHByZXNzZWQgZWxzZXdoZXJlIEkn
bSBub3QgaGFwcHkgYWJvdXQgdGhpcyBvbmUsIGFzIGl0J2xsIG5lZWQNCj4gdW5kb2luZyBpbiBh
IGxhdGVyIHBhdGNoIG9mIHRoaXMgc2FtZSBzZXJpZXMuDQo+DQoNCkkgc2hhbGwgYWRtaXQgdGhh
dCB0aGlzIGtpbmQgb2Ygc3R1YiByZWFsbHkgaGVscHMgbWUgdGVzdCBNR01UX0hZUEVSQ0FMTFM9
biBmb3IgdGhpcyBiaWcgc2VyaWUgY29tbWl0IGJ5IGNvbW1pdCBhdCB0aGUgdmVyeSBiZWdpbm5p
bmcuIE90aGVyd2lzZSwgaXQgY291bGQgYmUgb25seSBkaXNhYmxlZCAoYW5kIHRlc3RlZCkgaW4g
dGhlIGVuZCwgYW5kIGFjY3VtdWxhdGUgdGhlIG1pc3Rha2VzLi4uDQpCdXQsIGFzIHlvdSBzYWlk
LCBhbGwgdGhpcyB0cmFuc2llbnQgdGhpbmcgbmVlZHMgdG8gYmUgcmV2ZXJzZWQgaW4gdGhlIGxh
c3QsIGFuZCBJIGNvdWxkIGFjY2lkZW50bHkgbWlzc2luZyBzb21ldGhpbmcgYW5kIGxlYXZlIGRl
YWQgY29kZS4uLg0KQXMgQ09ORklHX1NZU0NUTCBpcyBhbHJlYWR5IGEgcHJvbXB0IG9wdGlvbiwg
dGhlbiBtYXliZSBJIG5lZWQgdG8gcmFpc2UgYSBuZXcgY29tbWl0IHRvIG1ha2UgaXQgYXMgZGVm
X2Jvb2wgYWdhaW4gb25seSBmb3IgdGhpcyBwYXRjaCBzZXJpZSB0cmFuc2llbnRseSBvciBqdXN0
IGFkZHJlc3MgaXQgaW4gIiB4ZW4vc3lzY3RsOiByZXBsYWNlIENPTkZJR19TWVNDVEwgd2l0aCBD
T05GSUdfTUdNVF9ET01DVEwgIiA/DQoNCj4gSmFuDQo=

