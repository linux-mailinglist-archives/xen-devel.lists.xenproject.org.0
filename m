Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC266CBC484
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 03:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186624.1508066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUykP-0003lE-Eq; Mon, 15 Dec 2025 02:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186624.1508066; Mon, 15 Dec 2025 02:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUykP-0003j9-7y; Mon, 15 Dec 2025 02:55:41 +0000
Received: by outflank-mailman (input) for mailman id 1186624;
 Mon, 15 Dec 2025 02:55:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wHW=6V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vUykM-0003j3-RP
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 02:55:39 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8540231f-d961-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 03:55:32 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Mon, 15 Dec 2025 02:55:28 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 02:55:28 +0000
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
X-Inumbo-ID: 8540231f-d961-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/oUorB/KBFZUZDGoc7O0trP/EwvV+oyRn3NMsJwYAGEQXXHXQW8f1zNPJb3br8VlzEPcuLC4TpYAuV6rdB1Ta7l2qVDNkw3/bRUfnfp8bK1oduNsCONbTmomVpTzKzNtT3CvlVnz3FC9Gp5KL17QFeGIT2xRHzWMO1ZkH6+nA6ZoPAJq9boxioXnt9FAfuI88mUG0Gy6Bjgn177AiuHM8co6RddoMXL8AiaGB0tsFJJcqq1OMyjzutlCOp3Xb/UX/shwfUrenG952qeFRhMI4SYgiFSFrnqluQ5fq8zv4WI4GssRP/YxIyG76KwX5YZ38bBJQM6hlK+mSAE+bbJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aYH7xpLOjT2tSF/DsD4mrXbdt6UPreNAV6Bv98K7Q8=;
 b=BGMQDSsNwhZ72PtrXbfz5ruh6x+uSdon/bMsT56zJeXMmrmLTBlzzkZ7W2QgPuprjfLJzcn3wmdUFR7+HVF+kPBXA8cN5JwJdeSVCOz7Ed1qCzSyfsUkDd5IjrCJGMoR3evZQ821j2uCTwb31oc1asqWrs/SZRf8Uam9KMcdhIXYdv40UvPdkjbhRPbyyNM+5fZiGEGI/fPLylkO4Gs4qLeaKk/NDUB7gHsvnKuxbPCmb0dRiJwYZi9INi6+geilZjON0gaqhmPwzlzFz+20SjCQQvRq++XBAaKeKz7ytlTxsuSEztQQ1ufKNKgrfNa4nZI00bQRzOod/6738GHy/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aYH7xpLOjT2tSF/DsD4mrXbdt6UPreNAV6Bv98K7Q8=;
 b=Y1SI1MV93RCE9Ar94NUzAKmyQ7Pdyuw2vEkupLotGEQe6gF3/vyx5rAw3bdbRGPLo/gTFEZKLyUe2aK3aXNX6Fsst/ymrOK9du4U8HttXJuLsptJKPMyiyD58cWkkfCnVfXQQmXPInYYR3iDPWwy0UO8dqjMht0bml7ZlpJwDY4=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 08/24] xen/mem_sharing: make memory sharing depend on
 MGMT_HYPERCALLS
Thread-Topic: [PATCH v5 08/24] xen/mem_sharing: make memory sharing depend on
 MGMT_HYPERCALLS
Thread-Index: AQHcaxy9v3+S12G4xUGmXYJrOTKsybUdu3KAgAD6/oCAA0++kA==
Date: Mon, 15 Dec 2025 02:55:28 +0000
Message-ID:
 <DM4PR12MB845194CD0ED12B741E714A4DE1ADA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
 <20251212040209.1970553-9-Penny.Zheng@amd.com>
 <f55d729e-e25a-408e-91ae-355033eaedde@suse.com>
 <CABfawh=WGft2pF3tKGyevPY7i5tM7W6_of6RahrGvku6FRsreA@mail.gmail.com>
