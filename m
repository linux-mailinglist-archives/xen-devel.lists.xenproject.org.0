Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA9A6B949
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 11:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923914.1327290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tva2z-0002or-QS; Fri, 21 Mar 2025 10:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923914.1327290; Fri, 21 Mar 2025 10:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tva2z-0002m1-NK; Fri, 21 Mar 2025 10:56:17 +0000
Received: by outflank-mailman (input) for mailman id 923914;
 Fri, 21 Mar 2025 10:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n2Zf=WI=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tva2y-0002lv-0c
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 10:56:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f403:2613::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bb8a7cd-0643-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 11:56:15 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by FRWPR03MB10982.eurprd03.prod.outlook.com
 (2603:10a6:d10:174::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 10:56:12 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 10:56:12 +0000
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
X-Inumbo-ID: 1bb8a7cd-0643-11f0-9ea1-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTiNJvQm2NZjrANkM1u1twua2Peloi8dcs8Wx0DCjCr2BYXwlJTqkpJFeM8EPnDNth8W/CO87KwUiWH+U/PJcip/wVxkmfErcm8Q6xh2Ak7ezfh6/sMvZxorKqus7SaWbnNB4Rsjvu3EP0MWiaxMIi5uKSnq8Kp9AXBiC/URRGiZWCuLF95h5kQSU25Y5rSst2HZV7TYjgNDrLHUjEmb2u3RD9Qa6JDm63La0yYZ5tcSPm+MB8amf/bN3Irax0BNmxtDeVBd86pXe3ZwLEj6i+xzVQ76Ph2a2f41nbt218+mGuyW+P27Vu1o+Tp38wtfowj1eRQ/d3kVIb33HW0YCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5p8QdxBq3MDh4TfkxMPwRexXvfqB7M2cfkpfLYgTOw=;
 b=bfFKLzCbElLPGV5Whmb5ljrR2rHe+jRA6tOjzu6RNAemgjf6+tkncC+keGpkUw7suJr/RtICCc6vACqNTRg+cXcV+EDZkopYCyHWKQpD5wyMdvSf43Dqn2M+Xa20xLixF0VwdrHcUXs7D1zDRJqs/xoLsHqqHNErW7i9X1VkymSxMGJXwLGIrGBzdfssXQ7fCj2oBXQo23fBToMn8jW6s+YPkjH7rK4TBxFmQ92wdyIvQWqtCGbuqPiaku6PzdgmQ9QWKwOgZ62+pxd6LP+uGPd0kVH6AuukbHdR+gJgqGnECMj9qeONv7UA8bidZydlkXZR3qTm4WF5rqyeYDTuTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5p8QdxBq3MDh4TfkxMPwRexXvfqB7M2cfkpfLYgTOw=;
 b=HFgZZfhXk/E7YkrSvqGm2Siil8+S8yBu1SY2VMn0gNblQxU+NmdqSQXPDdLCFjryN2AsTnpUAoDOgOFN56/+w01ajjLluzldP6a62mRC2y6G/kXx0F9bLhbVnNUYEFtv7T9LXZUiX7e4nOd3w4x4OWakP9oCway1siSZvSIojbmPAJO6tfxjgL6B6t0VBJSk89+WdFN9rYC6NTqNe9b8dPL4GRtYkIF3Hm+kbUJtRIkHQYdLV0iNBUmNDNzgv8VtrPXOREbDVjg1GZAyFOZ3zEFw/NqzgReH3r3cfR8Tau/63ZXgz980mafG4Rg0qCRWDZVFJKFCwc2BalOrG7Lg8A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHblOXdxbIbbkNtn0WSg/9tW2OJ47N3cuWAgAYDBYA=
Date: Fri, 21 Mar 2025 10:56:12 +0000
Message-ID: <dbc57c17-867f-49c4-be61-186b5562eff1@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7fa0bde7-3aa9-48f4-a0ed-d03216edcc4e@suse.com>
In-Reply-To: <7fa0bde7-3aa9-48f4-a0ed-d03216edcc4e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|FRWPR03MB10982:EE_
x-ms-office365-filtering-correlation-id: 42130344-9c6c-49b7-7a30-08dd6866fe84
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MUUydzNkcUNKZGQ2aW9iM0lvRVZuNXZaS25mYThrOFBVOHBmWm5LQXByOFBJ?=
 =?utf-8?B?c3pMcGNwZk5INnJDdFZkQ21xdURnTnMvdlZTdVVITjJoWnZidzhkUWE5RkJB?=
 =?utf-8?B?UFlyN0g3V2g2RHg0WW8reW5WYjBoNFdyYVBIbCtKTkhJdHloZ2p2Q0lKUUk4?=
 =?utf-8?B?YWdOTEdNeGs4Y1dheE1wT0pYS1lZemp1bThJZ0pBMllNTVdjT1RNQ09QSk5G?=
 =?utf-8?B?dW9DVXNIQVNFS0VuZjFYS29PMFpTTVpzRHpwS0V1YzJmQkg0Q2JucHZ3ZzNs?=
 =?utf-8?B?MnZSL3UxK3cvWnRQNStvRUdROXM3UGRZa0JOVGtZeFVyN1IxNWdNZHY1d0sw?=
 =?utf-8?B?Q0FiNnFRL2VyQ0JqWWZwd2MyWmhnaWdXY05rdXg2TkNuUG1OWXBZNDh0ZzNG?=
 =?utf-8?B?WUMyWWdvMEl6VTY1WmpNWG5XeER1ZW11bXZOVUxkejNFRDlUdngxbUhMWEdi?=
 =?utf-8?B?bFJjVFlvNFU2cWNkRVI0YVk1eTdWN0JmU1hWR1dwWnpQcEZYODVtakN4Umhu?=
 =?utf-8?B?SzI4aDcraGlCdW1nZ1ZEYVNpUUhERzNsVGoyNGtVM0tNejJaZXJnalg0dzd5?=
 =?utf-8?B?WUI0Kzhrc0R5YkpVZ3QxT2NMUVF1VU9vMUpMR0p4YzRUQU5oR2VDQUxJLzRG?=
 =?utf-8?B?cG0yTi8zUFovUXRxdW9BMzIzVWJvQ0NJcWpXclNrVmtrbTNMM2pqalNTMW45?=
 =?utf-8?B?clZaT0Nha2xCTmhPZjBsaHI4STlVRGV2SG1yRko0WVJpVkdaQjhLWVk2bXBr?=
 =?utf-8?B?bHRBSkRjL1dmVVJGMlhZS1QwMmw0aDJGNHk5WkN0ZDV4djU5aDdPeWp2cXJj?=
 =?utf-8?B?WHhodzBCbUNNVGVkaHJpbnZNN28xaEc3QzNva1RDam1Pdkx6eFFlZDFLejQy?=
 =?utf-8?B?YjV3aG5jNkVRdjFRQTArNlBDVW00bExmUG9LY0VVTlV2U1daaEtreC9BcnZN?=
 =?utf-8?B?V2hpLzJYK01iWjhudXRVell0WUQ4ZndjMFNrVTIxbFYyUkhZTlVBcEJMZ2Yw?=
 =?utf-8?B?UC9pbEJhcG16aCtkNlVPTkZnWWVvZno1eFBxdmVUY29iT3UxM0JpMUVzT0Fq?=
 =?utf-8?B?c29wcUErZEQ5QVdRbjcrbG5zMmNkSkt0T2VRVkc0L1JZVUhNenh6TDNOcHJx?=
 =?utf-8?B?ZGVmd1VPRXE1cXBoSUtlczBJc3VBK1Z0RTBDWlluZzlDSUZLRWk0Z3h2OFNH?=
 =?utf-8?B?MDEwN1ZIQ1BzMjd2WGZRTm02RlBNRmNnT01rLzNneW56V1h2KzBpSXFBMDN2?=
 =?utf-8?B?UXM4eUJLdkVMMDYwdDh0UE91c3pVejFYejRPSDA1eksyRk5ZYWZZY2VQVEVa?=
 =?utf-8?B?anYyM2NsTHRNRjFlZUdMU2xKMjZqbkRmQ2lBRnJsZzBLMlh2ejZtd1BWUU1C?=
 =?utf-8?B?MW9DK3BQUWZ4YVE2Vkp1U1JUeDFUZWp2ODc0QmVsYzMyTjQ0RjkzZ24wN3Vn?=
 =?utf-8?B?N0VjTmh6czlqYTNJTjI0T3B5SjNwbDErQzRkazNodkthQytUR0VEQWFPbUJX?=
 =?utf-8?B?cGhJNGl2UnlSSGdxYXpSMXZLNUpJbjJnTk93VzNNdkEvRExBeWo3NXR3UDNr?=
 =?utf-8?B?TUxnaVhkdnN3RmdBRTJ0UlJaa3Y5TGtZL3hlQ0VxVGNIdHJTZWZtbExobGlR?=
 =?utf-8?B?UVJLeTBHWGVXMnNKMGZZTm9MeVA1Nk1xQis5UEg1aFc1MnVSQkdWMGM0M1FS?=
 =?utf-8?B?SUFWUGQ3eG5JbE9mb0JGUWVLRVJIZ1BxSm8vQm51ZVJ5c2JkclkxMHQ3TnVY?=
 =?utf-8?B?YWtad000WTBRN1luQVJtRE1PYlhhTXl2NUFBMi95OUxLajUvM3RBVHhRNG5n?=
 =?utf-8?B?blF4dnFpbnFoSk5JQmhwVWprR2dFNTE1YXMxSlRNNFNzc2RXNS9pTzJpU0tk?=
 =?utf-8?Q?SVxousnbcpgIo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1dmbGhhcFRvbEI4OTdiM2pkMEQ4WmxOd3FCRGNrL1NzbFJPeCtoOGR0aXB0?=
 =?utf-8?B?S0NvNmdxK0h1TnVXNWY1Uk5POU1rODc4MGxMUlpkZDZiQXpQdXQ4eFIwU0Ji?=
 =?utf-8?B?dTJCZWJTV3ZyUnRBWkxsZHBNTGN4aDdTanhQSE02ZnVlZEY5UWRxUC9QTERu?=
 =?utf-8?B?NWo4aDRlTEs5MVJMSWloNzZPNjJKbzJxcHJCc2NmWFpRNEMvdkk0L2Z1bUdy?=
 =?utf-8?B?TEdSNU9uRVRsT0xwUUhQSXJacUNhdFZROHlOSFhzNnFXM2RtalpMcm5JYmYr?=
 =?utf-8?B?WHhTdTFzSkVmcVNyN2dhaXdTU01DaHVlTmtSVXE5Q3VCQ211RDVWRjkxcENY?=
 =?utf-8?B?enIrbXh1Tk14QzNvU3F2TVdZOUNsVDc0WHRWbEo5TFBaNGxjakdLUzhMT2Zz?=
 =?utf-8?B?eUNWb002Y1hVUk5wMXJ5TGtFZnhTS1RSVUlSbGNGUXlUTDVPT3A1VGJISU1o?=
 =?utf-8?B?Y2w5UkF5b3Z0SGlyTXNneVdPMGhpY0VGOVQ1SjdwQlVaZnZ1UCtYZS8zdzRP?=
 =?utf-8?B?S0lPTEJRajlWQlMrM1cvcEhRN05yNm9ZbzB3OXdYZW9mUktzS1VrU0RNRGQz?=
 =?utf-8?B?Q0VNNWoxMDZScytqUThMRzF3ZVIrQzBkWXQ2Um5JT3o3T0NSalM0eVUyU2or?=
 =?utf-8?B?c1lQUWFjamo2NVpvamxYS2FMTmNpYTgzc242allpY0tQa0xiT2x2dkEzbEhn?=
 =?utf-8?B?T0JjL0x4eVB5b0N2Rm9GVk53WXFkL3FBWDU3R1NQTDJrS0FDZGRKUytna0JR?=
 =?utf-8?B?akhYN0pWR1VrRVdrR3ptbTZUNko3WCtSUVNOaVJvVUptNlZPQ1RvZGw1b2JE?=
 =?utf-8?B?eVo2Q3RENlFTeVVLN3Via3B4QTNMNnNJZmdvckUzcmRCMGYrdXduRWNudjQ0?=
 =?utf-8?B?dWE1b1Zza2hEcnhpMUJIMFpEL3NVWWNkTkFCSzU2aFoyVWNMam9XZkphUEhR?=
 =?utf-8?B?WEFZK1I0NmZhWU9GOFBIK0JQbmVYOHB2N2tnaEFDcTFMbGl6c1ovN1hjTG9q?=
 =?utf-8?B?LzlJejBCMlROaytwTnFIYWtLa2dxczg3dkJTbWV5KzU1VUtNbjJMOGVZL1Iw?=
 =?utf-8?B?N0NERVNBclFmMDQrNU4rT3VNdkdMMmY5R0JQNVhVajdwNm5zcFg2aU80MXRE?=
 =?utf-8?B?ekk4MUYwN3dMbWpyRVBJeWZkWDQ5UmU5c2tpMnZEMDJRUi9WWWt0ZGNVTnJW?=
 =?utf-8?B?aGEvaGw4SHBqdHY5OThMZE1kYlMxaXNidFc3Rzg3Y3c4aTVaR3JucGJkelFo?=
 =?utf-8?B?S2dSY0lGUHZOSTRwWXZGQkNOeUE0QjBaSjRRemZWU1Zialc1MXVOL3B2YnRu?=
 =?utf-8?B?bENzTVNrR29menFvM25zTVhOSHd2Q2NEQU1EYjNmYXZKamFkcEVId1NIZW53?=
 =?utf-8?B?SVlxaVVWbkR3YnVoTVFBOEorSFJwSGdyREtCTGpncHJOSDhobVE0L3pGZkYy?=
 =?utf-8?B?cEFpem81VXRuSzBNWGhxNjRsVTU1Z1JXNmNUK1d2NnR4RThOT3pzWk9kZElD?=
 =?utf-8?B?SGFDVThDYTVnSGVQTEptbzRzMDdwN25udUN6Ym0rUy9DRll0czQ3dFFMZTgw?=
 =?utf-8?B?MU9XQ3RCWXJETnZMbFQrdXhuRjhRS3lQbjJzeGRsNWRkZU13ZzN2bFgxWE9o?=
 =?utf-8?B?VmcwZVJjSVBPeWlRVVR6VlRsRVVzTmw2cVN0bTdhM1ZPSDdDc0V5TzJ0NlM2?=
 =?utf-8?B?WnhhcUFGR3AyVS9vbG84YUNMQTU4amJRYlRwbjVmTk9qMllrNEVuRGpkSlpT?=
 =?utf-8?B?cjhMRUVNbm9lcjFnWDhlSFV1dXNzV2JSQktqQmJGOGZkS1YwdDFJZmhxU0JD?=
 =?utf-8?B?Vy9tWXI4dkFUVDBGT1UxMUhXZlc1VkM0V0tYYWhiQy9PWnlsZjdjK1AvUU9P?=
 =?utf-8?B?bVg5enhkYkxJdUlHK2hsazllYzVZOHF2L3dYWVRlV3BaWVp1UlovMWZiZzBQ?=
 =?utf-8?B?dk5LNFpYZUN6NnFpRU9HQWk2WHMvTGlGT2lRMHpmKytrbEIxYzdXN0JpRnpZ?=
 =?utf-8?B?dUptTWcwZHJFMElDK0hVenMvYVNUYXl3clg5L3daRkVPakh3S2phRnUyY2pR?=
 =?utf-8?B?enZpNjlEZGhQQnJSVStQanZsSzZHMnhIa2FyeTZkc09aQjN5L1BlU1ZqREJQ?=
 =?utf-8?B?b2NJUHpORDljYmxqeFJaUGZkai9LbVVON2hvWEM5dDI0cXRmQVBNRFNnK0ov?=
 =?utf-8?B?RVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE9AFAD15C4FF9459C91B7E0F4598DE9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42130344-9c6c-49b7-7a30-08dd6866fe84
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 10:56:12.2465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KMjyZIk0LXzOB73uC6q8Y3dN32T4VOsNKCRgMVyGJ1Tc3CXTE35b6a5cVIeKPGHaQ0P/zHuUP7gGEwrRB15/aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR03MB10982

T24gMTcuMDMuMjUgMTc6MDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4wMy4yMDI1IDE0
OjM0LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9wY2kvcGNp
LmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9wY2kvcGNpLmMNCj4+IEBAIC0xNiw5ICsxNiwxOCBA
QA0KPj4gICAjaW5jbHVkZSA8eGVuL2RldmljZV90cmVlLmg+DQo+PiAgICNpbmNsdWRlIDx4ZW4v
ZXJybm8uaD4NCj4+ICAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+PiArI2luY2x1ZGUgPHhlbi9p
b21tdS5oPg0KPj4gICAjaW5jbHVkZSA8eGVuL3BhcmFtLmg+DQo+PiAgICNpbmNsdWRlIDx4ZW4v
cGNpLmg+DQo+PiAgIA0KPj4gK2Jvb2wgaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQoYm9vbCBk
b20wKQ0KPj4gK3sNCj4+ICsgICAgaWYgKCBkb20wICkNCj4+ICsgICAgICAgIHJldHVybiBwY2lf
cGFzc3Rocm91Z2hfZW5hYmxlZCB8fCBpb21tdV9lbmFibGVkOw0KPiANCj4gQXMgSSB0aGluayBJ
IHNhaWQgYmVmb3JlIC0gdGhlIGZ1bmN0aW9uJ3MgbmFtZSBub3cgbm8gbG9uZ2VyIGV4cHJlc3Nl
cw0KPiB3aGF0IGl0IHJlYWxseSBjaGVja3MuIFRoYXQgKGltbyBoZWF2aWx5KSBtaXNsZWFkaW5n
IGF0IHRoZSB1c2Ugc2l0ZXMNCj4gb2YgdGhpcyBmdW5jdGlvbi4NCg0KSSBhbSBhZnJhaWQgSSBk
b24ndCB1bmRlcnN0YW5kIHlvdXIgY29uY2Vybi4gSXQgc3RpbGwgY2hlY2tzIGlmIFBDSSANCnBh
c3N0aHJvdWdoIGlzIGVuYWJsZWQuIFdpdGgganVzdCB0aGUgY2hhbmdlIHRoYXQgQVJNIG5lZWRz
IHNvbWUgZXh0cmEgDQpsb2dpYyBmb3IgRG9tMCBQQ0kgdG8gd29yayBwcm9wZXJseS4gTWF5YmUg
Y2hhbmdlIHRoZSBwYXJhbWV0ZXIgbmFtZSB0byANCnNvbWV0aGluZyBsaWtlICJmb3JfcGNpX2h3
ZG9tIj8NCg0KPj4gKyAgICByZXR1cm4gcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQ7DQo+PiArfQ0K
PiANCj4gUGVyc29uYWxseSBJIGFsc28gdmlldyBpdCBhcyB1bmRlc2lyYWJsZSB0aGF0IHRoZSBn
bG9iYWwNCj4gcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQgaXMgZXZhbHVhdGVkIHR3aWNlIGluIHRo
aXMgZnVuY3Rpb24uIEJldHRlcg0KPiBtaWdodCBiZSBlLmcuDQo+IA0KPiBib29sIGlzX3BjaV9w
YXNzdGhyb3VnaF9lbmFibGVkKGJvb2wgZG9tMCkNCj4gew0KPiAgICAgIGlmICggcGNpX3Bhc3N0
aHJvdWdoX2VuYWJsZWQgKQ0KPiAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gDQo+ICAgICAgcmV0
dXJuIGRvbTAgJiYgaW9tbXVfZW5hYmxlZDsNCj4gfQ0KPiANCj4gWWV0IHRoZW4gSSdtIG5vdCBh
IG1haW50YWluZXIgb2YgdGhpcyBjb2RlLg0KPiANCg0KQWdyZWUsIHdpbGwgY2hhbmdlIGluIHRo
ZSBuZXh0IHZlcnNpb24uDQoNCj4+IEBAIC04NSw3ICs5NCw3IEBAIHN0YXRpYyBpbnQgX19pbml0
IHBjaV9pbml0KHZvaWQpDQo+PiAgICAgICAgKiBFbmFibGUgUENJIHBhc3N0aHJvdWdoIHdoZW4g
aGFzIGJlZW4gZW5hYmxlZCBleHBsaWNpdGx5DQo+PiAgICAgICAgKiAocGNpLXBhc3N0aHJvdWdo
PW9uKS4NCj4+ICAgICAgICAqLw0KPj4gLSAgICBpZiAoICFwY2lfcGFzc3Rocm91Z2hfZW5hYmxl
ZCApDQo+PiArICAgIGlmICggIWlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKHRydWUpICkNCj4g
DQo+IFRoZXJlJ3Mgbm8gRG9tMCBpbiBzaWdodCBhbnl3aGVyZSBoZXJlLCBpcyB0aGVyZT8gSG93
IGNhbiB5b3UgcGFzcyB0cnVlDQo+IGFzIGFyZ3VtZW50IGZvciB0aGUgImRvbTAiIHBhcmFtZXRl
cj8NCj4gDQoNClRoaXMgc2hvdWxkIGJlIHJlYWQgYXMgImlzIHBjaSBwYXNzdGhyb3VnaCBlbmFi
bGVkIGZvciBEb20wPyIgYW5kIGlmIGl0IA0KaXMgd2UgZGVmaW5pdGVseSBuZWVkIHRvIGRvIGEg
UENJIGluaXQuDQoNCkkndmUgYWxzbyBkb25lIHNvbWUgaW52ZXN0aWdhdGlvbnMgb24gcG9zc2li
bGUgd2F5cyB0byByZW1vdmUgdGhlIA0KRG9tMC9vdGhlciBkb21haW5zIGRpc3RpbmN0aW9uLCBi
dXQgSSdtIGFmcmFpZCB0aGlzIGlzIHRoZSBtb3N0IA0KcmVhc29uYWJsZSB3YXkgdG8gbWFrZSBQ
Q0kgZnVuY3Rpb25hbCBvbiBEb20wIHdpdGhvdXQgZXhwbGljaXRseSANCmVuYWJsaW5nIFBDSSBw
YXNzdGhyb3VnaC4NCg0KU01NVSBpcyBjb25maWd1cmVkIHRvIHRyaWdnZXIgYSBmYXVsdCBvbiBh
bGwgdHJhbnNhY3Rpb25zIGJ5IGRlZmF1bHQgYW5kIA0Kd2UgY2FuJ3Qgc3RhdGljYWxseSBtYXAg
UENJIGRldmljZXMgdG8gRG9tMCwgc28gdGhlIG9ubHkgb3RoZXIgd2F5IGlzIHRvIA0KcHV0IFBD
SSBpbiBmdWxsIHBhc3N0aHJvdWdoIG1vZGUsIHdoaWNoIEkgdGhpbmsgaXMgbm90IHNhZmUgZW5v
dWdoLg0KQW5kIHdlIGFsc28gY2FuJ3QgZHJvcCB0aGlzIHBhdGNoIGFzIGl0IHdhcyBkaXJlY3Rs
eSByZXF1ZXN0ZWQgYnkgSnVsaWVuIA0KaGVyZSBbMV0uDQoNCj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9wY2kuaA0KPj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Bj
aS5oDQo+PiBAQCAtNTAsNyArNTAsNyBAQCBleHRlcm4gaW50IHBjaV9tbWNmZ19jb25maWdfbnVt
Ow0KPj4gICBleHRlcm4gc3RydWN0IGFjcGlfbWNmZ19hbGxvY2F0aW9uICpwY2lfbW1jZmdfY29u
ZmlnOw0KPj4gICANCj4+ICAgLyogVW5saWtlIEFSTSwgUENJIHBhc3N0aHJvdWdoIGlzIGFsd2F5
cyBlbmFibGVkIGZvciB4ODYuICovDQo+PiAtc3RhdGljIGFsd2F5c19pbmxpbmUgYm9vbCBpc19w
Y2lfcGFzc3Rocm91Z2hfZW5hYmxlZCh2b2lkKQ0KPj4gK3N0YXRpYyBhbHdheXNfaW5saW5lIGJv
b2wgaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQoX19tYXliZV91bnVzZWQgYm9vbCBkb20wKQ0K
PiANCj4gRnVuY3Rpb24gcGFybWV0ZXJzIGRvbid0IG5lZWQgc3VjaCBhbm5vdGF0aW9uLg0KPiAN
Cg0KR290IGl0Lg0KDQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wY2kvcGh5c2Rldi5jDQo+PiArKysg
Yi94ZW4vZHJpdmVycy9wY2kvcGh5c2Rldi5jDQo+PiBAQCAtMTksNyArMTksNyBAQCByZXRfdCBw
Y2lfcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykN
Cj4+ICAgICAgICAgICBzdHJ1Y3QgcGNpX2Rldl9pbmZvIHBkZXZfaW5mbzsNCj4+ICAgICAgICAg
ICBub2RlaWRfdCBub2RlID0gTlVNQV9OT19OT0RFOw0KPj4gICANCj4+IC0gICAgICAgIGlmICgg
IWlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKCkgKQ0KPj4gKyAgICAgICAgaWYgKCAhaXNfcGNp
X3Bhc3N0aHJvdWdoX2VuYWJsZWQodHJ1ZSkgKQ0KPj4gICAgICAgICAgICAgICByZXR1cm4gLUVP
UE5PVFNVUFA7DQo+IA0KPiBTZWVpbmcgdGhlIGZ1bmN0aW9uJ3MgcGFyYW1ldGVyIG5hbWUsIGhv
dyBkbyB5b3Uga25vdyBpdCdzIERvbTAgY2FsbGluZw0KPiBoZXJlPw0KPiANCj4gSmFuDQoNCklz
IHRoaXMgYSBmdW5jdGlvbmFsIG9yIG5hbWluZyBjb25jZXJuPyBJZiBpdCBpcyBhYm91dCBuYW1p
bmcgdGhlbiBjYW4gDQppdCBhbHNvIGJlIHNvbHZlZCBieSByZW5hbWluZyB0aGUgcGFyYW1ldGVy
Pw0KDQpSZWdhcmRpbmcgZnVuY3Rpb25hbCBpc3N1ZXMsIEkgaGF2ZSBhc3N1bWVkIHRoYXQgb25s
eSBod2RvbSBjYW4gbWFrZSANCnBoeXNkZXYgb3BlcmF0aW9ucywgYnV0IGFmdGVyIGNoZWNraW5n
IGl0LCB0aGlzIGFzc3VtcHRpb24gc2VlbXMgdG8gYmUgDQpjb3JyZWN0IG9uIHg4NiBidXQgd3Jv
bmcgb24gQXJtLg0KSSBleHBlY3RlZCB0aGVyZSB3b3VsZCBiZSBhIGNoZWNrIGluIGRvX2FybV9w
aHlzZGV2X29wKCkgb3Igc29tZXdoZXJlIA0KbmVhciBpdCwgc2ltaWxhciB0byBob3cgaXQgaXMg
ZG9uZSBpbiB4ODYsIGJ1dCB0aGVyZSBhcmUgbm9uZS4gSSdtIG5vdCANCnN1cmUgaWYgaXQgaXMg
aW50ZW50aW9uYWwgb3IgYnkgbWlzdGFrZSwgSSB0aGluayBpdCBuZWVkcyBzb21lIA0KY2xhcmlm
aWNhdGlvbiBieSBBcm0gZm9sa3MuDQoNClsxXSANCmh0dHBzOi8vcGF0Y2hldy5vcmcvWGVuLzIw
MjMwNjA3MDMwMjIwLjIyNjk4LTEtc3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20vIzI3MzFiMDZk
LTRhNTQtZjUxYy0yMjg1LWVhMmNmMWZhYzNiYUB4ZW4ub3JnDQotLSANCk15a3l0YQ==

