Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C6A99A033
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 11:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816872.1230974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szC1z-00011A-Iz; Fri, 11 Oct 2024 09:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816872.1230974; Fri, 11 Oct 2024 09:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szC1z-0000z2-Ft; Fri, 11 Oct 2024 09:33:55 +0000
Received: by outflank-mailman (input) for mailman id 816872;
 Fri, 11 Oct 2024 09:33:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UIMz=RH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1szC1y-0000yw-9V
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 09:33:54 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:2417::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec748da7-87b3-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 11:33:51 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS7PR12MB5959.namprd12.prod.outlook.com (2603:10b6:8:7e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 09:33:47 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 09:33:47 +0000
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
X-Inumbo-ID: ec748da7-87b3-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4z2rIq2BLVZZsObzSlcLsjZ+YDSS2z+VoDvc9pdg7HR6uVgyIacsOwYgaf4tzKVeaHJsrb8KSI4XiLI7dCcPjBSRO71pfnk0YwBzeLYtpZTUdPRuVZRJk6hPP2b1pJIwUr9fXHJnZ3B+6/Cv3MQniTxXYahny46uV7qKrAJKE632dwpuLmNAZbxkd2I6zgbBEVdFwLv/ZGJMYeC4BjGF5yNcYCedeUJl+gtRRwTnWVlKBg1WOrYhHrPvQ2aGtpyZqo3azPsaePJF52kxxyW74rmUFau6IE0OPYYa0MQglUGLZjJQV86Blhv2GYYJpX530Wn1GngLDiyvwY2ABPLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtOfM3RN79vdFK+e0pyh3Ry3z4DITZSUryAgsd+yQbM=;
 b=YfjkCDTim4+TeCBxdq0FgeA+qsrKg8+4kpPUuetLP18Aw/fqVtFU301OMnr+WchFYjwFDo5rYYz0aHjFUFWr+RoiuOSnisPRr0ZvOE76nfoLCWURVbHCBMUE8/4P6GfdGr6sn+L1GzC9oZ9VwHVcyF5N0oVHoRFMeogDXlGm98BGXBureST+aB7I+qvC/2Wj7q0BFuH05Uz/M222ScczR3CVnH1OLuTWPSjWquLsbiuJnVSBOUeE9tqzTPeJFyxxhcVSyYjfDcEhNlQnm3bf0Z+ALioznXPgsaaa44abL0KeUjj/ggU7DbooEjxF5ue8zKH2hCn7noaHj1x+uFtM4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtOfM3RN79vdFK+e0pyh3Ry3z4DITZSUryAgsd+yQbM=;
 b=GsyBomcetffXZz/LzxiZRwvAIA/vDjM/K/nNWCXFXB9S+wlCMvUvMIFo3L8ZvtnEuvPcdHqyYFz7dlzccXCZT9pFSFtEnHciCipjD5QXoOuA/ncd2Dwuo6HD4dFCUrtwuZ/WFspOBwOvHAIvh14SxvTIsGh/qWo3hdsJZ2rB0V0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
Thread-Topic: [PATCH v3] xen: Remove dependency between pciback and privcmd
Thread-Index: AQHbG4+3Lfp3cJlJ4UuqoaLQId+ES7KBP0mAgACK34CAAAW/gA==
Date: Fri, 11 Oct 2024 09:33:47 +0000
Message-ID:
 <BL1PR12MB584931B86739702086CDFF12E7792@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
 <318bd8a4-a349-4e7b-8653-6995d5f9f125@suse.com>
 <BL1PR12MB5849EFA99B7F0C55D201738AE7792@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To:
 <BL1PR12MB5849EFA99B7F0C55D201738AE7792@BL1PR12MB5849.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8048.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS7PR12MB5959:EE_
x-ms-office365-filtering-correlation-id: b2d78102-f822-4aa2-f733-08dce9d7ceca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MDFxLy85a2NDLzR3T2o3S1NXS0hGOUhXL3ZmWUhZRENOWnVUaXlKZUE1Z1ls?=
 =?utf-8?B?TXFOcHcyZHZmWTRsOTBKN0s3MXFlTklwajdiWVpwTU5XQmNqaTJlZ25SODBj?=
 =?utf-8?B?aXR2VE1lbXllTUdwV0RyZVNRT0owN21zakpyK3c0QjNZYWh4a0gwNlFwR0lF?=
 =?utf-8?B?b0lHSDBKcnp1UHhTbE9OY255QzlsY1c5UHoycWlvUnhhdnZGVmIycFhTNXJI?=
 =?utf-8?B?T1lIMTZRdWhLRWxLbEZTS0FXLzFGb0tYczgyWjY1Z3hmT3NnTTdTenljTjFE?=
 =?utf-8?B?UktZU1I0bGFmVy82ekkvU0MwVmlwTVdUTklGTlFXd1k0MnJDK1B6TldMa09x?=
 =?utf-8?B?V1MyTkwwV0l2cUk5NVZyUmxQRDg0OUlhK3M3TmhGcm4rV1BTUkJEUHdQYzhN?=
 =?utf-8?B?VTkyalR1SWNqVUJaQ2ZLbkJwN1BNbkZvVW4vT2c5WmVkcnFaamZLZW02Q0hS?=
 =?utf-8?B?NzJtY1J3S1RhVWxpSlVvYktFZEJmRUxWUFUwRjRmVDVPdlNNWjd5WUZBL2FW?=
 =?utf-8?B?OVUzclNSSzNiZEorSnNjdXFNQ2pHd3VRQ1BySnlQYmEzTWNST0ozY09VeFBY?=
 =?utf-8?B?WllPR1VyQ3owL2FoRnU5VTFKejBTbXlJYmpwNUNab1lEWDIyV1haSWVPbFdx?=
 =?utf-8?B?TGh4Y2orYUF1dm5YNmtFOS93V1ZiNHFydkdoV3oyWDc5elNTY3FuejJQNGM5?=
 =?utf-8?B?ZFczM0tsRk5TQjFGemJqVnFKOFpZbURidDZzNW1weGJyamM4TXRFR2FLcndP?=
 =?utf-8?B?S3dyc3U5SzBFdmF3MjlhVDludFVteENVRkNNOXMyL1dkVEYzb3BhbkVIbHdx?=
 =?utf-8?B?TTM5MkpLdVNoQ010Mm5SYmZmK1pHUEFCZU1JT0RXRlJzVU0xT0hwV2JOS2M0?=
 =?utf-8?B?aUVJT3h5cjZmaGtVbHJ0MEo0a1dPVzBKcFQ0UHBQR0ppUE9ZbWorUzV2RUVr?=
 =?utf-8?B?RWpuSUIwcCtMaTlDclNuY3RoM2p2U3ZETG1jWFR3aE1od2FjYmRIZzFEYjA5?=
 =?utf-8?B?YU85YWN5bkZLU3Q5b1FhVnhwSnBSMTNVc3BaemkvM3RsaVNxSDdKSFFrNVNT?=
 =?utf-8?B?NXI0QzUzSGxCakV6ME5ma0ZodmhBeTJDWUJUcWFBaGpGc25lSUhDN3pZdkRK?=
 =?utf-8?B?WVN1Tkhhd3N3bnVNRWkzdmJvZHlyK0ZJZ0E2dUdXa202bEF0a3c0aTFZWlVy?=
 =?utf-8?B?OU9acVRVYno5QnVvOVR6NERMRUdMYXB0bGluek04TXNjZ2xCQ0EvU3lRQmhZ?=
 =?utf-8?B?V0d6c292SkZheEw3RzhjZ2p5cnZsbXBYRHRxSVNxeGNMczBmR1kxSEV2NkZT?=
 =?utf-8?B?WEpjRUprdU0vRnFZeFZGUnhEYnFoQVkzempxKzFBLzRjeTBuNkdnT1pKZG81?=
 =?utf-8?B?Zng2MFQvVTZrKzZScnNzVmI5UTlqR1NPU1dYWGFhd1M4TmdtUmsxTHRmcHpi?=
 =?utf-8?B?S2RiVUtURjNhcGduMVY3RFZOSG1PZm50SHVGQ1VZL1JDSGJjOGdLVVN4d1BY?=
 =?utf-8?B?K3k5UUxUSHpIR3U5TTBXaXlGajh2dEJkOEZJRGRPdndZNkhab1h1R2ZUVWxD?=
 =?utf-8?B?NWFrancrQkd6dXZ5Qjd2d09mdzNUSGpVVnVvZmNSbjVBMkpPZ3hINTh6K1pa?=
 =?utf-8?B?V2tpMVJCRDNJcDh0TFk0RUxXdGtKZTNRM3FVU0V6ZXdoOTl3R2g0UEpxbUpp?=
 =?utf-8?B?THRKUDZScituZE9YaFgvTzYzT0dCS21IejlQZUw0M2U2aklwSTZPZVJZN05Q?=
 =?utf-8?B?Y0ljWGZ5NDZqdEVjYlRQTTNOYXJIWnVHUEI3dWRybE5jbG10djVzbWM1K3dL?=
 =?utf-8?B?Rm5rVDFlWUU0ZEV1Wll1QT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXlkQmE2WkduNlZiZTgxRFZLeGRtRkVBdG5GRWhmWDljK0dJMnJnemR3RFFu?=
 =?utf-8?B?OE5BeDkwNDBqbEhJWERFODltWSsrSHVMOEYrcHVQWkFKNE9yS2VBZWl0Tzdp?=
 =?utf-8?B?amV5V2o4OU5SLzZzczdTYURmODZrbC82cVNONzFLVGZQYitXblV1b2M2T09z?=
 =?utf-8?B?ZG9ZNTZ0NjFqWGErWHZZeFZOaWJsaUVHUFVnN3Y2L1RmNEdIQWRNMHExL1Z0?=
 =?utf-8?B?d1N6YXgrdnZIL2FxUStCMVVBN2txK1BzdHNtRWI3UXRTa3IrUHhldmlPRitE?=
 =?utf-8?B?SFd3bVFhcEJUcHJHR3NjYklQaTlxTVN1azFKYVA5akIwVWZtS2JKZzdTN2pq?=
 =?utf-8?B?QjE4KzlVeG1ibEJQMnFaTzdpWW85TVZlRGRqL0NGbkE0SkIyS212aHIzVDZX?=
 =?utf-8?B?M0oyMHZBbEVxQmdHTlFnaUhJWnFpNkhMSUxzeGxSaDUwUkVYSllhWFpjSmc0?=
 =?utf-8?B?WldaSk1YWU0ycStlMzdta0tiZ3ZVRHowSDNNQ0FZNlkzTGtqRnU2NG9DTTRj?=
 =?utf-8?B?MkRmL3pCT1E0YktiODQwZW9jSDQvSFlkejVOSW1NZmp6QWxRSm9uWlBRSDNC?=
 =?utf-8?B?Um9oYnMrRElIVUc3S1RnNFFlTWxPZTlUYVpIK0h0L0lGcXFNYVVCcGZpUXUv?=
 =?utf-8?B?UVo4TEtpa3pQWHRzRVNkTDlUWHMxOGhXTVlJRWNmaTZiTXBBQnFXVElmditW?=
 =?utf-8?B?MXQ3VCtRSzg5aXF3NzFPdFUrOUZla1YybC9GVkUxOUw3Ni9GYTlFdVJ0OUlO?=
 =?utf-8?B?MXkxdkgybnBxejQrbkRXbEdSSGw1Q29RODJ0eTFncGhiTFdYUFFwamJmYjg0?=
 =?utf-8?B?cW1KWndnU3Zsb3BSeE5jK1NGL09uNkFQanVvdFpiZ2M3aVFiVFRYa0NNK2Zo?=
 =?utf-8?B?Zks3T2hjVnUrNjVsdzFONVhLSmdZYnNoY1lITHFxQy91a1hQakhZdDhMQ2pM?=
 =?utf-8?B?TDBFMUxxaVdMdktaZVFidkNCanZsVFJhVHMzL1VCQTJCY1hYOTA3U0NTRmg4?=
 =?utf-8?B?d0FqMGF1VjZ0VGFKM2pCbW9RdTVoVXRsV0M1SmxhQXJSOUR4UWh4eHBkd1Qx?=
 =?utf-8?B?NnpzVWZVREZxakt1VjdvQjVUZ2VONHAyWkRyODY0aTkyWUNZVmFHWUo4QndL?=
 =?utf-8?B?QjF6MGpZUzFZbExIZFdEZ2xvdW43VVlIMzVYWjV3Zm1uU2xJUUhVanA1VER3?=
 =?utf-8?B?N0FTWFF0YVR3MHFhbldwQXNiQW5VREcwQWY0RXZ2dTd1MUVFcEh0Wk5Rc2dQ?=
 =?utf-8?B?QkRWYWladzhuYTl1NG1FQnRiVEpWVTRoUTBoVUJTL1lJRUpsd1FXL1RENEJx?=
 =?utf-8?B?US9CczRYKytIclh5S1ZzNlRyemQ0MTVXRTRYeUxSSHRWcmY4YXJGeSsrVjN4?=
 =?utf-8?B?M204Sk4ySnZHTVVkblA4Skx5Z2M4RUxEWU90Z1MzaHlMRE5XeEthSm9HV2Yz?=
 =?utf-8?B?NmZrSG5IRFhhLytQSTFRV2YxaEpjdzNOL1pyMjdUcTdKT29rbHlFMEo2ZURz?=
 =?utf-8?B?cUNqZkxFVGRDSDJpS3I1aGsrSEtaVjZRRGhZRTE2cjVFczdiRDZ1THl5MW53?=
 =?utf-8?B?Q0JWbjR4REFEaWx0Uld2M3BPWXdhbithcmdMb2gxOFkzaDJ1RnFCYmQ2eW5B?=
 =?utf-8?B?VUxCQnRJZzYxZ3F3NE41Y1F3Q0REUTFOOU9OTlVFUFY4TWo1TmV4Q0lEWEdo?=
 =?utf-8?B?cjgvZGJRNGlyRzRidXJ0RmZ1VXNHNFF0VnBEM1ZvWmJqN0d1RkQ0K3ZVVHYz?=
 =?utf-8?B?Mk45aUZESnJibkxLU0c0RDJxcnNZeHBaL3UxVVRYMS9zUkd3aWxuT3QzeEJZ?=
 =?utf-8?B?UWtYaFZsRm1ORzQ0ZnY5cTZYcStqeDhoVUQzcmZUQ3hHM01LR3JkRDVZTmlX?=
 =?utf-8?B?L1doc1E4YjlhWlFOcjA5ei9PUGZUdkFXMFhNQlRiTGtwN1o2Sm1HWUhJbkMy?=
 =?utf-8?B?QmFMeUo2S1NmbUo1ZzdqTWdldm15bXErWWs4dUxKakk3WW1ucWhwV1JGcDJQ?=
 =?utf-8?B?NU9NdzlKOVl4VERtQ3JXWHcvcHl3YUh6ZWxSeVlXTGMzNFVicjdHU1BaZ2RE?=
 =?utf-8?B?UU1NL0dWZ0FhM3E5VnBQaUNqMGRDSkg0MGh3YUR2Y1lTcyt3MWoxazZoU3Bq?=
 =?utf-8?Q?Vy7Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D98481052C5874ABA65C25A1A8765BF@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d78102-f822-4aa2-f733-08dce9d7ceca
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 09:33:47.6069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LPCh1Sq1lVzVqYgpuqkhg80QYO+IrmSayV8wDib7MEbzzXP6Jl/YidNMp2vW1gQnr60+3ltkMCDwyZj5DDrnxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5959

T24gMjAyNC8xMC8xMSAxNzoyMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPiBPbiAyMDI0LzEwLzEx
IDE2OjU0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDExLjEwLjIwMjQgMDU6NDIsIEppcWlh
biBDaGVuIHdyb3RlOg0KPj4+IEBAIC0xNzU3LDExICsxNzU2LDE5IEBAIHN0YXRpYyBpbnQgX19p
bml0IHhlbl9wY2lia19pbml0KHZvaWQpDQo+Pj4gIAkJYnVzX3JlZ2lzdGVyX25vdGlmaWVyKCZw
Y2lfYnVzX3R5cGUsICZwY2lfc3R1Yl9uYik7DQo+Pj4gICNlbmRpZg0KPj4+ICANCj4+PiArI2lm
ZGVmIENPTkZJR19YRU5fQUNQSQ0KPj4+ICsJeGVuX2FjcGlfcmVnaXN0ZXJfZ2V0X2dzaV9mdW5j
KHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYpOw0KPj4+ICsjZW5kaWYNCj4+PiArDQo+Pj4gIAly
ZXR1cm4gZXJyOw0KPj4+ICB9DQo+Pj4gIA0KPj4+ICBzdGF0aWMgdm9pZCBfX2V4aXQgeGVuX3Bj
aWJrX2NsZWFudXAodm9pZCkNCj4+PiAgew0KPj4+ICsjaWZkZWYgQ09ORklHX1hFTl9BQ1BJDQo+
Pj4gKwl4ZW5fYWNwaV9yZWdpc3Rlcl9nZXRfZ3NpX2Z1bmMoTlVMTCk7DQo+Pj4gKyNlbmRpZg0K
Pj4NCj4+IEp1c3Qgd29uZGVyaW5nIC0gaW5zdGVhZCBvZiB0aGVzZSB0d28gI2lmZGVmLXMsIC4u
Lg0KPj4NCj4+PiAtLS0gYS9pbmNsdWRlL3hlbi9hY3BpLmgNCj4+PiArKysgYi9pbmNsdWRlL3hl
bi9hY3BpLmgNCj4+PiBAQCAtOTEsMTMgKzkxLDkgQEAgc3RhdGljIGlubGluZSBpbnQgeGVuX2Fj
cGlfZ2V0X2dzaV9pbmZvKHN0cnVjdCBwY2lfZGV2ICpkZXYsDQo+Pj4gIH0NCj4+PiAgI2VuZGlm
DQo+Pj4gIA0KPj4+IC0jaWZkZWYgQ09ORklHX1hFTl9QQ0lfU1RVQg0KPj4+IC1pbnQgcGNpc3R1
Yl9nZXRfZ3NpX2Zyb21fc2JkZih1bnNpZ25lZCBpbnQgc2JkZik7DQo+Pj4gLSNlbHNlDQo+Pj4g
LXN0YXRpYyBpbmxpbmUgaW50IHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYodW5zaWduZWQgaW50
IHNiZGYpDQo+Pj4gLXsNCj4+PiAtCXJldHVybiAtMTsNCj4+PiAtfQ0KPj4+IC0jZW5kaWYNCj4+
PiArdHlwZWRlZiBpbnQgKCpnZXRfZ3NpX2Zyb21fc2JkZl90KSh1MzIgc2JkZik7DQo+Pj4gKw0K
Pj4+ICt2b2lkIHhlbl9hY3BpX3JlZ2lzdGVyX2dldF9nc2lfZnVuYyhnZXRfZ3NpX2Zyb21fc2Jk
Zl90IGZ1bmMpOw0KPj4+ICtpbnQgeGVuX2FjcGlfZ2V0X2dzaV9mcm9tX3NiZGYodTMyIHNiZGYp
Ow0KPj4NCj4+IC4uLiB3b3VsZG4ndCBhIHN0YXRpYyBpbmxpbmUgc3R1YiAoZm9yIHRoZSAhWEVO
X0FDUEkgY2FzZSkgYWlkIG92ZXJhbGwgcmVhZGFiaWxpdHk/DQo+IEknbSBub3Qgc3VyZSBpZiBv
dGhlciBmaWxlcyBkbyB0aGlzLiBCdXQgZm9yIG1lLCBpdCBmZWVscyBhIGxpdHRsZSBzdHJhbmdl
IHRvIHVzZSAiI2lmZGVmIENPTkZJR19YRU5fQUNQSSAjZWxzZSIgaW4gYXBjaS5oLCBsaWtlIHNl
bGYtY29udGFpbm1lbnQuDQo+IEFuZCAiI2luY2x1ZGUgYXBjaS5oIiBpbiBwaWNfc3R1Yi5jIGlz
IGFsc28gd3JhcGVkIHdpdGggQ09ORklHX1hFTl9BQ1BJLg0KT0ssIEkgc2F3IG90aGVyIGZpbGVz
IGFsc28gZG8gdGhpcy4NCklmIHlvdSBpbnNpc3QsIEkgd2lsbCBtYWtlIG1vZGlmaWNhdGlvbnMg
aW4gdGhlIG5leHQgdmVyc2lvbi4NClRoYW5rIHlvdSENCg0KPiANCj4+DQo+PiBKYW4NCj4gDQoN
Ci0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