In-Reply-To:
 <CABfawh=WGft2pF3tKGyevPY7i5tM7W6_of6RahrGvku6FRsreA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-15T02:55:15.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|BY5PR12MB4179:EE_
x-ms-office365-filtering-correlation-id: f02dd58e-28ce-4118-bdf0-08de3b856745
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?c281NWZReXA1aUlueCtIcXJQQ1NaNEJIcDBNV0N2bVdoLzl3a3paVmRKcGZY?=
 =?utf-8?B?VWZNcUUvaWpoTEE1cmhSMEMxWis1WUFIWjhFNmtZWExsdW1GODl5S0Z1NWI1?=
 =?utf-8?B?eHZ1YXU4Ni9RWWZlQmtmUWxiaGhNS09SZEhycEQ2NWF5MnBPNmpsODVtV1Jw?=
 =?utf-8?B?alhjeXBMNTJpQ2RVUklPOUVaRDM3UEkxOFBBQndQQ2ZaR3FZSlFtSGhreTN3?=
 =?utf-8?B?NlBhTWxDSTRBcWxqekhXT2NuZnE1TVhYbk1FYU5JMnRJOUl1c2FHQlZOSlZW?=
 =?utf-8?B?SGtCQU0wQmlqSWl6OUFJRnh3WjBYRE4wOGtGTjNQSXVnamZZRXN5WlRzVkk4?=
 =?utf-8?B?Q0YzWjIxTnlOc2IwRG8rOWRkSCtNY21WMnpGMkxkU2x5MzhHdTZJc09WZnZM?=
 =?utf-8?B?U0RPc2FSam9kY3pKWEhqdU5NU1NCVFR6S0NhajRGMWxFcXdkS1lEczRpM2VJ?=
 =?utf-8?B?aGNVQmZoWFBWN2M3blRMcmdLQ2tPUFdQUWRsaDkvanpoaWFoZFQ5a2lEYmYr?=
 =?utf-8?B?UXZoM1ZYUTZRa3RLaTRlWHVmL1VFcm1zQTRxOHI5OThGT0w5OG1XWklCSjdu?=
 =?utf-8?B?TjlzN3crdGg5WG1RaHg2aEw1eU9FYms3SDhxTjl6clpBRDV2OThXZHk4eStz?=
 =?utf-8?B?TVhHcnpZc1hBZGFzNVpobWVYcHpSekJwMzZ4dzdDeFVJTnV5bERDM3RJSXla?=
 =?utf-8?B?WEZpejd6THJqdEtiVHRnVmVnaGZrQzlEQ0RzV2hUeFFtTlZVK0JRc0R5L2FF?=
 =?utf-8?B?TWd2UzBRS1NwallqUGtFdllqTEVNa3Q3STQvYVdYZmd4cW1PUlRtK3VzenZj?=
 =?utf-8?B?NTNkQS9wWnM2T0RUSFVOTElYaERTTHR1TmY0V2ZEU0dTUVdmaHR3T3RrU0JB?=
 =?utf-8?B?VGY0S3UyUUZ6L0ZyQkFsTGFQL2hCbnBVdWtzWGpMUzhObGFDKzA2YlNUNXJr?=
 =?utf-8?B?d0NTcGFmZ0dqeDduSTRra0JBV0tRUEpScXZGcEF6SG02bjgyd1BEd25MNVRm?=
 =?utf-8?B?Y0VzVW5oUlVEM2lxc09JZDRDS3VXQWtwOStHVzg5TUZHT3I0alNnQ0hDUWJH?=
 =?utf-8?B?NktEbkYyb2x3cjNoSTNoQmZBN1hPZmUySE5mTy9RVnlqck5kNUZON3J4NW9p?=
 =?utf-8?B?Y014K0QvdGd1ZnV1em5pZXJlU2hGSFpDTTJSOXBJYUlFcDhKczI0SkY5aVJD?=
 =?utf-8?B?ZnN5WTBSVkVpTlZjVUhUcEdmMk53SFVRYkczQ0ptR05wQlhtTDBwazZQdEx0?=
 =?utf-8?B?OWlrOWNZanJXUitMbEpRcEhTL01FU3FmL2hLZ1g2MWtOd2wyZVpNTjRqODVh?=
 =?utf-8?B?aGZPU2J4R0czTWRzZnAyL1krbk43cGtneEhleXhndVI3NERIYUxIenNUOXNB?=
 =?utf-8?B?Vnl3SW0vcTVwVk85aE92UDlqVGh1aDdVYjFyUmc0N1ViVzZ6TWkzaDM2K0R2?=
 =?utf-8?B?YWNmbFJCWkZab2ZFaVFiRyt2cHdoZFB2QzJCRWVmNVFKTVMyd3lGdmtaaTMy?=
 =?utf-8?B?YlJNRHloeUN3a3JRQUJxQTRIS2hFRHFZU2VEMVNpWE52blN5VlJxNUFSTlVC?=
 =?utf-8?B?Q3F6eU5vUHJLUy9UQ2JaUnNBNk9lSmgvdTRuRXJpWVhrTWpPVEZZUGxnNkJH?=
 =?utf-8?B?QXBKMy9jU2toRnRUUEQ2ZkdNZzBPNHFpSm5aa2llczBEanY2aDZaUXNHbHZB?=
 =?utf-8?B?dEY3V2h0SEVZdFlzTVhPTW5xUUNBMlY0OVZDK0U2RU53aFFVMGNsL1h4R3hP?=
 =?utf-8?B?Y0FFTHFRYTZpbjFseER5NVNaMklIaGFmdFRvR3orTzJsMGlWSXFubmd0SS96?=
 =?utf-8?B?dS8rZThUNUJ4MlUxUEFDNy9Db2hnbS9tUHgwc1VMLzV3a3dhbGxrSTgxOWcy?=
 =?utf-8?B?YlZ1Y0d5T0VrVlV5LzhPd3VNcndXbVVJUmxMQ0lEWXNzSk81aGI4WGVjbWU5?=
 =?utf-8?B?ODEreEt6bUpaUjdFTmxNcGZJdGN3eE9TVm9DRVJidjVZQmdPS09nRGhBWXB3?=
 =?utf-8?B?VzJQMzhXVDRRY3o4WENPMDZlTy91RWtBYzJzK1hGY2JnYnlQSnVMc1lVR0FH?=
 =?utf-8?Q?JpC9qv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TGlHc2ZjMmw0T1MzQTB4UHY2RjNqSWtUWSszSTdrTEduUXl2VHpXWngwL3dv?=
 =?utf-8?B?YkRxVTNRZEZpTFFxeGVMK0RZWHNISWs2MG5lUnRESkwrb1JZelY2RU9NdEov?=
 =?utf-8?B?empIeWdNUzRqd2NwdU1hWlpqV1ZwUjkrRmN1NlB5bENNcWk1aERBRGtpZjRx?=
 =?utf-8?B?cnlKK09Tb2N2NEhMQ1VnSUZZWGh0ZmtrZHUvYlczMm5qa3ZkcEFjVEhpeU0y?=
 =?utf-8?B?ZU9scTlpaGZZMzRMYnR5MGZOVWdhTWJNRER0R2MxSnAzdWJDVzZuWjE5ZHdK?=
 =?utf-8?B?V2tWc0J5RDNTY1VFSzVhb0NVbDNPamZVYWE4ZjFYcHFNdXVMMllKVkF0ZmFk?=
 =?utf-8?B?K3JPbFB1NmJUUU5WazcvYkl6R3NIRk0rUm8yRFhoMW05Y0U4VFQvSlkvWnFC?=
 =?utf-8?B?aVFZTjEyY1VwbDZod0xubFVGcDFYZEtFaE16ckMvczFBcVZsVHpzazQxdkJy?=
 =?utf-8?B?SVcrZk84a0hLc0pyY1JQVFcxR3pETmQ4L2cyeGZMSFgzekdTTzZBblZNY24w?=
 =?utf-8?B?T0ZvcElaRmpjbUJKUGs3cFNtY1c1MGRJbS9SMkNtQ3FySHpjc0dmL1RqSFpU?=
 =?utf-8?B?VmRjYVI5bVJCQ00ydDVXeUtDbDBzczk0Ykl4Skw0MG5yY0hBUEtJcEplVnBJ?=
 =?utf-8?B?VjkvSXl6L1FKek9URzdNYjg2KzFkZDBwd3BTRzU2OUFmUENDbHpoaXc0blRK?=
 =?utf-8?B?bmhJR3h2WTNvaHhQcURpVUZQdHZ5MUVNa09rc1pmNS9rRXVmUGp3MmVlZ3Ri?=
 =?utf-8?B?MlVYY2lPcmxLRk90bkxSSk1pVEt2azRDM3grWmxwSUl1Zk4wQm5aYlhoR21L?=
 =?utf-8?B?c0swY3p0cmdFWU9sc2hzS3JDaEZUVG5CNDBOSmRmaVlOcFltOUhzbzd2NXNV?=
 =?utf-8?B?TlkyRnRJbTJ1S042dHg2ZXEzcXNMRFNuMU00bDJrNm5VUzUvUG42RmYzamxr?=
 =?utf-8?B?RElEYTA5N3BZMEFjNnQ0MCtqc08yNnRlZG1pdENhb0dvZUl5N05kUXRDRHBO?=
 =?utf-8?B?b1Z1ZHRIOUpvNFZIMk52aXZtMjFkZEZnQlNwdnZtR1VjS0t6NHRiTUU4YTdX?=
 =?utf-8?B?K1cvQ1F3QXE0enQ0ZEdIRUFzbXVmTENXVmRIZDRmNTU4QlczNkZ1S0hNc1pV?=
 =?utf-8?B?T01YbnMwQnVmRmZHcWxYZG90bE9uelpBVVBmQ2gzdnIvSVVZWXFKN0N6aUR0?=
 =?utf-8?B?cjBJbXJPTmltWXZFbXJVSmNqeFNMRkg2L05wSnMrZDNLOHQ2cmxFK243Ky9S?=
 =?utf-8?B?cTJCUkR4V2JrVHIxN2JHZTdERVRTOGxlcW5DZHhVTnd5Z2FEMyswUFE1TjVm?=
 =?utf-8?B?NTU1VDV2eVBLS1dsLy8wd1NSK0crTTRVN3crcUJQNE9DMVBWTDFwMmx6VURZ?=
 =?utf-8?B?R3UwTnhTUTh1SUtiZEtUcEdkdHArT2VCbWNLc0RaT2hCTk1yOFU5THRYaDF3?=
 =?utf-8?B?bk41ODE3YkxEWTlBckJyMXdqbFkvSzM4ZXVLSzd5M2lqSDZTZEZmdTFBc0R3?=
 =?utf-8?B?ZXNrYzB6RkwwN0dWcituQUxEVE1sUGVSTUZNZm5VeGNPMGtFNlh4RW9DK2I2?=
 =?utf-8?B?bEJFTW4ybVBFdVpydU0yQXBDaUw4WFpuU2V3TGpiaHd3b29jMGh2bDFNam01?=
 =?utf-8?B?VFRWVXJOU1UvSmxUUEhVVnV1bnZqSmxwV3FOaXpTY1pVQWNhaVVWSDRYbFZD?=
 =?utf-8?B?ZmREQitFVHR0Ry9nekR0K0I0bFdzWFhHY21SUFdnYlQ2YVVOWFhvTXZBRU9v?=
 =?utf-8?B?UWNwRDVKTjNEZmtwcG9uREFtVm1NVlFpaWFXbUJXVFN0aDFDTThxQm5pbytn?=
 =?utf-8?B?UUo4UVdoM0lYNkdkNUNpTlBwbUh5U0pmclVwWG5iamk5VksyMGZUYlZ6WGgw?=
 =?utf-8?B?WWZZbUxaVUVlOWZ4MS9CWmdkMm9yY3VpVm5NbGdyMjB4UmJ4dUJmZzBHNWEv?=
 =?utf-8?B?OEFXSlVGTUJQalRLRTd3a242ZEpTWUx3WFM5ZGROejEwYlA1alBGNk5LZnpK?=
 =?utf-8?B?bDlSL0FqUGdmVFRqcXp2bDFudmRORGVzdmpyRFAzYVd3SE1pZTBqRU9WR1h3?=
 =?utf-8?B?TThodk1HZEdIcEpLT1dlVUN4OW9oeTVSNURaR1MzRXV0dEZCUnR2MUJadzhR?=
 =?utf-8?Q?E6FA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f02dd58e-28ce-4118-bdf0-08de3b856745
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 02:55:28.2209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZ+0nh1Nx5S5psP2YXlZ/X05UkoXWudDktC8y2Kw936LmEgnVrgYlxgrKIj1SzHEIqZEdh+zwiZNqdQVtRPAow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUYW1hcyBL
IExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+DQo+IFNlbnQ6IFNhdHVyZGF5LCBEZWNlbWJl
ciAxMywgMjAyNSA4OjIxIEFNDQo+IFRvOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IENjOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+OyBIdWFuZywgUmF5DQo+
IDxSYXkuSHVhbmdAYW1kLmNvbT47IGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tOyBBbmRyZXcg
Q29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMDgvMjRdIHhlbi9tZW1fc2hhcmluZzogbWFrZSBt
ZW1vcnkgc2hhcmluZyBkZXBlbmQNCj4gb24gTUdNVF9IWVBFUkNBTExTDQo+DQo+IE9uIEZyaSwg
RGVjIDEyLCAyMDI1IGF0IDQ6MjPigK9BTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
IHdyb3RlOg0KPiA+DQo+ID4gT24gMTIuMTIuMjAyNSAwNTowMSwgUGVubnkgWmhlbmcgd3JvdGU6
DQo+ID4gPiBUaGUgZW5hYmxpbmcgYml0IChkLT5hcmNoLmh2bS5tZW1fc2hhcmluZy5lbmFibGVk
KSBmb3IgbWVtb3J5DQo+ID4gPiBzaGFyaW5nIGNvdWxkIG9ubHkgYmUgZW5hYmxlZCB2aWEgZG9t
Y3RsLW9wLCBzbyB3ZSBzaGFsbCBtYWtlIG1lbW9yeQ0KPiA+ID4gc2hhcmluZyBmZWF0dXJlIGRl
cGVuZCBvbiBNR01UX0hZUEVSQ0FMTFMuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGVu
bnkgWmhlbmcgPFBlbm55LlpoZW5nQGFtZC5jb20+DQo+DQo+IEFja2VkLWJ5OiBUYW1hcyBLIExl
bmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+DQoNClRoeA0KDQo+DQo+ID4NCj4gPiBUYW1hcywN
Cj4gPg0KPiA+IHRoaXMgaXMgc29tZXRoaW5nIHRoYXQgcmF0aGVyIHlvdSBzaG91bGQgYWNrIChv
ciByZWplY3QpLiAoUGVubnksIHlvdQ0KPiA+IHdvdWxkIGhhdmUgd2FudGVkIHRvIENjIFRhbWFz
IGhlcmUgcmlnaHQgYXdheSwgbm8gbWF0dGVyIHdoYXQgRjoNCj4gPiBlbnRyaWVzIGluIC4vTUFJ
TlRBSU5FUlMgd291bGQgc2F5LikNCj4gPg0KPiA+IFRoYW5rcywgSmFuDQo+DQo+IFRoYW5rcywg
c2VlbXMgZmluZSB0byBtZS4NCj4NCj4gVGFtYXMNCg==

